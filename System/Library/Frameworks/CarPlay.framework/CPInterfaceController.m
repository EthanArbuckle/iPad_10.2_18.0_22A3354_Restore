@implementation CPInterfaceController

- (id)_init
{
  CPInterfaceController *v2;
  uint64_t v3;
  NSMutableArray *templateStack;
  uint64_t v5;
  NSMapTable *templateMapTable;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CPInterfaceController;
  v2 = -[CPInterfaceController init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    templateStack = v2->_templateStack;
    v2->_templateStack = (NSMutableArray *)v3;

    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 0, 5, 0);
    templateMapTable = v2->_templateMapTable;
    v2->_templateMapTable = (NSMapTable *)v5;

  }
  return v2;
}

- (void)setPrefersDarkUserInterfaceStyle:(BOOL)prefersDarkUserInterfaceStyle
{
  id v4;

  if (self->_prefersDarkUserInterfaceStyle != prefersDarkUserInterfaceStyle)
  {
    self->_prefersDarkUserInterfaceStyle = prefersDarkUserInterfaceStyle;
    -[CPInterfaceController templateProvider](self, "templateProvider");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHostPrefersDarkUserInterfaceStyle:", self->_prefersDarkUserInterfaceStyle);

  }
}

- (void)setRootTemplate:(CPTemplate *)rootTemplate animated:(BOOL)animated completion:(void *)completion
{
  _BOOL8 v6;
  CPTemplate *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  CPTemplate *v15;
  char v16;
  uint64_t *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  CPInterfaceController *v21;
  _BOOL8 v22;
  void *v23;
  uint64_t v24;
  id v25;
  CPTemplate *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint8_t buf[4];
  CPTemplate *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v6 = animated;
  v34 = *MEMORY[0x24BDAC8D0];
  v10 = rootTemplate;
  v11 = completion;
  CarPlayFrameworkGeneralLogging();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v31 = v10;
    v32 = 2112;
    v33 = v13;
    _os_log_impl(&dword_20D6F4000, v12, OS_LOG_TYPE_DEFAULT, "Setting root template %@ animated %@", buf, 0x16u);

  }
  if (CPRootTemplateClasses_onceToken != -1)
    dispatch_once(&CPRootTemplateClasses_onceToken, &__block_literal_global_535);
  v14 = (id)CPRootTemplateClasses_classes;
  v15 = v10;
  v16 = objc_msgSend(v14, "containsObject:", object_getClass(v15));
  v17 = (uint64_t *)MEMORY[0x24BDBCAB8];
  if ((v16 & 1) == 0)
  {
    v18 = (void *)MEMORY[0x24BDBCE88];
    v19 = *MEMORY[0x24BDBCAB8];
    NSStringFromSelector(a2);
    v20 = a2;
    v21 = self;
    v22 = v6;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v19;
    v17 = (uint64_t *)MEMORY[0x24BDBCAB8];
    objc_msgSend(v18, "raise:format:", v24, CFSTR("Unsupported object %@ passed to %@. Allowed classes: %@"), v15, v23, v14, 0);

    v6 = v22;
    self = v21;
    a2 = v20;
  }

  if (CPAllowedTemplateClassesForCurrentEntitlement_onceToken != -1)
    dispatch_once(&CPAllowedTemplateClassesForCurrentEntitlement_onceToken, &__block_literal_global_537);
  v25 = (id)CPAllowedTemplateClassesForCurrentEntitlement_allowedTemplateClasses;
  v26 = v15;
  if ((objc_msgSend(v25, "containsObject:", object_getClass(v26)) & 1) == 0)
  {
    v27 = (void *)MEMORY[0x24BDBCE88];
    v28 = *v17;
    NSStringFromSelector(a2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "raise:format:", v28, CFSTR("Unsupported object %@ passed to %@. Allowed classes: %@"), v26, v29, v25, 0);

  }
  if (!-[CPTemplate isEqual:](self->_rootTemplate, "isEqual:", v26))
  {
    objc_storeStrong((id *)&self->_rootTemplate, rootTemplate);
    -[CPInterfaceController _pushTemplate:presentationStyle:animated:completion:](self, "_pushTemplate:presentationStyle:animated:completion:", v26, 1, v6, v11);
  }

}

- (void)pushTemplate:(CPTemplate *)templateToPush animated:(BOOL)animated completion:(void *)completion
{
  _BOOL8 v6;
  CPTemplate *v9;
  void *v10;
  id v11;
  CPTemplate *v12;
  void *v13;
  void *v14;
  id v15;
  CPTemplate *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  CPTemplate *v22;
  void *v23;
  int v24;
  uint64_t *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[4];
  CPTemplate *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  const __CFString *v40;
  uint64_t v41;
  _QWORD v42[2];

  v6 = animated;
  v42[1] = *MEMORY[0x24BDAC8D0];
  v9 = templateToPush;
  v10 = completion;
  if (CPPushableTemplateClasses_onceToken != -1)
    dispatch_once(&CPPushableTemplateClasses_onceToken, &__block_literal_global_546);
  v11 = (id)CPPushableTemplateClasses_classes;
  v12 = v9;
  if ((objc_msgSend(v11, "containsObject:", object_getClass(v12)) & 1) == 0)
  {
    v13 = (void *)MEMORY[0x24BDBCE88];
    NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Unsupported object %@ passed to %@. Allowed classes: %@"), v12, v14, v11, 0);

  }
  if (CPAllowedTemplateClassesForCurrentEntitlement_onceToken != -1)
    dispatch_once(&CPAllowedTemplateClassesForCurrentEntitlement_onceToken, &__block_literal_global_537);
  v15 = (id)CPAllowedTemplateClassesForCurrentEntitlement_allowedTemplateClasses;
  v16 = v12;
  if ((objc_msgSend(v15, "containsObject:", object_getClass(v16)) & 1) == 0)
  {
    v17 = (void *)MEMORY[0x24BDBCE88];
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Unsupported object %@ passed to %@. Allowed classes: %@"), v16, v18, v15, 0);

  }
  -[CPInterfaceController templateStack](self, "templateStack");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    -[CPInterfaceController templateStack](self, "templateStack");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __58__CPInterfaceController_pushTemplate_animated_completion___block_invoke;
    v32[3] = &unk_24C77CA38;
    v22 = v16;
    v33 = v22;
    v34 = &v35;
    objc_msgSend(v21, "enumerateObjectsUsingBlock:", v32);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CPInterfaceController templateStack](self, "templateStack");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "containsObject:", v22);

      v25 = v36;
      if (v24)
        *((_BYTE *)v36 + 24) = 1;
    }
    else
    {
      v25 = v36;
    }
    if (*((_BYTE *)v25 + 24))
    {
      v29 = (void *)MEMORY[0x24BDD1540];
      v39 = *MEMORY[0x24BDD0FC8];
      v40 = CFSTR("Pushing the same template instance more than once is not supported.");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("CarPlayErrorDomain"), -1, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      -[CPInterfaceController _handleCompletion:withSuccess:error:](self, "_handleCompletion:withSuccess:error:", v10, 0, v31);
    }
    else
    {
      -[CPInterfaceController _pushTemplate:presentationStyle:animated:completion:](self, "_pushTemplate:presentationStyle:animated:completion:", v22, 0, v6, v10);
    }

    _Block_object_dispose(&v35, 8);
  }
  else
  {
    v26 = (void *)MEMORY[0x24BDD1540];
    v41 = *MEMORY[0x24BDD0FC8];
    v42[0] = CFSTR("Attempting to push a template without a root template. Set a root template first with setRootTemplate.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("CarPlayErrorDomain"), -1, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[CPInterfaceController _handleCompletion:withSuccess:error:](self, "_handleCompletion:withSuccess:error:", v10, 0, v28);
  }

}

void __58__CPInterfaceController_pushTemplate_animated_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  int v8;

  objc_msgSend(a2, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)_pushTemplate:(id)a3 presentationStyle:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v7 = a5;
  v26 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  CarPlayFrameworkGeneralLogging();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    CPSStringFromBOOL(v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = (uint64_t)v10;
    v22 = 2050;
    v23 = a4;
    v24 = 2114;
    v25 = v13;
    _os_log_impl(&dword_20D6F4000, v12, OS_LOG_TYPE_DEFAULT, "Creating template: %{public}@; presentation style: %{public}lu; animated: %{public}@",
      buf,
      0x20u);

  }
  if (objc_msgSend(v10, "isMemberOfClass:", objc_opt_class()))
  {
    -[CPInterfaceController _pushMapTemplate:presentationStyle:animated:completion:](self, "_pushMapTemplate:presentationStyle:animated:completion:", v10, a4, v7, v11);
  }
  else if (objc_msgSend(v10, "isMemberOfClass:", objc_opt_class()))
  {
    -[CPInterfaceController _pushGridTemplate:presentationStyle:animated:completion:](self, "_pushGridTemplate:presentationStyle:animated:completion:", v10, a4, v7, v11);
  }
  else if (objc_msgSend(v10, "isMemberOfClass:", objc_opt_class()))
  {
    -[CPInterfaceController _pushListTemplate:presentationStyle:animated:completion:](self, "_pushListTemplate:presentationStyle:animated:completion:", v10, a4, v7, v11);
  }
  else if (objc_msgSend(v10, "isMemberOfClass:", objc_opt_class()))
  {
    -[CPInterfaceController _pushSearchTemplate:presentationStyle:animated:completion:](self, "_pushSearchTemplate:presentationStyle:animated:completion:", v10, a4, v7, v11);
  }
  else if (objc_msgSend(v10, "isMemberOfClass:", objc_opt_class()))
  {
    -[CPInterfaceController _pushNowPlayingTemplate:presentationStyle:animated:completion:](self, "_pushNowPlayingTemplate:presentationStyle:animated:completion:", v10, a4, v7, v11);
  }
  else if (objc_msgSend(v10, "isMemberOfClass:", objc_opt_class()))
  {
    -[CPInterfaceController _pushTabBarTemplate:animated:completion:](self, "_pushTabBarTemplate:animated:completion:", v10, v7, v11);
  }
  else if (objc_msgSend(v10, "isMemberOfClass:", objc_opt_class()))
  {
    -[CPInterfaceController _pushInformationTemplate:presentationStyle:animated:completion:](self, "_pushInformationTemplate:presentationStyle:animated:completion:", v10, a4, v7, v11);
  }
  else
  {
    if (!objc_msgSend(v10, "conformsToProtocol:", &unk_2549DDD00))
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Template %@ was requested to be pushed but is not a pushable template."), v10);
      goto LABEL_24;
    }
    -[CPInterfaceController _pushEntityTemplate:presentationStyle:animated:completion:](self, "_pushEntityTemplate:presentationStyle:animated:completion:", v10, a4, v7, v11);
  }
  objc_msgSend(v10, "setTemplateDelegate:", self);
  if (a4 != 2)
  {
    -[CPInterfaceController templateStack](self, "templateStack");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v10);

    CarPlayFrameworkGeneralLogging();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      -[CPInterfaceController templateStack](self, "templateStack");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");
      *(_DWORD *)buf = 134217984;
      v21 = v17;
      _os_log_impl(&dword_20D6F4000, v15, OS_LOG_TYPE_DEFAULT, "Template did push, stack count: %lu", buf, 0xCu);

    }
  }
  -[CPInterfaceController templateMapTable](self, "templateMapTable");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v10, v19);

LABEL_24:
}

- (void)popToRootTemplateAnimated:(BOOL)animated completion:(void *)completion
{
  _BOOL8 v4;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v4 = animated;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = completion;
  CarPlayFrameworkGeneralLogging();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v8;
    _os_log_impl(&dword_20D6F4000, v7, OS_LOG_TYPE_DEFAULT, "Requesting pop to root template animated: %@", buf, 0xCu);

  }
  -[CPInterfaceController templateProvider](self, "templateProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __62__CPInterfaceController_popToRootTemplateAnimated_completion___block_invoke;
  v12[3] = &unk_24C77CA60;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v9, "popToRootTemplateAnimated:reply:", v10, v12);

}

void __62__CPInterfaceController_popToRootTemplateAnimated_completion___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleCompletion:withSuccess:error:", v3, 1, 0);
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    v7 = *MEMORY[0x24BDD0FC8];
    v8[0] = CFSTR("No templates were available to be popped.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("CarPlayErrorDomain"), -1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_handleCompletion:withSuccess:error:", v3, 0, v6);

  }
}

- (void)popTemplateAnimated:(BOOL)animated completion:(void *)completion
{
  _BOOL8 v4;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v4 = animated;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = completion;
  CarPlayFrameworkGeneralLogging();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v8;
    _os_log_impl(&dword_20D6F4000, v7, OS_LOG_TYPE_DEFAULT, "Requesting template pop animated: %@", buf, 0xCu);

  }
  -[CPInterfaceController templateProvider](self, "templateProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __56__CPInterfaceController_popTemplateAnimated_completion___block_invoke;
  v12[3] = &unk_24C77CA60;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v9, "popTemplateAnimated:reply:", v10, v12);

}

void __56__CPInterfaceController_popTemplateAnimated_completion___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleCompletion:withSuccess:error:", v3, 1, 0);
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    v7 = *MEMORY[0x24BDD0FC8];
    v8[0] = CFSTR("No templates were available to be popped.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("CarPlayErrorDomain"), -1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_handleCompletion:withSuccess:error:", v3, 0, v6);

  }
}

- (void)popToTemplate:(CPTemplate *)targetTemplate animated:(BOOL)animated completion:(void *)completion
{
  _BOOL8 v6;
  CPTemplate *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  CPTemplate *v14;
  char v15;
  uint64_t *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  id v21;
  CPTemplate *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  CPTemplate *v28;
  _QWORD v29[5];
  CPTemplate *v30;
  id v31;
  BOOL v32;
  uint8_t buf[4];
  CPTemplate *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v6 = animated;
  v37 = *MEMORY[0x24BDAC8D0];
  v9 = targetTemplate;
  v10 = completion;
  CarPlayFrameworkGeneralLogging();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v34 = v9;
    v35 = 2112;
    v36 = v12;
    _os_log_impl(&dword_20D6F4000, v11, OS_LOG_TYPE_DEFAULT, "Requesting pop to template %@ animated %@", buf, 0x16u);

  }
  if (CPPushableTemplateClasses_onceToken != -1)
    dispatch_once(&CPPushableTemplateClasses_onceToken, &__block_literal_global_546);
  v13 = (id)CPPushableTemplateClasses_classes;
  v14 = v9;
  v15 = objc_msgSend(v13, "containsObject:", object_getClass(v14));
  v16 = (uint64_t *)MEMORY[0x24BDBCAB8];
  if ((v15 & 1) == 0)
  {
    v17 = (void *)MEMORY[0x24BDBCE88];
    v18 = *MEMORY[0x24BDBCAB8];
    NSStringFromSelector(a2);
    v19 = a2;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "raise:format:", v18, CFSTR("Unsupported object %@ passed to %@. Allowed classes: %@"), v14, v20, v13, 0);

    a2 = v19;
    v16 = (uint64_t *)MEMORY[0x24BDBCAB8];
  }

  if (CPAllowedTemplateClassesForCurrentEntitlement_onceToken != -1)
    dispatch_once(&CPAllowedTemplateClassesForCurrentEntitlement_onceToken, &__block_literal_global_537);
  v21 = (id)CPAllowedTemplateClassesForCurrentEntitlement_allowedTemplateClasses;
  v22 = v14;
  if ((objc_msgSend(v21, "containsObject:", object_getClass(v22)) & 1) == 0)
  {
    v23 = (void *)MEMORY[0x24BDBCE88];
    v24 = *v16;
    NSStringFromSelector(a2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "raise:format:", v24, CFSTR("Unsupported object %@ passed to %@. Allowed classes: %@"), v22, v25, v21, 0);

  }
  -[CPInterfaceController templateProvider](self, "templateProvider");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __59__CPInterfaceController_popToTemplate_animated_completion___block_invoke;
  v29[3] = &unk_24C77CAB0;
  v29[4] = self;
  v30 = v22;
  v32 = v6;
  v31 = v10;
  v27 = v10;
  v28 = v22;
  objc_msgSend(v26, "containsTemplate:reply:", v28, v29);

}

void __59__CPInterfaceController_popToTemplate_animated_completion___block_invoke(uint64_t a1, char a2)
{
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;
  char v7;
  char v8;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__CPInterfaceController_popToTemplate_animated_completion___block_invoke_2;
  v4[3] = &unk_24C77CA88;
  v7 = a2;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v8 = *(_BYTE *)(a1 + 56);
  v6 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x24BDAC9B8], v4);

}

void __59__CPInterfaceController_popToTemplate_animated_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "templateProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(a1 + 57));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __59__CPInterfaceController_popToTemplate_animated_completion___block_invoke_3;
    v10[3] = &unk_24C77CA60;
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = *(id *)(a1 + 48);
    objc_msgSend(v3, "popToTemplate:animated:reply:", v4, v5, v10);

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 48);
    v7 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BDD0FC8];
    v13[0] = CFSTR("The specified template does not exist in the current navigation hierarchy.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("CarPlayErrorDomain"), -1, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_handleCompletion:withSuccess:error:", v6, 0, v9);

  }
}

void __59__CPInterfaceController_popToTemplate_animated_completion___block_invoke_3(uint64_t a1, int a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleCompletion:withSuccess:error:", v3, 1, 0);
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD1540];
    v7 = *MEMORY[0x24BDD0FC8];
    v8[0] = CFSTR("The specified template does not exist in the current navigation hierarchy.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("CarPlayErrorDomain"), -1, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_handleCompletion:withSuccess:error:", v3, 0, v6);

  }
}

- (void)presentTemplate:(CPTemplate *)templateToPresent animated:(BOOL)animated completion:(void *)completion
{
  _BOOL8 v6;
  CPTemplate *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  CPTemplate *v14;
  char v15;
  uint64_t *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  void *v20;
  _BOOL8 v21;
  void *v22;
  id v23;
  CPTemplate *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *presentedTemplate;
  CPTemplate *v31;
  uint64_t v32;
  const __CFString *v33;
  uint8_t buf[4];
  CPTemplate *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v6 = animated;
  v38 = *MEMORY[0x24BDAC8D0];
  v9 = templateToPresent;
  v10 = completion;
  CarPlayFrameworkGeneralLogging();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v35 = v9;
    v36 = 2112;
    v37 = v12;
    _os_log_impl(&dword_20D6F4000, v11, OS_LOG_TYPE_DEFAULT, "Requesting present template %@ animated %@", buf, 0x16u);

  }
  if (CPPresentableTemplateClasses_onceToken != -1)
    dispatch_once(&CPPresentableTemplateClasses_onceToken, &__block_literal_global_547);
  v13 = (id)CPPresentableTemplateClasses_classes;
  v14 = v9;
  v15 = objc_msgSend(v13, "containsObject:", object_getClass(v14));
  v16 = (uint64_t *)MEMORY[0x24BDBCAB8];
  if ((v15 & 1) == 0)
  {
    v17 = (void *)MEMORY[0x24BDBCE88];
    v18 = *MEMORY[0x24BDBCAB8];
    NSStringFromSelector(a2);
    v19 = a2;
    v20 = v10;
    v21 = v6;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "raise:format:", v18, CFSTR("Unsupported object %@ passed to %@. Allowed classes: %@"), v14, v22, v13, 0);

    v6 = v21;
    v10 = v20;
    a2 = v19;
    v16 = (uint64_t *)MEMORY[0x24BDBCAB8];
  }

  if (CPAllowedTemplateClassesForCurrentEntitlement_onceToken != -1)
    dispatch_once(&CPAllowedTemplateClassesForCurrentEntitlement_onceToken, &__block_literal_global_537);
  v23 = (id)CPAllowedTemplateClassesForCurrentEntitlement_allowedTemplateClasses;
  v24 = v14;
  if ((objc_msgSend(v23, "containsObject:", object_getClass(v24)) & 1) == 0)
  {
    v25 = (void *)MEMORY[0x24BDBCE88];
    v26 = *v16;
    NSStringFromSelector(a2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "raise:format:", v26, CFSTR("Unsupported object %@ passed to %@. Allowed classes: %@"), v24, v27, v23, 0);

  }
  if (self->_presentedTemplate)
  {
    v28 = (void *)MEMORY[0x24BDD1540];
    v32 = *MEMORY[0x24BDD0FC8];
    v33 = CFSTR("Presenting a template while a template is already presented is not supported.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "errorWithDomain:code:userInfo:", CFSTR("CarPlayErrorDomain"), -1, v29);
    presentedTemplate = (void *)objc_claimAutoreleasedReturnValue();

    -[CPInterfaceController _handleCompletion:withSuccess:error:](self, "_handleCompletion:withSuccess:error:", v10, 0, presentedTemplate);
  }
  else
  {
    if (-[CPTemplate isMemberOfClass:](v24, "isMemberOfClass:", objc_opt_class()))
    {
      -[CPInterfaceController _presentActionSheetTemplate:animated:completion:](self, "_presentActionSheetTemplate:animated:completion:", v24, v6, v10);
    }
    else if (-[CPTemplate isMemberOfClass:](v24, "isMemberOfClass:", objc_opt_class()))
    {
      -[CPInterfaceController _presentAlertTemplate:animated:completion:](self, "_presentAlertTemplate:animated:completion:", v24, v6, v10);
    }
    else if (-[CPTemplate isMemberOfClass:](v24, "isMemberOfClass:", objc_opt_class()))
    {
      -[CPInterfaceController _pushVoiceControlTemplate:animated:completion:](self, "_pushVoiceControlTemplate:animated:completion:", v24, v6, v10);
    }
    -[CPTemplate setTemplateDelegate:](v24, "setTemplateDelegate:", self);
    v31 = v24;
    presentedTemplate = self->_presentedTemplate;
    self->_presentedTemplate = v31;
  }

}

- (void)dismissTemplateAnimated:(BOOL)animated completion:(void *)completion
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  CPTemplate *presentedTemplate;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  CPInterfaceController *v15;
  id v16;

  v4 = animated;
  v6 = completion;
  -[CPInterfaceController templateProvider](self, "templateProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __60__CPInterfaceController_dismissTemplateAnimated_completion___block_invoke;
  v14 = &unk_24C77CAD8;
  v15 = self;
  v16 = v6;
  v9 = v6;
  objc_msgSend(v7, "dismissTemplateAnimated:reply:", v8, &v11);

  objc_storeStrong((id *)&self->_lastPresentedTemplate, self->_presentedTemplate);
  -[CPTemplate invalidateTemplateProvider](self->_presentedTemplate, "invalidateTemplateProvider", v11, v12, v13, v14, v15);
  presentedTemplate = self->_presentedTemplate;
  self->_presentedTemplate = 0;

}

uint64_t __60__CPInterfaceController_dismissTemplateAnimated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCompletion:withSuccess:error:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (CPTemplate)presentedTemplate
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[CPInterfaceController _synchronousTemplateProvider](self, "_synchronousTemplateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__CPInterfaceController_presentedTemplate__block_invoke;
  v6[3] = &unk_24C77CB00;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "getPresentedTemplateWithReply:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CPTemplate *)v4;
}

void __42__CPInterfaceController_presentedTemplate__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  id *v6;
  void *v7;
  int v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", v12);

  v5 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v6 = (id *)(v5 + 24);
LABEL_5:
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *v6;
    v11 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;

    goto LABEL_6;
  }
  objc_msgSend(*(id *)(v5 + 64), "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", v12);

  if (v8)
  {
    v6 = (id *)(*(_QWORD *)(a1 + 32) + 64);
    goto LABEL_5;
  }
LABEL_6:

}

- (CPTemplate)topTemplate
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[CPInterfaceController _synchronousTemplateProvider](self, "_synchronousTemplateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__CPInterfaceController_topTemplate__block_invoke;
  v6[3] = &unk_24C77CB00;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "getTopTemplateWithReply:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (CPTemplate *)v4;
}

void __36__CPInterfaceController_topTemplate__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "templateStack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__CPInterfaceController_topTemplate__block_invoke_2;
  v7[3] = &unk_24C77CA38;
  v5 = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

}

void __36__CPInterfaceController_topTemplate__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
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

- (NSArray)templates
{
  void *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[CPInterfaceController _synchronousTemplateProvider](self, "_synchronousTemplateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__CPInterfaceController_templates__block_invoke;
  v6[3] = &unk_24C77CB78;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v3, "getTemplatesWithReply:", v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __34__CPInterfaceController_templates__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v3 = a2;
  v4 = (void *)objc_opt_new();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __34__CPInterfaceController_templates__block_invoke_2;
  v9[3] = &unk_24C77CB50;
  v9[4] = *(_QWORD *)(a1 + 32);
  v5 = v4;
  v10 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v9);

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

}

void __34__CPInterfaceController_templates__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "templateStack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __34__CPInterfaceController_templates__block_invoke_3;
  v10[3] = &unk_24C77CB28;
  v5 = v3;
  v11 = v5;
  v6 = objc_msgSend(v4, "indexOfObjectPassingTest:", v10);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    CarPlayFrameworkGeneralLogging();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __34__CPInterfaceController_templates__block_invoke_2_cold_1((uint64_t)v5, v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "templateStack");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
  }

}

uint64_t __34__CPInterfaceController_templates__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (void)presentTemplate:(CPTemplate *)templateToPresent animated:(BOOL)animated
{
  -[CPInterfaceController presentTemplate:animated:completion:](self, "presentTemplate:animated:completion:", templateToPresent, animated, 0);
}

- (void)popToTemplate:(CPTemplate *)targetTemplate animated:(BOOL)animated
{
  -[CPInterfaceController popToTemplate:animated:completion:](self, "popToTemplate:animated:completion:", targetTemplate, animated, 0);
}

- (void)pushTemplate:(CPTemplate *)templateToPush animated:(BOOL)animated
{
  -[CPInterfaceController pushTemplate:animated:completion:](self, "pushTemplate:animated:completion:", templateToPush, animated, 0);
}

- (void)setRootTemplate:(CPTemplate *)rootTemplate animated:(BOOL)animated
{
  -[CPInterfaceController setRootTemplate:animated:completion:](self, "setRootTemplate:animated:completion:", rootTemplate, animated, 0);
}

- (void)dismissTemplateAnimated:(BOOL)animated
{
  -[CPInterfaceController dismissTemplateAnimated:completion:](self, "dismissTemplateAnimated:completion:", animated, 0);
}

- (void)popTemplateAnimated:(BOOL)animated
{
  -[CPInterfaceController popTemplateAnimated:completion:](self, "popTemplateAnimated:completion:", animated, 0);
}

- (void)popToRootTemplateAnimated:(BOOL)animated
{
  -[CPInterfaceController popToRootTemplateAnimated:completion:](self, "popToRootTemplateAnimated:completion:", animated, 0);
}

- (void)_handleCompletion:(id)a3 withSuccess:(BOOL)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  BOOL v14;
  _QWORD block[4];
  id v16;

  v7 = a3;
  v8 = a5;
  v9 = v8;
  if (v7)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __61__CPInterfaceController__handleCompletion_withSuccess_error___block_invoke_2;
    v11[3] = &unk_24C77CBA0;
    v10 = &v13;
    v13 = v7;
    v14 = a4;
    v12 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], v11);

LABEL_3:
    goto LABEL_4;
  }
  if ((v8 || !a4) && dyld_program_sdk_at_least())
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__CPInterfaceController__handleCompletion_withSuccess_error___block_invoke;
    block[3] = &unk_24C77C5B0;
    v10 = &v16;
    v16 = v9;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    goto LABEL_3;
  }
LABEL_4:

}

uint64_t __61__CPInterfaceController__handleCompletion_withSuccess_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("An error was encountered during a template operation, but no completion block was specified. Error: %@"), *(_QWORD *)(a1 + 32));
}

uint64_t __61__CPInterfaceController__handleCompletion_withSuccess_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)_pushVoiceControlTemplate:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  CPInterfaceController *v16;
  id v17;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  -[CPInterfaceController templateProvider](self, "templateProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __71__CPInterfaceController__pushVoiceControlTemplate_animated_completion___block_invoke;
  v14[3] = &unk_24C77CBC8;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v10, "presentVoiceTemplate:withProxyDelegate:animated:reply:", v13, v13, v11, v14);

}

uint64_t __71__CPInterfaceController__pushVoiceControlTemplate_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "connectTemplateProvider:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "_handleCompletion:withSuccess:error:", *(_QWORD *)(a1 + 48), 1, 0);
}

- (void)_pushGridTemplate:(id)a3 presentationStyle:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  CPInterfaceController *v18;
  id v19;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  -[CPInterfaceController templateProvider](self, "templateProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __81__CPInterfaceController__pushGridTemplate_presentationStyle_animated_completion___block_invoke;
  v16[3] = &unk_24C77CBF0;
  v17 = v10;
  v18 = self;
  v19 = v11;
  v14 = v11;
  v15 = v10;
  objc_msgSend(v12, "pushGridTemplate:withProxyDelegate:animated:presentationStyle:reply:", v15, v15, v13, a4, v16);

}

uint64_t __81__CPInterfaceController__pushGridTemplate_presentationStyle_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "connectTemplateProvider:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "_handleCompletion:withSuccess:error:", *(_QWORD *)(a1 + 48), 1, 0);
}

- (void)_pushInformationTemplate:(id)a3 presentationStyle:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  CPInterfaceController *v18;
  id v19;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  -[CPInterfaceController templateProvider](self, "templateProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __88__CPInterfaceController__pushInformationTemplate_presentationStyle_animated_completion___block_invoke;
  v16[3] = &unk_24C77CC18;
  v17 = v10;
  v18 = self;
  v19 = v11;
  v14 = v11;
  v15 = v10;
  objc_msgSend(v12, "pushInformationTemplate:withProxyDelegate:animated:presentationStyle:reply:", v15, v15, v13, a4, v16);

}

uint64_t __88__CPInterfaceController__pushInformationTemplate_presentationStyle_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "connectTemplateProvider:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "_handleCompletion:withSuccess:error:", *(_QWORD *)(a1 + 48), 1, 0);
}

- (void)_pushMapTemplate:(id)a3 presentationStyle:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  CPInterfaceController *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  -[CPInterfaceController templateProvider](self, "templateProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __80__CPInterfaceController__pushMapTemplate_presentationStyle_animated_completion___block_invoke;
  v27[3] = &unk_24C77CC40;
  v15 = v10;
  v28 = v15;
  objc_msgSend(v12, "pushMapTemplate:withProxyDelegate:animated:presentationStyle:reply:", v15, v15, v13, a4, v27);

  -[CPInterfaceController templateProvider](self, "templateProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v14;
  v25[1] = 3221225472;
  v25[2] = __80__CPInterfaceController__pushMapTemplate_presentationStyle_animated_completion___block_invoke_2;
  v25[3] = &unk_24C77CC68;
  v17 = v15;
  v26 = v17;
  objc_msgSend(v16, "requestBannerProviderWithReply:", v25);

  -[CPInterfaceController templateProvider](self, "templateProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __80__CPInterfaceController__pushMapTemplate_presentationStyle_animated_completion___block_invoke_3;
  v21[3] = &unk_24C77CC90;
  v22 = v17;
  v23 = self;
  v24 = v11;
  v19 = v11;
  v20 = v17;
  objc_msgSend(v18, "requestNavigationProviderForMapTemplate:withReply:", v20, v21);

}

uint64_t __80__CPInterfaceController__pushMapTemplate_presentationStyle_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "connectTemplateProvider:", a2);
}

uint64_t __80__CPInterfaceController__pushMapTemplate_presentationStyle_animated_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBannerProvider:", a2);
}

uint64_t __80__CPInterfaceController__pushMapTemplate_presentationStyle_animated_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setNavigationSessionProvider:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "_handleCompletion:withSuccess:error:", *(_QWORD *)(a1 + 48), 1, 0);
}

- (void)_pushListTemplate:(id)a3 presentationStyle:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  CPInterfaceController *v18;
  id v19;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  -[CPInterfaceController templateProvider](self, "templateProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __81__CPInterfaceController__pushListTemplate_presentationStyle_animated_completion___block_invoke;
  v16[3] = &unk_24C77CCB8;
  v17 = v10;
  v18 = self;
  v19 = v11;
  v14 = v11;
  v15 = v10;
  objc_msgSend(v12, "pushListTemplate:withProxyDelegate:animated:presentationStyle:reply:", v15, v15, v13, a4, v16);

}

uint64_t __81__CPInterfaceController__pushListTemplate_presentationStyle_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "connectTemplateProvider:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "_handleCompletion:withSuccess:error:", *(_QWORD *)(a1 + 48), 1, 0);
}

- (void)_pushSearchTemplate:(id)a3 presentationStyle:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  CPInterfaceController *v18;
  id v19;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  -[CPInterfaceController templateProvider](self, "templateProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __83__CPInterfaceController__pushSearchTemplate_presentationStyle_animated_completion___block_invoke;
  v16[3] = &unk_24C77CCE0;
  v17 = v10;
  v18 = self;
  v19 = v11;
  v14 = v11;
  v15 = v10;
  objc_msgSend(v12, "pushSearchTemplate:withProxyDelegate:animated:presentationStyle:reply:", v15, v15, v13, a4, v16);

}

uint64_t __83__CPInterfaceController__pushSearchTemplate_presentationStyle_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "connectTemplateProvider:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "_handleCompletion:withSuccess:error:", *(_QWORD *)(a1 + 48), 1, 0);
}

- (void)_pushNowPlayingTemplate:(id)a3 presentationStyle:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  CPInterfaceController *v18;
  id v19;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  -[CPInterfaceController templateProvider](self, "templateProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __87__CPInterfaceController__pushNowPlayingTemplate_presentationStyle_animated_completion___block_invoke;
  v16[3] = &unk_24C77CD08;
  v17 = v10;
  v18 = self;
  v19 = v11;
  v14 = v11;
  v15 = v10;
  objc_msgSend(v12, "pushNowPlayingTemplate:withProxyDelegate:animated:presentationStyle:reply:", v15, v15, v13, a4, v16);

}

uint64_t __87__CPInterfaceController__pushNowPlayingTemplate_presentationStyle_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "connectTemplateProvider:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "_handleCompletion:withSuccess:error:", *(_QWORD *)(a1 + 48), 1, 0);
}

- (void)_pushTabBarTemplate:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id location[6];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  objc_msgSend(v7, "setInterfaceController:", self);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v7, "templates");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  v11 = (void *)MEMORY[0x24BDAC760];
  if (v10)
  {
    v12 = *(_QWORD *)v24;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v13);
        location[1] = v11;
        location[2] = (id)3221225472;
        location[3] = __65__CPInterfaceController__pushTabBarTemplate_animated_completion___block_invoke;
        location[4] = &unk_24C77CD30;
        location[5] = v14;
        -[CPInterfaceController _pushTemplate:presentationStyle:animated:completion:](self, "_pushTemplate:presentationStyle:animated:completion:");
        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  objc_initWeak(location, self);
  -[CPInterfaceController templateProvider](self, "templateProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v18[1] = 3221225472;
  v18[2] = __65__CPInterfaceController__pushTabBarTemplate_animated_completion___block_invoke_49;
  v18[3] = &unk_24C77CD58;
  v16 = v7;
  v19 = v16;
  objc_copyWeak(&v21, location);
  v17 = v8;
  v20 = v17;
  objc_msgSend(v15, "setTabBarTemplate:withProxyDelegate:reply:animated:", v16, v16, v18, MEMORY[0x24BDBD1C0]);

  objc_destroyWeak(&v21);
  objc_destroyWeak(location);

}

void __65__CPInterfaceController__pushTabBarTemplate_animated_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  CarPlayFrameworkGeneralLogging();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __65__CPInterfaceController__pushTabBarTemplate_animated_completion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_20D6F4000, v7, OS_LOG_TYPE_DEFAULT, "Prepared a tab for %@", (uint8_t *)&v9, 0xCu);
  }

}

void __65__CPInterfaceController__pushTabBarTemplate_animated_completion___block_invoke_49(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "connectTemplateProvider:", a2);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleCompletion:withSuccess:error:", *(_QWORD *)(a1 + 40), 1, 0);

}

- (void)_pushEntityTemplate:(id)a3 presentationStyle:(unint64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  CPInterfaceController *v18;
  id v19;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  -[CPInterfaceController templateProvider](self, "templateProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __83__CPInterfaceController__pushEntityTemplate_presentationStyle_animated_completion___block_invoke;
  v16[3] = &unk_24C77CD80;
  v17 = v10;
  v18 = self;
  v19 = v11;
  v14 = v11;
  v15 = v10;
  objc_msgSend(v12, "pushEntityTemplate:withProxyDelegate:animated:presentationStyle:reply:", v15, v15, v13, a4, v16);

}

uint64_t __83__CPInterfaceController__pushEntityTemplate_presentationStyle_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "connectTemplateProvider:", a2);
  return objc_msgSend(*(id *)(a1 + 40), "_handleCompletion:withSuccess:error:", *(_QWORD *)(a1 + 48), 1, 0);
}

- (void)updateTabBarTemplate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(v4, "templates");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[CPInterfaceController _pushTemplate:presentationStyle:animated:completion:](self, "_pushTemplate:presentationStyle:animated:completion:");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[CPInterfaceController templateProvider](self, "templateProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateTabBarTemplate:", v4);

}

void __46__CPInterfaceController_updateTabBarTemplate___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  CarPlayFrameworkGeneralLogging();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __65__CPInterfaceController__pushTabBarTemplate_animated_completion___block_invoke_cold_1();
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_20D6F4000, v7, OS_LOG_TYPE_DEFAULT, "Prepared a tab for %@", (uint8_t *)&v9, 0xCu);
  }

}

- (void)selectTabBarTemplateIndex:(int64_t)a3
{
  id v4;

  -[CPInterfaceController templateProvider](self, "templateProvider");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectTabBarTemplateAtIndex:", a3);

}

- (void)_presentActionSheetTemplate:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "setTemplateDelegate:", self);
  -[CPInterfaceController templateProvider](self, "templateProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __73__CPInterfaceController__presentActionSheetTemplate_animated_completion___block_invoke;
  v13[3] = &unk_24C77CAD8;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v10, "presentActionSheetTemplate:withProxyDelegate:animated:reply:", v9, v9, v11, v13);

}

uint64_t __73__CPInterfaceController__presentActionSheetTemplate_animated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCompletion:withSuccess:error:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)_presentAlertTemplate:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[CPInterfaceController templateProvider](self, "templateProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __67__CPInterfaceController__presentAlertTemplate_animated_completion___block_invoke;
  v13[3] = &unk_24C77CAD8;
  v13[4] = self;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v10, "presentAlertTemplate:withProxyDelegate:animated:reply:", v9, v9, v11, v13);

}

uint64_t __67__CPInterfaceController__presentAlertTemplate_animated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleCompletion:withSuccess:error:", *(_QWORD *)(a1 + 40), 1, 0);
}

- (void)_sceneConnect:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "_FBSScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (CPCurrentProcessHasTemplateEntitlement()
    && (objc_msgSend(v5, "settings"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        (isKindOfClass & 1) != 0))
  {
    CarPlayFrameworkGeneralLogging();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "_identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v9;
      _os_log_impl(&dword_20D6F4000, v8, OS_LOG_TYPE_DEFAULT, "Connecting to listener endpoint for scene identifier: %{public}@", (uint8_t *)&v13, 0xCu);

    }
    v10 = objc_alloc_init(MEMORY[0x24BDD19A0]);
    objc_msgSend(v5, "settings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endpoint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject _setEndpoint:](v10, "_setEndpoint:", v12);

    -[CPInterfaceController _connectToListenerEndpoint:](self, "_connectToListenerEndpoint:", v10);
  }
  else
  {
    CarPlayFrameworkGeneralLogging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CPInterfaceController _sceneConnect:].cold.1();
  }

}

- (void)_invalidate
{
  CPTemplate *presentedTemplate;
  CPTemplate *v4;
  CPTemplate *lastPresentedTemplate;
  CPTemplate *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  presentedTemplate = self->_presentedTemplate;
  if (presentedTemplate)
  {
    -[CPTemplate invalidateTemplateProvider](presentedTemplate, "invalidateTemplateProvider");
    v4 = self->_presentedTemplate;
    self->_presentedTemplate = 0;

  }
  lastPresentedTemplate = self->_lastPresentedTemplate;
  if (lastPresentedTemplate)
  {
    -[CPTemplate invalidateTemplateProvider](lastPresentedTemplate, "invalidateTemplateProvider");
    v6 = self->_lastPresentedTemplate;
    self->_lastPresentedTemplate = 0;

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_templateStack;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v11++), "invalidateTemplateProvider", (_QWORD)v13);
      }
      while (v9 != v11);
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  -[NSMutableArray removeAllObjects](self->_templateStack, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_templateMapTable, "removeAllObjects");
  -[CPInterfaceController connection](self, "connection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "invalidate");

  -[CPInterfaceController setConnection:](self, "setConnection:", 0);
  -[CPInterfaceController setTemplateProvider:](self, "setTemplateProvider:", 0);
}

+ (id)_templateProvidingInterface
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E7908);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_getTemplatesWithReply_, 0, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_presentActionSheetTemplate_withProxyDelegate_animated_reply_, 0, 0);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549C6E78);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v8, sel_presentActionSheetTemplate_withProxyDelegate_animated_reply_, 1, 0);

  objc_msgSend(v3, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_presentAlertTemplate_withProxyDelegate_animated_reply_, 0, 0);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549C6E78);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v9, sel_presentAlertTemplate_withProxyDelegate_animated_reply_, 1, 0);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E7968);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v74, sel_requestBannerProviderWithReply_, 0, 1);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549DAAF8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v10, sel_pushGridTemplate_withProxyDelegate_animated_presentationStyle_reply_, 1, 0);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E79C8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_allowlistClassesForBaseTemplateProvider:", v11);
  v73 = v11;
  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v11, sel_pushGridTemplate_withProxyDelegate_animated_presentationStyle_reply_, 0, 1);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_reloadTemplate_, 0, 0);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549C6DF8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v13, sel_pushInformationTemplate_withProxyDelegate_animated_presentationStyle_reply_, 1, 0);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E7A28);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = a1;
  objc_msgSend(a1, "_allowlistClassesForBaseTemplateProvider:", v72);
  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v72, sel_pushInformationTemplate_withProxyDelegate_animated_presentationStyle_reply_, 0, 1);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549DB440);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v15, sel_pushListTemplate_withProxyDelegate_animated_presentationStyle_reply_, 1, 0);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E7A88);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = a1;
  objc_msgSend(a1, "_allowlistClassesForBaseTemplateProvider:", v16);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v17, sel_reloadTemplate_, 0, 0);

  v18 = (void *)MEMORY[0x24BDBCF20];
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  objc_msgSend(v18, "setWithObjects:", v19, v20, v21, objc_opt_class(), 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v16;
  objc_msgSend(v16, "setClasses:forSelector:argumentIndex:ofReply:", v22, sel_reloadItems_, 0, 0);

  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v16, sel_pushListTemplate_withProxyDelegate_animated_presentationStyle_reply_, 0, 1);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549DCAE0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v23);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E7AE8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_allowlistClassesForBaseTemplateProvider:", v24);
  objc_msgSend(v24, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_hostSetMapButton_imageSet_, 1, 0);
  v25 = (void *)MEMORY[0x24BDBCF20];
  v26 = objc_opt_class();
  objc_msgSend(v25, "setWithObjects:", v26, objc_opt_class(), 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v27, sel_setHostTripPreviews_textConfiguration_previewOnlyRouteChoices_selectedIndex_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v28, sel_setHostTripPreviews_textConfiguration_previewOnlyRouteChoices_selectedIndex_, 1, 0);

  v29 = (void *)MEMORY[0x24BDBCF20];
  v30 = objc_opt_class();
  objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setClasses:forSelector:argumentIndex:ofReply:", v31, sel_hostSetMapButtons_, 0, 0);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E7B48);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)MEMORY[0x24BDBCF20];
  v34 = objc_opt_class();
  objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setClasses:forSelector:argumentIndex:ofReply:", v35, sel_showManeuvers_usingDisplayStyles_, 0, 0);

  v36 = (void *)MEMORY[0x24BDBCF20];
  v37 = objc_opt_class();
  objc_msgSend(v36, "setWithObjects:", v37, objc_opt_class(), 0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setClasses:forSelector:argumentIndex:ofReply:", v38, sel_showManeuvers_usingDisplayStyles_, 1, 0);

  v39 = (void *)MEMORY[0x24BDBCF20];
  v40 = objc_opt_class();
  objc_msgSend(v39, "setWithObjects:", v40, objc_opt_class(), 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setClasses:forSelector:argumentIndex:ofReply:", v41, sel_addManeuvers_, 0, 0);

  v42 = (void *)MEMORY[0x24BDBCF20];
  v43 = objc_opt_class();
  objc_msgSend(v42, "setWithObjects:", v43, objc_opt_class(), 0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setClasses:forSelector:argumentIndex:ofReply:", v44, sel_addLaneGuidances_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setClasses:forSelector:argumentIndex:ofReply:", v45, sel_setCurrentLaneGuidance_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v32;
  objc_msgSend(v32, "setClasses:forSelector:argumentIndex:ofReply:", v46, sel_routeChangedWithReason_routeInfo_, 1, 0);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E7BA8);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setInterface:forSelector:argumentIndex:ofReply:", v32, sel_hostStartNavigationSessionForTrip_reply_, 0, 1);
  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v69, sel_requestNavigationProviderForMapTemplate_withReply_, 0, 1);
  objc_msgSend(v24, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_showNavigationAlert_animated_, 0, 0);
  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v24, sel_pushMapTemplate_withProxyDelegate_animated_presentationStyle_reply_, 0, 1);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549CE0D0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v47, sel_pushNowPlayingTemplate_withProxyDelegate_animated_presentationStyle_reply_, 1, 0);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E7C08);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "_allowlistClassesForBaseTemplateProvider:", v48);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setClasses:forSelector:argumentIndex:ofReply:", v49, sel_updateNowPlayingTemplate_withProxyDelegate_canThrottle_, 0, 0);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549CE0D0);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setInterface:forSelector:argumentIndex:ofReply:", v50, sel_updateNowPlayingTemplate_withProxyDelegate_canThrottle_, 1, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", objc_opt_class());
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setClasses:forSelector:argumentIndex:ofReply:", v51, sel_updateNowPlayingTemplate_withProxyDelegate_canThrottle_, 2, 0);

  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v48, sel_pushNowPlayingTemplate_withProxyDelegate_animated_presentationStyle_reply_, 0, 1);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549DDC50);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)MEMORY[0x24BDBCF20];
  v54 = objc_opt_class();
  objc_msgSend(v53, "setWithObjects:", v54, objc_opt_class(), 0);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setClasses:forSelector:argumentIndex:ofReply:", v55, sel_searchTemplateWithIdentifier_updateSearchResultsForSearchText_completionResults_, 0, 1);

  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v52, sel_pushSearchTemplate_withProxyDelegate_animated_presentationStyle_reply_, 1, 0);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E7C68);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v67, sel_pushSearchTemplate_withProxyDelegate_animated_presentationStyle_reply_, 0, 1);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549D9DE0);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v56, sel_presentVoiceTemplate_withProxyDelegate_animated_reply_, 1, 0);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E7CC8);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "_allowlistClassesForBaseTemplateProvider:", v57);
  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v57, sel_presentVoiceTemplate_withProxyDelegate_animated_reply_, 0, 1);
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549DA160);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v58, sel_setTabBarTemplate_withProxyDelegate_reply_animated_, 1, 0);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549DDDB0);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v59, sel_pushEntityTemplate_withProxyDelegate_animated_presentationStyle_reply_, 1, 0);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549E7D28);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "_allowlistClassesForBaseTemplateProvider:", v60);
  v61 = (void *)MEMORY[0x24BDBCF20];
  v62 = objc_opt_class();
  v63 = objc_opt_class();
  objc_msgSend(v61, "setWithObjects:", v62, v63, objc_opt_class(), 0);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setClasses:forSelector:argumentIndex:ofReply:", v64, sel_updateEntityTemplate_withProxyDelegate_, 0, 0);

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549DDDB0);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setInterface:forSelector:argumentIndex:ofReply:", v65, sel_updateEntityTemplate_withProxyDelegate_, 1, 0);

  objc_msgSend(v3, "setInterface:forSelector:argumentIndex:ofReply:", v60, sel_pushEntityTemplate_withProxyDelegate_animated_presentationStyle_reply_, 0, 1);
  return v3;
}

+ (void)_allowlistClassesForBaseTemplateProvider:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x24BDBCF20];
  v11 = a3;
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_setLeadingNavigationBarButtons_, 0, 0);

  v7 = (void *)MEMORY[0x24BDBCF20];
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, v9, objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_setTrailingNavigationBarButtons_, 0, 0);

  objc_msgSend(v11, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setBarButton_image_, 1, 0);
  objc_msgSend(v11, "setClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_setHostBackButton_, 0, 0);

}

+ (id)_templateClientInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549CD4F8);
}

- (void)_connectToListenerEndpoint:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithListenerEndpoint:", v4);
  objc_msgSend((id)objc_opt_class(), "_templateProvidingInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v6);
  objc_msgSend((id)objc_opt_class(), "_templateClientInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v7);
  objc_msgSend(v5, "setExportedObject:", self);
  objc_initWeak(&location, self);
  v8 = MEMORY[0x24BDAC760];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __52__CPInterfaceController__connectToListenerEndpoint___block_invoke;
  v12[3] = &unk_24C77C7E8;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v5, "setInterruptionHandler:", v12);
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __52__CPInterfaceController__connectToListenerEndpoint___block_invoke_388;
  v10[3] = &unk_24C77C7E8;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v5, "setInvalidationHandler:", v10);
  objc_msgSend(v5, "resume");
  -[CPInterfaceController setConnection:](self, "setConnection:", v5);
  objc_msgSend(v5, "remoteObjectProxy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPInterfaceController setTemplateProvider:](self, "setTemplateProvider:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __52__CPInterfaceController__connectToListenerEndpoint___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  CarPlayFrameworkGeneralLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __52__CPInterfaceController__connectToListenerEndpoint___block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInterrupted");

}

void __52__CPInterfaceController__connectToListenerEndpoint___block_invoke_388(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;

  CarPlayFrameworkGeneralLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __52__CPInterfaceController__connectToListenerEndpoint___block_invoke_388_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInvalidated");

}

- (void)_connectionInvalidated
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__CPInterfaceController__connectionInvalidated__block_invoke;
  block[3] = &unk_24C77C5B0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __47__CPInterfaceController__connectionInvalidated__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_connectionInterrupted
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__CPInterfaceController__connectionInterrupted__block_invoke;
  block[3] = &unk_24C77C5B0;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __47__CPInterfaceController__connectionInterrupted__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (id)_listenerEndpointForSettings:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  if (a3)
  {
    objc_msgSend(a3, "objectForSetting:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(MEMORY[0x24BDD19A0]);
    objc_msgSend(v3, "endpoint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setEndpoint:", v5);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_synchronousTemplateProvider
{
  void *v2;
  void *v3;

  -[CPInterfaceController connection](self, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __53__CPInterfaceController__synchronousTemplateProvider__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t v3[16];

  if (a2)
  {
    CarPlayFrameworkGeneralLogging();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_20D6F4000, v2, OS_LOG_TYPE_DEFAULT, "Error accessing synchronous template provider", v3, 2u);
    }

  }
}

- (UITraitCollection)carTraitCollection
{
  void *v2;
  void *v3;

  -[CPInterfaceController windowProvider](self, "windowProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "carTraitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UITraitCollection *)v3;
}

- (id)_templateWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  int v6;
  CPTemplate *presentedTemplate;
  void *v8;
  int v9;
  CPTemplate *v10;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;

  v4 = a3;
  -[CPTemplate identifier](self->_presentedTemplate, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", v4);

  if (v6)
  {
    presentedTemplate = self->_presentedTemplate;
LABEL_5:
    v10 = presentedTemplate;
    goto LABEL_6;
  }
  -[CPTemplate identifier](self->_lastPresentedTemplate, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v4);

  if (v9)
  {
    presentedTemplate = self->_lastPresentedTemplate;
    goto LABEL_5;
  }
  -[CPInterfaceController templateMapTable](self, "templateMapTable");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[CPInterfaceController templateMapTable](self, "templateMapTable");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKey:", v4);
    v10 = (CPTemplate *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    CarPlayFrameworkGeneralLogging();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CPInterfaceController _templateWithIdentifier:].cold.1((uint64_t)v4, v15);

    v10 = 0;
  }
LABEL_6:

  return v10;
}

- (void)templateWillAppearWithIdentifier:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v4 = a4;
  -[CPInterfaceController _templateWithIdentifier:](self, "_templateWithIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v10 = v6;
    -[CPInterfaceController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    v6 = v10;
    if ((v8 & 1) != 0)
    {
      -[CPInterfaceController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "templateWillAppear:animated:", v10, v4);

      v6 = v10;
    }
  }

}

- (void)templateDidAppearWithIdentifier:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v4 = a4;
  -[CPInterfaceController _templateWithIdentifier:](self, "_templateWithIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v10 = v6;
    -[CPInterfaceController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    v6 = v10;
    if ((v8 & 1) != 0)
    {
      -[CPInterfaceController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "templateDidAppear:animated:", v10, v4);

      v6 = v10;
    }
  }

}

- (void)templateWillDisappearWithIdentifier:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v4 = a4;
  -[CPInterfaceController _templateWithIdentifier:](self, "_templateWithIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v10 = v6;
    -[CPInterfaceController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    v6 = v10;
    if ((v8 & 1) != 0)
    {
      -[CPInterfaceController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "templateWillDisappear:animated:", v10, v4);

      v6 = v10;
    }
  }

}

- (void)templateDidDisappearWithIdentifier:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v4 = a4;
  -[CPInterfaceController _templateWithIdentifier:](self, "_templateWithIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v10 = v6;
    -[CPInterfaceController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_respondsToSelector();

    v6 = v10;
    if ((v8 & 1) != 0)
    {
      -[CPInterfaceController delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "templateDidDisappear:animated:", v10, v4);

      v6 = v10;
    }
  }

}

- (BOOL)isCarPlayCanvasActive
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowProvider);
  v3 = objc_msgSend(WeakRetained, "activationState") == 0;

  return v3;
}

- (void)updateInterestingLayoutGuideWithInsets:(UIEdgeInsets)a3
{
  _QWORD block[5];
  UIEdgeInsets v4;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__CPInterfaceController_updateInterestingLayoutGuideWithInsets___block_invoke;
  block[3] = &unk_24C77CDC8;
  block[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __64__CPInterfaceController_updateInterestingLayoutGuideWithInsets___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "windowProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateLayoutGuideWithInsets:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

- (void)clientPushNowPlayingTemplateAnimated:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __62__CPInterfaceController_clientPushNowPlayingTemplateAnimated___block_invoke;
  v3[3] = &unk_24C77CE30;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

void __62__CPInterfaceController_clientPushNowPlayingTemplateAnimated___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  CarPlayFrameworkGeneralLogging();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20D6F4000, v2, OS_LOG_TYPE_DEFAULT, "Requesting Now Playing template from client.", v4, 2u);
  }

  +[CPNowPlayingTemplate sharedTemplate](CPNowPlayingTemplate, "sharedTemplate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pushTemplate:animated:completion:", v3, *(unsigned __int8 *)(a1 + 40), &__block_literal_global_399);

}

void __62__CPInterfaceController_clientPushNowPlayingTemplateAnimated___block_invoke_398(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    CarPlayFrameworkGeneralLogging();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138543362;
      v7 = v4;
      _os_log_impl(&dword_20D6F4000, v5, OS_LOG_TYPE_DEFAULT, "Failed to request now playing template with %{public}@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (void)clientAssistantCellUnavailableWithError:(id)a3
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__CPInterfaceController_clientAssistantCellUnavailableWithError___block_invoke;
  block[3] = &unk_24C77C5B0;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __65__CPInterfaceController_clientAssistantCellUnavailableWithError___block_invoke(uint64_t a1)
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

- (void)clientExceededHierarchyDepthLimit
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_402);
}

void __58__CPInterfaceController_clientExceededHierarchyDepthLimit__block_invoke()
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("Application exceeded the hierarchy depth limit"));
  exit(-1);
}

- (void)clientPushedIllegalTemplateOfClass:(id)a3
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__CPInterfaceController_clientPushedIllegalTemplateOfClass___block_invoke;
  block[3] = &unk_24C77C5B0;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __60__CPInterfaceController_clientPushedIllegalTemplateOfClass___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("Application pushed an illegal template of class %@"), *(_QWORD *)(a1 + 32));
  exit(-1);
}

- (void)clientExceededTabBarTabLimit
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_407);
}

void __53__CPInterfaceController_clientExceededTabBarTabLimit__block_invoke()
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("Application exceeded allowed number of tabs"));
  exit(-1);
}

- (void)clientExceededAudioMetadataThrottleLimit
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_410);
}

void __65__CPInterfaceController_clientExceededAudioMetadataThrottleLimit__block_invoke()
{
  NSObject *v0;

  CarPlayFrameworkGeneralLogging();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    __65__CPInterfaceController_clientExceededAudioMetadataThrottleLimit__block_invoke_cold_1();

}

- (void)templateIdentifierDidPop:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __50__CPInterfaceController_templateIdentifierDidPop___block_invoke;
  v6[3] = &unk_24C77C8C8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __50__CPInterfaceController_templateIdentifierDidPop___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "templateStack");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__CPInterfaceController_templateIdentifierDidPop___block_invoke_2;
  v11[3] = &unk_24C77CB28;
  v12 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "indexOfObjectPassingTest:", v11);

  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "templateStack");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "invalidateTemplateProvider");
    objc_msgSend(*(id *)(a1 + 32), "templateStack");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectAtIndex:", v3);

    objc_msgSend(*(id *)(a1 + 32), "templateMapTable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

    CarPlayFrameworkGeneralLogging();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "templateStack");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");
      *(_DWORD *)buf = 134217984;
      v14 = v10;
      _os_log_impl(&dword_20D6F4000, v8, OS_LOG_TYPE_DEFAULT, "Template did pop, stack count: %lu", buf, 0xCu);

    }
  }

}

uint64_t __50__CPInterfaceController_templateIdentifierDidPop___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (void)templateIdentifierDidDismiss:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __54__CPInterfaceController_templateIdentifierDidDismiss___block_invoke;
  v6[3] = &unk_24C77C8C8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __54__CPInterfaceController_templateIdentifierDidDismiss___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "invalidateTemplateProvider");
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = 0;

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "invalidateTemplateProvider");
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 64);
    *(_QWORD *)(v8 + 64) = 0;

  }
  objc_msgSend(*(id *)(a1 + 32), "templateMapTable");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "templateStack");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __54__CPInterfaceController_templateIdentifierDidDismiss___block_invoke_2;
  v17[3] = &unk_24C77CB28;
  v18 = *(id *)(a1 + 40);
  v12 = objc_msgSend(v11, "indexOfObjectPassingTest:", v17);

  if (v12 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "templateStack");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectAtIndex:", v12);

    CarPlayFrameworkGeneralLogging();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "templateStack");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");
      *(_DWORD *)buf = 134217984;
      v20 = v16;
      _os_log_impl(&dword_20D6F4000, v14, OS_LOG_TYPE_DEFAULT, "Template did dismiss, stack count: %lu", buf, 0xCu);

    }
  }

}

uint64_t __54__CPInterfaceController_templateIdentifierDidDismiss___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (id)_activeMapTemplate
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  -[CPInterfaceController templates](self, "templates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__CPInterfaceController__activeMapTemplate__block_invoke;
  v5[3] = &unk_24C77CEB8;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsWithOptions:usingBlock:", 2, v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __43__CPInterfaceController__activeMapTemplate__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)bannerDidAppearWithIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__CPInterfaceController_bannerDidAppearWithIdentifier___block_invoke;
  v6[3] = &unk_24C77C8C8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __55__CPInterfaceController_bannerDidAppearWithIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_activeMapTemplate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bannerDidAppearWithIdentifier:", *(_QWORD *)(a1 + 40));

}

- (void)bannerDidDisappearWithIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__CPInterfaceController_bannerDidDisappearWithIdentifier___block_invoke;
  v6[3] = &unk_24C77C8C8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __58__CPInterfaceController_bannerDidDisappearWithIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_activeMapTemplate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bannerDidDisappearWithIdentifier:", *(_QWORD *)(a1 + 40));

}

- (void)bannerTappedWithIdentifier:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __52__CPInterfaceController_bannerTappedWithIdentifier___block_invoke;
  v6[3] = &unk_24C77C8C8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __52__CPInterfaceController_bannerTappedWithIdentifier___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_activeMapTemplate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bannerTappedWithIdentifier:", *(_QWORD *)(a1 + 40));

}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)delegate
{
  objc_storeWeak((id *)&self->_delegate, delegate);
}

- (BOOL)prefersDarkUserInterfaceStyle
{
  return self->_prefersDarkUserInterfaceStyle;
}

- (void)setPresentedTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_presentedTemplate, a3);
}

- (CPTemplate)rootTemplate
{
  return self->_rootTemplate;
}

- (void)setRootTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_rootTemplate, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (CPTemplateProviding)templateProvider
{
  return self->_templateProvider;
}

- (void)setTemplateProvider:(id)a3
{
  objc_storeStrong((id *)&self->_templateProvider, a3);
}

- (NSMutableArray)templateStack
{
  return self->_templateStack;
}

- (void)setTemplateStack:(id)a3
{
  objc_storeStrong((id *)&self->_templateStack, a3);
}

- (CPTemplate)lastPresentedTemplate
{
  return self->_lastPresentedTemplate;
}

- (void)setLastPresentedTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_lastPresentedTemplate, a3);
}

- (NSMapTable)templateMapTable
{
  return self->_templateMapTable;
}

- (void)setTemplateMapTable:(id)a3
{
  objc_storeStrong((id *)&self->_templateMapTable, a3);
}

- (CPWindow)carWindow
{
  return self->_carWindow;
}

- (void)setCarWindow:(id)a3
{
  objc_storeStrong((id *)&self->_carWindow, a3);
}

- (CPWindowProviding)windowProvider
{
  return (CPWindowProviding *)objc_loadWeakRetained((id *)&self->_windowProvider);
}

- (void)setWindowProvider:(id)a3
{
  objc_storeWeak((id *)&self->_windowProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowProvider);
  objc_storeStrong((id *)&self->_carWindow, 0);
  objc_storeStrong((id *)&self->_templateMapTable, 0);
  objc_storeStrong((id *)&self->_lastPresentedTemplate, 0);
  objc_storeStrong((id *)&self->_templateStack, 0);
  objc_storeStrong((id *)&self->_templateProvider, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_rootTemplate, 0);
  objc_storeStrong((id *)&self->_presentedTemplate, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __34__CPInterfaceController_templates__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_20D6F4000, a2, OS_LOG_TYPE_DEBUG, "template identifier (%@) missing from stack", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_4_0();
}

void __65__CPInterfaceController__pushTabBarTemplate_animated_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_0(&dword_20D6F4000, v0, v1, "Failed to create a tab for %@ with %@");
  OUTLINED_FUNCTION_4_0();
}

- (void)_sceneConnect:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_0(&dword_20D6F4000, v0, v1, "Not attempting endpoint connection.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __52__CPInterfaceController__connectToListenerEndpoint___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_0(&dword_20D6F4000, v0, v1, "Connection interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __52__CPInterfaceController__connectToListenerEndpoint___block_invoke_388_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_0(&dword_20D6F4000, v0, v1, "Connection invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_templateWithIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_20D6F4000, a2, OS_LOG_TYPE_ERROR, "Unable to identify a template with identifier %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_4_0();
}

void __65__CPInterfaceController_clientExceededAudioMetadataThrottleLimit__block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_5_0();
  _os_log_fault_impl(&dword_20D6F4000, v0, OS_LOG_TYPE_FAULT, "Application exceeded audio metadata throttle limit.", v1, 2u);
  OUTLINED_FUNCTION_2_0();
}

@end
