@implementation HDDaemon(HeartHealthDaemonPlugin)

- (id)heartDaemonExtension
{
  void *v4;
  void *v6;

  objc_msgSend(a1, "daemonExtensionWithIdentifier:", *MEMORY[0x1E0D2FB48]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDHeartDaemonExtension.m"), 71, CFSTR("Health Heart Daemon Extension should not be nil"));

  }
  return v4;
}

@end
