@implementation BLSBacklightChangeRequest

- (BLSBacklightChangeRequest)initWithRequestedActivityState:(int64_t)a3 explanation:(id)a4 timestamp:(unint64_t)a5 sourceEvent:(int64_t)a6 sourceEventMetadata:(id)a7
{
  id v12;
  id v13;
  BLSBacklightChangeRequest *v14;
  BLSBacklightChangeRequest *v15;
  uint64_t v16;
  NSString *explanation;
  objc_super v19;

  v12 = a4;
  v13 = a7;
  v19.receiver = self;
  v19.super_class = (Class)BLSBacklightChangeRequest;
  v14 = -[BLSBacklightChangeRequest init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_requestedActivityState = a3;
    v14->_timestamp = a5;
    v16 = objc_msgSend(v12, "copy");
    explanation = v15->_explanation;
    v15->_explanation = (NSString *)v16;

    v15->_sourceEvent = a6;
    objc_storeStrong((id *)&v15->_sourceEventMetadata, a7);
  }

  return v15;
}

- (NSString)description
{
  void *v3;
  void *v4;
  int64_t requestedActivityState;
  const __CFString *v6;
  const __CFString *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  requestedActivityState = self->_requestedActivityState;
  v6 = CFSTR("Off/Inactive");
  if (requestedActivityState == 1)
    v6 = CFSTR("On/Active");
  if (requestedActivityState == 2)
    v7 = CFSTR("Dimmed");
  else
    v7 = v6;
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("requestedState"));
  objc_msgSend(v4, "appendString:withName:", self->_explanation, CFSTR("explanation"));
  v8 = (id)objc_msgSend(v4, "appendUInt64:withName:", self->_timestamp, CFSTR("timestamp"));
  NSStringFromBLSBacklightChangeSourceEvent(self->_sourceEvent);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v9, CFSTR("source"));

  v10 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", self->_sourceEventMetadata, CFSTR("metadata"), 1);
  objc_msgSend(v4, "build");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  unint64_t v10;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", self->_requestedActivityState);
  v5 = (id)objc_msgSend(v3, "appendString:", self->_explanation);
  v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:", self->_timestamp);
  v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:", HIDWORD(self->_timestamp));
  v8 = (id)objc_msgSend(v3, "appendInteger:", self->_sourceEvent);
  v9 = (id)objc_msgSend(v3, "appendObject:", self->_sourceEventMetadata);
  v10 = objc_msgSend(v3, "hash");

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  BLSBacklightChangeRequest *v4;
  BLSBacklightChangeRequest *v5;
  int64_t requestedActivityState;
  unint64_t timestamp;
  int64_t sourceEvent;
  void *explanation;
  void *v10;
  BLSBacklightChangeSourceEventMetadata *sourceEventMetadata;
  BLSBacklightChangeSourceEventMetadata *v12;
  void *v13;
  char v14;

  v4 = (BLSBacklightChangeRequest *)a3;
  if (v4 == self)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      requestedActivityState = self->_requestedActivityState;
      if (requestedActivityState != -[BLSBacklightChangeRequest requestedActivityState](v5, "requestedActivityState")
        || (timestamp = self->_timestamp, timestamp != -[BLSBacklightChangeRequest timestamp](v5, "timestamp"))
        || (sourceEvent = self->_sourceEvent, sourceEvent != -[BLSBacklightChangeRequest sourceEvent](v5, "sourceEvent")))
      {
        v14 = 0;
LABEL_15:

        goto LABEL_16;
      }
      explanation = self->_explanation;
      -[BLSBacklightChangeRequest explanation](v5, "explanation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(explanation, "isEqual:", v10))
      {
        sourceEventMetadata = self->_sourceEventMetadata;
        v12 = sourceEventMetadata;
        if (!sourceEventMetadata)
        {
          -[BLSBacklightChangeRequest sourceEventMetadata](v5, "sourceEventMetadata");
          explanation = (void *)objc_claimAutoreleasedReturnValue();
          if (!explanation)
          {
            v14 = 1;
LABEL_19:

            goto LABEL_20;
          }
          v12 = self->_sourceEventMetadata;
        }
        -[BLSBacklightChangeRequest sourceEventMetadata](v5, "sourceEventMetadata");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[BLSBacklightChangeSourceEventMetadata isEqual:](v12, "isEqual:", v13);

        if (!sourceEventMetadata)
          goto LABEL_19;
      }
      else
      {
        v14 = 0;
      }
LABEL_20:

      goto LABEL_15;
    }
    v14 = 0;
  }
LABEL_16:

  return v14;
}

- (BLSBacklightChangeRequest)initWithXPCDictionary:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  int64_t int64;
  const char *string;
  __CFString *v12;
  NSObject *v13;
  int64_t v14;
  int64_t v15;
  const char *v16;
  const char *v17;
  void *v18;
  NSString *v19;
  Class v20;
  objc_class *v21;
  int64_t v22;
  NSString *v23;
  int64_t v24;
  BLSBacklightChangeRequest *v25;
  void *v26;
  int v27;
  void *v28;
  NSObject *v29;
  BLSBacklightChangeRequest *v30;
  int64_t v32;

  v4 = a3;
  v5 = (const char *)objc_msgSend(CFSTR("requestedState"), "UTF8String");
  v6 = (const char *)objc_msgSend(CFSTR("explanation"), "UTF8String");
  v7 = (const char *)objc_msgSend(CFSTR("timestamp"), "UTF8String");
  v8 = (const char *)objc_msgSend(CFSTR("source"), "UTF8String");
  v9 = (const char *)objc_msgSend(CFSTR("metadata"), "UTF8String");
  int64 = xpc_dictionary_get_int64(v4, v5);
  string = xpc_dictionary_get_string(v4, v6);
  if (string)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    bls_backlight_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[BLSBacklightChangeRequest initWithXPCDictionary:].cold.2((uint64_t)v4, v13);

    v12 = CFSTR("<NULL>");
  }
  v14 = xpc_dictionary_get_int64(v4, v7);
  v15 = xpc_dictionary_get_int64(v4, v8);
  v16 = xpc_dictionary_get_string(v4, "metadataClass");
  if (v16)
  {
    v17 = v16;
    xpc_dictionary_get_dictionary(v4, v9);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
      v19 = (NSString *)objc_claimAutoreleasedReturnValue();
      v20 = NSClassFromString(v19);
      if (!v20)
        goto LABEL_12;
      v21 = v20;
      +[BLSBacklightChangeRequest validMetadataClasses]();
      v32 = v15;
      v22 = v14;
      v23 = v19;
      v24 = int64;
      v25 = self;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "containsObject:", v21);

      self = v25;
      int64 = v24;
      v19 = v23;
      v14 = v22;
      v15 = v32;
      if (v27)
      {
        v28 = (void *)objc_msgSend([v21 alloc], "initWithXPCDictionary:", v18);
      }
      else
      {
LABEL_12:
        bls_backlight_log();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
          -[BLSBacklightChangeRequest initWithXPCDictionary:].cold.1((uint64_t)v19, (uint64_t)v18, v29);

        v28 = 0;
      }

    }
    else
    {
      v28 = 0;
    }

  }
  else
  {
    v28 = 0;
  }
  v30 = -[BLSBacklightChangeRequest initWithRequestedActivityState:explanation:timestamp:sourceEvent:sourceEventMetadata:](self, "initWithRequestedActivityState:explanation:timestamp:sourceEvent:sourceEventMetadata:", int64, v12, v14, v15, v28);

  return v30;
}

+ (id)validMetadataClasses
{
  objc_opt_self();
  if (validMetadataClasses_onceToken != -1)
    dispatch_once(&validMetadataClasses_onceToken, &__block_literal_global_8);
  return (id)validMetadataClasses_metaDataClasses;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  BLSBacklightChangeSourceEventMetadata **p_sourceEventMetadata;
  void *v11;
  int v12;
  objc_class *v13;
  id v14;
  xpc_object_t v15;
  NSObject *v16;

  v4 = a3;
  v5 = (const char *)objc_msgSend(CFSTR("requestedState"), "UTF8String");
  v6 = (const char *)objc_msgSend(CFSTR("explanation"), "UTF8String");
  v7 = (const char *)objc_msgSend(CFSTR("timestamp"), "UTF8String");
  v8 = (const char *)objc_msgSend(CFSTR("source"), "UTF8String");
  v9 = (const char *)objc_msgSend(CFSTR("metadata"), "UTF8String");
  xpc_dictionary_set_int64(v4, v5, self->_requestedActivityState);
  xpc_dictionary_set_string(v4, v6, -[NSString UTF8String](self->_explanation, "UTF8String"));
  xpc_dictionary_set_int64(v4, v7, self->_timestamp);
  xpc_dictionary_set_int64(v4, v8, self->_sourceEvent);
  p_sourceEventMetadata = &self->_sourceEventMetadata;
  if (self->_sourceEventMetadata)
  {
    +[BLSBacklightChangeRequest validMetadataClasses]();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", objc_opt_class());

    if (v12)
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      xpc_dictionary_set_string(v4, "metadataClass", (const char *)objc_msgSend(v14, "UTF8String"));
      v15 = xpc_dictionary_create(0, 0, 0);
      -[BLSBacklightChangeSourceEventMetadata encodeWithXPCDictionary:](*p_sourceEventMetadata, "encodeWithXPCDictionary:", v15);
      xpc_dictionary_set_value(v4, v9, v15);

    }
    else
    {
      bls_backlight_log();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        -[BLSBacklightChangeRequest encodeWithXPCDictionary:].cold.1((uint64_t)self, (uint64_t *)&self->_sourceEventMetadata, v16);

    }
  }

}

void __49__BLSBacklightChangeRequest_validMetadataClasses__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)validMetadataClasses_metaDataClasses;
  validMetadataClasses_metaDataClasses = v2;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSBacklightChangeRequest)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BLSBacklightChangeRequest *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("requestedState"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("explanation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("timestamp"));
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("source"));
  +[BLSBacklightChangeRequest validMetadataClasses]();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("metadata"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[BLSBacklightChangeRequest initWithRequestedActivityState:explanation:timestamp:sourceEvent:sourceEventMetadata:](self, "initWithRequestedActivityState:explanation:timestamp:sourceEvent:sourceEventMetadata:", v5, v6, v7, v8, v10);
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", self->_requestedActivityState, CFSTR("requestedState"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_explanation, CFSTR("explanation"));
  objc_msgSend(v6, "encodeInt64:forKey:", self->_timestamp, CFSTR("timestamp"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_sourceEvent, CFSTR("source"));
  +[BLSBacklightChangeRequest validMetadataClasses]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", objc_opt_class());

  if (v5)
    objc_msgSend(v6, "encodeObject:forKey:", self->_sourceEventMetadata, CFSTR("metadata"));

}

- (int64_t)requestedActivityState
{
  return self->_requestedActivityState;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int64_t)sourceEvent
{
  return self->_sourceEvent;
}

- (BLSBacklightChangeSourceEventMetadata)sourceEventMetadata
{
  return self->_sourceEventMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceEventMetadata, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
}

- (void)initWithXPCDictionary:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl(&dword_1B0C75000, log, OS_LOG_TYPE_FAULT, "unknown %@ class cannot init with %@", (uint8_t *)&v3, 0x16u);
}

- (void)initWithXPCDictionary:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1B0C75000, a2, OS_LOG_TYPE_FAULT, "failed to decode explanation from %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)encodeWithXPCDictionary:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  objc_class *v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *a2;
  v9 = 134218498;
  v10 = a1;
  v11 = 2114;
  v12 = v7;
  v13 = 2114;
  v14 = v8;
  _os_log_fault_impl(&dword_1B0C75000, a3, OS_LOG_TYPE_FAULT, "%p unknown class:%{public}@ cannot encode %{public}@", (uint8_t *)&v9, 0x20u);

}

@end
