@implementation DNDSMutableModeRecord

- (void)setSymbolImageName:(id)a3
{
  NSString *v4;
  NSString *symbolImageName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  symbolImageName = self->super._symbolImageName;
  self->super._symbolImageName = v4;

}

- (void)setTintColorName:(id)a3
{
  NSString *v4;
  NSString *tintColorName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  tintColorName = self->super._tintColorName;
  self->super._tintColorName = v4;

}

- (void)setSymbolDescriptorTintStyle:(unint64_t)a3
{
  self->super._symbolDescriptorTintStyle = a3;
}

- (void)setSymbolDescriptorTintColorNames:(id)a3
{
  NSArray *v4;
  NSArray *symbolDescriptorTintColorNames;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  symbolDescriptorTintColorNames = self->super._symbolDescriptorTintColorNames;
  self->super._symbolDescriptorTintColorNames = v4;

}

- (void)setSymbolDescriptorImageName:(id)a3
{
  NSString *v4;
  NSString *symbolDescriptorImageName;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  symbolDescriptorImageName = self->super._symbolDescriptorImageName;
  self->super._symbolDescriptorImageName = v4;

}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  name = self->super._name;
  self->super._name = v4;

}

- (void)setModeIdentifier:(id)a3
{
  NSString *v4;
  NSString *modeIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  modeIdentifier = self->super._modeIdentifier;
  self->super._modeIdentifier = v4;

}

- (void)setSemanticType:(int64_t)a3
{
  self->super._semanticType = a3;
}

- (void)setVisibility:(unint64_t)a3
{
  self->super._visibility = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->super._identifier, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v16;
  DNDSModeRecord *v17;

  v17 = +[DNDSModeRecord allocWithZone:](DNDSModeRecord, "allocWithZone:", a3);
  -[DNDSModeRecord symbolImageName](self, "symbolImageName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeRecord tintColorName](self, "tintColorName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[DNDSModeRecord symbolDescriptorTintStyle](self, "symbolDescriptorTintStyle");
  -[DNDSModeRecord symbolDescriptorTintColorNames](self, "symbolDescriptorTintColorNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeRecord symbolDescriptorImageName](self, "symbolDescriptorImageName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeRecord name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeRecord modeIdentifier](self, "modeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[DNDSModeRecord semanticType](self, "semanticType");
  v11 = -[DNDSModeRecord visibility](self, "visibility");
  -[DNDSModeRecord identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeRecord placeholderExcludedPlatforms](self, "placeholderExcludedPlatforms");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[DNDSModeRecord _initWithSymbolImageName:tintColorName:symbolDescriptorTintStyle:symbolDescriptorTintColorNames:symbolDescriptorImageName:name:modeIdentifier:semanticType:visibility:identifier:placeholderExcludedPlatforms:](v17, "_initWithSymbolImageName:tintColorName:symbolDescriptorTintStyle:symbolDescriptorTintColorNames:symbolDescriptorImageName:name:modeIdentifier:semanticType:visibility:identifier:placeholderExcludedPlatforms:", v16, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13);

  return v14;
}

@end
