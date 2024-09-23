@implementation MRAppDelegate

- (void)dealloc
{
  objc_super v3;

  -[MRAppDelegate _closeInterposeDylib](self, "_closeInterposeDylib");
  v3.receiver = self;
  v3.super_class = (Class)MRAppDelegate;
  -[MRAppDelegate dealloc](&v3, "dealloc");
}

- (void)_closeInterposeDylib
{
  void *interposeDylib;

  interposeDylib = self->_interposeDylib;
  if (interposeDylib)
  {
    dlclose(interposeDylib);
    self->_interposeDylib = 0;
  }
}

- (void)startupAndCreateViewController:(BOOL)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v10;
  void *v11;
  uint64_t (*v12)(void);
  uint64_t v13;
  void *v14;
  void *v15;
  char *v16;
  id v17;

  self->_shouldCreateViewController = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
  v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "environment"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("METAL_LOAD_INTERPOSER")));
  v6 = objc_msgSend(v5, "BOOLValue");

  if (v6)
  {
    v7 = (const char *)DYGetMTLInterposeDylibPath();
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("GT_HOST_URL_MTL")));
    v9 = "DYGetMTLGuestAppClient";
  }
  else
  {
    v7 = (const char *)DYGetGLInterposeDylibPath();
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("GT_HOST_URL_GL")));
    v9 = "DYGetGLGuestAppClient";
  }
  v10 = (void *)v8;
  if (self->_interposeDylib || (v11 = dlopen(v7, 9), (self->_interposeDylib = v11) != 0))
  {
    if (v10)
    {
      v12 = (uint64_t (*)(void))dlsym((void *)0xFFFFFFFFFFFFFFFELL, v9);
      if (!v12)
        __assert_rtn("-[MRAppDelegate startupAndCreateViewController:]", (const char *)&unk_1000055D9, 0, "GetGuestClient != NULL");
      v13 = v12();
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      if (!v14)
        __assert_rtn("-[MRAppDelegate startupAndCreateViewController:]", (const char *)&unk_1000055D9, 0, "appClient != nil");
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[MRReplayController sharedController](MRReplayController, "sharedController"));
      if ((objc_msgSend(v15, "initializeTransportWith:", v14) & 1) != 0)
      {
        objc_msgSend(v15, "setDelegate:", self);
        if ((objc_msgSend(v15, "informReady") & 1) != 0)
        {

          return;
        }
        dy_abort("inform ready failed");
      }
      else
      {
        dy_abort("transport could not be initialized");
      }
    }
    else
    {
      dy_abort("no transport url is provided");
    }
  }
  else
  {
    v16 = dlerror();
    dy_abort("failed to dlopen interpose dylib: %s", v16);
  }
  __break(1u);
}

- (BOOL)shouldCreateViewController
{
  return self->_shouldCreateViewController;
}

@end
