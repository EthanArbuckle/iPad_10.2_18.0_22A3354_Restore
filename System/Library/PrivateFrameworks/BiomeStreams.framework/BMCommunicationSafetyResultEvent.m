@implementation BMCommunicationSafetyResultEvent

+ (BOOL)isEqual:(Class)a3
{
  return (Class)objc_opt_class() == a3 || objc_opt_class() == (_QWORD)a3;
}

- (BMCommunicationSafetyResultEvent)initWithChildID:(id)a3 deviceID:(id)a4 sourceBundleID:(id)a5 absoluteTimeStamp:(double)a6 eventDirection:(unint64_t)a7 eventType:(unint64_t)a8 contentType:(unint64_t)a9 contactHandles:(id)a10 contentID:(id)a11 conversationID:(id)a12 imageData:(id)a13
{
  return -[BMCommunicationSafetyResultEvent initWithChildID:deviceID:sourceBundleID:absoluteTimeStamp:eventDirection:eventType:contentType:contactHandles:contentID:conversationID:imageData:senderHandle:contentURL:conversationURL:](self, "initWithChildID:deviceID:sourceBundleID:absoluteTimeStamp:eventDirection:eventType:contentType:contactHandles:contentID:conversationID:imageData:senderHandle:contentURL:conversationURL:", a3, a4, a5, a7, a8, a9, a6, a10, a11, a12, a13, 0, 0, 0);
}

- (BMCommunicationSafetyResultEvent)initWithChildID:(id)a3 deviceID:(id)a4 sourceBundleID:(id)a5 absoluteTimeStamp:(double)a6 eventDirection:(unint64_t)a7 eventType:(unint64_t)a8 contentType:(unint64_t)a9 contactHandles:(id)a10 contentID:(id)a11 conversationID:(id)a12 imageData:(id)a13 senderHandle:(id)a14 contentURL:(id)a15 conversationURL:(id)a16
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  BMCommunicationSafetyResultEvent *v26;
  uint64_t v27;
  NSString *childID;
  uint64_t v29;
  NSString *deviceID;
  uint64_t v31;
  NSString *sourceBundleID;
  uint64_t v33;
  NSArray *contactHandles;
  uint64_t v35;
  NSString *contentID;
  uint64_t v37;
  NSString *conversationID;
  uint64_t v39;
  NSString *senderHandle;
  id v45;
  id v46;
  id v47;
  id v48;
  objc_super v49;

  v48 = a3;
  v47 = a4;
  v46 = a5;
  v20 = a10;
  v21 = a11;
  v22 = a12;
  v45 = a13;
  v23 = a14;
  v24 = a15;
  v25 = a16;
  v49.receiver = self;
  v49.super_class = (Class)BMCommunicationSafetyResultEvent;
  v26 = -[BMCommunicationSafetyResultEvent init](&v49, sel_init);
  if (v26)
  {
    v27 = objc_msgSend(v48, "copy");
    childID = v26->_childID;
    v26->_childID = (NSString *)v27;

    v29 = objc_msgSend(v47, "copy");
    deviceID = v26->_deviceID;
    v26->_deviceID = (NSString *)v29;

    v31 = objc_msgSend(v46, "copy");
    sourceBundleID = v26->_sourceBundleID;
    v26->_sourceBundleID = (NSString *)v31;

    v26->_absoluteTimestamp = a6;
    v26->_eventDirection = a7;
    v26->_eventType = a8;
    v26->_contentType = a9;
    v33 = objc_msgSend(v20, "copy");
    contactHandles = v26->_contactHandles;
    v26->_contactHandles = (NSArray *)v33;

    v35 = objc_msgSend(v21, "copy");
    contentID = v26->_contentID;
    v26->_contentID = (NSString *)v35;

    v37 = objc_msgSend(v22, "copy");
    conversationID = v26->_conversationID;
    v26->_conversationID = (NSString *)v37;

    objc_storeStrong((id *)&v26->_imageData, a13);
    v39 = objc_msgSend(v23, "copy");
    senderHandle = v26->_senderHandle;
    v26->_senderHandle = (NSString *)v39;

    objc_storeStrong((id *)&v26->_contentURL, a15);
    objc_storeStrong((id *)&v26->_conversationURL, a16);
  }

  return v26;
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v6;
  objc_class *v7;
  void *v8;
  NSObject *v9;

  v6 = a3;
  if (a4 == 1)
  {
    v7 = (objc_class *)a1;
    goto LABEL_5;
  }
  if (a4 == 2)
  {
    v7 = (objc_class *)BMCommunicationSafetyResultEvent_v2;
LABEL_5:
    v8 = (void *)objc_msgSend([v7 alloc], "initWithProtoData:", v6);
    goto LABEL_9;
  }
  __biome_log_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    +[BMCommunicationSafetyResultEvent eventWithData:dataVersion:].cold.1();

  v8 = 0;
LABEL_9:

  return v8;
}

- (id)jsonDict
{
  __int128 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSURL *contentURL;
  NSString *senderHandle;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[14];
  __int128 v16;
  NSString *sourceBundleID;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  NSString *conversationID;
  void *v24;
  NSString *v25;
  void *v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = *(_OWORD *)&self->_childID;
  v15[0] = CFSTR("childId");
  v15[1] = CFSTR("deviceId");
  sourceBundleID = self->_sourceBundleID;
  v16 = v3;
  v15[2] = CFSTR("sourceBundleId");
  v15[3] = CFSTR("absoluteTimestamp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v4;
  v15[4] = CFSTR("eventDirection");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_eventDirection);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v5;
  v15[5] = CFSTR("eventType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_eventType);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v6;
  v15[6] = CFSTR("contentType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_contentType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v7;
  v22 = *(_OWORD *)&self->_contactHandles;
  v15[7] = CFSTR("contactHandles");
  v15[8] = CFSTR("contentID");
  conversationID = self->_conversationID;
  v15[9] = CFSTR("conversationID");
  v15[10] = CFSTR("imageDataLengthInBytes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSData length](self->_imageData, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  senderHandle = self->_senderHandle;
  contentURL = self->_contentURL;
  v24 = v8;
  v25 = senderHandle;
  v15[11] = CFSTR("senderHandle");
  v15[12] = CFSTR("contentURL");
  -[NSURL absoluteString](contentURL, "absoluteString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v11;
  v15[13] = CFSTR("conversationURL");
  -[NSURL absoluteString](self->_conversationURL, "absoluteString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, v15, 14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[BMCommunicationSafetyResultEvent jsonDict](self, "jsonDict");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;

  if (!v4)
  {
    __biome_log_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[BMCommunicationSafetyResultEvent json].cold.1();

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BMCommunicationSafetyResultEvent encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dat"));

}

- (BMCommunicationSafetyResultEvent)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  BMCommunicationSafetyResultEvent *v7;

  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = a3;
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", objc_opt_class(), CFSTR("dat"), v5, 1, CFSTR("BMStreamErrorDomain"), 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    self = -[BMCommunicationSafetyResultEvent initWithProtoData:](self, "initWithProtoData:", v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[BMCommunicationSafetyResultEvent proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BMCommunicationSafetyResultEvent)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  double v7;
  unsigned int v8;
  uint64_t v9;
  BMCommunicationSafetyResultEvent *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  unsigned int v19;
  uint64_t v20;
  NSObject *v21;
  unsigned int v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[NSObject childId](v5, "childId");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject deviceId](v5, "deviceId");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject sourceBundleId](v5, "sourceBundleId");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject absoluteTimestamp](v5, "absoluteTimestamp");
      v7 = v6;
      v8 = -[NSObject communicationSafetyResultEventDirection](v5, "communicationSafetyResultEventDirection");
      if (v8 >= 3)
      {
        __biome_log_for_category();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[BMCommunicationSafetyResultEvent initWithProto:].cold.3();

        v9 = 2;
      }
      else
      {
        v9 = v8;
      }
      v40 = v9;
      v19 = -[NSObject communicationSafetyResultEventType](v5, "communicationSafetyResultEventType");
      if (v19 >= 4)
      {
        __biome_log_for_category();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[BMCommunicationSafetyResultEvent initWithProto:].cold.2();

        v20 = 4;
      }
      else
      {
        v20 = v19;
      }
      v39 = v20;
      v22 = -[NSObject communicationSafetyResultContentType](v5, "communicationSafetyResultContentType");
      if (v22 >= 3)
      {
        __biome_log_for_category();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[BMCommunicationSafetyResultEvent initWithProto:].cold.1();

        v23 = 3;
      }
      else
      {
        v23 = v22;
      }
      v37 = v23;
      -[NSObject contactHandles](v5, "contactHandles");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)objc_msgSend(v38, "copy");
      -[NSObject contentId](v5, "contentId");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject conversationId](v5, "conversationId");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject imageData](v5, "imageData");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject senderHandle](v5, "senderHandle");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0C99E98];
      -[NSObject contentURL](v5, "contentURL");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "URLWithString:", v36);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)MEMORY[0x1E0C99E98];
      -[NSObject conversationURL](v5, "conversationURL");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "URLWithString:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[BMCommunicationSafetyResultEvent initWithChildID:deviceID:sourceBundleID:absoluteTimeStamp:eventDirection:eventType:contentType:contactHandles:contentID:conversationID:imageData:senderHandle:contentURL:conversationURL:](self, "initWithChildID:deviceID:sourceBundleID:absoluteTimeStamp:eventDirection:eventType:contentType:contactHandles:contentID:conversationID:imageData:senderHandle:contentURL:conversationURL:", v43, v42, v41, v40, v39, v37, v7, v35, v34, v33, v25, v26, v28, v31);

      v10 = self;
    }
    else
    {
      __biome_log_for_category();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[BMCommunicationSafetyResultEvent initWithProto:].cold.4(v5, v11, v12, v13, v14, v15, v16, v17);
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BMCommunicationSafetyResultEvent)initWithProtoData:(id)a3
{
  return -[BMCommunicationSafetyResultEvent initWithProtoData:skipImage:](self, "initWithProtoData:skipImage:", a3, 0);
}

- (BMCommunicationSafetyResultEvent)initWithProtoData:(id)a3 skipImage:(BOOL)a4
{
  _BOOL8 v5;
  id v6;
  BMPBCommunicationSafetyResultEvent *v7;
  BMCommunicationSafetyResultEvent *v8;

  if (a3)
  {
    v5 = a4;
    v6 = a3;
    v7 = -[BMPBCommunicationSafetyResultEvent initWithData:skipImage:]([BMPBCommunicationSafetyResultEvent alloc], "initWithData:skipImage:", v6, v5);

    self = -[BMCommunicationSafetyResultEvent initWithProto:](self, "initWithProto:", v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)proto
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  unint64_t v13;
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
  id v24;
  NSObject *v25;

  v3 = (void *)objc_opt_new();
  -[BMCommunicationSafetyResultEvent deviceID](self, "deviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDeviceId:", v4);

  -[BMCommunicationSafetyResultEvent childID](self, "childID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setChildId:", v5);

  -[BMCommunicationSafetyResultEvent sourceBundleID](self, "sourceBundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSourceBundleId:", v6);

  -[BMCommunicationSafetyResultEvent absoluteTimestamp](self, "absoluteTimestamp");
  objc_msgSend(v3, "setAbsoluteTimestamp:");
  v7 = -[BMCommunicationSafetyResultEvent eventDirection](self, "eventDirection");
  if (v7 >= 3)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BMCommunicationSafetyResultEvent proto].cold.3(v7);

    v7 = 0xFFFFFFFFLL;
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  v10 = -[BMCommunicationSafetyResultEvent eventType](self, "eventType");
  v11 = 0;
  switch(v10)
  {
    case 0:
      break;
    case 1:
      v11 = 1;
      break;
    case 2:
      v11 = 2;
      break;
    case 3:
      v11 = 3;
      break;
    default:
      __biome_log_for_category();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[BMCommunicationSafetyResultEvent proto].cold.2(v10);

      v11 = 0xFFFFFFFFLL;
      v8 = 1;
      break;
  }
  v13 = -[BMCommunicationSafetyResultEvent contentType](self, "contentType");
  if (v13 >= 3)
  {
    __biome_log_for_category();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[BMCommunicationSafetyResultEvent proto].cold.1(v13);

    goto LABEL_19;
  }
  if (v8)
  {
LABEL_19:
    v24 = 0;
    goto LABEL_20;
  }
  objc_msgSend(v3, "setCommunicationSafetyResultEventDirection:", v7);
  objc_msgSend(v3, "setCommunicationSafetyResultEventType:", v11);
  objc_msgSend(v3, "setCommunicationSafetyResultContentType:", v13);
  -[BMCommunicationSafetyResultEvent contactHandles](self, "contactHandles");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "mutableCopy");
  objc_msgSend(v3, "setContactHandles:", v15);

  -[BMCommunicationSafetyResultEvent contentID](self, "contentID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentId:", v16);

  -[BMCommunicationSafetyResultEvent conversationID](self, "conversationID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConversationId:", v17);

  -[BMCommunicationSafetyResultEvent imageData](self, "imageData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImageData:", v18);

  -[BMCommunicationSafetyResultEvent senderHandle](self, "senderHandle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSenderHandle:", v19);

  -[BMCommunicationSafetyResultEvent contentURL](self, "contentURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "absoluteString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setContentURL:", v21);

  -[BMCommunicationSafetyResultEvent conversationURL](self, "conversationURL");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "absoluteString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setConversationURL:", v23);

  v24 = v3;
LABEL_20:

  return v24;
}

- (unint64_t)hash
{
  NSUInteger v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  void *v9;
  uint64_t v10;
  NSUInteger v11;
  void *v12;
  unint64_t v13;

  v3 = -[NSString hash](self->_childID, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_absoluteTimestamp);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v3 ^ -[NSString hash](self->_deviceID, "hash");
  v7 = v5 ^ v6 ^ -[NSString hash](self->_sourceBundleID, "hash");
  v8 = -[NSString hash](self->_contentID, "hash");
  -[NSURL absoluteString](self->_contentURL, "absoluteString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8 ^ objc_msgSend(v9, "hash");
  v11 = v7 ^ v10 ^ -[NSString hash](self->_conversationID, "hash");
  -[NSURL absoluteString](self->_conversationURL, "absoluteString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11 ^ objc_msgSend(v12, "hash");

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  id v7;
  void *v8;
  NSString *childID;
  NSString *v10;
  uint64_t v11;
  int v12;
  char v13;
  NSString *deviceID;
  NSString *v15;
  uint64_t v16;
  int v17;
  NSString *sourceBundleID;
  NSString *v19;
  uint64_t v20;
  uint64_t v21;
  NSString *v22;
  void *v23;
  double absoluteTimestamp;
  double v25;
  unint64_t eventDirection;
  unint64_t eventType;
  unint64_t contentType;
  NSArray *contactHandles;
  uint64_t v30;
  NSString *contentID;
  uint64_t v33;
  NSString *conversationID;
  uint64_t v35;
  NSString *senderHandle;
  uint64_t v37;
  NSURL *contentURL;
  void *v39;
  NSURL *conversationURL;
  NSURL *v41;
  uint64_t v42;
  void *v43;
  NSURL *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  int v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  NSURL *v58;
  void *v59;
  void *v60;
  NSString *v61;
  int v62;
  void *v63;
  void *v64;
  NSString *v65;
  int v66;
  void *v67;
  void *v68;
  NSString *v69;
  int v70;
  void *v71;
  NSArray *v72;
  void *v73;
  void *v74;
  int v75;
  void *v76;
  int v77;
  void *v78;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v13 = 0;
    goto LABEL_45;
  }
  v7 = v6;
  v8 = v7;
  childID = self->_childID;
  v10 = childID;
  if (!childID)
  {
    objc_msgSend(v7, "childID");
    v11 = objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v78 = 0;
      v12 = 0;
      goto LABEL_10;
    }
    v78 = (void *)v11;
    v10 = self->_childID;
  }
  objc_msgSend(v8, "childID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString isEqualToString:](v10, "isEqualToString:", v3))
  {

    v13 = 0;
    goto LABEL_42;
  }
  v12 = 1;
LABEL_10:
  deviceID = self->_deviceID;
  v15 = deviceID;
  if (!deviceID)
  {
    objc_msgSend(v8, "deviceID");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      v17 = v12;
      v76 = 0;
      v77 = 0;
      goto LABEL_17;
    }
    v76 = (void *)v16;
    v15 = self->_deviceID;
  }
  objc_msgSend(v8, "deviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString isEqualToString:](v15, "isEqualToString:", v4))
  {

    v13 = 0;
    goto LABEL_39;
  }
  v17 = v12;
  v77 = 1;
LABEL_17:
  sourceBundleID = self->_sourceBundleID;
  v19 = sourceBundleID;
  if (!sourceBundleID)
  {
    objc_msgSend(v8, "sourceBundleID");
    v20 = objc_claimAutoreleasedReturnValue();
    if (!v20)
    {
      v74 = 0;
      v75 = 0;
      goto LABEL_24;
    }
    v74 = (void *)v20;
    v19 = self->_sourceBundleID;
  }
  objc_msgSend(v8, "sourceBundleID");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v19;
  v23 = (void *)v21;
  if (!-[NSString isEqualToString:](v22, "isEqualToString:", v21))
  {

    v13 = 0;
    v12 = v17;
    goto LABEL_36;
  }
  v73 = v23;
  v75 = 1;
LABEL_24:
  absoluteTimestamp = self->_absoluteTimestamp;
  objc_msgSend(v8, "absoluteTimestamp");
  if (absoluteTimestamp == v25)
  {
    eventDirection = self->_eventDirection;
    if (eventDirection == objc_msgSend(v8, "eventDirection"))
    {
      eventType = self->_eventType;
      if (eventType == objc_msgSend(v8, "eventType"))
      {
        contentType = self->_contentType;
        if (contentType == objc_msgSend(v8, "contentType"))
        {
          contactHandles = self->_contactHandles;
          v72 = contactHandles;
          if (!contactHandles)
          {
            objc_msgSend(v8, "contactHandles");
            v30 = objc_claimAutoreleasedReturnValue();
            if (!v30)
            {
              v67 = 0;
              v70 = 0;
              goto LABEL_52;
            }
            v67 = (void *)v30;
            contactHandles = self->_contactHandles;
          }
          objc_msgSend(v8, "contactHandles");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[NSArray isEqual:](contactHandles, "isEqual:"))
          {
            v13 = 0;
            v12 = v17;
            goto LABEL_100;
          }
          v70 = 1;
LABEL_52:
          contentID = self->_contentID;
          v69 = contentID;
          if (!contentID)
          {
            objc_msgSend(v8, "contentID");
            v33 = objc_claimAutoreleasedReturnValue();
            if (!v33)
            {
              v63 = 0;
              v66 = 0;
              goto LABEL_59;
            }
            v63 = (void *)v33;
            contentID = self->_contentID;
          }
          objc_msgSend(v8, "contentID");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[NSString isEqualToString:](contentID, "isEqualToString:"))
          {
            v13 = 0;
            v12 = v17;
            goto LABEL_97;
          }
          v66 = 1;
LABEL_59:
          conversationID = self->_conversationID;
          v65 = conversationID;
          if (!conversationID)
          {
            objc_msgSend(v8, "conversationID");
            v35 = objc_claimAutoreleasedReturnValue();
            if (!v35)
            {
              v59 = 0;
              v62 = 0;
              goto LABEL_66;
            }
            v59 = (void *)v35;
            conversationID = self->_conversationID;
          }
          objc_msgSend(v8, "conversationID");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[NSString isEqualToString:](conversationID, "isEqualToString:"))
          {
            v13 = 0;
            v12 = v17;
            goto LABEL_94;
          }
          v62 = 1;
LABEL_66:
          senderHandle = self->_senderHandle;
          v61 = senderHandle;
          if (!senderHandle)
          {
            objc_msgSend(v8, "senderHandle");
            v37 = objc_claimAutoreleasedReturnValue();
            if (!v37)
            {
              v53 = 0;
              v57 = 0;
              goto LABEL_73;
            }
            v53 = (void *)v37;
            senderHandle = self->_senderHandle;
          }
          objc_msgSend(v8, "senderHandle");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[NSString isEqualToString:](senderHandle, "isEqualToString:"))
          {
            v13 = 0;
            v12 = v17;
            goto LABEL_91;
          }
          v57 = 1;
LABEL_73:
          v12 = v17;
          contentURL = self->_contentURL;
          v58 = contentURL;
          if (!contentURL)
          {
            objc_msgSend(v8, "contentURL");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v48)
            {
              v48 = 0;
              v52 = 0;
              goto LABEL_80;
            }
            contentURL = self->_contentURL;
          }
          -[NSURL absoluteString](contentURL, "absoluteString");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "contentURL");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "absoluteString");
          v56 = v39;
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v39, "isEqualToString:"))
          {
            v13 = 0;
            goto LABEL_89;
          }
          v52 = 1;
LABEL_80:
          v51 = v12;
          conversationURL = self->_conversationURL;
          v41 = conversationURL;
          if (!conversationURL)
          {
            objc_msgSend(v8, "conversationURL");
            v42 = objc_claimAutoreleasedReturnValue();
            if (!v42)
            {
              v45 = 0;
              v13 = 1;
              goto LABEL_88;
            }
            v46 = v42;
            v41 = self->_conversationURL;
          }
          -[NSURL absoluteString](v41, "absoluteString", v46, v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "conversationURL");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "absoluteString");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v49, "isEqualToString:", v43);

          if (conversationURL)
          {
            v12 = v51;
            if (!v52)
            {
              v44 = v58;
              goto LABEL_111;
            }
            goto LABEL_89;
          }
          v12 = v51;
          v45 = v47;
LABEL_88:

          v44 = v58;
          if ((v52 & 1) == 0)
          {
LABEL_111:
            if (!v44)
            {
LABEL_112:

              if ((v57 & 1) == 0)
              {
LABEL_92:
                if (v61)
                {
                  if (!v62)
                    goto LABEL_95;
                }
                else
                {

                  if ((v62 & 1) == 0)
                  {
LABEL_95:
                    if (v65)
                    {
                      if (!v66)
                        goto LABEL_98;
                    }
                    else
                    {

                      if ((v66 & 1) == 0)
                      {
LABEL_98:
                        if (v69)
                        {
                          if (!v70)
                          {
LABEL_101:
                            if (v72)
                            {
                              if (!v75)
                                goto LABEL_36;
                              goto LABEL_35;
                            }

                            goto LABEL_34;
                          }
                        }
                        else
                        {

                          if ((v70 & 1) == 0)
                            goto LABEL_101;
                        }
LABEL_100:

                        goto LABEL_101;
                      }
                    }
LABEL_97:

                    goto LABEL_98;
                  }
                }
LABEL_94:

                goto LABEL_95;
              }
LABEL_91:

              goto LABEL_92;
            }
LABEL_90:
            if (!v57)
              goto LABEL_92;
            goto LABEL_91;
          }
LABEL_89:

          if (!v58)
            goto LABEL_112;
          goto LABEL_90;
        }
      }
    }
  }
  v13 = 0;
  v12 = v17;
LABEL_34:
  if ((v75 & 1) != 0)
LABEL_35:

LABEL_36:
  if (!sourceBundleID)
  {

    if ((v77 & 1) == 0)
      goto LABEL_39;
    goto LABEL_38;
  }
  if (v77)
LABEL_38:

LABEL_39:
  if (!deviceID)
  {

    if ((v12 & 1) == 0)
      goto LABEL_42;
    goto LABEL_41;
  }
  if (v12)
LABEL_41:

LABEL_42:
  if (!childID)

LABEL_45:
  return v13;
}

- (BOOL)isCompleteWithContext:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)isValidWithContext:(id)a3 error:(id *)a4
{
  return 1;
}

- (double)absoluteTimestamp
{
  return self->_absoluteTimestamp;
}

- (NSString)childID
{
  return self->_childID;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (NSString)sourceBundleID
{
  return self->_sourceBundleID;
}

- (unint64_t)eventDirection
{
  return self->_eventDirection;
}

- (void)setEventDirection:(unint64_t)a3
{
  self->_eventDirection = a3;
}

- (unint64_t)eventType
{
  return self->_eventType;
}

- (void)setEventType:(unint64_t)a3
{
  self->_eventType = a3;
}

- (unint64_t)contentType
{
  return self->_contentType;
}

- (void)setContentType:(unint64_t)a3
{
  self->_contentType = a3;
}

- (unsigned)contentCount
{
  return self->_contentCount;
}

- (void)setContentCount:(unsigned int)a3
{
  self->_contentCount = a3;
}

- (NSArray)contactHandles
{
  return self->_contactHandles;
}

- (NSString)contentID
{
  return self->_contentID;
}

- (NSString)conversationID
{
  return self->_conversationID;
}

- (NSString)senderHandle
{
  return self->_senderHandle;
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (NSURL)conversationURL
{
  return self->_conversationURL;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_conversationURL, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);
  objc_storeStrong((id *)&self->_senderHandle, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
  objc_storeStrong((id *)&self->_contactHandles, 0);
  objc_storeStrong((id *)&self->_sourceBundleID, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_storeStrong((id *)&self->_childID, 0);
}

+ (void)eventWithData:dataVersion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_4(&dword_18D810000, v0, v1, "BMCommunicationSafetyResultEvent: Mismatched data versions (%u != %u) cannot deserialize", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5();
}

- (void)json
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_10();
  _os_log_error_impl(&dword_18D810000, v0, OS_LOG_TYPE_ERROR, "BMCommunicationSafetyResultEvent: Unable to create json from object: %@", v1, 0xCu);
  OUTLINED_FUNCTION_5();
}

- (void)initWithProto:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_2();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v1, v2, "BMCommunicationSafetyResultEvent: unable to convert BMPBCommunicationSafetyResultContentType enum value: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_0();
}

- (void)initWithProto:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_2();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v1, v2, "BMCommunicationSafetyResultEvent: unable to convert BMPBCommunicationSafetyResultEventType enum value: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_0();
}

- (void)initWithProto:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4_2();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v1, v2, "BMCommunicationSafetyResultEvent: unable to convert BMPBCommunicationSafetyResultEventDirection enum value: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_0();
}

- (void)initWithProto:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_18D810000, a1, a3, "BMCommunicationSafetyResultEvent: tried to initialize with a non-BMCommunicationSafetyResultEvent proto", a5, a6, a7, a8, 0);
}

- (void)proto
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v2, v3, "BMCommunicationSafetyResultEvent: unable to convert BMCommunicationSafetyResultEventDirection enum value: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0_0();
}

@end
