@implementation SGWalletOrderAttachmentDissector

- (BOOL)shouldIgnoreEntity:(id)a3
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  objc_class *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    sgLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      goto LABEL_8;
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_1C3607000, v4, OS_LOG_TYPE_INFO, "%@: Ignoring attachments because Orders feature is disabled", (uint8_t *)&v8, 0xCu);
LABEL_6:

    goto LABEL_8;
  }
  if ((objc_msgSend(MEMORY[0x1E0D198F0], "detectStructuredEvents") & 1) != 0)
    return 0;
  sgLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_debug_impl(&dword_1C3607000, v4, OS_LOG_TYPE_DEBUG, "%@: Skipping wallet order attachment dissector: detectStructuredEvents is OFF", (uint8_t *)&v8, 0xCu);
    goto LABEL_6;
  }
LABEL_8:

  return 1;
}

- (BOOL)orderAttachmentsCompletelyDownloaded:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isWalletOrderMimeType", (_QWORD)v14) & 1) != 0)
        {
          if ((objc_msgSend(v8, "isDownloadedLocally") & 1) == 0)
            goto LABEL_16;
        }
        else
        {
          objc_msgSend(v8, "filename");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "pathExtension");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v10, "isEqualToString:", CFSTR("order")) & 1) != 0)
          {
            v11 = objc_msgSend(v8, "isDownloadedLocally");

            if (!v11)
            {
LABEL_16:
              v12 = 0;
              goto LABEL_17;
            }
          }
          else
          {

          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_17:

  return v12;
}

- (id)_downloadWalletOrderAttachmentsFrom:(id)a3
{
  return (id)sgFilter();
}

- (id)_enrichmentsForWalletOrderDictionary:(id)a3 orderData:(id)a4 parentMessage:(id)a5 parentEntity:(id)a6
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  SGPipelineEnrichment *v14;
  void *v15;
  SGPipelineEnrichment *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v8 = a6;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("serial"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "duplicateKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGDuplicateKey duplicateKeyForWalletOrderIdentifier:parentKey:](SGDuplicateKey, "duplicateKeyForWalletOrderIdentifier:parentKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [SGPipelineEnrichment alloc];
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("serial"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SGPipelineEnrichment initWithDuplicateKey:title:parent:](v14, "initWithDuplicateKey:title:parent:", v13, v15, v8);

  objc_msgSend(MEMORY[0x1E0D197F0], "walletOrderData:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[SGEntity addTag:](v16, "addTag:", v17);
  objc_msgSend(MEMORY[0x1E0D197F0], "walletOrderDictionary:", v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[SGEntity addTag:](v16, "addTag:", v18);
  if (v16)
  {
    v21[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v19;
}

- (void)_dissectMessage:(id)a3 entity:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  unint64_t v31;
  int v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  objc_class *v39;
  void *v40;
  void *v41;
  objc_class *v42;
  void *v43;
  void *v44;
  __int128 v45;
  void *v46;
  id v47;
  void *v48;
  SGWalletOrderAttachmentDissector *v49;
  id obj;
  uint64_t v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD v61[3];
  _QWORD v62[3];
  uint8_t v63[128];
  _BYTE buf[24];
  void *v65;
  uint64_t *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v6 = a4;
  v49 = self;
  if (!-[SGWalletOrderAttachmentDissector shouldIgnoreEntity:](self, "shouldIgnoreEntity:", v6))
  {
    v46 = v6;
    objc_msgSend(v47, "attachments");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SGWalletOrderAttachmentDissector orderAttachmentsCompletelyDownloaded:](self, "orderAttachmentsCompletelyDownloaded:", v7);

    if (v8)
    {
      objc_msgSend(v47, "attachments");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGWalletOrderAttachmentDissector _downloadWalletOrderAttachmentsFrom:](v49, "_downloadWalletOrderAttachmentsFrom:", v9);
      obj = (id)objc_claimAutoreleasedReturnValue();

      sgLogHandle();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v42 = (objc_class *)objc_opt_class();
        NSStringFromClass(v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "attachments");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v43;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = objc_msgSend(v44, "count");
        *(_WORD *)&buf[22] = 2048;
        v65 = (void *)objc_msgSend(obj, "count");
        _os_log_debug_impl(&dword_1C3607000, v10, OS_LOG_TYPE_DEBUG, "%@: Message with %tu attachments (%tu downloaded wallet orders)", buf, 0x20u);

      }
      if (objc_msgSend(obj, "count"))
      {
        objc_msgSend(v46, "tags");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D197F0], "requiresDeferredDissection");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "containsObject:", v12);

        if (v13)
        {
          objc_msgSend(MEMORY[0x1E0D197F0], "requiresDeferredDissection");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "removeTag:", v14);

        }
        v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        obj = obj;
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
        if (v15)
        {
          v51 = *(_QWORD *)v54;
          *(_QWORD *)&v16 = 138412290;
          v45 = v16;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v54 != v51)
                objc_enumerationMutation(obj);
              v18 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
              v19 = (void *)MEMORY[0x1C3BD4F6C]();
              objc_msgSend(v18, "path");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              if (v20)
              {
                v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v20);
                v57 = 0;
                v58 = &v57;
                v59 = 0x2050000000;
                v22 = (void *)getFKSuggestionsWalletOrderAttachmentClass_softClass;
                v60 = getFKSuggestionsWalletOrderAttachmentClass_softClass;
                if (!getFKSuggestionsWalletOrderAttachmentClass_softClass)
                {
                  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
                  *(_QWORD *)&buf[8] = 3221225472;
                  *(_QWORD *)&buf[16] = __getFKSuggestionsWalletOrderAttachmentClass_block_invoke;
                  v65 = &unk_1E7DB7220;
                  v66 = &v57;
                  __getFKSuggestionsWalletOrderAttachmentClass_block_invoke((uint64_t)buf);
                  v22 = (void *)v58[3];
                }
                v23 = objc_retainAutorelease(v22);
                _Block_object_dispose(&v57, 8);
                v52 = 0;
                objc_msgSend(v23, "readContentsOfOrderAtURL:error:", v21, &v52);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = v52;
                if (v25)
                {
                  sgLogHandle();
                  v26 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                  {
                    v27 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v27);
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    *(_QWORD *)&buf[4] = v28;
                    *(_WORD *)&buf[12] = 2112;
                    *(_QWORD *)&buf[14] = v25;
                    _os_log_error_impl(&dword_1C3607000, v26, OS_LOG_TYPE_ERROR, "%@: Unable to parse file owing to this error: %@", buf, 0x16u);

                  }
                }
                else
                {
                  v31 = objc_msgSend(v24, "orderState");
                  if (v31 < 3)
                    v32 = v31 + 1;
                  else
                    v32 = 0;
                  v61[0] = CFSTR("serial");
                  objc_msgSend(v24, "fullyQualifiedOrderIdentifier", v45);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v62[0] = v33;
                  v61[1] = CFSTR("orderState");
                  walletOrderStateDescription(v32);
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  v61[2] = CFSTR("filePath");
                  v62[1] = v34;
                  v62[2] = v20;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 3);
                  v26 = objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v24, "data");
                  v35 = objc_claimAutoreleasedReturnValue();
                  v36 = (void *)v35;
                  if (v26 && v35)
                  {
                    -[SGWalletOrderAttachmentDissector _enrichmentsForWalletOrderDictionary:orderData:parentMessage:parentEntity:](v49, "_enrichmentsForWalletOrderDictionary:orderData:parentMessage:parentEntity:", v26, v35, v47, v46);
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    if ((unint64_t)objc_msgSend(v48, "count") <= 9)
                      objc_msgSend(v48, "addObjectsFromArray:", v37);

                  }
                }

              }
              else
              {
                sgLogHandle();
                v21 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                {
                  v29 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v29);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v45;
                  *(_QWORD *)&buf[4] = v30;
                  _os_log_error_impl(&dword_1C3607000, v21, OS_LOG_TYPE_ERROR, "%@: Path is nil for wallet order attachment. Skipping this order", buf, 0xCu);

                }
              }

              objc_autoreleasePoolPop(v19);
            }
            v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v63, 16);
          }
          while (v15);
        }

        objc_msgSend(v46, "addEnrichments:", v48);
      }
    }
    else
    {
      sgLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        v39 = (objc_class *)objc_opt_class();
        NSStringFromClass(v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "attachments");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v40;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = objc_msgSend(v41, "count");
        _os_log_impl(&dword_1C3607000, v38, OS_LOG_TYPE_DEFAULT, "%@: Message with %tu attachments are incompletely downloaded. Marking this entity as requiring dissection)", buf, 0x16u);

      }
      objc_msgSend(MEMORY[0x1E0D197F0], "requiresDeferredDissection");
      obj = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addTag:", obj);
    }

    v6 = v46;
  }

}

- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1C3BD4F6C]();
  -[SGWalletOrderAttachmentDissector _dissectMessage:entity:](self, "_dissectMessage:entity:", v11, v8);
  objc_autoreleasePoolPop(v10);

}

- (void)dissectTextMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)MEMORY[0x1C3BD4F6C]();
  -[SGWalletOrderAttachmentDissector _dissectMessage:entity:](self, "_dissectMessage:entity:", v11, v8);
  objc_autoreleasePoolPop(v10);

}

uint64_t __72__SGWalletOrderAttachmentDissector__downloadWalletOrderAttachmentsFrom___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a2;
  if ((objc_msgSend(v2, "isWalletOrderMimeType") & 1) != 0)
  {
    v3 = objc_msgSend(v2, "isDownloadedLocally");
  }
  else
  {
    objc_msgSend(v2, "path");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("order")))
    {
      v3 = objc_msgSend(v2, "isDownloadedLocally");
    }
    else
    {
      objc_msgSend(v2, "filename");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pathExtension");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("order")))
        v3 = objc_msgSend(v2, "isDownloadedLocally");
      else
        v3 = 0;

    }
  }

  return v3;
}

@end
