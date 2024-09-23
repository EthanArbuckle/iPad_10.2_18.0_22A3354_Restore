@implementation EKEventChange

+ (int)entityType
{
  return 2;
}

- (EKEventChange)initWithChangeProperties:(id)a3
{
  id v4;
  EKEventChange *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  EKObjectID *originalItemID;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)EKEventChange;
  v5 = -[EKCalendarItemChange initWithChangeProperties:](&v17, sel_initWithChangeProperties_, v4);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("availability"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_availabilityChanged = objc_msgSend(v6, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("privacy_level"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_privacyLevelChanged = objc_msgSend(v7, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("travel_time"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_travelTimeChanged = objc_msgSend(v8, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("start_location_id"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_travelStartLocationChanged = objc_msgSend(v9, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("status"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_statusChanged = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("orig_item_id"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "intValue");

    if ((int)v12 >= 1)
    {
      -[EKObjectChange changedObjectID](v5, "changedObjectID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[EKObjectID objectIDWithEntityType:rowID:databaseID:](EKObjectID, "objectIDWithEntityType:rowID:databaseID:", 2, v12, objc_msgSend(v13, "databaseID"));
      v14 = objc_claimAutoreleasedReturnValue();
      originalItemID = v5->_originalItemID;
      v5->_originalItemID = (EKObjectID *)v14;

    }
  }

  return v5;
}

- (BOOL)availabilityChanged
{
  return self->_availabilityChanged;
}

- (BOOL)privacyLevelChanged
{
  return self->_privacyLevelChanged;
}

- (BOOL)travelTimeChanged
{
  return self->_travelTimeChanged;
}

- (BOOL)travelStartLocationChanged
{
  return self->_travelStartLocationChanged;
}

- (BOOL)statusChanged
{
  return self->_statusChanged;
}

- (EKObjectID)originalItemID
{
  return self->_originalItemID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalItemID, 0);
}

@end
