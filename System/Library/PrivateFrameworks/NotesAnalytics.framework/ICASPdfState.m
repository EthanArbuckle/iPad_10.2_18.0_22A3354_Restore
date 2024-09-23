@implementation ICASPdfState

- (ICASPdfState)initWithPdfState:(int64_t)a3
{
  ICASPdfState *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASPdfState;
  result = -[ICASPdfState init](&v5, sel_init);
  if (result)
    result->_pdfState = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASPdfState pdfState](self, "pdfState", a3);
  if ((unint64_t)(v3 - 1) > 3)
    return CFSTR("unknown");
  else
    return *(&off_1E771C5B8 + v3 - 1);
}

- (int64_t)pdfState
{
  return self->_pdfState;
}

@end
