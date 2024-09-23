@implementation INHomeEntity

- (INHomeEntity)initWithEntityName:(id)a3 type:(int64_t)a4 entityIdentifier:(id)a5 deviceTypes:(id)a6 sceneType:(int64_t)a7 room:(id)a8 home:(id)a9 group:(id)a10 zones:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  INHomeEntity *v24;
  uint64_t v25;
  INSpeakableString *entityName;
  uint64_t v27;
  NSString *entityIdentifier;
  uint64_t v29;
  NSArray *deviceTypes;
  uint64_t v31;
  INSpeakableString *room;
  uint64_t v33;
  INSpeakableString *home;
  uint64_t v35;
  INSpeakableString *group;
  uint64_t v37;
  NSArray *zones;
  objc_super v40;

  v17 = a3;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v40.receiver = self;
  v40.super_class = (Class)INHomeEntity;
  v24 = -[INHomeEntity init](&v40, sel_init);
  if (v24)
  {
    v25 = objc_msgSend(v17, "copy");
    entityName = v24->_entityName;
    v24->_entityName = (INSpeakableString *)v25;

    v24->_type = a4;
    v27 = objc_msgSend(v18, "copy");
    entityIdentifier = v24->_entityIdentifier;
    v24->_entityIdentifier = (NSString *)v27;

    v29 = objc_msgSend(v19, "copy");
    deviceTypes = v24->_deviceTypes;
    v24->_deviceTypes = (NSArray *)v29;

    v24->_sceneType = a7;
    v31 = objc_msgSend(v20, "copy");
    room = v24->_room;
    v24->_room = (INSpeakableString *)v31;

    v33 = objc_msgSend(v21, "copy");
    home = v24->_home;
    v24->_home = (INSpeakableString *)v33;

    v35 = objc_msgSend(v22, "copy");
    group = v24->_group;
    v24->_group = (INSpeakableString *)v35;

    v37 = objc_msgSend(v23, "copy");
    zones = v24->_zones;
    v24->_zones = (NSArray *)v37;

  }
  return v24;
}

- (INHomeEntity)initWithName:(id)a3 type:(int64_t)a4 deviceType:(int64_t)a5
{
  id v8;
  INSpeakableString *v9;
  void *v10;
  void *v11;
  INHomeEntity *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = -[INSpeakableString initWithSpokenPhrase:]([INSpeakableString alloc], "initWithSpokenPhrase:", v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[INHomeEntity initWithEntityName:type:entityIdentifier:deviceTypes:sceneType:room:zone:home:group:](self, "initWithEntityName:type:entityIdentifier:deviceTypes:sceneType:room:zone:home:group:", v9, a4, 0, v11, 0, 0, 0, 0, 0);

  return v12;
}

- (INHomeEntity)initWithEntityName:(id)a3 type:(int64_t)a4 entityIdentifier:(id)a5 deviceTypes:(id)a6 sceneType:(int64_t)a7 room:(id)a8 zone:(id)a9 home:(id)a10 group:(id)a11
{
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  INHomeEntity *v27;
  INHomeEntity *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  INHomeEntity *v35;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v17 = a9;
  v18 = v17;
  if (v17)
  {
    v38[0] = v17;
    v19 = (void *)MEMORY[0x1E0C99D20];
    v20 = a11;
    v21 = a10;
    v22 = a8;
    v23 = a6;
    v24 = a5;
    v25 = a3;
    objc_msgSend(v19, "arrayWithObjects:count:", v38, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[INHomeEntity initWithEntityName:type:entityIdentifier:deviceTypes:sceneType:room:home:group:zones:](self, "initWithEntityName:type:entityIdentifier:deviceTypes:sceneType:room:home:group:zones:", v25, a4, v24, v23, a7, v22, v21, v20, v26);

    v28 = v27;
  }
  else
  {
    v29 = a11;
    v30 = a10;
    v31 = a8;
    v32 = a6;
    v33 = a5;
    v34 = a3;
    v35 = -[INHomeEntity initWithEntityName:type:entityIdentifier:deviceTypes:sceneType:room:home:group:zones:](self, "initWithEntityName:type:entityIdentifier:deviceTypes:sceneType:room:home:group:zones:", v34, a4, v33, v32, a7, v31, v30, v29, MEMORY[0x1E0C9AA60]);

    v28 = v35;
  }

  return v28;
}

- (int64_t)deviceType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[INHomeEntity deviceTypes](self, "deviceTypes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[INHomeEntity entityName](self, "entityName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "spokenPhrase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = -[INSpeakableString hash](self->_entityName, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v3 ^ -[NSString hash](self->_entityIdentifier, "hash");
  v7 = v5 ^ v6 ^ -[NSArray hash](self->_deviceTypes, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_sceneType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  v10 = v7 ^ v9 ^ -[INSpeakableString hash](self->_room, "hash");
  v11 = -[INSpeakableString hash](self->_home, "hash");
  v12 = v11 ^ -[INSpeakableString hash](self->_group, "hash");
  v13 = v10 ^ v12 ^ -[NSArray hash](self->_zones, "hash");

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  INHomeEntity *v4;
  INHomeEntity *v5;
  INSpeakableString *entityName;
  NSString *entityIdentifier;
  NSArray *deviceTypes;
  INSpeakableString *room;
  INSpeakableString *home;
  INSpeakableString *group;
  NSArray *zones;
  BOOL v13;

  v4 = (INHomeEntity *)a3;
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
      entityName = self->_entityName;
      v13 = 0;
      if ((entityName == v5->_entityName || -[INSpeakableString isEqual:](entityName, "isEqual:"))
        && self->_type == v5->_type)
      {
        entityIdentifier = self->_entityIdentifier;
        if (entityIdentifier == v5->_entityIdentifier
          || -[NSString isEqual:](entityIdentifier, "isEqual:"))
        {
          deviceTypes = self->_deviceTypes;
          if ((deviceTypes == v5->_deviceTypes || -[NSArray isEqual:](deviceTypes, "isEqual:"))
            && self->_sceneType == v5->_sceneType)
          {
            room = self->_room;
            if (room == v5->_room || -[INSpeakableString isEqual:](room, "isEqual:"))
            {
              home = self->_home;
              if (home == v5->_home || -[INSpeakableString isEqual:](home, "isEqual:"))
              {
                group = self->_group;
                if (group == v5->_group || -[INSpeakableString isEqual:](group, "isEqual:"))
                {
                  zones = self->_zones;
                  if (zones == v5->_zones || -[NSArray isEqual:](zones, "isEqual:"))
                    v13 = 1;
                }
              }
            }
          }
        }
      }

    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (INHomeEntity)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  INHomeEntity *v20;
  uint64_t v22;
  void *v23;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entityName"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("type"));
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v6, CFSTR("entityIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99E60];
  v26[0] = objc_opt_class();
  v26[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v10, CFSTR("deviceTypes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("sceneType"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("room"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("home"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("group"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0C99E60];
  v25[0] = objc_opt_class();
  v25[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v18, CFSTR("zones"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[INHomeEntity initWithEntityName:type:entityIdentifier:deviceTypes:sceneType:room:home:group:zones:](self, "initWithEntityName:type:entityIdentifier:deviceTypes:sceneType:room:home:group:zones:", v23, v22, v7, v11, v12, v13, v14, v15, v19);
  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  INSpeakableString *entityName;
  id v5;

  entityName = self->_entityName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", entityName, CFSTR("entityName"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_entityIdentifier, CFSTR("entityIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceTypes, CFSTR("deviceTypes"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sceneType, CFSTR("sceneType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_room, CFSTR("room"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_home, CFSTR("home"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_group, CFSTR("group"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_zones, CFSTR("zones"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __CFString *v19;
  __CFString *v20;
  unint64_t v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:", self->_entityName);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v7, CFSTR("entityName"));

  v8 = self->_type - 1;
  if (v8 > 9)
    v9 = CFSTR("unknown");
  else
    v9 = off_1E228C2D0[v8];
  v10 = v9;
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v10, CFSTR("type"));

  v29 = v5;
  objc_msgSend(v5, "encodeObject:", self->_entityIdentifier);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v11, CFSTR("entityIdentifier"));

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v13 = self->_deviceTypes;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v31;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v31 != v16)
          objc_enumerationMutation(v13);
        v18 = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v17), "integerValue");
        v19 = CFSTR("unknown");
        if ((unint64_t)(v18 - 1) <= 0x2C)
          v19 = off_1E228CB20[v18 - 1];
        v20 = v19;
        objc_msgSend(v12, "addObject:", v20);

        ++v17;
      }
      while (v15 != v17);
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v15);
  }

  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v12, CFSTR("deviceTypes"));
  v21 = self->_sceneType - 1;
  if (v21 > 4)
    v22 = CFSTR("unknown");
  else
    v22 = *(&off_1E2293B50 + v21);
  v23 = v22;
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v23, CFSTR("sceneType"));

  objc_msgSend(v29, "encodeObject:", self->_room);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v24, CFSTR("room"));

  objc_msgSend(v29, "encodeObject:", self->_home);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v25, CFSTR("home"));

  objc_msgSend(v29, "encodeObject:", self->_group);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v26, CFSTR("group"));

  objc_msgSend(v29, "encodeObject:", self->_zones);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v27, CFSTR("zones"));

  return v6;
}

- (NSString)description
{
  return (NSString *)-[INHomeEntity descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INHomeEntity;
  -[INHomeEntity description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INHomeEntity _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  uint64_t entityName;
  uint64_t entityIdentifier;
  NSArray *deviceTypes;
  uint64_t v6;
  INSpeakableString *room;
  void *v8;
  INSpeakableString *home;
  void *v10;
  INSpeakableString *group;
  void *v12;
  NSArray *zones;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD v24[9];
  _QWORD v25[11];

  v25[9] = *MEMORY[0x1E0C80C00];
  entityName = (uint64_t)self->_entityName;
  v23 = entityName;
  v24[0] = CFSTR("entityName");
  if (!entityName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    entityName = objc_claimAutoreleasedReturnValue();
  }
  v19 = (void *)entityName;
  v25[0] = entityName;
  v24[1] = CFSTR("type");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_type);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v22;
  v24[2] = CFSTR("entityIdentifier");
  entityIdentifier = (uint64_t)self->_entityIdentifier;
  v21 = entityIdentifier;
  if (!entityIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    entityIdentifier = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)entityIdentifier;
  v25[2] = entityIdentifier;
  v24[3] = CFSTR("deviceTypes");
  deviceTypes = self->_deviceTypes;
  v6 = (uint64_t)deviceTypes;
  if (!deviceTypes)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)v6;
  v25[3] = v6;
  v24[4] = CFSTR("sceneType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_sceneType);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[4] = v20;
  v24[5] = CFSTR("room");
  room = self->_room;
  v8 = room;
  if (!room)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[5] = v8;
  v24[6] = CFSTR("home");
  home = self->_home;
  v10 = home;
  if (!home)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[6] = v10;
  v24[7] = CFSTR("group");
  group = self->_group;
  v12 = group;
  if (!group)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[7] = v12;
  v24[8] = CFSTR("zones");
  zones = self->_zones;
  v14 = zones;
  if (!zones)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v25[8] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (zones)
  {
    if (group)
      goto LABEL_17;
  }
  else
  {

    if (group)
    {
LABEL_17:
      if (home)
        goto LABEL_18;
LABEL_28:

      if (room)
        goto LABEL_19;
      goto LABEL_29;
    }
  }

  if (!home)
    goto LABEL_28;
LABEL_18:
  if (room)
    goto LABEL_19;
LABEL_29:

LABEL_19:
  if (!deviceTypes)

  if (!v21)
  if (!v23)

  return v15;
}

- (INSpeakableString)entityName
{
  return self->_entityName;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)entityIdentifier
{
  return self->_entityIdentifier;
}

- (NSArray)deviceTypes
{
  return self->_deviceTypes;
}

- (int64_t)sceneType
{
  return self->_sceneType;
}

- (INSpeakableString)room
{
  return self->_room;
}

- (INSpeakableString)zone
{
  return self->_zone;
}

- (INSpeakableString)home
{
  return self->_home;
}

- (INSpeakableString)group
{
  return self->_group;
}

- (NSArray)zones
{
  return self->_zones;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zones, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_deviceTypes, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
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
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
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
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  objc_class *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v38 = (objc_class *)a1;
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("entityName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v9, v10);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("type"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = INHomeEntityTypeWithString(v11);

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("entityIdentifier"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("deviceTypes"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v40;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v40 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", INHomeDeviceTypeWithString(*(void **)(*((_QWORD *)&v39 + 1) + 8 * v17)));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

          ++v17;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
      }
      while (v15);
    }

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sceneType"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = INHomeSceneTypeWithString(v19);

    v20 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("room"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("home"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("group"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("zones"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = (void *)objc_msgSend([v38 alloc], "initWithEntityName:type:entityIdentifier:deviceTypes:sceneType:room:home:group:zones:", v37, v35, v36, v12, v34, v22, v25, v28, v31);
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

@end
