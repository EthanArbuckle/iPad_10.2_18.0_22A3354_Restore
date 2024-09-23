@implementation NIExportedObjectForwarder

- (NIExportedObjectForwarder)initWithExportedObject:(id)a3
{
  id v5;
  NIExportedObjectForwarder *v6;
  NIExportedObjectForwarder *v7;
  void *v9;
  objc_super v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerConnection.m"), 163, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object"));

  }
  v10.receiver = self;
  v10.super_class = (Class)NIExportedObjectForwarder;
  v6 = -[NIExportedObjectForwarder init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    -[NIExportedObjectForwarder setExportedObject:](v6, "setExportedObject:", v5);
    -[NIExportedObjectForwarder setExportedObjectClass:](v7, "setExportedObjectClass:", objc_opt_class());
  }

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)-[objc_class instanceMethodSignatureForSelector:](-[NIExportedObjectForwarder exportedObjectClass](self, "exportedObjectClass"), "instanceMethodSignatureForSelector:", a3);
}

- (id)exportedObject
{
  return objc_loadWeakRetained(&self->_exportedObject);
}

- (void)setExportedObject:(id)a3
{
  objc_storeWeak(&self->_exportedObject, a3);
}

- (Class)exportedObjectClass
{
  return self->_exportedObjectClass;
}

- (void)setExportedObjectClass:(Class)a3
{
  objc_storeStrong((id *)&self->_exportedObjectClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exportedObjectClass, 0);
  objc_destroyWeak(&self->_exportedObject);
}

@end
