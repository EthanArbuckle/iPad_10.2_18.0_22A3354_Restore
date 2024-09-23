@implementation _MRGameControllerAccelerationProtobuf

- (BOOL)hasData
{
  return self->_data != 0;
}

- (void)setX:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_x = a3;
}

- (void)setHasX:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasX
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setY:(float)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_y = a3;
}

- (void)setHasY:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasY
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setZ:(float)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_z = a3;
}

- (void)setHasZ:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasZ
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setW:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_w = a3;
}

- (void)setHasW:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasW
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
  v8.super_class = (Class)_MRGameControllerAccelerationProtobuf;
  -[_MRGameControllerAccelerationProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRGameControllerAccelerationProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSData *data;
  char has;
  void *v8;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  data = self->_data;
  if (data)
    objc_msgSend(v3, "setObject:forKey:", data, CFSTR("data"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)&v4 = self->_x;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("x"));

    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_6;
LABEL_11:
      *(float *)&v4 = self->_z;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKey:", v12, CFSTR("z"));

      if ((*(_BYTE *)&self->_has & 1) == 0)
        return v5;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *(float *)&v4 = self->_y;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("y"));

  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 1) != 0)
  {
LABEL_7:
    *(float *)&v4 = self->_w;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("w"));

  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGameControllerAccelerationProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_data)
  {
    PBDataWriterWriteDataField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_6;
LABEL_11:
      PBDataWriterWriteFloatField();
      v4 = v6;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteFloatField();
  v4 = v6;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 1) != 0)
  {
LABEL_7:
    PBDataWriterWriteFloatField();
    v4 = v6;
  }
LABEL_8:

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  if (self->_data)
  {
    v6 = v4;
    objc_msgSend(v4, "setData:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 5) = LODWORD(self->_x);
    *((_BYTE *)v4 + 32) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 8) == 0)
        goto LABEL_6;
LABEL_11:
      *((_DWORD *)v4 + 7) = LODWORD(self->_z);
      *((_BYTE *)v4 + 32) |= 8u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 6) = LODWORD(self->_y);
  *((_BYTE *)v4 + 32) |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_11;
LABEL_6:
  if ((has & 1) != 0)
  {
LABEL_7:
    *((_DWORD *)v4 + 4) = LODWORD(self->_w);
    *((_BYTE *)v4 + 32) |= 1u;
  }
LABEL_8:

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_data, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(float *)(v5 + 20) = self->_x;
    *(_BYTE *)(v5 + 32) |= 2u;
    has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0)
        goto LABEL_4;
LABEL_9:
      *(float *)(v5 + 28) = self->_z;
      *(_BYTE *)(v5 + 32) |= 8u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        return (id)v5;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(float *)(v5 + 24) = self->_y;
  *(_BYTE *)(v5 + 32) |= 4u;
  has = (char)self->_has;
  if ((has & 8) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 1) != 0)
  {
LABEL_5:
    *(float *)(v5 + 16) = self->_w;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *data;
  BOOL v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  data = self->_data;
  if ((unint64_t)data | *((_QWORD *)v4 + 1))
  {
    if (!-[NSData isEqual:](data, "isEqual:"))
      goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 2) == 0 || self->_x != *((float *)v4 + 5))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 32) & 2) != 0)
  {
LABEL_23:
    v6 = 0;
    goto LABEL_24;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 4) == 0 || self->_y != *((float *)v4 + 6))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 32) & 4) != 0)
  {
    goto LABEL_23;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 8) == 0 || self->_z != *((float *)v4 + 7))
      goto LABEL_23;
  }
  else if ((*((_BYTE *)v4 + 32) & 8) != 0)
  {
    goto LABEL_23;
  }
  v6 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) == 0 || self->_w != *((float *)v4 + 4))
      goto LABEL_23;
    v6 = 1;
  }
LABEL_24:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  char has;
  unint64_t v5;
  float x;
  float v7;
  float v8;
  float v9;
  unint64_t v10;
  float y;
  float v12;
  float v13;
  float v14;
  unint64_t v15;
  float z;
  float v17;
  float v18;
  float v19;
  unint64_t v20;
  float w;
  float v22;
  float v23;
  float v24;

  v3 = -[NSData hash](self->_data, "hash");
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    x = self->_x;
    v7 = -x;
    if (x >= 0.0)
      v7 = self->_x;
    v8 = floorf(v7 + 0.5);
    v9 = (float)(v7 - v8) * 1.8447e19;
    v5 = 2654435761u * (unint64_t)fmodf(v8, 1.8447e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0)
        v5 += (unint64_t)v9;
    }
    else
    {
      v5 -= (unint64_t)fabsf(v9);
    }
  }
  else
  {
    v5 = 0;
  }
  if ((has & 4) != 0)
  {
    y = self->_y;
    v12 = -y;
    if (y >= 0.0)
      v12 = self->_y;
    v13 = floorf(v12 + 0.5);
    v14 = (float)(v12 - v13) * 1.8447e19;
    v10 = 2654435761u * (unint64_t)fmodf(v13, 1.8447e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0)
        v10 += (unint64_t)v14;
    }
    else
    {
      v10 -= (unint64_t)fabsf(v14);
    }
  }
  else
  {
    v10 = 0;
  }
  if ((has & 8) != 0)
  {
    z = self->_z;
    v17 = -z;
    if (z >= 0.0)
      v17 = self->_z;
    v18 = floorf(v17 + 0.5);
    v19 = (float)(v17 - v18) * 1.8447e19;
    v15 = 2654435761u * (unint64_t)fmodf(v18, 1.8447e19);
    if (v19 >= 0.0)
    {
      if (v19 > 0.0)
        v15 += (unint64_t)v19;
    }
    else
    {
      v15 -= (unint64_t)fabsf(v19);
    }
  }
  else
  {
    v15 = 0;
  }
  if ((has & 1) != 0)
  {
    w = self->_w;
    v22 = -w;
    if (w >= 0.0)
      v22 = self->_w;
    v23 = floorf(v22 + 0.5);
    v24 = (float)(v22 - v23) * 1.8447e19;
    v20 = 2654435761u * (unint64_t)fmodf(v23, 1.8447e19);
    if (v24 >= 0.0)
    {
      if (v24 > 0.0)
        v20 += (unint64_t)v24;
    }
    else
    {
      v20 -= (unint64_t)fabsf(v24);
    }
  }
  else
  {
    v20 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v15 ^ v20;
}

- (void)mergeFrom:(id)a3
{
  float *v4;
  char v5;
  float *v6;

  v4 = (float *)a3;
  if (*((_QWORD *)v4 + 1))
  {
    v6 = v4;
    -[_MRGameControllerAccelerationProtobuf setData:](self, "setData:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_x = v4[5];
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 32);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 8) == 0)
        goto LABEL_6;
LABEL_11:
      self->_z = v4[7];
      *(_BYTE *)&self->_has |= 8u;
      if (((_BYTE)v4[8] & 1) == 0)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  else if (((_BYTE)v4[8] & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_y = v4[6];
  *(_BYTE *)&self->_has |= 4u;
  v5 = *((_BYTE *)v4 + 32);
  if ((v5 & 8) != 0)
    goto LABEL_11;
LABEL_6:
  if ((v5 & 1) != 0)
  {
LABEL_7:
    self->_w = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_8:

}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (float)x
{
  return self->_x;
}

- (float)y
{
  return self->_y;
}

- (float)z
{
  return self->_z;
}

- (float)w
{
  return self->_w;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
