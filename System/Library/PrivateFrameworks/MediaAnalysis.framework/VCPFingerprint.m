@implementation VCPFingerprint

- (VCPFingerprint)init
{

  return 0;
}

- (VCPFingerprint)initWithMaster:(id)a3 adjusted:(id)a4
{
  id v7;
  id v8;
  VCPFingerprint *v9;
  VCPFingerprint *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  if (v7
    && (v12.receiver = self,
        v12.super_class = (Class)VCPFingerprint,
        v9 = -[VCPFingerprint init](&v12, sel_init),
        (self = v9) != 0))
  {
    objc_storeStrong((id *)&v9->_master, a3);
    objc_storeStrong((id *)&self->_adjusted, a4);
    self = self;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)fingerprintWithMaster:(id)a3 adjusted:(id)a4
{
  id v5;
  id v6;
  VCPFingerprint *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[VCPFingerprint initWithMaster:adjusted:]([VCPFingerprint alloc], "initWithMaster:adjusted:", v5, v6);

  return v7;
}

- (BOOL)isEqualToFingerprint:(id)a3
{
  id v4;
  NSString *master;
  void *v6;
  NSString *adjusted;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  master = self->_master;
  objc_msgSend(v4, "master");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(master) = -[NSString isEqualToString:](master, "isEqualToString:", v6);

  if ((master & 1) != 0)
  {
    adjusted = self->_adjusted;
    if (!adjusted)
    {
      objc_msgSend(v4, "adjusted");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v10 = 1;
        goto LABEL_7;
      }
      adjusted = self->_adjusted;
    }
    objc_msgSend(v4, "adjusted");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[NSString isEqualToString:](adjusted, "isEqualToString:", v9);

  }
  else
  {
    v10 = 0;
  }
LABEL_7:

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ | %@"), self->_master, self->_adjusted);
}

- (NSString)master
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)adjusted
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adjusted, 0);
  objc_storeStrong((id *)&self->_master, 0);
}

@end
