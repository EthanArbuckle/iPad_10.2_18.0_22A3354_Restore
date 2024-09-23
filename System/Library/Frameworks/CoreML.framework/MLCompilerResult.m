@implementation MLCompilerResult

- (NSArray)outputFiles
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOutputFiles:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputFiles, 0);
}

+ (id)resultWithOutputFiles:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setOutputFiles:", v4);

  return v5;
}

+ (id)resultWithArchive:(void *)a3
{
  void *v3;
  uint64_t *v4;
  uint64_t *i;
  uint64_t *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t *v11;
  uint64_t *v12;
  void **v13;

  OArchive::listFilesWritten((OArchive *)&v11, (uint64_t)a3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  for (i = v12; v4 != i; v4 += 3)
  {
    v6 = v4;
    if (*((char *)v4 + 23) < 0)
      v6 = (uint64_t *)*v4;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v3, "addObject:", v8);

  }
  +[MLCompilerResult resultWithOutputFiles:](MLCompilerResult, "resultWithOutputFiles:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void **)&v11;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v13);
  return v9;
}

@end
