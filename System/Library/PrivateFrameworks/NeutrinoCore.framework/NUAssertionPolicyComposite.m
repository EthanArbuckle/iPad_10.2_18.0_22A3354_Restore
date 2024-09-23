@implementation NUAssertionPolicyComposite

- (NUAssertionPolicyComposite)init
{
  NUAssertionPolicyComposite *v2;
  NSMutableArray *v3;
  NSMutableArray *policies;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NUAssertionPolicyComposite;
  v2 = -[NUAssertionPolicyComposite init](&v6, sel_init);
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  policies = v2->_policies;
  v2->_policies = v3;

  return v2;
}

- (void)addPolicy:(id)a3
{
  -[NSMutableArray addObject:](self->_policies, "addObject:", a3);
}

- (void)notifyAssertion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NUAssertionPolicyComposite policies](self, "policies", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "notifyAssertion:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (NSArray)policies
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policies, 0);
}

@end
