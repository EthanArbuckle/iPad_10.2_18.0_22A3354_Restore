@implementation CNContactShareWithFamilyAction

- (id)title
{
  return CFSTR("Add to Downtime whitelist");
}

- (BOOL)isDestructive
{
  return 0;
}

- (BOOL)canPerformAction
{
  int v3;
  void *v4;
  void *v5;

  v3 = -[CNContactShareWithFamilyAction familySharedContainerExists](self, "familySharedContainerExists");
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0C972D8];
    -[CNContactAction contact](self, "contact");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v4, "isWhitelistedContact:", v5);

    LOBYTE(v3) = v4 ^ 1;
  }
  return v3;
}

- (void)performActionWithSender:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = *MEMORY[0x1E0D13738];
  -[CNContactAction mutableContact](self, "mutableContact", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDowntimeWhitelist:", v4);

  -[CNContactAction delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionDidFinish:", self);

}

- (BOOL)familySharedContainerExists
{
  return 1;
}

@end
