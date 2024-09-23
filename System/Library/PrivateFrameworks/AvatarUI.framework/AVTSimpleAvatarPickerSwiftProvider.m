@implementation AVTSimpleAvatarPickerSwiftProvider

- (AVTSimpleAvatarPickerSwiftProvider)initWithDelegate:(id)a3 allowAddItem:(BOOL)a4 allowEditing:(BOOL)a5 interItemSpacing:(double)a6
{
  return -[AVTSimpleAvatarPickerSwiftProvider initWithDelegate:allowAddItem:allowEditing:interItemSpacing:shouldReverseNaturalLayout:](self, "initWithDelegate:allowAddItem:allowEditing:interItemSpacing:shouldReverseNaturalLayout:", a3, a4, a5, 0, a6);
}

- (AVTSimpleAvatarPickerSwiftProvider)initWithDelegate:(id)a3 allowAddItem:(BOOL)a4 allowEditing:(BOOL)a5 interItemSpacing:(double)a6 shouldReverseNaturalLayout:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v9;
  _BOOL8 v10;
  id v12;
  AVTSimpleAvatarPickerSwiftProvider *v13;
  uint64_t v14;
  AVTUIEnvironment *environment;
  uint64_t v16;
  AVTUILogger *logger;
  AVTAvatarStore *v18;
  AVTAvatarStore *avatarStore;
  AVTSimpleAvatarPicker *v20;
  AVTSimpleAvatarPicker *avatarPicker;
  NSString *presentedIdentifier;
  objc_super v24;

  v7 = a7;
  v9 = a5;
  v10 = a4;
  v12 = a3;
  v24.receiver = self;
  v24.super_class = (Class)AVTSimpleAvatarPickerSwiftProvider;
  v13 = -[AVTSimpleAvatarPickerSwiftProvider init](&v24, sel_init);
  if (v13)
  {
    +[AVTUIEnvironment defaultEnvironment](AVTUIEnvironment, "defaultEnvironment");
    v14 = objc_claimAutoreleasedReturnValue();
    environment = v13->_environment;
    v13->_environment = (AVTUIEnvironment *)v14;

    -[AVTUIEnvironment logger](v13->_environment, "logger");
    v16 = objc_claimAutoreleasedReturnValue();
    logger = v13->_logger;
    v13->_logger = (AVTUILogger *)v16;

    objc_storeWeak((id *)&v13->_delegate, v12);
    v18 = objc_alloc_init(AVTAvatarStore);
    avatarStore = v13->_avatarStore;
    v13->_avatarStore = v18;

    v20 = -[AVTSimpleAvatarPicker initWithStore:environment:allowAddItem:interItemSpacing:shouldReverseNaturalLayout:]([AVTSimpleAvatarPicker alloc], "initWithStore:environment:allowAddItem:interItemSpacing:shouldReverseNaturalLayout:", v13->_avatarStore, v13->_environment, v10, v7, a6);
    avatarPicker = v13->_avatarPicker;
    v13->_avatarPicker = v20;

    -[AVTSimpleAvatarPicker setAvatarPickerDelegate:](v13->_avatarPicker, "setAvatarPickerDelegate:", v13);
    -[AVTSimpleAvatarPicker setAllowEditing:](v13->_avatarPicker, "setAllowEditing:", v9);
    -[AVTSimpleAvatarPicker reloadDataSource](v13->_avatarPicker, "reloadDataSource");
    -[AVTSimpleAvatarPicker setPresenterDelegate:](v13->_avatarPicker, "setPresenterDelegate:", v13);
    presentedIdentifier = v13->_presentedIdentifier;
    v13->_presentedIdentifier = 0;

    -[AVTSimpleAvatarPickerSwiftProvider beginObservingAvatarStoreChanges](v13, "beginObservingAvatarStoreChanges");
  }

  return v13;
}

- (void)dealloc
{
  void *v3;
  NSObject *avatarStoreChangeObserver;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_avatarStoreChangeObserver);

  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = 0;

  v5.receiver = self;
  v5.super_class = (Class)AVTSimpleAvatarPickerSwiftProvider;
  -[AVTSimpleAvatarPickerSwiftProvider dealloc](&v5, sel_dealloc);
}

- (id)avatarPickerView
{
  return -[AVTSimpleAvatarPicker view](self->_avatarPicker, "view");
}

- (UIEdgeInsets)contentInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  -[AVTSimpleAvatarPicker contentInset](self->_avatarPicker, "contentInset");
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  -[AVTSimpleAvatarPicker setContentInset:](self->_avatarPicker, "setContentInset:", a3.top, a3.left, a3.bottom, a3.right);
}

- (void)presentActionsForSelectedAvatar
{
  -[AVTSimpleAvatarPicker presentActionsForSelectedAvatar](self->_avatarPicker, "presentActionsForSelectedAvatar");
}

- (void)beginObservingAvatarStoreChanges
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *avatarStoreChangeObserver;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0D006D8];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__AVTSimpleAvatarPickerSwiftProvider_beginObservingAvatarStoreChanges__block_invoke;
  v7[3] = &unk_1EA51DB40;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, 0, 0, v7);
  v5 = objc_claimAutoreleasedReturnValue();
  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __70__AVTSimpleAvatarPickerSwiftProvider_beginObservingAvatarStoreChanges__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_notifyStoreChanged");

}

- (void)endObservingAvatarStoreChanges
{
  void *v3;
  NSObject *avatarStoreChangeObserver;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_avatarStoreChangeObserver);

  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = 0;

}

- (void)_notifyStoreChanged
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __57__AVTSimpleAvatarPickerSwiftProvider__notifyStoreChanged__block_invoke;
  v2[3] = &unk_1EA51D7E8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __57__AVTSimpleAvatarPickerSwiftProvider__notifyStoreChanged__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "avatarPicker");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(WeakRetained, "avatarPicker");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "reloadDataSource");

    objc_msgSend(WeakRetained, "updatePickerSelectionWithAnimation:", 1);
  }

}

- (void)updatePickerSelectionWithAnimation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[AVTSimpleAvatarPickerSwiftProvider avatarPicker](self, "avatarPicker");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AVTSimpleAvatarPickerSwiftProvider presentedIdentifier](self, "presentedIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectAvatarRecordWithIdentifier:animated:", v5, v3);

}

- (void)updatePresentedRecordWithRecord:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  if (a3)
  {
    objc_msgSend(a3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "copy");

  }
  else
  {
    v7 = 0;
  }
  -[AVTSimpleAvatarPickerSwiftProvider updatePresentedRecordWithIdentifier:animated:](self, "updatePresentedRecordWithIdentifier:animated:", v7, v4);

}

- (void)updatePresentedRecordWithIdentifier:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;

  if (self->_presentedIdentifier != a3)
  {
    v4 = a4;
    -[AVTSimpleAvatarPickerSwiftProvider setPresentedIdentifier:](self, "setPresentedIdentifier:");
    -[AVTSimpleAvatarPickerSwiftProvider updatePickerSelectionWithAnimation:](self, "updatePickerSelectionWithAnimation:", v4);
  }
}

- (void)avatarPicker:(id)a3 didSelectAvatarRecord:(id)a4
{
  id WeakRetained;
  id v6;
  id v7;

  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    -[AVTSimpleAvatarPickerSwiftProvider updatePresentedRecordWithRecord:animated:](self, "updatePresentedRecordWithRecord:animated:", v7, 1);
    v6 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v6, "avatarPicker:didSelectAvatarRecord:", self, v7);

  }
}

- (void)dismissAvatarUIControllerAnimated:(BOOL)a3
{
  _BOOL8 v3;
  AVTSimpleAvatarPickerSwiftProviderDelegate **p_delegate;
  id WeakRetained;
  id v7;

  v3 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    -[AVTSimpleAvatarPickerSwiftProvider updatePickerSelectionWithAnimation:](self, "updatePickerSelectionWithAnimation:", 0);
    v7 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v7, "dismissAvatarUIControllerWithIdentifier:animated:", self->_presentedIdentifier, v3);

  }
}

- (void)presentedAvatarRecord:(id)a3
{
  -[AVTSimpleAvatarPickerSwiftProvider updatePresentedRecordWithRecord:animated:](self, "updatePresentedRecordWithRecord:animated:", a3, 0);
}

- (void)presentAvatarUIController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  AVTSimpleAvatarPickerSwiftProviderDelegate **p_delegate;
  id WeakRetained;
  id v8;
  id v9;

  v4 = a4;
  v9 = a3;
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "presentAvatarUIController:animated:", v9, v4);

  }
}

- (AVTAvatarPickerDelegate)avatarPickerDelegate
{
  return (AVTAvatarPickerDelegate *)objc_loadWeakRetained((id *)&self->avatarPickerDelegate);
}

- (void)setAvatarPickerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->avatarPickerDelegate, a3);
}

- (AVTPresenterDelegate)presenterDelegate
{
  return (AVTPresenterDelegate *)objc_loadWeakRetained((id *)&self->presenterDelegate);
}

- (void)setPresenterDelegate:(id)a3
{
  objc_storeWeak((id *)&self->presenterDelegate, a3);
}

- (UIView)view
{
  return self->view;
}

- (AVTSimpleAvatarPickerSwiftProviderDelegate)delegate
{
  return (AVTSimpleAvatarPickerSwiftProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AVTAvatarStore)avatarStore
{
  return self->_avatarStore;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTSimpleAvatarPicker)avatarPicker
{
  return self->_avatarPicker;
}

- (NSObject)avatarStoreChangeObserver
{
  return self->_avatarStoreChangeObserver;
}

- (void)setAvatarStoreChangeObserver:(id)a3
{
  objc_storeStrong((id *)&self->_avatarStoreChangeObserver, a3);
}

- (NSString)presentedIdentifier
{
  return self->_presentedIdentifier;
}

- (void)setPresentedIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_presentedIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedIdentifier, 0);
  objc_storeStrong((id *)&self->_avatarStoreChangeObserver, 0);
  objc_storeStrong((id *)&self->_avatarPicker, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_avatarStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->view, 0);
  objc_destroyWeak((id *)&self->presenterDelegate);
  objc_destroyWeak((id *)&self->avatarPickerDelegate);
}

@end
