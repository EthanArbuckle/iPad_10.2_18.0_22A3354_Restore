@implementation FBSSceneComponent

- (FBSSceneComponent)initWithScene:(id)a3
{
  id v5;
  FBSSceneComponent *v6;
  FBSSceneComponent *v7;

  v5 = a3;
  v6 = -[FBSSceneComponent init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_scene, a3);

  return v7;
}

- (id)scene
{
  return self->_scene;
}

- (void)setScene:(id)a3
{
  FBSComponentScene *v5;
  FBSComponentScene *scene;
  void *v7;

  v5 = (FBSComponentScene *)a3;
  if (v5)
  {
    scene = self->_scene;
    self->_scene = v5;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("scene != ((void *)0)"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSSceneComponent setScene:].cold.1(a2, (uint64_t)self, (uint64_t)v7);
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (id)hostScene
{
  FBSComponentScene *scene;
  Class v3;
  FBSComponentScene *v4;
  FBSComponentScene *v5;
  FBSComponentScene *v6;

  scene = self->_scene;
  v3 = NSClassFromString(CFSTR("FBScene"));
  v4 = scene;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (id)clientScene
{
  FBSComponentScene *scene;
  uint64_t v3;
  FBSComponentScene *v4;
  FBSComponentScene *v5;
  FBSComponentScene *v6;

  scene = self->_scene;
  v3 = objc_opt_class();
  v4 = scene;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (void)invalidate
{
  FBSComponentScene *scene;

  scene = self->_scene;
  self->_scene = 0;

  self->_invalid = 1;
}

- (BOOL)isValid
{
  return !self->_invalid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scene, 0);
}

- (void)setScene:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("FBSSceneComponent.m");
  v16 = 1024;
  v17 = 33;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
