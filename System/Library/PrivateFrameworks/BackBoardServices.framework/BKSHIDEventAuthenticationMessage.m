@implementation BKSHIDEventAuthenticationMessage

- (BKSHIDEventAuthenticationMessage)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDEventAuthenticationMessage *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSHIDEventAuthenticationMessage *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot allocate one of these"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("BKSHIDEventAuthenticationMessage.m");
    v17 = 1024;
    v18 = 111;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDEventAuthenticationMessage *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (NSString)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  BKSHIDEventAuthenticationMessage *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __47__BKSHIDEventAuthenticationMessage_description__block_invoke;
  v10 = &unk_1E1EA1BF8;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && self->_eventType == v4[4]
    && self->_targetSlotID == v4[5]
    && self->_targetContextID == v4[6]
    && BSEqualObjects()
    && BSEqualObjects()
    && self->_timestamp == *((_QWORD *)v4 + 6)
    && self->_context == *((_QWORD *)v4 + 8)
    && self->_secureNameStatus == *((_QWORD *)v4 + 9)
    && self->_registrantEntitled == *((unsigned __int8 *)v4 + 80)
    && self->_versionedPID == *((_QWORD *)v4 + 1)
    && self->_originIdentifier == *((_QWORD *)v4 + 7);

  return v5;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  unint64_t originIdentifier;
  const __CFString *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v16 = a3;
  originIdentifier = self->_originIdentifier;
  if (originIdentifier == 0xC181BADB23D8497BLL)
  {
    v5 = CFSTR("originIdentifier (backboardd)");
    v6 = v16;
    originIdentifier = 0xC181BADB23D8497BLL;
  }
  else
  {
    v5 = CFSTR("originIdentifier");
    v6 = v16;
  }
  v7 = (id)objc_msgSend(v6, "appendUInt64:withName:format:", originIdentifier, v5, 1);
  v8 = (id)objc_msgSend(v16, "appendUInt64:withName:format:", self->_context, CFSTR("context"), 1);
  NSStringFromBSVersionedPID();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendString:withName:", v9, CFSTR("pid"));

  NSStringFromBKSHIDEventSecureNameStatus(self->_secureNameStatus);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "appendString:withName:", v10, CFSTR("secureNameStatus"));

  v11 = (id)objc_msgSend(v16, "appendBool:withName:", self->_registrantEntitled, CFSTR("registrantEntitled"));
  objc_msgSend(v16, "appendString:withName:", IOHIDEventTypeGetName(), CFSTR("eventType"));
  v12 = (id)objc_msgSend(v16, "appendUInt64:withName:format:", self->_targetSlotID, CFSTR("targetSlotID"), 1);
  v13 = (id)objc_msgSend(v16, "appendUInt64:withName:format:", self->_targetContextID, CFSTR("targetContextID"), 1);
  v14 = (id)objc_msgSend(v16, "appendObject:withName:skipIfNil:", self->_hitTestInformationFromStartEvent, CFSTR("hitTestInformationFromStartEvent"), 1);
  v15 = (id)objc_msgSend(v16, "appendObject:withName:skipIfNil:", self->_hitTestInformationFromEndEvent, CFSTR("hitTestInformationFromEndEvent"), 1);

}

- (BKSHIDEventAuthenticationMessage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  BKSHIDEventAuthenticationMessage *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("self"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[BKSHIDEventAuthenticationMessage _protobufDecodedMessageFromData:]((uint64_t)self, v5);
  v6 = (BKSHIDEventAuthenticationMessage *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BKSHIDEventAuthenticationMessage _dataProtobufEncoded]((uint64_t)self);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("self"));

}

- (BKSHIDEventAuthenticationMessage)initWithXPCDictionary:(id)a3
{
  void *v4;
  BKSHIDEventAuthenticationMessage *v5;

  BSDeserializeDataFromXPCDictionaryWithKey();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BKSHIDEventAuthenticationMessage _protobufDecodedMessageFromData:]((uint64_t)self, v4);
  v5 = (BKSHIDEventAuthenticationMessage *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BKSHIDEventAuthenticationMessage _dataProtobufEncoded]((uint64_t)self);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  BSSerializeDataToXPCDictionaryWithKey();

}

- (BKSHIDEventAuthenticationMessage)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  BKSHIDEventAuthenticationMessage *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("self"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[BKSHIDEventAuthenticationMessage _protobufDecodedMessageFromData:]((uint64_t)self, v5);
  v6 = (BKSHIDEventAuthenticationMessage *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BKSHIDEventAuthenticationMessage _dataProtobufEncoded]((uint64_t)self);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("self"));

}

- (int64_t)versionedPID
{
  return self->_versionedPID;
}

- (unsigned)eventType
{
  return self->_eventType;
}

- (unsigned)targetSlotID
{
  return self->_targetSlotID;
}

- (unsigned)targetContextID
{
  return self->_targetContextID;
}

- (BKSHIDEventHitTestLayerInformation)hitTestInformationFromStartEvent
{
  return self->_hitTestInformationFromStartEvent;
}

- (BKSHIDEventHitTestLayerInformation)hitTestInformationFromEndEvent
{
  return self->_hitTestInformationFromEndEvent;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)originIdentifier
{
  return self->_originIdentifier;
}

- (unint64_t)context
{
  return self->_context;
}

- (int64_t)secureNameStatus
{
  return self->_secureNameStatus;
}

- (BOOL)registrantEntitled
{
  return self->_registrantEntitled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_hitTestInformationFromEndEvent, 0);
  objc_storeStrong((id *)&self->_hitTestInformationFromStartEvent, 0);
}

- (id)_init
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = objc_opt_class();
    if (v2 != objc_opt_class())
    {
      v3 = objc_opt_class();
      if (v3 != objc_opt_class())
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BKSHIDEventAuthenticationMessage cannot be subclassed"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(sel__init);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = (objc_class *)objc_opt_class();
          NSStringFromClass(v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v10 = v5;
          v11 = 2114;
          v12 = v7;
          v13 = 2048;
          v14 = v1;
          v15 = 2114;
          v16 = CFSTR("BKSHIDEventAuthenticationMessage.m");
          v17 = 1024;
          v18 = 122;
          v19 = 2114;
          v20 = v4;
          _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18A132F20);
      }
    }
    v8.receiver = v1;
    v8.super_class = (Class)BKSHIDEventAuthenticationMessage;
    return objc_msgSendSuper2(&v8, sel_init);
  }
  return result;
}

- (id)_dataProtobufEncoded
{
  void *v2;
  id v3;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0D01838], "encodeObject:error:", a1, &v9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v9;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("auth message encode error: %@"), v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(sel__dataProtobufEncoded);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v11 = v6;
      v12 = 2114;
      v13 = v8;
      v14 = 2048;
      v15 = a1;
      v16 = 2114;
      v17 = CFSTR("BKSHIDEventAuthenticationMessage.m");
      v18 = 1024;
      v19 = 347;
      v20 = 2114;
      v21 = v5;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A13341CLL);
  }

  return v2;
}

- (id)_protobufDecodedMessageFromData:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  NSObject *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!a1)
  {
    v5 = 0;
    goto LABEL_11;
  }
  if (!v3)
  {
    BKLogEventDelivery();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18A0F0000, v6, OS_LOG_TYPE_ERROR, "auth message data decode failure", buf, 2u);
    }
    goto LABEL_9;
  }
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0D01838], "decodeObjectOfClass:fromData:error:", objc_opt_class(), v3, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (!v5)
  {
    BKLogEventDelivery();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v6;
      _os_log_error_impl(&dword_18A0F0000, v7, OS_LOG_TYPE_ERROR, "auth message protobuf decode failure: %{public}@", buf, 0xCu);
    }

LABEL_9:
    v5 = 0;
  }

LABEL_11:
  return v5;
}

uint64_t __47__BKSHIDEventAuthenticationMessage_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

+ (BKSHIDEventAuthenticationMessage)new
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDEventAuthenticationMessage *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot allocate one of these"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = a1;
    v15 = 2114;
    v16 = CFSTR("BKSHIDEventAuthenticationMessage.m");
    v17 = 1024;
    v18 = 116;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDEventAuthenticationMessage *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

+ (id)protobufSchema
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__BKSHIDEventAuthenticationMessage_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_6901 != -1)
    dispatch_once(&protobufSchema_onceToken_6901, block);
  return (id)protobufSchema_schema_6902;
}

void __50__BKSHIDEventAuthenticationMessage_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", *(_QWORD *)(a1 + 32), &__block_literal_global_6903);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)protobufSchema_schema_6902;
  protobufSchema_schema_6902 = v1;

}

void __50__BKSHIDEventAuthenticationMessage_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "addField:", "_signature");
  objc_msgSend(v2, "addField:", "_hitTestInformationFromStartEvent");
  objc_msgSend(v2, "addField:", "_hitTestInformationFromEndEvent");
  objc_msgSend(v2, "addField:", "_originIdentifier");
  objc_msgSend(v2, "addField:", "_timestamp");
  objc_msgSend(v2, "addField:", "_context");
  objc_msgSend(v2, "addField:", "_secureNameStatus");
  objc_msgSend(v2, "addField:", "_eventType");
  objc_msgSend(v2, "addField:", "_targetSlotID");
  objc_msgSend(v2, "addField:", "_targetContextID");
  objc_msgSend(v2, "addField:", "_versionedPID");
  objc_msgSend(v2, "addField:", "_registrantEntitled");

}

- (id)_calculateSignatureWithHMACContext:(uint64_t)a1
{
  id *v3;
  _BYTE macOut[32];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v3 = (id *)a1;
    CCHmacUpdate(ctx, (const void *)(a1 + 48), 8uLL);
    CCHmacUpdate(ctx, v3 + 8, 8uLL);
    CCHmacUpdate(ctx, v3 + 2, 4uLL);
    CCHmacUpdate(ctx, (char *)v3 + 20, 4uLL);
    CCHmacUpdate(ctx, v3 + 3, 4uLL);
    objc_msgSend(v3[4], "_updateCCHmacContext:", ctx);
    objc_msgSend(v3[5], "_updateCCHmacContext:", ctx);
    CCHmacUpdate(ctx, v3 + 1, 8uLL);
    CCHmacUpdate(ctx, v3 + 9, 8uLL);
    CCHmacUpdate(ctx, v3 + 10, 1uLL);
    CCHmacFinal(ctx, macOut);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", macOut, 32);
    a1 = objc_claimAutoreleasedReturnValue();
  }
  return (id)a1;
}

@end
