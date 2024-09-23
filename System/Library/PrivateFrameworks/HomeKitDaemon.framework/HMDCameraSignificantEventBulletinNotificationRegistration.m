@implementation HMDCameraSignificantEventBulletinNotificationRegistration

- (HMDCameraSignificantEventBulletinNotificationRegistration)initWithCameraIdentifier:(id)a3 notificationModes:(unint64_t)a4 significantEventTypes:(unint64_t)a5 personFamiliarityOptions:(unint64_t)a6 conditions:(id)a7
{
  id v12;
  id v13;
  void *v14;
  HMDCameraSignificantEventBulletinNotificationRegistration *v15;
  uint64_t v16;
  NSUUID *cameraIdentifier;
  HMDCameraSignificantEventBulletinNotificationRegistration *v19;
  SEL v20;
  objc_super v21;

  v12 = a3;
  v13 = a7;
  if (v12)
  {
    v14 = v13;
    v21.receiver = self;
    v21.super_class = (Class)HMDCameraSignificantEventBulletinNotificationRegistration;
    v15 = -[HMDBulletinNotificationRegistration initWithConditions:](&v21, sel_initWithConditions_, v13);
    if (v15)
    {
      v16 = objc_msgSend(v12, "copy");
      cameraIdentifier = v15->_cameraIdentifier;
      v15->_cameraIdentifier = (NSUUID *)v16;

      v15->_notificationModes = a4;
      v15->_significantEventTypes = a5;
      v15->_personFamiliarityOptions = a6;
    }

    return v15;
  }
  else
  {
    v19 = (HMDCameraSignificantEventBulletinNotificationRegistration *)_HMFPreconditionFailure();
    return (HMDCameraSignificantEventBulletinNotificationRegistration *)-[HMDCameraSignificantEventBulletinNotificationRegistration predicate](v19, v20);
  }
}

- (id)predicate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  -[HMDBulletinNotificationRegistration conditions](self, "conditions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDNotificationConditionConverter predicatesFromConditions:](HMDNotificationConditionConverter, "predicatesFromConditions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((-[HMDCameraSignificantEventBulletinNotificationRegistration notificationModes](self, "notificationModes") & 1) != 0
    || (-[HMDCameraSignificantEventBulletinNotificationRegistration significantEventTypes](self, "significantEventTypes") & 0x1F) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD7530], "predicateForSignificantEventTypes:", -[HMDCameraSignificantEventBulletinNotificationRegistration significantEventTypes](self, "significantEventTypes"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObject:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  if ((-[HMDCameraSignificantEventBulletinNotificationRegistration personFamiliarityOptions](self, "personFamiliarityOptions") & 7) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD7530], "predicateForPersonFamiliarityOptions:", -[HMDCameraSignificantEventBulletinNotificationRegistration personFamiliarityOptions](self, "personFamiliarityOptions"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObject:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v9;
  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __70__HMDCameraSignificantEventBulletinNotificationRegistration_predicate__block_invoke;
  v13[3] = &unk_24E794050;
  v14 = v5;
  v10 = v5;
  __70__HMDCameraSignificantEventBulletinNotificationRegistration_predicate__block_invoke((uint64_t)v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (HMDCameraSignificantEventBulletinNotificationRegistration)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDCameraSignificantEventBulletinNotificationRegistration *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSUUID *cameraIdentifier;
  void *v12;
  void *v13;
  void *v14;
  HMDCameraSignificantEventBulletinNotificationRegistration *v15;
  HMDCameraSignificantEventBulletinNotificationRegistration *v17;
  SEL v18;
  objc_super v19;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "doesTypeMatch:against:", v4, v6);

  if (!(_DWORD)v5)
  {
    v15 = 0;
    goto LABEL_7;
  }
  v19.receiver = self;
  v19.super_class = (Class)HMDCameraSignificantEventBulletinNotificationRegistration;
  v7 = -[HMDBulletinNotificationRegistration initWithDictionary:](&v19, sel_initWithDictionary_, v4);
  if (!v7)
  {
LABEL_5:
    self = v7;
    v15 = self;
LABEL_7:

    return v15;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDCSEBNR.ck.ci"));
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v8);
    cameraIdentifier = v7->_cameraIdentifier;
    v7->_cameraIdentifier = (NSUUID *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDCSEBNR.ck.nm"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_notificationModes = objc_msgSend(v12, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDCSEBNR.ck.set"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_significantEventTypes = objc_msgSend(v13, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDCSEBNR.ck.pfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_personFamiliarityOptions = objc_msgSend(v14, "integerValue");

    goto LABEL_5;
  }
  v17 = (HMDCameraSignificantEventBulletinNotificationRegistration *)_HMFPreconditionFailure();
  return (HMDCameraSignificantEventBulletinNotificationRegistration *)-[HMDCameraSignificantEventBulletinNotificationRegistration serializedRegistrationForRemoteMessage](v17, v18);
}

- (id)serializedRegistrationForRemoteMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HMDCameraSignificantEventBulletinNotificationRegistration;
  -[HMDBulletinNotificationRegistration serializedRegistrationForRemoteMessage](&v11, sel_serializedRegistrationForRemoteMessage);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMDCameraSignificantEventBulletinNotificationRegistration cameraIdentifier](self, "cameraIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("HMDCSEBNR.ck.ci"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDCameraSignificantEventBulletinNotificationRegistration notificationModes](self, "notificationModes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("HMDCSEBNR.ck.nm"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDCameraSignificantEventBulletinNotificationRegistration significantEventTypes](self, "significantEventTypes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("HMDCSEBNR.ck.set"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDCameraSignificantEventBulletinNotificationRegistration personFamiliarityOptions](self, "personFamiliarityOptions"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("HMDCSEBNR.ck.pfo"));

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  objc_super v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (v14.receiver = self,
        v14.super_class = (Class)HMDCameraSignificantEventBulletinNotificationRegistration,
        -[HMDBulletinNotificationRegistration isEqual:](&v14, sel_isEqual_, v6)))
  {
    -[HMDCameraSignificantEventBulletinNotificationRegistration cameraIdentifier](self, "cameraIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cameraIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqual:", v8)
      && (v9 = -[HMDCameraSignificantEventBulletinNotificationRegistration notificationModes](self, "notificationModes"),
          v9 == objc_msgSend(v6, "notificationModes"))
      && (v10 = -[HMDCameraSignificantEventBulletinNotificationRegistration significantEventTypes](self, "significantEventTypes"), v10 == objc_msgSend(v6, "significantEventTypes")))
    {
      v11 = -[HMDCameraSignificantEventBulletinNotificationRegistration personFamiliarityOptions](self, "personFamiliarityOptions");
      v12 = v11 == objc_msgSend(v6, "personFamiliarityOptions");
    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDCameraSignificantEventBulletinNotificationRegistration;
  v4 = a3;
  -[HMDBulletinNotificationRegistration encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  -[HMDCameraSignificantEventBulletinNotificationRegistration cameraIdentifier](self, "cameraIdentifier", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMDCSEBNR.ck.ci"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDCameraSignificantEventBulletinNotificationRegistration notificationModes](self, "notificationModes"), CFSTR("HMDCSEBNR.ck.nm"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDCameraSignificantEventBulletinNotificationRegistration significantEventTypes](self, "significantEventTypes"), CFSTR("HMDCSEBNR.ck.set"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMDCameraSignificantEventBulletinNotificationRegistration personFamiliarityOptions](self, "personFamiliarityOptions"), CFSTR("HMDCSEBNR.ck.pfo"));

}

- (HMDCameraSignificantEventBulletinNotificationRegistration)initWithCoder:(id)a3
{
  id v4;
  HMDBulletinNotificationRegistration *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  HMDCameraSignificantEventBulletinNotificationRegistration *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[HMDBulletinNotificationRegistration initWithCoder:]([HMDBulletinNotificationRegistration alloc], "initWithCoder:", v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMDCSEBNR.ck.ci"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMDCSEBNR.ck.nm"));
      v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMDCSEBNR.ck.set"));
      v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMDCSEBNR.ck.pfo"));
      -[HMDBulletinNotificationRegistration conditions](v5, "conditions");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[HMDCameraSignificantEventBulletinNotificationRegistration initWithCameraIdentifier:notificationModes:significantEventTypes:personFamiliarityOptions:conditions:](self, "initWithCameraIdentifier:notificationModes:significantEventTypes:personFamiliarityOptions:conditions:", v6, v7, v8, v9, v10);

      v11 = self;
    }
    else
    {
      v12 = (void *)MEMORY[0x227676638]();
      self = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543618;
        v17 = v14;
        v18 = 2112;
        v19 = 0;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded cameraIdentifier: %@", (uint8_t *)&v16, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v18;
  void *v19;
  objc_super v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)HMDCameraSignificantEventBulletinNotificationRegistration;
  -[HMDBulletinNotificationRegistration attributeDescriptions](&v20, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCameraSignificantEventBulletinNotificationRegistration cameraIdentifier](self, "cameraIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("Camera Identifier"), v19);
  v21[0] = v5;
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  v18 = -[HMDCameraSignificantEventBulletinNotificationRegistration notificationModes](self, "notificationModes");
  NSPrintF();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Notification Modes"), v7, v18, &unk_2226A1140);
  v21[1] = v8;
  v9 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCameraSignificantEventBulletinNotificationRegistration significantEventTypes](self, "significantEventTypes");
  HMCameraSignificantEventTypesAsString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Significant Event Types"), v10);
  v21[2] = v11;
  v12 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDCameraSignificantEventBulletinNotificationRegistration personFamiliarityOptions](self, "personFamiliarityOptions");
  HMCameraSignificantEventPersonFamiliarityOptionsAsString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Person Familiarity Options"), v13);
  v21[3] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSUUID)cameraIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)notificationModes
{
  return self->_notificationModes;
}

- (unint64_t)significantEventTypes
{
  return self->_significantEventTypes;
}

- (unint64_t)personFamiliarityOptions
{
  return self->_personFamiliarityOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cameraIdentifier, 0);
}

id __70__HMDCameraSignificantEventBulletinNotificationRegistration_predicate__block_invoke(uint64_t a1)
{
  void *v2;

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") < 2)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "count") == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "firstObject");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }
  }
  else
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", 1, *(_QWORD *)(a1 + 32));
  }
  return v2;
}

+ (id)type
{
  return CFSTR("HMDCSEBNR.type");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
