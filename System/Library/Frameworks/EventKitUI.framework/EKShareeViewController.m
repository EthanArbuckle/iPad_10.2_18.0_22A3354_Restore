@implementation EKShareeViewController

- (EKShareeViewController)initWithSharee:(id)a3
{
  id v4;
  EKShareeViewController *v5;
  EKShareeViewController *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)EKShareeViewController;
  v5 = -[EKShareeViewController initWithStyle:](&v10, sel_initWithStyle_, 2);
  v6 = v5;
  if (v5)
  {
    -[EKShareeViewController setSharee:](v5, "setSharee:", v4);
    -[EKShareeViewController sharee](v6, "sharee");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKShareeViewController setAllowEditing:](v6, "setAllowEditing:", objc_msgSend(v7, "shareeAccessLevel") == 2);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", v6, sel__contentSizeCategoryChanged_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v6;
}

- (void)_contentSizeCategoryChanged:(id)a3
{
  +[EKUILargeTextUtilities clearCache](EKUILargeTextUtilities, "clearCache", a3);
}

- (BOOL)_shouldDisplayResendInvitationButton
{
  return -[EKSharee shareeStatus](self->_sharee, "shareeStatus") != 1 && self->_allowResendInvitations;
}

- (BOOL)_shouldDisplayStopSharingButton
{
  return self->_allowStopSharing;
}

- (int)_subitemAtRow:(int64_t)a3
{
  uint64_t v5;
  int64_t v6;

  LODWORD(v5) = !-[EKShareeViewController _shouldDisplayResendInvitationButton](self, "_shouldDisplayResendInvitationButton");
  if (a3 > 1)
    v5 = v5;
  else
    v5 = 0;
  v6 = v5
     + a3
     + ((v5 + a3 > 2) & ~-[EKShareeViewController _shouldDisplayStopSharingButton](self, "_shouldDisplayStopSharingButton"));
  return v6 + ((v6 > 3) & ~-[EKShareeViewController allowLocalDelete](self, "allowLocalDelete"));
}

- (void)_reloadTitle
{
  void *v3;
  id v4;

  -[EKShareeViewController sharee](self, "sharee");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  DisplayStringForIdentity((uint64_t)v4, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKShareeViewController setTitle:](self, "setTitle:", v3);

}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKShareeViewController;
  -[EKShareeViewController loadView](&v3, sel_loadView);
  -[EKShareeViewController _reloadTitle](self, "_reloadTitle");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EKShareeViewController;
  -[EKShareeViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[EKShareeViewController _reloadTitle](self, "_reloadTitle");
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lineHeight");
  v6 = v5;
  -[EKShareeViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEstimatedRowHeight:", v6);

  -[EKShareeViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadData");

}

- (void)setAllowEditing:(BOOL)a3
{
  self->_allowEditing = a3;
}

- (void)_allowEditingChanged:(id)a3
{
  uint64_t v4;
  void *v5;
  id WeakRetained;
  char v7;
  id v8;
  id v9;

  v9 = a3;
  if (v9)
    -[EKShareeViewController setAllowEditing:](self, "setAllowEditing:", objc_msgSend(v9, "isOn"));
  if (-[EKShareeViewController allowEditing](self, "allowEditing"))
    v4 = 2;
  else
    v4 = 1;
  -[EKShareeViewController sharee](self, "sharee");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShareeAccessLevel:", v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v8, "shareeViewControllerDidChangeAccessLevel:", self);

  }
}

- (CGSize)preferredContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[EKShareeViewController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sizeThatFits:", EKUIContainedControllerIdealWidth(), 1100.0);
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  uint64_t v4;
  uint64_t v5;

  if (-[EKShareeViewController _shouldDisplayResendInvitationButton](self, "_shouldDisplayResendInvitationButton", a3))
    v4 = 3;
  else
    v4 = 2;
  v5 = v4 + -[EKShareeViewController _shouldDisplayStopSharingButton](self, "_shouldDisplayStopSharingButton");
  return v5 + -[EKShareeViewController allowLocalDelete](self, "allowLocalDelete");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  AddressCardTableViewCell *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
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
  EKUILabeledAvatarView *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
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
  void *v42;
  const __CFString *v43;
  void *v44;
  void *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  EKUILabeledAvatarView *v66;
  void *v67;

  switch(-[EKShareeViewController _subitemAtRow:](self, "_subitemAtRow:", objc_msgSend(a4, "section", a3)))
  {
    case 0:
      v5 = -[AddressCardTableViewCell initWithStyle:reuseIdentifier:]([AddressCardTableViewCell alloc], "initWithStyle:reuseIdentifier:", 3, CFSTR("addressCard"));
      -[AddressCardTableViewCell setAccessoryType:](v5, "setAccessoryType:", 1);
      -[EKShareeViewController sharee](self, "sharee");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      DisplayStringForIdentity((uint64_t)v6, 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      DisplayAddressForIdentity(v6);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "length");
      -[AddressCardTableViewCell textLabel](v5, "textLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v9)
      {
        objc_msgSend(v10, "setText:", v7);

        -[AddressCardTableViewCell detailTextLabel](v5, "detailTextLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v67 = (void *)v8;
      objc_msgSend(v11, "setText:", v8);

      -[AddressCardTableViewCell textLabel](v5, "textLabel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHidden:", 1);

      -[AddressCardTableViewCell detailTextLabel](v5, "detailTextLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHidden:", 1);

      v14 = (void *)objc_opt_new();
      -[AddressCardTableViewCell textLabel](v5, "textLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "font");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setFont:", v16);

      -[AddressCardTableViewCell textLabel](v5, "textLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "text");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setText:", v18);

      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setTextColor:", v19);

      objc_msgSend(v14, "setNumberOfLines:", 1);
      objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v20 = -[EKUILabeledAvatarView initWithIdentity:placement:options:]([EKUILabeledAvatarView alloc], "initWithIdentity:placement:options:", v6, 0, 0);
      -[EKUILabeledAvatarView setTranslatesAutoresizingMaskIntoConstraints:](v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[AddressCardTableViewCell contentView](v5, "contentView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addSubview:", v14);

      -[AddressCardTableViewCell contentView](v5, "contentView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addSubview:", v20);

      v23 = 0x1E0CB3000uLL;
      if (objc_msgSend(v7, "length"))
      {
        v24 = (void *)objc_opt_new();
        -[AddressCardTableViewCell detailTextLabel](v5, "detailTextLabel");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "font");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setFont:", v26);

        -[AddressCardTableViewCell detailTextLabel](v5, "detailTextLabel");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "text");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setText:", v28);

        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setTextColor:", v29);

        objc_msgSend(v24, "setNumberOfLines:", 1);
        objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        -[AddressCardTableViewCell contentView](v5, "contentView");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "addSubview:", v24);

        _NSDictionaryOfVariableBindings(CFSTR("title,avatar,address"), v14, v20, v24, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = (void *)MEMORY[0x1E0CB3718];
        objc_msgSend(MEMORY[0x1E0CB3718], "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[avatar(==37)]-(12)-[address]-|"), 0, 0, v31);
        v66 = v20;
        v33 = v7;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "activateConstraints:", v34);

        objc_msgSend(v24, "firstBaselineAnchor");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[AddressCardTableViewCell detailTextLabel](v5, "detailTextLabel");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "firstBaselineAnchor");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "constraintEqualToAnchor:constant:", v37, 0.0);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "setActive:", 1);

        v7 = v33;
        v20 = v66;

        v23 = 0x1E0CB3000;
      }
      else
      {
        _NSDictionaryOfVariableBindings(CFSTR("title,avatar"), v14, v20, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v53 = *(void **)(v23 + 1816);
      objc_msgSend(v53, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|-[avatar(==37)]-(12)-[title]-|"), 0, 0, v31);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "activateConstraints:", v54);

      v55 = *(void **)(v23 + 1816);
      objc_msgSend(v55, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(>=0)-[avatar]-(>=0)-|"), 0, 0, v31);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "activateConstraints:", v56);

      objc_msgSend(v14, "firstBaselineAnchor");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[AddressCardTableViewCell textLabel](v5, "textLabel");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "firstBaselineAnchor");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "constraintEqualToAnchor:constant:", v59, 0.0);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setActive:", 1);

      -[EKUILabeledAvatarView centerYAnchor](v20, "centerYAnchor");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[AddressCardTableViewCell contentView](v5, "contentView");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "centerYAnchor");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "constraintEqualToAnchor:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "setActive:", 1);

      goto LABEL_15;
    case 1:
      v6 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
      objc_msgSend(v6, "setOn:", self->_allowEditing);
      objc_msgSend(v6, "addTarget:action:forControlEvents:", self, sel__allowEditingChanged_, 4096);
      v5 = (AddressCardTableViewCell *)objc_alloc_init(MEMORY[0x1E0DC3D50]);
      -[AddressCardTableViewCell setAccessoryView:](v5, "setAccessoryView:", v6);
      EventKitUIBundle();
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("Allow Editing"), &stru_1E601DFA8, 0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[AddressCardTableViewCell textLabel](v5, "textLabel");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setText:", v40);

      -[AddressCardTableViewCell setSelectionStyle:](v5, "setSelectionStyle:", 0);
      goto LABEL_15;
    case 2:
      v5 = -[EKUICenteredTextTableViewCell initWithStyle:reuseIdentifier:]([EKUICenteredTextTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("resendInvitation"));
      -[AddressCardTableViewCell setAccessoryType:](v5, "setAccessoryType:", 0);
      EventKitUIBundle();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v42;
      v43 = CFSTR("Resend Sharing Invitation");
      goto LABEL_10;
    case 3:
      v5 = -[EKUICenteredTextTableViewCell initWithStyle:reuseIdentifier:]([EKUICenteredTextTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "tableCellGroupedBackgroundColor");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[AddressCardTableViewCell setBackgroundColor:](v5, "setBackgroundColor:", v44);

      objc_msgSend(MEMORY[0x1E0DC3658], "_systemDestructiveTintColor");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      -[AddressCardTableViewCell textLabel](v5, "textLabel");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "setTextColor:", v45);

      EventKitUIBundle();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v42;
      v43 = CFSTR("Stop Sharing");
LABEL_10:
      v47 = &stru_1E601DFA8;
      goto LABEL_12;
    case 4:
      v5 = -[EKUICenteredTextTableViewCell initWithStyle:reuseIdentifier:]([EKUICenteredTextTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
      objc_msgSend(MEMORY[0x1E0DC3658], "tableCellGroupedBackgroundColor");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[AddressCardTableViewCell setBackgroundColor:](v5, "setBackgroundColor:", v48);

      objc_msgSend(MEMORY[0x1E0DC3658], "_systemDestructiveTintColor");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[AddressCardTableViewCell textLabel](v5, "textLabel");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setTextColor:", v49);

      EventKitUIBundle();
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v42;
      v43 = CFSTR("DeleteCalendarSharee");
      v47 = CFSTR("Delete");
LABEL_12:
      objc_msgSend(v42, "localizedStringForKey:value:table:", v43, v47, 0);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[AddressCardTableViewCell textLabel](v5, "textLabel");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setText:", v51);

LABEL_15:
      break;
    default:
      v5 = 0;
      break;
  }
  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  if (-[EKShareeViewController _subitemAtRow:](self, "_subitemAtRow:", a4) == 1)
  {
    EventKitUIBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Allow this person to make changes to the calendar."), &stru_1E601DFA8, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double v4;
  id v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  int v11;
  double v12;
  double v13;

  v7 = a3;
  v8 = a4;
  -[EKShareeViewController traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = EKUIUsesLargeTextLayout(v9);

  if (!v10)
  {
    v11 = -[EKShareeViewController _subitemAtRow:](self, "_subitemAtRow:", objc_msgSend(v8, "section"));
    if ((v11 - 1) < 2)
    {
      v13 = 45.0;
    }
    else
    {
      if ((v11 - 3) < 2)
      {
        objc_msgSend(v7, "rowHeight");
LABEL_10:
        v4 = v12;
        goto LABEL_11;
      }
      if (v11)
        goto LABEL_11;
      v13 = 63.0;
    }
    +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:", 0, v13);
    goto LABEL_10;
  }
  v4 = *MEMORY[0x1E0DC53D8];
LABEL_11:

  return v4;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  void *v6;
  _BOOL4 v7;
  double result;

  -[EKShareeViewController traitCollection](self, "traitCollection", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = EKUIUsesLargeTextLayout(v6);

  if (v7 || -[EKShareeViewController _subitemAtRow:](self, "_subitemAtRow:", a4) != 2)
    return *MEMORY[0x1E0DC53D8];
  +[EKUILargeTextUtilities contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:](EKUILargeTextUtilities, "contentSizeCategoryScaledValueForDefaultValue:shouldScaleForSmallerSizes:", 0, 28.0);
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  EKIdentityViewController *v5;
  void *v6;
  EKIdentityViewController *v7;
  void *v8;
  void *v9;
  id WeakRetained;
  char v11;
  id v12;

  v12 = a4;
  switch(-[EKShareeViewController _subitemAtRow:](self, "_subitemAtRow:", objc_msgSend(v12, "section")))
  {
    case 0:
      v5 = [EKIdentityViewController alloc];
      -[EKShareeViewController sharee](self, "sharee");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[EKIdentityViewController initWithIdentity:](v5, "initWithIdentity:", v6);

      -[EKShareeViewController navigationController](self, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "pushViewController:animated:", v7, 1);

      goto LABEL_8;
    case 2:
      -[EKShareeViewController tableView](self, "tableView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "selectRowAtIndexPath:animated:scrollPosition:", 0, 1, 0);

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) == 0)
        break;
      v7 = (EKIdentityViewController *)objc_loadWeakRetained((id *)&self->_delegate);
      -[EKIdentityViewController shareeViewController:didCompleteWithAction:](v7, "shareeViewController:didCompleteWithAction:", self, 1);
      goto LABEL_8;
    case 3:
      -[EKShareeViewController removeClicked:](self, "removeClicked:", 0);
      goto LABEL_7;
    case 4:
      -[EKShareeViewController localDeleteTapped](self, "localDeleteTapped");
LABEL_7:
      -[EKShareeViewController tableView](self, "tableView");
      v7 = (EKIdentityViewController *)objc_claimAutoreleasedReturnValue();
      -[EKIdentityViewController deselectRowAtIndexPath:animated:](v7, "deselectRowAtIndexPath:animated:", v12, 1);
LABEL_8:

      break;
    default:
      break;
  }

}

- (void)removeClicked:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UIAlertController *v11;
  UIAlertController *removeAlertController;
  UIAlertController *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  UIAlertController *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[5];

  -[EKShareeViewController sharee](self, "sharee", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  DisplayStringForIdentity((uint64_t)v4, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC3450];
  v7 = (void *)MEMORY[0x1E0CB3940];
  EventKitUIBundle();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("%@ will immediately lose access to this calendar."), &stru_1E601DFA8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertControllerWithTitle:message:preferredStyle:", v10, 0, 0);
  v11 = (UIAlertController *)objc_claimAutoreleasedReturnValue();
  removeAlertController = self->_removeAlertController;
  self->_removeAlertController = v11;

  v13 = self->_removeAlertController;
  v14 = (void *)MEMORY[0x1E0DC3448];
  EventKitUIBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Remove"), &stru_1E601DFA8, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __40__EKShareeViewController_removeClicked___block_invoke;
  v23[3] = &unk_1E60185C0;
  v23[4] = self;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 2, v23);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertController addAction:](v13, "addAction:", v17);

  v18 = self->_removeAlertController;
  v19 = (void *)MEMORY[0x1E0DC3448];
  EventKitUIBundle();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("Cancel - remove clicked"), CFSTR("Cancel"), 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 1, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIAlertController addAction:](v18, "addAction:", v22);

  -[EKShareeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_removeAlertController, 1, 0);
}

void __40__EKShareeViewController_removeClicked___block_invoke(uint64_t a1)
{
  id WeakRetained;
  char v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1040));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v4 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1040));
    objc_msgSend(v4, "shareeViewController:didCompleteWithAction:", *(_QWORD *)(a1 + 32), 0);

  }
}

- (void)localDeleteTapped
{
  EKShareeViewControllerDelegate **p_delegate;
  id WeakRetained;
  char v5;
  id v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v6, "shareeViewController:didCompleteWithAction:", self, 2);

  }
}

- (EKSharee)sharee
{
  return self->_sharee;
}

- (void)setSharee:(id)a3
{
  objc_storeStrong((id *)&self->_sharee, a3);
}

- (BOOL)allowEditing
{
  return self->_allowEditing;
}

- (BOOL)allowStopSharing
{
  return self->_allowStopSharing;
}

- (void)setAllowStopSharing:(BOOL)a3
{
  self->_allowStopSharing = a3;
}

- (BOOL)allowResendInvitations
{
  return self->_allowResendInvitations;
}

- (void)setAllowResendInvitations:(BOOL)a3
{
  self->_allowResendInvitations = a3;
}

- (BOOL)allowLocalDelete
{
  return self->_allowLocalDelete;
}

- (void)setAllowLocalDelete:(BOOL)a3
{
  self->_allowLocalDelete = a3;
}

- (EKShareeViewControllerDelegate)delegate
{
  return (EKShareeViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sharee, 0);
  objc_storeStrong((id *)&self->_removeAlertController, 0);
}

@end
