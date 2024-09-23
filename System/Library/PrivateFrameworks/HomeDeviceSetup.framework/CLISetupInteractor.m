@implementation CLISetupInteractor

- (CLISetupInteractor)init
{
  CLISetupInteractor *v2;
  uint64_t v3;
  OS_dispatch_queue *dispatchQueue;
  CLISetupInteractor *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLISetupInteractor;
  v2 = -[CLISetupInteractor init](&v7, sel_init);
  if (v2)
  {
    CUMainQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CLISetupInteractor _cleanup](self, "_cleanup");
  v3.receiver = self;
  v3.super_class = (Class)CLISetupInteractor;
  -[CLISetupInteractor dealloc](&v3, sel_dealloc);
}

- (void)_cleanupSession
{
  HDSSetupSession *setupSession;

  -[HDSSetupSession invalidate](self->_setupSession, "invalidate");
  setupSession = self->_setupSession;
  self->_setupSession = 0;

}

- (void)setSetupUserInputConfig:(id)a3
{
  char *v4;
  uint64_t Int64;
  BOOL v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  const char *v28;
  char *v29;
  char *v30;
  void *v31;
  char Int64Ranged;
  char v33;
  void *v34;
  BOOL v35;
  char v36;
  char v37;
  char v38;
  unsigned int v39;
  BOOL v40;
  BOOL v41;
  const char *v42;
  uint64_t v43;

  v4 = (char *)a3;
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    v42 = v4;
    LogPrintF();
  }
  Int64 = CFDictionaryGetInt64();
  v6 = Int64 != 0;
  if (gLogCategory_CLISetupInteractor <= 30)
  {
    v7 = Int64;
    if (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize())
    {
      v8 = "no";
      if (v7)
        v8 = "yes";
      v42 = v8;
      LogPrintF();
    }
  }
  self->_recognizeVoiceEnabled = v6;
  v9 = CFDictionaryGetInt64();
  v10 = v9 != 0;
  if (gLogCategory_CLISetupInteractor <= 30)
  {
    v11 = v9;
    if (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize())
    {
      v12 = "no";
      if (v11)
        v12 = "yes";
      v42 = v12;
      LogPrintF();
    }
  }
  self->_locationEnabled = v10;
  v13 = CFDictionaryGetInt64();
  v14 = v13 != 0;
  if (gLogCategory_CLISetupInteractor <= 30)
  {
    v15 = v13;
    if (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize())
    {
      v16 = "no";
      if (v15)
        v16 = "yes";
      v42 = v16;
      LogPrintF();
    }
  }
  self->_personalRequestsEnabled = v14;
  v17 = CFDictionaryGetInt64();
  v18 = v17 != 0;
  if (gLogCategory_CLISetupInteractor <= 30)
  {
    v19 = v17;
    if (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize())
    {
      v20 = "no";
      if (v19)
        v20 = "yes";
      v42 = v20;
      LogPrintF();
    }
  }
  self->_siriEnabled = v18;
  v21 = CFDictionaryGetInt64();
  v22 = v21 != 0;
  if (gLogCategory_CLISetupInteractor <= 30)
  {
    v23 = v21;
    if (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize())
    {
      v24 = "no";
      if (v23)
        v24 = "yes";
      v42 = v24;
      LogPrintF();
    }
  }
  self->_activeDeviceEnabled = v22;
  v25 = CFDictionaryGetInt64();
  v26 = v25 != 0;
  if (gLogCategory_CLISetupInteractor <= 30)
  {
    v27 = v25;
    if (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize())
    {
      v28 = "no";
      if (v27)
        v28 = "yes";
      v42 = v28;
      LogPrintF();
    }
  }
  self->_odeonEnabled = v26;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v29 = (char *)objc_claimAutoreleasedReturnValue();
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    v42 = v29;
    LogPrintF();
  }
  objc_storeStrong((id *)&self->_homeName, v29);
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v30 = (char *)objc_claimAutoreleasedReturnValue();

  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    v42 = v30;
    LogPrintF();
  }
  objc_storeStrong((id *)&self->_roomName, v30);
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
    -[HDSSetupSession forceCLIPassCode:](self->_setupSession, "forceCLIPassCode:", v31, v31);
  }
  else
  {
    -[HDSSetupSession forceCLIPassCode:](self->_setupSession, "forceCLIPassCode:", v31, v42);
  }
  Int64Ranged = CFDictionaryGetInt64Ranged();
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    v43 = Int64Ranged;
    LogPrintF();
  }
  self->_stereoRole = Int64Ranged;
  v33 = CFDictionaryGetInt64Ranged();
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    v43 = v33;
    LogPrintF();
  }
  self->_stereoPairIndex = v33;
  CFStringGetTypeID();
  CFDictionaryGetTypedValue();
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[HDSSetupSession setAppleIDPassword:](self->_setupSession, "setAppleIDPassword:", v34, v43);
  v35 = CFDictionaryGetInt64() != 0;
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_soundRecognitionEnabled = v35;
  v36 = CFDictionaryGetInt64Ranged();
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_homeIndex = v36;
  v37 = CFDictionaryGetInt64Ranged();
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_roomIndex = v37;
  v38 = CFDictionaryGetInt64Ranged();
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_suggestedRoomIndex = v38;
  v39 = CFDictionaryGetInt64Ranged();
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_delayTime = v39;
  v40 = CFDictionaryGetInt64() != 0;
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_psgEnabled = v40;
  v41 = CFDictionaryGetInt64() != 0;
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_siriForICloudEnabled = v41;

}

- (void)setCLIPromptsForStates
{
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD v15[5];
  _QWORD v16[5];
  _QWORD v17[5];

  v3 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke;
  v17[3] = &unk_24FCD3F48;
  v17[4] = self;
  -[HDSSetupSession setProgressHandler:](self->_setupSession, "setProgressHandler:", v17);
  v16[0] = v3;
  v16[1] = 3221225472;
  v16[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_2;
  v16[3] = &unk_24FCD3F98;
  v16[4] = self;
  -[HDSSetupSession setPromptForHomeHandler:](self->_setupSession, "setPromptForHomeHandler:", v16);
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_4;
  v15[3] = &unk_24FCD3FC0;
  v15[4] = self;
  -[HDSSetupSession setPromptForRoomHandlerDetailed:](self->_setupSession, "setPromptForRoomHandlerDetailed:", v15);
  v14[0] = v3;
  v14[1] = 3221225472;
  v14[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_5;
  v14[3] = &unk_24FCD3FE8;
  v14[4] = self;
  -[HDSSetupSession setPromptForHomeiCloudHandler:](self->_setupSession, "setPromptForHomeiCloudHandler:", v14);
  v13[0] = v3;
  v13[1] = 3221225472;
  v13[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_6;
  v13[3] = &unk_24FCD3FE8;
  v13[4] = self;
  -[HDSSetupSession setPromptForiTunesSignInHandler:](self->_setupSession, "setPromptForiTunesSignInHandler:", v13);
  v12[0] = v3;
  v12[1] = 3221225472;
  v12[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_7;
  v12[3] = &unk_24FCD3FE8;
  v12[4] = self;
  -[HDSSetupSession setPromptForLocationEnableHandler:](self->_setupSession, "setPromptForLocationEnableHandler:", v12);
  v11[0] = v3;
  v11[1] = 3221225472;
  v11[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_8;
  v11[3] = &unk_24FCD3FE8;
  v11[4] = self;
  -[HDSSetupSession setPromptForPersonalRequestsHandler:](self->_setupSession, "setPromptForPersonalRequestsHandler:", v11);
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_9;
  v10[3] = &unk_24FCD3FE8;
  v10[4] = self;
  -[HDSSetupSession setPromptForSiriEnableHandler:](self->_setupSession, "setPromptForSiriEnableHandler:", v10);
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_10;
  v9[3] = &unk_24FCD3FE8;
  v9[4] = self;
  -[HDSSetupSession setPromptForTermsHandler:](self->_setupSession, "setPromptForTermsHandler:", v9);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_11;
  v8[3] = &unk_24FCD3FE8;
  v8[4] = self;
  -[HDSSetupSession setPromptForTVAudioHandler:](self->_setupSession, "setPromptForTVAudioHandler:", v8);
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_12;
  v7[3] = &unk_24FCD3FE8;
  v7[4] = self;
  -[HDSSetupSession setPromptForStereoRoleHandler:](self->_setupSession, "setPromptForStereoRoleHandler:", v7);
  v6[0] = v3;
  v6[1] = 3221225472;
  v6[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_13;
  v6[3] = &unk_24FCD3FE8;
  v6[4] = self;
  -[HDSSetupSession setPromptForSetupPSGHandler:](self->_setupSession, "setPromptForSetupPSGHandler:", v6);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_14;
  v5[3] = &unk_24FCD4010;
  v5[4] = self;
  -[HDSSetupSession setPromptForStereoMultipleHandler:](self->_setupSession, "setPromptForStereoMultipleHandler:", v5);
  v4[0] = v3;
  v4[1] = 3221225472;
  v4[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_15;
  v4[3] = &unk_24FCD3FE8;
  v4[4] = self;
  -[HDSSetupSession setPromptForSoundRecognitionHandler:](self->_setupSession, "setPromptForSoundRecognitionHandler:", v4);
}

void __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  int v6;
  _QWORD *v7;
  id v8;

  v5 = a3;
  v8 = v5;
  if (gLogCategory_CLISetupInteractor <= 30)
  {
    if (gLogCategory_CLISetupInteractor != -1 || (v6 = _LogCategory_Initialize(), v5 = v8, v6))
    {
      LogPrintF();
      v5 = v8;
    }
  }
  v7 = *(_QWORD **)(a1 + 32);
  if (v7[12])
  {
    objc_msgSend(v7, "sessionHandleProgress:inInfo:session:", a2, v8);
    v5 = v8;
  }

}

void __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD v42[5];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    v27 = objc_msgSend(v5, "count");
    LogPrintF();
  }
  v6 = (void *)objc_msgSend(v5, "mutableCopy", v27);
  v7 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
  if (!v7)
    goto LABEL_48;
  NSLog(CFSTR("CmdHomeDeviceSetupNoUI Homes: %@\n"), v6);
  if (!objc_msgSend(v6, "count"))
  {
    objc_msgSend(v7, "selectedHome");
    v10 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v9 = (void *)v10;
    goto LABEL_12;
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "length"))
  {
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_3;
    v42[3] = &unk_24FCD3F70;
    v42[4] = *(_QWORD *)(a1 + 32);
    v8 = objc_msgSend(v6, "indexOfObjectPassingTest:", v42);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v6, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (gLogCategory_CLISetupInteractor <= 30
        && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(v9, "name");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF();

      }
    }
LABEL_12:
    if (v9)
      goto LABEL_18;
    goto LABEL_17;
  }
  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 40) != -1
    && objc_msgSend(v6, "count") > (unint64_t)*(int *)(*(_QWORD *)(a1 + 32) + 40))
  {
    objc_msgSend(v6, "objectAtIndex:");
    v10 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
LABEL_17:
  objc_msgSend(v6, "objectAtIndex:", a3, v28);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("CmdHomeDeviceSetupNoUI Invalid or No Home arg passed in, defaulting to: %@\n"), v9);
LABEL_18:
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v9, "name", v28);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  objc_msgSend(v9, "name", v28);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("CmdHomeDeviceSetupNoUI selected home name: %@\n"), v11);

  v33 = v7;
  objc_msgSend(v7, "homeKitSelectHome:", v9);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v39;
    v16 = (void *)*MEMORY[0x24BDD49E0];
    v30 = v6;
    v31 = v5;
    v32 = v12;
    v29 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v39 != v15)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        objc_msgSend(v18, "accessories");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v35;
          while (2)
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v35 != v22)
                objc_enumerationMutation(v19);
              objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "category");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "categoryType");
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              if (v25 == v16)
              {
                if (gLogCategory_CLISetupInteractor <= 30
                  && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
                {
                  LogPrintF();
                }

                v26 = 1;
                v6 = v30;
                v5 = v31;
                v12 = v32;
                goto LABEL_47;
              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
            if (v21)
              continue;
            break;
          }
        }

        v12 = v32;
        v15 = v29;
      }
      v14 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
      v26 = 0;
      v6 = v30;
      v5 = v31;
    }
    while (v14);
  }
  else
  {
    v26 = 0;
  }
LABEL_47:

  v7 = v33;
  objc_msgSend(v33, "setHasExistingHomePodInAccount:", v26);

LABEL_48:
}

uint64_t __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

void __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_4(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  int v13;
  uint64_t v14;
  id v15;
  int v16;
  uint64_t v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;

  v23 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v9, "count");
    v22 = objc_msgSend(v10, "count");
    LogPrintF();
  }
  v12 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
  if (v12)
  {
    NSLog(CFSTR("CmdHomeDeviceSetupNoUI Existing Rooms: %@\n"), v9);
    NSLog(CFSTR("CmdHomeDeviceSetupNoUI Suggested Rooms: %@\n"), v10);
    v13 = objc_msgSend(v9, "containsObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
    v14 = *(_QWORD *)(a1 + 32);
    if (v13)
    {
LABEL_7:
      v15 = *(id *)(v14 + 32);
      goto LABEL_28;
    }
    if (*(_DWORD *)(v14 + 44) != -1)
    {
      v16 = objc_msgSend(v9, "count");
      v14 = *(_QWORD *)(a1 + 32);
      if (*(_DWORD *)(v14 + 44) < v16)
      {
        NSLog(CFSTR("CmdHomeDeviceSetupNoUI selecting from inExistingRooms at index %d\n"), *(unsigned int *)(v14 + 44));
        v17 = *(int *)(*(_QWORD *)(a1 + 32) + 44);
LABEL_26:
        v19 = v9;
        goto LABEL_27;
      }
    }
    if (*(_DWORD *)(v14 + 48) == -1
      || (v18 = objc_msgSend(v10, "count"), v14 = *(_QWORD *)(a1 + 32), *(_DWORD *)(v14 + 48) >= v18))
    {
      if (objc_msgSend(v10, "containsObject:", *(_QWORD *)(v14 + 32)))
      {
        v14 = *(_QWORD *)(a1 + 32);
        goto LABEL_7;
      }
      if (!objc_msgSend(v11, "section"))
      {
        v17 = objc_msgSend(v11, "row");
        goto LABEL_26;
      }
      if (objc_msgSend(v11, "section") != 1)
      {
LABEL_29:
        if (objc_msgSend(v9, "count"))
          objc_msgSend(v9, "objectAtIndex:", v11);
        else
          objc_msgSend(v10, "firstObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_33:
        NSLog(CFSTR("CmdHomeDeviceSetupNoUI selected room name: %@\n"), v20, v22);
        if (gLogCategory_CLISetupInteractor <= 30
          && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
        {
          v21 = v20;
          LogPrintF();
        }
        objc_msgSend(v12, "homeKitSelectRoom:", v20, v21);

        goto LABEL_38;
      }
      v17 = objc_msgSend(v11, "row");
    }
    else
    {
      NSLog(CFSTR("CmdHomeDeviceSetupNoUI selecting from inSuggestedRooms at index %d\n"), *(unsigned int *)(v14 + 48));
      v17 = *(int *)(*(_QWORD *)(a1 + 32) + 48);
    }
    v19 = v10;
LABEL_27:
    objc_msgSend(v19, "objectAtIndex:", v17);
    v15 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:
    v20 = v15;
    if (v15)
      goto LABEL_33;
    goto LABEL_29;
  }
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
LABEL_38:

}

void __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;

  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  if (v2)
  {
    v3 = v2;
    NSLog(CFSTR("CmdHomeDeviceSetupNoUI kUserErrorHomeKitNotEnabled, enabling Home in iCloud settings\n"));
    objc_msgSend(v3, "homeiCloudEnable");

  }
}

void __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_6(uint64_t a1)
{
  void *v2;
  id v3;

  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  if (v2)
  {
    v3 = v2;
    NSLog(CFSTR("CmdHomeDeviceSetupNoUI kUserErrorNoiTunesAccount, skipping but HomePod will not have itunes account on it \n"));
    objc_msgSend(v3, "skipiTunesSignIn");

  }
}

void __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_7(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  const char *v4;
  id v5;

  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 96);
  if (v3)
  {
    if (*(_BYTE *)(v2 + 9))
      v4 = "yes";
    else
      v4 = "no";
    v5 = v3;
    NSLog(CFSTR("CmdHomeDeviceSetupNoUI location enabled to %s\n"), v4);
    objc_msgSend(v5, "locationEnable:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 9));

  }
}

void __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_8(uint64_t a1)
{
  const char *v2;
  id v3;
  void *v4;
  int v5;
  int v6;
  id v7;

  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 10))
    v2 = "yes";
  else
    v2 = "no";
  NSLog(CFSTR("CmdHomeDeviceSetupNoUI promptForPersonalRequestsHandler %s\n"), v2);
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
  v4 = v3;
  if (v3)
  {
    v7 = v3;
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 10))
    {
      if (gLogCategory_CLISetupInteractor <= 30)
      {
        if (gLogCategory_CLISetupInteractor != -1 || (v5 = _LogCategory_Initialize(), v4 = v7, v5))
        {
          LogPrintF();
          v4 = v7;
        }
      }
      objc_msgSend(v4, "runPersonalRequestsAgreedCLI:makeActiveDevice:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 11), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 12));
    }
    else
    {
      if (gLogCategory_CLISetupInteractor <= 30)
      {
        if (gLogCategory_CLISetupInteractor != -1 || (v6 = _LogCategory_Initialize(), v4 = v7, v6))
        {
          LogPrintF();
          v4 = v7;
        }
      }
      objc_msgSend(v4, "personalRequestsEnabled:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 10));
    }
    v4 = v7;
  }

}

void *__44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_9(uint64_t a1)
{
  const char *v2;
  void *result;

  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 11))
    v2 = "yes";
  else
    v2 = "no";
  NSLog(CFSTR("CmdHomeDeviceSetupNoUI promptForSiriEnableHandler %s\n"), v2);
  result = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  if (result)
    return (void *)objc_msgSend(result, "siriEnable");
  return result;
}

void *__44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_10(uint64_t a1)
{
  void *result;

  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  NSLog(CFSTR("CmdHomeDeviceSetupNoUI promptForTermsHandler \n"));
  result = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  if (result)
    return (void *)objc_msgSend(result, "termsAgreed");
  return result;
}

void __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_11(uint64_t a1)
{
  id v2;
  void *v3;
  const char *v4;
  int v5;
  const char *v6;
  id v7;

  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  NSLog(CFSTR("CmdHomeDeviceSetupNoUI promptForTVAudioHandler \n"));
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
  v3 = v2;
  if (v2)
  {
    v7 = v2;
    if (gLogCategory_CLISetupInteractor <= 30)
    {
      if (gLogCategory_CLISetupInteractor != -1 || (v5 = _LogCategory_Initialize(), v3 = v7, v5))
      {
        if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 13))
          v4 = "yes";
        else
          v4 = "no";
        v6 = v4;
        LogPrintF();
        v3 = v7;
      }
    }
    objc_msgSend(v3, "tvAudioEnabled:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 13), v6);
    v3 = v7;
  }

}

void *__44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_12(uint64_t a1)
{
  uint64_t v2;
  void *result;

  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  NSLog(CFSTR("CmdHomeDeviceSetupNoUI promptForStereoRoleHandler \n"));
  v2 = *(_QWORD *)(a1 + 32);
  result = *(void **)(v2 + 96);
  if (result)
    return (void *)objc_msgSend(result, "stereoRolePicked:", *(unsigned int *)(v2 + 68));
  return result;
}

uint64_t __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_13(uint64_t a1)
{
  const char *v2;

  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 15))
    v2 = "yes";
  else
    v2 = "no";
  NSLog(CFSTR("CmdHomeDeviceSetupNoUI promptForSetupPSGHandler, setting to %s\n"), v2);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "psgSelected:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 15));
}

void __44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_14(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 96);
  if (v3)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
    v5 = objc_msgSend(v8, "count");
    v6 = *(_QWORD *)(a1 + 32);
    if (v4 >= v5)
    {
      NSLog(CFSTR("CmdHomeDeviceSetupNoUI promptForStereoMultipleHandler FAILED, index out of bounds %lu \n"), *(_QWORD *)(v6 + 56));
    }
    else
    {
      objc_msgSend(v8, "objectAtIndex:", *(_QWORD *)(v6 + 56));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("CmdHomeDeviceSetupNoUI promptForStereoMultipleHandler, setting to %@\n"), v7);
      objc_msgSend(v3, "stereoMultiplePicked:", v7);

    }
  }

}

void *__44__CLISetupInteractor_setCLIPromptsForStates__block_invoke_15(uint64_t a1)
{
  const char *v2;
  uint64_t v3;
  void *result;

  if (gLogCategory_CLISetupInteractor <= 30
    && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 14))
    v2 = "yes";
  else
    v2 = "no";
  NSLog(CFSTR("CmdHomeDeviceSetupNoUI promptForSoundRecognitionHandler, setting to %s\n"), v2);
  v3 = *(_QWORD *)(a1 + 32);
  result = *(void **)(v3 + 96);
  if (result)
    return (void *)objc_msgSend(result, "soundRecognitionAgreed:", *(unsigned __int8 *)(v3 + 14));
  return result;
}

- (void)sessionHandleProgress:(unsigned int)a3 inInfo:(id)a4 session:(id)a5
{
  id v8;
  const char *v9;
  void (**v10)(void);
  NSObject *v11;
  dispatch_time_t v12;
  id v13;

  v13 = a4;
  v8 = a5;
  if ((int)a3 > 123)
  {
    if ((int)a3 > 229)
    {
      if ((int)a3 > 235)
      {
        if (a3 == 236)
        {
          FPrintF();
          goto LABEL_56;
        }
        if (a3 != 250)
          goto LABEL_57;
LABEL_36:
        FPrintF();
        if (gLogCategory_CLISetupInteractor > 30
          || gLogCategory_CLISetupInteractor == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_53;
        }
LABEL_8:
        LogPrintF();
LABEL_53:
        -[HDSSetupSession promptForSetupCompletionHandler](self->_setupSession, "promptForSetupCompletionHandler");
        v10 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v10[2]();

        goto LABEL_57;
      }
      if (a3 != 230 && a3 != 234)
        goto LABEL_57;
    }
    else if ((int)a3 > 199)
    {
      if (a3 != 200 && a3 != 210)
        goto LABEL_57;
    }
    else if (a3 != 124)
    {
      if (a3 == 140)
      {
        if (self->_recognizeVoiceEnabled)
          v9 = "yes";
        else
          v9 = "no";
        NSLog(CFSTR("CmdHomeDeviceSetupNoUI rmv set to %s\n"), v9, v13);
        objc_msgSend(v8, "siriForiCloudRecognizeAnswered:", self->_siriForICloudEnabled);
        objc_msgSend(v8, "recognizeVoiceAnswered:", self->_recognizeVoiceEnabled);
      }
      goto LABEL_57;
    }
LABEL_56:
    FPrintF();
    goto LABEL_57;
  }
  if ((int)a3 > 79)
  {
    if ((int)a3 <= 119)
    {
      if (a3 == 80)
      {
        if (self->_delayTime)
        {
          if (gLogCategory_CLISetupInteractor <= 30
            && (gLogCategory_CLISetupInteractor != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          v11 = dispatch_semaphore_create(0);
          v12 = dispatch_time(0, 1000000000 * self->_delayTime);
          dispatch_semaphore_wait(v11, v12);

        }
        goto LABEL_56;
      }
      if (a3 != 96)
        goto LABEL_57;
      goto LABEL_36;
    }
    if (a3 != 120 && a3 != 122)
      goto LABEL_57;
    goto LABEL_56;
  }
  if ((int)a3 > 34)
  {
    if (a3 != 35 && a3 != 40)
      goto LABEL_57;
    goto LABEL_56;
  }
  if (a3 == 20)
    goto LABEL_36;
  if (a3 == 30)
  {
    NSLog(CFSTR("### CmdHomeDeviceSetupNoUI Finished, WITH ERROR\n"));
    if (gLogCategory_CLISetupInteractor > 90
      || gLogCategory_CLISetupInteractor == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_53;
    }
    goto LABEL_8;
  }
LABEL_57:

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__CLISetupInteractor_invalidate__block_invoke;
  block[3] = &unk_24FCD3FE8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __32__CLISetupInteractor_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (SFDevice)peerDevice
{
  return self->_peerDevice;
}

- (void)setPeerDevice:(id)a3
{
  objc_storeStrong((id *)&self->_peerDevice, a3);
}

- (unint64_t)peerFeatureFlags
{
  return self->_peerFeatureFlags;
}

- (void)setPeerFeatureFlags:(unint64_t)a3
{
  self->_peerFeatureFlags = a3;
}

- (HDSSetupSession)setupSession
{
  return self->_setupSession;
}

- (void)setSetupSession:(id)a3
{
  objc_storeStrong((id *)&self->_setupSession, a3);
}

- (unint64_t)testFlags
{
  return self->_testFlags;
}

- (void)setTestFlags:(unint64_t)a3
{
  self->_testFlags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupSession, 0);
  objc_storeStrong((id *)&self->_peerDevice, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_homeName, 0);
}

@end
