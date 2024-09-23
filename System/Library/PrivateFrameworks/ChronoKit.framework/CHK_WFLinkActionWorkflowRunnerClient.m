@implementation CHK_WFLinkActionWorkflowRunnerClient

+ (id)newClientWithLinkAction:(id)a3 appBundleIdentifier:(id)a4 extensionBundleIdentifier:(id)a5 runSource:(int64_t)a6 launchOriginOverride:(id)a7 authenticationPolicy:(int64_t)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  objc_class *v18;
  void *v19;
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v17 = (void *)getWFLinkActionWorkflowRunnerClientClass_softClass;
  v25 = getWFLinkActionWorkflowRunnerClientClass_softClass;
  if (!getWFLinkActionWorkflowRunnerClientClass_softClass)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __getWFLinkActionWorkflowRunnerClientClass_block_invoke;
    v21[3] = &unk_1E93D7120;
    v21[4] = &v22;
    __getWFLinkActionWorkflowRunnerClientClass_block_invoke((uint64_t)v21);
    v17 = (void *)v23[3];
  }
  v18 = objc_retainAutorelease(v17);
  _Block_object_dispose(&v22, 8);
  v19 = (void *)objc_msgSend([v18 alloc], "initWithLinkAction:appBundleIdentifier:extensionBundleIdentifier:runSource:runSourceOverride:authenticationPolicy:", v13, v14, v15, a6, v16, a8);

  return v19;
}

@end
