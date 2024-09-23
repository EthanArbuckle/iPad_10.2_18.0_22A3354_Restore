@implementation SWCollaborationClearNoticeTransmissionMessage

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SWCollaborationClearNoticeTransmissionMessage;
  -[SWCollaborationClearNoticeTransmissionMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationClearNoticeTransmissionMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *guidString;
  NSString *collaborationId;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  guidString = self->_guidString;
  if (guidString)
    objc_msgSend(v3, "setObject:forKey:", guidString, CFSTR("guidString"));
  collaborationId = self->_collaborationId;
  if (collaborationId)
    objc_msgSend(v3, "setObject:forKey:", collaborationId, CFSTR("collaborationId"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dateAsTimeIntervalSince1970);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("dateAsTimeIntervalSince1970"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SWCollaborationClearNoticeTransmissionMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint32Field();
  if (!self->_guidString)
    -[SWCollaborationClearNoticeTransmissionMessage writeTo:].cold.1();
  PBDataWriterWriteStringField();
  if (!self->_collaborationId)
    -[SWCollaborationClearNoticeTransmissionMessage writeTo:].cold.2();
  PBDataWriterWriteStringField();
  PBDataWriterWriteDoubleField();

}

- (void)copyTo:(id)a3
{
  NSString *guidString;
  double *v5;

  *((_DWORD *)a3 + 8) = self->_version;
  guidString = self->_guidString;
  v5 = (double *)a3;
  objc_msgSend(v5, "setGuidString:", guidString);
  objc_msgSend(v5, "setCollaborationId:", self->_collaborationId);
  v5[1] = self->_dateAsTimeIntervalSince1970;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 32) = self->_version;
  v6 = -[NSString copyWithZone:](self->_guidString, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSString copyWithZone:](self->_collaborationId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v8;

  *(double *)(v5 + 8) = self->_dateAsTimeIntervalSince1970;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *guidString;
  NSString *collaborationId;
  BOOL v7;

  v4 = a3;
  v7 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_version == *((_DWORD *)v4 + 8)
    && ((guidString = self->_guidString, !((unint64_t)guidString | *((_QWORD *)v4 + 3)))
     || -[NSString isEqual:](guidString, "isEqual:"))
    && ((collaborationId = self->_collaborationId, !((unint64_t)collaborationId | *((_QWORD *)v4 + 2)))
     || -[NSString isEqual:](collaborationId, "isEqual:"))
    && self->_dateAsTimeIntervalSince1970 == *((double *)v4 + 1);

  return v7;
}

- (unint64_t)hash
{
  unsigned int version;
  NSUInteger v4;
  NSUInteger v5;
  double dateAsTimeIntervalSince1970;
  double v7;
  long double v8;
  double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  version = self->_version;
  v4 = -[NSString hash](self->_guidString, "hash");
  v5 = -[NSString hash](self->_collaborationId, "hash");
  dateAsTimeIntervalSince1970 = self->_dateAsTimeIntervalSince1970;
  v7 = -dateAsTimeIntervalSince1970;
  if (dateAsTimeIntervalSince1970 >= 0.0)
    v7 = self->_dateAsTimeIntervalSince1970;
  v8 = floor(v7 + 0.5);
  v9 = (v7 - v8) * 1.84467441e19;
  v10 = fmod(v8, 1.84467441e19);
  v11 = 2654435761u * (unint64_t)v10;
  v12 = v11 + (unint64_t)v9;
  if (v9 <= 0.0)
    v12 = 2654435761u * (unint64_t)v10;
  v13 = v11 - (unint64_t)fabs(v9);
  if (v9 >= 0.0)
    v13 = v12;
  return v4 ^ v5 ^ (2654435761 * version) ^ v13;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  self->_version = *((_DWORD *)v4 + 8);
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[SWCollaborationClearNoticeTransmissionMessage setGuidString:](self, "setGuidString:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[SWCollaborationClearNoticeTransmissionMessage setCollaborationId:](self, "setCollaborationId:");
    v4 = v5;
  }
  self->_dateAsTimeIntervalSince1970 = *((double *)v4 + 1);

}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (NSString)guidString
{
  return self->_guidString;
}

- (void)setGuidString:(id)a3
{
  objc_storeStrong((id *)&self->_guidString, a3);
}

- (NSString)collaborationId
{
  return self->_collaborationId;
}

- (void)setCollaborationId:(id)a3
{
  objc_storeStrong((id *)&self->_collaborationId, a3);
}

- (double)dateAsTimeIntervalSince1970
{
  return self->_dateAsTimeIntervalSince1970;
}

- (void)setDateAsTimeIntervalSince1970:(double)a3
{
  self->_dateAsTimeIntervalSince1970 = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidString, 0);
  objc_storeStrong((id *)&self->_collaborationId, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SWCollaborationClearNoticeTransmissionMessage writeTo:]", "SWCollaborationClearNoticeTransmissionMessage.m", 101, "nil != self->_guidString");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SWCollaborationClearNoticeTransmissionMessage writeTo:]", "SWCollaborationClearNoticeTransmissionMessage.m", 106, "nil != self->_collaborationId");
}

@end
