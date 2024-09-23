@implementation CKStampChatItem

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
  objc_msgSend(v2, "stampTranscriptInsets");
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
  return 1;
}

- (Class)cellClass
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKStampChatItem.m"), 25, CFSTR("Subclasses must implement cellClass"));

  return 0;
}

- (BOOL)displayDuringSend
{
  return 1;
}

- (unint64_t)layoutType
{
  return 3;
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
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  void *v26;
  NSObject *v28;
  id v29;
  id v30;
  _BYTE v31[24];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
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

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "mediumTranscriptSpace");
  v20 = v19;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "largeTranscriptSpace");
  v23 = v22;

  if (v14)
  {
    switch(objc_msgSend(v14, "layoutType"))
    {
      case 1:
      case 3:
      case 4:
      case 5:
      case 8:
      case 12:
      case 14:
        break;
      case 2:
      case 7:
      case 10:
      case 11:
      case 18:
      case 23:
      case 24:
        goto LABEL_6;
      case 9:
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "balloonBalloonTranscriptSpace:", objc_msgSend(v14, "contiguousType"));
        goto LABEL_8;
      case 17:
        v23 = v20;
        break;
      default:
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            v29 = (id)objc_opt_class();
            *(_DWORD *)v31 = 138412546;
            *(_QWORD *)&v31[4] = v29;
            *(_WORD *)&v31[12] = 2112;
            *(_QWORD *)&v31[14] = objc_opt_class();
            v30 = *(id *)&v31[14];
            _os_log_impl(&dword_18DFCD000, v28, OS_LOG_TYPE_INFO, "CKChatItem_Layout: %@ shouldn't follow %@", v31, 0x16u);

          }
        }
LABEL_6:
        v23 = v17;
        break;
    }
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "topTranscriptSpace");
LABEL_8:
    v23 = v25;

  }
  +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:](CKChatItemLayoutUtilities, "transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:", self, v14, v23, 0.0, *(_OWORD *)v31, *(_QWORD *)&v31[16], v32);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

@end
