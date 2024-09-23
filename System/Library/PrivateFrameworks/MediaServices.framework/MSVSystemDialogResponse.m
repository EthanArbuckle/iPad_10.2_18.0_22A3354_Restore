@implementation MSVSystemDialogResponse

- (MSVSystemDialogResponse)initWithIdentifier:(int64_t)a3 textFieldValues:(id)a4
{
  id v6;
  MSVSystemDialogResponse *v7;
  MSVSystemDialogResponse *v8;
  uint64_t v9;
  NSArray *textFieldValues;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSVSystemDialogResponse;
  v7 = -[MSVSystemDialogResponse init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_buttonIdentifier = a3;
    v9 = objc_msgSend(v6, "copy");
    textFieldValues = v8->_textFieldValues;
    v8->_textFieldValues = (NSArray *)v9;

  }
  return v8;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p, buttonID = %ld, textFieldValues = %@>"), objc_opt_class(), self, self->_buttonIdentifier, self->_textFieldValues);
}

- (int64_t)buttonIdentifier
{
  return self->_buttonIdentifier;
}

- (NSArray)textFieldValues
{
  return self->_textFieldValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFieldValues, 0);
}

@end
