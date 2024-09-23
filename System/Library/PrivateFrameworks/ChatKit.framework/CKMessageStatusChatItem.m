@implementation CKMessageStatusChatItem

+ (UIButton)sizingButton
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)_sizingButton;
  if (!_sizingButton)
  {
    +[CKTranscriptStatusCell statusButton](CKTranscriptStatusCell, "statusButton");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_sizingButton;
    _sizingButton = v3;

    v2 = (void *)_sizingButton;
  }
  return (UIButton *)v2;
}

+ (void)setSizingButton:(id)a3
{
  objc_storeStrong((id *)&_sizingButton, a3);
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
  -[CKMessageStatusChatItem buttonType](self, "buttonType");
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

- (void)unloadTranscriptText
{
  NSAttributedString *transcriptButtonText;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKMessageStatusChatItem;
  -[CKChatItem unloadTranscriptText](&v4, sel_unloadTranscriptText);
  transcriptButtonText = self->_transcriptButtonText;
  self->_transcriptButtonText = 0;

}

- (void)unloadSize
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKMessageStatusChatItem;
  -[CKChatItem unloadSize](&v3, sel_unloadSize);
  self->_buttonSizeLoaded = 0;
  self->_labelSizeLoaded = 0;
}

- (UIEdgeInsets)transcriptTextAlignmentInsets
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  UIEdgeInsets result;

  v19.receiver = self;
  v19.super_class = (Class)CKMessageStatusChatItem;
  -[CKChatItem transcriptTextAlignmentInsets](&v19, sel_transcriptTextAlignmentInsets);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKMessageStatusChatItem buttonTextAlignmentInsets](self, "buttonTextAlignmentInsets");
  v12 = fmax(v4, v11);
  v14 = fmax(v6, v13);
  v16 = fmax(v8, v15);
  v18 = fmax(v10, v17);
  result.right = v18;
  result.bottom = v16;
  result.left = v14;
  result.top = v12;
  return result;
}

- (BOOL)wantsDrawerLayout
{
  char v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKMessageStatusChatItem;
  if (-[CKChatItem wantsDrawerLayout](&v5, sel_wantsDrawerLayout))
    return 1;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "timestampsPushBalloons");

  return v2;
}

- (CGSize)size
{
  CKMessageStatusChatItem *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGSize result;

  v13.receiver = self;
  v13.super_class = (Class)CKMessageStatusChatItem;
  -[CKChatItem size](&v13, sel_size);
  v3 = self;
  -[CKMessageStatusChatItem buttonSize](v3, "buttonSize");
  v5 = v4;
  -[CKMessageStatusChatItem labelSize](v3, "labelSize");
  if (v5 < v6)
    v5 = v6;
  -[CKMessageStatusChatItem buttonSize](v3, "buttonSize");
  v8 = v7;
  -[CKMessageStatusChatItem labelSize](v3, "labelSize");
  v10 = v9;

  v11 = v8 + v10;
  v12 = v5;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)loadTranscriptText
{
  uint64_t v3;
  int64_t v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  __CFString *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  const __CFString *v54;
  unint64_t v55;
  void *v56;
  void *v57;
  const __CFString *v58;
  int v59;
  void *v60;
  void *v61;
  const __CFString *v62;
  int v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  __CFString *v68;
  int v69;
  void *v70;
  void *v71;
  void *v72;
  const __CFString *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  __CFString *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  uint64_t v87;
  __CFString *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  __CFString *v93;
  void *v94;
  void *v95;
  void *v96;
  uint64_t v97;
  __CFString *v98;
  void *v99;
  uint64_t v101;
  void *v102;
  void *v103;
  unsigned __int8 v104;
  unsigned __int8 v105;
  unsigned __int8 v106;

  v3 = -[CKMessageStatusChatItem transcriptOrientation](self, "transcriptOrientation");
  v4 = -[CKMessageStatusChatItem statusType](self, "statusType");
  v5 = 0;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  switch(v4)
  {
    case 0:
      if (!-[CKMessageStatusChatItem expireStatusType](self, "expireStatusType"))
      {
        CKFrameworkBundle();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v13 = CFSTR("MESSAGE_STATUS_NOSTATUS");
        goto LABEL_39;
      }
      v6 = 0;
      v5 = 0;
      v7 = 0;
      v8 = 0;
      goto LABEL_86;
    case 1:
      -[CKChatItem IMChatItem](self, "IMChatItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isStewie");

      CKFrameworkBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v10)
      {
        v13 = CFSTR("MESSAGE_STATUS_SENT_VIA_STEWIE");
        v14 = CFSTR("ChatKit-SYDROB_FEATURES");
      }
      else
      {
        v13 = CFSTR("MESSAGE_STATUS_DELIVERED");
        v14 = CFSTR("ChatKit");
      }
      goto LABEL_40;
    case 2:
      CKFrameworkBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("MESSAGE_STATUS_DELIVERED_QUIETLY");
      goto LABEL_39;
    case 3:
      CKFrameworkBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("MESSAGE_STATUS_NOTIFIED_RECIPIENT");
      goto LABEL_39;
    case 4:
      -[CKMessageStatusChatItem time](self, "time");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageStatusChatItem now](self, "now");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        CKFrameworkBundle();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v52;
        v54 = CFSTR("MESSAGE_STATUS_READ");
        goto LABEL_44;
      }
      objc_msgSend(MEMORY[0x1E0C99D48], "__ck_currentCalendar");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "__ck_unitOfDisambiguityFromDate:toDate:", v15, v16);

      switch(v18)
      {
        case 4:
LABEL_12:
          +[CKMessageStatusChatItem thePastDateFormatter](CKMessageStatusChatItem, "thePastDateFormatter");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "stringFromDate:", v15);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (void *)MEMORY[0x1E0CB3940];
          CKFrameworkBundle();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v21;
          v23 = CFSTR("MESSAGE_STATUS_READ_DATE");
          goto LABEL_54;
        case 16:
          +[CKMessageStatusChatItem thisWeekRelativeDateFormatter](CKMessageStatusChatItem, "thisWeekRelativeDateFormatter");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v106 = 0;
          objc_msgSend(v19, "stringFromDate:isRelative:", v15, &v106);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v106;
          v60 = (void *)MEMORY[0x1E0CB3940];
          CKFrameworkBundle();
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          if (v59)
            v62 = CFSTR("MESSAGE_STATUS_READ_RELATIVE_DAY");
          else
            v62 = CFSTR("MESSAGE_STATUS_READ_DAY");
          goto LABEL_73;
        case 8:
          goto LABEL_12;
      }
      +[CKMessageStatusChatItem todayDateFormatter](CKMessageStatusChatItem, "todayDateFormatter");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringFromDate:", v15);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      v23 = CFSTR("MESSAGE_STATUS_READ_TIME");
      goto LABEL_54;
    case 5:
      -[CKMessageStatusChatItem time](self, "time");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageStatusChatItem now](self, "now");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(MEMORY[0x1E0C99D48], "__ck_currentCalendar");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "__ck_unitOfDisambiguityFromDate:toDate:", v15, v16);

        switch(v25)
        {
          case 4:
LABEL_17:
            +[CKMessageStatusChatItem thePastDateFormatter](CKMessageStatusChatItem, "thePastDateFormatter");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "stringFromDate:", v15);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)MEMORY[0x1E0CB3940];
            CKFrameworkBundle();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v21;
            v23 = CFSTR("MESSAGE_STATUS_PLAYED_DATE");
            goto LABEL_54;
          case 16:
            +[CKMessageStatusChatItem thisWeekRelativeDateFormatter](CKMessageStatusChatItem, "thisWeekRelativeDateFormatter");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v105 = 0;
            objc_msgSend(v19, "stringFromDate:isRelative:", v15, &v105);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = v105;
            v60 = (void *)MEMORY[0x1E0CB3940];
            CKFrameworkBundle();
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            if (v63)
              v62 = CFSTR("MESSAGE_STATUS_PLAYED_RELATIVE_DAY");
            else
              v62 = CFSTR("MESSAGE_STATUS_PLAYED_DAY");
LABEL_73:
            objc_msgSend(v61, "localizedStringForKey:value:table:", v62, &stru_1E276D870, CFSTR("ChatKit"));
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "stringWithFormat:", v89, v7);
            v90 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            v92 = objc_msgSend(v91, "userInterfaceLayoutDirection");

            if (v92 == 1)
              v93 = CFSTR("\u200F");
            else
              v93 = CFSTR("\u200E");
            -[__CFString stringByAppendingString:](v93, "stringByAppendingString:", v90);
            v8 = (void *)objc_claimAutoreleasedReturnValue();

            break;
          case 8:
            goto LABEL_17;
          default:
            +[CKMessageStatusChatItem todayDateFormatter](CKMessageStatusChatItem, "todayDateFormatter");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "stringFromDate:", v15);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = (void *)MEMORY[0x1E0CB3940];
            CKFrameworkBundle();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v21;
            v23 = CFSTR("MESSAGE_STATUS_PLAYED_TIME");
LABEL_54:
            objc_msgSend(v21, "localizedStringForKey:value:table:", v23, &stru_1E276D870, CFSTR("ChatKit"));
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "stringWithFormat:", v64, v7);
            v65 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            v67 = objc_msgSend(v66, "userInterfaceLayoutDirection");

            if (v67 == 1)
              v68 = CFSTR("\u200F");
            else
              v68 = CFSTR("\u200E");
            -[__CFString stringByAppendingString:](v68, "stringByAppendingString:", v65);
            v8 = (void *)objc_claimAutoreleasedReturnValue();

            break;
        }

      }
      else
      {
        CKFrameworkBundle();
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = v52;
        v54 = CFSTR("MESSAGE_STATUS_PLAYED");
LABEL_44:
        objc_msgSend(v52, "localizedStringForKey:value:table:", v54, &stru_1E276D870, CFSTR("ChatKit"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = 0;
      }
      goto LABEL_84;
    case 6:
      -[CKMessageStatusChatItem time](self, "time");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v26;
      if (!v26)
      {
        v55 = -[CKMessageStatusChatItem count](self, "count");
        if (v55 == 1)
        {
          CKFrameworkBundle();
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = v56;
          v58 = CFSTR("MESSAGE_STATUS_SAVED_GROUP_ONE");
        }
        else
        {
          if (v55)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v55);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v81 = (void *)MEMORY[0x1E0CB3940];
            CKFrameworkBundle();
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "localizedStringForKey:value:table:", CFSTR("MESSAGE_STATUS_SAVED_GROUP_MULTIPLE"), &stru_1E276D870, CFSTR("ChatKit"));
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "__ck_localizedString");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "stringWithFormat:", v83, v84);
            v85 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            v87 = objc_msgSend(v86, "userInterfaceLayoutDirection");

            if (v87 == 1)
              v88 = CFSTR("\u200F");
            else
              v88 = CFSTR("\u200E");
            -[__CFString stringByAppendingString:](v88, "stringByAppendingString:", v85);
            v8 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_70;
          }
          CKFrameworkBundle();
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = v56;
          v58 = CFSTR("MESSAGE_STATUS_SAVED");
        }
        objc_msgSend(v56, "localizedStringForKey:value:table:", v58, &stru_1E276D870, CFSTR("ChatKit"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_70:

        v7 = 0;
        goto LABEL_85;
      }
      v27 = v26;
      -[CKMessageStatusChatItem now](self, "now");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D48], "__ck_currentCalendar");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "__ck_unitOfDisambiguityFromDate:toDate:", v27, v28);

      switch(v30)
      {
        case 4:
          goto LABEL_22;
        case 16:
          +[CKMessageStatusChatItem thisWeekRelativeDateFormatter](CKMessageStatusChatItem, "thisWeekRelativeDateFormatter");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = 0;
          v16 = v27;
          objc_msgSend(v38, "stringFromDate:isRelative:", v27, &v104);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = v104;
          v70 = (void *)MEMORY[0x1E0CB3940];
          CKFrameworkBundle();
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          v72 = v71;
          if (v69)
            v73 = CFSTR("MESSAGE_STATUS_SAVED_RELATIVE_DAY");
          else
            v73 = CFSTR("MESSAGE_STATUS_SAVED_DAY");
          objc_msgSend(v71, "localizedStringForKey:value:table:", v73, &stru_1E276D870, CFSTR("ChatKit"));
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "stringWithFormat:", v94, v7);
          v95 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          v97 = objc_msgSend(v96, "userInterfaceLayoutDirection");

          if (v97 == 1)
            v98 = CFSTR("\u200F");
          else
            v98 = CFSTR("\u200E");
          -[__CFString stringByAppendingString:](v98, "stringByAppendingString:", v95);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          break;
        case 8:
LABEL_22:
          +[CKMessageStatusChatItem thePastDateFormatter](CKMessageStatusChatItem, "thePastDateFormatter");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "stringFromDate:", v27);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)MEMORY[0x1E0CB3940];
          CKFrameworkBundle();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("MESSAGE_STATUS_SAVED_DATE"), &stru_1E276D870, CFSTR("ChatKit"));
          v34 = v28;
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "stringWithFormat:", v35, v7);
          v102 = v15;
          v36 = v27;
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = v34;
          v38 = v31;

          objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "userInterfaceLayoutDirection");

          if (v40 == 1)
            v41 = CFSTR("\u200F");
          else
            v41 = CFSTR("\u200E");
          -[__CFString stringByAppendingString:](v41, "stringByAppendingString:", v37);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = v36;
          v15 = v102;
          break;
        default:
          +[CKMessageStatusChatItem todayDateFormatter](CKMessageStatusChatItem, "todayDateFormatter");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "stringFromDate:", v27);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = (void *)MEMORY[0x1E0CB3940];
          CKFrameworkBundle();
          v16 = v27;
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "localizedStringForKey:value:table:", CFSTR("MESSAGE_STATUS_SAVED_TIME"), &stru_1E276D870, CFSTR("ChatKit"));
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "stringWithFormat:", v76, v7);
          v103 = v28;
          v77 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          v79 = objc_msgSend(v78, "userInterfaceLayoutDirection");

          if (v79 == 1)
            v80 = CFSTR("\u200F");
          else
            v80 = CFSTR("\u200E");
          -[__CFString stringByAppendingString:](v80, "stringByAppendingString:", v77);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = v103;
          break;
      }

LABEL_84:
LABEL_85:

      v6 = 0;
      v5 = 0;
LABEL_86:
      LOBYTE(v101) = v6;
      -[CKMessageStatusChatItem _styledStatusTextWithStatusText:orientation:dateSubText:buttonSubText:errorSubText:overrideTextColor:shouldReplaceWarningIcon:](self, "_styledStatusTextWithStatusText:orientation:dateSubText:buttonSubText:errorSubText:overrideTextColor:shouldReplaceWarningIcon:", v8, v3, v7, 0, 0, v5, v101);
      v99 = (void *)objc_claimAutoreleasedReturnValue();

      return v99;
    case 7:
      CKFrameworkBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("MESSAGE_STATUS_SENTASTEXTMESSAGE");
      goto LABEL_39;
    case 8:
      CKFrameworkBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("MESSAGE_STATUS_SENTTOEMAIL");
      goto LABEL_39;
    case 9:
      CKFrameworkBundle();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("MESSAGE_STATUS_NOTDELIVERED"), &stru_1E276D870, CFSTR("ChatKit"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (CKShowInternalErrors())
      {
        -[CKChatItem IMChatItem](self, "IMChatItem");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "errorText");
        v44 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v44;
      }
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "theme");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "statusFailureTextColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = 0;
      goto LABEL_41;
    case 10:
      CKFrameworkBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("MESSAGE_STATUS_RAISETOLISTEN");
      goto LABEL_39;
    case 11:
      CKFrameworkBundle();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = CFSTR("MESSAGE_STATUS_RAISETOTALK");
LABEL_39:
      v14 = CFSTR("ChatKit");
LABEL_40:
      objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_1E276D870, v14);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = 0;
      v5 = 0;
LABEL_41:
      v7 = 0;
      goto LABEL_86;
    case 12:
    case 13:
    case 14:
      goto LABEL_86;
    case 15:
      CKFrameworkBundle();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "localizedStringForKey:value:table:", CFSTR("HAWKING_MESSAGE_STATUS_BLACKHOLED"), &stru_1E276D870, CFSTR("ChatKit"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (CKShowInternalErrors())
      {
        -[CKChatItem IMChatItem](self, "IMChatItem");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "errorText");
        v49 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v49;
      }
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "theme");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "statusTextColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = 0;
      v6 = 1;
      goto LABEL_86;
    default:
      v7 = 0;
      v8 = 0;
      goto LABEL_86;
  }
}

- (id)_styledStatusTextWithStatusText:(id)a3 orientation:(char)a4 dateSubText:(id)a5 buttonSubText:(id)a6 errorSubText:(id)a7 overrideTextColor:(id)a8 shouldReplaceWarningIcon:(BOOL)a9
{
  int v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  id v71;
  id v72;

  v13 = a4;
  v14 = a3;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v13)
    objc_msgSend(v19, "rightStatusTranscriptTextAttributes");
  else
    objc_msgSend(v19, "leftStatusTranscriptTextAttributes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v22 = (void *)objc_msgSend(v21, "mutableCopy");
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0DC1140]);
    v23 = objc_msgSend(v22, "copy");

    v21 = (void *)v23;
  }
  if (v14)
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v14, v21);
    v25 = v24;
    v72 = v15;
    if (v15)
    {
      if (v24)
      {
        objc_msgSend(v24, "string");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "rangeOfString:", v15);
        v29 = v28;

        if (v27 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v68 = *MEMORY[0x1E0DC1138];
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "transcriptMessageStatusDateFont");
          v31 = v14;
          v32 = v17;
          v33 = v16;
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addAttribute:value:range:", v68, v34, v27, v29);

          v16 = v33;
          v17 = v32;
          v14 = v31;

        }
      }
    }
    if (v16)
    {
      if (v25)
      {
        objc_msgSend(v25, "string");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "rangeOfString:", v16);
        v38 = v37;

        if (v36 != 0x7FFFFFFFFFFFFFFFLL)
        {
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "transcriptBoldFont");
          v69 = (void *)objc_claimAutoreleasedReturnValue();

          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "theme");
          v67 = v38;
          v41 = v14;
          v42 = v17;
          v43 = v16;
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "appTintColor");
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = v43;
          v17 = v42;
          v14 = v41;

          objc_msgSend(v25, "addAttribute:value:range:", *MEMORY[0x1E0DC1138], v69, v36, v67);
          objc_msgSend(v25, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v45, v36, v67);

        }
      }
    }
    if (v17)
    {
      if (v25)
      {
        objc_msgSend(v25, "string");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "rangeOfString:", v17);
        v49 = v48;

        if (v47 != 0x7FFFFFFFFFFFFFFFLL)
        {
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "theme");
          v70 = v49;
          v51 = v14;
          v52 = v17;
          v53 = v16;
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "statusFailureTextColor");
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = v53;
          v17 = v52;
          v14 = v51;

          objc_msgSend(v25, "addAttribute:value:range:", *MEMORY[0x1E0DC1140], v55, v47, v70);
        }
      }
    }
    if (v25)
    {
      if (a9)
      {
        objc_msgSend(v25, "string");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "rangeOfString:", CFSTR("(!)"));
        v59 = v58;

        if (v57 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v25, "replaceCharactersInRange:withString:", v57, v59, &stru_1E276D870);
          v60 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
          +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "messageStatusWarningIconRed");
          v71 = v16;
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v60, "setImage:", v62);
          objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v60);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = (void *)objc_msgSend(v63, "mutableCopy");

          objc_msgSend(v64, "addAttributes:range:", v21, 0, objc_msgSend(v64, "length"));
          objc_msgSend(v25, "insertAttributedString:atIndex:", v64, v57);

          v16 = v71;
        }
      }
    }
    v15 = v72;
  }
  else
  {
    v25 = 0;
  }
  v65 = (void *)objc_msgSend(v25, "copy");

  return v65;
}

- (CGSize)loadSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[CKChatItem transcriptText](self, "transcriptText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
    -[CKMessageStatusChatItem loadLabelSizeThatFits:textAlignmentInsets:](self, "loadLabelSizeThatFits:textAlignmentInsets:", a4, width, height);
  else
    -[CKMessageStatusChatItem loadButtonSizeThatFits:textAlignmentInsets:](self, "loadButtonSizeThatFits:textAlignmentInsets:", a4, width, height);
  v11 = v9;
  v12 = v10;

  v13 = v11;
  v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (NSAttributedString)transcriptButtonText
{
  NSAttributedString *transcriptButtonText;
  void *v4;
  NSAttributedString *v5;
  NSAttributedString *v6;

  transcriptButtonText = self->_transcriptButtonText;
  if (!transcriptButtonText)
  {
    -[CKMessageStatusChatItem loadTranscriptButtonText](self, "loadTranscriptButtonText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (NSAttributedString *)objc_msgSend(v4, "copy");
    v6 = self->_transcriptButtonText;
    self->_transcriptButtonText = v5;

    transcriptButtonText = self->_transcriptButtonText;
  }
  return transcriptButtonText;
}

- (CGSize)buttonSize
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  double width;
  double height;
  CGSize result;

  if (!self->_buttonSizeLoaded)
  {
    v3 = (void *)MEMORY[0x193FF4740]();
    -[CKChatItem maxWidth](self, "maxWidth");
    self->_buttonSizeLoaded = 1;
    -[CKMessageStatusChatItem loadButtonSizeThatFits:textAlignmentInsets:](self, "loadButtonSizeThatFits:textAlignmentInsets:", &self->_buttonTextAlignmentInsets);
    self->_buttonSize.width = v4;
    self->_buttonSize.height = v5;
    objc_autoreleasePoolPop(v3);
  }
  width = self->_buttonSize.width;
  height = self->_buttonSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)labelSize
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  double width;
  double height;
  CGSize result;

  if (!self->_labelSizeLoaded)
  {
    v3 = (void *)MEMORY[0x193FF4740]();
    -[CKChatItem maxWidth](self, "maxWidth");
    self->_labelSizeLoaded = 1;
    -[CKMessageStatusChatItem loadLabelSizeThatFits:textAlignmentInsets:](self, "loadLabelSizeThatFits:textAlignmentInsets:", &self->_labelTextAlignmentInsets);
    self->_labelSize.width = v4;
    self->_labelSize.height = v5;
    objc_autoreleasePoolPop(v3);
  }
  width = self->_labelSize.width;
  height = self->_labelSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (UIEdgeInsets)labelTextAlignmentInsets
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  if (!self->_labelSizeLoaded)
  {
    v3 = (void *)MEMORY[0x193FF4740]();
    -[CKChatItem maxWidth](self, "maxWidth");
    self->_labelSizeLoaded = 1;
    -[CKMessageStatusChatItem loadLabelSizeThatFits:textAlignmentInsets:](self, "loadLabelSizeThatFits:textAlignmentInsets:", &self->_labelTextAlignmentInsets);
    self->_labelSize.width = v4;
    self->_labelSize.height = v5;
    objc_autoreleasePoolPop(v3);
  }
  top = self->_labelTextAlignmentInsets.top;
  left = self->_labelTextAlignmentInsets.left;
  bottom = self->_labelTextAlignmentInsets.bottom;
  right = self->_labelTextAlignmentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UIEdgeInsets)buttonTextAlignmentInsets
{
  void *v3;
  CGFloat v4;
  CGFloat v5;
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  if (!self->_buttonSizeLoaded)
  {
    v3 = (void *)MEMORY[0x193FF4740]();
    -[CKChatItem maxWidth](self, "maxWidth");
    self->_buttonSizeLoaded = 1;
    -[CKMessageStatusChatItem loadButtonSizeThatFits:textAlignmentInsets:](self, "loadButtonSizeThatFits:textAlignmentInsets:", &self->_buttonTextAlignmentInsets);
    self->_buttonSize.width = v4;
    self->_buttonSize.height = v5;
    objc_autoreleasePoolPop(v3);
  }
  top = self->_buttonTextAlignmentInsets.top;
  left = self->_buttonTextAlignmentInsets.left;
  bottom = self->_buttonTextAlignmentInsets.bottom;
  right = self->_buttonTextAlignmentInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (int64_t)buttonType
{
  unint64_t v3;
  int64_t *v4;
  unint64_t v5;

  v3 = -[CKMessageStatusChatItem expireStatusType](self, "expireStatusType") - 1;
  if (v3 < 3)
  {
    v4 = (int64_t *)((char *)&unk_18E7C8FA8 + 8 * v3);
    return *v4;
  }
  v5 = -[CKMessageStatusChatItem statusType](self, "statusType");
  if (v5 < 0x23)
  {
    v4 = (int64_t *)((char *)&unk_18E7C8FC0 + 8 * v5);
    return *v4;
  }
  return 3;
}

- (char)statusAlignment
{
  char v3;

  v3 = 2;
  if (-[CKMessageStatusChatItem buttonType](self, "buttonType") != 1)
  {
    if (-[CKChatItem isFromMe](self, "isFromMe"))
      return 2;
    else
      return 0;
  }
  return v3;
}

- (id)now
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (int64_t)statusType
{
  void *v2;
  int64_t v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "messageStatusType");

  return v3;
}

- (int64_t)expireStatusType
{
  void *v2;
  int64_t v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "expireStatusType");

  return v3;
}

- (id)time
{
  void *v2;
  void *v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "time");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[CKChatItem IMChatItem](self, "IMChatItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

+ (id)todayDateFormatter
{
  void *v2;
  void *v3;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timestampDateFormatter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)thisWeekRelativeDateFormatter
{
  return +[CKDateUtilities thisWeekRelativeDateFormatterNoTime](CKDateUtilities, "thisWeekRelativeDateFormatterNoTime");
}

+ (id)thePastDateFormatter
{
  return +[CKDateUtilities theShortDateNoTimeInSentenceDateFormatter](CKDateUtilities, "theShortDateNoTimeInSentenceDateFormatter");
}

- (id)effectsControlStatusTextForEffectStyleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKConfettiEffect")))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("FSM_CONTROL_BUTTON_TITLE_CONFETTI");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKLasersEffect")))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("FSM_CONTROL_BUTTON_TITLE_LASERS");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKFireworksEffect")))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("FSM_CONTROL_BUTTON_TITLE_FIREWORKS");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKShootingStarEffect")))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("FSM_CONTROL_BUTTON_TITLE_SHOOTING_STAR");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKHappyBirthdayEffect")))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("FSM_CONTROL_BUTTON_TITLE_BALLOONS");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKSparklesEffect")))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("FSM_CONTROL_BUTTON_TITLE_CELEBRATION");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKHeartEffect")))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("FSM_CONTROL_BUTTON_TITLE_LOVE");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKEchoEffect")))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("FSM_CONTROL_BUTTON_TITLE_ECHO");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.effect.CKSpotlightEffect")))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("FSM_CONTROL_BUTTON_TITLE_SPOTLIGHT");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.impact")))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("EFFECT_CONTROL_BUTTON_TITLE_IMPACT");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.loud")))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("EFFECT_CONTROL_BUTTON_TITLE_LOUD");
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.gentle")))
  {
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("EFFECT_CONTROL_BUTTON_TITLE_GENTLE");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.MobileSMS.expressivesend.focus")))
    {
      v7 = 0;
      goto LABEL_28;
    }
    CKFrameworkBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("EFFECT_CONTROL_BUTTON_TITLE_FOCUS");
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_28:
  return v7;
}

- (id)loadTranscriptButtonText
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __CFString *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  const __CFString *v64;
  void *v65;
  void *v66;
  const __CFString *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  CKMessageStatusChatItem *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  const __CFString *v85;
  void *v86;
  void *v87;
  const __CFString *v88;
  void *v89;
  void *v90;
  const __CFString *v91;
  void *v92;
  void *v93;
  const __CFString *v94;
  void *v95;
  void *v96;
  void *v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  const __CFString *v103;
  void *v104;
  uint64_t v105;
  CKMessageStatusChatItem *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  const __CFString *v112;
  void *v113;
  void *v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  const __CFString *v121;
  void *v122;
  int v123;
  void *v124;
  uint64_t v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  uint64_t v133;
  __CFString *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  int v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  uint64_t v146;
  __CFString *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  id v153;
  double v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  uint64_t v161;
  __CFString *v162;
  void *v163;
  id v164;
  void *v165;
  int v166;
  void *v167;
  void *v168;
  void *v169;
  const __CFString *v170;
  void *v171;
  void *v172;
  void *v173;
  uint64_t v174;
  __CFString *v175;
  void *v176;
  void *v177;
  void *v178;
  uint64_t v179;
  CKMessageStatusChatItem *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  int v185;
  void *v186;
  void *v187;
  void *v188;
  const __CFString *v189;
  void *v190;
  void *v191;
  void *v192;
  uint64_t v193;
  __CFString *v194;
  void *v195;
  void *v196;
  const __CFString *v197;
  int v198;
  void *v199;
  void *v200;
  void *v201;
  const __CFString *v202;
  void *v203;
  void *v204;
  void *v205;
  uint64_t v206;
  __CFString *v207;
  void *v208;
  id v209;
  __CFString *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  uint64_t v215;
  __CFString *v216;
  void *v217;
  void *v218;
  const __CFString *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  const __CFString *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  uint64_t v230;
  __CFString *v231;
  uint64_t v232;
  uint64_t v233;
  void *v234;
  uint64_t v235;
  id v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  uint64_t v243;
  __CFString *v244;
  void *v245;
  void *v246;
  uint64_t v247;
  void *v248;
  void *v249;
  uint64_t v250;
  void *v251;
  void *v252;
  uint64_t v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  uint64_t v260;
  __CFString *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  int v266;
  uint64_t v267;
  void *v268;
  void *v269;
  uint64_t v270;
  void *v271;
  void *v272;
  unsigned __int8 v273;
  _QWORD v274[2];
  _QWORD v275[2];
  uint64_t v276;
  uint64_t v277;
  _QWORD v278[2];
  _QWORD v279[2];
  _QWORD v280[2];
  uint64_t v281;
  uint64_t v282;
  _QWORD v283[2];
  uint64_t v284;
  void *v285;
  _QWORD v286[2];
  _QWORD v287[4];

  v287[2] = *MEMORY[0x1E0C80C00];
  switch(-[CKMessageStatusChatItem buttonType](self, "buttonType"))
  {
    case 0:
      if (-[CKMessageStatusChatItem expireStatusType](self, "expireStatusType") != 2)
        return 0;
      v3 = -[CKMessageStatusChatItem transcriptOrientation](self, "transcriptOrientation");
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v3)
        objc_msgSend(v4, "rightTranscriptButtonTextAttributes");
      else
        objc_msgSend(v4, "leftTranscriptButtonTextAttributes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v153 = objc_alloc(MEMORY[0x1E0CB37E8]);
      IMMessageItemExpireStateExpiringDuration();
      v43 = (void *)objc_msgSend(v153, "initWithUnsignedInteger:", (unint64_t)v154 / 0x3C);
      v155 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "localizedStringForKey:value:table:", CFSTR("MESSAGE_STATUS_EXPIRING"), &stru_1E276D870, CFSTR("ChatKit"));
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "__ck_localizedString");
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v155, "stringWithFormat:", v157, v158);
      v159 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v160 = (void *)objc_claimAutoreleasedReturnValue();
      v161 = objc_msgSend(v160, "userInterfaceLayoutDirection");

      if (v161 == 1)
        v162 = CFSTR("\u200F");
      else
        v162 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v162, "stringByAppendingString:", v159);
      v163 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v163, v6);
      goto LABEL_135;
    case 1:
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "statusSaveButtonTranscriptText");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_136;
    case 2:
      v286[0] = *MEMORY[0x1E0DC1138];
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "transcriptBoldFont");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v286[1] = *MEMORY[0x1E0DC1140];
      v287[0] = v9;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "theme");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appTintColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v287[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v287, v286, 2);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInteger:", -[CKMessageStatusChatItem count](self, "count"));
      v15 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("PLAY_ALL_BUTTON_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "__ck_localizedString");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "userInterfaceLayoutDirection");

      if (v21 == 1)
        v22 = CFSTR("\u200F");
      else
        v22 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v22, "stringByAppendingString:", v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v23, v13);
      goto LABEL_63;
    case 3:
      -[CKChatItem IMChatItem](self, "IMChatItem");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v267 = objc_msgSend(v24, "attributionType");
      v266 = objc_msgSend(v24, "showsLearnMoreLink");
      v271 = v24;
      objc_msgSend(v24, "attributionInfo");
      v269 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v269, "__ck_localizedAppNameForTranscriptAttribution");
      v268 = (void *)objc_claimAutoreleasedReturnValue();
      v281 = *MEMORY[0x1E0DC1138];
      v25 = v281;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "transcriptBoldFont");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v283[0] = v27;
      v282 = *MEMORY[0x1E0DC1140];
      v28 = v282;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "theme");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "appTintColor");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v283[1] = v31;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v283, &v281, 2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v279[0] = v25;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "transcriptBoldFont");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v279[1] = v28;
      v280[0] = v34;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "theme");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "messageStatusChatItemGrayColor");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v280[1] = v37;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v280, v279, 2);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      switch(v267)
      {
        case 1:
          v39 = (void *)MEMORY[0x1E0CB3940];
          CKFrameworkBundle();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v40;
          v42 = CFSTR("ATTRIBUTION_TEXT_APP");
          goto LABEL_105;
        case 2:
          v39 = (void *)MEMORY[0x1E0CB3940];
          CKFrameworkBundle();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v40;
          v42 = CFSTR("ATTRIBUTION_TEXT_STS");
          goto LABEL_105;
        case 3:
          v39 = (void *)MEMORY[0x1E0CB3940];
          CKFrameworkBundle();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v40;
          v42 = CFSTR("ATTRIBUTION_TEXT_STICKER");
          goto LABEL_105;
        case 4:
          v39 = (void *)MEMORY[0x1E0CB3940];
          CKFrameworkBundle();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = v40;
          v42 = CFSTR("ATTRIBUTION_TEXT_ASSOCIATED_STICKER");
LABEL_105:
          objc_msgSend(v40, "localizedStringForKey:value:table:", v42, &stru_1E276D870, CFSTR("ChatKit"));
          v211 = (void *)objc_claimAutoreleasedReturnValue();
          v212 = v268;
          objc_msgSend(v39, "stringWithFormat:", v211, v268);
          v213 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
          v214 = (void *)objc_claimAutoreleasedReturnValue();
          v215 = objc_msgSend(v214, "userInterfaceLayoutDirection");

          if (v215 == 1)
            v216 = CFSTR("\u200F");
          else
            v216 = CFSTR("\u200E");
          -[__CFString stringByAppendingString:](v216, "stringByAppendingString:", v213);
          v210 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v209 = v268;
          goto LABEL_122;
        case 5:
          CKFrameworkBundle();
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          v218 = v217;
          v219 = CFSTR("ATTRIBUTION_TEXT_PHOTOS_EXTENSION");
          goto LABEL_114;
        case 6:
          v212 = v268;
          if (v266 && !CKIsRunningInMacCatalyst())
          {
            CKFrameworkBundle();
            v254 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v254, "localizedStringForKey:value:table:", CFSTR("ATTRIBUTION_TEXT_SENT_WITH_SIRI_WITH_LEARN_MORE_LINK_TEXT"), &stru_1E276D870, CFSTR("ChatKit"));
            v209 = (id)objc_claimAutoreleasedReturnValue();

            v255 = (void *)MEMORY[0x1E0CB3940];
            CKFrameworkBundle();
            v256 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v256, "localizedStringForKey:value:table:", CFSTR("ATTRIBUTION_TEXT_SENT_WITH_SIRI_WITH_LEARN_MORE_LINK_FORMAT"), &stru_1E276D870, CFSTR("ChatKit"));
            v257 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v255, "stringWithFormat:", v257, v209);
            v258 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
            v259 = (void *)objc_claimAutoreleasedReturnValue();
            v260 = objc_msgSend(v259, "userInterfaceLayoutDirection");

            if (v260 == 1)
              v261 = CFSTR("\u200F");
            else
              v261 = CFSTR("\u200E");
            -[__CFString stringByAppendingString:](v261, "stringByAppendingString:", v258);
            v210 = (__CFString *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            CKFrameworkBundle();
            v220 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v220, "localizedStringForKey:value:table:", CFSTR("ATTRIBUTION_TEXT_SENT_WITH_SIRI"), &stru_1E276D870, CFSTR("ChatKit"));
            v210 = (__CFString *)objc_claimAutoreleasedReturnValue();

            v209 = 0;
          }
          goto LABEL_122;
        case 7:
          CKFrameworkBundle();
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          v218 = v217;
          v219 = CFSTR("ATTRIBUTION_TEXT_SENT_WITH_FACETIME");
LABEL_114:
          objc_msgSend(v217, "localizedStringForKey:value:table:", v219, &stru_1E276D870, CFSTR("ChatKit"));
          v210 = (__CFString *)objc_claimAutoreleasedReturnValue();

          v209 = 0;
          break;
        case 8:
          CKFrameworkBundle();
          v221 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v221, "localizedStringForKey:value:table:", CFSTR("ATTRIBUTION_TEXT_SENSITIVE_STICKER_SHOW_ONE_LINK_TEXT"), &stru_1E276D870, CFSTR("ChatKit"));
          v209 = (id)objc_claimAutoreleasedReturnValue();

          v222 = (void *)MEMORY[0x1E0CB3940];
          CKFrameworkBundle();
          v223 = (void *)objc_claimAutoreleasedReturnValue();
          v224 = v223;
          v225 = CFSTR("ATTRIBUTION_TEXT_SENSITIVE_STICKER_SHOW_ONE_LINK_FORMAT");
          goto LABEL_117;
        case 9:
          CKFrameworkBundle();
          v226 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v226, "localizedStringForKey:value:table:", CFSTR("ATTRIBUTION_TEXT_SENSITIVE_STICKER_SHOW_MULTIPLE_LINK_TEXT"), &stru_1E276D870, CFSTR("ChatKit"));
          v209 = (id)objc_claimAutoreleasedReturnValue();

          v222 = (void *)MEMORY[0x1E0CB3940];
          CKFrameworkBundle();
          v223 = (void *)objc_claimAutoreleasedReturnValue();
          v224 = v223;
          v225 = CFSTR("ATTRIBUTION_TEXT_SENSITIVE_STICKER_SHOW_MULTIPLE_LINK_FORMAT");
LABEL_117:
          objc_msgSend(v223, "localizedStringForKey:value:table:", v225, &stru_1E276D870, CFSTR("ChatKit"));
          v227 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v222, "stringWithFormat:", v227, v209);
          v228 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
          v229 = (void *)objc_claimAutoreleasedReturnValue();
          v230 = objc_msgSend(v229, "userInterfaceLayoutDirection");

          if (v230 == 1)
            v231 = CFSTR("\u200F");
          else
            v231 = CFSTR("\u200E");
          -[__CFString stringByAppendingString:](v231, "stringByAppendingString:", v228);
          v210 = (__CFString *)objc_claimAutoreleasedReturnValue();

          break;
        default:
          v209 = 0;
          v210 = &stru_1E276D870;
          break;
      }
      v212 = v268;
LABEL_122:
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v210, v38);
      if (objc_msgSend(v209, "length"))
      {
        v232 = -[__CFString rangeOfString:](v210, "rangeOfString:", v209);
        if (v233)
          objc_msgSend(v7, "setAttributes:range:", v32, v232, v233);
      }

      return v7;
    case 4:
      -[CKChatItem IMChatItem](self, "IMChatItem");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dataSource");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "statusAttributedString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_135;
    case 5:
      -[CKMessageStatusChatItem createReplayText](self, "createReplayText");
      return (id)objc_claimAutoreleasedReturnValue();
    case 8:
      CKFrameworkBundle();
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v62;
      v64 = CFSTR("MESSAGE_STATUS_NOT_EDITED");
      goto LABEL_62;
    case 9:
      CKFrameworkBundle();
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v65;
      v67 = CFSTR("MESSAGE_STATUS_DELIVERED");
      goto LABEL_22;
    case 10:
      CKFrameworkBundle();
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = v65;
      v67 = CFSTR("MESSAGE_STATUS_DELIVERED_QUIETLY");
LABEL_22:
      objc_msgSend(v65, "localizedStringForKey:value:table:", v67, &stru_1E276D870, CFSTR("ChatKit"));
      v13 = (id)objc_claimAutoreleasedReturnValue();

      CKFrameworkBundle();
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "localizedStringForKey:value:table:", CFSTR("MESSAGE_STATUS_NOT_EDITED"), &stru_1E276D870, CFSTR("ChatKit"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ • %@"), v13, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = -[CKMessageStatusChatItem transcriptOrientation](self, "transcriptOrientation");
      LOBYTE(v263) = 1;
      v72 = self;
      v73 = v70;
      v74 = 0;
      v75 = v69;
      goto LABEL_44;
    case 11:
      -[CKMessageStatusChatItem time](self, "time");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageStatusChatItem now](self, "now");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v76)
      {
        CKFrameworkBundle();
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v149, "localizedStringForKey:value:table:", CFSTR("MESSAGE_STATUS_READ"), &stru_1E276D870, CFSTR("ChatKit"));
        v150 = (void *)objc_claimAutoreleasedReturnValue();

        v81 = 0;
        goto LABEL_82;
      }
      objc_msgSend(MEMORY[0x1E0C99D48], "__ck_currentCalendar");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = objc_msgSend(v78, "__ck_unitOfDisambiguityFromDate:toDate:", v76, v77);

      if (v79 == 4)
        goto LABEL_27;
      if (v79 == 16)
      {
        +[CKMessageStatusChatItem thisWeekRelativeDateFormatter](CKMessageStatusChatItem, "thisWeekRelativeDateFormatter");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v273 = 0;
        objc_msgSend(v80, "stringFromDate:isRelative:", v76, &v273);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v166 = v273;
        v167 = (void *)MEMORY[0x1E0CB3940];
        CKFrameworkBundle();
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        v169 = v168;
        if (v166)
          v170 = CFSTR("MESSAGE_STATUS_READ_RELATIVE_DAY");
        else
          v170 = CFSTR("MESSAGE_STATUS_READ_DAY");
        objc_msgSend(v168, "localizedStringForKey:value:table:", v170, &stru_1E276D870, CFSTR("ChatKit"));
        v245 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v167, "stringWithFormat:", v245, v81);
        v172 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
        v246 = (void *)objc_claimAutoreleasedReturnValue();
        v247 = objc_msgSend(v246, "userInterfaceLayoutDirection");

        if (v247 == 1)
          v175 = CFSTR("\u200F");
        else
          v175 = CFSTR("\u200E");
      }
      else
      {
        if (v79 == 8)
        {
LABEL_27:
          +[CKMessageStatusChatItem thePastDateFormatter](CKMessageStatusChatItem, "thePastDateFormatter");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "stringFromDate:", v76);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = (void *)MEMORY[0x1E0CB3940];
          CKFrameworkBundle();
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = v83;
          v85 = CFSTR("MESSAGE_STATUS_READ_DATE");
        }
        else
        {
          +[CKMessageStatusChatItem todayDateFormatter](CKMessageStatusChatItem, "todayDateFormatter");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "stringFromDate:", v76);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = (void *)MEMORY[0x1E0CB3940];
          CKFrameworkBundle();
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = v83;
          v85 = CFSTR("MESSAGE_STATUS_READ_TIME");
        }
        objc_msgSend(v83, "localizedStringForKey:value:table:", v85, &stru_1E276D870, CFSTR("ChatKit"));
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "stringWithFormat:", v171, v81);
        v172 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        v174 = objc_msgSend(v173, "userInterfaceLayoutDirection");

        if (v174 == 1)
          v175 = CFSTR("\u200F");
        else
          v175 = CFSTR("\u200E");
      }
      -[__CFString stringByAppendingString:](v175, "stringByAppendingString:", v172);
      v150 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_82:
      CKFrameworkBundle();
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v176, "localizedStringForKey:value:table:", CFSTR("MESSAGE_STATUS_NOT_EDITED"), &stru_1E276D870, CFSTR("ChatKit"));
      v177 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ • %@"), v150, v177);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      v179 = -[CKMessageStatusChatItem transcriptOrientation](self, "transcriptOrientation");
      LOBYTE(v265) = 1;
      v180 = self;
      v181 = v178;
      v182 = v81;
      v183 = 0;
      v184 = v177;
      goto LABEL_100;
    case 12:
      CKFrameworkBundle();
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = v86;
      v88 = CFSTR("MESSAGE_STATUS_EDITED");
      goto LABEL_38;
    case 13:
      CKFrameworkBundle();
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = v89;
      v91 = CFSTR("MESSAGE_STATUS_DELIVERED");
      goto LABEL_31;
    case 14:
      CKFrameworkBundle();
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = v89;
      v91 = CFSTR("MESSAGE_STATUS_DELIVERED_QUIETLY");
LABEL_31:
      objc_msgSend(v89, "localizedStringForKey:value:table:", v91, &stru_1E276D870, CFSTR("ChatKit"));
      v13 = (id)objc_claimAutoreleasedReturnValue();

      CKFrameworkBundle();
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = v92;
      v94 = CFSTR("MESSAGE_STATUS_EDITED");
      goto LABEL_43;
    case 15:
      -[CKMessageStatusChatItem time](self, "time");
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageStatusChatItem now](self, "now");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v95)
      {
        CKFrameworkBundle();
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v151, "localizedStringForKey:value:table:", CFSTR("MESSAGE_STATUS_READ"), &stru_1E276D870, CFSTR("ChatKit"));
        v150 = (void *)objc_claimAutoreleasedReturnValue();

        v81 = 0;
        goto LABEL_90;
      }
      objc_msgSend(MEMORY[0x1E0C99D48], "__ck_currentCalendar");
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      v98 = objc_msgSend(v97, "__ck_unitOfDisambiguityFromDate:toDate:", v95, v96);

      if (v98 == 4)
        goto LABEL_36;
      if (v98 == 16)
      {
        +[CKMessageStatusChatItem thisWeekRelativeDateFormatter](CKMessageStatusChatItem, "thisWeekRelativeDateFormatter");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v273 = 0;
        objc_msgSend(v99, "stringFromDate:isRelative:", v95, &v273);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v185 = v273;
        v186 = (void *)MEMORY[0x1E0CB3940];
        CKFrameworkBundle();
        v187 = (void *)objc_claimAutoreleasedReturnValue();
        v188 = v187;
        if (v185)
          v189 = CFSTR("MESSAGE_STATUS_READ_RELATIVE_DAY");
        else
          v189 = CFSTR("MESSAGE_STATUS_READ_DAY");
        objc_msgSend(v187, "localizedStringForKey:value:table:", v189, &stru_1E276D870, CFSTR("ChatKit"));
        v248 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v186, "stringWithFormat:", v248, v81);
        v191 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
        v249 = (void *)objc_claimAutoreleasedReturnValue();
        v250 = objc_msgSend(v249, "userInterfaceLayoutDirection");

        if (v250 == 1)
          v194 = CFSTR("\u200F");
        else
          v194 = CFSTR("\u200E");
      }
      else
      {
        if (v98 == 8)
        {
LABEL_36:
          +[CKMessageStatusChatItem thePastDateFormatter](CKMessageStatusChatItem, "thePastDateFormatter");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "stringFromDate:", v95);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = (void *)MEMORY[0x1E0CB3940];
          CKFrameworkBundle();
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = v101;
          v103 = CFSTR("MESSAGE_STATUS_READ_DATE");
        }
        else
        {
          +[CKMessageStatusChatItem todayDateFormatter](CKMessageStatusChatItem, "todayDateFormatter");
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v99, "stringFromDate:", v95);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v100 = (void *)MEMORY[0x1E0CB3940];
          CKFrameworkBundle();
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          v102 = v101;
          v103 = CFSTR("MESSAGE_STATUS_READ_TIME");
        }
        objc_msgSend(v101, "localizedStringForKey:value:table:", v103, &stru_1E276D870, CFSTR("ChatKit"));
        v190 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "stringWithFormat:", v190, v81);
        v191 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
        v192 = (void *)objc_claimAutoreleasedReturnValue();
        v193 = objc_msgSend(v192, "userInterfaceLayoutDirection");

        if (v193 == 1)
          v194 = CFSTR("\u200F");
        else
          v194 = CFSTR("\u200E");
      }
      -[__CFString stringByAppendingString:](v194, "stringByAppendingString:", v191);
      v150 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_90:
      CKFrameworkBundle();
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      v196 = v195;
      v197 = CFSTR("MESSAGE_STATUS_EDITED");
      goto LABEL_99;
    case 16:
      CKFrameworkBundle();
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      v87 = v86;
      v88 = CFSTR("MESSAGE_STATUS_HIDE_EDITS");
LABEL_38:
      objc_msgSend(v86, "localizedStringForKey:value:table:", v88, &stru_1E276D870, CFSTR("ChatKit"));
      v104 = (void *)objc_claimAutoreleasedReturnValue();

      v105 = -[CKMessageStatusChatItem transcriptOrientation](self, "transcriptOrientation");
      LOBYTE(v262) = 0;
      v106 = self;
      v107 = v104;
      v108 = v104;
      goto LABEL_39;
    case 17:
      CKFrameworkBundle();
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = v110;
      v112 = CFSTR("MESSAGE_STATUS_DELIVERED");
      goto LABEL_42;
    case 18:
      CKFrameworkBundle();
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = v110;
      v112 = CFSTR("MESSAGE_STATUS_DELIVERED_QUIETLY");
LABEL_42:
      objc_msgSend(v110, "localizedStringForKey:value:table:", v112, &stru_1E276D870, CFSTR("ChatKit"));
      v13 = (id)objc_claimAutoreleasedReturnValue();

      CKFrameworkBundle();
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = v92;
      v94 = CFSTR("MESSAGE_STATUS_HIDE_EDITS");
LABEL_43:
      objc_msgSend(v92, "localizedStringForKey:value:table:", v94, &stru_1E276D870, CFSTR("ChatKit"));
      v69 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ • %@"), v13, v69);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = -[CKMessageStatusChatItem transcriptOrientation](self, "transcriptOrientation");
      LOBYTE(v263) = 0;
      v72 = self;
      v73 = v70;
      v74 = v69;
      v75 = 0;
LABEL_44:
      -[CKMessageStatusChatItem _styledStatusTextWithStatusText:orientation:dateSubText:buttonSubText:errorSubText:overrideTextColor:shouldReplaceWarningIcon:](v72, "_styledStatusTextWithStatusText:orientation:dateSubText:buttonSubText:errorSubText:overrideTextColor:shouldReplaceWarningIcon:", v73, v71, 0, v74, v75, 0, v263);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_63;
    case 19:
      -[CKMessageStatusChatItem time](self, "time");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKMessageStatusChatItem now](self, "now");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v113)
      {
        CKFrameworkBundle();
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v152, "localizedStringForKey:value:table:", CFSTR("MESSAGE_STATUS_READ"), &stru_1E276D870, CFSTR("ChatKit"));
        v150 = (void *)objc_claimAutoreleasedReturnValue();

        v81 = 0;
        goto LABEL_98;
      }
      objc_msgSend(MEMORY[0x1E0C99D48], "__ck_currentCalendar");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v116 = objc_msgSend(v115, "__ck_unitOfDisambiguityFromDate:toDate:", v113, v114);

      if (v116 == 4)
        goto LABEL_49;
      if (v116 == 16)
      {
        +[CKMessageStatusChatItem thisWeekRelativeDateFormatter](CKMessageStatusChatItem, "thisWeekRelativeDateFormatter");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v273 = 0;
        objc_msgSend(v117, "stringFromDate:isRelative:", v113, &v273);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v198 = v273;
        v199 = (void *)MEMORY[0x1E0CB3940];
        CKFrameworkBundle();
        v200 = (void *)objc_claimAutoreleasedReturnValue();
        v201 = v200;
        if (v198)
          v202 = CFSTR("MESSAGE_STATUS_READ_RELATIVE_DAY");
        else
          v202 = CFSTR("MESSAGE_STATUS_READ_DAY");
        objc_msgSend(v200, "localizedStringForKey:value:table:", v202, &stru_1E276D870, CFSTR("ChatKit"));
        v251 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v199, "stringWithFormat:", v251, v81);
        v204 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
        v252 = (void *)objc_claimAutoreleasedReturnValue();
        v253 = objc_msgSend(v252, "userInterfaceLayoutDirection");

        if (v253 == 1)
          v207 = CFSTR("\u200F");
        else
          v207 = CFSTR("\u200E");
      }
      else
      {
        if (v116 == 8)
        {
LABEL_49:
          +[CKMessageStatusChatItem thePastDateFormatter](CKMessageStatusChatItem, "thePastDateFormatter");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "stringFromDate:", v113);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v118 = (void *)MEMORY[0x1E0CB3940];
          CKFrameworkBundle();
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          v120 = v119;
          v121 = CFSTR("MESSAGE_STATUS_READ_DATE");
        }
        else
        {
          +[CKMessageStatusChatItem todayDateFormatter](CKMessageStatusChatItem, "todayDateFormatter");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v117, "stringFromDate:", v113);
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          v118 = (void *)MEMORY[0x1E0CB3940];
          CKFrameworkBundle();
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          v120 = v119;
          v121 = CFSTR("MESSAGE_STATUS_READ_TIME");
        }
        objc_msgSend(v119, "localizedStringForKey:value:table:", v121, &stru_1E276D870, CFSTR("ChatKit"));
        v203 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v118, "stringWithFormat:", v203, v81);
        v204 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
        v205 = (void *)objc_claimAutoreleasedReturnValue();
        v206 = objc_msgSend(v205, "userInterfaceLayoutDirection");

        if (v206 == 1)
          v207 = CFSTR("\u200F");
        else
          v207 = CFSTR("\u200E");
      }
      -[__CFString stringByAppendingString:](v207, "stringByAppendingString:", v204);
      v150 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_98:
      CKFrameworkBundle();
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      v196 = v195;
      v197 = CFSTR("MESSAGE_STATUS_HIDE_EDITS");
LABEL_99:
      objc_msgSend(v195, "localizedStringForKey:value:table:", v197, &stru_1E276D870, CFSTR("ChatKit"));
      v177 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ • %@"), v150, v177);
      v178 = (void *)objc_claimAutoreleasedReturnValue();
      v179 = -[CKMessageStatusChatItem transcriptOrientation](self, "transcriptOrientation");
      LOBYTE(v265) = 0;
      v180 = self;
      v181 = v178;
      v182 = v81;
      v183 = v177;
      v184 = 0;
LABEL_100:
      -[CKMessageStatusChatItem _styledStatusTextWithStatusText:orientation:dateSubText:buttonSubText:errorSubText:overrideTextColor:shouldReplaceWarningIcon:](v180, "_styledStatusTextWithStatusText:orientation:dateSubText:buttonSubText:errorSubText:overrideTextColor:shouldReplaceWarningIcon:", v181, v179, v182, v183, v184, 0, v265);
      v208 = (void *)objc_claimAutoreleasedReturnValue();

      return v208;
    case 20:
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      v123 = objc_msgSend(v122, "isCarrierPigeonEnabled");

      if (!v123)
        return 0;
      objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v125 = *MEMORY[0x1E0D388E8];
      v284 = *MEMORY[0x1E0D38AA0];
      v285 = &unk_1E2870378;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v285, &v284, 1);
      v126 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "trackEvent:withDictionary:", v125, v126);

      -[CKChatItem IMChatItem](self, "IMChatItem");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "recipientDisplayName");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v128 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v129, "localizedStringForKey:value:table:", CFSTR("MESSAGE_STATUS_CONFIRM_SEND_VIA_SATELLITE_SUB_STATUS"), &stru_1E276D870, CFSTR("ChatKit-CarrierPigeon"));
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "localizedStringWithFormat:", v130, v127);
      v131 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = objc_msgSend(v132, "userInterfaceLayoutDirection");

      if (v133 == 1)
        v134 = CFSTR("\u200F");
      else
        v134 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v134, "stringByAppendingString:", v131);
      v135 = (void *)objc_claimAutoreleasedReturnValue();

      CKFrameworkBundle();
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v136, "localizedStringForKey:value:table:", CFSTR("MESSAGE_STATUS_CONFIRM_SEND_VIA_SATELLITE"), &stru_1E276D870, CFSTR("ChatKit-CarrierPigeon"));
      v137 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ \n %@"), v135, v137);
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v264) = 0;
      -[CKMessageStatusChatItem _styledStatusTextWithStatusText:orientation:dateSubText:buttonSubText:errorSubText:overrideTextColor:shouldReplaceWarningIcon:](self, "_styledStatusTextWithStatusText:orientation:dateSubText:buttonSubText:errorSubText:overrideTextColor:shouldReplaceWarningIcon:", v138, -[CKMessageStatusChatItem transcriptOrientation](self, "transcriptOrientation"), 0, v137, 0, 0, v264);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_63:
      return v7;
    case 21:
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v140 = objc_msgSend(v139, "isCarrierPigeonEnabled");

      if (!v140)
        return 0;
      v141 = (void *)MEMORY[0x1E0CB3940];
      CKFrameworkBundle();
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v142, "localizedStringForKey:value:table:", CFSTR("MESSAGE_STATUS_CONFIRM_SENT_VIA_SATELLITE"), &stru_1E276D870, CFSTR("ChatKit-CarrierPigeon"));
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v141, "localizedStringWithFormat:", v143);
      v144 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      v146 = objc_msgSend(v145, "userInterfaceLayoutDirection");

      if (v146 == 1)
        v147 = CFSTR("\u200F");
      else
        v147 = CFSTR("\u200E");
      -[__CFString stringByAppendingString:](v147, "stringByAppendingString:", v144);
      v104 = (void *)objc_claimAutoreleasedReturnValue();

      v105 = -[CKMessageStatusChatItem transcriptOrientation](self, "transcriptOrientation");
      LOBYTE(v262) = 0;
      v106 = self;
      v107 = v104;
      v108 = 0;
LABEL_39:
      -[CKMessageStatusChatItem _styledStatusTextWithStatusText:orientation:dateSubText:buttonSubText:errorSubText:overrideTextColor:shouldReplaceWarningIcon:](v106, "_styledStatusTextWithStatusText:orientation:dateSubText:buttonSubText:errorSubText:overrideTextColor:shouldReplaceWarningIcon:", v107, v105, 0, v108, 0, 0, v262);
      v109 = (void *)objc_claimAutoreleasedReturnValue();

      return v109;
    case 22:
      CKFrameworkBundle();
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v62;
      v64 = CFSTR("MESSAGE_STATUS_NOT_CANCELLED");
LABEL_62:
      objc_msgSend(v62, "localizedStringForKey:value:table:", v64, &stru_1E276D870, CFSTR("ChatKit"));
      v148 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = v148;
      LOBYTE(v262) = 1;
      -[CKMessageStatusChatItem _styledStatusTextWithStatusText:orientation:dateSubText:buttonSubText:errorSubText:overrideTextColor:shouldReplaceWarningIcon:](self, "_styledStatusTextWithStatusText:orientation:dateSubText:buttonSubText:errorSubText:overrideTextColor:shouldReplaceWarningIcon:", v13, -[CKMessageStatusChatItem transcriptOrientation](self, "transcriptOrientation"), 0, 0, v13, 0, v262);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_63;
    default:
      if (-[CKMessageStatusChatItem statusType](self, "statusType") != 19)
        return 0;
      -[CKChatItem IMChatItem](self, "IMChatItem");
      v272 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v272, "syndicationStatus");
      v276 = *MEMORY[0x1E0DC1138];
      v46 = v276;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "transcriptBoldFont");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v278[0] = v48;
      v277 = *MEMORY[0x1E0DC1140];
      v49 = v277;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "theme");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "appTintColor");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v278[1] = v52;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v278, &v276, 2);
      v270 = objc_claimAutoreleasedReturnValue();

      v274[0] = v46;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "transcriptMessageStatusFont");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v274[1] = v49;
      v275[0] = v54;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "theme");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "messageStatusChatItemGrayColor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v275[1] = v57;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v275, v274, 2);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
      {
        if (v45 != 1)
        {
          v7 = 0;
          v43 = (void *)v270;
          v6 = v272;
          goto LABEL_134;
        }
        v6 = v272;
        if (objc_msgSend(v272, "wasDetectedAsSWYSpam"))
        {
          v59 = objc_alloc(MEMORY[0x1E0CB3498]);
          CKFrameworkBundle();
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("MARKED_AS_NOT_DONATED"), &stru_1E276D870, CFSTR("ChatKit"));
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = (void *)v270;
          v7 = (void *)objc_msgSend(v59, "initWithString:attributes:", v61, v270);

LABEL_132:
          goto LABEL_134;
        }
        objc_msgSend(v272, "swyAppName");
        v234 = (void *)objc_claimAutoreleasedReturnValue();
        v235 = objc_msgSend(v234, "length");

        if (v235)
        {
          v236 = objc_alloc(MEMORY[0x1E0CB3498]);
          v237 = (void *)MEMORY[0x1E0CB3940];
          CKFrameworkBundle();
          v238 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v238, "localizedStringForKey:value:table:", CFSTR("MARKED_AS_NOT_DONATED_PUBLICSWY"), &stru_1E276D870, CFSTR("ChatKit"));
          v239 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v272, "swyAppName");
          v240 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v237, "stringWithFormat:", v239, v240);
          v241 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
          v242 = (void *)objc_claimAutoreleasedReturnValue();
          v243 = objc_msgSend(v242, "userInterfaceLayoutDirection");

          if (v243 == 1)
            v244 = CFSTR("\u200F");
          else
            v244 = CFSTR("\u200E");
          -[__CFString stringByAppendingString:](v244, "stringByAppendingString:", v241);
          v60 = (void *)objc_claimAutoreleasedReturnValue();

          v7 = (void *)objc_msgSend(v236, "initWithString:attributes:", v60, v58);
          goto LABEL_131;
        }
      }
      else
      {
        v6 = v272;
        if (objc_msgSend(v272, "wasDetectedAsSWYSpam"))
        {
          v164 = objc_alloc(MEMORY[0x1E0CB3498]);
          CKFrameworkBundle();
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "localizedStringForKey:value:table:", CFSTR("MARKED_AS_DONATED"), &stru_1E276D870, CFSTR("ChatKit"));
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = (void *)objc_msgSend(v164, "initWithString:attributes:", v165, v58);

LABEL_131:
          v43 = (void *)v270;
          goto LABEL_132;
        }
      }
      v7 = 0;
      v43 = (void *)v270;
LABEL_134:

LABEL_135:
LABEL_136:

      return v7;
  }
}

- (CGSize)loadLabelSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  __int128 v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (a4)
  {
    v7 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
    *(_OWORD *)&a4->top = *MEMORY[0x1E0CEB4B0];
    *(_OWORD *)&a4->bottom = v7;
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transcriptStatusItemEdgeInsets");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = MEMORY[0x1E0C9D820];
  v18 = *MEMORY[0x1E0C9D820];
  -[CKChatItem transcriptText](self, "transcriptText");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "length"))
  {
    v20 = width - (v12 + v16);
    v21 = height - (v10 + v14);
    -[CKMessageStatusChatItem transcriptButtonText](self, "transcriptButtonText");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "length");

    if (v23)
    {
      -[CKMessageStatusChatItem buttonSize](self, "buttonSize");
      v25 = v24;
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "transcriptButtonContentEdgeInsets");
      v18 = v25 + v27 + v28;

    }
    -[CKChatItem transcriptText](self, "transcriptText");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "boundingRectWithSize:options:context:", 3, 0, v20 - v18, v21);
    v18 = v30;
    v32 = v31;

    -[CKChatItem transcriptTraitCollection](self, "transcriptTraitCollection");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "displayScale");
    if (v34 == 0.0)
    {
      if (CKMainScreenScale_once_14 != -1)
        dispatch_once(&CKMainScreenScale_once_14, &__block_literal_global_31);
      v34 = *(double *)&CKMainScreenScale_sMainScreenScale_14;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_14 == 0.0)
        v34 = 1.0;
    }
    v35 = ceil(v32 * v34) / v34;

  }
  else
  {
    v35 = *(double *)(v17 + 8);
  }

  v36 = v18;
  v37 = v35;
  result.height = v37;
  result.width = v36;
  return result;
}

- (CGSize)loadButtonSizeThatFits:(CGSize)a3 textAlignmentInsets:(UIEdgeInsets *)a4
{
  double height;
  double width;
  __int128 v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (a4)
  {
    v7 = *(_OWORD *)(MEMORY[0x1E0CEB4B0] + 16);
    *(_OWORD *)&a4->top = *MEMORY[0x1E0CEB4B0];
    *(_OWORD *)&a4->bottom = v7;
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transcriptStatusItemEdgeInsets");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  -[CKMessageStatusChatItem transcriptButtonText](self, "transcriptButtonText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    +[CKMessageStatusChatItem sizingButton](CKMessageStatusChatItem, "sizingButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAttributedTitle:forState:", v17, 0);
    v19 = objc_alloc_init(MEMORY[0x1E0CEAC18]);
    objc_msgSend(v19, "addSubview:", v18);
    objc_msgSend(v18, "sizeThatFits:", width - (v12 + v16), height - (v10 + v14));
    v21 = v20;
    v23 = v22;
    -[CKChatItem transcriptTraitCollection](self, "transcriptTraitCollection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "displayScale");
    if (v25 == 0.0)
    {
      if (CKMainScreenScale_once_14 != -1)
        dispatch_once(&CKMainScreenScale_once_14, &__block_literal_global_31);
      v26 = *(double *)&CKMainScreenScale_sMainScreenScale_14;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_14 == 0.0)
        v26 = 1.0;
      v27 = ceil(v21 * v26) / v26;
      v25 = *(double *)&CKMainScreenScale_sMainScreenScale_14;
      if (*(double *)&CKMainScreenScale_sMainScreenScale_14 == 0.0)
        v25 = 1.0;
    }
    else
    {
      v27 = ceil(v21 * v25) / v25;
    }
    v28 = ceil(v23 * v25) / v25;

    objc_msgSend(v18, "removeFromSuperview");
  }
  else
  {
    v27 = *MEMORY[0x1E0C9D820];
    v28 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v29 = v27;
  v30 = v28;
  result.height = v30;
  result.width = v29;
  return result;
}

- (BOOL)shouldHideDuringDarkFSM
{
  return 1;
}

- (id)createReplayText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  if (-[CKMessageStatusChatItem allowsEffectAutoPlayback](self, "allowsEffectAutoPlayback"))
    goto LABEL_3;
  -[CKChatItem IMChatItem](self, "IMChatItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "effectStyleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKMessageStatusChatItem effectsControlStatusTextForEffectStyleID:](self, "effectsControlStatusTextForEffectStyleID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
LABEL_3:
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("REPLAY_BUTTON_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v30[0] = *MEMORY[0x1E0DC1138];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transcriptBoldFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v8;
  v30[1] = *MEMORY[0x1E0DC1140];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "theme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transcriptReplayTextColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0CEA650];
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "theme");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "transcriptReplayTextColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configurationWithPaletteColors:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithScale:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "configurationByApplyingConfiguration:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA638], "systemImageNamed:withConfiguration:", CFSTR("arrow.counterclockwise"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC12B0], "textAttachmentWithImage:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithAttachment:attributes:", v22, v12);
  v24 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(CFSTR(" "), "stringByAppendingString:", v5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithString:attributes:", v25, v12);

  objc_msgSend(v23, "appendAttributedString:", v26);
  v27 = (void *)objc_msgSend(v23, "copy");

  return v27;
}

- (void)setTranscriptButtonText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)isButtonSizeLoaded
{
  return self->_buttonSizeLoaded;
}

- (void)setButtonSizeLoaded:(BOOL)a3
{
  self->_buttonSizeLoaded = a3;
}

- (BOOL)isLabelSizeLoaded
{
  return self->_labelSizeLoaded;
}

- (void)setLabelSizeLoaded:(BOOL)a3
{
  self->_labelSizeLoaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transcriptButtonText, 0);
}

- (unint64_t)layoutType
{
  return 4;
}

- (id)layoutItemSpacingWithEnvironment:(id)a3 datasourceItemIndex:(int64_t)a4 allDatasourceItems:(id)a5 supplementryItems:(id)a6 sizeOverride:(CGSize)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  unint64_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  NSObject *v24;
  id v25;
  id v26;
  void *v27;
  double v28;
  _BYTE v29[24];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
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
  v15 = objc_msgSend(v14, "layoutType");
  if (v15 > 0x12)
    goto LABEL_15;
  if (((1 << v15) & 0x6F002) == 0)
  {
    if (((1 << v15) & 0x30) != 0)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "smallTranscriptSpace");
LABEL_12:
      v18 = v21;
      goto LABEL_13;
    }
    if (v15 == 7)
    {
      +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "largeTranscriptSpace");
      goto LABEL_12;
    }
LABEL_15:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = (id)objc_opt_class();
        *(_DWORD *)v29 = 138412546;
        *(_QWORD *)&v29[4] = v25;
        *(_WORD *)&v29[12] = 2112;
        *(_QWORD *)&v29[14] = objc_opt_class();
        v26 = *(id *)&v29[14];
        _os_log_impl(&dword_18DFCD000, v24, OS_LOG_TYPE_INFO, "CKChatItem_Layout: %@ shouldn't follow %@", v29, 0x16u);

      }
    }
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors", *(_OWORD *)v29, *(_QWORD *)&v29[16], v30);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "smallTranscriptSpace");
    v18 = v28;

    goto LABEL_14;
  }
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "smallTranscriptSpace");
  v18 = v17;

  if (objc_msgSend(v14, "hasTail"))
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "balloonMaskTailSizeForTailShape:", 1);
    v18 = v18 + v20;
LABEL_13:

  }
LABEL_14:
  +[CKChatItemLayoutUtilities transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:](CKChatItemLayoutUtilities, "transcriptVerticalEdgeSpacingForChatItem:previousChatItem:topSpacing:bottomSpacing:", self, v14, v18, 0.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

@end
