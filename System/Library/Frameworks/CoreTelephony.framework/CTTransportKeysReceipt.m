@implementation CTTransportKeysReceipt

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTTransportKeysReceipt stks](self, "stks");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", stks=%@"), v4);

  -[CTTransportKeysReceipt sps_environment](self, "sps_environment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", env=%@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (CTTransportKeysReceipt)initWith:(id)a3
{
  id v4;
  CTTransportKeysReceipt *v5;
  CTTransportKeysReceipt *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CTTransportKeysReceipt;
  v5 = -[CTTransportKeysReceipt init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[CTTransportKeysReceipt setStks:](v5, "setStks:", v4);
    -[CTTransportKeysReceipt setSps_environment:](v6, "setSps_environment:", 0);
  }

  return v6;
}

- (CTTransportKeysReceipt)initWith:(id)a3 sps:(id)a4
{
  id v6;
  id v7;
  CTTransportKeysReceipt *v8;
  CTTransportKeysReceipt *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CTTransportKeysReceipt;
  v8 = -[CTTransportKeysReceipt init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[CTTransportKeysReceipt setStks:](v8, "setStks:", v6);
    -[CTTransportKeysReceipt setSps_environment:](v9, "setSps_environment:", v7);
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[CTTransportKeysReceipt stks](self, "stks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setStks:", v6);

  -[CTTransportKeysReceipt sps_environment](self, "sps_environment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setSps_environment:", v8);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CTTransportKeysReceipt stks](self, "stks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("tkey_value"));

  -[CTTransportKeysReceipt sps_environment](self, "sps_environment");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("sps_environment"));

}

- (CTTransportKeysReceipt)initWithCoder:(id)a3
{
  id v4;
  CTTransportKeysReceipt *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *stks;
  uint64_t v11;
  NSString *sps_environment;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CTTransportKeysReceipt;
  v5 = -[CTTransportKeysReceipt init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("tkey_value"));
    v9 = objc_claimAutoreleasedReturnValue();
    stks = v5->_stks;
    v5->_stks = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sps_environment"));
    v11 = objc_claimAutoreleasedReturnValue();
    sps_environment = v5->_sps_environment;
    v5->_sps_environment = (NSString *)v11;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)stks
{
  return self->_stks;
}

- (void)setStks:(id)a3
{
  objc_storeStrong((id *)&self->_stks, a3);
}

- (NSString)sps_environment
{
  return self->_sps_environment;
}

- (void)setSps_environment:(id)a3
{
  objc_storeStrong((id *)&self->_sps_environment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sps_environment, 0);
  objc_storeStrong((id *)&self->_stks, 0);
}

@end
