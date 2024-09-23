@implementation _INPBSetSeatSettingsInCarIntent

- (void)setCarName:(id)a3
{
  objc_storeStrong((id *)&self->_carName, a3);
}

- (BOOL)hasCarName
{
  return self->_carName != 0;
}

- (void)setEnableCooling:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_enableCooling = a3;
}

- (BOOL)hasEnableCooling
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasEnableCooling:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setEnableHeating:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_enableHeating = a3;
}

- (BOOL)hasEnableHeating
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasEnableHeating:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (void)setEnableMassage:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_enableMassage = a3;
}

- (BOOL)hasEnableMassage
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasEnableMassage:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setLevel:(id)a3
{
  objc_storeStrong((id *)&self->_level, a3);
}

- (BOOL)hasLevel
{
  return self->_level != 0;
}

- (void)setRelativeLevelSetting:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xF7;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 8;
    self->_relativeLevelSetting = a3;
  }
}

- (BOOL)hasRelativeLevelSetting
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasRelativeLevelSetting:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (id)relativeLevelSettingAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E2292510[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRelativeLevelSetting:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOWEST")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LOWER")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HIGHER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HIGHEST")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setSeat:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xEF;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 0x10;
    self->_seat = a3;
  }
}

- (BOOL)hasSeat
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasSeat:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (id)seatAsString:(int)a3
{
  int v3;
  __CFString *v4;

  v3 = a3 - 1;
  if ((a3 - 1) < 0x16 && ((0x3F8383u >> v3) & 1) != 0)
  {
    v4 = off_1E2292530[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsSeat:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DRIVER")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PASSENGER")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FRONT_LEFT")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FRONT_RIGHT")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FRONT")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REAR_LEFT")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REAR_RIGHT")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("REAR")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("THIRD_ROW_LEFT")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("THIRD_ROW_RIGHT")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("THIRD_ROW")) & 1) != 0)
  {
    v4 = 21;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ALL")))
  {
    v4 = 22;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetSeatSettingsInCarIntentReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[_INPBSetSeatSettingsInCarIntent carName](self, "carName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBSetSeatSettingsInCarIntent carName](self, "carName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSetSeatSettingsInCarIntent hasEnableCooling](self, "hasEnableCooling"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBSetSeatSettingsInCarIntent hasEnableHeating](self, "hasEnableHeating"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBSetSeatSettingsInCarIntent hasEnableMassage](self, "hasEnableMassage"))
    PBDataWriterWriteBOOLField();
  -[_INPBSetSeatSettingsInCarIntent intentMetadata](self, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBSetSeatSettingsInCarIntent intentMetadata](self, "intentMetadata");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSetSeatSettingsInCarIntent level](self, "level");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBSetSeatSettingsInCarIntent level](self, "level");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSetSeatSettingsInCarIntent hasRelativeLevelSetting](self, "hasRelativeLevelSetting"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBSetSeatSettingsInCarIntent hasSeat](self, "hasSeat"))
    PBDataWriterWriteInt32Field();

}

- (_INPBSetSeatSettingsInCarIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSetSeatSettingsInCarIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSetSeatSettingsInCarIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSetSeatSettingsInCarIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSetSeatSettingsInCarIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBSetSeatSettingsInCarIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSetSeatSettingsInCarIntent *v5;
  id v6;
  id v7;
  id v8;

  v5 = -[_INPBSetSeatSettingsInCarIntent init](+[_INPBSetSeatSettingsInCarIntent allocWithZone:](_INPBSetSeatSettingsInCarIntent, "allocWithZone:"), "init");
  v6 = -[_INPBDataString copyWithZone:](self->_carName, "copyWithZone:", a3);
  -[_INPBSetSeatSettingsInCarIntent setCarName:](v5, "setCarName:", v6);

  if (-[_INPBSetSeatSettingsInCarIntent hasEnableCooling](self, "hasEnableCooling"))
    -[_INPBSetSeatSettingsInCarIntent setEnableCooling:](v5, "setEnableCooling:", -[_INPBSetSeatSettingsInCarIntent enableCooling](self, "enableCooling"));
  if (-[_INPBSetSeatSettingsInCarIntent hasEnableHeating](self, "hasEnableHeating"))
    -[_INPBSetSeatSettingsInCarIntent setEnableHeating:](v5, "setEnableHeating:", -[_INPBSetSeatSettingsInCarIntent enableHeating](self, "enableHeating"));
  if (-[_INPBSetSeatSettingsInCarIntent hasEnableMassage](self, "hasEnableMassage"))
    -[_INPBSetSeatSettingsInCarIntent setEnableMassage:](v5, "setEnableMassage:", -[_INPBSetSeatSettingsInCarIntent enableMassage](self, "enableMassage"));
  v7 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBSetSeatSettingsInCarIntent setIntentMetadata:](v5, "setIntentMetadata:", v7);

  v8 = -[_INPBInteger copyWithZone:](self->_level, "copyWithZone:", a3);
  -[_INPBSetSeatSettingsInCarIntent setLevel:](v5, "setLevel:", v8);

  if (-[_INPBSetSeatSettingsInCarIntent hasRelativeLevelSetting](self, "hasRelativeLevelSetting"))
    -[_INPBSetSeatSettingsInCarIntent setRelativeLevelSetting:](v5, "setRelativeLevelSetting:", -[_INPBSetSeatSettingsInCarIntent relativeLevelSetting](self, "relativeLevelSetting"));
  if (-[_INPBSetSeatSettingsInCarIntent hasSeat](self, "hasSeat"))
    -[_INPBSetSeatSettingsInCarIntent setSeat:](v5, "setSeat:", -[_INPBSetSeatSettingsInCarIntent seat](self, "seat"));
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
  int enableCooling;
  int v14;
  int enableHeating;
  int v16;
  int enableMassage;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  BOOL v28;
  int v30;
  int relativeLevelSetting;
  int v32;
  int seat;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  -[_INPBSetSeatSettingsInCarIntent carName](self, "carName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "carName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_28;
  -[_INPBSetSeatSettingsInCarIntent carName](self, "carName");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBSetSeatSettingsInCarIntent carName](self, "carName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "carName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_29;
  }
  else
  {

  }
  v12 = -[_INPBSetSeatSettingsInCarIntent hasEnableCooling](self, "hasEnableCooling");
  if (v12 != objc_msgSend(v4, "hasEnableCooling"))
    goto LABEL_29;
  if (-[_INPBSetSeatSettingsInCarIntent hasEnableCooling](self, "hasEnableCooling"))
  {
    if (objc_msgSend(v4, "hasEnableCooling"))
    {
      enableCooling = self->_enableCooling;
      if (enableCooling != objc_msgSend(v4, "enableCooling"))
        goto LABEL_29;
    }
  }
  v14 = -[_INPBSetSeatSettingsInCarIntent hasEnableHeating](self, "hasEnableHeating");
  if (v14 != objc_msgSend(v4, "hasEnableHeating"))
    goto LABEL_29;
  if (-[_INPBSetSeatSettingsInCarIntent hasEnableHeating](self, "hasEnableHeating"))
  {
    if (objc_msgSend(v4, "hasEnableHeating"))
    {
      enableHeating = self->_enableHeating;
      if (enableHeating != objc_msgSend(v4, "enableHeating"))
        goto LABEL_29;
    }
  }
  v16 = -[_INPBSetSeatSettingsInCarIntent hasEnableMassage](self, "hasEnableMassage");
  if (v16 != objc_msgSend(v4, "hasEnableMassage"))
    goto LABEL_29;
  if (-[_INPBSetSeatSettingsInCarIntent hasEnableMassage](self, "hasEnableMassage"))
  {
    if (objc_msgSend(v4, "hasEnableMassage"))
    {
      enableMassage = self->_enableMassage;
      if (enableMassage != objc_msgSend(v4, "enableMassage"))
        goto LABEL_29;
    }
  }
  -[_INPBSetSeatSettingsInCarIntent intentMetadata](self, "intentMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_28;
  -[_INPBSetSeatSettingsInCarIntent intentMetadata](self, "intentMetadata");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[_INPBSetSeatSettingsInCarIntent intentMetadata](self, "intentMetadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_29;
  }
  else
  {

  }
  -[_INPBSetSeatSettingsInCarIntent level](self, "level");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "level");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_28:

    goto LABEL_29;
  }
  -[_INPBSetSeatSettingsInCarIntent level](self, "level");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[_INPBSetSeatSettingsInCarIntent level](self, "level");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "level");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_29;
  }
  else
  {

  }
  v30 = -[_INPBSetSeatSettingsInCarIntent hasRelativeLevelSetting](self, "hasRelativeLevelSetting");
  if (v30 == objc_msgSend(v4, "hasRelativeLevelSetting"))
  {
    if (!-[_INPBSetSeatSettingsInCarIntent hasRelativeLevelSetting](self, "hasRelativeLevelSetting")
      || !objc_msgSend(v4, "hasRelativeLevelSetting")
      || (relativeLevelSetting = self->_relativeLevelSetting,
          relativeLevelSetting == objc_msgSend(v4, "relativeLevelSetting")))
    {
      v32 = -[_INPBSetSeatSettingsInCarIntent hasSeat](self, "hasSeat");
      if (v32 == objc_msgSend(v4, "hasSeat"))
      {
        if (!-[_INPBSetSeatSettingsInCarIntent hasSeat](self, "hasSeat")
          || !objc_msgSend(v4, "hasSeat")
          || (seat = self->_seat, seat == objc_msgSend(v4, "seat")))
        {
          v28 = 1;
          goto LABEL_30;
        }
      }
    }
  }
LABEL_29:
  v28 = 0;
LABEL_30:

  return v28;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[_INPBDataString hash](self->_carName, "hash");
  if (-[_INPBSetSeatSettingsInCarIntent hasEnableCooling](self, "hasEnableCooling"))
    v4 = 2654435761 * self->_enableCooling;
  else
    v4 = 0;
  if (-[_INPBSetSeatSettingsInCarIntent hasEnableHeating](self, "hasEnableHeating"))
    v5 = 2654435761 * self->_enableHeating;
  else
    v5 = 0;
  if (-[_INPBSetSeatSettingsInCarIntent hasEnableMassage](self, "hasEnableMassage"))
    v6 = 2654435761 * self->_enableMassage;
  else
    v6 = 0;
  v7 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  v8 = -[_INPBInteger hash](self->_level, "hash");
  if (-[_INPBSetSeatSettingsInCarIntent hasRelativeLevelSetting](self, "hasRelativeLevelSetting"))
    v9 = 2654435761 * self->_relativeLevelSetting;
  else
    v9 = 0;
  if (-[_INPBSetSeatSettingsInCarIntent hasSeat](self, "hasSeat"))
    v10 = 2654435761 * self->_seat;
  else
    v10 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10;
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
  uint64_t v13;
  __CFString *v14;
  uint64_t v15;
  int v16;
  __CFString *v17;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBSetSeatSettingsInCarIntent carName](self, "carName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("carName"));

  if (-[_INPBSetSeatSettingsInCarIntent hasEnableCooling](self, "hasEnableCooling"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBSetSeatSettingsInCarIntent enableCooling](self, "enableCooling"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("enableCooling"));

  }
  if (-[_INPBSetSeatSettingsInCarIntent hasEnableHeating](self, "hasEnableHeating"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBSetSeatSettingsInCarIntent enableHeating](self, "enableHeating"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("enableHeating"));

  }
  if (-[_INPBSetSeatSettingsInCarIntent hasEnableMassage](self, "hasEnableMassage"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBSetSeatSettingsInCarIntent enableMassage](self, "enableMassage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("enableMassage"));

  }
  -[_INPBSetSeatSettingsInCarIntent intentMetadata](self, "intentMetadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dictionaryRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("intentMetadata"));

  -[_INPBSetSeatSettingsInCarIntent level](self, "level");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dictionaryRepresentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("level"));

  if (-[_INPBSetSeatSettingsInCarIntent hasRelativeLevelSetting](self, "hasRelativeLevelSetting"))
  {
    v13 = -[_INPBSetSeatSettingsInCarIntent relativeLevelSetting](self, "relativeLevelSetting");
    if ((v13 - 1) >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v13);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E2292510[(v13 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("relativeLevelSetting"));

  }
  if (-[_INPBSetSeatSettingsInCarIntent hasSeat](self, "hasSeat"))
  {
    v15 = -[_INPBSetSeatSettingsInCarIntent seat](self, "seat");
    v16 = v15 - 1;
    if ((v15 - 1) < 0x16 && ((0x3F8383u >> v16) & 1) != 0)
    {
      v17 = off_1E2292530[v16];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v15);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("seat"));

  }
  return v3;
}

- (_INPBDataString)carName
{
  return self->_carName;
}

- (BOOL)enableCooling
{
  return self->_enableCooling;
}

- (BOOL)enableHeating
{
  return self->_enableHeating;
}

- (BOOL)enableMassage
{
  return self->_enableMassage;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (_INPBInteger)level
{
  return self->_level;
}

- (int)relativeLevelSetting
{
  return self->_relativeLevelSetting;
}

- (int)seat
{
  return self->_seat;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_level, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_carName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
