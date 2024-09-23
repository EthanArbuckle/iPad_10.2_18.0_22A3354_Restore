@implementation NPKProtoBitmap

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoBitmap;
  -[NPKProtoBitmap description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NPKProtoBitmap dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSData *bitmapData;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_width);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("width"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("height"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_bitsPerComponent);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("bitsPerComponent"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_bitsPerPixel);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("bitsPerPixel"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_bytesPerRow);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("bytesPerRow"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_bitmapInfo);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("bitmapInfo"));

  bitmapData = self->_bitmapData;
  if (bitmapData)
    objc_msgSend(v3, "setObject:forKey:", bitmapData, CFSTR("bitmapData"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoBitmapReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteUint32Field();
  if (!self->_bitmapData)
    -[NPKProtoBitmap writeTo:].cold.1();
  PBDataWriterWriteDataField();

}

- (void)copyTo:(id)a3
{
  *((_QWORD *)a3 + 5) = self->_width;
  *((_QWORD *)a3 + 4) = self->_height;
  *((_QWORD *)a3 + 1) = self->_bitsPerComponent;
  *((_QWORD *)a3 + 2) = self->_bitsPerPixel;
  *((_QWORD *)a3 + 3) = self->_bytesPerRow;
  *((_DWORD *)a3 + 14) = self->_bitmapInfo;
  objc_msgSend(a3, "setBitmapData:", self->_bitmapData);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 40) = self->_width;
  *(_QWORD *)(v5 + 32) = self->_height;
  *(_QWORD *)(v5 + 8) = self->_bitsPerComponent;
  *(_QWORD *)(v5 + 16) = self->_bitsPerPixel;
  *(_QWORD *)(v5 + 24) = self->_bytesPerRow;
  *(_DWORD *)(v5 + 56) = self->_bitmapInfo;
  v6 = -[NSData copyWithZone:](self->_bitmapData, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v6;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *bitmapData;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_width == v4[5]
    && self->_height == v4[4]
    && self->_bitsPerComponent == v4[1]
    && self->_bitsPerPixel == v4[2]
    && self->_bytesPerRow == v4[3]
    && self->_bitmapInfo == *((_DWORD *)v4 + 14))
  {
    bitmapData = self->_bitmapData;
    if ((unint64_t)bitmapData | v4[6])
      v6 = -[NSData isEqual:](bitmapData, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v3;

  v2 = (2654435761u * self->_height) ^ (2654435761u * self->_width) ^ (2654435761u * self->_bitsPerComponent) ^ (2654435761u * self->_bitsPerPixel);
  v3 = (2654435761u * self->_bytesPerRow) ^ (2654435761 * self->_bitmapInfo);
  return v2 ^ v3 ^ -[NSData hash](self->_bitmapData, "hash");
}

- (void)mergeFrom:(id)a3
{
  self->_width = *((_QWORD *)a3 + 5);
  self->_height = *((_QWORD *)a3 + 4);
  self->_bitsPerComponent = *((_QWORD *)a3 + 1);
  self->_bitsPerPixel = *((_QWORD *)a3 + 2);
  self->_bytesPerRow = *((_QWORD *)a3 + 3);
  self->_bitmapInfo = *((_DWORD *)a3 + 14);
  if (*((_QWORD *)a3 + 6))
    -[NPKProtoBitmap setBitmapData:](self, "setBitmapData:");
}

- (unint64_t)width
{
  return self->_width;
}

- (void)setWidth:(unint64_t)a3
{
  self->_width = a3;
}

- (unint64_t)height
{
  return self->_height;
}

- (void)setHeight:(unint64_t)a3
{
  self->_height = a3;
}

- (unint64_t)bitsPerComponent
{
  return self->_bitsPerComponent;
}

- (void)setBitsPerComponent:(unint64_t)a3
{
  self->_bitsPerComponent = a3;
}

- (unint64_t)bitsPerPixel
{
  return self->_bitsPerPixel;
}

- (void)setBitsPerPixel:(unint64_t)a3
{
  self->_bitsPerPixel = a3;
}

- (unint64_t)bytesPerRow
{
  return self->_bytesPerRow;
}

- (void)setBytesPerRow:(unint64_t)a3
{
  self->_bytesPerRow = a3;
}

- (unsigned)bitmapInfo
{
  return self->_bitmapInfo;
}

- (void)setBitmapInfo:(unsigned int)a3
{
  self->_bitmapInfo = a3;
}

- (NSData)bitmapData
{
  return self->_bitmapData;
}

- (void)setBitmapData:(id)a3
{
  objc_storeStrong((id *)&self->_bitmapData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bitmapData, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoBitmap writeTo:]", "NPKProtoBitmap.m", 138, "nil != self->_bitmapData");
}

@end
