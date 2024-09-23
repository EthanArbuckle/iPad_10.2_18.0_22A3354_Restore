@implementation HUUserManagementUserCell

- (HUUserManagementUserCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HUUserManagementUserCell *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HUUserManagementUserCell;
  v4 = -[HUUserManagementUserCell initWithStyle:reuseIdentifier:](&v10, sel_initWithStyle_reuseIdentifier_, 1, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUserManagementUserCell textLabel](v4, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextColor:", v5);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemLightGrayColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUserManagementUserCell detailTextLabel](v4, "detailTextLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v7);

    -[HUUserManagementUserCell setAccessoryType:](v4, "setAccessoryType:", 1);
    -[HUUserManagementUserCell setSelectionStyle:](v4, "setSelectionStyle:", 3);
  }
  return v4;
}

- (void)setDisplayName:(id)a3
{
  void *v5;
  NSString *v6;

  v6 = (NSString *)a3;
  if (self->_displayName != v6)
  {
    objc_storeStrong((id *)&self->_displayName, a3);
    -[HUUserManagementUserCell textLabel](self, "textLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v6);

  }
}

- (void)setInvitationStatusString:(id)a3
{
  void *v5;
  NSString *v6;

  v6 = (NSString *)a3;
  if (self->_invitationStatusString != v6)
  {
    objc_storeStrong((id *)&self->_invitationStatusString, a3);
    -[HUUserManagementUserCell detailTextLabel](self, "detailTextLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v6);

  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HUUserManagementUserCell;
  -[HUUserManagementUserCell layoutSubviews](&v13, sel_layoutSubviews);
  -[HUUserManagementUserCell textLabel](self, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[HUUserManagementUserCell textLabel](self, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7 + -1.0, v9, v11);

}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSString)invitationStatusString
{
  return self->_invitationStatusString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationStatusString, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
