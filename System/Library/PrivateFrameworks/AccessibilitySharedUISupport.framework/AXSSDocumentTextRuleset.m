@implementation AXSSDocumentTextRuleset

- (AXSSDocumentTextRuleset)init
{
  AXSSDocumentTextRuleset *v2;
  uint64_t v3;
  NSMutableArray *rules;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXSSDocumentTextRuleset;
  v2 = -[AXSSDocumentTextRuleset init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    rules = v2->__rules;
    v2->__rules = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)addRule:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXSSDocumentTextRuleset _rules](self, "_rules");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (NSArray)allRules
{
  void *v2;
  void *v3;

  -[AXSSDocumentTextRuleset _rules](self, "_rules");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (id)rulesForGranularity:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[AXSSDocumentTextRuleset allRules](self, "allRules", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "granularity") == a3)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMutableArray)_rules
{
  return self->__rules;
}

- (void)set_rules:(id)a3
{
  objc_storeStrong((id *)&self->__rules, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__rules, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
