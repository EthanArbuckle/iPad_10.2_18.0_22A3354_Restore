@implementation _INPBHomeEntity

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
  void *v3;

  if (a3 < 0x32 && ((0x3FFFFF79FFEEFuLL >> a3) & 1) != 0)
  {
    v3 = *(&off_1E228A458 + a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
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

- (void)setDeviceTypes:(int *)a3 count:(unint64_t)a4
{
  PBRepeatedInt32Set();
}

- (int)deviceTypes
{
  return self->_deviceTypes.list;
}

- (void)clearDeviceTypes
{
  PBRepeatedInt32Clear();
}

- (void)addDeviceTypes:(int)a3
{
  if (a3 != 0x7FFFFFFF)
    PBRepeatedInt32Add();
}

- (unint64_t)deviceTypesCount
{
  return self->_deviceTypes.count;
}

- (int)deviceTypesAtIndex:(unint64_t)a3
{
  return self->_deviceTypes.list[a3];
}

- (id)deviceTypesAsString:(int)a3
{
  void *v3;

  if (a3 < 0x32 && ((0x3FFFFF79FFEEFuLL >> a3) & 1) != 0)
  {
    v3 = *(&off_1E228A458 + a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (int)StringAsDeviceTypes:(id)a3
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

- (void)setEntityIdentifier:(id)a3
{
  NSString *v4;
  NSString *entityIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  entityIdentifier = self->_entityIdentifier;
  self->_entityIdentifier = v4;

}

- (BOOL)hasEntityIdentifier
{
  return self->_entityIdentifier != 0;
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
    return *(&off_1E228A5E8 + a3);
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

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (BOOL)hasHome
{
  return self->_home != 0;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setRoom:(id)a3
{
  objc_storeStrong((id *)&self->_room, a3);
}

- (BOOL)hasRoom
{
  return self->_room != 0;
}

- (void)setSceneType:(int)a3
{
  char has;

  has = (char)self->_has;
  if (a3 == 0x7FFFFFFF)
  {
    *(_BYTE *)&self->_has = has & 0xFB;
  }
  else
  {
    *(_BYTE *)&self->_has = has | 4;
    self->_sceneType = a3;
  }
}

- (BOOL)hasSceneType
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (void)setHasSceneType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (id)sceneTypeAsString:(int)a3
{
  if (a3 < 5)
    return *(&off_1E228A620 + a3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsSceneType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("USER_DEFINED")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("GOOD_MORNING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IM_LEAVING")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("IM_HOME")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("GOOD_NIGHT")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
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

- (void)setZones:(id)a3
{
  NSArray *v4;
  NSArray *zones;

  v4 = (NSArray *)objc_msgSend(a3, "mutableCopy");
  zones = self->_zones;
  self->_zones = v4;

}

- (void)clearZones
{
  -[NSArray removeAllObjects](self->_zones, "removeAllObjects");
}

- (void)addZones:(id)a3
{
  id v4;
  NSArray *zones;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  zones = self->_zones;
  v8 = v4;
  if (!zones)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_zones;
    self->_zones = v6;

    v4 = v8;
    zones = self->_zones;
  }
  -[NSArray addObject:](zones, "addObject:", v4);

}

- (unint64_t)zonesCount
{
  return -[NSArray count](self->_zones, "count");
}

- (id)zonesAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_zones, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _INPBHomeEntityReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_INPBHomeEntity hasDeviceType](self, "hasDeviceType"))
    PBDataWriterWriteInt32Field();
  if (self->_deviceTypes.count)
  {
    v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < self->_deviceTypes.count);
  }
  -[_INPBHomeEntity entityIdentifier](self, "entityIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    PBDataWriterWriteStringField();
  -[_INPBHomeEntity entityName](self, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_INPBHomeEntity entityName](self, "entityName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBHomeEntity hasEntityType](self, "hasEntityType"))
    PBDataWriterWriteInt32Field();
  -[_INPBHomeEntity group](self, "group");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[_INPBHomeEntity group](self, "group");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBHomeEntity home](self, "home");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[_INPBHomeEntity home](self, "home");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBHomeEntity name](self, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[_INPBHomeEntity name](self, "name");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[_INPBHomeEntity room](self, "room");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[_INPBHomeEntity room](self, "room");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  if (-[_INPBHomeEntity hasSceneType](self, "hasSceneType"))
    PBDataWriterWriteInt32Field();
  -[_INPBHomeEntity zone](self, "zone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[_INPBHomeEntity zone](self, "zone");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v19 = self->_zones;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v25;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v25 != v22)
          objc_enumerationMutation(v19);
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v21);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[_INPBHomeEntity clearDeviceTypes](self, "clearDeviceTypes");
  v3.receiver = self;
  v3.super_class = (Class)_INPBHomeEntity;
  -[_INPBHomeEntity dealloc](&v3, sel_dealloc);
}

- (_INPBHomeEntity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _INPBHomeEntity *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  v6 = (_INPBHomeEntity *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8),
        v6 = (_INPBHomeEntity *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = -[_INPBHomeEntity initWithData:](self, "initWithData:", v6);

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
  -[_INPBHomeEntity data](self, "data");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_bytes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _INPBHomeEntity *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  v5 = -[_INPBHomeEntity init](+[_INPBHomeEntity allocWithZone:](_INPBHomeEntity, "allocWithZone:"), "init");
  if (-[_INPBHomeEntity hasDeviceType](self, "hasDeviceType"))
    -[_INPBHomeEntity setDeviceType:](v5, "setDeviceType:", -[_INPBHomeEntity deviceType](self, "deviceType"));
  PBRepeatedInt32Copy();
  v6 = (void *)-[NSString copyWithZone:](self->_entityIdentifier, "copyWithZone:", a3);
  -[_INPBHomeEntity setEntityIdentifier:](v5, "setEntityIdentifier:", v6);

  v7 = -[_INPBDataString copyWithZone:](self->_entityName, "copyWithZone:", a3);
  -[_INPBHomeEntity setEntityName:](v5, "setEntityName:", v7);

  if (-[_INPBHomeEntity hasEntityType](self, "hasEntityType"))
    -[_INPBHomeEntity setEntityType:](v5, "setEntityType:", -[_INPBHomeEntity entityType](self, "entityType"));
  v8 = -[_INPBDataString copyWithZone:](self->_group, "copyWithZone:", a3);
  -[_INPBHomeEntity setGroup:](v5, "setGroup:", v8);

  v9 = -[_INPBDataString copyWithZone:](self->_home, "copyWithZone:", a3);
  -[_INPBHomeEntity setHome:](v5, "setHome:", v9);

  v10 = -[_INPBString copyWithZone:](self->_name, "copyWithZone:", a3);
  -[_INPBHomeEntity setName:](v5, "setName:", v10);

  v11 = -[_INPBDataString copyWithZone:](self->_room, "copyWithZone:", a3);
  -[_INPBHomeEntity setRoom:](v5, "setRoom:", v11);

  if (-[_INPBHomeEntity hasSceneType](self, "hasSceneType"))
    -[_INPBHomeEntity setSceneType:](v5, "setSceneType:", -[_INPBHomeEntity sceneType](self, "sceneType"));
  v12 = -[_INPBDataString copyWithZone:](self->_zone, "copyWithZone:", a3);
  -[_INPBHomeEntity setZone:](v5, "setZone:", v12);

  v13 = (void *)-[NSArray copyWithZone:](self->_zones, "copyWithZone:", a3);
  -[_INPBHomeEntity setZones:](v5, "setZones:", v13);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  int deviceType;
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
  int v18;
  int v19;
  int entityType;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  int v41;
  int sceneType;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  char v52;
  BOOL v53;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_55;
  v5 = -[_INPBHomeEntity hasDeviceType](self, "hasDeviceType");
  if (v5 != objc_msgSend(v4, "hasDeviceType"))
    goto LABEL_55;
  if (-[_INPBHomeEntity hasDeviceType](self, "hasDeviceType"))
  {
    if (objc_msgSend(v4, "hasDeviceType"))
    {
      deviceType = self->_deviceType;
      if (deviceType != objc_msgSend(v4, "deviceType"))
        goto LABEL_55;
    }
  }
  if (!PBRepeatedInt32IsEqual())
    goto LABEL_55;
  -[_INPBHomeEntity entityIdentifier](self, "entityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_54;
  -[_INPBHomeEntity entityIdentifier](self, "entityIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_INPBHomeEntity entityIdentifier](self, "entityIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if (!v13)
      goto LABEL_55;
  }
  else
  {

  }
  -[_INPBHomeEntity entityName](self, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_54;
  -[_INPBHomeEntity entityName](self, "entityName");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    -[_INPBHomeEntity entityName](self, "entityName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entityName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if (!v18)
      goto LABEL_55;
  }
  else
  {

  }
  v19 = -[_INPBHomeEntity hasEntityType](self, "hasEntityType");
  if (v19 != objc_msgSend(v4, "hasEntityType"))
    goto LABEL_55;
  if (-[_INPBHomeEntity hasEntityType](self, "hasEntityType"))
  {
    if (objc_msgSend(v4, "hasEntityType"))
    {
      entityType = self->_entityType;
      if (entityType != objc_msgSend(v4, "entityType"))
        goto LABEL_55;
    }
  }
  -[_INPBHomeEntity group](self, "group");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "group");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_54;
  -[_INPBHomeEntity group](self, "group");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    -[_INPBHomeEntity group](self, "group");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "group");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if (!v25)
      goto LABEL_55;
  }
  else
  {

  }
  -[_INPBHomeEntity home](self, "home");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "home");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_54;
  -[_INPBHomeEntity home](self, "home");
  v26 = objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v27 = (void *)v26;
    -[_INPBHomeEntity home](self, "home");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "home");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isEqual:", v29);

    if (!v30)
      goto LABEL_55;
  }
  else
  {

  }
  -[_INPBHomeEntity name](self, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_54;
  -[_INPBHomeEntity name](self, "name");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    v32 = (void *)v31;
    -[_INPBHomeEntity name](self, "name");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_55;
  }
  else
  {

  }
  -[_INPBHomeEntity room](self, "room");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "room");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_54;
  -[_INPBHomeEntity room](self, "room");
  v36 = objc_claimAutoreleasedReturnValue();
  if (v36)
  {
    v37 = (void *)v36;
    -[_INPBHomeEntity room](self, "room");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "room");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v38, "isEqual:", v39);

    if (!v40)
      goto LABEL_55;
  }
  else
  {

  }
  v41 = -[_INPBHomeEntity hasSceneType](self, "hasSceneType");
  if (v41 != objc_msgSend(v4, "hasSceneType"))
    goto LABEL_55;
  if (-[_INPBHomeEntity hasSceneType](self, "hasSceneType"))
  {
    if (objc_msgSend(v4, "hasSceneType"))
    {
      sceneType = self->_sceneType;
      if (sceneType != objc_msgSend(v4, "sceneType"))
        goto LABEL_55;
    }
  }
  -[_INPBHomeEntity zone](self, "zone");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) == (v8 != 0))
    goto LABEL_54;
  -[_INPBHomeEntity zone](self, "zone");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[_INPBHomeEntity zone](self, "zone");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "zone");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_55;
  }
  else
  {

  }
  -[_INPBHomeEntity zones](self, "zones");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zones");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v7 == 0) != (v8 != 0))
  {
    -[_INPBHomeEntity zones](self, "zones");
    v48 = objc_claimAutoreleasedReturnValue();
    if (!v48)
    {

LABEL_58:
      v53 = 1;
      goto LABEL_56;
    }
    v49 = (void *)v48;
    -[_INPBHomeEntity zones](self, "zones");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "zones");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if ((v52 & 1) != 0)
      goto LABEL_58;
  }
  else
  {
LABEL_54:

  }
LABEL_55:
  v53 = 0;
LABEL_56:

  return v53;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  unint64_t v13;
  uint64_t v15;

  if (-[_INPBHomeEntity hasDeviceType](self, "hasDeviceType"))
    v15 = 2654435761 * self->_deviceType;
  else
    v15 = 0;
  v3 = PBRepeatedInt32Hash();
  v4 = -[NSString hash](self->_entityIdentifier, "hash");
  v5 = -[_INPBDataString hash](self->_entityName, "hash");
  if (-[_INPBHomeEntity hasEntityType](self, "hasEntityType"))
    v6 = 2654435761 * self->_entityType;
  else
    v6 = 0;
  v7 = -[_INPBDataString hash](self->_group, "hash");
  v8 = -[_INPBDataString hash](self->_home, "hash");
  v9 = -[_INPBString hash](self->_name, "hash");
  v10 = -[_INPBDataString hash](self->_room, "hash");
  if (-[_INPBHomeEntity hasSceneType](self, "hasSceneType"))
    v11 = 2654435761 * self->_sceneType;
  else
    v11 = 0;
  v12 = v3 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  v13 = v10 ^ v11 ^ -[_INPBDataString hash](self->_zone, "hash");
  return v12 ^ v13 ^ -[NSArray hash](self->_zones, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSArray *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[_INPBHomeEntity hasDeviceType](self, "hasDeviceType"))
  {
    v4 = -[_INPBHomeEntity deviceType](self, "deviceType");
    if (v4 < 0x32 && ((0x3FFFFF79FFEEFuLL >> v4) & 1) != 0)
    {
      v5 = *(&off_1E228A458 + v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("deviceType"));

  }
  if (self->_deviceTypes.count)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[_INPBHomeEntity deviceTypesCount](self, "deviceTypesCount"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[_INPBHomeEntity deviceTypesCount](self, "deviceTypesCount"))
    {
      v7 = 0;
      do
      {
        v8 = self->_deviceTypes.list[v7];
        if (v8 < 0x32 && ((0x3FFFFF79FFEEFuLL >> v8) & 1) != 0)
        {
          v9 = *(&off_1E228A458 + v8);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_deviceTypes.list[v7]);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v6, "addObject:", v9);

        ++v7;
      }
      while (v7 < -[_INPBHomeEntity deviceTypesCount](self, "deviceTypesCount"));
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("deviceTypes"));

  }
  if (self->_entityIdentifier)
  {
    -[_INPBHomeEntity entityIdentifier](self, "entityIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("entityIdentifier"));

  }
  -[_INPBHomeEntity entityName](self, "entityName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dictionaryRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("entityName"));

  if (-[_INPBHomeEntity hasEntityType](self, "hasEntityType"))
  {
    v14 = -[_INPBHomeEntity entityType](self, "entityType");
    if (v14 >= 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = *(&off_1E228A5E8 + v14);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("entityType"));

  }
  -[_INPBHomeEntity group](self, "group");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dictionaryRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("group"));

  -[_INPBHomeEntity home](self, "home");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dictionaryRepresentation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("home"));

  -[_INPBHomeEntity name](self, "name");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "dictionaryRepresentation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("name"));

  -[_INPBHomeEntity room](self, "room");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "dictionaryRepresentation");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("room"));

  if (-[_INPBHomeEntity hasSceneType](self, "hasSceneType"))
  {
    v24 = -[_INPBHomeEntity sceneType](self, "sceneType");
    if (v24 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = *(&off_1E228A620 + v24);
    }
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("sceneType"));

  }
  -[_INPBHomeEntity zone](self, "zone");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "dictionaryRepresentation");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("zone"));

  if (-[NSArray count](self->_zones, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v29 = self->_zones;
    v30 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v37;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v37 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "dictionaryRepresentation");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v34);

        }
        v31 = -[NSArray countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      }
      while (v31);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v28, CFSTR("zones"));
  }
  return v3;
}

- (int)deviceType
{
  return self->_deviceType;
}

- (NSString)entityIdentifier
{
  return self->_entityIdentifier;
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

- (_INPBDataString)home
{
  return self->_home;
}

- (_INPBString)name
{
  return self->_name;
}

- (_INPBDataString)room
{
  return self->_room;
}

- (int)sceneType
{
  return self->_sceneType;
}

- (_INPBDataString)zone
{
  return self->_zone;
}

- (NSArray)zones
{
  return self->_zones;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zones, 0);
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

+ (Class)zonesType
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
