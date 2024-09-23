@implementation EMKEmojiOverlayElement

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (_NSRange)rowRange
{
  _NSRange *p_rowRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_rowRange = &self->_rowRange;
  location = self->_rowRange.location;
  length = p_rowRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRowRange:(_NSRange)a3
{
  self->_rowRange = a3;
}

@end
