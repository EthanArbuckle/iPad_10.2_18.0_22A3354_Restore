@implementation FTCPPETParticipant

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)FTCPPETParticipant;
  -[FTCPPETParticipant description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FTCPPETParticipant dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_hashedId);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("hashedId"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isContact);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("isContact"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FTCPPETParticipantReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteUint64Field();
  PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  *((_QWORD *)a3 + 1) = self->_hashedId;
  *((_BYTE *)a3 + 16) = self->_isContact;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_QWORD *)result + 1) = self->_hashedId;
  *((_BYTE *)result + 16) = self->_isContact;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  BOOL v5;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) && self->_hashedId == *((_QWORD *)v4 + 1))
  {
    if (self->_isContact)
      v5 = v4[16] != 0;
    else
      v5 = v4[16] == 0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return (2654435761 * self->_isContact) ^ (2654435761u * self->_hashedId);
}

- (void)mergeFrom:(id)a3
{
  self->_hashedId = *((_QWORD *)a3 + 1);
  self->_isContact = *((_BYTE *)a3 + 16);
}

- (unint64_t)hashedId
{
  return self->_hashedId;
}

- (void)setHashedId:(unint64_t)a3
{
  self->_hashedId = a3;
}

- (BOOL)isContact
{
  return self->_isContact;
}

- (void)setIsContact:(BOOL)a3
{
  self->_isContact = a3;
}

@end
