@implementation ICParagraphInfo

- (unsigned)style
{
  void *v2;
  unsigned int v3;

  -[ICParagraphInfo paragraphStyle](self, "paragraphStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "style");

  return v3;
}

- (unint64_t)indent
{
  void *v2;
  unint64_t v3;

  -[ICParagraphInfo paragraphStyle](self, "paragraphStyle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indent");

  return v3;
}

- (ICTTParagraphStyle)paragraphStyle
{
  return self->_paragraphStyle;
}

- (void)setParagraphStyle:(id)a3
{
  objc_storeStrong((id *)&self->_paragraphStyle, a3);
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

- (_NSRange)rangeIncludingChildren
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_rangeIncludingChildren.length;
  location = self->_rangeIncludingChildren.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRangeIncludingChildren:(_NSRange)a3
{
  self->_rangeIncludingChildren = a3;
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (unint64_t)blockQuoteLevel
{
  return self->_blockQuoteLevel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_paragraphStyle, 0);
}

@end
