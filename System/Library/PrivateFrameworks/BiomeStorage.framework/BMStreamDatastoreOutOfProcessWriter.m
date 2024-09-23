@implementation BMStreamDatastoreOutOfProcessWriter

- (BMStreamDatastoreOutOfProcessWriter)initWithStream:(id)a3 user:(unsigned int)a4
{
  return -[BMStreamDatastoreOutOfProcessWriter initWithStream:user:eventDataClass:](self, "initWithStream:user:eventDataClass:", a3, *(_QWORD *)&a4, 0);
}

- (BMStreamDatastoreOutOfProcessWriter)initWithStream:(id)a3 user:(unsigned int)a4 eventDataClass:(Class)a5
{
  id v8;
  BMStreamDatastoreOutOfProcessWriter *v9;
  BMStreamDatastoreOutOfProcessWriter *v10;
  uint64_t v11;
  NSString *streamIdentifier;
  objc_super v14;

  v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BMStreamDatastoreOutOfProcessWriter;
  v9 = -[BMStreamDatastoreOutOfProcessWriter init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_class = a5;
    v9->_user = a4;
    v11 = objc_msgSend(v8, "copy");
    streamIdentifier = v10->_streamIdentifier;
    v10->_streamIdentifier = (NSString *)v11;

    v10->_lock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (BOOL)writeEventWithEventBody:(id)a3 timestamp:(double)a4 outEventSize:(unint64_t *)a5
{
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  os_unfair_lock_s *p_lock;
  Class v13;
  NSObject *v14;
  BOOL v15;
  BMWriteService *writeService;
  BMWriteService *v17;
  BMWriteService *v18;
  BMWriteService *v19;
  NSString *streamIdentifier;
  uint64_t user;
  NSObject *v22;
  id v24;

  v8 = a3;
  v9 = (void *)MEMORY[0x1AF4163D4]();
  objc_msgSend(v8, "serialize");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "dataVersion");
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v13 = self->_class;
  if (v13)
  {
    if ((-[objc_class isEqual:](v13, "isEqual:", objc_opt_class()) & 1) == 0)
    {
      __biome_log_for_category();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[BMStreamDatastoreOutOfProcessWriter writeEventWithEventBody:timestamp:outEventSize:].cold.2(v14);
      v15 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    self->_class = (Class)objc_opt_class();
  }
  writeService = self->_writeService;
  if (!writeService)
  {
    v17 = [BMWriteService alloc];
    v18 = -[BMWriteService initWithUseCase:](v17, "initWithUseCase:", *MEMORY[0x1E0D01CB8]);
    v19 = self->_writeService;
    self->_writeService = v18;

    writeService = self->_writeService;
  }
  streamIdentifier = self->_streamIdentifier;
  user = self->_user;
  v24 = 0;
  v15 = -[BMWriteService writeData:version:timestamp:toStream:asUser:error:](writeService, "writeData:version:timestamp:toStream:asUser:error:", v10, v11, streamIdentifier, user, &v24, a4);
  v14 = v24;
  if (v15)
  {
    if (a5)
      *a5 = objc_msgSend(v10, "length");
  }
  else
  {
    __biome_log_for_category();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[BMStreamDatastoreOutOfProcessWriter writeEventWithEventBody:timestamp:outEventSize:].cold.1((uint64_t)v14, v22);

  }
LABEL_15:

  os_unfair_lock_unlock(p_lock);
  objc_autoreleasePoolPop(v9);

  return v15;
}

- (BOOL)isDataAccessible
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_writeService, 0);
  objc_storeStrong((id *)&self->_streamIdentifier, 0);
}

- (void)writeEventWithEventBody:(uint64_t)a1 timestamp:(NSObject *)a2 outEventSize:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1A95BD000, a2, OS_LOG_TYPE_ERROR, "Out of process write failed with error: %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)writeEventWithEventBody:(os_log_t)log timestamp:outEventSize:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A95BD000, log, OS_LOG_TYPE_ERROR, "Out of process write failed, wrong class", v1, 2u);
}

@end
