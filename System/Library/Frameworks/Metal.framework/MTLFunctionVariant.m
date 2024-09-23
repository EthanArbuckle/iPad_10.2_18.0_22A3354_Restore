@implementation MTLFunctionVariant

- (MTLFunctionVariant)initWithCompilerOutput:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTLFunctionVariant;
  return -[MTLFunctionVariant init](&v4, sel_init, a3);
}

- (void)dealloc
{
  void *inputInfo;
  NSObject *debugInstrumentationData;
  objc_super v5;

  inputInfo = self->_inputInfo;
  if (inputInfo)
  {
    free(inputInfo);
    self->_inputInfo = 0;
  }
  self->_inputInfoSize = 0;
  debugInstrumentationData = self->_debugInstrumentationData;
  if (debugInstrumentationData)
    dispatch_release(debugInstrumentationData);
  v5.receiver = self;
  v5.super_class = (Class)MTLFunctionVariant;
  -[MTLFunctionVariant dealloc](&v5, sel_dealloc);
}

- (void)setDebugInstrumentationData:(id)a3
{
  NSObject *debugInstrumentationData;

  if (a3)
    dispatch_retain((dispatch_object_t)a3);
  debugInstrumentationData = self->_debugInstrumentationData;
  if (debugInstrumentationData)
    dispatch_release(debugInstrumentationData);
  self->_debugInstrumentationData = (OS_dispatch_data *)a3;
}

- (const)inputInfoAndSize:(unint64_t *)a3
{
  const void *result;
  void **p_inputInfo;

  p_inputInfo = &self->_inputInfo;
  result = self->_inputInfo;
  *a3 = (unint64_t)p_inputInfo[1];
  return result;
}

- (void)setInputInfo:(const void *)a3 size:(unint64_t)a4
{
  void *v7;

  v7 = malloc_type_malloc(a4, 0x2553EB14uLL);
  self->_inputInfo = v7;
  memcpy(v7, a3, a4);
  self->_inputInfoSize = a4;
}

- (const)outputInfoAndSize:(unint64_t *)a3
{
  *a3 = 0;
  return 0;
}

- (OS_dispatch_data)debugInstrumentationData
{
  return self->_debugInstrumentationData;
}

@end
