@implementation EKEventPrivacyLevelInlineEditItem

- (BOOL)isInline
{
  return 1;
}

- (unint64_t)onSaveEditorReloadBehavior
{
  return 1;
}

- (BOOL)canBeConfiguredForCalendarConstraints:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  uint64_t v7;

  v3 = a3;
  objc_msgSend(v3, "source");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "supportsPrivateEvents");

  v7 = objc_msgSend(v3, "sharingStatus");
  if (v7 == 2)
    return 0;
  else
    return v6;
}

- (BOOL)shouldAppear
{
  void *v2;
  char v3;

  -[EKEventEditItem event](self, "event");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsPrivacyLevelModifications");

  return v3;
}

- (void)refreshFromCalendarItemAndStore
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  const __CFString *v8;
  id v9;
  int v10;
  void *v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[EKEventEditItem event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "privacyLevel");

  self->_originalSwitchState = v4 != 0;
  self->_currentSwitchState = v4 != 0;
  v5 = (void *)kEKUILogEventEditorHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogEventEditorHandle, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    if (self->_currentSwitchState)
      v8 = CFSTR("YES");
    else
      v8 = CFSTR("NO");
    v10 = 138412546;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v9 = v7;
    _os_log_impl(&dword_1AF84D000, v6, OS_LOG_TYPE_INFO, "Refreshed [%@].  Original toggle state: [%@]", (uint8_t *)&v10, 0x16u);

  }
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  EKUITableViewCell *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = -[EKUITableViewCell initWithStyle:reuseIdentifier:]([EKUITableViewCell alloc], "initWithStyle:reuseIdentifier:", 1, 0);
  v5 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
  objc_msgSend(v5, "addTarget:action:forControlEvents:", self, sel__switchChanged_, 4096);
  objc_msgSend(v5, "setOn:", self->_originalSwitchState);
  -[EKUITableViewCell setAccessoryView:](v4, "setAccessoryView:", v5);
  EventKitUIBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Private"), &stru_1E601DFA8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKUITableViewCell textLabel](v4, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v7);

  return v4;
}

- (BOOL)saveAndDismissWithForce:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_currentSwitchState != self->_originalSwitchState)
  {
    if (self->_currentSwitchState)
    {
      -[EKEventEditItem event](self, "event", a3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "calendar");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "source");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "preferredEventPrivateValue");

    }
    else
    {
      v7 = 0;
    }
    -[EKEventEditItem event](self, "event");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPrivacyLevel:", v7);

    v9 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
    {
      v10 = v9;
      -[EKEventEditItem event](self, "event");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "privacyLevelString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[EKEventEditItem event](self, "event");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_1AF84D000, v10, OS_LOG_TYPE_INFO, "Setting the event's privacy level to [%@].  Event: [%@]", (uint8_t *)&v15, 0x16u);

    }
    self->_originalSwitchState = self->_currentSwitchState;
  }
  -[EKCalendarItemEditItem notifySubitemDidSave:](self, "notifySubitemDidSave:", 0);
  return 1;
}

- (double)footerHeightForWidth:(double)a3
{
  double result;

  result = *MEMORY[0x1E0DC53D8];
  if (!self->_currentSwitchState)
    return 0.0;
  return result;
}

- (id)footerTitle
{
  void *v2;
  void *v3;

  if (self->_currentSwitchState)
  {
    EventKitUIBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("The title, location, and details of private events are not visible to others sharing this calendar."), &stru_1E601DFA8, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_switchChanged:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  const __CFString *v7;
  id v8;
  int v9;
  void *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  self->_currentSwitchState = objc_msgSend(a3, "isOn");
  -[EKCalendarItemEditItem notifyDidStartEditing](self, "notifyDidStartEditing");
  -[EKCalendarItemEditItem notifyDidEndEditing](self, "notifyDidEndEditing");
  v4 = (void *)kEKUILogHandle;
  if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
  {
    v5 = v4;
    v6 = (void *)objc_opt_class();
    if (self->_currentSwitchState)
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    v9 = 138412546;
    v10 = v6;
    v11 = 2112;
    v12 = v7;
    v8 = v6;
    _os_log_impl(&dword_1AF84D000, v5, OS_LOG_TYPE_INFO, "[%@] toggle switched to [%@].", (uint8_t *)&v9, 0x16u);

  }
}

@end
