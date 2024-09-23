@implementation NonRetainedObjectContainer

- (NonRetainedObjectContainer)initWithObject:(id)a3
{
  id v4;
  NonRetainedObjectContainer *v5;
  NonRetainedObjectContainer *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NonRetainedObjectContainer;
  v5 = -[NonRetainedObjectContainer init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[NonRetainedObjectContainer setNonRetainedObject:](v5, "setNonRetainedObject:", v4);

  return v6;
}

- (id)nonRetainedObject
{
  return objc_loadWeakRetained(&self->_nonRetainedObject);
}

- (void)setNonRetainedObject:(id)a3
{
  objc_storeWeak(&self->_nonRetainedObject, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_nonRetainedObject);
}

@end
