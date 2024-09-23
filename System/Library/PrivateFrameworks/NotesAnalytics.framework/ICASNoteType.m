@implementation ICASNoteType

- (ICASNoteType)initWithNoteType:(int64_t)a3
{
  ICASNoteType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASNoteType;
  result = -[ICASNoteType init](&v5, sel_init);
  if (result)
    result->_noteType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[ICASNoteType noteType](self, "noteType", a3);
  v4 = CFSTR("unknown");
  if (v3 == 1)
    v4 = CFSTR("modern");
  if (v3 == 2)
    return CFSTR("html");
  else
    return (id)v4;
}

- (int64_t)noteType
{
  return self->_noteType;
}

@end
