@implementation AXMPhotoAssetData

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AXMPhotoAssetData)initWithCoder:(id)a3
{
  id v4;
  AXMPhotoAssetData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AXMPhotoAssetData;
  v5 = -[AXMPhotoAssetData init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMPhotoAssetDataCodingKeyAssetURL);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMPhotoAssetData setAssetURL:](v5, "setAssetURL:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMPhotoAssetDataCodingKeyCreationDate);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMPhotoAssetData setAssetCreationDate:](v5, "setAssetCreationDate:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMPhotoAssetDataCodingKeyUTI);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMPhotoAssetData setAssetUTI:](v5, "setAssetUTI:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMPhotoAssetDataCodingKeyLocalIdentifier);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMPhotoAssetData setAssetLocalIdentifier:](v5, "setAssetLocalIdentifier:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMPhotoAssetDataCodingKeyImageData);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMPhotoAssetData setAssetImageData:](v5, "setAssetImageData:", v10);

    -[AXMPhotoAssetData setAssetOrientation:](v5, "setAssetOrientation:", objc_msgSend(v4, "decodeInt32ForKey:", AXMPhotoAssetDataCodingKeyOrientation));
    -[AXMPhotoAssetData setAllowNetworkAccess:](v5, "setAllowNetworkAccess:", objc_msgSend(v4, "decodeBoolForKey:", AXMPhotoAssetDataCodingKeyAllowNetworkAccess));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), AXMPhotoAssetDataCodingKeyPhotoLibraryURL);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMPhotoAssetData setPhotoLibraryURL:](v5, "setPhotoLibraryURL:", v11);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BOOL8 v11;
  id v12;

  v4 = a3;
  -[AXMPhotoAssetData assetURL](self, "assetURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, AXMPhotoAssetDataCodingKeyAssetURL);

  -[AXMPhotoAssetData assetCreationDate](self, "assetCreationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, AXMPhotoAssetDataCodingKeyCreationDate);

  -[AXMPhotoAssetData assetUTI](self, "assetUTI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, AXMPhotoAssetDataCodingKeyUTI);

  -[AXMPhotoAssetData assetLocalIdentifier](self, "assetLocalIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, AXMPhotoAssetDataCodingKeyLocalIdentifier);

  -[AXMPhotoAssetData assetImageData](self, "assetImageData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, AXMPhotoAssetDataCodingKeyImageData);

  v10 = -[AXMPhotoAssetData assetOrientation](self, "assetOrientation");
  objc_msgSend(v4, "encodeInt32:forKey:", v10, AXMPhotoAssetDataCodingKeyOrientation);
  v11 = -[AXMPhotoAssetData allowNetworkAccess](self, "allowNetworkAccess");
  objc_msgSend(v4, "encodeBool:forKey:", v11, AXMPhotoAssetDataCodingKeyAllowNetworkAccess);
  -[AXMPhotoAssetData photoLibraryURL](self, "photoLibraryURL");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, AXMPhotoAssetDataCodingKeyPhotoLibraryURL);

}

+ (id)_photoAuthorizationMessage:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return 0;
  else
    return *(&off_1E625D338 + a3);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[AXMPhotoAssetData assetURL](self, "assetURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMPhotoAssetData assetCreationDate](self, "assetCreationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMPhotoAssetData assetLocalIdentifier](self, "assetLocalIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMPhotoAssetData assetImageData](self, "assetImageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXMPhotoAssetData assetUTI](self, "assetUTI");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p URL=%@ creationDate=%@ localIdentifier=%@ data=%@ UTI=%@ orientation=%u>"), v4, self, v5, v6, v7, v8, v9, -[AXMPhotoAssetData assetOrientation](self, "assetOrientation"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (AXMPhotoAssetData)initWithImageAssetLocalIdentifier:(id)a3 photoLibraryURL:(id)a4 allowsNetworkAccess:(BOOL)a5 needsImageData:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  AXMPhotoAssetData *v12;
  AXMPhotoAssetData *v13;
  objc_super v15;

  v6 = a6;
  v7 = a5;
  v10 = a3;
  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)AXMPhotoAssetData;
  v12 = -[AXMPhotoAssetData init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    -[AXMPhotoAssetData setAssetLocalIdentifier:](v12, "setAssetLocalIdentifier:", v10);
    -[AXMPhotoAssetData setAllowNetworkAccess:](v13, "setAllowNetworkAccess:", v7);
    -[AXMPhotoAssetData setPhotoLibraryURL:](v13, "setPhotoLibraryURL:", v11);
    if (v6)
      -[AXMPhotoAssetData updateAssetDetails](v13, "updateAssetDetails");
  }

  return v13;
}

+ (id)phAssetFromLocalIdentifier:(id)a3 photoLibraryURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  id v19;
  _QWORD v20[5];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)getPHPhotoLibraryClass()), "initWithPhotoLibraryURL:", v6);
  v19 = 0;
  v8 = objc_msgSend(v7, "openAndWaitWithUpgrade:error:", 0, &v19);
  v9 = v19;
  v10 = v9;
  if (v7 && !v9 && v8 == 1)
  {
    objc_msgSend(v7, "librarySpecificFetchOptions");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject setIncludeGuestAssets:](v11, "setIncludeGuestAssets:", 1);
    if (objc_msgSend(getPHPhotoLibraryClass(), "authorizationStatus") == 3)
    {
      v21 = 0;
      v22 = &v21;
      v23 = 0x2050000000;
      v12 = (void *)getPHAssetClass_softClass;
      v24 = getPHAssetClass_softClass;
      if (!getPHAssetClass_softClass)
      {
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __getPHAssetClass_block_invoke;
        v20[3] = &unk_1E625C4E8;
        v20[4] = &v21;
        __getPHAssetClass_block_invoke((uint64_t)v20);
        v12 = (void *)v22[3];
      }
      v13 = objc_retainAutorelease(v12);
      _Block_object_dispose(&v21, 8);
      v25[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fetchAssetsWithLocalIdentifiers:options:", v14, v11);
      v15 = objc_claimAutoreleasedReturnValue();

      if (-[NSObject count](v15, "count"))
      {
        -[NSObject firstObject](v15, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

        goto LABEL_19;
      }
      AXMediaLogCommon();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        +[AXMPhotoAssetData phAssetFromLocalIdentifier:photoLibraryURL:].cold.2((uint64_t)v5, v17);

    }
    else
    {
      AXMediaLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        +[AXMPhotoAssetData phAssetFromLocalIdentifier:photoLibraryURL:].cold.3(v15);
    }
    v16 = 0;
    goto LABEL_18;
  }
  AXMediaLogCommon();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    +[AXMPhotoAssetData phAssetFromLocalIdentifier:photoLibraryURL:].cold.1((uint64_t)v6, (uint64_t)v10, v11);
  v16 = 0;
LABEL_19:

  return v16;
}

- (void)updateAssetDetails
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  -[AXMPhotoAssetData photoLibraryURL](self, "photoLibraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[AXMPhotoAssetData assetLocalIdentifier](self, "assetLocalIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMPhotoAssetData photoLibraryURL](self, "photoLibraryURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[AXMPhotoAssetData phAssetFromLocalIdentifier:photoLibraryURL:](AXMPhotoAssetData, "phAssetFromLocalIdentifier:photoLibraryURL:", v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "creationDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMPhotoAssetData setAssetCreationDate:](self, "setAssetCreationDate:", v7);

    objc_msgSend(v6, "mainFileURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXMPhotoAssetData setAssetURL:](self, "setAssetURL:", v8);

    getPHImageManagerClass();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(getPHImageManagerClass(), "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      v17 = &v16;
      v18 = 0x2050000000;
      v10 = (void *)getPHImageRequestOptionsClass_softClass;
      v19 = getPHImageRequestOptionsClass_softClass;
      v11 = MEMORY[0x1E0C809B0];
      if (!getPHImageRequestOptionsClass_softClass)
      {
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __getPHImageRequestOptionsClass_block_invoke;
        v15[3] = &unk_1E625C4E8;
        v15[4] = &v16;
        __getPHImageRequestOptionsClass_block_invoke((uint64_t)v15);
        v10 = (void *)v17[3];
      }
      v12 = objc_retainAutorelease(v10);
      _Block_object_dispose(&v16, 8);
      v13 = objc_alloc_init(v12);
      objc_msgSend(v13, "setResizeMode:", 2);
      objc_msgSend(v13, "setDeliveryMode:", 1);
      objc_msgSend(v13, "setSynchronous:", 1);
      objc_msgSend(v13, "setNetworkAccessAllowed:", -[AXMPhotoAssetData allowNetworkAccess](self, "allowNetworkAccess"));
      v14[0] = v11;
      v14[1] = 3221225472;
      v14[2] = __39__AXMPhotoAssetData_updateAssetDetails__block_invoke;
      v14[3] = &unk_1E625D300;
      v14[4] = self;
      objc_msgSend(v9, "requestImageDataAndOrientationForAsset:options:resultHandler:", v6, v13, v14);

    }
  }
}

void __39__AXMPhotoAssetData_updateAssetDetails__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v7;
  NSObject *v8;

  v7 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setAssetImageData:", a2);
    objc_msgSend(*(id *)(a1 + 32), "setAssetUTI:", v7);
    objc_msgSend(*(id *)(a1 + 32), "setAssetOrientation:", a4);
  }
  else
  {
    AXMediaLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      __39__AXMPhotoAssetData_updateAssetDetails__block_invoke_cold_1(v8);

  }
}

- (NSString)assetLocalIdentifier
{
  return self->_assetLocalIdentifier;
}

- (void)setAssetLocalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assetLocalIdentifier, a3);
}

- (NSData)assetImageData
{
  return self->_assetImageData;
}

- (void)setAssetImageData:(id)a3
{
  objc_storeStrong((id *)&self->_assetImageData, a3);
}

- (NSString)assetUTI
{
  return self->_assetUTI;
}

- (void)setAssetUTI:(id)a3
{
  objc_storeStrong((id *)&self->_assetUTI, a3);
}

- (NSDate)assetCreationDate
{
  return self->_assetCreationDate;
}

- (void)setAssetCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_assetCreationDate, a3);
}

- (NSURL)assetURL
{
  return self->_assetURL;
}

- (void)setAssetURL:(id)a3
{
  objc_storeStrong((id *)&self->_assetURL, a3);
}

- (unsigned)assetOrientation
{
  return self->_assetOrientation;
}

- (void)setAssetOrientation:(unsigned int)a3
{
  self->_assetOrientation = a3;
}

- (BOOL)allowNetworkAccess
{
  return self->_allowNetworkAccess;
}

- (void)setAllowNetworkAccess:(BOOL)a3
{
  self->_allowNetworkAccess = a3;
}

- (NSURL)photoLibraryURL
{
  return self->_photoLibraryURL;
}

- (void)setPhotoLibraryURL:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibraryURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibraryURL, 0);
  objc_storeStrong((id *)&self->_assetURL, 0);
  objc_storeStrong((id *)&self->_assetCreationDate, 0);
  objc_storeStrong((id *)&self->_assetUTI, 0);
  objc_storeStrong((id *)&self->_assetImageData, 0);
  objc_storeStrong((id *)&self->_assetLocalIdentifier, 0);
}

+ (void)phAssetFromLocalIdentifier:(os_log_t)log photoLibraryURL:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_fault_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_FAULT, "AXMPhotoAssetData: Could not fetch Photo Library using the photo library URL : %@ error: %@", (uint8_t *)&v3, 0x16u);
}

+ (void)phAssetFromLocalIdentifier:(uint64_t)a1 photoLibraryURL:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B0E3B000, a2, OS_LOG_TYPE_ERROR, "AXMPhotoAssetData: PHAsset for localIdentifier not found : %@", (uint8_t *)&v2, 0xCu);
}

+ (void)phAssetFromLocalIdentifier:(NSObject *)a1 photoLibraryURL:.cold.3(NSObject *a1)
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  +[AXMPhotoAssetData _photoAuthorizationMessage:](AXMPhotoAssetData, "_photoAuthorizationMessage:", (int)objc_msgSend(getPHPhotoLibraryClass(), "authorizationStatus"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 138412290;
  v4 = v2;
  _os_log_fault_impl(&dword_1B0E3B000, a1, OS_LOG_TYPE_FAULT, "AXMPhotoAssetData: PhotoLibrary Authorization Failure - Image resource load will not be available : %@", (uint8_t *)&v3, 0xCu);

}

void __39__AXMPhotoAssetData_updateAssetDetails__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B0E3B000, log, OS_LOG_TYPE_FAULT, "AXMPhotoAssetData: Unable to load image data", v1, 2u);
}

@end
