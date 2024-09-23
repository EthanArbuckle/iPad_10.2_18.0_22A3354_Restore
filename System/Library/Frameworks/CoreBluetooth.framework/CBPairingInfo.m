@implementation CBPairingInfo

- (CBPairingInfo)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  CBPairingInfo *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  id v15;
  int v16;
  int v17;
  CBPairingInfo *v18;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v6 = a3;
  v7 = -[CBPairingInfo init](self, "init");
  if (!v7)
  {
    if (a4)
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      CBErrorF(-6756, (uint64_t)"%@ init failed", v21, v22, v23, v24, v25, v26, (uint64_t)v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v18 = 0;
      goto LABEL_14;
    }
LABEL_20:
    v18 = 0;
    goto LABEL_14;
  }
  if (MEMORY[0x1A85D2194](v6) != MEMORY[0x1E0C812F8])
  {
    if (a4)
    {
      CBErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v27);
      v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    goto LABEL_20;
  }
  objc_opt_class();
  if (!CUXPCDecodeObject())
    goto LABEL_20;
  v14 = CUXPCDecodeNSError();
  v15 = 0;
  if (!v14)
    goto LABEL_15;
  objc_storeStrong((id *)&v7->_error, 0);
  v16 = CUXPCDecodeUInt64RangedEx();
  if (v16 == 6)
  {
    v7->_flags = 0;
  }
  else if (v16 == 5)
  {
    goto LABEL_15;
  }
  if (!CUXPCDecodeNSString())
    goto LABEL_15;
  v17 = CUXPCDecodeSInt64RangedEx();
  if (v17 != 6)
  {
    if (v17 != 5)
      goto LABEL_12;
LABEL_15:
    v18 = 0;
    goto LABEL_13;
  }
  v7->_pairingType = 0;
LABEL_12:
  v18 = v7;
LABEL_13:

LABEL_14:
  return v18;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  uint64_t flags;
  NSString *pin;
  const char *v7;
  int64_t pairingType;
  xpc_object_t xdict;

  v4 = a3;
  CUXPCEncodeObject();
  if (self->_error)
    CUXPCEncodeNSError();
  flags = self->_flags;
  if ((_DWORD)flags)
    xpc_dictionary_set_uint64(v4, "prFl", flags);
  pin = self->_pin;
  xdict = v4;
  v7 = -[NSString UTF8String](objc_retainAutorelease(pin), "UTF8String");
  if (v7)
    xpc_dictionary_set_string(xdict, "prPN", v7);

  pairingType = self->_pairingType;
  if (pairingType)
    xpc_dictionary_set_int64(xdict, "prTy", pairingType);

}

- (id)description
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  void *v8;

  objc_msgSend((id)objc_opt_class(), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CUPrintFlags32();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CUPrintNSError();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe();
  v4 = (__CFString *)0;

  if (v4)
    v5 = v4;
  else
    v5 = CFSTR("?");
  v6 = v5;

  return v6;
}

- (CBDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_device, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags = a3;
}

- (int64_t)pairingType
{
  return self->_pairingType;
}

- (void)setPairingType:(int64_t)a3
{
  self->_pairingType = a3;
}

- (NSString)pin
{
  return self->_pin;
}

- (void)setPin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pin, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

@end
