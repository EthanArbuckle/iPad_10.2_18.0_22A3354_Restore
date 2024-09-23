@implementation BMCommunicationSafetyResultEvent_v2

- (BMCommunicationSafetyResultEvent_v2)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  double v6;
  double v7;
  unsigned int v8;
  uint64_t v9;
  BMCommunicationSafetyResultEvent_v2 *v10;
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
  BMCommunicationSafetyResultEvent_v2 *v44;

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
      if (v8 >= 4)
      {
        __biome_log_for_category();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[BMCommunicationSafetyResultEvent_v2 initWithProto:].cold.3();

        v9 = 2;
      }
      else
      {
        v9 = qword_18DC0B7C0[v8];
      }
      v40 = v9;
      v19 = -[NSObject communicationSafetyResultEventType](v5, "communicationSafetyResultEventType");
      if (v19 >= 5)
      {
        __biome_log_for_category();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[BMCommunicationSafetyResultEvent_v2 initWithProto:].cold.2();

        v20 = 4;
      }
      else
      {
        v20 = qword_18DC0B7E0[v19];
      }
      v39 = v20;
      v22 = -[NSObject communicationSafetyResultContentType](v5, "communicationSafetyResultContentType");
      v44 = self;
      if (v22 >= 4)
      {
        __biome_log_for_category();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          -[BMCommunicationSafetyResultEvent_v2 initWithProto:].cold.1();

        v23 = 3;
      }
      else
      {
        v23 = qword_18DC0B808[v22];
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
      self = -[BMCommunicationSafetyResultEvent initWithChildID:deviceID:sourceBundleID:absoluteTimeStamp:eventDirection:eventType:contentType:contactHandles:contentID:conversationID:imageData:senderHandle:contentURL:conversationURL:](v44, "initWithChildID:deviceID:sourceBundleID:absoluteTimeStamp:eventDirection:eventType:contentType:contactHandles:contentID:conversationID:imageData:senderHandle:contentURL:conversationURL:", v43, v42, v41, v40, v39, v37, v7, v35, v34, v33, v25, v26, v28, v31);

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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v1, v2, "BMCommunicationSafetyResultEvent: unable to convert BMPBCommunicationSafetyResultContentType v2 enum value: %@", v3, v4, v5, v6, v7);

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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v1, v2, "BMCommunicationSafetyResultEvent: unable to convert BMPBCommunicationSafetyResultEventType v2 enum value: %@", v3, v4, v5, v6, v7);

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
  OUTLINED_FUNCTION_1_5(&dword_18D810000, v1, v2, "BMCommunicationSafetyResultEvent: unable to convert BMPBCommunicationSafetyResultEventDirection v2 enum value: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_0_0();
}

@end
