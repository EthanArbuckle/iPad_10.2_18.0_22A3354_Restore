@implementation SWCollaborationCoordinatorBSActionResponder

void __109__SWCollaborationCoordinatorBSActionResponder__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(MEMORY[0x1E0CD73C0], "actionWithDestinationAction:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);
  }

}

- (void)_appDidFinishLaunching:(id)a3
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CD73F8], "sharedManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationHasFinishedLaunching");

}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *);
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __109__SWCollaborationCoordinatorBSActionResponder__respondToActions_forFBSScene_inUIScene_fromTransitionContext___block_invoke;
  v19 = &unk_1E2873EB8;
  v9 = v7;
  v20 = v9;
  v10 = v8;
  v21 = v10;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v16);
  if (objc_msgSend(v9, "count", v16, v17, v18, v19))
  {
    SWFrameworkLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v23 = "-[SWCollaborationCoordinatorBSActionResponder _respondToActions:forFBSScene:inUIScene:fromTransitionContext:]";
      _os_log_impl(&dword_18EAB1000, v11, OS_LOG_TYPE_DEFAULT, "%s we have incoming actions to deliver to the collaboration coordinator.", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CD73F8], "sharedManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "processIncomingActions:", v13);

  }
  v14 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v14, "minusSet:", v10);

  return v14;
}

void __68__SWCollaborationCoordinatorBSActionResponder_sharedActionResponder__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedActionResponder_shared;
  sharedActionResponder_shared = (uint64_t)v1;

}

- (SWCollaborationCoordinatorBSActionResponder)init
{
  SWCollaborationCoordinatorBSActionResponder *v2;
  void *v3;
  int v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SWCollaborationCoordinatorBSActionResponder;
  v2 = -[SWCollaborationCoordinatorBSActionResponder init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_hasApplicationCalledLaunchDelegate");

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CD73F8], "sharedManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "applicationHasFinishedLaunching");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__appDidFinishLaunching_, *MEMORY[0x1E0DC4770], 0);
    }

  }
  return v2;
}

+ (SWCollaborationCoordinatorBSActionResponder)sharedActionResponder
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__SWCollaborationCoordinatorBSActionResponder_sharedActionResponder__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedActionResponder_onceToken != -1)
    dispatch_once(&sharedActionResponder_onceToken, block);
  return (SWCollaborationCoordinatorBSActionResponder *)(id)sharedActionResponder_shared;
}

@end
