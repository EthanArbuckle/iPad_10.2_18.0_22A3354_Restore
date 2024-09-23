@implementation PKToolPickerLassoItem

- (PKToolPickerLassoItem)init
{
  PKLassoTool *v3;
  PKToolPickerLassoItem *v4;
  objc_super v6;

  v3 = objc_alloc_init(PKLassoTool);
  v6.receiver = self;
  v6.super_class = (Class)PKToolPickerLassoItem;
  v4 = -[PKToolPickerItem initWithTool:](&v6, sel_initWithTool_, v3);

  return v4;
}

- (BOOL)_toolShouldBeSetOnCanvasView
{
  return 1;
}

@end
