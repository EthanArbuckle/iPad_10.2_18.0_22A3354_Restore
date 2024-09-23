@implementation ICASNotesToPagesContextPath

- (ICASNotesToPagesContextPath)initWithNotesToPagesContextPath:(int64_t)a3
{
  ICASNotesToPagesContextPath *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASNotesToPagesContextPath;
  result = -[ICASNotesToPagesContextPath init](&v5, sel_init);
  if (result)
    result->_notesToPagesContextPath = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASNotesToPagesContextPath notesToPagesContextPath](self, "notesToPagesContextPath", a3);
  if ((unint64_t)(v3 - 1) > 2)
    return CFSTR("unknown");
  else
    return off_1E771CE40[v3 - 1];
}

- (int64_t)notesToPagesContextPath
{
  return self->_notesToPagesContextPath;
}

@end
