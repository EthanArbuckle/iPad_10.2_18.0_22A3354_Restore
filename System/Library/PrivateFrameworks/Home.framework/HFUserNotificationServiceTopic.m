@implementation HFUserNotificationServiceTopic

- (HFUserNotificationServiceTopic)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithServiceTypes_accessoryCategoryTypes_topicNameLocalizationKey_iconDescriptor_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFUserNotificationServiceTopic.m"), 32, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFUserNotificationServiceTopic init]",
    v5);

  return 0;
}

- (HFUserNotificationServiceTopic)initWithServiceType:(id)a3 topicNameLocalizationKey:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  HFImageIconDescriptor *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  HFUserNotificationServiceTopic *v15;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CEA650];
  v8 = a4;
  objc_msgSend(v7, "configurationWithPointSize:", 26.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFServiceIconFactory defaultSymbolIconIdentifierForServiceType:](HFServiceIconFactory, "defaultSymbolIconIdentifierForServiceType:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:configuration:", v10, v9);
  if (!v11)
  {
    HFLogForCategory(0);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v6;
      _os_log_impl(&dword_1DD34E000, v12, OS_LOG_TYPE_DEFAULT, "HFUserNotificationServiceTopic: Couldn't find SF Symbol for service type: %@", (uint8_t *)&v17, 0xCu);
    }

    +[HFServiceIconFactory defaultIconDescriptorForServiceType:serviceSubtype:](HFServiceIconFactory, "defaultIconDescriptorForServiceType:serviceSubtype:", v6, 0);
    v11 = (HFImageIconDescriptor *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HFUserNotificationServiceTopic initWithServiceTypes:accessoryCategoryTypes:topicNameLocalizationKey:iconDescriptor:](self, "initWithServiceTypes:accessoryCategoryTypes:topicNameLocalizationKey:iconDescriptor:", v13, v14, v8, v11);

  return v15;
}

- (HFUserNotificationServiceTopic)initWithServiceTypes:(id)a3 accessoryCategoryTypes:(id)a4 topicNameLocalizationKey:(id)a5 iconDescriptor:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HFUserNotificationServiceTopic *v15;
  HFUserNotificationServiceTopic *v16;
  uint64_t v17;
  NSString *topicName;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)HFUserNotificationServiceTopic;
  v15 = -[HFUserNotificationServiceTopic init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_serviceTypes, a3);
    objc_storeStrong((id *)&v16->_accessoryCategoryTypes, a4);
    objc_storeStrong((id *)&v16->_topicNameLocalizationKey, a5);
    _HFLocalizedStringWithDefaultValue(v13, v13, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    topicName = v16->_topicName;
    v16->_topicName = (NSString *)v17;

    objc_storeStrong((id *)&v16->_iconDescriptor, a6);
  }

  return v16;
}

- (HFUserNotificationServiceTopic)initWithServiceTypes:(id)a3 accessoryCategoryTypes:(id)a4 topicNameLocalizationKey:(id)a5 iconForAccessoryType:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  HFImageIconDescriptor *v21;
  HFUserNotificationServiceTopic *v22;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_opt_class();
  v15 = v11;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v16 = v15;
  else
    v16 = 0;
  v17 = v16;

  objc_msgSend(v17, "serviceType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[HFServiceIconFactory defaultSymbolIconIdentifierForServiceType:](HFServiceIconFactory, "defaultSymbolIconIdentifierForServiceType:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 26.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:configuration:", v19, v20);
  v22 = -[HFUserNotificationServiceTopic initWithServiceTypes:accessoryCategoryTypes:topicNameLocalizationKey:iconDescriptor:](self, "initWithServiceTypes:accessoryCategoryTypes:topicNameLocalizationKey:iconDescriptor:", v14, v13, v12, v21);

  if (v22)
    objc_storeStrong((id *)&v22->_iconForAccessoryType, a6);

  return v22;
}

- (NSString)identifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[HFUserNotificationServiceTopic serviceTypes](self, "serviceTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_142);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(","));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3940];
  -[HFUserNotificationServiceTopic topicName](self, "topicName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("service-{%@} topicName-%@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

uint64_t __44__HFUserNotificationServiceTopic_identifier__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (NAIdentity)na_identity
{
  if (_MergedGlobals_277 != -1)
    dispatch_once(&_MergedGlobals_277, &__block_literal_global_19_4);
  return (NAIdentity *)(id)qword_1ED379490;
}

void __45__HFUserNotificationServiceTopic_na_identity__block_invoke_2()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D519C8], "builder");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_24_3);
  v2 = (id)objc_msgSend(v0, "appendCharacteristic:", &__block_literal_global_25_0);
  objc_msgSend(v0, "build");
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)qword_1ED379490;
  qword_1ED379490 = v3;

}

uint64_t __45__HFUserNotificationServiceTopic_na_identity__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "serviceTypes");
}

uint64_t __45__HFUserNotificationServiceTopic_na_identity__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessoryCategoryTypes");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "na_identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToObject:", self, v4);

  return (char)self;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend((id)objc_opt_class(), "na_identity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hashOfObject:", self);

  return v4;
}

- (HFAccessoryType)accessoryType
{
  HFAccessoryType *iconForAccessoryType;
  HFAccessoryType *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  iconForAccessoryType = self->_iconForAccessoryType;
  if (iconForAccessoryType)
  {
    v3 = iconForAccessoryType;
  }
  else
  {
    -[HFUserNotificationServiceTopic serviceTypes](self, "serviceTypes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      +[HFAccessoryType serviceType:](HFAccessoryType, "serviceType:", v6);
      v3 = (HFAccessoryType *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HFUserNotificationServiceTopic accessoryCategoryTypes](self, "accessoryCategoryTypes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "anyObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        +[HFAccessoryType categoryType:](HFAccessoryType, "categoryType:", v8);
        v3 = (HFAccessoryType *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v3 = 0;
      }

    }
  }
  return v3;
}

+ (id)_announceTopic
{
  if (qword_1ED379498 != -1)
    dispatch_once(&qword_1ED379498, &__block_literal_global_28_6);
  return (id)qword_1ED3794A0;
}

void __48__HFUserNotificationServiceTopic__announceTopic__block_invoke_2()
{
  void *v0;
  HFImageIconDescriptor *v1;
  id v2;
  HFUserNotificationServiceTopic *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 26.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:configuration:", CFSTR("waveform"), v0);
  if (qword_1ED3794A8 != -1)
    dispatch_once(&qword_1ED3794A8, &__block_literal_global_36_1);
  v2 = (id)qword_1ED3794B0;
  v3 = [HFUserNotificationServiceTopic alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFUserNotificationServiceTopic initWithServiceTypes:accessoryCategoryTypes:topicNameLocalizationKey:iconDescriptor:](v3, "initWithServiceTypes:accessoryCategoryTypes:topicNameLocalizationKey:iconDescriptor:", v4, v2, CFSTR("HFUserNotificationServiceTopicName_Announce"), v1);

  v6 = (void *)qword_1ED3794A0;
  qword_1ED3794A0 = v5;

}

void __48__HFUserNotificationServiceTopic__announceTopic__block_invoke_5()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = *MEMORY[0x1E0CB7A58];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED3794B0;
  qword_1ED3794B0 = v2;

}

+ (id)_safetyAndSecurityTopic
{
  if (qword_1ED3794B8 != -1)
    dispatch_once(&qword_1ED3794B8, &__block_literal_global_40_6);
  return (id)qword_1ED3794C0;
}

void __57__HFUserNotificationServiceTopic__safetyAndSecurityTopic__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  HFImageIconDescriptor *v4;
  id v5;
  HFUserNotificationServiceTopic *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 26.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "hf_safetyAndSecurityImage");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationByApplyingConfiguration:", v0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:configuration:", CFSTR("house.badge.shield.half.filled.fill"), v3);
  if (qword_1ED3794C8 != -1)
    dispatch_once(&qword_1ED3794C8, &__block_literal_global_48_2);
  v5 = (id)qword_1ED3794D0;
  v6 = [HFUserNotificationServiceTopic alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HFUserNotificationServiceTopic initWithServiceTypes:accessoryCategoryTypes:topicNameLocalizationKey:iconDescriptor:](v6, "initWithServiceTypes:accessoryCategoryTypes:topicNameLocalizationKey:iconDescriptor:", v7, v5, CFSTR("HFUserNotificationServiceTopicName_SafetyAndSecurity"), v4);

  v9 = (void *)qword_1ED3794C0;
  qword_1ED3794C0 = v8;

}

void __57__HFUserNotificationServiceTopic__safetyAndSecurityTopic__block_invoke_5()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = *MEMORY[0x1E0CB7A58];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)qword_1ED3794D0;
  qword_1ED3794D0 = v2;

}

+ (id)_cameraTopic
{
  if (qword_1ED3794D8 != -1)
    dispatch_once(&qword_1ED3794D8, &__block_literal_global_50_5);
  return (id)qword_1ED3794E0;
}

void __46__HFUserNotificationServiceTopic__cameraTopic__block_invoke_2()
{
  void *v0;
  HFImageIconDescriptor *v1;
  id v2;
  HFUserNotificationServiceTopic *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 26.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:configuration:", CFSTR("video.doorbell.fill"), v0);
  if (qword_1ED3794E8 != -1)
    dispatch_once(&qword_1ED3794E8, &__block_literal_global_57_1);
  v2 = (id)qword_1ED3794F0;
  v3 = [HFUserNotificationServiceTopic alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFUserNotificationServiceTopic initWithServiceTypes:accessoryCategoryTypes:topicNameLocalizationKey:iconDescriptor:](v3, "initWithServiceTypes:accessoryCategoryTypes:topicNameLocalizationKey:iconDescriptor:", v4, v2, CFSTR("HFUserNotificationServiceTopicName_Camera"), v1);

  v6 = (void *)qword_1ED3794E0;
  qword_1ED3794E0 = v5;

}

void __46__HFUserNotificationServiceTopic__cameraTopic__block_invoke_5()
{
  void *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = *MEMORY[0x1E0CB7AF0];
  v5[0] = *MEMORY[0x1E0CB7A60];
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)qword_1ED3794F0;
  qword_1ED3794F0 = v3;

}

+ (id)_energyTopic
{
  if (qword_1ED3794F8 != -1)
    dispatch_once(&qword_1ED3794F8, &__block_literal_global_59_0);
  return (id)qword_1ED379500;
}

void __46__HFUserNotificationServiceTopic__energyTopic__block_invoke_2()
{
  void *v0;
  HFImageIconDescriptor *v1;
  HFUserNotificationServiceTopic *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 26.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:configuration:", CFSTR("bolt.fill"), v0);
  v2 = [HFUserNotificationServiceTopic alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HFUserNotificationServiceTopic initWithServiceTypes:accessoryCategoryTypes:topicNameLocalizationKey:iconDescriptor:](v2, "initWithServiceTypes:accessoryCategoryTypes:topicNameLocalizationKey:iconDescriptor:", v3, v4, CFSTR("HFUserNotificationServiceTopicName_Energy"), v1);

  v6 = (void *)qword_1ED379500;
  qword_1ED379500 = v5;

}

- (NSSet)serviceTypes
{
  return self->_serviceTypes;
}

- (NSSet)accessoryCategoryTypes
{
  return self->_accessoryCategoryTypes;
}

- (NSString)topicName
{
  return self->_topicName;
}

- (NSString)topicNameLocalizationKey
{
  return self->_topicNameLocalizationKey;
}

- (HFIconDescriptor)iconDescriptor
{
  return self->_iconDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconDescriptor, 0);
  objc_storeStrong((id *)&self->_topicNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_topicName, 0);
  objc_storeStrong((id *)&self->_accessoryCategoryTypes, 0);
  objc_storeStrong((id *)&self->_serviceTypes, 0);
  objc_storeStrong((id *)&self->_iconForAccessoryType, 0);
}

@end
