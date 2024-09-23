uint64_t MyH11ANEDeviceMessageNotification(H11ANE::H11ANEDevice *a1, int a2, void *a3, _QWORD *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL8 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BOOL8 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, _QWORD *, _QWORD, uint64_t *);
  uint64_t v44;
  uint64_t v46[8];
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v47 = v8;
  v48 = v7;
  v49 = v4;
  v50 = v5;
  v51 = v6;
  switch(a2)
  {
    case -469794815:
      v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      v18 = 0x1000000015;
      if (!v10)
        goto LABEL_12;
      MyH11ANEDeviceMessageNotification(v10, v11, v12, v13, v14, v15, v16, v17);
      if (a4)
        goto LABEL_13;
      return 0;
    case -469794814:
      v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      v18 = 0x1100000015;
      if (!v19)
        goto LABEL_12;
      MyH11ANEDeviceMessageNotification(v19, v20, v21, v22, v23, v24, v25, v26);
      if (a4)
        goto LABEL_13;
      return 0;
    case -469794813:
      v27 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      v18 = 22;
      if (!v27)
        goto LABEL_12;
      MyH11ANEDeviceMessageNotification(v27, v28, v29, v30, v31, v32, v33, v34);
      if (a4)
        goto LABEL_13;
      return 0;
    case -469794812:
      v35 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
      v18 = 23;
      if (v35)
      {
        MyH11ANEDeviceMessageNotification(v35, v36, v37, v38, v39, v40, v41, v42);
        if (!a4)
          return 0;
      }
      else
      {
LABEL_12:
        if (!a4)
          return 0;
      }
LABEL_13:
      v43 = (void (*)(uint64_t, _QWORD *, _QWORD, uint64_t *))a4[3];
      if (v43)
      {
        v44 = a4[2];
        v46[0] = v18;
        v43(v44, a4 + 8, 0, v46);
      }
      return 0;
    default:
      return 0;
  }
}

uint64_t MyH11ANEDeviceMessageNotification()
{
  return 0;
}

uint64_t H11ANE::H11ANEDeviceServiceInterestCallback(uint64_t this, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  if (*(_QWORD *)this)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))this)(this, a3, a4, *(_QWORD *)(this + 8));
  return this;
}

uint64_t H11ANEDeviceOpen(uint64_t *a1, _DWORD *a2, uint64_t a3, uint64_t a4)
{
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  void *v13;
  int H11ANEDeviceController;
  uint64_t v15;
  int Count;
  int v17;
  int v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  int v30;
  uint64_t v31;
  _BOOL8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  CFIndex v41;
  H11ANE::H11ANEDevice *v42;
  NSObject *v43;
  const char *v44;
  H11ANE::H11ANEDevice *v45;
  H11ANE::H11ANEFrameReceiver *v46;
  unint64_t v47;
  H11ANE::H11ANEDevice *v48;
  int v49;
  unsigned int v50;
  int v51;
  int started;
  CFArrayRef *v53;
  __int128 v54;
  char v55;
  int v56;
  __int128 v57;
  int v58;
  _BOOL4 v59;
  int v60;
  _BOOL4 v61;
  uint64_t v62;
  _BOOL8 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  __int128 v71;
  H11ANE::H11ANEDevice *v72;
  H11ANE::H11ANEDevice *v73;
  uint64_t v74;
  int v75;
  int v76;
  H11ANE::H11ANEFrameReceiver *v77;
  CFArrayRef *v78;
  H11ANE::H11ANEDevice *ValueAtIndex;
  uint8_t v80[4];
  int v81;
  __int16 v82;
  int v83;
  uint8_t v84[8];
  __int128 v85;
  void (*v86)(void *, H11ANE::H11ANEFrameReceiverRequest *);
  uint64_t *v87;
  uint64_t v88;
  int v89;
  CFArrayRef v90;
  uint8_t buf[4];
  int v92;
  int v93;
  unsigned int v94;
  uint64_t v95;
  __int128 v96;
  char v97;
  int v98;
  char v99;
  uint64_t v100;

  v100 = *MEMORY[0x24BDAC8D0];
  v78 = 0;
  ValueAtIndex = 0;
  v77 = 0;
  if (!a1)
    return 2;
  v8 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle](ANEServicesLog, "handle"), (const void *)0x61B2400);
  v9 = +[ANEServicesLog handle](ANEServicesLog, "handle");
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v9))
    {
      v11 = *a2;
      *(_DWORD *)buf = 67109120;
      v92 = v11;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "ServicesDeviceOpen", "UsageType=%d", buf, 8u);
    }
  }
  v12 = operator new();
  *(_OWORD *)v12 = 0u;
  *(_OWORD *)(v12 + 16) = 0u;
  *(_OWORD *)(v12 + 32) = 0u;
  *(_OWORD *)(v12 + 48) = 0u;
  *(_OWORD *)(v12 + 64) = 0u;
  *(_OWORD *)(v12 + 80) = 0u;
  *(_OWORD *)(v12 + 96) = 0u;
  *(_OWORD *)(v12 + 112) = 0u;
  *(_OWORD *)(v12 + 128) = 0u;
  H11ANEDeviceController = H11ANE::CreateH11ANEDeviceController((H11ANE *)&v78, (H11ANE::H11ANEDeviceController **)MyH11ANEDeviceControllerNotification, 0, v13);
  if (!v78 || H11ANEDeviceController)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      H11ANEDeviceOpen_cold_2();
    v15 = 6;
    goto LABEL_22;
  }
  *(_QWORD *)v84 = &v77;
  v85 = 0uLL;
  v87 = a1;
  v88 = 0;
  v86 = H11ANEFrameProcDirect;
  v90 = v78[6];
  v89 = a2[4];
  v15 = 1;
  if (H11ANE::CreateH11ANEFrameReceiver((uint64_t)v84) || !v77)
  {
LABEL_22:
    MEMORY[0x20BD010DC](v12, 0x10E0C40B462FC6BLL);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      H11ANEDeviceOpen_cold_1();
    v27 = 0;
    goto LABEL_25;
  }
  Count = CFArrayGetCount(*v78);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v92 = Count;
    _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Total num of devices %d\n", buf, 8u);
  }
  if (!Count)
  {
    v33 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v33)
      H11ANEDeviceOpen_cold_3(v33, v34, v35, v36, v37, v38, v39, v40);
    v15 = 8;
    goto LABEL_22;
  }
  v17 = a2[5];
  v76 = v17;
  v74 = a3;
  v75 = Count;
  v18 = Count - 1;
  if (!v18)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "(Single-ANE System) Opening H11ANE device at index 0\n", buf, 2u);
    }
    ValueAtIndex = (H11ANE::H11ANEDevice *)CFArrayGetValueAtIndex(*v78, 0);
    v15 = H11ANEHandleDeviceOpen((uint64_t)ValueAtIndex, (uint64_t)buf, (uint64_t)a2, v12, (uint64_t)v77);
    if ((_DWORD)v15)
    {
      v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v19)
        H11ANEDeviceOpen_cold_4(v19, v20, v21, v22, v23, v24, v25, v26);
      goto LABEL_49;
    }
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_49;
    *(_WORD *)v80 = 0;
    v43 = MEMORY[0x24BDACB70];
    v44 = "(Single-ANE System) Selected H11ANE device\n";
    goto LABEL_40;
  }
  if (v17)
  {
LABEL_44:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "(Possible Multi-ANE System) LB not found or not hinted\n", buf, 2u);
    }
    if (v17)
      goto LABEL_48;
    goto LABEL_47;
  }
  if (v75 < 1)
  {
    v42 = 0;
LABEL_43:
    ValueAtIndex = v42;
    goto LABEL_44;
  }
  v41 = 0;
  while (1)
  {
    v42 = (H11ANE::H11ANEDevice *)CFArrayGetValueAtIndex(*v78, v41);
    if (*((_DWORD *)v42 + 34) == 1)
      break;
    if (v75 == ++v41)
      goto LABEL_43;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v92 = v41;
    _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "LB Found at index %d\n", buf, 8u);
  }
  if (v75 != 2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "(Multi-ANE System) Opening LB device\n", buf, 2u);
    }
    ValueAtIndex = (H11ANE::H11ANEDevice *)CFArrayGetValueAtIndex(*v78, v41);
    v60 = H11ANEHandleDeviceOpen((uint64_t)ValueAtIndex, (uint64_t)buf, (uint64_t)a2, v12, (uint64_t)v77);
    v61 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if (!v60)
    {
      if (!v61)
        goto LABEL_41;
      *(_WORD *)v80 = 0;
      v43 = MEMORY[0x24BDACB70];
      v44 = "(Multi-ANE System) Selected LB device\n";
LABEL_40:
      _os_log_impl(&dword_207C43000, v43, OS_LOG_TYPE_DEFAULT, v44, v80, 2u);
LABEL_41:
      v15 = 0;
      goto LABEL_49;
    }
    if (v61)
    {
      *(_WORD *)v80 = 0;
      _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "(Multi-ANE System) Could not open LB device, retrying with H11ANE device\n", v80, 2u);
    }
LABEL_47:
    v76 = 1;
LABEL_48:
    v15 = H11ANELocateAndOpenHintedDevice((uint64_t *)&ValueAtIndex, (uint64_t)buf, (uint64_t)a2, v12, v78, (uint64_t)v77, v75, &v76);
    goto LABEL_49;
  }
  if ((H11ANEDeviceOpen::loadBalancerExplicitlyEnabled & 1) != 0)
  {
LABEL_72:
    v56 = 0;
    v72 = (H11ANE::H11ANEDevice *)CFArrayGetValueAtIndex(*v78, v41);
    ValueAtIndex = v72;
    *(_QWORD *)&v57 = 67109376;
    v71 = v57;
    do
    {
      v58 = H11ANEHandleDeviceOpen((uint64_t)v72, (uint64_t)buf, (uint64_t)a2, v12, (uint64_t)v77);
      if (!v58)
      {
        v15 = 0;
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_49;
        *(_WORD *)v80 = 0;
        v43 = MEMORY[0x24BDACB70];
        v44 = "(Single-ANE System with LB) Selected LB device\n";
        goto LABEL_40;
      }
      if (v58 == 23)
        break;
      H11ANE::H11ANEDevice::H11ANEDeviceClose(v72);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v80 = v71;
        v81 = v56;
        v82 = 1024;
        v83 = 10;
        _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "(Single-ANE System with LB) Couldn't open LB, retry %d out of %d\n", v80, 0xEu);
      }
      usleep(1u);
      ++v56;
    }
    while (v56 != 10);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v80 = 0;
      _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "(Single-ANE System with LB) Couldn't open LB device. Opening H11ANE device\n", v80, 2u);
    }
    ValueAtIndex = (H11ANE::H11ANEDevice *)CFArrayGetValueAtIndex(*v78, (_DWORD)v41 == 0);
    v15 = H11ANEHandleDeviceOpen((uint64_t)ValueAtIndex, (uint64_t)buf, (uint64_t)a2, v12, (uint64_t)v77);
    v59 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    if ((_DWORD)v15)
    {
      if (v59)
      {
        *(_WORD *)v80 = 0;
        _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "(Single-ANE System with LB) Critical Error: Could not open the only H11ANE device\n", v80, 2u);
      }
      goto LABEL_49;
    }
    if (!v59)
      goto LABEL_41;
    *(_WORD *)v80 = 0;
    v43 = MEMORY[0x24BDACB70];
    v44 = "(Single-ANE System with LB) Selected H11ANE device\n";
    goto LABEL_40;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "(Single-ANE System with LB) Opening H11ANE device\n", buf, 2u);
  }
  ValueAtIndex = (H11ANE::H11ANEDevice *)CFArrayGetValueAtIndex(*v78, (_DWORD)v41 == 0);
  v73 = ValueAtIndex;
  v62 = H11ANEHandleDeviceOpen((uint64_t)ValueAtIndex, (uint64_t)buf, (uint64_t)a2, v12, (uint64_t)v77);
  if (!(_DWORD)v62)
  {
    if ((H11ANEDeviceOpen::loadBalancerExplicitlyEnabled & 1) == 0 && !v99)
    {
      v15 = 0;
      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        goto LABEL_49;
      *(_WORD *)v80 = 0;
      v43 = MEMORY[0x24BDACB70];
      v44 = "(Single-ANE System with LB) Selected H11ANE device\n";
      goto LABEL_40;
    }
    if ((H11ANEDeviceOpen::loadBalancerExplicitlyEnabled & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v80 = 0;
        _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "(Single-ANE System with LB) LB explicitly enabled, closing H11ANE device and trying to open LB device\n", v80, 2u);
      }
      H11ANE::H11ANEDevice::H11ANEDeviceClose(v73);
      H11ANEDeviceOpen::loadBalancerExplicitlyEnabled = 1;
    }
    goto LABEL_72;
  }
  v15 = v62;
  v63 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v63)
    H11ANEDeviceOpen_cold_5(v63, v64, v65, v66, v67, v68, v69, v70);
LABEL_49:
  if (*a2 == 2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v80 = 67109120;
      v81 = 2;
      _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Open with usage type: %d\n", v80, 8u);
    }
    v45 = ValueAtIndex;
    if (*((_DWORD *)ValueAtIndex + 34) == 1)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v80 = 0;
        _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Device call ANE_LoadFirmware from LoadBalancer H11ANEDeviceOpen\n", v80, 2u);
      }
      if (v75 >= 2)
      {
        do
        {
          H11ANE::H11ANEDevice::ANE_LoadFirmware(v45);
          --v18;
        }
        while (v18);
      }
    }
  }
  else
  {
    v45 = ValueAtIndex;
  }
  H11ANE::H11ANEFrameReceiver::registerH11ANEDevice((uint64_t)v77, (uint64_t)v45);
  if ((_DWORD)v15 || *a2 != 1)
  {
    H11ANE::DestroyH11ANEFrameReceiver(v77, v46);
  }
  else
  {
    v49 = v93;
    v50 = v94;
    *(_DWORD *)(v12 + 104) = v93;
    *(_DWORD *)(v12 + 108) = v50;
    v51 = v95;
    *(_QWORD *)(v12 + 120) = v95;
    *(_OWORD *)(v12 + 128) = v96;
    AllocateStatsBufferPool((H11ANE::H11ANEFrameReceiverBufferPool **)(v12 + 112), v51 + v49, v50, v47, v48);
    started = H11ANE::H11ANEFrameReceiver::startReceive(v77);
    v15 = IOReturnToANEReturn(started);
  }
  v53 = v78;
  *(_QWORD *)v12 = v78;
  if ((_DWORD)v15)
    goto LABEL_22;
  *(_QWORD *)v12 = v53;
  *(_QWORD *)(v12 + 8) = v45;
  *(_QWORD *)(v12 + 96) = v77;
  v54 = *((_OWORD *)a2 + 1);
  *(_OWORD *)(v12 + 32) = *(_OWORD *)a2;
  *(_OWORD *)(v12 + 48) = v54;
  *(_QWORD *)(v12 + 16) = v74;
  *(_QWORD *)(v12 + 24) = a4;
  *(_QWORD *)(v12 + 64) = aneDeviceVTable;
  v27 = v12 + 64;
  *(_QWORD *)(v12 + 80) = v12;
  if (*((_DWORD *)v45 + 34) == 1)
    v55 = v97;
  else
    v55 = 1;
  *(_BYTE *)(v12 + 88) = v55;
  *(_DWORD *)(v12 + 92) = v98;
LABEL_25:
  *a1 = v27;
  v28 = +[ANEServicesLog handle](ANEServicesLog, "handle", v71);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v29 = v28;
    if (os_signpost_enabled(v28))
    {
      v30 = *a2;
      v31 = *a1;
      *(_DWORD *)v84 = 67109376;
      *(_DWORD *)&v84[4] = v30;
      LOWORD(v85) = 2048;
      *(_QWORD *)((char *)&v85 + 2) = v31;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v29, OS_SIGNPOST_INTERVAL_END, v8, "ServicesDeviceOpen", "UsageType=%d, deviceId=%llx", v84, 0x12u);
    }
  }
  return v15;
}

uint64_t H11ANE::CreateH11ANEDeviceController(H11ANE *this, H11ANE::H11ANEDeviceController **a2, int (*a3)(H11ANE::H11ANEDeviceController *, void *, H11ANE::H11ANEDevice *), void *a4)
{
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  sched_param v13;
  pthread_t v14;
  _QWORD v15[4];
  pthread_mutex_t v16;
  pthread_attr_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  H11ANE::H11ANEThreadReadySyncer::H11ANEThreadReadySyncer((H11ANE::H11ANEThreadReadySyncer *)&v16);
  v15[0] = 0;
  v15[1] = a2;
  v15[2] = a3;
  v15[3] = &v16;
  v7 = pthread_attr_init(&v17);
  if (v7)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "pthread_attr_init() failed. Error: %d\n", v7);
    goto LABEL_12;
  }
  v13 = (sched_param)58;
  if (pthread_attr_setschedparam(&v17, &v13))
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "pthread_attr_setschedparam() failed. Error: %d\n");
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  if (pthread_attr_setdetachstate(&v17, 1))
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "pthread_attr_setdetachstate() failed. Error: %d\n");
    goto LABEL_9;
  }
  if (pthread_create(&v14, &v17, (void *(__cdecl *)(void *))H11ANE::H11ANEServicesThreadStart, v15))
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "pthread_create() failed. Error: %d\n");
    goto LABEL_9;
  }
  v8 = 1;
LABEL_10:
  pthread_attr_destroy(&v17);
  if (v8)
  {
    H11ANE::H11ANEThreadReadySyncer::wait(&v16);
    v9 = 0;
    goto LABEL_13;
  }
LABEL_12:
  v9 = 1;
LABEL_13:
  v10 = v15[0];
  *(_QWORD *)this = v15[0];
  if (!v10)
    v9 = 1;
  if (v9)
    v11 = 3758097084;
  else
    v11 = 0;
  H11ANE::H11ANEThreadReadySyncer::~H11ANEThreadReadySyncer((H11ANE::H11ANEThreadReadySyncer *)&v16);
  return v11;
}

void sub_207C45AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  H11ANE::H11ANEThreadReadySyncer::~H11ANEThreadReadySyncer((H11ANE::H11ANEThreadReadySyncer *)va);
  _Unwind_Resume(a1);
}

uint64_t H11ANE::CreateH11ANEFrameReceiver(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t v4;

  v2 = operator new();
  H11ANE::H11ANEFrameReceiver::H11ANEFrameReceiver((H11ANE::H11ANEFrameReceiver *)v2, *(H11ANE::H11ANEDevice **)(a1 + 8));
  v3 = *(const void **)(a1 + 56);
  *(_QWORD *)(v2 + 8) = v3;
  *(_DWORD *)(v2 + 16) = *(_DWORD *)(a1 + 48);
  CFRetain(v3);
  if (!H11ANE::H11ANEFrameReceiver::addIODispatcherToRunLoop((H11ANE::H11ANEFrameReceiver *)v2))
  {
    *(int8x16_t *)(v2 + 24) = vextq_s8(*(int8x16_t *)(a1 + 24), *(int8x16_t *)(a1 + 24), 8uLL);
    v4 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(v2 + 40) = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(v2 + 48) = v4;
  }
  **(_QWORD **)a1 = v2;
  if (**(_QWORD **)a1)
    return 0;
  else
    return 3758097084;
}

void sub_207C45B78(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD010DC](v1, 0x10A0C4085C1416BLL);
  _Unwind_Resume(a1);
}

void H11ANE::H11ANEThreadReadySyncer::~H11ANEThreadReadySyncer(H11ANE::H11ANEThreadReadySyncer *this)
{
  pthread_cond_destroy((pthread_cond_t *)((char *)this + 64));
  pthread_mutex_destroy((pthread_mutex_t *)this);
}

H11ANE::H11ANEThreadReadySyncer *H11ANE::H11ANEThreadReadySyncer::H11ANEThreadReadySyncer(H11ANE::H11ANEThreadReadySyncer *this)
{
  pthread_mutex_init((pthread_mutex_t *)this, 0);
  pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0);
  pthread_mutex_lock((pthread_mutex_t *)this);
  return this;
}

uint64_t H11ANE::H11ANEThreadReadySyncer::wait(pthread_mutex_t *this)
{
  return pthread_cond_wait((pthread_cond_t *)&this[1], this);
}

H11ANE::H11ANEFrameReceiver *H11ANE::H11ANEFrameReceiver::H11ANEFrameReceiver(H11ANE::H11ANEFrameReceiver *this, H11ANE::H11ANEDevice *a2)
{
  pthread_mutexattr_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)this = 0;
  *((_BYTE *)this + 248) = 0;
  *((_QWORD *)this + 41) = 0;
  *((_DWORD *)this + 84) = 0;
  *((_QWORD *)this + 43) = 0;
  *((_QWORD *)this + 44) = a2;
  *(_OWORD *)((char *)this + 360) = 0u;
  *(_OWORD *)((char *)this + 376) = 0u;
  *(_OWORD *)((char *)this + 392) = 0u;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 6) = 0;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 112), 0);
  pthread_mutex_init((pthread_mutex_t *)this + 4, 0);
  *((_DWORD *)this + 14) = 0;
  pthread_cond_init((pthread_cond_t *)((char *)this + 64), 0);
  *((_QWORD *)this + 40) = 0;
  *((_QWORD *)this + 52) = 0;
  pthread_mutexattr_init(&v4);
  pthread_mutexattr_settype(&v4, 2);
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 176), &v4);
  pthread_mutexattr_destroy(&v4);
  *((_QWORD *)this + 30) = dispatch_semaphore_create(0);
  return this;
}

void sub_207C45D04(_Unwind_Exception *a1)
{
  _QWORD *v1;

  std::deque<H11ANE::H11ANEFrameReceiverRequest *>::~deque[abi:ne180100](v1);
  _Unwind_Resume(a1);
}

uint64_t H11ANE::H11ANEFrameReceiver::addIODispatcherToRunLoop(H11ANE::H11ANEFrameReceiver *this)
{
  uint64_t v2;
  const __CFAllocator *v3;
  __CFMachPort *v4;
  __CFRunLoopSource *RunLoopSource;
  Boolean shouldFreeInfo;
  CFMachPortContext context;

  v2 = IOCreateReceivePort(0x39u, (mach_port_t *)this + 84);
  if (!(_DWORD)v2)
  {
    v2 = 3758097085;
    shouldFreeInfo = 0;
    context.version = 1;
    context.info = this;
    memset(&context.retain, 0, 24);
    v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v4 = CFMachPortCreateWithPort((CFAllocatorRef)*MEMORY[0x24BDBD240], *((_DWORD *)this + 84), MEMORY[0x24BDD7FD8], &context, &shouldFreeInfo);
    *((_QWORD *)this + 41) = v4;
    if (v4)
    {
      RunLoopSource = CFMachPortCreateRunLoopSource(v3, v4, 0);
      *((_QWORD *)this + 43) = RunLoopSource;
      if (RunLoopSource)
      {
        CFRunLoopAddSource(*((CFRunLoopRef *)this + 1), RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
        return 0;
      }
    }
  }
  return v2;
}

uint64_t H11ANE::H11ANEFrameReceiver::registerH11ANEDevice(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 352) = a2;
  return 0;
}

uint64_t H11ANEHandleDeviceOpen(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v7;
  _BOOL4 v8;
  uint64_t result;
  uint32_t v10;
  NSObject *v11;
  const char *v12;
  _BOOL4 v13;
  uint32_t v14;
  int v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)(a2 + 64) = 0u;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_QWORD *)a2 = *(_QWORD *)(a3 + 8);
  *(_DWORD *)(a2 + 24) = *(_DWORD *)(a3 + 24);
  *(_QWORD *)(a2 + 8) = H11ANE::H11ANEFrameReceiver::FrameDone;
  *(_QWORD *)(a2 + 16) = a5;
  v7 = H11ANE::H11ANEDevice::H11ANEDeviceOpen(a1, (uint64_t)MyH11ANEDeviceMessageNotification, a4, *(_DWORD *)a3, (__int128 *)a2);
  if (*(_DWORD *)(a1 + 136) == 1)
  {
    if (v7 == -536870174)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v15 = 67109120;
        v16 = -536870174;
        _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Could not open LB (possible missing entitlement) - status=0x%x", (uint8_t *)&v15, 8u);
      }
      return 23;
    }
    else if (v7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        H11ANEHandleDeviceOpen_cold_1();
      if (v7 <= -536870185)
      {
        switch(v7)
        {
          case -536870211:
            return 1;
          case -536870210:
            return 5;
          case -536870209:
          case -536870208:
          case -536870205:
          case -536870204:
          case -536870203:
          case -536870202:
            goto LABEL_42;
          case -536870207:
            return 20;
          case -536870206:
            return 2;
          case -536870201:
            return 24;
          default:
            goto LABEL_26;
        }
      }
      result = 4;
      switch(v7)
      {
        case -536870176:
          return 26;
        case -536870175:
        case -536870174:
        case -536870172:
        case -536870171:
        case -536870170:
        case -536870168:
        case -536870167:
        case -536870166:
        case -536870164:
        case -536870161:
          goto LABEL_42;
        case -536870173:
          return 10;
        case -536870169:
          return 29;
        case -536870165:
          return 21;
        case -536870163:
          return 27;
        case -536870162:
          return 28;
        case -536870160:
          return result;
        default:
          if (v7 != -536870184)
            goto LABEL_42;
          goto LABEL_43;
      }
    }
    else
    {
      v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (v8)
      {
        v10 = *(_DWORD *)a3;
        v15 = 67109120;
        v16 = v10;
        v11 = MEMORY[0x24BDACB70];
        v12 = "LB Device Open succeeded with usage type: %d\n";
LABEL_13:
        _os_log_impl(&dword_207C43000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v15, 8u);
        return 0;
      }
    }
  }
  else if (v7)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      H11ANEHandleDeviceOpen_cold_2();
    if (v7 > -536870185)
    {
      result = 4;
      switch(v7)
      {
        case -536870176:
          return 26;
        case -536870175:
        case -536870172:
        case -536870171:
        case -536870170:
        case -536870168:
        case -536870167:
        case -536870166:
        case -536870164:
        case -536870161:
          goto LABEL_42;
        case -536870174:
          return 23;
        case -536870173:
          return 10;
        case -536870169:
          return 29;
        case -536870165:
          return 21;
        case -536870163:
          return 27;
        case -536870162:
          return 28;
        case -536870160:
          return result;
        default:
          if (v7 == -536870184)
LABEL_43:
            result = 22;
          else
LABEL_42:
            result = 18;
          break;
      }
    }
    else
    {
      switch(v7)
      {
        case -536870211:
          return 1;
        case -536870210:
          return 5;
        case -536870209:
        case -536870208:
        case -536870205:
        case -536870204:
        case -536870203:
        case -536870202:
          goto LABEL_42;
        case -536870207:
          return 20;
        case -536870206:
          return 2;
        case -536870201:
          return 24;
        default:
LABEL_26:
          if (v7 == -536870191)
          {
            result = 19;
          }
          else
          {
            if (v7 != -536870186)
              goto LABEL_42;
            result = 15;
          }
          break;
      }
    }
  }
  else
  {
    v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
    result = 0;
    if (v13)
    {
      v14 = *(_DWORD *)a3;
      v15 = 67109120;
      v16 = v14;
      v11 = MEMORY[0x24BDACB70];
      v12 = "H11ANE Device Open succeeded with usage type: %d\n";
      goto LABEL_13;
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::H11ANEDeviceOpen(uint64_t a1, uint64_t a2, uint64_t a3, uint32_t a4, __int128 *a5)
{
  __int128 *v5;
  uint64_t v10;
  mach_port_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v27;
  _DWORD *v28;
  size_t outputStructCnt;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  uint32_t v37;
  int v38;
  uint64_t v39;

  v5 = a5;
  v39 = *MEMORY[0x24BDAC8D0];
  if (!a5)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v5 = &v30;
    DWORD2(v31) = -1;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v37 = a4;
    _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "H11ANEDevice::H11ANEDeviceOpen, usage type: %d\n", buf, 8u);
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 72));
  if (*(_DWORD *)(a1 + 64))
  {
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 72));
    return 3758097093;
  }
  else
  {
    v10 = IOServiceOpen(*(_DWORD *)(a1 + 56), *MEMORY[0x24BDAEC58], a4, (io_connect_t *)(a1 + 64));
    v11 = *(_DWORD *)(a1 + 64);
    if (!v11 || (_DWORD)v10)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        H11ANE::H11ANEDevice::H11ANEDeviceOpen(v10, v19, v20, v21, v22, v23, v24, v25);
    }
    else
    {
      outputStructCnt = 96;
      v10 = IOConnectCallStructMethod(v11, 0, v5, 0x60uLL, v5, &outputStructCnt);
      if ((_DWORD)v10)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          H11ANE::H11ANEDevice::H11ANEDeviceOpen(v10, v12, v13, v14, v15, v16, v17, v18);
      }
      else
      {
        v27 = *((unsigned __int8 *)v5 + 28);
        *(_BYTE *)(a1 + 24) = v27;
        *(_QWORD *)a1 = a2;
        *(_QWORD *)(a1 + 8) = a3;
        if (*(_DWORD *)(a1 + 136) != 1)
        {
          v28 = (_DWORD *)(a1 + 28);
          if (v27)
          {
            H11ANE::H11ANEDevice::ANE_GetVersion(a1, v28);
            H11ANE::H11ANEDevice::ANE_GetStatus(a1, buf);
            *(_DWORD *)(a1 + 32) = v38;
          }
          else
          {
            *(_QWORD *)v28 = *(_QWORD *)((char *)v5 + 76);
          }
        }
      }
    }
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 72));
  }
  return v10;
}

uint64_t H11ANE::H11ANEFrameReceiver::startReceive(H11ANE::H11ANEFrameReceiver *this)
{
  os_signpost_id_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v9[16];
  uint8_t buf[16];

  v2 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle](ANEServicesLog, "handle"), (const void *)0x61B2200);
  v3 = +[ANEServicesLog handle](ANEServicesLog, "handle");
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v3;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "H11ANEFrameReceiverStart", (const char *)&unk_207C6A44A, buf, 2u);
    }
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 112));
  if (*(_DWORD *)this == 1)
  {
    v5 = 3758097122;
  }
  else
  {
    v5 = 0;
    *((_BYTE *)this + 408) = 0;
    *(_DWORD *)this = 1;
  }
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 112));
  v6 = +[ANEServicesLog handle](ANEServicesLog, "handle");
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v7 = v6;
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v7, OS_SIGNPOST_INTERVAL_END, v2, "H11ANEFrameReceiverStart", (const char *)&unk_207C6A44A, v9, 2u);
    }
  }
  return v5;
}

uint64_t IOReturnToANEReturn(int a1)
{
  int v1;
  uint64_t result;

  if (a1 <= -536870185)
  {
    switch(a1)
    {
      case -536870211:
        result = 1;
        break;
      case -536870210:
        result = 5;
        break;
      case -536870209:
      case -536870208:
      case -536870205:
      case -536870204:
      case -536870203:
      case -536870202:
        goto LABEL_13;
      case -536870207:
        result = 20;
        break;
      case -536870206:
        result = 2;
        break;
      case -536870201:
        result = 24;
        break;
      default:
        if (a1 == -536870191)
        {
          result = 19;
        }
        else if (a1 == -536870186)
        {
          result = 15;
        }
        else
        {
LABEL_13:
          result = 18;
        }
        break;
    }
  }
  else
  {
    v1 = a1 + 536870176;
    result = 4;
    switch(v1)
    {
      case 0:
        result = 26;
        break;
      case 2:
        result = 23;
        break;
      case 3:
        result = 10;
        break;
      case 7:
        result = 29;
        break;
      case 11:
        result = 21;
        break;
      case 13:
        result = 27;
        break;
      case 14:
        result = 28;
        break;
      case 16:
        return result;
      default:
        goto LABEL_13;
    }
  }
  return result;
}

uint64_t H11ANE::DestroyH11ANEFrameReceiver(H11ANE *this, H11ANE::H11ANEFrameReceiver *a2)
{
  const void *v3;

  if (this)
  {
    H11ANE::H11ANEFrameReceiver::completeAllRequests(this);
    v3 = (const void *)*((_QWORD *)this + 1);
    H11ANE::H11ANEFrameReceiver::~H11ANEFrameReceiver(this);
    MEMORY[0x20BD010DC]();
    CFRelease(v3);
  }
  return 0;
}

void H11ANE::H11ANEFrameReceiver::~H11ANEFrameReceiver(H11ANE::H11ANEFrameReceiver *this)
{
  NSObject *v2;

  if (*((_QWORD *)this + 44))
  {
    if (*(_DWORD *)this)
      H11ANE::H11ANEFrameReceiver::stopReceive(this);
    if (*((_QWORD *)this + 43))
      H11ANE::H11ANEFrameReceiver::removeIODispatcherFromRunLoop(this);
    pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 112));
    pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 176));
    pthread_mutex_destroy((pthread_mutex_t *)this + 4);
    v2 = *((_QWORD *)this + 30);
    if (v2)
    {
      dispatch_release(v2);
      *((_QWORD *)this + 30) = 0;
    }
  }
  std::deque<H11ANE::H11ANEFrameReceiverRequest *>::~deque[abi:ne180100]((_QWORD *)this + 45);
}

uint64_t std::__split_buffer<H11ANE::H11ANEFrameReceiverRequest **>::~__split_buffer(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(a1 + 8);
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != v3)
    *(_QWORD *)(a1 + 16) = v2 + ((v3 - v2 + 7) & 0xFFFFFFFFFFFFFFF8);
  v4 = *(void **)a1;
  if (*(_QWORD *)a1)
    operator delete(v4);
  return a1;
}

void H11ANE::H11ANEFrameReceiver::removeIODispatcherFromRunLoop(H11ANE::H11ANEFrameReceiver *this)
{
  __CFRunLoopSource *v2;
  __CFMachPort *v3;
  mach_port_name_t v4;

  v2 = (__CFRunLoopSource *)*((_QWORD *)this + 43);
  if (v2)
  {
    CFRunLoopRemoveSource(*((CFRunLoopRef *)this + 1), v2, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
    CFRelease(*((CFTypeRef *)this + 43));
    *((_QWORD *)this + 43) = 0;
  }
  v3 = (__CFMachPort *)*((_QWORD *)this + 41);
  if (v3)
  {
    CFMachPortInvalidate(v3);
    CFRelease(*((CFTypeRef *)this + 41));
    *((_QWORD *)this + 41) = 0;
  }
  v4 = *((_DWORD *)this + 84);
  if (v4)
  {
    mach_port_mod_refs(*MEMORY[0x24BDAEC58], v4, 1u, -1);
    *((_DWORD *)this + 84) = 0;
  }
}

uint64_t H11ANE::H11ANEFrameReceiver::completeAllRequests(H11ANE::H11ANEFrameReceiver *this)
{
  pthread_mutex_t *v2;
  dispatch_time_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  const void **v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  const void *v11;
  const void **v12;
  unsigned int v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  timeval v23;
  timespec v24;

  v2 = (pthread_mutex_t *)((char *)this + 112);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 112));
  if (!*(_DWORD *)this)
  {
    pthread_mutex_unlock(v2);
    return 3758097122;
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 176));
  if (!*((_QWORD *)this + 50))
  {
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 176));
    goto LABEL_8;
  }
  *((_BYTE *)this + 248) = 1;
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 176));
  v3 = dispatch_time(0, 5000000000);
  if (!dispatch_semaphore_wait(*((dispatch_semaphore_t *)this + 30), v3))
  {
LABEL_8:
    v8 = 0;
    goto LABEL_18;
  }
  printf("DEBUG:H11ANEFrameReceiver: Did not get all pending requests back from kernel. remaining: %d.\n", *((_QWORD *)this + 50));
  v4 = *((_QWORD *)this + 46);
  v5 = *((_QWORD *)this + 47);
  v6 = (_QWORD *)(v4 + 8 * (*((_QWORD *)this + 49) >> 9));
  if (v5 == v4)
    v7 = 0;
  else
    v7 = (const void **)(*v6 + 8 * (*((_QWORD *)this + 49) & 0x1FFLL));
  while (1)
  {
    if (v5 == v4)
    {
      v10 = 0;
    }
    else
    {
      v9 = *((_QWORD *)this + 50) + *((_QWORD *)this + 49);
      v10 = *(_QWORD *)(v4 + ((v9 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v9 & 0x1FF);
    }
    if (v7 == (const void **)v10)
      break;
    v11 = *v7++;
    printf("H11ANEFrameReceiver: Request not returned 0x%p\n", v11);
    if ((const void **)((char *)v7 - *v6) == (const void **)4096)
    {
      v12 = (const void **)v6[1];
      ++v6;
      v7 = v12;
    }
    v4 = *((_QWORD *)this + 46);
    v5 = *((_QWORD *)this + 47);
  }
  v8 = 3758097110;
LABEL_18:
  if (*((_DWORD *)this + 14))
  {
    gettimeofday(&v23, 0);
    v13 = 1000 * v23.tv_usec + 1000000 * *((_DWORD *)this + 4);
    v24.tv_sec = v23.tv_sec + v13 / 0x3B9ACA00uLL;
    v24.tv_nsec = v13 % 0x3B9ACA00;
    if (pthread_cond_timedwait((pthread_cond_t *)((char *)this + 64), v2, &v24) == 60)
    {
      v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v14)
        H11ANE::H11ANEFrameReceiver::stopReceive(v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 176));
  *((_BYTE *)this + 248) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 176));
  pthread_mutex_unlock(v2);
  return v8;
}

uint64_t H11ANE::H11ANEDevice::ANE_GetVersion(uint64_t a1, _DWORD *a2)
{
  uint64_t result;
  mach_port_t v4;
  uint32_t outputCnt;
  uint64_t output;

  result = 3758097089;
  v4 = *(_DWORD *)(a1 + 64);
  if (!v4)
    return 3758097101;
  if (*(_BYTE *)(a1 + 24))
  {
    if (*(_DWORD *)(a1 + 136) == 1)
    {
      return 3758097095;
    }
    else
    {
      output = 0;
      outputCnt = 1;
      result = IOConnectCallScalarMethod(v4, 0x1Eu, 0, 0, &output, &outputCnt);
      if (!(_DWORD)result)
        *a2 = output;
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_GetStatus(uint64_t a1, void *outputStruct)
{
  uint64_t result;
  mach_port_t v4;
  size_t outputStructCnt;

  result = 3758097089;
  outputStructCnt = 32;
  v4 = *(_DWORD *)(a1 + 64);
  if (!v4)
    return 3758097101;
  if (*(_BYTE *)(a1 + 24))
    return IOConnectCallStructMethod(v4, 7u, 0, 0, outputStruct, &outputStructCnt);
  return result;
}

uint64_t H11ANE::H11ANEServicesThreadStart(uint64_t a1)
{
  H11ANE::H11ANEDeviceController *v2;

  pthread_setname_np("H11ANEServicesThread");
  H11ANE::H11ANEThreadReadySyncer::lock(*(pthread_mutex_t **)(a1 + 24));
  v2 = (H11ANE::H11ANEDeviceController *)operator new();
  H11ANE::H11ANEDeviceController::H11ANEDeviceController(v2, *(int (**)(H11ANE::H11ANEDeviceController *, void *, H11ANE::H11ANEDevice *))(a1 + 8), *(void **)(a1 + 16));
  if (H11ANE::H11ANEDeviceController::SetupDeviceController(v2))
  {
    H11ANE::H11ANEDeviceController::~H11ANEDeviceController(v2);
    MEMORY[0x20BD010DC]();
    *(_QWORD *)a1 = 0;
    H11ANE::H11ANEThreadReadySyncer::signalAndUnlock(*(H11ANE::H11ANEThreadReadySyncer **)(a1 + 24));
  }
  else
  {
    *(_QWORD *)a1 = v2;
    H11ANE::H11ANEThreadReadySyncer::signalAndUnlock(*(H11ANE::H11ANEThreadReadySyncer **)(a1 + 24));
    CFRunLoopRun();
  }
  return 0;
}

void sub_207C46B08(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD010DC](v1, 0x10A0C40EB27483ALL);
  _Unwind_Resume(a1);
}

uint64_t H11ANE::H11ANESetMachThreadPriority(H11ANE *this, int a2)
{
  thread_act_t v3;
  pid_t v4;
  uint64_t v5;
  uint64_t v6;
  integer_t v8;
  integer_t policy_info;
  _BYTE buffer[228];
  int v11;
  uint64_t v12;

  v3 = this;
  v12 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  v4 = getpid();
  if (proc_pidinfo(v4, 2, 0, buffer, 232) <= 0)
  {
    fwrite("H11ANESetMachThreadPriority - proc_pidinfo() failed\n", 0x34uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    return 0xFFFFFFFFLL;
  }
  else
  {
    policy_info = a2 - v11;
    v5 = thread_policy_set(v3, 3u, &policy_info, 1u);
    if ((_DWORD)v5)
    {
      v6 = v5;
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "H11ANESetMachThreadPriority - thread_policy_set(...,THREAD_PRECEDENCE_POLICY,...) failed, err=%d\n", v5);
    }
    else
    {
      v6 = thread_policy_set(v3, 1u, &v8, 1u);
      if ((_DWORD)v6)
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "H11ANESetMachThreadPriority - thread_policy_set(...,THREAD_EXTENDED_POLICY,...) failed, err=%d\n", v6);
    }
  }
  return v6;
}

uint64_t H11ANE::H11ANEThreadReadySyncer::signalAndUnlock(H11ANE::H11ANEThreadReadySyncer *this)
{
  pthread_cond_signal((pthread_cond_t *)((char *)this + 64));
  return pthread_mutex_unlock((pthread_mutex_t *)this);
}

_QWORD *H11ANE::H11ANEDeviceController::H11ANEDeviceController(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  CFRunLoopRef Current;

  a1[7] = 0;
  a1[2] = 0;
  a1[3] = 0;
  a1[4] = a2;
  a1[5] = a3;
  a1[8] = pthread_self();
  Current = CFRunLoopGetCurrent();
  a1[6] = CFRetain(Current);
  return a1;
}

uint64_t H11ANE::H11ANEDeviceController::SetupDeviceController(H11ANE::H11ANEDeviceController *this)
{
  CFMutableArrayRef v2;
  uint64_t result;
  const __CFDictionary *v4;
  IONotificationPort *v5;
  __CFRunLoopSource *RunLoopSource;
  const __CFDictionary *v7;
  uint8_t v8[8];
  CFArrayCallBacks callBacks;

  callBacks.version = 0;
  callBacks.retain = 0;
  callBacks.copyDescription = 0;
  callBacks.equal = 0;
  callBacks.release = (CFArrayReleaseCallBack)H11ANE::cfArrayReleaseH11ANEUnitObject;
  v2 = CFArrayCreateMutable(0, 0, &callBacks);
  *(_QWORD *)this = v2;
  if (!v2)
    return 3758097085;
  result = MEMORY[0x20BD00E30](*MEMORY[0x24BDAD2F0], (char *)this + 8);
  if (!(_DWORD)result)
  {
    v4 = IOServiceMatching("H1xANELoadBalancer");
    v5 = IONotificationPortCreate(*((_DWORD *)this + 2));
    *((_QWORD *)this + 2) = v5;
    RunLoopSource = IONotificationPortGetRunLoopSource(v5);
    *((_QWORD *)this + 3) = RunLoopSource;
    if (RunLoopSource)
    {
      CFRunLoopAddSource(*((CFRunLoopRef *)this + 6), RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
      if (!IOServiceAddMatchingNotification(*((IONotificationPortRef *)this + 2), "IOServiceMatched", v4, (IOServiceMatchingCallback)H11ANE::LoadBalancerArrivedCallback, this, (io_iterator_t *)this + 14))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v8 = 0;
          _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Found matching service: H1xANELoadBalancer\n", v8, 2u);
        }
        H11ANE::LoadBalancerArrivedCallback(this, *((_DWORD *)this + 14));
      }
      v7 = IOServiceMatching("H11ANEIn");
      result = IOServiceAddMatchingNotification(*((IONotificationPortRef *)this + 2), "IOServiceMatched", v7, (IOServiceMatchingCallback)H11ANE::deviceArrivedCallback, this, (io_iterator_t *)this + 15);
      if (!(_DWORD)result)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v8 = 0;
          _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Found matching service: H11ANEIn\n", v8, 2u);
        }
        H11ANE::deviceArrivedCallback(this, *((_DWORD *)this + 15));
        return 0;
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        H11ANE::H11ANEDeviceController::SetupDeviceController();
      return 3758097084;
    }
  }
  return result;
}

uint64_t H11ANE::LoadBalancerArrivedCallback(H11ANE *this, io_iterator_t iterator)
{
  uint64_t result;
  unsigned int v5;
  NSObject *v6;
  H11ANE::H11ANEDevice *v7;
  CFIndex Count;
  void (*v9)(H11ANE *, _QWORD, H11ANE::H11ANEDevice *);
  uint8_t buf[4];
  CFIndex v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    v5 = result;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      v7 = (H11ANE::H11ANEDevice *)operator new();
      H11ANE::H11ANEDevice::H11ANEDevice(v7, this, v5);
      *((_DWORD *)v7 + 34) = 1;
      CFArrayAppendValue(*(CFMutableArrayRef *)this, v7);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        Count = CFArrayGetCount(*(CFArrayRef *)this);
        *(_DWORD *)buf = 134217984;
        v11 = Count;
        _os_log_impl(&dword_207C43000, v6, OS_LOG_TYPE_DEFAULT, "Found ANE H1xANELoadBalancer :%lu \n", buf, 0xCu);
      }
      v9 = (void (*)(H11ANE *, _QWORD, H11ANE::H11ANEDevice *))*((_QWORD *)this + 4);
      if (v9)
        v9(this, *((_QWORD *)this + 5), v7);
      result = IOIteratorNext(iterator);
      v5 = result;
    }
    while ((_DWORD)result);
  }
  return result;
}

void sub_207C46FE4(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD010DC](v1, 0x10A0C4068EC5594);
  _Unwind_Resume(a1);
}

uint64_t H11ANE::deviceArrivedCallback(H11ANE *this, io_iterator_t iterator)
{
  uint64_t result;
  unsigned int v5;
  NSObject *v6;
  H11ANE::H11ANEDevice *v7;
  CFIndex Count;
  void (*v9)(H11ANE *, _QWORD, H11ANE::H11ANEDevice *);
  uint8_t buf[4];
  CFIndex v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    v5 = result;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      v7 = (H11ANE::H11ANEDevice *)operator new();
      H11ANE::H11ANEDevice::H11ANEDevice(v7, this, v5);
      *((_DWORD *)v7 + 34) = 0;
      CFArrayAppendValue(*(CFMutableArrayRef *)this, v7);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        Count = CFArrayGetCount(*(CFArrayRef *)this);
        *(_DWORD *)buf = 134217984;
        v11 = Count;
        _os_log_impl(&dword_207C43000, v6, OS_LOG_TYPE_DEFAULT, "Found ANE device :%lu \n", buf, 0xCu);
      }
      v9 = (void (*)(H11ANE *, _QWORD, H11ANE::H11ANEDevice *))*((_QWORD *)this + 4);
      if (v9)
        v9(this, *((_QWORD *)this + 5), v7);
      result = IOIteratorNext(iterator);
      v5 = result;
    }
    while ((_DWORD)result);
  }
  return result;
}

void sub_207C47150(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD010DC](v1, 0x10A0C4068EC5594);
  _Unwind_Resume(a1);
}

H11ANE::H11ANEDevice *H11ANE::H11ANEDevice::H11ANEDevice(H11ANE::H11ANEDevice *this, H11ANE::H11ANEDeviceController *a2, int a3)
{
  pthread_mutexattr_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = a2;
  *((_QWORD *)this + 6) = 0;
  *((_DWORD *)this + 15) = 0;
  *((_DWORD *)this + 16) = 0;
  *((_DWORD *)this + 14) = a3;
  *(_QWORD *)this = 0;
  pthread_mutexattr_init(&v5);
  pthread_mutexattr_settype(&v5, 2);
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 72), &v5);
  pthread_mutexattr_destroy(&v5);
  H11ANE::H11ANEDevice::EnableDeviceMessages((uint64_t)this);
  return this;
}

uint64_t H11ANE::H11ANEDevice::EnableDeviceMessages(uint64_t this)
{
  if (!*(_DWORD *)(this + 60))
    return IOServiceAddInterestNotification(*(IONotificationPortRef *)(*(_QWORD *)(this + 16) + 16), *(_DWORD *)(this + 56), "IOGeneralInterest", (IOServiceInterestCallback)H11ANE::H11ANEDeviceServiceInterestCallback, (void *)this, (io_object_t *)(this + 60));
  return this;
}

uint64_t MyH11ANEDeviceControllerNotification(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v3;

  if (a3)
    v3 = a1 == 0;
  else
    v3 = 1;
  if (v3)
    return 3758097084;
  else
    return 0;
}

{
  BOOL v3;

  if (a3)
    v3 = a1 == 0;
  else
    v3 = 1;
  if (v3)
    return 3758097084;
  else
    return 0;
}

uint64_t H11ANEProgramCreate(uint64_t a1, _BYTE *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v6;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  int v12;
  _QWORD *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _OWORD *v23;
  int v24;
  _BOOL8 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  char *v41;
  _OWORD *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  _OWORD *v49;
  _OWORD *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  unsigned __int8 v55;
  unsigned int v56;
  uint64_t v57;
  int v58;
  int v59;
  int *v60;
  int v61;
  int v62;
  unsigned int v63;
  unsigned int v64;
  int v65;
  NSObject *v66;
  NSObject *v67;
  uint64_t v68;
  uint64_t v69;
  os_signpost_id_t spid;
  unint64_t v72;
  uint8_t v73[4];
  const char *v74;
  __int16 v75;
  _BYTE *v76;
  _BYTE buf[22];
  char v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  int v83;
  int v84;
  int32x2_t v85;
  uint64_t v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  int v103;
  _BYTE v104[1024];
  _BYTE v105[1024];
  char v106[1036];
  uint64_t v107;

  v107 = *MEMORY[0x24BDAC8D0];
  v3 = 2;
  if (a2 && a1 && a3)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
    if (v6)
    {
      v8 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle](ANEServicesLog, "handle"), (const void *)0x61B2408);
      v9 = +[ANEServicesLog handle](ANEServicesLog, "handle");
      v72 = v8 - 1;
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v10 = v9;
        if (os_signpost_enabled(v9))
        {
          v11 = *(_QWORD *)a2;
          v12 = *((_DWORD *)a2 + 21);
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v11;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = v12;
          _os_signpost_emit_with_name_impl(&dword_207C43000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "ServicesProgramCreate", "progContent=%llx statsMask=%x", buf, 0x12u);
        }
      }
      spid = v8;
      v13 = (_QWORD *)operator new();
      v13[437] = 0;
      bzero(v13, 0xDA0uLL);
      *((_BYTE *)v13 + 3552) = 4;
      *((_DWORD *)v13 + 889) = 21;
      bzero(&buf[16], 0xD88uLL);
      v14 = *((_QWORD *)a2 + 1);
      *(_QWORD *)buf = *(_QWORD *)a2;
      *(_QWORD *)&buf[8] = v14;
      v78 = a2[16];
      v83 = *((_DWORD *)a2 + 21);
      v85 = vrev64_s32(*(int32x2_t *)(a2 + 88));
      v86 = *((_QWORD *)a2 + 12);
      v103 = *((_DWORD *)a2 + 90);
      strlcpy(v106, a2 + 2412, 0x400uLL);
      v84 = ((int)(*((_DWORD *)a2 + 21) << 29) >> 31) & 0xD8;
      v79 = *(_OWORD *)(a2 + 17);
      v80 = *(_OWORD *)(a2 + 33);
      v81 = *(_OWORD *)(a2 + 49);
      v82 = *(_OWORD *)(a2 + 65);
      v15 = *(_OWORD *)(a2 + 248);
      v95 = *(_OWORD *)(a2 + 232);
      v96 = v15;
      v16 = *(_OWORD *)(a2 + 184);
      v91 = *(_OWORD *)(a2 + 168);
      v92 = v16;
      v17 = *(_OWORD *)(a2 + 216);
      v93 = *(_OWORD *)(a2 + 200);
      v94 = v17;
      v18 = *(_OWORD *)(a2 + 120);
      v87 = *(_OWORD *)(a2 + 104);
      v88 = v18;
      v19 = *(_OWORD *)(a2 + 152);
      v89 = *(_OWORD *)(a2 + 136);
      v90 = v19;
      v20 = *(_OWORD *)(a2 + 312);
      v99 = *(_OWORD *)(a2 + 296);
      v100 = v20;
      v21 = *(_OWORD *)(a2 + 344);
      v101 = *(_OWORD *)(a2 + 328);
      v102 = v21;
      v22 = *(_OWORD *)(a2 + 280);
      v97 = *(_OWORD *)(a2 + 264);
      v98 = v22;
      if (a2[364])
        memcpy(v104, a2 + 364, sizeof(v104));
      if (a2[1388])
      {
        memcpy(v105, a2 + 1388, sizeof(v105));
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v73 = 136315394;
          v74 = "H11ANEProgramCreate";
          v75 = 2080;
          v76 = a2 + 1388;
          _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "H11ANEIn: %s: aotCacheUrlIdentifier passed from ProgramDefinition : %s", v73, 0x16u);
        }
      }
      v23 = (_OWORD *)operator new();
      bzero(v23, 0xAEF68uLL);
      v24 = H11ANE::H11ANEDevice::ANE_ProgramCreate(v6, (uint64_t *)buf, (uint64_t *)v23);
      if (v24 <= -536870185)
      {
        switch(v24)
        {
          case -536870211:
            v3 = 1;
            break;
          case -536870210:
            v3 = 5;
            break;
          case -536870209:
          case -536870208:
          case -536870205:
          case -536870204:
          case -536870203:
          case -536870202:
            goto LABEL_49;
          case -536870207:
            v3 = 20;
            break;
          case -536870206:
            break;
          case -536870201:
            v3 = 24;
            break;
          default:
            if (v24 == -536870191)
            {
              v3 = 19;
            }
            else if (v24 == -536870186)
            {
              v3 = 15;
            }
            else
            {
LABEL_49:
              v3 = 18;
            }
            break;
        }
LABEL_58:
        MEMORY[0x20BD010DC](v13, 0x10A0C404DBAFFD9);
        *a3 = 0;
      }
      else
      {
        v3 = 4;
        switch(v24)
        {
          case -536870176:
            v3 = 26;
            goto LABEL_58;
          case -536870175:
          case -536870172:
          case -536870171:
          case -536870170:
          case -536870168:
          case -536870167:
          case -536870166:
          case -536870164:
          case -536870161:
            goto LABEL_49;
          case -536870174:
            v3 = 23;
            goto LABEL_58;
          case -536870173:
            v3 = 10;
            goto LABEL_58;
          case -536870169:
            v3 = 29;
            goto LABEL_58;
          case -536870165:
            v3 = 21;
            goto LABEL_58;
          case -536870163:
            v3 = 27;
            goto LABEL_58;
          case -536870162:
            v3 = 28;
            goto LABEL_58;
          case -536870160:
            goto LABEL_58;
          default:
            if (v24 == -536870184)
            {
              v3 = 22;
              goto LABEL_58;
            }
            if (v24)
              goto LABEL_49;
            *(_OWORD *)(v13 + 437) = *v23;
            *((_DWORD *)v13 + 878) = *((_DWORD *)v23 + 179148);
            v33 = *((_DWORD *)v23 + 179151);
            *((_DWORD *)v13 + 879) = *((_DWORD *)v23 + 179150);
            *((_DWORD *)v13 + 882) = v33;
            *((_DWORD *)v13 + 885) = *((_DWORD *)v23 + 179153);
            v13[443] = *((_QWORD *)v23 + 89577);
            *((_DWORD *)v13 + 889) = *((_DWORD *)a2 + 23);
            v34 = operator new();
            v13[436] = v34;
            *(_OWORD *)(v34 + 48) = 0u;
            *(_OWORD *)(v34 + 64) = 0u;
            *(_OWORD *)(v34 + 80) = 0u;
            *(_OWORD *)(v34 + 96) = 0u;
            *(_OWORD *)(v34 + 112) = 0u;
            *(_OWORD *)(v34 + 128) = 0u;
            *(_OWORD *)(v34 + 144) = 0u;
            *(_OWORD *)(v34 + 160) = 0u;
            *v13 = a1;
            *(_OWORD *)(v34 + 32) = 0u;
            memcpy(v13 + 1, a2, 0xD70uLL);
            *(_DWORD *)(v34 + 168) = *((_DWORD *)v13 + 92);
            *(_QWORD *)(v34 + 112) = v13[437];
            *(_QWORD *)v34 = aneProgramVTable;
            *(_QWORD *)(v34 + 8) = v13;
            v35 = v13[438];
            *(_QWORD *)(v34 + 16) = v35;
            *(_QWORD *)(v34 + 24) = v35;
            v36 = *((unsigned int *)v13 + 878);
            *(_DWORD *)(v34 + 120) = *((_DWORD *)v13 + 879);
            v37 = *((unsigned int *)v13 + 882);
            *(_QWORD *)(v34 + 128) = v36;
            *(_QWORD *)(v34 + 136) = v37;
            *(_BYTE *)(v34 + 32) = *((_DWORD *)v23 + 35450);
            *(_QWORD *)(v34 + 48) = operator new[]();
            *(_QWORD *)(v34 + 40) = operator new[]();
            *(_QWORD *)(v34 + 56) = operator new[]();
            if (*(_BYTE *)(v34 + 32))
            {
              v38 = 0;
              v39 = 0;
              v40 = 0;
              v41 = (char *)v23 + 141804;
              do
              {
                *(_QWORD *)(*(_QWORD *)(v34 + 48) + 8 * v40) = *((unsigned int *)v23 + v40 + 5);
                strlcpy((char *)(*(_QWORD *)(v34 + 40) + v39 * 16), (const char *)&v23[v39 + 702] + 8, 0x200uLL);
                v42 = (_OWORD *)(*(_QWORD *)(v34 + 56) + v38);
                *v42 = *(_OWORD *)&v41[v38];
                v43 = *(_OWORD *)&v41[v38 + 16];
                v44 = *(_OWORD *)&v41[v38 + 32];
                v45 = *(_OWORD *)&v41[v38 + 48];
                *(_OWORD *)((char *)v42 + 60) = *(_OWORD *)&v41[v38 + 60];
                v42[2] = v44;
                v42[3] = v45;
                v42[1] = v43;
                ++v40;
                v39 += 32;
                v38 += 76;
              }
              while (v40 < *(unsigned __int8 *)(v34 + 32));
            }
            *(_BYTE *)(v34 + 72) = *((_DWORD *)v23 + 80586);
            *(_QWORD *)(v34 + 88) = operator new[]();
            *(_QWORD *)(v34 + 80) = operator new[]();
            *(_QWORD *)(v34 + 64) = operator new[]();
            if (*(_BYTE *)(v34 + 72))
            {
              v46 = 0;
              v47 = 0;
              v48 = 0;
              v49 = v23 + 10074;
              do
              {
                *(_QWORD *)(*(_QWORD *)(v34 + 88) + 8 * v48) = *((unsigned int *)v23 + v48 + 45141);
                strlcpy((char *)(*(_QWORD *)(v34 + 80) + v47 * 16), (const char *)&v23[v47 + 11986] + 8, 0x200uLL);
                v50 = (_OWORD *)(*(_QWORD *)(v34 + 64) + v46);
                *v50 = *(_OWORD *)((char *)v49 + v46);
                v51 = *(_OWORD *)((char *)v49 + v46 + 16);
                v52 = *(_OWORD *)((char *)v49 + v46 + 32);
                v53 = *(_OWORD *)((char *)v49 + v46 + 48);
                *(_OWORD *)((char *)v50 + 60) = *(_OWORD *)((char *)v49 + v46 + 60);
                v50[2] = v52;
                v50[3] = v53;
                v50[1] = v51;
                ++v48;
                v47 += 32;
                v46 += 76;
              }
              while (v48 < *(unsigned __int8 *)(v34 + 72));
            }
            *(_BYTE *)(v34 + 96) = *((_DWORD *)v23 + 80587);
            v54 = operator new[]();
            *(_QWORD *)(v34 + 104) = v54;
            if (*((_DWORD *)v23 + 80587))
            {
              v55 = 0;
              do
              {
                v56 = v55;
                v57 = (uint64_t)v23 + 3080 * v55 + 322352;
                v58 = *((_DWORD *)v23 + 770 * v55 + 80972);
                *(_DWORD *)(v54 + 2568 * v56 + 1532) = v58;
                if (v58)
                {
                  v59 = 0;
                  do
                  {
                    *(_DWORD *)(v54 + 2568 * v56 + 4 * v59 + 512) = *((_DWORD *)v23
                                                                                         + 770 * v56
                                                                                         + v59
                                                                                         + 80717);
                    ++v59;
                  }
                  while (*(_DWORD *)(v57 + 1536) > v59);
                }
                v60 = (int *)v23 + 770 * v56 + 81228;
                v61 = *v60;
                *(_DWORD *)(v54 + 2568 * v56 + 2556) = *v60;
                if (v61)
                {
                  v62 = 0;
                  do
                  {
                    *(_DWORD *)(v54 + 2568 * v56 + 4 * v62 + 1536) = *((_DWORD *)v23
                                                                                          + 770 * v56
                                                                                          + v62
                                                                                          + 80973);
                    ++v62;
                  }
                  while (*v60 > v62);
                }
                strlcpy((char *)(v54 + 2568 * v56), (const char *)v57, 0x200uLL);
                v63 = *((_DWORD *)v23 + 770 * v56 + 80716);
                v54 = *(_QWORD *)(v34 + 104);
                *(_DWORD *)(v54 + 2568 * v56 + 2560) = v63;
                if ((*((_BYTE *)v23 + 716600) & 8) != 0 && (v64 = *((_DWORD *)v23 + 179152)) != 0)
                {
                  v65 = ZinComputeAnalyticsBufferSize(v63, *((const unsigned __int8 **)v23 + 89577), v64, 27, 6);
                  v54 = *(_QWORD *)(v34 + 104);
                }
                else
                {
                  v65 = 0;
                }
                *(_DWORD *)(v54 + 2568 * v56 + 2564) = v65;
                v55 = v56 + 1;
              }
              while (*((_DWORD *)v23 + 80587) > (v56 + 1));
            }
            v3 = 0;
            *(_BYTE *)(v34 + 144) = *((_BYTE *)v23 + 716624);
            *(_QWORD *)(v34 + 160) = v86;
            *a3 = v34;
            break;
        }
      }
      MEMORY[0x20BD010DC](v23, 0x1000C40CA581FBELL);
      v66 = +[ANEServicesLog handle](ANEServicesLog, "handle");
      if (v72 < 0xFFFFFFFFFFFFFFFELL)
      {
        v67 = v66;
        if (os_signpost_enabled(v66))
        {
          v68 = *(_QWORD *)a2;
          v69 = *a3;
          if (*a3)
            v69 = *(_QWORD *)(v69 + 112);
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v68;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v69;
          _os_signpost_emit_with_name_impl(&dword_207C43000, v67, OS_SIGNPOST_INTERVAL_END, spid, "ServicesProgramCreate", "progContent=%llx progHandle=%llx", buf, 0x16u);
        }
      }
    }
    else
    {
      v25 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v25)
        H11ANEProgramCreate_cold_1(v25, v26, v27, v28, v29, v30, v31, v32);
      return 8;
    }
  }
  return v3;
}

uint64_t H11ANE::H11ANEDevice::ANE_ProgramCreate(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = 3758097090;
  if (!*(_DWORD *)(a1 + 64))
    return 3758097101;
  if (a3)
  {
    v7 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle](ANEServicesLog, "handle"), (const void *)0x61B2010);
    v8 = +[ANEServicesLog handle](ANEServicesLog, "handle");
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v9 = v8;
      if (os_signpost_enabled(v8))
      {
        v10 = *a2;
        v16 = 134217984;
        v17 = v10;
        _os_signpost_emit_with_name_impl(&dword_207C43000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "H11ANEDeviceProgramCreate", "prodAddr=%llx", (uint8_t *)&v16, 0xCu);
      }
    }
    a2[2] = (uint64_t)a3;
    a2[3] = 716648;
    if (*(_BYTE *)(a1 + 24))
      v3 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 64), 3u, a2, 0xD98uLL, 0, 0);
    else
      v3 = 0;
    v11 = +[ANEServicesLog handle](ANEServicesLog, "handle");
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v12 = v11;
      if (os_signpost_enabled(v11))
      {
        v13 = *a2;
        v14 = *a3;
        v16 = 134218240;
        v17 = v13;
        v18 = 2048;
        v19 = v14;
        _os_signpost_emit_with_name_impl(&dword_207C43000, v12, OS_SIGNPOST_INTERVAL_END, v7, "H11ANEDeviceProgramCreate", "prodAddr=%llx progHandle=%llx", (uint8_t *)&v16, 0x16u);
      }
    }
  }
  return v3;
}

uint64_t H11ANEProgramPrepare(uint64_t a1, int *a2, char a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  os_signpost_id_t v33;
  NSObject *v34;
  NSObject *v35;
  uint64_t v36;
  int v37;
  int v38;
  char v39;
  _BOOL8 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  __int128 v49;
  NSObject *v50;
  NSObject *v51;
  uint64_t v52;
  int v53;
  int v55;
  _BYTE v56[12];
  __int16 v57;
  _BYTE v58[10];
  uint64_t v59;
  int v60;
  char v61;
  int v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v3 = 2;
  if (!a1 || !a2)
    return v3;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a1 + 8);
    if (v6)
    {
      v7 = *(_QWORD *)(*(_QWORD *)v6 + 16);
      v8 = *(_QWORD *)(v7 + 8);
      if (v8)
      {
        if (*(_DWORD *)(v7 + 32) == 1)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            H11ANEProgramPrepare_cold_3();
          return 20;
        }
        v33 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle](ANEServicesLog, "handle"), (const void *)0x61B2410);
        v34 = +[ANEServicesLog handle](ANEServicesLog, "handle");
        if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v35 = v34;
          if (os_signpost_enabled(v34))
          {
            v36 = *(_QWORD *)(a1 + 112);
            v37 = *a2;
            *(_DWORD *)v56 = 134218240;
            *(_QWORD *)&v56[4] = v36;
            v57 = 1024;
            *(_DWORD *)v58 = v37;
            _os_signpost_emit_with_name_impl(&dword_207C43000, v35, OS_SIGNPOST_INTERVAL_BEGIN, v33, "ServicesProgramPrepare", "progHandle=%llx priority=%x", v56, 0x12u);
          }
        }
        v38 = *a2;
        *(_BYTE *)(v6 + 3552) = *a2;
        if ((v38 & 0xFE) != 0)
        {
          if (v38 < 8u)
          {
LABEL_29:
            v48 = a2[2];
            *(_DWORD *)(v6 + 3556) = v48;
            *(_QWORD *)v56 = *(_QWORD *)(v6 + 3496);
            v56[8] = *((_BYTE *)a2 + 12);
            v60 = v48;
            v62 = *(_DWORD *)(a1 + 168);
            v56[9] = (a2[1] & 4) != 0;
            *(_QWORD *)&v58[2] = *((_QWORD *)a2 + 2);
            v56[10] = 1;
            v61 = *((_BYTE *)a2 + 24);
            v3 = H11ANE::H11ANEDevice::ANE_ProgramPrepare(v8, (uint64_t *)v56);
            if ((_DWORD)v3)
            {
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                H11ANEProgramPrepare_cold_4();
              if ((int)v3 > -536870185)
              {
                v55 = v3 + 536870176;
                v3 = 4;
                switch(v55)
                {
                  case 0:
                    v3 = 26;
                    break;
                  case 2:
                    v3 = 23;
                    break;
                  case 3:
                    v3 = 10;
                    break;
                  case 7:
                    v3 = 29;
                    break;
                  case 11:
                    v3 = 21;
                    break;
                  case 13:
                    v3 = 27;
                    break;
                  case 14:
                    v3 = 28;
                    break;
                  case 16:
                    break;
                  default:
LABEL_49:
                    v3 = 18;
                    break;
                }
              }
              else
              {
                switch(v3)
                {
                  case 0xE00002BD:
                    v3 = 1;
                    break;
                  case 0xE00002BE:
                    v3 = 5;
                    break;
                  case 0xE00002BF:
                  case 0xE00002C0:
                  case 0xE00002C3:
                  case 0xE00002C4:
                  case 0xE00002C5:
                  case 0xE00002C6:
                    goto LABEL_49;
                  case 0xE00002C1:
                    v3 = 20;
                    break;
                  case 0xE00002C2:
                    v3 = 2;
                    break;
                  case 0xE00002C7:
                    v3 = 24;
                    break;
                  default:
                    if ((_DWORD)v3 == -536870191)
                    {
                      v3 = 19;
                    }
                    else
                    {
                      if ((_DWORD)v3 != -536870186)
                        goto LABEL_49;
                      v3 = 15;
                    }
                    break;
                }
              }
            }
            else
            {
              *(_QWORD *)(a1 + 152) = v59;
              *(_QWORD *)(v6 + 3480) = 0;
              v49 = *((_OWORD *)a2 + 1);
              *(_OWORD *)(v6 + 3448) = *(_OWORD *)a2;
              *(_OWORD *)(v6 + 3464) = v49;
            }
            v50 = +[ANEServicesLog handle](ANEServicesLog, "handle");
            if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
            {
              v51 = v50;
              if (os_signpost_enabled(v50))
              {
                v52 = *(_QWORD *)(a1 + 112);
                v53 = *a2;
                *(_DWORD *)v56 = 134218240;
                *(_QWORD *)&v56[4] = v52;
                v57 = 1024;
                *(_DWORD *)v58 = v53;
                _os_signpost_emit_with_name_impl(&dword_207C43000, v51, OS_SIGNPOST_INTERVAL_END, v33, "ServicesProgramPrepare", "progHandle=%llx priority=%x", v56, 0x12u);
              }
            }
            return v3;
          }
          v39 = 7;
        }
        else
        {
          v40 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v40)
            H11ANEProgramPrepare_cold_5(v40, v41, v42, v43, v44, v45, v46, v47);
          v39 = 2;
        }
        *(_BYTE *)(v6 + 3552) = v39;
        goto LABEL_29;
      }
      v25 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v25)
        H11ANEProgramPrepare_cold_2(v25, v26, v27, v28, v29, v30, v31, v32);
      return 8;
    }
    else
    {
      v17 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v17)
        H11ANEProgramPrepare_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
      return 1;
    }
  }
  else
  {
    v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v9)
      H11ANEProgramPrepare_cold_6(v9, v10, v11, v12, v13, v14, v15, v16);
    return 3;
  }
}

uint64_t H11ANE::H11ANEDevice::ANE_ProgramPrepare(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  size_t outputStructCnt;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = 3758097089;
  if (!*(_DWORD *)(a1 + 64))
    return 3758097101;
  if (*(_BYTE *)(a1 + 24))
  {
    v5 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle](ANEServicesLog, "handle"), (const void *)0x61B2018);
    v6 = +[ANEServicesLog handle](ANEServicesLog, "handle");
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v6))
      {
        v8 = *a2;
        *(_DWORD *)buf = 134217984;
        v15 = v8;
        _os_signpost_emit_with_name_impl(&dword_207C43000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "H11ANEDeviceProgramPrepare", "progHandle=%llx", buf, 0xCu);
      }
    }
    outputStructCnt = 56;
    v2 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 64), 4u, a2, 0x38uLL, a2, &outputStructCnt);
    v9 = +[ANEServicesLog handle](ANEServicesLog, "handle");
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v9))
      {
        v11 = *a2;
        *(_DWORD *)buf = 134217984;
        v15 = v11;
        _os_signpost_emit_with_name_impl(&dword_207C43000, v10, OS_SIGNPOST_INTERVAL_END, v5, "H11ANEDeviceProgramPrepare", "progHandle=%llx", buf, 0xCu);
      }
    }
  }
  return v2;
}

uint64_t H11ANEProgramProcessRequestDirect(uint64_t a1, int *a2, void (**a3)(_QWORD, _QWORD), unsigned int *a4, int a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t *v30;
  unint64_t v31;
  os_signpost_id_t v32;
  NSObject *v33;
  NSObject *v34;
  const char *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  _DWORD *v39;
  _DWORD *v40;
  _QWORD *v41;
  uint64_t v42;
  int *v43;
  _QWORD *v44;
  _DWORD *v45;
  uint64_t v46;
  uint64_t *v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  H11ANE::H11ANEFrameReceiverBufferPool *v53;
  int v54;
  CVPixelBufferRef *v55;
  int Buffer;
  void *BaseAddress;
  unsigned int *v58;
  unsigned int v59;
  unsigned int v60;
  unint64_t v61;
  int *v62;
  _DWORD *v63;
  int v64;
  int v65;
  int v66;
  unint64_t v67;
  unsigned int *v68;
  id *v69;
  unsigned int v70;
  unsigned int v71;
  int v72;
  unsigned int v73;
  NSObject *v74;
  NSObject *v75;
  const char *v76;
  int v77;
  os_signpost_id_t spid;
  int v79;
  unint64_t v80;
  int *v81;
  uint64_t v82;
  unsigned int *v83;
  _DWORD v84[2];
  uint64_t v85;
  uint8_t buf[4];
  const char *v87;
  __int16 v88;
  _BYTE v89[14];
  uint64_t v90;

  v90 = *MEMORY[0x24BDAC8D0];
  if (!a1 || !a2 || !a3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      H11ANEProgramProcessRequestDirect_cold_7();
    return 2;
  }
  v8 = *(_QWORD *)(a1 + 16);
  if (*(_QWORD *)(v8 + 8))
  {
    v9 = *(_QWORD *)(v8 + 96);
    if (v9)
    {
      if (a2[1] > 0xFF || a2[1532] >= 0x100)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          H11ANEProgramProcessRequestDirect_cold_3();
        return 2;
      }
      if (a4 && (*a4 > 0x40 || a4[1] >= 0x41))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          H11ANEProgramProcessRequestDirect_cold_6();
        return 2;
      }
      v81 = a2 + 3077;
      v82 = *(_QWORD *)(v8 + 96);
      v30 = (unint64_t *)(v9 + 416);
      do
        v31 = __ldaxr(v30);
      while (__stlxr(v31 + 1, v30));
      v32 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle](ANEServicesLog, "handle"), (const void *)0x61B2414);
      v33 = +[ANEServicesLog handle](ANEServicesLog, "handle");
      v80 = v32 - 1;
      if (v32 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        v34 = v33;
        if (os_signpost_enabled(v33))
        {
          v35 = (const char *)*((_QWORD *)a2 + 1536);
          v36 = *a2;
          *(_DWORD *)buf = 134218496;
          v87 = v35;
          v88 = 1024;
          *(_DWORD *)v89 = v36;
          *(_WORD *)&v89[4] = 2048;
          *(_QWORD *)&v89[6] = v31;
          _os_signpost_emit_with_name_impl(&dword_207C43000, v34, OS_SIGNPOST_INTERVAL_BEGIN, v32, "ServicesProcessRequestDirect", "progHandle=%llx procid=%x transid=%llx", buf, 0x1Cu);
        }
      }
      spid = v32;
      v37 = operator new();
      *(_QWORD *)(v37 + 8280) = 0;
      bzero((void *)v37, 0x7F8uLL);
      *(_DWORD *)(v37 + 4080) = 0;
      bzero((void *)(v37 + 4088), 0x7F8uLL);
      *(_DWORD *)(v37 + 8168) = 0;
      *(_OWORD *)(v37 + 8176) = 0u;
      *(_DWORD *)(v37 + 0x2000) = 0;
      *(_QWORD *)(v37 + 8200) = 0;
      *(_QWORD *)(v37 + 8216) = 0;
      *(_QWORD *)(v37 + 8208) = 0;
      *(_DWORD *)(v37 + 8224) = 0;
      v38 = a2[1];
      if ((_DWORD)v38)
      {
        v39 = a2 + 4;
        v40 = (_DWORD *)(v37 + 2040);
        v41 = (_QWORD *)v37;
        do
        {
          *v41++ = *((_QWORD *)v39 - 1);
          *v40 = *v39;
          v40[255] = v39[3];
          v39 += 6;
          ++v40;
          --v38;
        }
        while (v38);
      }
      v42 = a2[1532];
      if ((_DWORD)v42)
      {
        v43 = a2 + 1534;
        v44 = (_QWORD *)(v37 + 4088);
        v45 = (_DWORD *)(v37 + 6128);
        do
        {
          *v44++ = *(_QWORD *)v43;
          *v45 = v43[2];
          v45[255] = v43[5];
          v43 += 6;
          ++v45;
          --v42;
        }
        while (v42);
      }
      v46 = a2[3064];
      if ((_DWORD)v46)
      {
        v47 = (uint64_t *)(a2 + 3066);
        v48 = (_QWORD *)(v37 + 8176);
        do
        {
          v49 = *v47;
          v47 += 3;
          *v48++ = v49;
          --v46;
        }
        while (v46);
      }
      v50 = *((_QWORD *)a2 + 1539);
      if (v50)
        *(_QWORD *)(v37 + 8208) = v50;
      v51 = *((_QWORD *)a2 + 1540);
      if (v51 && (a2[3082] & 8) != 0)
        *(_QWORD *)(v37 + 8216) = v51;
      v52 = *(_DWORD *)(v8 + 108);
      if ((v52 & 0x100) == 0)
        v52 &= a2[3082];
      *(_DWORD *)(v37 + 8196) = v52;
      v53 = *(H11ANE::H11ANEFrameReceiverBufferPool **)(v8 + 112);
      if (v53)
      {
        v54 = -536870212;
        if (v52)
        {
          v55 = (CVPixelBufferRef *)(v37 + 8200);
          Buffer = H11ANE::H11ANEFrameReceiverBufferPool::allocateBuffer(v53, (__CVBuffer **)(v37 + 8200));
          if (Buffer)
          {
            v54 = Buffer;
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              v87 = "H11ANEProgramProcessRequestDirect";
              v88 = 2048;
              *(_QWORD *)v89 = v31;
              *(_WORD *)&v89[8] = 1024;
              *(_DWORD *)&v89[10] = v54;
              _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: transactionID: 0x%llx, statsBufferPool->allocateBuffer failed: 0x%x\n", buf, 0x1Cu);
            }
            *(_DWORD *)(v37 + 8196) = 0;
          }
          else
          {
            CVPixelBufferLockBaseAddress(*v55, 0);
            BaseAddress = CVPixelBufferGetBaseAddress(*v55);
            if (BaseAddress)
              bzero(BaseAddress, (*(_DWORD *)(v8 + 120) + *(_DWORD *)(v8 + 104)));
            CVPixelBufferUnlockBaseAddress(*v55, 0);
            v54 = 0;
          }
        }
      }
      else
      {
        v54 = -536870212;
      }
      v79 = v54;
      if (a4)
      {
        v83 = (unsigned int *)operator new();
        v58 = v83;
        bzero(v83, 0x1808uLL);
        v60 = *a4;
        v59 = a4[1];
        *v83 = *a4;
        v83[1] = v59;
        if (v60)
        {
          v61 = 0;
          v62 = (int *)(a4 + 7);
          v63 = v83 + 3;
          do
          {
            v64 = objc_msgSend(*(id *)(v62 - 5), "eventPort", spid);
            v65 = *(v62 - 1);
            *(v63 - 1) = v64;
            *v63 = v65;
            *(_QWORD *)(v63 + 1) = *(_QWORD *)(v62 - 3);
            v66 = *v62;
            v62 += 8;
            v63[3] = v66;
            ++v61;
            v63 += 12;
          }
          while (v61 < *a4);
          v59 = a4[1];
          v58 = v83;
        }
        if (v59)
        {
          v67 = 0;
          v68 = v58 + 770;
          v69 = (id *)a4;
          do
          {
            v70 = objc_msgSend(v69[257], "eventPort", spid);
            v71 = *((_DWORD *)v69 + 518);
            *v68 = v70;
            v68[1] = v71;
            *((_QWORD *)v68 + 1) = v69[258];
            v68[4] = *((_DWORD *)v69 + 519);
            *((_QWORD *)v68 + 4) = v69[260];
            ++v67;
            v69 += 4;
            v68 += 12;
          }
          while (v67 < a4[1]);
          v58 = v83;
        }
      }
      else
      {
        v58 = 0;
      }
      v72 = *a2;
      *(_DWORD *)(v37 + 4080) = a2[1];
      *(_DWORD *)(v37 + 8168) = a2[1532];
      *(_DWORD *)(v37 + 0x2000) = a2[3064];
      *(_QWORD *)(v37 + 8232) = *((_QWORD *)a2 + 1536);
      *(_WORD *)(v37 + 8400) = *(_WORD *)v81;
      *(_DWORD *)(v37 + 8240) = v72;
      *(_QWORD *)(v37 + 8256) = v31;
      *(_BYTE *)(v37 + 8402) = *((_BYTE *)v81 + 2);
      v73 = a2[3074];
      if (v73 > 1)
      {
        if (v73 >= 8)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v87) = v79;
            _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "WARN: Client sending down priorities greater than kANEProgramPriority7. Lowering priority to kANEProgramPriority7 0x%08X", buf, 8u);
          }
          v73 = 7;
        }
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          H11ANEProgramProcessRequestDirect_cold_5();
        v73 = 2;
      }
      *(_DWORD *)(v37 + 8244) = v73;
      *(_DWORD *)(v37 + 8248) = a2[3076];
      *(_QWORD *)(v37 + 8272) = a1;
      *(_QWORD *)(v37 + 8280) = _Block_copy(a3);
      v10 = H11ANE::H11ANEFrameReceiver::ProgramProcessRequest(v82, v37, v58, a5);
      if (!(_DWORD)v10)
        goto LABEL_81;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        H11ANEProgramProcessRequestDirect_cold_4();
      if ((_DWORD)v10 == -536870164)
      {
        v10 = 25;
      }
      else
      {
        v10 = IOReturnToANEReturn(v10);
        if (!(_DWORD)v10)
        {
LABEL_81:
          if (v58)
            MEMORY[0x20BD010DC](v58, 0x1000C40F97C614ELL);
          v74 = +[ANEServicesLog handle](ANEServicesLog, "handle");
          if (v80 < 0xFFFFFFFFFFFFFFFELL)
          {
            v75 = v74;
            if (os_signpost_enabled(v74))
            {
              v76 = (const char *)*((_QWORD *)a2 + 1536);
              v77 = *a2;
              *(_DWORD *)buf = 134218496;
              v87 = v76;
              v88 = 1024;
              *(_DWORD *)v89 = v77;
              *(_WORD *)&v89[4] = 2048;
              *(_QWORD *)&v89[6] = v31;
              _os_signpost_emit_with_name_impl(&dword_207C43000, v75, OS_SIGNPOST_INTERVAL_END, spid, "ServicesProcessRequestDirect", "progHandle=%llx procid=%x transid=%llx", buf, 0x1Cu);
            }
          }
          return v10;
        }
      }
      v84[0] = 9;
      v84[1] = v10;
      v85 = 0;
      ((void (**)(_QWORD, _DWORD *))a3)[2](a3, v84);
      goto LABEL_81;
    }
    v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v19)
      H11ANEProgramProcessRequestDirect_cold_2(v19, v20, v21, v22, v23, v24, v25, v26);
    return 11;
  }
  else
  {
    v11 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v11)
      H11ANEProgramProcessRequestDirect_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
    return 8;
  }
}

uint64_t H11ANE::H11ANEFrameReceiver::ProgramProcessRequest(uint64_t a1, uint64_t a2, unsigned int *a3, int a4)
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  NSObject *v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  _QWORD *v46;
  __CVBuffer *v47;
  __IOSurface *IOSurface;
  const void *v49;
  const void *v50;
  _BYTE *v51;
  unint64_t v52;
  uint64_t v53;
  CFTypeRef *v54;
  int v55;
  unint64_t v56;
  CFTypeRef *v57;
  _DWORD *v58;
  IOSurfaceID ID;
  unint64_t v60;
  unint64_t v61;
  CFTypeRef *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  int *v67;
  int v68;
  int v69;
  H11ANE::H11ANEFrameReceiver *v70;
  int v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  char *v77;
  uint64_t v78;
  char *v79;
  H11ANE::H11ANEFrameReceiver *v80;
  H11ANE::H11ANEFrameReceiver *v81;
  uint64_t v83;
  int v84;
  uint64_t v85;
  H11ANE::H11ANEFrameReceiverRequest *v86;
  uint8_t v87[4];
  uint64_t v88;
  __int16 v89;
  int v90;
  __int16 v91;
  uint64_t v92;
  _BYTE buf[28];
  int v94;
  _DWORD v95[578];
  BOOL v96;
  char v97;
  __int16 v98;
  int v99;
  unsigned int *v100;
  int v101;
  uint64_t v102;

  v102 = *MEMORY[0x24BDAC8D0];
  v7 = *(_QWORD *)(a2 + 8232);
  v8 = *(_DWORD *)(a2 + 8240);
  v9 = *(_QWORD *)(a2 + 8256);
  v10 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle](ANEServicesLog, "handle"), (const void *)0x61B2208);
  v11 = +[ANEServicesLog handle](ANEServicesLog, "handle");
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v12 = v11;
    if (os_signpost_enabled(v11))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v8;
      *(_WORD *)&buf[18] = 2048;
      *(_QWORD *)&buf[20] = v9;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "H11ANEFrameReceiverProcessRequest", "progHandle=%llx procid=%x transid=%llx", buf, 0x1Cu);
    }
  }
  v83 = v7;
  v84 = v8;
  v85 = v9;
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 112));
  if (*(_BYTE *)(a1 + 408) || *(_DWORD *)a1 != 1)
  {
    v15 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v15)
      H11ANE::H11ANEFrameReceiver::ProgramProcessRequest(v15, v16, v17, v18, v19, v20, v21, v22);
    v14 = 3758097122;
  }
  else
  {
    v13 = *(unsigned int *)(a2 + 4080);
    if ((v13 - 256) > 0xFFFFFF00)
    {
      v26 = *(unsigned int *)(a2 + 8168);
      if ((v26 - 256) > 0xFFFFFF00)
      {
        v34 = (v26 + v13);
        if (v34 <= 0xFF)
        {
          v42 = 0;
          v43 = 8 * v13;
          do
          {
            if (!*(_QWORD *)(a2 + v42))
            {
              v14 = 3758097090;
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                H11ANE::H11ANEFrameReceiver::ProgramProcessRequest();
              goto LABEL_13;
            }
            v42 += 8;
          }
          while (v43 != v42);
          if ((_DWORD)v26)
          {
            v44 = (_QWORD *)(a2 + 4088);
            while (*v44)
            {
              ++v44;
              if (!--v26)
                goto LABEL_30;
            }
            v14 = 3758097090;
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              H11ANE::H11ANEFrameReceiver::ProgramProcessRequest();
          }
          else
          {
LABEL_30:
            v45 = *(unsigned int *)(a2 + 0x2000);
            if ((_DWORD)v45)
            {
              v46 = (_QWORD *)(a2 + 8176);
              while (*v46)
              {
                ++v46;
                if (!--v45)
                  goto LABEL_34;
              }
              v14 = 3758097090;
              if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                H11ANE::H11ANEFrameReceiver::ProgramProcessRequest();
            }
            else
            {
LABEL_34:
              v47 = *(__CVBuffer **)(a2 + 8200);
              if (v47)
              {
                CVPixelBufferRetain(v47);
                IOSurface = CVPixelBufferGetIOSurface(*(CVPixelBufferRef *)(a2 + 8200));
                LODWORD(v47) = IOSurfaceGetID(IOSurface);
              }
              v95[322] = (_DWORD)v47;
              v49 = *(const void **)(a2 + 8216);
              if (v49)
                CFRetain(v49);
              v50 = *(const void **)(a2 + 8208);
              if (v50)
              {
                CFRetain(v50);
                LODWORD(v50) = IOSurfaceGetID(*(IOSurfaceRef *)(a2 + 8208));
              }
              v99 = (int)v50;
              LODWORD(v51) = *(_DWORD *)(a2 + 4080);
              if ((_DWORD)v51)
              {
                v52 = 0;
                v53 = 2040;
                do
                {
                  v54 = (CFTypeRef *)(a2 + 8 * v52);
                  CFRetain(*v54);
                  v95[v52] = IOSurfaceGetID((IOSurfaceRef)*v54);
                  *((_BYTE *)&v95[255] + v52) = *(_DWORD *)(a2 + v53);
                  *(_DWORD *)&buf[v53 - 716] = *(_DWORD *)(a2 + v53 + 1020);
                  ++v52;
                  v51 = (_BYTE *)*(unsigned int *)(a2 + 4080);
                  v53 += 4;
                }
                while (v52 < (unint64_t)v51);
              }
              v55 = *(_DWORD *)(a2 + 8168);
              if (v51 < v55 + (int)v51)
              {
                v56 = v51;
                v57 = (CFTypeRef *)(a2 + 4088);
                v58 = (_DWORD *)(a2 + 6128);
                do
                {
                  CFRetain(*v57);
                  ID = IOSurfaceGetID((IOSurfaceRef)*v57);
                  v51 = &buf[4 * v56];
                  *((_DWORD *)v51 + 8) = ID;
                  *((_BYTE *)&v95[255] + v56) = *v58;
                  *((_DWORD *)v51 + 331) = v58[255];
                  ++v56;
                  LODWORD(v51) = *(_DWORD *)(a2 + 4080);
                  v55 = *(_DWORD *)(a2 + 8168);
                  ++v57;
                  ++v58;
                }
                while (v56 < (v55 + (_DWORD)v51));
              }
              LODWORD(v60) = *(_DWORD *)(a2 + 0x2000);
              if ((_DWORD)v60)
              {
                v61 = 0;
                do
                {
                  v62 = (CFTypeRef *)(a2 + 8176 + 8 * v61);
                  CFRetain(*v62);
                  v95[v61++ + 321] = IOSurfaceGetID((IOSurfaceRef)*v62);
                  v60 = *(unsigned int *)(a2 + 0x2000);
                }
                while (v61 < v60);
                LODWORD(v51) = *(_DWORD *)(a2 + 4080);
                v55 = *(_DWORD *)(a2 + 8168);
              }
              v98 = *(_WORD *)(a2 + 8401);
              v95[319] = v55;
              v95[320] = v60;
              v63 = *(_QWORD *)(a2 + 8232);
              *(_DWORD *)&buf[24] = *(_DWORD *)(a2 + 8240);
              v94 = (int)v51;
              v64 = *(_QWORD *)(a2 + 8256);
              *(_QWORD *)buf = v63;
              *(_QWORD *)&buf[8] = v64;
              *(_QWORD *)&buf[16] = *(_QWORD *)(a2 + 8244);
              LODWORD(v64) = *(_DWORD *)(a1 + 16);
              v96 = (_DWORD)v64 == 0;
              v100 = a3;
              v101 = v64;
              if (a3 && (v65 = *a3, (_DWORD)v65))
              {
                v66 = 0;
                v67 = (int *)(a3 + 3);
                do
                {
                  v68 = *v67;
                  v67 += 12;
                  if (v68 == 2)
                    v66 = 1;
                  --v65;
                }
                while (v65);
                v69 = v66 & 1;
              }
              else
              {
                v69 = 0;
              }
              if (a4)
              {
                ++*(_DWORD *)(a1 + 56);
                pthread_mutex_unlock((pthread_mutex_t *)(a1 + 112));
                v70 = (H11ANE::H11ANEFrameReceiver *)H11ANE::H11ANEDevice::ANE_ProgramSendRequest(*(_QWORD *)(a1 + 352), buf, *(_DWORD *)(a1 + 336), 1u, v87);
                v14 = (uint64_t)v70;
                if (!(_DWORD)v70)
                  H11ANE::H11ANEFrameReceiver::syncFrameDone(a1, a2, v87);
                H11ANE::H11ANEFrameReceiver::releaseRequestBuffers(v70, (H11ANE::H11ANEFrameReceiverRequest *)a2);
                H11ANE::H11ANEFrameReceiverRequest::~H11ANEFrameReceiverRequest((H11ANE::H11ANEFrameReceiverRequest *)a2);
                MEMORY[0x20BD010DC]();
                pthread_mutex_lock((pthread_mutex_t *)(a1 + 112));
                v71 = *(_DWORD *)(a1 + 56) - 1;
                *(_DWORD *)(a1 + 56) = v71;
                if (!v71)
                  pthread_cond_signal((pthread_cond_t *)(a1 + 64));
              }
              else
              {
                v86 = (H11ANE::H11ANEFrameReceiverRequest *)a2;
                v97 = *(_BYTE *)(a2 + 8400);
                pthread_mutex_lock((pthread_mutex_t *)(a1 + 176));
                std::deque<H11ANE::H11ANEFrameReceiverRequest *>::push_back((_QWORD *)(a1 + 360), &v86);
                pthread_mutex_unlock((pthread_mutex_t *)(a1 + 176));
                v14 = H11ANE::H11ANEDevice::ANE_ProgramSendRequest(*(_QWORD *)(a1 + 352), buf, *(_DWORD *)(a1 + 336), 0, v87);
                if ((_DWORD)v14)
                {
                  pthread_mutex_lock((pthread_mutex_t *)(a1 + 176));
                  v72 = *(_QWORD *)(a1 + 392);
                  v73 = *(_QWORD *)(a1 + 368);
                  v74 = *(_QWORD *)(a1 + 376);
                  v75 = (char *)(v73 + 8 * (v72 >> 9));
                  if (v74 == v73)
                    v76 = 0;
                  else
                    v76 = (char *)(*(_QWORD *)v75 + 8 * (*(_QWORD *)(a1 + 392) & 0x1FFLL));
LABEL_75:
                  v77 = v76;
                  while (1)
                  {
                    if (v74 == v73)
                      v78 = 0;
                    else
                      v78 = *(_QWORD *)(v73 + (((*(_QWORD *)(a1 + 400) + v72) >> 6) & 0x3FFFFFFFFFFFFF8))
                          + 8 * ((*(_QWORD *)(a1 + 400) + v72) & 0x1FF);
                    if (v77 == (char *)v78)
                    {
                      v80 = (H11ANE::H11ANEFrameReceiver *)pthread_mutex_unlock((pthread_mutex_t *)(a1 + 176));
                      H11ANE::H11ANEFrameReceiver::releaseRequestBuffers(v80, (H11ANE::H11ANEFrameReceiverRequest *)a2);
                      goto LABEL_13;
                    }
                    if (*(_QWORD *)v77 && *(_QWORD *)(*(_QWORD *)v77 + 8256) == *((_QWORD *)v86 + 1032))
                      break;
                    v77 += 8;
                    v76 += 8;
                    if ((char *)(*(_QWORD *)v75 + 4096) == v76)
                    {
                      v79 = (char *)*((_QWORD *)v75 + 1);
                      v75 += 8;
                      v76 = v79;
                      goto LABEL_75;
                    }
                  }
                  std::deque<H11ANE::H11ANEFrameReceiverRequest *>::erase((int64x2_t *)(a1 + 360), v75, v76);
                  v81 = (H11ANE::H11ANEFrameReceiver *)pthread_mutex_unlock((pthread_mutex_t *)(a1 + 176));
                  H11ANE::H11ANEFrameReceiver::releaseRequestBuffers(v81, (H11ANE::H11ANEFrameReceiverRequest *)a2);
                  if (v86)
                  {
                    H11ANE::H11ANEFrameReceiverRequest::~H11ANEFrameReceiverRequest(v86);
                    MEMORY[0x20BD010DC]();
                  }
                  v86 = 0;
                }
                else if (v69)
                {
                  H11ANE::H11ANEFrameReceiver::stopNoDataTimer((H11ANE::H11ANEFrameReceiver *)a1);
                }
                else if (*(_QWORD *)(a1 + 400) == 1)
                {
                  H11ANE::H11ANEFrameReceiver::startNoDataTimer((H11ANE::H11ANEFrameReceiver *)a1);
                }
              }
            }
          }
        }
        else
        {
          v14 = 3758097090;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            H11ANE::H11ANEFrameReceiver::ProgramProcessRequest(v34, v35, v36, v37, v38, v39, v40, v41);
        }
      }
      else
      {
        v14 = 3758097090;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          H11ANE::H11ANEFrameReceiver::ProgramProcessRequest(v26, v27, v28, v29, v30, v31, v32, v33);
      }
    }
    else
    {
      v14 = 3758097090;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        H11ANE::H11ANEFrameReceiver::ProgramProcessRequest();
    }
  }
LABEL_13:
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 112));
  v23 = +[ANEServicesLog handle](ANEServicesLog, "handle");
  if (v10 - 1 < 0xFFFFFFFFFFFFFFFELL)
  {
    v24 = v23;
    if (os_signpost_enabled(v23))
    {
      *(_DWORD *)v87 = 134218496;
      v88 = v83;
      v89 = 1024;
      v90 = v84;
      v91 = 2048;
      v92 = v85;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v24, OS_SIGNPOST_INTERVAL_END, v10, "H11ANEFrameReceiverProcessRequest", "progHandle=%llx procid=%x transid=%llx", v87, 0x1Cu);
    }
  }
  return v14;
}

void H11ANE::H11ANEFrameReceiver::syncFrameDone(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void (*v11)(_QWORD, uint64_t);
  uint64_t v12;
  __CVBuffer *v13;
  unsigned __int16 *BaseAddress;
  int v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  _QWORD *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = (_QWORD *)(a2 + 8232);
  v20 = *(_DWORD *)(a2 + 8240);
  v7 = (_QWORD *)(a2 + 8256);
  v18 = *(_QWORD *)(a2 + 8256);
  v19 = *(_QWORD *)(a2 + 8232);
  v8 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle](ANEServicesLog, "handle"), (const void *)0x61B220C);
  v9 = +[ANEServicesLog handle](ANEServicesLog, "handle");
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v9))
    {
      *(_DWORD *)buf = 134218752;
      v22 = v19;
      v23 = 1024;
      v24 = v20;
      v25 = 2048;
      v26 = v18;
      v27 = 2048;
      v28 = a3;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "H11ANEFrameReceiverFrameDone", "progHandle=%llx procid=%x transid=%llx reqcallBackData=%llx", buf, 0x26u);
    }
  }
  if (*v7 != *a3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    H11ANE::H11ANEFrameReceiver::syncFrameDone();
  if (*v6 != a3[1] && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    H11ANE::H11ANEFrameReceiver::syncFrameDone();
  *(_BYTE *)(a2 + 8288) = a3[2];
  v11 = *(void (**)(_QWORD, uint64_t))(a1 + 32);
  if (v11)
  {
    v12 = a3[3];
    if (v12)
    {
      *(_DWORD *)(a2 + 8224) = 0;
      *(_QWORD *)(a2 + 8264) = v12 | 0x1000;
      v11(*(_QWORD *)(a1 + 24), a2);
    }
    *(_QWORD *)(a2 + 8264) = 0;
    if (debugFwStatsData)
    {
      v13 = *(__CVBuffer **)(a2 + 8200);
      if (v13)
      {
        if ((*(_BYTE *)(a2 + 8196) & 0xB) != 0)
        {
          CVPixelBufferLockBaseAddress(v13, 0);
          BaseAddress = (unsigned __int16 *)CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(a2 + 8200));
          H11ANE::dumpFwStatsData(BaseAddress);
          CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(a2 + 8200), 0);
        }
      }
    }
    if (a3[4] == 1)
      v15 = 0;
    else
      v15 = -536870165;
    *(_DWORD *)(a2 + 8224) = v15;
    (*(void (**)(_QWORD, uint64_t))(a1 + 32))(*(_QWORD *)(a1 + 24), a2);
  }
  v16 = +[ANEServicesLog handle](ANEServicesLog, "handle");
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v17 = v16;
    if (os_signpost_enabled(v16))
    {
      *(_DWORD *)buf = 134218752;
      v22 = v19;
      v23 = 1024;
      v24 = v20;
      v25 = 2048;
      v26 = v18;
      v27 = 2048;
      v28 = a3;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v17, OS_SIGNPOST_INTERVAL_END, v8, "H11ANEFrameReceiverFrameDone", "progHandle=%llx procid=%x transid=%llx reqCb->programHandle=0x%llx", buf, 0x26u);
    }
  }
}

void H11ANE::H11ANEFrameReceiverRequest::~H11ANEFrameReceiverRequest(H11ANE::H11ANEFrameReceiverRequest *this)
{
  const void *v1;

  v1 = (const void *)*((_QWORD *)this + 1035);
  if (v1)
    _Block_release(v1);
}

void H11ANE::H11ANEFrameReceiver::releaseRequestBuffers(H11ANE::H11ANEFrameReceiver *this, H11ANE::H11ANEFrameReceiverRequest *a2)
{
  unint64_t v3;
  unint64_t i;
  const void *v5;
  unsigned int v6;
  unsigned __int8 j;
  const void *v8;
  unsigned int v9;
  unsigned __int8 k;
  const void *v11;
  __CVBuffer *v12;
  const void *v13;
  const void *v14;

  if (a2)
  {
    v3 = *((unsigned int *)a2 + 1020);
    if ((_DWORD)v3)
    {
      for (i = 0; i < v3; ++i)
      {
        v5 = (const void *)*((_QWORD *)a2 + i);
        if (v5)
        {
          CFRelease(v5);
          v3 = *((unsigned int *)a2 + 1020);
        }
      }
    }
    *((_DWORD *)a2 + 1020) = 0;
    v6 = *((_DWORD *)a2 + 2042);
    if (v6)
    {
      for (j = 0; j < v6; ++j)
      {
        v8 = (const void *)*((_QWORD *)a2 + j + 511);
        if (v8)
        {
          CFRelease(v8);
          v6 = *((_DWORD *)a2 + 2042);
        }
      }
    }
    *((_DWORD *)a2 + 2042) = 0;
    v9 = *((_DWORD *)a2 + 2048);
    if (v9)
    {
      for (k = 0; k < v9; ++k)
      {
        v11 = (const void *)*((_QWORD *)a2 + k + 1022);
        if (v11)
        {
          CFRelease(v11);
          v9 = *((_DWORD *)a2 + 2048);
        }
      }
    }
    *((_DWORD *)a2 + 2048) = 0;
    v12 = (__CVBuffer *)*((_QWORD *)a2 + 1025);
    if (v12)
      CVPixelBufferRelease(v12);
    v13 = (const void *)*((_QWORD *)a2 + 1026);
    if (v13)
      CFRelease(v13);
    v14 = (const void *)*((_QWORD *)a2 + 1027);
    if (v14)
      CFRelease(v14);
  }
}

uint64_t H11ANE::H11ANEDevice::ANE_ProgramSendRequest(uint64_t a1, _DWORD *a2, mach_port_t a3, unsigned int a4, void *a5)
{
  uint64_t v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  int v18;
  uint64_t v19;
  size_t v20;
  uint64_t input;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  int v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v18 = a2[6];
  v10 = *(_QWORD *)a2;
  v19 = *((_QWORD *)a2 + 1);
  v11 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle](ANEServicesLog, "handle"), (const void *)0x61B200C);
  v12 = +[ANEServicesLog handle](ANEServicesLog, "handle");
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v13 = v12;
    if (os_signpost_enabled(v12))
    {
      *(_DWORD *)buf = 134218496;
      v23 = v10;
      v24 = 1024;
      v25 = v18;
      v26 = 2048;
      v27 = v19;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "H11ANEDeviceSendRequest", "progHandle=%llx procid=%x transid=%llx", buf, 0x1Cu);
    }
  }
  v20 = 40;
  input = a4;
  v14 = IOConnectCallAsyncMethod(*(_DWORD *)(a1 + 64), 2u, a3, 0, 0, &input, 1u, a2, 0x948uLL, 0, 0, a5, &v20);
  if ((_DWORD)v14 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    H11ANE::H11ANEDevice::ANE_ProgramSendRequest(v14);
  v15 = +[ANEServicesLog handle](ANEServicesLog, "handle");
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v16 = v15;
    if (os_signpost_enabled(v15))
    {
      *(_DWORD *)buf = 134218496;
      v23 = v10;
      v24 = 1024;
      v25 = v18;
      v26 = 2048;
      v27 = v19;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v16, OS_SIGNPOST_INTERVAL_END, v11, "H11ANEDeviceSendRequest", "progHandle=%llx procid=%x transid=%llx", buf, 0x1Cu);
    }
  }
  return v14;
}

void H11ANEFrameProcDirect(void *a1, H11ANE::H11ANEFrameReceiverRequest *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  os_signpost_id_t v6;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  const char *v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  __CVBuffer *v16;
  unsigned __int16 *BaseAddress;
  int v18;
  int v19;
  int v20;
  unsigned __int16 *v21;
  unsigned int *v22;
  uint64_t v23;
  unsigned int v24;
  NSObject *v25;
  const char *v26;
  uint32_t v27;
  NSObject *v28;
  const char *v29;
  uint32_t v30;
  char *v31;
  char *v32;
  int v33;
  __CVBuffer *v34;
  __CVBuffer *v35;
  int v36;
  char *v37;
  unsigned int *v38;
  unsigned int *v39;
  uint64_t v40;
  int v41;
  unsigned int *v42;
  uint64_t v43;
  unsigned int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  NSObject *v49;
  NSObject *v50;
  const char *v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  NSObject *v57;
  const char *v58;
  int v59;
  uint64_t v60;
  __CVBuffer *v61;
  NSObject *v62;
  NSObject *v63;
  const char *v64;
  int v65;
  uint64_t v66;
  _BOOL8 v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _DWORD *v75;
  _DWORD *v76;
  _DWORD *v77;
  int v78;
  int v79;
  unsigned int *v80;
  uint64_t v81;
  unsigned int v82;
  int v83;
  unsigned int v84;
  unsigned int v85;
  unsigned int v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  _QWORD *v94;
  char *v95;
  uint64_t v96;
  char PerfCounterInfo;
  uint64_t v98;
  char v99;
  unsigned int v100;
  int v101;
  char *v102;
  unint64_t v103;
  _QWORD *v104;
  char *v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  char *v109;
  _QWORD *v110;
  char v111;
  unsigned int v112;
  unint64_t v113;
  unint64_t v114;
  unint64_t v115;
  unint64_t v116;
  NSObject *v117;
  uint64_t v118;
  unint64_t v119;
  unint64_t v120;
  unint64_t v121;
  unint64_t *v122;
  int v123;
  uint64_t v124;
  int v125;
  unint64_t v127;
  int v128;
  uint64_t v129;
  __IOSurface *v130;
  char *v131;
  uint64_t v132;
  unint64_t v133;
  uint64_t v134;
  unint64_t v135;
  unint64_t v136;
  NSObject *v137;
  uint64_t v138;
  unint64_t v139;
  unint64_t v140;
  unint64_t v141;
  uint64_t v142;
  int v143;
  uint64_t v144;
  int v145;
  unint64_t v147;
  int v148;
  __IOSurface *v149;
  unint64_t v150;
  uint64_t v151;
  char *v152;
  uint64_t v153;
  char *v154;
  uint64_t *v155;
  unint64_t v156;
  char *v157;
  uint64_t v158;
  void *v159;
  unsigned int v160;
  unint64_t v161;
  uint64_t v162;
  uint64_t *v163;
  unint64_t v164;
  _QWORD *v165;
  uint64_t v166;
  void *v167;
  unsigned int AllocSize;
  unint64_t v169;
  char *v170;
  _DWORD *v171;
  uint64_t v172;
  uint64_t v173;
  __IOSurface *buffer;
  unsigned int v175;
  _DWORD *v176;
  int v177;
  unsigned int *v178;
  int v179;
  unsigned int *v180;
  int v181;
  unsigned int v182;
  uint64_t v183;
  unint64_t v184;
  unsigned __int8 *v185;
  unsigned int v186;
  unsigned int v187;
  uint64_t v188;
  unint64_t v189;
  unint64_t v190;
  unint64_t v191;
  unint64_t v192;
  unint64_t v193;
  int v194;
  unint64_t v195;
  char *v196;
  unint64_t v197;
  _DWORD *v198;
  char *v199;
  int v200;
  int v201;
  int v202;
  uint64_t v203;
  H11ANE::H11ANEFrameReceiverBufferPool *v204;
  os_signpost_id_t spid;
  os_signpost_id_t v206;
  _DWORD v207[2];
  char *v208;
  char *v209;
  uint64_t v210;
  char *v211;
  uint64_t v212;
  int v213;
  int v214;
  int v215;
  int v216;
  char v217;
  __CVBuffer *v218;
  _DWORD v219[2];
  __CVBuffer **v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  uint8_t buf[4];
  const char *v225;
  __int16 v226;
  _BYTE v227[18];
  uint64_t v228;
  _DWORD v229[4];
  uint64_t v230;

  v230 = *MEMORY[0x24BDAC8D0];
  v3 = *((_QWORD *)a2 + 1035);
  v4 = *(_QWORD *)(*((_QWORD *)a2 + 1034) + 16);
  v5 = 0x24C06A000uLL;
  v6 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle](ANEServicesLog, "handle"), (const void *)0x61B241C);
  v7 = +[ANEServicesLog handle](ANEServicesLog, "handle");
  spid = v6;
  v8 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v7;
    if (os_signpost_enabled(v7))
    {
      v10 = (const char *)*((_QWORD *)a2 + 1029);
      v11 = *((_DWORD *)a2 + 2060);
      v12 = *((_QWORD *)a2 + 1032);
      *(_DWORD *)buf = 134218496;
      v225 = v10;
      v226 = 1024;
      *(_DWORD *)v227 = v11;
      *(_WORD *)&v227[4] = 2048;
      *(_QWORD *)&v227[6] = v12;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ServicesFrameProcDirect", "progHandle=%llx procid=%x transid=%llx", buf, 0x1Cu);
    }
  }
  v206 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle](ANEServicesLog, "handle"), (const void *)0x61B2434);
  if (*((_QWORD *)a2 + 1033))
  {
    v13 = *((_DWORD *)a2 + 2056);
    if (v13 <= -536870185)
    {
      switch(v13)
      {
        case -536870211:
          v15 = 1;
          break;
        case -536870210:
          v15 = 5;
          break;
        case -536870209:
        case -536870208:
        case -536870205:
        case -536870204:
        case -536870203:
        case -536870202:
          goto LABEL_25;
        case -536870207:
          v15 = 20;
          break;
        case -536870206:
          v15 = 2;
          break;
        case -536870201:
          v15 = 24;
          break;
        default:
          if (v13 == -536870191)
          {
            v15 = 19;
          }
          else if (v13 == -536870186)
          {
            v15 = 15;
          }
          else
          {
LABEL_25:
            v15 = 18;
          }
          break;
      }
    }
    else
    {
      v14 = v13 + 536870176;
      v15 = 4;
      switch(v14)
      {
        case 0:
          v15 = 26;
          break;
        case 2:
          v15 = 23;
          break;
        case 3:
          v15 = 10;
          break;
        case 7:
          v15 = 29;
          break;
        case 11:
          v15 = 21;
          break;
        case 13:
          v15 = 27;
          break;
        case 14:
          v15 = 28;
          break;
        case 16:
          break;
        default:
          goto LABEL_25;
      }
    }
    LODWORD(v218) = *((_QWORD *)a2 + 1033);
    if (v3)
    {
      v219[0] = 19;
      v219[1] = v15;
      v220 = &v218;
      v221 = 0u;
      v222 = 0u;
      v223 = 0u;
      (*(void (**)(uint64_t, _DWORD *))(v3 + 16))(v3, v219);
    }
    v49 = +[ANEServicesLog handle](ANEServicesLog, "handle");
    if (v206 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v50 = v49;
      if (os_signpost_enabled(v49))
      {
        v51 = (const char *)*((_QWORD *)a2 + 1029);
        v52 = *((_DWORD *)a2 + 2060);
        v53 = *((_QWORD *)a2 + 1032);
        *(_DWORD *)buf = 134218496;
        v225 = v51;
        v226 = 1024;
        *(_DWORD *)v227 = v52;
        *(_WORD *)&v227[4] = 2048;
        *(_QWORD *)&v227[6] = v53;
        _os_signpost_emit_with_name_impl(&dword_207C43000, v50, OS_SIGNPOST_INTERVAL_BEGIN, v206, "ServicesClientCallback", "progHandle=%llx procid=%x transid=%llx", buf, 0x1Cu);
      }
    }
    goto LABEL_107;
  }
  v218 = 0;
  if (!*((_BYTE *)a2 + 8196))
    goto LABEL_60;
  v16 = (__CVBuffer *)*((_QWORD *)a2 + 1025);
  if (!v16)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v225 = "H11ANEFrameProcDirect";
      v25 = MEMORY[0x24BDACB70];
      v26 = "ERROR %s: Stats CV Pixel Buffer is not allocated\n";
      v27 = 12;
LABEL_59:
      _os_log_impl(&dword_207C43000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, v27);
    }
LABEL_60:
    v31 = 0;
    v201 = 0;
    v203 = 0;
    v32 = 0;
    LODWORD(v4) = 0;
    v33 = 0;
    v204 = 0;
    goto LABEL_61;
  }
  CVPixelBufferLockBaseAddress(v16, 0);
  BaseAddress = (unsigned __int16 *)CVPixelBufferGetBaseAddress(*((CVPixelBufferRef *)a2 + 1025));
  v18 = *((_DWORD *)BaseAddress + 7);
  if (!v18)
  {
    v20 = 0;
    goto LABEL_27;
  }
  v19 = *BaseAddress;
  if (v19 != 513 && v19 != 257)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v225 = "H11ANEFrameProcDirect";
      v226 = 1024;
      *(_DWORD *)v227 = v19;
      v25 = MEMORY[0x24BDACB70];
      v26 = "ERROR %s: Invalid stats version %u\n";
      v27 = 18;
      goto LABEL_59;
    }
    goto LABEL_60;
  }
  v20 = 0;
  v21 = BaseAddress + 4;
  if (v19 == 513)
    v21 = BaseAddress + 2;
  v22 = (unsigned int *)(BaseAddress + 16);
  v23 = *((unsigned int *)BaseAddress + 7);
  do
  {
    v24 = *v22;
    v22 += 2;
    v20 += *(_DWORD *)((char *)v21 + v24);
    --v23;
  }
  while (v23);
LABEL_27:
  v204 = (H11ANE::H11ANEFrameReceiverBufferPool *)operator new();
  H11ANE::H11ANEFrameReceiverBufferPool::H11ANEFrameReceiverBufferPool((uint64_t)v204, 3, 0, ((unint64_t)(16 * v20 + 8 * v18 + 552) + 240) >> 4, 8, 0, 0, 2, 0, 64, 128, 8, 0, 1);
  if (H11ANE::H11ANEFrameReceiverBufferPool::activatePool(v204))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v225 = "H11ANEFrameProcDirect";
      v28 = MEMORY[0x24BDACB70];
      v29 = "%s: Stats App Buffer Pool is not allocated\n";
      v30 = 12;
LABEL_30:
      _os_log_impl(&dword_207C43000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, v30);
    }
LABEL_31:
    v31 = 0;
    v203 = 0;
    v32 = 0;
    LODWORD(v4) = 0;
LABEL_32:
    v201 = 0;
    v33 = 0;
    goto LABEL_61;
  }
  if (!v4)
  {
    v31 = 0;
    v203 = 0;
    v32 = 0;
    goto LABEL_32;
  }
  v200 = *((_DWORD *)a2 + 2049);
  v183 = *(unsigned int *)(v4 + 104);
  v184 = *(unsigned int *)(v4 + 120);
  v185 = *(unsigned __int8 **)(v4 + 136);
  v186 = *(_DWORD *)(v4 + 128);
  if (!H11ANE::H11ANEFrameReceiverBufferPool::allocateBuffer(v204, &v218))
    CVPixelBufferLockBaseAddress(v218, 0);
  if (!v200 || (v34 = (__CVBuffer *)*((_QWORD *)a2 + 1025)) == 0 || (v35 = v218) == 0)
  {
    v67 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v67)
      H11ANEFrameProcDirect(v67, v68, v69, v70, v71, v72, v73, v74);
    goto LABEL_31;
  }
  if ((v200 & 0xF) == 0)
    goto LABEL_31;
  buffer = (__IOSurface *)*((_QWORD *)a2 + 1027);
  v36 = *(unsigned __int16 *)CVPixelBufferGetBaseAddress(v34);
  if (v36 == 513)
  {
    v75 = CVPixelBufferGetBaseAddress(v35);
    v76 = CVPixelBufferGetBaseAddress(v34);
    v77 = v76;
    v177 = v76[1];
    v78 = v76[7];
    if (v78)
    {
      v79 = 0;
      v80 = v76 + 8;
      v81 = v76[7];
      do
      {
        v82 = *v80;
        v80 += 2;
        v79 += *(_DWORD *)((char *)v76 + v82 + 4);
        --v81;
      }
      while (v81);
      v83 = 16 * v79 + 552;
    }
    else
    {
      v83 = 552;
    }
    v99 = v200;
    v101 = v76[2];
    v100 = v76[3];
    v182 = v100;
    v198 = v76;
    v179 = v101;
    if ((v200 & 0xA) != 0)
    {
      v194 = v83;
      *v75 = 1;
      v75[1] = v177;
      v75[2] = v101;
      v75[3] = v100;
      *((_QWORD *)v75 + 2) = *((_QWORD *)v76 + 2);
      v75[6] = v76[6];
      v102 = (char *)v75;
      v75[136] = v78;
      v202 = v78;
      if (v78)
      {
        v103 = 0;
        v104 = v75 + 142;
        v105 = (char *)(v76 + 38);
        do
        {
          v106 = v77[2 * v103 + 8];
          v107 = (char *)v77 + v106;
          if ((v107[16] & 1) != 0 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v225 = "processDramLogStatsBuffer";
            v226 = 1024;
            *(_DWORD *)v227 = v103;
            _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "WARNING %s: Dram log events overflow for descriptor: %u. Not all events might be present in statsbuffer.\n", buf, 0x12u);
          }
          v108 = *((unsigned int *)v107 + 1);
          *(int32x2_t *)&v102[8 * v103 + 552] = vdup_n_s32(v108);
          if ((_DWORD)v108)
          {
            v109 = &v105[v106];
            v110 = v104;
            do
            {
              *((_DWORD *)v110 - 2) = *(unsigned __int16 *)v109;
              *((_WORD *)v110 - 2) = v109[3];
              *((_WORD *)v110 - 1) = *((_WORD *)v109 + 2) & 0x1F;
              *v110 = *((_QWORD *)v109 + 1);
              v110 += 2;
              v109 += 16;
              --v108;
            }
            while (v108);
          }
          ++v103;
          v77 = v198;
          ++v104;
        }
        while (v103 < v198[7]);
      }
      v75 = v102;
      v102[28] = ZinAnalyticsGetPerfCounterInfo(v185, v186, (char (*)[128])(v102 + 29));
      v172 = (v194 + 8 * v202);
      v201 = v194 + 8 * v202;
      v203 = (uint64_t)v102;
      v99 = v200;
      v100 = v182;
      v101 = v179;
    }
    else
    {
      v201 = 0;
      v203 = 0;
      v172 = 0;
    }
    if ((v99 & 9) == 0)
    {
      v31 = 0;
      LODWORD(v4) = 0;
      v153 = 0;
      v149 = buffer;
      goto LABEL_233;
    }
    v133 = v77[7];
    if (!(_DWORD)v133)
    {
      v135 = 0;
      v136 = -1;
      v149 = buffer;
      goto LABEL_230;
    }
    v171 = v75;
    v134 = 0;
    v135 = 0;
    v176 = v77 + 41;
    v136 = -1;
    v137 = MEMORY[0x24BDACB70];
    while (1)
    {
      v138 = v77[2 * v134 + 8];
      v196 = (char *)v77 + v138;
      v139 = *(unsigned int *)((char *)v77 + v138 + 4);
      if ((_DWORD)v139)
        break;
      v141 = 0;
      v147 = -1;
LABEL_206:
      if (v136 >= v147)
        v136 = v147;
      if (v135 <= v141)
        v135 = v141;
      if (++v134 >= v133)
      {
        v149 = buffer;
        if (v136 == -1)
        {
          v99 = v200;
          v100 = v182;
          v75 = v171;
          v101 = v179;
          v5 = 0x24C06A000;
        }
        else
        {
          v99 = v200;
          v100 = v182;
          v75 = v171;
          v101 = v179;
          v5 = 0x24C06A000;
          if (v135)
          {
            v150 = v135 - v136;
            if (v135 >= v136)
            {
              v151 = v172;
              v152 = (char *)v171 + v172;
              *(_DWORD *)v152 = 0;
              v31 = (char *)v171 + v172;
              *((_QWORD *)v152 + 1) = v150;
              v153 = 4;
              LODWORD(v4) = 16;
LABEL_234:
              if ((v99 & 0xC) != 0)
              {
                v32 = (char *)v75 + v151 + v153 * 4;
                *(_DWORD *)v32 = 2;
                if (v184 >= 8)
                {
                  v162 = v151;
                  v163 = (uint64_t *)((char *)v198 + v183);
                  v164 = v184 >> 3;
                  v165 = (_QWORD *)((char *)&v75[v153 + 2] + v162);
                  do
                  {
                    v166 = *v163++;
                    *v165++ = v166;
                    --v164;
                  }
                  while (v164);
                }
                v33 = 224;
              }
              else
              {
                v32 = 0;
                v33 = 0;
              }
              if ((v99 & 8) != 0 && v149)
              {
                IOSurfaceLock(v149, 0, 0);
                v167 = IOSurfaceGetBaseAddress(buffer);
                AllocSize = IOSurfaceGetAllocSize(buffer);
                ZinCreateAnalytics(v182, v203, (uint64_t)v32, v185, v186, (unint64_t)v167, AllocSize);
                IOSurfaceUnlock(buffer, 0, 0);
              }
              goto LABEL_61;
            }
          }
        }
LABEL_230:
        v193 = v135;
        v161 = v136;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v225 = "processDramLogStatsBuffer";
          v226 = 1024;
          *(_DWORD *)v227 = v177;
          *(_WORD *)&v227[4] = 1024;
          *(_DWORD *)&v227[6] = v101;
          *(_WORD *)&v227[10] = 1024;
          *(_DWORD *)&v227[12] = v100;
          *(_WORD *)&v227[16] = 2048;
          v228 = v161;
          LOWORD(v229[0]) = 2048;
          *(_QWORD *)((char *)v229 + 2) = v193;
          _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: Error Calcuating HwExecution Time for programId: %u processId: %u procedureId: %u, StartTime: %llu, nFinishTime: %llu\n", buf, 0x32u);
        }
        v31 = 0;
        LODWORD(v4) = 0;
        v153 = 0;
LABEL_233:
        v151 = v172;
        goto LABEL_234;
      }
    }
    v188 = v134;
    v190 = v136;
    v192 = v135;
    v140 = 0;
    v141 = 0;
    v142 = (uint64_t)v176 + v138;
    v143 = 30;
    v144 = -1;
    while (1)
    {
      v145 = HIBYTE(*(_DWORD *)(v142 - 12));
      if (v145 != 5 && v145 != 3)
        goto LABEL_203;
      v147 = *(_QWORD *)(v142 - 4);
      if (v143 == 30)
        break;
      if (v143 == 5 && v145 == 5)
      {
        v143 = 5;
LABEL_202:
        v141 = *(_QWORD *)(v142 - 4);
        goto LABEL_203;
      }
      if (v143 == 3 && v145 == 3)
      {
LABEL_204:
        v77 = v198;
        v133 = v198[7];
        v136 = v190;
        v135 = v192;
        v134 = v188;
        goto LABEL_206;
      }
LABEL_203:
      v142 += 16;
      ++v140;
      v147 = v144;
      if (v140 >= v139)
        goto LABEL_204;
    }
    if (v145 == 3)
    {
      v148 = (unsigned __int16)*(_DWORD *)(v142 - 12);
      if ((unsigned __int16)*(_DWORD *)(v142 - 12) && os_log_type_enabled(v137, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        v225 = "void processDramLogStatsBuffer(uint32_t, CVPixelBufferRef, CVPixelBufferRef, ANENotificationMessage *, ui"
               "nt32_t, uint32_t, mach_vm_address_t, uint32_t, IOSurfaceRef)";
        v226 = 1024;
        *(_DWORD *)v227 = v177;
        *(_WORD *)&v227[4] = 1024;
        *(_DWORD *)&v227[6] = v179;
        *(_WORD *)&v227[10] = 1024;
        *(_DWORD *)&v227[12] = v182;
        *(_WORD *)&v227[16] = 1024;
        LODWORD(v228) = v148;
        _os_log_impl(&dword_207C43000, v137, OS_LOG_TYPE_DEFAULT, "%s: programId: %u, processId: %u, procedureId: %u,  tid %u is first start event\n", buf, 0x24u);
        v139 = *((unsigned int *)v196 + 1);
      }
      v143 = 5;
      v144 = v147;
      goto LABEL_203;
    }
    v143 = 3;
    goto LABEL_202;
  }
  if (v36 != 257)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    *(_DWORD *)buf = 136315394;
    v225 = "processStatsBuffer";
    v226 = 1024;
    *(_DWORD *)v227 = v36;
    v28 = MEMORY[0x24BDACB70];
    v29 = "ERROR %s: Invalid stats version %u\n";
    v30 = 18;
    goto LABEL_30;
  }
  v37 = (char *)CVPixelBufferGetBaseAddress(v35);
  v38 = (unsigned int *)CVPixelBufferGetBaseAddress(v34);
  v39 = v38;
  v181 = v38[2];
  v40 = v38[7];
  if ((_DWORD)v40)
  {
    v41 = 0;
    v42 = v38 + 8;
    v43 = v38[7];
    do
    {
      v44 = *v42;
      v42 += 2;
      v41 += *(unsigned int *)((char *)v38 + v44 + 8);
      --v43;
    }
    while (v43);
    v45 = 16 * v41 + 552;
  }
  else
  {
    v45 = 552;
  }
  v84 = v38[1];
  v85 = v38[3];
  v187 = v85;
  if ((v200 & 0xA) != 0)
  {
    *(_DWORD *)v37 = 1;
    *((_DWORD *)v37 + 1) = v84;
    v86 = v84;
    *((_DWORD *)v37 + 2) = v181;
    *((_DWORD *)v37 + 3) = v85;
    *((_QWORD *)v37 + 2) = *((_QWORD *)v38 + 2);
    *((_DWORD *)v37 + 6) = v38[6];
    *((_DWORD *)v37 + 136) = v40;
    if ((_DWORD)v40)
    {
      v87 = 0;
      v88 = v37;
      do
      {
        v89 = v38[2 * v87 + 8];
        v90 = *(unsigned int *)((char *)v38 + v89 + 8);
        v91 = &v37[8 * v87];
        *((_DWORD *)v91 + 139) = v90;
        *((_DWORD *)v91 + 138) = *(unsigned int *)((char *)v38 + v89 + 4);
        if ((_DWORD)v90)
        {
          v92 = 0;
          v93 = 16 * v90;
          v94 = (_QWORD *)((char *)v38 + v89 + 24);
          do
          {
            v95 = &v88[v92];
            *((_DWORD *)v95 + 140) = *((_DWORD *)v94 - 3);
            *((_WORD *)v95 + 282) = *((_DWORD *)v94 - 1);
            *((_WORD *)v95 + 283) = *((unsigned __int8 *)v94 - 2);
            v96 = *v94;
            v94 = (_QWORD *)((char *)v94 + 20);
            *((_QWORD *)v95 + 71) = v96;
            v92 += 16;
          }
          while (v93 != v92);
        }
        ++v87;
        v88 += 8;
      }
      while (v87 != v40);
    }
    PerfCounterInfo = ZinAnalyticsGetPerfCounterInfo(v185, v186, (char (*)[128])(v37 + 29));
    v98 = (v45 + 8 * v40);
    v37[28] = PerfCounterInfo;
    v201 = v45 + 8 * v40;
    v203 = (uint64_t)v37;
  }
  else
  {
    v86 = v38[1];
    v201 = 0;
    v203 = 0;
    v98 = 0;
  }
  v173 = v98;
  v111 = v200;
  if ((v200 & 9) == 0)
    goto LABEL_219;
  v112 = v86;
  v113 = v39[7];
  if (!(_DWORD)v113)
  {
    v115 = 0;
    v129 = -1;
    goto LABEL_217;
  }
  v169 = v8;
  v170 = v37;
  v175 = v86;
  v114 = 0;
  v115 = 0;
  v178 = v39 + 6;
  v116 = -1;
  v117 = MEMORY[0x24BDACB70];
  v180 = v39;
  do
  {
    v118 = v39[2 * v114 + 8];
    v199 = (char *)v39 + v118;
    v119 = *(unsigned int *)((char *)v39 + v118 + 8);
    if ((_DWORD)v119)
    {
      v189 = v114;
      v191 = v116;
      v195 = v115;
      v120 = 0;
      v121 = 0;
      v122 = (unint64_t *)((char *)v178 + v118);
      v123 = 30;
      v124 = -1;
      while (1)
      {
        v125 = *((unsigned __int16 *)v122 - 2);
        if (v125 != 5 && v125 != 3)
          goto LABEL_166;
        v127 = *v122;
        if (v123 == 30)
          break;
        if (v123 == 5 && v125 == 5)
        {
          v123 = 5;
LABEL_165:
          v121 = *v122;
          goto LABEL_166;
        }
        if (v123 == 3 && v125 == 3)
        {
LABEL_167:
          v39 = v180;
          v113 = v180[7];
          v116 = v191;
          v115 = v195;
          v114 = v189;
          goto LABEL_169;
        }
LABEL_166:
        v122 = (unint64_t *)((char *)v122 + 20);
        ++v120;
        v127 = v124;
        if (v120 >= v119)
          goto LABEL_167;
      }
      if (v125 == 3)
      {
        v128 = *((_DWORD *)v122 - 3);
        if (v128 && os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          v225 = "void processDebugLogStatsBuffer(uint32_t, CVPixelBufferRef, CVPixelBufferRef, ANENotificationMessage *,"
                 " uint32_t, uint32_t, mach_vm_address_t, uint32_t, IOSurfaceRef)";
          v226 = 1024;
          *(_DWORD *)v227 = v175;
          *(_WORD *)&v227[4] = 1024;
          *(_DWORD *)&v227[6] = v181;
          *(_WORD *)&v227[10] = 1024;
          *(_DWORD *)&v227[12] = v187;
          *(_WORD *)&v227[16] = 1024;
          LODWORD(v228) = v128;
          _os_log_impl(&dword_207C43000, v117, OS_LOG_TYPE_DEFAULT, "%s: programId: %u, processId: %u, procedureId: %u,  tid %u is first start event\n", buf, 0x24u);
          v119 = *((unsigned int *)v199 + 2);
        }
        v123 = 5;
        v124 = v127;
        goto LABEL_166;
      }
      v123 = 3;
      goto LABEL_165;
    }
    v121 = 0;
    v127 = -1;
LABEL_169:
    if (v116 >= v127)
      v116 = v127;
    if (v115 <= v121)
      v115 = v121;
    ++v114;
  }
  while (v114 < v113);
  v129 = v116;
  if (v116 == -1)
  {
    v111 = v200;
    v85 = v187;
    v8 = v169;
    v37 = v170;
    v112 = v175;
  }
  else
  {
    v130 = buffer;
    v111 = v200;
    v85 = v187;
    v8 = v169;
    v37 = v170;
    v112 = v175;
    if (v115 && v115 >= v116)
    {
      v131 = &v170[v173];
      *(_DWORD *)v131 = 0;
      v31 = &v170[v173];
      *((_QWORD *)v131 + 1) = v115 - v116;
      LODWORD(v4) = 16;
      v132 = 16;
      goto LABEL_220;
    }
  }
LABEL_217:
  v197 = v115;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v225 = "processDebugLogStatsBuffer";
    v226 = 1024;
    *(_DWORD *)v227 = v112;
    *(_WORD *)&v227[4] = 1024;
    *(_DWORD *)&v227[6] = v181;
    *(_WORD *)&v227[10] = 1024;
    *(_DWORD *)&v227[12] = v85;
    *(_WORD *)&v227[16] = 2048;
    v228 = v129;
    LOWORD(v229[0]) = 2048;
    *(_QWORD *)((char *)v229 + 2) = v197;
    _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: Error Calcuating HwExecution Time for programId: %u processId: %u procedureId: %u, StartTime: %llu, nFinishTime: %llu\n", buf, 0x32u);
  }
LABEL_219:
  v31 = 0;
  LODWORD(v4) = 0;
  v132 = 0;
  v130 = buffer;
LABEL_220:
  if ((v111 & 0xC) != 0)
  {
    v154 = v37;
    v32 = &v37[v173 + v132];
    *(_DWORD *)v32 = 2;
    if (v184 >= 8)
    {
      v155 = (uint64_t *)((char *)v39 + v183);
      v156 = v184 >> 3;
      v157 = &v154[v132 + 8 + v173];
      do
      {
        v158 = *v155++;
        *(_QWORD *)v157 = v158;
        v157 += 8;
        --v156;
      }
      while (v156);
    }
    v33 = 224;
  }
  else
  {
    v32 = 0;
    v33 = 0;
  }
  if ((v111 & 8) != 0 && v130)
  {
    IOSurfaceLock(v130, 0, 0);
    v159 = IOSurfaceGetBaseAddress(buffer);
    v160 = IOSurfaceGetAllocSize(buffer);
    ZinCreateAnalytics(v187, v203, (uint64_t)v32, v185, v186, (unint64_t)v159, v160);
    IOSurfaceUnlock(buffer, 0, 0);
  }
LABEL_61:
  v46 = *((_DWORD *)a2 + 2056);
  if (v46 == -536870186)
    v47 = 17;
  else
    v47 = 8;
  v217 = *((_BYTE *)a2 + 8288);
  if (v46 <= -536870185)
  {
    switch(v46)
    {
      case -536870211:
        v48 = 1;
        goto LABEL_94;
      case -536870210:
        v48 = 5;
        goto LABEL_94;
      case -536870209:
      case -536870208:
      case -536870205:
      case -536870204:
      case -536870203:
      case -536870202:
        goto LABEL_84;
      case -536870207:
        v48 = 20;
        goto LABEL_94;
      case -536870206:
        v48 = 2;
        goto LABEL_94;
      case -536870201:
        v48 = 24;
        goto LABEL_94;
      default:
        if (v46 == -536870191)
        {
          v48 = 19;
        }
        else if (v46 == -536870186)
        {
          v48 = 15;
        }
        else
        {
LABEL_84:
          v48 = 18;
          if (!v46)
            break;
        }
LABEL_94:
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v54 = *((_QWORD *)a2 + 1029);
          v55 = *((_QWORD *)a2 + 1032);
          *(_DWORD *)buf = 136316162;
          v225 = "void H11ANEFrameProcDirect(void *, H11ANEFrameReceiverRequest *)";
          v226 = 2048;
          *(_QWORD *)v227 = v54;
          *(_WORD *)&v227[8] = 2048;
          *(_QWORD *)&v227[10] = v55;
          LOWORD(v228) = 1024;
          *(_DWORD *)((char *)&v228 + 2) = v47;
          HIWORD(v228) = 1024;
          v229[0] = v48;
          _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ANEInferface: H11ANEIn:%s programHanlde:0x%llx, transactionId:%llx, statusType: 0x%x, status: 0x%x\n", buf, 0x2Cu);
        }
        break;
    }
  }
  else
  {
    v48 = 4;
    switch(v46)
    {
      case -536870176:
        v48 = 26;
        goto LABEL_94;
      case -536870175:
      case -536870172:
      case -536870171:
      case -536870170:
      case -536870168:
      case -536870167:
      case -536870166:
      case -536870164:
      case -536870161:
        goto LABEL_84;
      case -536870174:
        v48 = 23;
        goto LABEL_94;
      case -536870173:
        v48 = 10;
        goto LABEL_94;
      case -536870169:
        v48 = 29;
        goto LABEL_94;
      case -536870165:
        v48 = 21;
        goto LABEL_94;
      case -536870163:
        v48 = 27;
        goto LABEL_94;
      case -536870162:
        v48 = 28;
        goto LABEL_94;
      case -536870160:
        goto LABEL_94;
      default:
        if (v46 == -536870184)
        {
          v48 = 22;
          goto LABEL_94;
        }
        if (v46)
          goto LABEL_84;
        v48 = 0;
        break;
    }
  }
  if (v3)
  {
    v207[0] = v47;
    v207[1] = v48;
    v208 = &v217;
    v209 = v31;
    v210 = v203;
    v211 = v32;
    v212 = 0;
    v213 = v4;
    v214 = v201;
    v215 = v33;
    v216 = 0;
    (*(void (**)(uint64_t, _DWORD *))(v3 + 16))(v3, v207);
  }
  v56 = objc_msgSend(*(id *)(v5 + 840), "handle");
  if (v206 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v57 = v56;
    if (os_signpost_enabled(v56))
    {
      v58 = (const char *)*((_QWORD *)a2 + 1029);
      v59 = *((_DWORD *)a2 + 2060);
      v60 = *((_QWORD *)a2 + 1032);
      *(_DWORD *)buf = 134218496;
      v225 = v58;
      v226 = 1024;
      *(_DWORD *)v227 = v59;
      *(_WORD *)&v227[4] = 2048;
      *(_QWORD *)&v227[6] = v60;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v57, OS_SIGNPOST_INTERVAL_END, v206, "ServicesClientCallback", "progHandle=%llx procid=%x transid=%llx", buf, 0x1Cu);
    }
  }
  if (v218)
  {
    CVPixelBufferUnlockBaseAddress(v218, 0);
    CVPixelBufferRelease(v218);
  }
  v61 = (__CVBuffer *)*((_QWORD *)a2 + 1025);
  if (v61)
  {
    CVPixelBufferUnlockBaseAddress(v61, 0);
    CVPixelBufferRelease(*((CVPixelBufferRef *)a2 + 1025));
  }
  if (v204)
  {
    H11ANE::H11ANEFrameReceiverBufferPool::~H11ANEFrameReceiverBufferPool(v204);
    MEMORY[0x20BD010DC]();
  }
LABEL_107:
  v62 = objc_msgSend(*(id *)(v5 + 840), "handle");
  if (v8 < 0xFFFFFFFFFFFFFFFELL)
  {
    v63 = v62;
    if (os_signpost_enabled(v62))
    {
      v64 = (const char *)*((_QWORD *)a2 + 1029);
      v65 = *((_DWORD *)a2 + 2060);
      v66 = *((_QWORD *)a2 + 1032);
      *(_DWORD *)buf = 134218496;
      v225 = v64;
      v226 = 1024;
      *(_DWORD *)v227 = v65;
      *(_WORD *)&v227[4] = 2048;
      *(_QWORD *)&v227[6] = v66;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v63, OS_SIGNPOST_INTERVAL_END, spid, "ServicesFrameProcDirect", "progHandle=%llx procid=%x transid=%llx", buf, 0x1Cu);
    }
  }
}

void sub_207C4ACD0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD010DC](v1, 0x1030C4081A5006CLL);
  _Unwind_Resume(a1);
}

void H11ANE::H11ANEDevice::~H11ANEDevice(H11ANE::H11ANEDevice *this)
{
  io_object_t v2;

  if (*((_DWORD *)this + 16))
    H11ANE::H11ANEDevice::H11ANEDeviceClose(this);
  v2 = *((_DWORD *)this + 15);
  if (v2)
  {
    IOObjectRelease(v2);
    *((_DWORD *)this + 15) = 0;
  }
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 72));
}

uint64_t H11ANE::H11ANEDevice::H11ANEDeviceClose(H11ANE::H11ANEDevice *this)
{
  pthread_mutex_t *v2;
  uint64_t v3;
  io_connect_t v4;

  v2 = (pthread_mutex_t *)((char *)this + 72);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 72));
  v3 = IOConnectCallScalarMethod(*((_DWORD *)this + 16), 1u, 0, 0, 0, 0);
  v4 = *((_DWORD *)this + 16);
  if (v4)
  {
    IOServiceClose(v4);
    *((_DWORD *)this + 16) = 0;
    *(_QWORD *)this = 0;
    *((_QWORD *)this + 1) = 0;
  }
  else
  {
    v3 = 3758097101;
  }
  pthread_mutex_unlock(v2);
  return v3;
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t H11ANE::H11ANEDevice::DisableDeviceMessages(H11ANE::H11ANEDevice *this)
{
  uint64_t result;

  result = *((unsigned int *)this + 15);
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    *((_DWORD *)this + 15) = 0;
  }
  return result;
}

_QWORD *H11ANE::H11ANEDevice::RegisterDeviceMessageNotificationProc(_QWORD *this, int (*a2)(H11ANE::H11ANEDevice *, unsigned int, void *, void *), void *a3)
{
  *this = a2;
  this[1] = a3;
  return this;
}

uint64_t H11ANE::H11ANEDevice::ANE_ForgetFirmware(H11ANE::H11ANEDevice *this)
{
  uint64_t result;
  mach_port_t v3;

  result = 3758097084;
  v3 = *((_DWORD *)this + 16);
  if (v3)
  {
    if (*((_BYTE *)this + 24))
    {
      if (*((_DWORD *)this + 34) == 1)
        return 3758097095;
      else
        return IOConnectCallScalarMethod(v3, 0xDu, 0, 0, 0, 0);
    }
    else
    {
      return 3758097089;
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_ReadANERegister(H11ANE::H11ANEDevice *this, unsigned int a2, unsigned int *a3)
{
  uint64_t result;
  mach_port_t v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  result = 3758097089;
  v5 = *((_DWORD *)this + 16);
  if (!v5)
    return 3758097101;
  if (*((_BYTE *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1)
    {
      return 3758097095;
    }
    else
    {
      output = 0;
      input[0] = a2;
      outputCnt = 1;
      result = IOConnectCallScalarMethod(v5, 0x24u, input, 1u, &output, &outputCnt);
      if (!(_DWORD)result)
        *a3 = output;
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_WriteANERegister(H11ANE::H11ANEDevice *this, unsigned int a2, unsigned int a3)
{
  uint64_t result;
  mach_port_t v5;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  result = 3758097089;
  v5 = *((_DWORD *)this + 16);
  if (!v5)
    return 3758097101;
  if (*((_BYTE *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1)
    {
      return 3758097095;
    }
    else
    {
      input[0] = a2;
      input[1] = a3;
      return IOConnectCallScalarMethod(v5, 0x25u, input, 2u, 0, 0);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_SendCommand(H11ANE::H11ANEDevice *this, unsigned __int8 *a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  mach_port_t v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v18[6];

  v18[5] = *MEMORY[0x24BDAC8D0];
  v10 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle](ANEServicesLog, "handle"), (const void *)0x61B2008);
  v11 = +[ANEServicesLog handle](ANEServicesLog, "handle");
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v12 = v11;
    if (os_signpost_enabled(v11))
    {
      LOWORD(v18[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "H11ANEDeviceSendCommand", (const char *)&unk_207C6A44A, (uint8_t *)v18, 2u);
    }
  }
  v13 = 3758097089;
  v14 = *((_DWORD *)this + 16);
  if (v14)
  {
    if (*((_BYTE *)this + 24))
    {
      if (*((_DWORD *)this + 34) == 1)
      {
        v13 = 3758097095;
      }
      else
      {
        v18[0] = (uint64_t)a2;
        v18[1] = a3;
        v18[2] = a4;
        v18[3] = a5;
        v13 = IOConnectCallScalarMethod(v14, 0xEu, v18, 4u, 0, 0);
      }
    }
  }
  else
  {
    v13 = 3758097101;
  }
  v15 = +[ANEServicesLog handle](ANEServicesLog, "handle");
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v16 = v15;
    if (os_signpost_enabled(v15))
    {
      LOWORD(v18[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v16, OS_SIGNPOST_INTERVAL_END, v10, "H11ANEDeviceSendCommand", (const char *)&unk_207C6A44A, (uint8_t *)v18, 2u);
    }
  }
  return v13;
}

uint64_t H11ANE::H11ANEDevice::WritePropertyValue(H11ANE::H11ANEDevice *this, int a2, int a3, unsigned int a4)
{
  unsigned __int8 v5[8];
  int v6;
  int v7;
  int v8;

  *(_QWORD *)v5 = 0x1F00000000;
  v6 = 0;
  v7 = a2;
  v8 = a3;
  return H11ANE::H11ANEDevice::ANE_SendCommand(this, v5, 0x14u, 0, a4);
}

uint64_t H11ANE::H11ANEDevice::ReadPropertyValue(H11ANE::H11ANEDevice *this, int a2, unsigned int *a3, unsigned int a4)
{
  uint64_t result;
  unsigned __int8 v6[8];
  int v7;
  int v8;
  unsigned int v9;

  *(_QWORD *)v6 = 0x2000000000;
  v7 = 0;
  v8 = a2;
  v9 = 0;
  result = H11ANE::H11ANEDevice::ANE_SendCommand(this, v6, 0x14u, 0, a4);
  if (!(_DWORD)result)
    *a3 = v9;
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_FlushInactiveDARTMappings(H11ANE::H11ANEDevice *this)
{
  uint64_t result;
  mach_port_t v3;

  result = 3758097089;
  v3 = *((_DWORD *)this + 16);
  if (!v3)
    return 3758097101;
  if (*((_BYTE *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1)
      return 3758097095;
    else
      return IOConnectCallScalarMethod(v3, 0x1Du, 0, 0, 0, 0);
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_LoadFirmware(H11ANE::H11ANEDevice *this)
{
  uint64_t v1;
  int v3;
  const char *v4;
  int v5;
  const char *v6;
  FILE *v7;
  FILE *v8;
  size_t v9;
  void *v10;
  size_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v15;
  _OWORD outputStruct[2];
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  v1 = 3758097089;
  if (!*((_BYTE *)this + 24))
    return v1;
  if (*((_DWORD *)this + 34) == 1)
    return 3758097095;
  memset(outputStruct, 0, sizeof(outputStruct));
  H11ANE::H11ANEDevice::ANE_GetStatus((uint64_t)this, outputStruct);
  if (BYTE12(outputStruct[0]))
    return 0;
  v3 = *((_DWORD *)this + 7);
  v4 = "/usr/local/share/firmware/ane/ane.bin";
  if (v3 <= 127)
  {
    if ((v3 - 16) <= 0x30 && ((1 << (v3 - 16)) & 0x1000100010007) != 0)
      goto LABEL_29;
    if (v3 != 96)
    {
      if (v3 != 112)
        goto LABEL_23;
      goto LABEL_29;
    }
    v15 = *((int *)this + 8);
    if (v15 >= 4)
    {
      printf("Couldn't load firmware for unknow subtype(%d\n", *((_DWORD *)this + 8));
      v4 = 0;
    }
    else
    {
      v4 = off_24C06AAA8[v15];
    }
LABEL_28:
    printf("overrideFirmwareFileName: %s\n", v4);
    goto LABEL_29;
  }
  if (v3 <= 175)
  {
    if (v3 != 128)
    {
      if (v3 != 144 && v3 != 160)
        goto LABEL_23;
      goto LABEL_29;
    }
    goto LABEL_24;
  }
  if (v3 <= 207)
  {
    if (v3 != 176)
    {
      if (v3 != 192)
        goto LABEL_23;
      goto LABEL_29;
    }
    goto LABEL_24;
  }
  if (v3 == 208)
  {
LABEL_24:
    v5 = *((_DWORD *)this + 8);
    v6 = "/usr/local/share/firmware/ane/ane1.bin";
    if (v5 != 1)
      v6 = 0;
    if (v5)
      v4 = v6;
    goto LABEL_28;
  }
  if (v3 != 224)
  {
LABEL_23:
    printf("ERROR:No matching firmware found, aneVersion: %x!\n", *((_DWORD *)this + 7));
    return 3758097105;
  }
LABEL_29:
  v7 = fopen(v4, "rb");
  if (v7)
  {
    v8 = v7;
    puts("Using ANECPU firmware override file");
    fseeko(v8, 0, 2);
    v9 = ftello(v8);
    fseeko(v8, 0, 0);
    v10 = (void *)operator new[]();
    v11 = fread(v10, 1uLL, v9, v8);
    fclose(v8);
    if (v11 == v9)
      goto LABEL_33;
    puts("could not read ANECPU Firmware file");
    MEMORY[0x20BD010C4](v10, 0x1000C8077774924);
  }
  else
  {
    perror("error loading ANECPU firmware ");
  }
  v9 = 0;
  v10 = 0;
LABEL_33:
  input[0] = (uint64_t)v10;
  input[1] = v9;
  input[2] = 0;
  v12 = IOConnectCallScalarMethod(*((_DWORD *)this + 16), 0xCu, input, 3u, 0, 0);
  v1 = v12;
  if ((_DWORD)v12)
  {
    printf("error: LoadFirmware returned 0x%08x \n", v12);
    if ((int)v1 <= -536870182)
    {
      if ((_DWORD)v1 == -536870211)
      {
        v13 = "LoadFirmware: Run out of memory!";
      }
      else
      {
        if ((_DWORD)v1 != -536870207)
          goto LABEL_47;
        v13 = "LoadFirmware: Privilege violation,  add boot-args amfi_allow_any_signature=1 for loading customer FW";
      }
    }
    else
    {
      switch((_DWORD)v1)
      {
        case 0xE00002DB:
          v13 = "LoadFirmware: Firmware is too big!";
          break;
        case 0xE00002EB:
          v13 = "LoadFirmware: Firmware is already loaded!";
          break;
        case 0xE00002E2:
          v13 = "LoadFirmware: No firmware changes while the ANE is powered up!";
          break;
        default:
          goto LABEL_47;
      }
    }
  }
  else
  {
    v13 = "Firmware is loaded";
  }
  puts(v13);
LABEL_47:
  if (v10)
    MEMORY[0x20BD010C4](v10, 0x1000C8077774924);
  return v1;
}

uint64_t H11ANE::H11ANEDevice::ANE_PowerOn(H11ANE::H11ANEDevice *this)
{
  os_signpost_id_t v2;
  NSObject *v3;
  NSObject *v4;
  mach_port_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  NSObject *v10;
  NSObject *v11;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t v15[16];
  uint8_t buf[16];

  v2 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle](ANEServicesLog, "handle"), (const void *)0x61B2000);
  v3 = +[ANEServicesLog handle](ANEServicesLog, "handle");
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v3;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "H11ANEDevicePowerOn", (const char *)&unk_207C6A44A, buf, 2u);
    }
  }
  v5 = *((_DWORD *)this + 16);
  if (v5)
  {
    if (*((_BYTE *)this + 24))
    {
      if (*((_DWORD *)this + 34) == 1)
      {
        v6 = 3758097095;
      }
      else
      {
        v6 = IOConnectCallScalarMethod(v5, 9u, 0, 0, 0, 0);
        if ((_DWORD)v6 == -536870172)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v14 = 0;
            _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ANE_PowerOn: Attempting to load firmware\n", v14, 2u);
          }
          H11ANE::H11ANEDevice::ANE_LoadFirmware(this);
          v6 = IOConnectCallScalarMethod(*((_DWORD *)this + 16), 9u, 0, 0, 0, 0);
        }
        if (!(_DWORD)v6)
        {
          if ((H11ANE::H11ANEDevice::ANE_IsPowered(this) & 1) != 0)
          {
            printf("Power on wait count: %u on connection: 0x%x\n", 0, *((_DWORD *)this + 16));
            v6 = 0;
          }
          else
          {
            v7 = 0;
            do
            {
              usleep(0x3E8u);
              v8 = v7 + 1;
              if ((H11ANE::H11ANEDevice::ANE_IsPowered(this) & 1) != 0)
                break;
            }
            while (v7++ < 0xBB7);
            printf("Power on wait count: %u on connection: 0x%x\n", v8, *((_DWORD *)this + 16));
            if (v8 == 3000)
              v6 = 3758097110;
            else
              v6 = 0;
          }
        }
      }
    }
    else
    {
      v6 = 3758097089;
    }
  }
  else
  {
    v6 = 3758097101;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ANE_PowerOn: No connection present!\n", v15, 2u);
    }
  }
  v10 = +[ANEServicesLog handle](ANEServicesLog, "handle");
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = v10;
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)v13 = 0;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v11, OS_SIGNPOST_INTERVAL_END, v2, "H11ANEDevicePowerOn", (const char *)&unk_207C6A44A, v13, 2u);
    }
  }
  return v6;
}

uint64_t H11ANE::H11ANEDevice::ANE_IsPowered(H11ANE::H11ANEDevice *this)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;

  output = 0;
  outputCnt = 1;
  result = *((unsigned int *)this + 16);
  if ((_DWORD)result)
  {
    if (*((_BYTE *)this + 24) && *((_DWORD *)this + 34) != 1)
      return !IOConnectCallScalarMethod(result, 0xBu, 0, 0, &output, &outputCnt) && output == 1;
    else
      return 0;
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_PowerOff(H11ANE::H11ANEDevice *this)
{
  os_signpost_id_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  mach_port_t v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v10[16];
  uint8_t buf[16];

  v2 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle](ANEServicesLog, "handle"), (const void *)0x61B2004);
  v3 = +[ANEServicesLog handle](ANEServicesLog, "handle");
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v4 = v3;
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v2, "H11ANEDevicePowerOff", (const char *)&unk_207C6A44A, buf, 2u);
    }
  }
  v5 = 3758097089;
  v6 = *((_DWORD *)this + 16);
  if (v6)
  {
    if (*((_BYTE *)this + 24))
    {
      if (*((_DWORD *)this + 34) == 1)
        v5 = 3758097095;
      else
        v5 = IOConnectCallScalarMethod(v6, 0xAu, 0, 0, 0, 0);
    }
  }
  else
  {
    v5 = 3758097101;
  }
  v7 = +[ANEServicesLog handle](ANEServicesLog, "handle");
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)v10 = 0;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v8, OS_SIGNPOST_INTERVAL_END, v2, "H11ANEDevicePowerOff", (const char *)&unk_207C6A44A, v10, 2u);
    }
  }
  return v5;
}

uint64_t H11ANE::H11ANEDevice::ANE_SetPowerManagement(H11ANE::H11ANEDevice *this, unsigned int a2)
{
  uint64_t result;
  mach_port_t v4;
  uint64_t v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  result = 3758097089;
  v4 = *((_DWORD *)this + 16);
  if (!v4)
    return 3758097101;
  if (*((_BYTE *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1)
    {
      return 3758097095;
    }
    else
    {
      v5[0] = a2;
      return IOConnectCallScalarMethod(v4, 0xFu, v5, 1u, 0, 0);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_SetDynamicPowerGating(H11ANE::H11ANEDevice *this, unsigned int a2)
{
  uint64_t result;
  mach_port_t v4;
  uint64_t v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  result = 3758097089;
  v4 = *((_DWORD *)this + 16);
  if (!v4)
    return 3758097101;
  if (*((_BYTE *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1)
    {
      return 3758097095;
    }
    else
    {
      v5[0] = a2;
      return IOConnectCallScalarMethod(v4, 0x10u, v5, 1u, 0, 0);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_SetPowerGatingHysteresisTime(H11ANE::H11ANEDevice *this, unsigned int a2)
{
  uint64_t result;
  mach_port_t v4;
  uint64_t v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  result = 3758097089;
  v4 = *((_DWORD *)this + 16);
  if (!v4)
    return 3758097101;
  if (*((_BYTE *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1)
    {
      return 3758097095;
    }
    else
    {
      v5[0] = a2;
      return IOConnectCallScalarMethod(v4, 0x11u, v5, 1u, 0, 0);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_GetTime(uint64_t a1, void *outputStruct)
{
  uint64_t result;
  mach_port_t v4;
  size_t outputStructCnt;

  result = 3758097089;
  outputStructCnt = 24;
  v4 = *(_DWORD *)(a1 + 64);
  if (!v4)
    return 3758097101;
  if (*(_BYTE *)(a1 + 24))
  {
    if (*(_DWORD *)(a1 + 136) == 1)
      return 3758097095;
    else
      return IOConnectCallStructMethod(v4, 0x12u, 0, 0, outputStruct, &outputStructCnt);
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_SetDriverLoggingFlags(H11ANE::H11ANEDevice *this, unsigned int a2)
{
  uint64_t result;
  mach_port_t v4;
  uint64_t v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  result = 3758097089;
  v4 = *((_DWORD *)this + 16);
  if (!v4)
    return 3758097101;
  if (*((_BYTE *)this + 24))
  {
    v5[0] = a2;
    return IOConnectCallScalarMethod(v4, 0x13u, v5, 1u, 0, 0);
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_GetDriverLoggingFlags(H11ANE::H11ANEDevice *this, unsigned int *a2)
{
  uint64_t result;
  mach_port_t v4;
  uint32_t outputCnt;
  uint64_t output;

  result = 3758097089;
  v4 = *((_DWORD *)this + 16);
  if (!v4)
    return 3758097101;
  if (*((_BYTE *)this + 24))
  {
    output = 0;
    outputCnt = 1;
    result = IOConnectCallScalarMethod(v4, 0x1Cu, 0, 0, &output, &outputCnt);
    if (!(_DWORD)result)
      *a2 = output;
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_CreateClientLoggingSession(H11ANE::H11ANEDevice *this, unsigned int a2)
{
  uint64_t result;
  mach_port_t v4;
  uint64_t v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  result = 3758097084;
  v4 = *((_DWORD *)this + 16);
  if (v4)
  {
    if (*((_BYTE *)this + 24))
    {
      if (*((_DWORD *)this + 34) == 1)
      {
        return 3758097095;
      }
      else
      {
        v5[0] = a2;
        return IOConnectCallScalarMethod(v4, 0x1Au, v5, 1u, 0, 0);
      }
    }
    else
    {
      return 3758097089;
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_TerminateClientLoggingSession(H11ANE::H11ANEDevice *this, unsigned int a2)
{
  uint64_t result;
  mach_port_t v4;
  uint64_t v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  result = 3758097084;
  v4 = *((_DWORD *)this + 16);
  if (v4)
  {
    if (*((_BYTE *)this + 24))
    {
      if (*((_DWORD *)this + 34) == 1)
      {
        return 3758097095;
      }
      else
      {
        v5[0] = a2;
        return IOConnectCallScalarMethod(v4, 0x1Bu, v5, 1u, 0, 0);
      }
    }
    else
    {
      return 3758097089;
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_AddPersistentClient(H11ANE::H11ANEDevice *this)
{
  uint64_t result;
  mach_port_t v3;

  result = 3758097089;
  v3 = *((_DWORD *)this + 16);
  if (!v3)
    return 3758097101;
  if (*((_BYTE *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1)
      return 3758097095;
    else
      return IOConnectCallScalarMethod(v3, 0x18u, 0, 0, 0, 0);
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_RemovePersistentClient(H11ANE::H11ANEDevice *this)
{
  uint64_t result;
  mach_port_t v3;

  result = 3758097089;
  v3 = *((_DWORD *)this + 16);
  if (!v3)
    return 3758097101;
  if (*((_BYTE *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1)
      return 3758097095;
    else
      return IOConnectCallScalarMethod(v3, 0x19u, 0, 0, 0, 0);
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_ShowSharedMemoryAllocations(H11ANE::H11ANEDevice *this)
{
  uint64_t result;
  mach_port_t v3;

  result = 3758097089;
  v3 = *((_DWORD *)this + 16);
  if (!v3)
    return 3758097101;
  if (*((_BYTE *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1)
      return 3758097095;
    else
      return IOConnectCallScalarMethod(v3, 0x14u, 0, 0, 0, 0);
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::SetClientPrivateData(uint64_t this, void *a2)
{
  *(_QWORD *)(this + 40) = a2;
  return this;
}

uint64_t H11ANE::H11ANEDevice::GetClientPrivateData(H11ANE::H11ANEDevice *this)
{
  return *((_QWORD *)this + 5);
}

uint64_t H11ANE::H11ANEDevice::ANE_SetDARTCacheTTL(H11ANE::H11ANEDevice *this, unsigned int a2)
{
  uint64_t result;
  mach_port_t v4;
  uint64_t v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  result = 3758097089;
  v4 = *((_DWORD *)this + 16);
  if (!v4)
    return 3758097101;
  if (*((_BYTE *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1)
    {
      return 3758097095;
    }
    else
    {
      v5[0] = a2;
      return IOConnectCallScalarMethod(v4, 0x15u, v5, 1u, 0, 0);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_SetThrottlingPercentage(H11ANE::H11ANEDevice *this, unsigned int a2)
{
  uint64_t result;
  mach_port_t v4;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  result = 3758097089;
  v4 = *((_DWORD *)this + 16);
  if (!v4)
    return 3758097101;
  if (*((_BYTE *)this + 24))
  {
    input[0] = a2;
    return IOConnectCallScalarMethod(v4, 0x17u, input, 1u, 0, 0);
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_SetFirmwareBootArg(H11ANE::H11ANEDevice *this, unsigned int a2, unsigned int a3)
{
  uint64_t result;
  mach_port_t v5;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  result = 3758097089;
  v5 = *((_DWORD *)this + 16);
  if (!v5)
    return 3758097101;
  if (*((_BYTE *)this + 24))
  {
    input[0] = a2;
    input[1] = a3;
    return IOConnectCallScalarMethod(v5, 0x16u, input, 2u, 0, 0);
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_RegisterFirmwareWorkProcessor(uint64_t a1, _DWORD *inputStruct)
{
  uint64_t result;
  mach_port_t v4;
  uint64_t reference;
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  result = 3758097089;
  v4 = *(_DWORD *)(a1 + 64);
  if (!v4)
    return 3758097101;
  if (*(_BYTE *)(a1 + 24))
  {
    if (*(_DWORD *)(a1 + 136) == 1)
    {
      return 3758097095;
    }
    else
    {
      v6 = 0u;
      return IOConnectCallAsyncMethod(v4, 0x1Fu, inputStruct[4], &reference, 8u, 0, 0, inputStruct, 0x18uLL, 0, 0, 0, 0);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_UnregisterFirmwareWorkProcessor(H11ANE::H11ANEDevice *this, mach_port_t wake_port)
{
  uint64_t result;
  mach_port_t v4;
  uint64_t reference;
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  result = 3758097089;
  v4 = *((_DWORD *)this + 16);
  if (!v4)
    return 3758097101;
  if (*((_BYTE *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1)
    {
      return 3758097095;
    }
    else
    {
      v6 = 0u;
      return IOConnectCallAsyncMethod(v4, 0x20u, wake_port, &reference, 8u, 0, 0, 0, 0, 0, 0, 0, 0);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_GetFirmwareWorkProcessorItem(uint64_t a1, mach_port_t wake_port, uint64_t a3)
{
  uint64_t result;
  mach_port_t v5;
  uint64_t reference;
  __int128 v7;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  result = 3758097089;
  v5 = *(_DWORD *)(a1 + 64);
  if (!v5)
    return 3758097101;
  if (*(_BYTE *)(a1 + 24))
  {
    if (*(_DWORD *)(a1 + 136) == 1)
    {
      return 3758097095;
    }
    else
    {
      input[0] = a3;
      input[1] = 3080;
      v7 = 0u;
      return IOConnectCallAsyncMethod(v5, 0x21u, wake_port, &reference, 8u, input, 2u, 0, 0, 0, 0, 0, 0);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_CompleteFirmwareWorkProcessorItem(uint64_t a1, mach_port_t wake_port, uint64_t a3)
{
  uint64_t result;
  mach_port_t v5;
  uint64_t reference;
  __int128 v7;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  result = 3758097089;
  v5 = *(_DWORD *)(a1 + 64);
  if (!v5)
    return 3758097101;
  if (*(_BYTE *)(a1 + 24))
  {
    if (*(_DWORD *)(a1 + 136) == 1)
    {
      return 3758097095;
    }
    else
    {
      input[0] = a3;
      input[1] = 3080;
      v7 = 0u;
      return IOConnectCallAsyncMethod(v5, 0x22u, wake_port, &reference, 8u, input, 2u, 0, 0, 0, 0, 0, 0);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_ReleaseFirmwareWorkProcessorBuffers(H11ANE::H11ANEDevice *this, mach_port_t wake_port)
{
  uint64_t result;
  mach_port_t v4;
  uint64_t reference;
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  result = 3758097089;
  v4 = *((_DWORD *)this + 16);
  if (!v4)
    return 3758097101;
  if (*((_BYTE *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1)
    {
      return 3758097095;
    }
    else
    {
      v6 = 0u;
      return IOConnectCallAsyncMethod(v4, 0x23u, wake_port, &reference, 8u, 0, 0, 0, 0, 0, 0, 0, 0);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_ProgramCreateInstance(uint64_t a1, const char **a2, _QWORD *a3)
{
  uint64_t v3;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  const char *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int128 buf;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = 3758097089;
  if (!*(_DWORD *)(a1 + 64))
    return 3758097101;
  if (*(_BYTE *)(a1 + 24))
  {
    v3 = 3758097090;
    if (a2)
    {
      if (a3)
      {
        v7 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle](ANEServicesLog, "handle"), (const void *)0x61B2014);
        v8 = +[ANEServicesLog handle](ANEServicesLog, "handle");
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v9 = v8;
          if (os_signpost_enabled(v8))
          {
            v10 = *a2;
            LODWORD(buf) = 134217984;
            *(_QWORD *)((char *)&buf + 4) = v10;
            _os_signpost_emit_with_name_impl(&dword_207C43000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "H11ANEDeviceProgramCreateInstance", "progHandle=%llx", (uint8_t *)&buf, 0xCu);
          }
        }
        *(_QWORD *)&buf = a2;
        *((_QWORD *)&buf + 1) = 110488;
        v21 = a3;
        v22 = 716648;
        v3 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 64), 8u, &buf, 0x20uLL, 0, 0);
        if ((_DWORD)v3 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v16 = 136315394;
          v17 = "ANE_ProgramCreateInstance";
          v18 = 1024;
          LODWORD(v19) = v3;
          _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: ERROR status=%x\n", (uint8_t *)&v16, 0x12u);
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v11 = *a3;
          v16 = 136315394;
          v17 = "ANE_ProgramCreateInstance";
          v18 = 2048;
          v19 = v11;
          _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: programInstance with programHandle: 0x%llx\n", (uint8_t *)&v16, 0x16u);
        }
        v12 = +[ANEServicesLog handle](ANEServicesLog, "handle");
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v13 = v12;
          if (os_signpost_enabled(v12))
          {
            v14 = *a2;
            v16 = 134217984;
            v17 = v14;
            _os_signpost_emit_with_name_impl(&dword_207C43000, v13, OS_SIGNPOST_INTERVAL_END, v7, "H11ANEDeviceProgramCreateInstance", "progHandle=%llx", (uint8_t *)&v16, 0xCu);
          }
        }
      }
    }
  }
  return v3;
}

uint64_t H11ANE::H11ANEDevice::ANE_ProgramChainingPrepare(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  size_t outputStructCnt;
  _QWORD inputStruct[2];
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = 3758097089;
  if (!*(_DWORD *)(a1 + 64))
    return 3758097101;
  if (*(_BYTE *)(a1 + 24))
  {
    inputStruct[0] = a2;
    inputStruct[1] = 44584;
    v7 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle](ANEServicesLog, "handle"), (const void *)0x61B2018);
    v8 = +[ANEServicesLog handle](ANEServicesLog, "handle");
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v9 = v8;
      if (os_signpost_enabled(v8))
      {
        v10 = *(_QWORD *)(a2 + 16);
        *(_DWORD *)buf = 134217984;
        v18 = v10;
        _os_signpost_emit_with_name_impl(&dword_207C43000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "H11ANEDeviceProgramPrepare", "progHandle=%llx", buf, 0xCu);
      }
    }
    outputStructCnt = 16;
    v3 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 64), 0x28u, inputStruct, 0x10uLL, a3, &outputStructCnt);
    v11 = +[ANEServicesLog handle](ANEServicesLog, "handle");
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v12 = v11;
      if (os_signpost_enabled(v11))
      {
        v13 = *(_QWORD *)(a2 + 16);
        *(_DWORD *)buf = 134217984;
        v18 = v13;
        _os_signpost_emit_with_name_impl(&dword_207C43000, v12, OS_SIGNPOST_INTERVAL_END, v7, "H11ANEDeviceProgramPrepare", "progHandle=%llx", buf, 0xCu);
      }
    }
  }
  return v3;
}

uint64_t H11ANE::H11ANEDevice::ANE_ProgramOutputSetEnqueue(uint64_t a1, void *inputStruct)
{
  mach_port_t v2;

  v2 = *(_DWORD *)(a1 + 64);
  if (v2)
    return IOConnectCallStructMethod(v2, 3u, inputStruct, 0x28uLL, 0, 0);
  else
    return 3758097101;
}

uint64_t H11ANE::H11ANEDevice::ANE_ProgramInputsReady(uint64_t a1, void *inputStruct)
{
  mach_port_t v2;

  v2 = *(_DWORD *)(a1 + 64);
  if (v2)
    return IOConnectCallStructMethod(v2, 4u, inputStruct, 0xC18uLL, 0, 0);
  else
    return 3758097101;
}

uint64_t H11ANE::H11ANEDevice::ANE_ProgramUnprepare(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = 3758097089;
  if (!*(_DWORD *)(a1 + 64))
    return 3758097101;
  if (*(_BYTE *)(a1 + 24))
  {
    v5 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle](ANEServicesLog, "handle"), (const void *)0x61B201C);
    v6 = +[ANEServicesLog handle](ANEServicesLog, "handle");
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v6))
      {
        v8 = *a2;
        v13 = 134217984;
        v14 = v8;
        _os_signpost_emit_with_name_impl(&dword_207C43000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "H11ANEDeviceProgramUnprepare", "progHandle=%llx", (uint8_t *)&v13, 0xCu);
      }
    }
    v2 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 64), 5u, a2, 0x38uLL, 0, 0);
    v9 = +[ANEServicesLog handle](ANEServicesLog, "handle");
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v9))
      {
        v11 = *a2;
        v13 = 134217984;
        v14 = v11;
        _os_signpost_emit_with_name_impl(&dword_207C43000, v10, OS_SIGNPOST_INTERVAL_END, v5, "H11ANEDeviceProgramUnprepare", "progHandle=%llx", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  return v2;
}

uint64_t H11ANE::H11ANEDevice::ANE_ProgramDestroy(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  os_signpost_id_t v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v2 = 3758097089;
  if (!*(_DWORD *)(a1 + 64))
    return 3758097101;
  if (*(_BYTE *)(a1 + 24))
  {
    v5 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle](ANEServicesLog, "handle"), (const void *)0x61B2020);
    v6 = +[ANEServicesLog handle](ANEServicesLog, "handle");
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v7 = v6;
      if (os_signpost_enabled(v6))
      {
        v8 = *a2;
        v13 = 134217984;
        v14 = v8;
        _os_signpost_emit_with_name_impl(&dword_207C43000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "H11ANEDeviceProgramDestroy", "progHandle=%llx", (uint8_t *)&v13, 0xCu);
      }
    }
    v2 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 64), 6u, a2, 0x10uLL, 0, 0);
    v9 = +[ANEServicesLog handle](ANEServicesLog, "handle");
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v10 = v9;
      if (os_signpost_enabled(v9))
      {
        v11 = *a2;
        v13 = 134217984;
        v14 = v11;
        _os_signpost_emit_with_name_impl(&dword_207C43000, v10, OS_SIGNPOST_INTERVAL_END, v5, "H11ANEDeviceProgramDestroy", "progHandle=%llx", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  return v2;
}

uint64_t H11ANE::H11ANEDevice::ANE_CancelAllRequests(H11ANE::H11ANEDevice *this)
{
  return 0;
}

uint64_t H11ANE::H11ANEDevice::ANE_ProgramMemoryMapRequest(uint64_t a1, _QWORD *a2, unsigned int a3)
{
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (!*(_DWORD *)(a1 + 64))
    return 3758097101;
  v6 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog verbose](ANEServicesLog, "verbose"), (const void *)0x61B0104);
  v7 = +[ANEServicesLog verbose](ANEServicesLog, "verbose");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v8 = v7;
    if (os_signpost_enabled(v7))
    {
      v9 = a2[257];
      *(_DWORD *)buf = 134217984;
      v19 = v9;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "ANEDeviceMemoryMapRequest", "progHandle=%llx ", buf, 0xCu);
    }
  }
  output = 0;
  input = a3;
  outputCnt = 1;
  v10 = IOConnectCallMethod(*(_DWORD *)(a1 + 64), 5u, &input, 1u, a2, 0x828uLL, &output, &outputCnt, 0, 0);
  if (!(_DWORD)v10 && a3)
    a2[259] = output;
  v11 = +[ANEServicesLog verbose](ANEServicesLog, "verbose");
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v12 = v11;
    if (os_signpost_enabled(v11))
    {
      v13 = a2[257];
      *(_DWORD *)buf = 134217984;
      v19 = v13;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v12, OS_SIGNPOST_INTERVAL_END, v6, "ANEDeviceMemoryMapRequest", "progHandle=%llx ", buf, 0xCu);
    }
  }
  return v10;
}

uint64_t H11ANE::H11ANEDevice::ANE_ProgramMemoryUnMapRequest(uint64_t a1, _QWORD *a2)
{
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!*(_DWORD *)(a1 + 64))
    return 3758097101;
  v4 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog verbose](ANEServicesLog, "verbose"), (const void *)0x61B0108);
  v5 = +[ANEServicesLog verbose](ANEServicesLog, "verbose");
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v5))
    {
      v7 = a2[257];
      v13 = 134217984;
      v14 = v7;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ANEDeviceMemoryUnMapRequest)", "progHandle=%llx ", (uint8_t *)&v13, 0xCu);
    }
  }
  v8 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 64), 6u, a2, 0x828uLL, 0, 0);
  v9 = +[ANEServicesLog verbose](ANEServicesLog, "verbose");
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v9))
    {
      v11 = a2[257];
      v13 = 134217984;
      v14 = v11;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v10, OS_SIGNPOST_INTERVAL_END, v4, "ANEDeviceMemoryUnMapRequest)", "progHandle=%llx ", (uint8_t *)&v13, 0xCu);
    }
  }
  return v8;
}

uint64_t H11ANE::H11ANEDevice::ANE_MPMMemoryMapRequest(H11ANE::H11ANEDevice *this, uint64_t a2, uint64_t a3)
{
  mach_port_t v3;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  v3 = *((_DWORD *)this + 16);
  if (!v3)
    return 3758097101;
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallScalarMethod(v3, 0x29u, input, 2u, 0, 0);
}

uint64_t H11ANE::H11ANEDevice::ANE_MPMMemoryUnmapRequest(H11ANE::H11ANEDevice *this, uint64_t a2)
{
  mach_port_t v2;
  uint64_t v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v2 = *((_DWORD *)this + 16);
  if (!v2)
    return 3758097084;
  v4[0] = a2;
  return IOConnectCallScalarMethod(v2, 0x2Au, v4, 1u, 0, 0);
}

uint64_t H11ANE::H11ANEDevice::ANE_FWSharedEventDoorbellRing(H11ANE::H11ANEDevice *this)
{
  uint64_t result;
  mach_port_t v3;

  result = 3758097089;
  v3 = *((_DWORD *)this + 16);
  if (!v3)
    return 3758097101;
  if (*((_BYTE *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1)
      return 3758097095;
    else
      return IOConnectCallScalarMethod(v3, 0x26u, 0, 0, 0, 0);
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_UnmapDartBuffers(H11ANE::H11ANEDevice *this, unsigned int a2, unsigned int a3)
{
  uint64_t result;
  mach_port_t v5;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  result = 3758097089;
  v5 = *((_DWORD *)this + 16);
  if (!v5)
    return 3758097101;
  if (*((_BYTE *)this + 24))
  {
    if (*((_DWORD *)this + 34) == 1)
    {
      return 3758097095;
    }
    else
    {
      input[0] = a2;
      input[1] = a3;
      return IOConnectCallScalarMethod(v5, 0x27u, input, 2u, 0, 0);
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_ExclaveCycle(H11ANE::H11ANEDevice *this)
{
  uint64_t result;
  mach_port_t v3;

  result = 3758097084;
  v3 = *((_DWORD *)this + 16);
  if (v3)
  {
    if (*((_BYTE *)this + 24))
    {
      if (*((_DWORD *)this + 34) == 1)
        return 3758097095;
      else
        return IOConnectCallScalarMethod(v3, 0x2Bu, 0, 0, 0, 0);
    }
    else
    {
      return 3758097089;
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_ExclaveLoad(H11ANE::H11ANEDevice *this, unsigned int a2, unint64_t *a3)
{
  uint64_t result;
  mach_port_t v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  result = 3758097084;
  v5 = *((_DWORD *)this + 16);
  if (v5)
  {
    if (*((_BYTE *)this + 24))
    {
      if (*((_DWORD *)this + 34) == 1)
      {
        return 3758097095;
      }
      else
      {
        output = 0;
        input[0] = a2;
        outputCnt = 1;
        result = IOConnectCallScalarMethod(v5, 0x2Cu, input, 1u, &output, &outputCnt);
        if (!(_DWORD)result)
          *a3 = output;
      }
    }
    else
    {
      return 3758097089;
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_ExclaveEvaluate(H11ANE::H11ANEDevice *this, uint64_t a2)
{
  uint64_t result;
  mach_port_t v4;
  uint64_t v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  result = 3758097084;
  v4 = *((_DWORD *)this + 16);
  if (v4)
  {
    if (*((_BYTE *)this + 24))
    {
      if (*((_DWORD *)this + 34) == 1)
      {
        return 3758097095;
      }
      else
      {
        v5[0] = a2;
        return IOConnectCallScalarMethod(v4, 0x2Du, v5, 1u, 0, 0);
      }
    }
    else
    {
      return 3758097089;
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_ExclaveUnload(H11ANE::H11ANEDevice *this, uint64_t a2)
{
  uint64_t result;
  mach_port_t v4;
  uint64_t v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  result = 3758097084;
  v4 = *((_DWORD *)this + 16);
  if (v4)
  {
    if (*((_BYTE *)this + 24))
    {
      if (*((_DWORD *)this + 34) == 1)
      {
        return 3758097095;
      }
      else
      {
        v5[0] = a2;
        return IOConnectCallScalarMethod(v4, 0x2Eu, v5, 1u, 0, 0);
      }
    }
    else
    {
      return 3758097089;
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_ExclaveReadPropertyValue(H11ANE::H11ANEDevice *this, unsigned int a2, unsigned int *a3)
{
  uint64_t result;
  mach_port_t v5;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];

  input[1] = *MEMORY[0x24BDAC8D0];
  result = 3758097084;
  v5 = *((_DWORD *)this + 16);
  if (v5)
  {
    if (*((_BYTE *)this + 24))
    {
      if (*((_DWORD *)this + 34) == 1)
      {
        return 3758097095;
      }
      else
      {
        output = 0;
        input[0] = a2;
        outputCnt = 1;
        result = IOConnectCallScalarMethod(v5, 0x2Fu, input, 1u, &output, &outputCnt);
        if (!(_DWORD)result)
          *a3 = output;
      }
    }
    else
    {
      return 3758097089;
    }
  }
  return result;
}

uint64_t H11ANE::H11ANEDevice::ANE_ExclaveWritePropertyValue(H11ANE::H11ANEDevice *this, unsigned int a2, unsigned int a3)
{
  uint64_t result;
  mach_port_t v5;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  result = 3758097084;
  v5 = *((_DWORD *)this + 16);
  if (v5)
  {
    if (*((_BYTE *)this + 24))
    {
      if (*((_DWORD *)this + 34) == 1)
      {
        return 3758097095;
      }
      else
      {
        input[0] = a2;
        input[1] = a3;
        return IOConnectCallScalarMethod(v5, 0x30u, input, 2u, 0, 0);
      }
    }
    else
    {
      return 3758097089;
    }
  }
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void H11ANE::H11ANEDeviceController::~H11ANEDeviceController(CFArrayRef *this)
{
  unint64_t i;
  H11ANE::H11ANEDevice *ValueAtIndex;
  io_object_t v4;
  io_object_t v5;
  IONotificationPort *v6;
  __CFRunLoopSource *v7;
  CFArrayRef v8;

  for (i = 0; i < CFArrayGetCount(*this); ++i)
  {
    ValueAtIndex = (H11ANE::H11ANEDevice *)CFArrayGetValueAtIndex(*this, i);
    H11ANE::H11ANEDevice::DisableDeviceMessages(ValueAtIndex);
  }
  v4 = *((_DWORD *)this + 14);
  if (v4)
    IOObjectRelease(v4);
  v5 = *((_DWORD *)this + 15);
  if (v5)
    IOObjectRelease(v5);
  if (*this)
    CFRelease(*this);
  v6 = this[2];
  if (v6)
  {
    v7 = this[3];
    if (v7)
    {
      CFRunLoopRemoveSource(this[6], v7, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
      this[3] = 0;
      v6 = this[2];
    }
    IONotificationPortDestroy(v6);
  }
  v8 = this[6];
  if (v8)
  {
    CFRelease(v8);
    this[6] = 0;
  }
}

void H11ANE::cfArrayReleaseH11ANEUnitObject(H11ANE *this, const __CFAllocator *a2, const void *a3)
{
  if (a2)
  {
    H11ANE::H11ANEDevice::~H11ANEDevice(a2);
    JUMPOUT(0x20BD010DCLL);
  }
}

H11ANE::H11ANEFirmwareLogger *H11ANE::H11ANEFirmwareLogger::H11ANEFirmwareLogger(H11ANE::H11ANEFirmwareLogger *this, H11ANE::H11ANEDevice *a2, void (*a3)(void *, const char *), void *a4, int a5, int a6)
{
  _OWORD *v7;
  _DWORD *v8;
  uint64_t v9;
  int v10;
  int v11;
  sched_param v13;
  pthread_attr_t v14;
  pthread_mutex_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  *((_QWORD *)this + 1) = a3;
  v7 = (_OWORD *)((char *)this + 8);
  *(_QWORD *)this = a2;
  *((_QWORD *)this + 2) = a4;
  *((_DWORD *)this + 6) = a5;
  v8 = (_DWORD *)((char *)this + 24);
  *((_DWORD *)this + 7) = a6;
  H11ANE::H11ANEThreadReadySyncer::H11ANEThreadReadySyncer((H11ANE::H11ANEThreadReadySyncer *)&v15);
  *((_QWORD *)this + 11) = 0;
  *((_BYTE *)this + 56) = 0;
  v9 = *(_QWORD *)this;
  *((_QWORD *)this + 5) = &v15;
  *((_QWORD *)this + 6) = v9;
  *((_OWORD *)this + 4) = *v7;
  *((_DWORD *)this + 20) = *v8;
  *((_QWORD *)this + 4) = this;
  v10 = pthread_attr_init(&v14);
  if (v10)
  {
    printf("pthread_attr_init() failed. Error: %d\n", v10);
    goto LABEL_13;
  }
  if (*((_DWORD *)this + 7))
  {
    v13.sched_priority = *((_DWORD *)this + 7);
    *(_DWORD *)v13.__opaque = 0;
    if (pthread_attr_setschedparam(&v14, &v13))
    {
      printf("pthread_attr_setschedparam() failed. Error: %d\n");
LABEL_10:
      v11 = 0;
      goto LABEL_11;
    }
  }
  if (pthread_attr_setdetachstate(&v14, 1))
  {
    printf("pthread_attr_setdetachstate() failed. Error: %d\n");
    goto LABEL_10;
  }
  if (pthread_create((pthread_t *)this + 11, &v14, (void *(__cdecl *)(void *))H11ANE::H11ANEFirmwareLoggerThreadStart, (char *)this + 32))
  {
    printf("pthread_create() failed. Error: %d\n");
    goto LABEL_10;
  }
  v11 = 1;
LABEL_11:
  pthread_attr_destroy(&v14);
  if (v11)
    H11ANE::H11ANEThreadReadySyncer::wait(&v15);
LABEL_13:
  H11ANE::H11ANEThreadReadySyncer::~H11ANEThreadReadySyncer((H11ANE::H11ANEThreadReadySyncer *)&v15);
  return this;
}

void sub_207C4D9B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  H11ANE::H11ANEThreadReadySyncer::~H11ANEThreadReadySyncer((H11ANE::H11ANEThreadReadySyncer *)va);
  _Unwind_Resume(a1);
}

uint64_t H11ANE::H11ANEFirmwareLoggerThreadStart(uint64_t a1)
{
  uint64_t v2;
  const __CFAllocator *v3;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v5;
  CFNumberRef v6;
  __IOSurface *v7;
  __IOSurface *v8;
  IOSurfaceID ID;
  void *BaseAddress;
  int ClientLoggingSession;
  int v12;
  size_t AllocSize;
  char *v14;
  size_t v15;
  int v16;
  char *v17;
  void (*v18)(_QWORD, char *);
  int v19;
  uint32_t seed;
  size_t valuePtr;

  pthread_setname_np("H11ANEFirmwareLoggerThread");
  H11ANE::H11ANEThreadReadySyncer::lock(*(pthread_mutex_t **)(a1 + 8));
  v2 = *(_QWORD *)(a1 + 16);
  H11ANE::H11ANEThreadReadySyncer::signalAndUnlock(*(H11ANE::H11ANEThreadReadySyncer **)(a1 + 8));
  if (!v2)
    return 0;
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    printf("%s: Unable to allocate CFDictionary for IOSurface properties \n", "void *H11ANE::H11ANEFirmwareLoggerThreadStart(H11ANEFirmwareLoggerThreadParams *)");
    goto LABEL_24;
  }
  v5 = Mutable;
  valuePtr = 0x10000;
  v6 = CFNumberCreate(v3, kCFNumberLongType, &valuePtr);
  CFDictionaryAddValue(v5, (const void *)*MEMORY[0x24BDD8E18], v6);
  CFRelease(v6);
  v7 = IOSurfaceCreate(v5);
  if (!v7)
  {
    printf("%s: Unable to create IOSurface for client logging buffer \n", "void *H11ANE::H11ANEFirmwareLoggerThreadStart(H11ANEFirmwareLoggerThreadParams *)");
    CFRelease(v5);
    goto LABEL_24;
  }
  v8 = v7;
  seed = 0;
  IOSurfaceLock(v7, 0, &seed);
  ID = IOSurfaceGetID(v8);
  BaseAddress = IOSurfaceGetBaseAddress(v8);
  if (BaseAddress)
  {
    bzero(BaseAddress, valuePtr);
    ClientLoggingSession = H11ANE::H11ANEDevice::ANE_CreateClientLoggingSession(*(H11ANE::H11ANEDevice **)(a1 + 16), ID);
    v12 = ClientLoggingSession;
    if (ClientLoggingSession)
    {
      printf("%s: ANE_CreateClientLoggingSession returned 0x%08x \n", "void *H11ANE::H11ANEFirmwareLoggerThreadStart(H11ANEFirmwareLoggerThreadParams *)", ClientLoggingSession);
      CFRelease(v8);
      ID = 0;
      v8 = 0;
    }
  }
  else
  {
    v12 = -536870212;
  }
  IOSurfaceUnlock(v8, 0, &seed);
  CFRelease(v5);
  if (!v8)
  {
    if (v12 == -536870201)
      return 0;
LABEL_24:
    (*(void (**)(_QWORD, const char *))(a1 + 32))(*(_QWORD *)(a1 + 40), "Firmware logging aborted \n");
    return 0;
  }
  while (!*(_BYTE *)(a1 + 24))
  {
    IOSurfaceLock(v8, 0, 0);
    AllocSize = IOSurfaceGetAllocSize(v8);
    v14 = (char *)IOSurfaceGetBaseAddress(v8);
    v16 = *(_DWORD *)v14;
    LODWORD(v15) = *((_DWORD *)v14 + 1);
    if ((_DWORD)v15 != *(_DWORD *)v14)
    {
      v17 = v14;
      do
      {
        v18 = *(void (**)(_QWORD, char *))(a1 + 32);
        if (v18)
        {
          v18(*(_QWORD *)(a1 + 40), &v17[v15]);
          v16 = *(_DWORD *)v17;
          LODWORD(v15) = *((_DWORD *)v17 + 1);
        }
        v15 = (v15 + 128);
        if (AllocSize <= v15)
          LODWORD(v15) = 128;
        *((_DWORD *)v17 + 1) = v15;
      }
      while ((_DWORD)v15 != v16);
    }
    IOSurfaceUnlock(v8, 0, 0);
    usleep(1000 * *(_DWORD *)(a1 + 48));
  }
  v19 = H11ANE::H11ANEDevice::ANE_TerminateClientLoggingSession(*(H11ANE::H11ANEDevice **)(a1 + 16), ID);
  if (v19)
    printf("%s: ANE_TerminateClientLoggingSession returned 0x%08x \n", "void *H11ANE::H11ANEFirmwareLoggerThreadStart(H11ANEFirmwareLoggerThreadParams *)", v19);
  CFRelease(v8);
  return 0;
}

void H11ANE::H11ANEFirmwareLogger::~H11ANEFirmwareLogger(pthread_t *this)
{
  void *v2;

  v2 = 0;
  H11ANE::H11ANEFirmwareLogger::SetFirmwareLoggerThreadPriority((H11ANE::H11ANEFirmwareLogger *)this, 47);
  *((_BYTE *)this + 56) = 1;
  pthread_join(this[11], &v2);
  this[11] = 0;
}

uint64_t H11ANE::H11ANEFirmwareLogger::SetFirmwareLoggerThreadPriority(H11ANE::H11ANEFirmwareLogger *this, int a2)
{
  _opaque_pthread_t *v2;
  H11ANE *v4;

  v2 = (_opaque_pthread_t *)*((_QWORD *)this + 11);
  if (!v2)
    return 3758097086;
  v4 = (H11ANE *)pthread_mach_thread_np(v2);
  H11ANE::H11ANESetMachThreadPriority(v4, a2);
  return 0;
}

uint64_t H11ANE::H11ANEFrameReceiver::stopReceive(H11ANE::H11ANEFrameReceiver *this)
{
  os_signpost_id_t v2;
  NSObject *v3;
  unint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  void **v10;
  void **v11;
  void **v12;
  const void **v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  H11ANE::H11ANEFrameReceiverRequest *v17;
  const void **v18;
  uint64_t v19;
  uint64_t v20;
  unsigned int v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  timeval v32;
  timespec buf;

  v2 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle](ANEServicesLog, "handle"), (const void *)0x61B2204);
  v3 = +[ANEServicesLog handle](ANEServicesLog, "handle");
  v4 = v2 - 1;
  if (v2 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v5 = v3;
    if (os_signpost_enabled(v3))
    {
      LOWORD(buf.tv_sec) = 0;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v2, "H11ANEFrameReceiverStop", (const char *)&unk_207C6A44A, (uint8_t *)&buf, 2u);
    }
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 112));
  if (*(_DWORD *)this)
  {
    H11ANE::H11ANEFrameReceiver::stopNoDataTimer(this);
    pthread_mutex_lock((pthread_mutex_t *)((char *)this + 176));
    *((_BYTE *)this + 408) = 1;
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 176));
    pthread_mutex_lock((pthread_mutex_t *)((char *)this + 176));
    if (*((_QWORD *)this + 50))
    {
      v6 = 2001;
      while (1)
      {
        usleep(0x3E8u);
        if (!--v6)
          break;
        pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 176));
        pthread_mutex_lock((pthread_mutex_t *)((char *)this + 176));
        if (!*((_QWORD *)this + 50))
          goto LABEL_9;
      }
      printf("H11ANEFrameReceiver: Did not get all pending requests back from kernel. remaining: %d.\n", *((_QWORD *)this + 50));
      v10 = (void **)*((_QWORD *)this + 46);
      v11 = (void **)*((_QWORD *)this + 47);
      v12 = &v10[*((_QWORD *)this + 49) >> 9];
      if (v11 == v10)
        v13 = 0;
      else
        v13 = (const void **)((char *)*v12 + 8 * (*((_QWORD *)this + 49) & 0x1FFLL));
      while (1)
      {
        v14 = (char *)v11 - (char *)v10;
        if (v14)
        {
          v15 = *((_QWORD *)this + 50) + *((_QWORD *)this + 49);
          v16 = *(uint64_t *)((char *)v10 + ((v15 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v15 & 0x1FF);
        }
        else
        {
          v16 = 0;
        }
        if (v13 == (const void **)v16)
          break;
        v17 = (H11ANE::H11ANEFrameReceiverRequest *)*v13;
        printf("H11ANEFrameReceiver: Request not returned 0x%p\n", *v13);
        if (v17)
        {
          H11ANE::H11ANEFrameReceiverRequest::~H11ANEFrameReceiverRequest(v17);
          MEMORY[0x20BD010DC]();
        }
        if ((char *)++v13 - (_BYTE *)*v12 == 4096)
        {
          v18 = (const void **)v12[1];
          ++v12;
          v13 = v18;
        }
        v10 = (void **)*((_QWORD *)this + 46);
        v11 = (void **)*((_QWORD *)this + 47);
      }
      *((_QWORD *)this + 50) = 0;
      if (v14 >= 0x11)
      {
        do
        {
          operator delete(*v10);
          v19 = *((_QWORD *)this + 47);
          v10 = (void **)(*((_QWORD *)this + 46) + 8);
          *((_QWORD *)this + 46) = v10;
          v14 = v19 - (_QWORD)v10;
        }
        while (v14 > 0x10);
      }
      v7 = 3758097110;
      if (v14 >> 3 == 1)
      {
        v20 = 256;
        goto LABEL_31;
      }
      if (v14 >> 3 == 2)
      {
        v20 = 512;
LABEL_31:
        *((_QWORD *)this + 49) = v20;
      }
    }
    else
    {
LABEL_9:
      v7 = 0;
    }
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 176));
    if (*((_DWORD *)this + 14))
    {
      gettimeofday(&v32, 0);
      v21 = 1000 * v32.tv_usec + 1000000 * *((_DWORD *)this + 4);
      buf.tv_sec = v32.tv_sec + v21 / 0x3B9ACA00uLL;
      buf.tv_nsec = v21 % 0x3B9ACA00;
      if (pthread_cond_timedwait((pthread_cond_t *)((char *)this + 64), (pthread_mutex_t *)((char *)this + 112), &buf) == 60)
      {
        v22 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v22)
          H11ANE::H11ANEFrameReceiver::stopReceive(v22, v23, v24, v25, v26, v27, v28, v29);
      }
    }
    *((_BYTE *)this + 408) = 0;
    *(_DWORD *)this = 0;
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 112));
    v30 = +[ANEServicesLog handle](ANEServicesLog, "handle");
    if (v4 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v9 = v30;
      if (os_signpost_enabled(v30))
      {
        LOWORD(buf.tv_sec) = 0;
        goto LABEL_39;
      }
    }
    return v7;
  }
  v7 = 3758097122;
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 112));
  v8 = +[ANEServicesLog handle](ANEServicesLog, "handle");
  if (v4 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled(v8))
    {
      LOWORD(buf.tv_sec) = 0;
LABEL_39:
      _os_signpost_emit_with_name_impl(&dword_207C43000, v9, OS_SIGNPOST_INTERVAL_END, v2, "H11ANEFrameReceiverStop", (const char *)&unk_207C6A44A, (uint8_t *)&buf, 2u);
    }
  }
  return v7;
}

uint64_t H11ANE::H11ANEFrameReceiver::setupFrameReceiver(CFTypeRef *this)
{
  CFRetain(this[1]);
  return H11ANE::H11ANEFrameReceiver::addIODispatcherToRunLoop((H11ANE::H11ANEFrameReceiver *)this);
}

uint64_t H11ANE::H11ANEFrameReceiver::registerMessageCallback(H11ANE::H11ANEFrameReceiver *this, void (*a2)(unsigned int, unsigned int, unsigned int, void *, void *, void *), void *a3)
{
  *((_QWORD *)this + 5) = a2;
  *((_QWORD *)this + 6) = a3;
  return 0;
}

uint64_t H11ANE::H11ANEFrameReceiver::stopNoDataTimer(H11ANE::H11ANEFrameReceiver *this)
{
  pthread_mutex_t *v2;
  __CFRunLoopTimer *v3;

  v2 = (pthread_mutex_t *)((char *)this + 256);
  pthread_mutex_lock((pthread_mutex_t *)this + 4);
  v3 = (__CFRunLoopTimer *)*((_QWORD *)this + 40);
  if (v3)
  {
    CFRunLoopTimerInvalidate(v3);
    CFRelease(*((CFTypeRef *)this + 40));
    *((_QWORD *)this + 40) = 0;
  }
  return pthread_mutex_unlock(v2);
}

uint64_t H11ANE::H11ANEFrameReceiver::registerFrameReceiveCallback(H11ANE::H11ANEFrameReceiver *this, void (*a2)(void *, H11ANE::H11ANEFrameReceiverRequest *), void *a3)
{
  *((_QWORD *)this + 3) = a3;
  *((_QWORD *)this + 4) = a2;
  return 0;
}

void std::deque<H11ANE::H11ANEFrameReceiverRequest *>::push_back(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a1[2];
  v5 = a1[1];
  if (v4 == v5)
    v6 = 0;
  else
    v6 = ((v4 - v5) << 6) - 1;
  v7 = a1[5];
  v8 = v7 + a1[4];
  if (v6 == v8)
  {
    std::deque<H11ANE::H11ANEFrameReceiverRequest *>::__add_back_capacity(a1);
    v5 = a1[1];
    v7 = a1[5];
    v8 = a1[4] + v7;
  }
  *(_QWORD *)(*(_QWORD *)(v5 + ((v8 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v8 & 0x1FF)) = *a2;
  a1[5] = v7 + 1;
}

uint64_t H11ANE::H11ANEFrameReceiver::startNoDataTimer(H11ANE::H11ANEFrameReceiver *this)
{
  pthread_mutex_t *v2;
  __CFRunLoopTimer *v3;
  CFAbsoluteTime Current;
  unint64_t v5;
  __CFRunLoopTimer *v6;
  CFRunLoopTimerContext context;

  v2 = (pthread_mutex_t *)((char *)this + 256);
  pthread_mutex_lock((pthread_mutex_t *)this + 4);
  v3 = (__CFRunLoopTimer *)*((_QWORD *)this + 40);
  if (v3)
  {
    CFRunLoopTimerInvalidate(v3);
    CFRelease(*((CFTypeRef *)this + 40));
    *((_QWORD *)this + 40) = 0;
  }
  context.version = 0;
  context.info = this;
  memset(&context.retain, 0, 24);
  if (*((_DWORD *)this + 4))
  {
    Current = CFAbsoluteTimeGetCurrent();
    LODWORD(v5) = *((_DWORD *)this + 4);
    v6 = CFRunLoopTimerCreate(0, Current + (double)v5 / 1000.0 + 30.0, 0.0, 0, 0, (CFRunLoopTimerCallBack)H11ANE::H11ANEFrameReceiver::NoDataTimeout, &context);
    *((_QWORD *)this + 40) = v6;
    if (v6)
      CFRunLoopAddTimer(*((CFRunLoopRef *)this + 1), v6, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
  }
  return pthread_mutex_unlock(v2);
}

_QWORD *std::deque<H11ANE::H11ANEFrameReceiverRequest *>::erase(int64x2_t *a1, char *a2, char *a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  unint64_t v7;
  char **v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char **v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char **v21;
  char *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  char **v26;
  char *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char **v32;
  char *v33;
  __n128 v34[2];

  v4 = a1->i64[1];
  v5 = (char *)(v4 + 8 * ((unint64_t)a1[2].i64[0] >> 9));
  if (a1[1].i64[0] == v4)
    v6 = 0;
  else
    v6 = (char *)(*(_QWORD *)v5 + 8 * (a1[2].i64[0] & 0x1FF));
  v32 = (char **)(v4 + 8 * ((unint64_t)a1[2].i64[0] >> 9));
  v33 = v6;
  if (v6 == a3)
    v7 = 0;
  else
    v7 = ((uint64_t)&a3[-*(_QWORD *)a2] >> 3) + ((a2 - v5) << 6) - ((uint64_t)&v6[-*(_QWORD *)v5] >> 3);
  v8 = (char **)std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>::operator+[abi:ne180100]((uint64_t)&v32, v7);
  v10 = (unint64_t)v8;
  v11 = (unint64_t)v9;
  v12 = a1[2].i64[1];
  if (v7 <= (unint64_t)(v12 - 1) >> 1)
  {
    v18 = v9 - *v8;
    v19 = v18 >> 3;
    if (v18 < -7)
    {
      v28 = 510 - v19;
      v21 = &v8[-(v28 >> 9)];
      v22 = &(*v21)[8 * (~(_WORD)v28 & 0x1FF)];
    }
    else
    {
      v20 = v19 + 1;
      v21 = &v8[v20 >> 9];
      v22 = &(*v21)[8 * (v20 & 0x1FF)];
    }
    std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,0>(v32, v33, v8, v9, v21, v22, v34);
    a1[2] = vaddq_s64(a1[2], (int64x2_t)xmmword_207C67320);
    std::deque<H11ANE::H11ANEFrameReceiverRequest *>::__maybe_remove_front_spare[abi:ne180100]((uint64_t)a1, 1);
  }
  else
  {
    v13 = v9 - *v8;
    v14 = v13 >> 3;
    if (v13 < -7)
    {
      v23 = 510 - v14;
      v16 = &v8[-(v23 >> 9)];
      v17 = &(*v16)[8 * (~(_WORD)v23 & 0x1FF)];
    }
    else
    {
      v15 = v14 + 1;
      v16 = &v8[v15 >> 9];
      v17 = &(*v16)[8 * (v15 & 0x1FF)];
    }
    v24 = a1[2].i64[0] + v12;
    v25 = a1->i64[1];
    v26 = (char **)(v25 + 8 * (v24 >> 9));
    if (a1[1].i64[0] == v25)
      v27 = 0;
    else
      v27 = &(*v26)[8 * (v24 & 0x1FF)];
    v34[0].n128_u64[0] = v10;
    v34[0].n128_u64[1] = v11;
    std::__for_each_segment[abi:ne180100]<std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,std::__move_loop<std::_ClassicAlgPolicy>::_MoveSegment<std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>>>(v16, v17, v26, v27, (uint64_t)v34);
    --a1[2].i64[1];
    std::deque<H11ANE::H11ANEFrameReceiverRequest *>::__maybe_remove_back_spare[abi:ne180100](a1, 1);
  }
  v29 = a1->i64[1];
  if (a1[1].i64[0] == v29)
    v30 = 0;
  else
    v30 = *(_QWORD *)(v29 + 8 * ((unint64_t)a1[2].i64[0] >> 9)) + 8 * (a1[2].i64[0] & 0x1FF);
  v34[0].n128_u64[0] = v29 + 8 * ((unint64_t)a1[2].i64[0] >> 9);
  v34[0].n128_u64[1] = v30;
  return std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>::operator+[abi:ne180100]((uint64_t)v34, v7);
}

unsigned __int16 *H11ANE::dumpFwStatsData(unsigned __int16 *result)
{
  unsigned __int16 *v1;
  uint64_t v2;
  unsigned __int16 *v3;
  int v4;
  int v5;
  unsigned int *v6;
  int v7;
  uint64_t v8;
  _DWORD *v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _DWORD *v14;
  unint64_t v15;
  unsigned __int16 *v16;
  unsigned __int16 *v17;
  unsigned __int16 *v18;
  unsigned __int16 *v19;
  uint64_t v20;

  if (result)
  {
    v1 = result;
    printf("%s Stats Buffer content:\n", "dumpFwStatsData");
    printf("%s   Version: %d\n", "dumpFwStatsData", *v1);
    printf("%s   programId: %d\n", "dumpFwStatsData", *((_DWORD *)v1 + 1));
    printf("%s   processId:%d\n", "dumpFwStatsData", *((_DWORD *)v1 + 2));
    printf("%s   procedureId:%d\n", "dumpFwStatsData", *((_DWORD *)v1 + 3));
    printf("%s   uuid:0x%llx\n", "dumpFwStatsData", *((_QWORD *)v1 + 2));
    printf("%s   priority:%d\n", "dumpFwStatsData", *((_DWORD *)v1 + 6));
    result = (unsigned __int16 *)printf("%s   totDescriptors:%d\n", "dumpFwStatsData", *((_DWORD *)v1 + 7));
    if (*((_DWORD *)v1 + 7))
    {
      v2 = 0;
      v17 = v1 + 12;
      v18 = v1 + 76;
      v19 = v1;
      do
      {
        v3 = &v1[4 * v2];
        v4 = *((_DWORD *)v3 + 8);
        v5 = *((_DWORD *)v3 + 9);
        v6 = (unsigned int *)(v3 + 16);
        v20 = v2;
        printf("%s descr%d: offset: %x, size: %x\n", "dumpFwStatsData", v2, v4, v5);
        v7 = *v1;
        if (v7 == 513)
        {
          v13 = *v6;
          v14 = (_DWORD *)((char *)v1 + v13);
          printf("%s totalEventsSpace: %x \n", "dumpFwDramLogStatsData", *v14);
          printf("%s totEventsReceived: %d \n", "dumpFwDramLogStatsData", v14[1]);
          result = (unsigned __int16 *)printf("%s totEventsRecorded: %d \n", "dumpFwDramLogStatsData", v14[1]);
          if (v14[1])
          {
            v15 = 0;
            v16 = (unsigned __int16 *)((char *)v18 + v13);
            do
            {
              printf("%s tid: %d \n", "dumpFwDramLogStatsData", *v16);
              printf("%s nid: %d \n", "dumpFwDramLogStatsData", *v16);
              printf("%s event: %x \n", "dumpFwDramLogStatsData", *((unsigned __int8 *)v16 + 3));
              printf("%s aux: %x \n", "dumpFwDramLogStatsData", *((_DWORD *)v16 + 1) & 0x1F);
              result = (unsigned __int16 *)printf("%s timeStamp: %llx \n", "dumpFwDramLogStatsData", *((_QWORD *)v16 + 1));
              ++v15;
              v16 += 8;
            }
            while (v15 < v14[1]);
          }
        }
        else if (v7 == 257)
        {
          v8 = *v6;
          v9 = (_DWORD *)((char *)v1 + v8);
          printf("%s totalEventsSpace: %x \n", "dumpFwDebugLogStatsData", *v9);
          printf("%s totEventsReceived: %d \n", "dumpFwDebugLogStatsData", v9[1]);
          result = (unsigned __int16 *)printf("%s totEventsRecorded: %d \n", "dumpFwDebugLogStatsData", v9[2]);
          if (v9[2])
          {
            v10 = 0;
            v11 = (_QWORD *)((char *)v17 + v8);
            do
            {
              printf("%s tid: %d \n", "dumpFwDebugLogStatsData", *((_DWORD *)v11 - 3));
              printf("%s nid: %d \n", "dumpFwDebugLogStatsData", *((_DWORD *)v11 - 2));
              printf("%s event: %x \n", "dumpFwDebugLogStatsData", *((unsigned __int16 *)v11 - 2));
              printf("%s aux: %x \n", "dumpFwDebugLogStatsData", *((unsigned __int8 *)v11 - 2));
              v12 = *v11;
              v11 = (_QWORD *)((char *)v11 + 20);
              result = (unsigned __int16 *)printf("%s timeStamp: %llx \n", "dumpFwDebugLogStatsData", v12);
              ++v10;
            }
            while (v10 < v9[2]);
          }
        }
        else
        {
          result = (unsigned __int16 *)printf("%s ERROR: Invalid stats version %u\n", "dumpFwStatsData", *v1);
        }
        v1 = v19;
        v2 = v20 + 1;
      }
      while (v20 + 1 < (unint64_t)*((unsigned int *)v19 + 7));
    }
  }
  return result;
}

_QWORD *H11ANE::H11ANEFrameReceiver::FrameDone(_QWORD *this, void *a2, _QWORD *a3, unint64_t *a4)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  __CVBuffer *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  NSObject *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  unsigned __int16 *BaseAddress;
  void *v27;
  H11ANE::H11ANEFrameReceiver *v28;
  os_signpost_id_t spid;
  unint64_t v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  _BYTE v34[24];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  if (!this)
    return this;
  if ((_DWORD)a4 != 8)
    return (_QWORD *)printf("H11ANEFrameReceiver::FrameDone, numArgs=%d doesn't match kernel side size: %d, No action\n", (_DWORD)a4, 8);
  v5 = (int)a2;
  v6 = (uint64_t)this;
  v7 = a3[4] | (a3[3] << 32);
  v8 = a3[1] | (a3[2] << 32);
  v9 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle](ANEServicesLog, "handle"), (const void *)0x61B220C);
  v10 = +[ANEServicesLog handle](ANEServicesLog, "handle");
  spid = v9;
  v30 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = v10;
    if (os_signpost_enabled(v10))
    {
      *(_DWORD *)buf = 134218752;
      v32 = v7;
      v33 = 1024;
      *(_DWORD *)v34 = 0;
      *(_WORD *)&v34[4] = 2048;
      *(_QWORD *)&v34[6] = v8;
      *(_WORD *)&v34[14] = 2048;
      *(_QWORD *)&v34[16] = a3;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "H11ANEFrameReceiverFrameDone", "progHandle=%llx procid=%x transid=%llx args=%llx", buf, 0x26u);
    }
  }
  v12 = (__CVBuffer *)pthread_mutex_lock((pthread_mutex_t *)(v6 + 176));
  v13 = *(_QWORD *)(v6 + 368);
  v14 = *(_QWORD *)(v6 + 376);
  v15 = v13 + 8 * (*(_QWORD *)(v6 + 392) >> 9);
  if (v14 == v13)
    v16 = 0;
  else
    v16 = (char *)(*(_QWORD *)v15 + 8 * (*(_QWORD *)(v6 + 392) & 0x1FFLL));
  v17 = MEMORY[0x24BDACB70];
  while (1)
  {
    if (v14 == v13)
    {
      v19 = 0;
    }
    else
    {
      v18 = *(_QWORD *)(v6 + 400) + *(_QWORD *)(v6 + 392);
      v19 = *(_QWORD *)(v13 + ((v18 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v18 & 0x1FF);
    }
    if (v16 == (char *)v19)
    {
      v23 = 0;
      goto LABEL_24;
    }
    v20 = *(_QWORD *)v16;
    if (*(_QWORD *)v16)
    {
      if (*(_QWORD *)(v20 + 8256) == v8)
        break;
    }
LABEL_20:
    v16 += 8;
    if (&v16[-*(_QWORD *)v15] == (char *)4096)
    {
      v22 = *(char **)(v15 + 8);
      v15 += 8;
      v16 = v22;
    }
    v13 = *(_QWORD *)(v6 + 368);
    v14 = *(_QWORD *)(v6 + 376);
  }
  v21 = *(_QWORD *)(v20 + 8232);
  if (v21 != v7)
  {
    v12 = (__CVBuffer *)os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if ((_DWORD)v12)
    {
      *(_DWORD *)buf = 134218496;
      v32 = v8;
      v33 = 2048;
      *(_QWORD *)v34 = v21;
      *(_WORD *)&v34[8] = 2048;
      *(_QWORD *)&v34[10] = v7;
      _os_log_error_impl(&dword_207C43000, v17, OS_LOG_TYPE_ERROR, "Request received for different program!! transactionId=0x%llx, req->programHandle=0x%llx, programHandle=0x%llx\n", buf, 0x20u);
    }
    goto LABEL_20;
  }
  *(_BYTE *)(v20 + 8288) = a3[6];
  if (*a3 == 768 && (unint64_t)(a3[7] - 1) <= 1)
    v12 = (__CVBuffer *)std::deque<H11ANE::H11ANEFrameReceiverRequest *>::erase((int64x2_t *)(v6 + 360), (char *)v15, v16);
  v7 = *(_QWORD *)(v20 + 8232);
  v23 = *(_DWORD *)(v20 + 8240);
  v8 = *(_QWORD *)(v20 + 8256);
  *(_DWORD *)(v20 + 8224) = v5;
  if (*(_QWORD *)(v6 + 32))
  {
    if (*a3 == 770)
    {
      *(_QWORD *)(v20 + 8264) = a3[7] | 0x1000;
    }
    else
    {
      *(_QWORD *)(v20 + 8264) = 0;
      if (debugFwStatsData)
      {
        v12 = *(__CVBuffer **)(v20 + 8200);
        if (v12)
        {
          if ((*(_BYTE *)(v20 + 8196) & 0xB) != 0)
          {
            CVPixelBufferLockBaseAddress(v12, 0);
            BaseAddress = (unsigned __int16 *)CVPixelBufferGetBaseAddress(*(CVPixelBufferRef *)(v20 + 8200));
            H11ANE::dumpFwStatsData(BaseAddress);
            v12 = (__CVBuffer *)CVPixelBufferUnlockBaseAddress(*(CVPixelBufferRef *)(v20 + 8200), 0);
          }
        }
      }
    }
    v27 = (void *)MEMORY[0x20BD0131C](v12);
    (*(void (**)(_QWORD, uint64_t))(v6 + 32))(*(_QWORD *)(v6 + 24), v20);
    objc_autoreleasePoolPop(v27);
    if (*a3 == 768 && a3[7] == 1)
    {
      H11ANE::H11ANEFrameReceiver::releaseRequestBuffers(v28, (H11ANE::H11ANEFrameReceiverRequest *)v20);
      H11ANE::H11ANEFrameReceiverRequest::~H11ANEFrameReceiverRequest((H11ANE::H11ANEFrameReceiverRequest *)v20);
      MEMORY[0x20BD010DC]();
    }
  }
LABEL_24:
  if (*(_QWORD *)(v6 + 400))
    H11ANE::H11ANEFrameReceiver::tickleNoDataTimer((pthread_mutex_t *)v6);
  else
    H11ANE::H11ANEFrameReceiver::stopNoDataTimer((H11ANE::H11ANEFrameReceiver *)v6);
  if (*(_BYTE *)(v6 + 248) && !*(_QWORD *)(v6 + 400))
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v6 + 240));
  pthread_mutex_unlock((pthread_mutex_t *)(v6 + 176));
  v24 = +[ANEServicesLog handle](ANEServicesLog, "handle");
  if (v30 < 0xFFFFFFFFFFFFFFFELL)
  {
    v25 = v24;
    v24 = os_signpost_enabled(v24);
    if ((_DWORD)v24)
    {
      *(_DWORD *)buf = 134218752;
      v32 = v7;
      v33 = 1024;
      *(_DWORD *)v34 = v23;
      *(_WORD *)&v34[4] = 2048;
      *(_QWORD *)&v34[6] = v8;
      *(_WORD *)&v34[14] = 2048;
      *(_QWORD *)&v34[16] = a3;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v25, OS_SIGNPOST_INTERVAL_END, spid, "H11ANEFrameReceiverFrameDone", "progHandle=%llx procid=%x transid=%llx args=%llx", buf, 0x26u);
    }
  }
  return H11ANE::H11ANECheckForPendingClose((H11ANE *)v24);
}

uint64_t H11ANE::H11ANEFrameReceiver::tickleNoDataTimer(pthread_mutex_t *this)
{
  pthread_mutex_t *v2;
  __CFRunLoopTimer *sig;
  CFAbsoluteTime Current;
  unint64_t v5;

  v2 = this + 4;
  pthread_mutex_lock(this + 4);
  sig = (__CFRunLoopTimer *)this[5].__sig;
  if (sig)
  {
    Current = CFAbsoluteTimeGetCurrent();
    LODWORD(v5) = *(_DWORD *)&this->__opaque[8];
    CFRunLoopTimerSetNextFireDate(sig, Current + (double)v5 / 1000.0 + 30.0);
  }
  return pthread_mutex_unlock(v2);
}

uint64_t H11ANE::H11ANEFrameReceiver::NoDataTimeout(H11ANE::H11ANEFrameReceiver *this, __CFRunLoopTimer *a2, void *a3)
{
  pthread_mutex_t *v4;
  void **v5;
  void **v6;
  void **v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned __int8 i;
  const void *v14;
  unsigned int v15;
  unsigned __int8 j;
  const void *v17;
  unsigned int v18;
  unsigned __int8 k;
  const void *v20;
  __CVBuffer *v21;
  const void *v22;
  const void *v23;
  uint64_t *v24;
  void (*v25)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v4 = (pthread_mutex_t *)((char *)a2 + 176);
  pthread_mutex_lock((pthread_mutex_t *)((char *)a2 + 176));
  v5 = (void **)*((_QWORD *)a2 + 46);
  v6 = (void **)*((_QWORD *)a2 + 47);
  v7 = &v5[*((_QWORD *)a2 + 49) >> 9];
  if (v6 == v5)
    v8 = 0;
  else
    v8 = (uint64_t *)((char *)*v7 + 8 * (*((_QWORD *)a2 + 49) & 0x1FFLL));
  while (1)
  {
    if (v6 == v5)
    {
      v10 = 0;
    }
    else
    {
      v9 = *((_QWORD *)a2 + 50) + *((_QWORD *)a2 + 49);
      v10 = *(uint64_t *)((char *)v5 + ((v9 >> 6) & 0x3FFFFFFFFFFFFF8)) + 8 * (v9 & 0x1FF);
    }
    if (v8 == (uint64_t *)v10)
      break;
    v11 = *v8;
    if (*v8)
    {
      *(_DWORD *)(v11 + 8224) = -536870186;
      *(_QWORD *)(v11 + 8264) = 0;
      (*((void (**)(_QWORD, uint64_t))a2 + 4))(*((_QWORD *)a2 + 3), v11);
      v12 = *(_DWORD *)(v11 + 4080);
      if (v12)
      {
        for (i = 0; i < v12; ++i)
        {
          v14 = *(const void **)(v11 + 8 * i);
          if (v14)
          {
            CFRelease(v14);
            v12 = *(_DWORD *)(v11 + 4080);
          }
        }
      }
      *(_DWORD *)(v11 + 4080) = 0;
      v15 = *(_DWORD *)(v11 + 8168);
      if (v15)
      {
        for (j = 0; j < v15; ++j)
        {
          v17 = *(const void **)(v11 + 8 * j + 4088);
          if (v17)
          {
            CFRelease(v17);
            v15 = *(_DWORD *)(v11 + 8168);
          }
        }
      }
      *(_DWORD *)(v11 + 8168) = 0;
      v18 = *(_DWORD *)(v11 + 0x2000);
      if (v18)
      {
        for (k = 0; k < v18; ++k)
        {
          v20 = *(const void **)(v11 + 8 * k + 8176);
          if (v20)
          {
            CFRelease(v20);
            v18 = *(_DWORD *)(v11 + 0x2000);
          }
        }
      }
      *(_DWORD *)(v11 + 0x2000) = 0;
      v21 = *(__CVBuffer **)(v11 + 8200);
      if (v21)
        CVPixelBufferRelease(v21);
      v22 = *(const void **)(v11 + 8216);
      if (v22)
        CFRelease(v22);
      *(_DWORD *)(v11 + 8196) = 0;
      v23 = *(const void **)(v11 + 8208);
      if (v23)
        CFRelease(v23);
      H11ANE::H11ANEFrameReceiverRequest::~H11ANEFrameReceiverRequest((H11ANE::H11ANEFrameReceiverRequest *)v11);
      MEMORY[0x20BD010DC]();
    }
    if ((char *)++v8 - (_BYTE *)*v7 == 4096)
    {
      v24 = (uint64_t *)v7[1];
      ++v7;
      v8 = v24;
    }
    v5 = (void **)*((_QWORD *)a2 + 46);
    v6 = (void **)*((_QWORD *)a2 + 47);
  }
  v25 = (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))*((_QWORD *)a2 + 5);
  if (v25)
  {
    v25(0, 0, 0, 0, 0, *((_QWORD *)a2 + 6));
    v5 = (void **)*((_QWORD *)a2 + 46);
    v6 = (void **)*((_QWORD *)a2 + 47);
  }
  *((_QWORD *)a2 + 50) = 0;
  v26 = (char *)v6 - (char *)v5;
  if (v26 >= 0x11)
  {
    do
    {
      operator delete(*v5);
      v27 = *((_QWORD *)a2 + 47);
      v5 = (void **)(*((_QWORD *)a2 + 46) + 8);
      *((_QWORD *)a2 + 46) = v5;
      v26 = v27 - (_QWORD)v5;
    }
    while (v26 > 0x10);
  }
  if (v26 >> 3 == 1)
  {
    v28 = 256;
    goto LABEL_42;
  }
  if (v26 >> 3 == 2)
  {
    v28 = 512;
LABEL_42:
    *((_QWORD *)a2 + 49) = v28;
  }
  return pthread_mutex_unlock(v4);
}

uint64_t std::deque<H11ANE::H11ANEFrameReceiverRequest *>::~deque[abi:ne180100](_QWORD *a1)
{
  void **v2;
  void **v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = (void **)a1[1];
  v3 = (void **)a1[2];
  a1[5] = 0;
  v4 = (char *)v3 - (char *)v2;
  if ((unint64_t)((char *)v3 - (char *)v2) >= 0x11)
  {
    do
    {
      operator delete(*v2);
      v3 = (void **)a1[2];
      v2 = (void **)(a1[1] + 8);
      a1[1] = v2;
      v4 = (char *)v3 - (char *)v2;
    }
    while ((unint64_t)((char *)v3 - (char *)v2) > 0x10);
  }
  v5 = v4 >> 3;
  if (v5 == 1)
  {
    v6 = 256;
  }
  else
  {
    if (v5 != 2)
      goto LABEL_9;
    v6 = 512;
  }
  a1[4] = v6;
LABEL_9:
  while (v2 != v3)
  {
    v7 = *v2++;
    operator delete(v7);
  }
  return std::__split_buffer<H11ANE::H11ANEFrameReceiverRequest **>::~__split_buffer((uint64_t)a1);
}

void std::deque<H11ANE::H11ANEFrameReceiverRequest *>::__add_back_capacity(_QWORD *a1)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  char *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  unint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  _QWORD *v56;

  v2 = a1[4];
  v3 = v2 >= 0x200;
  v4 = v2 - 512;
  if (v3)
  {
    v5 = (uint64_t)(a1 + 3);
    v6 = (char *)a1[3];
    a1[4] = v4;
    v7 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v11 = *v7;
    v9 = (char *)(v7 + 1);
    v10 = v11;
    a1[1] = v9;
    if (v8 != v6)
    {
LABEL_33:
      *(_QWORD *)v8 = v10;
      a1[2] += 8;
      return;
    }
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v33 = 1;
      else
        v33 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<H11ANE::H11ANEFrameReceiverRequest **>>(v5, v33);
      v35 = &v34[8 * (v33 >> 2)];
      v37 = &v34[8 * v36];
      v38 = (uint64_t *)a1[1];
      v8 = v35;
      v39 = a1[2] - (_QWORD)v38;
      if (v39)
      {
        v8 = &v35[v39 & 0xFFFFFFFFFFFFFFF8];
        v40 = 8 * (v39 >> 3);
        v41 = &v34[8 * (v33 >> 2)];
        do
        {
          v42 = *v38++;
          *(_QWORD *)v41 = v42;
          v41 += 8;
          v40 -= 8;
        }
        while (v40);
      }
      goto LABEL_30;
    }
LABEL_5:
    v13 = v12 >> 3;
    v14 = v12 >> 3 < -1;
    v15 = (v12 >> 3) + 2;
    if (v14)
      v16 = v15;
    else
      v16 = v13 + 1;
    v17 = -(v16 >> 1);
    v18 = v16 >> 1;
    v19 = &v9[-8 * v18];
    v20 = v8 - v9;
    if (v8 != v9)
    {
      memmove(&v9[-8 * v18], v9, v8 - v9);
      v9 = (char *)a1[1];
    }
    v8 = &v19[v20];
    a1[1] = &v9[8 * v17];
    a1[2] = &v19[v20];
    goto LABEL_33;
  }
  v21 = a1[2];
  v22 = (v21 - a1[1]) >> 3;
  v23 = a1[3];
  v24 = v23 - *a1;
  if (v22 < v24 >> 3)
  {
    if (v23 != v21)
    {
      *(_QWORD *)&v54 = operator new(0x1000uLL);
      std::__split_buffer<H11ANE::H11ANEFrameReceiverRequest **>::push_back(a1, &v54);
      return;
    }
    *(_QWORD *)&v54 = operator new(0x1000uLL);
    std::__split_buffer<H11ANE::H11ANEFrameReceiverRequest **>::push_front((uint64_t)a1, &v54);
    v44 = (_QWORD *)a1[1];
    v8 = (char *)a1[2];
    v45 = *v44;
    v9 = (char *)(v44 + 1);
    v10 = v45;
    a1[1] = v9;
    if (v8 != (char *)a1[3])
      goto LABEL_33;
    v12 = (uint64_t)&v9[-*a1];
    if ((unint64_t)v9 <= *a1)
    {
      if (v8 == (char *)*a1)
        v46 = 1;
      else
        v46 = (uint64_t)&v8[-*a1] >> 2;
      v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<H11ANE::H11ANEFrameReceiverRequest **>>((uint64_t)(a1 + 3), v46);
      v35 = &v34[8 * (v46 >> 2)];
      v37 = &v34[8 * v47];
      v48 = (uint64_t *)a1[1];
      v8 = v35;
      v49 = a1[2] - (_QWORD)v48;
      if (v49)
      {
        v8 = &v35[v49 & 0xFFFFFFFFFFFFFFF8];
        v50 = 8 * (v49 >> 3);
        v51 = &v34[8 * (v46 >> 2)];
        do
        {
          v52 = *v48++;
          *(_QWORD *)v51 = v52;
          v51 += 8;
          v50 -= 8;
        }
        while (v50);
      }
LABEL_30:
      v43 = (char *)*a1;
      *a1 = v34;
      a1[1] = v35;
      a1[2] = v8;
      a1[3] = v37;
      if (v43)
      {
        operator delete(v43);
        v8 = (char *)a1[2];
      }
      goto LABEL_33;
    }
    goto LABEL_5;
  }
  if (v23 == *a1)
    v25 = 1;
  else
    v25 = v24 >> 2;
  v56 = a1 + 3;
  *(_QWORD *)&v54 = std::__allocate_at_least[abi:ne180100]<std::allocator<H11ANE::H11ANEFrameReceiverRequest **>>((uint64_t)(a1 + 3), v25);
  *((_QWORD *)&v54 + 1) = v54 + 8 * v22;
  *(_QWORD *)&v55 = *((_QWORD *)&v54 + 1);
  *((_QWORD *)&v55 + 1) = v54 + 8 * v26;
  v53 = operator new(0x1000uLL);
  std::__split_buffer<H11ANE::H11ANEFrameReceiverRequest **>::push_back(&v54, &v53);
  v27 = (_QWORD *)a1[2];
  v28 = -7 - (_QWORD)v27;
  while (v27 != (_QWORD *)a1[1])
  {
    --v27;
    v28 += 8;
    std::__split_buffer<H11ANE::H11ANEFrameReceiverRequest **>::push_front((uint64_t)&v54, v27);
  }
  v29 = (char *)*a1;
  v30 = v54;
  v31 = v55;
  *(_QWORD *)&v54 = *a1;
  *((_QWORD *)&v54 + 1) = v27;
  v32 = *((_OWORD *)a1 + 1);
  *(_OWORD *)a1 = v30;
  *((_OWORD *)a1 + 1) = v31;
  v55 = v32;
  if (v27 != (_QWORD *)v32)
    *(_QWORD *)&v55 = v32 + (-(v32 + v28) & 0xFFFFFFFFFFFFFFF8);
  if (v29)
    operator delete(v29);
}

void sub_207C4F210(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13)
{
  void *v13;

  operator delete(v13);
  if (__p)
    operator delete(__p);
  _Unwind_Resume(a1);
}

void std::__split_buffer<H11ANE::H11ANEFrameReceiverRequest **>::push_back(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int64_t v16;
  char *v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;

  v5 = (char *)a1[3];
  v4 = (uint64_t)(a1 + 3);
  v6 = *(char **)(v4 - 8);
  if (v6 == v5)
  {
    v7 = (char *)a1[1];
    v8 = (uint64_t)&v7[-*a1];
    if ((unint64_t)v7 <= *a1)
    {
      if (v6 == (char *)*a1)
        v18 = 1;
      else
        v18 = (uint64_t)&v6[-*a1] >> 2;
      v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<H11ANE::H11ANEFrameReceiverRequest **>>(v4, v18);
      v21 = &v19[8 * (v18 >> 2)];
      v22 = (uint64_t *)a1[1];
      v6 = v21;
      v23 = a1[2] - (_QWORD)v22;
      if (v23)
      {
        v6 = &v21[v23 & 0xFFFFFFFFFFFFFFF8];
        v24 = 8 * (v23 >> 3);
        v25 = &v19[8 * (v18 >> 2)];
        do
        {
          v26 = *v22++;
          *(_QWORD *)v25 = v26;
          v25 += 8;
          v24 -= 8;
        }
        while (v24);
      }
      v27 = (char *)*a1;
      *a1 = v19;
      a1[1] = v21;
      a1[2] = v6;
      a1[3] = &v19[8 * v20];
      if (v27)
      {
        operator delete(v27);
        v6 = (char *)a1[2];
      }
    }
    else
    {
      v9 = v8 >> 3;
      v10 = v8 >> 3 < -1;
      v11 = (v8 >> 3) + 2;
      if (v10)
        v12 = v11;
      else
        v12 = v9 + 1;
      v13 = -(v12 >> 1);
      v14 = v12 >> 1;
      v15 = &v7[-8 * v14];
      v16 = v6 - v7;
      if (v6 != v7)
      {
        memmove(&v7[-8 * v14], v7, v6 - v7);
        v6 = (char *)a1[1];
      }
      v17 = &v6[8 * v13];
      v6 = &v15[v16];
      a1[1] = v17;
      a1[2] = &v15[v16];
    }
  }
  *(_QWORD *)v6 = *a2;
  a1[2] += 8;
}

{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;

  v4 = (char *)a1[2];
  if (v4 == (char *)a1[3])
  {
    v5 = (char *)a1[1];
    v6 = (uint64_t)&v5[-*a1];
    if ((unint64_t)v5 <= *a1)
    {
      if (v4 == (char *)*a1)
        v16 = 1;
      else
        v16 = (uint64_t)&v4[-*a1] >> 2;
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<H11ANE::H11ANEFrameReceiverRequest **>>(a1[4], v16);
      v19 = &v17[8 * (v16 >> 2)];
      v20 = (uint64_t *)a1[1];
      v4 = v19;
      v21 = a1[2] - (_QWORD)v20;
      if (v21)
      {
        v4 = &v19[v21 & 0xFFFFFFFFFFFFFFF8];
        v22 = 8 * (v21 >> 3);
        v23 = &v17[8 * (v16 >> 2)];
        do
        {
          v24 = *v20++;
          *(_QWORD *)v23 = v24;
          v23 += 8;
          v22 -= 8;
        }
        while (v22);
      }
      v25 = (char *)*a1;
      *a1 = v17;
      a1[1] = v19;
      a1[2] = v4;
      a1[3] = &v17[8 * v18];
      if (v25)
      {
        operator delete(v25);
        v4 = (char *)a1[2];
      }
    }
    else
    {
      v7 = v6 >> 3;
      v8 = v6 >> 3 < -1;
      v9 = (v6 >> 3) + 2;
      if (v8)
        v10 = v9;
      else
        v10 = v7 + 1;
      v11 = -(v10 >> 1);
      v12 = v10 >> 1;
      v13 = &v5[-8 * v12];
      v14 = v4 - v5;
      if (v4 != v5)
      {
        memmove(&v5[-8 * v12], v5, v4 - v5);
        v4 = (char *)a1[1];
      }
      v15 = &v4[8 * v11];
      v4 = &v13[v14];
      a1[1] = v15;
      a1[2] = &v13[v14];
    }
  }
  *(_QWORD *)v4 = *a2;
  a1[2] += 8;
}

void std::__split_buffer<H11ANE::H11ANEFrameReceiverRequest **>::push_front(uint64_t a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = a1 + 24;
    v7 = *(_BYTE **)(a1 + 24);
    v8 = *(_BYTE **)(a1 + 16);
    if (v8 >= v7)
    {
      if (v7 == v4)
        v12 = 1;
      else
        v12 = (v7 - v4) >> 2;
      v13 = 2 * v12;
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<H11ANE::H11ANEFrameReceiverRequest **>>(v6, v12);
      v5 = &v14[(v13 + 6) & 0xFFFFFFFFFFFFFFF8];
      v16 = *(uint64_t **)(a1 + 8);
      v17 = v5;
      v18 = *(_QWORD *)(a1 + 16) - (_QWORD)v16;
      if (v18)
      {
        v17 = &v5[v18 & 0xFFFFFFFFFFFFFFF8];
        v19 = 8 * (v18 >> 3);
        v20 = v5;
        do
        {
          v21 = *v16++;
          *(_QWORD *)v20 = v21;
          v20 += 8;
          v19 -= 8;
        }
        while (v19);
      }
      v22 = *(char **)a1;
      *(_QWORD *)a1 = v14;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v17;
      *(_QWORD *)(a1 + 24) = &v14[8 * v15];
      if (v22)
      {
        operator delete(v22);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v9 = (v7 - v8) >> 3;
      if (v9 >= -1)
        v10 = v9 + 1;
      else
        v10 = v9 + 2;
      v11 = v10 >> 1;
      v5 = &v4[8 * (v10 >> 1)];
      if (v8 != v4)
      {
        memmove(&v4[8 * (v10 >> 1)], v4, v8 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v11];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

{
  char *v4;
  char *v5;
  _BYTE *v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;

  v4 = *(char **)(a1 + 8);
  if (v4 == *(char **)a1)
  {
    v6 = *(_BYTE **)(a1 + 16);
    v7 = *(_BYTE **)(a1 + 24);
    if (v6 >= v7)
    {
      if (v7 == v4)
        v11 = 1;
      else
        v11 = (v7 - v4) >> 2;
      v12 = 2 * v11;
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<H11ANE::H11ANEFrameReceiverRequest **>>(*(_QWORD *)(a1 + 32), v11);
      v5 = &v13[(v12 + 6) & 0xFFFFFFFFFFFFFFF8];
      v15 = *(uint64_t **)(a1 + 8);
      v16 = v5;
      v17 = *(_QWORD *)(a1 + 16) - (_QWORD)v15;
      if (v17)
      {
        v16 = &v5[v17 & 0xFFFFFFFFFFFFFFF8];
        v18 = 8 * (v17 >> 3);
        v19 = v5;
        do
        {
          v20 = *v15++;
          *(_QWORD *)v19 = v20;
          v19 += 8;
          v18 -= 8;
        }
        while (v18);
      }
      v21 = *(char **)a1;
      *(_QWORD *)a1 = v13;
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = v16;
      *(_QWORD *)(a1 + 24) = &v13[8 * v14];
      if (v21)
      {
        operator delete(v21);
        v5 = *(char **)(a1 + 8);
      }
    }
    else
    {
      v8 = (v7 - v6) >> 3;
      if (v8 >= -1)
        v9 = v8 + 1;
      else
        v9 = v8 + 2;
      v10 = v9 >> 1;
      v5 = &v4[8 * (v9 >> 1)];
      if (v6 != v4)
      {
        memmove(&v4[8 * (v9 >> 1)], v4, v6 - v4);
        v4 = *(char **)(a1 + 16);
      }
      *(_QWORD *)(a1 + 8) = v5;
      *(_QWORD *)(a1 + 16) = &v4[8 * v10];
    }
  }
  else
  {
    v5 = *(char **)(a1 + 8);
  }
  *((_QWORD *)v5 - 1) = *a2;
  *(_QWORD *)(a1 + 8) -= 8;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x24BEDB748], MEMORY[0x24BEDABB8]);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<H11ANE::H11ANEFrameReceiverRequest **>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

_QWORD *std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>::operator+[abi:ne180100](uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v4;

  result = *(_QWORD **)a1;
  if (a2)
  {
    v4 = a2 + ((uint64_t)(*(_QWORD *)(a1 + 8) - *result) >> 3);
    if (v4 < 1)
      result -= (unint64_t)(511 - v4) >> 9;
    else
      result += (unint64_t)v4 >> 9;
  }
  return result;
}

uint64_t std::deque<H11ANE::H11ANEFrameReceiverRequest *>::__maybe_remove_front_spare[abi:ne180100](uint64_t a1, int a2)
{
  unint64_t v2;
  int v4;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2 < 0x200)
    a2 = 1;
  if (v2 < 0x400)
    v4 = a2;
  else
    v4 = 0;
  if ((v4 & 1) == 0)
  {
    operator delete(**(void ***)(a1 + 8));
    *(_QWORD *)(a1 + 8) += 8;
    *(_QWORD *)(a1 + 32) -= 512;
  }
  return v4 ^ 1u;
}

uint64_t std::deque<H11ANE::H11ANEFrameReceiverRequest *>::__maybe_remove_back_spare[abi:ne180100](_QWORD *a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  int v7;

  v3 = a1[1];
  v2 = a1[2];
  if (v2 == v3)
    v4 = 0;
  else
    v4 = ((v2 - v3) << 6) - 1;
  v5 = v4 - (a1[5] + a1[4]);
  if (v5 < 0x200)
    a2 = 1;
  if (v5 < 0x400)
    v7 = a2;
  else
    v7 = 0;
  if ((v7 & 1) == 0)
  {
    operator delete(*(void **)(v2 - 8));
    a1[2] -= 8;
  }
  return v7 ^ 1u;
}

__n128 std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,0>@<Q0>(char **a1@<X1>, char *a2@<X2>, char **a3@<X3>, char *a4@<X4>, _QWORD *a5@<X5>, char *a6@<X6>, __n128 *a7@<X8>)
{
  char *v12;
  char **v13;
  char *v14;
  _QWORD *v15;
  char *v16;
  char *v17;
  char *v18;
  char *v19;
  __n128 result;
  uint64_t v21;
  __n128 v22;

  if (a1 == a3)
  {
    v19 = a2;
    v18 = a4;
    v15 = a5;
    v16 = a6;
  }
  else
  {
    v13 = a3 - 1;
    v12 = *a3;
    v14 = a4;
    v15 = a5;
    v16 = a6;
    while (1)
    {
      std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<H11ANE::H11ANEFrameReceiverRequest **,std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,0>(v12, v14, v15, v16, &v21);
      v16 = (char *)v22.n128_u64[1];
      v15 = (_QWORD *)v22.n128_u64[0];
      if (v13 == a1)
        break;
      v17 = *v13--;
      v12 = v17;
      v14 = v17 + 4096;
    }
    v18 = *a1 + 4096;
    v19 = a2;
  }
  std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<H11ANE::H11ANEFrameReceiverRequest **,std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,0>(v19, v18, v15, v16, &v21);
  result = v22;
  a7->n128_u64[0] = (unint64_t)a3;
  a7->n128_u64[1] = (unint64_t)a4;
  a7[1] = result;
  return result;
}

void *std::__move_backward_loop<std::_ClassicAlgPolicy>::operator()[abi:ne180100]<H11ANE::H11ANEFrameReceiverRequest **,std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,0>@<X0>(char *a1@<X1>, char *a2@<X2>, _QWORD *a3@<X3>, char *a4@<X4>, _QWORD *a5@<X8>)
{
  _QWORD *v6;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void *result;
  uint64_t v15;
  char *v16;

  v6 = a3;
  if (a1 == a2)
  {
    v9 = a1;
  }
  else
  {
    v9 = a2;
    v10 = *a3;
    v11 = a2;
    while (1)
    {
      v12 = (uint64_t)&a4[-v10];
      if ((v11 - a1) >> 3 >= v12 >> 3)
        v13 = v12 >> 3;
      else
        v13 = (v11 - a1) >> 3;
      v11 -= 8 * v13;
      a4 -= 8 * v13;
      if (v13)
        result = memmove(a4, v11, 8 * v13);
      if (v11 == a1)
        break;
      v15 = *--v6;
      v10 = v15;
      a4 = (char *)(v15 + 4096);
    }
    if ((char *)(*v6 + 4096) == a4)
    {
      v16 = (char *)v6[1];
      ++v6;
      a4 = v16;
    }
  }
  *a5 = v9;
  a5[1] = v6;
  a5[2] = a4;
  return result;
}

double std::__for_each_segment[abi:ne180100]<std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,std::__move_loop<std::_ClassicAlgPolicy>::_MoveSegment<std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>>>(char **a1, char *__src, char **a3, char *a4, uint64_t a5)
{
  char **v8;
  char *v9;
  char *v10;
  void **v11;
  char *v12;
  double result;
  char *v14;
  __int128 v15;

  if (a1 == a3)
  {
    v11 = *(void ***)a5;
    v12 = *(char **)(a5 + 8);
    v10 = __src;
  }
  else
  {
    v8 = a1 + 1;
    std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest **,std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,0>(__src, *(char **)(a5 + 8), *a1 + 4096, *(void ***)a5, &v14);
    for (*(_OWORD *)a5 = v15; v8 != a3; *(_OWORD *)a5 = v15)
    {
      v9 = *v8++;
      std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest **,std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,0>(v9, *(char **)(a5 + 8), v9 + 4096, *(void ***)a5, &v14);
    }
    v10 = *a3;
    v11 = *(void ***)a5;
    v12 = *(char **)(a5 + 8);
  }
  std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest **,std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,0>(v10, v12, a4, v11, &v14);
  result = *(double *)&v15;
  *(_OWORD *)a5 = v15;
  return result;
}

char *std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest **,std::__deque_iterator<H11ANE::H11ANEFrameReceiverRequest *,H11ANE::H11ANEFrameReceiverRequest **,H11ANE::H11ANEFrameReceiverRequest *&,H11ANE::H11ANEFrameReceiverRequest ***,long,512l>,0>@<X0>(char *__src@<X0>, char *__dst@<X3>, char *a3@<X1>, void **a4@<X2>, char **a5@<X8>)
{
  void **v6;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;

  v6 = a4;
  if (__src != a3)
  {
    v9 = __src;
    v6 = a4 + 1;
    v10 = (char *)*a4;
    while (1)
    {
      v11 = v10 - __dst + 4096;
      v12 = (a3 - v9) >> 3 >= v11 >> 3 ? v11 >> 3 : (a3 - v9) >> 3;
      if (v12)
        __src = (char *)memmove(__dst, v9, 8 * v12);
      v9 += 8 * v12;
      if (v9 == a3)
        break;
      v13 = (char *)*v6++;
      v10 = v13;
      __dst = v13;
    }
    __dst += 8 * v12;
    if ((char *)*(v6 - 1) + 4096 == __dst)
      __dst = (char *)*v6;
    else
      --v6;
  }
  *a5 = a3;
  a5[1] = (char *)v6;
  a5[2] = __dst;
  return __src;
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t H11ANE::H11ANEFrameReceiverBufferPool::H11ANEFrameReceiverBufferPool(uint64_t a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, char a9, int a10, int a11, int a12, uint64_t a13, int a14)
{
  const void *v15;
  const __CFAllocator *v16;
  CFMutableDictionaryRef Mutable;
  CFNumberRef v18;

  *(_DWORD *)a1 = a2;
  *(_DWORD *)(a1 + 4) = a3;
  *(_DWORD *)(a1 + 8) = a4;
  *(_DWORD *)(a1 + 12) = a5;
  *(_DWORD *)(a1 + 16) = a6;
  *(_DWORD *)(a1 + 20) = a7;
  *(_DWORD *)(a1 + 24) = a8;
  *(_BYTE *)(a1 + 28) = a9;
  *(_DWORD *)(a1 + 32) = a10;
  *(_DWORD *)(a1 + 36) = a11;
  *(_DWORD *)(a1 + 40) = a12;
  v15 = (const void *)(a1 + 40);
  *(_QWORD *)(a1 + 44) = a13;
  *(_DWORD *)(a1 + 52) = a14;
  *(_DWORD *)(a1 + 56) = 0;
  *(_DWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  v16 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  *(_QWORD *)(a1 + 72) = Mutable;
  if (Mutable)
  {
    v18 = CFNumberCreate(v16, kCFNumberSInt32Type, v15);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 72), (const void *)*MEMORY[0x24BDC56D8], v18);
    CFRelease(v18);
  }
  *(_QWORD *)(a1 + 80) = operator new[]();
  return a1;
}

{
  return H11ANE::H11ANEFrameReceiverBufferPool::H11ANEFrameReceiverBufferPool(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

void H11ANE::H11ANEFrameReceiverBufferPool::~H11ANEFrameReceiverBufferPool(H11ANE::H11ANEFrameReceiverBufferPool *this)
{
  __CVPixelBufferPool *v2;
  const void *v3;
  uint64_t v4;

  v2 = (__CVPixelBufferPool *)*((_QWORD *)this + 8);
  if (v2)
    CVPixelBufferPoolRelease(v2);
  v3 = (const void *)*((_QWORD *)this + 9);
  if (v3)
    CFRelease(v3);
  v4 = *((_QWORD *)this + 10);
  if (v4)
    MEMORY[0x20BD010C4](v4, 0x1000C8052888210);
}

uint64_t H11ANE::H11ANEFrameReceiverBufferPool::activatePool(H11ANE::H11ANEFrameReceiverBufferPool *this)
{
  uint64_t v1;
  CFMutableDictionaryRef v3;
  __int16 v5;

  v1 = 3758097084;
  if (*((_QWORD *)this + 8))
    return 3758097122;
  v3 = H11ANE::H11ANECreateCVBufferPool(*((_DWORD *)this + 2), *((_DWORD *)this + 3), *((_DWORD *)this + 4), *((_DWORD *)this + 5), *((_DWORD *)this + 6), *((unsigned int *)this + 10), *((unsigned __int8 *)this + 28), *((_DWORD *)this + 8), *((_DWORD *)this + 9), *((_DWORD *)this + 11), *(_DWORD *)this < 2u, v5, *((_DWORD *)this + 13));
  *((_QWORD *)this + 8) = v3;
  if (v3)
  {
    CVPixelBufferPoolScanIOSurfaces();
    CVPixelBufferPoolPreAllocate();
    return 0;
  }
  return v1;
}

uint64_t H11ANE::MyCVPixelBufferPoolScanIOSurfacesCallback(H11ANE *this, __IOSurface *a2, H11ANE::H11ANEFrameReceiverBufferPool *a3)
{
  if (this && a2)
  {
    if (*((_DWORD *)a2 + 22) >= *((_DWORD *)a2 + 10))
      printf("%s: ERROR: all surfaceIds are populated\n", "void *H11ANE::MyCVPixelBufferPoolScanIOSurfacesCallback(IOSurfaceRef, H11ANEFrameReceiverBufferPool *)");
    else
      *(_DWORD *)(*((_QWORD *)a2 + 10) + 4 * (*((_DWORD *)a2 + 22))++) = IOSurfaceGetID(this);
  }
  return 0;
}

uint64_t H11ANE::H11ANEFrameReceiverBufferPool::deactivatePool(H11ANE::H11ANEFrameReceiverBufferPool *this)
{
  __CVPixelBufferPool *v2;
  uint64_t result;

  v2 = (__CVPixelBufferPool *)*((_QWORD *)this + 8);
  if (!v2)
    return 3758097122;
  CVPixelBufferPoolRelease(v2);
  result = 0;
  *((_QWORD *)this + 8) = 0;
  return result;
}

uint64_t H11ANE::H11ANEFrameReceiverBufferPool::allocateBuffer(H11ANE::H11ANEFrameReceiverBufferPool *this, __CVBuffer **a2)
{
  uint64_t v2;
  __CVPixelBufferPool *v5;
  CFAllocatorRef *v6;
  CFNumberRef v7;
  CVPixelBufferRef pixelBufferOut;

  v2 = 3758097085;
  if (!a2)
    return 3758097090;
  *a2 = 0;
  pixelBufferOut = 0;
  v5 = (__CVPixelBufferPool *)*((_QWORD *)this + 8);
  if (!v5)
    return 3758097086;
  v6 = (CFAllocatorRef *)MEMORY[0x24BDBD240];
  if (*((_BYTE *)this + 60))
  {
    if (*((_QWORD *)this + 9))
    {
      v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, (char *)this + 40);
      CFDictionarySetValue(*((CFMutableDictionaryRef *)this + 9), (const void *)*MEMORY[0x24BDC56D8], v7);
      CFRelease(v7);
      v5 = (__CVPixelBufferPool *)*((_QWORD *)this + 8);
    }
    *((_BYTE *)this + 60) = 0;
  }
  CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(*v6, v5, *((CFDictionaryRef *)this + 9), &pixelBufferOut);
  if (pixelBufferOut)
  {
    v2 = 0;
    *a2 = pixelBufferOut;
  }
  return v2;
}

uint64_t H11ANE::H11ANEFrameReceiverBufferPool::ModifyBufferCount(H11ANE::H11ANEFrameReceiverBufferPool *this, int a2)
{
  uint64_t v3;
  int v4;

  v3 = 3758097085;
  if (!*((_QWORD *)this + 8))
    return 3758097086;
  if (!a2)
    return 0;
  v4 = *((_DWORD *)this + 10) + a2;
  if (!v4)
    return 3758097090;
  if (!CVPixelBufferPoolSetMinBufferCount())
  {
    v3 = 0;
    *((_DWORD *)this + 10) = v4;
    *((_BYTE *)this + 60) = 1;
  }
  return v3;
}

uint64_t ZinIrCompilerParamsUtils::PerfTracerCategoryToString@<X0>(int a1@<W0>, std::string *a2@<X8>)
{
  uint64_t *v4;
  int v5;
  std::string __p;
  int v8;
  _BYTE v9[16];
  uint64_t *v10;

  GetStringToPerfTracerCategoryMap((uint64_t)v9);
  v4 = v10;
  if (v10)
  {
    while (1)
    {
      if (*((char *)v4 + 39) < 0)
        std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)v4[2], v4[3]);
      else
        __p = *(std::string *)(v4 + 2);
      v8 = *((_DWORD *)v4 + 10);
      if (v8 == a1)
        break;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      v4 = (uint64_t *)*v4;
      if (!v4)
        goto LABEL_9;
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(a2, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      v5 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
      a2[1].__r_.__value_.__s.__data_[0] = 1;
      if (v5 < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    else
    {
      *a2 = __p;
      a2[1].__r_.__value_.__s.__data_[0] = 1;
    }
  }
  else
  {
LABEL_9:
    a2->__r_.__value_.__s.__data_[0] = 0;
    a2[1].__r_.__value_.__s.__data_[0] = 0;
  }
  return std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)v9);
}

void sub_207C500D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, char a17)
{
  if (a14 < 0)
    operator delete(__p);
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)&a17);
  _Unwind_Resume(a1);
}

void GetStringToPerfTracerCategoryMap(uint64_t a1@<X8>)
{
  uint64_t v2;
  unsigned __int8 v3[24];
  int v4;
  _QWORD v5[3];
  int v6;
  _QWORD v7[3];
  int v8;
  _QWORD v9[3];
  int v10;
  _QWORD v11[3];
  int v12;
  _QWORD v13[3];
  int v14;
  _QWORD v15[3];
  int v16;
  _QWORD v17[3];
  int v18;
  _QWORD v19[3];
  int v20;
  _QWORD v21[3];
  int v22;
  _QWORD v23[3];
  int v24;
  _QWORD v25[3];
  int v26;
  _QWORD v27[3];
  int v28;
  _QWORD v29[3];
  int v30;
  _QWORD v31[3];
  int v32;
  _QWORD v33[3];
  int v34;
  _QWORD v35[3];
  int v36;
  _QWORD v37[3];
  int v38;
  _QWORD v39[3];
  int v40;
  _QWORD v41[3];
  int v42;
  _QWORD v43[3];
  int v44;
  _QWORD v45[3];
  int v46;
  _QWORD v47[3];
  int v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  std::string::basic_string[abi:ne180100]<0>(v3, "none");
  v4 = 0;
  std::string::basic_string[abi:ne180100]<0>(v5, "l2");
  v6 = 1;
  std::string::basic_string[abi:ne180100]<0>(v7, "dma_read");
  v8 = 2;
  std::string::basic_string[abi:ne180100]<0>(v9, "dma_write");
  v10 = 3;
  std::string::basic_string[abi:ne180100]<0>(v11, "kernel_read");
  v12 = 4;
  std::string::basic_string[abi:ne180100]<0>(v13, "pe");
  v14 = 5;
  std::string::basic_string[abi:ne180100]<0>(v15, "ne_all");
  v16 = 6;
  std::string::basic_string[abi:ne180100]<0>(v17, "ne_0");
  v18 = 7;
  std::string::basic_string[abi:ne180100]<0>(v19, "ne_1");
  v20 = 8;
  std::string::basic_string[abi:ne180100]<0>(v21, "ne_2");
  v22 = 9;
  std::string::basic_string[abi:ne180100]<0>(v23, "ne_3");
  v24 = 10;
  std::string::basic_string[abi:ne180100]<0>(v25, "ne_4");
  v26 = 11;
  std::string::basic_string[abi:ne180100]<0>(v27, "ne_5");
  v28 = 12;
  std::string::basic_string[abi:ne180100]<0>(v29, "ne_6");
  v30 = 13;
  std::string::basic_string[abi:ne180100]<0>(v31, "ne_7");
  v32 = 14;
  std::string::basic_string[abi:ne180100]<0>(v33, "ne_8");
  v34 = 15;
  std::string::basic_string[abi:ne180100]<0>(v35, "ne_9");
  v36 = 16;
  std::string::basic_string[abi:ne180100]<0>(v37, "ne_10");
  v38 = 17;
  std::string::basic_string[abi:ne180100]<0>(v39, "ne_11");
  v40 = 18;
  std::string::basic_string[abi:ne180100]<0>(v41, "ne_12");
  v42 = 19;
  std::string::basic_string[abi:ne180100]<0>(v43, "ne_13");
  v44 = 20;
  std::string::basic_string[abi:ne180100]<0>(v45, "ne_14");
  v46 = 21;
  std::string::basic_string[abi:ne180100]<0>(v47, "ne_15");
  v48 = 22;
  std::unordered_map<std::string,PerfTracerCategory>::unordered_map(a1, v3, 23);
  v2 = 736;
  do
  {
    if ((char)v3[v2 - 9] < 0)
      operator delete(*(void **)&v3[v2 - 32]);
    v2 -= 32;
  }
  while (v2);
}

void sub_207C50438(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  uint64_t v10;
  uint64_t v12;

  v12 = 736;
  while (1)
  {
    if (*(char *)(v10 + v12 - 9) < 0)
      operator delete(*(void **)(v10 + v12 - 32));
    v12 -= 32;
    if (!v12)
      _Unwind_Resume(exception_object);
  }
}

void sub_207C504E0()
{
  JUMPOUT(0x207C504D8);
}

uint64_t ZinIrCompilerParamsUtils::PerfTracerMetricToString@<X0>(int a1@<W0>, std::string *a2@<X8>)
{
  uint64_t *v4;
  int v5;
  std::string __p;
  int v8;
  _BYTE v9[16];
  uint64_t *v10;

  GetStringToPerfTracerMetricMap((uint64_t)v9);
  v4 = v10;
  if (v10)
  {
    while (1)
    {
      if (*((char *)v4 + 39) < 0)
        std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)v4[2], v4[3]);
      else
        __p = *(std::string *)(v4 + 2);
      v8 = *((_DWORD *)v4 + 10);
      if (v8 == a1)
        break;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      v4 = (uint64_t *)*v4;
      if (!v4)
        goto LABEL_9;
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(a2, __p.__r_.__value_.__l.__data_, __p.__r_.__value_.__l.__size_);
      v5 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
      a2[1].__r_.__value_.__s.__data_[0] = 1;
      if (v5 < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    else
    {
      *a2 = __p;
      a2[1].__r_.__value_.__s.__data_[0] = 1;
    }
  }
  else
  {
LABEL_9:
    a2->__r_.__value_.__s.__data_[0] = 0;
    a2[1].__r_.__value_.__s.__data_[0] = 0;
  }
  return std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)v9);
}

void sub_207C505D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, char a17)
{
  if (a14 < 0)
    operator delete(__p);
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)&a17);
  _Unwind_Resume(a1);
}

void GetStringToPerfTracerMetricMap(uint64_t a1@<X8>)
{
  uint64_t v2;
  unsigned __int8 v3[24];
  int v4;
  _QWORD v5[3];
  int v6;
  _QWORD v7[3];
  int v8;
  _QWORD v9[3];
  int v10;
  _QWORD v11[3];
  int v12;
  _QWORD v13[3];
  int v14;
  _QWORD v15[3];
  int v16;
  _QWORD v17[3];
  int v18;
  _QWORD v19[3];
  int v20;
  _QWORD v21[3];
  int v22;
  _QWORD v23[3];
  int v24;
  _QWORD v25[3];
  int v26;
  _QWORD v27[3];
  int v28;
  _QWORD v29[3];
  int v30;
  _QWORD v31[3];
  int v32;
  _QWORD v33[3];
  int v34;
  _QWORD v35[3];
  int v36;
  _QWORD v37[3];
  int v38;
  _QWORD v39[3];
  int v40;
  _QWORD v41[3];
  int v42;
  _QWORD v43[3];
  int v44;
  _QWORD v45[3];
  int v46;
  _QWORD v47[3];
  int v48;
  _QWORD v49[3];
  int v50;
  _QWORD v51[3];
  int v52;
  _QWORD v53[3];
  int v54;
  _QWORD v55[3];
  int v56;
  _QWORD v57[3];
  int v58;
  _QWORD v59[3];
  int v60;
  _QWORD v61[3];
  int v62;
  _QWORD v63[3];
  int v64;
  _QWORD v65[3];
  int v66;
  _QWORD v67[3];
  int v68;
  _QWORD v69[3];
  int v70;
  _QWORD v71[3];
  int v72;
  _QWORD v73[3];
  int v74;
  _QWORD v75[3];
  int v76;
  _QWORD v77[3];
  int v78;
  _QWORD v79[3];
  int v80;
  _QWORD v81[3];
  int v82;
  _QWORD v83[3];
  int v84;
  _QWORD v85[3];
  int v86;
  _QWORD v87[3];
  int v88;
  _QWORD v89[3];
  int v90;
  _QWORD v91[3];
  int v92;
  _QWORD v93[3];
  int v94;
  _QWORD v95[3];
  int v96;
  _QWORD v97[3];
  int v98;
  _QWORD v99[3];
  int v100;
  _QWORD v101[3];
  int v102;
  _QWORD v103[3];
  int v104;
  _QWORD v105[3];
  int v106;
  _QWORD v107[3];
  int v108;
  _QWORD v109[3];
  int v110;
  _QWORD v111[3];
  int v112;
  _QWORD v113[3];
  int v114;
  _QWORD v115[3];
  int v116;
  _QWORD v117[3];
  int v118;
  _QWORD v119[3];
  int v120;
  _QWORD v121[3];
  int v122;
  _QWORD v123[3];
  int v124;
  _QWORD v125[3];
  int v126;
  _QWORD v127[3];
  int v128;
  _QWORD v129[3];
  int v130;
  _QWORD v131[3];
  int v132;
  _QWORD v133[3];
  int v134;
  _QWORD v135[3];
  int v136;
  _QWORD v137[3];
  int v138;
  uint64_t v139;

  v139 = *MEMORY[0x24BDAC8D0];
  std::string::basic_string[abi:ne180100]<0>(v3, "none");
  v4 = 0;
  std::string::basic_string[abi:ne180100]<0>(v5, "l2_cycle");
  v6 = 1;
  std::string::basic_string[abi:ne180100]<0>(v7, "l2_src1_read_active_cycle");
  v8 = 2;
  std::string::basic_string[abi:ne180100]<0>(v9, "l2_src1_read_idle_cycle");
  v10 = 3;
  std::string::basic_string[abi:ne180100]<0>(v11, "l2_src2_read_active_cycle");
  v12 = 4;
  std::string::basic_string[abi:ne180100]<0>(v13, "l2_src2_read_idle_cycle");
  v14 = 5;
  std::string::basic_string[abi:ne180100]<0>(v15, "l2_write_active_cycle");
  v16 = 6;
  std::string::basic_string[abi:ne180100]<0>(v17, "l2_write_idle_cycle");
  v18 = 7;
  std::string::basic_string[abi:ne180100]<0>(v19, "l2_read_conflict_cycle");
  v20 = 8;
  std::string::basic_string[abi:ne180100]<0>(v21, "l2_read_intra_conflict_cycle");
  v22 = 9;
  std::string::basic_string[abi:ne180100]<0>(v23, "l2_read_conflict_count");
  v24 = 10;
  std::string::basic_string[abi:ne180100]<0>(v25, "l2_read_intra_conflict_count");
  v26 = 11;
  std::string::basic_string[abi:ne180100]<0>(v27, "l2_write_conflict_cycle");
  v28 = 12;
  std::string::basic_string[abi:ne180100]<0>(v29, "l2_write_intra_conflict_cycle");
  v30 = 13;
  std::string::basic_string[abi:ne180100]<0>(v31, "l2_write_conflict_count");
  v32 = 14;
  std::string::basic_string[abi:ne180100]<0>(v33, "l2_write_intra_conflict_count");
  v34 = 15;
  std::string::basic_string[abi:ne180100]<0>(v35, "dma_src1_read_active_cycle");
  v36 = 16;
  std::string::basic_string[abi:ne180100]<0>(v37, "dma_src1_read_idle_cycle");
  v38 = 17;
  std::string::basic_string[abi:ne180100]<0>(v39, "dma_src1_read_conflict_cycle");
  v40 = 18;
  std::string::basic_string[abi:ne180100]<0>(v41, "dma_src1_read_intra_conflict_cycle");
  v42 = 19;
  std::string::basic_string[abi:ne180100]<0>(v43, "dma_src1_read_conflict_count");
  v44 = 20;
  std::string::basic_string[abi:ne180100]<0>(v45, "dma_src1_read_intra_conflict_count");
  v46 = 21;
  std::string::basic_string[abi:ne180100]<0>(v47, "dma_src2_read_active_cycle");
  v48 = 22;
  std::string::basic_string[abi:ne180100]<0>(v49, "dma_src2_read_idle_cycle");
  v50 = 23;
  std::string::basic_string[abi:ne180100]<0>(v51, "dma_src2_read_conflict_cycle");
  v52 = 24;
  std::string::basic_string[abi:ne180100]<0>(v53, "dma_src2_read_intra_conflict_cycle");
  v54 = 25;
  std::string::basic_string[abi:ne180100]<0>(v55, "dma_src2_read_conflict_count");
  v56 = 26;
  std::string::basic_string[abi:ne180100]<0>(v57, "dma_src2_read_intra_conflict_count");
  v58 = 27;
  std::string::basic_string[abi:ne180100]<0>(v59, "dma_write_active_cycle");
  v60 = 28;
  std::string::basic_string[abi:ne180100]<0>(v61, "dma_write_idle_cycle");
  v62 = 29;
  std::string::basic_string[abi:ne180100]<0>(v63, "dma_write_conflict_cycle");
  v64 = 30;
  std::string::basic_string[abi:ne180100]<0>(v65, "dma_write_intra_conflict_cycle");
  v66 = 31;
  std::string::basic_string[abi:ne180100]<0>(v67, "dma_write_conflict_count");
  v68 = 32;
  std::string::basic_string[abi:ne180100]<0>(v69, "dma_write_intra_conflict_count");
  v70 = 33;
  std::string::basic_string[abi:ne180100]<0>(v71, "idle_cycle");
  v72 = 34;
  std::string::basic_string[abi:ne180100]<0>(v73, "active_cycle");
  v74 = 35;
  std::string::basic_string[abi:ne180100]<0>(v75, "beat_count_in_64B");
  v76 = 36;
  std::string::basic_string[abi:ne180100]<0>(v77, "transaction_count");
  v78 = 37;
  std::string::basic_string[abi:ne180100]<0>(v79, "latency_product");
  v80 = 38;
  std::string::basic_string[abi:ne180100]<0>(v81, "latency_threshold");
  v82 = 39;
  std::string::basic_string[abi:ne180100]<0>(v83, "fabric_stall");
  v84 = 40;
  std::string::basic_string[abi:ne180100]<0>(v85, "mcache_hit_no_dealloc");
  v86 = 41;
  std::string::basic_string[abi:ne180100]<0>(v87, "mcache_non_coh_agent");
  v88 = 43;
  std::string::basic_string[abi:ne180100]<0>(v89, "mcache_coh_agent");
  v90 = 44;
  std::string::basic_string[abi:ne180100]<0>(v91, "mcache_miss_alloc");
  v92 = 42;
  std::string::basic_string[abi:ne180100]<0>(v93, "mcache_miss_no_alloc");
  v94 = 45;
  std::string::basic_string[abi:ne180100]<0>(v95, "mcache_hit_depri");
  v96 = 46;
  std::string::basic_string[abi:ne180100]<0>(v97, "mcache_hit_drop");
  v98 = 47;
  std::string::basic_string[abi:ne180100]<0>(v99, "mcache_hit_no_alloc");
  v100 = 48;
  std::string::basic_string[abi:ne180100]<0>(v101, "l2_stall");
  v102 = 49;
  std::string::basic_string[abi:ne180100]<0>(v103, "tex_filter_cache_miss");
  v104 = 50;
  std::string::basic_string[abi:ne180100]<0>(v105, "tex_filter_cache_total");
  v106 = 51;
  std::string::basic_string[abi:ne180100]<0>(v107, "tex_index_cache_miss");
  v108 = 52;
  std::string::basic_string[abi:ne180100]<0>(v109, "tex_index_cache_total");
  v110 = 53;
  std::string::basic_string[abi:ne180100]<0>(v111, "decomp_metadata_cache_miss");
  v112 = 54;
  std::string::basic_string[abi:ne180100]<0>(v113, "decomp_metadata_cache_hit");
  v114 = 55;
  std::string::basic_string[abi:ne180100]<0>(v115, "decomp_data_cache_miss");
  v116 = 56;
  std::string::basic_string[abi:ne180100]<0>(v117, "decomp_data_cache_hit");
  v118 = 57;
  std::string::basic_string[abi:ne180100]<0>(v119, "ne_stall");
  v120 = 58;
  std::string::basic_string[abi:ne180100]<0>(v121, "kernel_cache_miss");
  v122 = 59;
  std::string::basic_string[abi:ne180100]<0>(v123, "ne_cycle");
  v124 = 60;
  std::string::basic_string[abi:ne180100]<0>(v125, "mac_cycle");
  v126 = 61;
  std::string::basic_string[abi:ne180100]<0>(v127, "nz_count");
  v128 = 62;
  std::string::basic_string[abi:ne180100]<0>(v129, "kernel_stall");
  v130 = 63;
  std::string::basic_string[abi:ne180100]<0>(v131, "acc_stall");
  v132 = 64;
  std::string::basic_string[abi:ne180100]<0>(v133, "pe_cycle");
  v134 = 65;
  std::string::basic_string[abi:ne180100]<0>(v135, "read_stall");
  v136 = 66;
  std::string::basic_string[abi:ne180100]<0>(v137, "write_stall");
  v138 = 67;
  std::unordered_map<std::string,PerfTracerMetric>::unordered_map(a1, v3, 68);
  v2 = 2176;
  do
  {
    if ((char)v3[v2 - 9] < 0)
      operator delete(*(void **)&v3[v2 - 32]);
    v2 -= 32;
  }
  while (v2);
}

void sub_207C50E7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10)
{
  uint64_t v10;
  uint64_t v12;

  v12 = 2176;
  while (1)
  {
    if (*(char *)(v10 + v12 - 9) < 0)
      operator delete(*(void **)(v10 + v12 - 32));
    v12 -= 32;
    if (!v12)
      _Unwind_Resume(exception_object);
  }
}

void sub_207C50FD8()
{
  JUMPOUT(0x207C50FD0);
}

uint64_t ZinIrCompilerParamsUtils::StringToPerfTracerConfig(uint64_t a1, _DWORD *a2)
{
  char v3;
  int64_t size;
  std::string *p_str;
  _BYTE *v6;
  std::string *v7;
  _BYTE *v8;
  uint64_t v9;
  std::string::size_type v11;
  uint64_t v12;
  std::string::size_type v13;
  std::string *v14;
  int64_t v15;
  _BYTE *v16;
  std::string *v17;
  _BYTE *v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  std::string::size_type v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BOOL8 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _BOOL8 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  std::string __p;
  std::string v48;
  std::string __str;
  char v50;

  if (*(char *)(a1 + 23) < 0)
    std::string::__init_copy_ctor_external(&__str, *(const std::string::value_type **)a1, *(_QWORD *)(a1 + 8));
  else
    __str = *(std::string *)a1;
  v3 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
  else
    size = __str.__r_.__value_.__l.__size_;
  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_str = &__str;
  else
    p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
  if (size >= 1)
  {
    v6 = (char *)p_str + size;
    v7 = p_str;
    while (1)
    {
      v8 = memchr(v7, 58, size);
      if (!v8)
        goto LABEL_15;
      if (*v8 == 58)
        break;
      v7 = (std::string *)(v8 + 1);
      size = v6 - (_BYTE *)v7;
      if (v6 - (_BYTE *)v7 < 1)
        goto LABEL_15;
    }
    v9 = 0;
    if (v8 == v6)
      goto LABEL_16;
    v11 = v8 - (_BYTE *)p_str;
    if (v11 == -1)
      goto LABEL_16;
    std::string::basic_string(&v48, &__str, 0, v11, (std::allocator<char> *)&__p);
    std::string::basic_string(&__p, &__str, 0, v11, (std::allocator<char> *)&v50);
    v9 = StringToPerfTracerCategory((unsigned __int8 *)&__p) & 0xFF00000000;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (v9)
    {
      v12 = StringToPerfTracerCategory((unsigned __int8 *)&v48);
      if ((v12 & 0xFF00000000) != 0)
      {
        *a2 = v12;
        v13 = v11 + 1;
        v14 = &__str;
        std::string::erase(&__str, 0, v13);
        if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v15 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
        else
          v15 = __str.__r_.__value_.__l.__size_;
        if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v14 = (std::string *)__str.__r_.__value_.__r.__words[0];
        if (v15 >= 1)
        {
          v16 = (char *)v14 + v15;
          v17 = v14;
          do
          {
            v18 = memchr(v17, 58, v15);
            if (!v18)
              break;
            if (*v18 == 58)
            {
              if (v18 == v16)
                break;
              v27 = v18 - (_BYTE *)v14;
              if (v27 == -1)
                break;
              std::string::basic_string(&__p, &__str, 0, v27, (std::allocator<char> *)&v50);
              v28 = StringToPerfTracerMetric((unsigned __int8 *)&__p);
              if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                operator delete(__p.__r_.__value_.__l.__data_);
              if ((v28 & 0xFF00000000) != 0)
              {
                a2[1] = v28;
                std::string::erase(&__str, 0, v27 + 1);
                v29 = StringToPerfTracerMetric((unsigned __int8 *)&__str);
                if ((v29 & 0xFF00000000) != 0)
                {
                  a2[2] = v29;
                  goto LABEL_47;
                }
                v39 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                if (v39)
                  ZinIrCompilerParamsUtils::StringToPerfTracerConfig(v39, v40, v41, v42, v43, v44, v45, v46);
                goto LABEL_50;
              }
              v31 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
              if (!v31)
                goto LABEL_50;
              goto LABEL_49;
            }
            v17 = (std::string *)(v18 + 1);
            v15 = v16 - (_BYTE *)v17;
          }
          while (v16 - (_BYTE *)v17 >= 1);
        }
        v30 = StringToPerfTracerMetric((unsigned __int8 *)&__str);
        if ((v30 & 0xFF00000000) != 0)
        {
          a2[1] = v30;
          a2[2] = 0;
LABEL_47:
          v9 = 1;
          goto LABEL_51;
        }
        v31 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v31)
LABEL_49:
          ZinIrCompilerParamsUtils::StringToPerfTracerConfig(v31, v32, v33, v34, v35, v36, v37, v38);
      }
      else
      {
        v19 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v19)
          ZinIrCompilerParamsUtils::StringToPerfTracerConfig(v19, v20, v21, v22, v23, v24, v25, v26);
      }
LABEL_50:
      v9 = 0;
    }
LABEL_51:
    if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v48.__r_.__value_.__l.__data_);
    v3 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
    goto LABEL_16;
  }
LABEL_15:
  v9 = 0;
LABEL_16:
  if (v3 < 0)
    operator delete(__str.__r_.__value_.__l.__data_);
  return v9;
}

void sub_207C512AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26)
{
  if (a20 < 0)
    operator delete(__p);
  if (a26 < 0)
    operator delete(a21);
  _Unwind_Resume(exception_object);
}

uint64_t StringToPerfTracerCategory(unsigned __int8 *a1)
{
  unsigned __int8 *v2;
  unsigned int v3;
  int v4;
  uint64_t v5;
  _QWORD v7[5];

  GetStringToPerfTracerCategoryMap((uint64_t)v7);
  v2 = std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::find<std::string>(v7, a1);
  if (v2)
  {
    v3 = *((_DWORD *)v2 + 10) & 0xFFFFFF00;
    v4 = *((_DWORD *)v2 + 10);
    v5 = 0x100000000;
  }
  else
  {
    v5 = 0;
    v4 = 0;
    v3 = 0;
  }
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)v7);
  return v5 | v3 | v4;
}

void sub_207C51384(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t StringToPerfTracerMetric(unsigned __int8 *a1)
{
  unsigned __int8 *v2;
  unsigned int v3;
  int v4;
  uint64_t v5;
  _QWORD v7[5];

  GetStringToPerfTracerMetricMap((uint64_t)v7);
  v2 = std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::find<std::string>(v7, a1);
  if (v2)
  {
    v3 = *((_DWORD *)v2 + 10) & 0xFFFFFF00;
    v4 = *((_DWORD *)v2 + 10);
    v5 = 0x100000000;
  }
  else
  {
    v5 = 0;
    v4 = 0;
    v3 = 0;
  }
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)v7);
  return v5 | v3 | v4;
}

void sub_207C5140C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

void ZinIrCompilerParamsUtils::PerfTracerConfigToString(int *a1@<X0>, std::string *a2@<X8>)
{
  std::string *v4;
  std::string::size_type size;
  std::string *v6;
  std::string::size_type v7;
  std::string *p_p;
  std::string::size_type v9;
  std::string __p;
  char v11;
  std::string v12;
  char v13;
  std::string v14;
  char v15;

  std::string::basic_string[abi:ne180100]<0>(a2, (char *)&unk_207C68123);
  ZinIrCompilerParamsUtils::PerfTracerCategoryToString(*a1, &v14);
  ZinIrCompilerParamsUtils::PerfTracerMetricToString(a1[1], &v12);
  ZinIrCompilerParamsUtils::PerfTracerMetricToString(a1[2], &__p);
  if ((v14.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v4 = &v14;
  else
    v4 = (std::string *)v14.__r_.__value_.__r.__words[0];
  if ((v14.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v14.__r_.__value_.__r.__words[2]);
  else
    size = v14.__r_.__value_.__l.__size_;
  std::string::append(a2, (const std::string::value_type *)v4, size);
  std::string::append(a2, ":", 1uLL);
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v6 = &v12;
  else
    v6 = (std::string *)v12.__r_.__value_.__r.__words[0];
  if ((v12.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v7 = HIBYTE(v12.__r_.__value_.__r.__words[2]);
  else
    v7 = v12.__r_.__value_.__l.__size_;
  std::string::append(a2, (const std::string::value_type *)v6, v7);
  std::string::append(a2, ":", 1uLL);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v9 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v9 = __p.__r_.__value_.__l.__size_;
  std::string::append(a2, (const std::string::value_type *)p_p, v9);
  if (v11 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v13 && SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
  if (v15)
  {
    if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v14.__r_.__value_.__l.__data_);
  }
}

void sub_207C51558(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22)
{
  uint64_t v22;
  uint64_t v23;

  if (a22 && a21 < 0)
    operator delete(__p);
  if (*(_BYTE *)(v23 - 24) && *(char *)(v23 - 25) < 0)
    operator delete(*(void **)(v23 - 48));
  if (*(char *)(v22 + 23) < 0)
    operator delete(*(void **)v22);
  _Unwind_Resume(exception_object);
}

uint64_t ZinIrCompilerParamsUtils::HasValidPerfTracerConfigs(int *a1, int *a2)
{
  uint64_t result;
  BOOL v5;

  result = IsValidPerfTracerConfig(a1);
  if ((_DWORD)result)
  {
    result = IsValidPerfTracerConfig(a2);
    if ((_DWORD)result)
    {
      if (*a1)
        v5 = *a1 == *a2;
      else
        v5 = 0;
      return !v5;
    }
  }
  return result;
}

uint64_t IsValidPerfTracerConfig(int *a1)
{
  int v1;
  int v3;
  BOOL v4;
  _BOOL8 v5;
  _DWORD *v6;
  _DWORD *v7;
  _DWORD *v9;
  _DWORD *v10;
  uint64_t v11;
  __int128 __src;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD v18[2];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  if (!*a1)
    return 1;
  v3 = a1[1];
  if (v3)
    v4 = v3 == a1[2];
  else
    v4 = 0;
  if (v4)
    return 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  switch(v1)
  {
    case 1:
      v19 = 0x2100000020;
      v16 = xmmword_207C67388;
      v17 = unk_207C67398;
      v18[0] = xmmword_207C673A8;
      v18[1] = unk_207C673B8;
      __src = xmmword_207C67348;
      v13 = unk_207C67358;
      v14 = xmmword_207C67368;
      v15 = unk_207C67378;
      std::vector<PerfTracerMetric>::__assign_with_size[abi:ne180100]<PerfTracerMetric const*,PerfTracerMetric const*>((char *)&v9, (char *)&__src, (uint64_t)&v20, 0x22uLL);
      break;
    case 2:
      LODWORD(v18[0]) = 57;
      v14 = xmmword_207C673F0;
      v15 = unk_207C67400;
      v16 = xmmword_207C67410;
      v17 = unk_207C67420;
      __src = xmmword_207C673D0;
      v13 = unk_207C673E0;
      std::vector<PerfTracerMetric>::__assign_with_size[abi:ne180100]<PerfTracerMetric const*,PerfTracerMetric const*>((char *)&v9, (char *)&__src, (uint64_t)v18 + 4, 0x19uLL);
      break;
    case 3:
      LODWORD(v16) = 49;
      __src = xmmword_207C67434;
      v13 = unk_207C67444;
      v14 = xmmword_207C67454;
      v15 = unk_207C67464;
      std::vector<PerfTracerMetric>::__assign_with_size[abi:ne180100]<PerfTracerMetric const*,PerfTracerMetric const*>((char *)&v9, (char *)&__src, (uint64_t)&v16 + 4, 0x11uLL);
      break;
    case 4:
      *(_QWORD *)&v16 = 0x3B0000003ALL;
      __src = xmmword_207C67478;
      v13 = unk_207C67488;
      v14 = xmmword_207C67498;
      v15 = unk_207C674A8;
      std::vector<PerfTracerMetric>::__assign_with_size[abi:ne180100]<PerfTracerMetric const*,PerfTracerMetric const*>((char *)&v9, (char *)&__src, (uint64_t)&v16 + 8, 0x12uLL);
      break;
    case 5:
      __src = xmmword_207C67330;
      std::vector<PerfTracerMetric>::__assign_with_size[abi:ne180100]<PerfTracerMetric const*,PerfTracerMetric const*>((char *)&v9, (char *)&__src, (uint64_t)&v13, 4uLL);
      break;
    default:
      __src = xmmword_207C674C0;
      v13 = unk_207C674D0;
      std::vector<PerfTracerMetric>::__assign_with_size[abi:ne180100]<PerfTracerMetric const*,PerfTracerMetric const*>((char *)&v9, (char *)&__src, (uint64_t)&v14, 8uLL);
      break;
  }
  if (v9 == v10)
    goto LABEL_27;
  v6 = v9;
  while (*v6 != a1[1])
  {
    if (++v6 == v10)
    {
      v6 = v10;
      break;
    }
  }
  if (v6 == v10)
  {
LABEL_27:
    v5 = 0;
    if (!v9)
      return v5;
LABEL_28:
    v10 = v9;
    operator delete(v9);
    return v5;
  }
  v7 = v9;
  while (*v7 != a1[2])
  {
    if (++v7 == v10)
    {
      v7 = v10;
      break;
    }
  }
  v5 = v7 != v10;
  if (v9)
    goto LABEL_28;
  return v5;
}

void sub_207C518A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t std::unordered_map<std::string,PerfTracerCategory>::unordered_map(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    v5 = 32 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,PerfTracerCategory> const&>(a1, a2, (uint64_t)a2);
      a2 += 32;
      v5 -= 32;
    }
    while (v5);
  }
  return a1;
}

void sub_207C51930(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,PerfTracerCategory> const&>(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t v3;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  unsigned __int8 **v13;
  unsigned __int8 *i;
  unint64_t v15;
  float v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  size_t v21;
  _QWORD *v22;
  unint64_t v23;
  _QWORD v25[3];

  v7 = (_QWORD *)(a1 + 24);
  v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      v3 = v8;
      if (v8 >= v10)
        v3 = v8 % v10;
    }
    else
    {
      v3 = (v10 - 1) & v8;
    }
    v13 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v3);
    if (v13)
    {
      for (i = *v13; i; i = *(unsigned __int8 **)i)
      {
        v15 = *((_QWORD *)i + 1);
        if (v15 == v9)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10)
              v15 %= v10;
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__construct_node_hash<std::pair<std::string const,PerfTracerCategory> const&>(a1, v9, a3, (uint64_t)v25);
  v16 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    v18 = 1;
    if (v10 >= 3)
      v18 = (v10 & (v10 - 1)) != 0;
    v19 = v18 | (2 * v10);
    v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20)
      v21 = v20;
    else
      v21 = v19;
    std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__rehash<true>(a1, v21);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v3 = v9 % v10;
      else
        v3 = v9;
    }
    else
    {
      v3 = (v10 - 1) & v9;
    }
  }
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v22)
  {
    *(_QWORD *)v25[0] = *v22;
    *v22 = v25[0];
  }
  else
  {
    *(_QWORD *)v25[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v25[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = a1 + 16;
    if (*(_QWORD *)v25[0])
    {
      v23 = *(_QWORD *)(*(_QWORD *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10)
          v23 %= v10;
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v23) = v25[0];
    }
  }
  i = (unsigned __int8 *)v25[0];
  ++*v7;
  return i;
}

void sub_207C51B9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void **__p, uint64_t a11)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,PerfTracerCategory>,void *>>>::operator()[abi:ne180100]((uint64_t)&a11, __p);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__construct_node_hash<std::pair<std::string const,PerfTracerCategory> const&>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;
  std::string *v9;

  v7 = a1 + 16;
  v8 = (char *)operator new(0x30uLL);
  *(_QWORD *)(a4 + 8) = v7;
  *(_QWORD *)a4 = v8;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  v9 = (std::string *)(v8 + 16);
  if (*(char *)(a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)a3, *(_QWORD *)(a3 + 8));
  }
  else
  {
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = *(_OWORD *)a3;
    *((_QWORD *)v8 + 4) = *(_QWORD *)(a3 + 16);
  }
  *((_DWORD *)v8 + 10) = *(_DWORD *)(a3 + 24);
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_207C51C4C(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,PerfTracerCategory>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  char v5;

  v2 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v3 = v2;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;

  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      v11 = v7 + v9;
      v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      v14 = v8 + a3 + v7 + v4;
      v15 = v14 + v5;
      v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      v18 = v17 + v6 + v9;
      v19 = __ROR8__(v18, 44);
      v20 = v18 + v10;
      v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      v23 = *a2;
      v22 = a2 + 4;
      v24 = v23 - 0x4B6D499041670D8DLL * v5;
      v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        v26 = *(v22 - 3);
        v27 = v24 + v15 + v11 + v26;
        v28 = v22[2];
        v29 = v22[3];
        v30 = v22[1];
        v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        v31 = v13 + v20;
        v32 = *(v22 - 2);
        v33 = *(v22 - 1);
        v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        v35 = v34 + v20 + v33;
        v36 = v34 + v26 + v32;
        v15 = v36 + v33;
        v37 = __ROR8__(v36, 44) + v34;
        v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        v16 = v37 + __ROR8__(v35 + v38, 21);
        v39 = v24 + v21 + *v22;
        v20 = v39 + v30 + v28 + v29;
        v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        v13 = v38;
        v25 += 64;
      }
      while (v25);
      v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](_DWORD *a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (a2 < 9)
  {
    if (a2 < 4)
    {
      result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    v3 = *(_QWORD *)((char *)a1 + a2 - 8);
    v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = a1[1];
  v3 = 0xB492B66FBE98F273 * *a1;
  v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8);
  v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(_QWORD *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v2 = *(_QWORD *)((char *)a1 + a2 - 16);
  v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  v5 = a1[2];
  v4 = a1[3];
  v6 = __ROR8__(v3 + v4, 52);
  v7 = v3 + a1[1];
  v8 = __ROR8__(v7, 7);
  v9 = v7 + v5;
  v10 = *(_QWORD *)((char *)a1 + a2 - 32) + v5;
  v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  v12 = *(_QWORD *)((char *)a1 + a2 - 24) + v10 + v2;
  v13 = 0xC3A5C85C97CB3127 * (v12 + *(_QWORD *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  BOOL v14;
  uint64_t result;

  v3 = a3;
  v4 = a2[23];
  if ((v4 & 0x80u) == 0)
    v5 = a2[23];
  else
    v5 = *((_QWORD *)a2 + 1);
  v6 = a3[23];
  v7 = (char)v6;
  if ((v6 & 0x80u) != 0)
    v6 = *((_QWORD *)a3 + 1);
  if (v5 != v6)
    return 0;
  if (v7 < 0)
    v3 = *(unsigned __int8 **)a3;
  if ((v4 & 0x80) != 0)
    return memcmp(*(const void **)a2, v3, *((_QWORD *)a2 + 1)) == 0;
  if (!a2[23])
    return 1;
  v8 = v4 - 1;
  do
  {
    v10 = *a2++;
    v9 = v10;
    v12 = *v3++;
    v11 = v12;
    v14 = v8-- != 0;
    result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

void std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,PerfTracerCategory>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    if (*((char *)__p + 39) < 0)
      operator delete(__p[2]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__deallocate_node(int a1, void **__p)
{
  void **v2;
  void **v3;

  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0)
        operator delete(v2[2]);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::unordered_map<std::string,PerfTracerMetric>::unordered_map(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = 1065353216;
  if (a3)
  {
    v5 = 32 * a3;
    do
    {
      std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,PerfTracerCategory> const&>(a1, a2, (uint64_t)a2);
      a2 += 32;
      v5 -= 32;
    }
    while (v5);
  }
  return a1;
}

void sub_207C52510(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24C06A4B0, MEMORY[0x24BEDAAF0]);
}

void sub_207C52600(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::find<std::string>(_QWORD *a1, unsigned __int8 *a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;

  v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v12 = (uint64_t)(a1 + 4);
    do
    {
      v13 = *((_QWORD *)v11 + 1);
      if (v6 == v13)
      {
        if ((std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2) & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(_QWORD *)&v5)
            v13 %= *(_QWORD *)&v5;
        }
        else
        {
          v13 &= *(_QWORD *)&v5 - 1;
        }
        if (v13 != v9)
          return 0;
      }
      v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

char *std::vector<PerfTracerMetric>::__assign_with_size[abi:ne180100]<PerfTracerMetric const*,PerfTracerMetric const*>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  void **v12;
  char *v13;
  _BYTE *v14;
  unint64_t v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (a4 > (v8 - *(_QWORD *)result) >> 2)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 62)
      std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 1;
    if (v8 >> 1 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFFCLL)
      v11 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<PerfTracerMetric>::__vallocate[abi:ne180100](v7, v11);
    v13 = (char *)v7[1];
    v12 = (void **)(v7 + 1);
    v9 = v13;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v12 = (void **)(result + 8);
  v14 = (_BYTE *)*((_QWORD *)result + 1);
  v15 = (v14 - v9) >> 2;
  if (v15 >= a4)
    goto LABEL_16;
  v16 = &__src[4 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9);
    v9 = (char *)*v12;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *v12 = &v9[v17];
  return result;
}

char *std::vector<PerfTracerMetric>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PerfTracerMetric>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<PerfTracerMetric>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a2);
}

uint64_t H11ANEFirmwareWork::RPCFileInfo(uint64_t a1, uint64_t *a2, int a3)
{
  uint64_t v3;
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  _BOOL4 v8;
  stat v10;

  if (a3 != 1 || a2[1] != 140)
    return 3;
  v3 = *a2;
  v4 = (char *)operator new[]();
  v5 = v4;
  strcpy(v4, "/usr/local/share/firmware/ane");
  if (*(_BYTE *)v3 != 47)
    *(_WORD *)&v4[strlen(v4)] = 47;
  v6 = strncat(v5, (const char *)v3, *(unsigned int *)(v3 + 128));
  if (stat(v6, &v10) == -1)
  {
    v7 = 4;
  }
  else
  {
    v7 = 0;
    v8 = (v10.st_mode & 0x80) == 0;
    *(_DWORD *)(v3 + 132) = v10.st_size;
    *(_DWORD *)(v3 + 136) = v8;
  }
  MEMORY[0x20BD010C4](v5, 0x1000C8077774924);
  return v7;
}

uint64_t H11ANEFirmwareWork::RPCFileRead(uint64_t a1, uint64_t *a2, int a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  FILE *v8;
  FILE *v9;
  uint64_t v10;
  size_t v12;
  uint64_t v13;
  size_t v14;
  int v15;
  int v16;
  const char *v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  size_t v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (a3 == 2 && a2[1] == 140)
  {
    v4 = *a2;
    v5 = (char *)operator new[]();
    v6 = v5;
    strcpy(v5, "/usr/local/share/firmware/ane");
    if (*(_BYTE *)v4 != 47)
      *(_WORD *)&v5[strlen(v5)] = 47;
    v7 = strncat(v6, (const char *)v4, *(unsigned int *)(v4 + 128));
    v8 = fopen(v7, "rb");
    if (!v8)
    {
      v10 = 4;
      goto LABEL_11;
    }
    v9 = v8;
    if (!fseek(v8, *(unsigned int *)(v4 + 132), 0))
    {
      v12 = fread((void *)a2[3], 1uLL, *(unsigned int *)(v4 + 136), v9);
      v13 = *(unsigned int *)(v4 + 136);
      if (v12 == v13)
      {
        v10 = 0;
        goto LABEL_8;
      }
      v14 = v12;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v15 = *__error();
        v16 = 136316162;
        v17 = "RPCFileRead";
        v18 = 2080;
        v19 = v6;
        v20 = 2048;
        v21 = v14;
        v22 = 1024;
        v23 = v13;
        v24 = 1024;
        v25 = v15;
        _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: Failed to read file %s: (Count %ld, expected count %d), errno:%d\n", (uint8_t *)&v16, 0x2Cu);
      }
    }
    v10 = 4;
LABEL_8:
    fclose(v9);
LABEL_11:
    MEMORY[0x20BD010C4](v6, 0x1000C8077774924);
    return v10;
  }
  return 3;
}

uint64_t H11ANEFirmwareWork::RPCFileWrite(uint64_t a1, uint64_t *a2, int a3)
{
  size_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  int v10;
  const char *v11;
  FILE *v12;
  FILE *v13;
  size_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v18;
  const char *v19;
  uint32_t v20;
  size_t v21;
  int v22;
  int v24;
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  size_t v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (a3 != 2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v24 = 136315394;
      v25 = "RPCFileWrite";
      v26 = 1024;
      LODWORD(v27) = a3;
      v18 = MEMORY[0x24BDACB70];
      v19 = "H11ANE %s: Number of buffers is not 2 (%d)\n";
      v20 = 18;
LABEL_17:
      _os_log_impl(&dword_207C43000, v18, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v24, v20);
    }
    return 3;
  }
  v4 = a2[1];
  if (v4 != 140)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v24 = 136315650;
      v25 = "RPCFileWrite";
      v26 = 2048;
      v27 = 140;
      v28 = 2048;
      v29 = v4;
      v18 = MEMORY[0x24BDACB70];
      v19 = "H11ANE %s: Buffer size does not match expected value (expected %ld, recv %lld)\n";
      v20 = 32;
      goto LABEL_17;
    }
    return 3;
  }
  v5 = *a2;
  v6 = (char *)operator new[]();
  v7 = v6;
  strcpy(v6, "/usr/local/share/firmware/ane");
  if (*(_BYTE *)v5 != 47)
    *(_WORD *)&v6[strlen(v6)] = 47;
  v8 = strncat(v7, (const char *)v5, *(unsigned int *)(v5 + 128));
  v9 = dirname(v8);
  v10 = mkpath_np(v9, 0x1EDu);
  if (v10 != 17 && v10)
  {
    v16 = 5;
  }
  else
  {
    if (*(_DWORD *)(v5 + 136))
      v11 = "ab";
    else
      v11 = "wb";
    v12 = fopen(v7, v11);
    if (v12)
    {
      v13 = v12;
      v14 = fwrite((const void *)a2[3], 1uLL, *(unsigned int *)(v5 + 132), v12);
      v15 = *(unsigned int *)(v5 + 132);
      if (v14 == v15)
      {
        v16 = 0;
      }
      else
      {
        v21 = v14;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v22 = *__error();
          v24 = 136316162;
          v25 = "RPCFileWrite";
          v26 = 2080;
          v27 = (uint64_t)v7;
          v28 = 2048;
          v29 = v21;
          v30 = 1024;
          v31 = v15;
          v32 = 1024;
          v33 = v22;
          _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "H11ANE:  %s: Failed to write file %s: (Count %ld, expected count %d), errno:%d\n", (uint8_t *)&v24, 0x2Cu);
        }
        v16 = 4;
      }
      fclose(v13);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v24 = 136315394;
        v25 = "RPCFileWrite";
        v26 = 2080;
        v27 = (uint64_t)v7;
        _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: Failed to open file: %s", (uint8_t *)&v24, 0x16u);
      }
      v16 = 4;
    }
  }
  MEMORY[0x20BD010C4](v7, 0x1000C8077774924);
  return v16;
}

uint64_t H11ANEFirmwareWork::FirmwareRPC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  int *v5;
  uint64_t *v6;
  int v7;

  if (*(_DWORD *)(a2 + 32))
  {
    v3 = a1;
    v4 = 0;
    v5 = (int *)(a2 + 96);
    v6 = (uint64_t *)(a2 + 680);
    do
    {
      v7 = *(v5 - 15);
      switch(v7)
      {
        case 6:
          a1 = H11ANEFirmwareWork::RPCFileWrite(a1, v6, *v5);
          break;
        case 5:
          a1 = H11ANEFirmwareWork::RPCFileRead(a1, v6, *v5);
          break;
        case 4:
          a1 = H11ANEFirmwareWork::RPCFileInfo(a1, v6, *v5);
          break;
        default:
          a1 = 5;
          break;
      }
      *(v5 - 12) = a1;
      ++*(_DWORD *)(v3 + 56);
      ++v4;
      v5 += 16;
      v6 += 30;
    }
    while (v4 < *(unsigned int *)(a2 + 32));
  }
  return 0;
}

void H11ANEFirmwareWork::H11ANEFirmwareWork(H11ANEFirmwareWork *this)
{
  *((_DWORD *)this + 14) = 0;
}

{
  *((_DWORD *)this + 14) = 0;
}

H11ANE::H11ANEFirmwareWorkProcessor *H11ANE::H11ANEFirmwareWorkProcessor::H11ANEFirmwareWorkProcessor(H11ANE::H11ANEFirmwareWorkProcessor *this, H11ANE::H11ANEDevice *a2)
{
  H11ANEFirmwareWork *v3;
  pthread_mutexattr_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  *(_DWORD *)this = 0;
  *((_QWORD *)this + 27) = 0;
  *((_DWORD *)this + 56) = 0;
  *((_QWORD *)this + 29) = 0;
  *((_QWORD *)this + 30) = a2;
  *((_QWORD *)this + 33) = 0;
  *((_QWORD *)this + 34) = 0x4000000000000000;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 16), 0);
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 144), 0);
  *((_QWORD *)this + 26) = 0;
  pthread_mutexattr_init(&v5);
  pthread_mutexattr_settype(&v5, 2);
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 80), &v5);
  pthread_mutexattr_destroy(&v5);
  mach_timebase_info((mach_timebase_info_t)((char *)this + 252));
  v3 = (H11ANEFirmwareWork *)operator new();
  H11ANEFirmwareWork::H11ANEFirmwareWork(v3);
  *((_QWORD *)this + 35) = v3;
  return this;
}

void sub_207C5313C(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD010DC](v1, 0x1020C4077668FA2);
  _Unwind_Resume(a1);
}

void H11ANE::H11ANEFirmwareWorkProcessor::~H11ANEFirmwareWorkProcessor(H11ANE::H11ANEFirmwareWorkProcessor *this)
{
  H11ANE::H11ANECFLocalMessagePort *v2;
  __CFRunLoop *v3;
  __CFRunLoopSource *RunLoopSource;
  uint64_t v5;
  H11ANEFirmwareWork *v6;

  if (*(_DWORD *)this)
    H11ANE::H11ANEFirmwareWorkProcessor::stopReceive(this);
  if (*((_QWORD *)this + 29))
    H11ANE::H11ANEFirmwareWorkProcessor::removeIODispatcherFromRunLoop(this);
  v2 = (H11ANE::H11ANECFLocalMessagePort *)*((_QWORD *)this + 33);
  if (v2)
  {
    v3 = (__CFRunLoop *)*((_QWORD *)this + 1);
    RunLoopSource = H11ANE::H11ANECFLocalMessagePort::GetRunLoopSource(v2);
    CFRunLoopRemoveSource(v3, RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
    v5 = *((_QWORD *)this + 33);
    if (v5)
      (*(void (**)(uint64_t))(*(_QWORD *)v5 + 8))(v5);
    *((_QWORD *)this + 33) = 0;
  }
  v6 = (H11ANEFirmwareWork *)*((_QWORD *)this + 35);
  if (v6)
  {
    H11ANEFirmwareWork::~H11ANEFirmwareWork(v6);
    MEMORY[0x20BD010DC]();
  }
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 16));
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 80));
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 144));
}

uint64_t H11ANE::H11ANEFirmwareWorkProcessor::stopReceive(H11ANE::H11ANEFirmwareWorkProcessor *this)
{
  pthread_mutex_t *v2;
  uint64_t v3;

  v2 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if (*(_DWORD *)this)
  {
    H11ANE::H11ANEFirmwareWorkProcessor::stopNoDataTimer(this);
    pthread_mutex_lock((pthread_mutex_t *)((char *)this + 80));
    *((_BYTE *)this + 248) = 1;
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 80));
    v3 = H11ANE::H11ANEDevice::ANE_UnregisterFirmwareWorkProcessor(*((H11ANE::H11ANEDevice **)this + 30), *((_DWORD *)this + 56));
    *((_BYTE *)this + 248) = 0;
    *(_DWORD *)this = 0;
  }
  else
  {
    v3 = 3758097122;
  }
  pthread_mutex_unlock(v2);
  return v3;
}

void H11ANE::H11ANEFirmwareWorkProcessor::removeIODispatcherFromRunLoop(H11ANE::H11ANEFirmwareWorkProcessor *this)
{
  __CFRunLoopSource *v2;
  __CFMachPort *v3;
  mach_port_name_t v4;

  v2 = (__CFRunLoopSource *)*((_QWORD *)this + 29);
  if (v2)
  {
    CFRunLoopRemoveSource(*((CFRunLoopRef *)this + 1), v2, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
    CFRelease(*((CFTypeRef *)this + 29));
    *((_QWORD *)this + 29) = 0;
  }
  v3 = (__CFMachPort *)*((_QWORD *)this + 27);
  if (v3)
  {
    CFMachPortInvalidate(v3);
    CFRelease(*((CFTypeRef *)this + 27));
    *((_QWORD *)this + 27) = 0;
  }
  v4 = *((_DWORD *)this + 56);
  if (v4)
  {
    mach_port_mod_refs(*MEMORY[0x24BDAEC58], v4, 1u, -1);
    *((_DWORD *)this + 56) = 0;
  }
}

uint64_t H11ANE::H11ANEFirmwareWorkProcessor::setupWorkProcessor(H11ANE::H11ANEFirmwareWorkProcessor *this)
{
  *((_QWORD *)this + 1) = CFRunLoopGetCurrent();
  return H11ANE::H11ANEFirmwareWorkProcessor::addIODispatcherToRunLoop(this);
}

uint64_t H11ANE::H11ANEFirmwareWorkProcessor::addIODispatcherToRunLoop(H11ANE::H11ANEFirmwareWorkProcessor *this)
{
  uint64_t v2;
  const __CFAllocator *v3;
  __CFMachPort *v4;
  __CFRunLoopSource *RunLoopSource;
  Boolean shouldFreeInfo;
  CFMachPortContext context;

  v2 = IOCreateReceivePort(0x39u, (mach_port_t *)this + 56);
  if (!(_DWORD)v2)
  {
    v2 = 3758097085;
    shouldFreeInfo = 0;
    context.version = 1;
    context.info = this;
    memset(&context.retain, 0, 24);
    v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v4 = CFMachPortCreateWithPort((CFAllocatorRef)*MEMORY[0x24BDBD240], *((_DWORD *)this + 56), MEMORY[0x24BDD7FD8], &context, &shouldFreeInfo);
    *((_QWORD *)this + 27) = v4;
    if (v4)
    {
      RunLoopSource = CFMachPortCreateRunLoopSource(v3, v4, 0);
      *((_QWORD *)this + 29) = RunLoopSource;
      if (RunLoopSource)
      {
        CFRunLoopAddSource(*((CFRunLoopRef *)this + 1), RunLoopSource, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
        return 0;
      }
    }
  }
  return v2;
}

uint64_t H11ANE::H11ANEFirmwareWorkProcessor::startReceive(H11ANE::H11ANEFirmwareWorkProcessor *this)
{
  pthread_mutex_t *v2;
  uint64_t v3;
  _QWORD inputStruct[2];
  int v6;

  puts("H11ANEFirmwareWorkProcessor::startReceive");
  v2 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  if (*(_DWORD *)this == 1)
  {
    pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 16));
    return 3758097122;
  }
  else
  {
    *((_BYTE *)this + 248) = 0;
    *(_DWORD *)this = 1;
    inputStruct[0] = H11ANE::H11ANEFirmwareWorkProcessor::WorkReady;
    inputStruct[1] = this;
    v6 = *((_DWORD *)this + 56);
    v3 = H11ANE::H11ANEDevice::ANE_RegisterFirmwareWorkProcessor(*((_QWORD *)this + 30), inputStruct);
    pthread_mutex_unlock(v2);
  }
  return v3;
}

void H11ANE::H11ANEFirmwareWorkProcessor::WorkReady(H11ANE::H11ANEFirmwareWorkProcessor *this, void *a2, int a3, unint64_t *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v8;

  v5 = operator new();
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 80));
  if (!H11ANE::H11ANEDevice::ANE_GetFirmwareWorkProcessorItem(*((_QWORD *)this + 30), *((_DWORD *)this + 56), v5))
  {
    H11ANE::H11ANEFirmwareWorkProcessor::tickleNoDataTimer(this);
    v6 = *((_QWORD *)this + 35);
    if (v6)
    {
      H11ANEFirmwareWork::FirmwareRPC(v6, v5);
    }
    else
    {
      v7 = *(unsigned int *)(v5 + 32);
      if ((_DWORD)v7)
      {
        v8 = (_DWORD *)(v5 + 48);
        do
        {
          *v8 = 5;
          v8 += 16;
          --v7;
        }
        while (v7);
      }
    }
    if (H11ANE::H11ANEDevice::ANE_CompleteFirmwareWorkProcessorItem(*((_QWORD *)this + 30), *((_DWORD *)this + 56), v5))puts("ANE_CompleteFirmwareWorkProcessorItem failed");
  }
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 80));
  JUMPOUT(0x20BD010DCLL);
}

uint64_t H11ANE::H11ANEFirmwareWorkProcessor::stopNoDataTimer(H11ANE::H11ANEFirmwareWorkProcessor *this)
{
  pthread_mutex_t *v2;
  __CFRunLoopTimer *v3;

  v2 = (pthread_mutex_t *)((char *)this + 144);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 144));
  v3 = (__CFRunLoopTimer *)*((_QWORD *)this + 26);
  if (v3)
  {
    CFRunLoopTimerInvalidate(v3);
    CFRelease(*((CFTypeRef *)this + 26));
    *((_QWORD *)this + 26) = 0;
  }
  return pthread_mutex_unlock(v2);
}

uint64_t H11ANE::H11ANEFirmwareWorkProcessor::tickleNoDataTimer(H11ANE::H11ANEFirmwareWorkProcessor *this)
{
  pthread_mutex_t *v2;
  __CFRunLoopTimer *v3;
  CFAbsoluteTime Current;

  v2 = (pthread_mutex_t *)((char *)this + 144);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 144));
  v3 = (__CFRunLoopTimer *)*((_QWORD *)this + 26);
  if (v3)
  {
    Current = CFAbsoluteTimeGetCurrent();
    CFRunLoopTimerSetNextFireDate(v3, Current + *((double *)this + 34));
  }
  return pthread_mutex_unlock(v2);
}

uint64_t H11ANE::H11ANEFirmwareWorkProcessor::startNoDataTimer(H11ANE::H11ANEFirmwareWorkProcessor *this)
{
  pthread_mutex_t *v2;
  __CFRunLoopTimer *v3;
  CFAbsoluteTime Current;
  __CFRunLoopTimer *v5;
  CFRunLoopTimerContext context;

  v2 = (pthread_mutex_t *)((char *)this + 144);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 144));
  v3 = (__CFRunLoopTimer *)*((_QWORD *)this + 26);
  if (v3)
  {
    CFRunLoopTimerInvalidate(v3);
    CFRelease(*((CFTypeRef *)this + 26));
    *((_QWORD *)this + 26) = 0;
  }
  context.version = 0;
  context.info = this;
  memset(&context.retain, 0, 24);
  Current = CFAbsoluteTimeGetCurrent();
  v5 = CFRunLoopTimerCreate(0, Current + *((double *)this + 34), 0.0, 0, 0, (CFRunLoopTimerCallBack)H11ANE::H11ANEFirmwareWorkProcessor::NoDataTimeout, &context);
  *((_QWORD *)this + 26) = v5;
  if (v5)
    CFRunLoopAddTimer(*((CFRunLoopRef *)this + 1), v5, (CFRunLoopMode)*MEMORY[0x24BDBD5A0]);
  return pthread_mutex_unlock(v2);
}

uint64_t H11ANE::H11ANEFirmwareWorkProcessor::SetFrameDoneTimeoutDuration(H11ANE::H11ANEFirmwareWorkProcessor *this, double a2)
{
  if (a2 < 2.0)
    a2 = 2.0;
  *((double *)this + 34) = a2;
  H11ANE::H11ANEFirmwareWorkProcessor::tickleNoDataTimer(this);
  return 0;
}

uint64_t H11ANE::H11ANEFirmwareWorkProcessor::FlushSurfaceCache(H11ANE::H11ANEFirmwareWorkProcessor *this)
{
  pthread_mutex_t *v2;

  v2 = (pthread_mutex_t *)((char *)this + 16);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 16));
  H11ANE::H11ANEDevice::ANE_ReleaseFirmwareWorkProcessorBuffers(*((H11ANE::H11ANEDevice **)this + 30), *((_DWORD *)this + 56));
  pthread_mutex_unlock(v2);
  return 0;
}

uint64_t H11ANE::CreateH11ANEFirmwareWorkProcessor(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  char v5;
  uint64_t v6;
  sched_param v8;
  pthread_t v9;
  _QWORD v10[3];
  pthread_mutex_t v11;
  pthread_attr_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  H11ANE::H11ANEThreadReadySyncer::H11ANEThreadReadySyncer((H11ANE::H11ANEThreadReadySyncer *)&v11);
  v2 = *(_QWORD *)(a1 + 8);
  v10[0] = 0;
  v10[1] = v2;
  v10[2] = &v11;
  v3 = pthread_attr_init(&v12);
  if (v3)
  {
    printf("pthread_attr_init() failed. Error: %d\n", v3);
    goto LABEL_12;
  }
  v8 = (sched_param)47;
  if (pthread_attr_setschedparam(&v12, &v8))
  {
    printf("pthread_attr_setschedparam() failed. Error: %d\n");
LABEL_9:
    v4 = 0;
    goto LABEL_10;
  }
  if (pthread_attr_setdetachstate(&v12, 2))
  {
    printf("pthread_attr_setdetachstate() failed. Error: %d\n");
    goto LABEL_9;
  }
  if (pthread_create(&v9, &v12, (void *(__cdecl *)(void *))H11ANE::H11ANEFirmwareWorkProcessorThreadStart, v10))
  {
    printf("pthread_create() failed. Error: %d\n");
    goto LABEL_9;
  }
  v4 = 1;
LABEL_10:
  pthread_attr_destroy(&v12);
  if (v4)
  {
    H11ANE::H11ANEThreadReadySyncer::wait(&v11);
    v5 = 1;
    goto LABEL_13;
  }
LABEL_12:
  v5 = 0;
LABEL_13:
  **(_QWORD **)a1 = v10[0];
  if ((v5 & (v10[0] != 0)) != 0)
    v6 = 0;
  else
    v6 = 3758097084;
  H11ANE::H11ANEThreadReadySyncer::~H11ANEThreadReadySyncer((H11ANE::H11ANEThreadReadySyncer *)&v11);
  return v6;
}

void sub_207C538A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  H11ANE::H11ANEThreadReadySyncer::~H11ANEThreadReadySyncer((H11ANE::H11ANEThreadReadySyncer *)va);
  _Unwind_Resume(a1);
}

uint64_t H11ANE::H11ANEFirmwareWorkProcessorThreadStart(uint64_t a1)
{
  H11ANE::H11ANEFirmwareWorkProcessor *v2;
  int v3;

  pthread_setname_np("H11ANEFirmwareWorkProcessorThread");
  H11ANE::H11ANEThreadReadySyncer::lock(*(pthread_mutex_t **)(a1 + 16));
  v2 = (H11ANE::H11ANEFirmwareWorkProcessor *)operator new();
  H11ANE::H11ANEFirmwareWorkProcessor::H11ANEFirmwareWorkProcessor(v2, *(H11ANE::H11ANEDevice **)(a1 + 8));
  *((_QWORD *)v2 + 1) = CFRunLoopGetCurrent();
  v3 = H11ANE::H11ANEFirmwareWorkProcessor::addIODispatcherToRunLoop(v2);
  if (v3)
  {
    H11ANE::H11ANEFirmwareWorkProcessor::~H11ANEFirmwareWorkProcessor(v2);
    MEMORY[0x20BD010DC]();
    v2 = 0;
  }
  *(_QWORD *)a1 = v2;
  H11ANE::H11ANEThreadReadySyncer::signalAndUnlock(*(H11ANE::H11ANEThreadReadySyncer **)(a1 + 16));
  if (!v3 && v2)
    CFRunLoopRun();
  return 0;
}

void sub_207C53970(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD010DC](v1, 0x1020C40093FD29CLL);
  _Unwind_Resume(a1);
}

uint64_t H11ANE::DestroyH11ANEFirmwareWorkProcessor(H11ANE *this, H11ANE::H11ANEFirmwareWorkProcessor *a2)
{
  void *v3;

  v3 = (void *)*((_QWORD *)this + 1);
  CFRetain(v3);
  H11ANE::H11ANEFirmwareWorkProcessor::~H11ANEFirmwareWorkProcessor(this);
  MEMORY[0x20BD010DC]();
  CFRunLoopStop((CFRunLoopRef)v3);
  CFRelease(v3);
  return 0;
}

double H11ANEMetrics::AddSample(H11ANEMetrics *this, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  double result;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;

  v3 = *(_QWORD *)this;
  result = 0.0;
  if (a2 - 1 < a3 && v3 != 0)
  {
    v6 = *((unsigned int *)this + 4);
    *(_QWORD *)(v3 + 8 * v6) = a3 - a2;
    v8 = *((_DWORD *)this + 2);
    v7 = *((_DWORD *)this + 3);
    *((_DWORD *)this + 4) = ((int)v6 + 1) % v8;
    if (v7 < v8)
      *((_DWORD *)this + 3) = v7 + 1;
    return (double)((a3 - a2) * *((unsigned int *)this + 8) / *((unsigned int *)this + 9)) / 1000000.0;
  }
  return result;
}

_QWORD *H11ANEMetrics::StartTimer(_QWORD *this)
{
  _QWORD *v1;

  if (*this)
  {
    v1 = this;
    if (!this[3])
    {
      this = (_QWORD *)mach_absolute_time();
      v1[3] = this;
    }
  }
  return this;
}

double H11ANEMetrics::StopTimer(H11ANEMetrics *this)
{
  uint64_t v1;
  uint64_t v3;
  double result;

  v1 = *((_QWORD *)this + 3);
  if (!v1)
    return 0.0;
  v3 = mach_absolute_time();
  result = H11ANEMetrics::AddSample(this, v1, v3);
  *((_QWORD *)this + 3) = 0;
  return result;
}

double H11ANEMetrics::GetMetricsSummary(uint64_t *a1, uint64_t a2, double result)
{
  int v5;
  int v6;
  uint64_t *v7;
  double v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;

  if (a2)
  {
    *(_QWORD *)(a2 + 48) = 0;
    result = 0.0;
    *(_OWORD *)(a2 + 16) = 0u;
    *(_OWORD *)(a2 + 32) = 0u;
    *(_OWORD *)a2 = 0u;
    v6 = *((_DWORD *)a1 + 2);
    v5 = *((_DWORD *)a1 + 3);
    *(_DWORD *)a2 = v5;
    *(_DWORD *)(a2 + 4) = v6;
    *(_DWORD *)(a2 + 8) = *((_DWORD *)a1 + 4);
    if (v5)
    {
      v7 = (uint64_t *)operator new[]();
      v9 = *((unsigned int *)a1 + 3);
      if ((_DWORD)v9)
      {
        v10 = 0;
        v11 = 0;
        v12 = *a1;
        do
        {
          v13 = *(_QWORD *)(v12 + 8 * v10);
          if (v10)
          {
            v14 = v10;
            while (1)
            {
              v15 = (v14 - 1);
              v16 = v7[v15];
              if (v13 >= v16)
                break;
              v7[v14--] = v16;
              if (!v15)
                goto LABEL_9;
            }
          }
          else
          {
LABEL_9:
            LODWORD(v14) = 0;
          }
          v11 += v13;
          v7[v14] = v13;
          ++v10;
        }
        while (v10 != v9);
        v17 = 0;
        v18 = *v7;
        v19 = v7[(v9 - 1)];
        v20 = *(uint64_t *)((char *)v7 + ((4 * v9) & 0x3FFFFFFF8));
        v21 = v9;
        v22 = v7;
        v23 = v11 / v9;
        do
        {
          v24 = *v22++;
          v17 += (v24 - v23) * (v24 - v23);
          --v21;
        }
        while (v21);
        v8 = (double)(v17 / v9);
      }
      else
      {
        v23 = 0;
        v18 = *v7;
        v19 = v7[0xFFFFFFFFLL];
        v20 = *(uint64_t *)((char *)v7 + ((4 * v9) & 0x3FFFFFFF8));
      }
      v25 = *((unsigned int *)a1 + 8);
      v26 = *((unsigned int *)a1 + 9);
      *(double *)(a2 + 16) = (double)(v18 * v25 / v26) / 1000000.0;
      *(double *)(a2 + 24) = (double)(v19 * v25 / v26) / 1000000.0;
      *(double *)(a2 + 32) = (double)(v23 * v25 / v26) / 1000000.0;
      *(double *)(a2 + 40) = (double)(v20 * v25 / v26) / 1000000.0;
      *(double *)(a2 + 48) = sqrt(v8) * (double)v25 / (double)v26 / 1000000.0;
      JUMPOUT(0x20BD010C4);
    }
  }
  return result;
}

void H11ANEMetrics::PrintMetricsSummary(H11ANEMetrics *this, double a2)
{
  _DWORD v2[4];
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  H11ANEMetrics::GetMetricsSummary((uint64_t *)this, (uint64_t)v2, a2);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v9) = v2[0];
    _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " Number of samples: %d", buf, 8u);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v9) = v2[1];
    _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " Maximum samples:   %d", buf, 8u);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = v3;
    _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " Minimum time (ms): %.3f", buf, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = v4;
    _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " Maximum time (ms): %.3f", buf, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = v5;
    _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " Average time (ms): %.3f", buf, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = v6;
    _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " Median time (ms): %.3f", buf, 0xCu);
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = v7;
    _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " Standard deviation (ms): %.3f", buf, 0xCu);
  }
}

uint64_t H11ANEMetrics::ClearSamples(uint64_t this)
{
  *(_DWORD *)(this + 12) = 0;
  *(_DWORD *)(this + 16) = 0;
  return this;
}

void H11ANEMetrics::H11ANEMetrics(H11ANEMetrics *this, int a2)
{
  *((_DWORD *)this + 3) = 0;
  *((_DWORD *)this + 4) = 0;
  *((_DWORD *)this + 2) = a2;
  *((_QWORD *)this + 3) = 0;
  *(_QWORD *)this = operator new[]();
  mach_timebase_info((mach_timebase_info_t)this + 4);
}

{
  *((_DWORD *)this + 3) = 0;
  *((_DWORD *)this + 4) = 0;
  *((_DWORD *)this + 2) = a2;
  *((_QWORD *)this + 3) = 0;
  *(_QWORD *)this = operator new[]();
  mach_timebase_info((mach_timebase_info_t)this + 4);
}

void H11ANEMetrics::~H11ANEMetrics(H11ANEMetrics *this)
{
  uint64_t v1;

  v1 = *(_QWORD *)this;
  if (v1)
    MEMORY[0x20BD010C4](v1, 0x1000C8000313F17);
}

{
  uint64_t v1;

  v1 = *(_QWORD *)this;
  if (v1)
    MEMORY[0x20BD010C4](v1, 0x1000C8000313F17);
}

uint64_t H11ANEDeviceUpdateParameters(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v12)
      H11ANEDeviceUpdateParameters_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
    return 2;
  }
  if (*(_DWORD *)(v2 + 32) != 1)
  {
    if (!a2)
      return 0;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      H11ANEDeviceUpdateParameters_cold_3();
    return 2;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    H11ANEDeviceUpdateParameters_cold_2(a2, v4, v5, v6, v7, v8, v9, v10);
  return 20;
}

uint64_t H11ANEDeviceClose(uint64_t a1)
{
  uint64_t v2;
  H11ANE::H11ANEDevice *v3;
  pthread_t *v4;
  H11ANE::H11ANEFrameReceiver *v5;
  _opaque_pthread_t *v6;
  H11ANE *v7;
  H11ANE *v8;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  H11ANE::H11ANEFrameReceiver *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int *v17;
  uint8_t *v18;
  uint64_t v19;
  int v20;
  _BOOL8 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BOOL8 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t result;
  _BOOL8 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _BOOL8 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  H11ANE::H11ANEDeviceController *v54;
  NSObject *v55;
  NSObject *v56;
  int v57;
  const char *v58;
  uint8_t buf[4];
  uint64_t v60;
  uint64_t v61;
  int v62;
  int v63;
  __int16 v64;
  char v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v21 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v21)
      H11ANEDeviceClose_cold_1(v21, v22, v23, v24, v25, v26, v27, v28);
    return 8;
  }
  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v29 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v29)
      H11ANEDeviceClose_cold_2(v29, v30, v31, v32, v33, v34, v35, v36);
    return 2;
  }
  v3 = *(H11ANE::H11ANEDevice **)(v2 + 8);
  if (!v3)
  {
    v38 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v38)
      H11ANEDeviceClose_cold_3(v38, v39, v40, v41, v42, v43, v44, v45);
    return 8;
  }
  v4 = *(pthread_t **)v2;
  if (*(_QWORD *)v2)
  {
    v5 = *(H11ANE::H11ANEFrameReceiver **)(v2 + 96);
    v6 = pthread_self();
    v7 = (H11ANE *)pthread_equal(v6, v4[8]);
    if ((_DWORD)v7)
    {
      v8 = (H11ANE *)H11ANE::H11ANEIsDelayedCloseFlagSet(v7);
      buf[0] = v8;
      if (!(_BYTE)v8)
      {
        H11ANE::H11ANESetCurrentThreadAsTerminating(a1);
        return 0;
      }
      H11ANE::H11ANEAckCloseRequest(v8);
    }
    if (*(_DWORD *)(v2 + 32) == 1 && v5 == 0)
      return 11;
    v10 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle](ANEServicesLog, "handle"), (const void *)0x61B2404);
    v11 = +[ANEServicesLog handle](ANEServicesLog, "handle");
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v12 = v11;
      if (os_signpost_enabled(v11))
      {
        *(_DWORD *)buf = 134217984;
        v60 = a1;
        _os_signpost_emit_with_name_impl(&dword_207C43000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ServicesDeviceClose", "deviceID=%llx", buf, 0xCu);
      }
    }
    if (*(_DWORD *)(v2 + 32) == 1)
    {
      H11ANE::H11ANEFrameReceiver::completeAllRequests(v5);
      H11ANE::DestroyH11ANEFrameReceiver(v5, v13);
      *(_QWORD *)(v2 + 96) = 0;
      v14 = *(_QWORD *)(v2 + 112);
      if (v14)
      {
        v15 = *(_QWORD *)(v2 + 40);
        bzero(buf, 0x828uLL);
        v16 = *(_DWORD *)(v14 + 88);
        if (v16)
        {
          v17 = *(int **)(v14 + 80);
          v18 = buf;
          v19 = *(unsigned int *)(v14 + 88);
          do
          {
            v20 = *v17++;
            *(_DWORD *)v18 = v20;
            *(_QWORD *)(v18 + 4) = 0x100000100;
            *((_DWORD *)v18 + 3) = 16;
            v18 += 16;
            --v19;
          }
          while (v19);
        }
        v61 = v15;
        v62 = v16;
        v63 = -1;
        v64 = 256;
        v65 = 1;
        if (H11ANE::H11ANEDevice::ANE_ProgramMemoryUnMapRequest((uint64_t)v3, buf))
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            H11ANEDeviceClose_cold_5();
        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v57 = 136315138;
          v58 = "FreeStatsBufferPool";
          _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: pH11ANEDevice->ANE_ProgramMemoryUnMapRequest success for prewiring stats buffers\n", (uint8_t *)&v57, 0xCu);
        }
        H11ANE::H11ANEFrameReceiverBufferPool::~H11ANEFrameReceiverBufferPool((H11ANE::H11ANEFrameReceiverBufferPool *)v14);
        MEMORY[0x20BD010DC]();
      }
    }
    H11ANE::H11ANEDevice::H11ANEDeviceClose(v3);
    H11ANE::DestroyH11ANEDeviceController((H11ANE *)v4, v54);
    MEMORY[0x20BD010DC](v2, 0x10E0C40B462FC6BLL);
    v55 = +[ANEServicesLog handle](ANEServicesLog, "handle");
    if (v10 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      return 0;
    v56 = v55;
    result = os_signpost_enabled(v55);
    if ((_DWORD)result)
    {
      *(_DWORD *)buf = 134217984;
      v60 = a1;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v56, OS_SIGNPOST_INTERVAL_END, v10, "ServicesDeviceClose", "deviceID=%llx", buf, 0xCu);
      return 0;
    }
  }
  else
  {
    v46 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v46)
      H11ANEDeviceClose_cold_4(v46, v47, v48, v49, v50, v51, v52, v53);
    return 7;
  }
  return result;
}

uint64_t H11ANEProgramChainingPrepare()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _DWORD *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  int v10;
  int v11;
  NSObject *v12;
  const char *v13;
  uint8_t *v14;
  uint32_t v15;
  unint64_t v17;
  int v18;
  id v19;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  uint8_t *v24;
  unint64_t v26;
  _DWORD *v27;
  _DWORD *v28;
  unint64_t v29;
  IOSurfaceRef *v30;
  _BYTE *v31;
  int *v32;
  uint64_t v33;
  __IOSurface *v34;
  int v35;
  unsigned int *v36;
  int v37;
  unint64_t v38;
  IOSurfaceRef *v39;
  int v40;
  int v41;
  int v42;
  _BYTE v43[18];
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  _BYTE v47[10];
  _DWORD v48[2];
  uint64_t v49;
  int v50;
  int v51;
  _DWORD v53[577];
  id v54;
  _BYTE v56[1036];
  int v57;
  _BYTE v58[28604];
  int v59;
  uint64_t v60;

  v0 = MEMORY[0x24BDAC7A8]();
  v60 = *MEMORY[0x24BDAC8D0];
  v2 = 2;
  if (!v0)
    return v2;
  v3 = v1;
  if (!v1)
    return v2;
  v4 = v0;
  v5 = *(_DWORD **)(v0 + 8);
  if (v5)
  {
    v6 = *(_QWORD *)(*(_QWORD *)v5 + 16);
    v7 = *(_QWORD *)(v6 + 8);
    if (v7)
    {
      if (*(_DWORD *)(v6 + 32) == 1)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v45 = "H11ANEProgramChainingPrepare";
          v46 = 1024;
          *(_DWORD *)v47 = 1;
          _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ERROR: %s: Cannot call this API with deviceUsageType=%d\n", buf, 0x12u);
        }
        return 20;
      }
      v8 = *(_DWORD *)(v1 + 44);
      if (v8 >= 8)
      {
        v8 = 7;
        *(_DWORD *)(v1 + 44) = 7;
      }
      if (*(_QWORD *)v1)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v45 = "H11ANEProgramChainingPrepare";
          _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ERROR: %s: cacheHandle is not 0\n", buf, 0xCu);
        }
        goto LABEL_27;
      }
      v9 = *(_DWORD *)(v1 + 48);
      if (v9 > 0x100 || *(_DWORD *)(v1 + 8248) > 0xFFu || *(_DWORD *)(v1 + 14376) >= 0xDu)
      {
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
LABEL_26:
          v2 = 2;
LABEL_27:
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v45 = "H11ANEProgramChainingPrepare";
            _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s failed\n", buf, 0xCu);
          }
          return v2;
        }
        v10 = *(_DWORD *)(v3 + 8248);
        v11 = *(_DWORD *)(v3 + 14376);
        *(_DWORD *)buf = 136315906;
        v45 = "H11ANEProgramChainingPrepare";
        v46 = 1024;
        *(_DWORD *)v47 = v9;
        *(_WORD *)&v47[4] = 1024;
        *(_DWORD *)&v47[6] = v10;
        LOWORD(v48[0]) = 1024;
        *(_DWORD *)((char *)v48 + 2) = v11;
        v12 = MEMORY[0x24BDACB70];
        v13 = "ERROR: %s: exceed max limit: %d, %d, %d \n";
        v14 = buf;
        v15 = 30;
LABEL_25:
        _os_log_impl(&dword_207C43000, v12, OS_LOG_TYPE_DEFAULT, v13, v14, v15);
        goto LABEL_26;
      }
      bzero(buf, 0xAE28uLL);
      *(_QWORD *)&v47[2] = *(_QWORD *)(v3 + 16);
      v48[0] = *(_DWORD *)(v3 + 24);
      v50 = v8;
      v49 = *(_QWORD *)(v3 + 32);
      *(_QWORD *)&v58[28596] = *(_QWORD *)(v4 + 160);
      v59 = *(_DWORD *)(v4 + 168);
      if (!v9)
        goto LABEL_58;
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0;
      v21 = v3 + 56;
      do
      {
        v22 = *(_DWORD *)(v21 + 16);
        if (v22 == 5)
        {
          v23 = objc_msgSend(*(id *)v21, "eventPort");
          v24 = &buf[48 * v20];
          *((_DWORD *)v24 + 16) = v23;
          *((_QWORD *)v24 + 11) = *(_QWORD *)v21;
          *((_DWORD *)v24 + 20) = *(_DWORD *)(v21 + 20);
          ++v20;
        }
        else if (v22 == 4 && v19 == 0)
        {
          v19 = *(id *)v21;
          v18 = objc_msgSend(*(id *)v21, "eventPort");
        }
        ++v17;
        v21 += 32;
      }
      while (v17 < *(unsigned int *)(v3 + 48));
      v54 = v19;
      v53[576] = v18;
      v51 = v20;
      if (!v19)
      {
LABEL_58:
        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          goto LABEL_26;
        *(_DWORD *)v43 = 136315138;
        *(_QWORD *)&v43[4] = "H11ANEProgramChainingPrepare";
        v12 = MEMORY[0x24BDACB70];
        v13 = "ERROR: %s: no output set free event in the chaing prepare\n";
        v14 = v43;
        v15 = 12;
        goto LABEL_25;
      }
      if (*(_DWORD *)(v3 + 8248))
      {
        v26 = 0;
        v27 = (_DWORD *)(v3 + 8268);
        v28 = v53;
        do
        {
          *v28 = *v27;
          v28[320] = IOSurfaceGetID(*(IOSurfaceRef *)(v27 - 3));
          *((_BYTE *)&v53[256] + v26++) = *(v27 - 1);
          v27 += 6;
          ++v28;
        }
        while (v26 < *(unsigned int *)(v3 + 8248));
      }
      if (*(_DWORD *)(v3 + 14376))
      {
        v29 = 0;
        v30 = (IOSurfaceRef *)(v3 + 14408);
        v31 = v58;
        v32 = &v57;
        while (1)
        {
          v33 = v3 + 6160 * v29;
          *(_DWORD *)&v56[2320 * v29 + 8] = *(_DWORD *)(v33 + 14392);
          v34 = *(__IOSurface **)(v33 + 14384);
          if (v34)
            *(_DWORD *)&v56[2320 * v29] = IOSurfaceGetID(v34);
          if (v5[879])
          {
            v35 = v5[878];
            if (v35)
              *(_DWORD *)&v56[2320 * v29 + 4] = v35;
          }
          v36 = (unsigned int *)(v33 + 14392);
          v37 = *v36;
          if (*v36 > 0x100)
            break;
          if (v37)
          {
            v38 = 0;
            v39 = v30;
            do
            {
              *(_DWORD *)&v31[4 * v38] = IOSurfaceGetID(*(v39 - 1));
              v40 = *(_DWORD *)v39;
              v39 += 3;
              *((_BYTE *)v32 + v38++) = v40;
            }
            while (v38 < *v36);
          }
          ++v29;
          v30 += 770;
          v31 += 2320;
          v32 += 580;
          if (v29 >= *(unsigned int *)(v3 + 14376))
            goto LABEL_57;
        }
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v43 = 136315394;
          *(_QWORD *)&v43[4] = "H11ANEProgramChainingPrepare";
          *(_WORD *)&v43[12] = 1024;
          *(_DWORD *)&v43[14] = v37;
          _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ERROR: %s: exceed max outputs/set limit: %d\n", v43, 0x12u);
        }
        v2 = 2;
      }
      else
      {
LABEL_57:
        v2 = 0;
      }
      v41 = H11ANE::H11ANEDevice::ANE_ProgramChainingPrepare(v7, (uint64_t)buf, v43);
      if (v41)
      {
        v42 = v41;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          H11ANEProgramPrepare_cold_4();
        v2 = IOReturnToANEReturn(v42);
      }
      else
      {
        *(_OWORD *)v3 = *(_OWORD *)v43;
      }
      if ((_DWORD)v2)
        goto LABEL_27;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v45 = "H11ANEProgramChainingPrepare";
        _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ERROR: %s: pH11ANEDevice is NULL\n", buf, 0xCu);
      }
      return 8;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v45 = "H11ANEProgramChainingPrepare";
      _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "ERROR: %s: pANEProgramInstancePriv is NULL\n", buf, 0xCu);
    }
    return 1;
  }
  return v2;
}

uint64_t H11ANEProgramOutputSetEnqueue(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  int v3;
  int v4;
  uint64_t result;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE inputStruct[8];
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int16 v18;

  if (a1 && a2)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
    if (v2)
    {
      v15 = *a2;
      v16 = a2[1];
      v17 = a2[2];
      v18 = *((_WORD *)a2 + 12);
      v3 = H11ANE::H11ANEDevice::ANE_ProgramOutputSetEnqueue(v2, inputStruct);
      if (v3 <= -536870185)
      {
        switch(v3)
        {
          case -536870211:
            return 1;
          case -536870210:
            return 5;
          case -536870209:
          case -536870208:
          case -536870205:
          case -536870204:
          case -536870203:
          case -536870202:
            goto LABEL_19;
          case -536870207:
            return 20;
          case -536870206:
            return 2;
          case -536870201:
            return 24;
          default:
            if (v3 == -536870191)
            {
              result = 19;
            }
            else if (v3 == -536870186)
            {
              result = 15;
            }
            else
            {
LABEL_19:
              result = 18;
            }
            break;
        }
      }
      else
      {
        v4 = v3 + 536870176;
        result = 4;
        switch(v4)
        {
          case 0:
            result = 26;
            break;
          case 2:
            result = 23;
            break;
          case 3:
            result = 10;
            break;
          case 7:
            result = 29;
            break;
          case 11:
            result = 21;
            break;
          case 13:
            result = 27;
            break;
          case 14:
            result = 28;
            break;
          case 16:
            return result;
          default:
            goto LABEL_19;
        }
      }
    }
    else
    {
      v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v6)
        H11ANEProgramOutputSetEnqueue_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
      return 8;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      H11ANEProgramOutputSetEnqueue_cold_2();
    return 2;
  }
  return result;
}

uint64_t H11ANEProgramInputsReady(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  int v5;
  int v6;
  uint64_t result;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE inputStruct[8];
  uint64_t v17;
  int v18;
  int v19;
  _DWORD v20[766];
  uint64_t v21;

  if (a1 && a2)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
    if (v2)
    {
      v17 = *a2;
      v3 = *((unsigned int *)a2 + 3);
      v18 = *((_DWORD *)a2 + 2);
      v19 = v3;
      v21 = a2[385];
      if ((_DWORD)v3)
      {
        for (i = 0; i != v3; ++i)
        {
          v20[i] = *((_DWORD *)a2 + i + 4);
          *(_QWORD *)&v20[2 * i + 256] = a2[i + 130];
        }
      }
      v5 = H11ANE::H11ANEDevice::ANE_ProgramInputsReady(v2, inputStruct);
      if (v5 <= -536870185)
      {
        switch(v5)
        {
          case -536870211:
            return 1;
          case -536870210:
            return 5;
          case -536870209:
          case -536870208:
          case -536870205:
          case -536870204:
          case -536870203:
          case -536870202:
            goto LABEL_22;
          case -536870207:
            return 20;
          case -536870206:
            return 2;
          case -536870201:
            return 24;
          default:
            if (v5 == -536870191)
            {
              result = 19;
            }
            else if (v5 == -536870186)
            {
              result = 15;
            }
            else
            {
LABEL_22:
              result = 18;
            }
            break;
        }
      }
      else
      {
        v6 = v5 + 536870176;
        result = 4;
        switch(v6)
        {
          case 0:
            result = 26;
            break;
          case 2:
            result = 23;
            break;
          case 3:
            result = 10;
            break;
          case 7:
            result = 29;
            break;
          case 11:
            result = 21;
            break;
          case 13:
            result = 27;
            break;
          case 14:
            result = 28;
            break;
          case 16:
            return result;
          default:
            goto LABEL_22;
        }
      }
    }
    else
    {
      v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v8)
        H11ANEProgramInputsReady_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
      return 8;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      H11ANEProgramInputsReady_cold_2();
    return 2;
  }
  return result;
}

uint64_t H11ANEProgramStop(_QWORD *a1, int a2, int a3)
{
  uint64_t v3;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  int v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  int v26;
  uint64_t v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  _BYTE buf[12];
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (a1)
    v3 = 3;
  else
    v3 = 2;
  if (a1 && a2)
  {
    v5 = (_QWORD *)a1[1];
    v6 = *(_QWORD *)(*v5 + 16);
    v7 = *(_QWORD *)(v6 + 8);
    if (v7)
    {
      if (*(_DWORD *)(v6 + 32) == 1)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          H11ANEProgramStop_cold_2();
        return 20;
      }
      else
      {
        v17 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle](ANEServicesLog, "handle"), (const void *)0x61B2424);
        v18 = +[ANEServicesLog handle](ANEServicesLog, "handle");
        if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v19 = v18;
          if (os_signpost_enabled(v18))
          {
            v20 = a1[14];
            *(_DWORD *)buf = 134218496;
            *(_QWORD *)&buf[4] = v20;
            v33 = 1024;
            v34 = 1;
            v35 = 1024;
            v36 = a3;
            _os_signpost_emit_with_name_impl(&dword_207C43000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "ServicesProgramStop", "progHandle=%llx blocking=%d forceStop=%d", buf, 0x18u);
          }
        }
        *(_QWORD *)buf = v5[437];
        buf[11] = a3;
        v21 = H11ANE::H11ANEDevice::ANE_ProgramUnprepare(v7, (uint64_t *)buf);
        if (v21 <= -536870185)
        {
          switch(v21)
          {
            case -536870211:
              v3 = 1;
              break;
            case -536870210:
              v3 = 5;
              break;
            case -536870209:
            case -536870208:
            case -536870205:
            case -536870204:
            case -536870203:
            case -536870202:
              goto LABEL_32;
            case -536870207:
              v3 = 20;
              break;
            case -536870206:
              v3 = 2;
              break;
            case -536870201:
              v3 = 24;
              break;
            default:
              if (v21 == -536870191)
              {
                v3 = 19;
              }
              else if (v21 == -536870186)
              {
                v3 = 15;
              }
              else
              {
LABEL_32:
                v3 = 18;
              }
              break;
          }
LABEL_41:
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            H11ANEProgramStop_cold_3();
        }
        else
        {
          v3 = 4;
          switch(v21)
          {
            case -536870176:
              v3 = 26;
              goto LABEL_41;
            case -536870175:
            case -536870172:
            case -536870171:
            case -536870170:
            case -536870168:
            case -536870167:
            case -536870166:
            case -536870164:
            case -536870161:
              goto LABEL_32;
            case -536870174:
              v3 = 23;
              goto LABEL_41;
            case -536870173:
              v3 = 10;
              goto LABEL_41;
            case -536870169:
              v3 = 29;
              goto LABEL_41;
            case -536870165:
              v3 = 21;
              goto LABEL_41;
            case -536870163:
              v3 = 27;
              goto LABEL_41;
            case -536870162:
              v3 = 28;
              goto LABEL_41;
            case -536870160:
              goto LABEL_41;
            default:
              if (v21 == -536870184)
              {
                v3 = 22;
                goto LABEL_41;
              }
              if (v21)
                goto LABEL_32;
              v3 = 0;
              a1[19] = 0;
              break;
          }
        }
        v22 = +[ANEServicesLog handle](ANEServicesLog, "handle");
        if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v23 = v22;
          if (os_signpost_enabled(v22))
          {
            v24 = a1[14];
            v26 = 134218496;
            v27 = v24;
            v28 = 1024;
            v29 = 1;
            v30 = 1024;
            v31 = a3;
            _os_signpost_emit_with_name_impl(&dword_207C43000, v23, OS_SIGNPOST_INTERVAL_END, v17, "ServicesProgramStop", "progHandle=%llx blocking=%d forceStop=%d", (uint8_t *)&v26, 0x18u);
          }
        }
      }
    }
    else
    {
      v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v8)
        H11ANEProgramStop_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
      return 8;
    }
  }
  return v3;
}

uint64_t H11ANEProgramDestroy(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  os_signpost_id_t v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  _BYTE buf[24];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 2;
  v2 = *(_QWORD **)(a1 + 8);
  v3 = *(_QWORD *)(*v2 + 16);
  v4 = *(_QWORD *)(v3 + 8);
  if (v4)
  {
    if (*(_DWORD *)(v3 + 32) == 1)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        H11ANEProgramDestroy_cold_2();
      return 20;
    }
    if (v2[435])
    {
      v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v14)
        H11ANEProgramDestroy_cold_3(v14, v15, v16, v17, v18, v19, v20, v21);
      return 2;
    }
    v23 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle](ANEServicesLog, "handle"), (const void *)0x61B2428);
    v24 = +[ANEServicesLog handle](ANEServicesLog, "handle");
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v25 = v24;
      if (os_signpost_enabled(v24))
      {
        v26 = *(_QWORD *)(a1 + 112);
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v26;
        _os_signpost_emit_with_name_impl(&dword_207C43000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "ServicesProgramDestroy", "progHandle=%llx", buf, 0xCu);
      }
    }
    *(_QWORD *)buf = v2[437];
    v27 = H11ANE::H11ANEDevice::ANE_ProgramDestroy(v4, (uint64_t *)buf);
    if (v27 <= -536870185)
    {
      switch(v27)
      {
        case -536870211:
          v5 = 1;
          break;
        case -536870210:
          v5 = 5;
          break;
        case -536870209:
        case -536870208:
        case -536870205:
        case -536870204:
        case -536870203:
        case -536870202:
          goto LABEL_33;
        case -536870207:
          v5 = 20;
          break;
        case -536870206:
          v5 = 2;
          break;
        case -536870201:
          v5 = 24;
          break;
        default:
          if (v27 == -536870191)
          {
            v5 = 19;
          }
          else if (v27 == -536870186)
          {
            v5 = 15;
          }
          else
          {
LABEL_33:
            v5 = 18;
          }
          break;
      }
    }
    else
    {
      v5 = 4;
      switch(v27)
      {
        case -536870176:
          v5 = 26;
          break;
        case -536870175:
        case -536870172:
        case -536870171:
        case -536870170:
        case -536870168:
        case -536870167:
        case -536870166:
        case -536870164:
        case -536870161:
          goto LABEL_33;
        case -536870174:
          v5 = 23;
          break;
        case -536870173:
          v5 = 10;
          break;
        case -536870169:
          v5 = 29;
          break;
        case -536870165:
          v5 = 21;
          break;
        case -536870163:
          v5 = 27;
          break;
        case -536870162:
          v5 = 28;
          break;
        case -536870160:
          break;
        default:
          if (v27 == -536870184)
          {
            v5 = 22;
          }
          else
          {
            if (v27)
              goto LABEL_33;
            v5 = 0;
          }
          break;
      }
    }
    MEMORY[0x20BD010DC](v2, 0x10A0C404DBAFFD9);
    *(_BYTE *)(a1 + 72) = 0;
    *(_BYTE *)(a1 + 32) = 0;
    *(_BYTE *)(a1 + 96) = 0;
    *(_BYTE *)(a1 + 144) = 0;
    v28 = *(_QWORD *)(a1 + 40);
    if (v28)
      MEMORY[0x20BD010C4](v28, 0x1000C8077774924);
    v29 = *(_QWORD *)(a1 + 48);
    if (v29)
      MEMORY[0x20BD010C4](v29, 0x1000C8000313F17);
    v30 = *(_QWORD *)(a1 + 80);
    if (v30)
      MEMORY[0x20BD010C4](v30, 0x1000C8077774924);
    v31 = *(_QWORD *)(a1 + 88);
    if (v31)
      MEMORY[0x20BD010C4](v31, 0x1000C8000313F17);
    v32 = *(_QWORD *)(a1 + 104);
    if (v32)
      MEMORY[0x20BD010C4](v32, 0x1000C80669DE214);
    v33 = *(_QWORD *)(a1 + 56);
    if (v33)
      MEMORY[0x20BD010C4](v33, 0x1000C8015A9971DLL);
    v34 = *(_QWORD *)(a1 + 64);
    if (v34)
      MEMORY[0x20BD010C4](v34, 0x1000C8015A9971DLL);
    v35 = +[ANEServicesLog handle](ANEServicesLog, "handle");
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      v36 = v35;
      if (os_signpost_enabled(v35))
      {
        v37 = *(_QWORD *)(a1 + 112);
        v38 = 134217984;
        v39 = v37;
        _os_signpost_emit_with_name_impl(&dword_207C43000, v36, OS_SIGNPOST_INTERVAL_END, v23, "ServicesProgramDestroy", "progHandle=%llx", (uint8_t *)&v38, 0xCu);
      }
    }
    MEMORY[0x20BD010DC](a1, 0x10F0C40E57AA126);
  }
  else
  {
    v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v6)
      H11ANEProgramDestroy_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    return 8;
  }
  return v5;
}

uint64_t H11ANEProgramCompleteAllRequests()
{
  return 24;
}

uint64_t H11ANEProgramCancelAllRequests(uint64_t a1)
{
  _QWORD *v2;
  H11ANE::H11ANEDevice *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t result;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 2;
  v2 = *(_QWORD **)(a1 + 8);
  if (!v2[435])
    return 11;
  v3 = *(H11ANE::H11ANEDevice **)(*(_QWORD *)(*v2 + 16) + 8);
  v4 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle](ANEServicesLog, "handle"), (const void *)0x61B2430);
  v5 = +[ANEServicesLog handle](ANEServicesLog, "handle");
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v5))
    {
      v7 = *(_QWORD *)(a1 + 112);
      v13 = 134217984;
      v14 = v7;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "ServicesProgramCancelAllRequests", "progHandle=%llx", (uint8_t *)&v13, 0xCu);
    }
  }
  v8 = H11ANE::H11ANEDevice::ANE_CancelAllRequests(v3);
  v9 = +[ANEServicesLog handle](ANEServicesLog, "handle");
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v10 = v9;
    if (os_signpost_enabled(v9))
    {
      v11 = *(_QWORD *)(a1 + 112);
      v13 = 134217984;
      v14 = v11;
      _os_signpost_emit_with_name_impl(&dword_207C43000, v10, OS_SIGNPOST_INTERVAL_END, v4, "ServicesProgramCancelAllRequests", "progHandle=%llx", (uint8_t *)&v13, 0xCu);
    }
  }
  if (v8 <= -536870185)
  {
    switch(v8)
    {
      case -536870211:
        return 1;
      case -536870210:
        return 5;
      case -536870209:
      case -536870208:
      case -536870205:
      case -536870204:
      case -536870203:
      case -536870202:
        goto LABEL_26;
      case -536870207:
        return 20;
      case -536870206:
        return 2;
      case -536870201:
        return 24;
      default:
        if (v8 == -536870191)
        {
          result = 19;
        }
        else if (v8 == -536870186)
        {
          result = 15;
        }
        else
        {
LABEL_26:
          result = 18;
        }
        break;
    }
  }
  else
  {
    result = 4;
    switch(v8)
    {
      case -536870176:
        return 26;
      case -536870175:
      case -536870172:
      case -536870171:
      case -536870170:
      case -536870168:
      case -536870167:
      case -536870166:
      case -536870164:
      case -536870161:
        goto LABEL_26;
      case -536870174:
        return 23;
      case -536870173:
        return 10;
      case -536870169:
        return 29;
      case -536870165:
        return 21;
      case -536870163:
        return 27;
      case -536870162:
        return 28;
      case -536870160:
        return result;
      default:
        if (v8 == -536870184)
        {
          result = 22;
        }
        else
        {
          if (v8)
            goto LABEL_26;
          result = 0;
        }
        break;
    }
  }
  return result;
}

uint64_t H11ANEProgramMemoryMapRequest(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t result;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t *v26;
  unint64_t v27;
  unint64_t v28;
  IOSurfaceRef *v29;
  _QWORD *v30;
  int v31;
  unint64_t v32;
  int v33;
  int v34;
  _QWORD v35[258];
  int v36;
  int v37;
  unint64_t v38;
  __int16 v39;
  char v40;
  uint8_t buf[4];
  const char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if (!a1 || !a2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      H11ANEProgramMemoryMapRequest_cold_5();
    return 2;
  }
  v4 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(v4 + 8);
  if (v5)
  {
    v6 = *(_QWORD *)(v4 + 96);
    if (v6)
    {
      v7 = *(_DWORD *)(a2 + 3080);
      if (v7 >= 0x81)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          H11ANEProgramMemoryMapRequest_cold_3();
        return 2;
      }
      if (a3)
      {
        v26 = (unint64_t *)(v6 + 416);
        do
          v27 = __ldaxr(v26);
        while (__stlxr(v27 + 1, v26));
        v7 = *(_DWORD *)(a2 + 3080);
      }
      else
      {
        v27 = 0;
      }
      bzero(v35, 0x828uLL);
      if (v7)
      {
        v28 = 0;
        v29 = (IOSurfaceRef *)(a2 + 16);
        v30 = v35;
        do
        {
          *(_DWORD *)v30 = IOSurfaceGetID(*(v29 - 2));
          *(_QWORD *)((char *)v30 + 4) = *(v29 - 1);
          v31 = *(_DWORD *)v29;
          v29 += 3;
          *((_DWORD *)v30 + 3) = v31;
          ++v28;
          v32 = *(unsigned int *)(a2 + 3080);
          v30 += 2;
        }
        while (v28 < v32);
      }
      else
      {
        LODWORD(v32) = 0;
      }
      v35[257] = *(_QWORD *)(a2 + 3072);
      v36 = v32;
      v37 = *(_DWORD *)(a2 + 3084);
      v38 = v27;
      v39 = 1;
      v40 = 0;
      v33 = H11ANE::H11ANEDevice::ANE_ProgramMemoryMapRequest(v5, v35, a3);
      if (v33)
      {
        v34 = v33;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          H11ANEProgramMemoryMapRequest_cold_4();
        if (v34 > -536870185)
        {
          result = 4;
          switch(v34)
          {
            case -536870176:
              result = 26;
              break;
            case -536870175:
            case -536870172:
            case -536870171:
            case -536870170:
            case -536870168:
            case -536870167:
            case -536870166:
            case -536870164:
            case -536870161:
              goto LABEL_48;
            case -536870174:
              result = 23;
              break;
            case -536870173:
              result = 10;
              break;
            case -536870169:
              result = 29;
              break;
            case -536870165:
              result = 21;
              break;
            case -536870163:
              result = 27;
              break;
            case -536870162:
              result = 28;
              break;
            case -536870160:
              return result;
            default:
              if (v34 == -536870184)
                result = 22;
              else
LABEL_48:
                result = 18;
              break;
          }
        }
        else
        {
          switch(v34)
          {
            case -536870211:
              return 1;
            case -536870210:
              return 5;
            case -536870209:
            case -536870208:
            case -536870205:
            case -536870204:
            case -536870203:
            case -536870202:
              goto LABEL_48;
            case -536870207:
              return 20;
            case -536870206:
              return 2;
            case -536870201:
              return 24;
            default:
              if (v34 == -536870191)
              {
                result = 19;
              }
              else
              {
                if (v34 != -536870186)
                  goto LABEL_48;
                result = 15;
              }
              break;
          }
        }
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v42 = "H11ANEProgramMemoryMapRequest";
          _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: pH11ANEDevice->ANE_ProgramMemoryMapRequest success\n", buf, 0xCu);
        }
        result = 0;
        if (a3)
          *(_QWORD *)(a2 + 3088) = v38;
      }
    }
    else
    {
      v17 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v17)
        H11ANEProgramMemoryMapRequest_cold_2(v17, v18, v19, v20, v21, v22, v23, v24);
      return 11;
    }
  }
  else
  {
    v9 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v9)
      H11ANEProgramMemoryMapRequest_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    return 8;
  }
  return result;
}

uint64_t H11ANEProgramMemoryUnmapRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  IOSurfaceRef *v6;
  _QWORD *v7;
  int v8;
  int v9;
  int v10;
  uint64_t result;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL4 v20;
  _QWORD v21[258];
  int v22;
  int v23;
  uint64_t v24;
  __int16 v25;
  char v26;
  uint8_t buf[4];
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (a1 && a2)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
    if (v3)
    {
      bzero(v21, 0x828uLL);
      LODWORD(v4) = *(_DWORD *)(a2 + 3080);
      if ((_DWORD)v4)
      {
        v5 = 0;
        v6 = (IOSurfaceRef *)(a2 + 16);
        v7 = v21;
        do
        {
          *(_DWORD *)v7 = IOSurfaceGetID(*(v6 - 2));
          *(_QWORD *)((char *)v7 + 4) = *(v6 - 1);
          v8 = *(_DWORD *)v6;
          v6 += 3;
          *((_DWORD *)v7 + 3) = v8;
          ++v5;
          v4 = *(unsigned int *)(a2 + 3080);
          v7 += 2;
        }
        while (v5 < v4);
      }
      v21[257] = *(_QWORD *)(a2 + 3072);
      v22 = v4;
      v23 = *(_DWORD *)(a2 + 3084);
      v24 = *(_QWORD *)(a2 + 3088);
      v25 = 1;
      v26 = 0;
      v9 = H11ANE::H11ANEDevice::ANE_ProgramMemoryUnMapRequest(v3, v21);
      if (v9)
      {
        v10 = v9;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          H11ANEProgramMemoryUnmapRequest_cold_2();
        if (v10 > -536870185)
        {
          result = 4;
          switch(v10)
          {
            case -536870176:
              result = 26;
              break;
            case -536870175:
            case -536870172:
            case -536870171:
            case -536870170:
            case -536870168:
            case -536870167:
            case -536870166:
            case -536870164:
            case -536870161:
              goto LABEL_32;
            case -536870174:
              result = 23;
              break;
            case -536870173:
              result = 10;
              break;
            case -536870169:
              result = 29;
              break;
            case -536870165:
              result = 21;
              break;
            case -536870163:
              result = 27;
              break;
            case -536870162:
              result = 28;
              break;
            case -536870160:
              return result;
            default:
              if (v10 == -536870184)
                result = 22;
              else
LABEL_32:
                result = 18;
              break;
          }
        }
        else
        {
          switch(v10)
          {
            case -536870211:
              return 1;
            case -536870210:
              return 5;
            case -536870209:
            case -536870208:
            case -536870205:
            case -536870204:
            case -536870203:
            case -536870202:
              goto LABEL_32;
            case -536870207:
              return 20;
            case -536870206:
              return 2;
            case -536870201:
              return 24;
            default:
              if (v10 == -536870191)
              {
                result = 19;
              }
              else
              {
                if (v10 != -536870186)
                  goto LABEL_32;
                result = 15;
              }
              break;
          }
        }
      }
      else
      {
        v20 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
        result = 0;
        if (v20)
        {
          *(_DWORD *)buf = 136315138;
          v28 = "H11ANEProgramMemoryUnmapRequest";
          _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: pH11ANEDevice->ANE_ProgramMemoryUnMapRequest success\n", buf, 0xCu);
          return 0;
        }
      }
    }
    else
    {
      v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v12)
        H11ANEProgramMemoryUnmapRequest_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
      return 8;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      H11ANEProgramMemoryUnmapRequest_cold_3();
    return 2;
  }
  return result;
}

uint64_t H11ANEProgramCreateNewInstance(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  unint64_t v21;
  NSObject *v22;
  const char *v23;
  unsigned int *v24;
  unsigned int v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  int Instance;
  _BOOL4 v36;
  uint64_t *v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;
  _OWORD *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  _QWORD *v63;
  _OWORD *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  unsigned int *v69;
  unsigned __int8 v70;
  unsigned int v71;
  uint64_t v72;
  unsigned int v73;
  int v74;
  unsigned int *v75;
  unsigned int v76;
  int v77;
  unsigned int v78;
  unsigned int v79;
  int v80;
  uint64_t v81;
  int v82;
  NSObject *v83;
  NSObject *v84;
  const char *v85;
  os_signpost_id_t spid;
  unint64_t v89;
  uint64_t v91;
  _QWORD *v92;
  unsigned int *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint8_t buf[4];
  const char *v99;
  __int16 v100;
  _BYTE v101[14];
  __int16 v102;
  uint64_t v103;
  __int16 v104;
  uint64_t v105;
  __int16 v106;
  uint64_t v107;
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  v3 = 2;
  if (a1 && a2 && a3 && (*(_QWORD *)a2 || *(_BYTE *)(a2 + 12)))
  {
    v5 = *(_QWORD *)(a1 + 16);
    if (*(_QWORD *)(v5 + 8))
    {
      if (*(_DWORD *)(v5 + 32) == 1)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          H11ANEProgramCreateNewInstance_cold_2();
        return 20;
      }
      else if (*(_DWORD *)(a2 + 268) < 0x11u)
      {
        v91 = *(_QWORD *)(v5 + 8);
        v14 = os_signpost_id_make_with_pointer((os_log_t)+[ANEServicesLog handle](ANEServicesLog, "handle"), (const void *)0x61B240C);
        v15 = +[ANEServicesLog handle](ANEServicesLog, "handle");
        v89 = v14 - 1;
        if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v16 = v15;
          if (os_signpost_enabled(v15))
          {
            v17 = *(const char **)a2;
            *(_DWORD *)buf = 134217984;
            v99 = v17;
            _os_signpost_emit_with_name_impl(&dword_207C43000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "ServicesProgramCreateNewInstance", "progHandle=%llx", buf, 0xCu);
          }
        }
        v94 = a2;
        spid = v14;
        v92 = (_QWORD *)operator new();
        v92[437] = 0;
        bzero(v92, 0xDA0uLL);
        *((_BYTE *)v92 + 3552) = 4;
        *((_DWORD *)v92 + 889) = 21;
        v93 = (unsigned int *)operator new();
        bzero(v93, 0xAEF68uLL);
        v18 = operator new();
        v97 = operator new();
        *(_OWORD *)(v97 + 144) = 0u;
        *(_OWORD *)(v97 + 160) = 0u;
        *(_OWORD *)(v97 + 112) = 0u;
        *(_OWORD *)(v97 + 128) = 0u;
        *(_OWORD *)(v97 + 80) = 0u;
        *(_OWORD *)(v97 + 96) = 0u;
        *(_OWORD *)(v97 + 48) = 0u;
        *(_OWORD *)(v97 + 64) = 0u;
        *(_OWORD *)(v97 + 16) = 0u;
        *(_OWORD *)(v97 + 32) = 0u;
        *(_OWORD *)v97 = 0u;
        *(_QWORD *)v18 = *(_QWORD *)a2;
        strlcpy((char *)(v18 + 8), (const char *)(a2 + 12), 0x100uLL);
        v19 = a2;
        v20 = *(_DWORD *)(a2 + 268);
        *(_DWORD *)(v18 + 264) = v20;
        *(_DWORD *)(v18 + 110480) = *(_DWORD *)(a2 + 8);
        if (v20)
        {
          v21 = 0;
          v95 = a2 + 792;
          v96 = 0;
          v22 = MEMORY[0x24BDACB70];
          while (1)
          {
            v23 = (const char *)(v19 + 6856 * v21 + 272);
            strlcpy((char *)(v18 + 6888 * v21 + 272), v23, 0x200uLL);
            v24 = (unsigned int *)(v94 + 6856 * v21 + 784);
            v25 = *v24;
            *(_DWORD *)(v18 + 6888 * v21 + 784) = *v24;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v99 = "H11ANEProgramCreateNewInstance";
              v100 = 2080;
              *(_QWORD *)v101 = v23;
              _os_log_impl(&dword_207C43000, v22, OS_LOG_TYPE_DEFAULT, "%s: procedureName: %s\n", buf, 0x16u);
              v25 = *v24;
            }
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315394;
              v99 = "H11ANEProgramCreateNewInstance";
              v100 = 1024;
              *(_DWORD *)v101 = v25;
              _os_log_impl(&dword_207C43000, v22, OS_LOG_TYPE_DEFAULT, "%s: numWeightsBuffer: %d\n", buf, 0x12u);
              v25 = *v24;
            }
            if (v25 > 4)
              break;
            if (v25)
            {
              v26 = 0;
              v27 = v95;
              v28 = v96;
              do
              {
                v29 = v18 + v28;
                strlcpy((char *)(v18 + v28 + 792), (const char *)v27, 0x200uLL);
                *(_QWORD *)(v29 + 1304) = *(_QWORD *)(v27 + 512);
                *(_QWORD *)(v29 + 1320) = *(_QWORD *)(v27 + 520);
                strlcpy((char *)(v18 + v28 + 1360), (const char *)(v27 + 560), 0x400uLL);
                v30 = v18;
                v31 = v18 + v28;
                v32 = *(_OWORD *)(v27 + 544);
                *(_OWORD *)(v31 + 1328) = *(_OWORD *)(v27 + 528);
                *(_OWORD *)(v31 + 1344) = v32;
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  v33 = *(_QWORD *)(v29 + 1304);
                  v34 = *(_QWORD *)(v29 + 1320);
                  *(_DWORD *)buf = 136316418;
                  v99 = "H11ANEProgramCreateNewInstance";
                  v100 = 1024;
                  *(_DWORD *)v101 = v26;
                  *(_WORD *)&v101[4] = 2080;
                  *(_QWORD *)&v101[6] = v31 + 792;
                  v102 = 2048;
                  v103 = v33;
                  v104 = 2048;
                  v105 = v34;
                  v106 = 2080;
                  v107 = v31 + 1360;
                  _os_log_impl(&dword_207C43000, v22, OS_LOG_TYPE_DEFAULT, "%s: weightName%d: %s, size: %lu, bufferAddress: 0x%llx weightFilePath: %s\n", buf, 0x3Au);
                }
                ++v26;
                v28 += 1592;
                v27 += 1584;
                v18 = v30;
              }
              while (v26 < *v24);
            }
            ++v21;
            v96 += 6888;
            v19 = v94;
            v95 += 6856;
            if (v21 >= *(unsigned int *)(v18 + 264))
              goto LABEL_37;
          }
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            H11ANEProgramCreateNewInstance_cold_4();
        }
LABEL_37:
        Instance = H11ANE::H11ANEDevice::ANE_ProgramCreateInstance(v91, (const char **)v18, v93);
        v36 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT);
        if (Instance)
        {
          if (v36)
          {
            *(_DWORD *)buf = 136315394;
            v99 = "H11ANEProgramCreateNewInstance";
            v100 = 1024;
            *(_DWORD *)v101 = Instance;
            _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: ERROR: status=0x%x\n", buf, 0x12u);
          }
          v37 = a3;
          if (Instance > -536870185)
          {
            v82 = Instance + 536870176;
            v38 = 0x24C06A000uLL;
            v39 = v89;
            v40 = v18;
            v3 = 4;
            switch(v82)
            {
              case 0:
                v3 = 26;
                break;
              case 2:
                v3 = 23;
                break;
              case 3:
                v3 = 10;
                break;
              case 7:
                v3 = 29;
                break;
              case 11:
                v3 = 21;
                break;
              case 13:
                v3 = 27;
                break;
              case 14:
                v3 = 28;
                break;
              case 16:
                break;
              default:
LABEL_74:
                v3 = 18;
                break;
            }
          }
          else
          {
            v38 = 0x24C06A000;
            v39 = v89;
            v40 = v18;
            switch(Instance)
            {
              case -536870211:
                v3 = 1;
                break;
              case -536870210:
                v3 = 5;
                break;
              case -536870209:
              case -536870208:
              case -536870205:
              case -536870204:
              case -536870203:
              case -536870202:
                goto LABEL_74;
              case -536870207:
                v3 = 20;
                break;
              case -536870206:
                v3 = 2;
                break;
              case -536870201:
                v3 = 24;
                break;
              default:
                v40 = v18;
                if (Instance == -536870191)
                {
                  v3 = 19;
                }
                else
                {
                  if (Instance != -536870186)
                    goto LABEL_74;
                  v3 = 15;
                }
                break;
            }
          }
          MEMORY[0x20BD010DC](v92, 0x10A0C404DBAFFD9);
          MEMORY[0x20BD010DC](v97, 0x10F0C40E57AA126);
          v81 = 0;
        }
        else
        {
          if (v36)
          {
            v41 = *(_QWORD *)v93;
            *(_DWORD *)buf = 136315394;
            v99 = "H11ANEProgramCreateNewInstance";
            v100 = 2048;
            *(_QWORD *)v101 = v41;
            _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: program Instance create with programHandle: 0x%llx\n", buf, 0x16u);
          }
          v42 = *(_QWORD *)v93;
          v43 = *((_QWORD *)v93 + 1);
          v92[437] = *(_QWORD *)v93;
          v92[438] = v43;
          v44 = v93[179148];
          *((_DWORD *)v92 + 878) = v44;
          v45 = v93[179150];
          v46 = v93[179151];
          *((_DWORD *)v92 + 879) = v45;
          *((_DWORD *)v92 + 882) = v46;
          *((_DWORD *)v92 + 885) = v93[179153];
          v92[443] = *((_QWORD *)v93 + 89577);
          *v92 = a1;
          *(_OWORD *)(v97 + 48) = 0u;
          *(_OWORD *)(v97 + 64) = 0u;
          *(_OWORD *)(v97 + 80) = 0u;
          *(_OWORD *)(v97 + 96) = 0u;
          *(_OWORD *)(v97 + 112) = 0u;
          *(_OWORD *)(v97 + 128) = 0u;
          *(_OWORD *)(v97 + 144) = 0u;
          *(_OWORD *)(v97 + 160) = 0u;
          *(_OWORD *)(v97 + 32) = 0u;
          *(_QWORD *)(v97 + 112) = v42;
          *(_QWORD *)v97 = aneProgramVTable;
          *(_QWORD *)(v97 + 8) = v92;
          *(_QWORD *)(v97 + 16) = v43;
          *(_QWORD *)(v97 + 24) = v43;
          *(_DWORD *)(v97 + 120) = v45;
          *(_QWORD *)(v97 + 128) = v44;
          *(_QWORD *)(v97 + 136) = v46;
          *(_BYTE *)(v97 + 32) = v93[35450];
          *(_QWORD *)(v97 + 48) = operator new[]();
          *(_QWORD *)(v97 + 40) = operator new[]();
          v47 = operator new[]();
          v48 = v97;
          *(_QWORD *)(v97 + 56) = v47;
          if (*(_BYTE *)(v97 + 32))
          {
            v49 = 0;
            v50 = 0;
            v51 = 0;
            v52 = (char *)(v93 + 35451);
            do
            {
              *(_QWORD *)(*(_QWORD *)(v48 + 48) + 8 * v51) = v93[v51 + 5];
              strlcpy((char *)(*(_QWORD *)(v48 + 40) + v49 * 4), (const char *)&v93[v49 + 2810], 0x200uLL);
              v48 = v97;
              v53 = (_OWORD *)(*(_QWORD *)(v97 + 56) + v50);
              *v53 = *(_OWORD *)&v52[v50];
              v54 = *(_OWORD *)&v52[v50 + 16];
              v55 = *(_OWORD *)&v52[v50 + 32];
              v56 = *(_OWORD *)&v52[v50 + 48];
              *(_OWORD *)((char *)v53 + 60) = *(_OWORD *)&v52[v50 + 60];
              v53[2] = v55;
              v53[3] = v56;
              v53[1] = v54;
              ++v51;
              v50 += 76;
              v49 += 128;
            }
            while (v51 < *(unsigned __int8 *)(v97 + 32));
          }
          *(_BYTE *)(v48 + 72) = v93[80586];
          v57 = (_BYTE *)(v48 + 72);
          *(_QWORD *)(v97 + 88) = operator new[]();
          *(_QWORD *)(v97 + 80) = operator new[]();
          v58 = operator new[]();
          v59 = v97;
          *(_QWORD *)(v97 + 64) = v58;
          if (*v57)
          {
            v60 = 0;
            v61 = 0;
            v62 = 0;
            v63 = v93 + 40296;
            do
            {
              *(_QWORD *)(*(_QWORD *)(v59 + 88) + 8 * v62) = v93[v62 + 45141];
              strlcpy((char *)(*(_QWORD *)(v59 + 80) + v60 * 4), (const char *)&v93[v60 + 47946], 0x200uLL);
              v59 = v97;
              v64 = (_OWORD *)(*(_QWORD *)(v97 + 64) + v61);
              *v64 = *(_OWORD *)((char *)v63 + v61);
              v65 = *(_OWORD *)((char *)v63 + v61 + 16);
              v66 = *(_OWORD *)((char *)v63 + v61 + 32);
              v67 = *(_OWORD *)((char *)v63 + v61 + 48);
              *(_OWORD *)((char *)v64 + 60) = *(_OWORD *)((char *)v63 + v61 + 60);
              v64[2] = v66;
              v64[3] = v67;
              v64[1] = v65;
              ++v62;
              v61 += 76;
              v60 += 128;
            }
            while (v62 < *(unsigned __int8 *)(v97 + 72));
          }
          *(_BYTE *)(v59 + 96) = v93[80587];
          v68 = operator new[]();
          *(_QWORD *)(v97 + 104) = v68;
          v69 = v93;
          if (v93[80587])
          {
            v70 = 0;
            do
            {
              v71 = v70;
              v72 = (uint64_t)&v69[770 * v70 + 80588];
              v73 = v69[770 * v70 + 80972];
              *(_DWORD *)(v68 + 2568 * v71 + 1532) = v73;
              if (v73)
              {
                v74 = 0;
                do
                {
                  *(_DWORD *)(v68 + 2568 * v71 + 4 * v74 + 512) = v69[770 * v71
                                                                                         + 80717
                                                                                         + v74];
                  ++v74;
                }
                while (*(_DWORD *)(v72 + 1536) > v74);
              }
              v75 = &v69[770 * v71 + 81228];
              v76 = *v75;
              *(_DWORD *)(v68 + 2568 * v71 + 2556) = *v75;
              if (v76)
              {
                v77 = 0;
                do
                {
                  *(_DWORD *)(v68 + 2568 * v71 + 4 * v77 + 1536) = v69[770 * v71
                                                                                          + 80973
                                                                                          + v77];
                  ++v77;
                }
                while (*v75 > v77);
              }
              strlcpy((char *)(v68 + 2568 * v71), (const char *)v72, 0x200uLL);
              v69 = v93;
              v78 = v93[770 * v71 + 80716];
              v68 = *(_QWORD *)(v97 + 104);
              *(_DWORD *)(v68 + 2568 * v71 + 2560) = v78;
              if ((v93[179150] & 8) != 0 && (v79 = v93[179152]) != 0)
              {
                v80 = ZinComputeAnalyticsBufferSize(v78, *((const unsigned __int8 **)v93 + 89577), v79, 27, 6);
                v68 = *(_QWORD *)(v97 + 104);
                v69 = v93;
              }
              else
              {
                v80 = 0;
              }
              *(_DWORD *)(v68 + 2568 * v71 + 2564) = v80;
              v70 = v71 + 1;
            }
            while (v93[80587] > (v71 + 1));
          }
          v40 = v18;
          v3 = 0;
          v81 = v97;
          *(_BYTE *)(v97 + 144) = *((_BYTE *)v93 + 716624);
          v39 = v89;
          v37 = a3;
          v38 = 0x24C06A000;
        }
        MEMORY[0x20BD010DC](v93, 0x1000C40CA581FBELL);
        MEMORY[0x20BD010DC](v40, 0x1000C40382CB1BALL);
        *v37 = v81;
        v83 = objc_msgSend(*(id *)(v38 + 840), "handle");
        if (v39 < 0xFFFFFFFFFFFFFFFELL)
        {
          v84 = v83;
          if (os_signpost_enabled(v83))
          {
            if (v81)
              v85 = *(const char **)(v81 + 112);
            else
              v85 = 0;
            *(_DWORD *)buf = 134217984;
            v99 = v85;
            _os_signpost_emit_with_name_impl(&dword_207C43000, v84, OS_SIGNPOST_INTERVAL_END, spid, "ServicesProgramCreateNewInstance", "progHandle=%llx", buf, 0xCu);
          }
        }
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          H11ANEProgramCreateNewInstance_cold_3();
        return 2;
      }
    }
    else
    {
      v6 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v6)
        H11ANEProgramCreateNewInstance_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
      return 8;
    }
  }
  return v3;
}

uint64_t H11ANELocateAndOpenHintedDevice(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, CFArrayRef *a5, uint64_t a6, int a7, _DWORD *a8)
{
  CFArrayRef *v9;
  CFIndex v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _DWORD *ValueAtIndex;
  int v19;
  uint64_t v20;
  H11ANE::H11ANEDevice *v21;
  int v22;
  int v23;
  _BOOL4 v24;
  uint64_t v27;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v9 = a5;
  v33 = *MEMORY[0x24BDAC8D0];
  if (!*a8)
    *a8 = 1;
  if (a7 < 1)
    return 18;
  v14 = 0;
  v15 = a7;
  v16 = 18;
  v17 = MEMORY[0x24BDACB70];
  v27 = a7;
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(*v9, v14);
    *a1 = (uint64_t)ValueAtIndex;
    if (ValueAtIndex[34] != 1)
      break;
LABEL_20:
    if (++v14 == v15)
      return v16;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v30 = v14;
    _os_log_impl(&dword_207C43000, v17, OS_LOG_TYPE_DEFAULT, "(Possible Multi-ANE System) Opening H11ANE device at index %d\n", buf, 8u);
  }
  v19 = 0;
  while (1)
  {
    v20 = H11ANEHandleDeviceOpen(*a1, a2, a3, a4, a6);
    v21 = (H11ANE::H11ANEDevice *)*a1;
    if (!(_DWORD)v20)
      break;
    v16 = v20;
    H11ANE::H11ANEDevice::H11ANEDeviceClose((H11ANE::H11ANEDevice *)*a1);
    if ((_DWORD)v16 == 10)
    {
      ++v19;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        v30 = v19;
        v31 = 1024;
        v32 = 10;
        _os_log_impl(&dword_207C43000, v17, OS_LOG_TYPE_DEFAULT, "(Possible Multi-ANE System) H11ANE device not powered, retry %d out of %d\n", buf, 0xEu);
      }
      usleep(1u);
      if (v19 != 10)
        continue;
    }
    v15 = v27;
    v9 = a5;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v30 = v14;
      _os_log_impl(&dword_207C43000, v17, OS_LOG_TYPE_DEFAULT, "(Possible Multi-ANE System) Could not opening H11ANE device at index %d. Skipping device...\n", buf, 8u);
    }
    goto LABEL_20;
  }
  v22 = *((_DWORD *)v21 + 8);
  v23 = *a8 - 1;
  v24 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
  if (v22 != v23)
  {
    if (v24)
    {
      *(_DWORD *)buf = 67109120;
      v30 = v14;
      _os_log_impl(&dword_207C43000, v17, OS_LOG_TYPE_DEFAULT, "(Possible Multi-ANE System) Skipping H11ANE device at index %d\n", buf, 8u);
      v21 = (H11ANE::H11ANEDevice *)*a1;
    }
    H11ANE::H11ANEDevice::H11ANEDeviceClose(v21);
    v16 = 0;
    v15 = v27;
    v9 = a5;
    goto LABEL_20;
  }
  if (v24)
  {
    *(_DWORD *)buf = 67109120;
    v30 = v14;
    _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "(Possible Multi-ANE System) Selected H11ANE device at index %d\n", buf, 8u);
  }
  return 0;
}

uint64_t H11ANECheckPrivilegedVMAccess()
{
  kern_return_t v0;
  kern_return_t v1;
  NSObject *v2;
  const char *v3;
  uint32_t v4;
  const __CFDictionary *v5;
  kern_return_t MatchingServices;
  uint64_t result;
  io_object_t v8;
  io_service_t v9;
  task_port_t *v10;
  NSObject *v11;
  _BOOL4 v12;
  io_connect_t connect;
  io_iterator_t existing;
  mach_port_t mainPort;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  char *v19;
  __int16 v20;
  io_service_t v21;
  __int16 v22;
  int v23;
  char name[24];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  mainPort = 0;
  v0 = MEMORY[0x20BD00E30](*MEMORY[0x24BDAD2F0], &mainPort);
  if (v0)
  {
    v1 = v0;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    *(_DWORD *)buf = 136315394;
    v17 = "ANEReturn H11ANECheckPrivilegedVMAccess()";
    v18 = 1024;
    LODWORD(v19) = v1;
    v2 = MEMORY[0x24BDACB70];
    v3 = "%s: Couldn't create a mach port: result=0x%x";
    v4 = 18;
    goto LABEL_9;
  }
  existing = 0;
  strcpy(name, "ANEPrivilegedVMAccess");
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "ANEReturn H11ANECheckPrivilegedVMAccess()";
    v18 = 2080;
    v19 = name;
    _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: probing for %s", buf, 0x16u);
  }
  v5 = IOServiceMatching(name);
  MatchingServices = IOServiceGetMatchingServices(mainPort, v5, &existing);
  if (MatchingServices)
  {
    v1 = MatchingServices;
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      goto LABEL_10;
    *(_DWORD *)buf = 136315650;
    v17 = "ANEReturn H11ANECheckPrivilegedVMAccess()";
    v18 = 2080;
    v19 = name;
    v20 = 1024;
    v21 = v1;
    v2 = MEMORY[0x24BDACB70];
    v3 = "%s: Couldn't get matching services for %s: result=0x%x";
    v4 = 28;
    goto LABEL_9;
  }
  if (existing)
  {
    v8 = IOIteratorNext(existing);
    if (v8)
    {
      v9 = v8;
      v10 = (task_port_t *)MEMORY[0x24BDAEC58];
      v11 = MEMORY[0x24BDACB70];
      do
      {
        connect = 0;
        v1 = IOServiceOpen(v9, *v10, 3u, &connect);
        v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        if (v1)
        {
          if (v12)
          {
            *(_DWORD *)buf = 136315650;
            v17 = "ANEReturn H11ANECheckPrivilegedVMAccess()";
            v18 = 2080;
            v19 = name;
            v20 = 1024;
            v21 = v1;
            _os_log_impl(&dword_207C43000, v11, OS_LOG_TYPE_DEFAULT, "%s:Client does NOT have privileged VM access to %s result=0x%x", buf, 0x1Cu);
          }
        }
        else
        {
          if (v12)
          {
            *(_DWORD *)buf = 136315906;
            v17 = "ANEReturn H11ANECheckPrivilegedVMAccess()";
            v18 = 2080;
            v19 = name;
            v20 = 1024;
            v21 = v9;
            v22 = 1024;
            v23 = 0;
            _os_log_impl(&dword_207C43000, v11, OS_LOG_TYPE_DEFAULT, "%s:Client has privileged VM access to %s at port %u result=0x%x", buf, 0x22u);
          }
          IOServiceClose(connect);
          connect = 0;
        }
        IOObjectRelease(v9);
        v9 = IOIteratorNext(existing);
      }
      while (v9);
    }
    else
    {
      v1 = 0;
    }
    IOObjectRelease(existing);
  }
  else
  {
    v1 = -536870207;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = "ANEReturn H11ANECheckPrivilegedVMAccess()";
      v2 = MEMORY[0x24BDACB70];
      v3 = "%s:IOService ANEPrivilegedVMAccess not found.";
      v4 = 12;
LABEL_9:
      _os_log_impl(&dword_207C43000, v2, OS_LOG_TYPE_DEFAULT, v3, buf, v4);
    }
  }
LABEL_10:
  if (v1 <= -536870185)
  {
    switch(v1)
    {
      case -536870211:
        result = 1;
        break;
      case -536870210:
        result = 5;
        break;
      case -536870209:
      case -536870208:
      case -536870205:
      case -536870204:
      case -536870203:
      case -536870202:
        goto LABEL_36;
      case -536870207:
        result = 20;
        break;
      case -536870206:
        result = 2;
        break;
      case -536870201:
        result = 24;
        break;
      default:
        if (v1 == -536870191)
        {
          result = 19;
        }
        else if (v1 == -536870186)
        {
          result = 15;
        }
        else
        {
LABEL_36:
          result = 18;
        }
        break;
    }
  }
  else
  {
    result = 4;
    switch(v1)
    {
      case -536870176:
        return 26;
      case -536870175:
      case -536870172:
      case -536870171:
      case -536870170:
      case -536870168:
      case -536870167:
      case -536870166:
      case -536870164:
      case -536870161:
        goto LABEL_36;
      case -536870174:
        return 23;
      case -536870173:
        return 10;
      case -536870169:
        return 29;
      case -536870165:
        return 21;
      case -536870163:
        return 27;
      case -536870162:
        return 28;
      case -536870160:
        return result;
      default:
        if (v1 == -536870184)
        {
          result = 22;
        }
        else
        {
          if (v1)
            goto LABEL_36;
          result = 0;
        }
        break;
    }
  }
  return result;
}

void AllocateStatsBufferPool(H11ANE::H11ANEFrameReceiverBufferPool **a1, unsigned int a2, int a3, unint64_t a4, H11ANE::H11ANEDevice *a5)
{
  unint64_t v6;
  H11ANE::H11ANEFrameReceiverBufferPool *v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (a3)
    {
      v6 = ((unint64_t)a2 + 728) >> 4;
      v7 = (H11ANE::H11ANEFrameReceiverBufferPool *)operator new();
      H11ANE::H11ANEFrameReceiverBufferPool::H11ANEFrameReceiverBufferPool((uint64_t)v7, 3, 0, (v6 + 0x3FFF) & 0x3FFFC000, 8, 0, 0, 2, 0, 64, 128, 8, 0, 1);
      if (H11ANE::H11ANEFrameReceiverBufferPool::activatePool(v7))
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v9 = "AllocateStatsBufferPool";
          _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "%s: Stats Fw Buffer Pool is not allocated\n", buf, 0xCu);
        }
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      *a1 = 0;
    }
  }
}

void sub_207C57450(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x20BD010DC](v1, 0x1030C4081A5006CLL);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

void OUTLINED_FUNCTION_14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

void OUTLINED_FUNCTION_15(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t H11InitializePlatformServices()
{
  void *v0;
  int H11ANEDeviceController;
  int Firmware;
  CFIndex v3;
  NSObject *v4;
  H11ANE::H11ANEDevice *ValueAtIndex;
  H11ANE::H11ANEDevice *v6;
  H11ANE::H11ANEFirmwareWorkProcessor *v7;
  unsigned int v8;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int H11ANEFirmwareWorkProcessor;
  int started;
  _QWORD v20[2];
  _OWORD outputStruct[2];
  H11ANE::H11ANEFirmwareWorkProcessor *v22;
  CFArrayRef *v23;
  uint8_t buf[4];
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v22 = 0;
  v23 = 0;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    H11InitializePlatformServices_cold_7();
  H11ANEDeviceController = H11ANE::CreateH11ANEDeviceController((H11ANE *)&v23, (H11ANE::H11ANEDeviceController **)MyH11ANEDeviceControllerNotification, 0, v0);
  if (!v23)
  {
    v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v10)
      H11InitializePlatformServices_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    return 18;
  }
  Firmware = H11ANEDeviceController;
  if (!CFArrayGetCount(*v23))
  {
LABEL_11:
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      H11InitializePlatformServices_cold_2();
    v6 = 0;
    goto LABEL_14;
  }
  v3 = 0;
  v4 = MEMORY[0x24BDACB70];
  while (1)
  {
    ValueAtIndex = (H11ANE::H11ANEDevice *)CFArrayGetValueAtIndex(*v23, v3);
    if (*((_DWORD *)ValueAtIndex + 34) == 1)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        H11InitializePlatformServices_cold_3(buf, Firmware, &v25);
      goto LABEL_10;
    }
    v6 = ValueAtIndex;
    Firmware = H11ANE::H11ANEDevice::H11ANEDeviceOpen((uint64_t)ValueAtIndex, (uint64_t)MyH11ANEDeviceMessageNotification, 0, 2u, 0);
    if (!Firmware)
      break;
LABEL_10:
    if (++v3 >= (unint64_t)CFArrayGetCount(*v23))
      goto LABEL_11;
  }
  memset(outputStruct, 0, sizeof(outputStruct));
  H11ANE::H11ANEDevice::ANE_GetStatus((uint64_t)v6, outputStruct);
  if (BYTE8(outputStruct[0]))
  {
    v20[0] = &v22;
    v20[1] = v6;
    H11ANEFirmwareWorkProcessor = H11ANE::CreateH11ANEFirmwareWorkProcessor((uint64_t)v20);
    if (H11ANEFirmwareWorkProcessor)
    {
      Firmware = H11ANEFirmwareWorkProcessor;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        H11InitializePlatformServices_cold_6();
    }
    else
    {
      started = H11ANE::H11ANEFirmwareWorkProcessor::startReceive(v22);
      if (started)
      {
        Firmware = started;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          H11InitializePlatformServices_cold_5();
      }
      else
      {
        Firmware = H11ANE::H11ANEDevice::ANE_LoadFirmware(v6);
        if (Firmware)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            H11InitializePlatformServices_cold_4();
          Firmware = 0;
        }
      }
    }
  }
  else
  {
    Firmware = -536870170;
  }
LABEL_14:
  if (!Firmware)
    return 0;
  if (v22)
  {
    H11ANE::H11ANEFirmwareWorkProcessor::stopReceive(v22);
    H11ANE::DestroyH11ANEFirmwareWorkProcessor(v22, v7);
    v22 = 0;
  }
  if (v6)
    H11ANE::H11ANEDevice::H11ANEDeviceClose(v6);
  if (Firmware == -536870210)
    v8 = 5;
  else
    v8 = 18;
  if (Firmware == -536870170)
    return 0;
  else
    return v8;
}

uint64_t H11ANE::DestroyH11ANEDeviceController(H11ANE *this, H11ANE::H11ANEDeviceController *a2)
{
  __CFRunLoop *v3;
  _opaque_pthread_t *v4;
  void *v6;

  v3 = (__CFRunLoop *)CFRetain(*((CFTypeRef *)this + 6));
  CFRunLoopStop(v3);
  v4 = pthread_self();
  if (!pthread_equal(v4, *((pthread_t *)this + 8)))
  {
    v6 = 0;
    pthread_join(*((pthread_t *)this + 8), &v6);
  }
  H11ANE::H11ANEDeviceController::~H11ANEDeviceController(this);
  MEMORY[0x20BD010DC]();
  CFRelease(v3);
  return 0;
}

uint64_t H11ANE::H11ANESetCurrentThreadAsTerminating(uint64_t a1)
{
  _QWORD *v2;

  pthread_once(&H11ANE::threadTerminationKeyInitialized, (void (*)(void))H11ANE::H11ANECreateKey);
  v2 = pthread_getspecific(H11ANE::threadTerminationKey);
  if (!v2)
    v2 = malloc_type_malloc(0x10uLL, 0x10200408CB94CA5uLL);
  *(_BYTE *)v2 = 1;
  v2[1] = a1;
  return pthread_setspecific(H11ANE::threadTerminationKey, v2);
}

uint64_t H11ANE::H11ANECreateKey(H11ANE *this)
{
  return pthread_key_create((pthread_key_t *)&H11ANE::threadTerminationKey, (void (__cdecl *)(void *))H11ANE::H11ANECleanupKey);
}

_QWORD *H11ANE::H11ANECheckForPendingClose(H11ANE *this)
{
  _QWORD *result;

  pthread_once(&H11ANE::threadTerminationKeyInitialized, (void (*)(void))H11ANE::H11ANECreateKey);
  result = pthread_getspecific(H11ANE::threadTerminationKey);
  if (result && *(_BYTE *)result)
  {
    result = (_QWORD *)result[1];
    if (result)
      return (_QWORD *)H11ANEDeviceClose((uint64_t)result);
  }
  return result;
}

uint64_t H11ANE::H11ANEIsDelayedCloseFlagSet(H11ANE *this)
{
  unsigned __int8 *v1;
  unsigned __int8 v3;

  pthread_once(&H11ANE::threadTerminationKeyInitialized, (void (*)(void))H11ANE::H11ANECreateKey);
  v1 = (unsigned __int8 *)pthread_getspecific(H11ANE::threadTerminationKey);
  v3 = 0;
  if (v1)
    return *v1;
  return v3;
}

_QWORD *H11ANE::H11ANEAckCloseRequest(H11ANE *this)
{
  _QWORD *result;

  result = pthread_getspecific(H11ANE::threadTerminationKey);
  if (result)
  {
    *(_BYTE *)result = 0;
    result[1] = 0;
  }
  return result;
}

CFMutableDictionaryRef H11ANE::H11ANECreateCVBuffer(unsigned int a1, unsigned int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, char a10, __int16 a11, __int16 a12)
{
  unint64_t v16;
  OSType v17;
  const __CFAllocator *v18;
  CFMutableDictionaryRef result;
  __CFDictionary *v20;
  CFNumberRef v21;
  CFNumberRef v22;
  CFNumberRef v23;
  CFNumberRef v24;
  CFNumberRef v25;
  CFNumberRef v26;
  CFNumberRef v27;
  __CFDictionary *Mutable;
  __CFDictionary *v29;
  CFNumberRef v30;
  int v31;
  int v32;
  int v33;
  OSType pixelFormatType;
  CVPixelBufferRef pixelBufferOut;
  int v36;
  int v37;
  unsigned int v38;
  unsigned int valuePtr;

  v38 = a2;
  valuePtr = a1;
  v36 = a4;
  v37 = a3;
  pixelBufferOut = 0;
  if (a5)
  {
    if (a5 == 4)
    {
      v17 = 1278226488;
    }
    else if (a5 == 2)
    {
      HIDWORD(v16) = a12 & 0xFF0;
      LODWORD(v16) = HIDWORD(v16) - 64;
      switch((v16 >> 6))
      {
        case 0u:
          v17 = 1735549492;
          break;
        case 1u:
          v17 = 1919379252;
          break;
        case 7u:
          v17 = 1734505012;
          break;
        default:
          v17 = 1650943796;
          break;
      }
    }
    else
    {
      v17 = 2037741158;
      if (!a6)
        v17 = 2037741171;
    }
  }
  else
  {
    v17 = 875704422;
    if (!a6)
      v17 = 875704438;
  }
  pixelFormatType = v17;
  v18 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (result)
  {
    v20 = result;
    v21 = CFNumberCreate(v18, kCFNumberIntType, &valuePtr);
    CFDictionarySetValue(v20, (const void *)*MEMORY[0x24BDC5710], v21);
    CFRelease(v21);
    v33 = a7;
    v22 = CFNumberCreate(v18, kCFNumberIntType, &v33);
    CFDictionarySetValue(v20, (const void *)*MEMORY[0x24BDC55D8], v22);
    CFRelease(v22);
    v23 = CFNumberCreate(v18, kCFNumberIntType, &v38);
    CFDictionarySetValue(v20, (const void *)*MEMORY[0x24BDC5658], v23);
    CFRelease(v23);
    if (a3)
    {
      v24 = CFNumberCreate(v18, kCFNumberIntType, &v37);
      CFDictionarySetValue(v20, (const void *)*MEMORY[0x24BDC5608], v24);
      CFRelease(v24);
    }
    if (a4)
    {
      v25 = CFNumberCreate(v18, kCFNumberIntType, &v36);
      CFDictionarySetValue(v20, (const void *)*MEMORY[0x24BDC5630], v25);
      CFRelease(v25);
    }
    v26 = CFNumberCreate(v18, kCFNumberIntType, &pixelFormatType);
    CFDictionarySetValue(v20, (const void *)*MEMORY[0x24BDC56B0], v26);
    CFRelease(v26);
    v32 = a8;
    v27 = CFNumberCreate(v18, kCFNumberIntType, &v32);
    CFDictionarySetValue(v20, (const void *)*MEMORY[0x24BDC56C0], v27);
    CFRelease(v27);
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (Mutable)
    {
      v29 = Mutable;
      if (a10)
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDD8FB8], (const void *)*MEMORY[0x24BDBD268]);
      if ((a12 & 0x400) != 0)
        CFDictionarySetValue(v29, (const void *)*MEMORY[0x24BDD8FC8], (const void *)*MEMORY[0x24BDBD270]);
      v31 = a9;
      v30 = CFNumberCreate(0, kCFNumberIntType, &v31);
      CFDictionarySetValue(v29, (const void *)*MEMORY[0x24BDD8E40], v30);
      CFRelease(v30);
      CFDictionaryAddValue(v20, (const void *)*MEMORY[0x24BDC5670], v29);
      CFRelease(v29);
      CVPixelBufferCreate(v18, valuePtr, v38, pixelFormatType, v20, &pixelBufferOut);
      CFRelease(v20);
      return pixelBufferOut;
    }
    else
    {
      CFRelease(v20);
      return 0;
    }
  }
  return result;
}

CFMutableDictionaryRef H11ANE::H11ANECreateCVBufferPool(int a1, int a2, int a3, int a4, int a5, uint64_t a6, int a7, int a8, int a9, int a10, char a11, __int16 a12, __int16 a13)
{
  unint64_t v17;
  int v18;
  const __CFAllocator *v19;
  CFMutableDictionaryRef result;
  __CFDictionary *v21;
  CFNumberRef v22;
  CFNumberRef v23;
  CFNumberRef v24;
  CFNumberRef v25;
  CFNumberRef v26;
  CFNumberRef v27;
  CFNumberRef v28;
  __CFDictionary *Mutable;
  __CFDictionary *v30;
  CFNumberRef v31;
  __CFDictionary *v32;
  __CFDictionary *v33;
  const void **v34;
  const void **v35;
  CFMutableDictionaryRef v36;
  __CFDictionary *v37;
  CFNumberRef v38;
  int v39;
  int v40;
  int v41;
  int v42;
  CVPixelBufferPoolRef poolOut;
  uint64_t v44;
  int v45;
  int v46;
  int v47;
  int valuePtr;

  v47 = a2;
  valuePtr = a1;
  v45 = a4;
  v46 = a3;
  poolOut = 0;
  v44 = a6;
  if (a5)
  {
    if (a5 == 4)
    {
      v18 = 1278226488;
    }
    else if (a5 == 2)
    {
      HIDWORD(v17) = a13 & 0xFF0;
      LODWORD(v17) = HIDWORD(v17) - 64;
      switch((v17 >> 6))
      {
        case 0u:
          v18 = 1735549492;
          break;
        case 1u:
          v18 = 1919379252;
          break;
        case 7u:
          v18 = 1734505012;
          break;
        default:
          v18 = 1650943796;
          break;
      }
    }
    else
    {
      v18 = 2037741158;
      if (!a7)
        v18 = 2037741171;
    }
  }
  else
  {
    v18 = 875704422;
    if (!a7)
      v18 = 875704438;
  }
  v42 = v18;
  v19 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (result)
  {
    v21 = result;
    v22 = CFNumberCreate(v19, kCFNumberIntType, &valuePtr);
    CFDictionarySetValue(v21, (const void *)*MEMORY[0x24BDC5710], v22);
    CFRelease(v22);
    v41 = a8;
    v23 = CFNumberCreate(v19, kCFNumberIntType, &v41);
    CFDictionarySetValue(v21, (const void *)*MEMORY[0x24BDC55D8], v23);
    CFRelease(v23);
    v24 = CFNumberCreate(v19, kCFNumberIntType, &v47);
    CFDictionarySetValue(v21, (const void *)*MEMORY[0x24BDC5658], v24);
    CFRelease(v24);
    if (a3)
    {
      v25 = CFNumberCreate(v19, kCFNumberIntType, &v46);
      CFDictionarySetValue(v21, (const void *)*MEMORY[0x24BDC5608], v25);
      CFRelease(v25);
    }
    if (a4)
    {
      v26 = CFNumberCreate(v19, kCFNumberIntType, &v45);
      CFDictionarySetValue(v21, (const void *)*MEMORY[0x24BDC5630], v26);
      CFRelease(v26);
    }
    v27 = CFNumberCreate(v19, kCFNumberIntType, &v42);
    CFDictionarySetValue(v21, (const void *)*MEMORY[0x24BDC56B0], v27);
    CFRelease(v27);
    v40 = a9;
    v28 = CFNumberCreate(v19, kCFNumberIntType, &v40);
    CFDictionarySetValue(v21, (const void *)*MEMORY[0x24BDC56C0], v28);
    CFRelease(v28);
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    v30 = Mutable;
    if (a11)
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDD8FB8], (const void *)*MEMORY[0x24BDBD268]);
    if ((a13 & 0x400) != 0)
      CFDictionarySetValue(v30, (const void *)*MEMORY[0x24BDD8FC8], (const void *)*MEMORY[0x24BDBD270]);
    v39 = a10;
    v31 = CFNumberCreate(0, kCFNumberIntType, &v39);
    CFDictionarySetValue(v30, (const void *)*MEMORY[0x24BDD8E40], v31);
    CFRelease(v31);
    CFDictionaryAddValue(v21, (const void *)*MEMORY[0x24BDC5670], v30);
    CFRelease(v30);
    if (v47 == 8 || (a13 & 0x30) == 0 && !a7)
      goto LABEL_40;
    v32 = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (!v32)
      goto LABEL_40;
    v33 = v32;
    if (a7)
    {
      CFDictionarySetValue(v32, (const void *)*MEMORY[0x24BDC5428], (const void *)*MEMORY[0x24BDC5440]);
      if ((a13 & 0x10) != 0)
        v34 = (const void **)MEMORY[0x24BDC54C8];
      else
        v34 = (const void **)MEMORY[0x24BDC54A8];
      if ((a13 & 0x30) == 0)
        goto LABEL_39;
      v35 = (const void **)MEMORY[0x24BDC5598];
    }
    else
    {
      if ((a13 & 0x10) != 0)
        v34 = (const void **)MEMORY[0x24BDC54C8];
      else
        v34 = (const void **)MEMORY[0x24BDC54A8];
      if ((a13 & 0x30) == 0)
        goto LABEL_39;
      v35 = (const void **)MEMORY[0x24BDC55A0];
    }
    CFDictionarySetValue(v33, (const void *)*MEMORY[0x24BDC5578], *v35);
    CFDictionarySetValue(v33, (const void *)*MEMORY[0x24BDC5488], *v34);
    CFDictionarySetValue(v33, (const void *)*MEMORY[0x24BDC5518], (const void *)*MEMORY[0x24BDC5530]);
LABEL_39:
    CFDictionaryAddValue(v21, (const void *)*MEMORY[0x24BDC5400], v33);
    CFRelease(v33);
LABEL_40:
    v36 = CFDictionaryCreateMutable(v19, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (v36)
    {
      v37 = v36;
      v38 = CFNumberCreate(0, kCFNumberCFIndexType, &v44);
      CFDictionaryAddValue(v37, (const void *)*MEMORY[0x24BDC56E8], v38);
      CFRelease(v38);
      CVPixelBufferPoolCreate(v19, v37, v21, &poolOut);
      CFRelease(v37);
      if (poolOut)
        CVPixelBufferPoolPreAllocate();
    }
    CFRelease(v21);
    return poolOut;
  }
  return result;
}

const __CFString *H11ANE::H11ANEGetCFPreferenceNumber(const __CFString *this, const __CFString *a2, const __CFString *a3)
{
  const __CFString *v4;
  const __CFString *v5;
  CFTypeID v6;
  uint64_t IntValue;
  CFTypeID v8;
  CFTypeID v9;
  unsigned int valuePtr;

  v4 = (const __CFString *)CFPreferencesCopyValue(this, a2, (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  if (v4)
  {
    v5 = v4;
    v6 = CFGetTypeID(v4);
    if (v6 == CFStringGetTypeID())
    {
      IntValue = CFStringGetIntValue(v5);
      if ((int)IntValue <= 0)
      {
        IntValue = 1;
        if (CFStringCompare(v5, CFSTR("true"), 1uLL))
        {
          IntValue = 1;
          if (CFStringCompare(v5, CFSTR("yes"), 1uLL))
          {
            if (CFStringCompare(v5, CFSTR("false"), 1uLL) == kCFCompareEqualTo
              || CFStringCompare(v5, CFSTR("no"), 1uLL) == kCFCompareEqualTo
              || (IntValue = (uint64_t)a3, CFStringCompare(v5, CFSTR("0"), 1uLL) == kCFCompareEqualTo))
            {
              IntValue = 0;
            }
          }
        }
      }
    }
    else
    {
      v8 = CFGetTypeID(v5);
      if (v8 == CFNumberGetTypeID())
      {
        valuePtr = 0;
        if (CFNumberGetValue((CFNumberRef)v5, kCFNumberIntType, &valuePtr))
          IntValue = valuePtr;
        else
          IntValue = a3;
      }
      else
      {
        v9 = CFGetTypeID(v5);
        IntValue = (uint64_t)a3;
        if (v9 == CFBooleanGetTypeID())
          IntValue = CFEqual(v5, (CFTypeRef)*MEMORY[0x24BDBD270]);
      }
    }
    CFRelease(v5);
    return (const __CFString *)IntValue;
  }
  return a3;
}

H11ANE::H11ANECFLocalMessagePort *H11ANE::H11ANECFLocalMessagePort::H11ANECFLocalMessagePort(H11ANE::H11ANECFLocalMessagePort *this, const __CFString *a2, CFDataRef (__cdecl *a3)(CFMessagePortRef, SInt32, CFDataRef, void *), void (__cdecl *a4)(CFMessagePortRef, void *), void *a5)
{
  __CFMessagePort *v7;
  CFMessagePortContext context;

  *(_QWORD *)this = &off_24C06A9F0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  context.version = 0;
  context.info = a5;
  memset(&context.retain, 0, 24);
  v7 = CFMessagePortCreateLocal(0, a2, a3, &context, 0);
  *((_QWORD *)this + 1) = v7;
  if (a4 && v7)
    CFMessagePortSetInvalidationCallBack(v7, a4);
  return this;
}

void H11ANE::H11ANECFLocalMessagePort::~H11ANECFLocalMessagePort(H11ANE::H11ANECFLocalMessagePort *this)
{
  const void *v2;
  __CFMessagePort *v3;

  *(_QWORD *)this = &off_24C06A9F0;
  v2 = (const void *)*((_QWORD *)this + 2);
  if (v2)
    CFRelease(v2);
  v3 = (__CFMessagePort *)*((_QWORD *)this + 1);
  if (v3)
  {
    CFMessagePortInvalidate(v3);
    CFRelease(*((CFTypeRef *)this + 1));
  }
}

{
  H11ANE::H11ANECFLocalMessagePort::~H11ANECFLocalMessagePort(this);
  JUMPOUT(0x20BD010DCLL);
}

CFRunLoopSourceRef H11ANE::H11ANECFLocalMessagePort::GetRunLoopSource(H11ANE::H11ANECFLocalMessagePort *this)
{
  CFRunLoopSourceRef result;

  result = (CFRunLoopSourceRef)*((_QWORD *)this + 2);
  if (!result)
  {
    result = CFMessagePortCreateRunLoopSource(0, *((CFMessagePortRef *)this + 1), 0);
    *((_QWORD *)this + 2) = result;
  }
  return result;
}

void H11ANE::H11ANECFLocalMessagePort::SetDispatchQueue(uint64_t a1, NSObject *a2)
{
  *(_QWORD *)(a1 + 24) = a2;
  CFMessagePortSetDispatchQueue(*(CFMessagePortRef *)(a1 + 8), a2);
}

H11ANE::H11ANECFRemoteMessagePort *H11ANE::H11ANECFRemoteMessagePort::H11ANECFRemoteMessagePort(H11ANE::H11ANECFRemoteMessagePort *this, const __CFString *a2, void (__cdecl *a3)(CFMessagePortRef, void *))
{
  __CFMessagePort *Remote;

  *(_QWORD *)this = &off_24C06AA10;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  Remote = CFMessagePortCreateRemote(0, a2);
  *((_QWORD *)this + 1) = Remote;
  if (a3 && Remote)
    CFMessagePortSetInvalidationCallBack(Remote, a3);
  return this;
}

void H11ANE::H11ANECFRemoteMessagePort::~H11ANECFRemoteMessagePort(H11ANE::H11ANECFRemoteMessagePort *this)
{
  const void *v2;
  const void *v3;

  *(_QWORD *)this = &off_24C06AA10;
  v2 = (const void *)*((_QWORD *)this + 2);
  if (v2)
    CFRelease(v2);
  v3 = (const void *)*((_QWORD *)this + 1);
  if (v3)
    CFRelease(v3);
}

{
  H11ANE::H11ANECFRemoteMessagePort::~H11ANECFRemoteMessagePort(this);
  JUMPOUT(0x20BD010DCLL);
}

CFRunLoopSourceRef H11ANE::H11ANECFRemoteMessagePort::GetRunLoopSource(H11ANE::H11ANECFRemoteMessagePort *this)
{
  CFRunLoopSourceRef result;

  result = (CFRunLoopSourceRef)*((_QWORD *)this + 2);
  if (!result)
  {
    result = CFMessagePortCreateRunLoopSource(0, *((CFMessagePortRef *)this + 1), 0);
    *((_QWORD *)this + 2) = result;
  }
  return result;
}

void H11ANE::H11ANECFRemoteMessagePort::SetDispatchQueue(uint64_t a1, NSObject *a2)
{
  *(_QWORD *)(a1 + 24) = a2;
  CFMessagePortSetDispatchQueue(*(CFMessagePortRef *)(a1 + 8), a2);
}

uint64_t H11ANE::H11ANEGetMachThreadPriority(H11ANE *this, integer_t *a2, int *a3)
{
  thread_inspect_t v4;
  uint64_t v5;
  uint64_t v6;
  FILE *v7;
  const char *v8;
  size_t v9;
  integer_t v11;
  integer_t v12[5];
  integer_t v13[5];
  integer_t v14[4];
  mach_msg_type_number_t thread_info_outCnt;
  integer_t thread_info_out[5];
  int v17;

  if (!a2)
    return 3758097090;
  v4 = this;
  thread_info_outCnt = 10;
  v5 = thread_info((thread_inspect_t)this, 3u, thread_info_out, &thread_info_outCnt);
  if (!(_DWORD)v5)
  {
    switch(v17)
    {
      case 4:
        thread_info_outCnt = 4;
        v6 = thread_info(v4, 0xCu, v14, &thread_info_outCnt);
        if ((_DWORD)v6)
        {
          v7 = (FILE *)*MEMORY[0x24BDAC8D8];
          v8 = "thread_info() for THREAD_SCHED_FIFO_INFO failed";
          v9 = 47;
          goto LABEL_4;
        }
        v11 = v14[1];
        break;
      case 2:
        thread_info_outCnt = 5;
        v6 = thread_info(v4, 0xBu, v13, &thread_info_outCnt);
        if ((_DWORD)v6)
        {
          v7 = (FILE *)*MEMORY[0x24BDAC8D8];
          v8 = "thread_info() for THREAD_SCHED_RR_INFO failed\n";
          v9 = 46;
          goto LABEL_4;
        }
        v11 = v13[1];
        break;
      case 1:
        thread_info_outCnt = 5;
        v6 = thread_info(v4, 0xAu, v12, &thread_info_outCnt);
        if ((_DWORD)v6)
        {
          v7 = (FILE *)*MEMORY[0x24BDAC8D8];
          v8 = "thread_info() for THREAD_SCHED_TIMESHARE_INFO failed\n";
          v9 = 53;
          goto LABEL_4;
        }
        v11 = v12[1];
        break;
      default:
        fwrite("Unknown mach thread policy\n", 0x1BuLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
        return 0;
    }
    *a2 = v11;
    return v6;
  }
  v6 = v5;
  v7 = (FILE *)*MEMORY[0x24BDAC8D8];
  v8 = "thread_info() for THREAD_BASIC_INFO failed\n";
  v9 = 43;
LABEL_4:
  fwrite(v8, v9, 1uLL, v7);
  return v6;
}

uint64_t H11ANE::H11ANEVerifyFirmwareDigest(H11ANE *this, unint64_t a2, _QWORD *a3, unsigned __int8 *a4)
{
  CC_LONG v4;
  CC_SHA256_CTX c;
  unsigned __int8 md[8];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a2;
  v16 = *MEMORY[0x24BDAC8D0];
  if (a2 >> 25)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Computing signature for buffer %p whose size 0x%08zx is too large.  Failing. \n", this, a2);
    return 3758097090;
  }
  else
  {
    CC_SHA256_Init(&c);
    CC_SHA256_Update(&c, this, v4);
    CC_SHA256_Final(md, &c);
    return *a3 != *(_QWORD *)md || a3[1] != v13 || a3[2] != v14 || a3[3] != v15;
  }
}

uint64_t H11ANE::H11ANEInflateFirmwareBuffer(Bytef *this, unint64_t a2, Bytef **a3, unsigned __int8 **a4, unint64_t *a5)
{
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 *v12;
  Bytef *v13;
  unint64_t v14;
  uint64_t v15;
  uInt avail_out;
  z_stream strm;

  memset(&strm.zalloc, 0, 24);
  strm.avail_in = a2;
  strm.next_in = 0;
  if (HIDWORD(a2))
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Cannot initialize decompression.  Compressed buffer size %zd too large. \n", a2);
    return 4294967292;
  }
  v9 = inflateInit2_(&strm, 47, "1.2.12", 112);
  if ((_DWORD)v9)
  {
    v10 = v9;
    fwrite("Cannot initialize decompression.  Invalid input. \n", 0x32uLL, 1uLL, (FILE *)*MEMORY[0x24BDAC8D8]);
    return v10;
  }
  v12 = (unsigned __int8 *)*(unsigned int *)&this[a2 - 4];
  *a4 = v12;
  if (v12 >> 25)
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Expected size for decompressed firmware 0x%08x is larger than 0x%08x.  Failing. \n", (_DWORD)v12, 0x2000000);
    return 4294967293;
  }
  v13 = (Bytef *)operator new[]();
  *a3 = v13;
  if (!strm.avail_in)
  {
    MEMORY[0x20BD010C4]();
    *a3 = 0;
    return 0xFFFFFFFFLL;
  }
  v14 = (unint64_t)*a4;
  strm.avail_out = *a4;
  strm.next_in = this;
  strm.next_out = v13;
  if (HIDWORD(v14))
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "Cannot inflate to output buffer.  Output buffer size %zd does not match available bytes %u \n", v14, v14);
    if (*a3)
      MEMORY[0x20BD010C4](*a3, 0x1000C8077774924);
    *a3 = 0;
    return 4294967292;
  }
  v15 = inflate(&strm, 0);
  avail_out = strm.avail_out;
  inflateEnd(&strm);
  if (avail_out || (v10 = 0, (_DWORD)v15 != 1))
  {
    if (*a3)
      MEMORY[0x20BD010C4](*a3, 0x1000C8077774924);
    *a3 = 0;
    return v15;
  }
  return v10;
}

uint64_t H11ANE::getFrameFormat(H11ANE *this)
{
  if ((int)this > 1650943795)
  {
    if ((_DWORD)this == 2037741171 || (_DWORD)this == 2037741158)
    {
      return 1;
    }
    else if ((_DWORD)this == 1650943796)
    {
      return 2;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  else if ((_DWORD)this == 875704422 || (_DWORD)this == 875704438)
  {
    return 0;
  }
  else if ((_DWORD)this == 1278226488)
  {
    return 4;
  }
  else
  {
    return 0xFFFFFFFFLL;
  }
}

void H11ANE::H11ANECleanupKey(void *this, void *a2)
{
  if (this)
    free(this);
}

uint64_t ZinCreateAnalytics(unsigned int a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, unsigned int a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v10;
  _QWORD *v11;
  int v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL8 v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *Mode;
  int v31;
  int v32;
  _QWORD *v33;
  _DWORD *v34;
  _DWORD *v35;
  unsigned int v36;
  _DWORD *v37;
  _DWORD *v38;
  _DWORD *v39;
  _DWORD *v40;
  int v41;
  _DWORD *v42;
  int v43;
  void **v44;
  size_t v45;
  _DWORD *v46;
  char v47;
  _BOOL8 v48;
  uint64_t v49;
  uint64_t v50;
  _BOOL8 v51;
  uint64_t v52;
  uint64_t v53;
  _BOOL8 v54;
  uint64_t v55;
  uint64_t v56;
  _BOOL8 v57;
  uint64_t v58;
  uint64_t v59;
  _BOOL8 v60;
  uint64_t v61;
  uint64_t v62;
  _BOOL8 v63;
  uint64_t v64;
  uint64_t v65;
  _BOOL8 v66;
  uint64_t v67;
  uint64_t v68;
  _BOOL8 v69;
  uint64_t v70;
  uint64_t v71;
  unsigned int v72;
  int v73;
  int v74;
  _QWORD *v75;
  uint64_t v76;
  int v77;
  _BOOL4 v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD *v82;
  _BYTE *v83;
  _BYTE *v84;
  int v85;
  _QWORD *v86;
  unsigned int *v87;
  unsigned int *v88;
  int v89;
  unsigned int v90;
  unsigned int v91;
  unsigned int v92;
  char *v93;
  void *v94;
  void **v95;
  std::string::size_type size;
  std::string *v97;
  int v98;
  _QWORD *v99;
  _OWORD *v100;
  uint64_t v101;
  uint64_t v102;
  int v103;
  _OWORD *v104;
  uint64_t v105;
  _OWORD *v106;
  uint64_t v107;
  unint64_t v108;
  unint64_t v109;
  char *v110;
  char *v111;
  char *v112;
  std::string::size_type v113;
  std::string::size_type v114;
  _BYTE *v115;
  std::string::size_type v116;
  int i;
  unsigned int v118;
  BOOL v119;
  int v120;
  int v122;
  int v123;
  int v124;
  _QWORD *v125;
  int v126;
  int v127;
  _QWORD *v128;
  _DWORD *v129;
  unsigned int v130;
  uint64_t v131;
  uint64_t v132;
  char v133;
  uint64_t v134;
  _DWORD *v135;
  uint64_t v136;
  _DWORD *v137;
  _DWORD *v138;
  unsigned int v139;
  _DWORD *v140;
  _DWORD *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  unsigned int v147;
  unint64_t *v148;
  int *v149;
  _DWORD *v150;
  _DWORD *v151;
  int v152;
  uint64_t v153;
  uint64_t v154;
  std::string::size_type v155;
  std::string::size_type v156;
  uint64_t v157;
  int v158;
  uint64_t v159;
  int v160;
  _DWORD *v161;
  uint64_t v162;
  char v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  _BOOL8 v167;
  uint64_t v168;
  uint64_t v169;
  _BOOL8 v170;
  uint64_t v171;
  uint64_t v172;
  _BOOL8 v173;
  uint64_t v174;
  uint64_t v175;
  _BOOL8 v176;
  uint64_t v177;
  uint64_t v178;
  _BOOL8 v179;
  uint64_t v180;
  uint64_t v181;
  _QWORD *v183;
  uint64_t v184;
  unsigned int v185;
  int v186;
  _BYTE *v187;
  _QWORD *v188;
  uint64_t v189;
  _BOOL4 v190;
  _BYTE *v191;
  _OWORD *v192;
  uint64_t v193;
  void **v194;
  double v195[5];
  uint64_t v196;
  uint64_t v197;
  _QWORD v198[5];
  unsigned int v199;
  uint64_t v200;
  _BYTE v201[64];
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  unint64_t v205[3];
  char v206;
  void *__p[2];
  __int128 v208;
  _OWORD v209[2];
  uint64_t v210;
  std::string v211;
  uint8_t buf;
  char v213[15];
  void *v214;
  _BYTE *v215;
  uint64_t v216;
  void *v217;
  _BYTE *v218;
  uint64_t v219;
  uint8_t v220[4];
  int v221[3];
  uint8_t v222[4];
  int v223[3];
  uint8_t v224[4];
  int v225[3];
  uint8_t v226[4];
  int v227[3];
  uint8_t v228[4];
  int v229[3];
  uint8_t v230[4];
  int v231[3];
  uint8_t v232[4];
  int v233[3];
  uint8_t v234[4];
  int v235[3];
  uint8_t v236[4];
  int v237[3];
  uint8_t v238[4];
  int v239[3];
  uint8_t v240[4];
  int v241[3];
  uint8_t v242[4];
  int v243[3];
  uint8_t v244[4];
  int v245[3];
  uint8_t v246[4];
  int v247[3];
  uint64_t v248;

  v248 = *MEMORY[0x24BDAC8D0];
  if ((a1 & 0x80000000) == 0 && a4 && a5 && a6 && a7)
  {
    v205[0] = a6;
    v205[1] = a6;
    v205[2] = a7;
    v206 = 1;
    ANEDebugInfo::DebugInfoParser::DebugInfoParser((ANEDebugInfo::DebugInfoParser *)v201, a4, a5);
    if (ANEDebugInfo::DebugInfoParser::Parse((ANEDebugInfo::DebugInfoParser *)v201))
    {
      ANEDebugInfo::DebugInfoParser::GetCompilationUnit((ANEDebugInfo::DebugInfoParser *)v201, a1, (uint64_t)&v194);
      if (!(_BYTE)v194)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          ZinCreateAnalytics(a1, v25, v26);
        goto LABEL_242;
      }
      v10 = MemPool::alloc<_AnalyticsProcedureInfo>((uint64_t)v205, 1);
      v11 = v10;
      if (!v10)
      {
        v27 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v27)
          ZinCreateAnalytics(v27, v28, v29);
        goto LABEL_240;
      }
      *v10 = 0x400000001;
      if (a3)
        v12 = 2 * (*(_DWORD *)a3 == 2);
      else
        v12 = 0;
      Mode = (_BYTE *)ANEDebugInfo::DebugInfoInMem::GetMode((ANEDebugInfo::DebugInfoInMem *)v195);
      v31 = v12 | Mode[1];
      if (*Mode)
        v32 = v31 + 5;
      else
        v32 = v31 + 1;
      *((_DWORD *)v11 + 8) = v32;
      v33 = MemPool::alloc<unsigned long long>((uint64_t)v205, v32);
      if (!v33)
      {
        v48 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v48)
          ZinCreateAnalytics(v48, v49, v50);
        goto LABEL_238;
      }
      v11[5] = MemPool::get_offset<unsigned long long>(v205, (unint64_t)v33);
      if (a3 && *(_DWORD *)a3 == 2)
      {
        v34 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v205);
        if (!v34)
        {
          v60 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v60)
            ZinCreateAnalytics(v60, v61, v62);
          goto LABEL_238;
        }
        *v33 = MemPool::get_offset<unsigned long long>(v205, (unint64_t)v34);
        *v34 = 3;
        *((_QWORD *)v34 + 1) = *(_QWORD *)(a3 + 144);
        v35 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v205);
        if (!v35)
        {
          v66 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v66)
            ZinCreateAnalytics(v66, v67, v68);
          goto LABEL_238;
        }
        v33[1] = MemPool::get_offset<unsigned long long>(v205, (unint64_t)v35);
        *v35 = 4;
        *((_QWORD *)v35 + 1) = *(_QWORD *)(a3 + 40);
        v36 = 2;
      }
      else
      {
        v36 = 0;
      }
      if (!*(_BYTE *)ANEDebugInfo::DebugInfoInMem::GetMode((ANEDebugInfo::DebugInfoInMem *)v195))
        goto LABEL_38;
      v37 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v205);
      if (v37)
      {
        v33[v36] = MemPool::get_offset<unsigned long long>(v205, (unint64_t)v37);
        *v37 = 9;
        *((_QWORD *)v37 + 1) = v198[3];
        v38 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v205);
        if (v38)
        {
          v33[v36 | 1] = MemPool::get_offset<unsigned long long>(v205, (unint64_t)v38);
          *v38 = 12;
          *((_QWORD *)v38 + 1) = (unint64_t)v195[0];
          v39 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v205);
          if (v39)
          {
            v33[v36 + 2] = MemPool::get_offset<unsigned long long>(v205, (unint64_t)v39);
            *v39 = 13;
            *((_QWORD *)v39 + 1) = (unint64_t)v195[1];
            v40 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v205);
            if (v40)
            {
              v33[v36 + 3] = MemPool::get_offset<unsigned long long>(v205, (unint64_t)v40);
              *v40 = 14;
              *((_QWORD *)v40 + 1) = (unint64_t)v195[3];
              v36 |= 4u;
LABEL_38:
              ANEDebugInfo::DebugInfoInMem::GetString((ANEDebugInfo::DebugInfoInMem *)v195, v199, (std::string *)__p);
              v41 = BYTE7(v208);
              if (SBYTE7(v208) < 0)
                v41 = (int)__p[1];
              v42 = MemPool::alloc<signed char>((uint64_t)v205, v41 + 8);
              if (v42)
              {
                v33[v36] = MemPool::get_offset<unsigned long long>(v205, (unint64_t)v42);
                *v42 = 15;
                v43 = BYTE7(v208);
                if (SBYTE7(v208) < 0)
                  v43 = (int)__p[1];
                v42[1] = v43;
                if ((SBYTE7(v208) & 0x80u) == 0)
                  v44 = __p;
                else
                  v44 = (void **)__p[0];
                if ((SBYTE7(v208) & 0x80u) == 0)
                  v45 = BYTE7(v208);
                else
                  v45 = (size_t)__p[1];
                memcpy(v42 + 2, v44, v45);
                if (!*(_BYTE *)(ANEDebugInfo::DebugInfoInMem::GetMode((ANEDebugInfo::DebugInfoInMem *)v195) + 1))
                  goto LABEL_52;
                v46 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v205);
                if (v46)
                {
                  v33[v36 + 1] = MemPool::get_offset<unsigned long long>(v205, (unint64_t)v46);
                  *v46 = 16;
                  *((_QWORD *)v46 + 1) = v198[4];
LABEL_52:
                  v47 = 1;
                  goto LABEL_70;
                }
                v69 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                if (v69)
                  ZinCreateAnalytics(v69, v70, v71);
              }
              else
              {
                v54 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                if (v54)
                  ZinCreateAnalytics(v54, v55, v56);
              }
              v47 = 0;
LABEL_70:
              if (SBYTE7(v208) < 0)
                operator delete(__p[0]);
              if ((v47 & 1) != 0)
              {
                if (a2)
                {
                  v72 = *(_DWORD *)(a2 + 556);
                  v73 = *(_DWORD *)(a2 + 12);
                }
                else
                {
                  v72 = 0;
                  v73 = 0;
                }
                v74 = -1431655765 * ((unint64_t)(v197 - v196) >> 4);
                v75 = MemPool::alloc<unsigned long long>((uint64_t)v205, v74);
                *((_DWORD *)v11 + 3) = v73;
                *((_DWORD *)v11 + 4) = v74;
                if (v75)
                {
                  v183 = v75;
                  v11[3] = MemPool::get_offset<unsigned long long>(v205, (unint64_t)v75);
                  v76 = v196;
                  v184 = v197;
                  if (v196 == v197)
                  {
                    v21 = 1;
                    goto LABEL_243;
                  }
                  v77 = 0;
                  v78 = a2 != 0;
                  if (a2)
                    v79 = a2 + 560;
                  else
                    v79 = 0;
                  if (!v72)
                    v78 = 0;
                  v190 = v78;
                  v80 = v72;
                  v193 = v79;
                  while (1)
                  {
                    v215 = 0;
                    v214 = 0;
                    v216 = 0;
                    v81 = v76;
                    std::vector<ANEDebugInfo::DebugInfoInMem::Layer>::__init_with_size[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Layer*,ANEDebugInfo::DebugInfoInMem::Layer*>(&v214, *(const void **)v76, *(_QWORD *)(v76 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v76 + 8) - *(_QWORD *)v76) >> 2));
                    v217 = 0;
                    v218 = 0;
                    v219 = 0;
                    v189 = v81;
                    std::vector<ANEDebugInfo::DebugInfoInMem::TD>::__init_with_size[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::TD*,ANEDebugInfo::DebugInfoInMem::TD*>(&v217, *(const void **)(v81 + 24), *(_QWORD *)(v81 + 32), 0x8E38E38E38E38E39 * ((uint64_t)(*(_QWORD *)(v81 + 32) - *(_QWORD *)(v81 + 24)) >> 3));
                    v82 = MemPool::alloc<_AnalyticsGroupInfo>((uint64_t)v205, 1);
                    if (!v82)
                    {
                      if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                      {
                        v133 = 0;
                        goto LABEL_223;
                      }
                      ZinCreateAnalytics(v230, v231, v164);
                      v133 = 0;
                      goto LABEL_220;
                    }
                    v83 = v215;
                    v84 = v214;
                    v191 = v218;
                    v187 = v217;
                    v186 = v77 + 1;
                    v183[v77] = MemPool::get_offset<unsigned long long>(v205, (unint64_t)v82);
                    if (v82 <= v183)
                    {
                      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                      {
                        ZinCreateAnalytics(&buf, v213);
                        goto LABEL_219;
                      }
                      goto LABEL_221;
                    }
                    v85 = -1431655765 * ((unint64_t)(v83 - v84) >> 2);
                    *(_DWORD *)v82 = v85;
                    v86 = MemPool::alloc<unsigned long long>((uint64_t)v205, v85);
                    if (!v86)
                    {
                      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                      {
                        ZinCreateAnalytics(v228, v229, v165);
                        goto LABEL_219;
                      }
                      goto LABEL_221;
                    }
                    v82[1] = MemPool::get_offset<unsigned long long>(v205, (unint64_t)v86);
                    v87 = (unsigned int *)v214;
                    v88 = (unsigned int *)v215;
                    if (v214 != v215)
                    {
                      v89 = 0;
                      do
                      {
                        v90 = *v87;
                        v91 = v87[1];
                        v92 = v87[2];
                        v93 = (char *)MemPool::alloc<_AnalyticsLayerInfo>((uint64_t)v205, 1);
                        ANEDebugInfo::DebugInfoInMem::GetString((ANEDebugInfo::DebugInfoInMem *)v195, v90, (std::string *)__p);
                        v94 = (void *)BYTE7(v208);
                        if ((SBYTE7(v208) & 0x80u) == 0)
                          v95 = __p;
                        else
                          v95 = (void **)__p[0];
                        if (SBYTE7(v208) < 0)
                          v94 = __p[1];
                        strncpy(v93, (const char *)v95, (size_t)v94 + 1);
                        ANEDebugInfo::DebugInfoInMem::GetString((ANEDebugInfo::DebugInfoInMem *)v195, v91, &v211);
                        size = HIBYTE(v211.__r_.__value_.__r.__words[2]);
                        if ((v211.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                          v97 = &v211;
                        else
                          v97 = (std::string *)v211.__r_.__value_.__r.__words[0];
                        if ((v211.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                          size = v211.__r_.__value_.__l.__size_;
                        strncpy(v93 + 64, (const char *)v97, size + 1);
                        *((_DWORD *)v93 + 32) = v92;
                        v86[v89] = MemPool::get_offset<unsigned long long>(v205, (unint64_t)v93);
                        v79 = v193;
                        if (SHIBYTE(v211.__r_.__value_.__r.__words[2]) < 0)
                          operator delete(v211.__r_.__value_.__l.__data_);
                        if (SBYTE7(v208) < 0)
                          operator delete(__p[0]);
                        v87 += 3;
                        ++v89;
                      }
                      while (v87 != v88);
                    }
                    v98 = 954437177 * ((unint64_t)(v191 - v187) >> 3);
                    *((_DWORD *)v82 + 4) = v98;
                    v99 = MemPool::alloc<unsigned long long>((uint64_t)v205, v98);
                    if (!v99)
                    {
                      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                      {
                        ZinCreateAnalytics(v226, v227, v166);
LABEL_219:
                        v133 = 0;
                        v77 = v186;
LABEL_220:
                        v79 = v193;
                        goto LABEL_223;
                      }
LABEL_221:
                      v133 = 0;
                      goto LABEL_222;
                    }
                    v82[3] = MemPool::get_offset<unsigned long long>(v205, (unint64_t)v99);
                    v100 = v217;
                    v192 = v218;
                    if (v217 == v218)
                    {
                      v133 = 1;
                      v77 = v186;
                      if (v217)
                        goto LABEL_224;
                      goto LABEL_225;
                    }
                    v188 = v99;
                    v101 = 0;
                    do
                    {
                      v102 = v101;
                      *(_OWORD *)__p = *v100;
                      v208 = v100[1];
                      v209[0] = v100[2];
                      v209[1] = v100[3];
                      v210 = *((_QWORD *)v100 + 8);
                      v103 = (int)__p[0];
                      memset(&v211, 0, sizeof(v211));
                      if (v190)
                      {
                        v104 = 0;
                        v105 = 0;
                        do
                        {
                          v106 = (_OWORD *)(v79 + 16 * v105);
                          if (*(_DWORD *)v106 == v103)
                          {
                            if ((unint64_t)v104 >= v211.__r_.__value_.__r.__words[2])
                            {
                              v107 = (uint64_t)((uint64_t)v104 - v211.__r_.__value_.__r.__words[0]) >> 4;
                              if ((unint64_t)(v107 + 1) >> 60)
                                std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]();
                              v108 = (uint64_t)(v211.__r_.__value_.__r.__words[2] - v211.__r_.__value_.__r.__words[0]) >> 3;
                              if (v108 <= v107 + 1)
                                v108 = v107 + 1;
                              if (v211.__r_.__value_.__r.__words[2] - v211.__r_.__value_.__r.__words[0] >= 0x7FFFFFFFFFFFFFF0)
                                v109 = 0xFFFFFFFFFFFFFFFLL;
                              else
                                v109 = v108;
                              if (v109)
                                v110 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ANEHwDebugEventStruct>>((uint64_t)&v211.__r_.__value_.__r.__words[2], v109);
                              else
                                v110 = 0;
                              v111 = &v110[16 * v107];
                              *(_OWORD *)v111 = *v106;
                              v112 = (char *)v211.__r_.__value_.__l.__size_;
                              v113 = v211.__r_.__value_.__r.__words[0];
                              v114 = (std::string::size_type)v111;
                              if (v211.__r_.__value_.__l.__size_ != v211.__r_.__value_.__r.__words[0])
                              {
                                do
                                {
                                  *(_OWORD *)(v114 - 16) = *((_OWORD *)v112 - 1);
                                  v114 -= 16;
                                  v112 -= 16;
                                }
                                while (v112 != (char *)v113);
                                v112 = (char *)v211.__r_.__value_.__r.__words[0];
                              }
                              v104 = v111 + 16;
                              v211.__r_.__value_.__r.__words[0] = v114;
                              v211.__r_.__value_.__l.__size_ = (std::string::size_type)(v111 + 16);
                              v211.__r_.__value_.__r.__words[2] = (std::string::size_type)&v110[16 * v109];
                              if (v112)
                                operator delete(v112);
                            }
                            else
                            {
                              *v104++ = *v106;
                            }
                            v211.__r_.__value_.__l.__size_ = (std::string::size_type)v104;
                          }
                          ++v105;
                        }
                        while (v105 != v80);
                      }
                      v115 = (_BYTE *)ANEDebugInfo::DebugInfoInMem::GetMode((ANEDebugInfo::DebugInfoInMem *)v195);
                      v116 = v211.__r_.__value_.__r.__words[0];
                      for (i = 0; v116 != v211.__r_.__value_.__l.__size_; v116 += 16)
                      {
                        v118 = *(unsigned __int16 *)(v116 + 4);
                        v119 = v118 > 0x1D;
                        v120 = (1 << v118) & 0x20000028;
                        if (!v119 && v120 != 0)
                          ++i;
                      }
                      v122 = v115[1];
                      if (*v115)
                        v123 = v122 + 5;
                      else
                        v123 = v122 + 1;
                      if (v115[2])
                        v124 = v123 | 8;
                      else
                        v124 = v123;
                      v125 = MemPool::alloc<_AnalyticsTaskInfo>((uint64_t)v205, 1);
                      if (!v125)
                      {
                        if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                        {
                          v133 = 0;
                          v101 = v102;
                          goto LABEL_202;
                        }
                        ZinCreateAnalytics(v224, v225, v131);
                        v101 = v102;
                        goto LABEL_199;
                      }
                      v126 = v124 + i;
                      v127 = v102;
                      v188[v102] = MemPool::get_offset<unsigned long long>(v205, (unint64_t)v125);
                      *(_DWORD *)v125 = v126;
                      v128 = MemPool::alloc<unsigned long long>((uint64_t)v205, v126);
                      v101 = (v127 + 1);
                      if (!v128)
                      {
                        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                          ZinCreateAnalytics(v222, v223, v132);
LABEL_199:
                        v133 = 0;
                        goto LABEL_202;
                      }
                      v125[1] = MemPool::get_offset<unsigned long long>(v205, (unint64_t)v128);
                      v129 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v205);
                      if (v129)
                      {
                        *v128 = MemPool::get_offset<unsigned long long>(v205, (unint64_t)v129);
                        *v129 = 10;
                        v129[2] = __p[0];
                        v130 = 1;
                      }
                      else
                      {
                        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                          ZinCreateAnalytics(v232, v233, v134);
                        v130 = 0;
                      }
                      if (*(_BYTE *)(ANEDebugInfo::DebugInfoInMem::GetMode((ANEDebugInfo::DebugInfoInMem *)v195) + 1))
                      {
                        v135 = MemPool::alloc<_AnalyticsData,unsigned char>((uint64_t)v205);
                        if (v135)
                        {
                          v128[v130] = MemPool::get_offset<unsigned long long>(v205, (unint64_t)v135);
                          *v135 = 11;
                          *((_BYTE *)v135 + 8) = BYTE4(__p[0]);
                          ++v130;
                        }
                        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                        {
                          ZinCreateAnalytics(v234, v235, v136);
                        }
                      }
                      if (!*(_BYTE *)ANEDebugInfo::DebugInfoInMem::GetMode((ANEDebugInfo::DebugInfoInMem *)v195))
                        goto LABEL_173;
                      v137 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v205);
                      if (v137)
                      {
                        v128[v130] = MemPool::get_offset<unsigned long long>(v205, (unint64_t)v137);
                        *v137 = 5;
                        *((void **)v137 + 1) = __p[1];
                        v138 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v205);
                        v139 = v130 + 1;
                        if (v138)
                        {
                          v128[v139] = MemPool::get_offset<unsigned long long>(v205, (unint64_t)v138);
                          *v138 = 6;
                          *((_QWORD *)v138 + 1) = v208;
                          v140 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v205);
                          v139 = v130 + 2;
                          if (v140)
                          {
                            v128[v139] = MemPool::get_offset<unsigned long long>(v205, (unint64_t)v140);
                            *v140 = 7;
                            *((_QWORD *)v140 + 1) = *((_QWORD *)&v208 + 1);
                            v141 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v205);
                            v139 = v130 + 3;
                            if (v141)
                            {
                              v128[v139] = MemPool::get_offset<unsigned long long>(v205, (unint64_t)v141);
                              *v141 = 8;
                              *((_QWORD *)v141 + 1) = *(_QWORD *)&v209[0];
                              v130 |= 4u;
                              goto LABEL_173;
                            }
                            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                              ZinCreateAnalytics(v236, v237, v145);
                          }
                          else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                          {
                            ZinCreateAnalytics(v238, v239, v144);
                          }
                        }
                        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                        {
                          ZinCreateAnalytics(v240, v241, v143);
                        }
                        v130 = v139;
                      }
                      else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                      {
                        ZinCreateAnalytics(v242, v243, v142);
                      }
LABEL_173:
                      if (!*(_BYTE *)(ANEDebugInfo::DebugInfoInMem::GetMode((ANEDebugInfo::DebugInfoInMem *)v195) + 2))
                        goto LABEL_184;
                      v185 = v101;
                      v146 = 0;
                      v147 = v130;
                      v148 = &v128[v130 + 1];
                      v149 = (int *)v209 + 3;
                      while (1)
                      {
                        v150 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v205);
                        if (!v150)
                        {
                          v130 = v147 + v146;
                          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                          {
                            ZinCreateAnalytics(v246, v247, v153);
                            v101 = v185;
                            goto LABEL_184;
                          }
                          goto LABEL_183;
                        }
                        *(v148 - 1) = MemPool::get_offset<unsigned long long>(v205, (unint64_t)v150);
                        *v150 = 17;
                        v150[2] = *(v149 - 1);
                        v151 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v205);
                        if (!v151)
                          break;
                        *v148 = MemPool::get_offset<unsigned long long>(v205, (unint64_t)v151);
                        v148 += 2;
                        *v151 = 18;
                        v152 = *v149;
                        v149 += 2;
                        v151[2] = v152;
                        v146 += 2;
                        if (v146 == 8)
                        {
                          v130 = v147 + 8;
                          goto LABEL_183;
                        }
                      }
                      v130 = v147 + v146 + 1;
                      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                      {
                        ZinCreateAnalytics(v244, v245, v154);
                        v101 = v185;
                        goto LABEL_184;
                      }
LABEL_183:
                      v101 = v185;
LABEL_184:
                      v155 = v211.__r_.__value_.__l.__size_;
                      v156 = v211.__r_.__value_.__r.__words[0];
                      if (v211.__r_.__value_.__r.__words[0] == v211.__r_.__value_.__l.__size_)
                      {
                        v133 = 1;
                        goto LABEL_203;
                      }
                      v157 = v101;
                      while (1)
                      {
                        v158 = *(unsigned __int16 *)(v156 + 4);
                        v159 = *(_QWORD *)(v156 + 8);
                        if (v158 == 3)
                          break;
                        if (v158 == 29)
                        {
                          v160 = 19;
                          goto LABEL_192;
                        }
                        if (v158 == 5)
                        {
                          v160 = 2;
                          goto LABEL_192;
                        }
LABEL_194:
                        v156 += 16;
                        if (v156 == v155)
                        {
                          v133 = 1;
                          goto LABEL_201;
                        }
                      }
                      v160 = 1;
LABEL_192:
                      v161 = MemPool::alloc<_AnalyticsData,unsigned long long>((uint64_t)v205);
                      if (v161)
                      {
                        v128[v130] = MemPool::get_offset<unsigned long long>(v205, (unint64_t)v161);
                        *v161 = v160;
                        *((_QWORD *)v161 + 1) = v159;
                        ++v130;
                        goto LABEL_194;
                      }
                      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
                      {
                        ZinCreateAnalytics(v220, v221, v162);
                        v101 = v157;
                        goto LABEL_199;
                      }
                      v133 = 0;
LABEL_201:
                      v101 = v157;
LABEL_202:
                      v156 = v211.__r_.__value_.__r.__words[0];
LABEL_203:
                      if (v156)
                      {
                        v211.__r_.__value_.__l.__size_ = v156;
                        operator delete((void *)v156);
                      }
                      v100 = (_OWORD *)((char *)v100 + 72);
                      if (v100 == v192)
                        v163 = 0;
                      else
                        v163 = v133;
                      v79 = v193;
                    }
                    while ((v163 & 1) != 0);
LABEL_222:
                    v77 = v186;
LABEL_223:
                    v100 = v217;
                    if (v217)
                    {
LABEL_224:
                      v218 = v100;
                      operator delete(v100);
                    }
LABEL_225:
                    if (v214)
                    {
                      v215 = v214;
                      operator delete(v214);
                    }
                    if ((v133 & 1) == 0)
                      goto LABEL_234;
                    v76 = v189 + 48;
                    v21 = 1;
                    if (v189 + 48 == v184)
                    {
LABEL_243:
                      std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)&v200);
                      __p[0] = v198;
                      std::vector<std::string const>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
                      __p[0] = &v196;
                      std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
                      goto LABEL_244;
                    }
                  }
                }
                v167 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                if (v167)
                  ZinCreateAnalytics(v167, v168, v169);
LABEL_234:
                v170 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
                if (v170)
                  ZinCreateAnalytics(v170, v171, v172);
                goto LABEL_240;
              }
              goto LABEL_238;
            }
            v173 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v173)
              ZinCreateAnalytics(v173, v174, v175);
          }
          else
          {
            v63 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            if (v63)
              ZinCreateAnalytics(v63, v64, v65);
          }
        }
        else
        {
          v57 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v57)
            ZinCreateAnalytics(v57, v58, v59);
        }
      }
      else
      {
        v51 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v51)
          ZinCreateAnalytics(v51, v52, v53);
      }
LABEL_238:
      v176 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v176)
        ZinCreateAnalytics(v176, v177, v178);
LABEL_240:
      v179 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v179)
        ZinCreateAnalytics(v179, v180, v181);
LABEL_242:
      v21 = 0;
      goto LABEL_243;
    }
    v22 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v22)
      ZinCreateAnalytics(v22, v23, v24);
    v21 = 0;
LABEL_244:
    std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)&v204);
    v194 = (void **)&v203;
    std::vector<std::string const>::__destroy_vector::operator()[abi:ne180100](&v194);
    v194 = (void **)&v202;
    std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100](&v194);
    v194 = (void **)v201;
    std::vector<ANEDebugInfo::DebugInfoInMem>::__destroy_vector::operator()[abi:ne180100](&v194);
  }
  else
  {
    v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v13)
      ZinCreateAnalytics(v13, v14, v15, v16, v17, v18, v19, v20);
    return 0;
  }
  return v21;
}

void sub_207C59CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,void *a59)
{
  if (SLOBYTE(STACK[0x2A7]) < 0)
    operator delete((void *)STACK[0x290]);
  std::pair<BOOL,ANEDebugInfo::DebugInfoInMem>::~pair((uint64_t)&a37);
  ANEDebugInfo::DebugInfoParser::~DebugInfoParser(&a59);
  _Unwind_Resume(a1);
}

void sub_207C59D70()
{
  JUMPOUT(0x207C59D68);
}

uint64_t std::pair<BOOL,ANEDebugInfo::DebugInfoInMem>::~pair(uint64_t a1)
{
  void **v3;

  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table(a1 + 128);
  v3 = (void **)(a1 + 80);
  std::vector<std::string const>::__destroy_vector::operator()[abi:ne180100](&v3);
  v3 = (void **)(a1 + 48);
  std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100](&v3);
  return a1;
}

void ANEDebugInfo::DebugInfoParser::~DebugInfoParser(void **this)
{
  void **v2;

  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)(this + 18));
  v2 = this + 12;
  std::vector<std::string const>::__destroy_vector::operator()[abi:ne180100](&v2);
  v2 = this + 8;
  std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100](&v2);
  v2 = this;
  std::vector<ANEDebugInfo::DebugInfoInMem>::__destroy_vector::operator()[abi:ne180100](&v2);
}

BOOL ZinDumpAnalytics(const void *a1, uint64_t a2)
{
  _QWORD *v2;
  const std::locale::facet *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  std::locale::id *v7;
  unsigned int data;
  _QWORD *v9;
  const char *v10;
  size_t v11;
  _QWORD *v12;
  _QWORD *v13;
  __int128 *p_p;
  uint64_t v15;
  _QWORD *v16;
  const std::locale::facet *v17;
  _QWORD *v18;
  const char *v19;
  size_t v20;
  _QWORD *v21;
  _QWORD *v22;
  const std::locale::facet *v23;
  const std::locale::facet *v24;
  _QWORD *v25;
  const std::locale::facet *v26;
  _QWORD *v27;
  std::locale::id *v28;
  _QWORD *v29;
  const std::locale::facet *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  size_t v35;
  _QWORD *v36;
  _QWORD *v37;
  const std::locale::facet *v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  const std::locale::facet *v44;
  uint64_t v45;
  int v46;
  int v47;
  uint64_t v48;
  _QWORD *v49;
  const char *v50;
  size_t v51;
  _QWORD *v52;
  _QWORD *v53;
  const char *v54;
  uint64_t v55;
  _QWORD *v56;
  const std::locale::facet *v57;
  std::string *v58;
  __int128 v59;
  uint64_t v60;
  char *v61;
  std::string *v62;
  std::string::size_type v63;
  std::string *v64;
  __int128 v65;
  _QWORD *v66;
  std::string *v67;
  std::string::size_type v68;
  _QWORD *v69;
  _QWORD *v70;
  std::string *v71;
  std::string::size_type v72;
  _QWORD *v73;
  const std::locale::facet *v74;
  std::string *v75;
  __int128 v76;
  uint64_t v77;
  char *v78;
  std::string *v79;
  std::string::size_type size;
  std::string *v81;
  __int128 v82;
  _QWORD *v83;
  std::string *v84;
  std::string::size_type v85;
  _QWORD *v86;
  _QWORD *v87;
  std::string *v88;
  std::string::size_type v89;
  _QWORD *v90;
  const std::locale::facet *v91;
  std::string *v92;
  __int128 v93;
  char *v94;
  std::string *v95;
  std::string::size_type v96;
  std::string *v97;
  __int128 v98;
  _QWORD *v99;
  std::string *v100;
  std::string::size_type v101;
  _QWORD *v102;
  _QWORD *v103;
  const std::locale::facet *v104;
  _QWORD *v105;
  const char *v106;
  size_t v107;
  _QWORD *v108;
  _QWORD *v109;
  const std::locale::facet *v110;
  _BOOL8 result;
  uint64_t v112;
  uint64_t v113;
  _BOOL8 v114;
  uint64_t v115;
  uint64_t v116;
  _BOOL8 v117;
  uint64_t v118;
  uint64_t v119;
  _BOOL8 v120;
  uint64_t v121;
  uint64_t v122;
  _BOOL8 v123;
  uint64_t v124;
  uint64_t v125;
  _BOOL8 v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  std::string v132;
  std::string v133;
  std::string v134;
  uint64_t v135;
  __int128 v136;
  __int128 __p;
  unsigned int v138;
  unsigned __int8 v139;
  uint64_t v140;
  __int128 v141;
  unsigned int v142;
  uint64_t v143;
  unsigned int v144;
  uint64_t v145;
  _QWORD v146[2];
  std::string v147;
  char v148;
  uint64_t v149;

  v149 = *MEMORY[0x24BDAC8D0];
  v146[0] = a1;
  v146[1] = a2;
  if (ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsProcedureInfo>(v146, 0, &v141))
  {
    v2 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)"== Network Analytics ==", 23);
    std::ios_base::getloc((const std::ios_base *)((char *)v2 + *(_QWORD *)(*v2 - 24)));
    v3 = std::locale::use_facet((const std::locale *)&v147, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v3->__vftable[2].~facet_0)(v3, 10);
    std::locale::~locale((std::locale *)&v147);
    std::ostream::put();
    std::ostream::flush();
    if (v144)
    {
      v4 = 0;
      v5 = v146[0] + v145;
      v6 = (_QWORD *)MEMORY[0x24BEDB318];
      v7 = (std::locale::id *)MEMORY[0x24BEDB350];
      while (ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsData>(v146, *(_QWORD *)(v5 + 8 * v4), &v133))
      {
        data = v133.__r_.__value_.__l.__data_;
        if (ANEAnalytics::IsVariableLengthString((int)v133.__r_.__value_.__l.__data_))
        {
          std::vector<signed char>::vector(&v147, HIDWORD(v133.__r_.__value_.__r.__words[0]));
          memcpy(v147.__r_.__value_.__l.__data_, (const void *)(*(_QWORD *)(v5 + 8 * v4) + v146[0] + 8), HIDWORD(v133.__r_.__value_.__r.__words[0]));
          std::string::__init_with_size[abi:ne180100]<std::__wrap_iter<signed char *>,std::__wrap_iter<signed char *>>(&__p, v147.__r_.__value_.__l.__data_, (char *)v147.__r_.__value_.__l.__size_, v147.__r_.__value_.__l.__size_ - v147.__r_.__value_.__r.__words[0]);
          v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)"\t", 1);
          v10 = FieldKindToString(data);
          v11 = strlen(v10);
          v12 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v9, (uint64_t)v10, v11);
          v13 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v12, (uint64_t)":  ", 3);
          if ((v139 & 0x80u) == 0)
            p_p = &__p;
          else
            p_p = (__int128 *)__p;
          if ((v139 & 0x80u) == 0)
            v15 = v139;
          else
            v15 = *((_QWORD *)&__p + 1);
          v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v13, (uint64_t)p_p, v15);
          std::ios_base::getloc((const std::ios_base *)((char *)v16 + *(_QWORD *)(*v16 - 24)));
          v17 = std::locale::use_facet((const std::locale *)&v134, v7);
          ((void (*)(const std::locale::facet *, uint64_t))v17->__vftable[2].~facet_0)(v17, 10);
          std::locale::~locale((std::locale *)&v134);
          std::ostream::put();
          std::ostream::flush();
          if ((char)v139 < 0)
            operator delete((void *)__p);
          if (v147.__r_.__value_.__r.__words[0])
          {
            v147.__r_.__value_.__l.__size_ = v147.__r_.__value_.__r.__words[0];
            operator delete(v147.__r_.__value_.__l.__data_);
          }
        }
        else
        {
          v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v6, (uint64_t)"\t", 1);
          v19 = FieldKindToString(data);
          v20 = strlen(v19);
          v21 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, (uint64_t)v19, v20);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v21, (uint64_t)":  ", 3);
          v22 = (_QWORD *)std::ostream::operator<<();
          std::ios_base::getloc((const std::ios_base *)((char *)v22 + *(_QWORD *)(*v22 - 24)));
          v23 = std::locale::use_facet((const std::locale *)&v147, v7);
          ((void (*)(const std::locale::facet *, uint64_t))v23->__vftable[2].~facet_0)(v23, 10);
          std::locale::~locale((std::locale *)&v147);
          std::ostream::put();
          std::ostream::flush();
        }
        if (++v4 >= (unint64_t)v144)
          goto LABEL_18;
      }
      v114 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v114)
        ZinDumpAnalytics(v114, v115, v116);
    }
    else
    {
LABEL_18:
      std::ios_base::getloc((const std::ios_base *)(MEMORY[0x24BEDB318] + *(_QWORD *)(*MEMORY[0x24BEDB318] - 24)));
      v24 = std::locale::use_facet((const std::locale *)&v147, MEMORY[0x24BEDB350]);
      ((void (*)(const std::locale::facet *, uint64_t))v24->__vftable[2].~facet_0)(v24, 10);
      std::locale::~locale((std::locale *)&v147);
      std::ostream::put();
      std::ostream::flush();
      v25 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(MEMORY[0x24BEDB318], (uint64_t)"== Layer Analytics ==", 21);
      std::ios_base::getloc((const std::ios_base *)((char *)v25 + *(_QWORD *)(*v25 - 24)));
      v26 = std::locale::use_facet((const std::locale *)&v147, MEMORY[0x24BEDB350]);
      ((void (*)(const std::locale::facet *, uint64_t))v26->__vftable[2].~facet_0)(v26, 10);
      std::locale::~locale((std::locale *)&v147);
      std::ostream::put();
      std::ostream::flush();
      if (!v142)
        return 1;
      v130 = v146[0] + v143;
      v131 = 0;
      v27 = (_QWORD *)MEMORY[0x24BEDB318];
      v28 = (std::locale::id *)MEMORY[0x24BEDB350];
      while (1)
      {
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)"Group # ", 8);
        v29 = (_QWORD *)std::ostream::operator<<();
        std::ios_base::getloc((const std::ios_base *)((char *)v29 + *(_QWORD *)(*v29 - 24)));
        v30 = std::locale::use_facet((const std::locale *)&v147, v28);
        ((void (*)(const std::locale::facet *, uint64_t))v30->__vftable[2].~facet_0)(v30, 10);
        std::locale::~locale((std::locale *)&v147);
        std::ostream::put();
        std::ostream::flush();
        if (!ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsGroupInfo>(v146, *(_QWORD *)(v130 + 8 * v131), &__p))
        {
          v126 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v126)
            ZinDumpAnalytics(v126, v127, v128);
          return 0;
        }
        v31 = v146[0];
        if ((_DWORD)__p)
          break;
LABEL_26:
        if (v138)
        {
          v39 = 0;
          v40 = v31 + v140;
          v129 = v31 + v140;
          while (1)
          {
            if (!ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsTaskInfo>(v146, *(_QWORD *)(v40 + 8 * v39), &v136))
            {
              v123 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
              if (v123)
                ZinDumpAnalytics(v123, v124, v125);
              return 0;
            }
            v41 = *((_QWORD *)&v136 + 1);
            v42 = v146[0];
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)"  Task ", 7);
            v43 = (_QWORD *)std::ostream::operator<<();
            std::ios_base::getloc((const std::ios_base *)((char *)v43 + *(_QWORD *)(*v43 - 24)));
            v44 = std::locale::use_facet((const std::locale *)&v147, v28);
            ((void (*)(const std::locale::facet *, uint64_t))v44->__vftable[2].~facet_0)(v44, 10);
            std::locale::~locale((std::locale *)&v147);
            std::ostream::put();
            std::ostream::flush();
            if ((_DWORD)v136)
              break;
LABEL_122:
            ++v39;
            v40 = v129;
            if (v39 >= v138)
              goto LABEL_123;
          }
          v45 = 0;
          v46 = 0;
          v47 = 0;
          v48 = v42 + v41;
          while (ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsData>(v146, *(_QWORD *)(v48 + 8 * v45), &v135))
          {
            switch((int)v135)
            {
              case 11:
                v49 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)"\t", 1);
                v50 = FieldKindToString(v135);
                v51 = strlen(v50);
                v52 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v49, (uint64_t)v50, v51);
                v53 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v52, (uint64_t)":  ", 3);
                if ((*(_BYTE *)(v146[0] + *(_QWORD *)(v48 + 8 * v45) + 8) & 1) != 0)
                  v54 = "true";
                else
                  v54 = "false";
                if ((*(_BYTE *)(v146[0] + *(_QWORD *)(v48 + 8 * v45) + 8) & 1) != 0)
                  v55 = 4;
                else
                  v55 = 5;
                v56 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v53, (uint64_t)v54, v55);
                std::ios_base::getloc((const std::ios_base *)((char *)v56 + *(_QWORD *)(*v56 - 24)));
                v57 = std::locale::use_facet((const std::locale *)&v147, v28);
                ((void (*)(const std::locale::facet *, uint64_t))v57->__vftable[2].~facet_0)(v57, 10);
                std::locale::~locale((std::locale *)&v147);
                std::ostream::put();
                std::ostream::flush();
                break;
              case 17:
                std::to_string(&v147, v47);
                v75 = std::string::insert(&v147, 0, "_Counter", 8uLL);
                v76 = *(_OWORD *)&v75->__r_.__value_.__l.__data_;
                v134.__r_.__value_.__r.__words[2] = v75->__r_.__value_.__r.__words[2];
                *(_OWORD *)&v134.__r_.__value_.__l.__data_ = v76;
                v75->__r_.__value_.__l.__size_ = 0;
                v75->__r_.__value_.__r.__words[2] = 0;
                v75->__r_.__value_.__r.__words[0] = 0;
                if (SHIBYTE(v147.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v147.__r_.__value_.__l.__data_);
                v77 = *(_QWORD *)(v146[0] + *(_QWORD *)(v48 + 8 * v45) + 8);
                v78 = (char *)FieldKindToString(v135);
                std::string::basic_string[abi:ne180100]<0>(&v147, v78);
                if ((v134.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v79 = &v134;
                else
                  v79 = (std::string *)v134.__r_.__value_.__r.__words[0];
                if ((v134.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  size = HIBYTE(v134.__r_.__value_.__r.__words[2]);
                else
                  size = v134.__r_.__value_.__l.__size_;
                v81 = std::string::append(&v147, (const std::string::value_type *)v79, size);
                v82 = *(_OWORD *)&v81->__r_.__value_.__l.__data_;
                v133.__r_.__value_.__r.__words[2] = v81->__r_.__value_.__r.__words[2];
                *(_OWORD *)&v133.__r_.__value_.__l.__data_ = v82;
                v81->__r_.__value_.__l.__size_ = 0;
                v81->__r_.__value_.__r.__words[2] = 0;
                v81->__r_.__value_.__r.__words[0] = 0;
                if (SHIBYTE(v147.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v147.__r_.__value_.__l.__data_);
                ZinIrCompilerParamsUtils::PerfTracerCategoryToString(v77, &v147);
                if (!v148)
                  std::__throw_bad_optional_access[abi:ne180100]();
                v132 = v147;
                v83 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)"\t", 1);
                if ((v133.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v84 = &v133;
                else
                  v84 = (std::string *)v133.__r_.__value_.__r.__words[0];
                if ((v133.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v85 = HIBYTE(v133.__r_.__value_.__r.__words[2]);
                else
                  v85 = v133.__r_.__value_.__l.__size_;
                v86 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v83, (uint64_t)v84, v85);
                v87 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v86, (uint64_t)": ", 2);
                if ((v132.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v88 = &v132;
                else
                  v88 = (std::string *)v132.__r_.__value_.__r.__words[0];
                if ((v132.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v89 = HIBYTE(v132.__r_.__value_.__r.__words[2]);
                else
                  v89 = v132.__r_.__value_.__l.__size_;
                v90 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v87, (uint64_t)v88, v89);
                std::ios_base::getloc((const std::ios_base *)((char *)v90 + *(_QWORD *)(*v90 - 24)));
                v91 = std::locale::use_facet((const std::locale *)&v147, v28);
                ((void (*)(const std::locale::facet *, uint64_t))v91->__vftable[2].~facet_0)(v91, 10);
                std::locale::~locale((std::locale *)&v147);
                std::ostream::put();
                std::ostream::flush();
                if (SHIBYTE(v132.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v132.__r_.__value_.__l.__data_);
                if (SHIBYTE(v133.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v133.__r_.__value_.__l.__data_);
                if (SHIBYTE(v134.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v134.__r_.__value_.__l.__data_);
                break;
              case 18:
                std::to_string(&v147, v47);
                v58 = std::string::insert(&v147, 0, "_Counter", 8uLL);
                v59 = *(_OWORD *)&v58->__r_.__value_.__l.__data_;
                v134.__r_.__value_.__r.__words[2] = v58->__r_.__value_.__r.__words[2];
                *(_OWORD *)&v134.__r_.__value_.__l.__data_ = v59;
                v58->__r_.__value_.__l.__size_ = 0;
                v58->__r_.__value_.__r.__words[2] = 0;
                v58->__r_.__value_.__r.__words[0] = 0;
                if (SHIBYTE(v147.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v147.__r_.__value_.__l.__data_);
                v60 = *(_QWORD *)(v146[0] + *(_QWORD *)(v48 + 8 * v45) + 8);
                v61 = (char *)FieldKindToString(v135);
                std::string::basic_string[abi:ne180100]<0>(&v147, v61);
                if ((v134.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v62 = &v134;
                else
                  v62 = (std::string *)v134.__r_.__value_.__r.__words[0];
                if ((v134.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v63 = HIBYTE(v134.__r_.__value_.__r.__words[2]);
                else
                  v63 = v134.__r_.__value_.__l.__size_;
                v64 = std::string::append(&v147, (const std::string::value_type *)v62, v63);
                v65 = *(_OWORD *)&v64->__r_.__value_.__l.__data_;
                v133.__r_.__value_.__r.__words[2] = v64->__r_.__value_.__r.__words[2];
                *(_OWORD *)&v133.__r_.__value_.__l.__data_ = v65;
                v64->__r_.__value_.__l.__size_ = 0;
                v64->__r_.__value_.__r.__words[2] = 0;
                v64->__r_.__value_.__r.__words[0] = 0;
                if (SHIBYTE(v147.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v147.__r_.__value_.__l.__data_);
                ZinIrCompilerParamsUtils::PerfTracerMetricToString(v60, &v147);
                if (!v148)
                  std::__throw_bad_optional_access[abi:ne180100]();
                v132 = v147;
                v66 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)"\t", 1);
                if ((v133.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v67 = &v133;
                else
                  v67 = (std::string *)v133.__r_.__value_.__r.__words[0];
                if ((v133.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v68 = HIBYTE(v133.__r_.__value_.__r.__words[2]);
                else
                  v68 = v133.__r_.__value_.__l.__size_;
                v69 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v66, (uint64_t)v67, v68);
                v70 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v69, (uint64_t)": ", 2);
                if ((v132.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v71 = &v132;
                else
                  v71 = (std::string *)v132.__r_.__value_.__r.__words[0];
                if ((v132.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v72 = HIBYTE(v132.__r_.__value_.__r.__words[2]);
                else
                  v72 = v132.__r_.__value_.__l.__size_;
                v73 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v70, (uint64_t)v71, v72);
                std::ios_base::getloc((const std::ios_base *)((char *)v73 + *(_QWORD *)(*v73 - 24)));
                v74 = std::locale::use_facet((const std::locale *)&v147, v28);
                ((void (*)(const std::locale::facet *, uint64_t))v74->__vftable[2].~facet_0)(v74, 10);
                std::locale::~locale((std::locale *)&v147);
                std::ostream::put();
                std::ostream::flush();
                if (SHIBYTE(v132.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v132.__r_.__value_.__l.__data_);
                if (SHIBYTE(v133.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v133.__r_.__value_.__l.__data_);
                if (SHIBYTE(v134.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v134.__r_.__value_.__l.__data_);
                ++v47;
                break;
              case 19:
                std::to_string(&v134, v46);
                v92 = std::string::insert(&v134, 0, "_Counter", 8uLL);
                v93 = *(_OWORD *)&v92->__r_.__value_.__l.__data_;
                v147.__r_.__value_.__r.__words[2] = v92->__r_.__value_.__r.__words[2];
                *(_OWORD *)&v147.__r_.__value_.__l.__data_ = v93;
                v92->__r_.__value_.__l.__size_ = 0;
                v92->__r_.__value_.__r.__words[2] = 0;
                v92->__r_.__value_.__r.__words[0] = 0;
                if (SHIBYTE(v134.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v134.__r_.__value_.__l.__data_);
                v94 = (char *)FieldKindToString(v135);
                std::string::basic_string[abi:ne180100]<0>(&v133, v94);
                if ((v147.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v95 = &v147;
                else
                  v95 = (std::string *)v147.__r_.__value_.__r.__words[0];
                if ((v147.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v96 = HIBYTE(v147.__r_.__value_.__r.__words[2]);
                else
                  v96 = v147.__r_.__value_.__l.__size_;
                v97 = std::string::append(&v133, (const std::string::value_type *)v95, v96);
                v98 = *(_OWORD *)&v97->__r_.__value_.__l.__data_;
                v134.__r_.__value_.__r.__words[2] = v97->__r_.__value_.__r.__words[2];
                *(_OWORD *)&v134.__r_.__value_.__l.__data_ = v98;
                v97->__r_.__value_.__l.__size_ = 0;
                v97->__r_.__value_.__r.__words[2] = 0;
                v97->__r_.__value_.__r.__words[0] = 0;
                if (SHIBYTE(v133.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v133.__r_.__value_.__l.__data_);
                v99 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)"\t", 1);
                if ((v134.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v100 = &v134;
                else
                  v100 = (std::string *)v134.__r_.__value_.__r.__words[0];
                if ((v134.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v101 = HIBYTE(v134.__r_.__value_.__r.__words[2]);
                else
                  v101 = v134.__r_.__value_.__l.__size_;
                v102 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v99, (uint64_t)v100, v101);
                std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v102, (uint64_t)": ", 2);
                v103 = (_QWORD *)std::ostream::operator<<();
                std::ios_base::getloc((const std::ios_base *)((char *)v103 + *(_QWORD *)(*v103 - 24)));
                v104 = std::locale::use_facet((const std::locale *)&v133, v28);
                ((void (*)(const std::locale::facet *, uint64_t))v104->__vftable[2].~facet_0)(v104, 10);
                std::locale::~locale((std::locale *)&v133);
                std::ostream::put();
                std::ostream::flush();
                if (SHIBYTE(v134.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v134.__r_.__value_.__l.__data_);
                if (SHIBYTE(v147.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v147.__r_.__value_.__l.__data_);
                ++v46;
                break;
              default:
                v105 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)"\t", 1);
                v106 = FieldKindToString(v135);
                v107 = strlen(v106);
                v108 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v105, (uint64_t)v106, v107);
                std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v108, (uint64_t)":  ", 3);
                v109 = (_QWORD *)std::ostream::operator<<();
                std::ios_base::getloc((const std::ios_base *)((char *)v109 + *(_QWORD *)(*v109 - 24)));
                v110 = std::locale::use_facet((const std::locale *)&v147, v28);
                ((void (*)(const std::locale::facet *, uint64_t))v110->__vftable[2].~facet_0)(v110, 10);
                std::locale::~locale((std::locale *)&v147);
                std::ostream::put();
                std::ostream::flush();
                break;
            }
            if (++v45 >= (unint64_t)v136)
              goto LABEL_122;
          }
          v117 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v117)
            ZinDumpAnalytics(v117, v118, v119);
          return 0;
        }
LABEL_123:
        result = 1;
        if (++v131 >= (unint64_t)v142)
          return result;
      }
      v32 = 0;
      v33 = v146[0] + *((_QWORD *)&__p + 1);
      while (ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsLayerInfo>(v146, *(_QWORD *)(v33 + 8 * v32), (uint64_t)&v147))
      {
        v34 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v27, (uint64_t)"  Layer Name: ", 14);
        v35 = strlen((const char *)&v147);
        v36 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v34, (uint64_t)&v147, v35);
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v36, (uint64_t)"\t", 1);
        v37 = (_QWORD *)std::ostream::operator<<();
        std::ios_base::getloc((const std::ios_base *)((char *)v37 + *(_QWORD *)(*v37 - 24)));
        v38 = std::locale::use_facet((const std::locale *)&v134, v28);
        ((void (*)(const std::locale::facet *, uint64_t))v38->__vftable[2].~facet_0)(v38, 10);
        std::locale::~locale((std::locale *)&v134);
        std::ostream::put();
        std::ostream::flush();
        if (++v32 >= (unint64_t)__p)
        {
          v31 = v146[0];
          goto LABEL_26;
        }
      }
      v120 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v120)
        ZinDumpAnalytics(v120, v121, v122);
    }
  }
  else
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    ZinDumpAnalytics(result, v112, v113);
  }
  return 0;
}

void sub_207C5AC5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25,uint64_t a26,std::locale a27,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,void *a36,uint64_t a37,int a38,__int16 a39,char a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,std::locale a51,uint64_t a52,int a53,__int16 a54,char a55,char a56,char a57)
{
  std::locale::~locale(&a51);
  _Unwind_Resume(a1);
}

BOOL ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsProcedureInfo>(_QWORD *a1, uint64_t a2, _OWORD *a3)
{
  unint64_t v3;
  unint64_t v4;
  __int128 *v5;
  __int128 v6;
  __int128 v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a2 + 48;
  v4 = a1[1];
  if (a2 + 48 > v4)
  {
    v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v8)
      ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsProcedureInfo>(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    v5 = (__int128 *)(*a1 + a2);
    v6 = *v5;
    v7 = v5[2];
    a3[1] = v5[1];
    a3[2] = v7;
    *a3 = v6;
  }
  return v3 <= v4;
}

BOOL ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsData>(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2 + 8;
  v4 = a1[1];
  if (a2 + 8 > v4)
  {
    v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v5)
      ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsProcedureInfo>(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  else
  {
    *a3 = *(_QWORD *)(*a1 + a2);
  }
  return v3 <= v4;
}

const char *FieldKindToString(unsigned int a1)
{
  if (a1 > 0x13)
    return "Invalid";
  else
    return (&off_24C06ADA0)[a1];
}

BOOL ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsGroupInfo>(_QWORD *a1, uint64_t a2, _OWORD *a3)
{
  unint64_t v3;
  unint64_t v4;
  _OWORD *v5;
  __int128 v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2 + 32;
  v4 = a1[1];
  if (a2 + 32 > v4)
  {
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v7)
      ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsProcedureInfo>(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  else
  {
    v5 = (_OWORD *)(*a1 + a2);
    v6 = v5[1];
    *a3 = *v5;
    a3[1] = v6;
  }
  return v3 <= v4;
}

BOOL ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsLayerInfo>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a2 + 132;
  v4 = a1[1];
  if (a2 + 132 > v4)
  {
    v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v12)
      ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsProcedureInfo>(v12, v13, v14, v15, v16, v17, v18, v19);
  }
  else
  {
    v5 = *a1 + a2;
    *(_OWORD *)a3 = *(_OWORD *)v5;
    v6 = *(_OWORD *)(v5 + 16);
    v7 = *(_OWORD *)(v5 + 32);
    v8 = *(_OWORD *)(v5 + 64);
    *(_OWORD *)(a3 + 48) = *(_OWORD *)(v5 + 48);
    *(_OWORD *)(a3 + 64) = v8;
    *(_OWORD *)(a3 + 16) = v6;
    *(_OWORD *)(a3 + 32) = v7;
    v9 = *(_OWORD *)(v5 + 80);
    v10 = *(_OWORD *)(v5 + 96);
    v11 = *(_OWORD *)(v5 + 112);
    *(_DWORD *)(a3 + 128) = *(_DWORD *)(v5 + 128);
    *(_OWORD *)(a3 + 96) = v10;
    *(_OWORD *)(a3 + 112) = v11;
    *(_OWORD *)(a3 + 80) = v9;
  }
  return v3 <= v4;
}

BOOL ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsTaskInfo>(_QWORD *a1, uint64_t a2, _OWORD *a3)
{
  unint64_t v3;
  unint64_t v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2 + 16;
  v4 = a1[1];
  if (a2 + 16 > v4)
  {
    v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v5)
      ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsProcedureInfo>(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  else
  {
    *a3 = *(_OWORD *)(*a1 + a2);
  }
  return v3 <= v4;
}

uint64_t ZinDumpAnalyticsInJSON(const void *a1, uint64_t a2, const char *a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  std::ios_base *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  std::string *v32;
  __int128 v33;
  std::string *v34;
  std::string::size_type v35;
  std::string *v36;
  __int128 v37;
  std::string *v38;
  uint64_t v39;
  char *v40;
  std::string *v41;
  __int128 v42;
  std::string *v43;
  std::string::size_type size;
  std::string *v45;
  __int128 v46;
  std::string *v47;
  char *v48;
  std::string *v49;
  __int128 v50;
  std::string *v51;
  std::string::size_type v52;
  std::string *v53;
  __int128 v54;
  std::string *v55;
  char *v56;
  uint64_t v57;
  _BOOL8 v58;
  uint64_t v59;
  uint64_t v60;
  _BOOL8 v61;
  uint64_t v62;
  uint64_t v63;
  _BOOL8 v64;
  uint64_t v65;
  uint64_t v66;
  _BOOL8 v67;
  uint64_t v68;
  uint64_t v69;
  _BOOL8 v71;
  uint64_t v72;
  uint64_t v73;
  _BOOL8 v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  uint64_t v79;
  unint64_t v80;
  std::string v81;
  char v82;
  std::string v83;
  std::string v84;
  std::string v85;
  uint64_t v86;
  __int128 v87;
  _BYTE v88[4];
  int v89;
  char *v90;
  uint64_t v91;
  __int128 v92;
  uint64_t v93;
  _BYTE v94[4];
  int v95;
  uint64_t *v96;
  uint64_t v97;
  __int128 v98;
  uint64_t v99;
  __int128 v100;
  unsigned int v101;
  uint64_t v102;
  _BYTE v103[4];
  int v104;
  uint64_t *v105;
  uint64_t v106;
  __int128 v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t *__n_4;
  uint64_t v111;
  __int128 v112;
  uint64_t v113;
  void *__p;
  uint64_t *v115;
  uint64_t v116;
  __int128 v117;
  uint64_t v118;
  _BYTE v119[4];
  int v120;
  uint64_t *v121;
  uint64_t v122;
  __int128 v123;
  uint64_t v124;
  __int128 v125;
  unsigned int v126;
  uint64_t v127;
  unsigned int v128;
  uint64_t v129;
  _QWORD v130[2];
  _BYTE v131[4];
  int v132;
  uint64_t *v133;
  uint64_t v134;
  __int128 v135;
  uint64_t v136;
  void *__dst;
  char *v138;
  uint64_t v139;
  __int128 v140;
  uint64_t v141;
  float v142;
  uint64_t v143;
  _BYTE v144[408];
  _QWORD v145[22];

  v145[19] = *MEMORY[0x24BDAC8D0];
  v5 = v145;
  v6 = MEMORY[0x24BEDB840];
  v7 = MEMORY[0x24BEDB840] + 64;
  v8 = (uint64_t *)MEMORY[0x24BEDB7E8];
  v9 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 8);
  v10 = *(_QWORD *)(MEMORY[0x24BEDB7E8] + 16);
  v145[0] = MEMORY[0x24BEDB840] + 64;
  v143 = v9;
  *(_QWORD *)&v144[*(_QWORD *)(v9 - 24) - 8] = v10;
  v11 = (std::ios_base *)&v144[*(_QWORD *)(v143 - 24) - 8];
  std::ios_base::init(v11, v144);
  v11[1].__vftable = 0;
  v11[1].__fmtflags_ = -1;
  v143 = v6 + 24;
  v145[0] = v7;
  MEMORY[0x20BD00F98](v144);
  std::ofstream::open();
  v131[0] = 0;
  v132 = 0;
  v133 = &v143;
  v134 = 0;
  LOBYTE(v135) = 1;
  *((_QWORD *)&v135 + 1) = 4;
  LOBYTE(v136) = 0;
  v130[0] = a1;
  v130[1] = a2;
  if (!ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsProcedureInfo>(v130, 0, &v125))
  {
    v58 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v58)
      ZinDumpAnalyticsInJSON(v58, v59, v60);
LABEL_101:
    v57 = 0;
    goto LABEL_102;
  }
  minijson::writer::write_helper<unsigned int,minijson::default_value_writer<unsigned int,void>>((uint64_t)v131, "MajorVersion");
  minijson::writer::write_helper<unsigned int,minijson::default_value_writer<unsigned int,void>>((uint64_t)v131, "MinorVersion");
  minijson::writer::write_helper<unsigned int,minijson::default_value_writer<unsigned int,void>>((uint64_t)v131, "CpuType");
  minijson::writer::write_helper<unsigned int,minijson::default_value_writer<unsigned int,void>>((uint64_t)v131, "ProcId");
  minijson::writer::next_field((minijson::writer *)v131);
  minijson::writer::write_field_name((minijson::writer *)v131, "NetworkAnalytics");
  v123 = v135;
  v124 = v136;
  v119[0] = 0;
  v120 = 0;
  v121 = v133;
  v122 = v134 + 1;
  if (v128)
  {
    v12 = 0;
    v13 = v130[0] + v129;
    while (1)
    {
      v14 = *(_QWORD *)(v13 + 8 * v12);
      if (!ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsData>(v130, v14, &v109))
        break;
      v15 = v109;
      if (ANEAnalytics::IsVariableLengthString(v109))
      {
        std::vector<signed char>::vector(&__dst, HIDWORD(v109));
        memcpy(__dst, (const void *)(v14 + v130[0] + 8), HIDWORD(v109));
        std::string::__init_with_size[abi:ne180100]<std::__wrap_iter<signed char *>,std::__wrap_iter<signed char *>>(&__p, (char *)__dst, v138, v138 - (_BYTE *)__dst);
        v16 = (char *)FieldKindToString(v15);
        minijson::writer::write_helper<std::string,minijson::default_value_writer<std::string,void>>((uint64_t)v119, v16, (uint64_t)&__p);
        if (SHIBYTE(v116) < 0)
          operator delete(__p);
        if (__dst)
        {
          v138 = (char *)__dst;
          operator delete(__dst);
        }
      }
      else
      {
        v17 = (char *)FieldKindToString(v15);
        __dst = *(void **)(v130[0] + v14 + 8);
        minijson::writer::write_helper<unsigned long long,minijson::default_value_writer<unsigned long long,void>>((uint64_t)v119, v17);
      }
      if (++v12 >= (unint64_t)v128)
        goto LABEL_12;
    }
    v61 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v61)
      ZinDumpAnalyticsInJSON(v61, v62, v63);
    goto LABEL_101;
  }
LABEL_12:
  minijson::writer::close((minijson::writer *)v119);
  minijson::writer::next_field((minijson::writer *)v131);
  minijson::writer::write_field_name((minijson::writer *)v131, "LayerAnalytics");
  v117 = v135;
  v118 = v136;
  LOBYTE(__p) = 0;
  HIDWORD(__p) = 0;
  v115 = v133;
  v116 = v134 + 1;
  minijson::writer::next_field((minijson::writer *)&__p);
  minijson::writer::write_field_name((minijson::writer *)&__p, "Groups");
  v112 = v117;
  v113 = v118;
  LOBYTE(v109) = 1;
  HIDWORD(v109) = 0;
  __n_4 = v115;
  v111 = v116 + 1;
  if (v126)
  {
    v80 = 0;
    v79 = v130[0] + v127;
    while (1)
    {
      minijson::writer::next_field((minijson::writer *)&v109);
      v107 = v112;
      v108 = v113;
      v103[0] = 0;
      v104 = 0;
      v105 = __n_4;
      v106 = v111 + 1;
      if (!ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsGroupInfo>(v130, *(_QWORD *)(v79 + 8 * v80), &v100))
      {
        v74 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v74)
          ZinDumpAnalyticsInJSON(v74, v75, v76);
        goto LABEL_101;
      }
      v18 = *((_QWORD *)&v100 + 1);
      v19 = v130[0];
      minijson::writer::next_field((minijson::writer *)v103);
      minijson::writer::write_field_name((minijson::writer *)v103, "Layers");
      v98 = v107;
      v99 = v108;
      v94[0] = 1;
      v95 = 0;
      v96 = v105;
      v97 = v106 + 1;
      if ((_DWORD)v100)
        break;
LABEL_19:
      minijson::writer::close((minijson::writer *)v94);
      v78 = v5;
      minijson::writer::next_field((minijson::writer *)v103);
      minijson::writer::write_field_name((minijson::writer *)v103, "Tasks");
      v140 = v107;
      v141 = v108;
      LOBYTE(__dst) = 1;
      HIDWORD(__dst) = 0;
      v138 = (char *)v105;
      v139 = v106 + 1;
      if (v101)
      {
        v22 = 0;
        v23 = v130[0] + v102;
        v77 = v130[0] + v102;
        while (1)
        {
          if (!ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsTaskInfo>(v130, *(_QWORD *)(v23 + 8 * v22), &v87))
          {
            v71 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
            v5 = v78;
            if (v71)
              ZinDumpAnalyticsInJSON(v71, v72, v73);
            goto LABEL_101;
          }
          v24 = *((_QWORD *)&v87 + 1);
          v25 = v130[0];
          minijson::writer::next_field((minijson::writer *)&__dst);
          v92 = v140;
          v93 = v141;
          v88[0] = 0;
          v89 = 0;
          v90 = v138;
          v91 = v139 + 1;
          if ((_DWORD)v87)
            break;
LABEL_88:
          minijson::writer::close((minijson::writer *)v88);
          ++v22;
          v8 = (uint64_t *)MEMORY[0x24BEDB7E8];
          v23 = v77;
          if (v22 >= v101)
            goto LABEL_89;
        }
        v26 = 0;
        v27 = 0;
        v28 = 0;
        v29 = v25 + v24;
        while (ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsData>(v130, *(_QWORD *)(v29 + 8 * v26), &v86))
        {
          switch((int)v86)
          {
            case 11:
              v85.__r_.__value_.__s.__data_[0] = *(_BYTE *)(v130[0] + *(_QWORD *)(v29 + 8 * v26) + 8) & 1;
              minijson::writer::write_helper<BOOL,minijson::default_value_writer<BOOL,void>>((minijson::writer *)v88, "ViolatesMaxLatency", (unsigned __int8 *)&v85);
              break;
            case 17:
              v39 = *(_QWORD *)(v130[0] + *(_QWORD *)(v29 + 8 * v26) + 8);
              v40 = (char *)FieldKindToString(0x11u);
              std::string::basic_string[abi:ne180100]<0>(&v84, v40);
              v41 = std::string::append(&v84, "_Counter", 8uLL);
              v42 = *(_OWORD *)&v41->__r_.__value_.__l.__data_;
              v81.__r_.__value_.__r.__words[2] = v41->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v81.__r_.__value_.__l.__data_ = v42;
              v41->__r_.__value_.__l.__size_ = 0;
              v41->__r_.__value_.__r.__words[2] = 0;
              v41->__r_.__value_.__r.__words[0] = 0;
              std::to_string(&v83, v28);
              if ((v83.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v43 = &v83;
              else
                v43 = (std::string *)v83.__r_.__value_.__r.__words[0];
              if ((v83.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                size = HIBYTE(v83.__r_.__value_.__r.__words[2]);
              else
                size = v83.__r_.__value_.__l.__size_;
              v45 = std::string::append(&v81, (const std::string::value_type *)v43, size);
              v46 = *(_OWORD *)&v45->__r_.__value_.__l.__data_;
              v85.__r_.__value_.__r.__words[2] = v45->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v85.__r_.__value_.__l.__data_ = v46;
              v45->__r_.__value_.__l.__size_ = 0;
              v45->__r_.__value_.__r.__words[2] = 0;
              v45->__r_.__value_.__r.__words[0] = 0;
              if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v83.__r_.__value_.__l.__data_);
              if (SHIBYTE(v81.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v81.__r_.__value_.__l.__data_);
              if (SHIBYTE(v84.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v84.__r_.__value_.__l.__data_);
              ZinIrCompilerParamsUtils::PerfTracerCategoryToString(v39, &v81);
              if (!v82)
                std::__throw_bad_optional_access[abi:ne180100]();
              v84 = v81;
              if ((v85.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v47 = &v85;
              else
                v47 = (std::string *)v85.__r_.__value_.__r.__words[0];
              minijson::writer::write_helper<std::string,minijson::default_value_writer<std::string,void>>((uint64_t)v88, (char *)v47, (uint64_t)&v84);
              if (SHIBYTE(v84.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v84.__r_.__value_.__l.__data_);
              if (SHIBYTE(v85.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v85.__r_.__value_.__l.__data_);
              break;
            case 18:
              v30 = *(_QWORD *)(v130[0] + *(_QWORD *)(v29 + 8 * v26) + 8);
              v31 = (char *)FieldKindToString(0x12u);
              std::string::basic_string[abi:ne180100]<0>(&v84, v31);
              v32 = std::string::append(&v84, "_Counter", 8uLL);
              v33 = *(_OWORD *)&v32->__r_.__value_.__l.__data_;
              v81.__r_.__value_.__r.__words[2] = v32->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v81.__r_.__value_.__l.__data_ = v33;
              v32->__r_.__value_.__l.__size_ = 0;
              v32->__r_.__value_.__r.__words[2] = 0;
              v32->__r_.__value_.__r.__words[0] = 0;
              std::to_string(&v83, v28);
              if ((v83.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v34 = &v83;
              else
                v34 = (std::string *)v83.__r_.__value_.__r.__words[0];
              if ((v83.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v35 = HIBYTE(v83.__r_.__value_.__r.__words[2]);
              else
                v35 = v83.__r_.__value_.__l.__size_;
              v36 = std::string::append(&v81, (const std::string::value_type *)v34, v35);
              v37 = *(_OWORD *)&v36->__r_.__value_.__l.__data_;
              v85.__r_.__value_.__r.__words[2] = v36->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v85.__r_.__value_.__l.__data_ = v37;
              v36->__r_.__value_.__l.__size_ = 0;
              v36->__r_.__value_.__r.__words[2] = 0;
              v36->__r_.__value_.__r.__words[0] = 0;
              if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v83.__r_.__value_.__l.__data_);
              if (SHIBYTE(v81.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v81.__r_.__value_.__l.__data_);
              if (SHIBYTE(v84.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v84.__r_.__value_.__l.__data_);
              ZinIrCompilerParamsUtils::PerfTracerMetricToString(v30, &v81);
              if (!v82)
                std::__throw_bad_optional_access[abi:ne180100]();
              v84 = v81;
              if ((v85.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v38 = &v85;
              else
                v38 = (std::string *)v85.__r_.__value_.__r.__words[0];
              minijson::writer::write_helper<std::string,minijson::default_value_writer<std::string,void>>((uint64_t)v88, (char *)v38, (uint64_t)&v84);
              if (SHIBYTE(v84.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v84.__r_.__value_.__l.__data_);
              if (SHIBYTE(v85.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v85.__r_.__value_.__l.__data_);
              ++v28;
              break;
            case 19:
              v48 = (char *)FieldKindToString(0x13u);
              std::string::basic_string[abi:ne180100]<0>(&v84, v48);
              v49 = std::string::append(&v84, "_Counter", 8uLL);
              v50 = *(_OWORD *)&v49->__r_.__value_.__l.__data_;
              v85.__r_.__value_.__r.__words[2] = v49->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v85.__r_.__value_.__l.__data_ = v50;
              v49->__r_.__value_.__l.__size_ = 0;
              v49->__r_.__value_.__r.__words[2] = 0;
              v49->__r_.__value_.__r.__words[0] = 0;
              std::to_string(&v83, v27);
              if ((v83.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v51 = &v83;
              else
                v51 = (std::string *)v83.__r_.__value_.__r.__words[0];
              if ((v83.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v52 = HIBYTE(v83.__r_.__value_.__r.__words[2]);
              else
                v52 = v83.__r_.__value_.__l.__size_;
              v53 = std::string::append(&v85, (const std::string::value_type *)v51, v52);
              v54 = *(_OWORD *)&v53->__r_.__value_.__l.__data_;
              v81.__r_.__value_.__r.__words[2] = v53->__r_.__value_.__r.__words[2];
              *(_OWORD *)&v81.__r_.__value_.__l.__data_ = v54;
              v53->__r_.__value_.__l.__size_ = 0;
              v53->__r_.__value_.__r.__words[2] = 0;
              v53->__r_.__value_.__r.__words[0] = 0;
              if (SHIBYTE(v83.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v83.__r_.__value_.__l.__data_);
              if (SHIBYTE(v85.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v85.__r_.__value_.__l.__data_);
              if (SHIBYTE(v84.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v84.__r_.__value_.__l.__data_);
              if ((v81.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v55 = &v81;
              else
                v55 = (std::string *)v81.__r_.__value_.__r.__words[0];
              minijson::writer::write_helper<unsigned long long,minijson::default_value_writer<unsigned long long,void>>((uint64_t)v88, (char *)v55);
              if (SHIBYTE(v81.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v81.__r_.__value_.__l.__data_);
              ++v27;
              break;
            default:
              v56 = (char *)FieldKindToString(v86);
              v81.__r_.__value_.__r.__words[0] = *(_QWORD *)(v130[0] + *(_QWORD *)(v29 + 8 * v26) + 8);
              minijson::writer::write_helper<unsigned long long,minijson::default_value_writer<unsigned long long,void>>((uint64_t)v88, v56);
              break;
          }
          if (++v26 >= (unint64_t)v87)
            goto LABEL_88;
        }
        v64 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        v5 = v78;
        v8 = (uint64_t *)MEMORY[0x24BEDB7E8];
        if (v64)
          ZinDumpAnalyticsInJSON(v64, v65, v66);
        goto LABEL_101;
      }
LABEL_89:
      minijson::writer::close((minijson::writer *)&__dst);
      minijson::writer::close((minijson::writer *)v103);
      ++v80;
      v5 = v78;
      if (v80 >= v126)
        goto LABEL_90;
    }
    v20 = 0;
    v21 = v19 + v18;
    while (ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsLayerInfo>(v130, *(_QWORD *)(v21 + 8 * v20), (uint64_t)&__dst))
    {
      minijson::writer::next_field((minijson::writer *)v94);
      v92 = v98;
      v93 = v99;
      v88[0] = 0;
      v89 = 0;
      v90 = (char *)v96;
      v91 = v97 + 1;
      minijson::writer::write_helper<char [64],minijson::default_value_writer<char [64],void>>((uint64_t)v88, "Name", (unsigned __int8 *)&__dst);
      minijson::writer::write_helper<float,minijson::default_value_writer<float,void>>((minijson::writer *)v88, "Weight", &v142);
      minijson::writer::close((minijson::writer *)v88);
      if (++v20 >= (unint64_t)v100)
        goto LABEL_19;
    }
    v67 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v67)
      ZinDumpAnalyticsInJSON(v67, v68, v69);
    goto LABEL_101;
  }
LABEL_90:
  minijson::writer::close((minijson::writer *)&v109);
  minijson::writer::close((minijson::writer *)&__p);
  minijson::writer::close((minijson::writer *)v131);
  if (!std::filebuf::close())
    std::ios_base::clear((std::ios_base *)&v144[*(_QWORD *)(v143 - 24) - 8], *(_DWORD *)&v144[*(_QWORD *)(v143 - 24) + 24] | 4);
  v57 = 1;
LABEL_102:
  v143 = *v8;
  *(_QWORD *)&v144[*(_QWORD *)(v143 - 24) - 8] = v8[3];
  MEMORY[0x20BD00FA4](v144);
  std::ostream::~ostream();
  MEMORY[0x20BD010A0](v5);
  return v57;
}

void sub_207C5BBBC(_Unwind_Exception *a1)
{
  std::ofstream::~ofstream(&STACK[0x310]);
  _Unwind_Resume(a1);
}

minijson::writer *minijson::writer::close(minijson::writer *this)
{
  minijson::writer *v1;

  if (*((_DWORD *)this + 1) != 2)
  {
    v1 = this;
    if (!*((_DWORD *)v1 + 1))
      minijson::writer::write_opening_bracket(v1);
    this = (minijson::writer *)minijson::writer::write_closing_bracket(v1);
    *((_DWORD *)v1 + 1) = 2;
  }
  return this;
}

_QWORD *std::ofstream::~ofstream(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BEDB7E8];
  v3 = *MEMORY[0x24BEDB7E8];
  *a1 = *MEMORY[0x24BEDB7E8];
  *(_QWORD *)((char *)a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 24);
  MEMORY[0x20BD00FA4](a1 + 1);
  std::ostream::~ostream();
  MEMORY[0x20BD010A0](a1 + 52);
  return a1;
}

uint64_t ZinComputeAnalyticsBufferSize(unsigned int a1, const unsigned __int8 *a2, unsigned int a3, int a4, uint64_t a5)
{
  _BYTE *Mode;
  int v9;
  int v10;
  int v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  std::string v31;
  void **v32;
  _BYTE v33[40];
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  unsigned int v37;
  uint64_t v38;
  _BYTE v39[64];
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  if ((a1 & 0x80000000) == 0 && a2 && a3)
  {
    ANEDebugInfo::DebugInfoParser::DebugInfoParser((ANEDebugInfo::DebugInfoParser *)v39, a2, a3);
    ANEDebugInfo::DebugInfoParser::Parse((ANEDebugInfo::DebugInfoParser *)v39);
    ANEDebugInfo::DebugInfoParser::GetCompilationUnit((ANEDebugInfo::DebugInfoParser *)v39, a1, (uint64_t)&v32);
    if ((_BYTE)v32)
    {
      Mode = (_BYTE *)ANEDebugInfo::DebugInfoInMem::GetMode((ANEDebugInfo::DebugInfoInMem *)v33);
      v9 = Mode[1] + a4;
      if (*Mode)
        v10 = v9 + 5;
      else
        v10 = v9 + 1;
      ANEDebugInfo::DebugInfoInMem::GetString((ANEDebugInfo::DebugInfoInMem *)v33, v37, &v31);
      if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
      {
        v11 = v31.__r_.__value_.__r.__words[1];
        operator delete(v31.__r_.__value_.__l.__data_);
      }
      else
      {
        v11 = HIBYTE(v31.__r_.__value_.__r.__words[2]);
      }
      v23 = (_BYTE *)ANEDebugInfo::DebugInfoInMem::GetMode((ANEDebugInfo::DebugInfoInMem *)v33);
      LODWORD(v24) = ((v11 + 7) & 0xFFFFFFF8) + 16 * v10 + 48;
      v25 = v23[1];
      if (*v23)
        v26 = v25 + 5;
      else
        v26 = v25 + 1;
      v27 = v26 | 8;
      if (!v23[2])
        v27 = v26;
      v28 = v34;
      if (v34 != v35)
      {
        v29 = 24 * (v27 + a5) + 24;
        do
        {
          v24 = v24
              + 48 * ((v28[1] - *v28) >> 2)
              + 40
              - 0x71C71C71C71C71C7 * ((uint64_t)(v28[4] - v28[3]) >> 3) * v29;
          v28 += 6;
        }
        while (v28 != v35);
      }
      v20 = v24;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ZinCreateAnalytics(a1, v21, v22);
      v20 = 0;
    }
    std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)&v38);
    v31.__r_.__value_.__r.__words[0] = (std::string::size_type)&v36;
    std::vector<std::string const>::__destroy_vector::operator()[abi:ne180100]((void ***)&v31);
    v31.__r_.__value_.__r.__words[0] = (std::string::size_type)&v34;
    std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100]((void ***)&v31);
    std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)&v42);
    v32 = (void **)&v41;
    std::vector<std::string const>::__destroy_vector::operator()[abi:ne180100](&v32);
    v32 = (void **)&v40;
    std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100](&v32);
    v32 = (void **)v39;
    std::vector<ANEDebugInfo::DebugInfoInMem>::__destroy_vector::operator()[abi:ne180100](&v32);
  }
  else
  {
    v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v12)
      ZinComputeAnalyticsBufferSize(v12, v13, v14, v15, v16, v17, v18, v19);
    return 0;
  }
  return v20;
}

void sub_207C5C028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35)
{
  std::pair<BOOL,ANEDebugInfo::DebugInfoInMem>::~pair((uint64_t)&a13);
  ANEDebugInfo::DebugInfoParser::~DebugInfoParser(&a35);
  _Unwind_Resume(a1);
}

uint64_t ZinAnalyticsGetPerfCounterInfo(const unsigned __int8 *a1, unsigned int a2, char (*a3)[128])
{
  unint64_t v4;
  BOOL v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  int *v16;
  const char *v17;
  const char *v18;
  uint64_t j;
  int v20;
  unsigned int v21;
  char v23;
  _OWORD v24[2];
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  _QWORD v33[2];
  _QWORD v34[2];
  int v35;
  __int16 v36;
  char v37;
  void **v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  __int16 v54;
  char v55;
  _BYTE v56[64];
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void **v60[3];

  *(_OWORD *)&(*a3)[480] = 0u;
  *(_OWORD *)&(*a3)[496] = 0u;
  *(_OWORD *)&(*a3)[448] = 0u;
  *(_OWORD *)&(*a3)[464] = 0u;
  *(_OWORD *)&(*a3)[416] = 0u;
  *(_OWORD *)&(*a3)[432] = 0u;
  *(_OWORD *)&(*a3)[384] = 0u;
  *(_OWORD *)&(*a3)[400] = 0u;
  *(_OWORD *)&(*a3)[352] = 0u;
  *(_OWORD *)&(*a3)[368] = 0u;
  *(_OWORD *)&(*a3)[320] = 0u;
  *(_OWORD *)&(*a3)[336] = 0u;
  *(_OWORD *)&(*a3)[288] = 0u;
  *(_OWORD *)&(*a3)[304] = 0u;
  *(_OWORD *)&(*a3)[256] = 0u;
  *(_OWORD *)&(*a3)[272] = 0u;
  *(_OWORD *)&(*a3)[224] = 0u;
  *(_OWORD *)&(*a3)[240] = 0u;
  *(_OWORD *)&(*a3)[192] = 0u;
  *(_OWORD *)&(*a3)[208] = 0u;
  *(_OWORD *)&(*a3)[160] = 0u;
  *(_OWORD *)&(*a3)[176] = 0u;
  *(_OWORD *)&(*a3)[128] = 0u;
  *(_OWORD *)&(*a3)[144] = 0u;
  *(_OWORD *)&(*a3)[96] = 0u;
  *(_OWORD *)&(*a3)[112] = 0u;
  *(_OWORD *)&(*a3)[64] = 0u;
  *(_OWORD *)&(*a3)[80] = 0u;
  *(_OWORD *)&(*a3)[32] = 0u;
  *(_OWORD *)&(*a3)[48] = 0u;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)&(*a3)[16] = 0u;
  ANEDebugInfo::DebugInfoParser::DebugInfoParser((ANEDebugInfo::DebugInfoParser *)v56, a1, a2);
  if (ANEDebugInfo::DebugInfoParser::Parse((ANEDebugInfo::DebugInfoParser *)v56))
  {
    v4 = 0;
    v5 = 0;
    while (1)
    {
      ANEDebugInfo::DebugInfoParser::GetCompilationUnit((ANEDebugInfo::DebugInfoParser *)v56, v4, (uint64_t)&v38);
      v6 = v38;
      std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)&v49);
      *(_QWORD *)&v24[0] = &v45;
      std::vector<std::string const>::__destroy_vector::operator()[abi:ne180100]((void ***)v24);
      *(_QWORD *)&v24[0] = &v42;
      std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100]((void ***)v24);
      if (!v6)
        break;
      ANEDebugInfo::DebugInfoParser::GetCompilationUnit((ANEDebugInfo::DebugInfoParser *)v56, v4, (uint64_t)&v38);
      v24[0] = v39;
      v24[1] = v40;
      v25 = v41;
      v26 = v42;
      v7 = v43;
      v43 = 0;
      v42 = 0uLL;
      v27 = v7;
      v28 = v44;
      v29 = v45;
      v45 = 0uLL;
      v8 = v46;
      v9 = v49;
      v46 = 0;
      v32 = v48;
      v31 = v47;
      v30 = v8;
      v10 = v50;
      v49 = 0;
      v50 = 0;
      v33[0] = v9;
      v33[1] = v10;
      v34[0] = v51;
      v34[1] = v52;
      v35 = v53;
      if (v52)
      {
        v11 = *(_QWORD *)(v51 + 8);
        if ((v10 & (v10 - 1)) != 0)
        {
          if (v11 >= v10)
            v11 %= v10;
        }
        else
        {
          v11 &= v10 - 1;
        }
        *(_QWORD *)(v9 + 8 * v11) = v34;
        v51 = 0;
        v52 = 0;
      }
      v36 = v54;
      v37 = v55;
      std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)&v49);
      v60[0] = (void **)&v45;
      std::vector<std::string const>::__destroy_vector::operator()[abi:ne180100](v60);
      v60[0] = (void **)&v42;
      std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100](v60);
      v12 = *((_QWORD *)&v26 + 1);
      for (i = v26; ; i += 48)
      {
        if (i == v12)
        {
          v21 = 1;
          goto LABEL_29;
        }
        v14 = *(_QWORD *)(i + 24);
        if (*(_QWORD *)(i + 32) != v14)
        {
          v15 = 0;
          v16 = (int *)(v14 + 44);
          do
          {
            v17 = (const char *)*(&PerfTracerCategoryToString(int)::perf_tracer_category_to_string + *(v16 - 1));
            if (*v17)
            {
              v18 = (const char *)*(&PerfTracerMetricToString(int)::perf_tracer_metric_to_string + *v16);
              if (*v18)
              {
                if (strlcat(&(*a3)[v15], v17, 0x80uLL) > 0x7F
                  || strlcat(&(*a3)[v15], ":", 0x80uLL) > 0x7F
                  || strlcat(&(*a3)[v15], v18, 0x80uLL) > 0x7F)
                {
                  v21 = 0;
                  v23 = 0;
                  goto LABEL_29;
                }
              }
            }
            v16 += 2;
            v15 += 128;
          }
          while (v15 != 512);
          for (j = 0; j != 4; ++j)
          {
            while (v5)
            {
              ++j;
              v5 = 1;
              if (j == 4)
              {
                v21 = 0;
                v23 = 1;
                goto LABEL_29;
              }
            }
            v20 = (*a3)[128 * j];
            v5 = (*a3)[128 * j] != 0;
          }
          v5 = 0;
          if (v20)
            break;
        }
      }
      v23 = 1;
      v21 = 0;
      v5 = 1;
LABEL_29:
      v4 += v21;
      std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)v33);
      v38 = (void **)&v29;
      std::vector<std::string const>::__destroy_vector::operator()[abi:ne180100](&v38);
      v38 = (void **)&v26;
      std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100](&v38);
      if ((v21 & 1) == 0)
        goto LABEL_33;
    }
  }
  v23 = 0;
LABEL_33:
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)&v59);
  v38 = (void **)&v58;
  std::vector<std::string const>::__destroy_vector::operator()[abi:ne180100](&v38);
  v38 = (void **)&v57;
  std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100](&v38);
  v38 = (void **)v56;
  std::vector<ANEDebugInfo::DebugInfoInMem>::__destroy_vector::operator()[abi:ne180100](&v38);
  return v23 & 1;
}

void sub_207C5C454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  void *a66;

  ANEDebugInfo::DebugInfoParser::~DebugInfoParser(&a66);
  _Unwind_Resume(a1);
}

void ANEDebugInfo::DebugInfoInMem::~DebugInfoInMem(ANEDebugInfo::DebugInfoInMem *this)
{
  void **v2;

  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)this + 120);
  v2 = (void **)((char *)this + 72);
  std::vector<std::string const>::__destroy_vector::operator()[abi:ne180100](&v2);
  v2 = (void **)((char *)this + 40);
  std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100](&v2);
}

void *MemPool::alloc<_AnalyticsProcedureInfo>(uint64_t a1, int a2)
{
  size_t v2;
  void *v3;
  uint64_t v4;
  size_t v5;

  v2 = (48 * a2);
  v3 = *(void **)a1;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)a1 + v2;
  *(_QWORD *)a1 = v5;
  if (v5 <= v4 + *(_QWORD *)(a1 + 16))
  {
    if (*(_BYTE *)(a1 + 24))
      bzero(v3, v2);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      MemPool::alloc<_AnalyticsProcedureInfo>();
    return 0;
  }
  return v3;
}

void *MemPool::alloc<unsigned long long>(uint64_t a1, int a2)
{
  size_t v2;
  void *v3;
  uint64_t v4;
  size_t v5;

  v2 = (8 * a2);
  v3 = *(void **)a1;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)a1 + v2;
  *(_QWORD *)a1 = v5;
  if (v5 <= v4 + *(_QWORD *)(a1 + 16))
  {
    if (*(_BYTE *)(a1 + 24))
      bzero(v3, v2);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      MemPool::alloc<_AnalyticsProcedureInfo>();
    return 0;
  }
  return v3;
}

unint64_t MemPool::get_offset<unsigned long long>(unint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v2 = a1[1];
  if (v2 <= a2 && *a1 >= a2)
    return a2 - v2;
  v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v3)
    MemPool::get_offset<unsigned long long>(v3, v4, v5, v6, v7, v8, v9, v10);
  return 0;
}

_DWORD *MemPool::alloc<_AnalyticsData,unsigned long long>(uint64_t a1)
{
  _DWORD *result;
  _DWORD *v3;

  result = MemPool::alloc<unsigned long long>(a1, 1);
  if (result)
  {
    v3 = result;
    result[1] = 8;
    if (MemPool::alloc<signed char>(a1, 8))
      return v3;
    else
      return 0;
  }
  return result;
}

void *MemPool::alloc<signed char>(uint64_t a1, int a2)
{
  size_t v2;
  void *v3;
  uint64_t v4;
  size_t v5;

  v2 = (a2 + 7) & 0xFFFFFFF8;
  v3 = *(void **)a1;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)a1 + v2;
  *(_QWORD *)a1 = v5;
  if (v5 <= v4 + *(_QWORD *)(a1 + 16))
  {
    if (*(_BYTE *)(a1 + 24))
      bzero(v3, v2);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      MemPool::alloc<_AnalyticsProcedureInfo>();
    return 0;
  }
  return v3;
}

void ANEDebugInfo::DebugInfoInMem::Group::~Group(ANEDebugInfo::DebugInfoInMem::Group *this)
{
  void *v2;
  void *v3;

  v2 = (void *)*((_QWORD *)this + 3);
  if (v2)
  {
    *((_QWORD *)this + 4) = v2;
    operator delete(v2);
  }
  v3 = *(void **)this;
  if (*(_QWORD *)this)
  {
    *((_QWORD *)this + 1) = v3;
    operator delete(v3);
  }
}

_QWORD *std::vector<ANEDebugInfo::DebugInfoInMem::Layer>::__init_with_size[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Layer*,ANEDebugInfo::DebugInfoInMem::Layer*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<ANEDebugInfo::DebugInfoInMem::Layer>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_207C5C78C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<ANEDebugInfo::DebugInfoInMem::Layer>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x1555555555555556)
    std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem::Layer>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[12 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem::Layer>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1555555555555556)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(12 * a2);
}

_QWORD *std::vector<ANEDebugInfo::DebugInfoInMem::TD>::__init_with_size[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::TD*,ANEDebugInfo::DebugInfoInMem::TD*>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<ANEDebugInfo::DebugInfoInMem::TD>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_207C5C898(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<ANEDebugInfo::DebugInfoInMem::TD>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x38E38E38E38E38FLL)
    std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem::TD>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[72 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem::TD>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x38E38E38E38E38FLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(72 * a2);
}

void *MemPool::alloc<_AnalyticsGroupInfo>(uint64_t a1, int a2)
{
  size_t v2;
  void *v3;
  uint64_t v4;
  size_t v5;

  v2 = (32 * a2);
  v3 = *(void **)a1;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)a1 + v2;
  *(_QWORD *)a1 = v5;
  if (v5 <= v4 + *(_QWORD *)(a1 + 16))
  {
    if (*(_BYTE *)(a1 + 24))
      bzero(v3, v2);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      MemPool::alloc<_AnalyticsProcedureInfo>();
    return 0;
  }
  return v3;
}

void *MemPool::alloc<_AnalyticsLayerInfo>(uint64_t a1, int a2)
{
  size_t v2;
  void *v3;
  uint64_t v4;
  size_t v5;

  v2 = (132 * a2 + 7) & 0xFFFFFFF8;
  v3 = *(void **)a1;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)a1 + v2;
  *(_QWORD *)a1 = v5;
  if (v5 <= v4 + *(_QWORD *)(a1 + 16))
  {
    if (*(_BYTE *)(a1 + 24))
      bzero(v3, v2);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      MemPool::alloc<_AnalyticsProcedureInfo>();
    return 0;
  }
  return v3;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ANEHwDebugEventStruct>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

void *MemPool::alloc<_AnalyticsTaskInfo>(uint64_t a1, int a2)
{
  size_t v2;
  void *v3;
  uint64_t v4;
  size_t v5;

  v2 = (16 * a2);
  v3 = *(void **)a1;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)a1 + v2;
  *(_QWORD *)a1 = v5;
  if (v5 <= v4 + *(_QWORD *)(a1 + 16))
  {
    if (*(_BYTE *)(a1 + 24))
      bzero(v3, v2);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      MemPool::alloc<_AnalyticsProcedureInfo>();
    return 0;
  }
  return v3;
}

_DWORD *MemPool::alloc<_AnalyticsData,unsigned char>(uint64_t a1)
{
  _DWORD *result;
  _DWORD *v3;

  result = MemPool::alloc<unsigned long long>(a1, 1);
  if (result)
  {
    v3 = result;
    result[1] = 1;
    if (MemPool::alloc<signed char>(a1, 1))
      return v3;
    else
      return 0;
  }
  return result;
}

void std::vector<ANEDebugInfo::DebugInfoInMem>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 168;
        std::__destroy_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem,0>(v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem,0>(uint64_t a1)
{
  void **v2;

  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table(a1 + 120);
  v2 = (void **)(a1 + 72);
  std::vector<std::string const>::__destroy_vector::operator()[abi:ne180100](&v2);
  v2 = (void **)(a1 + 40);
  std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100](&v2);
}

_QWORD *std::vector<signed char>::vector(_QWORD *a1, size_t a2)
{
  char *v4;
  char *v5;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<signed char>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    v5 = &v4[a2];
    bzero(v4, a2);
    a1[1] = v5;
  }
  return a1;
}

void sub_207C5CC70(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<signed char>::__vallocate[abi:ne180100](_QWORD *a1, size_t __sz)
{
  char *result;

  if ((__sz & 0x8000000000000000) != 0)
    std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]();
  result = (char *)operator new(__sz);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[__sz];
  return result;
}

_QWORD *std::string::__init_with_size[abi:ne180100]<std::__wrap_iter<signed char *>,std::__wrap_iter<signed char *>>(_QWORD *result, char *a2, char *a3, unint64_t a4)
{
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v4 = result;
  if (a4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (a4 > 0x16)
  {
    v8 = (a4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a4 | 7) != 0x17)
      v8 = a4 | 7;
    v9 = v8 + 1;
    result = operator new(v8 + 1);
    v4[1] = a4;
    v4[2] = v9 | 0x8000000000000000;
    *v4 = result;
    v4 = result;
  }
  else
  {
    *((_BYTE *)result + 23) = a4;
  }
  while (a2 != a3)
  {
    v10 = *a2++;
    *(_BYTE *)v4 = v10;
    v4 = (_QWORD *)((char *)v4 + 1);
  }
  *(_BYTE *)v4 = 0;
  return result;
}

void std::__throw_bad_optional_access[abi:ne180100]()
{
  _QWORD *exception;

  exception = __cxa_allocate_exception(8uLL);
  *exception = MEMORY[0x24BEDB8E0] + 16;
  __cxa_throw(exception, MEMORY[0x24BEDB740], MEMORY[0x24BEDABA8]);
}

void minijson::detail::`anonymous namespace'::adjust_stream_settings(uint64_t *a1)
{
  std::ios_base *v2;
  const std::locale *v3;
  std::locale *rdbuf;
  std::locale *v5;
  uint64_t v6;
  std::locale v7;
  std::locale v8;
  std::locale v9;

  v2 = (std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24));
  v3 = std::locale::classic();
  std::ios_base::getloc(v2);
  std::ios_base::imbue(v2, v3);
  std::locale::~locale(&v9);
  rdbuf = (std::locale *)v2->__rdbuf_;
  if (rdbuf)
  {
    (*((void (**)(std::locale *, const std::locale *))rdbuf->__locale_ + 2))(rdbuf, v3);
    v5 = rdbuf + 1;
    std::locale::locale(&v8, v5);
    std::locale::operator=(v5, v3);
    std::locale::~locale(&v8);
  }
  std::locale::~locale(&v7);
  v6 = *a1;
  *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 8) &= 0xFFFFF3FF;
  *(_DWORD *)((char *)a1 + *(_QWORD *)(v6 - 24) + 8) = *(_DWORD *)((_BYTE *)a1 + *(_QWORD *)(v6 - 24) + 8) & 0xFFFFFFB5 | 2;
  *(uint64_t *)((char *)a1 + *(_QWORD *)(v6 - 24) + 24) = 0;
}

void sub_207C5CE90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
  std::locale::~locale(&a10);
  _Unwind_Resume(a1);
}

uint64_t minijson::writer::next_field(minijson::writer *this)
{
  int v2;
  _QWORD *v3;
  uint64_t result;
  char v5;

  v2 = *((_DWORD *)this + 1);
  if (v2 == 1)
  {
    v3 = (_QWORD *)*((_QWORD *)this + 1);
    v5 = 44;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)&v5, 1);
  }
  else if (!v2)
  {
    minijson::writer::write_opening_bracket(this);
  }
  result = minijson::writer::write_pretty_print_token((uint64_t)this, 0);
  *((_DWORD *)this + 1) = 1;
  return result;
}

uint64_t minijson::writer::write_field_name(minijson::writer *this, char *a2)
{
  _QWORD *v3;
  char v5;

  v3 = (_QWORD *)*((_QWORD *)this + 1);
  v5 = 58;
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v3, (uint64_t)&v5, 1);
  return minijson::writer::write_pretty_print_token((uint64_t)this, 1);
}

_QWORD *minijson::writer::write_opening_bracket(minijson::writer *this)
{
  int v1;
  _QWORD *v2;
  char *v3;
  char v5;
  char v6;

  v1 = *(unsigned __int8 *)this;
  v2 = (_QWORD *)*((_QWORD *)this + 1);
  if (v1)
  {
    v5 = 91;
    v3 = &v5;
  }
  else
  {
    v6 = 123;
    v3 = &v6;
  }
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v2, (uint64_t)v3, 1);
}

uint64_t minijson::writer::write_pretty_print_token(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(result + 24))
  {
    v2 = result;
    v7 = *(_QWORD *)(result + 8);
    v9 = 0;
    if (a2)
    {
      if (a2 == 1)
      {
        v9 = 1;
        v8 = 32;
      }
      else if (a2 == 2 && *(_DWORD *)(result + 4))
      {
        goto LABEL_6;
      }
      return std::ostream::write();
    }
LABEL_6:
    v3 = *(_QWORD *)(result + 16);
    if (!a2)
      ++v3;
    if (!*(_BYTE *)(result + 40))
      v3 *= *(_QWORD *)(result + 32);
    v9 = 1;
    v8 = 10;
    if (v3)
    {
      v4 = v3 - 1;
      v5 = 1;
      while (1)
      {
        v6 = *(_BYTE *)(v2 + 40) ? 9 : 32;
        if (v5 == 16)
        {
          std::ostream::write();
          v5 = 0;
        }
        v9 = v5 + 1;
        *((_BYTE *)&v7 + v5 + 8) = v6;
        if (!v4)
          break;
        v5 = v9;
        --v4;
      }
    }
    return std::ostream::write();
  }
  return result;
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x20BD00FD4](v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, MEMORY[0x24BEDB350]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x20BD00FE0](v13);
  return a1;
}

void sub_207C5D208(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x20BD00FE0](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x207C5D1E8);
}

void sub_207C5D250(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_207C5D384(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

uint64_t minijson::detail::`anonymous namespace'::write_quoted_string(_QWORD *a1, unsigned __int8 *a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 *v7;
  const char *v8;
  int v9;
  uint64_t v10;
  uint64_t result;
  _QWORD *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = *a1;
  *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 8) = *(_DWORD *)((_BYTE *)a1 + *(_QWORD *)(*a1 - 24) + 8) & 0xFFFFFFB5 | 8;
  *(_DWORD *)((char *)a1 + *(_QWORD *)(v4 - 24) + 8) = *(_DWORD *)((_BYTE *)a1 + *(_QWORD *)(v4 - 24) + 8) & 0xFFFFFF4F | 0x80;
  LOBYTE(v12) = 48;
  std::operator<<[abi:ne180100]<std::char_traits<char>>(a1, (char *)&v12);
  v12 = a1;
  v5 = 1;
  v14 = 1;
  v13 = 34;
  v6 = *a2;
  if (!*a2)
    goto LABEL_25;
  v7 = a2 + 1;
  do
  {
    if ((char)v6 <= 12)
    {
      if (v6 == 9)
      {
        v8 = "\\t";
        goto LABEL_14;
      }
      if (v6 == 10)
      {
        v8 = "\\n";
        goto LABEL_14;
      }
    }
    else
    {
      switch(v6)
      {
        case 0xDu:
          v8 = "\\r";
          goto LABEL_14;
        case 0x5Cu:
          v8 = "\\\\";
          goto LABEL_14;
        case 0x22u:
          v8 = "\\\"";
LABEL_14:
          minijson::detail::buffered_writer<128ul>::operator<<<3ul>((uint64_t)&v12, (uint64_t)v8);
          goto LABEL_15;
      }
    }
    if (v6 < 0x20u || v6 == 127)
    {
      minijson::detail::buffered_writer<128ul>::operator<<<3ul>((uint64_t)&v12, (uint64_t)"\\u");
      std::ostream::write();
      v14 = 0;
      *(_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 24) = 4;
      std::ostream::operator<<();
    }
    else
    {
      v10 = v14;
      if (v14 == 128)
      {
        std::ostream::write();
        v10 = 0;
      }
      v14 = v10 + 1;
      *((_BYTE *)&v12 + v10 + 8) = v6;
    }
LABEL_15:
    v9 = *v7++;
    v6 = v9;
  }
  while (v9);
  v5 = v14;
  if (v14 == 128)
  {
    std::ostream::write();
    v5 = 0;
  }
LABEL_25:
  v14 = v5 + 1;
  *((_BYTE *)&v12 + v5 + 8) = 34;
  result = std::ostream::write();
  v14 = 0;
  *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 8) = *(_DWORD *)((_BYTE *)a1 + *(_QWORD *)(*a1 - 24) + 8) & 0xFFFFFFB5 | 2;
  return result;
}

_QWORD *std::operator<<[abi:ne180100]<std::char_traits<char>>(_QWORD *a1, char *a2)
{
  char *v3;
  int v4;
  const std::locale::facet *v5;
  int v6;
  std::locale v8;

  v3 = (char *)a1 + *(_QWORD *)(*a1 - 24);
  v4 = *a2;
  if (*((_DWORD *)v3 + 36) == -1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
    v5 = std::locale::use_facet(&v8, MEMORY[0x24BEDB350]);
    v6 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v5->__vftable[2].~facet_0)(v5, 32);
    std::locale::~locale(&v8);
    *((_DWORD *)v3 + 36) = v6;
  }
  *((_DWORD *)v3 + 36) = v4;
  return a1;
}

void sub_207C5D75C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
  std::locale::~locale(&a10);
  _Unwind_Resume(a1);
}

uint64_t minijson::detail::buffered_writer<128ul>::operator<<<3ul>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  char v6;
  char v7;
  uint64_t v8;

  v4 = 0;
  v5 = 1;
  do
  {
    v6 = v5;
    v7 = *(_BYTE *)(a2 + v4);
    v8 = *(_QWORD *)(a1 + 136);
    if (v8 == 128)
    {
      std::ostream::write();
      v8 = 0;
    }
    v5 = 0;
    *(_QWORD *)(a1 + 136) = v8 + 1;
    *(_BYTE *)(a1 + v8 + 8) = v7;
    v4 = 1;
  }
  while ((v6 & 1) != 0);
  return a1;
}

_QWORD *minijson::writer::write_closing_bracket(minijson::writer *this)
{
  _QWORD *v2;
  char *v3;
  char v5;
  char v6;

  minijson::writer::write_pretty_print_token((uint64_t)this, 2);
  v2 = (_QWORD *)*((_QWORD *)this + 1);
  if (*(_BYTE *)this)
  {
    v5 = 93;
    v3 = &v5;
  }
  else
  {
    v6 = 125;
    v3 = &v6;
  }
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v2, (uint64_t)v3, 1);
}

void std::vector<std::string const>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::string const>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::string const>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0)
      operator delete(*(void **)(i - 24));
  }
  a1[1] = v2;
}

void std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  void *v2;
  uint64_t v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = (uint64_t)v1[1];
    v5 = **a1;
    if ((void *)v4 != v2)
    {
      do
      {
        v4 -= 48;
        std::__destroy_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group,0>(v4);
      }
      while ((void *)v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::__destroy_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group,0>(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    *(_QWORD *)(a1 + 32) = v2;
    operator delete(v2);
  }
  v3 = *(void **)a1;
  if (*(_QWORD *)a1)
  {
    *(_QWORD *)(a1 + 8) = v3;
    operator delete(v3);
  }
}

uint64_t minijson::writer::write_helper<unsigned int,minijson::default_value_writer<unsigned int,void>>(uint64_t result, char *a2)
{
  minijson::writer *v3;

  if (*(_DWORD *)(result + 4) != 2)
  {
    v3 = (minijson::writer *)result;
    minijson::writer::next_field(v3);
    if (a2)
      minijson::writer::write_field_name(v3, a2);
    return std::ostream::operator<<();
  }
  return result;
}

uint64_t minijson::writer::write_helper<unsigned long long,minijson::default_value_writer<unsigned long long,void>>(uint64_t result, char *a2)
{
  minijson::writer *v3;

  if (*(_DWORD *)(result + 4) != 2)
  {
    v3 = (minijson::writer *)result;
    minijson::writer::next_field(v3);
    if (a2)
      minijson::writer::write_field_name(v3, a2);
    return std::ostream::operator<<();
  }
  return result;
}

uint64_t minijson::writer::write_helper<std::string,minijson::default_value_writer<std::string,void>>(uint64_t result, char *a2, uint64_t a3)
{
  minijson::writer *v5;
  unsigned __int8 *v6;

  if (*(_DWORD *)(result + 4) != 2)
  {
    v5 = (minijson::writer *)result;
    minijson::writer::next_field(v5);
    if (a2)
      minijson::writer::write_field_name(v5, a2);
    if (*(char *)(a3 + 23) >= 0)
      v6 = (unsigned __int8 *)a3;
    else
      v6 = *(unsigned __int8 **)a3;
  }
  return result;
}

uint64_t minijson::writer::write_helper<char [64],minijson::default_value_writer<char [64],void>>(uint64_t result, char *a2, unsigned __int8 *a3)
{
  minijson::writer *v5;

  if (*(_DWORD *)(result + 4) != 2)
  {
    v5 = (minijson::writer *)result;
    minijson::writer::next_field(v5);
    if (a2)
      minijson::writer::write_field_name(v5, a2);
  }
  return result;
}

minijson::writer *minijson::writer::write_helper<float,minijson::default_value_writer<float,void>>(minijson::writer *result, char *a2, float *a3)
{
  minijson::writer *v5;
  char v6;

  if (*((_DWORD *)result + 1) != 2)
  {
    v5 = result;
    minijson::writer::next_field(v5);
    if (a2)
      minijson::writer::write_field_name(v5, a2);
    return (minijson::writer *)minijson::default_value_writer<float,void>::operator()(*a3, (uint64_t)&v6, *((_QWORD **)v5 + 1));
  }
  return result;
}

_QWORD *minijson::default_value_writer<float,void>::operator()(float a1, uint64_t a2, _QWORD *a3)
{
  if ((LODWORD(a1) & 0x7FFFFFFFu) >= 0x7F800000)
    return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a3, (uint64_t)"null", 4);
  else
    return (_QWORD *)std::ostream::operator<<();
}

minijson::writer *minijson::writer::write_helper<BOOL,minijson::default_value_writer<BOOL,void>>(minijson::writer *result, char *a2, unsigned __int8 *a3)
{
  minijson::writer *v5;
  char v6;

  if (*((_DWORD *)result + 1) != 2)
  {
    v5 = result;
    minijson::writer::next_field(v5);
    if (a2)
      minijson::writer::write_field_name(v5, a2);
    return (minijson::writer *)minijson::default_value_writer<BOOL,void>::operator()((uint64_t)&v6, *((_QWORD **)v5 + 1), *a3);
  }
  return result;
}

_QWORD *minijson::default_value_writer<BOOL,void>::operator()(uint64_t a1, _QWORD *a2, int a3)
{
  const char *v4;
  uint64_t v5;

  if (a3)
  {
    v4 = "true";
    v5 = 4;
  }
  else
  {
    v4 = "false";
    v5 = 5;
  }
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)v4, v5);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

BOOL ANEAnalytics::IsVariableLengthString(int a1)
{
  return a1 == 15;
}

double ANEDebugInfo::DebugInfoInMem::DebugInfoInMem(ANEDebugInfo::DebugInfoInMem *this)
{
  double result;

  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = 0;
  result = 0.0;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *((_QWORD *)this + 13) = 0;
  *(_OWORD *)((char *)this + 116) = 0u;
  *(_OWORD *)((char *)this + 132) = 0u;
  *(_QWORD *)((char *)this + 148) = 0x3F80000000000000;
  *((_WORD *)this + 80) = 0;
  *((_BYTE *)this + 162) = 0;
  return result;
}

{
  double result;

  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 6) = 0;
  *((_QWORD *)this + 7) = 0;
  result = 0.0;
  *(_OWORD *)((char *)this + 72) = 0u;
  *(_OWORD *)((char *)this + 88) = 0u;
  *((_QWORD *)this + 13) = 0;
  *(_OWORD *)((char *)this + 116) = 0u;
  *(_OWORD *)((char *)this + 132) = 0u;
  *(_QWORD *)((char *)this + 148) = 0x3F80000000000000;
  *((_WORD *)this + 80) = 0;
  *((_BYTE *)this + 162) = 0;
  return result;
}

uint64_t ANEDebugInfo::DebugInfoInMem::DebugInfoInMem(uint64_t a1, uint64_t a2, uint64_t a3, __int16 *a4)
{
  uint64_t v7;
  __int16 v8;

  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_QWORD *)(a1 + 104) = 0;
  *(_OWORD *)(a1 + 116) = 0u;
  *(_OWORD *)(a1 + 132) = 0u;
  *(_QWORD *)(a1 + 148) = 0x3F80000000000000;
  *(_WORD *)(a1 + 160) = 0;
  v7 = a1 + 160;
  *(_BYTE *)(a1 + 162) = 0;
  *(_DWORD *)(a1 + 64) = ANEDebugInfo::DebugInfoInMem::EncodeString(a1, a2);
  *(_DWORD *)(a1 + 68) = ANEDebugInfo::DebugInfoInMem::EncodeString(a1, a3);
  v8 = *a4;
  *(_BYTE *)(v7 + 2) = *((_BYTE *)a4 + 2);
  *(_WORD *)v7 = v8;
  return a1;
}

void sub_207C5DDC4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  va_list va;

  va_start(va, a2);
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table(v2 + 120);
  std::vector<std::string const>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t ANEDebugInfo::DebugInfoInMem::EncodeString(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  __int128 *v12;

  v4 = a1 + 120;
  v5 = std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::find<std::string>((_QWORD *)(a1 + 120), (unsigned __int8 *)a2);
  if (v5)
    return *((unsigned int *)v5 + 10);
  v8 = *(_QWORD *)(a1 + 80);
  v7 = (uint64_t *)(a1 + 72);
  v6 = -1431655765 * ((v8 - *(_QWORD *)(a1 + 72)) >> 3);
  if (v8 >= *(_QWORD *)(a1 + 88))
  {
    v9 = std::vector<std::string const>::__push_back_slow_path<std::string const&>(v7, (__int128 *)a2);
  }
  else
  {
    std::vector<std::string const>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)v7, (__int128 *)a2);
    v9 = v8 + 24;
  }
  *(_QWORD *)(a1 + 80) = v9;
  v12 = (__int128 *)a2;
  *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4, (unsigned __int8 *)a2, (uint64_t)&std::piecewise_construct, &v12)+ 10) = v6;
  v10 = *(unsigned __int8 *)(a2 + 23);
  if ((v10 & 0x80u) != 0)
    v10 = *(_DWORD *)(a2 + 8);
  *(_DWORD *)(a1 + 116) += v10 + 1;
  return v6;
}

void ANEDebugInfo::DebugInfoInMem::GetString(ANEDebugInfo::DebugInfoInMem *this@<X0>, unsigned int a2@<W1>, std::string *a3@<X8>)
{
  uint64_t v3;
  __int128 *v4;
  __int128 v5;

  v3 = *((_QWORD *)this + 9);
  if (0xAAAAAAAAAAAAAAABLL * ((*((_QWORD *)this + 10) - v3) >> 3) <= a2)
  {
    std::string::basic_string[abi:ne180100]<0>(a3, "STR_TBL_OUT_OF_BOUND!");
  }
  else
  {
    v4 = (__int128 *)(v3 + 24 * a2);
    if (*((char *)v4 + 23) < 0)
    {
      std::string::__init_copy_ctor_external(a3, *(const std::string::value_type **)v4, *((_QWORD *)v4 + 1));
    }
    else
    {
      v5 = *v4;
      a3->__r_.__value_.__r.__words[2] = *((_QWORD *)v4 + 2);
      *(_OWORD *)&a3->__r_.__value_.__l.__data_ = v5;
    }
  }
}

uint64_t ANEDebugInfo::DebugInfoInMem::Dump(uint64_t a1, uint64_t *a2)
{
  _QWORD *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  const std::locale::facet *v10;
  _QWORD *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  const std::locale::facet *v17;
  _QWORD *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  const std::locale::facet *v24;
  _QWORD *v25;
  _QWORD *v26;
  const std::locale::facet *v27;
  uint64_t v28;
  uint64_t v29;
  std::locale::id *v30;
  _QWORD *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  const std::locale::facet *v36;
  const std::locale::facet *v37;
  uint64_t result;
  _QWORD *v39;
  _QWORD *v40;
  const std::locale::facet *v41;
  _QWORD *v42;
  uint64_t *v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  const std::locale::facet *v47;
  _QWORD *v48;
  uint64_t *v49;
  uint64_t v50;
  _QWORD *v51;
  _QWORD *v52;
  const std::locale::facet *v53;
  _QWORD *v54;
  uint64_t *v55;
  uint64_t v56;
  _QWORD *v57;
  _QWORD *v58;
  const std::locale::facet *v59;
  _QWORD *v60;
  uint64_t *v61;
  uint64_t v62;
  _QWORD *v63;
  _QWORD *v64;
  const std::locale::facet *v65;
  _QWORD *v66;
  _QWORD *v67;
  const std::locale::facet *v68;
  unsigned int **v69;
  _QWORD *v70;
  std::locale::id *v71;
  _QWORD *v72;
  const std::locale::facet *v73;
  unsigned int *v74;
  unsigned int *v75;
  _QWORD *v76;
  uint64_t v77;
  int v78;
  uint64_t v79;
  uint64_t v80;
  _QWORD *v81;
  uint64_t *v82;
  uint64_t v83;
  _QWORD *v84;
  uint64_t v85;
  uint64_t v86;
  int v87;
  _QWORD *v88;
  uint64_t v89;
  int v90;
  uint64_t v91;
  uint64_t v92;
  const std::locale::facet *v93;
  uint64_t v94;
  _QWORD *v95;
  const std::locale::facet *v96;
  _QWORD *v97;
  const std::locale::facet *v98;
  unsigned int **v99;
  unsigned int *v100;
  uint64_t *v101;
  uint64_t v102;
  _QWORD *v103;
  unint64_t v104;
  unint64_t v105;
  unint64_t v106;
  unint64_t v107;
  unint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t *v111;
  uint64_t v112;
  _QWORD *v113;
  _QWORD *v114;
  const char *v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  _QWORD *v119;
  _QWORD *v120;
  const char *v121;
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  _QWORD *v125;
  _QWORD *v126;
  uint64_t v127;
  const std::locale::facet *v128;
  const std::locale::facet *v129;
  _QWORD *v130;
  const std::locale::facet *v131;
  uint64_t v132;
  int *v133;
  int v134;
  _QWORD *v136;
  _QWORD *v137;
  const std::locale::facet *v138;
  _QWORD *v139;
  _QWORD *v140;
  std::string *v141;
  std::string::size_type size;
  uint64_t *v143;
  uint64_t v144;
  const std::locale::facet *v145;
  _QWORD *v146;
  _QWORD *v147;
  std::string *p_p;
  std::string::size_type v149;
  uint64_t *v150;
  uint64_t v151;
  const std::locale::facet *v152;
  _QWORD *v153;
  const std::locale::facet *v154;
  const std::locale::facet *v155;
  uint64_t *v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  const std::locale::facet *v160;
  _QWORD *v161;
  const std::locale::facet *v162;
  unsigned int **v163;
  unsigned int **v164;
  _QWORD *v165;
  unsigned int *v166;
  int *v167;
  uint64_t v168;
  std::string __p;
  char v170;
  std::string v171;
  unsigned __int8 v172;
  std::locale v173;

  v4 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"CU: ", 4);
  v5 = *(_QWORD *)(a1 + 72) + 24 * *(unsigned int *)(a1 + 64);
  v6 = *(char *)(v5 + 23);
  if (v6 >= 0)
    v7 = *(_QWORD *)(a1 + 72) + 24 * *(unsigned int *)(a1 + 64);
  else
    v7 = *(_QWORD *)v5;
  if (v6 >= 0)
    v8 = *(unsigned __int8 *)(v5 + 23);
  else
    v8 = *(_QWORD *)(v5 + 8);
  v9 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v4, v7, v8);
  std::ios_base::getloc((const std::ios_base *)((char *)v9 + *(_QWORD *)(*v9 - 24)));
  v10 = std::locale::use_facet((const std::locale *)&v171, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 10);
  std::locale::~locale((std::locale *)&v171);
  std::ostream::put();
  std::ostream::flush();
  v11 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"Ident string: \n", 15);
  v12 = *(_QWORD *)(a1 + 72) + 24 * *(unsigned int *)(a1 + 112);
  v13 = *(char *)(v12 + 23);
  if (v13 >= 0)
    v14 = *(_QWORD *)(a1 + 72) + 24 * *(unsigned int *)(a1 + 112);
  else
    v14 = *(_QWORD *)v12;
  if (v13 >= 0)
    v15 = *(unsigned __int8 *)(v12 + 23);
  else
    v15 = *(_QWORD *)(v12 + 8);
  v16 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v11, v14, v15);
  std::ios_base::getloc((const std::ios_base *)((char *)v16 + *(_QWORD *)(*v16 - 24)));
  v17 = std::locale::use_facet((const std::locale *)&v171, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v17->__vftable[2].~facet_0)(v17, 10);
  std::locale::~locale((std::locale *)&v171);
  std::ostream::put();
  std::ostream::flush();
  v18 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"  Proc: ", 8);
  v19 = *(_QWORD *)(a1 + 72) + 24 * *(unsigned int *)(a1 + 68);
  v20 = *(char *)(v19 + 23);
  if (v20 >= 0)
    v21 = *(_QWORD *)(a1 + 72) + 24 * *(unsigned int *)(a1 + 68);
  else
    v21 = *(_QWORD *)v19;
  if (v20 >= 0)
    v22 = *(unsigned __int8 *)(v19 + 23);
  else
    v22 = *(_QWORD *)(v19 + 8);
  v23 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v18, v21, v22);
  std::ios_base::getloc((const std::ios_base *)((char *)v23 + *(_QWORD *)(*v23 - 24)));
  v24 = std::locale::use_facet((const std::locale *)&v171, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v24->__vftable[2].~facet_0)(v24, 10);
  std::locale::~locale((std::locale *)&v171);
  std::ostream::put();
  std::ostream::flush();
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"  StringTable: [ # ", 19);
  v25 = (_QWORD *)std::ostream::operator<<();
  v26 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v25, (uint64_t)"]", 1);
  std::ios_base::getloc((const std::ios_base *)((char *)v26 + *(_QWORD *)(*v26 - 24)));
  v27 = std::locale::use_facet((const std::locale *)&v171, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v27->__vftable[2].~facet_0)(v27, 10);
  std::locale::~locale((std::locale *)&v171);
  std::ostream::put();
  std::ostream::flush();
  v28 = *(_QWORD *)(a1 + 72);
  v29 = *(_QWORD *)(a1 + 80);
  v168 = a1;
  if (v28 != v29)
  {
    v30 = (std::locale::id *)MEMORY[0x24BEDB350];
    do
    {
      v31 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"     ", 5);
      v32 = *(char *)(v28 + 23);
      if (v32 >= 0)
        v33 = v28;
      else
        v33 = *(_QWORD *)v28;
      if (v32 >= 0)
        v34 = *(unsigned __int8 *)(v28 + 23);
      else
        v34 = *(_QWORD *)(v28 + 8);
      v35 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v31, v33, v34);
      std::ios_base::getloc((const std::ios_base *)((char *)v35 + *(_QWORD *)(*v35 - 24)));
      v36 = std::locale::use_facet((const std::locale *)&v171, v30);
      ((void (*)(const std::locale::facet *, uint64_t))v36->__vftable[2].~facet_0)(v36, 10);
      std::locale::~locale((std::locale *)&v171);
      std::ostream::put();
      std::ostream::flush();
      v28 += 24;
    }
    while (v28 != v29);
  }
  std::ios_base::getloc((const std::ios_base *)((char *)a2 + *(_QWORD *)(*a2 - 24)));
  v37 = std::locale::use_facet((const std::locale *)&v171, MEMORY[0x24BEDB350]);
  ((void (*)(const std::locale::facet *, uint64_t))v37->__vftable[2].~facet_0)(v37, 10);
  std::locale::~locale((std::locale *)&v171);
  std::ostream::put();
  result = std::ostream::flush();
  if (*(_BYTE *)(a1 + 161))
  {
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"  MaxTDLatency: ", 16);
    v39 = (_QWORD *)std::ostream::operator<<();
    v40 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v39, (uint64_t)" us", 3);
    std::ios_base::getloc((const std::ios_base *)((char *)v40 + *(_QWORD *)(*v40 - 24)));
    v41 = std::locale::use_facet((const std::locale *)&v171, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v41->__vftable[2].~facet_0)(v41, 10);
    std::locale::~locale((std::locale *)&v171);
    std::ostream::put();
    result = std::ostream::flush();
  }
  if (*(_BYTE *)(a1 + 160))
  {
    *(uint64_t *)((char *)a2 + *(_QWORD *)(*a2 - 24) + 24) = 20;
    v42 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
    *(_QWORD *)((char *)v42 + *(_QWORD *)(*v42 - 24) + 24) = 30;
    v43 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v42, (uint64_t)"Procedure Latency: ", 19);
    v44 = *v43;
    *(_DWORD *)((char *)v43 + *(_QWORD *)(*v43 - 24) + 8) = *(_DWORD *)((_BYTE *)v43 + *(_QWORD *)(*v43 - 24) + 8) & 0xFFFFFF4F | 0x80;
    *(uint64_t *)((char *)v43 + *(_QWORD *)(v44 - 24) + 24) = 10;
    v45 = (_QWORD *)std::ostream::operator<<();
    v46 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v45, (uint64_t)" ns", 3);
    std::ios_base::getloc((const std::ios_base *)((char *)v46 + *(_QWORD *)(*v46 - 24)));
    v47 = std::locale::use_facet((const std::locale *)&v171, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v47->__vftable[2].~facet_0)(v47, 10);
    std::locale::~locale((std::locale *)&v171);
    std::ostream::put();
    std::ostream::flush();
    *(uint64_t *)((char *)a2 + *(_QWORD *)(*a2 - 24) + 24) = 20;
    v48 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
    *(_QWORD *)((char *)v48 + *(_QWORD *)(*v48 - 24) + 24) = 30;
    v49 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v48, (uint64_t)"NE Domain Frequency: ", 21);
    v50 = *v49;
    *(_DWORD *)((char *)v49 + *(_QWORD *)(*v49 - 24) + 8) = *(_DWORD *)((_BYTE *)v49 + *(_QWORD *)(*v49 - 24) + 8) & 0xFFFFFF4F | 0x80;
    *(uint64_t *)((char *)v49 + *(_QWORD *)(v50 - 24) + 24) = 10;
    v51 = (_QWORD *)std::ostream::operator<<();
    v52 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v51, (uint64_t)" GHz", 4);
    std::ios_base::getloc((const std::ios_base *)((char *)v52 + *(_QWORD *)(*v52 - 24)));
    v53 = std::locale::use_facet((const std::locale *)&v171, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v53->__vftable[2].~facet_0)(v53, 10);
    std::locale::~locale((std::locale *)&v171);
    std::ostream::put();
    std::ostream::flush();
    *(uint64_t *)((char *)a2 + *(_QWORD *)(*a2 - 24) + 24) = 20;
    v54 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
    *(_QWORD *)((char *)v54 + *(_QWORD *)(*v54 - 24) + 24) = 30;
    v55 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v54, (uint64_t)"L2 Domain Frequency: ", 21);
    v56 = *v55;
    *(_DWORD *)((char *)v55 + *(_QWORD *)(*v55 - 24) + 8) = *(_DWORD *)((_BYTE *)v55 + *(_QWORD *)(*v55 - 24) + 8) & 0xFFFFFF4F | 0x80;
    *(uint64_t *)((char *)v55 + *(_QWORD *)(v56 - 24) + 24) = 10;
    v57 = (_QWORD *)std::ostream::operator<<();
    v58 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v57, (uint64_t)" GHz", 4);
    std::ios_base::getloc((const std::ios_base *)((char *)v58 + *(_QWORD *)(*v58 - 24)));
    v59 = std::locale::use_facet((const std::locale *)&v171, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v59->__vftable[2].~facet_0)(v59, 10);
    std::locale::~locale((std::locale *)&v171);
    std::ostream::put();
    std::ostream::flush();
    *(uint64_t *)((char *)a2 + *(_QWORD *)(*a2 - 24) + 24) = 20;
    v60 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
    *(_QWORD *)((char *)v60 + *(_QWORD *)(*v60 - 24) + 24) = 30;
    v61 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v60, (uint64_t)"DRAM Bandwidth: ", 16);
    v62 = *v61;
    *(_DWORD *)((char *)v61 + *(_QWORD *)(*v61 - 24) + 8) = *(_DWORD *)((_BYTE *)v61 + *(_QWORD *)(*v61 - 24) + 8) & 0xFFFFFF4F | 0x80;
    *(uint64_t *)((char *)v61 + *(_QWORD *)(v62 - 24) + 24) = 10;
    v63 = (_QWORD *)std::ostream::operator<<();
    v64 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v63, (uint64_t)" GB/s", 5);
    std::ios_base::getloc((const std::ios_base *)((char *)v64 + *(_QWORD *)(*v64 - 24)));
    v65 = std::locale::use_facet((const std::locale *)&v171, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v65->__vftable[2].~facet_0)(v65, 10);
    std::locale::~locale((std::locale *)&v171);
    std::ostream::put();
    std::ostream::flush();
    *(uint64_t *)((char *)a2 + *(_QWORD *)(*a2 - 24) + 24) = 20;
    v66 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
    v67 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v66, (uint64_t)"============== time are in nanoseconds ==============", 53);
    std::ios_base::getloc((const std::ios_base *)((char *)v67 + *(_QWORD *)(*v67 - 24)));
    v68 = std::locale::use_facet((const std::locale *)&v171, MEMORY[0x24BEDB350]);
    ((void (*)(const std::locale::facet *, uint64_t))v68->__vftable[2].~facet_0)(v68, 10);
    std::locale::~locale((std::locale *)&v171);
    std::ostream::put();
    result = std::ostream::flush();
  }
  v69 = *(unsigned int ***)(a1 + 40);
  v163 = *(unsigned int ***)(a1 + 48);
  if (v69 != v163)
  {
    v70 = a2 + 3;
    v165 = a2 + 1;
    v71 = (std::locale::id *)MEMORY[0x24BEDB350];
    do
    {
      v72 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"Source Layers: {", 16);
      std::ios_base::getloc((const std::ios_base *)((char *)v72 + *(_QWORD *)(*v72 - 24)));
      v73 = std::locale::use_facet((const std::locale *)&v171, v71);
      ((void (*)(const std::locale::facet *, uint64_t))v73->__vftable[2].~facet_0)(v73, 10);
      std::locale::~locale((std::locale *)&v171);
      std::ostream::put();
      result = std::ostream::flush();
      v74 = *v69;
      v75 = v69[1];
      while (v74 != v75)
      {
        v76 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"  ", 2);
        v77 = *(_QWORD *)(v168 + 72) + 24 * *v74;
        v78 = *(char *)(v77 + 23);
        if (v78 >= 0)
          v79 = *(_QWORD *)(v168 + 72) + 24 * *v74;
        else
          v79 = *(_QWORD *)v77;
        if (v78 >= 0)
          v80 = *(unsigned __int8 *)(v77 + 23);
        else
          v80 = *(_QWORD *)(v77 + 8);
        v81 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v76, v79, v80);
        v82 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v81, (uint64_t)"\t[ x ", 5);
        v83 = *v82;
        *(_DWORD *)((char *)v82 + *(_QWORD *)(*v82 - 24) + 8) = *(_DWORD *)((_BYTE *)v82 + *(_QWORD *)(*v82 - 24) + 8) & 0xFFFFFEFB | 4;
        *(_DWORD *)((char *)v82 + *(_QWORD *)(v83 - 24) + 8) = *(_DWORD *)((_BYTE *)v82 + *(_QWORD *)(v83 - 24) + 8) & 0xFFFFFF4F | 0x20;
        *(uint64_t *)((char *)v82 + *(_QWORD *)(v83 - 24) + 24) = 2;
        v84 = (_QWORD *)std::ostream::operator<<();
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v84, (uint64_t)" ]\t", 3);
        v85 = *(_QWORD *)(v168 + 72) + 24 * v74[1];
        v86 = *(unsigned __int8 *)(v85 + 23);
        v87 = (char)v86;
        if ((v86 & 0x80u) != 0)
          v86 = *(_QWORD *)(v85 + 8);
        if (v86 != 1)
          goto LABEL_48;
        if (v87 < 0)
          v85 = *(_QWORD *)v85;
        if (*(_BYTE *)v85 != 32)
        {
LABEL_48:
          v88 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"OP: ", 4);
          v89 = *(_QWORD *)(v168 + 72) + 24 * v74[1];
          v90 = *(char *)(v89 + 23);
          if (v90 >= 0)
            v91 = *(_QWORD *)(v168 + 72) + 24 * v74[1];
          else
            v91 = *(_QWORD *)v89;
          if (v90 >= 0)
            v92 = *(unsigned __int8 *)(v89 + 23);
          else
            v92 = *(_QWORD *)(v89 + 8);
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v88, v91, v92);
        }
        std::ios_base::getloc((const std::ios_base *)((char *)a2 + *(_QWORD *)(*a2 - 24)));
        v93 = std::locale::use_facet((const std::locale *)&v171, v71);
        ((void (*)(const std::locale::facet *, uint64_t))v93->__vftable[2].~facet_0)(v93, 10);
        std::locale::~locale((std::locale *)&v171);
        std::ostream::put();
        result = std::ostream::flush();
        v74 += 3;
      }
      if (*(_BYTE *)(v168 + 160))
      {
        *(_QWORD *)((char *)v70 + *(_QWORD *)(*a2 - 24)) = 20;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
        v94 = *a2;
        *(_DWORD *)((char *)v165 + *(_QWORD *)(*a2 - 24)) = *(_DWORD *)((_BYTE *)v165 + *(_QWORD *)(*a2 - 24)) & 0xFFFFFEFB | 4;
        *(_DWORD *)((char *)v165 + *(_QWORD *)(v94 - 24)) = *(_DWORD *)((_BYTE *)v165 + *(_QWORD *)(v94 - 24)) & 0xFFFFFF4F | 0x80;
        *(_QWORD *)((char *)v70 + *(_QWORD *)(v94 - 24)) = 10;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"ne time", 7);
        *(_QWORD *)((char *)v70 + *(_QWORD *)(*a2 - 24)) = 10;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
        *(_QWORD *)((char *)v70 + *(_QWORD *)(*a2 - 24)) = 10;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"l2 time", 7);
        *(_QWORD *)((char *)v70 + *(_QWORD *)(*a2 - 24)) = 10;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
        *(_QWORD *)((char *)v70 + *(_QWORD *)(*a2 - 24)) = 10;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"dram time", 9);
        *(_QWORD *)((char *)v70 + *(_QWORD *)(*a2 - 24)) = 10;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
        *(_QWORD *)((char *)v70 + *(_QWORD *)(*a2 - 24)) = 10;
        v95 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"total time", 10);
        std::ios_base::getloc((const std::ios_base *)((char *)v95 + *(_QWORD *)(*v95 - 24)));
        v96 = std::locale::use_facet((const std::locale *)&v171, v71);
        ((void (*)(const std::locale::facet *, uint64_t))v96->__vftable[2].~facet_0)(v96, 10);
        std::locale::~locale((std::locale *)&v171);
        std::ostream::put();
        std::ostream::flush();
        *(_QWORD *)((char *)v70 + *(_QWORD *)(*a2 - 24)) = 20;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
        *(_QWORD *)((char *)v70 + *(_QWORD *)(*a2 - 24)) = 10;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"---------", 9);
        *(_QWORD *)((char *)v70 + *(_QWORD *)(*a2 - 24)) = 10;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
        *(_QWORD *)((char *)v70 + *(_QWORD *)(*a2 - 24)) = 10;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"---------", 9);
        *(_QWORD *)((char *)v70 + *(_QWORD *)(*a2 - 24)) = 10;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
        *(_QWORD *)((char *)v70 + *(_QWORD *)(*a2 - 24)) = 10;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"---------", 9);
        *(_QWORD *)((char *)v70 + *(_QWORD *)(*a2 - 24)) = 10;
        std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
        *(_QWORD *)((char *)v70 + *(_QWORD *)(*a2 - 24)) = 10;
        v97 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"---------", 9);
        std::ios_base::getloc((const std::ios_base *)((char *)v97 + *(_QWORD *)(*v97 - 24)));
        v98 = std::locale::use_facet((const std::locale *)&v171, v71);
        ((void (*)(const std::locale::facet *, uint64_t))v98->__vftable[2].~facet_0)(v98, 10);
        std::locale::~locale((std::locale *)&v171);
        std::ostream::put();
        result = std::ostream::flush();
      }
      v99 = v69;
      v100 = v69[3];
      v164 = v99;
      v166 = v99[4];
      if (v100 != v166)
      {
        v167 = (int *)(v100 + 11);
        do
        {
          v101 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"  TD: ", 6);
          v102 = *v101;
          *(_DWORD *)((char *)v101 + *(_QWORD *)(*v101 - 24) + 8) = *(_DWORD *)((_BYTE *)v101
                                                                              + *(_QWORD *)(*v101 - 24)
                                                                              + 8) & 0xFFFFFEFB | 4;
          *(_DWORD *)((char *)v101 + *(_QWORD *)(v102 - 24) + 8) = *(_DWORD *)((_BYTE *)v101 + *(_QWORD *)(v102 - 24)
                                                                                             + 8) & 0xFFFFFF4F | 0x80;
          *(uint64_t *)((char *)v101 + *(_QWORD *)(v102 - 24) + 24) = 5;
          v103 = (_QWORD *)std::ostream::operator<<();
          std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v103, (uint64_t)"\t", 1);
          if (*(_BYTE *)(v168 + 160))
          {
            v104 = *((_QWORD *)v100 + 1);
            v105 = *((_QWORD *)v100 + 2);
            v106 = *((_QWORD *)v100 + 3);
            if (v104 <= v105)
              v107 = *((_QWORD *)v100 + 2);
            else
              v107 = *((_QWORD *)v100 + 1);
            if (v107 <= v106)
              v108 = *((_QWORD *)v100 + 3);
            else
              v108 = v107;
            *(_QWORD *)((char *)v70 + *(_QWORD *)(*a2 - 24)) = 4;
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
            if (v108 == v104)
              v109 = "\x1B[7;31;40m";
            else
              v109 = (const char *)&unk_207C68123;
            if (v108 == v104)
              v110 = 10;
            else
              v110 = 0;
            v111 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)v109, v110);
            v112 = *v111;
            *(_DWORD *)((char *)v111 + *(_QWORD *)(*v111 - 24) + 8) = *(_DWORD *)((_BYTE *)v111
                                                                                + *(_QWORD *)(*v111 - 24)
                                                                                + 8) & 0xFFFFFEFB | 4;
            *(_DWORD *)((char *)v111 + *(_QWORD *)(v112 - 24) + 8) = *(_DWORD *)((_BYTE *)v111
                                                                               + *(_QWORD *)(v112 - 24)
                                                                               + 8) & 0xFFFFFF4F | 0x80;
            *(uint64_t *)((char *)v111 + *(_QWORD *)(v112 - 24) + 24) = 10;
            v113 = (_QWORD *)std::ostream::operator<<();
            v114 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v113, (uint64_t)"\x1B[0m", 4);
            *(_QWORD *)((char *)v114 + *(_QWORD *)(*v114 - 24) + 24) = 10;
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v114, (uint64_t)" ", 1);
            if (v108 == v105)
              v115 = "\x1B[7;31;40m";
            else
              v115 = (const char *)&unk_207C68123;
            if (v108 == v105)
              v116 = 10;
            else
              v116 = 0;
            v117 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)v115, v116);
            v118 = *v117;
            *(_DWORD *)((char *)v117 + *(_QWORD *)(*v117 - 24) + 8) = *(_DWORD *)((_BYTE *)v117
                                                                                + *(_QWORD *)(*v117 - 24)
                                                                                + 8) & 0xFFFFFEFB | 4;
            *(_DWORD *)((char *)v117 + *(_QWORD *)(v118 - 24) + 8) = *(_DWORD *)((_BYTE *)v117
                                                                               + *(_QWORD *)(v118 - 24)
                                                                               + 8) & 0xFFFFFF4F | 0x80;
            *(uint64_t *)((char *)v117 + *(_QWORD *)(v118 - 24) + 24) = 10;
            v119 = (_QWORD *)std::ostream::operator<<();
            v120 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v119, (uint64_t)"\x1B[0m", 4);
            *(_QWORD *)((char *)v120 + *(_QWORD *)(*v120 - 24) + 24) = 10;
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v120, (uint64_t)" ", 1);
            if (v106 >= v107)
              v121 = "\x1B[7;31;40m";
            else
              v121 = (const char *)&unk_207C68123;
            if (v106 >= v107)
              v122 = 10;
            else
              v122 = 0;
            v123 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)v121, v122);
            v124 = *v123;
            *(_DWORD *)((char *)v123 + *(_QWORD *)(*v123 - 24) + 8) = *(_DWORD *)((_BYTE *)v123
                                                                                + *(_QWORD *)(*v123 - 24)
                                                                                + 8) & 0xFFFFFEFB | 4;
            *(_DWORD *)((char *)v123 + *(_QWORD *)(v124 - 24) + 8) = *(_DWORD *)((_BYTE *)v123
                                                                               + *(_QWORD *)(v124 - 24)
                                                                               + 8) & 0xFFFFFF4F | 0x80;
            *(uint64_t *)((char *)v123 + *(_QWORD *)(v124 - 24) + 24) = 10;
            v125 = (_QWORD *)std::ostream::operator<<();
            v126 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v125, (uint64_t)"\x1B[0m", 4);
            *(_QWORD *)((char *)v126 + *(_QWORD *)(*v126 - 24) + 24) = 10;
            v71 = (std::locale::id *)MEMORY[0x24BEDB350];
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v126, (uint64_t)" ", 1);
            v127 = *a2;
            *(_DWORD *)((char *)v165 + *(_QWORD *)(*a2 - 24)) = *(_DWORD *)((_BYTE *)v165 + *(_QWORD *)(*a2 - 24)) & 0xFFFFFEFB | 4;
            *(_DWORD *)((char *)v165 + *(_QWORD *)(v127 - 24)) = *(_DWORD *)((_BYTE *)v165 + *(_QWORD *)(v127 - 24)) & 0xFFFFFF4F | 0x80;
            *(_QWORD *)((char *)v70 + *(_QWORD *)(v127 - 24)) = 10;
            std::ostream::operator<<();
          }
          if (*(_BYTE *)(v168 + 162))
          {
            std::ios_base::getloc((const std::ios_base *)((char *)a2 + *(_QWORD *)(*a2 - 24)));
            v128 = std::locale::use_facet((const std::locale *)&v171, v71);
            ((void (*)(const std::locale::facet *, uint64_t))v128->__vftable[2].~facet_0)(v128, 10);
            std::locale::~locale((std::locale *)&v171);
            std::ostream::put();
            std::ostream::flush();
            std::ios_base::getloc((const std::ios_base *)((char *)a2 + *(_QWORD *)(*a2 - 24)));
            v129 = std::locale::use_facet((const std::locale *)&v171, v71);
            ((void (*)(const std::locale::facet *, uint64_t))v129->__vftable[2].~facet_0)(v129, 10);
            std::locale::~locale((std::locale *)&v171);
            std::ostream::put();
            std::ostream::flush();
            v130 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"Perf tracer Info: {", 19);
            std::ios_base::getloc((const std::ios_base *)((char *)v130 + *(_QWORD *)(*v130 - 24)));
            v131 = std::locale::use_facet((const std::locale *)&v171, v71);
            ((void (*)(const std::locale::facet *, uint64_t))v131->__vftable[2].~facet_0)(v131, 10);
            std::locale::~locale((std::locale *)&v171);
            std::ostream::put();
            std::ostream::flush();
            v132 = 0;
            v133 = v167;
            while (1)
            {
              ZinIrCompilerParamsUtils::PerfTracerCategoryToString(*(v133 - 1), &v171);
              ZinIrCompilerParamsUtils::PerfTracerMetricToString(*v133, &__p);
              v134 = v172;
              if (!v172 || v170 == 0)
                break;
              std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"Counter", 7);
              v136 = (_QWORD *)std::ostream::operator<<();
              v137 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v136, (uint64_t)":", 1);
              std::ios_base::getloc((const std::ios_base *)((char *)v137 + *(_QWORD *)(*v137 - 24)));
              v138 = std::locale::use_facet(&v173, v71);
              ((void (*)(const std::locale::facet *, uint64_t))v138->__vftable[2].~facet_0)(v138, 10);
              std::locale::~locale(&v173);
              std::ostream::put();
              std::ostream::flush();
              *(_QWORD *)((char *)v70 + *(_QWORD *)(*a2 - 24)) = 10;
              v139 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
              v140 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v139, (uint64_t)"Category: ", 10);
              if (!v172)
                std::__throw_bad_optional_access[abi:ne180100]();
              if ((v171.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v141 = &v171;
              else
                v141 = (std::string *)v171.__r_.__value_.__r.__words[0];
              if ((v171.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                size = HIBYTE(v171.__r_.__value_.__r.__words[2]);
              else
                size = v171.__r_.__value_.__l.__size_;
              v143 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v140, (uint64_t)v141, size);
              v144 = *v143;
              *(_DWORD *)((char *)v143 + *(_QWORD *)(*v143 - 24) + 8) = *(_DWORD *)((_BYTE *)v143
                                                                                  + *(_QWORD *)(*v143 - 24)
                                                                                  + 8) & 0xFFFFFF4F | 0x80;
              std::ios_base::getloc((const std::ios_base *)((char *)v143 + *(_QWORD *)(v144 - 24)));
              v145 = std::locale::use_facet(&v173, v71);
              ((void (*)(const std::locale::facet *, uint64_t))v145->__vftable[2].~facet_0)(v145, 10);
              std::locale::~locale(&v173);
              std::ostream::put();
              std::ostream::flush();
              *(_QWORD *)((char *)v70 + *(_QWORD *)(*a2 - 24)) = 10;
              v146 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)" ", 1);
              v147 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v146, (uint64_t)"Metric: ", 8);
              if (!v170)
                std::__throw_bad_optional_access[abi:ne180100]();
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                p_p = &__p;
              else
                p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
              if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                v149 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
              else
                v149 = __p.__r_.__value_.__l.__size_;
              v150 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v147, (uint64_t)p_p, v149);
              v151 = *v150;
              *(_DWORD *)((char *)v150 + *(_QWORD *)(*v150 - 24) + 8) = *(_DWORD *)((_BYTE *)v150
                                                                                  + *(_QWORD *)(*v150 - 24)
                                                                                  + 8) & 0xFFFFFF4F | 0x80;
              std::ios_base::getloc((const std::ios_base *)((char *)v150 + *(_QWORD *)(v151 - 24)));
              v152 = std::locale::use_facet(&v173, v71);
              ((void (*)(const std::locale::facet *, uint64_t))v152->__vftable[2].~facet_0)(v152, 10);
              std::locale::~locale(&v173);
              std::ostream::put();
              std::ostream::flush();
              if (v170 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
                operator delete(__p.__r_.__value_.__l.__data_);
              if (v172 && SHIBYTE(v171.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v171.__r_.__value_.__l.__data_);
              v133 += 2;
              if (++v132 == 4)
              {
                v153 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"}", 1);
                std::ios_base::getloc((const std::ios_base *)((char *)v153 + *(_QWORD *)(*v153 - 24)));
                v154 = std::locale::use_facet((const std::locale *)&v171, v71);
                ((void (*)(const std::locale::facet *, uint64_t))v154->__vftable[2].~facet_0)(v154, 10);
                std::locale::~locale((std::locale *)&v171);
                std::ostream::put();
                std::ostream::flush();
                goto LABEL_120;
              }
            }
            if (v170 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            {
              operator delete(__p.__r_.__value_.__l.__data_);
              v134 = v172;
            }
            if (v134 && SHIBYTE(v171.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v171.__r_.__value_.__l.__data_);
          }
LABEL_120:
          std::ios_base::getloc((const std::ios_base *)((char *)a2 + *(_QWORD *)(*a2 - 24)));
          v155 = std::locale::use_facet((const std::locale *)&v171, v71);
          ((void (*)(const std::locale::facet *, uint64_t))v155->__vftable[2].~facet_0)(v155, 10);
          std::locale::~locale((std::locale *)&v171);
          std::ostream::put();
          result = std::ostream::flush();
          if (*(_BYTE *)(v168 + 161))
          {
            v156 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"    Violates Max Latency: ", 26);
            v157 = *v156;
            *(_DWORD *)((char *)v156 + *(_QWORD *)(*v156 - 24) + 8) = *(_DWORD *)((_BYTE *)v156
                                                                                + *(_QWORD *)(*v156 - 24)
                                                                                + 8) & 0xFFFFFEFB | 4;
            *(_DWORD *)((char *)v156 + *(_QWORD *)(v157 - 24) + 8) = *(_DWORD *)((_BYTE *)v156
                                                                               + *(_QWORD *)(v157 - 24)
                                                                               + 8) & 0xFFFFFF4F | 0x80;
            *(uint64_t *)((char *)v156 + *(_QWORD *)(v157 - 24) + 24) = 5;
            if (*((_BYTE *)v100 + 4))
              v158 = "true";
            else
              v158 = "false";
            if (*((_BYTE *)v100 + 4))
              v159 = 4;
            else
              v159 = 5;
            std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v156, (uint64_t)v158, v159);
            std::ios_base::getloc((const std::ios_base *)((char *)a2 + *(_QWORD *)(*a2 - 24)));
            v160 = std::locale::use_facet((const std::locale *)&v171, v71);
            ((void (*)(const std::locale::facet *, uint64_t))v160->__vftable[2].~facet_0)(v160, 10);
            std::locale::~locale((std::locale *)&v171);
            std::ostream::put();
            result = std::ostream::flush();
          }
          v100 += 18;
          v167 += 18;
        }
        while (v100 != v166);
      }
      if (*(_BYTE *)(v168 + 160))
      {
        v161 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a2, (uint64_t)"}", 1);
        std::ios_base::getloc((const std::ios_base *)((char *)v161 + *(_QWORD *)(*v161 - 24)));
        v162 = std::locale::use_facet((const std::locale *)&v171, v71);
        ((void (*)(const std::locale::facet *, uint64_t))v162->__vftable[2].~facet_0)(v162, 10);
        std::locale::~locale((std::locale *)&v171);
        std::ostream::put();
        result = std::ostream::flush();
      }
      v69 = v164 + 6;
    }
    while (v164 + 6 != v163);
  }
  return result;
}

void sub_207C5F5C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21,char a22,std::locale a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,char a29)
{
  std::locale::~locale(&a23);
  _Unwind_Resume(a1);
}

uint64_t ANEDebugInfo::DebugInfoInMem::GetMode(ANEDebugInfo::DebugInfoInMem *this)
{
  return (uint64_t)this + 160;
}

void std::vector<std::string const>::__construct_one_at_end[abi:ne180100]<std::string const&>(uint64_t a1, __int128 *a2)
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(*(std::string **)(a1 + 8), *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    *(_QWORD *)(v3 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v3 = v4;
  }
  *(_QWORD *)(a1 + 8) = v3 + 24;
}

void sub_207C5F6F8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::string const>::__push_back_slow_path<std::string const&>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  std::string *v11;
  __int128 v12;
  uint64_t v13;
  _QWORD v15[2];
  std::string *v16;
  char *v17;
  uint64_t *v18;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v18 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string const>>(v7, v9);
  else
    v10 = 0;
  v11 = (std::string *)&v10[24 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v16 = v11;
  v17 = &v10[24 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
    v11 = v16;
  }
  else
  {
    v12 = *a2;
    v11->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = v12;
  }
  v16 = v11 + 1;
  std::vector<std::string const>::__swap_out_circular_buffer(a1, v15);
  v13 = a1[1];
  std::__split_buffer<std::string const>::~__split_buffer((uint64_t)v15);
  return v13;
}

void sub_207C5F80C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::string const>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::string const>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string const>,std::reverse_iterator<std::string const*>,std::reverse_iterator<std::string const*>,std::reverse_iterator<std::string const*>>((uint64_t)(a1 + 2), a1[1], (const std::string::value_type **)a1[1], *a1, (const std::string::value_type **)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string const>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string const>,std::reverse_iterator<std::string const*>,std::reverse_iterator<std::string const*>,std::reverse_iterator<std::string const*>>(uint64_t a1, uint64_t a2, const std::string::value_type **a3, uint64_t a4, const std::string::value_type **a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  std::string *v9;
  const std::string::value_type **v10;
  __int128 v11;
  uint64_t v12;
  _QWORD v14[3];
  char v15;
  __int128 v16;
  __int128 v17;

  v7 = a7;
  *(_QWORD *)&v17 = a6;
  *((_QWORD *)&v17 + 1) = a7;
  v16 = v17;
  v14[0] = a1;
  v14[1] = &v16;
  v14[2] = &v17;
  v15 = 0;
  if (a3 == a5)
  {
    v12 = a6;
  }
  else
  {
    do
    {
      v9 = (std::string *)(v7 - 24);
      v10 = a3 - 3;
      if (*((char *)a3 - 1) < 0)
      {
        std::string::__init_copy_ctor_external(v9, *(a3 - 3), (std::string::size_type)*(a3 - 2));
        v7 = *((_QWORD *)&v17 + 1);
      }
      else
      {
        v11 = *(_OWORD *)v10;
        *(_QWORD *)(v7 - 8) = *(a3 - 1);
        *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
      }
      v7 -= 24;
      *((_QWORD *)&v17 + 1) = v7;
      a3 = v10;
    }
    while (v10 != a5);
    v12 = v17;
  }
  v15 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string const>,std::reverse_iterator<std::string const*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v14);
  return v12;
}

void sub_207C5F998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string const>,std::reverse_iterator<std::string const*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string const>,std::reverse_iterator<std::string const*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string const>,std::reverse_iterator<std::string const*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string const>,std::reverse_iterator<std::string const*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 24;
  }
}

uint64_t std::__split_buffer<std::string const>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<std::string const>::__destruct_at_end[abi:ne180100](a1, *(void ***)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<std::string const>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 3;
      *(_QWORD *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::find<std::string>(_QWORD *a1, unsigned __int8 *a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;

  v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v12 = (uint64_t)(a1 + 4);
    do
    {
      v13 = *((_QWORD *)v11 + 1);
      if (v13 == v6)
      {
        if ((std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2) & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(_QWORD *)&v5)
            v13 %= *(_QWORD *)&v5;
        }
        else
        {
          v13 &= *(_QWORD *)&v5 - 1;
        }
        if (v13 != v9)
          return 0;
      }
      v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  unsigned __int8 **v14;
  unsigned __int8 *i;
  unint64_t v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  _QWORD *v23;
  unint64_t v24;
  _QWORD v26[3];

  v8 = (_QWORD *)(a1 + 24);
  v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v11)
        v4 = v9 % v11;
    }
    else
    {
      v4 = (v11 - 1) & v9;
    }
    v14 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      for (i = *v14; i; i = *(unsigned __int8 **)i)
      {
        v16 = *((_QWORD *)i + 1);
        if (v16 == v10)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11)
              v16 %= v11;
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    v19 = 1;
    if (v11 >= 3)
      v19 = (v11 & (v11 - 1)) != 0;
    v20 = v19 | (2 * v11);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__rehash<true>(a1, v22);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v4 = v10 % v11;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
  }
  v23 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v23)
  {
    *(_QWORD *)v26[0] = *v23;
    *v23 = v26[0];
  }
  else
  {
    *(_QWORD *)v26[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v26[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v26[0])
    {
      v24 = *(_QWORD *)(*(_QWORD *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11)
          v24 %= v11;
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v24) = v26[0];
    }
  }
  i = (unsigned __int8 *)v26[0];
  ++*v8;
  return i;
}

void sub_207C5FE1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void **__p, uint64_t a13)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,PerfTracerCategory>,void *>>>::operator()[abi:ne180100]((uint64_t)&a13, __p);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;
  std::string *v9;
  __int128 *v10;
  __int128 v11;

  v7 = a1 + 16;
  v8 = (char *)operator new(0x30uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  v9 = (std::string *)(v8 + 16);
  v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((_QWORD *)v10 + 1));
  }
  else
  {
    v11 = *v10;
    *((_QWORD *)v8 + 4) = *((_QWORD *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  *((_DWORD *)v8 + 10) = 0;
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_207C5FECC(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,PerfTracerCategory>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

ANEDebugInfo::DebugInfoParser *ANEDebugInfo::DebugInfoParser::DebugInfoParser(ANEDebugInfo::DebugInfoParser *this, const unsigned __int8 *a2, int a3)
{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  ANEDebugInfo::DebugInfoInMem::DebugInfoInMem((ANEDebugInfo::DebugInfoParser *)((char *)this + 24));
  *((_QWORD *)this + 24) = a2;
  *((_DWORD *)this + 50) = a3;
  *((_QWORD *)this + 26) = a2;
  *((_QWORD *)this + 27) = &a2[a3];
  return this;
}

void sub_207C5FF40(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::vector<ANEDebugInfo::DebugInfoInMem>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

BOOL ANEDebugInfo::DebugInfoParser::Parse(ANEDebugInfo::DebugInfoParser *this)
{
  _BOOL8 v2;

  v2 = ANEDebugInfo::DebugInfoParser::ParseCU(this);
  if (v2)
  {
    while (ANEDebugInfo::DebugInfoParser::ParseCU(this))
      ;
  }
  return v2;
}

BOOL ANEDebugInfo::DebugInfoParser::ParseCU(ANEDebugInfo::DebugInfoParser *this)
{
  _DWORD *v1;
  _BOOL8 result;
  uint64_t v4;
  uint64_t *Scalar;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  unint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  _OWORD v14[2];
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23[5];
  __int16 v24;
  char v25;
  void **v26;

  v1 = (_DWORD *)*((_QWORD *)this + 24);
  if ((unint64_t)v1 >= *((_QWORD *)this + 27) || *v1)
    return 0;
  *((_QWORD *)this + 24) = v1 + 2;
  if (!ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)this, 2061))
    goto LABEL_11;
  *(_QWORD *)&v14[0] = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
  *((_QWORD *)&v14[0] + 1) = v4;
  if (!HIDWORD(*(_QWORD *)&v14[0]))
    goto LABEL_11;
  Scalar = (uint64_t *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)v14);
  if (!Scalar)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ANEDebugInfo::DebugInfoParser::ParseCU();
    return 0;
  }
  v6 = *Scalar;
  if ((unint64_t)*Scalar >= 2)
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (result)
    {
      ANEDebugInfo::DebugInfoParser::ParseCU(v6);
      return 0;
    }
  }
  else
  {
LABEL_11:
    if (ANEDebugInfo::DebugInfoParser::ParseStringTable(this))
    {
      if (ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)this, 2049))
      {
        *(_QWORD *)&v14[0] = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
        *((_QWORD *)&v14[0] + 1) = v7;
        if (HIDWORD(*(_QWORD *)&v14[0]))
        {
          v8 = (_DWORD *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)v14);
          if (!v8)
          {
            if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
              ANEDebugInfo::DebugInfoParser::ParseCU();
            return 0;
          }
          *((_DWORD *)this + 22) = *v8;
        }
      }
      if (ANEDebugInfo::DebugInfoParser::ParseProc(this))
      {
        ANEDebugInfo::DebugInfoParser::ParseHwConfigs(this);
        if ((ANEDebugInfo::DebugInfoParser::ParseIdentString(this) & 1) != 0)
        {
          ANEDebugInfo::DebugInfoParser::ParseMaxContextLatencyThreshold(this);
          v9 = *((_QWORD *)this + 1);
          if (v9 >= *((_QWORD *)this + 2))
          {
            v10 = std::vector<ANEDebugInfo::DebugInfoInMem>::__push_back_slow_path<ANEDebugInfo::DebugInfoInMem const&>((uint64_t *)this, (__int128 *)((char *)this + 24));
          }
          else
          {
            std::construct_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem,ANEDebugInfo::DebugInfoInMem const&,ANEDebugInfo::DebugInfoInMem*>(*((_QWORD *)this + 1), (__int128 *)((char *)this + 24));
            v10 = v9 + 168;
            *((_QWORD *)this + 1) = v9 + 168;
          }
          *((_QWORD *)this + 1) = v10;
          ANEDebugInfo::DebugInfoInMem::DebugInfoInMem((ANEDebugInfo::DebugInfoInMem *)v14);
          v11 = v14[1];
          *(_OWORD *)((char *)this + 24) = v14[0];
          *(_OWORD *)((char *)this + 40) = v11;
          *((_QWORD *)this + 7) = v15;
          std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__vdeallocate((void **)this + 8);
          *((_OWORD *)this + 4) = v16;
          v12 = v17;
          v13 = v18;
          v17 = 0;
          v16 = 0uLL;
          *((_QWORD *)this + 10) = v12;
          *((_QWORD *)this + 11) = v13;
          std::vector<std::string const>::__vdeallocate((uint64_t *)this + 12);
          *((_OWORD *)this + 6) = v19;
          *((_QWORD *)this + 14) = v20;
          v20 = 0;
          v19 = 0uLL;
          *(_OWORD *)((char *)this + 120) = v21;
          *((_QWORD *)this + 17) = v22;
          std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__move_assign((uint64_t)this + 144, v23);
          *((_WORD *)this + 92) = v24;
          *((_BYTE *)this + 186) = v25;
          std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)v23);
          v26 = (void **)&v19;
          std::vector<std::string const>::__destroy_vector::operator()[abi:ne180100](&v26);
          v26 = (void **)&v16;
          std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100](&v26);
          return 1;
        }
        else
        {
          result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (result)
          {
            ANEDebugInfo::DebugInfoParser::ParseCU();
            return 0;
          }
        }
      }
      else
      {
        result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (result)
        {
          ANEDebugInfo::DebugInfoParser::ParseCU();
          return 0;
        }
      }
    }
    else
    {
      result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (result)
      {
        ANEDebugInfo::DebugInfoParser::ParseCU();
        return 0;
      }
    }
  }
  return result;
}

void sub_207C60230(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

void ANEDebugInfo::DebugInfoParser::GetCompilationUnit(ANEDebugInfo::DebugInfoParser *this@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  __int128 v5[2];
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  void **v10;

  v4 = *(_QWORD *)this;
  if (0xCF3CF3CF3CF3CF3DLL * ((uint64_t)(*((_QWORD *)this + 1) - *(_QWORD *)this) >> 3) <= a2)
  {
    v9 = 0;
    ANEDebugInfo::DebugInfoInMem::DebugInfoInMem((ANEDebugInfo::DebugInfoInMem *)v5);
    std::pair<BOOL,ANEDebugInfo::DebugInfoInMem>::pair[abi:ne180100]<BOOL,ANEDebugInfo::DebugInfoInMem,0>(a3, &v9, v5);
    std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)&v8);
    v10 = (void **)&v7;
    std::vector<std::string const>::__destroy_vector::operator()[abi:ne180100](&v10);
    v10 = (void **)&v6;
    std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100](&v10);
  }
  else
  {
    LOBYTE(v5[0]) = 1;
    std::pair<BOOL,ANEDebugInfo::DebugInfoInMem>::pair[abi:ne180100]<BOOL,ANEDebugInfo::DebugInfoInMem&,0>(a3, v5, (__int128 *)(v4 + 168 * a2));
  }
}

void ANEDebugInfo::DebugInfoParser::GetCompilationUnit(uint64_t *a1@<X0>, uint64_t a2@<X1>, unsigned __int8 *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int16 v10;
  uint64_t v11;
  std::string::size_type size;
  uint64_t v13;
  int v14;
  unsigned __int8 *v15;
  uint64_t v16;
  std::string *p_p;
  int v18;
  int v19;
  int v20;
  int v21;
  BOOL v23;
  _BOOL4 v24;
  void *v25;
  int v26;
  uint64_t v28;
  char v29;
  std::string __p;
  __int128 v31[2];
  uint64_t v32;
  _QWORD v33[3];
  unsigned int v34[2];
  std::string v35;
  __int128 v36;
  uint64_t v37;
  _WORD v38[21];
  char v39;

  v4 = *a1;
  v28 = a1[1];
  if (*a1 != v28)
  {
    while (1)
    {
      v7 = *(_OWORD *)v4;
      v8 = *(_OWORD *)(v4 + 16);
      v32 = *(_QWORD *)(v4 + 32);
      v31[0] = v7;
      v31[1] = v8;
      memset(v33, 0, sizeof(v33));
      std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__init_with_size[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group*,ANEDebugInfo::DebugInfoInMem::Group*>(v33, *(_QWORD *)(v4 + 40), *(_QWORD *)(v4 + 48), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v4 + 48) - *(_QWORD *)(v4 + 40)) >> 4));
      *(_QWORD *)v34 = *(_QWORD *)(v4 + 64);
      memset(&v35, 0, sizeof(v35));
      std::vector<std::string const>::__init_with_size[abi:ne180100]<std::string const*,std::string const*>(&v35, *(__int128 **)(v4 + 72), *(__int128 **)(v4 + 80), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(v4 + 80) - *(_QWORD *)(v4 + 72)) >> 3));
      v9 = *(_OWORD *)(v4 + 96);
      v37 = *(_QWORD *)(v4 + 112);
      v36 = v9;
      std::unordered_map<std::string,unsigned int>::unordered_map((uint64_t)v38, v4 + 120);
      v10 = *(_WORD *)(v4 + 160);
      v39 = *(_BYTE *)(v4 + 162);
      v38[20] = v10;
      v11 = *(unsigned __int8 *)(a2 + 23);
      if ((v11 & 0x80u) != 0)
        v11 = *(_QWORD *)(a2 + 8);
      if (v11)
        goto LABEL_29;
      ANEDebugInfo::DebugInfoInMem::GetString((ANEDebugInfo::DebugInfoInMem *)v31, v34[1], &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      else
        size = __p.__r_.__value_.__l.__size_;
      v13 = a3[23];
      v14 = (char)v13;
      if ((v13 & 0x80u) != 0)
        v13 = *((_QWORD *)a3 + 1);
      if (size != v13)
        break;
      if (v14 >= 0)
        v15 = a3;
      else
        v15 = *(unsigned __int8 **)a3;
      if ((*((_BYTE *)&__p.__r_.__value_.__s + 23) & 0x80) == 0)
      {
        if (!*((_BYTE *)&__p.__r_.__value_.__s + 23))
          goto LABEL_31;
        v16 = HIBYTE(__p.__r_.__value_.__r.__words[2]) - 1;
        p_p = &__p;
        do
        {
          v19 = p_p->__r_.__value_.__s.__data_[0];
          p_p = (std::string *)((char *)p_p + 1);
          v18 = v19;
          v21 = *v15++;
          v20 = v21;
          v23 = v16-- != 0;
          v24 = v18 == v20;
        }
        while (v18 == v20 && v23);
        if ((*((_BYTE *)&__p.__r_.__value_.__s + 23) & 0x80) == 0)
        {
LABEL_23:
          if (v24)
            goto LABEL_31;
          goto LABEL_29;
        }
        goto LABEL_26;
      }
      v25 = (void *)__p.__r_.__value_.__r.__words[0];
      v26 = memcmp(__p.__r_.__value_.__l.__data_, v15, __p.__r_.__value_.__l.__size_);
      operator delete(v25);
      if (!v26)
      {
LABEL_31:
        __p.__r_.__value_.__s.__data_[0] = 1;
        std::pair<BOOL,ANEDebugInfo::DebugInfoInMem>::pair[abi:ne180100]<BOOL,ANEDebugInfo::DebugInfoInMem&,0>(a4, &__p, v31);
        std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)v38);
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v35;
        std::vector<std::string const>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
        __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v33;
        goto LABEL_32;
      }
LABEL_29:
      std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)v38);
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v35;
      std::vector<std::string const>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v33;
      std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
      v4 += 168;
      if (v4 == v28)
        goto LABEL_30;
    }
    v24 = 0;
    if ((*((_BYTE *)&__p.__r_.__value_.__s + 23) & 0x80) == 0)
      goto LABEL_23;
LABEL_26:
    operator delete(__p.__r_.__value_.__l.__data_);
    if (v24)
      goto LABEL_31;
    goto LABEL_29;
  }
LABEL_30:
  v29 = 0;
  ANEDebugInfo::DebugInfoInMem::DebugInfoInMem((ANEDebugInfo::DebugInfoInMem *)v31);
  std::pair<BOOL,ANEDebugInfo::DebugInfoInMem>::pair[abi:ne180100]<BOOL,ANEDebugInfo::DebugInfoInMem,0>(a4, &v29, v31);
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table((uint64_t)v38);
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)&v35;
  std::vector<std::string const>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  __p.__r_.__value_.__r.__words[0] = (std::string::size_type)v33;
LABEL_32:
  std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
}

void sub_207C6056C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  ANEDebugInfo::DebugInfoInMem::~DebugInfoInMem((ANEDebugInfo::DebugInfoInMem *)va);
  _Unwind_Resume(a1);
}

BOOL ANEDebugInfo::DebugInfoParser::CheckToken(uint64_t a1, int a2)
{
  _DWORD *v2;
  unint64_t v3;
  _BOOL8 result;
  uint8_t v5[16];

  v2 = *(_DWORD **)(a1 + 192);
  v3 = *(_QWORD *)(a1 + 216);
  if ((unint64_t)v2 >= v3)
    return 0;
  if ((unint64_t)v2 + v2[1] > v3)
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO);
    if (!result)
      return result;
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Record size is bigger than the buffer size. ", v5, 2u);
    return 0;
  }
  return *v2 == a2;
}

unint64_t ANEDebugInfo::DebugInfoParser::MatchRecord(ANEDebugInfo::DebugInfoParser *this)
{
  unsigned int *v1;
  uint64_t v2;
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v1 = (unsigned int *)*((_QWORD *)this + 24);
  v2 = v1[1];
  *((_QWORD *)this + 24) = (char *)v1 + v2;
  if ((unint64_t)v1 + v2 <= *((_QWORD *)this + 27))
  {
    v11 = *v1;
    v12 = (unint64_t)(v2 - 8) << 32;
  }
  else
  {
    v3 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v3)
      ANEDebugInfo::DebugInfoParser::MatchRecord(v3, v4, v5, v6, v7, v8, v9, v10);
    v11 = 0;
    v12 = 0;
  }
  return v12 | v11;
}

uint64_t *ANEDebugInfo::DebugInfoParser::Print(uint64_t *this)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;

  v1 = *this;
  v2 = this[1];
  if (*this != v2)
  {
    v3 = (uint64_t *)MEMORY[0x24BEDB318];
    do
    {
      this = (uint64_t *)ANEDebugInfo::DebugInfoInMem::Dump(v1, v3);
      v1 += 168;
    }
    while (v1 != v2);
  }
  return this;
}

uint64_t ANEDebugInfo::DebugInfoParser::MatchTag(uint64_t a1, int a2)
{
  _DWORD *v2;

  v2 = *(_DWORD **)(a1 + 192);
  if ((unint64_t)v2 >= *(_QWORD *)(a1 + 216) || *v2 != a2)
    return 0;
  *(_QWORD *)(a1 + 192) = v2 + 2;
  return 1;
}

uint64_t ANEDebugInfo::Record::GetScalarVal<unsigned long long>(uint64_t a1)
{
  uint64_t v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 8);
  if (!v1)
  {
    v2 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v2)
      ANEDebugInfo::Record::GetScalarVal<unsigned long long>(v2, v3, v4, v5, v6, v7, v8, v9);
  }
  return v1;
}

BOOL ANEDebugInfo::DebugInfoParser::ParseStringTable(ANEDebugInfo::DebugInfoParser *this)
{
  _DWORD *v1;
  _BOOL8 result;
  unint64_t matched;
  char *v5;
  unint64_t v6;
  char *v7;
  unsigned int v8;
  size_t v9;
  unint64_t v10;
  __int128 v11;
  uint64_t v12;
  void *__p[2];
  uint64_t v14;

  v1 = (_DWORD *)*((_QWORD *)this + 24);
  if ((unint64_t)v1 >= *((_QWORD *)this + 27) || *v1 != 8)
    return 0;
  *((_QWORD *)this + 24) = v1 + 2;
  result = ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)this, 2051);
  if (!result)
    return result;
  matched = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
  v6 = HIDWORD(matched);
  if (!HIDWORD(matched))
    return 0;
  v7 = v5;
  v8 = 0;
  do
  {
    v9 = strlen(v7) + 1;
    if (v9 >= 2)
    {
      std::string::basic_string[abi:ne180100]<0>(__p, v7);
      v10 = *((_QWORD *)this + 13);
      if (v10 >= *((_QWORD *)this + 14))
      {
        v12 = std::vector<std::string const>::__push_back_slow_path<std::string const>((uint64_t *)this + 12, (__int128 *)__p);
      }
      else
      {
        if (SHIBYTE(v14) < 0)
        {
          std::string::__init_copy_ctor_external(*((std::string **)this + 13), (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
        }
        else
        {
          v11 = *(_OWORD *)__p;
          *(_QWORD *)(v10 + 16) = v14;
          *(_OWORD *)v10 = v11;
        }
        v12 = v10 + 24;
        *((_QWORD *)this + 13) = v10 + 24;
      }
      *((_QWORD *)this + 13) = v12;
      if (SHIBYTE(v14) < 0)
        operator delete(__p[0]);
    }
    v8 += v9;
    v7 += v9;
  }
  while (v8 < v6);
  return 1;
}

void sub_207C60884(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  uint64_t v15;
  uint64_t v16;

  *(_QWORD *)(v15 + 104) = v16;
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL ANEDebugInfo::DebugInfoParser::ParseProc(ANEDebugInfo::DebugInfoParser *this)
{
  _DWORD *v1;
  uint64_t v3;
  _DWORD *Scalar;
  uint64_t v5;
  _QWORD *v6;
  _BOOL8 result;
  unint64_t matched;
  uint64_t v9;

  v1 = (_DWORD *)*((_QWORD *)this + 24);
  if ((unint64_t)v1 >= *((_QWORD *)this + 27) || *v1 != 1)
    return 0;
  *((_QWORD *)this + 24) = v1 + 2;
  if (ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)this, 2048))
  {
    matched = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
    v9 = v3;
    if (HIDWORD(matched))
    {
      Scalar = (_DWORD *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&matched);
      if (!Scalar)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          ANEDebugInfo::DebugInfoParser::ParseProc();
        return 0;
      }
      *((_DWORD *)this + 23) = *Scalar;
    }
  }
  if (ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)this, 2056))
  {
    matched = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
    v9 = v5;
    if (HIDWORD(matched))
    {
      v6 = (_QWORD *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&matched);
      if (v6)
      {
        *((_QWORD *)this + 15) = *v6;
        goto LABEL_11;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ANEDebugInfo::DebugInfoParser::ParseProc();
      return 0;
    }
  }
LABEL_11:
  if (!ANEDebugInfo::DebugInfoParser::ParseGroup(this))
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    ANEDebugInfo::DebugInfoParser::ParseProc();
    return 0;
  }
  while ((ANEDebugInfo::DebugInfoParser::ParseGroup(this) & 1) != 0)
    ;
  return 1;
}

uint64_t ANEDebugInfo::DebugInfoParser::ParseHwConfigs(ANEDebugInfo::DebugInfoParser *this)
{
  _DWORD *v1;
  uint64_t result;
  uint64_t v4;
  unint64_t *Scalar;
  uint64_t v6;
  unint64_t *v7;
  uint64_t v8;
  unint64_t *v9;
  unint64_t matched;
  uint64_t v11;

  v1 = (_DWORD *)*((_QWORD *)this + 24);
  if ((unint64_t)v1 >= *((_QWORD *)this + 27))
    return 0;
  result = 1;
  if (*v1 != 10)
    return result;
  *((_QWORD *)this + 24) = v1 + 2;
  *((_BYTE *)this + 184) = 1;
  if (ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)this, 2057))
  {
    matched = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
    v11 = v4;
    if (!HIDWORD(matched))
      return 0;
    Scalar = (unint64_t *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&matched);
    if (!Scalar)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ANEDebugInfo::DebugInfoParser::ParseHwConfigs();
      return 0;
    }
    *((double *)this + 3) = (double)*Scalar;
  }
  if (ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)this, 2058))
  {
    matched = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
    v11 = v6;
    if (!HIDWORD(matched))
      return 0;
    v7 = (unint64_t *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&matched);
    if (!v7)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ANEDebugInfo::DebugInfoParser::ParseHwConfigs();
      return 0;
    }
    *((double *)this + 4) = (double)*v7;
  }
  if (!ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)this, 2059))
    return 1;
  matched = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
  v11 = v8;
  if (HIDWORD(matched))
  {
    v9 = (unint64_t *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&matched);
    if (v9)
    {
      *((double *)this + 6) = (double)*v9;
      return 1;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ANEDebugInfo::DebugInfoParser::ParseHwConfigs();
  }
  return 0;
}

uint64_t ANEDebugInfo::DebugInfoParser::ParseIdentString(ANEDebugInfo::DebugInfoParser *this)
{
  uint64_t v2;
  _DWORD *Scalar;
  _QWORD v5[2];

  if (*((_QWORD *)this + 24) < *((_QWORD *)this + 27))
  {
    if (!ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)this, 2063))
      return 1;
    v5[0] = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
    v5[1] = v2;
    if (HIDWORD(v5[0]))
    {
      Scalar = (_DWORD *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)v5);
      if (Scalar)
      {
        *((_DWORD *)this + 34) = *Scalar;
        return 1;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ANEDebugInfo::DebugInfoParser::ParseIdentString();
    }
  }
  return 0;
}

uint64_t ANEDebugInfo::DebugInfoParser::ParseMaxContextLatencyThreshold(ANEDebugInfo::DebugInfoParser *this)
{
  _BOOL4 v2;
  uint64_t result;
  uint64_t v4;
  _QWORD *Scalar;
  _QWORD v6[2];

  if (*((_QWORD *)this + 24) < *((_QWORD *)this + 27))
  {
    v2 = ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)this, 2064);
    result = 1;
    if (!v2)
      return result;
    *((_BYTE *)this + 185) = 1;
    v6[0] = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
    v6[1] = v4;
    if (HIDWORD(v6[0]))
    {
      Scalar = (_QWORD *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)v6);
      if (Scalar)
      {
        *((_QWORD *)this + 16) = *Scalar;
        return 1;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ANEDebugInfo::DebugInfoParser::ParseMaxContextLatencyThreshold();
    }
  }
  return 0;
}

uint64_t ANEDebugInfo::DebugInfoParser::ParseGroup(ANEDebugInfo::DebugInfoParser *this)
{
  _DWORD *v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7[2];
  void *__p[2];
  __int128 v9;

  v1 = (_DWORD *)*((_QWORD *)this + 24);
  if ((unint64_t)v1 >= *((_QWORD *)this + 27) || *v1 != 9)
    return 0;
  *((_QWORD *)this + 24) = v1 + 2;
  *(_OWORD *)__p = 0u;
  v9 = 0u;
  *(_OWORD *)v7 = 0u;
  if (ANEDebugInfo::DebugInfoParser::ParseLayer(this, (ANEDebugInfo::DebugInfoInMem::Group *)v7))
  {
    while (ANEDebugInfo::DebugInfoParser::ParseLayer(this, (ANEDebugInfo::DebugInfoInMem::Group *)v7))
      ;
    if (ANEDebugInfo::DebugInfoParser::ParseTD(this, (ANEDebugInfo::DebugInfoInMem::Group *)v7))
    {
      while (ANEDebugInfo::DebugInfoParser::ParseTD(this, (ANEDebugInfo::DebugInfoInMem::Group *)v7))
        ;
      v3 = *((_QWORD *)this + 9);
      if (v3 >= *((_QWORD *)this + 10))
      {
        v4 = std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__push_back_slow_path<ANEDebugInfo::DebugInfoInMem::Group const&>((uint64_t *)this + 8, (uint64_t)v7);
      }
      else
      {
        std::construct_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group,ANEDebugInfo::DebugInfoInMem::Group const&,ANEDebugInfo::DebugInfoInMem::Group*>(*((_QWORD **)this + 9), (uint64_t)v7);
        v4 = v3 + 48;
        *((_QWORD *)this + 9) = v3 + 48;
      }
      *((_QWORD *)this + 9) = v4;
      v5 = 1;
      goto LABEL_18;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ANEDebugInfo::DebugInfoParser::ParseGroup();
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    ANEDebugInfo::DebugInfoParser::ParseGroup();
  }
  v5 = 0;
LABEL_18:
  if (__p[1])
  {
    *(void **)&v9 = __p[1];
    operator delete(__p[1]);
  }
  if (v7[0])
  {
    v7[1] = v7[0];
    operator delete(v7[0]);
  }
  return v5;
}

void sub_207C60D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = v10;
  *(_QWORD *)(v9 + 72) = v11;
  ANEDebugInfo::DebugInfoInMem::Group::~Group((ANEDebugInfo::DebugInfoInMem::Group *)&a9);
  _Unwind_Resume(a1);
}

BOOL ANEDebugInfo::DebugInfoParser::ParseLayer(ANEDebugInfo::DebugInfoParser *this, ANEDebugInfo::DebugInfoInMem::Group *a2)
{
  _DWORD *v2;
  uint64_t v5;
  _DWORD *Scalar;
  uint64_t v7;
  int *v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  _BOOL8 result;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  _DWORD *v20;
  _DWORD *v21;
  uint64_t v22;
  int v23;
  unint64_t matched;
  uint64_t v25;
  uint64_t v26;
  int v27;

  v2 = (_DWORD *)*((_QWORD *)this + 24);
  if ((unint64_t)v2 >= *((_QWORD *)this + 27) || *v2 != 3)
    return 0;
  *((_QWORD *)this + 24) = v2 + 2;
  if (ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)this, 2048))
  {
    matched = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
    v25 = v5;
    if (HIDWORD(matched))
    {
      Scalar = (_DWORD *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&matched);
      if (!Scalar)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          ANEDebugInfo::DebugInfoParser::ParseLayer();
        return 0;
      }
      LODWORD(v26) = *Scalar;
    }
  }
  if (ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)this, 2060))
  {
    matched = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
    v25 = v7;
    if (!HIDWORD(matched))
      goto LABEL_12;
    v8 = (int *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&matched);
    if (v8)
    {
      v27 = *v8;
      goto LABEL_12;
    }
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ANEDebugInfo::DebugInfoParser::ParseLayer();
    return 0;
  }
  v27 = 1065353216;
LABEL_12:
  if (!ANEDebugInfo::DebugInfoParser::ParseOperation(this, (uint64_t)&v26))
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    ANEDebugInfo::DebugInfoParser::ParseLayer();
    return 0;
  }
  v9 = *((_QWORD *)a2 + 2);
  v10 = *((_QWORD *)a2 + 1);
  if (v10 >= v9)
  {
    v13 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v10 - *(_QWORD *)a2) >> 2);
    v14 = v13 + 1;
    if (v13 + 1 > 0x1555555555555555)
      std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]();
    v15 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - *(_QWORD *)a2) >> 2);
    if (2 * v15 > v14)
      v14 = 2 * v15;
    if (v15 >= 0xAAAAAAAAAAAAAAALL)
      v16 = 0x1555555555555555;
    else
      v16 = v14;
    if (v16)
      v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem::Layer>>((uint64_t)a2 + 16, v16);
    else
      v17 = 0;
    v18 = &v17[12 * v13];
    v19 = &v17[12 * v16];
    *(_QWORD *)v18 = v26;
    *((_DWORD *)v18 + 2) = v27;
    v11 = v18 + 12;
    v21 = *(_DWORD **)a2;
    v20 = (_DWORD *)*((_QWORD *)a2 + 1);
    if (v20 != *(_DWORD **)a2)
    {
      do
      {
        v22 = *(_QWORD *)(v20 - 3);
        v20 -= 3;
        v23 = v20[2];
        *(_QWORD *)(v18 - 12) = v22;
        v18 -= 12;
        *((_DWORD *)v18 + 2) = v23;
      }
      while (v20 != v21);
      v20 = *(_DWORD **)a2;
    }
    *(_QWORD *)a2 = v18;
    *((_QWORD *)a2 + 1) = v11;
    *((_QWORD *)a2 + 2) = v19;
    if (v20)
      operator delete(v20);
  }
  else
  {
    *(_QWORD *)v10 = v26;
    *(_DWORD *)(v10 + 8) = v27;
    v11 = (char *)(v10 + 12);
  }
  *((_QWORD *)a2 + 1) = v11;
  return 1;
}

BOOL ANEDebugInfo::DebugInfoParser::ParseTD(ANEDebugInfo::DebugInfoParser *this, ANEDebugInfo::DebugInfoInMem::Group *a2)
{
  _DWORD *v2;
  uint64_t v5;
  _DWORD *Scalar;
  unint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  char *v11;
  _BOOL8 result;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  __int128 v21;
  __int128 v22;
  char *v23;
  char *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[2];
  _BYTE v29[72];

  v2 = (_DWORD *)*((_QWORD *)this + 24);
  if ((unint64_t)v2 >= *((_QWORD *)this + 27) || *v2 != 5)
    return 0;
  *((_QWORD *)this + 24) = v2 + 2;
  v29[4] = 0;
  memset(&v29[8], 0, 64);
  if (ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)this, 2050))
  {
    v28[0] = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
    v28[1] = v5;
    if (HIDWORD(v28[0]))
    {
      Scalar = (_DWORD *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)v28);
      if (Scalar)
      {
        *(_DWORD *)v29 = *Scalar;
        goto LABEL_7;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ANEDebugInfo::DebugInfoParser::ParseTD();
      return 0;
    }
  }
LABEL_7:
  if ((ANEDebugInfo::DebugInfoParser::ParseViolateMaxContextLatencyFlag(this, (uint64_t)v29) & 1) == 0)
  {
    result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    ANEDebugInfo::DebugInfoParser::ParseTD();
    return 0;
  }
  ANEDebugInfo::DebugInfoParser::ParsePerfStats((uint64_t)this, v29);
  ANEDebugInfo::DebugInfoParser::ParsePerfTracerInfo((uint64_t)this, (uint64_t)v29);
  v7 = *((_QWORD *)a2 + 5);
  v8 = *((_QWORD *)a2 + 4);
  if (v8 >= v7)
  {
    v13 = *((_QWORD *)a2 + 3);
    v14 = 0x8E38E38E38E38E39 * ((uint64_t)(v8 - v13) >> 3);
    v15 = v14 + 1;
    if (v14 + 1 > 0x38E38E38E38E38ELL)
      std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]();
    v16 = 0x8E38E38E38E38E39 * ((uint64_t)(v7 - v13) >> 3);
    if (2 * v16 > v15)
      v15 = 2 * v16;
    if (v16 >= 0x1C71C71C71C71C7)
      v17 = 0x38E38E38E38E38ELL;
    else
      v17 = v15;
    if (v17)
      v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem::TD>>((uint64_t)a2 + 40, v17);
    else
      v18 = 0;
    v19 = &v18[72 * v14];
    v20 = &v18[72 * v17];
    *((_QWORD *)v19 + 8) = *(_QWORD *)&v29[64];
    v21 = *(_OWORD *)&v29[48];
    *((_OWORD *)v19 + 2) = *(_OWORD *)&v29[32];
    *((_OWORD *)v19 + 3) = v21;
    v22 = *(_OWORD *)&v29[16];
    *(_OWORD *)v19 = *(_OWORD *)v29;
    *((_OWORD *)v19 + 1) = v22;
    v11 = v19 + 72;
    v24 = (char *)*((_QWORD *)a2 + 3);
    v23 = (char *)*((_QWORD *)a2 + 4);
    if (v23 != v24)
    {
      do
      {
        *(_OWORD *)(v19 - 72) = *(_OWORD *)(v23 - 72);
        v25 = *(_OWORD *)(v23 - 56);
        v26 = *(_OWORD *)(v23 - 40);
        v27 = *(_OWORD *)(v23 - 24);
        *((_QWORD *)v19 - 1) = *((_QWORD *)v23 - 1);
        *(_OWORD *)(v19 - 24) = v27;
        *(_OWORD *)(v19 - 40) = v26;
        *(_OWORD *)(v19 - 56) = v25;
        v19 -= 72;
        v23 -= 72;
      }
      while (v23 != v24);
      v23 = (char *)*((_QWORD *)a2 + 3);
    }
    *((_QWORD *)a2 + 3) = v19;
    *((_QWORD *)a2 + 4) = v11;
    *((_QWORD *)a2 + 5) = v20;
    if (v23)
      operator delete(v23);
  }
  else
  {
    v9 = *(_OWORD *)&v29[48];
    *(_OWORD *)(v8 + 32) = *(_OWORD *)&v29[32];
    *(_OWORD *)(v8 + 48) = v9;
    *(_QWORD *)(v8 + 64) = *(_QWORD *)&v29[64];
    v10 = *(_OWORD *)&v29[16];
    *(_OWORD *)v8 = *(_OWORD *)v29;
    *(_OWORD *)(v8 + 16) = v10;
    v11 = (char *)(v8 + 72);
  }
  *((_QWORD *)a2 + 4) = v11;
  return 1;
}

BOOL ANEDebugInfo::DebugInfoParser::ParseOperation(ANEDebugInfo::DebugInfoParser *a1, uint64_t a2)
{
  _DWORD *v2;
  uint64_t v5;
  _DWORD *Scalar;
  _BOOL8 v7;
  _QWORD v9[2];

  v2 = (_DWORD *)*((_QWORD *)a1 + 24);
  if ((unint64_t)v2 >= *((_QWORD *)a1 + 27))
    return 0;
  if (*v2 != 4)
    return 0;
  *((_QWORD *)a1 + 24) = v2 + 2;
  if (!ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)a1, 2048))
    return 0;
  v9[0] = ANEDebugInfo::DebugInfoParser::MatchRecord(a1);
  v9[1] = v5;
  Scalar = (_DWORD *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)v9);
  v7 = Scalar != 0;
  if (Scalar)
  {
    *(_DWORD *)(a2 + 4) = *Scalar;
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    ANEDebugInfo::DebugInfoParser::ParseOperation();
  }
  return v7;
}

uint64_t ANEDebugInfo::DebugInfoParser::ParseViolateMaxContextLatencyFlag(ANEDebugInfo::DebugInfoParser *a1, uint64_t a2)
{
  uint64_t v4;
  _BYTE *Scalar;
  _QWORD v7[2];

  if (*((_QWORD *)a1 + 24) < *((_QWORD *)a1 + 27))
  {
    if (!ANEDebugInfo::DebugInfoParser::CheckToken((uint64_t)a1, 2062))
      return 1;
    v7[0] = ANEDebugInfo::DebugInfoParser::MatchRecord(a1);
    v7[1] = v4;
    if (HIDWORD(v7[0]))
    {
      Scalar = (_BYTE *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)v7);
      if (Scalar)
      {
        *(_BYTE *)(a2 + 4) = *Scalar;
        return 1;
      }
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ANEDebugInfo::DebugInfoParser::ParseViolateMaxContextLatencyFlag();
    }
  }
  return 0;
}

BOOL ANEDebugInfo::DebugInfoParser::ParsePerfStats(uint64_t a1, _QWORD *a2)
{
  _DWORD *v2;
  uint64_t v5;
  _QWORD *Scalar;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  _BOOL8 result;
  uint64_t v12;
  _QWORD *v13;
  unint64_t matched;
  uint64_t v15;

  v2 = *(_DWORD **)(a1 + 192);
  if ((unint64_t)v2 >= *(_QWORD *)(a1 + 216) || *v2 != 6)
    return 0;
  *(_QWORD *)(a1 + 192) = v2 + 2;
  *(_BYTE *)(a1 + 184) = 1;
  if (ANEDebugInfo::DebugInfoParser::CheckToken(a1, 2052))
  {
    matched = ANEDebugInfo::DebugInfoParser::MatchRecord((ANEDebugInfo::DebugInfoParser *)a1);
    v15 = v5;
    if (!HIDWORD(matched))
      return 0;
    Scalar = (_QWORD *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&matched);
    if (!Scalar)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ANEDebugInfo::DebugInfoParser::ParsePerfStats();
      return 0;
    }
    a2[1] = *Scalar;
  }
  if (ANEDebugInfo::DebugInfoParser::CheckToken(a1, 2053))
  {
    matched = ANEDebugInfo::DebugInfoParser::MatchRecord((ANEDebugInfo::DebugInfoParser *)a1);
    v15 = v7;
    if (!HIDWORD(matched))
      return 0;
    v8 = (_QWORD *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&matched);
    if (!v8)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        ANEDebugInfo::DebugInfoParser::ParsePerfStats();
      return 0;
    }
    a2[2] = *v8;
  }
  if (!ANEDebugInfo::DebugInfoParser::CheckToken(a1, 2054))
    goto LABEL_15;
  matched = ANEDebugInfo::DebugInfoParser::MatchRecord((ANEDebugInfo::DebugInfoParser *)a1);
  v15 = v9;
  if (!HIDWORD(matched))
    return 0;
  v10 = (_QWORD *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&matched);
  if (!v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ANEDebugInfo::DebugInfoParser::ParsePerfStats();
    return 0;
  }
  a2[3] = *v10;
LABEL_15:
  result = ANEDebugInfo::DebugInfoParser::CheckToken(a1, 2055);
  if (!result)
    return result;
  matched = ANEDebugInfo::DebugInfoParser::MatchRecord((ANEDebugInfo::DebugInfoParser *)a1);
  v15 = v12;
  if (!HIDWORD(matched))
    return 0;
  v13 = (_QWORD *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&matched);
  if (v13)
  {
    a2[4] = *v13;
    return 1;
  }
  result = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (result)
  {
    ANEDebugInfo::DebugInfoParser::ParsePerfStats();
    return 0;
  }
  return result;
}

uint64_t ANEDebugInfo::DebugInfoParser::ParsePerfTracerInfo(uint64_t a1, uint64_t a2)
{
  _DWORD *v2;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  _QWORD *Scalar;
  uint64_t v9;
  _QWORD *v10;
  unint64_t matched;
  uint64_t v12;

  v2 = *(_DWORD **)(a1 + 192);
  if ((unint64_t)v2 >= *(_QWORD *)(a1 + 216))
    return 0;
  result = 1;
  if (*v2 == 11)
  {
    v6 = 0;
    *(_QWORD *)(a1 + 192) = v2 + 2;
    *(_BYTE *)(a1 + 186) = 1;
    while (1)
    {
      if (ANEDebugInfo::DebugInfoParser::CheckToken(a1, 2066))
      {
        matched = ANEDebugInfo::DebugInfoParser::MatchRecord((ANEDebugInfo::DebugInfoParser *)a1);
        v12 = v7;
        if (!HIDWORD(matched))
          return 0;
        Scalar = (_QWORD *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&matched);
        if (!Scalar)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            ANEDebugInfo::DebugInfoParser::ParsePerfTracerInfo();
          return 0;
        }
        *(_DWORD *)(a2 + v6 + 40) = *Scalar;
      }
      if (ANEDebugInfo::DebugInfoParser::CheckToken(a1, 2067))
      {
        matched = ANEDebugInfo::DebugInfoParser::MatchRecord((ANEDebugInfo::DebugInfoParser *)a1);
        v12 = v9;
        if (!HIDWORD(matched))
          return 0;
        v10 = (_QWORD *)ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&matched);
        if (!v10)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            ANEDebugInfo::DebugInfoParser::ParsePerfTracerInfo();
          return 0;
        }
        *(_DWORD *)(a2 + v6 + 44) = *v10;
      }
      v6 += 8;
      if (v6 == 32)
        return 1;
    }
  }
  return result;
}

uint64_t ANEDebugInfo::DebugInfoParser::DebugPrint(ANEDebugInfo::DebugInfoParser *this)
{
  char *v1;
  uint64_t v2;
  char *i;
  unint64_t matched;
  const void *v6;
  unsigned int v7;
  int v8;
  unint64_t v10;
  const void *v11;

  v1 = (char *)*((_QWORD *)this + 26);
  v2 = *((unsigned int *)this + 50);
  for (i = &v1[v2]; *((_QWORD *)this + 24) < (unint64_t)&v1[v2]; i = &v1[v2])
  {
    matched = ANEDebugInfo::DebugInfoParser::MatchRecord(this);
    v10 = matched;
    v11 = v6;
    if (matched >= 0xFF)
      v7 = 255;
    else
      v7 = matched;
    if (v7 <= 9 && ((0x36Bu >> v7) & 1) != 0)
      printf((&off_24C06AE40)[(char)v7]);
    if (v10 <= 0xFF)
      v8 = 2065;
    else
      v8 = v10;
    switch(v8)
    {
      case 2048:
        printf("\tNAME");
        break;
      case 2049:
        printf("\tFILE_NAME");
        break;
      case 2050:
        if (ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&v10))
          printf("\tID = %d");
        break;
      case 2051:
        printf("\tDATA");
        break;
      default:
        if (v8 == 2062 && ANEDebugInfo::Record::GetScalarVal<unsigned long long>((uint64_t)&v10))
          printf("\tViolatesMaxLatency = %s");
        break;
    }
    printf("  [sz=%d p=%p]\n", HIDWORD(v10), v11);
    v1 = (char *)*((_QWORD *)this + 26);
    v2 = *((unsigned int *)this + 50);
  }
  return printf("buf=%p buf_sz=%d buf_tail=%p\n", v1, v2, i);
}

uint64_t std::pair<BOOL,ANEDebugInfo::DebugInfoInMem>::pair[abi:ne180100]<BOOL,ANEDebugInfo::DebugInfoInMem&,0>(uint64_t a1, _BYTE *a2, __int128 *a3)
{
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int16 v9;

  *(_BYTE *)a1 = *a2;
  v5 = *a3;
  v6 = a3[1];
  *(_QWORD *)(a1 + 40) = *((_QWORD *)a3 + 4);
  *(_OWORD *)(a1 + 24) = v6;
  *(_OWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__init_with_size[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group*,ANEDebugInfo::DebugInfoInMem::Group*>((_QWORD *)(a1 + 48), *((_QWORD *)a3 + 5), *((_QWORD *)a3 + 6), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 6) - *((_QWORD *)a3 + 5)) >> 4));
  v7 = *((_QWORD *)a3 + 8);
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 72) = v7;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  std::vector<std::string const>::__init_with_size[abi:ne180100]<std::string const*,std::string const*>((std::string *)(a1 + 80), *((__int128 **)a3 + 9), *((__int128 **)a3 + 10), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a3 + 10) - *((_QWORD *)a3 + 9)) >> 3));
  v8 = a3[6];
  *(_QWORD *)(a1 + 120) = *((_QWORD *)a3 + 14);
  *(_OWORD *)(a1 + 104) = v8;
  std::unordered_map<std::string,unsigned int>::unordered_map(a1 + 128, (uint64_t)a3 + 120);
  v9 = *((_WORD *)a3 + 80);
  *(_BYTE *)(a1 + 170) = *((_BYTE *)a3 + 162);
  *(_WORD *)(a1 + 168) = v9;
  return a1;
}

void sub_207C618DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::vector<std::string const>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t std::pair<BOOL,ANEDebugInfo::DebugInfoInMem>::pair[abi:ne180100]<BOOL,ANEDebugInfo::DebugInfoInMem,0>(uint64_t a1, _BYTE *a2, __int128 *a3)
{
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int16 v9;

  *(_BYTE *)a1 = *a2;
  v5 = *a3;
  v6 = *((_QWORD *)a3 + 4);
  *(_OWORD *)(a1 + 24) = a3[1];
  *(_OWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 40) = v6;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 48) = *(__int128 *)((char *)a3 + 40);
  *(_QWORD *)(a1 + 64) = *((_QWORD *)a3 + 7);
  *((_QWORD *)a3 + 6) = 0;
  *((_QWORD *)a3 + 7) = 0;
  *((_QWORD *)a3 + 5) = 0;
  v7 = *((_QWORD *)a3 + 8);
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 96) = 0;
  *(_QWORD *)(a1 + 72) = v7;
  *(_QWORD *)(a1 + 80) = 0;
  *(_OWORD *)(a1 + 80) = *(__int128 *)((char *)a3 + 72);
  *(_QWORD *)(a1 + 96) = *((_QWORD *)a3 + 11);
  *((_QWORD *)a3 + 9) = 0;
  *((_QWORD *)a3 + 10) = 0;
  *((_QWORD *)a3 + 11) = 0;
  v8 = a3[6];
  *(_QWORD *)(a1 + 120) = *((_QWORD *)a3 + 14);
  *(_OWORD *)(a1 + 104) = v8;
  std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__hash_table(a1 + 128, (uint64_t *)a3 + 15);
  v9 = *((_WORD *)a3 + 80);
  *(_BYTE *)(a1 + 170) = *((_BYTE *)a3 + 162);
  *(_WORD *)(a1 + 168) = v9;
  return a1;
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__hash_table(uint64_t result, uint64_t *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v2 = *a2;
  *a2 = 0;
  *(_QWORD *)result = v2;
  *(_QWORD *)(result + 8) = a2[1];
  a2[1] = 0;
  v5 = a2[2];
  v3 = a2 + 2;
  v4 = v5;
  *(_QWORD *)(result + 16) = v5;
  v6 = v3[1];
  *(_QWORD *)(result + 24) = v6;
  *(_DWORD *)(result + 32) = *((_DWORD *)v3 + 4);
  if (v6)
  {
    v7 = *(_QWORD *)(v4 + 8);
    v8 = *(_QWORD *)(result + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v7 %= v8;
    }
    else
    {
      v7 &= v8 - 1;
    }
    *(_QWORD *)(v2 + 8 * v7) = result + 16;
    *v3 = 0;
    v3[1] = 0;
  }
  return result;
}

_QWORD *std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__init_with_size[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group*,ANEDebugInfo::DebugInfoInMem::Group*>(_QWORD *result, uint64_t a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;

  if (a4)
  {
    v6 = result;
    std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__vallocate[abi:ne180100](result, a4);
    result = (_QWORD *)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem::Group>,ANEDebugInfo::DebugInfoInMem::Group*,ANEDebugInfo::DebugInfoInMem::Group*,ANEDebugInfo::DebugInfoInMem::Group*>((uint64_t)(v6 + 2), a2, a3, v6[1]);
    v6[1] = result;
  }
  return result;
}

void sub_207C61A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0x555555555555556)
    std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem::Group>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[48 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem::Group>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(48 * a2);
}

uint64_t std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem::Group>,ANEDebugInfo::DebugInfoInMem::Group*,ANEDebugInfo::DebugInfoInMem::Group*,ANEDebugInfo::DebugInfoInMem::Group*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  if (a2 != a3)
  {
    v7 = 0;
    do
    {
      std::construct_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group,ANEDebugInfo::DebugInfoInMem::Group&,ANEDebugInfo::DebugInfoInMem::Group*>((_QWORD *)(a4 + v7), a2 + v7);
      v7 += 48;
    }
    while (a2 + v7 != a3);
    a4 += v7;
  }
  return a4;
}

void sub_207C61B98(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  if (v2)
  {
    v4 = v1 - 48;
    do
    {
      std::__destroy_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group,0>(v4 + v2);
      v2 -= 48;
    }
    while (v2);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *std::construct_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group,ANEDebugInfo::DebugInfoInMem::Group&,ANEDebugInfo::DebugInfoInMem::Group*>(_QWORD *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  std::vector<ANEDebugInfo::DebugInfoInMem::Layer>::__init_with_size[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Layer*,ANEDebugInfo::DebugInfoInMem::Layer*>(a1, *(const void **)a2, *(_QWORD *)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 2));
  a1[3] = 0;
  a1[4] = 0;
  a1[5] = 0;
  std::vector<ANEDebugInfo::DebugInfoInMem::TD>::__init_with_size[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::TD*,ANEDebugInfo::DebugInfoInMem::TD*>(a1 + 3, *(const void **)(a2 + 24), *(_QWORD *)(a2 + 32), 0x8E38E38E38E38E39 * ((uint64_t)(*(_QWORD *)(a2 + 32) - *(_QWORD *)(a2 + 24)) >> 3));
  return a1;
}

void sub_207C61C38(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

std::string *std::vector<std::string const>::__init_with_size[abi:ne180100]<std::string const*,std::string const*>(std::string *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  std::string *v6;

  if (a4)
  {
    v6 = result;
    std::vector<std::string const>::__vallocate[abi:ne180100](result, a4);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string const>,std::string const*,std::string const*,std::string const*>((uint64_t)&v6->__r_.__value_.__r.__words[2], a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

void sub_207C61CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<std::string const>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::string const>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string const>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string const>,std::string const*,std::string const*,std::string const*>(uint64_t a1, __int128 *a2, __int128 *a3, std::string *this)
{
  std::string *v4;
  __int128 *v6;
  __int128 v7;
  _QWORD v9[3];
  char v10;
  std::string *v11;
  std::string *v12;

  v4 = this;
  v11 = this;
  v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  v10 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((_QWORD *)v6 + 1));
        v4 = v12;
      }
      else
      {
        v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      v6 = (__int128 *)((char *)v6 + 24);
      v12 = ++v4;
    }
    while (v6 != a3);
  }
  v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string const>,std::string const*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_207C61DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string const>,std::string const*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string const>,std::string const*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string const>,std::string const*>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string const>,std::string const*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = **(_QWORD **)(a1 + 16);
  v2 = **(_QWORD **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 1) < 0)
      operator delete(*(void **)(v1 - 24));
    v1 -= 24;
  }
}

uint64_t std::unordered_map<std::string,unsigned int>::unordered_map(uint64_t a1, uint64_t a2)
{
  unsigned __int8 *i;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__rehash<true>(a1, *(_QWORD *)(a2 + 8));
  for (i = *(unsigned __int8 **)(a2 + 16); i; i = *(unsigned __int8 **)i)
    std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,PerfTracerCategory> const&>(a1, i + 16, (uint64_t)(i + 16));
  return a1;
}

void sub_207C61EB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

uint64_t std::vector<ANEDebugInfo::DebugInfoInMem>::__push_back_slow_path<ANEDebugInfo::DebugInfoInMem const&>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t *v17;

  v3 = *a1;
  v4 = 0xCF3CF3CF3CF3CF3DLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0x186186186186186)
    std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xCF3CF3CF3CF3CF3DLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0xC30C30C30C30C3)
    v9 = 0x186186186186186;
  else
    v9 = v5;
  v17 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem>>(v7, v9);
  else
    v10 = 0;
  v13 = v10;
  v14 = &v10[168 * v4];
  v16 = &v10[168 * v9];
  std::construct_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem,ANEDebugInfo::DebugInfoInMem const&,ANEDebugInfo::DebugInfoInMem*>((uint64_t)v14, a2);
  v15 = v14 + 168;
  std::vector<ANEDebugInfo::DebugInfoInMem>::__swap_out_circular_buffer(a1, &v13);
  v11 = a1[1];
  std::__split_buffer<ANEDebugInfo::DebugInfoInMem>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_207C61FD8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<ANEDebugInfo::DebugInfoInMem>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::construct_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem,ANEDebugInfo::DebugInfoInMem const&,ANEDebugInfo::DebugInfoInMem*>(uint64_t a1, __int128 *a2)
{
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  __int128 v7;
  __int16 v8;

  v4 = *a2;
  v5 = a2[1];
  *(_QWORD *)(a1 + 32) = *((_QWORD *)a2 + 4);
  *(_OWORD *)a1 = v4;
  *(_OWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__init_with_size[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group*,ANEDebugInfo::DebugInfoInMem::Group*>((_QWORD *)(a1 + 40), *((_QWORD *)a2 + 5), *((_QWORD *)a2 + 6), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a2 + 6) - *((_QWORD *)a2 + 5)) >> 4));
  v6 = *((_QWORD *)a2 + 8);
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 64) = v6;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  std::vector<std::string const>::__init_with_size[abi:ne180100]<std::string const*,std::string const*>((std::string *)(a1 + 72), *((__int128 **)a2 + 9), *((__int128 **)a2 + 10), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a2 + 10) - *((_QWORD *)a2 + 9)) >> 3));
  v7 = a2[6];
  *(_QWORD *)(a1 + 112) = *((_QWORD *)a2 + 14);
  *(_OWORD *)(a1 + 96) = v7;
  std::unordered_map<std::string,unsigned int>::unordered_map(a1 + 120, (uint64_t)a2 + 120);
  v8 = *((_WORD *)a2 + 80);
  *(_BYTE *)(a1 + 162) = *((_BYTE *)a2 + 162);
  *(_WORD *)(a1 + 160) = v8;
  return a1;
}

void sub_207C620C0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::vector<std::string const>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__destroy_vector::operator()[abi:ne180100]((void ***)va);
  _Unwind_Resume(a1);
}

uint64_t *std::vector<ANEDebugInfo::DebugInfoInMem>::__swap_out_circular_buffer(uint64_t *result, _QWORD *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = result;
  v5 = *result;
  v4 = result[1];
  v6 = a2[1];
  while (v4 != v5)
  {
    v6 -= 168;
    v4 -= 168;
    result = (uint64_t *)std::construct_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem,ANEDebugInfo::DebugInfoInMem,ANEDebugInfo::DebugInfoInMem*>(v6, v4);
  }
  a2[1] = v6;
  v7 = *v3;
  *v3 = v6;
  a2[1] = v7;
  v8 = v3[1];
  v3[1] = a2[2];
  a2[2] = v8;
  v9 = v3[2];
  v3[2] = a2[3];
  a2[3] = v9;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x186186186186187)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(168 * a2);
}

uint64_t std::construct_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem,ANEDebugInfo::DebugInfoInMem,ANEDebugInfo::DebugInfoInMem*>(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int16 v8;

  v4 = *(_OWORD *)(a2 + 16);
  v5 = *(_QWORD *)(a2 + 32);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = 0;
  *(_QWORD *)(a1 + 64) = v6;
  *(_QWORD *)(a1 + 72) = 0;
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a2 + 72) = 0;
  *(_QWORD *)(a2 + 80) = 0;
  *(_QWORD *)(a2 + 88) = 0;
  v7 = *(_OWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = v7;
  std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__hash_table(a1 + 120, (uint64_t *)(a2 + 120));
  v8 = *(_WORD *)(a2 + 160);
  *(_BYTE *)(a1 + 162) = *(_BYTE *)(a2 + 162);
  *(_WORD *)(a1 + 160) = v8;
  return a1;
}

uint64_t std::__split_buffer<ANEDebugInfo::DebugInfoInMem>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 168;
    std::__destroy_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem,0>(i - 168);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__vdeallocate(void **a1)
{
  void *v1;
  uint64_t v3;
  void *v4;

  v1 = *a1;
  if (*a1)
  {
    v3 = (uint64_t)a1[1];
    v4 = *a1;
    if ((void *)v3 != v1)
    {
      do
      {
        v3 -= 48;
        std::__destroy_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group,0>(v3);
      }
      while ((void *)v3 != v1);
      v4 = *a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void std::vector<std::string const>::__vdeallocate(uint64_t *a1)
{
  if (*a1)
  {
    std::vector<std::string const>::__clear[abi:ne180100](a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::__move_assign(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::clear(a1);
  v4 = *a2;
  *a2 = 0;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = v4;
  if (v5)
    operator delete(v5);
  v8 = a2[2];
  v7 = a2 + 2;
  v6 = v8;
  v9 = *(v7 - 1);
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 8) = v9;
  *(v7 - 1) = 0;
  v10 = v7[1];
  *(_QWORD *)(a1 + 24) = v10;
  *(_DWORD *)(a1 + 32) = *((_DWORD *)v7 + 4);
  if (v10)
  {
    v11 = *(_QWORD *)(v6 + 8);
    v12 = *(_QWORD *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v11 %= v12;
    }
    else
    {
      v11 &= v12 - 1;
    }
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v11) = a1 + 16;
    *v7 = 0;
    v7[1] = 0;
  }
}

void std::__hash_table<std::__hash_value_type<std::string,unsigned int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned int>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned int>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned int>>>::clear(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (*(_QWORD *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<std::string,PerfTracerCategory>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,PerfTracerCategory>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,PerfTracerCategory>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
}

uint64_t std::vector<std::string const>::__push_back_slow_path<std::string const>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  std::string *v11;
  __int128 v12;
  uint64_t v13;
  _QWORD v15[2];
  std::string *v16;
  char *v17;
  uint64_t *v18;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v18 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string const>>(v7, v9);
  else
    v10 = 0;
  v11 = (std::string *)&v10[24 * v4];
  v15[0] = v10;
  v15[1] = v11;
  v16 = v11;
  v17 = &v10[24 * v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v11, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
    v11 = v16;
  }
  else
  {
    v12 = *a2;
    v11->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&v11->__r_.__value_.__l.__data_ = v12;
  }
  v16 = v11 + 1;
  std::vector<std::string const>::__swap_out_circular_buffer(a1, v15);
  v13 = a1[1];
  std::__split_buffer<std::string const>::~__split_buffer((uint64_t)v15);
  return v13;
}

void sub_207C6254C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::string const>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__push_back_slow_path<ANEDebugInfo::DebugInfoInMem::Group const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  char *v13;
  char *v14;
  _QWORD *v15;
  char *v16;
  uint64_t *v17;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 4);
  v5 = v4 + 1;
  if (v4 + 1 > 0x555555555555555)
    std::vector<PerfTracerMetric>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x2AAAAAAAAAAAAAALL)
    v9 = 0x555555555555555;
  else
    v9 = v5;
  v17 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem::Group>>(v7, v9);
  else
    v10 = 0;
  v13 = v10;
  v14 = &v10[48 * v4];
  v16 = &v10[48 * v9];
  std::construct_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group,ANEDebugInfo::DebugInfoInMem::Group const&,ANEDebugInfo::DebugInfoInMem::Group*>(v14, a2);
  v15 = v14 + 48;
  std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__swap_out_circular_buffer(a1, &v13);
  v11 = a1[1];
  std::__split_buffer<ANEDebugInfo::DebugInfoInMem::Group>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_207C62650(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<ANEDebugInfo::DebugInfoInMem::Group>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

_QWORD *std::construct_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group,ANEDebugInfo::DebugInfoInMem::Group const&,ANEDebugInfo::DebugInfoInMem::Group*>(_QWORD *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  std::vector<ANEDebugInfo::DebugInfoInMem::Layer>::__init_with_size[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Layer*,ANEDebugInfo::DebugInfoInMem::Layer*>(a1, *(const void **)a2, *(_QWORD *)(a2 + 8), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 2));
  a1[3] = 0;
  a1[4] = 0;
  a1[5] = 0;
  std::vector<ANEDebugInfo::DebugInfoInMem::TD>::__init_with_size[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::TD*,ANEDebugInfo::DebugInfoInMem::TD*>(a1 + 3, *(const void **)(a2 + 24), *(_QWORD *)(a2 + 32), 0x8E38E38E38E38E39 * ((uint64_t)(*(_QWORD *)(a2 + 32) - *(_QWORD *)(a2 + 24)) >> 3));
  return a1;
}

void sub_207C626E0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<ANEDebugInfo::DebugInfoInMem::Group>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem::Group>,std::reverse_iterator<ANEDebugInfo::DebugInfoInMem::Group*>,std::reverse_iterator<ANEDebugInfo::DebugInfoInMem::Group*>,std::reverse_iterator<ANEDebugInfo::DebugInfoInMem::Group*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v4;
  v5 = *a1;
  *a1 = v4;
  a2[1] = v5;
  v6 = a1[1];
  a1[1] = a2[2];
  a2[2] = v6;
  v7 = a1[2];
  a1[2] = a2[3];
  a2[3] = v7;
  *a2 = a2[1];
}

__n128 std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<ANEDebugInfo::DebugInfoInMem::Group>,std::reverse_iterator<ANEDebugInfo::DebugInfoInMem::Group*>,std::reverse_iterator<ANEDebugInfo::DebugInfoInMem::Group*>,std::reverse_iterator<ANEDebugInfo::DebugInfoInMem::Group*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __n128 result;

  if (a3 != a5)
  {
    v7 = 0;
    do
    {
      v8 = a7 + v7;
      v9 = a3 + v7;
      *(_QWORD *)(v8 - 48) = 0;
      *(_QWORD *)(v8 - 40) = 0;
      *(_QWORD *)(v8 - 32) = 0;
      *(_OWORD *)(v8 - 48) = *(_OWORD *)(a3 + v7 - 48);
      *(_QWORD *)(v8 - 32) = *(_QWORD *)(a3 + v7 - 32);
      *(_QWORD *)(v9 - 48) = 0;
      *(_QWORD *)(v9 - 40) = 0;
      *(_QWORD *)(v9 - 32) = 0;
      *(_QWORD *)(v8 - 24) = 0;
      *(_QWORD *)(v8 - 16) = 0;
      *(_QWORD *)(v8 - 8) = 0;
      result = *(__n128 *)(a3 + v7 - 24);
      *(__n128 *)(v8 - 24) = result;
      *(_QWORD *)(v8 - 8) = *(_QWORD *)(a3 + v7 - 8);
      *(_QWORD *)(v9 - 24) = 0;
      *(_QWORD *)(v9 - 16) = 0;
      *(_QWORD *)(v9 - 8) = 0;
      v7 -= 48;
    }
    while (a3 + v7 != a5);
  }
  return result;
}

uint64_t std::__split_buffer<ANEDebugInfo::DebugInfoInMem::Group>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 48;
    std::__destroy_at[abi:ne180100]<ANEDebugInfo::DebugInfoInMem::Group,0>(i - 48);
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void H11ANE::H11ANEDevice::H11ANEDeviceOpen(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "H11ANEDevice::H11ANEDeviceOpen IOServiceOpen failed result= 0x%x\n", a5, a6, a7, a8, 0);
}

{
  OUTLINED_FUNCTION_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "H11ANEDevice::H11ANEDeviceOpen kH11ANEUserClientCommand_DeviceOpen call failed result=0x%x\n", a5, a6, a7, a8, 0);
}

void H11ANE::H11ANEDevice::ANE_ProgramSendRequest(int a1)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = 136315650;
  v2 = "ANE_ProgramSendRequest";
  v3 = 1024;
  v4 = 1790;
  v5 = 1024;
  v6 = a1;
  _os_log_error_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%s:%d status=%x\n", (uint8_t *)&v1, 0x18u);
}

void H11ANE::H11ANEDeviceController::SetupDeviceController()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v0 = 136315138;
  v1 = "SetupDeviceController";
  _os_log_error_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ERROR: %s:IONotificationPortGetRunLoopSource failed!\n", (uint8_t *)&v0, 0xCu);
}

void H11ANE::H11ANEFrameReceiver::stopReceive(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_207C43000, MEMORY[0x24BDACB70], a3, "ERROR: timedout waiting for the syncRequests to be completed\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void H11ANE::H11ANEFrameReceiver::ProgramProcessRequest()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "ERROR: numInputBuffers = 0 or numInputBuffers > kANEMaxBuffers error = 0x%x\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "ERROR: inputBufferSurface is NULL error = 0x%x\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "ERROR: intermediateBufferSurface is NULL error = 0x%x\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "ERROR: outputBufferSurface is NULL error = 0x%x\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void H11ANE::H11ANEFrameReceiver::ProgramProcessRequest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "ERROR: numOutputBuffers = 0 or numOutputBuffers > kANEMaxBuffers numOutputBuffers = %d\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

{
  OUTLINED_FUNCTION_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "ERROR: numInputBuffers + numOutputBuffers = %d > kANEMaxBuffers\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

{
  OUTLINED_FUNCTION_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "ERROR: ProgramProcessRequest failed with error = 0x%x\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void H11ANE::H11ANEFrameReceiver::syncFrameDone()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_207C43000, MEMORY[0x24BDACB70], v0, "syncFrameDone: Request received for different program!! transactionId: 0x%llx, req->programHandle=0x%llx, reqCb->programHandle=0x%llx\n", v1, v2, v3, v4, v5);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_207C43000, MEMORY[0x24BDACB70], v0, "syncFrameDone: Request received for different program!! programHandle: 0x%llx, req->transactionID=0x%llx, reqCb->transactionID=0x%llx\n", v1, v2, v3, v4, v5);
}

void ZinIrCompilerParamsUtils::StringToPerfTracerConfig(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_207C43000, MEMORY[0x24BDACB70], a3, "Error: Invalid perf tracer category", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

{
  OUTLINED_FUNCTION_4(&dword_207C43000, MEMORY[0x24BDACB70], a3, "Error: Invalid perf tracer metric1", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

{
  OUTLINED_FUNCTION_4(&dword_207C43000, MEMORY[0x24BDACB70], a3, "Error: Invalid perf tracer metric2", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void H11ANEDeviceUpdateParameters_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "ERROR: %s: pDevicePriv is NULL\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEDeviceUpdateParameters_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "ERROR: %s: Cannot call this API with deviceUsageType=%d\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEDeviceUpdateParameters_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_207C43000, MEMORY[0x24BDACB70], v0, "ERROR: %s: pANEDevice=%p or pANEDeviceParameters=%p is NULL\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_13();
}

void H11ANEDeviceClose_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "ERROR: %s: pANEDevice is NULL\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEDeviceClose_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "ERROR: %s: pDevicePriv is NULL\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEDeviceClose_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "ERROR: %s: pH11ANEDevice is NULL\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEDeviceClose_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "ERROR: %s: pH11ANEDeviceController is NULL\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEDeviceClose_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "ERROR: %s: pH11ANEDevice->ANE_ProgramMemoryUnMapRequest failed status=0x%x\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramPrepare_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "ERROR: %s: pANEProgramInstancePriv is NULL\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramPrepare_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "ERROR: %s: pH11ANEDevice is NULL\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramPrepare_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "ERROR: %s: Cannot call this API with deviceUsageType=%d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramPrepare_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "pH11ANEDevice->ANE_ProgramPrepare failed with status=0x%x\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void H11ANEProgramPrepare_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "WARN: Client sending down reserved priorities. Lowering priority to kANEProgramPriority2 0x%08X", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void H11ANEProgramPrepare_cold_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "ERROR: %s: Non-blocking usage not supported yet!\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramOutputSetEnqueue_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "ERROR: %s: Device is NULL \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramOutputSetEnqueue_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_207C43000, MEMORY[0x24BDACB70], v0, "ERROR: %s: Bad arguments pANEDevice=0x%p outputSetEnqueueReqParams=%p\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_13();
}

void H11ANEProgramInputsReady_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "ERROR: %s: Device is NULL \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramInputsReady_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_207C43000, MEMORY[0x24BDACB70], v0, "ERROR: %s: Bad arguments pANEDevice=0x%p outputSetEnqueueReqParams=%p\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_13();
}

void H11ANEProgramStop_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "ERROR: %s: pH11ANEDevice is NULL\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramStop_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "ERROR: %s: Cannot call this API with deviceUsageType=%d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramStop_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "ERROR: %s: ANE_ProgramUnprepare failed status=0x%x\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramDestroy_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "ERROR: %s: pH11ANEDevice is NULL\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramDestroy_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "ERROR: %s: Cannot call this API with deviceUsageType=%d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramDestroy_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "ERROR: %s: Cannot call if the frame receiver is still present\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramProcessRequestDirect_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "ERROR: %s: Device is NULL \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramProcessRequestDirect_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "ERROR: %s: FrameReceiver is NULL  \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramProcessRequestDirect_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10(&dword_207C43000, MEMORY[0x24BDACB70], v0, "ERROR: %s: Invalid arguments (programRequest->inputBuffersTot=%d programRequest->outputBuffersTot=%d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramProcessRequestDirect_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "ERROR: %s: pH11ANEFrameReceiver->ProgramProcessRequest failed status=0x%x\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramProcessRequestDirect_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "WARN: Client sending down reserved priorities. Lowering priority to kANEProgramPriority2 0x%08X", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void H11ANEProgramProcessRequestDirect_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_10(&dword_207C43000, MEMORY[0x24BDACB70], v0, "ERROR: %s: Invalid arguments - sharedEvents->numWaitEvents:%u,  programRequest->numSignalEvents: %u\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramProcessRequestDirect_cold_7()
{
  __int16 v0;
  uint64_t v1;
  int v2[8];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136315906;
  OUTLINED_FUNCTION_3_0();
  v3 = v0;
  v4 = v1;
  _os_log_error_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "ERROR: %s: Bad arguments pANEDevice=0x%p programRequest=%p requestCallback=%p \n", (uint8_t *)v2, 0x2Au);
}

void H11ANEProgramMemoryMapRequest_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "ERROR: %s: Device is NULL \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramMemoryMapRequest_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "ERROR: %s: FrameReceiver is NULL  \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramMemoryMapRequest_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_10(&dword_207C43000, MEMORY[0x24BDACB70], v0, "ERROR: %s: Invalid arguments - numMappings=%d maxAlloweMappings=%d\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramMemoryMapRequest_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "ERROR: %s: pH11ANEDevice->ANE_ProgramMemoryMapRequest failed status=0x%x\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramMemoryMapRequest_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_207C43000, MEMORY[0x24BDACB70], v0, "ERROR: %s: Bad arguments pANEDevice=0x%p memoryMappingParams=%p\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_13();
}

void H11ANEProgramMemoryUnmapRequest_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "ERROR: %s: Device is NULL \n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramMemoryUnmapRequest_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "ERROR: %s: pH11ANEDevice->ANE_ProgramMemoryMapRequest failed status=0x%x\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramMemoryUnmapRequest_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_207C43000, MEMORY[0x24BDACB70], v0, "ERROR: %s: Bad arguments pANEDevice=0x%p memoryMappingParams=%p\n", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_13();
}

void H11ANEProgramCreate_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "ERROR: %s: pH11ANEDevice is NULL\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramCreateNewInstance_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "ERROR: %s: pH11ANEDevice is NULL\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramCreateNewInstance_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "ERROR: %s: Cannot call this API with deviceUsageType=%d\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramCreateNewInstance_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_14(&dword_207C43000, MEMORY[0x24BDACB70], v0, "ERROR: numOfProcedures %u more than maxProcedures: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEProgramCreateNewInstance_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_14(&dword_207C43000, MEMORY[0x24BDACB70], v0, "ERROR: numWeightsBuffer %u more than maxBuffers: %u\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void H11ANEHandleDeviceOpen_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Error opening LB - status=0x%x\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void H11ANEHandleDeviceOpen_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Device Open failed - status=0x%x\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void MyH11ANEDeviceMessageNotification(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_207C43000, MEMORY[0x24BDACB70], a3, "H11ANEDeviceMessageNotification: kH11ANEHardwareFailure\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

{
  OUTLINED_FUNCTION_4(&dword_207C43000, MEMORY[0x24BDACB70], a3, "H11ANEDeviceMessageNotification: kH11ANEFirmwareFailure\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

{
  OUTLINED_FUNCTION_15(&dword_207C43000, MEMORY[0x24BDACB70], a3, "H11ANEDeviceMessageNotification: kH11ANEDeviceSleep\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

{
  OUTLINED_FUNCTION_15(&dword_207C43000, MEMORY[0x24BDACB70], a3, "H11ANEDeviceMessageNotification: kH11ANEDeviceWakeup\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void H11ANEDeviceOpen_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "H11ANEDeviceOpen failed: 0x%x\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void H11ANEDeviceOpen_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "ERROR: could not create H11ANEDeviceController object: 0x%08X", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void H11ANEDeviceOpen_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_207C43000, MEMORY[0x24BDACB70], a3, "ERROR: H11ANEDeviceController deviceArray is empty", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void H11ANEDeviceOpen_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_207C43000, MEMORY[0x24BDACB70], a3, "(Single-ANE System) Critical Error: Could not open the only H11ANE device\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void H11ANEDeviceOpen_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_207C43000, MEMORY[0x24BDACB70], a3, "(Single-ANE System with LB) Critical Error: Could not open the only H11ANE device\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void H11ANEFrameProcDirect(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "ERROR: %s: nothing to process for stats!\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void H11InitializePlatformServices_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_207C43000, MEMORY[0x24BDACB70], a3, "Error creating H11ANEDeviceController object: %08X", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void H11InitializePlatformServices_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Error opening H11ANEDevice: %08X\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void H11InitializePlatformServices_cold_3(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Skipping LB: %08X\n", buf, 8u);
}

void H11InitializePlatformServices_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Error loading firmware: %08X", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void H11InitializePlatformServices_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Failed to start work processor: %08X\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void H11InitializePlatformServices_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Failed to create work processor: %08X\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void H11InitializePlatformServices_cold_7()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "H11InitializePlatformServices is called\n", v0, 2u);
  OUTLINED_FUNCTION_2();
}

void ZinCreateAnalytics(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_207C43000, MEMORY[0x24BDACB70], a3, "Invalid parameters.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void ZinCreateAnalytics(int a1, uint64_t a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = a1;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "Procedure not found for index %d", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

void ZinCreateAnalytics(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 695;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 655;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 660;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 299;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 662;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 562;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 360;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 370;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 324;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 331;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 338;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 345;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 308;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 315;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 687;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

void ZinCreateAnalytics(uint8_t *a1, _DWORD *a2, uint64_t a3)
{
  *(_DWORD *)a1 = 67109120;
  *a2 = 568;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", a1);
}

{
  *(_DWORD *)a1 = 67109120;
  *a2 = 582;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", a1);
}

{
  *(_DWORD *)a1 = 67109120;
  *a2 = 601;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", a1);
}

{
  *(_DWORD *)a1 = 67109120;
  *a2 = 612;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", a1);
}

{
  *(_DWORD *)a1 = 67109120;
  *a2 = 617;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", a1);
}

{
  *(_DWORD *)a1 = 67109120;
  *a2 = 636;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", a1);
}

{
  *(_DWORD *)a1 = 67109120;
  *a2 = 444;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", a1);
}

{
  *(_DWORD *)a1 = 67109120;
  *a2 = 451;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", a1);
}

{
  *(_DWORD *)a1 = 67109120;
  *a2 = 394;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", a1);
}

{
  *(_DWORD *)a1 = 67109120;
  *a2 = 401;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", a1);
}

{
  *(_DWORD *)a1 = 67109120;
  *a2 = 408;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", a1);
}

{
  *(_DWORD *)a1 = 67109120;
  *a2 = 415;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", a1);
}

{
  *(_DWORD *)a1 = 67109120;
  *a2 = 490;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", a1);
}

{
  *(_DWORD *)a1 = 67109120;
  *a2 = 471;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", a1);
}

void ZinCreateAnalytics(uint8_t *buf, _BYTE *a2)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "[ANE Analytics] Group table must be stored prior to Group Info.", buf, 2u);
}

void ZinDumpAnalytics(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 766;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 754;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 743;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 736;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 711;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 703;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

void ANEAnalytics::AnalyticsBufferParser::StructAt<_AnalyticsProcedureInfo>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_207C43000, MEMORY[0x24BDACB70], a3, "AnalyticsBufferParser: Invalid memory access.\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void ZinDumpAnalyticsInJSON(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 906;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 894;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 879;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 871;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 847;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = 832;
  OUTLINED_FUNCTION_0_1(&dword_207C43000, MEMORY[0x24BDACB70], a3, "rc check failed at %d\n", (uint8_t *)v3);
  OUTLINED_FUNCTION_2();
}

void ZinComputeAnalyticsBufferSize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_207C43000, MEMORY[0x24BDACB70], a3, "Incorrect parameters", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void MemPool::alloc<_AnalyticsProcedureInfo>()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Allocating more than what's available in the pool. Buf size = %ld", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void MemPool::get_offset<unsigned long long>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_207C43000, MEMORY[0x24BDACB70], a3, "Given ptr is out of memory pool.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void ANEDebugInfo::DebugInfoParser::ParseCU()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void ANEDebugInfo::DebugInfoParser::ParseCU(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 134217984;
  v2 = a1;
  _os_log_error_impl(&dword_207C43000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Parser does not support version %lld\n", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

void ANEDebugInfo::DebugInfoParser::MatchRecord(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_207C43000, MEMORY[0x24BDACB70], a3, "Match Record out of bound.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void ANEDebugInfo::Record::GetScalarVal<unsigned long long>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_207C43000, MEMORY[0x24BDACB70], a3, "Record size does not match the extraction type.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void ANEDebugInfo::DebugInfoParser::ParseProc()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void ANEDebugInfo::DebugInfoParser::ParseHwConfigs()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void ANEDebugInfo::DebugInfoParser::ParseIdentString()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void ANEDebugInfo::DebugInfoParser::ParseMaxContextLatencyThreshold()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void ANEDebugInfo::DebugInfoParser::ParseGroup()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void ANEDebugInfo::DebugInfoParser::ParseLayer()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void ANEDebugInfo::DebugInfoParser::ParseTD()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void ANEDebugInfo::DebugInfoParser::ParseOperation()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void ANEDebugInfo::DebugInfoParser::ParseViolateMaxContextLatencyFlag()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void ANEDebugInfo::DebugInfoParser::ParsePerfStats()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

void ANEDebugInfo::DebugInfoParser::ParsePerfTracerInfo()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_2_0(&dword_207C43000, MEMORY[0x24BDACB70], v0, "Parsing failed: in %s at %d ", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1_0();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC360](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x24BDAC368](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x24BDAC370](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBBFB0](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x24BDBBFB8](allocator, *(_QWORD *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
  MEMORY[0x24BDBBFD0](port);
}

CFMessagePortRef CFMessagePortCreateLocal(CFAllocatorRef allocator, CFStringRef name, CFMessagePortCallBack callout, CFMessagePortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMessagePortRef)MEMORY[0x24BDBBFF0](allocator, name, callout, context, shouldFreeInfo);
}

CFMessagePortRef CFMessagePortCreateRemote(CFAllocatorRef allocator, CFStringRef name)
{
  return (CFMessagePortRef)MEMORY[0x24BDBBFF8](allocator, name);
}

CFRunLoopSourceRef CFMessagePortCreateRunLoopSource(CFAllocatorRef allocator, CFMessagePortRef local, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC000](allocator, local, order);
}

void CFMessagePortInvalidate(CFMessagePortRef ms)
{
  MEMORY[0x24BDBC010](ms);
}

void CFMessagePortSetDispatchQueue(CFMessagePortRef ms, dispatch_queue_t queue)
{
  MEMORY[0x24BDBC028](ms, queue);
}

void CFMessagePortSetInvalidationCallBack(CFMessagePortRef ms, CFMessagePortInvalidationCallBack callout)
{
  MEMORY[0x24BDBC030](ms, callout);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2D0](rl, timer, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

void CFRunLoopRun(void)
{
  MEMORY[0x24BDBC358]();
}

void CFRunLoopStop(CFRunLoopRef rl)
{
  MEMORY[0x24BDBC388](rl);
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return (CFRunLoopTimerRef)MEMORY[0x24BDBC390](allocator, flags, order, callout, context, fireDate, interval);
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
  MEMORY[0x24BDBC3A8](timer);
}

void CFRunLoopTimerSetNextFireDate(CFRunLoopTimerRef timer, CFAbsoluteTime fireDate)
{
  MEMORY[0x24BDBC3B0](timer, fireDate);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x24BDBC650](str);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5240](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x24BDC5280](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x24BDC52C8](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x24BDC5300](pixelBuffer, lockFlags);
}

CVReturn CVPixelBufferPoolCreate(CFAllocatorRef allocator, CFDictionaryRef poolAttributes, CFDictionaryRef pixelBufferAttributes, CVPixelBufferPoolRef *poolOut)
{
  return MEMORY[0x24BDC5310](allocator, poolAttributes, pixelBufferAttributes, poolOut);
}

CVReturn CVPixelBufferPoolCreatePixelBufferWithAuxAttributes(CFAllocatorRef allocator, CVPixelBufferPoolRef pixelBufferPool, CFDictionaryRef auxAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x24BDC5328](allocator, pixelBufferPool, auxAttributes, pixelBufferOut);
}

uint64_t CVPixelBufferPoolPreAllocate()
{
  return MEMORY[0x24BDC5350]();
}

void CVPixelBufferPoolRelease(CVPixelBufferPoolRef pixelBufferPool)
{
  MEMORY[0x24BDC5360](pixelBufferPool);
}

uint64_t CVPixelBufferPoolScanIOSurfaces()
{
  return MEMORY[0x24BDC5370]();
}

uint64_t CVPixelBufferPoolSetMinBufferCount()
{
  return MEMORY[0x24BDC5380]();
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x24BDC5390](texture);
}

CVPixelBufferRef CVPixelBufferRetain(CVPixelBufferRef texture)
{
  return (CVPixelBufferRef)MEMORY[0x24BDC53A8](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x24BDC53B8](pixelBuffer, unlockFlags);
}

kern_return_t IOConnectCallAsyncMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EE0](*(_QWORD *)&connection, *(_QWORD *)&selector, *(_QWORD *)&wake_port, reference, *(_QWORD *)&referenceCnt, input, *(_QWORD *)&inputCnt, inputStruct);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOCreateReceivePort(uint32_t msgType, mach_port_t *recvPort)
{
  return MEMORY[0x24BDD7F98](*(_QWORD *)&msgType, recvPort);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x24BDD8680](*(_QWORD *)&bootstrapPort, mainPort);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDD86A8](notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x24BDD8958](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x24BDD8960](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x24BDD8B50](properties);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8B78](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x24BDD8B80](buffer);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x24BDD8C68](buffer);
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8D08](buffer, *(_QWORD *)&options, seed);
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x24BDD8DD0](buffer, *(_QWORD *)&options, seed);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x24BEDABB0](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x24BEDABE8](__n);
}

std::string *__cdecl std::string::erase(std::string *this, std::string::size_type __pos, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC20](this, __pos, __n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC40](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x24BEDAC88](this, __pos, __s, __n);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x24BEDACE8](this, __str, __pos, __n, __a);
}

uint64_t std::filebuf::close()
{
  return MEMORY[0x24BEDADE0]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x24BEDADF0]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x24BEDADF8]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x24BEDAEE0]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x24BEDAEE8]();
}

uint64_t std::ostream::write()
{
  return MEMORY[0x24BEDAEF0]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::~ostream()
{
  return MEMORY[0x24BEDAF10]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF30]();
}

{
  return MEMORY[0x24BEDAF40]();
}

{
  return MEMORY[0x24BEDAF50]();
}

{
  return MEMORY[0x24BEDAF60]();
}

{
  return MEMORY[0x24BEDAF80]();
}

uint64_t std::ofstream::open()
{
  return MEMORY[0x24BEDB018]();
}

const std::locale *std::locale::classic(void)
{
  return (const std::locale *)MEMORY[0x24BEDB430]();
}

std::locale *__cdecl std::locale::locale(std::locale *this, const std::locale *a2)
{
  return (std::locale *)MEMORY[0x24BEDB438](this, a2);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

const std::locale *__cdecl std::locale::operator=(std::locale *this, const std::locale *a2)
{
  return (const std::locale *)MEMORY[0x24BEDB450](this, a2);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

std::locale std::ios_base::imbue(std::ios_base *this, const std::locale *__loc)
{
  return (std::locale)MEMORY[0x24BEDB538](this, __loc);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x24BEDB608](retstr, *(_QWORD *)&__val);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete[]()
{
  return off_24C06A4E8();
}

void operator delete(void *__p)
{
  off_24C06A4F0(__p);
}

uint64_t operator delete()
{
  return off_24C06A4F8();
}

uint64_t operator new[]()
{
  return off_24C06A500();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24C06A508(__sz);
}

uint64_t operator new()
{
  return off_24C06A510();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

char *__cdecl dirname(char *a1)
{
  return (char *)MEMORY[0x24BDADC40](a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x24BDAE4D8](a1, a2, *(_QWORD *)&a3);
}

int fseeko(FILE *__stream, off_t a2, int __whence)
{
  return MEMORY[0x24BDAE4E0](__stream, a2, *(_QWORD *)&__whence);
}

off_t ftello(FILE *__stream)
{
  return MEMORY[0x24BDAE538](__stream);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE590](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x24BEDF260](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x24BEDF268](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x24BEDF270](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x24BDAEBF8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x24BDAEF60](path, omode);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x24BDAF410](log, ptr);
}

void perror(const char *a1)
{
  MEMORY[0x24BDAF5A8](a1);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x24BDAF6F8](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF778](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x24BDAF790](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x24BDAF7A0](a1, *(_QWORD *)&a2);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return MEMORY[0x24BDAF7B0](a1, a2);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7D0](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x24BDAF7D8](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x24BDAF7E0](a1);
}

int pthread_cond_timedwait(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x24BDAF7F0](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x24BDAF800](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x24BDAF818](a1, a2, a3, a4);
}

int pthread_equal(pthread_t a1, pthread_t a2)
{
  return MEMORY[0x24BDAF828](a1, a2);
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x24BDAF860](a1);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x24BDAF880](a1, a2);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x24BDAF888](a1, a2);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x24BDAF8A8](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x24BDAF8E8](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x24BDAF8F0](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x24BDAF908](a1, *(_QWORD *)&a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x24BDAF978]();
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x24BDAF998](a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x24BDAF9A8](a1, a2);
}

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF30](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strncat(char *__s1, const char *__s2, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF60](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x24BDAFF70](__dst, __src, __n);
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x24BDB0210](*(_QWORD *)&target_act, *(_QWORD *)&flavor, thread_info_out, thread_info_outCnt);
}

kern_return_t thread_policy_set(thread_act_t thread, thread_policy_flavor_t flavor, thread_policy_t policy_info, mach_msg_type_number_t policy_infoCnt)
{
  return MEMORY[0x24BDB0220](*(_QWORD *)&thread, *(_QWORD *)&flavor, policy_info, *(_QWORD *)&policy_infoCnt);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

