@implementation BMPBStoreBookmark

- (BOOL)readFrom:(id)a3
{
  return BMPBStoreBookmarkReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamId, 0);
  objc_storeStrong((id *)&self->_segmentName, 0);
}

- (void)setStreamId:(id)a3
{
  objc_storeStrong((id *)&self->_streamId, a3);
}

- (void)setSegmentName:(id)a3
{
  objc_storeStrong((id *)&self->_segmentName, a3);
}

- (void)setOffset:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_offset = a3;
}

- (void)setIterationStartTime:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_iterationStartTime = a3;
}

- (NSString)streamId
{
  return self->_streamId;
}

- (NSString)segmentName
{
  return self->_segmentName;
}

- (unsigned)offset
{
  return self->_offset;
}

- (double)iterationStartTime
{
  return self->_iterationStartTime;
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_streamId)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_segmentName)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }

}

- (BOOL)hasStreamId
{
  return self->_streamId != 0;
}

- (BOOL)hasSegmentName
{
  return self->_segmentName != 0;
}

- (void)setHasIterationStartTime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIterationStartTime
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasOffset:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasOffset
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)BMPBStoreBookmark;
  -[BMPBStoreBookmark description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BMPBStoreBookmark dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *streamId;
  NSString *segmentName;
  char has;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  streamId = self->_streamId;
  if (streamId)
    objc_msgSend(v3, "setObject:forKey:", streamId, CFSTR("streamId"));
  segmentName = self->_segmentName;
  if (segmentName)
    objc_msgSend(v4, "setObject:forKey:", segmentName, CFSTR("segmentName"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_iterationStartTime);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("iterationStartTime"));

    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_offset);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("offset"));

  }
  return v4;
}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_streamId)
  {
    objc_msgSend(v4, "setStreamId:");
    v4 = v6;
  }
  if (self->_segmentName)
  {
    objc_msgSend(v6, "setSegmentName:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_iterationStartTime;
    *((_BYTE *)v4 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_offset;
    *((_BYTE *)v4 + 40) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_streamId, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSString copyWithZone:](self->_segmentName, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_iterationStartTime;
    *(_BYTE *)(v5 + 40) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_offset;
    *(_BYTE *)(v5 + 40) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *streamId;
  NSString *segmentName;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  streamId = self->_streamId;
  if ((unint64_t)streamId | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](streamId, "isEqual:"))
      goto LABEL_15;
  }
  segmentName = self->_segmentName;
  if ((unint64_t)segmentName | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](segmentName, "isEqual:"))
      goto LABEL_15;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 1) == 0 || self->_iterationStartTime != *((double *)v4 + 1))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 40) & 1) != 0)
  {
LABEL_15:
    v7 = 0;
    goto LABEL_16;
  }
  v7 = (*((_BYTE *)v4 + 40) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 40) & 2) == 0 || self->_offset != *((_DWORD *)v4 + 4))
      goto LABEL_15;
    v7 = 1;
  }
LABEL_16:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  char has;
  unint64_t v6;
  double iterationStartTime;
  double v8;
  long double v9;
  double v10;
  uint64_t v11;

  v3 = -[NSString hash](self->_streamId, "hash");
  v4 = -[NSString hash](self->_segmentName, "hash");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    iterationStartTime = self->_iterationStartTime;
    v8 = -iterationStartTime;
    if (iterationStartTime >= 0.0)
      v8 = self->_iterationStartTime;
    v9 = floor(v8 + 0.5);
    v10 = (v8 - v9) * 1.84467441e19;
    v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0)
        v6 += (unint64_t)v10;
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    v6 = 0;
  }
  if ((has & 2) != 0)
    v11 = 2654435761 * self->_offset;
  else
    v11 = 0;
  return v4 ^ v3 ^ v6 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (*((_QWORD *)v4 + 4))
  {
    -[BMPBStoreBookmark setStreamId:](self, "setStreamId:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[BMPBStoreBookmark setSegmentName:](self, "setSegmentName:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 40);
  if ((v5 & 1) != 0)
  {
    self->_iterationStartTime = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 40);
  }
  if ((v5 & 2) != 0)
  {
    self->_offset = *((_DWORD *)v4 + 4);
    *(_BYTE *)&self->_has |= 2u;
  }

}

@end
