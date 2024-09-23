@implementation _MRVolumeDidChangeMessageProtobuf

- (void)setVolume:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_volume = a3;
}

- (void)setHasVolume:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVolume
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasEndpointUID
{
  return self->_endpointUID != 0;
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
  v8.super_class = (Class)_MRVolumeDidChangeMessageProtobuf;
  -[_MRVolumeDidChangeMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRVolumeDidChangeMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  void *v5;
  NSString *endpointUID;
  NSString *outputDeviceUID;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(float *)&v4 = self->_volume;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("volume"));

  }
  endpointUID = self->_endpointUID;
  if (endpointUID)
    objc_msgSend(v3, "setObject:forKey:", endpointUID, CFSTR("endpointUID"));
  outputDeviceUID = self->_outputDeviceUID;
  if (outputDeviceUID)
    objc_msgSend(v3, "setObject:forKey:", outputDeviceUID, CFSTR("outputDeviceUID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRVolumeDidChangeMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v5;
  }
  if (self->_endpointUID)
  {
    PBDataWriterWriteStringField();
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
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[6] = LODWORD(self->_volume);
    *((_BYTE *)v4 + 28) |= 1u;
  }
  v5 = v4;
  if (self->_endpointUID)
  {
    objc_msgSend(v4, "setEndpointUID:");
    v4 = v5;
  }
  if (self->_outputDeviceUID)
  {
    objc_msgSend(v5, "setOutputDeviceUID:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(float *)(v5 + 24) = self->_volume;
    *(_BYTE *)(v5 + 28) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_endpointUID, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  v9 = -[NSString copyWithZone:](self->_outputDeviceUID, "copyWithZone:", a3);
  v10 = (void *)v6[2];
  v6[2] = v9;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *endpointUID;
  NSString *outputDeviceUID;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0 || self->_volume != *((float *)v4 + 6))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)v4 + 28) & 1) != 0)
  {
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  endpointUID = self->_endpointUID;
  if ((unint64_t)endpointUID | *((_QWORD *)v4 + 1)
    && !-[NSString isEqual:](endpointUID, "isEqual:"))
  {
    goto LABEL_11;
  }
  outputDeviceUID = self->_outputDeviceUID;
  if ((unint64_t)outputDeviceUID | *((_QWORD *)v4 + 2))
    v7 = -[NSString isEqual:](outputDeviceUID, "isEqual:");
  else
    v7 = 1;
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  float volume;
  float v5;
  float v6;
  float v7;
  NSUInteger v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    volume = self->_volume;
    v5 = -volume;
    if (volume >= 0.0)
      v5 = self->_volume;
    v6 = floorf(v5 + 0.5);
    v7 = (float)(v5 - v6) * 1.8447e19;
    v3 = 2654435761u * (unint64_t)fmodf(v6, 1.8447e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabsf(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = -[NSString hash](self->_endpointUID, "hash") ^ v3;
  return v8 ^ -[NSString hash](self->_outputDeviceUID, "hash");
}

- (void)mergeFrom:(id)a3
{
  float *v4;
  float *v5;

  v4 = (float *)a3;
  if (((_BYTE)v4[7] & 1) != 0)
  {
    self->_volume = v4[6];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[_MRVolumeDidChangeMessageProtobuf setEndpointUID:](self, "setEndpointUID:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[_MRVolumeDidChangeMessageProtobuf setOutputDeviceUID:](self, "setOutputDeviceUID:");
    v4 = v5;
  }

}

- (float)volume
{
  return self->_volume;
}

- (NSString)endpointUID
{
  return self->_endpointUID;
}

- (void)setEndpointUID:(id)a3
{
  objc_storeStrong((id *)&self->_endpointUID, a3);
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
  objc_storeStrong((id *)&self->_endpointUID, 0);
}

@end
