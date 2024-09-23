@implementation MTLArrayTypeInternal

- (void)setIsIndirectArgumentBuffer:(BOOL)a3
{
  self->_isIndirectArgumentBuffer = a3;
}

- (MTLArrayTypeInternal)initWithArrayLength:(unint64_t)a3 elementType:(unint64_t)a4 stride:(unint64_t)a5 pixelFormat:(unint64_t)a6 aluType:(unint64_t)a7 details:(id)a8
{
  int v11;
  int v13;
  MTLArrayTypeInternal *v14;
  int *v15;
  objc_super v17;
  unint64_t v18;

  v11 = a5;
  v13 = a3;
  v17.receiver = self;
  v17.super_class = (Class)MTLArrayTypeInternal;
  v18 = a4;
  v14 = -[MTLArrayTypeInternal init](&v17, sel_init);
  v14->_dataType = 2;
  *((_DWORD *)v14 + 4) = v13;
  v14->_elementType = a4;
  *((_DWORD *)v14 + 5) = v11;
  v14->_pixelFormat = a6;
  v14->_aluType = a7;
  if (a4 == 57)
  {
    v14->_elementTypeInfo = (MTLType *)newDataTypeDescriptionForIndirectArgument(a8, (uint64_t *)&v18);
    v14->_elementType = v18;
    v15 = &OBJC_IVAR___MTLArrayTypeInternal__details;
  }
  else
  {
    v15 = &OBJC_IVAR___MTLArrayTypeInternal__elementTypeInfo;
  }
  *(Class *)((char *)&v14->super.super.super.isa + *v15) = (Class)a8;
  return v14;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLArrayTypeInternal;
  -[MTLArrayTypeInternal dealloc](&v3, sel_dealloc);
}

- (unint64_t)elementType
{
  return self->_elementType;
}

- (id)elementStructType
{
  if (self->_elementType == 1)
    return self->_elementTypeInfo;
  else
    return 0;
}

- (unint64_t)stride
{
  return *((unsigned int *)self + 5);
}

- (unint64_t)arrayLength
{
  return *((unsigned int *)self + 4);
}

- (BOOL)isArrayLayoutThreadSafeWith:(id)a3
{
  uint64_t v5;
  unint64_t aluType;
  uint64_t v7;
  unint64_t dataType;
  uint64_t v9;
  uint64_t v10;

  v5 = objc_msgSend(a3, "aluType");
  aluType = self->_aluType;
  v7 = objc_msgSend(a3, "dataType");
  dataType = self->_dataType;
  v9 = objc_msgSend(a3, "arrayLength");
  v10 = *((unsigned int *)self + 4);
  return objc_msgSend(a3, "pixelFormat") == self->_pixelFormat && v9 == v10 && v7 == dataType && v5 == aluType;
}

- (void)setStride:(unint64_t)a3
{
  *((_DWORD *)self + 5) = a3;
}

- (id)elementArrayType
{
  if (self->_elementType == 2)
    return self->_elementTypeInfo;
  else
    return 0;
}

- (id)elementTextureReferenceType
{
  id result;

  result = self->_elementTypeInfo;
  if (result)
  {
    if (objc_msgSend(result, "dataType") == 58)
      return self->_elementTypeInfo;
    else
      return 0;
  }
  return result;
}

- (id)elementPointerType
{
  id result;

  result = self->_elementTypeInfo;
  if (result)
  {
    if (objc_msgSend(result, "dataType") == 60)
      return self->_elementTypeInfo;
    else
      return 0;
  }
  return result;
}

- (unint64_t)indirectArgumentIndexStride
{
  return self->_argumentIndexStride;
}

- (void)setIndirectArgumentIndexStride:(unint64_t)a3
{
  self->_argumentIndexStride = a3;
}

- (id)elementIndirectArgumentType
{
  return self->_details;
}

- (id)elementTypeDescription
{
  return self->_elementTypeInfo;
}

- (id)formattedDescription:(unint64_t)a3 withPrintedTypes:(id)a4
{
  unint64_t v6;
  uint64_t v7;
  void *v8;
  MTLType *elementTypeInfo;
  const __CFString *v10;
  uint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3 + 4;
  v7 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v8 = (void *)MEMORY[0x1E0CB3940];
  v12 = v7;
  v13 = CFSTR("DataType =");
  v14 = MTLDataTypeString(self->_dataType);
  v15 = v7;
  v16 = CFSTR("ArrayLength =");
  v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *((unsigned int *)self + 4));
  v18 = v7;
  v19 = CFSTR("Stride =");
  v20 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *((unsigned int *)self + 5));
  v21 = v7;
  v22 = CFSTR("ArgumentIndexStride =");
  v23 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_argumentIndexStride);
  v24 = v7;
  elementTypeInfo = self->_elementTypeInfo;
  if (elementTypeInfo)
    v10 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ElementTypeInfo = %@"), -[MTLType formattedDescription:withPrintedTypes:](elementTypeInfo, "formattedDescription:withPrintedTypes:", v6, a4), v12, v13);
  else
    v10 = MTLDataTypeString(self->_elementType);
  v25 = v10;
  return (id)objc_msgSend(v8, "stringWithFormat:", CFSTR("%@"), objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 14), "componentsJoinedByString:", CFSTR(" ")));
}

- (BOOL)isEqual:(id)a3
{
  unint64_t details;
  int v6;
  MTLType *elementTypeInfo;

  if (!a3)
  {
    LOBYTE(v6) = 0;
    return v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || self->_dataType != *((_QWORD *)a3 + 1)
    || *((_DWORD *)self + 4) != *((_DWORD *)a3 + 4)
    || *((_DWORD *)self + 5) != *((_DWORD *)a3 + 5))
  {
    goto LABEL_15;
  }
  details = (unint64_t)self->_details;
  if (!(details | *((_QWORD *)a3 + 3)) || (v6 = objc_msgSend((id)details, "isEqual:")) != 0)
  {
    if (self->_elementType != *((_QWORD *)a3 + 4)
      || self->_pixelFormat != *((_QWORD *)a3 + 5)
      || self->_aluType != *((_QWORD *)a3 + 6))
    {
      goto LABEL_15;
    }
    elementTypeInfo = self->_elementTypeInfo;
    if (!((unint64_t)elementTypeInfo | *((_QWORD *)a3 + 7))
      || (v6 = -[MTLType isEqual:](elementTypeInfo, "isEqual:")) != 0)
    {
      if (self->_isIndirectArgumentBuffer == *((unsigned __int8 *)a3 + 64))
      {
        LOBYTE(v6) = self->_argumentIndexStride == *((_QWORD *)a3 + 9);
        return v6;
      }
LABEL_15:
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (unint64_t)aluType
{
  return self->_aluType;
}

- (unint64_t)argumentIndexStride
{
  return self->_argumentIndexStride;
}

- (void)setArgumentIndexStride:(unint64_t)a3
{
  self->_argumentIndexStride = a3;
}

- (BOOL)isIndirectArgumentBuffer
{
  return self->_isIndirectArgumentBuffer;
}

@end
