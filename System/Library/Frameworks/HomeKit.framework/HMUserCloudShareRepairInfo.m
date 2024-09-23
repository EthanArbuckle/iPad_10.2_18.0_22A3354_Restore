@implementation HMUserCloudShareRepairInfo

- (HMUserCloudShareRepairInfo)initWithIdentifier:(id)a3 version:(int64_t)a4
{
  id v7;
  HMUserCloudShareRepairInfo *v8;
  HMUserCloudShareRepairInfo *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMUserCloudShareRepairInfo;
  v8 = -[HMUserCloudShareRepairInfo init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_version = a4;
  }

  return v9;
}

- (HMUserCloudShareRepairInfo)init
{
  void *v3;
  HMUserCloudShareRepairInfo *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMUserCloudShareRepairInfo initWithIdentifier:version:](self, "initWithIdentifier:version:", v3, 1);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMUserCloudShareRepairInfo identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HMUserCloudShareRepairInfo version](self, "version"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("version"));

}

- (HMUserCloudShareRepairInfo)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  HMUserCloudShareRepairInfo *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = objc_msgSend(v6, "integerValue");
  else
    v7 = 1;
  v8 = -[HMUserCloudShareRepairInfo initWithIdentifier:version:](self, "initWithIdentifier:version:", v5, v7);

  return v8;
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
