@implementation CKSyndicationOnboardingTailedBubble

- (CKSyndicationOnboardingTailedBubble)initWithFrame:(CGRect)a3 withAppName:(int64_t)a4 withLPLinkView:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  CKPinnedConversationRichLinkActivityItem *v12;
  CKSyndicationOnboardingTailedBubble *v13;
  CKSyndicationOnboardingTailedBubble *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  -[CKSyndicationOnboardingTailedBubble setAppName:](self, "setAppName:", a4);
  v12 = -[CKPinnedConversationRichLinkActivityItem initWithLinkView:]([CKPinnedConversationRichLinkActivityItem alloc], "initWithLinkView:", v11);

  v16.receiver = self;
  v16.super_class = (Class)CKSyndicationOnboardingTailedBubble;
  v13 = -[CKPinnedConversationRichLinkBubble initWithRichLinkActivityItem:](&v16, sel_initWithRichLinkActivityItem_, v12);
  v14 = v13;
  if (v13)
  {
    -[CKSyndicationOnboardingTailedBubble setBubbleFrame:](v13, "setBubbleFrame:", x, y, width, height);
    -[CKSyndicationOnboardingTailedBubble setBounds:](v14, "setBounds:", x, y, width, height);
    -[CKSyndicationOnboardingTailedBubble setAppName:](v14, "setAppName:", a4);
    if (-[CKSyndicationOnboardingTailedBubble appName](v14, "appName"))
    {
      -[CKPinnedConversationTailedActivityItemView setOriginationDirection:](v14, "setOriginationDirection:", 1);
      if (-[CKSyndicationOnboardingTailedBubble appName](v14, "appName") == 1)
        -[CKPinnedConversationTailedActivityItemView setOriginationHorizontalDirection:](v14, "setOriginationHorizontalDirection:", 1);
    }
    else
    {
      -[CKPinnedConversationTailedActivityItemView setOriginationDirection:](v14, "setOriginationDirection:", 0);
    }
  }

  return v14;
}

- (void)layoutSubviews
{
  objc_super v3;
  CGRect v4;

  v3.receiver = self;
  v3.super_class = (Class)CKSyndicationOnboardingTailedBubble;
  -[CKPinnedConversationTailedActivityItemView layoutSubviews](&v3, sel_layoutSubviews);
  if (-[CKSyndicationOnboardingTailedBubble appName](self, "appName") == 1)
  {
    -[CKSyndicationOnboardingTailedBubble bounds](self, "bounds");
    -[CKPinnedConversationTailedActivityItemView setPreferredTailAttachmentPointXCoordinate:](self, "setPreferredTailAttachmentPointXCoordinate:", CGRectGetMaxX(v4));
  }
}

- (double)balloonTailHeight
{
  return 7.5;
}

- (double)pillCornerRadius
{
  return 10.0;
}

- (CGRect)pillRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[CKSyndicationOnboardingTailedBubble balloonTailHeight](self, "balloonTailHeight");
  v4 = v3;
  -[CKSyndicationOnboardingTailedBubble bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = -[CKSyndicationOnboardingTailedBubble appName](self, "appName");
  v14 = 0.0;
  if (v13)
    v14 = v4;
  v15 = v8 + v14;
  v16 = v12 - v4;
  v17 = v6;
  v18 = v10;
  result.size.height = v16;
  result.size.width = v18;
  result.origin.y = v15;
  result.origin.x = v17;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 155.0;
  v4 = 100.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (int64_t)appName
{
  return self->_appName;
}

- (void)setAppName:(int64_t)a3
{
  self->_appName = a3;
}

- (CGRect)bubbleFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_bubbleFrame.origin.x;
  y = self->_bubbleFrame.origin.y;
  width = self->_bubbleFrame.size.width;
  height = self->_bubbleFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setBubbleFrame:(CGRect)a3
{
  self->_bubbleFrame = a3;
}

- (NSAttributedString)bubbleText
{
  return self->_bubbleText;
}

- (void)setBubbleText:(id)a3
{
  objc_storeStrong((id *)&self->_bubbleText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bubbleText, 0);
}

@end
