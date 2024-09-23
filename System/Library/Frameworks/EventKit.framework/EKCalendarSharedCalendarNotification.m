@implementation EKCalendarSharedCalendarNotification

- (EKCalendarSharedCalendarNotification)initWithType:(int64_t)a3
{
  EKCalendarSharedCalendarNotification *v5;
  EKCalendarSharedCalendarNotification *v6;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EKCalendarSharedCalendarNotification;
  v5 = -[EKCalendarNotification initWithType:](&v9, sel_initWithType_);
  v6 = v5;
  if (a3 != 8 && v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("EKCalendarSharedCalendarNotification.m"), 20, CFSTR("Invalid type for EKCalendarSharedCalendarNotification."));

  }
  return v6;
}

- (id)calendarFromEventStore:(id)a3
{
  return (id)objc_msgSend(a3, "calendarWithID:", self->super._objectID);
}

- (BOOL)isSharedCalendarInvitation
{
  return 1;
}

- (BOOL)couldBeJunk
{
  void *v2;
  char v3;

  -[EKCalendarNotification calendar](self, "calendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "couldBeJunk");

  return v3;
}

- (unint64_t)sharingInvitationResponse
{
  return self->_sharingInvitationResponse;
}

- (void)setSharingInvitationResponse:(unint64_t)a3
{
  self->_sharingInvitationResponse = a3;
}

- (unint64_t)allowedEntityTypes
{
  return self->_allowedEntityTypes;
}

- (void)setAllowedEntityTypes:(unint64_t)a3
{
  self->_allowedEntityTypes = a3;
}

@end
