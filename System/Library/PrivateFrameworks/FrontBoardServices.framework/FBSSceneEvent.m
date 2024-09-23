@implementation FBSSceneEvent

- (void)setTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_transitionContext, a3);
}

- (void)setSource:(int64_t)a3
{
  self->_source = a3;
}

- (FBSSceneEvent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBSSceneEvent;
  return -[FBSSceneMessage init](&v3, sel_init);
}

- (void)setClientSettingsDiff:(id)a3
{
  objc_storeStrong((id *)&self->_clientSettingsDiff, a3);
}

- (void)setSettingsDiff:(id)a3
{
  objc_storeStrong((id *)&self->_settingsDiff, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_clientSettingsDiff, 0);
  objc_storeStrong((id *)&self->_settingsDiff, 0);
}

- (FBSSceneSettingsDiff)settingsDiff
{
  return self->_settingsDiff;
}

- (FBSSceneTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (NSSet)actions
{
  return (NSSet *)-[FBSSceneTransitionContext actions](self->_transitionContext, "actions");
}

- (id)description
{
  return -[FBSSceneEvent descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSSceneEvent succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSSceneEvent descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  unint64_t source;
  __CFString *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  FBSSceneEvent *v15;

  v4 = a3;
  -[FBSSceneEvent succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  source = self->_source;
  if (source > 2)
    v8 = 0;
  else
    v8 = off_1E38ECDF0[source];
  v9 = (id)objc_msgSend(v5, "appendObject:withName:", v8, CFSTR("source"));
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__FBSSceneEvent_descriptionBuilderWithMultilinePrefix___block_invoke;
  v13[3] = &unk_1E38EAE08;
  v10 = v6;
  v14 = v10;
  v15 = self;
  objc_msgSend(v10, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v13);

  v11 = v10;
  return v11;
}

void __55__FBSSceneEvent_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "settingsDiff");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:skipIfNil:", v3, CFSTR("settingsDiff"), 1);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "clientSettingsDiff");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:skipIfNil:", v6, CFSTR("clientSettingsDiff"), 1);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "transitionContext");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "appendObject:withName:skipIfNil:", v9, CFSTR("transitionContext"), 1);

  objc_msgSend(*(id *)(a1 + 40), "payload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v11, "isEmpty");

  if ((v9 & 1) == 0)
  {
    v12 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "payload");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v12, "appendObject:withName:", v14, CFSTR("payload"));

  }
}

- (int64_t)source
{
  return self->_source;
}

- (FBSSceneClientSettingsDiff)clientSettingsDiff
{
  return self->_clientSettingsDiff;
}

@end
