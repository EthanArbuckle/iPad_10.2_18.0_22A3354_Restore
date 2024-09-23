@implementation PHEditingExtensionContext

- (void)dealloc
{
  objc_super v3;

  -[PHEditingExtensionContext _releaseSandboxExtensions](self, "_releaseSandboxExtensions");
  v3.receiver = self;
  v3.super_class = (Class)PHEditingExtensionContext;
  -[PHEditingExtensionContext dealloc](&v3, sel_dealloc);
}

- (id)_contentEditingController
{
  void *v4;
  void *v6;
  objc_class *v7;
  void *v8;

  -[PHEditingExtensionContext _principalObject](self, "_principalObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "conformsToProtocol:", &unk_2549D2C50) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHEditingExtensionContext.m"), 68, CFSTR("%@ not conforming to PHContentEditingController"), v8);

  }
  return v4;
}

- (void)_releaseSandboxExtensions
{
  NSNumber *fullSizeImageSandboxExtensionHandleWrapper;
  NSNumber *v4;
  NSNumber *videoPathSandboxExtensionHandleWrapper;
  NSNumber *v6;

  fullSizeImageSandboxExtensionHandleWrapper = self->_fullSizeImageSandboxExtensionHandleWrapper;
  if (fullSizeImageSandboxExtensionHandleWrapper)
  {
    -[NSNumber longLongValue](fullSizeImageSandboxExtensionHandleWrapper, "longLongValue");
    sandbox_extension_release();
    v4 = self->_fullSizeImageSandboxExtensionHandleWrapper;
    self->_fullSizeImageSandboxExtensionHandleWrapper = 0;

  }
  videoPathSandboxExtensionHandleWrapper = self->_videoPathSandboxExtensionHandleWrapper;
  if (videoPathSandboxExtensionHandleWrapper)
  {
    -[NSNumber longLongValue](videoPathSandboxExtensionHandleWrapper, "longLongValue");
    sandbox_extension_release();
    v6 = self->_videoPathSandboxExtensionHandleWrapper;
    self->_videoPathSandboxExtensionHandleWrapper = 0;

  }
}

- (void)queryHandlingCapabilityForAdjustmentData:(id)a3 withResponseHandler:(id)a4
{
  void (**v7)(id, uint64_t);
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHEditingExtensionContext.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("responseHandler"));

  }
  -[PHEditingExtensionContext _contentEditingController](self, "_contentEditingController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "canHandleAdjustmentData:", v11);

  v7[2](v7, v9);
}

- (void)queryShouldShowCancelConfirmationWithResponseHandler:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD *v14;
  _QWORD block[5];
  NSObject *v16;
  _QWORD *v17;
  _QWORD v18[3];
  char v19;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHEditingExtensionContext.m"), 93, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("responseHandler"));

  }
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v7 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__PHEditingExtensionContext_queryShouldShowCancelConfirmationWithResponseHandler___block_invoke;
  block[3] = &unk_24C62C580;
  v16 = v6;
  v17 = v18;
  block[4] = self;
  v8 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __82__PHEditingExtensionContext_queryShouldShowCancelConfirmationWithResponseHandler___block_invoke_2;
  v12[3] = &unk_24C62C5A8;
  v13 = v5;
  v14 = v18;
  v10 = v5;
  dispatch_group_notify(v8, v9, v12);

  _Block_object_dispose(v18, 8);
}

- (void)setupUndoProxyWithXPCListenerEndpoint:(id)a3 attemptUndoManagerAutoSetup:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  PUEditingExtensionUndoAdapter *v7;
  void *v8;
  PUEditingExtensionUndoProxyExtensionSide *v9;

  v4 = a4;
  v6 = a3;
  v9 = -[PUEditingExtensionUndoProxyExtensionSide initWithEndpoint:]([PUEditingExtensionUndoProxyExtensionSide alloc], "initWithEndpoint:", v6);

  v7 = -[PUEditingExtensionUndoAdapter initWithButtonHost:]([PUEditingExtensionUndoAdapter alloc], "initWithButtonHost:", v9);
  -[PUEditingExtensionUndoProxyExtensionSide setTarget:](v9, "setTarget:", v7);
  -[PHEditingExtensionContext undoManagerForBarButtons](self, "undoManagerForBarButtons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUEditingExtensionUndoAdapter setUndoManager:](v7, "setUndoManager:", v8);

  -[PHEditingExtensionContext setUndoAdapter:](self, "setUndoAdapter:", v7);
  -[PHEditingExtensionContext setAttemptUndoManagerAutoSetup:](self, "setAttemptUndoManagerAutoSetup:", v4);

}

- (void)beginContentEditingWithCompletionHandler:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD v22[4];
  NSObject *v23;
  PHEditingExtensionContext *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD v32[5];
  id v33;
  _QWORD v34[4];
  __int128 v35;
  uint64_t v36;
  _QWORD v37[4];
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[5];
  id v45;

  v12 = a3;
  -[PHEditingExtensionContext _releaseSandboxExtensions](self, "_releaseSandboxExtensions");
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy_;
  v44[4] = __Block_byref_object_dispose_;
  v45 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy_;
  v42[4] = __Block_byref_object_dispose_;
  v43 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy_;
  v40[4] = __Block_byref_object_dispose_;
  v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy_;
  v38[4] = __Block_byref_object_dispose_;
  v39 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = 1;
  v34[0] = 0;
  v34[1] = v34;
  v34[3] = &unk_20D2129CD;
  v34[2] = 0x3810000000;
  v35 = *MEMORY[0x24BDC0D40];
  v36 = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy_;
  v32[4] = __Block_byref_object_dispose_;
  v33 = 0;
  v4 = dispatch_group_create();
  -[PHEditingExtensionContext inputItems](self, "inputItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "attachments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  dispatch_group_enter(v4);
  v9 = PUEditingInitialPayloadTypeIdentifier;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __70__PHEditingExtensionContext_beginContentEditingWithCompletionHandler___block_invoke;
  v22[3] = &unk_24C62C5D0;
  v25 = v32;
  v10 = v4;
  v26 = v44;
  v27 = v42;
  v28 = v34;
  v29 = v37;
  v23 = v10;
  v24 = self;
  v30 = v40;
  v31 = v38;
  objc_msgSend(v8, "loadItemForTypeIdentifier:options:completionHandler:", v9, 0, v22);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__PHEditingExtensionContext_beginContentEditingWithCompletionHandler___block_invoke_2;
  block[3] = &unk_24C62C5F8;
  v15 = v40;
  v16 = v38;
  v17 = v34;
  v18 = v44;
  v19 = v37;
  v20 = v42;
  block[4] = self;
  v14 = v12;
  v21 = v32;
  v11 = v12;
  dispatch_group_notify(v10, MEMORY[0x24BDAC9B8], block);

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v38, 8);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);

  _Block_object_dispose(v44, 8);
}

- (void)finishContentEditing
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__PHEditingExtensionContext_finishContentEditing__block_invoke;
  block[3] = &unk_24C62C670;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)cancelContentEditingWithResponseHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__PHEditingExtensionContext_cancelContentEditingWithResponseHandler___block_invoke;
  v6[3] = &unk_24C62C698;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

- (void)querySDKVersionWithResponseHandler:(id)a3
{
  uint64_t program_sdk_version;
  void (**v4)(id, uint64_t);

  v4 = (void (**)(id, uint64_t))a3;
  program_sdk_version = dyld_get_program_sdk_version();
  v4[2](v4, program_sdk_version);

}

- (void)setUndoManagerForBarButtons:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_undoManagerForBarButtons, a3);
  v5 = a3;
  -[PHEditingExtensionContext undoAdapter](self, "undoAdapter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUndoManager:", v5);

}

- (void)setHideNavigationController:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[PHEditingExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setHideNavigationController:", v3);
}

- (PUEditingInitialPayload)_initialPayload
{
  return (PUEditingInitialPayload *)objc_getProperty(self, a2, 48, 1);
}

- (PUEditingExtensionUndoAdapter)undoAdapter
{
  return self->_undoAdapter;
}

- (void)setUndoAdapter:(id)a3
{
  objc_storeStrong((id *)&self->_undoAdapter, a3);
}

- (BOOL)attemptUndoManagerAutoSetup
{
  return self->_attemptUndoManagerAutoSetup;
}

- (void)setAttemptUndoManagerAutoSetup:(BOOL)a3
{
  self->_attemptUndoManagerAutoSetup = a3;
}

- (NSUndoManager)undoManagerForBarButtons
{
  return self->_undoManagerForBarButtons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoManagerForBarButtons, 0);
  objc_storeStrong((id *)&self->_undoAdapter, 0);
  objc_storeStrong((id *)&self->__initialPayload, 0);
  objc_storeStrong((id *)&self->_videoPathSandboxExtensionHandleWrapper, 0);
  objc_storeStrong((id *)&self->_fullSizeImageSandboxExtensionHandleWrapper, 0);
}

uint64_t __69__PHEditingExtensionContext_cancelContentEditingWithResponseHandler___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_contentEditingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancelContentEditing");

  objc_msgSend(*(id *)(a1 + 32), "_releaseSandboxExtensions");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __49__PHEditingExtensionContext_finishContentEditing__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(a1 + 32), "_contentEditingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __49__PHEditingExtensionContext_finishContentEditing__block_invoke_2;
  v3[3] = &unk_24C62C648;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "finishContentEditingWithCompletionHandler:", v3);

}

void __49__PHEditingExtensionContext_finishContentEditing__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  dispatch_semaphore_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  dispatch_semaphore_t v11;

  v3 = a2;
  v4 = dispatch_semaphore_create(0);
  objc_msgSend(*(id *)(a1 + 32), "_auxiliaryConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__PHEditingExtensionContext_finishContentEditing__block_invoke_3;
  v9[3] = &unk_24C62C620;
  v10 = v3;
  v11 = v4;
  v7 = v4;
  v8 = v3;
  objc_msgSend(v6, "commitContentEditingOutput:withCompletionHandler:", v8, v9);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

}

intptr_t __49__PHEditingExtensionContext_finishContentEditing__block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
    NSLog(CFSTR("Failed to save content editing output %@ with error %@"), *(_QWORD *)(a1 + 32), a2);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __70__PHEditingExtensionContext_beginContentEditingWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  __int128 v55;
  uint64_t v56;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 || !v6)
  {
    v8 = objc_alloc(MEMORY[0x24BDE3520]);
    objc_msgSend(v5, "fullSizeImageURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
    {
      objc_msgSend(v5, "videoURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v11 = objc_msgSend(v8, "initWithAppropriateURL:", v10);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    if (!v9)
    objc_msgSend(v5, "adjustmentData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "placeholderImageData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = DCIM_newPLImageWithData();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    objc_msgSend(v5, "livePhotoStillDisplayTime");
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    *(_OWORD *)(v19 + 32) = v55;
    *(_QWORD *)(v19 + 48) = v56;
    v20 = objc_msgSend(v5, "mediaType");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(v5, "playbackStyle");
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setMediaType:", v20);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setMediaSubtypes:", objc_msgSend(v5, "mediaSubtypes"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setPlaybackStyle:", objc_msgSend(v5, "playbackStyle"));
    v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(v5, "creationDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setCreationDate:", v22);

    v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(v5, "location");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setLocation:", v24);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setAdjustmentData:", v14);
    v25 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(v5, "accessibilityDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setAccessibilityDescription:", v26);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setBaseVersion:", objc_msgSend(v5, "adjustmentBaseVersion"));
    objc_msgSend(v5, "videoURL");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    v29 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v27;

    objc_msgSend(v5, "displaySizeImageData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v31 = (void *)DCIM_newPLImageWithData();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setDisplaySizeImage:", v31);

    }
    v32 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    objc_msgSend(v5, "uniformTypeIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setUniformTypeIdentifier:", v33);

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40))
    {
      objc_msgSend(v5, "videoPathSandboxExtensionToken");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32))
      {
        if (objc_msgSend(v34, "length"))
        {
          v48 = (void *)MEMORY[0x24BDD16E0];
          v49 = objc_retainAutorelease(v35);
          objc_msgSend(v49, "UTF8String");
          objc_msgSend(v48, "numberWithLongLong:", sandbox_extension_consume());
          v50 = objc_claimAutoreleasedReturnValue();
          v51 = *(_QWORD *)(a1 + 40);
          v52 = *(void **)(v51 + 32);
          *(_QWORD *)(v51 + 32) = v50;

          if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "longLongValue") == -1)
          {
            NSLog(CFSTR("failed to consume token %@"), v49);
            v53 = *(_QWORD *)(a1 + 40);
            v54 = *(void **)(v53 + 32);
            *(_QWORD *)(v53 + 32) = 0;

          }
        }
      }

    }
    objc_msgSend(v5, "fullSizeImageURL");
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    v38 = *(void **)(v37 + 40);
    *(_QWORD *)(v37 + 40) = v36;

    objc_msgSend(v5, "fullSizeImageURLSandboxExtensionToken");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24))
    {
      if (objc_msgSend(v39, "length"))
      {
        v41 = (void *)MEMORY[0x24BDD16E0];
        v42 = objc_retainAutorelease(v40);
        objc_msgSend(v42, "UTF8String");
        objc_msgSend(v41, "numberWithLongLong:", sandbox_extension_consume());
        v43 = objc_claimAutoreleasedReturnValue();
        v44 = *(_QWORD *)(a1 + 40);
        v45 = *(void **)(v44 + 24);
        *(_QWORD *)(v44 + 24) = v43;

        if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "longLongValue") == -1)
        {
          NSLog(CFSTR("failed to consume token %@"), v42);
          v46 = *(_QWORD *)(a1 + 40);
          v47 = *(void **)(v46 + 24);
          *(_QWORD *)(v46 + 24) = 0;

        }
      }
    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setFullSizeImageOrientation:", objc_msgSend(v5, "fullSizeImageExifOrientation"));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }

}

uint64_t __70__PHEditingExtensionContext_beginContentEditingWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v2
    && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
    && (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 44) & 1) != 0)
  {
    v3 = (void *)MEMORY[0x24BDE35A8];
    v11[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v11[1] = v2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "livePhotoWithResourceFileURLs:error:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setLivePhoto:", v5);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) == 5)
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setVideoURL:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setFullSizeImageURL:");
  }
  else if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setVideoURL:");
  }
  objc_msgSend(*(id *)(a1 + 32), "_contentEditingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startContentEditingWithInput:placeholderImage:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));

  if (objc_msgSend(*(id *)(a1 + 32), "attemptUndoManagerAutoSetup"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_contentEditingController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v7;
    else
      v8 = 0;
    objc_msgSend(v8, "undoManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setUndoManagerForBarButtons:", v9);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __82__PHEditingExtensionContext_queryShouldShowCancelConfirmationWithResponseHandler___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_contentEditingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "shouldShowCancelConfirmation");

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __82__PHEditingExtensionContext_queryShouldShowCancelConfirmationWithResponseHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken_1113 != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken_1113, &__block_literal_global_1114);
  return (id)_extensionAuxiliaryVendorProtocol___interface;
}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken_1111 != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken_1111, &__block_literal_global_16);
  return (id)_extensionAuxiliaryHostProtocol___interface;
}

void __60__PHEditingExtensionContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549CE7B0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol___interface;
  _extensionAuxiliaryHostProtocol___interface = v0;

}

void __62__PHEditingExtensionContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549CC938);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  _extensionAuxiliaryVendorProtocol___interface = v0;

}

@end
