@implementation SGDataDetectorMatchesWithSignatureRange

- (NSArray)matches
{
  return self->_matches;
}

- (void)setMatches:(id)a3
{
  objc_storeStrong((id *)&self->_matches, a3);
}

- (_NSRange)signatureRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_signatureRange.length;
  location = self->_signatureRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setSignatureRange:(_NSRange)a3
{
  self->_signatureRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matches, 0);
}

@end
