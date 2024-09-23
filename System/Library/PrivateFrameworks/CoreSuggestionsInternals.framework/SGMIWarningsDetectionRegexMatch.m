@implementation SGMIWarningsDetectionRegexMatch

- (SGMIWarningsDetectionRegexMatch)initWithRange:(_NSRange)a3 coreRange:(_NSRange)a4 signature:(id)a5 wildcardsMatches:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v10;
  NSUInteger v11;
  id v13;
  id v14;
  SGMIWarningsDetectionRegexMatch *v15;
  SGMIWarningsDetectionRegexMatch *v16;
  objc_super v18;

  length = a4.length;
  location = a4.location;
  v10 = a3.length;
  v11 = a3.location;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SGMIWarningsDetectionRegexMatch;
  v15 = -[SGMIWarningsDetectionRegexMatch init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    v15->_range.location = v11;
    v15->_range.length = v10;
    v15->_coreRange.location = location;
    v15->_coreRange.length = length;
    objc_storeStrong((id *)&v15->_signature, a5);
    objc_storeStrong((id *)&v16->_wildcardsMatches, a6);
  }

  return v16;
}

- (unint64_t)location
{
  return self->_range.location;
}

- (unint64_t)length
{
  return self->_range.length;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (_NSRange)coreRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_coreRange.length;
  location = self->_coreRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSString)signature
{
  return self->_signature;
}

- (NSArray)wildcardsMatches
{
  return self->_wildcardsMatches;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wildcardsMatches, 0);
  objc_storeStrong((id *)&self->_signature, 0);
}

@end
