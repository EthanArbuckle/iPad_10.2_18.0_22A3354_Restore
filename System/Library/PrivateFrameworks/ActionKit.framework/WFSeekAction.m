@implementation WFSeekAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  WFMediaPlaybackController *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD aBlock[5];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  -[WFSeekAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMediaRoute"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[WFSeekAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSeekBehavior"), objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFSeekAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFTimeInterval"), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BEC3CB0];
    objc_msgSend(v6, "unitString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "calendarUnitFromUnitString:", v8);

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "magnitude");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", v9, objc_msgSend(v12, "integerValue"), v10, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "timeIntervalSinceDate:", v10);
    v15 = v14;
    v16 = objc_alloc_init(WFMediaPlaybackController);
    v17 = 0;
    if ((objc_msgSend(v4, "isLocalDevice") & 1) == 0)
    {
      objc_msgSend(v4, "routeUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        WFMediaRouteDescriptorIsMissingRouteUIDError();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFSeekAction finishRunningWithError:](self, "finishRunningWithError:", v17);
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend(v4, "routeUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v19;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __43__WFSeekAction_runAsynchronouslyWithInput___block_invoke;
    aBlock[3] = &unk_24F8BB370;
    aBlock[4] = self;
    v20 = _Block_copy(aBlock);
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("Forward By")))
    {
      -[WFMediaPlaybackController skipForwardOnDevicesWithUIDs:interval:completion:](v16, "skipForwardOnDevicesWithUIDs:interval:completion:", v17, v20, v15);
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Backward By")))
    {
      -[WFMediaPlaybackController skipBackwardOnDevicesWithUIDs:interval:completion:](v16, "skipBackwardOnDevicesWithUIDs:interval:completion:", v17, v20, v15);
    }
    else
    {
      -[WFMediaPlaybackController skipToPositionOnDevicesWithUIDs:interval:completion:](v16, "skipToPositionOnDevicesWithUIDs:interval:completion:", v17, v20, v15);
    }

    goto LABEL_12;
  }
  -[WFSeekAction finishRunningWithError:](self, "finishRunningWithError:", 0);
LABEL_13:

}

void __43__WFSeekAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
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
  id v12;

  v3 = a2;
  v12 = v3;
  if (v3)
  {
    objc_msgSend(v3, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    WFLocalizedString(CFSTR("Unable to Seek"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x24BDD0FD8]);

    objc_msgSend(v12, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      WFLocalizedString(CFSTR("An unknown error occurred."));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDD0FC8]);

    }
    v9 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v12, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", v10, objc_msgSend(v12, "code"), v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v11);

}

@end
