@implementation HMBLocalZoneIDUnshared

- (HMBLocalZoneIDUnshared)initWithName:(id)a3
{
  id v5;
  HMBLocalZoneIDUnshared *v6;
  HMBLocalZoneIDUnshared *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMBLocalZoneIDUnshared;
  v6 = -[HMBLocalZoneIDUnshared init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_name, a3);

  return v7;
}

- (id)labels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  -[HMBLocalZoneIDUnshared name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  -[HMBLocalZoneIDUnshared token](self, "token");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "base64EncodedStringWithOptions:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSData)token
{
  void *v2;
  void *v3;

  -[HMBLocalZoneIDUnshared name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataUsingEncoding:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HMBLocalZoneIDUnshared name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<HMBLocalZoneIDUnshared: %@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[HMBLocalZoneIDUnshared name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:", v5);

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
    -[HMBLocalZoneIDUnshared token](self, "token");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isEqual:", v8);

  }
  return v6;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMBLocalZoneIDUnshared token](self, "token");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)shortDescription
{
  return CFSTR("HMBLocalZoneIDUnshared");
}

@end
