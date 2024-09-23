@implementation CKShare(UI)

+ (id)ic_fallbackThumbnail
{
  if (ic_fallbackThumbnail_onceToken != -1)
    dispatch_once(&ic_fallbackThumbnail_onceToken, &__block_literal_global_90);
  return (id)ic_fallbackThumbnail_thumbnail;
}

- (void)ic_updateFromObject:()UI
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v30 = a3;
  objc_msgSend(v30, "shareType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0C94A88]);

  objc_msgSend(v30, "shareTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0C94A80]);

  objc_msgSend((id)objc_opt_class(), "ic_fallbackThumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ic_PNGData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0C94A78]);

  objc_msgSend(v30, "recordType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D638D0]);

  objc_msgSend(v30, "recordID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0C950C0]);
    objc_msgSend(v30, "recordID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithRecordID:action:", v11, 0);
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D638C8]);

  }
  else
  {
    objc_msgSend(a1, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0D638C8]);
  }

  objc_opt_class();
  ICDynamicCast();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (_QWORD *)MEMORY[0x1E0C94A70];
  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Shared Note"), CFSTR("Shared Note"), 0, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v15, *v14);

    objc_msgSend(v13, "snippet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "encryptedValues");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D638E8]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(v13, "attachmentContentInfoType"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D638E0]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "attachmentContentInfoCount"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D638D8]);

  }
  objc_opt_class();
  ICDynamicCast();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Shared Folder"), CFSTR("Shared Folder"), 0, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v21, *v14);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v20, "visibleNotesCount"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D638A8]);

    v23 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v20, "visibleNotesIncludingChildFolders");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "numberWithUnsignedInteger:", objc_msgSend(v24, "count"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0D638B0]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v20, "visibleNoteContainerChildrenCount"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0D638F0]);

    v27 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v20, "recursiveVisibleSubfolders");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "count"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0D638F8]);

  }
}

- (void)ic_updateThumbnailsFromObject:()UI completion:
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "ic_updateThumbnailsForObject:share:completion:", v7, a1, v6);

}

- (void)ic_updateFromObject:()UI generateThumbnails:
{
  id v6;

  v6 = a3;
  objc_msgSend(a1, "ic_updateFromObject:");
  if (a4)
    objc_msgSend(a1, "ic_updateThumbnailsFromObject:completion:", v6, 0);

}

+ (uint64_t)ic_cacheThumbnailsForObject:()UI
{
  return objc_msgSend(a1, "ic_updateThumbnailsForObject:share:completion:", a3, 0, 0);
}

+ (void)ic_updateThumbnailsForObject:()UI share:completion:
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint64_t (*__ptr32 *v14)();
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD v28[4];
  NSObject *v29;
  _QWORD *v30;
  _QWORD v31[4];
  NSObject *v32;
  _QWORD *v33;
  _QWORD v34[5];
  id v35;
  _QWORD v36[5];
  id v37;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0D639E8], "appearanceInfoWithType:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D639E8], "appearanceInfoWithType:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = dispatch_group_create();
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__29;
  v36[4] = __Block_byref_object_dispose__29;
  v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__29;
  v34[4] = __Block_byref_object_dispose__29;
  v35 = 0;
  objc_opt_class();
  ICDynamicCast();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = &off_1ACA58000;
  if (v13)
  {
    v22 = v7;
    dispatch_group_enter(v12);
    v15 = -[ICThumbnailConfiguration initForShareThumbnailWithNote:appearanceInfo:]([ICThumbnailConfiguration alloc], "initForShareThumbnailWithNote:appearanceInfo:", v13, v10);
    +[ICThumbnailService sharedThumbnailService](ICThumbnailService, "sharedThumbnailService");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __61__CKShare_UI__ic_updateThumbnailsForObject_share_completion___block_invoke;
    v31[3] = &unk_1E5C203C8;
    v33 = v36;
    v17 = v12;
    v32 = v17;
    objc_msgSend(v16, "thumbnailWithConfiguration:completion:", v15, v31);

    dispatch_group_enter(v17);
    v18 = -[ICThumbnailConfiguration initForShareThumbnailWithNote:appearanceInfo:]([ICThumbnailConfiguration alloc], "initForShareThumbnailWithNote:appearanceInfo:", v13, v11);
    +[ICThumbnailService sharedThumbnailService](ICThumbnailService, "sharedThumbnailService");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __61__CKShare_UI__ic_updateThumbnailsForObject_share_completion___block_invoke_2;
    v28[3] = &unk_1E5C203C8;
    v30 = v34;
    v29 = v17;
    objc_msgSend(v19, "thumbnailWithConfiguration:completion:", v18, v28);

    v7 = v22;
    v14 = &off_1ACA58000;
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = *((_QWORD *)v14 + 72);
  block[2] = __61__CKShare_UI__ic_updateThumbnailsForObject_share_completion___block_invoke_3;
  block[3] = &unk_1E5C203F0;
  v26 = v36;
  v27 = v34;
  v24 = v8;
  v25 = v9;
  v20 = v9;
  v21 = v8;
  dispatch_group_notify(v12, MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);

}

@end
