@implementation CAMExternalStorage

- (CAMExternalStorage)initWithStorageDevice:(id)a3
{
  id v5;
  CAMExternalStorage *v6;
  CAMExternalStorage *v7;
  uint64_t v8;
  NSUUID *uniqueIdentifier;
  uint64_t v10;
  NSString *displayName;
  uint64_t v12;
  NSURL *baseURL;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CAMExternalStorage;
  v6 = -[CAMExternalStorage init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->__underlyingStorageDevice, a3);
    objc_msgSend(v5, "uuid");
    v8 = objc_claimAutoreleasedReturnValue();
    uniqueIdentifier = v7->_uniqueIdentifier;
    v7->_uniqueIdentifier = (NSUUID *)v8;

    objc_msgSend(v5, "displayName");
    v10 = objc_claimAutoreleasedReturnValue();
    displayName = v7->_displayName;
    v7->_displayName = (NSString *)v10;

    v7->_notRecommendedForCaptureUse = objc_msgSend(v5, "isNotRecommendedForCaptureUse");
    objc_msgSend(v5, "baseURL");
    v12 = objc_claimAutoreleasedReturnValue();
    baseURL = v7->__baseURL;
    v7->__baseURL = (NSURL *)v12;

  }
  return v7;
}

- (CAMExternalStorage)initWithNoDevice
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMExternalStorage;
  return -[CAMExternalStorage init](&v3, sel_init);
}

- (int64_t)totalFreeBytes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  int64_t v10;
  id v12;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMExternalStorage _baseURL](self, "_baseURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v3, "attributesOfFileSystemForPath:error:", v5, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;

  if (v6)
    v8 = v7 == 0;
  else
    v8 = 0;
  if (v8)
  {
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CB2B00]);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = -[NSObject longValue](v9, "longValue");
  }
  else
  {
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[CAMExternalStorage totalFreeBytes].cold.1(self, (uint64_t)v7, v9);
    v10 = -1;
  }

  return v10;
}

- (BOOL)hasDiskSpaceToAllowCaptureWithConfiguration:(id)a3 allowPurging:(BOOL)a4
{
  return -[CAMExternalStorage hasDiskSpaceToAllowCaptureWithConfiguration:allowPurging:verbose:](self, "hasDiskSpaceToAllowCaptureWithConfiguration:allowPurging:verbose:", a3, a4, 0);
}

- (BOOL)hasDiskSpaceToAllowCaptureWithConfiguration:(id)a3 allowPurging:(BOOL)a4 verbose:(BOOL)a5
{
  id v6;
  unint64_t v7;
  double v9;
  BOOL v10;
  BOOL v11;

  v6 = a3;
  v7 = objc_msgSend(v6, "mode");
  if (v7 > 8 || ((1 << v7) & 0x186) == 0)
  {
    v10 = -[CAMExternalStorage totalFreeBytes](self, "totalFreeBytes") <= 104857600;
  }
  else
  {
    -[CAMExternalStorage availableRecordingTimeInSecondsForGraphConfiguration:](self, "availableRecordingTimeInSecondsForGraphConfiguration:", v6);
    v10 = v9 <= 2.0;
  }
  v11 = !v10;

  return v11;
}

- (double)availableRecordingTimeInSecondsForGraphConfiguration:(id)a3
{
  id v4;
  unint64_t v5;
  double v6;
  void *v8;
  uint64_t v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "mode");
  v6 = 0.0;
  if (v5 <= 8 && ((1 << v5) & 0x186) != 0)
  {
    +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "bytesPerMinuteForGraphConfiguration:outputToExternalStorage:", v4, 1);

    if (v9)
      v6 = (double)-[CAMExternalStorage totalFreeBytes](self, "totalFreeBytes") * 60.0 / (double)v9;
  }

  return v6;
}

- (int64_t)minimumDiskUsageThresholdInBytesForGraphConfiguration:(id)a3
{
  return 0;
}

- (id)generateDestinationURLWithExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    -[CAMExternalStorage _underlyingStorageDevice](self, "_underlyingStorageDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    objc_msgSend(v5, "nextAvailableURLsWithPathExtensions:error:", v6, &v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v15;

    if (v8 || !objc_msgSend(v7, "count"))
    {
      v9 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[CAMExternalStorage generateDestinationURLWithExtension:].cold.1(self, (uint64_t)v8, v9);

      v10 = 0;
    }
    else
    {
      v11 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v17 = v13;
        _os_log_impl(&dword_1DB760000, v11, OS_LOG_TYPE_DEFAULT, "External storage: got destination url (%{public}@)", buf, 0xCu);

      }
      objc_msgSend(v7, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  CAMExternalStorage *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = (CAMExternalStorage *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CAMExternalStorage _underlyingStorageDevice](self, "_underlyingStorageDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[CAMExternalStorage _underlyingStorageDevice](self, "_underlyingStorageDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMExternalStorage _underlyingStorageDevice](v4, "_underlyingStorageDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v6 == v7;

    }
    else
    {
      v8 = self == v4;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSString)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[CAMExternalStorage displayName](self, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("External storage: %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)connected
{
  void *v2;
  char v3;

  -[CAMExternalStorage _underlyingStorageDevice](self, "_underlyingStorageDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isConnected");

  return v3;
}

- (CAMPurgeableStorageContainerDelegate)delegate
{
  return (CAMPurgeableStorageContainerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CAMCaptureGraphConfiguration)graphConfiguration
{
  return self->_graphConfiguration;
}

- (void)setGraphConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_graphConfiguration, a3);
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (BOOL)notRecommendedForCaptureUse
{
  return self->_notRecommendedForCaptureUse;
}

- (AVExternalStorageDevice)_underlyingStorageDevice
{
  return self->__underlyingStorageDevice;
}

- (NSURL)_baseURL
{
  return self->__baseURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__baseURL, 0);
  objc_storeStrong((id *)&self->__underlyingStorageDevice, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_graphConfiguration, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)totalFreeBytes
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_baseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = v6;
  v9 = 2114;
  v10 = a2;
  _os_log_error_impl(&dword_1DB760000, a3, OS_LOG_TYPE_ERROR, "External storage: failed to retrieve free space from %{public}@ : (%{public}@)", (uint8_t *)&v7, 0x16u);

}

- (void)generateDestinationURLWithExtension:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543874;
  v9 = v6;
  v10 = 2114;
  v11 = v7;
  v12 = 2114;
  v13 = a2;
  _os_log_error_impl(&dword_1DB760000, a3, OS_LOG_TYPE_ERROR, "External storage: unable to generate url for external storage device (%{public}@/%{public}@) with error (%{public}@)", (uint8_t *)&v8, 0x20u);

}

@end
