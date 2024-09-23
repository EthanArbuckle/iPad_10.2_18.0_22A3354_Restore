@implementation _UNNotificationContentExtensionVendorContext

- (_UNNotificationContentExtensionVendorContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  _UNNotificationContentExtensionVendorContext *v5;
  _UNNotificationContentExtensionVendorContext *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *queue;
  id v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)_UNNotificationContentExtensionVendorContext;
  v5 = -[_UNNotificationContentExtensionVendorContext initWithInputItems:listenerEndpoint:contextUUID:](&v26, sel_initWithInputItems_listenerEndpoint_contextUUID_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[_UNNotificationContentExtensionVendorContext inputItems](v5, "inputItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("actions"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x24BDD1620];
    v12 = (void *)MEMORY[0x24BDBCF20];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(v11, "unarchivedObjectOfClasses:fromData:error:", v14, v10, &v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v25;

    v17 = objc_msgSend(v15, "copy");
    v18 = (void *)v17;
    if (v17)
      v19 = (void *)v17;
    else
      v19 = (void *)MEMORY[0x24BDBD1A8];
    objc_storeStrong((id *)&v6->_notificationActions, v19);

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_initially_inactive(v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create("com.apple.UserNotificationsUI.ExtensionVendorContext", v21);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v22;

    v6->_queueInactive = 1;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[_UNNotificationContentExtensionVendorContext _activateQueueIfNecessary](self, "_activateQueueIfNecessary");
  v3.receiver = self;
  v3.super_class = (Class)_UNNotificationContentExtensionVendorContext;
  -[_UNNotificationContentExtensionVendorContext dealloc](&v3, sel_dealloc);
}

- (void)openURL:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __74___UNNotificationContentExtensionVendorContext_openURL_completionHandler___block_invoke;
  v10[3] = &unk_24D5BB210;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, v10);

}

- (void)performNotificationDefaultAction
{
  void *v2;
  id v3;

  -[_UNNotificationContentExtensionVendorContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_extensionRequestsDefaultAction");

}

- (void)setNotificationActions:(id)a3
{
  NSArray *v4;
  NSArray *notificationActions;
  void *v6;
  NSArray *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  if (self->_notificationActions != a3)
  {
    v4 = (NSArray *)objc_msgSend(a3, "copy");
    notificationActions = self->_notificationActions;
    self->_notificationActions = v4;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self->_notificationActions;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __71___UNNotificationContentExtensionVendorContext_setNotificationActions___block_invoke;
    v9[3] = &unk_24D5BB238;
    v10 = v6;
    v8 = v6;
    -[NSArray enumerateObjectsUsingBlock:](v7, "enumerateObjectsUsingBlock:", v9);
    -[_UNNotificationContentExtensionVendorContext _extensionDidUpdateNotificationActions:](self, "_extensionDidUpdateNotificationActions:", v8);

  }
}

- (void)_extensionWantsToReceiveActionResponses:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[_UNNotificationContentExtensionVendorContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_extensionWantsToReceiveActionResponses:", v3);

}

- (void)_extensionWantsToBecomeFirstResponder:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = a3;
  -[_UNNotificationContentExtensionVendorContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_extensionWantsToBecomeFirstResponder:", v3);

}

- (void)_extensionDidCompleteNotificationResponse:(id)a3 withOption:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[_UNNotificationContentExtensionVendorContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_extensionDidCompleteNotificationResponse:withOption:", v6, a4);

}

- (void)_extensionSetPlayPauseMediaButtonType:(unint64_t)a3
{
  void *v4;
  id v5;

  -[_UNNotificationContentExtensionVendorContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_extensionSetPlayPauseMediaButtonType:", a3);

}

- (void)_extensionSetPlayPauseMediaButtonFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  id v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[_UNNotificationContentExtensionVendorContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "remoteObjectProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_extensionSetPlayPauseMediaButtonFrame:", x, y, width, height);

}

- (void)_extensionSetPlayPauseMediaButtonColor:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_UNNotificationContentExtensionVendorContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_extensionSetPlayPauseMediaButtonColor:", v4);

}

- (void)_extensionMediaPlayingPaused
{
  void *v2;
  id v3;

  -[_UNNotificationContentExtensionVendorContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_extensionMediaPlayingPaused");

}

- (void)_extensionMediaPlayingStarted
{
  void *v2;
  id v3;

  -[_UNNotificationContentExtensionVendorContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_extensionMediaPlayingStarted");

}

- (void)_extensionRequestsDefaultAction
{
  void *v2;
  id v3;

  -[_UNNotificationContentExtensionVendorContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_extensionRequestsDefaultAction");

}

- (void)_extensionRequestsDismiss
{
  void *v2;
  id v3;

  -[_UNNotificationContentExtensionVendorContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_extensionRequestsDismiss");

}

- (void)_extensionDidUpdateTitle:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_UNNotificationContentExtensionVendorContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_extensionDidUpdateTitle:", v4);

}

- (void)_extensionDidUpdateNotificationActions:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[_UNNotificationContentExtensionVendorContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "remoteObjectProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_extensionDidUpdateNotificationActions:", v4);

}

- (void)_extensionDidUpdatePlayPauseMediaButton
{
  void *v2;
  id v3;

  -[_UNNotificationContentExtensionVendorContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_extensionDidUpdatePlayPauseMediaButton");

}

- (void)_hostWantsToPreserveInputViews
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78___UNNotificationContentExtensionVendorContext__hostWantsToPreserveInputViews__block_invoke;
  block[3] = &unk_24D5BB060;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_hostWantsToRestoreInputViews
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __77___UNNotificationContentExtensionVendorContext__hostWantsToRestoreInputViews__block_invoke;
  block[3] = &unk_24D5BB060;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_hostDidReceiveNotification:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __76___UNNotificationContentExtensionVendorContext__hostDidReceiveNotification___block_invoke;
  block[3] = &unk_24D5BB140;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)_hostDidReceiveNotificationResponse:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __84___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse___block_invoke;
  block[3] = &unk_24D5BB140;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

- (void)_hostDidReceiveNotificationResponse:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __102___UNNotificationContentExtensionVendorContext__hostDidReceiveNotificationResponse_completionHandler___block_invoke;
  block[3] = &unk_24D5BB2B0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

- (void)_hostWantsMediaToPause
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70___UNNotificationContentExtensionVendorContext__hostWantsMediaToPause__block_invoke;
  block[3] = &unk_24D5BB060;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_hostWantsMediaToPlay
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69___UNNotificationContentExtensionVendorContext__hostWantsMediaToPlay__block_invoke;
  block[3] = &unk_24D5BB060;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_hostWantsToUpdateMediaPlayPauseButton
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __86___UNNotificationContentExtensionVendorContext__hostWantsToUpdateMediaPlayPauseButton__block_invoke;
  block[3] = &unk_24D5BB060;
  block[4] = self;
  dispatch_sync(queue, block);
}

- (void)_updateMediaPlayPauseButton
{
  uint64_t v3;
  void *v4;
  id v5;

  -[_UNNotificationContentExtensionVendorContext _notificationExtension](self, "_notificationExtension");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = objc_msgSend(v5, "mediaPlayPauseButtonType");
    if ((unint64_t)(v3 - 1) > 1)
    {
      -[_UNNotificationContentExtensionVendorContext _extensionSetPlayPauseMediaButtonType:](self, "_extensionSetPlayPauseMediaButtonType:", 0);
    }
    else
    {
      -[_UNNotificationContentExtensionVendorContext _extensionSetPlayPauseMediaButtonType:](self, "_extensionSetPlayPauseMediaButtonType:", v3);
      objc_msgSend(v5, "mediaPlayPauseButtonFrame");
      -[_UNNotificationContentExtensionVendorContext _extensionSetPlayPauseMediaButtonFrame:](self, "_extensionSetPlayPauseMediaButtonFrame:");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v5, "mediaPlayPauseButtonTintColor");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UNNotificationContentExtensionVendorContext _extensionSetPlayPauseMediaButtonColor:](self, "_extensionSetPlayPauseMediaButtonColor:", v4);

      }
    }
  }
  -[_UNNotificationContentExtensionVendorContext _extensionDidUpdatePlayPauseMediaButton](self, "_extensionDidUpdatePlayPauseMediaButton");

}

- (void)_activateQueueIfNecessary
{
  if (self->_queueInactive)
  {
    dispatch_activate((dispatch_object_t)self->_queue);
    self->_queueInactive = 0;
  }
}

- (NSArray)notificationActions
{
  return self->_notificationActions;
}

- (_UNNotificationContentExtensionVendorContainer)notificationExtensionContainer
{
  return (_UNNotificationContentExtensionVendorContainer *)objc_loadWeakRetained((id *)&self->_notificationExtensionContainer);
}

- (void)setNotificationExtensionContainer:(id)a3
{
  objc_storeWeak((id *)&self->_notificationExtensionContainer, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)isQueueInactive
{
  return self->_queueInactive;
}

- (void)setQueueInactive:(BOOL)a3
{
  self->_queueInactive = a3;
}

- (BOOL)didCheckActionResponseDelegate
{
  return self->_didCheckActionResponseDelegate;
}

- (void)setDidCheckActionResponseDelegate:(BOOL)a3
{
  self->_didCheckActionResponseDelegate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_notificationExtensionContainer);
  objc_storeStrong((id *)&self->_notificationActions, 0);
}

@end
