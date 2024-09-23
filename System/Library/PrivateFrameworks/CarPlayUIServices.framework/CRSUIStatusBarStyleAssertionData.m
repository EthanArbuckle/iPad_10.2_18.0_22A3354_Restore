@implementation CRSUIStatusBarStyleAssertionData

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (int64_t)interfaceStyle
{
  return self->_interfaceStyle;
}

- (void)setInterfaceStyle:(int64_t)a3
{
  self->_interfaceStyle = a3;
}

- (int64_t)colorVariant
{
  return self->_colorVariant;
}

- (void)setColorVariant:(int64_t)a3
{
  self->_colorVariant = a3;
}

- (BOOL)isSiriPresentation
{
  return self->_siriPresentation;
}

- (void)setSiriPresentation:(BOOL)a3
{
  self->_siriPresentation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
