@implementation SNNMILOperationEnumerator

- (SNNMILOperationEnumerator)initWithFunction:(id)a3
{
  id v4;
  SNNMILOperationEnumerator *v5;
  SNNMILOperationEnumerator *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SNNMILOperationEnumerator;
  v5 = -[SNNMILOperationEnumerator init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_currentIndex = 0;
    objc_storeWeak((id *)&v5->_function, v4);
  }

  return v6;
}

- (id)nextObject
{
  uint64_t currentIndex;
  SNNMILFunction **p_function;
  id WeakRetained;
  uint64_t v6;
  id v7;
  void *v8;

  currentIndex = self->_currentIndex;
  p_function = &self->_function;
  WeakRetained = objc_loadWeakRetained((id *)&self->_function);
  v6 = objc_msgSend(WeakRetained, "operationCount");

  if (v6 <= currentIndex)
  {
    v8 = 0;
  }
  else
  {
    v7 = objc_loadWeakRetained((id *)p_function);
    ++self->_currentIndex;
    objc_msgSend(v7, "operationAtIndex:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (SNNMILFunction)function
{
  return (SNNMILFunction *)objc_loadWeakRetained((id *)&self->_function);
}

- (void)setFunction:(id)a3
{
  objc_storeWeak((id *)&self->_function, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_function);
}

@end
