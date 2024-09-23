@implementation ICASCollaborationAccessReason

- (ICASCollaborationAccessReason)initWithCollaborationAccessReason:(int64_t)a3
{
  ICASCollaborationAccessReason *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASCollaborationAccessReason;
  result = -[ICASCollaborationAccessReason init](&v5, sel_init);
  if (result)
    result->_collaborationAccessReason = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASCollaborationAccessReason collaborationAccessReason](self, "collaborationAccessReason", a3);
  if ((unint64_t)(v3 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_1E771C290[v3 - 1];
}

- (int64_t)collaborationAccessReason
{
  return self->_collaborationAccessReason;
}

@end
