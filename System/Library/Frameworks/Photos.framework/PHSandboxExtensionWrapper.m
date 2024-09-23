@implementation PHSandboxExtensionWrapper

- (void)dealloc
{
  objc_super v3;

  if ((self->_handle & 0x8000000000000000) == 0)
    sandbox_extension_release();
  v3.receiver = self;
  v3.super_class = (Class)PHSandboxExtensionWrapper;
  -[PHSandboxExtensionWrapper dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
}

+ (PHSandboxExtensionWrapper)wrapperWithToken:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  v4 = objc_alloc((Class)objc_opt_class());
  v5 = (void *)objc_msgSend(v3, "copy");

  if (v5)
  {
    objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    v6 = sandbox_extension_consume();
  }
  else
  {
    v6 = -1;
  }
  v7 = (void *)v4[1];
  v4[1] = v5;
  v4[2] = v6;

  return (PHSandboxExtensionWrapper *)v4;
}

@end
