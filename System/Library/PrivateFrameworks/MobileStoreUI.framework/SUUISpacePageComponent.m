@implementation SUUISpacePageComponent

- (SUUISpacePageComponent)initWithCustomPageContext:(id)a3
{
  id v4;
  SUUISpacePageComponent *v5;
  void *v6;
  void *v7;
  double v8;
  char v9;
  float v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUUISpacePageComponent;
  v5 = -[SUUIPageComponent initWithCustomPageContext:](&v12, sel_initWithCustomPageContext_, v4);
  if (v5)
  {
    objc_msgSend(v4, "componentDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("size"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = SUUISpacePageComponentHeightForString(v7);
    }
    else
    {
      v9 = objc_opt_respondsToSelector();
      v8 = 7.0;
      if ((v9 & 1) != 0)
      {
        objc_msgSend(v7, "floatValue", 7.0);
        v8 = v10;
      }
    }
    v5->_height = v8;

  }
  return v5;
}

- (int64_t)componentType
{
  return 14;
}

- (double)height
{
  return self->_height;
}

@end
