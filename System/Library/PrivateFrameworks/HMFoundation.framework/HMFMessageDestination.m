@implementation HMFMessageDestination

+ (NSUUID)allMessageTargets
{
  return (NSUUID *)objc_msgSend(MEMORY[0x1E0CB3A28], "hmf_zeroUUID");
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMFMessageDestination target](self, "target");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMF.target"));

}

- (NSUUID)target
{
  return self->_target;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_target, 0);
}

+ (HMFMessageDestination)allMessageDestinations
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc((Class)a1);
  +[HMFMessageDestination allMessageTargets](HMFMessageDestination, "allMessageTargets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithTarget:", v3);

  return (HMFMessageDestination *)v4;
}

- (HMFMessageDestination)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMFMessageDestination *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMF.target"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[HMFMessageDestination initWithTarget:](self, "initWithTarget:", v5);
    v6 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:reason:", 11, CFSTR("HMFMessageDestination.target is required"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v7);

    v6 = 0;
  }

  return v6;
}

- (HMFMessageDestination)initWithTarget:(id)a3
{
  id v5;
  HMFMessageDestination *v6;
  HMFMessageDestination *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMFMessageDestination;
  v6 = -[HMFMessageDestination init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_target, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMFMessageDestination target](self, "target");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMFMessageDestination *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (HMFMessageDestination *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[HMFMessageDestination target](self, "target");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMFMessageDestination target](v4, "target");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSString)shortDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFMessageDestination target](self, "target");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSArray)attributeDescriptions
{
  HMFAttributeDescription *v3;
  void *v4;
  void *v5;
  HMFAttributeDescription *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = [HMFAttributeDescription alloc];
  -[HMFMessageDestination target](self, "target");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMFAttributeDescription initWithName:value:](v3, "initWithName:value:", CFSTR("Target"), v5);
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

@end
