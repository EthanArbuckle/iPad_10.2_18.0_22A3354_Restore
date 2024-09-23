@implementation IDSOffGridEncryptedMessage

+ (id)_daemonListener
{
  void *v2;
  void *v3;

  +[IDSDaemonController sharedInstance](IDSDaemonController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "listener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (int64_t)maxPayloadSizeForType:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "_daemonListener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "maxIMLPayloadSize");

  v6 = -3;
  if (!a3)
    v6 = -19;
  return v5 + v6;
}

- (IDSOffGridEncryptedMessage)initWithMessage:(id)a3 senderURI:(id)a4 recipientURI:(id)a5 encryptionProperties:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  IDSOffGridEncryptedMessage *v15;
  IDSOffGridEncryptedMessage *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)IDSOffGridEncryptedMessage;
  v15 = -[IDSOffGridEncryptedMessage init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_message, a3);
    objc_storeStrong((id *)&v16->_senderURI, a4);
    objc_storeStrong((id *)&v16->_recipientURI, a5);
    objc_storeStrong((id *)&v16->_encryptionProperties, a6);
  }

  return v16;
}

- (IDSOffGridEncryptedMessage)initWithPayload:(id)a3 senderURI:(id)a4 recipientURI:(id)a5
{
  id v8;
  id v9;
  id v10;
  IDSOffGridEncryptedMessage *v11;
  IDSOffGridEncryptedMessage *v12;
  void *v13;
  void *v14;
  void *v15;
  IDSOffGridEncryptionProperties *v16;
  IDSOffGridEncryptionProperties *encryptionProperties;
  void *v18;
  unint64_t v19;
  void *v20;
  unsigned __int16 v22;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)IDSOffGridEncryptedMessage;
  v11 = -[IDSOffGridEncryptedMessage init](&v23, sel_init);
  if (!v11)
  {
LABEL_7:
    v12 = v11;
    goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend(v8, "length") >= 4)
  {
    objc_msgSend(v8, "subdataWithRange:", 0, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subdataWithRange:", 1, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "subdataWithRange:", 3, objc_msgSend(v8, "length") - 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v14, "getBytes:length:", &v22, 2);
    objc_storeStrong((id *)&v11->_message, v15);
    objc_storeStrong((id *)&v11->_senderURI, a4);
    objc_storeStrong((id *)&v11->_recipientURI, a5);
    v16 = objc_alloc_init(IDSOffGridEncryptionProperties);
    encryptionProperties = v11->_encryptionProperties;
    v11->_encryptionProperties = v16;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSOffGridEncryptionProperties setRatchetCounter:](v11->_encryptionProperties, "setRatchetCounter:", v18);

    -[IDSOffGridEncryptionProperties setEncryptionKeyID:](v11->_encryptionProperties, "setEncryptionKeyID:", v13);
    v19 = objc_msgSend(v8, "length");
    if (v19 >= 0x13)
    {
      objc_msgSend(v8, "subdataWithRange:", v19 - 16, 16);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[IDSOffGridEncryptionProperties setAuthTag:](v11->_encryptionProperties, "setAuthTag:", v20);

    }
    goto LABEL_7;
  }
  v12 = 0;
LABEL_8:

  return v12;
}

- (IDSOffGridEncryptedMessage)initWithDictionaryMessage:(id)a3
{
  id v4;
  IDSOffGridEncryptedMessage *v5;
  uint64_t v6;
  NSData *message;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  IDSURI *senderURI;
  uint64_t v12;
  IDSURI *recipientURI;
  IDSOffGridEncryptionProperties *v14;
  void *v15;
  uint64_t v16;
  IDSOffGridEncryptionProperties *encryptionProperties;
  uint64_t v18;
  NSDate *date;
  uint64_t v20;
  NSNumber *pendingTotalCount;
  uint64_t v22;
  NSNumber *pendingCount;
  uint64_t v24;
  NSNumber *preferredService;
  IDSOffGridEncryptedMessage *v26;
  objc_super v28;

  v4 = a3;
  if (v4)
  {
    v28.receiver = self;
    v28.super_class = (Class)IDSOffGridEncryptedMessage;
    v5 = -[IDSOffGridEncryptedMessage init](&v28, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("message"));
      v6 = objc_claimAutoreleasedReturnValue();
      message = v5->_message;
      v5->_message = (NSData *)v6;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
      v8 = objc_claimAutoreleasedReturnValue();
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v8;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("senderURI"));
      v10 = objc_claimAutoreleasedReturnValue();
      senderURI = v5->_senderURI;
      v5->_senderURI = (IDSURI *)v10;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("recipientURI"));
      v12 = objc_claimAutoreleasedReturnValue();
      recipientURI = v5->_recipientURI;
      v5->_recipientURI = (IDSURI *)v12;

      v14 = [IDSOffGridEncryptionProperties alloc];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("encryptionProperties"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[IDSOffGridEncryptionProperties initWithDictionary:](v14, "initWithDictionary:", v15);
      encryptionProperties = v5->_encryptionProperties;
      v5->_encryptionProperties = (IDSOffGridEncryptionProperties *)v16;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("date"));
      v18 = objc_claimAutoreleasedReturnValue();
      date = v5->_date;
      v5->_date = (NSDate *)v18;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pendingTotalCount"));
      v20 = objc_claimAutoreleasedReturnValue();
      pendingTotalCount = v5->_pendingTotalCount;
      v5->_pendingTotalCount = (NSNumber *)v20;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pendingCount"));
      v22 = objc_claimAutoreleasedReturnValue();
      pendingCount = v5->_pendingCount;
      v5->_pendingCount = (NSNumber *)v22;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("preferredService"));
      v24 = objc_claimAutoreleasedReturnValue();
      preferredService = v5->_preferredService;
      v5->_preferredService = (NSNumber *)v24;

    }
    self = v5;
    v26 = self;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (IDSOffGridEncryptedMessage)initWithSegments:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  IDSOffGridEncryptedMessage *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "sortedArrayUsingSelector:", sel_compare_);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "message", (_QWORD)v22);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v7)
          objc_msgSend(v7, "appendData:", v10);
        else
          v7 = (void *)objc_msgSend(v10, "mutableCopy");

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  objc_msgSend(v4, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (IDSOffGridEncryptedMessage *)objc_msgSend(v12, "copy");

  -[IDSOffGridEncryptedMessage setMessage:](v13, "setMessage:", v7);
  -[IDSOffGridEncryptedMessage encryptionProperties](v13, "encryptionProperties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSegmentNumber:", &unk_1E2CAE330);

  -[IDSOffGridEncryptedMessage encryptionProperties](v13, "encryptionProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTotalSegments:", &unk_1E2CAE330);

  v16 = objc_msgSend(v7, "length");
  if (v16 >= 0x13)
  {
    objc_msgSend(v7, "subdataWithRange:", v16 - 16, 16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[IDSOffGridEncryptedMessage encryptionProperties](v13, "encryptionProperties");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAuthTag:", v17);

  }
  objc_msgSend(v4, "firstObject", (_QWORD)v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSOffGridEncryptedMessage setDate:](v13, "setDate:", v20);

  return v13;
}

- (int64_t)maxPayloadSizeRemaining
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  uint64_t v6;
  void *v7;
  int64_t v8;

  -[IDSOffGridEncryptedMessage encryptionProperties](self, "encryptionProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authTag");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == 0;

  v6 = objc_msgSend((id)objc_opt_class(), "maxPayloadSizeForType:", v5);
  -[IDSOffGridEncryptedMessage message](self, "message");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 - objc_msgSend(v7, "length");

  return v8;
}

- (id)splitMessageIntoMessagesThatFit
{
  IDSOffGridEncryptedMessage *v2;
  int64_t v3;
  void *v4;
  void *v5;
  int64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  IDSOffGridEncryptedMessage *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _QWORD v44[3];

  v2 = self;
  v44[1] = *MEMORY[0x1E0C80C00];
  v3 = -[IDSOffGridEncryptedMessage maxPayloadSizeRemaining](self, "maxPayloadSizeRemaining");
  if (v3 < 0)
  {
    v7 = v3;
    v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[IDSOffGridEncryptedMessage message](v2, "message");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");
    v11 = objc_msgSend((id)objc_opt_class(), "maxPayloadSizeForType:", 1);
    v12 = objc_msgSend(v9, "length");
    v38 = v9;
    v13 = 0;
    if (v10)
    {
      v14 = 0;
      v15 = v12 + v7;
      v36 = v11;
      v37 = v10;
      do
      {
        ++v13;
        v16 = objc_msgSend(v38, "length");
        if (v15 >= v16 - v14)
          v17 = v16 - v14;
        else
          v17 = v15;
        objc_msgSend(v38, "subdataWithRange:", v14, v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)-[IDSOffGridEncryptedMessage copy](v2, "copy");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
        v20 = v8;
        v21 = v2;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "encryptionProperties");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setSegmentNumber:", v22);

        v2 = v21;
        v8 = v20;
        objc_msgSend(v19, "setMessage:", v18);
        objc_msgSend(v20, "addObject:", v19);
        v14 += v17;

        v15 = v36;
      }
      while (v14 < v37);
    }
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v24 = v8;
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v26; ++i)
        {
          if (*(_QWORD *)v40 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v29, "encryptionProperties");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "segmentNumber");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v31, "integerValue");

          if (v32 != v13)
          {
            objc_msgSend(v29, "encryptionProperties");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setAuthTag:", 0);

          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "encryptionProperties");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setTotalSegments:", v34);

        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v26);
    }

    return v24;
  }
  else
  {
    -[IDSOffGridEncryptedMessage encryptionProperties](v2, "encryptionProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSegmentNumber:", &unk_1E2CAE330);

    -[IDSOffGridEncryptedMessage encryptionProperties](v2, "encryptionProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTotalSegments:", &unk_1E2CAE330);

    v44[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 1);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[IDSOffGridEncryptedMessage encryptionProperties](self, "encryptionProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encryptionProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)dictionaryRepresentation
{
  __CFDictionary *v3;
  __CFDictionary *v4;
  NSData *message;
  NSString *identifier;
  void *v7;
  NSString *service;
  void *v9;
  NSString *senderShortHandle;
  void *v11;
  NSString *recipientShortHandle;
  NSDate *date;
  NSNumber *pendingTotalCount;
  NSNumber *pendingCount;
  NSNumber *preferredService;
  void *v17;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  message = self->_message;
  if (message)
    CFDictionarySetValue(v3, CFSTR("message"), message);
  identifier = self->_identifier;
  if (identifier)
    CFDictionarySetValue(v4, CFSTR("identifier"), identifier);
  -[IDSOffGridEncryptionProperties dictionaryRepresentation](self->_encryptionProperties, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFDictionarySetValue(v4, CFSTR("encryptionProperties"), v7);

  service = self->_service;
  if (service)
    CFDictionarySetValue(v4, CFSTR("service"), service);
  -[IDSURI prefixedURI](self->_senderURI, "prefixedURI");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    CFDictionarySetValue(v4, CFSTR("senderURI"), v9);

  senderShortHandle = self->_senderShortHandle;
  if (senderShortHandle)
    CFDictionarySetValue(v4, CFSTR("senderShortHandle"), senderShortHandle);
  -[IDSURI prefixedURI](self->_recipientURI, "prefixedURI");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    CFDictionarySetValue(v4, CFSTR("recipientURI"), v11);

  recipientShortHandle = self->_recipientShortHandle;
  if (recipientShortHandle)
    CFDictionarySetValue(v4, CFSTR("recipientShortHandle"), recipientShortHandle);
  date = self->_date;
  if (date)
    CFDictionarySetValue(v4, CFSTR("date"), date);
  pendingTotalCount = self->_pendingTotalCount;
  if (pendingTotalCount)
    CFDictionarySetValue(v4, CFSTR("pendingTotalCount"), pendingTotalCount);
  pendingCount = self->_pendingCount;
  if (pendingCount)
    CFDictionarySetValue(v4, CFSTR("pendingCount"), pendingCount);
  preferredService = self->_preferredService;
  if (preferredService)
    CFDictionarySetValue(v4, CFSTR("preferredService"), preferredService);
  v17 = (void *)-[__CFDictionary copy](v4, "copy");

  return v17;
}

- (id)payload
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  -[IDSOffGridEncryptedMessage encryptionProperties](self, "encryptionProperties");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encryptionKeyID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "subdataWithRange:", 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendData:", v6);

  -[IDSOffGridEncryptedMessage encryptionProperties](self, "encryptionProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ratchetCounter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedShortValue");

  v12 = v9;
  objc_msgSend(v3, "appendBytes:length:", &v12, 2);
  -[IDSOffGridEncryptedMessage message](self, "message");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendData:", v10);

  return v3;
}

- (int64_t)preferredServiceType
{
  void *v3;
  int64_t v4;

  -[IDSOffGridEncryptedMessage preferredService](self, "preferredService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[IDSOffGridEncryptedMessage serviceTypeFromNumber:](self, "serviceTypeFromNumber:", v3);

  return v4;
}

- (int64_t)serviceTypeFromNumber:(id)a3
{
  uint64_t v3;
  int64_t v4;

  if (!a3)
    return -1;
  v3 = objc_msgSend(a3, "integerValue");
  if (v3 == 1)
    v4 = 1;
  else
    v4 = -1;
  if (v3)
    return v4;
  else
    return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = objc_alloc((Class)objc_opt_class());
  -[IDSOffGridEncryptedMessage message](self, "message");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSOffGridEncryptedMessage senderURI](self, "senderURI");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSOffGridEncryptedMessage recipientURI](self, "recipientURI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSOffGridEncryptedMessage encryptionProperties](self, "encryptionProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");
  v10 = (void *)objc_msgSend(v4, "initWithMessage:senderURI:recipientURI:encryptionProperties:", v5, v6, v7, v9);

  -[IDSOffGridEncryptedMessage preferredService](self, "preferredService");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPreferredService:", v11);

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSOffGridEncryptedMessage)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  IDSOffGridEncryptedMessage *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderURI"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientURI"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("encryptionProperties"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("service"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderShortHandle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recipientShortHandle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pendingTotalCount"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pendingCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredService"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[IDSOffGridEncryptedMessage initWithMessage:senderURI:recipientURI:encryptionProperties:]([IDSOffGridEncryptedMessage alloc], "initWithMessage:senderURI:recipientURI:encryptionProperties:", v18, v14, v4, v5);
  -[IDSOffGridEncryptedMessage setIdentifier:](v10, "setIdentifier:", v17);
  -[IDSOffGridEncryptedMessage setService:](v10, "setService:", v6);
  -[IDSOffGridEncryptedMessage setSenderShortHandle:](v10, "setSenderShortHandle:", v7);
  -[IDSOffGridEncryptedMessage setRecipientShortHandle:](v10, "setRecipientShortHandle:", v8);
  -[IDSOffGridEncryptedMessage setDate:](v10, "setDate:", v15);
  -[IDSOffGridEncryptedMessage setPendingTotalCount:](v10, "setPendingTotalCount:", v13);
  -[IDSOffGridEncryptedMessage setPendingCount:](v10, "setPendingCount:", v12);
  -[IDSOffGridEncryptedMessage setPreferredService:](v10, "setPreferredService:", v9);

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *message;
  id v5;

  message = self->_message;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", message, CFSTR("message"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_senderURI, CFSTR("senderURI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipientURI, CFSTR("recipientURI"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_encryptionProperties, CFSTR("encryptionProperties"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_service, CFSTR("service"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_senderShortHandle, CFSTR("senderShortHandle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recipientShortHandle, CFSTR("recipientShortHandle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("date"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pendingTotalCount, CFSTR("pendingTotalCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pendingCount, CFSTR("pendingCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_preferredService, CFSTR("preferredService"));

}

- (NSData)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (IDSURI)senderURI
{
  return self->_senderURI;
}

- (void)setSenderURI:(id)a3
{
  objc_storeStrong((id *)&self->_senderURI, a3);
}

- (IDSURI)recipientURI
{
  return self->_recipientURI;
}

- (void)setRecipientURI:(id)a3
{
  objc_storeStrong((id *)&self->_recipientURI, a3);
}

- (IDSOffGridEncryptionProperties)encryptionProperties
{
  return self->_encryptionProperties;
}

- (void)setEncryptionProperties:(id)a3
{
  objc_storeStrong((id *)&self->_encryptionProperties, a3);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSNumber)pendingTotalCount
{
  return self->_pendingTotalCount;
}

- (void)setPendingTotalCount:(id)a3
{
  objc_storeStrong((id *)&self->_pendingTotalCount, a3);
}

- (NSNumber)pendingCount
{
  return self->_pendingCount;
}

- (void)setPendingCount:(id)a3
{
  objc_storeStrong((id *)&self->_pendingCount, a3);
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (NSString)senderShortHandle
{
  return self->_senderShortHandle;
}

- (void)setSenderShortHandle:(id)a3
{
  objc_storeStrong((id *)&self->_senderShortHandle, a3);
}

- (NSString)recipientShortHandle
{
  return self->_recipientShortHandle;
}

- (void)setRecipientShortHandle:(id)a3
{
  objc_storeStrong((id *)&self->_recipientShortHandle, a3);
}

- (NSNumber)preferredService
{
  return self->_preferredService;
}

- (void)setPreferredService:(id)a3
{
  objc_storeStrong((id *)&self->_preferredService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredService, 0);
  objc_storeStrong((id *)&self->_recipientShortHandle, 0);
  objc_storeStrong((id *)&self->_senderShortHandle, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_pendingCount, 0);
  objc_storeStrong((id *)&self->_pendingTotalCount, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_encryptionProperties, 0);
  objc_storeStrong((id *)&self->_recipientURI, 0);
  objc_storeStrong((id *)&self->_senderURI, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
