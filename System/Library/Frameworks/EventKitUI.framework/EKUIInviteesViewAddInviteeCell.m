@implementation EKUIInviteesViewAddInviteeCell

+ (id)labelText
{
  void *v2;
  void *v3;

  EventKitUIBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Cell title - Add Invitees"), CFSTR("Add Invitees"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (int64_t)accessoryType
{
  return 1;
}

@end
