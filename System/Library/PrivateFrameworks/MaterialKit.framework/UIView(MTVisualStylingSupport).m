@implementation UIView(MTVisualStylingSupport)

- (void)mt_applyVisualStyling:()MTVisualStylingSupport
{
  objc_class *v4;
  objc_class *v5;
  void (*MethodImplementation)(void);
  id v7;
  _QWORD v8[5];

  v7 = a3;
  v4 = (objc_class *)objc_opt_class();
  v5 = (objc_class *)objc_opt_class();
  MethodImplementation = class_getMethodImplementation(v5, sel__mt_applyVisualStyling_);
  if (MethodImplementation == class_getMethodImplementation(v4, sel__mt_applyVisualStyling_))
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __56__UIView_MTVisualStylingSupport__mt_applyVisualStyling___block_invoke;
    v8[3] = &unk_24C3DBA90;
    v8[4] = a1;
    objc_msgSend(v7, "applyToView:withColorBlock:", a1, v8);

  }
  else
  {
    objc_msgSend(a1, "_mt_applyVisualStyling:", v7);

  }
}

- (void)mt_replaceVisualStyling:()MTVisualStylingSupport
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "mt_removeAllVisualStyling");
  objc_msgSend(a1, "mt_applyVisualStyling:", v4);

}

- (void)mt_removeAllVisualStyling
{
  id v1;

  objc_msgSend(a1, "layer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "mt_removeAllVisualStyling");

}

@end
