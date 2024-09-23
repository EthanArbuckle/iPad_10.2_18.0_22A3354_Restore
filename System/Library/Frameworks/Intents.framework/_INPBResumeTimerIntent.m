@implementation _INPBResumeTimerIntent

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setResumeMultiple:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_resumeMultiple = a3;
}

- (BOOL)hasResumeMultiple
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasResumeMultiple:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
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
  return _INPBResumeTimerIntentReadFrom(self, (uint64_t)a3);
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
  -[_INPBResumeTimerIntent intentMetadata](self, "intentMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBResumeTimerIntent intentMetadata](self, "intentMetadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBResumeTimerIntent hasResumeMultiple](self, "hasResumeMultiple"))
    PBDataWriterWriteBOOLField();
  -[_INPBResumeTimerIntent targetTimer](self, "targetTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v6)
  {
    -[_INPBResumeTimerIntent targetTimer](self, "targetTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v7 = v9;
  }

}

- (_INPBResumeTimerIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBResumeTimerIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBResumeTimerIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBResumeTimerIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBResumeTimerIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBResumeTimerIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBResumeTimerIntent *v5;
  id v6;
  id v7;

  v5 = -[_INPBResumeTimerIntent init](+[_INPBResumeTimerIntent allocWithZone:](_INPBResumeTimerIntent, "allocWithZone:"), "init");
  v6 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBResumeTimerIntent setIntentMetadata:](v5, "setIntentMetadata:", v6);

  if (-[_INPBResumeTimerIntent hasResumeMultiple](self, "hasResumeMultiple"))
    -[_INPBResumeTimerIntent setResumeMultiple:](v5, "setResumeMultiple:", -[_INPBResumeTimerIntent resumeMultiple](self, "resumeMultiple"));
  v7 = -[_INPBTimer copyWithZone:](self->_targetTimer, "copyWithZone:", a3);
  -[_INPBResumeTimerIntent setTargetTimer:](v5, "setTargetTimer:", v7);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  int resumeMultiple;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  BOOL v19;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_16;
  -[_INPBResumeTimerIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_15;
  -[_INPBResumeTimerIntent intentMetadata](self, "intentMetadata");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBResumeTimerIntent intentMetadata](self, "intentMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_16;
  }
  else
  {

  }
  v12 = -[_INPBResumeTimerIntent hasResumeMultiple](self, "hasResumeMultiple");
  if (v12 != objc_msgSend(v4, "hasResumeMultiple"))
    goto LABEL_16;
  if (-[_INPBResumeTimerIntent hasResumeMultiple](self, "hasResumeMultiple"))
  {
    if (objc_msgSend(v4, "hasResumeMultiple"))
    {
      resumeMultiple = self->_resumeMultiple;
      if (resumeMultiple != objc_msgSend(v4, "resumeMultiple"))
        goto LABEL_16;
    }
  }
  -[_INPBResumeTimerIntent targetTimer](self, "targetTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBResumeTimerIntent targetTimer](self, "targetTimer");
    v14 = objc_claimAutoreleasedReturnValue();
    if (!v14)
    {

LABEL_19:
      v19 = 1;
      goto LABEL_17;
    }
    v15 = (void *)v14;
    -[_INPBResumeTimerIntent targetTimer](self, "targetTimer");
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
  unint64_t v3;
  uint64_t v4;

  v3 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  if (-[_INPBResumeTimerIntent hasResumeMultiple](self, "hasResumeMultiple"))
    v4 = 2654435761 * self->_resumeMultiple;
  else
    v4 = 0;
  return v4 ^ v3 ^ -[_INPBTimer hash](self->_targetTimer, "hash");
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
  -[_INPBResumeTimerIntent intentMetadata](self, "intentMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("intentMetadata"));

  if (-[_INPBResumeTimerIntent hasResumeMultiple](self, "hasResumeMultiple"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBResumeTimerIntent resumeMultiple](self, "resumeMultiple"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("resumeMultiple"));

  }
  -[_INPBResumeTimerIntent targetTimer](self, "targetTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("targetTimer"));

  return v3;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (BOOL)resumeMultiple
{
  return self->_resumeMultiple;
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
