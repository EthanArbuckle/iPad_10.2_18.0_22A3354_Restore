@implementation TKTokenKeychainItem

- (TKTokenKeychainItem)initWithObjectID:(TKTokenObjectID)objectID
{
  TKTokenObjectID v5;
  TKTokenKeychainItem *v6;
  TKTokenKeychainItem *v7;
  objc_super v9;

  v5 = objectID;
  v9.receiver = self;
  v9.super_class = (Class)TKTokenKeychainItem;
  v6 = -[TKTokenKeychainItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong(&v6->_objectID, objectID);

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  objc_class *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  -[TKTokenKeychainItem objectID](self, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v4, "length") >= 0x21)
  {
    objc_msgSend(v4, "substringToIndex:", 32);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", CFSTR("..."));
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  -[TKTokenKeychainItem label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v7)
  {
    -[TKTokenKeychainItem label](self, "label");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %@ '%@'>"), v11, v4, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v8, "stringWithFormat:", CFSTR("<%@: %@>"), v10, v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (NSDictionary)operationMap
{
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("ord");
  v3[1] = CFSTR("osgn");
  v4[0] = &unk_1E7097798;
  v4[1] = &unk_1E70977B0;
  v3[2] = CFSTR("od");
  v3[3] = CFSTR("ock");
  v4[2] = &unk_1E70977C8;
  v4[3] = &unk_1E70977E0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (NSDictionary *)(id)objc_claimAutoreleasedReturnValue();
}

+ (id)accessControlForConstraints:(id)a3 tokenID:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)SecAccessControlCreate();
  if (v9)
  {
    v20 = CFSTR("tkid");
    objc_msgSend(v8, "stringRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (SecAccessControlSetProtection())
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "operationMap");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __65__TKTokenKeychainItem_accessControlForConstraints_tokenID_error___block_invoke;
      v17[3] = &unk_1E7089FF0;
      v18 = v7;
      v19 = v12;
      v14 = v12;
      objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v17);

      SecAccessControlSetConstraints();
      v15 = (void *)SecAccessControlCopyData();

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void __65__TKTokenKeychainItem_accessControlForConstraints_tokenID_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "isEqual:", MEMORY[0x1E0C9AAA0]) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v7);

}

- (void)setAccessControl:(id)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSDictionary *v23;
  NSDictionary *constraints;
  NSDictionary *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  NSDictionary *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_accessControl, a3);
  if (v5)
  {
    v33 = 0;
    v6 = (void *)SecAccessControlCreateFromData();
    if (v6)
    {
      SecAccessControlGetProtection();
      v7 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[NSObject objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", CFSTR("tkid"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[TKTokenKeychainItem tokenID](self, "tokenID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringRepresentation");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v8, "isEqual:", v10);

        if (v11)
        {
          SecAccessControlGetConstraints();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v27 = v7;
            v28 = v6;
            v13 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
            v29 = 0u;
            v30 = 0u;
            v31 = 0u;
            v32 = 0u;
            v26 = v12;
            v14 = v12;
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v30;
              do
              {
                for (i = 0; i != v16; ++i)
                {
                  if (*(_QWORD *)v30 != v17)
                    objc_enumerationMutation(v14);
                  v19 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
                  objc_msgSend((id)objc_opt_class(), "operationMap");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "objectForKeyedSubscript:", v19);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v21)
                  {
                    objc_msgSend(v14, "objectForKeyedSubscript:", v19);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v13, "setObject:forKeyedSubscript:", v22, v21);

                  }
                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
              }
              while (v16);
            }

            v23 = (NSDictionary *)objc_msgSend(v13, "copy");
            constraints = self->_constraints;
            self->_constraints = v23;

            v7 = v27;
            v6 = v28;
            v12 = v26;
          }

        }
      }
    }
    else
    {
      TK_LOG_token_2();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[TKTokenKeychainItem setAccessControl:].cold.1((uint64_t *)&v33, (uint64_t)v5, v7);
    }

    v25 = v33;
  }
  else
  {
    v25 = self->_constraints;
    self->_constraints = (NSDictionary *)MEMORY[0x1E0C9AA70];
  }

}

- (NSData)accessControl
{
  NSData *accessControl;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSData *v8;
  NSData *v9;

  accessControl = self->_accessControl;
  if (!accessControl)
  {
    -[TKTokenKeychainItem constraints](self, "constraints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[TKTokenKeychainItem tokenID](self, "tokenID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        v6 = (void *)objc_opt_class();
        -[TKTokenKeychainItem tokenID](self, "tokenID");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "accessControlForConstraints:tokenID:error:", v4, v7, 0);
        v8 = (NSData *)objc_claimAutoreleasedReturnValue();
        v9 = self->_accessControl;
        self->_accessControl = v8;

      }
    }

    accessControl = self->_accessControl;
  }
  return accessControl;
}

- (NSMutableDictionary)keychainAttributes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E08];
  v14[0] = *MEMORY[0x1E0CD6B98];
  -[TKTokenKeychainItem tokenID](self, "tokenID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v5;
  v14[1] = *MEMORY[0x1E0CD6BB8];
  -[TKTokenKeychainItem encodedObjectID](self, "encodedObjectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = *MEMORY[0x1E0CD68A0];
  v7 = *MEMORY[0x1E0CD68C0];
  v15[1] = v6;
  v15[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryWithDictionary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[TKTokenKeychainItem label](self, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TKTokenKeychainItem label](self, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0CD6A90]);

  }
  -[TKTokenKeychainItem accessControl](self, "accessControl");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CD6890]);

  return (NSMutableDictionary *)v9;
}

- (TKTokenKeychainItem)initWithItemInfo:(id)a3
{
  id v4;
  TKTokenID *v5;
  uint64_t v6;
  void *v7;
  TKTokenID *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  TKTokenKeychainItem *v13;
  TKTokenKeychainItem *v14;
  void *v15;
  void *v16;
  TKTokenKeychainItem *v17;
  NSObject *v18;
  void *v20;
  objc_super v21;
  id v22;
  char v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [TKTokenID alloc];
  v6 = *MEMORY[0x1E0CD6B98];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6B98]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[TKTokenID initWithTokenID:](v5, "initWithTokenID:", v7);

  if (v8)
  {
    v23 = 0;
    v9 = *MEMORY[0x1E0CD6BB8];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6BB8]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    -[TKTokenID decodedObjectID:isCertificate:error:](v8, "decodedObjectID:isCertificate:error:", v10, &v23, &v22);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v22;

    if (v11)
    {
      v21.receiver = self;
      v21.super_class = (Class)TKTokenKeychainItem;
      v13 = -[TKTokenKeychainItem init](&v21, sel_init);
      v14 = v13;
      if (v13)
      {
        objc_storeStrong(&v13->_objectID, v11);
        -[TKTokenKeychainItem setTokenID:](v14, "setTokenID:", v8);
        objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6A90]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[TKTokenKeychainItem setLabel:](v14, "setLabel:", v15);

        objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6890]);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[TKTokenKeychainItem setAccessControl:](v14, "setAccessControl:", v16);

      }
      self = v14;
      v17 = self;
    }
    else
    {
      TK_LOG_token_2();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v20;
        v26 = 2114;
        v27 = v12;
        _os_log_error_impl(&dword_1B9768000, v18, OS_LOG_TYPE_ERROR, "Failed to recreate TKTokenKeychainItem from attributes: invalid kSecAttrTokenOID: %{public}@, error:%{public}@", buf, 0x16u);

      }
      v17 = 0;
    }

  }
  else
  {
    TK_LOG_token_2();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[TKTokenKeychainItem initWithItemInfo:].cold.1(v4, v6, v12);
    v17 = 0;
  }

  return v17;
}

+ (TKTokenKeychainItem)keychainItemWithInfo:(id)a3
{
  id v3;
  void *v4;
  __objc2_class **v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6C98]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0CD6CA0]) & 1) != 0)
  {
    v5 = off_1E7088350;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqual:", *MEMORY[0x1E0CD6CC0]))
    {
      v6 = 0;
      goto LABEL_7;
    }
    v5 = off_1E7088368;
  }
  v6 = (void *)objc_msgSend(objc_alloc(*v5), "initWithItemInfo:", v3);
LABEL_7:

  return (TKTokenKeychainItem *)v6;
}

- (TKTokenObjectID)objectID
{
  return objc_getProperty(self, a2, 16, 1);
}

- (NSString)label
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLabel:(NSString *)label
{
  objc_setProperty_atomic_copy(self, a2, label, 24);
}

- (NSDictionary)constraints
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setConstraints:(NSDictionary *)constraints
{
  objc_setProperty_atomic_copy(self, a2, constraints, 32);
}

- (TKTokenID)tokenID
{
  return (TKTokenID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTokenID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenID, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_objectID, 0);
  objc_storeStrong((id *)&self->_accessControl, 0);
}

- (void)setAccessControl:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138543618;
  v5 = v3;
  v6 = 2114;
  v7 = a2;
  _os_log_error_impl(&dword_1B9768000, log, OS_LOG_TYPE_ERROR, "TKTokenKeychainItem got invalid accessControl, error:%{public}@ data:%{public}@", (uint8_t *)&v4, 0x16u);
}

- (void)initWithItemInfo:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "objectForKeyedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1B9768000, a3, OS_LOG_TYPE_ERROR, "Failed to recreate TKTokenKeychainItem from attributes: invalid kSecAttrTokenID: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
