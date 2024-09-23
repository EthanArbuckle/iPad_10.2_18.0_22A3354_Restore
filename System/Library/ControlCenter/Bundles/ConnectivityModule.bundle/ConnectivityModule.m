uint64_t sub_230FA48D8(uint64_t a1)
{
  uint64_t result;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;

  result = BSEqualObjects();
  if ((result & 1) == 0)
  {
    v5 = objc_msgSend_copy(*(void **)(a1 + 40), v3, v4);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 1096);
    *(_QWORD *)(v6 + 1096) = v5;

    return objc_msgSend__updateState(*(void **)(a1 + 32), v8, v9);
  }
  return result;
}

void sub_230FA5094(uint64_t a1)
{
  int v2;
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  _QWORD v13[4];
  id v14;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = MGGetBoolAnswer();
  v3 = CFSTR("CONTROL_CENTER_STATUS_WIFI_SETTINGS");
  if (v2)
    v3 = CFSTR("CONTROL_CENTER_STATUS_WLAN_SETTINGS");
  v4 = v3;
  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x24BDD1488];
  v7 = objc_opt_class();
  objc_msgSend_bundleForClass_(v6, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v9, v10, (uint64_t)v4, &stru_24FFCAEF8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = sub_230FA51D4;
  v13[3] = &unk_24FFCA808;
  objc_copyWeak(&v14, &location);
  objc_msgSend_setFooterButtonTitle_handler_(v5, v12, (uint64_t)v11, v13);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void sub_230FA51B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_230FA51D4(uint64_t a1, const char *a2)
{
  void *v3;
  id WeakRetained;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;

  objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], a2, (uint64_t)CFSTR("prefs:root=WIFI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_contentModuleContext(WeakRetained, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_openURL_completionHandler_(v7, v8, (uint64_t)v3, 0);

  return 0;
}

uint64_t sub_230FA571C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x24BEDD108](a2, sel_prominentDisplay, a3);
}

uint64_t sub_230FA5C68(uint64_t a1, const char *a2)
{
  return objc_msgSend_setMenuItems_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 40));
}

void sub_230FA5E00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_230FA5E28(uint64_t a1)
{
  id WeakRetained;
  const char *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  const char *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend__serializeNetworkRecord_(WeakRetained, v3, *(_QWORD *)(a1 + 32));
  objc_msgSend_listDelegate(WeakRetained, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_networkListViewController_didTapRecord_(v6, v7, (uint64_t)WeakRetained, *(_QWORD *)(a1 + 32));

  objc_msgSend_scrollToTop_(WeakRetained, v8, 1);
  return 0;
}

void sub_230FA6264()
{
  CCUIConnectivityBluetoothDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(CCUIConnectivityBluetoothDefaults);
  v1 = (void *)qword_25414CC08;
  qword_25414CC08 = (uint64_t)v0;

}

void sub_230FA686C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230FA6890(uint64_t a1, const char *a2)
{
  uint64_t v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  int v15;
  void *v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  void *v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  const char *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  int v30;
  void *v31;
  const char *v32;
  id WeakRetained;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  void *v38;
  const char *v39;
  id v40;
  const char *v41;
  _QWORD v42[4];
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend__stateWithOverridesApplied_(*(void **)(a1 + 32), a2, (uint64_t)a2);
  v5 = (void *)*MEMORY[0x24BE19AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(unsigned int *)(a1 + 48);
    v10 = v5;
    objc_msgSend__debugDescriptionForState_(v8, v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__debugDescriptionForState_(*(void **)(a1 + 32), v13, v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v45 = v12;
    v46 = 2114;
    v47 = v14;
    _os_log_impl(&dword_230FA3000, v10, OS_LOG_TYPE_DEFAULT, "[Bluetooth (Connectivity)] Toggled Bluetooth state from %{public}@ to %{public}@", buf, 0x16u);

  }
  v15 = *(_DWORD *)(a1 + 48);
  if ((v15 - 1) > 1 || (v4 - 3) > 1)
  {
    if (v15 == 4)
    {
      if ((_DWORD)v4 != 2)
      {
        v17 = 0;
        goto LABEL_15;
      }
    }
    else
    {
      v17 = 0;
      if (v15 != 3 || (_DWORD)v4 != 2)
        goto LABEL_15;
    }
    v23 = (void *)MEMORY[0x24BDD1488];
    v24 = objc_opt_class();
    objc_msgSend_bundleForClass_(v23, v25, v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedStringForKey_value_table_(v21, v26, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_MESSAGE_BLUETOOTH_CONNECTIONS_DISABLED"), &stru_24FFCAEF8, CFSTR("ControlCenterUI+SystemModules"));
  }
  else
  {
    v18 = (void *)MEMORY[0x24BDD1488];
    v19 = objc_opt_class();
    objc_msgSend_bundleForClass_(v18, v20, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedStringForKey_value_table_(v21, v22, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_MESSAGE_BLUETOOTH_CONNECTIONS_ENABLED"), &stru_24FFCAEF8, CFSTR("ControlCenterUI+SystemModules"));
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  objc_msgSend_standardDefaults(CCUIConnectivityBluetoothDefaults, v6, v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_didPresentDisconnectBehaviorAlert(v27, v28, v29) & 1) == 0)
  {
    v30 = *(_DWORD *)(a1 + 48);
    if ((v30 == 4 || v30 == 3) && (_DWORD)v4 == 2)
    {
      v31 = *(void **)(a1 + 32);
      v42[0] = MEMORY[0x24BDAC760];
      v42[1] = 3221225472;
      v42[2] = sub_230FA6B60;
      v42[3] = &unk_24FFCA830;
      v43 = v27;
      objc_msgSend__presentBehaviorPromptWithCompletion_(v31, v32, (uint64_t)v42);
      WeakRetained = v43;
LABEL_22:

      goto LABEL_23;
    }
  }
  if (v17)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend_contentModuleContext(WeakRetained, v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_statusUpdateWithMessage_type_(MEMORY[0x24BE19B78], v37, (uint64_t)v17, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_enqueueStatusUpdate_(v36, v39, (uint64_t)v38);

    goto LABEL_22;
  }
LABEL_23:
  v40 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend__updateWithState_(v40, v41, (uint64_t)a2);

}

uint64_t sub_230FA6B60(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_setDidPresentDisconnectBehaviorAlert_, 1);
}

void sub_230FA7230(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  objc_msgSend_connectedDeviceNamesThatMayBeDenylisted(*(void **)(*(_QWORD *)(a1 + 32) + 1088), a2, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_230FA48D8;
  v6[3] = &unk_24FFCA898;
  v6[4] = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t sub_230FA748C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_230FA7628()
{
  CCUIConnectivityWiFiDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(CCUIConnectivityWiFiDefaults);
  v1 = (void *)qword_25414CC10;
  qword_25414CC10 = (uint64_t)v0;

}

void sub_230FA8180(uint64_t a1, const char *a2)
{
  uint64_t v3;
  void *v4;

  objc_msgSend_setDelegate_(*(void **)(*(_QWORD *)(a1 + 32) + 1096), a2, 0);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 1096);
  *(_QWORD *)(v3 + 1096) = 0;

}

uint64_t sub_230FA8354(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v4;

  objc_msgSend_refresh(*(void **)(*(_QWORD *)(a1 + 32) + 1096), a2, a3);
  return objc_msgSend_setDelegate_(*(void **)(*(_QWORD *)(a1 + 32) + 1096), v4, *(_QWORD *)(a1 + 32));
}

uint64_t sub_230FA8410(uint64_t a1, const char *a2)
{
  return objc_msgSend_setDelegate_(*(void **)(*(_QWORD *)(a1 + 32) + 1096), a2, 0);
}

uint64_t sub_230FA84FC(uint64_t a1, const char *a2)
{
  return objc_msgSend__updateStateWithEnabled_(*(void **)(a1 + 32), a2, *(unsigned __int8 *)(a1 + 40));
}

void sub_230FA85DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_230FA85F4(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend_airplaneMode(*(void **)(*(_QWORD *)(a1 + 32) + 1096), a2, a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t sub_230FA8858(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1096), sel_setAirplaneMode_, *(unsigned __int8 *)(a1 + 40));
}

void sub_230FA9398(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v3;
  uint64_t v4;
  id v5;

  objc_msgSend_view(*(void **)(a1 + 32), a2, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_layoutIfNeeded(v5, v3, v4);

}

void sub_230FA9848(uint64_t a1, void *a2, uint64_t a3)
{
  const char *v4;
  id v5;

  objc_msgSend_templateView(a2, (const char *)a2, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContentMetrics_(v5, v4, *(_QWORD *)(a1 + 32));

}

uint64_t sub_230FA9970(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend__initializeExpandedView(*(void **)(a1 + 32), a2, a3);
}

void sub_230FA9A18(uint64_t a1, const char *a2, uint64_t a3)
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  id v10;

  objc_msgSend__initializeExpandedView(*(void **)(a1 + 32), a2, a3);
  objc_msgSend_view(*(void **)(a1 + 32), v4, v5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNeedsLayout(v10, v6, v7);
  objc_msgSend_layoutIfNeeded(v10, v8, v9);

}

uint64_t sub_230FA9BD8(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend__updateTelephonyState(*(void **)(a1 + 32), a2, a3);
}

uint64_t sub_230FAB910(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_230FABF70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230FABF94(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD block[5];
  id v6;
  id v7[3];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230FAC030;
  block[3] = &unk_24FFCAA70;
  v3 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 56);
  v7[1] = a2;
  v7[2] = v4;
  v6 = v3;
  objc_copyWeak(v7, (id *)(a1 + 48));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(v7);

}

void sub_230FAC030(uint64_t a1, const char *a2)
{
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  void *v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v17;
  __CFString *v18;
  void *v19;
  __CFString *v20;
  uint64_t v21;
  const char *v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  int v27;
  __CFString *v28;
  const __CFString *v29;
  void *v30;
  __CFString *v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  id WeakRetained;
  const char *v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  void *v46;
  const char *v47;
  id v48;
  const char *v49;
  _QWORD v50[4];
  id v51;
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend__stateWithOverridesApplied_(*(void **)(a1 + 32), a2, *(_QWORD *)(a1 + 56));
  v4 = (void *)*MEMORY[0x24BE19AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 64);
    v9 = v4;
    objc_msgSend__debugDescriptionForState_(v7, v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__debugDescriptionForState_(*(void **)(a1 + 32), v12, v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v53 = v11;
    v54 = 2114;
    v55 = v13;
    _os_log_impl(&dword_230FA3000, v9, OS_LOG_TYPE_DEFAULT, "Toggled WiFi state from %{public}@ to %{public}@", buf, 0x16u);

  }
  v14 = *(_QWORD *)(a1 + 64);
  if (v14 == 1)
  {
    if (v3 != 3)
    {
LABEL_5:
      v15 = 0;
      goto LABEL_21;
    }
    goto LABEL_16;
  }
  if (v14 == 2 && v3 == 3)
  {
LABEL_16:
    v27 = MGGetBoolAnswer();
    v28 = CFSTR("CONTROL_CENTER_STATUS_MESSAGE_WIFI_BUSY");
    v29 = CFSTR("CONTROL_CENTER_STATUS_MESSAGE_WLAN_BUSY");
LABEL_17:
    if (v27)
      v28 = (__CFString *)v29;
    v30 = (void *)MEMORY[0x24BDD1488];
    v31 = v28;
    v32 = objc_opt_class();
    objc_msgSend_bundleForClass_(v30, v33, v32);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedStringForKey_value_table_(v25, v34, (uint64_t)v31, &stru_24FFCAEF8, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_20;
  }
  if (v14 != 3 || v3 != 4)
  {
    if (v14 == 3)
    {
      if (v3 != 2)
        goto LABEL_5;
    }
    else
    {
      v15 = 0;
      if (v14 != 4 || v3 != 2)
        goto LABEL_21;
    }
    v27 = MGGetBoolAnswer();
    v28 = CFSTR("CONTROL_CENTER_STATUS_MESSAGE_WIFI_DISCONNECTED");
    v29 = CFSTR("CONTROL_CENTER_STATUS_MESSAGE_WLAN_DISCONNECTED");
    goto LABEL_17;
  }
  if (!objc_msgSend_length(*(void **)(a1 + 40), v5, v6))
    goto LABEL_5;
  v17 = MGGetBoolAnswer();
  v18 = CFSTR("CONTROL_CENTER_STATUS_MESSAGE_WIFI_CONNECTED");
  if (v17)
    v18 = CFSTR("CONTROL_CENTER_STATUS_MESSAGE_WLAN_CONNECTED");
  v19 = (void *)MEMORY[0x24BDD1488];
  v20 = v18;
  v21 = objc_opt_class();
  objc_msgSend_bundleForClass_(v19, v22, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v23, v24, (uint64_t)v20, &stru_24FFCAEF8, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v26, (uint64_t)v25, *(_QWORD *)(a1 + 40));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

LABEL_21:
  objc_msgSend_standardDefaults(CCUIConnectivityWiFiDefaults, v5, v6);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend_didPresentDisconnectBehaviorAlert(v35, v36, v37) & 1) == 0)
  {
    v38 = *(_QWORD *)(a1 + 64);
    if ((v38 == 3 || v38 == 4) && v3 == 2)
    {
      v39 = *(void **)(a1 + 32);
      v50[0] = MEMORY[0x24BDAC760];
      v50[1] = 3221225472;
      v50[2] = sub_230FAC3D4;
      v50[3] = &unk_24FFCA830;
      v51 = v35;
      objc_msgSend__presentBehaviorPromptWithCompletion_(v39, v40, (uint64_t)v50);
      WeakRetained = v51;
LABEL_28:

      goto LABEL_29;
    }
  }
  if (v15)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend_contentModuleContext(WeakRetained, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_statusUpdateWithMessage_type_(MEMORY[0x24BE19B78], v45, (uint64_t)v15, 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_enqueueStatusUpdate_(v44, v47, (uint64_t)v46);

    goto LABEL_28;
  }
LABEL_29:
  v48 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend__updateWithState_(v48, v49, *(_QWORD *)(a1 + 56));

}

uint64_t sub_230FAC3D4(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_setDidPresentDisconnectBehaviorAlert_, 1);
}

uint64_t sub_230FACBF8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_230FACFAC()
{
  CCUIConnectivityManager *v0;
  void *v1;

  v0 = objc_alloc_init(CCUIConnectivityManager);
  v1 = (void *)qword_25414CC30;
  qword_25414CC30 = (uint64_t)v0;

}

void sub_230FAD114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230FAD130(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230FAD1A8;
  block[3] = &unk_24FFCAB28;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v2);
}

void sub_230FAD1A8(uint64_t a1)
{
  id WeakRetained;
  const char *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_wifiViewControllersObservingStateChanges(WeakRetained, v2, v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v12, v16, 16);
  if (v6)
  {
    v9 = v6;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v4);
        objc_msgSend_updateState(*(void **)(*((_QWORD *)&v12 + 1) + 8 * v11++), v7, v8);
      }
      while (v9 != v11);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v12, v16, 16);
    }
    while (v9);
  }

}

void sub_230FAD42C(uint64_t a1, const char *a2, uint64_t a3)
{
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend_vpnViewControllersObservingStateChanges(*(void **)(a1 + 32), a2, a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v11, v15, 16);
  if (v5)
  {
    v8 = v5;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v3);
        objc_msgSend_updateState(*(void **)(*((_QWORD *)&v11 + 1) + 8 * v10++), v6, v7);
      }
      while (v8 != v10);
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v11, v15, 16);
    }
    while (v8);
  }

}

void sub_230FADEC0(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  const char *v9;
  _QWORD v10[4];
  id v11;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = objc_opt_class();
  objc_msgSend_bundleForClass_(v3, v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v6, v7, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_CELLULAR_SETTINGS"), &stru_24FFCAEF8, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_230FADFCC;
  v10[3] = &unk_24FFCA808;
  objc_copyWeak(&v11, &location);
  objc_msgSend_setFooterButtonTitle_handler_(v2, v9, (uint64_t)v8, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void sub_230FADFA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_230FADFCC(uint64_t a1, const char *a2)
{
  void *v3;
  id WeakRetained;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;

  objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], a2, (uint64_t)CFSTR("prefs:root=MOBILE_DATA_SETTINGS_ID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_contentModuleContext(WeakRetained, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_openURL_completionHandler_(v7, v8, (uint64_t)v3, 0);

  return 0;
}

uint64_t sub_230FAE0F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__updateCellularMenuItems, a3);
}

void sub_230FAE5F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_230FAE624(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  const char *v5;
  _QWORD v7[4];
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)WeakRetained[156];
  v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_230FAE6C0;
  v7[3] = &unk_24FFCAB78;
  v8 = v4;
  objc_msgSend_setActiveUserDataSelection_completion_(v3, v5, (uint64_t)v8, v7);

  return 0;
}

void sub_230FAE6C0(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  v4 = *MEMORY[0x24BE19AA0];
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_ERROR);
  if (v3)
  {
    if (v5)
      sub_230FB3320(a1, (uint64_t)v3, v4);
  }
  else if (v5)
  {
    sub_230FB32B8(a1, v4, v6, v7, v8, v9, v10, v11);
  }

}

uint64_t sub_230FAE794(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel__updateCellularMenuItems, a3);
}

void sub_230FAE7DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_230FAED74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_performAction, a3);
}

uint64_t sub_230FAEFA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_performAction, a3);
}

void sub_230FAEFC8(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;
  const char *v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], a2, (uint64_t)CFSTR("x-apple-sosbuddy://open"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BE38320];
  v10[0] = *MEMORY[0x24BE38310];
  v10[1] = v3;
  v11[0] = MEMORY[0x24BDBD1C8];
  v11[1] = MEMORY[0x24BDBD1C8];
  v10[2] = *MEMORY[0x24BE382E0];
  v11[2] = *MEMORY[0x24BE19A30];
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v4, (uint64_t)v11, v10, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultWorkspace(MEMORY[0x24BDC1548], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_openSensitiveURL_withOptions_(v8, v9, (uint64_t)v2, v5);

}

uint64_t sub_230FAF238(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend__openSOSBuddyApp(*(void **)(a1 + 32), a2, a3);
  return 1;
}

uint64_t sub_230FAF39C(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend__openSOSBuddyApp(*(void **)(a1 + 32), a2, a3);
  return 1;
}

uint64_t sub_230FAF5B8(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend__connectToSatellite(*(void **)(a1 + 32), a2, a3);
  return 1;
}

uint64_t sub_230FAF5D4(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend__openSOSBuddyApp(*(void **)(a1 + 32), a2, a3);
  return 1;
}

uint64_t sub_230FAF7F0(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend__disconnectFromSatellite(*(void **)(a1 + 32), a2, a3);
  return 1;
}

uint64_t sub_230FAF80C(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend__openSOSBuddyApp(*(void **)(a1 + 32), a2, a3);
  return 1;
}

uint64_t sub_230FAFF64(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_230FB05C4(uint64_t a1, const char *a2)
{
  objc_msgSend_setDiscoverableMode_(*(void **)(a1 + 32), a2, 0);
  return 1;
}

uint64_t sub_230FB05E4(uint64_t a1, const char *a2)
{
  objc_msgSend_setDiscoverableMode_(*(void **)(a1 + 32), a2, 1);
  return 1;
}

uint64_t sub_230FB0604(uint64_t a1, const char *a2)
{
  objc_msgSend_setDiscoverableMode_(*(void **)(a1 + 32), a2, 2);
  return 1;
}

uint64_t sub_230FB0BEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_performAction, a3);
}

uint64_t sub_230FB0E20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_performAction, a3);
}

void *sub_230FB0E3C()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/Sharing.framework/Sharing", 1);
  qword_25414CC00 = (uint64_t)result;
  return result;
}

uint64_t sub_230FB1104(uint64_t a1)
{
  id WeakRetained;
  const char *v3;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1248));
  objc_msgSend_satelliteMenuModuleViewController_didChooseSelection_(WeakRetained, v3, *(_QWORD *)(a1 + 32), 0);

  return 1;
}

uint64_t sub_230FB114C(uint64_t a1)
{
  id WeakRetained;
  const char *v3;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1248));
  objc_msgSend_satelliteMenuModuleViewController_didChooseSelection_(WeakRetained, v3, *(_QWORD *)(a1 + 32), 1);

  return 1;
}

void sub_230FB18AC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_230FB18C0(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && _NETRBClientCreate())
  {
    v2 = *MEMORY[0x24BE19AA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_230FA3000, v2, OS_LOG_TYPE_DEFAULT, "[Hotspot] Starting hotspot service", v3, 2u);
    }
    _NETRBClientSetGlobalServiceState();
    _NETRBClientDestroy();
  }

}

uint64_t sub_230FB197C()
{
  return 0;
}

void sub_230FB1A28(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_230FB1A44(uint64_t a1, int a2)
{
  id *v3;
  id WeakRetained;
  const char *v5;
  uint64_t v6;
  int isDiscoverable;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  char v11;
  uint8_t buf[4];
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  isDiscoverable = objc_msgSend_isDiscoverable(WeakRetained, v5, v6);

  if (isDiscoverable != a2)
  {
    v8 = *MEMORY[0x24BE19AA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v13 = a2;
      _os_log_impl(&dword_230FA3000, v8, OS_LOG_TYPE_DEFAULT, "[Hotspot] Hotspot discoverability changed to %d", buf, 8u);
    }
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = sub_230FB1B6C;
    v9[3] = &unk_24FFCACC8;
    objc_copyWeak(&v10, v3);
    v11 = a2;
    dispatch_async(MEMORY[0x24BDAC9B8], v9);
    objc_destroyWeak(&v10);
  }
}

void sub_230FB1B6C(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  const char *v4;
  const char *v5;
  uint64_t v6;
  id v7;

  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_setDiscoverable_(WeakRetained, v4, *(unsigned __int8 *)(a1 + 40));

  v7 = objc_loadWeakRetained(v2);
  objc_msgSend__updateState(v7, v5, v6);

}

void sub_230FB1CAC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 32));
  _Unwind_Resume(a1);
}

void sub_230FB1CC0(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  uint64_t v3;
  const void *v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  char v8;
  NSObject *v9;
  _QWORD block[4];
  id v11;
  int v12;
  char v13;
  char v14;
  char v15;
  __int16 v16;
  uint64_t v17;
  int v18;
  int v19;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  _BOOL4 v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v19 = 0;
    if (_NETRBClientCreate())
    {
      v18 = 0;
      v17 = 0;
      _NETRBClientGetGlobalServiceState();
      _NETRBClientGetHostCount();
      _NETRBClientDestroy();
      v16 = 0;
      v15 = 0;
      v3 = _CTServerConnectionCreateWithIdentifier();
      if (v3)
      {
        v4 = (const void *)v3;
        _CTServerConnectionGetCellularDataSettings();
        CFRelease(v4);
        v5 = HIBYTE(v16) == 1;
        v6 = v16 == 1;
        v7 = v15 == 1;
      }
      else
      {
        v7 = 0;
        v6 = 0;
        v5 = 0;
      }
      v9 = *MEMORY[0x24BE19AA0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67110144;
        v21 = 0;
        v22 = 1024;
        v23 = 0;
        v24 = 1024;
        v25 = v5;
        v26 = 1024;
        v27 = v6;
        v28 = 1024;
        v29 = v7;
        _os_log_impl(&dword_230FA3000, v9, OS_LOG_TYPE_DEFAULT, "[Hotspot] Evaluating state... (shouldShowTethering: %d, isDataPrevented: %d, isCellularDataCapable: %d, isCellularDataEnabled: %d, isAirplaneModeEnabled: %d)", buf, 0x20u);
      }
      v8 = (!v6 || v7) | 1;
    }
    else
    {
      v8 = 0;
    }
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_230FB1F3C;
    block[3] = &unk_24FFCAD38;
    objc_copyWeak(&v11, v1);
    v13 = v8;
    v14 = 0;
    v12 = v19;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v11);
  }

}

uint64_t sub_230FB1F34()
{
  return 0;
}

void sub_230FB1F3C(uint64_t a1)
{
  id WeakRetained;
  const char *v3;
  uint64_t v4;
  unsigned int isHotspotRestricted;
  os_log_t *v6;
  NSObject *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  os_log_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  unsigned int isInoperative;
  const char *v23;
  uint64_t v24;
  int isAvailable;
  const char *v26;
  uint64_t v27;
  int isEnabled;
  const char *v29;
  uint64_t v30;
  int isDiscoverable;
  const char *v32;
  uint64_t v33;
  int v34;
  int v35;
  unsigned int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  isHotspotRestricted = objc_msgSend__isHotspotRestricted(WeakRetained, v3, v4);
  v6 = (os_log_t *)MEMORY[0x24BE19AA0];
  v7 = *MEMORY[0x24BE19AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
  {
    v35 = 67109120;
    v36 = isHotspotRestricted;
    _os_log_impl(&dword_230FA3000, v7, OS_LOG_TYPE_DEFAULT, "[Hotspot] Evaluating state... (isHotspotRestricted: %d)", (uint8_t *)&v35, 8u);
  }
  if (*(_BYTE *)(a1 + 44))
    objc_msgSend_setInoperative_(WeakRetained, v8, 1);
  else
    objc_msgSend_setInoperative_(WeakRetained, v8, isHotspotRestricted);
  objc_msgSend_setAvailable_(WeakRetained, v9, *(unsigned __int8 *)(a1 + 45));
  objc_msgSend_setConnections_(WeakRetained, v10, *(unsigned int *)(a1 + 40));
  objc_msgSend_subtitleText(WeakRetained, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setSubtitle_(WeakRetained, v14, (uint64_t)v13);

  v17 = *(_BYTE *)(a1 + 45)
     && objc_msgSend_isDiscoverable(WeakRetained, v15, v16)
     && *(_DWORD *)(a1 + 40) != 0;
  objc_msgSend_setEnabled_(WeakRetained, v15, v17);
  v18 = *v6;
  if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEFAULT))
  {
    v19 = v18;
    isInoperative = objc_msgSend_isInoperative(WeakRetained, v20, v21);
    isAvailable = objc_msgSend_isAvailable(WeakRetained, v23, v24);
    isEnabled = objc_msgSend_isEnabled(WeakRetained, v26, v27);
    isDiscoverable = objc_msgSend_isDiscoverable(WeakRetained, v29, v30);
    v34 = objc_msgSend_connections(WeakRetained, v32, v33);
    v35 = 67110144;
    v36 = isInoperative;
    v37 = 1024;
    v38 = isAvailable;
    v39 = 1024;
    v40 = isEnabled;
    v41 = 1024;
    v42 = isDiscoverable;
    v43 = 1024;
    v44 = v34;
    _os_log_impl(&dword_230FA3000, v19, OS_LOG_TYPE_DEFAULT, "[Hotspot] Updated state [ inoperative: %d available: %d enabled: %d discoverable: %d connections: %d ]", (uint8_t *)&v35, 0x20u);

  }
}

void sub_230FB279C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_230FB27C0(uint64_t a1, void *a2, void *a3)
{
  _QWORD block[4];
  id v6[3];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_230FB284C;
  block[3] = &unk_24FFCAD68;
  objc_copyWeak(v6, (id *)(a1 + 32));
  v6[1] = a2;
  v6[2] = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(v6);
}

void sub_230FB284C(uint64_t a1)
{
  _QWORD *WeakRetained;
  const char *v3;
  uint64_t v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[8] = *(_QWORD *)(a1 + 40);
    WeakRetained[9] = *(_QWORD *)(a1 + 48);
    v5 = WeakRetained;
    objc_msgSend__reevaluateState(WeakRetained, v3, v4);
    WeakRetained = v5;
  }

}

void sub_230FB2928(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_230FB2944(uint64_t a1)
{
  _QWORD v2[5];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = sub_230FB29C8;
  v2[3] = &unk_24FFCADB8;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  v2[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
  objc_destroyWeak(&v3);
}

void sub_230FB29C8(uint64_t a1)
{
  id *v2;
  const char *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  id WeakRetained;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend_setWaitingForOffGridModeToDisableBeforeDisconnecting_(*(void **)(a1 + 32), v3, 0);
  if (WeakRetained)
  {
    v4 = objc_loadWeakRetained(v2);
    objc_msgSend__reevaluateState(v4, v5, v6);

  }
}

uint64_t sub_230FB2AE0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_230FB2D48(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend__reevaluateState(*(void **)(a1 + 32), a2, a3);
}

uint64_t sub_230FB2E50(uint64_t a1)
{
  return MEMORY[0x24BEDD108](*(_QWORD *)(a1 + 32), sel_notifyDelegateOfStateChange_, *(_QWORD *)(a1 + 40));
}

uint64_t sub_230FB303C(uint64_t a1, const char *a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) = *(_QWORD *)(a1 + 48);
  return objc_msgSend__reevaluateState(*(void **)(a1 + 32), a2, a3);
}

void sub_230FB316C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_230FA3000, a2, OS_LOG_TYPE_ERROR, "[VPN] Error togging VPN: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_230FB31E0(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_230FA3000, a2, OS_LOG_TYPE_ERROR, "Could not get subscription info. Error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_230FB3254(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_230FAE7DC(&dword_230FA3000, a2, a3, "Could not get subscriptions Info. Error: %@", a5, a6, a7, a8, 2u);
  sub_230FAE7EC();
}

void sub_230FB32B8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_230FAE7DC(&dword_230FA3000, a2, a3, "Setting Active user data selection to %@", a5, a6, a7, a8, 2u);
  sub_230FAE7EC();
}

void sub_230FB3320(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_230FA3000, log, OS_LOG_TYPE_ERROR, "Error setting active data selection to %@. Error: %@", (uint8_t *)&v4, 0x16u);
  sub_230FAE7EC();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x24BE0BB58]();
}

uint64_t BSDispatchQueueCreateSerialWithQoS()
{
  return MEMORY[0x24BE0BB68]();
}

uint64_t BSEqualBools()
{
  return MEMORY[0x24BE0BB88]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x24BE0BBA0]();
}

uint64_t CCSIsInternalInstall()
{
  return MEMORY[0x24BE199F8]();
}

uint64_t CCUICompactModuleContinuousCornerRadiusForGridSizeClass()
{
  return MEMORY[0x24BE19A50]();
}

uint64_t CCUIItemEdgeSize()
{
  return MEMORY[0x24BE19A80]();
}

uint64_t CCUILayoutGutter()
{
  return MEMORY[0x24BE19A88]();
}

uint64_t CCUIMaximumExpandedContentModuleHeight()
{
  return MEMORY[0x24BE19AB0]();
}

uint64_t CCUIReferenceScreenBounds()
{
  return MEMORY[0x24BE19AC8]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x24BDF7CB8]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x24BDF7CF8]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x24BDF7D98]();
}

uint64_t WFScanRecordAlphaSortCompartor()
{
  return MEMORY[0x24BEC29D0]();
}

uint64_t WFSignalBarsFromScaledRSSI()
{
  return MEMORY[0x24BEC29D8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CTServerConnectionCreateWithIdentifier()
{
  return MEMORY[0x24BDC28A0]();
}

uint64_t _CTServerConnectionGetCellularDataIsEnabled()
{
  return MEMORY[0x24BDC28D0]();
}

uint64_t _CTServerConnectionGetCellularDataSettings()
{
  return MEMORY[0x24BDC28D8]();
}

uint64_t _CTServerConnectionSetCellularDataIsEnabled()
{
  return MEMORY[0x24BDC2958]();
}

uint64_t _NETRBClientCreate()
{
  return MEMORY[0x24BE6B640]();
}

uint64_t _NETRBClientDestroy()
{
  return MEMORY[0x24BE6B648]();
}

uint64_t _NETRBClientGetGlobalServiceState()
{
  return MEMORY[0x24BE6B650]();
}

uint64_t _NETRBClientGetHostCount()
{
  return MEMORY[0x24BE6B658]();
}

uint64_t _NETRBClientSetGlobalServiceState()
{
  return MEMORY[0x24BE6B660]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

