@implementation _MRAudioDataBlockProtobuf

- (BOOL)hasBuffer
{
  return self->_buffer != 0;
}

- (BOOL)hasTime
{
  return self->_time != 0;
}

- (void)setGain:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_gain = a3;
}

- (void)setHasGain:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasGain
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
  v8.super_class = (Class)_MRAudioDataBlockProtobuf;
  -[_MRAudioDataBlockProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRAudioDataBlockProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _MRAudioBufferProtobuf *buffer;
  void *v5;
  _MRAudioTimeProtobuf *time;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  buffer = self->_buffer;
  if (buffer)
  {
    -[_MRAudioBufferProtobuf dictionaryRepresentation](buffer, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("buffer"));

  }
  time = self->_time;
  if (time)
  {
    -[_MRAudioTimeProtobuf dictionaryRepresentation](time, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("time"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_gain);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("gain"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRAudioDataBlockProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_buffer)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_time)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_buffer)
  {
    objc_msgSend(v4, "setBuffer:");
    v4 = v5;
  }
  if (self->_time)
  {
    objc_msgSend(v5, "setTime:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_gain;
    *((_BYTE *)v4 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[_MRAudioBufferProtobuf copyWithZone:](self->_buffer, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[_MRAudioTimeProtobuf copyWithZone:](self->_time, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_gain;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _MRAudioBufferProtobuf *buffer;
  _MRAudioTimeProtobuf *time;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  buffer = self->_buffer;
  if ((unint64_t)buffer | *((_QWORD *)v4 + 2))
  {
    if (!-[_MRAudioBufferProtobuf isEqual:](buffer, "isEqual:"))
      goto LABEL_10;
  }
  time = self->_time;
  if ((unint64_t)time | *((_QWORD *)v4 + 3))
  {
    if (!-[_MRAudioTimeProtobuf isEqual:](time, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) != 0 && self->_gain == *((double *)v4 + 1))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  double gain;
  double v7;
  long double v8;
  double v9;

  v3 = -[_MRAudioBufferProtobuf hash](self->_buffer, "hash");
  v4 = -[_MRAudioTimeProtobuf hash](self->_time, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    gain = self->_gain;
    v7 = -gain;
    if (gain >= 0.0)
      v7 = self->_gain;
    v8 = floor(v7 + 0.5);
    v9 = (v7 - v8) * 1.84467441e19;
    v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  _MRAudioBufferProtobuf *buffer;
  uint64_t v6;
  _MRAudioTimeProtobuf *time;
  uint64_t v8;
  id v9;

  v4 = a3;
  buffer = self->_buffer;
  v6 = *((_QWORD *)v4 + 2);
  v9 = v4;
  if (buffer)
  {
    if (!v6)
      goto LABEL_7;
    -[_MRAudioBufferProtobuf mergeFrom:](buffer, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[_MRAudioDataBlockProtobuf setBuffer:](self, "setBuffer:");
  }
  v4 = v9;
LABEL_7:
  time = self->_time;
  v8 = *((_QWORD *)v4 + 3);
  if (time)
  {
    if (!v8)
      goto LABEL_13;
    -[_MRAudioTimeProtobuf mergeFrom:](time, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_13;
    -[_MRAudioDataBlockProtobuf setTime:](self, "setTime:");
  }
  v4 = v9;
LABEL_13:
  if ((*((_BYTE *)v4 + 32) & 1) != 0)
  {
    self->_gain = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (_MRAudioBufferProtobuf)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_buffer, a3);
}

- (_MRAudioTimeProtobuf)time
{
  return self->_time;
}

- (void)setTime:(id)a3
{
  objc_storeStrong((id *)&self->_time, a3);
}

- (double)gain
{
  return self->_gain;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_time, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
