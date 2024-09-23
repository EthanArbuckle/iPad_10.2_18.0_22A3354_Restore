@implementation AFBBufferBuilder

- (void)setError:(id)a3
{
  id v5;
  NSError **p_firstError;
  NSError *firstError;
  id v8;

  v5 = a3;
  firstError = self->_firstError;
  p_firstError = &self->_firstError;
  if (!firstError)
  {
    v8 = v5;
    objc_storeStrong((id *)p_firstError, a3);
    v5 = v8;
  }

}

- (AFBBufferBuilder)initWithConfig:(const Config *)a3 path:(id)a4 protectionClass:(int)a5 capacity:(unint64_t)a6 error:(id *)a7
{
  id v13;
  char *v14;
  _QWORD *v15;
  apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator *v16;
  id v17;
  uint64_t v18;
  AFBBufferBuilder *v19;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  int __errnum;
  _QWORD *v29;
  objc_super v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v13 = a4;
  v30.receiver = self;
  v30.super_class = (Class)AFBBufferBuilder;
  v14 = -[AFBBufferBuilder init](&v30, sel_init);
  if (!v14)
    goto LABEL_7;
  if (!v13)
  {
LABEL_6:
    *((_QWORD *)v14 + 1) = *((_QWORD *)v14 + 13);
    v14[16] = 0;
    *((_QWORD *)v14 + 3) = a6;
    *((_QWORD *)v14 + 4) = 8;
    *(_OWORD *)(v14 + 40) = 0u;
    *(_OWORD *)(v14 + 56) = 0u;
    *((_QWORD *)v14 + 9) = 0;
    *((_QWORD *)v14 + 10) = 1;
    *((_WORD *)v14 + 44) = 256;
    *((_QWORD *)v14 + 12) = 0;
    objc_storeStrong((id *)v14 + 15, a4);
    v14[112] = 1;
LABEL_7:
    v19 = v14;
    goto LABEL_8;
  }
  v15 = (_QWORD *)operator new();
  apple::aiml::flatbuffers2::objc_apple::MemmoveWithMsync::MemmoveWithMsync(v15, a3->var1);
  v29 = v15;
  v16 = (apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator *)operator new();
  apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::MappedFileAllocator((uint64_t)v16, (__n128 *)a3, (uint64_t *)&v29);
  *((_QWORD *)v14 + 13) = v16;
  __errnum = 0;
  v17 = objc_retainAutorelease(v13);
  if ((apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::init(v16, (const char *)objc_msgSend(v17, "fileSystemRepresentation"), a5, &__errnum) & 1) != 0)
  {
    v18 = (uint64_t)v29;
    v29 = 0;
    if (v18)
      (*(void (**)(uint64_t))(*(_QWORD *)v18 + 16))(v18);
    goto LABEL_6;
  }
  v21 = *((_QWORD *)v14 + 13);
  if (v21)
    (*(void (**)(uint64_t))(*(_QWORD *)v21 + 8))(v21);
  *((_QWORD *)v14 + 13) = 0;
  v22 = objc_alloc(MEMORY[0x24BDD17C8]);
  v23 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("Unable to open \"%@\": %s (%d)"), v17, strerror(__errnum), __errnum);
  v31 = *MEMORY[0x24BDD0FC8];
  v32[0] = v23;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("AFBErrorDomain"), 2, v24);
  v26 = v25;
  if (a7)
    *a7 = objc_retainAutorelease(v25);

  v27 = (uint64_t)v29;
  v29 = 0;
  if (v27)
    (*(void (**)(uint64_t))(*(_QWORD *)v27 + 16))(v27);
  v19 = 0;
LABEL_8:

  return v19;
}

- (AFBBufferBuilder)init
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v3 = 0;
  v4 = 0x4000;
  v5 = 0;
  return -[AFBBufferBuilder initWithConfig:path:protectionClass:capacity:error:](self, "initWithConfig:path:protectionClass:capacity:error:", &v3, 0, 0xFFFFFFFFLL, 1024, 0);
}

- (AFBBufferBuilder)initWithCapacity:(unint64_t)a3
{
  int v4;
  uint64_t v5;
  uint64_t v6;

  v4 = 0;
  v5 = 0x4000;
  v6 = 0;
  return -[AFBBufferBuilder initWithConfig:path:protectionClass:capacity:error:](self, "initWithConfig:path:protectionClass:capacity:error:", &v4, 0, 0xFFFFFFFFLL, 1024, 0);
}

- (AFBBufferBuilder)initWithFileAtPath:(id)a3 protection:(id)a4 capacity:(unint64_t)a5 error:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  AFBBufferBuilder *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0CD0]) & 1) != 0)
  {
    v12 = 1;
LABEL_9:
    v19 = 0;
    v20 = 0x4000;
    v21 = 0;
    self = -[AFBBufferBuilder initWithConfig:path:protectionClass:capacity:error:](self, "initWithConfig:path:protectionClass:capacity:error:", &v19, v10, v12, a5, a6);
    v13 = self;
    goto LABEL_10;
  }
  if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0CD8]) & 1) != 0)
  {
    v12 = 2;
    goto LABEL_9;
  }
  if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0CE0]) & 1) != 0)
  {
    v12 = 3;
    goto LABEL_9;
  }
  if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BDD0CF8]) & 1) != 0)
  {
    v12 = 4;
    goto LABEL_9;
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Unrecognized file protection: %@"), v11);
  v22 = *MEMORY[0x24BDD0FC8];
  v23[0] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("AFBErrorDomain"), 1, v16);
  v18 = v17;
  if (a6)
    *a6 = objc_retainAutorelease(v17);

  v13 = 0;
LABEL_10:

  return v13;
}

- (AFBBufferBuilder)initWithFileAtPath:(id)a3 capacity:(unint64_t)a4 error:(id *)a5
{
  int v6;
  uint64_t v7;
  uint64_t v8;

  v6 = 0;
  v7 = 0x4000;
  v8 = 0;
  return -[AFBBufferBuilder initWithConfig:path:protectionClass:capacity:error:](self, "initWithConfig:path:protectionClass:capacity:error:", &v6, a3, 0xFFFFFFFFLL, a4, a5);
}

- (void)dealloc
{
  void *fileAllocator;
  objc_super v4;

  if (self->_initOk)
    apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder((apple::aiml::flatbuffers2::FlatBufferBuilder *)&self->_fbbStorage);
  fileAllocator = self->_fileAllocator;
  if (fileAllocator)
    (*(void (**)(void *, SEL))(*(_QWORD *)fileAllocator + 8))(fileAllocator, a2);
  v4.receiver = self;
  v4.super_class = (Class)AFBBufferBuilder;
  -[AFBBufferBuilder dealloc](&v4, sel_dealloc);
}

- (uint64_t)_fbb
{
  if (a1)
    return a1 + 8;
  else
    return 0;
}

- (void)throwIfFinalizedWithSelector:(SEL)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;

  if (self->_isFinalized)
  {
    v4 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "initWithFormat:", CFSTR("%@: AFBBufferBuilder misuse: instance already finalized"), v5);

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("AFBMisuseException"), v6, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }
}

- (void)finalizeWithSelector:(SEL)a3
{
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a3);
  self->_isFinalized = 1;
}

- (BOOL)finalizeWithSelector:(SEL)a3 allocatorBufferAddr:(void *)a4 size:(unint64_t)a5 error:(id *)a6
{
  void *v11;
  char v12;
  apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator *fileAllocator;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  int __errnum;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  -[AFBBufferBuilder firstError](self, "firstError");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (a6)
    {
      -[AFBBufferBuilder firstError](self, "firstError");
      v12 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      return 0;
    }
  }
  else
  {
    -[AFBBufferBuilder finalizeWithSelector:](self, "finalizeWithSelector:", a3);
    fileAllocator = (apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator *)self->_fileAllocator;
    if (fileAllocator)
    {
      __errnum = 0;
      v12 = apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::truncate_to_region(fileAllocator, (unsigned __int8 *)a4, a5, &__errnum);
      if ((v12 & 1) == 0)
      {
        v14 = objc_alloc(MEMORY[0x24BDD1540]);
        v15 = __errnum;
        v22 = *MEMORY[0x24BDD0FC8];
        v16 = objc_alloc(MEMORY[0x24BDD17C8]);
        v17 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("%s (errno %d)"), strerror(__errnum), __errnum);
        v23[0] = v17;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)objc_msgSend(v14, "initWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], v15, v18);

        if (a6)
          *a6 = objc_retainAutorelease(v19);

      }
    }
    else
    {
      return 1;
    }
  }
  return v12;
}

- (void)fbb
{
  if (self)
    return &self->_fbbStorage;
  else
    return 0;
}

- (id)createVectorOfBoolWithArray:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  type *p_fbbStorage;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v15, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count"), 1uLL);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v5, "reverseObjectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v9);
          apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<BOOL>((uint64_t)p_fbbStorage, objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "BOOLValue"));
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count")));
  }

  return v7;
}

- (id)createVectorOfBoolWithArray:(id)a3 alignment:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  type *p_fbbStorage;
  unint64_t v12;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;

  v7 = a3;
  if (!v7)
  {
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v15, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    v10 = objc_msgSend(v7, "count");
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    if (a4 <= 1)
      v12 = 1;
    else
      v12 = a4;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v10, 1, v12);
    -[AFBBufferBuilder createVectorOfBoolWithArray:](self, "createVectorOfBoolWithArray:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)createVectorOfBoolWithCArray:(const BOOL *)a3 count:(unint64_t)a4
{
  void *v8;
  void *v9;
  type *p_fbbStorage;
  const BOOL *v11;
  unint64_t i;
  unint64_t v13;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  if (!a3)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 1uLL);
    v11 = a3 - 1;
    for (i = a4; i; i = v13)
    {
      v13 = i - 1;
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<BOOL>((uint64_t)p_fbbStorage, v11[i]);
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4));
  }
  return v9;
}

- (id)createVectorOfBoolWithCArray:(const BOOL *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5
{
  void *v9;
  void *v10;
  unint64_t v11;
  type *p_fbbStorage;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  if (!a3)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = &unk_24E437880;
  }
  else
  {
    if (a5 <= 1)
      v11 = 1;
    else
      v11 = a5;
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 1, v11);
    -[AFBBufferBuilder createVectorOfBoolWithCArray:count:](self, "createVectorOfBoolWithCArray:count:", a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (id)createVectorOfBoolWithCount:(unint64_t)a3 block:(id)a4
{
  void (**v7)(id, unint64_t, char *);
  void *v8;
  void *v9;
  type *p_fbbStorage;
  unint64_t started;
  unint64_t v12;
  void *v13;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  char v19[17];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, unint64_t, char *))a4;
  if (!v7)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("block"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    started = apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 1uLL);
    if (a3)
    {
      v12 = a3 - 1;
      do
      {
        v19[0] = 0;
        v13 = (void *)MEMORY[0x2207C93E8](started);
        v7[2](v7, v12, v19);
        objc_autoreleasePoolPop(v13);
        started = apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<BOOL>((uint64_t)p_fbbStorage, v19[0]);
        --v12;
      }
      while (v12 != -1);
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3));
  }

  return v9;
}

- (id)createVectorOfBoolWithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  type *p_fbbStorage;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  v9 = a5;
  if (!v9)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("block"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = &unk_24E437880;
  }
  else
  {
    if (a4 <= 1)
      v12 = 1;
    else
      v12 = a4;
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 1, v12);
    -[AFBBufferBuilder createVectorOfBoolWithCount:block:](self, "createVectorOfBoolWithCount:block:", a3, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)createVectorOfInt8WithArray:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  type *p_fbbStorage;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v15, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count"), 1uLL);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v5, "reverseObjectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v9);
          apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<signed char>((uint64_t)p_fbbStorage, objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "intValue"));
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count")));
  }

  return v7;
}

- (id)createVectorOfInt8WithArray:(id)a3 alignment:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  type *p_fbbStorage;
  unint64_t v12;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;

  v7 = a3;
  if (!v7)
  {
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v15, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    v10 = objc_msgSend(v7, "count");
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    if (a4 <= 1)
      v12 = 1;
    else
      v12 = a4;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v10, 1, v12);
    -[AFBBufferBuilder createVectorOfInt8WithArray:](self, "createVectorOfInt8WithArray:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)createVectorOfInt8WithCArray:(const char *)a3 count:(unint64_t)a4
{
  void *v8;
  void *v9;
  type *p_fbbStorage;
  const char *v11;
  unint64_t i;
  unint64_t v13;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  if (!a3)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 1uLL);
    v11 = a3 - 1;
    for (i = a4; i; i = v13)
    {
      v13 = i - 1;
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<signed char>((uint64_t)p_fbbStorage, v11[i]);
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4));
  }
  return v9;
}

- (id)createVectorOfInt8WithCArray:(const char *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5
{
  void *v9;
  void *v10;
  unint64_t v11;
  type *p_fbbStorage;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  if (!a3)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = &unk_24E437880;
  }
  else
  {
    if (a5 <= 1)
      v11 = 1;
    else
      v11 = a5;
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 1, v11);
    -[AFBBufferBuilder createVectorOfInt8WithCArray:count:](self, "createVectorOfInt8WithCArray:count:", a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (id)createVectorOfInt8WithCount:(unint64_t)a3 block:(id)a4
{
  void (**v7)(id, unint64_t, char *);
  void *v8;
  void *v9;
  type *p_fbbStorage;
  unint64_t started;
  unint64_t v12;
  void *v13;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  char v19[17];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, unint64_t, char *))a4;
  if (!v7)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("block"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    started = apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 1uLL);
    if (a3)
    {
      v12 = a3 - 1;
      do
      {
        v19[0] = 0;
        v13 = (void *)MEMORY[0x2207C93E8](started);
        v7[2](v7, v12, v19);
        objc_autoreleasePoolPop(v13);
        started = apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<signed char>((uint64_t)p_fbbStorage, v19[0]);
        --v12;
      }
      while (v12 != -1);
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3));
  }

  return v9;
}

- (id)createVectorOfInt8WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  type *p_fbbStorage;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  v9 = a5;
  if (!v9)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("block"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = &unk_24E437880;
  }
  else
  {
    if (a4 <= 1)
      v12 = 1;
    else
      v12 = a4;
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 1, v12);
    -[AFBBufferBuilder createVectorOfInt8WithCount:block:](self, "createVectorOfInt8WithCount:block:", a3, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)createVectorOfUInt8WithArray:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  type *p_fbbStorage;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v15, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count"), 1uLL);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v5, "reverseObjectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v9);
          apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<signed char>((uint64_t)p_fbbStorage, objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "intValue"));
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count")));
  }

  return v7;
}

- (id)createVectorOfUInt8WithArray:(id)a3 alignment:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  type *p_fbbStorage;
  unint64_t v12;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;

  v7 = a3;
  if (!v7)
  {
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v15, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    v10 = objc_msgSend(v7, "count");
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    if (a4 <= 1)
      v12 = 1;
    else
      v12 = a4;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v10, 1, v12);
    -[AFBBufferBuilder createVectorOfUInt8WithArray:](self, "createVectorOfUInt8WithArray:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)createVectorOfUInt8WithCArray:(const char *)a3 count:(unint64_t)a4
{
  void *v8;
  void *v9;
  type *p_fbbStorage;
  const char *v11;
  unint64_t i;
  unint64_t v13;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  if (!a3)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 1uLL);
    v11 = a3 - 1;
    for (i = a4; i; i = v13)
    {
      v13 = i - 1;
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<signed char>((uint64_t)p_fbbStorage, v11[i]);
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4));
  }
  return v9;
}

- (id)createVectorOfUInt8WithCArray:(const char *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5
{
  void *v9;
  void *v10;
  unint64_t v11;
  type *p_fbbStorage;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  if (!a3)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = &unk_24E437880;
  }
  else
  {
    if (a5 <= 1)
      v11 = 1;
    else
      v11 = a5;
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 1, v11);
    -[AFBBufferBuilder createVectorOfUInt8WithCArray:count:](self, "createVectorOfUInt8WithCArray:count:", a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (id)createVectorOfUInt8WithCount:(unint64_t)a3 block:(id)a4
{
  void (**v7)(id, unint64_t, char *);
  void *v8;
  void *v9;
  type *p_fbbStorage;
  unint64_t started;
  unint64_t v12;
  void *v13;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  char v19[17];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, unint64_t, char *))a4;
  if (!v7)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("block"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    started = apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 1uLL);
    if (a3)
    {
      v12 = a3 - 1;
      do
      {
        v19[0] = 0;
        v13 = (void *)MEMORY[0x2207C93E8](started);
        v7[2](v7, v12, v19);
        objc_autoreleasePoolPop(v13);
        started = apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<signed char>((uint64_t)p_fbbStorage, v19[0]);
        --v12;
      }
      while (v12 != -1);
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3));
  }

  return v9;
}

- (id)createVectorOfUInt8WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  type *p_fbbStorage;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  v9 = a5;
  if (!v9)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("block"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = &unk_24E437880;
  }
  else
  {
    if (a4 <= 1)
      v12 = 1;
    else
      v12 = a4;
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 1, v12);
    -[AFBBufferBuilder createVectorOfUInt8WithCount:block:](self, "createVectorOfUInt8WithCount:block:", a3, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)createVectorOfUInt8WithData:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;

  v5 = a3;
  v6 = MEMORY[0x2207C93E8]();
  if (!v5)
  {
    v12 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v13, CFSTR("data"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v14, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  v7 = (void *)v6;
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    v10 = objc_retainAutorelease(v5);
    -[AFBBufferBuilder createVectorOfUInt8WithCArray:count:](self, "createVectorOfUInt8WithCArray:count:", objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_autoreleasePoolPop(v7);

  return v9;
}

- (id)createVectorOfUInt8WithData:(id)a3 alignment:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;

  v7 = a3;
  v8 = MEMORY[0x2207C93E8]();
  if (!v7)
  {
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v15, CFSTR("data"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  v9 = (void *)v8;
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = &unk_24E437880;
  }
  else
  {
    v12 = objc_retainAutorelease(v7);
    -[AFBBufferBuilder createVectorOfUInt8WithCArray:count:alignment:](self, "createVectorOfUInt8WithCArray:count:alignment:", objc_msgSend(v12, "bytes"), objc_msgSend(v12, "length"), a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_autoreleasePoolPop(v9);

  return v11;
}

- (id)createVectorOfInt16WithArray:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  type *p_fbbStorage;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v15, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count"), 2uLL);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v5, "reverseObjectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v9);
          apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<short>((uint64_t)p_fbbStorage, objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "intValue"));
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count")));
  }

  return v7;
}

- (id)createVectorOfInt16WithArray:(id)a3 alignment:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  type *p_fbbStorage;
  unint64_t v12;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;

  v7 = a3;
  if (!v7)
  {
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v15, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    v10 = objc_msgSend(v7, "count");
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    if (a4 <= 2)
      v12 = 2;
    else
      v12 = a4;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v10, 2, v12);
    -[AFBBufferBuilder createVectorOfInt16WithArray:](self, "createVectorOfInt16WithArray:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)createVectorOfInt16WithCArray:(const signed __int16 *)a3 count:(unint64_t)a4
{
  void *v8;
  void *v9;
  type *p_fbbStorage;
  const signed __int16 *v11;
  unint64_t i;
  unint64_t v13;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  if (!a3)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 2uLL);
    v11 = a3 - 1;
    for (i = a4; i; i = v13)
    {
      v13 = i - 1;
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<short>((uint64_t)p_fbbStorage, v11[i]);
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4));
  }
  return v9;
}

- (id)createVectorOfInt16WithCArray:(const signed __int16 *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5
{
  void *v9;
  void *v10;
  unint64_t v11;
  type *p_fbbStorage;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  if (!a3)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = &unk_24E437880;
  }
  else
  {
    if (a5 <= 2)
      v11 = 2;
    else
      v11 = a5;
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 2, v11);
    -[AFBBufferBuilder createVectorOfInt16WithCArray:count:](self, "createVectorOfInt16WithCArray:count:", a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (id)createVectorOfInt16WithCount:(unint64_t)a3 block:(id)a4
{
  void (**v7)(id, unint64_t, __int16 *);
  void *v8;
  void *v9;
  type *p_fbbStorage;
  unint64_t started;
  unint64_t v12;
  void *v13;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  __int16 v19[9];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, unint64_t, __int16 *))a4;
  if (!v7)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("block"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    started = apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 2uLL);
    if (a3)
    {
      v12 = a3 - 1;
      do
      {
        v19[0] = 0;
        v13 = (void *)MEMORY[0x2207C93E8](started);
        v7[2](v7, v12, v19);
        objc_autoreleasePoolPop(v13);
        started = apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<short>((uint64_t)p_fbbStorage, v19[0]);
        --v12;
      }
      while (v12 != -1);
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3));
  }

  return v9;
}

- (id)createVectorOfInt16WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  type *p_fbbStorage;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  v9 = a5;
  if (!v9)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("block"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = &unk_24E437880;
  }
  else
  {
    if (a4 <= 2)
      v12 = 2;
    else
      v12 = a4;
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 2, v12);
    -[AFBBufferBuilder createVectorOfInt16WithCount:block:](self, "createVectorOfInt16WithCount:block:", a3, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)createVectorOfUInt16WithArray:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  type *p_fbbStorage;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v15, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count"), 2uLL);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v5, "reverseObjectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v9);
          apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<short>((uint64_t)p_fbbStorage, objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "intValue"));
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count")));
  }

  return v7;
}

- (id)createVectorOfUInt16WithArray:(id)a3 alignment:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  type *p_fbbStorage;
  unint64_t v12;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;

  v7 = a3;
  if (!v7)
  {
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v15, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    v10 = objc_msgSend(v7, "count");
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    if (a4 <= 2)
      v12 = 2;
    else
      v12 = a4;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v10, 2, v12);
    -[AFBBufferBuilder createVectorOfUInt16WithArray:](self, "createVectorOfUInt16WithArray:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)createVectorOfUInt16WithCArray:(const unsigned __int16 *)a3 count:(unint64_t)a4
{
  void *v8;
  void *v9;
  type *p_fbbStorage;
  const unsigned __int16 *v11;
  unint64_t i;
  unint64_t v13;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  if (!a3)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 2uLL);
    v11 = a3 - 1;
    for (i = a4; i; i = v13)
    {
      v13 = i - 1;
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<short>((uint64_t)p_fbbStorage, v11[i]);
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4));
  }
  return v9;
}

- (id)createVectorOfUInt16WithCArray:(const unsigned __int16 *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5
{
  void *v9;
  void *v10;
  unint64_t v11;
  type *p_fbbStorage;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  if (!a3)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = &unk_24E437880;
  }
  else
  {
    if (a5 <= 2)
      v11 = 2;
    else
      v11 = a5;
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 2, v11);
    -[AFBBufferBuilder createVectorOfUInt16WithCArray:count:](self, "createVectorOfUInt16WithCArray:count:", a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (id)createVectorOfUInt16WithCount:(unint64_t)a3 block:(id)a4
{
  void (**v7)(id, unint64_t, __int16 *);
  void *v8;
  void *v9;
  type *p_fbbStorage;
  unint64_t started;
  unint64_t v12;
  void *v13;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  __int16 v19[9];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, unint64_t, __int16 *))a4;
  if (!v7)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("block"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    started = apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 2uLL);
    if (a3)
    {
      v12 = a3 - 1;
      do
      {
        v19[0] = 0;
        v13 = (void *)MEMORY[0x2207C93E8](started);
        v7[2](v7, v12, v19);
        objc_autoreleasePoolPop(v13);
        started = apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<short>((uint64_t)p_fbbStorage, v19[0]);
        --v12;
      }
      while (v12 != -1);
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3));
  }

  return v9;
}

- (id)createVectorOfUInt16WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  type *p_fbbStorage;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  v9 = a5;
  if (!v9)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("block"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = &unk_24E437880;
  }
  else
  {
    if (a4 <= 2)
      v12 = 2;
    else
      v12 = a4;
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 2, v12);
    -[AFBBufferBuilder createVectorOfUInt16WithCount:block:](self, "createVectorOfUInt16WithCount:block:", a3, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)createVectorOfInt32WithArray:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  type *p_fbbStorage;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v15, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count"), 4uLL);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v5, "reverseObjectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v9);
          apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<int>((uint64_t)p_fbbStorage, objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "intValue"));
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count")));
  }

  return v7;
}

- (id)createVectorOfInt32WithArray:(id)a3 alignment:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  type *p_fbbStorage;
  unint64_t v12;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;

  v7 = a3;
  if (!v7)
  {
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v15, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    v10 = objc_msgSend(v7, "count");
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    if (a4 <= 4)
      v12 = 4;
    else
      v12 = a4;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v10, 4, v12);
    -[AFBBufferBuilder createVectorOfInt32WithArray:](self, "createVectorOfInt32WithArray:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)createVectorOfInt32WithCArray:(const int *)a3 count:(unint64_t)a4
{
  void *v8;
  void *v9;
  type *p_fbbStorage;
  const int *v11;
  unint64_t i;
  unint64_t v13;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  if (!a3)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 4uLL);
    v11 = a3 - 1;
    for (i = a4; i; i = v13)
    {
      v13 = i - 1;
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<int>((uint64_t)p_fbbStorage, v11[i]);
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4));
  }
  return v9;
}

- (id)createVectorOfInt32WithCArray:(const int *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5
{
  void *v9;
  void *v10;
  unint64_t v11;
  type *p_fbbStorage;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  if (!a3)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = &unk_24E437880;
  }
  else
  {
    if (a5 <= 4)
      v11 = 4;
    else
      v11 = a5;
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 4, v11);
    -[AFBBufferBuilder createVectorOfInt32WithCArray:count:](self, "createVectorOfInt32WithCArray:count:", a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (id)createVectorOfInt32WithCount:(unint64_t)a3 block:(id)a4
{
  void (**v7)(id, unint64_t, int *);
  void *v8;
  void *v9;
  type *p_fbbStorage;
  unint64_t started;
  unint64_t v12;
  void *v13;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  int v19[5];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, unint64_t, int *))a4;
  if (!v7)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("block"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    started = apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 4uLL);
    if (a3)
    {
      v12 = a3 - 1;
      do
      {
        v19[0] = 0;
        v13 = (void *)MEMORY[0x2207C93E8](started);
        v7[2](v7, v12, v19);
        objc_autoreleasePoolPop(v13);
        started = apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<int>((uint64_t)p_fbbStorage, v19[0]);
        --v12;
      }
      while (v12 != -1);
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3));
  }

  return v9;
}

- (id)createVectorOfInt32WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  type *p_fbbStorage;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  v9 = a5;
  if (!v9)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("block"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = &unk_24E437880;
  }
  else
  {
    if (a4 <= 4)
      v12 = 4;
    else
      v12 = a4;
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 4, v12);
    -[AFBBufferBuilder createVectorOfInt32WithCount:block:](self, "createVectorOfInt32WithCount:block:", a3, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)createVectorOfUInt32WithArray:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  type *p_fbbStorage;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v15, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count"), 4uLL);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v5, "reverseObjectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v9);
          apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<int>((uint64_t)p_fbbStorage, objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "unsignedIntValue"));
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count")));
  }

  return v7;
}

- (id)createVectorOfUInt32WithArray:(id)a3 alignment:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  type *p_fbbStorage;
  unint64_t v12;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;

  v7 = a3;
  if (!v7)
  {
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v15, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    v10 = objc_msgSend(v7, "count");
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    if (a4 <= 4)
      v12 = 4;
    else
      v12 = a4;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v10, 4, v12);
    -[AFBBufferBuilder createVectorOfUInt32WithArray:](self, "createVectorOfUInt32WithArray:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)createVectorOfUInt32WithCArray:(const unsigned int *)a3 count:(unint64_t)a4
{
  void *v8;
  void *v9;
  type *p_fbbStorage;
  const unsigned int *v11;
  unint64_t i;
  unint64_t v13;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  if (!a3)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 4uLL);
    v11 = a3 - 1;
    for (i = a4; i; i = v13)
    {
      v13 = i - 1;
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<int>((uint64_t)p_fbbStorage, v11[i]);
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4));
  }
  return v9;
}

- (id)createVectorOfUInt32WithCArray:(const unsigned int *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5
{
  void *v9;
  void *v10;
  unint64_t v11;
  type *p_fbbStorage;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  if (!a3)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = &unk_24E437880;
  }
  else
  {
    if (a5 <= 4)
      v11 = 4;
    else
      v11 = a5;
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 4, v11);
    -[AFBBufferBuilder createVectorOfUInt32WithCArray:count:](self, "createVectorOfUInt32WithCArray:count:", a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (id)createVectorOfUInt32WithCount:(unint64_t)a3 block:(id)a4
{
  void (**v7)(id, unint64_t, int *);
  void *v8;
  void *v9;
  type *p_fbbStorage;
  unint64_t started;
  unint64_t v12;
  void *v13;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  int v19[5];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, unint64_t, int *))a4;
  if (!v7)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("block"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    started = apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 4uLL);
    if (a3)
    {
      v12 = a3 - 1;
      do
      {
        v19[0] = 0;
        v13 = (void *)MEMORY[0x2207C93E8](started);
        v7[2](v7, v12, v19);
        objc_autoreleasePoolPop(v13);
        started = apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<int>((uint64_t)p_fbbStorage, v19[0]);
        --v12;
      }
      while (v12 != -1);
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3));
  }

  return v9;
}

- (id)createVectorOfUInt32WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  type *p_fbbStorage;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  v9 = a5;
  if (!v9)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("block"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = &unk_24E437880;
  }
  else
  {
    if (a4 <= 4)
      v12 = 4;
    else
      v12 = a4;
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 4, v12);
    -[AFBBufferBuilder createVectorOfUInt32WithCount:block:](self, "createVectorOfUInt32WithCount:block:", a3, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)createVectorOfInt64WithArray:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  type *p_fbbStorage;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v15, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count"), 8uLL);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v5, "reverseObjectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v9);
          apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<long long>((uint64_t)p_fbbStorage, objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "longLongValue"));
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count")));
  }

  return v7;
}

- (id)createVectorOfInt64WithArray:(id)a3 alignment:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  type *p_fbbStorage;
  unint64_t v12;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;

  v7 = a3;
  if (!v7)
  {
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v15, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    v10 = objc_msgSend(v7, "count");
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    if (a4 <= 8)
      v12 = 8;
    else
      v12 = a4;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v10, 8, v12);
    -[AFBBufferBuilder createVectorOfInt64WithArray:](self, "createVectorOfInt64WithArray:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)createVectorOfInt64WithCArray:(const int64_t *)a3 count:(unint64_t)a4
{
  void *v8;
  void *v9;
  type *p_fbbStorage;
  const int64_t *v11;
  unint64_t i;
  unint64_t v13;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  if (!a3)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 8uLL);
    v11 = a3 - 1;
    for (i = a4; i; i = v13)
    {
      v13 = i - 1;
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<long long>((uint64_t)p_fbbStorage, v11[i]);
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4));
  }
  return v9;
}

- (id)createVectorOfInt64WithCArray:(const int64_t *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5
{
  void *v9;
  void *v10;
  unint64_t v11;
  type *p_fbbStorage;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  if (!a3)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = &unk_24E437880;
  }
  else
  {
    if (a5 <= 8)
      v11 = 8;
    else
      v11 = a5;
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 8, v11);
    -[AFBBufferBuilder createVectorOfInt64WithCArray:count:](self, "createVectorOfInt64WithCArray:count:", a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (id)createVectorOfInt64WithCount:(unint64_t)a3 block:(id)a4
{
  void (**v7)(id, unint64_t, uint64_t *);
  void *v8;
  void *v9;
  type *p_fbbStorage;
  unint64_t started;
  unint64_t v12;
  void *v13;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, unint64_t, uint64_t *))a4;
  if (!v7)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("block"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    started = apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 8uLL);
    if (a3)
    {
      v12 = a3 - 1;
      do
      {
        v19[0] = 0;
        v13 = (void *)MEMORY[0x2207C93E8](started);
        v7[2](v7, v12, v19);
        objc_autoreleasePoolPop(v13);
        started = apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<long long>((uint64_t)p_fbbStorage, v19[0]);
        --v12;
      }
      while (v12 != -1);
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3));
  }

  return v9;
}

- (id)createVectorOfInt64WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  type *p_fbbStorage;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  v9 = a5;
  if (!v9)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("block"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = &unk_24E437880;
  }
  else
  {
    if (a4 <= 8)
      v12 = 8;
    else
      v12 = a4;
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 8, v12);
    -[AFBBufferBuilder createVectorOfInt64WithCount:block:](self, "createVectorOfInt64WithCount:block:", a3, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)createVectorOfUInt64WithArray:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  type *p_fbbStorage;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v15, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count"), 8uLL);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    objc_msgSend(v5, "reverseObjectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v9);
          apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<long long>((uint64_t)p_fbbStorage, objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "unsignedLongLongValue"));
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v10);
    }

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count")));
  }

  return v7;
}

- (id)createVectorOfUInt64WithArray:(id)a3 alignment:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  type *p_fbbStorage;
  unint64_t v12;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;

  v7 = a3;
  if (!v7)
  {
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v15, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    v10 = objc_msgSend(v7, "count");
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    if (a4 <= 8)
      v12 = 8;
    else
      v12 = a4;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v10, 8, v12);
    -[AFBBufferBuilder createVectorOfUInt64WithArray:](self, "createVectorOfUInt64WithArray:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)createVectorOfUInt64WithCArray:(const unint64_t *)a3 count:(unint64_t)a4
{
  void *v8;
  void *v9;
  type *p_fbbStorage;
  const unint64_t *v11;
  unint64_t i;
  unint64_t v13;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  if (!a3)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 8uLL);
    v11 = a3 - 1;
    for (i = a4; i; i = v13)
    {
      v13 = i - 1;
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<long long>((uint64_t)p_fbbStorage, v11[i]);
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4));
  }
  return v9;
}

- (id)createVectorOfUInt64WithCArray:(const unint64_t *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5
{
  void *v9;
  void *v10;
  unint64_t v11;
  type *p_fbbStorage;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  if (!a3)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = &unk_24E437880;
  }
  else
  {
    if (a5 <= 8)
      v11 = 8;
    else
      v11 = a5;
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 8, v11);
    -[AFBBufferBuilder createVectorOfUInt64WithCArray:count:](self, "createVectorOfUInt64WithCArray:count:", a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (id)createVectorOfUInt64WithCount:(unint64_t)a3 block:(id)a4
{
  void (**v7)(id, unint64_t, uint64_t *);
  void *v8;
  void *v9;
  type *p_fbbStorage;
  unint64_t started;
  unint64_t v12;
  void *v13;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19[4];

  v19[3] = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, unint64_t, uint64_t *))a4;
  if (!v7)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("block"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    started = apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 8uLL);
    if (a3)
    {
      v12 = a3 - 1;
      do
      {
        v19[0] = 0;
        v13 = (void *)MEMORY[0x2207C93E8](started);
        v7[2](v7, v12, v19);
        objc_autoreleasePoolPop(v13);
        started = apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<long long>((uint64_t)p_fbbStorage, v19[0]);
        --v12;
      }
      while (v12 != -1);
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3));
  }

  return v9;
}

- (id)createVectorOfUInt64WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  type *p_fbbStorage;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  v9 = a5;
  if (!v9)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("block"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = &unk_24E437880;
  }
  else
  {
    if (a4 <= 8)
      v12 = 8;
    else
      v12 = a4;
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 8, v12);
    -[AFBBufferBuilder createVectorOfUInt64WithCount:block:](self, "createVectorOfUInt64WithCount:block:", a3, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)createVectorOfFloat32WithArray:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  type *p_fbbStorage;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  float v13;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count"), 4uLL);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v5, "reverseObjectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "floatValue");
          apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<float>((uint64_t)p_fbbStorage, v13);
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count")));
  }

  return v7;
}

- (id)createVectorOfFloat32WithArray:(id)a3 alignment:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  type *p_fbbStorage;
  unint64_t v12;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;

  v7 = a3;
  if (!v7)
  {
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v15, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    v10 = objc_msgSend(v7, "count");
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    if (a4 <= 4)
      v12 = 4;
    else
      v12 = a4;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v10, 4, v12);
    -[AFBBufferBuilder createVectorOfFloat32WithArray:](self, "createVectorOfFloat32WithArray:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)createVectorOfFloat32WithCArray:(const float *)a3 count:(unint64_t)a4
{
  void *v8;
  void *v9;
  type *p_fbbStorage;
  const float *v11;
  unint64_t i;
  unint64_t v13;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  if (!a3)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 4uLL);
    v11 = a3 - 1;
    for (i = a4; i; i = v13)
    {
      v13 = i - 1;
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<float>((uint64_t)p_fbbStorage, v11[i]);
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4));
  }
  return v9;
}

- (id)createVectorOfFloat32WithCArray:(const float *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5
{
  void *v9;
  void *v10;
  unint64_t v11;
  type *p_fbbStorage;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  if (!a3)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = &unk_24E437880;
  }
  else
  {
    if (a5 <= 4)
      v11 = 4;
    else
      v11 = a5;
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 4, v11);
    -[AFBBufferBuilder createVectorOfFloat32WithCArray:count:](self, "createVectorOfFloat32WithCArray:count:", a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (id)createVectorOfFloat32WithCount:(unint64_t)a3 block:(id)a4
{
  void (**v7)(id, unint64_t, float *);
  void *v8;
  void *v9;
  type *p_fbbStorage;
  unint64_t started;
  unint64_t v12;
  void *v13;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  float v19[5];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, unint64_t, float *))a4;
  if (!v7)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("block"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    started = apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 4uLL);
    if (a3)
    {
      v12 = a3 - 1;
      do
      {
        v19[0] = 0.0;
        v13 = (void *)MEMORY[0x2207C93E8](started);
        v7[2](v7, v12, v19);
        objc_autoreleasePoolPop(v13);
        started = apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<float>((uint64_t)p_fbbStorage, v19[0]);
        --v12;
      }
      while (v12 != -1);
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3));
  }

  return v9;
}

- (id)createVectorOfFloat32WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  type *p_fbbStorage;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  v9 = a5;
  if (!v9)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("block"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = &unk_24E437880;
  }
  else
  {
    if (a4 <= 4)
      v12 = 4;
    else
      v12 = a4;
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 4, v12);
    -[AFBBufferBuilder createVectorOfFloat32WithCount:block:](self, "createVectorOfFloat32WithCount:block:", a3, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)createVectorOfFloat64WithArray:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  type *p_fbbStorage;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  double v13;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count"), 8uLL);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v5, "reverseObjectEnumerator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "doubleValue");
          apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<double>((uint64_t)p_fbbStorage, v13);
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }

    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, objc_msgSend(v5, "count")));
  }

  return v7;
}

- (id)createVectorOfFloat64WithArray:(id)a3 alignment:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  type *p_fbbStorage;
  unint64_t v12;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;

  v7 = a3;
  if (!v7)
  {
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v15, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    v10 = objc_msgSend(v7, "count");
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    if (a4 <= 8)
      v12 = 8;
    else
      v12 = a4;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v10, 8, v12);
    -[AFBBufferBuilder createVectorOfFloat64WithArray:](self, "createVectorOfFloat64WithArray:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)createVectorOfFloat64WithCArray:(const double *)a3 count:(unint64_t)a4
{
  void *v8;
  void *v9;
  type *p_fbbStorage;
  const double *v11;
  unint64_t i;
  unint64_t v13;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  if (!a3)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 8uLL);
    v11 = a3 - 1;
    for (i = a4; i; i = v13)
    {
      v13 = i - 1;
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<double>((uint64_t)p_fbbStorage, v11[i]);
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4));
  }
  return v9;
}

- (id)createVectorOfFloat64WithCArray:(const double *)a3 count:(unint64_t)a4 alignment:(unint64_t)a5
{
  void *v9;
  void *v10;
  unint64_t v11;
  type *p_fbbStorage;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  if (!a3)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = &unk_24E437880;
  }
  else
  {
    if (a5 <= 8)
      v11 = 8;
    else
      v11 = a5;
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a4, 8, v11);
    -[AFBBufferBuilder createVectorOfFloat64WithCArray:count:](self, "createVectorOfFloat64WithCArray:count:", a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (id)createVectorOfFloat64WithCount:(unint64_t)a3 block:(id)a4
{
  void (**v7)(id, unint64_t, double *);
  void *v8;
  void *v9;
  type *p_fbbStorage;
  unint64_t started;
  unint64_t v12;
  void *v13;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  double v19[4];

  v19[3] = *(double *)MEMORY[0x24BDAC8D0];
  v7 = (void (**)(id, unint64_t, double *))a4;
  if (!v7)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("block"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    started = apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 8uLL);
    if (a3)
    {
      v12 = a3 - 1;
      do
      {
        v19[0] = 0.0;
        v13 = (void *)MEMORY[0x2207C93E8](started);
        v7[2](v7, v12, v19);
        objc_autoreleasePoolPop(v13);
        started = apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<double>((uint64_t)p_fbbStorage, v19[0]);
        --v12;
      }
      while (v12 != -1);
    }
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3));
  }

  return v9;
}

- (id)createVectorOfFloat64WithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  type *p_fbbStorage;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;

  v9 = a5;
  if (!v9)
  {
    v15 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v16, CFSTR("block"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v17, 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = &unk_24E437880;
  }
  else
  {
    if (a4 <= 8)
      v12 = 8;
    else
      v12 = a4;
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, 8, v12);
    -[AFBBufferBuilder createVectorOfFloat64WithCount:block:](self, "createVectorOfFloat64WithCount:block:", a3, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)createString:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder createString:alignment:](self, "createString:alignment:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)createString:(id)a3 alignment:(unint64_t)a4
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;

  v7 = a3;
  if (!v7)
  {
    v12 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v13, CFSTR("string"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v14, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v15);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  v8 = objc_retainAutorelease(v7);
  v9 = objc_msgSend(v8, "UTF8String");
  if (!v9)
  {
    v16 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "initWithFormat:", CFSTR("%@: string is not valid unicode: \"%@\"), v17, v8);

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v18, 0);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v19);
  }
  -[AFBBufferBuilder createStringWithCString:alignment:](self, "createStringWithCString:alignment:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)createStringWithCString:(const char *)a3
{
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  if (!a3)
  {
    v7 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v8, CFSTR("cString"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v9, 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  return -[AFBBufferBuilder createStringWithCString:alignment:](self, "createStringWithCString:alignment:", a3, 1);
}

- (id)createStringWithCString:(const char *)a3 alignment:(unint64_t)a4
{
  void *v8;
  void *v9;
  unint64_t v10;
  size_t v11;
  type *p_fbbStorage;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;

  if (!a3)
  {
    v14 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v15, CFSTR("cString"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v16, 0);
    v17 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v17);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    if (a4 <= 1)
      v10 = 1;
    else
      v10 = a4;
    v11 = strlen(a3);
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceStringAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v11, v10);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, a3, v11));
  }
  return v9;
}

- (id)createStringWithData:(id)a3
{
  id v5;
  void *v6;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;

  v5 = a3;
  if (!v5)
  {
    v8 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v9, CFSTR("data"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v10, 0);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v11);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder createStringWithData:alignment:](self, "createStringWithData:alignment:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)createStringWithData:(id)a3 alignment:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  type *p_fbbStorage;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  id v15;
  uint64_t String;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;

  v7 = a3;
  if (!v7)
  {
    v18 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v19, CFSTR("data"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v20, 0);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v21);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    v11 = objc_msgSend(v7, "length");
    if (a4 <= 1)
      v12 = 1;
    else
      v12 = a4;
    v13 = apple::aiml::flatbuffers2::FlatBufferBuilder::ForceStringAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v11, v12);
    v14 = (void *)MEMORY[0x2207C93E8](v13);
    v15 = objc_retainAutorelease(v7);
    String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, (const char *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"));
    objc_autoreleasePoolPop(v14);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", String);
  }

  return v9;
}

- (id)createVectorOfStringWithArray:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder createVectorOfStringWithArray:alignment:](self, "createVectorOfStringWithArray:alignment:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)createVectorOfStringWithArray:(id)a3 alignment:(unint64_t)a4
{
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  type *p_fbbStorage;
  void *v13;
  id v14;
  const char *v15;
  const char *v16;
  size_t v17;
  size_t v18;
  int String;
  int v20;
  char *v21;
  char *v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  char *v29;
  int v30;
  _BYTE *v31;
  char *v32;
  char *v33;
  char *v35;
  int v36;
  BOOL v37;
  uint64_t v38;
  void *v39;
  id v41;
  void *v42;
  uint64_t v43;
  id v44;
  id v45;
  void *v46;
  uint64_t v47;
  id v48;
  void *__p;
  char *v50;
  _QWORD v51[4];

  v51[3] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (!v7)
  {
    v45 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v46, CFSTR("array"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v47, 0);
    v48 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v48);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = &unk_24E437880;
  }
  else
  {
    if (a4 <= 1)
      v10 = 1;
    else
      v10 = a4;
    __p = 0;
    v50 = 0;
    v51[0] = 0;
    std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>::reserve(&__p, objc_msgSend(v7, "count"));
    v11 = objc_msgSend(v7, "count");
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    while (v11)
    {
      v13 = (void *)MEMORY[0x2207C93E8]();
      objc_msgSend(v7, "objectAtIndexedSubscript:", --v11);
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v15 = (const char *)objc_msgSend(v14, "UTF8String");
      v16 = v15;
      if (!v15)
      {
        v41 = objc_alloc(MEMORY[0x24BDD17C8]);
        NSStringFromSelector(a2);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v41, "initWithFormat:", CFSTR("%@: string is not valid unicode: \"%@\"), v42, v14);

        objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v43, 0);
        v44 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v44);
      }
      v17 = strlen(v15);
      apple::aiml::flatbuffers2::FlatBufferBuilder::ForceStringAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v17, v10);
      v18 = strlen(v16);
      String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v16, v18);
      v20 = String;
      v21 = v50;
      if ((unint64_t)v50 >= v51[0])
      {
        v23 = (char *)__p;
        v24 = (v50 - (_BYTE *)__p) >> 2;
        v25 = v24 + 1;
        if ((unint64_t)(v24 + 1) >> 62)
          std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>::__throw_length_error[abi:ne180100]();
        v26 = v51[0] - (_QWORD)__p;
        if ((uint64_t)(v51[0] - (_QWORD)__p) >> 1 > v25)
          v25 = v26 >> 1;
        if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFFCLL)
          v27 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v27 = v25;
        if (v27)
        {
          v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>((uint64_t)v51, v27);
          v23 = (char *)__p;
          v21 = v50;
        }
        else
        {
          v28 = 0;
        }
        v29 = &v28[4 * v24];
        *(_DWORD *)v29 = v20;
        v22 = v29 + 4;
        while (v21 != v23)
        {
          v30 = *((_DWORD *)v21 - 1);
          v21 -= 4;
          *((_DWORD *)v29 - 1) = v30;
          v29 -= 4;
        }
        __p = v29;
        v50 = v22;
        v51[0] = &v28[4 * v27];
        if (v23)
          operator delete(v23);
      }
      else
      {
        *(_DWORD *)v50 = String;
        v22 = v21 + 4;
      }
      v50 = v22;

      objc_autoreleasePoolPop(v13);
    }
    v31 = __p;
    v32 = v50;
    v33 = v50 - 4;
    if (__p != v50 && v33 > __p)
    {
      v35 = (char *)__p + 4;
      do
      {
        v36 = *((_DWORD *)v35 - 1);
        *((_DWORD *)v35 - 1) = *(_DWORD *)v33;
        *(_DWORD *)v33 = v36;
        v33 -= 4;
        v37 = v35 >= v33;
        v35 += 4;
      }
      while (!v37);
    }
    v38 = v32 - v31;
    if (v38)
      v39 = v31;
    else
      v39 = &apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, (uint64_t)v39, v38 >> 2));
    if (__p)
    {
      v50 = (char *)__p;
      operator delete(__p);
    }
  }

  return v9;
}

- (id)createVectorOfStringWithCount:(unint64_t)a3 block:(id)a4
{
  id v7;
  void *v8;

  v7 = a4;
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder createVectorOfStringWithCount:alignment:block:](self, "createVectorOfStringWithCount:alignment:block:", a3, 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)createVectorOfStringWithCount:(unint64_t)a3 alignment:(unint64_t)a4 block:(id)a5
{
  void (**v9)(id, unint64_t);
  void *v10;
  void *v11;
  unint64_t v12;
  type *p_fbbStorage;
  void *v14;
  id v15;
  const char *v16;
  const char *v17;
  size_t v18;
  size_t v19;
  int String;
  int v21;
  char *v22;
  char *v23;
  char *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  char *v30;
  int v31;
  _BYTE *v32;
  char *v33;
  char *v34;
  char *v36;
  int v37;
  BOOL v38;
  uint64_t v39;
  void *v40;
  id v42;
  void *v43;
  uint64_t v44;
  id v45;
  const char *v46;
  id v47;
  void *v48;
  uint64_t v49;
  id v50;
  const char *aSelector;
  void *__p;
  char *v53;
  _QWORD v54[4];

  v54[3] = *MEMORY[0x24BDAC8D0];
  v9 = (void (**)(id, unint64_t))a5;
  if (!v9)
  {
    v46 = a2;
    v47 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(v46);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v47, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v48, CFSTR("block"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v49, 0);
    v50 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v50);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = &unk_24E437880;
  }
  else
  {
    aSelector = a2;
    if (a4 <= 1)
      v12 = 1;
    else
      v12 = a4;
    __p = 0;
    v53 = 0;
    v54[0] = 0;
    std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>::reserve(&__p, a3);
    if (self)
      p_fbbStorage = &self->_fbbStorage;
    else
      p_fbbStorage = 0;
    while (a3)
    {
      v14 = (void *)MEMORY[0x2207C93E8]();
      v9[2](v9, --a3);
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v16 = (const char *)objc_msgSend(v15, "UTF8String");
      v17 = v16;
      if (!v16)
      {
        v42 = objc_alloc(MEMORY[0x24BDD17C8]);
        NSStringFromSelector(aSelector);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = objc_msgSend(v42, "initWithFormat:", CFSTR("%@: string is not valid unicode: \"%@\"), v43, v15);

        objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v44, 0);
        v45 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v45);
      }
      v18 = strlen(v16);
      apple::aiml::flatbuffers2::FlatBufferBuilder::ForceStringAlignment((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v18, v12);
      v19 = strlen(v17);
      String = apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, v17, v19);
      v21 = String;
      v22 = v53;
      if ((unint64_t)v53 >= v54[0])
      {
        v24 = (char *)__p;
        v25 = (v53 - (_BYTE *)__p) >> 2;
        v26 = v25 + 1;
        if ((unint64_t)(v25 + 1) >> 62)
          std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>::__throw_length_error[abi:ne180100]();
        v27 = v54[0] - (_QWORD)__p;
        if ((uint64_t)(v54[0] - (_QWORD)__p) >> 1 > v26)
          v26 = v27 >> 1;
        if ((unint64_t)v27 >= 0x7FFFFFFFFFFFFFFCLL)
          v28 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v28 = v26;
        if (v28)
        {
          v29 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>((uint64_t)v54, v28);
          v24 = (char *)__p;
          v22 = v53;
        }
        else
        {
          v29 = 0;
        }
        v30 = &v29[4 * v25];
        *(_DWORD *)v30 = v21;
        v23 = v30 + 4;
        while (v22 != v24)
        {
          v31 = *((_DWORD *)v22 - 1);
          v22 -= 4;
          *((_DWORD *)v30 - 1) = v31;
          v30 -= 4;
        }
        __p = v30;
        v53 = v23;
        v54[0] = &v29[4 * v28];
        if (v24)
          operator delete(v24);
      }
      else
      {
        *(_DWORD *)v53 = String;
        v23 = v22 + 4;
      }
      v53 = v23;

      objc_autoreleasePoolPop(v14);
    }
    v32 = __p;
    v33 = v53;
    v34 = v53 - 4;
    if (__p != v53 && v34 > __p)
    {
      v36 = (char *)__p + 4;
      do
      {
        v37 = *((_DWORD *)v36 - 1);
        *((_DWORD *)v36 - 1) = *(_DWORD *)v34;
        *(_DWORD *)v34 = v37;
        v34 -= 4;
        v38 = v36 >= v34;
        v36 += 4;
      }
      while (!v38);
    }
    v39 = v33 - v32;
    if (v39)
      v40 = v32;
    else
      v40 = &apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>((apple::aiml::flatbuffers2::FlatBufferBuilder *)p_fbbStorage, (uint64_t)v40, v39 >> 2));
    if (__p)
    {
      v53 = (char *)__p;
      operator delete(__p);
    }
  }

  return v11;
}

- (id)createVectorOfStringWithOffsets:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  id v12;
  int v13;
  int v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  char *v23;
  int v24;
  _BYTE *v25;
  char *v26;
  char *v27;
  char *v28;
  int v29;
  BOOL v30;
  apple::aiml::flatbuffers2::FlatBufferBuilder *p_fbbStorage;
  uint64_t v32;
  void *v33;
  id v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *context;
  AFBBufferBuilder *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  void *__p;
  char *v47;
  char *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    v35 = objc_alloc(MEMORY[0x24BDD17C8]);
    NSStringFromSelector(a2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "initWithFormat:", CFSTR("%@: Invalid parameter not satisfying: %@ != nil"), v36, CFSTR("offsets"));

    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v37, 0);
    v38 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v38);
  }
  -[AFBBufferBuilder throwIfFinalizedWithSelector:](self, "throwIfFinalizedWithSelector:", a2);
  -[AFBBufferBuilder firstError](self, "firstError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = &unk_24E437880;
  }
  else
  {
    v40 = self;
    v41 = v5;
    __p = 0;
    v47 = 0;
    v48 = 0;
    std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>::reserve(&__p, objc_msgSend(v5, "count"));
    context = (void *)MEMORY[0x2207C93E8]();
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v5, "reverseObjectEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v43 != v10)
            objc_enumerationMutation(v8);
          v12 = *(id *)(*((_QWORD *)&v42 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "unsignedIntValue");
          v14 = v13;
          v15 = v47;
          if (v47 >= v48)
          {
            v17 = (char *)__p;
            v18 = (v47 - (_BYTE *)__p) >> 2;
            v19 = v18 + 1;
            if ((unint64_t)(v18 + 1) >> 62)
              std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>::__throw_length_error[abi:ne180100]();
            v20 = v48 - (_BYTE *)__p;
            if ((v48 - (_BYTE *)__p) >> 1 > v19)
              v19 = v20 >> 1;
            if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFFCLL)
              v21 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v21 = v19;
            if (v21)
            {
              v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>((uint64_t)&v48, v21);
              v17 = (char *)__p;
              v15 = v47;
            }
            else
            {
              v22 = 0;
            }
            v23 = &v22[4 * v18];
            *(_DWORD *)v23 = v14;
            v16 = v23 + 4;
            while (v15 != v17)
            {
              v24 = *((_DWORD *)v15 - 1);
              v15 -= 4;
              *((_DWORD *)v23 - 1) = v24;
              v23 -= 4;
            }
            __p = v23;
            v47 = v16;
            v48 = &v22[4 * v21];
            if (v17)
              operator delete(v17);
          }
          else
          {
            *(_DWORD *)v47 = v13;
            v16 = v15 + 4;
          }
          v47 = v16;

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
      }
      while (v9);
    }

    objc_autoreleasePoolPop(context);
    v25 = __p;
    v26 = v47;
    v5 = v41;
    if (__p != v47)
    {
      v27 = v47 - 4;
      if (v47 - 4 > __p)
      {
        v28 = (char *)__p + 4;
        do
        {
          v29 = *((_DWORD *)v28 - 1);
          *((_DWORD *)v28 - 1) = *(_DWORD *)v27;
          *(_DWORD *)v27 = v29;
          v27 -= 4;
          v30 = v28 >= v27;
          v28 += 4;
        }
        while (!v30);
      }
    }
    if (v40)
      p_fbbStorage = (apple::aiml::flatbuffers2::FlatBufferBuilder *)&v40->_fbbStorage;
    else
      p_fbbStorage = 0;
    v32 = v26 - v25;
    if (v32)
      v33 = v25;
    else
      v33 = &apple::aiml::flatbuffers2::data<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>> const&)::t;
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedInt:", apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>(p_fbbStorage, (uint64_t)v33, v32 >> 2));
    if (__p)
    {
      v47 = (char *)__p;
      operator delete(__p);
    }
  }

  return v7;
}

- (NSString)path
{
  return self->_path;
}

- (NSError)firstError
{
  return self->_firstError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstError, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
