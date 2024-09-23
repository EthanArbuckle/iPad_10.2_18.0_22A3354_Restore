@implementation LNContinueInAppRequest

- (LNContinueInAppRequest)initWithIdentifier:(id)a3 dialog:(id)a4 throwing:(BOOL)a5 requestConfirmation:(BOOL)a6 type:(int64_t)a7 sceneOptions:(id)a8
{
  id v16;
  id v17;
  id v18;
  LNContinueInAppRequest *v19;
  LNContinueInAppRequest *v20;
  uint64_t v21;
  LNDialog *dialog;
  id completionHandler;
  LNContinueInAppRequest *v24;
  void *v26;
  objc_super v27;

  v16 = a3;
  v17 = a4;
  v18 = a8;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNContinueInAppRequest.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  v27.receiver = self;
  v27.super_class = (Class)LNContinueInAppRequest;
  v19 = -[LNContinueInAppRequest init](&v27, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    v21 = objc_msgSend(v17, "copy");
    dialog = v20->_dialog;
    v20->_dialog = (LNDialog *)v21;

    completionHandler = v20->_completionHandler;
    v20->_completionHandler = 0;

    v20->_throwing = a5;
    v20->_requestConfirmation = a6;
    v20->_type = a7;
    objc_storeStrong((id *)&v20->_sceneOptions, a8);
    v24 = v20;
  }

  return v20;
}

- (void)respondWithSuccess
{
  LNContinueInAppResponse *v3;
  void *v4;
  id completionHandler;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  LNContinueInAppResponse *v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_completionHandler)
  {
    v3 = [LNContinueInAppResponse alloc];
    -[LNContinueInAppRequest identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[LNContinueInAppResponse initWithIdentifier:](v3, "initWithIdentifier:", v4);

    (*((void (**)(void))self->_completionHandler + 2))();
    completionHandler = self->_completionHandler;
    self->_completionHandler = 0;

  }
  else
  {
    getLNLogCategoryExecution();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = objc_opt_class();
      -[LNContinueInAppRequest identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v11 = v7;
      v12 = 2114;
      v13 = v8;

    }
  }
}

- (void)respondWithError:(id)a3
{
  void (**completionHandler)(id, _QWORD, id);
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  completionHandler = (void (**)(id, _QWORD, id))self->_completionHandler;
  if (completionHandler)
  {
    completionHandler[2](completionHandler, 0, a3);
    v5 = self->_completionHandler;
    self->_completionHandler = 0;

  }
  else
  {
    getLNLogCategoryExecution();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = objc_opt_class();
      -[LNContinueInAppRequest identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v8;

    }
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[LNContinueInAppRequest identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

  -[LNContinueInAppRequest dialog](self, "dialog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("dialog"));

  objc_msgSend(v4, "encodeBool:forKey:", -[LNContinueInAppRequest isThrowing](self, "isThrowing"), CFSTR("throwing"));
  objc_msgSend(v4, "encodeBool:forKey:", -[LNContinueInAppRequest requestConfirmation](self, "requestConfirmation"), CFSTR("requestConfirmation"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNContinueInAppRequest type](self, "type"), CFSTR("type"));
  -[LNContinueInAppRequest sceneOptions](self, "sceneOptions");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("sceneOptions"));

}

- (LNContinueInAppRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  LNContinueInAppRequest *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dialog"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("throwing"));
  v8 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requestConfirmation"));
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sceneOptions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  if (v5 && v6)
  {
    self = -[LNContinueInAppRequest initWithIdentifier:dialog:throwing:requestConfirmation:type:sceneOptions:](self, "initWithIdentifier:dialog:throwing:requestConfirmation:type:sceneOptions:", v5, v6, v7, v8, v9, v10);
    v11 = self;
  }

  return v11;
}

- (LNDialog)dialog
{
  return self->_dialog;
}

- (BOOL)isThrowing
{
  return self->_throwing;
}

- (BOOL)requestConfirmation
{
  return self->_requestConfirmation;
}

- (int64_t)type
{
  return self->_type;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (LNContinueInAppRequestSceneOptions)sceneOptions
{
  return self->_sceneOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneOptions, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dialog, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
