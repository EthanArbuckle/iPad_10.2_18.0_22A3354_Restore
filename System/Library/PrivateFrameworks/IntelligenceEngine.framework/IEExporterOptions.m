@implementation IEExporterOptions

- (BOOL)transparent
{
  return self->_transparent;
}

- (void)setTransparent:(BOOL)a3
{
  self->_transparent = a3;
}

- (BOOL)lightMode
{
  return self->_lightMode;
}

- (void)setLightMode:(BOOL)a3
{
  self->_lightMode = a3;
}

- (BOOL)darkMode
{
  return self->_darkMode;
}

- (void)setDarkMode:(BOOL)a3
{
  self->_darkMode = a3;
}

- (BOOL)conditions
{
  return self->_conditions;
}

- (void)setConditions:(BOOL)a3
{
  self->_conditions = a3;
}

- (int)dotsPerInch
{
  return self->_dotsPerInch;
}

- (void)setDotsPerInch:(int)a3
{
  self->_dotsPerInch = a3;
}

- (NSString)highlightResponse
{
  return self->_highlightResponse;
}

- (void)setHighlightResponse:(id)a3
{
  objc_storeStrong((id *)&self->_highlightResponse, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightResponse, 0);
}

@end
