@implementation BLSBacklightChangeSourceEventSuppressionMetadata

- (BLSBacklightChangeSourceEventSuppressionMetadata)initWithType:(unint64_t)a3 reason:(unint64_t)a4
{
  BLSBacklightChangeSourceEventSuppressionMetadata *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BLSBacklightChangeSourceEventSuppressionMetadata;
  result = -[BLSBacklightChangeSourceEventSuppressionMetadata init](&v7, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_reason = a4;
  }
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_type == 1)
    v5 = CFSTR("Suppress");
  else
    v5 = CFSTR("Unsuppress");
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("type"));
  NSStringFromBLSAlwaysOnSuppressionReason(self->_reason);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v6, CFSTR("reason"));

  objc_msgSend(v4, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendInteger:", self->_type);
  v5 = (id)objc_msgSend(v3, "appendInteger:", self->_reason);
  v6 = objc_msgSend(v3, "hash");

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  unint64_t type;
  uint64_t v7;
  id v8;
  id v9;
  unint64_t reason;
  id v11;
  id v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  v7 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __60__BLSBacklightChangeSourceEventSuppressionMetadata_isEqual___block_invoke;
  v19[3] = &unk_1E621A830;
  v8 = v4;
  v20 = v8;
  v9 = (id)objc_msgSend(v5, "appendInteger:counterpart:", type, v19);
  reason = self->_reason;
  v14 = v7;
  v15 = 3221225472;
  v16 = __60__BLSBacklightChangeSourceEventSuppressionMetadata_isEqual___block_invoke_2;
  v17 = &unk_1E621A830;
  v18 = v8;
  v11 = v8;
  v12 = (id)objc_msgSend(v5, "appendInteger:counterpart:", reason, &v14);
  LOBYTE(reason) = objc_msgSend(v5, "isEqual", v14, v15, v16, v17);

  return reason;
}

uint64_t __60__BLSBacklightChangeSourceEventSuppressionMetadata_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "type");
}

uint64_t __60__BLSBacklightChangeSourceEventSuppressionMetadata_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reason");
}

- (BLSBacklightChangeSourceEventSuppressionMetadata)initWithXPCDictionary:(id)a3
{
  id v4;
  const char *v5;
  const char *v6;
  int64_t int64;
  int64_t v8;

  v4 = a3;
  v5 = (const char *)objc_msgSend(CFSTR("type"), "UTF8String");
  v6 = (const char *)objc_msgSend(CFSTR("reason"), "UTF8String");
  int64 = xpc_dictionary_get_int64(v4, v5);
  v8 = xpc_dictionary_get_int64(v4, v6);

  return -[BLSBacklightChangeSourceEventSuppressionMetadata initWithType:reason:](self, "initWithType:reason:", int64, v8);
}

- (void)encodeWithXPCDictionary:(id)a3
{
  const char *v4;
  const char *v5;
  xpc_object_t xdict;

  xdict = a3;
  v4 = (const char *)objc_msgSend(CFSTR("type"), "UTF8String");
  v5 = (const char *)objc_msgSend(CFSTR("reason"), "UTF8String");
  xpc_dictionary_set_int64(xdict, v4, self->_type);
  xpc_dictionary_set_int64(xdict, v5, self->_reason);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BLSBacklightChangeSourceEventSuppressionMetadata)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("reason"));

  return -[BLSBacklightChangeSourceEventSuppressionMetadata initWithType:reason:](self, "initWithType:reason:", v5, v6);
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_reason, CFSTR("reason"));

}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)reason
{
  return self->_reason;
}

@end
