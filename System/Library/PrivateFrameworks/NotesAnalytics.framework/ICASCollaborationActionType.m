@implementation ICASCollaborationActionType

- (ICASCollaborationActionType)initWithCollaborationActionType:(int64_t)a3
{
  ICASCollaborationActionType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASCollaborationActionType;
  result = -[ICASCollaborationActionType init](&v5, sel_init);
  if (result)
    result->_collaborationActionType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[ICASCollaborationActionType collaborationActionType](self, "collaborationActionType", a3);
  v4 = CFSTR("unknown");
  if (v3 == 1)
    v4 = CFSTR("invite");
  if (v3 == 2)
    return CFSTR("uncollaborate");
  else
    return (id)v4;
}

- (int64_t)collaborationActionType
{
  return self->_collaborationActionType;
}

@end
