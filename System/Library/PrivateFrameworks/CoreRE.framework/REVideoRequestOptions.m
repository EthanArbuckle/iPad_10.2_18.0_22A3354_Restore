@implementation REVideoRequestOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REVideoRequestOptions)initWithReceiverEndpoint:(id)a3
{
  id v5;
  REVideoRequestOptions *v6;
  REVideoRequestOptions *v7;
  OS_xpc_object **p_receiverEndpoint;
  re *v9;
  REVideoRequestOptions *v10;
  NSObject *v11;
  uint8_t v13[16];
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)REVideoRequestOptions;
  v6 = -[REResourceRequestOptions init](&v14, sel_init);
  v7 = v6;
  if (v6
    && (p_receiverEndpoint = &v6->_receiverEndpoint,
        objc_storeStrong((id *)&v6->_receiverEndpoint, a3),
        !*p_receiverEndpoint))
  {
    v11 = *re::assetTypesLogObjects(v9);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_fault_impl(&dword_224FE9000, v11, OS_LOG_TYPE_FAULT, "Expected a non-nil video receiver endpoint", v13, 2u);
    }
    v10 = 0;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (REVideoRequestOptions)initWithCoder:(id)a3
{
  id v4;
  REVideoRequestOptions *v5;
  uint64_t isKindOfClass;
  id v7;
  uint64_t v8;
  OS_xpc_object *receiverEndpoint;
  re *v10;
  REVideoRequestOptions *v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v15[16];
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)REVideoRequestOptions;
  v5 = -[REResourceRequestOptions initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (!v5)
    goto LABEL_5;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    v12 = *re::assetTypesLogObjects((re *)isKindOfClass);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_fault_impl(&dword_224FE9000, v12, OS_LOG_TYPE_FAULT, "Expected to decode an REVideoRequestOptions from an NSXPCCoder", v15, 2u);
    }
    goto LABEL_11;
  }
  v7 = v4;
  objc_msgSend(v7, "decodeXPCObjectOfType:forKey:", MEMORY[0x24BDACFA0], CFSTR("receiverEndpoint"));
  v8 = objc_claimAutoreleasedReturnValue();
  receiverEndpoint = v5->_receiverEndpoint;
  v5->_receiverEndpoint = (OS_xpc_object *)v8;

  if (!v5->_receiverEndpoint)
  {
    v13 = *re::assetTypesLogObjects(v10);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_fault_impl(&dword_224FE9000, v13, OS_LOG_TYPE_FAULT, "Failed to decode video receiver endpoint", v15, 2u);
    }

LABEL_11:
    v11 = 0;
    goto LABEL_12;
  }

LABEL_5:
  v11 = v5;
LABEL_12:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t isKindOfClass;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v4, "encodeXPCObject:forKey:", self->_receiverEndpoint, CFSTR("receiverEndpoint"));
  }
  else
  {
    v6 = *re::assetTypesLogObjects((re *)isKindOfClass);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_fault_impl(&dword_224FE9000, v6, OS_LOG_TYPE_FAULT, "Expected to encode an REVideoRequestOptions into an NSXPCCoder", v7, 2u);
    }
  }

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<REVideoRequestOptions: %@>"), self->_receiverEndpoint);
}

- (OS_xpc_object)receiverEndpoint
{
  return self->_receiverEndpoint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiverEndpoint, 0);
}

@end
