@implementation MFMessagesMissingBodyData

- (_QWORD)initWithMessagesMissingBodyData:(void *)a3 messagesNotMissingBodyData:(void *)a4 fragmentedMessages:(uint64_t)a5 messagesScannedInFilesystemCount:
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  objc_super v25;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (a1)
  {
    v25.receiver = a1;
    v25.super_class = (Class)MFMessagesMissingBodyData;
    v12 = objc_msgSendSuper2(&v25, sel_init);
    a1 = v12;
    if (v12)
    {
      v13 = objc_msgSend(v9, "copy");
      v14 = (void *)v13;
      if (v13)
        v15 = (void *)v13;
      else
        v15 = (void *)MEMORY[0x1E0C9AA60];
      objc_storeStrong((id *)v12 + 1, v15);

      v16 = (void *)objc_msgSend(v10, "copy");
      v17 = v16;
      if (v16)
      {
        v18 = v16;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
        v18 = (id)objc_claimAutoreleasedReturnValue();
      }
      v19 = (void *)a1[2];
      a1[2] = v18;

      v20 = (void *)objc_msgSend(v11, "copy");
      v21 = v20;
      if (v20)
      {
        v22 = v20;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
        v22 = (id)objc_claimAutoreleasedReturnValue();
      }
      v23 = (void *)a1[3];
      a1[3] = v22;

      a1[4] = a5;
    }
  }

  return a1;
}

- (NSArray)messagesMissingBodyData
{
  return self->_messagesMissingBodyData;
}

- (NSIndexSet)messagesNotMissingBodyData
{
  return self->_messagesNotMissingBodyData;
}

- (NSIndexSet)fragmentedMessages
{
  return self->_fragmentedMessages;
}

- (int64_t)messagesScannedInFilesystemCount
{
  return self->_messagesScannedInFilesystemCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fragmentedMessages, 0);
  objc_storeStrong((id *)&self->_messagesNotMissingBodyData, 0);
  objc_storeStrong((id *)&self->_messagesMissingBodyData, 0);
}

@end
