@implementation VCCCMessageWrapper

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[VCCCMessageWrapper setMessage:](self, "setMessage:", 0);
  -[VCCCMessageWrapper setAcknowledgement:](self, "setAcknowledgement:", 0);
  v3.receiver = self;
  v3.super_class = (Class)VCCCMessageWrapper;
  -[VCCCMessageWrapper dealloc](&v3, sel_dealloc);
}

- (BOOL)hasMessage
{
  return self->_message != 0;
}

- (void)setMessage:(id)a3
{
  id v5;

  -[VCCCMessageWrapper clearOneofValuesForContent](self, "clearOneofValuesForContent");
  *(_BYTE *)&self->_has |= 1u;
  self->_content = 1;
  v5 = a3;

  self->_message = (VCCCMessage *)a3;
}

- (BOOL)hasAcknowledgement
{
  return self->_acknowledgement != 0;
}

- (void)setAcknowledgement:(id)a3
{
  id v5;

  -[VCCCMessageWrapper clearOneofValuesForContent](self, "clearOneofValuesForContent");
  *(_BYTE *)&self->_has |= 1u;
  self->_content = 2;
  v5 = a3;

  self->_acknowledgement = (VCCCMessageAcknowledgment *)a3;
}

- (int)content
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_content;
  else
    return 0;
}

- (void)setContent:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_content = a3;
}

- (void)setHasContent:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContent
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)contentAsString:(int)a3
{
  if (a3 >= 3)
    return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  else
    return off_1E9E57A38[a3];
}

- (int)StringAsContent:(id)a3
{
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("PBUNSET")) & 1) != 0)
    return 0;
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("message")) & 1) != 0)
    return 1;
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("acknowledgement")))
    return 2;
  return 0;
}

- (void)clearOneofValuesForContent
{
  *(_BYTE *)&self->_has &= ~1u;
  self->_content = 0;

  self->_message = 0;
  self->_acknowledgement = 0;
}

- (id)description
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3.receiver = self;
  v3.super_class = (Class)VCCCMessageWrapper;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), -[VCCCMessageWrapper description](&v3, sel_description), -[VCCCMessageWrapper dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  VCCCMessage *message;
  VCCCMessageAcknowledgment *acknowledgement;
  uint64_t content;
  __CFString *v7;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  message = self->_message;
  if (message)
    objc_msgSend(v3, "setObject:forKey:", -[VCCCMessage dictionaryRepresentation](message, "dictionaryRepresentation"), CFSTR("message"));
  acknowledgement = self->_acknowledgement;
  if (acknowledgement)
    objc_msgSend(v3, "setObject:forKey:", -[VCCCMessageAcknowledgment dictionaryRepresentation](acknowledgement, "dictionaryRepresentation"), CFSTR("acknowledgement"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    content = self->_content;
    if (content >= 3)
      v7 = (__CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_content);
    else
      v7 = off_1E9E57A38[content];
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("content"));
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VCCCMessageWrapperReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_message)
    PBDataWriterWriteSubmessage();
  if (self->_acknowledgement)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_content;
    *((_BYTE *)a3 + 32) |= 1u;
  }
  if (self->_message)
    objc_msgSend(a3, "setMessage:");
  if (self->_acknowledgement)
    objc_msgSend(a3, "setAcknowledgement:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_content;
    *(_BYTE *)(v5 + 32) |= 1u;
  }

  *(_QWORD *)(v6 + 24) = -[VCCCMessage copyWithZone:](self->_message, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 8) = -[VCCCMessageAcknowledgment copyWithZone:](self->_acknowledgement, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  VCCCMessage *message;
  VCCCMessageAcknowledgment *acknowledgement;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 32) & 1) == 0 || self->_content != *((_DWORD *)a3 + 4))
        goto LABEL_11;
    }
    else if ((*((_BYTE *)a3 + 32) & 1) != 0)
    {
LABEL_11:
      LOBYTE(v5) = 0;
      return v5;
    }
    message = self->_message;
    if (!((unint64_t)message | *((_QWORD *)a3 + 3)) || (v5 = -[VCCCMessage isEqual:](message, "isEqual:")) != 0)
    {
      acknowledgement = self->_acknowledgement;
      if ((unint64_t)acknowledgement | *((_QWORD *)a3 + 1))
        LOBYTE(v5) = -[VCCCMessageAcknowledgment isEqual:](acknowledgement, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_content;
  else
    v3 = 0;
  v4 = -[VCCCMessage hash](self->_message, "hash") ^ v3;
  return v4 ^ -[VCCCMessageAcknowledgment hash](self->_acknowledgement, "hash");
}

- (void)mergeFrom:(id)a3
{
  VCCCMessage *message;
  uint64_t v6;
  VCCCMessageAcknowledgment *acknowledgement;
  uint64_t v8;

  if ((*((_BYTE *)a3 + 32) & 1) != 0)
  {
    self->_content = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  message = self->_message;
  v6 = *((_QWORD *)a3 + 3);
  if (message)
  {
    if (v6)
      -[VCCCMessage mergeFrom:](message, "mergeFrom:");
  }
  else if (v6)
  {
    -[VCCCMessageWrapper setMessage:](self, "setMessage:");
  }
  acknowledgement = self->_acknowledgement;
  v8 = *((_QWORD *)a3 + 1);
  if (acknowledgement)
  {
    if (v8)
      -[VCCCMessageAcknowledgment mergeFrom:](acknowledgement, "mergeFrom:");
  }
  else if (v8)
  {
    -[VCCCMessageWrapper setAcknowledgement:](self, "setAcknowledgement:");
  }
}

- (VCCCMessage)message
{
  return self->_message;
}

- (VCCCMessageAcknowledgment)acknowledgement
{
  return self->_acknowledgement;
}

@end
