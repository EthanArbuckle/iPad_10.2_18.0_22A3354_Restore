@implementation EMBiomeEvent

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __19__EMBiomeEvent_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_3 != -1)
    dispatch_once(&log_onceToken_3, block);
  return (OS_os_log *)(id)log_log_3;
}

void __19__EMBiomeEvent_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_3;
  log_log_3 = (uint64_t)v1;

}

- (EMBiomeEvent)initWithEventName:(id)a3 messageId:(id)a4 payload:(id)a5
{
  id v8;
  id v9;
  id v10;
  EMBiomeEvent *v11;
  uint64_t v12;
  NSString *eventName;
  uint64_t v14;
  NSString *messageId;
  uint64_t v16;
  NSDictionary *payload;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)EMBiomeEvent;
  v11 = -[EMBiomeEvent init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    eventName = v11->_eventName;
    v11->_eventName = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    messageId = v11->_messageId;
    v11->_messageId = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    payload = v11->_payload;
    v11->_payload = (NSDictionary *)v16;

  }
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[EMBiomeEvent eventName](self, "eventName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("EFPropertyKey_eventName"));

  -[EMBiomeEvent messageId](self, "messageId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("EFPropertyKey_messageId"));

  -[EMBiomeEvent payload](self, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("EFPropertyKey_payload"));

}

- (EMBiomeEvent)initWithCoder:(id)a3
{
  id v4;
  EMBiomeEvent *v5;
  uint64_t v6;
  NSString *eventName;
  uint64_t v8;
  NSString *messageId;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSDictionary *payload;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EMBiomeEvent;
  v5 = -[EMBiomeEvent init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_eventName"));
    v6 = objc_claimAutoreleasedReturnValue();
    eventName = v5->_eventName;
    v5->_eventName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("EFPropertyKey_messageId"));
    v8 = objc_claimAutoreleasedReturnValue();
    messageId = v5->_messageId;
    v5->_messageId = (NSString *)v8;

    v10 = (void *)MEMORY[0x1E0C99E60];
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("EFPropertyKey_payload"));
    v15 = objc_claimAutoreleasedReturnValue();
    payload = v5->_payload;
    v5->_payload = (NSDictionary *)v15;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v16;

  v4 = a3;
  v16 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v16;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    +[EMBiomeEvent log](EMBiomeEvent, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[EMBiomeEvent eventWithData:dataVersion:].cold.1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

  }
  return v5;
}

- (id)serialize
{
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v13;

  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v13);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v13;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    +[EMBiomeEvent log](EMBiomeEvent, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[EMBiomeEvent serialize].cold.1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

  }
  return v2;
}

- (id)json
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v21[0] = CFSTR("eventName");
  -[EMBiomeEvent eventName](self, "eventName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v3;
  v21[1] = CFSTR("messageId");
  -[EMBiomeEvent messageId](self, "messageId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[1] = v5;
  v21[2] = CFSTR("payload");
  -[EMBiomeEvent payload](self, "payload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)

  if (!v4)
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v8, 1, &v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v20;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    +[EMBiomeEvent log](EMBiomeEvent, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[EMBiomeEvent json].cold.1((uint64_t)v10, v12, v13, v14, v15, v16, v17, v18);

  }
  return v9;
}

- (NSString)eventName
{
  return self->_eventName;
}

- (NSString)messageId
{
  return self->_messageId;
}

- (NSDictionary)payload
{
  return self->_payload;
}

- (unsigned)dataVersion
{
  return self->_dataVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_messageId, 0);
  objc_storeStrong((id *)&self->_eventName, 0);
}

+ (void)eventWithData:(uint64_t)a3 dataVersion:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1B99BB000, a2, a3, "ERROR unarchiving Biome event: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)serialize
{
  OUTLINED_FUNCTION_0_1(&dword_1B99BB000, a2, a3, "ERROR serializing Biome event: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)json
{
  OUTLINED_FUNCTION_0_1(&dword_1B99BB000, a2, a3, "ERROR extracting json: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
