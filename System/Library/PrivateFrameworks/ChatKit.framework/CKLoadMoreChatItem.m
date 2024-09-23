@implementation CKLoadMoreChatItem

- (unint64_t)layoutType
{
  return 9;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", a3, a4, a5, a6, a7.width, a7.height);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topTranscriptSpace");
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0CEA1F8], "fixedSpacing:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA1C8], "spacingForLeading:top:trailing:bottom:", 0, v10, 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

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

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  void *v4;
  int v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  if (a4)
  {
    a3 = (CGSize)*MEMORY[0x1E0CEB4B0];
    *(CGSize *)&a3.height = *(CGSize *)(MEMORY[0x1E0CEB4B0] + 16);
    *(_OWORD *)&a4->top = *MEMORY[0x1E0CEB4B0];
    *(CGSize *)&a4->bottom = *(CGSize *)&a3.height;
  }
  +[CKPrintController sharedInstance](CKPrintController, "sharedInstance", a3.width, a3.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPrinting");

  if (v5)
  {
    v6 = *MEMORY[0x1E0C9D820];
    v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  else
  {
    +[CKTranscriptHeaderCell defaultCellHeight](CKTranscriptHeaderCell, "defaultCellHeight");
    v7 = v8;
    v6 = 0.0;
  }
  result.height = v7;
  result.width = v6;
  return result;
}

@end
