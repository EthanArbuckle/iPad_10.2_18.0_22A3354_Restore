@implementation _NSKeyValueReturnedValueConsistencyStats

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  objc_storeWeak(&self->_weakCurrentValue, 0);

  v3.receiver = self;
  v3.super_class = (Class)_NSKeyValueReturnedValueConsistencyStats;
  -[_NSKeyValueReturnedValueConsistencyStats dealloc](&v3, sel_dealloc);
}

- (id)currentValue
{
  if (self->_copiedCurrentValue)
    return self->_copiedCurrentValue;
  else
    return objc_loadWeak(&self->_weakCurrentValue);
}

- (void)setCurrentValue:(id)a3
{
  id v3;
  id copiedCurrentValue;
  id v6;
  id v7;
  void *v8;

  v3 = a3;
  copiedCurrentValue = self->_copiedCurrentValue;
  if (copiedCurrentValue)
  {
    if (copiedCurrentValue == a3)
      return;
  }
  else
  {
    v6 = objc_loadWeak(&self->_weakCurrentValue);
    if (v6)
    {
      v7 = v6;

      if (v7 == v3)
        return;
    }
  }

  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EDCC29F8))
  {
    v8 = (void *)objc_msgSend(v3, "copy");
    v3 = 0;
  }
  else
  {
    v8 = 0;
  }
  self->_copiedCurrentValue = v8;
  objc_storeWeak(&self->_weakCurrentValue, v3);
}

@end
