@implementation __NSConstantDictionaryEnumerator

- (id)nextObject
{
  NSConstantDictionary *underlyingDictionary;
  unint64_t currentIndex;
  int *v4;
  void *v5;

  underlyingDictionary = self->_underlyingDictionary;
  currentIndex = self->_currentIndex;
  if (currentIndex >= underlyingDictionary->_count)
    return 0;
  if (self->_isForKeys)
    v4 = &OBJC_IVAR___NSConstantDictionary__keys;
  else
    v4 = &OBJC_IVAR___NSConstantDictionary__objects;
  v5 = (void *)(*(_QWORD **)((char *)&underlyingDictionary->super.super.isa + *v4))[currentIndex];
  self->_currentIndex = currentIndex + 1;
  return v5;
}

- (__NSConstantDictionaryEnumerator)initWithConstantDictionary:(id)a3 enumerateKeys:(BOOL)a4
{
  __NSConstantDictionaryEnumerator *result;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)__NSConstantDictionaryEnumerator;
  result = -[__NSConstantDictionaryEnumerator init](&v7, sel_init);
  result->_underlyingDictionary = (NSConstantDictionary *)a3;
  result->_currentIndex = 0;
  result->_isForKeys = a4;
  return result;
}

@end
