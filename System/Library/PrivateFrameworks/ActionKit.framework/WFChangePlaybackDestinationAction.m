@implementation WFChangePlaybackDestinationAction

- (id)routeDescriptor
{
  return (id)-[WFChangePlaybackDestinationAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMediaRoute"), objc_opt_class());
}

- (int64_t)operation
{
  void *v2;
  int64_t v3;

  -[WFChangePlaybackDestinationAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMediaRouteOperation"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("Add")) & 1) != 0)
  {
    v3 = 1;
  }
  else if (objc_msgSend(v2, "isEqualToString:", CFSTR("Remove")))
  {
    v3 = 2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = (void *)objc_opt_new();
  -[WFChangePlaybackDestinationAction routeDescriptor](self, "routeDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__WFChangePlaybackDestinationAction_runAsynchronouslyWithInput___block_invoke;
  v7[3] = &unk_24F8BAFE0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v6, "findRouteMatchingDescriptor:timeout:completionHandler:", v5, v7, 15.0);

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
  uint64_t v12;
  id v13;
  id result;
  void *v15;
  void *v16;
  _QWORD v17[5];
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
    -[WFChangePlaybackDestinationAction errorUserInfoForRoutePickerErrorCode:](self, "errorUserInfoForRoutePickerErrorCode:", objc_msgSend(v4, "code"));
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
  v11 = (_QWORD *)getMPAVRoutingControllerErrorDomainSymbolLoc_ptr;
  v21 = getMPAVRoutingControllerErrorDomainSymbolLoc_ptr;
  if (!getMPAVRoutingControllerErrorDomainSymbolLoc_ptr)
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __getMPAVRoutingControllerErrorDomainSymbolLoc_block_invoke;
    v17[3] = &unk_24F8BB430;
    v17[4] = &v18;
    __getMPAVRoutingControllerErrorDomainSymbolLoc_block_invoke(v17);
    v11 = (_QWORD *)v19[3];
  }
  _Block_object_dispose(&v18, 8);
  if (v11)
  {
    if (objc_msgSend(v10, "isEqualToString:", *v11))
    {
      v12 = objc_msgSend(v4, "code");

      if (v12 == 6)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "userCancelledError");
        v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
        v9 = v13;
        goto LABEL_12;
      }
    }
    else
    {

    }
    v13 = v4;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getMPAVRoutingControllerErrorDomain(void)");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("WFChangePlaybackDestinationAction.m"), 18, CFSTR("%s"), dlerror());

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
    WFLocalizedString(CFSTR("Failed to Set Playback Destination to “%@”"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFChangePlaybackDestinationAction routeDescriptor](self, "routeDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "routeName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v6, v8, v17[0]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    v17[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("The playback destination could not be set."));
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
    WFLocalizedString(CFSTR("Could Not Find “%@”"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFChangePlaybackDestinationAction routeDescriptor](self, "routeDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "routeName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringWithFormat:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v9;
    v21[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("Set Playback Destination failed because the device could not be found."));
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
    WFLocalizedString(CFSTR("Could Not Set Playback Destination to “%@”"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFChangePlaybackDestinationAction routeDescriptor](self, "routeDescriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "routeName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringWithFormat:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v9;
    v19[1] = *MEMORY[0x24BDD0FC8];
    WFLocalizedString(CFSTR("It took too long to set the destination to the specified device."));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v10;
    v11 = (void *)MEMORY[0x24BDBCE70];
    v12 = v20;
    v13 = v19;
    goto LABEL_7;
  }
  return v3;
}

void __64__WFChangePlaybackDestinationAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];

  v5 = a2;
  if (v5)
  {
    v6 = *(void **)(a1 + 40);
    v7 = objc_msgSend(*(id *)(a1 + 32), "operation");
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __64__WFChangePlaybackDestinationAction_runAsynchronouslyWithInput___block_invoke_2;
    v10[3] = &unk_24F8BB370;
    v10[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "selectRoute:operation:timeout:completionHandler:", v5, v7, v10, 20.0);
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(v8, "errorFromRoutePickerError:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "finishRunningWithError:", v9);

  }
}

void __64__WFChangePlaybackDestinationAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "errorFromRoutePickerError:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "finishRunningWithError:", v3);

}

@end
