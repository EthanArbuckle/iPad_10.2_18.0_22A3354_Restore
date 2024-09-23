@implementation EDSearchableIndexItem

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__EDSearchableIndexItem_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_77 != -1)
    dispatch_once(&log_onceToken_77, block);
  return (OS_os_log *)(id)log_log_77;
}

void __28__EDSearchableIndexItem_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_77;
  log_log_77 = (uint64_t)v1;

}

+ (id)itemWithMessage:(id)a3 bodyData:(id)a4 fetchBody:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMessage:bodyData:fetchBody:", v8, v9, v5);

  return v10;
}

+ (id)itemWithIdentifier:(id)a3 message:(id)a4 bodyData:(id)a5 fetchBody:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:message:bodyData:fetchBody:", v10, v11, v12, v6);

  return v13;
}

- (EDSearchableIndexItem)initWithIdentifier:(id)a3 message:(id)a4 bodyData:(id)a5 fetchBody:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  EDSearchableIndexItem *v13;
  void *v14;
  uint64_t v15;
  NSData *bodyData;
  uint64_t v17;
  NSString *identifier;
  objc_super v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)EDSearchableIndexItem;
  v13 = -[EDSearchableIndexItem init](&v20, sel_init);
  if (v13)
  {
    v13->_itemInstantiationTime = mach_absolute_time();
    objc_storeStrong((id *)&v13->_baseMessage, a4);
    objc_msgSend(v11, "persistentID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      objc_storeStrong((id *)&v13->_message, a4);
    v15 = objc_msgSend(v12, "copy");
    bodyData = v13->_bodyData;
    v13->_bodyData = (NSData *)v15;

    v17 = objc_msgSend(v10, "copy");
    identifier = v13->_identifier;
    v13->_identifier = (NSString *)v17;

    v13->_fetchBody = a6;
    *(_WORD *)&v13->_isEncrypted = 0;
    v13->_hasCompleteData = v13->_bodyData != 0;
  }

  return v13;
}

- (EDSearchableIndexItem)initWithMessage:(id)a3 bodyData:(id)a4 fetchBody:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  void *v11;
  EDSearchableIndexItem *v12;
  void *v14;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "persistentID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDSearchableIndexItem.m"), 82, CFSTR("Message does not have a valid identifier. Please consider using initWithIdentifier:message:bodyData: if you need something special."));

  }
  v12 = -[EDSearchableIndexItem initWithIdentifier:message:bodyData:fetchBody:](self, "initWithIdentifier:message:bodyData:fetchBody:", v11, v9, v10, v5);

  return v12;
}

- (EDSearchableIndexItem)initWithIdentifier:(id)a3
{
  return -[EDSearchableIndexItem initWithIdentifier:message:bodyData:fetchBody:](self, "initWithIdentifier:message:bodyData:fetchBody:", a3, 0, 0, 0);
}

+ (id)suggestionsSearchableItemWithMessage:(id)a3 bodyData:(id)a4 fetchBody:(BOOL)a5 isEncrypted:(BOOL)a6 includeEncryptedBody:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v12 = a3;
  v13 = a4;
  objc_msgSend(v12, "persistentID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "ef_UUID");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIdentifier:message:bodyData:fetchBody:", v17, v12, v13, v9);
  objc_msgSend(v18, "setIsEncrypted:", v8);
  objc_msgSend(v18, "setIncludeEncryptedBody:", v7);
  objc_msgSend(v18, "searchableItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (NSDate)dateReceived
{
  void *v2;
  void *v3;

  -[EDSearchableIndexItem baseMessage](self, "baseMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dateReceived");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

+ (int64_t)indexingPriorityByIndexingType:(int64_t)a3
{
  if ((unint64_t)a3 > 6)
    return 2;
  else
    return qword_1D317A8E8[a3];
}

+ (id)domainIdentifierForAccountID:(id)a3 mailboxPersistentID:(id)a4
{
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)domainIdentifierForMessage:(id)a3
{
  objc_msgSend(a1, "_domainIdentifierForBaseMessage:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_domainIdentifierForBaseMessage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "_accountIdentifierForBaseMessage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mailbox");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "persistentID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "domainIdentifierForAccountID:mailboxPersistentID:", v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)accountIdentifierForMessage:(id)a3
{
  objc_msgSend(a1, "_accountIdentifierForBaseMessage:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_accountIdentifierForBaseMessage:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "account");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)mailboxIdentifiersForMessage:(id)a3
{
  objc_msgSend(a1, "mailboxIdentifiersForBaseMessage:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)mailboxIdentifiersForBaseMessage:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v4, "mailbox");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
    objc_msgSend(v5, "addObject:", v7);
  objc_msgSend(a1, "csIdentifierForMailbox:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "length"))
    objc_msgSend(v5, "addObject:", v8);
  objc_msgSend(v5, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)gmailLabelsForBaseMessage:(id)a3
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)searchableMessageFlagsForBaseMessage:(id)a3
{
  void *v3;
  EDSearchableMessageFlags *v4;

  objc_msgSend(a3, "flags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[EDSearchableMessageFlags initWithRead:flagged:flagColor:replied:]([EDSearchableMessageFlags alloc], "initWithRead:flagged:flagColor:replied:", objc_msgSend(v3, "read"), objc_msgSend(v3, "flagged"), objc_msgSend(v3, "flagColor"), objc_msgSend(v3, "replied"));

  return v4;
}

+ (id)searchableMessageUpdateForBaseMessage:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  EDSearchableMessageUpdate *v8;

  v3 = a3;
  objc_msgSend(v3, "conversationID");
  EFStringWithInt64();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "mailboxIdentifiersForBaseMessage:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "gmailLabelsForBaseMessage:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "searchableMessageFlagsForBaseMessage:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EDSearchableMessageUpdate initWithConversationIdentifier:mailboxIdentifiers:gmailLabels:isLikelyJunk:dateLastViewed:flags:]([EDSearchableMessageUpdate alloc], "initWithConversationIdentifier:mailboxIdentifiers:gmailLabels:isLikelyJunk:dateLastViewed:flags:", v4, v5, v6, 0, 0, v7);

  return v8;
}

+ (id)searchableMessageAttachmentsForBaseMessage:(id)a3 includeEncryptedBody:(BOOL)a4
{
  return 0;
}

+ (id)searchableMessageIDForPersistedMessageID:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc(MEMORY[0x1E0D1E340]);
  objc_msgSend(v3, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithString:", v5);

  return v6;
}

- (id)linksAttributeKey
{
  if (linksAttributeKey_onceToken != -1)
    dispatch_once(&linksAttributeKey_onceToken, &__block_literal_global_64);
  return (id)linksAttributeKey_sInstance;
}

void __42__EDSearchableIndexItem_linksAttributeKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("com_apple_mail_links"), 1, 0, 0, 0);
  v1 = (void *)linksAttributeKey_sInstance;
  linksAttributeKey_sInstance = v0;

}

- (id)phoneNumbersAttributeKey
{
  if (phoneNumbersAttributeKey_onceToken != -1)
    dispatch_once(&phoneNumbersAttributeKey_onceToken, &__block_literal_global_27);
  return (id)phoneNumbersAttributeKey_sInstance;
}

void __49__EDSearchableIndexItem_phoneNumbersAttributeKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("com_apple_mail_phone_numbers"), 1, 0, 0, 0);
  v1 = (void *)phoneNumbersAttributeKey_sInstance;
  phoneNumbersAttributeKey_sInstance = v0;

}

- (id)addressesAttributeKey
{
  if (addressesAttributeKey_onceToken != -1)
    dispatch_once(&addressesAttributeKey_onceToken, &__block_literal_global_28_0);
  return (id)addressesAttributeKey_sInstance;
}

void __46__EDSearchableIndexItem_addressesAttributeKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("com_apple_mail_addresses"), 1, 0, 0, 0);
  v1 = (void *)addressesAttributeKey_sInstance;
  addressesAttributeKey_sInstance = v0;

}

- (id)calendarEventsAttributeKey
{
  if (calendarEventsAttributeKey_onceToken != -1)
    dispatch_once(&calendarEventsAttributeKey_onceToken, &__block_literal_global_29_1);
  return (id)calendarEventsAttributeKey_sInstance;
}

void __51__EDSearchableIndexItem_calendarEventsAttributeKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("com_apple_mail_calendar_events"), 1, 0, 0, 0);
  v1 = (void *)calendarEventsAttributeKey_sInstance;
  calendarEventsAttributeKey_sInstance = v0;

}

- (id)trackingNumbersAttributeKey
{
  if (trackingNumbersAttributeKey_onceToken != -1)
    dispatch_once(&trackingNumbersAttributeKey_onceToken, &__block_literal_global_30_1);
  return (id)trackingNumbersAttributeKey_sInstance;
}

void __52__EDSearchableIndexItem_trackingNumbersAttributeKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("com_apple_mail_tracking_numbers"), 1, 0, 0, 0);
  v1 = (void *)trackingNumbersAttributeKey_sInstance;
  trackingNumbersAttributeKey_sInstance = v0;

}

- (id)flightNumbersAttributeKey
{
  if (flightNumbersAttributeKey_onceToken != -1)
    dispatch_once(&flightNumbersAttributeKey_onceToken, &__block_literal_global_31_0);
  return (id)flightNumbersAttributeKey_sInstance;
}

void __50__EDSearchableIndexItem_flightNumbersAttributeKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("com_apple_mail_flight_numbers"), 1, 0, 0, 0);
  v1 = (void *)flightNumbersAttributeKey_sInstance;
  flightNumbersAttributeKey_sInstance = v0;

}

- (NSString)domainIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[EDSearchableIndexItem baseMessage](self, "baseMessage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_domainIdentifierForBaseMessage:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (BOOL)shouldExcludeFromIndex
{
  void *v2;
  void *v3;
  BOOL v4;

  -[EDSearchableIndexItem baseMessage](self, "baseMessage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mailbox");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (BOOL)requiresPreprocessing
{
  return 0;
}

- (unint64_t)estimatedSizeInBytes
{
  void *v3;
  unint64_t v4;

  if (self->_bodyData)
    return -[NSData length](self->_bodyData, "length");
  -[EDSearchableIndexItem baseMessage](self, "baseMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileSize");

  return v4;
}

- (id)fetchIndexableAttachments
{
  -[EDSearchableIndexItem doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDSearchableIndexItem fetchIndexableAttachments]", "EDSearchableIndexItem.m", 243, "0");
}

- (void)setNeedsAllAttributesIndexingType
{
  int64_t v3;
  int64_t v4;
  NSObject *v5;
  void *v6;
  CSSearchableItem *searchableItem;
  int v8;
  void *v9;
  __int16 v10;
  int64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[EDSearchableIndexItem indexingType](self, "indexingType");
  if (v3)
  {
    v4 = v3;
    +[EDSearchableIndexItem log](EDSearchableIndexItem, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[EDSearchableIndexItem identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543874;
      v9 = v6;
      v10 = 2048;
      v11 = v4;
      v12 = 2048;
      v13 = 0;
      _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Upgrading item %{public}@ from type:%ld to type:%ld", (uint8_t *)&v8, 0x20u);

    }
    -[EDSearchableIndexItem setIndexingType:](self, "setIndexingType:", 0);
    self->_fetchBody = 1;
    searchableItem = self->_searchableItem;
    self->_searchableItem = 0;

  }
}

- (void)setNeedsAllAttributesIncludingDataDetectionResultsIndexingType
{
  int64_t v3;
  int64_t v4;
  NSObject *v5;
  void *v6;
  CSSearchableItem *searchableItem;
  int v8;
  void *v9;
  __int16 v10;
  int64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = -[EDSearchableIndexItem indexingType](self, "indexingType");
  if (v3 != 5)
  {
    v4 = v3;
    +[EDSearchableIndexItem log](EDSearchableIndexItem, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      -[EDSearchableIndexItem identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543874;
      v9 = v6;
      v10 = 2048;
      v11 = v4;
      v12 = 2048;
      v13 = 5;
      _os_log_impl(&dword_1D2F2C000, v5, OS_LOG_TYPE_DEFAULT, "Upgrading item %{public}@ from type:%ld to type:%ld", (uint8_t *)&v8, 0x20u);

    }
    -[EDSearchableIndexItem setIndexingType:](self, "setIndexingType:", 5);
    self->_fetchBody = 1;
    searchableItem = self->_searchableItem;
    self->_searchableItem = 0;

  }
}

- (void)addFlagsAttributesToAttributeSet:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "searchableMessageFlagsForBaseMessage:", self->_baseMessage);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addToAttributes:", v5);

}

- (void)addMailCategoryAttributesToAttributeSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  EDSearchableMessageCategoryUpdate *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EDSearchableIndexItem message](self, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && objc_msgSend(v6, "state"))
  {
    +[EDSearchableIndexItem log](EDSearchableIndexItem, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[EDSearchableIndexItem message](self, "message");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v6;
      v16 = 2114;
      v17 = v8;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_INFO, "Indexing category: %{public}@ for message: %{public}@", (uint8_t *)&v14, 0x16u);

    }
    v9 = -[EDSearchableMessageCategoryUpdate initWithCategory:]([EDSearchableMessageCategoryUpdate alloc], "initWithCategory:", v6);
    -[EDSearchableMessageCategoryUpdate addToAttributes:](v9, "addToAttributes:", v4);
LABEL_9:

    goto LABEL_10;
  }
  -[EDSearchableIndexItem message](self, "message");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mailbox");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "type");

  if (v12 != 7)
  {
    +[EDSearchableIndexItem log](EDSearchableIndexItem, "log");
    v9 = (EDSearchableMessageCategoryUpdate *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
    {
      -[EDSearchableIndexItem message](self, "message");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[EDSearchableIndexItem addMailCategoryAttributesToAttributeSet:].cold.1(v13, (uint64_t)&v14, &v9->super);
    }
    goto LABEL_9;
  }
LABEL_10:

}

- (void)addUpdatableAttributesToAttributeSet:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "searchableMessageUpdateForBaseMessage:", self->_baseMessage);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addToAttributes:", v5);

}

- (void)addStaticAttributesToAttributeSet:(id)a3
{
  void *v4;
  char v5;
  _BOOL4 v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  EDSearchableMessage *v30;
  _BOOL8 v31;
  void *v32;
  char v33;
  BOOL v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  EDSearchableMessage *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  _QWORD v59[4];
  _QWORD v60[4];
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  unint64_t v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v56 = a3;
  -[EDSearchableIndexItem bodyData](self, "bodyData");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("IndexDecryptedMessages"));

  v6 = (v5 & 1) != 0
    || !-[EDSearchableIndexItem isEncrypted](self, "isEncrypted")
    || -[EDSearchableIndexItem includeEncryptedBody](self, "includeEncryptedBody");
  if (!v57 && v6)
  {
    v7 = -[EDSearchableIndexItem estimatedSizeInBytes](self, "estimatedSizeInBytes");
    if (v7 <= 0x2000000)
    {
      buf[0] = 0;
      -[EDBaseMessage bestAlternativePart:](self->_baseMessage, "bestAlternativePart:", buf);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dataUsingEncoding:", 4);
      v57 = (void *)objc_claimAutoreleasedReturnValue();

      -[EDSearchableIndexItem setHasCompleteData:](self, "setHasCompleteData:", buf[0]);
    }
    else
    {
      +[EDSearchableIndexItem log](EDSearchableIndexItem, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        -[EDSearchableIndexItem identifier](self, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v62 = v9;
        v63 = 2048;
        v64 = v7;
        _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "Skipping body indexing for message %{public}@ due to large message size:%lu", buf, 0x16u);

      }
      v57 = 0;
    }
  }
  -[EDBaseMessage mailbox](self->_baseMessage, "mailbox");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v44, "type");
  -[EDBaseMessage subject](self->_baseMessage, "subject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "subjectWithoutPrefix");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = v13;
  if (!objc_msgSend(v13, "length") && v11 != 5)
  {
    v59[0] = CFSTR("mailboxtype");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v60[0] = v14;
    v59[1] = CFSTR("identifier");
    -[EDSearchableIndexItem identifier](self, "identifier");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v17 = CFSTR("<null>");
    if (v15)
      v17 = (const __CFString *)v15;
    v60[1] = v17;
    v59[2] = CFSTR("hasCompleteContent");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[EDSearchableIndexItem hasCompleteData](self, "hasCompleteData"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v60[2] = v18;
    v59[3] = CFSTR("hasHeaders");
    v19 = (void *)MEMORY[0x1E0CB37E8];
    -[EDBaseMessage headersDictionary](self->_baseMessage, "headersDictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "numberWithInt:", objc_msgSend(v20, "count") != 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v60[3] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    +[EDSearchableIndexItem log](EDSearchableIndexItem, "log");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[EDSearchableIndexItem addStaticAttributesToAttributeSet:].cold.1((uint64_t)v22, v23, v24);

  }
  -[EDSearchableIndexItem message](self, "message");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = (void *)MEMORY[0x1E0CB3940];
    -[EDSearchableIndexItem message](self, "message");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("%lld"), objc_msgSend(v27, "globalMessageID"));
    v28 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28 = 0;
  }
  v45 = (void *)v28;
  if (_os_feature_enabled_impl() && EMIsGreymatterSupportedWithOverride())
  {
    -[EDSearchableIndexItem message](self, "message");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "notificationID");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v52 = 0;
  }
  -[EDBaseMessage account](self->_baseMessage, "account");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "searchableMessageUpdateForBaseMessage:", self->_baseMessage);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "searchableMessageAttachmentsForBaseMessage:includeEncryptedBody:", self->_baseMessage, -[EDSearchableIndexItem includeEncryptedBody](self, "includeEncryptedBody"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = [EDSearchableMessage alloc];
  -[EDBaseMessage dateSent](self->_baseMessage, "dateSent");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDBaseMessage dateReceived](self->_baseMessage, "dateReceived");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = -[EDSearchableIndexItem isEncrypted](self, "isEncrypted");
  -[EDBaseMessage senders](self->_baseMessage, "senders");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDBaseMessage to](self->_baseMessage, "to");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDBaseMessage cc](self->_baseMessage, "cc");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDBaseMessage bcc](self->_baseMessage, "bcc");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDBaseMessage headersDictionary](self->_baseMessage, "headersDictionary");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v32 = v57;
  else
    v32 = 0;
  v33 = -[EDBaseMessage isPartOfExistingThread](self->_baseMessage, "isPartOfExistingThread");
  v34 = -[EDSearchableIndexItem hasCompleteData](self, "hasCompleteData");
  objc_msgSend(v58, "identifier");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v58, "isManaged");
  objc_msgSend((id)objc_opt_class(), "csAccountTypeString");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "emailAddressStrings");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v42) = v36;
  BYTE1(v41) = v34;
  LOBYTE(v41) = v33;
  v39 = -[EDSearchableMessage initWithSubjectWithoutPrefix:dateSent:dateReceived:isEncrypted:priority:senders:to:cc:bcc:allHeaders:htmlContent:messageID:notificationID:isPartOfExistingThread:hasCompleteData:accountIdentifier:accountIsManaged:accountType:accountEmailAddresses:update:attachments:](v30, "initWithSubjectWithoutPrefix:dateSent:dateReceived:isEncrypted:priority:senders:to:cc:bcc:allHeaders:htmlContent:messageID:notificationID:isPartOfExistingThread:hasCompleteData:accountIdentifier:accountIsManaged:accountType:accountEmailAddresses:update:attachments:", v46, v43, v53, v31, 0, v49, v48, v50, v51, v54, v32, v45, v52, v41, v35,
          v42,
          v37,
          v38,
          v55,
          v47);

  -[EDSearchableIndexItem identifier](self, "identifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[EDSearchableMessage addToAttributes:forIdentifier:](v39, "addToAttributes:forIdentifier:", v56, v40);

}

- (void)addDataDetectionAttributesToAttributeSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSString *identifier;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  EDSearchableIndexItem *v16;
  uint8_t buf[4];
  NSString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (_os_feature_enabled_impl())
  {
    -[EDSearchableIndexItem message](self, "message");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[EDSearchableIndexItem message](self, "message");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dataDetectionAttributes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __66__EDSearchableIndexItem_addDataDetectionAttributesToAttributeSet___block_invoke;
      v14 = &unk_1E94A0F38;
      v15 = v4;
      v16 = self;
      objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", &v11);
      +[EDSearchableIndexItem log](EDSearchableIndexItem, "log", v11, v12, v13, v14);
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        identifier = self->_identifier;
        objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedDictionary:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = identifier;
        v19 = 2112;
        v20 = v10;
        _os_log_impl(&dword_1D2F2C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@]: Adding data detection results\n%@", buf, 0x16u);

      }
    }
  }

}

void __66__EDSearchableIndexItem_addDataDetectionAttributesToAttributeSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v5 = a3;
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("link")))
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "linksAttributeKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forCustomKey:", v5, v7);
LABEL_13:

    goto LABEL_14;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("address")))
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "addressesAttributeKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setValue:forCustomKey:", v5, v7);
    goto LABEL_13;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("calendarEvent")))
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "calendarEventsAttributeKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:forCustomKey:", v5, v7);
    goto LABEL_13;
  }
  if (objc_msgSend(v13, "isEqualToString:", CFSTR("phoneNumber")))
  {
    v10 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "phoneNumbersAttributeKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setValue:forCustomKey:", v5, v7);
    goto LABEL_13;
  }
  if (objc_msgSend(v13, "isEqual:", CFSTR("TrackingNumber")))
  {
    v11 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "trackingNumbersAttributeKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setValue:forCustomKey:", v5, v7);
    goto LABEL_13;
  }
  if (objc_msgSend(v13, "isEqual:", CFSTR("FlightInformation")))
  {
    v12 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "flightNumbersAttributeKey");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:forCustomKey:", v5, v7);
    goto LABEL_13;
  }
LABEL_14:

}

- (void)preprocess
{
  -[EDSearchableIndexItem doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDSearchableIndexItem preprocess]", "EDSearchableIndexItem.m", 404, "0");
}

- (BOOL)shouldIndexImmediatelyPostPreprocessing
{
  return 0;
}

- (id)searchableItem
{
  CSSearchableItem *searchableItem;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  CSSearchableItem *v14;
  CSSearchableItem *v15;
  void *v16;
  BOOL v17;
  uint64_t v18;

  searchableItem = self->_searchableItem;
  if (!searchableItem)
  {
    v5 = objc_alloc(MEMORY[0x1E0CA6B50]);
    objc_msgSend((id)*MEMORY[0x1E0CEC4D0], "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithItemContentType:", v6);

    objc_msgSend(MEMORY[0x1E0D1E1E8], "externalDataTypeIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setProviderDataTypeIdentifiers:", v8);

    v9 = -[EDSearchableIndexItem indexingType](self, "indexingType");
    switch(v9)
    {
      case 0:
        goto LABEL_7;
      case 1:
        goto LABEL_12;
      case 2:
        -[EDSearchableIndexItem addUpdatableAttributesToAttributeSet:](self, "addUpdatableAttributesToAttributeSet:", v7);
        goto LABEL_8;
      case 3:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDSearchableIndexItem.m"), 448, CFSTR("EDSearchableIndexItem has invalid indexingType = EDIndexableItemIndexingTypeAttachment"));
        goto LABEL_10;
      case 4:
        -[EDSearchableIndexItem addDataDetectionAttributesToAttributeSet:](self, "addDataDetectionAttributesToAttributeSet:", v7);
        break;
      case 5:
        -[EDSearchableIndexItem addDataDetectionAttributesToAttributeSet:](self, "addDataDetectionAttributesToAttributeSet:", v7);
LABEL_7:
        -[EDSearchableIndexItem addStaticAttributesToAttributeSet:](self, "addStaticAttributesToAttributeSet:", v7);
LABEL_8:
        -[EDSearchableIndexItem addMailCategoryAttributesToAttributeSet:](self, "addMailCategoryAttributesToAttributeSet:", v7);
        break;
      case 6:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDSearchableIndexItem.m"), 452, CFSTR("EDSearchableIndexItem has invalid indexingType = EDIndexableItemIndexingTypeRichLinks"));
LABEL_10:

        break;
      case 7:
        -[EDSearchableIndexItem addMailCategoryAttributesToAttributeSet:](self, "addMailCategoryAttributesToAttributeSet:", v7);
LABEL_12:
        -[EDSearchableIndexItem addFlagsAttributesToAttributeSet:](self, "addFlagsAttributesToAttributeSet:", v7);
        break;
      default:
        break;
    }
    v11 = objc_alloc(MEMORY[0x1E0CA6B48]);
    -[EDSearchableIndexItem identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[EDSearchableIndexItem domainIdentifier](self, "domainIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (CSSearchableItem *)objc_msgSend(v11, "initWithUniqueIdentifier:domainIdentifier:attributeSet:", v12, v13, v7);
    v15 = self->_searchableItem;
    self->_searchableItem = v14;

    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CSSearchableItem setExpirationDate:](self->_searchableItem, "setExpirationDate:", v16);

    if (v9)
      v17 = v9 == 5;
    else
      v17 = 1;
    v18 = !v17;
    -[CSSearchableItem setIsUpdate:](self->_searchableItem, "setIsUpdate:", v18);

    searchableItem = self->_searchableItem;
  }
  return searchableItem;
}

- (BOOL)alwaysMarkAsIndexed
{
  return 1;
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

- (EDPersistedMessage)message
{
  return self->_message;
}

- (NSData)bodyData
{
  return self->_bodyData;
}

- (void)setBodyData:(id)a3
{
  objc_storeStrong((id *)&self->_bodyData, a3);
}

- (BOOL)isEncrypted
{
  return self->_isEncrypted;
}

- (void)setIsEncrypted:(BOOL)a3
{
  self->_isEncrypted = a3;
}

- (BOOL)includeEncryptedBody
{
  return self->_includeEncryptedBody;
}

- (void)setIncludeEncryptedBody:(BOOL)a3
{
  self->_includeEncryptedBody = a3;
}

- (BOOL)fetchBody
{
  return self->_fetchBody;
}

- (BOOL)hasCompleteData
{
  return self->_hasCompleteData;
}

- (void)setHasCompleteData:(BOOL)a3
{
  self->_hasCompleteData = a3;
}

- (EDBaseMessage)baseMessage
{
  return self->_baseMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseMessage, 0);
  objc_storeStrong((id *)&self->_bodyData, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_searchableItem, 0);
}

+ (id)csIdentifierForMailbox:(id)a3
{
  id v3;
  id *v4;
  void *v5;
  id v6;

  v3 = a3;
  switch(objc_msgSend(v3, "type"))
  {
    case 1:
      v4 = (id *)MEMORY[0x1E0CA5EB0];
      goto LABEL_10;
    case 2:
      v4 = (id *)MEMORY[0x1E0CA5E98];
      goto LABEL_10;
    case 3:
      v4 = (id *)MEMORY[0x1E0CA5EC0];
      goto LABEL_10;
    case 4:
      v4 = (id *)MEMORY[0x1E0CA5EB8];
      goto LABEL_10;
    case 5:
      v4 = (id *)MEMORY[0x1E0CA5EA0];
      goto LABEL_10;
    case 6:
      v4 = (id *)kEDSearchableIndexOutboxIdentifier;
      goto LABEL_10;
    case 7:
      v4 = (id *)MEMORY[0x1E0CA5EA8];
LABEL_10:
      v6 = *v4;
      break;
    default:
      objc_msgSend(v3, "URL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "absoluteString");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      break;
  }

  return v6;
}

- (void)addMailCategoryAttributesToAttributeSet:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a3, (uint64_t)a3, "Inbox message is not categorized before indexing: %{public}@", (uint8_t *)a2);

}

- (void)addStaticAttributesToAttributeSet:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_4(&dword_1D2F2C000, a2, a3, "Warning: about to index message with an empty subject. %{public}@", (uint8_t *)&v3);
}

@end
