@implementation VCCaptionsSegmentBlob

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCCaptionsSegmentBlob setText:](self, "setText:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VCCaptionsSegmentBlob;
  -[VCCaptionsSegmentBlob dealloc](&v3, sel_dealloc);
}

- (void)setConfidence:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidence
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSpaceAfter:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_hasSpaceAfter = a3;
}

- (void)setHasHasSpaceAfter:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHasSpaceAfter
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasText
{
  return self->_text != 0;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCCaptionsSegmentBlob;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCCaptionsSegmentBlob description](&v3, sel_description), -[VCCaptionsSegmentBlob dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSString *text;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_confidence), CFSTR("confidence"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasSpaceAfter), CFSTR("hasSpaceAfter"));
  text = self->_text;
  if (text)
    objc_msgSend(v3, "setObject:forKey:", text, CFSTR("text"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCCaptionsSegmentBlobReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_text)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  char has;
  NSString *text;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = self->_confidence;
    *((_BYTE *)a3 + 28) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_BYTE *)a3 + 24) = self->_hasSpaceAfter;
    *((_BYTE *)a3 + 28) |= 2u;
  }
  text = self->_text;
  if (text)
    objc_msgSend(a3, "setText:", text);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_confidence;
    *(_BYTE *)(v5 + 28) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 24) = self->_hasSpaceAfter;
    *(_BYTE *)(v5 + 28) |= 2u;
  }

  v6[2] = -[NSString copyWithZone:](self->_text, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *text;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 28) & 1) == 0 || self->_confidence != *((_DWORD *)a3 + 2))
        goto LABEL_11;
    }
    else if ((*((_BYTE *)a3 + 28) & 1) != 0)
    {
      goto LABEL_11;
    }
    if ((*(_BYTE *)&self->_has & 2) != 0)
    {
      if ((*((_BYTE *)a3 + 28) & 2) != 0)
      {
        if (self->_hasSpaceAfter)
        {
          if (!*((_BYTE *)a3 + 24))
            goto LABEL_11;
          goto LABEL_17;
        }
        if (!*((_BYTE *)a3 + 24))
        {
LABEL_17:
          text = self->_text;
          if ((unint64_t)text | *((_QWORD *)a3 + 2))
            LOBYTE(v5) = -[NSString isEqual:](text, "isEqual:");
          else
            LOBYTE(v5) = 1;
          return v5;
        }
      }
    }
    else if ((*((_BYTE *)a3 + 28) & 2) == 0)
    {
      goto LABEL_17;
    }
LABEL_11:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;
  uint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_confidence;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2 ^ -[NSString hash](self->_text, "hash");
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761 * self->_hasSpaceAfter;
  return v3 ^ v2 ^ -[NSString hash](self->_text, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v3;

  v3 = *((_BYTE *)a3 + 28);
  if ((v3 & 1) != 0)
  {
    self->_confidence = *((_DWORD *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
    v3 = *((_BYTE *)a3 + 28);
  }
  if ((v3 & 2) != 0)
  {
    self->_hasSpaceAfter = *((_BYTE *)a3 + 24);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)a3 + 2))
    -[VCCaptionsSegmentBlob setText:](self, "setText:");
}

- (unsigned)confidence
{
  return self->_confidence;
}

- (BOOL)hasSpaceAfter
{
  return self->_hasSpaceAfter;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (VCCaptionsSegmentBlob)initWithSFTranscriptionSegment:(id)a3 isLast:(BOOL)a4
{
  VCCaptionsSegmentBlob *v6;
  float v7;
  objc_super v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)VCCaptionsSegmentBlob;
  v6 = -[VCCaptionsSegmentBlob init](&v9, sel_init);
  if (v6)
  {
    v6->_text = (NSString *)objc_msgSend((id)objc_msgSend(a3, "substring"), "copy");
    objc_msgSend(a3, "confidence");
    v6->_confidence = (float)(v7 * 100.0);
    *(_BYTE *)&v6->_has |= 1u;
    v6->_hasSpaceAfter = !a4;
    *(_BYTE *)&v6->_has |= 2u;
  }
  return v6;
}

@end
