@implementation RWIProtocolPageDomainEventDispatcher(IKJSDependency)

- (void)safe_frameNavigatedWithFrame:()IKJSDependency
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8[0] = &v7;
  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("frameNavigatedWithFrame:"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "retainArguments");
  objc_msgSend(v6, "invokeWithTarget:", a1);

}

- (void)safe_frameScheduledNavigationWithFrameId:()IKJSDependency delay:
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a4;
  v10[0] = &v9;
  v10[1] = &v8;
  v5 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("frameScheduledNavigationWithFrameId:delay:"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "retainArguments");
  objc_msgSend(v7, "invokeWithTarget:", a1);

}

- (void)safe_loadEventFiredWithTimestamp:()IKJSDependency
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7[0] = &v6;
  v3 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("loadEventFiredWithTimestamp:"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "retainArguments");
  objc_msgSend(v5, "invokeWithTarget:", a1);

}

- (void)safe_domContentEventFiredWithTimestamp:()IKJSDependency
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7[0] = &v6;
  v3 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("domContentEventFiredWithTimestamp:"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "retainArguments");
  objc_msgSend(v5, "invokeWithTarget:", a1);

}

- (void)safe_frameStartedLoadingWithFrameId:()IKJSDependency
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8[0] = &v7;
  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("frameStartedLoadingWithFrameId:"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "retainArguments");
  objc_msgSend(v6, "invokeWithTarget:", a1);

}

- (void)safe_frameDetachedWithFrameId:()IKJSDependency
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8[0] = &v7;
  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("frameDetachedWithFrameId:"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "retainArguments");
  objc_msgSend(v6, "invokeWithTarget:", a1);

}

- (void)safe_frameClearedScheduledNavigationWithFrameId:()IKJSDependency
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8[0] = &v7;
  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("frameClearedScheduledNavigationWithFrameId:"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "retainArguments");
  objc_msgSend(v6, "invokeWithTarget:", a1);

}

- (void)safe_frameStoppedLoadingWithFrameId:()IKJSDependency
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8[0] = &v7;
  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("frameStoppedLoadingWithFrameId:"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "retainArguments");
  objc_msgSend(v6, "invokeWithTarget:", a1);

}

@end
