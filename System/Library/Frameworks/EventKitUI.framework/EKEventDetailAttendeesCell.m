@implementation EKEventDetailAttendeesCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (EKEventDetailAttendeesCell)initWithEvent:(id)a3 model:(id)a4
{
  EKEventDetailAttendeesCellModel *v6;
  EKEventDetailAttendeesCell *v7;
  EKEventDetailAttendeesCellModel *model;
  uint64_t v9;
  UILabel *titleLabel;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  UILabel *countLabel;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  UIImageView *disclosure;
  void *v29;
  uint64_t v30;
  EKEventDetailAttendeesListView *attendeesListView;
  void *v32;
  void *v33;
  UILabel *v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  UILabel *v43;
  UIImageView *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  EKEventDetailAttendeesListView *v54;
  UILabel *v55;
  double v56;
  void *v57;
  void *v58;
  EKEventDetailAttendeesListView *v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  NSLayoutConstraint *listHeight;
  EKEventDetailAttendeesCellModel *v70;
  objc_super v71;

  v6 = (EKEventDetailAttendeesCellModel *)a4;
  v71.receiver = self;
  v71.super_class = (Class)EKEventDetailAttendeesCell;
  v7 = -[EKEventDetailCell initWithEvent:editable:style:](&v71, sel_initWithEvent_editable_style_, a3, 1, 1);
  model = v7->_model;
  v7->_model = v6;
  v70 = v6;

  v9 = objc_opt_new();
  titleLabel = v7->_titleLabel;
  v7->_titleLabel = (UILabel *)v9;

  -[EKEventDetailAttendeesCell textLabel](v7, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "font");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v7->_titleLabel, "setFont:", v12);

  -[EKEventDetailAttendeesCell textLabel](v7, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v7->_titleLabel, "setTextColor:", v14);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  EventKitUIBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Invitees"), &stru_1E601DFA8, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v7->_titleLabel, "setText:", v16);

  -[EKEventDetailAttendeesCell contentView](v7, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addSubview:", v7->_titleLabel);

  v18 = objc_opt_new();
  countLabel = v7->_countLabel;
  v7->_countLabel = (UILabel *)v18;

  -[EKEventDetailAttendeesCell detailTextLabel](v7, "detailTextLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "font");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v7->_countLabel, "setFont:", v21);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v7->_countLabel, "setTextColor:", v22);

  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7->_countLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[EKEventDetailAttendeesCell contentView](v7, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "addSubview:", v7->_countLabel);

  v24 = objc_alloc(MEMORY[0x1E0DC3890]);
  -[EKEventDetailAttendeesCell traitCollection](v7, "traitCollection");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  TableViewDisclosureIndicatorImage(v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v24, "initWithImage:", v26);
  disclosure = v7->_disclosure;
  v7->_disclosure = (UIImageView *)v27;

  -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v7->_disclosure, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[EKEventDetailAttendeesCell contentView](v7, "contentView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addSubview:", v7->_disclosure);

  -[EKEventDetailAttendeesCell _attendeesListView](v7, "_attendeesListView");
  v30 = objc_claimAutoreleasedReturnValue();
  attendeesListView = v7->_attendeesListView;
  v7->_attendeesListView = (EKEventDetailAttendeesListView *)v30;

  -[EKEventDetailAttendeesListView setTranslatesAutoresizingMaskIntoConstraints:](v7->_attendeesListView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[EKEventDetailAttendeesCell headerInset](v7, "headerInset");
  -[EKEventDetailAttendeesListView setBottomSpacingForSpinner:](v7->_attendeesListView, "setBottomSpacingForSpinner:");
  -[EKEventDetailAttendeesCell contentView](v7, "contentView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addSubview:", v7->_attendeesListView);

  v33 = (void *)MEMORY[0x1E0CB3718];
  v34 = v7->_titleLabel;
  -[EKEventDetailAttendeesCell headerInset](v7, "headerInset");
  objc_msgSend(v33, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v34, 11, 0, v7, 3, 1.0, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setActive:", 1);

  -[UILabel leadingAnchor](v7->_titleLabel, "leadingAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailAttendeesCell layoutMarginsGuide](v7, "layoutMarginsGuide");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "constraintEqualToAnchor:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setActive:", 1);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7->_countLabel, 11, 0, v7->_titleLabel, 11, 1.0, 0.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setActive:", 1);

  v42 = (void *)MEMORY[0x1E0CB3718];
  v43 = v7->_countLabel;
  v44 = v7->_disclosure;
  -[UILabel font](v43, "font");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "_scaledValueForValue:", -8.0);
  objc_msgSend(v42, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v43, 6, 0, v44, 5, 1.0, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setActive:", 1);

  -[UIImageView trailingAnchor](v7->_disclosure, "trailingAnchor");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailAttendeesCell layoutMarginsGuide](v7, "layoutMarginsGuide");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "trailingAnchor");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "constraintEqualToAnchor:", v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setActive:", 1);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7->_disclosure, 10, 0, v7->_titleLabel, 10, 1.0, 0.0);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setActive:", 1);

  v53 = (void *)MEMORY[0x1E0CB3718];
  v54 = v7->_attendeesListView;
  v55 = v7->_titleLabel;
  -[EKEventDetailAttendeesCell listToTitle](v7, "listToTitle");
  objc_msgSend(v53, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v54, 3, 0, v55, 11, 1.0, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setActive:", 1);

  v58 = (void *)MEMORY[0x1E0CB3718];
  v59 = v7->_attendeesListView;
  -[EKEventDetailAttendeesCell footerInset](v7, "footerInset");
  objc_msgSend(v58, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v59, 4, 0, v7, 4, 1.0, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setActive:", 1);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7->_attendeesListView, 5, 0, v7->_titleLabel, 5, 1.0, 0.0);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setActive:", 1);

  -[EKEventDetailAttendeesListView trailingAnchor](v7->_attendeesListView, "trailingAnchor");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKEventDetailAttendeesCell safeAreaLayoutGuide](v7, "safeAreaLayoutGuide");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "trailingAnchor");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "constraintEqualToAnchor:", v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "setActive:", 1);

  objc_msgSend(MEMORY[0x1E0CB3718], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v7->_attendeesListView, 8, 1, 0, 0, 1.0, 0.0);
  v67 = objc_claimAutoreleasedReturnValue();
  listHeight = v7->_listHeight;
  v7->_listHeight = (NSLayoutConstraint *)v67;

  v7->_loadingAttendees = 0;
  return v7;
}

- (double)headerInset
{
  void *v4;
  double v5;
  double v6;

  if (EKUIUnscaledCatalyst())
    return 21.0;
  -[UILabel font](self->_titleLabel, "font");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_scaledValueForValue:", 28.0);
  v6 = v5;

  return v6;
}

- (double)listToTitle
{
  void *v2;
  double v3;
  double v4;

  -[UILabel font](self->_titleLabel, "font");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 12.0);
  v4 = v3;

  return v4;
}

- (double)footerInset
{
  void *v2;
  double v3;
  double v4;

  -[UILabel font](self->_titleLabel, "font");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_scaledValueForValue:", 12.0);
  v4 = v3;

  return v4;
}

- (double)displayHeight
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;

  -[EKEventDetailAttendeesCellModel attendeesNotIncludingOrganizerOrLocationsOrResources](self->_model, "attendeesNotIncludingOrganizerOrLocationsOrResources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[EKEventDetailAttendeesCell headerInset](self, "headerInset");
  v6 = v5;
  if (v4)
  {
    -[EKEventDetailAttendeesCell footerInset](self, "footerInset");
    v8 = v6 + v7;
    -[EKEventDetailAttendeesListView intrinsicContentSize](self->_attendeesListView, "intrinsicContentSize");
    v10 = v8 + v9;
    -[EKEventDetailAttendeesCell listToTitle](self, "listToTitle");
    return v11 + v10;
  }
  else
  {
    -[UILabel font](self->_titleLabel, "font");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_scaledValueForValue:", 22.0);
    v12 = v6 + v14;

  }
  return v12;
}

- (BOOL)update
{
  EKEventDetailAttendeesCell *v2;
  void *v3;
  void *v4;
  double v5;
  double Width;
  double v7;
  CGRect v9;

  v2 = self;
  -[EKEventDetailAttendeesCell updateAttendees](self, "updateAttendees");
  -[EKEventDetailAttendeesCellModel attendeesNotIncludingOrganizerOrLocationsOrResources](v2->_model, "attendeesNotIncludingOrganizerOrLocationsOrResources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "count");
  CUIKLocalizedStringForInteger();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v2->_countLabel, "setText:", v4);

  -[EKEventDetailAttendeesListView intrinsicContentSize](v2->_attendeesListView, "intrinsicContentSize");
  -[NSLayoutConstraint setConstant:](v2->_listHeight, "setConstant:", v5);
  -[NSLayoutConstraint setActive:](v2->_listHeight, "setActive:", 1);
  -[EKEventDetailAttendeesCell bounds](v2, "bounds");
  Width = CGRectGetWidth(v9);
  -[EKEventDetailAttendeesCell displayHeight](v2, "displayHeight");
  -[EKEventDetailAttendeesCell setFrame:](v2, "setFrame:", 0.0, 0.0, Width, v7);
  LOBYTE(v2) = objc_msgSend(v3, "count") != 0;

  return (char)v2;
}

- (void)_attendeesDidFinishLoadingForTest
{
  id v2;

  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "isRunningTest"))
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:", CFSTR("EventDetailsDidFinishLoadingAndDisplayingAttendeesNotification"), 0);

  }
}

- (void)updateAttendees
{
  EKEventDetailAttendeesCellModel *model;
  BOOL v4;
  void *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  self->_loadingAttendees = 1;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  model = self->_model;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__EKEventDetailAttendeesCell_updateAttendees__block_invoke;
  v6[3] = &unk_1E6019A38;
  v6[4] = self;
  v6[5] = &v7;
  v4 = -[EKEventDetailAttendeesCellModel sortAttendeesWithCompletion:](model, "sortAttendeesWithCompletion:", v6);
  *((_BYTE *)v8 + 24) = !v4;
  if (!v4)
  {
    -[EKEventDetailAttendeesCell _attendeesListView](self, "_attendeesListView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "showSpinner");

  }
  _Block_object_dispose(&v7, 8);
}

void __45__EKEventDetailAttendeesCell_updateAttendees__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  unint64_t v25;

  v25 = a2;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v25 | v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "_attendeesListView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v14)
    {
      objc_msgSend(v15, "setUngrouped:", v14);
    }
    else
    {
      objc_msgSend(v15, "setInvitees:forStatus:", v25, 0);

      objc_msgSend(*(id *)(a1 + 32), "_attendeesListView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setInvitees:forStatus:", v11, 1);

      objc_msgSend(*(id *)(a1 + 32), "_attendeesListView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setInvitees:forStatus:", v12, 2);

      objc_msgSend(*(id *)(a1 + 32), "_attendeesListView");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setInvitees:forStatus:", v13, 3);
    }

    objc_msgSend(*(id *)(a1 + 32), "_attendeesListView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setGroupsNames:", v14 == 0);

    objc_msgSend(*(id *)(a1 + 32), "_attendeesListView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setup");

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1168) = 0;
    objc_msgSend(*(id *)(a1 + 32), "setNeedsDisplay");
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "attendeeCellDelegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "eventDetailAttendeeCellWantsRefreshForHeightChange");

    }
    objc_msgSend(*(id *)(a1 + 32), "_attendeesDidFinishLoadingForTest");
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      objc_msgSend(*(id *)(a1 + 32), "attendeeCellDelegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_opt_respondsToSelector();

      if ((v23 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "attendeeCellDelegate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "eventDetailAttendeeCellDidCompleteLoad:", *(_QWORD *)(a1 + 32));

      }
    }
  }

}

- (id)_attendeesListView
{
  EKEventDetailAttendeesListView *attendeesListView;
  EKEventDetailAttendeesListView *v4;
  EKEventDetailAttendeesListView *v5;
  EKEventDetailAttendeesListView *v6;
  EKEventDetailAttendeesListView *v7;
  void *v8;

  attendeesListView = self->_attendeesListView;
  if (!attendeesListView)
  {
    v4 = [EKEventDetailAttendeesListView alloc];
    v5 = -[EKEventDetailAttendeesListView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_attendeesListView;
    self->_attendeesListView = v5;

    -[EKEventDetailAttendeesListView setContentMode:](self->_attendeesListView, "setContentMode:", 3);
    v7 = self->_attendeesListView;
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKEventDetailAttendeesListView setTextColor:](v7, "setTextColor:", v8);

    -[EKEventDetailAttendeesListView setBackgroundColor:](self->_attendeesListView, "setBackgroundColor:", 0);
    -[EKEventDetailAttendeesListView setOpaque:](self->_attendeesListView, "setOpaque:", 0);
    attendeesListView = self->_attendeesListView;
  }
  return attendeesListView;
}

- (void)layoutForWidth:(double)a3 position:(int)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKEventDetailAttendeesCell;
  -[EKEventDetailCell layoutForWidth:position:](&v5, sel_layoutForWidth_position_, *(_QWORD *)&a4, a3);
  -[EKEventDetailAttendeesCell setNeedsDisplay](self, "setNeedsDisplay");
}

- (EKEventDetailAttendeeCellDelegate)attendeeCellDelegate
{
  return (EKEventDetailAttendeeCellDelegate *)objc_loadWeakRetained((id *)&self->_attendeeCellDelegate);
}

- (void)setAttendeeCellDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_attendeeCellDelegate, a3);
}

- (BOOL)loadingAttendees
{
  return self->_loadingAttendees;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_attendeeCellDelegate);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_attendeesListView, 0);
  objc_storeStrong((id *)&self->_listHeight, 0);
  objc_storeStrong((id *)&self->_disclosure, 0);
  objc_storeStrong((id *)&self->_countLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end
