@implementation IDSLocalPairingRecord

- (id)identityDataForDataProtectionClass:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  _QWORD v21[2];

  v5 = *(_QWORD *)&a3;
  v21[1] = *MEMORY[0x1E0C80C00];
  -[IDSLocalPairingRecord protectionClassIdentityDataMap](self, "protectionClassIdentityDataMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    goto LABEL_8;
  objc_msgSend(v8, "identityData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {

    goto LABEL_5;
  }
  objc_msgSend(v8, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
LABEL_8:
    v14 = (void *)MEMORY[0x1E0CB3940];
    IDSDataProtectionClassStringFromDataProtectionClass();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Missing identity for class-%@"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0D34730];
    v20 = *MEMORY[0x1E0CB2938];
    v21[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 7, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a4)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_5:
  objc_msgSend(v8, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
LABEL_6:
    *a4 = objc_retainAutorelease(v11);
LABEL_7:
  objc_msgSend(v8, "identityData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (IDSLocalPairingRecord)initWithIdentityDataClassA:(id)a3 classC:(id)a4 classD:(id)a5
{
  id v8;
  id v9;
  id v10;
  IDSLocalPairingRecord *v11;
  NSDictionary *v12;
  NSDictionary *protectionClassIdentityDataMap;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IDSLocalPairingRecord;
  v11 = -[IDSLocalPairingRecord init](&v15, sel_init);
  if (v11)
  {
    v12 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v8, &unk_1E2CAE258);
    -[NSDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v9, &unk_1E2CAE270);
    -[NSDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v10, &unk_1E2CAE288);
    protectionClassIdentityDataMap = v11->_protectionClassIdentityDataMap;
    v11->_protectionClassIdentityDataMap = v12;

  }
  return v11;
}

- (IDSLocalPairingRecord)initWithCoder:(id)a3
{
  id v4;
  IDSLocalPairingRecord *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *protectionClassIdentityDataMap;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IDSLocalPairingRecord;
  v5 = -[IDSLocalPairingRecord init](&v13, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("kIdentityDataMap"));
    v10 = objc_claimAutoreleasedReturnValue();
    protectionClassIdentityDataMap = v5->_protectionClassIdentityDataMap;
    v5->_protectionClassIdentityDataMap = (NSDictionary *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[IDSLocalPairingRecord protectionClassIdentityDataMap](self, "protectionClassIdentityDataMap");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kIdentityDataMap"));

}

+ (BOOL)supportsSecureCoding
{
  return 0;
}

- (NSDictionary)protectionClassIdentityDataMap
{
  return self->_protectionClassIdentityDataMap;
}

- (void)setProtectionClassIdentityDataMap:(id)a3
{
  objc_storeStrong((id *)&self->_protectionClassIdentityDataMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectionClassIdentityDataMap, 0);
}

@end
