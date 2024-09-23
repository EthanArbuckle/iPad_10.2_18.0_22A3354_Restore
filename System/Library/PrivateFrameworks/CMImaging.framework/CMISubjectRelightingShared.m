@implementation CMISubjectRelightingShared

- (id)getShaders:(id)a3
{
  id v4;
  CMISubjectRelightingShaders **p_shaders;
  CMISubjectRelightingShaders *shaders;
  CMISubjectRelightingShaders *v7;

  v4 = a3;
  shaders = self->_shaders;
  p_shaders = &self->_shaders;
  v7 = shaders;
  if (!v7)
  {
    v7 = -[CMISubjectRelightingShaders initWithMetalContext:]([CMISubjectRelightingShaders alloc], "initWithMetalContext:", v4);
    if (v7)
    {
      objc_storeStrong((id *)p_shaders, v7);
    }
    else
    {
      FigDebugAssert3();
      FigSignalErrorAt();
    }
  }

  return v7;
}

+ (id)sharedInstance
{
  return +[CMISubjectRelightingShared getSharedInstanceOrRelease:](CMISubjectRelightingShared, "getSharedInstanceOrRelease:", 0);
}

+ (void)releaseSharedInstance
{
  id v2;

  v2 = +[CMISubjectRelightingShared getSharedInstanceOrRelease:](CMISubjectRelightingShared, "getSharedInstanceOrRelease:", 1);
}

+ (id)getSharedInstanceOrRelease:(BOOL)a3
{
  void *v4;
  void *v5;
  CMISubjectRelightingShared *v6;
  id v7;

  objc_opt_class();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  v5 = (void *)getSharedInstanceOrRelease__singleton_0;
  if (a3)
  {
    v6 = 0;
LABEL_5:
    getSharedInstanceOrRelease__singleton_0 = (uint64_t)v6;

    goto LABEL_6;
  }
  if (!getSharedInstanceOrRelease__singleton_0)
  {
    v6 = objc_alloc_init(CMISubjectRelightingShared);
    v5 = (void *)getSharedInstanceOrRelease__singleton_0;
    goto LABEL_5;
  }
LABEL_6:
  v7 = (id)getSharedInstanceOrRelease__singleton_0;
  objc_sync_exit(v4);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shaders, 0);
}

@end
