@implementation _GCPhysicalInputElementEnumerator

- (id)initWithCollection:(void *)a1
{
  id *v3;
  id *v4;
  objc_super v6;

  if (!a1)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)_GCPhysicalInputElementEnumerator;
  v3 = (id *)objc_msgSendSuper2(&v6, sel_init);
  v4 = v3;
  if (v3)
  {
    objc_storeStrong(v3 + 1, a2);
    v4[2] = 0;
  }
  return v4;
}

- (_GCPhysicalInputElementEnumerator)init
{
  return (_GCPhysicalInputElementEnumerator *)-[_GCPhysicalInputElementEnumerator initWithCollection:](self, 0);
}

- (id)nextObject
{
  GCPhysicalInputElementCollection *collection;
  unint64_t currentIndex;
  void *v5;

  collection = self->_collection;
  if (collection
    && (currentIndex = self->_currentIndex,
        currentIndex < -[GCPhysicalInputElementCollection count](self->_collection, "count")))
  {
    ++self->_currentIndex;
    -[GCPhysicalInputElementCollection elementAtIndex:](collection, "elementAtIndex:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
