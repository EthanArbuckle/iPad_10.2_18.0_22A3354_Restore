@implementation MTLStructMemberInternal

- (MTLStructMemberInternal)initWithName:(id)a3 offset:(unint64_t)a4 dataType:(unint64_t)a5 pixelFormat:(unint64_t)a6 aluType:(unint64_t)a7 indirectArgumentIndex:(unint64_t)a8 render_target:(unint64_t)a9 raster_order_group:(unint64_t)a10 details:(id)a11
{
  MTLStructMemberInternal *v17;
  int *v18;
  objc_super v20;
  unint64_t v21;

  v20.receiver = self;
  v20.super_class = (Class)MTLStructMemberInternal;
  v21 = a5;
  v17 = -[MTLStructMemberInternal init](&v20, sel_init);
  v17->_name = (NSString *)objc_msgSend(a3, "copy");
  v17->_offset = a4;
  *((_WORD *)v17 + 12) = a5;
  v17->_pixelFormat = a6;
  v17->_aluType = a7;
  v17->_argumentIndex = a8;
  v17->_render_target = a9;
  v17->_raster_order_group = a10;
  if (a5 == 57)
  {
    v17->_typeInfo = (MTLType *)newDataTypeDescriptionForIndirectArgument(a11, (uint64_t *)&v21);
    *((_WORD *)v17 + 12) = v21;
    v18 = &OBJC_IVAR___MTLStructMemberInternal__details;
  }
  else
  {
    v18 = &OBJC_IVAR___MTLStructMemberInternal__typeInfo;
  }
  *(Class *)((char *)&v17->super.super.isa + *v18) = (Class)a11;
  return v17;
}

- (unint64_t)offset
{
  return self->_offset;
}

- (id)indirectArgumentType
{
  return self->_details;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLStructMemberInternal;
  -[MTLStructMemberInternal dealloc](&v3, sel_dealloc);
}

- (unint64_t)dataType
{
  return *((unsigned __int16 *)self + 12);
}

- (unint64_t)indirectArgumentIndex
{
  return self->_argumentIndex;
}

- (id)arrayType
{
  if (*((_WORD *)self + 12) == 2)
    return self->_typeInfo;
  else
    return 0;
}

- (id)structType
{
  if (*((_WORD *)self + 12) == 1)
    return self->_typeInfo;
  else
    return 0;
}

- (id)name
{
  return self->_name;
}

- (id)dataTypeDescription
{
  return self->_typeInfo;
}

- (unint64_t)argumentIndex
{
  return self->_argumentIndex;
}

- (id)textureReferenceType
{
  id result;

  result = self->_typeInfo;
  if (result)
  {
    if (objc_msgSend(result, "dataType") == 58)
      return self->_typeInfo;
    else
      return 0;
  }
  return result;
}

- (id)pointerType
{
  id result;

  result = self->_typeInfo;
  if (result)
  {
    if (objc_msgSend(result, "dataType") == 60)
      return self->_typeInfo;
    else
      return 0;
  }
  return result;
}

- (void)setOffset:(unint64_t)a3
{
  self->_offset = a3;
}

- (BOOL)isMemberLayoutThreadSafeWith:(id)a3
{
  unint64_t aluType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t offset;
  uint64_t v10;
  unint64_t pixelFormat;
  uint64_t v12;
  id v13;
  _BOOL4 v14;
  _BOOL4 v15;
  int v16;
  int v17;
  id v18;
  uint64_t v20;

  v20 = objc_msgSend(a3, "aluType");
  aluType = self->_aluType;
  v6 = objc_msgSend(a3, "dataType");
  v7 = *((unsigned __int16 *)self + 12);
  v8 = objc_msgSend(a3, "offset");
  offset = self->_offset;
  v10 = objc_msgSend(a3, "pixelFormat");
  pixelFormat = self->_pixelFormat;
  v12 = objc_msgSend(a3, "arrayType");
  v13 = -[MTLStructMemberInternal arrayType](self, "arrayType");
  v14 = v12 != 0;
  v15 = v12 == 0;
  if (v13)
    v15 = 1;
  else
    v14 = 1;
  v16 = v14 && v15;
  if (v10 != pixelFormat)
    v16 = 0;
  if (v8 != offset)
    v16 = 0;
  if (v6 != v7)
    v16 = 0;
  if (v20 == aluType)
    v17 = v16;
  else
    v17 = 0;
  if (v12 && v13)
    v17 &= objc_msgSend(v13, "isArrayLayoutThreadSafeWith:", v12);
  if (-[MTLStructMemberInternal structType](self, "structType") && objc_msgSend(a3, "structType"))
  {
    return v17 & objc_msgSend(-[MTLStructMemberInternal structType](self, "structType"), "isStructLayoutThreadSafeWith:", objc_msgSend(a3, "structType"));
  }
  else
  {
    v18 = -[MTLStructMemberInternal structType](self, "structType");
    if (v18 != (id)objc_msgSend(a3, "structType"))
      LOBYTE(v17) = 0;
  }
  return v17;
}

- (id)formattedDescription:(unint64_t)a3 withPrintedTypes:(id)a4
{
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSString *name;
  MTLType *typeInfo;
  const __CFString *v12;
  objc_super v14;
  _QWORD v15[16];

  v15[15] = *MEMORY[0x1E0C80C00];
  v6 = a3 + 4;
  v7 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v8 = (void *)MEMORY[0x1E0CB3940];
  v14.receiver = self;
  v14.super_class = (Class)MTLStructMemberInternal;
  v9 = -[MTLStructMemberInternal description](&v14, sel_description);
  name = self->_name;
  v15[0] = v7;
  v15[1] = CFSTR("Name =");
  v15[2] = name;
  v15[3] = v7;
  v15[4] = CFSTR("Offset =");
  v15[5] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_offset);
  v15[6] = v7;
  v15[7] = CFSTR("DataType =");
  v15[8] = MTLDataTypeString(*((unsigned __int16 *)self + 12));
  v15[9] = v7;
  v15[10] = CFSTR("ArgumentIndex =");
  v15[11] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_argumentIndex);
  v15[12] = v7;
  v15[13] = CFSTR("TypeInfo =");
  typeInfo = self->_typeInfo;
  if (typeInfo)
    v12 = (const __CFString *)-[MTLType formattedDescription:withPrintedTypes:](typeInfo, "formattedDescription:withPrintedTypes:", v6, a4);
  else
    v12 = CFSTR(" nil");
  v15[14] = v12;
  return (id)objc_msgSend(v8, "stringWithFormat:", CFSTR("%@%@"), v9, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 15), "componentsJoinedByString:", CFSTR(" ")));
}

- (BOOL)isEqual:(id)a3
{
  NSString *name;
  int v6;
  unint64_t details;
  MTLType *typeInfo;

  if (!a3)
  {
    LOBYTE(v6) = 0;
    return v6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_17;
  name = self->_name;
  if ((unint64_t)name | *((_QWORD *)a3 + 1))
  {
    v6 = -[NSString isEqualToString:](name, "isEqualToString:");
    if (!v6)
      return v6;
  }
  if (self->_offset != *((_QWORD *)a3 + 2) || *((unsigned __int16 *)self + 12) != *((unsigned __int16 *)a3 + 12))
    goto LABEL_17;
  details = (unint64_t)self->_details;
  if (details | *((_QWORD *)a3 + 4))
  {
    v6 = objc_msgSend((id)details, "isEqual:");
    if (!v6)
      return v6;
  }
  if (self->_pixelFormat != *((_QWORD *)a3 + 5)
    || self->_aluType != *((_QWORD *)a3 + 6)
    || self->_argumentIndex != *((_QWORD *)a3 + 7)
    || self->_render_target != *((_QWORD *)a3 + 8)
    || self->_raster_order_group != *((_QWORD *)a3 + 9))
  {
LABEL_17:
    LOBYTE(v6) = 0;
    return v6;
  }
  typeInfo = self->_typeInfo;
  if (!((unint64_t)typeInfo | *((_QWORD *)a3 + 10)) || (v6 = -[MTLType isEqual:](typeInfo, "isEqual:")) != 0)
    LOBYTE(v6) = 1;
  return v6;
}

- (unint64_t)pixelFormat
{
  return self->_pixelFormat;
}

- (unint64_t)aluType
{
  return self->_aluType;
}

- (unint64_t)render_target
{
  return self->_render_target;
}

- (unint64_t)raster_order_group
{
  return self->_raster_order_group;
}

@end
