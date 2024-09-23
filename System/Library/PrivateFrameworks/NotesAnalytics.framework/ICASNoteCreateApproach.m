@implementation ICASNoteCreateApproach

- (ICASNoteCreateApproach)initWithNoteCreateApproach:(int64_t)a3
{
  ICASNoteCreateApproach *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASNoteCreateApproach;
  result = -[ICASNoteCreateApproach init](&v5, sel_init);
  if (result)
    result->_noteCreateApproach = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASNoteCreateApproach noteCreateApproach](self, "noteCreateApproach", a3);
  if ((unint64_t)(v3 - 1) > 0x14)
    return CFSTR("unknown");
  else
    return off_1E771C678[v3 - 1];
}

- (int64_t)noteCreateApproach
{
  return self->_noteCreateApproach;
}

@end
