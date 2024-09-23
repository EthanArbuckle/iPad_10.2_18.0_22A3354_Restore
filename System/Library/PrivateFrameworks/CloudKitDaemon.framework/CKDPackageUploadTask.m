@implementation CKDPackageUploadTask

- (CKDPackageUploadTask)initWithPackage:(id)a3 trackProgress:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  CKDPackageUploadTask *v8;
  CKDPackageUploadTask *v9;
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
  v34.super_class = (Class)CKDPackageUploadTask;
  v8 = -[CKDPackageUploadTask init](&v34, sel_init);
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
      v24 = (void *)objc_msgSend_initWithFormat_(v10, v23, (uint64_t)CFSTR("up|%@|%@"), v13, v22);

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

- (id)activityCreate
{
  return _os_activity_create(&dword_1BE990000, "daemon/upload-assets", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
}

- (int64_t)storageGroupingPolicy
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  int64_t v6;

  objc_msgSend_package(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_storageGroupingPolicy(v3, v4, v5);

  return v6;
}

- (int64_t)uploadRank
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  int64_t v6;

  objc_msgSend_package(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_uploadRank(v3, v4, v5);

  return v6;
}

- (NSString)recordKey
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;

  objc_msgSend_package(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recordKey(v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setMMCSManifestItem:(id)a3
{
  CKDMMCSItem *v4;
  const char *v5;
  CKDMMCSItem *v6;
  CKDMMCSItem *MMCSManifestItem;
  BOOL v8;
  CKDProgressTracker *progressTracker;
  void *v10;
  const char *v11;
  CKDProgressTracker *v12;
  void *v13;
  const char *v14;
  CKDMMCSItem *v15;
  CKDMMCSItem *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v4 = (CKDMMCSItem *)a3;
  v6 = v4;
  MMCSManifestItem = self->_MMCSManifestItem;
  if (MMCSManifestItem)
    v8 = MMCSManifestItem == v4;
  else
    v8 = 1;
  if (!v8)
  {
    progressTracker = self->_progressTracker;
    v17[0] = self->_MMCSManifestItem;
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
  v15 = self->_MMCSManifestItem;
  self->_MMCSManifestItem = v6;

}

- (void)setMMCSSectionItems:(id)a3
{
  NSArray *v4;
  const char *v5;
  NSArray *v6;
  NSArray *MMCSSectionItems;
  BOOL v8;
  NSArray *v9;

  v4 = (NSArray *)a3;
  v6 = v4;
  MMCSSectionItems = self->_MMCSSectionItems;
  if (MMCSSectionItems)
    v8 = MMCSSectionItems == v4;
  else
    v8 = 1;
  if (!v8)
    objc_msgSend_stopTrackingItems_(self->_progressTracker, v5, (uint64_t)MMCSSectionItems);
  if (v6)
    objc_msgSend_startTrackingItems_(self->_progressTracker, v5, (uint64_t)v6);
  v9 = self->_MMCSSectionItems;
  self->_MMCSSectionItems = v6;

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

- (CKDMMCSItem)MMCSManifestItem
{
  return self->_MMCSManifestItem;
}

- (NSArray)MMCSSectionItems
{
  return self->_MMCSSectionItems;
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
  objc_storeStrong((id *)&self->_MMCSSectionItems, 0);
  objc_storeStrong((id *)&self->_MMCSManifestItem, 0);
  objc_storeStrong((id *)&self->_package, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
