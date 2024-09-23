@implementation PKToolPickerRulerItem

- (PKToolPickerRulerItem)init
{
  PKRulerTool *v3;
  PKToolPickerRulerItem *v4;
  objc_super v6;

  v3 = objc_alloc_init(PKRulerTool);
  v6.receiver = self;
  v6.super_class = (Class)PKToolPickerRulerItem;
  v4 = -[PKToolPickerItem initWithTool:](&v6, sel_initWithTool_, v3);

  return v4;
}

- (id)_dictionaryRepresentation
{
  return (id)MEMORY[0x1E0C9AA70];
}

@end
