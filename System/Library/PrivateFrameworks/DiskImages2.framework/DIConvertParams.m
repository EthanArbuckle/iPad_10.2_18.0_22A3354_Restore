@implementation DIConvertParams

- (BOOL)validateFileWithURL:(id)a3 error:(id *)a4
{
  id v5;
  const stat *v6;
  BOOL v7;
  stat v9;

  v5 = a3;
  v7 = objc_msgSend(v5, "isFileURL")
    && (stat((const char *)objc_msgSend(objc_retainAutorelease(v5), "fileSystemRepresentation"), &v9)
     || !FileDescriptor::is_device((FileDescriptor *)&v9, v6))
    || +[DIError failWithPOSIXCode:description:error:](DIError, "failWithPOSIXCode:description:error:", 22, CFSTR("Output of disk image conversion must be a file"), a4);

  return v7;
}

- (DIConvertParams)initWithInputURL:(id)a3 outputURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  DIConvertParams *v11;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[DIConvertParams initWithInputURL:outputURL:shadowURLs:error:](self, "initWithInputURL:outputURL:shadowURLs:error:", v8, v9, v10, a5);

  return v11;
}

- (DIConvertParams)initWithInputURL:(id)a3 outputURL:(id)a4 shadowURLs:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  DIConvertParams *v13;
  DIConvertParams *v14;
  DIURL *v15;
  DIURL *outputURL;
  DIConvertParams *v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = -[DIBaseParams initWithURL:error:](self, "initWithURL:error:", v10, a6);
  v14 = v13;
  if (v13)
  {
    if (!-[DIConvertParams validateFileWithURL:error:](v13, "validateFileWithURL:error:", v11, a6))
    {
      v17 = 0;
      goto LABEL_6;
    }
    objc_storeStrong((id *)&v14->_shadowURLs, a5);
    v15 = +[DIURL newDIURLWithNSURL:](DIURL, "newDIURLWithNSURL:", v11);
    outputURL = v14->_outputURL;
    v14->_outputURL = v15;

    v14->_sparseBundleBandSize = 0x4000000;
  }
  v17 = v14;
LABEL_6:

  return v17;
}

- (id)initForInplaceWithURL:(id)a3 error:(id *)a4
{
  id v6;
  DIConvertParams *v7;
  DIConvertParams *v8;
  DIConvertParams *v9;

  v6 = a3;
  v7 = -[DIBaseParams initWithURL:error:](self, "initWithURL:error:", v6, a4);
  v8 = v7;
  if (v7)
  {
    if (!-[DIConvertParams validateFileWithURL:error:](v7, "validateFileWithURL:error:", v6, a4))
    {
      v9 = 0;
      goto LABEL_6;
    }
    -[DIConvertParams setConversionMethod:](v8, "setConversionMethod:", 1);
  }
  v9 = v8;
LABEL_6:

  return v9;
}

- (id)initForInplaceWithExistingParams:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  DIConvertParams *v8;
  void *v9;
  BOOL v10;
  void *v11;
  DIConvertParams *v12;
  objc_super v14;

  v6 = a3;
  objc_msgSend(v6, "inputURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)DIConvertParams;
  v8 = -[DIBaseParams initWithURL:error:](&v14, sel_initWithURL_error_, v7, a4);

  if (v8)
  {
    objc_msgSend(v6, "inputURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[DIConvertParams validateFileWithURL:error:](v8, "validateFileWithURL:error:", v9, a4);

    if (!v10)
    {
      v12 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v6, "diskImageParamsXPC");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DIBaseParams setDiskImageParamsXPC:](v8, "setDiskImageParamsXPC:", v11);

    -[DIConvertParams setConversionMethod:](v8, "setConversionMethod:", 1);
  }
  v12 = v8;
LABEL_6:

  return v12;
}

- (BOOL)inPlaceConversion
{
  return -[DIConvertParams conversionMethod](self, "conversionMethod") == 1;
}

- (BOOL)validateSquashFormats
{
  int64_t v3;
  void *v4;
  char isKindOfClass;

  v3 = -[DIConvertParams outputFormat](self, "outputFormat");
  if (v3 == 8 || v3 == 1)
  {
    -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

  }
  else
  {
    isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (BOOL)shouldPerformInplaceSquash
{
  void *v3;
  void *v4;
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void **p_lpsrc;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  std::__shared_weak_count *v16;
  unint64_t *v17;
  unint64_t v18;
  const FileDescriptor *v19;
  void *v20;
  void *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  uint64_t v29;
  std::__shared_weak_count *v30;
  void *lpsrc;
  std::__shared_weak_count *v32;
  void *__p;
  std::__shared_weak_count *v34;
  char v35;
  const FileDescriptor *v36[2];
  std::__shared_weak_count *v37;
  void *v38;
  void *v39;
  std::__shared_weak_count *v40;
  _QWORD v41[132];

  v41[131] = *MEMORY[0x24BDAC8D0];
  if (!-[DIConvertParams validateSquashFormats](self, "validateSquashFormats"))
    return 0;
  -[DIConvertParams outputURL](self, "outputURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByDeletingLastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_retainAutorelease(v4);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v5, "fileSystemRepresentation"));
  v6 = FileDescriptorWrapper::open_file((uint64_t)&__p, 0);
  FileLocal::FileLocal((FileLocal *)v36, v6, 0, 0);
  if (v35 < 0)
    operator delete(__p);
  -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backendXPC");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "backend");
  }
  else
  {
    v29 = 0;
    v30 = 0;
  }
  get_sink_backend((uint64_t)&v29, &lpsrc);
  if (lpsrc
  {
    __p = v11;
    v34 = v32;
    p_lpsrc = &lpsrc;
  }
  else
  {
    p_lpsrc = &__p;
  }
  *p_lpsrc = 0;
  p_lpsrc[1] = 0;
  v13 = v32;
  if (v32)
  {
    p_shared_owners = (unint64_t *)&v32->__shared_owners_;
    do
      v15 = __ldaxr(p_shared_owners);
    while (__stlxr(v15 - 1, p_shared_owners));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  v16 = v30;
  if (v30)
  {
    v17 = (unint64_t *)&v30->__shared_owners_;
    do
      v18 = __ldaxr(v17);
    while (__stlxr(v18 - 1, v17));
    if (!v18)
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }

  if (__p && FileLocal::mounted_on_same_fs((FileDescriptor **)__p, v36, v19))
  {
    -[DIConvertParams shadowURLs](self, "shadowURLs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count"))
    {
      -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v21, "mountedOnAPFS");

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }
  v22 = v34;
  if (v34)
  {
    v23 = (unint64_t *)&v34->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  v36[0] = (const FileDescriptor *)&off_24CF0F5C0;
  v38 = &unk_24CF0F6A0;
  v39 = &unk_24CF0F6D8;
  boost::container::vector<FileLocal::promise_io_t,boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,void>::~vector((uint64_t)v41);
  v25 = v40;
  if (v40)
  {
    v26 = (unint64_t *)&v40->__shared_owners_;
    do
      v27 = __ldaxr(v26);
    while (__stlxr(v27 - 1, v26));
    if (!v27)
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  if (v37)
    std::__shared_weak_count::__release_weak(v37);

  return v10;
}

- (BOOL)prepareParamsForSquashWithError:(id *)a3
{
  int v5;
  NSObject *v6;
  char *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  DIBaseParams *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  BOOL v26;
  int v27;
  NSObject *v28;
  char *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  uint8_t *v34;
  uint64_t v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v5 = *__error();
  if (DIForwardLogs())
  {
    getDIOSLog();
    v6 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    *(_DWORD *)buf = 68157954;
    v37 = 51;
    v38 = 2080;
    v39 = "-[DIConvertParams prepareParamsForSquashWithError:]";
    LODWORD(v35) = 18;
    v34 = buf;
    v7 = (char *)_os_log_send_and_compose_impl();

    if (v7)
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v7);
      free(v7);
    }
  }
  else
  {
    getDIOSLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      v37 = 51;
      v38 = 2080;
      v39 = "-[DIConvertParams prepareParamsForSquashWithError:]";
      _os_log_impl(&dword_212EB0000, v8, OS_LOG_TYPE_DEFAULT, "%.*s: Performing in-place squash optimization", buf, 0x12u);
    }

  }
  *__error() = v5;
  v9 = -[DIConvertParams copyUpdatedOutputURLWithError:](self, "copyUpdatedOutputURLWithError:", a3);
  if (!v9)
    goto LABEL_15;
  if (!+[DICreateParams eraseIfExistingWithURL:error:](DICreateParams, "eraseIfExistingWithURL:error:", v9, a3))
  {
    v27 = *__error();
    if (!DIForwardLogs())
    {
      getDIOSLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157954;
        v37 = 51;
        v38 = 2080;
        v39 = "-[DIConvertParams prepareParamsForSquashWithError:]";
        _os_log_impl(&dword_212EB0000, v30, OS_LOG_TYPE_ERROR, "%.*s: Failed to erase output URL", buf, 0x12u);
      }

      goto LABEL_29;
    }
    getDIOSLog();
    v28 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 68157954;
    v37 = 51;
    v38 = 2080;
    v39 = "-[DIConvertParams prepareParamsForSquashWithError:]";
    v29 = (char *)_os_log_send_and_compose_impl();

    if (v29)
    {
LABEL_25:
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v29);
      free(v29);
    }
LABEL_29:
    v26 = 0;
    *__error() = v27;
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIBaseParams inputURL](self, "inputURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "copyItemAtURL:toURL:error:", v11, v9, a3);

  if ((v12 & 1) == 0)
  {
    v27 = *__error();
    if (!DIForwardLogs())
    {
      getDIOSLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68157954;
        v37 = 51;
        v38 = 2080;
        v39 = "-[DIConvertParams prepareParamsForSquashWithError:]";
        _os_log_impl(&dword_212EB0000, v32, OS_LOG_TYPE_ERROR, "%.*s: Failed to copy source disk image to temporary URL", buf, 0x12u);
      }

      goto LABEL_29;
    }
    getDIOSLog();
    v31 = objc_claimAutoreleasedReturnValue();
    os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
    *(_DWORD *)buf = 68157954;
    v37 = 51;
    v38 = 2080;
    v39 = "-[DIConvertParams prepareParamsForSquashWithError:]";
    v29 = (char *)_os_log_send_and_compose_impl();

    if (v29)
      goto LABEL_25;
    goto LABEL_29;
  }
  v13 = -[DIBaseParams initWithURL:error:]([DIBaseParams alloc], "initWithURL:error:", v9, a3);
  -[DIConvertParams setOutputParams:](self, "setOutputParams:", v13);

  -[DIConvertParams outputParams](self, "outputParams");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "openExistingImageWithFlags:error:", 2, a3);

  if ((v15 & 1) == 0)
  {
LABEL_15:
    v26 = 0;
    goto LABEL_30;
  }
  -[NSArray objectAtIndex:](self->_shadowURLs, "objectAtIndex:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = +[DIURL newDIURLWithNSURL:](DIURL, "newDIURLWithNSURL:", v16);
  -[DIBaseParams setInputURL:](self, "setInputURL:", v17);

  -[DIBaseParams inputURL](self, "inputURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "path");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {

    goto LABEL_32;
  }
  v20 = (void *)MEMORY[0x24BDD1808];
  -[DIBaseParams inputURL](self, "inputURL");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "componentsWithURL:resolvingAgainstBaseURL:", v21, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v20) = v22 == 0;

  if ((_DWORD)v20)
  {
LABEL_32:
    v26 = +[DIError failWithPOSIXCode:description:error:](DIError, "failWithPOSIXCode:description:error:", 22, CFSTR("Malformed URL format"), a3, v34, v35);
    goto LABEL_30;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", self->_shadowURLs);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "removeObjectAtIndex:", 0);
  -[DIBaseParams shadowChain](self, "shadowChain");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "addShadowURLs:error:", v23, a3);

  if ((v25 & 1) != 0)
  {
    -[DIBaseParams setDiskImageParamsXPC:](self, "setDiskImageParamsXPC:", 0);
    v26 = -[DIBaseParams openExistingImageWithFlags:error:](self, "openExistingImageWithFlags:error:", 0, a3);
  }
  else
  {
    v26 = 0;
  }

LABEL_30:
  return v26;
}

- (BOOL)prepareParamsWithError:(id *)a3
{
  char v6;
  void *v7;

  if (-[DIConvertParams inPlaceConversion](self, "inPlaceConversion"))
    return -[DIBaseParams openExistingImageWithFlags:error:](self, "openExistingImageWithFlags:error:", 2, a3);
  v6 = 0;
  if (-[DIBaseParams openExistingImageWithFlags:error:](self, "openExistingImageWithFlags:error:", 0, a3))
  {
    if (-[DIConvertParams shouldPerformInplaceSquash](self, "shouldPerformInplaceSquash"))
    {
      -[DIConvertParams setConversionMethod:](self, "setConversionMethod:", 2);
      return -[DIConvertParams prepareParamsForSquashWithError:](self, "prepareParamsForSquashWithError:", a3);
    }
    -[DIConvertParams setConversionMethod:](self, "setConversionMethod:", 0);
    -[DIBaseParams shadowChain](self, "shadowChain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "addShadowURLs:error:", self->_shadowURLs, a3);

  }
  return v6;
}

- (DIConvertParams)initWithCoder:(id)a3
{
  id v4;
  DIConvertParams *v5;
  uint64_t v6;
  DIBaseParams *outputParams;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DIConvertParams;
  v5 = -[DIBaseParams initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_conversionMethod = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("conversionMethod"));
    v5->_outputFormat = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("outputFormat"));
    v5->_maxRawUDIFRunSize = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("maxRawUDIFRunSize"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("outputParams"));
    v6 = objc_claimAutoreleasedReturnValue();
    outputParams = v5->_outputParams;
    v5->_outputParams = (DIBaseParams *)v6;

    v5->_useFormatMappingInfo = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useFormatMappingInfo"));
  }

  return v5;
}

- (BOOL)shouldValidateShadows
{
  void *v2;
  char v3;

  -[DIBaseParams shadowChain](self, "shadowChain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldValidate");

  return v3;
}

- (void)setShouldValidateShadows:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[DIBaseParams shadowChain](self, "shadowChain");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShouldValidate:", v3);

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)DIConvertParams;
  -[DIBaseParams encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", -[DIConvertParams conversionMethod](self, "conversionMethod"), CFSTR("conversionMethod"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[DIConvertParams outputFormat](self, "outputFormat"), CFSTR("outputFormat"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[DIConvertParams maxRawUDIFRunSize](self, "maxRawUDIFRunSize"), CFSTR("maxRawUDIFRunSize"));
  -[DIConvertParams outputParams](self, "outputParams");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("outputParams"));

  objc_msgSend(v4, "encodeBool:forKey:", -[DIConvertParams useFormatMappingInfo](self, "useFormatMappingInfo"), CFSTR("useFormatMappingInfo"));
}

- (BOOL)validateDeserializationWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)DIConvertParams;
  if (!-[DIBaseParams validateDeserializationWithError:](&v10, sel_validateDeserializationWithError_))
    return 0;
  -[DIConvertParams outputParams](self, "outputParams");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    return 1;
  v6 = (void *)v5;
  -[DIConvertParams outputParams](self, "outputParams");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "validateDeserializationWithError:", a3);

  return v8;
}

- (id)copyUpdatedOutputURLWithError:(id *)a3
{
  void *v4;
  id v5;
  int v6;
  id v7;
  int v8;
  uint64_t v9;
  _BOOL4 v11;
  void *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  int v15;
  NSObject *v16;
  char *v17;
  NSObject *v19;
  void *v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  _BYTE __p[18];
  char v29;
  void (**v30)(FileLocal *__hidden);
  std::__shared_weak_count *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  _QWORD v36[132];

  v36[131] = *MEMORY[0x24BDAC8D0];
  -[DIBaseParams inputURL](self, "inputURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isFileURL") & 1) == 0)
  {

LABEL_21:
    -[DIConvertParams outputURL](self, "outputURL", v24, v25);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  -[DIConvertParams outputURL](self, "outputURL");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = access((const char *)objc_msgSend(v5, "fileSystemRepresentation"), 0);

  if (v6)
    goto LABEL_21;
  -[DIConvertParams outputURL](self, "outputURL");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v7, "fileSystemRepresentation"));
  v8 = FileDescriptorWrapper::open_file((uint64_t)__p, 0);
  FileLocal::FileLocal((FileLocal *)&v30, v8, 0, 0);
  if (v29 < 0)
    operator delete(*(void **)__p);

  *(_OWORD *)__p = *(_OWORD *)(v34 + 32);
  -[DIBaseParams backend](self, "backend");
  v11 = *(_QWORD *)__p != (*(uint64_t (**)())(*(_QWORD *)v26 + 160))() || *(_QWORD *)&__p[8] != v9;
  v12 = v27;
  if (v27)
  {
    p_shared_owners = (unint64_t *)&v27->__shared_owners_;
    do
      v14 = __ldaxr(p_shared_owners);
    while (__stlxr(v14 - 1, p_shared_owners));
    if (!v14)
    {
      ((void (*)())v27->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v27);
    }
  }
  if (!v11)
  {
    v15 = *__error();
    if (DIForwardLogs())
    {
      getDIOSLog();
      v16 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      *(_QWORD *)__p = 0x3104100202;
      *(_WORD *)&__p[8] = 2080;
      *(_QWORD *)&__p[10] = "-[DIConvertParams copyUpdatedOutputURLWithError:]";
      LODWORD(v25) = 18;
      v24 = __p;
      v17 = (char *)_os_log_send_and_compose_impl();

      if (v17)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v17);
        free(v17);
      }
    }
    else
    {
      getDIOSLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_QWORD *)__p = 0x3104100202;
        *(_WORD *)&__p[8] = 2080;
        *(_QWORD *)&__p[10] = "-[DIConvertParams copyUpdatedOutputURLWithError:]";
        _os_log_impl(&dword_212EB0000, v19, OS_LOG_TYPE_DEFAULT, "%.*s: Input and output files are the same, using a temporary output file", __p, 0x12u);
      }

    }
    *__error() = v15;
    -[DIConvertParams outputURL](self, "outputURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "URLByAppendingPathExtension:", CFSTR("tmp_convert"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v30 = &off_24CF0F5C0;
  v32 = &unk_24CF0F6A0;
  v33 = &unk_24CF0F6D8;
  boost::container::vector<FileLocal::promise_io_t,boost::container::small_vector_allocator<FileLocal::promise_io_t,boost::container::new_allocator<void>,void>,void>::~vector((uint64_t)v36);
  v21 = v35;
  if (v35)
  {
    v22 = (unint64_t *)&v35->__shared_owners_;
    do
      v23 = __ldaxr(v22);
    while (__stlxr(v23 - 1, v22));
    if (!v23)
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  if (v31)
    std::__shared_weak_count::__release_weak(v31);
  if (v11)
    goto LABEL_21;
  return v12;
}

- (BOOL)convertWithError:(id *)a3
{
  const __CFString *v5;
  BOOL v6;
  int v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  id v19;
  DICreateUDSBParams *v20;
  void *v21;
  BOOL v22;
  int v23;
  NSObject *v24;
  char *v25;
  _BOOL8 v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  char isKindOfClass;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  NSObject *v42;
  void *v43;
  void *v44;
  DIConvertParams *v45;
  void *v46;
  void *v47;
  char *v48;
  NSObject *v49;
  void *v50;
  void *v51;
  DIConvertParams *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  char v62;
  uint8_t *v63;
  uint64_t v64;
  _QWORD v65[5];
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  void (*v71)(uint64_t);
  DIClient2Controller_XPCHandler *v72;
  uint8_t buf[4];
  int v74;
  __int16 v75;
  const char *v76;
  __int16 v77;
  DIConvertParams *v78;
  __int16 v79;
  void *v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  if (!-[DIConvertParams prepareParamsWithError:](self, "prepareParamsWithError:"))
    return 0;
  if (-[DIConvertParams outputFormat](self, "outputFormat") >= 1
    && -[DIConvertParams outputFormat](self, "outputFormat") <= 12)
  {
    if (-[DIConvertParams maxRawUDIFRunSize](self, "maxRawUDIFRunSize")
      && -[DIConvertParams maxRawUDIFRunSize](self, "maxRawUDIFRunSize") < 0x100000)
    {
      v5 = CFSTR("Invalid raw UDIF run size limit");
      return +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, v5, a3);
    }
    if (-[DIConvertParams inPlaceConversion](self, "inPlaceConversion")
      && -[DIConvertParams encryptionMethod](self, "encryptionMethod"))
    {
      v5 = CFSTR("In-place conversion maintains the encryption passphrase and method. It's not allowed to specify encryption arguments");
      return +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, v5, a3);
    }
    v67 = 0;
    v68 = &v67;
    v69 = 0x3032000000;
    v70 = __Block_byref_object_copy__5;
    v71 = __Block_byref_object_dispose__5;
    v72 = objc_alloc_init(DIClient2Controller_XPCHandler);
    v8 = *__error();
    if (DIForwardLogs())
    {
      v66 = 0;
      getDIOSLog();
      v9 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68158210;
      v74 = 36;
      v75 = 2080;
      v76 = "-[DIConvertParams convertWithError:]";
      v77 = 2114;
      v78 = self;
      LODWORD(v64) = 28;
      v63 = buf;
      v10 = (char *)_os_log_send_and_compose_impl();

      if (v10)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v10);
        free(v10);
      }
    }
    else
    {
      getDIOSLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68158210;
        v74 = 36;
        v75 = 2080;
        v76 = "-[DIConvertParams convertWithError:]";
        v77 = 2114;
        v78 = self;
        _os_log_impl(&dword_212EB0000, v11, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
      }

    }
    *__error() = v8;
    if ((objc_msgSend((id)v68[5], "connectWithError:", a3) & 1) == 0
      || !-[DIBaseParams prepareImageWithXpcHandler:fileMode:error:](self, "prepareImageWithXpcHandler:fileMode:error:", v68[5], 2, a3))
    {
      goto LABEL_56;
    }
    if (-[DIConvertParams conversionMethod](self, "conversionMethod"))
      goto LABEL_23;
    v19 = -[DIConvertParams copyUpdatedOutputURLWithError:](self, "copyUpdatedOutputURLWithError:", a3);
    if (!v19)
      goto LABEL_56;
    if (-[DIConvertParams outputFormat](self, "outputFormat") == 7)
    {
      v20 = -[DICreateParams initWithURL:error:]([DICreateUDSBParams alloc], "initWithURL:error:", v19, a3);
      if (!v20)
        goto LABEL_40;
      -[DICreateUDSBParams setSparseBundleBandSize:](v20, "setSparseBundleBandSize:", -[DIConvertParams sparseBundleBandSize](self, "sparseBundleBandSize"));
    }
    else
    {
      v20 = -[DICreateParams initWithURL:error:]([DICreateRAWParams alloc], "initWithURL:error:", v19, a3);
      if (!v20)
        goto LABEL_40;
    }
    -[DICreateParams setEncryptionMethod:](v20, "setEncryptionMethod:", -[DIConvertParams encryptionMethod](self, "encryptionMethod", v63, v64));
    -[DIBaseParams setReadPassphraseFlags:](v20, "setReadPassphraseFlags:", -[DIBaseParams readPassphraseFlags](self, "readPassphraseFlags"));
    v26 = -[DIConvertParams shouldValidateShadows](self, "shouldValidateShadows");
    -[DIBaseParams shadowChain](v20, "shadowChain");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setShouldValidate:", v26);

    -[DICreateParams setPassphrase:](v20, "setPassphrase:", -[DIConvertParams passphrase](self, "passphrase"));
    -[DIConvertParams publicKey](self, "publicKey");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[DICreateParams setPublicKey:](v20, "setPublicKey:", v28);

    -[DIConvertParams certificate](self, "certificate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[DICreateParams setCertificate:](v20, "setCertificate:", v29);

    if (-[DICreateParams createDiskImageParamsWithError:](v20, "createDiskImageParamsWithError:", a3)
      && -[DICreateParams createEncryptionWithXPCHandler:error:](v20, "createEncryptionWithXPCHandler:error:", v68[5], a3))
    {
      -[DIConvertParams setOutputParams:](self, "setOutputParams:", v20);

LABEL_23:
      objc_msgSend((id)v68[5], "remoteProxy", v63);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v65[0] = MEMORY[0x24BDAC760];
      v65[1] = 3221225472;
      v65[2] = __36__DIConvertParams_convertWithError___block_invoke;
      v65[3] = &unk_24CEEF948;
      v65[4] = &v67;
      objc_msgSend(v12, "convertWithParams:reply:", self, v65);

      if ((objc_msgSend((id)v68[5], "completeCommandWithError:", a3) & 1) != 0)
      {
        if (-[DIConvertParams inPlaceConversion](self, "inPlaceConversion"))
          goto LABEL_27;
        -[DIConvertParams outputParams](self, "outputParams");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13 == 0;

        if (v14)
          goto LABEL_27;
        -[DIConvertParams outputURL](self, "outputURL");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[DIConvertParams outputParams](self, "outputParams");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "inputURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v15, "isEqual:", v17);

        if ((v18 & 1) != 0)
          goto LABEL_27;
        v41 = *__error();
        if (DIForwardLogs())
        {
          v66 = 0;
          getDIOSLog();
          v42 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);
          -[DIConvertParams outputParams](self, "outputParams");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "inputURL");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "path");
          v45 = (DIConvertParams *)objc_claimAutoreleasedReturnValue();
          -[DIConvertParams outputURL](self, "outputURL");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "path");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 68158467;
          v74 = 36;
          v75 = 2080;
          v76 = "-[DIConvertParams convertWithError:]";
          v77 = 2113;
          v78 = v45;
          v79 = 2113;
          v80 = v47;
          v48 = (char *)_os_log_send_and_compose_impl();

          if (v48)
          {
            fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v48);
            free(v48);
          }
        }
        else
        {
          getDIOSLog();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            -[DIConvertParams outputParams](self, "outputParams");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "inputURL");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "path");
            v52 = (DIConvertParams *)objc_claimAutoreleasedReturnValue();
            -[DIConvertParams outputURL](self, "outputURL");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "path");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 68158467;
            v74 = 36;
            v75 = 2080;
            v76 = "-[DIConvertParams convertWithError:]";
            v77 = 2113;
            v78 = v52;
            v79 = 2113;
            v80 = v54;
            _os_log_impl(&dword_212EB0000, v49, OS_LOG_TYPE_DEFAULT, "%.*s: Moving %{private}@ to %{private}@", buf, 0x26u);

          }
        }
        *__error() = v41;
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        -[DIConvertParams outputURL](self, "outputURL");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v55, "removeItemAtURL:error:", v56, a3);

        if ((v57 & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          -[DIConvertParams outputParams](self, "outputParams");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "inputURL");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          -[DIConvertParams outputURL](self, "outputURL");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = objc_msgSend(v58, "moveItemAtURL:toURL:error:", v60, v61, a3);

          if ((v62 & 1) != 0)
          {
LABEL_27:
            v6 = 1;
LABEL_57:
            _Block_object_dispose(&v67, 8);

            return v6;
          }
        }
      }
      else
      {
        -[DIConvertParams outputParams](self, "outputParams");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21 == 0;

        if (!v22)
        {
          v23 = *__error();
          if (DIForwardLogs())
          {
            v66 = 0;
            getDIOSLog();
            v24 = objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
            *(_DWORD *)buf = 68157954;
            v74 = 36;
            v75 = 2080;
            v76 = "-[DIConvertParams convertWithError:]";
            v25 = (char *)_os_log_send_and_compose_impl();

            if (v25)
            {
              fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v25);
              free(v25);
            }
          }
          else
          {
            getDIOSLog();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 68157954;
              v74 = 36;
              v75 = 2080;
              v76 = "-[DIConvertParams convertWithError:]";
              _os_log_impl(&dword_212EB0000, v30, OS_LOG_TYPE_ERROR, "%.*s: Due to the conversion error, erasing the output file", buf, 0x12u);
            }

          }
          *__error() = v23;
          -[DIConvertParams outputParams](self, "outputParams");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            -[DIConvertParams outputParams](self, "outputParams");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "onErrorCleanup");

          }
          else
          {
            -[DIConvertParams outputURL](self, "outputURL");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[DIConvertParams outputParams](self, "outputParams");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "inputURL");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = objc_msgSend(v34, "isEqual:", v36);

            if ((v37 & 1) == 0)
            {
              objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              -[DIConvertParams outputParams](self, "outputParams");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "inputURL");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "removeItemAtURL:error:", v40, 0);

            }
          }
        }
      }
LABEL_56:
      v6 = 0;
      goto LABEL_57;
    }
LABEL_40:

    goto LABEL_56;
  }
  v5 = CFSTR("Invalid output format argument");
  return +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 22, v5, a3);
}

uint64_t __36__DIConvertParams_convertWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "signalCommandCompletedWithXpcError:", a2);
}

- (void)invalidate
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DIConvertParams;
  -[DIBaseParams invalidate](&v5, sel_invalidate);
  -[DIConvertParams outputParams](self, "outputParams");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DIConvertParams outputParams](self, "outputParams");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

  }
}

+ (BOOL)isUDIFWithFormat:(int64_t)a3
{
  return (unint64_t)(a3 - 2) < 5;
}

- (int64_t)outputFormat
{
  return self->_outputFormat;
}

- (void)setOutputFormat:(int64_t)a3
{
  self->_outputFormat = a3;
}

- (BOOL)passphrase
{
  return self->_passphrase;
}

- (void)setPassphrase:(BOOL)a3
{
  self->_passphrase = a3;
}

- (NSString)publicKey
{
  return self->_publicKey;
}

- (void)setPublicKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)certificate
{
  return self->_certificate;
}

- (void)setCertificate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (unint64_t)encryptionMethod
{
  return self->_encryptionMethod;
}

- (void)setEncryptionMethod:(unint64_t)a3
{
  self->_encryptionMethod = a3;
}

- (unint64_t)maxRawUDIFRunSize
{
  return self->_maxRawUDIFRunSize;
}

- (void)setMaxRawUDIFRunSize:(unint64_t)a3
{
  self->_maxRawUDIFRunSize = a3;
}

- (unint64_t)sparseBundleBandSize
{
  return self->_sparseBundleBandSize;
}

- (void)setSparseBundleBandSize:(unint64_t)a3
{
  self->_sparseBundleBandSize = a3;
}

- (BOOL)useFormatMappingInfo
{
  return self->_useFormatMappingInfo;
}

- (void)setUseFormatMappingInfo:(BOOL)a3
{
  self->_useFormatMappingInfo = a3;
}

- (DIURL)outputURL
{
  return self->_outputURL;
}

- (void)setOutputURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (DIBaseParams)outputParams
{
  return self->_outputParams;
}

- (void)setOutputParams:(id)a3
{
  objc_storeStrong((id *)&self->_outputParams, a3);
}

- (unint64_t)conversionMethod
{
  return self->_conversionMethod;
}

- (void)setConversionMethod:(unint64_t)a3
{
  self->_conversionMethod = a3;
}

- (NSArray)shadowURLs
{
  return self->_shadowURLs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shadowURLs, 0);
  objc_storeStrong((id *)&self->_outputParams, 0);
  objc_storeStrong((id *)&self->_outputURL, 0);
  objc_storeStrong((id *)&self->_certificate, 0);
  objc_storeStrong((id *)&self->_publicKey, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
