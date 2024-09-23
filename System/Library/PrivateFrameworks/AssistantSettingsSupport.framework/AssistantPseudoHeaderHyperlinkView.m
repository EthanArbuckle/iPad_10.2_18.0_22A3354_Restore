@implementation AssistantPseudoHeaderHyperlinkView

- (double)preferredHeightForWidth:(double)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AssistantPseudoHeaderHyperlinkView;
  -[AssistantPseudoHeaderHyperlinkView preferredHeightForWidth:](&v9, sel_preferredHeightForWidth_, a3);
  v4 = v3;
  PSTableSectionFooterBottomPad();
  v6 = v5;
  PSTextViewInsets();
  return v4 - (v6 + v7);
}

@end
