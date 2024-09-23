@implementation MTLFunctionStitchingInputBufferAddress

- (MTLFunctionStitchingInputBufferAddress)initWithBindIndex:(unint64_t)a3
{
  MTLFunctionStitchingInputBufferAddress *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTLFunctionStitchingInputBufferAddress;
  result = -[MTLFunctionStitchingInputBufferAddress init](&v5, sel_init);
  result->_bindIndex = a3;
  result->_byteOffset = 0;
  result->_dereference = 0;
  return result;
}

- (MTLFunctionStitchingInputBufferAddress)initWithBindIndex:(unint64_t)a3 byteOffset:(unint64_t)a4 dereference:(BOOL)a5
{
  self->_bindIndex = a3;
  self->_byteOffset = a4;
  self->_dereference = a5;
  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setBindIndex:", self->_bindIndex);
  objc_msgSend(v4, "setByteOffset:", self->_byteOffset);
  objc_msgSend(v4, "setDereference:", self->_dereference);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  objc_class *Class;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;

  if (a3 == self)
    return 1;
  Class = object_getClass(self);
  if (Class != object_getClass(a3))
    return 0;
  v6 = -[MTLFunctionStitchingInputBufferAddress bindIndex](self, "bindIndex");
  if (v6 != objc_msgSend(a3, "bindIndex"))
    return 0;
  v7 = -[MTLFunctionStitchingInputBufferAddress byteOffset](self, "byteOffset");
  if (v7 != objc_msgSend(a3, "byteOffset"))
    return 0;
  v8 = -[MTLFunctionStitchingInputBufferAddress dereference](self, "dereference");
  return v8 ^ objc_msgSend(a3, "dereference") ^ 1;
}

- (unint64_t)hash
{
  _QWORD v4[3];

  bzero(v4, 0x18uLL);
  v4[0] = -[MTLFunctionStitchingInputBufferAddress bindIndex](self, "bindIndex");
  v4[1] = -[MTLFunctionStitchingInputBufferAddress byteOffset](self, "byteOffset");
  v4[2] = -[MTLFunctionStitchingInputBufferAddress dereference](self, "dereference");
  return _MTLHashState((int *)v4, 0x18uLL);
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  NSString *v6;
  objc_super v8;
  _QWORD v9[10];

  v9[9] = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)MTLFunctionStitchingInputBufferAddress;
  v6 = -[MTLFunctionStitchingInputBufferAddress description](&v8, sel_description);
  v9[0] = v4;
  v9[1] = CFSTR("bind index = ");
  v9[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_bindIndex);
  v9[3] = v4;
  v9[4] = CFSTR("byte offset = ");
  v9[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_byteOffset);
  v9[6] = v4;
  v9[7] = CFSTR("dereference = ");
  v9[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_dereference);
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 9), "componentsJoinedByString:", CFSTR(" ")));
}

- (NSString)description
{
  return (NSString *)-[MTLFunctionStitchingInputBufferAddress formattedDescription:](self, "formattedDescription:", 0);
}

- (unint64_t)bindIndex
{
  return self->_bindIndex;
}

- (void)setBindIndex:(unint64_t)a3
{
  self->_bindIndex = a3;
}

- (unint64_t)byteOffset
{
  return self->_byteOffset;
}

- (void)setByteOffset:(unint64_t)a3
{
  self->_byteOffset = a3;
}

- (BOOL)dereference
{
  return self->_dereference;
}

- (void)setDereference:(BOOL)a3
{
  self->_dereference = a3;
}

@end
