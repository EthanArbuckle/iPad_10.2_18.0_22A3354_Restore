@implementation MSPublishStreamsProtocol

- (id)delegate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSPublishStreamsProtocol;
  -[MSStreamsProtocol delegate](&v3, sel_delegate);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDelegate:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MSPublishStreamsProtocol;
  -[MSStreamsProtocol setDelegate:](&v3, sel_setDelegate_, a3);
}

- (MSPublishStreamsProtocol)initWithPersonID:(id)a3 baseURL:(id)a4
{
  id v6;
  MSPublishStreamsProtocol *v7;
  MSPublishStreamsProtocol *v8;
  __CFString *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSPublishStreamsProtocol;
  v7 = -[MSStreamsProtocol initWithPersonID:baseURL:](&v11, sel_initWithPersonID_baseURL_, v6, a4);
  v8 = v7;
  if (v7)
  {
    v7->_context._super.owner = v7;
    v9 = (__CFString *)v6;
    v8->_context._super.personID = v9;
    -[MSStreamsProtocol deviceInfoDict](v8, "deviceInfoDict");
    v8->_context._super.deviceInfo = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
    v8->_context._super.connectionTimeout = 0.0;
    v8->_context.finishedCallback = _protocolDidFinish;
    v8->_context.authFailedCallback = _protocolDidFailAuthentication;
    v8->_context.didReceiveServerSideConfigurationVersionCallback = _protocolDidReceiveServerSideConfigurationVersion;
    v8->_context.didReceiveRetryAfterCallback = _protocolDidReceiveRetryAfterDate;
    v8->_UCContext._super.owner = v8;
    v8->_UCContext._super.personID = v9;
    -[MSStreamsProtocol deviceInfoDict](v8, "deviceInfoDict");
    v8->_UCContext._super.deviceInfo = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
    v8->_UCContext._super.connectionTimeout = 0.0;
    v8->_UCContext.finishedCallback = _protocolDidFinishUC;
    v8->_UCContext.authFailedCallback = _protocolDidFailAuthenticationUC;
    v8->_UCContext.didReceiveServerSideConfigurationVersionCallback = _protocolDidReceiveServerSideConfigurationVersionUC;
  }

  return v8;
}

- (void)dealloc
{
  __MSPSPCContext *p_context;
  objc_super v4;

  p_context = &self->_context;

  v4.receiver = self;
  v4.super_class = (Class)MSPublishStreamsProtocol;
  -[MSPublishStreamsProtocol dealloc](&v4, sel_dealloc);
}

- (id)_missingAssetFieldErrorWithFieldName:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  __CFString *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB35C8];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = (__CFString *)MSCFCopyLocalizedString(CFSTR("ERROR_PUT_CONNECTION_MISSING_ASSET_FIELD_P_FIELD"));
  objc_msgSend(v4, "stringWithFormat:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "MSErrorWithDomain:code:description:", CFSTR("MSStreamsPutConnectionErrorDomain"), 5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_insertInfoAboutAsset:(id)a3 intoDictionary:(id)a4 outError:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "fileHash");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "type");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v8, "metadata");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", CFSTR("MSAssetMetadataPixelWidth"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectForKey:", CFSTR("MSAssetMetadataPixelHeight"));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (v13)
      {
        if (v14)
        {
          objc_msgSend(v8, "fileHash");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "MSHexString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v17, CFSTR("fingerprint"));

          objc_msgSend(v8, "type");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v18, CFSTR("type"));

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v8, "protocolFileSize"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v19, CFSTR("size"));

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v13, "unsignedLongValue"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v20, CFSTR("width"));

          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v15, "unsignedLongValue"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v21, CFSTR("height"));

          v22 = 0;
          goto LABEL_13;
        }
        v24 = CFSTR("height");
      }
      else
      {
        v24 = CFSTR("width");
      }
      -[MSPublishStreamsProtocol _missingAssetFieldErrorWithFieldName:](self, "_missingAssetFieldErrorWithFieldName:", v24);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

      if (!a5)
        goto LABEL_16;
      goto LABEL_14;
    }
    v23 = CFSTR("type");
  }
  else
  {
    v23 = CFSTR("fileHash");
  }
  -[MSPublishStreamsProtocol _missingAssetFieldErrorWithFieldName:](self, "_missingAssetFieldErrorWithFieldName:", v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a5)
    goto LABEL_16;
LABEL_14:
  if (v22)
    *a5 = objc_retainAutorelease(v22);
LABEL_16:

  return v22 == 0;
}

- (void)_resetConnectionVariables
{
  NSArray *assetCollectionsInFlight;

  assetCollectionsInFlight = self->_assetCollectionsInFlight;
  self->_assetCollectionsInFlight = 0;

}

- (id)_metadataDictForAsset:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  id v31;
  const __CFString *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  int v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "fileHash");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "type");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v6, "metadata");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("MSAssetMetadataPixelWidth"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKey:", CFSTR("MSAssetMetadataPixelHeight"));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)v10;
      if (v9)
      {
        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "fileHash");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v12, CFSTR("fileHash"));

          objc_msgSend(v6, "type");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v13, CFSTR("type"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v6, "protocolFileSize"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v14, CFSTR("protocolFileSize"));

          objc_msgSend(v6, "MMCSReceipt");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v7, "setObject:forKey:", v15, CFSTR("MMCSReceipt"));
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKey:", v9, CFSTR("pixelWidth"));
          objc_msgSend(v16, "setObject:forKey:", v11, CFSTR("pixelHeight"));
          objc_msgSend(v8, "objectForKey:", CFSTR("MSAssetMetadataFileSize"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(v16, "setObject:forKey:", v17, CFSTR("fileSize"));

          objc_msgSend(v8, "objectForKey:", CFSTR("MSAssetMetadataSHA1HashKey"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            objc_msgSend(v16, "setObject:forKey:", v18, CFSTR("SHA1"));

          objc_msgSend(v8, "objectForKey:", CFSTR("MSAssetMetadataDateContentModified"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
            objc_msgSend(v16, "setObject:forKey:", v19, CFSTR("dateContentModified"));

          objc_msgSend(v8, "objectForKey:", CFSTR("MSAssetMetadataDateContentCreated"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
            objc_msgSend(v16, "setObject:forKey:", v20, CFSTR("dateContentCreated"));

          objc_msgSend(v8, "objectForKey:", CFSTR("MSAssetMetadataSourceLibraryID"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
            objc_msgSend(v16, "setObject:forKey:", v21, CFSTR("sourceLibraryID"));

          objc_msgSend(v8, "objectForKey:", CFSTR("MSAssetMetadataSourceItemID"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (v22)
            objc_msgSend(v16, "setObject:forKey:", v22, CFSTR("sourceItemID"));

          objc_msgSend(v8, "objectForKey:", CFSTR("MSAssetMetadataSourceContainerTypeKey"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (v23)
            objc_msgSend(v16, "setObject:forKey:", v23, CFSTR("sourceContainerType"));

          objc_msgSend(v8, "objectForKey:", CFSTR("MSAssetMetadataSourceContainerIDKey"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
            objc_msgSend(v16, "setObject:forKey:", v24, CFSTR("sourceContainerID"));

          objc_msgSend(v8, "objectForKey:", CFSTR("MSAssetMetadataSourceContainerDisplayNameKey"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
            objc_msgSend(v16, "setObject:forKey:", v25, CFSTR("sourceContainerDisplayName"));

          objc_msgSend(v8, "objectForKey:", CFSTR("MSAssetMetadataDeviceDisplayNameKey"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
            objc_msgSend(v16, "setObject:forKey:", v26, CFSTR("deviceDisplayName"));

          objc_msgSend(v8, "objectForKey:", CFSTR("MSAssetMetadataRasterToDisplayRotationAngleKey"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
            objc_msgSend(v16, "setObject:forKey:", v27, CFSTR("rasterToDisplayRotationAngle"));

          objc_msgSend(v8, "objectForKey:", CFSTR("MSAssetMetadataSourceiCloudPhotoLibraryEnabledKey"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
            objc_msgSend(v16, "setObject:forKey:", v28, CFSTR("sourceiCloudPhotoLibraryEnabled"));

          objc_msgSend(v7, "setObject:forKey:", v16, CFSTR("metadata"));
          v29 = 0;
LABEL_41:

          if (!v29)
            goto LABEL_42;
          goto LABEL_35;
        }
        v32 = CFSTR("height");
      }
      else
      {
        v32 = CFSTR("width");
      }
      -[MSPublishStreamsProtocol _missingAssetFieldErrorWithFieldName:](self, "_missingAssetFieldErrorWithFieldName:", v32);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 0;
      goto LABEL_41;
    }
    v30 = CFSTR("type");
  }
  else
  {
    v30 = CFSTR("fileHash");
  }
  -[MSPublishStreamsProtocol _missingAssetFieldErrorWithFieldName:](self, "_missingAssetFieldErrorWithFieldName:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29)
  {
LABEL_42:
    v31 = v7;
    goto LABEL_45;
  }
LABEL_35:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v33 = (void *)objc_opt_class();
    v34 = v33;
    -[MSStreamsProtocol personID](self, "personID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "MSVerboseDescription");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 138544130;
    v39 = v33;
    v40 = 2112;
    v41 = v35;
    v42 = 2114;
    v43 = v6;
    v44 = 2114;
    v45 = v36;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Rejecting asset %{public}@\nReason: %{public}@", (uint8_t *)&v38, 0x2Au);

    if (a4)
      goto LABEL_37;
LABEL_44:
    v31 = 0;
    goto LABEL_45;
  }
  if (!a4)
    goto LABEL_44;
LABEL_37:
  v31 = 0;
  *a4 = objc_retainAutorelease(v29);
LABEL_45:

  return v31;
}

- (id)_metadataDictForAssetCollection:(id)a3 outError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  const __CFString *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v30;
  id *v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  id v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  __int16 v44;
  void *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "assetCollectionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "masterAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "assetCollectionID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("collId"));

      objc_msgSend(v6, "fileName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v6, "fileName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKey:", v10, CFSTR("fileName"));

      }
      objc_msgSend(v6, "masterAsset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 0;
      -[MSPublishStreamsProtocol _metadataDictForAsset:outError:](self, "_metadataDictForAsset:outError:", v11, &v37);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v37;

      if (!v13)
      {
        objc_msgSend(v7, "setObject:forKey:", v12, CFSTR("masterAsset"));
        objc_msgSend(v6, "derivedAssets");
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v30 = v12;
          v31 = a4;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          objc_msgSend(v6, "derivedAssets");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v34;
            while (2)
            {
              v19 = 0;
              do
              {
                if (*(_QWORD *)v34 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v19);
                v32 = 0;
                -[MSPublishStreamsProtocol _metadataDictForAsset:outError:](self, "_metadataDictForAsset:outError:", v20, &v32);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = v32;
                if (v22)
                {
                  v13 = v22;

                  goto LABEL_23;
                }
                objc_msgSend(v14, "addObject:", v21);

                ++v19;
              }
              while (v17 != v19);
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v46, 16);
              if (v17)
                continue;
              break;
            }
          }

          objc_msgSend(v7, "setObject:forKey:", v14, CFSTR("derivedAssets"));
          v13 = 0;
LABEL_23:

          v12 = v30;
          a4 = v31;
        }
      }

      if (!v13)
        goto LABEL_25;
      goto LABEL_19;
    }
    v23 = CFSTR("masterAsset");
  }
  else
  {
    v23 = CFSTR("assetCollectionID");
  }
  -[MSPublishStreamsProtocol _missingAssetFieldErrorWithFieldName:](self, "_missingAssetFieldErrorWithFieldName:", v23);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
LABEL_25:
    v24 = v7;
    goto LABEL_28;
  }
LABEL_19:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v25 = (void *)objc_opt_class();
    v26 = v25;
    -[MSStreamsProtocol personID](self, "personID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "MSVerboseDescription");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v39 = v25;
    v40 = 2112;
    v41 = v27;
    v42 = 2114;
    v43 = v6;
    v44 = 2114;
    v45 = v28;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Rejecting asset collection %{public}@\nReason: %{public}@", buf, 0x2Au);

    if (a4)
      goto LABEL_21;
LABEL_27:
    v24 = 0;
    goto LABEL_28;
  }
  if (!a4)
    goto LABEL_27;
LABEL_21:
  v24 = 0;
  *a4 = objc_retainAutorelease(v13);
LABEL_28:

  return v24;
}

- (void)sendMetadataForAssetCollections:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __MSPSPCContext *p_context;
  NSURL *v35;
  const __CFDictionary *v36;
  void *v37;
  id v38;
  void *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  CFArrayRef theArray;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  CFArrayRef v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    -[MSStreamsProtocol personID](self, "personID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v53 = v5;
    v54 = 2112;
    v55 = v7;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@ - %@ Sending metadata to Streams server...", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  theArray = (CFArrayRef)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0x1E0C99000uLL;
    v12 = *(_QWORD *)v49;
    v40 = *(_QWORD *)v49;
    v41 = v8;
    do
    {
      v13 = 0;
      v42 = v10;
      do
      {
        if (*(_QWORD *)v49 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v13);
        objc_msgSend(*(id *)(v11 + 3592), "dictionary", v40, v41);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "masterAsset");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v14, "masterAsset");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[MSPublishStreamsProtocol _metadataDictForAsset:outError:](self, "_metadataDictForAsset:outError:", v17, 0);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
            goto LABEL_28;
          objc_msgSend(v15, "setObject:forKey:", v18, CFSTR("masterAsset"));

        }
        objc_msgSend(v14, "derivedAssets");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");

        if (v20)
        {
          v21 = (void *)MEMORY[0x1E0C99DE8];
          objc_msgSend(v14, "derivedAssets");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "arrayWithCapacity:", objc_msgSend(v22, "count"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v46 = 0u;
          v47 = 0u;
          v44 = 0u;
          v45 = 0u;
          objc_msgSend(v14, "derivedAssets");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v45;
            do
            {
              v28 = 0;
              do
              {
                if (*(_QWORD *)v45 != v27)
                  objc_enumerationMutation(v24);
                -[MSPublishStreamsProtocol _metadataDictForAsset:outError:](self, "_metadataDictForAsset:outError:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v28), 0);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                if (v29)
                  objc_msgSend(v23, "addObject:", v29);

                ++v28;
              }
              while (v26 != v28);
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
            }
            while (v26);
          }

          if (objc_msgSend(v23, "count"))
            objc_msgSend(v15, "setObject:forKey:", v23, CFSTR("derivedAssets"));

          v12 = v40;
          v8 = v41;
          v11 = 0x1E0C99000;
          v10 = v42;
        }
        -[__CFArray addObject:](theArray, "addObject:", v15);
        objc_msgSend(v14, "fileName");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          objc_msgSend(v14, "fileName");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKey:", v31, CFSTR("fileName"));

        }
        objc_msgSend(v14, "assetCollectionID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          objc_msgSend(v14, "assetCollectionID");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKey:", v33, CFSTR("collId"));

        }
LABEL_28:

        ++v13;
      }
      while (v13 != v10);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
    }
    while (v10);
  }

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v37 = (void *)objc_opt_class();
    v38 = v37;
    -[MSStreamsProtocol personID](self, "personID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v53 = v37;
    v54 = 2112;
    v55 = v39;
    v56 = 2114;
    v57 = theArray;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%{public}@ - %@ Sending metadata for asset collections: %{public}@", buf, 0x20u);

  }
  p_context = &self->_context;
  -[MSStreamsProtocol _refreshAuthTokenForContext:](self, "_refreshAuthTokenForContext:", &self->_context);
  v35 = -[MSStreamsProtocol putURL](self, "putURL");
  v36 = (const __CFDictionary *)MSPURLConnectionProperties();
  MSPSPCSendMetadataAsync(p_context, (uint64_t)v35, v36, theArray);

}

- (void)sendUploadCompleteForAssetCollections:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __MSPSPCUCContext *p_UCContext;
  NSURL *v16;
  const __CFDictionary *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v5 = (void *)objc_opt_class();
    v6 = v5;
    -[MSStreamsProtocol personID](self, "personID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v24 = v5;
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%{public}@ - %@ Sending upload complete...", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        -[MSPublishStreamsProtocol _metadataDictForAssetCollection:outError:](self, "_metadataDictForAssetCollection:outError:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13), 0, (_QWORD)v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  p_UCContext = &self->_UCContext;
  -[MSStreamsProtocol _refreshAuthTokenForContext:](self, "_refreshAuthTokenForContext:", &self->_UCContext);
  v16 = -[MSStreamsProtocol uploadCompleteURL](self, "uploadCompleteURL");
  v17 = (const __CFDictionary *)MSPURLConnectionProperties();
  MSPSPCUCSendUploadCompleteAsync(p_UCContext, (uint64_t)v16, v17, (CFArrayRef)v8);

}

- (void)abort
{
  MSSPCCancelHTTPTransaction((uint64_t)&self->_context);
  MSSPCCancelHTTPTransaction((uint64_t)&self->_UCContext);
}

- (void)_coreProtocolDidFinishResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  MSPublishStreamsProtocol *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v13 = (void *)objc_opt_class();
      v14 = v13;
      -[MSStreamsProtocol personID](self, "personID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "MSVerboseDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v13;
      v19 = 2112;
      v20 = v15;
      v21 = 2114;
      v22 = v16;
      _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Put connection has failed. Error: %{public}@", (uint8_t *)&v17, 0x20u);

    }
    -[MSPublishStreamsProtocol _resetConnectionVariables](self, "_resetConnectionVariables");
    -[MSPublishStreamsProtocol delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = self;
    v11 = v6;
    v12 = v7;
  }
  else
  {
    -[MSPublishStreamsProtocol delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = self;
    v11 = v6;
    v12 = 0;
  }
  objc_msgSend(v8, "publishStreamsProtocol:didFinishUploadingMetadataResponse:error:", v10, v11, v12);

}

- (void)_coreProtocolDidFailAuthenticationError:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = (void *)objc_opt_class();
    v7 = v6;
    -[MSStreamsProtocol personID](self, "personID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "MSVerboseDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v6;
    v12 = 2112;
    v13 = v8;
    v14 = 2114;
    v15 = v9;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Failed authentication. Error: %{public}@", (uint8_t *)&v10, 0x20u);

  }
  -[MSPublishStreamsProtocol _resetConnectionVariables](self, "_resetConnectionVariables");
  -[MSPublishStreamsProtocol delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "publishStreamsProtocol:didReceiveAuthenticationError:", self, v4);

}

- (void)_coreProtocolDidFinishUCResults:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = (void *)objc_opt_class();
    v10 = v9;
    -[MSStreamsProtocol personID](self, "personID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "MSVerboseDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543874;
    v14 = v9;
    v15 = 2112;
    v16 = v11;
    v17 = 2114;
    v18 = v12;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@ - %@ Upload complete connection has failed. Error: %{public}@", (uint8_t *)&v13, 0x20u);

  }
  -[MSPublishStreamsProtocol delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "publishStreamsProtocol:didFinishSendingUploadCompleteError:", self, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionsInFlight, 0);
}

@end
