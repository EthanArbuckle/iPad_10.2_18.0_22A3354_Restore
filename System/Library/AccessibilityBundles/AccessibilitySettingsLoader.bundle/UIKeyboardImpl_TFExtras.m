@implementation UIKeyboardImpl_TFExtras

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIKeyboardImpl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (_NSRange)_selectedTextRangeForInputDelegate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  v3 = a3;
  objc_msgSend(v3, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginningOfDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "offsetFromPosition:toPosition:", v5, v6);

  objc_msgSend(v4, "end");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "offsetFromPosition:toPosition:", v5, v8);

  v10 = v7;
  v11 = v9 - v7;
  result.length = v11;
  result.location = v10;
  return result;
}

- (id)_textInInputDelegate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "beginningOfDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endOfDocument");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textRangeFromPosition:toPosition:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInRange:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
