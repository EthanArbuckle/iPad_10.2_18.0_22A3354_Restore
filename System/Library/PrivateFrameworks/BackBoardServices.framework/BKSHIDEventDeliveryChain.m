@implementation BKSHIDEventDeliveryChain

- (BKSHIDEventDeliveryChain)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BKSHIDEventDeliveryChain *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  BKSHIDEventDeliveryChain *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot -init"));
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
    v16 = CFSTR("BKSHIDEventDeliveryChain.m");
    v17 = 1024;
    v18 = 25;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (BKSHIDEventDeliveryChain *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (BKSHIDEventDeliveryChain)initWithIdentity:(id)a3 compatibilityDisplay:(id)a4 path:(id)a5
{
  id v9;
  id v10;
  id v11;
  BKSHIDEventDeliveryChain *v12;
  BKSHIDEventDeliveryChain *v13;
  uint64_t v14;
  NSArray *deferringPath;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)BKSHIDEventDeliveryChain;
  v12 = -[BKSHIDEventDeliveryChain init](&v17, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identity, a3);
    v14 = objc_msgSend(v11, "copy");
    deferringPath = v13->_deferringPath;
    v13->_deferringPath = (NSArray *)v14;

    objc_storeStrong((id *)&v13->_compatibilityDisplay, a4);
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  BKSHIDEventDeliveryChain *v4;
  uint64_t v5;
  BKSHIDEventDeliveryChain *v6;
  BKSHIDEventDeliveryChain *v7;
  char v8;
  BKSHIDEventDeliveryChain *v9;

  v4 = (BKSHIDEventDeliveryChain *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v4;
    if (v5)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;
    }
    else
    {
      v7 = 0;
    }
    v9 = v7;

    if (v9 && BSEqualObjects() && BSEqualObjects())
      v8 = BSEqualObjects();
    else
      v8 = 0;

  }
  return v8;
}

- (unint64_t)hash
{
  return -[BKSEventDeferringChainIdentity hash](self->_identity, "hash");
}

- (id)_protobufDecodedFromData:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  NSObject *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    BKLogEventDelivery();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18A0F0000, v5, OS_LOG_TYPE_ERROR, "auth message data decode failure", buf, 2u);
    }
    goto LABEL_8;
  }
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0D01838], "decodeObjectOfClass:fromData:error:", objc_opt_class(), v3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (!v4)
  {
    BKLogEventDelivery();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v5;
      _os_log_error_impl(&dword_18A0F0000, v6, OS_LOG_TYPE_ERROR, "delivery chain protobuf decode failure: %{public}@", buf, 0xCu);
    }

LABEL_8:
    v4 = 0;
  }

  return v4;
}

- (id)_dataProtobufEncoded
{
  void *v4;
  id v5;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  BKSHIDEventDeliveryChain *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0D01838], "encodeObject:error:", self, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("delivery chain encode error: %@"), v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v13 = v8;
      v14 = 2114;
      v15 = v10;
      v16 = 2048;
      v17 = self;
      v18 = 2114;
      v19 = CFSTR("BKSHIDEventDeliveryChain.m");
      v20 = 1024;
      v21 = 84;
      v22 = 2114;
      v23 = v7;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A126594);
  }

  return v4;
}

- (BKSHIDEventDeliveryChain)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  BKSHIDEventDeliveryChain *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("self"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[BKSHIDEventDeliveryChain _protobufDecodedFromData:](self, "_protobufDecodedFromData:", v5);
  v6 = (BKSHIDEventDeliveryChain *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BKSHIDEventDeliveryChain _dataProtobufEncoded](self, "_dataProtobufEncoded");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("self"));

}

- (BKSHIDEventDeferringEnvironment)environment
{
  return -[BKSEventDeferringChainIdentity environment](self->_identity, "environment");
}

- (BKSHIDEventDisplay)display
{
  return -[BKSEventDeferringChainIdentity display](self->_identity, "display");
}

- (id)initForProtobufDecoding
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKSHIDEventDeliveryChain;
  return -[BKSHIDEventDeliveryChain init](&v3, sel_init);
}

- (id)didFinishProtobufDecodingWithError:(id *)a3
{
  BKSHIDEventDeliveryChain *v3;
  id v5;

  if (self->_identity)
  {
    v3 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 5, &unk_1E1EBC570);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v3 = 0;
    *a3 = v5;
  }
  return v3;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BKSHIDEventDeliveryChain *v9;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__BKSHIDEventDeliveryChain_appendDescriptionToFormatter___block_invoke;
  v7[3] = &unk_1E1EA1BF8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v6, "appendProem:block:", 0, v7);
  v5 = (id)objc_msgSend(v6, "appendObject:withName:", self->_deferringPath, 0);

}

- (NSArray)deferringPath
{
  return self->_deferringPath;
}

- (BKSEventDeferringChainIdentity)identity
{
  return self->_identity;
}

- (BKSHIDEventDisplay)compatibilityDisplay
{
  return self->_compatibilityDisplay;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferringPath, 0);
  objc_storeStrong((id *)&self->_compatibilityDisplay, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

void __57__BKSHIDEventDeliveryChain_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), 0);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v3 + 16);
  if (v4)
  {
    objc_msgSend(*(id *)(v3 + 8), "display");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "isEqual:", v5);

    if ((v6 & 1) == 0)
      v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16), CFSTR("compatibilityDisplay"));
  }
}

+ (id)new
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  id result;
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

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot +new"));
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
    v16 = CFSTR("BKSHIDEventDeliveryChain.m");
    v17 = 1024;
    v18 = 30;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (id)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)protobufSchema
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__BKSHIDEventDeliveryChain_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_4371 != -1)
    dispatch_once(&protobufSchema_onceToken_4371, block);
  return (id)protobufSchema_schema_4372;
}

void __42__BKSHIDEventDeliveryChain_protobufSchema__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0D01838], "buildSchemaForClass:builder:", *(_QWORD *)(a1 + 32), &__block_literal_global_4373);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)protobufSchema_schema_4372;
  protobufSchema_schema_4372 = v1;

}

void __42__BKSHIDEventDeliveryChain_protobufSchema__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "addField:", "_identity");
  objc_msgSend(v2, "addField:", "_compatibilityDisplay");
  objc_msgSend(v2, "addRepeatingField:containsClass:", "_deferringPath", objc_opt_class());

}

@end
