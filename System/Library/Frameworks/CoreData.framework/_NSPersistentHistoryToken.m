@implementation _NSPersistentHistoryToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)storeTokens
{
  return self->_storeTokens;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_storeTokens, CFSTR("NSPersistentHistoryTokenDictionary"));
}

- (void)dealloc
{
  objc_super v3;

  self->_storeTokens = 0;
  v3.receiver = self;
  v3.super_class = (Class)_NSPersistentHistoryToken;
  -[_NSPersistentHistoryToken dealloc](&v3, sel_dealloc);
}

- (_NSPersistentHistoryToken)initWithTransactionNumber:(id)a3 andStoreID:(id)a4
{
  _NSPersistentHistoryToken *v6;
  _NSPersistentHistoryToken *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_NSPersistentHistoryToken;
  v6 = -[_NSPersistentHistoryToken init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    if (a3 && a4)
    {
      v6->_storeTokens = (NSDictionary *)(id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a3, a4);
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<NSPersistentHistoryToken - %@>"), self->_storeTokens);
}

- (_NSPersistentHistoryToken)initWithCoder:(id)a3
{
  _NSPersistentHistoryToken *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSDictionary *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_NSPersistentHistoryToken;
  v4 = -[_NSPersistentHistoryToken init](&v10, sel_init);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0), CFSTR("NSPersistentHistoryTokenDictionary"));
    v4->_storeTokens = v8;
    if (!-[NSDictionary count](v8, "count"))
    {

      return 0;
    }
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return -[NSDictionary isEqual:](self->_storeTokens, "isEqual:", objc_msgSend(a3, "storeTokens"));
  else
    return 0;
}

- (_NSPersistentHistoryToken)initWithDictionary:(id)a3
{
  _NSPersistentHistoryToken *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_NSPersistentHistoryToken;
  v4 = -[_NSPersistentHistoryToken init](&v6, sel_init);
  if (v4)
  {
    if (objc_msgSend(a3, "count"))
    {
      v4->_storeTokens = (NSDictionary *)a3;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (int64_t)compare:(id)a3
{
  void *v3;
  NSString *v4;
  objc_class *v5;
  NSString *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = NSStringFromSelector(a2);
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ is not supported for %@, use %@"), v4, v6, NSStringFromSelector(sel_compareToken_error_)), 0);
  objc_exception_throw(v7);
}

- (int64_t)compareToken:(id)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;
  uint64_t v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  int v49;
  uint64_t v50;
  _QWORD v51[4];

  v51[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_msgSend((id)objc_msgSend(-[_NSPersistentHistoryToken storeTokens](self, "storeTokens"), "allKeys"), "sortedArrayUsingComparator:", &__block_literal_global_16);
  v8 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "storeTokens"), "allKeys"), "sortedArrayUsingComparator:", &__block_literal_global_11_0);
  v9 = objc_msgSend(v7, "count");
  if (v9 != objc_msgSend(v8, "count"))
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB28A8];
    v50 = *MEMORY[0x1E0CB2D68];
    v51[0] = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Tokens have different number of stores."));
    v20 = (void *)objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 134501, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1));
    if (v20)
      goto LABEL_17;
    v21 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v21, v22, v23, v24, v25, v26, v27, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentHistoryToken.m");
    v28 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      return 0;
    *(_DWORD *)buf = 136315394;
    v47 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentHistoryToken.m";
    v48 = 1024;
    v49 = 89;
    goto LABEL_27;
  }
  if ((objc_msgSend(v7, "isEqualToArray:", v8) & 1) == 0)
  {
    v29 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB28A8];
    v44 = *MEMORY[0x1E0CB2D68];
    v45 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Tokens have different set of stores."));
    v20 = (void *)objc_msgSend(v29, "errorWithDomain:code:userInfo:", v30, 134501, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1));
    if (v20)
    {
LABEL_17:
      if (a4)
      {
        v13 = 0;
        *a4 = v20;
        return v13;
      }
      return 0;
    }
    v31 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v31, v32, v33, v34, v35, v36, v37, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentHistoryToken.m");
    v28 = __pflogFaultLog;
    if (!os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
      return 0;
    *(_DWORD *)buf = 136315394;
    v47 = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSPersistentHistoryToken.m";
    v48 = 1024;
    v49 = 96;
LABEL_27:
    _os_log_fault_impl(&dword_18A253000, v28, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    return 0;
  }
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (!v10)
    return 3;
  v11 = v10;
  v12 = *(_QWORD *)v40;
  v13 = 3;
  while (2)
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v40 != v12)
        objc_enumerationMutation(v7);
      v15 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
      v16 = objc_msgSend((id)objc_msgSend(a3, "storeTokens"), "objectForKey:", v15);
      if (v16)
      {
        v17 = objc_msgSend(-[NSDictionary objectForKey:](self->_storeTokens, "objectForKey:", v15), "compare:", v16);
        if (v17)
        {
          if (v17 == 1)
            return 4;
          else
            return 2;
        }
      }
    }
    v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v11)
      continue;
    break;
  }
  return v13;
}

- (unint64_t)hash
{
  NSDictionary *storeTokens;
  id v4;
  _QWORD v6[5];
  objc_super v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (-[NSDictionary count](self->_storeTokens, "count"))
  {
    storeTokens = self->_storeTokens;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __33___NSPersistentHistoryToken_hash__block_invoke;
    v6[3] = &unk_1E1EDFE18;
    v6[4] = &v8;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](storeTokens, "enumerateKeysAndObjectsUsingBlock:", v6);
    v4 = (id)v9[3];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_NSPersistentHistoryToken;
    v4 = -[_NSPersistentHistoryToken hash](&v7, sel_hash);
    v9[3] = (uint64_t)v4;
  }
  _Block_object_dispose(&v8, 8);
  return (unint64_t)v4;
}

@end
