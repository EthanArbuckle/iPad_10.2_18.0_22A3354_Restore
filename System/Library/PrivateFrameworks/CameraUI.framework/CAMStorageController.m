@implementation CAMStorageController

- (CAMStorageController)init
{
  CAMStorageController *v2;
  CAMInternalStorage *v3;
  CAMInternalStorage *internalStorage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMStorageController;
  v2 = -[CAMStorageController init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(CAMInternalStorage);
    internalStorage = v2->__internalStorage;
    v2->__internalStorage = v3;

    objc_storeStrong((id *)&v2->__currentStorage, v2->__internalStorage);
  }
  return v2;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
  -[CAMStorageController _updateStorageDelegates](self, "_updateStorageDelegates");
}

- (BOOL)hasDiskSpaceToAllowCaptureWithConfiguration:(id)a3 allowPurging:(BOOL)a4
{
  return -[CAMStorageController hasDiskSpaceToAllowCaptureWithConfiguration:allowPurging:verbose:](self, "hasDiskSpaceToAllowCaptureWithConfiguration:allowPurging:verbose:", a3, a4, 0);
}

- (void)_updateStorageDelegates
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  id v8;

  v3 = -[CAMStorageController _isUsingInternalStorage](self, "_isUsingInternalStorage");
  if (v3)
  {
    -[CAMStorageController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  -[CAMStorageController _internalStorage](self, "_internalStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

  if (v3)
  v6 = -[CAMStorageController _isUsingExternalStorage](self, "_isUsingExternalStorage");
  if (v6)
  {
    -[CAMStorageController delegate](self, "delegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  -[CAMStorageController externalStorage](self, "externalStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelegate:", v8);

  if (v6)
}

- (CAMPurgeableStorageContainer)purgeableStorageContainer
{
  void *v3;
  void *v4;
  void *v5;

  -[CAMStorageController _currentStorage](self, "_currentStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMStorageController _internalStorage](self, "_internalStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == v4)
  {
    -[CAMStorageController _internalStorage](self, "_internalStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return (CAMPurgeableStorageContainer *)v5;
}

- (void)_setCurrentStorage:(id)a3
{
  CAMStorageContainer *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CAMStorageContainer *v16;

  v5 = (CAMStorageContainer *)a3;
  if (self->__currentStorage != v5)
  {
    v16 = v5;
    -[CAMStorageController purgeableStorageContainer](self, "purgeableStorageContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isPurging") & 1) != 0)
    {
      v7 = 1;
    }
    else
    {
      -[CAMStorageController purgeableStorageContainer](self, "purgeableStorageContainer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "isCancelingPurge");

    }
    objc_storeStrong((id *)&self->__currentStorage, a3);
    -[CAMStorageController _updateStorageDelegates](self, "_updateStorageDelegates");
    -[CAMStorageController _updateGraphConfigurationOnCurrentStorage](self, "_updateGraphConfigurationOnCurrentStorage");
    -[CAMStorageController purgeableStorageContainer](self, "purgeableStorageContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isPurging") & 1) != 0)
    {
      v10 = 1;
    }
    else
    {
      -[CAMStorageController purgeableStorageContainer](self, "purgeableStorageContainer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v11, "isCancelingPurge");

    }
    if (v7 != v10)
    {
      -[CAMStorageController delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMStorageController purgeableStorageContainer](self, "purgeableStorageContainer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "storageControllerDidChangePurgingState:", v13);

    }
    -[CAMStorageController delegate](self, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMStorageController _currentStorage](self, "_currentStorage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "availableDiskSpaceChanged:", v15);

    v5 = v16;
  }

}

- (BOOL)_isUsingInternalStorage
{
  CAMStorageController *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[CAMStorageController _currentStorage](self, "_currentStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMStorageController _internalStorage](v2, "_internalStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v3 == v4;

  return (char)v2;
}

- (BOOL)_isUsingExternalStorage
{
  CAMStorageController *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[CAMStorageController _currentStorage](self, "_currentStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMStorageController externalStorage](v2, "externalStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v3 == v4;

  return (char)v2;
}

- (void)setExternalStorage:(id)a3
{
  CAMExternalStorage *v5;
  CAMExternalStorage *externalStorage;
  BOOL v7;
  void *v8;
  CAMExternalStorage *v9;

  v5 = (CAMExternalStorage *)a3;
  externalStorage = self->_externalStorage;
  if (externalStorage != v5)
  {
    v9 = v5;
    v7 = -[CAMExternalStorage isEqual:](externalStorage, "isEqual:", v5);
    v5 = v9;
    if (!v7)
    {
      -[CAMExternalStorage setDelegate:](self->_externalStorage, "setDelegate:", 0);
      objc_storeStrong((id *)&self->_externalStorage, a3);
      if (v9)
      {
        -[CAMStorageController _setCurrentStorage:](self, "_setCurrentStorage:", v9);
      }
      else
      {
        -[CAMStorageController _internalStorage](self, "_internalStorage");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[CAMStorageController _setCurrentStorage:](self, "_setCurrentStorage:", v8);

      }
      v5 = v9;
    }
  }

}

- (void)setGraphConfiguration:(id)a3
{
  CAMCaptureGraphConfiguration *v5;
  CAMCaptureGraphConfiguration *v6;

  v5 = (CAMCaptureGraphConfiguration *)a3;
  if (self->_graphConfiguration != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_graphConfiguration, a3);
    -[CAMStorageController _updateGraphConfigurationOnCurrentStorage](self, "_updateGraphConfigurationOnCurrentStorage");
    v5 = v6;
  }

}

- (void)_updateGraphConfigurationOnCurrentStorage
{
  void *v3;
  id v4;

  -[CAMStorageController graphConfiguration](self, "graphConfiguration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMStorageController _currentStorage](self, "_currentStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setGraphConfiguration:", v4);

}

- (int64_t)totalFreeBytes
{
  void *v2;
  int64_t v3;

  -[CAMStorageController _currentStorage](self, "_currentStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "totalFreeBytes");

  return v3;
}

- (BOOL)hasDiskSpaceToAllowCaptureWithConfiguration:(id)a3 allowPurging:(BOOL)a4 verbose:(BOOL)a5
{
  uint64_t v5;
  _BOOL8 v6;
  id v8;
  void *v9;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  -[CAMStorageController _currentStorage](self, "_currentStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v9, "hasDiskSpaceToAllowCaptureWithConfiguration:allowPurging:verbose:", v8, v6, v5);

  return v5;
}

- (double)availableRecordingTimeInSecondsForGraphConfiguration:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  -[CAMStorageController _currentStorage](self, "_currentStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "availableRecordingTimeInSecondsForGraphConfiguration:", v4);
  v7 = v6;

  return v7;
}

- (int64_t)minimumDiskUsageThresholdInBytesForGraphConfiguration:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[CAMStorageController _currentStorage](self, "_currentStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "minimumDiskUsageThresholdInBytesForGraphConfiguration:", v4);

  return v6;
}

- (CAMCaptureGraphConfiguration)graphConfiguration
{
  return self->_graphConfiguration;
}

- (CAMPurgeableStorageContainerDelegate)delegate
{
  return (CAMPurgeableStorageContainerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CAMExternalStorage)externalStorage
{
  return self->_externalStorage;
}

- (CAMInternalStorage)_internalStorage
{
  return self->__internalStorage;
}

- (CAMStorageContainer)_currentStorage
{
  return self->__currentStorage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__currentStorage, 0);
  objc_storeStrong((id *)&self->__internalStorage, 0);
  objc_storeStrong((id *)&self->_externalStorage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_graphConfiguration, 0);
}

@end
