@implementation SGPipelineEntity

- (SGPipelineEntity)initWithDuplicateKey:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v16;
  pthread_mutexattr_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SGPipelineEntity;
  v8 = -[SGEntity init](&v16, sel_init);
  if (v8)
  {
    v9 = objc_opt_new();
    v10 = (void *)*((_QWORD *)v8 + 32);
    *((_QWORD *)v8 + 32) = v9;

    v11 = objc_opt_new();
    v12 = (void *)*((_QWORD *)v8 + 33);
    *((_QWORD *)v8 + 33) = v11;

    v8[272] = 0;
    v8[288] = 0;
    *(_OWORD *)(v8 + 504) = xmmword_1C385A570;
    v13 = objc_opt_new();
    v14 = (void *)*((_QWORD *)v8 + 53);
    *((_QWORD *)v8 + 53) = v13;

    *(_QWORD *)(v8 + 290) = 196351;
    v8[298] = 0;
    v8[368] = 0;
    v8[392] = 0;
    *(_OWORD *)(v8 + 376) = xmmword_1C385A570;
    v17.__sig = 0;
    *(_QWORD *)v17.__opaque = 0;
    pthread_mutexattr_init(&v17);
    pthread_mutexattr_settype(&v17, 2);
    pthread_mutex_init((pthread_mutex_t *)(v8 + 304), &v17);
    pthread_mutexattr_destroy(&v17);
    objc_msgSend(v8, "setDuplicateKey:", v6);
    objc_msgSend(v8, "setTitle:", v7);
  }

  return (SGPipelineEntity *)v8;
}

- (SGPipelineEntity)initWithEmailMessage:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  SGPipelineEntity *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSString *accountType;
  id v40;
  uint64_t v41;
  _PASLazyResult *lazySnippetsContent;
  void *v44;
  _QWORD v45[4];
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v5, "messageId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(v5, "uniqueIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    sgLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v7;
      _os_log_impl(&dword_1C3607000, v8, OS_LOG_TYPE_INFO, "Message-Id header not found. Using hash: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v5, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGDuplicateKey duplicateKeyForEmailWithSource:messageId:](SGDuplicateKey, "duplicateKeyForEmailWithSource:messageId:", v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SGPipelineEntity initWithDuplicateKey:title:](self, "initWithDuplicateKey:title:", v10, v11);

  if (v12)
  {
    v44 = v6;
    objc_msgSend(v5, "source");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGEntity setSourceKey:](v12, "setSourceKey:", v13);

    objc_msgSend(v5, "appleMailMessageId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v15 = (void *)MEMORY[0x1E0D197F0];
      objc_msgSend(v5, "appleMailMessageId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "source");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "appleMailMessageId:fromSource:", v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGEntity addTag:](v12, "addTag:", v18);

    }
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    objc_msgSend(v5, "mailboxIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v48;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v48 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(MEMORY[0x1E0D197F0], "mailboxIdentifier:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v23));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGEntity addTag:](v12, "addTag:", v24);

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      }
      while (v21);
    }

    if (objc_msgSend(v5, "isSent"))
    {
      objc_msgSend(MEMORY[0x1E0D197F0], "isSent");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGEntity addTag:](v12, "addTag:", v25);

    }
    objc_msgSend(v5, "date");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "timeIntervalSince1970");
    v28 = v27;
    -[SGPipelineEntity setLastModifiedTimestamp:](v12, "setLastModifiedTimestamp:");
    -[SGPipelineEntity setCreationTimestamp:](v12, "setCreationTimestamp:", v28);

    v12->_inhumanFeatures.hasInhumanHeaders = objc_msgSend(v5, "hasInhumanHeaders");
    objc_msgSend(v5, "from");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      if ((objc_msgSend(MEMORY[0x1E0D198F0], "detectContacts") & 1) != 0)
      {
        objc_msgSend(v5, "author");
        v30 = objc_claimAutoreleasedReturnValue();
        -[SGEntity setAuthor:](v12, "setAuthor:", v30);
      }
      else
      {
        sgLogHandle();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_debug_impl(&dword_1C3607000, v30, OS_LOG_TYPE_DEBUG, "Skipping setAuthor: detectContacts is OFF", buf, 2u);
        }
      }

    }
    v6 = v44;
    if (objc_msgSend(v5, "hasInhumanHeaders"))
    {
      v12->_messageInhumannessChecked = 1;
      objc_msgSend(MEMORY[0x1E0D197F0], "inhuman");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGEntity addTag:](v12, "addTag:", v31);

    }
    if (objc_msgSend(v5, "isPartiallyDownloaded"))
    {
      objc_msgSend(MEMORY[0x1E0D197F0], "isPartiallyDownloaded");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGEntity addTag:](v12, "addTag:", v32);

    }
    objc_msgSend(v5, "mailingList");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if (v33)
    {
      v35 = (void *)MEMORY[0x1E0D197F0];
      objc_msgSend(v33, "emailAddress");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "mailingListId:", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGEntity addTag:](v12, "addTag:", v37);

    }
    objc_msgSend(v5, "accountType");
    v38 = objc_claimAutoreleasedReturnValue();
    accountType = v12->_accountType;
    v12->_accountType = (NSString *)v38;

    objc_storeStrong((id *)&v12->_message, a3);
    objc_storeStrong((id *)&v12->_mailMessage, a3);
    v40 = objc_alloc(MEMORY[0x1E0D815E8]);
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __41__SGPipelineEntity_initWithEmailMessage___block_invoke;
    v45[3] = &unk_1E7DB15E8;
    v46 = v5;
    v41 = objc_msgSend(v40, "initWithBlock:", v45);
    lazySnippetsContent = v12->_lazySnippetsContent;
    v12->_lazySnippetsContent = (_PASLazyResult *)v41;

  }
  objc_autoreleasePoolPop(v6);

  return v12;
}

- (SGPipelineEntity)initWithTextMessage:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SGPipelineEntity *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v5 = a3;
  v6 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v5, "source");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGDuplicateKey duplicateKeyForTextMessageWithSource:uniqueIdentifier:](SGDuplicateKey, "duplicateKeyForTextMessageWithSource:uniqueIdentifier:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "subject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[SGPipelineEntity initWithDuplicateKey:title:](self, "initWithDuplicateKey:title:", v9, v10);

  if (v11)
  {
    objc_msgSend(v5, "textContent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGEntity setContent:](v11, "setContent:", v12);

    objc_msgSend(v5, "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSince1970");
    v15 = v14;
    -[SGPipelineEntity setLastModifiedTimestamp:](v11, "setLastModifiedTimestamp:");
    -[SGPipelineEntity setCreationTimestamp:](v11, "setCreationTimestamp:", v15);

    objc_msgSend(v5, "author");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGEntity setAuthor:](v11, "setAuthor:", v16);

    objc_msgSend(v5, "source");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGEntity setSourceKey:](v11, "setSourceKey:", v17);

    objc_msgSend(v5, "nickname");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGEntity setAuthorNickname:](v11, "setAuthorNickname:", v18);

    objc_msgSend(v5, "photoPath");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGEntity setAuthorPhotoPath:](v11, "setAuthorPhotoPath:", v19);

    objc_msgSend(MEMORY[0x1E0D197F0], "fromTextMessage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGEntity addTag:](v11, "addTag:", v20);

    objc_storeStrong((id *)&v11->_message, a3);
    objc_storeStrong((id *)&v11->_textMessage, a3);
    if (objc_msgSend(v5, "isSent"))
    {
      objc_msgSend(MEMORY[0x1E0D197F0], "isSent");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGEntity addTag:](v11, "addTag:", v21);

    }
  }

  objc_autoreleasePoolPop(v6);
  return v11;
}

- (SGPipelineEntity)initWithMessage:(id)a3
{
  id v4;
  SGPipelineEntity *v5;
  SGPipelineEntity *v6;
  NSObject *v7;
  uint8_t v9[16];

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[SGPipelineEntity initWithEmailMessage:](self, "initWithEmailMessage:", v4);
LABEL_5:
    self = v5;
    v6 = self;
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[SGPipelineEntity initWithTextMessage:](self, "initWithTextMessage:", v4);
    goto LABEL_5;
  }
  sgLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v9 = 0;
    _os_log_error_impl(&dword_1C3607000, v7, OS_LOG_TYPE_ERROR, "Unknown SGMessage subclass", v9, 2u);
  }

  v6 = 0;
LABEL_9:

  return v6;
}

- (SGPipelineEntity)initWithIntentPersonAtDate:(id)a3 bundleId:(id)a4 handle:(id)a5 displayName:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  SGPipelineEntity *v16;
  void *v18;
  void *v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPipelineEntity.m"), 240, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPipelineEntity.m"), 241, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handle"));

LABEL_3:
  +[SGDuplicateKey duplicateKeyForInteractionWithBundleId:personHandle:](SGDuplicateKey, "duplicateKeyForInteractionWithBundleId:personHandle:", v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[SGPipelineEntity initWithDuplicateKey:title:](self, "initWithDuplicateKey:title:", v15, v14);
  if (v16)
  {
    objc_msgSend(v11, "timeIntervalSince1970");
    -[SGPipelineEntity setCreationTimestamp:](v16, "setCreationTimestamp:");
  }

  return v16;
}

- (SGPipelineEntity)initWithInteraction:(id)a3 fromBundleIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SGPipelineEntity *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SGPipelineEntity initWithInteraction:identifier:fromBundleIdentifier:](self, "initWithInteraction:identifier:fromBundleIdentifier:", v7, v8, v6);

  return v9;
}

- (SGPipelineEntity)initWithInteraction:(id)a3 identifier:(id)a4 fromBundleIdentifier:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  SGPipelineEntity *v15;
  void *v17;
  void *v18;
  void *v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPipelineEntity.m"), 256, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interaction"));

  }
  if (!objc_msgSend(v11, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPipelineEntity.m"), 257, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier.length > 0"));

  }
  if (!objc_msgSend(v12, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPipelineEntity.m"), 258, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier.length > 0"));

  }
  objc_msgSend(v10, "dateInterval");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[SGPipelineEntity _initWithInteractionIdentifier:fromBundleIdentifier:creationTime:](self, "_initWithInteractionIdentifier:fromBundleIdentifier:creationTime:", v11, v12, v14);

  if (v15)
    objc_storeStrong((id *)&v15->_interaction, a3);

  return v15;
}

- (SGPipelineEntity)initWithInteractionIdentifier:(id)a3 fromBundleIdentifier:(id)a4
{
  return (SGPipelineEntity *)-[SGPipelineEntity _initWithInteractionIdentifier:fromBundleIdentifier:creationTime:](self, "_initWithInteractionIdentifier:fromBundleIdentifier:creationTime:", a3, a4, 0);
}

- (id)_initWithInteractionIdentifier:(id)a3 fromBundleIdentifier:(id)a4 creationTime:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  SGPipelineEntity *v13;
  void *v15;
  void *v16;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  if (!objc_msgSend(v11, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPipelineEntity.m"), 279, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interactionIdentifier.length > 0"));

  }
  if (!objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPipelineEntity.m"), 280, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier.length > 0"));

  }
  +[SGDuplicateKey duplicateKeyForInteractionIdentifier:fromBundleIdentifier:](SGDuplicateKey, "duplicateKeyForInteractionIdentifier:fromBundleIdentifier:", v11, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SGPipelineEntity initWithDuplicateKey:title:](self, "initWithDuplicateKey:title:", v12, v11);

  if (v10 && v13)
  {
    objc_msgSend(v10, "timeIntervalSince1970");
    -[SGPipelineEntity setCreationTimestamp:](v13, "setCreationTimestamp:");
  }

  return v13;
}

- (void)dealloc
{
  NSMutableArray *v3;
  void *v4;
  NSMutableArray *v5;
  NSObject *v6;
  objc_super v7;
  _QWORD block[4];
  NSMutableArray *v9;

  if (self->_flushExternalEnrichments)
  {
    v3 = self->_externalEnrichments;
    if (dealloc__pasOnceToken7 != -1)
      dispatch_once(&dealloc__pasOnceToken7, &__block_literal_global_6612);
    v4 = (void *)dealloc__pasExprOnceResult;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __27__SGPipelineEntity_dealloc__block_invoke_2;
    block[3] = &unk_1E7DB56F0;
    v9 = v3;
    v5 = v3;
    v6 = v4;
    dispatch_async(v6, block);

  }
  v7.receiver = self;
  v7.super_class = (Class)SGPipelineEntity;
  -[SGEntity dealloc](&v7, sel_dealloc);
}

- (NSString)snippetsContent
{
  return (NSString *)-[_PASLazyResult result](self->_lazySnippetsContent, "result");
}

- (NSArray)enrichments
{
  return (NSArray *)self->_enrichments;
}

- (void)addEnrichment:(id)a3
{
  -[NSMutableArray addObject:](self->_enrichments, "addObject:", a3);
}

- (void)addEnrichments:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableArray addObject:](self->_enrichments, "addObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)addOrReplaceEventEnrichment:(id)a3
{
  void *v5;
  unint64_t v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "duplicateKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPipelineEntity.m"), 347, CFSTR("a preferred enrichment must have a duplicateKey"));

  }
  if (!-[NSMutableArray count](self->_enrichments, "count"))
    goto LABEL_9;
  v6 = 0;
  v7 = 0;
  do
  {
    objc_msgSend(v11, "duplicateKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "entityType");

    if (v9 == 2)
    {
      -[NSMutableArray setObject:atIndexedSubscript:](self->_enrichments, "setObject:atIndexedSubscript:", v11, v6);
      v7 = 1;
    }
    ++v6;
  }
  while (v6 < -[NSMutableArray count](self->_enrichments, "count"));
  if ((v7 & 1) == 0)
LABEL_9:
    -[SGPipelineEntity addEnrichment:](self, "addEnrichment:", v11);

}

- (void)addOrReplacePreferredEnrichment:(id)a3
{
  void *v5;
  unint64_t v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "duplicateKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPipelineEntity.m"), 365, CFSTR("a preferred enrichment must have a duplicateKey"));

  }
  if (!-[NSMutableArray count](self->_enrichments, "count"))
    goto LABEL_9;
  v6 = 0;
  v7 = 0;
  do
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_enrichments, "objectAtIndexedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "duplicateKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "duplicateKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToDuplicateKey:", v10);

    if (v11)
    {
      -[NSMutableArray setObject:atIndexedSubscript:](self->_enrichments, "setObject:atIndexedSubscript:", v13, v6);
      v7 = 1;
    }
    ++v6;
  }
  while (v6 < -[NSMutableArray count](self->_enrichments, "count"));
  if ((v7 & 1) == 0)
LABEL_9:
    -[SGPipelineEntity addEnrichment:](self, "addEnrichment:", v13);

}

- (NSArray)externalEnrichments
{
  return (NSArray *)self->_externalEnrichments;
}

- (void)flushExternalEnrichmentsUponDealloc
{
  self->_flushExternalEnrichments = 1;
}

- (void)addExternalEnrichment:(id)a3
{
  -[NSMutableArray addObject:](self->_externalEnrichments, "addObject:", a3);
}

- (void)removeExternalEnrichmentAtIndex:(unint64_t)a3
{
  -[NSMutableArray removeObjectAtIndex:](self->_externalEnrichments, "removeObjectAtIndex:", a3);
}

- (NSArray)taggedCharacterRanges
{
  NSMutableArray **p_taggedCharacterRanges;
  NSMutableArray *taggedCharacterRanges;
  NSMutableArray *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  p_taggedCharacterRanges = &self->_taggedCharacterRanges;
  taggedCharacterRanges = self->_taggedCharacterRanges;
  if (taggedCharacterRanges)
  {
    v4 = taggedCharacterRanges;
  }
  else
  {
    -[SGPipelineEntity message](self, "message");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "taggedCharacterRanges");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    v8 = v7;
    if (!v7)
      v8 = (void *)objc_opt_new();
    objc_storeStrong((id *)p_taggedCharacterRanges, v8);
    v4 = v8;
    if (!v7)

  }
  return (NSArray *)v4;
}

- (void)addTaggedCharacterRanges:(id)a3
{
  id v4;
  NSMutableArray *taggedCharacterRanges;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  id v12;

  v4 = a3;
  taggedCharacterRanges = self->_taggedCharacterRanges;
  v12 = v4;
  if (!taggedCharacterRanges)
  {
    -[SGPipelineEntity message](self, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "taggedCharacterRanges");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    v9 = v8;
    if (v8)
      v10 = v8;
    else
      v10 = (NSMutableArray *)objc_opt_new();
    v11 = self->_taggedCharacterRanges;
    self->_taggedCharacterRanges = v10;

    taggedCharacterRanges = self->_taggedCharacterRanges;
    v4 = v12;
  }
  -[NSMutableArray addObjectsFromArray:](taggedCharacterRanges, "addObjectsFromArray:", v4);

}

- (void)stripEventInformation
{
  NSMutableArray *enrichments;
  id v3;

  enrichments = self->_enrichments;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_33_6608);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray filterUsingPredicate:](enrichments, "filterUsingPredicate:", v3);

}

- (void)setCreationTimestamp:(SGUnixTimestamp_)a3
{
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_enrichments;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "setCreationTimestamp:", a3.secondsFromUnixEpoch);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10.receiver = self;
  v10.super_class = (Class)SGPipelineEntity;
  -[SGEntity setCreationTimestamp:](&v10, sel_setCreationTimestamp_, a3.secondsFromUnixEpoch);
}

- (void)setLastModifiedTimestamp:(SGUnixTimestamp_)a3
{
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_enrichments;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "setLastModifiedTimestamp:", a3.secondsFromUnixEpoch);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10.receiver = self;
  v10.super_class = (Class)SGPipelineEntity;
  -[SGEntity setLastModifiedTimestamp:](&v10, sel_setLastModifiedTimestamp_, a3.secondsFromUnixEpoch);
}

- (void)addDetection:(id)a3 forIdentity:(id)a4 extractionInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  SGLabeledValue *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;

  v23 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v23, "label");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "extraction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  v13 = -[SGLabeledValue initWithLabel:value:]([SGLabeledValue alloc], "initWithLabel:value:", v12, v11);

  switch(objc_msgSend(v23, "type"))
  {
    case 0u:
      objc_msgSend(v23, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v23, "contextRangeOfInterest");
      -[SGPipelineEntity addDetectedPhoneNumber:forIdentity:context:contextRangeOfInterest:extractionInfo:](self, "addDetectedPhoneNumber:forIdentity:context:contextRangeOfInterest:extractionInfo:", v13, v8, v14, v15, v16, v9);
      goto LABEL_6;
    case 1u:
      objc_msgSend(v23, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v23, "contextRangeOfInterest");
      -[SGPipelineEntity addDetectedPostalAddress:forIdentity:context:contextRangeOfInterest:extractionInfo:](self, "addDetectedPostalAddress:forIdentity:context:contextRangeOfInterest:extractionInfo:", v13, v8, v14, v17, v18, v9);
      goto LABEL_6;
    case 2u:
      objc_msgSend(v23, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v23, "contextRangeOfInterest");
      -[SGPipelineEntity addDetectedEmailAddress:forIdentity:context:contextRangeOfInterest:extractionInfo:](self, "addDetectedEmailAddress:forIdentity:context:contextRangeOfInterest:extractionInfo:", v13, v8, v14, v19, v20, v9);
      goto LABEL_6;
    case 3u:
      objc_msgSend(v23, "context");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v23, "contextRangeOfInterest");
      -[SGPipelineEntity addDetectedBirthday:forIdentity:context:contextRangeOfInterest:extractionInfo:](self, "addDetectedBirthday:forIdentity:context:contextRangeOfInterest:extractionInfo:", v13, v8, v14, v21, v22, v9);
LABEL_6:

      break;
    default:
      break;
  }

}

- (void)addDetectedPostalAddress:(id)a3 forIdentity:(id)a4 context:(id)a5 contextRangeOfInterest:(_NSRange)a6 extractionInfo:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  id v16;
  void *v17;
  int IsContact;
  void *v19;
  void *v20;
  id v21;

  length = a6.length;
  location = a6.location;
  v21 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  -[SGEntity duplicateKey](self, "duplicateKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "entityType");
  IsContact = SGEntityTypeIsContact();

  if (IsContact)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPipelineEntity.m"), 479, CFSTR("Contacts can't have associated detected addresses."));

  }
  +[SGPipelineEnrichment address:forIdentity:parent:curated:context:contextRangeOfInterest:extractionInfo:](SGPipelineEnrichment, "address:forIdentity:parent:curated:context:contextRangeOfInterest:extractionInfo:", v21, v14, self, 0, v15, location, length, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGPipelineEntity addEnrichment:](self, "addEnrichment:", v19);

}

- (void)addDetectedPhoneNumber:(id)a3 forIdentity:(id)a4 context:(id)a5 contextRangeOfInterest:(_NSRange)a6 extractionInfo:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  id v16;
  void *v17;
  int IsContact;
  void *v19;
  void *v20;
  id v21;

  length = a6.length;
  location = a6.location;
  v21 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  -[SGEntity duplicateKey](self, "duplicateKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "entityType");
  IsContact = SGEntityTypeIsContact();

  if (IsContact)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPipelineEntity.m"), 495, CFSTR("Contacts can't have associated detected phone numbers."));

  }
  +[SGPipelineEnrichment phoneNumber:forIdentity:parent:curated:context:contextRangeOfInterest:extractionInfo:](SGPipelineEnrichment, "phoneNumber:forIdentity:parent:curated:context:contextRangeOfInterest:extractionInfo:", v21, v14, self, 0, v15, location, length, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGPipelineEntity addEnrichment:](self, "addEnrichment:", v19);

}

- (void)addEmailAddressEnrichment:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(MEMORY[0x1E0D1E450], "isLegalEmailAddress:", v5);

  if ((v6 & 1) != 0)
  {
    -[NSMutableArray addObject:](self->_enrichments, "addObject:", v4);
  }
  else
  {
    sgLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v4, "title");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = 136315138;
      v10 = objc_msgSend(v8, "UTF8String");
      _os_log_impl(&dword_1C3607000, v7, OS_LOG_TYPE_INFO, "Ignoring invalid email: %s", (uint8_t *)&v9, 0xCu);

    }
  }

}

- (void)addBirthdayEnrichment:(id)a3
{
  void *v5;
  int IsContact;
  void *v7;
  id v8;

  v8 = a3;
  -[SGEntity duplicateKey](self, "duplicateKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entityType");
  IsContact = SGEntityTypeIsContact();

  if (IsContact)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPipelineEntity.m"), 519, CFSTR("Contacts can't have associated detected birthdays."));

  }
  objc_msgSend(v8, "title");

  -[NSMutableArray addObject:](self->_enrichments, "addObject:", v8);
}

- (void)addDetectedEmailAddress:(id)a3 forIdentity:(id)a4 context:(id)a5 contextRangeOfInterest:(_NSRange)a6 extractionInfo:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  id v16;
  void *v17;
  int IsContact;
  void *v19;
  void *v20;
  id v21;

  length = a6.length;
  location = a6.location;
  v21 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  -[SGEntity duplicateKey](self, "duplicateKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "entityType");
  IsContact = SGEntityTypeIsContact();

  if (IsContact)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPipelineEntity.m"), 534, CFSTR("Contacts can't have associated detected email addresses."));

  }
  +[SGPipelineEnrichment emailAddress:forIdentity:parent:curated:context:contextRangeOfInterest:extractionInfo:](SGPipelineEnrichment, "emailAddress:forIdentity:parent:curated:context:contextRangeOfInterest:extractionInfo:", v21, v14, self, 0, v15, location, length, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGPipelineEntity addEmailAddressEnrichment:](self, "addEmailAddressEnrichment:", v19);

}

- (id)birthday:(id)a3 forIdentity:(id)a4 context:(id)a5 contextRangeOfInterest:(_NSRange)a6 extractionInfo:(id)a7
{
  return +[SGPipelineEnrichment birthday:forIdentity:parent:curated:context:contextRangeOfInterest:extractionInfo:](SGPipelineEnrichment, "birthday:forIdentity:parent:curated:context:contextRangeOfInterest:extractionInfo:", a3, a4, self, 0, a5, a6.location, a6.length, a7);
}

- (void)addDetectedBirthday:(id)a3 forIdentity:(id)a4 context:(id)a5 contextRangeOfInterest:(_NSRange)a6 extractionInfo:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  id v16;
  void *v17;
  int IsContact;
  void *v19;
  void *v20;
  id v21;

  length = a6.length;
  location = a6.location;
  v21 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  -[SGEntity duplicateKey](self, "duplicateKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "entityType");
  IsContact = SGEntityTypeIsContact();

  if (IsContact)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPipelineEntity.m"), 563, CFSTR("Contacts can't have associated detected birthdays."));

  }
  -[SGPipelineEntity birthday:forIdentity:context:contextRangeOfInterest:extractionInfo:](self, "birthday:forIdentity:context:contextRangeOfInterest:extractionInfo:", v21, v14, v15, location, length, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGPipelineEntity addBirthdayEnrichment:](self, "addBirthdayEnrichment:", v19);

}

- (void)addInstantMessageAddressEnrichment:(id)a3
{
  -[NSMutableArray addObject:](self->_enrichments, "addObject:", a3);
}

- (void)addDetectedInstantMessageAddress:(id)a3 forIdentity:(id)a4 context:(id)a5 contextRangeOfInterest:(_NSRange)a6 extractionInfo:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  id v16;
  void *v17;
  int IsContact;
  void *v19;
  void *v20;
  id v21;

  length = a6.length;
  location = a6.location;
  v21 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  -[SGEntity duplicateKey](self, "duplicateKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "entityType");
  IsContact = SGEntityTypeIsContact();

  if (IsContact)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPipelineEntity.m"), 585, CFSTR("Contacts can't have associated detected instant message addresses."));

  }
  +[SGPipelineEnrichment instantMessageAddress:forIdentity:parent:curated:context:contextRangeOfInterest:extractionInfo:](SGPipelineEnrichment, "instantMessageAddress:forIdentity:parent:curated:context:contextRangeOfInterest:extractionInfo:", v21, v14, self, 0, v15, location, length, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGPipelineEntity addInstantMessageAddressEnrichment:](self, "addInstantMessageAddressEnrichment:", v19);

}

- (void)addSocialProfileEnrichment:(id)a3
{
  -[NSMutableArray addObject:](self->_enrichments, "addObject:", a3);
}

- (void)addDetectedSocialProfile:(id)a3 forIdentity:(id)a4 context:(id)a5 contextRangeOfInterest:(_NSRange)a6 extractionInfo:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  id v14;
  id v15;
  id v16;
  void *v17;
  int IsContact;
  void *v19;
  void *v20;
  id v21;

  length = a6.length;
  location = a6.location;
  v21 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  -[SGEntity duplicateKey](self, "duplicateKey");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "entityType");
  IsContact = SGEntityTypeIsContact();

  if (IsContact)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPipelineEntity.m"), 610, CFSTR("Contacts can't have associated detected instant message addresses."));

  }
  +[SGPipelineEnrichment socialProfile:forIdentity:parent:curated:context:contextRangeOfInterest:extractionInfo:](SGPipelineEnrichment, "socialProfile:forIdentity:parent:curated:context:contextRangeOfInterest:extractionInfo:", v21, v14, self, 0, v15, location, length, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGPipelineEntity addSocialProfileEnrichment:](self, "addSocialProfileEnrichment:", v19);

}

- (id)contactDetailsWithType:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  SGLabeledValue *v19;
  uint64_t v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (a3 > 6)
  {
    v21 = 0;
    v4 = 0;
  }
  else
  {
    v21 = qword_1C3858BC8[a3];
    v4 = qword_1C3858C00[a3];
  }
  v5 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[SGPipelineEntity enrichments](self, "enrichments");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v10, "duplicateKey", v21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "entityType") == v4)
        {

        }
        else
        {
          objc_msgSend(v10, "duplicateKey");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "entityType");

          if (v13 != v21)
            continue;
        }
        objc_msgSend(v10, "duplicateKey");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "contactDetailKey");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "label");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "title");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v16;
        v19 = -[SGLabeledValue initWithLabel:value:]([SGLabeledValue alloc], "initWithLabel:value:", v18, v17);

        objc_msgSend(v5, "addObject:", v19);
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v7);
  }

  return v5;
}

- (NSArray)phoneNumbers
{
  return (NSArray *)-[SGPipelineEntity contactDetailsWithType:](self, "contactDetailsWithType:", 0);
}

- (NSArray)addresses
{
  return (NSArray *)-[SGPipelineEntity contactDetailsWithType:](self, "contactDetailsWithType:", 1);
}

- (NSArray)emailAddresses
{
  return (NSArray *)-[SGPipelineEntity contactDetailsWithType:](self, "contactDetailsWithType:", 2);
}

- (void)enumeratePeople:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[SGPipelineEntity enrichments](self, "enrichments", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1C3BD4F6C]();
        if (objc_msgSend(v10, "isPerson"))
          v4[2](v4, v10);
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (void)_lazyCheckMessageForHumanness
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  -[SGPipelineEntity message](self, "message");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInhumanSender");

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0D197F0], "inhuman");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGEntity addTag:](self, "addTag:", v5);

  }
  -[SGPipelineEntity message](self, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_inhumanFeatures.inhumanBody = objc_msgSend(v6, "isInhumanContent");

  if (self->_inhumanFeatures.inhumanBody)
  {
    sgLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C3607000, v7, OS_LOG_TYPE_DEBUG, "Tagging as inhuman: Body", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D197F0], "inhuman");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGEntity addTag:](self, "addTag:", v8);

  }
  if (-[SGSimpleMailMessage hasHumanHeaders](self->_mailMessage, "hasHumanHeaders"))
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v11 = 0;
      _os_log_debug_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEBUG, "Tagging as human: Headers", v11, 2u);
    }

    objc_msgSend(MEMORY[0x1E0D197F0], "human");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGEntity addTag:](self, "addTag:", v10);

  }
  self->_messageInhumannessChecked = 1;
}

- ($1706D1CD37C2689B432C8ADD1311BC1E)inhumanFeatures
{
  if (self->_message && !self->_messageInhumannessChecked)
    -[SGPipelineEntity _lazyCheckMessageForHumanness](self, "_lazyCheckMessageForHumanness");
  return ($1706D1CD37C2689B432C8ADD1311BC1E *)&self->_inhumanFeatures;
}

- (BOOL)isInhuman
{
  objc_super v4;

  if (self->_message && !self->_messageInhumannessChecked)
    -[SGPipelineEntity _lazyCheckMessageForHumanness](self, "_lazyCheckMessageForHumanness");
  v4.receiver = self;
  v4.super_class = (Class)SGPipelineEntity;
  return -[SGEntity isInhuman](&v4, sel_isInhuman);
}

- (void)requestFullDownload
{
  if (-[SGEntity isPartiallyDownloaded](self, "isPartiallyDownloaded"))
    self->_fullDownloadRequested = 1;
}

- (BOOL)hasFullDownloadBeenRequested
{
  return self->_fullDownloadRequested;
}

- (BOOL)hasEventEnrichment
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_enrichments;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * i), "isEvent", (_QWORD)v7) & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (unint64_t)eventEnrichmentsCount
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_enrichments;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "isEvent", (_QWORD)v9);
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)acquireDissectorLock
{
  pthread_mutex_lock(&self->_dissectorLock);
}

- (void)releaseDissectorLock
{
  pthread_mutex_unlock(&self->_dissectorLock);
}

- (void)runWithDissectorLock:(id)a3
{
  _opaque_pthread_mutex_t *p_dissectorLock;
  void (**v4)(_QWORD);

  p_dissectorLock = &self->_dissectorLock;
  v4 = (void (**)(_QWORD))a3;
  pthread_mutex_lock(p_dissectorLock);
  v4[2](v4);

  pthread_mutex_unlock(p_dissectorLock);
}

- (void)setEnrichments:(id)a3
{
  objc_storeStrong((id *)&self->_enrichments, a3);
}

- (void)setExternalEnrichments:(id)a3
{
  objc_storeStrong((id *)&self->_externalEnrichments, a3);
}

- (_NSRange)plainTextSigRange
{
  _NSRange *p_plainTextSigRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_plainTextSigRange = &self->_plainTextSigRange;
  location = self->_plainTextSigRange.location;
  length = p_plainTextSigRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setPlainTextSigRange:(_NSRange)a3
{
  self->_plainTextSigRange = a3;
}

- (BOOL)contactInformationExtracted
{
  return self->_contactInformationExtracted;
}

- (void)setContactInformationExtracted:(BOOL)a3
{
  self->_contactInformationExtracted = a3;
}

- (NSArray)instantMessageAddresses
{
  return self->_instantMessageAddresses;
}

- (void)setTaggedCharacterRanges:(id)a3
{
  objc_storeStrong((id *)&self->_taggedCharacterRanges, a3);
}

- (NSMutableDictionary)emailToCanonicalEmailCache
{
  return self->_emailToCanonicalEmailCache;
}

- (NSString)accountType
{
  return self->_accountType;
}

- (NSArray)invalidatedMessageIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 440, 1);
}

- (void)setInvalidatedMessageIdentifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (NSArray)authorMatchingContacts
{
  return self->_authorMatchingContacts;
}

- (void)setAuthorMatchingContacts:(id)a3
{
  objc_storeStrong((id *)&self->_authorMatchingContacts, a3);
}

- (NSSet)authorMatchingContactsKeys
{
  return self->_authorMatchingContactsKeys;
}

- (void)setAuthorMatchingContactsKeys:(id)a3
{
  objc_storeStrong((id *)&self->_authorMatchingContactsKeys, a3);
}

- (BOOL)needsSourceVerification
{
  return self->_needsSourceVerification;
}

- (void)setNeedsSourceVerification:(BOOL)a3
{
  self->_needsSourceVerification = a3;
}

- (BOOL)pendingVerification
{
  return self->_pendingVerification;
}

- (void)setPendingVerification:(BOOL)a3
{
  self->_pendingVerification = a3;
}

- (SGMessage)message
{
  return self->_message;
}

- (SGSimpleMailMessage)mailMessage
{
  return self->_mailMessage;
}

- (SGTextMessage)textMessage
{
  return self->_textMessage;
}

- (INInteraction)interaction
{
  return self->_interaction;
}

- (SGHarvestQueueMetrics)harvestMetrics
{
  return self->_harvestMetrics;
}

- (void)setHarvestMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_harvestMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_harvestMetrics, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_textMessage, 0);
  objc_storeStrong((id *)&self->_mailMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_authorMatchingContactsKeys, 0);
  objc_storeStrong((id *)&self->_authorMatchingContacts, 0);
  objc_storeStrong((id *)&self->_invalidatedMessageIdentifiers, 0);
  objc_storeStrong((id *)&self->_accountType, 0);
  objc_storeStrong((id *)&self->_emailToCanonicalEmailCache, 0);
  objc_storeStrong((id *)&self->_instantMessageAddresses, 0);
  objc_storeStrong((id *)&self->_lazySnippetsContent, 0);
  objc_storeStrong((id *)&self->_taggedCharacterRanges, 0);
  objc_storeStrong((id *)&self->_externalEnrichments, 0);
  objc_storeStrong((id *)&self->_enrichments, 0);
}

BOOL __41__SGPipelineEntity_stripEventInformation__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "duplicateKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "entityType") != 2;

  return v3;
}

void __27__SGPipelineEntity_dealloc__block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v5);
        v7 = (void *)MEMORY[0x1C3BD4F6C](v2);
        objc_msgSend(v6, "flushWrites", (_QWORD)v8);
        objc_autoreleasePoolPop(v7);
        ++v5;
      }
      while (v3 != v5);
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v3 = v2;
    }
    while (v2);
  }

}

void __27__SGPipelineEntity_dealloc__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "SGPipelineEntity.flush", 9);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)dealloc__pasExprOnceResult;
  dealloc__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

id __41__SGPipelineEntity_initWithEmailMessage___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "textContent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "textContent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4 >= 0x190)
    v5 = 400;
  else
    v5 = v4;
  objc_msgSend(v2, "substringToIndex:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)fromCloudKitRecord:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  SGDCKEvent *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  SGPipelineEntity *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  SGPipelineEnrichment *v22;
  void *v23;
  SGPipelineEnrichment *v24;
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
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  int v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  NSObject *v54;
  const char *v55;
  NSObject *v56;
  uint32_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  unint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  SGPipelineEntity *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  uint64_t v73;
  NSObject *v74;
  SGPipelineEntity *v75;
  void *v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  NSObject *v82;
  id v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  NSObject *v113;
  SGPipelineEntity *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  id v120;
  id v121;
  uint8_t buf[4];
  uint64_t v123;
  __int16 v124;
  void *v125;
  __int16 v126;
  void *v127;
  uint64_t v128;

  v128 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("m"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedLongLongValue");

  if (v5 >= 5)
  {
    sgLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("v"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("m"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v123 = (uint64_t)v7;
      v124 = 2112;
      v125 = v8;
      v126 = 2112;
      v127 = &unk_1E7E0C5D8;
      _os_log_impl(&dword_1C3607000, v6, OS_LOG_TYPE_INFO, "SGCK Skipping unsupported CloudKit record (record created by version: %@, version required to process record: %@, version running on this device: %@)", buf, 0x20u);

    }
    goto LABEL_27;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("v"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "unsignedLongLongValue");

  if (v10 < 3)
  {
    sgLogHandle();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v50, OS_LOG_TYPE_INFO, "SGCK Reading pre-Manatee CloudKit record.", buf, 2u);
    }

    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("p"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_27;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0D81560], "decompress:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v51 = 0;
LABEL_89:

      goto LABEL_90;
    }
    v13 = -[SGDCKEvent initWithData:]([SGDCKEvent alloc], "initWithData:", v12);
    if (!v13)
    {
      v51 = 0;
LABEL_88:

      goto LABEL_89;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("v"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "unsignedLongLongValue");

    if (v15 < 4)
      goto LABEL_9;
    if (-[SGDCKEvent hasParentEntityType](v13, "hasParentEntityType"))
    {
      v52 = -[SGDCKEvent parentEntityType](v13, "parentEntityType");
      if (v52 != 16)
      {
        v53 = v52;
        if (v52 == 18)
        {
LABEL_9:
          v16 = *MEMORY[0x1E0D19A60];
          +[SGDuplicateKey duplicateKeyForWebPageFromSource:](SGDuplicateKey, "duplicateKeyForWebPageFromSource:", *MEMORY[0x1E0D19A60]);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[SGPipelineEntity initWithDuplicateKey:title:]([SGPipelineEntity alloc], "initWithDuplicateKey:title:", v17, CFSTR("ck"));
          -[SGEntity setSourceKey:](v18, "setSourceKey:", v16);
          goto LABEL_10;
        }
        sgLogHandle();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v123 = v53;
          v55 = "SGCK Error: Record contained unsupported entity type %lld";
          v56 = v54;
          v57 = 12;
LABEL_98:
          _os_log_error_impl(&dword_1C3607000, v56, OS_LOG_TYPE_ERROR, v55, buf, v57);
        }
LABEL_47:
        v51 = 0;
LABEL_87:

        goto LABEL_88;
      }
      if (-[SGDCKEvent hasInteractionInfo](v13, "hasInteractionInfo"))
      {
        -[SGDCKEvent interactionInfo](v13, "interactionInfo");
        v54 = objc_claimAutoreleasedReturnValue();
        if ((-[NSObject hasInteractionBundleId](v54, "hasInteractionBundleId") & 1) != 0)
        {
          -[NSObject interactionBundleId](v54, "interactionBundleId");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = [SGPipelineEntity alloc];
          -[NSObject interactionId](v54, "interactionId");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[SGPipelineEntity initWithInteractionIdentifier:fromBundleIdentifier:](v75, "initWithInteractionIdentifier:fromBundleIdentifier:", v76, v17);

LABEL_10:
          -[SGDCKEvent groupId](v13, "groupId");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGEntity duplicateKey](v18, "duplicateKey");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          +[SGDuplicateKey duplicateKeyForPseudoEventWithGroupId:parentKey:](SGDuplicateKey, "duplicateKeyForPseudoEventWithGroupId:parentKey:", v19, v20);
          v21 = objc_claimAutoreleasedReturnValue();

          v22 = [SGPipelineEnrichment alloc];
          -[SGDCKEvent title](v13, "title");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v118 = (void *)v21;
          v24 = -[SGPipelineEnrichment initWithDuplicateKey:title:parent:](v22, "initWithDuplicateKey:title:parent:", v21, v23, v18);

          -[SGDCKEvent creationTimestamp](v13, "creationTimestamp");
          -[SGPipelineEnrichment setCreationTimestamp:](v24, "setCreationTimestamp:");
          -[SGDCKEvent lastModifiedTimestamp](v13, "lastModifiedTimestamp");
          -[SGPipelineEnrichment setLastModifiedTimestamp:](v24, "setLastModifiedTimestamp:");
          -[SGDCKEvent extraKey](v13, "extraKey");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            v26 = (void *)MEMORY[0x1E0D197F0];
            -[SGDCKEvent extraKey](v13, "extraKey");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "extraKey:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[SGEntity addTag:](v24, "addTag:", v28);

          }
          if (-[SGDCKEvent cancelled](v13, "cancelled"))
          {
            objc_msgSend(MEMORY[0x1E0D197F0], "extractedEventCancellation");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[SGEntity addTag:](v24, "addTag:", v29);

          }
          if (-[SGDCKEvent allDay](v13, "allDay"))
          {
            objc_msgSend(MEMORY[0x1E0D197F0], "allDay");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            -[SGEntity addTag:](v24, "addTag:", v30);

          }
          -[SGDCKEvent domain](v13, "domain");
          v31 = (void *)objc_claimAutoreleasedReturnValue();

          if (v31)
          {
            v32 = (void *)MEMORY[0x1E0D197F0];
            -[SGDCKEvent domain](v13, "domain");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "domain:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[SGEntity addTag:](v24, "addTag:", v34);

          }
          -[SGDCKEvent templateName](v13, "templateName");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
          {
            v36 = (void *)MEMORY[0x1E0D197F0];
            -[SGDCKEvent templateName](v13, "templateName");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "extractedFromTemplateWithName:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            -[SGEntity addTag:](v24, "addTag:", v38);

          }
          objc_msgSend(MEMORY[0x1E0D197F0], "categoryTagWithCategoryType:", -[SGDCKEvent categoryType](v13, "categoryType"));
          v39 = objc_claimAutoreleasedReturnValue();
          if (v39)
            -[SGEntity addTag:](v24, "addTag:", v39);
          -[SGDCKEvent when](v13, "when");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "start");
          v42 = v41;
          objc_msgSend(v40, "end");
          v44 = v43;
          v45 = objc_msgSend(v40, "hasStartUTCOffsetSeconds");
          v46 = (void *)MEMORY[0x1E0D19940];
          v116 = v40;
          v117 = (void *)v39;
          if (v45)
          {
            objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", objc_msgSend(v40, "startUTCOffsetSeconds"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", objc_msgSend(v40, "endUTCOffsetSeconds"));
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "rangeWithStart:startTimeZone:end:endTimeZone:", v47, v48, v42, v44);
            v49 = objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0D19940], "floatingRangeWithUTCStart:end:", v42, v44);
            v49 = objc_claimAutoreleasedReturnValue();
          }
          -[SGEntity setTimeRange:](v24, "setTimeRange:", v49);
          -[SGEntity locations](v24, "locations");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[SGDCKEvent locations](v13, "locations");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          sgMap();
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "addObjectsFromArray:", v60);

          -[SGDCKEvent content](v13, "content");
          v61 = (void *)objc_claimAutoreleasedReturnValue();

          if (v61)
          {
            -[SGDCKEvent content](v13, "content");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            -[SGEntity setContent:](v24, "setContent:", v62);

          }
          v63 = 0x1E0D19000uLL;
          if (-[SGDCKEvent hasExtraKey](v13, "hasExtraKey"))
          {
            v64 = (void *)MEMORY[0x1E0D197F0];
            -[SGDCKEvent extraKey](v13, "extraKey");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "extraKey:", v65);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            -[SGEntity addTag:](v24, "addTag:", v66);

          }
          v115 = (void *)v49;
          if (-[SGDCKEvent cancelled](v13, "cancelled"))
          {
            objc_msgSend(MEMORY[0x1E0D197F0], "extractedEventCancellation");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            -[SGEntity addTag:](v24, "addTag:", v67);

          }
          if (-[SGDCKEvent hasSchemaOrg](v13, "hasSchemaOrg"))
          {
            v68 = v18;
            v69 = (void *)MEMORY[0x1E0CB38B0];
            -[SGDCKEvent schemaOrg](v13, "schemaOrg");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v121 = 0;
            objc_msgSend(v69, "propertyListWithData:options:format:error:", v70, 0, 0, &v121);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = v121;

            if (v71)
            {
              objc_msgSend(MEMORY[0x1E0D197F0], "schemaOrg:", v71);
              v73 = objc_claimAutoreleasedReturnValue();
              if (v73)
              {
                v74 = v73;
                -[SGEntity addTag:](v24, "addTag:", v73);
              }
              else
              {
                sgLogHandle();
                v77 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v123 = (uint64_t)v72;
                  _os_log_error_impl(&dword_1C3607000, v77, OS_LOG_TYPE_ERROR, "SGCK Error decoding schema.org plist: %@", buf, 0xCu);
                }

                v74 = 0;
              }
            }
            else
            {
              sgLogHandle();
              v74 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v123 = (uint64_t)v72;
                _os_log_error_impl(&dword_1C3607000, v74, OS_LOG_TYPE_ERROR, "SGCK error decoding schema.org plist: %@", buf, 0xCu);
              }
            }

            v18 = v68;
            v63 = 0x1E0D19000;
          }
          if (-[SGDCKEvent hasMetadata](v13, "hasMetadata"))
          {
            v114 = v18;
            v78 = (void *)MEMORY[0x1E0CB38B0];
            -[SGDCKEvent metadata](v13, "metadata");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v120 = 0;
            objc_msgSend(v78, "propertyListWithData:options:format:error:", v79, 0, 0, &v120);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = v120;

            if (v80)
            {
              v119 = v81;
              objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v80, 0, &v119);
              v82 = objc_claimAutoreleasedReturnValue();
              v83 = v119;

              if (v82)
              {
                v84 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v82, 4);
                if (v84)
                {
                  objc_msgSend(MEMORY[0x1E0D197F0], "eventMetadata:", v84);
                  v85 = (void *)objc_claimAutoreleasedReturnValue();
                  -[SGEntity addTag:](v24, "addTag:", v85);

                }
              }
            }
            else
            {
              sgLogHandle();
              v82 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v123 = (uint64_t)v81;
                _os_log_error_impl(&dword_1C3607000, v82, OS_LOG_TYPE_ERROR, "SGCK Error decoding metadata plist: %@", buf, 0xCu);
              }
              v83 = v81;
            }

            v18 = v114;
            v63 = 0x1E0D19000uLL;
          }
          -[SGEntity duplicateKey](v18, "duplicateKey");
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v86, "entityType") == 16)
          {
            -[SGEntity duplicateKey](v24, "duplicateKey");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            v88 = objc_msgSend(v87, "entityType");

            if (v88 != 2)
            {
LABEL_84:
              objc_msgSend(*(id *)(v63 + 2032), "fromSync");
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              -[SGEntity addTag:](v24, "addTag:", v111);

              if (v24)
              {
                -[SGEntity lastModifiedTimestamp](v24, "lastModifiedTimestamp");
                -[SGPipelineEntity setLastModifiedTimestamp:](v18, "setLastModifiedTimestamp:");
                -[SGEntity creationTimestamp](v24, "creationTimestamp");
                -[SGPipelineEntity setCreationTimestamp:](v18, "setCreationTimestamp:");
                -[SGPipelineEntity addEnrichment:](v18, "addEnrichment:", v24);
              }
              v54 = v18;

              v51 = v54;
              goto LABEL_87;
            }
            -[SGDCKEvent interactionInfo](v13, "interactionInfo");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v86, "hasInteractionId"))
            {
              objc_msgSend(*(id *)(v63 + 2032), "fromInteraction");
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              -[SGEntity addTag:](v24, "addTag:", v89);

              v90 = *(void **)(v63 + 2032);
              objc_msgSend(v86, "interactionId");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "interactionId:", v91);
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              -[SGEntity addTag:](v24, "addTag:", v92);

            }
            if (objc_msgSend(v86, "hasInteractionGroupId"))
            {
              v93 = *(void **)(v63 + 2032);
              objc_msgSend(v86, "interactionGroupId");
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v93, "interactionGroupId:", v94);
              v95 = (void *)objc_claimAutoreleasedReturnValue();
              -[SGEntity addTag:](v24, "addTag:", v95);

            }
            if (objc_msgSend(v86, "hasInteractionTeamId"))
            {
              v96 = *(void **)(v63 + 2032);
              objc_msgSend(v86, "interactionTeamId");
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "interactionTeamId:", v97);
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              -[SGEntity addTag:](v24, "addTag:", v98);

            }
            if (objc_msgSend(v86, "hasInteractionBundleId"))
            {
              v99 = *(void **)(v63 + 2032);
              objc_msgSend(v86, "interactionBundleId");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v99, "interactionBundleId:", v100);
              v101 = (void *)objc_claimAutoreleasedReturnValue();
              -[SGEntity addTag:](v24, "addTag:", v101);

            }
            if (objc_msgSend(v86, "hasReservationItemReferences"))
            {
              v102 = *(void **)(v63 + 2032);
              objc_msgSend(v86, "reservationItemReferences");
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "reservationItemReferencesWithData:", v103);
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              -[SGEntity addTag:](v24, "addTag:", v104);

            }
            if (objc_msgSend(v86, "hasReservationContainerReference"))
            {
              v105 = *(void **)(v63 + 2032);
              objc_msgSend(v86, "reservationContainerReference");
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v105, "reservationContainerReferenceWithData:", v106);
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              -[SGEntity addTag:](v24, "addTag:", v107);

            }
            if (objc_msgSend(v86, "hasIntentResponseUserActivityString"))
            {
              v108 = *(void **)(v63 + 2032);
              objc_msgSend(v86, "intentResponseUserActivityString");
              v109 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v108, "intentResponseUserActivityString:", v109);
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              -[SGEntity addTag:](v24, "addTag:", v110);

            }
          }

          goto LABEL_84;
        }
        sgLogHandle();
        v113 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1C3607000, v113, OS_LOG_TYPE_ERROR, "SGCK Error: Record with type interaction is missing interaction bundle id.", buf, 2u);
        }

        goto LABEL_47;
      }
      sgLogHandle();
      v54 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        goto LABEL_47;
      *(_WORD *)buf = 0;
      v55 = "SGCK Error: Record with type interaction is missing interaction info.";
    }
    else
    {
      sgLogHandle();
      v54 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        goto LABEL_47;
      *(_WORD *)buf = 0;
      v55 = "SGCK Error: Record version higher than 3 did not contain parent entity type.";
    }
    v56 = v54;
    v57 = 2;
    goto LABEL_98;
  }
  objc_msgSend(v3, "encryptedValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("pe"));
  v6 = objc_claimAutoreleasedReturnValue();

  if (v6)
    goto LABEL_6;
LABEL_27:
  v51 = 0;
LABEL_90:

  return v51;
}

SGStorageLocation *__55__SGPipelineEntity_CloudKitRecord__fromCloudKitRecord___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  SGStorageLocation *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  SGStorageLocation *v17;

  v2 = a2;
  v3 = [SGStorageLocation alloc];
  v4 = objc_msgSend(v2, "locationType");
  objc_msgSend(v2, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "airportCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "hasLatitude"))
  {
    objc_msgSend(v2, "latitude");
    v9 = v8;
  }
  else
  {
    v9 = NAN;
  }
  if (objc_msgSend(v2, "hasLongitude"))
  {
    objc_msgSend(v2, "longitude");
    v11 = v10;
  }
  else
  {
    v11 = NAN;
  }
  objc_msgSend(v2, "accuracy");
  v13 = v12;
  objc_msgSend(v2, "quality");
  v15 = v14;
  objc_msgSend(v2, "handle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SGStorageLocation initWithType:label:address:airportCode:latitude:longitude:accuracy:quality:handle:](v3, "initWithType:label:address:airportCode:latitude:longitude:accuracy:quality:handle:", v4, v5, v6, v7, v16, v9, v11, v13, v15);

  return v17;
}

@end
