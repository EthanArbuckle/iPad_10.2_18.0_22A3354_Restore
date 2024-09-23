@implementation WFShazamMediaAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  id v8;
  _QWORD v9[5];

  -[WFShazamMediaAction userInterface](self, "userInterface", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRunningWithSiriUI");

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "wfUnsupportedUserInterfaceError");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[WFShazamMediaAction finishRunningWithError:](self, "finishRunningWithError:", v8);

  }
  else
  {
    -[WFShazamMediaAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFShazamMediaActionShowWhenRun"), objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

    if (v7)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __50__WFShazamMediaAction_runAsynchronouslyWithInput___block_invoke;
      v9[3] = &unk_24F8B0610;
      v9[4] = self;
      -[WFShazamMediaAction requestInterfacePresentationWithCompletionHandler:](self, "requestInterfacePresentationWithCompletionHandler:", v9);
    }
    -[WFShazamMediaAction startShazam](self, "startShazam");
  }
}

- (void)startShazam
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  +[WFRecordingStatusManager sharedManager](WFRecordingStatusManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRecording:", 1);

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v4 = (void *)getSHManagedSessionClass_softClass;
  v11 = getSHManagedSessionClass_softClass;
  if (!getSHManagedSessionClass_softClass)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __getSHManagedSessionClass_block_invoke;
    v7[3] = &unk_24F8BB430;
    v7[4] = &v8;
    __getSHManagedSessionClass_block_invoke((uint64_t)v7);
    v4 = (void *)v9[3];
  }
  v5 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v8, 8);
  v6 = (void *)objc_msgSend([v5 alloc], "initWithPartnerName:", CFSTR("shortcuts"));
  objc_msgSend(v6, "setDelegate:", self);
  -[WFShazamMediaAction setManagedSession:](self, "setManagedSession:", v6);
  objc_msgSend(v6, "matchAmbientAudioSnippet");

}

- (void)finishRunningWithMatch:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  WFShazamMedia *v9;
  WFShazamMedia *v10;
  NSObject *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  WFShazamMedia *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(a3, "mediaItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = -[WFShazamMedia initWithMediaItem:]([WFShazamMedia alloc], "initWithMediaItem:", v8);
    if (v9)
    {
      v10 = v9;
      getWFActionsLogObject();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 136315394;
        v14 = "-[WFShazamMediaAction finishRunningWithMatch:error:]";
        v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_22D353000, v11, OS_LOG_TYPE_DEFAULT, "%s Shazam action found match: %@", (uint8_t *)&v13, 0x16u);
      }

      -[WFShazamMediaAction output](self, "output");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObject:", v10);

    }
  }
  -[WFShazamMediaAction finishRunningWithError:](self, "finishRunningWithError:", v6);

}

- (void)finishRunningWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id *v9;
  void *v10;
  id v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _BYTE buf[24];
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    getWFActionsLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WFShazamMediaAction finishRunningWithError:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v4;
      _os_log_impl(&dword_22D353000, v5, OS_LOG_TYPE_ERROR, "%s Shazam action finished with incoming error: %{public}@", buf, 0x16u);
    }

  }
  if (objc_msgSend(v4, "wf_isUserCancelledError"))
  {
    -[WFShazamMediaAction managedSession](self, "managedSession");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopMatchingAmbientAudioSnippet");

  }
  if (!v4)
  {
    v7 = 0;
    goto LABEL_21;
  }
  if ((objc_msgSend(v4, "wf_isUserCancelledError") & 1) == 0
    && (objc_msgSend(v4, "wf_isUnsupportedUserInterfaceError") & 1) == 0)
  {
    objc_msgSend(v4, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v9 = (id *)getSHErrorDomainSymbolLoc_ptr;
    v42 = getSHErrorDomainSymbolLoc_ptr;
    if (!getSHErrorDomainSymbolLoc_ptr)
    {
      v10 = ShazamKitLibrary();
      v9 = (id *)dlsym(v10, "SHErrorDomain");
      *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v9;
      getSHErrorDomainSymbolLoc_ptr = (uint64_t)v9;
    }
    _Block_object_dispose(buf, 8);
    if (!v9)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getSHErrorDomain(void)");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("WFShazamMediaAction.m"), 23, CFSTR("%s"), dlerror());

      __break(1u);
    }
    v11 = *v9;
    if (objc_msgSend(v8, "isEqualToString:", v11))
    {
      v12 = objc_msgSend(v4, "code") == 202;

      if (v12)
      {
        WFLocalizedString(CFSTR("Shazam server could not be contacted"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        WFLocalizedString(CFSTR("Try again when network conditions improve."));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)MEMORY[0x24BDD1540];
        v16 = *MEMORY[0x24BDD0FC8];
        v39[0] = *MEMORY[0x24BDD0FD8];
        v39[1] = v16;
        v40[0] = v13;
        v40[1] = v14;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("WFShazamMediaActionErrorDomain"), -2, v17);
        v18 = objc_claimAutoreleasedReturnValue();
LABEL_20:
        v7 = v18;

        goto LABEL_21;
      }
    }
    else
    {

    }
    WFLocalizedString(CFSTR("Uh oh, something went wrong with Shazam"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedString(CFSTR("Please try again."));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x24BDD1540];
    v20 = *MEMORY[0x24BDD0FC8];
    v37[0] = *MEMORY[0x24BDD0FD8];
    v37[1] = v20;
    v38[0] = v13;
    v38[1] = v14;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("WFShazamMediaActionErrorDomain"), 0, v17);
    v18 = objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  v7 = (uint64_t)v4;
LABEL_21:
  -[WFShazamMediaAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFShazamMediaActionErrorIfNotRecognized"), objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "BOOLValue");

  if (v22)
  {
    -[WFShazamMediaAction output](self, "output");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (objc_msgSend(v23, "numberOfItems") | v7) == 0;

    if (v24)
    {
      WFLocalizedString(CFSTR("No Result"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      WFLocalizedString(CFSTR("Shazam didn't recognize any media."));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x24BDD1540];
      v28 = *MEMORY[0x24BDD0FC8];
      v35[0] = *MEMORY[0x24BDD0FD8];
      v35[1] = v28;
      v36[0] = v25;
      v36[1] = v26;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("WFShazamMediaActionErrorDomain"), -1, v29);
      v7 = objc_claimAutoreleasedReturnValue();

    }
  }
  if (v7)
  {
    getWFActionsLogObject();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[WFShazamMediaAction finishRunningWithError:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_22D353000, v30, OS_LOG_TYPE_ERROR, "%s Shazam action finished with outgoing error: %{public}@", buf, 0x16u);
    }

  }
  +[WFRecordingStatusManager sharedManager](WFRecordingStatusManager, "sharedManager");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setRecording:", 0);

  v34.receiver = self;
  v34.super_class = (Class)WFShazamMediaAction;
  -[WFShazamMediaAction finishRunningWithError:](&v34, sel_finishRunningWithError_, v7);

}

- (void)session:(id)a3 didFindMatch:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  getWFActionsLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[WFShazamMediaAction session:didFindMatch:]";
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_22D353000, v6, OS_LOG_TYPE_DEFAULT, "%s Shazam action session did find match: %@", (uint8_t *)&v7, 0x16u);
  }

  -[WFShazamMediaAction finishRunningWithMatch:error:](self, "finishRunningWithMatch:error:", v5, 0);
}

- (void)session:(id)a3 didNotFindMatchForSignature:(id)a4 error:(id)a5
{
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a5;
  getWFActionsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[WFShazamMediaAction session:didNotFindMatchForSignature:error:]";
    v10 = 2114;
    v11 = v6;
    _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_DEFAULT, "%s Shazam session did not match for signature with error: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  -[WFShazamMediaAction finishRunningWithError:](self, "finishRunningWithError:", v6);
}

- (SHManagedSession)managedSession
{
  return self->_managedSession;
}

- (void)setManagedSession:(id)a3
{
  objc_storeStrong((id *)&self->_managedSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_managedSession, 0);
}

uint64_t __50__WFShazamMediaAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__WFShazamMediaAction_runAsynchronouslyWithInput___block_invoke_2;
  v3[3] = &unk_24F8BB370;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "showWithCompletionHandler:", v3);
}

uint64_t __50__WFShazamMediaAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "finishRunningWithError:", a2);
  return result;
}

+ (id)userInterfaceProtocol
{
  return &unk_255DFC628;
}

@end
