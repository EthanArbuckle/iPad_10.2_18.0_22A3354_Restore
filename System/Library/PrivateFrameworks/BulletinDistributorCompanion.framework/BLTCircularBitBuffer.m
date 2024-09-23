@implementation BLTCircularBitBuffer

+ (unint64_t)actualCapacity:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
}

- (BLTCircularBitBuffer)initWithCapacity:(unint64_t)a3
{
  BLTCircularBitBuffer *v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableData *bitVector;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BLTCircularBitBuffer;
  v4 = -[BLTCircularBitBuffer init](&v9, sel_init);
  if (v4)
  {
    v5 = objc_msgSend((id)objc_opt_class(), "actualCapacity:", a3);
    v4->_beginIndex = 0;
    v4->_capacity = v5;
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", v4->_capacity >> 3);
    bitVector = v4->_bitVector;
    v4->_bitVector = (NSMutableData *)v6;

  }
  return v4;
}

- (BLTCircularBitBuffer)initWithData:(id)a3 andIndex:(unint64_t)a4
{
  id v6;
  BLTCircularBitBuffer *v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableData *bitVector;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BLTCircularBitBuffer;
  v7 = -[BLTCircularBitBuffer init](&v12, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "length");
    v7->_beginIndex = a4;
    v7->_capacity = 8 * v8;
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithData:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    bitVector = v7->_bitVector;
    v7->_bitVector = (NSMutableData *)v9;

  }
  return v7;
}

- (void)_setBit:(BOOL)a3 atIndex:(unint64_t)a4
{
  char v4;
  _BOOL4 v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  char v9;

  v4 = a4;
  v5 = a3;
  v6 = a4 >> 3;
  v7 = -[NSMutableData bytes](self->_bitVector, "bytes");
  v8 = 1 << (v4 & 7);
  if (v5)
    v9 = *(_BYTE *)(v7 + v6) | v8;
  else
    v9 = *(_BYTE *)(v7 + v6) & ~(_BYTE)v8;
  *(_BYTE *)(v7 + v6) = v9;
}

- (void)setBit:(BOOL)a3 atIndex:(unint64_t)a4
{
  _BOOL8 v5;
  unint64_t capacity;
  unint64_t beginIndex;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  NSUInteger v15;
  NSMutableData *bitVector;
  unint64_t v17;
  NSMutableData *v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t i;

  v5 = a3;
  beginIndex = self->_beginIndex;
  capacity = self->_capacity;
  if (capacity - 1 + beginIndex >= a4)
  {
    if (beginIndex <= a4)
      goto LABEL_20;
    v9 = a4;
    if (beginIndex - a4 < capacity)
    {
      v10 = a4 + 1;
      v9 = a4;
      goto LABEL_7;
    }
LABEL_18:
    self->_beginIndex = v9;
    -[BLTCircularBitBuffer clear](self, "clear");
    goto LABEL_20;
  }
  v9 = a4 - (capacity - 1);
  if (v9 - beginIndex >= capacity)
    goto LABEL_18;
  v10 = capacity + beginIndex;
  beginIndex = a4;
LABEL_7:
  v11 = beginIndex % capacity;
  v12 = v10 % capacity;
  self->_beginIndex = v9;
  if (v10 % capacity != beginIndex % capacity)
  {
    if ((v12 & 7) != 0)
      v13 = (v12 >> 3) + 1;
    else
      v13 = v12 >> 3;
    if (v11 >= v12)
      capacity = beginIndex % capacity;
    v14 = 8 * v13 >= capacity ? capacity : 8 * v13;
    while (v12 < v14)
      -[BLTCircularBitBuffer _setBit:atIndex:](self, "_setBit:atIndex:", 0, v12++);
    if (v14 != v11)
    {
      if (v11 >> 3 < v13)
      {
        v15 = -[NSMutableData length](self->_bitVector, "length");
        bitVector = self->_bitVector;
        v17 = -[NSMutableData length](bitVector, "length");
        if (v13 < v15)
        {
          -[NSMutableData resetBytesInRange:](bitVector, "resetBytesInRange:", v13, v17 - v13);
          v18 = self->_bitVector;
          v19 = 0;
          v20 = v11 >> 3;
          goto LABEL_26;
        }
        v13 %= v17;
      }
      v18 = self->_bitVector;
      v20 = (v11 >> 3) - v13;
      v19 = v13;
LABEL_26:
      -[NSMutableData resetBytesInRange:](v18, "resetBytesInRange:", v19, v20);
      for (i = v11 & 0xFFFFFFFFFFFFFFF8; i < v11; ++i)
        -[BLTCircularBitBuffer _setBit:atIndex:](self, "_setBit:atIndex:", 0, i);
    }
  }
LABEL_20:
  -[BLTCircularBitBuffer _setBit:atIndex:](self, "_setBit:atIndex:", v5, a4 % self->_capacity);
}

- (unsigned)bitAtIndex:(unint64_t)a3
{
  unint64_t capacity;
  unint64_t v4;
  int v5;

  capacity = self->_capacity;
  if (a3 - self->_beginIndex >= capacity)
  {
    LOBYTE(v5) = 2;
  }
  else
  {
    v4 = a3 % capacity;
    return (*(unsigned __int8 *)(-[NSMutableData bytes](self->_bitVector, "bytes") + (v4 >> 3)) >> (v4 & 7)) & 1;
  }
  return v5;
}

- (id)bitVector
{
  return self->_bitVector;
}

- (void)clear
{
  -[NSMutableData resetBytesInRange:](self->_bitVector, "resetBytesInRange:", 0, -[NSMutableData length](self->_bitVector, "length"));
}

- (unint64_t)beginIndex
{
  return self->_beginIndex;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bitVector, 0);
}

@end
