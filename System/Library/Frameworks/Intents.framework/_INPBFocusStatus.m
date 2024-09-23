@implementation _INPBFocusStatus

- (void)setIsFocused:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isFocused = a3;
}

- (BOOL)hasIsFocused
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsFocused:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBFocusStatusReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_INPBFocusStatus hasIsFocused](self, "hasIsFocused"))
    PBDataWriterWriteBOOLField();

}

- (_INPBFocusStatus)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBFocusStatus *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBFocusStatus *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBFocusStatus *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBFocusStatus initWithData:](self, "initWithData:", v6);

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
  -[_INPBFocusStatus data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBFocusStatus *v4;

  v4 = -[_INPBFocusStatus init](+[_INPBFocusStatus allocWithZone:](_INPBFocusStatus, "allocWithZone:", a3), "init");
  if (-[_INPBFocusStatus hasIsFocused](self, "hasIsFocused"))
    -[_INPBFocusStatus setIsFocused:](v4, "setIsFocused:", -[_INPBFocusStatus isFocused](self, "isFocused"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  BOOL v6;
  int isFocused;

  v4 = a3;
  v6 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[_INPBFocusStatus hasIsFocused](self, "hasIsFocused");
    if (v5 == objc_msgSend(v4, "hasIsFocused"))
    {
      if (!-[_INPBFocusStatus hasIsFocused](self, "hasIsFocused")
        || !objc_msgSend(v4, "hasIsFocused")
        || (isFocused = self->_isFocused, isFocused == objc_msgSend(v4, "isFocused")))
      {
        v6 = 1;
      }
    }
  }

  return v6;
}

- (unint64_t)hash
{
  if (-[_INPBFocusStatus hasIsFocused](self, "hasIsFocused"))
    return 2654435761 * self->_isFocused;
  else
    return 0;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBFocusStatus hasIsFocused](self, "hasIsFocused"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBFocusStatus isFocused](self, "isFocused"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isFocused"));

  }
  return v3;
}

- (BOOL)isFocused
{
  return self->_isFocused;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
