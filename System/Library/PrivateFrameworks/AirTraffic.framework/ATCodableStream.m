@implementation ATCodableStream

- (ATCodableStream)init
{
  ATCodableStream *v2;
  objc_class *v3;
  const char *Name;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATCodableStream;
  v2 = -[ATCodableStream init](&v8, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    v5 = dispatch_queue_create(Name, 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (ATCodableStream)initWithInputStream:(id)a3
{
  id v6;
  ATCodableStream *v7;
  void *v8;
  MSVStreamReader *reader;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSFileHandle *fileHandleForReading;
  uint64_t v15;
  id v16;
  id v17;
  ATCodableStream *v18;
  id v19;
  void *v21;
  _QWORD v22[4];
  id v23;
  ATCodableStream *v24;
  _QWORD v25[4];
  id v26;
  ATCodableStream *v27;
  _QWORD v28[4];
  id v29;

  v6 = a3;
  v7 = -[ATCodableStream init](self, "init");
  if (v7)
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("ATCodableStream.m"), 37, CFSTR("inputStream cannot be nil"));

    }
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE65CA8]), "initWithInputStream:queue:", v6, 0);
    objc_msgSend(v8, "setMaximumBufferSize:", NSPageSize());
    reader = v7->_reader;
    v7->_reader = (MSVStreamReader *)v8;
    v10 = v8;

    objc_storeStrong((id *)&v7->_inputStream, a3);
    objc_msgSend(MEMORY[0x24BDD1740], "pipe");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileHandleForWriting");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fileHandleForReading");
    v13 = objc_claimAutoreleasedReturnValue();
    fileHandleForReading = v7->_fileHandleForReading;
    v7->_fileHandleForReading = (NSFileHandle *)v13;

    v15 = MEMORY[0x24BDAC760];
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __39__ATCodableStream_initWithInputStream___block_invoke;
    v28[3] = &unk_24C4C9D98;
    v16 = v12;
    v29 = v16;
    objc_msgSend(v10, "setDidReadDataBlock:", v28);
    v25[0] = v15;
    v25[1] = 3221225472;
    v25[2] = __39__ATCodableStream_initWithInputStream___block_invoke_2;
    v25[3] = &unk_24C4CA350;
    v17 = v16;
    v26 = v17;
    v18 = v7;
    v27 = v18;
    objc_msgSend(v10, "setDidFinishReadingBlock:", v25);
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __39__ATCodableStream_initWithInputStream___block_invoke_3;
    v22[3] = &unk_24C4C9DC0;
    v23 = v17;
    v24 = v18;
    v19 = v17;
    objc_msgSend(v10, "setDidEncounterErrorBlock:", v22);
    objc_msgSend(v10, "start");

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[NSFileHandle closeFile](self->_fileHandleForReading, "closeFile");
  v3.receiver = self;
  v3.super_class = (Class)ATCodableStream;
  -[ATCodableStream dealloc](&v3, sel_dealloc);
}

- (ATCodableStream)initWithCoder:(id)a3
{
  id v4;
  ATCodableStream *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSInputStream *inputStream;
  int v10;
  dispatch_source_t v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  _QWORD v16[4];
  int v17;
  _QWORD handler[4];
  id v19;
  dispatch_source_t v20;
  int v21;

  v4 = a3;
  v5 = -[ATCodableStream init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fileHandleForReading"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE65CB0]), "initWithQueue:", 0);
    objc_msgSend(v7, "start");
    objc_msgSend(v7, "inputStream");
    v8 = objc_claimAutoreleasedReturnValue();
    inputStream = v5->_inputStream;
    v5->_inputStream = (NSInputStream *)v8;

    objc_storeStrong((id *)&v5->_writer, v7);
    v10 = dup(objc_msgSend(v6, "fileDescriptor"));
    v11 = dispatch_source_create(MEMORY[0x24BDACA00], v10, 0, (dispatch_queue_t)v5->_queue);
    v12 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __33__ATCodableStream_initWithCoder___block_invoke;
    handler[3] = &unk_24C4C9DE8;
    v21 = v10;
    v19 = v7;
    v20 = v11;
    v13 = v11;
    v14 = v7;
    dispatch_source_set_event_handler(v13, handler);
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __33__ATCodableStream_initWithCoder___block_invoke_2;
    v16[3] = &__block_descriptor_36_e5_v8__0l;
    v17 = v10;
    dispatch_source_set_cancel_handler(v13, v16);
    dispatch_resume(v13);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_fileHandleForReading, CFSTR("fileHandleForReading"));
}

- (NSInputStream)inputStream
{
  return self->_inputStream;
}

- (NSFileHandle)fileHandleForReading
{
  return self->_fileHandleForReading;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandleForReading, 0);
  objc_storeStrong((id *)&self->_inputStream, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_writer, 0);
  objc_storeStrong((id *)&self->_reader, 0);
}

void __33__ATCodableStream_initWithCoder___block_invoke(uint64_t a1)
{
  size_t v2;
  void *v3;
  ssize_t v4;
  id v5;

  v2 = NSPageSize();
  v3 = malloc_type_malloc(v2, 0x740AC6D8uLL);
  v4 = read(*(_DWORD *)(a1 + 48), v3, v2);
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytesNoCopy:length:freeWhenDone:", v3, v4, 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "writeAllData:error:", v5, 0);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "stop");
    free(v3);
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
    dispatch_source_set_event_handler(*(dispatch_source_t *)(a1 + 40), 0);
  }
}

uint64_t __33__ATCodableStream_initWithCoder___block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

uint64_t __39__ATCodableStream_initWithInputStream___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeData:", a2);
}

uint64_t __39__ATCodableStream_initWithInputStream___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "closeFile");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setDidReadDataBlock:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setDidEncounterErrorBlock:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setDidFinishReadingBlock:", 0);
}

uint64_t __39__ATCodableStream_initWithInputStream___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "closeFile");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setDidReadDataBlock:", 0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setDidFinishReadingBlock:", 0);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setDidEncounterErrorBlock:", 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
