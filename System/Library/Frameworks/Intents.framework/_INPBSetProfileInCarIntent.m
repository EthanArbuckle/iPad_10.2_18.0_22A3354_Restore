@implementation _INPBSetProfileInCarIntent

- (void)setCarName:(id)a3
{
  objc_storeStrong((id *)&self->_carName, a3);
}

- (BOOL)hasCarName
{
  return self->_carName != 0;
}

- (void)setDefaultProfile:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_defaultProfile = a3;
}

- (BOOL)hasDefaultProfile
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDefaultProfile:(BOOL)a3
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

- (void)setProfileName:(id)a3
{
  objc_storeStrong((id *)&self->_profileName, a3);
}

- (BOOL)hasProfileName
{
  return self->_profileName != 0;
}

- (void)setProfileNumber:(id)a3
{
  objc_storeStrong((id *)&self->_profileNumber, a3);
}

- (BOOL)hasProfileNumber
{
  return self->_profileNumber != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetProfileInCarIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[_INPBSetProfileInCarIntent carName](self, "carName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBSetProfileInCarIntent carName](self, "carName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSetProfileInCarIntent hasDefaultProfile](self, "hasDefaultProfile"))
    PBDataWriterWriteBOOLField();
  -[_INPBSetProfileInCarIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBSetProfileInCarIntent intentMetadata](self, "intentMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSetProfileInCarIntent profileName](self, "profileName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBSetProfileInCarIntent profileName](self, "profileName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSetProfileInCarIntent profileNumber](self, "profileNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v13;
  if (v10)
  {
    -[_INPBSetProfileInCarIntent profileNumber](self, "profileNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v11 = v13;
  }

}

- (_INPBSetProfileInCarIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSetProfileInCarIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSetProfileInCarIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSetProfileInCarIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSetProfileInCarIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBSetProfileInCarIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSetProfileInCarIntent *v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = -[_INPBSetProfileInCarIntent init](+[_INPBSetProfileInCarIntent allocWithZone:](_INPBSetProfileInCarIntent, "allocWithZone:"), "init");
  v6 = -[_INPBDataString copyWithZone:](self->_carName, "copyWithZone:", a3);
  -[_INPBSetProfileInCarIntent setCarName:](v5, "setCarName:", v6);

  if (-[_INPBSetProfileInCarIntent hasDefaultProfile](self, "hasDefaultProfile"))
    -[_INPBSetProfileInCarIntent setDefaultProfile:](v5, "setDefaultProfile:", -[_INPBSetProfileInCarIntent defaultProfile](self, "defaultProfile"));
  v7 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBSetProfileInCarIntent setIntentMetadata:](v5, "setIntentMetadata:", v7);

  v8 = -[_INPBString copyWithZone:](self->_profileName, "copyWithZone:", a3);
  -[_INPBSetProfileInCarIntent setProfileName:](v5, "setProfileName:", v8);

  v9 = -[_INPBInteger copyWithZone:](self->_profileNumber, "copyWithZone:", a3);
  -[_INPBSetProfileInCarIntent setProfileNumber:](v5, "setProfileNumber:", v9);

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
  int defaultProfile;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  BOOL v29;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_26;
  -[_INPBSetProfileInCarIntent carName](self, "carName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "carName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_25;
  -[_INPBSetProfileInCarIntent carName](self, "carName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSetProfileInCarIntent carName](self, "carName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "carName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_26;
  }
  else
  {

  }
  v12 = -[_INPBSetProfileInCarIntent hasDefaultProfile](self, "hasDefaultProfile");
  if (v12 != objc_msgSend(v4, "hasDefaultProfile"))
    goto LABEL_26;
  if (-[_INPBSetProfileInCarIntent hasDefaultProfile](self, "hasDefaultProfile"))
  {
    if (objc_msgSend(v4, "hasDefaultProfile"))
    {
      defaultProfile = self->_defaultProfile;
      if (defaultProfile != objc_msgSend(v4, "defaultProfile"))
        goto LABEL_26;
    }
  }
  -[_INPBSetProfileInCarIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_25;
  -[_INPBSetProfileInCarIntent intentMetadata](self, "intentMetadata");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBSetProfileInCarIntent intentMetadata](self, "intentMetadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_26;
  }
  else
  {

  }
  -[_INPBSetProfileInCarIntent profileName](self, "profileName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profileName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_25;
  -[_INPBSetProfileInCarIntent profileName](self, "profileName");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_INPBSetProfileInCarIntent profileName](self, "profileName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "profileName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_26;
  }
  else
  {

  }
  -[_INPBSetProfileInCarIntent profileNumber](self, "profileNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profileNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBSetProfileInCarIntent profileNumber](self, "profileNumber");
    v24 = objc_claimAutoreleasedReturnValue();
    if (!v24)
    {

LABEL_29:
      v29 = 1;
      goto LABEL_27;
    }
    v25 = (void *)v24;
    -[_INPBSetProfileInCarIntent profileNumber](self, "profileNumber");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "profileNumber");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if ((v28 & 1) != 0)
      goto LABEL_29;
  }
  else
  {
LABEL_25:

  }
LABEL_26:
  v29 = 0;
LABEL_27:

  return v29;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = -[_INPBDataString hash](self->_carName, "hash");
  if (-[_INPBSetProfileInCarIntent hasDefaultProfile](self, "hasDefaultProfile"))
    v4 = 2654435761 * self->_defaultProfile;
  else
    v4 = 0;
  v5 = v4 ^ v3;
  v6 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  v7 = v5 ^ v6 ^ -[_INPBString hash](self->_profileName, "hash");
  return v7 ^ -[_INPBInteger hash](self->_profileNumber, "hash");
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
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBSetProfileInCarIntent carName](self, "carName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("carName"));

  if (-[_INPBSetProfileInCarIntent hasDefaultProfile](self, "hasDefaultProfile"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBSetProfileInCarIntent defaultProfile](self, "defaultProfile"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("defaultProfile"));

  }
  -[_INPBSetProfileInCarIntent intentMetadata](self, "intentMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dictionaryRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("intentMetadata"));

  -[_INPBSetProfileInCarIntent profileName](self, "profileName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("profileName"));

  -[_INPBSetProfileInCarIntent profileNumber](self, "profileNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("profileNumber"));

  return v3;
}

- (_INPBDataString)carName
{
  return self->_carName;
}

- (BOOL)defaultProfile
{
  return self->_defaultProfile;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBString)profileName
{
  return self->_profileName;
}

- (_INPBInteger)profileNumber
{
  return self->_profileNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileNumber, 0);
  objc_storeStrong((id *)&self->_profileName, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_carName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
