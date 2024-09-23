@implementation FBSSceneSpecification

- (BOOL)_isSignificantTransitionContext:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  objc_class *v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = 1;
    if (objc_msgSend(v4, "_isEmptyForCoding:", 1))
    {
      v7 = (objc_class *)objc_opt_class();
      v6 = v7 != -[FBSSceneSpecification transitionContextClass](self, "transitionContextClass");
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isValid
{
  objc_class *v3;

  v3 = -[FBSSceneSpecification settingsClass](self, "settingsClass");
  if (v3)
  {
    v3 = -[FBSSceneSpecification clientSettingsClass](self, "clientSettingsClass");
    if (v3)
      LOBYTE(v3) = -[FBSSceneSpecification transitionContextClass](self, "transitionContextClass") != 0;
  }
  return (char)v3;
}

- (NSArray)defaultExtensions
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

+ (id)specification
{
  return objc_alloc_init((Class)a1);
}

- (FBSSceneSpecification)init
{
  FBSSceneSpecification *v2;
  FBSSceneSpecification *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FBSSceneSpecification;
  v2 = -[FBSSceneSpecification init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = FBSGetDefaultExtensions(v2);
  return v3;
}

- (Class)hostAgentClass
{
  return 0;
}

- (Class)clientAgentClass
{
  return 0;
}

- (Class)settingsClass
{
  return (Class)objc_opt_class();
}

- (Class)clientSettingsClass
{
  return (Class)objc_opt_class();
}

- (Class)transitionContextClass
{
  return (Class)objc_opt_class();
}

- (NSString)description
{
  return (NSString *)-[FBSSceneSpecification descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (BOOL)isEqual:(id)a3
{
  FBSSceneSpecification *v4;
  void *v5;
  objc_class *v6;
  uint64_t v7;
  FBSSceneSpecification *v8;
  id v9;
  objc_class *v10;
  FBSSceneSpecification *v11;
  id v12;
  objc_class *v13;
  FBSSceneSpecification *v14;
  id v15;
  objc_class *v16;
  FBSSceneSpecification *v17;
  id v18;
  objc_class *v19;
  FBSSceneSpecification *v20;
  id v21;
  void *v22;
  id v23;
  char v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  FBSSceneSpecification *v30;
  _QWORD v31[4];
  FBSSceneSpecification *v32;
  _QWORD v33[4];
  FBSSceneSpecification *v34;
  _QWORD v35[4];
  FBSSceneSpecification *v36;
  _QWORD v37[4];
  FBSSceneSpecification *v38;
  _QWORD v39[4];
  FBSSceneSpecification *v40;

  v4 = (FBSSceneSpecification *)a3;
  if (self == v4)
  {
    v24 = 1;
  }
  else
  {
    objc_msgSend(off_1E38E9E00, "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[FBSSceneSpecification hostAgentClass](self, "hostAgentClass");
    v7 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __33__FBSSceneSpecification_isEqual___block_invoke;
    v39[3] = &unk_1E38ECEB0;
    v8 = v4;
    v40 = v8;
    v9 = (id)objc_msgSend(v5, "appendClass:counterpart:", v6, v39);
    v10 = -[FBSSceneSpecification clientAgentClass](self, "clientAgentClass");
    v37[0] = v7;
    v37[1] = 3221225472;
    v37[2] = __33__FBSSceneSpecification_isEqual___block_invoke_2;
    v37[3] = &unk_1E38ECEB0;
    v11 = v8;
    v38 = v11;
    v12 = (id)objc_msgSend(v5, "appendClass:counterpart:", v10, v37);
    v13 = -[FBSSceneSpecification settingsClass](self, "settingsClass");
    v35[0] = v7;
    v35[1] = 3221225472;
    v35[2] = __33__FBSSceneSpecification_isEqual___block_invoke_3;
    v35[3] = &unk_1E38ECEB0;
    v14 = v11;
    v36 = v14;
    v15 = (id)objc_msgSend(v5, "appendClass:counterpart:", v13, v35);
    v16 = -[FBSSceneSpecification clientSettingsClass](self, "clientSettingsClass");
    v33[0] = v7;
    v33[1] = 3221225472;
    v33[2] = __33__FBSSceneSpecification_isEqual___block_invoke_4;
    v33[3] = &unk_1E38ECEB0;
    v17 = v14;
    v34 = v17;
    v18 = (id)objc_msgSend(v5, "appendClass:counterpart:", v16, v33);
    v19 = -[FBSSceneSpecification transitionContextClass](self, "transitionContextClass");
    v31[0] = v7;
    v31[1] = 3221225472;
    v31[2] = __33__FBSSceneSpecification_isEqual___block_invoke_5;
    v31[3] = &unk_1E38ECEB0;
    v20 = v17;
    v32 = v20;
    v21 = (id)objc_msgSend(v5, "appendClass:counterpart:", v19, v31);
    -[FBSSceneSpecification defaultExtensions](self, "defaultExtensions");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v7;
    v27 = 3221225472;
    v28 = __33__FBSSceneSpecification_isEqual___block_invoke_6;
    v29 = &unk_1E38EC238;
    v30 = v20;
    v23 = (id)objc_msgSend(v5, "appendObject:counterpart:", v22, &v26);

    v24 = objc_msgSend(v5, "isEqual", v26, v27, v28, v29);
  }

  return v24;
}

uint64_t __33__FBSSceneSpecification_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "hostAgentClass");
}

uint64_t __33__FBSSceneSpecification_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clientAgentClass");
}

uint64_t __33__FBSSceneSpecification_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "settingsClass");
}

uint64_t __33__FBSSceneSpecification_isEqual___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clientSettingsClass");
}

uint64_t __33__FBSSceneSpecification_isEqual___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "transitionContextClass");
}

uint64_t __33__FBSSceneSpecification_isEqual___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "defaultExtensions");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  unint64_t v5;

  objc_msgSend(off_1E38E9E08, "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendClass:", -[FBSSceneSpecification settingsClass](self, "settingsClass"));
  v5 = objc_msgSend(v3, "hash");

  return v5;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSSceneSpecification succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[FBSSceneSpecification descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  FBSSceneSpecification *v11;

  v4 = a3;
  -[FBSSceneSpecification succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__FBSSceneSpecification_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E38EAE08;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __63__FBSSceneSpecification_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendClass:withName:", objc_msgSend(*(id *)(a1 + 40), "hostAgentClass"), CFSTR("hostAgentClass"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendClass:withName:", objc_msgSend(*(id *)(a1 + 40), "clientAgentClass"), CFSTR("clientAgentClass"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendClass:withName:", objc_msgSend(*(id *)(a1 + 40), "settingsClass"), CFSTR("settingsClass"));
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendClass:withName:", objc_msgSend(*(id *)(a1 + 40), "clientSettingsClass"), CFSTR("clientSettingsClass"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendClass:withName:", objc_msgSend(*(id *)(a1 + 40), "transitionContextClass"), CFSTR("transitionContextClass"));
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "defaultExtensions");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendArraySection:withName:skipIfEmpty:", v8, CFSTR("defaultExtensions"), 1);

}

@end
