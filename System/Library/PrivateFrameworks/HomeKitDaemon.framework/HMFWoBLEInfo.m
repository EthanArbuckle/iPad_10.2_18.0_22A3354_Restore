@implementation HMFWoBLEInfo

- (HMFWoBLEInfo)initWithBLEIdentifier:(id)a3
{
  id v5;
  HMFWoBLEInfo *v6;
  HMFWoBLEInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMFWoBLEInfo;
  v6 = -[HMFWoBLEInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bleIdentifier, a3);

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMFWoBLEInfo bleIdentifier](self, "bleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMFWoBLEInfo *v4;
  HMFWoBLEInfo *v5;
  HMFWoBLEInfo *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMFWoBLEInfo *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMFWoBLEInfo bleIdentifier](self, "bleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFWoBLEInfo bleIdentifier](v6, "bleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = HMFEqualObjects();

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMFWoBLEInfo bleIdentifier](self, "bleIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMFCI.woBLE.ID"));

}

- (HMFWoBLEInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMFWoBLEInfo *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMFCI.woBLE.ID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HMFWoBLEInfo initWithBLEIdentifier:](self, "initWithBLEIdentifier:", v5);
  return v6;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMFWoBLEInfo bleIdentifier](self, "bleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<BTLE Identifier: %@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSData)bleIdentifier
{
  return self->_bleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bleIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
