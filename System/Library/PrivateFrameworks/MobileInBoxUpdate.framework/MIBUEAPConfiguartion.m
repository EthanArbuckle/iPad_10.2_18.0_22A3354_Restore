@implementation MIBUEAPConfiguartion

- (MIBUEAPConfiguartion)init
{
  MIBUEAPConfiguartion *v2;
  MIBUEAPConfiguartion *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MIBUEAPConfiguartion;
  v2 = -[MIBUEAPConfiguartion init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_tlsKey = 0;
    v4 = (void *)objc_opt_new();
    -[MIBUEAPConfiguartion setTlsCertificateChain:](v3, "setTlsCertificateChain:", v4);

  }
  return v3;
}

- (void)setTLSKey:(__SecKey *)a3
{
  self->_tlsKey = a3;
}

- (__SecKey)tlsKey
{
  return self->_tlsKey;
}

- (NSArray)tlsCertificateChain
{
  return self->_tlsCertificateChain;
}

- (void)setTlsCertificateChain:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tlsCertificateChain, 0);
}

@end
