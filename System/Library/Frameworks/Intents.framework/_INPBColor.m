@implementation _INPBColor

- (void)setBlue:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_blue = a3;
}

- (BOOL)hasBlue
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasBlue:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setGreen:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_green = a3;
}

- (BOOL)hasGreen
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasGreen:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setRed:(double)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_red = a3;
}

- (BOOL)hasRed
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasRed:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBColorReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_INPBColor hasBlue](self, "hasBlue"))
    PBDataWriterWriteDoubleField();
  if (-[_INPBColor hasGreen](self, "hasGreen"))
    PBDataWriterWriteDoubleField();
  if (-[_INPBColor hasRed](self, "hasRed"))
    PBDataWriterWriteDoubleField();

}

- (_INPBColor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBColor *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBColor *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBColor *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBColor initWithData:](self, "initWithData:", v6);

    v6 = self;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_INPBColor data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBColor *v4;

  v4 = -[_INPBColor init](+[_INPBColor allocWithZone:](_INPBColor, "allocWithZone:", a3), "init");
  if (-[_INPBColor hasBlue](self, "hasBlue"))
  {
    -[_INPBColor blue](self, "blue");
    -[_INPBColor setBlue:](v4, "setBlue:");
  }
  if (-[_INPBColor hasGreen](self, "hasGreen"))
  {
    -[_INPBColor green](self, "green");
    -[_INPBColor setGreen:](v4, "setGreen:");
  }
  if (-[_INPBColor hasRed](self, "hasRed"))
  {
    -[_INPBColor red](self, "red");
    -[_INPBColor setRed:](v4, "setRed:");
  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  double blue;
  double v7;
  int v8;
  double green;
  double v10;
  int v11;
  BOOL v12;
  double red;
  double v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_11;
  v5 = -[_INPBColor hasBlue](self, "hasBlue");
  if (v5 != objc_msgSend(v4, "hasBlue"))
    goto LABEL_11;
  if (-[_INPBColor hasBlue](self, "hasBlue"))
  {
    if (objc_msgSend(v4, "hasBlue"))
    {
      blue = self->_blue;
      objc_msgSend(v4, "blue");
      if (blue != v7)
        goto LABEL_11;
    }
  }
  if ((v8 = -[_INPBColor hasGreen](self, "hasGreen"), v8 == objc_msgSend(v4, "hasGreen"))
    && (!-[_INPBColor hasGreen](self, "hasGreen")
     || !objc_msgSend(v4, "hasGreen")
     || (green = self->_green, objc_msgSend(v4, "green"), green == v10))
    && (v11 = -[_INPBColor hasRed](self, "hasRed"), v11 == objc_msgSend(v4, "hasRed"))
    && (!-[_INPBColor hasRed](self, "hasRed")
     || !objc_msgSend(v4, "hasRed")
     || (red = self->_red, objc_msgSend(v4, "red"), red == v15)))
  {
    v12 = 1;
  }
  else
  {
LABEL_11:
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  double blue;
  double v4;
  long double v5;
  double v6;
  unint64_t v7;
  double green;
  double v9;
  long double v10;
  double v11;
  unint64_t v12;
  double red;
  double v14;
  long double v15;
  double v16;
  unint64_t v17;

  if (-[_INPBColor hasBlue](self, "hasBlue"))
  {
    blue = self->_blue;
    v4 = -blue;
    if (blue >= 0.0)
      v4 = self->_blue;
    v5 = floor(v4 + 0.5);
    v6 = (v4 - v5) * 1.84467441e19;
    v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
    if (v6 >= 0.0)
    {
      if (v6 > 0.0)
        v7 += (unint64_t)v6;
    }
    else
    {
      v7 -= (unint64_t)fabs(v6);
    }
  }
  else
  {
    v7 = 0;
  }
  if (-[_INPBColor hasGreen](self, "hasGreen"))
  {
    green = self->_green;
    v9 = -green;
    if (green >= 0.0)
      v9 = self->_green;
    v10 = floor(v9 + 0.5);
    v11 = (v9 - v10) * 1.84467441e19;
    v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
    if (v11 >= 0.0)
    {
      if (v11 > 0.0)
        v12 += (unint64_t)v11;
    }
    else
    {
      v12 -= (unint64_t)fabs(v11);
    }
  }
  else
  {
    v12 = 0;
  }
  if (-[_INPBColor hasRed](self, "hasRed"))
  {
    red = self->_red;
    v14 = -red;
    if (red >= 0.0)
      v14 = self->_red;
    v15 = floor(v14 + 0.5);
    v16 = (v14 - v15) * 1.84467441e19;
    v17 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0)
        v17 += (unint64_t)v16;
    }
    else
    {
      v17 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    v17 = 0;
  }
  return v12 ^ v7 ^ v17;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBColor hasBlue](self, "hasBlue"))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    -[_INPBColor blue](self, "blue");
    objc_msgSend(v4, "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("blue"));

  }
  if (-[_INPBColor hasGreen](self, "hasGreen"))
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    -[_INPBColor green](self, "green");
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("green"));

  }
  if (-[_INPBColor hasRed](self, "hasRed"))
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[_INPBColor red](self, "red");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("red"));

  }
  return v3;
}

- (double)blue
{
  return self->_blue;
}

- (double)green
{
  return self->_green;
}

- (double)red
{
  return self->_red;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
