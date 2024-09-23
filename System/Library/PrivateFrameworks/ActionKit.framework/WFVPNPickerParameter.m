@implementation WFVPNPickerParameter

- (WFVPNPickerParameter)initWithDefinition:(id)a3
{
  WFVPNPickerParameter *v3;
  WFVPNPickerParameter *v4;
  WFVPNPickerParameter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFVPNPickerParameter;
  v3 = -[WFVPNPickerParameter initWithDefinition:](&v7, sel_initWithDefinition_, a3);
  v4 = v3;
  if (v3)
  {
    -[WFDynamicEnumerationParameter setDataSource:](v3, "setDataSource:", v3);
    v5 = v4;
  }

  return v4;
}

- (Class)singleStateClass
{
  return (Class)objc_opt_class();
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a4, "value", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)enumeration:(id)a3 localizedSubtitleLabelForPossibleState:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a4, "value", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)accessoryIconForPossibleState:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;

  objc_msgSend(a3, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "isInstalled"))
  {
    v5 = objc_alloc(MEMORY[0x24BEC1338]);
    objc_msgSend(v4, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithBundleIdentifier:", v6);
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x24BEC1610]);
    v9 = objc_alloc(MEMORY[0x24BEC14D0]);
    objc_msgSend(MEMORY[0x24BEC1398], "colorWithPaletteColor:", 7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "initWithColor:", v6);
    v7 = (void *)objc_msgSend(v8, "initWithSymbolName:background:", CFSTR("network.connected.to.line.below.fill"), v10);

  }
  return v7;
}

- (BOOL)enumerationAllowsMultipleValues:(id)a3
{
  return 0;
}

- (void)loadPossibleStatesForEnumeration:(id)a3 searchTerm:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v10 = (void *)getNEVPNManagerClass_softClass;
  v20 = getNEVPNManagerClass_softClass;
  v11 = MEMORY[0x24BDAC760];
  if (!getNEVPNManagerClass_softClass)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __getNEVPNManagerClass_block_invoke;
    v16[3] = &unk_24F8BB430;
    v16[4] = &v17;
    __getNEVPNManagerClass_block_invoke((uint64_t)v16);
    v10 = (void *)v18[3];
  }
  v12 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v17, 8);
  v14[0] = v11;
  v14[1] = 3221225472;
  v14[2] = __86__WFVPNPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke;
  v14[3] = &unk_24F8B9110;
  v15 = v9;
  v13 = v9;
  objc_msgSend(v12, "loadAllFromPreferencesWithCompletionHandler:", v14);

}

void __86__WFVPNPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v7 = objc_alloc(MEMORY[0x24BDD9ED0]);
    objc_msgSend(v5, "if_compactMap:", &__block_literal_global_40274);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithItems:", v8);

    getWFActionsLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v9, "allItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 136315394;
      v14 = "-[WFVPNPickerParameter loadPossibleStatesForEnumeration:searchTerm:completionHandler:]_block_invoke";
      v15 = 2048;
      v16 = objc_msgSend(v11, "count");
      _os_log_impl(&dword_22D353000, v10, OS_LOG_TYPE_DEBUG, "%s Returning %lu available NEVPNManagers", (uint8_t *)&v13, 0x16u);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    getWFActionsLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v13 = 136315138;
      v14 = "-[WFVPNPickerParameter loadPossibleStatesForEnumeration:searchTerm:completionHandler:]_block_invoke";
      _os_log_impl(&dword_22D353000, v12, OS_LOG_TYPE_DEBUG, "%s No NEVPNManagers found.", (uint8_t *)&v13, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

WFVPNParameterState *__86__WFVPNPickerParameter_loadPossibleStatesForEnumeration_searchTerm_completionHandler___block_invoke_116(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  WFVPNParameterState *v13;
  WFVPNConfiguration *v14;
  void *v15;
  void *v16;
  WFVPNConfiguration *v17;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(v2, "identifier");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        objc_msgSend(v2, "localizedDescription"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "length"),
        v5,
        v4,
        v6))
  {
    objc_msgSend(v2, "appBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9BD0]), "initWithBundleIdentifier:", v7);
      objc_msgSend(MEMORY[0x24BDD9BF0], "sharedResolver");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "resolvedAppMatchingDescriptor:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }
    v14 = [WFVPNConfiguration alloc];
    objc_msgSend(v2, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[WFVPNConfiguration initWithIdentifier:title:appDescriptor:](v14, "initWithIdentifier:title:appDescriptor:", v15, v16, v10);

    v13 = -[WFVariableSubstitutableParameterState initWithValue:]([WFVPNParameterState alloc], "initWithValue:", v17);
  }
  else
  {
    getWFActionsLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 136315394;
      v20 = "-[WFVPNPickerParameter loadPossibleStatesForEnumeration:searchTerm:completionHandler:]_block_invoke";
      v21 = 2112;
      v22 = v12;
      _os_log_impl(&dword_22D353000, v11, OS_LOG_TYPE_ERROR, "%s Skipping VPNManager because of missing fields: %@", (uint8_t *)&v19, 0x16u);

    }
    v13 = 0;
  }

  return v13;
}

@end
