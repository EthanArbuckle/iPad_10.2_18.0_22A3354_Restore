@implementation CKMessagePartHighlightChatItem

- (CKMessagePartHighlightChatItem)initWithIMChatItem:(id)a3 maxWidth:(double)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKMessagePartHighlightChatItem;
  return -[CKChatItem initWithIMChatItem:maxWidth:](&v5, sel_initWithIMChatItem_maxWidth_, a3, a4);
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (Class)balloonViewClass
{
  return (Class)objc_opt_class();
}

- (id)guid
{
  void *v2;
  void *v3;

  -[CKMessagePartHighlightChatItem messagePartHighlightChatItem](self, "messagePartHighlightChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "guid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)associatedChatItemGUID
{
  void *v2;
  void *v3;

  -[CKMessagePartHighlightChatItem messagePartHighlightChatItem](self, "messagePartHighlightChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "highlightedMessagePartGUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)parentMessageIsFromMe
{
  void *v2;
  char v3;

  -[CKMessagePartHighlightChatItem messagePartHighlightChatItem](self, "messagePartHighlightChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "highlightedMessageIsFromMe");

  return v3;
}

- (BOOL)failed
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[CKChatItem isFromMe](self, "isFromMe");
  if (v3)
  {
    -[CKMessagePartHighlightChatItem messagePartHighlightChatItem](self, "messagePartHighlightChatItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "failed");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (IMAssociatedMessageGeometryDescriptor)geometryDescriptor
{
  void *v4;
  IMAssociatedMessageGeometryDescriptor *result;
  void *v6;

  -[CKMessagePartHighlightChatItem messagePartHighlightChatItem](self, "messagePartHighlightChatItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "geometryDescriptor");
    v4 = v6;
  }
  else
  {
    retstr->rotation = 0.0;
    *(_OWORD *)&retstr->parentPreviewWidth = 0u;
    *(_OWORD *)&retstr->yScalar = 0u;
    *(_OWORD *)&retstr->layoutIntent = 0u;
  }

  return result;
}

- (id)time
{
  void *v2;
  void *v3;

  -[CKMessagePartHighlightChatItem messagePartHighlightChatItem](self, "messagePartHighlightChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "time");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sender
{
  void *v2;
  void *v3;

  -[CKMessagePartHighlightChatItem messagePartHighlightChatItem](self, "messagePartHighlightChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sender");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (_NSRange)associatedMessageRange
{
  void *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  -[CKMessagePartHighlightChatItem messagePartHighlightChatItem](self, "messagePartHighlightChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "highlightedMessagePartRange");
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (BOOL)wantsDrawerLayout
{
  return 1;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", a4, a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "messageHighlightTranscriptBalloonSize");
  v6 = v5;
  v8 = v7;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "messageHighlightTranscriptBalloonBorderWidth");
  v11 = v8 + v10 * 2.0;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "messageHighlightTranscriptBalloonBorderWidth");
  v14 = v6 + v13 * 2.0;

  v15 = v14;
  v16 = v11;
  result.height = v16;
  result.width = v15;
  return result;
}

- (char)balloonOrientation
{
  return -[CKMessagePartHighlightChatItem parentMessageIsFromMe](self, "parentMessageIsFromMe");
}

- (char)transcriptOrientation
{
  if (-[CKMessagePartHighlightChatItem parentMessageIsFromMe](self, "parentMessageIsFromMe"))
    return 2;
  else
    return 0;
}

- (UIEdgeInsets)contentInsets
{
  void *v2;
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
  double v13;
  double v14;
  UIEdgeInsets result;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "balloonTranscriptInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (NSString)timestampString
{
  return self->_timestampString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestampString, 0);
}

@end
