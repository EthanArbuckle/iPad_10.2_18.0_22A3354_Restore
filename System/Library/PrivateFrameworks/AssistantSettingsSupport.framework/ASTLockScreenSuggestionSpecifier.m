@implementation ASTLockScreenSuggestionSpecifier

- (ASTLockScreenSuggestionSpecifier)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASTLockScreenSuggestionSpecifier;
  return -[ASTLockScreenSuggestionSpecifier init](&v5, sel_init, a3, a4);
}

- (id)specifiers
{
  NSSet *v3;
  NSSet *disabledLockScreenBundles;
  void (*v5)(void);
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (!self->_disabledLockScreenBundles)
  {
    ASTDisabledLockScreenBundles();
    v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
    disabledLockScreenBundles = self->_disabledLockScreenBundles;
    self->_disabledLockScreenBundles = v3;

  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v5 = (void (*)(void))getSBSCopyDisplayIdentifiersSymbolLoc_ptr;
  v24 = getSBSCopyDisplayIdentifiersSymbolLoc_ptr;
  if (!getSBSCopyDisplayIdentifiersSymbolLoc_ptr)
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke;
    v20[3] = &unk_24D33CD10;
    v20[4] = &v21;
    __getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke((uint64_t)v20);
    v5 = (void (*)(void))v22[3];
  }
  _Block_object_dispose(&v21, 8);
  if (!v5)
    -[ASTLockScreenSuggestionSpecifier specifiers].cold.1();
  v5();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v7);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v9);
        -[ASTLockScreenSuggestionSpecifier specifierForBundleID:](self, "specifierForBundleID:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v8, "addObject:", v13);

      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v25, 16);
    }
    while (v10);
  }

  objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __46__ASTLockScreenSuggestionSpecifier_specifiers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (id)specifierForBundleID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_7;
  objc_msgSend(v4, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "length"))
  {
    objc_msgSend(v4, "localizedShortName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "length"))
    {
      v6 = v7;
      goto LABEL_6;
    }
    objc_msgSend(v4, "itemName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_6;
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
LABEL_6:
  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, self, sel_setLockScreenSwitchEnabled_forSpecifier_, sel_isLockScreenSwitchEnabled_, 0, 6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProperty:forKey:", v6, CFSTR("APP_NAME"));
  objc_msgSend(v4, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProperty:forKey:", v9, CFSTR("BUNDLE_ID"));

  objc_msgSend(v8, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE75B88]);
  objc_msgSend(v4, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProperty:forKey:", v10, *MEMORY[0x24BE75B70]);

LABEL_8:
  return v8;
}

- (id)isLockScreenSwitchEnabled:(id)a3
{
  void *v3;
  NSSet *disabledLockScreenBundles;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  disabledLockScreenBundles = self->_disabledLockScreenBundles;
  objc_msgSend(a3, "propertyForKey:", CFSTR("BUNDLE_ID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithInt:", -[NSSet containsObject:](disabledLockScreenBundles, "containsObject:", v5) ^ 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setLockScreenSwitchEnabled:(id)a3 forSpecifier:(id)a4
{
  id v6;
  NSSet *v7;
  NSSet *disabledLockScreenBundles;

  v6 = a4;
  ASTSetLockScreenEnabled(objc_msgSend(a3, "BOOLValue"), v6);

  ASTDisabledLockScreenBundles();
  v7 = (NSSet *)objc_claimAutoreleasedReturnValue();
  disabledLockScreenBundles = self->_disabledLockScreenBundles;
  self->_disabledLockScreenBundles = v7;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledLockScreenBundles, 0);
}

- (void)specifiers
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CFSetRef PSSBSCopyDisplayIdentifiers(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ASTLockScreenSuggestionSpecifier.m"), 18, CFSTR("%s"), dlerror());

  __break(1u);
}

@end
