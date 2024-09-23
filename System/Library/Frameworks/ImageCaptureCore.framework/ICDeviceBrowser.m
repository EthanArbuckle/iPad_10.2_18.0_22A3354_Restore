@implementation ICDeviceBrowser

- (id)init
{
  ICDeviceBrowser *v2;
  void *v3;
  ICDeviceBrowser *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ICDeviceBrowser;
  v2 = -[ICDeviceBrowser init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICDeviceBrowser setInternalDevices:](v2, "setInternalDevices:", v3);

    -[ICDeviceBrowser setBrowsedDeviceTypeMask:](v2, "setBrowsedDeviceTypeMask:", 257);
    v2->_devicesLock._os_unfair_lock_opaque = 0;
    v4 = v2;
  }

  return v2;
}

- (ICDeviceTypeMask)browsedDeviceTypeMask
{
  return self->_internalBrowsedDeviceTypeMask;
}

- (void)setBrowsedDeviceTypeMask:(ICDeviceTypeMask)browsedDeviceTypeMask
{
  if (self->_internalBrowsedDeviceTypeMask != browsedDeviceTypeMask)
    self->_internalBrowsedDeviceTypeMask = browsedDeviceTypeMask;
}

- (void)start
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  NSObject *v25;
  uint64_t v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  NSObject *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  __ICOSLogCreate();
  v3 = CFSTR("ICDeviceBrowser");
  if ((unint64_t)objc_msgSend(CFSTR("ICDeviceBrowser"), "length") >= 0x15)
  {
    objc_msgSend(CFSTR("ICDeviceBrowser"), "substringWithRange:", 0, 18);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", CFSTR(".."));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("🔵 browser start"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v3);
    v8 = v6;
    v34 = 136446466;
    v35 = -[__CFString UTF8String](v7, "UTF8String");
    v36 = 2114;
    v37 = v5;
    _os_log_impl(&dword_1B98FC000, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v34, 0x16u);

  }
  -[ICDeviceBrowser delegate](self, "delegate");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    v11 = -[ICDeviceBrowser isBrowsing](self, "isBrowsing");

    if (!v11)
    {
      __ICOSLogCreate();
      v27 = CFSTR("ICDeviceBrowser");
      if ((unint64_t)objc_msgSend(CFSTR("ICDeviceBrowser"), "length") >= 0x15)
      {
        objc_msgSend(CFSTR("ICDeviceBrowser"), "substringWithRange:", 0, 18);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "stringByAppendingString:", CFSTR(".."));
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("🟢 browser started"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v31 = objc_retainAutorelease(v27);
        v32 = v30;
        v33 = -[__CFString UTF8String](v31, "UTF8String");
        v34 = 136446466;
        v35 = v33;
        v36 = 2114;
        v37 = v29;
        _os_log_impl(&dword_1B98FC000, v32, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v34, 0x16u);

      }
      -[ICDeviceBrowser setBrowsing:](self, "setBrowsing:", 1);
      +[ICCameraDeviceBrowser defaultBrowser](ICCameraDeviceBrowser, "defaultBrowser");
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString start:](v20, "start:", self);
      goto LABEL_24;
    }
  }
  if (-[ICDeviceBrowser isBrowsing](self, "isBrowsing"))
  {
    __ICOSLogCreate();
    v12 = CFSTR("ICDeviceBrowser");
    if ((unint64_t)objc_msgSend(CFSTR("ICDeviceBrowser"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("ICDeviceBrowser"), "substringWithRange:", 0, 18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByAppendingString:", CFSTR(".."));
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("🟢 browser already started"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_retainAutorelease(v12);
      v17 = v15;
      v18 = -[__CFString UTF8String](v16, "UTF8String");
      v34 = 136446466;
      v35 = v18;
      v36 = 2114;
      v37 = v14;
      _os_log_impl(&dword_1B98FC000, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v34, 0x16u);

    }
  }
  -[ICDeviceBrowser delegate](self, "delegate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    __ICOSLogCreate();
    v20 = CFSTR("ICDeviceBrowser");
    if ((unint64_t)objc_msgSend(CFSTR("ICDeviceBrowser"), "length") >= 0x15)
    {
      objc_msgSend(CFSTR("ICDeviceBrowser"), "substringWithRange:", 0, 18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "stringByAppendingString:", CFSTR(".."));
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("🔴 browser delegate nil"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_retainAutorelease(v20);
      v25 = v23;
      v26 = -[__CFString UTF8String](v24, "UTF8String");
      v34 = 136446466;
      v35 = v26;
      v36 = 2114;
      v37 = v22;
      _os_log_impl(&dword_1B98FC000, v25, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v34, 0x16u);

    }
LABEL_24:

  }
}

- (void)stop
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  NSObject *v8;
  _BOOL4 v9;
  unint64_t v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  NSObject *v17;
  uint64_t v18;
  ICDeviceTypeMask v19;
  void *v20;
  __CFString *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  NSObject *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  __ICOSLogCreate();
  v3 = CFSTR("ICDeviceBrowser");
  if ((unint64_t)objc_msgSend(CFSTR("ICDeviceBrowser"), "length") >= 0x15)
  {
    objc_msgSend(CFSTR("ICDeviceBrowser"), "substringWithRange:", 0, 18);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingString:", CFSTR(".."));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("🔵 browser stop"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v3);
    v8 = v6;
    v27 = 136446466;
    v28 = -[__CFString UTF8String](v7, "UTF8String");
    v29 = 2114;
    v30 = v5;
    _os_log_impl(&dword_1B98FC000, v8, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v27, 0x16u);

  }
  v9 = -[ICDeviceBrowser isBrowsing](self, "isBrowsing");
  __ICOSLogCreate();
  v10 = objc_msgSend(CFSTR("ICDeviceBrowser"), "length");
  if (v9)
  {
    if (v10 >= 0x15)
    {
      objc_msgSend(CFSTR("ICDeviceBrowser"), "substringWithRange:", 0, 18);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByAppendingString:", CFSTR(".."));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v13 = CFSTR("ICDeviceBrowser");
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("🟢 browser stopped"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_retainAutorelease(v13);
      v17 = v15;
      v18 = -[__CFString UTF8String](v16, "UTF8String");
      v27 = 136446466;
      v28 = v18;
      v29 = 2114;
      v30 = v14;
      _os_log_impl(&dword_1B98FC000, v17, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v27, 0x16u);

    }
    -[ICDeviceBrowser setBrowsing:](self, "setBrowsing:", 0);
    v19 = -[ICDeviceBrowser browsedDeviceTypeMask](self, "browsedDeviceTypeMask");
    -[ICDeviceBrowser setBrowsedDeviceTypeMask:](self, "setBrowsedDeviceTypeMask:", 0);
    +[ICCameraDeviceBrowser defaultBrowser](ICCameraDeviceBrowser, "defaultBrowser");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stop:", self);

    -[ICDeviceBrowser setBrowsedDeviceTypeMask:](self, "setBrowsedDeviceTypeMask:", v19);
  }
  else
  {
    if (v10 >= 0x15)
    {
      objc_msgSend(CFSTR("ICDeviceBrowser"), "substringWithRange:", 0, 18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringByAppendingString:", CFSTR(".."));
      v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v21 = CFSTR("ICDeviceBrowser");
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("🟢 browser already stopped"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)_gICOSLog;
    if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_retainAutorelease(v21);
      v25 = v23;
      v26 = -[__CFString UTF8String](v24, "UTF8String");
      v27 = 136446466;
      v28 = v26;
      v29 = 2114;
      v30 = v22;
      _os_log_impl(&dword_1B98FC000, v25, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", (uint8_t *)&v27, 0x16u);

    }
  }
}

- (NSArray)devices
{
  os_unfair_lock_s *p_devicesLock;
  void *v4;
  void *v5;
  void *v6;

  p_devicesLock = &self->_devicesLock;
  os_unfair_lock_lock(&self->_devicesLock);
  v4 = (void *)MEMORY[0x1E0C99D20];
  -[ICDeviceBrowser internalDevices](self, "internalDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_devicesLock);
  return (NSArray *)v6;
}

- (ICDevice)preferredDevice
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[ICDeviceBrowser devices](self, "devices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "preferred"))
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (ICDevice *)v3;
}

- (void)addDevice:(id)a3 moreComing:(BOOL)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  os_unfair_lock_lock(&self->_devicesLock);
  -[ICDeviceBrowser internalDevices](self, "internalDevices");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

  os_unfair_lock_unlock(&self->_devicesLock);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ICDeviceBrowser_addDevice_moreComing___block_invoke;
  block[3] = &unk_1E70C7BD8;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  ICPerformBlockOnMainThread(block);

}

void __40__ICDeviceBrowser_addDevice_moreComing___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  NSObject *v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("devices"));
  objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("devices"));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deviceBrowser:didAddDevice:moreComing:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

  }
  __ICOSLogCreate();
  v4 = CFSTR("Dev Browser");
  if ((unint64_t)objc_msgSend(CFSTR("Dev Browser"), "length") >= 0x15)
  {
    objc_msgSend(CFSTR("Dev Browser"), "substringWithRange:", 0, 18);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", CFSTR(".."));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 40), "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("Added: %@"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)_gICOSLog;
  if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_retainAutorelease(v4);
    v11 = v9;
    *(_DWORD *)buf = 136446466;
    v13 = -[__CFString UTF8String](v10, "UTF8String");
    v14 = 2114;
    v15 = v8;
    _os_log_impl(&dword_1B98FC000, v11, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

  }
}

- (void)removeDevice:(id)a3 moreGoing:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__ICDeviceBrowser_removeDevice_moreGoing___block_invoke;
  block[3] = &unk_1E70C7BD8;
  block[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  ICPerformBlockOnMainThread(block);

}

void __42__ICDeviceBrowser_removeDevice_moreGoing___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  NSObject *v14;
  uint64_t v15;
  os_unfair_lock_s lock;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "isBrowsing"))
  {
    objc_msgSend(*(id *)(a1 + 32), "internalDevices");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

    if (v3)
    {
      objc_msgSend(*(id *)(a1 + 40), "cleanupDeviceWithErrorCode:completionBlock:", &unk_1E70DC668, 0);
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "deviceBrowser:didRemoveDevice:moreGoing:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

      }
      lock._os_unfair_lock_opaque = objc_msgSend(*(id *)(a1 + 32), "devicesLock");
      os_unfair_lock_lock(&lock);
      objc_msgSend(*(id *)(a1 + 32), "willChangeValueForKey:", CFSTR("devices"));
      objc_msgSend(*(id *)(a1 + 32), "internalDevices");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "removeObject:", *(_QWORD *)(a1 + 40));

      objc_msgSend(*(id *)(a1 + 32), "didChangeValueForKey:", CFSTR("devices"));
      os_unfair_lock_unlock(&lock);
      __ICOSLogCreate();
      v7 = CFSTR("Dev Browser");
      if ((unint64_t)objc_msgSend(CFSTR("Dev Browser"), "length") >= 0x15)
      {
        objc_msgSend(CFSTR("Dev Browser"), "substringWithRange:", 0, 18);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "stringByAppendingString:", CFSTR(".."));
        v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(*(id *)(a1 + 40), "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("Removed: %@"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)_gICOSLog;
      if (os_log_type_enabled((os_log_t)_gICOSLog, OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_retainAutorelease(v7);
        v14 = v12;
        v15 = -[__CFString UTF8String](v13, "UTF8String");
        *(_DWORD *)buf = 136446466;
        v18 = v15;
        v19 = 2114;
        v20 = v11;
        _os_log_impl(&dword_1B98FC000, v14, OS_LOG_TYPE_DEFAULT, "%{public}20s | %{public}@", buf, 0x16u);

      }
    }
  }
}

- (BOOL)containsDevice:(id)a3
{
  os_unfair_lock_s *p_devicesLock;
  id v5;
  void *v6;
  char v7;

  p_devicesLock = &self->_devicesLock;
  v5 = a3;
  os_unfair_lock_lock(p_devicesLock);
  -[ICDeviceBrowser internalDevices](self, "internalDevices");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v5);

  os_unfair_lock_unlock(p_devicesLock);
  return v7;
}

- (id)deviceWithRef:(id)a3
{
  id v4;
  os_unfair_lock_s *p_devicesLock;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_devicesLock = &self->_devicesLock;
  os_unfair_lock_lock(&self->_devicesLock);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[ICDeviceBrowser internalDevices](self, "internalDevices", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "deviceRef");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "intValue");
        v13 = objc_msgSend(v4, "intValue");

        if (v12 == v13)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_devicesLock);
  return v7;
}

- (ICAuthorizationStatus)contentsAuthorizationStatus
{
  void *v2;
  void *v3;

  +[ICPrefManager defaultAuthManager](ICPrefManager, "defaultAuthManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getContentsAuthorizationStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICAuthorizationStatus)v3;
}

- (void)requestContentsAuthorizationWithCompletion:(void *)completion
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = completion;
  dispatch_get_global_queue(33, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__ICDeviceBrowser_requestContentsAuthorizationWithCompletion___block_invoke;
  block[3] = &unk_1E70C7658;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __62__ICDeviceBrowser_requestContentsAuthorizationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  +[ICPrefManager defaultAuthManager](ICPrefManager, "defaultAuthManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62__ICDeviceBrowser_requestContentsAuthorizationWithCompletion___block_invoke_2;
  v3[3] = &unk_1E70C7B18;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "requestContentsAuthorizationShouldPrompt:completion:", 1, v3);

}

void __62__ICDeviceBrowser_requestContentsAuthorizationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("ICAuthorizationStatus"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (ICAuthorizationStatus)controlAuthorizationStatus
{
  void *v2;
  void *v3;

  +[ICPrefManager defaultAuthManager](ICPrefManager, "defaultAuthManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getControlAuthorizationStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICAuthorizationStatus)v3;
}

- (void)requestControlAuthorizationWithCompletion:(void *)completion
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = completion;
  dispatch_get_global_queue(33, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__ICDeviceBrowser_requestControlAuthorizationWithCompletion___block_invoke;
  block[3] = &unk_1E70C7658;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __61__ICDeviceBrowser_requestControlAuthorizationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  +[ICPrefManager defaultAuthManager](ICPrefManager, "defaultAuthManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__ICDeviceBrowser_requestControlAuthorizationWithCompletion___block_invoke_2;
  v3[3] = &unk_1E70C7B18;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "requestControlAuthorizationShouldPrompt:completion:", 1, v3);

}

void __61__ICDeviceBrowser_requestControlAuthorizationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("ICAuthorizationStatus"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)resetContentsAuthorizationWithCompletion:(void *)completion
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = completion;
  dispatch_get_global_queue(33, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__ICDeviceBrowser_resetContentsAuthorizationWithCompletion___block_invoke;
  block[3] = &unk_1E70C7658;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __60__ICDeviceBrowser_resetContentsAuthorizationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  +[ICPrefManager defaultAuthManager](ICPrefManager, "defaultAuthManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__ICDeviceBrowser_resetContentsAuthorizationWithCompletion___block_invoke_2;
  v3[3] = &unk_1E70C7B18;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "resetContentsAuthorizationWithCompletion:", v3);

}

void __60__ICDeviceBrowser_resetContentsAuthorizationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("ICAuthorizationStatus"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)resetControlAuthorizationWithCompletion:(void *)completion
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = completion;
  dispatch_get_global_queue(33, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ICDeviceBrowser_resetControlAuthorizationWithCompletion___block_invoke;
  block[3] = &unk_1E70C7658;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void __59__ICDeviceBrowser_resetControlAuthorizationWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  +[ICPrefManager defaultAuthManager](ICPrefManager, "defaultAuthManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__ICDeviceBrowser_resetControlAuthorizationWithCompletion___block_invoke_2;
  v3[3] = &unk_1E70C7B18;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(v2, "resetControlAuthorizationWithCompletion:", v3);

}

void __59__ICDeviceBrowser_resetControlAuthorizationWithCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("ICAuthorizationStatus"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)delegate
{
  self->_delegate = (ICDeviceBrowserDelegate *)delegate;
}

- (BOOL)isBrowsing
{
  return self->_browsing;
}

- (void)setBrowsing:(BOOL)a3
{
  self->_browsing = a3;
}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (NSMutableArray)internalDevices
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setInternalDevices:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (unint64_t)internalBrowsedDeviceTypeMask
{
  return self->_internalBrowsedDeviceTypeMask;
}

- (void)setInternalBrowsedDeviceTypeMask:(unint64_t)a3
{
  self->_internalBrowsedDeviceTypeMask = a3;
}

- (os_unfair_lock_s)devicesLock
{
  return self->_devicesLock;
}

- (void)setDevicesLock:(os_unfair_lock_s)a3
{
  self->_devicesLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalDevices, 0);
}

@end
