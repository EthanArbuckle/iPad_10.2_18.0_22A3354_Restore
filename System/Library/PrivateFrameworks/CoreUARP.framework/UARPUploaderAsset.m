@implementation UARPUploaderAsset

- (UARPUploaderAsset)initWithUARPAsset:(id)a3 remoteEndpoint:(id)a4 callbacks:(uarpPlatformAssetCallbacks *)a5 internalSolicit:(BOOL)a6
{
  id v11;
  id v12;
  UARPUploaderAsset *v13;
  UARPUploaderAsset *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  os_log_t v25;
  OS_os_log *log;
  objc_super v28;

  v11 = a3;
  v12 = a4;
  v28.receiver = self;
  v28.super_class = (Class)UARPUploaderAsset;
  v13 = -[UARPUploaderAsset init](&v28, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_asset, a3);
    objc_storeWeak((id *)&v14->_remoteEndpoint, v12);
    v15 = *(_OWORD *)&a5->fAssetMetaDataComplete;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetReady = *(_OWORD *)&a5->fAssetReady;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetMetaDataComplete = v15;
    v16 = *(_OWORD *)&a5->fPayloadReady;
    v17 = *(_OWORD *)&a5->fPayloadMetaDataComplete;
    v18 = *(_OWORD *)&a5->fPayloadDataComplete2;
    *(_OWORD *)&v14->_uarpCallbacks.fPayloadData = *(_OWORD *)&a5->fPayloadData;
    *(_OWORD *)&v14->_uarpCallbacks.fPayloadDataComplete2 = v18;
    *(_OWORD *)&v14->_uarpCallbacks.fPayloadReady = v16;
    *(_OWORD *)&v14->_uarpCallbacks.fPayloadMetaDataComplete = v17;
    v19 = *(_OWORD *)&a5->fAssetSetBytesAtOffset2;
    v20 = *(_OWORD *)&a5->fAssetRescindedAck;
    v21 = *(_OWORD *)&a5->fAssetProcessingNotification2;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetOrphaned = *(_OWORD *)&a5->fAssetOrphaned;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetProcessingNotification2 = v21;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetSetBytesAtOffset2 = v19;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetRescindedAck = v20;
    v22 = *(_OWORD *)&a5->fAssetPreProcessingNotification;
    v23 = *(_OWORD *)&a5->fAssetAllHeadersAndMetaDataComplete;
    v24 = *(_OWORD *)&a5->fAssetReleased;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetGetBytesAtOffset = *(_OWORD *)&a5->fAssetGetBytesAtOffset;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetReleased = v24;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetPreProcessingNotification = v22;
    *(_OWORD *)&v14->_uarpCallbacks.fAssetAllHeadersAndMetaDataComplete = v23;
    v14->_internalSolicit = a6;
    v25 = os_log_create("com.apple.accessoryupdater.uarp", "uploader");
    log = v14->_log;
    v14->_log = (OS_os_log *)v25;

  }
  return v14;
}

- (void)setUarpPlatformAsset:(uarpPlatformAsset *)a3
{
  self->_uarpAsset = a3;
}

- (uarpPlatformAssetCallbacks)uarpCallbacks
{
  return &self->_uarpCallbacks;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPAsset id](self->_asset, "id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@>"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)processHostTLVs
{
  UARPSuperBinaryAsset *v3;
  void *v4;
  void *v5;
  void *v6;
  UARPSuperBinaryAsset *v7;
  id v8;
  void *v9;
  void *v10;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  UARPUploaderEndpoint **p_remoteEndpoint;
  uint64_t i;
  void *v28;
  id WeakRetained;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  UARPUploaderAsset *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  UARPSuperBinaryAsset *v43;
  id obj;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v3 = [UARPSuperBinaryAsset alloc];
  -[UARPUploaderAsset asset](self, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UARPSuperBinaryAsset initWithURL:](v3, "initWithURL:", v6);

  v49 = 0;
  LODWORD(v5) = -[UARPSuperBinaryAsset expandHeadersAndTLVs:](v7, "expandHeadersAndTLVs:", &v49);
  v8 = v49;
  if ((_DWORD)v5)
  {
    v42 = v8;
    -[UARPSuperBinaryAsset tlvs](v7, "tlvs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 3436347652, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v41 = v10;
    objc_msgSend(v10, "valueAsNumber");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v40, "BOOLValue"))
    {
      -[UARPUploaderAsset asset](self, "asset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "id");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setIsUrgentUpdate:", 1);

    }
    -[UARPSuperBinaryAsset tlvs](v7, "tlvs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 3291140096, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = v14;
    objc_msgSend(v14, "valueAsNumber");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
      self->_minimumHostBatteryLevel = objc_msgSend(v15, "unsignedIntegerValue");
    v38 = v16;
    -[UARPSuperBinaryAsset tlvs](v7, "tlvs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 3291140105, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = v18;
    objc_msgSend(v18, "valueAsNumber");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
      self->_triggerHostBatteryLevel = objc_msgSend(v19, "unsignedIntegerValue");
    v36 = v20;
    v43 = v7;
    -[UARPSuperBinaryAsset tlvs](v7, "tlvs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[UARPSuperBinaryAssetTLV findTLVsWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVsWithType:tlvs:", 3291140106, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    obj = v22;
    v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v46;
      p_remoteEndpoint = &self->_remoteEndpoint;
      v35 = self;
      while (2)
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v46 != v25)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          WeakRetained = objc_loadWeakRetained((id *)p_remoteEndpoint);
          objc_msgSend(WeakRetained, "accessory");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "getID");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "hwRevision");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "valueAsString");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v32, "isEqualToString:", v33);

          if (v34)
          {
            v35->_invalidHwRevision = 1;
            goto LABEL_18;
          }
        }
        v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
        if (v24)
          continue;
        break;
      }
    }
LABEL_18:

    v8 = v42;
    v7 = v43;
  }

}

- (unint64_t)numPayloads
{
  return self->_numPayloads;
}

- (void)setNumPayloads:(unint64_t)a3
{
  self->_numPayloads = a3;
}

- (unint64_t)selectedPayload
{
  return self->_selectedPayload;
}

- (void)setSelectedPayload:(unint64_t)a3
{
  self->_selectedPayload = a3;
}

- (unint64_t)formatVersion
{
  return self->_formatVersion;
}

- (void)setFormatVersion:(unint64_t)a3
{
  self->_formatVersion = a3;
}

- (unint64_t)assetLength
{
  return self->_assetLength;
}

- (void)setAssetLength:(unint64_t)a3
{
  self->_assetLength = a3;
}

- (UARPAssetVersion)assetVersion
{
  return (UARPAssetVersion *)objc_getProperty(self, a2, 280, 1);
}

- (void)setAssetVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 280);
}

- (UARPSuperBinaryAsset)uarpSuperBinary
{
  return (UARPSuperBinaryAsset *)objc_getProperty(self, a2, 288, 1);
}

- (void)setUarpSuperBinary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (UARPAsset)asset
{
  return (UARPAsset *)objc_getProperty(self, a2, 296, 1);
}

- (uarpPlatformAsset)uarpAsset
{
  return self->_uarpAsset;
}

- (UARPUploaderEndpoint)remoteEndpoint
{
  return (UARPUploaderEndpoint *)objc_loadWeakRetained((id *)&self->_remoteEndpoint);
}

- (BOOL)internalSolicit
{
  return self->_internalSolicit;
}

- (BOOL)invalidHwRevision
{
  return self->_invalidHwRevision;
}

- (unint64_t)minimumHostBatteryLevel
{
  return self->_minimumHostBatteryLevel;
}

- (unint64_t)triggerHostBatteryLevel
{
  return self->_triggerHostBatteryLevel;
}

- (UARPDynamicAssetPersonalization)pendingTssRequest
{
  return (UARPDynamicAssetPersonalization *)objc_getProperty(self, a2, 336, 1);
}

- (void)setPendingTssRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingTssRequest, 0);
  objc_destroyWeak((id *)&self->_remoteEndpoint);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_uarpSuperBinary, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end
