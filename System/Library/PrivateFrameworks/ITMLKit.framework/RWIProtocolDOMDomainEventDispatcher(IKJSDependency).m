@implementation RWIProtocolDOMDomainEventDispatcher(IKJSDependency)

- (void)safe_childNodeInsertedWithParentNodeId:()IKJSDependency previousNodeId:node:
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  int v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a3;
  v9 = a5;
  v12[0] = &v11;
  v12[1] = &v10;
  v12[2] = &v9;
  v6 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("childNodeInsertedWithParentNodeId:previousNodeId:node:"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "retainArguments");
  objc_msgSend(v8, "invokeWithTarget:", a1);

}

- (void)safe_childNodeRemovedWithParentNodeId:()IKJSDependency nodeId:
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  v10[0] = &v9;
  v10[1] = &v8;
  v5 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("childNodeRemovedWithParentNodeId:nodeId:"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "retainArguments");
  objc_msgSend(v7, "invokeWithTarget:", a1);

}

- (void)safe_didFireEventWithNodeId:()IKJSDependency eventName:timestamp:data:
{
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  id v14;
  int v15;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v14 = a5;
  v13 = a2;
  v12 = a6;
  v16[0] = &v15;
  v16[1] = &v14;
  v16[2] = &v13;
  v16[3] = &v12;
  v9 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("didFireEventWithNodeId:eventName:timestamp:data:"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "retainArguments");
  objc_msgSend(v11, "invokeWithTarget:", a1);

}

- (void)safe_didAddEventListenerWithNodeId:()IKJSDependency
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8[0] = &v7;
  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("didAddEventListenerWithNodeId:"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "retainArguments");
  objc_msgSend(v6, "invokeWithTarget:", a1);

}

- (void)safe_characterDataModifiedWithNodeId:()IKJSDependency characterData:
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
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
  objc_msgSend(v5, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("characterDataModifiedWithNodeId:characterData:"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "retainArguments");
  objc_msgSend(v7, "invokeWithTarget:", a1);

}

- (void)safe_pseudoElementRemovedWithParentId:()IKJSDependency pseudoElementId:
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  v10[0] = &v9;
  v10[1] = &v8;
  v5 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("pseudoElementRemovedWithParentId:pseudoElementId:"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "retainArguments");
  objc_msgSend(v7, "invokeWithTarget:", a1);

}

- (void)safe_documentUpdated
{
  void *v2;
  void *v3;
  void *v4;
  _BYTE v5[8];

  v2 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("documentUpdated"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "retainArguments");
  objc_msgSend(v4, "invokeWithTarget:", a1);

}

- (void)safe_powerEfficientPlaybackStateChangedWithNodeId:()IKJSDependency timestamp:isPowerEfficient:
{
  void *v6;
  void *v7;
  void *v8;
  char v9;
  double v10;
  int v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v10 = a2;
  v9 = a5;
  v12[0] = &v11;
  v12[1] = &v10;
  v12[2] = &v9;
  v6 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("powerEfficientPlaybackStateChangedWithNodeId:timestamp:isPowerEfficient:"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "retainArguments");
  objc_msgSend(v8, "invokeWithTarget:", a1);

}

- (void)safe_inspectWithNodeId:()IKJSDependency
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8[0] = &v7;
  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("inspectWithNodeId:"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "retainArguments");
  objc_msgSend(v6, "invokeWithTarget:", a1);

}

- (void)safe_willDestroyDOMNodeWithNodeId:()IKJSDependency
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8[0] = &v7;
  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("willDestroyDOMNodeWithNodeId:"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "retainArguments");
  objc_msgSend(v6, "invokeWithTarget:", a1);

}

- (void)safe_shadowRootPushedWithHostId:()IKJSDependency root:
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
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
  objc_msgSend(v5, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("shadowRootPushedWithHostId:root:"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "retainArguments");
  objc_msgSend(v7, "invokeWithTarget:", a1);

}

- (void)safe_willRemoveEventListenerWithNodeId:()IKJSDependency
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8[0] = &v7;
  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("willRemoveEventListenerWithNodeId:"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "retainArguments");
  objc_msgSend(v6, "invokeWithTarget:", a1);

}

- (void)safe_childNodeCountUpdatedWithNodeId:()IKJSDependency childNodeCount:
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  v10[0] = &v9;
  v10[1] = &v8;
  v5 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("childNodeCountUpdatedWithNodeId:childNodeCount:"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "retainArguments");
  objc_msgSend(v7, "invokeWithTarget:", a1);

}

- (void)safe_shadowRootPoppedWithHostId:()IKJSDependency rootId:
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  v10[0] = &v9;
  v10[1] = &v8;
  v5 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("shadowRootPoppedWithHostId:rootId:"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "retainArguments");
  objc_msgSend(v7, "invokeWithTarget:", a1);

}

- (void)safe_attributeRemovedWithNodeId:()IKJSDependency name:
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
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
  objc_msgSend(v5, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("attributeRemovedWithNodeId:name:"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "retainArguments");
  objc_msgSend(v7, "invokeWithTarget:", a1);

}

- (void)safe_customElementStateChangedWithNodeId:()IKJSDependency customElementState:
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
  objc_msgSend(v5, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("customElementStateChangedWithNodeId:customElementState:"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "retainArguments");
  objc_msgSend(v7, "invokeWithTarget:", a1);

}

- (void)safe_setChildNodesWithParentId:()IKJSDependency nodes:
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
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
  objc_msgSend(v5, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("setChildNodesWithParentId:nodes:"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "retainArguments");
  objc_msgSend(v7, "invokeWithTarget:", a1);

}

- (void)safe_inlineStyleInvalidatedWithNodeIds:()IKJSDependency
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
  objc_msgSend(v4, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("inlineStyleInvalidatedWithNodeIds:"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "retainArguments");
  objc_msgSend(v6, "invokeWithTarget:", a1);

}

- (void)safe_attributeModifiedWithNodeId:()IKJSDependency name:value:
{
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  int v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v11 = a4;
  v10 = a5;
  v13[0] = &v12;
  v13[1] = &v11;
  v13[2] = &v10;
  v7 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("attributeModifiedWithNodeId:name:value:"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "retainArguments");
  objc_msgSend(v9, "invokeWithTarget:", a1);

}

- (void)safe_pseudoElementAddedWithParentId:()IKJSDependency pseudoElement:
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
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
  objc_msgSend(v5, "ik_invocationforSelectorString:argumentsPointerValue:", CFSTR("pseudoElementAddedWithParentId:pseudoElement:"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "retainArguments");
  objc_msgSend(v7, "invokeWithTarget:", a1);

}

@end
