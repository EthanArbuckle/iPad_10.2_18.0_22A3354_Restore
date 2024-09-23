@implementation HMDAudioAnalysisEventBulletinNotificationRegistration

- (id)predicate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  -[HMDBulletinNotificationRegistration conditions](self, "conditions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDNotificationConditionConverter predicatesFromConditions:](HMDNotificationConditionConverter, "predicatesFromConditions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD74D0], "predicateForAudioAnalysisOptions:", -[HMDAudioAnalysisEventBulletinNotificationRegistration audioAnalysisClassifierOptions](self, "audioAnalysisClassifierOptions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __66__HMDAudioAnalysisEventBulletinNotificationRegistration_predicate__block_invoke;
  v11[3] = &unk_24E794050;
  v12 = v7;
  v8 = v7;
  __66__HMDAudioAnalysisEventBulletinNotificationRegistration_predicate__block_invoke((uint64_t)v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (HMDAudioAnalysisEventBulletinNotificationRegistration)initWithConditions:(id)a3 audioAnalysisClassifierOptions:(unint64_t)a4 accessoryUUID:(id)a5
{
  id v9;
  HMDAudioAnalysisEventBulletinNotificationRegistration *v10;
  HMDAudioAnalysisEventBulletinNotificationRegistration *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMDAudioAnalysisEventBulletinNotificationRegistration;
  v10 = -[HMDBulletinNotificationRegistration initWithConditions:](&v13, sel_initWithConditions_, a3);
  v11 = v10;
  if (v10)
  {
    v10->_audioAnalysisClassifierOptions = a4;
    objc_storeStrong((id *)&v10->_accessoryUUID, a5);
  }

  return v11;
}

- (HMDAudioAnalysisEventBulletinNotificationRegistration)initWithLocalBulletinAudioAnalysisRegistration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  HMDAudioAnalysisEventBulletinNotificationRegistration *v10;

  v4 = a3;
  objc_msgSend(v4, "conditions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[HMDBulletinNotificationRegistrationUtilities conditionsFromLocalConditions:](HMDBulletinNotificationRegistrationUtilities, "conditionsFromLocalConditions:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBulletinNotificationRegistrationUtilities conditionsFromLocalConditions:](HMDBulletinNotificationRegistrationUtilities, "conditionsFromLocalConditions:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v8 = objc_msgSend(v4, "classifierOptions");
  objc_msgSend(v4, "accessoryModelID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[HMDAudioAnalysisEventBulletinNotificationRegistration initWithConditions:audioAnalysisClassifierOptions:accessoryUUID:](self, "initWithConditions:audioAnalysisClassifierOptions:accessoryUUID:", v6, v8, v9);
  return v10;
}

- (HMDAudioAnalysisEventBulletinNotificationRegistration)initWithPredicate:(id)a3 accessoryUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  HMDAudioAnalysisEventBulletinNotificationRegistration *v10;

  v6 = a4;
  v7 = a3;
  +[HMDNotificationConditionConverter conditionsFromPredicate:](HMDNotificationConditionConverter, "conditionsFromPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD78D8], "audioAnalysisNotificationOptionsInPredicate:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend(v9, "unsignedIntValue");
  v10 = -[HMDAudioAnalysisEventBulletinNotificationRegistration initWithConditions:audioAnalysisClassifierOptions:accessoryUUID:](self, "initWithConditions:audioAnalysisClassifierOptions:accessoryUUID:", v8, v7, v6);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  HMDAudioAnalysisEventBulletinNotificationRegistration *v6;
  HMDAudioAnalysisEventBulletinNotificationRegistration *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6 == self)
  {
    v13 = 1;
  }
  else
  {
    -[HMDBulletinNotificationRegistration conditions](v6, "conditions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDBulletinNotificationRegistration conditions](self, "conditions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqual:", v9))
    {
      -[HMDAudioAnalysisEventBulletinNotificationRegistration accessoryUUID](v7, "accessoryUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAudioAnalysisEventBulletinNotificationRegistration accessoryUUID](self, "accessoryUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "isEqual:", v11))
      {
        v12 = -[HMDAudioAnalysisEventBulletinNotificationRegistration audioAnalysisClassifierOptions](v7, "audioAnalysisClassifierOptions");
        v13 = v12 == -[HMDAudioAnalysisEventBulletinNotificationRegistration audioAnalysisClassifierOptions](self, "audioAnalysisClassifierOptions");
      }
      else
      {
        v13 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDAudioAnalysisEventBulletinNotificationRegistration;
  v4 = a3;
  -[HMDBulletinNotificationRegistration encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[HMDAudioAnalysisEventBulletinNotificationRegistration accessoryUUID](self, "accessoryUUID", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Accessory"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDAudioAnalysisEventBulletinNotificationRegistration audioAnalysisClassifierOptions](self, "audioAnalysisClassifierOptions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("Classifier"));

}

- (HMDAudioAnalysisEventBulletinNotificationRegistration)initWithCoder:(id)a3
{
  id v4;
  HMDBulletinNotificationRegistration *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  HMDAudioAnalysisEventBulletinNotificationRegistration *v10;

  v4 = a3;
  v5 = -[HMDBulletinNotificationRegistration initWithCoder:]([HMDBulletinNotificationRegistration alloc], "initWithCoder:", v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Accessory"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Classifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "unsignedIntegerValue");
    -[HMDBulletinNotificationRegistration conditions](v5, "conditions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[HMDAudioAnalysisEventBulletinNotificationRegistration initWithConditions:audioAnalysisClassifierOptions:accessoryUUID:](self, "initWithConditions:audioAnalysisClassifierOptions:accessoryUUID:", v9, v8, v6);

    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)serializedRegistrationForRemoteMessage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMDAudioAnalysisEventBulletinNotificationRegistration;
  -[HMDBulletinNotificationRegistration serializedRegistrationForRemoteMessage](&v9, sel_serializedRegistrationForRemoteMessage);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMDAudioAnalysisEventBulletinNotificationRegistration accessoryUUID](self, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("Accessory"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDAudioAnalysisEventBulletinNotificationRegistration audioAnalysisClassifierOptions](self, "audioAnalysisClassifierOptions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("Classifier"));

  return v4;
}

- (HMDAudioAnalysisEventBulletinNotificationRegistration)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDAudioAnalysisEventBulletinNotificationRegistration *v7;
  uint64_t v8;
  NSUUID *accessoryUUID;
  void *v10;
  void *v11;
  id v12;
  unsigned int v13;
  HMDAudioAnalysisEventBulletinNotificationRegistration *v14;
  objc_super v16;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend((id)objc_opt_class(), "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "doesTypeMatch:against:", v4, v6);

  if ((_DWORD)v5)
  {
    v16.receiver = self;
    v16.super_class = (Class)HMDAudioAnalysisEventBulletinNotificationRegistration;
    v7 = -[HMDBulletinNotificationRegistration initWithDictionary:](&v16, sel_initWithDictionary_, v4);
    if (v7)
    {
      objc_msgSend(v4, "hmf_UUIDForKey:", CFSTR("Accessory"));
      v8 = objc_claimAutoreleasedReturnValue();
      accessoryUUID = v7->_accessoryUUID;
      v7->_accessoryUUID = (NSUUID *)v8;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Classifier"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;
      v12 = v11;

      v13 = objc_msgSend(v12, "unsignedIntValue");
      v7->_audioAnalysisClassifierOptions = v13;
    }
    self = v7;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)HMDAudioAnalysisEventBulletinNotificationRegistration;
  -[HMDBulletinNotificationRegistration attributeDescriptions](&v13, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAudioAnalysisEventBulletinNotificationRegistration accessoryUUID](self, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("accessoryUUID"), v5);
  v14[0] = v6;
  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDAudioAnalysisEventBulletinNotificationRegistration audioAnalysisClassifierOptions](self, "audioAnalysisClassifierOptions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("classifiers"), v8);
  v14[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)audioAnalysisClassifierOptions
{
  return self->_audioAnalysisClassifierOptions;
}

- (NSUUID)accessoryUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
}

id __66__HMDAudioAnalysisEventBulletinNotificationRegistration_predicate__block_invoke(uint64_t a1)
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  return CFSTR("HMDAudioAnalysisEventBulletinNotificationRegistration");
}

@end
