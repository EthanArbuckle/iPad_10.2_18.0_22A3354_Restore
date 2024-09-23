@implementation WFPlaySoundAction

- (BOOL)isProgressIndeterminate
{
  return 0;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[5];

  v4 = a3;
  v5 = objc_opt_class();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __48__WFPlaySoundAction_runAsynchronouslyWithInput___block_invoke;
  v6[3] = &unk_24F8BA0E8;
  v6[4] = self;
  objc_msgSend(v4, "generateCollectionByCoercingToItemClass:completionHandler:", v5, v6);

}

- (void)runWithDefaultSound
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLForResource:withExtension:", CFSTR("soundDefault"), CFSTR("caf"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPlaySoundAction runWithAudioFileURL:fileTypeHint:duckOthers:](self, "runWithAudioFileURL:fileTypeHint:duckOthers:", v3, 0, 1);

}

- (void)runWithAudioFileURL:(id)a3 fileTypeHint:(id)a4 duckOthers:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  char v19;
  void *v20;
  objc_class *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void **v31;
  void *v32;
  void *v33;
  id v34;
  char v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  _QWORD block[5];
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _QWORD v62[3];

  v5 = a5;
  v62[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(getAVAudioSessionClass_36797(), "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPlaySoundAction userInterface](self, "userInterface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userInterfaceType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BE19950]))
  {
    objc_msgSend(MEMORY[0x24BE193A0], "sharedContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "applicationState") == 2;

    if (!v12)
      goto LABEL_6;
  }
  else
  {
    v14 = 0;
    if (!v12)
      goto LABEL_6;
  }
  if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BE19948]) & 1) == 0
    && ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x24BE19940]) | v14) & 1) == 0
    && !v5)
  {
    getAVAudioSessionCategoryPlayback_36818();
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0;
    v53 = (uint64_t)&v52;
    v54 = 0x2020000000;
    v31 = (void **)getAVAudioSessionModeDefaultSymbolLoc_ptr_36819;
    v55 = (void *)getAVAudioSessionModeDefaultSymbolLoc_ptr_36819;
    if (!getAVAudioSessionModeDefaultSymbolLoc_ptr_36819)
    {
      v32 = AVFoundationLibrary_36800();
      v31 = (void **)dlsym(v32, "AVAudioSessionModeDefault");
      *(_QWORD *)(v53 + 24) = v31;
      getAVAudioSessionModeDefaultSymbolLoc_ptr_36819 = (uint64_t)v31;
    }
    _Block_object_dispose(&v52, 8);
    if (!v31)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVAudioSessionMode getAVAudioSessionModeDefault(void)");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, CFSTR("WFPlaySoundAction.m"), 20, CFSTR("%s"), dlerror());

      __break(1u);
    }
    v33 = *v31;
    v50 = 0;
    v34 = v33;
    v35 = objc_msgSend(v10, "setCategory:mode:routeSharingPolicy:options:error:", v30, v34, 1, 0, &v50);
    v17 = v50;

    if ((v35 & 1) == 0)
    {
      -[WFPlaySoundAction finishRunningWithError:](self, "finishRunningWithError:", v17);
      goto LABEL_27;
    }
    goto LABEL_7;
  }
LABEL_6:
  getAVAudioSessionCategoryPlayback_36818();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  v16 = objc_msgSend(v10, "setCategory:withOptions:error:", v15, 19, &v51);
  v17 = v51;

  if ((v16 & 1) == 0)
  {
    -[WFPlaySoundAction finishRunningWithError:](self, "finishRunningWithError:", v17);
    goto LABEL_27;
  }
LABEL_7:
  v18 = v17;
  v49 = v17;
  v19 = objc_msgSend(v10, "setActive:error:", 1, &v49);
  v17 = v49;

  if ((v19 & 1) != 0)
  {
    v57 = 0;
    v58 = &v57;
    v59 = 0x2050000000;
    v20 = (void *)getAVAudioPlayerClass_softClass;
    v60 = getAVAudioPlayerClass_softClass;
    if (!getAVAudioPlayerClass_softClass)
    {
      v52 = MEMORY[0x24BDAC760];
      v53 = 3221225472;
      v54 = (uint64_t)__getAVAudioPlayerClass_block_invoke;
      v55 = &unk_24F8BB430;
      v56 = &v57;
      __getAVAudioPlayerClass_block_invoke((uint64_t)&v52);
      v20 = (void *)v58[3];
    }
    v21 = objc_retainAutorelease(v20);
    _Block_object_dispose(&v57, 8);
    v48 = 0;
    v43 = (void *)objc_msgSend([v21 alloc], "initWithContentsOfURL:fileTypeHint:error:", v8, v9, &v48);
    v22 = v48;
    if (v22)
    {
      v23 = v22;
      objc_msgSend(v22, "domain");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *MEMORY[0x24BDD1100];
      v26 = objc_msgSend(v24, "isEqualToString:", *MEMORY[0x24BDD1100]);

      if (v26 && (objc_msgSend(v23, "code") == 1954115647 || objc_msgSend(v23, "code") == 1718449215))
      {
        v42 = (void *)MEMORY[0x24BDD1540];
        v41 = objc_msgSend(v23, "code");
        v61 = *MEMORY[0x24BDD0FC8];
        WFLocalizedString(CFSTR("Play Sound failed because the input was in an unsupported format."));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v62[0] = v27;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "errorWithDomain:code:userInfo:", v25, v41, v28);
        v29 = objc_claimAutoreleasedReturnValue();

        v23 = (void *)v29;
      }
      -[WFPlaySoundAction finishRunningWithError:](self, "finishRunningWithError:", v23);
    }
    else
    {
      v36 = MEMORY[0x24BDAC760];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __65__WFPlaySoundAction_runWithAudioFileURL_fileTypeHint_duckOthers___block_invoke;
      block[3] = &unk_24F8BA480;
      block[4] = self;
      v37 = v43;
      v47 = v37;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      objc_msgSend(v37, "setDelegate:", self);
      -[WFPlaySoundAction setAudioPlayer:](self, "setAudioPlayer:", v37);
      -[WFPlaySoundAction userInterface](self, "userInterface");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v36;
      v44[1] = 3221225472;
      v44[2] = __65__WFPlaySoundAction_runWithAudioFileURL_fileTypeHint_duckOthers___block_invoke_2;
      v44[3] = &unk_24F8BB638;
      v45 = v37;
      WFConfigureAudioRoutesForUserInterface(v38, v44);

      v23 = 0;
    }

  }
  else
  {
    -[WFPlaySoundAction finishRunningWithError:](self, "finishRunningWithError:", v17);
  }
LABEL_27:

}

- (void)updateProgress
{
  id v2;

  -[WFPlaySoundAction progress](self, "progress");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setCompletedUnitCount:", objc_msgSend(v2, "completedUnitCount") + 1);

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  -[WFPlaySoundAction audioPlayer](self, "audioPlayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stop");

  -[WFPlaySoundAction cleanup](self, "cleanup");
  v4.receiver = self;
  v4.super_class = (Class)WFPlaySoundAction;
  -[WFPlaySoundAction cancel](&v4, sel_cancel);
}

- (void)cleanup
{
  void *v3;
  void *v4;

  -[WFPlaySoundAction progressTimer](self, "progressTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  -[WFPlaySoundAction setProgressTimer:](self, "setProgressTimer:", 0);
  objc_msgSend(getAVAudioSessionClass_36797(), "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:withOptions:error:", 0, 1, 0);

  -[WFPlaySoundAction setAudioPlayer:](self, "setAudioPlayer:", 0);
}

- (void)audioPlayerDidFinishPlaying:(id)a3 successfully:(BOOL)a4
{
  -[WFPlaySoundAction cleanup](self, "cleanup", a3, a4);
  -[WFPlaySoundAction finishRunningWithError:](self, "finishRunningWithError:", 0);
}

- (void)audioPlayerDecodeErrorDidOccur:(id)a3 error:(id)a4
{
  id v5;

  v5 = a4;
  -[WFPlaySoundAction cleanup](self, "cleanup");
  -[WFPlaySoundAction finishRunningWithError:](self, "finishRunningWithError:", v5);

}

- (id)contentDestinationWithError:(id *)a3
{
  return 0;
}

- (AVAudioPlayer)audioPlayer
{
  return self->_audioPlayer;
}

- (void)setAudioPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_audioPlayer, a3);
}

- (NSTimer)progressTimer
{
  return self->_progressTimer;
}

- (void)setProgressTimer:(id)a3
{
  objc_storeStrong((id *)&self->_progressTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressTimer, 0);
  objc_storeStrong((id *)&self->_audioPlayer, 0);
}

void __65__WFPlaySoundAction_runWithAudioFileURL_fileTypeHint_duckOthers___block_invoke(uint64_t a1)
{
  double v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 40), "duration");
  v3 = (uint64_t)(v2 * 30.0);
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTotalUnitCount:", v3);

  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", *(_QWORD *)(a1 + 32), sel_updateProgress, 0, 1, 0.0333333333);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setProgressTimer:", v5);

  objc_msgSend(*(id *)(a1 + 32), "progressTimer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTolerance:", 0.5);

}

uint64_t __65__WFPlaySoundAction_runWithAudioFileURL_fileTypeHint_duckOthers___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "play");
}

void __48__WFPlaySoundAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];

  v3 = a2;
  objc_msgSend(v3, "items");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __48__WFPlaySoundAction_runAsynchronouslyWithInput___block_invoke_2;
    v5[3] = &unk_24F8B96D8;
    v5[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "getFileRepresentation:forType:", v5, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "runWithDefaultSound");
  }

}

void __48__WFPlaySoundAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8 = v3;
  if (v3)
  {
    objc_msgSend(v3, "fileURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "wfType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "runWithAudioFileURL:fileTypeHint:duckOthers:", v5, v7, 0);

  }
  else
  {
    objc_msgSend(v4, "runWithDefaultSound");
  }

}

@end
