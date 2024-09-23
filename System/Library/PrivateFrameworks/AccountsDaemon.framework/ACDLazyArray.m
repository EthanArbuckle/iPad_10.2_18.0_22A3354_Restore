@implementation ACDLazyArray

- (ACDLazyArray)init
{
  return -[ACDLazyArray initWithInitializer:](self, "initWithInitializer:", 0);
}

- (ACDLazyArray)initWithInitializer:(id)a3
{
  id v4;
  ACDLazyArray *v5;
  ACDLazyArray *v6;
  uint64_t v7;
  id initializationBlock;
  NSArray *underlyingArray;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACDLazyArray;
  v5 = -[ACDLazyArray init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_initializationLock._os_unfair_lock_opaque = 0;
    v7 = objc_msgSend(v4, "copy");
    initializationBlock = v6->_initializationBlock;
    v6->_initializationBlock = (id)v7;

    underlyingArray = v6->_underlyingArray;
    v6->_underlyingArray = 0;

  }
  return v6;
}

- (ACDLazyArray)initWithCoder:(id)a3
{
  ACDLazyArray *v3;
  ACDLazyArray *v4;
  id initializationBlock;
  NSArray *underlyingArray;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ACDLazyArray;
  v3 = -[ACDLazyArray initWithCoder:](&v8, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_initializationLock._os_unfair_lock_opaque = 0;
    initializationBlock = v3->_initializationBlock;
    v3->_initializationBlock = 0;

    underlyingArray = v4->_underlyingArray;
    v4->_underlyingArray = 0;

  }
  return v4;
}

- (ACDLazyArray)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  -[ACDLazyArray doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);

  return 0;
}

- (unint64_t)count
{
  _ACDLazyArrayInitializeIfNecessary(self);
  return -[NSArray count](self->_underlyingArray, "count");
}

- (id)objectAtIndex:(unint64_t)a3
{
  _ACDLazyArrayInitializeIfNecessary(self);
  return -[NSArray objectAtIndex:](self->_underlyingArray, "objectAtIndex:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingArray, 0);
  objc_storeStrong(&self->_initializationBlock, 0);
}

@end
