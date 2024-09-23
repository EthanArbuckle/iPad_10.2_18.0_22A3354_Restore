@implementation ASNotificationEvent

- (id)recordWithZoneID:(id)a3 recordEncryptionType:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  ASCodableCloudKitNotificationEvent *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = -[ASNotificationEvent type](self, "type");
  -[ASNotificationEvent triggerUUID](self, "triggerUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ASWorkoutNotificationRecordIDForType(v7, (uint64_t)v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB91D8]), "initWithRecordType:recordID:", CFSTR("ActivitySharingEvent"), v9);
  _ASUpdateSchemaVersionOnRecord(2, v10, a4);
  v11 = objc_alloc_init(ASCodableCloudKitNotificationEvent);
  -[ASNotificationEvent date](self, "date");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  -[ASCodableCloudKitNotificationEvent setDate:](v11, "setDate:");

  -[ASCodableCloudKitNotificationEvent setType:](v11, "setType:", -[ASNotificationEvent type](self, "type"));
  -[ASNotificationEvent triggerUUID](self, "triggerUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hk_dataForUUIDBytes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCodableCloudKitNotificationEvent setTriggerUUID:](v11, "setTriggerUUID:", v14);

  -[ASCodableCloudKitNotificationEvent setTriggerSnapshotIndex:](v11, "setTriggerSnapshotIndex:", -[ASNotificationEvent triggerSnapshotIndex](self, "triggerSnapshotIndex"));
  -[ASCodableCloudKitNotificationEvent data](v11, "data");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encryptedValues");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, CFSTR("EncryptedData"));

  return v10;
}

+ (id)notificationEventWithRecord:(id)a3 friendUUID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  ASNotificationEvent *v10;
  ASCodableCloudKitNotificationEvent *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  if (_ASCloudKitSchemaVersionForRecord(v5) == 2)
  {
    objc_msgSend(v5, "encryptedValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("EncryptedData"));
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    if (v9)
    {
      v11 = -[ASCodableCloudKitNotificationEvent initWithData:]([ASCodableCloudKitNotificationEvent alloc], "initWithData:", v9);
      v10 = objc_alloc_init(ASNotificationEvent);
      v12 = (void *)MEMORY[0x24BDBCE60];
      -[ASCodableCloudKitNotificationEvent date](v11, "date");
      objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASNotificationEvent setDate:](v10, "setDate:", v13);

      -[ASNotificationEvent setType:](v10, "setType:", -[ASCodableCloudKitNotificationEvent type](v11, "type"));
      v14 = (void *)MEMORY[0x24BDD1880];
      -[ASCodableCloudKitNotificationEvent triggerUUID](v11, "triggerUUID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "hk_UUIDWithData:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASNotificationEvent setTriggerUUID:](v10, "setTriggerUUID:", v16);

      -[ASNotificationEvent setTriggerSnapshotIndex:](v10, "setTriggerSnapshotIndex:", -[ASCodableCloudKitNotificationEvent triggerSnapshotIndex](v11, "triggerSnapshotIndex"));
      -[ASNotificationEvent setFriendUUID:](v10, "setFriendUUID:", v6);

    }
    else
    {
      ASLoggingInitialize();
      if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
        +[ASNotificationEvent(CloudKitCodingSupport) notificationEventWithRecord:friendUUID:].cold.1();
      v10 = 0;
    }

  }
  else
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)ASLogCloudKit, OS_LOG_TYPE_ERROR))
      +[ASNotificationEvent(CloudKitCodingSupport) notificationEventWithRecord:friendUUID:].cold.2();
    v10 = 0;
  }

  return v10;
}

+ (id)goalCompletionEventWithActivitySummary:(id)a3
{
  id v3;
  ASNotificationEvent *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  v4 = objc_alloc_init(ASNotificationEvent);
  -[ASNotificationEvent setType:](v4, "setType:", 0);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASNotificationEvent setDate:](v4, "setDate:", v5);

  -[ASNotificationEvent setTriggerUUID:](v4, "setTriggerUUID:", 0);
  v6 = objc_msgSend(v3, "_activitySummaryIndex");

  -[ASNotificationEvent setTriggerSnapshotIndex:](v4, "setTriggerSnapshotIndex:", v6);
  return v4;
}

+ (id)workoutCompletionEventWithWorkout:(id)a3
{
  id v3;
  ASNotificationEvent *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(ASNotificationEvent);
  -[ASNotificationEvent setType:](v4, "setType:", 2);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASNotificationEvent setDate:](v4, "setDate:", v5);

  objc_msgSend(v3, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASNotificationEvent setTriggerUUID:](v4, "setTriggerUUID:", v6);

  objc_msgSend(v3, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _HKActivityCacheDateComponentsFromDate();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASNotificationEvent setTriggerSnapshotIndex:](v4, "setTriggerSnapshotIndex:", _HKCacheIndexFromDateComponents());

  return v4;
}

+ (id)achievementCompletionEventWithAchievement:(id)a3
{
  id v3;
  ASNotificationEvent *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  v4 = objc_alloc_init(ASNotificationEvent);
  -[ASNotificationEvent setType:](v4, "setType:", 1);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASNotificationEvent setDate:](v4, "setDate:", v5);

  objc_msgSend(v3, "completedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _HKActivityCacheDateComponentsFromDate();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASNotificationEvent setTriggerSnapshotIndex:](v4, "setTriggerSnapshotIndex:", _HKCacheIndexFromDateComponents());

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASNotificationEvent setTriggerUUID:](v4, "setTriggerUUID:", v9);

  return v4;
}

+ (id)deletedWorkoutEventWithUUID:(id)a3
{
  id v3;
  ASNotificationEvent *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(ASNotificationEvent);
  -[ASNotificationEvent setType:](v4, "setType:", 3);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASNotificationEvent setDate:](v4, "setDate:", v5);

  -[ASNotificationEvent setTriggerUUID:](v4, "setTriggerUUID:", v3);
  return v4;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ASNotificationEvent type](self, "type");
  -[ASNotificationEvent date](self, "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASNotificationEvent triggerUUID](self, "triggerUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ASNotificationEvent triggerSnapshotIndex](self, "triggerSnapshotIndex");
  -[ASNotificationEvent friendUUID](self, "friendUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@:%p type:%ld date:%@ triggerUUID:%@ triggerSnapshotIndex:%lld friendUUID:%@"), v5, self, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (NSUUID)friendUUID
{
  return self->_friendUUID;
}

- (void)setFriendUUID:(id)a3
{
  objc_storeStrong((id *)&self->_friendUUID, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSUUID)triggerUUID
{
  return self->_triggerUUID;
}

- (void)setTriggerUUID:(id)a3
{
  objc_storeStrong((id *)&self->_triggerUUID, a3);
}

- (int64_t)triggerSnapshotIndex
{
  return self->_triggerSnapshotIndex;
}

- (void)setTriggerSnapshotIndex:(int64_t)a3
{
  self->_triggerSnapshotIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triggerUUID, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_friendUUID, 0);
}

@end
