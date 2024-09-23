@implementation _HUPocketButton

- (_HUPocketButton)initWithFrame:(CGRect)a3 highlightedAlpha:(double)a4 highlightedTextAlpha:(double)a5
{
  _HUPocketButton *v5;
  double v6;
  _HUPocketButton *v7;
  double v8;
  double v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_HUPocketButton;
  v5 = -[HUColoredButton initWithFrame:highlightedAlpha:highlightedTextAlpha:](&v12, sel_initWithFrame_highlightedAlpha_highlightedTextAlpha_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4, a5);
  v7 = v5;
  if (v5)
  {
    LODWORD(v6) = 1148846080;
    -[_HUPocketButton setContentCompressionResistancePriority:forAxis:](v5, "setContentCompressionResistancePriority:forAxis:", 1, v6);
    LODWORD(v8) = 1148846080;
    -[_HUPocketButton setContentCompressionResistancePriority:forAxis:](v7, "setContentCompressionResistancePriority:forAxis:", 0, v8);
    LODWORD(v9) = 1132068864;
    -[_HUPocketButton setContentHuggingPriority:forAxis:](v7, "setContentHuggingPriority:forAxis:", 1, v9);
    LODWORD(v10) = 1132068864;
    -[_HUPocketButton setContentHuggingPriority:forAxis:](v7, "setContentHuggingPriority:forAxis:", 0, v10);
  }
  return v7;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 512.0;
  v3 = 50.0;
  result.height = v3;
  result.width = v2;
  return result;
}

@end
