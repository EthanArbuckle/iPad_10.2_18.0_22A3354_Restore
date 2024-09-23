@implementation MapsSuggestionsRealVirtualGarageConnector

- (void)openVGConnection
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC6BE8], "sharedService");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openForClient:", self);

}

- (void)closeVGConnection
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC6BE8], "sharedService");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "closeForClient:", self);

}

- (void)startObservingVG
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC6BE8], "sharedService");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerObserver:", self);

}

- (void)stopObservingVG
{
  id v3;

  objc_msgSend(MEMORY[0x1E0DC6BE8], "sharedService");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

}

- (void)fetchUnpairedVehiclesWithHandler:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0DC6BE8];
  v4 = a3;
  objc_msgSend(v3, "sharedService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "virtualGarageGetListOfUnpairedVehiclesWithReply:", v4);

}

- (void)virtualGarage:(id)a3 didUpdateUnpairedVehicles:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[MapsSuggestionsRealVirtualGarageConnector delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "virtualGarageDidUpdateUnpairedVehicles:", v7);
  }
  else
  {
    GEOFindOrCreateLog();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446722;
      v11 = "MapsSuggestionsRealVirtualGarageConnector.m";
      v12 = 1026;
      v13 = 63;
      v14 = 2082;
      v15 = "-[MapsSuggestionsRealVirtualGarageConnector virtualGarage:didUpdateUnpairedVehicles:]";
      _os_log_impl(&dword_1A427D000, v9, OS_LOG_TYPE_ERROR, "%{public}s:%{public}d: strongDelegate went away in %{public}s", (uint8_t *)&v10, 0x1Cu);
    }

  }
}

- (void)fetchStateOfChargeForVehicleWithIdentifier:(id)a3 handler:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0DC6BE8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedService");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "virtualGarageGetLatestStateOfVehicleWithIdentifier:syncAcrossDevices:withReply:", v7, 0, v6);

}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "description");
}

- (MapsSuggestionsVirtualGarageConnectorDelegate)delegate
{
  return (MapsSuggestionsVirtualGarageConnectorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
