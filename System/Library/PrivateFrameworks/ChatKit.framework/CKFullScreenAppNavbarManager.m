@implementation CKFullScreenAppNavbarManager

- (CKFullScreenAppNavbarManager)initWithConversation:(id)a3 plugin:(id)a4
{
  id v6;
  id v7;
  CKFullScreenAppNavbarManager *v8;
  CKFullScreenAppNavbarManager *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  v8 = -[CKFullScreenAppNavbarManager init](self, "init");
  v9 = v8;
  if (v8)
  {
    -[CKFullScreenAppNavbarManager setConversation:](v8, "setConversation:", v6);
    -[CKFullScreenAppNavbarManager setPlugin:](v9, "setPlugin:", v7);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0D35328];
    -[CKFullScreenAppNavbarManager conversation](v9, "conversation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "chat");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, sel__handleChatItemDidChange_, v11, v13);

    v14 = *MEMORY[0x1E0D352F0];
    -[CKFullScreenAppNavbarManager conversation](v9, "conversation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "chat");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v9, sel__handleChatDisplayNameChange_, v14, v16);

    objc_msgSend(v10, "addObserver:selector:name:object:", v9, sel__contactPhotosEnabledChangedNotification_, CKConversationListContactPhotosEnabledNotification, 0);
    -[CKFullScreenAppNavbarManager _configureCanvasView](v9, "_configureCanvasView");
    -[CKFullScreenAppNavbarManager _updateDismissButton](v9, "_updateDismissButton");
    if (!-[CKFullScreenAppNavbarManager _canShowAvatarView](v9, "_canShowAvatarView"))
      -[CKFullScreenAppNavbarManager _updateTitleLabelText](v9, "_updateTitleLabelText");

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  NSTimer *notificationTimer;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  notificationTimer = self->_notificationTimer;
  if (notificationTimer)
    -[NSTimer invalidate](notificationTimer, "invalidate");
  if (-[NSMutableArray count](self->_notificationViews, "count"))
    -[NSMutableArray enumerateObjectsUsingBlock:](self->_notificationViews, "enumerateObjectsUsingBlock:", &__block_literal_global_14);
  v5.receiver = self;
  v5.super_class = (Class)CKFullScreenAppNavbarManager;
  -[CKFullScreenAppNavbarManager dealloc](&v5, sel_dealloc);
}

uint64_t __39__CKFullScreenAppNavbarManager_dealloc__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDelegate:", 0);
}

- (void)_handleChatItemDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "chatItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0D35330]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKFullScreenAppNavbarManager _didReceiveMessageChatItem:addedChatItems:](self, "_didReceiveMessageChatItem:addedChatItems:", v6, v7))
  {
    if (-[CKFullScreenAppNavbarManager _shouldStartnotificationQueue](self, "_shouldStartnotificationQueue"))
    {
      -[CKFullScreenAppNavbarManager _startNotificationQueue](self, "_startNotificationQueue");
      -[CKFullScreenAppNavbarManager avatarPickerViewController](self, "avatarPickerViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_animateOutTitleView");

    }
    -[CKFullScreenAppNavbarManager _addNotificationViewToQueue](self, "_addNotificationViewToQueue");
  }

}

- (BOOL)_didReceiveMessageChatItem:(id)a3 addedChatItems:(id)a4
{
  id v5;
  id v6;
  id v7;
  char v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v5 = a3;
  v6 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__CKFullScreenAppNavbarManager__didReceiveMessageChatItem_addedChatItems___block_invoke;
  v10[3] = &unk_1E274B3A8;
  v7 = v5;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v6, "enumerateIndexesWithOptions:usingBlock:", 2, v10);
  v8 = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v8;
}

void __74__CKFullScreenAppNavbarManager__didReceiveMessageChatItem_addedChatItems___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  char isKindOfClass;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v9;
  if ((isKindOfClass & 1) != 0)
  {
    v7 = v9;
    objc_msgSend(v7, "guid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 && (objc_msgSend(v7, "isFromMe") & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      *a3 = 1;
    }

    v6 = v9;
  }

}

- (BOOL)_shouldStartnotificationQueue
{
  void *v2;
  BOOL v3;

  -[CKFullScreenAppNavbarManager notificationViews](self, "notificationViews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)avatarNotificationCalloutViewDidFinishFadeOut:(id)a3
{
  objc_msgSend(a3, "removeFromSuperview");
}

- (void)avatarNotificationCalloutViewReceivedTouch:(id)a3
{
  -[CKFullScreenAppNavbarManager _invalidateTimer](self, "_invalidateTimer", a3);
  -[CKFullScreenAppNavbarManager _removeAllNotifications](self, "_removeAllNotifications");
}

- (void)_invalidateTimer
{
  void *v3;
  void *v4;

  -[CKFullScreenAppNavbarManager notificationTimer](self, "notificationTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[CKFullScreenAppNavbarManager notificationTimer](self, "notificationTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[CKFullScreenAppNavbarManager setNotificationTimer:](self, "setNotificationTimer:", 0);
  }
}

- (void)_removeAllNotifications
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CKFullScreenAppNavbarManager notificationViews](self, "notificationViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[CKFullScreenAppNavbarManager notificationViews](self, "notificationViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastObject");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[CKFullScreenAppNavbarManager notificationViews](self, "notificationViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeLastObject");

    objc_msgSend(v9, "animateOut");
    -[CKFullScreenAppNavbarManager notificationViews](self, "notificationViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", &__block_literal_global_28);

    -[CKFullScreenAppNavbarManager setNotificationViews:](self, "setNotificationViews:", 0);
    -[CKFullScreenAppNavbarManager avatarPickerViewController](self, "avatarPickerViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_animateInTitleView");

  }
}

uint64_t __55__CKFullScreenAppNavbarManager__removeAllNotifications__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "removeFromSuperview");
}

- (int64_t)_viewModeForCalloutView
{
  return -[CKFullScreenAppNavbarManager style](self, "style") < 4;
}

- (void)_startNotificationQueue
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[CKFullScreenAppNavbarManager notificationViews](self, "notificationViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[CKFullScreenAppNavbarManager setNotificationViews:](self, "setNotificationViews:", v4);

  }
  -[CKFullScreenAppNavbarManager notificationTimer](self, "notificationTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__dequeueNotificationViews_, 0, 1, 2.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKFullScreenAppNavbarManager setNotificationTimer:](self, "setNotificationTimer:", v6);

    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKFullScreenAppNavbarManager notificationTimer](self, "notificationTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addTimer:forMode:", v8, *MEMORY[0x1E0C99748]);

  }
  -[CKFullScreenAppNavbarManager delegate](self, "delegate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navbarManagerDidReceiveMessage:", self);

}

- (void)_addNotificationViewToQueue
{
  CKAvatarNotificationCalloutView *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double MidX;
  double v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  double MaxY;
  void *v57;
  double v58;
  CGFloat v59;
  CGFloat v60;
  void *v61;
  void *v62;
  void *v63;
  double rect;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  double v69;
  CKAvatarNotificationCalloutView *v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  v3 = [CKAvatarNotificationCalloutView alloc];
  -[CKFullScreenAppNavbarManager conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previewText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CKFullScreenAppNavbarManager _viewModeForCalloutView](self, "_viewModeForCalloutView");
  v70 = -[CKAvatarNotificationCalloutView initWithFrame:previewText:mode:](v3, "initWithFrame:previewText:mode:", v6, v7, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

  -[CKAvatarNotificationCalloutView sizeToFit](v70, "sizeToFit");
  -[CKFullScreenAppNavbarManager canvasView](self, "canvasView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  rect = v15;

  if (-[CKFullScreenAppNavbarManager _canShowAvatarView](self, "_canShowAvatarView"))
  {
    -[CKFullScreenAppNavbarManager canvasView](self, "canvasView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKFullScreenAppNavbarManager avatarPickerViewController](self, "avatarPickerViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "titleViewFrame");
    v19 = v18;
    v20 = v10;
    v22 = v21;
    v23 = v12;
    v25 = v24;
    v26 = v14;
    v28 = v27;
    -[CKFullScreenAppNavbarManager avatarPickerViewController](self, "avatarPickerViewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v22;
    v10 = v20;
    v32 = v25;
    v12 = v23;
    v33 = v28;
    v14 = v26;
    objc_msgSend(v16, "convertRect:fromView:", v30, v19, v31, v32, v33);
    v67 = v35;
    v68 = v34;
    v66 = v36;
    v38 = v37;

  }
  else
  {
    -[CKFullScreenAppNavbarManager defaultTitleLabel](self, "defaultTitleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    v67 = v40;
    v68 = v39;
    v66 = v41;
    v38 = v42;
  }
  v65 = v38;

  -[CKAvatarNotificationCalloutView bounds](v70, "bounds");
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v50 = v49;
  v71.origin.x = v10;
  v71.origin.y = v12;
  v71.size.width = v14;
  v71.size.height = rect;
  MidX = CGRectGetMidX(v71);
  v72.origin.x = v44;
  v72.origin.y = v46;
  v72.size.width = v48;
  v72.size.height = v50;
  v52 = MidX + CGRectGetWidth(v72) * -0.5;
  v53 = v68;
  if (-[CKFullScreenAppNavbarManager _canShowAvatarView](self, "_canShowAvatarView"))
  {
    v73.origin.x = v68;
    v73.origin.y = v67;
    v55 = v65;
    v54 = v66;
    v73.size.width = v66;
    v73.size.height = v65;
    rect = CGRectGetMidY(v73);
    v74.origin.x = v52;
    v74.origin.y = v46;
    v74.size.width = v48;
    v74.size.height = v50;
    MaxY = rect + CGRectGetHeight(v74) * -0.5;
  }
  else
  {
    v75.origin.x = v68;
    v75.origin.y = v67;
    v55 = v65;
    v54 = v66;
    v75.size.width = v66;
    v75.size.height = v65;
    MaxY = CGRectGetMaxY(v75);
  }
  -[CKAvatarNotificationCalloutView setFrame:](v70, "setFrame:", v52, MaxY, v48, v50, *(_QWORD *)&rect);
  -[CKAvatarNotificationCalloutView layer](v70, "layer");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "anchorPoint");
  v69 = v58;

  v76.origin.x = v53;
  v76.origin.y = v67;
  v76.size.width = v54;
  v76.size.height = v55;
  v59 = CGRectGetHeight(v76) * 0.5;
  v77.origin.x = v52;
  v77.origin.y = MaxY;
  v77.size.width = v48;
  v77.size.height = v50;
  v60 = v59 / CGRectGetHeight(v77);
  -[CKAvatarNotificationCalloutView layer](v70, "layer");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setAnchorPoint:", v69, v60);

  -[CKAvatarNotificationCalloutView setDelegate:](v70, "setDelegate:", self);
  -[CKFullScreenAppNavbarManager notificationViews](self, "notificationViews");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "addObject:", v70);

  -[CKFullScreenAppNavbarManager canvasView](self, "canvasView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "addSubview:", v70);

  -[CKAvatarNotificationCalloutView animateIn](v70, "animateIn");
}

- (void)_dequeueNotificationViews:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  -[CKFullScreenAppNavbarManager notificationViews](self, "notificationViews", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[CKFullScreenAppNavbarManager notificationViews](self, "notificationViews");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    -[CKFullScreenAppNavbarManager notificationViews](self, "notificationViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFirstObject");

    objc_msgSend(v12, "animateOut");
    -[CKFullScreenAppNavbarManager notificationViews](self, "notificationViews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (!v9)
    {
      -[CKFullScreenAppNavbarManager setNotificationViews:](self, "setNotificationViews:", 0);
      -[CKFullScreenAppNavbarManager avatarPickerViewController](self, "avatarPickerViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_animateInTitleView");

      -[CKFullScreenAppNavbarManager _invalidateTimer](self, "_invalidateTimer");
      -[CKFullScreenAppNavbarManager delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "navbarManagerDidDismissAllMessages:", self);

    }
  }
  else
  {
    -[CKFullScreenAppNavbarManager _invalidateTimer](self, "_invalidateTimer");
  }
}

- (void)dismissNotifications
{
  -[CKFullScreenAppNavbarManager _invalidateTimer](self, "_invalidateTimer");
  -[CKFullScreenAppNavbarManager _removeAllNotifications](self, "_removeAllNotifications");
}

- (void)_contactPhotosEnabledChangedNotification:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[CKFullScreenAppNavbarManager _updateTitleView](self, "_updateTitleView", a3);
  -[CKFullScreenAppNavbarManager canvasView](self, "canvasView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKFullScreenAppNavbarManager avatarPickerViewController](self, "avatarPickerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v7)
  {
    -[CKFullScreenAppNavbarManager canvasView](self, "canvasView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "titleView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKFullScreenAppNavbarManager defaultTitleLabel](self, "defaultTitleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 != v10)
      -[CKFullScreenAppNavbarManager setDefaultTitleLabel:](self, "setDefaultTitleLabel:", 0);
  }
  else
  {
    -[CKFullScreenAppNavbarManager setAvatarPickerViewController:](self, "setAvatarPickerViewController:", 0);
    -[CKFullScreenAppNavbarManager _updateTitleLabelText](self, "_updateTitleLabelText");
  }
  -[CKFullScreenAppNavbarManager canvasView](self, "canvasView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setNeedsLayout");

}

- (void)setStyle:(int64_t)a3
{
  void *v5;

  if (self->_style != a3)
  {
    self->_style = a3;
    -[CKFullScreenAppNavbarManager avatarPickerViewController](self, "avatarPickerViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setStyle:", a3);

    -[CKFullScreenAppNavbarManager _updateDismissButton](self, "_updateDismissButton");
  }
}

- (BOOL)_canShowAvatarView
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  BOOL v6;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "contactPhotosEnabled"))
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_referenceBounds");
    if (v4 <= 320.0)
    {
      v6 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bounds");
      v6 = _UIUserInterfaceSizeClassForHeight() != 0;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_configureCanvasView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[CKFullScreenAppNavbarManager appIconButton](self, "appIconButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKFullScreenAppNavbarManager canvasView](self, "canvasView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeftItemView:", v3);

  -[CKFullScreenAppNavbarManager dismissButton](self, "dismissButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKFullScreenAppNavbarManager canvasView](self, "canvasView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightItemView:", v5);

  -[CKFullScreenAppNavbarManager _updateTitleView](self, "_updateTitleView");
}

- (void)_updateTitleView
{
  void *v3;
  void *v4;
  id v5;

  if (-[CKFullScreenAppNavbarManager _canShowAvatarView](self, "_canShowAvatarView"))
  {
    -[CKFullScreenAppNavbarManager avatarPickerViewController](self, "avatarPickerViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKFullScreenAppNavbarManager canvasView](self, "canvasView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setTitleView:", v3);

  }
  else
  {
    -[CKFullScreenAppNavbarManager defaultTitleLabel](self, "defaultTitleLabel");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[CKFullScreenAppNavbarManager canvasView](self, "canvasView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitleView:", v5);
  }

}

- (void)_updateTitleLabelText
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CKFullScreenAppNavbarManager conversation](self, "conversation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v8, "hasDisplayName");
  -[CKFullScreenAppNavbarManager conversation](self, "conversation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "displayName");
  else
    objc_msgSend(v4, "displayNameForMediaObjects:subject:shouldListParticipants:", 0, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKFullScreenAppNavbarManager defaultTitleLabel](self, "defaultTitleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

}

- (void)_updateDismissButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[CKFullScreenAppNavbarManager dismissButton](self, "dismissButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA638], "ckTemplateImageNamed:", CFSTR("Dismiss-Chevron"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setImage:forState:", v4, 0);

  if (-[CKFullScreenAppNavbarManager style](self, "style") < 4)
    objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.619607843, 0.643137255, 0.682352941, 1.0);
  else
    objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CKFullScreenAppNavbarManager dismissButton](self, "dismissButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTintColor:", v7);

}

- (CKAvatarPickerViewController)avatarPickerViewController
{
  CKAvatarPickerViewController *avatarPickerViewController;
  CKAvatarPickerViewController *v4;
  void *v5;
  CKAvatarPickerViewController *v6;
  CKAvatarPickerViewController *v7;

  avatarPickerViewController = self->_avatarPickerViewController;
  if (!avatarPickerViewController)
  {
    v4 = [CKAvatarPickerViewController alloc];
    -[CKFullScreenAppNavbarManager conversation](self, "conversation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CKAvatarPickerViewController initWithConversation:](v4, "initWithConversation:", v5);
    v7 = self->_avatarPickerViewController;
    self->_avatarPickerViewController = v6;

    avatarPickerViewController = self->_avatarPickerViewController;
  }
  return avatarPickerViewController;
}

- (CKNavigationBarCanvasView)canvasView
{
  CKNavigationBarCanvasView *canvasView;
  CKNavigationBarCanvasView *v4;
  CKNavigationBarCanvasView *v5;
  CKNavigationBarCanvasView *v6;

  canvasView = self->_canvasView;
  if (!canvasView)
  {
    v4 = [CKNavigationBarCanvasView alloc];
    v5 = -[CKNavigationBarCanvasView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v6 = self->_canvasView;
    self->_canvasView = v5;

    canvasView = self->_canvasView;
  }
  return canvasView;
}

- (UIButton)dismissButton
{
  UIButton *dismissButton;
  UIButton *v4;
  UIButton *v5;

  dismissButton = self->_dismissButton;
  if (!dismissButton)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_dismissButton;
    self->_dismissButton = v4;

    -[UIButton setShowsTouchWhenHighlighted:](self->_dismissButton, "setShowsTouchWhenHighlighted:", 1);
    dismissButton = self->_dismissButton;
  }
  return dismissButton;
}

- (UILabel)defaultTitleLabel
{
  UILabel *defaultTitleLabel;
  UILabel *v4;
  UILabel *v5;
  void *v6;

  defaultTitleLabel = self->_defaultTitleLabel;
  if (!defaultTitleLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    v5 = self->_defaultTitleLabel;
    self->_defaultTitleLabel = v4;

    -[UILabel setTextAlignment:](self->_defaultTitleLabel, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 17.0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](self->_defaultTitleLabel, "setFont:", v6);

    defaultTitleLabel = self->_defaultTitleLabel;
  }
  return defaultTitleLabel;
}

- (UIButton)appIconButton
{
  UIButton *v3;
  UIButton *appIconButton;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id location;

  if (!self->_appIconButton)
  {
    objc_msgSend(MEMORY[0x1E0CEA3A0], "buttonWithType:", 0);
    v3 = (UIButton *)objc_claimAutoreleasedReturnValue();
    appIconButton = self->_appIconButton;
    self->_appIconButton = v3;

    -[CKFullScreenAppNavbarManager plugin](self, "plugin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D37588]);

    if ((v7 & 1) == 0)
    {
      -[CKFullScreenAppNavbarManager plugin](self, "plugin");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      location = 0;
      objc_initWeak(&location, self);
      -[CKFullScreenAppNavbarManager plugin](self, "plugin");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __45__CKFullScreenAppNavbarManager_appIconButton__block_invoke;
      v13[3] = &unk_1E274B4A8;
      objc_copyWeak(&v15, &location);
      v11 = v9;
      v14 = v11;
      objc_msgSend(v10, "__ck_generateStatusImage:", v13);

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);

    }
  }
  return self->_appIconButton;
}

void __45__CKFullScreenAppNavbarManager_appIconButton__block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(WeakRetained, "plugin");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "isEqualToString:", v7);

    if ((_DWORD)v5)
    {
      objc_msgSend(MEMORY[0x1E0CEA3A8], "ckCreateButtonConfigurationWithType:withImage:", 0, v9);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4[2], "setConfiguration:", v8);

    }
  }

}

- (void)setPlugin:(id)a3
{
  IMBalloonPlugin *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  IMBalloonPlugin *v12;

  v5 = (IMBalloonPlugin *)a3;
  if (self->_plugin != v5)
  {
    v12 = v5;
    objc_storeStrong((id *)&self->_plugin, a3);
    -[CKFullScreenAppNavbarManager plugin](self, "plugin");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D37588]);

    v5 = v12;
    if ((v8 & 1) == 0)
    {
      -[CKFullScreenAppNavbarManager plugin](self, "plugin");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "__ck_statusImage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CEA3A8], "ckCreateButtonConfigurationWithType:withImage:", 0, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setConfiguration:](self->_appIconButton, "setConfiguration:", v11);

      -[UIButton setNeedsLayout](self->_appIconButton, "setNeedsLayout");
      v5 = v12;
    }
  }

}

- (void)setDismissButton:(id)a3
{
  objc_storeStrong((id *)&self->_dismissButton, a3);
}

- (void)setAppIconButton:(id)a3
{
  objc_storeStrong((id *)&self->_appIconButton, a3);
}

- (void)setCanvasView:(id)a3
{
  objc_storeStrong((id *)&self->_canvasView, a3);
}

- (void)setAvatarPickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_avatarPickerViewController, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (CKFullScreenAppNavbarManagerDelegate)delegate
{
  return (CKFullScreenAppNavbarManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (IMBalloonPlugin)plugin
{
  return self->_plugin;
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (NSMutableArray)notificationViews
{
  return self->_notificationViews;
}

- (void)setNotificationViews:(id)a3
{
  objc_storeStrong((id *)&self->_notificationViews, a3);
}

- (NSTimer)notificationTimer
{
  return self->_notificationTimer;
}

- (void)setNotificationTimer:(id)a3
{
  objc_storeStrong((id *)&self->_notificationTimer, a3);
}

- (void)setDefaultTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_defaultTitleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTitleLabel, 0);
  objc_storeStrong((id *)&self->_notificationTimer, 0);
  objc_storeStrong((id *)&self->_notificationViews, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_storeStrong((id *)&self->_plugin, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_avatarPickerViewController, 0);
  objc_storeStrong((id *)&self->_canvasView, 0);
  objc_storeStrong((id *)&self->_appIconButton, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
}

@end
