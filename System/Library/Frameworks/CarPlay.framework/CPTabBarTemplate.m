@implementation CPTabBarTemplate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (NSInteger)maximumTabCount
{
  if (CPCurrentProcessHasAudioEntitlement())
    return 4;
  else
    return 5;
}

- (CPTabBarTemplate)initWithTemplates:(NSArray *)templates
{
  NSArray *v5;
  CPTabBarTemplate *v6;
  CPTabBarTemplate *v7;
  objc_super v9;

  v5 = templates;
  v9.receiver = self;
  v9.super_class = (Class)CPTabBarTemplate;
  v6 = -[CPTemplate init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[CPTabBarTemplate validateTemplates:](v6, "validateTemplates:", v5);
    objc_storeStrong((id *)&v7->_templates, templates);
    v7->_indexOfSelectedTab = 0;
  }

  return v7;
}

- (CPTabBarTemplate)initWithCoder:(id)a3
{
  id v4;
  CPTabBarTemplate *v5;
  id v6;
  uint64_t v7;
  NSArray *templates;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPTabBarTemplate;
  v5 = -[CPTemplate initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v5)
  {
    if (CPWhiteListedTemplates_onceToken != -1)
      dispatch_once(&CPWhiteListedTemplates_onceToken, &__block_literal_global_7);
    v6 = (id)CPWhiteListedTemplates_classes;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("kCPTabBarTemplatesKey"));
    v7 = objc_claimAutoreleasedReturnValue();
    templates = v5->_templates;
    v5->_templates = (NSArray *)v7;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPTabBarTemplate;
  v4 = a3;
  -[CPTemplate encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[CPTabBarTemplate templates](self, "templates", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("kCPTabBarTemplatesKey"));

}

- (void)updateTemplates:(NSArray *)newTemplates
{
  NSArray *v4;
  NSArray *templates;
  NSArray *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;

  v4 = newTemplates;
  -[CPTabBarTemplate validateTemplates:](self, "validateTemplates:", v4);
  templates = self->_templates;
  self->_templates = v4;
  v6 = v4;

  -[CPTabBarTemplate interfaceController](self, "interfaceController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateTabBarTemplate:", self);

  v8 = -[CPTabBarTemplate indexOfSelectedTab](self, "indexOfSelectedTab");
  v9 = -[NSArray count](v6, "count");

  if (v8 > v9)
    -[CPTabBarTemplate setIndexOfSelectedTab:](self, "setIndexOfSelectedTab:", 0);
}

- (void)validateTemplates:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend((id)objc_opt_class(), "maximumTabCount");
  v5 = objc_msgSend(v3, "count");
  v6 = (uint64_t *)MEMORY[0x24BDBCAB8];
  if (v5 > v4)
  {
    v7 = (void *)MEMORY[0x24BDBCE88];
    v8 = *MEMORY[0x24BDBCAB8];
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "raise:format:", v8, CFSTR("Too many templates passed to %@. Maximum allowed is %@."), v9, v10);

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v3;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    v14 = *v6;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v15);
        if (CPTabTemplates_onceToken != -1)
          dispatch_once(&CPTabTemplates_onceToken, &__block_literal_global_126);
        v17 = (id)CPTabTemplates_classes;
        v18 = v16;
        if ((objc_msgSend(v17, "containsObject:", object_getClass(v18)) & 1) == 0)
        {
          v19 = (void *)MEMORY[0x24BDBCE88];
          NSStringFromSelector(a2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "raise:format:", v14, CFSTR("Unsupported object %@ passed to %@. Allowed classes: %@"), v18, v20, v17, 0);

        }
        ++v15;
      }
      while (v12 != v15);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

}

- (CPTemplate)selectedTemplate
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  v3 = -[CPTabBarTemplate indexOfSelectedTab](self, "indexOfSelectedTab");
  -[CPTabBarTemplate templates](self, "templates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v3 >= v5)
  {
    v7 = 0;
  }
  else
  {
    -[CPTabBarTemplate templates](self, "templates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", -[CPTabBarTemplate indexOfSelectedTab](self, "indexOfSelectedTab"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (CPTemplate *)v7;
}

- (void)selectTemplate:(CPTemplate *)newTemplate
{
  CPTemplate *v4;
  NSArray *templates;
  CPTemplate *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD v9[4];
  CPTemplate *v10;
  uint8_t buf[4];
  CPTemplate *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = newTemplate;
  templates = self->_templates;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __35__CPTabBarTemplate_selectTemplate___block_invoke;
  v9[3] = &unk_24C77CB28;
  v6 = v4;
  v10 = v6;
  v7 = -[NSArray indexOfObjectPassingTest:](templates, "indexOfObjectPassingTest:", v9);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    CarPlayFrameworkGeneralLogging();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v6;
      _os_log_impl(&dword_20D6F4000, v8, OS_LOG_TYPE_DEFAULT, "Requested template to select in tab bar doesn't exist: %@", buf, 0xCu);
    }

  }
  else
  {
    -[CPTabBarTemplate selectTemplateAtIndex:](self, "selectTemplateAtIndex:", v7);
  }

}

uint64_t __35__CPTabBarTemplate_selectTemplate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (void)selectTemplateAtIndex:(NSInteger)index
{
  NSObject *v5;
  void *v6;
  const char *v7;
  unint64_t v8;
  _BOOL4 v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (-[CPTabBarTemplate indexOfSelectedTab](self, "indexOfSelectedTab") == index)
  {
    CarPlayFrameworkGeneralLogging();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", index);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v6;
      v7 = "Requested to select tab bar index %@, but it's already selected.";
LABEL_10:
      _os_log_impl(&dword_20D6F4000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v11, 0xCu);

    }
  }
  else
  {
    v8 = -[NSArray count](self->_templates, "count");
    CarPlayFrameworkGeneralLogging();
    v5 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v8 <= index)
    {
      if (v9)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", index);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v6;
        v7 = "Requested template index in tab bar doesn't exist: %@";
        goto LABEL_10;
      }
    }
    else
    {
      if (v9)
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", index);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412290;
        v12 = v10;
        _os_log_impl(&dword_20D6F4000, v5, OS_LOG_TYPE_DEFAULT, "Selecting tab bar template at index %@", (uint8_t *)&v11, 0xCu);

      }
      -[CPTabBarTemplate interfaceController](self, "interfaceController");
      v5 = objc_claimAutoreleasedReturnValue();
      -[NSObject selectTabBarTemplateIndex:](v5, "selectTabBarTemplateIndex:", index);
    }
  }

}

- (void)handleActionForControlIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  char v11;
  _QWORD block[6];
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[CPTabBarTemplate templates](self, "templates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x24BDAC760];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __53__CPTabBarTemplate_handleActionForControlIdentifier___block_invoke;
  v13[3] = &unk_24C77CB28;
  v7 = v4;
  v14 = v7;
  v8 = objc_msgSend(v5, "indexOfObjectPassingTest:", v13);

  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    CarPlayFrameworkGeneralLogging();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CPTabBarTemplate handleActionForControlIdentifier:].cold.1((uint64_t)v7, v9);

  }
  else
  {
    -[CPTabBarTemplate setIndexOfSelectedTab:](self, "setIndexOfSelectedTab:", v8);
    -[CPTabBarTemplate delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      block[0] = v6;
      block[1] = 3221225472;
      block[2] = __53__CPTabBarTemplate_handleActionForControlIdentifier___block_invoke_11;
      block[3] = &unk_24C77C8A0;
      block[4] = self;
      block[5] = v8;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
  }

}

uint64_t __53__CPTabBarTemplate_handleActionForControlIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __53__CPTabBarTemplate_handleActionForControlIdentifier___block_invoke_11(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "templates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tabBarTemplate:didSelectTemplate:", v2, v4);

}

- (id)leadingNavigationBarButtons
{
  -[CPTabBarTemplate doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setLeadingNavigationBarButtons:(id)a3
{
  -[CPTabBarTemplate doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (id)trailingNavigationBarButtons
{
  -[CPTabBarTemplate doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)setTrailingNavigationBarButtons:(id)a3
{
  -[CPTabBarTemplate doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (NSArray)templates
{
  return self->_templates;
}

- (unint64_t)indexOfSelectedTab
{
  return self->_indexOfSelectedTab;
}

- (void)setIndexOfSelectedTab:(unint64_t)a3
{
  self->_indexOfSelectedTab = a3;
}

- (CPTabBarTemplateProviding)templateProvider
{
  return self->_templateProvider;
}

- (void)setTemplateProvider:(id)a3
{
  objc_storeStrong((id *)&self->_templateProvider, a3);
}

- (CPInterfaceController)interfaceController
{
  return (CPInterfaceController *)objc_loadWeakRetained((id *)&self->_interfaceController);
}

- (void)setInterfaceController:(id)a3
{
  objc_storeWeak((id *)&self->_interfaceController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_interfaceController);
  objc_storeStrong((id *)&self->_templateProvider, 0);
  objc_storeStrong((id *)&self->_templates, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)handleActionForControlIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20D6F4000, a2, OS_LOG_TYPE_ERROR, "Failed to identify a local template for identifier %@", (uint8_t *)&v2, 0xCu);
}

@end
