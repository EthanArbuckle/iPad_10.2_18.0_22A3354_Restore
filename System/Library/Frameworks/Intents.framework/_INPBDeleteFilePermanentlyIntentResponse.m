@implementation _INPBDeleteFilePermanentlyIntentResponse

- (void)setConfirm:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_confirm = a3;
}

- (BOOL)hasConfirm
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasConfirm:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_success = a3;
}

- (BOOL)hasSuccess
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasSuccess:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDeleteFilePermanentlyIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_INPBDeleteFilePermanentlyIntentResponse hasConfirm](self, "hasConfirm"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBDeleteFilePermanentlyIntentResponse hasSuccess](self, "hasSuccess"))
    PBDataWriterWriteBOOLField();

}

- (_INPBDeleteFilePermanentlyIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBDeleteFilePermanentlyIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBDeleteFilePermanentlyIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBDeleteFilePermanentlyIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBDeleteFilePermanentlyIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBDeleteFilePermanentlyIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBDeleteFilePermanentlyIntentResponse *v4;

  v4 = -[_INPBDeleteFilePermanentlyIntentResponse init](+[_INPBDeleteFilePermanentlyIntentResponse allocWithZone:](_INPBDeleteFilePermanentlyIntentResponse, "allocWithZone:", a3), "init");
  if (-[_INPBDeleteFilePermanentlyIntentResponse hasConfirm](self, "hasConfirm"))
    -[_INPBDeleteFilePermanentlyIntentResponse setConfirm:](v4, "setConfirm:", -[_INPBDeleteFilePermanentlyIntentResponse confirm](self, "confirm"));
  if (-[_INPBDeleteFilePermanentlyIntentResponse hasSuccess](self, "hasSuccess"))
    -[_INPBDeleteFilePermanentlyIntentResponse setSuccess:](v4, "setSuccess:", -[_INPBDeleteFilePermanentlyIntentResponse success](self, "success"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int confirm;
  int v7;
  BOOL v8;
  int success;

  v4 = a3;
  v8 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[_INPBDeleteFilePermanentlyIntentResponse hasConfirm](self, "hasConfirm");
    if (v5 == objc_msgSend(v4, "hasConfirm"))
    {
      if (!-[_INPBDeleteFilePermanentlyIntentResponse hasConfirm](self, "hasConfirm")
        || !objc_msgSend(v4, "hasConfirm")
        || (confirm = self->_confirm, confirm == objc_msgSend(v4, "confirm")))
      {
        v7 = -[_INPBDeleteFilePermanentlyIntentResponse hasSuccess](self, "hasSuccess");
        if (v7 == objc_msgSend(v4, "hasSuccess"))
        {
          if (!-[_INPBDeleteFilePermanentlyIntentResponse hasSuccess](self, "hasSuccess")
            || !objc_msgSend(v4, "hasSuccess")
            || (success = self->_success, success == objc_msgSend(v4, "success")))
          {
            v8 = 1;
          }
        }
      }
    }
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;

  if (-[_INPBDeleteFilePermanentlyIntentResponse hasConfirm](self, "hasConfirm"))
    v3 = 2654435761 * self->_confirm;
  else
    v3 = 0;
  if (-[_INPBDeleteFilePermanentlyIntentResponse hasSuccess](self, "hasSuccess"))
    v4 = 2654435761 * self->_success;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBDeleteFilePermanentlyIntentResponse hasConfirm](self, "hasConfirm"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBDeleteFilePermanentlyIntentResponse confirm](self, "confirm"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("confirm"));

  }
  if (-[_INPBDeleteFilePermanentlyIntentResponse hasSuccess](self, "hasSuccess"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBDeleteFilePermanentlyIntentResponse success](self, "success"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("success"));

  }
  return v3;
}

- (BOOL)confirm
{
  return self->_confirm;
}

- (BOOL)success
{
  return self->_success;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
