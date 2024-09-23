@implementation HWPDrawing

- (unsigned)version
{
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    return self->_version;
  else
    return 1;
}

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasVersion
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasEncodedCanvasSize
{
  return self->_encodedCanvasSize != 0;
}

- (BOOL)hasEncodedStrokesFrame
{
  return self->_encodedStrokesFrame != 0;
}

- (void)setStrokesCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_strokesCount = a3;
}

- (void)setHasStrokesCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasStrokesCount
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (int)compressionAlgorithm
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_compressionAlgorithm;
  else
    return 1;
}

- (void)setCompressionAlgorithm:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_compressionAlgorithm = a3;
}

- (void)setHasCompressionAlgorithm:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasCompressionAlgorithm
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)compressionAlgorithmAsString:(int)a3
{
  if (a3 < 7)
    return *(&off_24E1B0D48 + a3);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsCompressionAlgorithm:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("None")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LZ4")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ZLIB")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LZMA")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LZ4_RAW")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("LZFSE")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setDecompressedLength:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_decompressedLength = a3;
}

- (void)setHasDecompressedLength:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDecompressedLength
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (unsigned)strokeDataFieldCount
{
  if ((*(_BYTE *)&self->_has & 4) != 0)
    return self->_strokeDataFieldCount;
  else
    return 4;
}

- (void)setStrokeDataFieldCount:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_strokeDataFieldCount = a3;
}

- (void)setHasStrokeDataFieldCount:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasStrokeDataFieldCount
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasStrokes
{
  return self->_strokes != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)HWPDrawing;
  -[HWPDrawing description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HWPDrawing dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *encodedCanvasSize;
  NSData *encodedStrokesFrame;
  char has;
  void *v8;
  NSData *strokes;
  PBUnknownFields *unknownFields;
  void *v11;
  void *v13;
  uint64_t compressionAlgorithm;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_version);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  }
  encodedCanvasSize = self->_encodedCanvasSize;
  if (encodedCanvasSize)
    objc_msgSend(v3, "setObject:forKey:", encodedCanvasSize, CFSTR("encodedCanvasSize"));
  encodedStrokesFrame = self->_encodedStrokesFrame;
  if (encodedStrokesFrame)
    objc_msgSend(v3, "setObject:forKey:", encodedStrokesFrame, CFSTR("encodedStrokesFrame"));
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_strokesCount);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("strokesCount"));

    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_9:
      if ((has & 2) == 0)
        goto LABEL_10;
      goto LABEL_22;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  compressionAlgorithm = self->_compressionAlgorithm;
  if (compressionAlgorithm >= 7)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_compressionAlgorithm);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = *(&off_24E1B0D48 + compressionAlgorithm);
  }
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("compressionAlgorithm"));

  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_22:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_decompressedLength);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("decompressedLength"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_strokeDataFieldCount);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("strokeDataFieldCount"));

  }
LABEL_12:
  strokes = self->_strokes;
  if (strokes)
    objc_msgSend(v3, "setObject:forKey:", strokes, CFSTR("strokes"));
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    -[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("Unknown Fields"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return HWPDrawingReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
  if (self->_encodedCanvasSize)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  if (self->_encodedStrokesFrame)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_9:
      if ((has & 2) == 0)
        goto LABEL_10;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_11:
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
LABEL_12:
  if (self->_strokes)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v4);

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v4[15] = self->_version;
    *((_BYTE *)v4 + 64) |= 0x10u;
  }
  v6 = v4;
  if (self->_encodedCanvasSize)
  {
    objc_msgSend(v4, "setEncodedCanvasSize:");
    v4 = v6;
  }
  if (self->_encodedStrokesFrame)
  {
    objc_msgSend(v6, "setEncodedStrokesFrame:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[14] = self->_strokesCount;
    *((_BYTE *)v4 + 64) |= 8u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_9:
      if ((has & 2) == 0)
        goto LABEL_10;
      goto LABEL_17;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_9;
  }
  v4[4] = self->_compressionAlgorithm;
  *((_BYTE *)v4 + 64) |= 1u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_10:
    if ((has & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_17:
  v4[5] = self->_decompressedLength;
  *((_BYTE *)v4 + 64) |= 2u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_11:
    v4[10] = self->_strokeDataFieldCount;
    *((_BYTE *)v4 + 64) |= 4u;
  }
LABEL_12:
  if (self->_strokes)
  {
    objc_msgSend(v6, "setStrokes:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  char has;
  uint64_t v12;
  void *v13;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v5 + 60) = self->_version;
    *(_BYTE *)(v5 + 64) |= 0x10u;
  }
  v7 = -[NSData copyWithZone:](self->_encodedCanvasSize, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v7;

  v9 = -[NSData copyWithZone:](self->_encodedStrokesFrame, "copyWithZone:", a3);
  v10 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v9;

  has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_strokesCount;
    *(_BYTE *)(v6 + 64) |= 8u;
    has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 2) == 0)
        goto LABEL_6;
LABEL_11:
      *(_DWORD *)(v6 + 20) = self->_decompressedLength;
      *(_BYTE *)(v6 + 64) |= 2u;
      if ((*(_BYTE *)&self->_has & 4) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v6 + 16) = self->_compressionAlgorithm;
  *(_BYTE *)(v6 + 64) |= 1u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 4) != 0)
  {
LABEL_7:
    *(_DWORD *)(v6 + 40) = self->_strokeDataFieldCount;
    *(_BYTE *)(v6 + 64) |= 4u;
  }
LABEL_8:
  v12 = -[NSData copyWithZone:](self->_strokes, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v12;

  objc_storeStrong((id *)(v6 + 8), self->_unknownFields);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *encodedCanvasSize;
  NSData *encodedStrokesFrame;
  NSData *strokes;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_33;
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 0x10) == 0 || self->_version != *((_DWORD *)v4 + 15))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 64) & 0x10) != 0)
  {
LABEL_33:
    v8 = 0;
    goto LABEL_34;
  }
  encodedCanvasSize = self->_encodedCanvasSize;
  if ((unint64_t)encodedCanvasSize | *((_QWORD *)v4 + 3)
    && !-[NSData isEqual:](encodedCanvasSize, "isEqual:"))
  {
    goto LABEL_33;
  }
  encodedStrokesFrame = self->_encodedStrokesFrame;
  if ((unint64_t)encodedStrokesFrame | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](encodedStrokesFrame, "isEqual:"))
      goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 8) == 0 || self->_strokesCount != *((_DWORD *)v4 + 14))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 64) & 8) != 0)
  {
    goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_compressionAlgorithm != *((_DWORD *)v4 + 4))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_decompressedLength != *((_DWORD *)v4 + 5))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    goto LABEL_33;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) == 0 || self->_strokeDataFieldCount != *((_DWORD *)v4 + 10))
      goto LABEL_33;
  }
  else if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
    goto LABEL_33;
  }
  strokes = self->_strokes;
  if ((unint64_t)strokes | *((_QWORD *)v4 + 6))
    v8 = -[NSData isEqual:](strokes, "isEqual:");
  else
    v8 = 1;
LABEL_34:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v3 = 2654435761 * self->_version;
  else
    v3 = 0;
  v4 = -[NSData hash](self->_encodedCanvasSize, "hash");
  v5 = -[NSData hash](self->_encodedStrokesFrame, "hash");
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    v6 = 2654435761 * self->_strokesCount;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_6:
      v7 = 2654435761 * self->_compressionAlgorithm;
      if ((*(_BYTE *)&self->_has & 2) != 0)
        goto LABEL_7;
LABEL_11:
      v8 = 0;
      if ((*(_BYTE *)&self->_has & 4) != 0)
        goto LABEL_8;
LABEL_12:
      v9 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ -[NSData hash](self->_strokes, "hash");
    }
  }
  else
  {
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_6;
  }
  v7 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_11;
LABEL_7:
  v8 = 2654435761 * self->_decompressedLength;
  if ((*(_BYTE *)&self->_has & 4) == 0)
    goto LABEL_12;
LABEL_8:
  v9 = 2654435761 * self->_strokeDataFieldCount;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ -[NSData hash](self->_strokes, "hash");
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  char v5;
  _DWORD *v6;

  v4 = a3;
  if ((v4[16] & 0x10) != 0)
  {
    self->_version = v4[15];
    *(_BYTE *)&self->_has |= 0x10u;
  }
  v6 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[HWPDrawing setEncodedCanvasSize:](self, "setEncodedCanvasSize:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[HWPDrawing setEncodedStrokesFrame:](self, "setEncodedStrokesFrame:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 64);
  if ((v5 & 8) != 0)
  {
    self->_strokesCount = v4[14];
    *(_BYTE *)&self->_has |= 8u;
    v5 = *((_BYTE *)v4 + 64);
    if ((v5 & 1) == 0)
    {
LABEL_9:
      if ((v5 & 2) == 0)
        goto LABEL_10;
      goto LABEL_17;
    }
  }
  else if ((v4[16] & 1) == 0)
  {
    goto LABEL_9;
  }
  self->_compressionAlgorithm = v4[4];
  *(_BYTE *)&self->_has |= 1u;
  v5 = *((_BYTE *)v4 + 64);
  if ((v5 & 2) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_17:
  self->_decompressedLength = v4[5];
  *(_BYTE *)&self->_has |= 2u;
  if ((v4[16] & 4) != 0)
  {
LABEL_11:
    self->_strokeDataFieldCount = v4[10];
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_12:
  if (*((_QWORD *)v4 + 6))
  {
    -[HWPDrawing setStrokes:](self, "setStrokes:");
    v4 = v6;
  }

}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (NSData)encodedCanvasSize
{
  return self->_encodedCanvasSize;
}

- (void)setEncodedCanvasSize:(id)a3
{
  objc_storeStrong((id *)&self->_encodedCanvasSize, a3);
}

- (NSData)encodedStrokesFrame
{
  return self->_encodedStrokesFrame;
}

- (void)setEncodedStrokesFrame:(id)a3
{
  objc_storeStrong((id *)&self->_encodedStrokesFrame, a3);
}

- (unsigned)strokesCount
{
  return self->_strokesCount;
}

- (unsigned)decompressedLength
{
  return self->_decompressedLength;
}

- (NSData)strokes
{
  return self->_strokes;
}

- (void)setStrokes:(id)a3
{
  objc_storeStrong((id *)&self->_strokes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokes, 0);
  objc_storeStrong((id *)&self->_encodedStrokesFrame, 0);
  objc_storeStrong((id *)&self->_encodedCanvasSize, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
