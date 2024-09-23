@implementation MPMediaCompoundPredicate

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MPMediaCompoundPredicate;
  v3 = -[MPMediaCompoundPredicate hash](&v5, sel_hash);
  return -[NSArray hash](self->_predicates, "hash") ^ v3;
}

- (id)_ML3PredicateForEntityTypeSelector:(SEL)a3
{
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  id *v6;
  void *v7;
  _QWORD v9[5];

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77__MPMediaCompoundPredicate_ML3Additions___ML3PredicateForEntityTypeSelector___block_invoke;
  v9[3] = &unk_1E31583E0;
  v9[4] = self;
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x19403A810](v9, a2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v7 = 0;
      goto LABEL_11;
    }
    ((void (**)(_QWORD, SEL))v4)[2](v4, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v6 = (id *)0x1E0D511E0;
      goto LABEL_7;
    }
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  ((void (**)(_QWORD, SEL))v4)[2](v4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
    goto LABEL_8;
  v6 = (id *)0x1E0D511D8;
LABEL_7:
  objc_msgSend(*v6, "predicateMatchingPredicates:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

LABEL_11:
  return v7;
}

id __77__MPMediaCompoundPredicate_ML3Additions___ML3PredicateForEntityTypeSelector___block_invoke(uint64_t a1, const char *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "predicates", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "valueForKey:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0C99E38], "null");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "isEqual:", v12);

          if ((v13 & 1) == 0)
            objc_msgSend(v4, "addObject:", v11);
        }

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v4;
}

- (NSArray)predicates
{
  return self->_predicates;
}

- (id)ML3PredicateForTrack
{
  return -[MPMediaCompoundPredicate _ML3PredicateForEntityTypeSelector:](self, "_ML3PredicateForEntityTypeSelector:", a2);
}

+ (id)predicateMatchingPredicates:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPredicates:", v3);

  return v4;
}

- (MPMediaCompoundPredicate)initWithPredicates:(id)a3
{
  id v4;
  MPMediaCompoundPredicate *v5;
  uint64_t v6;
  NSArray *predicates;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPMediaCompoundPredicate;
  v5 = -[MPMediaCompoundPredicate init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    predicates = v5->_predicates;
    v5->_predicates = (NSArray *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id *v4;
  char v5;
  objc_super v7;

  v4 = (id *)a3;
  v7.receiver = self;
  v7.super_class = (Class)MPMediaCompoundPredicate;
  if (-[MPMediaCompoundPredicate isEqual:](&v7, sel_isEqual_, v4))
    v5 = objc_msgSend(v4[1], "isEqual:", self->_predicates);
  else
    v5 = 0;

  return v5;
}

- (id)ML3PredicateForContainer
{
  return -[MPMediaCompoundPredicate _ML3PredicateForEntityTypeSelector:](self, "_ML3PredicateForEntityTypeSelector:", a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicates, 0);
}

- (MPMediaCompoundPredicate)initWithCoder:(id)a3
{
  id v4;
  MPMediaCompoundPredicate *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *predicates;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MPMediaCompoundPredicate;
  v5 = -[MPMediaCompoundPredicate init](&v20, sel_init);
  if (v5)
  {
    MSVPropertyListDataClasses();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setByAddingObject:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("MPPredicates"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      predicates = v8;
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](predicates, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v17;
LABEL_5:
        v13 = 0;
        while (1)
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(predicates);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
          if (v11 == ++v13)
          {
            v11 = -[NSArray countByEnumeratingWithState:objects:count:](predicates, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
            if (v11)
              goto LABEL_5;
            goto LABEL_11;
          }
        }
      }
      else
      {
LABEL_11:

        v14 = -[NSArray copy](predicates, "copy", v16);
        predicates = v5->_predicates;
        v5->_predicates = (NSArray *)v14;
      }

    }
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_predicates, CFSTR("MPPredicates"));
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p> %@"), objc_opt_class(), self, self->_predicates);
}

- (MPMediaCompoundPredicate)initWithProtobufferDecodableObject:(id)a3 library:(id)a4
{
  id v7;
  id v8;
  MPMediaCompoundPredicate *v9;
  void *v10;
  NSArray *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSArray *predicates;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MPMediaQuery.m"), 1660, CFSTR("Cannot decode object of type %@"), objc_opt_class());

  }
  v25.receiver = self;
  v25.super_class = (Class)MPMediaCompoundPredicate;
  v9 = -[MPMediaCompoundPredicate init](&v25, sel_init);
  if (v9)
  {
    objc_msgSend(v7, "compoundPredicate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v10, "predicatesCount"));
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v10, "predicates");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          MPPCreateMediaPredicateFromProtocolPredicateAndLibrary(*(void **)(*((_QWORD *)&v21 + 1) + 8 * v16), v8);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v11, "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v14);
    }

    predicates = v9->_predicates;
    v9->_predicates = v11;

  }
  return v9;
}

- (id)protobufferEncodableObjectFromLibrary:(id)a3
{
  id v4;
  MPPCompoundPredicate *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  MPPMediaPredicate *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MPPCompoundPredicate);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_predicates;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "protobufferEncodableObjectFromLibrary:", v4, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[MPPCompoundPredicate addPredicates:](v5, "addPredicates:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = objc_alloc_init(MPPMediaPredicate);
  -[MPPMediaPredicate setType:](v12, "setType:", 2);
  -[MPPMediaPredicate setCompoundPredicate:](v12, "setCompoundPredicate:", v5);

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
