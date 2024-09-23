@implementation SKTileStamp

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)numberOfColumns
{
  return self->_columns;
}

- (unint64_t)numberOfRows
{
  return self->_rows;
}

- (unsigned)tileData
{
  return self->_tileData;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_tileData);
  self->_tileData = 0;
  v3.receiver = self;
  v3.super_class = (Class)SKTileStamp;
  -[SKTileStamp dealloc](&v3, sel_dealloc);
}

- (SKTileStamp)init
{
  SKTileStamp *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKTileStamp;
  result = -[SKTileStamp init](&v3, sel_init);
  if (result)
  {
    *(_QWORD *)&result->_columns = 0;
    result->_tileData = 0;
  }
  return result;
}

- (SKTileStamp)initWithWidth:(unint64_t)a3 height:(unint64_t)a4 tileData:(unsigned int *)a5
{
  unsigned int v6;
  unsigned int v7;
  SKTileStamp *v8;
  SKTileStamp *v9;
  objc_super v11;

  v6 = a4;
  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKTileStamp;
  v8 = -[SKTileStamp init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_columns = v7;
    v8->_rows = v6;
    -[SKTileStamp setTileData:size:](v8, "setTileData:size:", a5, 4 * v7 * v6);
  }
  return v9;
}

+ (id)tileStampWithWidth:(unint64_t)a3 height:(unint64_t)a4 tileData:(unsigned int *)a5
{
  return -[SKTileStamp initWithWidth:height:tileData:]([SKTileStamp alloc], "initWithWidth:height:tileData:", a3, a4, a5);
}

- (SKTileStamp)initWithCoder:(id)a3
{
  id v4;
  SKTileStamp *v5;
  uint64_t v6;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKTileStamp;
  v5 = -[SKTileStamp init](&v9, sel_init);
  if (v5)
  {
    v5->_columns = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_columns"));
    v5->_rows = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_rows"));
    v8 = 0;
    v6 = objc_msgSend(objc_retainAutorelease(v4), "decodeBytesForKey:returnedLength:", CFSTR("_tileData"), &v8);
    if (v8 == 4 * v5->_rows * v5->_columns)
      -[SKTileStamp setTileData:size:](v5, "setTileData:size:", v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unsigned int *tileData;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", self->_columns, CFSTR("_columns"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_rows, CFSTR("_rows"));
  tileData = self->_tileData;
  if (tileData)
    objc_msgSend(v5, "encodeBytes:length:forKey:", tileData, 4 * self->_columns * (unint64_t)self->_rows, CFSTR("_tileData"));

}

- (BOOL)isEqualToNode:(id)a3
{
  SKTileStamp *v4;
  SKTileStamp *v5;
  SKTileStamp *v6;
  SKTileStamp *v7;
  unsigned int columns;
  unsigned int rows;
  BOOL v10;

  v4 = (SKTileStamp *)a3;
  v5 = v4;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    v6 = v4;
    v7 = v6;
    columns = self->_columns;
    v10 = columns == v6->_columns
       && (rows = self->_rows, rows == v6->_rows)
       && memcmp(self->_tileData, v6->_tileData, rows * columns) == 0;

  }
  return v10;
}

- (void)setTileData:(unsigned int *)a3 size:(unint64_t)a4
{
  unsigned int *v7;

  free(self->_tileData);
  v7 = (unsigned int *)malloc_type_malloc(a4, 0xE30070EFuLL);
  self->_tileData = v7;
  memcpy(v7, a3, a4);
}

- (id)tileDefinitionsForTileMap:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  SKTileDefinition *v7;
  unint64_t v8;
  uint64_t v9;
  SKTileDefinition *v10;
  SKTileDefinition *v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = self->_rows * self->_columns;
  v7 = objc_alloc_init(SKTileDefinition);
  if ((_DWORD)v6)
  {
    v8 = 0;
    v9 = 4 * v6;
    do
    {
      objc_msgSend(v4, "tileDefinitionForTileID:", self->_tileData[v8 / 4]);
      v10 = (SKTileDefinition *)objc_claimAutoreleasedReturnValue();
      if (v10)
        v11 = v10;
      else
        v11 = v7;
      objc_msgSend(v5, "addObject:", v11);

      v8 += 4;
    }
    while (v9 != v8);
  }

  return v5;
}

@end
