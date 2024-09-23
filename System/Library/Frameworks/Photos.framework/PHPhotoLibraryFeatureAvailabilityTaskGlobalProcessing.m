@implementation PHPhotoLibraryFeatureAvailabilityTaskGlobalProcessing

void __87___PHPhotoLibraryFeatureAvailabilityTaskGlobalProcessing_executeWithCompletionHandler___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  uint64_t v5;
  char v6;
  id v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  id *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_addHighlightProcessingToAvailabilityStatus:", *(_QWORD *)(a1 + 32));

  v4 = objc_loadWeakRetained(v2);
  v5 = *(_QWORD *)(a1 + 32);
  v15 = 0;
  v6 = objc_msgSend(v4, "addGraphAvailabilityToAvailabilityStatus:error:", v5, &v15);
  v7 = v15;

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v8 + 24))
    v9 = v6;
  else
    v9 = 0;
  *(_BYTE *)(v8 + 24) = v9;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v10 + 40);
  v11 = (id *)(v10 + 40);
  v12 = v13;
  if (v13)
    v14 = v12;
  else
    v14 = v7;
  objc_storeStrong(v11, v14);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __87___PHPhotoLibraryFeatureAvailabilityTaskGlobalProcessing_executeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  char v4;
  id v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  id *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  v3 = *(_QWORD *)(a1 + 32);
  v13 = 0;
  v4 = objc_msgSend(WeakRetained, "addIndexingStateToAvailabilityStatus:error:", v3, &v13);
  v5 = v13;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (*(_BYTE *)(v6 + 24))
    v7 = v4;
  else
    v7 = 0;
  *(_BYTE *)(v6 + 24) = v7;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v8 + 40);
  v9 = (id *)(v8 + 40);
  v10 = v11;
  if (v11)
    v12 = v10;
  else
    v12 = v5;
  objc_storeStrong(v9, v12);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

void __87___PHPhotoLibraryFeatureAvailabilityTaskGlobalProcessing_executeWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void (*v3)(void);
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  os_signpost_id_t v12;
  uint8_t v13[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "_updateFeatureAvailabilityForAvailabilityStatus:", *(_QWORD *)(a1 + 32));

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(void **)(v4 + 40);
    if (v5)
    {
      v6 = v5;
      v7 = *(void **)(v4 + 40);
      *(_QWORD *)(v4 + 40) = v6;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", -1, CFSTR("Failed to get feature availability status"));
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v7 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;
    }

    v3 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v3();
  v10 = *(id *)(a1 + 72);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 80);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1991EC000, v11, OS_SIGNPOST_INTERVAL_END, v12, "GlobalProcessingFeatureAvailability", ", v13, 2u);
  }

}

@end
