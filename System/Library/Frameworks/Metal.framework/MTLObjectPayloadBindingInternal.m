@implementation MTLObjectPayloadBindingInternal

- (MTLObjectPayloadBindingInternal)initWithName:(id)a3 type:(unint64_t)a4 access:(unint64_t)a5 isActive:(BOOL)a6 arraySize:(unint64_t)a7 dataType:(unint64_t)a8 dataSize:(unint64_t)a9 alignment:(unint64_t)a10
{
  return -[MTLObjectPayloadBindingInternal initWithName:type:access:isActive:locationIndex:arraySize:dataType:dataSize:alignment:](self, "initWithName:type:access:isActive:locationIndex:arraySize:dataType:dataSize:alignment:", a3, a4, a5, a6, 0xFFFFFFFFLL, a7, a8, a9, a10);
}

- (MTLObjectPayloadBindingInternal)initWithName:(id)a3 type:(unint64_t)a4 access:(unint64_t)a5 isActive:(BOOL)a6 locationIndex:(unint64_t)a7 arraySize:(unint64_t)a8 dataType:(unint64_t)a9 dataSize:(unint64_t)a10 alignment:(unint64_t)a11
{
  MTLObjectPayloadBindingInternal *v12;
  uint64_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MTLObjectPayloadBindingInternal;
  v12 = -[MTLBindingInternal initWithName:type:access:index:active:arrayLength:](&v15, sel_initWithName_type_access_index_active_arrayLength_, a3, a4, a5, a7, a6, 1);
  v12->_alignment = a11;
  v12->_dataSize = a10;
  v12->_dataType = a9;
  LOBYTE(v14) = 0;
  v12->super._typeInfo = (MTLType *)-[MTLPointerTypeInternal initWithElementType:elementTypeDescription:access:alignment:dataSize:elementIsIndirectArgumentBuffer:isConstantBuffer:]([MTLPointerTypeInternal alloc], "initWithElementType:elementTypeDescription:access:alignment:dataSize:elementIsIndirectArgumentBuffer:isConstantBuffer:", a9, 0, a5, a11, a10, 0, v14);
  return v12;
}

- (unint64_t)objectPayloadAlignment
{
  return self->_alignment;
}

- (unint64_t)objectPayloadDataSize
{
  return self->_dataSize;
}

- (unint64_t)objectPayloadDataType
{
  return self->_dataType;
}

- (id)objectPayloadStructType
{
  if (self->_dataType == 1)
    return (id)-[MTLType elementStructType](self->super._typeInfo, "elementStructType");
  else
    return 0;
}

- (void)setStructType:(id)a3 doRetain:(BOOL)a4
{
  uint64_t v7;

  if (a3)
  {

    BYTE1(v7) = a4;
    LOBYTE(v7) = 0;
    self->super._typeInfo = (MTLType *)-[MTLPointerTypeInternal initWithElementType:elementTypeDescription:access:alignment:dataSize:elementIsIndirectArgumentBuffer:isConstantBuffer:doRetain:]([MTLPointerTypeInternal alloc], "initWithElementType:elementTypeDescription:access:alignment:dataSize:elementIsIndirectArgumentBuffer:isConstantBuffer:doRetain:", 1, a3, self->super._access, self->_alignment, self->_dataSize, 0, v7);
  }
}

- (void)setStructType:(id)a3
{
  abort();
}

- (id)formattedDescription:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  objc_super v9;
  _QWORD v10[7];

  v10[6] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)MTLObjectPayloadBindingInternal;
  v7 = -[MTLBindingInternal formattedDescription:](&v9, sel_formattedDescription_, a3);
  v10[0] = v5;
  v10[1] = CFSTR("Alignment =");
  v10[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_alignment);
  v10[3] = v5;
  v10[4] = CFSTR("DataSize =");
  v10[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_dataSize);
  return (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("%@%@"), v7, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 6), "componentsJoinedByString:", CFSTR(" ")));
}

- (BOOL)isEqual:(id)a3
{
  objc_super v6;

  if (!a3)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || self->_alignment != *((unsigned __int16 *)a3 + 84)
    || self->_dataSize != *((_DWORD *)a3 + 43)
    || self->_dataType != *((_QWORD *)a3 + 22))
  {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)MTLObjectPayloadBindingInternal;
  return -[MTLBindingInternal isEqual:](&v6, sel_isEqual_, a3);
}

@end
