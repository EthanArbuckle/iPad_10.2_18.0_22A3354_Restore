@implementation SGChatLengthEstimator

- (SGChatLengthEstimator)initWithPath:(id)a3
{
  id v4;
  SGChatLengthEstimator *v5;
  uint64_t v6;
  NSString *path;
  id v8;
  int v9;
  char *v10;
  SGChatLengthEstimator *v11;
  NSObject *v12;
  NSObject *v13;
  int *v15;
  char *v16;
  int v17;
  int *v18;
  char *v19;
  int v20;
  objc_super v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SGChatLengthEstimator;
  v5 = -[SGChatLengthEstimator init](&v21, sel_init);
  if (!v5)
    goto LABEL_5;
  v6 = objc_msgSend(v4, "copy");
  path = v5->_path;
  v5->_path = (NSString *)v6;

  v8 = objc_retainAutorelease(v4);
  v9 = open_dprotected_np((const char *)objc_msgSend(v8, "UTF8String"), 514, 3, 0, 384);
  v5->_fd = v9;
  if (v9 < 0)
  {
    sgLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = __error();
      v16 = strerror(*v15);
      v17 = *__error();
      *(_DWORD *)buf = 138412802;
      v23 = v8;
      v24 = 2080;
      v25 = v16;
      v26 = 1024;
      v27 = v17;
      _os_log_error_impl(&dword_1C3607000, v12, OS_LOG_TYPE_ERROR, "Could not open chat length estimator at %@: %s (errno %i)", buf, 0x1Cu);
    }

    v11 = 0;
  }
  else
  {
    ftruncate(v9, 0x4000);
    v10 = (char *)mmap(0, 0x4000uLL, 3, 1, v5->_fd, 0);
    v5->_countPtr = (unsigned __int16 *)v10;
    if (v10 != (char *)-1)
    {
      v5->_sketch = v10 + 2;
      pthread_mutex_init(&v5->_lock, 0);
LABEL_5:
      v11 = v5;
      goto LABEL_12;
    }
    sgLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v18 = __error();
      v19 = strerror(*v18);
      v20 = *__error();
      *(_DWORD *)buf = 138412802;
      v23 = v8;
      v24 = 2080;
      v25 = v19;
      v26 = 1024;
      v27 = v20;
      _os_log_error_impl(&dword_1C3607000, v13, OS_LOG_TYPE_ERROR, "Could not mmap chat length estimator file at %@: %s (errno %i)", buf, 0x1Cu);
    }

    close(v5->_fd);
    v11 = 0;
    v5->_fd = -1;
  }
LABEL_12:

  return v11;
}

- (id)initInMemory
{
  SGChatLengthEstimator *v2;
  SGChatLengthEstimator *v3;
  uint64_t v4;
  NSMutableData *backingData;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SGChatLengthEstimator;
  v2 = -[SGChatLengthEstimator init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_fd = -1;
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 0x4000);
    backingData = v3->_backingData;
    v3->_backingData = (NSMutableData *)v4;

    v6 = -[NSMutableData mutableBytes](v3->_backingData, "mutableBytes");
    v3->_countPtr = (unsigned __int16 *)v6;
    v3->_sketch = (char *)(v6 + 2);
    pthread_mutex_init(&v3->_lock, 0);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_lock);
  if ((self->_fd & 0x80000000) == 0)
  {
    msync(self->_countPtr, 0x4000uLL, 1);
    munmap(self->_countPtr, 0x4000uLL);
    close(self->_fd);
    self->_fd = -1;
  }
  v3.receiver = self;
  v3.super_class = (Class)SGChatLengthEstimator;
  -[SGChatLengthEstimator dealloc](&v3, sel_dealloc);
}

- (unint64_t)count
{
  unint64_t v3;

  pthread_mutex_lock(&sharedInstanceLock);
  v3 = *self->_countPtr;
  pthread_mutex_unlock(&sharedInstanceLock);
  return v3;
}

- (void)recordMessageInChat:(id)a3
{
  id v5;
  void *v6;
  unsigned __int16 *countPtr;
  unsigned __int16 v8;
  NSObject *v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  char *sketch;
  __int16 v15;
  char v16;
  void *v17;
  uint8_t buf[8];
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v19 = 0;
    v20 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGChatLengthEstimator.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("domainIdentifier"));

    v19 = 0;
    v20 = 0;
    v5 = 0;
  }
  SGMurmurhashString(v5, 3203338804, &v19);
  pthread_mutex_lock(&sharedInstanceLock);
  countPtr = self->_countPtr;
  v8 = *countPtr + 1;
  *countPtr = v8;
  if (v8 >= 0x1389u)
  {
    sgLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C3607000, v9, OS_LOG_TYPE_DEFAULT, "Chat length estimator reached max size. Clearing.", buf, 2u);
    }

    bzero(self->_countPtr, 0x4000uLL);
  }
  v10 = 0;
  v11 = 1;
  do
  {
    v12 = v11;
    v13 = *((_DWORD *)&v19 + v10) & 0x3FFF;
    if (v13 <= 0x3FFD)
    {
      sketch = self->_sketch;
      v15 = sketch[v13];
      if (((v15 + 1) & 0x100) != 0)
        v16 = -1;
      else
        v16 = v15 + 1;
      sketch[v13] = v16;
    }
    v11 = 0;
    v10 = 1;
  }
  while ((v12 & 1) != 0);
  pthread_mutex_unlock(&sharedInstanceLock);

}

- (unint64_t)estimateMessagesInChat:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  unsigned __int8 v8;
  char v9;
  char v10;
  uint64_t v11;
  unsigned int v12;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v15 = 0;
    v16 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGChatLengthEstimator.m"), 147, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("domainIdentifier"));

    v15 = 0;
    v16 = 0;
    v5 = 0;
  }
  SGMurmurhashString(v5, 3203338804, &v15);
  pthread_mutex_lock(&sharedInstanceLock);
  v7 = 0;
  v8 = -1;
  v9 = 1;
  do
  {
    v10 = v9;
    v11 = *((_DWORD *)&v15 + v7) & 0x3FFF;
    if (v11 <= 0x3FFD)
    {
      v12 = self->_sketch[v11];
      if (v8 >= v12)
        v8 = v12;
    }
    v9 = 0;
    v7 = 1;
  }
  while ((v10 & 1) != 0);
  pthread_mutex_unlock(&sharedInstanceLock);

  return v8;
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_backingData, 0);
}

+ (id)sharedInstance
{
  SGChatLengthEstimator *v2;
  SGChatLengthEstimator *v3;
  void *v4;
  SGChatLengthEstimator *v5;
  void *v6;

  pthread_mutex_lock(&sharedInstanceLock);
  v2 = (SGChatLengthEstimator *)(id)sharedInstance;
  if (!v2)
  {
    v3 = [SGChatLengthEstimator alloc];
    +[SGPaths suggestionsDirectoryFile:](SGPaths, "suggestionsDirectoryFile:", CFSTR("chatLengthEstimator.cmsketch"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SGChatLengthEstimator initWithPath:](v3, "initWithPath:", v4);
    v6 = (void *)sharedInstance;
    sharedInstance = (uint64_t)v5;

    v2 = v5;
  }
  pthread_mutex_unlock(&sharedInstanceLock);
  return v2;
}

+ (void)setSharedInstance:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  pthread_mutex_lock(&sharedInstanceLock);
  v4 = (void *)sharedInstance;
  sharedInstance = (uint64_t)v3;

  pthread_mutex_unlock(&sharedInstanceLock);
}

@end
