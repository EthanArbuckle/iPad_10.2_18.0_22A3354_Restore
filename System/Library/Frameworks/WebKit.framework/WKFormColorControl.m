@implementation WKFormColorControl

- (WKFormColorControl)initWithView:(id)a3
{
  WKFormColorControl *v4;
  CFTypeRef v5;
  objc_super v7;
  CFTypeRef cf;

  v7.receiver = self;
  v7.super_class = (Class)WKFormColorControl;
  cf = -[WKColorPicker initWithView:]([WKColorPicker alloc], "initWithView:", a3);
  v4 = -[WKFormPeripheralBase initWithView:control:](&v7, sel_initWithView_control_, a3, &cf);
  v5 = cf;
  cf = 0;
  if (v5)
    CFRelease(v5);
  return v4;
}

- (void)selectColor:(id)a3
{
  -[WKFormPeripheralBase control](self, "control");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    -[WKFormControl selectColor:](-[WKFormPeripheralBase control](self, "control"), "selectColor:", a3);
}

@end
