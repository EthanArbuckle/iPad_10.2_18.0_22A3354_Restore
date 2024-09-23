@implementation CKMomentShareStatusChatItem

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
  objc_msgSend(v2, "senderTranscriptInsets");
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
  void *v2;
  int v3;

  -[CKMomentShareStatusChatItem _statusChatItem](self, "_statusChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFromMe");

  if (v3)
    return 2;
  else
    return 0;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (BOOL)wantsDrawerLayout
{
  void *v2;
  int v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKMomentShareStatusChatItem;
  if (-[CKChatItem wantsDrawerLayout](&v5, sel_wantsDrawerLayout))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "timestampsPushBalloons") ^ 1;

  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (id)loadTranscriptText
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  __CFString *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  id v53;
  _QWORD v54[3];
  _QWORD v55[3];
  _QWORD v56[3];
  _QWORD v57[5];

  v57[3] = *MEMORY[0x1E0C80C00];
  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("ATTRIBUTION_TEXT_PHOTOS_EXTENSION"), &stru_1E276D870, CFSTR("ChatKit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMomentShareStatusChatItem _statusChatItem](self, "_statusChatItem");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "activityTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0x1E0CEA000uLL;
  v51 = v4;
  if (v5)
  {
LABEL_11:
    v18 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("MOMENT_SHARE_STATUS_TITLE_FORMAT"), &stru_1E276D870, CFSTR("ChatKit"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v20, v4, v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(v6 + 760), "sharedApplication");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "userInterfaceLayoutDirection");

    if (v23 == 1)
      v24 = CFSTR("\u200F");
    else
      v24 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v24, "stringByAppendingString:", v21);
    v53 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
  objc_msgSend(v52, "expirationDate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (_TitleForExpirationDate_predicate != -1)
  {
    dispatch_once(&_TitleForExpirationDate_predicate, &__block_literal_global_190);
    if (v8)
      goto LABEL_4;
LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  if (!v7)
    goto LABEL_9;
LABEL_4:
  objc_msgSend((id)_TitleForExpirationDate_dateFormatter, "stringFromDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  CKFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("MOMENT_SHARE_EXPIRATION_DATE_PREFIX_FORMAT"), &stru_1E276D870, CFSTR("ChatKit"));
  v12 = v4;
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v12;
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceLayoutDirection");

  if (v16 == 1)
    v17 = CFSTR("\u200F");
  else
    v17 = CFSTR("\u200E");
  -[__CFString stringByAppendingString:](v17, "stringByAppendingString:", v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0x1E0CEA000;
LABEL_10:

  if (v5)
    goto LABEL_11;
  v53 = v4;
LABEL_15:
  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v25, "mutableCopy");

  objc_msgSend(v26, "setAlignment:", 2 * (-[CKMomentShareStatusChatItem transcriptOrientation](self, "transcriptOrientation") != 0));
  objc_msgSend(v26, "setLineBreakMode:", 2);
  v27 = *MEMORY[0x1E0DC1138];
  v56[0] = *MEMORY[0x1E0DC1138];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "transcriptRegularFont");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v57[0] = v29;
  v30 = *MEMORY[0x1E0DC1140];
  v56[1] = *MEMORY[0x1E0DC1140];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "theme");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "transcriptTextColor");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = *MEMORY[0x1E0DC1178];
  v56[2] = *MEMORY[0x1E0DC1178];
  v57[1] = v33;
  v57[2] = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 3);
  v35 = objc_claimAutoreleasedReturnValue();

  v36 = v53;
  v50 = (void *)v35;
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v53, v35);
  objc_msgSend(v37, "string");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v51;
  v40 = objc_msgSend(v38, "rangeOfString:", v51);
  v49 = v41;

  if (v40 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v54[0] = v27;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "transcriptMessageStatusFont");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v43;
    v54[1] = v30;
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "theme");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "transcriptTextColor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v54[2] = v34;
    v55[1] = v46;
    v55[2] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 3);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = v53;
    objc_msgSend(v37, "setAttributes:range:", v47, v40, v49);

    v39 = v51;
  }

  return v37;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (a4)
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transcriptBoldTextAlignmentInsets");
    a4->top = v9;
    a4->left = v10;
    a4->bottom = v11;
    a4->right = v12;

  }
  -[CKChatItem transcriptText](self, "transcriptText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatItem transcriptTraitCollection](self, "transcriptTraitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayScale");
  +[CKTranscriptMomentShareLabelCell sizeThatFits:attributedText:displayScale:](CKTranscriptMomentShareLabelCell, "sizeThatFits:attributedText:displayScale:", v13, width, height, v15);
  v17 = v16;
  v19 = v18;

  v20 = v17;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (unint64_t)layoutType
{
  return 5;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  unint64_t v18;
  void *v19;
  double v20;
  NSObject *v21;
  id v22;
  id v23;
  void *v24;
  _BYTE v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  v13 = a6;
  if (a4 < 1)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v12, "objectAtIndex:", a4 - 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "smallTranscriptSpace");
  v17 = v16;

  v18 = objc_msgSend(v14, "layoutType");
  if (v18 <= 0x12 && ((1 << v18) & 0x60002) != 0)
  {
    if (objc_msgSend(v14, "hasTail"))
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "balloonMaskTailSizeForTailShape:", 1);
      v17 = v17 + v20;

    }
  }
  else if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = (id)objc_opt_class();
      *(_DWORD *)v26 = 138543618;
      *(_QWORD *)&v26[4] = v22;
      *(_WORD *)&v26[12] = 2114;
      *(_QWORD *)&v26[14] = objc_opt_class();
      v23 = *(id *)&v26[14];
      _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "CKChatItem_Layout: %{public}@ shouldn't follow %{public}@", v26, 0x16u);

    }
  }
  +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:](CKChatItemLayoutUtilities, "transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:", self, v14, v17, 0.0, *(_OWORD *)v26, *(_QWORD *)&v26[16], v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

@end
