@implementation CADNotification

- (CADObjectID)objectID
{
  return self->_objectID;
}

- (double)occurrenceDate
{
  return self->_occurrenceDate;
}

- (CADNotification)initWithType:(int)a3 objectID:(id)a4 occurrenceDate:(double)a5 expirationDate:(double)a6
{
  id v11;
  CADNotification *v12;
  CADNotification *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CADNotification;
  v12 = -[CADNotification init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_type = a3;
    objc_storeStrong((id *)&v12->_objectID, a4);
    v13->_occurrenceDate = a5;
    v13->_expirationDate = a6;
  }

  return v13;
}

- (double)expirationDate
{
  return self->_expirationDate;
}

- (int)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableExpandedNotifications, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
}

- (BOOL)expanded
{
  return 0;
}

- (NSArray)expandedNotifications
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_mutableExpandedNotifications, "copy");
}

- (void)addExpandedNotification:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CADNotification mutableExpandedNotifications](self, "mutableExpandedNotifications");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (NSMutableArray)mutableExpandedNotifications
{
  NSMutableArray *mutableExpandedNotifications;
  NSMutableArray *v4;
  NSMutableArray *v5;

  mutableExpandedNotifications = self->_mutableExpandedNotifications;
  if (!mutableExpandedNotifications)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_mutableExpandedNotifications;
    self->_mutableExpandedNotifications = v4;

    mutableExpandedNotifications = self->_mutableExpandedNotifications;
  }
  return mutableExpandedNotifications;
}

- (void)setMutableExpandedNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_mutableExpandedNotifications, a3);
}

@end
