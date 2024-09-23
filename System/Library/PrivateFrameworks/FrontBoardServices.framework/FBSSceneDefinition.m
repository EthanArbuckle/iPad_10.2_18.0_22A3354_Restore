@implementation FBSSceneDefinition

- (FBSSceneIdentity)identity
{
  return self->_identity;
}

- (FBSSceneClientIdentity)clientIdentity
{
  return self->_clientIdentity;
}

- (FBSSceneSpecification)specification
{
  return self->_specification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specification, 0);
  objc_storeStrong((id *)&self->_clientIdentity, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (BOOL)isValid
{
  return -[FBSSceneIdentity isValid](self->_identity, "isValid")
      && -[FBSSceneClientIdentity isValid](self->_clientIdentity, "isValid")
      && -[FBSSceneSpecification isValid](self->_specification, "isValid");
}

+ (id)definition
{
  return objc_alloc_init((Class)a1);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  FBSMutableSceneDefinition *v4;

  v4 = -[FBSMutableSceneDefinition init](+[FBSMutableSceneDefinition allocWithZone:](FBSMutableSceneDefinition, "allocWithZone:", a3), "init");
  -[FBSSceneDefinition setIdentity:](v4, "setIdentity:", self->_identity);
  -[FBSSceneDefinition setClientIdentity:](v4, "setClientIdentity:", self->_clientIdentity);
  -[FBSSceneDefinition setSpecification:](v4, "setSpecification:", self->_specification);
  return v4;
}

- (void)setIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setSpecification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setClientIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)description
{
  return (NSString *)-[FBSSceneDefinition descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (BOOL)isEqual:(id)a3
{
  FBSSceneDefinition *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  FBSSceneDefinition *v8;
  id v9;
  void *v10;
  FBSSceneDefinition *v11;
  id v12;
  void *v13;
  id v14;
  char v15;
  _QWORD v17[4];
  FBSSceneDefinition *v18;
  _QWORD v19[4];
  FBSSceneDefinition *v20;
  _QWORD v21[4];
  FBSSceneDefinition *v22;

  v4 = (FBSSceneDefinition *)a3;
  if (self == v4)
  {
    v15 = 1;
  }
  else
  {
    objc_msgSend(off_1E38E9E00, "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSSceneDefinition identity](self, "identity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __30__FBSSceneDefinition_isEqual___block_invoke;
    v21[3] = &unk_1E38EBB48;
    v8 = v4;
    v22 = v8;
    v9 = (id)objc_msgSend(v5, "appendObject:counterpart:", v6, v21);

    -[FBSSceneDefinition clientIdentity](self, "clientIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v7;
    v19[1] = 3221225472;
    v19[2] = __30__FBSSceneDefinition_isEqual___block_invoke_2;
    v19[3] = &unk_1E38EBB48;
    v11 = v8;
    v20 = v11;
    v12 = (id)objc_msgSend(v5, "appendObject:counterpart:", v10, v19);

    -[FBSSceneDefinition specification](self, "specification");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v7;
    v17[1] = 3221225472;
    v17[2] = __30__FBSSceneDefinition_isEqual___block_invoke_3;
    v17[3] = &unk_1E38EBB48;
    v18 = v11;
    v14 = (id)objc_msgSend(v5, "appendObject:counterpart:", v13, v17);

    v15 = objc_msgSend(v5, "isEqual");
  }

  return v15;
}

uint64_t __30__FBSSceneDefinition_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "identity");
}

uint64_t __30__FBSSceneDefinition_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clientIdentity");
}

uint64_t __30__FBSSceneDefinition_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "specification");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;

  objc_msgSend(off_1E38E9E08, "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSceneDefinition identity](self, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  v6 = objc_msgSend(v3, "hash");
  return v6;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[FBSSceneDefinition succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  objc_msgSend(off_1E38E9DF0, "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSSceneIdentity identifier](self->_identity, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("identifier"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[FBSSceneDefinition descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
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
  FBSSceneDefinition *v11;

  v4 = a3;
  -[FBSSceneDefinition succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__FBSSceneDefinition_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E38EAE08;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __60__FBSSceneDefinition_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("identity"));

  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "clientIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", v6, CFSTR("clientIdentity"));

  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "specification");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "appendObject:withName:", v10, CFSTR("specification"));

}

@end
