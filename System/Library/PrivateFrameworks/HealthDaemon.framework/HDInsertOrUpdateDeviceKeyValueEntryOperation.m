@implementation HDInsertOrUpdateDeviceKeyValueEntryOperation

- (HDInsertOrUpdateDeviceKeyValueEntryOperation)initWithCategory:(int64_t)a3 key:(id)a4 value:(id)a5 domain:(id)a6 deviceContext:(id)a7 modificationDate:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  HDInsertOrUpdateDeviceKeyValueEntryOperation *v18;
  HDInsertOrUpdateDeviceKeyValueEntryOperation *v19;
  id v22;
  objc_super v23;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v22 = a7;
  v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)HDInsertOrUpdateDeviceKeyValueEntryOperation;
  v18 = -[HDInsertOrUpdateDeviceKeyValueEntryOperation init](&v23, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_category = a3;
    objc_storeStrong((id *)&v18->_value, a5);
    objc_storeStrong((id *)&v19->_key, a4);
    objc_storeStrong((id *)&v19->_domainName, a6);
    objc_storeStrong((id *)&v19->_deviceContext, a7);
    objc_storeStrong((id *)&v19->_modificationDate, a8);
  }

  return v19;
}

- (id)transactionContext
{
  if (self->_category)
    +[HDDatabaseTransactionContext contextForWriting](HDDatabaseTransactionContext, "contextForWriting");
  else
    +[HDDatabaseTransactionContext contextForWritingProtectedData](HDDatabaseTransactionContext, "contextForWritingProtectedData");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a4;
  objc_msgSend(a3, "deviceKeyValueStoreManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v9, "insertOrUpdateData:forKey:transaction:domainName:protectionCategory:deviceContext:modificationDate:error:", self->_value, self->_key, v8, self->_domainName, self->_category, self->_deviceContext, self->_modificationDate, a5);

  return (char)a5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDInsertOrUpdateDeviceKeyValueEntryOperation)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HDInsertOrUpdateDeviceKeyValueEntryOperation *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("Category"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EntryValue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EntryKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EntryDomain"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DeviceContext"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ModificationDate"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HDInsertOrUpdateDeviceKeyValueEntryOperation initWithCategory:key:value:domain:deviceContext:modificationDate:](self, "initWithCategory:key:value:domain:deviceContext:modificationDate:", v5, v7, v6, v8, v9, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t category;
  id v5;

  category = self->_category;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", category, CFSTR("Category"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("EntryValue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_key, CFSTR("EntryKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_domainName, CFSTR("EntryDomain"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceContext, CFSTR("DeviceContext"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modificationDate, CFSTR("ModificationDate"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_deviceContext, 0);
  objc_storeStrong((id *)&self->_domainName, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
