@implementation ICASDocScanStage

- (ICASDocScanStage)initWithDocScanStage:(int64_t)a3
{
  ICASDocScanStage *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASDocScanStage;
  result = -[ICASDocScanStage init](&v5, sel_init);
  if (result)
    result->_docScanStage = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[ICASDocScanStage docScanStage](self, "docScanStage", a3);
  v4 = CFSTR("unknown");
  if (v3 == 1)
    v4 = CFSTR("initiate");
  if (v3 == 2)
    return CFSTR("complete");
  else
    return (id)v4;
}

- (int64_t)docScanStage
{
  return self->_docScanStage;
}

@end
