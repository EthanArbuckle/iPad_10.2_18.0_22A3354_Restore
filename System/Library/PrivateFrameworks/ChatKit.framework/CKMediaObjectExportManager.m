@implementation CKMediaObjectExportManager

+ (id)_serialBackgroundQueue
{
  if (_serialBackgroundQueue_onceToken != -1)
    dispatch_once(&_serialBackgroundQueue_onceToken, &__block_literal_global_219);
  return (id)_serialBackgroundQueue_queue;
}

void __52__CKMediaObjectExportManager__serialBackgroundQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.messages.CKMediaObjectExportManager", v2);
  v1 = (void *)_serialBackgroundQueue_queue;
  _serialBackgroundQueue_queue = (uint64_t)v0;

}

- (CKMediaObjectExportManager)initWithMediaObject:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  CKMediaObjectExportManager *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v9 = a3;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = a3;
    objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  v7 = -[CKMediaObjectExportManager initWithMediaObjects:](self, "initWithMediaObjects:", v6, v9, v10);

  return v7;
}

- (CKMediaObjectExportManager)initWithMediaObjects:(id)a3
{
  id v5;
  CKMediaObjectExportManager *v6;
  CKMediaObjectExportManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKMediaObjectExportManager;
  v6 = -[CKMediaObjectExportManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_queuedMediaObjects, a3);

  return v7;
}

- (void)queueMediaObject:(id)a3
{
  id v4;
  void *v5;
  id v6;

  if (a3)
  {
    v4 = a3;
    -[CKMediaObjectExportManager queuedMediaObjects](self, "queuedMediaObjects");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayByAddingObject:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[CKMediaObjectExportManager setQueuedMediaObjects:](self, "setQueuedMediaObjects:", v5);
  }
}

- (void)dequeueMediaObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = a3;
    -[CKMediaObjectExportManager queuedMediaObjects](self, "queuedMediaObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "arrayByExcludingObjectsInArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObjectExportManager setQueuedMediaObjects:](self, "setQueuedMediaObjects:", v7);

  }
}

- (void)exportQueuedMediaObjectsWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKMediaObjectExportManager queuedMediaObjects](self, "queuedMediaObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CKMediaObjectExportManager exportMediaObjects:completion:](self, "exportMediaObjects:completion:", v5, v4);

}

- (void)exportMediaObject:(id)a3 completion:(id)a4
{
  -[CKMediaObjectExportManager exportMediaObject:withFileName:completion:](self, "exportMediaObject:withFileName:completion:", a3, 0, a4);
}

- (void)exportMediaObject:(id)a3 withFileName:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);
  void *v12;
  NSObject *v13;
  void *v14;
  uint8_t v15[8];
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(_QWORD, _QWORD, _QWORD))v10;
  if (v8)
  {
    if (v9)
    {
      v17[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    v16 = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKMediaObjectExportManager exportMediaObjects:withFileNames:completion:](self, "exportMediaObjects:withFileNames:completion:", v14, v12, v11);

  }
  else if (v10)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Failed to export media object because the given media object was nil.", v15, 2u);
      }

    }
    v11[2](v11, 0, 0);
  }

}

- (void)exportMediaObjects:(id)a3 completion:(id)a4
{
  -[CKMediaObjectExportManager exportMediaObjects:withFileNames:completion:](self, "exportMediaObjects:withFileNames:completion:", a3, 0, a4);
}

- (void)exportMediaObjects:(id)a3 withFileNames:(id)a4 completion:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  char *__ptr32 *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  id v28;
  id v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  _BOOL4 v53;
  __CFString *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  char v59;
  id v60;
  id v61;
  void *v63;
  id v64;
  NSObject *group;
  void *v66;
  unint64_t v67;
  id v68;
  id obj;
  id v70;
  _QWORD v71[4];
  id v72;
  uint64_t *v73;
  uint64_t *v74;
  id v75;
  _QWORD v76[4];
  id v77;
  _QWORD block[4];
  id v79;
  id v80;
  id v81;
  CKMediaObjectExportManager *v82;
  NSObject *v83;
  uint64_t *v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;
  id *v94;
  uint64_t v95;
  uint64_t (*v96)(uint64_t, uint64_t);
  void (*v97)(uint64_t);
  id v98;
  uint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  char v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  uint8_t buf[4];
  id v108;
  _BYTE v109[128];
  _BYTE v110[128];
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v61 = a4;
  v64 = a5;
  v68 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v70 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0u;
  obj = v7;
  v8 = 0;
  v9 = 0;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v110, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v104;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v104 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * i);
        if (objc_msgSend(v13, "isPhotosCompatible"))
        {
          objc_msgSend(v68, "addObject:", v13);
          if (objc_msgSend(v13, "mediaType") == 3)
          {
            ++v9;
          }
          else if (objc_msgSend(v13, "mediaType") == 2)
          {
            ++v8;
          }
        }
        else
        {
          objc_msgSend(v70, "addObject:", v13);
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v103, v110, 16);
    }
    while (v10);
  }

  group = dispatch_group_create();
  v99 = 0;
  v100 = &v99;
  v101 = 0x2020000000;
  v102 = 1;
  v93 = 0;
  v94 = (id *)&v93;
  v95 = 0x3032000000;
  v96 = __Block_byref_object_copy__65;
  v97 = __Block_byref_object_dispose__65;
  v98 = 0;
  v14 = objc_msgSend(v68, "count");
  v15 = &off_18E7C8000;
  if (v14)
  {
    dispatch_group_enter(group);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v91 = 0u;
    v92 = 0u;
    v89 = 0u;
    v90 = 0u;
    v18 = v68;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v89, v109, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v90;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v90 != v20)
            objc_enumerationMutation(v18);
          v22 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * j);
          objc_msgSend(v22, "syndicationIdentifier");
          v23 = (id)objc_claimAutoreleasedReturnValue();
          if (!v23)
          {
            IMLogHandleForCategory();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v108 = v22;
              _os_log_error_impl(&dword_18DFCD000, v24, OS_LOG_TYPE_ERROR, "Syndication identifier was nil for media object. mediaObject: %@", buf, 0xCu);
            }

            v23 = v66;
          }
          objc_msgSend(v17, "addObject:", v23);

        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v89, v109, 16);
      }
      while (v19);
    }

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v108 = v17;
        _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "Saving media objects with syndication identifiers to photo library %@", buf, 0xCu);
      }

    }
    v26 = objc_msgSend(v18, "count");
    objc_msgSend((id)objc_opt_class(), "_serialBackgroundQueue");
    v27 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__CKMediaObjectExportManager_exportMediaObjects_withFileNames_completion___block_invoke;
    block[3] = &unk_1E2758EE0;
    v79 = v18;
    v80 = v17;
    v81 = v66;
    v82 = self;
    v86 = v26;
    v87 = v9;
    v88 = v8;
    v84 = &v99;
    v85 = &v93;
    v83 = group;
    v28 = v66;
    v29 = v17;
    dispatch_async(v27, block);

    v15 = &off_18E7C8000;
  }
  v30 = 0;
  v31 = *((_QWORD *)v15 + 242);
  while (v30 < objc_msgSend(v70, "count"))
  {
    objc_msgSend(v70, "objectAtIndex:", v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_group_enter(group);
    objc_opt_class();
    v67 = v30;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v32, "fileURL");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "lastPathComponent");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "stringByDeletingPathExtension");
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = v32;
      if (objc_msgSend(v36, "isAudioMessage"))
      {
        if ((objc_msgSend(v36, "isFromMe") & 1) != 0)
        {
          CKFrameworkBundle();
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("AUDIO_MESSAGE"), &stru_1E276D870, CFSTR("ChatKit"));
          v38 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v36, "senderHandle");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (void *)MEMORY[0x1E0CB3940];
          CKFrameworkBundle();
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("AUDIO_MESSAGE_FROM"), &stru_1E276D870, CFSTR("ChatKit"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "fullName");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "stringWithFormat:", v50, v51);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v53 = objc_msgSend(v52, "userInterfaceLayoutDirection") == 1;

          if (v53)
            v54 = CFSTR("\u200F");
          else
            v54 = CFSTR("\u200E");
          -[__CFString stringByAppendingString:](v54, "stringByAppendingString:", v63);
          v38 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        v38 = v35;
      }
      v55 = (void *)MEMORY[0x1E0DC73E0];
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v76[0] = MEMORY[0x1E0C809B0];
      v76[1] = v31;
      v76[2] = __74__CKMediaObjectExportManager_exportMediaObjects_withFileNames_completion___block_invoke_53;
      v76[3] = &unk_1E2751290;
      v77 = v64;
      objc_msgSend(v55, "importRecordingWithSourceAudioURL:name:date:completionHandler:", v33, v38, v56, v76);

      goto LABEL_55;
    }
    if (!CKIsRunningInMacCatalyst())
      goto LABEL_56;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "transfer");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "filename");
    v36 = (id)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v36, "length"))
    {
      objc_msgSend(v32, "transfer");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "fileURL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "path");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v33, "URLsForDirectory:inDomains:", 15, 1);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "firstObject");
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v44, "URLByAppendingPathComponent:", v36);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "path");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v33, "fileExistsAtPath:", v46))
      {
        objc_msgSend(v46, "uniqueSavePath");
        v47 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v47 = v46;
      }
      v58 = v47;
      v75 = 0;
      v59 = objc_msgSend(v33, "copyItemAtPath:toPath:error:", v42, v47, &v75);
      v38 = v75;

      if ((v59 & 1) != 0)
        goto LABEL_54;
    }
    else
    {
      IMLogHandleForCategory();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v108 = v32;
        _os_log_error_impl(&dword_18DFCD000, v57, OS_LOG_TYPE_ERROR, "Transfer filename was empty for mediaObject: %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CKFileTransferErrorDomain"), 0, 0);
      v38 = (id)objc_claimAutoreleasedReturnValue();
    }
    *((_BYTE *)v100 + 24) = 0;
    objc_storeStrong(v94 + 5, v38);
LABEL_54:
    dispatch_group_leave(group);
LABEL_55:

LABEL_56:
    v30 = v67 + 1;
  }
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = v31;
  v71[2] = __74__CKMediaObjectExportManager_exportMediaObjects_withFileNames_completion___block_invoke_57;
  v71[3] = &unk_1E2758F08;
  v72 = v64;
  v73 = &v99;
  v74 = &v93;
  v60 = v64;
  dispatch_group_notify(group, MEMORY[0x1E0C80D38], v71);

  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(&v99, 8);

}

void __74__CKMediaObjectExportManager_exportMediaObjects_withFileNames_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  __int128 v9;
  _QWORD v10[5];
  id v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  objc_msgSend(MEMORY[0x1E0CD16F8], "sharedPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__CKMediaObjectExportManager_exportMediaObjects_withFileNames_completion___block_invoke_2;
  v16[3] = &unk_1E274B060;
  v17 = *(id *)(a1 + 32);
  v18 = *(id *)(a1 + 40);
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v19 = v4;
  v20 = v5;
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __74__CKMediaObjectExportManager_exportMediaObjects_withFileNames_completion___block_invoke_3;
  v10[3] = &unk_1E2758EB8;
  v10[4] = v5;
  v14 = *(_OWORD *)(a1 + 88);
  v15 = *(_QWORD *)(a1 + 104);
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 80);
  v11 = v6;
  v13 = v7;
  v9 = *(_OWORD *)(a1 + 64);
  v8 = (id)v9;
  v12 = v9;
  objc_msgSend(v2, "performChanges:completionHandler:", v16, v10);

}

unint64_t __74__CKMediaObjectExportManager_exportMediaObjects_withFileNames_completion___block_invoke_2(id *a1)
{
  unint64_t result;
  unint64_t i;
  void *v4;
  void *v5;
  id v6;

  result = objc_msgSend(a1[4], "count");
  if (result)
  {
    for (i = 0; i < result; ++i)
    {
      objc_msgSend(a1[4], "objectAtIndex:", i);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "objectAtIndex:", i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(a1[6], "isEqualToString:", v5))
      {

        v5 = 0;
      }
      v6 = (id)objc_msgSend(a1[7], "_phAssetCreationRequestForMediaObject:withSyndicationIdentifier:", v4, v5);

      result = objc_msgSend(a1[4], "count");
    }
  }
  return result;
}

void __74__CKMediaObjectExportManager_exportMediaObjects_withFileNames_completion___block_invoke_3(uint64_t a1, int a2, void *a3)
{
  __CFString *v5;
  NSObject *v6;
  const __CFString *v7;
  int v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  __CFString *v21;
  _QWORD v22[4];
  _QWORD v23[4];
  uint8_t buf[4];
  const __CFString *v25;
  __int16 v26;
  __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = CFSTR("NO");
      if (a2)
        v7 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v25 = v7;
      v26 = 2112;
      v27 = v5;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "CKImageMediaObject PHAssetChangeRequest performed changes. success: %@, error %@", buf, 0x16u);
    }

  }
  v8 = IMOSLoggingEnabled();
  if (a2)
  {
    if (v8)
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Successfully saved media objects to photo library.", buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "metricsSource", *MEMORY[0x1E0D38898]);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = *MEMORY[0x1E0D388D0];
    if (v11)
      v13 = v11;
    v23[0] = v13;
    v22[1] = *MEMORY[0x1E0D38870];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v14;
    v22[2] = *MEMORY[0x1E0D38878];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 80));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v15;
    v22[3] = *MEMORY[0x1E0D388D8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 88));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "trackEvent:withDictionary:", *MEMORY[0x1E0D38868], v17);

    objc_msgSend(MEMORY[0x1E0D358C0], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "cacheCompletedSaveForSyndicationIdentifiers:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (v8)
    {
      OSLogHandleForIMFoundationCategory();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v5;
        _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "CKMediaObjectExportManager Failed to save media objects to photo library. error: %@", buf, 0xCu);
      }

    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v21 = v5;
    v18 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = v21;
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __74__CKMediaObjectExportManager_exportMediaObjects_withFileNames_completion___block_invoke_53(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a2 != 0);
  return result;
}

uint64_t __74__CKMediaObjectExportManager_exportMediaObjects_withFileNames_completion___block_invoke_57(_QWORD *a1)
{
  uint64_t result;

  result = a1[4];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned __int8 *)(*(_QWORD *)(a1[5] + 8) + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  return result;
}

- (id)_phAssetCreationRequestForMediaObject:(id)a3 withSyndicationIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isPhotosCompatible"))
  {
    objc_msgSend(v6, "fileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && !-[CKMediaObjectExportManager ignoreSyndicationIdentifiers](self, "ignoreSyndicationIdentifiers"))
    {
      objc_msgSend(MEMORY[0x1E0CD1400], "creationRequestForAssetWithSyndicationIdentifier:", v7);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CD1400], "creationRequestForAsset");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    v10 = (void *)v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "addResourceWithType:fileURL:options:", 2, v8, 0);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "addResourceWithType:fileURL:options:", 1, v8, 0);
        v11 = v6;
        if (objc_msgSend(v11, "isIrisAsset"))
        {
          objc_msgSend(v11, "calculateIrisVideoPath");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v12, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addResourceWithType:fileURL:options:", 9, v13, 0);

        }
      }
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSArray)queuedMediaObjects
{
  return self->_queuedMediaObjects;
}

- (void)setQueuedMediaObjects:(id)a3
{
  objc_storeStrong((id *)&self->_queuedMediaObjects, a3);
}

- (NSString)metricsSource
{
  return self->_metricsSource;
}

- (void)setMetricsSource:(id)a3
{
  objc_storeStrong((id *)&self->_metricsSource, a3);
}

- (BOOL)ignoreSyndicationIdentifiers
{
  return self->_ignoreSyndicationIdentifiers;
}

- (void)setIgnoreSyndicationIdentifiers:(BOOL)a3
{
  self->_ignoreSyndicationIdentifiers = a3;
}

- (BOOL)queuedMediaObjectsArePhotosCompatible
{
  return self->_queuedMediaObjectsArePhotosCompatible;
}

- (void)setQueuedMediaObjectsArePhotosCompatible:(BOOL)a3
{
  self->_queuedMediaObjectsArePhotosCompatible = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsSource, 0);
  objc_storeStrong((id *)&self->_queuedMediaObjects, 0);
}

@end
