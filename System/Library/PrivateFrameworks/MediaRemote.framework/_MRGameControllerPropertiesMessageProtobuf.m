@implementation _MRGameControllerPropertiesMessageProtobuf

- (void)setControllerID:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_controllerID = a3;
}

- (void)setHasControllerID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasControllerID
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasProperties
{
  return self->_properties != 0;
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
  v8.super_class = (Class)_MRGameControllerPropertiesMessageProtobuf;
  -[_MRGameControllerPropertiesMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRGameControllerPropertiesMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  _MRGameControllerPropertiesProtobuf *properties;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_controllerID);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("controllerID"));

  }
  properties = self->_properties;
  if (properties)
  {
    -[_MRGameControllerPropertiesProtobuf dictionaryRepresentation](properties, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("properties"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGameControllerPropertiesMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_properties)
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
    v4[1] = self->_controllerID;
    *((_BYTE *)v4 + 24) |= 1u;
  }
  if (self->_properties)
  {
    v5 = v4;
    objc_msgSend(v4, "setProperties:");
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
    *(_QWORD *)(v5 + 8) = self->_controllerID;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  v7 = -[_MRGameControllerPropertiesProtobuf copyWithZone:](self->_properties, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _MRGameControllerPropertiesProtobuf *properties;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_controllerID != *((_QWORD *)v4 + 1))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  properties = self->_properties;
  if ((unint64_t)properties | *((_QWORD *)v4 + 2))
    v6 = -[_MRGameControllerPropertiesProtobuf isEqual:](properties, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761u * self->_controllerID;
  else
    v2 = 0;
  return -[_MRGameControllerPropertiesProtobuf hash](self->_properties, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  _MRGameControllerPropertiesProtobuf *properties;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v5 = v4;
  if ((v4[3] & 1) != 0)
  {
    self->_controllerID = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  properties = self->_properties;
  v7 = v5[2];
  if (properties)
  {
    if (v7)
    {
      v8 = v5;
      -[_MRGameControllerPropertiesProtobuf mergeFrom:](properties, "mergeFrom:");
LABEL_8:
      v5 = v8;
    }
  }
  else if (v7)
  {
    v8 = v5;
    -[_MRGameControllerPropertiesMessageProtobuf setProperties:](self, "setProperties:");
    goto LABEL_8;
  }

}

- (unint64_t)controllerID
{
  return self->_controllerID;
}

- (_MRGameControllerPropertiesProtobuf)properties
{
  return self->_properties;
}

- (void)setProperties:(id)a3
{
  objc_storeStrong((id *)&self->_properties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_properties, 0);
}

@end
