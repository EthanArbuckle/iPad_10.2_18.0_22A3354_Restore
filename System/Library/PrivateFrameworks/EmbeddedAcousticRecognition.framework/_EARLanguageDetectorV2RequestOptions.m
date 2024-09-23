@implementation _EARLanguageDetectorV2RequestOptions

- (_EARLanguageDetectorV2RequestOptions)init
{
  _EARLanguageDetectorV2RequestOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_EARLanguageDetectorV2RequestOptions;
  result = -[_EARLanguageDetectorV2RequestOptions init](&v3, sel_init);
  if (result)
    *(_WORD *)&result->_useMaxpool = 257;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _EARLanguageDetectorV2RequestOptions *v4;

  v4 = -[_EARLanguageDetectorV2RequestOptions init](+[_EARLanguageDetectorV2RequestOptions allocWithZone:](_EARLanguageDetectorV2RequestOptions, "allocWithZone:", a3), "init");
  -[_EARLanguageDetectorV2RequestOptions setReportingFrequency:](v4, "setReportingFrequency:", -[_EARLanguageDetectorV2RequestOptions reportingFrequency](self, "reportingFrequency"));
  -[_EARLanguageDetectorV2RequestOptions setUseMaxpool:](v4, "setUseMaxpool:", -[_EARLanguageDetectorV2RequestOptions useMaxpool](self, "useMaxpool"));
  return v4;
}

- (BOOL)useMaxpool
{
  return self->_useMaxpool;
}

- (void)setUseMaxpool:(BOOL)a3
{
  self->_useMaxpool = a3;
}

- (char)reportingFrequency
{
  return self->_reportingFrequency;
}

- (void)setReportingFrequency:(char)a3
{
  self->_reportingFrequency = a3;
}

@end
