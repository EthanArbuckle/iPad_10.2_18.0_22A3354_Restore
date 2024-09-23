@implementation SGTextMessage

- (SGTextMessage)initWithSearchableItem:(id)a3
{
  id v5;
  void *v6;
  SGTextMessage *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  id v22;
  void *v23;
  SGTextMessage *v24;
  void *v25;
  int v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  uint64_t v40;
  NSString *attachmentFilename;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint8_t buf[16];
  objc_super v62;
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "domainIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGTextMessage.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchableItem.domainIdentifier"));

  }
  v62.receiver = self;
  v62.super_class = (Class)SGTextMessage;
  v7 = -[SGMessage initWithSearchableItem:](&v62, sel_initWithSearchableItem_, v5);
  if (v7)
  {
    v8 = (void *)MEMORY[0x1C3BD4F6C]();
    objc_msgSend(v5, "attributeSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "authors");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "count"))
    {
      v54 = v10;
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0D80FB0];
      objc_msgSend(v11, "handles");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sanitizeHandles:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "displayName");
      v15 = objc_claimAutoreleasedReturnValue();
      v55 = v8;
      v56 = v5;
      if (v15)
      {
        v16 = (void *)v15;
        v17 = v9;
        v18 = v11;
        objc_msgSend(v11, "displayName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v14, "containsObject:", v19);

        if (v20)
        {
          sgLogHandle();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1C3607000, v21, OS_LOG_TYPE_DEBUG, "Suppressing non-meaningful text message displayName.", buf, 2u);
          }

          v22 = objc_alloc(MEMORY[0x1E0CA6B10]);
          objc_msgSend(v11, "handleIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)objc_msgSend(v22, "initWithDisplayName:handles:handleIdentifier:", 0, v14, v23);

        }
      }
      else
      {
        v17 = v9;
      }
      v24 = v7;
      -[SGTextMessage setSender:](v7, "setSender:", v11);
      v53 = v11;
      objc_msgSend(v11, "handleIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqual:", *MEMORY[0x1E0C96740]);

      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v27 = v14;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
      if (v28)
      {
        v29 = v28;
        v30 = *(_QWORD *)v58;
        do
        {
          for (i = 0; i != v29; ++i)
          {
            if (*(_QWORD *)v58 != v30)
              objc_enumerationMutation(v27);
            v32 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * i);
            objc_msgSend(v17, "accountHandles");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v33, "containsObject:", v32);

            if (v34)
            {
              v24->_senderIsAccountOwner = 1;
              -[SGMessage setIsSent:](v24, "setIsSent:", 1);
            }
            if (v26 && objc_msgSend(v32, "hasPrefix:", CFSTR("urn:biz:")))
              v24->_senderIsBusinessChat = 1;
          }
          v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v57, v63, 16);
        }
        while (v29);
      }

      v7 = v24;
      v8 = v55;
      v5 = v56;
      v9 = v17;
      v10 = v54;
    }
    objc_msgSend(v9, "primaryRecipients");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGTextMessage setRecipients:](v7, "setRecipients:", v35);

    objc_msgSend(v5, "domainIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "isEqualToString:", CFSTR("attachmentDomain"));

    if (v37)
    {
      objc_msgSend(v9, "accountIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGTextMessage setConversationIdentifier:](v7, "setConversationIdentifier:", v38);

      objc_msgSend(v9, "contentURL");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "lastPathComponent");
      v40 = objc_claimAutoreleasedReturnValue();
      attachmentFilename = v7->_attachmentFilename;
      v7->_attachmentFilename = (NSString *)v40;

    }
    else
    {
      objc_msgSend(v5, "domainIdentifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGTextMessage setConversationIdentifier:](v7, "setConversationIdentifier:", v39);
    }

    objc_msgSend((id)objc_opt_class(), "_photoPathCustomKey");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v42)
    {
      objc_msgSend(v5, "attributeSet");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "valueForCustomKey:", v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      if (v44)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v44, "length"))
            -[SGTextMessage setPhotoPath:](v7, "setPhotoPath:", v44);
        }
      }

    }
    objc_msgSend((id)objc_opt_class(), "_nicknameCustomKey");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (v45)
    {
      objc_msgSend(v5, "attributeSet");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "valueForCustomKey:", v45);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      if (v47)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v47, "length"))
            -[SGTextMessage setNickname:](v7, "setNickname:", v47);
        }
      }

    }
    objc_msgSend(v5, "attributeSet");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "isPotentialEventMessage");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49;
    if (!v49)
      v49 = (void *)MEMORY[0x1E0C9AAA0];
    v7->_isPotentialEventMessage = objc_msgSend(v49, "BOOLValue");

    objc_autoreleasePoolPop(v8);
  }

  return v7;
}

- (SGTextMessage)initWithMessagesContentEvent:(id)a3 contentProtection:(id)a4
{
  id v6;
  SGTextMessage *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  CSPerson *v18;
  CSPerson *sender;
  CSPerson *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  uint64_t v27;
  NSString *conversationIdentifier;
  void *v29;
  uint64_t v30;
  NSString *attachmentFilename;
  uint64_t v32;
  NSString *photoPath;
  uint64_t v34;
  NSString *nickname;
  objc_super v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v37.receiver = self;
  v37.super_class = (Class)SGTextMessage;
  v7 = -[SGMessage initWithMessagesContentEvent:contentProtection:](&v37, sel_initWithMessagesContentEvent_contentProtection_, v6, a4);
  if (v7)
  {
    objc_msgSend(v6, "content");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGMessage setTextContent:](v7, "setTextContent:", v8);

    objc_msgSend(v6, "fromHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "containsString:", v12);

    if (v13)
    {

      v10 = 0;
    }
    v14 = objc_alloc(MEMORY[0x1E0CA6B10]);
    objc_msgSend(v9, "handle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (CSPerson *)objc_msgSend(v14, "initWithDisplayName:handles:handleIdentifier:", v10, v16, v17);

    sender = v7->_sender;
    v7->_sender = v18;
    v20 = v18;

    v7->_senderIsAccountOwner = 0;
    -[SGMessage setIsSent:](v7, "setIsSent:", 0);
    objc_msgSend(v6, "accountHandles");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handle");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = objc_msgSend(v21, "containsObject:", v22);

    if ((_DWORD)v17)
    {
      v7->_senderIsAccountOwner = 1;
      -[SGMessage setIsSent:](v7, "setIsSent:", 1);
    }
    objc_msgSend(v9, "handleType");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqual:", *MEMORY[0x1E0C96740]);

    if (v24)
    {
      objc_msgSend(v9, "handle");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "hasPrefix:", CFSTR("urn:biz:"));

      if (v26)
        v7->_senderIsBusinessChat = 1;
    }
    objc_msgSend(v6, "accountIdentifier");
    v27 = objc_claimAutoreleasedReturnValue();
    conversationIdentifier = v7->_conversationIdentifier;
    v7->_conversationIdentifier = (NSString *)v27;

    objc_msgSend(v6, "attachment");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "filename");
    v30 = objc_claimAutoreleasedReturnValue();
    attachmentFilename = v7->_attachmentFilename;
    v7->_attachmentFilename = (NSString *)v30;

    objc_msgSend(v6, "suggestedPhotoPath");
    v32 = objc_claimAutoreleasedReturnValue();
    photoPath = v7->_photoPath;
    v7->_photoPath = (NSString *)v32;

    objc_msgSend(v6, "suggestedNickname");
    v34 = objc_claimAutoreleasedReturnValue();
    nickname = v7->_nickname;
    v7->_nickname = (NSString *)v34;

  }
  return v7;
}

- (SGTextMessage)initWithMessageDictionary:(id)a3
{
  id v4;
  SGTextMessage *v5;
  uint64_t v6;
  NSString *conversationIdentifier;
  void *v8;
  uint64_t v9;
  CSPerson *sender;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SGTextMessage;
  v5 = -[SGMessage initWithMessageDictionary:](&v12, sel_initWithMessageDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("conversationIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    conversationIdentifier = v5->_conversationIdentifier;
    v5->_conversationIdentifier = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("senderIsAccountOwner"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_senderIsAccountOwner = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sender"));
    v9 = objc_claimAutoreleasedReturnValue();
    sender = v5->_sender;
    v5->_sender = (CSPerson *)v9;

  }
  return v5;
}

- (id)spotlightBundleIdentifier
{
  void *v2;
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SGTextMessage;
  -[SGMessage spotlightBundleIdentifier](&v6, sel_spotlightBundleIdentifier);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)*MEMORY[0x1E0D19A38];
  v4 = v2;

  return v4;
}

- (id)spotlightDomainIdentifier
{
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  void *v10;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v12.receiver = self;
  v12.super_class = (Class)SGTextMessage;
  -[SGMessage spotlightDomainIdentifier](&v12, sel_spotlightDomainIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    -[SGTextMessage conversationIdentifier](self, "conversationIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      sgLogHandle();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        -[SGMessage spotlightUniqueIdentifier](self, "spotlightUniqueIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v14 = v10;
        _os_log_fault_impl(&dword_1C3607000, v5, OS_LOG_TYPE_FAULT, "Cannot get domain identifier for text message %@", buf, 0xCu);

      }
      if (_PASEvaluateLogFaultAndProbCrashCriteria())
        abort();
      v6 = objc_alloc(MEMORY[0x1E0CB3940]);
      -[SGMessage uniqueIdentifier](self, "uniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("SGMissingDomainIdentifier.uniqueIdentifierFallback.%@"), v7);

      if (!v4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGTextMessage.m"), 245, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

      }
    }
  }
  v8 = v4;

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SGTextMessage;
  v4 = -[SGMessage copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setSender:", self->_sender);
  objc_msgSend(v4, "setRecipients:", self->_recipients);
  objc_msgSend(v4, "setConversationIdentifier:", self->_conversationIdentifier);
  *((_BYTE *)v4 + 168) = self->_senderIsAccountOwner;
  objc_storeStrong(v4 + 27, self->_attachmentFilename);
  return v4;
}

- (CSPerson)sender
{
  return (CSPerson *)objc_getProperty(self, a2, 176, 1);
}

- (void)setSender:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (NSArray)recipients
{
  return (NSArray *)objc_getProperty(self, a2, 184, 1);
}

- (void)setRecipients:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (NSString)conversationIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 192, 1);
}

- (void)setConversationIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (BOOL)senderIsAccountOwner
{
  return self->_senderIsAccountOwner;
}

- (void)setSenderIsAccountOwner:(BOOL)a3
{
  self->_senderIsAccountOwner = a3;
}

- (NSString)nickname
{
  return (NSString *)objc_getProperty(self, a2, 200, 1);
}

- (void)setNickname:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (NSString)photoPath
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setPhotoPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (BOOL)senderIsBusinessChat
{
  return self->_senderIsBusinessChat;
}

- (NSString)attachmentFilename
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (BOOL)isPotentialEventMessage
{
  return self->_isPotentialEventMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentFilename, 0);
  objc_storeStrong((id *)&self->_photoPath, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_conversationIdentifier, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_sender, 0);
}

+ (id)_photoPathCustomKey
{
  if (_photoPathCustomKey_onceToken != -1)
    dispatch_once(&_photoPathCustomKey_onceToken, &__block_literal_global);
  return (id)_photoPathCustomKey__photoPathCustomKey;
}

+ (id)_nicknameCustomKey
{
  if (_nicknameCustomKey_onceToken != -1)
    dispatch_once(&_nicknameCustomKey_onceToken, &__block_literal_global_21);
  return (id)_nicknameCustomKey__nicknameCustomKey;
}

+ (BOOL)isSent:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "attributeSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v4, "firstObject", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(v3, "accountHandles");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v10) = objc_msgSend(v11, "containsObject:", v10);

          if ((v10 & 1) != 0)
          {
            LOBYTE(v7) = 1;
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

void __35__SGTextMessage__nicknameCustomKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("com_apple_mobilesms_suggested_contact_name"), 0, 0, 0, 0);
  v1 = (void *)_nicknameCustomKey__nicknameCustomKey;
  _nicknameCustomKey__nicknameCustomKey = v0;

}

void __36__SGTextMessage__photoPathCustomKey__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AC0]), "initWithKeyName:searchable:searchableByDefault:unique:multiValued:", CFSTR("com_apple_mobilesms_suggested_contact_photo"), 0, 0, 0, 0);
  v1 = (void *)_photoPathCustomKey__photoPathCustomKey;
  _photoPathCustomKey__photoPathCustomKey = v0;

}

@end
