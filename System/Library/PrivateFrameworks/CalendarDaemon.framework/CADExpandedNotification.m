@implementation CADExpandedNotification

- (CADExpandedNotification)initWithType:(int)a3 objectID:(id)a4 occurrenceDate:(double)a5 expirationDate:(double)a6 attendeeObjectID:(id)a7
{
  uint64_t v11;
  id v13;
  CADExpandedNotification *v14;
  CADExpandedNotification *v15;
  objc_super v17;

  v11 = *(_QWORD *)&a3;
  v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)CADExpandedNotification;
  v14 = -[CADNotification initWithType:objectID:occurrenceDate:expirationDate:](&v17, sel_initWithType_objectID_occurrenceDate_expirationDate_, v11, a4, a5, a6);
  v15 = v14;
  if (v14)
    objc_storeStrong((id *)&v14->_attendeeObjectID, a7);

  return v15;
}

- (BOOL)expanded
{
  return 1;
}

- (CADObjectID)attendeeObjectID
{
  return self->_attendeeObjectID;
}

- (void)setAttendeeObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_attendeeObjectID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attendeeObjectID, 0);
}

@end
