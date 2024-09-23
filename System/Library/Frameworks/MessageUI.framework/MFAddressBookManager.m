@implementation MFAddressBookManager

- (void)addClient:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable addObject:](self->_clients, "addObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_1);
  return (id)sharedManager_sharedManager;
}

- (void)addressBook
{
  void *result;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  CFErrorRef error;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  result = self->_addressBook;
  if (!result)
  {
    error = 0;
    v4 = (void *)ABAddressBookCreateWithOptions(0, &error);
    self->_addressBook = v4;
    if (v4)
    {
      ABAddressBookRegisterChangeCallback();
      ABAddressBookRegisterExternalChangeCallback(self->_addressBook, (ABExternalChangeCallback)_AddressBookEventHandler, self);
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_addressBookPreferencesChanged, CFSTR("com.apple.AddressBook.PreferenceChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    if (error)
      CFRelease(error);
    return self->_addressBook;
  }
  return result;
}

void __37__MFAddressBookManager_sharedManager__block_invoke()
{
  MFAddressBookManager *v0;
  void *v1;

  v0 = objc_alloc_init(MFAddressBookManager);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;

}

- (MFAddressBookManager)init
{
  MFAddressBookManager *v2;
  MFAddressBookManager *v3;
  uint64_t v4;
  NSHashTable *clients;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MFAddressBookManager;
  v2 = -[MFAddressBookManager init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    clients = v3->_clients;
    v3->_clients = (NSHashTable *)v4;

  }
  return v3;
}

+ (BOOL)isAuthorizedToUseAddressBook
{
  if (isAuthorizedToUseAddressBook_onceToken != -1)
    dispatch_once(&isAuthorizedToUseAddressBook_onceToken, &__block_literal_global_1);
  return isAuthorizedToUseAddressBook_sIsAuthorizedToUseAddressBook;
}

ABAuthorizationStatus __52__MFAddressBookManager_isAuthorizedToUseAddressBook__block_invoke()
{
  ABAuthorizationStatus result;

  result = ABAddressBookGetAuthorizationStatus();
  isAuthorizedToUseAddressBook_sIsAuthorizedToUseAddressBook = (unint64_t)(result - 3) < 0xFFFFFFFFFFFFFFFELL;
  return result;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v4;
  objc_super v5;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  if (self->_addressBook)
  {
    ABAddressBookUnregisterChangeCallback();
    ABAddressBookUnregisterExternalChangeCallback(self->_addressBook, (ABExternalChangeCallback)_AddressBookEventHandler, self);
    CFRelease(self->_addressBook);
  }
  v5.receiver = self;
  v5.super_class = (Class)MFAddressBookManager;
  -[MFAddressBookManager dealloc](&v5, sel_dealloc);
}

- (id)_clientsArray
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_clients, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)_handleAddressBookChangeNotification
{
  void *addressBook;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  addressBook = self->_addressBook;
  if (addressBook)
    ABAddressBookRevert(addressBook);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[MFAddressBookManager _clientsArray](self, "_clientsArray", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "addressBookManager:addressBookDidChange:", self, self->_addressBook);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_handleAddressBookPrefsChangeNotification
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[MFAddressBookManager _clientsArray](self, "_clientsArray", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "addressBookPreferencesChangedForAddressBookManager:", self);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)removeClient:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSHashTable removeObject:](self->_clients, "removeObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
}

@end
