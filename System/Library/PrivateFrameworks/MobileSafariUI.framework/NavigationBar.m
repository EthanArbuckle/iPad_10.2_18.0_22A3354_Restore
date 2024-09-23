@implementation NavigationBar

- (void)setExpanded:(BOOL)a3 textFieldSelectionRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  _BOOL8 v6;
  void *v8;
  objc_super v9;

  length = a4.length;
  location = a4.location;
  v6 = a3;
  if (a3 && !-[_SFNavigationBar isExpanded](self, "isExpanded"))
  {
    -[NavigationBar textField](self, "textField");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setReflectedItem:", 0);

  }
  v9.receiver = self;
  v9.super_class = (Class)NavigationBar;
  -[_SFNavigationBar setExpanded:textFieldSelectionRange:completionHandler:](&v9, sel_setExpanded_textFieldSelectionRange_completionHandler_, v6, location, length, 0);
}

- (double)placeholderHorizontalInset
{
  void *v2;
  double v3;
  double v4;

  -[NavigationBar textField](self, "textField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placeholderHorizontalInset");
  v4 = v3;

  return v4;
}

- (void)setTextFieldPlaceHolderColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[NavigationBar textField](self, "textField");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPlaceholderColor:", v4);

}

- (UnifiedField)textField
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NavigationBar;
  -[_SFNavigationBar textField](&v3, sel_textField);
  return (UnifiedField *)(id)objc_claimAutoreleasedReturnValue();
}

- (id)newTextField
{
  return objc_alloc_init(UnifiedField);
}

@end
