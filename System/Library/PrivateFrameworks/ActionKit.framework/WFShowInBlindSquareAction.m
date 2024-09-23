@implementation WFShowInBlindSquareAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__WFShowInBlindSquareAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_24F8BA0E8;
  v6[4] = self;
  objc_msgSend(v4, "generateCollectionByCoercingToItemClasses:completionHandler:", v5, v6);

}

- (void)showMapItem:(id)a3 named:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "placemark");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "phoneNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFShowInBlindSquareAction showPlacemark:named:phoneNumber:](self, "showPlacemark:named:phoneNumber:", v9, v6, v8);
}

- (void)showPlacemark:(id)a3 named:(id)a4 phoneNumber:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v8 = (void *)MEMORY[0x24BE19618];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "streetAddressWithPlacemark:label:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addressString");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "location");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFShowInBlindSquareAction showLocation:named:address:phoneNumber:](self, "showLocation:named:address:phoneNumber:", v13, v10, v14, v9);
}

- (void)showLocation:(id)a3 named:(id)a4 address:(id)a5 phoneNumber:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[WFShowInBlindSquareAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFBlindSquareSimulation"), objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");
  v16 = CFSTR("open");
  if (v15)
    v16 = CFSTR("simulate");
  v17 = v16;

  objc_msgSend(v13, "coordinate");
  v19 = v18;
  v21 = v20;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f"), v19);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%f"), v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjectsAndKeys:", v17, CFSTR("action"), v22, CFSTR("lat"), v23, CFSTR("lon"), v12, CFSTR("name"), v11, CFSTR("address"), v10, CFSTR("phoneNumber"), 0);

  v25 = (void *)MEMORY[0x24BDBCF48];
  v26 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDBCF48], "dc_queryStringWithQueryDictionary:", v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("blindsquare://api/place?%@"), v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "URLWithString:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE193A0], "sharedContext");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFShowInBlindSquareAction appDescriptor](self, "appDescriptor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "bundleIdentifier");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFShowInBlindSquareAction userInterface](self, "userInterface");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __68__WFShowInBlindSquareAction_showLocation_named_address_phoneNumber___block_invoke;
  v34[3] = &unk_24F8B7FF0;
  v34[4] = self;
  objc_msgSend(v30, "openURL:withBundleIdentifier:userInterface:completionHandler:", v29, v32, v33, v34);

}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = a5;
  if (v6)
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to show %2$@ in BlindSquare?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v6);
  }
  else
  {
    WFLocalizedString(CFSTR("Allow “%1$@” to show content in BlindSquare?"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v9, v8, v12);
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __68__WFShowInBlindSquareAction_showLocation_named_address_phoneNumber___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:");
}

void __56__WFShowInBlindSquareAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  int v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v7, "numberOfItems"))
  {
    objc_msgSend(v7, "items");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "preferredObjectType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    v31 = &v30;
    v32 = 0x2050000000;
    v13 = (void *)getMKMapItemClass_softClass;
    v33 = getMKMapItemClass_softClass;
    if (!getMKMapItemClass_softClass)
    {
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __getMKMapItemClass_block_invoke;
      v29[3] = &unk_24F8BB430;
      v29[4] = &v30;
      __getMKMapItemClass_block_invoke((uint64_t)v29);
      v13 = (void *)v31[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v30, 8);
    LODWORD(v14) = objc_msgSend(v12, "conformsToClass:", v14);

    if ((_DWORD)v14)
    {
      v15 = *(void **)(a1 + 32);
      objc_msgSend(v11, "mapItem");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "name");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "showMapItem:named:", v16, v17);

    }
    else
    {
      objc_msgSend(v11, "preferredObjectType");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "conformsToClass:", getCLPlacemarkClass());

      if (v19)
      {
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __56__WFShowInBlindSquareAction_runAsynchronouslyWithInput___block_invoke_2;
        v27[3] = &unk_24F8B3C70;
        v27[4] = *(_QWORD *)(a1 + 32);
        v28 = v11;
        objc_msgSend(v28, "getObjectRepresentation:forClass:", v27, getCLPlacemarkClass());
        v20 = v28;
      }
      else
      {
        objc_msgSend(v11, "preferredObjectType");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "conformsToClass:", objc_opt_class());

        if (v22)
        {
          v25[0] = MEMORY[0x24BDAC760];
          v25[1] = 3221225472;
          v25[2] = __56__WFShowInBlindSquareAction_runAsynchronouslyWithInput___block_invoke_3;
          v25[3] = &unk_24F8B3CC0;
          v25[4] = *(_QWORD *)(a1 + 32);
          v26 = v11;
          objc_msgSend(v26, "getObjectRepresentation:forClass:", v25, objc_opt_class());
          v20 = v26;
        }
        else
        {
          v23[0] = MEMORY[0x24BDAC760];
          v23[1] = 3221225472;
          v23[2] = __56__WFShowInBlindSquareAction_runAsynchronouslyWithInput___block_invoke_5;
          v23[3] = &unk_24F8B4B50;
          v23[4] = *(_QWORD *)(a1 + 32);
          v24 = v11;
          objc_msgSend(v24, "getObjectRepresentation:forClass:", v23, getCLLocationClass());
          v20 = v24;
        }
      }

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v9);
  }

}

void __56__WFShowInBlindSquareAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v9 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "showPlacemark:named:phoneNumber:", v9, v8, 0);

  }
  else
  {
    objc_msgSend(v7, "finishRunningWithError:", a4);
  }

}

void __56__WFShowInBlindSquareAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v6 = a2;
  if (v6)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __56__WFShowInBlindSquareAction_runAsynchronouslyWithInput___block_invoke_4;
    v8[3] = &unk_24F8B3C98;
    v7 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v7;
    v10 = v6;
    objc_msgSend(v9, "getObjectRepresentation:forClass:", v8, getCLLocationClass());

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a4);
  }

}

void __56__WFShowInBlindSquareAction_runAsynchronouslyWithInput___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v9 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "showLocation:named:address:phoneNumber:", v9, v8, 0, 0);

  }
  else
  {
    objc_msgSend(v7, "finishRunningWithError:", a4);
  }

}

void __56__WFShowInBlindSquareAction_runAsynchronouslyWithInput___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a2;
  v7 = *(void **)(a1 + 32);
  v10 = v6;
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "addressString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "showLocation:named:address:phoneNumber:", v10, v8, v9, 0);

  }
  else
  {
    objc_msgSend(v7, "finishRunningWithError:", a4);
  }

}

@end
