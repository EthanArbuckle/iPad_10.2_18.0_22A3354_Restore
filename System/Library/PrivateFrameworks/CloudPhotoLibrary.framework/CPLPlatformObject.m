@implementation CPLPlatformObject

- (CPLPlatformObject)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLPlatform.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, v5, 22, CFSTR("Should not use -init method but -initWithAbstractObject:"));

  abort();
}

- (CPLPlatformObject)initWithAbstractObject:(id)a3
{
  id v4;
  CPLPlatformObject *v5;
  CPLPlatformObject *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CPLPlatformObject;
  v5 = -[CPLPlatformObject init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_abstractObject, v4);

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p>"), objc_opt_class(), self);
}

- (CPLAbstractObject)abstractObject
{
  return (CPLAbstractObject *)objc_loadWeakRetained((id *)&self->_abstractObject);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_abstractObject);
}

@end
