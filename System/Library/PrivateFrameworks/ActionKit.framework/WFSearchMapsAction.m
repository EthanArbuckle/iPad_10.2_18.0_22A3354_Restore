@implementation WFSearchMapsAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFSearchMapsAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSearchMapsActionApp"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WFMapsAppIdentifierForAppName(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v20 = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("Maps")))
    {
      objc_msgSend(v7, "arrayByAddingObject:", objc_opt_class());
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __49__WFSearchMapsAction_runAsynchronouslyWithInput___block_invoke;
    v17[3] = &unk_24F8BA500;
    v17[4] = self;
    v18 = v5;
    v19 = v4;
    objc_msgSend(v19, "generateCollectionByCoercingToItemClasses:completionHandler:", v7, v17);

  }
  else
  {
    WFLocalizedMapsAppNameForAppName(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BEC4270];
    v21[0] = *MEMORY[0x24BDD0FD8];
    v10 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("“%@” Not Installed"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v11, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v12;
    v21[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Please select a different app for the Show in Maps action."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v9, 5, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSearchMapsAction finishRunningWithError:](self, "finishRunningWithError:", v15);

  }
}

- (void)openMapItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2050000000;
  v5 = (void *)getMKMapItemClass_softClass_45876;
  v12 = getMKMapItemClass_softClass_45876;
  if (!getMKMapItemClass_softClass_45876)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __getMKMapItemClass_block_invoke_45877;
    v8[3] = &unk_24F8BB430;
    v8[4] = &v9;
    __getMKMapItemClass_block_invoke_45877((uint64_t)v8);
    v5 = (void *)v10[3];
  }
  v6 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v9, 8);
  objc_msgSend(v6, "urlForMapItems:options:", v4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFSearchMapsAction openMapsURL:withAppIdentifier:](self, "openMapsURL:withAppIdentifier:", v7, CFSTR("com.apple.Maps"));

}

- (void)openMapsLink:(id)a3 inAppNamed:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  WFMapsAppIdentifierForAppName(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Google Maps")))
  {
    objc_msgSend(v10, "googleMapsAppURL");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("Waze")))
      objc_msgSend(v10, "wazeAppURL");
    else
      objc_msgSend(v10, "mapsAppURL");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
  -[WFSearchMapsAction openMapsURL:withAppIdentifier:](self, "openMapsURL:withAppIdentifier:", v8, v7);

}

- (void)openMapsURL:(id)a3 withAppIdentifier:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  _QWORD v19[5];

  v6 = (void *)MEMORY[0x24BEC39F0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "sharedRegistry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appWithIdentifier:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "scheme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "schemeNamed:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BEC4238];
  -[WFSearchMapsAction userInterface](self, "userInterface");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = self;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __52__WFSearchMapsAction_openMapsURL_withAppIdentifier___block_invoke;
  v19[3] = &unk_24F8BA540;
  v19[4] = self;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __52__WFSearchMapsAction_openMapsURL_withAppIdentifier___block_invoke_2;
  v18[3] = &unk_24F8BB370;
  objc_msgSend(v13, "requestWithURL:scheme:userInterface:bundleIdentifier:successHandler:failureHandler:", v8, v12, v14, v15, v19, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setCallbackRequest:", 0);
  objc_msgSend(v16, "setDeferCompletionUntilReturn:", 0);
  objc_msgSend(MEMORY[0x24BEC39F8], "sharedManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "performRequest:", v16);

}

- (id)appIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;

  -[WFSearchMapsAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFSearchMapsActionApp"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "value");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WFMapsAppIdentifierForAppName(v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("com.apple.Maps");
    v6 = CFSTR("com.apple.Maps");
  }

  return v5;
}

- (id)contentDestinationWithError:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WFSearchMapsAction appIdentifier](self, "appIdentifier", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.Maps")) & 1) == 0)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD9BD0]), "initWithBundleIdentifier:", v4);
    objc_msgSend(MEMORY[0x24BE19390], "locationWithAppDescriptor:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v7 = a3;
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = a5;
  v10 = a4;
  if (v7)
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to search for locations in %2$@ by using %3$@?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v7);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to search for locations in %2$@?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v14);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __52__WFSearchMapsAction_openMapsURL_withAppIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
}

uint64_t __52__WFSearchMapsAction_openMapsURL_withAppIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a2);
}

void __49__WFSearchMapsAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
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
  _QWORD v12[5];
  id v13;

  v3 = a2;
  if (objc_msgSend(v3, "numberOfItems"))
  {
    objc_msgSend(v3, "items");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "items");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "if_objectsOfClass:", objc_opt_class());
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "valueForKey:", CFSTR("mapItem"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "openMapItems:", v8);
    }
    else
    {
      v11 = *(void **)(a1 + 32);
      objc_msgSend(v5, "mapsLink");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "openMapsLink:inAppNamed:", v8, *(_QWORD *)(a1 + 40));
    }

  }
  else
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __49__WFSearchMapsAction_runAsynchronouslyWithInput___block_invoke_2;
    v12[3] = &unk_24F8BA4D8;
    v9 = *(void **)(a1 + 40);
    v10 = *(void **)(a1 + 48);
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v9;
    objc_msgSend(v10, "getStringRepresentation:", v12);

  }
}

void __49__WFSearchMapsAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(v7, "length"))
  {
    v6 = objc_alloc_init(MEMORY[0x24BE19358]);
    objc_msgSend(v6, "setSearchQuery:", v7);
    objc_msgSend(*(id *)(a1 + 32), "openMapsLink:inAppNamed:", v6, *(_QWORD *)(a1 + 40));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v5);
  }

}

@end
