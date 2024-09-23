@implementation CPLMomentShareScopeChange

- (id)momentShare
{
  return -[CPLMomentShare initWithScopeChange:]([CPLMomentShare alloc], "initWithScopeChange:", self);
}

- (void)setMomentShare:(id)a3
{
  objc_msgSend(a3, "updateScopeChange:", self);
}

- (void)setLibraryInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  objc_msgSend(v4, "momentShare");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "updateScopeChange:", self);
    v7 = (void *)objc_msgSend(v4, "copy");

    objc_msgSend(v7, "setMomentShare:", 0);
    v4 = v7;
  }
  v8.receiver = self;
  v8.super_class = (Class)CPLMomentShareScopeChange;
  -[CPLScopeChange setLibraryInfo:](&v8, sel_setLibraryInfo_, v4);

}

- (void)updateScopeFromScopeChange:(id)a3 direction:(unint64_t)a4 didHaveChanges:(BOOL *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  char v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  int64_t v28;
  uint64_t v29;
  objc_super v30;
  uint8_t buf[4];
  CPLMomentShareScopeChange *v32;
  __int16 v33;
  int64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v30.receiver = self;
  v30.super_class = (Class)CPLMomentShareScopeChange;
  -[CPLScopeChange updateScopeFromScopeChange:direction:didHaveChanges:](&v30, sel_updateScopeFromScopeChange_direction_didHaveChanges_, v8, a4, a5);
  if (a4 != 1)
    goto LABEL_35;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_35;
  v9 = objc_msgSend(v8, "scopeType");
  objc_msgSend(v8, "title");
  v10 = objc_claimAutoreleasedReturnValue();
  -[CPLScopeChange title](self, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (unint64_t)v11;
  if (v10 && v11)
  {
    v13 = objc_msgSend((id)v10, "isEqual:", v11);

    if ((v13 & 1) != 0)
      goto LABEL_14;
LABEL_8:
    if (v9 == 2)
    {
      objc_msgSend(v8, "title");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CPLScopeChange setTitle:](self, "setTitle:", v14);

      *a5 = 1;
    }
    else if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        -[CPLScopeChange title](self, "title");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "title");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v32 = self;
        v33 = 2112;
        v34 = (int64_t)v16;
        v35 = 2112;
        v36 = (uint64_t)v17;
        _os_log_impl(&dword_1B03C2000, v15, OS_LOG_TYPE_ERROR, "Client is trying to update title on %@ from %@ to %@", buf, 0x20u);

      }
    }
    goto LABEL_14;
  }

  if (v10 | v12)
    goto LABEL_8;
LABEL_14:
  v18 = objc_msgSend(v8, "promisedAssetCount");
  if (v18 != -[CPLMomentShareScopeChange promisedAssetCount](self, "promisedAssetCount"))
  {
    if (v9 == 2)
    {
      -[CPLMomentShareScopeChange setPromisedAssetCount:](self, "setPromisedAssetCount:", objc_msgSend(v8, "promisedAssetCount"));
    }
    else if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = -[CPLMomentShareScopeChange promisedAssetCount](self, "promisedAssetCount");
        v21 = objc_msgSend(v8, "promisedAssetCount");
        *(_DWORD *)buf = 138412802;
        v32 = self;
        v33 = 2048;
        v34 = v20;
        v35 = 2048;
        v36 = v21;
        _os_log_impl(&dword_1B03C2000, v19, OS_LOG_TYPE_ERROR, "Client is trying to update promisedAssetCount on %@ from %ld to %ld", buf, 0x20u);
      }

    }
  }
  v22 = objc_msgSend(v8, "promisedPhotosCount");
  if (v22 != -[CPLMomentShareScopeChange promisedPhotosCount](self, "promisedPhotosCount"))
  {
    if (v9 == 2)
    {
      -[CPLMomentShareScopeChange setPromisedPhotosCount:](self, "setPromisedPhotosCount:", objc_msgSend(v8, "promisedPhotosCount"));
    }
    else if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = -[CPLMomentShareScopeChange promisedPhotosCount](self, "promisedPhotosCount");
        v25 = objc_msgSend(v8, "promisedPhotosCount");
        *(_DWORD *)buf = 138412802;
        v32 = self;
        v33 = 2048;
        v34 = v24;
        v35 = 2048;
        v36 = v25;
        _os_log_impl(&dword_1B03C2000, v23, OS_LOG_TYPE_ERROR, "Client is trying to update promisedPhotosCount on %@ from %ld to %ld", buf, 0x20u);
      }

    }
  }
  v26 = objc_msgSend(v8, "promisedVideosCount");
  if (v26 != -[CPLMomentShareScopeChange promisedVideosCount](self, "promisedVideosCount"))
  {
    if (v9 == 2)
    {
      -[CPLMomentShareScopeChange setPromisedVideosCount:](self, "setPromisedVideosCount:", objc_msgSend(v8, "promisedVideosCount"));
    }
    else if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = -[CPLMomentShareScopeChange promisedVideosCount](self, "promisedVideosCount");
        v29 = objc_msgSend(v8, "promisedVideosCount");
        *(_DWORD *)buf = 138412802;
        v32 = self;
        v33 = 2048;
        v34 = v28;
        v35 = 2048;
        v36 = v29;
        _os_log_impl(&dword_1B03C2000, v27, OS_LOG_TYPE_ERROR, "Client is trying to update promisedVideosCount on %@ from %ld to %ld", buf, 0x20u);
      }

    }
  }
LABEL_35:

}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (NSDate)expiryDate
{
  return self->_expiryDate;
}

- (void)setExpiryDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (BOOL)hasEPPAssets
{
  return self->_hasEPPAssets;
}

- (void)setHasEPPAssets:(BOOL)a3
{
  self->_hasEPPAssets = a3;
}

- (int64_t)promisedAssetCount
{
  return self->_promisedAssetCount;
}

- (void)setPromisedAssetCount:(int64_t)a3
{
  self->_promisedAssetCount = a3;
}

- (int64_t)promisedPhotosCount
{
  return self->_promisedPhotosCount;
}

- (void)setPromisedPhotosCount:(int64_t)a3
{
  self->_promisedPhotosCount = a3;
}

- (int64_t)promisedVideosCount
{
  return self->_promisedVideosCount;
}

- (void)setPromisedVideosCount:(int64_t)a3
{
  self->_promisedVideosCount = a3;
}

- (NSData)thumbnailImageData
{
  return self->_thumbnailImageData;
}

- (void)setThumbnailImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSData)previewImageData
{
  return self->_previewImageData;
}

- (void)setPreviewImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 320);
}

- (NSString)originatingScopeIdentifier
{
  return self->_originatingScopeIdentifier;
}

- (void)setOriginatingScopeIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingScopeIdentifier, 0);
  objc_storeStrong((id *)&self->_previewImageData, 0);
  objc_storeStrong((id *)&self->_thumbnailImageData, 0);
  objc_storeStrong((id *)&self->_expiryDate, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end
