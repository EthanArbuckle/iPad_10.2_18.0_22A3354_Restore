@implementation ICAttachmentDrawingModel(PreviewGeneration)

- (uint64_t)generatePreviewsDuringCloudActivity
{
  return 0;
}

- (BOOL)needToGeneratePreviews
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  objc_class *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  objc_class *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  _BOOL4 v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  _BYTE v65[14];
  __int16 v66;
  _BYTE v67[10];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mergeableData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "attachment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "previewUpdateDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(a1, "attachment");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D63AF0], "defaultPixelSize");
      objc_msgSend(v8, "attachmentPreviewImageWithMinSize:scale:");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9
        && objc_msgSend(v9, "version")
        && (!objc_msgSend(v9, "versionOutOfDate")
         || (v10 = objc_msgSend(v9, "version"),
             objc_msgSend(MEMORY[0x1E0D63AF8], "serializationVersion") <= v10)))
      {
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        objc_msgSend(a1, "attachment");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "previewImages");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
        if (v22)
        {
          v23 = v22;
          v24 = 0;
          v25 = 0;
          v26 = *(_QWORD *)v54;
          do
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v54 != v26)
                objc_enumerationMutation(v21);
              v28 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
              v25 |= objc_msgSend(v28, "appearanceType") == 0;
              v24 |= objc_msgSend(v28, "appearanceType") == 1;
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
          }
          while (v23);

          if ((v25 & v24 & 1) != 0)
          {
            objc_msgSend(a1, "attachment");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "previewUpdateDate");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "attachment");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "modificationDate");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v30, "compare:", v32);
            v19 = v33 == -1;

            v11 = os_log_create("com.apple.notes", "PreviewGeneration");
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              v51 = v33 == -1;
              v34 = (objc_class *)objc_opt_class();
              NSStringFromClass(v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromSelector(a2);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "attachment");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "identifier");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "attachment");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "previewUpdateDate");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "attachment");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "modificationDate");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413570;
              v59 = v35;
              v60 = 2112;
              v61 = v36;
              v62 = 2112;
              v63 = v37;
              v64 = 1024;
              *(_DWORD *)v65 = v51;
              *(_WORD *)&v65[4] = 2112;
              *(_QWORD *)&v65[6] = v39;
              v66 = 2112;
              *(_QWORD *)v67 = v41;
              _os_log_debug_impl(&dword_1AC7A1000, v11, OS_LOG_TYPE_DEBUG, "%@ %@ %@ return %d self.attachment.previewUpdateDate %@ self.attachment.modificationDate %@", buf, 0x3Au);

            }
            goto LABEL_31;
          }
        }
        else
        {

          LOBYTE(v25) = 0;
          LOBYTE(v24) = 0;
        }
        v11 = os_log_create("com.apple.notes", "PreviewGeneration");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v43 = (objc_class *)objc_opt_class();
          NSStringFromClass(v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "attachment");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "identifier");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "attachment");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "previewImages");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v49, "count");
          *(_DWORD *)buf = 138413570;
          v59 = v44;
          v60 = 2112;
          v61 = v45;
          v62 = 2112;
          v63 = v47;
          v64 = 2048;
          *(_QWORD *)v65 = v50;
          *(_WORD *)&v65[8] = 1024;
          *(_DWORD *)&v65[10] = v25 & 1;
          v66 = 1024;
          *(_DWORD *)v67 = v24 & 1;
          _os_log_debug_impl(&dword_1AC7A1000, v11, OS_LOG_TYPE_DEBUG, "%@ %@ %@ return 1 previewImages.count %lu hasDefault %d hasDark %d", buf, 0x36u);

        }
      }
      else
      {
        v11 = os_log_create("com.apple.notes", "PreviewGeneration");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v12 = (objc_class *)objc_opt_class();
          NSStringFromClass(v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(a2);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "attachment");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v17 = objc_msgSend(v9, "version");
            v18 = objc_msgSend(v9, "versionOutOfDate");
          }
          else
          {
            v17 = 0;
            v18 = 0;
          }
          *(_DWORD *)buf = 138413826;
          v59 = v13;
          v60 = 2112;
          v61 = v14;
          v62 = 2112;
          v63 = v16;
          v64 = 2048;
          *(_QWORD *)v65 = v9;
          *(_WORD *)&v65[8] = 1024;
          *(_DWORD *)&v65[10] = v17;
          v66 = 1024;
          *(_DWORD *)v67 = v18;
          *(_WORD *)&v67[4] = 1024;
          *(_DWORD *)&v67[6] = objc_msgSend(MEMORY[0x1E0D63AF8], "serializationVersion");
          _os_log_debug_impl(&dword_1AC7A1000, v11, OS_LOG_TYPE_DEBUG, "%@ %@ %@ return 1 img %p img.version %d img.versionOutOfDate %d [ICDrawingVersionedDocument serializationVersion] %d", buf, 0x3Cu);

        }
      }
      v19 = 1;
LABEL_31:

      goto LABEL_32;
    }
    v11 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[ICAttachmentDrawingModel(PreviewGeneration) needToGeneratePreviews].cold.2(a1, a2, v11);
    v19 = 1;
  }
  else
  {
    v11 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[ICAttachmentDrawingModel(PreviewGeneration) needToGeneratePreviews].cold.1(a1, a2, v11);
    v19 = 0;
  }
  v9 = v11;
LABEL_32:

  return v19;
}

- (uint64_t)generatePreviewsInOperation:()PreviewGeneration
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__52;
  v15 = __Block_byref_object_dispose__52;
  v16 = 0;
  objc_msgSend(a1, "attachment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__ICAttachmentDrawingModel_PreviewGeneration__generatePreviewsInOperation___block_invoke;
  v10[3] = &unk_1E5C20078;
  v10[4] = a1;
  v10[5] = &v11;
  objc_msgSend(v6, "performBlockAndWait:", v10);

  v7 = (void *)MEMORY[0x1E0D63A10];
  objc_msgSend(a1, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "generatePreviewsForAttachment:fromDrawing:", v8, v12[5]);

  _Block_object_dispose(&v11, 8);
  return 1;
}

- (void)needToGeneratePreviews
{
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint8_t v15[14];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "attachment");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "attachment");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "previewUpdateDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_8();
  v16 = v8;
  v17 = v13;
  v18 = v10;
  v19 = v13;
  v20 = v14;
  _os_log_debug_impl(&dword_1AC7A1000, a3, OS_LOG_TYPE_DEBUG, "%@ %@ %@ return 1 self.attachment.previewUpdateDate %@", v15, 0x2Au);

}

@end
