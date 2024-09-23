@implementation _INPBSetClimateSettingsInCarIntent

- (void)setAirCirculationMode:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFE;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 1;
    self->_airCirculationMode = a3;
  }
}

- (BOOL)hasAirCirculationMode
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasAirCirculationMode:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)airCirculationModeAsString:(int)a3
{
  __CFString *v3;

  if (a3 == 1)
    return CFSTR("FRESH_AIR");
  if (a3 == 2)
  {
    v3 = CFSTR("RECIRCULATE_AIR");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsAirCirculationMode:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = 1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FRESH_AIR")) & 1) == 0)
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("RECIRCULATE_AIR")))
      v4 = 2;
    else
      v4 = 1;
  }

  return v4;
}

- (void)setCarName:(id)a3
{
  objc_storeStrong((id *)&self->_carName, a3);
}

- (BOOL)hasCarName
{
  return self->_carName != 0;
}

- (void)setClimateZone:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFD;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 2;
    self->_climateZone = a3;
  }
}

- (BOOL)hasClimateZone
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasClimateZone:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)climateZoneAsString:(int)a3
{
  int v3;
  __CFString *v4;

  v3 = a3 - 1;
  if ((a3 - 1) < 0x16 && ((0x3F8383u >> v3) & 1) != 0)
  {
    v4 = off_1E228CDC8[v3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsClimateZone:(id)a3
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

- (void)setEnableAirConditioner:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_enableAirConditioner = a3;
}

- (BOOL)hasEnableAirConditioner
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasEnableAirConditioner:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)setEnableAutoMode:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_enableAutoMode = a3;
}

- (BOOL)hasEnableAutoMode
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasEnableAutoMode:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)setEnableClimateControl:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_enableClimateControl = a3;
}

- (BOOL)hasEnableClimateControl
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasEnableClimateControl:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (void)setEnableFan:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_enableFan = a3;
}

- (BOOL)hasEnableFan
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasEnableFan:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (void)setFanSpeedIndex:(id)a3
{
  objc_storeStrong((id *)&self->_fanSpeedIndex, a3);
}

- (BOOL)hasFanSpeedIndex
{
  return self->_fanSpeedIndex != 0;
}

- (void)setFanSpeedPercentage:(id)a3
{
  objc_storeStrong((id *)&self->_fanSpeedPercentage, a3);
}

- (BOOL)hasFanSpeedPercentage
{
  return self->_fanSpeedPercentage != 0;
}

- (void)setIntentMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_intentMetadata, a3);
}

- (BOOL)hasIntentMetadata
{
  return self->_intentMetadata != 0;
}

- (void)setRelativeFanSpeedSetting:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xBF;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 0x40;
    self->_relativeFanSpeedSetting = a3;
  }
}

- (BOOL)hasRelativeFanSpeedSetting
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasRelativeFanSpeedSetting:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (id)relativeFanSpeedSettingAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E228CE78[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRelativeFanSpeedSetting:(id)a3
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

- (void)setRelativeTemperatureSetting:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0x7F;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 0x80;
    self->_relativeTemperatureSetting = a3;
  }
}

- (BOOL)hasRelativeTemperatureSetting
{
  return *(_BYTE *)&self->_has >> 7;
}

- (void)setHasRelativeTemperatureSetting:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 0x80;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = v3 & 0x80 | *(_BYTE *)&self->_has & 0x7F;
}

- (id)relativeTemperatureSettingAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E228CE78[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsRelativeTemperatureSetting:(id)a3
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

- (void)setTemperature:(id)a3
{
  objc_storeStrong((id *)&self->_temperature, a3);
}

- (BOOL)hasTemperature
{
  return self->_temperature != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBSetClimateSettingsInCarIntentReadFrom(self, (uint64_t)a3);
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
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  if (-[_INPBSetClimateSettingsInCarIntent hasAirCirculationMode](self, "hasAirCirculationMode"))
    PBDataWriterWriteInt32Field();
  -[_INPBSetClimateSettingsInCarIntent carName](self, "carName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_INPBSetClimateSettingsInCarIntent carName](self, "carName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSetClimateSettingsInCarIntent hasClimateZone](self, "hasClimateZone"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBSetClimateSettingsInCarIntent hasEnableAirConditioner](self, "hasEnableAirConditioner"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBSetClimateSettingsInCarIntent hasEnableAutoMode](self, "hasEnableAutoMode"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBSetClimateSettingsInCarIntent hasEnableClimateControl](self, "hasEnableClimateControl"))
    PBDataWriterWriteBOOLField();
  if (-[_INPBSetClimateSettingsInCarIntent hasEnableFan](self, "hasEnableFan"))
    PBDataWriterWriteBOOLField();
  -[_INPBSetClimateSettingsInCarIntent fanSpeedIndex](self, "fanSpeedIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[_INPBSetClimateSettingsInCarIntent fanSpeedIndex](self, "fanSpeedIndex");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSetClimateSettingsInCarIntent fanSpeedPercentage](self, "fanSpeedPercentage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_INPBSetClimateSettingsInCarIntent fanSpeedPercentage](self, "fanSpeedPercentage");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBSetClimateSettingsInCarIntent intentMetadata](self, "intentMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_INPBSetClimateSettingsInCarIntent intentMetadata](self, "intentMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBSetClimateSettingsInCarIntent hasRelativeFanSpeedSetting](self, "hasRelativeFanSpeedSetting"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBSetClimateSettingsInCarIntent hasRelativeTemperatureSetting](self, "hasRelativeTemperatureSetting"))
    PBDataWriterWriteInt32Field();
  -[_INPBSetClimateSettingsInCarIntent temperature](self, "temperature");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v15;
  if (v12)
  {
    -[_INPBSetClimateSettingsInCarIntent temperature](self, "temperature");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

    v13 = v15;
  }

}

- (_INPBSetClimateSettingsInCarIntent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBSetClimateSettingsInCarIntent *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBSetClimateSettingsInCarIntent *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBSetClimateSettingsInCarIntent *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBSetClimateSettingsInCarIntent initWithData:](self, "initWithData:", v6);

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
  -[_INPBSetClimateSettingsInCarIntent data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBSetClimateSettingsInCarIntent *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;

  v5 = -[_INPBSetClimateSettingsInCarIntent init](+[_INPBSetClimateSettingsInCarIntent allocWithZone:](_INPBSetClimateSettingsInCarIntent, "allocWithZone:"), "init");
  if (-[_INPBSetClimateSettingsInCarIntent hasAirCirculationMode](self, "hasAirCirculationMode"))
    -[_INPBSetClimateSettingsInCarIntent setAirCirculationMode:](v5, "setAirCirculationMode:", -[_INPBSetClimateSettingsInCarIntent airCirculationMode](self, "airCirculationMode"));
  v6 = -[_INPBDataString copyWithZone:](self->_carName, "copyWithZone:", a3);
  -[_INPBSetClimateSettingsInCarIntent setCarName:](v5, "setCarName:", v6);

  if (-[_INPBSetClimateSettingsInCarIntent hasClimateZone](self, "hasClimateZone"))
    -[_INPBSetClimateSettingsInCarIntent setClimateZone:](v5, "setClimateZone:", -[_INPBSetClimateSettingsInCarIntent climateZone](self, "climateZone"));
  if (-[_INPBSetClimateSettingsInCarIntent hasEnableAirConditioner](self, "hasEnableAirConditioner"))
    -[_INPBSetClimateSettingsInCarIntent setEnableAirConditioner:](v5, "setEnableAirConditioner:", -[_INPBSetClimateSettingsInCarIntent enableAirConditioner](self, "enableAirConditioner"));
  if (-[_INPBSetClimateSettingsInCarIntent hasEnableAutoMode](self, "hasEnableAutoMode"))
    -[_INPBSetClimateSettingsInCarIntent setEnableAutoMode:](v5, "setEnableAutoMode:", -[_INPBSetClimateSettingsInCarIntent enableAutoMode](self, "enableAutoMode"));
  if (-[_INPBSetClimateSettingsInCarIntent hasEnableClimateControl](self, "hasEnableClimateControl"))
    -[_INPBSetClimateSettingsInCarIntent setEnableClimateControl:](v5, "setEnableClimateControl:", -[_INPBSetClimateSettingsInCarIntent enableClimateControl](self, "enableClimateControl"));
  if (-[_INPBSetClimateSettingsInCarIntent hasEnableFan](self, "hasEnableFan"))
    -[_INPBSetClimateSettingsInCarIntent setEnableFan:](v5, "setEnableFan:", -[_INPBSetClimateSettingsInCarIntent enableFan](self, "enableFan"));
  v7 = -[_INPBInteger copyWithZone:](self->_fanSpeedIndex, "copyWithZone:", a3);
  -[_INPBSetClimateSettingsInCarIntent setFanSpeedIndex:](v5, "setFanSpeedIndex:", v7);

  v8 = -[_INPBDouble copyWithZone:](self->_fanSpeedPercentage, "copyWithZone:", a3);
  -[_INPBSetClimateSettingsInCarIntent setFanSpeedPercentage:](v5, "setFanSpeedPercentage:", v8);

  v9 = -[_INPBIntentMetadata copyWithZone:](self->_intentMetadata, "copyWithZone:", a3);
  -[_INPBSetClimateSettingsInCarIntent setIntentMetadata:](v5, "setIntentMetadata:", v9);

  if (-[_INPBSetClimateSettingsInCarIntent hasRelativeFanSpeedSetting](self, "hasRelativeFanSpeedSetting"))
    -[_INPBSetClimateSettingsInCarIntent setRelativeFanSpeedSetting:](v5, "setRelativeFanSpeedSetting:", -[_INPBSetClimateSettingsInCarIntent relativeFanSpeedSetting](self, "relativeFanSpeedSetting"));
  if (-[_INPBSetClimateSettingsInCarIntent hasRelativeTemperatureSetting](self, "hasRelativeTemperatureSetting"))
    -[_INPBSetClimateSettingsInCarIntent setRelativeTemperatureSetting:](v5, "setRelativeTemperatureSetting:", -[_INPBSetClimateSettingsInCarIntent relativeTemperatureSetting](self, "relativeTemperatureSetting"));
  v10 = -[_INPBTemperature copyWithZone:](self->_temperature, "copyWithZone:", a3);
  -[_INPBSetClimateSettingsInCarIntent setTemperature:](v5, "setTemperature:", v10);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int airCirculationMode;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int climateZone;
  int v16;
  int enableAirConditioner;
  int v18;
  int enableAutoMode;
  int v20;
  int enableClimateControl;
  int v22;
  int enableFan;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  int v39;
  int relativeFanSpeedSetting;
  int v41;
  int relativeTemperatureSetting;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  BOOL v48;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_59;
  v5 = -[_INPBSetClimateSettingsInCarIntent hasAirCirculationMode](self, "hasAirCirculationMode");
  if (v5 != objc_msgSend(v4, "hasAirCirculationMode"))
    goto LABEL_59;
  if (-[_INPBSetClimateSettingsInCarIntent hasAirCirculationMode](self, "hasAirCirculationMode"))
  {
    if (objc_msgSend(v4, "hasAirCirculationMode"))
    {
      airCirculationMode = self->_airCirculationMode;
      if (airCirculationMode != objc_msgSend(v4, "airCirculationMode"))
        goto LABEL_59;
    }
  }
  -[_INPBSetClimateSettingsInCarIntent carName](self, "carName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "carName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_58;
  -[_INPBSetClimateSettingsInCarIntent carName](self, "carName");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBSetClimateSettingsInCarIntent carName](self, "carName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "carName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_59;
  }
  else
  {

  }
  v14 = -[_INPBSetClimateSettingsInCarIntent hasClimateZone](self, "hasClimateZone");
  if (v14 != objc_msgSend(v4, "hasClimateZone"))
    goto LABEL_59;
  if (-[_INPBSetClimateSettingsInCarIntent hasClimateZone](self, "hasClimateZone"))
  {
    if (objc_msgSend(v4, "hasClimateZone"))
    {
      climateZone = self->_climateZone;
      if (climateZone != objc_msgSend(v4, "climateZone"))
        goto LABEL_59;
    }
  }
  v16 = -[_INPBSetClimateSettingsInCarIntent hasEnableAirConditioner](self, "hasEnableAirConditioner");
  if (v16 != objc_msgSend(v4, "hasEnableAirConditioner"))
    goto LABEL_59;
  if (-[_INPBSetClimateSettingsInCarIntent hasEnableAirConditioner](self, "hasEnableAirConditioner"))
  {
    if (objc_msgSend(v4, "hasEnableAirConditioner"))
    {
      enableAirConditioner = self->_enableAirConditioner;
      if (enableAirConditioner != objc_msgSend(v4, "enableAirConditioner"))
        goto LABEL_59;
    }
  }
  v18 = -[_INPBSetClimateSettingsInCarIntent hasEnableAutoMode](self, "hasEnableAutoMode");
  if (v18 != objc_msgSend(v4, "hasEnableAutoMode"))
    goto LABEL_59;
  if (-[_INPBSetClimateSettingsInCarIntent hasEnableAutoMode](self, "hasEnableAutoMode"))
  {
    if (objc_msgSend(v4, "hasEnableAutoMode"))
    {
      enableAutoMode = self->_enableAutoMode;
      if (enableAutoMode != objc_msgSend(v4, "enableAutoMode"))
        goto LABEL_59;
    }
  }
  v20 = -[_INPBSetClimateSettingsInCarIntent hasEnableClimateControl](self, "hasEnableClimateControl");
  if (v20 != objc_msgSend(v4, "hasEnableClimateControl"))
    goto LABEL_59;
  if (-[_INPBSetClimateSettingsInCarIntent hasEnableClimateControl](self, "hasEnableClimateControl"))
  {
    if (objc_msgSend(v4, "hasEnableClimateControl"))
    {
      enableClimateControl = self->_enableClimateControl;
      if (enableClimateControl != objc_msgSend(v4, "enableClimateControl"))
        goto LABEL_59;
    }
  }
  v22 = -[_INPBSetClimateSettingsInCarIntent hasEnableFan](self, "hasEnableFan");
  if (v22 != objc_msgSend(v4, "hasEnableFan"))
    goto LABEL_59;
  if (-[_INPBSetClimateSettingsInCarIntent hasEnableFan](self, "hasEnableFan"))
  {
    if (objc_msgSend(v4, "hasEnableFan"))
    {
      enableFan = self->_enableFan;
      if (enableFan != objc_msgSend(v4, "enableFan"))
        goto LABEL_59;
    }
  }
  -[_INPBSetClimateSettingsInCarIntent fanSpeedIndex](self, "fanSpeedIndex");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fanSpeedIndex");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_58;
  -[_INPBSetClimateSettingsInCarIntent fanSpeedIndex](self, "fanSpeedIndex");
  v24 = objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    v25 = (void *)v24;
    -[_INPBSetClimateSettingsInCarIntent fanSpeedIndex](self, "fanSpeedIndex");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fanSpeedIndex");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v26, "isEqual:", v27);

    if (!v28)
      goto LABEL_59;
  }
  else
  {

  }
  -[_INPBSetClimateSettingsInCarIntent fanSpeedPercentage](self, "fanSpeedPercentage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fanSpeedPercentage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_58;
  -[_INPBSetClimateSettingsInCarIntent fanSpeedPercentage](self, "fanSpeedPercentage");
  v29 = objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = (void *)v29;
    -[_INPBSetClimateSettingsInCarIntent fanSpeedPercentage](self, "fanSpeedPercentage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fanSpeedPercentage");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v31, "isEqual:", v32);

    if (!v33)
      goto LABEL_59;
  }
  else
  {

  }
  -[_INPBSetClimateSettingsInCarIntent intentMetadata](self, "intentMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentMetadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_58;
  -[_INPBSetClimateSettingsInCarIntent intentMetadata](self, "intentMetadata");
  v34 = objc_claimAutoreleasedReturnValue();
  if (v34)
  {
    v35 = (void *)v34;
    -[_INPBSetClimateSettingsInCarIntent intentMetadata](self, "intentMetadata");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "intentMetadata");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v36, "isEqual:", v37);

    if (!v38)
      goto LABEL_59;
  }
  else
  {

  }
  v39 = -[_INPBSetClimateSettingsInCarIntent hasRelativeFanSpeedSetting](self, "hasRelativeFanSpeedSetting");
  if (v39 != objc_msgSend(v4, "hasRelativeFanSpeedSetting"))
    goto LABEL_59;
  if (-[_INPBSetClimateSettingsInCarIntent hasRelativeFanSpeedSetting](self, "hasRelativeFanSpeedSetting"))
  {
    if (objc_msgSend(v4, "hasRelativeFanSpeedSetting"))
    {
      relativeFanSpeedSetting = self->_relativeFanSpeedSetting;
      if (relativeFanSpeedSetting != objc_msgSend(v4, "relativeFanSpeedSetting"))
        goto LABEL_59;
    }
  }
  v41 = -[_INPBSetClimateSettingsInCarIntent hasRelativeTemperatureSetting](self, "hasRelativeTemperatureSetting");
  if (v41 != objc_msgSend(v4, "hasRelativeTemperatureSetting"))
    goto LABEL_59;
  if (-[_INPBSetClimateSettingsInCarIntent hasRelativeTemperatureSetting](self, "hasRelativeTemperatureSetting"))
  {
    if (objc_msgSend(v4, "hasRelativeTemperatureSetting"))
    {
      relativeTemperatureSetting = self->_relativeTemperatureSetting;
      if (relativeTemperatureSetting != objc_msgSend(v4, "relativeTemperatureSetting"))
        goto LABEL_59;
    }
  }
  -[_INPBSetClimateSettingsInCarIntent temperature](self, "temperature");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "temperature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBSetClimateSettingsInCarIntent temperature](self, "temperature");
    v43 = objc_claimAutoreleasedReturnValue();
    if (!v43)
    {

LABEL_62:
      v48 = 1;
      goto LABEL_60;
    }
    v44 = (void *)v43;
    -[_INPBSetClimateSettingsInCarIntent temperature](self, "temperature");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "temperature");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if ((v47 & 1) != 0)
      goto LABEL_62;
  }
  else
  {
LABEL_58:

  }
LABEL_59:
  v48 = 0;
LABEL_60:

  return v48;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;

  if (-[_INPBSetClimateSettingsInCarIntent hasAirCirculationMode](self, "hasAirCirculationMode"))
    v15 = 2654435761 * self->_airCirculationMode;
  else
    v15 = 0;
  v14 = -[_INPBDataString hash](self->_carName, "hash");
  if (-[_INPBSetClimateSettingsInCarIntent hasClimateZone](self, "hasClimateZone"))
    v13 = 2654435761 * self->_climateZone;
  else
    v13 = 0;
  if (-[_INPBSetClimateSettingsInCarIntent hasEnableAirConditioner](self, "hasEnableAirConditioner"))
    v3 = 2654435761 * self->_enableAirConditioner;
  else
    v3 = 0;
  if (-[_INPBSetClimateSettingsInCarIntent hasEnableAutoMode](self, "hasEnableAutoMode"))
    v4 = 2654435761 * self->_enableAutoMode;
  else
    v4 = 0;
  if (-[_INPBSetClimateSettingsInCarIntent hasEnableClimateControl](self, "hasEnableClimateControl"))
    v5 = 2654435761 * self->_enableClimateControl;
  else
    v5 = 0;
  if (-[_INPBSetClimateSettingsInCarIntent hasEnableFan](self, "hasEnableFan"))
    v6 = 2654435761 * self->_enableFan;
  else
    v6 = 0;
  v7 = -[_INPBInteger hash](self->_fanSpeedIndex, "hash");
  v8 = -[_INPBDouble hash](self->_fanSpeedPercentage, "hash");
  v9 = -[_INPBIntentMetadata hash](self->_intentMetadata, "hash");
  if (-[_INPBSetClimateSettingsInCarIntent hasRelativeFanSpeedSetting](self, "hasRelativeFanSpeedSetting"))
    v10 = 2654435761 * self->_relativeFanSpeedSetting;
  else
    v10 = 0;
  if (-[_INPBSetClimateSettingsInCarIntent hasRelativeTemperatureSetting](self, "hasRelativeTemperatureSetting"))
    v11 = 2654435761 * self->_relativeTemperatureSetting;
  else
    v11 = 0;
  return v14 ^ v15 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[_INPBTemperature hash](self->_temperature, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  __CFString *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  uint64_t v23;
  __CFString *v24;
  void *v25;
  void *v26;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBSetClimateSettingsInCarIntent hasAirCirculationMode](self, "hasAirCirculationMode"))
  {
    v4 = -[_INPBSetClimateSettingsInCarIntent airCirculationMode](self, "airCirculationMode");
    if ((_DWORD)v4 == 1)
    {
      v5 = CFSTR("FRESH_AIR");
    }
    else if ((_DWORD)v4 == 2)
    {
      v5 = CFSTR("RECIRCULATE_AIR");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("airCirculationMode"));

  }
  -[_INPBSetClimateSettingsInCarIntent carName](self, "carName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("carName"));

  if (-[_INPBSetClimateSettingsInCarIntent hasClimateZone](self, "hasClimateZone"))
  {
    v8 = -[_INPBSetClimateSettingsInCarIntent climateZone](self, "climateZone");
    v9 = v8 - 1;
    if ((v8 - 1) < 0x16 && ((0x3F8383u >> v9) & 1) != 0)
    {
      v10 = off_1E228CDC8[v9];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("climateZone"));

  }
  if (-[_INPBSetClimateSettingsInCarIntent hasEnableAirConditioner](self, "hasEnableAirConditioner"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBSetClimateSettingsInCarIntent enableAirConditioner](self, "enableAirConditioner"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("enableAirConditioner"));

  }
  if (-[_INPBSetClimateSettingsInCarIntent hasEnableAutoMode](self, "hasEnableAutoMode"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBSetClimateSettingsInCarIntent enableAutoMode](self, "enableAutoMode"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("enableAutoMode"));

  }
  if (-[_INPBSetClimateSettingsInCarIntent hasEnableClimateControl](self, "hasEnableClimateControl"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBSetClimateSettingsInCarIntent enableClimateControl](self, "enableClimateControl"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("enableClimateControl"));

  }
  if (-[_INPBSetClimateSettingsInCarIntent hasEnableFan](self, "hasEnableFan"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBSetClimateSettingsInCarIntent enableFan](self, "enableFan"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("enableFan"));

  }
  -[_INPBSetClimateSettingsInCarIntent fanSpeedIndex](self, "fanSpeedIndex");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dictionaryRepresentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("fanSpeedIndex"));

  -[_INPBSetClimateSettingsInCarIntent fanSpeedPercentage](self, "fanSpeedPercentage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dictionaryRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("fanSpeedPercentage"));

  -[_INPBSetClimateSettingsInCarIntent intentMetadata](self, "intentMetadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dictionaryRepresentation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("intentMetadata"));

  if (-[_INPBSetClimateSettingsInCarIntent hasRelativeFanSpeedSetting](self, "hasRelativeFanSpeedSetting"))
  {
    v21 = -[_INPBSetClimateSettingsInCarIntent relativeFanSpeedSetting](self, "relativeFanSpeedSetting");
    if ((v21 - 1) >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v21);
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = off_1E228CE78[(v21 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v22, CFSTR("relativeFanSpeedSetting"));

  }
  if (-[_INPBSetClimateSettingsInCarIntent hasRelativeTemperatureSetting](self, "hasRelativeTemperatureSetting"))
  {
    v23 = -[_INPBSetClimateSettingsInCarIntent relativeTemperatureSetting](self, "relativeTemperatureSetting");
    if ((v23 - 1) >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v23);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = off_1E228CE78[(v23 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("relativeTemperatureSetting"));

  }
  -[_INPBSetClimateSettingsInCarIntent temperature](self, "temperature");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "dictionaryRepresentation");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("temperature"));

  return v3;
}

- (int)airCirculationMode
{
  return self->_airCirculationMode;
}

- (_INPBDataString)carName
{
  return self->_carName;
}

- (int)climateZone
{
  return self->_climateZone;
}

- (BOOL)enableAirConditioner
{
  return self->_enableAirConditioner;
}

- (BOOL)enableAutoMode
{
  return self->_enableAutoMode;
}

- (BOOL)enableClimateControl
{
  return self->_enableClimateControl;
}

- (BOOL)enableFan
{
  return self->_enableFan;
}

- (_INPBInteger)fanSpeedIndex
{
  return self->_fanSpeedIndex;
}

- (_INPBDouble)fanSpeedPercentage
{
  return self->_fanSpeedPercentage;
}

- (_INPBIntentMetadata)intentMetadata
{
  return self->_intentMetadata;
}

- (int)relativeFanSpeedSetting
{
  return self->_relativeFanSpeedSetting;
}

- (int)relativeTemperatureSetting
{
  return self->_relativeTemperatureSetting;
}

- (_INPBTemperature)temperature
{
  return self->_temperature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temperature, 0);
  objc_storeStrong((id *)&self->_intentMetadata, 0);
  objc_storeStrong((id *)&self->_fanSpeedPercentage, 0);
  objc_storeStrong((id *)&self->_fanSpeedIndex, 0);
  objc_storeStrong((id *)&self->_carName, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
