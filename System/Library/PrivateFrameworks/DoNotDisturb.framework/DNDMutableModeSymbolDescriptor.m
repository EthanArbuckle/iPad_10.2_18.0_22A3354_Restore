@implementation DNDMutableModeSymbolDescriptor

- (DNDMutableModeSymbolDescriptor)initWithTintStyle:(unint64_t)a3 tintColorNames:(id)a4 imageName:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DNDMutableModeSymbolDescriptor;
  return -[DNDModeSymbolDescriptor initWithTintStyle:tintColorNames:imageName:](&v6, sel_initWithTintStyle_tintColorNames_imageName_, a3, a4, a5);
}

- (void)setTintStyle:(unint64_t)a3
{
  self->super._tintStyle = a3;
}

- (void)setTintColorNames:(id)a3
{
  NSArray *v4;
  NSArray *tintColorNames;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  tintColorNames = self->super._tintColorNames;
  self->super._tintColorNames = v4;

}

- (void)setImageName:(id)a3
{
  NSString *v4;
  NSString *imageName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  imageName = self->super._imageName;
  self->super._imageName = v4;

}

@end
