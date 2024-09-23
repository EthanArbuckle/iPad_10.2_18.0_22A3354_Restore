@implementation HMCConformanceCache

- (HMCConformanceCache)initWithProtocols:(id)a3
{
  id v4;
  HMCConformanceCache *v5;
  uint64_t v6;
  NSSet *protocols;
  uint64_t v8;
  NSMapTable *conformanceCache;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMCConformanceCache;
  v5 = -[HMCConformanceCache init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    protocols = v5->_protocols;
    v5->_protocols = (NSSet *)v6;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    conformanceCache = v5->_conformanceCache;
    v5->_conformanceCache = (NSMapTable *)v8;

    v5->_lock._os_unfair_lock_opaque = 0;
  }

  return v5;
}

- (HMCConformanceCache)initWithProtocol:(id)a3
{
  void *v4;
  HMCConformanceCache *v5;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMCConformanceCache initWithProtocols:](self, "initWithProtocols:", v4);

  return v5;
}

- (BOOL)classConforms:(Class)a3
{
  return __conformanceCheck(self, (uint64_t)a3, 0);
}

- (BOOL)objectConforms:(id)a3
{
  uint64_t v4;

  v4 = objc_opt_class();
  return __conformanceCheck(self, v4, 0);
}

- (void)refreshConformanceOf:(Class)a3
{
  __conformanceCheck(self, (uint64_t)a3, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conformanceCache, 0);
  objc_storeStrong((id *)&self->_protocols, 0);
}

@end
