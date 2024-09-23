@implementation CPTemplate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPTemplate)init
{
  CPTemplate *v2;
  uint64_t v3;
  NSUUID *identifier;
  uint64_t v5;
  NSArray *internalLeadingBarButtons;
  uint64_t v7;
  NSArray *internalTrailingBarButtons;
  NAFuture *v9;
  NAFuture *templateProviderFuture;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CPTemplate;
  v2 = -[CPTemplate init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;

    v5 = objc_opt_new();
    internalLeadingBarButtons = v2->_internalLeadingBarButtons;
    v2->_internalLeadingBarButtons = (NSArray *)v5;

    v7 = objc_opt_new();
    internalTrailingBarButtons = v2->_internalTrailingBarButtons;
    v2->_internalTrailingBarButtons = (NSArray *)v7;

    v9 = (NAFuture *)objc_alloc_init(MEMORY[0x24BE6B608]);
    templateProviderFuture = v2->_templateProviderFuture;
    v2->_templateProviderFuture = v9;

  }
  return v2;
}

- (CPTemplate)initWithCoder:(id)a3
{
  id v4;
  CPTemplate *v5;
  uint64_t v6;
  NSUUID *identifier;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *internalLeadingBarButtons;
  uint64_t v14;
  NSArray *internalTrailingBarButtons;
  uint64_t v16;
  CPBarButton *backButton;
  uint64_t v18;
  NSString *tabTitle;
  uint64_t v20;
  UIImage *tabImage;
  void *v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CPTemplate;
  v5 = -[CPTemplate init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPTemplateIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSUUID *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("CPTemplateLeadingNavigationBarButtons"));
    v12 = objc_claimAutoreleasedReturnValue();
    internalLeadingBarButtons = v5->_internalLeadingBarButtons;
    v5->_internalLeadingBarButtons = (NSArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("CPTemplateTrailingNavigationBarButtons"));
    v14 = objc_claimAutoreleasedReturnValue();
    internalTrailingBarButtons = v5->_internalTrailingBarButtons;
    v5->_internalTrailingBarButtons = (NSArray *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPTemplateNavigationBarBackButtonKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    backButton = v5->_backButton;
    v5->_backButton = (CPBarButton *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPTemplateTabTitleKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    tabTitle = v5->_tabTitle;
    v5->_tabTitle = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CPTemplateTabImageKey"));
    v20 = objc_claimAutoreleasedReturnValue();
    tabImage = v5->_tabImage;
    v5->_tabImage = (UIImage *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPTemplateTabSystemItemKey"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_tabSystemItem = objc_msgSend(v22, "unsignedIntegerValue");

    v5->_showsTabBadge = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("kCPTemplateTabBadgeKey"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[CPTemplate identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("CPTemplateIdentifier"));

  -[CPTemplate internalLeadingBarButtons](self, "internalLeadingBarButtons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("CPTemplateLeadingNavigationBarButtons"));

  -[CPTemplate internalTrailingBarButtons](self, "internalTrailingBarButtons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("CPTemplateTrailingNavigationBarButtons"));

  -[CPTemplate backButton](self, "backButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("kCPTemplateNavigationBarBackButtonKey"));

  -[CPTemplate tabTitle](self, "tabTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("CPTemplateTabTitleKey"));

  -[CPTemplate tabImage](self, "tabImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("CPTemplateTabImageKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[CPTemplate tabSystemItem](self, "tabSystemItem"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("kCPTemplateTabSystemItemKey"));

  objc_msgSend(v11, "encodeBool:forKey:", -[CPTemplate showsTabBadge](self, "showsTabBadge"), CFSTR("kCPTemplateTabBadgeKey"));
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v11.receiver = self;
  v11.super_class = (Class)CPTemplate;
  -[CPTemplate description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPTemplate identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPTemplate userInfo](self, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPTemplate tabTitle](self, "tabTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPTemplate tabImage](self, "tabImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <identifier: %@, userInfo: %@, tabTitle: %@, tabImage: %@, showsTabBadge: %d>"), v4, v5, v6, v7, v8, -[CPTemplate showsTabBadge](self, "showsTabBadge"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  CPTemplate *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (CPTemplate *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CPTemplate identifier](v4, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPTemplate identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[CPTemplate identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (void)connectTemplateProvider:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CPTemplate setTemplateProvider:](self, "setTemplateProvider:", v4);
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "finishWithResult:", v4);

}

- (void)invalidateTemplateProvider
{
  void *v3;
  id v4;

  -[CPTemplate setTemplateProvider:](self, "setTemplateProvider:", 0);
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4 = (id)objc_opt_new();
  -[CPTemplate setTemplateProviderFuture:](self, "setTemplateProviderFuture:", v4);

}

- (BOOL)shouldHideNavigationBar
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;

  -[CPTemplate backButton](self, "backButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[CPTemplate leadingNavigationBarButtons](self, "leadingNavigationBarButtons");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v4 = 0;
    }
    else
    {
      -[CPTemplate trailingNavigationBarButtons](self, "trailingNavigationBarButtons");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "count") == 0;

    }
  }

  return v4;
}

- (void)setBackButton:(id)a3
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v6 = a3;
  if (v6)
  {
    v7 = objc_opt_class();
    v8 = v6;
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v8;
    if ((objc_msgSend(v9, "containsObject:", object_getClass(v10)) & 1) == 0)
    {
      v11 = (void *)MEMORY[0x24BDBCE88];
      v12 = *MEMORY[0x24BDBCAB8];
      NSStringFromSelector(a2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "raise:format:", v12, CFSTR("Unsupported object %@ passed to %@. Allowed classes: %@"), v10, v13, v9, 0);

    }
  }
  objc_storeStrong((id *)&self->_backButton, a3);
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __28__CPTemplate_setBackButton___block_invoke;
  v17[3] = &unk_24C77E038;
  v18 = v6;
  v15 = v6;
  v16 = (id)objc_msgSend(v14, "addSuccessBlock:", v17);

}

uint64_t __28__CPTemplate_setBackButton___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHostBackButton:", *(_QWORD *)(a1 + 32));
}

- (void)setLeadingNavigationBarButtons:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  uint8_t buf[4];
  CPTemplate *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __45__CPTemplate_setLeadingNavigationBarButtons___block_invoke;
  v19[3] = &__block_descriptor_40_e28_v32__0__CPBarButton_8Q16_B24l;
  v19[4] = a2;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v19);
  CarPlayFrameworkGeneralLogging();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = self;
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_20D6F4000, v7, OS_LOG_TYPE_DEFAULT, "%@: New leading bar buttons: %@", buf, 0x16u);
  }

  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[CPTemplate setInternalLeadingBarButtons:](self, "setInternalLeadingBarButtons:", 0);
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __45__CPTemplate_setLeadingNavigationBarButtons___block_invoke_30;
  v17[3] = &unk_24C77E080;
  v17[4] = self;
  v18 = v8;
  v9 = v8;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v17);
  v10 = (void *)objc_msgSend(v9, "copy");
  -[CPTemplate setInternalLeadingBarButtons:](self, "setInternalLeadingBarButtons:", v10);

  -[CPTemplate internalLeadingBarButtons](self, "internalLeadingBarButtons");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __45__CPTemplate_setLeadingNavigationBarButtons___block_invoke_2;
  v15[3] = &unk_24C77E038;
  v16 = v11;
  v13 = v11;
  v14 = (id)objc_msgSend(v12, "addSuccessBlock:", v15);

}

void __45__CPTemplate_setLeadingNavigationBarButtons___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(const char **)(a1 + 32);
  v11 = v3;
  if ((objc_msgSend(v6, "containsObject:", object_getClass(v11)) & 1) == 0)
  {
    v8 = (void *)MEMORY[0x24BDBCE88];
    v9 = *MEMORY[0x24BDBCAB8];
    NSStringFromSelector(v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", v9, CFSTR("Unsupported object %@ passed to %@. Allowed classes: %@"), v11, v10, v6, 0);

  }
}

void __45__CPTemplate_setLeadingNavigationBarButtons___block_invoke_30(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;
  id v6;

  if (a3 == 2)
  {
    *a4 = 1;
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = a2;
    objc_msgSend(v6, "setDelegate:", v5);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

  }
}

uint64_t __45__CPTemplate_setLeadingNavigationBarButtons___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLeadingNavigationBarButtons:", *(_QWORD *)(a1 + 32));
}

- (void)setTrailingNavigationBarButtons:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  uint8_t buf[4];
  CPTemplate *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __46__CPTemplate_setTrailingNavigationBarButtons___block_invoke;
  v19[3] = &__block_descriptor_40_e28_v32__0__CPBarButton_8Q16_B24l;
  v19[4] = a2;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v19);
  CarPlayFrameworkGeneralLogging();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = self;
    v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_20D6F4000, v7, OS_LOG_TYPE_DEFAULT, "%@: New trailing bar buttons: %@", buf, 0x16u);
  }

  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[CPTemplate setInternalTrailingBarButtons:](self, "setInternalTrailingBarButtons:", 0);
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __46__CPTemplate_setTrailingNavigationBarButtons___block_invoke_31;
  v17[3] = &unk_24C77E080;
  v17[4] = self;
  v18 = v8;
  v9 = v8;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v17);
  v10 = (void *)objc_msgSend(v9, "copy");
  -[CPTemplate setInternalTrailingBarButtons:](self, "setInternalTrailingBarButtons:", v10);

  -[CPTemplate internalTrailingBarButtons](self, "internalTrailingBarButtons");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = __46__CPTemplate_setTrailingNavigationBarButtons___block_invoke_2;
  v15[3] = &unk_24C77E038;
  v16 = v11;
  v13 = v11;
  v14 = (id)objc_msgSend(v12, "addSuccessBlock:", v15);

}

void __46__CPTemplate_setTrailingNavigationBarButtons___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a2;
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(const char **)(a1 + 32);
  v11 = v3;
  if ((objc_msgSend(v6, "containsObject:", object_getClass(v11)) & 1) == 0)
  {
    v8 = (void *)MEMORY[0x24BDBCE88];
    v9 = *MEMORY[0x24BDBCAB8];
    NSStringFromSelector(v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", v9, CFSTR("Unsupported object %@ passed to %@. Allowed classes: %@"), v11, v10, v6, 0);

  }
}

void __46__CPTemplate_setTrailingNavigationBarButtons___block_invoke_31(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;
  id v6;

  if (a3 == 2)
  {
    *a4 = 1;
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = a2;
    objc_msgSend(v6, "setDelegate:", v5);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

  }
}

uint64_t __46__CPTemplate_setTrailingNavigationBarButtons___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTrailingNavigationBarButtons:", *(_QWORD *)(a1 + 32));
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
  v6[2] = __47__CPTemplate_handleActionForControlIdentifier___block_invoke;
  v6[3] = &unk_24C77C8C8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __47__CPTemplate_handleActionForControlIdentifier___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, uint64_t, _BYTE *);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__9;
  v24 = __Block_byref_object_dispose__9;
  v25 = 0;
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(*(id *)(a1 + 32), "leadingNavigationBarButtons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

  objc_msgSend(*(id *)(a1 + 32), "trailingNavigationBarButtons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  objc_msgSend(*(id *)(a1 + 32), "backButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "backButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v6);

  }
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __47__CPTemplate_handleActionForControlIdentifier___block_invoke_32;
  v17 = &unk_24C77E0A8;
  v18 = *(id *)(a1 + 40);
  v19 = &v20;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &v14);
  if (v21[5])
  {
    CarPlayFrameworkGeneralLogging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = v21[5];
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v27 = v9;
      v28 = 2112;
      v29 = v8;
      v30 = 2112;
      v31 = v10;
      _os_log_impl(&dword_20D6F4000, v7, OS_LOG_TYPE_INFO, "%@: Activated button: %@ for control identifier: %@", buf, 0x20u);
    }

    objc_msgSend((id)v21[5], "handlePrimaryAction", v14, v15, v16, v17);
  }
  else
  {
    CarPlayFrameworkGeneralLogging();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v27 = v12;
      v28 = 2112;
      v29 = v13;
      _os_log_impl(&dword_20D6F4000, v11, OS_LOG_TYPE_INFO, "%@: No button found for control identifier: %@", buf, 0x16u);
    }

  }
  _Block_object_dispose(&v20, 8);

}

void __47__CPTemplate_handleActionForControlIdentifier___block_invoke_32(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
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

- (void)templateWillAppearWithIdentifier:(id)a3 animated:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__CPTemplate_templateWillAppearWithIdentifier_animated___block_invoke;
  block[3] = &unk_24C77E0D0;
  block[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __56__CPTemplate_templateWillAppearWithIdentifier_animated___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "templateDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "templateDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "templateWillAppearWithIdentifier:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

  }
}

- (void)templateWillDisappearWithIdentifier:(id)a3 animated:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__CPTemplate_templateWillDisappearWithIdentifier_animated___block_invoke;
  block[3] = &unk_24C77E0D0;
  block[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __59__CPTemplate_templateWillDisappearWithIdentifier_animated___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "templateDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "templateDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "templateWillDisappearWithIdentifier:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

  }
}

- (void)templateDidAppearWithIdentifier:(id)a3 animated:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__CPTemplate_templateDidAppearWithIdentifier_animated___block_invoke;
  block[3] = &unk_24C77E0D0;
  block[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __55__CPTemplate_templateDidAppearWithIdentifier_animated___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "templateDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "templateDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "templateDidAppearWithIdentifier:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

  }
}

- (void)templateDidDisappearWithIdentifier:(id)a3 animated:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__CPTemplate_templateDidDisappearWithIdentifier_animated___block_invoke;
  block[3] = &unk_24C77E0D0;
  block[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __58__CPTemplate_templateDidDisappearWithIdentifier_animated___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "templateDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "templateDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "templateDidDisappearWithIdentifier:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

  }
}

- (BOOL)control:(id)a3 setEnabled:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  BOOL v13;

  v6 = a3;
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __33__CPTemplate_control_setEnabled___block_invoke;
  v11[3] = &unk_24C77E0F8;
  v12 = v6;
  v13 = a4;
  v8 = v6;
  v9 = (id)objc_msgSend(v7, "addSuccessBlock:", v11);

  return 1;
}

void __33__CPTemplate_control_setEnabled___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setControl:enabled:", v5, *(unsigned __int8 *)(a1 + 40));

}

- (BOOL)control:(id)a3 setSelected:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  BOOL v13;

  v6 = a3;
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __34__CPTemplate_control_setSelected___block_invoke;
  v11[3] = &unk_24C77E0F8;
  v12 = v6;
  v13 = a4;
  v8 = v6;
  v9 = (id)objc_msgSend(v7, "addSuccessBlock:", v11);

  return 1;
}

void __34__CPTemplate_control_setSelected___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setControl:selected:", v5, *(unsigned __int8 *)(a1 + 40));

}

- (BOOL)barButton:(id)a3 setImage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __33__CPTemplate_barButton_setImage___block_invoke;
  v13[3] = &unk_24C77E120;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  v11 = (id)objc_msgSend(v8, "addSuccessBlock:", v13);

  return 1;
}

void __33__CPTemplate_barButton_setImage___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBarButton:image:", v5, *(_QWORD *)(a1 + 40));

}

- (BOOL)barButton:(id)a3 setTitle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __33__CPTemplate_barButton_setTitle___block_invoke;
  v13[3] = &unk_24C77E120;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  v11 = (id)objc_msgSend(v8, "addSuccessBlock:", v13);

  return 1;
}

void __33__CPTemplate_barButton_setTitle___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBarButton:title:", v5, *(_QWORD *)(a1 + 40));

}

- (void)setNeedsUpdate
{
  CPTemplate *v2;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  if (!-[CPTemplate needsUpdate](v2, "needsUpdate"))
  {
    -[CPTemplate setNeedsUpdate:](v2, "setNeedsUpdate:", 1);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __28__CPTemplate_setNeedsUpdate__block_invoke;
    block[3] = &unk_24C77C5B0;
    block[4] = v2;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  objc_sync_exit(v2);

}

void __28__CPTemplate_setNeedsUpdate__block_invoke(uint64_t a1)
{
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "performUpdate");
  obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(a1 + 32), "setNeedsUpdate:", 0);
  objc_sync_exit(obj);

}

- (CPBarButton)backButton
{
  return self->_backButton;
}

- (id)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)userInfo
{
  objc_storeStrong(&self->_userInfo, userInfo);
}

- (NSString)tabTitle
{
  return self->_tabTitle;
}

- (void)setTabTitle:(NSString *)tabTitle
{
  objc_setProperty_nonatomic_copy(self, a2, tabTitle, 32);
}

- (UIImage)tabImage
{
  return self->_tabImage;
}

- (void)setTabImage:(UIImage *)tabImage
{
  objc_storeStrong((id *)&self->_tabImage, tabImage);
}

- (UITabBarSystemItem)tabSystemItem
{
  return self->_tabSystemItem;
}

- (void)setTabSystemItem:(UITabBarSystemItem)tabSystemItem
{
  self->_tabSystemItem = tabSystemItem;
}

- (BOOL)showsTabBadge
{
  return self->_showsTabBadge;
}

- (void)setShowsTabBadge:(BOOL)showsTabBadge
{
  self->_showsTabBadge = showsTabBadge;
}

- (CPBaseTemplateProviding)templateProvider
{
  return self->_templateProvider;
}

- (void)setTemplateProvider:(id)a3
{
  objc_storeStrong((id *)&self->_templateProvider, a3);
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (NAFuture)templateProviderFuture
{
  return self->_templateProviderFuture;
}

- (void)setTemplateProviderFuture:(id)a3
{
  objc_storeStrong((id *)&self->_templateProviderFuture, a3);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (CPTemplateDelegate)templateDelegate
{
  return (CPTemplateDelegate *)objc_loadWeakRetained((id *)&self->_templateDelegate);
}

- (void)setTemplateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_templateDelegate, a3);
}

- (NSArray)internalLeadingBarButtons
{
  return self->_internalLeadingBarButtons;
}

- (void)setInternalLeadingBarButtons:(id)a3
{
  objc_storeStrong((id *)&self->_internalLeadingBarButtons, a3);
}

- (NSArray)internalTrailingBarButtons
{
  return self->_internalTrailingBarButtons;
}

- (void)setInternalTrailingBarButtons:(id)a3
{
  objc_storeStrong((id *)&self->_internalTrailingBarButtons, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalTrailingBarButtons, 0);
  objc_storeStrong((id *)&self->_internalLeadingBarButtons, 0);
  objc_destroyWeak((id *)&self->_templateDelegate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_templateProviderFuture, 0);
  objc_storeStrong((id *)&self->_templateProvider, 0);
  objc_storeStrong((id *)&self->_tabImage, 0);
  objc_storeStrong((id *)&self->_tabTitle, 0);
  objc_storeStrong(&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
}

@end
