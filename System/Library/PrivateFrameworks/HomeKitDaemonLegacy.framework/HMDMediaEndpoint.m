@implementation HMDMediaEndpoint

- (HMDMediaEndpoint)initWithEndpoint:(void *)a3
{
  HMDMediaEndpoint *v4;
  id v5;
  const char *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *workQueue;
  uint64_t v10;
  NSString *sessionIdentifier;
  uint64_t v12;
  NSString *localizedName;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSString *logID;
  uint64_t v19;
  NSMutableArray *pendingBlocks;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)HMDMediaEndpoint;
  v4 = -[HMDMediaEndpoint init](&v22, sel_init);
  if (!v4)
    goto LABEL_4;
  if (a3)
  {
    CFRetain(a3);
    v4->_retainedEndpoint = a3;
    HMDispatchQueueNameString();
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (const char *)objc_msgSend(v5, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create(v6, v7);
    workQueue = v4->_workQueue;
    v4->_workQueue = (OS_dispatch_queue *)v8;

    v10 = MRAVEndpointCopyUniqueIdentifier();
    sessionIdentifier = v4->_sessionIdentifier;
    v4->_sessionIdentifier = (NSString *)v10;

    v12 = MRAVEndpointCopyLocalizedName();
    localizedName = v4->_localizedName;
    v4->_localizedName = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E0CB3940];
    -[HMDMediaEndpoint localizedName](v4, "localizedName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaEndpoint sessionIdentifier](v4, "sessionIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Endpoint(%@/%@)"), v15, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    logID = v4->_logID;
    v4->_logID = (NSString *)v17;

    v4->_connectionState = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    pendingBlocks = v4->_pendingBlocks;
    v4->_pendingBlocks = (NSMutableArray *)v19;

    -[HMDMediaEndpoint updateOutputDevicesAndConnectWithCompletionHandler:](v4, "updateOutputDevicesAndConnectWithCompletionHandler:", 0);
LABEL_4:
    a3 = v4;
  }

  return (HMDMediaEndpoint *)a3;
}

- (void)dealloc
{
  void *retainedEndpoint;
  objc_super v4;

  retainedEndpoint = self->_retainedEndpoint;
  if (retainedEndpoint)
  {
    CFRelease(retainedEndpoint);
    self->_retainedEndpoint = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)HMDMediaEndpoint;
  -[HMDMediaEndpoint dealloc](&v4, sel_dealloc);
}

- (unint64_t)hash
{
  return -[NSString hash](self->_sessionIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  HMDMediaEndpoint *v4;
  HMDMediaEndpoint *v5;
  HMDMediaEndpoint *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  BOOL v11;

  v4 = (HMDMediaEndpoint *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6
      && (-[HMDMediaEndpoint sessionIdentifier](self, "sessionIdentifier"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          -[HMDMediaEndpoint sessionIdentifier](v6, "sessionIdentifier"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v7, "isEqual:", v8),
          v8,
          v7,
          v9))
    {
      v10 = -[HMDMediaEndpoint retainedEndpoint](v6, "retainedEndpoint");
      v11 = -[HMDMediaEndpoint isEqualToEndpoint:](self, "isEqualToEndpoint:", v10);
      if (v10)
        CFRelease(v10);
    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (BOOL)isEqualToEndpoint:(void *)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(a3) = self->_retainedEndpoint == a3;
  os_unfair_lock_unlock(p_lock);
  return (char)a3;
}

- (void)retainedEndpoint
{
  os_unfair_lock_s *p_lock;
  void *retainedEndpoint;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  retainedEndpoint = self->_retainedEndpoint;
  if (retainedEndpoint)
    CFRetain(retainedEndpoint);
  os_unfair_lock_unlock(p_lock);
  return retainedEndpoint;
}

- (void)setRetainedEndpoint:(void *)a3
{
  void *retainedEndpoint;

  if (a3)
    CFRetain(a3);
  os_unfair_lock_lock_with_options();
  retainedEndpoint = self->_retainedEndpoint;
  if (retainedEndpoint == a3)
  {
    if (a3)
      CFRelease(a3);
  }
  else
  {
    self->_retainedEndpoint = a3;
    if (retainedEndpoint)
      CFRelease(retainedEndpoint);
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_updateOutputDeviceIdentifiers
{
  void *v3;
  const void *v4;
  const __CFArray *v5;
  const __CFArray *v6;
  CFIndex Count;
  void *v8;
  CFIndex i;
  void *v10;
  void *v11;

  v3 = -[HMDMediaEndpoint retainedEndpoint](self, "retainedEndpoint");
  if (v3)
  {
    v4 = v3;
    v5 = (const __CFArray *)MRAVEndpointCopyOutputDevices();
    if (v5)
    {
      v6 = v5;
      Count = CFArrayGetCount(v5);
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", Count);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (Count >= 1)
      {
        for (i = 0; i != Count; ++i)
        {
          if (CFArrayGetValueAtIndex(v6, i))
          {
            v10 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
            if (v10)
              objc_msgSend(v8, "addObject:", v10);

          }
        }
      }
      v11 = (void *)objc_msgSend(v8, "copy");
      -[HMDMediaEndpoint setOutputDeviceIdentifiers:](self, "setOutputDeviceIdentifiers:", v11);

      CFRelease(v6);
    }
    CFRelease(v4);
  }
}

- (void)updateWithEndpoint:(id)a3
{
  CFTypeRef *v4;
  CFTypeRef *v5;
  CFTypeRef v6;
  NSObject *v7;
  _QWORD v8[6];

  v4 = (CFTypeRef *)a3;
  v5 = v4;
  v6 = v4[2];
  if (v6)
    CFRetain(v4[2]);
  -[HMDMediaEndpoint workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__HMDMediaEndpoint_updateWithEndpoint___block_invoke;
  v8[3] = &unk_1E89C0B98;
  v8[4] = self;
  v8[5] = v6;
  dispatch_async(v7, v8);

}

- (unsigned)connectionState
{
  HMDMediaEndpoint *v2;
  os_unfair_lock_s *p_lock;

  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LODWORD(v2) = v2->_connectionState;
  os_unfair_lock_unlock(p_lock);
  return v2;
}

- (void)setConnectionState:(unsigned int)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_connectionState = a3;
  os_unfair_lock_unlock(p_lock);
}

- (NSSet)outputDeviceIdentifiers
{
  os_unfair_lock_s *p_lock;
  NSSet *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = self->_outputDeviceIdentifiers;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setOutputDeviceIdentifiers:(id)a3
{
  NSSet *v4;
  NSSet *outputDeviceIdentifiers;

  v4 = (NSSet *)a3;
  os_unfair_lock_lock_with_options();
  outputDeviceIdentifiers = self->_outputDeviceIdentifiers;
  self->_outputDeviceIdentifiers = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isConnected
{
  return -[HMDMediaEndpoint connectionState](self, "connectionState") != 3;
}

- (void)externalDevice
{
  void *v3;
  const void *v4;
  void *ExternalDevice;
  void *v6;
  HMDMediaEndpoint *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  HMDMediaEndpoint *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  const void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = -[HMDMediaEndpoint retainedEndpoint](self, "retainedEndpoint");
  if (v3)
  {
    v4 = v3;
    ExternalDevice = (void *)MRAVEndpointGetExternalDevice();
    if (!ExternalDevice)
    {
      v6 = (void *)MEMORY[0x1D17BA0A0]();
      v7 = self;
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543618;
        v16 = v9;
        v17 = 2112;
        v18 = v4;
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Cannot look up the external device for endpoint %@", (uint8_t *)&v15, 0x16u);

      }
      objc_autoreleasePoolPop(v6);
    }
    CFRelease(v4);
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@No endpoint to look up origin", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v10);
    return 0;
  }
  return ExternalDevice;
}

- (void)copyOrigin
{
  void *result;
  void *v4;
  HMDMediaEndpoint *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  result = -[HMDMediaEndpoint externalDevice](self, "externalDevice");
  if (result)
  {
    result = (void *)MRExternalDeviceCopyCustomOrigin();
    if (!result)
    {
      v4 = (void *)MEMORY[0x1D17BA0A0]();
      v5 = self;
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = 138543362;
        v9 = v7;
        _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_INFO, "%{public}@Cannot look up origin from external device", (uint8_t *)&v8, 0xCu);

      }
      objc_autoreleasePoolPop(v4);
      return 0;
    }
  }
  return result;
}

- (void)disconnectFromEndpoint:(void *)a3
{
  NSObject *v5;
  _QWORD block[5];

  CFRetain(a3);
  -[HMDMediaEndpoint workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__HMDMediaEndpoint_disconnectFromEndpoint___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  dispatch_async(v5, block);

}

- (void)disconnectWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDMediaEndpoint workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HMDMediaEndpoint_disconnectWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E89C1D68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_updateOutputDevicesAndConnectWithCompletionHandler:(id)a3
{
  id v4;

  v4 = a3;
  -[HMDMediaEndpoint _updateOutputDeviceIdentifiers](self, "_updateOutputDeviceIdentifiers");
  -[HMDMediaEndpoint _connectWithCompletionHandler:](self, "_connectWithCompletionHandler:", v4);

}

- (void)updateOutputDevicesAndConnectWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDMediaEndpoint workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__HMDMediaEndpoint_updateOutputDevicesAndConnectWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E89C1D68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_connectWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const void *v8;
  uint64_t ConnectionState;
  uint64_t v10;
  void *v11;
  void *v12;
  HMDMediaEndpoint *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  HMDMediaEndpoint *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[HMDMediaEndpoint pendingBlocks](self, "pendingBlocks");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = _Block_copy(v4);
    objc_msgSend(v5, "addObject:", v6);

  }
  v7 = -[HMDMediaEndpoint externalDevice](self, "externalDevice");
  if (v7)
  {
    v8 = v7;
    CFRetain(v7);
    ConnectionState = MRExternalDeviceGetConnectionState();
    v10 = -[HMDMediaEndpoint setConnectionState:](self, "setConnectionState:", ConnectionState);
    if ((_DWORD)ConnectionState == 1)
    {
      v12 = (void *)MEMORY[0x1D17BA0A0](v10);
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v15;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Already in the process of connecting to the external device...", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v12);
      CFRelease(v8);
    }
    else if ((_DWORD)ConnectionState == 2)
    {
      -[HMDMediaEndpoint _notifyPendingBlocksOfError:](self, "_notifyPendingBlocksOfError:", 0);
      CFRelease(v8);
    }
    else
    {
      v16 = (void *)MEMORY[0x1D17BA0A0](v10);
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v25 = v19;
        _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_INFO, "%{public}@No connection to external device - setting up connection state callback and attempting to connect...", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      -[HMDMediaEndpoint setConnectionState:](v17, "setConnectionState:", 1);
      -[HMDMediaEndpoint sessionIdentifier](v17, "sessionIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak((id *)buf, v17);
      -[HMDMediaEndpoint workQueue](v17, "workQueue");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_copyWeak(&v23, (id *)buf);
      v22 = v20;
      MRExternalDeviceSetConnectionStateCallback();

      MRExternalDeviceConnect();
      CFRelease(v8);

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 54);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaEndpoint _notifyPendingBlocksOfError:](self, "_notifyPendingBlocksOfError:", v11);

  }
}

- (void)registerForNowPlayingUpdates:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  HMDMediaEndpoint *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v3 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v5 = -[HMDMediaEndpoint externalDevice](self, "externalDevice");
  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      v12 = CFSTR("De-registering");
      if (v3)
        v12 = CFSTR("Registering");
      v14 = 138543618;
      v15 = v10;
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@%@ for playback state changes", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    CFRetain(v5);
    MRExternalDeviceSetWantsNowPlayingUpdates();
    CFRelease(v5);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = (uint64_t)v13;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot look up external device for endpoint to register for playback state updates", (uint8_t *)&v14, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }
}

- (NSArray)advertisements
{
  void *v2;
  const void *v3;
  uint64_t v4;
  const void *v5;
  void *v6;
  void *v7;

  v2 = -[HMDMediaEndpoint retainedEndpoint](self, "retainedEndpoint");
  if (v2)
  {
    v3 = v2;
    v4 = MRAVEndpointCopyOutputDevices();
    if (v4)
    {
      v5 = (const void *)v4;
      +[HMDMediaBrowser advertisementsFromOutputDevices:](HMDMediaBrowser, "advertisementsFromOutputDevices:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "allObjects");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      CFRelease(v5);
    }
    else
    {
      v7 = 0;
    }
    CFRelease(v3);
  }
  else
  {
    v7 = 0;
  }
  return (NSArray *)v7;
}

- (BOOL)doesContainAnyAccessory:(id)a3
{
  NSSet *outputDeviceIdentifiers;
  id v4;
  void *v5;
  void *v6;

  outputDeviceIdentifiers = self->_outputDeviceIdentifiers;
  v4 = a3;
  v5 = (void *)-[NSSet mutableCopy](outputDeviceIdentifiers, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "intersectSet:", v6);
  LOBYTE(v4) = objc_msgSend(v5, "count") != 0;

  return (char)v4;
}

- (void)_notifyPendingBlocksOfError:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HMDMediaEndpoint pendingBlocks](self, "pendingBlocks", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  -[HMDMediaEndpoint pendingBlocks](self, "pendingBlocks");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeAllObjects");

}

- (void)getPlaybackStateWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDMediaEndpoint workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__HMDMediaEndpoint_getPlaybackStateWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E89C1D68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_getPlaybackStateWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__HMDMediaEndpoint__getPlaybackStateWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E89BE698;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[HMDMediaEndpoint _connectWithCompletionHandler:](self, "_connectWithCompletionHandler:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)setPlaybackState:(unsigned int)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unsigned int v11;

  v6 = a4;
  -[HMDMediaEndpoint workQueue](self, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__HMDMediaEndpoint_setPlaybackState_completionHandler___block_invoke;
  block[3] = &unk_1E89B02D8;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)_setPlaybackState:(unsigned int)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  unsigned int v11;
  id location;

  v6 = a4;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__HMDMediaEndpoint__setPlaybackState_completionHandler___block_invoke;
  v8[3] = &unk_1E89AF9C8;
  objc_copyWeak(&v10, &location);
  v7 = v6;
  v9 = v7;
  v11 = a3;
  -[HMDMediaEndpoint _connectWithCompletionHandler:](self, "_connectWithCompletionHandler:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[HMDMediaEndpoint retainedEndpoint](self, "retainedEndpoint");
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[HMDMediaEndpoint localizedName](self, "localizedName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaEndpoint sessionIdentifier](self, "sessionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaEndpoint advertisements](self, "advertisements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("Endpoint(%@/%@) - sessionIdentifier %@  advertisements:\n%@"), v3, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    CFRelease(v3);
  return (NSString *)v8;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSString)logID
{
  return self->_logID;
}

- (HMDMediaBrowser)browser
{
  return (HMDMediaBrowser *)objc_loadWeakRetained((id *)&self->_browser);
}

- (void)setBrowser:(id)a3
{
  objc_storeWeak((id *)&self->_browser, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSMutableArray)pendingBlocks
{
  return self->_pendingBlocks;
}

- (void)setPendingBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_pendingBlocks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingBlocks, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_browser);
  objc_storeStrong((id *)&self->_logID, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_outputDeviceIdentifiers, 0);
}

void __56__HMDMediaEndpoint__setPlaybackState_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  const void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v3)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = v5;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v30 = v9;
      v31 = 2112;
      v32 = v3;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Attempt to connect to the endpoint to set the playback state failed with error %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v10 = (const void *)objc_msgSend(WeakRetained, "copyOrigin");
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = v5;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v10)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v30 = v15;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Attempting to locally set the playback state command with mediaRemote", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(v12, "workQueue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *(id *)(a1 + 32);
      v17 = MRMediaRemoteSendCommandForOriginWithReply();

      CFRelease(v10);
      if (!v17)
      {
        v18 = (void *)objc_msgSend(v12, "retainedEndpoint");
        v19 = (void *)MEMORY[0x1D17BA0A0]();
        v20 = v12;
        HMFGetOSLogHandle();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v30 = v22;
          v31 = 2112;
          v32 = v18;
          _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Sending the command to mediaremote failed for media endpoint %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v19);
        if (v18)
          CFRelease(v18);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2005);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 74, CFSTR("Media remote command send failure "), CFSTR("Media remote command send failure"), 0, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

      }
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v30 = v25;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot look up origin for mediaSession to set playback state after connection", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      if (*(_QWORD *)(a1 + 32))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2005);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 4, CFSTR("Cannot lookup origin"), CFSTR("Cannot lookup origin"), 0, v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

      }
    }
  }

}

uint64_t __56__HMDMediaEndpoint__setPlaybackState_completionHandler___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __55__HMDMediaEndpoint_setPlaybackState_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setPlaybackState:completionHandler:", *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __59__HMDMediaEndpoint__getPlaybackStateWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  const void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (v3)
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = v5;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v9;
      v24 = 2112;
      v25 = v3;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Attempt to connect to the endpoint to get the playback state failed with error %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v10 = (const void *)objc_msgSend(WeakRetained, "copyOrigin");
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = v5;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v10)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v23 = v15;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_INFO, "%{public}@Endpoint Attempting to locally read the playback state from media remote", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      objc_msgSend(v12, "workQueue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_copyWeak(&v21, (id *)(a1 + 40));
      v20 = *(id *)(a1 + 32);
      MRMediaRemoteGetNowPlayingApplicationPlaybackStateForOrigin();

      CFRelease(v10);
      objc_destroyWeak(&v21);
    }
    else
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v23 = v17;
        _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot look up origin for mediaSession to get playback state after connection", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v11);
      if (*(_QWORD *)(a1 + 32))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2005);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 4, CFSTR("Cannot lookup origin"), CFSTR("Cannot lookup origin"), 0, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

      }
    }
  }

}

void __59__HMDMediaEndpoint__getPlaybackStateWithCompletionHandler___block_invoke_20(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (a2 > 5)
      v8 = 3;
    else
      v8 = qword_1CDB8FAD0[a2];
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v9;
    v13 = 2048;
    v14 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Locally read the playback state as: %tu", (uint8_t *)&v11, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v10 + 16))(v10, 0, a2);

}

uint64_t __58__HMDMediaEndpoint_getPlaybackStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_getPlaybackStateWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

void __50__HMDMediaEndpoint__connectWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id WeakRetained;
  void *v7;
  int v8;
  const void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  _BYTE v26[10];
  __int16 v27;
  const void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = objc_msgSend(WeakRetained, "connectionState");
    objc_msgSend(v7, "setConnectionState:", a2);
    if ((_DWORD)a2 != 1 && v8 != (_DWORD)a2)
    {
      v9 = (const void *)objc_msgSend(v7, "retainedEndpoint");
      v10 = (void *)MEMORY[0x1D17BA0A0]();
      v11 = v7;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138544386;
        v24 = v13;
        v25 = 1024;
        *(_DWORD *)v26 = a2;
        *(_WORD *)&v26[4] = 1024;
        *(_DWORD *)&v26[6] = v8;
        v27 = 2112;
        v28 = v9;
        v29 = 2112;
        v30 = a3;
        _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, "%{public}@Connection state changed to %u (from %u) for endpoint %@ with error %@", (uint8_t *)&v23, 0x2Cu);

      }
      objc_autoreleasePoolPop(v10);
      if (v9)
        CFRelease(v9);
      v14 = a3;
      if ((_DWORD)a2 == 3 && v8 == 2)
      {
        v15 = (void *)MEMORY[0x1D17BA0A0]();
        v16 = v11;
        HMFGetOSLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = *(_QWORD *)(a1 + 32);
          v23 = 138543618;
          v24 = v18;
          v25 = 2112;
          *(_QWORD *)v26 = v19;
          _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_INFO, "%{public}@Attempting to refresh the session for the accessories on endpoint (%@) disconnect", (uint8_t *)&v23, 0x16u);

        }
        objc_autoreleasePoolPop(v15);
        objc_msgSend(v16, "browser");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "outputDeviceIdentifiers");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "allObjects");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "updateSessionsForAccessories:", v22);

        if (!v14)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 4);
          v14 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      objc_msgSend(v11, "_notifyPendingBlocksOfError:", v14);

    }
  }

}

uint64_t __71__HMDMediaEndpoint_updateOutputDevicesAndConnectWithCompletionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateOutputDevicesAndConnectWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

void __52__HMDMediaEndpoint_disconnectWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "retainedEndpoint");
  if (v2)
  {
    v3 = (const void *)v2;
    __disconnectFromEndpoint(v2);
    CFRelease(v3);
  }
  objc_msgSend(*(id *)(a1 + 32), "setConnectionState:", 3);
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, 0);
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_notifyPendingBlocksOfError:", v6);

}

void __43__HMDMediaEndpoint_disconnectFromEndpoint___block_invoke(uint64_t a1)
{
  __disconnectFromEndpoint(*(_QWORD *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __39__HMDMediaEndpoint_updateWithEndpoint___block_invoke(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;
  void *v5;
  const void *v6;
  _QWORD v7[4];
  id v8[2];
  id location;

  v2 = (const void *)objc_msgSend(*(id *)(a1 + 32), "retainedEndpoint");
  v3 = v2;
  if (v2 == *(const void **)(a1 + 40))
  {
    if (!v2)
      return;
    CFRelease(v2);
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "setRetainedEndpoint:");
  if (v3)
  {
    __disconnectFromEndpoint((uint64_t)v3);
    CFRelease(v3);
  }
  objc_msgSend(*(id *)(a1 + 32), "setConnectionState:", 0);
  v4 = *(const void **)(a1 + 40);
  if (v4)
  {
    CFRetain(v4);
    objc_initWeak(&location, *(id *)(a1 + 32));
    v5 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __39__HMDMediaEndpoint_updateWithEndpoint___block_invoke_2;
    v7[3] = &unk_1E89B0FB0;
    objc_copyWeak(v8, &location);
    v8[1] = *(id *)(a1 + 40);
    objc_msgSend(v5, "_updateOutputDevicesAndConnectWithCompletionHandler:", v7);
    objc_destroyWeak(v8);
    objc_destroyWeak(&location);
LABEL_8:
    v6 = *(const void **)(a1 + 40);
    if (v6)
      CFRelease(v6);
  }
}

void __39__HMDMediaEndpoint_updateWithEndpoint___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v8)
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      v15 = 138543874;
      v16 = v9;
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v3;
      v11 = "%{public}@Updating connection to endpoint %@ failed with error %@";
      v12 = v7;
      v13 = 32;
LABEL_6:
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v15, v13);

    }
  }
  else if (v8)
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    v15 = 138543618;
    v16 = v9;
    v17 = 2112;
    v18 = v14;
    v11 = "%{public}@Updated connection to endpoint %@";
    v12 = v7;
    v13 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v5);
  CFRelease(*(CFTypeRef *)(a1 + 40));

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t28 != -1)
    dispatch_once(&logCategory__hmf_once_t28, &__block_literal_global_80649);
  return (id)logCategory__hmf_once_v29;
}

void __31__HMDMediaEndpoint_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v29;
  logCategory__hmf_once_v29 = v0;

}

@end
