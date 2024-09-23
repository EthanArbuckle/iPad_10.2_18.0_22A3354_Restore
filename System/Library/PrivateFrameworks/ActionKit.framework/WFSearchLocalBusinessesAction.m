@implementation WFSearchLocalBusinessesAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  WFSearchLocalBusinessesAction *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __60__WFSearchLocalBusinessesAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_24F8B4B50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "getObjectRepresentation:forClass:", v6, getCLLocationClass_22853());

}

- (void)runSearchWithLocation:(id)a3 inputDisclosureLevel:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  objc_class *v22;
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v45[4];
  id v46;
  WFSearchLocalBusinessesAction *v47;
  id v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  _BYTE buf[24];
  void *v61;
  uint64_t *v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[WFSearchLocalBusinessesAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSearchQuery"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    -[WFSearchLocalBusinessesAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSearchRadius"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = (void *)MEMORY[0x24BEC1540];
      objc_msgSend(v7, "unitString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "unitFromString:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = objc_alloc(MEMORY[0x24BDD1660]);
        objc_msgSend(v8, "magnitude");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValue");
        v14 = (void *)objc_msgSend(v12, "initWithDoubleValue:unit:", v11);

        objc_msgSend(MEMORY[0x24BDD1928], "meters");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "canBeConvertedToUnit:", v15);

        if (!v16)
          goto LABEL_28;
        objc_msgSend(MEMORY[0x24BDD1928], "meters");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "measurementByConvertingToUnit:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v18, "doubleValue");
        v20 = v19;

        if (v20 <= 0.0)
        {
LABEL_28:
          if (-[WFSearchLocalBusinessesAction shouldUseMetricSystem](self, "shouldUseMetricSystem"))
            v20 = 1500.0;
          else
            v20 = 1609.34;
        }
        v50 = 0;
        v51 = &v50;
        v52 = 0x2050000000;
        v21 = (void *)getMKLocalSearchRequestClass_softClass;
        v53 = getMKLocalSearchRequestClass_softClass;
        if (!getMKLocalSearchRequestClass_softClass)
        {
          *(_QWORD *)buf = MEMORY[0x24BDAC760];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __getMKLocalSearchRequestClass_block_invoke;
          v61 = &unk_24F8BB430;
          v62 = &v50;
          __getMKLocalSearchRequestClass_block_invoke((uint64_t)buf);
          v21 = (void *)v51[3];
        }
        v22 = objc_retainAutorelease(v21);
        _Block_object_dispose(&v50, 8);
        v23 = objc_alloc_init(v22);
        objc_msgSend(v23, "setNaturalLanguageQuery:", v6);
        objc_msgSend(v5, "coordinate");
        v25 = v24;
        v27 = v26;
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v28 = getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr;
        v61 = getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr;
        if (!getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr)
        {
          v29 = MapKitLibrary();
          v28 = dlsym(v29, "MKCoordinateRegionMakeWithDistance");
          *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v28;
          getMKCoordinateRegionMakeWithDistanceSymbolLoc_ptr = v28;
        }
        _Block_object_dispose(buf, 8);
        if (!v28)
        {
          objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "MKCoordinateRegion WFMKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D, CLLocationDistance, CLLocationDistance)");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, CFSTR("WFSearchLocalBusinessesAction.m"), 26, CFSTR("%s"), dlerror());

          __break(1u);
        }
        ((void (*)(double, double, double, double))v28)(v25, v27, v20, v20);
        v30 = MEMORY[0x24BDAC760];
        objc_msgSend(v23, "setRegion:");
        v50 = 0;
        v51 = &v50;
        v52 = 0x2050000000;
        v31 = (void *)getMKLocalSearchClass_softClass;
        v53 = getMKLocalSearchClass_softClass;
        if (!getMKLocalSearchClass_softClass)
        {
          *(_QWORD *)buf = v30;
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __getMKLocalSearchClass_block_invoke;
          v61 = &unk_24F8BB430;
          v62 = &v50;
          __getMKLocalSearchClass_block_invoke((uint64_t)buf);
          v31 = (void *)v51[3];
        }
        v32 = objc_retainAutorelease(v31);
        _Block_object_dispose(&v50, 8);
        v33 = (void *)objc_msgSend([v32 alloc], "initWithRequest:", v23);
        -[WFSearchLocalBusinessesAction setLocalSearch:](self, "setLocalSearch:", v33);

        -[WFSearchLocalBusinessesAction localSearch](self, "localSearch");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v45[0] = v30;
        v45[1] = 3221225472;
        v45[2] = __76__WFSearchLocalBusinessesAction_runSearchWithLocation_inputDisclosureLevel___block_invoke;
        v45[3] = &unk_24F8B4B78;
        v46 = v23;
        v47 = self;
        v48 = v5;
        v49 = a4;
        v35 = v23;
        objc_msgSend(v34, "startWithCompletionHandler:", v45);

        v36 = v46;
      }
      else
      {
        getWFActionsLogObject();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v8, "unitString");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)&buf[4] = "-[WFSearchLocalBusinessesAction runSearchWithLocation:inputDisclosureLevel:]";
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v40;
          _os_log_impl(&dword_22D353000, v39, OS_LOG_TYPE_ERROR, "%s WFSearchLocalBusinessesAction parameters had invalid radius unit: %@", buf, 0x16u);

        }
        v41 = (void *)MEMORY[0x24BDD1540];
        v54 = *MEMORY[0x24BDD0FC8];
        WFLocalizedString(CFSTR("The unit for the radius parameter is invalid."));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v14;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
        v35 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFSearchLocalBusinessesAction finishRunningWithError:](self, "finishRunningWithError:", v36);
      }

    }
    else
    {
      v38 = (void *)MEMORY[0x24BDD1540];
      v56 = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("You must provide a radius value to Search Local Businesses."));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, v14);
      v35 = (id)objc_claimAutoreleasedReturnValue();
      -[WFSearchLocalBusinessesAction finishRunningWithError:](self, "finishRunningWithError:", v35);
    }

  }
  else
  {
    v37 = (void *)MEMORY[0x24BDD1540];
    v58 = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("You must provide a search query to Search Local Businesses."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSearchLocalBusinessesAction finishRunningWithError:](self, "finishRunningWithError:", v14);
  }

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  -[WFSearchLocalBusinessesAction localSearch](self, "localSearch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  v4.receiver = self;
  v4.super_class = (Class)WFSearchLocalBusinessesAction;
  -[WFSearchLocalBusinessesAction cancel](&v4, sel_cancel);
}

- (BOOL)shouldUseMetricSystem
{
  return objc_msgSend(MEMORY[0x24BEC1540], "usesMetricSystemForUnitType:", *MEMORY[0x24BEC19E8]);
}

- (void)getContentDestinationWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[WFSearchLocalBusinessesAction input](self, "input");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __76__WFSearchLocalBusinessesAction_getContentDestinationWithCompletionHandler___block_invoke;
  v7[3] = &unk_24F8B4BA0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "getObjectRepresentation:forClass:", v7, getCLLocationClass_22853());

}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a5;
  WFLocalizedString(CFSTR("Allow “%1$@” to use your current location to search for local businesses in Maps?"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (MKLocalSearch)localSearch
{
  return self->_localSearch;
}

- (void)setLocalSearch:(id)a3
{
  objc_storeStrong((id *)&self->_localSearch, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localSearch, 0);
}

void __76__WFSearchLocalBusinessesAction_getContentDestinationWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32), 0, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE19470], "locationLocation");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v2 + 16))(v2, v3, 0);

  }
}

void __76__WFSearchLocalBusinessesAction_runSearchWithLocation_inputDisclosureLevel___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _QWORD v40[2];
  _QWORD v41[4];

  v41[2] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "mapItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
    objc_msgSend(v6, "domain");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    getMKErrorDomain();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "isEqualToString:", v22))
    {
      v23 = objc_msgSend(v6, "code");

      if (v23 == 4)
      {
        v24 = (void *)MEMORY[0x24BDD1540];
        getMKErrorDomain();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = *MEMORY[0x24BDD0FD8];
        WFLocalizedString(CFSTR("No Locations Found"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = v26;
        v40[1] = *MEMORY[0x24BDD0FC8];
        v27 = (void *)MEMORY[0x24BDD17C8];
        WFLocalizedString(CFSTR("No locations were found with the keywords “%@”."));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "naturalLanguageQuery");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "localizedStringWithFormat:", v28, v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v41[1] = v30;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 4, v31);
        v20 = objc_claimAutoreleasedReturnValue();

        v6 = (id)v20;
        goto LABEL_15;
      }
    }
    else
    {

    }
    v20 = (uint64_t)v6;
    goto LABEL_15;
  }
  v32 = v6;
  v33 = v5;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v5, "mapItems");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v36;
    v12 = *MEMORY[0x24BEC16E8];
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(obj);
        v14 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v13);
        objc_msgSend(*(id *)(a1 + 40), "output");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)MEMORY[0x24BE19560];
        v17 = *(_QWORD *)(a1 + 48);
        objc_msgSend(MEMORY[0x24BE19390], "locationWithSystemAppBundleIdentifier:", v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "itemWithMapItem:fromQueryLocation:origin:disclosureLevel:", v14, v17, v18, *(_QWORD *)(a1 + 56));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addItem:", v19);

        ++v13;
      }
      while (v10 != v13);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v10);
  }

  v20 = 0;
  v6 = v32;
  v5 = v33;
LABEL_15:
  objc_msgSend(*(id *)(a1 + 40), "finishRunningWithError:", v20);

}

void __60__WFSearchLocalBusinessesAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  double *v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(*(id *)(a1 + 32), "attributionSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "derivedDisclosureLevel");

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "runSearchWithLocation:inputDisclosureLevel:", v7, v11);
LABEL_9:

    return;
  }
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "finishRunningWithError:", v9);
    goto LABEL_9;
  }
  v12 = (void *)MEMORY[0x24BEC3E98];
  objc_msgSend(*(id *)(a1 + 40), "workflow");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "environment");
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v15 = (double *)getkCLLocationAccuracyHundredMetersSymbolLoc_ptr;
  v24 = getkCLLocationAccuracyHundredMetersSymbolLoc_ptr;
  if (!getkCLLocationAccuracyHundredMetersSymbolLoc_ptr)
  {
    v16 = CoreLocationLibrary_22856();
    v15 = (double *)dlsym(v16, "kCLLocationAccuracyHundredMeters");
    v22[3] = (uint64_t)v15;
    getkCLLocationAccuracyHundredMetersSymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&v21, 8);
  if (v15)
  {
    v17 = *v15;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __60__WFSearchLocalBusinessesAction_runAsynchronouslyWithInput___block_invoke_2;
    v20[3] = &unk_24F8B4B28;
    v20[4] = *(_QWORD *)(a1 + 40);
    v20[5] = v11;
    objc_msgSend(v12, "determineLocationWithWorkflowEnvironment:desiredAccuracy:completion:", v14, v20, v17);

    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CLLocationAccuracy getkCLLocationAccuracyHundredMeters(void)");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("WFSearchLocalBusinessesAction.m"), 30, CFSTR("%s"), dlerror());

  __break(1u);
}

uint64_t __60__WFSearchLocalBusinessesAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;

  v3 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v3, "runSearchWithLocation:inputDisclosureLevel:", a2, *(_QWORD *)(a1 + 40));
  else
    return objc_msgSend(v3, "finishRunningWithError:");
}

@end
