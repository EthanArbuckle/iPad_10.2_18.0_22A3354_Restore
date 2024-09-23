@implementation VCCaptionsTranscriptionBlob

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCCaptionsTranscriptionBlob setSegments:](self, "setSegments:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VCCaptionsTranscriptionBlob;
  -[VCCaptionsTranscriptionBlob dealloc](&v3, sel_dealloc);
}

- (void)setIsLocal:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_isLocal = a3;
}

- (void)setHasIsLocal:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsLocal
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setIsFinal:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isFinal = a3;
}

- (void)setHasIsFinal:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsFinal
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)clearSegments
{
  -[NSMutableArray removeAllObjects](self->_segments, "removeAllObjects");
}

- (void)addSegments:(id)a3
{
  NSMutableArray *segments;

  segments = self->_segments;
  if (!segments)
  {
    segments = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    self->_segments = segments;
  }
  -[NSMutableArray addObject:](segments, "addObject:", a3);
}

- (unint64_t)segmentsCount
{
  return -[NSMutableArray count](self->_segments, "count");
}

- (id)segmentsAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_segments, "objectAtIndex:", a3);
}

+ (Class)segmentsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCCaptionsTranscriptionBlob;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCCaptionsTranscriptionBlob description](&v3, sel_description), -[VCCaptionsTranscriptionBlob dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSMutableArray *segments;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_utteranceNumber), CFSTR("utteranceNumber"));
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_updateNumber), CFSTR("updateNumber"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isLocal), CFSTR("isLocal"));
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isFinal), CFSTR("isFinal"));
  if (-[NSMutableArray count](self->_segments, "count"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMutableArray count](self->_segments, "count"));
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    segments = self->_segments;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](segments, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(segments);
          objc_msgSend(v5, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](segments, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
      }
      while (v8);
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("segments"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCCaptionsTranscriptionBlobReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  NSMutableArray *segments;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteBOOLField();
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  segments = self->_segments;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](segments, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(segments);
        PBDataWriterWriteSubmessage();
      }
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](segments, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  char has;
  unint64_t v6;
  unint64_t v7;
  uint64_t i;

  *((_DWORD *)a3 + 5) = self->_utteranceNumber;
  *((_DWORD *)a3 + 4) = self->_updateNumber;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_BYTE *)a3 + 25) = self->_isLocal;
    *((_BYTE *)a3 + 28) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_BYTE *)a3 + 24) = self->_isFinal;
    *((_BYTE *)a3 + 28) |= 1u;
  }
  if (-[VCCaptionsTranscriptionBlob segmentsCount](self, "segmentsCount"))
  {
    objc_msgSend(a3, "clearSegments");
    v6 = -[VCCaptionsTranscriptionBlob segmentsCount](self, "segmentsCount");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        objc_msgSend(a3, "addSegments:", -[VCCaptionsTranscriptionBlob segmentsAtIndex:](self, "segmentsAtIndex:", i));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  void *v6;
  char has;
  NSMutableArray *segments;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  *(_DWORD *)(v5 + 20) = self->_utteranceNumber;
  *(_DWORD *)(v5 + 16) = self->_updateNumber;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 25) = self->_isLocal;
    *(_BYTE *)(v5 + 28) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_BYTE *)(v5 + 24) = self->_isFinal;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  segments = self->_segments;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](segments, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(segments);
        v13 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "copyWithZone:", a3);
        objc_msgSend(v6, "addSegments:", v13);

      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](segments, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    }
    while (v10);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSMutableArray *segments;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if (self->_utteranceNumber != *((_DWORD *)a3 + 5) || self->_updateNumber != *((_DWORD *)a3 + 4))
      goto LABEL_16;
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 28) & 2) == 0)
        goto LABEL_16;
      if (self->_isLocal)
      {
        if (!*((_BYTE *)a3 + 25))
          goto LABEL_16;
      }
      else if (*((_BYTE *)a3 + 25))
      {
        goto LABEL_16;
      }
    }
    else if ((*((_BYTE *)a3 + 28) & 2) != 0)
    {
      goto LABEL_16;
    }
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 28) & 1) != 0)
      {
        if (self->_isFinal)
        {
          if (!*((_BYTE *)a3 + 24))
            goto LABEL_16;
          goto LABEL_22;
        }
        if (!*((_BYTE *)a3 + 24))
        {
LABEL_22:
          segments = self->_segments;
          if ((unint64_t)segments | *((_QWORD *)a3 + 1))
            LOBYTE(v5) = -[NSMutableArray isEqual:](segments, "isEqual:");
          else
            LOBYTE(v5) = 1;
          return v5;
        }
      }
    }
    else if ((*((_BYTE *)a3 + 28) & 1) == 0)
    {
      goto LABEL_22;
    }
LABEL_16:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (unint64_t)hash
{
  unsigned int utteranceNumber;
  unsigned int updateNumber;
  uint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = 2654435761 * self->_isLocal;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_5:
    v5 = 0;
    goto LABEL_6;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_5;
LABEL_3:
  v5 = 2654435761 * self->_isFinal;
LABEL_6:
  utteranceNumber = self->_utteranceNumber;
  updateNumber = self->_updateNumber;
  return (2654435761 * updateNumber) ^ (2654435761 * utteranceNumber) ^ v4 ^ v5 ^ -[NSMutableArray hash](self->_segments, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  _BYTE v10[128];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  self->_utteranceNumber = *((_DWORD *)a3 + 5);
  self->_updateNumber = *((_DWORD *)a3 + 4);
  v4 = *((_BYTE *)a3 + 28);
  if ((v4 & 2) != 0)
  {
    self->_isLocal = *((_BYTE *)a3 + 25);
    *(_BYTE *)&self->_has |= 2u;
    v4 = *((_BYTE *)a3 + 28);
  }
  if ((v4 & 1) != 0)
  {
    self->_isFinal = *((_BYTE *)a3 + 24);
    *(_BYTE *)&self->_has |= 1u;
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = (void *)*((_QWORD *)a3 + 1);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        -[VCCaptionsTranscriptionBlob addSegments:](self, "addSegments:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v10, 16);
    }
    while (v7);
  }
}

- (unsigned)utteranceNumber
{
  return self->_utteranceNumber;
}

- (void)setUtteranceNumber:(unsigned int)a3
{
  self->_utteranceNumber = a3;
}

- (unsigned)updateNumber
{
  return self->_updateNumber;
}

- (void)setUpdateNumber:(unsigned int)a3
{
  self->_updateNumber = a3;
}

- (BOOL)isLocal
{
  return self->_isLocal;
}

- (BOOL)isFinal
{
  return self->_isFinal;
}

- (NSMutableArray)segments
{
  return self->_segments;
}

- (void)setSegments:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (VCCaptionsTranscriptionBlob)initWithSFTranscription:(id)a3 final:(BOOL)a4 isLocal:(BOOL)a5 utteranceNumber:(unsigned int)a6 updateNumber:(unsigned int)a7
{
  VCCaptionsTranscriptionBlob *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  VCCaptionsSegmentBlob *v18;
  VCCaptionsSegmentBlob *v19;
  BOOL v21;
  objc_super v22;
  _BYTE v23[128];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22.receiver = self;
  v22.super_class = (Class)VCCaptionsTranscriptionBlob;
  v10 = -[VCCaptionsTranscriptionBlob init](&v22, sel_init, a3, a4, a5, *(_QWORD *)&a6, *(_QWORD *)&a7);
  if (v10)
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend((id)objc_msgSend(a3, "segments"), "count"));
    v10->_segments = (NSMutableArray *)v11;
    if (!v11)
    {
LABEL_12:

      return 0;
    }
    v21 = a5;
    v12 = objc_msgSend((id)objc_msgSend(a3, "segments"), "lastObject");
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = (void *)objc_msgSend(a3, "segments");
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v25;
LABEL_5:
      v17 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        v18 = -[VCCaptionsSegmentBlob initWithSFTranscriptionSegment:isLast:]([VCCaptionsSegmentBlob alloc], "initWithSFTranscriptionSegment:isLast:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v17), *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v17) == v12);
        if (!v18)
          goto LABEL_12;
        v19 = v18;
        -[NSMutableArray addObject:](v10->_segments, "addObject:", v18);

        if (v15 == ++v17)
        {
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
          if (v15)
            goto LABEL_5;
          break;
        }
      }
    }
    v10->_isFinal = a4;
    *(_BYTE *)&v10->_has |= 1u;
    v10->_isLocal = v21;
    *(_BYTE *)&v10->_has |= 2u;
  }
  return v10;
}

@end
