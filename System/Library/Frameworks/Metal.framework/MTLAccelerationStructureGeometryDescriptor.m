@implementation MTLAccelerationStructureGeometryDescriptor

- (MTLAccelerationStructureGeometryDescriptor)init
{
  MTLAccelerationStructureGeometryDescriptor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLAccelerationStructureGeometryDescriptor;
  result = -[MTLAccelerationStructureGeometryDescriptor init](&v3, sel_init);
  if (result)
    result->_allowDuplicateIntersectionFunctionInvocation = 1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setIntersectionFunctionTableOffset:", self->_intersectionFunctionTableOffset);
  objc_msgSend(v4, "setOpaque:", self->_opaque);
  objc_msgSend(v4, "setAllowDuplicateIntersectionFunctionInvocation:", self->_allowDuplicateIntersectionFunctionInvocation);
  objc_msgSend(v4, "setLabel:", self->_label);
  objc_msgSend(v4, "setPrimitiveDataBuffer:", self->_primitiveDataBuffer);
  objc_msgSend(v4, "setPrimitiveDataBufferOffset:", self->_primitiveDataBufferOffset);
  objc_msgSend(v4, "setPrimitiveDataStride:", self->_primitiveDataStride);
  objc_msgSend(v4, "setPrimitiveDataElementSize:", self->_primitiveDataElementSize);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_class *Class;
  NSUInteger v12;
  int v13;
  int v14;
  NSString *v15;
  _BOOL4 v16;
  id v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  if (a3 == self)
  {
    LOBYTE(v16) = 1;
    return v16;
  }
  v22 = v5;
  v23 = v4;
  v24 = v3;
  Class = object_getClass(self);
  if (Class != object_getClass(a3))
    goto LABEL_12;
  v12 = -[MTLAccelerationStructureGeometryDescriptor intersectionFunctionTableOffset](self, "intersectionFunctionTableOffset");
  if (v12 != objc_msgSend(a3, "intersectionFunctionTableOffset"))
    goto LABEL_12;
  v13 = -[MTLAccelerationStructureGeometryDescriptor opaque](self, "opaque");
  if (v13 != objc_msgSend(a3, "opaque"))
    goto LABEL_12;
  v14 = -[MTLAccelerationStructureGeometryDescriptor allowDuplicateIntersectionFunctionInvocation](self, "allowDuplicateIntersectionFunctionInvocation");
  if (v14 != objc_msgSend(a3, "allowDuplicateIntersectionFunctionInvocation"))
    goto LABEL_12;
  v15 = -[MTLAccelerationStructureGeometryDescriptor label](self, "label");
  if (v15 == (NSString *)objc_msgSend(a3, "label")
    || (v16 = -[NSString isEqualToString:](-[MTLAccelerationStructureGeometryDescriptor label](self, "label"), "isEqualToString:", objc_msgSend(a3, "label"))))
  {
    v17 = -[MTLAccelerationStructureGeometryDescriptor primitiveDataBuffer](self, "primitiveDataBuffer", v6, v22, v23, v24, v7, v8);
    if (v17 == (id)objc_msgSend(a3, "primitiveDataBuffer"))
    {
      v18 = -[MTLAccelerationStructureGeometryDescriptor primitiveDataBufferOffset](self, "primitiveDataBufferOffset");
      if (v18 == objc_msgSend(a3, "primitiveDataBufferOffset"))
      {
        v19 = -[MTLAccelerationStructureGeometryDescriptor primitiveDataStride](self, "primitiveDataStride");
        if (v19 == objc_msgSend(a3, "primitiveDataStride"))
        {
          v20 = -[MTLAccelerationStructureGeometryDescriptor primitiveDataElementSize](self, "primitiveDataElementSize");
          LOBYTE(v16) = v20 == objc_msgSend(a3, "primitiveDataElementSize");
          return v16;
        }
      }
    }
LABEL_12:
    LOBYTE(v16) = 0;
  }
  return v16;
}

- (unint64_t)hash
{
  NSUInteger v4;
  BOOL v5;
  BOOL v6;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;

  bzero(&v4, 0x38uLL);
  v4 = -[MTLAccelerationStructureGeometryDescriptor intersectionFunctionTableOffset](self, "intersectionFunctionTableOffset");
  v5 = -[MTLAccelerationStructureGeometryDescriptor opaque](self, "opaque");
  v6 = -[MTLAccelerationStructureGeometryDescriptor allowDuplicateIntersectionFunctionInvocation](self, "allowDuplicateIntersectionFunctionInvocation");
  v7 = -[NSString hash](-[MTLAccelerationStructureGeometryDescriptor label](self, "label"), "hash");
  v8 = objc_msgSend(-[MTLAccelerationStructureGeometryDescriptor primitiveDataBuffer](self, "primitiveDataBuffer"), "hash");
  v9 = -[MTLAccelerationStructureGeometryDescriptor primitiveDataBufferOffset](self, "primitiveDataBufferOffset");
  v10 = -[MTLAccelerationStructureGeometryDescriptor primitiveDataStride](self, "primitiveDataStride");
  v11 = -[MTLAccelerationStructureGeometryDescriptor primitiveDataElementSize](self, "primitiveDataElementSize");
  return _MTLHashState((int *)&v4, 0x38uLL);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLAccelerationStructureGeometryDescriptor;
  -[MTLAccelerationStructureGeometryDescriptor dealloc](&v3, sel_dealloc);
}

- (NSUInteger)intersectionFunctionTableOffset
{
  return self->_intersectionFunctionTableOffset;
}

- (void)setIntersectionFunctionTableOffset:(NSUInteger)intersectionFunctionTableOffset
{
  self->_intersectionFunctionTableOffset = intersectionFunctionTableOffset;
}

- (BOOL)opaque
{
  return self->_opaque;
}

- (void)setOpaque:(BOOL)opaque
{
  self->_opaque = opaque;
}

- (BOOL)allowDuplicateIntersectionFunctionInvocation
{
  return self->_allowDuplicateIntersectionFunctionInvocation;
}

- (void)setAllowDuplicateIntersectionFunctionInvocation:(BOOL)allowDuplicateIntersectionFunctionInvocation
{
  self->_allowDuplicateIntersectionFunctionInvocation = allowDuplicateIntersectionFunctionInvocation;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(NSString *)label
{
  objc_setProperty_nonatomic_copy(self, a2, label, 24);
}

- (id)primitiveDataBuffer
{
  return self->_primitiveDataBuffer;
}

- (void)setPrimitiveDataBuffer:(id)primitiveDataBuffer
{
  objc_setProperty_nonatomic(self, a2, primitiveDataBuffer, 32);
}

- (NSUInteger)primitiveDataBufferOffset
{
  return self->_primitiveDataBufferOffset;
}

- (void)setPrimitiveDataBufferOffset:(NSUInteger)primitiveDataBufferOffset
{
  self->_primitiveDataBufferOffset = primitiveDataBufferOffset;
}

- (NSUInteger)primitiveDataStride
{
  return self->_primitiveDataStride;
}

- (void)setPrimitiveDataStride:(NSUInteger)primitiveDataStride
{
  self->_primitiveDataStride = primitiveDataStride;
}

- (NSUInteger)primitiveDataElementSize
{
  return self->_primitiveDataElementSize;
}

- (void)setPrimitiveDataElementSize:(NSUInteger)primitiveDataElementSize
{
  self->_primitiveDataElementSize = primitiveDataElementSize;
}

@end
