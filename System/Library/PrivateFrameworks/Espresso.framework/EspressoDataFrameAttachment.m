@implementation EspressoDataFrameAttachment

- (void)loadFromDict:(id)a3 frameStorage:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  EspressoDataFrameMappedFile *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  id v25;

  v25 = a3;
  v6 = a4;
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("file"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("offset"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedLongValue");

  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("size"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedLongValue");

  objc_msgSend(v6, "mappedFiles");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = v7;
    v15 = v14;
    if ((objc_msgSend(v14, "hasPrefix:", CFSTR("/")) & 1) == 0)
    {
      objc_msgSend(v6, "baseFilename");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByDeletingLastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "stringByAppendingPathComponent:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v18 = -[EspressoDataFrameMappedFile initWithPath:]([EspressoDataFrameMappedFile alloc], "initWithPath:", v15);
    objc_msgSend(v6, "mappedFiles");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v14);

  }
  objc_msgSend(v6, "mappedFiles");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", v7);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "path");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[EspressoDataFrameAttachment setFilePath:](self, "setFilePath:", v22);

  -[EspressoDataFrameAttachment setOffset:](self, "setOffset:", v9);
  -[EspressoDataFrameAttachment setSize:](self, "setSize:", v11);
  if (objc_msgSend(v21, "basePtr"))
  {
    v23 = objc_msgSend(v21, "basePtr");
    v24 = v23 + -[EspressoDataFrameAttachment offset](self, "offset");
  }
  else
  {
    v24 = 0;
  }
  -[EspressoDataFrameAttachment setRawPointer:](self, "setRawPointer:", v24);

}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (NSString)filePath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setFilePath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)rawPointer
{
  return self->_rawPointer;
}

- (void)setRawPointer:(void *)a3
{
  self->_rawPointer = a3;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filePath, 0);
}

+ (id)fromDict:(id)a3 frameStorage:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v10;
  const char *v11;
  const char *v12;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("kind"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("image")) & 1) == 0
    && !objc_msgSend(v7, "isEqualToString:", CFSTR("tensor")))
  {
    v10 = objc_retainAutorelease(v7);
    if (objc_msgSend(v10, "UTF8String"))
      v11 = (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
    else
      v11 = "";
    v12 = v11;
    Espresso::throw_exception_selector<Espresso::invalid_state_error,char const*>("Invalid attachment kind %s", &v12);
  }
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "loadFromDict:frameStorage:", v5, v6);

  return v8;
}

@end
