@implementation _MKFEventTrigger

+ (id)fetchRequest
{
  return (id)objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("MKFEventTrigger"));
}

- (void)residentSyncContextualizeConditions:(id)a3 userContext:(id)a4
{
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  _MKFEventTrigger *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)v7[1];
  if (!v8)
  {
    +[_MKFEventTrigger fetchRequest](_MKFEventTrigger, "fetchRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setResultType:", 1);
    v10 = (void *)MEMORY[0x24BDD1758];
    +[_MKFPresenceEvent entity](_MKFPresenceEvent, "entity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x24BDD6A08];
    v13 = *MEMORY[0x24BDD6A20];
    objc_msgSend(v7, "targetUser");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "predicateWithFormat:", CFSTR("SUBQUERY(%K, $p, $p.entity = %@ AND( $p.%K = %@ OR  $p.%K = %@ OR  SUBQUERY($p.%K, $u, $u = %@).@count > 0)).@count > 0"), CFSTR("events_"), v11, CFSTR("presenceType"), v12, CFSTR("presenceType"), v13, CFSTR("users_"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPredicate:", v15);

    v26 = 0;
    objc_msgSend(v9, "execute:", &v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v26;
    if (v16)
    {
      objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v16);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = (void *)MEMORY[0x227676638]();
      v20 = self;
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v22;
        v29 = 2114;
        v30 = v17;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch relevant triggers: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v19);
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v23 = (void *)v7[1];
    v7[1] = v18;

    v8 = (void *)v7[1];
  }
  -[_MKFEventTrigger objectID](self, "objectID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v8, "containsObject:", v24);

  if (v25)
    objc_msgSend(v6, "addCondition:", CFSTR("triggerIsRelevant"));

}

- (id)residentSyncAttributeValueForKey:(id)a3 userContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("evaluationCondition"))
    && (objc_msgSend(v7, "targetUser"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isOwnerOrAdmin"),
        v8,
        (v9 & 1) == 0))
  {
    -[_MKFEventTrigger evaluationCondition](self, "evaluationCondition");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v7, "targetUser");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x24BDBCF20];
      objc_msgSend(v12, "modelID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "home");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "owner");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "modelID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setWithObjects:", v14, v17, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      +[HMDPredicateUtilities filteredPredicate:withUserUUIDs:](HMDPredicateUtilities, "filteredPredicate:withUserUUIDs:", v11, v18);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    -[_MKFEventTrigger valueForKey:](self, "valueForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)awakeFromFetch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_MKFEventTrigger;
  -[_MKFEventTrigger awakeFromFetch](&v8, sel_awakeFromFetch);
  -[_MKFEventTrigger recurrenceDays](self, "recurrenceDays");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[_MKFEventTrigger recurrences](self, "recurrences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      return;
    v5 = (void *)MEMORY[0x24BDD16E0];
    -[_MKFEventTrigger recurrences](self, "recurrences");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decodeArrayOfDateComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "numberWithUnsignedInteger:", HMDaysOfTheWeekFromDateComponents());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MKFEventTrigger setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v7, CFSTR("recurrenceDays"));

  }
}

- (MKFEventTriggerDatabaseID)databaseID
{
  return -[MKFObjectDatabaseID initWithMKFObject:]([MKFEventTriggerDatabaseID alloc], "initWithMKFObject:", self);
}

- (NSArray)events
{
  void *v2;
  void *v3;

  -[_MKFEventTrigger valueForKey:](self, "valueForKey:", CFSTR("events_"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)materializeOrCreateEventsRelationOfType:(id)a3 modelID:(id)a4 createdNew:(BOOL *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  NSStringFromProtocol((Protocol *)a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("events_"), v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)createEventsRelationOfType:(id)a3 modelID:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  NSStringFromProtocol((Protocol *)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("events_"), v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)materializeOrCreateEventsRelationOfTypeCalendarEventWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("events_"), CFSTR("MKFCalendarEvent"), a3, a4);
}

- (id)createEventsRelationOfTypeCalendarEventWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("events_"), CFSTR("MKFCalendarEvent"), a3);
}

- (id)findEventsRelationOfTypeCalendarEventWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("events_"), CFSTR("MKFCalendarEvent"), a3);
}

- (id)materializeOrCreateEventsRelationOfTypeCharacteristicRangeEventWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("events_"), CFSTR("MKFCharacteristicRangeEvent"), a3, a4);
}

- (id)createEventsRelationOfTypeCharacteristicRangeEventWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("events_"), CFSTR("MKFCharacteristicRangeEvent"), a3);
}

- (id)findEventsRelationOfTypeCharacteristicRangeEventWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("events_"), CFSTR("MKFCharacteristicRangeEvent"), a3);
}

- (id)materializeOrCreateEventsRelationOfTypeCharacteristicValueEventWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("events_"), CFSTR("MKFCharacteristicValueEvent"), a3, a4);
}

- (id)createEventsRelationOfTypeCharacteristicValueEventWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("events_"), CFSTR("MKFCharacteristicValueEvent"), a3);
}

- (id)findEventsRelationOfTypeCharacteristicValueEventWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("events_"), CFSTR("MKFCharacteristicValueEvent"), a3);
}

- (id)materializeOrCreateEventsRelationOfTypeDurationEventWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("events_"), CFSTR("MKFDurationEvent"), a3, a4);
}

- (id)createEventsRelationOfTypeDurationEventWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("events_"), CFSTR("MKFDurationEvent"), a3);
}

- (id)findEventsRelationOfTypeDurationEventWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("events_"), CFSTR("MKFDurationEvent"), a3);
}

- (id)materializeOrCreateEventsRelationOfTypeLocationEventWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("events_"), CFSTR("MKFLocationEvent"), a3, a4);
}

- (id)createEventsRelationOfTypeLocationEventWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("events_"), CFSTR("MKFLocationEvent"), a3);
}

- (id)findEventsRelationOfTypeLocationEventWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("events_"), CFSTR("MKFLocationEvent"), a3);
}

- (id)materializeOrCreateEventsRelationOfTypePresenceEventWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("events_"), CFSTR("MKFPresenceEvent"), a3, a4);
}

- (id)createEventsRelationOfTypePresenceEventWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("events_"), CFSTR("MKFPresenceEvent"), a3);
}

- (id)findEventsRelationOfTypePresenceEventWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("events_"), CFSTR("MKFPresenceEvent"), a3);
}

- (id)materializeOrCreateEventsRelationOfTypeSignificantTimeEventWithModelID:(id)a3 createdNew:(BOOL *)a4
{
  return -[NSManagedObject mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:](self, "mkf_materializeOrCreateRelationOnProperty:modelProtocol:keyValue:createdNew:", CFSTR("events_"), CFSTR("MKFSignificantTimeEvent"), a3, a4);
}

- (id)createEventsRelationOfTypeSignificantTimeEventWithModelID:(id)a3
{
  return -[NSManagedObject mkf_createRelationOnProperty:modelProtocol:keyValue:](self, "mkf_createRelationOnProperty:modelProtocol:keyValue:", CFSTR("events_"), CFSTR("MKFSignificantTimeEvent"), a3);
}

- (id)findEventsRelationOfTypeSignificantTimeEventWithModelID:(id)a3
{
  return -[NSManagedObject mkf_findRelationOnProperty:modelProtocol:keyValue:](self, "mkf_findRelationOnProperty:modelProtocol:keyValue:", CFSTR("events_"), CFSTR("MKFSignificantTimeEvent"), a3);
}

+ (id)modelIDForParentRelationshipTo:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB0];
  v7 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("You must override %@ in a subclass"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

+ (NSPredicate)homeRelation
{
  if (homeRelation__hmf_once_t0_208169 != -1)
    dispatch_once(&homeRelation__hmf_once_t0_208169, &__block_literal_global_208170);
  return (NSPredicate *)(id)homeRelation__hmf_once_v1_208171;
}

+ (Protocol)backingModelProtocol
{
  return (Protocol *)&unk_25588C5F8;
}

+ (Class)cd_modelClass
{
  return (Class)objc_opt_class();
}

@end
