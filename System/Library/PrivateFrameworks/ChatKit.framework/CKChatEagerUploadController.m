@implementation CKChatEagerUploadController

- (CKChatEagerUploadController)init
{
  CKChatEagerUploadController *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *identifierMap;
  NSMutableArray *v5;
  NSMutableArray *uploadUrls;
  NSMutableDictionary *v7;
  NSMutableDictionary *temporaryURLS;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKChatEagerUploadController;
  v2 = -[CKChatEagerUploadController init](&v10, sel_init);
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  identifierMap = v2->_identifierMap;
  v2->_identifierMap = v3;

  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  uploadUrls = v2->_uploadUrls;
  v2->_uploadUrls = v5;

  v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  temporaryURLS = v2->_temporaryURLS;
  v2->_temporaryURLS = v7;

  return v2;
}

- (void)removeTemporaryURLForURL:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_temporaryURLS, "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeItemAtURL:error:", v4, 0);

  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_temporaryURLS, "setObject:forKeyedSubscript:", 0, v6);

}

- (void)didSendComposition
{
  -[NSMutableArray removeAllObjects](self->_uploadUrls, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_identifierMap, "removeAllObjects");
}

- (void)cancelAll
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableArray copy](self->_uploadUrls, "copy");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[CKChatEagerUploadController cancelURL:](self, "cancelURL:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)cancelIdentifier:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary objectForKeyedSubscript:](self->_identifierMap, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[CKChatEagerUploadController cancelURL:](self, "cancelURL:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)cancelURL:(id)a3
{
  id v4;
  NSMutableDictionary *identifierMap;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v10 = a3;
  if (objc_msgSend(MEMORY[0x1E0D39730], "IMIsEagerUploadEnabledForPhoneNumber:simID:", 0, 0))
  {
    -[NSMutableArray removeObject:](self->_uploadUrls, "removeObject:", v10);
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    identifierMap = self->_identifierMap;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __41__CKChatEagerUploadController_cancelURL___block_invoke;
    v11[3] = &unk_1E275A820;
    v6 = v10;
    v12 = v6;
    v13 = v4;
    v7 = v4;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](identifierMap, "enumerateKeysAndObjectsUsingBlock:", v11);
    -[NSMutableDictionary removeObjectsForKeys:](self->_identifierMap, "removeObjectsForKeys:", v7);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_temporaryURLS, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "eagerUploadCancel:", v8);

    -[CKChatEagerUploadController removeTemporaryURLForURL:](self, "removeTemporaryURLForURL:", v6);
  }

}

void __41__CKChatEagerUploadController_cancelURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "containsObject:", *(_QWORD *)(a1 + 32)))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

- (id)_newTransferForURL:(id)a3 transcoderUserInfo:(id)a4 attributionInfo:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t v21;
  uint64_t v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0D36A38], "defaultHFSFileManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v11 = objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v10, "attributesOfItemAtPath:error:", v11, &v22);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0CB2B18]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_msgSend(v13, "isEqual:", *MEMORY[0x1E0CB2B20]);

  v14 = 0;
  if ((v11 & 1) == 0)
  {
    v15 = objc_alloc(MEMORY[0x1E0D39848]);
    objc_msgSend(v7, "lastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v12, "fileSize");
    v18 = objc_msgSend(v12, "fileHFSTypeCode");
    v19 = objc_msgSend(v12, "fileHFSCreatorCode");
    BYTE2(v21) = 0;
    LOWORD(v21) = objc_msgSend(v12, "fileHFSFlags");
    v14 = (void *)objc_msgSend(v15, "_initWithGUID:filename:isDirectory:localURL:account:otherPerson:totalBytes:hfsType:hfsCreator:hfsFlags:isIncoming:", CFSTR("EAGER"), v16, 0, v7, 0, 0, v17, __PAIR64__(v19, v18), v21);

    objc_msgSend(v14, "setTranscoderUserInfo:", v8);
    objc_msgSend(v14, "setAttributionInfo:", v9);
  }

  return v14;
}

- (void)uploadPayload:(id)a3 identifier:(id)a4 replace:(BOOL)a5 recipients:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v7 = a5;
  v22 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (objc_msgSend(MEMORY[0x1E0D39730], "IMIsEagerUploadEnabledForPhoneNumber:simID:", 0, 0)
    && (objc_msgSend(v10, "isSticker") & 1) == 0
    && (objc_msgSend(v10, "shouldSendAsRichLink") & 1) == 0)
  {
    objc_msgSend(v10, "fileURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v19 = v13;
        v20 = 2112;
        v21 = v12;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Eager Upload Payload at URL %@ recipients %@", buf, 0x16u);
      }

    }
    if (v7)
      -[CKChatEagerUploadController cancelAll](self, "cancelAll");
    if (v13)
    {
      objc_msgSend(v10, "transcoderUserInfo");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "videoComplementFileURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "attributionInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKChatEagerUploadController _uploadFileURL:filename:transcoderUserInfo:videoComplementURL:attributionInfo:identifier:recipients:](self, "_uploadFileURL:filename:transcoderUserInfo:videoComplementURL:attributionInfo:identifier:recipients:", v13, 0, v15, v16, v17, v11, v12);

    }
  }

}

- (void)uploadFileURL:(id)a3 filename:(id)a4 transcoderUserInfo:(id)a5 videoComplementURL:(id)a6 attributionInfo:(id)a7 identifier:(id)a8 recipients:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v15;
      v25 = 2112;
      v26 = v21;
      _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "Eager Upload url %@ recipients %@", buf, 0x16u);
    }

  }
  -[CKChatEagerUploadController cancelAll](self, "cancelAll");
  -[CKChatEagerUploadController _uploadFileURL:filename:transcoderUserInfo:videoComplementURL:attributionInfo:identifier:recipients:](self, "_uploadFileURL:filename:transcoderUserInfo:videoComplementURL:attributionInfo:identifier:recipients:", v15, v16, v17, v18, v19, v20, v21);

}

- (void)_uploadFileURL:(id)a3 filename:(id)a4 transcoderUserInfo:(id)a5 videoComplementURL:(id)a6 attributionInfo:(id)a7 identifier:(id)a8 recipients:(id)a9
{
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  NSObject *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  _QWORD v46[5];
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint8_t buf[16];
  uint64_t v57;
  _QWORD v58[3];

  v58[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v32 = a4;
  v33 = a5;
  v34 = a6;
  v35 = a7;
  v36 = a8;
  v37 = a9;
  if (v15)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v15, "lastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    CKAttachmentTmpFileURL(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __131__CKChatEagerUploadController__uploadFileURL_filename_transcoderUserInfo_videoComplementURL_attributionInfo_identifier_recipients___block_invoke;
    v46[3] = &unk_1E275A848;
    v46[4] = self;
    v47 = v15;
    v48 = v18;
    v49 = v33;
    v19 = v35;
    v50 = v19;
    v20 = v32;
    v51 = v20;
    v21 = v34;
    v52 = v21;
    v30 = v16;
    v53 = v30;
    v22 = v37;
    v54 = v22;
    v23 = v36;
    v55 = v23;
    v31 = v48;
    -[CKChatEagerUploadController asyncCopyFileAtURL:toDestinationURL:completion:](self, "asyncCopyFileAtURL:toDestinationURL:completion:", v47, v48, v46);
    if (v21)
    {
      v57 = *MEMORY[0x1E0D37EB8];
      v58[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1, v30);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "lastPathComponent");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      CKAttachmentTmpFileURL(v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __131__CKChatEagerUploadController__uploadFileURL_filename_transcoderUserInfo_videoComplementURL_attributionInfo_identifier_recipients___block_invoke_2;
      v38[3] = &unk_1E275A870;
      v38[4] = self;
      v39 = v26;
      v40 = v24;
      v41 = v19;
      v42 = v20;
      v43 = v22;
      v44 = v21;
      v45 = v23;
      v27 = v24;
      v28 = v26;
      -[CKChatEagerUploadController asyncCopyFileAtURL:toDestinationURL:completion:](self, "asyncCopyFileAtURL:toDestinationURL:completion:", v44, v28, v38);

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v29, OS_LOG_TYPE_INFO, "_uploadFileURL fileURL is nil", buf, 2u);
    }

  }
}

void __131__CKChatEagerUploadController__uploadFileURL_filename_transcoderUserInfo_videoComplementURL_attributionInfo_identifier_recipients___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newTransferForURL:transcoderUserInfo:attributionInfo:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  if (v2)
  {
    v5 = v2;
    if (*(_QWORD *)(a1 + 72))
      objc_msgSend(v2, "setFilename:");
    if (*(_QWORD *)(a1 + 80))
      objc_msgSend(v5, "setIsAuxImage:", 1);
    objc_msgSend(*(id *)(a1 + 88), "addObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_dictionaryRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "eagerUploadTransfer:recipients:", v4, *(_QWORD *)(a1 + 96));

    objc_msgSend(*(id *)(a1 + 32), "addURLToIdentifierMap:forIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 104));
    v2 = v5;
  }

}

void __131__CKChatEagerUploadController__uploadFileURL_filename_transcoderUserInfo_videoComplementURL_attributionInfo_identifier_recipients___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_newTransferForURL:transcoderUserInfo:attributionInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  if (v2)
  {
    v5 = v2;
    objc_msgSend(v2, "setIsAuxVideo:", 1);
    if (*(_QWORD *)(a1 + 64))
      objc_msgSend(v5, "setFilename:");
    objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_dictionaryRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "eagerUploadTransfer:recipients:", v4, *(_QWORD *)(a1 + 72));

    objc_msgSend(*(id *)(a1 + 32), "addURLToIdentifierMap:forIdentifier:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 80));
    v2 = v5;
  }

}

- (void)addURLToIdentifierMap:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_identifierMap, "objectForKeyedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "addObject:", v6);
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0C99DE8];
      v14[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "arrayWithArray:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_identifierMap, "setObject:forKeyedSubscript:", v13, v8);

    }
  }

}

- (void)asyncCopyFileAtURL:(id)a3 toDestinationURL:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  dispatch_get_global_queue(-2, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__CKChatEagerUploadController_asyncCopyFileAtURL_toDestinationURL_completion___block_invoke;
  block[3] = &unk_1E274CC10;
  v15 = v8;
  v16 = v7;
  v17 = v9;
  v11 = v9;
  v12 = v7;
  v13 = v8;
  dispatch_async(v10, block);

}

void __78__CKChatEagerUploadController_asyncCopyFileAtURL_toDestinationURL_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v4 = objc_msgSend(v2, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v16);
  v5 = v16;
  if ((v4 & 1) == 0 && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v5;
      v19 = 2112;
      v20 = v3;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "Failed to create copy destinaton directory {error: %@, directory: %@}", buf, 0x16u);
    }

  }
  if (!v5)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v15 = 0;
    v9 = objc_msgSend(v2, "copyItemAtURL:toURL:error:", v7, v8, &v15);
    v5 = v15;
    if ((v9 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v12 = *(void **)(a1 + 32);
          v11 = *(void **)(a1 + 40);
          *(_DWORD *)buf = 138412802;
          v18 = v11;
          v19 = 2112;
          v20 = v12;
          v21 = 2112;
          v22 = v5;
          _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Failed to copy file %@ to destinaton %@ with error: %@", buf, 0x20u);
        }

      }
    }
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__CKChatEagerUploadController_asyncCopyFileAtURL_toDestinationURL_completion___block_invoke_33;
  block[3] = &unk_1E274AED0;
  v14 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __78__CKChatEagerUploadController_asyncCopyFileAtURL_toDestinationURL_completion___block_invoke_33(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (NSMutableDictionary)identifierMap
{
  return self->_identifierMap;
}

- (void)setIdentifierMap:(id)a3
{
  objc_storeStrong((id *)&self->_identifierMap, a3);
}

- (NSMutableArray)uploadUrls
{
  return self->_uploadUrls;
}

- (void)setUploadUrls:(id)a3
{
  objc_storeStrong((id *)&self->_uploadUrls, a3);
}

- (NSMutableDictionary)temporaryURLS
{
  return self->_temporaryURLS;
}

- (void)setTemporaryURLS:(id)a3
{
  objc_storeStrong((id *)&self->_temporaryURLS, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryURLS, 0);
  objc_storeStrong((id *)&self->_uploadUrls, 0);
  objc_storeStrong((id *)&self->_identifierMap, 0);
}

@end
