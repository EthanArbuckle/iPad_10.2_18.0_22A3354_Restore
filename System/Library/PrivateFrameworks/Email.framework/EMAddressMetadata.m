@implementation EMAddressMetadata

- (EMAddressMetadata)initWithCapabilities:(id)a3 date:(id)a4
{
  id v7;
  id v8;
  EMAddressMetadata *v9;
  EMAddressMetadata *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)EMAddressMetadata;
  v9 = -[EMAddressMetadata init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_date, a4);
    objc_storeStrong((id *)&v10->_capabilities, a3);
    v10->_supportsEncryptedSubject = objc_msgSend(v7, "ef_any:", &__block_literal_global_0);
  }

  return v10;
}

uint64_t __47__EMAddressMetadata_initWithCapabilities_date___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0D1E6A0], "oidStringForEncryptedSubject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (EMAddressMetadata)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  EMAddressMetadata *v13;
  uint64_t v15;

  v4 = a3;
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0C9AA60];
  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("smime_capabilities"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("smime_capabilities_date"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataUsingEncoding:", 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v9, 1, &v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      v6 = v10;
    if (v8)
    {
      v11 = 0;
      v12 = v8;
      goto LABEL_8;
    }
  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v11 = 1;
LABEL_8:
  v13 = -[EMAddressMetadata initWithCapabilities:date:](self, "initWithCapabilities:date:", v6, v12);
  if (v11)

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EMAddressMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  EMAddressMetadata *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_capabilities"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_date"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[EMAddressMetadata initWithCapabilities:date:](self, "initWithCapabilities:date:", v5, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[EMAddressMetadata capabilities](self, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_capabilities"));

  -[EMAddressMetadata date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_date"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[EMAddressMetadata: date=%@, capabilities=%@]"), self->_date, self->_capabilities);
}

- (NSArray)capabilities
{
  return self->_capabilities;
}

- (void)setCapabilities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (BOOL)supportsEncryptedSubject
{
  return self->_supportsEncryptedSubject;
}

- (void)setSupportsEncryptedSubject:(BOOL)a3
{
  self->_supportsEncryptedSubject = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_capabilities, 0);
}

@end
