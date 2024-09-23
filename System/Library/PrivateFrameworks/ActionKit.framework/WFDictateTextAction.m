@implementation WFDictateTextAction

- (void)runAsynchronouslyWithInput:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  id v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[WFDictateTextAction userInterface](self, "userInterface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isRunningWithSiriUI");

  if (v6)
  {
    -[WFDictateTextAction userInterface](self, "userInterface");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDictateTextAction runWithSiriUserInterface:input:](self, "runWithSiriUserInterface:input:", v7, v4);
  }
  else
  {
    -[WFDictateTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFSpeechLanguage"), objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[WFDictateTextAction parameterValueForKey:ofClass:](self, "parameterValueForKey:ofClass:", CFSTR("WFDictateTextStopListening"), objc_opt_class());
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __50__WFDictateTextAction_runAsynchronouslyWithInput___block_invoke;
      v14[3] = &unk_24F8B92F8;
      v14[4] = self;
      v15 = v9;
      v16 = v8;
      v10 = v8;
      v11 = v9;
      -[WFDictateTextAction requestInterfacePresentationWithCompletionHandler:](self, "requestInterfacePresentationWithCompletionHandler:", v14);

    }
    else
    {
      v17[0] = *MEMORY[0x24BDD0FD8];
      WFLocalizedString(CFSTR("Unable to run shortcut"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v12;
      v17[1] = *MEMORY[0x24BDD0FC8];
      WFLocalizedString(CFSTR("Speech recognition is not currently available."));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[1] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BEC4270], 5, v11);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      -[WFDictateTextAction finishRunningWithError:](self, "finishRunningWithError:", v10);
    }

  }
}

- (void)runWithRemoteUserInterface:(id)a3 locale:(id)a4 stopListeningValue:(id)a5
{
  _QWORD v5[5];

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __76__WFDictateTextAction_runWithRemoteUserInterface_locale_stopListeningValue___block_invoke;
  v5[3] = &unk_24F8BB768;
  v5[4] = self;
  objc_msgSend(a3, "showWithLocale:stopListeningValue:completionHandler:", a4, a5, v5);
}

- (void)runWithSiriUserInterface:(id)a3 input:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  WFDictateTextAction *v15;
  id v16;

  objc_msgSend(MEMORY[0x24BE19370], "alertWithPreferredStyle:", 0, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BEC1628]);
  objc_msgSend(v5, "setTextFieldConfiguration:", v6);
  v7 = (void *)MEMORY[0x24BE19378];
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __54__WFDictateTextAction_runWithSiriUserInterface_input___block_invoke;
  v14 = &unk_24F8BA480;
  v15 = self;
  v16 = v5;
  v8 = v5;
  objc_msgSend(v7, "okButtonWithHandler:", &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addButton:", v9, v11, v12, v13, v14, v15);
  -[WFDictateTextAction userInterface](self, "userInterface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentAlert:", v8);

}

- (void)cancel
{
  objc_super v3;

  -[WFDictateTextAction stopListening](self, "stopListening");
  v3.receiver = self;
  v3.super_class = (Class)WFDictateTextAction;
  -[WFDictateTextAction cancel](&v3, sel_cancel);
}

- (void)stopListening
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v3 = -[AFDictationConnection cancelAvailabilityMonitoring](self->_dictationConnection, "cancelAvailabilityMonitoring");
  v6 = objc_alloc_init((Class)getAFSpeechRequestOptionsClass(v3));
  objc_msgSend(v6, "setEndpointerOperationMode:", 3);
  -[WFDictateTextAction dictationConnection](self, "dictationConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopSpeechWithOptions:", v6);

  +[WFRecordingStatusManager sharedManager](WFRecordingStatusManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRecording:", 0);

}

- (void)finishRunningWithError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  objc_super v14;
  _QWORD v15[5];

  v4 = a3;
  if (-[WFDictateTextAction isRunning](self, "isRunning"))
  {
    -[WFDictateTextAction latestTranscription](self, "latestTranscription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[WFDictateTextAction output](self, "output");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BE19450];
      -[WFDictateTextAction latestTranscription](self, "latestTranscription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE19470], "speechRecognitionLocation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "itemWithObject:origin:disclosureLevel:", v8, v9, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addItem:", v10);

    }
    -[WFDictateTextAction actionUserInterface](self, "actionUserInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) != 0)
    {
      -[WFDictateTextAction actionUserInterface](self, "actionUserInterface");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x24BDAC760];
      v15[1] = 3221225472;
      v15[2] = __46__WFDictateTextAction_finishRunningWithError___block_invoke;
      v15[3] = &unk_24F8BB370;
      v15[4] = self;
      objc_msgSend(v13, "dismissWithCompletionHandler:", v15);

    }
    else
    {
      -[WFDictateTextAction stopListening](self, "stopListening");
      v14.receiver = self;
      v14.super_class = (Class)WFDictateTextAction;
      -[WFDictateTextAction finishRunningWithError:](&v14, sel_finishRunningWithError_, v4);
    }
  }

}

- (id)recognitionError
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v7[0] = *MEMORY[0x24BDD0FD8];
  WFLocalizedString(CFSTR("Recognition Unavailable"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v7[1] = *MEMORY[0x24BDD0FC8];
  WFLocalizedString(CFSTR("Speech recognition is not currently available. You may need to connect to the Internet."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3328, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)dictationConnection:(id)a3 speechRecordingDidFail:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  getWFDictateTextActionLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[WFDictateTextAction dictationConnection:speechRecordingDidFail:]";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_22D353000, v6, OS_LOG_TYPE_DEFAULT, "%s Speech recording failure %@", (uint8_t *)&v8, 0x16u);
  }

  if (v5)
  {
    -[WFDictateTextAction recognitionError](self, "recognitionError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDictateTextAction finishRunningWithError:](self, "finishRunningWithError:", v7);

  }
  else
  {
    -[WFDictateTextAction finishRunningWithError:](self, "finishRunningWithError:", 0);
  }

}

- (void)dictationConnection:(id)a3 speechRecognitionDidFail:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  getWFDictateTextActionLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "-[WFDictateTextAction dictationConnection:speechRecognitionDidFail:]";
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_22D353000, v6, OS_LOG_TYPE_DEFAULT, "%s Speech recognition failure %@", (uint8_t *)&v11, 0x16u);
  }

  objc_msgSend(v5, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  getkAFAssistantErrorDomain();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", v8))
  {
    v9 = objc_msgSend(v5, "code");

    if (v9 == 203)
    {

      goto LABEL_9;
    }
  }
  else
  {

  }
  if (v5)
  {
    -[WFDictateTextAction recognitionError](self, "recognitionError");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFDictateTextAction finishRunningWithError:](self, "finishRunningWithError:", v10);

    return;
  }
LABEL_9:
  -[WFDictateTextAction finishRunningWithError:](self, "finishRunningWithError:", 0);
}

- (void)dictationConnection:(id)a3 didRecognizeTokens:(id)a4 languageModel:(id)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        v14 = v11;
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v8);
        v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (v14
          && (objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * i), "removeSpaceBefore", (_QWORD)v20) & 1) == 0
          && (objc_msgSend(v14, "removeSpaceAfter") & 1) == 0)
        {
          objc_msgSend(v7, "appendString:", CFSTR(" "));
        }
        objc_msgSend(v15, "text", (_QWORD)v20);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendString:", v16);

        v11 = v15;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
  }

  -[WFDictateTextAction setLatestTranscription:](self, "setLatestTranscription:", v7);
  -[WFDictateTextAction actionUserInterface](self, "actionUserInterface");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_opt_respondsToSelector();

  if ((v18 & 1) != 0)
  {
    -[WFDictateTextAction actionUserInterface](self, "actionUserInterface");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "actionDidReceiveTranscription:", v7);

  }
}

- (void)dictationConnection:(id)a3 didRecognizePackage:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  objc_msgSend(MEMORY[0x24BDE9E70], "recognizedResultFromPackage:", a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bestTranscription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "formattedString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFDictateTextAction setLatestTranscription:](self, "setLatestTranscription:", v6);
  -[WFDictateTextAction actionUserInterface](self, "actionUserInterface");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[WFDictateTextAction actionUserInterface](self, "actionUserInterface");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "actionDidReceiveTranscription:", v6);

  }
  -[WFDictateTextAction finishRunningWithError:](self, "finishRunningWithError:", 0);

}

- (id)contentDestinationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE19470], "speechRecognitionLocation", a3);
}

- (id)smartPromptWithContentDescription:(id)a3 contentDestination:(id)a4 workflowName:(id)a5
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a5;
  WFLocalizedString(CFSTR("Allow “%1$@” to access Speech Recognition?"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (WFDictateTextActionUserInterface)actionUserInterface
{
  return self->_actionUserInterface;
}

- (void)setActionUserInterface:(id)a3
{
  objc_storeStrong((id *)&self->_actionUserInterface, a3);
}

- (AFDictationConnection)dictationConnection
{
  return self->_dictationConnection;
}

- (void)setDictationConnection:(id)a3
{
  objc_storeStrong((id *)&self->_dictationConnection, a3);
}

- (NSString)latestTranscription
{
  return self->_latestTranscription;
}

- (void)setLatestTranscription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestTranscription, 0);
  objc_storeStrong((id *)&self->_dictationConnection, 0);
  objc_storeStrong((id *)&self->_actionUserInterface, 0);
}

void __46__WFDictateTextAction_finishRunningWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  objc_super v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "stopListening");
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)WFDictateTextAction;
  objc_msgSendSuper2(&v5, sel_finishRunningWithError_, v4);

}

uint64_t __54__WFDictateTextAction_runWithSiriUserInterface_input___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 40), "textFieldResults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setLatestTranscription:", v3);

  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", 0);
}

void __76__WFDictateTextAction_runWithRemoteUserInterface_locale_stopListeningValue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (a2)
  {
    v5 = (void *)MEMORY[0x24BE19450];
    v6 = (void *)MEMORY[0x24BE19470];
    v7 = a2;
    objc_msgSend(v6, "speechRecognitionLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemWithObject:origin:disclosureLevel:", v7, v8, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "output");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addItem:", v9);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", v11);

}

void __50__WFDictateTextAction_runAsynchronouslyWithInput___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  id v29;
  _QWORD *v30;
  void *v31;
  char v32;
  id v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD v40[5];

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(a1[4], "finishRunningWithError:", v6);
  }
  else
  {
    if (v5)
    {
      if (objc_msgSend(v5, "conformsToProtocol:", &unk_255DFDD60))
      {
        objc_msgSend(a1[4], "runWithRemoteUserInterface:locale:stopListeningValue:", v5, a1[5], a1[6]);
        goto LABEL_25;
      }
      v8 = v5;
      if (objc_msgSend(v8, "conformsToProtocol:", &unk_255DFDD00))
        v7 = v8;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v9 = v7;

    objc_msgSend(a1[4], "setActionUserInterface:", v9);
    v10 = *MEMORY[0x24BDBCAE8];
    objc_msgSend(a1[5], "objectForKey:", *MEMORY[0x24BDBCAE8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(a1[5], "objectForKey:", *MEMORY[0x24BDBCB20]);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v11)
    {
      objc_msgSend(a1[5], "objectForKey:", v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@-%@"), v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@"), v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }

    objc_msgSend(MEMORY[0x24BE193A0], "sharedContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "applicationBundle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_alloc_init(getAFDictationOptionsClass());
    objc_msgSend(v18, "objectForInfoDictionaryKey:", *MEMORY[0x24BDBD298]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setApplicationName:", v20);

    v21 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v18, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForInfoDictionaryKey:", *MEMORY[0x24BDBD2A0]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%@ (%@)"), v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setApplicationVersion:", v24);

    if (objc_msgSend(a1[6], "isEqualToString:", CFSTR("After Short Pause")))
      v25 = 13;
    else
      v25 = 16;
    v26 = objc_msgSend(v19, "setKeyboardType:", v25);
    v27 = objc_alloc_init((Class)getAFSpeechRequestOptionsClass(v26));
    if (objc_msgSend(a1[6], "isEqualToString:", CFSTR("On Tap")))
      v28 = 1;
    else
      v28 = 3;
    objc_msgSend(v27, "setEndpointerOperationMode:", v28);
    v29 = objc_alloc_init(getAFDictationConnectionClass());
    v30 = a1[4];
    v31 = (void *)v30[43];
    v30[43] = v29;

    objc_msgSend(*((id *)a1[4] + 43), "setDelegate:");
    objc_msgSend(*((id *)a1[4] + 43), "beginAvailabilityMonitoring");
    v32 = objc_msgSend(*((id *)a1[4] + 43), "dictationIsAvailableForLanguage:", v16);
    v33 = a1[4];
    if ((v32 & 1) != 0)
    {
      objc_msgSend(a1[4], "actionUserInterface");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_opt_respondsToSelector();

      if ((v35 & 1) != 0)
      {
        objc_msgSend(a1[4], "actionUserInterface");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "actionDidBeginListening");

      }
      objc_msgSend(*((id *)a1[4] + 43), "startDictationWithLanguageCode:options:speechOptions:", v16, v19, v27);
      +[WFRecordingStatusManager sharedManager](WFRecordingStatusManager, "sharedManager");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setRecording:", 1);

      objc_msgSend(a1[4], "actionUserInterface");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x24BDAC760];
      v40[1] = 3221225472;
      v40[2] = __50__WFDictateTextAction_runAsynchronouslyWithInput___block_invoke_2;
      v40[3] = &unk_24F8BB370;
      v40[4] = a1[4];
      objc_msgSend(v38, "showWithCompletionHandler:", v40);

    }
    else
    {
      objc_msgSend(a1[4], "recognitionError");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "finishRunningWithError:", v39);

    }
  }
LABEL_25:

}

uint64_t __50__WFDictateTextAction_runAsynchronouslyWithInput___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishRunningWithError:", a2);
}

+ (id)userInterfaceProtocol
{
  return &unk_255DFDD00;
}

+ (BOOL)outputIsExemptFromTaintTrackingInheritance
{
  return 1;
}

@end
