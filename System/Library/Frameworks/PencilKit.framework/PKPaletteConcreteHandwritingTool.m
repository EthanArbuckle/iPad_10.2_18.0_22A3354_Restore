@implementation PKPaletteConcreteHandwritingTool

- (NSString)toolIdentifier
{
  return (NSString *)CFSTR("com.apple.ink.handwriting");
}

- (BOOL)isHandwritingTool
{
  return 1;
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

@end
