@implementation DiskImageParamsLocked_XPC

- (DiskImageParamsLocked_XPC)initWithBackendXPC:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DiskImageParamsLocked_XPC;
  return -[DiskImageParamsXPC initWithBackendXPC:](&v4, sel_initWithBackendXPC_, a3);
}

- (id)newWithPassphrase:(const char *)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  id v9;

  -[DiskImageParamsXPC backendXPC](self, "backendXPC");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newUnlockedBackendXPCWithPassphrase:certificate:isNewImage:error:", a3, 0, 0, a4);

  if (!v8)
    return 0;
  v9 = +[DiskImageParamsXPC newWithUnlockedBackendXPC:error:](DiskImageParamsXPC, "newWithUnlockedBackendXPC:error:", v8, a4);
  if (v9)
    objc_msgSend(v9, "setBlockSize:", -[DiskImageParamsXPC blockSize](self, "blockSize"));

  return v9;
}

- (unique_ptr<const)getImageInfoWithExtra:(BOOL)a3 error:(id *)a4
{
  _QWORD *v4;
  _QWORD *v5;
  crypto::header **v6;
  DiskImageInfo *v7;
  unique_ptr<const info::DiskImageInfo, std::default_delete<const info::DiskImageInfo>> v8;
  id v9;

  v5 = v4;
  -[DiskImageParamsXPC backendXPC](self, "backendXPC", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (crypto::header **)objc_msgSend(v9, "cryptoHeader");
  v7 = (DiskImageInfo *)operator new();
  info::DiskImageInfoLocked::DiskImageInfoLocked(v7, v6);
  *v5 = (char *)v7 + *(_QWORD *)(*(_QWORD *)v7 - 104);

  return v8;
}

@end
