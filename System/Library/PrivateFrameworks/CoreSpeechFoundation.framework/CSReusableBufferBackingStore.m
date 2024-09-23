@implementation CSReusableBufferBackingStore

- (const)bytes
{
  return self->_buffer;
}

- (CSReusableBufferBackingStore)initWithBuffer:(void *)a3 bufferSize:(unint64_t)a4 deallocator:(id)a5
{
  id v8;
  CSReusableBufferBackingStore *v9;
  CSReusableBufferBackingStore *v10;
  uint64_t v11;
  id deallocator;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CSReusableBufferBackingStore;
  v9 = -[CSReusableBufferBackingStore init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_buffer = a3;
    v9->_bufferSize = a4;
    v11 = objc_msgSend(v8, "copy");
    deallocator = v10->_deallocator;
    v10->_deallocator = (id)v11;

  }
  return v10;
}

- (void)dealloc
{
  void (**deallocator)(id, SEL);
  objc_super v4;

  deallocator = (void (**)(id, SEL))self->_deallocator;
  if (deallocator)
    deallocator[2](deallocator, a2);
  v4.receiver = self;
  v4.super_class = (Class)CSReusableBufferBackingStore;
  -[CSReusableBufferBackingStore dealloc](&v4, sel_dealloc);
}

- (BOOL)configureWithBytes:(const void *)a3 length:(unint64_t)a4
{
  NSObject *v4;
  _BOOL4 v5;
  BOOL result;
  const char *v7;
  _BOOL4 v8;
  void *buffer;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v4 = CSLogContextFacilityCoreSpeech;
    v8 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v8)
      return result;
    v10 = 136315138;
    v11 = "-[CSReusableBufferBackingStore configureWithBytes:length:]";
    v7 = "%s Failed to allocate buffer since length zero";
    goto LABEL_7;
  }
  if (self->_bufferSize < a4)
  {
    v4 = CSLogContextFacilityCoreSpeech;
    v5 = os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (!v5)
      return result;
    v10 = 136315138;
    v11 = "-[CSReusableBufferBackingStore configureWithBytes:length:]";
    v7 = "%s Failed to allocate buffer since length is larger than configuration";
LABEL_7:
    _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0xCu);
    return 0;
  }
  buffer = self->_buffer;
  if (a3)
    memmove(buffer, a3, a4);
  else
    bzero(buffer, a4);
  return 1;
}

- (unint64_t)recycleHostTime
{
  return self->_recycleHostTime;
}

- (void)setRecycleHostTime:(unint64_t)a3
{
  self->_recycleHostTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deallocator, 0);
}

@end
