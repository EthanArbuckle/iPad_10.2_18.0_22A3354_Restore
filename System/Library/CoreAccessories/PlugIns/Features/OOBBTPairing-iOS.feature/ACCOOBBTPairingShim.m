@implementation ACCOOBBTPairingShim

- (ACCOOBBTPairingShim)initWithDelegate:(id)a3
{
  id v4;
  ACCOOBBTPairingShim *v5;
  void *v6;
  uint64_t v7;
  NSString *uid;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ACCOOBBTPairingShim;
  v5 = -[ACCOOBBTPairingShim init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v7 = objc_claimAutoreleasedReturnValue();
    uid = v5->_uid;
    v5->_uid = (NSString *)v7;

    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (void)dealloc
{
  NSString *uid;
  objc_super v4;

  uid = self->_uid;
  self->_uid = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  v4.receiver = self;
  v4.super_class = (Class)ACCOOBBTPairingShim;
  -[ACCOOBBTPairingShim dealloc](&v4, sel_dealloc);
}

- (id)description
{
  void *v2;
  NSString *uid;
  id WeakRetained;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  uid = self->_uid;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<ACCOOBBTPairingShim>[_uid=%@ _delegate=%@]"), uid, WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)beginPairingWithCurrentAccessory:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingAccessory init].cold.2();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v4;
    _os_log_impl(&dword_21634E000, v7, OS_LOG_TYPE_INFO, "Beginning OOB BT pairing: accessory=%@", (uint8_t *)&v9, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "startOOBBTPairing:", v4);

}

- (void)accessoryAttached:(id)a3 accInfoDict:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = *MEMORY[0x24BE00DB8];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BE00DB8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v6, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDisplayName:", v9);

  }
  v10 = *MEMORY[0x24BE00DA0];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BE00DA0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v6, "objectForKey:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCertData:", v12);

  }
  v13 = *MEMORY[0x24BE00DA8];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BE00DA8]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v6, "objectForKey:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCertSerial:", v15);

  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v16 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingAccessory init].cold.2();
    v16 = MEMORY[0x24BDACB70];
    v17 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v18 = 138412290;
    v19 = v5;
    _os_log_impl(&dword_21634E000, v16, OS_LOG_TYPE_INFO, "accessoryAttached: %@", (uint8_t *)&v18, 0xCu);
  }

}

- (void)accessoryDetached:(id)a3
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingAccessory init].cold.2();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl(&dword_21634E000, v6, OS_LOG_TYPE_INFO, "accessoryDetached: %@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)accessoryInfo:(id)a3 oobBtPairingUID:(id)a4 accessoryMacAddr:(id)a5 deviceClass:(unsigned int)a6
{
  id v10;
  id v11;
  id v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  __int128 v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  void *v24;
  NSObject *WeakRetained;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  int v32;
  BOOL v33;
  int v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  int v43;
  __int16 v44;
  uint8_t v45[4];
  id v46;
  _QWORD v47[2];
  _BYTE buf[32];
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (gLogObjects)
    v13 = gNumLogObjects < 1;
  else
    v13 = 1;
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingAccessory init].cold.2();
    v15 = MEMORY[0x24BDACB70];
    v14 = MEMORY[0x24BDACB70];
  }
  else
  {
    v15 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    *(_QWORD *)&buf[24] = v12;
    LOWORD(v49) = 1024;
    *(_DWORD *)((char *)&v49 + 2) = a6;
    _os_log_impl(&dword_21634E000, v15, OS_LOG_TYPE_INFO, "accessoryInfo: %@ oobBtPairingUID:%@ accessoryMacAddr:%@ deviceClass:%d", buf, 0x26u);
  }

  if (v10 && v11)
  {
    v44 = -21846;
    v43 = -1431655766;
    *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v49 = v16;
    v50 = v16;
    *(_OWORD *)buf = v16;
    *(_OWORD *)&buf[16] = v16;
    v47[0] = 0xAAAAAAAAAAAAAAAALL;
    v47[1] = 0xAAAAAAAAAAAAAAAALL;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v17 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCOOBBTPairingAccessory init].cold.2();
      v17 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v45 = 138412290;
      v46 = v12;
      _os_log_impl(&dword_21634E000, v17, OS_LOG_TYPE_INFO, "Remote MAC Address: %@", v45, 0xCu);
    }

    v20 = objc_retainAutorelease(v12);
    objc_msgSend(v20, "bytes");
    objc_msgSend(v10, "setCurrentRemoteMACAddress:", v20);
    objc_msgSend(v10, "setCurrentOOBBTPairingUID:", v11);
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v21 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCOOBBTPairingAccessory init].cold.2();
      v21 = MEMORY[0x24BDACB70];
      v23 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "currentRemoteMACAddress");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v45 = 138412290;
      v46 = v24;
      _os_log_impl(&dword_21634E000, v21, OS_LOG_TYPE_INFO, "Storing remote MAC Address: %@", v45, 0xCu);

    }
    objc_msgSend(v10, "BTSession");
    if (BTLocalDeviceGetDefault())
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        WeakRetained = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCOOBBTPairingAccessory init].cold.2();
        WeakRetained = MEMORY[0x24BDACB70];
        v26 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
        -[ACCOOBBTPairingShim accessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:].cold.13();
    }
    else if (BTLocalDeviceGetAddressString())
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        WeakRetained = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCOOBBTPairingAccessory init].cold.2();
        WeakRetained = MEMORY[0x24BDACB70];
        v27 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
        -[ACCOOBBTPairingShim accessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:].cold.11();
    }
    else
    {
      if (BTDeviceAddressFromString())
      {
LABEL_62:
        objc_msgSend(v10, "setCurrentRemoteMACAddress:", 0);
        objc_msgSend(v10, "setCurrentOOBBTPairingUID:", 0);
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        -[NSObject stopOOBBTPairing:](WeakRetained, "stopOOBBTPairing:", v10);
LABEL_63:

        goto LABEL_64;
      }
      objc_msgSend(v10, "BTSession");
      if (BTDeviceFromAddress())
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          WeakRetained = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCOOBBTPairingAccessory init].cold.2();
          WeakRetained = MEMORY[0x24BDACB70];
          v28 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
          -[ACCOOBBTPairingShim accessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:].cold.9();
      }
      else if (BTDeviceGetPairingStatus())
      {
        if (gLogObjects && gNumLogObjects >= 1)
        {
          WeakRetained = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCOOBBTPairingAccessory init].cold.2();
          WeakRetained = MEMORY[0x24BDACB70];
          v29 = MEMORY[0x24BDACB70];
        }
        if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
          -[ACCOOBBTPairingShim accessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:].cold.7();
      }
      else
      {
        objc_msgSend(v10, "setCurrentRemoteBTDevice:", 0);
        objc_msgSend(v10, "BTAccessoryManager");
        if (BTAccessoryManagerGenerateLinkKey())
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            WeakRetained = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCOOBBTPairingAccessory init].cold.2();
            WeakRetained = MEMORY[0x24BDACB70];
            v36 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
            -[ACCOOBBTPairingShim accessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:].cold.5();
        }
        else
        {
          objc_msgSend(v10, "displayName");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v30)
          {
            objc_msgSend(v10, "iap2ShimAccessory");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "name");
            v30 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(v10, "BTAccessoryManager");
          WeakRetained = objc_retainAutorelease(v30);
          -[NSObject UTF8String](WeakRetained, "UTF8String");
          v32 = BTAccessoryManagerSetLinkKeyEx();
          if (gLogObjects)
            v33 = gNumLogObjects <= 0;
          else
            v33 = 1;
          v34 = !v33;
          if (!v32)
          {
            if (v34)
            {
              v37 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                -[ACCOOBBTPairingAccessory init].cold.2();
              v37 = MEMORY[0x24BDACB70];
              v39 = MEMORY[0x24BDACB70];
            }
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v45 = 0;
              _os_log_impl(&dword_21634E000, v37, OS_LOG_TYPE_INFO, "Sending Link Key to accessory", v45, 2u);
            }

            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v47, 16);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", &v43, 6);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend(v42, "linkKey:deviceMacAddr:accessory:", v40, v41, v10);

            goto LABEL_63;
          }
          if (v34)
          {
            v35 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCOOBBTPairingAccessory init].cold.2();
            v35 = MEMORY[0x24BDACB70];
            v38 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            -[ACCOOBBTPairingShim accessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:].cold.3();

        }
      }
    }

    goto LABEL_62;
  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v18 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingAccessory init].cold.2();
    v18 = MEMORY[0x24BDACB70];
    v22 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_21634E000, v18, OS_LOG_TYPE_DEFAULT, "Invalid accessory(%@) or oobBtPairingUID(%@)", buf, 0x16u);
  }

LABEL_64:
}

- (void)accessoryPairingCompletion:(id)a3 oobBtPairingUID:(id)a4 accessoryMacAddr:(id)a5 sendStop:(BOOL)a6 result:(unsigned __int8)a7
{
  int v7;
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  BOOL v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  const char *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint32_t v26;
  id WeakRetained;
  int v28;
  id v29;
  id v30;
  id v31;
  _BYTE v32[12];
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v7 = a7;
  v8 = a6;
  v41 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (gLogObjects)
    v15 = gNumLogObjects < 1;
  else
    v15 = 1;
  if (v15)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingAccessory init].cold.2();
    v17 = MEMORY[0x24BDACB70];
    v16 = MEMORY[0x24BDACB70];
  }
  else
  {
    v17 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v32 = 138413314;
    *(_QWORD *)&v32[4] = v12;
    v33 = 2112;
    v34 = v13;
    v35 = 2112;
    v36 = v14;
    v37 = 1024;
    v38 = v8;
    v39 = 1024;
    v40 = v7;
    _os_log_impl(&dword_21634E000, v17, OS_LOG_TYPE_INFO, "accessoryPairingCompletion: %@ oobBtPairingUID:%@ accessoryMacAddr:%@ sendStop:%d result:%d", v32, 0x2Cu);
  }

  if (v12 && v13)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v18 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCOOBBTPairingAccessory init].cold.2();
      v18 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_21634E000, v18, OS_LOG_TYPE_INFO, "Asking BTServer to connect to the remote device...", v32, 2u);
    }

    if (v7)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v20 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCOOBBTPairingAccessory init].cold.2();
        v20 = MEMORY[0x24BDACB70];
        v22 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        goto LABEL_38;
      *(_DWORD *)v32 = 67109120;
      *(_DWORD *)&v32[4] = v7;
      v23 = "Skip call to BTDeviceConnect(device), result (%d) was not success (0)";
    }
    else
    {
      if (!objc_msgSend(v12, "currentRemoteBTDevice") || (objc_msgSend(v12, "carPlaySupported") & 1) != 0)
      {
        if (!objc_msgSend(v12, "currentRemoteBTDevice"))
        {
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v21 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              -[ACCOOBBTPairingAccessory init].cold.2();
            v21 = MEMORY[0x24BDACB70];
            v30 = MEMORY[0x24BDACB70];
          }
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v32 = 0;
            _os_log_impl(&dword_21634E000, v21, OS_LOG_TYPE_DEFAULT, "No stored remote BTDevice, not connecting.", v32, 2u);
          }

        }
        if (!objc_msgSend(v12, "carPlaySupported"))
          goto LABEL_39;
        if (gLogObjects && gNumLogObjects >= 1)
        {
          v20 = *(id *)gLogObjects;
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[ACCOOBBTPairingAccessory init].cold.2();
          v20 = MEMORY[0x24BDACB70];
          v31 = MEMORY[0x24BDACB70];
        }
        if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
LABEL_38:

LABEL_39:
          objc_msgSend(v12, "setCurrentRemoteMACAddress:", 0, *(_QWORD *)v32);
          if (v8)
          {
            WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
            objc_msgSend(WeakRetained, "stopOOBBTPairing:", v12);

          }
          goto LABEL_41;
        }
        *(_WORD *)v32 = 0;
        v23 = "BT connection not initiated due to CarPlay support.";
        v24 = v20;
        v25 = OS_LOG_TYPE_DEFAULT;
        v26 = 2;
LABEL_37:
        _os_log_impl(&dword_21634E000, v24, v25, v23, v32, v26);
        goto LABEL_38;
      }
      objc_msgSend(v12, "currentRemoteBTDevice");
      v28 = BTDeviceConnect();
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v20 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCOOBBTPairingAccessory init].cold.2();
        v20 = MEMORY[0x24BDACB70];
        v29 = MEMORY[0x24BDACB70];
      }
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        goto LABEL_38;
      *(_DWORD *)v32 = 67109120;
      *(_DWORD *)&v32[4] = v28;
      v23 = "BTDeviceConnect(device) result (zero == success): %d";
    }
    v24 = v20;
    v25 = OS_LOG_TYPE_INFO;
    v26 = 8;
    goto LABEL_37;
  }
LABEL_41:

}

- (id)getUID
{
  return self->_uid;
}

- (BOOL)tryProcessXPCMessage:(id)a3 connection:(id)a4 server:(id)a5
{
  id v6;
  const char *string;
  BOOL v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  int v14;
  uint64_t uint64;
  id WeakRetained;
  void *v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  _DWORD v23[2];
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  string = xpc_dictionary_get_string(v6, MEMORY[0x24BE00DF8]);
  if (!string)
  {
    if (gLogObjects)
      v8 = gNumLogObjects < 1;
    else
      v8 = 1;
    if (v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCOOBBTPairingAccessory init].cold.2();
      v10 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v10 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23[0]) = 0;
      _os_log_impl(&dword_21634E000, v10, OS_LOG_TYPE_DEFAULT, "RequestType not specified in xpc message!", (uint8_t *)v23, 2u);
    }

    string = "<nil>";
  }
  if (gLogObjects)
    v11 = gNumLogObjects < 1;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingAccessory init].cold.2();
    v13 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[ACCOOBBTPairingShim tryProcessXPCMessage:connection:server:].cold.4((uint64_t)string, v13);

  v14 = strcmp(string, "IAPAppBeginOOBPairingStr");
  if (!v14)
  {
    uint64 = xpc_dictionary_get_uint64(v6, MEMORY[0x24BE00DF0]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "oobBtAccessoryForConnectionID:", uint64);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v18 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCOOBBTPairingAccessory init].cold.2();
      v18 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v23[0] = 67109378;
      v23[1] = uint64;
      v24 = 2112;
      v25 = v17;
      _os_log_impl(&dword_21634E000, v18, OS_LOG_TYPE_INFO, "Handling kXPCIAPAppBeginOOBPairingStr: connectionID=%d accessory=%@", (uint8_t *)v23, 0x12u);
    }

    if (v17)
      -[ACCOOBBTPairingShim beginPairingWithCurrentAccessory:](self, "beginPairingWithCurrentAccessory:", v17);

  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v20 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCOOBBTPairingAccessory init].cold.2();
    v20 = MEMORY[0x24BDACB70];
    v21 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    -[ACCOOBBTPairingShim tryProcessXPCMessage:connection:server:].cold.1((uint64_t)string, v14 == 0, v20);

  return v14 == 0;
}

- (ACCOOBBTPairingShimProtocol)delegate
{
  return (ACCOOBBTPairingShimProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)uid
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uid, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)accessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21634E000, v0, v1, "failed to set link key", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)accessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21634E000, v0, v1, "failed to generate link key", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)accessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21634E000, v0, v1, "failed to get BT pairing status", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)accessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:.cold.9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21634E000, v0, v1, "failed to get BTDevice from address", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)accessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:.cold.11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21634E000, v0, v1, "unable to get local BT device MAC address", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)accessoryInfo:oobBtPairingUID:accessoryMacAddr:deviceClass:.cold.13()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_21634E000, v0, v1, "failed to get local BT device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)tryProcessXPCMessage:(uint64_t)a1 connection:(char)a2 server:(os_log_t)log .cold.1(uint64_t a1, char a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = a1;
  v5 = 1024;
  v6 = a2 & 1;
  _os_log_debug_impl(&dword_21634E000, log, OS_LOG_TYPE_DEBUG, "tryProcessXPCMessage: messagetype=%s processed=%d", (uint8_t *)&v3, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (void)tryProcessXPCMessage:(uint64_t)a1 connection:(NSObject *)a2 server:.cold.4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 136315138;
  v3 = a1;
  _os_log_debug_impl(&dword_21634E000, a2, OS_LOG_TYPE_DEBUG, "tryProcessXPCMessage: messagetype=%s", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
