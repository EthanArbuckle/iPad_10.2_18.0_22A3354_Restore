@implementation CCHomeContent

- (CCHomeContent)initWithEntity:(id)a3 entityType:(unsigned int)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int IsInstanceOfExpectedClass;
  id v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  void *v19;
  void *v20;
  CCHomeContent *v21;
  uint64_t v23;

  v8 = a3;
  v9 = (void *)objc_opt_new();
  if (v8 && a4 == 1)
  {
    objc_opt_class();
    IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
    v11 = 0;
    if (IsInstanceOfExpectedClass)
      goto LABEL_32;
LABEL_34:
    CCSetError();
    v21 = 0;
    goto LABEL_35;
  }
  if (v8 && a4 == 2)
  {
    objc_opt_class();
    v12 = CCValidateIsInstanceOfExpectedClass();
    v11 = 0;
    if (v12)
      goto LABEL_32;
    goto LABEL_34;
  }
  if (v8 && a4 == 3)
  {
    objc_opt_class();
    v13 = CCValidateIsInstanceOfExpectedClass();
    v11 = 0;
    if (v13)
      goto LABEL_32;
    goto LABEL_34;
  }
  if (v8 && a4 == 4)
  {
    objc_opt_class();
    v14 = CCValidateIsInstanceOfExpectedClass();
    v11 = 0;
    if (v14)
      goto LABEL_32;
    goto LABEL_34;
  }
  if (v8 && a4 == 5)
  {
    objc_opt_class();
    v15 = CCValidateIsInstanceOfExpectedClass();
    v11 = 0;
    if (v15)
      goto LABEL_32;
    goto LABEL_34;
  }
  if (v8 && a4 == 6)
  {
    objc_opt_class();
    v16 = CCValidateIsInstanceOfExpectedClass();
    v11 = 0;
    if (v16)
      goto LABEL_32;
    goto LABEL_34;
  }
  if (v8 && a4 == 7)
  {
    objc_opt_class();
    v17 = CCValidateIsInstanceOfExpectedClass();
    v11 = 0;
    if (v17)
      goto LABEL_32;
    goto LABEL_34;
  }
  v11 = 0;
  if (!v8 || a4 != 8)
    goto LABEL_33;
  objc_opt_class();
  v23 = 0;
  v18 = CCValidateIsInstanceOfExpectedClass();
  v11 = 0;
  if (!v18)
    goto LABEL_34;
LABEL_32:
  objc_msgSend(v8, "data");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  CCPBDataWriterWriteDataField();

LABEL_33:
  objc_msgSend(v9, "immutableData", v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  self = -[CCItemMessage initWithData:error:](self, "initWithData:error:", v20, a5);

  v21 = self;
LABEL_35:

  return v21;
}

- (BOOL)initializeFieldValuesFromData:(id)a3 error:(id *)a4
{
  id v5;
  char *v6;
  int *v7;
  int *v8;
  int *v9;
  id v10;
  int *v11;
  BOOL v12;
  char v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  CCHome *v20;
  void *v21;
  CCHome *v22;
  CCHome *home;
  CCHomeZone *zone;
  CCHomeZone *v25;
  void *v26;
  CCHomeZone *v27;
  CCHomeZone *v28;
  CCHome *v29;
  CCHomeRoom *room;
  CCHomeRoom *v31;
  void *v32;
  CCHomeRoom *v33;
  CCHomeRoom *v34;
  CCHome *v35;
  CCHomeZone *v36;
  CCHomeService *service;
  CCHomeService *v38;
  void *v39;
  CCHomeService *v40;
  CCHomeService *v41;
  CCHome *v42;
  CCHomeZone *v43;
  CCHomeRoom *v44;
  CCHomeServiceGroup *serviceGroup;
  CCHomeServiceGroup *v46;
  void *v47;
  CCHomeServiceGroup *v48;
  CCHomeServiceGroup *v49;
  CCHome *v50;
  CCHomeZone *v51;
  CCHomeRoom *v52;
  CCHomeService *v53;
  CCHomeScene *scene;
  CCHomeTrigger *trigger;
  CCHomeAccessory *accessory;
  CCHomeScene *v57;
  void *v58;
  CCHomeScene *v59;
  CCHomeScene *v60;
  CCHome *v61;
  CCHomeZone *v62;
  CCHomeRoom *v63;
  CCHomeService *v64;
  CCHomeServiceGroup *v65;
  CCHomeTrigger *v66;
  void *v67;
  CCHomeTrigger *v68;
  CCHomeTrigger *v69;
  CCHome *v70;
  CCHomeZone *v71;
  CCHomeRoom *v72;
  CCHomeService *v73;
  CCHomeServiceGroup *v74;
  CCHomeScene *v75;
  CCHomeAccessory *v76;
  void *v77;
  CCHomeAccessory *v78;
  CCHomeAccessory *v79;
  CCHome *v80;
  CCHomeZone *v81;
  CCHomeRoom *v82;
  CCHomeService *v83;
  CCHomeServiceGroup *v84;
  CCHomeScene *v85;
  CCHomeTrigger *v86;
  objc_class *v87;
  void *v88;
  objc_class *v89;
  void *v90;
  void *v91;
  BOOL v92;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;

  v5 = a3;
  v6 = (char *)objc_msgSend(objc_alloc(MEMORY[0x24BE156A0]), "initWithData:", v5);
  v7 = (int *)MEMORY[0x24BE15728];
  v8 = (int *)MEMORY[0x24BE15720];
  v9 = (int *)MEMORY[0x24BE15718];
  if (*(_QWORD *)&v6[*MEMORY[0x24BE15728]] >= *(_QWORD *)&v6[*MEMORY[0x24BE15720]])
    goto LABEL_48;
  v10 = 0;
  v11 = (int *)MEMORY[0x24BE15710];
  do
  {
    if (*(_QWORD *)&v6[*v9])
      v12 = 0;
    else
      v12 = v10 == 0;
    if (!v12)
      break;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    while (1)
    {
      v16 = *v7;
      v17 = *(_QWORD *)&v6[v16];
      if (v17 == -1 || v17 >= *(_QWORD *)&v6[*v8])
        break;
      v18 = *(_BYTE *)(*(_QWORD *)&v6[*v11] + v17);
      *(_QWORD *)&v6[v16] = v17 + 1;
      v15 |= (unint64_t)(v18 & 0x7F) << v13;
      if ((v18 & 0x80) == 0)
        goto LABEL_17;
      v13 += 7;
      if (v14++ >= 9)
      {
        v15 = 0;
        if (*(_QWORD *)&v6[*v9])
          goto LABEL_49;
        goto LABEL_18;
      }
    }
    *(_QWORD *)&v6[*v9] = 1;
LABEL_17:
    if (*(_QWORD *)&v6[*v9])
      goto LABEL_49;
LABEL_18:
    switch((v15 >> 3))
    {
      case 1u:
        v20 = [CCHome alloc];
        CCPBReaderReadDataNoCopy();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = 0;
        v22 = -[CCItemMessage initWithData:error:](v20, "initWithData:error:", v21, &v101);
        v10 = v101;
        home = self->_home;
        self->_home = v22;

        if (!v10)
        {
          self->_entityType = 1;
          zone = self->_zone;
          self->_zone = 0;

          goto LABEL_25;
        }
        break;
      case 2u:
        v25 = [CCHomeZone alloc];
        CCPBReaderReadDataNoCopy();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = 0;
        v27 = -[CCItemMessage initWithData:error:](v25, "initWithData:error:", v26, &v100);
        v10 = v100;
        v28 = self->_zone;
        self->_zone = v27;

        if (!v10)
        {
          v29 = self->_home;
          self->_home = 0;

          self->_entityType = 2;
LABEL_25:
          room = self->_room;
          self->_room = 0;

          goto LABEL_28;
        }
        break;
      case 3u:
        v31 = [CCHomeRoom alloc];
        CCPBReaderReadDataNoCopy();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v99 = 0;
        v33 = -[CCItemMessage initWithData:error:](v31, "initWithData:error:", v32, &v99);
        v10 = v99;
        v34 = self->_room;
        self->_room = v33;

        if (!v10)
        {
          v35 = self->_home;
          self->_home = 0;

          v36 = self->_zone;
          self->_zone = 0;

          self->_entityType = 3;
LABEL_28:
          service = self->_service;
          self->_service = 0;

          goto LABEL_31;
        }
        break;
      case 4u:
        v38 = [CCHomeService alloc];
        CCPBReaderReadDataNoCopy();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = 0;
        v40 = -[CCItemMessage initWithData:error:](v38, "initWithData:error:", v39, &v98);
        v10 = v98;
        v41 = self->_service;
        self->_service = v40;

        if (!v10)
        {
          v42 = self->_home;
          self->_home = 0;

          v43 = self->_zone;
          self->_zone = 0;

          v44 = self->_room;
          self->_room = 0;

          self->_entityType = 4;
LABEL_31:
          serviceGroup = self->_serviceGroup;
          self->_serviceGroup = 0;

          goto LABEL_34;
        }
        break;
      case 5u:
        v46 = [CCHomeServiceGroup alloc];
        CCPBReaderReadDataNoCopy();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = 0;
        v48 = -[CCItemMessage initWithData:error:](v46, "initWithData:error:", v47, &v97);
        v10 = v97;
        v49 = self->_serviceGroup;
        self->_serviceGroup = v48;

        if (!v10)
        {
          v50 = self->_home;
          self->_home = 0;

          v51 = self->_zone;
          self->_zone = 0;

          v52 = self->_room;
          self->_room = 0;

          v53 = self->_service;
          self->_service = 0;

          self->_entityType = 5;
LABEL_34:
          scene = self->_scene;
          self->_scene = 0;

          goto LABEL_35;
        }
        break;
      case 6u:
        v57 = [CCHomeScene alloc];
        CCPBReaderReadDataNoCopy();
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = 0;
        v59 = -[CCItemMessage initWithData:error:](v57, "initWithData:error:", v58, &v96);
        v10 = v96;
        v60 = self->_scene;
        self->_scene = v59;

        if (!v10)
        {
          v61 = self->_home;
          self->_home = 0;

          v62 = self->_zone;
          self->_zone = 0;

          v63 = self->_room;
          self->_room = 0;

          v64 = self->_service;
          self->_service = 0;

          v65 = self->_serviceGroup;
          self->_serviceGroup = 0;

          self->_entityType = 6;
LABEL_35:
          trigger = self->_trigger;
          self->_trigger = 0;

          goto LABEL_36;
        }
        break;
      case 7u:
        v66 = [CCHomeTrigger alloc];
        CCPBReaderReadDataNoCopy();
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = 0;
        v68 = -[CCItemMessage initWithData:error:](v66, "initWithData:error:", v67, &v95);
        v10 = v95;
        v69 = self->_trigger;
        self->_trigger = v68;

        if (!v10)
        {
          v70 = self->_home;
          self->_home = 0;

          v71 = self->_zone;
          self->_zone = 0;

          v72 = self->_room;
          self->_room = 0;

          v73 = self->_service;
          self->_service = 0;

          v74 = self->_serviceGroup;
          self->_serviceGroup = 0;

          v75 = self->_scene;
          self->_scene = 0;

          self->_entityType = 7;
LABEL_36:
          accessory = self->_accessory;
          self->_accessory = 0;

        }
        break;
      case 8u:
        v76 = [CCHomeAccessory alloc];
        CCPBReaderReadDataNoCopy();
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = 0;
        v78 = -[CCItemMessage initWithData:error:](v76, "initWithData:error:", v77, &v94);
        v10 = v94;
        v79 = self->_accessory;
        self->_accessory = v78;

        if (!v10)
        {
          v80 = self->_home;
          self->_home = 0;

          v81 = self->_zone;
          self->_zone = 0;

          v82 = self->_room;
          self->_room = 0;

          v83 = self->_service;
          self->_service = 0;

          v84 = self->_serviceGroup;
          self->_serviceGroup = 0;

          v85 = self->_scene;
          self->_scene = 0;

          v86 = self->_trigger;
          self->_trigger = 0;

          self->_entityType = 8;
        }
        break;
      default:
        if ((CCPBReaderSkipValueWithTag() & 1) != 0)
        {
          v10 = 0;
        }
        else
        {
          v87 = (objc_class *)objc_opt_class();
          NSStringFromClass(v87);
          v88 = (void *)objc_claimAutoreleasedReturnValue();
          CCSkipFieldErrorForMessage();
          v10 = (id)objc_claimAutoreleasedReturnValue();

        }
        break;
    }
  }
  while (*(_QWORD *)&v6[*v7] < *(_QWORD *)&v6[*v8]);
  if (v10)
  {
    CCSetError();
  }
  else
  {
LABEL_48:
    if (!*(_QWORD *)&v6[*v9])
    {
      v10 = 0;
      v92 = 1;
      goto LABEL_52;
    }
LABEL_49:
    v89 = (objc_class *)objc_opt_class();
    NSStringFromClass(v89);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    CCInvalidBufferErrorForMessage();
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    CCSetError();

    v10 = 0;
  }
  v92 = 0;
LABEL_52:

  return v92;
}

- (CCHome)home
{
  return (CCHome *)(id)-[CCHome copy](self->_home, "copy");
}

- (CCHomeZone)zone
{
  return (CCHomeZone *)(id)-[CCHomeZone copy](self->_zone, "copy");
}

- (CCHomeRoom)room
{
  return (CCHomeRoom *)(id)-[CCHomeRoom copy](self->_room, "copy");
}

- (CCHomeService)service
{
  return (CCHomeService *)(id)-[CCHomeService copy](self->_service, "copy");
}

- (CCHomeServiceGroup)serviceGroup
{
  return (CCHomeServiceGroup *)(id)-[CCHomeServiceGroup copy](self->_serviceGroup, "copy");
}

- (CCHomeScene)scene
{
  return (CCHomeScene *)(id)-[CCHomeScene copy](self->_scene, "copy");
}

- (CCHomeTrigger)trigger
{
  return (CCHomeTrigger *)(id)-[CCHomeTrigger copy](self->_trigger, "copy");
}

- (CCHomeAccessory)accessory
{
  return (CCHomeAccessory *)(id)-[CCHomeAccessory copy](self->_accessory, "copy");
}

- (void)enumerateFieldsUsingBlock:(id)a3 parentFieldType:(unsigned __int16)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void (**v13)(id, void *);

  v13 = (void (**)(id, void *))a3;
  if (self->_home)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 7691, self->_home);
    v13[2](v13, v5);

  }
  if (self->_zone)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 7692, self->_zone);
    v13[2](v13, v6);

  }
  if (self->_room)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 7693, self->_room);
    v13[2](v13, v7);

  }
  if (self->_service)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 7694, self->_service);
    v13[2](v13, v8);

  }
  if (self->_serviceGroup)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 7695, self->_serviceGroup);
    v13[2](v13, v9);

  }
  if (self->_scene)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 7696, self->_scene);
    v13[2](v13, v10);

  }
  if (self->_trigger)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 7697, self->_trigger);
    v13[2](v13, v11);

  }
  if (self->_accessory)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE15670]), "initWithFieldType:subMessageValue:", 7698, self->_accessory);
    v13[2](v13, v12);

  }
}

- (id)jsonDictionary
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = (void *)objc_opt_new();
  if (self->_home)
  {
    -[CCHomeContent home](self, "home");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "jsonDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("home"));

  }
  if (self->_zone)
  {
    -[CCHomeContent zone](self, "zone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "jsonDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("zone"));

  }
  if (self->_room)
  {
    -[CCHomeContent room](self, "room");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "jsonDictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("room"));

  }
  if (self->_service)
  {
    -[CCHomeContent service](self, "service");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "jsonDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("service"));

  }
  if (self->_serviceGroup)
  {
    -[CCHomeContent serviceGroup](self, "serviceGroup");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "jsonDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("serviceGroup"));

  }
  if (self->_scene)
  {
    -[CCHomeContent scene](self, "scene");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "jsonDictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("scene"));

  }
  if (self->_trigger)
  {
    -[CCHomeContent trigger](self, "trigger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "jsonDictionary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("trigger"));

  }
  if (self->_accessory)
  {
    -[CCHomeContent accessory](self, "accessory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "jsonDictionary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("accessory"));

  }
  v20 = (void *)objc_msgSend(v3, "copy");

  return v20;
}

- (CCHomeContent)initWithJSONDictionary:(id)a3 error:(id *)a4
{
  id v6;
  char IsInstanceOfExpectedClass;
  id v8;
  CCHomeTrigger *v9;
  CCHome *v10;
  id v11;
  void *v12;
  CCHomeZone *v13;
  CCHome *v14;
  CCHomeRoom *v15;
  CCHomeZone *v16;
  CCHomeService *v17;
  CCHomeRoom *v18;
  CCHomeServiceGroup *v19;
  CCHomeService *v20;
  CCHomeServiceGroup *v21;
  CCHomeRoom *v22;
  uint64_t v23;
  CCHomeScene *v24;
  CCHomeServiceGroup *v25;
  CCHomeScene *v26;
  CCHomeContent *v27;
  CCHomeServiceGroup *v28;
  CCHomeServiceGroup *v29;
  uint64_t v30;
  CCHomeTrigger *v31;
  id v32;
  uint64_t v33;
  CCHomeAccessory *v34;
  CCHomeTrigger *v35;
  CCHomeAccessory *v36;
  CCHomeTrigger *v37;
  int v38;
  CCHomeTrigger *v40;
  CCHome *v41;
  CCHomeZone *v42;
  CCHomeRoom *v43;
  CCHomeTrigger *v44;
  CCHomeTrigger *v45;
  unsigned int v46;
  CCHomeService *v47;
  CCHomeRoom *v48;
  CCHomeServiceGroup *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58[2];

  v6 = a3;
  objc_opt_class();
  v58[1] = 0;
  IsInstanceOfExpectedClass = CCValidateIsInstanceOfExpectedClass();
  v8 = 0;
  if ((IsInstanceOfExpectedClass & 1) != 0)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("home"));
    v9 = (CCHomeTrigger *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v58[0] = 0;
      v10 = -[CCHome initWithJSONDictionary:error:]([CCHome alloc], "initWithJSONDictionary:error:", v9, v58);
      v11 = v58[0];
      v12 = v11;
      if (!v10 || v11)
      {
        CCSetError();
        v27 = 0;
LABEL_71:

        goto LABEL_72;
      }

      v9 = (CCHomeTrigger *)v10;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("zone"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v57 = 0;
      v13 = -[CCHomeZone initWithJSONDictionary:error:]([CCHomeZone alloc], "initWithJSONDictionary:error:", v12, &v57);
      v14 = (CCHome *)v57;
      v10 = v14;
      if (!v13 || v14)
      {
        CCSetError();
        v27 = 0;
LABEL_70:

        goto LABEL_71;
      }

      v12 = v13;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("room"));
    v10 = (CCHome *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v56 = 0;
      v15 = -[CCHomeRoom initWithJSONDictionary:error:]([CCHomeRoom alloc], "initWithJSONDictionary:error:", v10, &v56);
      v16 = (CCHomeZone *)v56;
      v13 = v16;
      if (!v15 || v16)
      {
        CCSetError();
        v27 = 0;
LABEL_69:

        goto LABEL_70;
      }

      v10 = (CCHome *)v15;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("service"));
    v13 = (CCHomeZone *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v55 = 0;
      v17 = -[CCHomeService initWithJSONDictionary:error:]([CCHomeService alloc], "initWithJSONDictionary:error:", v13, &v55);
      v18 = (CCHomeRoom *)v55;
      v15 = v18;
      if (!v17 || v18)
      {
        CCSetError();
        v27 = 0;
LABEL_68:

        goto LABEL_69;
      }

      v13 = (CCHomeZone *)v17;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("serviceGroup"));
    v15 = (CCHomeRoom *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v54 = 0;
      v19 = -[CCHomeServiceGroup initWithJSONDictionary:error:]([CCHomeServiceGroup alloc], "initWithJSONDictionary:error:", v15, &v54);
      v20 = (CCHomeService *)v54;
      v21 = v19;
      v17 = v20;
      if (!v21 || v20)
      {
        v28 = v21;
        CCSetError();
        v29 = v28;
        v27 = 0;
LABEL_67:

        goto LABEL_68;
      }
      v22 = (CCHomeRoom *)v21;

      v15 = v22;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("scene"));
    v23 = objc_claimAutoreleasedReturnValue();
    v48 = v15;
    if (v23)
    {
      v17 = (CCHomeService *)v23;
      v53 = 0;
      v24 = -[CCHomeScene initWithJSONDictionary:error:]([CCHomeScene alloc], "initWithJSONDictionary:error:", v23, &v53);
      v25 = (CCHomeServiceGroup *)v53;
      v50 = v24;
      if (!v24 || v25)
      {
        v49 = v25;
        CCSetError();
        v27 = 0;
        v15 = v48;
LABEL_66:

        v29 = v49;
        goto LABEL_67;
      }

      v26 = v24;
      v15 = v48;
    }
    else
    {
      v26 = 0;
    }
    v47 = (CCHomeService *)v26;
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("trigger"));
    v30 = objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v52 = 0;
      v49 = (CCHomeServiceGroup *)v30;
      v31 = -[CCHomeTrigger initWithJSONDictionary:error:]([CCHomeTrigger alloc], "initWithJSONDictionary:error:", v30, &v52);
      v32 = v52;
      if (!v31 || v32)
      {
        v50 = v32;
        CCSetError();
        v27 = 0;
        goto LABEL_65;
      }

      v49 = (CCHomeServiceGroup *)v31;
    }
    else
    {
      v49 = 0;
    }
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("accessory"));
    v33 = objc_claimAutoreleasedReturnValue();
    if (!v33)
    {
      v36 = 0;
      goto LABEL_45;
    }
    v50 = (void *)v33;
    v51 = 0;
    v34 = -[CCHomeAccessory initWithJSONDictionary:error:]([CCHomeAccessory alloc], "initWithJSONDictionary:error:", v33, &v51);
    v35 = (CCHomeTrigger *)v51;
    v31 = v35;
    if (v34 && !v35)
    {

      v36 = v34;
      v15 = v48;
LABEL_45:
      v50 = v36;
      if (v9)
      {
        v37 = v9;
        v38 = 1;
      }
      else
      {
        v38 = 0;
      }
      v31 = v9;
      if (v12)
      {
        v31 = v12;

        v38 = 2;
      }
      if (v10)
      {
        v41 = v10;

        v38 = 3;
        v31 = (CCHomeTrigger *)v41;
      }
      if (v13)
      {
        v42 = v13;

        v38 = 4;
        v31 = (CCHomeTrigger *)v42;
      }
      if (v15)
      {
        v43 = v15;

        v38 = 5;
        v31 = (CCHomeTrigger *)v43;
      }
      if (v47)
      {
        v44 = v47;

        v38 = 6;
        v31 = v44;
      }
      if (v49)
      {
        v45 = v49;

        v38 = 7;
        v31 = v45;
      }
      if (v50)
      {
        v40 = v50;

        v46 = 8;
        v31 = v40;
      }
      else
      {
        v46 = v38;
      }
      v27 = -[CCHomeContent initWithEntity:entityType:error:]([CCHomeContent alloc], "initWithEntity:entityType:error:", v31, v46, a4);
      goto LABEL_65;
    }
    CCSetError();

    v27 = 0;
    v15 = v48;
LABEL_65:

    v17 = v47;
    goto LABEL_66;
  }
  CCSetError();
  v27 = 0;
LABEL_72:

  return v27;
}

- (unsigned)entityType
{
  return self->_entityType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_trigger, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_serviceGroup, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_room, 0);
  objc_storeStrong((id *)&self->_zone, 0);
  objc_storeStrong((id *)&self->_home, 0);
}

+ (unsigned)itemType
{
  return 7690;
}

+ (id)descriptionForTypeIdentifier:(unsigned __int16)a3
{
  if ((a3 - 7690) > 0x14)
    return 0;
  else
    return off_251030388[(unsigned __int16)(a3 - 7690)];
}

+ (Class)metaContentMessageClass
{
  return (Class)objc_opt_class();
}

+ (Class)contentMessageClass
{
  return (Class)objc_opt_class();
}

@end
