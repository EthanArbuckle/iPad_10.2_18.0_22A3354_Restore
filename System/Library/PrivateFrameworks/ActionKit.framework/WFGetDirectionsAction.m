@implementation WFGetDirectionsAction

- (void)initializeParameters
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WFGetDirectionsAction;
  -[WFGetDirectionsAction initializeParameters](&v5, sel_initializeParameters);
  -[WFGetDirectionsAction parameterForKey:](self, "parameterForKey:", CFSTR("WFGetDirectionsActionMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDataSource:", self);

  -[WFGetDirectionsAction parameterForKey:](self, "parameterForKey:", CFSTR("WFGetDirectionsActionApp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEventObserver:", self);

}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)WFGetDirectionsAction;
  v7 = -[WFGetDirectionsAction setParameterState:forKey:](&v10, sel_setParameterState_forKey_, a3, v6);
  if (v7 && objc_msgSend(v6, "isEqualToString:", CFSTR("WFGetDirectionsActionApp")))
  {
    -[WFGetDirectionsAction parameterForKey:](self, "parameterForKey:", CFSTR("WFGetDirectionsActionMode"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reloadPossibleStates");

  }
  return v7;
}

- (void)parameterAttributesDidChange:(id)a3
{
  void *v4;
  int v5;
  id v6;

  objc_msgSend(a3, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("WFGetDirectionsActionApp"));

  if (v5)
  {
    -[WFGetDirectionsAction parameterForKey:](self, "parameterForKey:", CFSTR("WFGetDirectionsActionMode"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadPossibleStates");

  }
}

- (id)supportedDirectionsModesForAppName:(id)a3
{
  id v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Maps")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("Google Maps")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("Baidu Maps")))
  {
    v6[0] = CFSTR("Driving");
    v6[1] = CFSTR("Walking");
    v6[2] = CFSTR("Biking");
    v6[3] = CFSTR("Transit");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v4;
}

- (id)possibleStatesForEnumeration:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[WFGetDirectionsAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFGetDirectionsActionApp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFGetDirectionsAction supportedDirectionsModesForAppName:](self, "supportedDirectionsModesForAppName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_map:", &__block_literal_global_25878);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)enumeration:(id)a3 localizedLabelForPossibleState:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a4;
  v5 = (void *)objc_opt_class();
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "localizedNameForDirectionsModeString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  uint64_t v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFGetDirectionsAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFGetDirectionsActionApp"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WFMapsAppIdentifierForAppName(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)objc_opt_class();
    -[WFGetDirectionsAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFGetDirectionsActionMode"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "directionsModeFromString:", v8);

    objc_msgSend(MEMORY[0x24BEC15B0], "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDBCF20];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithObject:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __52__WFGetDirectionsAction_runAsynchronouslyWithInput___block_invoke;
    v25[3] = &unk_24F8B5438;
    v25[4] = self;
    v26 = v4;
    v28 = v9;
    v27 = v5;
    objc_msgSend(v10, "requestSandboxExtensionForRunningActionWithAccessResources:completion:", v14, v25);

  }
  else
  {
    WFLocalizedMapsAppNameForAppName(v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v4;
    v16 = (void *)MEMORY[0x24BDD1540];
    v17 = *MEMORY[0x24BEC4270];
    v29[0] = *MEMORY[0x24BDD0FD8];
    v18 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("“%@” Not Installed"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v19, v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v20;
    v29[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Please select a different app for the Show Directions action."));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v21;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", v17, 5, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFGetDirectionsAction finishRunningWithError:](self, "finishRunningWithError:", v23);

    v4 = v24;
  }

}

- (void)getStartAddressWithCompletionHandler:(id)a3
{
  void (**v4)(id, const __CFString *);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  void (**v16)(id, const __CFString *);

  v4 = (void (**)(id, const __CFString *))a3;
  -[WFGetDirectionsAction parameterForKey:](self, "parameterForKey:", CFSTR("WFLocation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFGetDirectionsAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFLocation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "resourceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "resourcesRequiredForDisplayAvailable"))
  {

    goto LABEL_11;
  }
  v11 = objc_msgSend(v9, "isCurrentLocation");

  if ((v11 & 1) != 0)
  {
LABEL_11:
    v4[2](v4, &stru_24F8BBA48);
    goto LABEL_14;
  }
  -[WFGetDirectionsAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFLocation"), objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "items");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __62__WFGetDirectionsAction_getStartAddressWithCompletionHandler___block_invoke;
    v15[3] = &unk_24F8B5460;
    v16 = v4;
    objc_msgSend(v14, "getObjectRepresentation:forClass:", v15, objc_opt_class());

  }
  else
  {
    v4[2](v4, &stru_24F8BBA48);
  }

LABEL_14:
}

- (void)openMapsLink:(id)a3 inAppNamed:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__WFGetDirectionsAction_openMapsLink_inAppNamed___block_invoke;
  v8[3] = &unk_24F8B5488;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  -[WFGetDirectionsAction getMapsURLForMapsLink:appName:completionHandler:](self, "getMapsURLForMapsLink:appName:completionHandler:", a3, v7, v8);

}

- (void)getMapsURLForMapsLink:(id)a3 appName:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, uint64_t, _QWORD);
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a4;
  v8 = (void (**)(id, uint64_t, _QWORD))a5;
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Google Maps")))
  {
    objc_msgSend(v11, "googleMapsAppURL");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v10 = (void *)v9;
    v8[2](v8, v9, 0);

    goto LABEL_10;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Waze")))
  {
    objc_msgSend(v11, "wazeAppURL");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Transit")))
  {
    objc_msgSend(v11, "transitAppURL");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Baidu Maps")))
  {
    objc_msgSend(v11, "baiduMapsAppURL");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("Citymapper")))
    objc_msgSend(v11, "getCitymapperAppURL:", v8);
  else
    objc_msgSend(v11, "getAppleMapsDirectionsURL:", v8);
LABEL_10:

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
  _QWORD v17[5];
  _QWORD v18[5];

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
  -[WFGetDirectionsAction userInterface](self, "userInterface");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = self;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __55__WFGetDirectionsAction_openMapsURL_withAppIdentifier___block_invoke;
  v18[3] = &unk_24F8BA540;
  v18[4] = self;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __55__WFGetDirectionsAction_openMapsURL_withAppIdentifier___block_invoke_2;
  v17[3] = &unk_24F8BB370;
  objc_msgSend(v13, "requestWithURL:scheme:userInterface:bundleIdentifier:successHandler:failureHandler:", v8, v12, v14, v7, v18, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setCallbackRequest:", 0);
  objc_msgSend(v15, "setDeferCompletionUntilReturn:", 0);
  objc_msgSend(MEMORY[0x24BEC39F8], "sharedManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "performRequest:", v15);

}

- (id)appIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;

  -[WFGetDirectionsAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFGetDirectionsActionApp"));
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

  -[WFGetDirectionsAction appIdentifier](self, "appIdentifier", a3);
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
    WFLocalizedString(CFSTR("Allow “%1$@” to get directions in %2$@ by using %3$@?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v7);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to get directions in %2$@?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v11, v9, v10, v14);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __55__WFGetDirectionsAction_openMapsURL_withAppIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
}

uint64_t __55__WFGetDirectionsAction_openMapsURL_withAppIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a2);
}

void __49__WFGetDirectionsAction_openMapsLink_inAppNamed___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if (v6)
  {
    WFMapsAppIdentifierForAppName(*(void **)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "openMapsURL:withAppIdentifier:", v6, v5);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a3);
  }

}

void __62__WFGetDirectionsAction_getStartAddressWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  const __CFString *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "addressString");
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3;
  if (v3)
    v4 = (const __CFString *)v3;
  else
    v4 = &stru_24F8BBA48;
  (*(void (**)(uint64_t, const __CFString *))(v2 + 16))(v2, v4);

}

void __52__WFGetDirectionsAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __52__WFGetDirectionsAction_runAsynchronouslyWithInput___block_invoke_2;
    v7[3] = &unk_24F8B5410;
    v4 = *(id *)(a1 + 40);
    v5 = *(void **)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 56);
    v6 = *(_QWORD *)(a1 + 32);
    v8 = v4;
    v9 = v6;
    v10 = v5;
    objc_msgSend(v2, "getStartAddressWithCompletionHandler:", v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
  }
}

void __52__WFGetDirectionsAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = objc_opt_class();
  v9[0] = MEMORY[0x24BDAC760];
  v9[2] = __52__WFGetDirectionsAction_runAsynchronouslyWithInput___block_invoke_3;
  v9[3] = &unk_24F8B53E8;
  v6 = *(void **)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 40);
  v10 = v3;
  v11 = v7;
  v9[1] = 3221225472;
  v12 = v6;
  v13 = *(id *)(a1 + 32);
  v8 = v3;
  objc_msgSend(v4, "generateCollectionByCoercingToItemClass:completionHandler:", v5, v9);

}

void __52__WFGetDirectionsAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  int8x16_t v13;
  _QWORD v14[4];
  int8x16_t v15;
  id v16;
  uint64_t v17;

  v3 = a2;
  if (objc_msgSend(v3, "numberOfItems"))
  {
    objc_msgSend(v3, "items");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "mapsLink");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x24BE19358]);
    objc_msgSend(v7, "setStartAddress:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v6, "destinationAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v7, "setDestinationAddress:", v8);
    }
    else
    {
      objc_msgSend(v6, "searchQuery");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setDestinationAddress:", v11);

    }
    if (objc_msgSend(v6, "directionsMode"))
      v12 = objc_msgSend(v6, "directionsMode");
    else
      v12 = *(_QWORD *)(a1 + 64);
    objc_msgSend(v7, "setDirectionsMode:", v12);
    objc_msgSend(*(id *)(a1 + 40), "openMapsLink:inAppNamed:", v7, *(_QWORD *)(a1 + 48));

  }
  else
  {
    v9 = *(void **)(a1 + 56);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __52__WFGetDirectionsAction_runAsynchronouslyWithInput___block_invoke_4;
    v14[3] = &unk_24F8B53C0;
    v13 = *(int8x16_t *)(a1 + 32);
    v10 = (id)v13.i64[0];
    v15 = vextq_s8(v13, v13, 8uLL);
    v17 = *(_QWORD *)(a1 + 64);
    v16 = *(id *)(a1 + 48);
    objc_msgSend(v9, "getStringRepresentation:", v14);

  }
}

void __52__WFGetDirectionsAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(v7, "length"))
  {
    v6 = objc_alloc_init(MEMORY[0x24BE19358]);
    objc_msgSend(v6, "setStartAddress:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v6, "setDestinationAddress:", v7);
    objc_msgSend(v6, "setDirectionsMode:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "openMapsLink:inAppNamed:", v6, *(_QWORD *)(a1 + 48));

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v5);
  }

}

id __54__WFGetDirectionsAction_possibleStatesForEnumeration___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BEC40C8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithValue:", v3);

  return v4;
}

+ (unint64_t)directionsModeFromString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Walking")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Transit")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Biking")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (id)localizedNameForDirectionsModeString:(id)a3
{
  id v3;
  __CFString *v4;
  void *v5;

  v3 = a3;
  v4 = CFSTR("Driving");
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Driving")) & 1) != 0
    || (v4 = CFSTR("Transit"), (objc_msgSend(v3, "isEqualToString:", CFSTR("Transit")) & 1) != 0)
    || (v4 = CFSTR("Biking"), (objc_msgSend(v3, "isEqualToString:", CFSTR("Biking")) & 1) != 0)
    || (v4 = CFSTR("Walking"), objc_msgSend(v3, "isEqualToString:", CFSTR("Walking"))))
  {
    WFLocalizedString(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end
