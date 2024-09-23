@implementation Espresso_mxnetTools_ImageBinaryRecordReader

- (Espresso_mxnetTools_ImageBinaryRecordReader)initWithRecFile:(id)a3 error:(id *)a4
{
  id v6;
  Espresso_mxnetTools_ImageBinaryRecordReader *v7;
  uint64_t v8;
  uint64_t v9;
  NSFileHandle *recFileHandle;
  NSMutableArray *labelsPrivate;
  BOOL v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  objc_super v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)Espresso_mxnetTools_ImageBinaryRecordReader;
  v7 = -[Espresso_mxnetTools_ImageBinaryRecordReader init](&v20, sel_init);
  if (v7)
  {
    if (a4)
      *a4 = 0;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend((id)v8, "fileExistsAtPath:", v6) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingAtPath:", v6);
      v9 = objc_claimAutoreleasedReturnValue();
      recFileHandle = v7->_recFileHandle;
      v7->_recFileHandle = (NSFileHandle *)v9;

      v7->_recordHeader = 0;
      v7->_currentOffset = 0;
      *(_QWORD *)&v7->_imageHeader.flag = 0x7FC00000FFFFFFFFLL;
      v7->_imageHeader.imageID.ID[0] = -1;
      v7->_imageHeader.imageID.ID[1] = -1;
      labelsPrivate = v7->_labelsPrivate;
      v7->_labelsPrivate = 0;

      v12 = -[Espresso_mxnetTools_ImageBinaryRecordReader nextRecordAndError:](v7, "nextRecordAndError:", a4);
      if (a4 || v12)
        goto LABEL_9;
      v7 = (Espresso_mxnetTools_ImageBinaryRecordReader *)MEMORY[0x1E0CB35C8];
      a4 = (id *)*MEMORY[0x1E0CB2FE0];
      v8 = *__error();
      v21 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot initialize rec file %@"), v6);
      v22 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      -[Espresso_mxnetTools_ImageBinaryRecordReader errorWithDomain:code:userInfo:](v7, "errorWithDomain:code:userInfo:", a4, v8, objc_claimAutoreleasedReturnValue());
      v13 = (id)objc_claimAutoreleasedReturnValue();
      __break(1u);
    }
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2FE0];
    v16 = *__error();
    v23 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rec file %@ does not exist"), v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, v16, v18);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_9:
  }

  return v7;
}

- (BOOL)seekRecordWithID:(_mxnetTools_imageID_t_ *)a3 error:(id *)a4
{
  void *v7;
  _BOOL4 v8;
  uint64_t v10;
  uint64_t v11;

  *a4 = 0;
  -[Espresso_mxnetTools_ImageBinaryRecordReader setCurrentOffset:](self, "setCurrentOffset:", 0);
  -[Espresso_mxnetTools_ImageBinaryRecordReader recFileHandle](self, "recFileHandle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "seekToFileOffset:", -[Espresso_mxnetTools_ImageBinaryRecordReader currentOffset](self, "currentOffset"));

  v8 = -[Espresso_mxnetTools_ImageBinaryRecordReader nextRecordAndError:](self, "nextRecordAndError:", a4);
  if (v8)
  {
    while (1)
    {
      if (!*a4)
      {
        -[Espresso_mxnetTools_ImageBinaryRecordReader imageHeader](self, "imageHeader");
        if (v11 == a3->ID[0])
        {
          -[Espresso_mxnetTools_ImageBinaryRecordReader imageHeader](self, "imageHeader");
          if (v10 == a3->ID[1])
            break;
        }
      }
      if (!-[Espresso_mxnetTools_ImageBinaryRecordReader nextRecordAndError:](self, "nextRecordAndError:", a4))
      {
        LOBYTE(v8) = 0;
        return v8;
      }
    }
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (BOOL)nextRecordAndError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t flag;
  int *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableArray *v18;
  NSMutableArray *labelsPrivate;
  double v20;
  int *v21;
  NSMutableArray *v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  unint64_t v32;
  _mxnetTools_recordHeader_t_ v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v32 = 0;
  v33 = 0;
  v31 = 0uLL;
  do
  {
    v5 = (void *)MEMORY[0x19401D4A4](self, a2);
    -[Espresso_mxnetTools_ImageBinaryRecordReader recFileHandle](self, "recFileHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "readDataOfLength:", 8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v7, "length"))
      goto LABEL_12;
    objc_msgSend(v7, "getBytes:length:", &v33, 8);

    objc_autoreleasePoolPop(v5);
  }
  while (v33.magic != -824761590);
  -[Espresso_mxnetTools_ImageBinaryRecordReader recFileHandle](self, "recFileHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[Espresso_mxnetTools_ImageBinaryRecordReader setCurrentOffset:](self, "setCurrentOffset:", objc_msgSend(v8, "offsetInFile") - 8);

  v5 = (void *)MEMORY[0x19401D4A4]();
  -[Espresso_mxnetTools_ImageBinaryRecordReader recFileHandle](self, "recFileHandle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "readDataOfLength:", 24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "length"))
  {
LABEL_12:
    v12 = 0;
    goto LABEL_13;
  }
  objc_msgSend(v7, "getBytes:length:", &v31, 24);
  *(_OWORD *)&self->_imageHeader.flag = v31;
  self->_imageHeader.imageID.ID[1] = v32;
  self->_recordHeader = v33;
  flag = self->_imageHeader.flag;
  if ((_DWORD)flag)
  {
    v11 = (int *)malloc_type_malloc(4 * flag, 0x3225ABAFuLL);
    v12 = v11 != 0;
    if (!v11)
    {
      v30 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB2FE0];
      v28 = *__error();
      v34 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot allocate memory for labels (%ld bytes)"), 4 * flag);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", v29, v28, v14);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (!*a3)
    {
      v15 = (void *)MEMORY[0x19401D4A4]();
      -[Espresso_mxnetTools_ImageBinaryRecordReader recFileHandle](self, "recFileHandle");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "readDataOfLength:", 4 * flag);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "getBytes:length:", v11, 4 * flag);
      objc_autoreleasePoolPop(v15);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v18 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      labelsPrivate = self->_labelsPrivate;
      self->_labelsPrivate = v18;

      v21 = v11;
      do
      {
        v22 = self->_labelsPrivate;
        v23 = *v21++;
        LODWORD(v20) = v23;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v22, "addObject:", v24);

        --flag;
      }
      while (flag);
    }
    free(v11);
  }
  else
  {
    v12 = 1;
  }
LABEL_13:

  objc_autoreleasePoolPop(v5);
  v25 = (v33.lrecord + 3) & 0xFFFFFFFC;
  -[Espresso_mxnetTools_ImageBinaryRecordReader recFileHandle](self, "recFileHandle");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "seekToFileOffset:", v25 + -[Espresso_mxnetTools_ImageBinaryRecordReader currentOffset](self, "currentOffset") + 8);

  return v12;
}

- (id)imageData
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v12;
  int v13;

  -[Espresso_mxnetTools_ImageBinaryRecordReader recFileHandle](self, "recFileHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "offsetInFile");

  -[Espresso_mxnetTools_ImageBinaryRecordReader imageHeader](self, "imageHeader");
  if (v13)
  {
    -[Espresso_mxnetTools_ImageBinaryRecordReader imageHeader](self, "imageHeader");
    v5 = 4 * v12 + 32;
  }
  else
  {
    v5 = 32;
  }
  -[Espresso_mxnetTools_ImageBinaryRecordReader recFileHandle](self, "recFileHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "seekToFileOffset:", v5 + -[Espresso_mxnetTools_ImageBinaryRecordReader currentOffset](self, "currentOffset"));

  v7 = ((unint64_t)-[Espresso_mxnetTools_ImageBinaryRecordReader recordHeader](self, "recordHeader") >> 32) & 0xFFFFFFFF9FFFFFFFLL;
  -[Espresso_mxnetTools_ImageBinaryRecordReader recFileHandle](self, "recFileHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "readDataOfLength:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[Espresso_mxnetTools_ImageBinaryRecordReader recFileHandle](self, "recFileHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "seekToFileOffset:", v4);

  return v9;
}

- (id)labels
{
  void *v4;
  double v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[Espresso_mxnetTools_ImageBinaryRecordReader imageHeader](self, "imageHeader");
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_labelsPrivate);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[Espresso_mxnetTools_ImageBinaryRecordReader imageHeader](self, "imageHeader");
    LODWORD(v5) = v8;
    objc_msgSend(v4, "numberWithFloat:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
}

- (_mxnetTools_imageID_t_)imageID
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _mxnetTools_imageID_t_ result;

  -[Espresso_mxnetTools_ImageBinaryRecordReader imageHeader](self, "imageHeader");
  v3 = v7;
  -[Espresso_mxnetTools_ImageBinaryRecordReader imageHeader](self, "imageHeader");
  v4 = v6;
  v5 = v3;
  result.ID[1] = v4;
  result.ID[0] = v5;
  return result;
}

- (NSFileHandle)recFileHandle
{
  return (NSFileHandle *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRecFileHandle:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (_mxnetTools_recordHeader_t_)recordHeader
{
  _mxnetTools_recordHeader_t_ dest;

  objc_copyStruct(&dest, &self->_recordHeader, 8, 1, 0);
  return dest;
}

- (void)setRecordHeader:(_mxnetTools_recordHeader_t_)a3
{
  _mxnetTools_recordHeader_t_ src;

  src = a3;
  objc_copyStruct(&self->_recordHeader, &src, 8, 1, 0);
}

- (_mxnetTools_imageHeader_t_)imageHeader
{
  _mxnetTools_imageHeader_t_ *result;

  objc_copyStruct(retstr, &self->_imageHeader, 24, 1, 0);
  return result;
}

- (void)setImageHeader:(_mxnetTools_imageHeader_t_ *)a3
{
  objc_copyStruct(&self->_imageHeader, a3, 24, 1, 0);
}

- (unint64_t)currentOffset
{
  return self->_currentOffset;
}

- (void)setCurrentOffset:(unint64_t)a3
{
  self->_currentOffset = a3;
}

- (NSMutableArray)labelsPrivate
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLabelsPrivate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelsPrivate, 0);
  objc_storeStrong((id *)&self->_recFileHandle, 0);
}

@end
