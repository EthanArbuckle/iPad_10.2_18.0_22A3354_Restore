@implementation MFRFC822AttachmentDataProvider

- (MFRFC822AttachmentDataProvider)initWithMessageData:(id)a3 parentPart:(id)a4
{
  id v7;
  id v8;
  MFRFC822AttachmentDataProvider *v9;
  MFRFC822AttachmentDataProvider *v10;
  uint64_t v11;
  MFMailMessage *message;

  v7 = a3;
  v8 = a4;
  v9 = -[MFRFC822AttachmentDataProvider init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messageData, a3);
    objc_storeStrong((id *)&v10->_parentPart, a4);
    +[MFMessage messageWithRFC822Data:withParentPart:generateMessageIDHash:](MFMailMessage, "messageWithRFC822Data:withParentPart:generateMessageIDHash:", v10->_messageData, v10->_parentPart, 1);
    v11 = objc_claimAutoreleasedReturnValue();
    message = v10->_message;
    v10->_message = (MFMailMessage *)v11;

  }
  return v10;
}

- (id)fetchLocalDataForAttachment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v4 = a3;
  -[MFMailMessage messageStore](self->_message, "messageStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "part");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mimeBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v4, "part");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bodyForMessage:fetchIfNotAvailable:updateFlags:", self->_message, 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setMimeBody:", v9);

  }
  objc_msgSend(v4, "readFromDisk");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v4, "part");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "part");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "range");
    objc_msgSend(v5, "dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:", v11, 0, v13, 0, 0, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (void)fetchDataForAttachment:(id)a3 consumer:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void (**v14)(id, uint64_t, void *, _QWORD);
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  char v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  _QWORD aBlock[4];
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__MFRFC822AttachmentDataProvider_fetchDataForAttachment_consumer_progress_completion___block_invoke;
  aBlock[3] = &unk_1E81CACD8;
  v13 = v12;
  v39 = v13;
  v14 = (void (**)(id, uint64_t, void *, _QWORD))a6;
  v15 = _Block_copy(aBlock);
  -[MFMailMessage messageStore](self->_message, "messageStore");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "part");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "mimeBody");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(v10, "part");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "bodyForMessage:fetchIfNotAvailable:updateFlags:", self->_message, 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMimeBody:", v19);

  }
  objc_msgSend(v10, "readFromDisk");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    v21 = objc_alloc(MEMORY[0x1E0D46120]);
    v43[0] = v11;
    v22 = 1;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v21, "initWithConsumers:expectedSize:", v23, objc_msgSend(v10, "encodedFileSize"));

    objc_msgSend(v24, "setProgressBlock:", v15);
    objc_msgSend(v24, "appendData:", v20);
    v25 = 0;
  }
  else
  {
    v36 = v13;
    objc_msgSend(v10, "decodeFilterWithDataConsumer:", v11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_alloc(MEMORY[0x1E0D46120]);
    v42 = v26;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v27, "initWithConsumers:expectedSize:", v28, objc_msgSend(v10, "encodedFileSize"));

    objc_msgSend(v24, "setProgressBlock:", v15);
    objc_msgSend(v10, "part");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "part");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "range");
    v32 = objc_msgSend(v37, "dataForMimePart:inRange:withConsumer:downloadIfNecessary:", v29, 0, v31, v24, 1);

    if ((v32 & 1) != 0)
    {
      v25 = 0;
      v22 = 1;
      v13 = v36;
    }
    else
    {
      +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "error");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        v40 = *MEMORY[0x1E0CB3388];
        v41 = v34;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v35 = 0;
      }
      v13 = v36;
      +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1030, CFSTR("Could not retrieve RFC822 data for attachment."), CFSTR("No Data Found"), v35);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = 0;
    }
  }
  objc_msgSend(v24, "done");
  objc_msgSend(v11, "done");
  v14[2](v14, v22, v25, 0);

}

uint64_t __86__MFRFC822AttachmentDataProvider_fetchDataForAttachment_consumer_progress_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend(*(id *)(a1 + 32), "setTotalUnitCount:", a4);
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", a2);
}

- (id)messageForAttachment:(id)a3
{
  return self->_message;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_parentPart, 0);
  objc_storeStrong((id *)&self->_messageData, 0);
}

@end
