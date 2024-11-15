@implementation _FBSceneClientProcess

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
}

- (RBSProcessHandle)handle
{
  return self->_handle;
}

- (id)_initWithHandle:(id)a3
{
  id v5;
  _FBSceneClientProcess *v6;
  _FBSceneClientProcess *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_FBSceneClientProcess;
  v6 = -[_FBSceneClientProcess init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_handle, a3);

  return v7;
}

- (NSString)description
{
  return (NSString *)-[RBSProcessHandle description](self->_handle, "description");
}

@end
