@implementation ABSPersonFetchRequest

- (ABSPersonFetchRequest)initWithPredicate:(id)a3 additionalKeysToFetch:(id)a4 sortOrder:(unsigned int)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  ABSPersonFetchRequest *v26;
  uint64_t v27;
  NSPredicate *predicate;
  uint64_t v29;
  NSArray *additionalKeysToFetch;
  ABSPersonFetchRequest *v31;
  objc_super v33;

  v8 = a3;
  v9 = a4;
  if (v8)
    goto LABEL_5;
  if (CNGuardOSLog_cn_once_token_0 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0, &__block_literal_global_9);
  v10 = CNGuardOSLog_cn_once_object_0;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0, OS_LOG_TYPE_FAULT))
  {
    -[ABSPersonFetchRequest initWithPredicate:additionalKeysToFetch:sortOrder:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);
    if (v9)
      goto LABEL_10;
  }
  else
  {
LABEL_5:
    if (v9)
      goto LABEL_10;
  }
  if (CNGuardOSLog_cn_once_token_0 != -1)
    dispatch_once(&CNGuardOSLog_cn_once_token_0, &__block_literal_global_9);
  v18 = CNGuardOSLog_cn_once_object_0;
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0, OS_LOG_TYPE_FAULT))
    -[ABSPersonFetchRequest initWithPredicate:additionalKeysToFetch:sortOrder:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
LABEL_10:
  v33.receiver = self;
  v33.super_class = (Class)ABSPersonFetchRequest;
  v26 = -[ABSPersonFetchRequest init](&v33, sel_init);
  if (v26)
  {
    v27 = objc_msgSend(v8, "copy");
    predicate = v26->_predicate;
    v26->_predicate = (NSPredicate *)v27;

    v29 = objc_msgSend(v9, "copy");
    additionalKeysToFetch = v26->_additionalKeysToFetch;
    v26->_additionalKeysToFetch = (NSArray *)v29;

    v26->_sortOrder = a5;
    v31 = v26;
  }

  return v26;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x24BE19248], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("predicate"), self->_predicate);
  -[ABSPersonFetchRequest descriptionOfSortOrder](self, "descriptionOfSortOrder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("sortOrder"), v5);

  -[ABSPersonFetchRequest descriptionOfKeysToFetch](self, "descriptionOfKeysToFetch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("additionalKeysToFetch"), v7);

  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)descriptionOfSortOrder
{
  uint64_t sortOrder;

  sortOrder = self->_sortOrder;
  if (!(_DWORD)sortOrder)
    return CFSTR("by given name");
  if ((_DWORD)sortOrder == 1)
    return CFSTR("by family name");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unknown (%d)"), sortOrder);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)descriptionOfKeysToFetch
{
  return -[NSArray componentsJoinedByString:](self->_additionalKeysToFetch, "componentsJoinedByString:", CFSTR(","));
}

- (BOOL)isEqual:(id)a3
{
  ABSPersonFetchRequest *v4;
  NSArray *additionalKeysToFetch;
  NSPredicate *predicate;
  BOOL v7;

  v4 = (ABSPersonFetchRequest *)a3;
  v7 = 1;
  if (self != v4)
  {
    if ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      || self->_sortOrder != v4->_sortOrder
      || (additionalKeysToFetch = self->_additionalKeysToFetch,
          (unint64_t)additionalKeysToFetch | (unint64_t)v4->_additionalKeysToFetch)
      && !-[NSArray isEqual:](additionalKeysToFetch, "isEqual:")
      || (predicate = self->_predicate, (unint64_t)predicate | (unint64_t)v4->_predicate)
      && !-[NSPredicate isEqual:](predicate, "isEqual:"))
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(MEMORY[0x24BE19288], "objectHash:", self->_predicate);
  v4 = objc_msgSend(MEMORY[0x24BE19288], "arrayHash:", self->_additionalKeysToFetch);
  return self->_sortOrder - (v4 - v3 + 32 * v3) + 32 * (v4 - v3 + 32 * v3) + 506447;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ABSPersonFetchRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  ABSPersonFetchRequest *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("predicate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("additionalKeysToFetch"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("sortOrder"));
  v11 = -[ABSPersonFetchRequest initWithPredicate:additionalKeysToFetch:sortOrder:](self, "initWithPredicate:additionalKeysToFetch:sortOrder:", v5, v9, v10);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  NSPredicate *predicate;
  id v5;

  predicate = self->_predicate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", predicate, CFSTR("predicate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_additionalKeysToFetch, CFSTR("additionalKeysToFetch"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_sortOrder, CFSTR("sortOrder"));

}

- (NSPredicate)predicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)additionalKeysToFetch
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (unsigned)sortOrder
{
  return self->_sortOrder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalKeysToFetch, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
}

- (void)initWithPredicate:(uint64_t)a3 additionalKeysToFetch:(uint64_t)a4 sortOrder:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20A301000, a1, a3, "parameter ‘additionalKeysToFetch’ must be nonnull", a5, a6, a7, a8, 0);
}

- (void)initWithPredicate:(uint64_t)a3 additionalKeysToFetch:(uint64_t)a4 sortOrder:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20A301000, a1, a3, "parameter ‘predicate’ must be nonnull", a5, a6, a7, a8, 0);
}

@end
