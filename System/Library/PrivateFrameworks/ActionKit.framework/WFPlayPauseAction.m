@implementation WFPlayPauseAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WFMediaPlaybackController *v9;
  void *v10;
  void *v11;
  _QWORD aBlock[5];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  -[WFPlayPauseAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMediaRoute"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if ((objc_msgSend(v4, "isLocalDevice") & 1) != 0)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(v5, "routeUID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        WFMediaRouteDescriptorIsMissingRouteUIDError();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFPlayPauseAction finishRunningWithError:](self, "finishRunningWithError:", v6);
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(v5, "routeUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v9 = objc_alloc_init(WFMediaPlaybackController);
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __48__WFPlayPauseAction_runAsynchronouslyWithInput___block_invoke;
    aBlock[3] = &unk_24F8BB370;
    aBlock[4] = self;
    v10 = _Block_copy(aBlock);
    -[WFPlayPauseAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFPlayPauseBehavior"), objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("Play/Pause")))
    {
      -[WFMediaPlaybackController playPauseOnDevicesWithUIDs:completion:](v9, "playPauseOnDevicesWithUIDs:completion:", v6, v10);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("Play")))
    {
      -[WFMediaPlaybackController playOnDevicesWithUIDs:completion:](v9, "playOnDevicesWithUIDs:completion:", v6, v10);
    }
    else if (objc_msgSend(v11, "isEqualToString:", CFSTR("Pause")))
    {
      -[WFMediaPlaybackController pauseOnDevicesWithUIDs:completion:](v9, "pauseOnDevicesWithUIDs:completion:", v6, v10);
    }

    goto LABEL_14;
  }
  -[WFPlayPauseAction finishRunningWithError:](self, "finishRunningWithError:", 0);
LABEL_15:

}

void __48__WFPlayPauseAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("WFMediaPlaybackControllerErrorDomain")))
  {
    v4 = objc_msgSend(v14, "code");

    v5 = v14;
    if (v4 == 1)
    {
      v6 = 0;
      v7 = v14;
      goto LABEL_9;
    }
  }
  else
  {

    v5 = v14;
  }
  if (!v5)
  {
    v6 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v5, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v8, "mutableCopy");

  WFLocalizedString(CFSTR("Unable to Play/Pause"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDD0FD8]);

  objc_msgSend(v14, "localizedDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    WFLocalizedString(CFSTR("An unknown error occurred."));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDD0FC8]);

  }
  v12 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(v14, "domain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, objc_msgSend(v14, "code"), v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
LABEL_11:
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v6);

}

@end
