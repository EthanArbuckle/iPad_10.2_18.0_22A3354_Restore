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

- (id)fetchLocalDataForAttachment:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "readFromDisk");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFAttachmentLibraryDataProvider messageForAttachment:](self, "messageForAttachment:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "mf_lastPartNumber");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "messageBody");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "partWithNumber:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v12, "range");
    objc_msgSend(v9, "dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:", v12, v13, v14, 0, 0, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)fetchDataForAttachment:(id)a3 consumer:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(id, uint64_t, void *, uint64_t);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD aBlock[4];
  id v37;
  void *v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__MFAttachmentLibraryDataProvider_fetchDataForAttachment_consumer_progress_completion___block_invoke;
  aBlock[3] = &unk_1E81CACD8;
  v13 = v12;
  v37 = v13;
  v14 = (void (**)(id, uint64_t, void *, uint64_t))a6;
  v35 = _Block_copy(aBlock);
  objc_msgSend(v10, "url");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFAttachmentLibraryDataProvider messageForAttachment:](self, "messageForAttachment:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "messageStore");
  v33 = v15;
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mf_lastPartNumber");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v32 = v13;
    objc_msgSend(v10, "readFromDisk");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v19 = objc_alloc(MEMORY[0x1E0D46120]);
      v39[0] = v11;
      v20 = 1;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v19, "initWithConsumers:expectedSize:", v21, objc_msgSend(v10, "encodedFileSize"));

      objc_msgSend(v22, "setProgressBlock:", v35);
      objc_msgSend(v22, "appendData:", v18);
      v23 = 0;
      v24 = 0;
    }
    else
    {
      objc_msgSend(v10, "decodeFilterWithDataConsumer:", v11);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_alloc(MEMORY[0x1E0D46120]);
      v38 = v31;
      v23 = 1;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)objc_msgSend(v25, "initWithConsumers:expectedSize:", v26, objc_msgSend(v10, "encodedFileSize"));

      objc_msgSend(v22, "setProgressBlock:", v35);
      objc_msgSend(v16, "messageBody");
      v27 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v27, "partWithNumber:", v17);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = objc_msgSend(v28, "range");
      LOBYTE(v27) = objc_msgSend(v34, "dataForMimePart:inRange:withConsumer:downloadIfNecessary:", v28, v29, v30, v22, 1);

      if ((v27 & 1) != 0)
      {
        v24 = 0;
        v20 = 1;
      }
      else
      {
        +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1030, CFSTR("Could not retrieve library data for attachment."), CFSTR("No Data Found"), 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        v23 = 0;
      }
    }

    v13 = v32;
  }
  else
  {
    +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1030, CFSTR("Invalid attachment URL."), CFSTR("Invalid Attachment URL"), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v23 = 0;
    v20 = 0;
  }
  objc_msgSend(v22, "done");
  objc_msgSend(v11, "done");
  v14[2](v14, v20, v24, v23);

}

uint64_t __87__MFAttachmentLibraryDataProvider_fetchDataForAttachment_consumer_progress_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
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

    if ((_DWORD)v9 == -1)
    {
      v7 = 0;
    }
    else
    {
      -[MFAttachmentLibraryDataProvider messageLibrary](self, "messageLibrary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "messageWithLibraryID:options:inMailbox:", v9, 4111, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "mailbox");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "account");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "storeForMailboxUid:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(v7, "setMessageStore:", v13);
      }
      else
      {
        MFLogGeneral();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v7, "ef_publicDescription");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138543362;
          v18 = v15;
          _os_log_impl(&dword_1C8839000, v14, OS_LOG_TYPE_INFO, "#Attachments failed to find a store for message %{public}@, things may behave unexpectedly", (uint8_t *)&v17, 0xCu);

        }
      }

    }
  }

  return v7;
}

- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  objc_msgSend(a4, "attachmentStorageLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "part");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "partNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "fileName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (MFMessageLibrary)messageLibrary
{
  return (MFMessageLibrary *)objc_loadWeakRetained((id *)&self->_messageLibrary);
}

- (void)setMessageLibrary:(id)a3
{
  objc_storeWeak((id *)&self->_messageLibrary, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_messageLibrary);
}

@end
