@implementation WFGetHalfwayPointAction

- (void)getPlacemarkFromCollection:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__WFGetHalfwayPointAction_getPlacemarkFromCollection_completionHandler___block_invoke;
  v10[3] = &unk_24F8B9560;
  v11 = v5;
  v12 = v6;
  v8 = v5;
  v9 = v6;
  objc_msgSend(v8, "generateCollectionByCoercingToItemClass:completionHandler:", v7, v10);

}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[9];
  _QWORD v26[4];
  NSObject *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD v30[4];
  NSObject *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;
  _QWORD v38[4];
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[4];
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[3];

  v47[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFGetHalfwayPointAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFGetHalfwayPointFirstLocation"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "numberOfItems"))
  {
    -[WFGetHalfwayPointAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFGetHalfwayPointSecondLocation"), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "numberOfItems"))
    {
      v41[0] = 0;
      v41[1] = v41;
      v41[2] = 0x3010000000;
      v42 = 0;
      v43 = 0;
      v41[3] = &unk_22D71EEA1;
      getkCLLocationCoordinate2DInvalid();
      v42 = v7;
      v43 = v8;
      v38[0] = 0;
      v38[1] = v38;
      v38[2] = 0x3010000000;
      v39 = 0;
      v40 = 0;
      v38[3] = &unk_22D71EEA1;
      getkCLLocationCoordinate2DInvalid();
      v39 = v9;
      v40 = v10;
      v36[0] = 0;
      v36[1] = v36;
      v36[2] = 0x3032000000;
      v36[3] = __Block_byref_object_copy__33018;
      v36[4] = __Block_byref_object_dispose__33019;
      v37 = 0;
      v34[0] = 0;
      v34[1] = v34;
      v34[2] = 0x3032000000;
      v34[3] = __Block_byref_object_copy__33018;
      v34[4] = __Block_byref_object_dispose__33019;
      v35 = 0;
      v11 = dispatch_group_create();
      dispatch_group_enter(v11);
      v12 = MEMORY[0x24BDAC760];
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __54__WFGetHalfwayPointAction_runAsynchronouslyWithInput___block_invoke;
      v30[3] = &unk_24F8B6838;
      v32 = v41;
      v33 = v36;
      v13 = v11;
      v31 = v13;
      -[WFGetHalfwayPointAction getPlacemarkFromCollection:completionHandler:](self, "getPlacemarkFromCollection:completionHandler:", v5, v30);
      dispatch_group_enter(v13);
      v26[0] = v12;
      v26[1] = 3221225472;
      v26[2] = __54__WFGetHalfwayPointAction_runAsynchronouslyWithInput___block_invoke_2;
      v26[3] = &unk_24F8B6838;
      v28 = v38;
      v29 = v34;
      v14 = v13;
      v27 = v14;
      -[WFGetHalfwayPointAction getPlacemarkFromCollection:completionHandler:](self, "getPlacemarkFromCollection:completionHandler:", v6, v26);
      dispatch_get_global_queue(0, 0);
      v15 = objc_claimAutoreleasedReturnValue();
      v25[0] = v12;
      v25[1] = 3221225472;
      v25[2] = __54__WFGetHalfwayPointAction_runAsynchronouslyWithInput___block_invoke_3;
      v25[3] = &unk_24F8B6860;
      v25[4] = self;
      v25[5] = v41;
      v25[6] = v38;
      v25[7] = v36;
      v25[8] = v34;
      dispatch_group_notify(v14, v15, v25);

      _Block_object_dispose(v34, 8);
      _Block_object_dispose(v36, 8);

      _Block_object_dispose(v38, 8);
      _Block_object_dispose(v41, 8);
    }
    else
    {
      v20 = (void *)MEMORY[0x24BDD1540];
      v44[0] = *MEMORY[0x24BDD0FD8];
      WFLocalizedString(CFSTR("No second location was provided."));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v21;
      v44[1] = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("Please provide a second location."));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v45[1] = v22;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFGetHalfwayPointAction finishRunningWithError:](self, "finishRunningWithError:", v24);

    }
  }
  else
  {
    v16 = (void *)MEMORY[0x24BDD1540];
    v46[0] = *MEMORY[0x24BDD0FD8];
    WFLocalizedString(CFSTR("No first location was provided."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v47[0] = v6;
    v46[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Please provide a first location."));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v47[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 22, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFGetHalfwayPointAction finishRunningWithError:](self, "finishRunningWithError:", v19);

  }
}

void __54__WFGetHalfwayPointAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coordinate");
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v7 + 32) = v8;
    *(_QWORD *)(v7 + 40) = v9;

  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;
  v12 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __54__WFGetHalfwayPointAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v5 = a3;
  if (a2)
  {
    objc_msgSend(a2, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coordinate");
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v7 + 32) = v8;
    *(_QWORD *)(v7 + 40) = v9;

  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v5;
  v12 = v5;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __54__WFGetHalfwayPointAction_runAsynchronouslyWithInput___block_invoke_3(uint64_t a1)
{
  int v2;
  char v3;
  uint64_t v4;
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  __double2 v11;
  __double2 v12;
  __double2 v13;
  long double v14;
  double v15;
  double v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[5];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  WFCLLocationCoordinate2DIsValid(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  if (v2
    && (WFCLLocationCoordinate2DIsValid(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40)), (v3 & 1) != 0))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(double *)(v4 + 32);
    v5 = *(double *)(v4 + 40);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = v5 * 3.14159265 / 180.0;
    v9 = v6 * 3.14159265 / 180.0;
    v10 = *(double *)(v7 + 40) * 3.14159265 / 180.0 - v8;
    v11 = __sincos_stret(*(double *)(v7 + 32) * 3.14159265 / 180.0);
    v12 = __sincos_stret(v10);
    v13 = __sincos_stret(v9);
    v14 = v13.__cosval + v11.__cosval * v12.__cosval;
    v15 = atan2(v13.__sinval + v11.__sinval, sqrt(v11.__cosval * v12.__sinval * (v11.__cosval * v12.__sinval) + v14 * v14));
    v16 = atan2(v11.__cosval * v12.__sinval, v14);
    v26 = 0;
    v27 = &v26;
    v28 = 0x2050000000;
    v17 = (void *)getCLLocationClass_softClass_33021;
    v29 = getCLLocationClass_softClass_33021;
    if (!getCLLocationClass_softClass_33021)
    {
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __getCLLocationClass_block_invoke_33022;
      v25[3] = &unk_24F8BB430;
      v25[4] = &v26;
      __getCLLocationClass_block_invoke_33022((uint64_t)v25);
      v17 = (void *)v27[3];
    }
    v18 = objc_retainAutorelease(v17);
    _Block_object_dispose(&v26, 8);
    v19 = (void *)objc_msgSend([v18 alloc], "initWithLatitude:longitude:", v15 * 180.0 / 3.14159265, (v8 + v16) * 180.0 / 3.14159265);
    objc_msgSend(*(id *)(a1 + 32), "output");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x24BE19450];
    objc_msgSend(MEMORY[0x24BE19470], "locationLocation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "itemWithObject:origin:disclosureLevel:", v19, v22, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addItem:", v23);

    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
  }
  else
  {
    v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (!v24)
      v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v24);
  }
}

void __72__WFGetHalfwayPointAction_getPlacemarkFromCollection_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(v7, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = v11;
    v13 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __72__WFGetHalfwayPointAction_getPlacemarkFromCollection_completionHandler___block_invoke_2;
    v19[3] = &unk_24F8B8168;
    v20 = *(id *)(a1 + 40);
    v22 = 0;
    v23 = &v22;
    v24 = 0x2050000000;
    v14 = (void *)getCLPlacemarkClass_softClass_33052;
    v25 = getCLPlacemarkClass_softClass_33052;
    if (!getCLPlacemarkClass_softClass_33052)
    {
      v21[0] = v13;
      v21[1] = 3221225472;
      v21[2] = __getCLPlacemarkClass_block_invoke_33053;
      v21[3] = &unk_24F8BB430;
      v21[4] = &v22;
      __getCLPlacemarkClass_block_invoke_33053((uint64_t)v21);
      v14 = (void *)v23[3];
    }
    v15 = objc_retainAutorelease(v14);
    _Block_object_dispose(&v22, 8);
    objc_msgSend(v12, "getObjectRepresentation:forClass:", v19, v15);

  }
  else
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __72__WFGetHalfwayPointAction_getPlacemarkFromCollection_completionHandler___block_invoke_3;
    v17[3] = &unk_24F8B72E0;
    v16 = *(void **)(a1 + 32);
    v18 = *(id *)(a1 + 40);
    objc_msgSend(v16, "getStringRepresentation:", v17);
    v12 = v18;
  }

}

uint64_t __72__WFGetHalfwayPointAction_getPlacemarkFromCollection_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __72__WFGetHalfwayPointAction_getPlacemarkFromCollection_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "length"))
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2050000000;
    v7 = (void *)getCLGeocoderClass_softClass;
    v17 = getCLGeocoderClass_softClass;
    v8 = MEMORY[0x24BDAC760];
    if (!getCLGeocoderClass_softClass)
    {
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __getCLGeocoderClass_block_invoke;
      v13[3] = &unk_24F8BB430;
      v13[4] = &v14;
      __getCLGeocoderClass_block_invoke((uint64_t)v13);
      v7 = (void *)v15[3];
    }
    v9 = objc_retainAutorelease(v7);
    _Block_object_dispose(&v14, 8);
    v10 = (void *)objc_opt_new();
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __72__WFGetHalfwayPointAction_getPlacemarkFromCollection_completionHandler___block_invoke_4;
    v11[3] = &unk_24F8B9110;
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v10, "geocodeAddressString:completionHandler:", v5, v11);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __72__WFGetHalfwayPointAction_getPlacemarkFromCollection_completionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

@end
