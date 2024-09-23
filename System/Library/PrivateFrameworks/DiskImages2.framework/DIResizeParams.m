@implementation DIResizeParams

- (DIResizeParams)initWithURL:(id)a3 size:(unint64_t)a4 error:(id *)a5
{
  DIResizeParams *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DIResizeParams;
  result = -[DIBaseParams initWithURL:error:](&v7, sel_initWithURL_error_, a3, a5);
  if (result)
    result->_size = a4;
  return result;
}

- (DIResizeParams)initWithExistingParams:(id)a3 size:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  DIResizeParams *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  DIResizeParams *v16;
  objc_super v18;

  v8 = a3;
  objc_msgSend(v8, "inputURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)DIResizeParams;
  v10 = -[DIBaseParams initWithURL:error:](&v18, sel_initWithURL_error_, v9, a5);

  if (!v10)
    goto LABEL_3;
  v10->_size = a4;
  objc_msgSend(v8, "diskImageParamsXPC");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DIBaseParams setDiskImageParamsXPC:](v10, "setDiskImageParamsXPC:", v11);

  -[DIBaseParams shadowChain](v10, "shadowChain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shadowChain");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "nodes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v12, "addShadowNodes:error:", v14, a5);

  if ((v15 & 1) == 0)
    v16 = 0;
  else
LABEL_3:
    v16 = v10;

  return v16;
}

- (DIResizeParams)initWithCoder:(id)a3
{
  id v4;
  DIResizeParams *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DIResizeParams;
  v5 = -[DIBaseParams initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_size = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("size"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)DIResizeParams;
  -[DIBaseParams encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInt64:forKey:", -[DIResizeParams size](self, "size"), CFSTR("size"));

}

- (BOOL)resizeWithError:(id *)a3
{
  int v5;
  NSObject *v6;
  char *v7;
  BOOL v8;
  NSObject *v9;
  DIClient2Controller_XPCHandler *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  NSObject *v21;
  char *v22;
  BOOL v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  NSObject *v30;
  unint64_t v31;
  char *v32;
  NSObject *v33;
  unint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint8_t buf[8];
  __int16 v39;
  const char *v40;
  __int16 v41;
  DIResizeParams *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if (-[DIBaseParams openExistingImageWithFlags:error:](self, "openExistingImageWithFlags:error:", 2, a3))
  {
    v5 = *__error();
    if (DIForwardLogs())
    {
      v37 = 0;
      getDIOSLog();
      v6 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
      *(_DWORD *)buf = 68158210;
      *(_DWORD *)&buf[4] = 34;
      v39 = 2080;
      v40 = "-[DIResizeParams resizeWithError:]";
      v41 = 2114;
      v42 = self;
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
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 68158210;
        *(_DWORD *)&buf[4] = 34;
        v39 = 2080;
        v40 = "-[DIResizeParams resizeWithError:]";
        v41 = 2114;
        v42 = self;
        _os_log_impl(&dword_212EB0000, v9, OS_LOG_TYPE_DEFAULT, "%.*s: entry: %{public}@", buf, 0x1Cu);
      }

    }
    *__error() = v5;
    v10 = objc_alloc_init(DIClient2Controller_XPCHandler);
    if (!-[DIClient2Controller_XPCHandler connectWithError:](v10, "connectWithError:", a3)
      || !-[DIBaseParams prepareImageWithXpcHandler:fileMode:error:](self, "prepareImageWithXpcHandler:fileMode:error:", v10, 1, a3))
    {
      v8 = 0;
LABEL_14:

      return v8;
    }
    v37 = 0;
    -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DIBaseParams shadowChain](self, "shadowChain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "shouldValidate");
    if (v11)
    {
      objc_msgSend(v11, "createDiskImageWithCache:shadowValidation:", 0, v13);
      v14 = *(_QWORD *)buf;
    }
    else
    {
      v14 = 0;
    }
    v37 = v14;
    *(_QWORD *)buf = 0;

    if (((*(uint64_t (**)(uint64_t))(*(_QWORD *)v37 + 40))(v37) & 1) != 0)
    {
      v16 = -[DIResizeParams size](self, "size");
      v17 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v37 + 24))(v37);
      v18 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v37 + 32))(v37);
      v19 = (v16 + v17 - 1) / v17 * v17;
      if ((*(uint64_t (**)(uint64_t))(*(_QWORD *)v37 + 24))(v37) * v18 == v19)
      {
        v20 = *__error();
        if (DIForwardLogs())
        {
          getDIOSLog();
          v21 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
          *(_DWORD *)buf = 68157954;
          *(_DWORD *)&buf[4] = 34;
          v39 = 2080;
          v40 = "-[DIResizeParams resizeWithError:]";
          v22 = (char *)_os_log_send_and_compose_impl();

          if (v22)
          {
            fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v22);
            free(v22);
          }
        }
        else
        {
          getDIOSLog();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 68157954;
            *(_DWORD *)&buf[4] = 34;
            v39 = 2080;
            v40 = "-[DIResizeParams resizeWithError:]";
            _os_log_impl(&dword_212EB0000, v26, OS_LOG_TYPE_DEFAULT, "%.*s: New disk image size is the same as previous", buf, 0x12u);
          }

        }
        *__error() = v20;
        v8 = 1;
        goto LABEL_30;
      }
      -[DIBaseParams diskImageParamsXPC](self, "diskImageParamsXPC");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "setSizeWithDiskImage:newSize:", &v37, v19);

      if (!(_DWORD)v25)
      {
        v28 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v37 + 32))(v37);
        -[DIResizeParams setSize:](self, "setSize:", (*(uint64_t (**)(uint64_t))(*(_QWORD *)v37 + 24))(v37) * v28);
        v29 = *__error();
        if (DIForwardLogs())
        {
          getDIOSLog();
          v30 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
          v31 = -[DIResizeParams size](self, "size");
          *(_DWORD *)buf = 68158210;
          *(_DWORD *)&buf[4] = 34;
          v39 = 2080;
          v40 = "-[DIResizeParams resizeWithError:]";
          v41 = 2048;
          v42 = (DIResizeParams *)v31;
          v32 = (char *)_os_log_send_and_compose_impl();

          if (v32)
          {
            fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", v32);
            free(v32);
          }
        }
        else
        {
          getDIOSLog();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
          {
            v34 = -[DIResizeParams size](self, "size");
            *(_DWORD *)buf = 68158210;
            *(_DWORD *)&buf[4] = 34;
            v39 = 2080;
            v40 = "-[DIResizeParams resizeWithError:]";
            v41 = 2048;
            v42 = (DIResizeParams *)v34;
            _os_log_impl(&dword_212EB0000, v33, OS_LOG_TYPE_DEFAULT, "%.*s: Disk image resized to %llu bytes", buf, 0x1Cu);
          }

        }
        *__error() = v29;
        v35 = (_QWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)v37 + 136))(v37);
        v36 = DiskImage::Context::flush(v35);
        if ((_DWORD)v36)
          v8 = +[DIError failWithPOSIXCode:error:](DIError, "failWithPOSIXCode:error:", v36, a3);
        else
          v8 = 1;
        if (v35)
          (*(void (**)(_QWORD *))(*v35 + 40))(v35);
        goto LABEL_30;
      }
      v23 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", v25, CFSTR("Failed to resize the image"), a3);
    }
    else
    {
      v23 = +[DIError failWithPOSIXCode:verboseInfo:error:](DIError, "failWithPOSIXCode:verboseInfo:error:", 45, CFSTR("Image doesn't support resizing"), a3);
    }
    v8 = v23;
LABEL_30:
    v27 = v37;
    v37 = 0;
    if (v27)
      (*(void (**)(uint64_t))(*(_QWORD *)v27 + 16))(v27);
    goto LABEL_14;
  }
  return 0;
}

- (unint64_t)size
{
  return self->_size;
}

- (void)setSize:(unint64_t)a3
{
  self->_size = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
