@implementation _MRAdjustVolumeMessageProtobuf

- (int)adjustment
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_adjustment;
  else
    return 1;
}

- (void)setAdjustment:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_adjustment = a3;
}

- (void)setHasAdjustment:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAdjustment
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)adjustmentAsString:(int)a3
{
  if ((a3 - 1) < 6)
    return off_1E30CA910[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsAdjustment:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IncrementSmall")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IncrementMedium")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IncrementLarge")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DecrementSmall")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DecrementMedium")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DecrementLarge")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasOutputDeviceUID
{
  return self->_outputDeviceUID != 0;
}

- (BOOL)hasDetails
{
  return self->_details != 0;
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
  v8.super_class = (Class)_MRAdjustVolumeMessageProtobuf;
  -[_MRAdjustVolumeMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAdjustVolumeMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  __CFString *v5;
  NSString *outputDeviceUID;
  _MRRequestDetailsProtobuf *details;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = self->_adjustment - 1;
    if (v4 >= 6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_adjustment);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = off_1E30CA910[v4];
    }
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("adjustment"));

  }
  outputDeviceUID = self->_outputDeviceUID;
  if (outputDeviceUID)
    objc_msgSend(v3, "setObject:forKey:", outputDeviceUID, CFSTR("outputDeviceUID"));
  details = self->_details;
  if (details)
  {
    -[_MRRequestDetailsProtobuf dictionaryRepresentation](details, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("details"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRAdjustVolumeMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_outputDeviceUID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_details)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[2] = self->_adjustment;
    *((_BYTE *)v4 + 32) |= 1u;
  }
  v5 = v4;
  if (self->_outputDeviceUID)
  {
    objc_msgSend(v4, "setOutputDeviceUID:");
    v4 = v5;
  }
  if (self->_details)
  {
    objc_msgSend(v5, "setDetails:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_adjustment;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_outputDeviceUID, "copyWithZone:", a3);
  v8 = (void *)v6[3];
  v6[3] = v7;

  v9 = -[_MRRequestDetailsProtobuf copyWithZone:](self->_details, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *outputDeviceUID;
  _MRRequestDetailsProtobuf *details;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_adjustment != *((_DWORD *)v4 + 2))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  outputDeviceUID = self->_outputDeviceUID;
  if ((unint64_t)outputDeviceUID | *((_QWORD *)v4 + 3)
    && !-[NSString isEqual:](outputDeviceUID, "isEqual:"))
  {
    goto LABEL_11;
  }
  details = self->_details;
  if ((unint64_t)details | *((_QWORD *)v4 + 2))
    v7 = -[_MRRequestDetailsProtobuf isEqual:](details, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_adjustment;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_outputDeviceUID, "hash") ^ v3;
  return v4 ^ -[_MRRequestDetailsProtobuf hash](self->_details, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _QWORD *v5;
  _MRRequestDetailsProtobuf *details;
  uint64_t v7;
  _QWORD *v8;

  v4 = a3;
  v5 = v4;
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_adjustment = *((_DWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  v8 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[_MRAdjustVolumeMessageProtobuf setOutputDeviceUID:](self, "setOutputDeviceUID:");
    v5 = v8;
  }
  details = self->_details;
  v7 = v5[2];
  if (details)
  {
    if (v7)
    {
      -[_MRRequestDetailsProtobuf mergeFrom:](details, "mergeFrom:");
LABEL_10:
      v5 = v8;
    }
  }
  else if (v7)
  {
    -[_MRAdjustVolumeMessageProtobuf setDetails:](self, "setDetails:");
    goto LABEL_10;
  }

}

- (NSString)outputDeviceUID
{
  return self->_outputDeviceUID;
}

- (void)setOutputDeviceUID:(id)a3
{
  objc_storeStrong((id *)&self->_outputDeviceUID, a3);
}

- (_MRRequestDetailsProtobuf)details
{
  return self->_details;
}

- (void)setDetails:(id)a3
{
  objc_storeStrong((id *)&self->_details, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputDeviceUID, 0);
  objc_storeStrong((id *)&self->_details, 0);
}

@end
