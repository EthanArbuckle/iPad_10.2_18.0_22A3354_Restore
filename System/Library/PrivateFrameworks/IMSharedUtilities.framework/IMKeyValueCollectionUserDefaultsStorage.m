@implementation IMKeyValueCollectionUserDefaultsStorage

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  -[IMKeyValueCollectionUserDefaultsStorage _actuallyReadObjectForKey:](self, "_actuallyReadObjectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[IMKeyValueCollectionUserDefaultsStorage _decodeData:forKey:](self, "_decodeData:forKey:", v5, v4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v5;
  }
  v7 = v6;

  return v7;
}

- (id)_actuallyReadObjectForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IMKeyValueCollectionUserDefaultsStorage domain](self, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IMGetCachedDomainValueForKey();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)domain
{
  return self->_domain;
}

- (IMKeyValueCollectionUserDefaultsStorage)init
{
  -[IMKeyValueCollectionUserDefaultsStorage doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", 0);

  return 0;
}

- (IMKeyValueCollectionUserDefaultsStorage)initWithDomain:(id)a3
{
  id v4;
  IMKeyValueCollectionUserDefaultsStorage *v5;
  uint64_t v6;
  NSString *domain;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMKeyValueCollectionUserDefaultsStorage;
  v5 = -[IMKeyValueCollectionUserDefaultsStorage init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    domain = v5->_domain;
    v5->_domain = (NSString *)v6;

  }
  return v5;
}

- (id)_decodeData:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSString *v10;
  id v11;
  void *v12;
  NSString *v13;
  NSObject *v14;
  Class v15;
  void *v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  char v23;
  id v25;
  id v26;
  uint8_t buf[4];
  NSString *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  objc_msgSend(v7, "stringByAppendingString:", CFSTR("_class"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMKeyValueCollectionUserDefaultsStorage _actuallyReadObjectForKey:](self, "_actuallyReadObjectForKey:", v9);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();

  v11 = v8;
  if (!v10)
  {
LABEL_29:
    v11 = v11;
    v21 = v11;
    goto LABEL_31;
  }
  v26 = 0;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v8, &v26);
  v13 = (NSString *)v26;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "_enableStrictSecureDecodingMode");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "strict-decoding 025 _enableStrictSecureDecodingMode called", buf, 2u);
      }

    }
  }
  v15 = NSClassFromString(v10);
  if (v15)
  {
    -[IMKeyValueCollectionUserDefaultsStorage setWithMutableClassIfApplicableFor:](self, "setWithMutableClassIfApplicableFor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x1E0CB2CD0];
    v25 = 0;
    objc_msgSend(v12, "decodeTopLevelObjectOfClasses:forKey:error:", v16, v17, &v25);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v18 = v25;

    if (v13)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v28 = v13;
          _os_log_impl(&dword_19E239000, v19, OS_LOG_TYPE_INFO, "Failed to unarchive data. Error: %@", buf, 0xCu);
        }
LABEL_26:

      }
    }
    else
    {
      if (!v18)
      {
        v23 = 1;
LABEL_28:

        if ((v23 & 1) == 0)
        {
          v21 = 0;
          goto LABEL_31;
        }
        goto LABEL_29;
      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v28 = v10;
          v29 = 2112;
          v30 = v7;
          v31 = 2112;
          v32 = v18;
          _os_log_impl(&dword_19E239000, v22, OS_LOG_TYPE_INFO, "decodeTopLevelObjectOfClasses object of type: %@ for key %@ failed with error: %@", buf, 0x20u);
        }

      }
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19E239000, v19, OS_LOG_TYPE_INFO, "strict-decoding 025 _enableStrictSecureDecodingMode called", buf, 2u);
        }
        goto LABEL_26;
      }
    }
    v23 = 0;
    goto LABEL_28;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v10;
      v29 = 2112;
      v30 = v7;
      _os_log_impl(&dword_19E239000, v20, OS_LOG_TYPE_INFO, "Failed to inflate class of type: %@ for key %@", buf, 0x16u);
    }

  }
  v21 = 0;
  v11 = v8;
LABEL_31:

  return v21;
}

- (void)_actuallyWriteObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[IMKeyValueCollectionUserDefaultsStorage domain](self, "domain");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  IMSetDomainValueForKey();

}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  int v9;
  void *v10;
  IMKeyValueCollectionUserDefaultsStorage *v11;
  void *v12;
  id v13;
  objc_class *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  v7 = v17;
  v8 = v6;
  if (!v17 || (v9 = objc_msgSend(v17, "isArchivable_im"), v7 = v17, v9))
  {
    -[IMKeyValueCollectionUserDefaultsStorage _actuallyWriteObject:forKey:](self, "_actuallyWriteObject:forKey:", v7, v8);
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("_class"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = self;
    v12 = 0;
    v13 = v10;
LABEL_6:
    -[IMKeyValueCollectionUserDefaultsStorage _actuallyWriteObject:forKey:](v11, "_actuallyWriteObject:forKey:", v12, v13);
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("_class"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMKeyValueCollectionUserDefaultsStorage _actuallyWriteObject:forKey:](self, "_actuallyWriteObject:forKey:", v15, v16);

    v11 = self;
    v12 = v10;
    v13 = v8;
    goto LABEL_6;
  }
LABEL_7:

}

- (void)removeObjectForKey:(id)a3
{
  -[IMKeyValueCollectionUserDefaultsStorage setObject:forKey:](self, "setObject:forKey:", 0, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3;

  v3 = objc_alloc((Class)objc_opt_class());
  return (id)MEMORY[0x1E0DE7D20](v3, sel_initWithDomain_);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)IMKeyValueCollectionUserDefaultsStorage;
  -[IMKeyValueCollectionUserDefaultsStorage description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ domain:%@]"), v4, self->_domain);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (id)setWithMutableClassIfApplicableFor:(Class)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  Class v7;
  char isKindOfClass;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = (void *)MEMORY[0x1E0C99E60];
    v5 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = 0;
    v6 = v4;
    v7 = (Class)v5;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v10 = (void *)MEMORY[0x1E0C99E60];
    if ((isKindOfClass & 1) != 0)
    {
      a3 = (Class)objc_opt_class();
      v11 = objc_opt_class();
      v12 = 0;
    }
    else
    {
      v11 = 0;
    }
    v6 = v10;
    v7 = a3;
  }
  objc_msgSend(v6, "setWithObjects:", v7, v11, v12);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domain, 0);
}

@end
