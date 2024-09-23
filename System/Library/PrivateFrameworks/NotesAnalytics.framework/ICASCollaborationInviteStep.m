@implementation ICASCollaborationInviteStep

- (ICASCollaborationInviteStep)initWithCollaborationInviteStep:(int64_t)a3
{
  ICASCollaborationInviteStep *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASCollaborationInviteStep;
  result = -[ICASCollaborationInviteStep init](&v5, sel_init);
  if (result)
    result->_collaborationInviteStep = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASCollaborationInviteStep collaborationInviteStep](self, "collaborationInviteStep", a3);
  if ((unint64_t)(v3 - 1) > 4)
    return CFSTR("unknown");
  else
    return off_1E771BE38[v3 - 1];
}

- (int64_t)collaborationInviteStep
{
  return self->_collaborationInviteStep;
}

@end
