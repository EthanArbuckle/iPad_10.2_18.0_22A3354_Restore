@implementation _INPBSettingMetadata

- (void)setSettingId:(id)a3
{
  NSString *v4;
  NSString *settingId;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  settingId = self->_settingId;
  self->_settingId = v4;

}

- (BOOL)hasSettingId
{
  return self->_settingId != 0;
}

- (void)setTargetApp:(id)a3
{
  objc_storeStrong((id *)&self->_targetApp, a3);
}

- (BOOL)hasTargetApp
{
  return self->_targetApp != 0;
}

- (void)setTargetDevice:(id)a3
{
  objc_storeStrong((id *)&self->_targetDevice, a3);
}

- (BOOL)hasTargetDevice
{
  return self->_targetDevice != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSettingMetadataReadFrom(self, (uint64_t)a3);
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
  -[_INPBSettingMetadata settingId](self, "settingId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[_INPBSettingMetadata targetApp](self, "targetApp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBSettingMetadata targetApp](self, "targetApp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSettingMetadata targetDevice](self, "targetDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBSettingMetadata targetDevice](self, "targetDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBSettingMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSettingMetadata *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSettingMetadata *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSettingMetadata *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSettingMetadata initWithData:](self, "initWithData:", v6);

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
  -[_INPBSettingMetadata data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSettingMetadata *v5;
  void *v6;
  id v7;
  id v8;

  v5 = -[_INPBSettingMetadata init](+[_INPBSettingMetadata allocWithZone:](_INPBSettingMetadata, "allocWithZone:"), "init");
  v6 = (void *)-[NSString copyWithZone:](self->_settingId, "copyWithZone:", a3);
  -[_INPBSettingMetadata setSettingId:](v5, "setSettingId:", v6);

  v7 = -[_INPBAppIdentifier copyWithZone:](self->_targetApp, "copyWithZone:", a3);
  -[_INPBSettingMetadata setTargetApp:](v5, "setTargetApp:", v7);

  v8 = -[_INPBDevice copyWithZone:](self->_targetDevice, "copyWithZone:", a3);
  -[_INPBSettingMetadata setTargetDevice:](v5, "setTargetDevice:", v8);

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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  BOOL v22;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  -[_INPBSettingMetadata settingId](self, "settingId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "settingId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBSettingMetadata settingId](self, "settingId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSettingMetadata settingId](self, "settingId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "settingId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBSettingMetadata targetApp](self, "targetApp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetApp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_16;
  -[_INPBSettingMetadata targetApp](self, "targetApp");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_INPBSettingMetadata targetApp](self, "targetApp");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetApp");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_17;
  }
  else
  {

  }
  -[_INPBSettingMetadata targetDevice](self, "targetDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBSettingMetadata targetDevice](self, "targetDevice");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!v17)
    {

LABEL_20:
      v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    -[_INPBSettingMetadata targetDevice](self, "targetDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if ((v21 & 1) != 0)
      goto LABEL_20;
  }
  else
  {
LABEL_16:

  }
LABEL_17:
  v22 = 0;
LABEL_18:

  return v22;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_settingId, "hash");
  v4 = -[_INPBAppIdentifier hash](self->_targetApp, "hash") ^ v3;
  return v4 ^ -[_INPBDevice hash](self->_targetDevice, "hash");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_settingId)
  {
    -[_INPBSettingMetadata settingId](self, "settingId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("settingId"));

  }
  -[_INPBSettingMetadata targetApp](self, "targetApp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("targetApp"));

  -[_INPBSettingMetadata targetDevice](self, "targetDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dictionaryRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("targetDevice"));

  return v3;
}

- (NSString)settingId
{
  return self->_settingId;
}

- (_INPBAppIdentifier)targetApp
{
  return self->_targetApp;
}

- (_INPBDevice)targetDevice
{
  return self->_targetDevice;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetDevice, 0);
  objc_storeStrong((id *)&self->_targetApp, 0);
  objc_storeStrong((id *)&self->_settingId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
