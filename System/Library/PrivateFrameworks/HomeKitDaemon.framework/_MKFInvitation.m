@implementation _MKFInvitation

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_2557C7980;
}

- (id)restrictedGuestSchedule
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[_MKFInvitation weekDayScheduleRules](self, "weekDayScheduleRules");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "na_map:", &__block_literal_global_37214);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[_MKFInvitation yearDayScheduleRules](self, "yearDayScheduleRules");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "na_map:", &__block_literal_global_2_37215);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD7938]), "initWithWeekDayRules:yearDayRules:", v4, v6);
  return v7;
}

- (BOOL)populateWorkingStoreFromRestrictedGuestSchedule:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[6];
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v5 = v4;
  v6 = 1;
  if (v4)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 1;
    objc_msgSend(v4, "weekDayRules");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __66___MKFInvitation_populateWorkingStoreFromRestrictedGuestSchedule___block_invoke;
    v12[3] = &unk_24E78AA18;
    v12[4] = self;
    v12[5] = &v13;
    objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v12);

    objc_msgSend(v5, "yearDayRules");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __66___MKFInvitation_populateWorkingStoreFromRestrictedGuestSchedule___block_invoke_5;
    v11[3] = &unk_24E78AA40;
    v11[4] = self;
    v11[5] = &v13;
    objc_msgSend(v9, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v11);

    v6 = *((_BYTE *)v14 + 24) != 0;
    _Block_object_dispose(&v13, 8);
  }

  return v6;
}

- (MKFInvitationDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFInvitationDatabaseID alloc], "initWithMKFObject:", self);
}

- (NSArray)weekDayScheduleRules
{
  void *v2;
  void *v3;

  -[_MKFInvitation valueForKey:](self, "valueForKey:", CFSTR("weekDayScheduleRules_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateWeekDayScheduleRulesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("weekDayScheduleRules_"), CFSTR("MKFWeekDayScheduleRule"), a3, a4);
}

- (id)findWeekDayScheduleRulesRelationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("weekDayScheduleRules_"), CFSTR("MKFWeekDayScheduleRule"), a3);
}

- (void)addWeekDayScheduleRulesObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("weekDayScheduleRules_"), a3);
}

- (void)removeWeekDayScheduleRulesObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("weekDayScheduleRules_"), a3);
}

- (NSArray)yearDayScheduleRules
{
  void *v2;
  void *v3;

  -[_MKFInvitation valueForKey:](self, "valueForKey:", CFSTR("yearDayScheduleRules_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateYearDayScheduleRulesRelationWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("yearDayScheduleRules_"), CFSTR("MKFYearDayScheduleRule"), a3, a4);
}

- (id)findYearDayScheduleRulesRelationWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("yearDayScheduleRules_"), CFSTR("MKFYearDayScheduleRule"), a3);
}

- (void)addYearDayScheduleRulesObject:(id)a3
{
  -[NSManagedObject mkf_addToRelationship:object:](self, "mkf_addToRelationship:object:", CFSTR("yearDayScheduleRules_"), a3);
}

- (void)removeYearDayScheduleRulesObject:(id)a3
{
  -[NSManagedObject mkf_removeFromRelationship:object:](self, "mkf_removeFromRelationship:object:", CFSTR("yearDayScheduleRules_"), a3);
}

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFInvitation"));
}

@end
