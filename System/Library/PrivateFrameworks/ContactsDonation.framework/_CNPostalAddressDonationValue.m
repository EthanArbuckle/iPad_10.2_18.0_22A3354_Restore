@implementation _CNPostalAddressDonationValue

- (_CNPostalAddressDonationValue)initWithPostalAddress:(id)a3 style:(int64_t)a4 label:(id)a5 origin:(id)a6
{
  id v10;
  id v11;
  _CNPostalAddressDonationValue *v12;
  uint64_t v13;
  CNPostalAddress *postalAddress;
  uint64_t v15;
  NSString *label;
  _CNPostalAddressDonationValue *v17;
  objc_super v19;

  v10 = a3;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_CNPostalAddressDonationValue;
  v12 = -[CNDonationValue initWithOrigin:](&v19, sel_initWithOrigin_, a6);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    postalAddress = v12->_postalAddress;
    v12->_postalAddress = (CNPostalAddress *)v13;

    v12->_style = a4;
    v15 = objc_msgSend(v11, "copy");
    label = v12->_label;
    v12->_label = (NSString *)v15;

    v17 = v12;
  }

  return v12;
}

- (id)copyWithNewExpirationDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[CNDonationValue origin](self, "origin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "setExpirationDate:", v4);
  v7 = objc_alloc((Class)objc_opt_class());
  -[_CNPostalAddressDonationValue postalAddress](self, "postalAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[_CNPostalAddressDonationValue style](self, "style");
  -[_CNPostalAddressDonationValue label](self, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "initWithPostalAddress:style:label:origin:", v8, v9, v10, v6);

  return v11;
}

- (_CNPostalAddressDonationValue)initWithCoder:(id)a3
{
  id v4;
  _CNPostalAddressDonationValue *v5;
  void *v6;
  uint64_t v7;
  CNPostalAddress *postalAddress;
  void *v9;
  uint64_t v10;
  NSString *label;
  _CNPostalAddressDonationValue *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_CNPostalAddressDonationValue;
  v5 = -[CNDonationValue initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_postalAddress"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    postalAddress = v5->_postalAddress;
    v5->_postalAddress = (CNPostalAddress *)v7;

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
  v5.super_class = (Class)_CNPostalAddressDonationValue;
  v4 = a3;
  -[CNDonationValue encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_postalAddress, CFSTR("_postalAddress"), v5.receiver, v5.super_class);
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
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  _CNPostalAddressDonationValue *v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v6 = (void *)MEMORY[0x24BE19270];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __41___CNPostalAddressDonationValue_isEqual___block_invoke;
  v24[3] = &unk_24C235F78;
  v24[4] = self;
  v25 = v4;
  v22[0] = v5;
  v22[1] = 3221225472;
  v22[2] = __41___CNPostalAddressDonationValue_isEqual___block_invoke_2;
  v22[3] = &unk_24C235F78;
  v22[4] = self;
  v7 = v25;
  v23 = v7;
  v8 = (void *)MEMORY[0x20BD1799C](v22);
  v20[0] = v5;
  v20[1] = 3221225472;
  v20[2] = __41___CNPostalAddressDonationValue_isEqual___block_invoke_3;
  v20[3] = &unk_24C235F78;
  v20[4] = self;
  v9 = v7;
  v21 = v9;
  v10 = (void *)MEMORY[0x20BD1799C](v20);
  v14 = v5;
  v15 = 3221225472;
  v16 = __41___CNPostalAddressDonationValue_isEqual___block_invoke_4;
  v17 = &unk_24C235F78;
  v18 = self;
  v19 = v9;
  v11 = v9;
  v12 = (void *)MEMORY[0x20BD1799C](&v14);
  LOBYTE(self) = objc_msgSend(v6, "isObject:memberOfSameClassAndEqualTo:withBlocks:", self, v11, v24, v8, v10, v12, 0, v14, v15, v16, v17, v18);

  return (char)self;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];

  v3 = (void *)MEMORY[0x24BE19288];
  v4 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __37___CNPostalAddressDonationValue_hash__block_invoke;
  v13[3] = &unk_24C235FA0;
  v13[4] = self;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __37___CNPostalAddressDonationValue_hash__block_invoke_2;
  v12[3] = &unk_24C235FA0;
  v12[4] = self;
  v5 = (void *)MEMORY[0x20BD1799C](v12, a2);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __37___CNPostalAddressDonationValue_hash__block_invoke_3;
  v11[3] = &unk_24C235FA0;
  v11[4] = self;
  v6 = (void *)MEMORY[0x20BD1799C](v11);
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __37___CNPostalAddressDonationValue_hash__block_invoke_4;
  v10[3] = &unk_24C235FA0;
  v10[4] = self;
  v7 = (void *)MEMORY[0x20BD1799C](v10);
  v8 = objc_msgSend(v3, "hashWithBlocks:", v13, v5, v6, v7, 0);

  return v8;
}

- (void)acceptDonationValueVisitor:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  id v7;

  v4 = a3;
  -[_CNPostalAddressDonationValue postalAddress](self, "postalAddress");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[_CNPostalAddressDonationValue style](self, "style");
  -[_CNPostalAddressDonationValue label](self, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "visitDonationValue:postalAddress:style:label:", self, v7, v5, v6);

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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v4 = (void *)MEMORY[0x24BDBCED8];
  v5 = a3;
  objc_msgSend(v4, "dictionaryWithCapacity:", 9);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", &unk_24C23B960, CFSTR("version"));
  -[_CNPostalAddressDonationValue postalAddress](self, "postalAddress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "street");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v7, CFSTR("street"));

  -[_CNPostalAddressDonationValue postalAddress](self, "postalAddress");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subLocality");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v9, CFSTR("subLocality"));

  -[_CNPostalAddressDonationValue postalAddress](self, "postalAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "city");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v11, CFSTR("city"));

  -[_CNPostalAddressDonationValue postalAddress](self, "postalAddress");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "subAdministrativeArea");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v13, CFSTR("subAdministrativeArea"));

  -[_CNPostalAddressDonationValue postalAddress](self, "postalAddress");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "postalCode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v15, CFSTR("postalCode"));

  -[_CNPostalAddressDonationValue postalAddress](self, "postalAddress");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "state");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v17, CFSTR("state"));

  -[_CNPostalAddressDonationValue postalAddress](self, "postalAddress");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "country");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v19, CFSTR("country"));

  -[_CNPostalAddressDonationValue postalAddress](self, "postalAddress");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ISOCountryCode");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v21, CFSTR("isoCountryCode"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v23, CFSTR("postal-address"));
  -[_CNPostalAddressDonationValue label](self, "label");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v22, CFSTR("label"));

}

- (CNPostalAddress)postalAddress
{
  return self->_postalAddress;
}

- (int64_t)style
{
  return self->_style;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_postalAddress, 0);
}

@end
