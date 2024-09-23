@implementation ICASFolderLabelType

- (ICASFolderLabelType)initWithFolderLabelType:(int64_t)a3
{
  ICASFolderLabelType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASFolderLabelType;
  result = -[ICASFolderLabelType init](&v5, sel_init);
  if (result)
    result->_folderLabelType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASFolderLabelType folderLabelType](self, "folderLabelType", a3);
  if ((unint64_t)(v3 - 1) > 6)
    return CFSTR("unknown");
  else
    return *(&off_1E771C568 + v3 - 1);
}

- (int64_t)folderLabelType
{
  return self->_folderLabelType;
}

@end
