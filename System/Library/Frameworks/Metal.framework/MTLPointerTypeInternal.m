@implementation MTLPointerTypeInternal

- (BOOL)elementIsIndirectArgumentBuffer
{
  return self->_elementIsArgumentBuffer;
}

- (MTLPointerTypeInternal)initWithElementType:(unint64_t)a3 elementTypeDescription:(id)a4 access:(unint64_t)a5 alignment:(unint64_t)a6 dataSize:(unint64_t)a7 elementIsIndirectArgumentBuffer:(BOOL)a8 isConstantBuffer:(BOOL)a9
{
  uint64_t v10;

  BYTE1(v10) = 1;
  LOBYTE(v10) = a9;
  return -[MTLPointerTypeInternal initWithElementType:elementTypeDescription:access:alignment:dataSize:elementIsIndirectArgumentBuffer:isConstantBuffer:doRetain:](self, "initWithElementType:elementTypeDescription:access:alignment:dataSize:elementIsIndirectArgumentBuffer:isConstantBuffer:doRetain:", a3, a4, a5, a6, a7, a8, v10);
}

- (MTLPointerTypeInternal)initWithElementType:(unint64_t)a3 elementTypeDescription:(id)a4 access:(unint64_t)a5 alignment:(unint64_t)a6 dataSize:(unint64_t)a7 elementIsIndirectArgumentBuffer:(BOOL)a8 isConstantBuffer:(BOOL)a9 doRetain:(BOOL)a10
{
  MTLPointerTypeInternal *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)MTLPointerTypeInternal;
  v16 = -[MTLPointerTypeInternal init](&v18, sel_init);
  v16->_dataType = 60;
  v16->_elementType = a3;
  v16->_doRetain = a10;
  if (a10)
    a4 = a4;
  v16->_elementTypeInfo = (MTLType *)a4;
  v16->_access = a5;
  v16->_alignment = a6;
  v16->_dataSize = a7;
  v16->_elementIsArgumentBuffer = a8;
  v16->_isConstantBuffer = a9;
  return v16;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_doRetain)

  v3.receiver = self;
  v3.super_class = (Class)MTLPointerTypeInternal;
  -[MTLPointerTypeInternal dealloc](&v3, sel_dealloc);
}

- (BOOL)isConstantBuffer
{
  return self->_isConstantBuffer;
}

- (BOOL)elementIsArgumentBuffer
{
  return self->_elementIsArgumentBuffer;
}

- (id)elementTypeDescription
{
  return self->_elementTypeInfo;
}

- (id)elementStructType
{
  id result;

  result = self->_elementTypeInfo;
  if (result)
  {
    if (objc_msgSend(result, "dataType") == 1)
      return self->_elementTypeInfo;
    else
      return 0;
  }
  return result;
}

- (unint64_t)dataSize
{
  return self->_dataSize;
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (void)setAlignment:(unint64_t)a3 dataSize:(unint64_t)a4
{
  self->_alignment = a3;
  self->_dataSize = a4;
}

- (id)elementArrayType
{
  id result;

  result = self->_elementTypeInfo;
  if (result)
  {
    if (objc_msgSend(result, "dataType") == 2)
      return self->_elementTypeInfo;
    else
      return 0;
  }
  return result;
}

- (id)formattedDescription:(unint64_t)a3 withPrintedTypes:(id)a4
{
  unint64_t v6;
  uint64_t v7;
  void *v8;
  MTLType *elementTypeInfo;
  const __CFString *v10;
  unint64_t access;
  const __CFString *v12;
  uint64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  const __CFString *v22;
  const __CFString *v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  uint64_t v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3 + 4;
  v7 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v8 = (void *)MEMORY[0x1E0CB3940];
  v14 = v7;
  v15 = CFSTR("DataType =");
  v16 = MTLDataTypeString(self->_dataType);
  v17 = v7;
  v18 = CFSTR("ElementType =");
  v19 = MTLDataTypeString(self->_elementType);
  elementTypeInfo = self->_elementTypeInfo;
  if (elementTypeInfo)
    v10 = (const __CFString *)objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ ElementTypeDescription = %@"), v7, -[MTLType formattedDescription:withPrintedTypes:](elementTypeInfo, "formattedDescription:withPrintedTypes:", v6, a4), v14, v15, v16, v17, v18, v19);
  else
    v10 = &stru_1E0FE5DC8;
  v20 = v10;
  v21 = v7;
  v22 = CFSTR("Access =");
  access = self->_access;
  if (access > 2)
    v12 = CFSTR("Unknown");
  else
    v12 = off_1E0FE50A0[access];
  v23 = v12;
  v24 = v7;
  v25 = CFSTR("Alignment =");
  v26 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_alignment);
  v27 = v7;
  v28 = CFSTR("DataSize =");
  v29 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_dataSize);
  v30 = v7;
  v31 = CFSTR("ConstantBuffer = ");
  v32 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isConstantBuffer);
  return (id)objc_msgSend(v8, "stringWithFormat:", CFSTR("%@"), objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 19), "componentsJoinedByString:", CFSTR(" ")));
}

- (BOOL)isEqual:(id)a3
{
  MTLType *elementTypeInfo;
  int v6;

  if (!a3)
  {
    LOBYTE(v6) = 0;
    return v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || self->_dataType != *((_QWORD *)a3 + 1)
    || self->_elementType != *((_QWORD *)a3 + 2))
  {
    goto LABEL_12;
  }
  elementTypeInfo = self->_elementTypeInfo;
  if (!((unint64_t)elementTypeInfo | *((_QWORD *)a3 + 3))
    || (v6 = -[MTLType isEqual:](elementTypeInfo, "isEqual:")) != 0)
  {
    if (self->_access == *((_QWORD *)a3 + 4)
      && self->_alignment == *((_QWORD *)a3 + 5)
      && self->_dataSize == *((_QWORD *)a3 + 6)
      && self->_elementIsArgumentBuffer == *((unsigned __int8 *)a3 + 56))
    {
      LOBYTE(v6) = self->_isConstantBuffer == *((unsigned __int8 *)a3 + 57);
      return v6;
    }
LABEL_12:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (unint64_t)elementType
{
  return self->_elementType;
}

- (unint64_t)access
{
  return self->_access;
}

- (unint64_t)alignment
{
  return self->_alignment;
}

@end
