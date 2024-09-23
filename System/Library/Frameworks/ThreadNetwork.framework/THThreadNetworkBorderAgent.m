@implementation THThreadNetworkBorderAgent

- (THThreadNetworkBorderAgent)initWithBaDiscrId:(id)a3
{
  id v4;
  void *v5;
  THThreadNetworkBorderAgent *v6;
  uint64_t v7;
  NSData *discriminatorId;
  THThreadNetworkBorderAgent *v9;
  objc_super v11;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length") != 8)
  {
    v9 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)THThreadNetworkBorderAgent;
    v6 = -[THThreadNetworkBorderAgent init](&v11, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(v5, "copy");
      discriminatorId = v6->_discriminatorId;
      v6->_discriminatorId = (NSData *)v7;

    }
    self = v6;
    v9 = self;
  }

  return v9;
}

- (THThreadNetworkBorderAgent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  THThreadNetworkBorderAgent *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ba"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[THThreadNetworkBorderAgent initWithBaDiscrId:](self, "initWithBaDiscrId:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[THThreadNetworkBorderAgent discriminatorId](self, "discriminatorId");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ba"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSData)discriminatorId
{
  return self->_discriminatorId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_discriminatorId, 0);
}

@end
