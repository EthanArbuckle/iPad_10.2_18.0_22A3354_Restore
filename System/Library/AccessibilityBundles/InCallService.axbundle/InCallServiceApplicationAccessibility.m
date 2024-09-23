@implementation InCallServiceApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ICSApplication");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityStartStopToggle
{
  BOOL v3;
  objc_super v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __69__InCallServiceApplicationAccessibility_accessibilityStartStopToggle__block_invoke;
  v9 = &unk_250244F00;
  v10 = &v11;
  AXPerformBlockSynchronouslyOnMainThread();
  if (*((_BYTE *)v12 + 24))
  {
    v3 = 1;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)InCallServiceApplicationAccessibility;
    v3 = -[InCallServiceApplicationAccessibility accessibilityStartStopToggle](&v5, sel_accessibilityStartStopToggle);
  }
  _Block_object_dispose(&v11, 8);
  return v3;
}

void __69__InCallServiceApplicationAccessibility_accessibilityStartStopToggle__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "incomingCall");
  v14 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "incomingVideoCall");
  v4 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "currentAudioAndVideoCallCount");

  if (v14 | v4)
    v7 = v6 == 1;
  else
    v7 = 0;
  if (v7)
  {
    if (v14)
      v12 = (void *)v14;
    else
      v12 = (void *)v4;
    v8 = v12;
    objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "answerCall:", v8);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    goto LABEL_11;
  }
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentCalls");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "disconnectCall:", v11);

LABEL_11:
  }

}

- (id)accessibilityLabel
{
  void *v2;
  int v3;
  __CFString *v4;

  -[InCallServiceApplicationAccessibility _axGetFirstCall](self, "_axGetFirstCall");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "service");

  if ((v3 - 1) > 2)
  {
    v4 = &stru_250245590;
  }
  else
  {
    accessibilityLocalizedString(off_250244F20[v3 - 1]);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_axGetFirstCall
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentAudioAndVideoCalls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
