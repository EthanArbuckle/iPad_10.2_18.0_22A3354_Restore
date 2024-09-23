@implementation MusicKit

void __100__MusicKit_SoftLinking_MPModelLibraryTransientStateController_sharedLibraryTransientStateController__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v0 = (void *)getMPModelLibraryTransientStateControllerClass_softClass;
  v9 = getMPModelLibraryTransientStateControllerClass_softClass;
  if (!getMPModelLibraryTransientStateControllerClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getMPModelLibraryTransientStateControllerClass_block_invoke;
    v5[3] = &unk_1E9C05688;
    v5[4] = &v6;
    __getMPModelLibraryTransientStateControllerClass_block_invoke((uint64_t)v5);
    v0 = (void *)v7[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v1, "sharedDeviceLibraryController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[MusicKit_SoftLinking_MPModelLibraryTransientStateController _initWithUnderlyingLibraryTransientStateController:]([MusicKit_SoftLinking_MPModelLibraryTransientStateController alloc], "_initWithUnderlyingLibraryTransientStateController:", v2);
  v4 = (void *)sharedLibraryTransientStateController_sSharedDeviceLibraryController;
  sharedLibraryTransientStateController_sSharedDeviceLibraryController = (uint64_t)v3;

}

void __71__MusicKit_SoftLinking_MPRestrictionsMonitor_sharedRestrictionsMonitor__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v0 = (void *)getMPRestrictionsMonitorClass_softClass;
  v9 = getMPRestrictionsMonitorClass_softClass;
  if (!getMPRestrictionsMonitorClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getMPRestrictionsMonitorClass_block_invoke;
    v5[3] = &unk_1E9C05688;
    v5[4] = &v6;
    __getMPRestrictionsMonitorClass_block_invoke((uint64_t)v5);
    v0 = (void *)v7[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v1, "sharedRestrictionsMonitor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[MusicKit_SoftLinking_MPRestrictionsMonitor _initWithUnderlyingRestrictionsMonitor:]([MusicKit_SoftLinking_MPRestrictionsMonitor alloc], "_initWithUnderlyingRestrictionsMonitor:", v2);
  v4 = (void *)sharedRestrictionsMonitor_sSharedRestrictionsMonitor;
  sharedRestrictionsMonitor_sSharedRestrictionsMonitor = (uint64_t)v3;

}

void __63__MusicKit_SoftLinking_MPCloudController_sharedCloudController__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v0 = (void *)getMPCloudControllerClass_softClass;
  v9 = getMPCloudControllerClass_softClass;
  if (!getMPCloudControllerClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getMPCloudControllerClass_block_invoke;
    v5[3] = &unk_1E9C05688;
    v5[4] = &v6;
    __getMPCloudControllerClass_block_invoke((uint64_t)v5);
    v0 = (void *)v7[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v1, "sharedCloudController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[MusicKit_SoftLinking_MPCloudController _initWithUnderlyingCloudController:]([MusicKit_SoftLinking_MPCloudController alloc], "_initWithUnderlyingCloudController:", v2);
  v4 = (void *)sharedCloudController_sSharedCloudController;
  sharedCloudController_sSharedCloudController = (uint64_t)v3;

}

void __77__MusicKit_SoftLinking_MPContentTasteController_sharedContentTasteController__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v0 = (void *)getMPContentTasteControllerClass_softClass;
  v9 = getMPContentTasteControllerClass_softClass;
  if (!getMPContentTasteControllerClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getMPContentTasteControllerClass_block_invoke;
    v5[3] = &unk_1E9C05688;
    v5[4] = &v6;
    __getMPContentTasteControllerClass_block_invoke((uint64_t)v5);
    v0 = (void *)v7[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v1, "sharedController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[MusicKit_SoftLinking_MPContentTasteController _initWithUnderlyingContentTasteController:]([MusicKit_SoftLinking_MPContentTasteController alloc], "_initWithUnderlyingContentTasteController:", v2);
  v4 = (void *)sharedContentTasteController_sSharedContentTasteController;
  sharedContentTasteController_sSharedContentTasteController = (uint64_t)v3;

}

void __71__MusicKit_SoftLinking_MPCloudServiceStatusController_sharedController__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v0 = (void *)getMPCloudServiceStatusControllerClass_softClass;
  v9 = getMPCloudServiceStatusControllerClass_softClass;
  if (!getMPCloudServiceStatusControllerClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getMPCloudServiceStatusControllerClass_block_invoke;
    v5[3] = &unk_1E9C05688;
    v5[4] = &v6;
    __getMPCloudServiceStatusControllerClass_block_invoke((uint64_t)v5);
    v0 = (void *)v7[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v1, "sharedController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[MusicKit_SoftLinking_MPCloudServiceStatusController _initWithUnderlyingServiceStatusController:]([MusicKit_SoftLinking_MPCloudServiceStatusController alloc], "_initWithUnderlyingServiceStatusController:", v2);
  v4 = (void *)sharedController_sSharedController;
  sharedController_sSharedController = (uint64_t)v3;

}

void __87__MusicKit_SoftLinking_MPCModelStorePlaybackItemsRequest_performWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;

  v7 = a3;
  if (a2)
  {
    v5 = (objc_class *)MEMORY[0x1E0CCDE68];
    v6 = a2;
    a2 = (void *)objc_msgSend([v5 alloc], "initWithUnderlyingResponse:", v6);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __117__MusicKit_SoftLinking_MPModelLibraryPlaylistEditController_initWithPlaylist_initialTracklist_authorProfile_library___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_underlyingModelObject");
}

uint64_t __117__MusicKit_SoftLinking_MPModelLibraryPlaylistEditController_initWithPlaylist_initialTracklist_authorProfile_library___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_underlyingModelObject");
}

void __78__MusicKit_SoftLinking_MPModelLibraryPlaylistEditController_isCuratorPlaylist__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isCuratorPlaylist");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __91__MusicKit_SoftLinking_MPModelLibraryPlaylistEditController_appendModelObjects_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_underlyingModelObject");
}

uint64_t __102__MusicKit_SoftLinking_MPModelLibraryPlaylistEditController_insertModelObjects_afterEntry_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_underlyingModelObject");
}

uint64_t __75__MusicKit_SoftLinking_MPModelLibraryPlaylistEditController_removeEntries___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_underlyingModelObject");
}

void __82__MusicKit_SoftLinking_MPModelLibraryPlaylistEditController_commitWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  objc_class *v5;
  id v6;
  id v7;

  v7 = a3;
  if (a2)
  {
    v5 = (objc_class *)MEMORY[0x1E0CCDE28];
    v6 = a2;
    a2 = (void *)objc_msgSend([v5 alloc], "initWithUnderlyingModelObject:", v6);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __63__MusicKit_SoftLinking_MPCPlayerRequest_performWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "_errorFromUnderlyingError:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

id __134__MusicKit_SoftLinking_MPModelLibraryAddToPlaylistChangeRequest_initWithPlaylist_songIdentifiers_representativeObject_referralObject___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  objc_class *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v2 = a2;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v3 = (void *)getMPModelSongClass_softClass;
  v11 = getMPModelSongClass_softClass;
  if (!getMPModelSongClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getMPModelSongClass_block_invoke;
    v7[3] = &unk_1E9C05688;
    v7[4] = &v8;
    __getMPModelSongClass_block_invoke((uint64_t)v7);
    v3 = (void *)v9[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v8, 8);
  v5 = (void *)objc_msgSend([v4 alloc], "initWithIdentifiers:", v2);

  return v5;
}

void __113__MusicKit_SoftLinking_MPModelLibraryTransientStateController_performAddToPlaylistWithRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  id *v11;
  void *v12;
  id v13;
  id *v14;
  void *v15;
  id v16;
  id *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  _QWORD v39[2];
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v34 = 0;
    v35 = &v34;
    v36 = 0x2050000000;
    v4 = (void *)getMPModelLibraryRequestClass_softClass;
    v37 = getMPModelLibraryRequestClass_softClass;
    if (!getMPModelLibraryRequestClass_softClass)
    {
      v29 = MEMORY[0x1E0C809B0];
      v30 = 3221225472;
      v31 = (uint64_t)__getMPModelLibraryRequestClass_block_invoke;
      v32 = &unk_1E9C05688;
      v33 = &v34;
      __getMPModelLibraryRequestClass_block_invoke((uint64_t)&v29);
      v4 = (void *)v35[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v34, 8);
    v6 = objc_alloc_init(v5);
    objc_msgSend(MEMORY[0x1E0CCDE18], "_defaultPlaylistKind");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setItemKind:", v7);

    v34 = 0;
    v35 = &v34;
    v36 = 0x2050000000;
    v8 = (void *)getMPPropertySetClass_softClass;
    v37 = getMPPropertySetClass_softClass;
    if (!getMPPropertySetClass_softClass)
    {
      v29 = MEMORY[0x1E0C809B0];
      v30 = 3221225472;
      v31 = (uint64_t)__getMPPropertySetClass_block_invoke;
      v32 = &unk_1E9C05688;
      v33 = &v34;
      __getMPPropertySetClass_block_invoke((uint64_t)&v29);
      v8 = (void *)v35[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v34, 8);
    v10 = [v9 alloc];
    v29 = 0;
    v30 = (uint64_t)&v29;
    v31 = 0x2020000000;
    v11 = (id *)getMPModelPropertyPlaylistLastModifiedDateComponentsSymbolLoc_ptr;
    v32 = (void *)getMPModelPropertyPlaylistLastModifiedDateComponentsSymbolLoc_ptr;
    if (!getMPModelPropertyPlaylistLastModifiedDateComponentsSymbolLoc_ptr)
    {
      v12 = (void *)MediaPlayerLibrary_3();
      v11 = (id *)dlsym(v12, "MPModelPropertyPlaylistLastModifiedDateComponents");
      *(_QWORD *)(v30 + 24) = v11;
      getMPModelPropertyPlaylistLastModifiedDateComponentsSymbolLoc_ptr = (uint64_t)v11;
    }
    _Block_object_dispose(&v29, 8);
    if (!v11)
      getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
    v13 = *v11;
    v39[0] = v13;
    v29 = 0;
    v30 = (uint64_t)&v29;
    v31 = 0x2020000000;
    v14 = (id *)getMPModelPropertyPlaylistArtworkSymbolLoc_ptr;
    v32 = (void *)getMPModelPropertyPlaylistArtworkSymbolLoc_ptr;
    if (!getMPModelPropertyPlaylistArtworkSymbolLoc_ptr)
    {
      v15 = (void *)MediaPlayerLibrary_3();
      v14 = (id *)dlsym(v15, "MPModelPropertyPlaylistArtwork");
      *(_QWORD *)(v30 + 24) = v14;
      getMPModelPropertyPlaylistArtworkSymbolLoc_ptr = (uint64_t)v14;
    }
    _Block_object_dispose(&v29, 8);
    if (!v14)
      getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
    v16 = *v14;
    v39[1] = v16;
    v29 = 0;
    v30 = (uint64_t)&v29;
    v31 = 0x2020000000;
    v17 = (id *)getMPModelPropertyPlaylistTracksTiledArtworkSymbolLoc_ptr;
    v32 = (void *)getMPModelPropertyPlaylistTracksTiledArtworkSymbolLoc_ptr;
    if (!getMPModelPropertyPlaylistTracksTiledArtworkSymbolLoc_ptr)
    {
      v18 = (void *)MediaPlayerLibrary_3();
      v17 = (id *)dlsym(v18, "MPModelPropertyPlaylistTracksTiledArtwork");
      *(_QWORD *)(v30 + 24) = v17;
      getMPModelPropertyPlaylistTracksTiledArtworkSymbolLoc_ptr = (uint64_t)v17;
    }
    _Block_object_dispose(&v29, 8);
    if (!v17)
      getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
    v40 = *v17;
    v19 = (void *)MEMORY[0x1E0C99D20];
    v20 = v40;
    objc_msgSend(v19, "arrayWithObjects:count:", v39, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)objc_msgSend(v10, "initWithProperties:relationships:", v21, MEMORY[0x1E0C9AA70]);
    objc_msgSend(v6, "setItemProperties:", v22);

    objc_msgSend(*(id *)(a1 + 32), "_underlyingLibraryAddToPlaylistChangeRequest");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "playlist");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "identifiers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowedItemIdentifiers:", v26);

    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __113__MusicKit_SoftLinking_MPModelLibraryTransientStateController_performAddToPlaylistWithRequest_completionHandler___block_invoke_2;
    v27[3] = &unk_1E9C05978;
    v28 = *(id *)(a1 + 40);
    objc_msgSend(v6, "performWithResponseHandler:", v27);

  }
}

void __113__MusicKit_SoftLinking_MPModelLibraryTransientStateController_performAddToPlaylistWithRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "results");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CCDDC8], 2, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

uint64_t __112__MusicKit_SoftLinking_MPModelLibraryTransientStateController_performDeleteEntityWithRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_underlyingModelObject");
}

uint64_t __119__MusicKit_SoftLinking_MPModelLibraryTransientStateController_performLibraryImportChangeWithRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_underlyingModelObject");
}

uint64_t __119__MusicKit_SoftLinking_MPModelLibraryTransientStateController_performLibraryImportChangeWithRequest_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __122__MusicKit_SoftLinking_MPModelLibraryTransientStateController_performLibraryKeepLocalChangeWithRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_underlyingModelObject");
}

uint64_t __158__MusicKit_SoftLinking_MPModelResponseDetailedKeepLocalStatusRequesting_newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_underlyingModelObject");
}

uint64_t __158__MusicKit_SoftLinking_MPModelResponseDetailedKeepLocalStatusRequesting_newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex_responseHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __99__MusicKit_SoftLinking_MPModelLibraryStartCollaborationChangeRequest_performWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __103__MusicKit_SoftLinking_MPModelLibraryRemoveFromPlaylistChangeRequest_initWithPlaylist_entriesToRemove___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_underlyingModelObject");
}

void __116__MusicKit_SoftLinking_MPModelLibraryRemoveFromPlaylistChangeRequest_performWithCompletionPolicy_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v4 = a2;
  objc_msgSend(v3, "identifiers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __88__MusicKit_SoftLinking_MPAVRoutingController_routingControllerAvailableRoutesDidChange___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleRoutesDidChange:", v3);

}

BOOL __69__MusicKit_RemotePlaybackQueue_extractDialogFromCommandResult_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "dialog");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

BOOL __69__MusicKit_RemotePlaybackQueue_extractDialogFromCommandResult_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "commandError");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __97__MusicKit_SoftLinking_MPModelLibraryEndCollaborationChangeRequest_performWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __89__MusicKit_RemoteRadioStationPlaybackQueue_setQueueWithPath_sessionID_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  id v5;

  v5 = 0;
  +[MusicKit_RemotePlaybackQueue extractDialogFromCommandResult:error:](MusicKit_RemotePlaybackQueue, "extractDialogFromCommandResult:error:", a2, &v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __129__MusicKit_SoftLinking_MPSectionedCollection_MusicKit_SoftLinking_MPCPlayerResponseTracklist__enumeratePlayerSectionsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  _QWORD *v10;
  void *v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = a2;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v4 = (_QWORD *)getMPCPlayerResponseTracklistDisplaySectionPreviousItemsSymbolLoc_ptr;
  v17 = getMPCPlayerResponseTracklistDisplaySectionPreviousItemsSymbolLoc_ptr;
  if (!getMPCPlayerResponseTracklistDisplaySectionPreviousItemsSymbolLoc_ptr)
  {
    v5 = (void *)MediaPlaybackCoreLibrary_1();
    v4 = dlsym(v5, "MPCPlayerResponseTracklistDisplaySectionPreviousItems");
    v15[3] = (uint64_t)v4;
    getMPCPlayerResponseTracklistDisplaySectionPreviousItemsSymbolLoc_ptr = (uint64_t)v4;
  }
  _Block_object_dispose(&v14, 8);
  if (!v4)
    getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
  if ((objc_msgSend(v3, "isEqualToString:", *v4, v14) & 1) == 0)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v6 = (_QWORD *)getMPCPlayerResponseTracklistDisplaySectionPlayingItemSymbolLoc_ptr;
    v17 = getMPCPlayerResponseTracklistDisplaySectionPlayingItemSymbolLoc_ptr;
    if (!getMPCPlayerResponseTracklistDisplaySectionPlayingItemSymbolLoc_ptr)
    {
      v7 = (void *)MediaPlaybackCoreLibrary_1();
      v6 = dlsym(v7, "MPCPlayerResponseTracklistDisplaySectionPlayingItem");
      v15[3] = (uint64_t)v6;
      getMPCPlayerResponseTracklistDisplaySectionPlayingItemSymbolLoc_ptr = (uint64_t)v6;
    }
    _Block_object_dispose(&v14, 8);
    if (!v6)
      getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
    if ((objc_msgSend(v3, "isEqualToString:", *v6, v14) & 1) == 0)
    {
      v14 = 0;
      v15 = &v14;
      v16 = 0x2020000000;
      v8 = (_QWORD *)getMPCPlayerResponseTracklistDisplaySectionUpNextItemsSymbolLoc_ptr;
      v17 = getMPCPlayerResponseTracklistDisplaySectionUpNextItemsSymbolLoc_ptr;
      if (!getMPCPlayerResponseTracklistDisplaySectionUpNextItemsSymbolLoc_ptr)
      {
        v9 = (void *)MediaPlaybackCoreLibrary_1();
        v8 = dlsym(v9, "MPCPlayerResponseTracklistDisplaySectionUpNextItems");
        v15[3] = (uint64_t)v8;
        getMPCPlayerResponseTracklistDisplaySectionUpNextItemsSymbolLoc_ptr = (uint64_t)v8;
      }
      _Block_object_dispose(&v14, 8);
      if (!v8)
        getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
      if ((objc_msgSend(v3, "isEqualToString:", *v8, v14) & 1) == 0)
      {
        v14 = 0;
        v15 = &v14;
        v16 = 0x2020000000;
        v10 = (_QWORD *)getMPCPlayerResponseTracklistDisplaySectionNextItemsSymbolLoc_ptr;
        v17 = getMPCPlayerResponseTracklistDisplaySectionNextItemsSymbolLoc_ptr;
        if (!getMPCPlayerResponseTracklistDisplaySectionNextItemsSymbolLoc_ptr)
        {
          v11 = (void *)MediaPlaybackCoreLibrary_1();
          v10 = dlsym(v11, "MPCPlayerResponseTracklistDisplaySectionNextItems");
          v15[3] = (uint64_t)v10;
          getMPCPlayerResponseTracklistDisplaySectionNextItemsSymbolLoc_ptr = (uint64_t)v10;
        }
        _Block_object_dispose(&v14, 8);
        if (!v10)
          getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
        if ((objc_msgSend(v3, "isEqualToString:", *v10, v14) & 1) == 0)
        {
          v14 = 0;
          v15 = &v14;
          v16 = 0x2020000000;
          v12 = (_QWORD *)getMPCPlayerResponseTracklistDisplaySectionAutoPlayItemsSymbolLoc_ptr;
          v17 = getMPCPlayerResponseTracklistDisplaySectionAutoPlayItemsSymbolLoc_ptr;
          if (!getMPCPlayerResponseTracklistDisplaySectionAutoPlayItemsSymbolLoc_ptr)
          {
            v13 = (void *)MediaPlaybackCoreLibrary_1();
            v12 = dlsym(v13, "MPCPlayerResponseTracklistDisplaySectionAutoPlayItems");
            v15[3] = (uint64_t)v12;
            getMPCPlayerResponseTracklistDisplaySectionAutoPlayItemsSymbolLoc_ptr = (uint64_t)v12;
          }
          _Block_object_dispose(&v14, 8);
          if (!v12)
            getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
          objc_msgSend(v3, "isEqualToString:", *v12, v14);
        }
      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __143__MusicKit_SoftLinking_MPSectionedCollection_MusicKit_SoftLinking_MPCPlayerResponseTracklist__enumeratePlayerItemsInSectionAtIndex_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __88__MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver_initWithIdentifyingModelObject___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_underlyingModelObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "newKeepLocalStatusObserverConfiguration");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __88__MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver_initWithIdentifyingModelObject___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleUpdatedUnderlyingActiveKeepLocalStatus:", a2, a3);

}

void __83__MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver_setIdentifyingModelObject___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_underlyingModelObject");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "newKeepLocalStatusObserverConfiguration");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __118__MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver_calculateDownloadProgressWithIdentifyingModelObject_children___block_invoke(uint64_t a1)
{
  MusicKit_SoftLinking_MPModelResponseDetailedKeepLocalStatusRequesting *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *);
  void *v8;
  id v9;
  id location;

  v2 = -[MusicKit_SoftLinking_MPModelResponseDetailedKeepLocalStatusRequesting initWithModelObject:children:]([MusicKit_SoftLinking_MPModelResponseDetailedKeepLocalStatusRequesting alloc], "initWithModelObject:children:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_initWeak(&location, *(id *)(a1 + 48));
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __118__MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver_calculateDownloadProgressWithIdentifyingModelObject_children___block_invoke_2;
  v8 = &unk_1E9C05CC0;
  objc_copyWeak(&v9, &location);
  v3 = -[MusicKit_SoftLinking_MPModelResponseDetailedKeepLocalStatusRequesting newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:responseHandler:](v2, "newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:responseHandler:", 0, &v5);
  +[MusicKit_SoftLinking_MPModelLibraryTransientStateController sharedLibraryTransientStateController](MusicKit_SoftLinking_MPModelLibraryTransientStateController, "sharedLibraryTransientStateController", v5, v6, v7, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performOperation:", v3);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

void __118__MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver_calculateDownloadProgressWithIdentifyingModelObject_children___block_invoke_2(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (v4 && WeakRetained)
    objc_msgSend(WeakRetained[1], "setConfiguration:", v4);

}

void __115__MusicKit_SoftLinking_MPModelLibraryDuplicatePlaylistChangeRequest_performWithCompletionPolicy_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t v16;
  Class (*v17)(uint64_t);
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v5 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v6 = (void *)getMPIdentifierSetClass_softClass;
  v23 = getMPIdentifierSetClass_softClass;
  v7 = MEMORY[0x1E0C809B0];
  if (!getMPIdentifierSetClass_softClass)
  {
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __getMPIdentifierSetClass_block_invoke;
    v18 = &unk_1E9C05688;
    v19 = &v20;
    __getMPIdentifierSetClass_block_invoke((uint64_t)&v15);
    v6 = (void *)v21[3];
  }
  v8 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v20, 8);
  v9 = [v8 alloc];
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v10 = (void *)getMPModelPlaylistKindClass_softClass;
  v23 = getMPModelPlaylistKindClass_softClass;
  if (!getMPModelPlaylistKindClass_softClass)
  {
    v15 = v7;
    v16 = 3221225472;
    v17 = __getMPModelPlaylistKindClass_block_invoke;
    v18 = &unk_1E9C05688;
    v19 = &v20;
    __getMPModelPlaylistKindClass_block_invoke((uint64_t)&v15);
    v10 = (void *)v21[3];
  }
  v11 = objc_retainAutorelease(v10);
  _Block_object_dispose(&v20, 8);
  objc_msgSend(v11, "identityKind");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  v14[1] = 3221225472;
  v14[2] = __115__MusicKit_SoftLinking_MPModelLibraryDuplicatePlaylistChangeRequest_performWithCompletionPolicy_completionHandler___block_invoke_2;
  v14[3] = &unk_1E9C05D48;
  v14[4] = *(_QWORD *)(a1 + 32);
  v14[5] = a2;
  v13 = (void *)objc_msgSend(v9, "initWithSource:modelKind:block:", CFSTR("MusicKit_Duplicate_Playlist"), v12, v14);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __115__MusicKit_SoftLinking_MPModelLibraryDuplicatePlaylistChangeRequest_performWithCompletionPolicy_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = a2;
  objc_msgSend(v3, "mediaLibrary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __115__MusicKit_SoftLinking_MPModelLibraryDuplicatePlaylistChangeRequest_performWithCompletionPolicy_completionHandler___block_invoke_3;
  v7[3] = &__block_descriptor_40_e44_v16__0___MPMutableLocalLibraryIdentifiers__8l;
  v7[4] = *(_QWORD *)(a1 + 40);
  objc_msgSend(v4, "setLibraryIdentifiersWithDatabaseID:block:", v5, v7);

}

uint64_t __115__MusicKit_SoftLinking_MPModelLibraryDuplicatePlaylistChangeRequest_performWithCompletionPolicy_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPersistentID:", *(_QWORD *)(a1 + 32));
}

void __88__MusicKit_SoftLinking_MPModelLibraryDownloadQueueRequest_performWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCDE68]), "initWithUnderlyingResponse:", v13);
  if (*(id *)(*(_QWORD *)(a1 + 32) + 16) != v13)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    getMPModelResponseDidInvalidateNotification();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:name:object:", v9, v10, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

    v11 = *(_QWORD *)(a1 + 32);
    getMPModelResponseDidInvalidateNotification();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v11, sel__handleDownloadQueueDidChangeNotification_, v12, v13);

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), a2);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __98__MusicKit_SoftLinking_MPModelLibraryJoinCollaborationChangeRequest_performWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __73__MusicKit_SoftLinking_MPServerObjectDatabase_sharedServerObjectDatabase__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v0 = (void *)getMPServerObjectDatabaseClass_softClass;
  v9 = getMPServerObjectDatabaseClass_softClass;
  if (!getMPServerObjectDatabaseClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getMPServerObjectDatabaseClass_block_invoke;
    v5[3] = &unk_1E9C05688;
    v5[4] = &v6;
    __getMPServerObjectDatabaseClass_block_invoke((uint64_t)v5);
    v0 = (void *)v7[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v6, 8);
  objc_msgSend(v1, "sharedServerObjectDatabase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[MusicKit_SoftLinking_MPServerObjectDatabase _initWithUnderlyingServerObjectDatabase:]([MusicKit_SoftLinking_MPServerObjectDatabase alloc], "_initWithUnderlyingServerObjectDatabase:", v2);
  v4 = (void *)sharedServerObjectDatabase_sSharedServerObjectDatabase;
  sharedServerObjectDatabase_sSharedServerObjectDatabase = (uint64_t)v3;

}

void __94__MusicKit_SoftLinking_MPServerObjectDatabase_payloadDataForIdentifier_identifierKinds_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;

  v9 = a2;
  v3 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __94__MusicKit_SoftLinking_MPServerObjectDatabase_payloadDataForIdentifier_identifierKinds_error___block_invoke_2;
  v16[3] = &unk_1E9C05F70;
  v4 = *(void **)(a1 + 32);
  v18 = *(_QWORD *)(a1 + 40);
  v17 = v4;
  objc_msgSend(v9, "setUniversalStoreIdentifiersWithBlock:", v16);
  if ((*(_BYTE *)(a1 + 40) & 0x40) != 0)
  {
    v11 = v3;
    v12 = 3221225472;
    v13 = __94__MusicKit_SoftLinking_MPServerObjectDatabase_payloadDataForIdentifier_identifierKinds_error___block_invoke_3;
    v14 = &unk_1E9C05F98;
    v15 = *(id *)(a1 + 32);
    objc_msgSend(v9, "setRadioIdentifiersWithBlock:", &v11);

  }
  objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount", v9, v11, v12, v13, v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "DSIDForUserIdentity:outError:", v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v10, "setPersonalStoreIdentifiersWithPersonID:block:", v8, &__block_literal_global_11);

}

void __94__MusicKit_SoftLinking_MPServerObjectDatabase_payloadDataForIdentifier_identifierKinds_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void *v14;

  v3 = a2;
  v4 = v3;
  v5 = *(void **)(a1 + 32);
  if ((*(_BYTE *)(a1 + 40) & 0x20) != 0)
  {
    objc_msgSend(v3, "setSocialProfileID:", v5);
    goto LABEL_15;
  }
  v6 = v5;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v7 = getMPStoreItemMetadataInt64NormalizeStoreIDValueSymbolLoc_ptr;
  v14 = getMPStoreItemMetadataInt64NormalizeStoreIDValueSymbolLoc_ptr;
  if (!getMPStoreItemMetadataInt64NormalizeStoreIDValueSymbolLoc_ptr)
  {
    v8 = (void *)MediaPlayerLibrary_13();
    v7 = dlsym(v8, "MPStoreItemMetadataInt64NormalizeStoreIDValue");
    v12[3] = (uint64_t)v7;
    getMPStoreItemMetadataInt64NormalizeStoreIDValueSymbolLoc_ptr = v7;
  }
  _Block_object_dispose(&v11, 8);
  if (!v7)
    getMPRestrictionsMonitorAllowsExplicitContentDidChangeNotification_cold_1();
  v9 = ((uint64_t (*)(id))v7)(v6);

  v10 = *(_QWORD *)(a1 + 40);
  if (!v10)
  {
    if (!v9)
    {
LABEL_14:
      objc_msgSend(v4, "setGlobalPlaylistID:", *(_QWORD *)(a1 + 32), v11);
      goto LABEL_15;
    }
LABEL_13:
    objc_msgSend(v4, "setAdamID:", v9, v11);
    objc_msgSend(v4, "setSubscriptionAdamID:", v9);
    goto LABEL_15;
  }
  if ((v10 & 1) != 0 && v9)
    goto LABEL_13;
  if ((v10 & 0x10) != 0 && !v9)
    goto LABEL_14;
LABEL_15:

}

uint64_t __94__MusicKit_SoftLinking_MPServerObjectDatabase_payloadDataForIdentifier_identifierKinds_error___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStationStringID:", *(_QWORD *)(a1 + 32));
}

void __96__MusicKit_RemoteLibraryPlaybackQueue_setQueueWithPath_shuffleMode_sessionID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_setQueueWithPath:shuffleMode:sessionID:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __97__MusicKit_RemoteLibraryPlaybackQueue__setQueueWithPath_shuffleMode_sessionID_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v6 = 0;
  +[MusicKit_RemotePlaybackQueue extractDialogFromCommandResult:error:](MusicKit_RemotePlaybackQueue, "extractDialogFromCommandResult:error:", a2, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v3, v4);

}

void __96__MusicKit_RemoteLibraryPlaybackQueue_insertQueueWithPath_position_sessionID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 24), a2);
  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_insertQueueWithPath:position:sessionID:completionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

void __97__MusicKit_RemoteLibraryPlaybackQueue__insertQueueWithPath_position_sessionID_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;

  v6 = 0;
  +[MusicKit_RemotePlaybackQueue extractDialogFromCommandResult:error:](MusicKit_RemotePlaybackQueue, "extractDialogFromCommandResult:error:", a2, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v3, v4);

}

void __93__MusicKit_RemoteLibraryPlaybackQueue__resolveMediaQueryForLibraryRequest_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a2;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v4, "results");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __93__MusicKit_RemoteLibraryPlaybackQueue__resolveMediaQueryForLibraryRequest_completionHandler___block_invoke_2;
  v9[3] = &unk_1E9C06020;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v6, "enumerateItemsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(objc_alloc((Class)getMPMediaQueryClass()), "initWithEntities:entityType:", v8, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __93__MusicKit_RemoteLibraryPlaybackQueue__resolveMediaQueryForLibraryRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "identifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "library");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "persistentID");

  getMPModelPlaylistEntryClass_0();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = v16;
    objc_msgSend(v6, "song");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "song");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v6, "tvEpisode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v6, "tvEpisode");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v6, "movie");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
LABEL_9:

          goto LABEL_10;
        }
        objc_msgSend(v6, "movie");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    v11 = v8;
    objc_msgSend(v8, "identifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "library");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v13, "persistentID");

    goto LABEL_9;
  }
LABEL_10:
  objc_msgSend(getMPMediaLibraryClass_0(), "defaultMediaLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "entityWithPersistentID:entityType:", v5, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v15);
}

void __82__MusicKit_SoftLinking_MPLibraryAddStatusObserver_initWithIdentifyingModelObject___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_underlyingModelObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "libraryAddStatusObserverConfiguration");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_BYTE *)(v3 + 36) = BYTE4(v2);
  *(_DWORD *)(v3 + 32) = v2;

}

void __82__MusicKit_SoftLinking_MPLibraryAddStatusObserver_initWithIdentifyingModelObject___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleUpdatedUnderlyingLibraryAddStatus:", a2);

}

void __77__MusicKit_SoftLinking_MPLibraryAddStatusObserver_setIdentifyingModelObject___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_underlyingModelObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v4, "libraryAddStatusObserverConfiguration");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_BYTE *)(v3 + 36) = BYTE4(v2);
  *(_DWORD *)(v3 + 32) = v2;

}

uint64_t __74__MusicKit_SoftLinking_MPModelLibraryImportChangeRequest_setModelObjects___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_underlyingModelObject");
}

void __57__MusicKit_PlayerPathSessionManager_sharedSessionManager__block_invoke()
{
  MusicKit_PlayerPathSessionManager *v0;
  void *v1;

  v0 = objc_alloc_init(MusicKit_PlayerPathSessionManager);
  v1 = (void *)sharedSessionManager_sSharedSessionManager;
  sharedSessionManager_sSharedSessionManager = (uint64_t)v0;

}

uint64_t __100__MusicKit_SoftLinking_MPModelLibraryRemoveCollaboratorsChangeRequest_performWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __69__MusicKit_SoftLinking_MPCPlayerChangeRequest_performWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
      objc_msgSend(v10, "dialog", (_QWORD)v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v4, "addObject:", v10);
        goto LABEL_12;
      }
      if (objc_msgSend(v10, "type") == 2)
        break;
      objc_msgSend(v4, "addObject:", v10);
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
    objc_msgSend(v10, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_13;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
LABEL_12:

LABEL_13:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

id __128__MusicKit_SoftLinking_MPCPlaybackIntent_initWithLegacyLibraryRequest_allowedIdentifiers_startIdentifierSet_onlyLibraryContent___block_invoke(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t __107__MusicKit_SoftLinking_MPModelLibraryAlbumAppDataChangeRequest_performWithAlbum_appData_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
