@implementation EKCalendarInviteReplyNotification

- (EKCalendarInviteReplyNotification)initWithType:(int64_t)a3
{
  EKCalendarInviteReplyNotification *v5;
  EKCalendarInviteReplyNotification *v6;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EKCalendarInviteReplyNotification;
  v5 = -[EKCalendarNotification initWithType:](&v9, sel_initWithType_);
  v6 = v5;
  if ((unint64_t)(a3 - 11) <= 0xFFFFFFFFFFFFFFFDLL && v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("EKCalendarInviteReplyNotification.m"), 22, CFSTR("Invalid type for EKCalendarInviteReplyNotification."));

  }
  return v6;
}

- (id)inviteReplyNotificationFromEventStore:(id)a3
{
  return (id)objc_msgSend(a3, "publicObjectWithObjectID:", self->super._objectID);
}

- (BOOL)acknowledgeWithEventStore:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  NSObject *v9;

  v6 = a3;
  -[EKCalendarInviteReplyNotification inviteReplyNotificationFromEventStore:](self, "inviteReplyNotificationFromEventStore:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_msgSend(v6, "removeInviteReplyNotification:error:", v7, a4);
  }
  else
  {
    v9 = EKLogHandle;
    if (os_log_type_enabled((os_log_t)EKLogHandle, OS_LOG_TYPE_ERROR))
      -[EKCalendarInviteReplyNotification acknowledgeWithEventStore:error:].cold.1((uint64_t)self, v9);
    v8 = 1;
  }

  return v8;
}

- (unint64_t)status
{
  return self->_status;
}

- (void)setStatus:(unint64_t)a3
{
  self->_status = a3;
}

- (unint64_t)allowedEntityTypes
{
  return self->_allowedEntityTypes;
}

- (void)setAllowedEntityTypes:(unint64_t)a3
{
  self->_allowedEntityTypes = a3;
}

- (void)acknowledgeWithEventStore:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 56);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1A2318000, a2, OS_LOG_TYPE_ERROR, "Attempted to acknowledge calendar invite reply notification with objectID %{public}@, but it was not found. Silently ignoring this request.", (uint8_t *)&v3, 0xCu);
}

@end
