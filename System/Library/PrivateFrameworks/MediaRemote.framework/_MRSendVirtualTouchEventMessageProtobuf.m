@implementation _MRSendVirtualTouchEventMessageProtobuf

- (void)setVirtualDeviceID:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_virtualDeviceID = a3;
}

- (void)setHasVirtualDeviceID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVirtualDeviceID
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)_MRSendVirtualTouchEventMessageProtobuf;
  -[_MRSendVirtualTouchEventMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSendVirtualTouchEventMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  _MRVirtualTouchEventProtobuf *event;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_virtualDeviceID);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("virtualDeviceID"));

  }
  event = self->_event;
  if (event)
  {
    -[_MRVirtualTouchEventProtobuf dictionaryRepresentation](event, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("event"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSendVirtualTouchEventMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_event)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_virtualDeviceID;
    *((_BYTE *)v4 + 24) |= 1u;
  }
  if (self->_event)
  {
    v5 = v4;
    objc_msgSend(v4, "setEvent:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_virtualDeviceID;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  v7 = -[_MRVirtualTouchEventProtobuf copyWithZone:](self->_event, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _MRVirtualTouchEventProtobuf *event;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_virtualDeviceID != *((_QWORD *)v4 + 1))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  event = self->_event;
  if ((unint64_t)event | *((_QWORD *)v4 + 2))
    v6 = -[_MRVirtualTouchEventProtobuf isEqual:](event, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761u * self->_virtualDeviceID;
  else
    v2 = 0;
  return -[_MRVirtualTouchEventProtobuf hash](self->_event, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  _MRVirtualTouchEventProtobuf *event;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v5 = v4;
  if ((v4[3] & 1) != 0)
  {
    self->_virtualDeviceID = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  event = self->_event;
  v7 = v5[2];
  if (event)
  {
    if (v7)
    {
      v8 = v5;
      -[_MRVirtualTouchEventProtobuf mergeFrom:](event, "mergeFrom:");
LABEL_8:
      v5 = v8;
    }
  }
  else if (v7)
  {
    v8 = v5;
    -[_MRSendVirtualTouchEventMessageProtobuf setEvent:](self, "setEvent:");
    goto LABEL_8;
  }

}

- (unint64_t)virtualDeviceID
{
  return self->_virtualDeviceID;
}

- (_MRVirtualTouchEventProtobuf)event
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
