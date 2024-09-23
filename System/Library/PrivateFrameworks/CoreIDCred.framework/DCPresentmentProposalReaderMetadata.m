@implementation DCPresentmentProposalReaderMetadata

- (DCPresentmentProposalReaderMetadata)initWithIdentifier:(id)a3 organization:(id)a4 organizationalUnit:(id)a5 iconData:(id)a6 iconURL:(id)a7 iconMediaType:(id)a8 privacyPolicyURL:(id)a9 merchantCategoryCode:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  DCPresentmentProposalReaderMetadata *v24;
  uint64_t v25;
  NSString *identifier;
  uint64_t v27;
  NSString *organization;
  uint64_t v29;
  NSString *organizationalUnit;
  uint64_t v31;
  NSData *iconData;
  uint64_t v33;
  NSURL *iconURL;
  uint64_t v35;
  NSString *iconMediaType;
  uint64_t v37;
  NSURL *privacyPolicyURL;
  uint64_t v39;
  NSNumber *merchantCategoryCode;
  objc_super v42;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v42.receiver = self;
  v42.super_class = (Class)DCPresentmentProposalReaderMetadata;
  v24 = -[DCPresentmentProposalReaderMetadata init](&v42, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v16, "copy");
    identifier = v24->_identifier;
    v24->_identifier = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    organization = v24->_organization;
    v24->_organization = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    organizationalUnit = v24->_organizationalUnit;
    v24->_organizationalUnit = (NSString *)v29;

    v31 = objc_msgSend(v19, "copy");
    iconData = v24->_iconData;
    v24->_iconData = (NSData *)v31;

    v33 = objc_msgSend(v20, "copy");
    iconURL = v24->_iconURL;
    v24->_iconURL = (NSURL *)v33;

    v35 = objc_msgSend(v21, "copy");
    iconMediaType = v24->_iconMediaType;
    v24->_iconMediaType = (NSString *)v35;

    v37 = objc_msgSend(v22, "copy");
    privacyPolicyURL = v24->_privacyPolicyURL;
    v24->_privacyPolicyURL = (NSURL *)v37;

    v39 = objc_msgSend(v23, "copy");
    merchantCategoryCode = v24->_merchantCategoryCode;
    v24->_merchantCategoryCode = (NSNumber *)v39;

  }
  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DCPresentmentProposalReaderMetadata)initWithCoder:(id)a3
{
  id v4;
  DCPresentmentProposalReaderMetadata *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *organization;
  uint64_t v10;
  NSString *organizationalUnit;
  uint64_t v12;
  NSData *iconData;
  uint64_t v14;
  NSURL *iconURL;
  uint64_t v16;
  NSString *iconMediaType;
  uint64_t v18;
  NSURL *privacyPolicyURL;
  uint64_t v20;
  NSNumber *merchantCategoryCode;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DCPresentmentProposalReaderMetadata;
  v5 = -[DCPresentmentProposalReaderMetadata init](&v23, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C3072A8);
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307AC8);
    v8 = objc_claimAutoreleasedReturnValue();
    organization = v5->_organization;
    v5->_organization = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307AE8);
    v10 = objc_claimAutoreleasedReturnValue();
    organizationalUnit = v5->_organizationalUnit;
    v5->_organizationalUnit = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307B08);
    v12 = objc_claimAutoreleasedReturnValue();
    iconData = v5->_iconData;
    v5->_iconData = (NSData *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307B28);
    v14 = objc_claimAutoreleasedReturnValue();
    iconURL = v5->_iconURL;
    v5->_iconURL = (NSURL *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307B48);
    v16 = objc_claimAutoreleasedReturnValue();
    iconMediaType = v5->_iconMediaType;
    v5->_iconMediaType = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307B68);
    v18 = objc_claimAutoreleasedReturnValue();
    privacyPolicyURL = v5->_privacyPolicyURL;
    v5->_privacyPolicyURL = (NSURL *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), 0x24C307B88);
    v20 = objc_claimAutoreleasedReturnValue();
    merchantCategoryCode = v5->_merchantCategoryCode;
    v5->_merchantCategoryCode = (NSNumber *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, 0x24C3072A8);
  objc_msgSend(v5, "encodeObject:forKey:", self->_organization, 0x24C307AC8);
  objc_msgSend(v5, "encodeObject:forKey:", self->_organizationalUnit, 0x24C307AE8);
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconData, 0x24C307B08);
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconURL, 0x24C307B28);
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconMediaType, 0x24C307B48);
  objc_msgSend(v5, "encodeObject:forKey:", self->_privacyPolicyURL, 0x24C307B68);
  objc_msgSend(v5, "encodeObject:forKey:", self->_merchantCategoryCode, 0x24C307B88);

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[DCPresentmentProposalReaderMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingSelector:", sel_compare_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v9;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v15, "isEqual:", v16))
          v17 = 0;
        else
          v17 = v15;
        objc_msgSend(v6, "appendFormat:", CFSTR("%@ = %@; "), v14, v17);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  objc_msgSend(v6, "deleteCharactersInRange:", objc_msgSend(v6, "length") - 2, 2);
  objc_msgSend(v6, "appendString:", CFSTR(">"));

  return v6;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[9];

  v14[8] = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(sel_identifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  NSStringFromSelector(sel_organization);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  NSStringFromSelector(sel_organizationalUnit);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v5;
  NSStringFromSelector(sel_iconData);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v6;
  NSStringFromSelector(sel_iconURL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v7;
  NSStringFromSelector(sel_iconMediaType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v8;
  NSStringFromSelector(sel_privacyPolicyURL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v9;
  NSStringFromSelector(sel_merchantCategoryCode);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[7] = v10;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[DCPresentmentProposalReaderMetadata dictionaryWithValuesForKeys:](self, "dictionaryWithValuesForKeys:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DCPresentmentProposalReaderMetadata initWithIdentifier:organization:organizationalUnit:iconData:iconURL:iconMediaType:privacyPolicyURL:merchantCategoryCode:]([DCPresentmentProposalReaderMetadata alloc], "initWithIdentifier:organization:organizationalUnit:iconData:iconURL:iconMediaType:privacyPolicyURL:merchantCategoryCode:", self->_identifier, self->_organization, self->_organizationalUnit, self->_iconData, self->_iconURL, self->_iconMediaType, self->_privacyPolicyURL, self->_merchantCategoryCode);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)organization
{
  return self->_organization;
}

- (NSString)organizationalUnit
{
  return self->_organizationalUnit;
}

- (NSData)iconData
{
  return self->_iconData;
}

- (NSURL)iconURL
{
  return self->_iconURL;
}

- (NSString)iconMediaType
{
  return self->_iconMediaType;
}

- (NSURL)privacyPolicyURL
{
  return self->_privacyPolicyURL;
}

- (NSNumber)merchantCategoryCode
{
  return self->_merchantCategoryCode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantCategoryCode, 0);
  objc_storeStrong((id *)&self->_privacyPolicyURL, 0);
  objc_storeStrong((id *)&self->_iconMediaType, 0);
  objc_storeStrong((id *)&self->_iconURL, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_organizationalUnit, 0);
  objc_storeStrong((id *)&self->_organization, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
