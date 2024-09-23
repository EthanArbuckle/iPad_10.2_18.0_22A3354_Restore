@implementation LNContinueInAppRequestSceneOptions

- (LNContinueInAppRequestSceneOptions)initWithActions:(id)a3 supportsNotices:(BOOL)a4 targetContentIdentifier:(id)a5
{
  id v10;
  id v11;
  void *v12;
  LNContinueInAppRequestSceneOptions *v13;
  LNContinueInAppRequestSceneOptions *v14;
  LNContinueInAppRequestSceneOptions *v15;
  void *v17;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNContinueInAppRequest.m"), 130, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("actions"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNContinueInAppRequest.m"), 131, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("targetContentIdentifier"));

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNContinueInAppRequestSceneOptions;
  v13 = -[LNContinueInAppRequestSceneOptions init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_actions, a3);
    v14->_supportsNotices = a4;
    objc_storeStrong((id *)&v14->_targetContentIdentifier, a5);
    v15 = v14;
  }

  return v14;
}

- (id)fbsOpenApplicationOptionsWithActionExecutorOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_opt_new();
  -[LNContinueInAppRequestSceneOptions actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D22CE0]);

  -[LNContinueInAppRequestSceneOptions targetContentIdentifier](self, "targetContentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v6, CFSTR("__TargetContentIdentifier"));

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[LNContinueInAppRequestSceneOptions actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("actions"));

  objc_msgSend(v4, "encodeBool:forKey:", -[LNContinueInAppRequestSceneOptions supportsNotices](self, "supportsNotices"), CFSTR("supportsNotices"));
  -[LNContinueInAppRequestSceneOptions targetContentIdentifier](self, "targetContentIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("targetContentIdentifier"));

}

- (LNContinueInAppRequestSceneOptions)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  LNContinueInAppRequestSceneOptions *v11;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("actions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("supportsNotices"));
  objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("targetContentIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    self = -[LNContinueInAppRequestSceneOptions initWithActions:supportsNotices:targetContentIdentifier:](self, "initWithActions:supportsNotices:targetContentIdentifier:", v8, v9, v10);
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (NSArray)actions
{
  return self->_actions;
}

- (BOOL)supportsNotices
{
  return self->_supportsNotices;
}

- (NSString)targetContentIdentifier
{
  return self->_targetContentIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContentIdentifier, 0);
  objc_storeStrong((id *)&self->_actions, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
