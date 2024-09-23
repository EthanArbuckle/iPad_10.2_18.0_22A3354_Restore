@implementation CKPhotoAttachmentStatusChatItem

- (unint64_t)layoutType
{
  return 16;
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
  NSObject *v20;
  id v21;
  id v22;
  void *v23;
  double v24;
  _BYTE v25[24];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
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
  if (+[CKChatItemLayoutUtilities nextItemIsOriginatorWithRepliesForIndex:allDatasourceItems:](CKChatItemLayoutUtilities, "nextItemIsOriginatorWithRepliesForIndex:allDatasourceItems:", a4, v12))
  {
LABEL_5:
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "extraLargeTranscriptSpace");
LABEL_10:
    v17 = v16;

  }
  else
  {
    switch(objc_msgSend(v14, "layoutType"))
    {
      case 1:
      case 4:
      case 5:
      case 7:
      case 8:
      case 13:
      case 14:
      case 17:
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "mediumTranscriptSpace");
        goto LABEL_10;
      case 2:
      case 3:
      case 10:
      case 11:
      case 23:
      case 24:
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "largeTranscriptSpace");
        goto LABEL_10;
      case 6:
      case 18:
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "smallTranscriptSpace");
        goto LABEL_10;
      case 12:
        goto LABEL_5;
      default:
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            v21 = (id)objc_opt_class();
            *(_DWORD *)v25 = 138412546;
            *(_QWORD *)&v25[4] = v21;
            *(_WORD *)&v25[12] = 2112;
            *(_QWORD *)&v25[14] = objc_opt_class();
            v22 = *(id *)&v25[14];
            _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "CKChatItem_Layout: %@ shouldn't follow %@", v25, 0x16u);

          }
        }
        +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", *(_OWORD *)v25, *(_QWORD *)&v25[16], v26);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "smallTranscriptSpace");
        v17 = v24;

        break;
    }
  }
  +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:](CKChatItemLayoutUtilities, "transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:", self, v14, v17, 0.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
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

  -[CKPhotoAttachmentStatusChatItem _photoAttachmentStatusChatItem](self, "_photoAttachmentStatusChatItem");
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
  v5.super_class = (Class)CKPhotoAttachmentStatusChatItem;
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
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL4 v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  __CFString *v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  __CFString *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  __CFString *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v78;
  void *v79;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  _QWORD v86[3];
  _QWORD v87[3];
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD v91[5];

  v91[3] = *MEMORY[0x1E0C80C00];
  -[CKPhotoAttachmentStatusChatItem _photoAttachmentStatusChatItem](self, "_photoAttachmentStatusChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfPhotos");
  v4 = objc_msgSend(v2, "numberOfVideos");
  v82 = v2;
  v5 = objc_msgSend(v2, "numberOfSavedAssets");
  if (v4 + v3)
  {
    if (v4)
      v6 = 1;
    else
      v6 = v3 == 0;
    v7 = 1;
    if (v3 != 0 || v4 == 0)
      v7 = 2;
    if (!v6)
      v7 = 0;
    v8 = off_1E2756810[v7];
    v9 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", v8, &stru_1E276D870, CFSTR("ChatKit"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v11, v4 + v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "userInterfaceLayoutDirection");

    if (v14 == 1)
      v15 = CFSTR("\u200F");
    else
      v15 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v15, "stringByAppendingString:", v12);
    v16 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CKFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("PHOTO_ATTACHMENT_STATUS_ITEMS_FALLBACK_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v16 = objc_claimAutoreleasedReturnValue();
  }

  v84 = (void *)v16;
  if (v5)
  {
    if (v4)
      v17 = 1;
    else
      v17 = v3 == 0;
    v18 = 1;
    if (v3 != 0 || v4 == 0)
      v18 = 2;
    if (!v17)
      v18 = 0;
    if (v4 + v3 == v5)
    {
      if (v18 == 2)
      {
        CKFrameworkBundle();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        v21 = CFSTR("PHOTO_ATTACHMENT_STATUS_ALL_ITEMS_SAVED");
      }
      else if (v18 == 1)
      {
        CKFrameworkBundle();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        v21 = CFSTR("PHOTO_ATTACHMENT_STATUS_ALL_VIDEOS_SAVED");
      }
      else
      {
        CKFrameworkBundle();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        v21 = CFSTR("PHOTO_ATTACHMENT_STATUS_ALL_PHOTOS_SAVED");
      }
      objc_msgSend(v19, "localizedStringForKey:value:table:", v21, &stru_1E276D870, CFSTR("ChatKit"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = off_1E2756828[v18];
      v30 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "localizedStringForKey:value:table:", v29, &stru_1E276D870, CFSTR("ChatKit"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringWithFormat:", v32, v5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "userInterfaceLayoutDirection");

      if (v34 == 1)
        v35 = CFSTR("\u200F");
      else
        v35 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v35, "stringByAppendingString:", v20);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }

    v36 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("PHOTO_ATTACHMENT_STATUS_HAS_SAVED_TITLE_FORMAT"), &stru_1E276D870, CFSTR("ChatKit"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "stringWithFormat:", v38, v16, v25);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "userInterfaceLayoutDirection");

    if (v41 == 1)
      v42 = CFSTR("\u200F");
    else
      v42 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v42, "stringByAppendingString:", v39);
    v83 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    CKFrameworkBundle();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("PHOTO_ATTACHMENT_STATUS_TITLE_FORMAT"), &stru_1E276D870, CFSTR("ChatKit"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", v24, v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "userInterfaceLayoutDirection");

    if (v27 == 1)
      v28 = CFSTR("\u200F");
    else
      v28 = CFSTR("\u200E");
    -[__CFString stringByAppendingString:](v28, "stringByAppendingString:", v25);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0DC1290], "defaultParagraphStyle");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = (void *)objc_msgSend(v43, "mutableCopy");

  objc_msgSend(v44, "setAlignment:", 2 * (-[CKPhotoAttachmentStatusChatItem transcriptOrientation](self, "transcriptOrientation") != 0));
  objc_msgSend(v44, "setLineBreakMode:", 2);
  v88 = *MEMORY[0x1E0DC1138];
  v78 = v88;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "transcriptRegularFont");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = v46;
  v89 = *MEMORY[0x1E0DC1140];
  v47 = v89;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "theme");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "transcriptTextColor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = *MEMORY[0x1E0DC1178];
  v51 = v90;
  v91[1] = v50;
  v91[2] = v44;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, &v88, 3);
  v52 = objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "transcriptMessageStatusFont");
  v54 = objc_claimAutoreleasedReturnValue();

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "theme");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "attachmentBalloonActionColor");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = objc_alloc(MEMORY[0x1E0CB3778]);
  v81 = (void *)v52;
  v59 = v52;
  v60 = v44;
  v61 = (void *)objc_msgSend(v58, "initWithString:attributes:", v83, v59);
  objc_msgSend(v61, "string");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(v62, "rangeOfString:", v84);
  v65 = v64;

  v86[0] = v78;
  v86[1] = v47;
  v79 = (void *)v54;
  v87[0] = v54;
  v87[1] = v57;
  v86[2] = v51;
  v87[2] = v44;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 3);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  if (v63 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v61, "setAttributes:range:", v66, v63, v65);
  objc_msgSend(v61, "string");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_msgSend(v67, "rangeOfString:", CFSTR("__IMAGE_PLACEHOLDER__"));
  v70 = v69;

  if (v68 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v71 = (void *)MEMORY[0x1E0CEA650];
    v85 = v57;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v85, 1);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "configurationWithPaletteColors:", v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("square.grid.2x2.fill"), v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttachment:attributes:", v75, v66);
    objc_msgSend(v61, "replaceCharactersInRange:withAttributedString:", v68, v70, v76);

  }
  return v61;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  __int128 v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (a4)
  {
    v7 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
    *(_OWORD *)&a4->top = *MEMORY[0x1E0CEB4B0];
    *(_OWORD *)&a4->bottom = v7;
  }
  -[CKChatItem transcriptText](self, "transcriptText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKChatItem transcriptTraitCollection](self, "transcriptTraitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "displayScale");
  +[CKTranscriptActionButtonCell sizeThatFits:attributedText:displayScale:](CKTranscriptActionButtonCell, "sizeThatFits:attributedText:displayScale:", v8, width, height, v10);
  v12 = v11;
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

@end
