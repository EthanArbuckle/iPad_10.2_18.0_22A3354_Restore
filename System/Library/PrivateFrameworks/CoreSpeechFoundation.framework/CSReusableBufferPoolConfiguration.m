@implementation CSReusableBufferPoolConfiguration

- (CSReusableBufferPoolConfiguration)initWithBackingStoreCapacity:(unint64_t)a3 minimalNumberOfBackingStores:(unint64_t)a4 maximumNumberOfBackingStores:(unint64_t)a5 backingStoreIdleTimeout:(double)a6
{
  CSReusableBufferPoolConfiguration *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CSReusableBufferPoolConfiguration;
  result = -[CSReusableBufferPoolConfiguration init](&v11, sel_init);
  if (result)
  {
    result->_backingStoreCapacity = a3;
    result->_minimalNumberOfBackingStores = a4;
    result->_maximumNumberOfBackingStores = a5;
    result->_backingStoreIdleTimeout = a6;
  }
  return result;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v7.receiver = self;
  v7.super_class = (Class)CSReusableBufferPoolConfiguration;
  -[CSReusableBufferPoolConfiguration description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {backingStoreCapacity = %tu (bytes), minimalNumberOfBackingStores = %tu, maximumNumberOfBackingStores = %tu, backingStoreIdleTimeout = %f (seconds)}"), v4, self->_backingStoreCapacity, self->_minimalNumberOfBackingStores, self->_maximumNumberOfBackingStores, *(_QWORD *)&self->_backingStoreIdleTimeout);

  return v5;
}

- (unint64_t)backingStoreCapacity
{
  return self->_backingStoreCapacity;
}

- (unint64_t)minimalNumberOfBackingStores
{
  return self->_minimalNumberOfBackingStores;
}

- (unint64_t)maximumNumberOfBackingStores
{
  return self->_maximumNumberOfBackingStores;
}

- (double)backingStoreIdleTimeout
{
  return self->_backingStoreIdleTimeout;
}

@end
