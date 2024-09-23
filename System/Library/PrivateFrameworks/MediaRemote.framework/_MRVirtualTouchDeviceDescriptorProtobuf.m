@implementation _MRVirtualTouchDeviceDescriptorProtobuf

- (void)setAbsolute:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_absolute = a3;
}

- (void)setHasAbsolute:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAbsolute
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setIntegratedDisplay:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_integratedDisplay = a3;
}

- (void)setHasIntegratedDisplay:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIntegratedDisplay
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setScreenSizeWidth:(float)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_screenSizeWidth = a3;
}

- (void)setHasScreenSizeWidth:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasScreenSizeWidth
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setScreenSizeHeight:(float)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_screenSizeHeight = a3;
}

- (void)setHasScreenSizeHeight:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasScreenSizeHeight
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
  v8.super_class = (Class)_MRVirtualTouchDeviceDescriptorProtobuf;
  -[_MRVirtualTouchDeviceDescriptorProtobuf description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MRVirtualTouchDeviceDescriptorProtobuf dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  double v4;
  char has;
  void *v6;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_absolute);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("absolute"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_9:
      *(float *)&v4 = self->_screenSizeWidth;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("screenSizeWidth"));

      if ((*(_BYTE *)&self->_has & 1) == 0)
        return v3;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_integratedDisplay);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("integratedDisplay"));

  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 1) != 0)
  {
LABEL_5:
    *(float *)&v4 = self->_screenSizeHeight;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("screenSizeHeight"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRVirtualTouchDeviceDescriptorProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  id v5;

  v5 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_9:
      PBDataWriterWriteFloatField();
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 1) != 0)
LABEL_5:
    PBDataWriterWriteFloatField();
LABEL_6:

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  char has;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v4[16] = self->_absolute;
    v4[20] |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
LABEL_9:
      *((_DWORD *)v4 + 3) = LODWORD(self->_screenSizeWidth);
      v4[20] |= 2u;
      if ((*(_BYTE *)&self->_has & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[17] = self->_integratedDisplay;
  v4[20] |= 8u;
  has = (char)self->_has;
  if ((has & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((has & 1) != 0)
  {
LABEL_5:
    *((_DWORD *)v4 + 2) = LODWORD(self->_screenSizeHeight);
    v4[20] |= 1u;
  }
LABEL_6:

}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  char has;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_BYTE *)result + 16) = self->_absolute;
    *((_BYTE *)result + 20) |= 4u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 2) == 0)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((_BYTE *)result + 17) = self->_integratedDisplay;
  *((_BYTE *)result + 20) |= 8u;
  has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 1) == 0)
      return result;
    goto LABEL_5;
  }
LABEL_9:
  *((_DWORD *)result + 3) = LODWORD(self->_screenSizeWidth);
  *((_BYTE *)result + 20) |= 2u;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    return result;
LABEL_5:
  *((_DWORD *)result + 2) = LODWORD(self->_screenSizeHeight);
  *((_BYTE *)result + 20) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_27;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 4) == 0)
      goto LABEL_27;
    if (self->_absolute)
    {
      if (!*((_BYTE *)v4 + 16))
        goto LABEL_27;
    }
    else if (*((_BYTE *)v4 + 16))
    {
      goto LABEL_27;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 4) != 0)
  {
    goto LABEL_27;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 8) != 0)
    {
      if (self->_integratedDisplay)
      {
        if (!*((_BYTE *)v4 + 17))
          goto LABEL_27;
        goto LABEL_18;
      }
      if (!*((_BYTE *)v4 + 17))
        goto LABEL_18;
    }
LABEL_27:
    v5 = 0;
    goto LABEL_28;
  }
  if ((*((_BYTE *)v4 + 20) & 8) != 0)
    goto LABEL_27;
LABEL_18:
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 2) == 0 || self->_screenSizeWidth != *((float *)v4 + 3))
      goto LABEL_27;
  }
  else if ((*((_BYTE *)v4 + 20) & 2) != 0)
  {
    goto LABEL_27;
  }
  v5 = (*((_BYTE *)v4 + 20) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_screenSizeHeight != *((float *)v4 + 2))
      goto LABEL_27;
    v5 = 1;
  }
LABEL_28:

  return v5;
}

- (unint64_t)hash
{
  char has;
  uint64_t v4;
  uint64_t v5;
  float screenSizeWidth;
  float v7;
  float v8;
  float v9;
  unint64_t v10;
  unint64_t v11;
  float screenSizeHeight;
  float v13;
  float v14;
  float v15;

  has = (char)self->_has;
  if ((has & 4) == 0)
  {
    v4 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
LABEL_9:
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_4;
LABEL_10:
    v10 = 0;
    goto LABEL_13;
  }
  v4 = 2654435761 * self->_absolute;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_3:
  v5 = 2654435761 * self->_integratedDisplay;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_10;
LABEL_4:
  screenSizeWidth = self->_screenSizeWidth;
  v7 = -screenSizeWidth;
  if (screenSizeWidth >= 0.0)
    v7 = self->_screenSizeWidth;
  v8 = floorf(v7 + 0.5);
  v9 = (float)(v7 - v8) * 1.8447e19;
  v10 = 2654435761u * (unint64_t)fmodf(v8, 1.8447e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0)
      v10 += (unint64_t)v9;
  }
  else
  {
    v10 -= (unint64_t)fabsf(v9);
  }
LABEL_13:
  if ((has & 1) != 0)
  {
    screenSizeHeight = self->_screenSizeHeight;
    v13 = -screenSizeHeight;
    if (screenSizeHeight >= 0.0)
      v13 = self->_screenSizeHeight;
    v14 = floorf(v13 + 0.5);
    v15 = (float)(v13 - v14) * 1.8447e19;
    v11 = 2654435761u * (unint64_t)fmodf(v14, 1.8447e19);
    if (v15 >= 0.0)
    {
      if (v15 > 0.0)
        v11 += (unint64_t)v15;
    }
    else
    {
      v11 -= (unint64_t)fabsf(v15);
    }
  }
  else
  {
    v11 = 0;
  }
  return v5 ^ v4 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 4) != 0)
  {
    self->_absolute = *((_BYTE *)v4 + 16);
    *(_BYTE *)&self->_has |= 4u;
    v5 = *((_BYTE *)v4 + 20);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0)
        goto LABEL_4;
LABEL_9:
      self->_screenSizeWidth = *((float *)v4 + 3);
      *(_BYTE *)&self->_has |= 2u;
      if ((*((_BYTE *)v4 + 20) & 1) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((*((_BYTE *)v4 + 20) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_integratedDisplay = *((_BYTE *)v4 + 17);
  *(_BYTE *)&self->_has |= 8u;
  v5 = *((_BYTE *)v4 + 20);
  if ((v5 & 2) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v5 & 1) != 0)
  {
LABEL_5:
    self->_screenSizeHeight = *((float *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_6:

}

- (BOOL)absolute
{
  return self->_absolute;
}

- (BOOL)integratedDisplay
{
  return self->_integratedDisplay;
}

- (float)screenSizeWidth
{
  return self->_screenSizeWidth;
}

- (float)screenSizeHeight
{
  return self->_screenSizeHeight;
}

@end
