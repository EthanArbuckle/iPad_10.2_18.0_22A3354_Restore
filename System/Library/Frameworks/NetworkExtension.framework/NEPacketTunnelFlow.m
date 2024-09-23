@implementation NEPacketTunnelFlow

- (void)dealloc
{
  objc_super v3;

  -[NEPacketTunnelFlow closeVirtualInterface](self);
  v3.receiver = self;
  v3.super_class = (Class)NEPacketTunnelFlow;
  -[NEPacketTunnelFlow dealloc](&v3, sel_dealloc);
}

- (void)readPacketsWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  NEPacketTunnelFlow *v5;
  const char *v6;
  const char *v7;
  uint64_t interface;
  NEVirtualInterface_s *v9;
  NEVirtualInterface_s *v10;
  NSObject *v11;
  uint8_t v12[8];
  _QWORD v13[5];
  id v14;
  id location;

  v4 = completionHandler;
  v5 = self;
  objc_sync_enter(v5);
  if (v5)
  {
    if (!objc_getProperty(v5, v6, 96, 1))
    {
      objc_setProperty_atomic_copy(v5, v7, v4, 96);
      interface = (uint64_t)v5->_interface;
      if (interface)
      {
        if (!v5->_handlerSetup)
        {
          objc_initWeak(&location, v5);
          v9 = v5->_interface;
          if (v9)
          {
            *((_BYTE *)v9 + 73) = 0;
            v10 = v5->_interface;
          }
          else
          {
            v10 = 0;
          }
          v13[0] = MEMORY[0x1E0C809B0];
          v13[1] = 3221225472;
          v13[2] = __55__NEPacketTunnelFlow_readPacketsWithCompletionHandler___block_invoke;
          v13[3] = &unk_1E3CC2720;
          objc_copyWeak(&v14, &location);
          v13[4] = v5;
          if (NEVirtualInterfaceSetReadMultipleIPPacketsHandler(v10, v13))
          {
            v5->_handlerSetup = 1;
          }
          else
          {
            ne_log_obj();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v12 = 0;
              _os_log_error_impl(&dword_19BD16000, v11, OS_LOG_TYPE_ERROR, "Failed to set the multiple packet read handler", v12, 2u);
            }

          }
          objc_destroyWeak(&v14);
          objc_destroyWeak(&location);
          interface = (uint64_t)v5->_interface;
        }
        NEVirtualInterfaceReadyToReadMultiple(interface, 0x40u);
      }
    }
  }
  objc_sync_exit(v5);

}

- (void)readPacketObjectsWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  NEPacketTunnelFlow *v5;
  const char *v6;
  id v7;
  const char *v8;
  NEVirtualInterface_s *interface;
  NEVirtualInterface_s *v10;
  NSObject *v11;
  uint8_t v12[8];
  _QWORD v13[5];
  id v14;
  id location;

  v4 = completionHandler;
  v5 = self;
  objc_sync_enter(v5);
  if (v5)
  {
    v7 = objc_getProperty(v5, v6, 32, 1);
    if (v7)
    {

    }
    else if (v5->_interface)
    {
      objc_setProperty_atomic_copy(v5, v8, v4, 32);
      if (!v5->_handlerSetup)
      {
        objc_initWeak(&location, v5);
        interface = v5->_interface;
        if (interface)
        {
          *((_BYTE *)interface + 73) = 0;
          v10 = v5->_interface;
        }
        else
        {
          v10 = 0;
        }
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __61__NEPacketTunnelFlow_readPacketObjectsWithCompletionHandler___block_invoke;
        v13[3] = &unk_1E3CC2720;
        objc_copyWeak(&v14, &location);
        v13[4] = v5;
        if (NEVirtualInterfaceSetReadMultipleIPPacketsHandler(v10, v13))
        {
          v5->_handlerSetup = 1;
        }
        else
        {
          ne_log_obj();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v12 = 0;
            _os_log_error_impl(&dword_19BD16000, v11, OS_LOG_TYPE_ERROR, "Failed to set the multiple packet read handler", v12, 2u);
          }

        }
        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
      NEVirtualInterfaceReadyToReadMultiple((uint64_t)v5->_interface, 0x40u);
    }
  }
  objc_sync_exit(v5);

}

- (BOOL)writePackets:(NSArray *)packets withProtocols:(NSArray *)protocols
{
  NSArray *v6;
  NSArray *v7;
  NEPacketTunnelFlow *v8;
  uint64_t v9;
  unint64_t buffersSize;
  char **v11;
  unsigned int *v12;
  unint64_t *v13;
  uint64_t packetDataArray;
  unint64_t i;
  id v16;
  NSObject *v17;
  NSObject *v18;
  BOOL v19;
  NSObject *v20;
  int v22;
  const char *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = packets;
  v7 = protocols;
  v8 = self;
  objc_sync_enter(v8);
  if (!v8 || !v8->_interface)
    goto LABEL_43;
  if (v8->_interfaceType == 1)
  {
    v9 = -[NSArray count](v6, "count");
    if (v9 != -[NSArray count](v7, "count"))
    {
      ne_log_obj();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v22 = 136315650;
        v23 = "-[NEPacketTunnelFlow writePackets:withProtocols:]";
        v24 = 2048;
        v25 = -[NSArray count](v6, "count");
        v26 = 2048;
        v27 = -[NSArray count](v7, "count");
        _os_log_error_impl(&dword_19BD16000, v18, OS_LOG_TYPE_ERROR, "%s: packets count (%lu) does not equal protocols count (%lu)", (uint8_t *)&v22, 0x20u);
      }
      goto LABEL_38;
    }
  }
  buffersSize = v8->_buffersSize;
  if (buffersSize < -[NSArray count](v6, "count"))
  {
    v11 = (char **)malloc_type_realloc(v8->_packetDataArray, 8 * -[NSArray count](v6, "count"), 0x10040436913F5uLL);
    if (v11)
    {
      v8->_packetDataArray = v11;
      if (v8->_interfaceType != 1)
      {
LABEL_10:
        v13 = (unint64_t *)malloc_type_realloc(v8->_packetLengths, 8 * -[NSArray count](v6, "count"), 0x100004000313F17uLL);
        if (v13)
        {
          v8->_packetLengths = v13;
          v8->_buffersSize = -[NSArray count](v6, "count");
          goto LABEL_12;
        }
        ne_log_obj();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v22 = 136315138;
          v23 = "-[NEPacketTunnelFlow writePackets:withProtocols:]";
          _os_log_error_impl(&dword_19BD16000, v18, OS_LOG_TYPE_ERROR, "%s: Failed to allocate memory for packet lengths", (uint8_t *)&v22, 0xCu);
        }
        goto LABEL_38;
      }
      v12 = (unsigned int *)malloc_type_realloc(v8->_packetProtocols, 4 * -[NSArray count](v6, "count"), 0x100004052888210uLL);
      if (v12)
      {
        v8->_packetProtocols = v12;
        goto LABEL_10;
      }
      ne_log_obj();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v22 = 136315138;
        v23 = "-[NEPacketTunnelFlow writePackets:withProtocols:]";
        _os_log_error_impl(&dword_19BD16000, v18, OS_LOG_TYPE_ERROR, "%s: Failed to allocate memory for packet protocols", (uint8_t *)&v22, 0xCu);
      }
    }
    else
    {
      ne_log_obj();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v22 = 136315138;
        v23 = "-[NEPacketTunnelFlow writePackets:withProtocols:]";
        _os_log_error_impl(&dword_19BD16000, v18, OS_LOG_TYPE_ERROR, "%s: Failed to allocate memory for packet data pointers", (uint8_t *)&v22, 0xCu);
      }
    }
LABEL_38:

LABEL_43:
    v19 = 0;
    goto LABEL_44;
  }
LABEL_12:
  packetDataArray = (uint64_t)v8->_packetDataArray;
  if (packetDataArray && v8->_packetLengths && (v8->_interfaceType != 1 || v8->_packetProtocols))
  {
    for (i = 0; ; ++i)
    {
      if (i >= -[NSArray count](v6, "count"))
      {
        packetDataArray = (uint64_t)v8->_packetDataArray;
        goto LABEL_33;
      }
      -[NSArray objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", i);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      if ((isa_nsdata(v16) & 1) == 0)
        break;
      v16 = objc_retainAutorelease(v16);
      v8->_packetDataArray[i] = (char *)objc_msgSend(v16, "bytes");
      v8->_packetLengths[i] = objc_msgSend(v16, "length");
      if (v8->_interfaceType == 1)
      {
        -[NSArray objectAtIndexedSubscript:](v7, "objectAtIndexedSubscript:", i);
        v17 = objc_claimAutoreleasedReturnValue();
        if ((isa_nsnumber(v17) & 1) == 0)
        {
          ne_log_obj();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v22 = 136315394;
            v23 = "-[NEPacketTunnelFlow writePackets:withProtocols:]";
            v24 = 2048;
            v25 = i;
            _os_log_error_impl(&dword_19BD16000, v20, OS_LOG_TYPE_ERROR, "%s: object at index %lu of protocols array is not an NSNumber", (uint8_t *)&v22, 0x16u);
          }

          goto LABEL_42;
        }
        v8->_packetProtocols[i] = -[NSObject unsignedIntValue](v17, "unsignedIntValue");

      }
    }
    ne_log_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v22 = 136315394;
      v23 = "-[NEPacketTunnelFlow writePackets:withProtocols:]";
      v24 = 2048;
      v25 = i;
      _os_log_error_impl(&dword_19BD16000, v17, OS_LOG_TYPE_ERROR, "%s: object at index %lu of packets array is not an NSData", (uint8_t *)&v22, 0x16u);
    }
LABEL_42:

    goto LABEL_43;
  }
LABEL_33:
  v19 = NEVirtualInterfaceWriteMultipleIPPackets((uint64_t)v8->_interface, (uint64_t)v8->_packetProtocols, packetDataArray, (uint64_t)v8->_packetLengths, -[NSArray count](v6, "count")) != 0;
LABEL_44:
  objc_sync_exit(v8);

  return v19;
}

- (BOOL)writePacketObjects:(NSArray *)packets
{
  NSArray *v4;
  NEPacketTunnelFlow *v5;
  unint64_t buffersSize;
  char **v7;
  unsigned int *v8;
  unint64_t *v9;
  uint64_t packetDataArray;
  unint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  BOOL v17;
  NSObject *v18;
  int v20;
  const char *v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = packets;
  v5 = self;
  objc_sync_enter(v5);
  if (!v5 || !v5->_interface)
    goto LABEL_29;
  buffersSize = v5->_buffersSize;
  if (buffersSize < -[NSArray count](v4, "count"))
  {
    v7 = (char **)malloc_type_realloc(v5->_packetDataArray, 8 * -[NSArray count](v4, "count"), 0x10040436913F5uLL);
    if (v7)
    {
      v5->_packetDataArray = v7;
      v8 = (unsigned int *)malloc_type_realloc(v5->_packetProtocols, 4 * -[NSArray count](v4, "count"), 0x100004052888210uLL);
      if (v8)
      {
        v5->_packetProtocols = v8;
        v9 = (unint64_t *)malloc_type_realloc(v5->_packetLengths, 8 * -[NSArray count](v4, "count"), 0x100004000313F17uLL);
        if (v9)
        {
          v5->_packetLengths = v9;
          v5->_buffersSize = -[NSArray count](v4, "count");
          goto LABEL_8;
        }
        ne_log_obj();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v20 = 136315138;
          v21 = "-[NEPacketTunnelFlow writePacketObjects:]";
          _os_log_error_impl(&dword_19BD16000, v16, OS_LOG_TYPE_ERROR, "%s: Failed to allocate memory for packet lengths", (uint8_t *)&v20, 0xCu);
        }
      }
      else
      {
        ne_log_obj();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v20 = 136315138;
          v21 = "-[NEPacketTunnelFlow writePacketObjects:]";
          _os_log_error_impl(&dword_19BD16000, v16, OS_LOG_TYPE_ERROR, "%s: Failed to allocate memory for packet protocols", (uint8_t *)&v20, 0xCu);
        }
      }
    }
    else
    {
      ne_log_obj();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v20 = 136315138;
        v21 = "-[NEPacketTunnelFlow writePacketObjects:]";
        _os_log_error_impl(&dword_19BD16000, v16, OS_LOG_TYPE_ERROR, "%s: Failed to allocate memory for packet data pointers", (uint8_t *)&v20, 0xCu);
      }
    }

LABEL_29:
    v17 = 0;
    goto LABEL_30;
  }
LABEL_8:
  packetDataArray = (uint64_t)v5->_packetDataArray;
  if (packetDataArray && v5->_packetLengths && v5->_packetProtocols)
  {
    for (i = 0; ; ++i)
    {
      if (i >= -[NSArray count](v4, "count"))
      {
        packetDataArray = (uint64_t)v5->_packetDataArray;
        goto LABEL_22;
      }
      -[NSArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", i);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "data");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if ((isa_nsdata(v13) & 1) == 0)
        break;
      v14 = objc_retainAutorelease(v13);
      v5->_packetDataArray[i] = (char *)objc_msgSend(v14, "bytes");
      v5->_packetLengths[i] = objc_msgSend(v14, "length");
      -[NSArray objectAtIndexedSubscript:](v4, "objectAtIndexedSubscript:", i);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_packetProtocols[i] = objc_msgSend(v15, "protocolFamily");

    }
    ne_log_obj();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = 136315394;
      v21 = "-[NEPacketTunnelFlow writePacketObjects:]";
      v22 = 2048;
      v23 = i;
      _os_log_error_impl(&dword_19BD16000, v18, OS_LOG_TYPE_ERROR, "%s: object at index %lu of packets array is not an NSData", (uint8_t *)&v20, 0x16u);
    }

    goto LABEL_29;
  }
LABEL_22:
  v17 = NEVirtualInterfaceWriteMultipleIPPackets((uint64_t)v5->_interface, (uint64_t)v5->_packetProtocols, packetDataArray, (uint64_t)v5->_packetLengths, -[NSArray count](v4, "count")) != 0;
LABEL_30:
  objc_sync_exit(v5);

  return v17;
}

- (NSFileHandle)socket
{
  return (NSFileHandle *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSocket:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_packetHandler, 0);
  objc_storeStrong((id *)&self->_uuidMap, 0);
  objc_storeStrong(&self->_packetObjectHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_socket, 0);
}

void __61__NEPacketTunnelFlow_readPacketObjectsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t *a5, uint64_t *a6, unsigned int a7)
{
  id WeakRetained;
  void *v12;
  id v13;
  SEL v14;
  void (**v15)(_QWORD, void *);
  SEL v16;
  void **v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  id Property;
  void *v23;
  NEPacket *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  id *v30;
  void *v31;
  void *v32;
  uint64_t i;
  void *v34;
  uint64_t v35;
  void (**v36)(_QWORD, void *);
  _OWORD v39[32];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    v13 = WeakRetained;
    objc_sync_enter(v13);
    v15 = (void (**)(_QWORD, void *))objc_getProperty(v13, v14, 32, 1);
    objc_setProperty_atomic_copy(v13, v16, 0, 32);
    objc_sync_exit(v13);

    if (v15)
    {
      memset(v39, 0, sizeof(v39));
      if (a7 > 0x40)
        __assert_rtn("-[NEPacketTunnelFlow readPacketObjectsWithCompletionHandler:]_block_invoke", "NEPacketTunnelFlow.m", 227, "num_packets <= NEVPNPluginMaxPendingPackets");
      v34 = v12;
      v35 = a7;
      v36 = v15;
      if (a7)
      {
        v17 = (void **)v39;
        v18 = a4;
        v19 = v35;
        do
        {
          if (a4)
          {
            v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v18);
            if (v21)
            {
              Property = *(id *)(a1 + 32);
              if (Property)
                Property = objc_getProperty(Property, v20, 72, 1);
              objc_msgSend(Property, "objectForKeyedSubscript:", v21);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v23 = 0;
            }
          }
          else
          {
            v23 = 0;
            v21 = 0;
          }
          v24 = [NEPacket alloc];
          v25 = objc_alloc(MEMORY[0x1E0C99D50]);
          v27 = *a5++;
          v26 = v27;
          v28 = *a6++;
          v29 = (void *)objc_msgSend(v25, "initWithBytes:length:", v26, v28);
          LOBYTE(v28) = *a3;
          a3 += 4;
          v30 = -[NEPacket initWithData:protocolFamily:metadata:]((id *)&v24->super.isa, v29, v28, v23);
          v31 = *v17;
          *v17++ = v30;

          v18 += 16;
          --v19;
        }
        while (v19);
      }
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v39, v35);
      v36[2](v36, v32);

      for (i = 504; i != -8; i -= 8)
      v12 = v34;
      v15 = v36;
    }

  }
}

void __55__NEPacketTunnelFlow_readPacketsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, unsigned int *a3, uint64_t a4, _QWORD *a5, uint64_t *a6, unsigned int a7)
{
  id WeakRetained;
  void *v13;
  id v14;
  SEL v15;
  void (**v16)(id, void *, id);
  SEL v17;
  void **v18;
  void **v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t i;
  uint64_t j;
  void (**v33)(id, void *, id);
  uint64_t v34;
  _OWORD v35[32];
  _OWORD v36[32];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v13 = WeakRetained;
  if (WeakRetained)
  {
    v14 = WeakRetained;
    objc_sync_enter(v14);
    v16 = (void (**)(id, void *, id))objc_getProperty(v14, v15, 96, 1);
    objc_setProperty_atomic_copy(v14, v17, 0, 96);
    objc_sync_exit(v14);

    if (v16)
    {
      memset(v36, 0, sizeof(v36));
      memset(v35, 0, sizeof(v35));
      if (a7 > 0x40)
        __assert_rtn("-[NEPacketTunnelFlow readPacketsWithCompletionHandler:]_block_invoke", "NEPacketTunnelFlow.m", 170, "num_packets <= NEVPNPluginMaxPendingPackets");
      v33 = v16;
      v34 = a7;
      if (a7)
      {
        v18 = (void **)v35;
        v19 = (void **)v36;
        v20 = v34;
        do
        {
          v21 = objc_alloc(MEMORY[0x1E0C99D50]);
          v22 = *a6++;
          v23 = objc_msgSend(v21, "initWithBytes:length:", *a5, v22);
          v24 = *v19;
          *v19 = (void *)v23;

          v25 = *(_QWORD *)(a1 + 32);
          if (v25 && *(_QWORD *)(v25 + 80) == 1)
          {
            v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", *a3);
            v27 = *v18;
            *v18 = (void *)v26;

          }
          ++v18;
          ++a3;
          ++v19;
          ++a5;
          --v20;
        }
        while (v20);
      }
      v28 = *(_QWORD *)(a1 + 32);
      if (v28 && *(_QWORD *)(v28 + 80) == 1)
      {
        v16 = v33;
        v29 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v35, v34);
      }
      else
      {
        v29 = objc_alloc_init(MEMORY[0x1E0C99D20]);
        v16 = v33;
      }
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", v36, v34);
      v16[2](v16, v30, v29);

      for (i = 504; i != -8; i -= 8)
      for (j = 504; j != -8; j -= 8)

    }
  }

}

- (void)closeVirtualInterface
{
  uint64_t v1;
  SEL v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t *self;

  if (a1)
  {
    self = a1;
    objc_sync_enter(self);
    v1 = self[11];
    if (v1)
    {
      NEVirtualInterfaceInvalidate(v1);
      CFRelease((CFTypeRef)self[11]);
      self[11] = 0;
      *((_BYTE *)self + 8) = 0;
      objc_setProperty_atomic_copy(self, v2, 0, 96);
      v3 = (void *)self[5];
      if (v3)
      {
        free(v3);
        self[5] = 0;
      }
      v4 = (void *)self[6];
      if (v4)
      {
        free(v4);
        self[6] = 0;
      }
      v5 = (void *)self[7];
      if (v5)
      {
        free(v5);
        self[7] = 0;
      }
    }
    objc_sync_exit(self);

  }
}

@end
