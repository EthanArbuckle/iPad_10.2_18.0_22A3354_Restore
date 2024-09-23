@implementation UNNotificationContentExtensionHostContext

void __85___UNNotificationContentExtensionHostContext__extensionDidUpdatePlayPauseMediaButton__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationExtensionDidUpdatePlayPauseMediaButton:", *(_QWORD *)(a1 + 32));

}

uint64_t __86___UNNotificationContentExtensionHostContext__extensionWantsToReceiveActionResponses___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setWantsToReceiveActionResponses:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __84___UNNotificationContentExtensionHostContext__extensionWantsToBecomeFirstResponder___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setWantsToBecomeFirstResponder:", *(unsigned __int8 *)(a1 + 40));
}

uint64_t __84___UNNotificationContentExtensionHostContext__extensionSetPlayPauseMediaButtonType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPlayPauseMediaButtonType:", *(_QWORD *)(a1 + 40));
}

uint64_t __85___UNNotificationContentExtensionHostContext__extensionSetPlayPauseMediaButtonFrame___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPlayPauseMediaButtonFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __85___UNNotificationContentExtensionHostContext__extensionSetPlayPauseMediaButtonColor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setPlayPauseMediaButtonColor:", *(_QWORD *)(a1 + 40));
}

void __99___UNNotificationContentExtensionHostContext__extensionDidCompleteNotificationResponse_withOption___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD block[5];
  id v6;
  uint64_t v7;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __99___UNNotificationContentExtensionHostContext__extensionDidCompleteNotificationResponse_withOption___block_invoke_2;
  block[3] = &unk_24D5BB168;
  v2 = (void *)a1[5];
  block[4] = a1[4];
  v3 = v2;
  v4 = a1[6];
  v6 = v3;
  v7 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __99___UNNotificationContentExtensionHostContext__extensionDidCompleteNotificationResponse_withOption___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationExtension:extensionDidCompleteResponse:withOption:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __75___UNNotificationContentExtensionHostContext__extensionMediaPlayingStarted__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75___UNNotificationContentExtensionHostContext__extensionMediaPlayingStarted__block_invoke_2;
  block[3] = &unk_24D5BB060;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __75___UNNotificationContentExtensionHostContext__extensionMediaPlayingStarted__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationExtensionMediaPlayingDidStart:", *(_QWORD *)(a1 + 32));

}

void __74___UNNotificationContentExtensionHostContext__extensionMediaPlayingPaused__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74___UNNotificationContentExtensionHostContext__extensionMediaPlayingPaused__block_invoke_2;
  block[3] = &unk_24D5BB060;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __74___UNNotificationContentExtensionHostContext__extensionMediaPlayingPaused__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationExtensionMediaPlayingDidPause:", *(_QWORD *)(a1 + 32));

}

void __77___UNNotificationContentExtensionHostContext__extensionRequestsDefaultAction__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77___UNNotificationContentExtensionHostContext__extensionRequestsDefaultAction__block_invoke_2;
  block[3] = &unk_24D5BB060;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __77___UNNotificationContentExtensionHostContext__extensionRequestsDefaultAction__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationExtensionRequestsDefaultAction:", *(_QWORD *)(a1 + 32));

}

void __71___UNNotificationContentExtensionHostContext__extensionRequestsDismiss__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71___UNNotificationContentExtensionHostContext__extensionRequestsDismiss__block_invoke_2;
  block[3] = &unk_24D5BB060;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __71___UNNotificationContentExtensionHostContext__extensionRequestsDismiss__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationExtensionRequestsDismiss:", *(_QWORD *)(a1 + 32));

}

void __71___UNNotificationContentExtensionHostContext__extensionDidUpdateTitle___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __71___UNNotificationContentExtensionHostContext__extensionDidUpdateTitle___block_invoke_2;
  v2[3] = &unk_24D5BB140;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

}

void __71___UNNotificationContentExtensionHostContext__extensionDidUpdateTitle___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationExtension:didUpdateTitle:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __85___UNNotificationContentExtensionHostContext__extensionDidUpdateNotificationActions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  }
}

void __85___UNNotificationContentExtensionHostContext__extensionDidUpdateNotificationActions___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __85___UNNotificationContentExtensionHostContext__extensionDidUpdateNotificationActions___block_invoke_3;
  v2[3] = &unk_24D5BB140;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(_QWORD *)(a1 + 32);
  v3 = v1;
  dispatch_async(MEMORY[0x24BDAC9B8], v2);

}

void __85___UNNotificationContentExtensionHostContext__extensionDidUpdateNotificationActions___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationExtension:didUpdateNotificationActions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

@end
