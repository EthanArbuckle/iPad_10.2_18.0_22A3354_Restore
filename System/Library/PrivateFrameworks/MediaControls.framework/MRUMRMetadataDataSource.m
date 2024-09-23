@implementation MRUMRMetadataDataSource

- (MRUMRMetadataDataSource)init
{
  MRUMRMetadataDataSource *v2;
  MRUMRMetadataDataSource *v3;
  MRUMRMetadataDataSource *v4;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MRUMRMetadataDataSource;
  v2 = -[MRUMRMetadataDataSource init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __31__MRUMRMetadataDataSource_init__block_invoke;
    v6[3] = &unk_1E58193D8;
    v6[4] = v2;
    v4 = v2;
    v4->_stateHandle = __31__MRUMRMetadataDataSource_init__block_invoke((uint64_t)v6);

  }
  return v3;
}

uint64_t __31__MRUMRMetadataDataSource_init__block_invoke(uint64_t a1)
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
  v5[2] = __31__MRUMRMetadataDataSource_init__block_invoke_2;
  v5[3] = &unk_1E58193B0;
  objc_copyWeak(&v6, &location);
  v3 = MCLogAddStateHandlerWithName(v2, v5);
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
  return v3;
}

id __31__MRUMRMetadataDataSource_init__block_invoke_2(uint64_t a1, uint64_t a2)
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

- (MRUMRMetadataDataSource)initWithEndpointController:(id)a3 response:(id)a4
{
  id v7;
  id v8;
  MRUMRMetadataDataSource *v9;
  MRUMRMetadataDataSource *v10;

  v7 = a3;
  v8 = a4;
  v9 = -[MRUMRMetadataDataSource init](self, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_endpointController, a3);
    objc_msgSend(v7, "addObserver:", v10);
    objc_storeStrong((id *)&v10->_response, a4);
    -[MRUMRMetadataDataSource updateData](v10, "updateData");
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  os_state_remove_handler();
  v3.receiver = self;
  v3.super_class = (Class)MRUMRMetadataDataSource;
  -[MRUMRMetadataDataSource dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%@) | (%@) | (%@) | (%@) | (%@)"), objc_opt_class(), self->_bundleID, self->_artwork, self->_nowPlayingInfo, self->_timeControls, self->_transportControls);
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
  -[MRUMRMetadataDataSource updateData](self, "updateData");
}

- (void)updateData
{
  MRNowPlayingPlayerResponse *v3;

  v3 = self->_response;
  -[MRUMRMetadataDataSource updateBundleIDWithResponse:](self, "updateBundleIDWithResponse:", v3);
  -[MRUMRMetadataDataSource updateArtworkWithResponse:](self, "updateArtworkWithResponse:", v3);
  -[MRUMRMetadataDataSource updateNowPlayingInfoWithResponse:](self, "updateNowPlayingInfoWithResponse:", v3);
  -[MRUMRMetadataDataSource updateTimeControlsWithResponse:](self, "updateTimeControlsWithResponse:", v3);
  -[MRUMRMetadataDataSource updateTransportControlsWithResponse:](self, "updateTransportControlsWithResponse:", v3);

}

- (void)updateBundleIDWithResponse:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id WeakRetained;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "playerPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!-[NSString isEqualToString:](self->_bundleID, "isEqualToString:", v6))
  {
    objc_storeStrong((id *)&self->_bundleID, v6);
    MCLogCategoryDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138543618;
      v10 = objc_opt_class();
      v11 = 2114;
      v12 = v6;
      _os_log_impl(&dword_1AA991000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ update bundleID: %{public}@", (uint8_t *)&v9, 0x16u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "metadataDataSource:didChangeBundleID:", self, v6);

  }
}

- (void)updateArtwork
{
  -[MRUMRMetadataDataSource updateArtworkWithResponse:](self, "updateArtworkWithResponse:", self->_response);
}

- (void)updateArtworkWithResponse:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  MRUArtwork *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  NSObject *v14;
  id WeakRetained;
  int v16;
  uint64_t v17;
  __int16 v18;
  MRUArtwork *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "playbackQueue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "artwork");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithData:", v8);
  else
    v9 = 0;
  v10 = -[MRUArtwork initWithImage:]([MRUArtwork alloc], "initWithImage:", v9);
  if (!-[MRUArtwork isEqual:](self->_artwork, "isEqual:", v10))
  {
    objc_storeStrong((id *)&self->_artwork, v10);
    -[MRUArtwork catalog](v10, "catalog");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setCacheIdentifier:forCacheReference:", v13, self);

    MCLogCategoryDefault();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138543618;
      v17 = objc_opt_class();
      v18 = 2114;
      v19 = v10;
      _os_log_impl(&dword_1AA991000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ update artwork: %{public}@", (uint8_t *)&v16, 0x16u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "metadataDataSource:didChangeArtwork:", self, v10);

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
  -[MRUMRMetadataDataSource placeholder](self, "placeholder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MRUNowPlayingInfo initWithMRResponse:placeholder:](v5, "initWithMRResponse:placeholder:", v4, v6);

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
  MRUTimeControls *v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  uint64_t v8;
  __int16 v9;
  MRUTimeControls *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MRUTimeControls);
  if (!-[MRUTimeControls isEqual:](self->_timeControls, "isEqual:", v4))
  {
    objc_storeStrong((id *)&self->_timeControls, v4);
    MCLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543618;
      v8 = objc_opt_class();
      v9 = 2114;
      v10 = v4;
      _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ update time controls: %{public}@", (uint8_t *)&v7, 0x16u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "metadataDataSource:didChangeTimeControls:", self, v4);

  }
}

- (void)updateTransportControlsWithResponse:(id)a3
{
  MRUTransportControls *v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  uint64_t v8;
  __int16 v9;
  MRUTransportControls *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MRUTransportControls);
  if (!-[MRUTransportControls isEqual:](self->_transportControls, "isEqual:", v4))
  {
    objc_storeStrong((id *)&self->_transportControls, v4);
    MCLogCategoryDefault();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138543618;
      v8 = objc_opt_class();
      v9 = 2114;
      v10 = v4;
      _os_log_impl(&dword_1AA991000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ update transport controls: %{public}@", (uint8_t *)&v7, 0x16u);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "metadataDataSource:didChangeTransportControls:", self, v4);

  }
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

- (id)placeholderSymbolName
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;

  -[MRUEndpointController route](self->_endpointController, "route");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        v5 = -[MRUEndpointController isDeviceSystemRoute](self->_endpointController, "isDeviceSystemRoute"),
        v4,
        v5))
  {
    objc_msgSend(MEMORY[0x1E0CC2318], "_currentDeviceRoutingSymbolName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CC2318];
    -[MRUEndpointController route](self->_endpointController, "route");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_symbolNameForRoute:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
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

- (MRNowPlayingPlayerResponse)response
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
