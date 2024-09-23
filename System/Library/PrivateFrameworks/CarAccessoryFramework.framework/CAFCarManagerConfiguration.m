@implementation CAFCarManagerConfiguration

- (CAFCarManagerConfiguration)init
{
  CAFCarManagerConfiguration *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAFCarManagerConfiguration;
  v2 = -[CAFCarManagerConfiguration init](&v4, sel_init);
  if (v2)
    v2->_sparseTree = CAFDefaultsGetBoolean(CFSTR("sparseTree"), 1);
  return v2;
}

- (id)description
{
  void *v2;
  _BOOL4 v3;
  const __CFString *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = -[CAFCarManagerConfiguration sparseTree](self, "sparseTree");
  v4 = CFSTR("NO");
  if (v3)
    v4 = CFSTR("YES");
  return (id)objc_msgSend(v2, "stringWithFormat:", CFSTR("sparseTree=%@"), v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  CAFCarManagerConfiguration *v4;
  void *v5;

  v4 = -[CAFCarManagerConfiguration init](+[CAFCarManagerConfiguration allocWithZone:](CAFCarManagerConfiguration, "allocWithZone:", a3), "init");
  -[CAFCarManagerConfiguration registrations](self, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFCarManagerConfiguration setRegistrations:](v4, "setRegistrations:", v5);

  -[CAFCarManagerConfiguration setSparseTree:](v4, "setSparseTree:", -[CAFCarManagerConfiguration sparseTree](self, "sparseTree"));
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  CAFCarManagerMutableConfiguration *v4;
  void *v5;

  v4 = -[CAFCarManagerConfiguration init](+[CAFCarManagerMutableConfiguration allocWithZone:](CAFCarManagerMutableConfiguration, "allocWithZone:", a3), "init");
  -[CAFCarManagerConfiguration registrations](self, "registrations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAFCarManagerConfiguration setRegistrations:](v4, "setRegistrations:", v5);

  -[CAFCarManagerConfiguration setSparseTree:](v4, "setSparseTree:", -[CAFCarManagerConfiguration sparseTree](self, "sparseTree"));
  return v4;
}

- (CAFASCTree)registrations
{
  return self->_registrations;
}

- (void)setRegistrations:(id)a3
{
  objc_storeStrong((id *)&self->_registrations, a3);
}

- (BOOL)sparseTree
{
  return self->_sparseTree;
}

- (void)setSparseTree:(BOOL)a3
{
  self->_sparseTree = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrations, 0);
}

@end
