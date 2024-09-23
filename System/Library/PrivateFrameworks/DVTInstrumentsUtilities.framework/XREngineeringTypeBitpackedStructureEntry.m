@implementation XREngineeringTypeBitpackedStructureEntry

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (_NSRange)bitRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_bitRange.length;
  location = self->_bitRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setBitRange:(_NSRange)a3
{
  self->_bitRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
}

@end
