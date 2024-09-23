@implementation WFShareExtensionAction

- (void)runWithRemoteUserInterface:(id)a3 input:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "numberOfItems"))
  {
    objc_msgSend(MEMORY[0x24BDD1618], "wf_securelyArchivedDataWithRootObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFShareExtensionAction inputConfiguration](self, "inputConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFShareExtensionAction socialServiceType](self, "socialServiceType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFShareExtensionAction extensionBundleIdentifier](self, "extensionBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFShareExtensionAction extensionUserInfo](self, "extensionUserInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __59__WFShareExtensionAction_runWithRemoteUserInterface_input___block_invoke;
    v13[3] = &unk_24F8BAFA8;
    v13[4] = self;
    objc_msgSend(v6, "performActionWithInput:inputConfiguration:socialServiceType:extensionBundleIdentifier:extensionUserInfo:completionHandler:", v8, v9, v10, v11, v12, v13);

  }
  else
  {
    -[WFShareExtensionAction finishRunningWithError:](self, "finishRunningWithError:", 0);
  }

}

- (id)stringRepresentationForClasses:(id)a3
{
  return (id)objc_msgSend(a3, "if_map:", &__block_literal_global_13059);
}

- (id)localizedDescriptionSummaryWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WFShareExtensionAction;
  -[WFShareExtensionAction localizedDescriptionSummaryWithContext:](&v14, sel_localizedDescriptionSummaryWithContext_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedStringResourceWithKey(CFSTR("Shares the input with %@."), CFSTR("Shares the input with %@."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localize:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFShareExtensionAction app](self, "app");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v10, v12);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)shareExtensionDefinition
{
  void *v2;
  void *v3;

  -[WFShareExtensionAction definition](self, "definition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ShareExtension"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)inputConfiguration
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  -[WFShareExtensionAction inputType](self, "inputType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFShareExtensionAction inputType](self, "inputType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("InputType"));

  }
  -[WFShareExtensionAction textItemHandling](self, "textItemHandling");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[WFShareExtensionAction textItemHandling](self, "textItemHandling");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("TextItemHandling"));

  }
  -[WFShareExtensionAction inputContentClasses](self, "inputContentClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[WFShareExtensionAction inputContentClasses](self, "inputContentClasses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFShareExtensionAction stringRepresentationForClasses:](self, "stringRepresentationForClasses:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("InputContentItemClasses"));

  }
  -[WFShareExtensionAction contentItemClasses](self, "contentItemClasses");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[WFShareExtensionAction contentItemClasses](self, "contentItemClasses");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFShareExtensionAction stringRepresentationForClasses:](self, "stringRepresentationForClasses:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("ContentItemClasses"));

  }
  return v3;
}

- (id)extensionBundleIdentifier
{
  void *v2;
  void *v3;

  -[WFShareExtensionAction shareExtensionDefinition](self, "shareExtensionDefinition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("BundleIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)socialServiceType
{
  void *v2;
  void *v3;

  -[WFShareExtensionAction shareExtensionDefinition](self, "shareExtensionDefinition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ServiceType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)inputContentClasses
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[WFShareExtensionAction contentItemClasses](self, "contentItemClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[WFShareExtensionAction inputType](self, "inputType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("SLTypes")))
    {
      v7 = (void *)MEMORY[0x24BDBCF20];
      -[WFShareExtensionAction socialTypes](self, "socialTypes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setWithArray:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = (id)objc_opt_new();
      if (objc_msgSend(v9, "containsObject:", CFSTR("Text")))
        objc_msgSend(v5, "addObject:", objc_opt_class());
      if (objc_msgSend(v9, "containsObject:", CFSTR("URL")))
        objc_msgSend(v5, "addObject:", objc_opt_class());
      if (objc_msgSend(v9, "containsObject:", CFSTR("Image")))
        objc_msgSend(v5, "addObject:", objc_opt_class());
      if (objc_msgSend(v9, "containsObject:", CFSTR("File")))
        objc_msgSend(v5, "addObject:", objc_opt_class());

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)contentItemClasses
{
  void *v2;
  void *v3;
  void *v4;

  -[WFShareExtensionAction shareExtensionDefinition](self, "shareExtensionDefinition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ContentItemClasses"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "if_flatMap:", &__block_literal_global_214);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)inputType
{
  void *v2;
  void *v3;

  -[WFShareExtensionAction shareExtensionDefinition](self, "shareExtensionDefinition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("InputType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)socialTypes
{
  void *v2;
  void *v3;

  -[WFShareExtensionAction shareExtensionDefinition](self, "shareExtensionDefinition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("SLTypes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)textItemHandling
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  __CFString *v5;

  -[WFShareExtensionAction shareExtensionDefinition](self, "shareExtensionDefinition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("TextItemHandling"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("ItemProvider");
  v5 = v3;

  return v5;
}

- (id)extensionUserInfo
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  Class v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  id obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[WFShareExtensionAction shareExtensionDefinition](self, "shareExtensionDefinition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("UserInfo"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v19 = v4;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v9, "objectForKey:", CFSTR("ParameterKey"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKey:", CFSTR("DestinationKey"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKey:", CFSTR("ItemClass"));
          v12 = (NSString *)objc_claimAutoreleasedReturnValue();
          v13 = NSClassFromString(v12);

          -[WFShareExtensionAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", v10, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            objc_msgSend(v9, "objectForKey:", CFSTR("ValueMapping"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15;
            if (v15)
            {
              objc_msgSend(v15, "objectForKey:", v14);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKey:", v17, v11);

            }
            else
            {
              objc_msgSend(v21, "setObject:forKey:", v14, v11);
            }

          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v6);
    }

    v4 = v19;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

Class __44__WFShareExtensionAction_contentItemClasses__block_invoke(int a1, NSString *aClassName)
{
  return NSClassFromString(aClassName);
}

NSString *__57__WFShareExtensionAction_stringRepresentationForClasses___block_invoke(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

void __59__WFShareExtensionAction_runWithRemoteUserInterface_input___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setOutput:", a2);
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

+ (id)userInterfaceProtocol
{
  return &unk_255DFDF78;
}

@end
