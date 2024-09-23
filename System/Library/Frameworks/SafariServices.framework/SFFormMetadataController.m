@implementation SFFormMetadataController

void __68___SFFormMetadataController_collectFormMetadataForPageLevelAutoFill__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_observer");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(WeakRetained, "mainFrame");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didCollectFormMetadataForPageLevelAutoFill:atURL:", v4, v7);

}

void __63___SFFormMetadataController__collectFormMetadataForPreFilling___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "_observer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 32));
  objc_msgSend(WeakRetained, "mainFrame");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didCollectFormMetadataForPreFilling:atURL:", v4, v8);

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 1;
}

void __105___SFFormMetadataController__collectFormMetadataWithRequestType_ignoreAutoFilledForms_completionHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  SFFormAutoFillFrameHandle *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "plugInFrame");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[SFFormAutoFillFrameHandle initWithWebProcessPlugInFrame:]([SFFormAutoFillFrameHandle alloc], "initWithWebProcessPlugInFrame:", v8);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);
  }
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(a1 + 56) || (objc_msgSend(*(id *)(a1 + 48), "_formContainsAutoFilledElements:", v7) & 1) == 0)
    objc_msgSend(v6, "addObject:", v7);

}

void __126___SFFormMetadataController__webProcessPlugInBrowserContextController_textDidChangeInTextField_inFrame_initiatedByUserTyping___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  SFFormAutoFillFrameHandle *v10;
  id v11;
  id v12;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    +[SFFormAutoFillNode autoFillNodeWithNodeHandle:](SFFormAutoFillNode, "autoFillNodeWithNodeHandle:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFFormAutoFillFrame autoFillFrameWithWebProcessPlugInFrame:](SFFormAutoFillFrame, "autoFillFrameWithWebProcessPlugInFrame:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    v12 = 0;
    objc_msgSend(WeakRetained, "getMetadataForTextField:inFrame:textFieldMetadata:formMetadata:requestType:", v3, v4, &v12, &v11, 3);
    v5 = v12;
    v6 = v11;
    v7 = v11;

    objc_storeStrong(WeakRetained + 8, v6);
    if (v7)
      v8 = *(void **)(a1 + 40);
    else
      v8 = 0;
    objc_storeStrong(WeakRetained + 9, v8);
    objc_msgSend(WeakRetained, "_observer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SFFormAutoFillFrameHandle initWithWebProcessPlugInFrame:]([SFFormAutoFillFrameHandle alloc], "initWithWebProcessPlugInFrame:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v9, "textDidChangeInTextField:inForm:inFrame:", v5, v7, v10);

  }
}

@end
