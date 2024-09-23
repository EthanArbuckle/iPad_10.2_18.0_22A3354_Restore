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
    +[MFMessage messageWithRFC822Data:withParentPart:generateMessageIDHash:](MFMailMessage, "messageWithRFC822Data:withParentPart:generateMessageIDHash:", v10->_messageData, v8, 1);
    v11 = objc_claimAutoreleasedReturnValue();
    message = v10->_message;
    v10->_message = (MFMailMessage *)v11;

  }
  return v10;
}

- (MFRFC822AttachmentDataProvider)initWithMessageData:(id)a3 parentPart:(id)a4 managed:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  MFRFC822AttachmentDataProvider *v10;
  MFRFC822AttachmentDataProvider *v11;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = -[MFRFC822AttachmentDataProvider initWithMessageData:parentPart:](self, "initWithMessageData:parentPart:", v8, v9);
  v11 = v10;
  if (v10)
    -[MFMailMessage setSourceIsManaged:](v10->_message, "setSourceIsManaged:", v5);

  return v11;
}

- (MFRFC822AttachmentDataProvider)initWithMessage:(id)a3
{
  id v5;
  MFRFC822AttachmentDataProvider *v6;
  MFRFC822AttachmentDataProvider *v7;

  v5 = a3;
  v6 = -[MFRFC822AttachmentDataProvider init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_message, a3);

  return v7;
}

- (MFRFC822AttachmentDataProvider)initWithMessage:(id)a3 managed:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  MFRFC822AttachmentDataProvider *v7;
  MFRFC822AttachmentDataProvider *v8;

  v4 = a4;
  v6 = a3;
  v7 = -[MFRFC822AttachmentDataProvider initWithMessage:](self, "initWithMessage:", v6);
  v8 = v7;
  if (v7)
    -[MFMailMessage setSourceIsManaged:](v7->_message, "setSourceIsManaged:", v4);

  return v8;
}

- (void)fetchDataForAttachment:(id)a3 consumer:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t, void *, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  _QWORD aBlock[4];
  id v34;
  uint64_t v35;
  void *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t, void *, _QWORD))a6;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__MFRFC822AttachmentDataProvider_fetchDataForAttachment_consumer_progress_completion___block_invoke;
  aBlock[3] = &unk_1E4E8B970;
  v31 = v12;
  v34 = v31;
  v32 = _Block_copy(aBlock);
  -[MFMailMessage messageStore](self->_message, "messageStore");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "part");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mimeBody");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = v16 == 0;

  if ((_DWORD)v12)
  {
    objc_msgSend(v10, "part");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bodyForMessage:fetchIfNotAvailable:updateFlags:", self->_message, 0, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setMimeBody:", v18);

  }
  objc_msgSend(v10, "decodeFilterWithDataConsumer:", v11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc(MEMORY[0x1E0D46120]);
  v37[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithConsumers:expectedSize:", v21, objc_msgSend(v10, "encodedFileSize"));

  objc_msgSend(v22, "setProgressBlock:", v32);
  objc_msgSend(v10, "part");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "part");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "range");
  v26 = objc_msgSend(v14, "dataForMimePart:inRange:withConsumer:downloadIfNecessary:", v23, 0, v25, v22, 1);

  if ((v26 & 1) != 0)
  {
    v27 = 0;
  }
  else
  {
    +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "error");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v35 = *MEMORY[0x1E0CB3388];
      v36 = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = 0;
    }
    +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1030, CFSTR("Could not retrieve RFC822 data for attachment."), CFSTR("No Data Found"), v30);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v22, "done");
  objc_msgSend(v11, "done");
  v13[2](v13, v26, v27, 0);

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
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_messageData, 0);
}

@end
