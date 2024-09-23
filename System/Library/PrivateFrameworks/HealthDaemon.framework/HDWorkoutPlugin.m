@implementation HDWorkoutPlugin

- (NSString)pluginIdentifier
{
  return (NSString *)CFSTR("com.apple.health.WorkoutPlugin");
}

+ (BOOL)shouldLoadPluginForDaemon:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsWorkouts");

  return v4;
}

- (id)extensionForHealthDaemon:(id)a3
{
  id v3;
  HDWorkoutPluginDaemonExtension *v4;

  v3 = a3;
  v4 = -[HDWorkoutPluginDaemonExtension initWithDaemon:]([HDWorkoutPluginDaemonExtension alloc], "initWithDaemon:", v3);

  return v4;
}

- (id)extensionForProfile:(id)a3
{
  return 0;
}

@end
