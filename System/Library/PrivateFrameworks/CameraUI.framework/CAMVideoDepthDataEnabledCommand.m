@implementation CAMVideoDepthDataEnabledCommand

- (CAMVideoDepthDataEnabledCommand)initWithEnabled:(BOOL)a3
{
  CAMVideoDepthDataEnabledCommand *v4;
  CAMVideoDepthDataEnabledCommand *v5;
  CAMVideoDepthDataEnabledCommand *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMVideoDepthDataEnabledCommand;
  v4 = -[CAMCaptureCommand initWithSubcommands:](&v8, sel_initWithSubcommands_, 0);
  v5 = v4;
  if (v4)
  {
    v4->__enabled = a3;
    v6 = v4;
  }

  return v5;
}

- (CAMVideoDepthDataEnabledCommand)initWithSubcommands:(id)a3
{
  return -[CAMVideoDepthDataEnabledCommand initWithEnabled:](self, "initWithEnabled:", 0);
}

- (CAMVideoDepthDataEnabledCommand)initWithCoder:(id)a3
{
  return -[CAMVideoDepthDataEnabledCommand initWithEnabled:](self, "initWithEnabled:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("CAMVideoDepthDataEnabledCommandKey")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMVideoDepthDataEnabledCommand;
  v4 = a3;
  -[CAMCaptureCommand encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", -[CAMVideoDepthDataEnabledCommand _isEnabled](self, "_isEnabled", v5.receiver, v5.super_class), CFSTR("CAMVideoDepthDataEnabledCommandKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMVideoDepthDataEnabledCommand;
  v4 = -[CAMCaptureCommand copyWithZone:](&v6, sel_copyWithZone_, a3);
  v4[24] = -[CAMVideoDepthDataEnabledCommand _isEnabled](self, "_isEnabled");
  return v4;
}

- (void)executeWithContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[16];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "currentMovieFileOutput");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentVideoDeviceInput");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentCaptureSession");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5 && v6 && v7)
  {
    v9 = (void *)*MEMORY[0x1E0C8A7C0];
    objc_msgSend(v5, "connectionWithMediaType:", *MEMORY[0x1E0C8A7C0]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[CAMVideoDepthDataEnabledCommand _isEnabled](self, "_isEnabled");
    v12 = objc_msgSend(v10, "isEnabled");
    if (v11 || !v10)
    {
      if (((!v11 | v12) & 1) == 0)
      {
        v24 = v10;
        v26 = v4;
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v5, "setDepthCaptureEnabled:", 1);
        v25 = v6;
        objc_msgSend(v6, "ports");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 0u;
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v29;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v29 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
              objc_msgSend(v18, "mediaType");
              v19 = (void *)objc_claimAutoreleasedReturnValue();

              if (v19 == v9)
              {
                v20 = (void *)MEMORY[0x1E0C8B070];
                v32 = v18;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "connectionWithInputPorts:output:", v21, v5);
                v22 = (void *)objc_claimAutoreleasedReturnValue();

                if (v22 && objc_msgSend(v8, "canAddConnection:", v22))
                {
                  objc_msgSend(v8, "addConnection:", v22);
                }
                else
                {
                  v23 = os_log_create("com.apple.camera", "Camera");
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1DB760000, v23, OS_LOG_TYPE_DEFAULT, "Unable to add depth connection to capture session", buf, 2u);
                  }

                }
              }
            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
          }
          while (v15);
        }

        v6 = v25;
        v4 = v26;
        v10 = v24;
      }
    }
    else
    {
      objc_msgSend(v8, "removeConnection:", v10);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v5, "setDepthCaptureEnabled:", 0);
    }

  }
}

- (BOOL)_isEnabled
{
  return self->__enabled;
}

@end
