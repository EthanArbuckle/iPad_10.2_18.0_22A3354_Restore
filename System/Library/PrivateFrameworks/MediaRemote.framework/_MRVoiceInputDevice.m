@implementation _MRVoiceInputDevice

- (void)setDeviceID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_deviceID = a3;
}

- (void)setHasDeviceID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDeviceID
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasDescriptor
{
  return self->_descriptor != 0;
}

- (int)recordingState
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_recordingState;
  else
    return 0;
}

- (void)setRecordingState:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_recordingState = a3;
}

- (void)setHasRecordingState:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRecordingState
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)recordingStateAsString:(int)a3
{
  if (a3 < 3)
    return off_1E30C9860[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRecordingState:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Recording")) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("NotRecording")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)_MRVoiceInputDevice;
  -[_MRVoiceInputDevice description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRVoiceInputDevice dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  _MRVoiceInputDeviceDescriptorProtobuf *descriptor;
  void *v6;
  uint64_t recordingState;
  __CFString *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_deviceID);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("deviceID"));

  }
  descriptor = self->_descriptor;
  if (descriptor)
  {
    -[_MRVoiceInputDeviceDescriptorProtobuf dictionaryRepresentation](descriptor, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("descriptor"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    recordingState = self->_recordingState;
    if (recordingState >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_recordingState);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E30C9860[recordingState];
    }
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("recordingState"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRVoiceInputDeviceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
  if (self->_descriptor)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
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
    v4[4] = self->_deviceID;
    *((_BYTE *)v4 + 24) |= 1u;
  }
  if (self->_descriptor)
  {
    v5 = v4;
    objc_msgSend(v4, "setDescriptor:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4[5] = self->_recordingState;
    *((_BYTE *)v4 + 24) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_deviceID;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  v7 = -[_MRVoiceInputDeviceDescriptorProtobuf copyWithZone:](self->_descriptor, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v7;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_recordingState;
    *(_BYTE *)(v6 + 24) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  _MRVoiceInputDeviceDescriptorProtobuf *descriptor;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_deviceID != *((_DWORD *)v4 + 4))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
    goto LABEL_14;
  }
  descriptor = self->_descriptor;
  if ((unint64_t)descriptor | *((_QWORD *)v4 + 1))
  {
    if (!-[_MRVoiceInputDeviceDescriptorProtobuf isEqual:](descriptor, "isEqual:"))
    {
LABEL_14:
      v7 = 0;
      goto LABEL_15;
    }
    has = (char)self->_has;
  }
  v7 = (*((_BYTE *)v4 + 24) & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_recordingState != *((_DWORD *)v4 + 5))
      goto LABEL_14;
    v7 = 1;
  }
LABEL_15:

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_deviceID;
  else
    v3 = 0;
  v4 = -[_MRVoiceInputDeviceDescriptorProtobuf hash](self->_descriptor, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v5 = 2654435761 * self->_recordingState;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  id v5;
  _MRVoiceInputDeviceDescriptorProtobuf *descriptor;
  uint64_t v7;
  id v8;

  v4 = a3;
  v5 = v4;
  if ((v4[6] & 1) != 0)
  {
    self->_deviceID = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  descriptor = self->_descriptor;
  v7 = *((_QWORD *)v5 + 1);
  if (descriptor)
  {
    if (!v7)
      goto LABEL_9;
    v8 = v5;
    -[_MRVoiceInputDeviceDescriptorProtobuf mergeFrom:](descriptor, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_9;
    v8 = v5;
    -[_MRVoiceInputDevice setDescriptor:](self, "setDescriptor:");
  }
  v5 = v8;
LABEL_9:
  if ((*((_BYTE *)v5 + 24) & 2) != 0)
  {
    self->_recordingState = *((_DWORD *)v5 + 5);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (unsigned)deviceID
{
  return self->_deviceID;
}

- (_MRVoiceInputDeviceDescriptorProtobuf)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
