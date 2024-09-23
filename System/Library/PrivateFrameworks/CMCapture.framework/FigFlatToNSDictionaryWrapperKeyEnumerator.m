@implementation FigFlatToNSDictionaryWrapperKeyEnumerator

- (FigFlatToNSDictionaryWrapperKeyEnumerator)initWithFlatDictionary:(OpaqueFigFlatDictionary *)a3
{
  FigFlatToNSDictionaryWrapperKeyEnumerator *v4;
  int8x8_t v5;
  int CountOfKeysWithValues;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **v7;
  int8x8_t v8;
  int keysCount;
  objc_super v11;

  if (!a3)
    return 0;
  v11.receiver = self;
  v11.super_class = (Class)FigFlatToNSDictionaryWrapperKeyEnumerator;
  v4 = -[FigFlatToNSDictionaryWrapperKeyEnumerator init](&v11, sel_init);
  if (v4)
  {
    CountOfKeysWithValues = FigFlatDictionaryGetCountOfKeysWithValues((uint64_t)a3, v5);
    v4->_keysCount = CountOfKeysWithValues;
    v7 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 **)malloc_type_malloc(8 * CountOfKeysWithValues, 0x2004093837F09uLL);
    v4->_keys = v7;
    keysCount = v4->_keysCount;
    if (FigFlatDictionaryGetKeysWithValues((uint64_t)a3, (uint64_t)v7, (unsigned int *)&keysCount, v8)
      && v4->_keysCount == keysCount)
    {
      v4->_counter = 0;
      return v4;
    }
    return 0;
  }
  return v4;
}

- (void)dealloc
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 **keys;
  objc_super v4;

  keys = self->_keys;
  if (keys)
    free(keys);
  v4.receiver = self;
  v4.super_class = (Class)FigFlatToNSDictionaryWrapperKeyEnumerator;
  -[FigFlatToNSDictionaryWrapperKeyEnumerator dealloc](&v4, sel_dealloc);
}

- (id)allObjects
{
  void *v3;
  int i;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  for (i = self->_counter; i < self->_keysCount; self->_counter = i)
  {
    objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), FigFlatDictionaryKeyGetIdentifier((uint64_t)self->_keys[i])));
    i = self->_counter + 1;
  }
  return v3;
}

- (id)nextObject
{
  uint64_t counter;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v3;

  counter = self->_counter;
  if ((int)counter >= self->_keysCount)
    return 0;
  v3 = self->_keys[counter];
  self->_counter = counter + 1;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), FigFlatDictionaryKeyGetIdentifier((uint64_t)v3));
}

@end
