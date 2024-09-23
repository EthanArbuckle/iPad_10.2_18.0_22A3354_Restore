@implementation WFSkipSongAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  WFMediaPlaybackController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD aBlock[5];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  -[WFSkipSongAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFMediaRoute"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[WFSkipSongAction definition](self, "definition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("WFSkipSongActionMode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFSkipSongAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSkipBackBehavior"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc_init(WFMediaPlaybackController);
    if ((objc_msgSend(v4, "isLocalDevice") & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v4, "routeUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        WFMediaRouteDescriptorIsMissingRouteUIDError();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFSkipSongAction finishRunningWithError:](self, "finishRunningWithError:", v9);
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(v4, "routeUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__WFSkipSongAction_runAsynchronouslyWithInput___block_invoke;
    aBlock[3] = &unk_24F8BB370;
    aBlock[4] = self;
    v12 = _Block_copy(aBlock);
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("Forward")))
    {
      -[WFMediaPlaybackController goToNextTrackOnDevicesWithUIDs:completion:](v8, "goToNextTrackOnDevicesWithUIDs:completion:", v9, v12);
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("Back")))
    {
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("Beginning")))
        -[WFMediaPlaybackController goToBeginningOfTrackOnDevicesWithUIDs:completion:](v8, "goToBeginningOfTrackOnDevicesWithUIDs:completion:", v9, v12);
      else
        -[WFMediaPlaybackController goToPreviousTrackOnDevicesWithUIDs:completion:](v8, "goToPreviousTrackOnDevicesWithUIDs:completion:", v9, v12);
    }

    goto LABEL_15;
  }
  -[WFSkipSongAction finishRunningWithError:](self, "finishRunningWithError:", 0);
LABEL_16:

}

void __47__WFSkipSongAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
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

    WFLocalizedString(CFSTR("Unable to Skip Song"));
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
