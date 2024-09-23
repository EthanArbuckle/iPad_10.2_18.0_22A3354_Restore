@implementation UIView(SUUIApparentBackgroundColor)

- (id)suui_apparentBackgroundColor
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v1 = a1;
  if (v1)
  {
    while (1)
    {
      objc_msgSend(v1, "backgroundColor");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v2, "suui_isOpaque") & 1) != 0)
      {
        v5 = v2;
        goto LABEL_8;
      }
      v3 = objc_alloc(MEMORY[0x24BEBD4B8]);
      objc_msgSend(v1, "layer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v3, "initWithCGColor:", objc_msgSend(v4, "backgroundColor"));

      if (objc_msgSend(v5, "suui_isOpaque"))
        break;
      objc_msgSend(v1, "superview");
      v6 = objc_claimAutoreleasedReturnValue();

      v1 = (id)v6;
      if (!v6)
        goto LABEL_5;
    }

  }
  else
  {
LABEL_5:
    v5 = 0;
  }
LABEL_8:

  return v5;
}

@end
