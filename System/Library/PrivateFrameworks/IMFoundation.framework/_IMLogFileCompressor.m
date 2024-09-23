@implementation _IMLogFileCompressor

+ (id)sharedInstance
{
  if (qword_1ECD91030 != -1)
    dispatch_once(&qword_1ECD91030, &unk_1E2C42E88);
  return (id)qword_1ECD90FE0;
}

- (_IMLogFileCompressor)init
{
  _IMLogFileCompressor *v2;
  NSMutableArray *v3;
  NSMutableArray *archivers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_IMLogFileCompressor;
  v2 = -[_IMLogFileCompressor init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    archivers = v2->_archivers;
    v2->_archivers = v3;

  }
  return v2;
}

- (void)compressPath:(id)a3 toPath:(id)a4
{
  id v6;
  id v7;
  IMFileCopier *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  id v21;

  if (a3)
  {
    if (a4)
    {
      v6 = a4;
      v7 = a3;
      v8 = [IMFileCopier alloc];
      objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v9, (uint64_t)v7, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_fileURLWithPath_(MEMORY[0x1E0C99E98], v12, (uint64_t)v6, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = (id)objc_msgSend_initWithInputURL_outputURL_identifier_operation_delegate_(v8, v15, (uint64_t)v11, (uint64_t)v14, v7, 2, self);
      objc_msgSend_addObject_(self->_archivers, v16, (uint64_t)v21, v17);
      objc_msgSend_start(v21, v18, v19, v20);

    }
  }
}

- (void)fileCopierDidFinish:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  id v18;

  v4 = (void *)MEMORY[0x1E0CB3620];
  v18 = a3;
  objc_msgSend_defaultManager(v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_identifier(v18, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeItemAtPath_error_(v8, v13, (uint64_t)v12, 0);

  objc_msgSend_setDelegate_(v18, v14, 0, v15);
  objc_msgSend_removeObject_(self->_archivers, v16, (uint64_t)v18, v17);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archivers, 0);
}

@end
