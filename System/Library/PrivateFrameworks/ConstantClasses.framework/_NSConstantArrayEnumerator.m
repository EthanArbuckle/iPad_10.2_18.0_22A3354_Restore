@implementation _NSConstantArrayEnumerator

- (_NSConstantArrayEnumerator)initWithArray:(id *)a3 capacity:(unint64_t)a4
{
  _NSConstantArrayEnumerator *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_NSConstantArrayEnumerator;
  result = -[_NSConstantArrayEnumerator init](&v7, sel_init);
  if (result)
  {
    result->objects = a3;
    result->capacity = a4;
    result->index = 0;
  }
  return result;
}

- (id)allObjects
{
  unint64_t index;

  index = self->index;
  self->index = self->capacity;
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &self->objects[index], self->capacity - index);
}

- (id)nextObject
{
  unint64_t index;
  id *objects;

  index = self->index;
  if (index >= self->capacity)
    return 0;
  objects = self->objects;
  self->index = index + 1;
  return objects[index];
}

@end
