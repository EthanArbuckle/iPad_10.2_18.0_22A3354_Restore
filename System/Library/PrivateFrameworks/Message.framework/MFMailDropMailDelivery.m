@implementation MFMailDropMailDelivery

- (id)scaledImages:(id)a3
{
  return a3;
}

- (BOOL)updateMessageWithAttachmentsSynchronously
{
  return 0;
}

- (id)_attachmentManager
{
  MFAttachmentLibraryManager *v2;
  MFAttachmentLibraryManager *v3;
  void *v4;

  +[MFAttachmentManager defaultManager](MFAttachmentManager, "defaultManager");
  v2 = (MFAttachmentLibraryManager *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = [MFAttachmentLibraryManager alloc];
    +[MFMailMessageLibrary defaultInstance](MFMailMessageLibrary, "defaultInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = -[MFAttachmentLibraryManager initWithPrimaryLibrary:](v3, "initWithPrimaryLibrary:", v4);

  }
  return v2;
}

- (NSArray)attachments
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *attachments;
  NSArray *mixedContent;
  NSArray *v18;
  void *v19;
  NSArray *v20;
  NSArray *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!self->_attachments)
  {
    if (self->super._message)
    {
      -[MFOutgoingMessageDelivery message](self, "message");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "messageBody");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "attachmentURLs");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      -[MFMailDropMailDelivery _attachmentManager](self, "_attachmentManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "attachmentsForURLs:error:", v5, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v8 = v7;
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v24 != v10)
              objc_enumerationMutation(v8);
            v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            objc_msgSend(v12, "placeholder", (_QWORD)v23);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              objc_msgSend(v12, "placeholder");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "contentID");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "setContentID:", v15);

            }
          }
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v9);
      }

      attachments = self->_attachments;
      self->_attachments = v8;

    }
    else
    {
      mixedContent = self->super._mixedContent;
      if (mixedContent || (mixedContent = self->super._otherHTMLAndAttachments) != 0)
      {
        v18 = mixedContent;
        -[NSArray indexesOfObjectsPassingTest:](v18, "indexesOfObjectsPassingTest:", &__block_literal_global_40);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray objectsAtIndexes:](v18, "objectsAtIndexes:", v19);
        v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
        v21 = self->_attachments;
        self->_attachments = v20;

      }
    }
  }
  return self->_attachments;
}

uint64_t __37__MFMailDropMailDelivery_attachments__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)deliverSynchronouslyWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  int64_t v6;
  NSObject *v7;
  NSObject *v8;
  MFDeliveryResult *v9;
  NSObject *v10;
  MFDeliveryResult *v11;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  EMLogMailDrop();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4F90000, v5, OS_LOG_TYPE_DEFAULT, "Delivering Mail Drop message", buf, 2u);
  }

  v6 = -[MFMailDropMailDelivery _processAttachments](self, "_processAttachments");
  EMLogMailDrop();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v16 = v6;
    _os_log_impl(&dword_1A4F90000, v7, OS_LOG_TYPE_DEFAULT, "Finished processing attachments with state: %lu", buf, 0xCu);
  }

  if (v6 == 8)
  {
    EMLogMailDrop();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4F90000, v10, OS_LOG_TYPE_DEFAULT, "MailDrop message is undeliverable", buf, 2u);
    }

    v9 = -[MFDeliveryResult initWithStatus:]([MFDeliveryResult alloc], "initWithStatus:", 7);
    goto LABEL_13;
  }
  if (v6 == 6)
  {
    EMLogMailDrop();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_DEFAULT, "Continuing with Mail Drop message delivery", buf, 2u);
    }

    v14.receiver = self;
    v14.super_class = (Class)MFMailDropMailDelivery;
    -[MFOutgoingMessageDelivery deliverSynchronouslyWithCompletion:](&v14, sel_deliverSynchronouslyWithCompletion_, v4);
    v9 = (MFDeliveryResult *)objc_claimAutoreleasedReturnValue();
LABEL_13:
    v11 = v9;
    goto LABEL_17;
  }
  EMLogMailDrop();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4F90000, v12, OS_LOG_TYPE_DEFAULT, "MailDrop message is incomplete", buf, 2u);
  }

  v11 = -[MFDeliveryResult initWithStatus:]([MFDeliveryResult alloc], "initWithStatus:", 8);
  -[MFDeliveryResult setAttributes:](v11, "setAttributes:", v6);
LABEL_17:

  return v11;
}

- (id)ckDatabase
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C94C28], "containerWithIdentifier:", CFSTR("com.apple.largeattachment"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSourceApplicationBundleIdentifier:", *MEMORY[0x1E0D4D878]);
  objc_msgSend(v2, "privateCloudDatabase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)_processAttachments
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  int64_t v21;
  NSObject *v22;
  void *v23;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  MFMailDropMailDelivery *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  int64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  EMLogMailDrop();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A4F90000, v3, OS_LOG_TYPE_DEFAULT, "Processing attachments", buf, 2u);
  }

  -[MFMailDropMailDelivery ckDatabase](self, "ckDatabase");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailDropMailDelivery attachments](self, "attachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && EFProtectedDataAvailable())
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __45__MFMailDropMailDelivery__processAttachments__block_invoke;
    v27[3] = &unk_1E4E8CDF8;
    v28 = v8;
    v29 = self;
    v30 = v5;
    v31 = v6;
    v32 = v7;
    v33 = v25;
    -[MFMailDropMailDelivery _recordZoneIDInDatabase:completionHandler:](self, "_recordZoneIDInDatabase:completionHandler:", v33, v27);

    v9 = v28;
  }
  else
  {
    EMLogMailDrop();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[MFMailDropMailDelivery _processAttachments].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("MFMessageErrorDomain"), 1029, 0);
    objc_msgSend(v8, "finishWithError:", v9);
  }

  objc_msgSend(v8, "future");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v18, "result:", &v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v26;
  v21 = objc_msgSend(v19, "integerValue");

  EMLogMailDrop();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v20, "ef_publicDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v35 = v21;
    v36 = 2114;
    v37 = v23;
    _os_log_impl(&dword_1A4F90000, v22, OS_LOG_TYPE_DEFAULT, "Mail Drop attachments finished processing with result: %lu, error:%{public}@", buf, 0x16u);

  }
  if (v20)
  {
    v21 = 0;
  }
  else if (v21 >= 4)
  {
    if (-[MFMailDropMailDelivery updateMessageWithAttachmentsSynchronously](self, "updateMessageWithAttachmentsSynchronously"))
    {
      v21 = 6;
    }
    else
    {
      v21 = 8;
    }
  }

  return v21;
}

void __45__MFMailDropMailDelivery__processAttachments__block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id *v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  void *v32;
  MFFileArchiveEntry *v33;
  void *v34;
  MFFileArchiveEntry *v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  NSObject *v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id *v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  uint64_t *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint8_t v81[128];
  uint8_t buf[4];
  uint64_t v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  void *v89;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v52 = a3;
  v55 = v5;
  v56 = a1;
  if (v5)
  {
    v77 = 0;
    v78 = &v77;
    v79 = 0x2020000000;
    v80 = 2;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    objc_msgSend(a1[5], "attachments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v73, v90, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v74;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v74 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
          if ((objc_msgSend(v10, "isImageFile") & 1) != 0)
          {
            EMLogMailDrop();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v10, "fileName");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 141558274;
              v83 = 1752392040;
              v84 = 2112;
              v85 = v12;
              _os_log_impl(&dword_1A4F90000, v11, OS_LOG_TYPE_DEFAULT, "Adding attachment '%{mask.hash}@' as image.", buf, 0x16u);

            }
            objc_msgSend(v56[8], "addObject:", v10);
          }
          else
          {
            objc_msgSend(v10, "fetchDataToURL:", 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:zoneID:", CFSTR("mailAttachment"), v55);
              v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94BB8]), "initWithFileURL:", v13);
              -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v15, CFSTR("data"));
              objc_msgSend(v10, "mimeType");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v16, CFSTR("contentType"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v10, "decodedFileSize"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v17, CFSTR("fileSize"));

              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v18, CFSTR("uploadDate"));

              objc_msgSend(v56[6], "addObject:", v14);
              v19 = v56[7];
              -[NSObject recordID](v14, "recordID");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setObject:forKeyedSubscript:", v10, v20);

              EMLogMailDrop();
              v21 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                -[NSObject recordID](v14, "recordID");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v10, "fileName");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 141558786;
                v83 = 1752392040;
                v84 = 2112;
                v85 = v22;
                v86 = 2160;
                v87 = 1752392040;
                v88 = 2112;
                v89 = v23;
                _os_log_error_impl(&dword_1A4F90000, v21, OS_LOG_TYPE_ERROR, "Mail Drop added record '%{mask.hash}@' for attachment '%{mask.hash}@'.", buf, 0x2Au);

              }
            }
            else
            {
              EMLogMailDrop();
              v14 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v10, "fileName");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 141558274;
                v83 = 1752392040;
                v84 = 2112;
                v85 = v24;
                _os_log_error_impl(&dword_1A4F90000, v14, OS_LOG_TYPE_ERROR, "Mail Drop couldn't create file for attachment '%{mask.hash}@'. Ignoring attachment.", buf, 0x16u);

              }
            }

          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v73, v90, 16);
      }
      while (v7);
    }

    v25 = v56;
    if (objc_msgSend(v56[8], "count"))
    {
      +[MFAttachmentUtilities temporaryFileURLWithExtension:](MFAttachmentUtilities, "temporaryFileURLWithExtension:", CFSTR("zip"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      +[MFAttachmentDataProvider dataProviderWithURL:](MFAttachmentDataProvider, "dataProviderWithURL:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      +[MFFileArchiveDirectory archiveDirectory](MFFileArchiveDirectory, "archiveDirectory");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setUrl:", v53);
      v71 = 0u;
      v72 = 0u;
      v70 = 0u;
      v69 = 0u;
      v27 = v56[8];
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
      if (v28)
      {
        v29 = *(_QWORD *)v70;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v70 != v29)
              objc_enumerationMutation(v27);
            v31 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
            objc_msgSend(v31, "fetchDataSynchronously:", 0);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = [MFFileArchiveEntry alloc];
            objc_msgSend(v31, "fileName");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = -[MFFileArchiveEntry initWithContents:path:](v33, "initWithContents:path:", v32, v34);

            objc_msgSend(v26, "setArchiveEntry:", v35);
          }
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v69, v81, 16);
        }
        while (v28);
      }

      +[MFFileArchive archive](MFFileArchive, "archive");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __45__MFMailDropMailDelivery__processAttachments__block_invoke_39;
      v57[3] = &unk_1E4E8CDD0;
      v68 = &v77;
      v37 = v54;
      v58 = v37;
      v38 = v26;
      v39 = v56[5];
      v59 = v38;
      v60 = v39;
      v61 = v56[9];
      v62 = v55;
      v63 = v56[6];
      v40 = v53;
      v64 = v40;
      v65 = v56[7];
      v66 = v56[8];
      v67 = v56[4];
      objc_msgSend(v36, "compressContents:completion:", v38, v57);

    }
    else
    {
      if (objc_msgSend(v56[5], "_uploadAttachmentsViaCloudKit:zone:records:zippedPhotos:attachmentRecords:images:", v56[9], v55, v56[6], 0, v56[7], 0))
      {
        v78[3] = 4;
      }
      else
      {
        EMLogMailDrop();
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
          __45__MFMailDropMailDelivery__processAttachments__block_invoke_cold_2(v43, v44, v45, v46, v47, v48, v49, v50);

        v25 = v56;
      }
      v51 = v25[4];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
      v40 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "finishWithResult:", v40);
    }

    _Block_object_dispose(&v77, 8);
    v42 = v52;
  }
  else
  {
    EMLogMailDrop();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v52, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __45__MFMailDropMailDelivery__processAttachments__block_invoke_cold_1();
    }

    v42 = v52;
    objc_msgSend(a1[4], "finishWithError:", v52);
  }

}

BOOL __45__MFMailDropMailDelivery__processAttachments__block_invoke_39(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  _BOOL8 v29;
  id v31;
  uint64_t v32;
  id obj;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v31 = a2;
  v32 = a1;
  if (v31)
  {
    EMLogMailDrop();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v31, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __45__MFMailDropMailDelivery__processAttachments__block_invoke_39_cold_2();
    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 3;
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "contents");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "save:", v4);

    if (objc_msgSend(*(id *)(v32 + 48), "_uploadAttachmentsViaCloudKit:zone:records:zippedPhotos:attachmentRecords:images:", *(_QWORD *)(v32 + 56), *(_QWORD *)(v32 + 64), *(_QWORD *)(v32 + 72), *(_QWORD *)(v32 + 80), *(_QWORD *)(v32 + 88), *(_QWORD *)(v32 + 96)))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v32 + 112) + 8) + 24) = 4;
      objc_msgSend(*(id *)(v32 + 48), "scaledImages:", *(_QWORD *)(v32 + 96));
      v36 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v32 + 48), "attachments");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      obj = v5;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (v6)
      {
        v34 = *(_QWORD *)v43;
        do
        {
          v37 = v6;
          for (i = 0; i != v37; ++i)
          {
            if (*(_QWORD *)v43 != v34)
              objc_enumerationMutation(obj);
            v8 = *(id *)(*((_QWORD *)&v42 + 1) + 8 * i);
            v38 = 0u;
            v39 = 0u;
            v40 = 0u;
            v41 = 0u;
            v9 = v36;
            v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
            if (v10)
            {
              v11 = *(_QWORD *)v39;
              while (2)
              {
                for (j = 0; j != v10; ++j)
                {
                  if (*(_QWORD *)v39 != v11)
                    objc_enumerationMutation(v9);
                  v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
                  objc_msgSend(v13, "contentID");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v8, "contentID");
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  v16 = objc_msgSend(v14, "isEqualToString:", v15);

                  if (v16)
                  {
                    v17 = v13;

                    v8 = v17;
                    goto LABEL_20;
                  }
                }
                v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
                if (v10)
                  continue;
                break;
              }
            }
LABEL_20:

            objc_msgSend(v8, "mailDropMetadata");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setFlags:", objc_msgSend(v18, "flags") | 8);

            objc_msgSend(v35, "addObject:", v8);
          }
          v5 = obj;
          v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        }
        while (v6);
      }

      objc_msgSend(*(id *)(v32 + 48), "setAttachments:", v35);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v32 + 112) + 8) + 24) = 5;

    }
    else
    {
      EMLogMailDrop();
      v19 = objc_claimAutoreleasedReturnValue();
      v36 = v19;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __45__MFMailDropMailDelivery__processAttachments__block_invoke_cold_2(v19, v20, v21, v22, v23, v24, v25, v26);
    }
  }

  v27 = *(void **)(v32 + 104);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v32 + 112) + 8) + 24));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "finishWithResult:", v28);

  v29 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v32 + 112) + 8) + 24) > 3;
  return v29;
}

- (id)publishRecord:(id)a3 database:(id)a4 attachmentRecords:(id)a5 images:(id)a6 allowsCellularAccess:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  uint64_t v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  MFMailDropMailDelivery *v38;
  const __CFString *v39;
  void *v40;
  _BYTE v41[16];
  _QWORD v42[2];

  v7 = a7;
  v42[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v33 = objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x1E0C94F80]);
  objc_msgSend(v16, "setAllowsCellularAccess:", v7);
  v17 = objc_alloc(MEMORY[0x1E0C95008]);
  objc_msgSend(v12, "recordID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v17, "initWithRecordIDs:", v19);

  objc_msgSend(v20, "setConfiguration:", v16);
  MFLogGeneral();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v12, "recordID", v33);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMailDropMailDelivery publishRecord:database:attachmentRecords:images:allowsCellularAccess:].cold.1(v23, (uint64_t)v41, (uint64_t)v21, v22);
  }

  objc_msgSend(v20, "setRequestedTTL:", 2592000);
  objc_msgSend(v12, "recordID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "fileName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v26, "length") && objc_msgSend(v15, "count"))
  {
    v27 = (id)*MEMORY[0x1E0D1DCA0];

    v26 = v27;
  }
  v39 = CFSTR("data");
  v40 = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1, v33);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFileNamesByAssetFieldNames:", v28);

  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __95__MFMailDropMailDelivery_publishRecord_database_attachmentRecords_images_allowsCellularAccess___block_invoke;
  v35[3] = &unk_1E4E8CE20;
  v29 = v34;
  v36 = v29;
  v30 = v14;
  v37 = v30;
  v38 = self;
  objc_msgSend(v20, "setAssetPublishedBlock:", v35);
  objc_msgSend(v13, "addOperation:", v20);
  objc_msgSend(v29, "future");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

void __95__MFMailDropMailDelivery_publishRecord_database_attachmentRecords_images_allowsCellularAccess___block_invoke(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  NSObject *v25;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v12)
  {
    MFLogGeneral();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __95__MFMailDropMailDelivery_publishRecord_database_attachmentRecords_images_allowsCellularAccess___block_invoke_cold_2();
    }

    objc_msgSend(a1[4], "finishWithError:", v12);
    goto LABEL_21;
  }
  objc_msgSend(v11, "downloadURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1E1B8], "mailDropMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D1E1C0], "parseURL:intoMetadata:", v14, v15);
  objc_msgSend(v11, "downloadURLExpiration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setExpiration:", v16);

  objc_msgSend(a1[5], "objectForKeyedSubscript:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v15, "fileName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0D1DCA0]);

    if (v19)
    {
      v20 = objc_msgSend(v15, "flags") | 2;
    }
    else if (objc_msgSend(v17, "isImageFile"))
    {
      v20 = objc_msgSend(v15, "flags") | 8;
    }
    else
    {
      v20 = objc_msgSend(v15, "flags") | 4;
    }
    objc_msgSend(v15, "setFlags:", v20);
    objc_msgSend(v17, "mailDropMetadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v24;
    if (v24)
      objc_msgSend(v24, "merge:", v15);
    else
      objc_msgSend(v17, "setMailDropMetadata:", v15);
    goto LABEL_17;
  }
  objc_msgSend(v15, "fileName");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x1E0D1DCA0]);

  if (v22)
  {
    objc_msgSend(a1[6], "imageArchiveMetadata");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "merge:", v15);
LABEL_17:

    goto LABEL_18;
  }
  objc_msgSend(v15, "setFlags:", objc_msgSend(v15, "flags") | 8);
LABEL_18:
  MFLogGeneral();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v11, "downloadURL");
    objc_claimAutoreleasedReturnValue();
    __95__MFMailDropMailDelivery_publishRecord_database_attachmentRecords_images_allowsCellularAccess___block_invoke_cold_1();
  }

  objc_msgSend(a1[4], "finishWithResult:", v11);
LABEL_21:

}

- (BOOL)_uploadAttachmentsViaCloudKit:(id)a3 zone:(id)a4 records:(id)a5 zippedPhotos:(id)a6 attachmentRecords:(id)a7 images:(id)a8
{
  id v14;
  id v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  BOOL v32;
  id v33;
  id v34;
  id v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  char v43;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  id v51;
  _QWORD v52[4];
  id v53;
  MFMailDropMailDelivery *v54;
  id v55;
  id v56;
  id v57;
  BOOL v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v49 = a3;
  v47 = a4;
  v14 = a5;
  v15 = a6;
  v45 = a7;
  v46 = a8;
  v63 = 0;
  v50 = v15;
  objc_msgSend(v15, "getResourceValue:forKey:error:", &v63, *MEMORY[0x1E0C99998], 0, v14);
  v48 = v63;
  v16 = objc_msgSend(v48, "integerValue");
  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  v17 = v14;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v60;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v60 != v19)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * v20), "objectForKeyedSubscript:", CFSTR("filesize"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "integerValue");

        v16 += v22;
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    }
    while (v18);
  }

  if (v50)
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:zoneID:", CFSTR("mailAttachment"), v47);
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94BB8]), "initWithFileURL:", v50);
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, CFSTR("data"));
    objc_msgSend(v23, "setObject:forKeyedSubscript:", CFSTR("application/zip"), CFSTR("contentType"));
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v48, CFSTR("fileSize"));
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v25, CFSTR("uploadDate"));

    objc_msgSend(v17, "addObject:", v23);
    -[MFMailDropMailDelivery imageArchiveMetadata](self, "imageArchiveMetadata");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v25) = v26 == 0;

    if ((_DWORD)v25)
    {
      objc_msgSend(MEMORY[0x1E0D1E1B8], "mailDropMetadata");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFMailDropMailDelivery setImageArchiveMetadata:](self, "setImageArchiveMetadata:", v27);

      -[MFMailDropMailDelivery imageArchiveMetadata](self, "imageArchiveMetadata");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setFlags:", 2);

    }
  }
  v29 = objc_alloc_init(MEMORY[0x1E0C94F80]);
  objc_msgSend(v29, "setAllowsCellularAccess:", v16 < 0x6400001);
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94F10]), "initWithRecordsToSave:recordIDsToDelete:", v17, 0);
  objc_msgSend(v30, "setConfiguration:", v29);
  objc_msgSend(v30, "setDatabase:", v49);
  objc_msgSend(v30, "setQueuePriority:", 8);
  objc_msgSend(v30, "setQualityOfService:", 25);
  objc_msgSend(v30, "setPerRecordProgressBlock:", &__block_literal_global_56);
  objc_msgSend(v30, "setPerRecordCompletionBlock:", &__block_literal_global_59);
  objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v16 < 0x6400001;
  v52[0] = MEMORY[0x1E0C809B0];
  v52[1] = 3221225472;
  v52[2] = __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke_60;
  v52[3] = &unk_1E4E8CF20;
  v33 = v31;
  v53 = v33;
  v54 = self;
  v34 = v49;
  v55 = v34;
  v35 = v45;
  v56 = v35;
  v36 = v46;
  v57 = v36;
  v58 = v32;
  objc_msgSend(v30, "setModifyRecordsCompletionBlock:", v52);
  MFLogGeneral();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
    -[MFMailDropMailDelivery _uploadAttachmentsViaCloudKit:zone:records:zippedPhotos:attachmentRecords:images:].cold.2((uint64_t)v34, v37, v38);

  objc_msgSend(v34, "addOperation:", v30);
  objc_msgSend(v33, "future");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  objc_msgSend(v39, "result:", &v51);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v51;

  if (!v40)
  {
    MFLogGeneral();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v41, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      -[MFMailDropMailDelivery _uploadAttachmentsViaCloudKit:zone:records:zippedPhotos:attachmentRecords:images:].cold.1();
    }

  }
  v43 = objc_msgSend(v40, "BOOLValue");

  return v43;
}

void __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke(double a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  double v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "values");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("data"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  MFLogGeneral();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v7, "fileURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 134218242;
    v13 = floor(a1 * 100.0);
    v14 = 2112;
    v15 = v11;
    _os_log_debug_impl(&dword_1A4F90000, v8, OS_LOG_TYPE_DEBUG, "Mail Drop progress %f for record:%@", (uint8_t *)&v12, 0x16u);

  }
}

void __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke_57(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (v5)
  {
    MFLogGeneral();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke_57_cold_1();
    }
  }
  else
  {
    objc_msgSend(v4, "values");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueForKey:", CFSTR("data"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v8;
      MFLogGeneral();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        -[NSObject fileURL](v6, "fileURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "path");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412290;
        v14 = v12;
        _os_log_impl(&dword_1A4F90000, v9, OS_LOG_TYPE_INFO, "#Attachments Mail Drop complete for record:%@", (uint8_t *)&v13, 0xCu);

      }
    }
    else
    {
      v6 = 0;
    }

  }
}

void __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke_60(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  char v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    MFLogGeneral();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke_60_cold_1();
    }

    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v9);
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0D1EEC0];
    v12 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke_62;
    v20[3] = &unk_1E4E8CEA8;
    v13 = *(void **)(a1 + 48);
    v20[4] = *(_QWORD *)(a1 + 40);
    v21 = v13;
    v22 = *(id *)(a1 + 56);
    v23 = *(id *)(a1 + 64);
    v24 = *(_BYTE *)(a1 + 72);
    objc_msgSend(v7, "ef_map:", v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "join:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke_2;
    v18[3] = &unk_1E4E8CED0;
    v19 = *(id *)(a1 + 32);
    objc_msgSend(v15, "addSuccessBlock:", v18);
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke_3;
    v16[3] = &unk_1E4E8CEF8;
    v17 = *(id *)(a1 + 32);
    objc_msgSend(v15, "addFailureBlock:", v16);

  }
}

id __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke_62(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "publishRecord:database:attachmentRecords:images:allowsCellularAccess:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64));
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", MEMORY[0x1E0C9AAB0]);
}

uint64_t __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (void)_recordZoneIDInDatabase:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  +[MFMailDropMailDelivery _mailDropZone](MFMailDropMailDelivery, "_mailDropZone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0C95098]);
    v9 = (void *)objc_msgSend(v8, "initWithZoneName:ownerName:", v7, *MEMORY[0x1E0C94730]);
    MFLogGeneral();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[MFMailDropMailDelivery _recordZoneIDInDatabase:completionHandler:].cold.1((uint64_t)v9, v10, v11);

    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __68__MFMailDropMailDelivery__recordZoneIDInDatabase_completionHandler___block_invoke;
    v14[3] = &unk_1E4E8CF70;
    v17 = v6;
    v12 = v9;
    v15 = v12;
    v16 = v5;
    objc_msgSend(v16, "fetchRecordZoneWithID:completionHandler:", v12, v14);

  }
  else
  {
    +[MFError errorWithDomain:code:localizedDescription:](MFError, "errorWithDomain:code:localizedDescription:", CFSTR("MFMessageErrorDomain"), 1030, CFSTR("Could not get zoneID to create zone."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v13);

  }
}

void __68__MFMailDropMailDelivery__recordZoneIDInDatabase_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    MFLogGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __68__MFMailDropMailDelivery__recordZoneIDInDatabase_completionHandler___block_invoke_cold_1();
    }

  }
  if (v5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneID:", *(_QWORD *)(a1 + 32));
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __68__MFMailDropMailDelivery__recordZoneIDInDatabase_completionHandler___block_invoke_70;
    v10[3] = &unk_1E4E8CF48;
    v9 = *(void **)(a1 + 40);
    v12 = *(id *)(a1 + 48);
    v11 = *(id *)(a1 + 32);
    objc_msgSend(v9, "saveRecordZone:completionHandler:", v8, v10);

  }
}

void __68__MFMailDropMailDelivery__recordZoneIDInDatabase_completionHandler___block_invoke_70(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    MFLogGeneral();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "ef_publicDescription");
      objc_claimAutoreleasedReturnValue();
      __68__MFMailDropMailDelivery__recordZoneIDInDatabase_completionHandler___block_invoke_70_cold_1();
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (id)_mailDropZone
{
  if (_mailDropZone_onceToken != -1)
    dispatch_once(&_mailDropZone_onceToken, &__block_literal_global_76);
  return (id)_mailDropZone__zone;
}

void __39__MFMailDropMailDelivery__mailDropZone__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  BOOL v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14[5];

  v14[4] = *(id *)MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "UUIDString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = *MEMORY[0x1E0CD68B0];
  v14[0] = 0;
  v3 = +[MFMessageKeychainManager addPassword:forServiceName:accountName:keychainAccessibility:synchronizable:error:](MFMessageKeychainManager, "addPassword:forServiceName:accountName:keychainAccessibility:synchronizable:error:", v1, CFSTR("kMFMailDropServiceKey"), CFSTR("MainAccount"), v2, 0, v14);
  v4 = v14[0];
  v5 = v4;
  if (v3)
  {
    if (v1)
      goto LABEL_12;
  }
  else if (objc_msgSend(v4, "code") == -25299
         && (objc_msgSend(v5, "domain"),
             v6 = (void *)objc_claimAutoreleasedReturnValue(),
             v7 = objc_msgSend((id)*MEMORY[0x1E0CB2F90], "isEqualToString:", v6),
             v6,
             v7))
  {
    v13 = v5;
    +[MFMessageKeychainManager passwordForServiceName:accountName:synchronizable:error:](MFMessageKeychainManager, "passwordForServiceName:accountName:synchronizable:error:", CFSTR("kMFMailDropServiceKey"), CFSTR("MainAccount"), 0, &v13);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v13;

    v1 = (void *)v8;
    v5 = v9;
    if (v8)
      goto LABEL_12;
  }
  else
  {

  }
  MFLogGeneral();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "ef_publicDescription");
    objc_claimAutoreleasedReturnValue();
    __39__MFMailDropMailDelivery__mailDropZone__block_invoke_cold_1();
  }

  v1 = 0;
LABEL_12:
  v11 = objc_msgSend(v1, "copy");
  v12 = (void *)_mailDropZone__zone;
  _mailDropZone__zone = v11;

}

- (void)setAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_attachments, a3);
}

- (EMMailDropMetadata)imageArchiveMetadata
{
  return self->_imageArchiveMetadata;
}

- (void)setImageArchiveMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_imageArchiveMetadata, a3);
}

- (int64_t)mailDropState
{
  return self->_mailDropState;
}

- (void)setMailDropState:(int64_t)a3
{
  self->_mailDropState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageArchiveMetadata, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
}

- (void)_processAttachments
{
  OUTLINED_FUNCTION_0_3(&dword_1A4F90000, a1, a3, "Unable to access attachments when generating MailDrop message", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void __45__MFMailDropMailDelivery__processAttachments__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A4F90000, v3, v4, "Mail Drop couldn't create zone. Error: %{public}@", v5);

  OUTLINED_FUNCTION_1();
}

void __45__MFMailDropMailDelivery__processAttachments__block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1A4F90000, a1, a3, "Mail Drop couldn't create record.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_9();
}

void __45__MFMailDropMailDelivery__processAttachments__block_invoke_39_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A4F90000, v3, v4, "Mail Drop couldn't create archive. Error: %{public}@", v5);

  OUTLINED_FUNCTION_1();
}

- (void)publishRecord:(uint64_t)a3 database:(void *)a4 attachmentRecords:images:allowsCellularAccess:.cold.1(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  NSObject *v6;
  uint8_t *v7;

  OUTLINED_FUNCTION_3((uint64_t)a1, a2, 5.7779e-34);
  OUTLINED_FUNCTION_8(&dword_1A4F90000, v6, (uint64_t)v6, "Mail Drop attachment: %@", v7);

  OUTLINED_FUNCTION_1();
}

void __95__MFMailDropMailDelivery_publishRecord_database_attachmentRecords_images_allowsCellularAccess___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_8(&dword_1A4F90000, v3, (uint64_t)v3, "Mail Drop asset URL: %@", v4);

  OUTLINED_FUNCTION_1();
}

void __95__MFMailDropMailDelivery_publishRecord_database_attachmentRecords_images_allowsCellularAccess___block_invoke_cold_2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A4F90000, v3, v4, "#Attachments Mail Drop error publishing asset. %{public}@", v5);

  OUTLINED_FUNCTION_1();
}

- (void)_uploadAttachmentsViaCloudKit:zone:records:zippedPhotos:attachmentRecords:images:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A4F90000, v3, v4, "#Attachments Failure encountered during Mail Drop processing [%{public}@]", v5);

  OUTLINED_FUNCTION_1();
}

- (void)_uploadAttachmentsViaCloudKit:(uint64_t)a3 zone:records:zippedPhotos:attachmentRecords:images:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_8(&dword_1A4F90000, a2, a3, "Start uploading records to CloudKit database [%@] ...", (uint8_t *)&v3);
}

void __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke_57_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A4F90000, v3, v4, "#Attachments Mail Drop error for record: %{public}@", v5);

  OUTLINED_FUNCTION_1();
}

void __107__MFMailDropMailDelivery__uploadAttachmentsViaCloudKit_zone_records_zippedPhotos_attachmentRecords_images___block_invoke_60_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A4F90000, v3, v4, "#Attachments Mail Drop error with upload. %{public}@", v5);

  OUTLINED_FUNCTION_1();
}

- (void)_recordZoneIDInDatabase:(uint64_t)a3 completionHandler:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_8(&dword_1A4F90000, a2, a3, "Start fetching CloudKit record zone for ID [%@] ...", (uint8_t *)&v3);
}

void __68__MFMailDropMailDelivery__recordZoneIDInDatabase_completionHandler___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A4F90000, v3, v4, "#Attachments Error encountered while fetching CloudKit record zone [%{public}@]", v5);

  OUTLINED_FUNCTION_1();
}

void __68__MFMailDropMailDelivery__recordZoneIDInDatabase_completionHandler___block_invoke_70_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A4F90000, v3, v4, "#Attachments Error encountered while saving CloudKit record zone [%{public}@]", v5);

  OUTLINED_FUNCTION_1();
}

void __39__MFMailDropMailDelivery__mailDropZone__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1A4F90000, v3, v4, "#Attachments failed to get zone identifier from keychain: %{public}@", v5);

  OUTLINED_FUNCTION_1();
}

@end
