@implementation DDMLToken

- (DDMLTokenType)tokenType
{
  return (DDMLTokenType *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTokenType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (float)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(float)a3
{
  self->_confidence = a3;
}

- (_NSRange)range
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_range, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  _NSRange v3;

  v3 = a3;
  objc_copyStruct(&self->_range, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_tokenType, 0);
}

@end
