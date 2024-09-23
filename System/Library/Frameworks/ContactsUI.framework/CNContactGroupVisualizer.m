@implementation CNContactGroupVisualizer

+ (id)allContactsSettingsViewController
{
  return (id)objc_msgSend((id)objc_opt_class(), "allContactsSettingsViewControllerLimitMaxContactsCount:", 0xFFFFFFFFLL);
}

+ (id)allContactsSettingsViewControllerLimitMaxContactsCount:(int)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "hostingControllerForType:contacts:limitMaxContactsCount:", 0, 0, *(_QWORD *)&a3);
}

+ (id)allContactsOnboardingViewController
{
  return (id)objc_msgSend((id)objc_opt_class(), "allContactsOnboardingViewControllerLimitMaxContactsCount:", 0xFFFFFFFFLL);
}

+ (id)allContactsOnboardingViewControllerLimitMaxContactsCount:(int)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "hostingControllerForType:contacts:limitMaxContactsCount:", 1, 0, *(_QWORD *)&a3);
}

+ (id)viewControllerForContacts:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "viewControllerForContacts:limitMaxContactsCount:", v3, 0xFFFFFFFFLL);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)viewControllerForContacts:(id)a3 limitMaxContactsCount:(int)a4
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  objc_msgSend((id)objc_opt_class(), "hostingControllerForType:contacts:limitMaxContactsCount:", 2, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)hostingControllerForType:(int64_t)a3 contacts:(id)a4 limitMaxContactsCount:(int)a5
{
  id v7;
  _TtC10ContactsUI35CNContactGroupVisualizerViewWrapper *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v7 = a4;
  v8 = [_TtC10ContactsUI35CNContactGroupVisualizerViewWrapper alloc];
  if (a5 < 1)
    v9 = -[CNContactGroupVisualizerViewWrapper initWithType:contacts:](v8, "initWithType:contacts:", a3, v7);
  else
    v9 = -[CNContactGroupVisualizerViewWrapper initWithType:contacts:limitContactsCount:](v8, "initWithType:contacts:limitContactsCount:", a3, v7, a5);
  v10 = (void *)v9;

  objc_msgSend(v10, "hostingController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
