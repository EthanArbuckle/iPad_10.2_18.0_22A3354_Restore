@implementation _MRGroupSessionIdentityShareReplyMessageProtobuf

- (BOOL)hasLocalParticipant
{
  return self->_localParticipant != 0;
}

- (BOOL)hasLeaderParticipant
{
  return self->_leaderParticipant != 0;
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
  v8.super_class = (Class)_MRGroupSessionIdentityShareReplyMessageProtobuf;
  -[_MRGroupSessionIdentityShareReplyMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRGroupSessionIdentityShareReplyMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _MRGroupSessionParticipantProtobuf *localParticipant;
  void *v5;
  _MRGroupSessionParticipantProtobuf *leaderParticipant;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  localParticipant = self->_localParticipant;
  if (localParticipant)
  {
    -[_MRGroupSessionParticipantProtobuf dictionaryRepresentation](localParticipant, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("localParticipant"));

  }
  leaderParticipant = self->_leaderParticipant;
  if (leaderParticipant)
  {
    -[_MRGroupSessionParticipantProtobuf dictionaryRepresentation](leaderParticipant, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("leaderParticipant"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGroupSessionIdentityShareReplyMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_localParticipant)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_leaderParticipant)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_localParticipant)
  {
    objc_msgSend(v4, "setLocalParticipant:");
    v4 = v5;
  }
  if (self->_leaderParticipant)
  {
    objc_msgSend(v5, "setLeaderParticipant:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_MRGroupSessionParticipantProtobuf copyWithZone:](self->_localParticipant, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[_MRGroupSessionParticipantProtobuf copyWithZone:](self->_leaderParticipant, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  _MRGroupSessionParticipantProtobuf *localParticipant;
  _MRGroupSessionParticipantProtobuf *leaderParticipant;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((localParticipant = self->_localParticipant, !((unint64_t)localParticipant | v4[2]))
     || -[_MRGroupSessionParticipantProtobuf isEqual:](localParticipant, "isEqual:")))
  {
    leaderParticipant = self->_leaderParticipant;
    if ((unint64_t)leaderParticipant | v4[1])
      v7 = -[_MRGroupSessionParticipantProtobuf isEqual:](leaderParticipant, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[_MRGroupSessionParticipantProtobuf hash](self->_localParticipant, "hash");
  return -[_MRGroupSessionParticipantProtobuf hash](self->_leaderParticipant, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _MRGroupSessionParticipantProtobuf *localParticipant;
  uint64_t v6;
  _MRGroupSessionParticipantProtobuf *leaderParticipant;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  localParticipant = self->_localParticipant;
  v6 = v4[2];
  v9 = v4;
  if (localParticipant)
  {
    if (!v6)
      goto LABEL_7;
    -[_MRGroupSessionParticipantProtobuf mergeFrom:](localParticipant, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[_MRGroupSessionIdentityShareReplyMessageProtobuf setLocalParticipant:](self, "setLocalParticipant:");
  }
  v4 = v9;
LABEL_7:
  leaderParticipant = self->_leaderParticipant;
  v8 = v4[1];
  if (leaderParticipant)
  {
    if (v8)
    {
      -[_MRGroupSessionParticipantProtobuf mergeFrom:](leaderParticipant, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[_MRGroupSessionIdentityShareReplyMessageProtobuf setLeaderParticipant:](self, "setLeaderParticipant:");
    goto LABEL_12;
  }

}

- (_MRGroupSessionParticipantProtobuf)localParticipant
{
  return self->_localParticipant;
}

- (void)setLocalParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_localParticipant, a3);
}

- (_MRGroupSessionParticipantProtobuf)leaderParticipant
{
  return self->_leaderParticipant;
}

- (void)setLeaderParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_leaderParticipant, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localParticipant, 0);
  objc_storeStrong((id *)&self->_leaderParticipant, 0);
}

@end
