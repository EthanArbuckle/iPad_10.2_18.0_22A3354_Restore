@implementation MBCanRotateLogs

void __MBCanRotateLogs_block_invoke()
{
  void *v0;
  BOOL v1;
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  MBGetLogDir();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (v0)
  {
    v5 = v0;
    getpid();
    v4 = objc_msgSend(objc_retainAutorelease(v5), "fileSystemRepresentation");
    if (sandbox_check())
    {
      v1 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo", v4);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "processName");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      v1 = (objc_msgSend(v3, "isEqualToString:", CFSTR("healthd")) & 1) == 0
        && !objc_msgSend(v3, "isEqualToString:", CFSTR("imagent"));

    }
    v0 = v5;
    MBCanRotateLogs_sCanRotateLogs = v1;
  }

}

@end
