@implementation CKRepairAssetsOperationInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  const char *v47;
  objc_super v48;

  v4 = a3;
  v5 = (void *)MEMORY[0x18D76DE4C]();
  v48.receiver = self;
  v48.super_class = (Class)CKRepairAssetsOperationInfo;
  -[CKDatabaseOperationInfo encodeWithCoder:](&v48, sel_encodeWithCoder_, v4);
  objc_msgSend_assets(self, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_assets);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v11, (uint64_t)v9, (uint64_t)v10);

  objc_msgSend_packages(self, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_packages);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v17, (uint64_t)v15, (uint64_t)v16);

  objc_msgSend_assetMetadata(self, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_assetMetadata);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)v21, (uint64_t)v22);

  objc_msgSend_packageMetadata(self, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_packageMetadata);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v29, (uint64_t)v27, (uint64_t)v28);

  objc_msgSend_unavailableAssets(self, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_unavailableAssets);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v35, (uint64_t)v33, (uint64_t)v34);

  objc_msgSend_unavailablePackages(self, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_unavailablePackages);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v41, (uint64_t)v39, (uint64_t)v40);

  objc_msgSend_uploadRequestConfiguration(self, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_uploadRequestConfiguration);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v4, v47, (uint64_t)v45, (uint64_t)v46);

  objc_autoreleasePoolPop(v5);
}

- (CKRepairAssetsOperationInfo)initWithCoder:(id)a3
{
  id v4;
  CKRepairAssetsOperationInfo *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  NSArray *assets;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  NSArray *packages;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  NSArray *assetMetadata;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  NSArray *packageMetadata;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  NSArray *unavailableAssets;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  NSArray *unavailablePackages;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  CKUploadRequestConfiguration *uploadRequestConfiguration;
  objc_super v73;

  v4 = a3;
  v73.receiver = self;
  v73.super_class = (Class)CKRepairAssetsOperationInfo;
  v5 = -[CKDatabaseOperationInfo initWithCoder:](&v73, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x18D76DE4C]();
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend_setWithObjects_(v7, v10, v8, v11, v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_assets);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v14, (uint64_t)v12, (uint64_t)v13);
    v15 = objc_claimAutoreleasedReturnValue();
    assets = v5->_assets;
    v5->_assets = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend_setWithObjects_(v17, v20, v18, v21, v19, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_packages);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v24, (uint64_t)v22, (uint64_t)v23);
    v25 = objc_claimAutoreleasedReturnValue();
    packages = v5->_packages;
    v5->_packages = (NSArray *)v25;

    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    v29 = objc_opt_class();
    objc_msgSend_setWithObjects_(v27, v30, v28, v31, v29, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_assetMetadata);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v34, (uint64_t)v32, (uint64_t)v33);
    v35 = objc_claimAutoreleasedReturnValue();
    assetMetadata = v5->_assetMetadata;
    v5->_assetMetadata = (NSArray *)v35;

    v37 = (void *)MEMORY[0x1E0C99E60];
    v38 = objc_opt_class();
    v39 = objc_opt_class();
    objc_msgSend_setWithObjects_(v37, v40, v38, v41, v39, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_packageMetadata);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v44, (uint64_t)v42, (uint64_t)v43);
    v45 = objc_claimAutoreleasedReturnValue();
    packageMetadata = v5->_packageMetadata;
    v5->_packageMetadata = (NSArray *)v45;

    v47 = (void *)MEMORY[0x1E0C99E60];
    v48 = objc_opt_class();
    v49 = objc_opt_class();
    objc_msgSend_setWithObjects_(v47, v50, v48, v51, v49, 0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_unavailableAssets);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v54, (uint64_t)v52, (uint64_t)v53);
    v55 = objc_claimAutoreleasedReturnValue();
    unavailableAssets = v5->_unavailableAssets;
    v5->_unavailableAssets = (NSArray *)v55;

    v57 = (void *)MEMORY[0x1E0C99E60];
    v58 = objc_opt_class();
    v59 = objc_opt_class();
    objc_msgSend_setWithObjects_(v57, v60, v58, v61, v59, 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(sel_unavailablePackages);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v4, v64, (uint64_t)v62, (uint64_t)v63);
    v65 = objc_claimAutoreleasedReturnValue();
    unavailablePackages = v5->_unavailablePackages;
    v5->_unavailablePackages = (NSArray *)v65;

    v67 = objc_opt_class();
    NSStringFromSelector(sel_uploadRequestConfiguration);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClass_forKey_(v4, v69, v67, (uint64_t)v68);
    v70 = objc_claimAutoreleasedReturnValue();
    uploadRequestConfiguration = v5->_uploadRequestConfiguration;
    v5->_uploadRequestConfiguration = (CKUploadRequestConfiguration *)v70;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (CKUploadRequestConfiguration)uploadRequestConfiguration
{
  return self->_uploadRequestConfiguration;
}

- (void)setUploadRequestConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_uploadRequestConfiguration, a3);
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
  objc_storeStrong((id *)&self->_assets, a3);
}

- (NSArray)packages
{
  return self->_packages;
}

- (void)setPackages:(id)a3
{
  objc_storeStrong((id *)&self->_packages, a3);
}

- (NSArray)assetMetadata
{
  return self->_assetMetadata;
}

- (void)setAssetMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_assetMetadata, a3);
}

- (NSArray)packageMetadata
{
  return self->_packageMetadata;
}

- (void)setPackageMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_packageMetadata, a3);
}

- (NSArray)unavailableAssets
{
  return self->_unavailableAssets;
}

- (void)setUnavailableAssets:(id)a3
{
  objc_storeStrong((id *)&self->_unavailableAssets, a3);
}

- (NSArray)unavailablePackages
{
  return self->_unavailablePackages;
}

- (void)setUnavailablePackages:(id)a3
{
  objc_storeStrong((id *)&self->_unavailablePackages, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unavailablePackages, 0);
  objc_storeStrong((id *)&self->_unavailableAssets, 0);
  objc_storeStrong((id *)&self->_packageMetadata, 0);
  objc_storeStrong((id *)&self->_assetMetadata, 0);
  objc_storeStrong((id *)&self->_packages, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_uploadRequestConfiguration, 0);
}

@end
