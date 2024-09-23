@implementation WFGetDistanceAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[WFGetDistanceAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFGetDirectionsActionMode"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend((id)objc_opt_class(), "transportTypeFromString:", v5);
  -[WFGetDistanceAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFGetDirectionsCustomLocation"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v4;
  objc_msgSend(v7, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", CFSTR("Direct")))
    -[WFGetDistanceAction getDirectDistanceFromOrigin:toDestination:](self, "getDirectDistanceFromOrigin:toDestination:", v9, v11);
  else
    -[WFGetDistanceAction getDistanceFromOrigin:toDestination:transportType:](self, "getDistanceFromOrigin:toDestination:transportType:", v9, v11, v6);

}

- (void)getDirectDistanceFromOrigin:(id)a3 toDestination:(id)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id *v21;
  id v22;
  _QWORD block[7];
  _QWORD v24[5];
  _QWORD v25[2];
  _QWORD v26[5];
  _QWORD v27[2];
  _QWORD v28[5];
  _QWORD v29[2];
  _QWORD v30[5];
  _QWORD v31[2];
  _QWORD v32[5];
  id v33;
  _QWORD v34[5];
  id v35;

  v22 = a3;
  v6 = a4;
  -[WFGetDistanceAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("Accuracy"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  WFCLLocationAccuracyFromWFLocationAccuracy();
  v9 = v8;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__29992;
  v34[4] = __Block_byref_object_dispose__29993;
  v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__29992;
  v32[4] = __Block_byref_object_dispose__29993;
  v33 = 0;
  v10 = dispatch_group_create();
  v11 = -[WFGetDistanceAction originIsCurrentLocation](self, "originIsCurrentLocation");
  dispatch_group_enter(v10);
  v12 = MEMORY[0x24BDAC760];
  if (v11)
  {
    v13 = (void *)MEMORY[0x24BEC3E98];
    -[WFGetDistanceAction workflow](self, "workflow");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "environment");
    v30[0] = v12;
    v30[1] = 3221225472;
    v30[2] = __65__WFGetDistanceAction_getDirectDistanceFromOrigin_toDestination___block_invoke;
    v30[3] = &unk_24F8B5EB0;
    v30[4] = self;
    v31[1] = v34;
    v31[0] = v10;
    objc_msgSend(v13, "determineLocationWithWorkflowEnvironment:desiredAccuracy:completion:", v15, v30, v9);
    v16 = (id *)v31;

  }
  else
  {
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __65__WFGetDistanceAction_getDirectDistanceFromOrigin_toDestination___block_invoke_2;
    v28[3] = &unk_24F8B5ED8;
    v28[4] = self;
    v29[1] = v34;
    v29[0] = v10;
    objc_msgSend(v22, "getObjectRepresentation:forClass:", v28, getCLLocationClass_30013());
    v16 = (id *)v29;
  }

  v17 = -[WFGetDistanceAction destinationIsCurrentLocation](self, "destinationIsCurrentLocation");
  dispatch_group_enter(v10);
  if (v17)
  {
    v18 = (void *)MEMORY[0x24BEC3E98];
    -[WFGetDistanceAction workflow](self, "workflow");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "environment");
    v26[0] = v12;
    v26[1] = 3221225472;
    v26[2] = __65__WFGetDistanceAction_getDirectDistanceFromOrigin_toDestination___block_invoke_3;
    v26[3] = &unk_24F8B5EB0;
    v26[4] = self;
    v27[1] = v32;
    v27[0] = v10;
    objc_msgSend(v18, "determineLocationWithWorkflowEnvironment:desiredAccuracy:completion:", v20, v26, v9);
    v21 = (id *)v27;

  }
  else
  {
    v24[0] = v12;
    v24[1] = 3221225472;
    v24[2] = __65__WFGetDistanceAction_getDirectDistanceFromOrigin_toDestination___block_invoke_4;
    v24[3] = &unk_24F8B5ED8;
    v24[4] = self;
    v25[1] = v32;
    v25[0] = v10;
    objc_msgSend(v6, "getObjectRepresentation:forClass:", v24, getCLLocationClass_30013());
    v21 = (id *)v25;
  }

  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __65__WFGetDistanceAction_getDirectDistanceFromOrigin_toDestination___block_invoke_5;
  block[3] = &unk_24F8B5F00;
  block[4] = self;
  block[5] = v32;
  block[6] = v34;
  dispatch_group_notify(v10, MEMORY[0x24BDAC9B8], block);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);

}

- (void)getDistanceFromOrigin:(id)a3 toDestination:(id)a4 transportType:(unint64_t)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[8];
  _QWORD v17[5];
  NSObject *v18;
  uint64_t *v19;
  _QWORD v20[5];
  NSObject *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v8 = a3;
  v9 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__29992;
  v33 = __Block_byref_object_dispose__29993;
  v10 = -[WFGetDistanceAction originIsCurrentLocation](self, "originIsCurrentLocation");
  v11 = 0;
  if (v10)
  {
    objc_msgSend(getMKMapItemClass(), "mapItemForCurrentLocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34 = v11;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__29992;
  v27 = __Block_byref_object_dispose__29993;
  if (-[WFGetDistanceAction destinationIsCurrentLocation](self, "destinationIsCurrentLocation"))
  {
    objc_msgSend(getMKMapItemClass(), "mapItemForCurrentLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v28 = v12;
  v13 = dispatch_group_create();
  v14 = v13;
  v15 = MEMORY[0x24BDAC760];
  if (!v30[5])
  {
    dispatch_group_enter(v13);
    v20[0] = v15;
    v20[1] = 3221225472;
    v20[2] = __73__WFGetDistanceAction_getDistanceFromOrigin_toDestination_transportType___block_invoke;
    v20[3] = &unk_24F8B5F28;
    v20[4] = self;
    v22 = &v29;
    v21 = v14;
    objc_msgSend(v8, "getObjectRepresentation:forClass:", v20, getMKMapItemClass());

  }
  if (!v24[5])
  {
    dispatch_group_enter(v14);
    v17[0] = v15;
    v17[1] = 3221225472;
    v17[2] = __73__WFGetDistanceAction_getDistanceFromOrigin_toDestination_transportType___block_invoke_2;
    v17[3] = &unk_24F8B5F28;
    v17[4] = self;
    v19 = &v23;
    v18 = v14;
    objc_msgSend(v9, "getObjectRepresentation:forClass:", v17, getMKMapItemClass());

  }
  v16[0] = v15;
  v16[1] = 3221225472;
  v16[2] = __73__WFGetDistanceAction_getDistanceFromOrigin_toDestination_transportType___block_invoke_3;
  v16[3] = &unk_24F8B5F50;
  v16[6] = &v23;
  v16[7] = a5;
  v16[4] = self;
  v16[5] = &v29;
  dispatch_group_notify(v14, MEMORY[0x24BDAC9B8], v16);

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v29, 8);

}

- (void)finishRunningWithDistance:(double)a3
{
  int v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  -[WFGetDistanceAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFDistanceUnit"), objc_opt_class());
  v18 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v18, "isEqualToString:", CFSTR("Miles"));
  v6 = 0.001;
  if (v5)
    v6 = 0.00062137;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v6 * a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setNumberStyle:", 1);
  objc_msgSend(v8, "setMinimumFractionDigits:", 0);
  objc_msgSend(v8, "setMaximumFractionDigits:", 1);
  v9 = objc_alloc_init(MEMORY[0x24BDD1630]);
  objc_msgSend(v9, "setUnitStyle:", 3);
  objc_msgSend(v9, "setNumberFormatter:", v8);
  if (-[WFGetDistanceAction originIsCurrentLocation](self, "originIsCurrentLocation")
    || -[WFGetDistanceAction destinationIsCurrentLocation](self, "destinationIsCurrentLocation"))
  {
    v10 = (void *)MEMORY[0x24BE19428];
    objc_msgSend(MEMORY[0x24BE19470], "locationLocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attributionSetWithOrigin:disclosureLevel:", v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }
  if (v5)
    v13 = 1284;
  else
    v13 = 14;
  -[WFGetDistanceAction output](self, "output");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x24BE19450];
  objc_msgSend(v7, "doubleValue");
  objc_msgSend(v9, "stringFromValue:unit:", v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "itemWithObject:named:attributionSet:", v7, v16, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addItem:", v17);

  -[WFGetDistanceAction finishRunningWithError:](self, "finishRunningWithError:", 0);
}

- (BOOL)originIsCurrentLocation
{
  return -[WFGetDistanceAction locationParameterIsCurrentLocation:](self, "locationParameterIsCurrentLocation:", CFSTR("WFGetDirectionsCustomLocation"));
}

- (BOOL)destinationIsCurrentLocation
{
  return -[WFGetDistanceAction locationParameterIsCurrentLocation:](self, "locationParameterIsCurrentLocation:", CFSTR("WFGetDistanceDestination"));
}

- (BOOL)locationParameterIsCurrentLocation:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[WFGetDistanceAction parameterStateForKey:](self, "parameterStateForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isCurrentLocation");

  return v5;
}

- (id)noLocationError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BEC4270];
  v9[0] = *MEMORY[0x24BDD0FD8];
  WFLocalizedString(CFSTR("Invalid Location"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v9[1] = *MEMORY[0x24BDD0FC8];
  WFLocalizedString(CFSTR("The location specified in the Get Distance action could not be found."));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", v3, 5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)contentDestinationWithError:(id *)a3
{
  void *v4;

  if (-[WFGetDistanceAction originIsCurrentLocation](self, "originIsCurrentLocation", a3)
    || -[WFGetDistanceAction destinationIsCurrentLocation](self, "destinationIsCurrentLocation"))
  {
    objc_msgSend(MEMORY[0x24BE19470], "locationLocation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[WFGetDistanceAction originIsCurrentLocation](self, "originIsCurrentLocation")
    || -[WFGetDistanceAction destinationIsCurrentLocation](self, "destinationIsCurrentLocation"))
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("Allow “%1$@” to access your current location?"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)WFGetDistanceAction;
    -[WFGetDistanceAction smartPromptWithContentDescription:contentDestination:workflowName:](&v15, sel_smartPromptWithContentDescription_contentDestination_workflowName_, v8, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

void __73__WFGetDistanceAction_getDistanceFromOrigin_toDestination_transportType___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = a2;
  if (!v6)
  {
    v7 = *(void **)(a1 + 32);
    WFLocalizedMapKitError(a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishRunningWithError:", v8);

  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __73__WFGetDistanceAction_getDistanceFromOrigin_toDestination_transportType___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = a2;
  if (!v6)
  {
    v7 = *(void **)(a1 + 32);
    WFLocalizedMapKitError(a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishRunningWithError:", v8);

  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __73__WFGetDistanceAction_getDistanceFromOrigin_toDestination_transportType___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "workflow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "environment");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__WFGetDistanceAction_getDistanceFromOrigin_toDestination_transportType___block_invoke_4;
  v7[3] = &unk_24F8B7380;
  v7[4] = *(_QWORD *)(a1 + 32);
  WFGetTravelTime(v2, v4, v3, v6, v7);

}

uint64_t __73__WFGetDistanceAction_getDistanceFromOrigin_toDestination_transportType___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithDistance:");
}

void __65__WFGetDistanceAction_getDirectDistanceFromOrigin_toDestination___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;

  v6 = a2;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a3);
  }

}

void __65__WFGetDistanceAction_getDirectDistanceFromOrigin_toDestination___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;

  v7 = a2;
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a4);
  }

}

void __65__WFGetDistanceAction_getDirectDistanceFromOrigin_toDestination___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;

  v6 = a2;
  if (v6)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a3);
  }

}

void __65__WFGetDistanceAction_getDirectDistanceFromOrigin_toDestination___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;

  v7 = a2;
  if (v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a4);
  }

}

uint64_t __65__WFGetDistanceAction_getDirectDistanceFromOrigin_toDestination___block_invoke_5(_QWORD *a1)
{
  void *v1;

  v1 = (void *)a1[4];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "distanceFromLocation:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  return objc_msgSend(v1, "finishRunningWithDistance:");
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
