@implementation MRUMPCMetadataDataSource

- (MRUMPCMetadataDataSource)init
{
  MRUMPCMetadataDataSource *v2;
  MRUMPCMetadataDataSource *v3;
  MRUMPCMetadataDataSource *v4;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MRUMPCMetadataDataSource;
  v2 = -[MRUMPCMetadataDataSource init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __32__MRUMPCMetadataDataSource_init__block_invoke;
    v6[3] = &unk_1E58193D8;
    v6[4] = v2;
    v4 = v2;
    v4->_stateHandle = __32__MRUMPCMetadataDataSource_init__block_invoke((uint64_t)v6);

  }
  return v3;
}

uint64_t __32__MRUMPCMetadataDataSource_init__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %p"), objc_opt_class(), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __32__MRUMPCMetadataDataSource_init__block_invoke_2;
  v5[3] = &unk_1E58193B0;
  objc_copyWeak(&v6, &location);
  v3 = MCLogAddStateHandlerWithName(v2, v5);
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
  return v3;
}

id __32__MRUMPCMetadataDataSource_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v3;
  void *v4;

  if (*(_DWORD *)(a2 + 16) == 3)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v3 = WeakRetained;
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "_stateDumpObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (MRUMPCMetadataDataSource)initWithEndpointController:(id)a3
{
  id v5;
  MRUMPCMetadataDataSource *v6;
  MRUMPCMetadataDataSource *v7;

  v5 = a3;
  v6 = -[MRUMPCMetadataDataSource init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_endpointController, a3);
    objc_msgSend(v5, "addObserver:", v7);
    -[MRUMPCMetadataDataSource updateData](v7, "updateData");
  }

  return v7;
}

- (MRUMPCMetadataDataSource)initWithResponse:(id)a3
{
  id v5;
  MRUMPCMetadataDataSource *v6;
  MRUMPCMetadataDataSource *v7;

  v5 = a3;
  v6 = -[MRUMPCMetadataDataSource init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_response, a3);
    -[MRUMPCMetadataDataSource updateData](v7, "updateData");
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)MRUMPCMetadataDataSource;
  -[MRUMPCMetadataDataSource dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@) | (%@) | (%@) | (%@) | (%@)"), objc_opt_class(), self->_bundleID, self->_artwork, self->_nowPlayingInfo, self->_timeControls, self->_transportControls);
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
  -[MRUMPCMetadataDataSource updateData](self, "updateData");
}

- (void)endpointController:(id)a3 didChangeResponse:(id)a4
{
  -[MRUMPCMetadataDataSource setResponse:](self, "setResponse:", a4);
}

- (void)updateData
{
  MPCPlayerResponse *v3;

  v3 = self->_response;
  -[MRUMPCMetadataDataSource updateBundleIDWithResponse:](self, "updateBundleIDWithResponse:", v3);
  -[MRUMPCMetadataDataSource updateNowPlayingInfoWithResponse:](self, "updateNowPlayingInfoWithResponse:", v3);
  -[MRUMPCMetadataDataSource updateTimeControlsWithResponse:](self, "updateTimeControlsWithResponse:", v3);
  -[MRUMPCMetadataDataSource updateTransportControlsWithResponse:](self, "updateTransportControlsWithResponse:", v3);
  -[MRUMPCMetadataDataSource updateArtworkWithResponse:](self, "updateArtworkWithResponse:", v3);

}

- (void)updateBundleIDWithResponse:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  id WeakRetained;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[MRUEndpointController endpointController](self->_endpointController, "endpointController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "representedBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[NSString isEqualToString:](self->_bundleID, "isEqualToString:", v5))
  {
    objc_storeStrong((id *)&self->_bundleID, v5);
    MCLogCategoryDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543618;
      v9 = objc_opt_class();
      v10 = 2114;
      v11 = v5;
      _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ update bundleID: %{public}@", (uint8_t *)&v8, 0x16u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "metadataDataSource:didChangeBundleID:", self, v5);

  }
}

- (void)updateArtwork
{
  -[MRUMPCMetadataDataSource updateArtworkWithResponse:](self, "updateArtworkWithResponse:", self->_response);
}

- (void)updateArtworkWithResponse:(id)a3
{
  id v4;
  MRUArtwork *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  NSObject *v9;
  id WeakRetained;
  int v11;
  uint64_t v12;
  __int16 v13;
  MRUArtwork *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[MRUArtwork initWithMPCResponse:]([MRUArtwork alloc], "initWithMPCResponse:", v4);

  if (!-[MRUArtwork isEqual:](self->_artwork, "isEqual:", v5))
  {
    objc_storeStrong((id *)&self->_artwork, v5);
    -[MRUArtwork catalog](v5, "catalog");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCacheIdentifier:forCacheReference:", v8, self);

    MCLogCategoryDefault();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543618;
      v12 = objc_opt_class();
      v13 = 2114;
      v14 = v5;
      _os_log_impl(&dword_1AA991000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ update artwork: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "metadataDataSource:didChangeArtwork:", self, v5);

  }
}

- (void)updateNowPlayingInfoWithResponse:(id)a3
{
  id v4;
  MRUNowPlayingInfo *v5;
  void *v6;
  MRUNowPlayingInfo *v7;
  NSObject *v8;
  id WeakRetained;
  int v10;
  uint64_t v11;
  __int16 v12;
  MRUNowPlayingInfo *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [MRUNowPlayingInfo alloc];
  -[MRUMPCMetadataDataSource placeholder](self, "placeholder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MRUNowPlayingInfo initWithMPCResponse:placeholder:](v5, "initWithMPCResponse:placeholder:", v4, v6);

  if (!-[MRUNowPlayingInfo isEqual:](self->_nowPlayingInfo, "isEqual:", v7))
  {
    objc_storeStrong((id *)&self->_nowPlayingInfo, v7);
    MCLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543618;
      v11 = objc_opt_class();
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_1AA991000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ update metadata: %{public}@", (uint8_t *)&v10, 0x16u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "metadataDataSource:didChangeNowPlayingInfo:", self, v7);

  }
}

- (void)updateTimeControlsWithResponse:(id)a3
{
  id v4;
  MRUTimeControls *v5;
  void *v6;
  void *v7;
  MRUTimeControls *v8;
  NSObject *v9;
  id WeakRetained;
  int v11;
  uint64_t v12;
  __int16 v13;
  MRUTimeControls *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [MRUTimeControls alloc];
  objc_msgSend(v4, "tracklist");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "playingItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[MRUTimeControls initWithResponseItem:](v5, "initWithResponseItem:", v7);

  if (!-[MRUTimeControls isEqual:](self->_timeControls, "isEqual:", v8))
  {
    objc_storeStrong((id *)&self->_timeControls, v8);
    MCLogCategoryDefault();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543618;
      v12 = objc_opt_class();
      v13 = 2114;
      v14 = v8;
      _os_log_impl(&dword_1AA991000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ update time controls: %{public}@", (uint8_t *)&v11, 0x16u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "metadataDataSource:didChangeTimeControls:", self, v8);

  }
}

- (void)updateTransportControlsWithResponse:(id)a3
{
  id v4;
  MRUTransportControls *v5;
  NSObject *v6;
  id WeakRetained;
  int v8;
  uint64_t v9;
  __int16 v10;
  MRUTransportControls *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[MRUTransportControls initWithMPCResponse:]([MRUTransportControls alloc], "initWithMPCResponse:", v4);

  objc_storeStrong((id *)&self->_transportControls, v5);
  MCLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = objc_opt_class();
    v10 = 2114;
    v11 = v5;
    _os_log_impl(&dword_1AA991000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ update transport controls: %{public}@", (uint8_t *)&v8, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "metadataDataSource:didChangeTransportControls:", self, v5);

}

- (id)placeholder
{
  void *v2;

  v2 = -[MRUEndpointController state](self->_endpointController, "state");
  switch((unint64_t)v2)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      +[MRUStringsProvider notConnected](MRUStringsProvider, "notConnected");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 0uLL:
    case 1uLL:
      +[MRUStringsProvider connecting](MRUStringsProvider, "connecting");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      +[MRUStringsProvider loading](MRUStringsProvider, "loading");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      +[MRUStringsProvider notPlaying](MRUStringsProvider, "notPlaying");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v2;
  }
  return v2;
}

- (id)_stateDumpObject
{
  const __CFString *bundleID;
  MRUArtwork *artwork;
  MRUNowPlayingInfo *nowPlayingInfo;
  MRUTimeControls *timeControls;
  MRUTransportControls *transportControls;
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("bundleID");
  v8[1] = CFSTR("artwork");
  bundleID = (const __CFString *)self->_bundleID;
  artwork = self->_artwork;
  if (!bundleID)
    bundleID = CFSTR("<NONE>");
  if (!artwork)
    artwork = (MRUArtwork *)CFSTR("<NONE>");
  v9[0] = bundleID;
  v9[1] = artwork;
  v8[2] = CFSTR("nowPlayingInfo");
  v8[3] = CFSTR("timeControls");
  timeControls = self->_timeControls;
  nowPlayingInfo = self->_nowPlayingInfo;
  if (!nowPlayingInfo)
    nowPlayingInfo = (MRUNowPlayingInfo *)CFSTR("<NONE>");
  if (!timeControls)
    timeControls = (MRUTimeControls *)CFSTR("<NONE>");
  v9[2] = nowPlayingInfo;
  v9[3] = timeControls;
  v8[4] = CFSTR("transportControls");
  transportControls = self->_transportControls;
  if (!transportControls)
    transportControls = (MRUTransportControls *)CFSTR("<NONE>");
  v9[4] = transportControls;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (MRUArtwork)artwork
{
  return self->_artwork;
}

- (MRUTimeControls)timeControls
{
  return self->_timeControls;
}

- (MRUNowPlayingInfo)nowPlayingInfo
{
  return self->_nowPlayingInfo;
}

- (MRUTransportControls)transportControls
{
  return self->_transportControls;
}

- (MRUMetadataDataSourceDelegate)delegate
{
  return (MRUMetadataDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (MRUEndpointController)endpointController
{
  return self->_endpointController;
}

- (MPCPlayerResponse)response
{
  return self->_response;
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_endpointController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transportControls, 0);
  objc_storeStrong((id *)&self->_nowPlayingInfo, 0);
  objc_storeStrong((id *)&self->_timeControls, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
