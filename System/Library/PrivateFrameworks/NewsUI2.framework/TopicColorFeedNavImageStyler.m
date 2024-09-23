@implementation TopicColorFeedNavImageStyler

- (UIFont)tagTitleFont
{
  return (UIFont *)objc_msgSend(*(id *)self->feedNavImageStyler, sel_tagTitleFont);
}

- (id)tagColorFor:(id)a3
{
  return *(id *)self->tagColor;
}

- (double)cornerRadius
{
  double result;

  objc_msgSend(*(id *)self->feedNavImageStyler, sel_cornerRadius);
  return result;
}

- (double)padding
{
  double result;

  objc_msgSend(*(id *)self->feedNavImageStyler, sel_padding);
  return result;
}

@end
