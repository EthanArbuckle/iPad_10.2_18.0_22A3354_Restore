@implementation HMDResidentReachabilityContext

- (HMDResidentReachabilityContext)init
{
  return -[HMDResidentReachabilityContext initWithMostRecentReachability:](self, "initWithMostRecentReachability:", 0);
}

- (HMDResidentReachabilityContext)initWithMostRecentReachability:(id)a3
{
  id v5;
  HMDResidentReachabilityContext *v6;
  HMDResidentReachabilityContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDResidentReachabilityContext;
  v6 = -[HMDResidentReachabilityContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_mostRecentReachability, a3);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDResidentReachabilityContext mostRecentReachability](self, "mostRecentReachability");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMDResidentReachabilityContextCodingKeyMostRecentReachability"));

}

- (HMDResidentReachabilityContext)initWithCoder:(id)a3
{
  id v4;
  HMDResidentReachabilityContext *v5;
  uint64_t v6;
  NSNumber *mostRecentReachability;

  v4 = a3;
  v5 = -[HMDResidentReachabilityContext init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDResidentReachabilityContextCodingKeyMostRecentReachability"));
    v6 = objc_claimAutoreleasedReturnValue();
    mostRecentReachability = v5->_mostRecentReachability;
    v5->_mostRecentReachability = (NSNumber *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;
  if (v7)
  {
    -[HMDResidentReachabilityContext mostRecentReachability](self, "mostRecentReachability");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 || (objc_msgSend(v7, "mostRecentReachability"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[HMDResidentReachabilityContext mostRecentReachability](self, "mostRecentReachability");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mostRecentReachability");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqual:", v10);

      if (v8)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      v11 = 1;
    }

    goto LABEL_12;
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDResidentReachabilityContext mostRecentReachability](self, "mostRecentReachability");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSNumber)mostRecentReachability
{
  return (NSNumber *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostRecentReachability, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
