@implementation SGModelSource

- (SGModelSource)initWithSessionDescriptor:(id)a3 modelClass:(Class)a4
{
  id v8;
  SGModelSource *v9;
  SGModelSource *v10;
  void *v12;
  void *v13;
  objc_super v14;

  v8 = a3;
  if (v8)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGModelFeatures.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sessionDescriptor"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SGModelFeatures.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("modelClass"));

LABEL_3:
  v14.receiver = self;
  v14.super_class = (Class)SGModelSource;
  v9 = -[SGModelSource init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sessionDescriptor, a3);
    objc_storeStrong((id *)&v10->_modelClass, a4);
  }

  return v10;
}

- (PMLSessionDescriptor)sessionDescriptor
{
  return self->_sessionDescriptor;
}

- (void)setSessionDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_sessionDescriptor, a3);
}

- (Class)modelClass
{
  return self->_modelClass;
}

- (void)setModelClass:(Class)a3
{
  objc_storeStrong((id *)&self->_modelClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelClass, 0);
  objc_storeStrong((id *)&self->_sessionDescriptor, 0);
}

@end
