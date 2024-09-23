@implementation NTKGeocoderManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_0 != -1)
    dispatch_once(&sharedManager_onceToken_0, &__block_literal_global_53);
  return (id)sharedManager_manager;
}

void __35__NTKGeocoderManager_sharedManager__block_invoke()
{
  NTKGeocoderManager *v0;
  void *v1;

  v0 = objc_alloc_init(NTKGeocoderManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;

}

- (NTKGeocoderManager)init
{
  NTKGeocoderManager *v2;
  CLGeocoder *v3;
  CLGeocoder *geocoder;
  uint64_t v5;
  NSMutableArray *handlers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NTKGeocoderManager;
  v2 = -[NTKGeocoderManager init](&v8, sel_init);
  if (v2)
  {
    v3 = (CLGeocoder *)objc_alloc_init(MEMORY[0x1E0C9E390]);
    geocoder = v2->_geocoder;
    v2->_geocoder = v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    handlers = v2->_handlers;
    v2->_handlers = (NSMutableArray *)v5;

  }
  return v2;
}

- (id)cachedPlacemarkForLocation:(id)a3
{
  id v4;
  void *v5;
  CLPlacemark *v6;

  v4 = a3;
  v5 = v4;
  if (self->_cachedLocation && self->_cachedPlacemark && objc_msgSend(v4, "isEqual:"))
    v6 = self->_cachedPlacemark;
  else
    v6 = 0;

  return v6;
}

- (void)placemarkForLocation:(id)a3 handler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSMutableArray *handlers;
  void *v13;
  void *v14;
  NSObject *v15;
  NSMutableArray *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  CLGeocoder *geocoder;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[NTKGeocoderManager cachedPlacemarkForLocation:](self, "cachedPlacemarkForLocation:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    _NTKLoggingObjectForDomain(12, (uint64_t)"NTKLoggingDomainLocation");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v7;
      v29 = 2112;
      v30 = v9;
      _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_DEFAULT, "Hitting cached placemark for location: %@ %@", buf, 0x16u);
    }

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__NTKGeocoderManager_placemarkForLocation_handler___block_invoke;
    block[3] = &unk_1E6BCE3C8;
    v26 = v8;
    v25 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else if (-[CLLocation isEqual:](self->_cachedLocation, "isEqual:", v7))
  {
    _NTKLoggingObjectForDomain(12, (uint64_t)"NTKLoggingDomainLocation");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v7;
      _os_log_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_DEFAULT, "Requesting the placemark for the same location. %@", buf, 0xCu);
    }

    handlers = self->_handlers;
    v13 = (void *)objc_msgSend(v8, "copy");
    v14 = _Block_copy(v13);
    -[NSMutableArray addObject:](handlers, "addObject:", v14);

  }
  else
  {
    if (-[CLGeocoder isGeocoding](self->_geocoder, "isGeocoding"))
    {
      _NTKLoggingObjectForDomain(12, (uint64_t)"NTKLoggingDomainLocation");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v7;
        _os_log_impl(&dword_1B72A3000, v15, OS_LOG_TYPE_DEFAULT, "Canceling the previous geocode request. %@", buf, 0xCu);
      }

      -[CLGeocoder cancelGeocode](self->_geocoder, "cancelGeocode");
    }
    objc_storeStrong((id *)&self->_cachedLocation, a3);
    -[NSMutableArray removeAllObjects](self->_handlers, "removeAllObjects");
    v16 = self->_handlers;
    v17 = (void *)objc_msgSend(v8, "copy");
    v18 = _Block_copy(v17);
    -[NSMutableArray addObject:](v16, "addObject:", v18);

    _NTKLoggingObjectForDomain(12, (uint64_t)"NTKLoggingDomainLocation");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v7;
      _os_log_impl(&dword_1B72A3000, v19, OS_LOG_TYPE_DEFAULT, "Sending geocode request for location %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    geocoder = self->_geocoder;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __51__NTKGeocoderManager_placemarkForLocation_handler___block_invoke_4;
    v21[3] = &unk_1E6BD24E0;
    objc_copyWeak(&v23, (id *)buf);
    v22 = v7;
    -[CLGeocoder reverseGeocodeLocation:completionHandler:](geocoder, "reverseGeocodeLocation:completionHandler:", v22, v21);

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }

}

uint64_t __51__NTKGeocoderManager_placemarkForLocation_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __51__NTKGeocoderManager_placemarkForLocation_handler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_handlePlacemarks:fromLocation:error:", v7, *(_QWORD *)(a1 + 32), v6);

}

- (void)_handlePlacemarks:(id)a3 fromLocation:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD block[4];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "code") != 10)
  {
    if (v10)
    {
      _NTKLoggingObjectForDomain(12, (uint64_t)"NTKLoggingDomainLocation");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v21 = v9;
        v22 = 2112;
        v23 = v10;
        _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "Reverse geocide with error: %@ %@.", buf, 0x16u);
      }
      v13 = 0;
    }
    else
    {
      objc_msgSend(v8, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v13)
        goto LABEL_9;
      objc_storeStrong((id *)&self->_cachedPlacemark, v13);
      _NTKLoggingObjectForDomain(12, (uint64_t)"NTKLoggingDomainLocation");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v21 = v9;
        v22 = 2112;
        v23 = v13;
        _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "Updated the cached placemark for location %@-%@.", buf, 0x16u);
      }
    }

LABEL_9:
    v14 = (void *)-[NSMutableArray copy](self->_handlers, "copy");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__NTKGeocoderManager__handlePlacemarks_fromLocation_error___block_invoke;
    block[3] = &unk_1E6BCDCB8;
    v17 = v14;
    v18 = v13;
    v19 = v10;
    v15 = v13;
    v11 = v14;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    -[NSMutableArray removeAllObjects](self->_handlers, "removeAllObjects");

    goto LABEL_10;
  }
  _NTKLoggingObjectForDomain(12, (uint64_t)"NTKLoggingDomainLocation");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v9;
    _os_log_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_DEFAULT, "Reverse geocode request is cancelled. %@", buf, 0xCu);
  }
LABEL_10:

}

void __59__NTKGeocoderManager__handlePlacemarks_fromLocation_error___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5) + 16))(*(_QWORD *)(*((_QWORD *)&v6 + 1) + 8 * v5));
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
    }
    while (v3);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_locationInUseAssertion, 0);
  objc_storeStrong((id *)&self->_cachedPlacemark, 0);
  objc_storeStrong((id *)&self->_cachedLocation, 0);
  objc_storeStrong((id *)&self->_geocoder, 0);
}

@end
