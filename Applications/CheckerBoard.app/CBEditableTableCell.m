@implementation CBEditableTableCell

- (CBEditableTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  CBEditableTableCell *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CBEditableTableCell;
  result = -[CBEditableTableCell initWithStyle:reuseIdentifier:specifier:](&v6, "initWithStyle:reuseIdentifier:specifier:", a3, a4, a5);
  if (result)
    result->_characterLimit = 0x7FFFFFFFFFFFFFFFLL;
  return result;
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  NSUInteger v11;
  void *v12;
  id v13;
  BOOL v14;
  void *v15;
  char *v16;
  char *v17;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  v11 = length + location;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));
  v13 = objc_msgSend(v12, "length");

  if (v11 <= (unint64_t)v13)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));
    v16 = (char *)objc_msgSend(v15, "length");
    v17 = &v16[(_QWORD)objc_msgSend(v10, "length") - length];

    v14 = (uint64_t)v17 <= -[CBEditableTableCell characterLimit](self, "characterLimit");
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (int64_t)characterLimit
{
  return self->_characterLimit;
}

- (void)setCharacterLimit:(int64_t)a3
{
  self->_characterLimit = a3;
}

@end
