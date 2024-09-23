@implementation ICASCollaborationItemType

- (ICASCollaborationItemType)initWithCollaborationItemType:(int64_t)a3
{
  ICASCollaborationItemType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASCollaborationItemType;
  result = -[ICASCollaborationItemType init](&v5, sel_init);
  if (result)
    result->_collaborationItemType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[ICASCollaborationItemType collaborationItemType](self, "collaborationItemType", a3);
  v4 = CFSTR("unknown");
  if (v3 == 1)
    v4 = CFSTR("note");
  if (v3 == 2)
    return CFSTR("folder");
  else
    return (id)v4;
}

- (int64_t)collaborationItemType
{
  return self->_collaborationItemType;
}

@end
