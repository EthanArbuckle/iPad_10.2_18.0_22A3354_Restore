@implementation CNValueOrigin

- (CNValueOrigin)init
{
  CNValueOrigin *v2;
  id v3;

  v2 = self;
  CNInitializerUnavailableException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNValueOrigin)initWithLocalizedApplicationName:(id)a3 donationIdentifier:(id)a4
{
  id v6;
  id v7;
  CNValueOrigin *v8;
  uint64_t v9;
  NSString *localizedApplicationName;
  uint64_t v11;
  NSString *donationIdentifier;
  CNValueOrigin *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNValueOrigin;
  v8 = -[CNValueOrigin init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    localizedApplicationName = v8->_localizedApplicationName;
    v8->_localizedApplicationName = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    donationIdentifier = v8->_donationIdentifier;
    v8->_donationIdentifier = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNValueOrigin localizedApplicationName](self, "localizedApplicationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("localizedApplicationName"), v4);

  -[CNValueOrigin donationIdentifier](self, "donationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("donationIdentifier"), v6);

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t aBlock;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  CNValueOrigin *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v6 = (void *)MEMORY[0x1E0D13A40];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __25__CNValueOrigin_isEqual___block_invoke;
  v16[3] = &unk_1E29F7D70;
  v16[4] = self;
  v17 = v4;
  aBlock = v5;
  v11 = 3221225472;
  v12 = __25__CNValueOrigin_isEqual___block_invoke_2;
  v13 = &unk_1E29F7D70;
  v14 = self;
  v15 = v17;
  v7 = v17;
  v8 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v6, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v7, self, v16, v8, 0, aBlock, v11, v12, v13, v14);

  return (char)self;
}

uint64_t __25__CNValueOrigin_isEqual___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "donationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "donationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

uint64_t __25__CNValueOrigin_isEqual___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = (void *)MEMORY[0x1E0D13A40];
  objc_msgSend(*(id *)(a1 + 32), "localizedApplicationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "localizedApplicationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "isObject:equalToOther:", v3, v4);

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;
  _QWORD aBlock[5];
  _QWORD v7[5];

  v2 = (void *)MEMORY[0x1E0D13A78];
  aBlock[4] = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __21__CNValueOrigin_hash__block_invoke;
  v7[3] = &unk_1E29F7D98;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __21__CNValueOrigin_hash__block_invoke_2;
  aBlock[3] = &unk_1E29F7D98;
  v3 = _Block_copy(aBlock);
  v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __21__CNValueOrigin_hash__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "donationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

uint64_t __21__CNValueOrigin_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  v1 = (void *)MEMORY[0x1E0D13A78];
  objc_msgSend(*(id *)(a1 + 32), "localizedApplicationName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v1, "objectHash:", v2);

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNValueOrigin)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CNValueOrigin *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedApplicationName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("donationIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[CNValueOrigin initWithLocalizedApplicationName:donationIdentifier:](self, "initWithLocalizedApplicationName:donationIdentifier:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CNValueOrigin localizedApplicationName](self, "localizedApplicationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("localizedApplicationName"));

  -[CNValueOrigin donationIdentifier](self, "donationIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("donationIdentifier"));

}

- (NSString)localizedApplicationName
{
  return self->_localizedApplicationName;
}

- (NSString)donationIdentifier
{
  return self->_donationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_donationIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedApplicationName, 0);
}

@end
