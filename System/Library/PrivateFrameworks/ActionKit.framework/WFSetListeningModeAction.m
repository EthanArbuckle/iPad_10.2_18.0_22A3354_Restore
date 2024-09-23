@implementation WFSetListeningModeAction

- (void)initializeParameters
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFSetListeningModeAction;
  -[WFSetListeningModeAction initializeParameters](&v4, sel_initializeParameters);
  -[WFSetListeningModeAction parameterForKey:](self, "parameterForKey:", CFSTR("WFListeningMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAction:", self);

}

- (id)routeDescriptor
{
  return (id)-[WFSetListeningModeAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFRoute"), objc_opt_class());
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  -[WFSetListeningModeAction routeDescriptor](self, "routeDescriptor", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)objc_opt_new();
    -[WFSetListeningModeAction routeDescriptor](self, "routeDescriptor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __55__WFSetListeningModeAction_runAsynchronouslyWithInput___block_invoke;
    v13[3] = &unk_24F8BAFE0;
    v13[4] = self;
    v14 = v5;
    v7 = v5;
    objc_msgSend(v7, "findRouteMatchingDescriptor:timeout:completionHandler:", v6, v13, 15.0);

  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v9 = *MEMORY[0x24BEC4270];
    v15[0] = *MEMORY[0x24BDD0FD8];
    WFLocalizedString(CFSTR("Could Not Set Noise Control mode"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    v15[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Set Noise Control Mode failed because no route was selected."));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 5, v12);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[WFSetListeningModeAction finishRunningWithError:](self, "finishRunningWithError:", v7);
  }

}

- (id)errorFromRoutePickerError:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id result;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("WFMediaRoutePickerErrorDomain"));

  if ((v6 & 1) != 0)
  {
    -[WFSetListeningModeAction errorUserInfoForRoutePickerErrorCode:](self, "errorUserInfoForRoutePickerErrorCode:", objc_msgSend(v4, "code"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v8, "setObject:forKey:", v4, *MEMORY[0x24BDD1398]);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
    return v9;
  }
  objc_msgSend(v4, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v11 = (_QWORD *)getMPAVRoutingControllerErrorDomainSymbolLoc_ptr_47682;
  v21 = getMPAVRoutingControllerErrorDomainSymbolLoc_ptr_47682;
  if (!getMPAVRoutingControllerErrorDomainSymbolLoc_ptr_47682)
  {
    v12 = MediaPlayerLibrary_47683();
    v11 = dlsym(v12, "MPAVRoutingControllerErrorDomain");
    v19[3] = (uint64_t)v11;
    getMPAVRoutingControllerErrorDomainSymbolLoc_ptr_47682 = (uint64_t)v11;
  }
  _Block_object_dispose(&v18, 8);
  if (v11)
  {
    if (objc_msgSend(v10, "isEqualToString:", *v11))
    {
      v13 = objc_msgSend(v4, "code");

      if (v13 == 6)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
        v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
        v9 = v14;
        goto LABEL_12;
      }
    }
    else
    {

    }
    v14 = v4;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPAVRoutingControllerErrorDomain(void)");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("WFSetListeningModeAction.m"), 30, CFSTR("%s"), dlerror());

  __break(1u);
  return result;
}

- (id)errorUserInfoForRoutePickerErrorCode:(int64_t)a3
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(a3 - 4) < 5)
  {
    v17[0] = *MEMORY[0x24BDD0FD8];
    v5 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("Failed to Set Noise Control Mode on “%@”"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSetListeningModeAction routeDescriptor](self, "routeDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "routeName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v6, v8, v17[0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    v17[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("The Noise Control mode could not be set."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v10;
    v11 = (void *)MEMORY[0x24BDBCE70];
    v12 = v18;
    v13 = v17;
LABEL_7:
    objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    return v3;
  }
  if ((unint64_t)a3 < 3)
  {
    v21[0] = *MEMORY[0x24BDD0FD8];
    v14 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedStringWithKey(CFSTR("Could Not Find “%@” (Listening Mode)"), CFSTR("Could Not Find “%@”"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSetListeningModeAction routeDescriptor](self, "routeDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "routeName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithFormat:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v9;
    v21[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Set Noise Control Mode failed because the device could not be found."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v10;
    v11 = (void *)MEMORY[0x24BDBCE70];
    v12 = v22;
    v13 = v21;
    goto LABEL_7;
  }
  if (a3 == 3)
  {
    v19[0] = *MEMORY[0x24BDD0FD8];
    v15 = (void *)MEMORY[0x24BDD17C8];
    WFLocalizedString(CFSTR("Could Not Set Noise Control Mode on “%@”"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSetListeningModeAction routeDescriptor](self, "routeDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "routeName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringWithFormat:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v9;
    v19[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("It took too long to set the Noise Control mode on the specified device."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v10;
    v11 = (void *)MEMORY[0x24BDBCE70];
    v12 = v20;
    v13 = v19;
    goto LABEL_7;
  }
  return v3;
}

void __55__WFSetListeningModeAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v7, "parameterValueForKey:ofClass:", CFSTR("WFListeningMode"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v9 = (void *)getMPAVOutputDeviceRouteClass_softClass_47701;
    v19 = getMPAVOutputDeviceRouteClass_softClass_47701;
    if (!getMPAVOutputDeviceRouteClass_softClass_47701)
    {
      v15[0] = (id)MEMORY[0x24BDAC760];
      v15[1] = (id)3221225472;
      v15[2] = __getMPAVOutputDeviceRouteClass_block_invoke_47702;
      v15[3] = &unk_24F8BB430;
      v15[4] = &v16;
      __getMPAVOutputDeviceRouteClass_block_invoke_47702((uint64_t)v15);
      v9 = (void *)v17[3];
    }
    v10 = objc_retainAutorelease(v9);
    _Block_object_dispose(&v16, 8);
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15[0] = 0;
      objc_msgSend(v5, "logicalLeaderOutputDevice");
      WFAVOutputDeviceBluetoothListeningModeFromListeningMode(v8);
      v11 = 0;
      if ((MRAVOutputDeviceSetCurrentBluetoothListeningMode() & 1) == 0)
        v11 = v15[0];
      v12 = *(void **)(a1 + 32);
    }
    else
    {
      v14 = *(void **)(a1 + 32);
      objc_msgSend(v14, "errorFromRoutePickerError:", v6);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = v14;
    }
    objc_msgSend(v12, "finishRunningWithError:", v11);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "errorFromRoutePickerError:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "finishRunningWithError:", v13);

  }
}

@end
