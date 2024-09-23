@implementation ICASNoteEditContext

- (ICASNoteEditContext)initWithNoteEditContext:(int64_t)a3
{
  ICASNoteEditContext *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASNoteEditContext;
  result = -[ICASNoteEditContext init](&v5, sel_init);
  if (result)
    result->_noteEditContext = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;
  const __CFString *v4;

  v3 = -[ICASNoteEditContext noteEditContext](self, "noteEditContext", a3);
  v4 = CFSTR("unknown");
  if (v3 == 1)
    v4 = CFSTR("inNote");
  if (v3 == 2)
    return CFSTR("quickNote");
  else
    return (id)v4;
}

- (int64_t)noteEditContext
{
  return self->_noteEditContext;
}

@end
