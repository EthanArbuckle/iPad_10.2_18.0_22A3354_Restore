@implementation _CNAtomTextViewBaselineLayoutStrut

- (CGSize)intrinsicContentSize
{
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  -[_CNAtomTextViewBaselineLayoutStrut font](self, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("X"), "sizeWithFont:forWidth:lineBreakMode:letterSpacing:", v4, -[_CNAtomTextViewBaselineLayoutStrut lineBreakMode](self, "lineBreakMode"), 3.40282347e38, 0.0);
  v6 = v5;

  v7 = v3;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

@end
