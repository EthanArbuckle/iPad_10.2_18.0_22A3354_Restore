@implementation CKRichActionCarouselCountChatItem

- (UIEdgeInsets)contentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 16.0;
  v4 = -4.0;
  v5 = 16.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (id)loadTranscriptText
{
  CKRichActionCarouselCountChatItem *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_18E6C74EC();
  v4 = v3;

  return v4;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  CKRichActionCarouselCountChatItem *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = self;
  v7 = -[CKRichActionCarouselCountChatItem loadTranscriptText](v6, sel_loadTranscriptText);
  objc_msgSend(v7, sel_boundingRectWithSize_options_context_, 3, 0, width, height);
  v9 = v8;

  v10 = 0.0;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (int64_t)selectedRichCardIndex
{
  return sub_18E6C7C48(self, (uint64_t)a2, (SEL *)&selRef_selectedIndex);
}

- (int64_t)totalCount
{
  return sub_18E6C7C48(self, (uint64_t)a2, (SEL *)&selRef_totalCount);
}

- (CKRichActionCarouselCountChatItem)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RichActionCarouselCountChatItem();
  return -[CKRichActionCarouselCountChatItem init](&v3, sel_init);
}

- (CKRichActionCarouselCountChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  return (CKRichActionCarouselCountChatItem *)sub_18E6C7EDC(self, a4, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithIMChatItem_maxWidth_);
}

- (CKRichActionCarouselCountChatItem)initWithNotification:(id)a3 maxWidth:(double)a4
{
  return (CKRichActionCarouselCountChatItem *)sub_18E6C7EDC(self, a4, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithNotification_maxWidth_);
}

@end
