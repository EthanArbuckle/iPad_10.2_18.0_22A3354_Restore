@implementation DYEAGLFunctionPlayerOverride

- (DYGLFunctionPlayer)strongFunctionPlayer
{
  return (DYGLFunctionPlayer *)objc_loadWeakRetained((id *)&self->_functionPlayer);
}

- (DYEAGLFunctionPlayerOverride)init
{
  -[DYEAGLFunctionPlayerOverride doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (DYEAGLFunctionPlayerOverride)initWithFunctionPlayer:(id)a3 overrideKey:(id)a4
{
  id v6;
  id v7;
  DYEAGLFunctionPlayerOverride *v8;
  DYEAGLFunctionPlayerOverride *v9;
  DYEAGLFunctionPlayerOverride *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)DYEAGLFunctionPlayerOverride;
  v8 = -[DYEAGLFunctionPlayerOverride init](&v12, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_functionPlayer, v6);
    objc_storeStrong((id *)&v9->_overrideKey, a4);
    v10 = v9;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_functionPlayer, 0);
  v3.receiver = self;
  v3.super_class = (Class)DYEAGLFunctionPlayerOverride;
  -[DYEAGLFunctionPlayerOverride dealloc](&v3, "dealloc");
}

- (void)onPlatformFunctionEnd
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  int v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayerOverride strongFunctionPlayer](self, "strongFunctionPlayer"));
  if (*(_DWORD *)objc_msgSend(v3, "function") != -8188)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayerOverride strongFunctionPlayer](self, "strongFunctionPlayer"));
    if (*(_DWORD *)objc_msgSend(v4, "function") != -8192)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayerOverride strongFunctionPlayer](self, "strongFunctionPlayer"));
      v8 = *(_DWORD *)objc_msgSend(v7, "function");

      if (v8 != -8191)
        return;
      goto LABEL_5;
    }

  }
LABEL_5:
  if (-[NSString isEqualToString:](self->_overrideKey, "isEqualToString:", kDYFunctionPlayerOverrideDisableColorWritesKey))
  {
    v11 = 1;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayerOverride strongFunctionPlayer](self, "strongFunctionPlayer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "context"));
    objc_msgSend(v6, "setParameter:to:", 602, &v11);
  }
  else if (-[NSString isEqualToString:](self->_overrideKey, "isEqualToString:", kDYFunctionPlayerOverrideDisableAllKey))
  {
    v10 = 3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayerOverride strongFunctionPlayer](self, "strongFunctionPlayer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "context"));
    objc_msgSend(v6, "setParameter:to:", 602, &v10);
  }
  else
  {
    if (!-[NSString isEqualToString:](self->_overrideKey, "isEqualToString:", kDYFunctionPlayerOverrideDisableRenderingKey))return;
    v9 = 2;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DYEAGLFunctionPlayerOverride strongFunctionPlayer](self, "strongFunctionPlayer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "context"));
    objc_msgSend(v6, "setParameter:to:", 602, &v9);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideKey, 0);
  objc_destroyWeak((id *)&self->_functionPlayer);
}

@end
