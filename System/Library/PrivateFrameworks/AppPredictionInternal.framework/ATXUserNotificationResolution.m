@implementation ATXUserNotificationResolution

- (ATXUserNotificationResolution)initWithNotificationUUID:(id)a3 numExpansions:(unint64_t)a4 resolutionType:(int64_t)a5 resolutionTimestamp:(id)a6
{
  id v11;
  id v12;
  ATXUserNotificationResolution *v13;
  ATXUserNotificationResolution *v14;
  NSDate *v15;
  NSDate *resolutionTimestamp;
  objc_super v18;

  v11 = a3;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXUserNotificationResolution;
  v13 = -[ATXUserNotificationResolution init](&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_notificationUUID, a3);
    v14->_numExpansions = a4;
    v14->_resolutionType = a5;
    if (a5 == 3)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = (NSDate *)v12;
    }
    resolutionTimestamp = v14->_resolutionTimestamp;
    v14->_resolutionTimestamp = v15;

  }
  return v14;
}

- (NSUUID)notificationUUID
{
  return self->_notificationUUID;
}

- (unint64_t)numExpansions
{
  return self->_numExpansions;
}

- (int64_t)resolutionType
{
  return self->_resolutionType;
}

- (NSDate)resolutionTimestamp
{
  return self->_resolutionTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resolutionTimestamp, 0);
  objc_storeStrong((id *)&self->_notificationUUID, 0);
}

@end
