@implementation ICParagraphInfoSortInfo

- (ICTrackedParagraph)trackedParagraph
{
  return self->_trackedParagraph;
}

- (void)setTrackedParagraph:(id)a3
{
  objc_storeStrong((id *)&self->_trackedParagraph, a3);
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setAttributedString:(id)a3
{
  objc_storeStrong((id *)&self->_attributedString, a3);
}

- (_NSRange)characterRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_characterRange.length;
  location = self->_characterRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setCharacterRange:(_NSRange)a3
{
  self->_characterRange = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_trackedParagraph, 0);
}

@end
