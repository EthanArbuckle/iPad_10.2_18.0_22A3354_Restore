@implementation UIResponder

- (uint64_t)_accessibilitySupportsRichTextEditing
{
  char v2;
  id location;
  char v4;
  id v5;
  char v6;

  v5 = a1;
  if (a1)
  {
    v4 = 0;
    location = (id)objc_msgSend(v5, "_accessibilityTextViewTextOperationResponder");
    v2 = 0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v2 = objc_msgSend(location, "hasRichlyEditableSelection");
    v4 = v2 & 1;
    v6 = v2 & 1;
    objc_storeStrong(&location, 0);
  }
  else
  {
    v6 = 0;
  }
  return v6 & 1;
}

@end
