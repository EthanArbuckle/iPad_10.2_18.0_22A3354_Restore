@implementation DYCaptureFile

- (DYCaptureFile)init
{
  -[DYCaptureFile doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (id)_initWithArchive:(id)a3 hashPosition:(unsigned int)a4 name:(id)a5
{
  DYCaptureFile *v8;
  DYCaptureFile *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)DYCaptureFile;
  v8 = -[DYCaptureFile init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_archive = (DYCaptureArchive *)a3;
    objc_msgSend(a3, "_fileObjectDidInitialize");
    v9->_file_pos = *(_DWORD *)(objc_msgSend(a3, "_hashTable") + 12 * a4);
    v9->_alias = *(_DWORD *)(objc_msgSend(a3, "_hashTable") + 12 * a4 + 8) != -1;
    v9->_name = (NSString *)objc_msgSend(a5, "copy");
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[DYCaptureArchive _fileObjectDidDeallocate](self->_archive, "_fileObjectDidDeallocate");

  v3.receiver = self;
  v3.super_class = (Class)DYCaptureFile;
  -[DYCaptureFile dealloc](&v3, sel_dealloc);
}

- (int64_t)dy_numericCompare:(id)a3
{
  return -[NSString compare:options:](self->_name, "compare:options:", *((_QWORD *)a3 + 2), 64);
}

- (void)_determineKind
{
  int v3;

  if (objc_msgSend(+[DYCaptureArchive standardFunctionStreamFilenamePredicate](DYCaptureArchive, "standardFunctionStreamFilenamePredicate"), "evaluateWithObject:", self->_name))
  {
    v3 = 1;
  }
  else if (objc_msgSend(+[DYCaptureArchive internalFilenamePredicate](DYCaptureArchive, "internalFilenamePredicate"), "evaluateWithObject:", self->_name))
  {
    v3 = 2;
  }
  else
  {
    v3 = 3;
  }
  self->_kind_cache = v3;
}

- (int)kind
{
  int result;

  result = self->_kind_cache;
  if (!result)
  {
    -[DYCaptureFile _determineKind](self, "_determineKind");
    return self->_kind_cache;
  }
  return result;
}

- (BOOL)executable
{
  int kind_cache;

  kind_cache = self->_kind_cache;
  if (!kind_cache)
  {
    -[DYCaptureFile _determineKind](self, "_determineKind");
    kind_cache = self->_kind_cache;
  }
  return kind_cache == 1;
}

- (BOOL)getInfo:(id *)a3 error:(id *)a4
{
  return -[DYCaptureArchive getInfo:forFilePosition:error:](self->_archive, "getInfo:forFilePosition:error:", a3, self->_file_pos, a4);
}

- (BOOL)acceptCaptureVisitor:(id)a3
{
  void *v5;
  int kind_cache;

  v5 = (void *)MEMORY[0x2426225CC](self, a2);
  kind_cache = self->_kind_cache;
  if (!kind_cache)
  {
    -[DYCaptureFile _determineKind](self, "_determineKind");
    kind_cache = self->_kind_cache;
  }
  if (kind_cache == 2)
  {
    objc_msgSend(a3, "visitInternalFile:", self);
  }
  else if (kind_cache == 1)
  {
    objc_msgSend(a3, "visitFunctionStreamFile:", self);
  }
  else
  {
    objc_msgSend(a3, "visitDataFile:", self);
  }
  objc_autoreleasePoolPop(v5);
  return 1;
}

- (id)copyMutableData:(id *)a3
{
  return -[DYCaptureArchive copyDataForFilePosition:error:](self->_archive, "copyDataForFilePosition:error:", self->_file_pos, a3);
}

- (id)copyData:(id *)a3
{
  uint64_t file_pos;
  _BOOL4 v5;
  id result;
  id v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t v10;

  file_pos = self->_file_pos;
  v9 = 0;
  v10 = 0;
  v5 = -[DYCaptureArchive requestDataForFilePosition:buffer:size:error:](self->_archive, "requestDataForFilePosition:buffer:size:error:", file_pos, &v10, &v9, a3);
  result = 0;
  if (v5)
  {
    v7 = objc_alloc(MEMORY[0x24BDBCE50]);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __26__DYCaptureFile_copyData___block_invoke;
    v8[3] = &unk_250D58B18;
    v8[4] = self;
    v8[5] = file_pos;
    return (id)objc_msgSend(v7, "initWithBytesNoCopy:length:deallocator:", v10, v9, v8);
  }
  return result;
}

uint64_t __26__DYCaptureFile_copyData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "releaseBytesForFilePosition:", *(_QWORD *)(a1 + 40));
}

- (id)openFunctionStream:(id *)a3
{
  id result;
  id v5;
  DYDataFunctionStream *v6;

  result = -[DYCaptureFile copyMutableData:](self, "copyMutableData:");
  if (result)
  {
    v5 = result;
    v6 = -[DYDataFunctionStream initWithData:error:]([DYDataFunctionStream alloc], "initWithData:error:", result, a3);

    return v6;
  }
  return result;
}

- (void)updateName:(id)a3
{
  self->_name = (NSString *)objc_msgSend(a3, "copy");
}

- (id)decodeArchivedObject
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v6;

  v2 = -[DYCaptureFile copyMutableData:](self, "copyMutableData:", 0);
  if (!v2)
    return 0;
  v3 = v2;
  v6 = 0;
  v4 = (void *)objc_msgSend(MEMORY[0x24BE39120], "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(MEMORY[0x24BE39120], "captureArchiveClassSet"), v2, &v6);

  return v4;
}

- (id)decodeSerializedPropertyListWithOptions:(unint64_t)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = -[DYCaptureFile copyMutableData:](self, "copyMutableData:", 0);
  v7 = (void *)objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v6, a3, 0, a4);

  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p name=\"%@\">"), objc_opt_class(), self, -[DYCaptureFile name](self, "name"));
}

- (DYCaptureArchive)archive
{
  return self->_archive;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)alias
{
  return self->_alias;
}

@end
