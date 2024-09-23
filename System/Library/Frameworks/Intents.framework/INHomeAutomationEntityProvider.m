@implementation INHomeAutomationEntityProvider

- (INHomeAutomationEntityProvider)initWithRoomNames:(id)a3 homeName:(id)a4 zoneNames:(id)a5 accessoryNames:(id)a6 serviceNames:(id)a7 serviceGroups:(id)a8 intentFromEntities:(id)a9 intentDeviceQuantifier:(id)a10 destinationDeviceId:(id)a11 intentDeviceType:(id)a12 intentPlaceHint:(id)a13 intentReference:(id)a14
{
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  INHomeAutomationEntityProvider *v29;
  uint64_t v30;
  NSArray *roomNames;
  uint64_t v32;
  NSString *homeName;
  uint64_t v34;
  NSArray *zoneNames;
  uint64_t v36;
  NSArray *accessoryNames;
  uint64_t v38;
  NSArray *serviceNames;
  uint64_t v40;
  NSArray *serviceGroups;
  uint64_t v42;
  NSArray *intentFromEntities;
  uint64_t v44;
  NSString *intentDeviceQuantifier;
  uint64_t v46;
  NSString *destinationDeviceId;
  uint64_t v48;
  NSString *intentDeviceType;
  uint64_t v50;
  NSString *intentPlaceHint;
  uint64_t v52;
  NSString *intentReference;
  id v56;
  id v57;
  id v58;
  objc_super v59;

  v19 = a3;
  v20 = a4;
  v21 = a5;
  v58 = a6;
  v57 = a7;
  v56 = a8;
  v22 = v20;
  v23 = a9;
  v24 = a10;
  v25 = a11;
  v26 = a12;
  v27 = a13;
  v28 = a14;
  v59.receiver = self;
  v59.super_class = (Class)INHomeAutomationEntityProvider;
  v29 = -[INHomeAutomationEntityProvider init](&v59, sel_init);
  if (v29)
  {
    v30 = objc_msgSend(v19, "copy");
    roomNames = v29->_roomNames;
    v29->_roomNames = (NSArray *)v30;

    v32 = objc_msgSend(v22, "copy");
    homeName = v29->_homeName;
    v29->_homeName = (NSString *)v32;

    v34 = objc_msgSend(v21, "copy");
    zoneNames = v29->_zoneNames;
    v29->_zoneNames = (NSArray *)v34;

    v36 = objc_msgSend(v58, "copy");
    accessoryNames = v29->_accessoryNames;
    v29->_accessoryNames = (NSArray *)v36;

    v38 = objc_msgSend(v57, "copy");
    serviceNames = v29->_serviceNames;
    v29->_serviceNames = (NSArray *)v38;

    v40 = objc_msgSend(v56, "copy");
    serviceGroups = v29->_serviceGroups;
    v29->_serviceGroups = (NSArray *)v40;

    v42 = objc_msgSend(v23, "copy");
    intentFromEntities = v29->_intentFromEntities;
    v29->_intentFromEntities = (NSArray *)v42;

    v44 = objc_msgSend(v24, "copy");
    intentDeviceQuantifier = v29->_intentDeviceQuantifier;
    v29->_intentDeviceQuantifier = (NSString *)v44;

    v46 = objc_msgSend(v25, "copy");
    destinationDeviceId = v29->_destinationDeviceId;
    v29->_destinationDeviceId = (NSString *)v46;

    v48 = objc_msgSend(v26, "copy");
    intentDeviceType = v29->_intentDeviceType;
    v29->_intentDeviceType = (NSString *)v48;

    v50 = objc_msgSend(v27, "copy");
    intentPlaceHint = v29->_intentPlaceHint;
    v29->_intentPlaceHint = (NSString *)v50;

    v52 = objc_msgSend(v28, "copy");
    intentReference = v29->_intentReference;
    v29->_intentReference = (NSString *)v52;

  }
  return v29;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;

  v3 = -[NSArray hash](self->_roomNames, "hash");
  v4 = -[NSString hash](self->_homeName, "hash") ^ v3;
  v5 = -[NSArray hash](self->_zoneNames, "hash");
  v6 = v4 ^ v5 ^ -[NSArray hash](self->_accessoryNames, "hash");
  v7 = -[NSArray hash](self->_serviceNames, "hash");
  v8 = v7 ^ -[NSArray hash](self->_serviceGroups, "hash");
  v9 = v6 ^ v8 ^ -[NSArray hash](self->_intentFromEntities, "hash");
  v10 = -[NSString hash](self->_intentDeviceQuantifier, "hash");
  v11 = v10 ^ -[NSString hash](self->_destinationDeviceId, "hash");
  v12 = v11 ^ -[NSString hash](self->_intentDeviceType, "hash");
  v13 = v9 ^ v12 ^ -[NSString hash](self->_intentPlaceHint, "hash");
  return v13 ^ -[NSString hash](self->_intentReference, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INHomeAutomationEntityProvider *v4;
  INHomeAutomationEntityProvider *v5;
  NSArray *roomNames;
  NSString *homeName;
  NSArray *zoneNames;
  NSArray *accessoryNames;
  NSArray *serviceNames;
  NSArray *serviceGroups;
  NSArray *intentFromEntities;
  NSString *intentDeviceQuantifier;
  NSString *destinationDeviceId;
  NSString *intentDeviceType;
  NSString *intentPlaceHint;
  NSString *intentReference;
  BOOL v18;

  v4 = (INHomeAutomationEntityProvider *)a3;
  if (v4 == self)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      roomNames = self->_roomNames;
      if (roomNames != v5->_roomNames && !-[NSArray isEqual:](roomNames, "isEqual:"))
        goto LABEL_30;
      homeName = self->_homeName;
      if (homeName != v5->_homeName && !-[NSString isEqual:](homeName, "isEqual:"))
        goto LABEL_30;
      zoneNames = self->_zoneNames;
      if (zoneNames != v5->_zoneNames && !-[NSArray isEqual:](zoneNames, "isEqual:"))
        goto LABEL_30;
      accessoryNames = self->_accessoryNames;
      if (accessoryNames != v5->_accessoryNames && !-[NSArray isEqual:](accessoryNames, "isEqual:"))
        goto LABEL_30;
      serviceNames = self->_serviceNames;
      if (serviceNames != v5->_serviceNames && !-[NSArray isEqual:](serviceNames, "isEqual:"))
        goto LABEL_30;
      if (((serviceGroups = self->_serviceGroups, serviceGroups == v5->_serviceGroups)
         || -[NSArray isEqual:](serviceGroups, "isEqual:"))
        && ((intentFromEntities = self->_intentFromEntities, intentFromEntities == v5->_intentFromEntities)
         || -[NSArray isEqual:](intentFromEntities, "isEqual:"))
        && ((intentDeviceQuantifier = self->_intentDeviceQuantifier,
             intentDeviceQuantifier == v5->_intentDeviceQuantifier)
         || -[NSString isEqual:](intentDeviceQuantifier, "isEqual:"))
        && ((destinationDeviceId = self->_destinationDeviceId, destinationDeviceId == v5->_destinationDeviceId)
         || -[NSString isEqual:](destinationDeviceId, "isEqual:"))
        && ((intentDeviceType = self->_intentDeviceType, intentDeviceType == v5->_intentDeviceType)
         || -[NSString isEqual:](intentDeviceType, "isEqual:"))
        && ((intentPlaceHint = self->_intentPlaceHint, intentPlaceHint == v5->_intentPlaceHint)
         || -[NSString isEqual:](intentPlaceHint, "isEqual:"))
        && ((intentReference = self->_intentReference, intentReference == v5->_intentReference)
         || -[NSString isEqual:](intentReference, "isEqual:")))
      {
        v18 = 1;
      }
      else
      {
LABEL_30:
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

- (INHomeAutomationEntityProvider)initWithCoder:(id)a3
{
  void *v3;
  id v4;
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
  void *v28;
  void *v30;
  void *v31;
  INHomeAutomationEntityProvider *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[4];

  v42[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  v42[0] = objc_opt_class();
  v42[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("roomNames"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("homeName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v41[0] = objc_opt_class();
  v41[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("zoneNames"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0C99E60];
  v40[0] = objc_opt_class();
  v40[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("accessoryNames"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)MEMORY[0x1E0C99E60];
  v39[0] = objc_opt_class();
  v39[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("serviceNames"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0C99E60];
  v38[0] = objc_opt_class();
  v38[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("serviceGroups"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x1E0C99E60];
  v37[0] = objc_opt_class();
  v37[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setWithArray:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("intentFromEntities"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intentDeviceQuantifier"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destinationDeviceId"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intentDeviceType"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intentPlaceHint"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("intentReference"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = -[INHomeAutomationEntityProvider initWithRoomNames:homeName:zoneNames:accessoryNames:serviceNames:serviceGroups:intentFromEntities:intentDeviceQuantifier:destinationDeviceId:intentDeviceType:intentPlaceHint:intentReference:](self, "initWithRoomNames:homeName:zoneNames:accessoryNames:serviceNames:serviceGroups:intentFromEntities:intentDeviceQuantifier:destinationDeviceId:intentDeviceType:intentPlaceHint:intentReference:", v7, v8, v36, v35, v18, v34, v31, v30, v25, v26, v27, v28);
  return v33;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *roomNames;
  id v5;

  roomNames = self->_roomNames;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", roomNames, CFSTR("roomNames"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeName, CFSTR("homeName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_zoneNames, CFSTR("zoneNames"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessoryNames, CFSTR("accessoryNames"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceNames, CFSTR("serviceNames"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceGroups, CFSTR("serviceGroups"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_intentFromEntities, CFSTR("intentFromEntities"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_intentDeviceQuantifier, CFSTR("intentDeviceQuantifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_destinationDeviceId, CFSTR("destinationDeviceId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_intentDeviceType, CFSTR("intentDeviceType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_intentPlaceHint, CFSTR("intentPlaceHint"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_intentReference, CFSTR("intentReference"));

}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  void *v5;
  id v6;
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
  void *v19;

  v5 = (void *)MEMORY[0x1E0C99E08];
  v6 = a3;
  objc_msgSend(v5, "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:", self->_roomNames);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v8, CFSTR("roomNames"));

  objc_msgSend(v6, "encodeObject:", self->_homeName);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v9, CFSTR("homeName"));

  objc_msgSend(v6, "encodeObject:", self->_zoneNames);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v10, CFSTR("zoneNames"));

  objc_msgSend(v6, "encodeObject:", self->_accessoryNames);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v11, CFSTR("accessoryNames"));

  objc_msgSend(v6, "encodeObject:", self->_serviceNames);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v12, CFSTR("serviceNames"));

  objc_msgSend(v6, "encodeObject:", self->_serviceGroups);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v13, CFSTR("serviceGroups"));

  objc_msgSend(v6, "encodeObject:", self->_intentFromEntities);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v14, CFSTR("intentFromEntities"));

  objc_msgSend(v6, "encodeObject:", self->_intentDeviceQuantifier);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v15, CFSTR("intentDeviceQuantifier"));

  objc_msgSend(v6, "encodeObject:", self->_destinationDeviceId);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v16, CFSTR("destinationDeviceId"));

  objc_msgSend(v6, "encodeObject:", self->_intentDeviceType);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v17, CFSTR("intentDeviceType"));

  objc_msgSend(v6, "encodeObject:", self->_intentPlaceHint);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v18, CFSTR("intentPlaceHint"));

  objc_msgSend(v6, "encodeObject:", self->_intentReference);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "if_setObjectIfNonNil:forKey:", v19, CFSTR("intentReference"));
  return v7;
}

- (NSString)description
{
  return (NSString *)-[INHomeAutomationEntityProvider descriptionAtIndent:](self, "descriptionAtIndent:", 0);
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
  v11.super_class = (Class)INHomeAutomationEntityProvider;
  -[INHomeAutomationEntityProvider description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INHomeAutomationEntityProvider _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  uint64_t v3;
  uint64_t homeName;
  uint64_t zoneNames;
  uint64_t accessoryNames;
  uint64_t serviceNames;
  uint64_t serviceGroups;
  NSArray *intentFromEntities;
  uint64_t v10;
  NSString *intentDeviceQuantifier;
  uint64_t v12;
  NSString *destinationDeviceId;
  uint64_t v14;
  NSString *intentDeviceType;
  void *v16;
  void *v17;
  NSString *intentPlaceHint;
  void *v19;
  NSString *intentReference;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  NSArray *roomNames;
  _QWORD v38[12];
  _QWORD v39[14];

  v39[12] = *MEMORY[0x1E0C80C00];
  roomNames = self->_roomNames;
  v3 = (uint64_t)roomNames;
  v38[0] = CFSTR("roomNames");
  if (!roomNames)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v39[0] = v3;
  v38[1] = CFSTR("homeName");
  homeName = (uint64_t)self->_homeName;
  v35 = homeName;
  if (!homeName)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    homeName = objc_claimAutoreleasedReturnValue();
  }
  v39[1] = homeName;
  v38[2] = CFSTR("zoneNames");
  zoneNames = (uint64_t)self->_zoneNames;
  v33 = zoneNames;
  if (!zoneNames)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    zoneNames = objc_claimAutoreleasedReturnValue();
  }
  v39[2] = zoneNames;
  v38[3] = CFSTR("accessoryNames");
  accessoryNames = (uint64_t)self->_accessoryNames;
  v32 = accessoryNames;
  if (!accessoryNames)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    accessoryNames = objc_claimAutoreleasedReturnValue();
  }
  v39[3] = accessoryNames;
  v38[4] = CFSTR("serviceNames");
  serviceNames = (uint64_t)self->_serviceNames;
  v31 = serviceNames;
  if (!serviceNames)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    serviceNames = objc_claimAutoreleasedReturnValue();
  }
  v39[4] = serviceNames;
  v38[5] = CFSTR("serviceGroups");
  serviceGroups = (uint64_t)self->_serviceGroups;
  v30 = serviceGroups;
  if (!serviceGroups)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    serviceGroups = objc_claimAutoreleasedReturnValue();
  }
  v39[5] = serviceGroups;
  v38[6] = CFSTR("intentFromEntities");
  intentFromEntities = self->_intentFromEntities;
  v10 = (uint64_t)intentFromEntities;
  if (!intentFromEntities)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v25 = (void *)v10;
  v39[6] = v10;
  v38[7] = CFSTR("intentDeviceQuantifier");
  intentDeviceQuantifier = self->_intentDeviceQuantifier;
  v12 = (uint64_t)intentDeviceQuantifier;
  if (!intentDeviceQuantifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v36 = (void *)v3;
  v24 = (void *)v12;
  v39[7] = v12;
  v38[8] = CFSTR("destinationDeviceId");
  destinationDeviceId = self->_destinationDeviceId;
  v14 = (uint64_t)destinationDeviceId;
  if (!destinationDeviceId)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v14 = objc_claimAutoreleasedReturnValue();
  }
  v26 = (void *)serviceGroups;
  v27 = (void *)serviceNames;
  v28 = (void *)accessoryNames;
  v34 = (void *)homeName;
  v23 = (void *)v14;
  v39[8] = v14;
  v38[9] = CFSTR("intentDeviceType");
  intentDeviceType = self->_intentDeviceType;
  v16 = intentDeviceType;
  if (!intentDeviceType)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = (void *)zoneNames;
  v39[9] = v16;
  v38[10] = CFSTR("intentPlaceHint");
  intentPlaceHint = self->_intentPlaceHint;
  v19 = intentPlaceHint;
  if (!intentPlaceHint)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v39[10] = v19;
  v38[11] = CFSTR("intentReference");
  intentReference = self->_intentReference;
  v21 = intentReference;
  if (!intentReference)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v39[11] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 12);
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (intentReference)
  {
    if (intentPlaceHint)
      goto LABEL_27;
LABEL_46:

    if (intentDeviceType)
      goto LABEL_28;
    goto LABEL_47;
  }

  if (!intentPlaceHint)
    goto LABEL_46;
LABEL_27:
  if (intentDeviceType)
    goto LABEL_28;
LABEL_47:

LABEL_28:
  if (!destinationDeviceId)

  if (intentDeviceQuantifier)
  {
    if (intentFromEntities)
      goto LABEL_32;
  }
  else
  {

    if (intentFromEntities)
      goto LABEL_32;
  }

LABEL_32:
  if (!v30)

  if (!v31)
  if (!v32)

  if (!v33)
  if (!v35)

  if (!roomNames)
  return v29;
}

- (NSArray)roomNames
{
  return self->_roomNames;
}

- (NSString)homeName
{
  return self->_homeName;
}

- (NSArray)zoneNames
{
  return self->_zoneNames;
}

- (NSArray)accessoryNames
{
  return self->_accessoryNames;
}

- (NSArray)serviceNames
{
  return self->_serviceNames;
}

- (NSArray)serviceGroups
{
  return self->_serviceGroups;
}

- (NSArray)intentFromEntities
{
  return self->_intentFromEntities;
}

- (NSString)intentDeviceQuantifier
{
  return self->_intentDeviceQuantifier;
}

- (NSString)destinationDeviceId
{
  return self->_destinationDeviceId;
}

- (NSString)intentDeviceType
{
  return self->_intentDeviceType;
}

- (NSString)intentPlaceHint
{
  return self->_intentPlaceHint;
}

- (NSString)intentReference
{
  return self->_intentReference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentReference, 0);
  objc_storeStrong((id *)&self->_intentPlaceHint, 0);
  objc_storeStrong((id *)&self->_intentDeviceType, 0);
  objc_storeStrong((id *)&self->_destinationDeviceId, 0);
  objc_storeStrong((id *)&self->_intentDeviceQuantifier, 0);
  objc_storeStrong((id *)&self->_intentFromEntities, 0);
  objc_storeStrong((id *)&self->_serviceGroups, 0);
  objc_storeStrong((id *)&self->_serviceNames, 0);
  objc_storeStrong((id *)&self->_accessoryNames, 0);
  objc_storeStrong((id *)&self->_zoneNames, 0);
  objc_storeStrong((id *)&self->_homeName, 0);
  objc_storeStrong((id *)&self->_roomNames, 0);
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
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  objc_class *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;

  v7 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v43 = (objc_class *)a1;
    v9 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("roomNames"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v9, v10);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("homeName"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v11, v12);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("zoneNames"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v13, v14);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("accessoryNames"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v15, v16);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("serviceNames"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v17, v18);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("serviceGroups"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v19, v20);
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("intentFromEntities"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectsOfClass:from:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("intentDeviceQuantifier"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v24, v25);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("destinationDeviceId"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("intentDeviceType"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v29, v30);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("intentPlaceHint"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = objc_opt_class();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("intentReference"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = (void *)objc_msgSend([v43 alloc], "initWithRoomNames:homeName:zoneNames:accessoryNames:serviceNames:serviceGroups:intentFromEntities:intentDeviceQuantifier:destinationDeviceId:intentDeviceType:intentPlaceHint:intentReference:", v47, v46, v45, v44, v41, v42, v23, v40, v28, v39, v33, v36);
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

@end
