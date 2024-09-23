@implementation _UNNotificationContentExtensionHostContext

- (_UNNotificationContentExtensionHostContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  id v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UNNotificationContentExtensionHostContext;
  v5 = -[_UNNotificationContentExtensionHostContext initWithInputItems:listenerEndpoint:contextUUID:](&v10, sel_initWithInputItems_listenerEndpoint_contextUUID_, a3, a4, a5);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.usernotificationsui.hostcontext.delegate", v6);
    v8 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v7;

    *((_BYTE *)v5 + 26) = 1;
    dispatch_suspend(*((dispatch_object_t *)v5 + 7));
  }
  return (_UNNotificationContentExtensionHostContext *)v5;
}

- (void)dealloc
{
  objc_super v3;

  -[_UNNotificationContentExtensionHostContext _resumeDelegateQueueIfNecessary](self, "_resumeDelegateQueueIfNecessary");
  v3.receiver = self;
  v3.super_class = (Class)_UNNotificationContentExtensionHostContext;
  -[_UNNotificationContentExtensionHostContext dealloc](&v3, sel_dealloc);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  if (a3)
    -[_UNNotificationContentExtensionHostContext _resumeDelegateQueueIfNecessary](self, "_resumeDelegateQueueIfNecessary");
}

- (void)_hostDidReceiveNotification:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_UNNotificationContentExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_hostDidReceiveNotification:", v4);

}

- (void)_hostDidReceiveNotificationResponse:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_UNNotificationContentExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_hostDidReceiveNotificationResponse:", v4);

}

- (void)_hostDidReceiveNotificationResponse:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[_UNNotificationContentExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_hostDidReceiveNotificationResponse:completionHandler:", v7, v6);

}

- (void)_hostWantsMediaToPause
{
  void *v2;
  id v3;

  -[_UNNotificationContentExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_hostWantsMediaToPause");

}

- (void)_hostWantsMediaToPlay
{
  void *v2;
  id v3;

  -[_UNNotificationContentExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_hostWantsMediaToPlay");

}

- (void)_hostWantsToUpdateMediaPlayPauseButton
{
  void *v2;
  id v3;

  -[_UNNotificationContentExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_hostWantsToUpdateMediaPlayPauseButton");

}

- (void)_hostWantsToPreserveInputViews
{
  void *v2;
  id v3;

  -[_UNNotificationContentExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_hostWantsToPreserveInputViews");

}

- (void)_hostWantsToRestoreInputViews
{
  void *v2;
  id v3;

  -[_UNNotificationContentExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_hostWantsToRestoreInputViews");

}

- (void)_extensionDidUpdatePlayPauseMediaButton
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85___UNNotificationContentExtensionHostContext__extensionDidUpdatePlayPauseMediaButton__block_invoke;
  block[3] = &unk_24D5BB060;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)_extensionWantsToReceiveActionResponses:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __86___UNNotificationContentExtensionHostContext__extensionWantsToReceiveActionResponses___block_invoke;
  v3[3] = &unk_24D5BB0C8;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

- (void)_extensionWantsToBecomeFirstResponder:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __84___UNNotificationContentExtensionHostContext__extensionWantsToBecomeFirstResponder___block_invoke;
  v3[3] = &unk_24D5BB0C8;
  v3[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

- (void)_extensionSetPlayPauseMediaButtonType:(unint64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __84___UNNotificationContentExtensionHostContext__extensionSetPlayPauseMediaButtonType___block_invoke;
  v3[3] = &unk_24D5BB0F0;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

- (void)_extensionSetPlayPauseMediaButtonFrame:(CGRect)a3
{
  _QWORD block[5];
  CGRect v4;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85___UNNotificationContentExtensionHostContext__extensionSetPlayPauseMediaButtonFrame___block_invoke;
  block[3] = &unk_24D5BB118;
  block[4] = self;
  v4 = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

- (void)_extensionSetPlayPauseMediaButtonColor:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __85___UNNotificationContentExtensionHostContext__extensionSetPlayPauseMediaButtonColor___block_invoke;
  v6[3] = &unk_24D5BB140;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

- (void)_extensionDidCompleteNotificationResponse:(id)a3 withOption:(unint64_t)a4
{
  id v6;
  NSObject *delegateQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __99___UNNotificationContentExtensionHostContext__extensionDidCompleteNotificationResponse_withOption___block_invoke;
  block[3] = &unk_24D5BB168;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(delegateQueue, block);

}

- (void)_extensionMediaPlayingStarted
{
  NSObject *delegateQueue;
  _QWORD block[5];

  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75___UNNotificationContentExtensionHostContext__extensionMediaPlayingStarted__block_invoke;
  block[3] = &unk_24D5BB060;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

- (void)_extensionMediaPlayingPaused
{
  NSObject *delegateQueue;
  _QWORD block[5];

  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74___UNNotificationContentExtensionHostContext__extensionMediaPlayingPaused__block_invoke;
  block[3] = &unk_24D5BB060;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

- (void)_extensionRequestsDefaultAction
{
  NSObject *delegateQueue;
  _QWORD block[5];

  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77___UNNotificationContentExtensionHostContext__extensionRequestsDefaultAction__block_invoke;
  block[3] = &unk_24D5BB060;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

- (void)_extensionRequestsDismiss
{
  NSObject *delegateQueue;
  _QWORD block[5];

  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71___UNNotificationContentExtensionHostContext__extensionRequestsDismiss__block_invoke;
  block[3] = &unk_24D5BB060;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

- (void)_extensionDidUpdateTitle:(id)a3
{
  id v4;
  NSObject *delegateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  delegateQueue = self->_delegateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71___UNNotificationContentExtensionHostContext__extensionDidUpdateTitle___block_invoke;
  v7[3] = &unk_24D5BB140;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(delegateQueue, v7);

}

- (void)_extensionDidUpdateNotificationActions:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  uint64_t v7;
  NSObject *delegateQueue;
  id v9;
  _QWORD block[5];
  id v11;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v7 = MEMORY[0x24BDAC760];
  if ((isKindOfClass & 1) != 0)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __85___UNNotificationContentExtensionHostContext__extensionDidUpdateNotificationActions___block_invoke;
    v12[3] = &unk_24D5BB190;
    v13 = v5;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v12);

  }
  delegateQueue = self->_delegateQueue;
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __85___UNNotificationContentExtensionHostContext__extensionDidUpdateNotificationActions___block_invoke_2;
  block[3] = &unk_24D5BB140;
  block[4] = self;
  v11 = v5;
  v9 = v5;
  dispatch_async(delegateQueue, block);

}

- (void)_resumeDelegateQueueIfNecessary
{
  if (self->_delegateQueueSuspended)
  {
    dispatch_resume((dispatch_object_t)self->_delegateQueue);
    self->_delegateQueueSuspended = 0;
  }
}

- (BOOL)wantsToBecomeFirstResponder
{
  return self->_wantsToBecomeFirstResponder;
}

- (void)setWantsToBecomeFirstResponder:(BOOL)a3
{
  self->_wantsToBecomeFirstResponder = a3;
}

- (BOOL)wantsToReceiveActionResponses
{
  return self->_wantsToReceiveActionResponses;
}

- (void)setWantsToReceiveActionResponses:(BOOL)a3
{
  self->_wantsToReceiveActionResponses = a3;
}

- (unint64_t)playPauseMediaButtonType
{
  return self->_playPauseMediaButtonType;
}

- (void)setPlayPauseMediaButtonType:(unint64_t)a3
{
  self->_playPauseMediaButtonType = a3;
}

- (CGRect)playPauseMediaButtonFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_playPauseMediaButtonFrame.origin.x;
  y = self->_playPauseMediaButtonFrame.origin.y;
  width = self->_playPauseMediaButtonFrame.size.width;
  height = self->_playPauseMediaButtonFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPlayPauseMediaButtonFrame:(CGRect)a3
{
  self->_playPauseMediaButtonFrame = a3;
}

- (UIColor)playPauseMediaButtonColor
{
  return self->_playPauseMediaButtonColor;
}

- (void)setPlayPauseMediaButtonColor:(id)a3
{
  objc_storeStrong((id *)&self->_playPauseMediaButtonColor, a3);
}

- (_UNNotificationContentExtensionHostContextDelegate)delegate
{
  return (_UNNotificationContentExtensionHostContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_delegateQueue, a3);
}

- (BOOL)isDelegateQueueSuspended
{
  return self->_delegateQueueSuspended;
}

- (void)setDelegateQueueSuspended:(BOOL)a3
{
  self->_delegateQueueSuspended = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_playPauseMediaButtonColor, 0);
}

@end
