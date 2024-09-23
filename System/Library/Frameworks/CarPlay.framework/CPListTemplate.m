@implementation CPListTemplate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSUInteger)maximumItemCount
{
  if ((CPCurrentProcessHasAudioEntitlement() & 1) != 0 || (CPCurrentProcessHasPublicSafetyEntitlement() & 1) != 0)
    return 500;
  if ((CPCurrentProcessHasCommunicationEntitlement() & 1) != 0)
    return 24;
  if (CPCurrentProcessHasMapsEntitlement())
    return 24;
  return 12;
}

+ (NSUInteger)maximumSectionCount
{
  return 200;
}

- (id)_sectionsByTrimmingAndLinkingSections:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  CPListTemplate *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  SEL v19;
  _QWORD v20[4];
  _QWORD v21[4];

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  v7 = objc_msgSend((id)objc_opt_class(), "maximumSectionCount");
  v8 = objc_msgSend((id)objc_opt_class(), "maximumItemCount");
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56__CPListTemplate__sectionsByTrimmingAndLinkingSections___block_invoke;
  v12[3] = &unk_24C77D4B0;
  v15 = v20;
  v16 = v21;
  v17 = v7;
  v18 = v8;
  v19 = a2;
  v9 = v6;
  v13 = v9;
  v14 = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v12);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v21, 8);

  return v10;
}

void __56__CPListTemplate__sectionsByTrimmingAndLinkingSections___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  const char *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;

  v7 = a2;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= *(_QWORD *)(a1 + 64)
    || *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) >= *(_QWORD *)(a1 + 72))
  {
    *a4 = 1;
  }
  else
  {
    v26 = v7;
    v8 = objc_opt_class();
    v9 = *(const char **)(a1 + 80);
    v10 = v26;
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    if ((objc_msgSend(v11, "containsObject:", object_getClass(v12)) & 1) == 0)
    {
      v13 = (void *)MEMORY[0x24BDBCE88];
      v14 = *MEMORY[0x24BDBCAB8];
      NSStringFromSelector(v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "raise:format:", v14, CFSTR("Unsupported object %@ passed to %@. Allowed classes: %@"), v12, v15, v11, 0);

    }
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    objc_msgSend(v12, "items");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count") + v16;
    v19 = *(_QWORD *)(a1 + 72);

    if (v18 > v19)
    {
      v20 = *(_QWORD *)(a1 + 72) - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      if (v20 >= 1)
      {
        objc_msgSend(v12, "items");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "subarrayWithRange:", 0, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "replaceItems:", v22);

      }
    }
    objc_msgSend(v12, "items");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "count"))
    {

LABEL_12:
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v12);
      objc_msgSend(v12, "items");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += objc_msgSend(v25, "count");

      objc_msgSend(v12, "setIndex:", a3);
      objc_msgSend(*(id *)(a1 + 40), "_linkItemsInSection:", v12);
      v7 = v26;
      goto LABEL_13;
    }
    v24 = objc_msgSend(v12, "sectionHeaderStyle");

    v7 = v26;
    if (v24 == 2)
      goto LABEL_12;
  }
LABEL_13:

}

- (CPListTemplate)initWithTitle:(NSString *)title sections:(NSArray *)sections
{
  NSString *v7;
  NSArray *v8;
  CPListTemplate *v9;
  uint64_t v10;
  NSMutableSet *itemsToReload;
  uint64_t v12;
  NSArray *v13;
  objc_super v15;

  v7 = title;
  v8 = sections;
  v15.receiver = self;
  v15.super_class = (Class)CPListTemplate;
  v9 = -[CPTemplate init](&v15, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    itemsToReload = v9->_itemsToReload;
    v9->_itemsToReload = (NSMutableSet *)v10;

    objc_storeStrong((id *)&v9->_title, title);
    -[CPListTemplate _sectionsByTrimmingAndLinkingSections:](v9, "_sectionsByTrimmingAndLinkingSections:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v9->_sections;
    v9->_sections = (NSArray *)v12;

  }
  return v9;
}

- (CPListTemplate)initWithTitle:(NSString *)title sections:(NSArray *)sections assistantCellConfiguration:(CPAssistantCellConfiguration *)assistantCellConfiguration
{
  CPAssistantCellConfiguration *v9;
  CPListTemplate *v10;
  CPListTemplate *v11;
  NSObject *v12;
  uint8_t v14[16];

  v9 = assistantCellConfiguration;
  v10 = -[CPListTemplate initWithTitle:sections:](self, "initWithTitle:sections:", title, sections);
  v11 = v10;
  if (v10)
  {
    if (v9)
    {
      objc_storeStrong((id *)&v10->_assistantCellConfiguration, assistantCellConfiguration);
    }
    else
    {
      CarPlayFrameworkGeneralLogging();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_20D6F4000, v12, OS_LOG_TYPE_INFO, "No assistant cell configuration", v14, 2u);
      }

    }
  }

  return v11;
}

- (CPListTemplate)initWithCoder:(id)a3
{
  id v4;
  CPListTemplate *v5;
  uint64_t v6;
  NSMutableSet *itemsToReload;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSArray *sections;
  uint64_t v16;
  NSString *title;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *emptyViewTitleVariants;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSArray *emptyViewSubtitleVariants;
  uint64_t v28;
  CPAssistantCellConfiguration *assistantCellConfiguration;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)CPListTemplate;
  v5 = -[CPTemplate initWithCoder:](&v31, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v6 = objc_claimAutoreleasedReturnValue();
    itemsToReload = v5->_itemsToReload;
    v5->_itemsToReload = (NSMutableSet *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("kCPListTemplateSectionsKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    sections = v5->_sections;
    v5->_sections = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPListTemplateTitleKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v16;

    v18 = (void *)MEMORY[0x24BDBCF20];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("kCPListTemplateEmptyTitlesKey"));
    v21 = objc_claimAutoreleasedReturnValue();
    emptyViewTitleVariants = v5->_emptyViewTitleVariants;
    v5->_emptyViewTitleVariants = (NSArray *)v21;

    v23 = (void *)MEMORY[0x24BDBCF20];
    v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("kCPListTemplateEmptySubtitlesKey"));
    v26 = objc_claimAutoreleasedReturnValue();
    emptyViewSubtitleVariants = v5->_emptyViewSubtitleVariants;
    v5->_emptyViewSubtitleVariants = (NSArray *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPAssistantCellConfigurationKey"));
    v28 = objc_claimAutoreleasedReturnValue();
    assistantCellConfiguration = v5->_assistantCellConfiguration;
    v5->_assistantCellConfiguration = (CPAssistantCellConfiguration *)v28;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CPListTemplate;
  v4 = a3;
  -[CPTemplate encodeWithCoder:](&v10, sel_encodeWithCoder_, v4);
  -[CPListTemplate sections](self, "sections", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCPListTemplateSectionsKey"));

  -[CPListTemplate title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCPListTemplateTitleKey"));

  -[CPListTemplate emptyViewTitleVariants](self, "emptyViewTitleVariants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kCPListTemplateEmptyTitlesKey"));

  -[CPListTemplate emptyViewSubtitleVariants](self, "emptyViewSubtitleVariants");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("kCPListTemplateEmptySubtitlesKey"));

  -[CPListTemplate assistantCellConfiguration](self, "assistantCellConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("kCPAssistantCellConfigurationKey"));

}

- (void)updateSections:(NSArray *)sections
{
  NSArray *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  CPListTemplate *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = sections;
  -[CPListTemplate _sectionsByTrimmingAndLinkingSections:](self, "_sectionsByTrimmingAndLinkingSections:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CarPlayFrameworkGeneralLogging();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v12 = self;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_20D6F4000, v6, OS_LOG_TYPE_DEFAULT, "%@ enqueuing list update with %@", buf, 0x16u);
  }

  objc_storeStrong((id *)&self->_sections, v5);
  objc_initWeak((id *)buf, self);
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __33__CPListTemplate_updateSections___block_invoke;
  v9[3] = &unk_24C77D4D8;
  objc_copyWeak(&v10, (id *)buf);
  v8 = (id)objc_msgSend(v7, "addSuccessBlock:", v9);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);

}

void __33__CPListTemplate_updateSections___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  CarPlayFrameworkGeneralLogging();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_loadWeakRetained(v2);
    v7 = (void *)MEMORY[0x24BDD16E0];
    v8 = v6;
    objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "sectionCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDD16E0];
    v11 = objc_loadWeakRetained(v2);
    objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "itemCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 138412802;
    v14 = v6;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_20D6F4000, v5, OS_LOG_TYPE_DEFAULT, "%@ sending section update with %@ sections, %@ items", (uint8_t *)&v13, 0x20u);

  }
  objc_msgSend(v3, "reloadTemplate:", WeakRetained);

}

- (NSUInteger)sectionCount
{
  return -[NSArray count](self->_sections, "count");
}

- (NSUInteger)itemCount
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_sections;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "items", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 += objc_msgSend(v8, "count");

      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)updateHeaderImage:(id)a3 forSectionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __57__CPListTemplate_updateHeaderImage_forSectionIdentifier___block_invoke;
  v12[3] = &unk_24C77D500;
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  v11 = (id)objc_msgSend(v8, "addSuccessBlock:", v12);

}

uint64_t __57__CPListTemplate_updateHeaderImage_forSectionIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateSectionHeaderImage:forSectionIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (NSIndexPath)indexPathForItem:(id)item
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = item;
  if (-[CPListTemplate sectionCount](self, "sectionCount"))
  {
    v5 = 0;
    while (1)
    {
      -[NSArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "indexOfItem:", v4);

      if (v7 != 0x7FFFFFFFFFFFFFFFLL)
        break;
      if (++v5 >= -[CPListTemplate sectionCount](self, "sectionCount"))
        goto LABEL_5;
    }
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v7, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_5:
    v8 = 0;
  }

  return (NSIndexPath *)v8;
}

- (void)_linkItemsInSection:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  objc_msgSend(v4, "setListTemplate:", self);
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __38__CPListTemplate__linkItemsInSection___block_invoke;
  v6[3] = &unk_24C77D528;
  v6[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

void __38__CPListTemplate__linkItemsInSection___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_2549DAC20))
    objc_msgSend(v3, "setListTemplate:", *(_QWORD *)(a1 + 32));

}

- (void)_setItemNeedsUpdate:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CPListTemplate itemsToReload](self, "itemsToReload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[CPTemplate setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)performUpdate
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  CPListTemplate *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[CPListTemplate itemsToReload](self, "itemsToReload");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    CarPlayFrameworkGeneralLogging();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[CPListTemplate itemsToReload](self, "itemsToReload");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = self;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_20D6F4000, v5, OS_LOG_TYPE_DEFAULT, "Sending List Template update for %@ with %@", buf, 0x16u);

    }
    -[CPListTemplate itemsToReload](self, "itemsToReload");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __31__CPListTemplate_performUpdate__block_invoke;
    v13[3] = &unk_24C77D550;
    v14 = v8;
    v10 = v8;
    v11 = (id)objc_msgSend(v9, "addSuccessBlock:", v13);

    -[CPListTemplate itemsToReload](self, "itemsToReload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeAllObjects");

  }
}

uint64_t __31__CPListTemplate_performUpdate__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "reloadItems:", *(_QWORD *)(a1 + 32));
}

- (id)_itemForHostItemWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  -[CPListTemplate sections](self, "sections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__CPListTemplate__itemForHostItemWithIdentifier___block_invoke;
  v11[3] = &unk_24C77D5A0;
  v6 = v4;
  v12 = v6;
  v13 = &v14;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);

  v7 = (void *)v15[5];
  if (!v7)
  {
    CarPlayFrameworkGeneralLogging();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v6;
      _os_log_impl(&dword_20D6F4000, v8, OS_LOG_TYPE_INFO, "Failed to identify a local item for %@", buf, 0xCu);
    }

    v7 = (void *)v15[5];
  }
  v9 = v7;

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __49__CPListTemplate__itemForHostItemWithIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(a2, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__CPListTemplate__itemForHostItemWithIdentifier___block_invoke_2;
  v9[3] = &unk_24C77D578;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v10 = v7;
  v11 = v8;
  v12 = a4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

}

void __49__CPListTemplate__itemForHostItemWithIdentifier___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(v9, "conformsToProtocol:", &unk_2549DAC20))
  {
    objc_msgSend(v9, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    **(_BYTE **)(a1 + 48) = 1;
    *a4 = 1;
  }

}

- (CPListTemplate)listTemplateWithIdentifier:(id)a3 didSelectListItemWithIdentifier:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  CPListTemplate *result;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __95__CPListTemplate_listTemplateWithIdentifier_didSelectListItemWithIdentifier_completionHandler___block_invoke;
  block[3] = &unk_24C77D5C8;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v9 = v8;
  v10 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  return result;
}

void __95__CPListTemplate_listTemplateWithIdentifier_didSelectListItemWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  void *v9;
  char v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  CarPlayFrameworkGeneralLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v11 = 138412546;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_20D6F4000, v2, OS_LOG_TYPE_INFO, "%@ didSelectListItemWithIdentifier %@", (uint8_t *)&v11, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_itemForHostItemWithIdentifier:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "conformsToProtocol:", &unk_2549DAEF0))
  {
    v6 = v5;
    objc_msgSend(v6, "handler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "handler");
      v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, _QWORD))v8)[2](v8, v6, *(_QWORD *)(a1 + 48));

LABEL_9:
      goto LABEL_10;
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "listTemplate:didSelectListItem:completionHandler:", *(_QWORD *)(a1 + 32), v5, *(_QWORD *)(a1 + 48));
    goto LABEL_9;
  }
LABEL_10:

}

- (CPListTemplate)listTemplateWithIdentifier:(id)a3 didSelectImageAtIndex:(unint64_t)a4 inImageRowItemWithIdentifier:(id)a5
{
  id v7;
  id v8;
  CPListTemplate *result;
  _QWORD block[5];
  id v11;
  unint64_t v12;

  v7 = a5;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __96__CPListTemplate_listTemplateWithIdentifier_didSelectImageAtIndex_inImageRowItemWithIdentifier___block_invoke;
  block[3] = &unk_24C77D0F0;
  block[4] = self;
  v11 = v7;
  v12 = a4;
  v8 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  return result;
}

void __96__CPListTemplate_listTemplateWithIdentifier_didSelectImageAtIndex_inImageRowItemWithIdentifier___block_invoke(uint64_t a1)
{
  char isKindOfClass;
  void *v3;
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "_itemForHostItemWithIdentifier:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v3 = v7;
  if ((isKindOfClass & 1) != 0)
  {
    v4 = v7;
    objc_msgSend(v4, "listImageRowHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "listImageRowHandler");
      v6 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, _QWORD, void *))v6)[2](v6, v4, *(_QWORD *)(a1 + 48), &__block_literal_global_8);

    }
    v3 = v7;
  }

}

- (void)setAssistantCellConfiguration:(CPAssistantCellConfiguration *)assistantCellConfiguration
{
  CPAssistantCellConfiguration *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  CPAssistantCellConfiguration *v11;

  v5 = assistantCellConfiguration;
  -[CPListTemplate assistantCellConfiguration](self, "assistantCellConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v5);

  if ((v7 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_assistantCellConfiguration, assistantCellConfiguration);
    if ((CPCurrentProcessHasAudioEntitlement() & 1) != 0 || CPCurrentProcessHasCommunicationEntitlement())
    {
      -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __48__CPListTemplate_setAssistantCellConfiguration___block_invoke;
      v10[3] = &unk_24C77D550;
      v11 = v5;
      v9 = (id)objc_msgSend(v8, "addSuccessBlock:", v10);

    }
  }

}

uint64_t __48__CPListTemplate_setAssistantCellConfiguration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateAssistantCellConfiguration:withCompletion:", *(_QWORD *)(a1 + 32), &__block_literal_global_136);
}

void __48__CPListTemplate_setAssistantCellConfiguration___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v4;
  void *v5;
  _QWORD block[4];
  id v7;

  v4 = a3;
  v5 = v4;
  if ((a2 & 1) == 0)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __48__CPListTemplate_setAssistantCellConfiguration___block_invoke_3;
    block[3] = &unk_24C77C5B0;
    v7 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

void __48__CPListTemplate_setAssistantCellConfiguration___block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BDBCE88];
  v2 = *MEMORY[0x24BDBCA98];
  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDD0FC8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "raise:format:", v2, CFSTR("Error: %@"), v4);

  exit(-1);
}

- (void)handleActionForControlIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __51__CPListTemplate_handleActionForControlIdentifier___block_invoke;
  v6[3] = &unk_24C77C8C8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __51__CPListTemplate_handleActionForControlIdentifier___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__4;
  v27 = __Block_byref_object_dispose__4;
  v28 = 0;
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "sections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v35, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v7, "headerButton");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_msgSend(v7, "headerButton");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v9);

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v35, 16);
    }
    while (v4);
  }

  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __51__CPListTemplate_handleActionForControlIdentifier___block_invoke_2;
  v16[3] = &unk_24C77D610;
  v17 = *(id *)(a1 + 40);
  v18 = &v23;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v16);
  if (v24[5])
  {
    CarPlayFrameworkGeneralLogging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = v24[5];
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v30 = v12;
      v31 = 2112;
      v32 = v11;
      v33 = 2112;
      v34 = v13;
      _os_log_impl(&dword_20D6F4000, v10, OS_LOG_TYPE_INFO, "%@: Activated button: %@ for control identifier: %@", buf, 0x20u);
    }

    objc_msgSend((id)v24[5], "handlePrimaryAction");
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 40);
    v15.receiver = *(id *)(a1 + 32);
    v15.super_class = (Class)CPListTemplate;
    objc_msgSendSuper2(&v15, sel_handleActionForControlIdentifier_, v14);
  }

  _Block_object_dispose(&v23, 8);
}

void __51__CPListTemplate_handleActionForControlIdentifier___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (NSArray)sections
{
  return self->_sections;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)emptyViewTitleVariants
{
  return self->_emptyViewTitleVariants;
}

- (void)setEmptyViewTitleVariants:(NSArray *)emptyViewTitleVariants
{
  objc_setProperty_nonatomic_copy(self, a2, emptyViewTitleVariants, 128);
}

- (NSArray)emptyViewSubtitleVariants
{
  return self->_emptyViewSubtitleVariants;
}

- (void)setEmptyViewSubtitleVariants:(NSArray *)emptyViewSubtitleVariants
{
  objc_setProperty_nonatomic_copy(self, a2, emptyViewSubtitleVariants, 136);
}

- (CPAssistantCellConfiguration)assistantCellConfiguration
{
  return self->_assistantCellConfiguration;
}

- (NSMutableSet)itemsToReload
{
  return self->_itemsToReload;
}

- (void)setItemsToReload:(id)a3
{
  objc_storeStrong((id *)&self->_itemsToReload, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemsToReload, 0);
  objc_storeStrong((id *)&self->_assistantCellConfiguration, 0);
  objc_storeStrong((id *)&self->_emptyViewSubtitleVariants, 0);
  objc_storeStrong((id *)&self->_emptyViewTitleVariants, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
