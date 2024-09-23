@implementation DiskImageParamsRAM_XPC

- (DiskImageParamsRAM_XPC)initWithURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  RamXPC *v10;
  DiskImageParamsRAM_XPC *v11;
  uint64_t v12;
  NSString *ramSizeStr;
  DiskImageParamsRAM_XPC *v14;
  objc_super v16;

  v6 = a3;
  objc_msgSend(v6, "host");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && (objc_msgSend(v6, "host"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = +[DIHelpers numBlocksWithSizeStr:blockSize:](DIHelpers, "numBlocksWithSizeStr:blockSize:", v8, 512), v8, v9))
  {
    v10 = -[RamXPC initWithSize:]([RamXPC alloc], "initWithSize:", v9 << 9);
    v16.receiver = self;
    v16.super_class = (Class)DiskImageParamsRAM_XPC;
    v11 = -[DiskImageParamsXPC initWithBackendXPC:](&v16, sel_initWithBackendXPC_, v10);
    if (v11)
    {
      objc_msgSend(v6, "host");
      v12 = objc_claimAutoreleasedReturnValue();
      ramSizeStr = v11->_ramSizeStr;
      v11->_ramSizeStr = (NSString *)v12;

    }
    self = v11;

    v14 = self;
  }
  else
  {
    +[DIError nilWithPOSIXCode:description:error:](DIError, "nilWithPOSIXCode:description:error:", 22, CFSTR("Malformed ram URL, expected to be ram://<?? | ??b | ??k | ??m | ??g | ??t>"), a4);
    v14 = (DiskImageParamsRAM_XPC *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (unique_ptr<DiskImage,)createSinkDiskImage
{
  void *v3;
  unique_ptr<DiskImage, std::default_delete<DiskImage>> v4;
  objc_super v5;

  -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createRamBackend");
  v5.receiver = self;
  v5.super_class = (Class)DiskImageParamsRAM_XPC;
  -[DiskImageParamsRaw_XPC createSinkDiskImage](&v5, sel_createSinkDiskImage);

  return v4;
}

- (void)setBlockSize:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  RamXPC *v7;
  objc_super v8;

  -[DiskImageParamsRAM_XPC ramSizeStr](self, "ramSizeStr");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[DIHelpers numBlocksWithSizeStr:blockSize:](DIHelpers, "numBlocksWithSizeStr:blockSize:", v5, a3);

  v7 = -[RamXPC initWithSize:]([RamXPC alloc], "initWithSize:", v6 * a3);
  -[DiskImageParamsXPC setBackendXPC:](self, "setBackendXPC:", v7);

  v8.receiver = self;
  v8.super_class = (Class)DiskImageParamsRAM_XPC;
  -[DiskImageParamsXPC setBlockSize:](&v8, sel_setBlockSize_, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)ramSizeStr
{
  return self->_ramSizeStr;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ramSizeStr, 0);
}

@end
