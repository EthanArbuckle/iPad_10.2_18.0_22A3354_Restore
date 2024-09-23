@implementation MRURouteTextFormatterConfiguration

- (MRURouteTextFormatterConfiguration)init
{
  MRURouteTextFormatterConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MRURouteTextFormatterConfiguration;
  result = -[MRURouteTextFormatterConfiguration init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->_truncationMode = xmmword_1AAAD6080;
    result->_textBoundingWidth = 1.79769313e308;
    *(_DWORD *)&result->_forcesUppercaseText = 0x1000000;
    result->_usesPredictedOutputDevice = 0;
  }
  return result;
}

- (int64_t)truncationMode
{
  return self->_truncationMode;
}

- (void)setTruncationMode:(int64_t)a3
{
  self->_truncationMode = a3;
}

- (int64_t)minimumEndCharacterCount
{
  return self->_minimumEndCharacterCount;
}

- (void)setMinimumEndCharacterCount:(int64_t)a3
{
  self->_minimumEndCharacterCount = a3;
}

- (BOOL)forcesUppercaseText
{
  return self->_forcesUppercaseText;
}

- (void)setForcesUppercaseText:(BOOL)a3
{
  self->_forcesUppercaseText = a3;
}

- (BOOL)displayAsSiriSuggestion
{
  return self->_displayAsSiriSuggestion;
}

- (void)setDisplayAsSiriSuggestion:(BOOL)a3
{
  self->_displayAsSiriSuggestion = a3;
}

- (BOOL)omitGroupLeaderName
{
  return self->_omitGroupLeaderName;
}

- (void)setOmitGroupLeaderName:(BOOL)a3
{
  self->_omitGroupLeaderName = a3;
}

- (UIFont)font
{
  return self->_font;
}

- (void)setFont:(id)a3
{
  objc_storeStrong((id *)&self->_font, a3);
}

- (double)textBoundingWidth
{
  return self->_textBoundingWidth;
}

- (void)setTextBoundingWidth:(double)a3
{
  self->_textBoundingWidth = a3;
}

- (BOOL)allowsMultitruncation
{
  return self->_allowsMultitruncation;
}

- (void)setAllowsMultitruncation:(BOOL)a3
{
  self->_allowsMultitruncation = a3;
}

- (BOOL)usesPredictedOutputDevice
{
  return self->_usesPredictedOutputDevice;
}

- (void)setUsesPredictedOutputDevice:(BOOL)a3
{
  self->_usesPredictedOutputDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_font, 0);
}

@end
