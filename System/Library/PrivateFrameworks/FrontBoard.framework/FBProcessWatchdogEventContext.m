@implementation FBProcessWatchdogEventContext

+ (id)contextForEvent:(int64_t)a3 settings:(id)a4 transitionContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;

  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init((Class)a1);
  v11 = (void *)*((_QWORD *)v10 + 2);
  *((_QWORD *)v10 + 1) = a3;
  *((_QWORD *)v10 + 2) = v8;
  v12 = v8;

  objc_storeWeak((id *)v10 + 3, v9);
  objc_msgSend(v9, "updateContext");
  v13 = objc_claimAutoreleasedReturnValue();

  v14 = (void *)*((_QWORD *)v10 + 4);
  *((_QWORD *)v10 + 4) = v13;

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneUpdateContext, 0);
  objc_destroyWeak((id *)&self->_sceneTransitionContext);
  objc_storeStrong((id *)&self->_sceneSettings, 0);
}

- (int64_t)event
{
  return self->_event;
}

- (FBSSceneTransitionContext)sceneTransitionContext
{
  return (FBSSceneTransitionContext *)objc_loadWeakRetained((id *)&self->_sceneTransitionContext);
}

- (FBSSceneSettings)sceneSettings
{
  return self->_sceneSettings;
}

- (NSString)description
{
  return (NSString *)-[FBProcessWatchdogEventContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBProcessWatchdogEventContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromProcessWatchdogEvent(self->_event);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("event"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBProcessWatchdogEventContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  FBProcessWatchdogEventContext *v10;

  v4 = a3;
  -[FBProcessWatchdogEventContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_sceneUpdateContext)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __71__FBProcessWatchdogEventContext_descriptionBuilderWithMultilinePrefix___block_invoke;
    v8[3] = &unk_1E4A11FD0;
    v9 = v5;
    v10 = self;
    objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v8);

  }
  return v6;
}

id __71__FBProcessWatchdogEventContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32), CFSTR("updateContext"));
}

- (FBSceneUpdateContext)sceneUpdateContext
{
  return self->_sceneUpdateContext;
}

@end
