@implementation _MRSetConversationDetectionEnabledMessageProtobuf

- (void)setEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_enabled = a3;
}

- (void)setHasEnabled:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasEnabled
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasOutputDeviceUID
{
  return self->_outputDeviceUID != 0;
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
  v8.super_class = (Class)_MRSetConversationDetectionEnabledMessageProtobuf;
  -[_MRSetConversationDetectionEnabledMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRSetConversationDetectionEnabledMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *outputDeviceUID;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enabled);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("enabled"));

  }
  outputDeviceUID = self->_outputDeviceUID;
  if (outputDeviceUID)
    objc_msgSend(v3, "setObject:forKey:", outputDeviceUID, CFSTR("outputDeviceUID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSetConversationDetectionEnabledMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_outputDeviceUID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[16] = self->_enabled;
    v4[20] |= 1u;
  }
  if (self->_outputDeviceUID)
  {
    v5 = v4;
    objc_msgSend(v4, "setOutputDeviceUID:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 16) = self->_enabled;
    *(_BYTE *)(v5 + 20) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_outputDeviceUID, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  NSString *outputDeviceUID;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) != 0)
    {
      if (self->_enabled)
      {
        if (*((_BYTE *)v4 + 16))
          goto LABEL_12;
      }
      else if (!*((_BYTE *)v4 + 16))
      {
        goto LABEL_12;
      }
    }
LABEL_6:
    v5 = 0;
    goto LABEL_7;
  }
  if ((*((_BYTE *)v4 + 20) & 1) != 0)
    goto LABEL_6;
LABEL_12:
  outputDeviceUID = self->_outputDeviceUID;
  if ((unint64_t)outputDeviceUID | *((_QWORD *)v4 + 1))
    v5 = -[NSString isEqual:](outputDeviceUID, "isEqual:");
  else
    v5 = 1;
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_enabled;
  else
    v2 = 0;
  return -[NSString hash](self->_outputDeviceUID, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  if ((v4[20] & 1) != 0)
  {
    self->_enabled = v4[16];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[_MRSetConversationDetectionEnabledMessageProtobuf setOutputDeviceUID:](self, "setOutputDeviceUID:");
    v4 = v5;
  }

}

- (BOOL)enabled
{
  return self->_enabled;
}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (void)setOutputDeviceUID:(id)a3
{
  objc_storeStrong((id *)&self->_outputDeviceUID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceUID, 0);
}

@end
