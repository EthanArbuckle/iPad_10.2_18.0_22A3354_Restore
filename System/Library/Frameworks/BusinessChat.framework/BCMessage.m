@implementation BCMessage

- (BCMessage)initWithData:(id)a3 url:(id)a4 sessionIdentifier:(id)a5 isFromMe:(BOOL)a6
{
  _BOOL8 v6;
  id v11;
  BCMessage *v12;
  BCMessage *v13;

  v6 = a6;
  v11 = a5;
  v12 = -[BCMessage initWithData:url:messageGUID:isFromMe:](self, "initWithData:url:messageGUID:isFromMe:", a3, a4, 0, v6);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_sessionIdentifier, a5);

  return v13;
}

- (BCMessage)initWithData:(id)a3 url:(id)a4 messageGUID:(id)a5 isFromMe:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  BCMessage *v14;
  BCMessageData *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  BCImageStore *v28;
  void *v29;
  BCImageStore *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  BCDictionarySerializable *v35;
  void *v36;
  BCDictionarySerializable *rootObject;
  BCMessageInfo *v38;
  void *v39;
  uint64_t v40;
  BCMessageInfo *replyMessage;
  BCMessageInfo *v42;
  NSObject *v43;
  BCMessageInfo *v44;
  uint64_t v45;
  BCMessageInfo *receivedMessage;
  NSObject *v47;
  NSObject *v48;
  BCMessage *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  int64_t v54;
  void *v55;
  NSObject *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v63;
  void *v64;
  int64_t version;
  BCDictionarySerializable *v66;
  void *v67;
  BCImageStore *v68;
  void *v69;
  id obj;
  void *v71;
  id v72;
  objc_super v73;
  uint8_t buf[4];
  int64_t v75;
  __int16 v76;
  int64_t v77;
  __int16 v78;
  _BOOL4 v79;
  uint64_t v80;

  v6 = a6;
  v80 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  LogCategory_Daemon();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v10, "description");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "description");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v75 = (int64_t)v50;
    v76 = 2112;
    v77 = (int64_t)v51;
    v78 = 1024;
    v79 = v6;
    _os_log_debug_impl(&dword_21C655000, v13, OS_LOG_TYPE_DEBUG, "BCMessage: initWithData: %@ url: %@ isFromMe: %d", buf, 0x1Cu);

  }
  v73.receiver = self;
  v73.super_class = (Class)BCMessage;
  v14 = -[BCMessage init](&v73, sel_init);
  if (!v14)
    goto LABEL_35;
  v15 = -[BCMessageData initWithUrl:data:]([BCMessageData alloc], "initWithUrl:data:", v11, v10);
  objc_storeStrong((id *)&v14->_messageData, v15);
  -[BCMessageData combinedDictionary](v15, "combinedDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    LogCategory_Daemon();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_21C655000, v47, OS_LOG_TYPE_ERROR, "BCMessage: Error intializing, missing data", buf, 2u);
    }

    goto LABEL_22;
  }
  v72 = v10;
  v17 = v12;
  -[BCMessageData combinedDictionary](v15, "combinedDictionary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("version"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCMessageData combinedDictionary](v15, "combinedDictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19)
    v22 = CFSTR("version");
  else
    v22 = CFSTR("mspVersion");
  objc_msgSend(v20, "objectForKeyedSubscript:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = v23;
  if (!v23)
  {
    LogCategory_Daemon();
    v48 = objc_claimAutoreleasedReturnValue();
    v12 = v17;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_21C655000, v48, OS_LOG_TYPE_ERROR, "BCMessage: Cannot initialize with nil version", buf, 2u);
    }
    v10 = v72;
    goto LABEL_21;
  }
  v25 = objc_msgSend(v23, "integerValue");
  v14->_version = v25;
  if (v25 <= 0)
  {
    LogCategory_Daemon();
    v48 = objc_claimAutoreleasedReturnValue();
    v12 = v17;
    v10 = v72;
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      version = v14->_version;
      *(_DWORD *)buf = 134217984;
      v75 = version;
      _os_log_error_impl(&dword_21C655000, v48, OS_LOG_TYPE_ERROR, "BCMessage: Unexpected payload version %ld", buf, 0xCu);
    }
LABEL_21:

LABEL_22:
    v49 = 0;
    goto LABEL_36;
  }
  -[BCMessageData combinedDictionary](v15, "combinedDictionary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("requestIdentifier"));
  v27 = objc_claimAutoreleasedReturnValue();

  v12 = v17;
  obj = (id)v27;
  if (v27)
  {
    v69 = v24;
    v28 = [BCImageStore alloc];
    -[BCMessageData imagesArray](v15, "imagesArray");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[BCImageStore initWithArray:](v28, "initWithArray:", v29);

    -[BCMessageData combinedDictionary](v15, "combinedDictionary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[BCMessage rootKey](v14, "rootKey");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectForKey:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    -[BCImageStore dictionary](v30, "dictionary");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v14->_isFromMe = v6;
    v68 = v30;
    objc_storeStrong((id *)&v14->_imageStore, v30);
    if (-[BCMessage isVersionSupported](v14, "isVersionSupported"))
    {
      -[BCMessage makeRootObjectWithMessageData:dictionary:imageDictionary:version:](v14, "makeRootObjectWithMessageData:dictionary:imageDictionary:version:", v15, v33, v34, v14->_version);
      v35 = (BCDictionarySerializable *)objc_claimAutoreleasedReturnValue();
      v36 = v34;
      rootObject = v14->_rootObject;
      v14->_rootObject = v35;
      v66 = v35;

      v38 = [BCMessageInfo alloc];
      -[BCMessageData replyMessageDictionary](v15, "replyMessageDictionary");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = -[BCMessageInfo initWithDictionary:imageDictionary:](v38, "initWithDictionary:imageDictionary:", v39, v36);
      replyMessage = v14->_replyMessage;
      v14->_replyMessage = (BCMessageInfo *)v40;

      v42 = [BCMessageInfo alloc];
      -[BCMessageData receivedMessageDictionary](v15, "receivedMessageDictionary");
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = v42;
      v34 = v36;
      v45 = -[BCMessageInfo initWithDictionary:imageDictionary:](v44, "initWithDictionary:imageDictionary:", v43, v36);
      receivedMessage = v14->_receivedMessage;
      v14->_receivedMessage = (BCMessageInfo *)v45;

    }
    else
    {
      LogCategory_Daemon();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        v53 = -[BCMessage type](v14, "type");
        v54 = v14->_version;
        *(_DWORD *)buf = 134218240;
        v75 = v53;
        v76 = 2048;
        v77 = v54;
        _os_log_impl(&dword_21C655000, v43, OS_LOG_TYPE_DEFAULT, "BCMessage: Cannot create rootObject for BCMessage of type %ld since version %ld of payload is not supported", buf, 0x16u);
      }
    }
    v55 = v69;

    objc_storeStrong((id *)&v14->_requestIdentifier, obj);
    LogCategory_Daemon();
    v56 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      -[BCMessageData combinedDictionary](v15, "combinedDictionary");
      v63 = v34;
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v75 = (int64_t)v64;
      _os_log_debug_impl(&dword_21C655000, v56, OS_LOG_TYPE_DEBUG, "BCMessage: messageData: %@ ", buf, 0xCu);

      v34 = v63;
    }

    LogCategory_Daemon();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
    {
      -[BCMessageData combinedDictionary](v15, "combinedDictionary");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("version"));
      v71 = v33;
      v58 = v34;
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      -[BCMessageData combinedDictionary](v15, "combinedDictionary");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("mspVersion"));
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v75 = (int64_t)v59;
      v76 = 2112;
      v77 = (int64_t)v61;
      _os_log_impl(&dword_21C655000, v57, OS_LOG_TYPE_DEFAULT, "BCMessage: version: %@ mspVersion: %@", buf, 0x16u);

      v55 = v69;
      v34 = v58;
      v33 = v71;

    }
    if (v12)
    {
      objc_storeStrong((id *)&v14->_messageGUID, a5);
      -[BCMessage updateTitles](v14);
    }

    v10 = v72;
LABEL_35:
    v49 = v14;
    goto LABEL_36;
  }
  LogCategory_Daemon();
  v52 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_21C655000, v52, OS_LOG_TYPE_ERROR, "BCMessage: Cannot initialize with nil request identifier", buf, 2u);
  }

  v49 = 0;
  v10 = v72;
LABEL_36:

  return v49;
}

- (void)updateTitles
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  BCInternalAuthenticationManager *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  if ((objc_msgSend(a1, "isFromMe") & 1) != 0)
    objc_msgSend(a1, "replyMessage");
  else
    objc_msgSend(a1, "receivedMessage");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setTitle:", v2);

  objc_msgSend(v25, "alternateTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v25, "alternateTitle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTitle:", v4);

  }
  objc_msgSend(a1, "title");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5
    || (v6 = (void *)v5,
        objc_msgSend(a1, "rootKey"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("error")),
        v7,
        v6,
        v8))
  {
    +[BCMessage defaultBubbleTitleFor:](BCMessage, "defaultBubbleTitleFor:", a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTitle:", v9);

  }
  objc_msgSend(v25, "subtitle");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(a1, "rootKey");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("error"));

    if ((v13 & 1) == 0)
    {
      v14 = objc_alloc(MEMORY[0x24BDD1458]);
      objc_msgSend(v25, "subtitle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithString:", v15);
      objc_msgSend(a1, "setSubtitle:", v16);

    }
  }
  objc_msgSend(a1, "rootObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v18 = -[BCInternalAuthenticationManager initWithAuthenticationRequest:]([BCInternalAuthenticationManager alloc], "initWithAuthenticationRequest:", v17);
    -[BCInternalAuthenticationManager title](v18, "title");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setTitle:", v19);

    v20 = objc_alloc(MEMORY[0x24BDD1458]);
    -[BCInternalAuthenticationManager subtitle](v18, "subtitle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v20, "initWithString:", v21);
    objc_msgSend(a1, "setSubtitle:", v22);

  }
  objc_msgSend(a1, "title");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setSummaryText:", v23);

  objc_msgSend(a1, "title");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setAccessibilityLabel:", v24);

}

- (id)initFromOriginalMessage:(id)a3 rootKey:(id)a4 rootObject:(id)a5 receivedMessage:(id)a6 replyMessage:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BCMessage *v17;
  uint64_t v18;
  NSString *requestIdentifier;
  uint64_t v20;
  BCImageStore *imageStore;
  uint64_t v22;
  NSString *messageGUID;
  objc_super v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)BCMessage;
  v17 = -[BCMessage init](&v25, sel_init);
  if (v17)
  {
    v17->_version = objc_msgSend(v12, "version");
    objc_msgSend(v12, "requestIdentifier");
    v18 = objc_claimAutoreleasedReturnValue();
    requestIdentifier = v17->_requestIdentifier;
    v17->_requestIdentifier = (NSString *)v18;

    objc_storeStrong((id *)&v17->_rootObject, a5);
    objc_storeStrong((id *)&v17->_internalRootKey, a4);
    v17->_isFromMe = 1;
    objc_storeStrong((id *)&v17->_replyMessage, a7);
    objc_storeStrong((id *)&v17->_receivedMessage, a6);
    objc_msgSend(v12, "imageStore");
    v20 = objc_claimAutoreleasedReturnValue();
    imageStore = v17->_imageStore;
    v17->_imageStore = (BCImageStore *)v20;

    objc_msgSend(v12, "messageGUID");
    v22 = objc_claimAutoreleasedReturnValue();
    messageGUID = v17->_messageGUID;
    v17->_messageGUID = (NSString *)v22;

    -[BCMessage updateTitles](v17);
  }

  return v17;
}

- (NSDictionary)dictionaryValue
{
  void *v3;
  void *v4;
  void *v5;
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
  void *v17;
  void *v18;
  void *v19;

  v3 = (void *)objc_opt_new();
  -[BCMessage rootObject](self, "rootObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCMessage rootKey](self, "rootKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, v6);

  -[BCMessage requestIdentifier](self, "requestIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("requestIdentifier"));

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), -[BCMessage version](self, "version"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("version"));

  -[BCMessage imageStore](self, "imageStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rawArray");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[BCMessage imageStore](self, "imageStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "rawArray");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("images"));

  }
  -[BCMessage receivedMessage](self, "receivedMessage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[BCMessage receivedMessage](self, "receivedMessage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("receivedMessage"));

  }
  -[BCMessage replyMessage](self, "replyMessage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[BCMessage replyMessage](self, "replyMessage");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("replyMessage"));

  }
  v19 = (void *)objc_msgSend(v3, "copy");

  return (NSDictionary *)v19;
}

- (NSURL)url
{
  void *v3;
  void *v4;
  void *v5;
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

  -[BCMessage receivedMessage](self, "receivedMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCMessage encodedStringForDictionary:]((uint64_t)self, (uint64_t)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[BCMessage replyMessage](self, "replyMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCMessage encodedStringForDictionary:]((uint64_t)self, (uint64_t)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[BCMessage dictionaryValue](self, "dictionaryValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[BCMessage encodedStringForDictionary:]((uint64_t)self, (uint64_t)v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_opt_new();
  if (v5)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("receivedMessage"), v5);
    objc_msgSend(v12, "addObject:", v13);

  }
  if (v8)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("replyMessage"), v8);
    objc_msgSend(v12, "addObject:", v14);

  }
  if (v10)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("images"), v10);
    objc_msgSend(v12, "addObject:", v15);

  }
  objc_msgSend(v11, "setQueryItems:", v12);
  objc_msgSend(v11, "URL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v16;
}

- (id)encodedStringForDictionary:(uint64_t)a1
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v2 = 0;
  v11 = *MEMORY[0x24BDAC8D0];
  if (a1 && a2)
  {
    v8 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", a2, 1, &v8);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v8;
    if (v4)
    {
      LogCategory_Daemon();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v4;
        _os_log_error_impl(&dword_21C655000, v5, OS_LOG_TYPE_ERROR, "BCMessage: error encoding dictionary %@", buf, 0xCu);
      }
      v2 = 0;
    }
    else
    {
      objc_msgSend(v3, "base64EncodedDataWithOptions:", 0);
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4);
      -[NSString normalizedBase64Encoded](v5);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (void *)v6;
    }

  }
  return v2;
}

- (NSData)data
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD1608];
  -[BCMessage dictionaryValue](self, "dictionaryValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v4;
}

- (int64_t)style
{
  void *v3;
  void *v4;
  NSObject *v5;
  int64_t v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (-[BCMessage isFromMe](self, "isFromMe"))
    -[BCMessage replyMessage](self, "replyMessage");
  else
    -[BCMessage receivedMessage](self, "receivedMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LogCategory_Daemon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_21C655000, v5, OS_LOG_TYPE_DEFAULT, "BCMessage: style %@", (uint8_t *)&v8, 0xCu);
  }

  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("small")) & 1) != 0)
  {
    v6 = 1;
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("large")))
  {
    v6 = 2;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)type
{
  void *v3;
  char v4;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  void *v20;
  int v21;

  -[BCMessage rootKey](self, "rootKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("authenticate"));

  if ((v4 & 1) != 0)
    return 5;
  -[BCMessage rootKey](self, "rootKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("internalAuthenticate"));

  if ((v7 & 1) != 0)
    return 6;
  -[BCMessage rootKey](self, "rootKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("content"));

  if ((v9 & 1) != 0)
    return 3;
  -[BCMessage rootKey](self, "rootKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("listPicker"));

  if ((v11 & 1) != 0)
    return 1;
  -[BCMessage rootKey](self, "rootKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("quick-reply"));

  if ((v13 & 1) != 0)
    return 8;
  -[BCMessage rootKey](self, "rootKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("event"));

  if ((v15 & 1) != 0)
    return 2;
  -[BCMessage rootKey](self, "rootKey");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("payment"));

  if ((v17 & 1) != 0)
    return 0;
  -[BCMessage rootKey](self, "rootKey");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("dynamic"));

  if ((v19 & 1) != 0)
    return 7;
  -[BCMessage rootKey](self, "rootKey");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("unknown"));

  if (v21)
    return 9;
  else
    return 4;
}

- (UIImage)image
{
  void *v3;
  void *v4;

  if (-[BCMessage isFromMe](self, "isFromMe"))
    -[BCMessage replyMessage](self, "replyMessage");
  else
    -[BCMessage receivedMessage](self, "receivedMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v4;
}

- (NSString)rootKey
{
  NSString *internalRootKey;
  __CFString *v4;
  void *v5;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;

  if (self && (internalRootKey = self->_internalRootKey) != 0)
  {
    v4 = internalRootKey;
  }
  else
  {
    -[BCMessage messageData](self, "messageData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "combinedDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = CFSTR("internalAuthenticate");
    objc_msgSend(v6, "objectForKey:", CFSTR("internalAuthenticate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[BCMessage messageData](self, "messageData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "combinedDictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = CFSTR("authenticate");
      objc_msgSend(v9, "objectForKey:", CFSTR("authenticate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        -[BCMessage messageData](self, "messageData");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "combinedDictionary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = CFSTR("listPicker");
        objc_msgSend(v12, "objectForKey:", CFSTR("listPicker"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          -[BCMessage messageData](self, "messageData");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "combinedDictionary");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = CFSTR("quick-reply");
          objc_msgSend(v15, "objectForKey:", CFSTR("quick-reply"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
          {
            -[BCMessage messageData](self, "messageData");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "combinedDictionary");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v4 = CFSTR("event");
            objc_msgSend(v18, "objectForKey:", CFSTR("event"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v19)
            {
              -[BCMessage messageData](self, "messageData");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "combinedDictionary");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v4 = CFSTR("content");
              objc_msgSend(v21, "objectForKey:", CFSTR("content"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v22)
              {
                -[BCMessage messageData](self, "messageData");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v23, "combinedDictionary");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v4 = CFSTR("payment");
                objc_msgSend(v24, "objectForKey:", CFSTR("payment"));
                v25 = (void *)objc_claimAutoreleasedReturnValue();

                if (!v25)
                {
                  -[BCMessage messageData](self, "messageData");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "combinedDictionary");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v4 = CFSTR("dynamic");
                  objc_msgSend(v27, "objectForKey:", CFSTR("dynamic"));
                  v28 = objc_claimAutoreleasedReturnValue();
                  if (v28)
                  {
                    v29 = (void *)v28;
                    -[BCMessage messageData](self, "messageData");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "combinedDictionary");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@.%@"), CFSTR("dynamic"), CFSTR("data"), CFSTR("encryptionKey"));
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v31, "valueForKeyPath:", v32);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();
                    v34 = objc_msgSend(v33, "length");

                    if (!v34)
                      return (NSString *)v4;
                  }
                  else
                  {

                  }
                  if (!+[BCFeatureFlag isFeatureEnabledForFeature:](BCFeatureFlag, "isFeatureEnabledForFeature:", 1))goto LABEL_23;
                  -[BCMessage messageData](self, "messageData");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v35, "combinedDictionary");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  v4 = CFSTR("notification");
                  objc_msgSend(v36, "objectForKey:", CFSTR("notification"));
                  v37 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v37)
                  {
LABEL_23:
                    if (-[BCMessage isAnyUnknownRootKey](self))
                      v4 = CFSTR("unknown");
                    else
                      v4 = CFSTR("error");
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return (NSString *)v4;
}

- (uint64_t)isAnyUnknownRootKey
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  if (qword_25529A5D8 != -1)
    dispatch_once(&qword_25529A5D8, &__block_literal_global);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(a1, "messageData", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "combinedDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if (!objc_msgSend((id)_MergedGlobals_4, "containsObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i)))
        {
          v5 = 1;
          goto LABEL_14;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_14:

  return v5;
}

- (id)makeRootObjectWithMessageData:(id)a3 dictionary:(id)a4 imageDictionary:(id)a5 version:(int64_t)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _BOOL4 v14;
  __objc2_class *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v21;
  uint64_t v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;

  v9 = a3;
  v10 = a4;
  objc_msgSend(v9, "combinedDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("internalAuthenticate"));
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    v14 = -[BCMessage isFromMe](self, "isFromMe");

    if (v14)
    {
      v15 = BCInternalAuthenticationResponse;
LABEL_7:
      v18 = objc_msgSend([v15 alloc], "initWithDictionary:", v10);
      goto LABEL_8;
    }
  }
  else
  {

  }
  objc_msgSend(v9, "combinedDictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKey:", CFSTR("internalAuthenticate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v15 = BCInternalAuthenticationRequest;
    goto LABEL_7;
  }
  objc_msgSend(v9, "combinedDictionary");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKey:", CFSTR("authenticate"));
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    v24 = -[BCMessage isFromMe](self, "isFromMe");

    if (v24)
    {
      +[BCOAuth2ResponseFactory makeResponseObjectWithDictionary:version:](BCOAuth2ResponseFactory, "makeResponseObjectWithDictionary:version:", v10, a6);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
  }
  else
  {

  }
  objc_msgSend(v9, "combinedDictionary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKey:", CFSTR("authenticate"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v26)
  {
    v19 = 0;
    goto LABEL_9;
  }
  +[BCOAuth2RequestFactory makeRequestObjectWithDictionary:version:](BCOAuth2RequestFactory, "makeRequestObjectWithDictionary:version:", v10, a6);
  v18 = objc_claimAutoreleasedReturnValue();
LABEL_8:
  v19 = (void *)v18;
LABEL_9:

  return v19;
}

void __32__BCMessage_isAnyUnknownRootKey__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[16];

  v5[15] = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc(MEMORY[0x24BDBCEF0]);
  v5[0] = CFSTR("images");
  v5[1] = CFSTR("mspVersion");
  v5[2] = CFSTR("data");
  v5[3] = CFSTR("receivedMessage");
  v5[4] = CFSTR("replyMessage");
  v5[5] = CFSTR("requestIdentifier");
  v5[6] = CFSTR("version");
  v5[7] = CFSTR("authenticate");
  v5[8] = CFSTR("content");
  v5[9] = CFSTR("event");
  v5[10] = CFSTR("internalAuthenticate");
  v5[11] = CFSTR("dynamic");
  v5[12] = CFSTR("listPicker");
  v5[13] = CFSTR("payment");
  v5[14] = CFSTR("quick-reply");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 15);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v0, "initWithArray:", v1);

  if (+[BCFeatureFlag isFeatureEnabledForFeature:](BCFeatureFlag, "isFeatureEnabledForFeature:", 1))
    objc_msgSend(v2, "addObject:", CFSTR("notification"));
  v3 = objc_msgSend(v2, "copy");
  v4 = (void *)_MergedGlobals_4;
  _MergedGlobals_4 = v3;

}

- (BOOL)isVersionSupported
{
  unint64_t v3;
  int64_t v5;

  v3 = -[BCMessage type](self, "type");
  if (v3 > 0xA || ((0x5FFu >> v3) & 1) == 0)
    return 0;
  v5 = qword_21C668DE0[v3];
  return -[BCMessage version](self, "version") <= v5;
}

+ (id)defaultBubbleTitleFor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  id v14;
  void *v16;
  int v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  int v25;
  void *v26;
  int v27;
  void *v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  char v33;

  v3 = a3;
  +[BCShared classBundle]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DEFAULT_ERROR_TITLE"), &stru_24E0651E8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "rootKey");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("unknown")) & 1) != 0)
    {

LABEL_8:
      +[BCShared classBundle]();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = CFSTR("ERROR_UNKNOWN_ROOT_KEY_iOS");
      goto LABEL_9;
    }
    v7 = objc_msgSend(v3, "isVersionSupported");

    if ((v7 & 1) == 0)
      goto LABEL_8;
    objc_msgSend(v3, "rootKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", CFSTR("listPicker")))
    {
      v9 = objc_msgSend(v3, "isFromMe");

      if (v9)
      {
        +[BCShared classBundle]();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        v12 = CFSTR("DEFAULT_LIST_PICKER_SELECTED_TITLE");
LABEL_9:
        objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_24E0651E8, 0);
        v13 = (const __CFString *)objc_claimAutoreleasedReturnValue();

        v5 = v11;
LABEL_10:

        v5 = (void *)v13;
        goto LABEL_11;
      }
    }
    else
    {

    }
    objc_msgSend(v3, "rootKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("listPicker"));

    if (v17)
    {
      +[BCShared classBundle]();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = CFSTR("DEFAULT_LIST_PICKER_TITLE");
      goto LABEL_9;
    }
    objc_msgSend(v3, "rootKey");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isEqualToString:", CFSTR("event")))
    {
      v19 = objc_msgSend(v3, "isFromMe");

      if (v19)
      {
        +[BCShared classBundle]();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        v12 = CFSTR("DEFAULT_TIME_PICKER_SELECTED_TITLE");
        goto LABEL_9;
      }
    }
    else
    {

    }
    objc_msgSend(v3, "rootKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("event"));

    if (v21)
    {
      +[BCShared classBundle]();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = CFSTR("DEFAULT_TIME_PICKER_TITLE");
      goto LABEL_9;
    }
    objc_msgSend(v3, "rootKey");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("payment"));

    if (v23)
    {
      +[BCShared classBundle]();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = CFSTR("ERROR_APPLE_PAY_TITLE");
      goto LABEL_9;
    }
    objc_msgSend(v3, "rootKey");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("authenticate"));

    if (v25
      || (objc_msgSend(v3, "rootKey"),
          v26 = (void *)objc_claimAutoreleasedReturnValue(),
          v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("internalAuthenticate")),
          v26,
          v27))
    {
      +[BCShared classBundle]();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = CFSTR("DEFAULT_ERROR_TITLE");
      goto LABEL_9;
    }
    objc_msgSend(v3, "rootKey");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "isEqualToString:", CFSTR("dynamic")))
    {
      v29 = objc_msgSend(v3, "isFromMe");

      if (v29)
      {
        +[BCShared classBundle]();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        v12 = CFSTR("DEFAULT_JITAPPKIT_SELECTED_TITLE");
        goto LABEL_9;
      }
    }
    else
    {

    }
    objc_msgSend(v3, "rootKey");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("dynamic"));

    if (v31)
    {
      +[BCShared classBundle]();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v12 = CFSTR("DEFAULT_JITAPPKIT_TITLE");
      goto LABEL_9;
    }
    if (+[BCFeatureFlag isFeatureEnabledForFeature:](BCFeatureFlag, "isFeatureEnabledForFeature:", 1))
    {
      objc_msgSend(v3, "rootKey");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isEqualToString:", CFSTR("notification"));

      if ((v33 & 1) != 0)
      {
        v13 = CFSTR("Notification");
        goto LABEL_10;
      }
    }
  }
LABEL_11:
  v14 = v5;

  return v14;
}

- (int64_t)version
{
  return self->_version;
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (NSString)messageGUID
{
  return self->_messageGUID;
}

- (NSUUID)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (BOOL)isFromMe
{
  return self->_isFromMe;
}

- (BCDictionarySerializable)rootObject
{
  return self->_rootObject;
}

- (BCImageStore)imageStore
{
  return self->_imageStore;
}

- (BCMessageData)messageData
{
  return self->_messageData;
}

- (BCMessageInfo)receivedMessage
{
  return self->_receivedMessage;
}

- (BCMessageInfo)replyMessage
{
  return self->_replyMessage;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSAttributedString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_subtitle, a3);
}

- (NSString)summaryText
{
  return self->_summaryText;
}

- (void)setSummaryText:(id)a3
{
  objc_storeStrong((id *)&self->_summaryText, a3);
}

- (NSString)subcaption
{
  return self->_subcaption;
}

- (void)setSubcaption:(id)a3
{
  objc_storeStrong((id *)&self->_subcaption, a3);
}

- (NSString)accessibilityLabel
{
  return self->_accessibilityLabel;
}

- (void)setAccessibilityLabel:(id)a3
{
  objc_storeStrong((id *)&self->_accessibilityLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalRootKey, 0);
  objc_storeStrong((id *)&self->_accessibilityLabel, 0);
  objc_storeStrong((id *)&self->_subcaption, 0);
  objc_storeStrong((id *)&self->_summaryText, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_replyMessage, 0);
  objc_storeStrong((id *)&self->_receivedMessage, 0);
  objc_storeStrong((id *)&self->_messageData, 0);
  objc_storeStrong((id *)&self->_imageStore, 0);
  objc_storeStrong((id *)&self->_rootObject, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_messageGUID, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
}

@end
