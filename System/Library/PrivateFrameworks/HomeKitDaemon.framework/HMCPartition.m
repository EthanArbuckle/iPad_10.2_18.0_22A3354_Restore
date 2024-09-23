@implementation HMCPartition

- (HMCPartition)init
{
  HMCPartition *v2;
  HMCRedirector *v3;
  HMCRedirector *redirections;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMCPartition;
  v2 = -[HMCPartition init](&v6, sel_init);
  if (v2)
  {
    v3 = -[HMCRedirector initWithLabel:partition:]([HMCRedirector alloc], "initWithLabel:partition:", CFSTR("REDIR"), v2);
    redirections = v2->_redirections;
    v2->_redirections = v3;

  }
  return v2;
}

- (BOOL)modelBelongsToThisPartition:(id)a3
{
  return 1;
}

- (HMCRedirector)redirections
{
  return (HMCRedirector *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redirections, 0);
}

@end
