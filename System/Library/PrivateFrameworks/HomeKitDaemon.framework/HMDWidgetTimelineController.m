@implementation HMDWidgetTimelineController

- (id)reloadTimelineWithExtensionBundleIdentifier:(id)a3 kind:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE16A10]), "initWithExtensionBundleIdentifier:kind:", v8, v9);
    objc_msgSend(v11, "reloadTimelineWithReason:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

@end
