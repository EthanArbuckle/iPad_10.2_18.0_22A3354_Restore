@implementation MTLTextureReferenceTypeInternal

- (MTLTextureReferenceTypeInternal)initWithDataType:(unint64_t)a3 textureType:(unint64_t)a4 access:(unint64_t)a5 isDepthTexture:(BOOL)a6
{
  MTLTextureReferenceTypeInternal *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)MTLTextureReferenceTypeInternal;
  result = -[MTLTextureReferenceTypeInternal init](&v11, sel_init);
  result->_dataType = 58;
  result->_textureDataType = a3;
  result->_textureType = a4;
  result->_access = a5;
  result->_isDepthTexture = a6;
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)MTLTextureReferenceTypeInternal;
  -[MTLTextureReferenceTypeInternal dealloc](&v2, sel_dealloc);
}

- (unint64_t)dataType
{
  return self->_dataType;
}

- (unint64_t)textureType
{
  return self->_textureType;
}

- (unint64_t)textureDataType
{
  return self->_textureDataType;
}

- (BOOL)isDepthTexture
{
  return self->_isDepthTexture;
}

- (id)formattedDescription:(unint64_t)a3 withPrintedTypes:(id)a4
{
  uint64_t v5;
  void *v6;
  unint64_t access;
  const __CFString *v8;
  _QWORD v10[16];

  v10[15] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v6 = (void *)MEMORY[0x1E0CB3940];
  v10[0] = v5;
  v10[1] = CFSTR("DataType =");
  v10[2] = MTLDataTypeString(self->_dataType);
  v10[3] = v5;
  v10[4] = CFSTR("TextureDataType =");
  v10[5] = MTLDataTypeString(self->_textureDataType);
  v10[6] = v5;
  v10[7] = CFSTR("TextureType =");
  v10[8] = MTLTextureTypeString(self->_textureType);
  v10[9] = v5;
  v10[10] = CFSTR("Access =");
  access = self->_access;
  if (access > 2)
    v8 = CFSTR("Unknown");
  else
    v8 = off_1E0FE50A0[access];
  v10[11] = v8;
  v10[12] = v5;
  v10[13] = CFSTR("IsDepthTexture =");
  v10[14] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isDepthTexture);
  return (id)objc_msgSend(v6, "stringWithFormat:", CFSTR("%@"), objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 15), "componentsJoinedByString:", CFSTR(" ")));
}

- (BOOL)isEqual:(id)a3
{
  if (!a3)
    return 0;
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && self->_dataType == *((_QWORD *)a3 + 1)
      && self->_textureDataType == *((_QWORD *)a3 + 2)
      && self->_textureType == *((_QWORD *)a3 + 3)
      && self->_access == *((_QWORD *)a3 + 4)
      && self->_isDepthTexture == *((unsigned __int8 *)a3 + 40);
}

- (unint64_t)access
{
  return self->_access;
}

@end
