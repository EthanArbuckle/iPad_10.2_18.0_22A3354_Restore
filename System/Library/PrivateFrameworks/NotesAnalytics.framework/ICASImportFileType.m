@implementation ICASImportFileType

- (ICASImportFileType)initWithImportFileType:(int64_t)a3
{
  ICASImportFileType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASImportFileType;
  result = -[ICASImportFileType init](&v5, sel_init);
  if (result)
    result->_importFileType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASImportFileType importFileType](self, "importFileType", a3);
  if ((unint64_t)(v3 - 1) > 4)
    return CFSTR("unknown");
  else
    return off_1E771C268[v3 - 1];
}

- (int64_t)importFileType
{
  return self->_importFileType;
}

@end
