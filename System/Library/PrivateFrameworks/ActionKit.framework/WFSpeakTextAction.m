@implementation WFSpeakTextAction

- (id)voicePickerParameter
{
  void *v4;
  void *v6;

  -[WFSpeakTextAction parameterForKey:](self, "parameterForKey:", CFSTR("WFSpeakTextVoice"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSpeakTextAction.m"), 56, CFSTR("Parameter should be of type WFSpeakTextVoicePickerParameter"));

  }
  return v4;
}

- (BOOL)isProgressIndeterminate
{
  return 0;
}

- (void)runAsynchronouslyWithInput:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __48__WFSpeakTextAction_runAsynchronouslyWithInput___block_invoke;
  v3[3] = &unk_24F8BB768;
  v3[4] = self;
  objc_msgSend(a3, "getStringRepresentation:", v3);
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  -[WFSpeakTextAction runningOperation](self, "runningOperation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");

  -[WFSpeakTextAction setRunningOperation:](self, "setRunningOperation:", 0);
  v4.receiver = self;
  v4.super_class = (Class)WFSpeakTextAction;
  -[WFSpeakTextAction cancel](&v4, sel_cancel);
}

- (void)initializeParameters
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WFSpeakTextAction;
  -[WFSpeakTextAction initializeParameters](&v4, sel_initializeParameters);
  -[WFSpeakTextAction voicePickerParameter](self, "voicePickerParameter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAction:", self);

}

- (id)extendedOperation
{
  return self->_extendedOperation;
}

- (void)setExtendedOperation:(id)a3
{
  objc_storeStrong((id *)&self->_extendedOperation, a3);
}

- (WFSpeakTextActionOperation)runningOperation
{
  return self->_runningOperation;
}

- (void)setRunningOperation:(id)a3
{
  objc_storeStrong((id *)&self->_runningOperation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningOperation, 0);
  objc_storeStrong((id *)&self->_extendedOperation, 0);
}

void __48__WFSpeakTextAction_runAsynchronouslyWithInput___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  void **v28;
  void *v29;
  void *v30;
  id v31;
  char v32;
  id v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void **v43;
  void *v44;
  void *v45;
  id v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  id v62;
  _QWORD v63[5];
  id location;
  id *p_location;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD v69[3];

  v69[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "length");
  v8 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_msgSend(v8, "userInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isRunningWithSiriUI"))
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEC15D0]), "initWithUtterance:", v5);
      v63[0] = MEMORY[0x24BDAC760];
      v63[1] = 3221225472;
      v63[2] = __48__WFSpeakTextAction_runAsynchronouslyWithInput___block_invoke_2;
      v63[3] = &unk_24F8B4E88;
      v63[4] = *(_QWORD *)(a1 + 32);
      v11 = objc_msgSend(v9, "performSiriRequest:completionHandler:", v10, v63);

      if ((v11 & 1) != 0)
        goto LABEL_30;
    }
    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFSpeakTextRate"), objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "floatValue");
    v14 = v13;

    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFSpeakTextPitch"), objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    v17 = v16;

    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFSpeakTextWait"), objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v18, "BOOLValue");

    objc_msgSend(*(id *)(a1 + 32), "parameterValueForKey:ofClass:", CFSTR("WFSpeakTextLanguage"), objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(void **)(a1 + 32);
    if (!v19)
    {
      v22 = (void *)MEMORY[0x24BDD1540];
      v68 = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("Please select a language to use when speaking."));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v69[0] = v57;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v69, &v68, 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], 5, v56);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "finishRunningWithError:", v55);
LABEL_29:

LABEL_30:
      goto LABEL_31;
    }
    objc_msgSend(v20, "parameterValueForKey:ofClass:", CFSTR("WFSpeakTextVoice"), objc_opt_class());
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    +[WFSpeechSynthesisVoice voicesForLanguageCode:](WFSpeechSynthesisVoice, "voicesForLanguageCode:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "if_map:", &__block_literal_global_18327);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v56, "containsObject:", v57) & 1) != 0)
      +[WFSpeechSynthesisVoice voiceForIdentifier:](WFSpeechSynthesisVoice, "voiceForIdentifier:", v57);
    else
      +[WFSpeechSynthesisVoice defaultVoiceForLanguageCode:](WFSpeechSynthesisVoice, "defaultVoiceForLanguageCode:", v19);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(getAVAudioSessionClass(), "sharedInstance");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "userInterface");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "userInterfaceType");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v24, "isEqualToString:", *MEMORY[0x24BE19950]))
    {
      objc_msgSend(MEMORY[0x24BE193A0], "sharedContext");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "applicationState") == 2;

      if (!v24)
        goto LABEL_17;
    }
    else
    {
      v26 = 0;
      if (!v24)
        goto LABEL_17;
    }
    if ((objc_msgSend(v24, "isEqualToString:", *MEMORY[0x24BE19948]) & 1) == 0
      && ((objc_msgSend(v24, "isEqualToString:", *MEMORY[0x24BE19940]) | v26) & 1) == 0
      && !objc_msgSend(v24, "isEqualToString:", *MEMORY[0x24BE19958]))
    {
      getAVAudioSessionCategoryPlayback();
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      location = 0;
      p_location = &location;
      v66 = 0x2020000000;
      v43 = (void **)getAVAudioSessionModeDefaultSymbolLoc_ptr;
      v67 = getAVAudioSessionModeDefaultSymbolLoc_ptr;
      if (!getAVAudioSessionModeDefaultSymbolLoc_ptr)
      {
        v44 = AVFoundationLibrary_18279();
        v43 = (void **)dlsym(v44, "AVAudioSessionModeDefault");
        p_location[3] = v43;
        getAVAudioSessionModeDefaultSymbolLoc_ptr = (uint64_t)v43;
      }
      _Block_object_dispose(&location, 8);
      if (!v43)
        goto LABEL_39;
      v45 = *v43;
      v61 = 0;
      v46 = v45;
      v47 = objc_msgSend(v54, "setCategory:mode:routeSharingPolicy:options:error:", v52, v46, 1, 0, &v61);
      v33 = v61;

      if ((v47 & 1) != 0)
      {
LABEL_21:
        v34 = v33;
        v60 = v33;
        v35 = objc_msgSend(v54, "setActive:error:", 1, &v60);
        v33 = v60;

        if ((v35 & 1) != 0)
        {
          v36 = (void *)objc_opt_new();
          v37 = *(void **)(a1 + 32);
          if (v53)
          {
            objc_msgSend(v37, "progress");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "setProgress:", v38);

            objc_msgSend(*(id *)(a1 + 32), "setRunningOperation:", v36);
            LODWORD(v39) = v14;
            LODWORD(v40) = v17;
            objc_msgSend(v36, "speakTextUsingSynthesizer:voice:rate:pitch:", v5, v55, v39, v40);
            objc_initWeak(&location, *(id *)(a1 + 32));
            v58[0] = MEMORY[0x24BDAC760];
            v58[1] = 3221225472;
            v58[2] = __48__WFSpeakTextAction_runAsynchronouslyWithInput___block_invoke_2_140;
            v58[3] = &unk_24F8B4090;
            objc_copyWeak(&v59, &location);
            objc_msgSend(v36, "addCompletionHandlerIfRunning:", v58);
            objc_destroyWeak(&v59);
            objc_destroyWeak(&location);
          }
          else
          {
            objc_msgSend(v37, "setExtendedOperation:", v36);
            LODWORD(v41) = v14;
            LODWORD(v42) = v17;
            objc_msgSend(v36, "speakTextUsingSynthesizer:voice:rate:pitch:", v5, v55, v41, v42);
            objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
          }

        }
        else
        {
          objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v33);
        }
        goto LABEL_28;
      }
      objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v33);
LABEL_28:

      goto LABEL_29;
    }
LABEL_17:
    getAVAudioSessionCategoryPlayback();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    location = 0;
    p_location = &location;
    v66 = 0x2020000000;
    v28 = (void **)getAVAudioSessionModeVoicePromptSymbolLoc_ptr;
    v67 = getAVAudioSessionModeVoicePromptSymbolLoc_ptr;
    if (!getAVAudioSessionModeVoicePromptSymbolLoc_ptr)
    {
      v29 = AVFoundationLibrary_18279();
      v28 = (void **)dlsym(v29, "AVAudioSessionModeVoicePrompt");
      p_location[3] = v28;
      getAVAudioSessionModeVoicePromptSymbolLoc_ptr = (uint64_t)v28;
    }
    _Block_object_dispose(&location, 8);
    if (!v28)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVAudioSessionMode getAVAudioSessionModeVoicePrompt(void)");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, CFSTR("WFSpeakTextAction.m"), 21, CFSTR("%s"), dlerror());

      while (1)
      {
        __break(1u);
LABEL_39:
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "AVAudioSessionMode getAVAudioSessionModeDefault(void)");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, CFSTR("WFSpeakTextAction.m"), 22, CFSTR("%s"), dlerror());

      }
    }
    v30 = *v28;
    v62 = 0;
    v31 = v30;
    v32 = objc_msgSend(v54, "setCategory:mode:options:error:", v27, v31, 19, &v62);
    v33 = v62;

    if ((v32 & 1) != 0)
      goto LABEL_21;
    objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v33);
    goto LABEL_28;
  }
  objc_msgSend(v8, "finishRunningWithError:", v6);
LABEL_31:

}

void __48__WFSpeakTextAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finishRunningWithError:", v5);

    v6 = v3;
  }
  else
  {

    getWFWorkflowExecutionLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      v10 = 136315394;
      v11 = "-[WFSpeakTextAction runAsynchronouslyWithInput:]_block_invoke_2";
      v12 = 2112;
      v13 = (id)objc_opt_class();
      v8 = v13;
      _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_FAULT, "%s Received unexpected interaction response of type %@", (uint8_t *)&v10, 0x16u);

    }
    v9 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "wfUnsupportedUserInterfaceError");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "finishRunningWithError:", v6);
  }

}

void __48__WFSpeakTextAction_runAsynchronouslyWithInput___block_invoke_2_140(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "setRunningOperation:", 0);
  objc_msgSend(WeakRetained, "finishRunningWithError:", v3);

}

uint64_t __48__WFSpeakTextAction_runAsynchronouslyWithInput___block_invoke_136(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

@end
