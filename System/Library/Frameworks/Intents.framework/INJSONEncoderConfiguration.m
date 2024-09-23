@implementation INJSONEncoderConfiguration

- (INJSONEncoderConfiguration)init
{
  INJSONEncoderConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)INJSONEncoderConfiguration;
  result = -[INJSONEncoderConfiguration init](&v3, sel_init);
  if (result)
    result->_locationIncludesTimestamp = 1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  INJSONEncoderConfiguration *v4;

  v4 = objc_alloc_init(INJSONEncoderConfiguration);
  -[INJSONEncoderConfiguration setLanguageCode:](v4, "setLanguageCode:", self->_languageCode);
  -[INJSONEncoderConfiguration setLocationIncludesTimestamp:](v4, "setLocationIncludesTimestamp:", self->_locationIncludesTimestamp);
  return v4;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)locationIncludesTimestamp
{
  return self->_locationIncludesTimestamp;
}

- (void)setLocationIncludesTimestamp:(BOOL)a3
{
  self->_locationIncludesTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageCode, 0);
}

@end
