@implementation NRPBSize

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)NRPBSize;
  -[NRPBSize description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NRPBSize dictionaryRepresentation](self, "dictionaryRepresentation");
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
  double v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = self->_width;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("width"));

  *(float *)&v6 = self->_height;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("height"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NRPBSizeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteFloatField();
  PBDataWriterWriteFloatField();

}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 3) = LODWORD(self->_width);
  *((_DWORD *)a3 + 2) = LODWORD(self->_height);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 3) = LODWORD(self->_width);
  *((_DWORD *)result + 2) = LODWORD(self->_height);
  return result;
}

- (BOOL)isEqual:(id)a3
{
  float *v4;
  BOOL v5;

  v4 = (float *)a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_width == v4[3]
    && self->_height == v4[2];

  return v5;
}

- (unint64_t)hash
{
  float width;
  float v4;
  float v5;
  float v6;
  float v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  float height;
  float v13;
  float v14;
  float v15;
  unint64_t v16;
  unint64_t v17;
  float v18;
  unint64_t v19;

  width = self->_width;
  v4 = -width;
  if (width >= 0.0)
    v4 = self->_width;
  v5 = floorf(v4 + 0.5);
  v6 = (float)(v4 - v5) * 1.8447e19;
  v7 = fmodf(v5, 1.8447e19);
  v8 = 2654435761u * (unint64_t)v7;
  v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0)
    v9 = 2654435761u * (unint64_t)v7;
  v10 = v8 - (unint64_t)fabsf(v6);
  if (v6 < 0.0)
    v11 = v10;
  else
    v11 = v9;
  height = self->_height;
  v13 = -height;
  if (height >= 0.0)
    v13 = self->_height;
  v14 = floorf(v13 + 0.5);
  v15 = (float)(v13 - v14) * 1.8447e19;
  v16 = 2654435761u * (unint64_t)fmodf(v14, 1.8447e19);
  v17 = v16 + (unint64_t)v15;
  v18 = fabsf(v15);
  if (v15 <= 0.0)
    v17 = v16;
  v19 = v16 - (unint64_t)v18;
  if (v15 >= 0.0)
    v19 = v17;
  return v19 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  self->_width = *((float *)a3 + 3);
  self->_height = *((float *)a3 + 2);
}

- (float)width
{
  return self->_width;
}

- (void)setWidth:(float)a3
{
  self->_width = a3;
}

- (float)height
{
  return self->_height;
}

- (void)setHeight:(float)a3
{
  self->_height = a3;
}

@end
