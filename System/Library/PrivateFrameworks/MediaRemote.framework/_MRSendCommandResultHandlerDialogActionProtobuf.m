@implementation _MRSendCommandResultHandlerDialogActionProtobuf

- (id)typeAsString:(int)a3
{
  if (a3 < 3)
    return off_1E30C99A0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Default")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Cancel")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("Destructive")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

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
  v8.super_class = (Class)_MRSendCommandResultHandlerDialogActionProtobuf;
  -[_MRSendCommandResultHandlerDialogActionProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSendCommandResultHandlerDialogActionProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t type;
  __CFString *v5;
  NSString *title;
  _MRSendCommandMessageProtobuf *event;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  type = self->_type;
  if (type >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_1E30C99A0[type];
  }
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

  title = self->_title;
  if (title)
    objc_msgSend(v3, "setObject:forKey:", title, CFSTR("title"));
  event = self->_event;
  if (event)
  {
    -[_MRSendCommandMessageProtobuf dictionaryRepresentation](event, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("event"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSendCommandResultHandlerDialogActionProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  PBDataWriterWriteInt32Field();
  if (!self->_title)
    -[_MRSendCommandResultHandlerDialogActionProtobuf writeTo:].cold.1();
  PBDataWriterWriteStringField();
  if (self->_event)
    PBDataWriterWriteSubmessage();

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  id v5;

  v4 = a3;
  v4[6] = self->_type;
  v5 = v4;
  objc_msgSend(v4, "setTitle:", self->_title);
  if (self->_event)
    objc_msgSend(v5, "setEvent:");

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 24) = self->_type;
  v6 = -[NSString copyWithZone:](self->_title, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[_MRSendCommandMessageProtobuf copyWithZone:](self->_event, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v8;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *title;
  _MRSendCommandMessageProtobuf *event;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_type == *((_DWORD *)v4 + 6)
    && ((title = self->_title, !((unint64_t)title | v4[2]))
     || -[NSString isEqual:](title, "isEqual:")))
  {
    event = self->_event;
    if ((unint64_t)event | v4[1])
      v7 = -[_MRSendCommandMessageProtobuf isEqual:](event, "isEqual:");
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
  uint64_t v3;
  NSUInteger v4;

  v3 = 2654435761 * self->_type;
  v4 = -[NSString hash](self->_title, "hash");
  return v4 ^ -[_MRSendCommandMessageProtobuf hash](self->_event, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _MRSendCommandMessageProtobuf *event;
  uint64_t v6;
  _DWORD *v7;

  v4 = a3;
  self->_type = v4[6];
  v7 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[_MRSendCommandResultHandlerDialogActionProtobuf setTitle:](self, "setTitle:");
    v4 = v7;
  }
  event = self->_event;
  v6 = *((_QWORD *)v4 + 1);
  if (event)
  {
    if (v6)
    {
      -[_MRSendCommandMessageProtobuf mergeFrom:](event, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[_MRSendCommandResultHandlerDialogActionProtobuf setEvent:](self, "setEvent:");
    goto LABEL_8;
  }

}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (_MRSendCommandMessageProtobuf)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[_MRSendCommandResultHandlerDialogActionProtobuf writeTo:]", "_MRSendCommandResultHandlerDialogActionProtobuf.m", 120, "nil != self->_title");
}

@end
