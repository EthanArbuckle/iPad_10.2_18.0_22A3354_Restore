@implementation SRCompactLinkTappableTextView

- (SRCompactLinkTappableTextView)initWithFrame:(CGRect)a3 textContainer:(id)a4
{
  SRCompactLinkTappableTextView *v4;
  SRCompactLinkTappableTextView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SRCompactLinkTappableTextView;
  v4 = -[SRCompactLinkTappableTextView initWithFrame:textContainer:](&v7, "initWithFrame:textContainer:", a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
    -[SRCompactLinkTappableTextView setSelectable:](v4, "setSelectable:", 1);
  return v5;
}

- (void)setSelectable:(BOOL)a3
{
  id v3;
  objc_super v4;

  if (!a3)
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, CFSTR("SRCompactLinkTappableTextView must be selectable"), 0));
    objc_exception_throw(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)SRCompactLinkTappableTextView;
  -[SRCompactLinkTappableTextView setSelectable:](&v4, "setSelectable:", 1);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  objc_super v19;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactLinkTappableTextView attributedText](self, "attributedText"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactLinkTappableTextView closestPositionToPoint:](self, "closestPositionToPoint:", x, y));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactLinkTappableTextView tokenizer](self, "tokenizer"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rangeEnclosingPosition:withGranularity:inDirection:", v9, 0, 3));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactLinkTappableTextView beginningOfDocument](self, "beginningOfDocument"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "start"));
    v14 = -[SRCompactLinkTappableTextView offsetFromPosition:toPosition:](self, "offsetFromPosition:toPosition:", v12, v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SRCompactLinkTappableTextView attributedText](self, "attributedText"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "attribute:atIndex:effectiveRange:", NSLinkAttributeName, v14, 0));
    v17 = v16 != 0;

  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)SRCompactLinkTappableTextView;
    v17 = -[SRCompactLinkTappableTextView pointInside:withEvent:](&v19, "pointInside:withEvent:", v7, x, y);
  }

  return v17;
}

@end
