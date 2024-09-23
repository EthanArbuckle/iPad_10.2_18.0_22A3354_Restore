@implementation MFDecryptedAttachmentDataProvider

- (MFDecryptedAttachmentDataProvider)initWithDecryptedMessage:(id)a3
{
  MFDecryptedAttachmentDataProvider *v4;

  v4 = -[MFDecryptedAttachmentDataProvider init](self, "init");
  if (v4)
    v4->_message = (MFMailMessage *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFDecryptedAttachmentDataProvider;
  -[MFDecryptedAttachmentDataProvider dealloc](&v3, sel_dealloc);
}

- (id)fetchLocalDataForAttachment:(id)a3
{
  id v5;
  id result;
  uint64_t v7;
  uint64_t v8;

  v5 = -[MFMailMessage messageStore](self->_message, "messageStore");
  objc_msgSend((id)objc_msgSend(a3, "part"), "setMimeBody:", -[MFMailMessage messageBody](self->_message, "messageBody"));
  result = (id)objc_msgSend(a3, "readFromDisk");
  if (result)
  {
    v7 = objc_msgSend(a3, "part");
    objc_msgSend((id)objc_msgSend(a3, "part"), "range");
    return (id)objc_msgSend(v5, "dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:", v7, 0, v8, 0, 0, 0);
  }
  return result;
}

- (void)fetchDataForAttachment:(id)a3 consumer:(id)a4 progress:(id)a5 completion:(id)a6
{
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  MFError *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  _QWORD v23[5];
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __89__MFDecryptedAttachmentDataProvider_fetchDataForAttachment_consumer_progress_completion___block_invoke;
  v23[3] = &unk_1E81CB038;
  v23[4] = a5;
  v11 = -[MFMailMessage messageStore](self->_message, "messageStore");
  v12 = (void *)objc_msgSend(a3, "part");
  objc_msgSend(v12, "setMimeBody:", -[MFMailMessage messageBody](self->_message, "messageBody"));
  v13 = objc_msgSend(a3, "readFromDisk");
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(a4, "appendData:", v13);
    v15 = objc_msgSend(v14, "length");
    objc_msgSend(a5, "setCompletedUnitCount:", v15);
    objc_msgSend(a5, "setTotalUnitCount:", v15);
    v16 = 0;
    v17 = 0;
    v18 = 0;
    v19 = 1;
  }
  else
  {
    v20 = objc_msgSend(a3, "decodeFilterWithDataConsumer:", a4);
    v21 = objc_alloc(MEMORY[0x1E0D46120]);
    v26[0] = v20;
    v19 = 1;
    v17 = (id)objc_msgSend(v21, "initWithConsumers:expectedSize:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1), objc_msgSend(a3, "encodedFileSize"));
    objc_msgSend(v17, "setProgressBlock:", v23);
    objc_msgSend(v12, "range");
    if ((objc_msgSend(v11, "dataForMimePart:inRange:withConsumer:downloadIfNecessary:", v12, 0, v22, v17, 1) & 1) != 0)
    {
      v18 = 0;
      v16 = 1;
    }
    else
    {
      v24 = *MEMORY[0x1E0CB3388];
      v25 = objc_msgSend(+[MFActivityMonitor currentMonitor](MFActivityMonitor, "currentMonitor"), "error");
      v18 = +[MFError errorWithDomain:code:localizedDescription:title:userInfo:](MFError, "errorWithDomain:code:localizedDescription:title:userInfo:", CFSTR("MFMessageErrorDomain"), 1030, CFSTR("Could not retrieve decrypted data for attachment."), CFSTR("No Data Found"), objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v25, &v24, 1));
      v19 = 0;
      v16 = 0;
    }
  }
  objc_msgSend(v17, "done");
  objc_msgSend(a4, "done");
  (*((void (**)(id, uint64_t, MFError *, uint64_t))a6 + 2))(a6, v19, v18, v16);
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
  id result;

  result = (id)objc_msgSend(a4, "attachmentStorageLocation");
  if (result)
    return (id)objc_msgSend((id)objc_msgSend(result, "stringByAppendingPathComponent:", objc_msgSend((id)objc_msgSend(a3, "part"), "partNumber")), "stringByAppendingPathComponent:", objc_msgSend(a3, "fileName"));
  return result;
}

@end
