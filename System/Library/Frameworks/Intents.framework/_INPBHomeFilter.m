@implementation _INPBHomeFilter

- (void)setAccessory:(id)a3
{
  objc_storeStrong((id *)&self->_accessory, a3);
}

- (BOOL)hasAccessory
{
  return self->_accessory != 0;
}

- (void)setDeviceType:(int)a3
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
    self->_deviceType = a3;
  }
}

- (BOOL)hasDeviceType
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasDeviceType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (id)deviceTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 < 0x32 && ((0x3FFFFF79FFEEFuLL >> a3) & 1) != 0)
  {
    v3 = off_1E22890F0[a3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsDeviceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIGHTBULB")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SWITCH")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("THERMOSTAT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GARAGE_DOOR_OPENER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAN")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OUTLET")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DOOR_LOCK")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AIR_QUALITY_SENSOR")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BATTERY")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARBON_DIOXIDE_SENSOR")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARBON_MONOXIDE_SENSOR")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTACT_SENSOR")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DOOR")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HUMIDITY_SENSOR")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEAK_SENSOR")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIGHT_SENSOR")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOTION_SENSOR")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OCCUPANCY_SENSOR")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SECURITY_SYSTEM")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SMOKE_SENSOR")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TEMPERATURE_SENSOR")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WINDOW")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHADES")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IP_CAMERA")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MICROPHONE")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPEAKER")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOTORIZED_DOOR")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOTORIZED_WINDOW")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEATER_COOLER")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HUMIDIFIER_DEHUMIDIFIER")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SLAT")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPRINKLER")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VALVE")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAUCET")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOWER")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TELEVISION")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUSTOM")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DOOR_BELL")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AIR_PURIFIER")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FILTER")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APPLE_TV")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAMERA_RECORDING")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SENSOR")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AIRPORT_EXPRESS")) & 1) != 0)
  {
    v4 = 48;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SINK")))
  {
    v4 = 49;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setEntityIdentifiers:(id)a3
{
  NSArray *v4;
  NSArray *entityIdentifiers;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  entityIdentifiers = self->_entityIdentifiers;
  self->_entityIdentifiers = v4;

}

- (void)clearEntityIdentifiers
{
  -[NSArray removeAllObjects](self->_entityIdentifiers, "removeAllObjects");
}

- (void)addEntityIdentifiers:(id)a3
{
  id v4;
  NSArray *entityIdentifiers;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  entityIdentifiers = self->_entityIdentifiers;
  v8 = v4;
  if (!entityIdentifiers)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_entityIdentifiers;
    self->_entityIdentifiers = v6;

    v4 = v8;
    entityIdentifiers = self->_entityIdentifiers;
  }
  -[NSArray addObject:](entityIdentifiers, "addObject:", v4);

}

- (unint64_t)entityIdentifiersCount
{
  return -[NSArray count](self->_entityIdentifiers, "count");
}

- (id)entityIdentifiersAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_entityIdentifiers, "objectAtIndexedSubscript:", a3);
}

- (void)setEntityName:(id)a3
{
  objc_storeStrong((id *)&self->_entityName, a3);
}

- (BOOL)hasEntityName
{
  return self->_entityName != 0;
}

- (void)setEntityType:(int)a3
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
    self->_entityType = a3;
  }
}

- (BOOL)hasEntityType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasEntityType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (id)entityTypeAsString:(int)a3
{
  if (a3 < 7)
    return off_1E22890B8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsEntityType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HOME")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ZONE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ROOM")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GROUP")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SCENE")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRIGGER")) & 1) != 0)
  {
    v4 = 6;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("DEVICE")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (BOOL)hasGroup
{
  return self->_group != 0;
}

- (void)setHasAllQuantifier:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_hasAllQuantifier = a3;
}

- (BOOL)hasHasAllQuantifier
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasHasAllQuantifier:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (BOOL)hasHome
{
  return self->_home != 0;
}

- (void)setIsExcludeFilter:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isExcludeFilter = a3;
}

- (BOOL)hasIsExcludeFilter
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setHasIsExcludeFilter:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (void)setOuterDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_outerDeviceName, a3);
}

- (BOOL)hasOuterDeviceName
{
  return self->_outerDeviceName != 0;
}

- (void)setOuterDeviceType:(int)a3
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
    self->_outerDeviceType = a3;
  }
}

- (BOOL)hasOuterDeviceType
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (void)setHasOuterDeviceType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (id)outerDeviceTypeAsString:(int)a3
{
  __CFString *v3;

  if (a3 < 0x32 && ((0x3FFFFF79FFEEFuLL >> a3) & 1) != 0)
  {
    v3 = off_1E22890F0[a3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsOuterDeviceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIGHTBULB")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SWITCH")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("THERMOSTAT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GARAGE_DOOR_OPENER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAN")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OUTLET")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DOOR_LOCK")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AIR_QUALITY_SENSOR")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BATTERY")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARBON_DIOXIDE_SENSOR")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARBON_MONOXIDE_SENSOR")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTACT_SENSOR")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DOOR")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HUMIDITY_SENSOR")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEAK_SENSOR")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIGHT_SENSOR")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOTION_SENSOR")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OCCUPANCY_SENSOR")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SECURITY_SYSTEM")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SMOKE_SENSOR")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TEMPERATURE_SENSOR")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WINDOW")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHADES")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IP_CAMERA")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MICROPHONE")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPEAKER")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOTORIZED_DOOR")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOTORIZED_WINDOW")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEATER_COOLER")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HUMIDIFIER_DEHUMIDIFIER")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SLAT")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPRINKLER")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VALVE")) & 1) != 0)
  {
    v4 = 37;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAUCET")) & 1) != 0)
  {
    v4 = 38;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOWER")) & 1) != 0)
  {
    v4 = 39;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TELEVISION")) & 1) != 0)
  {
    v4 = 40;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUSTOM")) & 1) != 0)
  {
    v4 = 41;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DOOR_BELL")) & 1) != 0)
  {
    v4 = 42;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AIR_PURIFIER")) & 1) != 0)
  {
    v4 = 43;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FILTER")) & 1) != 0)
  {
    v4 = 44;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APPLE_TV")) & 1) != 0)
  {
    v4 = 45;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CAMERA_RECORDING")) & 1) != 0)
  {
    v4 = 46;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SENSOR")) & 1) != 0)
  {
    v4 = 47;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AIRPORT_EXPRESS")) & 1) != 0)
  {
    v4 = 48;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("SINK")))
  {
    v4 = 49;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setRoom:(id)a3
{
  objc_storeStrong((id *)&self->_room, a3);
}

- (BOOL)hasRoom
{
  return self->_room != 0;
}

- (void)setScene:(id)a3
{
  objc_storeStrong((id *)&self->_scene, a3);
}

- (BOOL)hasScene
{
  return self->_scene != 0;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (BOOL)hasService
{
  return self->_service != 0;
}

- (void)setServiceType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xDF;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 0x20;
    self->_serviceType = a3;
  }
}

- (BOOL)hasServiceType
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setHasServiceType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (id)serviceTypeAsString:(int)a3
{
  if (a3 < 0x27)
    return off_1E2289280[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsServiceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIGHTBULB")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SWITCH")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("THERMOSTAT")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GARAGE_DOOR_OPENER")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAN")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OUTLET")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DOOR_LOCK")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOTORIZED_DOOR")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SECURITY_SYSTEM")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOTORIZED_WINDOW")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHADES")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SPEAKER")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HEATER_COOLER")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HUMIDIFIER_DEHUMIDIFIER")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SLAT")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IRRIGATION_SYSTEM")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("VALVE")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FAUCET")) & 1) != 0)
  {
    v4 = 17;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TELEVISION")) & 1) != 0)
  {
    v4 = 18;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IP_CAMERA")) & 1) != 0)
  {
    v4 = 19;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CUSTOM")) & 1) != 0)
  {
    v4 = 20;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TEMPERATURE_SENSOR")) & 1) != 0)
  {
    v4 = 21;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HUMIDITY_SENSOR")) & 1) != 0)
  {
    v4 = 22;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AIR_QUALITY_SENSOR")) & 1) != 0)
  {
    v4 = 23;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SMOKE_SENSOR")) & 1) != 0)
  {
    v4 = 24;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARBON_MONOXIDE_SENSOR")) & 1) != 0)
  {
    v4 = 25;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CARBON_DIOXIDE_SENSOR")) & 1) != 0)
  {
    v4 = 26;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("CONTACT_SENSOR")) & 1) != 0)
  {
    v4 = 27;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("OCCUPANCY_SENSOR")) & 1) != 0)
  {
    v4 = 28;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("MOTION_SENSOR")) & 1) != 0)
  {
    v4 = 29;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LIGHT_SENSOR")) & 1) != 0)
  {
    v4 = 30;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LEAK_SENSOR")) & 1) != 0)
  {
    v4 = 31;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("BATTERY_SERVICE")) & 1) != 0)
  {
    v4 = 32;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DOOR_BELL")) & 1) != 0)
  {
    v4 = 33;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AIR_PURIFIER")) & 1) != 0)
  {
    v4 = 34;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FILTER_MAINTENANCE")) & 1) != 0)
  {
    v4 = 35;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("APPLE_TV")) & 1) != 0)
  {
    v4 = 36;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AIRPORT_EXPRESS")) & 1) != 0)
  {
    v4 = 37;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CAMERA_RECORDING")))
  {
    v4 = 38;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setSubServiceType:(int)a3
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
    self->_subServiceType = a3;
  }
}

- (BOOL)hasSubServiceType
{
  return (*(_BYTE *)&self->_has >> 6) & 1;
}

- (void)setHasSubServiceType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 64;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xBF | v3;
}

- (id)subServiceTypeAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_1E22893B8[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSubServiceType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GENERIC_VALVE")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IRRIGATION_VALVE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SHOWERHEAD_VALVE")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("FAUCET_VALVE")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (void)setZone:(id)a3
{
  objc_storeStrong((id *)&self->_zone, a3);
}

- (BOOL)hasZone
{
  return self->_zone != 0;
}

- (BOOL)readFrom:(id)a3
{
  return _INPBHomeFilterReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_INPBHomeFilter accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_INPBHomeFilter accessory](self, "accessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBHomeFilter hasDeviceType](self, "hasDeviceType"))
    PBDataWriterWriteInt32Field();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = self->_entityIdentifiers;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v7);
        PBDataWriterWriteStringField();
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v9);
  }

  -[_INPBHomeFilter entityName](self, "entityName", v28);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_INPBHomeFilter entityName](self, "entityName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBHomeFilter hasEntityType](self, "hasEntityType"))
    PBDataWriterWriteInt32Field();
  -[_INPBHomeFilter group](self, "group");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[_INPBHomeFilter group](self, "group");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBHomeFilter hasHasAllQuantifier](self, "hasHasAllQuantifier"))
    PBDataWriterWriteBOOLField();
  -[_INPBHomeFilter home](self, "home");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[_INPBHomeFilter home](self, "home");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBHomeFilter hasIsExcludeFilter](self, "hasIsExcludeFilter"))
    PBDataWriterWriteBOOLField();
  -[_INPBHomeFilter outerDeviceName](self, "outerDeviceName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[_INPBHomeFilter outerDeviceName](self, "outerDeviceName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBHomeFilter hasOuterDeviceType](self, "hasOuterDeviceType"))
    PBDataWriterWriteInt32Field();
  -[_INPBHomeFilter room](self, "room");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[_INPBHomeFilter room](self, "room");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBHomeFilter scene](self, "scene");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[_INPBHomeFilter scene](self, "scene");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBHomeFilter service](self, "service");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[_INPBHomeFilter service](self, "service");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBHomeFilter hasServiceType](self, "hasServiceType"))
    PBDataWriterWriteInt32Field();
  if (-[_INPBHomeFilter hasSubServiceType](self, "hasSubServiceType"))
    PBDataWriterWriteInt32Field();
  -[_INPBHomeFilter zone](self, "zone");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    -[_INPBHomeFilter zone](self, "zone");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (_INPBHomeFilter)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBHomeFilter *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBHomeFilter *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBHomeFilter *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBHomeFilter initWithData:](self, "initWithData:", v6);

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
  -[_INPBHomeFilter data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBHomeFilter *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v5 = -[_INPBHomeFilter init](+[_INPBHomeFilter allocWithZone:](_INPBHomeFilter, "allocWithZone:"), "init");
  v6 = -[_INPBDataString copyWithZone:](self->_accessory, "copyWithZone:", a3);
  -[_INPBHomeFilter setAccessory:](v5, "setAccessory:", v6);

  if (-[_INPBHomeFilter hasDeviceType](self, "hasDeviceType"))
    -[_INPBHomeFilter setDeviceType:](v5, "setDeviceType:", -[_INPBHomeFilter deviceType](self, "deviceType"));
  v7 = (void *)-[NSArray copyWithZone:](self->_entityIdentifiers, "copyWithZone:", a3);
  -[_INPBHomeFilter setEntityIdentifiers:](v5, "setEntityIdentifiers:", v7);

  v8 = -[_INPBDataString copyWithZone:](self->_entityName, "copyWithZone:", a3);
  -[_INPBHomeFilter setEntityName:](v5, "setEntityName:", v8);

  if (-[_INPBHomeFilter hasEntityType](self, "hasEntityType"))
    -[_INPBHomeFilter setEntityType:](v5, "setEntityType:", -[_INPBHomeFilter entityType](self, "entityType"));
  v9 = -[_INPBDataString copyWithZone:](self->_group, "copyWithZone:", a3);
  -[_INPBHomeFilter setGroup:](v5, "setGroup:", v9);

  if (-[_INPBHomeFilter hasHasAllQuantifier](self, "hasHasAllQuantifier"))
    -[_INPBHomeFilter setHasAllQuantifier:](v5, "setHasAllQuantifier:", -[_INPBHomeFilter hasAllQuantifier](self, "hasAllQuantifier"));
  v10 = -[_INPBDataString copyWithZone:](self->_home, "copyWithZone:", a3);
  -[_INPBHomeFilter setHome:](v5, "setHome:", v10);

  if (-[_INPBHomeFilter hasIsExcludeFilter](self, "hasIsExcludeFilter"))
    -[_INPBHomeFilter setIsExcludeFilter:](v5, "setIsExcludeFilter:", -[_INPBHomeFilter isExcludeFilter](self, "isExcludeFilter"));
  v11 = -[_INPBDataString copyWithZone:](self->_outerDeviceName, "copyWithZone:", a3);
  -[_INPBHomeFilter setOuterDeviceName:](v5, "setOuterDeviceName:", v11);

  if (-[_INPBHomeFilter hasOuterDeviceType](self, "hasOuterDeviceType"))
    -[_INPBHomeFilter setOuterDeviceType:](v5, "setOuterDeviceType:", -[_INPBHomeFilter outerDeviceType](self, "outerDeviceType"));
  v12 = -[_INPBDataString copyWithZone:](self->_room, "copyWithZone:", a3);
  -[_INPBHomeFilter setRoom:](v5, "setRoom:", v12);

  v13 = -[_INPBDataString copyWithZone:](self->_scene, "copyWithZone:", a3);
  -[_INPBHomeFilter setScene:](v5, "setScene:", v13);

  v14 = -[_INPBDataString copyWithZone:](self->_service, "copyWithZone:", a3);
  -[_INPBHomeFilter setService:](v5, "setService:", v14);

  if (-[_INPBHomeFilter hasServiceType](self, "hasServiceType"))
    -[_INPBHomeFilter setServiceType:](v5, "setServiceType:", -[_INPBHomeFilter serviceType](self, "serviceType"));
  if (-[_INPBHomeFilter hasSubServiceType](self, "hasSubServiceType"))
    -[_INPBHomeFilter setSubServiceType:](v5, "setSubServiceType:", -[_INPBHomeFilter subServiceType](self, "subServiceType"));
  v15 = -[_INPBDataString copyWithZone:](self->_zone, "copyWithZone:", a3);
  -[_INPBHomeFilter setZone:](v5, "setZone:", v15);

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
  int deviceType;
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
  int v24;
  int entityType;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  int hasAllQuantifier;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  int v38;
  int isExcludeFilter;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  int v45;
  int outerDeviceType;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  int v61;
  int v62;
  int serviceType;
  int v64;
  int subServiceType;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  char v70;
  BOOL v71;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_80;
  -[_INPBHomeFilter accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_79;
  -[_INPBHomeFilter accessory](self, "accessory");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_INPBHomeFilter accessory](self, "accessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_80;
  }
  else
  {

  }
  v12 = -[_INPBHomeFilter hasDeviceType](self, "hasDeviceType");
  if (v12 != objc_msgSend(v4, "hasDeviceType"))
    goto LABEL_80;
  if (-[_INPBHomeFilter hasDeviceType](self, "hasDeviceType"))
  {
    if (objc_msgSend(v4, "hasDeviceType"))
    {
      deviceType = self->_deviceType;
      if (deviceType != objc_msgSend(v4, "deviceType"))
        goto LABEL_80;
    }
  }
  -[_INPBHomeFilter entityIdentifiers](self, "entityIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_79;
  -[_INPBHomeFilter entityIdentifiers](self, "entityIdentifiers");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBHomeFilter entityIdentifiers](self, "entityIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_80;
  }
  else
  {

  }
  -[_INPBHomeFilter entityName](self, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_79;
  -[_INPBHomeFilter entityName](self, "entityName");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_INPBHomeFilter entityName](self, "entityName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_80;
  }
  else
  {

  }
  v24 = -[_INPBHomeFilter hasEntityType](self, "hasEntityType");
  if (v24 != objc_msgSend(v4, "hasEntityType"))
    goto LABEL_80;
  if (-[_INPBHomeFilter hasEntityType](self, "hasEntityType"))
  {
    if (objc_msgSend(v4, "hasEntityType"))
    {
      entityType = self->_entityType;
      if (entityType != objc_msgSend(v4, "entityType"))
        goto LABEL_80;
    }
  }
  -[_INPBHomeFilter group](self, "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "group");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_79;
  -[_INPBHomeFilter group](self, "group");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[_INPBHomeFilter group](self, "group");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "group");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if (!v30)
      goto LABEL_80;
  }
  else
  {

  }
  v31 = -[_INPBHomeFilter hasHasAllQuantifier](self, "hasHasAllQuantifier");
  if (v31 != objc_msgSend(v4, "hasHasAllQuantifier"))
    goto LABEL_80;
  if (-[_INPBHomeFilter hasHasAllQuantifier](self, "hasHasAllQuantifier"))
  {
    if (objc_msgSend(v4, "hasHasAllQuantifier"))
    {
      hasAllQuantifier = self->_hasAllQuantifier;
      if (hasAllQuantifier != objc_msgSend(v4, "hasAllQuantifier"))
        goto LABEL_80;
    }
  }
  -[_INPBHomeFilter home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_79;
  -[_INPBHomeFilter home](self, "home");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[_INPBHomeFilter home](self, "home");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "home");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_80;
  }
  else
  {

  }
  v38 = -[_INPBHomeFilter hasIsExcludeFilter](self, "hasIsExcludeFilter");
  if (v38 != objc_msgSend(v4, "hasIsExcludeFilter"))
    goto LABEL_80;
  if (-[_INPBHomeFilter hasIsExcludeFilter](self, "hasIsExcludeFilter"))
  {
    if (objc_msgSend(v4, "hasIsExcludeFilter"))
    {
      isExcludeFilter = self->_isExcludeFilter;
      if (isExcludeFilter != objc_msgSend(v4, "isExcludeFilter"))
        goto LABEL_80;
    }
  }
  -[_INPBHomeFilter outerDeviceName](self, "outerDeviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "outerDeviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_79;
  -[_INPBHomeFilter outerDeviceName](self, "outerDeviceName");
  v40 = objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    v41 = (void *)v40;
    -[_INPBHomeFilter outerDeviceName](self, "outerDeviceName");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "outerDeviceName");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v42, "isEqual:", v43);

    if (!v44)
      goto LABEL_80;
  }
  else
  {

  }
  v45 = -[_INPBHomeFilter hasOuterDeviceType](self, "hasOuterDeviceType");
  if (v45 != objc_msgSend(v4, "hasOuterDeviceType"))
    goto LABEL_80;
  if (-[_INPBHomeFilter hasOuterDeviceType](self, "hasOuterDeviceType"))
  {
    if (objc_msgSend(v4, "hasOuterDeviceType"))
    {
      outerDeviceType = self->_outerDeviceType;
      if (outerDeviceType != objc_msgSend(v4, "outerDeviceType"))
        goto LABEL_80;
    }
  }
  -[_INPBHomeFilter room](self, "room");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "room");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_79;
  -[_INPBHomeFilter room](self, "room");
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v48 = (void *)v47;
    -[_INPBHomeFilter room](self, "room");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "room");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v49, "isEqual:", v50);

    if (!v51)
      goto LABEL_80;
  }
  else
  {

  }
  -[_INPBHomeFilter scene](self, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_79;
  -[_INPBHomeFilter scene](self, "scene");
  v52 = objc_claimAutoreleasedReturnValue();
  if (v52)
  {
    v53 = (void *)v52;
    -[_INPBHomeFilter scene](self, "scene");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scene");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v54, "isEqual:", v55);

    if (!v56)
      goto LABEL_80;
  }
  else
  {

  }
  -[_INPBHomeFilter service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_79;
  -[_INPBHomeFilter service](self, "service");
  v57 = objc_claimAutoreleasedReturnValue();
  if (v57)
  {
    v58 = (void *)v57;
    -[_INPBHomeFilter service](self, "service");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "service");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v59, "isEqual:", v60);

    if (!v61)
      goto LABEL_80;
  }
  else
  {

  }
  v62 = -[_INPBHomeFilter hasServiceType](self, "hasServiceType");
  if (v62 != objc_msgSend(v4, "hasServiceType"))
    goto LABEL_80;
  if (-[_INPBHomeFilter hasServiceType](self, "hasServiceType"))
  {
    if (objc_msgSend(v4, "hasServiceType"))
    {
      serviceType = self->_serviceType;
      if (serviceType != objc_msgSend(v4, "serviceType"))
        goto LABEL_80;
    }
  }
  v64 = -[_INPBHomeFilter hasSubServiceType](self, "hasSubServiceType");
  if (v64 != objc_msgSend(v4, "hasSubServiceType"))
    goto LABEL_80;
  if (-[_INPBHomeFilter hasSubServiceType](self, "hasSubServiceType"))
  {
    if (objc_msgSend(v4, "hasSubServiceType"))
    {
      subServiceType = self->_subServiceType;
      if (subServiceType != objc_msgSend(v4, "subServiceType"))
        goto LABEL_80;
    }
  }
  -[_INPBHomeFilter zone](self, "zone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_INPBHomeFilter zone](self, "zone");
    v66 = objc_claimAutoreleasedReturnValue();
    if (!v66)
    {

LABEL_83:
      v71 = 1;
      goto LABEL_81;
    }
    v67 = (void *)v66;
    -[_INPBHomeFilter zone](self, "zone");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "zone");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(v68, "isEqual:", v69);

    if ((v70 & 1) != 0)
      goto LABEL_83;
  }
  else
  {
LABEL_79:

  }
LABEL_80:
  v71 = 0;
LABEL_81:

  return v71;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;

  v19 = -[_INPBDataString hash](self->_accessory, "hash");
  if (-[_INPBHomeFilter hasDeviceType](self, "hasDeviceType"))
    v18 = 2654435761 * self->_deviceType;
  else
    v18 = 0;
  v17 = -[NSArray hash](self->_entityIdentifiers, "hash");
  v16 = -[_INPBDataString hash](self->_entityName, "hash");
  if (-[_INPBHomeFilter hasEntityType](self, "hasEntityType"))
    v15 = 2654435761 * self->_entityType;
  else
    v15 = 0;
  v14 = -[_INPBDataString hash](self->_group, "hash");
  if (-[_INPBHomeFilter hasHasAllQuantifier](self, "hasHasAllQuantifier"))
    v13 = 2654435761 * self->_hasAllQuantifier;
  else
    v13 = 0;
  v3 = -[_INPBDataString hash](self->_home, "hash");
  if (-[_INPBHomeFilter hasIsExcludeFilter](self, "hasIsExcludeFilter"))
    v4 = 2654435761 * self->_isExcludeFilter;
  else
    v4 = 0;
  v5 = -[_INPBDataString hash](self->_outerDeviceName, "hash");
  if (-[_INPBHomeFilter hasOuterDeviceType](self, "hasOuterDeviceType"))
    v6 = 2654435761 * self->_outerDeviceType;
  else
    v6 = 0;
  v7 = -[_INPBDataString hash](self->_room, "hash");
  v8 = -[_INPBDataString hash](self->_scene, "hash");
  v9 = -[_INPBDataString hash](self->_service, "hash");
  if (-[_INPBHomeFilter hasServiceType](self, "hasServiceType"))
    v10 = 2654435761 * self->_serviceType;
  else
    v10 = 0;
  if (-[_INPBHomeFilter hasSubServiceType](self, "hasSubServiceType"))
    v11 = 2654435761 * self->_subServiceType;
  else
    v11 = 0;
  return v18 ^ v19 ^ v17 ^ v16 ^ v15 ^ v14 ^ v13 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ -[_INPBDataString hash](self->_zone, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  __CFString *v31;
  uint64_t v32;
  __CFString *v33;
  void *v34;
  void *v35;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_INPBHomeFilter accessory](self, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accessory"));

  if (-[_INPBHomeFilter hasDeviceType](self, "hasDeviceType"))
  {
    v6 = -[_INPBHomeFilter deviceType](self, "deviceType");
    if (v6 < 0x32 && ((0x3FFFFF79FFEEFuLL >> v6) & 1) != 0)
    {
      v7 = off_1E22890F0[v6];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("deviceType"));

  }
  if (self->_entityIdentifiers)
  {
    -[_INPBHomeFilter entityIdentifiers](self, "entityIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("entityIdentifiers"));

  }
  -[_INPBHomeFilter entityName](self, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("entityName"));

  if (-[_INPBHomeFilter hasEntityType](self, "hasEntityType"))
  {
    v12 = -[_INPBHomeFilter entityType](self, "entityType");
    if (v12 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v12);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = off_1E22890B8[v12];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("entityType"));

  }
  -[_INPBHomeFilter group](self, "group");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dictionaryRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("group"));

  if (-[_INPBHomeFilter hasHasAllQuantifier](self, "hasHasAllQuantifier"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBHomeFilter hasAllQuantifier](self, "hasAllQuantifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("hasAllQuantifier"));

  }
  -[_INPBHomeFilter home](self, "home");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dictionaryRepresentation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("home"));

  if (-[_INPBHomeFilter hasIsExcludeFilter](self, "hasIsExcludeFilter"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_INPBHomeFilter isExcludeFilter](self, "isExcludeFilter"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("isExcludeFilter"));

  }
  -[_INPBHomeFilter outerDeviceName](self, "outerDeviceName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dictionaryRepresentation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("outerDeviceName"));

  if (-[_INPBHomeFilter hasOuterDeviceType](self, "hasOuterDeviceType"))
  {
    v22 = -[_INPBHomeFilter outerDeviceType](self, "outerDeviceType");
    if (v22 < 0x32 && ((0x3FFFFF79FFEEFuLL >> v22) & 1) != 0)
    {
      v23 = off_1E22890F0[v22];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v22);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("outerDeviceType"));

  }
  -[_INPBHomeFilter room](self, "room");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "dictionaryRepresentation");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("room"));

  -[_INPBHomeFilter scene](self, "scene");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "dictionaryRepresentation");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("scene"));

  -[_INPBHomeFilter service](self, "service");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dictionaryRepresentation");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("service"));

  if (-[_INPBHomeFilter hasServiceType](self, "hasServiceType"))
  {
    v30 = -[_INPBHomeFilter serviceType](self, "serviceType");
    if (v30 >= 0x27)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v30);
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v31 = off_1E2289280[v30];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, CFSTR("serviceType"));

  }
  if (-[_INPBHomeFilter hasSubServiceType](self, "hasSubServiceType"))
  {
    v32 = -[_INPBHomeFilter subServiceType](self, "subServiceType");
    if ((v32 - 1) >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v32);
      v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = off_1E22893B8[(v32 - 1)];
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("subServiceType"));

  }
  -[_INPBHomeFilter zone](self, "zone");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "dictionaryRepresentation");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("zone"));

  return v3;
}

- (_INPBDataString)accessory
{
  return self->_accessory;
}

- (int)deviceType
{
  return self->_deviceType;
}

- (NSArray)entityIdentifiers
{
  return self->_entityIdentifiers;
}

- (_INPBDataString)entityName
{
  return self->_entityName;
}

- (int)entityType
{
  return self->_entityType;
}

- (_INPBDataString)group
{
  return self->_group;
}

- (BOOL)hasAllQuantifier
{
  return self->_hasAllQuantifier;
}

- (_INPBDataString)home
{
  return self->_home;
}

- (BOOL)isExcludeFilter
{
  return self->_isExcludeFilter;
}

- (_INPBDataString)outerDeviceName
{
  return self->_outerDeviceName;
}

- (int)outerDeviceType
{
  return self->_outerDeviceType;
}

- (_INPBDataString)room
{
  return self->_room;
}

- (_INPBDataString)scene
{
  return self->_scene;
}

- (_INPBDataString)service
{
  return self->_service;
}

- (int)serviceType
{
  return self->_serviceType;
}

- (int)subServiceType
{
  return self->_subServiceType;
}

- (_INPBDataString)zone
{
  return self->_zone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_outerDeviceName, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_entityIdentifiers, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
