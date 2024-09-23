@implementation EDSearchableIndexRichLinkItem

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__EDSearchableIndexRichLinkItem_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_80 != -1)
    dispatch_once(&log_onceToken_80, block);
  return (OS_os_log *)(id)log_log_80;
}

void __36__EDSearchableIndexRichLinkItem_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_80;
  log_log_80 = (uint64_t)v1;

}

+ (id)messageIDandRichLinkIDFromRichLinkIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  EDPersistedMessageID *v7;
  void *v8;
  EDPersistedMessageID *v9;
  EDPersistedRichLinkID *v10;
  void *v11;
  EDPersistedRichLinkID *v12;
  void *v13;
  NSObject *v14;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "richLinkItemIdentifierFromSearchableItemIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("_"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") == 2)
  {
    v7 = [EDPersistedMessageID alloc];
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[EDPersistedMessageID initWithString:](v7, "initWithString:", v8);

    v10 = [EDPersistedRichLinkID alloc];
    objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[EDPersistedRichLinkID initWithString:](v10, "initWithString:", v11);

    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1EF38]), "initWithFirst:second:", v9, v12);
  }
  else
  {
    +[EDSearchableIndexRichLinkItem log](EDSearchableIndexRichLinkItem, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v4;
      _os_log_impl(&dword_1D2F2C000, v14, OS_LOG_TYPE_DEFAULT, "Rich link identifier %@ could not be split up into messageID and rich link ID.", (uint8_t *)&v16, 0xCu);
    }

    v13 = 0;
  }

  return v13;
}

+ (id)richLinkItemIdentifierFromSearchableItemIdentifier:(id)a3
{
  objc_msgSend(MEMORY[0x1E0D1E308], "richLinkItemIdentifierFromSearchableItemIdentifier:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)identifierForMessageID:(id)a3 richLinkID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@_%@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)*MEMORY[0x1E0D1E438], "stringByAppendingString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (EDSearchableIndexRichLinkItem)initWithMessageID:(id)a3 metadatum:(id)a4
{
  id v6;
  id v7;
  EDSearchableIndexRichLinkItem *v8;
  uint64_t v9;
  EDPersistedMessageID *messagePersistentID;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *identifier;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)EDSearchableIndexRichLinkItem;
  v8 = -[EDSearchableIndexRichLinkItem init](&v16, sel_init);
  if (v8)
  {
    v8->_itemInstantiationTime = mach_absolute_time();
    v9 = objc_msgSend(v6, "copy");
    messagePersistentID = v8->_messagePersistentID;
    v8->_messagePersistentID = (EDPersistedMessageID *)v9;

    objc_storeStrong((id *)&v8->_metadatum, a4);
    v11 = (void *)objc_opt_class();
    objc_msgSend(v7, "richLinkID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifierForMessageID:richLinkID:", v6, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v13;

    v8->_indexingType = 6;
    v8->_requiresPreprocessing = 1;
  }

  return v8;
}

- (id)searchableItem
{
  void *v3;
  EDSearchableRichLink *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  EDSearchableRichLink *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  CSSearchableItem *v19;
  CSSearchableItem *searchableItem;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (!self->_searchableItem && -[EDSearchableIndexRichLinkItem requiresPreprocessing](self, "requiresPreprocessing"))
  {
    -[EDSearchableIndexRichLinkItem setRequiresPreprocessing:](self, "setRequiresPreprocessing:", 0);
    -[EDSearchableIndexRichLinkItem metadatum](self, "metadatum");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_alloc_init(MEMORY[0x1E0CA6B50]);
    v4 = [EDSearchableRichLink alloc];
    objc_msgSend(v3, "accountIdentifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mailboxIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDSearchableIndexRichLinkItem messagePersistentID](self, "messagePersistentID");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "richLinkID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "title");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "url");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateSent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateReceived");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "senderAddress");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "recipientAddresses");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)v6;
    v11 = -[EDSearchableRichLink initWithAccountIdentifier:mailboxIdentifiers:messageID:id:title:url:dateSent:dateReceived:sender:recipients:](v4, "initWithAccountIdentifier:mailboxIdentifiers:messageID:id:title:url:dateSent:dateReceived:sender:recipients:", v27, v5, v6, v26, v25, v24, v7, v8, v9, v10);

    -[EDSearchableRichLink addToAttributes:](v11, "addToAttributes:", v28);
    +[EDSearchableIndexRichLinkItem log](EDSearchableIndexRichLinkItem, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "richLinkID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDSearchableIndexRichLinkItem identifier](self, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDSearchableIndexRichLinkItem messagePersistentID](self, "messagePersistentID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v30 = v13;
      v31 = 2114;
      v32 = v14;
      v33 = 2114;
      v34 = v15;
      _os_log_impl(&dword_1D2F2C000, v12, OS_LOG_TYPE_DEFAULT, "Creating rich link attribute set with rich link ID %@ uniqueIdentifier %{public}@ relatedUniqueIdentifier %{public}@", buf, 0x20u);

    }
    v16 = objc_alloc(MEMORY[0x1E0CA6B48]);
    -[EDSearchableIndexRichLinkItem identifier](self, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDSearchableIndexRichLinkItem domainIdentifier](self, "domainIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (CSSearchableItem *)objc_msgSend(v16, "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v17, v18, v28);
    searchableItem = self->_searchableItem;
    self->_searchableItem = v19;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSearchableItem setExpirationDate:](self->_searchableItem, "setExpirationDate:", v21);

  }
  return self->_searchableItem;
}

- (id)fetchIndexableAttachments
{
  return (id)objc_msgSend(MEMORY[0x1E0D1EEC0], "nullFuture");
}

- (void)preprocess
{
  id v2;

  v2 = -[EDSearchableIndexRichLinkItem searchableItem](self, "searchableItem");
}

- (BOOL)shouldIndexImmediatelyPostPreprocessing
{
  return 0;
}

- (NSString)domainIdentifier
{
  void *v2;
  void *v3;

  -[EDSearchableIndexRichLinkItem metadatum](self, "metadatum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "domainIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)estimatedSizeInBytes
{
  return 0;
}

- (NSDate)dateReceived
{
  return 0;
}

- (BOOL)hasCompleteData
{
  return 1;
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

- (int64_t)indexingType
{
  return self->_indexingType;
}

- (void)setIndexingType:(int64_t)a3
{
  self->_indexingType = a3;
}

- (unint64_t)itemInstantiationTime
{
  return self->_itemInstantiationTime;
}

- (EDPersistedMessageID)messagePersistentID
{
  return self->_messagePersistentID;
}

- (void)setMessagePersistentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (EDSearchableIndexRichLinkItemMetadatum)metadatum
{
  return self->_metadatum;
}

- (void)setMetadatum:(id)a3
{
  objc_storeStrong((id *)&self->_metadatum, a3);
}

- (NSString)richLinkPersistentID
{
  return self->_richLinkPersistentID;
}

- (void)setRichLinkPersistentID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)requiresPreprocessing
{
  return self->_requiresPreprocessing;
}

- (void)setRequiresPreprocessing:(BOOL)a3
{
  self->_requiresPreprocessing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_richLinkPersistentID, 0);
  objc_storeStrong((id *)&self->_metadatum, 0);
  objc_storeStrong((id *)&self->_messagePersistentID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_searchableItem, 0);
}

@end
