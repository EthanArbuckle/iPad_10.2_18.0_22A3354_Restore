@implementation MTLBufferBindingInternal

- (MTLBufferBindingInternal)initWithName:(id)a3 type:(unint64_t)a4 access:(unint64_t)a5 isActive:(BOOL)a6 locationIndex:(unint64_t)a7 arraySize:(unint64_t)a8 dataType:(unint64_t)a9 pixelFormat:(unint64_t)a10 aluType:(unint64_t)a11 isConstantBuffer:(BOOL)a12 dataSize:(unint64_t)a13 alignment:(unint64_t)a14
{
  MTLBufferBindingInternal *v15;
  uint64_t v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MTLBufferBindingInternal;
  v15 = -[MTLBindingInternal initWithName:type:access:index:active:arrayLength:](&v18, sel_initWithName_type_access_index_active_arrayLength_, a3, a4, a5, a7, a6, 1);
  v15->_alignment = a14;
  v15->_dataSize = a13;
  *((_WORD *)v15 + 84) = *((_WORD *)v15 + 84) & 0x8000 | a9 & 0x7FFF;
  v15->_pixelFormat = a10;
  v15->_aluType = a11;
  *((_BYTE *)v15 + 169) &= ~0x80u;
  LOBYTE(v17) = a12;
  v15->super._typeInfo = (MTLType *)-[MTLPointerTypeInternal initWithElementType:elementTypeDescription:access:alignment:dataSize:elementIsIndirectArgumentBuffer:isConstantBuffer:]([MTLPointerTypeInternal alloc], "initWithElementType:elementTypeDescription:access:alignment:dataSize:elementIsIndirectArgumentBuffer:isConstantBuffer:", a9, 0, a5, a14, a13, 0, v17);
  return v15;
}

- (void)setStructType:(id)a3 doRetain:(BOOL)a4
{
  uint64_t IsIndirectArgumentBuffer;
  char v8;
  uint64_t v9;

  if (a3)
  {
    IsIndirectArgumentBuffer = structIsIndirectArgumentBuffer((uint64_t)a3);
    v8 = -[MTLType isConstantBuffer](self->super._typeInfo, "isConstantBuffer");

    BYTE1(v9) = a4;
    LOBYTE(v9) = v8;
    self->super._typeInfo = (MTLType *)-[MTLPointerTypeInternal initWithElementType:elementTypeDescription:access:alignment:dataSize:elementIsIndirectArgumentBuffer:isConstantBuffer:doRetain:]([MTLPointerTypeInternal alloc], "initWithElementType:elementTypeDescription:access:alignment:dataSize:elementIsIndirectArgumentBuffer:isConstantBuffer:doRetain:", 1, a3, self->super._access, self->_alignment, self->_dataSize, IsIndirectArgumentBuffer, v9);
  }
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTLBufferBindingInternal;
  -[MTLBindingInternal dealloc](&v2, sel_dealloc);
}

- (unint64_t)bufferDataType
{
  return *((_WORD *)self + 84) & 0x7FFF;
}

- (void)setVertexDescriptorBuffer:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *((_BYTE *)self + 169) = v3 & 0x80 | *((_BYTE *)self + 169) & 0x7F;
}

- (MTLStructType)bufferStructType
{
  return (MTLStructType *)-[MTLType elementStructType](self->super._typeInfo, "elementStructType");
}

- (unint64_t)bufferDataSize
{
  if (self->_dataSize == -1)
    return -1;
  else
    return self->_dataSize;
}

- (MTLPointerType)bufferPointerType
{
  MTLPointerType *result;

  result = (MTLPointerType *)self->super._typeInfo;
  if (result)
  {
    if (-[MTLPointerType dataType](result, "dataType") == 60)
      return (MTLPointerType *)self->super._typeInfo;
    else
      return 0;
  }
  return result;
}

- (void)setDataSize:(unint64_t)a3
{
  self->_dataSize = a3;
}

- (void)setAlignment:(unint64_t)a3
{
  self->_alignment = a3;
}

- (BOOL)isVertexDescriptorBuffer
{
  return *((unsigned __int8 *)self + 169) >> 7;
}

- (void)setStructType:(id)a3
{
  abort();
}

- (unint64_t)bufferAlignment
{
  return self->_alignment;
}

- (unint64_t)bufferPixelFormat
{
  return self->_pixelFormat;
}

- (unint64_t)bufferALUType
{
  return self->_aluType;
}

- (id)bufferIndirectArgumentType
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t vars0;

  MTLReportFailure(0, "-[MTLBufferBindingInternal bufferIndirectArgumentType]", 212, (uint64_t)CFSTR("Not supported at this point"), v2, v3, v4, v5, vars0);
  return 0;
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  objc_super v9;
  _QWORD v10[10];

  v10[9] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)MTLBufferBindingInternal;
  v7 = -[MTLBindingInternal formattedDescription:](&v9, sel_formattedDescription_, a3);
  v10[0] = v5;
  v10[1] = CFSTR("Alignment =");
  v10[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_alignment);
  v10[3] = v5;
  v10[4] = CFSTR("DataSize =");
  v10[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_dataSize);
  v10[6] = v5;
  v10[7] = CFSTR("DataType =");
  v10[8] = MTLDataTypeString(*((_WORD *)self + 84) & 0x7FFF);
  return (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), v7, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 9), "componentsJoinedByString:", CFSTR(" ")));
}

- (BOOL)isEqual:(id)a3
{
  objc_super v6;

  if (!a3)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ((*((_WORD *)a3 + 84) ^ *((_WORD *)self + 84)) & 0x7FFF) != 0
    || ((*((unsigned __int8 *)a3 + 169) ^ *((unsigned __int8 *)self + 169)) & 0x80) != 0
    || self->_alignment != *((unsigned __int16 *)a3 + 85)
    || self->_dataSize != *((_DWORD *)a3 + 43)
    || self->_pixelFormat != *((_QWORD *)a3 + 22)
    || self->_aluType != *((_QWORD *)a3 + 23))
  {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)MTLBufferBindingInternal;
  return -[MTLBindingInternal isEqual:](&v6, sel_isEqual_, a3);
}

@end
