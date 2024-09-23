@implementation GKConstraintLeadingInfo

- (NSString)fontTextStyle
{
  return self->_fontTextStyle;
}

- (void)setFontTextStyle:(id)a3
{
  objc_storeStrong((id *)&self->_fontTextStyle, a3);
}

- (double)leading
{
  return self->_leading;
}

- (void)setLeading:(double)a3
{
  self->_leading = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontTextStyle, 0);
}

@end
