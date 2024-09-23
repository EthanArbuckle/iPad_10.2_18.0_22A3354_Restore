@implementation CMContinuityCaptureVideoStream

- (CMContinuityCaptureVideoStream)initWithDevice:(id)a3 streamFormats:(id)a4 deviceID:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id WeakRetained;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  CMContinuityCaptureVideoStream *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSMutableDictionary *v25;
  NSMutableDictionary *cmControlByName;
  NSMutableDictionary *v27;
  NSMutableDictionary *clientsRequestingBooleanControlOnByControlName;
  void *v29;
  uint64_t v30;
  NSString *deviceID;
  CMContinuityCaptureVideoStream *v32;
  NSObject *v34;
  NSObject *v35;
  id obj;
  id v37;
  objc_super v38;
  uint8_t buf[4];
  CMContinuityCaptureVideoStream *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v37 = a5;
  v12 = a6;
  obj = v10;
  objc_msgSend(v10, "compositeDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_compositeDevice, v13);

  v14 = (void *)MEMORY[0x24BDD17C8];
  WeakRetained = objc_loadWeakRetained((id *)&self->_compositeDevice);
  objc_msgSend(WeakRetained, "client");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "device");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "deviceName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("CMContinuityCaptureVideoStream-%@"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_alloc_init(MEMORY[0x24BDD1880]);
  v38.receiver = self;
  v38.super_class = (Class)CMContinuityCaptureVideoStream;
  v21 = -[CMIOExtensionStream initWithLocalizedName:streamID:direction:clockType:source:](&v38, sel_initWithLocalizedName_streamID_direction_clockType_source_, v19, v20, 0, 0, self);

  if (v21)
  {
    objc_storeStrong((id *)&v21->_queue, a6);
    CMContinuityCaptureLog(2);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v11;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v40 = v21;
      v41 = 2112;
      v42 = v11;
      _os_log_impl(&dword_227C5D000, v22, OS_LOG_TYPE_DEFAULT, " %@ setup stream for formats %@", buf, 0x16u);
    }

    v24 = obj;
    if (v21->_queue)
    {
      objc_storeWeak((id *)&v21->_device, obj);
      v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      cmControlByName = v21->_cmControlByName;
      v21->_cmControlByName = v25;

      v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      clientsRequestingBooleanControlOnByControlName = v21->_clientsRequestingBooleanControlOnByControlName;
      v21->_clientsRequestingBooleanControlOnByControlName = v27;

      if (-[CMContinuityCaptureVideoStream setupStreams:](v21, "setupStreams:", v23))
      {
        v29 = v37;
        v30 = objc_msgSend(v37, "copy");
        deviceID = v21->_deviceID;
        v21->_deviceID = (NSString *)v30;

        -[CMContinuityCaptureVideoStream setupControls](v21, "setupControls");
        v32 = v21;
      }
      else
      {
        CMContinuityCaptureLog(2);
        v35 = objc_claimAutoreleasedReturnValue();
        v29 = v37;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          -[CMContinuityCaptureVideoStream initWithDevice:streamFormats:deviceID:queue:].cold.2();

        v32 = 0;
      }
    }
    else
    {
      CMContinuityCaptureLog(2);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureVideoStream initWithDevice:streamFormats:deviceID:queue:].cold.1();

      v32 = 0;
      v29 = v37;
    }
  }
  else
  {
    v32 = 0;
    v23 = v11;
    v24 = obj;
    v29 = v37;
  }

  return v32;
}

- (void)terminateComplete:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  int v6;
  CMContinuityCaptureVideoStream *v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  CMContinuityCaptureLog(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 138543618;
    v7 = self;
    v8 = 2080;
    v9 = "-[CMContinuityCaptureVideoStream terminateComplete:]";
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_INFO, "%{public}@ %s", (uint8_t *)&v6, 0x16u);
  }

  v4[2](v4);
}

- (CMContinuityCaptureVideoDevice)device
{
  return (CMContinuityCaptureVideoDevice *)objc_loadWeakRetained((id *)&self->_device);
}

- (void)disconnectClient:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureVideoStream queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__CMContinuityCaptureVideoStream_disconnectClient___block_invoke;
  block[3] = &unk_24F06AE88;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __51__CMContinuityCaptureVideoStream_disconnectClient___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_disconnectClient:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void)_disconnectClient:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  NSMutableDictionary *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  _BOOL4 v20;
  int v21;
  int v22;
  NSMutableDictionary *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSMutableDictionary *maxPhotoQualityPrioritizationByClients;
  __int128 v33;
  id *location;
  uint64_t v35;
  CMContinuityCaptureVideoStream *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  CMContinuityCaptureVideoStream *v42;
  __int16 v43;
  _BYTE v44[18];
  __int16 v45;
  int v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v36 = self;
  location = (id *)&self->_device;
  WeakRetained = objc_loadWeakRetained((id *)&self->_device);

  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412547;
      v42 = self;
      v43 = 2113;
      *(_QWORD *)v44 = v4;
      _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_INFO, "%@ Client %{private}@ has disconnected.", buf, 0x16u);
    }

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v7 = self->_clientsRequestingBooleanControlOnByControlName;
    v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    if (v8)
    {
      v10 = v8;
      WeakRetained = 0;
      v11 = *(_QWORD *)v38;
      *(_QWORD *)&v9 = 138412546;
      v33 = v9;
      do
      {
        v12 = 0;
        v35 = v10;
        do
        {
          if (*(_QWORD *)v38 != v11)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v12);
          -[NSMutableDictionary objectForKeyedSubscript:](v36->_clientsRequestingBooleanControlOnByControlName, "objectForKeyedSubscript:", v13, v33);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "containsObject:", v4))
          {
            v15 = v11;
            objc_msgSend(v14, "removeObject:", v4);
            CMContinuityCaptureLog(2);
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              v17 = objc_msgSend(v14, "count");
              *(_DWORD *)buf = 138413059;
              v42 = v36;
              v43 = 2113;
              *(_QWORD *)v44 = v4;
              *(_WORD *)&v44[8] = 2112;
              *(_QWORD *)&v44[10] = v13;
              v45 = 1024;
              v46 = v17;
              _os_log_impl(&dword_227C5D000, v16, OS_LOG_TYPE_INFO, "%@ Client %{private}@ no longer needs %@ on. %d total clients.", buf, 0x26u);
            }

            v18 = objc_msgSend(v14, "count");
            CMContinuityCaptureLog(2);
            v19 = objc_claimAutoreleasedReturnValue();
            v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
            if (v18)
            {
              v11 = v15;
              if (v20)
              {
                v21 = objc_msgSend(v14, "count");
                *(_DWORD *)buf = 138412802;
                v42 = v36;
                v43 = 1024;
                *(_DWORD *)v44 = v21;
                *(_WORD *)&v44[4] = 2112;
                *(_QWORD *)&v44[6] = v13;
                _os_log_impl(&dword_227C5D000, v19, OS_LOG_TYPE_INFO, "%@ There are still %d clients that want %@ on. Keeping on.", buf, 0x1Cu);
              }
            }
            else
            {
              if (v20)
              {
                *(_DWORD *)buf = v33;
                v42 = v36;
                v43 = 2112;
                *(_QWORD *)v44 = v13;
                _os_log_impl(&dword_227C5D000, v19, OS_LOG_TYPE_INFO, "%@ No more clients need %@ on. Turning off.", buf, 0x16u);
              }
              v23 = v7;

              -[NSMutableDictionary objectForKeyedSubscript:](v36->_cmControlByName, "objectForKeyedSubscript:", v13);
              v19 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSObject setValue:](v19, "setValue:", v24);

              v25 = objc_loadWeakRetained(location);
              objc_msgSend(v25, "setValueForControl:completion:", v19, 0);

              if (!WeakRetained)
                WeakRetained = objc_alloc_init(MEMORY[0x24BDBCED8]);
              v26 = (void *)MEMORY[0x24BDC1378];
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
              v27 = WeakRetained;
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "propertyStateWithValue:", v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "setObject:forKeyedSubscript:", v29, v13);

              WeakRetained = v27;
              v7 = v23;
              v11 = v15;
            }
            v10 = v35;
          }
          else
          {
            CMContinuityCaptureLog(2);
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              v22 = objc_msgSend(v14, "count");
              *(_DWORD *)buf = 138413059;
              v42 = v36;
              v43 = 2113;
              *(_QWORD *)v44 = v4;
              *(_WORD *)&v44[8] = 2112;
              *(_QWORD *)&v44[10] = v13;
              v45 = 1024;
              v46 = v22;
              _os_log_impl(&dword_227C5D000, v19, OS_LOG_TYPE_INFO, "%@ Client %{private}@ didn't want %@ on. %d total clients.", buf, 0x26u);
            }
          }

          ++v12;
        }
        while (v10 != v12);
        v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
      }
      while (v10);
    }
    else
    {
      WeakRetained = 0;
    }

    -[NSMutableDictionary objectForKeyedSubscript:](v36->_cmControlByName, "objectForKeyedSubscript:", CFSTR("AsyncStillCaptureConfigurations"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](v36->_maxPhotoQualityPrioritizationByClients, "setObject:forKeyedSubscript:", 0, v4);
      CMContinuityCaptureLog(2);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        maxPhotoQualityPrioritizationByClients = v36->_maxPhotoQualityPrioritizationByClients;
        *(_DWORD *)buf = 138412546;
        v42 = v36;
        v43 = 2112;
        *(_QWORD *)v44 = maxPhotoQualityPrioritizationByClients;
        _os_log_impl(&dword_227C5D000, v31, OS_LOG_TYPE_INFO, "%@ Updated maxPhotoQualityPrioritizationByClients to %@", buf, 0x16u);
      }

    }
    if (WeakRetained)
      -[CMIOExtensionStream notifyPropertiesChanged:](v36, "notifyPropertiesChanged:", WeakRetained);
  }
  else
  {
    v30 = 0;
  }

}

- (void)setupControls
{
  void *v3;
  void *v4;
  CMContinuityCaptureControl *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  CMContinuityCaptureControl *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  CMContinuityCaptureControl *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  CMContinuityCaptureControl *v27;
  void *v28;
  uint64_t v29;
  CMContinuityCaptureControl *v30;
  NSMutableDictionary *v31;
  NSMutableDictionary *clientsRequestingBooleanControlOnByControlName;
  NSMutableDictionary *v33;
  NSMutableDictionary *maxPhotoQualityPrioritizationByClients;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  NSMutableDictionary *cmControlByName;
  void *v41;
  void *v42;
  void *v43;
  NSMutableDictionary *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  int v48;
  void *v49;
  int v50;
  void *v51;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id obja;
  id obj;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint64_t v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureVideoStream device](self, "device");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "capabilities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "controls");
  obja = (id)objc_claimAutoreleasedReturnValue();

  self->_activeFormatIndex = 0;
  v5 = [CMContinuityCaptureControl alloc];
  -[CMContinuityCaptureVideoStream device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "entity");
  -[NSArray firstObject](self->_continuityStreamFormats, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = xmmword_227CED540;
  v66 = 0;
  v9 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v5, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("ActiveFormat"), 0, v7, &v65, v8);

  v56 = (void *)v9;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cmControlByName, "setObject:forKeyedSubscript:", v9, CFSTR("ActiveFormat"));
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByName, "objectForKeyedSubscript:", CFSTR("ActiveFormat"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValueForControl:completion:", v10, 0);

  v11 = [CMContinuityCaptureControl alloc];
  -[CMContinuityCaptureVideoStream device](self, "device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "entity");
  v14 = (void *)MEMORY[0x24BDD16E0];
  -[NSArray objectAtIndexedSubscript:](self->_continuityStreamFormats, "objectAtIndexedSubscript:", self->_activeFormatIndex);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "numberWithUnsignedInt:", objc_msgSend(v15, "maxFrameRate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = xmmword_227CED540;
  v66 = 0;
  v17 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v11, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("CMIOExtensionPropertyStreamFrameDuration"), 0, v13, &v65, v16);

  v55 = (void *)v17;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cmControlByName, "setObject:forKeyedSubscript:", v17, CFSTR("CMIOExtensionPropertyStreamFrameDuration"));
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByName, "objectForKeyedSubscript:", CFSTR("CMIOExtensionPropertyStreamFrameDuration"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setValueForControl:completion:", v18, 0);

  v19 = [CMContinuityCaptureControl alloc];
  -[CMContinuityCaptureVideoStream device](self, "device");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "entity");
  v22 = (void *)MEMORY[0x24BDD16E0];
  -[NSArray objectAtIndexedSubscript:](self->_continuityStreamFormats, "objectAtIndexedSubscript:", self->_activeFormatIndex);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "numberWithUnsignedInt:", objc_msgSend(v23, "minFrameRate"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = xmmword_227CED540;
  v66 = 0;
  v25 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v19, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("CMIOExtensionPropertyStreamMaxFrameDuration"), 0, v21, &v65, v24);

  v54 = (void *)v25;
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cmControlByName, "setObject:forKeyedSubscript:", v25, CFSTR("CMIOExtensionPropertyStreamMaxFrameDuration"));
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByName, "objectForKeyedSubscript:", CFSTR("CMIOExtensionPropertyStreamMaxFrameDuration"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v3;
  objc_msgSend(v3, "setValueForControl:completion:", v26, 0);

  v27 = [CMContinuityCaptureControl alloc];
  -[CMContinuityCaptureVideoStream device](self, "device");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "entity");
  v65 = xmmword_227CED540;
  v66 = 0;
  v30 = -[CMContinuityCaptureControl initWithName:attributes:entity:minimumSupportedVersion:value:](v27, "initWithName:attributes:entity:minimumSupportedVersion:value:", CFSTR("ReactionsInProgress"), 0, v29, &v65, MEMORY[0x24BDBD1A8]);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cmControlByName, "setObject:forKeyedSubscript:", v30, CFSTR("ReactionsInProgress"));
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v31 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  clientsRequestingBooleanControlOnByControlName = self->_clientsRequestingBooleanControlOnByControlName;
  self->_clientsRequestingBooleanControlOnByControlName = v31;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v33 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  maxPhotoQualityPrioritizationByClients = self->_maxPhotoQualityPrioritizationByClients;
  self->_maxPhotoQualityPrioritizationByClients = v33;

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = obja;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v62;
    do
    {
      v38 = 0;
      v57 = v36;
      do
      {
        if (*(_QWORD *)v62 != v37)
          objc_enumerationMutation(obj);
        v39 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v38);
        cmControlByName = self->_cmControlByName;
        objc_msgSend(v39, "name");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](cmControlByName, "setObject:forKeyedSubscript:", v39, v41);

        objc_msgSend(v39, "name");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(cmControlByName) = objc_msgSend(v42, "isEqualToString:", CFSTR("FaceDetectionEnabled"));

        if ((_DWORD)cmControlByName)
        {
          objc_msgSend(MEMORY[0x24BDBCEF0], "set");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = self->_clientsRequestingBooleanControlOnByControlName;
          v45 = v43;
          v46 = CFSTR("FaceDetectionEnabled");
          goto LABEL_8;
        }
        objc_msgSend(v39, "name");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("AsyncStillCaptureEnabled"));

        if (v48)
        {
          objc_msgSend(MEMORY[0x24BDBCEF0], "set");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_clientsRequestingBooleanControlOnByControlName, "setObject:forKeyedSubscript:", v43, CFSTR("AsyncStillCaptureEnabled"));
LABEL_13:
          v36 = v57;
          goto LABEL_14;
        }
        objc_msgSend(v39, "name");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "isEqualToString:", CFSTR("HumanBodyDetectionEnabled"));

        if (v50)
        {
          objc_msgSend(MEMORY[0x24BDBCEF0], "set");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_clientsRequestingBooleanControlOnByControlName, "setObject:forKeyedSubscript:", v43, CFSTR("HumanBodyDetectionEnabled"));
          goto LABEL_13;
        }
        objc_msgSend(v39, "name");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "isEqualToString:", CFSTR("HumanFullBodyDetectionEnabled"));

        v36 = v57;
        if (v52)
        {
          objc_msgSend(MEMORY[0x24BDBCEF0], "set");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = self->_clientsRequestingBooleanControlOnByControlName;
          v45 = v43;
          v46 = CFSTR("HumanFullBodyDetectionEnabled");
LABEL_8:
          -[NSMutableDictionary setObject:forKeyedSubscript:](v44, "setObject:forKeyedSubscript:", v45, v46);
LABEL_14:

        }
        objc_msgSend(v60, "setValueForControl:completion:", v39, 0);
        ++v38;
      }
      while (v36 != v38);
      v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
      v36 = v53;
    }
    while (v53);
  }

}

- (NSArray)formats
{
  return self->_extensionStreamFormats;
}

- (BOOL)setupStreams:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  NSArray *extensionStreamFormats;
  BOOL v11;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v4 = (objc_class *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __47__CMContinuityCaptureVideoStream_setupStreams___block_invoke;
  v14[3] = &unk_24F06B4B0;
  v14[4] = self;
  v8 = v6;
  v15 = v8;
  v9 = v7;
  v16 = v9;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v14);

  objc_storeStrong((id *)&self->_extensionStreamFormats, v6);
  objc_storeStrong((id *)&self->_continuityStreamFormats, v7);
  self->_activeFormatIndex = 0;
  extensionStreamFormats = self->_extensionStreamFormats;
  if (extensionStreamFormats && -[NSArray count](extensionStreamFormats, "count"))
  {
    v11 = 1;
  }
  else
  {
    CMContinuityCaptureLog(2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureVideoStream setupStreams:].cold.1();

    v11 = 0;
  }

  return v11;
}

void __47__CMContinuityCaptureVideoStream_setupStreams___block_invoke(id *a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(a1[4], "createFormatToPublish:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1[5], "addObject:", v3);
    objc_msgSend(a1[6], "addObject:", v4);
  }

}

- (id)createFormatToPublish:(id)a3
{
  id v3;
  CMTimeValue value;
  CMTimeEpoch epoch;
  uint64_t v6;
  CMTimeValue v7;
  CMTimeEpoch v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _QWORD v13[3];
  CMTime v14;

  v3 = a3;
  CMTimeMake(&v14, 1, objc_msgSend(v3, "maxFrameRate"));
  value = v14.value;
  epoch = v14.epoch;
  v6 = *(_QWORD *)&v14.timescale;
  CMTimeMake(&v14, 1, objc_msgSend(v3, "minFrameRate"));
  v7 = v14.value;
  v8 = v14.epoch;
  v9 = *(_QWORD *)&v14.timescale;
  v10 = objc_alloc(MEMORY[0x24BDC1390]);
  v11 = objc_msgSend(v3, "formatDescription");

  v13[2] = epoch;
  v14.value = v7;
  *(_QWORD *)&v14.timescale = v9;
  v14.epoch = v8;
  v13[0] = value;
  v13[1] = v6;
  return (id)objc_msgSend(v10, "initWithFormatDescription:maxFrameDuration:minFrameDuration:validFrameDurations:", v11, &v14, v13, 0);
}

- (void)dispatchFrame:(opaqueCMSampleBuffer *)a3 entity:(int64_t)a4 completion:(id)a5
{
  int v5;
  NSObject *v8;
  void *v9;
  int v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  CMTime v16;
  CMTime v17;
  int v18;
  uint64_t v19;

  v5 = a4;
  v19 = *MEMORY[0x24BDAC8D0];
  if (CMContinityCaptureDebugLogEnabled())
  {
    CMContinuityCaptureLog(2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v17.value) = 138412802;
      *(CMTimeValue *)((char *)&v17.value + 4) = (CMTimeValue)self;
      LOWORD(v17.flags) = 2112;
      *(_QWORD *)((char *)&v17.flags + 2) = a3;
      HIWORD(v17.epoch) = 1024;
      v18 = v5;
      _os_log_debug_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEBUG, "%@ dispatchFrame %@ entity %u", (uint8_t *)&v17, 0x1Cu);
    }

  }
  memset(&v17, 170, sizeof(v17));
  CMSampleBufferGetPresentationTimeStamp(&v17, a3);
  CMGetAttachment(a3, CFSTR("ContinuityCaptureTimeDiscontinuity"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");
  CMRemoveAttachment(a3, CFSTR("ContinuityCaptureTimeDiscontinuity"));
  v11 = (const __CFString *)*MEMORY[0x24BE10868];
  CMGetAttachment(a3, (CFStringRef)*MEMORY[0x24BE10868], 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CMSetAttachment(a3, v11, v14, 1u);

  }
  if (v10)
    v15 = 3;
  else
    v15 = 0;
  v16 = v17;
  -[CMIOExtensionStream sendSampleBuffer:discontinuity:hostTimeInNanoseconds:](self, "sendSampleBuffer:discontinuity:hostTimeInNanoseconds:", a3, v15, (unint64_t)(CMTimeGetSeconds(&v16) * 1000000000.0));

}

- (NSSet)availableProperties
{
  NSObject *queue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__CMContinuityCaptureVideoStream_availableProperties__block_invoke;
  v6[3] = &unk_24F06B238;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_async_and_wait(queue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

void __53__CMContinuityCaptureVideoStream_availableProperties__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_availableProperties");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_availableProperties
{
  id v3;
  void *v4;
  NSObject *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v3, "addObject:", *MEMORY[0x24BDC1350]);
  -[NSMutableDictionary allKeys](self->_cmControlByName, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  if (objc_msgSend(v3, "containsObject:", CFSTR("ActiveFormat")))
    objc_msgSend(v3, "removeObject:", CFSTR("ActiveFormat"));
  if (CMContinityCaptureDebugLogEnabled())
  {
    CMContinuityCaptureLog(2);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[CMContinuityCaptureVideoStream _availableProperties].cold.1();

  }
  return v3;
}

- (id)streamPropertiesForProperties:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *queue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  v26 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__2;
  v19 = __Block_byref_object_dispose__2;
  v20 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __70__CMContinuityCaptureVideoStream_streamPropertiesForProperties_error___block_invoke;
  v11[3] = &unk_24F06B4D8;
  v13 = &v21;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v14 = &v15;
  dispatch_async_and_wait(queue, v11);

  if (a4)
    *a4 = objc_retainAutorelease((id)v16[5]);
  v9 = (id)v22[5];
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v9;
}

void __70__CMContinuityCaptureVideoStream_streamPropertiesForProperties_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "_streamPropertiesForProperties:error:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)_streamPropertiesForProperties:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CFDictionaryRef v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  CMTimeValue value;
  CMTimeEpoch epoch;
  uint64_t v17;
  CFDictionaryRef v18;
  uint64_t v19;
  void *v20;
  void *v21;
  CMTimeValue v22;
  CMTimeEpoch v23;
  uint64_t v24;
  CFDictionaryRef v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  char v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  id v43;
  CFDictionaryRef v45;
  void *v46;
  CFDictionaryRef v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  CMTime time;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDC1398], "streamPropertiesWithDictionary:", MEMORY[0x24BDBD1B8]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  if (!v4 || !v5)
    goto LABEL_46;
  if (objc_msgSend(v4, "containsObject:", *MEMORY[0x24BDC1350]))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_activeFormatIndex);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setActiveFormatIndex:", v11);

  }
  v12 = *MEMORY[0x24BDC1358];
  if (objc_msgSend(v4, "containsObject:", *MEMORY[0x24BDC1358]))
  {
    -[CMContinuityCaptureVideoStream device](self, "device");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "activeConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeMake(&time, 1, objc_msgSend(v14, "maxFrameRate"));
    value = time.value;
    epoch = time.epoch;
    v17 = *(_QWORD *)&time.timescale;

    time.value = value;
    *(_QWORD *)&time.timescale = v17;
    time.epoch = epoch;
    v18 = CMTimeCopyAsDictionary(&time, 0);
    if (v18)
      objc_msgSend(v6, "setFrameDuration:", v18);
  }
  else
  {
    v18 = 0;
  }
  v19 = *MEMORY[0x24BDC1360];
  v50 = *MEMORY[0x24BDC1360];
  v49 = v6;
  v47 = v18;
  if (objc_msgSend(v4, "containsObject:", *MEMORY[0x24BDC1360]))
  {
    -[CMContinuityCaptureVideoStream device](self, "device");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activeConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeMake(&time, 1, objc_msgSend(v21, "minFrameRate"));
    v22 = time.value;
    v23 = time.epoch;
    v24 = *(_QWORD *)&time.timescale;

    time.value = v22;
    *(_QWORD *)&time.timescale = v24;
    time.epoch = v23;
    v25 = CMTimeCopyAsDictionary(&time, 0);
    if (v25)
    {
      v45 = v25;
      objc_msgSend(v6, "setMaxFrameDuration:");
    }
    else
    {
      v45 = 0;
    }
    v19 = v50;
  }
  else
  {
    v45 = 0;
  }
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[NSMutableDictionary allKeys](self->_cmControlByName, "allKeys", v45);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (!v27)
  {
    v51 = 0;
    v9 = 0;
    goto LABEL_40;
  }
  v28 = v27;
  v51 = 0;
  v9 = 0;
  v29 = *(_QWORD *)v54;
  do
  {
    for (i = 0; i != v28; ++i)
    {
      if (*(_QWORD *)v54 != v29)
        objc_enumerationMutation(v26);
      v31 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
      if ((objc_msgSend(v31, "isEqualToString:", v12) & 1) == 0
        && (objc_msgSend(v31, "isEqualToString:", v19) & 1) == 0
        && objc_msgSend(v4, "containsObject:", v31))
      {
        v32 = v4;
        -[NSMutableDictionary objectForKeyedSubscript:](self->_cmControlByName, "objectForKeyedSubscript:", v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v33, "name");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "isEqualToString:", CFSTR("ActiveFormat"));

        if ((v35 & 1) != 0)
        {
          v9 = v33;
          v4 = v32;
LABEL_35:
          v19 = v50;
          continue;
        }
        if (v33)
        {
          if (objc_msgSend(v31, "isEqualToString:", CFSTR("4cc_cfri_glob_0000"))
            && (objc_opt_class(), (objc_opt_respondsToSelector() & 1) != 0))
          {
            objc_msgSend(MEMORY[0x24BDC1370], "propertyAttributesWithSharedStreamDefaultValue:minValue:maxValue:validValues:", 0x24F07FDC8, 0, 0, 0);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = (void *)MEMORY[0x24BDC1378];
            objc_msgSend(v33, "value");
            v48 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "propertyStateWithValue:attributes:", v48, v36);
            v38 = objc_claimAutoreleasedReturnValue();

            v39 = (void *)v48;
          }
          else
          {
            v40 = (void *)MEMORY[0x24BDC1378];
            objc_msgSend(v33, "value");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "propertyStateWithValue:attributes:", v36, 0);
            v38 = objc_claimAutoreleasedReturnValue();
            v39 = v51;
          }

          v41 = (void *)v38;
          v4 = v32;
          if (v41)
          {
LABEL_31:
            v51 = v41;
            objc_msgSend(v49, "setPropertyState:forProperty:", v41, v31);
LABEL_34:
            v9 = v33;
            goto LABEL_35;
          }
        }
        else
        {
          v4 = v32;
          v41 = v51;
          if (v51)
            goto LABEL_31;
        }
        v51 = 0;
        goto LABEL_34;
      }
    }
    v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  }
  while (v28);
LABEL_40:

  if (CMContinityCaptureDebugLogEnabled())
  {
    CMContinuityCaptureLog(2);
    v42 = objc_claimAutoreleasedReturnValue();
    v6 = v49;
    v7 = v46;
    v10 = v47;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      -[CMContinuityCaptureVideoStream _streamPropertiesForProperties:error:].cold.1((uint64_t)self, v49, v42);

  }
  else
  {
    v6 = v49;
    v7 = v46;
    v10 = v47;
  }
  v8 = v51;
LABEL_46:
  v43 = v6;

  return v43;
}

- (BOOL)setStreamProperties:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  char v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  -[CMContinuityCaptureVideoStream queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v7);

  -[CMContinuityCaptureVideoStream queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__CMContinuityCaptureVideoStream_setStreamProperties_error___block_invoke;
  v12[3] = &unk_24F06B4D8;
  v14 = &v16;
  v12[4] = self;
  v9 = v6;
  v13 = v9;
  v15 = &v20;
  dispatch_async_and_wait(v8, v12);

  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v10 = *((_BYTE *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v10;
}

void __60__CMContinuityCaptureVideoStream_setStreamProperties_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(v2, "_setStreamProperties:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;
}

- (BOOL)_setStreamProperties:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  char isKindOfClass;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  NSObject *v32;
  int v33;
  NSObject *v34;
  const char *v35;
  int v36;
  NSObject *v37;
  NSObject *v38;
  const char *v39;
  int v40;
  int v41;
  NSObject *v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  unint64_t v57;
  id *p_isa;
  unint64_t v59;
  NSObject *v60;
  void *v61;
  int v62;
  unint64_t activeFormatIndex;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  const __CFDictionary *v72;
  uint64_t v73;
  int v74;
  void *v75;
  double v76;
  void *v77;
  void *v78;
  const __CFDictionary *v79;
  uint64_t v80;
  int v81;
  void *v82;
  double v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  __int128 v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  int v117;
  NSObject *v118;
  int v119;
  CMContinuityCaptureVideoStream *v120;
  void *v121;
  void *v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  _BYTE buf[12];
  __int16 v128;
  _BYTE v129[18];
  __int16 v130;
  int v131;
  _BYTE v132[128];
  uint64_t v133;

  v133 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[CMContinuityCaptureVideoStream device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v51 = 0;
    v52 = 0;
    v8 = 0;
    goto LABEL_97;
  }
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8 = v5 != 0;
  if (!v5)
  {
    v51 = 0;
    v52 = 0;
    v53 = 0;
    goto LABEL_96;
  }
  v114 = v6;
  objc_msgSend(v5, "propertiesDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CMContinuityCaptureLog(2);
  v10 = objc_claimAutoreleasedReturnValue();
  v115 = v9;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "propertiesDictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = self;
    v128 = 2112;
    *(_QWORD *)v129 = v11;
    *(_WORD *)&v129[8] = 2112;
    *(_QWORD *)&v129[10] = v5;
    _os_log_impl(&dword_227C5D000, v10, OS_LOG_TYPE_DEFAULT, "%@ SetProperties %@ %@", buf, 0x20u);

    v9 = v115;
  }
  v112 = v5;
  v113 = v7;

  v125 = 0u;
  v126 = 0u;
  v123 = 0u;
  v124 = 0u;
  v120 = self;
  -[NSMutableDictionary allKeys](self->_cmControlByName, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v123, v132, 16);
  if (!v13)
  {
    v116 = 0;
    v16 = 0;
    goto LABEL_57;
  }
  v15 = v13;
  v116 = 0;
  v16 = 0;
  v17 = *(_QWORD *)v124;
  v18 = *MEMORY[0x24BDC1358];
  v19 = *MEMORY[0x24BDC1360];
  *(_QWORD *)&v14 = 138413058;
  v110 = v14;
  do
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v124 != v17)
        objc_enumerationMutation(v12);
      v21 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * i);
      if ((objc_msgSend(v21, "isEqualToString:", v18, v110) & 1) != 0)
        continue;
      if ((objc_msgSend(v21, "isEqualToString:", v19) & 1) != 0)
        continue;
      if ((objc_msgSend(v21, "isEqualToString:", CFSTR("PortraitEffectAperture")) & 1) != 0)
        continue;
      if ((objc_msgSend(v21, "isEqualToString:", CFSTR("StudioLightingIntensity")) & 1) != 0)
        continue;
      if ((objc_msgSend(v21, "isEqualToString:", CFSTR("GesturesEnabled")) & 1) != 0)
        continue;
      if ((objc_msgSend(v21, "isEqualToString:", CFSTR("BackgroundReplacementPixelBuffer")) & 1) != 0)
        continue;
      objc_msgSend(v9, "objectForKey:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v22)
        continue;
      -[NSMutableDictionary objectForKeyedSubscript:](v120->_cmControlByName, "objectForKeyedSubscript:", v21);
      v121 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "objectForKeyedSubscript:", v21);
      v122 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v121, "value");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      v25 = v121;
      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v122, "value");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v117 = objc_msgSend(v26, "BOOLValue");

        objc_msgSend(v112, "client");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKeyedSubscript:](v120->_clientsRequestingBooleanControlOnByControlName, "objectForKeyedSubscript:", v21);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v28 || !v27)
          goto LABEL_41;
        -[NSMutableDictionary objectForKeyedSubscript:](v120->_clientsRequestingBooleanControlOnByControlName, "objectForKeyedSubscript:", v21);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "containsObject:", v27);
        v31 = v27;
        v111 = v27;
        if (v117)
        {
          if ((v30 & 1) != 0)
          {
            CMContinuityCaptureLog(2);
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              v33 = objc_msgSend(v29, "count");
              *(_DWORD *)buf = v110;
              *(_QWORD *)&buf[4] = v120;
              v128 = 2112;
              *(_QWORD *)v129 = v31;
              *(_WORD *)&v129[8] = 2112;
              *(_QWORD *)&v129[10] = v21;
              v130 = 1024;
              v131 = v33;
              v34 = v32;
              v35 = "%@ Client %@ already wants %@ on. %d total clients.";
              goto LABEL_29;
            }
          }
          else
          {
            objc_msgSend(v29, "addObject:", v27);
            CMContinuityCaptureLog(2);
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              v40 = objc_msgSend(v29, "count");
              *(_DWORD *)buf = v110;
              *(_QWORD *)&buf[4] = v120;
              v128 = 2112;
              *(_QWORD *)v129 = v31;
              *(_WORD *)&v129[8] = 2112;
              *(_QWORD *)&v129[10] = v21;
              v130 = 1024;
              v131 = v40;
              v34 = v32;
              v35 = "%@ Client %@ wants %@ on. %d total clients.";
LABEL_29:
              _os_log_impl(&dword_227C5D000, v34, OS_LOG_TYPE_INFO, v35, buf, 0x26u);
            }
          }

LABEL_40:
          v27 = v111;
LABEL_41:

          v25 = v121;
          goto LABEL_42;
        }
        if (v30)
        {
          objc_msgSend(v29, "removeObject:", v27);
          CMContinuityCaptureLog(2);
          v118 = objc_claimAutoreleasedReturnValue();
          v9 = v115;
          if (os_log_type_enabled(v118, OS_LOG_TYPE_INFO))
          {
            v36 = objc_msgSend(v29, "count");
            *(_DWORD *)buf = v110;
            *(_QWORD *)&buf[4] = v120;
            v128 = 2112;
            *(_QWORD *)v129 = v27;
            *(_WORD *)&v129[8] = 2112;
            *(_QWORD *)&v129[10] = v21;
            v130 = 1024;
            v131 = v36;
            v37 = v118;
            v38 = v118;
            v39 = "%@ Client %@ no longer wants %@ on. %d total clients.";
            goto LABEL_33;
          }
          v37 = v118;
        }
        else
        {
          CMContinuityCaptureLog(2);
          v37 = objc_claimAutoreleasedReturnValue();
          v9 = v115;
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            v41 = objc_msgSend(v29, "count");
            *(_DWORD *)buf = v110;
            *(_QWORD *)&buf[4] = v120;
            v128 = 2112;
            *(_QWORD *)v129 = v111;
            *(_WORD *)&v129[8] = 2112;
            *(_QWORD *)&v129[10] = v21;
            v130 = 1024;
            v131 = v41;
            v38 = v37;
            v39 = "%@ Client %@ doesn't want %@ on. %d total clients.";
LABEL_33:
            _os_log_impl(&dword_227C5D000, v38, OS_LOG_TYPE_INFO, v39, buf, 0x26u);
          }
        }

        if (objc_msgSend(v29, "count"))
        {
          CMContinuityCaptureLog(2);
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            v43 = objc_msgSend(v29, "count");
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v120;
            v128 = 1024;
            *(_DWORD *)v129 = v43;
            *(_WORD *)&v129[4] = 2112;
            *(_QWORD *)&v129[6] = v21;
            _os_log_impl(&dword_227C5D000, v42, OS_LOG_TYPE_INFO, "%@ There are still %d clients that want %@ on. Ignoring call to turn off.", buf, 0x1Cu);
          }

          v16 = v122;
          v116 = v121;
          continue;
        }
        goto LABEL_40;
      }
LABEL_42:
      objc_msgSend(v21, "isEqualToString:", CFSTR("AsyncStillCaptureConfigurations"));
      v44 = v25;
      objc_msgSend(v25, "value");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v44, "value");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v122, "value");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = objc_msgSend(v46, "isEqualToNumber:", v47);

        if (v119)
        {
          CMContinuityCaptureLog(2);
          v48 = objc_claimAutoreleasedReturnValue();
          v9 = v115;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v120;
            v128 = 2080;
            *(_QWORD *)v129 = "-[CMContinuityCaptureVideoStream _setStreamProperties:error:]";
            *(_WORD *)&v129[8] = 2112;
            *(_QWORD *)&v129[10] = v121;
            _os_log_impl(&dword_227C5D000, v48, OS_LOG_TYPE_INFO, "%@ %s Skip setting value for %@ as it's not updated", buf, 0x20u);
          }

          v116 = v121;
          v16 = v122;
          continue;
        }
      }
      else
      {

      }
      objc_msgSend(v122, "value");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "setValue:", v49);

      objc_msgSend(v113, "setObject:forKeyedSubscript:", v122, v21);
      CMContinuityCaptureLog(2);
      v50 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v120;
        v128 = 2112;
        *(_QWORD *)v129 = v121;
        _os_log_impl(&dword_227C5D000, v50, OS_LOG_TYPE_DEFAULT, "%@ Set Control %@", buf, 0x16u);
      }

      objc_msgSend(v114, "setValueForControl:completion:", v121, 0);
      v116 = v121;
      v16 = v122;
      v9 = v115;
    }
    v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v123, v132, 16);
  }
  while (v15);
LABEL_57:

  v5 = v112;
  objc_msgSend(v112, "activeFormatIndex");
  v54 = objc_claimAutoreleasedReturnValue();
  if (!v54)
  {
    v7 = v113;
    v6 = v114;
    p_isa = (id *)&v120->super.super.isa;
    goto LABEL_63;
  }
  v55 = (void *)v54;
  objc_msgSend(v112, "activeFormatIndex");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(v56, "unsignedIntegerValue");
  p_isa = (id *)&v120->super.super.isa;
  v59 = -[NSArray count](v120->_continuityStreamFormats, "count");

  v7 = v113;
  v6 = v114;
  if (v57 >= v59)
  {
LABEL_63:
    v52 = v16;
    goto LABEL_64;
  }
  CMContinuityCaptureLog(2);
  v60 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v112, "activeFormatIndex");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "unsignedIntegerValue");
    activeFormatIndex = v120->_activeFormatIndex;
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v120;
    v128 = 1024;
    *(_DWORD *)v129 = v62;
    *(_WORD *)&v129[4] = 1024;
    *(_DWORD *)&v129[6] = activeFormatIndex;
    _os_log_impl(&dword_227C5D000, v60, OS_LOG_TYPE_DEFAULT, " %@ set active format to %d from %d ", buf, 0x18u);

  }
  objc_msgSend(v112, "activeFormatIndex");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v120->_activeFormatIndex = objc_msgSend(v64, "unsignedIntegerValue");

  v65 = (void *)MEMORY[0x24BDC1378];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v120->_activeFormatIndex);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "propertyStateWithValue:", v66);
  v67 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v113, "setObject:forKeyedSubscript:", v67, *MEMORY[0x24BDC1350]);
  -[NSArray objectAtIndexedSubscript:](v120->_continuityStreamFormats, "objectAtIndexedSubscript:", v120->_activeFormatIndex);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v120->_cmControlByName, "objectForKeyedSubscript:", CFSTR("ActiveFormat"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setValue:", v68);

  -[NSMutableDictionary objectForKeyedSubscript:](v120->_cmControlByName, "objectForKeyedSubscript:", CFSTR("ActiveFormat"));
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "setValueForControl:completion:", v70, 0);

  v52 = (void *)v67;
LABEL_64:
  objc_msgSend(v112, "frameDuration");
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = v116;
  if (v71)
  {
    objc_msgSend(v112, "frameDuration");
    v72 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeMakeFromDictionary((CMTime *)buf, v72);
    v73 = *(_QWORD *)buf;
    v74 = *(_DWORD *)&buf[8];

    if (v73 >= 1)
    {
      objc_msgSend(p_isa[28], "objectForKeyedSubscript:", CFSTR("CMIOExtensionPropertyStreamFrameDuration"));
      v75 = (void *)objc_claimAutoreleasedReturnValue();

      if (v75)
      {
        *(float *)&v76 = (float)v74 / (float)v73;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "setValue:", v77);

        objc_msgSend(v6, "setValueForControl:completion:", v75, 0);
        v51 = v75;
      }
      else
      {
        v51 = 0;
      }
    }
  }
  objc_msgSend(v112, "maxFrameDuration");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78)
  {
    objc_msgSend(v112, "maxFrameDuration");
    v79 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeMakeFromDictionary((CMTime *)buf, v79);
    v80 = *(_QWORD *)buf;
    v81 = *(_DWORD *)&buf[8];

    if (v80 >= 1)
    {
      objc_msgSend(p_isa[28], "objectForKeyedSubscript:", CFSTR("CMIOExtensionPropertyStreamMaxFrameDuration"));
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      if (v82)
      {
        *(float *)&v83 = (float)v81 / (float)v80;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v83);
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "setValue:", v84);

        objc_msgSend(v6, "setValueForControl:completion:", v82, 0);
        v51 = v82;
      }
      else
      {
        v51 = 0;
      }
    }
  }
  objc_msgSend(v115, "objectForKeyedSubscript:", CFSTR("PortraitEffectAperture"));
  v85 = (void *)objc_claimAutoreleasedReturnValue();

  if (v85)
  {
    objc_msgSend(p_isa[28], "objectForKeyedSubscript:", CFSTR("PortraitEffectAperture"));
    v86 = (void *)objc_claimAutoreleasedReturnValue();

    if (v86)
    {
      v87 = v115;
      objc_msgSend(v115, "objectForKeyedSubscript:", CFSTR("PortraitEffectAperture"));
      v88 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v88, "value");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v89, "floatValue");
      objc_msgSend(v90, "numberWithFloat:");
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "setValue:", v91);

      objc_msgSend(v6, "setValueForControl:completion:", v86, 0);
      v51 = v86;
      v52 = v88;
      goto LABEL_79;
    }
    v51 = 0;
  }
  v87 = v115;
LABEL_79:
  objc_msgSend(v87, "objectForKeyedSubscript:", CFSTR("StudioLightingIntensity"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();

  if (v92)
  {
    objc_msgSend(p_isa[28], "objectForKeyedSubscript:", CFSTR("StudioLightingIntensity"));
    v93 = (void *)objc_claimAutoreleasedReturnValue();

    if (v93)
    {
      v94 = v115;
      objc_msgSend(v115, "objectForKeyedSubscript:", CFSTR("StudioLightingIntensity"));
      v95 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v95, "value");
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v96, "floatValue");
      objc_msgSend(v97, "numberWithFloat:");
      v98 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "setValue:", v98);

      objc_msgSend(v6, "setValueForControl:completion:", v93, 0);
      v51 = v93;
      v52 = v95;
      goto LABEL_84;
    }
    v51 = 0;
  }
  v94 = v115;
LABEL_84:
  objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("GesturesEnabled"));
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  if (v99)
  {
    objc_msgSend(p_isa[28], "objectForKeyedSubscript:", CFSTR("GesturesEnabled"));
    v100 = (void *)objc_claimAutoreleasedReturnValue();

    if (v100)
    {
      v101 = v115;
      objc_msgSend(v115, "objectForKeyedSubscript:", CFSTR("GesturesEnabled"));
      v102 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v102, "value");
      v103 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v103, "BOOLValue"));
      v104 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v100, "setValue:", v104);

      objc_msgSend(v6, "setValueForControl:completion:", v100, 0);
      v51 = v100;
      v52 = v102;
      goto LABEL_89;
    }
    v51 = 0;
  }
  v101 = v115;
LABEL_89:
  objc_msgSend(v101, "objectForKeyedSubscript:", CFSTR("BackgroundReplacementPixelBuffer"));
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  if (v105)
  {
    objc_msgSend(p_isa[28], "objectForKeyedSubscript:", CFSTR("BackgroundReplacementPixelBuffer"));
    v106 = (void *)objc_claimAutoreleasedReturnValue();

    if (v106)
    {
      objc_msgSend(v115, "objectForKeyedSubscript:", CFSTR("BackgroundReplacementPixelBuffer"));
      v107 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v107, "value");
      v108 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v106, "setValue:", v108);

      objc_msgSend(v6, "setValueForControl:completion:", v106, 0);
      v51 = v106;
      v52 = v107;
    }
    else
    {
      v51 = 0;
    }
  }
  v8 = 1;
  if (objc_msgSend(v7, "count"))
    objc_msgSend(p_isa, "notifyPropertiesChanged:", v7);
  v53 = v115;
LABEL_96:

LABEL_97:
  return v8;
}

- (void)setValueForControl:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __64__CMContinuityCaptureVideoStream_setValueForControl_completion___block_invoke;
  v11[3] = &unk_24F06B2D0;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __64__CMContinuityCaptureVideoStream_setValueForControl_completion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_setValueForControl:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

- (void)_setValueForControl:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  NSMutableDictionary *cmControlByName;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  char isKindOfClass;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  CMTime v50;
  void *v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  cmControlByName = self->_cmControlByName;
  objc_msgSend(v5, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](cmControlByName, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_37;
  v10 = self->_cmControlByName;
  objc_msgSend(v5, "name");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("CMIOExtensionPropertyStreamFrameDuration"));

  if (v13)
  {
    objc_msgSend(v5, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:", v14);

    CMContinuityCaptureLog(2);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    goto LABEL_8;
  }
  objc_msgSend(v5, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("CMIOExtensionPropertyStreamMaxFrameDuration"));

  if (v17)
  {
    objc_msgSend(v5, "value");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setValue:", v18);

    CMContinuityCaptureLog(2);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
LABEL_7:
      LODWORD(v50.value) = 138412802;
      *(CMTimeValue *)((char *)&v50.value + 4) = (CMTimeValue)self;
      LOWORD(v50.flags) = 2080;
      *(_QWORD *)((char *)&v50.flags + 2) = "-[CMContinuityCaptureVideoStream _setValueForControl:completion:]";
      HIWORD(v50.epoch) = 2112;
      v51 = v9;
      _os_log_impl(&dword_227C5D000, v15, OS_LOG_TYPE_DEFAULT, "%@ %s Update control %@", (uint8_t *)&v50, 0x20u);
    }
LABEL_8:

    objc_msgSend(v9, "value");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeMake(&v50, 1, objc_msgSend(v19, "unsignedIntValue"));
    v20 = CMTimeCopyAsDictionary(&v50, 0);
    if (v20)
    {
      objc_msgSend(MEMORY[0x24BDC1378], "propertyStateWithValue:attributes:", v20, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        objc_msgSend(v5, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, v22);

      }
    }
    else
    {
      v21 = 0;
    }

    goto LABEL_13;
  }
  objc_msgSend(v5, "name");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v23, "isEqualToString:", CFSTR("4cc_cfri_glob_0000"))
    || (objc_msgSend(v5, "value"), (v24 = objc_claimAutoreleasedReturnValue()) == 0))
  {

    goto LABEL_24;
  }
  v25 = (void *)v24;
  objc_msgSend(v5, "value");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_24:
    objc_msgSend(v5, "name");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "isEqualToString:", CFSTR("ReactionsInProgress"))
      && (objc_msgSend(v5, "value"), (v34 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v35 = (void *)v34;
      objc_msgSend(v5, "value");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v37 = objc_opt_isKindOfClass();

      if ((v37 & 1) != 0)
      {
        objc_msgSend(v9, "value");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "value");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v38, "isEqualToArray:", v39);

        if (!v40)
        {
          objc_msgSend(v5, "value");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setValue:", v41);

          CMContinuityCaptureLog(2);
          v32 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            goto LABEL_35;
          goto LABEL_34;
        }
        CMContinuityCaptureLog(2);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v50.value) = 138412290;
          *(CMTimeValue *)((char *)&v50.value + 4) = (CMTimeValue)self;
          goto LABEL_44;
        }
        goto LABEL_45;
      }
    }
    else
    {

    }
    objc_msgSend(v9, "value");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v43 = objc_opt_isKindOfClass();

    if ((v43 & 1) != 0)
    {
      objc_msgSend(v9, "value");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "value");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v44, "isEqualToNumber:", v45);

      if (!v46)
      {
        objc_msgSend(v5, "value");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setValue:", v47);

        CMContinuityCaptureLog(2);
        v32 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          goto LABEL_35;
        goto LABEL_34;
      }
      CMContinuityCaptureLog(2);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v50.value) = 138412290;
        *(CMTimeValue *)((char *)&v50.value + 4) = (CMTimeValue)self;
LABEL_44:
        _os_log_impl(&dword_227C5D000, v20, OS_LOG_TYPE_DEFAULT, "%@ control's value didn't change. Do not notify about properties change.", (uint8_t *)&v50, 0xCu);
      }
LABEL_45:
      v21 = 0;
      goto LABEL_13;
    }
LABEL_37:
    v21 = 0;
    goto LABEL_14;
  }
  objc_msgSend(v9, "value");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "value");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v28, "isEqualToDictionary:", v29);

  if (v30)
  {
    CMContinuityCaptureLog(2);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(v50.value) = 138412290;
      *(CMTimeValue *)((char *)&v50.value + 4) = (CMTimeValue)self;
      goto LABEL_44;
    }
    goto LABEL_45;
  }
  objc_msgSend(v5, "value");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:", v31);

  CMContinuityCaptureLog(2);
  v32 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    goto LABEL_35;
LABEL_34:
  LODWORD(v50.value) = 138412802;
  *(CMTimeValue *)((char *)&v50.value + 4) = (CMTimeValue)self;
  LOWORD(v50.flags) = 2080;
  *(_QWORD *)((char *)&v50.flags + 2) = "-[CMContinuityCaptureVideoStream _setValueForControl:completion:]";
  HIWORD(v50.epoch) = 2112;
  v51 = v9;
  _os_log_impl(&dword_227C5D000, v32, OS_LOG_TYPE_DEFAULT, "%@ %s Update control %@", (uint8_t *)&v50, 0x20u);
LABEL_35:

  v48 = (void *)MEMORY[0x24BDC1378];
  objc_msgSend(v5, "value");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "propertyStateWithValue:attributes:", v49, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v5, "name");
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, v20);
LABEL_13:

  }
LABEL_14:
  if (objc_msgSend(v6, "count", v50.value, *(_OWORD *)&v50.timescale, v51))
    -[CMIOExtensionStream notifyPropertiesChanged:](self, "notifyPropertiesChanged:", v6);

}

- (id)_getResolvedStillCaptureConfigs:(id)a3
{
  NSObject *queue;
  id v4;
  void *v5;

  queue = self->_queue;
  v4 = a3;
  dispatch_assert_queue_V2(queue);
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  return v5;
}

- (BOOL)authorizedToStartStreamForClient:(id)a3
{
  return 1;
}

- (BOOL)startStreamAndReturnError:(id *)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  _BYTE buf[12];
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    v11 = 2080;
    v12 = "-[CMContinuityCaptureVideoStream startStreamAndReturnError:]";
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  -[CMContinuityCaptureVideoStream device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __60__CMContinuityCaptureVideoStream_startStreamAndReturnError___block_invoke;
    v8[3] = &unk_24F06AE60;
    objc_copyWeak(&v9, (id *)buf);
    objc_msgSend(v6, "startStreamForDevice:startCompletion:startSkippedCompletion:", v5, v8, 0);

    objc_destroyWeak(&v9);
  }

  objc_destroyWeak((id *)buf);
  return 1;
}

void __60__CMContinuityCaptureVideoStream_startStreamAndReturnError___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_startStreamAndReturnError:", 0);
    WeakRetained = v2;
  }

}

- (BOOL)_startStreamAndReturnError:(id *)a3
{
  NSObject *v4;
  NSObject *queue;
  _QWORD v7[4];
  id v8;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureVideoStream *v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  CMContinuityCaptureLog(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v11 = self;
    v12 = 2080;
    v13 = "-[CMContinuityCaptureVideoStream _startStreamAndReturnError:]";
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__CMContinuityCaptureVideoStream__startStreamAndReturnError___block_invoke;
  v7[3] = &unk_24F06AE60;
  objc_copyWeak(&v8, &location);
  dispatch_async(queue, v7);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return 1;
}

void __61__CMContinuityCaptureVideoStream__startStreamAndReturnError___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "compositeDelegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __61__CMContinuityCaptureVideoStream__startStreamAndReturnError___block_invoke_2;
      v7[3] = &unk_24F06B500;
      objc_copyWeak(&v9, v1);
      v8 = v5;
      objc_msgSend(v6, "registerStreamIntentForCaptureDevice:completion:", v8, v7);

      objc_destroyWeak(&v9);
    }

  }
}

void __61__CMContinuityCaptureVideoStream__startStreamAndReturnError___block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v4;
  id WeakRetained;
  __CFString **v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v9 = 138543618;
    v10 = WeakRetained;
    v11 = 2112;
    v12 = a2;
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ completed registerStreamIntentForCaptureDevice error %@", (uint8_t *)&v9, 0x16u);

  }
  if (a2 && objc_msgSend(a2, "code"))
  {
    if (objc_msgSend(a2, "code") == -1005)
    {
      v6 = kCMContinuityCaptureEventStreamDisableForMultipleStream;
LABEL_9:
      objc_msgSend(*(id *)(a1 + 32), "compositeDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "postEvent:entity:data:", *v6, objc_msgSend(*(id *)(a1 + 32), "entity"), 0);

      goto LABEL_10;
    }
    if (objc_msgSend(a2, "code") == -1006)
    {
      v6 = kCMContinuityCaptureEventStreamDisableForWifiContention;
      goto LABEL_9;
    }
  }
LABEL_10:
  objc_msgSend(*(id *)(a1 + 32), "compositeDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventStartStream"), objc_msgSend(*(id *)(a1 + 32), "entity"), 0);

}

- (BOOL)stopStreamAndReturnError:(id *)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  _BYTE buf[12];
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    v17 = 2080;
    v18 = "-[CMContinuityCaptureVideoStream stopStreamAndReturnError:]";
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  -[CMContinuityCaptureVideoStream device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "compositeDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventRemoteClientReconnect"), objc_msgSend(v6, "entity"), 0);

    +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unscheduleNotification:", 4);

    +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unscheduleNotification:", 5);

    +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unscheduleNotification:", 13);

    +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "unscheduleNotification:", 14);

    +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __59__CMContinuityCaptureVideoStream_stopStreamAndReturnError___block_invoke;
    v14[3] = &unk_24F06AE60;
    objc_copyWeak(&v15, (id *)buf);
    objc_msgSend(v12, "stopStreamForDevice:option:completion:", v6, 0, v14);

    objc_destroyWeak(&v15);
  }

  objc_destroyWeak((id *)buf);
  return 1;
}

void __59__CMContinuityCaptureVideoStream_stopStreamAndReturnError___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_stopStreamAndReturnError:", 0);
    WeakRetained = v2;
  }

}

- (BOOL)_stopStreamAndReturnError:(id *)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *queue;
  _QWORD v10[4];
  id v11;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureVideoStream *v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  CMContinuityCaptureLog(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v14 = self;
    v15 = 2080;
    v16 = "-[CMContinuityCaptureVideoStream _stopStreamAndReturnError:]";
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  -[CMContinuityCaptureVideoStream device](self, "device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "compositeDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureVideoStream device](self, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterStreamIntentForCaptureDevice:", v7);

  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__CMContinuityCaptureVideoStream__stopStreamAndReturnError___block_invoke;
  v10[3] = &unk_24F06AE60;
  objc_copyWeak(&v11, &location);
  dispatch_async(queue, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return 1;
}

void __60__CMContinuityCaptureVideoStream__stopStreamAndReturnError___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "device");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      objc_msgSend(v2, "compositeDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventStopStream"), objc_msgSend(v3, "entity"), 0);

    }
    WeakRetained = v5;
  }

}

- (void)captureAsyncStillImage:(int64_t)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16[2];
  id location;

  v8 = a4;
  v9 = a5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureVideoStream queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__CMContinuityCaptureVideoStream_captureAsyncStillImage_options_completionHandler___block_invoke;
  block[3] = &unk_24F06B068;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a3;
  v14 = v8;
  v15 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, block);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __83__CMContinuityCaptureVideoStream_captureAsyncStillImage_options_completionHandler___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  CMContinuityCaptureStillImageRequest *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = objc_alloc_init(CMContinuityCaptureStillImageRequest);
    -[CMContinuityCaptureStillImageRequest setUniqueID:](v3, "setUniqueID:", *(_QWORD *)(a1 + 56));
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("CompressedFormat"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureStillImageRequest setCompressedFormat:](v3, "setCompressedFormat:", v4);

    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("HighResolutionCapture"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureStillImageRequest setHighResolutionPhotoEnabled:](v3, "setHighResolutionPhotoEnabled:", objc_msgSend(v5, "BOOLValue"));

    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("FlashMode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureStillImageRequest setFlashMode:](v3, "setFlashMode:", objc_msgSend(v6, "intValue"));

    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("PhotoQualityPrioritization"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CMContinuityCaptureStillImageRequest setPhotoQualityPrioritization:](v3, "setPhotoQualityPrioritization:", objc_msgSend(v7, "intValue"));

    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("MaxPhotoDimensionsWidth"));
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8
      && (v9 = (void *)v8,
          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("MaxPhotoDimensionsHeight")),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          v10))
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("MaxPhotoDimensionsWidth"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "intValue");

      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("MaxPhotoDimensionsHeight"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "intValue");

      v15 = v12 | (unint64_t)(v14 << 32);
    }
    else
    {
      v15 = 0;
    }
    -[CMContinuityCaptureStillImageRequest setMaxPhotoDimensions:](v3, "setMaxPhotoDimensions:", v15);
    -[CMContinuityCaptureStillImageRequest setCompletionHandler:](v3, "setCompletionHandler:", *(_QWORD *)(a1 + 40));
    v16 = objc_loadWeakRetained(WeakRetained + 33);
    objc_msgSend(WeakRetained, "device");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "entity");
    v20 = CFSTR("ImageRequest");
    v21[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventImageCapture"), v18, v19);

  }
}

- (void)enqueueReactionEffect:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureVideoStream *v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  CMContinuityCaptureLog(2);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = self;
    v19 = 2080;
    v20 = "-[CMContinuityCaptureVideoStream enqueueReactionEffect:completionHandler:]";
    _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%@ %s", buf, 0x16u);
  }

  -[CMContinuityCaptureVideoStream queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __74__CMContinuityCaptureVideoStream_enqueueReactionEffect_completionHandler___block_invoke;
  v12[3] = &unk_24F06B2D0;
  objc_copyWeak(&v15, &location);
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __74__CMContinuityCaptureVideoStream_enqueueReactionEffect_completionHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(v3, "device");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "entity");
      v7 = *(_QWORD *)(a1 + 32);
      v10 = CFSTR("ReactionType");
      v11[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventEnqueueReactionEffect"), v6, v8);

      v9 = *(_QWORD *)(a1 + 40);
      if (v9)
        (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);
    }

  }
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMContinuityCaptureVideoStream device](self, "device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ [%p]"), v5, v6, self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)debugInfo
{
  return 0;
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 288, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
  objc_destroyWeak((id *)&self->_device);
  objc_destroyWeak((id *)&self->_compositeDevice);
  objc_storeStrong((id *)&self->_maxPhotoQualityPrioritizationByClients, 0);
  objc_storeStrong((id *)&self->_clientsRequestingBooleanControlOnByControlName, 0);
  objc_storeStrong((id *)&self->_cmControlByName, 0);
  objc_storeStrong((id *)&self->_continuityStreamFormats, 0);
  objc_storeStrong((id *)&self->_extensionStreamFormats, 0);
}

- (void)initWithDevice:streamFormats:deviceID:queue:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_227C5D000, v0, v1, " %@ Invalid queue", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithDevice:streamFormats:deviceID:queue:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_227C5D000, v0, v1, " %@ Failed to setup streams", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)setupStreams:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_227C5D000, v0, v1, "%@ Invalid stream formats", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_availableProperties
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_3(&dword_227C5D000, v1, (uint64_t)v1, "%@ AvailableProperties %@", v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)_streamPropertiesForProperties:(NSObject *)a3 error:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "propertiesDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_3(&dword_227C5D000, a3, v6, "%@ GetProperties %@", (uint8_t *)&v7);

}

@end
