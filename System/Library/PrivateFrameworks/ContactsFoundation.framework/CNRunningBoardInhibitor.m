@implementation CNRunningBoardInhibitor

void __34___CNRunningBoardInhibitor_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "running-board-inhibitor");
  v1 = (void *)os_log_cn_once_object_1_16;
  os_log_cn_once_object_1_16 = (uint64_t)v0;

}

void __33___CNRunningBoardInhibitor_start__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v0 = (void *)getRBSDomainAttributeClass_softClass;
  v17 = getRBSDomainAttributeClass_softClass;
  if (!getRBSDomainAttributeClass_softClass)
  {
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __getRBSDomainAttributeClass_block_invoke;
    v12 = &unk_1E29B95A8;
    v13 = &v14;
    __getRBSDomainAttributeClass_block_invoke((uint64_t)&v9);
    v0 = (void *)v15[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v14, 8);
  objc_msgSend(v1, "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("FinishTaskUninterruptable"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v2;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v3 = (void *)getRBSAcquisitionCompletionAttributeClass_softClass;
  v17 = getRBSAcquisitionCompletionAttributeClass_softClass;
  if (!getRBSAcquisitionCompletionAttributeClass_softClass)
  {
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __getRBSAcquisitionCompletionAttributeClass_block_invoke;
    v12 = &unk_1E29B95A8;
    v13 = &v14;
    __getRBSAcquisitionCompletionAttributeClass_block_invoke((uint64_t)&v9);
    v3 = (void *)v15[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v14, 8);
  objc_msgSend(v4, "attributeWithCompletionPolicy:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copy");
  v8 = (void *)start_cn_once_object_3;
  start_cn_once_object_3 = v7;

}

void __46___CNRunningBoardInhibitor_runningBoardTarget__block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v0 = (void *)getRBSTargetClass_softClass;
  v8 = getRBSTargetClass_softClass;
  if (!getRBSTargetClass_softClass)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __getRBSTargetClass_block_invoke;
    v4[3] = &unk_1E29B95A8;
    v4[4] = &v5;
    __getRBSTargetClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v5, 8);
  objc_msgSend(v1, "currentProcess");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)runningBoardTarget_cn_once_object_5;
  runningBoardTarget_cn_once_object_5 = v2;

}

@end
