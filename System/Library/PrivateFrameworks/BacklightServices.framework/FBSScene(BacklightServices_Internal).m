@implementation FBSScene(BacklightServices_Internal)

- (id)backlightSceneEnvironmentWithCreationBlock:()BacklightServices_Internal
{
  void (**v4)(_QWORD);
  id v5;
  void *v6;

  v4 = a3;
  v5 = a1;
  objc_sync_enter(v5);
  objc_getAssociatedObject(v5, sel_backlightSceneEnvironment);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v4[2](v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v5, sel_backlightSceneEnvironment, v6, (void *)0x301);
  }
  objc_sync_exit(v5);

  return v6;
}

@end
