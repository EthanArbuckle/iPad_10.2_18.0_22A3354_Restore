@implementation CLKComplicationTemplateAuxilaryInfo

- (CLKComplicationTemplateAuxilaryInfo)initWithCoder:(id)a3
{
  id v4;
  CLKComplicationTemplateAuxilaryInfo *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CLKComplicationTemplateAuxilaryInfo;
  v5 = -[CLKComplicationTemplateAuxilaryInfo init](&v7, sel_init);
  if (v5)
    v5->_supportsComplicationForegroundModifier = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("SupportsComplicationForegroundModifierKey"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->_supportsComplicationForegroundModifier, CFSTR("SupportsComplicationForegroundModifierKey"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)supportsComplicationForegroundModifier
{
  return self->_supportsComplicationForegroundModifier;
}

- (void)setSupportsComplicationForegroundModifier:(BOOL)a3
{
  self->_supportsComplicationForegroundModifier = a3;
}

@end
