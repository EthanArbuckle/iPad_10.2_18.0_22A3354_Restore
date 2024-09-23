@implementation CKVisionReplyListChatItem

- (UIEdgeInsets)transcriptTextAlignmentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0CEB4B0];
  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)contentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x1E0CEB4B0];
  v3 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (char)transcriptOrientation
{
  return 1;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (BOOL)displayDuringSend
{
  return 1;
}

- (int64_t)groupRowIndex
{
  return 0;
}

+ (double)navigationBarHeight
{
  if (navigationBarHeight_onceToken != -1)
    dispatch_once(&navigationBarHeight_onceToken, &__block_literal_global_265);
  return *(double *)&navigationBarHeight_navigationBarHeight;
}

void __48__CKVisionReplyListChatItem_navigationBarHeight__block_invoke()
{
  void *v0;
  uint64_t v1;
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CEA7B8]);
  objc_msgSend(v2, "navigationBar");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bounds");
  navigationBarHeight_navigationBarHeight = v1;

}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  unint64_t v5;
  void *v6;
  unint64_t v7;
  double v8;
  void *v9;
  void *v10;
  float v11;
  NSObject *v12;
  double v13;
  double v14;
  int v15;
  CKVisionReplyListChatItem *v16;
  __int16 v17;
  double v18;
  uint64_t v19;
  CGSize result;

  v19 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    a3 = (CGSize)*MEMORY[0x1E0CEB4B0];
    *(CGSize *)&a3.height = *(CGSize *)(MEMORY[0x1E0CEB4B0] + 16);
    *(_OWORD *)&a4->top = *MEMORY[0x1E0CEB4B0];
    *(CGSize *)&a4->bottom = *(CGSize *)&a3.height;
  }
  v5 = -[CKVisionReplyListChatItem groupRowIndex](self, "groupRowIndex", a3.width, a3.height);
  -[QuickReplyContent rows](self->_quickReplyContent, "rows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  v8 = 0.0;
  if (v5 < v7)
  {
    -[QuickReplyContent rowHeights](self->_quickReplyContent, "rowHeights");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "floatValue");
    v8 = v11;

  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v15 = 134218240;
      v16 = self;
      v17 = 2048;
      v18 = v8;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "[%p] Setting height to %f", (uint8_t *)&v15, 0x16u);
    }

  }
  v13 = 0.0;
  v14 = v8;
  result.height = v14;
  result.width = v13;
  return result;
}

- (_TtC7ChatKit17QuickReplyContent)quickReplyContent
{
  return self->_quickReplyContent;
}

- (void)setQuickReplyContent:(id)a3
{
  objc_storeStrong((id *)&self->_quickReplyContent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_quickReplyContent, 0);
}

@end
