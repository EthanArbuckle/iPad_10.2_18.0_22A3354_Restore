@implementation CRXUBitBuffer

- (CRXUBitBuffer)initWithData:(id)a3
{
  id v5;
  CRXUBitBuffer *v6;
  CRXUBitBuffer *v7;
  uint64_t v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRXUBitBuffer;
  v6 = -[CRXUBitBuffer init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_inputData, a3);
    v7->_byteCount = -[NSData length](v7->_inputData, "length");
    v7->_bitCount = 8 * -[NSData length](v7->_inputData, "length");
    v8 = -[NSData bytes](v7->_inputData, "bytes");
    v7->_inputPtr = (const char *)v8;
    v7->_inputEndPtr = (const char *)(v8 + -[NSData length](v7->_inputData, "length"));
    v7->_curInputByte = *v7->_inputPtr;
    v7->_bitOffset = 0;
    v7->_bitOffsetInByte = 0;
  }

  return v7;
}

- (CRXUBitBuffer)initWithMutableData:(id)a3
{
  id v5;
  CRXUBitBuffer *v6;
  CRXUBitBuffer *v7;
  char *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CRXUBitBuffer;
  v6 = -[CRXUBitBuffer init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_outputData, a3);
    v7->_byteCount = -[NSMutableData length](v7->_outputData, "length");
    v7->_bitCount = 8 * -[NSMutableData length](v7->_outputData, "length");
    v8 = -[NSMutableData mutableBytes](v7->_outputData, "mutableBytes");
    v7->_outputPtr = v8;
    v7->_bitOffset = 0;
    v7->_bitOffsetInByte = 0;
    bzero(v8, -[NSMutableData length](v7->_outputData, "length"));
  }

  return v7;
}

- (void)rewind
{
  NSData *inputData;
  const char *v4;
  char *v5;

  inputData = self->_inputData;
  if (inputData)
  {
    v4 = -[NSData bytes](inputData, "bytes");
    self->_inputPtr = v4;
    self->_curInputByte = *v4;
  }
  else
  {
    v5 = -[NSMutableData mutableBytes](self->_outputData, "mutableBytes");
    self->_outputPtr = v5;
    bzero(v5, -[NSMutableData length](self->_outputData, "length"));
  }
  self->_bitOffset = 0;
  self->_bitOffsetInByte = 0;
}

- (BOOL)skipBits:(unint64_t)a3
{
  unint64_t v4;
  unint64_t v6;
  unint64_t bitOffsetInByte;
  unint64_t v8;
  unint64_t v9;

  v4 = self->_bitCount - self->_bitOffset;
  if (a3 - 1 < v4)
  {
    v6 = a3;
    do
    {
      bitOffsetInByte = self->_bitOffsetInByte;
      if (8 - bitOffsetInByte >= v6)
        v8 = v6;
      else
        v8 = 8 - bitOffsetInByte;
      if (v8 == 8
        || (!self->_inputData
          ? (*self->_outputPtr = *(unsigned __int8 *)self->_outputPtr << v8, bitOffsetInByte = self->_bitOffsetInByte)
          : (self->_curInputByte <<= v8),
            v9 = bitOffsetInByte + v8,
            self->_bitOffsetInByte = v9,
            v9 == 8))
      {
        -[CRXUBitBuffer nextByte](self, "nextByte");
      }
      self->_bitOffset += v8;
      v6 -= v8;
    }
    while (v6);
  }
  return v4 >= a3;
}

- (unint64_t)bitCount
{
  return self->_bitCount;
}

- (unint64_t)byteCount
{
  return self->_byteCount;
}

- (BOOL)readBool:(BOOL *)a3
{
  unint64_t bitOffset;
  unint64_t v5;

  if (!self->_inputData)
    return 0;
  bitOffset = self->_bitOffset;
  if (bitOffset == self->_bitCount)
    return 0;
  *a3 = self->_curInputByte >> 7;
  self->_curInputByte *= 2;
  v5 = self->_bitOffsetInByte + 1;
  self->_bitOffset = bitOffset + 1;
  self->_bitOffsetInByte = v5;
  if (v5 == 8)
    -[CRXUBitBuffer nextByte](self, "nextByte");
  return 1;
}

- (BOOL)writeBool:(BOOL)a3
{
  unint64_t v4;

  if (!self->_outputData || self->_bitOffset == self->_bitCount)
    return 0;
  *self->_outputPtr *= 2;
  *self->_outputPtr |= a3;
  v4 = self->_bitOffsetInByte + 1;
  ++self->_bitOffset;
  self->_bitOffsetInByte = v4;
  if (v4 == 8)
    -[CRXUBitBuffer nextByte](self, "nextByte");
  return 1;
}

- (BOOL)readUInteger:(unint64_t *)a3 bitWidth:(unint64_t)a4
{
  BOOL result;
  unint64_t v6;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  result = 0;
  if (a4 <= 0x40 && self->_inputData)
  {
    v6 = a4;
    if (self->_bitCount - self->_bitOffset >= a4)
    {
      *a3 = 0;
      if (a4)
      {
        do
        {
          if (8 - self->_bitOffsetInByte >= v6)
            v8 = v6;
          else
            v8 = 8 - self->_bitOffsetInByte;
          v9 = *a3 << v8;
          *a3 = v9;
          *a3 = v9 | (self->_curInputByte >> (8 - v8));
          self->_curInputByte <<= v8;
          v10 = self->_bitOffsetInByte + v8;
          self->_bitOffset += v8;
          self->_bitOffsetInByte = v10;
          if (v10 == 8)
            -[CRXUBitBuffer nextByte](self, "nextByte");
          v6 -= v8;
        }
        while (v6);
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)writeUInteger:(unint64_t)a3 bitWidth:(unint64_t)a4
{
  BOOL result;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  result = 0;
  if (a4 <= 0x40 && self->_outputData)
  {
    v6 = a4;
    if (self->_bitCount - self->_bitOffset >= a4)
    {
      if (a4)
      {
        v7 = (0xFFFFFFFFFFFFFFFFLL >> -(char)a4) & a3;
        v8 = a4;
        do
        {
          if (8 - self->_bitOffsetInByte >= v6)
            v9 = v6;
          else
            v9 = 8 - self->_bitOffsetInByte;
          *self->_outputPtr = *(unsigned __int8 *)self->_outputPtr << v9;
          v8 -= v9;
          *self->_outputPtr |= v7 >> v8;
          v10 = self->_bitOffsetInByte + v9;
          self->_bitOffsetInByte = v10;
          if (v10 == 8)
            -[CRXUBitBuffer nextByte](self, "nextByte");
          self->_bitOffset += v9;
          v6 -= v9;
        }
        while (v6);
      }
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)readData:(id)a3 bitWidth:(unint64_t)a4
{
  id v6;
  void *v7;
  unint64_t bitCount;
  unint64_t bitOffset;
  unint64_t v10;
  BOOL v11;
  BOOL v12;
  uint64_t v13;
  _BYTE *v14;
  unint64_t v15;
  char v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;

  v6 = a3;
  v7 = v6;
  if (self->_inputData
    && ((bitCount = self->_bitCount, bitOffset = self->_bitOffset, v10 = 8 * objc_msgSend(v6, "length"), v10 >= a4)
      ? (v11 = bitCount - bitOffset >= a4)
      : (v11 = 0),
        v11))
  {
    v13 = objc_msgSend(objc_retainAutorelease(v7), "mutableBytes");
    if (a4)
    {
      v14 = (_BYTE *)v13;
      v15 = v10 - a4;
      if (v10 < a4)
        v15 = 0;
      do
      {
        v21 = 0;
        if (v15 <= 7)
        {
          if (a4 >= 8)
            v18 = 8;
          else
            v18 = a4;
          v19 = 8 - v15;
          if (8 - v15 >= a4)
            v19 = a4;
          if (v15)
            v17 = v19;
          else
            v17 = v18;
          -[CRXUBitBuffer readUInteger:bitWidth:](self, "readUInteger:bitWidth:", &v21, v17);
          v15 = 0;
          v16 = v21;
        }
        else
        {
          v16 = 0;
          v17 = 0;
          v15 -= 8;
        }
        *v14++ = v16;
        a4 -= v17;
      }
      while (a4);
    }
    v12 = 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)writeData:(id)a3 bitWidth:(unint64_t)a4
{
  id v6;
  void *v7;
  unint64_t bitCount;
  unint64_t bitOffset;
  BOOL v10;
  uint64_t v11;
  unsigned __int8 *v12;
  unint64_t v13;
  unsigned int v14;

  v6 = a3;
  v7 = v6;
  if (self->_outputData)
  {
    bitCount = self->_bitCount;
    bitOffset = self->_bitOffset;
    v10 = 0;
    if (a4 <= 8 * objc_msgSend(v6, "length") && bitCount - bitOffset >= a4)
    {
      v11 = objc_msgSend(objc_retainAutorelease(v7), "bytes");
      if (a4)
      {
        v12 = (unsigned __int8 *)v11;
        if ((a4 & 7) != 0)
          v13 = a4 & 7;
        else
          v13 = 8;
        do
        {
          v14 = *v12++;
          -[CRXUBitBuffer writeUInteger:bitWidth:](self, "writeUInteger:bitWidth:", v14, v13);
          a4 -= v13;
          v13 = 8;
        }
        while (a4);
      }
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)nextByte
{
  const char *inputEndPtr;
  const char *v3;

  if (self->_inputData)
  {
    inputEndPtr = self->_inputEndPtr;
    v3 = self->_inputPtr + 1;
    self->_inputPtr = v3;
    if (v3 < inputEndPtr)
      self->_curInputByte = *v3;
  }
  else
  {
    ++self->_outputPtr;
  }
  self->_bitOffsetInByte = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputData, 0);
  objc_storeStrong((id *)&self->_inputData, 0);
}

@end
