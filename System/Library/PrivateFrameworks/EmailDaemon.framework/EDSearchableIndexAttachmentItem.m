@implementation EDSearchableIndexAttachmentItem

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__EDSearchableIndexAttachmentItem_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_75 != -1)
    dispatch_once(&log_onceToken_75, block);
  return (OS_os_log *)(id)log_log_75;
}

void __38__EDSearchableIndexAttachmentItem_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_75;
  log_log_75 = (uint64_t)v1;

}

+ (id)identifierForAttachmentPersistentID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)*MEMORY[0x1E0D1E430];
  objc_msgSend(a3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)attachmentPersistentIDFromItemIdentifier:(id)a3
{
  void *v3;
  EDPersistedAttachmentID *v4;

  objc_msgSend(MEMORY[0x1E0D1E308], "attachmentPersistentIDFromItemIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[EDPersistedAttachmentID initWithString:]([EDPersistedAttachmentID alloc], "initWithString:", v3);
  else
    v4 = 0;

  return v4;
}

- (EDSearchableIndexAttachmentItem)initWithAttachmentPersistentID:(id)a3 messagePersistentID:(id)a4 metadatum:(id)a5
{
  id v8;
  id v9;
  id v10;
  EDSearchableIndexAttachmentItem *v11;
  uint64_t v12;
  EDPersistedAttachmentID *attachmentPersistentID;
  uint64_t v14;
  EDPersistedMessageID *messagePersistentID;
  uint64_t v16;
  NSString *identifier;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)EDSearchableIndexAttachmentItem;
  v11 = -[EDSearchableIndexAttachmentItem init](&v19, sel_init);
  if (v11)
  {
    v11->_itemInstantiationTime = mach_absolute_time();
    v12 = objc_msgSend(v8, "copy");
    attachmentPersistentID = v11->_attachmentPersistentID;
    v11->_attachmentPersistentID = (EDPersistedAttachmentID *)v12;

    v14 = objc_msgSend(v9, "copy");
    messagePersistentID = v11->_messagePersistentID;
    v11->_messagePersistentID = (EDPersistedMessageID *)v14;

    objc_storeStrong((id *)&v11->_metadatum, a5);
    objc_msgSend((id)objc_opt_class(), "identifierForAttachmentPersistentID:", v8);
    v16 = objc_claimAutoreleasedReturnValue();
    identifier = v11->_identifier;
    v11->_identifier = (NSString *)v16;

    v11->_indexingType = 3;
    v11->_requiresPreprocessing = 1;
    v11->_searchableItemProcessingDelay = 0.0;
  }

  return v11;
}

- (void)preprocess
{
  id v2;

  v2 = -[EDSearchableIndexAttachmentItem searchableItem](self, "searchableItem");
}

- (BOOL)shouldIndexImmediatelyPostPreprocessing
{
  return 0;
}

- (id)searchableItem
{
  void *v3;
  id v4;
  void *v5;
  timespec v6;
  id v7;
  EDSearchableAttachment *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  EDSearchableAttachment *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  CSSearchableItem *v25;
  CSSearchableItem *searchableItem;
  void *v27;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  stat v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!self->_searchableItem && -[EDSearchableIndexAttachmentItem requiresPreprocessing](self, "requiresPreprocessing"))
  {
    -[EDSearchableIndexAttachmentItem setRequiresPreprocessing:](self, "setRequiresPreprocessing:", 0);
    -[EDSearchableIndexAttachmentItem metadatum](self, "metadatum");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc(MEMORY[0x1E0CA6B50]);
    objc_msgSend(v3, "contentType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)objc_msgSend(v4, "initWithContentType:", v5);

    objc_msgSend(v3, "mailboxIdentifiers");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v6.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v6.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v35.st_blksize = v6;
    *(timespec *)v35.st_qspare = v6;
    v35.st_birthtimespec = v6;
    *(timespec *)&v35.st_size = v6;
    v35.st_mtimespec = v6;
    v35.st_ctimespec = v6;
    *(timespec *)&v35.st_uid = v6;
    v35.st_atimespec = v6;
    *(timespec *)&v35.st_dev = v6;
    objc_msgSend(v3, "attachmentFileURL");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    LODWORD(v4) = stat((const char *)objc_msgSend(v7, "fileSystemRepresentation"), &v35);

    if ((_DWORD)v4 || !v35.st_birthtimespec.tv_sec)
    {
      v29 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v35.st_birthtimespec.tv_sec);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v8 = [EDSearchableAttachment alloc];
    objc_msgSend(v3, "attachmentFileURL");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentType");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "name");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accountIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDSearchableIndexAttachmentItem messagePersistentID](self, "messagePersistentID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "messageIDHeader");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateSent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateReceived");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "senderAddress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "recipientAddresses");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[EDSearchableAttachment initWithContentURL:contentType:name:accountIdentifier:mailboxIdentifiers:messageID:messageIDHeader:dateSent:dateReceived:sender:recipients:downloadDate:](v8, "initWithContentURL:contentType:name:accountIdentifier:mailboxIdentifiers:messageID:messageIDHeader:dateSent:dateReceived:sender:recipients:downloadDate:", v33, v32, v31, v9, v30, v10, v11, v12, v13, v14, v15, v29);

    -[EDSearchableAttachment addToAttributes:](v16, "addToAttributes:", v34);
    +[EDSearchableIndexAttachmentItem log](EDSearchableIndexAttachmentItem, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      -[EDSearchableAttachment displayName](v16, "displayName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDSearchableAttachment contentURL](v16, "contentURL");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDSearchableIndexAttachmentItem identifier](self, "identifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDSearchableIndexAttachmentItem messagePersistentID](self, "messagePersistentID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v37 = v18;
      v38 = 2112;
      v39 = v19;
      v40 = 2114;
      v41 = v20;
      v42 = 2114;
      v43 = v21;
      _os_log_impl(&dword_1D2F2C000, v17, OS_LOG_TYPE_DEFAULT, "Creating attachment attribute set with displayName %@ contentURL %@ uniqueIdentifier %{public}@ relatedUniqueIdentifier %{public}@", buf, 0x2Au);

    }
    v22 = objc_alloc(MEMORY[0x1E0CA6B48]);
    -[EDSearchableIndexAttachmentItem identifier](self, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDSearchableIndexAttachmentItem domainIdentifier](self, "domainIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (CSSearchableItem *)objc_msgSend(v22, "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v23, v24, v34);
    searchableItem = self->_searchableItem;
    self->_searchableItem = v25;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSearchableItem setExpirationDate:](self->_searchableItem, "setExpirationDate:", v27);

  }
  return self->_searchableItem;
}

- (EFPromise)attributeSetForFilePromise
{
  EFPromise *attributeSetForFilePromise;
  EFPromise *v4;
  EFPromise *v5;
  EFPromise *v6;
  void *v7;

  attributeSetForFilePromise = self->_attributeSetForFilePromise;
  if (!attributeSetForFilePromise)
  {
    objc_msgSend(MEMORY[0x1E0D1EF60], "promise");
    v4 = (EFPromise *)objc_claimAutoreleasedReturnValue();
    v5 = self->_attributeSetForFilePromise;
    self->_attributeSetForFilePromise = v4;

    v6 = self->_attributeSetForFilePromise;
    objc_msgSend(MEMORY[0x1E0CB35C8], "ef_notSupportedError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EFPromise finishWithError:](v6, "finishWithError:", v7);

    attributeSetForFilePromise = self->_attributeSetForFilePromise;
  }
  return attributeSetForFilePromise;
}

- (NSString)domainIdentifier
{
  void *v2;
  void *v3;

  -[EDSearchableIndexAttachmentItem metadatum](self, "metadatum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domainIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)fetchIndexableAttachments
{
  return (id)objc_msgSend(MEMORY[0x1E0D1EEC0], "nullFuture");
}

- (NSDate)dateReceived
{
  return 0;
}

- (unint64_t)estimatedSizeInBytes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSearchableIndexAttachmentItem metadatum](self, "metadatum");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachmentFileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributesOfItemAtPath:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileSize");

  return v8;
}

- (BOOL)hasCompleteData
{
  return 1;
}

- (void)setIndexingType:(int64_t)a3
{
  void *v6;

  if (a3 != 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDSearchableIndexAttachmentItem.m"), 173, CFSTR("Attempting to set unexpected indexing type on EDSearchableIndexAttachmentItem"));

  }
  self->_indexingType = a3;
}

- (int64_t)indexingType
{
  return self->_indexingType;
}

- (BOOL)alwaysMarkAsIndexed
{
  return 0;
}

- (BOOL)shouldExcludeFromIndex
{
  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)itemInstantiationTime
{
  return self->_itemInstantiationTime;
}

- (EDPersistedAttachmentID)attachmentPersistentID
{
  return self->_attachmentPersistentID;
}

- (void)setAttachmentPersistentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (EDPersistedMessageID)messagePersistentID
{
  return self->_messagePersistentID;
}

- (void)setMessagePersistentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (EDSearchableIndexAttachmentItemMetadatum)metadatum
{
  return self->_metadatum;
}

- (void)setMetadatum:(id)a3
{
  objc_storeStrong((id *)&self->_metadatum, a3);
}

- (void)setAttributeSetForFilePromise:(id)a3
{
  objc_storeStrong((id *)&self->_attributeSetForFilePromise, a3);
}

- (BOOL)requiresPreprocessing
{
  return self->_requiresPreprocessing;
}

- (void)setRequiresPreprocessing:(BOOL)a3
{
  self->_requiresPreprocessing = a3;
}

- (double)searchableItemProcessingDelay
{
  return self->_searchableItemProcessingDelay;
}

- (void)setSearchableItemProcessingDelay:(double)a3
{
  self->_searchableItemProcessingDelay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributeSetForFilePromise, 0);
  objc_storeStrong((id *)&self->_metadatum, 0);
  objc_storeStrong((id *)&self->_messagePersistentID, 0);
  objc_storeStrong((id *)&self->_attachmentPersistentID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_searchableItem, 0);
}

@end
