@implementation FBSceneUpdateContext

- (unint64_t)transactionID
{
  return self->_transactionID;
}

- (FBSSceneSettings)settings
{
  return self->_settings;
}

- (FBSSceneTransitionContext)transitionContext
{
  return (FBSSceneTransitionContext *)objc_loadWeakRetained((id *)&self->_transitionContext);
}

- (FBSSceneSettingsDiff)settingsDiff
{
  return self->_settingsDiff;
}

+ (id)contextWithSceneID:(id)a3 transactionID:(unint64_t)a4 settings:(id)a5 settingsDiff:(id)a6 transitionContext:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = objc_alloc_init((Class)a1);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    v18 = (void *)*((_QWORD *)v16 + 2);
    *((_QWORD *)v16 + 2) = v17;

    *((_QWORD *)v16 + 3) = a4;
    objc_storeStrong((id *)v16 + 4, a5);
    objc_storeStrong((id *)v16 + 5, a6);
    objc_storeWeak((id *)v16 + 6, v15);
    *((_BYTE *)v16 + 8) = objc_msgSend(v15, "isRunningBoardAssertionDisabled");
  }

  return v16;
}

- (BOOL)isClientLifecycleExternallyManaged
{
  return self->_lifecycleExternallyManaged;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientContext, 0);
  objc_destroyWeak((id *)&self->_transitionContext);
  objc_storeStrong((id *)&self->_settingsDiff, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_sceneID, 0);
}

- (NSString)debugDescription
{
  return (NSString *)-[FBSceneUpdateContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSceneUpdateContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D22FA0], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_sceneID, CFSTR("scene"));
  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", self->_transactionID, CFSTR("tID"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSceneUpdateContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  FBSceneUpdateContext *v11;

  v4 = a3;
  -[FBSceneUpdateContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__FBSceneUpdateContext_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E4A11FD0;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __62__FBSceneUpdateContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D22FA0], "succinctDescriptionForObject:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:skipIfNil:", v3, CFSTR("settings"), 1);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D22FA0], "succinctDescriptionForObject:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:skipIfNil:", v6, CFSTR("settingsDiff"), 1);

  v8 = (void *)MEMORY[0x1E0D22FA0];
  v9 = *(void **)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 48));
  objc_msgSend(v8, "succinctDescriptionForObject:", WeakRetained);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v9, "appendObject:withName:skipIfNil:", v11, CFSTR("transitionContext"), 1);

  v13 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:ifEqualTo:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 8), CFSTR("lifecycleExternallyManaged"), 1);
  v14 = *(void **)(a1 + 32);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 56))
  {
    objc_msgSend(MEMORY[0x1E0D22FA0], "descriptionForObject:");
    v17 = (id)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v14, "appendObject:withName:", v17, CFSTR("clientContext"));

  }
  else
  {
    v16 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", 0, CFSTR("clientContext"));
  }
}

- (NSString)sceneID
{
  return self->_sceneID;
}

- (NSObject)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

@end
