@implementation GEORequestResponsePersistedEvent

- (GEORRRequestResponseEvent)rrEvent
{
  GEORRRequestResponseEvent *event;
  NSURL *eventFileURL;
  void *v6;
  id v7;
  GEORRRequestResponseEvent *v8;
  GEORRRequestResponseEvent *v9;
  NSURL *v10;
  id v11;

  event = self->_event;
  if (!event)
  {
    eventFileURL = self->_eventFileURL;
    if (eventFileURL)
    {
      v11 = 0;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", eventFileURL, 0, &v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v11;
      if (!v6)
      {
        v10 = self->_eventFileURL;
        self->_eventFileURL = 0;

        return (GEORRRequestResponseEvent *)0;
      }
      v8 = -[GEORRRequestResponseEvent initWithData:]([GEORRRequestResponseEvent alloc], "initWithData:", v6);
      v9 = self->_event;
      self->_event = v8;

      event = self->_event;
    }
    else
    {
      event = 0;
    }
  }
  return event;
}

- (NSData)rawMessage
{
  void *v2;
  void *v3;

  -[GEORequestResponsePersistedEvent rrEvent](self, "rrEvent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "encoded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (PBCodable)decodedMessage
{
  PBCodable *decodedMessage;
  void *v4;
  PBCodable *v5;
  PBCodable *v6;

  decodedMessage = self->_decodedMessage;
  if (!decodedMessage)
  {
    -[GEORequestResponsePersistedEvent rrEvent](self, "rrEvent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeEvent");
    v5 = (PBCodable *)objc_claimAutoreleasedReturnValue();
    v6 = self->_decodedMessage;
    self->_decodedMessage = v5;

    decodedMessage = self->_decodedMessage;
  }
  return decodedMessage;
}

+ (id)enumeratorBlockHelper:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__GEORequestResponsePersistedEvent_enumeratorBlockHelper___block_invoke;
  v7[3] = &unk_1E1C12C30;
  v8 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x18D765024](v7);

  return v5;
}

uint64_t __58__GEORequestResponsePersistedEvent_enumeratorBlockHelper___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4, void *a5, void *a6, unint64_t a7, void *a8, void *a9)
{
  id v17;
  NSURL *v18;
  NSString *v19;
  GEORequestResponsePersistedEvent *v20;
  uint64_t v21;
  NSDate *timestamp;
  int v23;
  uint64_t v24;
  NSURL *serviceURL;
  NSURL *eventFileURL;
  NSURL *v27;
  NSString *errorMessage;
  NSString *v29;
  uint64_t v30;
  id v32;
  id v33;

  v33 = a4;
  v32 = a5;
  v17 = a6;
  v18 = a8;
  v19 = a9;
  v20 = objc_alloc_init(GEORequestResponsePersistedEvent);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)a2);
  v21 = objc_claimAutoreleasedReturnValue();
  timestamp = v20->_timestamp;
  v20->_timestamp = (NSDate *)v21;

  if (v17)
    v23 = 1;
  else
    v23 = 2;
  v20->_eventType = v23;
  v20->_messageType = a3;
  objc_storeStrong((id *)&v20->_appId, a4);
  objc_storeStrong((id *)&v20->_identifier, a5);
  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v17, v32, v33);
    v24 = objc_claimAutoreleasedReturnValue();
    serviceURL = v20->_serviceURL;
    v20->_serviceURL = (NSURL *)v24;
  }
  else
  {
    serviceURL = v20->_serviceURL;
    v20->_serviceURL = 0;
  }

  eventFileURL = v20->_eventFileURL;
  v20->_size = a7;
  v20->_eventFileURL = v18;
  v27 = v18;

  errorMessage = v20->_errorMessage;
  v20->_errorMessage = v19;
  v29 = v19;

  v30 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return v30;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (int)eventType
{
  return self->_eventType;
}

- (int)messageType
{
  return self->_messageType;
}

- (NSString)appId
{
  return self->_appId;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)serviceURL
{
  return self->_serviceURL;
}

- (unint64_t)size
{
  return self->_size;
}

- (NSURL)eventFileURL
{
  return self->_eventFileURL;
}

- (NSString)errorMessage
{
  return self->_errorMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorMessage, 0);
  objc_storeStrong((id *)&self->_eventFileURL, 0);
  objc_storeStrong((id *)&self->_serviceURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_appId, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_decodedMessage, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
