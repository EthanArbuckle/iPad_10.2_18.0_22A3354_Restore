@implementation ICASCollaborationStatus

- (ICASCollaborationStatus)initWithCollaborationStatus:(int64_t)a3
{
  ICASCollaborationStatus *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASCollaborationStatus;
  result = -[ICASCollaborationStatus init](&v5, sel_init);
  if (result)
    result->_collaborationStatus = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASCollaborationStatus collaborationStatus](self, "collaborationStatus", a3);
  if ((unint64_t)(v3 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_1E771C720[v3 - 1];
}

- (int64_t)collaborationStatus
{
  return self->_collaborationStatus;
}

@end
