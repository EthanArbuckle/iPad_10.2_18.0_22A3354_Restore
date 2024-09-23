@implementation CKTypingChatItem

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

- (char)transcriptOrientation
{
  if (-[CKChatItem isFromMe](self, "isFromMe"))
    return 2;
  else
    return 0;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (BOOL)displayDuringSend
{
  return 1;
}

- (BOOL)wantsDrawerLayout
{
  return 1;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  __int128 v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (a4)
  {
    v7 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
    *(_OWORD *)&a4->top = *MEMORY[0x1E0CEB4B0];
    *(_OWORD *)&a4->bottom = v7;
  }
  +[CKTypingIndicatorLayer defaultSize](CKTypingIndicatorLayer, "defaultSize");
  v9 = v8;
  v11 = v10;
  +[CKTypingIndicatorLayer largeBubbleFrame](CKTypingIndicatorLayer, "largeBubbleFrame");
  v13 = v9 - v12;
  v15 = v11 - v14;
  -[CKTypingChatItem indicatorLayer](self, "indicatorLayer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;

  v21 = fmin(fmax(v13 + v18, v9), width);
  v22 = fmin(fmax(v15 + v20, v11), height);
  result.height = v22;
  result.width = v21;
  return result;
}

- (CKTypingIndicatorLayerProtocol)indicatorLayer
{
  return (CKTypingIndicatorLayerProtocol *)objc_alloc_init(CKTypingIndicatorLayer);
}

- (unint64_t)layoutType
{
  return 1;
}

@end
