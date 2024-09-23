@implementation NUApplicationFrameworkAssembly

- (NSArray)assemblies
{
  return self->_assemblies;
}

- (NUApplicationFrameworkAssembly)init
{
  NUApplicationFrameworkAssembly *v2;
  NUCoreAssembly *v3;
  NUArticleAssembly *v4;
  NUApplicationAssembly *v5;
  NUManagerAssembly *v6;
  uint64_t v7;
  NSArray *assemblies;
  objc_super v10;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  v10.receiver = self;
  v10.super_class = (Class)NUApplicationFrameworkAssembly;
  v2 = -[NUApplicationFrameworkAssembly init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(NUCoreAssembly);
    v11[0] = v3;
    v4 = objc_alloc_init(NUArticleAssembly);
    v11[1] = v4;
    v5 = objc_alloc_init(NUApplicationAssembly);
    v11[2] = v5;
    v6 = objc_alloc_init(NUManagerAssembly);
    v11[3] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 4);
    v7 = objc_claimAutoreleasedReturnValue();
    assemblies = v2->_assemblies;
    v2->_assemblies = (NSArray *)v7;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assemblies, 0);
}

@end
