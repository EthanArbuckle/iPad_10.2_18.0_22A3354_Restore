void sub_100003178(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100003340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100003360(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100003370(uint64_t a1)
{

}

void sub_100003378(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  id v15;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    v7 = DiagnosticLogHandleForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_100005BA0((uint64_t)v6, v9);

      v10 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "code")));
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Bluetooth scan completed successfully. Devices: %@", (uint8_t *)&v14, 0xCu);
      }

      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v12 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = &off_100008548;
    }

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void sub_1000036DC(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  uint8_t *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  __int16 v34;

  if (qword_10000C820)
  {
    objc_msgSend((id)qword_10000C820, "setSession:", 0);
    if (a2 == 1)
    {
      if ((_DWORD)a3)
      {
        v18 = DiagnosticLogHandleForCategory(3);
        v9 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          sub_100005D5C(a3, v9, v19, v20, v21, v22, v23, v24);
        goto LABEL_12;
      }
      v31 = DiagnosticLogHandleForCategory(3);
      v32 = objc_claimAutoreleasedReturnValue(v31);
      v28 = v32;
      if (a4)
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v33) = 0;
          v29 = "Successfully detached from BT.";
          v30 = (uint8_t *)&v33;
          goto LABEL_21;
        }
LABEL_22:

        objc_msgSend((id)qword_10000C820, "setSession:", a1);
        goto LABEL_28;
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        sub_100005D30();
LABEL_27:

      goto LABEL_28;
    }
    if (!a2)
    {
      if ((_DWORD)a3)
      {
        v8 = DiagnosticLogHandleForCategory(3);
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          sub_100005CCC(a3, v9, v10, v11, v12, v13, v14, v15);
LABEL_12:

LABEL_28:
        v17 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10000C820, "statusSema", v33));
        dispatch_semaphore_signal(v17);
        goto LABEL_29;
      }
      v26 = DiagnosticLogHandleForCategory(3);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      v28 = v27;
      if (a4)
      {
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v34 = 0;
          v29 = "Successfully attached to BT.";
          v30 = (uint8_t *)&v34;
LABEL_21:
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, v29, v30, 2u);
          goto LABEL_22;
        }
        goto LABEL_22;
      }
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        sub_100005CA0();
      goto LABEL_27;
    }
    v25 = DiagnosticLogHandleForCategory(3);
    v17 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100005C40();
  }
  else
  {
    v16 = DiagnosticLogHandleForCategory(3);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      sub_100005C14();
  }
LABEL_29:

}

void sub_1000038D0(uint64_t a1, int a2)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  if (!qword_10000C820)
  {
    v4 = DiagnosticLogHandleForCategory(3);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100005C14();
    goto LABEL_12;
  }
  if (a2 == 1)
  {
    v6 = DiagnosticLogHandleForCategory(3);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received discovery status update: BT_DISCOVERY_SCAN_STOPPED.", v10, 2u);
    }

    objc_msgSend((id)qword_10000C820, "setStopped:", 1);
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10000C820, "statusSema"));
    dispatch_semaphore_signal(v5);
LABEL_12:

    return;
  }
  if (a2)
  {
    v8 = DiagnosticLogHandleForCategory(3);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_100005DC0();

  }
  else
  {
    v2 = DiagnosticLogHandleForCategory(3);
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received discovery status update: BT_DISCOVERY_SCAN_STARTED.", buf, 2u);
    }

    objc_msgSend((id)qword_10000C820, "setStarted:", 1);
  }
}

void sub_100003A3C(uint64_t a1, int a2, uint64_t a3)
{
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  OSDBluetoothDevice *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  OSDBluetoothDevice *v17;
  _OWORD v18[16];

  if (qword_10000C820)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10000C820, "devices"));
    v15 = 0;
    memset(v18, 0, sizeof(v18));
    if (a2)
    {
      v6 = DiagnosticLogHandleForCategory(3);
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_100005E4C();
    }
    else
    {
      BTDeviceGetAddressString(a3, v18, 256);
      v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v18));
      BTDeviceGetName(a3, v18, 256);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v18));
      BTDeviceGetDefaultName(a3, v18, 256);
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v18));
      BTDeviceGetDeviceType(a3, (char *)&v15 + 4);
      BTDeviceGetDeviceClass(a3, &v15);
      if (v7 && v9 && v10)
      {
        v11 = objc_alloc_init(OSDBluetoothDevice);
        -[OSDBluetoothDevice setAddress:](v11, "setAddress:", v7);
        -[OSDBluetoothDevice setName:](v11, "setName:", v9);
        -[OSDBluetoothDevice setDefaultName:](v11, "setDefaultName:", v10);
        -[OSDBluetoothDevice setDeviceType:](v11, "setDeviceType:", HIDWORD(v15));
        -[OSDBluetoothDevice setDeviceClass:](v11, "setDeviceClass:", v15);
        -[NSObject addObject:](v5, "addObject:", v11);
        v12 = DiagnosticLogHandleForCategory(3);
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v11;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Discovered a BT device: %@", buf, 0xCu);
        }

      }
      else
      {
        v14 = DiagnosticLogHandleForCategory(3);
        v11 = (OSDBluetoothDevice *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(&v11->super, OS_LOG_TYPE_ERROR))
          sub_100005E20();
      }

    }
  }
  else
  {
    v8 = DiagnosticLogHandleForCategory(3);
    v5 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100005C14();
  }

}

void sub_100003CCC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  int v23;
  int v24;

  if (qword_10000C820)
  {
    switch((int)a2)
    {
      case 0:
        v3 = DiagnosticLogHandleForCategory(3);
        v4 = objc_claimAutoreleasedReturnValue(v3);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 67109120;
          v24 = 0;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received a BT_LOCAL_DEVICE_POWER_STATE_CHANGED callback: %d", (uint8_t *)&v23, 8u);
        }

        v5 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10000C820, "statusSema"));
        dispatch_semaphore_signal(v5);
        break;
      case 1:
        v7 = DiagnosticLogHandleForCategory(3);
        v5 = objc_claimAutoreleasedReturnValue(v7);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 67109120;
          v24 = 1;
          v8 = "Received a BT_LOCAL_DEVICE_NAME_CHANGED callback: %d";
          goto LABEL_26;
        }
        break;
      case 2:
        v9 = DiagnosticLogHandleForCategory(3);
        v5 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 67109120;
          v24 = 2;
          v8 = "Received a BT_LOCAL_DEVICE_DISCOVERABILITY_CHANGED callback: %d";
          goto LABEL_26;
        }
        break;
      case 3:
        v10 = DiagnosticLogHandleForCategory(3);
        v5 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 67109120;
          v24 = 3;
          v8 = "Received a BT_LOCAL_DEVICE_CONNECTABILITY_CHANGED callback: %d";
          goto LABEL_26;
        }
        break;
      case 4:
        v11 = DiagnosticLogHandleForCategory(3);
        v5 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 67109120;
          v24 = 4;
          v8 = "Received a BT_LOCAL_DEVICE_PAIRING_STATUS_CHANGED callback: %d";
          goto LABEL_26;
        }
        break;
      case 5:
        v12 = DiagnosticLogHandleForCategory(3);
        v5 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 67109120;
          v24 = 5;
          v8 = "Received a BT_LOCAL_DEVICE_CONNECTION_STATUS_CHANGED callback: %d";
          goto LABEL_26;
        }
        break;
      case 6:
        v13 = DiagnosticLogHandleForCategory(3);
        v5 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 67109120;
          v24 = 6;
          v8 = "Received a BT_LOCAL_DEVICE_DISCOVERY_STARTED callback: %d";
          goto LABEL_26;
        }
        break;
      case 7:
        v14 = DiagnosticLogHandleForCategory(3);
        v5 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 67109120;
          v24 = 7;
          v8 = "Received a BT_LOCAL_DEVICE_DISCOVERY_STOPPED callback: %d";
          goto LABEL_26;
        }
        break;
      case 8:
        v22 = DiagnosticLogHandleForCategory(3);
        v5 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 67109120;
          v24 = 8;
          v8 = "Received a BT_LOCAL_DEVICE_ADVERTISING_STATUS_CHANGED callback: %d";
LABEL_26:
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v23, 8u);
        }
        break;
      default:
        v15 = DiagnosticLogHandleForCategory(3);
        v5 = objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          sub_100005EAC(a2, v5, v16, v17, v18, v19, v20, v21);
        break;
    }
  }
  else
  {
    v6 = DiagnosticLogHandleForCategory(3);
    v5 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100005C14();
  }

}

void sub_100004190(uint64_t a1)
{
  _QWORD *WeakRetained;
  uint64_t v3;
  NSObject *v4;
  const char *v5;
  int v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  int v10;
  NSObject *v11;
  dispatch_time_t v12;
  const __CFString *v13;
  int v14;
  BOOL *v15;
  uint64_t v16;
  int v17;
  const __CFString *v18;
  __int16 v19;
  int v20;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = BTLocalDeviceGetModulePower(*(_QWORD *)(a1 + 56), 1, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      v3 = DiagnosticLogHandleForCategory(3);
      v4 = objc_claimAutoreleasedReturnValue(v3);
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
LABEL_6:

        goto LABEL_17;
      }
      LOWORD(v17) = 0;
      v5 = "Error while trying to get the BT module power.";
LABEL_5:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v17, 2u);
      goto LABEL_6;
    }
    v6 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v7 = DiagnosticLogHandleForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v6 != -889275714)
    {
      if (v9)
      {
        v13 = CFSTR("OFF");
        v14 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        if (v14 == -1)
          v13 = CFSTR("ON");
        v17 = 138412546;
        v18 = v13;
        v19 = 1024;
        v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Read BT module power: %@. Powerstate: %x", (uint8_t *)&v17, 0x12u);
      }

      v15 = *(BOOL **)(a1 + 64);
      if (v15)
      {
        *v15 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == -1;
        goto LABEL_17;
      }
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      v16 = DiagnosticLogHandleForCategory(3);
      v4 = objc_claimAutoreleasedReturnValue(v16);
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        goto LABEL_6;
      LOWORD(v17) = 0;
      v5 = "Callback pointer passed to isEnabled was NULL";
      goto LABEL_5;
    }
    if (v9)
    {
      v10 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v17 = 67109120;
      LODWORD(v18) = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Read BT module powerstate: %x. Starting runloop", (uint8_t *)&v17, 8u);
    }

    v11 = WeakRetained[12];
    v12 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v11, v12);
  }
LABEL_17:

}

void sub_100004634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004664(uint64_t a1)
{
  uint64_t result;

  result = BTLocalDeviceSetModulePower(*(_QWORD *)(a1 + 40), 1, -*(char *)(a1 + 48));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_1000049BC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 136));
  _Block_object_dispose((const void *)(v5 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_100004A14(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "processName")));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = BTSessionAttachWithQueue(objc_msgSend(v3, "UTF8String"), WeakRetained + 2, WeakRetained, WeakRetained[1]);

  }
}

void sub_100004AA0(uint64_t a1)
{
  char *WeakRetained;
  void *v3;
  int Default;
  id v5;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    Default = BTLocalDeviceGetDefault(*((_QWORD *)WeakRetained + 8), WeakRetained + 72);
    v3 = v5;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = Default;
  }

}

void sub_100004AF4(uint64_t a1)
{
  char *WeakRetained;
  void *v3;
  int v4;
  id v5;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v4 = BTLocalDeviceAddCallbacks(*((_QWORD *)WeakRetained + 9), WeakRetained + 40);
    v3 = v5;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  }

}

void sub_100004B48(uint64_t a1)
{
  char *WeakRetained;
  void *v3;
  int v4;
  id v5;

  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v4 = BTDiscoveryAgentCreate(*((_QWORD *)WeakRetained + 8), WeakRetained + 24);
    v3 = v5;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;
  }

}

void sub_100004C30(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained + 10;
    v6 = WeakRetained;
    if (WeakRetained[10])
    {
      BTDiscoveryAgentDestroy(WeakRetained + 10, WeakRetained);
      v2 = v6;
      *v3 = 0;
    }
    v4 = v2[9];
    if (v4)
    {
      BTLocalDeviceRemoveCallbacks(v4, v6 + 5);
      v2 = v6;
    }
    v5 = v2 + 8;
    if (v2[8])
    {
      BTSessionDetachWithQueue(v2 + 8);
      v2 = v6;
      *v5 = 0;
    }
  }

}

void sub_100004E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004E1C(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100004E2C(uint64_t a1)
{

}

void sub_100004E34(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _UNKNOWN **v27;
  uint64_t v28;
  NSObject *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  id v36;

  v5 = a2;
  v6 = a3;
  v7 = DiagnosticLogHandleForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (!v6)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Bluetooth scan completed successfully. Devices: %@", buf, 0xCu);
    }

    if (*(_QWORD *)(a1 + 32))
    {
      if (!objc_msgSend(v5, "count"))
      {
        v28 = DiagnosticLogHandleForCategory(3);
        v29 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          sub_100005FB8();

        v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v18 = *(void **)(v26 + 40);
        v27 = &off_100008590;
        goto LABEL_21;
      }
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v19 = v5;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v31;
        do
        {
          v23 = 0;
          do
          {
            if (*(_QWORD *)v31 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(a1 + 32);
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1)
                                                                               + 8 * (_QWORD)v23), "defaultName", (_QWORD)v30));
            objc_msgSend(v24, "addObject:", v25);

            v23 = (char *)v23 + 1;
          }
          while (v21 != v23);
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v21);
      }

    }
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v18 = *(void **)(v26 + 40);
    v27 = &off_100008578;
LABEL_21:
    *(_QWORD *)(v26 + 40) = v27;
    goto LABEL_22;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_100005FE4((uint64_t)v6, v9, v10, v11, v12, v13, v14, v15);

  v16 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v6, "code")));
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;
LABEL_22:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100005180(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  _QWORD *WeakRetained;
  _QWORD *v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  unsigned int v20;
  unsigned int v21;
  unsigned __int8 v22;
  uint64_t v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  unsigned int v30;
  unsigned int v31;
  uint64_t v32;
  NSObject *v33;
  unsigned int v34;
  id v35;
  id v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  _QWORD v41[4];
  id v42;
  id v43;
  _QWORD block[5];
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  int v51;
  char v52;
  uint8_t buf[4];
  _BYTE v54[10];

  v52 = 0;
  v48 = 0;
  v49 = &v48;
  v50 = 0x2020000000;
  v51 = 1;
  v2 = *(void **)(a1 + 32);
  v47 = 0;
  objc_msgSend(v2, "_setupBluetoothSessionAndDevice:", &v47);
  v3 = v47;
  v4 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(*(id *)(a1 + 32), "setDevices:", v4);

  objc_msgSend(*(id *)(a1 + 32), "setStarted:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setStopped:", 0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_bluetoothPower:isEnabled:", WeakRetained[9], &v52);
    v7 = DiagnosticLogHandleForCategory(3);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v52)
        v9 = CFSTR("ON");
      else
        v9 = CFSTR("OFF");
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v54 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Initial Bluetooth power state is %@", buf, 0xCu);
    }

    v10 = DiagnosticLogHandleForCategory(3);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Attempting to power on Bluetooth... (if necessary)", buf, 2u);
    }

    if ((objc_msgSend(v6, "_setBluetoothPower:enabled:timeout:", v6[9], 1, *(double *)(a1 + 56)) & 1) == 0)
    {
      v46 = v3;
      +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", &v46, CFSTR("com.apple.Diagnostics.DABluetooth"), 2107, CFSTR("Error unable to set the bluetooth power state to ON"));
      v12 = v46;

      v3 = v12;
    }
    v13 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
    v14 = DiagnosticLogHandleForCategory(3);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Attempting to do a Bluetooth scan...", buf, 2u);
    }

    v16 = v6[1];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005900;
    block[3] = &unk_1000082E8;
    objc_copyWeak(&v45, (id *)(a1 + 48));
    block[4] = &v48;
    dispatch_sync(v16, block);
    if (*((_DWORD *)v49 + 6))
    {
      v43 = v3;
      +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", &v43, CFSTR("com.apple.Diagnostics.DABluetooth"), 2108, CFSTR("Error trying to start a Bluetooth scan"));
      v17 = v43;

      v3 = v17;
    }
    else
    {
      dispatch_semaphore_wait((dispatch_semaphore_t)v6[12], v13);
    }
    v18 = DiagnosticLogHandleForCategory(3);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_msgSend(*(id *)(a1 + 32), "started");
      v21 = objc_msgSend(*(id *)(a1 + 32), "stopped");
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v54 = v20;
      *(_WORD *)&v54[4] = 1024;
      *(_DWORD *)&v54[6] = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Scan complete. Started: %d Stopped: %d", buf, 0xEu);
    }

    if (objc_msgSend(*(id *)(a1 + 32), "started"))
      v22 = objc_msgSend(*(id *)(a1 + 32), "stopped");
    else
      v22 = 0;
    if (objc_msgSend(*(id *)(a1 + 32), "started")
      && (objc_msgSend(*(id *)(a1 + 32), "stopped") & 1) == 0)
    {
      v23 = DiagnosticLogHandleForCategory(3);
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Sending a stop scan command...", buf, 2u);
      }

      v25 = v6[1];
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_100005954;
      v41[3] = &unk_100008310;
      objc_copyWeak(&v42, (id *)(a1 + 48));
      dispatch_sync(v25, v41);
      v13 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 64) * 1000000000.0));
      v26 = DiagnosticLogHandleForCategory(3);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)v54 = 0x4000000000000000;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Adding grace period delay of %.02f sec for stop notification...", buf, 0xCu);
      }

      dispatch_semaphore_wait((dispatch_semaphore_t)v6[12], v13);
      v28 = DiagnosticLogHandleForCategory(3);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v30 = objc_msgSend(*(id *)(a1 + 32), "started");
        v31 = objc_msgSend(*(id *)(a1 + 32), "stopped");
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v54 = v30;
        *(_WORD *)&v54[4] = 1024;
        *(_DWORD *)&v54[6] = v31;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Overtime-scan complete. Started: %d Stopped: %d", buf, 0xEu);
      }

      if (objc_msgSend(*(id *)(a1 + 32), "started"))
        v22 = objc_msgSend(*(id *)(a1 + 32), "stopped");
      else
        v22 = 0;
      objc_destroyWeak(&v42);
    }
    if (!v52)
    {
      v32 = DiagnosticLogHandleForCategory(3);
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Attempting to power off Bluetooth...", buf, 2u);
      }

      v34 = objc_msgSend(v6, "_setBluetoothPower:enabled:timeout:", v6[9], 0, (double)v13 - CFAbsoluteTimeGetCurrent());
      if (((objc_msgSend(*(id *)(a1 + 32), "stopped") | v34 ^ 1) & 1) == 0)
        objc_msgSend(*(id *)(a1 + 32), "setStopped:", 1);
    }
    if ((objc_msgSend(*(id *)(a1 + 32), "started") & 1) == 0)
    {
      v40 = v3;
      +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", &v40, CFSTR("com.apple.Diagnostics.DABluetooth"), 2108, CFSTR("Error trying to start a Bluetooth scan"));
      v35 = v40;

      v3 = v35;
    }
    if ((objc_msgSend(*(id *)(a1 + 32), "stopped") & 1) == 0)
    {
      v39 = v3;
      +[OSDError setError:withDomain:withCode:format:](OSDError, "setError:withDomain:withCode:format:", &v39, CFSTR("com.apple.Diagnostics.DABluetooth"), 2109, CFSTR("Error trying to stop a Bluetooth scan"));
      v36 = v39;

      v3 = v36;
    }
    objc_msgSend(*(id *)(a1 + 32), "_teardownBluetoothSessionAndDevice");
    if ((v22 & 1) == 0)
      objc_msgSend(*(id *)(a1 + 32), "setDevices:", 0);
    v37 = *(_QWORD *)(a1 + 40);
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "devices"));
    (*(void (**)(uint64_t, void *, id))(v37 + 16))(v37, v38, v3);

    objc_msgSend(*(id *)(a1 + 32), "setDevices:", 0);
    objc_destroyWeak(&v45);
  }

  _Block_object_dispose(&v48, 8);
}

void sub_100005890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  id *v26;
  id *v27;

  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_100005900(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = BTDiscoveryAgentStartScan(WeakRetained[10], 0, 0xFFFFFFFFLL);
    WeakRetained = v3;
  }

}

void sub_100005954(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    BTDiscoveryAgentStopScan(WeakRetained[10]);
    WeakRetained = v2;
  }

}

void sub_100005A68(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100005A80(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

void sub_100005AB8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100005AD0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003178((void *)&_mh_execute_header, a2, a3, "NSError variable was nil.  New unsaved error: %@", a5, a6, a7, a8, 2u);
}

void sub_100005B38(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003178((void *)&_mh_execute_header, a2, a3, "NSError variable was previously assigned.  New unsaved error: %@", a5, a6, a7, a8, 2u);
}

void sub_100005BA0(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Bluetooth scan error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100005C14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005A94();
  sub_100005A68((void *)&_mh_execute_header, v0, v1, "Bluetooth callback called without an OSDBluetooth instance!", v2, v3, v4, v5, v6);
  sub_100005A78();
}

void sub_100005C40()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100005AA0();
  sub_100005A80((void *)&_mh_execute_header, v0, v1, "Received an unhandled BT session event with event code: %d result code: %d", v2, v3);
  sub_100005AC8();
}

void sub_100005CA0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005A94();
  sub_100005A68((void *)&_mh_execute_header, v0, v1, "Attached to BT, but the callback data pointer was NULL.", v2, v3, v4, v5, v6);
  sub_100005A78();
}

void sub_100005CCC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005AB8((void *)&_mh_execute_header, a2, a3, "Received a failing BT attach event with error code: %d", a5, a6, a7, a8, 0);
  sub_100005A78();
}

void sub_100005D30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005A94();
  sub_100005A68((void *)&_mh_execute_header, v0, v1, "Detached from BT, but the callback data pointer was NULL.", v2, v3, v4, v5, v6);
  sub_100005A78();
}

void sub_100005D5C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005AB8((void *)&_mh_execute_header, a2, a3, "Received a failing BT detach event with error code: %d", a5, a6, a7, a8, 0);
  sub_100005A78();
}

void sub_100005DC0()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100005AA0();
  sub_100005A80((void *)&_mh_execute_header, v0, v1, "Received an unhandled discovery status update: %d result: %d", v2, v3);
  sub_100005AC8();
}

void sub_100005E20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005A94();
  sub_100005A68((void *)&_mh_execute_header, v0, v1, "Discovered a BT device but could not find an associated name", v2, v3, v4, v5, v6);
  sub_100005A78();
}

void sub_100005E4C()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  int v3;

  sub_100005AA0();
  sub_100005A80((void *)&_mh_execute_header, v0, v1, "Received an unhandled discovery event: %d flags: %d", v2, v3);
  sub_100005AC8();
}

void sub_100005EAC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100005AB8((void *)&_mh_execute_header, a2, a3, "Received an unhandled local device callback: %d", a5, a6, a7, a8, 0);
  sub_100005A78();
}

void sub_100005F10(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003178((void *)&_mh_execute_header, a2, a3, "Could not set BT module power: %@", a5, a6, a7, a8, 2u);
  sub_100005AC8();
}

void sub_100005F8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005A94();
  sub_100005A68((void *)&_mh_execute_header, v0, v1, "Error while trying to get the BT module power.", v2, v3, v4, v5, v6);
  sub_100005A78();
}

void sub_100005FB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100005A94();
  sub_100005A68((void *)&_mh_execute_header, v0, v1, "No Bluetooth devices found; failing.", v2, v3, v4, v5, v6);
  sub_100005A78();
}

void sub_100005FE4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100003178((void *)&_mh_execute_header, a2, a3, "Bluetooth scan error: %@", a5, a6, a7, a8, 2u);
  sub_100005AC8();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__bluetoothPower_isEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_bluetoothPower:isEnabled:");
}

id objc_msgSend__setBluetoothPower_enabled_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setBluetoothPower:enabled:timeout:");
}

id objc_msgSend__setupBluetoothSessionAndDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupBluetoothSessionAndDevice:");
}

id objc_msgSend__teardownBluetoothSessionAndDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_teardownBluetoothSessionAndDevice");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "address");
}

id objc_msgSend_checkPresence(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkPresence");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_defaultName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultName");
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "devices");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCancelled");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_performScanOnQueue_timeout_gracePeriod_completionBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performScanOnQueue:timeout:gracePeriod:completionBlock:");
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processInfo");
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processName");
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "result");
}

id objc_msgSend_setAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAddress:");
}

id objc_msgSend_setDefaultName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultName:");
}

id objc_msgSend_setDeviceClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceClass:");
}

id objc_msgSend_setDeviceType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceType:");
}

id objc_msgSend_setDevices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDevices:");
}

id objc_msgSend_setError_withDomain_withCode_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setError:withDomain:withCode:format:");
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFinished:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSession:");
}

id objc_msgSend_setStarted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStarted:");
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusCode:");
}

id objc_msgSend_setStopped_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStopped:");
}

id objc_msgSend_started(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "started");
}

id objc_msgSend_statusSema(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusSema");
}

id objc_msgSend_stopped(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopped");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}
