@implementation MFAttachmentLibraryDataProvider

- (MFAttachmentLibraryDataProvider)initWithLibrary:(id)a3
{
  id v4;
  MFAttachmentLibraryDataProvider *v5;
  MFAttachmentLibraryDataProvider *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFAttachmentLibraryDataProvider;
  v5 = -[MFAttachmentLibraryDataProvider init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[MFAttachmentLibraryDataProvider setMessageLibrary:](v5, "setMessageLibrary:", v4);

  return v6;
}

- (void)setMessageLibrary:(id)a3
{
  objc_storeWeak((id *)&self->_messageLibrary, a3);
}

- (EDAttachmentPersistenceManager)persistenceManager
{
  EDAttachmentPersistenceManager *persistenceManager;
  void *v4;
  void *v5;
  EDAttachmentPersistenceManager *v6;
  EDAttachmentPersistenceManager *v7;

  persistenceManager = self->_persistenceManager;
  if (!persistenceManager)
  {
    -[MFAttachmentLibraryDataProvider messageLibrary](self, "messageLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "persistence");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attachmentPersistenceManager");
    v6 = (EDAttachmentPersistenceManager *)objc_claimAutoreleasedReturnValue();
    v7 = self->_persistenceManager;
    self->_persistenceManager = v6;

    persistenceManager = self->_persistenceManager;
  }
  return persistenceManager;
}

- (void)fetchDataForAttachment:(id)a3 consumer:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12[3];

  v10 = a3;
  v11 = a6;
  memset(v12, 170, sizeof(v12));
  -[MFAttachmentLibraryDataProvider _fetchDataForAttachment:consumer:progress:](self, "_fetchDataForAttachment:consumer:progress:", v10, a4, a5);
  objc_msgSend(v10, "updatePathIfNeeded");
  (*((void (**)(id, _QWORD, id, _QWORD))v11 + 2))(v11, LOBYTE(v12[0]), v12[1], LOBYTE(v12[2]));

}

- (_MFAttachmentDataFetchResult)_fetchDataForAttachment:(SEL)a3 consumer:(id)a4 progress:(id)a5
{
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  _BOOL4 v28;
  NSObject *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  _MFAttachmentDataFetchResult *result;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  _QWORD aBlock[4];
  id v57;
  uint8_t v58[4];
  uint64_t v59;
  void *v60;
  uint8_t buf[4];
  uint64_t v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v54 = a6;
  EDAttachmentsLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "ef_publicDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v62 = (uint64_t)v13;
    _os_log_impl(&dword_1A4F90000, v12, OS_LOG_TYPE_DEFAULT, "In _fetchDataForAttachment for attachment %{public}@", buf, 0xCu);

  }
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__MFAttachmentLibraryDataProvider__fetchDataForAttachment_consumer_progress___block_invoke;
  aBlock[3] = &unk_1E4E8B970;
  v14 = v54;
  v57 = v14;
  v55 = _Block_copy(aBlock);
  objc_msgSend(v10, "url");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mf_lastPartNumber");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v10, "readFromDisk");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v11, "appendData:", v17);
      objc_msgSend(v11, "done");
      EDAttachmentsLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = objc_msgSend(v17, "length");
        objc_msgSend(v10, "ef_publicDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v62 = v19;
        v63 = 2114;
        v64 = v20;
        _os_log_impl(&dword_1A4F90000, v18, OS_LOG_TYPE_DEFAULT, "Got data (%{iec-bytes}llu) for attachment %{public}@.", buf, 0x16u);

      }
      *(_QWORD *)&retstr->var0 = 0;
      retstr->var1 = 0;
      *(_QWORD *)&retstr->var2 = 0;
      retstr->var0 = 1;
    }
    else
    {
      -[MFAttachmentLibraryDataProvider messageForAttachment:](self, "messageForAttachment:", v10);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "messageStore");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "downloadMimePartNumber:message:withProgressBlock:", v16, v52, v55);
      objc_msgSend(v10, "updatePathIfNeeded");
      objc_msgSend(v10, "readFromDisk");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        EDAttachmentsLog();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          v25 = objc_msgSend(v17, "length");
          objc_msgSend(v10, "ef_publicDescription");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v62 = v25;
          v63 = 2114;
          v64 = v26;
          _os_log_impl(&dword_1A4F90000, v24, OS_LOG_TYPE_DEFAULT, "Got data (%{iec-bytes}llu) for attachment %{public}@.", buf, 0x16u);

        }
        objc_msgSend(v11, "appendData:", v17);
        objc_msgSend(v11, "done");
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v11, "data");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v27 == 0;

          if (v28)
          {
            EDAttachmentsLog();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v10, "ef_publicDescription");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[MFAttachmentLibraryDataProvider _fetchDataForAttachment:consumer:progress:].cold.2(v30, (uint64_t)buf, v29);
            }

          }
        }
        *(_QWORD *)&retstr->var0 = 0;
        retstr->var1 = 0;
        *(_QWORD *)&retstr->var2 = 0;
        retstr->var0 = 1;
      }
      else
      {
        EDAttachmentsLog();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v10, "ef_publicDescription");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFAttachmentLibraryDataProvider _fetchDataForAttachment:consumer:progress:].cold.1(v32, (uint64_t)buf, v31);
        }

        objc_msgSend(v10, "decodeFilterWithDataConsumer:", v11);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_alloc(MEMORY[0x1E0D46120]);
        v60 = v33;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = (void *)objc_msgSend(v34, "initWithConsumers:expectedSize:", v35, objc_msgSend(v10, "encodedFileSize"));

        objc_msgSend(v51, "setProgressBlock:", v55);
        objc_msgSend(v52, "messageBody");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "partWithNumber:", v16);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = objc_msgSend(v50, "range");
        v39 = objc_msgSend(v53, "dataForMimePart:inRange:withConsumer:downloadIfNecessary:", v50, v37, v38, v51, 1);
        objc_msgSend(v10, "updatePathIfNeeded");
        if (v39)
        {
          EDAttachmentsLog();
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            v48 = v33;
            objc_msgSend(v10, "ef_publicDescription");
            v41 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v58 = 138543362;
            v59 = v41;
            v42 = (void *)v41;
            _os_log_impl(&dword_1A4F90000, v40, OS_LOG_TYPE_DEFAULT, "Got data for attachment %{public}@.", v58, 0xCu);

            v33 = v48;
          }

          v43 = 0;
        }
        else
        {
          EDAttachmentsLog();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            v49 = v33;
            objc_msgSend(v10, "ef_publicDescription");
            v45 = objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v58 = 138543362;
            v59 = v45;
            v46 = (void *)v45;
            _os_log_impl(&dword_1A4F90000, v44, OS_LOG_TYPE_DEFAULT, "Failed to get data for attachment %{public}@.", v58, 0xCu);

            v33 = v49;
          }

          +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1030, CFSTR("Could not retrieve library data for attachment."), CFSTR("No Data Found"), 0);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v51, "done");
        objc_msgSend(v11, "done");
        retstr->var0 = v39;
        retstr->var1 = v43;
        retstr->var2 = v39;

      }
    }

  }
  else
  {
    +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1030, CFSTR("Invalid attachment URL."), CFSTR("Invalid Attachment URL"), 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    EDAttachmentsLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "ef_publicDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v62 = (uint64_t)v23;
      _os_log_impl(&dword_1A4F90000, v22, OS_LOG_TYPE_DEFAULT, "No part number for attachment %{public}@", buf, 0xCu);

    }
    retstr->var0 = 0;
    retstr->var1 = v21;
    retstr->var2 = 0;
  }

  return result;
}

uint64_t __77__MFAttachmentLibraryDataProvider__fetchDataForAttachment_consumer_progress___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend(*(id *)(a1 + 32), "setTotalUnitCount:", a4);
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", a2);
}

- (id)messageForAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "part");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mimeBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v4, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "mf_rowID");

    if (v9 == *MEMORY[0x1E0D1DC08])
    {
      EDAttachmentsLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "url");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFAttachmentLibraryDataProvider messageForAttachment:].cold.1(v11, (uint64_t)&v18, v10);
      }
      v7 = 0;
    }
    else
    {
      -[MFAttachmentLibraryDataProvider messageLibrary](self, "messageLibrary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "messageWithLibraryID:options:inMailbox:", v9, 4227087, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "mailbox");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject account](v10, "account");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "storeForMailboxUid:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v7, "setMessageStore:", v14);
      }
      else
      {
        MFLogGeneral();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v7, "ef_publicDescription");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 138543362;
          v19 = v16;
          _os_log_impl(&dword_1A4F90000, v15, OS_LOG_TYPE_INFO, "#Attachments failed to find a store for message %{public}@, things may behave unexpectedly", (uint8_t *)&v18, 0xCu);

        }
      }

    }
  }

  return v7;
}

- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4
{
  objc_msgSend(a4, "storageLocationForAttachment:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (MFMailMessageLibrary)messageLibrary
{
  return (MFMailMessageLibrary *)objc_loadWeakRetained((id *)&self->_messageLibrary);
}

- (void)setPersistenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_destroyWeak((id *)&self->_messageLibrary);
}

- (void)_fetchDataForAttachment:(void *)a1 consumer:(uint64_t)a2 progress:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1A4F90000, a2, a3, "Failed to download attachment data for attachment %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_1();
}

- (void)_fetchDataForAttachment:(void *)a1 consumer:(uint64_t)a2 progress:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1A4F90000, a2, a3, "Failed to find data for attachment %{public}@", (uint8_t *)a2);

  OUTLINED_FUNCTION_1();
}

- (void)messageForAttachment:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_2(&dword_1A4F90000, a2, a3, "rowID is undefined for attachment url: %@.", (uint8_t *)a2);

  OUTLINED_FUNCTION_1();
}

@end
