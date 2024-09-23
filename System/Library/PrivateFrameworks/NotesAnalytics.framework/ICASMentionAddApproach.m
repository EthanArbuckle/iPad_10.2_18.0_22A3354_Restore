@implementation ICASMentionAddApproach

- (ICASMentionAddApproach)initWithMentionAddApproach:(int64_t)a3
{
  ICASMentionAddApproach *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASMentionAddApproach;
  result = -[ICASMentionAddApproach init](&v5, sel_init);
  if (result)
    result->_mentionAddApproach = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[ICASMentionAddApproach mentionAddApproach](self, "mentionAddApproach", a3);
  v4 = CFSTR("unknown");
  if (v3 == 1)
    v4 = CFSTR("text");
  if (v3 == 2)
    return CFSTR("menuSelection");
  else
    return (id)v4;
}

- (int64_t)mentionAddApproach
{
  return self->_mentionAddApproach;
}

@end
