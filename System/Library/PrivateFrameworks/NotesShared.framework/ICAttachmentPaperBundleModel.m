@implementation ICAttachmentPaperBundleModel

+ (BOOL)canDisplayPaperAtURL:(id)a3
{
  return a3
      && +[ICAttachmentSystemPaperModelHelper canDisplayPaperAtURL:](_TtC11NotesShared34ICAttachmentSystemPaperModelHelper, "canDisplayPaperAtURL:");
}

- (BOOL)hasPreviews
{
  return 1;
}

- (BOOL)showThumbnailInNoteList
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[ICAttachmentModel hasThumbnailImage](self, "hasThumbnailImage"))
    return 0;
  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewImages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (NSURL)paperCoherenceContextURL
{
  void *v2;
  void *v3;

  -[ICAttachmentModel attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paperCoherenceContextURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)paperBundleURL
{
  void *v2;
  void *v3;

  -[ICAttachmentModel attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "paperBundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

+ (id)paperBundleURLForAttachmentIdentifier:(id)a3 inAccount:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "length");
  if (!v6 || !v7)
  {
    if (objc_msgSend(v5, "length"))
    {
      if (v6)
      {
LABEL_6:
        v10 = (void *)MEMORY[0x1E0C99E98];
        NSTemporaryDirectory();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "fileURLWithPath:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "UUIDString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", v14, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "URLByAppendingPathExtension:", CFSTR("bundle"));
        v9 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_7;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "identifier.length", "+[ICAttachmentPaperBundleModel paperBundleURLForAttachmentIdentifier:inAccount:]", 1, 1, CFSTR("PaperKit attachment identifier is empty"));
      if (v6)
        goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "account", "+[ICAttachmentPaperBundleModel paperBundleURLForAttachmentIdentifier:inAccount:]", 1, 1, CFSTR("PaperKit attachment account is nil"));
    goto LABEL_6;
  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__42;
  v25 = __Block_byref_object_dispose__42;
  v26 = 0;
  objc_msgSend(v6, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __80__ICAttachmentPaperBundleModel_paperBundleURLForAttachmentIdentifier_inAccount___block_invoke;
  v17[3] = &unk_1E76C95A8;
  v18 = v6;
  v19 = v5;
  v20 = &v21;
  objc_msgSend(v8, "performBlockAndWait:", v17);

  v9 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

LABEL_7:
  return v9;
}

void __80__ICAttachmentPaperBundleModel_paperBundleURLForAttachmentIdentifier_inAccount___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;

  objc_msgSend(*(id *)(a1 + 32), "systemPaperBundlesDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", *(_QWORD *)(a1 + 40), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathExtension:", CFSTR("bundle"));
  v4 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  v5 = a1 + 48;
  v7 = *(_QWORD *)(v6 + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "fileExistsAtPath:", v10) & 1) == 0)
  {
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 40), "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "fileExistsAtPath:", v11);

  if ((v12 & 1) == 0)
  {
    v13 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __80__ICAttachmentPaperBundleModel_paperBundleURLForAttachmentIdentifier_inAccount___block_invoke_cold_2();

    +[ICFileUtilities coordinateMoveItemAt:to:](ICFileUtilities, "coordinateMoveItemAt:to:", v3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)v5 + 8) + 40));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v14 = os_log_create("com.apple.notes", "SystemPaper");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __80__ICAttachmentPaperBundleModel_paperBundleURLForAttachmentIdentifier_inAccount___block_invoke_cold_1();

    }
    goto LABEL_9;
  }
LABEL_10:

}

- (NSURL)paperBundleDatabaseSubdirectoryURL
{
  void *v2;
  void *v3;

  -[ICAttachmentPaperBundleModel paperBundleURL](self, "paperBundleURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICSystemPaperDocument databaseDirectoryAt:](_TtC11NotesShared21ICSystemPaperDocument, "databaseDirectoryAt:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)paperBundleAssetsSubdirectoryURL
{
  void *v2;
  void *v3;

  -[ICAttachmentPaperBundleModel paperBundleURL](self, "paperBundleURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICSystemPaperDocument assetsDirectoryAt:](_TtC11NotesShared21ICSystemPaperDocument, "assetsDirectoryAt:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (id)archivePaperBundleToDiskWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _TtC11NotesShared21ICSystemPaperDocument *v13;
  void *v14;
  _TtC11NotesShared21ICSystemPaperDocument *v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  -[ICAttachmentModel attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemPaperTemporaryDirectoryURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0CEC678], "preferredFilenameExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathExtension:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [_TtC11NotesShared21ICSystemPaperDocument alloc];
  -[ICAttachmentModel attachment](self, "attachment");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[ICSystemPaperDocument initWithPaperAttachment:](v13, "initWithPaperAttachment:", v14);

  v23 = 0;
  -[ICSystemPaperDocument copyAndArchivePaperBundleTo:error:](v15, "copyAndArchivePaperBundleTo:error:", v12, &v23);
  v16 = v23;
  v17 = v16;
  if (v16)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v16);
    v18 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      -[ICAttachmentModel attachment](self, "attachment");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "ic_loggingIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v25 = v22;
      v26 = 2112;
      v27 = v12;
      v28 = 2112;
      v29 = v17;
      _os_log_error_impl(&dword_1BD918000, v18, OS_LOG_TYPE_ERROR, "Failed to archive paper (%@) bundle to (%@): %@", buf, 0x20u);

    }
    v19 = 0;
  }
  else
  {
    v19 = v12;
  }

  return v19;
}

- (BOOL)restorePaperBundleFromArchiveURL:(id)a3 error:(id *)a4
{
  id v6;
  _TtC11NotesShared21ICSystemPaperDocument *v7;
  void *v8;
  _TtC11NotesShared21ICSystemPaperDocument *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = [_TtC11NotesShared21ICSystemPaperDocument alloc];
  -[ICAttachmentModel attachment](self, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICSystemPaperDocument initWithPaperAttachment:](v7, "initWithPaperAttachment:", v8);

  v16 = 0;
  -[ICSystemPaperDocument restorePaperBundleFrom:error:](v9, "restorePaperBundleFrom:error:", v6, &v16);
  v10 = v16;
  v11 = v10;
  if (v10)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v10);
    v12 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[ICAttachmentModel attachment](self, "attachment");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "ic_loggingIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v18 = v15;
      v19 = 2112;
      v20 = v6;
      v21 = 2112;
      v22 = v11;
      _os_log_error_impl(&dword_1BD918000, v12, OS_LOG_TYPE_ERROR, "Failed to restore paper (%@) bundle archive (%@): %@", buf, 0x20u);

    }
  }

  return v11 == 0;
}

- (BOOL)paperHasEnhancedCanvas
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[ICAttachmentModel attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hasEnhancedCanvasKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setPaperHasEnhancedCanvas:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  BOOL v6;

  -[ICAttachmentModel attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__ICAttachmentPaperBundleModel_setPaperHasEnhancedCanvas___block_invoke;
  v5[3] = &__block_descriptor_33_e29_v16__0__NSMutableDictionary_8l;
  v6 = a3;
  objc_msgSend(v4, "updateAttachmentMetadataWithBlock:", v5);

}

void __58__ICAttachmentPaperBundleModel_setPaperHasEnhancedCanvas___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(unsigned __int8 *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "numberWithBool:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("hasEnhancedCanvasKey"));

}

- (BOOL)paperHasNewInks2022
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[ICAttachmentModel attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hasNewInksKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setPaperHasNewInks2022:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  BOOL v6;

  -[ICAttachmentModel attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__ICAttachmentPaperBundleModel_setPaperHasNewInks2022___block_invoke;
  v5[3] = &__block_descriptor_33_e29_v16__0__NSMutableDictionary_8l;
  v6 = a3;
  objc_msgSend(v4, "updateAttachmentMetadataWithBlock:", v5);

}

void __55__ICAttachmentPaperBundleModel_setPaperHasNewInks2022___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(unsigned __int8 *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "numberWithBool:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("hasNewInksKey"));

}

- (BOOL)paperHasNewInks2023
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[ICAttachmentModel attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hasNewInks2023Key"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setPaperHasNewInks2023:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  BOOL v6;

  -[ICAttachmentModel attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__ICAttachmentPaperBundleModel_setPaperHasNewInks2023___block_invoke;
  v5[3] = &__block_descriptor_33_e29_v16__0__NSMutableDictionary_8l;
  v6 = a3;
  objc_msgSend(v4, "updateAttachmentMetadataWithBlock:", v5);

}

void __55__ICAttachmentPaperBundleModel_setPaperHasNewInks2023___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(unsigned __int8 *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "numberWithBool:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("hasNewInks2023Key"));

}

- (BOOL)paperHasNewInksSpring2024
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[ICAttachmentModel attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hasNewInksSpring2024Key"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setPaperHasNewInksSpring2024:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  BOOL v6;

  -[ICAttachmentModel attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__ICAttachmentPaperBundleModel_setPaperHasNewInksSpring2024___block_invoke;
  v5[3] = &__block_descriptor_33_e29_v16__0__NSMutableDictionary_8l;
  v6 = a3;
  objc_msgSend(v4, "updateAttachmentMetadataWithBlock:", v5);

}

void __61__ICAttachmentPaperBundleModel_setPaperHasNewInksSpring2024___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(unsigned __int8 *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "numberWithBool:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("hasNewInksSpring2024Key"));

}

- (BOOL)paperHasMath
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[ICAttachmentModel attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("hasMathKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (void)setPaperHasMath:(BOOL)a3
{
  void *v4;
  _QWORD v5[4];
  BOOL v6;

  -[ICAttachmentModel attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__ICAttachmentPaperBundleModel_setPaperHasMath___block_invoke;
  v5[3] = &__block_descriptor_33_e29_v16__0__NSMutableDictionary_8l;
  v6 = a3;
  objc_msgSend(v4, "updateAttachmentMetadataWithBlock:", v5);

}

void __48__ICAttachmentPaperBundleModel_setPaperHasMath___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = *(unsigned __int8 *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "numberWithBool:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("hasMathKey"));

}

+ (int64_t)baseNotesVersion
{
  return 7;
}

- (void)updateMinimumSupportedVersionIfNeededWithCompletionHandler:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD block[5];
  id v10;
  void (**v11)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[ICAttachmentModel attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ICAttachmentPaperBundleModel paperHasNewInksSpring2024](self, "paperHasNewInksSpring2024"))
  {
LABEL_9:
    v4[2](v4);
    goto LABEL_10;
  }
  -[ICAttachmentPaperBundleModel paperBundleURL](self, "paperBundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v8 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ICAttachmentPaperBundleModel updateMinimumSupportedVersionIfNeededWithCompletionHandler:].cold.1(v5, v8);

    goto LABEL_9;
  }
  if (updateMinimumSupportedVersionIfNeededWithCompletionHandler__onceToken != -1)
    dispatch_once(&updateMinimumSupportedVersionIfNeededWithCompletionHandler__onceToken, &__block_literal_global_52);
  v7 = updateMinimumSupportedVersionIfNeededWithCompletionHandler__queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__ICAttachmentPaperBundleModel_updateMinimumSupportedVersionIfNeededWithCompletionHandler___block_invoke_2;
  block[3] = &unk_1E76C7780;
  block[4] = self;
  v10 = v5;
  v11 = v4;
  dispatch_async(v7, block);

LABEL_10:
}

void __91__ICAttachmentPaperBundleModel_updateMinimumSupportedVersionIfNeededWithCompletionHandler___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.notes.system-paper-version-check", v2);
  v1 = (void *)updateMinimumSupportedVersionIfNeededWithCompletionHandler__queue;
  updateMinimumSupportedVersionIfNeededWithCompletionHandler__queue = (uint64_t)v0;

}

void __91__ICAttachmentPaperBundleModel_updateMinimumSupportedVersionIfNeededWithCompletionHandler___block_invoke_2(id *a1)
{
  uint64_t v2;
  void *v3;
  int64_t v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  int64_t v12;

  v2 = objc_msgSend((id)objc_opt_class(), "baseNotesVersion");
  objc_msgSend(a1[4], "paperBundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[ICAttachmentSystemPaperModelHelper minimumSupportedNotesVersionForPaperAtURL:greaterOrEqualToVersion:](_TtC11NotesShared34ICAttachmentSystemPaperModelHelper, "minimumSupportedNotesVersionForPaperAtURL:greaterOrEqualToVersion:", v3, v2);

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__ICAttachmentPaperBundleModel_updateMinimumSupportedVersionIfNeededWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E76C7758;
  v11 = v2;
  v12 = v4;
  v5 = a1[5];
  v6 = a1[4];
  v8 = v5;
  v9 = v6;
  v10 = a1[6];
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __91__ICAttachmentPaperBundleModel_updateMinimumSupportedVersionIfNeededWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  int v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 56);
  if (v2 < 9)
  {
    if (*(uint64_t *)(a1 + 64) < 9)
      goto LABEL_7;
    v3 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "ic_loggingIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(*(id *)(a1 + 32), "minimumSupportedNotesVersion");
      v19 = 138412802;
      v20 = v4;
      v21 = 2048;
      v22 = v5;
      v23 = 2048;
      v24 = 9;
      _os_log_impl(&dword_1BD918000, v3, OS_LOG_TYPE_INFO, "Attachment (%@) was found to have contents which won't render properly pre-iOS 16.0. Bumping notes version for the attachment from %lld to %lld.", (uint8_t *)&v19, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "setPaperHasEnhancedCanvas:", 1);
    v2 = *(_QWORD *)(a1 + 56);
  }
  if (v2 > 9)
    goto LABEL_11;
LABEL_7:
  if (*(uint64_t *)(a1 + 64) > 9)
  {
    v6 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "ic_loggingIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(*(id *)(a1 + 32), "minimumSupportedNotesVersion");
      v19 = 138412802;
      v20 = v7;
      v21 = 2048;
      v22 = v8;
      v23 = 2048;
      v24 = 10;
      _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_INFO, "Attachment (%@) was found to have contents which won't render properly pre-iOS 16.1. Bumping notes version for the attachment from %lld to %lld.", (uint8_t *)&v19, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "setPaperHasNewInks2022:", 1);
    v2 = *(_QWORD *)(a1 + 56);
LABEL_11:
    if (v2 >= 13)
      goto LABEL_16;
  }
  if (*(uint64_t *)(a1 + 64) < 13)
    goto LABEL_17;
  v9 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "ic_loggingIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(*(id *)(a1 + 32), "minimumSupportedNotesVersion");
    v19 = 138412802;
    v20 = v10;
    v21 = 2048;
    v22 = v11;
    v23 = 2048;
    v24 = 13;
    _os_log_impl(&dword_1BD918000, v9, OS_LOG_TYPE_INFO, "Attachment (%@) was found to have contents which won't render properly pre-iOS 17.0. Bumping notes version for the attachment from %lld to %lld.", (uint8_t *)&v19, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 40), "setPaperHasNewInks2023:", 1);
  v2 = *(_QWORD *)(a1 + 56);
LABEL_16:
  if (v2 >= 14)
    goto LABEL_21;
LABEL_17:
  if (*(uint64_t *)(a1 + 64) > 13)
  {
    v12 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "ic_loggingIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(*(id *)(a1 + 32), "minimumSupportedNotesVersion");
      v19 = 138412802;
      v20 = v13;
      v21 = 2048;
      v22 = v14;
      v23 = 2048;
      v24 = 14;
      _os_log_impl(&dword_1BD918000, v12, OS_LOG_TYPE_INFO, "Attachment (%@) was found to have contents which won't render properly pre-iOS 17.4. Bumping notes version for the attachment from %lld to %lld.", (uint8_t *)&v19, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "setPaperHasNewInksSpring2024:", 1);
    v2 = *(_QWORD *)(a1 + 56);
LABEL_21:
    if (v2 > 14)
      goto LABEL_26;
  }
  if (*(uint64_t *)(a1 + 64) >= 15)
  {
    v15 = os_log_create("com.apple.notes", "SystemPaper");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "ic_loggingIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(*(id *)(a1 + 32), "minimumSupportedNotesVersion");
      v19 = 138412802;
      v20 = v16;
      v21 = 2048;
      v22 = v17;
      v23 = 2048;
      v24 = 15;
      _os_log_impl(&dword_1BD918000, v15, OS_LOG_TYPE_INFO, "Attachment (%@) was found to have contents which won't render properly pre-iOS 18.0. Bumping notes version for the attachment from %lld to %lld.", (uint8_t *)&v19, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "setPaperHasMath:", 1);
  }
LABEL_26:
  objc_msgSend(*(id *)(a1 + 32), "resetToIntrinsicNotesVersionAndPropagateToChildObjects");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)removeStrokesFromStyleInventory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_permanentObjectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAttachmentModel attachment](self, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "workerManagedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__ICAttachmentPaperBundleModel_removeStrokesFromStyleInventory__block_invoke;
  v9[3] = &unk_1E76C73B0;
  v10 = v6;
  v11 = v4;
  v7 = v4;
  v8 = v6;
  objc_msgSend(v8, "performBlock:", v9);

}

void __63__ICAttachmentPaperBundleModel_removeStrokesFromStyleInventory__block_invoke(uint64_t a1)
{
  _TtC11NotesShared21ICSystemPaperDocument *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "ic_existingObjectWithID:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[ICSystemPaperDocument initWithPaperAttachment:]([_TtC11NotesShared21ICSystemPaperDocument alloc], "initWithPaperAttachment:", v2);
  -[ICSystemPaperDocument removeStrokesFromStyleInventory](v1, "removeStrokesFromStyleInventory");

}

+ (id)generateFallbackPDFDataForAttachment:(id)a3
{
  id v3;
  _TtC11NotesShared21ICSystemPaperDocument *v4;
  void *v5;

  v3 = a3;
  v4 = -[ICSystemPaperDocument initWithPaperAttachment:]([_TtC11NotesShared21ICSystemPaperDocument alloc], "initWithPaperAttachment:", v3);

  -[ICSystemPaperDocument toFallbackPDFData](v4, "toFallbackPDFData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)providesStandaloneTitleForNote
{
  return 1;
}

- (id)standaloneTitleForNote
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;

  -[ICAttachmentModel attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[ICAttachmentModel attachment](self, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!objc_msgSend(v5, "length"))
  {
    +[ICNote defaultTitleForEmptyNote](ICNote, "defaultTitleForEmptyNote");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v7;
  }
  objc_msgSend(v5, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithFilenameExtension:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0CEC570]))
    {
      objc_msgSend(v5, "stringByDeletingPathExtension");
      v10 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v10;
    }

  }
  return v5;
}

- (ICAccount)account
{
  return self->_account;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_account, 0);
}

void __80__ICAttachmentPaperBundleModel_paperBundleURLForAttachmentIdentifier_inAccount___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_2();
  _os_log_error_impl(&dword_1BD918000, v0, OS_LOG_TYPE_ERROR, "Could note move prerelease system paper bundle from %@ to %@", v1, 0x16u);
}

void __80__ICAttachmentPaperBundleModel_paperBundleURLForAttachmentIdentifier_inAccount___block_invoke_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_4_2();
  _os_log_debug_impl(&dword_1BD918000, v0, OS_LOG_TYPE_DEBUG, "Detected prerelease system paper bundle that has note been moved: %@. Moving to %@", v1, 0x16u);
}

- (void)updateMinimumSupportedVersionIfNeededWithCompletionHandler:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "ic_loggingIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1BD918000, a2, OS_LOG_TYPE_ERROR, "Can't update minimum supported version for paper attachment (%@) because paperBundleURL was nil", (uint8_t *)&v4, 0xCu);

}

@end
