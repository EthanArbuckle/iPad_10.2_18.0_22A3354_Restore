@implementation ARGeometrySource

- (ARGeometrySource)initWithBuffer:(id)a3 count:(int64_t)a4 format:(unint64_t)a5 componentsPerVector:(int64_t)a6 offset:(int64_t)a7 stride:(int64_t)a8
{
  id v15;
  ARGeometrySource *v16;
  ARGeometrySource *v17;
  objc_super v19;

  v15 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ARGeometrySource;
  v16 = -[ARGeometrySource init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_buffer, a3);
    v17->_count = a4;
    v17->_format = a5;
    v17->_componentsPerVector = a6;
    v17->_offset = a7;
    v17->_stride = a8;
  }

  return v17;
}

- (unint64_t)componentSize
{
  unint64_t format;

  format = self->_format;
  if (format == 28 || format == 30)
    return 4;
  else
    return format == 45;
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
  objc_msgSend(v4, "dataWithBytesNoCopy:length:freeWhenDone:", -[MTLBuffer contents](buffer, "contents"), -[ARGeometrySource componentSize](self, "componentSize") * self->_count * self->_componentsPerVector, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("buffer"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_count, CFSTR("count"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_format, CFSTR("format"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_componentsPerVector, CFSTR("componentsPerVector"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_offset, CFSTR("offset"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_stride, CFSTR("stride"));

}

- (ARGeometrySource)initWithCoder:(id)a3
{
  id v4;
  ARGeometrySource *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  MTLBuffer *buffer;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ARGeometrySource;
  v5 = -[ARGeometrySource init](&v12, sel_init);
  if (v5)
  {
    v5->_count = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("count"));
    v5->_format = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("format"));
    v5->_componentsPerVector = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("componentsPerVector"));
    v5->_offset = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("offset"));
    v5->_stride = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("stride"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buffer"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MTLCreateSystemDefaultDevice();
    v8 = objc_retainAutorelease(v6);
    v9 = objc_msgSend(v7, "newBufferWithBytes:length:options:", objc_msgSend(v8, "bytes"), -[ARGeometrySource componentSize](v5, "componentSize") * v5->_count * v5->_componentsPerVector, 0);
    buffer = v5->_buffer;
    v5->_buffer = (MTLBuffer *)v9;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  ARGeometrySource *v4;
  ARGeometrySource *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int64_t count;
  char v11;
  unint64_t format;
  int64_t offset;
  int64_t componentsPerVector;
  int64_t stride;
  MTLBuffer *buffer;
  MTLBuffer *v17;

  v4 = (ARGeometrySource *)a3;
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
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", -[MTLBuffer contents](self->_buffer, "contents"), -[ARGeometrySource componentSize](self, "componentSize") * self->_count * self->_componentsPerVector, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0C99D50];
      -[ARGeometrySource buffer](v5, "buffer");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v7, "dataWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v8, "contents"), -[ARGeometrySource componentSize](self, "componentSize")* -[ARGeometrySource count](v5, "count")* self->_componentsPerVector, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      count = self->_count;
      v11 = 0;
      if (count == -[ARGeometrySource count](v5, "count"))
      {
        format = self->_format;
        if (format == -[ARGeometrySource format](v5, "format")
          && (offset = self->_offset, offset == -[ARGeometrySource offset](v5, "offset"))
          && (componentsPerVector = self->_componentsPerVector,
              componentsPerVector == -[ARGeometrySource componentsPerVector](v5, "componentsPerVector"))
          && (stride = self->_stride, stride == -[ARGeometrySource stride](v5, "stride")))
        {
          buffer = self->_buffer;
          -[ARGeometrySource buffer](v5, "buffer");
          v17 = (MTLBuffer *)objc_claimAutoreleasedReturnValue();
          if (buffer == v17)
            v11 = 1;
          else
            v11 = objc_msgSend(v6, "isEqualToData:", v9);

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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p count=\"%ld\">"), v5, self, -[ARGeometrySource count](self, "count"));
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

- (MTLVertexFormat)format
{
  return self->_format;
}

- (void)setFormat:(unint64_t)a3
{
  self->_format = a3;
}

- (NSInteger)componentsPerVector
{
  return self->_componentsPerVector;
}

- (void)setComponentsPerVector:(int64_t)a3
{
  self->_componentsPerVector = a3;
}

- (NSInteger)offset
{
  return self->_offset;
}

- (void)setOffset:(int64_t)a3
{
  self->_offset = a3;
}

- (NSInteger)stride
{
  return self->_stride;
}

- (void)setStride:(int64_t)a3
{
  self->_stride = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
