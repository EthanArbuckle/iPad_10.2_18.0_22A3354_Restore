@implementation _EXSceneConfiguration

- (_EXSceneConfiguration)initWithParameters:(id)a3
{
  id v5;
  _EXSceneConfiguration *v6;
  _EXSceneConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_EXSceneConfiguration;
  v6 = -[_EXSceneConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_parameters, a3);

  return v7;
}

- (NSString)role
{
  return -[_EXSceneSessionParameters sceneIdentifier](self->_parameters, "sceneIdentifier");
}

- (_EXPromise)initializationPromise
{
  return -[_EXSceneSessionParameters initializationParametersPromise](self->_parameters, "initializationParametersPromise");
}

- (Class)sceneDelegateClass
{
  NSString *sceneDelegateClass;
  objc_class *v4;
  Class v5;

  sceneDelegateClass = (NSString *)self->_sceneDelegateClass;
  if (!sceneDelegateClass)
  {
    sceneDelegateClass = self->_sceneDelegateClassName;
    if (sceneDelegateClass)
    {
      NSClassFromString(sceneDelegateClass);
      v4 = (objc_class *)objc_claimAutoreleasedReturnValue();
      v5 = self->_sceneDelegateClass;
      self->_sceneDelegateClass = v4;

      sceneDelegateClass = (NSString *)self->_sceneDelegateClass;
    }
  }
  return (Class)sceneDelegateClass;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _EXSceneConfiguration *v4;
  void *v5;
  void *v6;

  v4 = -[_EXSceneConfiguration initWithParameters:]([_EXSceneConfiguration alloc], "initWithParameters:", self->_parameters);
  -[_EXSceneConfiguration setSceneDelegateClass:](v4, "setSceneDelegateClass:", -[_EXSceneConfiguration sceneDelegateClass](self, "sceneDelegateClass"));
  -[_EXSceneConfiguration sceneDelegateClassName](self, "sceneDelegateClassName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[_EXSceneConfiguration setSceneDelegateClassName:](v4, "setSceneDelegateClassName:", v6);

  -[_EXSceneConfiguration setSceneClass:](v4, "setSceneClass:", -[_EXSceneConfiguration sceneClass](self, "sceneClass"));
  return v4;
}

- (id)initializationParametersOfClass:(Class)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;

  -[_EXSceneSessionParameters initializationParametersPromise](self->_parameters, "initializationParametersPromise");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3 && v6)
  {
    objc_msgSend(v6, "resolveObjectOfClass:error:", a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.extensionKit.errorDomain"), 8, MEMORY[0x1E0C9AA70]);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (_EXSceneSessionParameters)parameters
{
  return (_EXSceneSessionParameters *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)sceneDelegateClassName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSceneDelegateClassName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void)setSceneDelegateClass:(Class)a3
{
  objc_storeStrong((id *)&self->_sceneDelegateClass, a3);
}

- (Class)sceneClass
{
  return self->_sceneClass;
}

- (void)setSceneClass:(Class)a3
{
  objc_storeStrong((id *)&self->_sceneClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneClass, 0);
  objc_storeStrong((id *)&self->_sceneDelegateClass, 0);
  objc_storeStrong((id *)&self->_sceneDelegateClassName, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
