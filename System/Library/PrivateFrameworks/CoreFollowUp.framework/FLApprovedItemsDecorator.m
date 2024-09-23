@implementation FLApprovedItemsDecorator

+ (void)decorateUnknownItem:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  id v7;
  id v8;

  v8 = a3;
  +[FLEnvironment currentEnvironment](FLEnvironment, "currentEnvironment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isInternal") & 1) == 0)
  {

    v7 = v8;
    goto LABEL_5;
  }
  +[FLEnvironment currentEnvironment](FLEnvironment, "currentEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldShowUnapprovedItems");

  v7 = v8;
  if (!v6)
  {
LABEL_5:
    objc_msgSend(a1, "_updateForExternalUsage:", v7);
    goto LABEL_6;
  }
  objc_msgSend(a1, "_updateForInternalUsage:", v8);
LABEL_6:

}

+ (void)_updateForInternalUsage:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v11 = a3;
  objc_msgSend(v11, "informativeText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@\n%@"), CFSTR("**Internal Only - Follow Up not approved**"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInformativeText:", v5);

  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v11, "notification");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@\n%@"), CFSTR("**Internal Only - Follow Up not approved**"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "notification");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v9);

  objc_msgSend(v11, "setGroupIdentifier:", CFSTR("com.apple.followup.group.unknown"));
}

+ (void)_updateForExternalUsage:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setTargetBundleIdentifier:", 0);
  objc_msgSend(v3, "setNotification:", 0);

}

@end
