@implementation NWURLSessionMultipartPartBoundarySuffixRecognizer

- (NWURLSessionMultipartPartBoundarySuffixRecognizer)init
{
  NWURLSessionMultipartPartBoundarySuffixRecognizer *v2;
  NWURLSessionMultipartPartBoundarySuffixRecognizer *v3;
  char *v4;
  NWURLSessionMultipartPartBoundarySuffixRecognizer *result;
  NSObject *v6;
  void *v7;
  objc_super v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NWURLSessionMultipartPartBoundarySuffixRecognizer;
  v2 = -[NWURLSessionMultipartPartBoundarySuffixRecognizer init](&v8, sel_init);
  v3 = v2;
  if (!v2)
    return v3;
  v2->_nextState = 4;
  v2->_bytesConsumed = 0;
  v4 = (char *)malloc_type_malloc(2uLL, 0xF2B69DE5uLL);
  if (v4)
  {
LABEL_3:
    v3->_buffer = v4;
    v3->_count = 0;
    return v3;
  }
  __nwlog_obj();
  v6 = objc_claimAutoreleasedReturnValue();
  os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  v9 = 136446466;
  v10 = "strict_malloc";
  v11 = 2048;
  v12 = 2;
  v7 = (void *)_os_log_send_and_compose_impl();

  result = (NWURLSessionMultipartPartBoundarySuffixRecognizer *)__nwlog_abort((uint64_t)v7);
  if (!(_DWORD)result)
  {
    free(v7);
    goto LABEL_3;
  }
  __break(1u);
  return result;
}

- (void)dealloc
{
  char *buffer;
  objc_super v4;

  if (self)
  {
    buffer = self->_buffer;
    if (buffer)
    {
      free(buffer);
      self->_buffer = 0;
    }
  }
  v4.receiver = self;
  v4.super_class = (Class)NWURLSessionMultipartPartBoundarySuffixRecognizer;
  -[NWURLSessionMultipartPartBoundarySuffixRecognizer dealloc](&v4, sel_dealloc);
}

@end
