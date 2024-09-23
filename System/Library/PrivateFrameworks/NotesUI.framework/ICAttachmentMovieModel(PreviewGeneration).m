@implementation ICAttachmentMovieModel(PreviewGeneration)

- (BOOL)generatePreviewsInOperation:()PreviewGeneration
{
  void *v5;
  void *v6;
  void *v7;
  const void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  objc_class *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id obj;
  _QWORD v29[5];
  _QWORD v30[8];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[7];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t v48[128];
  uint8_t buf[4];
  id v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__59;
  v46 = __Block_byref_object_dispose__59;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__59;
  v40 = __Block_byref_object_dispose__59;
  v41 = 0;
  objc_msgSend(a1, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __73__ICAttachmentMovieModel_PreviewGeneration__generatePreviewsInOperation___block_invoke;
  v35[3] = &unk_1E5C1DA20;
  v35[4] = a1;
  v35[5] = &v42;
  v35[6] = &v36;
  objc_msgSend(v6, "performBlockAndWait:", v35);

  v7 = (void *)v37[5];
  v26 = v7;
  if (v7)
  {
    v8 = (const void *)objc_msgSend(v7, "newPreviewImageSource");
    if (v8)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      +[ICPreviewDeviceContext sharedContext](ICPreviewDeviceContext, "sharedContext");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "deviceInfoScalable:", 1);
      obj = (id)objc_claimAutoreleasedReturnValue();

      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v48, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v32 != v11)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            objc_msgSend(v13, "imageSize", v26);
            v15 = v14;
            objc_msgSend(a1, "attachment");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "managedObjectContext");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v30[0] = MEMORY[0x1E0C809B0];
            v30[1] = 3221225472;
            v30[2] = __73__ICAttachmentMovieModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_8;
            v30[3] = &unk_1E5C1EC80;
            v30[5] = v13;
            v30[6] = v8;
            v30[7] = v15;
            v30[4] = a1;
            objc_msgSend(v17, "performBlockAndWait:", v30);

          }
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v48, 16);
        }
        while (v10);
      }

      objc_msgSend(a1, "attachment");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "managedObjectContext");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __73__ICAttachmentMovieModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2;
      v29[3] = &unk_1E5C1D540;
      v29[4] = a1;
      objc_msgSend(v19, "performBlockAndWait:", v29);

      CFRelease(v8);
    }
  }
  else
  {
    v20 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (id)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v43[5];
      *(_DWORD *)buf = 138412802;
      v50 = v23;
      v51 = 2112;
      v52 = v24;
      v53 = 2112;
      v54 = v25;
      _os_log_debug_impl(&dword_1AC7A1000, v20, OS_LOG_TYPE_DEBUG, "%@ %@ %@ early return", buf, 0x20u);

    }
  }
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  return v26 != 0;
}

@end
