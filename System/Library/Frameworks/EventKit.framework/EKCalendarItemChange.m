@implementation EKCalendarItemChange

+ (int)entityType
{
  return 101;
}

- (EKCalendarItemChange)initWithChangeProperties:(id)a3
{
  id v4;
  EKCalendarItemChange *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  EKObjectID *calendarID;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  EKObjectID *oldCalendarID;
  uint64_t v16;
  NSString *externalID;
  uint64_t v18;
  NSString *oldExternalID;
  uint64_t v20;
  NSString *uuid;
  uint64_t v22;
  NSString *uniqueID;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)EKCalendarItemChange;
  v5 = -[EKObjectChange initWithChangeProperties:](&v34, sel_initWithChangeProperties_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("calendar_id"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "intValue");
    -[EKObjectChange changedObjectID](v5, "changedObjectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[EKObjectID objectIDWithEntityType:rowID:databaseID:](EKObjectID, "objectIDWithEntityType:rowID:databaseID:", 1, v7, objc_msgSend(v8, "databaseID"));
    v9 = objc_claimAutoreleasedReturnValue();
    calendarID = v5->_calendarID;
    v5->_calendarID = (EKObjectID *)v9;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("old_calendar_id"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "intValue"))
    {
      v12 = objc_msgSend(v11, "intValue");
      -[EKObjectChange changedObjectID](v5, "changedObjectID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[EKObjectID objectIDWithEntityType:rowID:databaseID:](EKObjectID, "objectIDWithEntityType:rowID:databaseID:", 1, v12, objc_msgSend(v13, "databaseID"));
      v14 = objc_claimAutoreleasedReturnValue();
      oldCalendarID = v5->_oldCalendarID;
      v5->_oldCalendarID = (EKObjectID *)v14;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("external_id"));
    v16 = objc_claimAutoreleasedReturnValue();
    externalID = v5->_externalID;
    v5->_externalID = (NSString *)v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("old_external_id"));
    v18 = objc_claimAutoreleasedReturnValue();
    oldExternalID = v5->_oldExternalID;
    v5->_oldExternalID = (NSString *)v18;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UUID"));
    v20 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v20;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("unique_identifier"));
    v22 = objc_claimAutoreleasedReturnValue();
    uniqueID = v5->_uniqueID;
    v5->_uniqueID = (NSString *)v22;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("summary"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_titleChanged = objc_msgSend(v24, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("location_id"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_locationChanged = objc_msgSend(v25, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("start_date"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_startDateChanged = objc_msgSend(v26, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("start_tz"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_startTimezoneChanged = objc_msgSend(v27, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("end_date"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_endDateChanged = objc_msgSend(v28, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("end_tz"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_endTimezoneChanged = objc_msgSend(v29, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("description"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_notesChanged = objc_msgSend(v30, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("all_day"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_allDayChanged = objc_msgSend(v31, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suppress_notification_for_changes"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_suppressNotificationForChanges = objc_msgSend(v32, "BOOLValue");

  }
  return v5;
}

- (EKObjectID)calendarID
{
  return self->_calendarID;
}

- (EKObjectID)oldCalendarID
{
  return self->_oldCalendarID;
}

- (NSString)externalID
{
  return self->_externalID;
}

- (NSString)oldExternalID
{
  return self->_oldExternalID;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (BOOL)titleChanged
{
  return self->_titleChanged;
}

- (BOOL)locationChanged
{
  return self->_locationChanged;
}

- (BOOL)startDateChanged
{
  return self->_startDateChanged;
}

- (BOOL)startTimezoneChanged
{
  return self->_startTimezoneChanged;
}

- (BOOL)endDateChanged
{
  return self->_endDateChanged;
}

- (BOOL)endTimezoneChanged
{
  return self->_endTimezoneChanged;
}

- (BOOL)notesChanged
{
  return self->_notesChanged;
}

- (BOOL)allDayChanged
{
  return self->_allDayChanged;
}

- (BOOL)suppressNotificationForChanges
{
  return self->_suppressNotificationForChanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_oldExternalID, 0);
  objc_storeStrong((id *)&self->_externalID, 0);
  objc_storeStrong((id *)&self->_oldCalendarID, 0);
  objc_storeStrong((id *)&self->_calendarID, 0);
}

@end
