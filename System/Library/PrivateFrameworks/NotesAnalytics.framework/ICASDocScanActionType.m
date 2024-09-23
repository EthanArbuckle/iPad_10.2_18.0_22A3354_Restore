@implementation ICASDocScanActionType

- (ICASDocScanActionType)initWithDocScanActionType:(int64_t)a3
{
  ICASDocScanActionType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASDocScanActionType;
  result = -[ICASDocScanActionType init](&v5, sel_init);
  if (result)
    result->_docScanActionType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASDocScanActionType docScanActionType](self, "docScanActionType", a3);
  if ((unint64_t)(v3 - 1) > 4)
    return CFSTR("unknown");
  else
    return off_1E771C7F0[v3 - 1];
}

- (int64_t)docScanActionType
{
  return self->_docScanActionType;
}

@end
