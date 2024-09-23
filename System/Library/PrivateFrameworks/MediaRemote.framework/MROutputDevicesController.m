@implementation MROutputDevicesController

- (MROutputDevicesController)initWithConfiguration:(id)a3
{
  id v5;
  MROutputDevicesController *v6;
  MROutputDevicesController *v7;
  void *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MROutputDevicesController;
  v6 = -[MROutputDevicesController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    +[MROutputDeviceDataSourceManager sharedManager](MROutputDeviceDataSourceManager, "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addOutputDeviceController:", v7);

    -[MROutputDevicesController updateOutputDevices](v7, "updateOutputDevices");
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  +[MROutputDeviceDataSourceManager sharedManager](MROutputDeviceDataSourceManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeOutputDeviceController:", self);

  v4.receiver = self;
  v4.super_class = (Class)MROutputDevicesController;
  -[MROutputDevicesController dealloc](&v4, sel_dealloc);
}

- (void)setDiscoveryMode:(unint64_t)a3
{
  id v3;

  if (self->_discoveryMode != a3)
  {
    self->_discoveryMode = a3;
    +[MROutputDeviceDataSourceManager sharedManager](MROutputDeviceDataSourceManager, "sharedManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "udpateDiscoveryMode");

  }
}

- (void)setCollators:(id)a3
{
  objc_storeStrong((id *)&self->_collators, a3);
}

- (void)performModification:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[MROutputDeviceDataSourceManager sharedManager](MROutputDeviceDataSourceManager, "sharedManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performModification:completion:", v6, v5);

}

- (void)updateAvailableOutputDevices:(id)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  NSArray *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSArray *v13;
  NSArray *availableOutputDevices;
  NSArray *v15;
  id WeakRetained;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "allObjects");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = MEMORY[0x1E0C9AA60];
  if (v4)
    v6 = v4;
  v22[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = self->_collators;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      v13 = v7;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "collateOutputDevices:", v13, (_QWORD)v17);
        v7 = (NSArray *)objc_claimAutoreleasedReturnValue();

        ++v12;
        v13 = v7;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  availableOutputDevices = self->_availableOutputDevices;
  self->_availableOutputDevices = v7;
  v15 = v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "outputDevicesController:didChangeAvailableOutputDevices:", self, v15);

}

- (void)updatePendingOutputDevices:(id)a3
{
  id v5;
  id WeakRetained;

  objc_storeStrong((id *)&self->_pendingOutputDevices, a3);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "outputDevicesController:didChangePendingOutputDevices:", self, v5);

}

- (void)updateSelectedOutputDevices:(id)a3
{
  id v5;
  id WeakRetained;

  objc_storeStrong((id *)&self->_selectedOutputDevices, a3);
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "outputDevicesController:didChangeSelectedOutputDevices:", self, v5);

}

- (void)updateOutputDevices
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  +[MROutputDeviceDataSourceManager sharedManager](MROutputDeviceDataSourceManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "availableOutputDevicesForOutputDeviceController:", self);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[MROutputDevicesController updateAvailableOutputDevices:](self, "updateAvailableOutputDevices:", v8);
  +[MROutputDeviceDataSourceManager sharedManager](MROutputDeviceDataSourceManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pendingOutputDevicesForOutputDeviceController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MROutputDevicesController updatePendingOutputDevices:](self, "updatePendingOutputDevices:", v5);
  +[MROutputDeviceDataSourceManager sharedManager](MROutputDeviceDataSourceManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedOutputDevicesForOutputDeviceController:", self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[MROutputDevicesController updateSelectedOutputDevices:](self, "updateSelectedOutputDevices:", v7);
}

- (MROutputDeviceConfiguration)configuration
{
  return self->_configuration;
}

- (NSArray)availableOutputDevices
{
  return self->_availableOutputDevices;
}

- (NSSet)pendingOutputDevices
{
  return self->_pendingOutputDevices;
}

- (NSSet)selectedOutputDevices
{
  return self->_selectedOutputDevices;
}

- (NSArray)collators
{
  return self->_collators;
}

- (MROutputDevicesControllerDelegate)delegate
{
  return (MROutputDevicesControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)discoveryMode
{
  return self->_discoveryMode;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_collators, 0);
  objc_storeStrong((id *)&self->_selectedOutputDevices, 0);
  objc_storeStrong((id *)&self->_pendingOutputDevices, 0);
  objc_storeStrong((id *)&self->_availableOutputDevices, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
