@implementation CBApplePayloadTypeInfo

- (CBApplePayloadTypeInfo)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  CBApplePayloadTypeInfo *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  CBApplePayloadTypeInfo *v16;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v6 = a3;
  v7 = -[CBApplePayloadTypeInfo init](self, "init");
  if (!v7)
  {
    if (a4)
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      CBErrorF(-6756, (uint64_t)"%@ init failed", v19, v20, v21, v22, v23, v24, (uint64_t)v18);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_15;
  }
  if (MEMORY[0x1A85D2194](v6) != MEMORY[0x1E0C812F8])
  {
    if (a4)
    {
      CBErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v25);
      v16 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    goto LABEL_15;
  }
  v14 = CUXPCDecodeUInt64RangedEx();
  if (v14 == 6)
  {
    v7->_applePayloadType = 0;
  }
  else if (v14 == 5)
  {
    goto LABEL_15;
  }
  v15 = CUXPCDecodeSInt64RangedEx();
  if (v15 != 6)
  {
    if (v15 != 5)
      goto LABEL_9;
LABEL_15:
    v16 = 0;
    goto LABEL_10;
  }
  v7->_rssiThreshold = 0;
LABEL_9:
  v16 = v7;
LABEL_10:

  return v16;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  xpc_object_t xdict;

  v4 = a3;
  xdict = v4;
  if (self->_applePayloadType)
  {
    xpc_dictionary_set_uint64(v4, "apTY", self->_applePayloadType);
    v4 = xdict;
  }
  if (self->_rssiThreshold)
  {
    xpc_dictionary_set_int64(xdict, "blRS", self->_rssiThreshold);
    v4 = xdict;
  }

}

- (id)description
{
  __CFString *v2;
  __CFString *v3;
  __CFString *v4;

  NSAppendPrintF_safe();
  v2 = (__CFString *)0;
  v3 = v2;
  if (!v2)
    v2 = CFSTR("?");
  v4 = v2;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CBApplePayloadTypeInfo *v4;
  CBApplePayloadTypeInfo *v5;
  CBApplePayloadTypeInfo *v6;
  int v7;
  int v8;
  BOOL v9;

  v4 = (CBApplePayloadTypeInfo *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_6;
  if (v4 == self)
  {

    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_6:

    return 0;
  }
  v6 = v5;
  v7 = -[CBApplePayloadTypeInfo applePayloadType](self, "applePayloadType");
  if (v7 == -[CBApplePayloadTypeInfo applePayloadType](v6, "applePayloadType"))
  {
    v8 = -[CBApplePayloadTypeInfo rssiThreshold](self, "rssiThreshold");
    v9 = v8 == -[CBApplePayloadTypeInfo rssiThreshold](v6, "rssiThreshold");
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[CBApplePayloadTypeInfo applePayloadType](self, "applePayloadType");
  return -[CBApplePayloadTypeInfo rssiThreshold](self, "rssiThreshold") ^ v3;
}

- (unsigned)applePayloadType
{
  return self->_applePayloadType;
}

- (void)setApplePayloadType:(unsigned __int8)a3
{
  self->_applePayloadType = a3;
}

- (char)rssiThreshold
{
  return self->_rssiThreshold;
}

- (void)setRssiThreshold:(char)a3
{
  self->_rssiThreshold = a3;
}

@end
