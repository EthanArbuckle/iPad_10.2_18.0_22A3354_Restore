@implementation NSSimpleAttributeDictionaryEnumerator

- (NSSimpleAttributeDictionaryEnumerator)initWithAttributeDictionary:(id)a3
{
  NSSimpleAttributeDictionaryEnumerator *v4;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)NSSimpleAttributeDictionaryEnumerator;
  v4 = -[NSSimpleAttributeDictionaryEnumerator init](&v6, sel_init);
  if (v4)
  {
    v4->dictionary = (NSSimpleAttributeDictionary *)a3;
    v4->nextElement = 0;
  }
  return v4;
}

- (id)nextObject
{
  unint64_t nextElement;
  NSSimpleAttributeDictionary *dictionary;

  nextElement = self->nextElement;
  dictionary = self->dictionary;
  if (nextElement == dictionary->numElements)
    return 0;
  self->nextElement = nextElement + 1;
  return dictionary->elements[nextElement].key;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSSimpleAttributeDictionaryEnumerator;
  -[NSSimpleAttributeDictionaryEnumerator dealloc](&v3, sel_dealloc);
}

@end
