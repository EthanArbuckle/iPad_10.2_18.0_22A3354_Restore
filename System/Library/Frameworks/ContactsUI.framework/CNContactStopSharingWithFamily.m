@implementation CNContactStopSharingWithFamily

- (BOOL)canPerformAction
{
  _BOOL4 v3;
  void *v4;
  void *v5;

  v3 = -[CNContactStopSharingWithFamily familySharedContainerExists](self, "familySharedContainerExists");
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C972D8];
    -[CNContactAction contact](self, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v4, "isWhitelistedContact:", v5);

    LOBYTE(v3) = (_BYTE)v4;
  }
  return v3;
}

- (BOOL)familySharedContainerExists
{
  return 1;
}

- (id)title
{
  void *v2;
  void *v3;

  CNContactsUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("REMOVE_FROM_DOWNTIME_ACTION_TITLE"), &stru_1E20507A8, CFSTR("Localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)wrapTitle
{
  return 1;
}

- (BOOL)isDestructive
{
  return 1;
}

- (void)performActionWithSender:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = *MEMORY[0x1E0D13740];
  -[CNContactAction mutableContact](self, "mutableContact", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDowntimeWhitelist:", v4);

  -[CNContactAction delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionDidFinish:", self);

}

@end
