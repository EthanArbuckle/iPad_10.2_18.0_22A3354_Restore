@implementation FBSClientSceneFutureDefinition

- (FBSClientSceneFutureDefinition)initWithWorkspaceID:(id)a3
{
  id v4;
  FBSClientSceneFutureDefinition *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  FBSSceneIdentity *identity;
  uint64_t v10;
  FBSSceneSpecification *specification;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FBSClientSceneFutureDefinition;
  v5 = -[FBSClientSceneFutureDefinition init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBSSceneIdentity identityForIdentifier:workspaceIdentifier:](FBSSceneIdentity, "identityForIdentifier:workspaceIdentifier:", v7, v4);
    v8 = objc_claimAutoreleasedReturnValue();
    identity = v5->_identity;
    v5->_identity = (FBSSceneIdentity *)v8;

    +[FBSSceneSpecification specification](FBSSceneSpecification, "specification");
    v10 = objc_claimAutoreleasedReturnValue();
    specification = v5->_specification;
    v5->_specification = (FBSSceneSpecification *)v10;

  }
  return v5;
}

- (void)setIdentifier:(id)a3
{
  void *v4;
  void *v5;
  FBSSceneIdentity *v6;
  FBSSceneIdentity *identity;
  id v8;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  -[FBSSceneIdentity workspaceIdentifier](self->_identity, "workspaceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBSSceneIdentity identityForIdentifier:workspaceIdentifier:](FBSSceneIdentity, "identityForIdentifier:workspaceIdentifier:", v8, v5);
  v6 = (FBSSceneIdentity *)objc_claimAutoreleasedReturnValue();
  identity = self->_identity;
  self->_identity = v6;

}

- (void)setSpecification:(id)a3
{
  id v4;
  FBSSceneSpecification *v5;
  FBSSceneSpecification *specification;
  void *v7;
  id v8;

  v4 = a3;
  if (self->_parameters)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("cannot change specification after configuring parameters"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSClientSceneFutureDefinition setSpecification:].cold.1();
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    v8 = v4;
    if (v4)
    {
      v5 = (FBSSceneSpecification *)v4;
    }
    else
    {
      +[FBSSceneSpecification specification](FBSSceneSpecification, "specification");
      v5 = (FBSSceneSpecification *)objc_claimAutoreleasedReturnValue();
    }
    specification = self->_specification;
    self->_specification = v5;

  }
}

- (void)configureParameters:(id)a3
{
  id v4;
  FBSMutableSceneParameters *parameters;
  FBSMutableSceneParameters *v6;
  FBSMutableSceneParameters *v7;
  id v8;

  v4 = a3;
  parameters = self->_parameters;
  v8 = v4;
  if (!parameters)
  {
    +[FBSSceneParameters parametersForSpecification:](FBSMutableSceneParameters, "parametersForSpecification:", self->_specification);
    v6 = (FBSMutableSceneParameters *)objc_claimAutoreleasedReturnValue();
    v7 = self->_parameters;
    self->_parameters = v6;

    v4 = v8;
    parameters = self->_parameters;
  }
  (*((void (**)(id, FBSMutableSceneParameters *))v4 + 2))(v4, parameters);

}

- (FBSMutableSceneParameters)parameters
{
  FBSMutableSceneParameters *parameters;
  FBSMutableSceneParameters *v4;
  FBSMutableSceneParameters *v5;

  parameters = self->_parameters;
  if (!parameters)
  {
    +[FBSSceneParameters parametersForSpecification:](FBSMutableSceneParameters, "parametersForSpecification:", self->_specification);
    v4 = (FBSMutableSceneParameters *)objc_claimAutoreleasedReturnValue();
    v5 = self->_parameters;
    self->_parameters = v4;

    parameters = self->_parameters;
  }
  return parameters;
}

- (FBSSceneIdentity)identity
{
  return self->_identity;
}

- (FBSSceneSpecification)specification
{
  return self->_specification;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specification, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

- (void)setSpecification:.cold.1()
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
