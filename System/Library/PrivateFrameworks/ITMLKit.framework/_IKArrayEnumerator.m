@implementation _IKArrayEnumerator

- (_IKArrayEnumerator)initWithArray:(id)a3
{
  id v5;
  _IKArrayEnumerator *v6;
  _IKArrayEnumerator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_IKArrayEnumerator;
  v6 = -[_IKArrayEnumerator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_array, a3);

  return v7;
}

- (id)nextObject
{
  int64_t currentIndex;
  IKArray *array;
  void *v5;

  currentIndex = self->_currentIndex;
  if (currentIndex >= -[IKArray count](self->_array, "count"))
  {
    v5 = 0;
  }
  else
  {
    array = self->_array;
    ++self->_currentIndex;
    -[IKArray objectAtIndex:](array, "objectAtIndex:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
}

@end
