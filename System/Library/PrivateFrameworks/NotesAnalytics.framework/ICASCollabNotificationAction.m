@implementation ICASCollabNotificationAction

- (ICASCollabNotificationAction)initWithCollabNotificationAction:(int64_t)a3
{
  ICASCollabNotificationAction *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASCollabNotificationAction;
  result = -[ICASCollabNotificationAction init](&v5, sel_init);
  if (result)
    result->_collabNotificationAction = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASCollabNotificationAction collabNotificationAction](self, "collabNotificationAction", a3);
  if ((unint64_t)(v3 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_1E771C440[v3 - 1];
}

- (int64_t)collabNotificationAction
{
  return self->_collabNotificationAction;
}

@end
