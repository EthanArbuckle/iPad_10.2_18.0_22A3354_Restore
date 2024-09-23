@implementation SWCollaborationMetadata(NSItemProvider)

- (id)processSigningQueue
{
  if (processSigningQueue_onceToken != -1)
    dispatch_once(&processSigningQueue_onceToken, &__block_literal_global_1);
  return (id)processSigningQueue_internalQueue;
}

+ (id)readableTypeIdentifiersForItemProvider
{
  uint64_t v0;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CD74A8];
  v2[0] = CFSTR("com.apple.SharedWithYou.SWCollaborationMetadata");
  v2[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)objectWithItemProviderData:()NSItemProvider typeIdentifier:error:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.SharedWithYou.SWCollaborationMetadata")))
  {
    v9 = (void *)MEMORY[0x1E0CB3710];
    v10 = (void *)MEMORY[0x1E0C99E60];
    v18[0] = objc_opt_class();
    v18[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v9, "unarchivedObjectOfClasses:fromData:error:", v12, v7, &v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v17;

    if (!a5)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0CD74A8]))
  {
    objc_msgSend(MEMORY[0x1E0CD7428], "objectWithItemProviderData:typeIdentifier:error:", v7, v8, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "collaborationMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    if (!a5)
      goto LABEL_9;
    goto LABEL_8;
  }
  v14 = 0;
  v13 = 0;
  if (a5)
LABEL_8:
    *a5 = objc_retainAutorelease(v14);
LABEL_9:

  return v13;
}

- (id)softSigningController
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  if (getSLCollaborationSigningControllerClass()
    && objc_msgSend(getSLCollaborationSigningControllerClass(), "instancesRespondToSelector:", sel_initWithTargetSerialQueue_synchronous_))
  {
    v2 = objc_alloc((Class)getSLCollaborationSigningControllerClass());
    objc_msgSend(a1, "processSigningQueue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v2, "initWithTargetSerialQueue:synchronous:", v3, 1);

    if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)writableTypeIdentifiersForItemProvider
{
  uint64_t v0;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CD74A8];
  v2[0] = CFSTR("com.apple.SharedWithYou.SWCollaborationMetadata");
  v2[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)writableTypeIdentifiersForItemProvider
{
  uint64_t v0;
  _QWORD v2[3];

  v2[2] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CD74A8];
  v2[0] = CFSTR("com.apple.SharedWithYou.SWCollaborationMetadata");
  v2[1] = v0;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)loadDataWithTypeIdentifier:()NSItemProvider forItemProviderCompletionHandler:
{
  id v6;
  id v7;
  id v8;
  id v9;
  void (**v10)(void *, void *, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  _QWORD aBlock[5];
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__SWCollaborationMetadata_NSItemProvider__loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
  aBlock[3] = &unk_1E2873E78;
  aBlock[4] = a1;
  v16 = v6;
  v17 = v7;
  v8 = v7;
  v9 = v6;
  v10 = (void (**)(void *, void *, _QWORD))_Block_copy(aBlock);
  objc_msgSend(a1, "sourceProcessData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 || (objc_msgSend(a1, "softSigningController"), (v13 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(a1, "sourceProcessData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v12, 0);
  }
  else
  {
    v12 = v13;
    objc_msgSend(v13, "signSourceProcessWithMetadata:timeout:completion:", a1, v10, 5.0);
  }

  return 0;
}

@end
