@implementation SWCollaborationNoticeTransmissionMessage

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SWCollaborationNoticeTransmissionMessage;
  -[SWCollaborationNoticeTransmissionMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SWCollaborationNoticeTransmissionMessage dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSData *highlightChangeEvent;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_version);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  guidString = self->_guidString;
  if (guidString)
    objc_msgSend(v3, "setObject:forKey:", guidString, CFSTR("guidString"));
  highlightChangeEvent = self->_highlightChangeEvent;
  if (highlightChangeEvent)
    objc_msgSend(v3, "setObject:forKey:", highlightChangeEvent, CFSTR("highlightChangeEvent"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_highlightChangeEventType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("highlightChangeEventType"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dateAsTimeIntervalSince1970);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("dateAsTimeIntervalSince1970"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SWCollaborationNoticeTransmissionMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteUint32Field();
  if (!self->_guidString)
    -[SWCollaborationNoticeTransmissionMessage writeTo:].cold.1();
  PBDataWriterWriteStringField();
  if (!self->_highlightChangeEvent)
    -[SWCollaborationNoticeTransmissionMessage writeTo:].cold.2();
  PBDataWriterWriteDataField();
  PBDataWriterWriteInt64Field();
  PBDataWriterWriteDoubleField();

}

- (void)copyTo:(id)a3
{
  NSString *guidString;
  id v5;

  *((_DWORD *)a3 + 10) = self->_version;
  guidString = self->_guidString;
  v5 = a3;
  objc_msgSend(v5, "setGuidString:", guidString);
  objc_msgSend(v5, "setHighlightChangeEvent:", self->_highlightChangeEvent);
  *((_QWORD *)v5 + 2) = self->_highlightChangeEventType;
  *((_QWORD *)v5 + 1) = *(_QWORD *)&self->_dateAsTimeIntervalSince1970;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 40) = self->_version;
  v6 = -[NSString copyWithZone:](self->_guidString, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  v8 = -[NSData copyWithZone:](self->_highlightChangeEvent, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v8;

  *(_QWORD *)(v5 + 16) = self->_highlightChangeEventType;
  *(double *)(v5 + 8) = self->_dateAsTimeIntervalSince1970;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *guidString;
  NSData *highlightChangeEvent;
  BOOL v7;

  v4 = a3;
  v7 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_version == *((_DWORD *)v4 + 10)
    && ((guidString = self->_guidString, !((unint64_t)guidString | *((_QWORD *)v4 + 3)))
     || -[NSString isEqual:](guidString, "isEqual:"))
    && ((highlightChangeEvent = self->_highlightChangeEvent,
         !((unint64_t)highlightChangeEvent | *((_QWORD *)v4 + 4)))
     || -[NSData isEqual:](highlightChangeEvent, "isEqual:"))
    && self->_highlightChangeEventType == *((_QWORD *)v4 + 2)
    && self->_dateAsTimeIntervalSince1970 == *((double *)v4 + 1);

  return v7;
}

- (unint64_t)hash
{
  unsigned int version;
  NSUInteger v4;
  uint64_t v5;
  int64_t highlightChangeEventType;
  double dateAsTimeIntervalSince1970;
  double v8;
  long double v9;
  double v10;
  double v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  version = self->_version;
  v4 = -[NSString hash](self->_guidString, "hash");
  v5 = -[NSData hash](self->_highlightChangeEvent, "hash");
  highlightChangeEventType = self->_highlightChangeEventType;
  dateAsTimeIntervalSince1970 = self->_dateAsTimeIntervalSince1970;
  v8 = -dateAsTimeIntervalSince1970;
  if (dateAsTimeIntervalSince1970 >= 0.0)
    v8 = self->_dateAsTimeIntervalSince1970;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = fmod(v9, 1.84467441e19);
  v12 = 2654435761u * (unint64_t)v11;
  v13 = v12 + (unint64_t)v10;
  if (v10 <= 0.0)
    v13 = 2654435761u * (unint64_t)v11;
  v14 = v12 - (unint64_t)fabs(v10);
  if (v10 >= 0.0)
    v14 = v13;
  return v4 ^ v5 ^ (2654435761 * version) ^ (2654435761 * highlightChangeEventType) ^ v14;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  self->_version = *((_DWORD *)v4 + 10);
  v5 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[SWCollaborationNoticeTransmissionMessage setGuidString:](self, "setGuidString:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[SWCollaborationNoticeTransmissionMessage setHighlightChangeEvent:](self, "setHighlightChangeEvent:");
    v4 = v5;
  }
  self->_highlightChangeEventType = *((_QWORD *)v4 + 2);
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

- (NSData)highlightChangeEvent
{
  return self->_highlightChangeEvent;
}

- (void)setHighlightChangeEvent:(id)a3
{
  objc_storeStrong((id *)&self->_highlightChangeEvent, a3);
}

- (int64_t)highlightChangeEventType
{
  return self->_highlightChangeEventType;
}

- (void)setHighlightChangeEventType:(int64_t)a3
{
  self->_highlightChangeEventType = a3;
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
  objc_storeStrong((id *)&self->_highlightChangeEvent, 0);
  objc_storeStrong((id *)&self->_guidString, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[SWCollaborationNoticeTransmissionMessage writeTo:]", "SWCollaborationNoticeTransmissionMessage.m", 108, "nil != self->_guidString");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[SWCollaborationNoticeTransmissionMessage writeTo:]", "SWCollaborationNoticeTransmissionMessage.m", 113, "nil != self->_highlightChangeEvent");
}

@end
