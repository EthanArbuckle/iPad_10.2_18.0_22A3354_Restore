@implementation _INPBGetFileInformationIntentResponse

- (void)setEntityName:(id)a3
{
  objc_storeStrong((id *)&self->_entityName, a3);
}

- (BOOL)hasEntityName
{
  return self->_entityName != 0;
}

- (void)setProperty:(id)a3
{
  objc_storeStrong((id *)&self->_property, a3);
}

- (BOOL)hasProperty
{
  return self->_property != 0;
}

- (void)setSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_success = a3;
}

- (BOOL)hasSuccess
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasSuccess:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBGetFileInformationIntentResponseReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_INPBGetFileInformationIntentResponse entityName](self, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBGetFileInformationIntentResponse entityName](self, "entityName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBGetFileInformationIntentResponse property](self, "property");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBGetFileInformationIntentResponse property](self, "property");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBGetFileInformationIntentResponse hasSuccess](self, "hasSuccess"))
    PBDataWriterWriteBOOLField();

}

- (_INPBGetFileInformationIntentResponse)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBGetFileInformationIntentResponse *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBGetFileInformationIntentResponse *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBGetFileInformationIntentResponse *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBGetFileInformationIntentResponse initWithData:](self, "initWithData:", v6);

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
  -[_INPBGetFileInformationIntentResponse data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBGetFileInformationIntentResponse *v5;
  id v6;
  id v7;

  v5 = -[_INPBGetFileInformationIntentResponse init](+[_INPBGetFileInformationIntentResponse allocWithZone:](_INPBGetFileInformationIntentResponse, "allocWithZone:"), "init");
  v6 = -[_INPBString copyWithZone:](self->_entityName, "copyWithZone:", a3);
  -[_INPBGetFileInformationIntentResponse setEntityName:](v5, "setEntityName:", v6);

  v7 = -[_INPBFileProperty copyWithZone:](self->_property, "copyWithZone:", a3);
  -[_INPBGetFileInformationIntentResponse setProperty:](v5, "setProperty:", v7);

  if (-[_INPBGetFileInformationIntentResponse hasSuccess](self, "hasSuccess"))
    -[_INPBGetFileInformationIntentResponse setSuccess:](v5, "setSuccess:", -[_INPBGetFileInformationIntentResponse success](self, "success"));
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  BOOL v17;
  int v19;
  int success;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[_INPBGetFileInformationIntentResponse entityName](self, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[_INPBGetFileInformationIntentResponse entityName](self, "entityName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBGetFileInformationIntentResponse entityName](self, "entityName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[_INPBGetFileInformationIntentResponse property](self, "property");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "property");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  -[_INPBGetFileInformationIntentResponse property](self, "property");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBGetFileInformationIntentResponse property](self, "property");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "property");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_12;
  }
  else
  {

  }
  v19 = -[_INPBGetFileInformationIntentResponse hasSuccess](self, "hasSuccess");
  if (v19 == objc_msgSend(v4, "hasSuccess"))
  {
    if (!-[_INPBGetFileInformationIntentResponse hasSuccess](self, "hasSuccess")
      || !objc_msgSend(v4, "hasSuccess")
      || (success = self->_success, success == objc_msgSend(v4, "success")))
    {
      v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v3 = -[_INPBString hash](self->_entityName, "hash");
  v4 = -[_INPBFileProperty hash](self->_property, "hash");
  if (-[_INPBGetFileInformationIntentResponse hasSuccess](self, "hasSuccess"))
    v5 = 2654435761 * self->_success;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
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
  -[_INPBGetFileInformationIntentResponse entityName](self, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("entityName"));

  -[_INPBGetFileInformationIntentResponse property](self, "property");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("property"));

  if (-[_INPBGetFileInformationIntentResponse hasSuccess](self, "hasSuccess"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBGetFileInformationIntentResponse success](self, "success"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("success"));

  }
  return v3;
}

- (_INPBString)entityName
{
  return self->_entityName;
}

- (_INPBFileProperty)property
{
  return self->_property;
}

- (BOOL)success
{
  return self->_success;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_property, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
