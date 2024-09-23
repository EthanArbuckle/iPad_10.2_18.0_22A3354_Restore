@implementation NUExtensionFrameworkAssembly

- (NUExtensionFrameworkAssembly)initWithExtensionContextProvider:(id)a3
{
  id v4;
  NUExtensionFrameworkAssembly *v5;
  NSArray *v6;
  id v7;
  void *v8;
  NUCoreAssembly *v9;
  NUArticleAssembly *v10;
  NUExtensionAssembly *v11;
  NUManagerAssembly *v12;
  void *v13;
  NSArray *assemblies;
  objc_super v16;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NUExtensionFrameworkAssembly;
  v5 = -[NUExtensionFrameworkAssembly init](&v16, sel_init);
  if (v5)
  {
    v6 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = objc_alloc_init(MEMORY[0x24BE906D0]);
    objc_msgSend(v7, "assemblies");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v6, "addObjectsFromArray:", v8);

    v9 = objc_alloc_init(NUCoreAssembly);
    v17[0] = v9;
    v10 = objc_alloc_init(NUArticleAssembly);
    v17[1] = v10;
    v11 = -[NUExtensionAssembly initWithExtensionContextProvider:]([NUExtensionAssembly alloc], "initWithExtensionContextProvider:", v4);
    v17[2] = v11;
    v12 = objc_alloc_init(NUManagerAssembly);
    v17[3] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObjectsFromArray:](v6, "addObjectsFromArray:", v13);

    assemblies = v5->_assemblies;
    v5->_assemblies = v6;

  }
  return v5;
}

- (NSArray)assemblies
{
  return self->_assemblies;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assemblies, 0);
}

@end
