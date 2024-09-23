@implementation HDSQLiteComparisonPredicate

+ (id)predicateWithProperty:(id)a3 equalToValue:(id)a4
{
  return (id)objc_msgSend(a1, "predicateWithProperty:value:comparisonType:", a3, a4, 1);
}

+ (id)predicateWithProperty:(id)a3 notEqualToValue:(id)a4
{
  return (id)objc_msgSend(a1, "predicateWithProperty:value:comparisonType:", a3, a4, 2);
}

+ (id)predicateWithProperty:(id)a3 greaterThanOrEqualToValue:(id)a4
{
  return (id)objc_msgSend(a1, "predicateWithProperty:value:comparisonType:", a3, a4, 6);
}

+ (id)predicateWithProperty:(id)a3 lessThanOrEqualToValue:(id)a4
{
  return (id)objc_msgSend(a1, "predicateWithProperty:value:comparisonType:", a3, a4, 4);
}

+ (id)predicateWithProperty:(id)a3 greaterThanValue:(id)a4
{
  return (id)objc_msgSend(a1, "predicateWithProperty:value:comparisonType:", a3, a4, 5);
}

+ (id)predicateWithProperty:(id)a3 lessThanValue:(id)a4
{
  return (id)objc_msgSend(a1, "predicateWithProperty:value:comparisonType:", a3, a4, 3);
}

+ (id)predicateWithProperty:(id)a3 likeValue:(id)a4
{
  return (id)objc_msgSend(a1, "predicateWithProperty:value:comparisonType:", a3, a4, 8);
}

+ (id)predicateWithProperty:(id)a3 likeValue:(id)a4 escapeCharacter:(id)a5
{
  id v7;
  id v8;
  id v9;
  _HDSQLiteComparisonPredicateLikeWithEscape *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[_HDSQLiteComparisonPredicateLikeWithEscape initWithProperty:value:escapeCharacter:]([_HDSQLiteComparisonPredicateLikeWithEscape alloc], "initWithProperty:value:escapeCharacter:", v9, v8, v7);

  return v10;
}

+ (id)predicateWithProperty:(id)a3 likePattern:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  _QWORD *v17;
  _QWORD v18[3];
  char v19;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  v8 = objc_msgSend(v6, "length");
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = ___StringEscapingGlobPatternsForLikePredicate_block_invoke;
  v15 = &unk_24CB18BD0;
  v17 = v18;
  v9 = v7;
  v16 = v9;
  objc_msgSend(v6, "enumerateSubstringsInRange:options:usingBlock:", 0, v8, 2, &v12);

  _Block_object_dispose(v18, 8);
  +[HDSQLiteComparisonPredicate predicateWithProperty:likeValue:escapeCharacter:](HDSQLiteComparisonPredicate, "predicateWithProperty:likeValue:escapeCharacter:", v5, v9, CFSTR("~"), v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)predicateWithProperty:(id)a3 beginsWithString:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a3;
  _StringEscapingSpecialCharactersForLikePredicate(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%%"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDSQLiteComparisonPredicate predicateWithProperty:likeValue:escapeCharacter:](HDSQLiteComparisonPredicate, "predicateWithProperty:likeValue:escapeCharacter:", v6, v8, CFSTR("~"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateWithProperty:(id)a3 endsWithString:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a3;
  _StringEscapingSpecialCharactersForLikePredicate(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%%%@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDSQLiteComparisonPredicate predicateWithProperty:likeValue:escapeCharacter:](HDSQLiteComparisonPredicate, "predicateWithProperty:likeValue:escapeCharacter:", v6, v8, CFSTR("~"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateWithProperty:(id)a3 containsString:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a3;
  _StringEscapingSpecialCharactersForLikePredicate(a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%%%@%%"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDSQLiteComparisonPredicate predicateWithProperty:likeValue:escapeCharacter:](HDSQLiteComparisonPredicate, "predicateWithProperty:likeValue:escapeCharacter:", v6, v8, CFSTR("~"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithProperty:value:comparisonType:", v8, v7, a5);

  return v9;
}

+ (id)predicateWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5 influenceIndexUsage:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;

  v6 = a6;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithProperty:value:comparisonType:influenceIndexUsage:", v10, v9, a5, v6);

  return v11;
}

+ (id)predicateWithProperty:(id)a3 ifNullValue:(id)a4 value:(id)a5 comparisonType:(int64_t)a6
{
  id v9;
  id v10;
  id v11;
  _HDSQLiteComparisonPredicateIfNull *v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[_HDSQLiteComparisonPredicateIfNull initWithProperty:ifPropertyIsNullValue:value:comparisonType:]([_HDSQLiteComparisonPredicateIfNull alloc], "initWithProperty:ifPropertyIsNullValue:value:comparisonType:", v11, v10, v9, a6);

  return v12;
}

+ (id)predicateWithCoalescedProperties:(id)a3 value:(id)a4 comparisonType:(int64_t)a5
{
  id v7;
  id v8;
  _HDSQLiteComparisonPredicateCoalesce *v9;

  v7 = a4;
  v8 = a3;
  v9 = -[_HDSQLiteComparisonPredicateCoalesce initWithProperties:value:comparisonType:]([_HDSQLiteComparisonPredicateCoalesce alloc], "initWithProperties:value:comparisonType:", v8, v7, a5);

  return v9;
}

+ (id)predicateWithProperty:(id)a3 comparisonType:(int64_t)a4 subqueryDescriptor:(id)a5 subqueryProperties:(id)a6
{
  id v9;
  id v10;
  id v11;
  _HDSQLiteComparisonPredicateSubquery *v12;

  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = -[_HDSQLiteComparisonPredicateSubquery initWithProperty:comparisonType:subqueryDescriptor:subqueryProperties:]([_HDSQLiteComparisonPredicateSubquery alloc], "initWithProperty:comparisonType:subqueryDescriptor:subqueryProperties:", v11, a4, v10, v9);

  return v12;
}

+ (id)predicateWithProperty:(id)a3 comparisonType:(int64_t)a4 otherProperty:(id)a5
{
  id v7;
  id v8;
  _HDSQLiteTwoPropertyComparisonPredicate *v9;

  v7 = a5;
  v8 = a3;
  v9 = -[_HDSQLiteTwoPropertyComparisonPredicate initWithProperty:comparisonType:otherProperty:]([_HDSQLiteTwoPropertyComparisonPredicate alloc], "initWithProperty:comparisonType:otherProperty:", v8, a4, v7);

  return v9;
}

- (HDSQLiteComparisonPredicate)initWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5
{
  return -[HDSQLiteComparisonPredicate initWithProperty:value:comparisonType:influenceIndexUsage:](self, "initWithProperty:value:comparisonType:influenceIndexUsage:", a3, a4, a5, 1);
}

- (HDSQLiteComparisonPredicate)initWithProperty:(id)a3 value:(id)a4 comparisonType:(int64_t)a5 influenceIndexUsage:(BOOL)a6
{
  id v10;
  id v11;
  HDSQLiteComparisonPredicate *v12;
  HDSQLiteComparisonPredicate *v13;
  uint64_t v14;
  NSString *property;
  NSObject *v16;
  NSObject *value;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v19.receiver = self;
  v19.super_class = (Class)HDSQLiteComparisonPredicate;
  v12 = -[HDSQLiteComparisonPredicate init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_comparisonType = a5;
    v14 = objc_msgSend(v10, "copy");
    property = v13->super._property;
    v13->super._property = (NSString *)v14;

    v13->_influenceIndexUsage = a6;
    if (objc_msgSend(v11, "conformsToProtocol:", &unk_254A90A00))
      v16 = objc_msgSend(v11, "copy");
    else
      v16 = v11;
    value = v13->_value;
    v13->_value = v16;

  }
  return v13;
}

- (void)bindToStatement:(sqlite3_stmt *)a3 bindingIndex:(int *)a4
{
  _BindValueToStatement(self->_value, a3, a4);
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->super._property, "hash");
  return -[NSObject hash](self->_value, "hash") ^ v3 ^ self->_influenceIndexUsage;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSObject *value;
  NSObject *v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDSQLiteComparisonPredicate;
  v7 = -[HDSQLitePropertyPredicate isEqual:](&v9, sel_isEqual_, v4)
    && self->_comparisonType == v4[2]
    && ((value = self->_value, v6 = v4[3], value == v6)
     || v6 && -[NSObject isEqual:](value, "isEqual:"))
    && self->_influenceIndexUsage == *((unsigned __int8 *)v4 + 32);

  return v7;
}

- (id)SQLForEntityClass:(Class)a3
{
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;

  -[HDSQLitePropertyPredicate property](self, "property");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class disambiguatedSQLForProperty:](a3, "disambiguatedSQLForProperty:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD17C8];
  if (self->_influenceIndexUsage)
    v8 = &stru_24CB19CC0;
  else
    v8 = CFSTR("+");
  -[HDSQLiteComparisonPredicate _comparisonTypeString]((uint64_t *)self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("(%@%@ %@ ?)"), v8, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (uint64_t)_comparisonTypeString
{
  if (a1)
  {
    HDSQLOperatorForComparisonType(a1[2]);
    a1 = (uint64_t *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (BOOL)isCompatibleWithPredicate:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HDSQLiteComparisonPredicate;
  if (-[HDSQLitePropertyPredicate isCompatibleWithPredicate:](&v7, sel_isCompatibleWithPredicate_, v4))
    v5 = self->_comparisonType == v4[2];
  else
    v5 = 0;

  return v5;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  NSString *property;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  if (self->_influenceIndexUsage)
    v4 = &stru_24CB19CC0;
  else
    v4 = CFSTR("+");
  property = self->super._property;
  -[HDSQLiteComparisonPredicate _comparisonTypeString]((uint64_t *)self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<\"%@%@\" %@ %@>"), v4, property, v6, self->_value);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)comparisonType
{
  return self->_comparisonType;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
