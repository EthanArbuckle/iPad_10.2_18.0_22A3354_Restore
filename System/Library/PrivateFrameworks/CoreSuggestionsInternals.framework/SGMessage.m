@implementation SGMessage

- (id)spotlightReference
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[SGMessage spotlightBundleIdentifier](self, "spotlightBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGMessage spotlightUniqueIdentifier](self, "spotlightUniqueIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
  {
    v7 = (void *)MEMORY[0x1E0D81078];
    -[SGMessage spotlightDomainIdentifier](self, "spotlightDomainIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "referenceWithBundleId:domainId:itemIds:", v3, v8, v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)initForBuilding
{
  SGMessage *v2;
  uint64_t v3;
  _PASCachedResult *isInhumanSenderCached;
  uint64_t v5;
  _PASCachedResult *isInhumanContentCached;
  uint64_t v7;
  _PASCachedResult *textContentLanguageIdentifierCached;
  uint64_t v9;
  _PASCachedResult *taggedCharacterRangesCached;
  uint64_t v11;
  _PASCachedResult *messageSubjectDetectedDataCached;
  uint64_t v13;
  _PASCachedResult *dataDetectorMatchesWithSignatureForContentCached;
  NSString *source;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)SGMessage;
  v2 = -[SGMessage init](&v17, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    isInhumanSenderCached = v2->_isInhumanSenderCached;
    v2->_isInhumanSenderCached = (_PASCachedResult *)v3;

    v5 = objc_opt_new();
    isInhumanContentCached = v2->_isInhumanContentCached;
    v2->_isInhumanContentCached = (_PASCachedResult *)v5;

    v7 = objc_opt_new();
    textContentLanguageIdentifierCached = v2->_textContentLanguageIdentifierCached;
    v2->_textContentLanguageIdentifierCached = (_PASCachedResult *)v7;

    v9 = objc_opt_new();
    taggedCharacterRangesCached = v2->_taggedCharacterRangesCached;
    v2->_taggedCharacterRangesCached = (_PASCachedResult *)v9;

    v11 = objc_opt_new();
    messageSubjectDetectedDataCached = v2->_messageSubjectDetectedDataCached;
    v2->_messageSubjectDetectedDataCached = (_PASCachedResult *)v11;

    v13 = objc_opt_new();
    dataDetectorMatchesWithSignatureForContentCached = v2->_dataDetectorMatchesWithSignatureForContentCached;
    v2->_dataDetectorMatchesWithSignatureForContentCached = (_PASCachedResult *)v13;

    source = v2->_source;
    v2->_source = (NSString *)CFSTR("Internal");

    objc_storeStrong((id *)&v2->_contentProtection, (id)*MEMORY[0x1E0CB2AE0]);
  }
  return v2;
}

- (SGMessage)initWithSearchableItem:(id)a3
{
  id v4;
  SGMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *attachments;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  NSString *contentProtection;
  _QWORD v25[4];
  id v26;

  v4 = a3;
  v5 = -[SGMessage init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "attributeSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "subject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMessage setSubject:](v5, "setSubject:", v7);

    objc_msgSend(MEMORY[0x1E0D80FB0], "textContentNoCopyRetainingBackingBuffer:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMessage setTextContent:](v5, "setTextContent:", v8);

    objc_msgSend(v6, "contentCreationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMessage setDate:](v5, "setDate:", v9);

    objc_msgSend(v4, "bundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMessage setBundleIdentifier:](v5, "setBundleIdentifier:", v10);

    objc_msgSend(v4, "uniqueIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMessage setUniqueIdentifier:](v5, "setUniqueIdentifier:", v11);

    objc_msgSend(v6, "attributeForKey:", *MEMORY[0x1E0CA69F8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMessage setMailConversationIdentifier:](v5, "setMailConversationIdentifier:", v12);

    objc_msgSend(v4, "domainIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMessage setDomainIdentifier:](v5, "setDomainIdentifier:", v13);

    objc_msgSend(v6, "accountHandles");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMessage setAccountHandles:](v5, "setAccountHandles:", v14);

    objc_msgSend(v6, "accountType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMessage setAccountType:](v5, "setAccountType:", v15);

    objc_msgSend(v4, "domainIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMessage setSource:](v5, "setSource:", v16);

    +[SGMailAttachment attachmentsFromSearchableItem:](SGMailAttachment, "attachmentsFromSearchableItem:", v4);
    v17 = objc_claimAutoreleasedReturnValue();
    attachments = v5->_attachments;
    v5->_attachments = (NSArray *)v17;

    v19 = (void *)MEMORY[0x1E0D80F90];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __36__SGMessage_initWithSearchableItem___block_invoke;
    v25[3] = &unk_1E7DB15A0;
    v20 = v4;
    v26 = v20;
    objc_msgSend(v20, "bundleID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isStoredEncrypted = objc_msgSend(v19, "searchableItemIsStoredEncryptedWithGetterBlock:bundleIdentifier:", v25, v21);

    objc_msgSend(v20, "protection");
    v22 = objc_claimAutoreleasedReturnValue();
    contentProtection = v5->_contentProtection;
    v5->_contentProtection = (NSString *)v22;

  }
  return v5;
}

- (SGMessage)initWithMailContentEvent:(id)a3 contentProtection:(id)a4
{
  id v6;
  id v7;
  SGMessage *v8;
  uint64_t v9;
  NSString *subject;
  id v11;
  uint64_t v12;
  NSDate *date;
  uint64_t v14;
  NSString *uniqueIdentifier;
  uint64_t v16;
  NSString *domainIdentifier;
  uint64_t v18;
  NSString *source;
  uint64_t v20;
  NSArray *accountHandles;
  uint64_t v22;
  NSString *accountType;
  void *v24;
  uint64_t v25;
  NSArray *attachments;
  void *v27;

  v6 = a3;
  v7 = a4;
  v8 = -[SGMessage init](self, "init");
  if (v8)
  {
    objc_msgSend(v6, "subject");
    v9 = objc_claimAutoreleasedReturnValue();
    subject = v8->_subject;
    v8->_subject = (NSString *)v9;

    v11 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v6, "absoluteTimestamp");
    v12 = objc_msgSend(v11, "initWithTimeIntervalSinceReferenceDate:");
    date = v8->_date;
    v8->_date = (NSDate *)v12;

    objc_storeStrong((id *)&v8->_bundleIdentifier, (id)*MEMORY[0x1E0D80FD0]);
    objc_msgSend(v6, "uniqueId");
    v14 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v8->_uniqueIdentifier;
    v8->_uniqueIdentifier = (NSString *)v14;

    objc_msgSend(v6, "domainId");
    v16 = objc_claimAutoreleasedReturnValue();
    domainIdentifier = v8->_domainIdentifier;
    v8->_domainIdentifier = (NSString *)v16;

    objc_msgSend(v6, "accountIdentifier");
    v18 = objc_claimAutoreleasedReturnValue();
    source = v8->_source;
    v8->_source = (NSString *)v18;

    objc_msgSend(v6, "accountHandles");
    v20 = objc_claimAutoreleasedReturnValue();
    accountHandles = v8->_accountHandles;
    v8->_accountHandles = (NSArray *)v20;

    objc_msgSend(v6, "accountType");
    v22 = objc_claimAutoreleasedReturnValue();
    accountType = v8->_accountType;
    v8->_accountType = (NSString *)v22;

    objc_msgSend(v6, "attachments");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGMailAttachment attachmentsFromBiomeAttachments:](SGMailAttachment, "attachmentsFromBiomeAttachments:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    attachments = v8->_attachments;
    v8->_attachments = (NSArray *)v25;

    objc_msgSend(v6, "securityMethod");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_isStoredEncrypted = v27 != 0;

    objc_storeStrong((id *)&v8->_contentProtection, a4);
  }

  return v8;
}

- (SGMessage)initWithMessagesContentEvent:(id)a3 contentProtection:(id)a4
{
  id v6;
  id v7;
  SGMessage *v8;
  id v9;
  uint64_t v10;
  NSDate *date;
  uint64_t v12;
  NSString *uniqueIdentifier;
  uint64_t v14;
  NSString *domainIdentifier;
  uint64_t v16;
  NSString *source;
  uint64_t v18;
  NSArray *accountHandles;
  uint64_t v20;
  NSString *accountType;

  v6 = a3;
  v7 = a4;
  v8 = -[SGMessage init](self, "init");
  if (v8)
  {
    v9 = objc_alloc(MEMORY[0x1E0C99D68]);
    objc_msgSend(v6, "absoluteTimestamp");
    v10 = objc_msgSend(v9, "initWithTimeIntervalSinceReferenceDate:");
    date = v8->_date;
    v8->_date = (NSDate *)v10;

    objc_storeStrong((id *)&v8->_bundleIdentifier, (id)*MEMORY[0x1E0D80FE0]);
    objc_msgSend(v6, "uniqueId");
    v12 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v8->_uniqueIdentifier;
    v8->_uniqueIdentifier = (NSString *)v12;

    objc_msgSend(v6, "domainId");
    v14 = objc_claimAutoreleasedReturnValue();
    domainIdentifier = v8->_domainIdentifier;
    v8->_domainIdentifier = (NSString *)v14;

    objc_msgSend(v6, "domainId");
    v16 = objc_claimAutoreleasedReturnValue();
    source = v8->_source;
    v8->_source = (NSString *)v16;

    objc_msgSend(v6, "accountHandles");
    v18 = objc_claimAutoreleasedReturnValue();
    accountHandles = v8->_accountHandles;
    v8->_accountHandles = (NSArray *)v18;

    objc_msgSend(v6, "accountType");
    v20 = objc_claimAutoreleasedReturnValue();
    accountType = v8->_accountType;
    v8->_accountType = (NSString *)v20;

    v8->_isStoredEncrypted = 0;
    objc_storeStrong((id *)&v8->_contentProtection, a4);
  }

  return v8;
}

- (SGMessage)initWithCoder:(id)a3
{
  id v4;
  SGMessage *v5;
  void *v6;
  uint64_t v7;
  NSString *textContent;
  void *v9;
  uint64_t v10;
  NSString *subject;
  void *v12;
  uint64_t v13;
  NSDate *date;
  void *v15;
  uint64_t v16;
  NSString *source;
  void *v18;
  uint64_t v19;
  NSString *bundleIdentifier;
  void *v21;
  uint64_t v22;
  NSString *uniqueIdentifier;
  void *v24;
  uint64_t v25;
  NSString *mailConversationIdentifier;
  void *v27;
  uint64_t v28;
  NSString *domainIdentifier;
  void *v30;
  uint64_t v31;
  NSString *accountType;
  void *v33;
  uint64_t v34;
  NSString *contentProtection;

  v4 = a3;
  v5 = -[SGMessage init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("textContent"));
    v7 = objc_claimAutoreleasedReturnValue();
    textContent = v5->_textContent;
    v5->_textContent = (NSString *)v7;

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("subject"));
    v10 = objc_claimAutoreleasedReturnValue();
    subject = v5->_subject;
    v5->_subject = (NSString *)v10;

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("date"));
    v13 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v13;

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("source"));
    v16 = objc_claimAutoreleasedReturnValue();
    source = v5->_source;
    v5->_source = (NSString *)v16;

    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, CFSTR("bundleIdentifier"));
    v19 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v19;

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("uniqueIdentifier"));
    v22 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v5->_uniqueIdentifier;
    v5->_uniqueIdentifier = (NSString *)v22;

    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("mailConversationIdentifier"));
    v25 = objc_claimAutoreleasedReturnValue();
    mailConversationIdentifier = v5->_mailConversationIdentifier;
    v5->_mailConversationIdentifier = (NSString *)v25;

    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v27, CFSTR("domainIdentifier"));
    v28 = objc_claimAutoreleasedReturnValue();
    domainIdentifier = v5->_domainIdentifier;
    v5->_domainIdentifier = (NSString *)v28;

    v5->_isSent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSent"));
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("accountType"));
    v31 = objc_claimAutoreleasedReturnValue();
    accountType = v5->_accountType;
    v5->_accountType = (NSString *)v31;

    v5->_isStoredEncrypted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isStoredEncrypted"));
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("contentProtection"));
    v34 = objc_claimAutoreleasedReturnValue();
    contentProtection = v5->_contentProtection;
    v5->_contentProtection = (NSString *)v34;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *textContent;
  id v5;

  textContent = self->_textContent;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", textContent, CFSTR("textContent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subject, CFSTR("subject"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_source, CFSTR("source"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifier, CFSTR("bundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uniqueIdentifier, CFSTR("uniqueIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mailConversationIdentifier, CFSTR("mailConversationIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_domainIdentifier, CFSTR("domainIdentifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSent, CFSTR("isSent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accountType, CFSTR("accountType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isStoredEncrypted, CFSTR("isStoredEncrypted"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contentProtection, CFSTR("contentProtection"));

}

- (SGMessage)initWithMessageDictionary:(id)a3
{
  id v4;
  SGMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *attachments;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;

  v4 = a3;
  v5 = -[SGMessage init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("body"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMessage setTextContent:](v5, "setTextContent:", v6);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("date"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("date"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGMessage setDate:](v5, "setDate:", v8);
    }
    else
    {
      v9 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("date"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dateWithTimeIntervalSince1970:", (double)objc_msgSend(v8, "longValue"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGMessage setDate:](v5, "setDate:", v10);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subject"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMessage setSubject:](v5, "setSubject:", v11);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMessage setBundleIdentifier:](v5, "setBundleIdentifier:", v12);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uniqueIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMessage setUniqueIdentifier:](v5, "setUniqueIdentifier:", v13);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mailConversationIdentifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMessage setMailConversationIdentifier:](v5, "setMailConversationIdentifier:", v14);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("domainIdentifier"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMessage setDomainIdentifier:](v5, "setDomainIdentifier:", v15);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accountHandles"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMessage setAccountHandles:](v5, "setAccountHandles:", v16);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attachments"));
    v17 = objc_claimAutoreleasedReturnValue();
    attachments = v5->_attachments;
    v5->_attachments = (NSArray *)v17;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isSent"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isSent = objc_msgSend(v19, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accountType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMessage setAccountType:](v5, "setAccountType:", v20);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isStoredEncrypted"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isStoredEncrypted = objc_msgSend(v21, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sourceId"));
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)v22;
    if (v22)
      v24 = (const __CFString *)v22;
    else
      v24 = CFSTR("test-source");
    -[SGMessage setSource:](v5, "setSource:", v24);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("contentProtection"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMessage setContentProtection:](v5, "setContentProtection:", v25);

  }
  return v5;
}

- (BOOL)isEqualToMessage:(id)a3
{
  SGMessage *v4;
  SGMessage *v5;
  NSString *textContent;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  char v11;
  NSString *subject;
  NSString *v13;
  NSString *v14;
  NSString *v15;
  char v16;
  NSDate *date;
  NSDate *v18;
  NSDate *v19;
  NSDate *v20;
  char v21;
  NSString *source;
  NSString *v23;
  NSString *v24;
  NSString *v25;
  char v26;
  NSString *bundleIdentifier;
  NSString *v28;
  NSString *v29;
  NSString *v30;
  char v31;
  NSString *uniqueIdentifier;
  NSString *v33;
  NSString *v34;
  NSString *v35;
  char v36;
  NSString *mailConversationIdentifier;
  NSString *v38;
  NSString *v39;
  NSString *v40;
  char v41;
  NSString *domainIdentifier;
  NSString *v43;
  NSString *v44;
  NSString *v45;
  char v46;
  _BOOL4 isSent;
  NSString *accountType;
  NSString *v49;
  NSString *v50;
  NSString *v51;
  char v52;
  _BOOL4 isStoredEncrypted;
  NSString *v54;
  NSString *v55;

  v4 = (SGMessage *)a3;
  v5 = v4;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    textContent = self->_textContent;
    v7 = v4->_textContent;
    if (textContent == v7)
    {

    }
    else
    {
      v8 = v7;
      v9 = textContent;
      v10 = -[NSString isEqual:](v9, "isEqual:", v8);

      if ((v10 & 1) == 0)
        goto LABEL_43;
    }
    subject = self->_subject;
    v13 = v5->_subject;
    if (subject == v13)
    {

    }
    else
    {
      v14 = v13;
      v15 = subject;
      v16 = -[NSString isEqual:](v15, "isEqual:", v14);

      if ((v16 & 1) == 0)
        goto LABEL_43;
    }
    date = self->_date;
    v18 = v5->_date;
    if (date == v18)
    {

    }
    else
    {
      v19 = v18;
      v20 = date;
      v21 = -[NSDate isEqual:](v20, "isEqual:", v19);

      if ((v21 & 1) == 0)
        goto LABEL_43;
    }
    source = self->_source;
    v23 = v5->_source;
    if (source == v23)
    {

    }
    else
    {
      v24 = v23;
      v25 = source;
      v26 = -[NSString isEqual:](v25, "isEqual:", v24);

      if ((v26 & 1) == 0)
        goto LABEL_43;
    }
    bundleIdentifier = self->_bundleIdentifier;
    v28 = v5->_bundleIdentifier;
    if (bundleIdentifier == v28)
    {

    }
    else
    {
      v29 = v28;
      v30 = bundleIdentifier;
      v31 = -[NSString isEqual:](v30, "isEqual:", v29);

      if ((v31 & 1) == 0)
        goto LABEL_43;
    }
    uniqueIdentifier = self->_uniqueIdentifier;
    v33 = v5->_uniqueIdentifier;
    if (uniqueIdentifier == v33)
    {

    }
    else
    {
      v34 = v33;
      v35 = uniqueIdentifier;
      v36 = -[NSString isEqual:](v35, "isEqual:", v34);

      if ((v36 & 1) == 0)
        goto LABEL_43;
    }
    mailConversationIdentifier = self->_mailConversationIdentifier;
    v38 = v5->_mailConversationIdentifier;
    if (mailConversationIdentifier == v38)
    {

    }
    else
    {
      v39 = v38;
      v40 = mailConversationIdentifier;
      v41 = -[NSString isEqual:](v40, "isEqual:", v39);

      if ((v41 & 1) == 0)
        goto LABEL_43;
    }
    domainIdentifier = self->_domainIdentifier;
    v43 = v5->_domainIdentifier;
    if (domainIdentifier == v43)
    {

    }
    else
    {
      v44 = v43;
      v45 = domainIdentifier;
      v46 = -[NSString isEqual:](v45, "isEqual:", v44);

      if ((v46 & 1) == 0)
        goto LABEL_43;
    }
    isSent = self->_isSent;
    if (isSent != -[SGMessage isSent](v5, "isSent"))
      goto LABEL_43;
    accountType = self->_accountType;
    v49 = v5->_accountType;
    if (accountType == v49)
    {

    }
    else
    {
      v50 = v49;
      v51 = accountType;
      v52 = -[NSString isEqual:](v51, "isEqual:", v50);

      if ((v52 & 1) == 0)
        goto LABEL_43;
    }
    isStoredEncrypted = self->_isStoredEncrypted;
    if (isStoredEncrypted != -[SGMessage isStoredEncrypted](v5, "isStoredEncrypted"))
    {
LABEL_43:
      v11 = 0;
      goto LABEL_44;
    }
    v54 = self->_contentProtection;
    v55 = v54;
    if (v54 == v5->_contentProtection)
      v11 = 1;
    else
      v11 = -[NSString isEqual:](v54, "isEqual:");

  }
LABEL_44:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SGMessage textContent](self, "textContent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextContent:", v5);

  -[SGMessage subject](self, "subject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSubject:", v6);

  -[SGMessage date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDate:", v7);

  -[SGMessage source](self, "source");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSource:", v8);

  -[SGMessage bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBundleIdentifier:", v9);

  -[SGMessage uniqueIdentifier](self, "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUniqueIdentifier:", v10);

  -[SGMessage mailConversationIdentifier](self, "mailConversationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMailConversationIdentifier:", v11);

  -[SGMessage domainIdentifier](self, "domainIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDomainIdentifier:", v12);

  objc_msgSend(v4, "setIsSent:", self->_isSent);
  objc_msgSend(v4, "setAccountType:", self->_accountType);
  objc_msgSend(v4, "setIsStoredEncrypted:", self->_isStoredEncrypted);
  objc_msgSend(v4, "setContentProtection:", self->_contentProtection);
  return v4;
}

- (id)asDictionary
{
  void *v3;
  void *v4;
  NSString *textContent;
  NSString *bundleIdentifier;
  NSString *uniqueIdentifier;
  NSString *mailConversationIdentifier;
  NSString *domainIdentifier;
  NSString *subject;
  NSDate *date;
  void *v12;
  double v13;
  void *v14;
  NSString *accountType;
  NSString *source;
  NSString *contentProtection;

  if (asDictionary_onceToken_25517 != -1)
    dispatch_once(&asDictionary_onceToken_25517, &__block_literal_global_25518);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithSharedKeySet:", asDictionary_sharedKeySet_25520);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  textContent = self->_textContent;
  if (textContent)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", textContent, CFSTR("body"));
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", bundleIdentifier, CFSTR("bundleIdentifier"));
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", uniqueIdentifier, CFSTR("uniqueIdentifier"));
  mailConversationIdentifier = self->_mailConversationIdentifier;
  if (mailConversationIdentifier)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", mailConversationIdentifier, CFSTR("mailConversationIdentifier"));
  domainIdentifier = self->_domainIdentifier;
  if (domainIdentifier)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", domainIdentifier, CFSTR("domainIdentifier"));
  subject = self->_subject;
  if (subject)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", subject, CFSTR("subject"));
  date = self->_date;
  if (date)
  {
    v12 = (void *)MEMORY[0x1E0CB37E8];
    -[NSDate timeIntervalSince1970](date, "timeIntervalSince1970");
    objc_msgSend(v12, "numberWithLong:", (uint64_t)v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("date"));

  }
  if (self->_isSent)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isSent"));
  accountType = self->_accountType;
  if (accountType)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", accountType, CFSTR("accountType"));
  if (self->_isStoredEncrypted)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isStoredEncrypted"));
  source = self->_source;
  if (source)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", source, CFSTR("sourceId"));
  contentProtection = self->_contentProtection;
  if (contentProtection)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", contentProtection, CFSTR("contentProtection"));
  return v4;
}

- (NSString)textContentLanguageIdentifier
{
  _PASCachedResult *textContentLanguageIdentifierCached;
  _QWORD v4[5];

  textContentLanguageIdentifierCached = self->_textContentLanguageIdentifierCached;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__SGMessage_textContentLanguageIdentifier__block_invoke;
  v4[3] = &unk_1E7DB15E8;
  v4[4] = self;
  -[_PASCachedResult resultNonnullWithBlock:](textContentLanguageIdentifierCached, "resultNonnullWithBlock:", v4);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isInhumanSender
{
  _PASCachedResult *isInhumanSenderCached;
  void *v3;
  char v4;
  _QWORD v6[5];

  isInhumanSenderCached = self->_isInhumanSenderCached;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__SGMessage_isInhumanSender__block_invoke;
  v6[3] = &unk_1E7DB1610;
  v6[4] = self;
  -[_PASCachedResult resultNonnullWithBlock:](isInhumanSenderCached, "resultNonnullWithBlock:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isInhumanContentNoncached
{
  void *v2;
  BOOL v3;

  -[SGMessage textContent](self, "textContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = +[SGInhumans isInhumanBody:](SGInhumans, "isInhumanBody:", v2);
  else
    v3 = 0;

  return v3;
}

- (BOOL)isInhumanContent
{
  _PASCachedResult *isInhumanContentCached;
  void *v3;
  char v4;
  _QWORD v6[5];

  isInhumanContentCached = self->_isInhumanContentCached;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __29__SGMessage_isInhumanContent__block_invoke;
  v6[3] = &unk_1E7DB1610;
  v6[4] = self;
  -[_PASCachedResult resultNonnullWithBlock:](isInhumanContentCached, "resultNonnullWithBlock:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (NSArray)taggedCharacterRanges
{
  _PASCachedResult *taggedCharacterRangesCached;
  _QWORD v4[5];

  taggedCharacterRangesCached = self->_taggedCharacterRangesCached;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34__SGMessage_taggedCharacterRanges__block_invoke;
  v4[3] = &unk_1E7DB17E0;
  v4[4] = self;
  -[_PASCachedResult resultNonnullWithBlock:](taggedCharacterRangesCached, "resultNonnullWithBlock:", v4);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)messageSubjectDetectedData
{
  _PASCachedResult *messageSubjectDetectedDataCached;
  _QWORD v4[5];

  messageSubjectDetectedDataCached = self->_messageSubjectDetectedDataCached;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __39__SGMessage_messageSubjectDetectedData__block_invoke;
  v4[3] = &unk_1E7DB17E0;
  v4[4] = self;
  -[_PASCachedResult resultNonnullWithBlock:](messageSubjectDetectedDataCached, "resultNonnullWithBlock:", v4);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)dataDetectorMatchesWithSignature
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SGMessage textContent](self, "textContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, objc_msgSend(v3, "length"));
  -[SGMessage date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGDataDetectorMatch detectionsAndSignatureInText:eligibleRegions:baseDate:](SGDataDetectorMatch, "detectionsAndSignatureInText:eligibleRegions:baseDate:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)plainTextDetectedData
{
  void *v2;
  void *v3;

  -[SGMessage _dataDetectorMatchesWithSignatureCached](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "matches");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (_NSRange)detectedDataSignatureRange
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[SGMessage _dataDetectorMatchesWithSignatureCached](self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "signatureRange");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (int64_t)contentLength
{
  void *v2;
  int64_t v3;

  -[SGMessage textContent](self, "textContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  return v3;
}

- (id)spotlightBundleIdentifier
{
  return self->_bundleIdentifier;
}

- (id)spotlightDomainIdentifier
{
  return self->_domainIdentifier;
}

- (id)spotlightUniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_attachments, a3);
}

- (NSString)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)textContent
{
  return self->_textContent;
}

- (void)setTextContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)mailConversationIdentifier
{
  return self->_mailConversationIdentifier;
}

- (void)setMailConversationIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (void)setDomainIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (NSArray)accountHandles
{
  return self->_accountHandles;
}

- (void)setAccountHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)isSent
{
  return self->_isSent;
}

- (void)setIsSent:(BOOL)a3
{
  self->_isSent = a3;
}

- (NSString)accountType
{
  return self->_accountType;
}

- (void)setAccountType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)isStoredEncrypted
{
  return self->_isStoredEncrypted;
}

- (void)setIsStoredEncrypted:(BOOL)a3
{
  self->_isStoredEncrypted = a3;
}

- (SGHarvestQueueMetrics)harvestMetrics
{
  return self->_harvestMetrics;
}

- (void)setHarvestMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_harvestMetrics, a3);
}

- (NSString)contentProtection
{
  return self->_contentProtection;
}

- (void)setContentProtection:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentProtection, 0);
  objc_storeStrong((id *)&self->_harvestMetrics, 0);
  objc_storeStrong((id *)&self->_accountType, 0);
  objc_storeStrong((id *)&self->_accountHandles, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_mailConversationIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_textContent, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_textContentLanguageIdentifierCached, 0);
  objc_storeStrong((id *)&self->_dataDetectorMatchesWithSignatureForContentCached, 0);
  objc_storeStrong((id *)&self->_messageSubjectDetectedDataCached, 0);
  objc_storeStrong((id *)&self->_taggedCharacterRangesCached, 0);
  objc_storeStrong((id *)&self->_isInhumanContentCached, 0);
  objc_storeStrong((id *)&self->_isInhumanSenderCached, 0);
}

- (_QWORD)_dataDetectorMatchesWithSignatureCached
{
  void *v1;
  _QWORD v3[5];

  if (a1)
  {
    v1 = (void *)a1[5];
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __52__SGMessage__dataDetectorMatchesWithSignatureCached__block_invoke;
    v3[3] = &unk_1E7DB1678;
    v3[4] = a1;
    objc_msgSend(v1, "resultNonnullWithBlock:", v3);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

id __52__SGMessage__dataDetectorMatchesWithSignatureCached__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "harvestMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startTimer:", kHarvestMetricsMessageDetectedData);

  objc_msgSend(*(id *)(a1 + 32), "dataDetectorMatchesWithSignature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "harvestMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = kHarvestMetricsMessageDetectedData;
  objc_msgSend(v3, "matches");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endTimer:significantWork:", v5, objc_msgSend(v6, "count") != 0);

  return v3;
}

id __39__SGMessage_messageSubjectDetectedData__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "harvestMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startTimer:", kHarvestMetricsMessageSubjectDetectedData);

  objc_msgSend(*(id *)(a1 + 32), "subject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGDataDetectorMatch detectionsInPlainText:baseDate:](SGDataDetectorMatch, "detectionsInPlainText:baseDate:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "_pas_filteredArrayWithTest:", &__block_literal_global_58_25508);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "harvestMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endTimer:significantWork:", kHarvestMetricsMessageSubjectDetectedData, objc_msgSend(v6, "count") != 0);

  return v6;
}

BOOL __39__SGMessage_messageSubjectDetectedData__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "matchType") == 7;
}

id __34__SGMessage_taggedCharacterRanges__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  SGTaggedCharacterRange *v13;
  unsigned int v14;
  __CFString *v15;
  __CFString *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  SGTaggedCharacterRange *v20;
  void *v21;
  id obj;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __CFString *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v24 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "textContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "plainTextDetectedData");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v26;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x1C3BD4F6C]();
        v9 = (void *)MEMORY[0x1C3BD4F6C]();
        v10 = objc_msgSend(v7, "valueRange");
        objc_msgSend(v2, "substringWithRange:", v10, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v9);
        if (v12)
        {
          v13 = [SGTaggedCharacterRange alloc];
          v14 = objc_msgSend(v7, "matchType");
          v15 = CFSTR("SGDDMatchOther");
          if (v14 <= 8)
            v15 = off_1E7DAE7C8[v14];
          v16 = v15;
          v29 = v16;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v7, "valueRange");
          v20 = -[SGTaggedCharacterRange initWithAnnotationType:tags:range:text:](v13, "initWithAnnotationType:tags:range:text:", 1, v17, v18, v19, v12);
          objc_msgSend(v24, "addObject:", v20);

        }
        objc_autoreleasePoolPop(v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v4);
  }

  v21 = (void *)objc_msgSend(v24, "copy");
  return v21;
}

uint64_t __29__SGMessage_isInhumanContent__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "harvestMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startTimer:", kHarvestMetricsMessageInhumanBody);

  v3 = objc_msgSend(*(id *)(a1 + 32), "isInhumanContentNoncached");
  objc_msgSend(*(id *)(a1 + 32), "harvestMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endTimer:significantWork:", kHarvestMetricsMessageInhumanBody, v3);

  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
}

id __28__SGMessage_isInhumanSender__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _BOOL8 v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "author");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0CB37E8];
  if (v1)
    v3 = +[SGInhumans isInhumanPerson:](SGInhumans, "isInhumanPerson:", v1);
  else
    v3 = 0;
  objc_msgSend(v2, "numberWithInt:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __42__SGMessage_textContentLanguageIdentifier__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "textContent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = (void *)MEMORY[0x1E0D70A90];
    +[SGMessage preferredLanguages](SGMessage, "preferredLanguages");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "detectLanguageFromTextHeuristicallyWithLanguages:languages:defaultLanguage:", v1, v3, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "languageCode");
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "languageCode");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

void __25__SGMessage_asDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D80], "sharedKeySetForKeys:", &unk_1E7E10A10);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)asDictionary_sharedKeySet_25520;
  asDictionary_sharedKeySet_25520 = v0;

}

id __36__SGMessage_initWithSearchableItem___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)messageWithSearchableItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSearchableItem:", v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)fromDictionary:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithMessageDictionary:", v4);

  return v5;
}

+ (id)preferredLanguages
{
  if (preferredLanguages__pasOnceToken4 != -1)
    dispatch_once(&preferredLanguages__pasOnceToken4, &__block_literal_global_61_25576);
  return (id)preferredLanguages__pasExprOnceResult;
}

void __31__SGMessage_preferredLanguages__block_invoke()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  v1 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_mappedArrayWithTransform:", &__block_literal_global_63_25577);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v1, "initWithArray:", v3);
  v5 = (void *)preferredLanguages__pasExprOnceResult;
  preferredLanguages__pasExprOnceResult = v4;

  objc_autoreleasePoolPop(v0);
}

id __31__SGMessage_preferredLanguages__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C997E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
