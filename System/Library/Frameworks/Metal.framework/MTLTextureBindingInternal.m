@implementation MTLTextureBindingInternal

- (MTLTextureBindingInternal)initWithName:(id)a3 access:(unint64_t)a4 isActive:(BOOL)a5 locationIndex:(unint64_t)a6 arraySize:(unint64_t)a7 dataType:(unint64_t)a8 textureType:(unint64_t)a9 isDepthTexture:(BOOL)a10
{
  MTLTextureBindingInternal *v12;
  MTLTextureBindingInternal *v13;
  char v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MTLTextureBindingInternal;
  v12 = -[MTLBindingInternal initWithName:type:access:index:active:arrayLength:](&v16, sel_initWithName_type_access_index_active_arrayLength_, a3, 2, a4, a6, a5, a7);
  v13 = v12;
  *((_WORD *)v12 + 84) = *((_WORD *)v12 + 84) & 0x8000 | a9 & 0x7FFF;
  if (a10)
    v14 = 0x80;
  else
    v14 = 0;
  *((_BYTE *)v12 + 169) = v14 & 0x80 | *((_BYTE *)v12 + 169) & 0x7F;
  v12->_textureDataType = a8;
  v12->super._typeInfo = (MTLType *)-[MTLTextureReferenceTypeInternal initWithDataType:textureType:access:isDepthTexture:]([MTLTextureReferenceTypeInternal alloc], "initWithDataType:textureType:access:isDepthTexture:", a8, a9, a4, a10);
  return v13;
}

- (unint64_t)textureType
{
  return *((_WORD *)self + 84) & 0x7FFF;
}

- (unint64_t)textureDataType
{
  return self->_textureDataType;
}

- (BOOL)isDepthTexture
{
  return *((unsigned __int8 *)self + 169) >> 7;
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
  v9.super_class = (Class)MTLTextureBindingInternal;
  v7 = -[MTLBindingInternal formattedDescription:](&v9, sel_formattedDescription_, a3);
  v10[0] = v5;
  v10[1] = CFSTR("TextureType =");
  v10[2] = MTLTextureTypeString(*((_WORD *)self + 84) & 0x7FFF);
  v10[3] = v5;
  v10[4] = CFSTR("TextureDataType =");
  v10[5] = MTLDataTypeString(self->_textureDataType);
  v10[6] = v5;
  v10[7] = CFSTR("IsDepthTexture =");
  v10[8] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *((unsigned __int8 *)self + 169) >> 7);
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
    || self->_textureDataType != *((unsigned __int16 *)a3 + 85))
  {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)MTLTextureBindingInternal;
  return -[MTLBindingInternal isEqual:](&v6, sel_isEqual_, a3);
}

@end
