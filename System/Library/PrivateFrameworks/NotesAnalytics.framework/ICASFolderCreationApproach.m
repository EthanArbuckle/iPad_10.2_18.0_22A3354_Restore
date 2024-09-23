@implementation ICASFolderCreationApproach

- (ICASFolderCreationApproach)initWithFolderCreationApproach:(int64_t)a3
{
  ICASFolderCreationApproach *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASFolderCreationApproach;
  result = -[ICASFolderCreationApproach init](&v5, sel_init);
  if (result)
    result->_folderCreationApproach = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[ICASFolderCreationApproach folderCreationApproach](self, "folderCreationApproach", a3);
  v4 = CFSTR("unknown");
  if (v3 == 1)
    v4 = CFSTR("folderAffordance");
  if (v3 == 2)
    return CFSTR("tagBrowser");
  else
    return (id)v4;
}

- (int64_t)folderCreationApproach
{
  return self->_folderCreationApproach;
}

@end
