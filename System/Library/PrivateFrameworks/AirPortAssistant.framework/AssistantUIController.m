@implementation AssistantUIController

- (AssistantUIController)init
{
  AssistantUIController *v2;
  AutoGuessController *v3;
  const char *v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  char *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AssistantUIController;
  v2 = -[AssistantUIController init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(AutoGuessController);
    objc_msgSend_setAutoGuessController_(v2, v4, (uint64_t)v3);
    objc_msgSend_setDelegate_(v2->_autoGuessController, v5, (uint64_t)v2);
    v2->_state = 0;
    v6 = (void *)sub_21A690C10((uint64_t)CFSTR("untitled"), (uint64_t)CFSTR("AirPortSettings"));
    v9 = (char *)objc_msgSend_UTF8String(v6, v7, v8);
    sub_21A6D67D0(v9);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v2;
  void *v4;
  const char *v5;
  const char *v6;
  objc_super v7;

  v4 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, v2);
  objc_msgSend_removeObserver_name_object_(v4, v5, (uint64_t)self, CFSTR("com.apple.WiFiUtils.Join.Complete"), 0);
  objc_msgSend_setAutoGuessController_(self, v6, 0);
  v7.receiver = self;
  v7.super_class = (Class)AssistantUIController;
  -[AssistantUIController dealloc](&v7, sel_dealloc);
}

- (int)startAutoGuess
{
  uint64_t v2;
  id delegate;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t CurrentAssociationInfo;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  const char *v18;
  AutoGuessController *autoGuessController;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t v27;

  if (self->_state)
  {
    LODWORD(delegate) = -6709;
  }
  else if (self->_autoGuessController)
  {
    *(_QWORD *)&self->_state = 1;
    v5 = (void *)objc_msgSend_sharedInstance(WiFiUtils, a2, v2);
    if (objc_msgSend_airPortIsOn(v5, v6, v7))
    {
      if (objc_msgSend_isCurrentlyAssociatedToAnInfrastructureNetwork_(v5, v8, 0))
      {
        CurrentAssociationInfo = objc_msgSend_getCurrentAssociationInfo(v5, v8, v9);
        objc_msgSend_setLastAssociatedInfo_(self, v11, CurrentAssociationInfo);
        if (dword_2550EE930 <= 100 && (dword_2550EE930 != -1 || sub_21A69876C((uint64_t)&dword_2550EE930, 0x64u)))
          sub_21A698FDC((uint64_t)&dword_2550EE930, (uint64_t)"-[AssistantUIController startAutoGuess]", 100, (uint64_t)"lastAssociatedInfo: %@\n", v12, v13, v14, v15, (uint64_t)self->_lastAssociatedInfo);
      }
    }
    objc_msgSend_setTargetMACAddress_(self->_autoGuessController, v8, (uint64_t)self->_targetMACAddress);
    objc_msgSend_setTargetScanRecord_(self->_autoGuessController, v16, (uint64_t)self->_targetScanRecord);
    objc_msgSend_setTargetBrowseRecord_(self->_autoGuessController, v17, (uint64_t)self->_targetBrowseRecord);
    objc_msgSend_setUiDelegate_(self->_autoGuessController, v18, (uint64_t)self->_delegate);
    autoGuessController = self->_autoGuessController;
    if (objc_msgSend_count(self->_paramScanResults, v20, v21))
    {
      LODWORD(delegate) = objc_msgSend_runAutoGuessWithWifiScanInfos_(autoGuessController, v22, (uint64_t)self->_paramScanResults);
    }
    else
    {
      v24 = objc_msgSend_unmergedScanInfoArray(v5, v22, v23);
      LODWORD(delegate) = objc_msgSend_runAutoGuessWithWifiScanInfos_(autoGuessController, v25, v24);
    }
    if (!(_DWORD)delegate)
    {
      delegate = self->_delegate;
      if (delegate)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend_presentUIForRecommendationStatus(self->_delegate, v26, v27);
        LODWORD(delegate) = 0;
      }
    }
  }
  else
  {
    LODWORD(delegate) = -6718;
  }
  return (int)delegate;
}

- (int)startSetupFromAutoGuessRecommendation:(id)a3
{
  int result;
  void *v6;
  const char *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  int v11;
  const char *v12;
  uint64_t v13;
  __objc2_class **v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  AUSetupController *setupController;
  void *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  NSMutableDictionary *setupOptions;
  const char *v25;
  uint64_t v26;
  const char *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;

  if (self->_state != 2)
    return -6709;
  if (self->_setupController)
    return -6721;
  v6 = (void *)objc_msgSend_primaryRecommendationDictionaryFromCompletionDict_(AutoGuessController, a2, (uint64_t)self->_guessCompleteDict);
  if (!v6)
    return -6727;
  v8 = v6;
  v9 = objc_msgSend_objectForKey_(v6, v7, (uint64_t)CFSTR("BSAutoGuess_UnconfiguredNetwork"));
  v11 = objc_msgSend_scanInfoDeviceKind_(WiFiUtils, v10, v9);
  v14 = off_24DD03D28;
  if ((v11 - 3) >= 2)
    v14 = off_24DD03D30;
  v15 = objc_msgSend_setupController(*v14, v12, v13);
  objc_msgSend_setSetupController_(self, v16, v15);
  setupController = self->_setupController;
  if (!setupController)
    return -6728;
  self->_state = 5;
  v20 = (void *)objc_msgSend_setupDelegates(setupController, v17, v18);
  objc_msgSend_addObject_(v20, v21, (uint64_t)self);
  objc_msgSend_setUiConfigDelegate_(self->_setupController, v22, (uint64_t)self);
  objc_msgSend_setUiDelegate_(self->_setupController, v23, (uint64_t)self->_delegate);
  setupOptions = self->_setupOptions;
  v26 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v25, 1);
  objc_msgSend_setObject_forKey_(setupOptions, v27, v26, CFSTR("kBSAutoGuessSetupOptionKey_RecommendationIsAutomatic"));
  if (a3)
  {
    v29 = objc_msgSend_objectForKey_(a3, v28, (uint64_t)CFSTR("kSBSKey_BaseName"));
    if (v29)
      objc_msgSend_setObject_forKey_(self->_setupOptions, v30, v29, CFSTR("kBSAutoGuessSetupOptionKey_BaseName"));
    v31 = objc_msgSend_objectForKey_(a3, v30, (uint64_t)CFSTR("kSBSKey_BasePassword"));
    if (v31)
      objc_msgSend_setObject_forKey_(self->_setupOptions, v32, v31, CFSTR("kBSAutoGuessSetupOptionKey_BasePassword"));
    v33 = objc_msgSend_objectForKey_(a3, v32, (uint64_t)CFSTR("kSBSKey_AirPlayPassword"));
    if (v33)
      objc_msgSend_setObject_forKey_(self->_setupOptions, v34, v33, CFSTR("kBSAutoGuessSetupOptionKey_AirPlayPassword"));
    v35 = objc_msgSend_objectForKey_(a3, v34, (uint64_t)CFSTR("kSBSKey_NetworkName"));
    if (v35)
      objc_msgSend_setObject_forKey_(self->_setupOptions, v36, v35, CFSTR("kBSAutoGuessSetupOptionKey_NetworkName"));
    v37 = objc_msgSend_objectForKey_(a3, v36, (uint64_t)CFSTR("kSBSKey_NetworkPassword"));
    if (v37)
      objc_msgSend_setObject_forKey_(self->_setupOptions, v38, v37, CFSTR("kBSAutoGuessSetupOptionKey_NetworkPassword"));
    v39 = objc_msgSend_objectForKey_(a3, v38, (uint64_t)CFSTR("kSBSKey_SourceNetwork"));
    if (v39)
      objc_msgSend_setObject_forKey_(self->_setupOptions, v40, v39, CFSTR("kBSAutoGuessSetupOptionKey_SourceNetwork"));
    v41 = objc_msgSend_objectForKey_(a3, v40, (uint64_t)CFSTR("kSBSKey_SourceBase"));
    if (v41)
      objc_msgSend_setObject_forKey_(self->_setupOptions, v42, v41, CFSTR("kBSAutoGuessSetupOptionKey_SourceBase"));
    v43 = objc_msgSend_objectForKey_(v8, v42, (uint64_t)CFSTR("BSAutoGuess_UnconfiguredNetwork"));
    if (v43)
      objc_msgSend_setObject_forKey_(self->_setupOptions, v28, v43, CFSTR("BSAutoGuess_UnconfiguredNetwork"));
  }
  result = objc_msgSend_setupFromAutoguessRecommendation_withOptions_(self->_setupController, v28, (uint64_t)v8, self->_setupOptions);
  if (!result)
  {
    if (self->_delegate)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend_presentUIForSetupStatusWithRecommendationDict_(self->_delegate, v44, (uint64_t)v8);
    }
    return objc_msgSend_updateSettingsAsync(self->_setupController, v44, v45);
  }
  return result;
}

- (int)startStepByStepFromAutoGuessRecommendation
{
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  StepByStepController *stepByStepController;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  const char *v17;

  if (self->_state != 2)
    return -6709;
  if (self->_stepByStepController)
    return -6721;
  v4 = objc_msgSend_primaryRecommendationDictionaryFromCompletionDict_(AutoGuessController, a2, (uint64_t)self->_guessCompleteDict);
  if (!v4)
    return -6727;
  v7 = v4;
  v8 = objc_msgSend_stepByStepController(StepByStepController, v5, v6);
  objc_msgSend_setStepByStepController_(self, v9, v8);
  stepByStepController = self->_stepByStepController;
  if (!stepByStepController)
    return -6728;
  self->_state = 3;
  objc_msgSend_setDelegate_(stepByStepController, v10, (uint64_t)self);
  objc_msgSend_setUiDelegate_(self->_stepByStepController, v12, (uint64_t)self->_delegate);
  if (self->_delegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend_presentUIForStepByStepStart(self->_delegate, v13, v14);
  }
  v15 = objc_msgSend_restoreRecommendationDictionaryFromCompletionDict_(AutoGuessController, v13, (uint64_t)self->_guessCompleteDict);
  objc_msgSend_setRestoreRecommendation_(self->_stepByStepController, v16, v15);
  return objc_msgSend_setupFromAutoguessRecommendation_withOptions_(self->_stepByStepController, v17, v7, self->_setupOptions);
}

- (int)startRestoreFromAutoGuessRecommendation
{
  self->_state = 5;
  return 0;
}

- (int)cancelCurrentAssistantState:(BOOL)a3
{
  _BOOL4 v3;
  AutoGuessController *autoGuessController;
  uint64_t v6;
  AutoGuessController *v7;
  const char *v8;
  AUSetupController *setupController;
  int state;
  AUSetupController *v11;
  const char *v12;
  StepByStepController *stepByStepController;
  StepByStepController *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;

  v3 = a3;
  autoGuessController = self->_autoGuessController;
  if (autoGuessController && self->_state == 1)
  {
    v6 = objc_msgSend_cancelAutoGuess(autoGuessController, a2, a3);
    if ((_DWORD)v6 == -6720)
    {
      self->_state = 10;
      v7 = self->_autoGuessController;
      objc_msgSend_setAutoGuessController_(self, v8, 0);
LABEL_17:
      v6 = 0;
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  setupController = self->_setupController;
  if (!setupController)
  {
LABEL_11:
    stepByStepController = self->_stepByStepController;
    if (stepByStepController && self->_state == 3)
    {
      v6 = objc_msgSend_cancelStepByStep(stepByStepController, a2, a3);
      if (!(_DWORD)v6)
      {
        self->_state = 10;
        v14 = self->_stepByStepController;
        objc_msgSend_setStepByStepController_(self, v15, 0);
      }
      goto LABEL_18;
    }
    self->_state = 10;
    if (self->_assistantResult)
    {
      v6 = 0;
      goto LABEL_22;
    }
    goto LABEL_17;
  }
  state = self->_state;
  switch(state)
  {
    case 7:
      objc_msgSend_showUIConfigPromptResult_withOptions_(self, a2, 4294960573, 0);
      break;
    case 6:
      objc_msgSend_presentUIForConnectionVerificationResult_withOptions_(self, a2, 4294960573, 0);
      break;
    case 5:
      v6 = objc_msgSend_cancelSetup(setupController, a2, a3);
      if ((_DWORD)v6 == -6720)
      {
        self->_state = 10;
        v11 = self->_setupController;
        objc_msgSend_setSetupController_(self, v12, 0);
        goto LABEL_17;
      }
LABEL_18:
      self->_assistantResult = -6723;
      goto LABEL_22;
    default:
      goto LABEL_11;
  }
  v6 = 4294960525;
LABEL_22:
  v16 = (void *)objc_msgSend_sharedInstance(WiFiUtils, a2, a3);
  objc_msgSend_cancelAsync(v16, v17, v18);
  if (v3)
  {
    if (dword_2550EE930 <= 100 && (dword_2550EE930 != -1 || sub_21A69876C((uint64_t)&dword_2550EE930, 0x64u)))
      sub_21A698FDC((uint64_t)&dword_2550EE930, (uint64_t)"-[AssistantUIController cancelCurrentAssistantState:]", 100, (uint64_t)"forcing cancel state cancel err: %m\n", v21, v22, v23, v24, v6);
    *(_QWORD *)&self->_state = 0xFFFFE5BD0000000ALL;
    if (self->_autoGuessController)
    {
      v25 = (void *)objc_msgSend_autoGuessController(self, v19, v20);
      objc_msgSend_setDelegate_(v25, v26, 0);
    }
    if (self->_stepByStepController)
    {
      v27 = (void *)objc_msgSend_stepByStepController(self, v19, v20);
      objc_msgSend_setDelegate_(v27, v28, 0);
    }
    if (self->_setupController)
    {
      v29 = (void *)objc_msgSend_setupController(self, v19, v20);
      objc_msgSend_setUiConfigDelegate_(v29, v30, 0);
      v33 = (void *)objc_msgSend_setupController(self, v31, v32);
      v36 = (void *)objc_msgSend_setupDelegates(v33, v34, v35);
      objc_msgSend_removeObject_(v36, v37, (uint64_t)self);
    }
    LODWORD(v6) = 0;
  }
  return v6;
}

- (int)doneWithAssistant:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int state;
  int v8;
  const char *v9;
  uint64_t v11;

  state = self->_state;
  if ((state - 9) > 1)
    return -6709;
  self->_state = 11;
  if (state == 9
    || !objc_msgSend_restoreNetworkIfNeeded_disassociateIfNeeded_forceQuit_(self, a2, 1, 1, a3))
  {
    if (dword_2550EE930 <= 100)
    {
      if (dword_2550EE930 == -1)
      {
        v8 = 0;
        if (!sub_21A69876C((uint64_t)&dword_2550EE930, 0x64u))
          return v8;
      }
      else
      {
        v8 = 0;
      }
      v9 = "No restore needed - done\n";
LABEL_17:
      sub_21A698FDC((uint64_t)&dword_2550EE930, (uint64_t)"-[AssistantUIController doneWithAssistant:]", 100, (uint64_t)v9, v3, v4, v5, v6, v11);
      return v8;
    }
    return 0;
  }
  else if (dword_2550EE930 > 100)
  {
    return -6771;
  }
  else
  {
    if (dword_2550EE930 != -1)
    {
      v8 = -6771;
LABEL_16:
      v9 = "Holding up done, until restore is complete\n";
      goto LABEL_17;
    }
    v8 = -6771;
    if (sub_21A69876C((uint64_t)&dword_2550EE930, 0x64u))
      goto LABEL_16;
  }
  return v8;
}

- (id)modifyTopoUIInLayer:(id)a3 withLayout:(id)a4 andOwningView:(id)a5 targetProductID:(id)a6 targetDeviceKind:(id)a7 targetName:(id)a8 targetWiFiName:(id)a9 sourceProductID:(id)a10 sourceDeviceKind:(id)a11 sourceName:(id)a12 sourceWiFiName:(id)a13 connectionType:(id)a14
{
  id v19;
  NetTopoMiniStaticLayout *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  void *v30;
  const char *v31;
  void *v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;

  if (a4)
  {
    v19 = a4;
    if (a3)
      objc_msgSend_setContainerLayer_(a4, a2, (uint64_t)a3);
  }
  else
  {
    if (!a3)
      return 0;
    v20 = [NetTopoMiniStaticLayout alloc];
    v19 = (id)objc_msgSend_initWithContainerLayer_andOptions_(v20, v21, (uint64_t)a3, 4);
  }
  objc_msgSend_setNetTopoMiniStaticLayout_(a5, a2, (uint64_t)v19);
  v24 = 4;
  if (a10)
  {
    if (sub_21A731B64(a5, v22, v23) == 1)
      v24 = 2;
    else
      v24 = 4;
  }
  objc_msgSend_setLayoutOptions_(v19, v22, v24);
  objc_msgSend_setOwningView_(v19, v25, (uint64_t)a5);
  v29 = (void *)objc_msgSend_array(MEMORY[0x24BDBCEB8], v26, v27);
  if (a10)
  {
    v30 = (void *)objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCED8], v28, (uint64_t)off_2550F49B0[0], off_2550F49A8[0], a10, off_2550F49B8[0], a11, off_2550F49C0[0], 0);
    v32 = v30;
    if (a13)
      objc_msgSend_setObject_forKey_(v30, v31, (uint64_t)a13, off_2550F49C8[0]);
    if (a12)
      objc_msgSend_setObject_forKey_(v32, v31, (uint64_t)a12, off_2550F49D0[0]);
    objc_msgSend_addObject_(v29, v31, (uint64_t)v32);
  }
  v33 = (void *)objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x24BDBCED8], v28, (uint64_t)off_2550F49B0[0], off_2550F49A8[0], a6, off_2550F49B8[0], a7, off_2550F49C0[0], 0);
  v35 = v33;
  if (a9)
    objc_msgSend_setObject_forKey_(v33, v34, (uint64_t)a9, off_2550F49C8[0]);
  if (a8)
    objc_msgSend_setObject_forKey_(v35, v34, (uint64_t)a8, off_2550F49D0[0]);
  if (a10)
    objc_msgSend_setObject_forKey_(v35, v34, (uint64_t)a14, off_2550F49D8[0]);
  objc_msgSend_addObject_(v29, v34, (uint64_t)v35);
  objc_msgSend_createLayoutForDevices_(v19, v36, (uint64_t)v29);
  return v19;
}

- (void)deliverSetupUIConfigResult:(int)a3 withOptions:(id)a4
{
  uint64_t v5;
  const char *v7;
  uint64_t v8;

  v5 = *(_QWORD *)&a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend_setupUIConfigResult_withOptions_(self->_setupController, v7, v5, a4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    MEMORY[0x24BEDD108](self->_delegate, sel_showUIConfigPromptPostHook, v8);
}

- (void)presentUIForConnectionVerificationResult:(int)a3 withOptions:(id)a4
{
  if (self->_setupController)
  {
    if (self->_state == 6)
      objc_msgSend_deliverSetupUIConfigResult_withOptions_(self, a2, *(uint64_t *)&a3, a4);
  }
}

- (void)showUIConfigPromptResult:(int)a3 withOptions:(id)a4
{
  if (self->_setupController)
  {
    if (self->_state == 7)
    {
      objc_msgSend_deliverSetupUIConfigResult_withOptions_(self, a2, *(uint64_t *)&a3, a4);
      self->_state = 5;
    }
  }
}

- (void)presentUIForStepByStepNextStepResult:(int)a3 withOptions:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *(_QWORD *)&a3;
  if (dword_2550EE930 <= 100 && (dword_2550EE930 != -1 || sub_21A69876C((uint64_t)&dword_2550EE930, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE930, (uint64_t)"-[AssistantUIController presentUIForStepByStepNextStepResult:withOptions:]", 100, (uint64_t)"result: %ld options: %@\n", v4, v5, v6, v7, v8);
  if (self->_state == 3)
    MEMORY[0x24BEDD108](self->_stepByStepController, sel_stepByStepNextStepResult_withOptions_, v8);
}

- (void)autoguessUpdateTargetInfo:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (dword_2550EE930 <= 100 && (dword_2550EE930 != -1 || sub_21A69876C((uint64_t)&dword_2550EE930, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE930, (uint64_t)"-[AssistantUIController autoguessUpdateTargetInfo:]", 100, (uint64_t)"targetInfo: %@ \n", v3, v4, v5, v6, (uint64_t)a3);
  if (self->_delegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      MEMORY[0x24BEDD108](self->_delegate, sel_presentUIForRecommmendationTargetInfo_, a3);
  }
}

- (void)autoguessProgressUpdated:(int)a3 paramString:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  const __CFString *v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  const char *v18;
  uint64_t valid;

  v9 = *(_QWORD *)&a3;
  if (dword_2550EE930 <= 100 && (dword_2550EE930 != -1 || sub_21A69876C((uint64_t)&dword_2550EE930, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE930, (uint64_t)"-[AssistantUIController autoguessProgressUpdated:paramString:]", 100, (uint64_t)"selector: %d paramString: %@\n", v4, v5, v6, v7, v9);
  v11 = &stru_24DD08368;
  switch((int)v9)
  {
    case 3:
      v12 = qword_2550F4DE8;
      v13 = CFSTR("kProgress_Browsing");
      goto LABEL_20;
    case 5:
      if (!a4)
        break;
      v14 = (void *)MEMORY[0x24BDD17C8];
      v15 = qword_2550F4DE8;
      v16 = CFSTR("kProgress_NetworkJoin");
      goto LABEL_13;
    case 7:
      if (!a4)
        break;
      v14 = (void *)MEMORY[0x24BDD17C8];
      v15 = qword_2550F4DE8;
      v16 = CFSTR("kProgress_WaitingForBase");
      goto LABEL_13;
    case 9:
      if (!a4)
        break;
      v14 = (void *)MEMORY[0x24BDD17C8];
      v15 = qword_2550F4DE8;
      v16 = CFSTR("kProgress_NetworkSearch");
LABEL_13:
      v17 = sub_21A690C10((uint64_t)v16, v15);
      valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v14, v18, v17, CFSTR("%@"), 0, a4);
      goto LABEL_21;
    case 11:
      v12 = qword_2550F4DE8;
      v13 = CFSTR("kProgress_WaitingForResources");
      goto LABEL_20;
    case 15:
      v12 = qword_2550F4DE8;
      v13 = CFSTR("kIntializingServicesString");
      goto LABEL_20;
    case 16:
      v12 = qword_2550F4DE8;
      v13 = CFSTR("kProgress_ExaminingRestoreProfile");
      goto LABEL_20;
    case 17:
      v12 = qword_2550F4DE8;
      v13 = CFSTR("kProgress_ExaminingOtherBaseStations");
      goto LABEL_20;
    case 18:
      v12 = qword_2550F4DE8;
      v13 = CFSTR("kProgress_ExaminingNewBaseStation");
      goto LABEL_20;
    case 19:
      v12 = qword_2550F4DE8;
      v13 = CFSTR("kCancelingServicesString");
LABEL_20:
      valid = sub_21A690C10((uint64_t)v13, v12);
LABEL_21:
      v11 = (const __CFString *)valid;
      break;
    default:
      break;
  }
  if (self->_delegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      MEMORY[0x24BEDD108](self->_delegate, sel_assistantUpdateProgress_forState_, v11);
  }
}

- (void)autoguessProgressComplete:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t Instrumentation;
  const char *v7;
  AutoGuessController *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  objc_msgSend_setGuessCompleteDict_(self, a2, (uint64_t)a3);
  Instrumentation = objc_msgSend_lastInstrumentation(self->_autoGuessController, v4, v5);
  objc_msgSend_setLastAutoguessInstrumentation_(self, v7, Instrumentation);
  v8 = self->_autoGuessController;
  objc_msgSend_setAutoGuessController_(self, v9, 0);
  if (objc_msgSend_restoreNetworkIfNeeded_disassociateIfNeeded_forceQuit_(self, v10, 1, 0, 0)
    && dword_2550EE930 <= 100
    && (dword_2550EE930 != -1 || sub_21A69876C((uint64_t)&dword_2550EE930, 0x64u)))
  {
    sub_21A698FDC((uint64_t)&dword_2550EE930, (uint64_t)"-[AssistantUIController autoguessProgressComplete:]", 100, (uint64_t)"Restoring network \n", v12, v13, v14, v15, v16);
  }
  objc_msgSend_handlePresentAutoGuessUIFromAutoGuessCompleteResult_(self, v11, 1);
}

- (void)setupProgressUpdated:(int)a3 status:(int)a4 paramDict:(id)a5 forController:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  const __CFString *valid;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const __CFString *v30;
  const char *v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;

  v9 = *(_QWORD *)&a3;
  if (dword_2550EE930 <= 100 && (dword_2550EE930 != -1 || sub_21A69876C((uint64_t)&dword_2550EE930, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE930, (uint64_t)"-[AssistantUIController setupProgressUpdated:status:paramDict:forController:]", 100, (uint64_t)"selector: %d status: %ld paramDict: %@\n", (uint64_t)a5, (uint64_t)a6, v6, v7, v9);
  v11 = objc_msgSend_objectForKey_(a5, a2, (uint64_t)CFSTR("BSAssistantProgressKey_StringParameter"));
  v16 = v11;
  switch((int)v9)
  {
    case 5:
      if (!v11)
        goto LABEL_42;
      v18 = (void *)MEMORY[0x24BDD17C8];
      v19 = qword_2550F4DE8;
      v20 = CFSTR("kProgress_NetworkJoin");
      goto LABEL_33;
    case 7:
      if (!v11)
        goto LABEL_42;
      v18 = (void *)MEMORY[0x24BDD17C8];
      v19 = qword_2550F4DE8;
      v20 = CFSTR("kProgress_WaitingForBase");
      goto LABEL_33;
    case 9:
      if (!v11)
        goto LABEL_42;
      v18 = (void *)MEMORY[0x24BDD17C8];
      v19 = qword_2550F4DE8;
      v20 = CFSTR("kProgress_NetworkSearch");
      goto LABEL_33;
    case 11:
      v21 = (void *)MEMORY[0x24BDD17C8];
      v22 = sub_21A690C10((uint64_t)CFSTR("kProgress_WaitingForResources"), qword_2550F4DE8);
      valid = (const __CFString *)objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v21, v23, v22, CFSTR("%@"), 0, v16);
      if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend_assistantWaitingForResourcesStart(self->_delegate, v25, v26);
      goto LABEL_43;
    case 12:
      if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend_assistantWaitingForResourcesComplete(self->_delegate, v27, v28);
      goto LABEL_42;
    case 14:
      v29 = qword_2550F4DE8;
      v30 = CFSTR("kProgress_Start");
      goto LABEL_38;
    case 15:
      if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v32 = (void *)objc_msgSend_objectForKey_(a5, v31, (uint64_t)CFSTR("BSAssistantProgressKey_DictionaryParameter"));
        v34 = objc_msgSend_objectForKey_(v32, v33, (uint64_t)CFSTR("kBSConfigurationSetupComplete_RemovedBase"));
        objc_msgSend_performSelector_withObject_(self->_delegate, v35, (uint64_t)sel_setRemovedBaseStation_, v34);
      }
      goto LABEL_42;
    case 18:
      if (!v11)
        goto LABEL_42;
      v18 = (void *)MEMORY[0x24BDD17C8];
      v19 = qword_2550F4DE8;
      v20 = CFSTR("kProgress_ReadSettings");
      goto LABEL_33;
    case 20:
      if (!v11)
        goto LABEL_42;
      v18 = (void *)MEMORY[0x24BDD17C8];
      v19 = qword_2550F4DE8;
      v20 = CFSTR("kProgress_WriteSettings");
      goto LABEL_33;
    case 21:
      if (!v11)
        goto LABEL_42;
      v18 = (void *)MEMORY[0x24BDD17C8];
      v19 = qword_2550F4DE8;
      v20 = CFSTR("kProgress_BaseReady");
LABEL_33:
      v36 = sub_21A690C10((uint64_t)v20, v19);
      v38 = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v18, v37, v36, CFSTR("%@"), 0, v16);
      goto LABEL_39;
    case 22:
      self->_state = 6;
      if (!v11)
        goto LABEL_42;
      v29 = qword_2550F4DE8;
      v30 = CFSTR("kProgress_VerifyConnection");
      goto LABEL_38;
    case 23:
    case 25:
      v17 = 5;
      goto LABEL_41;
    case 24:
      self->_state = 6;
      if (!v11)
        goto LABEL_42;
      v29 = qword_2550F4DE8;
      v30 = CFSTR("kProgress_PluginConnection");
LABEL_38:
      v38 = sub_21A690C10((uint64_t)v30, v29);
LABEL_39:
      valid = (const __CFString *)v38;
      goto LABEL_43;
    case 26:
      v17 = 8;
LABEL_41:
      self->_state = v17;
      goto LABEL_42;
    default:
      if (dword_2550EE930 <= 100 && (dword_2550EE930 != -1 || sub_21A69876C((uint64_t)&dword_2550EE930, 0x64u)))
        sub_21A698FDC((uint64_t)&dword_2550EE930, (uint64_t)"-[AssistantUIController setupProgressUpdated:status:paramDict:forController:]", 100, (uint64_t)"\n", v12, v13, v14, v15, v39);
LABEL_42:
      valid = &stru_24DD08368;
LABEL_43:
      if (self->_delegate)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          MEMORY[0x24BEDD108](self->_delegate, sel_assistantUpdateProgress_forState_, valid);
      }
      return;
  }
}

- (void)setupCompleteWithResult:(int)a3 baseStationInfo:(id)a4 forController:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t Instrumentation;
  const char *v11;
  AUSetupController *v12;
  const char *v13;
  const char *v14;
  const char *v15;

  self->_assistantResult = a3;
  if (a3 == -6723)
    v7 = 4294960527;
  else
    v7 = a3;
  if ((_DWORD)v7 != -6769)
  {
    if ((_DWORD)v7)
    {
      self->_state = 10;
    }
    else
    {
      self->_state = 9;
      objc_msgSend_setLastAssociatedInfo_(self, a2, 0, a4, a5);
    }
  }
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = objc_msgSend_setupPromptStringForBaseInfo_andResult_(self, a2, (uint64_t)a4, v7);
    objc_msgSend_presentUIForSetupResult_baseStationInfo_withPrompt_(self->_delegate, v9, v7, a4, v8);
  }
  Instrumentation = objc_msgSend_lastInstrumentation(self->_setupController, a2, *(uint64_t *)&a3);
  objc_msgSend_setLastSetupInstrumentation_(self, v11, Instrumentation);
  v12 = self->_setupController;
  objc_msgSend_setSetupController_(self, v13, 0);
  objc_msgSend_setStepByStepController_(self, v14, 0);
  if ((_DWORD)v7 == -6769)
    objc_msgSend_handlePresentAutoGuessUIFromAutoGuessCompleteResult_(self, v15, 0);
}

- (void)setupUIConfigConnectionStatusUpdated:(int)a3 status:(int)a4 paramDict:(id)a5 forController:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  const char *v11;
  uint64_t v12;

  v9 = *(_QWORD *)&a3;
  if (dword_2550EE930 <= 100 && (dword_2550EE930 != -1 || sub_21A69876C((uint64_t)&dword_2550EE930, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE930, (uint64_t)"-[AssistantUIController setupUIConfigConnectionStatusUpdated:status:paramDict:forController:]", 100, (uint64_t)" selector: %d status: %ld paramDict: %@\n", (uint64_t)a5, (uint64_t)a6, v6, v7, v9);
  if (a4)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend_showUIConfigPromptPreHook(self->_delegate, v11, v12);
    MEMORY[0x24BEDD108](self, sel_presentUIForConnectionVerification_status_paramDict_, v9);
  }
  else if (self->_state == 6)
  {
    self->_connectionStatusSelectorAwaitingResolution = 0;
    if (self->_delegate)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        MEMORY[0x24BEDD108](self->_delegate, sel_connectionVerificationSucceededForSelector_, v9);
    }
  }
}

- (void)setupUIConfigPrompt:(int)a3 paramDict:(id)a4 forController:(id)a5
{
  MEMORY[0x24BEDD108](self, sel_presentUIForUIConfigPrompt_paramDict_, *(_QWORD *)&a3);
}

- (void)stepByStepProgressUpdated:(int)a3 status:(int)a4 paramString:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  const __CFString *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t valid;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t v18;
  const char *v19;

  v9 = *(_QWORD *)&a3;
  if (dword_2550EE930 <= 100 && (dword_2550EE930 != -1 || sub_21A69876C((uint64_t)&dword_2550EE930, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE930, (uint64_t)"-[AssistantUIController stepByStepProgressUpdated:status:paramString:]", 100, (uint64_t)"selector: %d paramString: %@\n", (uint64_t)a5, v5, v6, v7, v9);
  v11 = &stru_24DD08368;
  switch((int)v9)
  {
    case 1:
      v12 = qword_2550F4DE8;
      v13 = CFSTR("kPerformingWiFiScanString");
      goto LABEL_8;
    case 3:
      v12 = qword_2550F4DE8;
      v13 = CFSTR("kProgress_Browsing");
LABEL_8:
      valid = sub_21A690C10((uint64_t)v13, v12);
      goto LABEL_16;
    case 5:
      if (!a5)
        goto LABEL_17;
      v15 = (void *)MEMORY[0x24BDD17C8];
      v16 = qword_2550F4DE8;
      v17 = CFSTR("kProgress_NetworkJoin");
      break;
    case 7:
      if (!a5)
        goto LABEL_17;
      v15 = (void *)MEMORY[0x24BDD17C8];
      v16 = qword_2550F4DE8;
      v17 = CFSTR("kProgress_WaitingForBase");
      break;
    case 9:
      if (!a5)
        goto LABEL_17;
      v15 = (void *)MEMORY[0x24BDD17C8];
      v16 = qword_2550F4DE8;
      v17 = CFSTR("kProgress_NetworkSearch");
      break;
    default:
      goto LABEL_17;
  }
  v18 = sub_21A690C10((uint64_t)v17, v16);
  valid = objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v15, v19, v18, CFSTR("%@"), 0, a5);
LABEL_16:
  v11 = (const __CFString *)valid;
LABEL_17:
  if (self->_delegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      MEMORY[0x24BEDD108](self->_delegate, sel_assistantUpdateProgress_forState_, v11);
  }
}

- (void)stepByStepCompleteWithResult:(int)a3 paramDict:(id)a4
{
  uint64_t v6;
  int v7;
  StepByStepController *v8;
  const char *v9;

  if (a3 == -6769)
    goto LABEL_8;
  v6 = *(_QWORD *)&a3;
  v7 = a3 == -6723 ? 10 : 4;
  self->_state = v7;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend_presentUIForStepByStepResult_(self->_delegate, a2, v6);
  if ((_DWORD)v6)
  {
LABEL_8:
    objc_msgSend_handlePresentAutoGuessUIFromAutoGuessCompleteResult_(self, a2, 0);
    v8 = self->_stepByStepController;
    objc_msgSend_setStepByStepController_(self, v9, 0);
  }
  else if (a4)
  {
    MEMORY[0x24BEDD108](self, sel_startSetupFromStepByStepResults_, a4);
  }
}

- (void)stepByStepNextStep:(int)a3 paramDict:(id)a4
{
  uint64_t v5;

  if (self->_delegate)
  {
    v5 = *(_QWORD *)&a3;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      MEMORY[0x24BEDD108](self->_delegate, sel_presentUIForStepByStepNextStep_paramDict_, v5);
  }
}

- (NSString)targetMACAddress
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setTargetMACAddress:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSDictionary)targetScanRecord
{
  return (NSDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setTargetScanRecord:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSDictionary)targetBrowseRecord
{
  return (NSDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setTargetBrowseRecord:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSArray)paramScanResults
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setParamScanResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (NSMutableDictionary)setupOptions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSetupOptions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int)state
{
  return self->_state;
}

- (int)assistantResult
{
  return self->_assistantResult;
}

- (AutoGuessController)autoGuessController
{
  return (AutoGuessController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAutoGuessController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (AUSetupController)setupController
{
  return (AUSetupController *)objc_getProperty(self, a2, 40, 1);
}

- (void)setSetupController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (StepByStepController)stepByStepController
{
  return (StepByStepController *)objc_getProperty(self, a2, 48, 1);
}

- (void)setStepByStepController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSDictionary)guessCompleteDict
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setGuessCompleteDict:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (int)connectionStatusSelectorAwaitingResolution
{
  return self->_connectionStatusSelectorAwaitingResolution;
}

- (NSDictionary)lastAssociatedInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setLastAssociatedInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSDictionary)lastAutoguessInstrumentation
{
  return (NSDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLastAutoguessInstrumentation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSDictionary)lastSetupInstrumentation
{
  return (NSDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLastSetupInstrumentation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSDictionary)lastStepByStepInstrumentation
{
  return (NSDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLastStepByStepInstrumentation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (int)startSetupFromStepByStepResults:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int result;
  id v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  AUSetupController *setupController;
  void *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  id v29;
  id v30;

  if (self->_setupController)
    return -6721;
  v29 = 0;
  v30 = 0;
  result = sub_21A6F92CC((const __CFString *)a3, (__CFArray **)&v30, (__CFArray **)&v29, v3, v4, v5, v6, v7);
  if (!result)
  {
    if (v30)
    {
      v10 = v30;
      v11 = v29;
      v14 = objc_msgSend_setupController(AUSetupController, v12, v13);
      objc_msgSend_setSetupController_(self, v15, v14);
      setupController = self->_setupController;
      if (setupController)
      {
        self->_state = 5;
        v19 = (void *)objc_msgSend_setupDelegates(setupController, v16, v17);
        objc_msgSend_addObject_(v19, v20, (uint64_t)self);
        objc_msgSend_setUiConfigDelegate_(self->_setupController, v21, (uint64_t)self);
        objc_msgSend_setUiDelegate_(self->_setupController, v22, (uint64_t)self->_delegate);
        v24 = objc_msgSend_dictionaryWithDictionary_(MEMORY[0x24BDBCED8], v23, (uint64_t)v29);
        objc_msgSend_setSetupOptions_(self, v25, v24);
        result = objc_msgSend_setupFromAutoguessRecommendation_withOptions_(self->_setupController, v26, (uint64_t)v30, v29);
        if (!result)
        {
          if (self->_delegate)
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend_presentUIForSetupStatusWithRecommendationDict_(self->_delegate, v27, (uint64_t)v30);
          }
          return objc_msgSend_updateSettingsAsync(self->_setupController, v27, v28);
        }
      }
      else
      {
        return -6728;
      }
    }
    else
    {
      return -6727;
    }
  }
  return result;
}

- (void)presentUIForConnectionVerification:(int)a3 status:(int)a4 paramDict:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)&a4;
  v9 = *(_QWORD *)&a3;
  if (dword_2550EE930 <= 100 && (dword_2550EE930 != -1 || sub_21A69876C((uint64_t)&dword_2550EE930, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE930, (uint64_t)"-[AssistantUIController(Private) presentUIForConnectionVerification:status:paramDict:]", 100, (uint64_t)" selector: %d status: %ld paramDict: %@\n", (uint64_t)a5, v5, v6, v7, v9);
  self->_connectionStatusSelectorAwaitingResolution = v9;
  switch((int)v9)
  {
    case 1:
      if ((objc_opt_respondsToSelector() & 1) != 0)
        MEMORY[0x24BEDD108](self->_delegate, sel_showTellUserToPlugInEthernetForStatus_paramDict_, v8);
      break;
    case 2:
      if (dword_2550EE930 <= 100 && (dword_2550EE930 != -1 || sub_21A69876C((uint64_t)&dword_2550EE930, 0x64u)))
        sub_21A698FDC((uint64_t)&dword_2550EE930, (uint64_t)"-[AssistantUIController(Private) presentUIForConnectionVerification:status:paramDict:]", 100, (uint64_t)"%s: eBSConfigurationUIConfigSelector_DHCPOrPPPoESeen\n", (uint64_t)a5, v5, v6, v7, (uint64_t)"-[AssistantUIController(Private) presentUIForConnectionVerification:status:paramDict:]");
      goto LABEL_12;
    case 3:
      if ((objc_opt_respondsToSelector() & 1) != 0)
        MEMORY[0x24BEDD108](self->_delegate, sel_showAskUserForPPPoECredentialsForStatus_paramDict_, v8);
      break;
    case 4:
LABEL_12:
      if ((objc_opt_respondsToSelector() & 1) != 0)
        MEMORY[0x24BEDD108](self->_delegate, sel_showTellUserToResetBroadbandDeviceForStatus_paramDict_, v8);
      break;
    case 5:
      if ((objc_opt_respondsToSelector() & 1) != 0)
        MEMORY[0x24BEDD108](self->_delegate, sel_showAskUserSwapCablingForStatus_paramDict_, v8);
      break;
    default:
      return;
  }
}

- (void)presentUIForUIConfigPrompt:(int)a3 paramDict:(id)a4
{
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;

  self->_state = 7;
  if (a3 == 8)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend_showUIConfigPromptPreHook(self->_delegate, v8, v9);
      MEMORY[0x24BEDD108](self->_delegate, sel_showUIConfigPromptForGuestNetConfigWithParamDict_, a4);
    }
  }
  else if (a3 == 7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend_showUIConfigPromptPreHook(self->_delegate, v6, v7);
    MEMORY[0x24BEDD108](self->_delegate, sel_showUIConfigPromptToSendDiagsUsageStatsWithParamDict_, a4);
  }
}

- (void)handlePresentAutoGuessUIFromAutoGuessCompleteResult:(BOOL)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  unint64_t v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;
  NSMutableDictionary *setupOptions;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  const char *v33;
  void *v34;
  const char *v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const __CFString *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  int isEnterprise;
  uint64_t NetworkPassword;
  void *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  void *v51;
  const char *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  char v56;

  v7 = a3;
  if (dword_2550EE930 <= 100 && (dword_2550EE930 != -1 || sub_21A69876C((uint64_t)&dword_2550EE930, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE930, (uint64_t)"-[AssistantUIController(Private) handlePresentAutoGuessUIFromAutoGuessCompleteResult:]", 100, (uint64_t)"\n", v3, v4, v5, v6, v55);
  v9 = 0x24BDBC000uLL;
  if (!self->_guessCompleteDict)
  {
    v21 = 0;
    v23 = 0;
    v22 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 4294960591;
    goto LABEL_38;
  }
  if (v7)
  {
    v10 = objc_msgSend_dictionary(MEMORY[0x24BDBCED8], a2, a3);
    objc_msgSend_setSetupOptions_(self, v11, v10);
  }
  if (!self->_setupOptions)
  {
    v21 = 0;
    v23 = 0;
    v22 = 0;
    v24 = 0;
    v25 = 0;
    v26 = 0;
    v27 = 4294960568;
    goto LABEL_38;
  }
  v12 = (void *)objc_msgSend_standardUserDefaults(MEMORY[0x24BDBCF50], a2, a3);
  if (objc_msgSend_BOOLForKey_(v12, v13, (uint64_t)CFSTR("skipConnectionTesting")))
  {
    setupOptions = self->_setupOptions;
    v16 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v14, 1);
    objc_msgSend_setObject_forKey_(setupOptions, v17, v16, CFSTR("kBSAutoGuessSetupOptionKey_SkipInternetTests"));
  }
  v18 = (void *)objc_msgSend_primaryRecommendationDictionaryFromCompletionDict_(AutoGuessController, v14, (uint64_t)self->_guessCompleteDict);
  v21 = (void *)objc_msgSend_objectForKey_(v18, v19, (uint64_t)CFSTR("BSAutoGuess_Recommendation"));
  if (v18)
    v22 = objc_msgSend_objectForKey_(v18, v20, (uint64_t)CFSTR("BSAutoGuess_Recommendation"));
  else
    v22 = 0;
  v28 = (void *)objc_msgSend_valueForKey_(v18, v20, (uint64_t)CFSTR("BSAutoGuess_UnconfiguredBase"));
  v30 = (void *)objc_msgSend_objectForKey_(v28, v29, (uint64_t)CFSTR("syFl"));
  if (v30)
    v26 = ((unint64_t)objc_msgSend_integerValue(v30, v31, v32) >> 10) & 1;
  else
    v26 = 0;
  v25 = objc_msgSend_restoreOfferFromCompletionDict_(AutoGuessController, v31, (uint64_t)self->_guessCompleteDict);
  v23 = objc_msgSend_recommendationStringFromCompletionDict_(AutoGuessController, v33, (uint64_t)self->_guessCompleteDict);
  if (!v23)
    goto LABEL_35;
  v34 = (void *)objc_msgSend_objectForKey_(self->_guessCompleteDict, a2, (uint64_t)CFSTR("fullGuessResults"));
  v36 = (void *)objc_msgSend_objectForKey_(v34, v35, (uint64_t)CFSTR("BSAutoGuessComplete_ErrorResult"));
  v39 = objc_msgSend_integerValue(v36, v37, v38);
  v27 = v39;
  if ((_DWORD)v39)
  {
    v24 = 0;
    self->_state = 10;
    self->_assistantResult = v39;
LABEL_37:
    v9 = 0x24BDBC000uLL;
    goto LABEL_38;
  }
  *(_QWORD *)&self->_state = 2;
  if (!v21)
  {
    v24 = 0;
    v27 = 4294960569;
    goto LABEL_37;
  }
  if (!objc_msgSend_isEqualToString_(v21, a2, (uint64_t)CFSTR("BSSetupRecommend_OfferCreate")))
  {
    if (objc_msgSend_isEqualToString_(v21, a2, (uint64_t)CFSTR("BSSetupRecommend_OfferJoinNetwork")))
    {
      v56 = 0;
      v42 = objc_msgSend_objectForKey_(v18, a2, (uint64_t)CFSTR("BSAutoGuess_SourceNetwork"));
      if (v42)
      {
        v43 = v42;
        isEnterprise = objc_msgSend_networkIsSecure_secMode_isEnterprise_(WiFiUtils, a2, v42, 0, &v56);
        v24 = 1;
        if (isEnterprise)
        {
          if (!v56)
          {
            NetworkPassword = objc_msgSend_getNetworkPassword_(WiFiUtils, a2, v43);
            v24 = 1;
            if (NetworkPassword)
            {
              if (v7)
              {
                objc_msgSend_setObject_forKey_(self->_setupOptions, a2, NetworkPassword, CFSTR("kBSAutoGuessSetupOptionKey_NetworkPassword"));
                v24 = 1;
              }
            }
          }
        }
        goto LABEL_36;
      }
    }
LABEL_35:
    v24 = 0;
LABEL_36:
    v27 = 0;
    goto LABEL_37;
  }
  v9 = 0x24BDBC000;
  if (v7)
  {
    v40 = sub_21A6915F8();
    objc_msgSend_setObject_forKey_(self->_setupOptions, v41, (uint64_t)v40, CFSTR("kBSAutoGuessSetupOptionKey_NetworkName"));
  }
  v27 = 0;
  v24 = 3;
LABEL_38:
  v46 = *(void **)(v9 + 3800);
  v47 = objc_msgSend_numberWithInteger_(MEMORY[0x24BDD16E0], a2, v24);
  v49 = objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v48, v26);
  v51 = (void *)objc_msgSend_dictionaryWithObjectsAndKeys_(v46, v50, v47, CFSTR("passwordUIFlags"), v49, CFSTR("pppoeDetected"), 0);
  v53 = v51;
  if (v23)
    objc_msgSend_setObject_forKey_(v51, v52, v23, CFSTR("promptString"));
  if (v25)
    objc_msgSend_setObject_forKey_(v53, v52, v25, CFSTR("restoreOffer"));
  if (v22)
    objc_msgSend_setObject_forKey_(v53, v52, v22, CFSTR("actionKey"));
  if (v21)
    objc_msgSend_setObject_forKey_(v53, v52, (uint64_t)v21, CFSTR("primaryRecommendation"));
  if (self->_delegate)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend_presentUIForRecommendationResult_paramDict_(self->_delegate, v54, v27, v53);
  }
}

- (id)setupPromptStringForBaseInfo:(id)a3 andResult:(int)a4
{
  void *v6;
  const char *v7;
  __CFString *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  int v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  int isEqualToString;
  const char *v33;
  int v34;
  const char *v35;
  const char *v36;
  void *v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  int v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  const __CFString *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  void *v51;
  void *v52;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  const char *v57;
  int v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  const __CFString *v71;
  const char *v72;
  uint64_t v73;

  if (!a3 || a4)
    return (id)sub_21A690C10((uint64_t)CFSTR("kSetup_SetupRecommendationErrorGeneric"), qword_2550F4DE8);
  v6 = (void *)objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("kSetupBaseStationInfoKey_RecommendationInfo"));
  v8 = (__CFString *)objc_msgSend_objectForKey_(v6, v7, (uint64_t)CFSTR("BSAutoGuess_Recommendation"));
  v10 = (void *)objc_msgSend_objectForKey_(a3, v9, (uint64_t)CFSTR("kSetupBaseStationInfoKey_GeneralInfo"));
  v11 = sub_21A690CA4(1937326416);
  v13 = (void *)objc_msgSend_objectForKey_(v10, v12, v11);
  v14 = sub_21A690CA4(1937329773);
  v16 = objc_msgSend_objectForKey_(v10, v15, v14);
  v18 = (void *)objc_msgSend_objectForKey_(v6, v17, (uint64_t)CFSTR("BSAutoGuess_SourceBase"));
  v20 = objc_msgSend_objectForKey_(v18, v19, (uint64_t)CFSTR("name"));
  v23 = (void *)objc_msgSend_setupOptions(self, v21, v22);
  v25 = (void *)objc_msgSend_objectForKey_(v23, v24, (uint64_t)CFSTR("kBSAutoGuessSetupOptionKey_ExtendOption_JoinApple"));
  v28 = objc_msgSend_BOOLValue(v25, v26, v27);
  v31 = objc_msgSend_objectForKey_(a3, v29, (uint64_t)CFSTR("kSetupBaseStationInfoKey_BrowseRecord"));
  if (v28)
  {
    v8 = CFSTR("BSSetupRecommend_OfferJoinNetwork");
    isEqualToString = objc_msgSend_isEqualToString_(CFSTR("BSSetupRecommend_OfferJoinNetwork"), v30, (uint64_t)CFSTR("BSSetupRecommend_OfferReplaceSourceIsUnconfigurable"));
  }
  else
  {
    isEqualToString = objc_msgSend_isEqualToString_(v8, v30, (uint64_t)CFSTR("BSSetupRecommend_OfferReplaceSourceIsUnconfigurable"));
  }
  v34 = isEqualToString;
  if ((objc_msgSend_isEqualToString_(v8, v33, (uint64_t)CFSTR("BSSetupRecommend_OfferCreate")) & 1) != 0 || v34)
  {
    v54 = objc_msgSend_valueForKey_(self->_setupOptions, v35, (uint64_t)CFSTR("kBSAutoGuessSetupOptionKey_NetworkName"));
    v56 = objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v55, (uint64_t)CFSTR("%@.Complete"), v8);
    v51 = (void *)sub_21A690C10(v56, qword_2550F4DE8);
    if (v54)
      return (id)objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(MEMORY[0x24BDD17C8], v57, (uint64_t)v51, CFSTR("%@"), 0, v54);
  }
  else if ((objc_msgSend_isEqualToString_(v8, v35, (uint64_t)CFSTR("BSSetupRecommend_OfferJoinNetwork")) & 1) != 0
         || objc_msgSend_isEqualToString_(v8, v36, (uint64_t)CFSTR("BSSetupRecommend_AskUserChooseNetworkToJoin")))
  {
    v37 = (void *)objc_msgSend_objectForKey_(a3, v36, (uint64_t)CFSTR("kSetupBaseStationInfoKey_RadioInfo"));
    v38 = sub_21A690CA4(1918979693);
    v16 = objc_msgSend_objectForKey_(v37, v39, v38);
    v41 = objc_msgSend_objectForKey_(a3, v40, (uint64_t)CFSTR("kSetupBaseStationInfoKey_BrowseRecord"));
    v42 = sub_21A68E2C8(v41);
    v43 = (void *)MEMORY[0x24BDD17C8];
    v46 = objc_msgSend_integerValue(v13, v44, v45);
    v47 = sub_21A690D10(v46, v42);
    v49 = objc_msgSend_stringWithFormat_(v43, v48, (uint64_t)CFSTR("%@.Complete%@"), v8, v47);
    v51 = (void *)sub_21A690C10(v49, qword_2550F4DE8);
    if (v16)
    {
      v52 = (void *)MEMORY[0x24BDD17C8];
      return (id)objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v52, v50, (uint64_t)v51, CFSTR("%@"), 0, v16);
    }
  }
  else
  {
    v58 = objc_msgSend_isEqualToString_(v8, v36, (uint64_t)CFSTR("BSSetupRecommend_OfferRestore"));
    v59 = (void *)MEMORY[0x24BDD17C8];
    v62 = objc_msgSend_integerValue(v13, v60, v61);
    v70 = sub_21A68E344(v31, v63, v64, v65, v66, v67, v68, v69);
    v71 = sub_21A690D10(v62, v70);
    v73 = objc_msgSend_stringWithFormat_(v59, v72, (uint64_t)CFSTR("%@.Complete%@"), v8, v71);
    v51 = (void *)sub_21A690C10(v73, qword_2550F4DE8);
    if (!v58 && v20)
      return (id)objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(MEMORY[0x24BDD17C8], v50, (uint64_t)v51, CFSTR("%@"), 0, v20);
    if (v16)
    {
      v52 = (void *)MEMORY[0x24BDD17C8];
      return (id)objc_msgSend_stringWithValidatedFormat_validFormatSpecifiers_error_(v52, v50, (uint64_t)v51, CFSTR("%@"), 0, v16);
    }
  }
  return v51;
}

- (BOOL)restoreNetworkIfNeeded:(BOOL)a3 disassociateIfNeeded:(BOOL)a4 forceQuit:(BOOL)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  _BOOL4 v9;
  void *v11;
  const char *v12;
  uint64_t v13;
  int v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  int isCurrentlyAssociatedToAnInfrastructureNetwork;
  NSDictionary *lastAssociatedInfo;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *CurrentAssociationInfo;
  const char *v28;
  const __CFString *v29;
  char isEqualToString;

  v8 = a5;
  v9 = a4;
  if (dword_2550EE930 <= 100 && (dword_2550EE930 != -1 || sub_21A69876C((uint64_t)&dword_2550EE930, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE930, (uint64_t)"-[AssistantUIController(Private) restoreNetworkIfNeeded:disassociateIfNeeded:forceQuit:]", 100, (uint64_t)"_lastAssociatedInfo: %@\n", a5, v5, v6, v7, (uint64_t)self->_lastAssociatedInfo);
  v11 = (void *)objc_msgSend_sharedInstance(WiFiUtils, a2, a3);
  v14 = objc_msgSend_airPortIsOn(v11, v12, v13);
  if (v14)
  {
    isCurrentlyAssociatedToAnInfrastructureNetwork = objc_msgSend_isCurrentlyAssociatedToAnInfrastructureNetwork_(v11, v15, 0);
    lastAssociatedInfo = self->_lastAssociatedInfo;
    if (lastAssociatedInfo)
    {
      v26 = (void *)objc_msgSend_objectForKey_(lastAssociatedInfo, v16, (uint64_t)CFSTR("SSID_STR"));
      if (isCurrentlyAssociatedToAnInfrastructureNetwork)
      {
        CurrentAssociationInfo = (void *)objc_msgSend_getCurrentAssociationInfo(v11, v20, v21);
        v29 = (const __CFString *)objc_msgSend_objectForKey_(CurrentAssociationInfo, v28, (uint64_t)CFSTR("SSID_STR"));
      }
      else
      {
        v29 = &stru_24DD08368;
      }
      if (dword_2550EE930 <= 100 && (dword_2550EE930 != -1 || sub_21A69876C((uint64_t)&dword_2550EE930, 0x64u)))
        sub_21A698FDC((uint64_t)&dword_2550EE930, (uint64_t)"-[AssistantUIController(Private) restoreNetworkIfNeeded:disassociateIfNeeded:forceQuit:]", 100, (uint64_t)"curName: %@ oldName: %@\n", v22, v23, v24, v25, (uint64_t)v29);
      isEqualToString = objc_msgSend_isEqualToString_(v26, v20, (uint64_t)v29);
      if ((isEqualToString & 1) == 0 && !v8)
      {
        LOBYTE(v14) = objc_msgSend_startRestoreNetwork_(self, v16, (uint64_t)v26) == 0;
        return v14;
      }
      if ((isEqualToString & 1) != 0)
        goto LABEL_11;
    }
    else if (((v9 || v8) & isCurrentlyAssociatedToAnInfrastructureNetwork & 1) == 0)
    {
LABEL_11:
      LOBYTE(v14) = 0;
      return v14;
    }
    objc_msgSend_disassociateSync(v11, v16, v17);
    goto LABEL_11;
  }
  return v14;
}

- (int)startRestoreNetwork:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int isEnterprise;
  const char *v19;
  uint64_t NetworkPassword;
  int result;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  char v27;

  if (dword_2550EE930 <= 100 && (dword_2550EE930 != -1 || sub_21A69876C((uint64_t)&dword_2550EE930, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE930, (uint64_t)"-[AssistantUIController(Private) startRestoreNetwork:]", 100, (uint64_t)"\n", v3, v4, v5, v6, v26);
  if (!a3)
    return -6705;
  v9 = (void *)objc_msgSend_sharedInstance(WiFiUtils, a2, (uint64_t)a3);
  v11 = objc_msgSend_objectForKey_(self->_lastAssociatedInfo, v10, (uint64_t)CFSTR("BSSID"));
  if (v11 && (v17 = objc_msgSend_scanInfoForMACAddress_(v9, v12, v11)) != 0
    || (v17 = objc_msgSend_scanInfoForName_wifiType_(v9, v12, (uint64_t)a3, 3)) != 0)
  {
    v27 = 0;
    if (dword_2550EE930 <= 100 && (dword_2550EE930 != -1 || sub_21A69876C((uint64_t)&dword_2550EE930, 0x64u)))
      sub_21A698FDC((uint64_t)&dword_2550EE930, (uint64_t)"-[AssistantUIController(Private) startRestoreNetwork:]", 100, (uint64_t)" restoring with scan info \n", v13, v14, v15, v16, v26);
    isEnterprise = objc_msgSend_networkIsSecure_secMode_isEnterprise_(WiFiUtils, v12, v17, 0, &v27);
    NetworkPassword = 0;
    if (!isEnterprise
      || v27
      || (NetworkPassword = objc_msgSend_getNetworkPassword_(WiFiUtils, v19, v17, 0)) != 0)
    {
      result = objc_msgSend_joinNetworkWithScanInfoAsync_password_rememberChoice_(v9, v19, v17, NetworkPassword, 1);
      if (result)
        return result;
      goto LABEL_24;
    }
    return -16;
  }
  else
  {
    if (dword_2550EE930 <= 100 && (dword_2550EE930 != -1 || sub_21A69876C((uint64_t)&dword_2550EE930, 0x64u)))
      sub_21A698FDC((uint64_t)&dword_2550EE930, (uint64_t)"-[AssistantUIController(Private) startRestoreNetwork:]", 100, (uint64_t)" restoring with name only \n", v13, v14, v15, v16, v26);
    result = objc_msgSend_joinNetworkWithNameAsync_password_rememberChoice_(v9, v12, (uint64_t)a3, 0, 1);
    if (!result)
    {
LABEL_24:
      v24 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], v22, v23);
      objc_msgSend_addObserver_selector_name_object_(v24, v25, (uint64_t)self, sel_restoreNetworkDone_, CFSTR("com.apple.WiFiUtils.Join.Complete"), 0);
      return 0;
    }
  }
  return result;
}

- (void)restoreNetworkDone:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  id delegate;
  uint64_t v21;
  uint64_t v22;

  if (dword_2550EE930 <= 100 && (dword_2550EE930 != -1 || sub_21A69876C((uint64_t)&dword_2550EE930, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EE930, (uint64_t)"-[AssistantUIController(Private) restoreNetworkDone:]", 100, (uint64_t)"\n", v3, v4, v5, v6, v22);
  v9 = (void *)objc_msgSend_defaultCenter(MEMORY[0x24BDD16D0], a2, (uint64_t)a3);
  objc_msgSend_removeObserver_name_object_(v9, v10, (uint64_t)self, CFSTR("com.apple.WiFiUtils.Join.Complete"), 0);
  v13 = (void *)objc_msgSend_userInfo(a3, v11, v12);
  v15 = (void *)objc_msgSend_objectForKey_(v13, v14, (uint64_t)CFSTR("WiFiUtils_OSStatus"));
  if (v15)
    objc_msgSend_integerValue(v15, v16, v17);
  if (self->_state == 11 && self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    delegate = self->_delegate;
    v21 = objc_msgSend_assistantResult(self, v18, v19);
    MEMORY[0x24BEDD108](delegate, sel_doneWithAssistantResult_, v21);
  }
}

@end
