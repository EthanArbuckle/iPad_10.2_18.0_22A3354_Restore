@implementation _MSPContainerEditContentUpdate

- (_MSPContainerEditContentUpdate)initWithUpdatedObject:(id)a3
{
  id v5;
  _MSPContainerEditContentUpdate *v6;
  _MSPContainerEditContentUpdate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MSPContainerEditContentUpdate;
  v6 = -[_MSPContainerEditContentUpdate init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_updatedObject, a3);

  return v7;
}

- (_MSPContainerEditContentUpdate)initWithUpdatedImmutableObject:(id)a3
{
  id v5;
  _MSPContainerEditContentUpdate *v6;
  _MSPContainerEditContentUpdate *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MSPContainerEditContentUpdate;
  v6 = -[_MSPContainerEditContentUpdate init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_updatedImmutableObject, a3);

  return v7;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_MSPContainerEditContentUpdate;
  -[_MSPContainerEditContentUpdate description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MSPContainerEditContentUpdate updatedObject](self, "updatedObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ { updated contents of object = %@ }"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)useImmutableObjectsFromMap:(id)a3 intermediateMutableObjectTransferBlock:(id)a4
{
  id v6;
  void *v7;
  MSPImmutableObject *v8;
  MSPImmutableObject *updatedImmutableObject;
  void *v10;
  MSPImmutableObject *v11;
  MSPImmutableObject *v12;
  void (**v13)(id, void *);

  v13 = (void (**)(id, void *))a4;
  v6 = a3;
  -[_MSPContainerEditContentUpdate updatedObject](self, "updatedObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (MSPImmutableObject *)objc_claimAutoreleasedReturnValue();

  updatedImmutableObject = self->_updatedImmutableObject;
  self->_updatedImmutableObject = v8;

  if (!self->_updatedImmutableObject)
  {
    -[_MSPContainerEditContentUpdate updatedObject](self, "updatedObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v10);
    v11 = (MSPImmutableObject *)objc_claimAutoreleasedReturnValue();
    v12 = self->_updatedImmutableObject;
    self->_updatedImmutableObject = v11;

  }
}

- (MSPMutableObject)updatedObject
{
  return self->_updatedObject;
}

- (MSPImmutableObject)updatedImmutableObject
{
  return self->_updatedImmutableObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedImmutableObject, 0);
  objc_storeStrong((id *)&self->_updatedObject, 0);
}

@end
