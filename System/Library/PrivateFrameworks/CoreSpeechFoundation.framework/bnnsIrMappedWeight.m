@implementation bnnsIrMappedWeight

- (bnnsIrMappedWeight)initWithWeightFile:(id)a3 errOut:(id *)a4
{
  id v6;
  bnnsIrMappedWeight *v7;
  int v8;
  size_t st_size;
  bnnsIrMappedWeight *v10;
  void *v11;
  void *v12;
  int *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int *v19;
  stat v21;
  objc_super v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)bnnsIrMappedWeight;
  v7 = -[bnnsIrMappedWeight init](&v22, sel_init);
  if (!v7)
    goto LABEL_4;
  v8 = open((const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), 0);
  fstat(v8, &v21);
  st_size = v21.st_size;
  v7->_weightSize = v21.st_size;
  if (v8 == -1)
  {
    if (a4)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v25 = *MEMORY[0x1E0CB2D50];
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = __error();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("Could not OPEN() weights: %s"), strerror(*v13));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2454, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      *a4 = v16;

    }
LABEL_10:
    v10 = 0;
    goto LABEL_11;
  }
  v7->_weightData = mmap(0, st_size, 1, 2, v8, 0);
  close(v8);
  if (v7->_weightData == (void *)-1)
  {
    if (a4)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      v23 = *MEMORY[0x1E0CB2D50];
      v18 = (void *)MEMORY[0x1E0CB3940];
      v19 = __error();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("Could not MMAP() weights: %s"), strerror(*v19));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.corespeech"), 2454, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    goto LABEL_10;
  }
LABEL_4:
  v10 = v7;
LABEL_11:

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[bnnsIrMappedWeight ummapForWeight](self, "ummapForWeight");
  v3.receiver = self;
  v3.super_class = (Class)bnnsIrMappedWeight;
  -[bnnsIrMappedWeight dealloc](&v3, sel_dealloc);
}

- (void)ummapForWeight
{
  void *weightData;

  weightData = self->_weightData;
  if (weightData != (void *)-1)
  {
    munmap(weightData, self->_weightSize);
    self->_weightData = (void *)-1;
    self->_weightSize = 0;
  }
}

- (void)getWeightData
{
  return self->_weightData;
}

- (NSString)weightFilePath
{
  return self->_weightFilePath;
}

- (unint64_t)weightSize
{
  return self->_weightSize;
}

- (void)setWeightSize:(unint64_t)a3
{
  self->_weightSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_weightFilePath, 0);
}

@end
