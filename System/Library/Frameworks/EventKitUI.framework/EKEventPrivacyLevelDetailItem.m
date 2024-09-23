@implementation EKEventPrivacyLevelDetailItem

- (void)setEvent:(id)a3 reminder:(id)a4 store:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKEventPrivacyLevelDetailItem;
  -[EKEventDetailItem setEvent:reminder:store:](&v6, sel_setEvent_reminder_store_, a3, a4, a5);
  self->_switchStateIsOn = -[EKEvent privacyLevel](self->super._event, "privacyLevel") != 0;
  -[UISwitch setOn:](self->_control, "setOn:");
}

- (BOOL)configureWithCalendar:(id)a3 preview:(BOOL)a4
{
  return -[EKEvent allowsPrivacyLevelModifications](self->super._event, "allowsPrivacyLevelModifications", a3, a4);
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  EKUITableViewCell *v4;
  UITableViewCell *cell;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UISwitch *v11;
  UISwitch *control;

  if (!self->_cell)
  {
    v4 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, 0);
    cell = self->_cell;
    self->_cell = &v4->super;

    EventKitUIBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Private"), &stru_1E601DFA8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell textLabel](self->_cell, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v7);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell textLabel](self->_cell, "textLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v9);

    -[UITableViewCell setSelectionStyle:](self->_cell, "setSelectionStyle:", 0);
    v11 = (UISwitch *)objc_alloc_init(MEMORY[0x1E0DC3D18]);
    control = self->_control;
    self->_control = v11;

    -[UISwitch addTarget:action:forControlEvents:](self->_control, "addTarget:action:forControlEvents:", self, sel__switchChanged_, 4096);
    -[UITableViewCell setAccessoryView:](self->_cell, "setAccessoryView:", self->_control);
  }
  -[UISwitch setOn:](self->_control, "setOn:", self->_switchStateIsOn);
  return self->_cell;
}

- (void)_switchChanged:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  EKEvent *event;
  NSObject *v10;
  void *v11;
  EKEvent *v12;
  int v13;
  void *v14;
  __int16 v15;
  EKEvent *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "isOn");
  self->_switchStateIsOn = v4;
  if (v4)
  {
    -[EKEvent calendar](self->super._event, "calendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "source");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "preferredEventPrivateValue");

  }
  else
  {
    v7 = 0;
  }
  -[EKEvent setPrivacyLevel:](self->super._event, "setPrivacyLevel:", v7);
  v8 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
  {
    event = self->super._event;
    v10 = v8;
    -[EKEvent privacyLevelString](event, "privacyLevelString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = self->super._event;
    v13 = 138412546;
    v14 = v11;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_1AF84D000, v10, OS_LOG_TYPE_INFO, "Setting the event's privacy level to [%@].  Event: [%@]", (uint8_t *)&v13, 0x16u);

  }
  -[EKEventDetailItem notifySubitemDidSave:](self, "notifySubitemDidSave:", 0);
  -[EKEventDetailItem editItemViewController:didCompleteWithAction:](self, "editItemViewController:didCompleteWithAction:", 0, 2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_control, 0);
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
