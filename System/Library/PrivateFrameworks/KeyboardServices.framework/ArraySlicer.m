@implementation ArraySlicer

- (ArraySlicer)initWithArray:(id)a3 sliceSize:(unint64_t)a4
{
  id v7;
  ArraySlicer *v8;
  ArraySlicer *v9;
  uint64_t v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ArraySlicer;
  v8 = -[ArraySlicer init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_array, a3);
    v10 = objc_msgSend(v7, "count");
    v9->_sliceSize = a4;
    v9->_count = v10;
  }

  return v9;
}

- (unint64_t)remaining
{
  int64_t v2;

  v2 = self->_count - self->_offset;
  return v2 & ~(v2 >> 63);
}

- (id)nextSlice
{
  unint64_t offset;
  unint64_t count;
  BOOL v4;
  unint64_t v5;
  unint64_t sliceSize;
  ArraySlice *v8;

  count = self->_count;
  offset = self->_offset;
  v4 = count >= offset;
  v5 = count - offset;
  if (v5 != 0 && v4)
  {
    if (self->_sliceSize >= v5)
      sliceSize = v5;
    else
      sliceSize = self->_sliceSize;
    v8 = -[ArraySlice initWithArray:offset:count:]([ArraySlice alloc], "initWithArray:offset:count:", self->_array, self->_offset, sliceSize);
    self->_offset += sliceSize;
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)consumed
{
  ArraySlice *v2;

  if (self->_offset)
    v2 = -[ArraySlice initWithArray:offset:count:]([ArraySlice alloc], "initWithArray:offset:count:", self->_array, 0, self->_offset);
  else
    v2 = 0;
  return v2;
}

- (id)unconsumed
{
  unint64_t offset;
  unint64_t count;
  ArraySlice *v4;

  count = self->_count;
  offset = self->_offset;
  if (count <= offset)
    v4 = 0;
  else
    v4 = -[ArraySlice initWithArray:offset:count:]([ArraySlice alloc], "initWithArray:offset:count:", self->_array, self->_offset, count - offset);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_array, 0);
}

@end
