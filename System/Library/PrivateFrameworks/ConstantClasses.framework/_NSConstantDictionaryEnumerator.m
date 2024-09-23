@implementation _NSConstantDictionaryEnumerator

- (_NSConstantDictionaryEnumerator)initWithFirstKeyPointer:(id *)a3 capacity:(unint64_t)a4
{
  _NSConstantDictionaryEnumerator *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_NSConstantDictionaryEnumerator;
  result = -[_NSConstantDictionaryEnumerator init](&v7, sel_init);
  if (result)
  {
    result->currentKey = a3;
    result->capacity = a4;
    result->keyIndex = 0;
  }
  return result;
}

- (id)allObjects
{
  id v3;
  id v4;
  id v5;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = -[_NSConstantDictionaryEnumerator nextObject](self, "nextObject");
  if (v4)
  {
    v5 = v4;
    do
    {
      objc_msgSend(v3, "addObject:", v5);
      v5 = -[_NSConstantDictionaryEnumerator nextObject](self, "nextObject");
    }
    while (v5);
  }
  return v3;
}

- (id)nextObject
{
  unint64_t keyIndex;
  id *v3;
  unint64_t v4;
  void *v5;

  keyIndex = self->keyIndex;
  if (keyIndex >= self->capacity)
    return 0;
  v3 = self->currentKey + 2;
  v4 = keyIndex + 1;
  do
  {
    v5 = *(v3 - 2);
    self->currentKey = v3;
    self->keyIndex = v4;
    v3 += 2;
  }
  while (v4++ < self->capacity && v5 == 0);
  return v5;
}

@end
