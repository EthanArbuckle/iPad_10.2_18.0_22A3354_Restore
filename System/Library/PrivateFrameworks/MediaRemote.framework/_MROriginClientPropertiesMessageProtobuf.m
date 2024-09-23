@implementation _MROriginClientPropertiesMessageProtobuf

- (void)setLastPlayingTimestamp:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_lastPlayingTimestamp = a3;
}

- (void)setHasLastPlayingTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLastPlayingTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasDevicePlaybackSessionID
{
  return self->_devicePlaybackSessionID != 0;
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
  v8.super_class = (Class)_MROriginClientPropertiesMessageProtobuf;
  -[_MROriginClientPropertiesMessageProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MROriginClientPropertiesMessageProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *devicePlaybackSessionID;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_lastPlayingTimestamp);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("lastPlayingTimestamp"));

  }
  devicePlaybackSessionID = self->_devicePlaybackSessionID;
  if (devicePlaybackSessionID)
    objc_msgSend(v3, "setObject:forKey:", devicePlaybackSessionID, CFSTR("devicePlaybackSessionID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MROriginClientPropertiesMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }
  if (self->_devicePlaybackSessionID)
  {
    PBDataWriterWriteStringField();
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
    v4[1] = *(_QWORD *)&self->_lastPlayingTimestamp;
    *((_BYTE *)v4 + 24) |= 1u;
  }
  if (self->_devicePlaybackSessionID)
  {
    v5 = v4;
    objc_msgSend(v4, "setDevicePlaybackSessionID:");
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
    *(double *)(v5 + 8) = self->_lastPlayingTimestamp;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_devicePlaybackSessionID, "copyWithZone:", a3);
  v8 = (void *)v6[2];
  v6[2] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *devicePlaybackSessionID;
  char v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_lastPlayingTimestamp != *((double *)v4 + 1))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  devicePlaybackSessionID = self->_devicePlaybackSessionID;
  if ((unint64_t)devicePlaybackSessionID | *((_QWORD *)v4 + 2))
    v6 = -[NSString isEqual:](devicePlaybackSessionID, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3;
  double lastPlayingTimestamp;
  double v5;
  long double v6;
  double v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    lastPlayingTimestamp = self->_lastPlayingTimestamp;
    v5 = -lastPlayingTimestamp;
    if (lastPlayingTimestamp >= 0.0)
      v5 = self->_lastPlayingTimestamp;
    v6 = floor(v5 + 0.5);
    v7 = (v5 - v6) * 1.84467441e19;
    v3 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
    if (v7 >= 0.0)
    {
      if (v7 > 0.0)
        v3 += (unint64_t)v7;
    }
    else
    {
      v3 -= (unint64_t)fabs(v7);
    }
  }
  else
  {
    v3 = 0;
  }
  return -[NSString hash](self->_devicePlaybackSessionID, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;

  v4 = (double *)a3;
  if (((_BYTE)v4[3] & 1) != 0)
  {
    self->_lastPlayingTimestamp = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 2))
  {
    v5 = v4;
    -[_MROriginClientPropertiesMessageProtobuf setDevicePlaybackSessionID:](self, "setDevicePlaybackSessionID:");
    v4 = v5;
  }

}

- (double)lastPlayingTimestamp
{
  return self->_lastPlayingTimestamp;
}

- (NSString)devicePlaybackSessionID
{
  return self->_devicePlaybackSessionID;
}

- (void)setDevicePlaybackSessionID:(id)a3
{
  objc_storeStrong((id *)&self->_devicePlaybackSessionID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devicePlaybackSessionID, 0);
}

@end
