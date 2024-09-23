@implementation JPReader

- (void).cxx_destruct
{
  objc_storeStrong(&self->_keyForIdentifier, 0);
  objc_storeStrong(&self->_dataSegmentFound, 0);
  objc_storeStrong(&self->_fileEntryFound, 0);
}

- (id)dataSegmentFound
{
  return self->_dataSegmentFound;
}

- (id)fileEntryFound
{
  return self->_fileEntryFound;
}

- (void)setKeyForIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setFileEntryFound:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setDataSegmentFound:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)keyForIdentifier
{
  return self->_keyForIdentifier;
}

- (void)dealloc
{
  objc_super v3;

  JetPackReaderDestroy((uint64_t)-[JPReader backing](self, "backing"));
  v3.receiver = self;
  v3.super_class = (Class)JPReader;
  -[JPReader dealloc](&v3, sel_dealloc);
}

- (BOOL)processStream:(id)a3 signatureVerifier:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  char v7;
  id v10;
  id v11;
  JetPackReader *v12;
  uint64_t *v13;
  uint64_t *v14;
  char v15;
  BOOL v16;

  v7 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[JPReader backing](self, "backing");
  v13 = (uint64_t *)objc_msgSend(v11, "backing");

  v14 = (uint64_t *)objc_msgSend(v10, "backing");
  v15 = JetPackReaderProcess((uint64_t *)v12, v13, v14, v7);
  v16 = v15;
  if (a6 && (v15 & 1) == 0)
  {
    -[JPReader convertError](self, "convertError");
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v16;
}

- (JetPackReader)backing
{
  return self->_backing;
}

- (JPReader)init
{
  id v2;
  uint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)JPReader;
  v2 = -[JPReader init](&v5, sel_init);
  if (v2)
  {
    v3 = JetPackReaderCreate();
    *((_QWORD *)v2 + 4) = v3;
    JetPackReaderSetProperty(v3, 0, (uint64_t)v2);
    JetPackReaderSetFileEntryFoundCallback(*((uint64_t **)v2 + 4), (uint64_t)fileEntryFound);
    JetPackReaderSetDataSegmentFoundCallback(*((uint64_t **)v2 + 4), (uint64_t)dataSegmentFound);
    JetPackReaderSetKeyForIdentifierCallback(*((uint64_t **)v2 + 4), (uint64_t)keyForIdentifier);
  }
  return (JPReader *)v2;
}

- (id)convertError
{
  uint64_t ErrorMessage;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  const __CFString *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  ErrorMessage = JetPackReaderGetErrorMessage((uint64_t)-[JPReader backing](self, "backing"));
  if (ErrorMessage && (v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", ErrorMessage)) != 0)
  {
    v4 = (void *)v3;
    v5 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BDD0FC8];
    v13[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("JPErrorDomain"), 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x24BDD1540];
    v10 = *MEMORY[0x24BDD0FC8];
    v11 = CFSTR("An unknown error occurred");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("JPErrorDomain"), 0, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)setBacking:(JetPackReader *)a3
{
  self->_backing = a3;
}

@end
