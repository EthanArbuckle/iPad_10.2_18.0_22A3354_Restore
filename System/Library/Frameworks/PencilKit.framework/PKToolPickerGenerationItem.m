@implementation PKToolPickerGenerationItem

- (PKToolPickerGenerationItem)init
{
  PKGenerationTool *v3;
  PKToolPickerGenerationItem *v4;
  objc_super v6;

  v3 = objc_alloc_init(PKGenerationTool);
  v6.receiver = self;
  v6.super_class = (Class)PKToolPickerGenerationItem;
  v4 = -[PKToolPickerItem initWithTool:](&v6, sel_initWithTool_, v3);

  return v4;
}

- (BOOL)_toolShouldBeSetOnCanvasView
{
  return 1;
}

@end
