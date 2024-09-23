@implementation _INPBSleepAlarmAttribute

- (void)setBedtime:(id)a3
{
  objc_storeStrong((id *)&self->_bedtime, a3);
}

- (BOOL)hasBedtime
{
  return self->_bedtime != 0;
}

- (void)setOverride:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_override = a3;
}

- (BOOL)hasOverride
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasOverride:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSleepAlarmAttributeReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[_INPBSleepAlarmAttribute bedtime](self, "bedtime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBSleepAlarmAttribute bedtime](self, "bedtime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSleepAlarmAttribute hasOverride](self, "hasOverride"))
    PBDataWriterWriteBOOLField();

}

- (_INPBSleepAlarmAttribute)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSleepAlarmAttribute *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSleepAlarmAttribute *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSleepAlarmAttribute *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSleepAlarmAttribute initWithData:](self, "initWithData:", v6);

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
  -[_INPBSleepAlarmAttribute data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSleepAlarmAttribute *v5;
  id v6;

  v5 = -[_INPBSleepAlarmAttribute init](+[_INPBSleepAlarmAttribute allocWithZone:](_INPBSleepAlarmAttribute, "allocWithZone:"), "init");
  v6 = -[_INPBDateTime copyWithZone:](self->_bedtime, "copyWithZone:", a3);
  -[_INPBSleepAlarmAttribute setBedtime:](v5, "setBedtime:", v6);

  if (-[_INPBSleepAlarmAttribute hasOverride](self, "hasOverride"))
    -[_INPBSleepAlarmAttribute setOverride:](v5, "setOverride:", -[_INPBSleepAlarmAttribute override](self, "override"));
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  BOOL v14;
  int override;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_9;
  -[_INPBSleepAlarmAttribute bedtime](self, "bedtime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bedtime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBSleepAlarmAttribute bedtime](self, "bedtime");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[_INPBSleepAlarmAttribute bedtime](self, "bedtime");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bedtime");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_9;
    }
    else
    {

    }
    v13 = -[_INPBSleepAlarmAttribute hasOverride](self, "hasOverride");
    if (v13 == objc_msgSend(v4, "hasOverride"))
    {
      if (!-[_INPBSleepAlarmAttribute hasOverride](self, "hasOverride")
        || !objc_msgSend(v4, "hasOverride")
        || (override = self->_override, override == objc_msgSend(v4, "override")))
      {
        v14 = 1;
        goto LABEL_10;
      }
    }
  }
  else
  {

  }
LABEL_9:
  v14 = 0;
LABEL_10:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[_INPBDateTime hash](self->_bedtime, "hash");
  if (-[_INPBSleepAlarmAttribute hasOverride](self, "hasOverride"))
    v4 = 2654435761 * self->_override;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBSleepAlarmAttribute bedtime](self, "bedtime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("bedtime"));

  if (-[_INPBSleepAlarmAttribute hasOverride](self, "hasOverride"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBSleepAlarmAttribute override](self, "override"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("override"));

  }
  return v3;
}

- (_INPBDateTime)bedtime
{
  return self->_bedtime;
}

- (BOOL)override
{
  return self->_override;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bedtime, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
