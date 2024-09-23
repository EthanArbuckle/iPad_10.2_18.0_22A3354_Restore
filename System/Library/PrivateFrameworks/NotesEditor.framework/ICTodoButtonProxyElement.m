@implementation ICTodoButtonProxyElement

- (ICTodoButtonProxyElement)initWithTodoButton:(id)a3 inTextRange:(_NSRange)a4 textView:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  ICTodoButtonProxyElement *v11;
  ICTodoButtonProxyElement *v12;
  objc_super v14;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)ICTodoButtonProxyElement;
  v11 = -[ICTodoButtonProxyElement initWithAccessibilityContainer:](&v14, sel_initWithAccessibilityContainer_, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_todoButton, v9);
    v12->_textRange.location = location;
    v12->_textRange.length = length;
    objc_storeWeak((id *)&v12->_textView, v10);
  }

  return v12;
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("checklist button"), &stru_1EA7E9860, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  -[ICTodoButtonProxyElement todoButton](self, "todoButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDone");
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("completed");
  else
    v6 = CFSTR("incomplete");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1EA7E9860, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGRect)accessibilityFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[ICTodoButtonProxyElement todoButton](self, "todoButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  char v8;

  -[ICTodoButtonProxyElement textView](self, "textView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editorController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "note");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDeletedOrInTrash");

  if (!v6)
    return 0;
  -[ICTodoButtonProxyElement todoButton](self, "todoButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "accessibilityActivate");

  return v8;
}

- (ICTodoButton)todoButton
{
  return (ICTodoButton *)objc_loadWeakRetained((id *)&self->_todoButton);
}

- (void)setTodoButton:(id)a3
{
  objc_storeWeak((id *)&self->_todoButton, a3);
}

- (_NSRange)textRange
{
  _NSRange *p_textRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_textRange = &self->_textRange;
  location = self->_textRange.location;
  length = p_textRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setTextRange:(_NSRange)a3
{
  self->_textRange = a3;
}

- (ICBaseTextView)textView
{
  return (ICBaseTextView *)objc_loadWeakRetained((id *)&self->_textView);
}

- (void)setTextView:(id)a3
{
  objc_storeWeak((id *)&self->_textView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textView);
  objc_destroyWeak((id *)&self->_todoButton);
}

@end
