@implementation MTLLogStateDescriptor

- (MTLLogStateDescriptor)init
{
  MTLLogStateDescriptor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLLogStateDescriptor;
  result = -[MTLLogStateDescriptor init](&v3, sel_init);
  if (result)
    *(_OWORD *)&result->_level = xmmword_1827FCE20;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setLevel:", self->_level);
    objc_msgSend(v5, "setBufferSize:", self->_bufferSize);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;

  if (a3 == self)
    return 1;
  Class = object_getClass(self);
  return Class == object_getClass(a3)
      && objc_msgSend(a3, "level") == self->_level
      && objc_msgSend(a3, "bufferSize") == self->_bufferSize;
}

- (unint64_t)hash
{
  __int128 v4;

  bzero(&v4, 0x10uLL);
  v4 = *(_OWORD *)&self->_level;
  return _MTLHashState((int *)&v4, 0x10uLL);
}

- (int64_t)level
{
  return self->_level;
}

- (void)setLevel:(int64_t)a3
{
  self->_level = a3;
}

- (int64_t)bufferSize
{
  return self->_bufferSize;
}

- (void)setBufferSize:(int64_t)a3
{
  self->_bufferSize = a3;
}

@end
