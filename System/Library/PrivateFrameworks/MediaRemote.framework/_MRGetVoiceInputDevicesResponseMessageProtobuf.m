@implementation _MRGetVoiceInputDevicesResponseMessageProtobuf

- (void)dealloc
{
  objc_super v3;

  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)_MRGetVoiceInputDevicesResponseMessageProtobuf;
  -[_MRGetVoiceInputDevicesResponseMessageProtobuf dealloc](&v3, sel_dealloc);
}

- (unint64_t)deviceIDsCount
{
  return self->_deviceIDs.count;
}

- (unsigned)deviceIDs
{
  return self->_deviceIDs.list;
}

- (void)clearDeviceIDs
{
  PBRepeatedUInt32Clear();
}

- (void)addDeviceIDs:(unsigned int)a3
{
  PBRepeatedUInt32Add();
}

- (unsigned)deviceIDsAtIndex:(unint64_t)a3
{
  $1729E44CE8A3ADE0AA70C2F19EF2BB02 *p_deviceIDs;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_deviceIDs = &self->_deviceIDs;
  count = self->_deviceIDs.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_deviceIDs->list[a3];
}

- (void)setDeviceIDs:(unsigned int *)a3 count:(unint64_t)a4
{
  PBRepeatedUInt32Set();
}

- (void)setErrorCode:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(_BYTE *)&self->_has & 1;
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
  v8.super_class = (Class)_MRGetVoiceInputDevicesResponseMessageProtobuf;
  -[_MRGetVoiceInputDevicesResponseMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRGetVoiceInputDevicesResponseMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PBRepeatedUInt32NSArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("deviceIDs"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_errorCode);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("errorCode"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGetVoiceInputDevicesResponseMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_deviceIDs.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      v4 = v6;
      ++v5;
    }
    while (v5 < self->_deviceIDs.count);
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id v7;

  v7 = a3;
  if (-[_MRGetVoiceInputDevicesResponseMessageProtobuf deviceIDsCount](self, "deviceIDsCount"))
  {
    objc_msgSend(v7, "clearDeviceIDs");
    v4 = -[_MRGetVoiceInputDevicesResponseMessageProtobuf deviceIDsCount](self, "deviceIDsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
        objc_msgSend(v7, "addDeviceIDs:", -[_MRGetVoiceInputDevicesResponseMessageProtobuf deviceIDsAtIndex:](self, "deviceIDsAtIndex:", i));
    }
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v7 + 8) = self->_errorCode;
    *((_BYTE *)v7 + 36) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt32Copy();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v4 + 32) = self->_errorCode;
    *(_BYTE *)(v4 + 36) |= 1u;
  }
  return (id)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()) || !PBRepeatedUInt32IsEqual())
    goto LABEL_7;
  v5 = (*((_BYTE *)v4 + 36) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 36) & 1) != 0 && self->_errorCode == *((_DWORD *)v4 + 8))
    {
      v5 = 1;
      goto LABEL_8;
    }
LABEL_7:
    v5 = 0;
  }
LABEL_8:

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  v3 = PBRepeatedUInt32Hash();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761 * self->_errorCode;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  unsigned int *v7;

  v7 = (unsigned int *)a3;
  v4 = objc_msgSend(v7, "deviceIDsCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
      -[_MRGetVoiceInputDevicesResponseMessageProtobuf addDeviceIDs:](self, "addDeviceIDs:", objc_msgSend(v7, "deviceIDsAtIndex:", i));
  }
  if ((v7[9] & 1) != 0)
  {
    self->_errorCode = v7[8];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (unsigned)errorCode
{
  return self->_errorCode;
}

@end
