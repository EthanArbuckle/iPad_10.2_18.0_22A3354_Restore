@implementation CAMBurstSession

- (CAMBurstSession)init
{
  CAMBurstSession *v2;
  CAMBurstSession *v3;
  CIBurstImageSet *v4;
  CIBurstImageSet *burstImageSet;
  CAMBurstSession *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMBurstSession;
  v2 = -[CAMBurstSession init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_estimatedCount = 0;
    v2->_count = 0;
    v4 = (CIBurstImageSet *)objc_alloc_init(MEMORY[0x1E0C9DD78]);
    burstImageSet = v3->__burstImageSet;
    v3->__burstImageSet = v4;

    v6 = v3;
  }

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL4 v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CAMBurstSession identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CAMBurstSession count](self, "count");
  v7 = -[CAMBurstSession estimatedCount](self, "estimatedCount");
  v8 = -[CAMBurstSession _isFinalized](self, "_isFinalized");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ identifier:%@, count:%ld, estimatedCount:%ld, finalized:%@>"), v4, v5, v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[CAMBurstSession _burstImageSet](self, "_burstImageSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "burstId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)performBurstAnalysisForDevice:(int64_t)a3
{
  CAMBurstAnalysisResult *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[CAMBurstSession _isFinalized](self, "_isFinalized", a3))
  {
    v4 = 0;
  }
  else
  {
    -[CAMBurstSession identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMBurstSession _burstImageSet](self, "_burstImageSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allImageIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bestImageIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coverImageIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[CAMBurstAnalysisResult initWithIdentifier:allAssetIdentifiers:goodAssetIdentifiers:bestAssetIdentifier:]([CAMBurstAnalysisResult alloc], "initWithIdentifier:allAssetIdentifiers:goodAssetIdentifiers:bestAssetIdentifier:", v5, v7, v8, v9);

  }
  return v4;
}

- (void)addStillImageCaptureResult:(id)a3
{
  BOOL v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = -[CAMBurstSession _isFinalized](self, "_isFinalized");
  v5 = v7;
  if (!v4)
  {
    objc_msgSend(v7, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      -[CAMBurstSession _setEstimatedCount:](self, "_setEstimatedCount:", -[CAMBurstSession estimatedCount](self, "estimatedCount") + 1);

    v5 = v7;
  }

}

- (void)addStillImageLocalPersistenceResult:(id)a3 withFaces:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[CAMBurstSession _isFinalized](self, "_isFinalized"))
  {
    objc_msgSend(v6, "captureResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[CAMBurstSession addStillImageLocalPersistenceResult:withFaces:].cold.1((uint64_t)v9, v10);
    }
    else
    {
      v20 = objc_msgSend(v8, "stillImageUnfilteredPreviewSurface");
      objc_msgSend(v8, "metadata");
      v22 = objc_claimAutoreleasedReturnValue();
      v21 = -[NSObject mutableCopy](v22, "mutableCopy");
      v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v12 = v7;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v24 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "burstMetadataRepresentation");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v17);

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v14);
      }

      objc_msgSend(v21, "setObject:forKey:", v11, CFSTR("AccumulatedFaceMetadata"));
      objc_msgSend(v6, "localPersistenceUUID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMBurstSession _burstImageSet](self, "_burstImageSet");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addImageFromIOSurface:properties:identifier:completionBlock:", v20, v21, v18, 0);
      -[CAMBurstSession _setCount:](self, "_setCount:", -[CAMBurstSession count](self, "count") + 1);

      v10 = v22;
      v9 = 0;
    }

  }
}

- (unint64_t)estimatedCount
{
  return self->_estimatedCount;
}

- (void)_setEstimatedCount:(unint64_t)a3
{
  self->_estimatedCount = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)_setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (BOOL)_isFinalized
{
  return self->_finalized;
}

- (void)_setFinalized:(BOOL)a3
{
  self->_finalized = a3;
}

- (CIBurstImageSet)_burstImageSet
{
  return self->__burstImageSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__burstImageSet, 0);
}

- (void)addStillImageLocalPersistenceResult:(uint64_t)a1 withFaces:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Unable to enqueue still image capture result for burst analysis due to a capture error (%{public}@)", (uint8_t *)&v2, 0xCu);
}

@end
