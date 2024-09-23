@implementation ICASTagRenameApproach

- (ICASTagRenameApproach)initWithTagRenameApproach:(int64_t)a3
{
  ICASTagRenameApproach *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASTagRenameApproach;
  result = -[ICASTagRenameApproach init](&v5, sel_init);
  if (result)
    result->_tagRenameApproach = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[ICASTagRenameApproach tagRenameApproach](self, "tagRenameApproach", a3);
  v4 = CFSTR("unknown");
  if (v3 == 1)
    v4 = CFSTR("inlineEdit");
  if (v3 == 2)
    return CFSTR("tagBrowserPressAndHold");
  else
    return (id)v4;
}

- (int64_t)tagRenameApproach
{
  return self->_tagRenameApproach;
}

@end
