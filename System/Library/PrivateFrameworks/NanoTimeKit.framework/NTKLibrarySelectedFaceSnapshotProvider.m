@implementation NTKLibrarySelectedFaceSnapshotProvider

- (void)faceCollectionDidLoad:(id)a3
{
  void *v4;
  void *v5;

  -[NTKLibrarySelectedFaceSnapshotProvider _updateSelectedFaceAndSnapshotKey](self, "_updateSelectedFaceAndSnapshotKey", a3);
  -[NTKLibrarySelectedFaceSnapshotProvider snapshotImage](self, "snapshotImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NTKLibrarySelectedFaceSnapshotProvider _notifyIfSnapshotAvailable](self, "_notifyIfSnapshotAvailable");
  }
  else
  {
    +[NTKFaceSnapshotClient sharedInstance](NTKFaceSnapshotClient, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestSnapshotOfFace:", self->_selectedFace);

  }
  dispatch_resume((dispatch_object_t)self->_snapshotRequestsQueue);
  self->_resumedQueue = 1;
}

- (UIImage)snapshotImage
{
  void *v3;
  void *v4;

  NTKSnapshotMappedImageCache();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageForKey:", self->_snapshotKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v4;
}

- (NTKLibrarySelectedFaceSnapshotProvider)initWithDeviceUUID:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  NTKLibrarySelectedFaceSnapshotProvider *v8;
  NTKLibrarySelectedFaceSnapshotProvider *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *snapshotRequestsQueue;
  void *v12;
  NTKPersistentFaceCollection *v13;
  NTKFaceCollection *libraryCollection;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NTKLibrarySelectedFaceSnapshotProvider;
  v8 = -[NTKLibrarySelectedFaceSnapshotProvider init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    v10 = dispatch_queue_create("com.apple.nanotimekit.selectedFaceSnapshotRequests", 0);
    snapshotRequestsQueue = v9->_snapshotRequestsQueue;
    v9->_snapshotRequestsQueue = (OS_dispatch_queue *)v10;

    dispatch_suspend((dispatch_object_t)v9->_snapshotRequestsQueue);
    v9->_resumedQueue = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v9, sel__handleSnapshotChangedNotification_, CFSTR("NTKFaceSnapshotChangedNotification"), 0);

    v13 = -[NTKPersistentFaceCollection initWithCollectionIdentifier:deviceUUID:]([NTKPersistentFaceCollection alloc], "initWithCollectionIdentifier:deviceUUID:", CFSTR("LibraryFaces"), v6);
    libraryCollection = v9->_libraryCollection;
    v9->_libraryCollection = &v13->super;

    -[NTKFaceCollection addObserver:](v9->_libraryCollection, "addObserver:", v9);
  }

  return v9;
}

- (void)_updateSelectedFaceAndSnapshotKey
{
  NTKFace *v3;
  NTKFace *selectedFace;
  NSString *v5;
  NSString *snapshotKey;

  -[NTKFace removeObserver:](self->_selectedFace, "removeObserver:", self);
  -[NTKFaceCollection selectedFace](self->_libraryCollection, "selectedFace");
  v3 = (NTKFace *)objc_claimAutoreleasedReturnValue();
  selectedFace = self->_selectedFace;
  self->_selectedFace = v3;

  -[NTKFace dailySnapshotKey](self->_selectedFace, "dailySnapshotKey");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  snapshotKey = self->_snapshotKey;
  self->_snapshotKey = v5;

  -[NTKFace addObserver:](self->_selectedFace, "addObserver:", self);
}

- (NTKLibrarySelectedFaceSnapshotProvider)initWithDeviceUUID:(id)a3
{
  return -[NTKLibrarySelectedFaceSnapshotProvider initWithDeviceUUID:delegate:](self, "initWithDeviceUUID:delegate:", a3, 0);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[NTKFaceCollection removeObserver:](self->_libraryCollection, "removeObserver:", self);
  if (!self->_resumedQueue)
    dispatch_resume((dispatch_object_t)self->_snapshotRequestsQueue);
  v4.receiver = self;
  v4.super_class = (Class)NTKLibrarySelectedFaceSnapshotProvider;
  -[NTKLibrarySelectedFaceSnapshotProvider dealloc](&v4, sel_dealloc);
}

- (void)faceCollection:(id)a3 didSelectFace:(id)a4 atIndex:(unint64_t)a5
{
  -[NTKLibrarySelectedFaceSnapshotProvider _updateSelectedFaceAndSnapshotKey](self, "_updateSelectedFaceAndSnapshotKey", a3, a4, a5);
  -[NTKLibrarySelectedFaceSnapshotProvider _notifyIfSnapshotAvailable](self, "_notifyIfSnapshotAvailable");
}

- (void)_handleSnapshotChangedNotification:(id)a3
{
  id v4;

  objc_msgSend(a3, "object");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (-[NSString isEqualToString:](self->_snapshotKey, "isEqualToString:"))
    -[NTKLibrarySelectedFaceSnapshotProvider _notifyIfSnapshotAvailable](self, "_notifyIfSnapshotAvailable");

}

- (void)_notifyIfSnapshotAvailable
{
  id WeakRetained;
  id v4;

  -[NTKLibrarySelectedFaceSnapshotProvider snapshotImage](self, "snapshotImage");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "snapshotImageUpdated:", v4);

  }
}

- (void)_handleFaceChange:(id)a3
{
  NSString *v4;
  NSString *snapshotKey;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "isEqual:", self->_selectedFace))
  {
    objc_msgSend(v6, "dailySnapshotKey");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    snapshotKey = self->_snapshotKey;
    self->_snapshotKey = v4;

    -[NTKLibrarySelectedFaceSnapshotProvider _notifyIfSnapshotAvailable](self, "_notifyIfSnapshotAvailable");
  }

}

- (void)snapshotSelectedFaceWithOptions:(id)a3 completion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "snapshotCurrentFaceForActiveDeviceWithOptions:completion:", v6, v5);

}

+ (void)snapshotCurrentFaceForActiveDeviceWithOptions:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v7 = (void *)MEMORY[0x1E0C944B0];
  v8 = a4;
  objc_msgSend(v7, "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "nrDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "snapshotCurrentFaceForDevice:withOptions:completion:", v11, v6, v8);

  }
  else
  {
    _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      +[NTKLibrarySelectedFaceSnapshotProvider snapshotCurrentFaceForActiveDeviceWithOptions:completion:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);

    (*((void (**)(id, _QWORD))v8 + 2))(v8, 0);
  }

}

+ (void)snapshotCurrentFaceForDevice:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "nrDeviceUUID");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "snapshotCurrentFaceForDeviceUUID:withOptions:completion:", v10, v9, v8);

}

+ (void)snapshotCurrentFaceForDeviceUUID:(id)a3 withOptions:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  NSObject *v22;
  const __CFString *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    v23 = CFSTR("NTKSnapshotUIOnlyKey");
    v24[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
      -[NSObject addEntriesFromDictionary:](v11, "addEntriesFromDictionary:", v8);

      v10 = v11;
    }
    _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v21 = 138412290;
      v22 = v10;
      _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "Calling into SnapshotClient snapshotLibrarySelectedFaceForDeviceUUID with options:%@", (uint8_t *)&v21, 0xCu);
    }

    +[NTKFaceSnapshotClient sharedInstance](NTKFaceSnapshotClient, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "snapshotLibrarySelectedFaceForDeviceUUID:options:completion:", v7, v10, v9);

  }
  else
  {
    _NTKLoggingObjectForDomain(4, (uint64_t)"NTKLoggingDomainSnapshot");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[NTKLibrarySelectedFaceSnapshotProvider snapshotCurrentFaceForDeviceUUID:withOptions:completion:].cold.1(v10, v14, v15, v16, v17, v18, v19, v20);
  }

}

- (NTKLibrarySelectedFaceSnapshotProviderDelegate)delegate
{
  return (NTKLibrarySelectedFaceSnapshotProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_snapshotRequestsQueue, 0);
  objc_storeStrong((id *)&self->_snapshotKey, 0);
  objc_storeStrong((id *)&self->_selectedFace, 0);
  objc_storeStrong((id *)&self->_libraryCollection, 0);
}

+ (void)snapshotCurrentFaceForActiveDeviceWithOptions:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1B72A3000, a1, a3, "No paired device. Nothing to snapshot.", a5, a6, a7, a8, 0);
}

+ (void)snapshotCurrentFaceForDeviceUUID:(uint64_t)a3 withOptions:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1B72A3000, a1, a3, "snapshotCurrentFaceForDeviceUUID called with nil completion handler", a5, a6, a7, a8, 0);
}

@end
