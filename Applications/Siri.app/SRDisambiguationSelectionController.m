@implementation SRDisambiguationSelectionController

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  SRUserUtteranceView *v7;

  v7 = -[SRUserUtteranceView initWithFrame:]([SRUserUtteranceView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationSelectionController aceObject](self, "aceObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selectionResponse"));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationSelectionController aceObject](self, "aceObject"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectionText"));

    if (!v4)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationSelectionController aceObject](self, "aceObject"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));

    }
  }
  -[SRUserUtteranceView setText:](v7, "setText:", v4);
  -[SRUserUtteranceView setEditable:](v7, "setEditable:", 0);
  -[SRUserUtteranceView setBlendEffectEnabled:](v7, "setBlendEffectEnabled:", 1);
  -[SRDisambiguationSelectionController setView:](self, "setView:", v7);

}

- (double)desiredHeightForWidth:(double)a3
{
  void *v4;
  double v5;
  double v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationSelectionController view](self, "view"));
  objc_msgSend(v4, "sizeThatFits:", a3, 1.79769313e308);
  v6 = v5;

  return v6;
}

- (double)baselineOffsetFromBottom
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SRDisambiguationSelectionController view](self, "view"));
  objc_msgSend(v2, "baselineOffsetFromBottom");
  v4 = v3;

  return v4;
}

- (int64_t)_pinAnimationType
{
  return 1;
}

@end
