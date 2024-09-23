@implementation BleConnection

- (BleConnection)initWithQueue:(id)a3
{
  id v5;
  const char *v6;
  BleConnection *v7;
  void *v8;
  const char *v9;
  CBCentralManager *v10;
  CBCentralManager *centralManager;
  NSMutableDictionary *v12;
  NSMutableDictionary *cachedPeripherals;
  const char *v14;
  uint64_t v15;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)BleConnection;
  v7 = -[BleConnection init](&v17, sel_init);
  if (v7)
  {
    objc_msgSend_GetShortestServiceUUID_(MTRUUIDHelper, v6, (uint64_t)&unk_2342D923D);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setShortServiceUUID_(v7, v9, (uint64_t)v8);

    if (qword_254253100 != -1)
      dispatch_once_f(&qword_254253100, &byte_2542530C0, (dispatch_function_t)sub_233C0BA78);
    objc_storeStrong((id *)&v7->_chipWorkQueue, (id)qword_2542530E8);
    objc_storeStrong((id *)&v7->_workQueue, a3);
    v10 = (CBCentralManager *)objc_alloc(MEMORY[0x24BDBB220]);
    centralManager = v7->_centralManager;
    v7->_centralManager = v10;

    v7->_found = 0;
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    cachedPeripherals = v7->_cachedPeripherals;
    v7->_cachedPeripherals = v12;

    v7->_currentMode = 0;
    objc_msgSend__resetCounters(v7, v14, v15);
  }

  return v7;
}

- (BleConnection)initWithDelegate:(BleScannerDelegate *)a3 prewarm:(BOOL)a4 queue:(id)a5
{
  _BOOL4 v5;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  BleConnection *v12;

  v5 = a4;
  v8 = a5;
  v10 = objc_msgSend_initWithQueue_(self, v9, (uint64_t)v8);
  v12 = (BleConnection *)v10;
  if (v10)
  {
    *(_QWORD *)(v10 + 104) = a3;
    if (v5)
    {
      *(_BYTE *)(v10 + 8) = 2;
      objc_msgSend_setupTimer_((void *)v10, v11, 120);
    }
    else
    {
      *(_BYTE *)(v10 + 8) = 1;
    }
  }

  return v12;
}

- (BleConnection)initWithDiscriminator:(const SetupDiscriminator *)a3 queue:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  BleConnection *v10;
  unsigned __int16 mDiscriminator;

  v6 = a4;
  v8 = objc_msgSend_initWithQueue_(self, v7, (uint64_t)v6);
  v10 = (BleConnection *)v8;
  if (v8)
  {
    mDiscriminator = a3->mDiscriminator;
    *(_BYTE *)(v8 + 12) = a3->mIsShortDiscriminator;
    *(_WORD *)(v8 + 10) = mDiscriminator;
    *(_BYTE *)(v8 + 8) = 3;
    objc_msgSend_setupTimer_((void *)v8, v9, 60);
  }

  return v10;
}

- (BOOL)isConnecting
{
  return self->_currentMode == 3;
}

- (void)setupTimer:(unint64_t)a3
{
  OS_dispatch_source *v5;
  OS_dispatch_source *timer;
  NSObject *v7;
  int64_t v8;
  NSObject *v9;
  dispatch_time_t v10;
  _QWORD handler[5];

  objc_msgSend_clearTimer(self, a2, a3);
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_workQueue);
  timer = self->_timer;
  self->_timer = v5;

  v7 = self->_timer;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = sub_2341BFD60;
  handler[3] = &unk_2504EE8C0;
  handler[4] = self;
  dispatch_source_set_event_handler(v7, handler);
  v8 = 1000000000 * a3;
  v9 = self->_timer;
  v10 = dispatch_walltime(0, v8);
  dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
  dispatch_resume((dispatch_object_t)self->_timer);
}

- (void)clearTimer
{
  NSObject *timer;
  OS_dispatch_source *v4;

  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;

  }
}

- (void)dispatchConnectionError:(ChipError *)a3
{
  NSObject *chipWorkQueue;
  _QWORD v4[5];
  ChipError v5;

  chipWorkQueue = self->_chipWorkQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_2341BFEC8;
  v4[3] = &unk_2505143B0;
  v4[4] = self;
  v5 = *a3;
  dispatch_async(chipWorkQueue, v4);
}

- (void)dispatchConnectionComplete:(id)a3
{
  id v4;
  NSObject *chipWorkQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  chipWorkQueue = self->_chipWorkQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_2341BFFA0;
  v7[3] = &unk_2504EE768;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(chipWorkQueue, v7);

}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  int v20;
  const char *v21;
  int v22;
  uint8_t buf[8];
  const char *v24;
  int v25;
  char v26;

  v4 = a3;
  *(_DWORD *)buf = 2;
  v24 = "dwnpm_ble_cbmgr_state";
  v25 = objc_msgSend_state(v4, v5, v6);
  v26 = 2;
  sub_2341C4BEC((uint64_t)buf);
  switch(objc_msgSend_state(v4, v7, v8))
  {
    case 0:
      sub_234117B80(2u, "Ble");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_233BF3000, v9, OS_LOG_TYPE_INFO, "CBManagerState: UNKNOWN", buf, 2u);
      }

      if (sub_234114844(3u))
        goto LABEL_17;
      break;
    case 1:
      sub_234117B80(2u, "Ble");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_233BF3000, v10, OS_LOG_TYPE_INFO, "CBManagerState: RESETTING", buf, 2u);
      }

      if (sub_234114844(3u))
        goto LABEL_17;
      break;
    case 2:
      sub_234117B80(2u, "Ble");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_233BF3000, v11, OS_LOG_TYPE_INFO, "CBManagerState: UNSUPPORTED", buf, 2u);
      }

      if (sub_234114844(3u))
        goto LABEL_17;
      break;
    case 3:
      sub_234117B80(2u, "Ble");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_233BF3000, v12, OS_LOG_TYPE_INFO, "CBManagerState: Unauthorized", buf, 2u);
      }

      if (sub_234114844(3u))
LABEL_17:
        sub_2341147D0(2u, 3);
      break;
    case 4:
      sub_234117B80(2u, "Ble");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_233BF3000, v13, OS_LOG_TYPE_INFO, "CBManagerState: OFF", buf, 2u);
      }

      if (sub_234114844(3u))
        sub_2341147D0(2u, 3);
      objc_msgSend_stop(self, v14, v15);
      v20 = 1037;
      v21 = "src/platform/Darwin/BleConnectionDelegateImpl.mm";
      v22 = 351;
      objc_msgSend_dispatchConnectionError_(self, v16, (uint64_t)&v20);
      break;
    case 5:
      sub_234117B80(2u, "Ble");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_233BF3000, v17, OS_LOG_TYPE_INFO, "CBManagerState: ON", buf, 2u);
      }

      if (sub_234114844(3u))
        sub_2341147D0(2u, 3);
      objc_msgSend_start(self, v18, v19);
      break;
    default:
      break;
  }

}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v10;
  const char *v11;
  id v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  int isEqualToData;
  const char *v27;
  const char *v28;
  uint64_t v29;
  int v30;
  const char *v31;
  uint64_t v32;
  id v33;
  const char *v34;
  uint64_t v35;
  unsigned __int8 *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  unsigned int v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  uint64_t v45;
  const char *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  unint64_t i;
  const char *v51;
  void *v52;
  const char *v53;
  NSObject *v54;
  id v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  const char *v59;
  uint64_t v60;
  id v61;
  const char *v62;
  uint64_t v63;
  int v64;
  int v65;
  unsigned __int8 v66;
  const char *v67;
  uint64_t v68;
  NSObject *v69;
  const char *v70;
  const char *v71;
  uint64_t v72;
  NSObject *v73;
  id v74;
  uint64_t v75;
  void *v76;
  id v77;
  id v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint8_t buf[4];
  _BYTE v85[18];
  _BYTE v86[128];
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v77 = a3;
  v79 = a4;
  v10 = a5;
  v78 = a6;
  objc_msgSend_objectForKey_(v10, v11, *MEMORY[0x24BDBAFE0]);
  v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  v81 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v80, v86, 16);
  v17 = v12;
  if (v16)
  {
    v18 = *(_QWORD *)v81;
LABEL_3:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v81 != v18)
        objc_enumerationMutation(v12);
      v20 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v19);
      objc_msgSend_data(v20, v14, v15);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_data(self->_shortServiceUUID, v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      isEqualToData = objc_msgSend_isEqualToData_(v21, v25, (uint64_t)v24);

      if (isEqualToData)
        break;
      if (v16 == ++v19)
      {
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v14, (uint64_t)&v80, v86, 16);
        if (v16)
          goto LABEL_3;
        v17 = v12;
        goto LABEL_45;
      }
    }
    objc_msgSend_objectForKey_(v12, v14, (uint64_t)v20);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
      goto LABEL_46;
    objc_msgSend_objectForKey_(v10, v27, *MEMORY[0x24BDBAFB0]);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend_BOOLValue(v76, v28, v29);
    *(_DWORD *)buf = 1;
    *(_QWORD *)&v85[4] = "dwnpm_ble_discovered_peripheral";
    *(_DWORD *)&v85[12] = v30;
    v85[16] = 1;
    sub_2341C4BEC((uint64_t)buf);
    if ((objc_msgSend_BOOLValue(v76, v31, v32) & 1) != 0)
    {
      v33 = objc_retainAutorelease(v17);
      v36 = (unsigned __int8 *)objc_msgSend_bytes(v33, v34, v35);
      if (objc_msgSend_length(v33, v37, v38) == 8)
      {
        v41 = *v36;
        if (v41 < 2)
        {
          v65 = v36[1];
          v66 = v36[2];
          if (objc_msgSend_isConnecting(self, v39, v40))
          {
            v68 = v65 & 0xFFFFF0FF | ((v66 & 0xF) << 8);
            if ((objc_msgSend_checkDiscriminator_(self, v67, v68) & 1) != 0)
            {
              *(_DWORD *)buf = 0;
              *(_QWORD *)&v85[4] = "dwnpm_ble_discovered_matching_peripheral";
              v85[16] = 0;
              sub_2341C4BEC((uint64_t)buf);
              sub_234117B80(2u, "Ble");
              v69 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134218240;
                *(_QWORD *)v85 = v79;
                *(_WORD *)&v85[8] = 1024;
                *(_DWORD *)&v85[10] = v68;
                _os_log_impl(&dword_233BF3000, v69, OS_LOG_TYPE_DEFAULT, "Connecting to device %p with discriminator: %d", buf, 0x12u);
              }

              if (sub_234114844(2u))
              {
                v74 = v79;
                v75 = v68;
                sub_2341147D0(2u, 2);
              }
              objc_msgSend_connect_(self, v70, (uint64_t)v79, v74, v75);
              objc_msgSend_stopScanning(self, v71, v72);
            }
            else
            {
              sub_234117B80(2u, "Ble");
              v73 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                *(_QWORD *)v85 = v79;
                *(_WORD *)&v85[8] = 1024;
                *(_DWORD *)&v85[10] = v68;
                _os_log_impl(&dword_233BF3000, v73, OS_LOG_TYPE_ERROR, "A device (%p) with a matching Matter UUID has been discovered but the service data discriminator not match our expectation (discriminator = %u).", buf, 0x12u);
              }

              if (sub_234114844(1u))
                sub_2341147D0(2u, 1);
              *(_DWORD *)buf = 2;
              *(_QWORD *)&v85[4] = "dwnpm_ble_mismatched_discriminator";
              v85[16] = 0;
              sub_2341C4BEC((uint64_t)buf);
            }
          }
          else
          {
            objc_msgSend_addPeripheralToCache_data_(self, v67, (uint64_t)v79, v33);
          }
        }
        else
        {
          sub_234117B80(2u, "Ble");
          v42 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)v85 = v79;
            *(_WORD *)&v85[8] = 1024;
            *(_DWORD *)&v85[10] = v41;
            _os_log_impl(&dword_233BF3000, v42, OS_LOG_TYPE_ERROR, "A device (%p) with a matching Matter UUID has been discovered but the service data opCode not match our expectation (opCode = %u).", buf, 0x12u);
          }

          if (sub_234114844(1u))
            sub_2341147D0(2u, 1);
          *(_DWORD *)buf = 2;
          *(_QWORD *)&v85[4] = "dwnpm_ble_bad_opcode";
          *(_DWORD *)&v85[12] = v41;
          v85[16] = 2;
          sub_2341C4BEC((uint64_t)buf);
        }
      }
      else
      {
        v44 = (void *)MEMORY[0x24BDD16A8];
        v45 = objc_msgSend_length(v33, v39, v40);
        objc_msgSend_stringWithCapacity_(v44, v46, 2 * v45);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        for (i = 0; i < objc_msgSend_length(v33, v47, v48); ++i)
        {
          objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v51, (uint64_t)CFSTR("%02lx"), v36[i]);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendString_(v49, v53, (uint64_t)v52);

        }
        sub_234117B80(2u, "Ble");
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          v55 = objc_retainAutorelease(v49);
          v58 = objc_msgSend_UTF8String(v55, v56, v57);
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)v85 = v79;
          *(_WORD *)&v85[8] = 2080;
          *(_QWORD *)&v85[10] = v58;
          _os_log_impl(&dword_233BF3000, v54, OS_LOG_TYPE_ERROR, "A device (%p) with a matching Matter UUID has been discovered but the service data len does not match our expectation (serviceData = %s)", buf, 0x16u);
        }

        if (sub_234114844(1u))
        {
          v61 = objc_retainAutorelease(v49);
          v74 = v79;
          v75 = objc_msgSend_UTF8String(v61, v62, v63);
          sub_2341147D0(2u, 1);
        }
        v64 = objc_msgSend_length(v33, v59, v60, v74, v75);
        *(_DWORD *)buf = 2;
        *(_QWORD *)&v85[4] = "dwnpm_ble_bad_service_data";
        *(_DWORD *)&v85[12] = v64;
        v85[16] = 2;
        sub_2341C4BEC((uint64_t)buf);

      }
    }
    else
    {
      sub_234117B80(2u, "Ble");
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v85 = v79;
        _os_log_impl(&dword_233BF3000, v43, OS_LOG_TYPE_ERROR, "A device (%p) with a matching Matter UUID has been discovered but it is not connectable.", buf, 0xCu);
      }

      if (sub_234114844(1u))
        sub_2341147D0(2u, 1);
    }

  }
LABEL_45:

LABEL_46:
}

- (BOOL)checkDiscriminator:(unsigned __int16)a3
{
  int v3;

  if (self->_deviceDiscriminator.mIsShortDiscriminator)
    v3 = HIBYTE(a3);
  else
    v3 = a3;
  return self->_deviceDiscriminator.mDiscriminator == v3;
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v5;
  const char *v6;
  const char *v7;
  int v8;
  const char *v9;
  char v10;

  v5 = a4;
  v8 = 1;
  v9 = "dwnpm_ble_connect_peripheral";
  v10 = 0;
  sub_2341C4BEC((uint64_t)&v8);
  v8 = 0;
  v9 = "dwnpm_ble_discovered_svs";
  v10 = 0;
  sub_2341C4BEC((uint64_t)&v8);
  objc_msgSend_setDelegate_(v5, v6, (uint64_t)self);
  objc_msgSend_discoverServices_(v5, v7, 0);

}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  const char *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  id v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  const char *v36;
  uint64_t v37;
  char v38;
  const char *v39;
  const char *v40;
  const char *v41;
  uint64_t v42;
  char v43;
  char v44;
  NSObject *v45;
  const char *v46;
  uint64_t v47;
  id v48;
  id v49;
  int v50;
  const char *v51;
  int v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  _BYTE v59[12];
  int v60;
  char v61;
  uint64_t v62;

  v62 = *MEMORY[0x24BDAC8D0];
  v48 = a3;
  v49 = a4;
  if (v49)
  {
    sub_234117B80(2u, "Ble");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_localizedDescription(v49, v9, v10);
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v59 = objc_msgSend_UTF8String(v11, v12, v13);
      _os_log_impl(&dword_233BF3000, v8, OS_LOG_TYPE_ERROR, "BLE:Error finding Chip Service in the device: [%s]", buf, 0xCu);

    }
    if (sub_234114844(1u))
    {
      objc_msgSend_localizedDescription(v49, v6, v7);
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v47 = objc_msgSend_UTF8String(v14, v15, v16);
      sub_2341147D0(2u, 1);

    }
  }
  v17 = objc_msgSend_code(v49, v6, v7, v47);
  *(_DWORD *)buf = 1;
  *(_QWORD *)&v59[4] = "dwnpm_ble_discovered_svs";
  v60 = v17 & 0xFFFFFF | 0x1000000;
  v61 = 3;
  sub_2341C4BEC((uint64_t)buf);
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend_services(v48, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v53, v57, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v54 != v25)
          objc_enumerationMutation(v20);
        v27 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend_UUID(v27, v22, v23);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_data(v28, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_data(self->_shortServiceUUID, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_isEqualToData_(v31, v35, (uint64_t)v34))
        {
          v38 = objc_msgSend_found(self, v36, v37);

          if ((v38 & 1) == 0)
          {
            *(_DWORD *)buf = 0;
            *(_QWORD *)&v59[4] = "dwnpm_ble_discovered_chrs";
            v61 = 0;
            sub_2341C4BEC((uint64_t)buf);
            objc_msgSend_discoverCharacteristics_forService_(v48, v39, 0, v27);
            objc_msgSend_setFound_(self, v40, 1);
            goto LABEL_17;
          }
        }
        else
        {

        }
      }
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v53, v57, 16);
    }
    while (v24);
  }
LABEL_17:

  v43 = objc_msgSend_found(self, v41, v42);
  if (v49)
    v44 = 0;
  else
    v44 = v43;
  if ((v44 & 1) == 0)
  {
    sub_234117B80(2u, "Ble");
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_233BF3000, v45, OS_LOG_TYPE_ERROR, "Service not found on the device.", buf, 2u);
    }

    if (sub_234114844(1u))
      sub_2341147D0(2u, 1);
    *(_DWORD *)buf = 2;
    *(_QWORD *)&v59[4] = "dwnpm_ble_discovered_svs";
    v60 = 3;
    v61 = 3;
    sub_2341C4BEC((uint64_t)buf);
    v50 = 3;
    v51 = "src/platform/Darwin/BleConnectionDelegateImpl.mm";
    v52 = 476;
    objc_msgSend_dispatchConnectionError_(self, v46, (uint64_t)&v50);
  }

}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  _BYTE v25[12];
  int v26;
  char v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  *(_DWORD *)buf = 1;
  *(_QWORD *)&v25[4] = "dwnpm_ble_discovered_chrs";
  v26 = objc_msgSend_code(v8, v9, v10) & 0xFFFFFF | 0x1000000;
  v27 = 3;
  sub_2341C4BEC((uint64_t)buf);
  if (v8)
  {
    sub_234117B80(2u, "Ble");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_localizedDescription(v8, v13, v14);
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v18 = objc_msgSend_UTF8String(v15, v16, v17);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v25 = v18;
      _os_log_impl(&dword_233BF3000, v12, OS_LOG_TYPE_ERROR, "BLE:Error finding Characteristics in Chip service on the device: [%s]", buf, 0xCu);

    }
    if (sub_234114844(1u))
    {
      objc_msgSend_localizedDescription(v8, v11, v19);
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v23 = objc_msgSend_UTF8String(v20, v21, v22);
      sub_2341147D0(2u, 1);

    }
  }
  objc_msgSend_dispatchConnectionComplete_(self, v11, (uint64_t)v7, v23);

}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  id v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  NSObject *chipWorkQueue;
  id v24;
  NSObject *v25;
  id v26;
  _QWORD block[5];
  id v28;
  _QWORD v29[5];
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[24];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v11 = a5;
  if (v11)
  {
    sub_234117B80(2u, "Ble");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_localizedDescription(v11, v13, v14);
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = objc_msgSend_UTF8String(v15, v16, v17);
      _os_log_impl(&dword_233BF3000, v12, OS_LOG_TYPE_ERROR, "BLE:Error writing Characteristics in Chip service on the device: [%s]", buf, 0xCu);

    }
    if (sub_234114844(1u))
    {
      objc_msgSend_localizedDescription(v11, v18, v19);
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend_UTF8String(v20, v21, v22);
      sub_2341147D0(2u, 1);

    }
    chipWorkQueue = self->_chipWorkQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_2341C1414;
    block[3] = &unk_2504EE768;
    block[4] = self;
    v28 = v8;
    v24 = v8;
    dispatch_async(chipWorkQueue, block);

  }
  else
  {
    objc_msgSend_fillServiceWithCharacteristicUuids_svcId_charId_(BleConnection, v10, (uint64_t)v9, buf, &v33);
    v25 = self->_chipWorkQueue;
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = sub_2341C13FC;
    v29[3] = &unk_250514418;
    v29[4] = self;
    v30 = v8;
    v31 = *(_OWORD *)buf;
    v32 = v33;
    v26 = v8;
    dispatch_async(v25, v29);

  }
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  char isNotifying;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  NSObject *chipWorkQueue;
  id v27;
  NSObject *v28;
  id v29;
  _QWORD block[5];
  id v31;
  char v32;
  _QWORD v33[5];
  id v34;
  char v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[24];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  isNotifying = objc_msgSend_isNotifying(v9, v11, v12);
  if (v10)
  {
    sub_234117B80(2u, "Ble");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_localizedDescription(v10, v16, v17);
      v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = objc_msgSend_UTF8String(v18, v19, v20);
      _os_log_impl(&dword_233BF3000, v15, OS_LOG_TYPE_ERROR, "BLE:Error subscribing/unsubcribing some characteristic on the device: [%s]", buf, 0xCu);

    }
    if (sub_234114844(1u))
    {
      objc_msgSend_localizedDescription(v10, v21, v22);
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend_UTF8String(v23, v24, v25);
      sub_2341147D0(2u, 1);

    }
    chipWorkQueue = self->_chipWorkQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_2341C1730;
    block[3] = &unk_250514468;
    v32 = isNotifying;
    block[4] = self;
    v31 = v8;
    v27 = v8;
    dispatch_async(chipWorkQueue, block);

  }
  else
  {
    objc_msgSend_fillServiceWithCharacteristicUuids_svcId_charId_(BleConnection, v13, (uint64_t)v9, buf, &v38);
    v28 = self->_chipWorkQueue;
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = sub_2341C170C;
    v33[3] = &unk_250514440;
    v35 = isNotifying;
    v33[4] = self;
    v34 = v8;
    v36 = *(_OWORD *)buf;
    v37 = v38;
    v29 = v8;
    dispatch_async(v28, v33);

  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  id v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  id v20;
  const char *v21;
  uint64_t v22;
  NSObject *chipWorkQueue;
  id v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  id v29;
  id v30;
  _QWORD block[5];
  id v32;
  _QWORD v33[4];
  id v34;
  BleConnection *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[24];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v11 = a5;
  if (v11)
  {
    sub_234117B80(2u, "Ble");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_localizedDescription(v11, v13, v14);
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = objc_msgSend_UTF8String(v15, v16, v17);
      _os_log_impl(&dword_233BF3000, v12, OS_LOG_TYPE_ERROR, "BLE:Error receiving indication of Characteristics on the device: [%s]", buf, 0xCu);

    }
    if (sub_234114844(1u))
    {
      objc_msgSend_localizedDescription(v11, v18, v19);
      v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend_UTF8String(v20, v21, v22);
      sub_2341147D0(2u, 1);

    }
    chipWorkQueue = self->_chipWorkQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_2341C1CB4;
    block[3] = &unk_2504EE768;
    block[4] = self;
    v32 = v8;
    v24 = v8;
    dispatch_async(chipWorkQueue, block);

  }
  else
  {
    objc_msgSend_fillServiceWithCharacteristicUuids_svcId_charId_(BleConnection, v10, (uint64_t)v9, buf, &v39);
    objc_msgSend_value(v9, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = 3221225472;
    v37 = *(_OWORD *)buf;
    v28 = self->_chipWorkQueue;
    v33[0] = MEMORY[0x24BDAC760];
    v33[2] = sub_2341C1AA8;
    v33[3] = &unk_2504EE618;
    v34 = v27;
    v35 = self;
    v36 = v8;
    v38 = v39;
    v29 = v8;
    v30 = v27;
    dispatch_async(v28, v33);

  }
}

- (void)start
{
  const char *v3;
  int v4;
  const char *v5;
  char v6;

  if (self->_peripheral)
  {
    v4 = 0;
    v5 = "dwnpm_ble_discovered_matching_peripheral";
    v6 = 0;
    sub_2341C4BEC((uint64_t)&v4);
    objc_msgSend_connect_(self, v3, (uint64_t)self->_peripheral);
  }
  else
  {
    ((void (*)(BleConnection *, char *))MEMORY[0x24BEDD108])(self, sel_startScanning);
  }
}

- (void)stop
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  NSObject *chipWorkQueue;
  _QWORD block[5];

  objc_msgSend_detachScannerDelegate(self, a2, v2);
  self->_found = 0;
  objc_msgSend_stopScanning(self, v4, v5);
  objc_msgSend_removePeripheralsFromCache(self, v6, v7);
  if (*(_OWORD *)&self->_centralManager != 0)
  {
    chipWorkQueue = self->_chipWorkQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_2341C1E1C;
    block[3] = &unk_2504EE8C0;
    block[4] = self;
    dispatch_async(chipWorkQueue, block);
  }
}

- (void)_resetCounters
{
  *(_QWORD *)&self->_totalDevicesAdded = 0;
}

- (void)startScanning
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  CBCentralManager *centralManager;
  const char *v8;
  void *v9;
  const char *v10;
  int v11;
  const char *v12;
  char v13;
  CBUUID *shortServiceUUID;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  if (self->_centralManager)
  {
    v11 = 0;
    v12 = "dwnpm_ble_scan";
    v13 = 0;
    sub_2341C4BEC((uint64_t)&v11);
    v11 = 0;
    v12 = "dwnpm_ble_discovered_peripheral";
    v13 = 0;
    sub_2341C4BEC((uint64_t)&v11);
    v11 = 0;
    v12 = "dwnpm_ble_discovered_matching_peripheral";
    v13 = 0;
    sub_2341C4BEC((uint64_t)&v11);
    objc_msgSend__resetCounters(self, v3, v4);
    v15 = *MEMORY[0x24BDBB058];
    v16[0] = MEMORY[0x24BDBD1C8];
    objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v5, (uint64_t)v16, &v15, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    centralManager = self->_centralManager;
    shortServiceUUID = self->_shortServiceUUID;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v8, (uint64_t)&shortServiceUUID, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_scanForPeripheralsWithServices_options_(centralManager, v10, (uint64_t)v9, v6);

  }
}

- (void)stopScanning
{
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  int v9;
  const char *v10;
  char v11;

  if (self->_centralManager)
  {
    v9 = 1;
    v10 = "dwnpm_ble_scan";
    v11 = 0;
    sub_2341C4BEC((uint64_t)&v9);
    objc_msgSend__resetCounters(self, v3, v4);
    objc_msgSend_clearTimer(self, v5, v6);
    objc_msgSend_stopScan(self->_centralManager, v7, v8);
  }
}

- (void)connect:(id)a3
{
  id v5;
  const char *v6;
  int v7;
  const char *v8;
  char v9;

  v5 = a3;
  if (v5 && self->_centralManager)
  {
    v7 = 1;
    v8 = "dwnpm_ble_discovered_matching_peripheral";
    v9 = 0;
    sub_2341C4BEC((uint64_t)&v7);
    v7 = 0;
    v8 = "dwnpm_ble_connect_peripheral";
    v9 = 0;
    sub_2341C4BEC((uint64_t)&v7);
    objc_storeStrong((id *)&self->_peripheral, a3);
    objc_msgSend_connectPeripheral_options_(self->_centralManager, v6, (uint64_t)v5, 0);
  }

}

- (void)detachScannerDelegate
{
  BleScannerDelegate *scannerDelegate;
  NSObject *chipWorkQueue;
  _QWORD block[5];

  scannerDelegate = self->_scannerDelegate;
  if (scannerDelegate)
  {
    self->_scannerDelegate = 0;
    chipWorkQueue = self->_chipWorkQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_2341C21E8;
    block[3] = &unk_2505008C0;
    block[4] = scannerDelegate;
    dispatch_async(chipWorkQueue, block);
  }
}

- (void)updateWithDelegate:(BleScannerDelegate *)a3 prewarm:(BOOL)a4
{
  const char *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  const char *v15;
  void *v16;
  NSObject *chipWorkQueue;
  id v18;
  _BOOL4 v19;
  NSMutableDictionary *obj;
  _QWORD block[4];
  id v22;
  uint64_t v23;
  BleScannerDelegate *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v19 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_detachScannerDelegate(self, a2, (uint64_t)a3);
  if (a3)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = self->_cachedPeripherals;
    v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v25, v29, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(obj);
          v13 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend_objectForKeyedSubscript_(self->_cachedPeripherals, v9, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v14, v15, (uint64_t)CFSTR("data"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          chipWorkQueue = self->_chipWorkQueue;
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = sub_2341C23F8;
          block[3] = &unk_2504EE5A0;
          v23 = v13;
          v24 = a3;
          v22 = v16;
          v18 = v16;
          dispatch_async(chipWorkQueue, block);

        }
        v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v25, v29, 16);
      }
      while (v10);
    }

    self->_scannerDelegate = a3;
  }
  if (v19)
  {
    self->_currentMode = 2;
    objc_msgSend_setupTimer_(self, v6, 120);
  }
  else
  {
    self->_currentMode = 1;
    objc_msgSend_clearTimer(self, v6, v7);
  }
}

- (void)updateWithDiscriminator:(const SetupDiscriminator *)a3
{
  unsigned __int16 mDiscriminator;
  NSMutableDictionary *v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  _DWORD *v19;
  const char *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  const char *v26;
  const char *v27;
  uint64_t v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  _BYTE v35[12];
  char v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_detachScannerDelegate(self, a2, (uint64_t)a3);
  mDiscriminator = a3->mDiscriminator;
  self->_deviceDiscriminator.mIsShortDiscriminator = a3->mIsShortDiscriminator;
  self->_deviceDiscriminator.mDiscriminator = mDiscriminator;
  self->_currentMode = 3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = self->_cachedPeripherals;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v30, v37, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v31;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(self->_cachedPeripherals, v8, (uint64_t)v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v13, v14, (uint64_t)CFSTR("data"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v16 = objc_retainAutorelease(v15);
        v19 = (_DWORD *)objc_msgSend_bytes(v16, v17, v18);
        if (objc_msgSend_checkDiscriminator_(self, v20, (*v19 >> 8) & 0xFFF))
        {
          v21 = v12;

          goto LABEL_11;
        }

      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v30, v37, 16);
      if (v9)
        continue;
      break;
    }
  }
  v21 = 0;
LABEL_11:

  objc_msgSend_removePeripheralsFromCache(self, v22, v23);
  if (v21)
  {
    *(_DWORD *)buf = 0;
    *(_QWORD *)&v35[4] = "dwnpm_ble_discovered_matching_peripheral";
    v36 = 0;
    sub_2341C4BEC((uint64_t)buf);
    sub_234117B80(2u, "Ble");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v35 = v21;
      _os_log_impl(&dword_233BF3000, v25, OS_LOG_TYPE_DEFAULT, "Connecting to cached device: %p", buf, 0xCu);
    }

    if (sub_234114844(2u))
    {
      v29 = v21;
      sub_2341147D0(2u, 2);
    }
    objc_msgSend_connect_(self, v26, (uint64_t)v21, v29);
    objc_msgSend_stopScanning(self, v27, v28);
  }
  else
  {
    objc_msgSend_setupTimer_(self, v24, 60);
  }

}

- (void)updateWithPeripheral:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  _BYTE v13[12];
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_detachScannerDelegate(self, v5, v6);
  self->_currentMode = 3;
  *(_DWORD *)buf = 0;
  *(_QWORD *)&v13[4] = "dwnpm_ble_discovered_matching_peripheral";
  v14 = 0;
  sub_2341C4BEC((uint64_t)buf);
  sub_234117B80(2u, "Ble");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v13 = v4;
    _os_log_impl(&dword_233BF3000, v7, OS_LOG_TYPE_DEFAULT, "Connecting to device: %p", buf, 0xCu);
  }

  if (sub_234114844(2u))
  {
    v11 = v4;
    sub_2341147D0(2u, 2);
  }
  objc_msgSend_connect_(self, v8, (uint64_t)v4, v11);
  objc_msgSend_stopScanning(self, v9, v10);

}

- (void)addPeripheralToCache:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  int isEqualToData;
  const char *v16;
  NSObject *v17;
  void *v18;
  const char *v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  BleScannerDelegate *scannerDelegate;
  uint64_t v24;
  NSObject *chipWorkQueue;
  dispatch_time_t v26;
  const char *v27;
  void *v28;
  _BOOL4 v29;
  const char *v30;
  int v31;
  void *v32;
  const char *v33;
  id v34;
  const char *v35;
  uint64_t v36;
  unint64_t v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  unint64_t v42;
  id v43;
  uint64_t handler;
  uint64_t v45;
  uint64_t (*v46)(uint64_t);
  void *v47;
  BleConnection *v48;
  id v49;
  _QWORD block[4];
  id v51;
  id v52;
  BleScannerDelegate *v53;
  _QWORD v54[2];
  _QWORD v55[2];
  uint8_t buf[4];
  _BYTE v57[12];
  int v58;
  char v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend_objectForKey_(self->_cachedPeripherals, v8, (uint64_t)v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend_objectForKeyedSubscript_(self->_cachedPeripherals, v10, (uint64_t)v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v11, v12, (uint64_t)CFSTR("data"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    isEqualToData = objc_msgSend_isEqualToData_(v7, v14, (uint64_t)v13);

    if ((isEqualToData & 1) == 0)
    {
      sub_234117B80(2u, "Ble");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v57 = v6;
        _os_log_impl(&dword_233BF3000, v17, OS_LOG_TYPE_DEFAULT, "Updating peripheral %p from the cache", buf, 0xCu);
      }

      if (sub_234114844(2u))
      {
        v43 = v6;
        sub_2341147D0(2u, 2);
      }
    }
    objc_msgSend_objectForKeyedSubscript_(self->_cachedPeripherals, v16, (uint64_t)v6, v43);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v18, v19, (uint64_t)CFSTR("timer"));
    v20 = objc_claimAutoreleasedReturnValue();

    v21 = isEqualToData ^ 1;
  }
  else
  {
    sub_234117B80(2u, "Ble");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v57 = v6;
      _os_log_impl(&dword_233BF3000, v22, OS_LOG_TYPE_DEFAULT, "Adding peripheral %p to the cache", buf, 0xCu);
    }

    if (sub_234114844(2u))
    {
      v43 = v6;
      sub_2341147D0(2u, 2);
    }
    scannerDelegate = self->_scannerDelegate;
    v24 = MEMORY[0x24BDAC760];
    if (scannerDelegate)
    {
      chipWorkQueue = self->_chipWorkQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_2341C2EEC;
      block[3] = &unk_2504EE5A0;
      v51 = v7;
      v53 = scannerDelegate;
      v52 = v6;
      dispatch_async(chipWorkQueue, block);

    }
    v20 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_workQueue);
    handler = v24;
    v45 = 3221225472;
    v46 = sub_2341C2F38;
    v47 = &unk_2504EE768;
    v48 = self;
    v49 = v6;
    dispatch_source_set_event_handler(v20, &handler);
    dispatch_resume(v20);

    v21 = 1;
  }
  v26 = dispatch_walltime(0, 9000000000);
  dispatch_source_set_timer(v20, v26, 0xFFFFFFFFFFFFFFFFLL, 0x12A05F200uLL);
  objc_msgSend_objectForKeyedSubscript_(self->_cachedPeripherals, v27, (uint64_t)v6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28 == 0;

  if (v29)
  {
    v31 = self->_totalDevicesAdded + 1;
    self->_totalDevicesAdded = v31;
    *(_DWORD *)buf = 2;
    *(_QWORD *)&v57[4] = "dwnpm_ble_peripheral_added";
    v58 = v31;
    v59 = 1;
    sub_2341C4BEC((uint64_t)buf);
  }
  v54[0] = CFSTR("data");
  v54[1] = CFSTR("timer");
  v55[0] = v7;
  v55[1] = v20;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v30, (uint64_t)v55, v54, 2, v43, handler, v45, v46, v47, v48);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(self->_cachedPeripherals, v33, (uint64_t)v32, v6);

  if (v21)
  {
    v34 = objc_retainAutorelease(v7);
    v37 = *(_QWORD *)objc_msgSend_bytes(v34, v35, v36);
    sub_234117B80(2u, "Ble");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v57 = (v37 >> 20) & 0xF;
      _os_log_impl(&dword_233BF3000, v38, OS_LOG_TYPE_DEFAULT, "  - Version: %u", buf, 8u);
    }

    if (sub_234114844(2u))
      sub_2341147D0(2u, 2);
    sub_234117B80(2u, "Ble");
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v57 = (v37 >> 8) & 0xFFF;
      _os_log_impl(&dword_233BF3000, v39, OS_LOG_TYPE_DEFAULT, "  - Discriminator: %u", buf, 8u);
    }

    if (sub_234114844(2u))
      sub_2341147D0(2u, 2);
    sub_234117B80(2u, "Ble");
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v57 = (unsigned __int16)(v37 >> 24);
      _os_log_impl(&dword_233BF3000, v40, OS_LOG_TYPE_DEFAULT, "  - VendorId: %u", buf, 8u);
    }

    if (sub_234114844(2u))
      sub_2341147D0(2u, 2);
    sub_234117B80(2u, "Ble");
    v41 = objc_claimAutoreleasedReturnValue();
    v42 = v37 >> 40;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v57 = (unsigned __int16)v42;
      _os_log_impl(&dword_233BF3000, v41, OS_LOG_TYPE_DEFAULT, "  - ProductId: %u", buf, 8u);
    }

    if (sub_234114844(2u))
      sub_2341147D0(2u, 2);
  }

}

- (void)removePeripheralFromCache:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  const char *v10;
  BleScannerDelegate *scannerDelegate;
  NSObject *chipWorkQueue;
  id v13;
  _QWORD block[4];
  id v15;
  BleScannerDelegate *v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend_objectForKey_(self->_cachedPeripherals, v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    sub_234117B80(2u, "Ble");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v18 = v4;
      _os_log_impl(&dword_233BF3000, v7, OS_LOG_TYPE_DEFAULT, "Removing peripheral %p from the cache", buf, 0xCu);
    }

    if (sub_234114844(2u))
    {
      v13 = v4;
      sub_2341147D0(2u, 2);
    }
    objc_msgSend_objectForKeyedSubscript_(v6, v8, (uint64_t)CFSTR("timer"), v13);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v9);

    objc_msgSend_removeObjectForKey_(self->_cachedPeripherals, v10, (uint64_t)v4);
    scannerDelegate = self->_scannerDelegate;
    if (scannerDelegate)
    {
      chipWorkQueue = self->_chipWorkQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_2341C3148;
      block[3] = &unk_2504F49E0;
      v16 = scannerDelegate;
      v15 = v4;
      dispatch_async(chipWorkQueue, block);

    }
  }

}

- (void)removePeripheralsFromCache
{
  uint64_t v2;
  void *v4;
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend_allKeys(self->_cachedPeripherals, a2, v2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend_removePeripheralFromCache_(self, v6, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v10, v14, 16);
    }
    while (v7);
  }

}

+ (void)fillServiceWithCharacteristicUuids:(id)a3 svcId:(ChipBleUUID *)a4 charId:(ChipBleUUID *)a5
{
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  id v45;
  const char *v46;
  uint64_t v47;
  const void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  size_t v60;
  NSObject *v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  NSObject *v68;
  uint8_t v69[16];
  ChipBleUUID __dst;
  uint64_t v71;

  v71 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  objc_msgSend_UUID(v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_data(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend_length(v13, v14, v15);

  if (v16 == 16)
  {
    objc_msgSend_UUID(v7, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_data(v19, v20, v21);
    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *a5 = *(ChipBleUUID *)objc_msgSend_bytes(v22, v23, v24);

    *(_QWORD *)a4->var0 = 0;
    *(_QWORD *)&a4->var0[8] = 0;
    __dst = (ChipBleUUID)xmmword_2342ED9B0;
    objc_msgSend_service(v7, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUID(v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_data(v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend_length(v33, v34, v35);

    if (v36 == 2)
    {
      objc_msgSend_service(v7, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_UUID(v39, v62, v63);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_data(v42, v64, v65);
      v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_WORD *)&__dst.var0[2] = *(_WORD *)objc_msgSend_bytes(v45, v66, v67);
    }
    else
    {
      if (v36 != 4 && v36 != 16)
      {
        sub_234117B80(2u, "Ble");
        v68 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v69 = 0;
          _os_log_impl(&dword_233BF3000, v68, OS_LOG_TYPE_ERROR, "Service UUIDs are incompatible", v69, 2u);
        }

        if (sub_234114844(1u))
          sub_2341147D0(2u, 1);
        goto LABEL_12;
      }
      objc_msgSend_service(v7, v37, v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_UUID(v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_data(v42, v43, v44);
      v45 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v48 = (const void *)objc_msgSend_bytes(v45, v46, v47);
      objc_msgSend_service(v7, v49, v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_UUID(v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_data(v54, v55, v56);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = objc_msgSend_length(v57, v58, v59);
      memcpy(&__dst, v48, v60);

    }
LABEL_12:
    *a4 = __dst;
    goto LABEL_13;
  }
  sub_234117B80(2u, "Ble");
  v61 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)__dst.var0 = 0;
    _os_log_impl(&dword_233BF3000, v61, OS_LOG_TYPE_ERROR, "UUID of characteristic is incompatible", __dst.var0, 2u);
  }

  if (sub_234114844(1u))
    sub_2341147D0(2u, 1);
LABEL_13:

}

- (void)setBleLayer:(BleLayer *)a3
{
  self->_mBleLayer = a3;
}

- (OS_dispatch_queue)chipWorkQueue
{
  return self->_chipWorkQueue;
}

- (void)setChipWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_chipWorkQueue, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (void)setCentralManager:(id)a3
{
  objc_storeStrong((id *)&self->_centralManager, a3);
}

- (CBPeripheral)peripheral
{
  return self->_peripheral;
}

- (void)setPeripheral:(id)a3
{
  objc_storeStrong((id *)&self->_peripheral, a3);
}

- (CBUUID)shortServiceUUID
{
  return self->_shortServiceUUID;
}

- (void)setShortServiceUUID:(id)a3
{
  objc_storeStrong((id *)&self->_shortServiceUUID, a3);
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (unsigned)currentMode
{
  return self->_currentMode;
}

- (NSMutableDictionary)cachedPeripherals
{
  return self->_cachedPeripherals;
}

- (void)setCachedPeripherals:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPeripherals, a3);
}

- (BOOL)found
{
  return self->_found;
}

- (void)setFound:(BOOL)a3
{
  self->_found = a3;
}

- (SetupDiscriminator)deviceDiscriminator
{
  return self->_deviceDiscriminator;
}

- (void)setDeviceDiscriminator:(SetupDiscriminator)a3
{
  self->_deviceDiscriminator = a3;
}

- (void)appState
{
  return self->_appState;
}

- (void)setAppState:(void *)a3
{
  self->_appState = a3;
}

- (void)onConnectionComplete
{
  return self->_onConnectionComplete;
}

- (void)setOnConnectionComplete:(void *)a3
{
  self->_onConnectionComplete = a3;
}

- (void)onConnectionError
{
  return self->_onConnectionError;
}

- (void)setOnConnectionError:(void *)a3
{
  self->_onConnectionError = a3;
}

- (BleScannerDelegate)scannerDelegate
{
  return self->_scannerDelegate;
}

- (void)setScannerDelegate:(BleScannerDelegate *)a3
{
  self->_scannerDelegate = a3;
}

- (BleLayer)mBleLayer
{
  return self->_mBleLayer;
}

- (void)setMBleLayer:(BleLayer *)a3
{
  self->_mBleLayer = a3;
}

- (int)totalDevicesAdded
{
  return self->_totalDevicesAdded;
}

- (int)totalDevicesRemoved
{
  return self->_totalDevicesRemoved;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPeripherals, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_shortServiceUUID, 0);
  objc_storeStrong((id *)&self->_peripheral, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_chipWorkQueue, 0);
}

- (id).cxx_construct
{
  *((_WORD *)self + 5) = 0;
  *((_BYTE *)self + 12) = 0;
  return self;
}

@end
