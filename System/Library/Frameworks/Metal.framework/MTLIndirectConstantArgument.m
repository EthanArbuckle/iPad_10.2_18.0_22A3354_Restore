@implementation MTLIndirectConstantArgument

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTLIndirectConstantArgument;
  -[MTLBindingInternal dealloc](&v2, sel_dealloc);
}

- (unint64_t)indirectConstantDataSize
{
  return self->_dataSize;
}

- (unint64_t)indirectConstantAlignment
{
  return self->_alignment;
}

- (unint64_t)indirectConstantDataType
{
  return self->_dataType;
}

- (MTLIndirectConstantArgument)initWithName:(id)a3 type:(unint64_t)a4 access:(unint64_t)a5 isActive:(BOOL)a6 locationIndex:(unint64_t)a7 dataType:(unint64_t)a8 pixelFormat:(unint64_t)a9 aluType:(unint64_t)a10 dataSize:(unint64_t)a11 alignment:(unint64_t)a12
{
  unsigned __int16 v12;
  MTLIndirectConstantArgument *result;
  objc_super v14;

  v12 = a8;
  v14.receiver = self;
  v14.super_class = (Class)MTLIndirectConstantArgument;
  result = -[MTLBindingInternal initWithName:type:access:index:active:arrayLength:](&v14, sel_initWithName_type_access_index_active_arrayLength_, a3, a4, a5, a7, a6, 1);
  result->_alignment = a12;
  result->_dataSize = a11;
  result->_dataType = v12;
  result->_pixelFormat = a9;
  result->_aluType = a10;
  return result;
}

- (unint64_t)bufferPixelFormat
{
  return self->_pixelFormat;
}

- (unint64_t)bufferALUType
{
  return self->_aluType;
}

- (id)formattedDescription:(unint64_t)a3 withPrintedTypes:(id)a4
{
  uint64_t v6;
  void *v7;
  id v8;
  objc_super v10;
  _QWORD v11[10];

  v11[9] = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v7 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)MTLIndirectConstantArgument;
  v8 = -[MTLBindingInternal formattedDescription:](&v10, sel_formattedDescription_, a3);
  v11[0] = v6;
  v11[1] = CFSTR("Alignment =");
  v11[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_alignment);
  v11[3] = v6;
  v11[4] = CFSTR("DataSize =");
  v11[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", self->_dataSize);
  v11[6] = v6;
  v11[7] = CFSTR("DataType =");
  v11[8] = MTLDataTypeString(self->_dataType);
  return (id)objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@"), v8, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 9), "componentsJoinedByString:", CFSTR(" ")));
}

- (BOOL)isEqual:(id)a3
{
  objc_super v6;

  if (!a3)
    return 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || self->_dataType != *((unsigned __int16 *)a3 + 84)
    || self->_alignment != *((unsigned __int16 *)a3 + 85)
    || self->_dataSize != *((unsigned __int16 *)a3 + 86)
    || self->_pixelFormat != *((_QWORD *)a3 + 22)
    || self->_aluType != *((_QWORD *)a3 + 23))
  {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)MTLIndirectConstantArgument;
  return -[MTLBindingInternal isEqual:](&v6, sel_isEqual_, a3);
}

@end
