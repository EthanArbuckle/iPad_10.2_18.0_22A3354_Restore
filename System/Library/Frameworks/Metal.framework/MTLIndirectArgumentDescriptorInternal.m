@implementation MTLIndirectArgumentDescriptorInternal

+ (id)indirectArgumentDescriptor
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (MTLIndirectArgumentDescriptorInternal)init
{
  MTLIndirectArgumentDescriptorInternal *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLIndirectArgumentDescriptorInternal;
  result = -[MTLIndirectArgumentDescriptorInternal init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_private.dataType = 0u;
    *(_OWORD *)&result->_private.arrayLength = 0u;
    *(_OWORD *)&result->_private.textureType = xmmword_182819730;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  __int128 v6;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = *(_OWORD *)&self->_private.arrayLength;
  v5 = *(_OWORD *)&self->_private.textureType;
  *(_OWORD *)((char *)result + 8) = *(_OWORD *)&self->_private.dataType;
  *(_OWORD *)((char *)result + 24) = v6;
  *(_OWORD *)((char *)result + 40) = v5;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;

  if (a3 == self)
    return 1;
  Class = object_getClass(self);
  return Class == object_getClass(a3) && memcmp(&self->_private, (char *)a3 + 8, 0x30uLL) == 0;
}

- (unint64_t)hash
{
  uint64_t v2;
  unsigned int v3;

  v2 = 0;
  v3 = 1193062;
  do
  {
    v3 = (1540483477
        * ((1540483477 * *(_DWORD *)((char *)&self->_private.dataType + v2)) ^ ((1540483477
                                                                                             * *(_DWORD *)((char *)&self->_private.dataType + v2)) >> 24))) ^ (1540483477 * v3);
    v2 += 4;
  }
  while (v2 != 48);
  return (1540483477 * (v3 ^ (v3 >> 13))) ^ ((1540483477 * (v3 ^ (v3 >> 13))) >> 15);
}

- (id)formattedDescription:(unint64_t)a3
{
  void *v5;
  id v6;
  objc_super v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MTLIndirectArgumentDescriptorInternal;
  v6 = -[MTLIndirectArgumentDescriptorInternal description](&v8, sel_description);
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, indirectArgumentFormattedDescription(a3, &self->_private));
}

- (id)description
{
  return -[MTLIndirectArgumentDescriptorInternal formattedDescription:](self, "formattedDescription:", 0);
}

- (unint64_t)dataType
{
  return self->_private.dataType;
}

- (void)setDataType:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  validateMTLDataType(a3, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
  self->_private.dataType = a3;
}

- (unint64_t)index
{
  return self->_private.index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_private.index = a3;
}

- (unint64_t)arrayLength
{
  return self->_private.arrayLength;
}

- (void)setArrayLength:(unint64_t)a3
{
  self->_private.arrayLength = a3;
}

- (unint64_t)access
{
  return self->_private.access;
}

- (void)setAccess:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  validateMTLBindingAccess(a3, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
  self->_private.access = a3;
}

- (unint64_t)textureType
{
  return self->_private.textureType;
}

- (void)setTextureType:(unint64_t)a3
{
  self->_private.textureType = a3;
}

- (unint64_t)constantBlockAlignment
{
  return self->_private.constantBlockAlignment;
}

- (void)setConstantBlockAlignment:(unint64_t)a3
{
  self->_private.constantBlockAlignment = a3;
}

@end
