@implementation WFGetCurrentSongAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  WFMediaPlaybackController *v4;
  _QWORD v5[5];

  v4 = objc_alloc_init(WFMediaPlaybackController);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__WFGetCurrentSongAction_runAsynchronouslyWithInput___block_invoke;
  v5[3] = &unk_24F8B3868;
  v5[4] = self;
  -[WFMediaPlaybackController getCurrentlyPlayingMediaWithCompletion:](v4, "getCurrentlyPlayingMediaWithCompletion:", v5);

}

- (id)origin
{
  void *v2;
  void *v3;

  +[WFMediaPlaybackController bundleIdentifierForMediaPlaybackApplication:](WFMediaPlaybackController, "bundleIdentifierForMediaPlaybackApplication:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE19390], "locationWithSystemAppBundleIdentifier:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)outputContentClasses
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  -[WFGetCurrentSongAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("Subject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Current Song")))
  {
    v12[0] = objc_opt_class();
    v5 = (void *)MEMORY[0x24BDBCE30];
    v6 = v12;
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("Current Playback Time")))
    {
      v10.receiver = self;
      v10.super_class = (Class)WFGetCurrentSongAction;
      -[WFGetCurrentSongAction outputContentClasses](&v10, sel_outputContentClasses);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v11 = objc_opt_class();
    v5 = (void *)MEMORY[0x24BDBCE30];
    v6 = &v11;
  }
  objc_msgSend(v5, "arrayWithObjects:count:", v6, 1);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v8 = (void *)v7;

  return v8;
}

- (id)localizedDefaultOutputNameWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  -[WFGetCurrentSongAction parameterStateForKey:](self, "parameterStateForKey:", CFSTR("Subject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Current Playback Time"));

  if (v7)
  {
    WFLocalizedStringResourceWithKey(CFSTR("Current Playback Time"), CFSTR("Current Playback Time"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localize:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)WFGetCurrentSongAction;
    -[WFGetCurrentSongAction localizedDefaultOutputNameWithContext:](&v11, sel_localizedDefaultOutputNameWithContext_, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

void __53__WFGetCurrentSongAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v7 = a2;
  v8 = *(void **)(a1 + 32);
  v16 = v7;
  if (v7)
  {
    objc_msgSend(v8, "parameterValueForKey:ofClass:", CFSTR("Subject"), objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("Current Song")))
    {
      objc_msgSend(*(id *)(a1 + 32), "output");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x24BE19450];
      objc_msgSend(*(id *)(a1 + 32), "origin");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "itemWithObject:origin:disclosureLevel:", v16, v12, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addItem:", v13);
    }
    else
    {
      if (!objc_msgSend(v9, "isEqualToString:", CFSTR("Current Playback Time")))
      {
LABEL_8:
        objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);

        goto LABEL_9;
      }
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE19630]), "initWithTimeInterval:", a4);
      objc_msgSend(*(id *)(a1 + 32), "output");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x24BE19450];
      objc_msgSend(*(id *)(a1 + 32), "origin");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "itemWithObject:origin:disclosureLevel:", v10, v13, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addItem:", v15);

    }
    goto LABEL_8;
  }
  objc_msgSend(v8, "finishRunningWithError:", a3);
LABEL_9:

}

@end
