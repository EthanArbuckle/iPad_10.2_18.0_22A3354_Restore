@implementation PHBatchFetchingArrayFetchedClass

- (PHBatchFetchingArrayFetchedClass)initWithFetchedObjectClass:(Class)a3
{
  PHBatchFetchingArrayFetchedClass *v5;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHBatchFetchingArrayFetchedClass;
  v5 = -[PHBatchFetchingArrayFetchedClass init](&v8, sel_init);
  if (v5)
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("PHBatchFetchingArray.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fetchedObjectClass"));

    }
    objc_storeStrong((id *)&v5->_fetchedObjectClass, a3);
  }
  return v5;
}

- (PHBatchFetchingArrayFetchedClass)initWithFetchedPropertySetClass:(Class)a3
{
  PHBatchFetchingArrayFetchedClass *v5;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHBatchFetchingArrayFetchedClass;
  v5 = -[PHBatchFetchingArrayFetchedClass init](&v8, sel_init);
  if (v5)
  {
    if (!a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("PHBatchFetchingArray.m"), 68, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fetchedPropertySetClass"));

    }
    objc_storeStrong((id *)&v5->_fetchedPropertySetClass, a3);
  }
  return v5;
}

- (Class)fetchedPropertySetClass
{
  return (Class)objc_getProperty(self, a2, 8, 1);
}

- (void)setFetchedPropertySetClass:(Class)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (Class)fetchedObjectClass
{
  return (Class)objc_getProperty(self, a2, 16, 1);
}

- (void)setFetchedObjectClass:(Class)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchedObjectClass, 0);
  objc_storeStrong((id *)&self->_fetchedPropertySetClass, 0);
}

@end
