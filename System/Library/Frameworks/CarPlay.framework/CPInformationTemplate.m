@implementation CPInformationTemplate

- (CPInformationTemplate)initWithTitle:(NSString *)title layout:(CPInformationTemplateLayout)layout items:(NSArray *)items actions:(NSArray *)actions
{
  NSString *v10;
  NSArray *v11;
  NSArray *v12;
  CPInformationTemplate *v13;
  uint64_t v14;
  NSString *v15;
  uint64_t v16;
  NSArray *v17;
  uint64_t v18;
  NSArray *v19;
  objc_super v21;

  v10 = title;
  v11 = items;
  v12 = actions;
  v21.receiver = self;
  v21.super_class = (Class)CPInformationTemplate;
  v13 = -[CPTemplate init](&v21, sel_init);
  if (v13)
  {
    v14 = -[NSString copy](v10, "copy");
    v15 = v13->_title;
    v13->_title = (NSString *)v14;

    v13->_layout = layout;
    -[CPInformationTemplate _sanitizeItems:](v13, "_sanitizeItems:", v11);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v13->_items;
    v13->_items = (NSArray *)v16;

    -[CPInformationTemplate _sanitizeButtons:](v13, "_sanitizeButtons:", v12);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v13->_actions;
    v13->_actions = (NSArray *)v18;

  }
  return v13;
}

- (id)_sanitizeItems:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "count") >= 0xB)
  {
    objc_msgSend(v3, "subarrayWithRange:", 0, 10);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v4;
  }
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (id)_sanitizeButtons:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[5];

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") >= 4)
  {
    objc_msgSend(v4, "subarrayWithRange:", 0, 3);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__CPInformationTemplate__sanitizeButtons___block_invoke;
  v8[3] = &unk_24C77D9D0;
  v8[4] = self;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v4, "copy");

  return v6;
}

uint64_t __42__CPInformationTemplate__sanitizeButtons___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDelegate:", *(_QWORD *)(a1 + 32));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPInformationTemplate)initWithCoder:(id)a3
{
  id v4;
  CPInformationTemplate *v5;
  uint64_t v6;
  NSString *title;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *items;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *actions;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CPInformationTemplate;
  v5 = -[CPTemplate initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPInformationTemplateTitleKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v6;

    v5->_layout = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kCPInformationTemplateLayoutKey"));
    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("kCPInformationTemplateItemsKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    items = v5->_items;
    v5->_items = (NSArray *)v12;

    v14 = (void *)MEMORY[0x24BDBCF20];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("kCPInformationTemplateActionsKey"));
    v17 = objc_claimAutoreleasedReturnValue();
    actions = v5->_actions;
    v5->_actions = (NSArray *)v17;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CPInformationTemplate;
  v4 = a3;
  -[CPTemplate encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);
  -[CPInformationTemplate title](self, "title", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCPInformationTemplateTitleKey"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[CPInformationTemplate layout](self, "layout"), CFSTR("kCPInformationTemplateLayoutKey"));
  -[CPInformationTemplate items](self, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCPInformationTemplateItemsKey"));

  -[CPInformationTemplate actions](self, "actions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("kCPInformationTemplateActionsKey"));

}

- (void)setTitle:(NSString *)title
{
  NSString *v4;
  NSString *v5;

  v4 = (NSString *)-[NSString copy](title, "copy");
  v5 = self->_title;
  self->_title = v4;

  -[CPTemplate setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)setItems:(NSArray *)items
{
  NSArray *v4;
  NSArray *v5;

  -[CPInformationTemplate _sanitizeItems:](self, "_sanitizeItems:", items);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v5 = self->_items;
  self->_items = v4;

  -[CPTemplate setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)setActions:(NSArray *)actions
{
  uint64_t v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  id v9;

  v8 = actions;
  if (-[NSArray count](v8, "count") < 4)
  {
    v5 = v8;
  }
  else
  {
    -[NSArray subarrayWithRange:](v8, "subarrayWithRange:", 0, 3);
    v4 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v4;
  }
  v9 = v5;
  v6 = (NSArray *)objc_msgSend(v5, "copy");
  v7 = self->_actions;
  self->_actions = v6;

  -[CPTemplate setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)performUpdate
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CPInformationTemplate;
  -[CPTemplate performUpdate](&v8, sel_performUpdate);
  objc_initWeak(&location, self);
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __38__CPInformationTemplate_performUpdate__block_invoke;
  v5[3] = &unk_24C77D9F8;
  objc_copyWeak(&v6, &location);
  v4 = (id)objc_msgSend(v3, "addSuccessBlock:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __38__CPInformationTemplate_performUpdate__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "updateWithInformationTemplate:", WeakRetained);

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
  v6[2] = __58__CPInformationTemplate_handleActionForControlIdentifier___block_invoke;
  v6[3] = &unk_24C77C8C8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __58__CPInformationTemplate_handleActionForControlIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  v17 = 0;
  objc_msgSend(*(id *)(a1 + 32), "actions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__CPInformationTemplate_handleActionForControlIdentifier___block_invoke_20;
  v9[3] = &unk_24C77DA20;
  v10 = *(id *)(a1 + 40);
  v11 = &v12;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v9);

  if (v13[5])
  {
    CarPlayFrameworkGeneralLogging();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = v13[5];
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v19 = v5;
      v20 = 2112;
      v21 = v4;
      v22 = 2112;
      v23 = v6;
      _os_log_impl(&dword_20D6F4000, v3, OS_LOG_TYPE_INFO, "%@: Activated button: %@ for control identifier: %@", buf, 0x20u);
    }

    objc_msgSend((id)v13[5], "handlePrimaryAction");
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    v8.receiver = *(id *)(a1 + 32);
    v8.super_class = (Class)CPInformationTemplate;
    objc_msgSendSuper2(&v8, sel_handleActionForControlIdentifier_, v7);
  }

  _Block_object_dispose(&v12, 8);
}

void __58__CPInformationTemplate_handleActionForControlIdentifier___block_invoke_20(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
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

- (void)updateTemplatePropertiesFromTemplate:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *items;
  NSArray *v8;
  NSArray *actions;
  id v10;

  v4 = a3;
  objc_msgSend(v4, "items");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSArray *)objc_msgSend(v5, "copy");
  items = self->_items;
  self->_items = v6;

  objc_msgSend(v4, "actions");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v8 = (NSArray *)objc_msgSend(v10, "copy");
  actions = self->_actions;
  self->_actions = v8;

}

- (CPInformationTemplateLayout)layout
{
  return self->_layout;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)items
{
  return self->_items;
}

- (NSArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
