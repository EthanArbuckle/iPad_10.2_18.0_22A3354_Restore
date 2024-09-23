@implementation NSConcreteMapTableValueEnumerator

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSConcreteMapTableValueEnumerator;
  -[NSConcreteMapTableValueEnumerator dealloc](&v3, sel_dealloc);
}

+ (id)enumeratorWithMapTable:(id)a3
{
  NSConcreteMapTableValueEnumerator *v4;

  v4 = [NSConcreteMapTableValueEnumerator alloc];
  v4->mapTable = (NSConcreteMapTable *)a3;
  v4->counter = 0;
  return v4;
}

- (id)nextObject
{
  unint64_t counter;
  NSConcreteMapTable *mapTable;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void (*v8)(uint64_t);

  counter = self->counter;
  mapTable = self->mapTable;
  if (counter >= mapTable->capacity)
    return 0;
  while (1)
  {
    v5 = (*((uint64_t (**)(void **, _QWORD))mapTable->keys.internalProps + 3))(&mapTable->keys.items[counter], 0);
    v6 = (*((uint64_t (**)(void **, _QWORD))self->mapTable->values.internalProps + 3))(&self->mapTable->values.items[self->counter], 0);
    v7 = (void *)v6;
    ++self->counter;
    v8 = (void (*)(uint64_t))*((_QWORD *)self->mapTable->keys.internalProps + 4);
    if (v5 && v6 != 0)
      break;
    v8(v5);
    (*((void (**)(void *))self->mapTable->values.internalProps + 4))(v7);
    counter = self->counter;
    mapTable = self->mapTable;
    if (counter >= mapTable->capacity)
      return 0;
  }
  v8(v5);
  (*((void (**)(void *))self->mapTable->values.internalProps + 5))(v7);
  return v7;
}

@end
