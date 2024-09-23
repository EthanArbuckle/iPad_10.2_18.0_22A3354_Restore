@implementation _INPBStartCallRequestMetadata

- (void)setAppInferred:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_appInferred = a3;
}

- (BOOL)hasAppInferred
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAppInferred:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBStartCallRequestMetadataReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[_INPBStartCallRequestMetadata hasAppInferred](self, "hasAppInferred"))
    PBDataWriterWriteBOOLField();

}

- (_INPBStartCallRequestMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBStartCallRequestMetadata *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBStartCallRequestMetadata *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBStartCallRequestMetadata initWithData:](self, "initWithData:", v6);

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
  -[_INPBStartCallRequestMetadata data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBStartCallRequestMetadata *v4;

  v4 = -[_INPBStartCallRequestMetadata init](+[_INPBStartCallRequestMetadata allocWithZone:](_INPBStartCallRequestMetadata, "allocWithZone:", a3), "init");
  if (-[_INPBStartCallRequestMetadata hasAppInferred](self, "hasAppInferred"))
    -[_INPBStartCallRequestMetadata setAppInferred:](v4, "setAppInferred:", -[_INPBStartCallRequestMetadata appInferred](self, "appInferred"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  BOOL v6;
  int appInferred;

  v4 = a3;
  v6 = 0;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = -[_INPBStartCallRequestMetadata hasAppInferred](self, "hasAppInferred");
    if (v5 == objc_msgSend(v4, "hasAppInferred"))
    {
      if (!-[_INPBStartCallRequestMetadata hasAppInferred](self, "hasAppInferred")
        || !objc_msgSend(v4, "hasAppInferred")
        || (appInferred = self->_appInferred, appInferred == objc_msgSend(v4, "appInferred")))
      {
        v6 = 1;
      }
    }
  }

  return v6;
}

- (unint64_t)hash
{
  if (-[_INPBStartCallRequestMetadata hasAppInferred](self, "hasAppInferred"))
    return 2654435761 * self->_appInferred;
  else
    return 0;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBStartCallRequestMetadata hasAppInferred](self, "hasAppInferred"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBStartCallRequestMetadata appInferred](self, "appInferred"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("appInferred"));

  }
  return v3;
}

- (BOOL)appInferred
{
  return self->_appInferred;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
