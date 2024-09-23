@implementation ENScanInstance

- (ENScanInstance)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  ENScanInstance *v7;
  int v8;
  int v9;
  int v10;
  ENScanInstance *v11;

  v6 = a3;
  v7 = -[ENScanInstance init](self, "init");
  if (!v7)
  {
    if (!a4)
      goto LABEL_18;
LABEL_17:
    ENErrorF(2);
    v11 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (MEMORY[0x20BD2F7B8](v6) != MEMORY[0x24BDACFA0])
  {
    if (!a4)
      goto LABEL_18;
    goto LABEL_17;
  }
  v8 = CUXPCDecodeUInt64RangedEx();
  if (v8 == 6)
  {
    v7->_minimumAttenuation = 0;
  }
  else if (v8 == 5)
  {
    goto LABEL_18;
  }
  v9 = CUXPCDecodeUInt64RangedEx();
  if (v9 == 6)
  {
    v7->_typicalAttenuation = 0;
  }
  else if (v9 == 5)
  {
    goto LABEL_18;
  }
  v10 = CUXPCDecodeSInt64RangedEx();
  if (v10 != 6)
  {
    if (v10 != 5)
      goto LABEL_12;
LABEL_18:
    v11 = 0;
    goto LABEL_13;
  }
  v7->_secondsSinceLastScan = 0;
LABEL_12:
  v11 = v7;
LABEL_13:

  return v11;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  int64_t secondsSinceLastScan;
  xpc_object_t xdict;

  v4 = a3;
  xdict = v4;
  if (self->_minimumAttenuation)
  {
    xpc_dictionary_set_uint64(v4, "minAttn", self->_minimumAttenuation);
    v4 = xdict;
  }
  if (self->_typicalAttenuation)
  {
    xpc_dictionary_set_uint64(xdict, "typAttn", self->_typicalAttenuation);
    v4 = xdict;
  }
  secondsSinceLastScan = self->_secondsSinceLastScan;
  if (secondsSinceLastScan)
  {
    xpc_dictionary_set_int64(xdict, "secsLS", secondsSinceLastScan);
    v4 = xdict;
  }

}

- (id)description
{
  id v2;
  id v3;
  id v4;
  id v6;

  NSAppendPrintF_safe();
  v6 = 0;
  NSAppendPrintF_safe();
  v2 = v6;

  NSAppendPrintF_safe();
  v3 = v2;

  NSAppendPrintF_safe();
  v4 = v3;

  return v4;
}

- (ENAttenuation)minimumAttenuation
{
  return self->_minimumAttenuation;
}

- (void)setMinimumAttenuation:(unsigned __int8)a3
{
  self->_minimumAttenuation = a3;
}

- (ENAttenuation)typicalAttenuation
{
  return self->_typicalAttenuation;
}

- (void)setTypicalAttenuation:(unsigned __int8)a3
{
  self->_typicalAttenuation = a3;
}

- (NSInteger)secondsSinceLastScan
{
  return self->_secondsSinceLastScan;
}

- (void)setSecondsSinceLastScan:(int64_t)a3
{
  self->_secondsSinceLastScan = a3;
}

@end
