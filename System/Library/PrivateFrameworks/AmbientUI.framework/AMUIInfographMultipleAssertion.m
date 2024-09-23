@implementation AMUIInfographMultipleAssertion

- (AMUIInfographMultipleAssertion)initWithAssertions:(id)a3
{
  id v4;
  AMUIInfographMultipleAssertion *v5;
  uint64_t v6;
  NSArray *assertions;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMUIInfographMultipleAssertion;
  v5 = -[AMUIInfographMultipleAssertion init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    assertions = v5->_assertions;
    v5->_assertions = (NSArray *)v6;

  }
  return v5;
}

- (void)invalidate
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[AMUIInfographMultipleAssertion assertions](self, "assertions", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "invalidate");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (NSArray)assertions
{
  return self->_assertions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertions, 0);
}

@end
