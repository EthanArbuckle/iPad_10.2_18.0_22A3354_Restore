@implementation ARGeometryElement

- (ARGeometryElement)initWithBuffer:(id)a3 count:(int64_t)a4 bytesPerIndex:(int64_t)a5 primitiveType:(int64_t)a6
{
  id v11;
  ARGeometryElement *v12;
  ARGeometryElement *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ARGeometryElement;
  v12 = -[ARGeometryElement init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_buffer, a3);
    v13->_count = a4;
    v13->_bytesPerIndex = a5;
    v13->_primitiveType = a6;
  }

  return v13;
}

- (NSInteger)indexCountPerPrimitive
{
  if (self->_primitiveType == 1)
    return 3;
  else
    return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  MTLBuffer *buffer;
  id v6;
  id v7;

  v4 = (void *)MEMORY[0x1E0C99D50];
  buffer = self->_buffer;
  v6 = a3;
  objc_msgSend(v4, "dataWithBytesNoCopy:length:freeWhenDone:", -[MTLBuffer contents](buffer, "contents"), self->_bytesPerIndex * self->_count * -[ARGeometryElement indexCountPerPrimitive](self, "indexCountPerPrimitive"), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("buffer"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_count, CFSTR("count"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_bytesPerIndex, CFSTR("bytesPerIndex"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_primitiveType, CFSTR("primitiveType"));

}

- (ARGeometryElement)initWithCoder:(id)a3
{
  id v4;
  ARGeometryElement *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  MTLBuffer *buffer;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ARGeometryElement;
  v5 = -[ARGeometryElement init](&v12, sel_init);
  if (v5)
  {
    v5->_count = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("count"));
    v5->_bytesPerIndex = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("bytesPerIndex"));
    v5->_primitiveType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("primitiveType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buffer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MTLCreateSystemDefaultDevice();
    v8 = objc_retainAutorelease(v6);
    v9 = objc_msgSend(v7, "newBufferWithBytes:length:options:", objc_msgSend(v8, "bytes"), v5->_bytesPerIndex * v5->_count * -[ARGeometryElement indexCountPerPrimitive](v5, "indexCountPerPrimitive"), 0);
    buffer = v5->_buffer;
    v5->_buffer = (MTLBuffer *)v9;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  ARGeometryElement *v4;
  ARGeometryElement *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int64_t count;
  BOOL v11;
  int64_t bytesPerIndex;
  MTLBuffer *buffer;
  MTLBuffer *v14;
  int64_t primitiveType;

  v4 = (ARGeometryElement *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", -[MTLBuffer contents](self->_buffer, "contents"), self->_bytesPerIndex* self->_count* -[ARGeometryElement indexCountPerPrimitive](self, "indexCountPerPrimitive"), 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0C99D50];
      -[ARGeometryElement buffer](v5, "buffer");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v7, "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v8, "contents"), -[ARGeometryElement bytesPerIndex](v5, "bytesPerIndex")* -[ARGeometryElement count](v5, "count")* -[ARGeometryElement indexCountPerPrimitive](self, "indexCountPerPrimitive"), 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      count = self->_count;
      v11 = 0;
      if (count == -[ARGeometryElement count](v5, "count"))
      {
        bytesPerIndex = self->_bytesPerIndex;
        if (bytesPerIndex == -[ARGeometryElement bytesPerIndex](v5, "bytesPerIndex"))
        {
          buffer = self->_buffer;
          -[ARGeometryElement buffer](v5, "buffer");
          v14 = (MTLBuffer *)objc_claimAutoreleasedReturnValue();
          if (buffer == v14 || objc_msgSend(v6, "isEqualToData:", v9))
          {
            primitiveType = self->_primitiveType;
            v11 = primitiveType == -[ARGeometryElement primitiveType](v5, "primitiveType");
          }
          else
          {
            v11 = 0;
          }

        }
        else
        {
          v11 = 0;
        }
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p count=\"%ld\">"), v5, self, -[ARGeometryElement count](self, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_buffer, a3);
}

- (NSInteger)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (NSInteger)bytesPerIndex
{
  return self->_bytesPerIndex;
}

- (void)setBytesPerIndex:(int64_t)a3
{
  self->_bytesPerIndex = a3;
}

- (ARGeometryPrimitiveType)primitiveType
{
  return self->_primitiveType;
}

- (void)setPrimitiveType:(int64_t)a3
{
  self->_primitiveType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
