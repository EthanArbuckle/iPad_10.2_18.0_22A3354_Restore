@implementation DTUVShellPipeService

+ (void)registerCapabilities:(id)a3
{
  objc_msgSend(a3, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.ultraviolet.shell-pipe"), 1, a1);
}

- (id)createExternalService:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;

  v5 = a3;
  DTUVSharedServiceFactory(a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14 = (void *)objc_msgSend(v6, "newShellPipeService:error:", v5, a4);
  }
  else if (a4)
  {
    DTUVServiceError(CFSTR("This version of PreviewsOSSupport doesn't support shell message streams. Please update your OS."), v7, v8, v9, v10, v11, v12, v13, v16);
    v14 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

@end
