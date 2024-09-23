@implementation _INPBGetCarLockStatusIntentResponse

- (void)setLocked:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_locked = a3;
}

- (BOOL)hasLocked
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasLocked:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBGetCarLockStatusIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_INPBGetCarLockStatusIntentResponse hasLocked](self, "hasLocked"))
    PBDataWriterWriteBOOLField();

}

- (_INPBGetCarLockStatusIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBGetCarLockStatusIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBGetCarLockStatusIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBGetCarLockStatusIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBGetCarLockStatusIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBGetCarLockStatusIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBGetCarLockStatusIntentResponse *v4;

  v4 = -[_INPBGetCarLockStatusIntentResponse init](+[_INPBGetCarLockStatusIntentResponse allocWithZone:](_INPBGetCarLockStatusIntentResponse, "allocWithZone:", a3), "init");
  if (-[_INPBGetCarLockStatusIntentResponse hasLocked](self, "hasLocked"))
    -[_INPBGetCarLockStatusIntentResponse setLocked:](v4, "setLocked:", -[_INPBGetCarLockStatusIntentResponse locked](self, "locked"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  BOOL v6;
  int locked;

  v4 = a3;
  v6 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[_INPBGetCarLockStatusIntentResponse hasLocked](self, "hasLocked");
    if (v5 == objc_msgSend(v4, "hasLocked"))
    {
      if (!-[_INPBGetCarLockStatusIntentResponse hasLocked](self, "hasLocked")
        || !objc_msgSend(v4, "hasLocked")
        || (locked = self->_locked, locked == objc_msgSend(v4, "locked")))
      {
        v6 = 1;
      }
    }
  }

  return v6;
}

- (unint64_t)hash
{
  if (-[_INPBGetCarLockStatusIntentResponse hasLocked](self, "hasLocked"))
    return 2654435761 * self->_locked;
  else
    return 0;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBGetCarLockStatusIntentResponse hasLocked](self, "hasLocked"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBGetCarLockStatusIntentResponse locked](self, "locked"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("locked"));

  }
  return v3;
}

- (BOOL)locked
{
  return self->_locked;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
