@implementation MFMailDropMailDeliveryUI

- (id)_scaleImages:(id)a3 toFit:(unint64_t)a4 resultingSize:(unint64_t *)a5
{
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t *v20;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  -[MFOutgoingMessageDelivery attachmentContext](self, "attachmentContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0D4D518]);
    -[MFOutgoingMessageDelivery setAttachmentContext:](self, "setAttachmentContext:", v9);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v21;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  v20 = a5;
  v12 = 0;
  if (v11)
  {
    v13 = *(_QWORD *)v24;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v14);
        -[MFOutgoingMessageDelivery attachmentContext](self, "attachmentContext");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "contextID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "scaledImageToFit:saveScaledImage:attachmentContextID:", a4, 1, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          objc_msgSend(v10, "addObject:", v18);
          v12 += objc_msgSend(v18, "scaledFileSize");
        }

        ++v14;
      }
      while (v11 != v14);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  *v20 = v12;
  return v10;
}

- (id)scaledImages:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  unint64_t v11;

  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0D4D508], "currentMessageLimit");
  v11 = 0;
  -[MFMailDropMailDeliveryUI _scaleImages:toFit:resultingSize:](self, "_scaleImages:toFit:resultingSize:", v4, 2, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;
  if (v11 > v5)
  {
    -[MFMailDropMailDeliveryUI _scaleImages:toFit:resultingSize:](self, "_scaleImages:toFit:resultingSize:", v6, 1, &v11);
    v8 = objc_claimAutoreleasedReturnValue();

    v7 = v11;
    v6 = (void *)v8;
  }
  if (v7 > v5)
  {
    EMLogMailDrop();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MFMailDropMailDeliveryUI scaledImages:].cold.1((uint64_t *)&v11, v5, v9);

  }
  return v6;
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
    _os_log_impl(&dword_1AB96A000, v5, OS_LOG_TYPE_DEFAULT, "Starting delivery of message with MailDrop", buf, 2u);
  }

  v20.receiver = self;
  v20.super_class = (Class)MFMailDropMailDeliveryUI;
  -[MFMailDropMailDelivery deliverSynchronouslyWithCompletion:](&v20, sel_deliverSynchronouslyWithCompletion_, v4);
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
      _os_log_impl(&dword_1AB96A000, p_super, OS_LOG_TYPE_DEFAULT, "Delivery of Mail Drop message failed with error: %lu", buf, 0xCu);
    }
  }
  else
  {
    EMLogMailDrop();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AB96A000, v9, OS_LOG_TYPE_DEFAULT, "Delivery of Mail Drop message succeeded. Removing placeholder message.", buf, 2u);
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

- (id)_headersByAddingMailDropHeaders:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v28;
  id v29;
  void *v30;
  id obj;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v29 = (id)objc_msgSend(v28, "mutableCopy");
  v4 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[MFMailDropMailDelivery attachments](self, "attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v4, "initWithCapacity:", objc_msgSend(v5, "count"));

  -[MFMailDropMailDelivery imageArchiveMetadata](self, "imageArchiveMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MFMailDropMailDelivery imageArchiveMetadata](self, "imageArchiveMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "directUrlString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setHeader:forKey:", v8, *MEMORY[0x1E0D1E580]);

  }
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[MFMailDropMailDelivery attachments](self, "attachments");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v9)
  {
    v32 = 0;
    v33 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v35 != v33)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v11, "mailDropMetadata");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "directUrl");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v11, "mailDropMetadata");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isPhotoArchive");

          if ((v15 & 1) == 0)
          {
            v16 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v11, "mailDropMetadata");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "directUrlString");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "fileName");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "mimeType");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v11, "decodedFileSize");
            objc_msgSend(v11, "mailDropMetadata");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "expiration");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "timeIntervalSince1970");
            objc_msgSend(v16, "stringWithFormat:", CFSTR("%@; filename=\"%@\"; mimeType=\"%@\"; filesize=%lu; expiration-date=%f"),
              v18,
              v19,
              v20,
              v21,
              v24);
            v25 = objc_claimAutoreleasedReturnValue();

            v32 = (void *)v25;
            objc_msgSend(v30, "addObject:", v25);
          }
        }
        else
        {

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v9);
  }
  else
  {
    v32 = 0;
  }

  if (objc_msgSend(v30, "count"))
    objc_msgSend(v29, "setHeader:forKey:", v30, *MEMORY[0x1E0D1E5C8]);
  v26 = v29;

  return v26;
}

- (id)_mailDropAttachmentHTMLStringForAttachment:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;

  v3 = a3;
  objc_msgSend(v3, "fileName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mailDropMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "decodedFileSize");
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v4, "directUrlString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expiration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSince1970");
  v8 = v7;
  objc_msgSend(v4, "wrappedUrlString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP_DOWNLOADABLE"), &stru_1E5A6A588, CFSTR("Main"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "mf_stringRepresentationForBytes:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v6, "initWithFormat:", *MEMORY[0x1E0D1DC90], v16, v17, v5, v8 * 1000.0, v9, v11, v17, v12);

  return v13;
}

- (id)_contentForAttachmentPassingTest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[MFMailDropMailDelivery attachments](self, "attachments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__MFMailDropMailDeliveryUI__contentForAttachmentPassingTest___block_invoke;
  v13[3] = &unk_1E5A690A0;
  v6 = v4;
  v14 = v6;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v13);

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    -[MFMailDropMailDelivery attachments](self, "attachments");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "isMailDrop"))
    {
      -[MFMailDropMailDeliveryUI _mailDropAttachmentHTMLStringForAttachment:](self, "_mailDropAttachmentHTMLStringForAttachment:", v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = v10;
    }
    v8 = v11;

  }
  return v8;
}

uint64_t __61__MFMailDropMailDeliveryUI__contentForAttachmentPassingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
    *a4 = 1;
  return result;
}

- (id)contentForURL:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__MFMailDropMailDeliveryUI_contentForURL___block_invoke;
  v8[3] = &unk_1E5A66D80;
  v9 = v4;
  v5 = v4;
  -[MFMailDropMailDeliveryUI _contentForAttachmentPassingTest:](self, "_contentForAttachmentPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __42__MFMailDropMailDeliveryUI_contentForURL___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)contentForContentID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__MFMailDropMailDeliveryUI_contentForContentID___block_invoke;
  v8[3] = &unk_1E5A66D80;
  v9 = v4;
  v5 = v4;
  -[MFMailDropMailDeliveryUI _contentForAttachmentPassingTest:](self, "_contentForAttachmentPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __48__MFMailDropMailDeliveryUI_contentForContentID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "contentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)contentForPlaceholder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__MFMailDropMailDeliveryUI_contentForPlaceholder___block_invoke;
  v8[3] = &unk_1E5A66D80;
  v9 = v4;
  v5 = v4;
  -[MFMailDropMailDeliveryUI _contentForAttachmentPassingTest:](self, "_contentForAttachmentPassingTest:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __50__MFMailDropMailDeliveryUI_contentForPlaceholder___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "contentID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (BOOL)updateMessageWithAttachmentsSynchronously
{
  uint64_t v3;
  int *v4;
  int *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  MFPlaceholderMessageRewriter *v17;
  MFPlaceholderMessageRewriter *rewriter;
  uint64_t v19;
  uint64_t v20;
  objc_class *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  uint64_t v30;
  void *v31;
  objc_class *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_class *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v3 = (int)*MEMORY[0x1E0D4D648];
  v4 = (int *)MEMORY[0x1E0D4D638];
  v5 = (int *)MEMORY[0x1E0D4D658];
  v49 = v3;
  if (*(Class *)((char *)&self->super.super.super.isa + v3))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D4D5C0]);
    v7 = v3;
    v8 = v6;
    objc_msgSend(v6, "setLibraryMessage:", *(Class *)((char *)&self->super.super.super.isa + v7));
  }
  else
  {
    v9 = (int)*MEMORY[0x1E0D4D640];
    if (*(Class *)((char *)&self->super.super.super.isa + v9))
    {
      v8 = objc_alloc_init(MEMORY[0x1E0D4D5D0]);
      objc_msgSend(v8, "setHeaders:", *(Class *)((char *)&self->super.super.super.isa + *v4));
      objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v9), "string");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setHtmlBody:", v10);

      objc_msgSend(v8, "setPlaintextAlternative:", *(Class *)((char *)&self->super.super.super.isa + (int)*MEMORY[0x1E0D4D660]));
      objc_msgSend(v8, "setMixedContent:", *(Class *)((char *)&self->super.super.super.isa + *v5));
    }
    else
    {
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v11 = (int)*MEMORY[0x1E0D4D658];
      v12 = *(id *)((char *)&self->super.super.super.isa + v11);
      v13 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v51;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v51 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v13 = v16;
              goto LABEL_15;
            }
          }
          v13 = (id)objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
          if (v13)
            continue;
          break;
        }
      }
LABEL_15:

      v8 = objc_alloc_init(MEMORY[0x1E0D4D5D8]);
      objc_msgSend(v8, "setHeaders:", *(Class *)((char *)&self->super.super.super.isa + *v4));
      objc_msgSend(v8, "setPlaintextAlternative:", v13);
      objc_msgSend(v8, "setMixedContent:", *(Class *)((char *)&self->super.super.super.isa + v11));
      objc_msgSend(v8, "setTextPartsAreHTML:", *((unsigned __int8 *)&self->super.super.super.isa + (int)*MEMORY[0x1E0D4D668]));

    }
  }
  v17 = -[MFPlaceholderMessageRewriter initWithOriginalMessageContent:resolver:]([MFPlaceholderMessageRewriter alloc], "initWithOriginalMessageContent:resolver:", v8, self);
  rewriter = self->_rewriter;
  self->_rewriter = v17;

  v19 = *v4;
  v20 = *(uint64_t *)((char *)&self->super.super.super.isa + v19);
  if (!v20)
  {
    +[MFComposeTypeFactory headersFromDelegate:](MFComposeTypeFactory, "headersFromDelegate:", self->_rewriter);
    v21 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v22 = *(Class *)((char *)&self->super.super.super.isa + v19);
    *(Class *)((char *)&self->super.super.super.isa + v19) = v21;

    v20 = *(uint64_t *)((char *)&self->super.super.super.isa + v19);
  }
  -[MFMailDropMailDeliveryUI _headersByAddingMailDropHeaders:](self, "_headersByAddingMailDropHeaders:", v20);
  v23 = (objc_class *)objc_claimAutoreleasedReturnValue();
  v24 = *(Class *)((char *)&self->super.super.super.isa + v19);
  *(Class *)((char *)&self->super.super.super.isa + v19) = v23;

  -[MFPlaceholderMessageRewriter rewrittenMessageContent](self->_rewriter, "rewrittenMessageContent");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFMailDropMailDeliveryUI _mailDropBannerHTMLString](self, "_mailDropBannerHTMLString");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "richtextContent");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "plaintextAlternative");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    objc_msgSend(v27, "plaintextAlternative");
    v29 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v30 = (int)*MEMORY[0x1E0D4D660];
    v31 = *(Class *)((char *)&self->super.super.super.isa + v30);
    *(Class *)((char *)&self->super.super.super.isa + v30) = v29;

  }
  objc_msgSend(v27, "mixedContent");
  v32 = (objc_class *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "multipartContent");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33)
  {
    objc_msgSend(v25, "multipartContent");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "htmlBody");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x1E0D1E700];
    objc_msgSend(v26, "stringByAppendingString:", v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "mf_utf8HTMLStringWithString:", v37);
    v38 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v39 = (int)*MEMORY[0x1E0D4D640];
    v40 = *(Class *)((char *)&self->super.super.super.isa + v39);
    *(Class *)((char *)&self->super.super.super.isa + v39) = v38;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1E700], "mf_utf8HTMLStringWithString:", v26);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "arrayByAddingObjectsFromArray:", v32);
    v37 = v32;
    v32 = (objc_class *)objc_claimAutoreleasedReturnValue();
  }

  v41 = (int)*MEMORY[0x1E0D4D658];
  v42 = *(Class *)((char *)&self->super.super.super.isa + v41);
  *(Class *)((char *)&self->super.super.super.isa + v41) = v32;

  v43 = (int)*MEMORY[0x1E0D4D650];
  v44 = *(Class *)((char *)&self->super.super.super.isa + v43);
  *(Class *)((char *)&self->super.super.super.isa + v43) = 0;

  v45 = *(Class *)((char *)&self->super.super.super.isa + v49);
  *(Class *)((char *)&self->super.super.super.isa + v49) = 0;

  v46 = (int)*MEMORY[0x1E0D4D630];
  v47 = *(Class *)((char *)&self->super.super.super.isa + v46);
  *(Class *)((char *)&self->super.super.super.isa + v46) = 0;

  return 1;
}

- (id)_mailDropBannerHTMLString
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[MFMailDropMailDelivery imageArchiveMetadata](self, "imageArchiveMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    -[MFMailDropMailDelivery attachments](self, "attachments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v35;
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v8);
        if (objc_msgSend(v9, "isMailDrop"))
          break;
        if (v6 == ++v8)
        {
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          if (v6)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      objc_msgSend(v9, "mailDropMetadata");
      v11 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v11;
      if (!v11)
        goto LABEL_11;
    }
    else
    {
LABEL_10:

LABEL_11:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFMailDropMailDeliveryUI.m"), 276, CFSTR("attempt to send a mail drop email without any mail drop attachments"));

      v4 = 0;
    }
  }
  v33 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v33, "setTimeStyle:", 0);
  objc_msgSend(v33, "setDateStyle:", 2);
  v12 = (void *)MEMORY[0x1E0CB3940];
  if (objc_msgSend(v4, "isPhotoArchive"))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP_DOWNLOAD_IMAGES"), &stru_1E5A6A588, CFSTR("Main"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP_DOWNLOAD_ATTACHMENT"), &stru_1E5A6A588, CFSTR("Main"));
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("MAIL_DROP_AVAILABLE_UNTIL %@"), &stru_1E5A6A588, CFSTR("Main"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "expiration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "stringFromDate:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("<div style=\"font: 13px 'Helvetica Neue', sans-serif; color: rgb(128,128,128); font-weight: 300\"><div style=\"height:0px; border-top:1px solid #ececec;\"></div><div style=\"overflow: auto;\"><div style=\"float:left; margin-right: 62px;\"><div style=\"height:25px; display:table-cell; vertical-align:bottom\">%@</div><div></div><div style=\"height:19px; display:table-cell; vertical-align:bottom\">%@</div></div><div style=\"float: right; width: 62px; margin-left:-62px\"><div class=\"maildrop_icon\"></div></div></div><div style=\"height:0px; border-top:1px solid #ececec; margin-bottom: 15px\"></div></div>"),
    v13,
    v19,
    CFSTR("div.maildrop_icon {background-image: url('https://www.icloud.com/mail_resources/icloud_download.png');background-repeat: no-repeat;display: inline-block;margin: 15px 18px 13px 18px;height: 25px;width: 26px;}@media(-webkit-min-device-pixel-ratio: 2), (min-resolution: 192dpi) {div.maildrop_icon {background-image: url('https://www.icloud.com/mail_resources/icloud_download@2x.png');background-size: 25px 26px;}}"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "wrappedUrlString");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "expiration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "timeIntervalSince1970");
  objc_msgSend(v23, "stringWithFormat:", CFSTR("%f"), v25 * 1000.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "directUrlString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v4, "fileSize"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("<a href=\"%@\" class=\"%@\" data-expiration=\"%@\" data-url=\"%@\" data-size=\"%@\">%@</a>"), v22, *MEMORY[0x1E0D1DC98], v26, v27, v28, v20);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<style type=\"text/css\">%@</style><html><body>%@</body></html>"), CFSTR("div.maildrop_icon {background-image: url('https://www.icloud.com/mail_resources/icloud_download.png');background-repeat: no-repeat;display: inline-block;margin: 15px 18px 13px 18px;height: 25px;width: 26px;}@media(-webkit-min-device-pixel-ratio: 2), (min-resolution: 192dpi) {div.maildrop_icon {background-image: url('https://www.icloud.com/mail_resources/icloud_download@2x.png');background-size: 25px 26px;}}"),
    v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewriter, 0);
}

- (void)scaledImages:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 134218240;
  v5 = v3;
  v6 = 2048;
  v7 = a2;
  _os_log_error_impl(&dword_1AB96A000, log, OS_LOG_TYPE_ERROR, "MailDrop could not scale images to fit within the current message limit. (%lu / %lu)", (uint8_t *)&v4, 0x16u);
}

@end
