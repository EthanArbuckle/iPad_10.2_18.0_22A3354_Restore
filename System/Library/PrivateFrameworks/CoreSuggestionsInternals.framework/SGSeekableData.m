@implementation SGSeekableData

- (SGSeekableData)initWithData:(id)a3
{
  id v6;
  SGSeekableData *v7;
  SGSeekableData *v8;
  id v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSeekableData.m"), 23, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  v12.receiver = self;
  v12.super_class = (Class)SGSeekableData;
  v7 = -[SGSeekableData init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_data, a3);
    v9 = objc_retainAutorelease(v6);
    v8->_bytes = (const void *)objc_msgSend(v9, "bytes");
    v8->_length = objc_msgSend(v9, "length");
    v8->_offsetInFile = 0;
  }

  return v8;
}

- (SGSeekableData)initWithMemoryMappedPath:(id)a3
{
  id v5;
  SGSeekableData *v6;
  id v7;
  void *v9;
  id v10;

  v5 = a3;
  v10 = 0;
  v6 = -[SGSeekableData initWithMemoryMappedPath:error:](self, "initWithMemoryMappedPath:error:", v5, &v10);
  v7 = v10;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, 0, CFSTR("SGSeekableData.m"), 37, CFSTR("Error loading %@: %@"), v5, v7);

  }
  return v6;
}

- (SGSeekableData)initWithMemoryMappedPath:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  SGSeekableData *v9;
  SGSeekableData *v10;
  void *v12;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSeekableData.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v7, 1, a4);
  if (v8)
  {
    self = -[SGSeekableData initWithData:](self, "initWithData:", v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }
  v10 = v9;

  return v10;
}

- (const)dataOfLength:(unint64_t)a3
{
  unint64_t offsetInFile;
  unint64_t v5;
  char *bytes;
  const void *result;
  void *v10;

  offsetInFile = self->_offsetInFile;
  v5 = offsetInFile + a3;
  bytes = (char *)self->_bytes;
  if (offsetInFile + a3 > self->_length)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSeekableData.m"), 51, CFSTR("Tried to read %llu-%llu from data of length %llu"), self->_offsetInFile, self->_offsetInFile + a3, self->_length);

    v5 = self->_offsetInFile + a3;
  }
  result = &bytes[offsetInFile];
  self->_offsetInFile = v5;
  return result;
}

- (void)seekToFileOffset:(unint64_t)a3
{
  void *v6;

  if (self->_length < a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGSeekableData.m"), 58, CFSTR("offset %llu outside of bounds (file length %llu)"), a3, self->_length);

  }
  self->_offsetInFile = a3;
}

- (unint64_t)offsetInFile
{
  return self->_offsetInFile;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
