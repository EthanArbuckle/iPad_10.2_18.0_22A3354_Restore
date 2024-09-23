@implementation FBSSceneTransitionContext

+ (Class)_baseClass
{
  return (Class)objc_opt_class();
}

+ (Class)subclassExtension
{
  return (Class)objc_opt_class();
}

+ (id)transitionContext
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSettings:", 0);
}

- (FBSSceneTransitionContext)initWithSettings:(id)a3
{
  id v4;
  FBSSceneTransitionContext *v5;
  FBSSceneTransitionContext *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FBSSceneTransitionContext;
  v5 = -[FBSSettings initWithSettings:](&v10, sel_initWithSettings_, v4);
  v6 = v5;
  if (v4 && v5)
  {
    -[FBSSceneTransitionContext setUpdateContext:](v5, "setUpdateContext:", 0);
    objc_msgSend(v4, "animationFence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    -[FBSSceneTransitionContext setAnimationFence:](v6, "setAnimationFence:", v8);

  }
  return v6;
}

+ (id)_settingsExtensionsForSceneExtension:(Class)a3
{
  return (id)-[objc_class transitionContextExtensions](a3, "transitionContextExtensions");
}

+ (Class)immutableSubclass
{
  return 0;
}

- (void)addAction:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSSceneTransitionContext addActions:](self, "addActions:", v4);

}

- (void)addActions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "count"))
  {
    -[FBSSceneTransitionContext actions](self, "actions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

    objc_msgSend(v8, "unionSet:", v9);
    -[FBSSceneTransitionContext setActions:](self, "setActions:", v8);

  }
}

- (void)removeAction:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[FBSSceneTransitionContext removeActions:](self, "removeActions:", v4);

}

- (void)removeActions:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    -[FBSSceneTransitionContext actions](self, "actions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "minusSet:", v6);
      -[FBSSceneTransitionContext setActions:](self, "setActions:", v5);
    }

  }
}

@end
