@implementation WFHandOffPlaybackAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  WFMediaRoutePicker *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[5];

  v4 = -[WFMediaRoutePicker initWithRouteType:]([WFMediaRoutePicker alloc], "initWithRouteType:", 2);
  -[WFHandOffPlaybackAction sourceRouteDescriptor](self, "sourceRouteDescriptor");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[WFHandOffPlaybackAction destinationRouteDescriptor](self, "destinationRouteDescriptor"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        v7))
  {
    -[WFHandOffPlaybackAction sourceRouteDescriptor](self, "sourceRouteDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "routeUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHandOffPlaybackAction destinationRouteDescriptor](self, "destinationRouteDescriptor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "routeUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __54__WFHandOffPlaybackAction_runAsynchronouslyWithInput___block_invoke;
    v18[3] = &unk_24F8BB370;
    v18[4] = self;
    -[WFMediaRoutePicker handOffFromSourceUID:toDestinationUID:timeout:completionHandler:](v4, "handOffFromSourceUID:toDestinationUID:timeout:completionHandler:", v9, v11, v18, 20.0);

  }
  else
  {
    -[WFHandOffPlaybackAction sourceRouteDescriptor](self, "sourceRouteDescriptor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {

    }
    else
    {
      -[WFHandOffPlaybackAction destinationRouteDescriptor](self, "destinationRouteDescriptor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
      {
        -[WFHandOffPlaybackAction finishRunningWithError:](self, "finishRunningWithError:", 0);
        goto LABEL_14;
      }
    }
    -[WFHandOffPlaybackAction sourceRouteDescriptor](self, "sourceRouteDescriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      -[WFHandOffPlaybackAction destinationRouteDescriptor](self, "destinationRouteDescriptor");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v16;

    -[WFHandOffPlaybackAction invokingHomePodRouteDescriptor](self, "invokingHomePodRouteDescriptor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      -[WFHandOffPlaybackAction runWhenInvokedThroughHomePodWithSpecifiedDescriptor:picker:](self, "runWhenInvokedThroughHomePodWithSpecifiedDescriptor:picker:", v8, v4);
    else
      -[WFHandOffPlaybackAction runWhenInvokedThroughLocalDeviceWithSpecifiedDescriptor:picker:](self, "runWhenInvokedThroughLocalDeviceWithSpecifiedDescriptor:picker:", v8, v4);
  }

LABEL_14:
}

- (void)runWhenInvokedThroughHomePodWithSpecifiedDescriptor:(id)a3 picker:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  WFHandOffPlaybackAction *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  -[WFHandOffPlaybackAction sourceRouteDescriptor](self, "sourceRouteDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFHandOffPlaybackAction invokingHomePodRouteDescriptor](self, "invokingHomePodRouteDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "isEqualInRouteUIDs:", v8))
  {
    if (v7)
    {
      objc_msgSend(v15, "routeUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFHandOffPlaybackAction localEndpoint](self, "localEndpoint");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "routeUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = self;
      v13 = v9;
    }
    else
    {
      -[WFHandOffPlaybackAction localEndpoint](self, "localEndpoint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "routeUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "routeUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = self;
      v13 = v10;
    }
    -[WFHandOffPlaybackAction runWithSourceRouteUID:destinationRouteUID:routePicker:](v12, "runWithSourceRouteUID:destinationRouteUID:routePicker:", v13, v11, v6);

LABEL_12:
    goto LABEL_13;
  }
  if (v8)
  {
    if (v7)
    {
      objc_msgSend(v15, "routeUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v8;
    }
    else
    {
      objc_msgSend(v8, "routeUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v15;
    }
    objc_msgSend(v14, "routeUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFHandOffPlaybackAction runWithSourceRouteUID:destinationRouteUID:routePicker:](self, "runWithSourceRouteUID:destinationRouteUID:routePicker:", v9, v10, v6);
    goto LABEL_12;
  }
  -[WFHandOffPlaybackAction finishRunningWithError:](self, "finishRunningWithError:", 0);
LABEL_13:

}

- (void)runWhenInvokedThroughLocalDeviceWithSpecifiedDescriptor:(id)a3 picker:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  WFHandOffPlaybackAction *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  BOOL v17;

  v6 = a3;
  v7 = a4;
  -[WFHandOffPlaybackAction sourceRouteDescriptor](self, "sourceRouteDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isLocalDevice"))
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __90__WFHandOffPlaybackAction_runWhenInvokedThroughLocalDeviceWithSpecifiedDescriptor_picker___block_invoke;
    v14[3] = &unk_24F8B0490;
    v14[4] = self;
    v17 = v8 == 0;
    v15 = v6;
    v16 = v7;
    -[WFHandOffPlaybackAction askForUserSpecificationOfMissingRouteWithRoutePicker:completionBlock:](self, "askForUserSpecificationOfMissingRouteWithRoutePicker:completionBlock:", v16, v14);

  }
  else
  {
    if (v8)
    {
      objc_msgSend(v6, "routeUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFHandOffPlaybackAction localEndpoint](self, "localEndpoint");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "routeUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = self;
      v13 = v9;
    }
    else
    {
      -[WFHandOffPlaybackAction localEndpoint](self, "localEndpoint");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "routeUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "routeUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = self;
      v13 = v10;
    }
    -[WFHandOffPlaybackAction runWithSourceRouteUID:destinationRouteUID:routePicker:](v12, "runWithSourceRouteUID:destinationRouteUID:routePicker:", v13, v11, v7);

  }
}

- (void)runWithSourceRouteUID:(id)a3 destinationRouteUID:(id)a4 routePicker:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __81__WFHandOffPlaybackAction_runWithSourceRouteUID_destinationRouteUID_routePicker___block_invoke;
  v5[3] = &unk_24F8BB370;
  v5[4] = self;
  objc_msgSend(a5, "handOffFromSourceUID:toDestinationUID:timeout:completionHandler:", a3, a4, v5, 20.0);
}

- (id)invokingHomePodRouteDescriptor
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  WFMediaRouteDescriptor *v8;

  -[WFHandOffPlaybackAction userInterface](self, "userInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isRunningWithSiriUI"))
  {
    -[WFHandOffPlaybackAction userInterface](self, "userInterface");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) == 0)
      goto LABEL_7;
    -[WFHandOffPlaybackAction userInterface](self, "userInterface");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "airPlayRouteIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
LABEL_7:
      v8 = 0;
      return v8;
    }
    v8 = -[WFMediaRouteDescriptor initWithRouteUID:groupUID:routeName:isLocalDevice:]([WFMediaRouteDescriptor alloc], "initWithRouteUID:groupUID:routeName:isLocalDevice:", v3, 0, 0, 0);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)localEndpoint
{
  void *v2;
  objc_class *v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getMPAVEndpointRouteClass_softClass;
  v9 = getMPAVEndpointRouteClass_softClass;
  if (!getMPAVEndpointRouteClass_softClass)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getMPAVEndpointRouteClass_block_invoke;
    v5[3] = &unk_24F8BB430;
    v5[4] = &v6;
    __getMPAVEndpointRouteClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  return (id)objc_msgSend([v3 alloc], "initWithEndpoint:", MRAVEndpointGetLocalEndpoint());
}

- (void)findInvokingHomePodEndpointWithRoutePicker:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v6 = a3;
  v7 = a4;
  -[WFHandOffPlaybackAction invokingHomePodRouteDescriptor](self, "invokingHomePodRouteDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __86__WFHandOffPlaybackAction_findInvokingHomePodEndpointWithRoutePicker_completionBlock___block_invoke;
    v9[3] = &unk_24F8B04B8;
    v9[4] = self;
    v10 = v7;
    objc_msgSend(v6, "findHandoffRouteMatchingDescriptor:timeout:completionHandler:", v8, v9, 5.0);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

- (void)askForUserSpecificationOfMissingRouteWithRoutePicker:(id)a3 completionBlock:(id)a4
{
  id v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v5 = a4;
  -[WFHandOffPlaybackAction sourceRouteDescriptor](self, "sourceRouteDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = CFSTR("WFDestinationMediaRoute");
  else
    v7 = CFSTR("WFSourceMediaRoute");
  -[WFHandOffPlaybackAction parameterForKey:](self, "parameterForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCF00], "orderedSetWithObject:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __96__WFHandOffPlaybackAction_askForUserSpecificationOfMissingRouteWithRoutePicker_completionBlock___block_invoke;
  v13[3] = &unk_24F8B04E0;
  v14 = v8;
  v15 = v5;
  v11 = v5;
  v12 = v8;
  -[WFHandOffPlaybackAction askForValuesOfParameters:withDefaultStates:prompts:input:workQueue:completionHandler:](self, "askForValuesOfParameters:withDefaultStates:prompts:input:workQueue:completionHandler:", v9, MEMORY[0x24BDBD1B8], MEMORY[0x24BDBD1B8], 0, v10, v13);

}

- (id)sourceRouteDescriptor
{
  return (id)-[WFHandOffPlaybackAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSourceMediaRoute"), objc_opt_class());
}

- (id)destinationRouteDescriptor
{
  return (id)-[WFHandOffPlaybackAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFDestinationMediaRoute"), objc_opt_class());
}

- (id)errorFromRoutePickerError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("WFMediaRoutePickerErrorDomain"));

    if ((v7 & 1) != 0)
    {
      objc_msgSend(v5, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("InvolvedMediaRoute"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      -[WFHandOffPlaybackAction errorUserInfoForRoutePickerErrorCode:involvedRouteName:](self, "errorUserInfoForRoutePickerErrorCode:involvedRouteName:", objc_msgSend(v5, "code"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v10, "mutableCopy");
      objc_msgSend(v11, "setObject:forKey:", v5, *MEMORY[0x24BDD1398]);
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 5, v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = v5;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)errorUserInfoForRoutePickerErrorCode:(int64_t)a3 involvedRouteName:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  _QWORD *v18;
  void *v19;
  void *v20;
  _QWORD v22[2];
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (!v6)
  {
    WFLocalizedString(CFSTR("Unknown"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
      v28[0] = *MEMORY[0x24BDD0FD8];
      v15 = (void *)MEMORY[0x24BDD17C8];
      WFLocalizedString(CFSTR("Could Not Find “%@”"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "localizedStringWithFormat:", v8, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v9;
      v28[1] = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("Hand Off Playback failed because the specified device could not be found."));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v29[1] = v10;
      v16 = (void *)MEMORY[0x24BDBCE70];
      v17 = v29;
      v18 = v28;
      goto LABEL_8;
    case 3:
    case 4:
    case 6:
    case 7:
      v22[0] = *MEMORY[0x24BDD0FD8];
      v7 = (void *)MEMORY[0x24BDD17C8];
      WFLocalizedString(CFSTR("Failed to Hand Off Music Between “%@” and “%@”"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFHandOffPlaybackAction sourceRouteDescriptor](self, "sourceRouteDescriptor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "routeName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFHandOffPlaybackAction destinationRouteDescriptor](self, "destinationRouteDescriptor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "routeName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringWithFormat:", v8, v10, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23[0] = v13;
      v22[1] = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("Couldn't hand off music between specified devices."));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
      self = (WFHandOffPlaybackAction *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    case 5:
      v26[0] = *MEMORY[0x24BDD0FD8];
      v19 = (void *)MEMORY[0x24BDD17C8];
      WFLocalizedString(CFSTR("Could Not Connect To “%@”"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringWithFormat:", v8, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = v9;
      v26[1] = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("It took too long to connect to the specified device."));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v27[1] = v10;
      v16 = (void *)MEMORY[0x24BDBCE70];
      v17 = v27;
      v18 = v26;
      goto LABEL_8;
    case 8:
      v24[0] = *MEMORY[0x24BDD0FD8];
      v20 = (void *)MEMORY[0x24BDD17C8];
      WFLocalizedString(CFSTR("Device “%@” Is Not Playing Music"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringWithFormat:", v8, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v9;
      v24[1] = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("The specified device is not playing any music."));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v10;
      v16 = (void *)MEMORY[0x24BDBCE70];
      v17 = v25;
      v18 = v24;
LABEL_8:
      objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 2);
      self = (WFHandOffPlaybackAction *)objc_claimAutoreleasedReturnValue();
LABEL_9:

      break;
    default:
      break;
  }

  return self;
}

void __96__WFHandOffPlaybackAction_askForUserSpecificationOfMissingRouteWithRoutePicker_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  int v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "key");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  v12 = v10;
  if (v12 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    getWFGeneralLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      v17 = 136315906;
      v18 = "WFEnforceClass";
      v19 = 2114;
      v20 = v12;
      v21 = 2114;
      v22 = (id)objc_opt_class();
      v23 = 2114;
      v24 = v11;
      v15 = v22;
      _os_log_impl(&dword_22D353000, v14, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", (uint8_t *)&v17, 0x2Au);

    }
    v13 = 0;
  }
  else
  {
    v13 = v12;
  }

  if (v13)
    v16 = v13;
  else
    v16 = 0;
  (*(void (**)(_QWORD, id, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v16, v6);

}

void __86__WFHandOffPlaybackAction_findInvokingHomePodEndpointWithRoutePicker_completionBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "errorFromRoutePickerError:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v7);

}

uint64_t __81__WFHandOffPlaybackAction_runWithSourceRouteUID_destinationRouteUID_routePicker___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
}

void __90__WFHandOffPlaybackAction_runWhenInvokedThroughLocalDeviceWithSpecifiedDescriptor_picker___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v11)
  {
    if (*(_BYTE *)(a1 + 56))
      v7 = v11;
    else
      v7 = *(void **)(a1 + 40);
    objc_msgSend(v7, "routeUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 56))
      v9 = *(void **)(a1 + 40);
    else
      v9 = v11;
    objc_msgSend(v9, "routeUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "runWithSourceRouteUID:destinationRouteUID:routePicker:", v8, v10, *(_QWORD *)(a1 + 48));

  }
  else
  {
    objc_msgSend(v6, "finishRunningWithError:", v5);
  }

}

uint64_t __54__WFHandOffPlaybackAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
}

@end
