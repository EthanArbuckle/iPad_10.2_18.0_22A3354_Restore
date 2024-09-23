@implementation DEVersionWriter

- (DEVersionWriter)init
{
  DEVersionWriter *v2;
  DEVersionWriter *v3;
  NSData *version;
  DEVersionWriter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DEVersionWriter;
  v2 = -[DEVersionWriter init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    version = v2->_version;
    v2->_version = 0;

    CC_SHA256_Init(&v3->_context);
    v5 = v3;
  }

  return v3;
}

- (void)writeData:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  if (!self->_version)
  {
    v4 = objc_retainAutorelease(v5);
    CC_SHA256_Update(&self->_context, (const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));
  }

}

- (void)close
{
  NSData *v3;
  NSData *version;

  if (!self->_version)
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 32);
    v3 = (NSData *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    CC_SHA256_Final((unsigned __int8 *)-[NSData mutableBytes](v3, "mutableBytes"), &self->_context);
    version = self->_version;
    self->_version = v3;

  }
}

- (NSData)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_storeStrong((id *)&self->_version, a3);
}

- (CC_SHA256state_st)context
{
  __int128 v3;
  __int128 v4;
  __int128 v5;

  v3 = *(_OWORD *)&self->wbuf[14];
  *(_OWORD *)&retstr->wbuf[6] = *(_OWORD *)&self->wbuf[10];
  *(_OWORD *)&retstr->wbuf[10] = v3;
  *(_QWORD *)&retstr->wbuf[14] = *(_QWORD *)self[1].hash;
  v4 = *(_OWORD *)&self->hash[6];
  *(_OWORD *)retstr->count = *(_OWORD *)&self->hash[2];
  *(_OWORD *)&retstr->hash[2] = v4;
  v5 = *(_OWORD *)&self->wbuf[6];
  *(_OWORD *)&retstr->hash[6] = *(_OWORD *)&self->wbuf[2];
  *(_OWORD *)&retstr->wbuf[2] = v5;
  return self;
}

- (void)setContext:(CC_SHA256state_st *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v3 = *(_OWORD *)a3->count;
  v4 = *(_OWORD *)&a3->hash[6];
  *(_OWORD *)&self->_context.hash[2] = *(_OWORD *)&a3->hash[2];
  *(_OWORD *)&self->_context.hash[6] = v4;
  *(_OWORD *)self->_context.count = v3;
  v5 = *(_OWORD *)&a3->wbuf[2];
  v6 = *(_OWORD *)&a3->wbuf[6];
  v7 = *(_OWORD *)&a3->wbuf[10];
  *(_QWORD *)&self->_context.wbuf[14] = *(_QWORD *)&a3->wbuf[14];
  *(_OWORD *)&self->_context.wbuf[6] = v6;
  *(_OWORD *)&self->_context.wbuf[10] = v7;
  *(_OWORD *)&self->_context.wbuf[2] = v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
}

+ (id)dataWithHexString:(id)a3
{
  id v3;
  void *v4;
  std::string::size_type size;
  std::string::size_type i;
  std::string *p_p;
  std::string::value_type v8;
  std::string::size_type v9;
  unsigned int v10;
  std::string::size_type v11;
  std::string *v12;
  std::string::size_type v13;
  std::string __p;
  std::string v16;
  std::string __str;
  char v18;

  v3 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:ne180100]<0>(&__str, (char *)objc_msgSend(v3, "UTF8String"));
  v4 = 0;
  memset(&v16, 0, sizeof(v16));
  size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
    size = __str.__r_.__value_.__l.__size_;
  if ((size & 1) == 0)
  {
    if (size)
    {
      for (i = 0; i < v9; i += 2)
      {
        std::string::basic_string(&__p, &__str, i, 2uLL, (std::allocator<char> *)&v18);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          p_p = &__p;
        else
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        v8 = strtol((const char *)p_p, 0, 16);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        std::string::push_back(&v16, v8);
        v9 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
        if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v9 = __str.__r_.__value_.__l.__size_;
      }
      v10 = HIBYTE(v16.__r_.__value_.__r.__words[2]);
      size = v16.__r_.__value_.__l.__size_;
      v11 = v16.__r_.__value_.__r.__words[0];
    }
    else
    {
      v11 = 0;
      v10 = 0;
    }
    if ((v10 & 0x80u) == 0)
      v12 = &v16;
    else
      v12 = (std::string *)v11;
    if ((v10 & 0x80u) == 0)
      v13 = v10;
    else
      v13 = size;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v12, v13);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (SHIBYTE(v16.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v16.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__str.__r_.__value_.__l.__data_);

  return v4;
}

+ (id)versionData:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "writeData:", v3);
  objc_msgSend(v4, "close");
  objc_msgSend(v4, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)versionString:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEVersionWriter versionData:](DEVersionWriter, "versionData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)versionToString:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t i;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 2 * objc_msgSend(v3, "length"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; objc_msgSend(v4, "length") > i; ++i)
      objc_msgSend(v5, "appendFormat:", CFSTR("%02x"), *(unsigned __int8 *)(objc_msgSend(objc_retainAutorelease(v4), "bytes") + i));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)versionFile:(id)a3
{
  id v3;
  DEFileReader *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = -[DEFileReader initWithURL:]([DEFileReader alloc], "initWithURL:", v3);
  if (v4)
  {
    v5 = (void *)objc_opt_new();
    +[DEIO copyTo:from:](DEIO, "copyTo:from:", v5, v4);
    objc_msgSend(v5, "version");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)getURLFor:(id)a3 version:(id)a4 base:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  v11 = 0;
  if (v7 && v8 && v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lastPathComponent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    +[DEVersionWriter versionToString:](DEVersionWriter, "versionToString:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v14, "length") > 2)
    {
      v15 = v10;
      for (i = 0; i != 3; ++i)
      {
        objc_msgSend(v14, "substringWithRange:", i, 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "URLByAppendingPathComponent:isDirectory:", v17, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = v18;
      }
      objc_msgSend(v18, "URLByAppendingPathComponent:isDirectory:", v14, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "URLByAppendingPathComponent:isDirectory:", v13, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      +[DELogging error:](DELogging, "error:", CFSTR("Version for \"%@\" too short to generate url"), v7);
      v11 = 0;
    }

  }
  return v11;
}

+ (BOOL)prepareDirsFor:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  BOOL v11;
  id v13;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "URLByDeletingLastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v13 = 0;
      v8 = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v13);
      v9 = v13;
      v10 = v9;
      if ((v8 & 1) != 0)
      {
        v11 = 1;
LABEL_10:

        goto LABEL_11;
      }
      if (v9)
        +[DELogging error:](DELogging, "error:", CFSTR("Failed to create dirs for \"%@\": %@"), v4, v9);
    }
    else
    {
      v10 = 0;
    }
    v11 = 0;
    goto LABEL_10;
  }
  v11 = 0;
LABEL_11:

  return v11;
}

@end
