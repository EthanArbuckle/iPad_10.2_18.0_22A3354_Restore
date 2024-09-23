@implementation MFPlaceholderMailDeliveryUI

- (MFPlaceholderMailDeliveryUI)initWithMessage:(id)a3
{
  id v4;
  MFPlaceholderMessageRewriter *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MFPlaceholderMailDeliveryUI *v15;
  id v17;
  objc_super v18;
  objc_super v19;
  objc_super v20;

  v17 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D4D5C0]);
  objc_msgSend(v4, "setLibraryMessage:", v17);
  v5 = -[MFPlaceholderMessageRewriter initWithOriginalMessageContent:resolver:]([MFPlaceholderMessageRewriter alloc], "initWithOriginalMessageContent:resolver:", v4, self);
  +[MFComposeTypeFactory headersFromDelegate:](MFComposeTypeFactory, "headersFromDelegate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFPlaceholderMessageRewriter rewrittenMessageContent](v5, "rewrittenMessageContent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "multipartContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v7, "multipartContent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0D1E700];
    objc_msgSend(v9, "htmlBody");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "mf_utf8HTMLStringWithString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "plaintextAlternative");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mixedContent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20.receiver = self;
    v20.super_class = (Class)MFPlaceholderMailDeliveryUI;
    v15 = -[MFOutgoingMessageDelivery initWithHeaders:HTML:plainTextAlternative:other:](&v20, sel_initWithHeaders_HTML_plainTextAlternative_other_, v6, v12, v13, v14);

LABEL_5:
    goto LABEL_6;
  }
  objc_msgSend(v7, "richtextContent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "textPartsAreHTML"))
  {
    objc_msgSend(v9, "plaintextAlternative");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mixedContent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19.receiver = self;
    v19.super_class = (Class)MFPlaceholderMailDeliveryUI;
    v15 = -[MFOutgoingMessageDelivery initWithHeaders:HTML:plainTextAlternative:other:](&v19, sel_initWithHeaders_HTML_plainTextAlternative_other_, v6, 0, v11, v12);
    goto LABEL_5;
  }
  objc_msgSend(v9, "mixedContent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)MFPlaceholderMailDeliveryUI;
  v15 = -[MFOutgoingMessageDelivery initWithHeaders:mixedContent:textPartsAreHTML:](&v18, sel_initWithHeaders_mixedContent_textPartsAreHTML_, v6, v11, 0);
LABEL_6:

  if (v15)
    objc_storeStrong((id *)&v15->_rewriter, v5);

  return v15;
}

- (id)deliverSynchronouslyWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *p_super;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  uint8_t buf[4];
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  EMLogMailDrop();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AB96A000, v5, OS_LOG_TYPE_DEFAULT, "Starting delivery of placeholder MailDrop message", buf, 2u);
  }

  v20.receiver = self;
  v20.super_class = (Class)MFPlaceholderMailDeliveryUI;
  -[MFOutgoingMessageDelivery deliverSynchronouslyWithCompletion:](&v20, sel_deliverSynchronouslyWithCompletion_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "status"))
  {
    EMLogMailDrop();
    p_super = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(v6, "status");
      *(_DWORD *)buf = 134217984;
      v22 = v8;
      _os_log_impl(&dword_1AB96A000, p_super, OS_LOG_TYPE_DEFAULT, "Delivery of placeholder Mail Drop message failed with error: %lu", buf, 0xCu);
    }
  }
  else
  {
    EMLogMailDrop();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AB96A000, v9, OS_LOG_TYPE_DEFAULT, "Successfully completed delivery of placehold message. Removing placeholder", buf, 2u);
    }

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[MFPlaceholderMessageRewriter rewrittenMessageContent](self->_rewriter, "rewrittenMessageContent", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "placeholders");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(MEMORY[0x1E0D4D528], "removePlaceholder:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
      }
      while (v12);
    }

    p_super = &self->_rewriter->super;
    self->_rewriter = 0;
  }

  return v6;
}

- (id)_attachmentsContextID
{
  NSString *contextID;
  void *v4;
  NSString *v5;
  NSString *v6;

  contextID = self->_contextID;
  if (!contextID)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_contextID;
    self->_contextID = v5;

    contextID = self->_contextID;
  }
  return contextID;
}

- (id)contentForURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D4D520], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachmentForURL:error:", v3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)contentForContentID:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D4D520], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachmentForContentID:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)contentForPlaceholder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D4D520], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D4D528], "dataForPlaceholder:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v4, "mimeType");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fileName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "contentID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFPlaceholderMailDeliveryUI _attachmentsContextID](self, "_attachmentsContextID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "attachmentForData:mimeType:fileName:contentID:context:", v6, v7, v8, v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewriter, 0);
  objc_storeStrong((id *)&self->_contextID, 0);
}

@end
