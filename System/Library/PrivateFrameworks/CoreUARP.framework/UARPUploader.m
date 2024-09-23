@implementation UARPUploader

- (UARPUploader)init
{
  UARPUploader *v2;
  os_log_t v3;
  OS_os_log *xpcLog;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UARPUploader;
  v2 = -[UARPUploader init](&v6, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.accessoryupdater.uarp", "uploader");
    xpcLog = v2->_xpcLog;
    v2->_xpcLog = (OS_os_log *)v3;

  }
  return v2;
}

- (BOOL)setController:(id)a3
{
  id v4;
  UARPController **p_controller;
  id WeakRetained;

  v4 = a3;
  p_controller = &self->_controller;
  WeakRetained = objc_loadWeakRetained((id *)p_controller);

  if (!WeakRetained)
    objc_storeWeak((id *)p_controller, v4);

  return WeakRetained == 0;
}

- (BOOL)addAccessory:(id)a3 error:(id *)a4
{
  -[UARPUploader doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)accessoryReachable:(id)a3 error:(id *)a4
{
  -[UARPUploader doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)removeAccessory:(id)a3 error:(id *)a4
{
  -[UARPUploader doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)accessoryUnreachable:(id)a3 error:(id *)a4
{
  -[UARPUploader doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)recvDataFromAccessory:(id)a3 data:(id)a4 error:(id *)a5
{
  -[UARPUploader doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (BOOL)offerAssetToAccessory:(id)a3 asset:(id)a4 error:(id *)a5
{
  -[UARPUploader doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (BOOL)applyStagedAssetsForAccessory:(id)a3 error:(id *)a4
{
  -[UARPUploader doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)rescindStagedAssetsForAccessory:(id)a3 error:(id *)a4
{
  -[UARPUploader doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)pauseAssetTransfersForAccessory:(id)a3
{
  -[UARPUploader doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)resumeAssetTransfersForAccessory:(id)a3
{
  -[UARPUploader doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (BOOL)cancelAssetStagingForAccessory:(id)a3 asset:(id)a4
{
  -[UARPUploader doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return 0;
}

- (BOOL)supplementalAssetUpdated:(id)a3 assetName:(id)a4 error:(id *)a5
{
  -[UARPUploader doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (BOOL)genericNotification:(id)a3 notificationName:(id)a4 error:(id *)a5
{
  -[UARPUploader doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a5);
  return 0;
}

- (void)firmwareStagingComplete:(id)a3 assetID:(id)a4 withStatus:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *xpcLog;
  NSObject *v11;
  id WeakRetained;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  xpcLog = self->_xpcLog;
  if (os_log_type_enabled(xpcLog, OS_LOG_TYPE_INFO))
  {
    v11 = xpcLog;
    v13 = 136315650;
    v14 = UARPFirmwareStagingCompletionStatusToString(a5);
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_212D08000, v11, OS_LOG_TYPE_INFO, "Firmware Staging Complete Status = %s for Asset = %@ Accessory = %@", (uint8_t *)&v13, 0x20u);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_controller);
  objc_msgSend(WeakRetained, "firmwareStagingComplete:assetID:withStatus:", v8, v9, a5);

}

- (void)stagedFirmwareApplicationComplete:(id)a3 withStatus:(unint64_t)a4
{
  UARPController **p_controller;
  id v6;
  id WeakRetained;

  p_controller = &self->_controller;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_controller);
  objc_msgSend(WeakRetained, "stagedFirmwareApplicationComplete:withStatus:", v6, a4);

}

- (void)stagedFirmwareRescindComplete:(id)a3 withStatus:(unint64_t)a4
{
  UARPController **p_controller;
  id v5;
  id WeakRetained;

  p_controller = &self->_controller;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_controller);
  objc_msgSend(WeakRetained, "stagedFirmwareRescindComplete:withStatus:", v5, 6);

}

- (void)firmwareStagingProgress:(id)a3 assetID:(id)a4 bytesSent:(unint64_t)a5 bytesTotal:(unint64_t)a6 filterProgress:(BOOL)a7
{
  _BOOL8 v7;
  UARPController **p_controller;
  id v12;
  id v13;
  id WeakRetained;

  v7 = a7;
  p_controller = &self->_controller;
  v12 = a4;
  v13 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_controller);
  objc_msgSend(WeakRetained, "firmwareStagingProgress:assetID:bytesSent:bytesTotal:filterProgress:", v13, v12, a5, a6, v7);

}

- (void)firmwareStagingDataBlockTransferred:(id)a3 assetID:(id)a4 offset:(unsigned int)a5 blockSize:(unsigned int)a6
{
  uint64_t v6;
  uint64_t v7;
  UARPController **p_controller;
  id v10;
  id v11;
  id WeakRetained;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  p_controller = &self->_controller;
  v10 = a4;
  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_controller);
  objc_msgSend(WeakRetained, "firmwareStagingDataBlockTransferred:assetID:offset:blockSize:", v11, v10, v7, v6);

}

- (BOOL)startTapToRadar:(id)a3
{
  -[UARPUploader doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)stopTapToRadar
{
  -[UARPUploader doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (id)pendingTssRequests
{
  -[UARPUploader doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return (id)MEMORY[0x24BDBD1A8];
}

- (void)tssResponse:(id)a3
{
  -[UARPUploader doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (UARPController)controller
{
  return (UARPController *)objc_loadWeakRetained((id *)&self->_controller);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_controller);
  objc_storeStrong((id *)&self->_xpcLog, 0);
}

@end
