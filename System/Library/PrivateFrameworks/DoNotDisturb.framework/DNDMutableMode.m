@implementation DNDMutableMode

- (void)setTintColorName:(id)a3
{
  NSString *v4;
  NSString *tintColorName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  tintColorName = self->super._tintColorName;
  self->super._tintColorName = v4;

}

- (void)setSymbolDescriptor:(id)a3
{
  DNDModeSymbolDescriptor *v4;
  DNDModeSymbolDescriptor *symbolDescriptor;

  v4 = (DNDModeSymbolDescriptor *)objc_msgSend(a3, "copy");
  symbolDescriptor = self->super._symbolDescriptor;
  self->super._symbolDescriptor = v4;

}

- (void)setSymbolImageName:(id)a3
{
  NSString *v4;
  NSString *symbolImageName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  symbolImageName = self->super._symbolImageName;
  self->super._symbolImageName = v4;

}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  name = self->super._name;
  self->super._name = v4;

}

- (void)setIdentifier:(id)a3
{
  NSUUID *v4;
  NSUUID *identifier;

  v4 = (NSUUID *)objc_msgSend(a3, "copy");
  identifier = self->super._identifier;
  self->super._identifier = v4;

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[DNDMode _initWithMode:]([DNDMode alloc], "_initWithMode:", self);
}

@end
