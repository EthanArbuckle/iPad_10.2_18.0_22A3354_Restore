@implementation _MFAtomTextViewBaselineLayoutStrut

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[_MFAtomTextViewBaselineLayoutStrut font](self, "font");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("X"), "sizeWithFont:forWidth:lineBreakMode:letterSpacing:", v3, -[_MFAtomTextViewBaselineLayoutStrut lineBreakMode](self, "lineBreakMode"), 3.40282347e38, 0.0);
  v5 = v4;
  v6 = *MEMORY[0x1E0C9D820];

  v7 = v6;
  v8 = v5;
  result.height = v8;
  result.width = v7;
  return result;
}

@end
