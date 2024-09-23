@implementation MPRemoteCommandCenter(MPCCustomCommands)

- (id)debugCommand
{
  void *v2;

  objc_getAssociatedObject(a1, "debugCommand");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 99990);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, "debugCommand", v2, (void *)1);
  }
  return v2;
}

- (id)shareQueueCommand
{
  void *v2;

  objc_getAssociatedObject(a1, "shareQueueCommand");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(a1, "_createRemoteCommandWithConcreteClass:mediaRemoteType:", objc_opt_class(), 25020);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, "shareQueueCommand", v2, (void *)1);
  }
  return v2;
}

@end
