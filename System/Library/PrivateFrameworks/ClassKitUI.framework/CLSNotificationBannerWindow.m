@implementation CLSNotificationBannerWindow

+ (id)bannerWindow
{
  id v2;

  objc_sync_enter(CFSTR("CLSNotificationBannerSyncObject"));
  v2 = (id)qword_25547D330;
  objc_sync_exit(CFSTR("CLSNotificationBannerSyncObject"));
  return v2;
}

- (BOOL)_canAffectStatusBarAppearance
{
  return 0;
}

- (BOOL)_includeInDefaultImageSnapshot
{
  return 0;
}

- (CLSNotificationBannerWindow)init
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  CLSNotificationBannerWindow *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  const char *v15;
  CLSNotificationBannerViewController *v16;
  void *v17;
  const char *v18;
  id v19;
  const char *v20;
  void *v21;
  const char *v22;
  dispatch_semaphore_t v23;
  void *v24;
  objc_super v26;

  objc_msgSend_sharedApplication(MEMORY[0x24BDF6800], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sub_21EBFE7C0(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_windowScene(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)CLSNotificationBannerWindow;
  v11 = -[CLSNotificationBannerWindow initWithWindowScene:](&v26, sel_initWithWindowScene_, v10);
  v13 = (uint64_t)v11;
  if (v11)
  {
    objc_msgSend_setOpaque_(v11, v12, 0);
    objc_msgSend_setUserInteractionEnabled_((void *)v13, v14, 1);
    objc_msgSend_setHidden_((void *)v13, v15, 0);
    v16 = objc_alloc_init(CLSNotificationBannerViewController);
    v17 = *(void **)(v13 + 904);
    *(_QWORD *)(v13 + 904) = v16;

    objc_msgSend_setRootViewController_((void *)v13, v18, *(_QWORD *)(v13 + 904));
    v19 = objc_alloc(MEMORY[0x24BDF6C38]);
    v21 = (void *)objc_msgSend_initWithTarget_action_(v19, v20, v13, sel_handlePan_);
    objc_msgSend_addGestureRecognizer_((void *)v13, v22, (uint64_t)v21);
    v23 = dispatch_semaphore_create(1);
    v24 = *(void **)(v13 + 912);
    *(_QWORD *)(v13 + 912) = v23;

  }
  return (CLSNotificationBannerWindow *)v13;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  char v12;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  objc_msgSend_currentBannerViewController(self, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend_windowPointInside_withEvent_(v10, v11, (uint64_t)v7, x, y);

  return v12;
}

- (void)handlePan:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  id v8;

  v4 = a3;
  objc_msgSend_currentBannerViewController(self, v5, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_handleWindowPan_(v8, v7, (uint64_t)v4);

}

- (void)_showBanner:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  id v13;

  v4 = a3;
  objc_msgSend_currentBannerViewController(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addBannerView_(v7, v8, (uint64_t)v4);

  objc_msgSend_currentBannerViewController(self, v9, v10);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_showCurrentBanner(v13, v11, v12);

}

- (void)_hideBanner:(id)a3 quickly:(BOOL)a4
{
  _BOOL8 v4;
  const char *v5;
  id v6;

  v4 = a4;
  objc_msgSend_currentBannerViewController(self, a2, (uint64_t)a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_hideBannerQuickly_(v6, v5, v4);

}

+ (id)queue
{
  if (qword_25547D340 != -1)
    dispatch_once(&qword_25547D340, &unk_24E357118);
  return (id)qword_25547D338;
}

+ (void)enqueBanner:(id)a3
{
  const char *v4;
  uint64_t v5;
  id v6;
  unsigned int v7;
  CLSNotificationBannerWindow *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;

  v6 = a3;
  do
    v7 = __ldxr(&dword_25547D32C);
  while (__stxr(v7 + 1, &dword_25547D32C));
  if (!v7)
  {
    objc_sync_enter(CFSTR("CLSNotificationBannerSyncObject"));
    v8 = objc_alloc_init(CLSNotificationBannerWindow);
    v9 = (void *)qword_25547D330;
    qword_25547D330 = (uint64_t)v8;

    objc_sync_exit(CFSTR("CLSNotificationBannerSyncObject"));
  }
  objc_msgSend_queue(a1, v4, v5);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21EBFEDC0;
  block[3] = &unk_24E357140;
  v13 = v6;
  v11 = v6;
  dispatch_async(v10, block);

}

- (CLSNotificationBannerViewController)currentBannerViewController
{
  return self->_currentBannerViewController;
}

- (void)setCurrentBannerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_currentBannerViewController, a3);
}

- (OS_dispatch_semaphore)bannerSemaphore
{
  return self->_bannerSemaphore;
}

- (void)setBannerSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_bannerSemaphore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerSemaphore, 0);
  objc_storeStrong((id *)&self->_currentBannerViewController, 0);
}

@end
