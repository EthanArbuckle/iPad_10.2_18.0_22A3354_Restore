@implementation _CNNameComponentsDonationValue

- (_CNNameComponentsDonationValue)initWithNameComponents:(id)a3 origin:(id)a4
{
  id v6;
  _CNNameComponentsDonationValue *v7;
  uint64_t v8;
  NSPersonNameComponents *nameComponents;
  _CNNameComponentsDonationValue *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_CNNameComponentsDonationValue;
  v7 = -[CNDonationValue initWithOrigin:](&v12, sel_initWithOrigin_, a4);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    nameComponents = v7->_nameComponents;
    v7->_nameComponents = (NSPersonNameComponents *)v8;

    v10 = v7;
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BE19248], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNNameComponentsDonationValue nameComponents](self, "nameComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("name"), v4);

  -[CNDonationValue origin](self, "origin");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("origin"), v6);

  objc_msgSend(v3, "build");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithNewExpirationDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[CNDonationValue origin](self, "origin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setExpirationDate:", v4);
  v7 = objc_alloc((Class)objc_opt_class());
  -[_CNNameComponentsDonationValue nameComponents](self, "nameComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithNameComponents:origin:", v8, v6);

  return v9;
}

- (_CNNameComponentsDonationValue)initWithCoder:(id)a3
{
  id v4;
  _CNNameComponentsDonationValue *v5;
  void *v6;
  uint64_t v7;
  NSPersonNameComponents *nameComponents;
  _CNNameComponentsDonationValue *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_CNNameComponentsDonationValue;
  v5 = -[CNDonationValue initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_nameComponents"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    nameComponents = v5->_nameComponents;
    v5->_nameComponents = (NSPersonNameComponents *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CNNameComponentsDonationValue;
  v4 = a3;
  -[CNDonationValue encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_nameComponents, CFSTR("_nameComponents"), v5.receiver, v5.super_class);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  _CNNameComponentsDonationValue *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v6 = (void *)MEMORY[0x24BE19270];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __42___CNNameComponentsDonationValue_isEqual___block_invoke;
  v16[3] = &unk_24C235F78;
  v16[4] = self;
  v17 = v4;
  v10 = v5;
  v11 = 3221225472;
  v12 = __42___CNNameComponentsDonationValue_isEqual___block_invoke_2;
  v13 = &unk_24C235F78;
  v14 = self;
  v15 = v17;
  v7 = v17;
  v8 = (void *)MEMORY[0x20BD1799C](&v10);
  LOBYTE(self) = objc_msgSend(v6, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v7, v16, v8, 0, v10, v11, v12, v13, v14);

  return (char)self;
}

- (unint64_t)hash
{
  void *v2;
  void *v3;
  unint64_t v4;
  _QWORD v6[5];
  _QWORD v7[5];

  v2 = (void *)MEMORY[0x24BE19288];
  v6[4] = self;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38___CNNameComponentsDonationValue_hash__block_invoke;
  v7[3] = &unk_24C235FA0;
  v7[4] = self;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38___CNNameComponentsDonationValue_hash__block_invoke_2;
  v6[3] = &unk_24C235FA0;
  v3 = (void *)MEMORY[0x20BD1799C](v6, a2);
  v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

- (void)acceptDonationValueVisitor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_CNNameComponentsDonationValue nameComponents](self, "nameComponents");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visitDonationValue:nameComponents:", self, v5);

}

- (void)updatePropertyListRepresentation:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v4 = (void *)MEMORY[0x24BDBCED8];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithCapacity:", 7);
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", &unk_24C23B960, CFSTR("version"));
  -[_CNNameComponentsDonationValue nameComponents](self, "nameComponents");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "namePrefix");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v7, CFSTR("namePrefix"));

  -[_CNNameComponentsDonationValue nameComponents](self, "nameComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "givenName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v9, CFSTR("givenName"));

  -[_CNNameComponentsDonationValue nameComponents](self, "nameComponents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "middleName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v11, CFSTR("middleName"));

  -[_CNNameComponentsDonationValue nameComponents](self, "nameComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "familyName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v13, CFSTR("familyName"));

  -[_CNNameComponentsDonationValue nameComponents](self, "nameComponents");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "nameSuffix");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, CFSTR("nameSuffix"));

  -[_CNNameComponentsDonationValue nameComponents](self, "nameComponents");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "nickname");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, CFSTR("nickname"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, CFSTR("name-components"));
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameComponents, 0);
}

@end
