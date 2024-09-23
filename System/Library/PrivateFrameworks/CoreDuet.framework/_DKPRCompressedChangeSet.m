@implementation _DKPRCompressedChangeSet

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_DKPRCompressedChangeSet;
  -[_DKPRCompressedChangeSet description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_DKPRCompressedChangeSet dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *compressedData;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_uncompressedLength);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("uncompressedLength"));

  compressedData = self->_compressedData;
  if (compressedData)
    objc_msgSend(v3, "setObject:forKey:", compressedData, CFSTR("compressedData"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _DKPRCompressedChangeSetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint64Field();
  if (!self->_compressedData)
    -[_DKPRCompressedChangeSet writeTo:].cold.1();
  PBDataWriterWriteDataField();

}

- (void)setCompressedData:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 16), a2);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5[1] = self->_uncompressedLength;
  v6 = -[NSData copyWithZone:](self->_compressedData, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *compressedData;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) && self->_uncompressedLength == v4[1])
  {
    compressedData = self->_compressedData;
    if ((unint64_t)compressedData | v4[2])
      v6 = -[NSData isEqual:](compressedData, "isEqual:");
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

  v2 = 2654435761u * self->_uncompressedLength;
  return -[NSData hash](self->_compressedData, "hash") ^ v2;
}

- (uint64_t)uncompressedLength
{
  if (result)
    return *(_QWORD *)(result + 8);
  return result;
}

- (uint64_t)setUncompressedLength:(uint64_t)result
{
  if (result)
    *(_QWORD *)(result + 8) = a2;
  return result;
}

- (uint64_t)compressedData
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compressedData, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[_DKPRCompressedChangeSet writeTo:]", "_DKPRCompressedChangeSet.m", 83, "nil != self->_compressedData");
}

@end
