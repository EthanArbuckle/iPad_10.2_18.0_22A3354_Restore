@implementation ICAttachmentGenericModel(PreviewGeneration)

- (uint64_t)needToGeneratePreviews
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a1, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "usesLinkPresentation"))
  {
    objc_msgSend(a1, "attachment");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "media");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "mediaURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isFileURL"))
    {
      objc_msgSend(a1, "attachment");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "attachmentType") == 4)
      {
        v7 = 0;
      }
      else
      {
        objc_msgSend(a1, "attachment");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "metadataExists") & 1) != 0)
          v7 = 0;
        else
          v7 = objc_msgSend(a1, "isGeneratingPreviews") ^ 1;

      }
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (uint64_t)generateAsynchronousPreviews
{
  return 1;
}

- (BOOL)generatePreviewsInOperation:()PreviewGeneration
{
  id v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  dispatch_semaphore_t v10;
  void *v11;
  objc_class *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t *v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;

  v4 = a3;
  if ((objc_msgSend(a1, "isGeneratingPreviews") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "setGeneratingPreviews:", 1);
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__63;
    v31 = __Block_byref_object_dispose__63;
    v32 = 0;
    objc_msgSend(a1, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __75__ICAttachmentGenericModel_PreviewGeneration__generatePreviewsInOperation___block_invoke;
    v24[3] = &unk_1E5C1D9D0;
    v26 = &v27;
    v9 = v6;
    v25 = v9;
    objc_msgSend(v7, "performBlockAndWait:", v24);

    if ((objc_msgSend((id)v28[5], "isFileURL") & 1) != 0)
    {
      v10 = dispatch_semaphore_create(0);
      v38 = 0;
      v39 = &v38;
      v40 = 0x2050000000;
      v11 = (void *)getLPMetadataProviderClass_softClass_1;
      v41 = getLPMetadataProviderClass_softClass_1;
      if (!getLPMetadataProviderClass_softClass_1)
      {
        v33 = v8;
        v34 = 3221225472;
        v35 = (uint64_t)__getLPMetadataProviderClass_block_invoke_1;
        v36 = &unk_1E5C1DE18;
        v37 = &v38;
        __getLPMetadataProviderClass_block_invoke_1((uint64_t)&v33);
        v11 = (void *)v39[3];
      }
      v12 = objc_retainAutorelease(v11);
      _Block_object_dispose(&v38, 8);
      v13 = objc_alloc_init(v12);
      v33 = 0;
      v34 = (uint64_t)&v33;
      v35 = 0x2020000000;
      LOBYTE(v36) = 0;
      v14 = v28[5];
      v17 = v8;
      v18 = 3221225472;
      v19 = __75__ICAttachmentGenericModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2;
      v20 = &unk_1E5C1F7E8;
      v21 = v9;
      v23 = &v33;
      v15 = v10;
      v22 = v15;
      objc_msgSend(v13, "startFetchingMetadataForURL:completionHandler:", v14, &v17);
      dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
      objc_msgSend(a1, "setGeneratingPreviews:", 0, v17, v18, v19, v20);
      v5 = *(_BYTE *)(v34 + 24) != 0;

      _Block_object_dispose(&v33, 8);
    }
    else
    {
      objc_msgSend(a1, "setGeneratingPreviews:", 0);
      v5 = 0;
    }

    _Block_object_dispose(&v27, 8);
  }

  return v5;
}

@end
