@implementation INHomeFilter

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  -[INHomeFilter entityName](self, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (!-[INHomeFilter outerDeviceType](self, "outerDeviceType"))
    {
      -[INHomeFilter outerDeviceName](self, "outerDeviceName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[INHomeFilter outerDeviceName](self, "outerDeviceName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
      -[INHomeFilter group](self, "group");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[INHomeFilter group](self, "group");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
      -[INHomeFilter room](self, "room");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[INHomeFilter room](self, "room");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
      -[INHomeFilter zone](self, "zone");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[INHomeFilter zone](self, "zone");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
      -[INHomeFilter home](self, "home");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[INHomeFilter home](self, "home");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
      if (-[INHomeFilter entityType](self, "entityType"))
      {
        INHomeEntityTypeGetLocalizedName(-[INHomeFilter entityType](self, "entityType"), v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      }
    }
    v9 = 0;
    goto LABEL_6;
  }
  -[INHomeFilter entityName](self, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_3:
  v8 = v7;
  objc_msgSend(v7, "_intents_readableTitleWithLocalizer:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v9;
}

- (INHomeFilter)initWithEntityIdentifiers:(id)a3 entityName:(id)a4 entityType:(int64_t)a5 outerDeviceType:(int64_t)a6 outerDeviceName:(id)a7 deviceType:(int64_t)a8 home:(id)a9 zone:(id)a10 group:(id)a11 room:(id)a12 isExcludeFilter:(BOOL)a13 hasAllQuantifier:(BOOL)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  INHomeFilter *v26;
  uint64_t v27;
  NSArray *entityIdentifiers;
  uint64_t v29;
  INSpeakableString *entityName;
  uint64_t v31;
  INSpeakableString *outerDeviceName;
  uint64_t v33;
  INSpeakableString *home;
  uint64_t v35;
  INSpeakableString *zone;
  uint64_t v37;
  INSpeakableString *group;
  uint64_t v39;
  INSpeakableString *room;
  objc_super v43;

  v19 = a3;
  v20 = a4;
  v21 = a7;
  v22 = a9;
  v23 = a10;
  v24 = a11;
  v25 = a12;
  v43.receiver = self;
  v43.super_class = (Class)INHomeFilter;
  v26 = -[INHomeFilter init](&v43, sel_init);
  if (v26)
  {
    v27 = objc_msgSend(v19, "copy");
    entityIdentifiers = v26->_entityIdentifiers;
    v26->_entityIdentifiers = (NSArray *)v27;

    v29 = objc_msgSend(v20, "copy");
    entityName = v26->_entityName;
    v26->_entityName = (INSpeakableString *)v29;

    v26->_entityType = a5;
    v26->_outerDeviceType = a6;
    v31 = objc_msgSend(v21, "copy");
    outerDeviceName = v26->_outerDeviceName;
    v26->_outerDeviceName = (INSpeakableString *)v31;

    v26->_deviceType = a8;
    v33 = objc_msgSend(v22, "copy");
    home = v26->_home;
    v26->_home = (INSpeakableString *)v33;

    v35 = objc_msgSend(v23, "copy");
    zone = v26->_zone;
    v26->_zone = (INSpeakableString *)v35;

    v37 = objc_msgSend(v24, "copy");
    group = v26->_group;
    v26->_group = (INSpeakableString *)v37;

    v39 = objc_msgSend(v25, "copy");
    room = v26->_room;
    v26->_room = (INSpeakableString *)v39;

    v26->_isExcludeFilter = a13;
    v26->_hasAllQuantifier = a14;
  }

  return v26;
}

- (INHomeFilter)initWithEntityIdentifiers:(id)a3 home:(id)a4 scene:(id)a5 homeZone:(id)a6 group:(id)a7 room:(id)a8 accessory:(id)a9 service:(id)a10 entityType:(int64_t)a11 serviceType:(int64_t)a12 subServiceType:(int64_t)a13
{
  id v13;

  v13 = a10;
  if (!a10)
    v13 = a5;
  return -[INHomeFilter initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:](self, "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:", a3, v13, a11, 0, 0, 0);
}

- (INHomeFilter)initWithEntityIdentifiers:(id)a3 home:(id)a4 scene:(id)a5 homeZone:(id)a6 group:(id)a7 room:(id)a8 accessory:(id)a9 service:(id)a10 entityType:(int64_t)a11 serviceType:(int64_t)a12 subServiceType:(int64_t)a13 isExcludeFilter:(BOOL)a14
{
  id v14;

  v14 = a10;
  if (!a10)
    v14 = a5;
  return -[INHomeFilter initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:](self, "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:", a3, v14, a11, 0, 0, 0);
}

- (INHomeFilter)initWithEntityIdentifiers:(id)a3 home:(id)a4 scene:(id)a5 homeZone:(id)a6 group:(id)a7 room:(id)a8 accessory:(id)a9 entityType:(int64_t)a10 serviceType:(int64_t)a11 subServiceType:(int64_t)a12 isExcludeFilter:(BOOL)a13 entityName:(id)a14
{
  id v14;

  v14 = a14;
  if (!a14)
    v14 = a5;
  return -[INHomeFilter initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:](self, "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:", a3, v14, a10, 0, 0, 0);
}

- (INHomeFilter)initWithEntityIdentifiers:(id)a3 entityName:(id)a4 entityType:(int64_t)a5 outerDeviceType:(int64_t)a6 innerDeviceName:(id)a7 innerDeviceType:(int64_t)a8 home:(id)a9 zone:(id)a10 group:(id)a11 room:(id)a12 isExcludeFilter:(BOOL)a13
{
  uint64_t v14;

  LOWORD(v14) = a13;
  return -[INHomeFilter initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:](self, "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, v14);
}

- (INHomeFilter)initWithEntityIdentifiers:(id)a3 entityName:(id)a4 entityType:(int64_t)a5 outerDeviceType:(int64_t)a6 outerDeviceName:(id)a7 deviceType:(int64_t)a8 home:(id)a9 zone:(id)a10 group:(id)a11 room:(id)a12 isExcludeFilter:(BOOL)a13
{
  uint64_t v14;

  LOWORD(v14) = a13;
  return -[INHomeFilter initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:](self, "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:", a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, v14);
}

- (int64_t)serviceType
{
  int64_t v2;

  v2 = -[INHomeFilter outerDeviceType](self, "outerDeviceType");
  if ((unint64_t)(v2 - 1) > 0x1B)
    return 0;
  else
    return qword_18C311FA0[v2 - 1];
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;

  v3 = -[NSArray hash](self->_entityIdentifiers, "hash");
  v4 = -[INSpeakableString hash](self->_entityName, "hash") ^ v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_entityType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 ^ objc_msgSend(v5, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_outerDeviceType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  v9 = v6 ^ v8 ^ -[INSpeakableString hash](self->_outerDeviceName, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_deviceType);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  v12 = v11 ^ -[INSpeakableString hash](self->_home, "hash");
  v13 = v9 ^ v12 ^ -[INSpeakableString hash](self->_zone, "hash");
  v14 = -[INSpeakableString hash](self->_group, "hash");
  v15 = v14 ^ -[INSpeakableString hash](self->_room, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isExcludeFilter);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v15 ^ objc_msgSend(v16, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasAllQuantifier);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v13 ^ v17 ^ objc_msgSend(v18, "hash");

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  INHomeFilter *v4;
  INHomeFilter *v5;
  NSArray *entityIdentifiers;
  INSpeakableString *entityName;
  INSpeakableString *outerDeviceName;
  INSpeakableString *home;
  INSpeakableString *zone;
  INSpeakableString *group;
  INSpeakableString *room;
  BOOL v13;

  v4 = (INHomeFilter *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      entityIdentifiers = self->_entityIdentifiers;
      v13 = (entityIdentifiers == v5->_entityIdentifiers
          || -[NSArray isEqual:](entityIdentifiers, "isEqual:"))
         && ((entityName = self->_entityName, entityName == v5->_entityName)
          || -[INSpeakableString isEqual:](entityName, "isEqual:"))
         && self->_entityType == v5->_entityType
         && self->_outerDeviceType == v5->_outerDeviceType
         && ((outerDeviceName = self->_outerDeviceName, outerDeviceName == v5->_outerDeviceName)
          || -[INSpeakableString isEqual:](outerDeviceName, "isEqual:"))
         && self->_deviceType == v5->_deviceType
         && ((home = self->_home, home == v5->_home) || -[INSpeakableString isEqual:](home, "isEqual:"))
         && ((zone = self->_zone, zone == v5->_zone) || -[INSpeakableString isEqual:](zone, "isEqual:"))
         && ((group = self->_group, group == v5->_group) || -[INSpeakableString isEqual:](group, "isEqual:"))
         && ((room = self->_room, room == v5->_room) || -[INSpeakableString isEqual:](room, "isEqual:"))
         && self->_isExcludeFilter == v5->_isExcludeFilter
         && self->_hasAllQuantifier == v5->_hasAllQuantifier;

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (INHomeFilter)initWithCoder:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  char v15;
  INHomeFilter *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  v23[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("entityIdentifiers"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("entityType"));
  v19 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("outerDeviceType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("outerDeviceName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("deviceType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("home"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("zone"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("group"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("room"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isExcludeFilter"));
  v15 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasAllQuantifier"));

  BYTE1(v18) = v15;
  LOBYTE(v18) = v14;
  v16 = -[INHomeFilter initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:](self, "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:", v21, v7, v20, v19, v8, v9, v10, v11, v12, v13, v18);

  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *entityIdentifiers;
  id v5;

  entityIdentifiers = self->_entityIdentifiers;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", entityIdentifiers, CFSTR("entityIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_entityName, CFSTR("entityName"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_entityType, CFSTR("entityType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_outerDeviceType, CFSTR("outerDeviceType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_outerDeviceName, CFSTR("outerDeviceName"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_deviceType, CFSTR("deviceType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_home, CFSTR("home"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_zone, CFSTR("zone"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_group, CFSTR("group"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_room, CFSTR("room"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isExcludeFilter, CFSTR("isExcludeFilter"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasAllQuantifier, CFSTR("hasAllQuantifier"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  __CFString *v11;
  __CFString *v12;
  unint64_t v13;
  __CFString *v14;
  __CFString *v15;
  void *v16;
  unint64_t v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_entityIdentifiers);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("entityIdentifiers"));

  objc_msgSend(v6, "encodeObject:", self->_entityName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("entityName"));

  v10 = self->_entityType - 1;
  if (v10 > 9)
    v11 = CFSTR("unknown");
  else
    v11 = off_1E228C2D0[v10];
  v12 = v11;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("entityType"));

  v13 = self->_outerDeviceType - 1;
  if (v13 > 0x2C)
    v14 = CFSTR("unknown");
  else
    v14 = off_1E228CB20[v13];
  v15 = v14;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, CFSTR("outerDeviceType"));

  objc_msgSend(v6, "encodeObject:", self->_outerDeviceName);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, CFSTR("outerDeviceName"));

  v17 = self->_deviceType - 1;
  if (v17 > 0x2C)
    v18 = CFSTR("unknown");
  else
    v18 = off_1E228CB20[v17];
  v19 = v18;
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v19, CFSTR("deviceType"));

  objc_msgSend(v6, "encodeObject:", self->_home);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v20, CFSTR("home"));

  objc_msgSend(v6, "encodeObject:", self->_zone);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v21, CFSTR("zone"));

  objc_msgSend(v6, "encodeObject:", self->_group);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v22, CFSTR("group"));

  objc_msgSend(v6, "encodeObject:", self->_room);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v23, CFSTR("room"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isExcludeFilter);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v24, CFSTR("isExcludeFilter"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasAllQuantifier);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v25, CFSTR("hasAllQuantifier"));

  return v7;
}

- (NSString)description
{
  return (NSString *)-[INHomeFilter descriptionAtIndent:](self, "descriptionAtIndent:", 0);
}

- (id)descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INHomeFilter;
  -[INHomeFilter description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INHomeFilter _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  uint64_t entityIdentifiers;
  uint64_t entityName;
  uint64_t outerDeviceName;
  INSpeakableString *home;
  uint64_t v7;
  INSpeakableString *zone;
  void *v9;
  INSpeakableString *group;
  void *v11;
  INSpeakableString *room;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[12];
  _QWORD v30[14];

  v30[12] = *MEMORY[0x1E0C80C00];
  entityIdentifiers = (uint64_t)self->_entityIdentifiers;
  v28 = entityIdentifiers;
  v29[0] = CFSTR("entityIdentifiers");
  if (!entityIdentifiers)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    entityIdentifiers = objc_claimAutoreleasedReturnValue();
  }
  v22 = (void *)entityIdentifiers;
  v30[0] = entityIdentifiers;
  v29[1] = CFSTR("entityName");
  entityName = (uint64_t)self->_entityName;
  v27 = entityName;
  if (!entityName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    entityName = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)entityName;
  v30[1] = entityName;
  v29[2] = CFSTR("entityType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_entityType);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v26;
  v29[3] = CFSTR("outerDeviceType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_outerDeviceType);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v25;
  v29[4] = CFSTR("outerDeviceName");
  outerDeviceName = (uint64_t)self->_outerDeviceName;
  v24 = outerDeviceName;
  if (!outerDeviceName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    outerDeviceName = objc_claimAutoreleasedReturnValue();
  }
  v20 = (void *)outerDeviceName;
  v30[4] = outerDeviceName;
  v29[5] = CFSTR("deviceType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_deviceType);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[5] = v23;
  v29[6] = CFSTR("home");
  home = self->_home;
  v7 = (uint64_t)home;
  if (!home)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v18 = v7;
  v30[6] = v7;
  v29[7] = CFSTR("zone");
  zone = self->_zone;
  v9 = zone;
  if (!zone)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[7] = v9;
  v29[8] = CFSTR("group");
  group = self->_group;
  v11 = group;
  if (!group)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[8] = v11;
  v29[9] = CFSTR("room");
  room = self->_room;
  v13 = room;
  if (!room)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v30[9] = v13;
  v29[10] = CFSTR("isExcludeFilter");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isExcludeFilter, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[10] = v14;
  v29[11] = CFSTR("hasAllQuantifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasAllQuantifier);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30[11] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (room)
  {
    if (group)
      goto LABEL_17;
  }
  else
  {

    if (group)
    {
LABEL_17:
      if (zone)
        goto LABEL_18;
LABEL_28:

      if (home)
        goto LABEL_19;
      goto LABEL_29;
    }
  }

  if (!zone)
    goto LABEL_28;
LABEL_18:
  if (home)
    goto LABEL_19;
LABEL_29:

LABEL_19:
  if (!v24)

  if (!v27)
  if (!v28)

  return v16;
}

- (NSArray)entityIdentifiers
{
  return self->_entityIdentifiers;
}

- (INSpeakableString)entityName
{
  return self->_entityName;
}

- (int64_t)entityType
{
  return self->_entityType;
}

- (int64_t)outerDeviceType
{
  return self->_outerDeviceType;
}

- (INSpeakableString)outerDeviceName
{
  return self->_outerDeviceName;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (INSpeakableString)home
{
  return self->_home;
}

- (INSpeakableString)zone
{
  return self->_zone;
}

- (INSpeakableString)group
{
  return self->_group;
}

- (INSpeakableString)room
{
  return self->_room;
}

- (BOOL)isExcludeFilter
{
  return self->_isExcludeFilter;
}

- (INSpeakableString)accessory
{
  return self->_accessory;
}

- (int64_t)subServiceType
{
  return self->_subServiceType;
}

- (BOOL)hasAllQuantifier
{
  return self->_hasAllQuantifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_outerDeviceName, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_entityIdentifiers, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  void *v31;
  char v32;
  void *v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  objc_class *v40;
  void *v41;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("entityIdentifiers"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (objc_class *)a1;
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("entityName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("entityType"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = INHomeEntityTypeWithString(v11);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("outerDeviceType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = INHomeDeviceTypeWithString(v12);

    v13 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("outerDeviceName"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("deviceType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = INHomeDeviceTypeWithString(v16);

    v17 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("home"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("zone"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("group"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("room"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isExcludeFilter"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("hasAllQuantifier"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "BOOLValue");

    BYTE1(v35) = v32;
    LOBYTE(v35) = v30;
    v33 = (void *)objc_msgSend([v40 alloc], "initWithEntityIdentifiers:entityName:entityType:outerDeviceType:outerDeviceName:deviceType:home:zone:group:room:isExcludeFilter:hasAllQuantifier:", v41, v39, v38, v37, v15, v36, v19, v22, v25, v28, v35);

  }
  else
  {
    v33 = 0;
  }

  return v33;
}

@end
