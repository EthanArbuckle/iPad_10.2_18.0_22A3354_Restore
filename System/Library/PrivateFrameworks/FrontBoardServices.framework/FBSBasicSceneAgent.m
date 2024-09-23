@implementation FBSBasicSceneAgent

- (void)scene:(id)a3 reviewEvent:(id)a4 withCompletion:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  id WeakRetained;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);

  if (WeakRetained == v12)
  {
    if (v9)
      v9[2](v9, 0);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_scene == scene"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSBasicSceneAgent scene:reviewEvent:withCompletion:].cold.1();
    objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (NSString)description
{
  return (NSString *)-[FBSBasicSceneAgent descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (void)_configureWithScene:(id)a3
{
  objc_storeWeak((id *)&self->_scene, a3);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSBasicSceneAgent descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  -[FBSBasicSceneAgent succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__FBSBasicSceneAgent_descriptionBuilderWithMultilinePrefix___block_invoke;
    v9[3] = &unk_1E38EAE08;
    v10 = v6;
    v11 = WeakRetained;
    objc_msgSend(v10, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  }
  return v7;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  id WeakRetained;
  void *v5;
  id v6;

  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  objc_msgSend(WeakRetained, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:skipIfNil:", v5, CFSTR("sceneID"), 1);

  return v3;
}

- (void)didReceiveMessage:(id)a3 fromCounterpartAgent:(id)a4 withResponseSender:(id)a5
{
  if (a5)
    (*((void (**)(id, _QWORD))a5 + 2))(a5, 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSBasicSceneAgent succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __60__FBSBasicSceneAgent_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "callOutQueue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("queue"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", v6, CFSTR("paremeters"));

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "clientProcess");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "appendObject:withName:", v9, CFSTR("clientProcess"));

  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "hostProcess");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "appendObject:withName:", v13, CFSTR("hostProcess"));

}

- (FBSSceneHandle)scene
{
  return (FBSSceneHandle *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scene);
}

- (void)scene:reviewEvent:withCompletion:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
