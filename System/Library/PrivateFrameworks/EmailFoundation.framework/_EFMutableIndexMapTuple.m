@implementation _EFMutableIndexMapTuple

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (int64_t)key
{
  return self->_key;
}

- (void)setKey:(int64_t)a3
{
  self->_key = a3;
}

- (id)object
{
  return self->_object;
}

- (void)setObject:(id)a3
{
  objc_storeStrong(&self->_object, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_object, 0);
}

@end
