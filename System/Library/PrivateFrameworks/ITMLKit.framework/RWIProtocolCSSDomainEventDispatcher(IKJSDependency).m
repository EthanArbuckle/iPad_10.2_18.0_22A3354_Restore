@implementation RWIProtocolCSSDomainEventDispatcher(IKJSDependency)

- (void)safe_styleSheetChangedWithStyleSheetId:()IKJSDependency
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
  objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("styleSheetChangedWithStyleSheetId:"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "retainArguments");
  objc_msgSend(v6, "invokeWithTarget:", a1);

}

- (void)safe_nodeLayoutFlagsChangedWithNodeId:()IKJSDependency layoutFlags:
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v8 = a4;
  v10[0] = &v9;
  v10[1] = &v8;
  v5 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("nodeLayoutFlagsChangedWithNodeId:layoutFlags:"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "retainArguments");
  objc_msgSend(v7, "invokeWithTarget:", a1);

}

- (void)safe_mediaQueryResultChanged
{
  void *v2;
  void *v3;
  void *v4;
  _BYTE v5[8];

  v2 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("mediaQueryResultChanged"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "retainArguments");
  objc_msgSend(v4, "invokeWithTarget:", a1);

}

- (void)safe_styleSheetAddedWithHeader:()IKJSDependency
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
  objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("styleSheetAddedWithHeader:"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "retainArguments");
  objc_msgSend(v6, "invokeWithTarget:", a1);

}

- (void)safe_styleSheetRemovedWithStyleSheetId:()IKJSDependency
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
  objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("styleSheetRemovedWithStyleSheetId:"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "retainArguments");
  objc_msgSend(v6, "invokeWithTarget:", a1);

}

@end
