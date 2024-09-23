@implementation WFGetTravelTimeAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[6];

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[WFGetTravelTimeAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFGetDirectionsActionMode"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "transportTypeFromString:", v6);

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __52__WFGetTravelTimeAction_runAsynchronouslyWithInput___block_invoke;
  v8[3] = &unk_24F8B73F8;
  v8[4] = self;
  v8[5] = v7;
  -[WFGetTravelTimeAction getMapItemFromCollection:parameterKey:completionHandler:](self, "getMapItemFromCollection:parameterKey:completionHandler:", v4, CFSTR("WFDestination"), v8);

}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = -[WFGetTravelTimeAction isStartOrDestinationCurrentLocation](self, "isStartOrDestinationCurrentLocation");
    objc_msgSend(MEMORY[0x24BE19470], "locationLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFGetTravelTimeAction output](self, "output");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BE19450];
    objc_msgSend(MEMORY[0x24BE19458], "configurationWithOrigin:disclosureLevel:", v9, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "itemWithObject:privacyConfiguration:", v6, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addItem:", v13);

    -[WFGetTravelTimeAction finishRunningWithError:](self, "finishRunningWithError:", v7);
  }
  else
  {
    getWFActionsLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315394;
      v16 = "-[WFGetTravelTimeAction finishWithResult:error:]";
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_22D353000, v14, OS_LOG_TYPE_ERROR, "%s hit an error %@", (uint8_t *)&v15, 0x16u);
    }

    -[WFGetTravelTimeAction finishRunningWithError:](self, "finishRunningWithError:", v7);
  }

}

- (void)getMapItemFromCollection:(id)a3 parameterKey:(id)a4 completionHandler:(id)a5
{
  void (**v8)(id, void *, _QWORD);
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = (void (**)(id, void *, _QWORD))a5;
  -[WFGetTravelTimeAction parameterStateForKey:](self, "parameterStateForKey:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "value");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isCurrentLocation");

  if (v11)
  {
    objc_msgSend(getMKMapItemClass_35886(), "mapItemForCurrentLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v12, 0);
  }
  else
  {
    -[WFGetTravelTimeAction localizedName](self, "localizedName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    WFGetMapItemFromContentCollection(v13, v12, v8);
  }

}

- (BOOL)isStartOrDestinationCurrentLocation
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;

  -[WFGetTravelTimeAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFGetDirectionsCustomLocation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFGetTravelTimeAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFDestination"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isCurrentLocation") & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v4, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "isCurrentLocation");

  }
  return v6;
}

- (id)outputContentClasses
{
  void *v2;
  void *v3;
  int v4;
  uint64_t *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  -[WFGetTravelTimeAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("WFGetDirectionsActionMode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Transit"));

  if (v4)
  {
    v9[0] = objc_opt_class();
    v5 = v9;
  }
  else
  {
    v8 = objc_opt_class();
    v5 = &v8;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)setParameterState:(id)a3 forKey:(id)a4
{
  id v6;
  _BOOL4 v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)WFGetTravelTimeAction;
  v7 = -[WFGetTravelTimeAction setParameterState:forKey:](&v9, sel_setParameterState_forKey_, a3, v6);
  if (v7 && objc_msgSend(v6, "isEqualToString:", CFSTR("WFGetDirectionsActionMode")))
    -[WFGetTravelTimeAction outputDetailsUpdated](self, "outputDetailsUpdated");

  return v7;
}

void __52__WFGetTravelTimeAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v8, "parameterValueForKey:ofClass:", CFSTR("WFGetDirectionsCustomLocation"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __52__WFGetTravelTimeAction_runAsynchronouslyWithInput___block_invoke_2;
    v19[3] = &unk_24F8B73D0;
    v11 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v20 = v9;
    v21 = v11;
    v23 = v10;
    v22 = v5;
    v12 = v9;
    objc_msgSend(v11, "getMapItemFromCollection:parameterKey:completionHandler:", v12, CFSTR("WFGetDirectionsCustomLocation"), v19);

  }
  else if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);
  }
  else
  {
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BEC4270];
    v24[0] = *MEMORY[0x24BDD0FD8];
    WFLocalizedString(CFSTR("No Location"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v15;
    v24[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Get Travel Time needs a destination location, but none was specified."));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v16;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 6, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishRunningWithError:", v18);

  }
}

void __52__WFGetTravelTimeAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD *v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[5];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = *(void **)(a1 + 48);
    v8 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "workflow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "environment");
    if (v8 == 4)
    {
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __52__WFGetTravelTimeAction_runAsynchronouslyWithInput___block_invoke_3;
      v23[3] = &unk_24F8B7380;
      v23[4] = *(_QWORD *)(a1 + 40);
      WFGetTravelTime(v5, v7, 4, v10, v23);
    }
    else
    {
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __52__WFGetTravelTimeAction_runAsynchronouslyWithInput___block_invoke_4;
      v22[3] = &unk_24F8B73A8;
      v22[4] = *(_QWORD *)(a1 + 40);
      WFGetTravelTimeWithTripInfo(v5, v7, v8, v10, v22);
    }

  }
  else
  {
    v11 = objc_msgSend(*(id *)(a1 + 32), "numberOfItems");
    v12 = *(void **)(a1 + 40);
    v13 = (void *)MEMORY[0x24BDD1540];
    v14 = *MEMORY[0x24BEC4270];
    if (v11)
    {
      v24[0] = *MEMORY[0x24BDD0FD8];
      WFLocalizedString(CFSTR("Start Location Not Found"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v15;
      v24[1] = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("Get Travel Time needs a start location, but the specified start location could not be found."));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v16;
      v17 = (void *)MEMORY[0x24BDBCE70];
      v18 = v25;
      v19 = v24;
    }
    else
    {
      v26[0] = *MEMORY[0x24BDD0FD8];
      WFLocalizedString(CFSTR("No Start Location"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v15;
      v26[1] = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("Get Travel Time needs a start location, but none was provided."));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v16;
      v17 = (void *)MEMORY[0x24BDBCE70];
      v18 = v27;
      v19 = v26;
    }
    objc_msgSend(v17, "dictionaryWithObjects:forKeys:count:", v18, v19, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 5, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "finishRunningWithError:", v21);

  }
}

uint64_t __52__WFGetTravelTimeAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

uint64_t __52__WFGetTravelTimeAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:error:", a2, a3);
}

+ (unint64_t)transportTypeFromString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Walking")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Transit")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Biking")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

@end
