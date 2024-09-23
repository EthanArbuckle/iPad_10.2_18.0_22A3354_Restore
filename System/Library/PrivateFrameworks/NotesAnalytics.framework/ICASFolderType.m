@implementation ICASFolderType

- (ICASFolderType)initWithFolderType:(int64_t)a3
{
  ICASFolderType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASFolderType;
  result = -[ICASFolderType init](&v5, sel_init);
  if (result)
    result->_folderType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[ICASFolderType folderType](self, "folderType", a3);
  v4 = CFSTR("unknown");
  if (v3 == 1)
    v4 = CFSTR("modern");
  if (v3 == 2)
    return CFSTR("html");
  else
    return (id)v4;
}

- (int64_t)folderType
{
  return self->_folderType;
}

@end
