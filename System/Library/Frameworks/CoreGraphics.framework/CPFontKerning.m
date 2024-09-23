@implementation CPFontKerning

- (CPFontKerning)initWithKernData:(__CFData *)a3
{
  CPFontKerning *v4;
  CPFontKerning *v5;
  unsigned int Length;
  const __CFData *v7;

  v4 = -[CPFontKerning init](self, "init");
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      Length = CFDataGetLength(a3);
      v5->kernTableLength = Length;
      if (Length)
      {
        v7 = (const __CFData *)CFRetain(a3);
        v5->kernTable = v7;
        v5->dataPtr = (const char *)CFDataGetBytePtr(v7);
      }
    }
    else
    {
      v4->kernTableLength = 0;
    }
    *(_WORD *)&v5->override = 256;
  }
  return v5;
}

- (CPFontKerning)initWithCGFont:(CGFont *)a3
{
  const void *v4;
  CPFontKerning *v5;

  if (!a3)
    return -[CPFontKerning initWithKernData:](self, "initWithKernData:");
  v4 = (const void *)(*(uint64_t (**)(_QWORD, uint64_t))(*((_QWORD *)a3 + 2) + 424))(*((_QWORD *)a3 + 14), 1801810542);
  v5 = -[CPFontKerning initWithKernData:](self, "initWithKernData:", v4);
  if (v4)
    CFRelease(v4);
  return v5;
}

- (void)dispose
{
  __CFData *kernTable;

  kernTable = self->kernTable;
  if (kernTable)
  {
    CFRelease(kernTable);
    self->kernTable = 0;
  }
}

- (void)finalize
{
  objc_super v3;

  -[CPFontKerning dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)CPFontKerning;
  -[CPFontKerning finalize](&v3, sel_finalize);
}

- (void)dealloc
{
  objc_super v3;

  -[CPFontKerning dispose](self, "dispose");
  v3.receiver = self;
  v3.super_class = (Class)CPFontKerning;
  -[CPFontKerning dealloc](&v3, sel_dealloc);
}

- (unsigned)readByte
{
  uint64_t offset;
  const char *dataPtr;
  unsigned __int8 v4;

  offset = self->offset;
  if (offset >= self->kernTableLength)
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

- (unsigned)readUnsignedShort
{
  __int16 v3;

  v3 = -[CPFontKerning readByte](self, "readByte");
  return -[CPFontKerning readByte](self, "readByte") | (v3 << 8);
}

- (signed)readShort
{
  return -[CPFontKerning readUnsignedShort](self, "readUnsignedShort");
}

- (unsigned)readUnsignedLong
{
  int v3;
  int v4;
  int v5;

  v3 = -[CPFontKerning readByte](self, "readByte");
  v4 = -[CPFontKerning readByte](self, "readByte");
  v5 = -[CPFontKerning readByte](self, "readByte");
  return (v3 << 24) | (v4 << 16) | (v5 << 8) | -[CPFontKerning readByte](self, "readByte");
}

- (void)doKerningPair
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  const void *v7;

  v3 = -[CPFontKerning readUnsignedShort](self, "readUnsignedShort");
  v4 = -[CPFontKerning readUnsignedShort](self, "readUnsignedShort");
  v5 = -[CPFontKerning readUnsignedShort](self, "readUnsignedShort");
  if (self->valid)
  {
    v6 = v5;
    v7 = (const void *)(v4 | ((unint64_t)v3 << 16));
    if (CFDictionaryContainsKey(self->kernDictionary, v7))
    {
      if (!self->override)
        LOWORD(v6) = v6 + (unsigned __int16)CFDictionaryGetValue(self->kernDictionary, v7);
      CFDictionaryReplaceValue(self->kernDictionary, v7, (const void *)(unsigned __int16)v6);
    }
    else
    {
      CFDictionaryAddValue(self->kernDictionary, v7, (const void *)v6);
    }
  }
}

- (void)doSubtableFormat0
{
  int v3;
  int v4;

  v3 = -[CPFontKerning readUnsignedShort](self, "readUnsignedShort");
  self->offset += 6;
  if (v3)
  {
    v4 = v3;
    do
    {
      if (!self->valid)
        break;
      -[CPFontKerning doKerningPair](self, "doKerningPair");
      --v4;
    }
    while ((_WORD)v4);
  }
}

- (void)doTTSubtable
{
  unsigned int offset;
  unsigned int v4;
  unsigned __int16 v5;

  offset = self->offset;
  v4 = -[CPFontKerning readUnsignedLong](self, "readUnsignedLong");
  v5 = -[CPFontKerning readUnsignedShort](self, "readUnsignedShort");
  self->offset += 2;
  if ((v5 & 0xE000) == 0)
  {
    switch((char)v5)
    {
      case 0:
        -[CPFontKerning doSubtableFormat0](self, "doSubtableFormat0");
        break;
      case 1:
        -[CPFontKerning doSubtableFormat1](self, "doSubtableFormat1");
        break;
      case 2:
        -[CPFontKerning doSubtableFormat2](self, "doSubtableFormat2");
        break;
      case 3:
        -[CPFontKerning doSubtableFormat3](self, "doSubtableFormat3");
        break;
      default:
        break;
    }
  }
  if (self->offset > v4 + offset)
    self->valid = 0;
  self->offset = v4 + offset;
}

- (void)doOTSubtable
{
  unsigned int offset;
  int v4;
  unsigned int v5;

  offset = self->offset;
  self->offset = offset + 2;
  v4 = -[CPFontKerning readUnsignedShort](self, "readUnsignedShort");
  v5 = -[CPFontKerning readUnsignedShort](self, "readUnsignedShort");
  if ((v5 & 7) == 1)
  {
    self->override = (v5 & 8) != 0;
    if (v5 >> 8 == 2)
    {
      -[CPFontKerning doSubtableFormat2](self, "doSubtableFormat2");
    }
    else if (!(v5 >> 8))
    {
      -[CPFontKerning doSubtableFormat0](self, "doSubtableFormat0");
    }
  }
  if (self->offset > offset + v4)
    self->valid = 0;
  self->offset = offset + v4;
}

- (void)doTable
{
  unsigned int offset;
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;

  if (!self->kernTableLength)
    goto LABEL_9;
  offset = self->offset;
  if (-[CPFontKerning readUnsignedShort](self, "readUnsignedShort"))
  {
    self->offset = offset;
    if (-[CPFontKerning readUnsignedLong](self, "readUnsignedLong") == 0x10000)
    {
      v4 = -[CPFontKerning readUnsignedLong](self, "readUnsignedLong");
      if (v4)
      {
        v5 = v4;
        do
        {
          if (!self->valid)
            break;
          -[CPFontKerning doTTSubtable](self, "doTTSubtable");
          --v5;
        }
        while (v5);
      }
      return;
    }
LABEL_9:
    self->valid = 0;
    return;
  }
  v6 = -[CPFontKerning readUnsignedShort](self, "readUnsignedShort");
  if (v6)
  {
    v7 = v6;
    do
    {
      if (!self->valid)
        break;
      -[CPFontKerning doOTSubtable](self, "doOTSubtable");
      --v7;
    }
    while ((_WORD)v7);
  }
}

- (__CFDictionary)createKernTable
{
  unsigned int kernTableLength;
  __CFDictionary *result;

  kernTableLength = self->kernTableLength;
  if (kernTableLength)
  {
    self->kernDictionary = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kernTableLength / 6uLL, 0, 0);
    self->offset = 0;
    -[CPFontKerning doTable](self, "doTable");
    result = self->kernDictionary;
    if (self->valid)
      return result;
    CFRelease(result);
  }
  return 0;
}

@end
