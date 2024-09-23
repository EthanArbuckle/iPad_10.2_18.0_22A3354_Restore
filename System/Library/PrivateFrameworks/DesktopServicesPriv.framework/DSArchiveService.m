@implementation DSArchiveService

- (void)itemDescriptorsForItemAtURL:(id)a3 passphrase:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    v12[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  -[DSArchiveService itemDescriptorsForItemAtURL:passphrases:completionHandler:](self, "itemDescriptorsForItemAtURL:passphrases:completionHandler:", v8, v11, v10);
  if (v9)

}

- (void)itemDescriptorsForItemAtURL:(id)a3 passphrases:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t v19[8];
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  archiveServiceConnection(0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resume");
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __78__DSArchiveService_itemDescriptorsForItemAtURL_passphrases_completionHandler___block_invoke;
  v20[3] = &unk_1E8751368;
  v11 = v9;
  v22 = v11;
  v12 = v10;
  v21 = v12;
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3910]), "initWithURL:readonly:", v7, 1);
    if (v14)
    {
      objc_msgSend(v13, "itemDescriptorsForItemWithURLWrapper:passphrases:completionHandler:", v14, v8, v11);
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB3308];
      v24[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 257, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v18);
      objc_msgSend(v12, "invalidate");

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LogObj(0);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_1CBC4A000, v15, OS_LOG_TYPE_ERROR, "itemDescriptorsForItemAtURL: url is nil", v19, 2u);
    }

    (*((void (**)(id, _QWORD, void *))v11 + 2))(v11, 0, v14);
    objc_msgSend(v12, "invalidate");
  }

}

void __78__DSArchiveService_itemDescriptorsForItemAtURL_passphrases_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

- (id)archiveItemsAtURLs:(id)a3 toURL:(id)a4 options:(unint64_t)a5 compressionFormat:(unint64_t)a6 passphrase:(id)a7 completionHandler:(id)a8
{
  id v11;
  id v12;
  void (**v13)(id, _QWORD, id);
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void (**v28)(id, _QWORD, id);
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  NSObject *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  id v52;
  void *v53;
  _QWORD v54[4];
  id v55;
  id v56;
  void (**v57)(id, _QWORD, id);
  _QWORD v58[4];
  id v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  char v66;
  void *v67;
  uint64_t v68;
  id v69;
  uint8_t v70[128];
  uint8_t buf[4];
  id v72;
  uint64_t v73;
  _QWORD v74[4];

  v74[1] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v52 = a7;
  v13 = (void (**)(id, _QWORD, id))a8;
  v53 = v11;
  v14 = objc_msgSend(v11, "count");
  if (v12 && v14)
  {
    v66 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "path");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "fileExistsAtPath:isDirectory:", v16, &v66);
    if (v66)
      v18 = v17;
    else
      v18 = 0;

    if ((v18 & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v53, "count"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v20 = v53;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
      if (v21)
      {
        v22 = *(_QWORD *)v63;
        while (2)
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v63 != v22)
              objc_enumerationMutation(v20);
            v24 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
            v25 = (void *)objc_opt_class();
            v61 = 0;
            objc_msgSend(v25, "wrapperWithURL:readonly:error:", v24, 1, &v61);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = v61;
            if (!v26)
            {
              LogObj(0);
              v42 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v72 = v27;
                _os_log_impl(&dword_1CBC4A000, v42, OS_LOG_TYPE_ERROR, "archiveItemsWithURLs: Couldn't get url wrapper: %@", buf, 0xCu);
              }

              v35 = 0;
              v13[2](v13, 0, v27);
              goto LABEL_32;
            }
            objc_msgSend(v19, "addObject:", v26);

          }
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
          if (v21)
            continue;
          break;
        }
      }

      v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3910]), "initWithURL:readonly:", v12, 0);
      if (v20)
      {
        archiveServiceConnection(0);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "resume");
        v58[0] = MEMORY[0x1E0C809B0];
        v58[1] = 3221225472;
        v58[2] = __100__DSArchiveService_archiveItemsAtURLs_toURL_options_compressionFormat_passphrase_completionHandler___block_invoke;
        v58[3] = &unk_1E8751368;
        v28 = v13;
        v60 = v28;
        v29 = v47;
        v59 = v29;
        objc_msgSend(v29, "remoteObjectProxyWithErrorHandler:", v58);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.ArchiveService"), CFSTR("BackgroundArchive"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_alloc(MEMORY[0x1E0D87C98]);
        objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v67 = v48;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (void *)objc_msgSend(v30, "initWithExplanation:target:attributes:", CFSTR("ArchiveServices archive operation"), v31, v32);

        objc_msgSend(v33, "acquireWithInvalidationHandler:", &__block_literal_global);
        v54[0] = MEMORY[0x1E0C809B0];
        v54[1] = 3221225472;
        v54[2] = __100__DSArchiveService_archiveItemsAtURLs_toURL_options_compressionFormat_passphrase_completionHandler___block_invoke_54;
        v54[3] = &unk_1E87513B0;
        v57 = v28;
        v34 = v33;
        v55 = v34;
        v27 = v29;
        v56 = v27;
        objc_msgSend(v49, "archiveItemsWithURLWrappers:toURLWrapper:options:compressionFormat:passphrase:completionHandler:", v19, v20, a5, a6, v52, v54);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v44 = (void *)MEMORY[0x1E0CB35C8];
        v68 = *MEMORY[0x1E0CB3308];
        v69 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 257, v45);
        v27 = (id)objc_claimAutoreleasedReturnValue();

        LogObj(0);
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v72 = v27;
          _os_log_impl(&dword_1CBC4A000, v46, OS_LOG_TYPE_ERROR, "archiveItemsAtURLs: Couldn't get url wrapper for destination: %@", buf, 0xCu);
        }

        v35 = 0;
        v13[2](v13, 0, v27);
      }
LABEL_32:

    }
    else
    {
      v39 = (void *)MEMORY[0x1E0CB35C8];
      v73 = *MEMORY[0x1E0CB3308];
      v74[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, &v73, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4, v40);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      LogObj(0);
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v72 = v19;
        _os_log_impl(&dword_1CBC4A000, v41, OS_LOG_TYPE_ERROR, "archiveItemsAtURLs: destination doesn't exist or isn't a directory: %@", buf, 0xCu);
      }

      v35 = 0;
      v13[2](v13, 0, v19);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v11, "count"))
    {
      LogObj(0);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CBC4A000, v37, OS_LOG_TYPE_ERROR, "archiveItemsWithURLs: no urls", buf, 2u);
      }

    }
    if (!v12)
    {
      LogObj(0);
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CBC4A000, v38, OS_LOG_TYPE_ERROR, "archiveItemsWithURLs: destination is nil", buf, 2u);
      }

    }
    v13[2](v13, 0, v36);

    v35 = 0;
  }

  return v35;
}

void __100__DSArchiveService_archiveItemsAtURLs_toURL_options_compressionFormat_passphrase_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

void __100__DSArchiveService_archiveItemsAtURLs_toURL_options_compressionFormat_passphrase_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  LogObj(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1CBC4A000, v4, OS_LOG_TYPE_ERROR, "Archive Service archive assertion invalidated with error: %@", (uint8_t *)&v5, 0xCu);
  }

}

void __100__DSArchiveService_archiveItemsAtURLs_toURL_options_compressionFormat_passphrase_completionHandler___block_invoke_54(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  objc_msgSend(*(id *)(a1 + 40), "invalidate");

}

- (id)unarchiveItemAtURL:(id)a3 toURL:(id)a4 options:(unint64_t)a5 acceptedFormats:(unint64_t)a6 passphrases:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  void (**v16)(id, _QWORD, uint64_t);
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  char v21;
  char v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  DSArchiveService *v35;
  void (**v36)(id, _QWORD, uint64_t);
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  NSObject *v46;
  NSObject *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  void (**v60)(id, _QWORD, uint64_t);
  _QWORD v61[4];
  id v62;
  id v63;
  id v64;
  id v65;
  char v66;
  void *v67;
  uint64_t v68;
  id v69;
  uint8_t buf[4];
  uint64_t v71;
  uint64_t v72;
  _QWORD v73[4];

  v73[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v55 = a7;
  v16 = (void (**)(id, _QWORD, uint64_t))a8;
  -[DSArchiveService unarchivingDelegate](self, "unarchivingDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    v18 = a5 | 0x100000;
  else
    v18 = a5;
  if (v14 && v15)
  {
    v66 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "path");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "fileExistsAtPath:isDirectory:", v20, &v66);
    if (v66)
      v22 = v21;
    else
      v22 = 0;

    if ((v22 & 1) == 0)
    {
      v30 = (void *)MEMORY[0x1E0CB35C8];
      v72 = *MEMORY[0x1E0CB3308];
      v73[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, &v72, 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4, v31);
      v32 = objc_claimAutoreleasedReturnValue();

      LogObj(0);
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v71 = v32;
        _os_log_impl(&dword_1CBC4A000, v33, OS_LOG_TYPE_ERROR, "unarchiveItemAtURL: destination doesn't exist or isn't a directory: %@", buf, 0xCu);
      }

      v29 = 0;
      v34 = (void *)v32;
      v16[2](v16, 0, v32);
      goto LABEL_34;
    }
    v65 = 0;
    objc_msgSend((id)objc_opt_class(), "wrapperWithURL:readonly:error:", v14, 0, &v65);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v65;
    v25 = v24;
    v54 = (void *)v23;
    if (v23)
    {
      v52 = v24;
    }
    else
    {
      v64 = v24;
      objc_msgSend((id)objc_opt_class(), "wrapperWithURL:readonly:error:", v14, 1, &v64);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v64;

      if (!v54)
      {
        LogObj(0);
        v48 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v71 = (uint64_t)v52;
          _os_log_impl(&dword_1CBC4A000, v48, OS_LOG_TYPE_ERROR, "unarchiveItemAtURL: Couldn't get url wrapper for item: %@", buf, 0xCu);
        }

        v29 = 0;
        v34 = v52;
        v16[2](v16, 0, (uint64_t)v52);
        goto LABEL_34;
      }
    }
    v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3910]), "initWithURL:readonly:", v15, 0);
    if (v53)
    {
      if (v17)
        v35 = self;
      else
        v35 = 0;
      archiveServiceConnection(v35);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "resume");
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __99__DSArchiveService_unarchiveItemAtURL_toURL_options_acceptedFormats_passphrases_completionHandler___block_invoke;
      v61[3] = &unk_1E8751368;
      v36 = v16;
      v63 = v36;
      v37 = v49;
      v62 = v37;
      objc_msgSend(v37, "remoteObjectProxyWithErrorHandler:", v61);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.ArchiveService"), CFSTR("BackgroundArchive"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_alloc(MEMORY[0x1E0D87C98]);
      objc_msgSend(MEMORY[0x1E0D87DF8], "currentProcess");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = v51;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = (void *)objc_msgSend(v38, "initWithExplanation:target:attributes:", CFSTR("ArchiveServices unarchive operation"), v39, v40);

      objc_msgSend(v41, "acquireWithInvalidationHandler:", &__block_literal_global_58);
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __99__DSArchiveService_unarchiveItemAtURL_toURL_options_acceptedFormats_passphrases_completionHandler___block_invoke_59;
      v56[3] = &unk_1E87513F8;
      v57 = v14;
      v60 = v36;
      v42 = v41;
      v58 = v42;
      v43 = v37;
      v59 = v43;
      objc_msgSend(v50, "unarchiveItemWithURLWrapper:toURLWrapper:options:passphrases:acceptedFormats:completionHandler:", v54, v53, v18, v55, a6, v56);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v44 = (void *)MEMORY[0x1E0CB35C8];
      v68 = *MEMORY[0x1E0CB3308];
      v69 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v69, &v68, 1);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 257, v45);
      v43 = (id)objc_claimAutoreleasedReturnValue();

      LogObj(0);
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v71 = (uint64_t)v43;
        _os_log_impl(&dword_1CBC4A000, v46, OS_LOG_TYPE_ERROR, "unarchiveItemAtURL: Couldn't get url wrapper for destination: %@", buf, 0xCu);
      }

      v29 = 0;
      v16[2](v16, 0, (uint64_t)v43);
    }

    v34 = v52;
LABEL_34:

    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    LogObj(0);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CBC4A000, v27, OS_LOG_TYPE_ERROR, "unarchiveItemAtURL: url is nil", buf, 2u);
    }

  }
  if (!v15)
  {
    LogObj(0);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CBC4A000, v28, OS_LOG_TYPE_ERROR, "unarchiveItemAtURL: destination is nil", buf, 2u);
    }

  }
  v16[2](v16, 0, (uint64_t)v26);

  v29 = 0;
LABEL_35:

  return v29;
}

void __99__DSArchiveService_unarchiveItemAtURL_toURL_options_acceptedFormats_passphrases_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

void __99__DSArchiveService_unarchiveItemAtURL_toURL_options_acceptedFormats_passphrases_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  LogObj(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1CBC4A000, v4, OS_LOG_TYPE_ERROR, "Archive Service unarchive assertion invalidated with error: %@", (uint8_t *)&v5, 0xCu);
  }

}

void __99__DSArchiveService_unarchiveItemAtURL_toURL_options_acceptedFormats_passphrases_completionHandler___block_invoke_59(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  TString v15;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.desktopservices.ArchiveService")))
  {
    v8 = objc_msgSend(v6, "code");

    if (v8 == -1000)
    {
      v9 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(v6, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dictionaryWithDictionary:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      TCFURLInfo::LocalizedStringWithFileName(CFSTR("ArchiveEnterPassword"), *(__CFString **)(a1 + 32), &v15);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v15.fString.fRef, *MEMORY[0x1E0CB2D80]);
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v15.fString.fRef);
      v12 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v6, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, objc_msgSend(v6, "code"), v11);
      v14 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v14;
    }
  }
  else
  {

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "invalidate");
  objc_msgSend(*(id *)(a1 + 48), "invalidate");

}

- (id)archiveItemsWithURLs:(id)a3 compressionFormat:(unint64_t)a4 destinationFolderURL:(id)a5 completionHandler:(id)a6
{
  -[DSArchiveService archiveItemsWithURLs:passphrase:addToKeychain:compressionFormat:destinationFolderURL:completionHandler:](self, "archiveItemsWithURLs:passphrase:addToKeychain:compressionFormat:destinationFolderURL:completionHandler:", a3, 0, 0, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)archiveItemsWithURLs:(id)a3 passphrase:(id)a4 addToKeychain:(BOOL)a5 compressionFormat:(unint64_t)a6 destinationFolderURL:(id)a7 completionHandler:(id)a8
{
  _BOOL4 v11;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  _BOOL4 v30;
  unint64_t v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _QWORD v46[4];
  id v47;
  id v48;
  uint8_t buf[4];
  id v50;
  _BYTE v51[128];
  uint64_t v52;

  v11 = a5;
  v52 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v34 = a4;
  v36 = a7;
  v33 = a8;
  archiveServiceConnection(0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "resume");
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __123__DSArchiveService_archiveItemsWithURLs_passphrase_addToKeychain_compressionFormat_destinationFolderURL_completionHandler___block_invoke;
  v46[3] = &unk_1E8751368;
  v13 = v33;
  v48 = v13;
  v14 = v32;
  v47 = v14;
  objc_msgSend(v14, "remoteObjectProxyWithErrorHandler:", v46);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v37, "count");
  if (v36 && v15)
  {
    v30 = v11;
    v31 = a6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v37, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v17 = v37;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v43;
      while (2)
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v43 != v19)
            objc_enumerationMutation(v17);
          v21 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v20);
          v22 = (void *)objc_opt_class();
          v41 = 0;
          objc_msgSend(v22, "wrapperWithURL:readonly:error:", v21, 1, &v41);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v41;
          if (!v23)
          {
            LogObj(0);
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v50 = v24;
              _os_log_impl(&dword_1CBC4A000, v28, OS_LOG_TYPE_ERROR, "archiveItemsWithURLs: Couldn't get url wrapper: %@", buf, 0xCu);
            }

            (*((void (**)(id, _QWORD, _QWORD, id))v13 + 2))(v13, 0, 0, v24);
            objc_msgSend(v14, "invalidate");
            v25 = 0;
            goto LABEL_24;
          }
          objc_msgSend(v16, "addObject:", v23);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
        if (v18)
          continue;
        break;
      }
    }

    v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3910]), "initWithURL:readonly:", v36, 0);
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __123__DSArchiveService_archiveItemsWithURLs_passphrase_addToKeychain_compressionFormat_destinationFolderURL_completionHandler___block_invoke_63;
    v38[3] = &unk_1E8751420;
    v40 = v13;
    v39 = v14;
    objc_msgSend(v35, "archiveItemsWithURLWrappers:passphrase:addToKeychain:compressionFormat:destinationFolderURLWrapper:usePlaceholder:completionHandler:", v16, v34, v30, v31, v17, 0, v38);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v40;
LABEL_24:

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v37, "count"))
    {
      LogObj(0);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CBC4A000, v26, OS_LOG_TYPE_ERROR, "archiveItemsWithURLs: no urls", buf, 2u);
      }

    }
    if (!v36)
    {
      LogObj(0);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CBC4A000, v27, OS_LOG_TYPE_ERROR, "archiveItemsWithURLs: destination is nil", buf, 2u);
      }

    }
    (*((void (**)(id, _QWORD, _QWORD, void *))v13 + 2))(v13, 0, 0, v16);
    objc_msgSend(v14, "invalidate");
    v25 = 0;
  }

  return v25;
}

void __123__DSArchiveService_archiveItemsWithURLs_passphrase_addToKeychain_compressionFormat_destinationFolderURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

void __123__DSArchiveService_archiveItemsWithURLs_passphrase_addToKeychain_compressionFormat_destinationFolderURL_completionHandler___block_invoke_63(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v11, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id, id))(v9 + 16))(v9, v10, v7, v8);

  objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (id)unarchiveItemAtURL:(id)a3 passphrase:(id)a4 destinationFolderURL:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v11)
  {
    v17[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  -[DSArchiveService unarchiveItemAtURL:passphrases:addToKeychain:destinationFolderURL:acceptedFormats:completionHandler:](self, "unarchiveItemAtURL:passphrases:addToKeychain:destinationFolderURL:acceptedFormats:completionHandler:", v10, v14, 0, v12, 1, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)

  return v15;
}

- (id)unarchiveItemAtURL:(id)a3 passphrases:(id)a4 destinationFolderURL:(id)a5 completionHandler:(id)a6
{
  -[DSArchiveService unarchiveItemAtURL:passphrases:addToKeychain:destinationFolderURL:acceptedFormats:completionHandler:](self, "unarchiveItemAtURL:passphrases:addToKeychain:destinationFolderURL:acceptedFormats:completionHandler:", a3, a4, 0, a5, 1, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)unarchiveItemAtURL:(id)a3 passphrases:(id)a4 destinationFolderURL:(id)a5 acceptedFormats:(unint64_t)a6 completionHandler:(id)a7
{
  -[DSArchiveService unarchiveItemAtURL:passphrases:addToKeychain:destinationFolderURL:acceptedFormats:completionHandler:](self, "unarchiveItemAtURL:passphrases:addToKeychain:destinationFolderURL:acceptedFormats:completionHandler:", a3, a4, 0, a5, a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)unarchiveItemAtURL:(id)a3 passphrases:(id)a4 addToKeychain:(BOOL)a5 destinationFolderURL:(id)a6 acceptedFormats:(unint64_t)a7 completionHandler:(id)a8
{
  _BOOL8 v11;
  id v14;
  id v15;
  void *v16;
  DSArchiveService *v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  uint64_t v49;
  id v50;
  uint8_t buf[4];
  id v52;
  uint64_t v53;

  v11 = a5;
  v53 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v37 = a4;
  v39 = a6;
  v15 = a8;
  -[DSArchiveService unarchivingDelegate](self, "unarchivingDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v17 = self;
  else
    v17 = 0;
  archiveServiceConnection(v17);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "resume");
  v18 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __120__DSArchiveService_unarchiveItemAtURL_passphrases_addToKeychain_destinationFolderURL_acceptedFormats_completionHandler___block_invoke;
  v46[3] = &unk_1E8751368;
  v19 = v15;
  v48 = v19;
  v20 = v36;
  v47 = v20;
  objc_msgSend(v20, "remoteObjectProxyWithErrorHandler:", v46);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14 || !v39)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      LogObj(0);
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CBC4A000, v25, OS_LOG_TYPE_ERROR, "unarchiveItemAtURL: url is nil", buf, 2u);
      }

    }
    if (!v39)
    {
      LogObj(0);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CBC4A000, v26, OS_LOG_TYPE_ERROR, "unarchiveItemAtURL: destination is nil", buf, 2u);
      }

    }
    (*((void (**)(id, _QWORD, id))v19 + 2))(v19, 0, v24);
    objc_msgSend(v20, "invalidate");
    goto LABEL_17;
  }
  v45 = 0;
  objc_msgSend((id)objc_opt_class(), "wrapperWithURL:readonly:error:", v14, 0, &v45);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v45;
  v23 = v22;
  if (!v21)
  {
    v44 = v22;
    objc_msgSend((id)objc_opt_class(), "wrapperWithURL:readonly:error:", v14, 1, &v44);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v44;

    if (v21)
      goto LABEL_19;
    LogObj(0);
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v24;
      _os_log_impl(&dword_1CBC4A000, v34, OS_LOG_TYPE_ERROR, "unarchiveItemAtURL: Couldn't get url wrapper for item: %@", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD, id))v19 + 2))(v19, 0, v24);
    objc_msgSend(v20, "invalidate");
LABEL_17:
    v27 = 0;
    goto LABEL_25;
  }
  v24 = v22;
LABEL_19:
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3910]), "initWithURL:readonly:", v39, 0);
  if (v28)
  {
    v40[0] = v18;
    v40[1] = 3221225472;
    v40[2] = __120__DSArchiveService_unarchiveItemAtURL_passphrases_addToKeychain_destinationFolderURL_acceptedFormats_completionHandler___block_invoke_65;
    v40[3] = &unk_1E8751448;
    v41 = v14;
    v43 = v19;
    v42 = v20;
    LOBYTE(v35) = 0;
    objc_msgSend(v38, "unarchiveItemWithURLWrapper:passphrases:addToKeychain:destinationFolderURLWrapper:acceptedFormats:exportsStreamingReceiver:usePlaceholder:completionHandler:", v21, v37, v11, v28, a7, v16 != 0, v35, v40);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = v41;
  }
  else
  {
    v30 = (void *)MEMORY[0x1E0CB35C8];
    v49 = *MEMORY[0x1E0CB3308];
    v50 = v39;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 257, v31);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    LogObj(0);
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v29;
      _os_log_impl(&dword_1CBC4A000, v32, OS_LOG_TYPE_ERROR, "unarchiveItemAtURL: Couldn't get url wrapper for destination: %@", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD, void *))v19 + 2))(v19, 0, v29);
    objc_msgSend(v20, "invalidate");
    v27 = 0;
  }

LABEL_25:
  return v27;
}

void __120__DSArchiveService_unarchiveItemAtURL_passphrases_addToKeychain_destinationFolderURL_acceptedFormats_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "invalidate");

}

void __120__DSArchiveService_unarchiveItemAtURL_passphrases_addToKeychain_destinationFolderURL_acceptedFormats_completionHandler___block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  TString v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.desktopservices.ArchiveService")))
  {
    v8 = objc_msgSend(v6, "code");

    if (v8 == -1000)
    {
      v9 = (void *)MEMORY[0x1E0C99E08];
      objc_msgSend(v6, "userInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dictionaryWithDictionary:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      TCFURLInfo::LocalizedStringWithFileName(CFSTR("ArchiveEnterPassword"), *(__CFString **)(a1 + 32), &v16);
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v16.fString.fRef, *MEMORY[0x1E0CB2D80]);
      TRef<__CFString const*,TRetainReleasePolicy<__CFString const*>>::~TRef((const void **)&v16.fString.fRef);
      v12 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v6, "domain");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, objc_msgSend(v6, "code"), v11);
      v14 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v14;
    }
  }
  else
  {

  }
  objc_msgSend(v5, "url");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 40), "invalidate");

}

- (void)receiveArchivedItemsDescriptors:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[DSArchiveService unarchivingDelegate](self, "unarchivingDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "service:didReceiveArchivedItemsDescriptors:", self, v5);

}

- (DSArchiveServiceUnarchivingDelegate)unarchivingDelegate
{
  return (DSArchiveServiceUnarchivingDelegate *)objc_loadWeakRetained((id *)&self->_unarchivingDelegate);
}

- (void)setUnarchivingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_unarchivingDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_unarchivingDelegate);
}

@end
