@implementation AATrustedDeviceListResponse

- (AATrustedDeviceListResponse)initWithHTTPResponse:(id)a3 data:(id)a4
{
  AATrustedDeviceListResponse *v4;
  AATrustedDeviceListResponse *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  AATrustedDevice *v16;
  AATrustedDevice *v17;
  NSArray *devices;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSNumber *defaultNumberOfDevicesToShow;
  AATrustedDeviceListResponse *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v35.receiver = self;
  v35.super_class = (Class)AATrustedDeviceListResponse;
  v4 = -[AAResponse initWithHTTPResponse:data:bodyIsPlist:](&v35, sel_initWithHTTPResponse_data_bodyIsPlist_, a3, a4, 0);
  v5 = v4;
  if (!v4)
  {
LABEL_14:
    v24 = v5;
    goto LABEL_18;
  }
  -[AAResponse responseDictionary](v4, "responseDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("manageDevices"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("devices"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v32;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v32 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v14);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v16 = [AATrustedDevice alloc];
              v17 = -[AATrustedDevice initWithDictionary:](v16, "initWithDictionary:", v15, (_QWORD)v31);
              -[NSArray addObject:](v9, "addObject:", v17);

            }
            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
        }
        while (v12);
      }

      devices = v5->_devices;
      v5->_devices = v9;

      v19 = (void *)MEMORY[0x1E0CB37E8];
      -[AAResponse responseDictionary](v5, "responseDictionary");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("defaultNumberOfDevicesToShow"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "numberWithInt:", objc_msgSend(v21, "intValue"));
      v22 = objc_claimAutoreleasedReturnValue();
      defaultNumberOfDevicesToShow = v5->_defaultNumberOfDevicesToShow;
      v5->_defaultNumberOfDevicesToShow = (NSNumber *)v22;

      goto LABEL_14;
    }
  }
  -[AAResponse responseDictionary](v5, "responseDictionary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("status"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  -[AAResponse responseDictionary](v5, "responseDictionary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("status-message"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  _AALogSystem();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v37 = v26;
    v38 = 2112;
    v39 = v28;
    _os_log_impl(&dword_19EACA000, v29, OS_LOG_TYPE_DEFAULT, "Error: Trusted device list not seen in server response data with status=%@ message=%@", buf, 0x16u);
  }

  v24 = 0;
LABEL_18:

  return v24;
}

- (NSArray)devices
{
  return self->_devices;
}

- (NSNumber)defaultNumberOfDevicesToShow
{
  return self->_defaultNumberOfDevicesToShow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultNumberOfDevicesToShow, 0);
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
