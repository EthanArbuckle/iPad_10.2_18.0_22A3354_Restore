@implementation SGPatternDataFile

- (SGPatternDataFile)initWithPath:(id)a3
{
  id v5;
  void *v6;
  id v7;
  SGPatternDataFile *v8;
  void *v10;
  void *v11;
  id v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPatterns.m"), 566, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  v12 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v5, 1, &v12);
  v7 = v12;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPatterns.m"), 569, CFSTR("Error loading file %@: %@"), v5, v7);

  }
  v8 = -[SGPatternDataFile initWithData:](self, "initWithData:", v6);

  return v8;
}

- (SGPatternDataFile)initWithData:(id)a3
{
  id v6;
  SGPatternDataFile *v7;
  SGPatternDataFile *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPatterns.m"), 575, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SGPatternDataFile;
  v7 = -[SGPatternDataFile init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_fileData, a3);

  return v8;
}

- (id)dataForOffset:(id)a3 includeTerminator:(int)a4
{
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v14;
  void *v15;

  v7 = a3;
  v8 = objc_msgSend(v7, "longLongValue");
  if ((v8 & 3) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPatterns.m"), 589, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(off & 0b11) == 0"));

  }
  if (a4)
    v9 = HIDWORD(v8);
  else
    v9 = HIDWORD(v8) + 1;
  v10 = v8;
  if (v9 + (unint64_t)v8 > -[NSData length](self->_fileData, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGPatterns.m"), 592, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("off + len <= _fileData.length"));

  }
  v11 = (void *)MEMORY[0x1C3BD4F6C]();
  -[NSData subdataWithRange:](self->_fileData, "subdataWithRange:", v10, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v11);

  return v12;
}

- (id)dataForOffset:(id)a3
{
  return -[SGPatternDataFile dataForOffset:includeTerminator:](self, "dataForOffset:includeTerminator:", a3, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileData, 0);
}

@end
