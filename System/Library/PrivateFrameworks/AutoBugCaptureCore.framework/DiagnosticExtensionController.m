@implementation DiagnosticExtensionController

- (DiagnosticExtensionController)initWithDestinationDirectory:(id)a3
{
  id v5;
  DiagnosticExtensionController *v6;
  DiagnosticExtensionController *v7;
  NSDateFormatter *v8;
  NSDateFormatter *dateFormatter;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DiagnosticExtensionController;
  v6 = -[DiagnosticExtensionController init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_destinationRootDirectory, a3);
    v8 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatter = v7->dateFormatter;
    v7->dateFormatter = v8;

    -[NSDateFormatter setDateFormat:](v7->dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd_HHmmss"));
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.autobugcapture.diagnosticExtension", v10);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v11;

  }
  return v7;
}

- (void)collectDEPayloadsWithIdentifier:(id)a3 diagnosticExtensions:(id)a4 queue:(id)a5 reply:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  DiagnosticExtensionController *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v20 = self;
  v27 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v17);
        objc_msgSend(MEMORY[0x1E0C99E38], "null", v20);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v15);
  }

  -[DiagnosticExtensionController collectDEPayloadsWithIdentifier:diagnosticExtensionsWithParameters:queue:reply:](v20, "collectDEPayloadsWithIdentifier:diagnosticExtensionsWithParameters:queue:reply:", v21, v12, v10, v11);
}

- (void)collectDEPayloadsWithIdentifier:(id)a3 diagnosticExtensionsWithParameters:(id)a4 queue:(id)a5 reply:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  void *v14;
  NSDateFormatter *dateFormatter;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  _QWORD block[4];
  id v24;
  id v25;
  _QWORD v26[5];
  id v27;
  id v28;
  NSObject *v29;
  id v30;
  _QWORD *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[4];
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v36 = objc_msgSend(v11, "count");
  dateFormatter = self->dateFormatter;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingFormat:", CFSTR("-%@"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  diagextLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v20 = objc_msgSend(v11, "count");
    objc_msgSend(v11, "allKeys");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v39 = v20;
    v40 = 2112;
    v41 = v21;
    _os_log_impl(&dword_1DBAE1000, v19, OS_LOG_TYPE_DEFAULT, "Calling %ld DEs: %@", buf, 0x16u);

  }
  if (v34[3])
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __112__DiagnosticExtensionController_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke;
    v26[3] = &unk_1EA3B5210;
    v26[4] = self;
    v27 = v14;
    v31 = v37;
    v28 = v18;
    v32 = &v33;
    v30 = v13;
    v29 = v12;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v26);

  }
  else
  {
    diagextLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DBAE1000, v22, OS_LOG_TYPE_DEFAULT, "List of DiagnosticExtensions to call was empty", buf, 2u);
    }

    if (v13)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __112__DiagnosticExtensionController_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_72;
      block[3] = &unk_1EA3B4A28;
      v25 = v13;
      v24 = v14;
      dispatch_async(v12, block);

    }
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(v37, 8);

}

void __112__DiagnosticExtensionController_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v8 = v6;
    else
      v8 = 0;
    diagextLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v7;
      _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_INFO, "Ready to call DE %@", buf, 0xCu);
    }

    v10 = *(void **)(a1 + 40);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[2] = __112__DiagnosticExtensionController_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_60;
    v17[3] = &unk_1EA3B51E8;
    v17[1] = 3221225472;
    v18 = v7;
    v12 = v10;
    v13 = *(_QWORD *)(a1 + 72);
    v19 = v12;
    v24 = v13;
    v14 = *(id *)(a1 + 48);
    v15 = *(_QWORD *)(a1 + 32);
    v20 = v14;
    v21 = v15;
    v25 = *(_QWORD *)(a1 + 80);
    v23 = *(id *)(a1 + 64);
    v22 = *(id *)(a1 + 56);
    v16 = v7;
    +[DiagnosticExtensionCaller getAttachmentsFrom:forBundleID:withParameters:queue:reply:](DiagnosticExtensionCaller, "getAttachmentsFrom:forBundleID:withParameters:queue:reply:", v16, 0, v8, v11, v17);

  }
}

void __112__DiagnosticExtensionController_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  uint64_t i;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  _BOOL4 v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  NSObject *v62;
  uint64_t v63;
  NSObject *v64;
  NSObject *v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  id v70;
  id v71;
  void *v72;
  void *v73;
  id obj;
  uint64_t v75;
  uint64_t v76;
  char v77;
  _QWORD block[4];
  id v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD aBlock[4];
  id v86;
  void *v87;
  uint8_t buf[4];
  uint64_t v89;
  __int16 v90;
  uint64_t v91;
  __int16 v92;
  void *v93;
  __int16 v94;
  void *v95;
  __int16 v96;
  void *v97;
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  diagextLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v10)
    {
      *(_DWORD *)buf = 138412546;
      v89 = (uint64_t)v7;
      v90 = 2048;
      v91 = objc_msgSend(v5, "count");
      _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_INFO, "Reply for DE %@, with %ld attachments", buf, 0x16u);
    }
LABEL_10:

    goto LABEL_11;
  }
  if (v10)
  {
    *(_DWORD *)buf = 138412546;
    v89 = (uint64_t)v7;
    v90 = 2112;
    v91 = (uint64_t)v6;
    _os_log_impl(&dword_1DBAE1000, v9, OS_LOG_TYPE_INFO, "Reply for DE %@, with error:%@", buf, 0x16u);
  }

  if (objc_msgSend(v6, "code") == 45)
  {
    diagextLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v89 = (uint64_t)v7;
      _os_log_impl(&dword_1DBAE1000, v11, OS_LOG_TYPE_DEBUG, "DE %@ is not available on this device. Marking as not required.", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 32));
    goto LABEL_10;
  }
LABEL_11:
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __112__DiagnosticExtensionController_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_62;
  aBlock[3] = &unk_1EA3B51C0;
  v13 = v12;
  v86 = v13;
  v14 = _Block_copy(aBlock);
  v72 = v5;
  v73 = v14;
  if (objc_msgSend(v5, "count"))
  {
    diagextLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = objc_msgSend(v5, "count");
      *(_DWORD *)buf = 134218242;
      v89 = v16;
      v90 = 2112;
      v91 = (uint64_t)v7;
      _os_log_impl(&dword_1DBAE1000, v15, OS_LOG_TYPE_INFO, "Processing %ld attachments from %@", buf, 0x16u);
    }
    v68 = v13;
    v69 = a1;
    v70 = v7;
    v71 = v6;

    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    obj = v5;
    v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v98, 16);
    v17 = 0;
    if (v76)
    {
      v77 = 0;
      v75 = *(_QWORD *)v82;
      do
      {
        for (i = 0; i != v76; ++i)
        {
          if (*(_QWORD *)v82 != v75)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
          diagextLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v19, "deleteOnAttach");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "shouldCompress");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "modificationDate");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "filesize");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v89 = (uint64_t)v19;
            v90 = 2112;
            v91 = (uint64_t)v21;
            v92 = 2112;
            v93 = v22;
            v94 = 2112;
            v95 = v23;
            v96 = 2112;
            v97 = v24;
            _os_log_impl(&dword_1DBAE1000, v20, OS_LOG_TYPE_INFO, "Processing %@ (deleteOnAttach:%@, shouldCompress:%@, modificationDate:%@, fileSize:%@)", buf, 0x34u);

          }
          if (v17)
          {
            objc_msgSend(v19, "modificationDate");
            v25 = objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              v26 = (void *)v25;
              objc_msgSend(v17, "modificationDate");
              v27 = (void *)objc_claimAutoreleasedReturnValue();

              if (v27)
              {
                objc_msgSend(v17, "modificationDate");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "modificationDate");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v28, "compare:", v29);

                if (v30 == -1)
                {
                  v31 = v19;

                  v17 = v31;
                }
              }
            }
          }
          else
          {
            v17 = v19;
          }
          objc_msgSend(v19, "path");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (v32)
          {
            if ((v77 & 1) != 0)
            {
              v77 = 1;
            }
            else
            {
              objc_msgSend(v19, "deleteOnAttach");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v77 = objc_msgSend(v33, "BOOLValue");

            }
            objc_msgSend(v19, "path");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "path");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "length");

            if (v36)
            {
              (*((void (**)(void *, void *))v14 + 2))(v14, v19);
              objc_msgSend(v34, "path");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v37);

              diagextLogHandle();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v19, "deleteOnAttach");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "shouldCompress");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "modificationDate");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "filesize");
                v42 = v8;
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138413314;
                v89 = (uint64_t)v19;
                v90 = 2112;
                v91 = (uint64_t)v39;
                v92 = 2112;
                v93 = v40;
                v94 = 2112;
                v95 = v41;
                v96 = 2112;
                v97 = v43;
                _os_log_impl(&dword_1DBAE1000, v38, OS_LOG_TYPE_INFO, "Adding to archive: %@ (deleteOnAttach:%@, shouldCompress:%@, modificationDate:%@, fileSize:%@)", buf, 0x34u);

                v8 = v42;
                v14 = v73;

              }
            }
            else
            {
              diagextLogHandle();
              v38 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1DBAE1000, v38, OS_LOG_TYPE_INFO, "Attachment did not have a path we could successfully determine.", buf, 2u);
              }
            }

          }
        }
        v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v98, 16);
      }
      while (v76);
    }
    else
    {
      v77 = 0;
    }

    v44 = v77 & 1;
    v7 = v70;
    v6 = v71;
    v13 = v68;
    a1 = v69;
  }
  else
  {
    v44 = 0;
  }
  if (objc_msgSend(v8, "count"))
  {
    diagextLogHandle();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v89 = (uint64_t)v8;
      _os_log_impl(&dword_1DBAE1000, v45, OS_LOG_TYPE_INFO, "Preparing to create archives with: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 48), "stringByAppendingFormat:", CFSTR("-%@"), *(_QWORD *)(a1 + 32));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "destinationRootDirectory");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "stringByAppendingPathComponent:", v46);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    diagextLogHandle();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 134218242;
      v89 = v50;
      v90 = 2112;
      v91 = (uint64_t)v48;
      _os_log_impl(&dword_1DBAE1000, v49, OS_LOG_TYPE_DEFAULT, "Creating archive with %ld files at: %@", buf, 0x16u);
    }

    objc_msgSend(v8, "allObjects");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    +[FileArchiver archiveWithPaths:destinationDir:deleteSource:](FileArchiver, "archiveWithPaths:destinationDir:deleteSource:", v51, v48, v44);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = objc_msgSend(v52, "length");
    diagextLogHandle();
    v54 = objc_claimAutoreleasedReturnValue();
    v55 = os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT);
    if (v53)
    {
      if (v55)
      {
        *(_DWORD *)buf = 138412290;
        v89 = (uint64_t)v46;
        _os_log_impl(&dword_1DBAE1000, v54, OS_LOG_TYPE_DEFAULT, "Archive creation for %@ was successful.", buf, 0xCu);
      }

      v87 = v52;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v87, 1);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v56, *(_QWORD *)(a1 + 32));

    }
    else
    {
      if (v55)
      {
        *(_DWORD *)buf = 138412290;
        v89 = (uint64_t)v46;
        _os_log_impl(&dword_1DBAE1000, v54, OS_LOG_TYPE_DEFAULT, "Archive creation for %@ failed.", buf, 0xCu);
      }

      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 32));
    }

  }
  diagextLogHandle();
  v57 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
  {
    v58 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    v59 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    *(_DWORD *)buf = 134218240;
    v89 = v58;
    v90 = 2048;
    v91 = v59;
    _os_log_impl(&dword_1DBAE1000, v57, OS_LOG_TYPE_DEFAULT, "Received %ld DE results. (expecting %ld total)", buf, 0x16u);
  }

  v60 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
  v61 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
  if (v60 >= v61)
  {
    if (*(_QWORD *)(a1 + 72))
    {
      diagextLogHandle();
      v62 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        v63 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v89 = v63;
        _os_log_impl(&dword_1DBAE1000, v62, OS_LOG_TYPE_INFO, "Calling reply block with resultDict %@.", buf, 0xCu);
      }

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __112__DiagnosticExtensionController_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_68;
      block[3] = &unk_1EA3B4A28;
      v64 = *(NSObject **)(a1 + 64);
      v80 = *(id *)(a1 + 72);
      v79 = *(id *)(a1 + 40);
      dispatch_async(v64, block);

      v60 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
      v61 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
    }
    if (v60 > v61)
    {
      diagextLogHandle();
      v65 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
      {
        v66 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
        v67 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
        *(_DWORD *)buf = 134218240;
        v89 = v66;
        v90 = 2048;
        v91 = v67;
        _os_log_impl(&dword_1DBAE1000, v65, OS_LOG_TYPE_ERROR, "How did we get more than %ld results??? (counted %ld)", buf, 0x16u);
      }

    }
  }

}

void __112__DiagnosticExtensionController_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_62(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0;
  objc_msgSend(v3, "sandboxExtensionHandleWithErrorOut:", &v12);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v12;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }
  else
  {
    diagextLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedDescription");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = CFSTR("Unknown");
      if (v9)
        v11 = (const __CFString *)v9;
      *(_DWORD *)buf = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_1DBAE1000, v6, OS_LOG_TYPE_ERROR, "Could not consume extension handle for item with path '%@' due to error: %@", buf, 0x16u);

    }
  }

}

uint64_t __112__DiagnosticExtensionController_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_68(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __112__DiagnosticExtensionController_collectDEPayloadsWithIdentifier_diagnosticExtensionsWithParameters_queue_reply___block_invoke_72(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (NSString)destinationRootDirectory
{
  return self->_destinationRootDirectory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationRootDirectory, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->dateFormatter, 0);
}

@end
