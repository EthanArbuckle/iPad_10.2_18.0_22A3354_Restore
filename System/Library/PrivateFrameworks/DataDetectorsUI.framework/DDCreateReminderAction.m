@implementation DDCreateReminderAction

- (id)localizedName
{
  return DDLocalizedString(CFSTR("Create Reminder"));
}

- (id)iconName
{
  return CFSTR("list.bullet");
}

- (int)interactionType
{
  return 1;
}

- (BOOL)canBePerformedByOpeningURL
{
  return 0;
}

+ (BOOL)isAvailable
{
  return +[DDRemoteActionViewController controllerIsAvailable](DDRemoteActionViewController, "controllerIsAvailable");
}

- (void)prepareViewControllerForActionController:(id)a3
{
  id v3;

  v3 = +[DDRemoteActionViewController prepareViewController:forAction:actionController:](DDRemoteActionViewController, "prepareViewController:forAction:actionController:", CFSTR("DDReminderViewController"), self, a3);
}

@end
