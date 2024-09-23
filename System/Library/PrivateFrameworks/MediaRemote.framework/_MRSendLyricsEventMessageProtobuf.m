@implementation _MRSendLyricsEventMessageProtobuf

- (BOOL)hasEvent
{
  return self->_event != 0;
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
  v8.super_class = (Class)_MRSendLyricsEventMessageProtobuf;
  -[_MRSendLyricsEventMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSendLyricsEventMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _MRLyricsEventProtobuf *event;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  event = self->_event;
  if (event)
  {
    -[_MRLyricsEventProtobuf dictionaryRepresentation](event, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("event"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSendLyricsEventMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_event)
    PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
  _MRLyricsEventProtobuf *event;

  event = self->_event;
  if (event)
    objc_msgSend(a3, "setEvent:", event);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_MRLyricsEventProtobuf copyWithZone:](self->_event, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  _MRLyricsEventProtobuf *event;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    event = self->_event;
    if ((unint64_t)event | v4[1])
      v6 = -[_MRLyricsEventProtobuf isEqual:](event, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[_MRLyricsEventProtobuf hash](self->_event, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _MRLyricsEventProtobuf *event;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  event = self->_event;
  v6 = v4[1];
  if (event)
  {
    if (v6)
    {
      v7 = v4;
      -[_MRLyricsEventProtobuf mergeFrom:](event, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[_MRSendLyricsEventMessageProtobuf setEvent:](self, "setEvent:");
    goto LABEL_6;
  }

}

- (_MRLyricsEventProtobuf)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
}

@end
