@implementation CLPQuaternion

- (void)setZ:(float)a3
{
  self->_z = a3;
}

- (void)setY:(float)a3
{
  self->_y = a3;
}

- (void)setX:(float)a3
{
  self->_x = a3;
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
  v8.super_class = (Class)CLPQuaternion;
  -[CLPQuaternion description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLPQuaternion dictionaryRepresentation](self, "dictionaryRepresentation");
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
  void *v6;
  double v7;
  void *v8;
  double v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(float *)&v4 = self->_w;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("w"));

  }
  *(float *)&v4 = self->_x;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("x"));

  *(float *)&v7 = self->_y;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("y"));

  *(float *)&v9 = self->_z;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("z"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return CLPQuaternionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();

}

- (void)copyTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 2) = LODWORD(self->_w);
    *((_BYTE *)a3 + 24) |= 1u;
  }
  *((_DWORD *)a3 + 3) = LODWORD(self->_x);
  *((_DWORD *)a3 + 4) = LODWORD(self->_y);
  *((_DWORD *)a3 + 5) = LODWORD(self->_z);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)result + 2) = LODWORD(self->_w);
    *((_BYTE *)result + 24) |= 1u;
  }
  *((_DWORD *)result + 3) = LODWORD(self->_x);
  *((_DWORD *)result + 4) = LODWORD(self->_y);
  *((_DWORD *)result + 5) = LODWORD(self->_z);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 1) == 0 || self->_w != *((float *)v4 + 2))
      goto LABEL_10;
  }
  else if ((*((_BYTE *)v4 + 24) & 1) != 0)
  {
LABEL_10:
    v5 = 0;
    goto LABEL_11;
  }
  if (self->_x != *((float *)v4 + 3) || self->_y != *((float *)v4 + 4))
    goto LABEL_10;
  v5 = self->_z == *((float *)v4 + 5);
LABEL_11:

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  float w;
  float v5;
  float v6;
  float v7;
  float v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  float x;
  float v13;
  float v14;
  float v15;
  float v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  float y;
  float v22;
  float v23;
  float v24;
  float v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  float z;
  float v31;
  float v32;
  float v33;
  float v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    w = self->_w;
    v5 = -w;
    if (w >= 0.0)
      v5 = self->_w;
    v6 = floorf(v5 + 0.5);
    v7 = (float)(v5 - v6) * 1.8447e19;
    v8 = fmodf(v6, 1.8447e19);
    v9 = 2654435761u * (unint64_t)v8;
    v10 = v9 + (unint64_t)v7;
    if (v7 <= 0.0)
      v10 = 2654435761u * (unint64_t)v8;
    v11 = v9 - (unint64_t)fabsf(v7);
    if (v7 < 0.0)
      v3 = v11;
    else
      v3 = v10;
  }
  else
  {
    v3 = 0;
  }
  x = self->_x;
  v13 = -x;
  if (x >= 0.0)
    v13 = self->_x;
  v14 = floorf(v13 + 0.5);
  v15 = (float)(v13 - v14) * 1.8447e19;
  v16 = fmodf(v14, 1.8447e19);
  v17 = 2654435761u * (unint64_t)v16;
  v18 = v17 + (unint64_t)v15;
  if (v15 <= 0.0)
    v18 = 2654435761u * (unint64_t)v16;
  v19 = v17 - (unint64_t)fabsf(v15);
  if (v15 < 0.0)
    v20 = v19;
  else
    v20 = v18;
  y = self->_y;
  v22 = -y;
  if (y >= 0.0)
    v22 = self->_y;
  v23 = floorf(v22 + 0.5);
  v24 = (float)(v22 - v23) * 1.8447e19;
  v25 = fmodf(v23, 1.8447e19);
  v26 = 2654435761u * (unint64_t)v25;
  v27 = v26 + (unint64_t)v24;
  if (v24 <= 0.0)
    v27 = 2654435761u * (unint64_t)v25;
  v28 = v26 - (unint64_t)fabsf(v24);
  if (v24 < 0.0)
    v29 = v28;
  else
    v29 = v27;
  z = self->_z;
  v31 = -z;
  if (z >= 0.0)
    v31 = self->_z;
  v32 = floorf(v31 + 0.5);
  v33 = (float)(v31 - v32) * 1.8447e19;
  v34 = fmodf(v32, 1.8447e19);
  v35 = 2654435761u * (unint64_t)v34;
  v36 = v35 + (unint64_t)v33;
  if (v33 <= 0.0)
    v36 = 2654435761u * (unint64_t)v34;
  v37 = v35 - (unint64_t)fabsf(v33);
  if (v33 >= 0.0)
    v37 = v36;
  return v20 ^ v3 ^ v29 ^ v37;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 24) & 1) != 0)
  {
    self->_w = *((float *)a3 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  self->_x = *((float *)a3 + 3);
  self->_y = *((float *)a3 + 4);
  self->_z = *((float *)a3 + 5);
}

- (float)w
{
  return self->_w;
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

@end
