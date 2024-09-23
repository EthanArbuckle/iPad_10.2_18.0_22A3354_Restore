@implementation _CNEmailAddressDonationValue

- (_CNEmailAddressDonationValue)initWithEmailAddress:(id)a3 label:(id)a4 origin:(id)a5
{
  id v8;
  id v9;
  _CNEmailAddressDonationValue *v10;
  uint64_t v11;
  NSString *emailAddress;
  uint64_t v13;
  NSString *label;
  _CNEmailAddressDonationValue *v15;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_CNEmailAddressDonationValue;
  v10 = -[CNDonationValue initWithOrigin:](&v17, sel_initWithOrigin_, a5);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    emailAddress = v10->_emailAddress;
    v10->_emailAddress = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    label = v10->_label;
    v10->_label = (NSString *)v13;

    v15 = v10;
  }

  return v10;
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
  -[_CNEmailAddressDonationValue emailAddress](self, "emailAddress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("email"), v4);

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
  void *v10;

  v4 = a3;
  -[CNDonationValue origin](self, "origin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setExpirationDate:", v4);
  v7 = objc_alloc((Class)objc_opt_class());
  -[_CNEmailAddressDonationValue emailAddress](self, "emailAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_CNEmailAddressDonationValue label](self, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithEmailAddress:label:origin:", v8, v9, v6);

  return v10;
}

- (_CNEmailAddressDonationValue)initWithCoder:(id)a3
{
  id v4;
  _CNEmailAddressDonationValue *v5;
  void *v6;
  uint64_t v7;
  NSString *emailAddress;
  void *v9;
  uint64_t v10;
  NSString *label;
  _CNEmailAddressDonationValue *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_CNEmailAddressDonationValue;
  v5 = -[CNDonationValue initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_emailAddress"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    emailAddress = v5->_emailAddress;
    v5->_emailAddress = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_label"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    label = v5->_label;
    v5->_label = (NSString *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_CNEmailAddressDonationValue;
  v4 = a3;
  -[CNDonationValue encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_emailAddress, CFSTR("_emailAddress"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_label, CFSTR("_label"));

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
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v6 = (void *)MEMORY[0x24BE19270];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __40___CNEmailAddressDonationValue_isEqual___block_invoke;
  v16[3] = &unk_24C235F78;
  v16[4] = self;
  v17 = v4;
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __40___CNEmailAddressDonationValue_isEqual___block_invoke_2;
  v14[3] = &unk_24C235F78;
  v14[4] = self;
  v7 = v17;
  v15 = v7;
  v8 = (void *)MEMORY[0x20BD1799C](v14);
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __40___CNEmailAddressDonationValue_isEqual___block_invoke_3;
  v12[3] = &unk_24C235F78;
  v12[4] = self;
  v13 = v7;
  v9 = v7;
  v10 = (void *)MEMORY[0x20BD1799C](v12);
  LOBYTE(self) = objc_msgSend(v6, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v9, v16, v8, v10, 0);

  return (char)self;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];

  v3 = (void *)MEMORY[0x24BE19288];
  v4 = MEMORY[0x24BDAC760];
  v10[4] = self;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __36___CNEmailAddressDonationValue_hash__block_invoke;
  v11[3] = &unk_24C235FA0;
  v11[4] = self;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __36___CNEmailAddressDonationValue_hash__block_invoke_2;
  v10[3] = &unk_24C235FA0;
  v5 = (void *)MEMORY[0x20BD1799C](v10, a2);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __36___CNEmailAddressDonationValue_hash__block_invoke_3;
  v9[3] = &unk_24C235FA0;
  v9[4] = self;
  v6 = (void *)MEMORY[0x20BD1799C](v9);
  v7 = objc_msgSend(v3, "hashWithBlocks:", v11, v5, v6, 0);

  return v7;
}

- (void)acceptDonationValueVisitor:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_CNEmailAddressDonationValue emailAddress](self, "emailAddress");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_CNEmailAddressDonationValue label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visitDonationValue:emailAddress:label:", self, v6, v5);

}

- (void)updatePropertyListRepresentation:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_CNEmailAddressDonationValue emailAddress](self, "emailAddress");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("email-address"));

  -[_CNEmailAddressDonationValue label](self, "label");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("label"));

}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
}

@end
