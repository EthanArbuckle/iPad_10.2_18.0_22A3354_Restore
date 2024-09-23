@implementation FBSWorkspaceSceneRequestOptions

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  NSString *identifier;
  objc_class *v5;
  void *v6;
  id v7;

  identifier = self->_identifier;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", identifier, CFSTR("id"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_workspaceIdentifier, CFSTR("workspace"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_initialClientSettings, CFSTR("client"));
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("spec"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_initialSettings, CFSTR("settings"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_transitionContext, CFSTR("transition"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_keyboardScene, CFSTR("kb"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_clientFuture, CFSTR("cf"));

}

- (FBSWorkspaceSceneRequestOptions)initWithBSXPCCoder:(id)a3
{
  id v5;
  FBSWorkspaceSceneRequestOptions *v6;
  NSString *v7;
  NSString *v8;
  Class v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  NSString *identifier;
  uint64_t v14;
  NSString *workspaceIdentifier;
  FBSSceneSpecification *v16;
  FBSSceneSpecification *specification;
  uint64_t v18;
  FBSSceneClientSettings *initialClientSettings;
  uint64_t v20;
  FBSSceneSettings *initialSettings;
  uint64_t v22;
  FBSSceneTransitionContext *transitionContext;
  objc_super v25;

  v5 = a3;
  v25.receiver = self;
  v25.super_class = (Class)FBSWorkspaceSceneRequestOptions;
  v6 = -[FBSWorkspaceSceneRequestOptions init](&v25, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "decodeStringForKey:", CFSTR("spec"));
    v7 = (NSString *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = NSClassFromString(v7);
      if (v9)
      {
        v10 = v9;
        if ((-[objc_class isSubclassOfClass:](v9, "isSubclassOfClass:", objc_opt_class()) & 1) != 0)
        {
LABEL_8:
          objc_msgSend(v5, "decodeStringForKey:", CFSTR("id"));
          v12 = objc_claimAutoreleasedReturnValue();
          identifier = v6->_identifier;
          v6->_identifier = (NSString *)v12;

          objc_msgSend(v5, "decodeStringForKey:", CFSTR("workspace"));
          v14 = objc_claimAutoreleasedReturnValue();
          workspaceIdentifier = v6->_workspaceIdentifier;
          v6->_workspaceIdentifier = (NSString *)v14;

          v16 = (FBSSceneSpecification *)objc_alloc_init(v10);
          specification = v6->_specification;
          v6->_specification = v16;

          objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("client"));
          v18 = objc_claimAutoreleasedReturnValue();
          initialClientSettings = v6->_initialClientSettings;
          v6->_initialClientSettings = (FBSSceneClientSettings *)v18;

          objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("settings"));
          v20 = objc_claimAutoreleasedReturnValue();
          initialSettings = v6->_initialSettings;
          v6->_initialSettings = (FBSSceneSettings *)v20;

          objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transition"));
          v22 = objc_claimAutoreleasedReturnValue();
          transitionContext = v6->_transitionContext;
          v6->_transitionContext = (FBSSceneTransitionContext *)v22;

          v6->_keyboardScene = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("kb"));
          v6->_clientFuture = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("cf"));

          goto LABEL_9;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("FBSWorkspaceSceneRequestOptions.m"), 64, CFSTR("Decoded specification \"%@\" is not a subclass of FBSSceneSpecification"), v8);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("FBSWorkspaceSceneRequestOptions.m"), 61, CFSTR("Decoded specification class name \"%@\" but could not resolve it via NSClassFromString()"), v8);
      }

    }
    v10 = 0;
    goto LABEL_8;
  }
LABEL_9:

  return v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)workspaceIdentifier
{
  return self->_workspaceIdentifier;
}

- (void)setWorkspaceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (FBSSceneSpecification)specification
{
  return self->_specification;
}

- (void)setSpecification:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (FBSSceneClientSettings)initialClientSettings
{
  return self->_initialClientSettings;
}

- (void)setInitialClientSettings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isKeyboardScene
{
  return self->_keyboardScene;
}

- (void)setKeyboardScene:(BOOL)a3
{
  self->_keyboardScene = a3;
}

- (FBSSceneTransitionContext)transitionContext
{
  return self->_transitionContext;
}

- (void)setTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_transitionContext, a3);
}

- (FBSSceneSettings)initialSettings
{
  return self->_initialSettings;
}

- (void)setInitialSettings:(id)a3
{
  objc_storeStrong((id *)&self->_initialSettings, a3);
}

- (BOOL)isClientFuture
{
  return self->_clientFuture;
}

- (void)setClientFuture:(BOOL)a3
{
  self->_clientFuture = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialSettings, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
  objc_storeStrong((id *)&self->_initialClientSettings, 0);
  objc_storeStrong((id *)&self->_specification, 0);
  objc_storeStrong((id *)&self->_workspaceIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
