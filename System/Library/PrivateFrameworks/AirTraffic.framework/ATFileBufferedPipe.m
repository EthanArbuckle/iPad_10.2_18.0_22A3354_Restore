@implementation ATFileBufferedPipe

- (ATFileBufferedPipe)init
{
  id v2;
  objc_class *v3;
  const char *Name;
  dispatch_queue_t v5;
  void *v6;
  ATFileBuffer *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  void *v20;
  int v21;
  dispatch_source_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  int v26;
  dispatch_source_t v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  _QWORD v32[4];
  NSObject *v33;
  id v34;
  _QWORD handler[4];
  NSObject *v36;
  id v37;
  id location;
  objc_super v39;

  v39.receiver = self;
  v39.super_class = (Class)ATFileBufferedPipe;
  v2 = -[ATFileBufferedPipe init](&v39, sel_init);
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    Name = class_getName(v3);
    v5 = dispatch_queue_create(Name, 0);
    v6 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v5;

    v7 = objc_alloc_init(ATFileBuffer);
    v8 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v7;

    objc_msgSend(MEMORY[0x24BDD1740], "pipe");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v9;

    objc_msgSend(MEMORY[0x24BDD1740], "pipe");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v11;

    objc_msgSend(*((id *)v2 + 4), "fileHandleForReading");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = v13;

    objc_msgSend(*((id *)v2 + 3), "fileHandleForWriting");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)*((_QWORD *)v2 + 9);
    *((_QWORD *)v2 + 9) = v15;

    objc_msgSend(*((id *)v2 + 4), "fileHandleForWriting");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "fileDescriptor");

    v19 = fcntl(v18, 3);
    fcntl(v18, 4, v19 | 4u);
    *((_WORD *)v2 + 28) = 0;
    objc_initWeak(&location, v2);
    objc_msgSend(*((id *)v2 + 4), "fileHandleForWriting");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "fileDescriptor");
    v22 = dispatch_source_create(MEMORY[0x24BDACA30], v21, 0, *((dispatch_queue_t *)v2 + 2));

    v23 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __26__ATFileBufferedPipe_init__block_invoke;
    handler[3] = &unk_24C4C9D70;
    v24 = v22;
    v36 = v24;
    objc_copyWeak(&v37, &location);
    dispatch_source_set_event_handler(v24, handler);
    objc_storeStrong((id *)v2 + 5, v22);
    dispatch_resume(*((dispatch_object_t *)v2 + 5));
    objc_msgSend(*((id *)v2 + 3), "fileHandleForReading");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "fileDescriptor");
    v27 = dispatch_source_create(MEMORY[0x24BDACA00], v26, 0, *((dispatch_queue_t *)v2 + 2));

    v32[0] = v23;
    v32[1] = 3221225472;
    v32[2] = __26__ATFileBufferedPipe_init__block_invoke_2;
    v32[3] = &unk_24C4C9D70;
    v28 = v27;
    v33 = v28;
    objc_copyWeak(&v34, &location);
    dispatch_source_set_event_handler(v28, v32);
    v29 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v28;
    v30 = v28;

    dispatch_resume(*((dispatch_object_t *)v2 + 6));
    objc_destroyWeak(&v34);

    objc_destroyWeak(&v37);
    objc_destroyWeak(&location);
  }
  return (ATFileBufferedPipe *)v2;
}

- (void)_outputReadyForWriting:(unint64_t)a3
{
  void *v5;
  id v6;

  if (!a3)
    dispatch_source_cancel((dispatch_source_t)self->_writeSource);
  self->_readyForData = 1;
  if (-[ATFileBuffer length](self->_buffer, "length"))
  {
    -[ATFileBuffer readDataOfLength:](self->_buffer, "readDataOfLength:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[ATFileBufferedPipe _bufferedWrite:](self, "_bufferedWrite:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATFileBuffer rewindData:](self->_buffer, "rewindData:", v5);

  }
  else
  {
    if (!self->_readyToClose)
      return;
    -[NSPipe fileHandleForWriting](self->_outputPipe, "fileHandleForWriting");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "closeFile");
  }

}

- (void)_inputReadyForReading:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  if (a3)
  {
    -[NSPipe fileHandleForReading](self->_inputPipe, "fileHandleForReading");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "readDataOfLength:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (self->_readyForData)
    {
      -[ATFileBufferedPipe _bufferedWrite:](self, "_bufferedWrite:", v7);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATFileBuffer appendData:](self->_buffer, "appendData:", v6);

    }
    else
    {
      -[ATFileBuffer appendData:](self->_buffer, "appendData:", v7);
    }
  }
  else
  {
    dispatch_source_cancel((dispatch_source_t)self->_readSource);
    if (-[ATFileBuffer length](self->_buffer, "length"))
    {
      self->_readyToClose = 1;
      return;
    }
    -[NSPipe fileHandleForWriting](self->_outputPipe, "fileHandleForWriting");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "closeFile");
  }

}

- (id)_bufferedWrite:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;
  ssize_t v8;

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithData:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  while (self->_readyForData && objc_msgSend(v4, "length"))
  {
    -[NSPipe fileHandleForWriting](self->_outputPipe, "fileHandleForWriting");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "fileDescriptor");
    v7 = objc_retainAutorelease(v4);
    v8 = write(v6, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"));

    if (v8 < 1)
    {
      if (*__error() == 35)
      {
        self->_readyForData = 0;
        return v4;
      }
    }
    else
    {
      objc_msgSend(v7, "replaceBytesInRange:withBytes:length:", 0, v8, 0, 0);
    }
  }
  return v4;
}

- (NSFileHandle)fileHandleForReading
{
  return self->_fileHandleForReading;
}

- (NSFileHandle)fileHandleForWriting
{
  return self->_fileHandleForWriting;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileHandleForWriting, 0);
  objc_storeStrong((id *)&self->_fileHandleForReading, 0);
  objc_storeStrong((id *)&self->_readSource, 0);
  objc_storeStrong((id *)&self->_writeSource, 0);
  objc_storeStrong((id *)&self->_outputPipe, 0);
  objc_storeStrong((id *)&self->_inputPipe, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

void __26__ATFileBufferedPipe_init__block_invoke(uint64_t a1)
{
  uintptr_t data;
  id WeakRetained;

  data = dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_outputReadyForWriting:", data);

}

void __26__ATFileBufferedPipe_init__block_invoke_2(uint64_t a1)
{
  uintptr_t data;
  id WeakRetained;

  data = dispatch_source_get_data(*(dispatch_source_t *)(a1 + 32));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_inputReadyForReading:", data);

}

+ (id)pipe
{
  return objc_alloc_init((Class)objc_opt_class());
}

@end
