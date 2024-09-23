@implementation WFRecordingStatusManager

- (void)setRecording:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 v5;

  v3 = a3;
  v5 = -[WFRecordingStatusManager isRecording](self, "isRecording");
  if (!v5 || v3)
  {
    if (!v5 && v3)
      -[WFRecordingStatusManager acquireAssertion](self, "acquireAssertion");
  }
  else
  {
    -[WFRecordingStatusManager invalidateAssertion](self, "invalidateAssertion");
  }
}

- (BOOL)isRecording
{
  return self->_assertion != 0;
}

- (void)acquireAssertion
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  SBSStatusBarStyleOverridesAssertion *v6;
  SBSStatusBarStyleOverridesAssertion *assertion;
  SBSStatusBarStyleOverridesAssertion *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v3 = (void *)getSBSStatusBarStyleOverridesAssertionClass_softClass;
  v15 = getSBSStatusBarStyleOverridesAssertionClass_softClass;
  v4 = MEMORY[0x24BDAC760];
  if (!getSBSStatusBarStyleOverridesAssertionClass_softClass)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __getSBSStatusBarStyleOverridesAssertionClass_block_invoke;
    v11[3] = &unk_24F8BB430;
    v11[4] = &v12;
    __getSBSStatusBarStyleOverridesAssertionClass_block_invoke((uint64_t)v11);
    v3 = (void *)v13[3];
  }
  v5 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v12, 8);
  v6 = (SBSStatusBarStyleOverridesAssertion *)objc_msgSend([v5 alloc], "initWithStatusBarStyleOverrides:forPID:exclusive:showsWhenForeground:", 4, getpid(), 1, 0);
  assertion = self->_assertion;
  self->_assertion = v6;

  v8 = self->_assertion;
  v9[4] = self;
  v10[0] = v4;
  v10[1] = 3221225472;
  v10[2] = __44__WFRecordingStatusManager_acquireAssertion__block_invoke;
  v10[3] = &unk_24F8B2338;
  v10[4] = self;
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __44__WFRecordingStatusManager_acquireAssertion__block_invoke_2;
  v9[3] = &unk_24F8BB638;
  -[SBSStatusBarStyleOverridesAssertion acquireWithHandler:invalidationHandler:](v8, "acquireWithHandler:invalidationHandler:", v10, v9);
}

- (void)invalidateAssertion
{
  SBSStatusBarStyleOverridesAssertion *assertion;
  SBSStatusBarStyleOverridesAssertion *v4;

  assertion = self->_assertion;
  if (assertion)
  {
    -[SBSStatusBarStyleOverridesAssertion invalidate](assertion, "invalidate");
    v4 = self->_assertion;
    self->_assertion = 0;

  }
}

- (SBSStatusBarStyleOverridesAssertion)assertion
{
  return self->_assertion;
}

- (void)setAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_assertion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
}

uint64_t __44__WFRecordingStatusManager_acquireAssertion__block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "invalidateAssertion");
  return result;
}

uint64_t __44__WFRecordingStatusManager_acquireAssertion__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidateAssertion");
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_1226);
  return (id)sharedManager_sharedManager;
}

void __41__WFRecordingStatusManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = v0;

}

@end
