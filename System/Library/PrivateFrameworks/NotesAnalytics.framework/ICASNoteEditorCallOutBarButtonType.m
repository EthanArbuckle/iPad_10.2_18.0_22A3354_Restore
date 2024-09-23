@implementation ICASNoteEditorCallOutBarButtonType

- (ICASNoteEditorCallOutBarButtonType)initWithNoteEditorCallOutBarButtonType:(int64_t)a3
{
  ICASNoteEditorCallOutBarButtonType *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASNoteEditorCallOutBarButtonType;
  result = -[ICASNoteEditorCallOutBarButtonType init](&v5, sel_init);
  if (result)
    result->_noteEditorCallOutBarButtonType = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASNoteEditorCallOutBarButtonType noteEditorCallOutBarButtonType](self, "noteEditorCallOutBarButtonType", a3);
  if ((unint64_t)(v3 - 1) > 0xD)
    return CFSTR("unknown");
  else
    return off_1E771CE58[v3 - 1];
}

- (int64_t)noteEditorCallOutBarButtonType
{
  return self->_noteEditorCallOutBarButtonType;
}

@end
