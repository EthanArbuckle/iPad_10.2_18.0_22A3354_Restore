@implementation StepByStepController

- (StepByStepController)init
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  StepByStepController *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)StepByStepController;
  v2 = -[AssistantCallbackController init](&v27, sel_init);
  v10 = (StepByStepController *)v2;
  if (v2)
  {
    v11 = (uint64_t *)(v2 + 32);
    sub_21A6F5974((uint64_t *)v2 + 4, v3, v4, v5, v6, v7, v8, v9);
    sub_21A6F8888(*v11, (uint64_t)sub_21A6ABB48, (uint64_t)v10, v12, v13, v14, v15, v16);
    v17 = *v11;
    v20 = objc_msgSend_assistantCallback(v10, v18, v19);
    sub_21A6F8924(v17, v20, (uint64_t)v10, v21, v22, v23, v24, v25);
  }
  return v10;
}

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  objc_msgSend_setRestoreRecommendation_(self, a2, 0);
  sub_21A6F5AC0((uint64_t)self->_stepByStepContext, v3, v4, v5, v6, v7, v8, v9);
  v10.receiver = self;
  v10.super_class = (Class)StepByStepController;
  -[AssistantCallbackController dealloc](&v10, sel_dealloc);
}

- (int)subclassAssistantCallback:(AssistantCallbackContext *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  const char *v17;
  uint64_t v18;
  void *v19;

  v18 = 0;
  v19 = 0;
  if (!a3)
    goto LABEL_16;
  sub_21A70B0B0((uint64_t)a3, (uint64_t)CFSTR("kBSAssistantCallbackKey_SBS_SBSStep"), &v19, v3, v4, v5, v6, v7);
  v12 = v11;
  if (v11)
    goto LABEL_17;
  if (!v19)
  {
LABEL_19:
    v12 = -6728;
    goto LABEL_17;
  }
  v13 = objc_msgSend_integerValue(v19, v10, (uint64_t)a3);
  v14 = v13;
  if ((_DWORD)v13 != 117)
  {
    if ((v13 - 1) <= 0xF)
    {
      sub_21A70B0B0((uint64_t)a3, (uint64_t)CFSTR("kBSAssistantCallbackKey_SBS_SBSParamDict"), &v18, v3, v4, v5, v6, v7);
      v12 = v15;
      if (!v15)
      {
        if (v18)
        {
          if (dword_2550EEF08 <= 100 && (dword_2550EEF08 != -1 || sub_21A69876C((uint64_t)&dword_2550EEF08, 0x64u)))
            sub_21A698FDC((uint64_t)&dword_2550EEF08, (uint64_t)"-[StepByStepController subclassAssistantCallback:]", 100, (uint64_t)"step: %d paramDict: %@\n", v4, v5, v6, v7, v14);
          if (self->super._callbackContext)
          {
            v12 = -6721;
          }
          else
          {
            if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
            {
              self->super._callbackContext = a3;
              objc_msgSend_stepByStepNextStep_paramDict_(self->_delegate, v17, v14, v18);
              return 0;
            }
            v12 = -6718;
          }
          goto LABEL_17;
        }
        goto LABEL_19;
      }
LABEL_17:
      sub_21A70B2E0(a3, v12, (uint64_t)a3, v3, v4, v5, v6, v7);
      return v12;
    }
LABEL_16:
    v12 = -6705;
    goto LABEL_17;
  }
  if (!self->super._callbackContext)
  {
    v12 = -6709;
    goto LABEL_17;
  }
  v12 = 0;
  self->super._callbackContext = 0;
  return v12;
}

+ (id)stepByStepController
{
  return objc_alloc_init(StepByStepController);
}

- (int)cancelStepByStep
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  StepByStepContext *stepByStepContext;
  int result;
  int v11;

  stepByStepContext = self->_stepByStepContext;
  if (!stepByStepContext)
    return -6705;
  result = sub_21A6F5BE8((uint64_t)stepByStepContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  if (result == -6771)
    v11 = 0;
  else
    v11 = result;
  if (v11 == -6720)
    return -6720;
  if (!v11)
  {
    result = 0;
    self->super._callbackContext = 0;
  }
  return result;
}

- (int)resume
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  StepByStepContext *stepByStepContext;

  stepByStepContext = self->_stepByStepContext;
  if (stepByStepContext)
    return sub_21A6F5C68(stepByStepContext, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  else
    return -6705;
}

- (void)stepByStepNextStepResult:(int)a3 withOptions:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AssistantCallbackContext *callbackContext;
  int v11;
  AssistantCallbackContext *v12;

  callbackContext = self->super._callbackContext;
  if (callbackContext)
  {
    if (!a4
      || (v11 = sub_21A70B204((uint64_t)callbackContext, (uint64_t)CFSTR("kBSAssistantCallbackKey_SBS_SBSOptionsDict"), (uint64_t)a4, (uint64_t)a4, v4, v5, v6, v7)) == 0)
    {
      v11 = a3;
    }
    v12 = self->super._callbackContext;
    if (v12)
      sub_21A70B2E0(v12, v11, *(uint64_t *)&a3, (uint64_t)a4, v4, v5, v6, v7);
  }
  self->super._callbackContext = 0;
}

- (int)setupFromAutoguessRecommendation:(id)a3 withOptions:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  const char *v11;
  const __CFString *v12;
  uint64_t v13;
  const char *v14;
  const void *v15;
  const void *v16;
  int result;
  uint64_t v18;
  NSDictionary *restoreRecommendation;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  if (dword_2550EEF08 <= 100 && (dword_2550EEF08 != -1 || sub_21A69876C((uint64_t)&dword_2550EEF08, 0x64u)))
    sub_21A698FDC((uint64_t)&dword_2550EEF08, (uint64_t)"-[StepByStepController setupFromAutoguessRecommendation:withOptions:]", 100, (uint64_t)"\n", v4, v5, v6, v7, v36);
  if (!self->_stepByStepContext)
    return -6718;
  if (!a3)
    return -6705;
  v10 = objc_msgSend_objectForKey_(a3, a2, (uint64_t)CFSTR("BSAutoGuess_UnconfiguredBase"));
  if (!v10)
    return -6727;
  v12 = (const __CFString *)v10;
  v13 = objc_msgSend_objectForKey_(a3, v11, (uint64_t)CFSTR("BSAutoGuess_UnconfiguredBaseSettings"));
  if (!v13)
    return -6727;
  v15 = (const void *)v13;
  v16 = (const void *)objc_msgSend_objectForKey_(a3, v14, (uint64_t)CFSTR("BSAutoGuess_Recommendation"));
  if (!v16)
    return -6727;
  result = sub_21A6F89C0((uint64_t)self->_stepByStepContext, v16);
  if (!result)
  {
    restoreRecommendation = self->_restoreRecommendation;
    if (!restoreRecommendation
      || (result = sub_21A6F8A10((uint64_t)self->_stepByStepContext, restoreRecommendation)) == 0)
    {
      v20 = (void *)objc_msgSend_sharedInstance(WiFiUtils, (const char *)restoreRecommendation, v18);
      v23 = objc_msgSend_mergedScanInfoArray(v20, v21, v22);
      if (!v23 || (result = sub_21A6F8A60((uint64_t)self->_stepByStepContext, v23, 1)) == 0)
      {
        result = sub_21A6F8C60(self->_stepByStepContext, v12, v15, v24, v25, v26, v27, v28);
        if (!result)
          return sub_21A6F8E28(self->_stepByStepContext, v29, v30, v31, v32, v33, v34, v35);
      }
    }
  }
  return result;
}

- (StepByStepUIDelegate)delegate
{
  return (StepByStepUIDelegate *)self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (NSDictionary)restoreRecommendation
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRestoreRecommendation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

@end
