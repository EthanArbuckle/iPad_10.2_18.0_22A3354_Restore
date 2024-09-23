@implementation HFSoftwareUpdateCounter

void __47__HFSoftwareUpdateCounter_initWithAccessories___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isFirmwareUpdateAvailable"))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v3, "storeID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%@"), v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)a1[4];
LABEL_17:
    objc_msgSend(v8, "addObject:", v7);

    goto LABEL_18;
  }
  if (objc_msgSend(v3, "hf_isReadyToInstallSoftwareUpdate"))
  {
    if (objc_msgSend(v3, "hf_hasNewValidSoftwareUpdate"))
    {
      v9 = (void *)a1[5];
LABEL_16:
      objc_msgSend(v3, "hf_softwareUpdateHash");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v9;
      goto LABEL_17;
    }
    HFLogForCategory(0x3FuLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v3;
      _os_log_error_impl(&dword_1DD34E000, v15, OS_LOG_TYPE_ERROR, "Software update is ready to install but accessory not controllable: %@", buf, 0xCu);
    }

  }
  else
  {
    if (objc_msgSend(v3, "hf_isSoftwareUpdateInProgress"))
    {
      v10 = (void *)a1[6];
      objc_msgSend(v3, "hf_softwareUpdateHash");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

      if (objc_msgSend(v3, "hf_isDownloadingSoftwareUpdate"))
      {
        v12 = (void *)a1[7];
        objc_msgSend(v3, "hf_softwareUpdateHash");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v13);

        v14 = (void *)a1[8];
      }
      else
      {
        if (objc_msgSend(v3, "hf_isInstallingSoftwareUpdate"))
        {
          v9 = (void *)a1[9];
          goto LABEL_16;
        }
        if (!objc_msgSend(v3, "hf_hasRequestedSoftwareUpdate"))
          goto LABEL_18;
        v16 = (void *)a1[10];
        objc_msgSend(v3, "hf_softwareUpdateHash");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v17);

        v14 = (void *)a1[11];
      }
      objc_msgSend(v14, "addObject:", v3);
      goto LABEL_18;
    }
    if (objc_msgSend(v3, "hf_isSoftwareUpdateInstalled"))
    {
      v9 = (void *)a1[12];
      goto LABEL_16;
    }
  }
LABEL_18:

}

- (unint64_t)updatesReadyToInstall
{
  return self->_updatesReadyToInstall;
}

- (unint64_t)softwareUpdatesInProgress
{
  return self->_softwareUpdatesInProgress;
}

- (HFSoftwareUpdateCounter)initWithAccessories:(id)a3
{
  HFSoftwareUpdateCounter *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v24 = a3;
  v35.receiver = self;
  v35.super_class = (Class)HFSoftwareUpdateCounter;
  v4 = -[HFSoftwareUpdateCounter init](&v35, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __47__HFSoftwareUpdateCounter_initWithAccessories___block_invoke;
    v25[3] = &unk_1EA7314B8;
    v26 = v11;
    v27 = v5;
    v28 = v7;
    v29 = v8;
    v30 = v13;
    v31 = v9;
    v32 = v6;
    v33 = v12;
    v34 = v10;
    v14 = v10;
    v23 = v12;
    v15 = v6;
    v16 = v9;
    v17 = v13;
    v18 = v8;
    v19 = v7;
    v20 = v5;
    v21 = v11;
    objc_msgSend(v24, "na_each:", v25);
    -[HFSoftwareUpdateCounter setSoftwareUpdatesRequested:](v4, "setSoftwareUpdatesRequested:", objc_msgSend(v15, "count"));
    -[HFSoftwareUpdateCounter setSoftwareUpdatesReadyToInstall:](v4, "setSoftwareUpdatesReadyToInstall:", objc_msgSend(v20, "count"));
    -[HFSoftwareUpdateCounter setSoftwareUpdatesInProgress:](v4, "setSoftwareUpdatesInProgress:", objc_msgSend(v19, "count"));
    -[HFSoftwareUpdateCounter setSoftwareUpdatesDownloading:](v4, "setSoftwareUpdatesDownloading:", objc_msgSend(v18, "count"));
    -[HFSoftwareUpdateCounter setSoftwareUpdatesInstalling:](v4, "setSoftwareUpdatesInstalling:", objc_msgSend(v16, "count"));
    -[HFSoftwareUpdateCounter setSoftwareUpdatesInstalled:](v4, "setSoftwareUpdatesInstalled:", objc_msgSend(v14, "count"));
    -[HFSoftwareUpdateCounter setFirmwareUpdatesReadyToInstall:](v4, "setFirmwareUpdatesReadyToInstall:", objc_msgSend(v21, "count"));
    -[HFSoftwareUpdateCounter setUpdatesReadyToInstall:](v4, "setUpdatesReadyToInstall:", -[HFSoftwareUpdateCounter firmwareUpdatesReadyToInstall](v4, "firmwareUpdatesReadyToInstall")+ -[HFSoftwareUpdateCounter softwareUpdatesReadyToInstall](v4, "softwareUpdatesReadyToInstall"));
    -[HFSoftwareUpdateCounter setAllUpdates:](v4, "setAllUpdates:", -[HFSoftwareUpdateCounter softwareUpdatesInProgress](v4, "softwareUpdatesInProgress")+ -[HFSoftwareUpdateCounter updatesReadyToInstall](v4, "updatesReadyToInstall")+ -[HFSoftwareUpdateCounter softwareUpdatesInstalled](v4, "softwareUpdatesInstalled"));
    -[HFSoftwareUpdateCounter setAccessoriesWithRequestedSoftwareUpdates:](v4, "setAccessoriesWithRequestedSoftwareUpdates:", v23);
    -[HFSoftwareUpdateCounter setAccessoriesDownloadingSoftwareUpdates:](v4, "setAccessoriesDownloadingSoftwareUpdates:", v17);

  }
  return v4;
}

- (unint64_t)softwareUpdatesReadyToInstall
{
  return self->_softwareUpdatesReadyToInstall;
}

- (unint64_t)softwareUpdatesInstalled
{
  return self->_softwareUpdatesInstalled;
}

- (void)setUpdatesReadyToInstall:(unint64_t)a3
{
  self->_updatesReadyToInstall = a3;
}

- (void)setSoftwareUpdatesRequested:(unint64_t)a3
{
  self->_softwareUpdatesRequested = a3;
}

- (void)setSoftwareUpdatesReadyToInstall:(unint64_t)a3
{
  self->_softwareUpdatesReadyToInstall = a3;
}

- (void)setSoftwareUpdatesInstalling:(unint64_t)a3
{
  self->_softwareUpdatesInstalling = a3;
}

- (void)setSoftwareUpdatesInstalled:(unint64_t)a3
{
  self->_softwareUpdatesInstalled = a3;
}

- (void)setSoftwareUpdatesInProgress:(unint64_t)a3
{
  self->_softwareUpdatesInProgress = a3;
}

- (void)setSoftwareUpdatesDownloading:(unint64_t)a3
{
  self->_softwareUpdatesDownloading = a3;
}

- (void)setFirmwareUpdatesReadyToInstall:(unint64_t)a3
{
  self->_firmwareUpdatesReadyToInstall = a3;
}

- (void)setAllUpdates:(unint64_t)a3
{
  self->_allUpdates = a3;
}

- (void)setAccessoriesWithRequestedSoftwareUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_accessoriesWithRequestedSoftwareUpdates, a3);
}

- (void)setAccessoriesDownloadingSoftwareUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_accessoriesDownloadingSoftwareUpdates, a3);
}

- (unint64_t)firmwareUpdatesReadyToInstall
{
  return self->_firmwareUpdatesReadyToInstall;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoriesDownloadingSoftwareUpdates, 0);
  objc_storeStrong((id *)&self->_accessoriesWithRequestedSoftwareUpdates, 0);
}

+ (id)progressForAccessoriesDownloadingSoftwareUpdate:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  float *v13;
  uint64_t v14;
  int v15;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v12 = 0;
    v13 = (float *)&v12;
    v14 = 0x2020000000;
    v15 = 0;
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __75__HFSoftwareUpdateCounter_progressForAccessoriesDownloadingSoftwareUpdate___block_invoke;
    v7[3] = &unk_1EA731490;
    v7[4] = &v12;
    v7[5] = &v8;
    objc_msgSend(v3, "na_each:", v7);
    v4 = v9[3];
    if (v4)
    {
      v13[6] = v13[6] / (float)v4;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    _Block_object_dispose(&v8, 8);
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __75__HFSoftwareUpdateCounter_progressForAccessoriesDownloadingSoftwareUpdate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  float v4;
  id v5;

  objc_msgSend(a2, "hf_softwareUpdatePortionComplete");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v5 = v3;
    objc_msgSend(v3, "floatValue");
    v3 = v5;
    if (v4 < 0.99 && fabsf(v4 + -0.99) >= 0.00000011921)
    {
      *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4
                                                                 + *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                            + 24);
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    }
  }

}

- (HFSoftwareUpdateCounter)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_initWithAccessories_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HFSoftwareUpdateCounter.m"), 121, CFSTR("%s is unavailable; use %@ instead"),
    "-[HFSoftwareUpdateCounter init]",
    v5);

  return 0;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFSoftwareUpdateCounter softwareUpdatesRequested](self, "softwareUpdatesRequested"), CFSTR("softwareUpdatesRequested"));
  v5 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFSoftwareUpdateCounter softwareUpdatesReadyToInstall](self, "softwareUpdatesReadyToInstall"), CFSTR("softwareUpdatesReadyToInstall"));
  v6 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFSoftwareUpdateCounter softwareUpdatesInProgress](self, "softwareUpdatesInProgress"), CFSTR("softwareUpdatesInProgress"));
  v7 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFSoftwareUpdateCounter softwareUpdatesDownloading](self, "softwareUpdatesDownloading"), CFSTR("softwareUpdatesDownloading"));
  v8 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFSoftwareUpdateCounter softwareUpdatesInstalling](self, "softwareUpdatesInstalling"), CFSTR("softwareUpdatesInstalling"));
  v9 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFSoftwareUpdateCounter softwareUpdatesInstalled](self, "softwareUpdatesInstalled"), CFSTR("softwareUpdatesInstalled"));
  v10 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFSoftwareUpdateCounter firmwareUpdatesReadyToInstall](self, "firmwareUpdatesReadyToInstall"), CFSTR("firmwareUpdatesReadyToInstall"));
  v11 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFSoftwareUpdateCounter updatesReadyToInstall](self, "updatesReadyToInstall"), CFSTR("updatesReadyToInstall"));
  v12 = (id)objc_msgSend(v3, "appendUnsignedInteger:withName:", -[HFSoftwareUpdateCounter allUpdates](self, "allUpdates"), CFSTR("allUpdates"));
  objc_msgSend(v3, "build");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)softwareUpdatesRequested
{
  return self->_softwareUpdatesRequested;
}

- (unint64_t)softwareUpdatesDownloading
{
  return self->_softwareUpdatesDownloading;
}

- (unint64_t)softwareUpdatesInstalling
{
  return self->_softwareUpdatesInstalling;
}

- (unint64_t)allUpdates
{
  return self->_allUpdates;
}

- (NSSet)accessoriesWithRequestedSoftwareUpdates
{
  return self->_accessoriesWithRequestedSoftwareUpdates;
}

- (NSSet)accessoriesDownloadingSoftwareUpdates
{
  return self->_accessoriesDownloadingSoftwareUpdates;
}

@end
