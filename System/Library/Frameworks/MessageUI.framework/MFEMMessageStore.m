@implementation MFEMMessageStore

+ (id)headersForDraftRestoration
{
  if (headersForDraftRestoration_onceToken != -1)
    dispatch_once(&headersForDraftRestoration_onceToken, &__block_literal_global_17);
  return (id)headersForDraftRestoration_headerKeys;
}

void __46__MFEMMessageStore_headersForDraftRestoration__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0D1E620];
  v4[0] = *MEMORY[0x1E0D1E630];
  v4[1] = v0;
  v1 = *MEMORY[0x1E0D1E578];
  v4[2] = *MEMORY[0x1E0D1E570];
  v4[3] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)headersForDraftRestoration_headerKeys;
  headersForDraftRestoration_headerKeys = v2;

}

- (MFEMMessageStore)initWithEMMessage:(id)a3 messageClass:(Class)a4 mailboxUid:(id)a5 skipAttachmentDownload:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  MFEMMessageStore *v12;
  MFEMMessageStore *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v6 = a6;
  v10 = a3;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)MFEMMessageStore;
  v12 = -[MFEMMessageStore init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    -[MFEMMessageStore setMessageClass:](v12, "setMessageClass:", a4);
    -[MFEMMessageStore setMessage:](v13, "setMessage:", v10);
    objc_storeStrong((id *)&v13->_mailbox, a5);
    -[MFEMMessageStore setSkipAttachmentDownload:](v13, "setSkipAttachmentDownload:", v6);
    v14 = (void *)objc_msgSend(MEMORY[0x1E0D460E0], "copyNewMimeBoundary");
    -[MFEMMessageStore setMimeBoundary:](v13, "setMimeBoundary:", v14);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFEMMessageStore setContentIDsToContentItems:](v13, "setContentIDsToContentItems:", v15);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFEMMessageStore setContentIDsToRepresentations:](v13, "setContentIDsToRepresentations:", v16);

  }
  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[NSMutableDictionary allValues](self->_contentIDsToRepresentations, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeObjectsPerformSelector:", sel_cancel);

  v4.receiver = self;
  v4.super_class = (Class)MFEMMessageStore;
  -[MFEMMessageStore dealloc](&v4, sel_dealloc);
}

- (MFMailMessage)legacyMessage
{
  objc_class *messageClass;
  objc_class *v4;
  Class v5;
  id v6;

  messageClass = self->_messageClass;
  if (!messageClass)
  {
    objc_opt_class();
    v4 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v5 = self->_messageClass;
    self->_messageClass = v4;

    messageClass = self->_messageClass;
  }
  v6 = objc_alloc_init(messageClass);
  objc_msgSend(v6, "setMessageStore:", self);
  return (MFMailMessage *)v6;
}

- (id)_requestMessageContentRepresentationFetchIfNotAvailable:(BOOL)a3
{
  _BOOL4 v3;
  os_unfair_lock_s *p_lock;
  void *v6;
  NSObject *v7;
  void *v8;
  id v10;
  void *v11;
  void *v12;
  EMMessage *message;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  _QWORD v25[5];
  uint8_t buf[24];
  uint64_t v27;

  v3 = a3;
  v27 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[MFEMMessageStore bodyRepresentation](self, "bodyRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    EMLogCategoryMessageLoading();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AB96A000, v7, OS_LOG_TYPE_DEFAULT, "Returning cached body repsentation", buf, 2u);
    }

    -[MFEMMessageStore bodyRepresentation](self, "bodyRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(p_lock);
    return v8;
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    v10 = objc_alloc(MEMORY[0x1E0D1E130]);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __76__MFEMMessageStore__requestMessageContentRepresentationFetchIfNotAvailable___block_invoke;
    v25[3] = &__block_descriptor_40_e42_v16__0___EMContentRequestOptionsBuilder__8l;
    v25[4] = v3;
    v11 = (void *)objc_msgSend(v10, "initWithBuilder:", v25);
    objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    message = self->_message;
    objc_msgSend(v12, "completionHandlerAdapter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)-[EMMessage requestRepresentationWithOptions:delegate:completionHandler:](message, "requestRepresentationWithOptions:delegate:completionHandler:", v11, self, v14);

    objc_msgSend(v12, "future");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    objc_msgSend(v16, "result:", &v24);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v24;

    if (v17)
    {
      os_unfair_lock_lock(p_lock);
      v19 = (void *)MEMORY[0x1E0C99D50];
      objc_msgSend(v17, "contentURL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "dataWithContentsOfURL:options:error:", v20, 8, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MFEMMessageStore setBodyHTMLData:](self, "setBodyHTMLData:", v21);

      -[MFEMMessageStore setBodyRepresentation:](self, "setBodyRepresentation:", v17);
      os_unfair_lock_unlock(p_lock);
    }
    else
    {
      EMLogCategoryMessageLoading();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v18, "ef_publicDescription");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFEMMessageStore _requestMessageContentRepresentationFetchIfNotAvailable:].cold.1(v23, (uint64_t)buf, v22);
      }

    }
    return v17;
  }
}

void __76__MFEMMessageStore__requestMessageContentRepresentationFetchIfNotAvailable___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setRequestedRepresentation:", *MEMORY[0x1E0D1DBE0]);
  objc_msgSend(v4, "setNetworkUsage:", *(_QWORD *)(a1 + 32));
  +[MFEMMessageStore headersForDraftRestoration](MFEMMessageStore, "headersForDraftRestoration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequestedHeaderKeys:", v3);

}

- (id)headerDataForMessage:(id)a3 downloadIfNecessary:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v4 = a4;
  v44 = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(MEMORY[0x1E0D46110]);
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[MFEMMessageStore mimeBoundary](self, "mimeBoundary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("multipart/related; boundary=\"%@\"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeader:forKey:", v9, *MEMORY[0x1E0D1E558]);

  -[EMMessage subject](self->_message, "subject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "subjectString");
  v11 = objc_claimAutoreleasedReturnValue();

  v37 = (void *)v11;
  if (v11)
    objc_msgSend(v6, "setHeader:forKey:", v11, *MEMORY[0x1E0D1E5F8]);
  -[MFEMMessageStore _requestMessageContentRepresentationFetchIfNotAvailable:](self, "_requestMessageContentRepresentationFetchIfNotAvailable:", v4);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    objc_msgSend(v38, "publicMessageURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resourceSpecifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByRemovingPercentEncoding");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHeader:forKey:", v14, *MEMORY[0x1E0D1E5B0]);

    objc_msgSend(v38, "requestedHeaders");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v15, "headerKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v40 != v18)
            objc_enumerationMutation(v16);
          v20 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v15, "headersForKey:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            objc_msgSend(v6, "setHeader:forKey:", v21, v20);

        }
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v17);
    }

  }
  -[EMMessage senderList](self->_message, "senderList");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "ef_map:", &__block_literal_global_27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAddressListForSender:", v23);

  -[EMMessage toList](self->_message, "toList");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "ef_map:", &__block_literal_global_27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAddressListForTo:", v25);

  -[EMMessage ccList](self->_message, "ccList");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "ef_map:", &__block_literal_global_27);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAddressListForCc:", v27);

  -[EMMessage bccList](self->_message, "bccList");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "ef_map:", &__block_literal_global_27);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAddressListForBcc:", v29);

  objc_msgSend(v38, "replyToList");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAddressListForReplyTo:", v30);

  -[EMMessage date](self->_message, "date");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "ec_descriptionForMimeHeaders");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHeader:forKey:", v32, *MEMORY[0x1E0D1E560]);

  -[EMMessage documentID](self->_message, "documentID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "UUIDString");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
    objc_msgSend(v6, "setHeader:forKey:", v34, *MEMORY[0x1E0D1E638]);
  objc_msgSend(v6, "encodedHeaders");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

id __61__MFEMMessageStore_headerDataForMessage_downloadIfNecessary___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "stringValue");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)bodyForMessage:(id)a3 fetchIfNotAvailable:(BOOL)a4 updateFlags:(BOOL)a5
{
  _BOOL8 v5;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id obj;
  uint64_t v29;
  MFEMMessageStore *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v5 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v23 = a3;
  v25 = objc_alloc_init(MEMORY[0x1E0D460E0]);
  v31 = objc_alloc_init(MEMORY[0x1E0D4D590]);
  objc_msgSend(v25, "setMessage:", v23);
  objc_msgSend(v25, "setTopLevelPart:", v31);
  objc_msgSend(v31, "setMimeBody:", v25);
  -[MFEMMessageStore _requestMessageContentRepresentationFetchIfNotAvailable:](self, "_requestMessageContentRepresentationFetchIfNotAvailable:", v5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFEMMessageStore mimeBoundary](self, "mimeBoundary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setType:", CFSTR("multipart"));
  objc_msgSend(v31, "setSubtype:", CFSTR("related"));
  objc_msgSend(v31, "setBodyParameter:forKey:", v24, CFSTR("boundary"));
  v27 = objc_alloc_init(MEMORY[0x1E0D4D590]);
  objc_msgSend(v27, "setType:", CFSTR("text"));
  objc_msgSend(v27, "setSubtype:", CFSTR("html"));
  -[MFEMMessageStore bodyHTMLData](self, "bodyHTMLData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setRange:", 0, objc_msgSend(v7, "length"));

  objc_msgSend(v31, "addSubpart:", v27);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v26, "relatedContentItems");
  v30 = self;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v8)
  {
    v29 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v33 != v29)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        v11 = objc_alloc_init(MEMORY[0x1E0D4D590]);
        objc_msgSend(v10, "type");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "preferredMIMEType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13
          || (v14 = objc_msgSend(v13, "rangeOfString:", CFSTR("/")), v14 == 0x7FFFFFFFFFFFFFFFLL)
          || objc_msgSend(v13, "length") <= (unint64_t)(v14 + 1))
        {
          v15 = CFSTR("application");
          v16 = CFSTR("octet-stream");
        }
        else
        {
          objc_msgSend(v13, "substringToIndex:", v14);
          v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "substringFromIndex:", v14 + 1);
          v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v11, "setType:", v15);
        objc_msgSend(v11, "setSubtype:", v16);
        objc_msgSend(v10, "contentID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setContentID:", v17);

        objc_msgSend(v11, "setDisposition:", CFSTR("attachment"));
        objc_msgSend(v10, "displayName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setDispositionParameter:forKey:", v18, CFSTR("filename"));

        objc_msgSend(v11, "setRange:", 0, objc_msgSend(v10, "dataTransferByteCount"));
        objc_msgSend(v11, "setContentTransferEncoding:", CFSTR("binary"));
        objc_msgSend(v31, "addSubpart:", v11);
        -[MFEMMessageStore contentIDsToContentItems](v30, "contentIDsToContentItems");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "contentID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setObject:forKeyedSubscript:", v10, v20);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v8);
  }

  objc_msgSend(v26, "securityInformation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setIsEncrypted:", objc_msgSend(v21, "isEncrypted"));

  return v25;
}

- (id)dataForMimePart:(id)a3 inRange:(_NSRange)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 didDownload:(BOOL *)a7
{
  _BOOL4 v7;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  char v21;
  void *v22;
  os_unfair_lock_s *p_lock;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  char v34;
  void *v35;
  NSObject *v36;
  void *v37;
  id v39;
  _QWORD v40[5];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  _BOOL4 v44;
  __int16 v45;
  _BOOL4 v46;
  __int16 v47;
  uint64_t v48;
  uint64_t v49;

  v7 = a6;
  v49 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  if ((objc_msgSend(v10, "isAttachment") & 1) != 0)
  {
    if ((v7 & ~-[MFEMMessageStore skipAttachmentDownload](self, "skipAttachmentDownload")) != 0)
      v11 = 2;
    else
      v11 = 0;
    objc_msgSend(v10, "contentID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFEMMessageStore contentIDsToContentItems](self, "contentIDsToContentItems");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    EMLogCategoryMessageLoading();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "ef_publicDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "mailDropMetadata");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v42 = v16;
      v43 = 1024;
      v44 = v7;
      v45 = 1024;
      v46 = v17 != 0;
      v47 = 2048;
      v48 = v11;
      _os_log_impl(&dword_1AB96A000, v15, OS_LOG_TYPE_DEFAULT, "Attempting to request content representation for contentItem: %{public}@, download: %{BOOL}d, isMaildrop: %{BOOL}d, networkUsage: %ld", buf, 0x22u);

    }
    if (v14
      && (objc_msgSend(v14, "mailDropMetadata"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = v18 == 0,
          v18,
          v19))
    {
      p_lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      -[MFEMMessageStore contentIDsToRepresentations](self, "contentIDsToRepresentations");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "objectForKeyedSubscript:", v12);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {
        v26 = objc_alloc(MEMORY[0x1E0D1E130]);
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __87__MFEMMessageStore_dataForMimePart_inRange_isComplete_downloadIfNecessary_didDownload___block_invoke;
        v40[3] = &__block_descriptor_40_e42_v16__0___EMContentRequestOptionsBuilder__8l;
        v40[4] = v11;
        v27 = (void *)objc_msgSend(v26, "initWithBuilder:", v40);
        objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "completionHandlerAdapter");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (id)objc_msgSend(v14, "requestRepresentationWithOptions:completionHandler:", v27, v29);

        objc_msgSend(v28, "future");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFEMMessageStore contentIDsToRepresentations](self, "contentIDsToRepresentations");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v25, v12);

      }
      os_unfair_lock_unlock(p_lock);
      v39 = 0;
      objc_msgSend(v25, "result:", &v39);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v39;
      if (v32)
      {
        v34 = objc_msgSend(v32, "hasMoreContent");
        v35 = (void *)MEMORY[0x1E0C99D50];
        objc_msgSend(v32, "contentURL");
        v36 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "dataWithContentsOfURL:options:error:", v36, 8, 0);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v34 ^ 1;
      }
      else
      {
        EMLogCategoryMessageLoading();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v33, "ef_publicDescription");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[MFEMMessageStore dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:].cold.1(v37, (uint64_t)buf, v36);
        }
        v20 = 0;
        v21 = 1;
      }

    }
    else
    {
      v20 = 0;
      v21 = 1;
    }
    if (a5)
      *a5 = v21;

  }
  else
  {
    if (a5)
    {
      -[MFEMMessageStore bodyRepresentation](self, "bodyRepresentation");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *a5 = objc_msgSend(v22, "hasMoreContent") ^ 1;

    }
    -[MFEMMessageStore bodyHTMLData](self, "bodyHTMLData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v20;
}

void __87__MFEMMessageStore_dataForMimePart_inRange_isComplete_downloadIfNecessary_didDownload___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setRequestedRepresentation:", *MEMORY[0x1E0D1DBF0]);
  objc_msgSend(v4, "setNetworkUsage:", *(_QWORD *)(a1 + 32));
  +[MFEMMessageStore headersForDraftRestoration](MFEMMessageStore, "headersForDraftRestoration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequestedHeaderKeys:", v3);

}

- (BOOL)bodyFetchRequiresNetworkActivity
{
  return 1;
}

- (void)contentObjectID:(id)a3 generateHTMLSnippetsForRelatedContentItems:(id)a4 completionHandler:(id)a5
{
  id v7;
  void (**v8)(id, void *, _QWORD);
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void (**)(id, void *, _QWORD))a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[MFEMMessageStore _markupStringForDisplayForContentItem:](self, "_markupStringForDisplayForContentItem:", v14, (_QWORD)v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "contentID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v16);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  v8[2](v8, v9, 0);
}

- (void)contentObjectID:(id)a3 generateHTMLSnippetsForMailDropContentItems:(id)a4 completionHandler:(id)a5
{
  (*((void (**)(id, _QWORD, _QWORD))a5 + 2))(a5, 0, 0);
}

- (void)contentObjectID:(id)a3 placeholderHTMLForEmptyContentWithCompletionHandler:(id)a4
{
  (*((void (**)(id, const __CFString *, _QWORD))a4 + 2))(a4, &stru_1E5A6A588, 0);
}

- (id)_markupStringForDisplayForContentItem:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  _QWORD v31[4];
  _QWORD v32[4];
  _QWORD v33[2];
  _QWORD v34[3];

  v34[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "contentID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)objc_msgSend(v4, "exchangeEventUID") <= 0)
  {
    if ((objc_msgSend(v4, "isAvailableLocally") & 1) != 0
      || !-[MFEMMessageStore skipAttachmentDownload](self, "skipAttachmentDownload"))
    {
      if (-[MFEMMessageStore _isDisplayableImageContentItem:](self, "_isDisplayableImageContentItem:", v4))
      {
        v33[0] = CFSTR("src");
        v11 = (void *)MFCreateURLForContentID();
        v33[1] = CFSTR("id");
        v34[0] = v11;
        v34[1] = v5;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D1EEC8], "htmlSnippetWithTag:includeTrailingTag:attributes:", CFSTR("img"), 0, v12);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v4, "displayName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("UNAVAILABLE"), &stru_1E5A6A588, CFSTR("Main"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = MFCreateURLForContentID();
        v16 = (void *)v15;
        if (v12 && v14 && v5 && v15)
        {
          v31[0] = CFSTR("title");
          v31[1] = CFSTR("subtitle");
          v32[0] = v12;
          v32[1] = v14;
          v31[2] = CFSTR("id");
          v31[3] = CFSTR("src");
          v32[2] = v5;
          v32[3] = v15;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
          v17 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D1EEC8], "htmlSnippetWithTag:includeTrailingTag:attributes:", CFSTR("attachment"), 1, v17);
          v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          EMLogCategoryMessageLoading();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", v12);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "ef_publicDescription");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544386;
            v22 = v19;
            v23 = 2114;
            v24 = v14;
            v25 = 2114;
            v26 = v5;
            v27 = 2114;
            v28 = v16;
            v29 = 2114;
            v30 = v20;
            _os_log_fault_impl(&dword_1AB96A000, v17, OS_LOG_TYPE_FAULT, "Error creating markup string: title: %{public}@, subtitle: %{public}@, id: %{public}@, URL: %{public}@, contentItem: %{public}@", buf, 0x34u);

          }
          v6 = CFSTR("<span></span>");
        }

      }
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "displayName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("<%@>"), v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "ef_stringByEscapingForXML");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("<DIV>%@</DIV>"), v10);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = CFSTR("<span></span>");
  }

  return v6;
}

- (BOOL)_isDisplayableImageContentItem:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC530]) & 1) != 0
    || (objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC580]) & 1) != 0
    || (objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC4F8]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v4 = objc_msgSend(v3, "conformsToType:", *MEMORY[0x1E0CEC520]);
  }

  return v4;
}

- (MailAccount)account
{
  void *v2;
  void *v3;

  -[MFEMMessageStore legacyMessage](self, "legacyMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (MailAccount *)v3;
}

- (id)storageLocationForAttachment:(id)a3 withMessage:(id)a4
{
  return 0;
}

- (BOOL)shouldDownloadBodyDataForMessage:(id)a3
{
  return 0;
}

- (id)storeData:(id)a3 forMimePart:(id)a4 isComplete:(BOOL)a5
{
  return a3;
}

- (MFMailboxUid)mailbox
{
  return self->_mailbox;
}

- (EMMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (NSString)mimeBoundary
{
  return self->_mimeBoundary;
}

- (void)setMimeBoundary:(id)a3
{
  objc_storeStrong((id *)&self->_mimeBoundary, a3);
}

- (NSData)bodyHTMLData
{
  return self->_bodyHTMLData;
}

- (void)setBodyHTMLData:(id)a3
{
  objc_storeStrong((id *)&self->_bodyHTMLData, a3);
}

- (Class)messageClass
{
  return self->_messageClass;
}

- (void)setMessageClass:(Class)a3
{
  objc_storeStrong((id *)&self->_messageClass, a3);
}

- (EMContentRepresentation)bodyRepresentation
{
  return self->_bodyRepresentation;
}

- (void)setBodyRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_bodyRepresentation, a3);
}

- (BOOL)skipAttachmentDownload
{
  return self->_skipAttachmentDownload;
}

- (void)setSkipAttachmentDownload:(BOOL)a3
{
  self->_skipAttachmentDownload = a3;
}

- (NSMutableDictionary)contentIDsToRepresentations
{
  return self->_contentIDsToRepresentations;
}

- (void)setContentIDsToRepresentations:(id)a3
{
  objc_storeStrong((id *)&self->_contentIDsToRepresentations, a3);
}

- (NSMutableDictionary)contentIDsToContentItems
{
  return self->_contentIDsToContentItems;
}

- (void)setContentIDsToContentItems:(id)a3
{
  objc_storeStrong((id *)&self->_contentIDsToContentItems, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentIDsToContentItems, 0);
  objc_storeStrong((id *)&self->_contentIDsToRepresentations, 0);
  objc_storeStrong((id *)&self->_bodyRepresentation, 0);
  objc_storeStrong((id *)&self->_messageClass, 0);
  objc_storeStrong((id *)&self->_bodyHTMLData, 0);
  objc_storeStrong((id *)&self->_mimeBoundary, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_mailbox, 0);
}

- (void)_requestMessageContentRepresentationFetchIfNotAvailable:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_1AB96A000, a2, a3, "Error getting message content representation: %{public}@", (uint8_t *)a2);

}

- (void)dataForMimePart:(NSObject *)a3 inRange:isComplete:downloadIfNecessary:didDownload:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_1AB96A000, a2, a3, "Error getting attachment content representation: %{public}@", (uint8_t *)a2);

}

@end
