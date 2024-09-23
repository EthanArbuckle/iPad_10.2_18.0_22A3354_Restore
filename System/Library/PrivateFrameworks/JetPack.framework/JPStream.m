@implementation JPStream

- (JPStream)initWithBacking:(JetPackStream *)a3 releaseOnDealloc:(BOOL)a4
{
  JPStream *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)JPStream;
  result = -[JPStream init](&v7, sel_init);
  if (result)
  {
    result->_backing = a3;
    result->_releaseBackingOnDealloc = a4;
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  if (-[JPStream releaseBackingOnDealloc](self, "releaseBackingOnDealloc"))
    JetPackStreamDestroy((uint64_t)-[JPStream backing](self, "backing"));
  v3.receiver = self;
  v3.super_class = (Class)JPStream;
  -[JPStream dealloc](&v3, sel_dealloc);
}

- (BOOL)releaseBackingOnDealloc
{
  return self->_releaseBackingOnDealloc;
}

- (id)readData
{
  id v3;
  void *v4;
  JetPackStream *v5;
  id v6;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 2048);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((JetPackStreamIsFinished((uint64_t *)-[JPStream backing](self, "backing")) & 1) == 0)
  {
    do
    {
      v5 = -[JPStream backing](self, "backing");
      v6 = objc_retainAutorelease(v4);
      objc_msgSend(v6, "mutableBytes");
      objc_msgSend(v6, "length");
      objc_msgSend(v3, "appendBytes:length:", objc_msgSend(objc_retainAutorelease(v6), "mutableBytes"), JetPackStreamRead((uint64_t *)v5));
    }
    while (!JetPackStreamIsFinished((uint64_t *)-[JPStream backing](self, "backing")));
  }

  return v3;
}

- (JetPackStream)backing
{
  return self->_backing;
}

- (unint64_t)readBytes:(char *)a3 length:(unint64_t)a4
{
  return JetPackStreamRead((uint64_t *)-[JPStream backing](self, "backing"));
}

- (id)readDataWithLength:(unint64_t)a3
{
  void *v4;
  JetPackStream *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[JPStream backing](self, "backing");
  v6 = objc_retainAutorelease(v4);
  objc_msgSend(v6, "mutableBytes");
  objc_msgSend(v6, "setLength:", JetPackStreamRead((uint64_t *)v5));
  return v6;
}

- (BOOL)writeToFile:(id)a3 blockSize:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  id v10;
  char IsFinished;
  JetPackStream *v12;
  id v13;
  id v14;
  id v16;

  objc_msgSend(MEMORY[0x24BDD1578], "fileHandleForWritingAtPath:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  while (1)
  {
    IsFinished = JetPackStreamIsFinished((uint64_t *)-[JPStream backing](self, "backing"));
    if ((IsFinished & 1) != 0)
      break;
    v12 = -[JPStream backing](self, "backing");
    v13 = objc_retainAutorelease(v9);
    objc_msgSend(v13, "mutableBytes");
    objc_msgSend(v13, "length");
    objc_msgSend(v13, "setLength:", JetPackStreamRead((uint64_t *)v12));
    v16 = 0;
    objc_msgSend(v8, "writeData:error:", v13, &v16);
    v14 = v16;

    v10 = v14;
    if (a5)
    {
      v10 = v14;
      if (v14)
      {
        v10 = objc_retainAutorelease(v14);
        *a5 = v10;
        break;
      }
    }
  }

  return IsFinished;
}

@end
