@implementation CPFontInfo

- (CPFontInfo)initWithFontData:(__CFData *)a3
{
  CPFontInfo *v4;
  CPFontInfo *v5;
  unsigned int Length;
  const __CFData *v7;

  v4 = -[CPFontInfo init](self, "init");
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      Length = CFDataGetLength(a3);
      v5->fontDataLength = Length;
      if (Length)
      {
        v7 = (const __CFData *)CFRetain(a3);
        v5->fontData = v7;
        v5->dataPtr = (const char *)CFDataGetBytePtr(v7);
      }
    }
    else
    {
      v4->fontDataLength = 0;
    }
    v5->valid = 1;
  }
  return v5;
}

- (void)dispose
{
  __CFData *fontData;

  fontData = self->fontData;
  if (fontData)
  {
    CFRelease(fontData);
    self->fontData = 0;
  }
}

- (void)finalize
{
  objc_super v3;

  -[CPFontInfo dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)CPFontInfo;
  -[CPFontInfo finalize](&v3, sel_finalize);
}

- (void)dealloc
{
  objc_super v3;

  -[CPFontInfo dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)CPFontInfo;
  -[CPFontInfo dealloc](&v3, sel_dealloc);
}

- (unsigned)readByte
{
  uint64_t offset;
  const char *dataPtr;
  unsigned __int8 v4;

  offset = self->offset;
  if (offset >= self->fontDataLength)
  {
    v4 = 0;
    self->valid = 0;
  }
  else
  {
    dataPtr = self->dataPtr;
    self->offset = offset + 1;
    return dataPtr[offset];
  }
  return v4;
}

- (unsigned)readUnsignedLong
{
  int v3;
  int v4;
  int v5;

  v3 = -[CPFontInfo readByte](self, "readByte");
  v4 = -[CPFontInfo readByte](self, "readByte");
  v5 = -[CPFontInfo readByte](self, "readByte");
  return (v3 << 24) | (v4 << 16) | (v5 << 8) | -[CPFontInfo readByte](self, "readByte");
}

- (float)readFloat
{
  float result;

  LODWORD(result) = -[CPFontInfo readUnsignedLong](self, "readUnsignedLong");
  return result;
}

- (CGRect)readRect
{
  float v3;
  double v4;
  float v5;
  double v6;
  float v7;
  double v8;
  float v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect result;

  -[CPFontInfo readFloat](self, "readFloat");
  v4 = v3;
  -[CPFontInfo readFloat](self, "readFloat");
  v6 = v5;
  -[CPFontInfo readFloat](self, "readFloat");
  v8 = v7;
  -[CPFontInfo readFloat](self, "readFloat");
  v10 = v9;
  v11 = v4;
  v12 = v6;
  v13 = v8;
  result.size.height = v10;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)getDescriptor:(id *)a3
{
  float v6;
  float v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  float v19;
  float v20;
  float v21;
  float v22;
  float v23;
  float v24;
  float v25;

  if (!a3)
    return 0;
  if (self->fontDataLength < 0x54)
    return 0;
  self->valid = 1;
  self->offset = 0;
  -[CPFontInfo readFloat](self, "readFloat");
  a3->var0 = v6;
  -[CPFontInfo readFloat](self, "readFloat");
  a3->var1 = v7;
  a3->var2 = -[CPFontInfo readUnsignedLong](self, "readUnsignedLong");
  -[CPFontInfo readRect](self, "readRect");
  a3->var3.origin.x = v8;
  a3->var3.origin.y = v9;
  a3->var3.size.width = v10;
  a3->var3.size.height = v11;
  -[CPFontInfo readFloat](self, "readFloat");
  a3->var4 = v12;
  -[CPFontInfo readFloat](self, "readFloat");
  a3->var5 = v13;
  -[CPFontInfo readFloat](self, "readFloat");
  a3->var6 = v14;
  -[CPFontInfo readFloat](self, "readFloat");
  a3->var7 = v15;
  -[CPFontInfo readFloat](self, "readFloat");
  a3->var8 = v16;
  -[CPFontInfo readFloat](self, "readFloat");
  a3->var9 = v17;
  -[CPFontInfo readFloat](self, "readFloat");
  a3->var10 = v18;
  -[CPFontInfo readFloat](self, "readFloat");
  a3->var11 = v19;
  -[CPFontInfo readFloat](self, "readFloat");
  a3->var12 = v20;
  -[CPFontInfo readFloat](self, "readFloat");
  a3->var13 = v21;
  -[CPFontInfo readFloat](self, "readFloat");
  a3->var14 = v22;
  -[CPFontInfo readFloat](self, "readFloat");
  a3->var15 = v23;
  -[CPFontInfo readFloat](self, "readFloat");
  a3->var16 = v24;
  -[CPFontInfo readFloat](self, "readFloat");
  a3->var17 = v25;
  return self->valid;
}

- (int)kernUnitsPerEm
{
  int result;

  self->valid = 1;
  self->offset = 84;
  result = -[CPFontInfo readLong](self, "readLong");
  if (!self->valid)
    return 0;
  return result;
}

- (__CFData)newKernData
{
  unsigned int fontDataLength;

  fontDataLength = self->fontDataLength;
  if (fontDataLength >= 0x59)
    return CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)self->dataPtr + 88, fontDataLength - 88, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  else
    return 0;
}

@end
