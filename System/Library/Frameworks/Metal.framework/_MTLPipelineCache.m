@implementation _MTLPipelineCache

- (void)dealloc
{
  MTLCompilerCache *compilerCache;
  objc_super v4;

  compilerCache = self->_compilerCache;
  if (compilerCache)
  {
    (*((void (**)(MTLCompilerCache *, SEL))compilerCache->var0 + 1))(compilerCache, a2);
    self->_compilerCache = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_MTLPipelineCache;
  -[_MTLPipelineCache dealloc](&v4, sel_dealloc);
}

- (BOOL)writable
{
  return self->_writable;
}

- (BOOL)disableRunTimeCompilation
{
  return self->_disableRunTimeCompilation;
}

- (MTLCompilerCache)cache
{
  return self->_compilerCache;
}

- (_MTLPipelineCache)initWithFilePath:(id)a3 readOnly:(BOOL)a4 deviceInfo:(const MTLTargetDeviceArch *)a5
{
  _MTLPipelineCache *v8;
  char v9;
  unsigned int var1;
  uint64_t v11;
  uint64_t v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)_MTLPipelineCache;
  v8 = -[_MTLPipelineCache init](&v14, sel_init);
  v8->_compilerCache = 0;
  v9 = !a4;
  v8->_writable = v9;
  v8->_disableRunTimeCompilation = 0;
  if (a3)
  {
    var1 = a5->var1;
    LODWORD(v13) = 1;
    HIDWORD(v13) = var1;
    v11 = MTLCompilerCache::createPipelineDataCache(v9, (char *)objc_msgSend(a3, "UTF8String"), &v13);
    v8->_compilerCache = (MTLCompilerCache *)v11;
    if (!(*(unsigned int (**)(uint64_t))(*(_QWORD *)v11 + 16))(v11))
    {

      return 0;
    }
  }
  return v8;
}

- (void)write
{
  (*((void (**)(MTLCompilerCache *))self->_compilerCache->var0 + 10))(self->_compilerCache);
}

- (void)setDisableRunTimeCompilation:(BOOL)a3
{
  self->_disableRunTimeCompilation = a3;
}

@end
