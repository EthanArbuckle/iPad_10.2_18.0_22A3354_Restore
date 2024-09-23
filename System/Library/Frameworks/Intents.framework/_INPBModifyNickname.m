@implementation _INPBModifyNickname

- (void)setIsRemoval:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_isRemoval = a3;
}

- (BOOL)hasIsRemoval
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasIsRemoval:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setTargetNickname:(id)a3
{
  objc_storeStrong((id *)&self->_targetNickname, a3);
}

- (BOOL)hasTargetNickname
{
  return self->_targetNickname != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBModifyNicknameReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[_INPBModifyNickname hasIsRemoval](self, "hasIsRemoval"))
    PBDataWriterWriteBOOLField();
  -[_INPBModifyNickname targetNickname](self, "targetNickname");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (v4)
  {
    -[_INPBModifyNickname targetNickname](self, "targetNickname");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }

}

- (_INPBModifyNickname)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBModifyNickname *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBModifyNickname *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBModifyNickname *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBModifyNickname initWithData:](self, "initWithData:", v6);

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
  -[_INPBModifyNickname data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBModifyNickname *v5;
  id v6;

  v5 = -[_INPBModifyNickname init](+[_INPBModifyNickname allocWithZone:](_INPBModifyNickname, "allocWithZone:"), "init");
  if (-[_INPBModifyNickname hasIsRemoval](self, "hasIsRemoval"))
    -[_INPBModifyNickname setIsRemoval:](v5, "setIsRemoval:", -[_INPBModifyNickname isRemoval](self, "isRemoval"));
  v6 = -[_INPBString copyWithZone:](self->_targetNickname, "copyWithZone:", a3);
  -[_INPBModifyNickname setTargetNickname:](v5, "setTargetNickname:", v6);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int isRemoval;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[_INPBModifyNickname hasIsRemoval](self, "hasIsRemoval");
    if (v5 == objc_msgSend(v4, "hasIsRemoval"))
    {
      if (!-[_INPBModifyNickname hasIsRemoval](self, "hasIsRemoval")
        || !objc_msgSend(v4, "hasIsRemoval")
        || (isRemoval = self->_isRemoval, isRemoval == objc_msgSend(v4, "isRemoval")))
      {
        -[_INPBModifyNickname targetNickname](self, "targetNickname");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "targetNickname");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if ((v7 == 0) != (v8 != 0))
        {
          -[_INPBModifyNickname targetNickname](self, "targetNickname");
          v10 = objc_claimAutoreleasedReturnValue();
          if (!v10)
          {

LABEL_14:
            v15 = 1;
            goto LABEL_12;
          }
          v11 = (void *)v10;
          -[_INPBModifyNickname targetNickname](self, "targetNickname");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "targetNickname");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v12, "isEqual:", v13);

          if ((v14 & 1) != 0)
            goto LABEL_14;
        }
        else
        {

        }
      }
    }
  }
  v15 = 0;
LABEL_12:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;

  if (-[_INPBModifyNickname hasIsRemoval](self, "hasIsRemoval"))
    v3 = 2654435761 * self->_isRemoval;
  else
    v3 = 0;
  return -[_INPBString hash](self->_targetNickname, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBModifyNickname hasIsRemoval](self, "hasIsRemoval"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBModifyNickname isRemoval](self, "isRemoval"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("isRemoval"));

  }
  -[_INPBModifyNickname targetNickname](self, "targetNickname");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("targetNickname"));

  return v3;
}

- (BOOL)isRemoval
{
  return self->_isRemoval;
}

- (_INPBString)targetNickname
{
  return self->_targetNickname;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetNickname, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
