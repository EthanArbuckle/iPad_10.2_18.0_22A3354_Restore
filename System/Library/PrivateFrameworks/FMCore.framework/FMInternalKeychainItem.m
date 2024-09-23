@implementation FMInternalKeychainItem

- (FMInternalKeychainItem)initWithResults:(id)a3
{
  id v4;
  FMInternalKeychainItem *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  id v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  FMInternalKeychainItem *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)FMInternalKeychainItem;
  v5 = -[FMInternalKeychainItem init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD69B0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_opt_new();
    v8 = objc_msgSend(v6, "isEqualToData:", v7);

    v9 = objc_msgSend(v6, "length");
    v10 = *MEMORY[0x1E0CD70D8];
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70D8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_opt_new();
    v13 = objc_msgSend(v11, "isEqualToData:", v12);

    v14 = objc_msgSend(v11, "length");
    if (v6 && (v8 & 1) == 0 && v9)
    {
      v15 = v6;
    }
    else
    {
      if (v11)
        v16 = v13;
      else
        v16 = 1;
      if ((v16 & 1) != 0
        || !v14
        || (objc_msgSend(v4, "objectForKeyedSubscript:", v10), (v15 = (id)objc_claimAutoreleasedReturnValue()) == 0))
      {

        v20 = 0;
        goto LABEL_15;
      }
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6990]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMInternalKeychainItem setCreationDate:](v5, "setCreationDate:", v17);

    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6A98]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[FMInternalKeychainItem setLastModifyDate:](v5, "setLastModifyDate:", v18);

    -[FMInternalKeychainItem setRawData:](v5, "setRawData:", v15);
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v15, 4);
    -[FMInternalKeychainItem setPassword:](v5, "setPassword:", v19);

  }
  v20 = v5;
LABEL_15:

  return v20;
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_storeStrong((id *)&self->_password, a3);
}

- (NSDate)lastModifyDate
{
  return self->_lastModifyDate;
}

- (void)setLastModifyDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastModifyDate, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSData)rawData
{
  return self->_rawData;
}

- (void)setRawData:(id)a3
{
  objc_storeStrong((id *)&self->_rawData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawData, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_lastModifyDate, 0);
  objc_storeStrong((id *)&self->_password, 0);
}

@end
