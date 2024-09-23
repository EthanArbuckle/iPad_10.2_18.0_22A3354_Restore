@implementation PKToolPickerScribbleItem

- (PKToolPickerScribbleItem)init
{
  PKHandwritingTool *v3;
  PKToolPickerScribbleItem *v4;
  objc_super v6;

  v3 = objc_alloc_init(PKHandwritingTool);
  v6.receiver = self;
  v6.super_class = (Class)PKToolPickerScribbleItem;
  v4 = -[PKToolPickerItem initWithTool:](&v6, sel_initWithTool_, v3);

  return v4;
}

@end
