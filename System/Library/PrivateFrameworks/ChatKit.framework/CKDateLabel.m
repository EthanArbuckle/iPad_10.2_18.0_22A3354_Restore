@implementation CKDateLabel

- (void)setDate:(id)a3
{
  objc_super v3;
  objc_super v4;

  if (self->_textForOverride)
    -[UIDateLabel setDate:](&v4, sel_setDate_, 0, v3.receiver, v3.super_class, self, CKDateLabel);
  else
    -[UIDateLabel setDate:](&v3, sel_setDate_, a3, self, CKDateLabel, v4.receiver, v4.super_class);
}

- (id)text
{
  NSString *textForOverride;
  objc_super v4;

  textForOverride = self->_textForOverride;
  if (textForOverride)
    return textForOverride;
  v4.receiver = self;
  v4.super_class = (Class)CKDateLabel;
  -[UIDateLabel text](&v4, sel_text);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_dateString
{
  NSString *textForOverride;
  objc_super v4;

  textForOverride = self->_textForOverride;
  if (textForOverride)
    return textForOverride;
  v4.receiver = self;
  v4.super_class = (Class)CKDateLabel;
  -[UIDateLabel _dateString](&v4, sel__dateString);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setTextForOverride:(id)a3
{
  NSString *v4;
  NSString *textForOverride;

  v4 = (NSString *)a3;
  if (v4)
    -[CKDateLabel setDate:](self, "setDate:", 0);
  textForOverride = self->_textForOverride;
  self->_textForOverride = v4;

}

- (NSString)textForOverride
{
  return self->_textForOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textForOverride, 0);
}

@end
