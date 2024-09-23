@implementation CBDeviceRequest

- (CBDeviceRequest)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  CBDeviceRequest *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  CBDeviceRequest *v15;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a3;
  v7 = -[CBDeviceRequest init](self, "init");
  if (!v7)
  {
    if (a4)
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      CBErrorF(-6756, (uint64_t)"%@ init failed", v18, v19, v20, v21, v22, v23, (uint64_t)v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      v15 = 0;
      goto LABEL_8;
    }
    goto LABEL_13;
  }
  if (MEMORY[0x1A85D2194](v6) != MEMORY[0x1E0C812F8])
  {
    if (a4)
    {
      CBErrorF(-6756, (uint64_t)"XPC non-dict", v8, v9, v10, v11, v12, v13, v24);
      v15 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    goto LABEL_13;
  }
  v14 = CUXPCDecodeUInt64RangedEx();
  if (v14 == 6)
  {
    v7->_requestFlags = 0;
    goto LABEL_6;
  }
  if (v14 == 5)
  {
LABEL_13:
    v15 = 0;
    goto LABEL_8;
  }
LABEL_6:
  if (!CUXPCDecodeDouble())
    goto LABEL_13;
  v15 = v7;
LABEL_8:

  return v15;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  uint64_t requestFlags;
  double timeoutSeconds;
  xpc_object_t xdict;

  v4 = a3;
  requestFlags = self->_requestFlags;
  xdict = v4;
  if ((_DWORD)requestFlags)
  {
    xpc_dictionary_set_uint64(v4, "dvRF", requestFlags);
    v4 = xdict;
  }
  timeoutSeconds = self->_timeoutSeconds;
  if (timeoutSeconds != 0.0)
  {
    xpc_dictionary_set_double(xdict, "timO", timeoutSeconds);
    v4 = xdict;
  }

}

- (id)description
{
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  void *v9;

  objc_msgSend((id)objc_opt_class(), "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CUPrintFlags32();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF_safe();
  v4 = (__CFString *)0;

  if (self->_timeoutSeconds != 0.0)
  {
    NSAppendPrintF_safe();
    v5 = v4;

    v4 = v5;
  }
  if (v4)
    v6 = v4;
  else
    v6 = CFSTR("?");
  v7 = v6;

  return v7;
}

- (unsigned)requestFlags
{
  return self->_requestFlags;
}

- (void)setRequestFlags:(unsigned int)a3
{
  self->_requestFlags = a3;
}

- (double)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(double)a3
{
  self->_timeoutSeconds = a3;
}

@end
