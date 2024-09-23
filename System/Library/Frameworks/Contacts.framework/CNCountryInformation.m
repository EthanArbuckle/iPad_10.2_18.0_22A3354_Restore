@implementation CNCountryInformation

- (CNCountryInformation)initWithISOCountryCode:(id)a3 name:(id)a4 phoneticName:(id)a5
{
  id v8;
  id v9;
  id v10;
  CNCountryInformation *v11;
  uint64_t v12;
  NSString *isoCountryCode;
  uint64_t v14;
  NSString *name;
  uint64_t v16;
  NSString *phoneticName;
  CNCountryInformation *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CNCountryInformation;
  v11 = -[CNCountryInformation init](&v20, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    isoCountryCode = v11->_isoCountryCode;
    v11->_isoCountryCode = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    phoneticName = v11->_phoneticName;
    v11->_phoneticName = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;
  _QWORD aBlock[5];
  id v16;
  _QWORD v17[5];
  id v18;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D13A40];
  v6 = objc_opt_class();
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __32__CNCountryInformation_isEqual___block_invoke;
  v17[3] = &unk_1E29F7D70;
  v17[4] = self;
  v18 = v4;
  aBlock[0] = v7;
  aBlock[1] = 3221225472;
  aBlock[2] = __32__CNCountryInformation_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E29F7D70;
  aBlock[4] = self;
  v8 = v18;
  v16 = v8;
  v9 = _Block_copy(aBlock);
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __32__CNCountryInformation_isEqual___block_invoke_3;
  v13[3] = &unk_1E29F7D70;
  v13[4] = self;
  v14 = v8;
  v10 = v8;
  v11 = _Block_copy(v13);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v10, v6, self, v17, v9, v11, 0);

  return (char)self;
}

uint64_t __32__CNCountryInformation_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "isoCountryCode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "isoCountryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __32__CNCountryInformation_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __32__CNCountryInformation_isEqual___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "phoneticName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "phoneticName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _QWORD v9[5];
  _QWORD aBlock[5];
  _QWORD v11[5];

  v3 = (void *)MEMORY[0x1E0D13A78];
  v4 = MEMORY[0x1E0C809B0];
  aBlock[4] = self;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __28__CNCountryInformation_hash__block_invoke;
  v11[3] = &unk_1E29F7D98;
  v11[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __28__CNCountryInformation_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  v5 = _Block_copy(aBlock);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __28__CNCountryInformation_hash__block_invoke_3;
  v9[3] = &unk_1E29F7D98;
  v9[4] = self;
  v6 = _Block_copy(v9);
  v7 = objc_msgSend(v3, "hashWithBlocks:", v11, v5, v6, 0);

  return v7;
}

uint64_t __28__CNCountryInformation_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "isoCountryCode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __28__CNCountryInformation_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __28__CNCountryInformation_hash__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "phoneticName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0D13A08];
  -[CNCountryInformation isoCountryCode](self, "isoCountryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCountryInformation name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNCountryInformation phoneticName](self, "phoneticName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForObject:withNamesAndObjects:", self, CFSTR("country code"), v4, CFSTR("name"), v5, CFSTR("phonetic name"), v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)phoneticName
{
  return self->_phoneticName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneticName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
}

@end
