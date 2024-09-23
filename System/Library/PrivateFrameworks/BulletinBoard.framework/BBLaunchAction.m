@implementation BBLaunchAction

+ (id)launchActionWithURL:(id)a3 callblock:(id)a4
{
  return +[BBAction actionWithLaunchURL:callblock:](BBAction, "actionWithLaunchURL:callblock:", a3, a4);
}

+ (id)launchActionWithBundleID:(id)a3 callblock:(id)a4
{
  return +[BBAction actionWithLaunchBundleID:callblock:](BBAction, "actionWithLaunchBundleID:callblock:", a3, a4);
}

@end
