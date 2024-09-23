@implementation CSMagSafeAccessoryStatusObserver

- (CSMagSafeAccessoryStatusObserver)initWithCoverSheetContext:(id)a3
{
  id v4;
  CSMagSafeAccessoryStatusObserver *v5;
  uint64_t v6;
  CSMagSafeAccessoryStatusProviding *statusProvider;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *attachmentNotificationToken;
  void *v13;
  uint64_t v14;
  NSObject *detachmentNotificationToken;
  void *v16;
  uint64_t v17;
  NSObject *animationStatusNotificationToken;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CSMagSafeAccessoryStatusObserver;
  v5 = -[CSMagSafeAccessoryStatusObserver init](&v27, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "accessoryStatusProvider");
    v6 = objc_claimAutoreleasedReturnValue();
    statusProvider = v5->_statusProvider;
    v5->_statusProvider = (CSMagSafeAccessoryStatusProviding *)v6;

    objc_initWeak(&location, v5);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessoryAttachedNotificationName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __62__CSMagSafeAccessoryStatusObserver_initWithCoverSheetContext___block_invoke;
    v24[3] = &unk_1E8E2F600;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v9, 0, 0, v24);
    v11 = objc_claimAutoreleasedReturnValue();
    attachmentNotificationToken = v5->_attachmentNotificationToken;
    v5->_attachmentNotificationToken = v11;

    objc_msgSend(v4, "accessoryDetachedNotificationName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v10;
    v22[1] = 3221225472;
    v22[2] = __62__CSMagSafeAccessoryStatusObserver_initWithCoverSheetContext___block_invoke_2;
    v22[3] = &unk_1E8E2F600;
    objc_copyWeak(&v23, &location);
    objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v13, 0, 0, v22);
    v14 = objc_claimAutoreleasedReturnValue();
    detachmentNotificationToken = v5->_detachmentNotificationToken;
    v5->_detachmentNotificationToken = v14;

    objc_msgSend(v4, "accessoryAnimationStatusChangedNotificationName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v10;
    v20[1] = 3221225472;
    v20[2] = __62__CSMagSafeAccessoryStatusObserver_initWithCoverSheetContext___block_invoke_3;
    v20[3] = &unk_1E8E2F600;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", v16, 0, 0, v20);
    v17 = objc_claimAutoreleasedReturnValue();
    animationStatusNotificationToken = v5->_animationStatusNotificationToken;
    v5->_animationStatusNotificationToken = v17;

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);

    objc_destroyWeak(&location);
  }

  return v5;
}

void __62__CSMagSafeAccessoryStatusObserver_initWithCoverSheetContext___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "notifiedWithAccessoryAttached");

}

void __62__CSMagSafeAccessoryStatusObserver_initWithCoverSheetContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "notifiedWithAccessoryDetached");

}

void __62__CSMagSafeAccessoryStatusObserver_initWithCoverSheetContext___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "notifiedWithAccessoryAnimationStatusChanged");

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_attachmentNotificationToken);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self->_detachmentNotificationToken);

  v5.receiver = self;
  v5.super_class = (Class)CSMagSafeAccessoryStatusObserver;
  -[CSMagSafeAccessoryStatusObserver dealloc](&v5, sel_dealloc);
}

- (void)notifiedWithAccessoryAttached
{
  void *v3;
  id v4;

  -[CSMagSafeAccessoryStatusObserver delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CSMagSafeAccessoryStatusProviding lastAttachedAccessory](self->_statusProvider, "lastAttachedAccessory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessoryAttached:", v3);

  }
}

- (void)notifiedWithAccessoryDetached
{
  void *v3;
  id v4;

  -[CSMagSafeAccessoryStatusObserver delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[CSMagSafeAccessoryStatusProviding lastDetachedAccessory](self->_statusProvider, "lastDetachedAccessory");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessoryDetached:", v3);

  }
}

- (void)notifiedWithAccessoryAnimationStatusChanged
{
  id v3;

  -[CSMagSafeAccessoryStatusObserver delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "accessoryAnimationStatusChanged:", -[CSMagSafeAccessoryStatusProviding isAccessoryAnimationAllowed](self->_statusProvider, "isAccessoryAnimationAllowed"));

}

- (CSMagSafeAccessoryStatusDelegate)delegate
{
  return (CSMagSafeAccessoryStatusDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_statusProvider, 0);
  objc_storeStrong((id *)&self->_animationStatusNotificationToken, 0);
  objc_storeStrong((id *)&self->_detachmentNotificationToken, 0);
  objc_storeStrong((id *)&self->_attachmentNotificationToken, 0);
}

@end
