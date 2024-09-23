@implementation AXSSDocumentTextRulesetManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__AXSSDocumentTextRulesetManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once != -1)
    dispatch_once(&sharedManager_once, block);
  return (id)sharedManager_sharedInstance;
}

void __47__AXSSDocumentTextRulesetManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedInstance;
  sharedManager_sharedInstance = (uint64_t)v1;

}

- (AXSSDocumentTextRulesetManager)init
{
  AXSSDocumentTextRulesetManager *v2;
  uint64_t v3;
  NSMutableArray *rulesets;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AXSSDocumentTextRulesetManager;
  v2 = -[AXSSDocumentTextRulesetManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    rulesets = v2->__rulesets;
    v2->__rulesets = (NSMutableArray *)v3;

    -[AXSSDocumentTextRulesetManager loadRulesets](v2, "loadRulesets");
  }
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v18.receiver = self;
  v18.super_class = (Class)AXSSDocumentTextRulesetManager;
  -[AXSSDocumentTextRulesetManager description](&v18, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[AXSSDocumentTextRulesetManager _rulesets](self, "_rulesets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "allRules");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8 += objc_msgSend(v11, "count");

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  -[AXSSDocumentTextRulesetManager _rulesets](self, "_rulesets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" RuleSets:%li Rules:%li"), objc_msgSend(v12, "count"), v8);

  return v3;
}

- (NSArray)rulesets
{
  void *v2;
  void *v3;

  -[AXSSDocumentTextRulesetManager _rulesets](self, "_rulesets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (void)_loadCustomRulesets
{
  AXSSDocumentTextRuleset *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(AXSSDocumentTextRuleset);
  -[AXSSDocumentTextRuleset setName:](v3, "setName:", CFSTR("custom"));
  v18[0] = objc_opt_class();
  v18[1] = objc_opt_class();
  v18[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 3);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_alloc_init(*(Class *)(*((_QWORD *)&v13 + 1) + 8 * v8));
        if (v9)
          -[AXSSDocumentTextRuleset addRule:](v3, "addRule:", v9, (_QWORD)v13);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  -[AXSSDocumentTextRuleset allRules](v3, "allRules");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    -[AXSSDocumentTextRulesetManager _rulesets](self, "_rulesets");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v3);

  }
}

- (NSMutableArray)_rulesets
{
  return self->__rulesets;
}

- (void)set_rulesets:(id)a3
{
  objc_storeStrong((id *)&self->__rulesets, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__rulesets, 0);
}

@end
