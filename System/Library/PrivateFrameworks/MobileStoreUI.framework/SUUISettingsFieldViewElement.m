@implementation SUUISettingsFieldViewElement

- (id)textInputViewElement
{
  void *v2;
  id v3;

  -[SUUIViewElement firstChildForElementType:](self, "firstChildForElementType:", 140);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isMemberOfClass:", objc_opt_class()))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

@end
