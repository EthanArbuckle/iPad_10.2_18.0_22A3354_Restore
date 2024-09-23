@implementation MFMessageStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectCache, 0);
  objc_storeStrong((id *)&self->_uniqueStrings, 0);
}

+ (void)setDefaultMessageHeadersClass:(Class)a3
{
  sMFMessageStoreHeadersClass = (uint64_t)a3;
}

- (MFMessageStore)init
{
  MFMessageStore *v2;
  MFMessageStore *v3;
  uint64_t v4;
  MFMessageStoreObjectCache *objectCache;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFMessageStore;
  v2 = -[MFMessageStore init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = -[MFMessageStore newObjectCache](v2, "newObjectCache");
    objectCache = v3->_objectCache;
    v3->_objectCache = (MFMessageStoreObjectCache *)v4;

  }
  return v3;
}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__MFMessageStore_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, block);
  return (id)log_log;
}

void __21__MFMessageStore_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;

}

- (id)headerDataForMessage:(id)a3 downloadIfNecessary:(BOOL)a4
{
  return 0;
}

+ (Class)headersClass
{
  void *v2;

  v2 = (void *)sMFMessageStoreHeadersClass;
  if (!sMFMessageStoreHeadersClass)
    v2 = (void *)objc_opt_class();
  return (Class)v2;
}

- (id)headersForMessage:(id)a3 fetchIfNotAvailable:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  -[MFMessageStore _cachedHeadersForMessage:valueIfNotPresent:](self, "_cachedHeadersForMessage:valueIfNotPresent:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    -[MFMessageStore headerDataForMessage:downloadIfNecessary:](self, "headerDataForMessage:downloadIfNecessary:", v6, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "headersClass")), "initWithHeaderData:encoding:", v8, objc_msgSend(v6, "preferredEncoding"));
      if (v9)
      {
        -[MFMessageStore _cachedHeadersForMessage:valueIfNotPresent:](self, "_cachedHeadersForMessage:valueIfNotPresent:", v6, v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)_downloadHeadersForMessages:(id)a3
{
  id v4;
  void *v5;
  id v6;
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
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[MFMessageStore headersForMessage:fetchIfNotAvailable:](self, "headersForMessage:fetchIfNotAvailable:", v10, 1, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v10);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)_setOrGetBody:(id)a3 forMessage:(id)a4 updateFlags:(BOOL)a5
{
  -[MFMessageStore _cachedBodyForMessage:valueIfNotPresent:](self, "_cachedBodyForMessage:valueIfNotPresent:", a4, a3, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (Class)classForMimePart
{
  return (Class)objc_opt_class();
}

- (BOOL)bodyFetchRequiresNetworkActivity
{
  -[MFMessageStore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MFMessageStore bodyFetchRequiresNetworkActivity]", "MessageStore.m", 102, "0");
}

- (id)_bodyForMessage:(id)a3 fetchIfNotAvailable:(BOOL)a4 updateFlags:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  MFMimeBody *v9;
  id v10;
  void *v11;
  id v12;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = objc_alloc_init(MFMimeBody);
  v10 = objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "classForMimePart"));
  -[MFMessageBody setMessage:](v9, "setMessage:", v8);
  -[MFMimeBody setTopLevelPart:](v9, "setTopLevelPart:", v10);
  objc_msgSend(v10, "setMimeBody:", v9);
  if ((objc_msgSend(v10, "parseMimeBodyDownloadIfNecessary:", v6) & 1) == 0)
  {
    -[MFMessageBody setMessage:](v9, "setMessage:", 0);

    v9 = 0;
    goto LABEL_5;
  }
  if (!v9)
  {
LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  -[MFMessageStore _setOrGetBody:forMessage:updateFlags:](self, "_setOrGetBody:forMessage:updateFlags:", v9, v8, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v12 = v11;

  return v12;
}

- (id)bodyForMessage:(id)a3 fetchIfNotAvailable:(BOOL)a4 updateFlags:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  -[MFMessageStore _cachedBodyForMessage:valueIfNotPresent:](self, "_cachedBodyForMessage:valueIfNotPresent:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if ((!-[MFMessageStore bodyFetchRequiresNetworkActivity](self, "bodyFetchRequiresNetworkActivity")
       || v6
       || objc_msgSend(v8, "isMessageContentsLocallyAvailable"))
      && (-[MFMessageStore _bodyForMessage:fetchIfNotAvailable:updateFlags:](self, "_bodyForMessage:fetchIfNotAvailable:updateFlags:", v8, v6, v5), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[MFMessageStore _setOrGetBody:forMessage:updateFlags:](self, "_setOrGetBody:forMessage:updateFlags:", v10, v8, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)fullBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 didDownload:(BOOL *)a7
{
  _BOOL4 v8;
  void *v9;
  void *v10;

  v8 = a6;
  -[MFMessageStore bodyDataForMessage:isComplete:isPartial:downloadIfNecessary:](self, "bodyDataForMessage:isComplete:isPartial:downloadIfNecessary:", a3, a5, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a7 && v8 && objc_msgSend(v9, "length"))
    *a7 = 1;
  return v10;
}

- (id)uniquedString:(id)a3
{
  id v4;
  NSMutableSet *uniqueStrings;
  NSMutableSet *v6;
  NSMutableSet *v7;
  void *v8;

  v4 = a3;
  _MFLockGlobalLock();
  uniqueStrings = self->_uniqueStrings;
  if (uniqueStrings)
  {
    if ((unint64_t)-[NSMutableSet count](uniqueStrings, "count") >= 0x64)
      -[NSMutableSet removeAllObjects](self->_uniqueStrings, "removeAllObjects");
  }
  else
  {
    v6 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 100);
    v7 = self->_uniqueStrings;
    self->_uniqueStrings = v6;

  }
  -[NSMutableSet ef_uniquedObject:](self->_uniqueStrings, "ef_uniquedObject:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _MFUnlockGlobalLock();

  return v8;
}

- (id)dataForMimePart:(id)a3 inRange:(_NSRange)a4 isComplete:(BOOL *)a5 downloadIfNecessary:(BOOL)a6 didDownload:(BOOL *)a7
{
  _BOOL8 v8;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;

  v8 = a6;
  v11 = a3;
  objc_msgSend(v11, "type");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("multipart"));

  if ((v13 & 1) == 0)
  {
    objc_msgSend(v11, "mimeBody");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "message");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      v14 = 0;
LABEL_13:

      goto LABEL_14;
    }
    -[MFMessageStore fullBodyDataForMessage:andHeaderDataIfReadilyAvailable:isComplete:downloadIfNecessary:didDownload:](self, "fullBodyDataForMessage:andHeaderDataIfReadilyAvailable:isComplete:downloadIfNecessary:didDownload:", v16, 0, a5, v8, a7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "length");
    v19 = objc_msgSend(v11, "range");
    if (v19 == 0x7FFFFFFFFFFFFFFFLL || v19 + v20 > v18)
    {
      objc_msgSend(v11, "mimeBody", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "topLevelPart");
      v23 = (id)objc_claimAutoreleasedReturnValue();

      if (v23 != v11)
      {
        v14 = 0;
LABEL_12:

        goto LABEL_13;
      }
      v21 = v17;
    }
    else
    {
      objc_msgSend(v17, "mf_subdataWithRange:", v19, v20);
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v21;
    goto LABEL_12;
  }
  v14 = 0;
LABEL_14:

  return v14;
}

- (BOOL)dataForMimePart:(id)a3 inRange:(_NSRange)a4 isComplete:(BOOL *)a5 withConsumer:(id)a6 downloadIfNecessary:(BOOL)a7 didDownload:(BOOL *)a8
{
  _BOOL8 v8;
  NSUInteger length;
  NSUInteger location;
  id v14;
  void *v15;

  v8 = a7;
  length = a4.length;
  location = a4.location;
  v14 = a6;
  -[MFMessageStore dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:](self, "dataForMimePart:inRange:isComplete:downloadIfNecessary:didDownload:", a3, location, length, a5, v8, a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appendData:", v15);

  return v15 != 0;
}

- (BOOL)downloadMimePartNumber:(id)a3 message:(id)a4 withProgressBlock:(id)a5
{
  return 0;
}

- (BOOL)dataForMimePart:(id)a3 inRange:(_NSRange)a4 withConsumer:(id)a5 downloadIfNecessary:(BOOL)a6
{
  return -[MFMessageStore dataForMimePart:inRange:isComplete:withConsumer:downloadIfNecessary:didDownload:](self, "dataForMimePart:inRange:isComplete:withConsumer:downloadIfNecessary:didDownload:", a3, a4.location, a4.length, 0, a5, a6, 0);
}

- (id)decryptedTopLevelPartForPart:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a3;
  objc_msgSend(v3, "decryptedMessageBodyIsEncrypted:isSigned:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "topLevelPart");
      v5 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v5;
    }
  }

  return v3;
}

- (id)defaultAlternativeForPart:(id)a3
{
  -[MFMessageStore bestAlternativeForPart:](self, "bestAlternativeForPart:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)bestAlternativeForPart:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[MFMessageStore decryptedTopLevelPartForPart:](self, "decryptedTopLevelPartForPart:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("multipart")) & 1) != 0)
  {
    objc_msgSend(v5, "subtype");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("alternative"));

    if (v8)
    {
      objc_msgSend(v5, "chosenAlternativePart");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  else
  {

  }
  v9 = 0;
LABEL_6:
  if (v9)
    v10 = v9;
  else
    v10 = v5;
  v11 = v10;

  return v11;
}

- (id)newObjectCache
{
  MFMessageStoreObjectCache *v2;

  v2 = -[MFMessageStoreObjectCache initWithCapacity:]([MFMessageStoreObjectCache alloc], "initWithCapacity:", 5);
  -[MFMessageStoreObjectCache setKeyGenerator:](v2, "setKeyGenerator:", &__block_literal_global_1);
  return v2;
}

unint64_t __32__MFMessageStore_newObjectCache__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a2 & 0xFFFFFFFFFFFFFFFCLL | a3;
}

- (id)_cachedHeaderDataForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  -[MFMessageStoreObjectCache addObject:forMessage:kind:](self->_objectCache, "addObject:forMessage:kind:", a4, a3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_cachedBodyDataForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  id v6;
  id v7;
  MFMessageDataContainer *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v7)
    v8 = -[MFMessageDataContainer initWithData:]([MFMessageDataContainer alloc], "initWithData:", v7);
  else
    v8 = 0;
  -[MFMessageStore _cachedBodyDataContainerForMessage:valueIfNotPresent:](self, "_cachedBodyDataContainerForMessage:valueIfNotPresent:", v6, v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = *(void **)(v9 + 8);
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (id)_cachedBodyForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[MFMessageStoreObjectCache addObject:forMessage:kind:](self->_objectCache, "addObject:forMessage:kind:", a4, v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMessage:", v6);

  return v7;
}

- (id)_cachedHeadersForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  -[MFMessageStoreObjectCache addObject:forMessage:kind:](self->_objectCache, "addObject:forMessage:kind:", a4, a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_cachedBodyDataContainerForMessage:(id)a3 valueIfNotPresent:(id)a4
{
  -[MFMessageStoreObjectCache addObject:forMessage:kind:](self->_objectCache, "addObject:forMessage:kind:", a4, a3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_flushAllCaches
{
  -[MFMessageStoreObjectCache flush](self->_objectCache, "flush");
}

- (id)_fetchBodyDataForMessage:(id)a3 andHeaderDataIfReadilyAvailable:(id *)a4 downloadIfNecessary:(BOOL)a5 partial:(BOOL *)a6
{
  id v8;

  v8 = a3;
  -[MFMessageStore doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[MFMessageStore _fetchBodyDataForMessage:andHeaderDataIfReadilyAvailable:downloadIfNecessary:partial:]", "MessageStore.m", 284, "0");
}

- (id)bodyDataForMessage:(id)a3 isComplete:(BOOL *)a4 isPartial:(BOOL *)a5 downloadIfNecessary:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _BOOL4 v22;
  _BOOL4 v23;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  _BOOL4 v31;
  uint8_t v32[24];
  uint64_t v33;

  v6 = a6;
  v33 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  -[MFMessageStore _cachedBodyDataForMessage:valueIfNotPresent:](self, "_cachedBodyDataForMessage:valueIfNotPresent:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (a4 || (v12 = objc_msgSend(v10, "messageSize"), v12 == objc_msgSend(v11, "length"))))
  {
    +[MFMessageStore log](MFMessageStore, "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "messageID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v14;
      _os_log_impl(&dword_1ABB13000, v13, OS_LOG_TYPE_DEFAULT, "Found cached body data for message %{public}@", buf, 0xCu);

    }
    v15 = v11;
  }
  else
  {
    v25 = 0;
    -[MFMessageStore _fetchBodyDataForMessage:andHeaderDataIfReadilyAvailable:downloadIfNecessary:partial:](self, "_fetchBodyDataForMessage:andHeaderDataIfReadilyAvailable:downloadIfNecessary:partial:", v10, &v25, v6, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v25;

    if (v16)
    {
      -[MFMessageStore _cachedBodyDataForMessage:valueIfNotPresent:](self, "_cachedBodyDataForMessage:valueIfNotPresent:", v10, v16);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        v17 = -[MFMessageStore _cachedHeaderDataForMessage:valueIfNotPresent:](self, "_cachedHeaderDataForMessage:valueIfNotPresent:", v10, v13);
    }
    else
    {
      +[MFMessageStore log](MFMessageStore, "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "messageID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[MFMessageStore bodyDataForMessage:isComplete:isPartial:downloadIfNecessary:].cold.1(v19, v32, v18);
      }

      v15 = 0;
    }
  }

  if (a4 && v15)
    *a4 = 1;
  if (a5)
    *a5 = 0;
  +[MFMessageStore log](MFMessageStore, "log");
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "messageID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *a4;
    v23 = *a5;
    *(_DWORD *)buf = 138543874;
    v27 = v21;
    v28 = 1024;
    v29 = v22;
    v30 = 1024;
    v31 = v23;
    _os_log_impl(&dword_1ABB13000, v20, OS_LOG_TYPE_DEFAULT, "Body data for message %{public}@, isComplete: %{BOOL}d, isPartial: %{BOOL}d", buf, 0x18u);

  }
  return v15;
}

- (BOOL)hasCompleteDataForMimePart:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(v4, "mimeBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "message");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[MFMessageStore _cachedBodyDataForMessage:valueIfNotPresent:](self, "_cachedBodyDataForMessage:valueIfNotPresent:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");
  v9 = objc_msgSend(v4, "range");
  LOBYTE(v8) = v8 >= v9 + v10;

  return v8;
}

- (BOOL)messageCanBeTriaged:(id)a3
{
  return 1;
}

- (void)setNumberOfAttachments:(unsigned int)a3 isSigned:(BOOL)a4 isEncrypted:(BOOL)a5 forMessage:(id)a6
{
  objc_msgSend(a6, "setNumberOfAttachments:", a3, a4, a5);
}

- (BOOL)wantsLineEndingConversionForMIMEPart:(id)a3
{
  return 1;
}

- (void)flushCacheForMessage:(id)a3
{
  -[MFMessageStoreObjectCache removeAllObjectsForMessage:](self->_objectCache, "removeAllObjectsForMessage:", a3);
}

- (MFMessageStoreObjectCache)objectCache
{
  return self->_objectCache;
}

- (void)bodyDataForMessage:(os_log_t)log isComplete:isPartial:downloadIfNecessary:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1ABB13000, log, OS_LOG_TYPE_ERROR, "Failed to fetch body data for message %{public}@", buf, 0xCu);

}

@end
