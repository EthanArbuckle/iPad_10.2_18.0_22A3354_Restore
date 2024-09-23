@implementation MTLGPUDebugTextureErrorLog

- (id)description
{
  int errorReason;
  const __CFString *v4;
  const __CFString *v5;
  uint64_t v7[3];

  errorReason = self->_errorReason;
  if (errorReason)
  {
    if (errorReason == 3)
    {
      v5 = MTLTextureStringFromType((MTLTextureType)self->_expectedTextureType);
      v4 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid texture type %@ bound to shader, expected %@,"), MTLTextureStringFromType((MTLTextureType)self->_actualTextureType), v5);
    }
    else if (errorReason == 2)
    {
      v4 = CFSTR("MTLResourceUsage flags mismatch or missing for texture");
    }
    else
    {
      v4 = CFSTR("<unknown>");
    }
  }
  else
  {
    v4 = CFSTR("Null texture access");
  }
  GPUDebugFunctionInfo::GPUDebugFunctionInfo(v7, -[MTLGPUDebugGPULog function](self, "function"));
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ executing %@\n%@\n"), v4, -[MTLGPUDebugGPULog functionDescription](self, "functionDescription"), -[MTLGPUDebugGPULog locationDescription](self, "locationDescription"));
}

- (int)errorReason
{
  return self->_errorReason;
}

- (void)setErrorReason:(int)a3
{
  self->_errorReason = a3;
}

- (unsigned)expectedTextureType
{
  return self->_expectedTextureType;
}

- (void)setExpectedTextureType:(unsigned __int8)a3
{
  self->_expectedTextureType = a3;
}

- (unsigned)actualTextureType
{
  return self->_actualTextureType;
}

- (void)setActualTextureType:(unsigned __int8)a3
{
  self->_actualTextureType = a3;
}

@end
