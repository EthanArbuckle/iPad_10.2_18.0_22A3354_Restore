@implementation _INPBDeleteTimerIntent

- (void)setDeleteMultiple:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_deleteMultiple = a3;
}

- (BOOL)hasDeleteMultiple
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDeleteMultiple:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setTargetTimer:(id)a3
{
  objc_storeStrong((id *)&self->_targetTimer, a3);
}

- (BOOL)hasTargetTimer
{
  return self->_targetTimer != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBDeleteTimerIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (-[_INPBDeleteTimerIntent hasDeleteMultiple](self, "hasDeleteMultiple"))
    PBDataWriterWriteBOOLField();
  -[_INPBDeleteTimerIntent intentMetadata](self, "intentMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBDeleteTimerIntent intentMetadata](self, "intentMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBDeleteTimerIntent targetTimer](self, "targetTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v6)
  {
    -[_INPBDeleteTimerIntent targetTimer](self, "targetTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v7 = v9;
  }

}

- (_INPBDeleteTimerIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBDeleteTimerIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBDeleteTimerIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBDeleteTimerIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBDeleteTimerIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBDeleteTimerIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBDeleteTimerIntent *v5;
  id v6;
  id v7;

  v5 = -[_INPBDeleteTimerIntent init](+[_INPBDeleteTimerIntent allocWithZone:](_INPBDeleteTimerIntent, "allocWithZone:"), "init");
  if (-[_INPBDeleteTimerIntent hasDeleteMultiple](self, "hasDeleteMultiple"))
    -[_INPBDeleteTimerIntent setDeleteMultiple:](v5, "setDeleteMultiple:", -[_INPBDeleteTimerIntent deleteMultiple](self, "deleteMultiple"));
  v6 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBDeleteTimerIntent setIntentMetadata:](v5, "setIntentMetadata:", v6);

  v7 = -[_INPBTimer copyWithZone:](self->_targetTimer, "copyWithZone:", a3);
  -[_INPBDeleteTimerIntent setTargetTimer:](v5, "setTargetTimer:", v7);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int deleteMultiple;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  v5 = -[_INPBDeleteTimerIntent hasDeleteMultiple](self, "hasDeleteMultiple");
  if (v5 != objc_msgSend(v4, "hasDeleteMultiple"))
    goto LABEL_16;
  if (-[_INPBDeleteTimerIntent hasDeleteMultiple](self, "hasDeleteMultiple"))
  {
    if (objc_msgSend(v4, "hasDeleteMultiple"))
    {
      deleteMultiple = self->_deleteMultiple;
      if (deleteMultiple != objc_msgSend(v4, "deleteMultiple"))
        goto LABEL_16;
    }
  }
  -[_INPBDeleteTimerIntent intentMetadata](self, "intentMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_15;
  -[_INPBDeleteTimerIntent intentMetadata](self, "intentMetadata");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBDeleteTimerIntent intentMetadata](self, "intentMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_16;
  }
  else
  {

  }
  -[_INPBDeleteTimerIntent targetTimer](self, "targetTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBDeleteTimerIntent targetTimer](self, "targetTimer");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {

LABEL_19:
      v19 = 1;
      goto LABEL_17;
    }
    v15 = (void *)v14;
    -[_INPBDeleteTimerIntent targetTimer](self, "targetTimer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetTimer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) != 0)
      goto LABEL_19;
  }
  else
  {
LABEL_15:

  }
LABEL_16:
  v19 = 0;
LABEL_17:

  return v19;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;

  if (-[_INPBDeleteTimerIntent hasDeleteMultiple](self, "hasDeleteMultiple"))
    v3 = 2654435761 * self->_deleteMultiple;
  else
    v3 = 0;
  v4 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash") ^ v3;
  return v4 ^ -[_INPBTimer hash](self->_targetTimer, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBDeleteTimerIntent hasDeleteMultiple](self, "hasDeleteMultiple"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBDeleteTimerIntent deleteMultiple](self, "deleteMultiple"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("deleteMultiple"));

  }
  -[_INPBDeleteTimerIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dictionaryRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("intentMetadata"));

  -[_INPBDeleteTimerIntent targetTimer](self, "targetTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("targetTimer"));

  return v3;
}

- (BOOL)deleteMultiple
{
  return self->_deleteMultiple;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBTimer)targetTimer
{
  return self->_targetTimer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetTimer, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
