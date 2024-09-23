@implementation SUUICommentPostBarTextField

- (BOOL)becomeFirstResponder
{
  void *v3;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 1.0, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUICommentPostBarTextField setBackgroundColor:](self, "setBackgroundColor:", v3);

  v5.receiver = self;
  v5.super_class = (Class)SUUICommentPostBarTextField;
  return -[SUUICommentPostBarTextField becomeFirstResponder](&v5, sel_becomeFirstResponder);
}

- (BOOL)resignFirstResponder
{
  void *v3;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.97254902, 1.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUICommentPostBarTextField setBackgroundColor:](self, "setBackgroundColor:", v3);

  v5.receiver = self;
  v5.super_class = (Class)SUUICommentPostBarTextField;
  return -[SUUICommentPostBarTextField resignFirstResponder](&v5, sel_resignFirstResponder);
}

- (CGRect)textRectForBounds:(CGRect)result
{
  double v3;
  double v4;

  v3 = result.size.width + -20.0;
  v4 = 10.0;
  result.size.width = v3;
  result.origin.x = v4;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)result
{
  double v3;
  double v4;

  v3 = result.size.width + -20.0;
  v4 = 10.0;
  result.size.width = v3;
  result.origin.x = v4;
  return result;
}

@end
