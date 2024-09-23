@implementation SGSelfIdentificationDetection

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (_NSRange)contextRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_contextRange.length;
  location = self->_contextRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setContextRange:(_NSRange)a3
{
  self->_contextRange = a3;
}

- (SGExtractionInfo)extractionInfo
{
  return self->_extractionInfo;
}

- (void)setExtractionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_extractionInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractionInfo, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
