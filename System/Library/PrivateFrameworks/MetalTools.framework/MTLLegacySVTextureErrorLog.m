@implementation MTLLegacySVTextureErrorLog

- (id)description
{
  int errorReason;
  const __CFString *v4;
  const __CFString *v5;
  uint64_t v7[3];

  errorReason = self->_errorReason;
  v4 = CFSTR("<unknown>");
  if (errorReason == 2)
    v4 = CFSTR("Texture usage flags mismatch");
  if (errorReason)
    v5 = v4;
  else
    v5 = CFSTR("Null texture access");
  GPUDebugFunctionInfo::GPUDebugFunctionInfo(v7, -[MTLLegacySVGPULog function](self, "function"));
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ executing %@\n"), v5, -[MTLLegacySVGPULog locationDescription](self, "locationDescription"));
}

- (int)errorReason
{
  return self->_errorReason;
}

- (void)setErrorReason:(int)a3
{
  self->_errorReason = a3;
}

@end
