@implementation ABSGroup

+ (void)initialize
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___ABSGroup;
  objc_msgSendSuper2(&v2, sel_initialize);
  +[ABSAddressBook ABInitialize](ABSAddressBook, "ABInitialize");
}

- (ABSGroup)initWithSource:(id)a3
{
  id v4;
  ABSGroup *v5;
  ABSGroup *v6;

  v4 = a3;
  v5 = -[ABSGroup initWithMutableGroup:](self, "initWithMutableGroup:", 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_source, v4);
    v6->_revertedRecordID = -1;
  }

  return v6;
}

- (ABSGroup)initWithMutableGroup:(id)a3
{
  id v4;
  ABSGroup *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ABSGroup;
  v5 = -[ABSGroup init](&v7, sel_init);
  if (v5)
  {
    if (!v4)
      v4 = objc_alloc_init(MEMORY[0x24BDBAD68]);
    objc_storeStrong((id *)&v5->_cnImpl, v4);
  }

  return v5;
}

- (ABSGroup)init
{
  return -[ABSGroup initWithSource:](self, "initWithSource:", 0);
}

- (int)id
{
  void *v2;
  int v3;

  -[ABSGroup cnImpl](self, "cnImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "iOSLegacyIdentifier");

  if (v3)
    return v3;
  else
    return -1;
}

- (CNMutableGroup)cnImpl
{
  void *v3;
  id v4;

  if (!self->_cnImpl && -[ABSGroup revertedRecordID](self, "revertedRecordID") != -1)
  {
    -[ABSGroup addressBook](self, "addressBook");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v3, "groupWithRecordID:", -[ABSGroup revertedRecordID](self, "revertedRecordID"));

  }
  return self->_cnImpl;
}

- (NSString)CNIdentifierString
{
  void *v2;
  void *v3;

  -[ABSGroup cnImpl](self, "cnImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unsigned)type
{
  return 1;
}

- (NSString)compositeName
{
  void *v2;
  void *v3;

  -[ABSGroup cnImpl](self, "cnImpl");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (ABSSource)source
{
  ABSSource **p_source;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;

  p_source = &self->_source;
  WeakRetained = objc_loadWeakRetained((id *)&self->_source);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_source);
    if (!v5)
    {
LABEL_6:
      -[ABSGroup addressBook](self, "addressBook");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "defaultSource");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_storeWeak((id *)p_source, v5);
    }
  }
  else
  {
    if (-[ABSGroup id](self, "id") == -1)
      goto LABEL_6;
    -[ABSGroup addressBook](self, "addressBook");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sourceForRecord:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeWeak((id *)p_source, v5);
    if (!v5)
      goto LABEL_6;
  }
  return (ABSSource *)v5;
}

- (void)copyValueForProperty:(int)a3
{
  void *v3;
  void *v4;

  if (a3)
  {
    v3 = 0;
  }
  else
  {
    -[ABSGroup compositeName](self, "compositeName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (BOOL)setValue:(void *)a3 forProperty:(int)a4 withError:(__CFError *)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  +[ABSGroup propertyKeyForPropertyID:](ABSGroup, "propertyKeyForPropertyID:", *(_QWORD *)&a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a3;
  -[ABSGroup cnImpl](self, "cnImpl");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v8, v7);

  -[ABSGroup addressBook](self, "addressBook");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "recordUpdated:", self);

  return 1;
}

- (BOOL)removeProperty:(int)a3 withError:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;

  +[ABSGroup propertyKeyForPropertyID:](ABSGroup, "propertyKeyForPropertyID:", *(_QWORD *)&a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABSGroup cnImpl](self, "cnImpl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", 0, v5);

  -[ABSGroup addressBook](self, "addressBook");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recordUpdated:", self);

  return 1;
}

- (void)updateAllValuesWithValuesFromGroup:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[3];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = *MEMORY[0x24BDBA450];
    v18[0] = *MEMORY[0x24BDBA458];
    v18[1] = v5;
    v18[2] = *MEMORY[0x24BDBA460];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
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
          v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
          -[ABSGroup cnImpl](self, "cnImpl");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "valueForKey:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setValue:forKey:", v13, v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v8);
    }

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
    -[ABSGroup cnImpl](self, "cnImpl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ABSGroup setRevertedRecordID:](self, "setRevertedRecordID:", objc_msgSend(v8, "iOSLegacyIdentifier"));

    v7 = 0;
  }
  v9 = v7;
  -[ABSGroup setCnImpl:](self, "setCnImpl:", v7);

}

+ (id)propertyKeyForPropertyID:(int)a3
{
  if (a3)
    return 0;
  else
    return (id)*MEMORY[0x24BDBA460];
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
  objc_destroyWeak((id *)&self->_source);
  objc_destroyWeak((id *)&self->_addressBook);
}

@end
