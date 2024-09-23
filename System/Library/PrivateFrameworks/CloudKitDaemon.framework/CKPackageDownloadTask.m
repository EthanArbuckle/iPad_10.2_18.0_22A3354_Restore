@implementation CKPackageDownloadTask

- (CKPackageDownloadTask)initWithPackage:(id)a3 trackProgress:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  CKPackageDownloadTask *v8;
  CKPackageDownloadTask *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  CKDProgressTracker *v25;
  const char *v26;
  uint64_t v27;
  CKDProgressTracker *progressTracker;
  dispatch_group_t v29;
  OS_dispatch_group *group;
  CKDCancelTokenGroup *v31;
  CKDCancelTokenGroup *cancelTokens;
  objc_super v34;

  v4 = a4;
  v7 = a3;
  v34.receiver = self;
  v34.super_class = (Class)CKPackageDownloadTask;
  v8 = -[CKPackageDownloadTask init](&v34, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_package, a3);
    if (v4)
    {
      v10 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend_recordKey(v7, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_record(v7, v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordID(v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_recordName(v19, v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend_initWithFormat_(v10, v23, (uint64_t)CFSTR("down|%@|%@"), v13, v22);

      v25 = [CKDProgressTracker alloc];
      v27 = objc_msgSend_initWithTrackingID_(v25, v26, (uint64_t)v24);
      progressTracker = v9->_progressTracker;
      v9->_progressTracker = (CKDProgressTracker *)v27;

    }
    v29 = dispatch_group_create();
    group = v9->_group;
    v9->_group = (OS_dispatch_group *)v29;

    v31 = objc_alloc_init(CKDCancelTokenGroup);
    cancelTokens = v9->_cancelTokens;
    v9->_cancelTokens = v31;

  }
  return v9;
}

- (void)setManifestAsset:(id)a3
{
  CKAsset *v4;
  const char *v5;
  CKAsset *v6;
  CKAsset *manifestAsset;
  BOOL v8;
  CKDProgressTracker *progressTracker;
  void *v10;
  const char *v11;
  CKDProgressTracker *v12;
  void *v13;
  const char *v14;
  CKAsset *v15;
  CKAsset *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = (CKAsset *)a3;
  v6 = v4;
  manifestAsset = self->_manifestAsset;
  if (manifestAsset)
    v8 = manifestAsset == v4;
  else
    v8 = 1;
  if (!v8)
  {
    progressTracker = self->_progressTracker;
    v17[0] = self->_manifestAsset;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v17, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stopTrackingItems_(progressTracker, v11, (uint64_t)v10);

  }
  if (v6)
  {
    v12 = self->_progressTracker;
    v16 = v6;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)&v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_startTrackingItems_(v12, v14, (uint64_t)v13);

  }
  v15 = self->_manifestAsset;
  self->_manifestAsset = v6;

}

- (void)setSectionAssets:(id)a3
{
  NSArray *v4;
  const char *v5;
  NSArray *v6;
  NSArray *sectionAssets;
  BOOL v8;
  NSArray *v9;

  v4 = (NSArray *)a3;
  v6 = v4;
  sectionAssets = self->_sectionAssets;
  if (sectionAssets)
    v8 = sectionAssets == v4;
  else
    v8 = 1;
  if (!v8)
    objc_msgSend_stopTrackingItems_(self->_progressTracker, v5, (uint64_t)sectionAssets);
  if (v6)
    objc_msgSend_startTrackingItems_(self->_progressTracker, v5, (uint64_t)v6);
  v9 = self->_sectionAssets;
  self->_sectionAssets = v6;

}

- (void)cancel
{
  uint64_t v2;
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend_cancelTokens(self, a2, v2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_cancel(v5, v3, v4);

}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 8, 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (CKPackage)package
{
  return self->_package;
}

- (CKAsset)manifestAsset
{
  return self->_manifestAsset;
}

- (NSArray)sectionAssets
{
  return self->_sectionAssets;
}

- (NSIndexSet)sectionIndices
{
  return self->_sectionIndices;
}

- (void)setSectionIndices:(id)a3
{
  objc_storeStrong((id *)&self->_sectionIndices, a3);
}

- (CKDProgressTracker)progressTracker
{
  return self->_progressTracker;
}

- (void)setProgressTracker:(id)a3
{
  objc_storeStrong((id *)&self->_progressTracker, a3);
}

- (CKDMMCSRequestOptions)MMCSRequestOptions
{
  return self->_MMCSRequestOptions;
}

- (void)setMMCSRequestOptions:(id)a3
{
  objc_storeStrong((id *)&self->_MMCSRequestOptions, a3);
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (CKDCancelTokenGroup)cancelTokens
{
  return self->_cancelTokens;
}

- (void)setCancelTokens:(id)a3
{
  objc_storeStrong((id *)&self->_cancelTokens, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancelTokens, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_MMCSRequestOptions, 0);
  objc_storeStrong((id *)&self->_progressTracker, 0);
  objc_storeStrong((id *)&self->_sectionIndices, 0);
  objc_storeStrong((id *)&self->_sectionAssets, 0);
  objc_storeStrong((id *)&self->_manifestAsset, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
