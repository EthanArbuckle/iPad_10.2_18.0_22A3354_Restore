@implementation MFDecryptedAttachmentDataProvider

- (MFDecryptedAttachmentDataProvider)initWithDecryptedMessage:(id)a3
{
  id v5;
  MFDecryptedAttachmentDataProvider *v6;
  MFDecryptedAttachmentDataProvider *v7;

  v5 = a3;
  v6 = -[MFDecryptedAttachmentDataProvider init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_message, a3);

  return v7;
}

- (void)fetchDataForAttachment:(id)a3 consumer:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, uint64_t, void *, uint64_t);
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD aBlock[4];
  id v33;
  uint64_t v34;
  void *v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, uint64_t, void *, uint64_t))a6;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__MFDecryptedAttachmentDataProvider_fetchDataForAttachment_consumer_progress_completion___block_invoke;
  aBlock[3] = &unk_1E4E8B970;
  v14 = v12;
  v33 = v14;
  v31 = _Block_copy(aBlock);
  -[MFMailMessage messageStore](self->_message, "messageStore");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "part");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailMessage messageBody](self->_message, "messageBody");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMimeBody:", v16);

  objc_msgSend(v10, "readFromDisk");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v11, "appendData:", v17);
    v18 = objc_msgSend(v17, "length");
    objc_msgSend(v14, "setCompletedUnitCount:", v18);
    v19 = 0;
    objc_msgSend(v14, "setTotalUnitCount:", v18);
    v20 = 0;
    v21 = 1;
    v22 = 0;
  }
  else
  {
    objc_msgSend(v10, "decodeFilterWithDataConsumer:", v11);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_alloc(MEMORY[0x1E0D46120]);
    v36[0] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 1);
    v25 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v24, "initWithConsumers:expectedSize:", v25, objc_msgSend(v10, "encodedFileSize"));

    objc_msgSend(v19, "setProgressBlock:", v31);
    objc_msgSend(v15, "range");
    LOBYTE(v25) = objc_msgSend(v30, "dataForMimePart:inRange:withConsumer:downloadIfNecessary:", v15, 0, v26, v19, 1);

    if ((v25 & 1) != 0)
    {
      v22 = 0;
      v21 = 1;
      v20 = 1;
    }
    else
    {
      +[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "error");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        v34 = *MEMORY[0x1E0CB3388];
        v35 = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v35, &v34, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v29 = 0;
      }
      +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1030, CFSTR("Could not retrieve decrypted data for attachment."), CFSTR("No Data Found"), v29);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = 0;
      v20 = 0;
    }
  }
  objc_msgSend(v19, "done");
  objc_msgSend(v11, "done");
  v13[2](v13, v21, v22, v20);

}

uint64_t __89__MFDecryptedAttachmentDataProvider_fetchDataForAttachment_consumer_progress_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  objc_msgSend(a4, "storageLocationForAttachment:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
}

@end
