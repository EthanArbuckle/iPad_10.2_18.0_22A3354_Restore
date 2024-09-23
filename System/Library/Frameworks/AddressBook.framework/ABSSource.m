@implementation ABSSource

+ (void)initialize
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___ABSSource;
  objc_msgSendSuper2(&v2, sel_initialize);
  +[ABSAddressBook ABInitialize](ABSAddressBook, "ABInitialize");
}

- (ABSSource)initWithMutableContainer:(id)a3
{
  id v4;
  ABSSource *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ABSSource;
  v5 = -[ABSSource init](&v7, sel_init);
  if (v5)
  {
    if (!v4)
      v4 = objc_alloc_init(MEMORY[0x24BDBAD60]);
    objc_storeStrong((id *)&v5->_cnImpl, v4);
  }

  return v5;
}

- (int)id
{
  void *v3;
  int v4;

  -[ABSSource cnImpl](self, "cnImpl");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "iOSLegacyIdentifier");

  if (self->_cnImpl)
    return v4;
  else
    return -1;
}

- (CNMutableContainer)cnImpl
{
  void *v3;
  id v4;

  if (!self->_cnImpl && -[ABSSource revertedRecordID](self, "revertedRecordID") != -1)
  {
    -[ABSSource addressBook](self, "addressBook");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v3, "sourceWithRecordID:", -[ABSSource revertedRecordID](self, "revertedRecordID"));

  }
  return self->_cnImpl;
}

- (NSString)CNIdentifierString
{
  void *v2;
  void *v3;

  -[ABSSource cnImpl](self, "cnImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unsigned)type
{
  return 2;
}

- (NSString)compositeName
{
  void *v2;
  void *v3;

  -[ABSSource cnImpl](self, "cnImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)getAccount
{
  return 0;
}

- (ABSSource)source
{
  ABSSource **p_source;
  id WeakRetained;
  void *v5;
  void *v6;

  p_source = &self->_source;
  WeakRetained = objc_loadWeakRetained((id *)&self->_source);

  if (!WeakRetained)
  {
    -[ABSSource addressBook](self, "addressBook");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sourceForRecord:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)p_source, v6);

  }
  return (ABSSource *)objc_loadWeakRetained((id *)p_source);
}

- (void)copyValueForProperty:(int)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (a3)
  {
    if (a3 == 2)
    {
      -[ABSSource cnImpl](self, "cnImpl");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "type");

      +[ABSConstantsMapping CNToABSourceTypeConstantsMapping](ABSConstantsMapping, "CNToABSourceTypeConstantsMapping");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "mappedConstant:", v7);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v3
        || (objc_msgSend(MEMORY[0x24BDBCEF8], "null"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v8,
            v3 == v8))
      {

        v3 = &unk_24C2F9EB8;
      }
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    -[ABSSource compositeName](self, "compositeName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)objc_msgSend(v3, "copy");

  return v9;
}

- (BOOL)setValue:(void *)a3 forProperty:(int)a4 withError:(__CFError *)a5
{
  void *v7;
  void *v8;
  void *v9;

  if (!a4)
  {
    v7 = a3;
    -[ABSSource cnImpl](self, "cnImpl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setName:", v7);

    -[ABSSource addressBook](self, "addressBook");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "recordUpdated:", self);

  }
  return a4 == 0;
}

- (BOOL)removeProperty:(int)a3 withError:(id *)a4
{
  void *v6;
  void *v7;

  if (!a3)
  {
    -[ABSSource cnImpl](self, "cnImpl", *(_QWORD *)&a3, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setName:", 0);

    -[ABSSource addressBook](self, "addressBook");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordUpdated:", self);

  }
  return a3 == 0;
}

- (void)updateAllValuesWithValuesFromContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  if (a3)
  {
    v4 = a3;
    -[ABSSource cnImpl](self, "cnImpl");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIdentifier:", v6);

    -[ABSSource cnImpl](self, "cnImpl");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setName:", v8);

    -[ABSSource cnImpl](self, "cnImpl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIOSLegacyIdentifier:", objc_msgSend(v4, "iOSLegacyIdentifier"));

    -[ABSSource cnImpl](self, "cnImpl");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "type");

    objc_msgSend(v11, "setType:", v10);
  }
}

- (void)replaceRecordStorageWithCNObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = objc_msgSend(v5, "mutableCopy");

      v5 = (void *)v6;
    }
    v7 = v5;
  }
  else
  {
    -[ABSSource cnImpl](self, "cnImpl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABSSource setRevertedRecordID:](self, "setRevertedRecordID:", objc_msgSend(v8, "iOSLegacyIdentifier"));

    v7 = 0;
  }
  v9 = v7;
  -[ABSSource setCnImpl:](self, "setCnImpl:", v7);

}

- (ABSAddressBook)addressBook
{
  return (ABSAddressBook *)objc_loadWeakRetained((id *)&self->_addressBook);
}

- (void)setAddressBook:(id)a3
{
  objc_storeWeak((id *)&self->_addressBook, a3);
}

- (void)setSource:(id)a3
{
  objc_storeWeak((id *)&self->_source, a3);
}

- (CNAccount)account
{
  return self->_account;
}

- (void)setCnImpl:(id)a3
{
  objc_storeStrong((id *)&self->_cnImpl, a3);
}

- (int)revertedRecordID
{
  return self->_revertedRecordID;
}

- (void)setRevertedRecordID:(int)a3
{
  self->_revertedRecordID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cnImpl, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_destroyWeak((id *)&self->_source);
  objc_destroyWeak((id *)&self->_addressBook);
}

@end
