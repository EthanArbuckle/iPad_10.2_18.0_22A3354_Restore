@implementation HMBLocalZoneIDRow

- (HMBLocalZoneIDRow)initWithName:(id)a3 token:(id)a4
{
  id v7;
  id v8;
  HMBLocalZoneIDRow *v9;
  HMBLocalZoneIDRow *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMBLocalZoneIDRow;
  v9 = -[HMBLocalZoneIDRow init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v10->_token, a4);
  }

  return v10;
}

- (id)labels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  -[HMBLocalZoneIDRow name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  -[HMBLocalZoneIDRow token](self, "token");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HMBLocalZoneIDRow name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMBLocalZoneIDRow token](self, "token");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v4, "initWithName:token:", v5, v6);

  return v7;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMBLocalZoneIDRow name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Name"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_1EFA28600);
  v6 = 0;
  if (v4 && v5)
  {
    objc_msgSend(v4, "token");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMBLocalZoneIDRow token](self, "token");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMBLocalZoneIDRow token](self, "token");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMBLocalZoneIDRow name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMBLZR.name"));

  -[HMBLocalZoneIDRow token](self, "token");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("HMBLZR.token"));

}

- (HMBLocalZoneIDRow)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMBLocalZoneIDRow *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMBLZR.name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMBLZR.token"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HMBLocalZoneIDRow initWithName:token:](self, "initWithName:token:", v5, v6);
  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (NSData)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)shortDescription
{
  return CFSTR("HMBLocalZoneIDRow");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
