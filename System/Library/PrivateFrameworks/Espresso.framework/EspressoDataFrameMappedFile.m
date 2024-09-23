@implementation EspressoDataFrameMappedFile

- (EspressoDataFrameMappedFile)initWithPath:(id)a3
{
  id v4;
  EspressoDataFrameMappedFile *v5;
  EspressoDataFrameMappedFile *v6;
  id v7;
  int file_id;
  off_t st_size;
  char *v10;
  EspressoDataFrameMappedFile *v11;
  stat v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)EspressoDataFrameMappedFile;
  v5 = -[EspressoDataFrameMappedFile init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    -[EspressoDataFrameMappedFile setBasePtr:](v5, "setBasePtr:", 0);
    v7 = objc_retainAutorelease(v4);
    v6->file_id = open((const char *)objc_msgSend(v7, "UTF8String"), 0);
    objc_storeStrong((id *)&v6->_path, v7);
    file_id = v6->file_id;
    if (file_id == -1)
      Espresso::throw_exception_selector<Espresso::io_error,char const*>("Error loading file: %s", objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
    v13.st_size = 0;
    fstat(file_id, &v13);
    st_size = v13.st_size;
    v6->length = v13.st_size;
    if (!st_size)
      Espresso::throw_exception_selector<Espresso::io_error,char const*>("Error mapping file: %s", objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
    v10 = (char *)mmap(0, st_size, 1, 2, v6->file_id, 0);
    v6->_basePtr = v10;
    if ((unint64_t)(v10 + 1) <= 1)
      Espresso::throw_exception_selector<Espresso::io_error,char const*>("Error mapping file: %s", objc_msgSend(objc_retainAutorelease(v7), "UTF8String"));
    v11 = v6;
  }

  return v6;
}

- (void)dealloc
{
  char *basePtr;
  int file_id;
  objc_super v5;

  basePtr = self->_basePtr;
  if ((unint64_t)(basePtr + 1) >= 2)
    munmap(basePtr, self->length);
  file_id = self->file_id;
  if (file_id != -1)
    close(file_id);
  v5.receiver = self;
  v5.super_class = (Class)EspressoDataFrameMappedFile;
  -[EspressoDataFrameMappedFile dealloc](&v5, sel_dealloc);
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (char)basePtr
{
  return self->_basePtr;
}

- (void)setBasePtr:(char *)a3
{
  self->_basePtr = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
