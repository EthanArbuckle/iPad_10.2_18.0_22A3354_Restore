@implementation CPGridTemplate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CPGridTemplate)initWithTitle:(NSString *)title gridButtons:(NSArray *)gridButtons
{
  NSString *v6;
  NSArray *v7;
  CPGridTemplate *v8;
  uint64_t v9;
  NSString *v10;
  uint64_t v11;
  NSArray *v12;
  objc_super v14;

  v6 = title;
  v7 = gridButtons;
  v14.receiver = self;
  v14.super_class = (Class)CPGridTemplate;
  v8 = -[CPTemplate init](&v14, sel_init);
  if (v8)
  {
    v9 = -[NSString copy](v6, "copy");
    v10 = v8->_title;
    v8->_title = (NSString *)v9;

    -[CPGridTemplate _prepareButtons:](v8, "_prepareButtons:", v7);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v8->_gridButtons;
    v8->_gridButtons = (NSArray *)v11;

  }
  return v8;
}

- (CPGridTemplate)initWithCoder:(id)a3
{
  id v4;
  CPGridTemplate *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *gridButtons;
  uint64_t v11;
  NSString *title;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CPGridTemplate;
  v5 = -[CPTemplate initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("kCPGridTemplateButtonsKey"));
    v9 = objc_claimAutoreleasedReturnValue();
    gridButtons = v5->_gridButtons;
    v5->_gridButtons = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCPGridItemTemplateTitleKey"));
    v11 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CPGridTemplate;
  v4 = a3;
  -[CPTemplate encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[CPGridTemplate gridButtons](self, "gridButtons", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCPGridTemplateButtonsKey"));

  -[CPGridTemplate title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kCPGridItemTemplateTitleKey"));

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
  v6[2] = __51__CPGridTemplate_handleActionForControlIdentifier___block_invoke;
  v6[3] = &unk_24C77C8C8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __51__CPGridTemplate_handleActionForControlIdentifier___block_invoke(uint64_t a1)
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
  v15 = __Block_byref_object_copy__3;
  v16 = __Block_byref_object_dispose__3;
  v17 = 0;
  objc_msgSend(*(id *)(a1 + 32), "gridButtons");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __51__CPGridTemplate_handleActionForControlIdentifier___block_invoke_10;
  v9[3] = &unk_24C77D410;
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
    v8.super_class = (Class)CPGridTemplate;
    objc_msgSendSuper2(&v8, sel_handleActionForControlIdentifier_, v7);
  }

  _Block_object_dispose(&v12, 8);
}

void __51__CPGridTemplate_handleActionForControlIdentifier___block_invoke_10(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
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

- (id)_prepareButtons:(id)a3
{
  id v5;
  uint64_t v6;
  _QWORD v8[6];

  v5 = a3;
  if ((unint64_t)objc_msgSend(v5, "count") >= 9)
  {
    objc_msgSend(v5, "subarrayWithRange:", 0, 8);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v6;
  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __34__CPGridTemplate__prepareButtons___block_invoke;
  v8[3] = &unk_24C77D438;
  v8[4] = self;
  v8[5] = a2;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v8);
  return v5;
}

void __34__CPGridTemplate__prepareButtons___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  const char *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a2;
  v4 = objc_opt_class();
  v5 = *(const char **)(a1 + 40);
  v6 = v3;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  if ((objc_msgSend(v7, "containsObject:", object_getClass(v11)) & 1) == 0)
  {
    v8 = (void *)MEMORY[0x24BDBCE88];
    v9 = *MEMORY[0x24BDBCAB8];
    NSStringFromSelector(v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "raise:format:", v9, CFSTR("Unsupported object %@ passed to %@. Allowed classes: %@"), v11, v10, v7, 0);

  }
  objc_msgSend(v11, "setDelegate:", *(_QWORD *)(a1 + 32));

}

- (void)updateGridButtons:(NSArray *)gridButtons
{
  void *v4;
  char v5;
  id obj;

  -[CPGridTemplate _prepareButtons:](self, "_prepareButtons:", gridButtons);
  obj = (id)objc_claimAutoreleasedReturnValue();
  -[CPGridTemplate gridButtons](self, "gridButtons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToArray:", obj);

  if ((v5 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_gridButtons, obj);
    -[CPTemplate setNeedsUpdate](self, "setNeedsUpdate");
  }

}

- (void)updateTitle:(NSString *)title
{
  void *v5;
  char v6;
  NSString *v7;

  v7 = title;
  -[CPGridTemplate title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v7);

  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_title, title);
    -[CPTemplate setNeedsUpdate](self, "setNeedsUpdate");
  }

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
  v8.super_class = (Class)CPGridTemplate;
  -[CPTemplate performUpdate](&v8, sel_performUpdate);
  objc_initWeak(&location, self);
  -[CPTemplate templateProviderFuture](self, "templateProviderFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__CPGridTemplate_performUpdate__block_invoke;
  v5[3] = &unk_24C77D460;
  objc_copyWeak(&v6, &location);
  v4 = (id)objc_msgSend(v3, "addSuccessBlock:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __31__CPGridTemplate_performUpdate__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(v3, "reloadTemplate:", WeakRetained);

}

- (NSArray)gridButtons
{
  return self->_gridButtons;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_gridButtons, 0);
}

@end
