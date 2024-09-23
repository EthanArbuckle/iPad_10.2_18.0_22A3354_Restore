@implementation NSCompoundPredicate

- (BOOL)evaluateWithObject:(id)a3 substitutionVariables:(id)a4
{
  void *v7;
  id *v8;
  objc_class *v9;
  id v10;
  NSArray *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!-[NSPredicate _allowsEvaluation](self, "_allowsEvaluation"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("This predicate has evaluation disabled"), 0));
  v7 = (void *)MEMORY[0x186DA8F78]();
  if (!a4 || (v8 = (id *)a4, object_getClass(a4) != (Class)_NSNestedDictionary))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = (objc_class *)objc_opt_class();
    v8 = (id *)&v14;
    object_setClass(&v14, v9);
    *(_QWORD *)&v15 = a4;
  }
  v10 = -[NSCompoundPredicate _predicateOperator](self, "_predicateOperator", v14, v15, v16, v17, v18, v19);
  v11 = -[NSCompoundPredicate subpredicates](self, "subpredicates");
  v12 = 0;
  if (v10 && v11)
    v12 = objc_msgSend(v10, "evaluatePredicates:withObject:substitutionVariables:", v11, a3, v8);
  if (v8 != a4)

  objc_autoreleasePoolPop(v7);
  return v12;
}

- (NSArray)subpredicates
{
  return self->_subpredicates;
}

+ (id)_operatorForType:(unint64_t)a3
{
  if (a3 == 2)
    return +[NSCompoundPredicateOperator orPredicateOperator](NSCompoundPredicateOperator, "orPredicateOperator");
  if (a3 == 1)
    return +[NSCompoundPredicateOperator andPredicateOperator](NSCompoundPredicateOperator, "andPredicateOperator");
  if (a3)
    return 0;
  return +[NSCompoundPredicateOperator notPredicateOperator](NSCompoundPredicateOperator, "notPredicateOperator");
}

- (id)_predicateOperator
{
  return (id)objc_msgSend((id)objc_opt_class(), "_operatorForType:", -[NSCompoundPredicate compoundPredicateType](self, "compoundPredicateType"));
}

- (NSCompoundPredicateType)compoundPredicateType
{
  return self->_type;
}

- (unint64_t)hash
{
  return -[NSArray hash](-[NSCompoundPredicate subpredicates](self, "subpredicates"), "hash");
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  self->_subpredicates = 0;
  v3.receiver = self;
  v3.super_class = (Class)NSCompoundPredicate;
  -[NSCompoundPredicate dealloc](&v3, sel_dealloc);
}

- (void)allowEvaluation
{
  NSArray *subpredicates;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  objc_super v8;
  _BYTE v9[128];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  subpredicates = self->_subpredicates;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](subpredicates, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(subpredicates);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "allowEvaluation");
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](subpredicates, "countByEnumeratingWithState:objects:count:", &v10, v9, 16);
    }
    while (v5);
  }
  v8.receiver = self;
  v8.super_class = (Class)NSCompoundPredicate;
  -[NSPredicate allowEvaluation](&v8, sel_allowEvaluation);
}

- (NSCompoundPredicate)initWithCoder:(NSCoder *)coder
{
  NSCompoundPredicate *v5;
  NSSet *v6;
  uint64_t v7;
  id v8;
  void *v9;
  NSArray *subpredicates;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!-[NSCoder allowsKeyedCoding](coder, "allowsKeyedCoding"))
  {

    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be decoded by non-keyed archivers"), 0));
  }
  v16.receiver = self;
  v16.super_class = (Class)NSCompoundPredicate;
  v5 = -[NSPredicate initWithCoder:](&v16, sel_initWithCoder_, coder);
  if (v5)
  {
    v6 = -[NSCoder allowedClasses](coder, "allowedClasses");
    v7 = -[NSSet count](v6, "count");
    if (v7)
    {
      v8 = (id)-[NSSet mutableCopy](v6, "mutableCopy");
      objc_msgSend(v8, "unionSet:", +[_NSPredicateUtilities _compoundPredicateClassesForSecureCoding](_NSPredicateUtilities, "_compoundPredicateClassesForSecureCoding"));
    }
    else
    {
      v8 = +[_NSPredicateUtilities _compoundPredicateClassesForSecureCoding](_NSPredicateUtilities, "_compoundPredicateClassesForSecureCoding");
    }
    v5->_type = -[NSCoder decodeIntegerForKey:](coder, "decodeIntegerForKey:", CFSTR("NSCompoundPredicateType"));
    v5->_subpredicates = (NSArray *)-[NSCoder decodeObjectOfClasses:forKey:](coder, "decodeObjectOfClasses:forKey:", v8, CFSTR("NSSubpredicates"));
    if ((_NSIsNSSet() & 1) != 0
      || (_NSIsNSArray() & 1) != 0
      || (_NSIsNSOrderedSet() & 1) != 0
      || (v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), CFSTR("Malformed set expression (bad subpredicatees)"), 0)) == 0)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      subpredicates = v5->_subpredicates;
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](subpredicates, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v19;
LABEL_12:
        v14 = 0;
        while (1)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(subpredicates);
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
          if (v12 == ++v14)
          {
            v12 = -[NSArray countByEnumeratingWithState:objects:count:](subpredicates, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
            if (v12)
              goto LABEL_12;
            goto LABEL_18;
          }
        }
        v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NSInvalidUnarchiveOperationException"), CFSTR("Malformed set expression (bad subpredicate)"), 0);
        if (v7)
          goto LABEL_20;
        goto LABEL_21;
      }
LABEL_18:
      v9 = 0;
    }
    if (v7)
LABEL_20:

LABEL_21:
    if (v9)
    {

      objc_exception_throw(v9);
    }
  }
  return v5;
}

- (void)acceptVisitor:(id)a3 flags:(unint64_t)a4
{
  void *v7;

  v7 = (void *)MEMORY[0x186DA8F78](self, a2);
  if ((a4 & 4) != 0)
  {
    objc_msgSend(a3, "visitPredicate:", self);
    -[NSCompoundPredicate _acceptSubpredicates:flags:](self, "_acceptSubpredicates:flags:", a3, a4);
  }
  else
  {
    -[NSCompoundPredicate _acceptSubpredicates:flags:](self, "_acceptSubpredicates:flags:", a3, a4);
    objc_msgSend(a3, "visitPredicate:", self);
  }
  objc_autoreleasePoolPop(v7);
}

- (void)_acceptSubpredicates:(id)a3 flags:(unint64_t)a4
{
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = -[NSCompoundPredicate subpredicates](self, "subpredicates");
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "acceptVisitor:flags:", a3, a4);
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    }
    while (v8);
  }
}

- (id)predicateFormat
{
  void *v3;
  uint64_t v4;
  NSArray *v5;
  uint64_t v6;
  NSCompoundPredicateType v7;
  NSCompoundPredicateType v8;
  __objc2_class *v9;
  __objc2_class *v10;
  __objc2_class *v11;
  __CFString *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSString *v19;
  NSString *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v25;
  void *v26;

  v3 = (void *)MEMORY[0x186DA8F78](self, a2);
  v4 = objc_msgSend(-[NSCompoundPredicate _predicateOperator](self, "_predicateOperator"), "description");
  v5 = -[NSCompoundPredicate subpredicates](self, "subpredicates");
  v6 = -[NSArray count](v5, "count");
  v7 = -[NSCompoundPredicate compoundPredicateType](self, "compoundPredicateType");
  v8 = v7;
  if (v6 == 1)
  {
    v10 = -[NSArray objectAtIndex:](v5, "objectAtIndex:", 0);
    v11 = v10;
    if (v8 == NSNotPredicateType)
    {
      v21 = -[NSCompoundPredicate _copySubpredicateDescription:](self, "_copySubpredicateDescription:", v10);
      v20 = -[NSString initWithFormat:]([NSString alloc], "initWithFormat:", CFSTR("%@ %@"), v4, v21);

      goto LABEL_18;
    }
    goto LABEL_14;
  }
  if (!v6)
  {
    if (v7 == NSAndPredicateType)
    {
      v9 = NSTruePredicate;
    }
    else
    {
      if (v7 == NSNotPredicateType)
      {
        objc_autoreleasePoolPop(v3);
        objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Can't have a NOT predicate with no subpredicate."), 0));
      }
      v9 = NSFalsePredicate;
    }
    v10 = -[__objc2_class defaultInstance](v9, "defaultInstance");
LABEL_14:
    v20 = (NSString *)(id)-[__objc2_class predicateFormat](v10, "predicateFormat", v11);
    goto LABEL_18;
  }
  v25 = v6 - 1;
  v12 = &stru_1E0F56070;
  v13 = v12;
  v14 = v6 - 2;
  v26 = v3;
  if (v6 == 2)
  {
    v19 = (NSString *)v12;
  }
  else
  {
    v15 = 0;
    do
    {
      v16 = -[NSArray objectAtIndex:](v5, "objectAtIndex:", v15);
      v17 = (void *)MEMORY[0x186DA8F78]();
      v18 = -[NSCompoundPredicate _copySubpredicateDescription:](self, "_copySubpredicateDescription:", v16);
      objc_autoreleasePoolPop(v17);
      v19 = -[NSString initWithFormat:]([NSString alloc], "initWithFormat:", CFSTR("%@%@ %@ "), v13, v18, v4);

      ++v15;
      v13 = v19;
    }
    while (v14 != v15);
  }
  v22 = -[NSCompoundPredicate _copySubpredicateDescription:](self, "_copySubpredicateDescription:", -[NSArray objectAtIndex:](v5, "objectAtIndex:", v14));
  v23 = -[NSCompoundPredicate _copySubpredicateDescription:](self, "_copySubpredicateDescription:", -[NSArray objectAtIndex:](v5, "objectAtIndex:", v25));
  v20 = -[NSString initWithFormat:]([NSString alloc], "initWithFormat:", CFSTR("%@%@ %@ %@"), v19, v22, v4, v23);

  v3 = v26;
LABEL_18:
  objc_autoreleasePoolPop(v3);
  return v20;
}

- (id)_copySubpredicateDescription:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[NSString initWithFormat:]([NSString alloc], "initWithFormat:", CFSTR("(%@)"), objc_msgSend(a3, "description"));
  else
    return (id)objc_msgSend(a3, "description");
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("NSPredicates and NSExpressions cannot be encoded by non-keyed archivers"), 0));
  v5.receiver = self;
  v5.super_class = (Class)NSCompoundPredicate;
  -[NSPredicate encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeObject:forKey:", -[NSCompoundPredicate subpredicates](self, "subpredicates"), CFSTR("NSSubpredicates"));
  objc_msgSend(a3, "encodeInteger:forKey:", -[NSCompoundPredicate compoundPredicateType](self, "compoundPredicateType"), CFSTR("NSCompoundPredicateType"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSCompoundPredicate)predicateWithSubstitutionVariables:(id)a3
{
  id v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSCompoundPredicate *v12;
  _BYTE v14[128];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!a3)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Cannot substitute a nil substitution dictionary."), 0));
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = (void *)MEMORY[0x186DA8F78]();
  v7 = -[NSCompoundPredicate subpredicates](self, "subpredicates");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11++), "predicateWithSubstitutionVariables:", a3));
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v14, 16);
    }
    while (v9);
  }
  objc_autoreleasePoolPop(v6);
  v12 = (NSCompoundPredicate *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:subpredicates:", -[NSCompoundPredicate compoundPredicateType](self, "compoundPredicateType"), v5);

  return v12;
}

+ (NSCompoundPredicate)notPredicateWithSubpredicate:(NSPredicate *)predicate
{
  id v4;

  v4 = objc_alloc((Class)a1);
  return (NSCompoundPredicate *)(id)objc_msgSend(v4, "initWithType:subpredicates:", 0, objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", predicate));
}

+ (NSCompoundPredicate)orPredicateWithSubpredicates:(NSArray *)subpredicates
{
  return (NSCompoundPredicate *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithType:subpredicates:", 2, subpredicates);
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSArray *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = -[NSCompoundPredicate subpredicates](self, "subpredicates", a3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "copy");
        objc_msgSend(v5, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
    }
    while (v7);
  }
  v11 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:subpredicates:", -[NSCompoundPredicate compoundPredicateType](self, "compoundPredicateType"), v5);

  return v11;
}

+ (NSCompoundPredicate)andPredicateWithSubpredicates:(NSArray *)subpredicates
{
  return (NSCompoundPredicate *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithType:subpredicates:", 1, subpredicates);
}

- (NSCompoundPredicate)initWithType:(NSCompoundPredicateType)type subpredicates:(NSArray *)subpredicates
{
  NSCompoundPredicate *v7;
  NSCompoundPredicate *v8;
  objc_super v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (type == NSNotPredicateType && (!subpredicates || !-[NSArray count](subpredicates, "count")))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Tried to construct NSCompoundPredicate for NSNotPredicateType with %@"), subpredicates), 0));
  v10.receiver = self;
  v10.super_class = (Class)NSCompoundPredicate;
  v7 = -[NSCompoundPredicate init](&v10, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = type;
    v7->_subpredicates = (NSArray *)-[NSArray copy](subpredicates, "copy");
  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  NSCompoundPredicateType v5;

  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[NSCompoundPredicate compoundPredicateType](self, "compoundPredicateType"),
        v5 == objc_msgSend(a3, "compoundPredicateType")))
  {
    return -[NSArray isEqual:](-[NSCompoundPredicate subpredicates](self, "subpredicates"), "isEqual:", objc_msgSend(a3, "subpredicates"));
  }
  else
  {
    return 0;
  }
}

- (id)generateMetadataDescription
{
  NSCompoundPredicateType v3;
  NSArray *v4;
  NSArray *v5;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  NSString *v20;
  uint64_t v21;
  _BYTE v22[128];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = -[NSCompoundPredicate compoundPredicateType](self, "compoundPredicateType");
  v4 = -[NSCompoundPredicate subpredicates](self, "subpredicates");
  v5 = v4;
  if (v3 == NSOrPredicateType)
  {
    if (-[NSArray count](v4, "count") <= 1)
    {
      v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSOrPredicateType NSCompoundPredicate with wrong number (%ld) of subpredicates given to NSMetadataQuery (%@)"), -[NSArray count](v5, "count"), self);
      goto LABEL_32;
    }
    v7 = (id)objc_opt_new();
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(v5);
          v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          if ((v10 & 1) != 0)
            objc_msgSend(v7, "appendString:", CFSTR(" || "));
          objc_msgSend(v7, "appendFormat:", CFSTR("(%@)"), objc_msgSend(v13, "generateMetadataDescription"));
          v10 = 1;
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v22, 16);
      }
      while (v9);
    }
  }
  else
  {
    if (v3 != NSAndPredicateType)
    {
      if (v3)
      {
        v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown type of NSCompoundPredicate given to NSMetadataQuery (%@)"), self, v21);
      }
      else
      {
        if (-[NSArray count](v4, "count") == 1)
          return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("! (%@)"), objc_msgSend(-[NSArray objectAtIndex:](v5, "objectAtIndex:", 0), "generateMetadataDescription"));
        v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSNotPredicateType NSCompoundPredicate with wrong number (%ld) of subpredicates given to NSMetadataQuery (%@)"), -[NSArray count](v5, "count"), self);
      }
LABEL_32:
      objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], v20, 0));
    }
    if (-[NSArray count](v4, "count") <= 1)
    {
      v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSAndPredicateType NSCompoundPredicate with wrong number (%ld) of subpredicates given to NSMetadataQuery (%@)"), -[NSArray count](v5, "count"), self);
      goto LABEL_32;
    }
    v7 = (id)objc_opt_new();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v14 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v5);
          v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * j);
          if ((v16 & 1) != 0)
            objc_msgSend(v7, "appendString:", CFSTR(" && "));
          objc_msgSend(v7, "appendFormat:", CFSTR("(%@)"), objc_msgSend(v19, "generateMetadataDescription"));
          v16 = 1;
        }
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v28, v27, 16);
      }
      while (v15);
    }
  }
  return +[NSString stringWithString:](NSString, "stringWithString:", v7);
}

@end
