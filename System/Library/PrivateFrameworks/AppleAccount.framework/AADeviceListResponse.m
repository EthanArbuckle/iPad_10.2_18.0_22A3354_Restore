@implementation AADeviceListResponse

- (AADeviceListResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  AADeviceListResponse *v4;
  AADeviceListResponse *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  AADevice *v15;
  AADevice *v16;
  void *devices;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v27.receiver = self;
  v27.super_class = (Class)AADeviceListResponse;
  v4 = -[AAResponse initWithHTTPResponse:data:](&v27, sel_initWithHTTPResponse_data_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[AAResponse responseDictionary](v4, "responseDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("devices"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v24;
        do
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v24 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v13);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = [AADevice alloc];
              v16 = -[AADevice initWithDictionary:](v15, "initWithDictionary:", v14, (_QWORD)v23);
              -[NSArray addObject:](v8, "addObject:", v16);

            }
            ++v13;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
        }
        while (v11);
      }

      devices = v5->_devices;
      v5->_devices = v8;
    }
    else
    {
      -[AAResponse responseDictionary](v5, "responseDictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("status"));
      devices = (void *)objc_claimAutoreleasedReturnValue();

      -[AAResponse responseDictionary](v5, "responseDictionary");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("status-message"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      _AALogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v29 = devices;
        v30 = 2112;
        v31 = v20;
        _os_log_impl(&dword_19EACA000, v21, OS_LOG_TYPE_DEFAULT, "Error: Device list not seen in server response data with status=%@ message=%@", buf, 0x16u);
      }

    }
  }
  return v5;
}

- (NSArray)devices
{
  return self->_devices;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
