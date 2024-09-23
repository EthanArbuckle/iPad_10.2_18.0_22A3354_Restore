@implementation _MRGroupSessionJoinResponseMessageProtobuf

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_MRGroupSessionJoinResponseMessageProtobuf;
  -[_MRGroupSessionJoinResponseMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRGroupSessionJoinResponseMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *participantIdentifier;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  participantIdentifier = self->_participantIdentifier;
  if (participantIdentifier)
    objc_msgSend(v3, "setObject:forKey:", participantIdentifier, CFSTR("participantIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_approved);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("approved"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGroupSessionJoinResponseMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_participantIdentifier)
    -[_MRGroupSessionJoinResponseMessageProtobuf writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteBOOLField();

}

- (void)copyTo:(id)a3
{
  NSString *participantIdentifier;
  _BYTE *v5;

  participantIdentifier = self->_participantIdentifier;
  v5 = a3;
  objc_msgSend(v5, "setParticipantIdentifier:", participantIdentifier);
  v5[16] = self->_approved;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_participantIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  *(_BYTE *)(v5 + 16) = self->_approved;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _BYTE *v4;
  NSString *participantIdentifier;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((participantIdentifier = self->_participantIdentifier,
         !((unint64_t)participantIdentifier | *((_QWORD *)v4 + 1)))
     || -[NSString isEqual:](participantIdentifier, "isEqual:")))
  {
    if (self->_approved)
      v6 = v4[16] != 0;
    else
      v6 = v4[16] == 0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return (2654435761 * self->_approved) ^ -[NSString hash](self->_participantIdentifier, "hash");
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL *v5;

  v4 = (BOOL *)a3;
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[_MRGroupSessionJoinResponseMessageProtobuf setParticipantIdentifier:](self, "setParticipantIdentifier:");
    v4 = v5;
  }
  self->_approved = v4[16];

}

- (NSString)participantIdentifier
{
  return self->_participantIdentifier;
}

- (void)setParticipantIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_participantIdentifier, a3);
}

- (BOOL)approved
{
  return self->_approved;
}

- (void)setApproved:(BOOL)a3
{
  self->_approved = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantIdentifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[_MRGroupSessionJoinResponseMessageProtobuf writeTo:]", "_MRGroupSessionJoinResponseMessageProtobuf.m", 79, "nil != self->_participantIdentifier");
}

@end
