@implementation IKHeadElement

+ (BOOL)shouldParseChildDOMElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  unsigned __int8 v8;
  objc_super v10;

  v4 = a3;
  objc_msgSend(v4, "tagName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("style")))
  {

  }
  else
  {
    objc_msgSend(v4, "tagName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("script"));

    if ((v7 & 1) == 0)
    {
      v10.receiver = a1;
      v10.super_class = (Class)&OBJC_METACLASS___IKHeadElement;
      v8 = objc_msgSendSuper2(&v10, sel_shouldParseChildDOMElement_, v4);
      goto LABEL_6;
    }
  }
  v8 = 0;
LABEL_6:

  return v8;
}

@end
