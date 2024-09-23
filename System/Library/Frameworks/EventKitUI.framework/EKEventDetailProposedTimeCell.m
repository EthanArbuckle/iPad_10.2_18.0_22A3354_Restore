@implementation EKEventDetailProposedTimeCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (EKEventDetailProposedTimeCell)initWithEvent:(id)a3 andAttendee:(id)a4
{
  id v7;
  id v8;
  EKEventDetailProposedTimeCell *v9;
  id v10;
  uint64_t v11;
  UIView *bgView;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  EKEventDetailsHighlightControl *control;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  UIView *v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  UIView *topSeparator;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v55;
  objc_super v56;
  _QWORD v57[2];
  const __CFString *v58;
  void *v59;
  void *v60;
  _QWORD v61[3];
  _QWORD v62[5];

  v62[4] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v56.receiver = self;
  v56.super_class = (Class)EKEventDetailProposedTimeCell;
  v9 = -[EKEventDetailCell initWithEvent:editable:style:](&v56, sel_initWithEvent_editable_style_, v7, 0, 1);
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v11 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    bgView = v9->_bgView;
    v9->_bgView = (UIView *)v11;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v9->_bgView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView setPreservesSuperviewLayoutMargins:](v9->_bgView, "setPreservesSuperviewLayoutMargins:", 1);
    EKHalfSystemGroupedBackgroundColor();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9->_bgView, "setBackgroundColor:", v13);

    -[EKEventDetailProposedTimeCell addSubview:](v9, "addSubview:", v9->_bgView);
    v14 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9->_bgView, 3, 0, v9, 3, 1.0, 0.0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v15;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9->_bgView, 4, 0, v9, 4, 1.0, 0.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v16;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9->_bgView, 5, 0, v9, 17, 1.0, 0.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v62[2] = v17;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9->_bgView, 6, 0, v9, 18, 1.0, 0.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v62[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 4);
    v55 = v8;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activateConstraints:", v19);

    objc_storeStrong((id *)&v9->_attendee, a4);
    objc_storeStrong((id *)&v9->_event, a3);
    -[EKUITableViewCell setDrawsOwnRowSeparators:](v9, "setDrawsOwnRowSeparators:", 1);
    -[EKUITableViewCell setSeparatorEdges:](v9, "setSeparatorEdges:", 0);
    -[EKEventDetailProposedTimeCell setSeparatorStyle:](v9, "setSeparatorStyle:", 0);
    v9->_showsTopSeparator = 1;
    v20 = objc_opt_new();
    control = v9->_control;
    v9->_control = (EKEventDetailsHighlightControl *)v20;

    -[EKEventDetailsHighlightControl setTranslatesAutoresizingMaskIntoConstraints:](v9->_control, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKEventDetailsHighlightControl setEnabled:](v9->_control, "setEnabled:", 0);
    -[EKEventDetailProposedTimeCell contentView](v9, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v9->_control);

    v23 = objc_alloc(MEMORY[0x1E0DC3890]);
    -[EKEventDetailProposedTimeCell traitCollection](v9, "traitCollection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    TableViewDisclosureIndicatorImage(v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v23, "initWithImage:", v25);

    objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKEventDetailProposedTimeCell contentView](v9, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addSubview:", v26);

    v28 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9->_control, 5, 0, v9->_bgView, 17, 1.0, 0.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v61[0] = v29;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9->_control, 6, 0, v26, 5, 1.0, -16.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v61[1] = v30;
    v31 = (void *)MEMORY[0x1E0CB3718];
    v32 = v9->_bgView;
    -[EKEventDetailProposedTimeCell layoutMargins](v9, "layoutMargins");
    objc_msgSend(v31, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v26, 6, 0, v32, 18, 1.0, -v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v61[2] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 3);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v35);

    _NSDictionaryOfVariableBindings(CFSTR("_control"), v9->_control, 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailProposedTimeCell contentView](v9, "contentView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_control(>=48)]|"), 0, 0, v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addConstraints:", v38);

    v39 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v26, 10, 0, v9, 10, 1.0, 0.0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "activateConstraints:", v41);

    v42 = objc_opt_new();
    topSeparator = v9->_topSeparator;
    v9->_topSeparator = (UIView *)v42;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v9->_topSeparator, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v9->_topSeparator, "setBackgroundColor:", v44);

    -[EKEventDetailProposedTimeCell addSubview:](v9, "addSubview:", v9->_topSeparator);
    _NSDictionaryOfVariableBindings(CFSTR("_topSeparator"), v9->_topSeparator, 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = CFSTR("separatorHeight");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CalOnePixelInPoints());
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = v46;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_topSeparator(separatorHeight)]"), 0, v47, v45);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailProposedTimeCell addConstraints:](v9, "addConstraints:", v48);

    v49 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9->_topSeparator, 5, 0, v9->_bgView, 5, 1.0, 0.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v57[0] = v50;
    objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v9->_topSeparator, 6, 0, v9->_bgView, 6, 1.0, 0.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v57[1] = v51;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v49;
    v8 = v55;
    objc_msgSend(v53, "activateConstraints:", v52);

  }
  return v9;
}

- (void)setSeparatorStyle:(int64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEventDetailProposedTimeCell;
  -[EKEventDetailProposedTimeCell setSeparatorStyle:](&v3, sel_setSeparatorStyle_, 0);
}

- (void)setShowsTopSeparator:(BOOL)a3
{
  void *v5;

  if (self->_showsTopSeparator != a3)
  {
    if (a3)
      objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_topSeparator, "setBackgroundColor:", v5);

    self->_showsTopSeparator = a3;
  }
}

- (void)setRoundedCorners:(unint64_t)a3
{
  void *v5;
  double v6;
  id v7;

  -[UIView layer](self->_bgView, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMaskedCorners:", a3);

  if (a3)
    v6 = 5.0;
  else
    v6 = 0.0;
  -[UIView layer](self->_bgView, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCornerRadius:", v6);

}

- (BOOL)hasCustomLayout
{
  void *v2;
  double v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pointSize");
  v4 = v3 >= 18.5;

  return v4;
}

- (BOOL)shouldDisplayForEvent
{
  return 1;
}

- (BOOL)update
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  EKEvent *event;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  _QWORD v56[2];
  _QWORD v57[2];
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[4];

  v60[2] = *MEMORY[0x1E0C80C00];
  CUIKDisplayStringForNotificationIdentity();
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailsHighlightControl setTitleText:](self->_control, "setTitleText:");
  v58 = *MEMORY[0x1E0DC1138];
  v3 = v58;
  v4 = *MEMORY[0x1E0DC4A98];
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v60[0] = v5;
  v59 = *MEMORY[0x1E0DC1140];
  v6 = v59;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, &v58, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v56[0] = v3;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = v6;
  v57[0] = v9;
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  EventKitUIBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("Proposed a new time"), &stru_1E601DFA8, 0);
  v13 = objc_claimAutoreleasedReturnValue();

  v48 = (void *)v13;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v13, v8);
  event = self->_event;
  v16 = EKUIWidthSizeClassForViewHierarchy(self);
  v54 = 0;
  v55 = 0;
  v52 = 0;
  v53 = 0;
  -[EKCalendarEventInvitationNotificationAttendee proposedStartDate](self->_attendee, "proposedStartDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  CalDetailStringsForCalendarEvent(event, v16, &v55, &v54, &v53, &v52, v17, 0);
  v18 = v55;
  v50 = v54;
  v19 = v53;
  v20 = v52;

  v51 = v19;
  if (v18)
  {
    v21 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n%@"), v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v21, "initWithString:attributes:", v22, v11);

    objc_msgSend(v14, "appendAttributedString:", v23);
    v19 = v51;
  }
  v47 = v18;
  if (v50)
  {
    v24 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n%@"), v50);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v24, "initWithString:attributes:", v25, v11);

    objc_msgSend(v14, "appendAttributedString:", v26);
    v19 = v51;
  }
  if (v19)
  {
    v27 = v19;
    v28 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n%@"), v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v28, "initWithString:attributes:", v29, v11);

    objc_msgSend(v14, "appendAttributedString:", v30);
  }
  if (v20)
  {
    v31 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n%@"), v20);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v31, "initWithString:attributes:", v32, v11);

    objc_msgSend(v14, "appendAttributedString:", v33);
  }
  -[EKEventDetailsHighlightControl setSubtitleAttributedText:](self->_control, "setSubtitleAttributedText:", v14);
  v34 = EKUIScaleFactor();
  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", 20.0, 20.0, v34);
  objc_msgSend(v35, "setDrawBorder:", 1);
  v36 = (void *)MEMORY[0x1E0D0CD08];
  -[EKCalendarEventInvitationNotificationAttendee proposedStartDate](self->_attendee, "proposedStartDate");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKCalendar();
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v36, "iconDateNameFormatTypeForDateBasedOnDistanceFromNow:calendar:", v37, v38);

  v40 = objc_alloc(MEMORY[0x1E0D3A820]);
  -[EKCalendarEventInvitationNotificationAttendee proposedStartDate](self->_attendee, "proposedStartDate");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  CUIKCalendar();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v40, "initWithDate:calendar:format:", v41, v42, v39);

  objc_msgSend(v43, "prepareImageForDescriptor:", v35);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", objc_msgSend(v44, "CGImage"), 0, v34);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v45)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "_applicationIconImageForBundleIdentifier:format:", CFSTR("com.apple.mobilecal"), 5);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[EKEventDetailsHighlightControl setIconImage:](self->_control, "setIconImage:", v45);
  -[EKEventDetailProposedTimeCell setNeedsLayout](self, "setNeedsLayout");

  return 1;
}

- (BOOL)showsTopSeparator
{
  return self->_showsTopSeparator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bgView, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_topSeparator, 0);
  objc_storeStrong((id *)&self->_control, 0);
  objc_storeStrong((id *)&self->_attendee, 0);
}

@end
