@implementation CKStewieTranscriptResumeButtonsCell

+ (double)heightForChatItem:(id)a3 fittingSize:(CGSize)a4
{
  double width;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;

  width = a4.width;
  objc_msgSend(a1, "createStampLabelView", a3, a4.width, a4.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_configureLabel:", v6);
  objc_msgSend((id)objc_opt_class(), "_makeCallEmergencyServicesButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_makeTextViaStewieButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transcriptBoldTextAlignmentInsets");
  v11 = v10;
  v13 = v12;

  v14 = width - (v11 + v13);
  objc_msgSend(v6, "attributedText");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "boundingRectWithSize:options:context:", 1, 0, v14, 1.79769313e308);
  v17 = v16;

  if (v14 + -32.0 <= 400.0)
    v18 = v14 + -32.0;
  else
    v18 = 400.0;
  objc_msgSend(v7, "sizeThatFits:", v18, 1.79769313e308);
  v20 = v19;
  objc_msgSend(v8, "sizeThatFits:", v18, 1.79769313e308);
  v22 = v21 + v17 + 24.0 + v20 + 16.0 + 32.0;

  return v22;
}

+ (void)_configureLabel:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a3;
  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transcriptEmphasizedFontAttributes");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc(MEMORY[0x1E0CB3498]);
  CKFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CALL_EMERGENCY_SERVICES_IF_YOU_NEED_HELP"), &stru_1E276D870, CFSTR("ChatKit-SYDROB_FEATURES"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithString:attributes:", v7, v9);
  objc_msgSend(v3, "setAttributedText:", v8);

  objc_msgSend(v3, "setNumberOfLines:", 0);
}

+ (id)_makeCallEmergencyServicesButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_opt_class();
  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CALL_EMERGENCY_SERVICES"), &stru_1E276D870, CFSTR("ChatKit-SYDROB_FEATURES"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_buttonWithSystemImageName:titleString:", CFSTR("phone.fill"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_makeTextViaStewieButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_opt_class();
  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("TEXT_EMERGENCY_SERVICES"), &stru_1E276D870, CFSTR("ChatKit-SYDROB_FEATURES"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_buttonWithSystemImageName:titleString:", CFSTR("message.fill"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_createButtonConfigurationWithSystemImageName:(id)a3 titleString:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = (void *)MEMORY[0x1E0CEA3A8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "filledButtonConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setButtonSize:", 3);
  objc_msgSend(v8, "setCornerStyle:", 4);
  objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBaseBackgroundColor:", v9);

  objc_msgSend(MEMORY[0x1E0CEA478], "systemWhiteColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBaseForegroundColor:", v10);

  objc_msgSend(v8, "setTitle:", v6);
  objc_msgSend(MEMORY[0x1E0CEA638], "_systemImageNamed:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithScale:", 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "imageWithConfiguration:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v13);

  objc_msgSend(v8, "setImagePadding:", 5.0);
  objc_msgSend(v8, "contentInsets");
  objc_msgSend(v8, "setContentInsets:");
  return v8;
}

+ (id)_buttonWithSystemImageName:(id)a3 titleString:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CEA3A0];
  +[CKStewieTranscriptResumeButtonsCell _createButtonConfigurationWithSystemImageName:titleString:](CKStewieTranscriptResumeButtonsCell, "_createButtonConfigurationWithSystemImageName:titleString:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "buttonWithConfiguration:primaryAction:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CKStewieTranscriptResumeButtonsCell)initWithFrame:(CGRect)a3
{
  CKStewieTranscriptResumeButtonsCell *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKStewieTranscriptResumeButtonsCell;
  v3 = -[CKTranscriptLabelCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)objc_opt_class();
    -[CKTranscriptLabelCell label](v3, "label");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_configureLabel:", v5);

    -[CKEditableCollectionViewCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKStewieTranscriptResumeButtonsCell callEmergencyServicesButton](v3, "callEmergencyServicesButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v7);

    -[CKEditableCollectionViewCell contentView](v3, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKStewieTranscriptResumeButtonsCell textViaStewieButton](v3, "textViaStewieButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

  }
  return v3;
}

- (void)layoutSubviewsForAlignmentContents
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double MidX;
  void *v23;
  double v24;
  double v25;
  void *v26;
  CGFloat v27;
  objc_super v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v28.receiver = self;
  v28.super_class = (Class)CKStewieTranscriptResumeButtonsCell;
  -[CKTranscriptStampCell layoutSubviewsForAlignmentContents](&v28, sel_layoutSubviewsForAlignmentContents);
  -[CKTranscriptStampCell contentAlignmentRect](self, "contentAlignmentRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKStewieTranscriptResumeButtonsCell _layoutLabelInAlignmentContentRect:](self, "_layoutLabelInAlignmentContentRect:");
  -[CKStewieTranscriptResumeButtonsCell callEmergencyServicesButton](self, "callEmergencyServicesButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKStewieTranscriptResumeButtonsCell textViaStewieButton](self, "textViaStewieButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 + -32.0 <= 400.0)
    v13 = v8 + -32.0;
  else
    v13 = 400.0;
  objc_msgSend(v11, "sizeThatFits:", v13, 1.79769313e308);
  v15 = v14;
  v17 = v16;
  objc_msgSend(v12, "sizeThatFits:", v13, 1.79769313e308);
  v20 = v19;
  if (v15 >= v18)
    v18 = v15;
  v21 = fmax(v18, 200.0);
  v29.origin.x = v4;
  v29.origin.y = v6;
  v29.size.width = v8;
  v29.size.height = v10;
  MidX = CGRectGetMidX(v29);
  -[CKStewieTranscriptResumeButtonsCell traitCollection](self, "traitCollection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "displayScale");
  v25 = MidX - round(v24 * (v21 * 0.5)) / v24;

  -[CKTranscriptLabelCell label](self, "label");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "frame");
  v27 = CGRectGetMaxY(v30) + 24.0;

  objc_msgSend(v11, "setFrame:", v25, v27, v21, v17);
  objc_msgSend(v11, "frame");
  objc_msgSend(v12, "setFrame:", v25, CGRectGetMaxY(v31) + 16.0, v21, v20);
  objc_msgSend(v12, "setHidden:", -[CKStewieTranscriptResumeButtonsCell isShowingStewieTextButton](self, "isShowingStewieTextButton") ^ 1);

}

- (void)_layoutLabelInAlignmentContentRect:(CGRect)a3
{
  double width;
  double x;
  void *v5;
  double v6;
  double v7;
  id v8;

  width = a3.size.width;
  x = a3.origin.x;
  -[CKTranscriptLabelCell label](self, "label", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "attributedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "boundingRectWithSize:options:context:", 1, 0, width, 1.79769313e308);
  v7 = v6;

  objc_msgSend(v8, "setFrame:", x, 8.0, width, v7);
}

- (void)setShowStewieTextButton:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  void *v7;

  v3 = a3;
  -[CKStewieTranscriptResumeButtonsCell textViaStewieButton](self, "textViaStewieButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHidden");

  if (self->_showStewieTextButton != v3 || ((v6 ^ v3) & 1) == 0)
  {
    -[CKStewieTranscriptResumeButtonsCell textViaStewieButton](self, "textViaStewieButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", !v3);

    -[CKStewieTranscriptResumeButtonsCell setNeedsLayout](self, "setNeedsLayout");
    -[CKStewieTranscriptResumeButtonsCell layoutIfNeeded](self, "layoutIfNeeded");
  }
  self->_showStewieTextButton = v3;
}

- (id)attributedButtonText
{
  void *v2;
  void *v3;

  -[CKStewieTranscriptResumeButtonsCell callEmergencyServicesButton](self, "callEmergencyServicesButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedTitleForState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKStewieTranscriptResumeButtonsCell;
  -[CKTranscriptStampCell prepareForReuse](&v3, sel_prepareForReuse);
  -[CKStewieTranscriptResumeButtonsCell setNeedsLayout](self, "setNeedsLayout");
}

- (void)touchUpInsideCallEmergencyServicesButton:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "called touchUpInsideCallEmergencyServicesButton: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placeEmergencyCallToHandle:completion:", 0, 0);

}

- (void)touchUpInsideTextViaStewieButton:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "called touchUpInsideTextViaStewieButton: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "openStewieAppForChatIdentifier:completion:", *MEMORY[0x1E0D39290], 0);

}

- (UIButton)callEmergencyServicesButton
{
  CKStewieTranscriptResumeButtonsCell *v2;
  UIButton *callEmergencyServicesButton;
  uint64_t v4;
  UIButton *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
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
  void *v24;
  void *v25;
  CKStewieTranscriptResumeButtonsCell *v27;
  id obj;
  uint64_t v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v2 = self;
  v38 = *MEMORY[0x1E0C80C00];
  callEmergencyServicesButton = self->_callEmergencyServicesButton;
  if (!callEmergencyServicesButton)
  {
    objc_msgSend((id)objc_opt_class(), "_makeCallEmergencyServicesButton");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v2->_callEmergencyServicesButton;
    v2->_callEmergencyServicesButton = (UIButton *)v4;

    objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "emergencyHandles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v7, "count") < 2)
    {
      -[UIButton addTarget:action:forEvents:](v2->_callEmergencyServicesButton, "addTarget:action:forEvents:", v2, sel_touchUpInsideCallEmergencyServicesButton_, 64);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "keysSortedByValueUsingComparator:", &__block_literal_global_53);
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      v27 = v2;
      if (v8)
      {
        v9 = v8;
        v10 = 0;
        v11 = 0;
        v29 = *(_QWORD *)v34;
        do
        {
          v12 = 0;
          v13 = v10;
          do
          {
            if (*(_QWORD *)v34 != v29)
              objc_enumerationMutation(obj);
            v10 = *(id *)(*((_QWORD *)&v33 + 1) + 8 * v12);

            v14 = v7;
            objc_msgSend(v7, "objectForKey:", v10);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            v16 = (void *)MEMORY[0x1E0CEA2A8];
            CKFrameworkBundle();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "localizedStringForKey:value:table:", v10, &stru_1E276D870, CFSTR("ChatKit"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            StringGUID();
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v31[0] = MEMORY[0x1E0C809B0];
            v31[1] = 3221225472;
            v31[2] = __66__CKStewieTranscriptResumeButtonsCell_callEmergencyServicesButton__block_invoke_2;
            v31[3] = &unk_1E274B178;
            v11 = v15;
            v32 = v11;
            objc_msgSend(v16, "actionWithTitle:image:identifier:handler:", v18, 0, v19, v31);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v11)
            {
              objc_msgSend(v11, "value");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v10, "isEqualToString:", v21))
              {
                objc_msgSend(v20, "setSubtitle:", &stru_1E276D870);
              }
              else
              {
                objc_msgSend(v11, "value");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setSubtitle:", v22);

              }
            }
            objc_msgSend(v30, "addObject:", v20);

            ++v12;
            v13 = v10;
            v7 = v14;
          }
          while (v9 != v12);
          v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        }
        while (v9);
      }
      else
      {
        v10 = 0;
        v11 = 0;
      }
      v23 = (void *)MEMORY[0x1E0CEA740];
      v24 = (void *)objc_msgSend(v30, "copy");
      objc_msgSend(v23, "menuWithChildren:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = v27;
      -[UIButton setShowsMenuAsPrimaryAction:](v27->_callEmergencyServicesButton, "setShowsMenuAsPrimaryAction:", 1);
      -[UIButton setMenu:](v27->_callEmergencyServicesButton, "setMenu:", v25);

    }
    callEmergencyServicesButton = v2->_callEmergencyServicesButton;
  }
  return callEmergencyServicesButton;
}

uint64_t __66__CKStewieTranscriptResumeButtonsCell_callEmergencyServicesButton__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a2, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");
  objc_msgSend(v4, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 > (int)objc_msgSend(v7, "intValue"))
    v8 = 1;
  else
    v8 = -1;

  return v8;
}

void __66__CKStewieTranscriptResumeButtonsCell_callEmergencyServicesButton__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D357A0], "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "placeEmergencyCallToHandle:completion:", *(_QWORD *)(a1 + 32), 0);

}

- (UIButton)textViaStewieButton
{
  UIButton *textViaStewieButton;
  UIButton *v4;
  UIButton *v5;

  textViaStewieButton = self->_textViaStewieButton;
  if (!textViaStewieButton)
  {
    objc_msgSend((id)objc_opt_class(), "_makeTextViaStewieButton");
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_textViaStewieButton;
    self->_textViaStewieButton = v4;

    -[UIButton addTarget:action:forEvents:](self->_textViaStewieButton, "addTarget:action:forEvents:", self, sel_touchUpInsideTextViaStewieButton_, 64);
    textViaStewieButton = self->_textViaStewieButton;
  }
  return textViaStewieButton;
}

- (BOOL)isShowingStewieTextButton
{
  return self->_showStewieTextButton;
}

- (void)setCallEmergencyServicesButton:(id)a3
{
  objc_storeStrong((id *)&self->_callEmergencyServicesButton, a3);
}

- (void)setTextViaStewieButton:(id)a3
{
  objc_storeStrong((id *)&self->_textViaStewieButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textViaStewieButton, 0);
  objc_storeStrong((id *)&self->_callEmergencyServicesButton, 0);
}

- (void)configureForChatItem:(id)a3 context:(id)a4 animated:(BOOL)a5 animationDuration:(double)a6 animationCurve:(int64_t)a7
{
  _BOOL8 v9;
  id v12;
  uint64_t v13;
  objc_super v14;

  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKStewieTranscriptResumeButtonsCell;
  v12 = a3;
  -[CKTranscriptStampCell configureForChatItem:context:animated:animationDuration:animationCurve:](&v14, sel_configureForChatItem_context_animated_animationDuration_animationCurve_, v12, a4, v9, a7, a6);
  v13 = objc_msgSend(v12, "shouldShowStewieTextButton", v14.receiver, v14.super_class);

  -[CKStewieTranscriptResumeButtonsCell setShowStewieTextButton:](self, "setShowStewieTextButton:", v13);
  -[CKStewieTranscriptResumeButtonsCell setNeedsLayout](self, "setNeedsLayout");
}

@end
