@implementation MTLLegacySVGPULog

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLLegacySVGPULog;
  -[MTLLegacySVGPULog dealloc](&v3, sel_dealloc);
}

- (NSString)locationDescription
{
  uint64_t v3;
  unint64_t v4;
  NSArray *v5;
  __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  const __CFString *v12;
  void *context;
  NSString *v15;
  NSString *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19[3];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  GPUDebugFunctionInfo::GPUDebugFunctionInfo(v19, -[MTLLegacySVGPULog function](self, "function"));
  v17 = v19[1];
  v18 = (void *)MEMORY[0x24BDD17C8];
  v16 = -[MTLLegacySVGPULog pipelineIdentifier](self, "pipelineIdentifier");
  v15 = -[MTLLegacySVGPULog encoderLabel](self, "encoderLabel");
  v3 = v19[2];
  v4 = -[MTLLegacySVGPULog callIndex](self, "callIndex");
  v5 = -[MTLLegacySVGPULog errorStackTrace](self, "errorStackTrace");
  if (v5)
  {
    v6 = (__CFString *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithString:", &stru_24F795D30);
    context = (void *)MEMORY[0x22E309364]();
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v7)
    {
      v8 = 0;
      v9 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          if (objc_msgSend((id)objc_msgSend(v11, "URL"), "standardizedURL"))
          {
            -[__CFString appendFormat:](v6, "appendFormat:", CFSTR("\t* frame #%d: %@\n"), v8, objc_msgSend(v11, "description"));
            v8 = (v8 + 1);
          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v7);
    }
    objc_autoreleasePoolPop(context);
  }
  else
  {
    v6 = 0;
  }
  v12 = &stru_24F795D30;
  if (v6)
    v12 = v6;
  return (NSString *)objc_msgSend(v18, "stringWithFormat:", CFSTR("%@ %@ encoder: \"%@\", %@: %lu\n%@\n"), v17, v16, v15, v3, v4, v12);
}

- (MTLLegacySVImageData)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSArray)errorStackTrace
{
  return self->_errorStackTrace;
}

- (void)setErrorStackTrace:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unint64_t)callIndex
{
  return self->_callIndex;
}

- (void)setCallIndex:(unint64_t)a3
{
  self->_callIndex = a3;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)encoderLabel
{
  return self->_encoderLabel;
}

- (void)setEncoderLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (MTLFunction)function
{
  return self->_function;
}

- (void)setFunction:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (MTLFunctionLogDebugLocation)debugLocation
{
  return self->_debugLocation;
}

- (void)setDebugLocation:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSString)pipelineIdentifier
{
  return self->_pipelineIdentifier;
}

- (void)setPipelineIdentifier:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

@end
