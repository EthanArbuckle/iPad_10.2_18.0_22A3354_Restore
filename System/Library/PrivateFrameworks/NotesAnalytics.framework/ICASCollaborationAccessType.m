@implementation ICASCollaborationAccessType

- (ICASCollaborationAccessType)initWithCollaborationAccessType:(int64_t)a3
{
  ICASCollaborationAccessType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASCollaborationAccessType;
  result = -[ICASCollaborationAccessType init](&v5, sel_init);
  if (result)
    result->_collaborationAccessType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASCollaborationAccessType collaborationAccessType](self, "collaborationAccessType", a3);
  if ((unint64_t)(v3 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_1E771BF70[v3 - 1];
}

- (int64_t)collaborationAccessType
{
  return self->_collaborationAccessType;
}

@end
