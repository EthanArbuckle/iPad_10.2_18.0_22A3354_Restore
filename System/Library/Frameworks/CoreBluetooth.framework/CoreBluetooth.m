__CFString *CBXpcCreateNSObjectWithXpcObject(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _BOOL4 value;
  void *v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  id v19;
  const void *bytes_ptr;
  uint64_t v21;
  void *v22;
  void *v23;

  v1 = a1;
  v2 = MEMORY[0x1A85D2194]();
  if (v2 == MEMORY[0x1E0C81328])
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", xpc_int64_get_value(v1));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  v3 = v2;
  if (v2 == MEMORY[0x1E0C81398])
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", xpc_uint64_get_value(v1));
    v11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  if (v2 == MEMORY[0x1E0C812D0])
  {
    value = xpc_BOOL_get_value(v1);
    v13 = (void *)MEMORY[0x1E0C9AAA0];
    if (value)
      v13 = (void *)MEMORY[0x1E0C9AAB0];
    v11 = v13;
    goto LABEL_35;
  }
  if (v2 != MEMORY[0x1E0C81390])
  {
    if (v2 == MEMORY[0x1E0C812E8])
    {
      v19 = objc_alloc(MEMORY[0x1E0C99D50]);
      bytes_ptr = xpc_data_get_bytes_ptr(v1);
      v11 = (id)objc_msgSend(v19, "initWithBytes:length:", bytes_ptr, xpc_data_get_length(v1));
    }
    else if (v2 == MEMORY[0x1E0C813A0])
    {
      v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", xpc_uuid_get_bytes(v1));
    }
    else if (v2 == MEMORY[0x1E0C812C8])
    {
      CBXpcCreateNSArrayWithXpcArray(v1);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if (v2 == MEMORY[0x1E0C812F8])
    {
      CBXpcCreateNSDictionaryWithXpcDictionary(v1);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if (v2 == MEMORY[0x1E0C81318])
    {
      v21 = xpc_fd_dup(v1);
      if ((v21 & 0x80000000) != 0)
      {
        if (CBLogInitOnce != -1)
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
        v22 = (void *)CBLogComponent;
        if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
          CBXpcCreateNSObjectWithXpcObject_cold_1(v22);
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v21);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v2 != MEMORY[0x1E0C81300])
      {
        if (CBLogInitOnce != -1)
          dispatch_once_f(&CBLogInitOnce, 0, (dispatch_function_t)CBLogInit);
        v4 = CBLogComponent;
        if (os_log_type_enabled((os_log_t)CBLogComponent, OS_LOG_TYPE_ERROR))
          CBXpcCreateNSObjectWithXpcObject_cold_2(v3, v4, v5, v6, v7, v8, v9, v10);

        return (__CFString *)0;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", xpc_double_get_value(v1));
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_35:
    v23 = v11;

    return (__CFString *)v23;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", xpc_string_get_string_ptr(v1));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = &stru_1E5403C08;
  if (v14)
    v16 = (__CFString *)v14;
  v17 = v16;

  return v17;
}

void sub_1A82A449C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL CBDiscoveryTypesContainTypes(_BYTE *a1, _BYTE *a2)
{
  if ((*a2 & *a1) != 0)
    return 1;
  if ((a2[1] & a1[1]) != 0)
    return 1;
  if ((a2[2] & a1[2]) != 0)
    return 1;
  return (a2[3] & a1[3]) != 0;
}

id CBDeviceTypeToNSLocalizedString(int a1)
{
  void *v1;
  void *v2;
  const __CFString *v3;
  void *v4;

  switch(a1)
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_generic_computer");
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_generic_phone");
      break;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_generic_audio_video");
      break;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_generic_peripheral");
      break;
    case 5:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_generic_imaging");
      break;
    case 6:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_generic_toy");
      break;
    case 7:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_desktop_computer");
      break;
    case 8:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_laptop_computer");
      break;
    case 9:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_wearable_computer");
      break;
    case 10:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_server");
      break;
    case 11:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_pda");
      break;
    case 12:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_mobile_phone");
      break;
    case 13:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_cordless_phone");
      break;
    case 14:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_modem");
      break;
    case 15:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_access_point");
      break;
    case 16:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_headset");
      break;
    case 17:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_handsfree");
      break;
    case 18:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_microphone");
      break;
    case 19:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_speaker");
      break;
    case 20:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_headphones");
      break;
    case 21:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_portable_audio");
      break;
    case 22:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_car_stereo");
      break;
    case 23:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_hifi_stereo");
      break;
    case 24:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_keyboard");
      break;
    case 25:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_mouse");
      break;
    case 26:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_gamepad");
      break;
    case 27:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_remote_control");
      break;
    case 28:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_sensor");
      break;
    case 29:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_tablet");
      break;
    case 30:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_card_reader");
      break;
    case 31:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_printer");
      break;
    case 32:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_scanner");
      break;
    case 33:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_camera");
      break;
    case 34:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_video_camera");
      break;
    case 35:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_display");
      break;
    case 36:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_video_display");
      break;
    case 37:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_video_conferencing");
      break;
    case 38:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_set_top_box");
      break;
    case 39:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_vcr");
      break;
    case 40:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_gaming_console");
      break;
    case 41:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_toy_controller");
      break;
    case 42:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_watch");
      break;
    case 43:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_pager");
      break;
    case 44:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_jacket");
      break;
    case 45:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_helmet");
      break;
    case 46:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_glasses");
      break;
    case 47:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_a2dp");
      break;
    case 48:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_le_peripheral");
      break;
    case 49:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_apple_trackpad");
      break;
    case 50:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_joystick");
      break;
    case 51:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_hearing_aid");
      break;
    default:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("bt_type_generic");
      break;
  }
  objc_msgSend(v1, "localizedStringForKey:value:table:", v3, &stru_1E5403C08, CFSTR("CBLocalizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id CBXpcCreateNSDictionaryWithXpcDictionary(void *a1)
{
  id v1;
  size_t count;
  uint64_t v3;
  char *v4;
  void *v5;
  uint64_t v6;
  char *v7;
  _QWORD applier[7];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  count = xpc_dictionary_get_count(v1);
  v3 = 8 * count;
  MEMORY[0x1E0C80A78]();
  v4 = (char *)applier - ((8 * count + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v4, 8 * count);
  MEMORY[0x1E0C80A78]();
  bzero(v4, 8 * count);
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 3221225472;
  applier[2] = __CBXpcCreateNSDictionaryWithXpcDictionary_block_invoke;
  applier[3] = &unk_1E54023A8;
  applier[4] = v10;
  applier[5] = v4;
  applier[6] = v4;
  xpc_dictionary_apply(v1, applier);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjects:forKeys:count:", v4, v4, count);
  _Block_object_dispose(v10, 8);
  if (count)
  {
    v6 = 8 * count;
    do
    {

      v6 -= 8;
    }
    while (v6);
    v7 = v4 - 8;
    do
    {

      v3 -= 8;
    }
    while (v3);
  }

  return v5;
}

void sub_1A82A7C88(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 104), 8);
  _Unwind_Resume(a1);
}

_BYTE *CBDiscoveryTypesRemoveTypes(_BYTE *result, _BYTE *a2)
{
  *result &= ~*a2;
  result[1] &= ~a2[1];
  result[2] &= ~a2[2];
  result[3] &= ~a2[3];
  return result;
}

_BYTE *CBDiscoveryTypesAddChangedTypes(_BYTE *result, _BYTE *a2, _BYTE *a3)
{
  *result |= *a3 ^ *a2;
  result[1] |= a3[1] ^ a2[1];
  result[2] |= a3[2] ^ a2[2];
  result[3] |= a3[3] ^ a2[3];
  return result;
}

_BYTE *CBDiscoveryTypesAddTypes(_BYTE *result, _BYTE *a2)
{
  *result |= *a2;
  result[1] |= a2[1];
  result[2] |= a2[2];
  result[3] |= a2[3];
  return result;
}

_BYTE *CBDiscoveryTypesBLEScan()
{
  if (qword_1ECF9A190 != -1)
    dispatch_once(&qword_1ECF9A190, &__block_literal_global_1);
  return _MergedGlobals_0;
}

void *CBDiscoveryTypesNeedsIdentify()
{
  if (qword_1ECF9A1C0 != -1)
    dispatch_once(&qword_1ECF9A1C0, &__block_literal_global_200);
  return &unk_1ECF9A178;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void *CBDiscoveryTypesNeedsAdvertisingAddress()
{
  if (qword_1ECF9A1B8 != -1)
    dispatch_once(&qword_1ECF9A1B8, &__block_literal_global_199);
  return &unk_1ECF9A174;
}

void sub_1A82AF660(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF678(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF690(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF6A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF6C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF6D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF6F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF708(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF720(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF738(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF750(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF768(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF780(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF798(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF7B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF7C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF7E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF7F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF810(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF828(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF840(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF858(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF870(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF888(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF8A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF8B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF8D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF8E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF900(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF918(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF930(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF948(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF960(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF978(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF990(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF9A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF9C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF9D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AF9F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFA08(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFA20(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFA38(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFA50(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFA68(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFA80(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFA98(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFAB0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFAC8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFAE0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFAF8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFB10(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFB28(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFB40(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFB58(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFB70(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFB88(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFBA0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFBB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFBD0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFBE8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFC00(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFC18(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFC30(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFC48(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFC60(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFC78(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFC90(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFCA8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFCC0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFCD8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFCF0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFD08(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFD20(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFD38(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFD50(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFD68(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFD80(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFD98(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFDB0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFDC8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFDE0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFDF8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFE10(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFE28(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFE40(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFE58(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFE70(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFE88(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFEA0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFEB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFED0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFEE8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFF00(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFF18(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFF30(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFF48(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFF60(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFF78(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFF90(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFFA8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFFC0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFFD8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82AFFF0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0008(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0020(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0038(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0050(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0068(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0080(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0098(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B00B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B00C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B00E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B00F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0110(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0128(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0140(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0158(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0170(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0188(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B01A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B01B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B01D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B01E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0200(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0218(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0230(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0248(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0260(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0278(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0290(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B02A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B02C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B02D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B02F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0308(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0320(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0338(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0350(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0368(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0380(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0398(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B03B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B03C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B03E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B03F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0410(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0428(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0440(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0458(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0470(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0488(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B04A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B04B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B04D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B04E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0500(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0518(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0530(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0548(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0560(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0578(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0590(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B05A8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B05C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B05D8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B05F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0608(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0620(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0638(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0650(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0668(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0680(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0698(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B06B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B06C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B06E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B06F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0710(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0728(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0740(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0758(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0770(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B0788(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B07A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A82B07B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void *CBDiscoveryTypesBuffer()
{
  if (qword_1ECF9A198 != -1)
    dispatch_once(&qword_1ECF9A198, &__block_literal_global_195);
  return &unk_1ECF9A164;
}

uint64_t CBDiscoveryFlagsToString()
{
  return CUPrintFlags64();
}

void sub_1A82B151C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 144), 8);
  _Unwind_Resume(a1);
}

id CBGenerateObfuscatedSHA256HashedString(void *a1)
{
  const char *v1;
  CC_LONG v2;
  char v3;
  char v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v24;
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
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unsigned __int8 v47[16];
  __int128 v48;
  _BYTE data[32];
  unsigned __int8 md[16];
  __int128 v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v1 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  *(_OWORD *)md = 0u;
  v51 = 0u;
  *(_OWORD *)v47 = 0u;
  v48 = 0u;
  v2 = strlen(v1);
  if (!CC_SHA256(v1, v2, md))
    return 0;
  data[0] = bijectByteToBytePreSHA256[md[0]];
  data[1] = bijectByteToBytePreSHA256[md[1]];
  v3 = bijectByteToBytePreSHA256[md[3]];
  data[2] = bijectByteToBytePreSHA256[md[2]];
  data[3] = v3;
  data[4] = bijectByteToBytePreSHA256[md[4]];
  v4 = bijectByteToBytePreSHA256[md[6]];
  data[5] = bijectByteToBytePreSHA256[md[5]];
  data[6] = v4;
  data[7] = bijectByteToBytePreSHA256[md[7]];
  v5 = bijectByteToBytePreSHA256[md[9]];
  data[8] = bijectByteToBytePreSHA256[md[8]];
  data[9] = v5;
  data[10] = bijectByteToBytePreSHA256[md[10]];
  v6 = bijectByteToBytePreSHA256[md[12]];
  data[11] = bijectByteToBytePreSHA256[md[11]];
  data[12] = v6;
  data[13] = bijectByteToBytePreSHA256[md[13]];
  v7 = bijectByteToBytePreSHA256[md[15]];
  data[14] = bijectByteToBytePreSHA256[md[14]];
  data[15] = v7;
  data[16] = bijectByteToBytePreSHA256[v51];
  v8 = bijectByteToBytePreSHA256[BYTE2(v51)];
  data[17] = bijectByteToBytePreSHA256[BYTE1(v51)];
  data[18] = v8;
  data[19] = bijectByteToBytePreSHA256[BYTE3(v51)];
  v9 = bijectByteToBytePreSHA256[BYTE5(v51)];
  data[20] = bijectByteToBytePreSHA256[BYTE4(v51)];
  data[21] = v9;
  data[22] = bijectByteToBytePreSHA256[BYTE6(v51)];
  v10 = bijectByteToBytePreSHA256[BYTE8(v51)];
  data[23] = bijectByteToBytePreSHA256[BYTE7(v51)];
  data[24] = v10;
  data[25] = bijectByteToBytePreSHA256[BYTE9(v51)];
  v11 = bijectByteToBytePreSHA256[BYTE11(v51)];
  data[26] = bijectByteToBytePreSHA256[BYTE10(v51)];
  data[27] = v11;
  data[28] = bijectByteToBytePreSHA256[BYTE12(v51)];
  v12 = bijectByteToBytePreSHA256[BYTE14(v51)];
  data[29] = bijectByteToBytePreSHA256[BYTE13(v51)];
  data[30] = v12;
  data[31] = bijectByteToBytePreSHA256[HIBYTE(v51)];
  if (!CC_SHA256(data, 0x20u, v47))
    return 0;
  v13 = BYTE1(v48);
  v14 = v47[0];
  v15 = v47[11];
  v16 = v47[2];
  v17 = BYTE5(v48);
  v18 = BYTE4(v48);
  v19 = v47[15];
  v20 = BYTE6(v48);
  v21 = BYTE9(v48);
  v24 = v47[8];
  v25 = BYTE3(v48);
  v26 = v47[10];
  v27 = BYTE13(v48);
  v28 = BYTE12(v48);
  v29 = BYTE7(v48);
  v30 = BYTE14(v48);
  v31 = v47[1];
  v32 = v48;
  v33 = BYTE11(v48);
  v34 = BYTE2(v48);
  v35 = v47[5];
  v36 = v47[4];
  v37 = HIBYTE(v48);
  v38 = v47[6];
  v39 = v47[9];
  v40 = BYTE8(v48);
  v41 = v47[3];
  v42 = BYTE10(v48);
  v43 = v47[13];
  v45 = v47[12];
  v44 = v47[7];
  v46 = v47[14];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 64);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v13);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v14);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v15);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v16);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v17);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v18);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v19);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v20);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v21);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v24);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v25);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v26);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v27);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v28);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v29);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v30);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v31);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v32);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v33);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v34);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v35);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v36);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v37);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v38);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v39);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v40);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v41);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v42);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v43);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v45);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v44);
  objc_msgSend(v22, "appendFormat:", CFSTR("%02x"), v46);
  return v22;
}

id CBXpcCreateXPCObjectWithNSObject(void *a1)
{
  id v1;
  double v2;
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  unsigned __int8 uuid[8];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (objc_msgSend(v1, "isNSNumber"))
  {
    if (CFNumberIsFloatType((CFNumberRef)v1))
    {
      objc_msgSend(v1, "doubleValue");
      v3 = (uint64_t)xpc_double_create(v2);
    }
    else
    {
      v3 = (uint64_t)xpc_int64_create(objc_msgSend(v1, "longLongValue"));
    }
  }
  else if (objc_msgSend(v1, "isNSString"))
  {
    v3 = (uint64_t)xpc_string_create((const char *)objc_msgSend(objc_retainAutorelease(v1), "UTF8String"));
  }
  else if (objc_msgSend(v1, "isNSData"))
  {
    v4 = objc_retainAutorelease(v1);
    v3 = (uint64_t)xpc_data_create((const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      *(_QWORD *)uuid = 0;
      v9 = 0;
      objc_msgSend(v1, "getUUIDBytes:", uuid);
      v3 = (uint64_t)xpc_uuid_create(uuid);
    }
    else if (objc_msgSend(v1, "isNSArray"))
    {
      CBXpcCreateXPCArrayWithNSArray(v1);
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v1, "isNSDictionary"))
    {
      CBXpcCreateXPCDictionaryWithNSDictionary(v1);
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v1, "data");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        CBXpcCreateXPCObjectWithNSObject(v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_20;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_21:
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("Invalid Object"), CFSTR("Object %@ is invalid"), v1);
        v6 = 0;
        goto LABEL_22;
      }
      v3 = (uint64_t)xpc_null_create();
    }
  }
  v6 = (void *)v3;
LABEL_20:
  if (!v6)
    goto LABEL_21;
LABEL_22:

  return v6;
}

id CBXpcCreateXPCDictionaryWithNSDictionary(void *a1)
{
  id v1;
  size_t v2;
  uint64_t v3;
  char *v4;
  char *v5;
  xpc_object_t v6;
  _QWORD v8[7];
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_msgSend(v1, "count");
  v3 = 8 * v2;
  MEMORY[0x1E0C80A78]();
  v4 = (char *)v8 - ((8 * v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v4, 8 * v2);
  MEMORY[0x1E0C80A78]();
  v5 = v4;
  bzero(v4, 8 * v2);
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __CBXpcCreateXPCDictionaryWithNSDictionary_block_invoke;
  v8[3] = &unk_1E5402360;
  v8[4] = v9;
  v8[5] = v4;
  v8[6] = v4;
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = xpc_dictionary_create((const char *const *)v4, (xpc_object_t *)v4, v2);
  _Block_object_dispose(v9, 8);
  if (v2)
  {
    do
    {

      v3 -= 8;
    }
    while (v3);
  }

  return v6;
}

void sub_1A82B47CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 88), 8);
  _Unwind_Resume(a1);
}

id CBXpcCreateXPCArrayWithNSArray(void *a1)
{
  id v1;
  size_t v2;
  uint64_t v3;
  uint64_t v4;
  xpc_object_t *v5;
  xpc_object_t v6;
  xpc_object_t *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_msgSend(v1, "count");
  v3 = v2;
  MEMORY[0x1E0C80A78]();
  v5 = (xpc_object_t *)((char *)v9 - v4);
  bzero((char *)v9 - v4, 8 * v2);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __CBXpcCreateXPCArrayWithNSArray_block_invoke;
  v9[3] = &__block_descriptor_40_e15_v32__0_8Q16_B24l;
  v9[4] = v5;
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v9);
  v6 = xpc_array_create(v5, v2);
  if (v2)
  {
    v7 = v5 - 1;
    do

    while (v3 * 8);
  }

  return v6;
}

void *CBDiscoveryTypesNeedsObjectLocator()
{
  if (qword_1ECF9A1D0 != -1)
    dispatch_once(&qword_1ECF9A1D0, &__block_literal_global_202);
  return &unk_1ECF9A180;
}

uint64_t CBDiscoveryTypesAppendString(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v4;
  char **v5;
  uint64_t result;
  char *v7;
  int v8;

  v4 = 1;
  v5 = &off_1E5401530;
  do
  {
    v8 = *((_DWORD *)v5 - 4);
    if ((v8 - 30) >= 0xFFFFFFE3
      && ((*(unsigned __int8 *)(a3 + ((unint64_t)(v8 - 1) >> 3)) >> (-(char)v8 & 7)) & 1) != 0)
    {
      result = NSAppendPrintF_safe();
      v4 = 0;
    }
    v7 = *v5;
    v5 += 3;
  }
  while (v7);
  if ((v4 & 1) == 0)
    return NSAppendPrintF_safe();
  return result;
}

void *CBDiscoveryTypesNearbyInfoV2()
{
  if (qword_1ECF9A1C8 != -1)
    dispatch_once(&qword_1ECF9A1C8, &__block_literal_global_201);
  return &unk_1ECF9A17C;
}

void sub_1A82B5334(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t CBXPCDecodeDiscoveryTypes(void *a1, const char *a2, void *a3)
{
  const void *data;
  size_t v5;
  size_t length;

  length = 0;
  data = xpc_dictionary_get_data(a1, a2, &length);
  if (data)
  {
    if (length == 4)
    {
      v5 = 4;
    }
    else
    {
      if (length >= 4)
        v5 = 4;
      else
        v5 = length;
      length = v5;
    }
    memcpy(a3, data, v5);
  }
  return 1;
}

uint64_t CBXPCGetNextClientID()
{
  unsigned int v0;
  uint64_t result;

  if (qword_1ECF9A1E0 != -1)
    dispatch_once(&qword_1ECF9A1E0, &__block_literal_global_325);
  do
  {
    v0 = __ldaxr((unsigned int *)&unk_1ECF9A188);
    result = v0 + 1;
  }
  while (__stlxr(result, (unsigned int *)&unk_1ECF9A188));
  return result;
}

void *CBDiscoveryTypesNearbyActionV2()
{
  if (qword_1ECF9A1A8 != -1)
    dispatch_once(&qword_1ECF9A1A8, &__block_literal_global_197);
  return &unk_1ECF9A16C;
}

void *CBDiscoveryTypesNearbyActionV1()
{
  if (qword_1ECF9A1A0 != -1)
    dispatch_once(&qword_1ECF9A1A0, &__block_literal_global_196);
  return &unk_1ECF9A168;
}

void CBLogInit()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.bluetooth", "CoreBluetooth");
  v1 = (void *)CBLogComponent;
  CBLogComponent = (uint64_t)v0;

}

void sub_1A82B7CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82B7D00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82B7FF4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1A82B8364(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id CBXpcCreateNSArrayWithXpcArray(void *a1)
{
  id v1;
  size_t count;
  size_t v3;
  void *v4;
  _QWORD applier[6];

  applier[5] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  count = xpc_array_get_count(v1);
  v3 = 8 * count;
  MEMORY[0x1E0C80A78]();
  bzero((char *)applier - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 3221225472;
  applier[2] = __CBXpcCreateNSArrayWithXpcArray_block_invoke;
  applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
  applier[4] = (char *)applier - ((8 * count + 15) & 0xFFFFFFFFFFFFFFF0);
  xpc_array_apply(v1, applier);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:count:", (char *)applier - ((8 * count + 15) & 0xFFFFFFFFFFFFFFF0), count);
  if (count)
  {
    do
    {

      v3 -= 8;
    }
    while (v3);
  }

  return v4;
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0xEu);
}

void sub_1A82BA92C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1A82CAA90(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A82CB2E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82CB304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82CB65C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82CB678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82CB9C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82CB9E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82CBD0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82CBD28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82CC074(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82CC090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82CC3BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82CC3D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82CC75C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82CC778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82CCAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82CCB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82CCE30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82CCE4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82CD1B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82CD1D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82CD4D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82CD4E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82CD838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82CD850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  (*(void (**)(uint64_t))(v17 + 16))(v17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82CDBC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82CDBE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  (*(void (**)(uint64_t))(v17 + 16))(v17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82CDF18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A82CE290(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

const char *CBUseCaseToString(int a1)
{
  const char *result;

  if (a1 >= 0x20000)
  {
    if (a1 >= 327680)
    {
      if (a1 >= 589824)
      {
        if (a1 <= 2147418111)
        {
          switch(a1)
          {
            case 589824:
              return "FindNearbyRemote";
            case 589825:
              return "FindNearbyPencil";
            case 655360:
              return "AccessDigitalHomeKey";
            default:
              return "?";
          }
        }
        else
        {
          switch(a1)
          {
            case 2147418112:
              result = "InternalTestNoLockScan";
              break;
            case 2147418113:
              result = "InternalTestNoScreenOffScan";
              break;
            case 2147418114:
              result = "InternalTestScanWithNoDups";
              break;
            case 2147418115:
              result = "InternalTestScanWithDups";
              break;
            case 2147418116:
              result = "InternalTestScanFor20Seconds";
              break;
            case 2147418117:
              result = "InternalTestActiveScan";
              break;
            case 2147418118:
              result = "InternalTestUUIDScan";
              break;
            case 2147418119:
              result = "InternalTestScanFor10ClockSeconds";
              break;
            case 2147418120:
              result = "InternalTestScanBoost";
              break;
            default:
              return "?";
          }
        }
      }
      else if (a1 > 458752)
      {
        switch(a1)
        {
          case 524288:
            result = "ADPD";
            break;
          case 524289:
            result = "ADPDBuffer";
            break;
          case 524290:
            result = "MicroLocation";
            break;
          case 524291:
            result = "MicroLocationLeech";
            break;
          default:
            if (a1 == 458753)
            {
              result = "PrecisionFindingFindee";
            }
            else
            {
              if (a1 != 458754)
                return "?";
              result = "PrecisionFindingFindeeHighPriority";
            }
            break;
        }
      }
      else
      {
        switch(a1)
        {
          case 393216:
            result = "CaptiveNetworkJoin";
            break;
          case 393217:
            result = "UseCaseSIMTransfer";
            break;
          case 393218:
            result = "MacSetup";
            break;
          case 393219:
            result = "AppleIDSignIn";
            break;
          case 393220:
            result = "AppleIDSignInSettings";
            break;
          default:
            if (a1 == 327680)
            {
              result = "RapportThirdParty";
            }
            else
            {
              if (a1 != 458752)
                return "?";
              result = "PrecisionFindingFinder";
            }
            break;
        }
      }
    }
    else
    {
      switch(a1)
      {
        case 131072:
          return "SharingDefault";
        case 131073:
          return "SharingPhoneAutoUnlock";
        case 131074:
          return "SharingSiriWatchAuth";
        case 131075:
          return "SharingMacAutoUnlock";
        case 131076:
          return "SharingEDTScreenOn";
        case 131077:
          return "SharingEDTWiFiDisabled";
        case 131078:
          return "SharingEDTWombatEligibleAsDefaultCamera";
        case 131079:
          return "SharingEDTWombatCameraPicker";
        case 131080:
          return "SharingWombatBackground";
        case 131081:
          return "SharingUniversalControl";
        case 131082:
          return "SharingPeopleProximity";
        case 131083:
          return "SharingEDTEnsembleOpenDisplayPrefs";
        case 131084:
          return "SharingEDTNearbydMotionStopped";
        case 131085:
          return "SharingDoubleBoostGenericScan";
        case 131086:
          return "SharingEDTIncomingAdvertisement ";
        case 131087:
          return "SharingEDTWombatStreamStart";
        case 131088:
          return "SharingOYAutoUnlock";
        case 131089:
          return "?";
        case 131090:
          return "SharingAirDrop";
        case 131091:
          return "SharingNearbyInvitationHost";
        case 131092:
          return "SharingNearbyInvitationParticipant";
        case 131093:
          return "SharingAirDropAskToAirDrop";
        case 131094:
          return "SharingAirDropTempIdentity";
        case 131095:
          return "SharingAirDropNeedsCLink";
        case 131096:
          return "SharingRemoteWidgetUpdate";
        case 131097:
          return "SharingCountryCodeUpdate";
        case 131098:
          return "SharingMacPhoneAutoUnlock";
        case 131099:
          return "SharingVisionProDiscovery";
        case 131100:
          return "SharingVisionProStateChange";
        case 131101:
          return "SharingContinuityScreen";
        case 131102:
          return "SharingEDTRemoteDisplay";
        default:
          if (a1 == 196608)
          {
            result = "DigitalIDTSA";
          }
          else
          {
            if (a1 != 0x40000)
              return "?";
            result = "DigitalCarKeyThirdParty";
          }
          break;
      }
    }
  }
  else
  {
    result = "Unspecified";
    switch(a1)
    {
      case 0:
        return result;
      case 1:
        result = "HealthKit";
        break;
      case 2:
        result = "HomeKit";
        break;
      case 3:
        result = "FindMyObjectConnection";
        break;
      case 4:
        result = "FindMyObjectConnectionTransient";
        break;
      case 5:
        result = "MIDI";
        break;
      case 6:
        result = "Continuity";
        break;
      case 7:
        result = "InstantHotSpot";
        break;
      case 8:
        result = "NearBy";
        break;
      case 9:
        result = "Sharing";
        break;
      case 10:
        result = "HearingSupport";
        break;
      case 11:
        result = "Magnet";
        break;
      case 12:
        result = "HID";
        break;
      case 13:
        result = "LEA";
        break;
      case 14:
        result = "External";
        break;
      case 15:
        result = "ExternalMedical";
        break;
      case 16:
        result = "ExternalLock";
        break;
      case 17:
        result = "ExternalWatch";
        break;
      case 18:
        result = "SmartRouting";
        break;
      case 19:
        result = "DigitalID";
        break;
      case 20:
        result = "DigitalKey";
        break;
      case 21:
        result = "DigitalCarKey";
        break;
      case 22:
        result = "HeySiri";
        break;
      case 23:
        result = "ThirdPartyApp";
        break;
      case 24:
        result = "CNJ";
        break;
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
      case 47:
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      case 58:
      case 59:
      case 60:
      case 61:
      case 62:
      case 63:
      case 64:
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 90:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 96:
      case 97:
      case 98:
      case 99:
      case 100:
      case 101:
      case 102:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 108:
      case 109:
      case 110:
      case 111:
      case 112:
      case 113:
      case 114:
      case 115:
      case 116:
      case 117:
      case 118:
      case 119:
      case 120:
      case 121:
      case 122:
      case 123:
      case 124:
      case 125:
      case 126:
      case 127:
      case 128:
      case 129:
      case 130:
      case 131:
      case 132:
      case 133:
      case 134:
      case 135:
      case 136:
      case 137:
      case 138:
      case 139:
      case 140:
      case 141:
      case 142:
      case 143:
      case 144:
      case 145:
      case 146:
      case 147:
      case 148:
      case 149:
      case 150:
      case 151:
      case 152:
      case 153:
      case 154:
      case 155:
      case 156:
      case 157:
      case 158:
      case 159:
      case 160:
      case 161:
      case 162:
      case 163:
      case 164:
      case 165:
      case 166:
      case 167:
      case 168:
      case 169:
      case 170:
      case 171:
      case 172:
      case 173:
      case 174:
      case 175:
      case 176:
      case 177:
      case 178:
      case 179:
      case 180:
      case 181:
      case 182:
      case 183:
      case 184:
      case 185:
      case 186:
      case 187:
      case 188:
      case 189:
      case 190:
      case 191:
      case 192:
      case 193:
      case 194:
      case 195:
      case 196:
      case 197:
      case 198:
      case 199:
      case 200:
      case 201:
      case 202:
      case 203:
      case 204:
      case 205:
      case 206:
      case 207:
      case 208:
      case 209:
      case 210:
      case 211:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 220:
      case 221:
      case 222:
      case 223:
      case 224:
      case 225:
      case 226:
      case 227:
      case 228:
      case 229:
      case 230:
      case 231:
      case 232:
      case 233:
      case 234:
      case 235:
      case 236:
      case 237:
      case 238:
      case 239:
      case 240:
      case 241:
      case 242:
      case 243:
      case 244:
      case 245:
      case 246:
      case 247:
      case 248:
      case 249:
      case 250:
      case 251:
      case 252:
      case 253:
      case 254:
      case 255:
      case 261:
      case 262:
        return "?";
      case 256:
        result = "DevicePresenceDetection";
        break;
      case 257:
        result = "AudioBox";
        break;
      case 258:
        result = "SIMTransfer";
        break;
      case 259:
        result = "ProximityScreenOnLeechScan";
        break;
      case 260:
        result = "MacMigrate";
        break;
      case 263:
        result = "HIDUARTService";
        break;
      case 264:
        result = "AccessibilitySwitchControlPairing";
        break;
      case 265:
        result = "BaseBandFastConnect";
        break;
      case 266:
        result = "SafetyAlerts";
        break;
      case 267:
        result = "LECarPlay";
        break;
      case 268:
        result = "TCCBluetooth";
        break;
      case 269:
        result = "AOPBufferLeech";
        break;
      default:
        switch(a1)
        {
          case 65536:
            result = "FindMyAction";
            break;
          case 65537:
            result = "FindMyBackground";
            break;
          case 65538:
            result = "FindMyActionHELE";
            break;
          case 65539:
            result = "FindMyBackgroundHELE";
            break;
          case 65540:
            result = "FindMyActionTransient";
            break;
          case 65541:
            result = "FindMyBackgroundTransient";
            break;
          case 65542:
            result = "FindMyActionHELETransient";
            break;
          case 65543:
            result = "FindMyBackgroundHELETransient";
            break;
          case 65544:
            result = "FindMyNotOptedIn";
            break;
          case 65545:
            result = "FindMyOptedIn";
            break;
          case 65546:
            result = "FindMySepAlertsEnabled";
            break;
          case 65547:
            result = "FindMyTemporaryAggressiveLegacy";
            break;
          case 65548:
            result = "FindMyTemporaryLongAggressive";
            break;
          case 65549:
            result = "FindMyBTFindingUserInitiated";
            break;
          case 65550:
            result = "FindMyHELE";
            break;
          case 65551:
            result = "FindMyBeaconOnDemand";
            break;
          case 65552:
            result = "FindMyWildTimedScan";
            break;
          case 65553:
            result = "FindMyBackgroundLeechScan";
            break;
          case 65554:
            result = "FindMySnifferMode";
            break;
          case 65555:
            result = "FindMyUnpair";
            break;
          case 65556:
            result = "FindMyUnpairHELE";
            break;
          case 65557:
            result = "FindMyPlaySound";
            break;
          case 65558:
            result = "FindMyPlaySoundHELE";
            break;
          case 65559:
            result = "FindMyNotOptedInBeepOnMoveWaking";
            break;
          case 65560:
            result = "FindMyUTTransient";
            break;
          case 65561:
            result = "FindMyUTHELETransient";
            break;
          default:
            return "?";
        }
        break;
    }
  }
  return result;
}

const char *CBNearbyActionTypeToString(unsigned int a1)
{
  if (a1 > 0x55)
    return "?";
  else
    return off_1E53FFFD0[(char)a1];
}

void sub_1A82D6E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82D75B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1A82DEB70(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A82DEDF0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A82DF0DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A82DFCF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  (*(void (**)(uint64_t))(v26 + 16))(v26);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1A82DFFE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82DFFF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

uint64_t CBProductIDFromNSString(void *a1)
{
  uint64_t result;
  const char *v2;
  const char *v3;
  _BOOL4 v4;
  unsigned int v5;
  const char *v6;
  unsigned int v8;
  int v9;
  unsigned int v10;

  result = objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  if (result)
  {
    v2 = (const char *)result;
    if (!strcmp((const char *)result, "AirPods1,1"))
    {
      return 8194;
    }
    else if (!strcmp(v2, "AirPods1,3"))
    {
      return 8207;
    }
    else if (!strcmp(v2, "AirPodsPro1,1"))
    {
      return 8206;
    }
    else if (!strcmp(v2, "AppleTV5,3"))
    {
      return 28420;
    }
    else if (!strcmp(v2, "AppleTV6,2"))
    {
      return 28936;
    }
    else if (!strcmp(v2, "AppleTV11,2"))
    {
      return 29455;
    }
    else if (!strcmp(v2, "ATVRemote1,1"))
    {
      return 614;
    }
    else if (!strcmp(v2, "ATVRemote1,2"))
    {
      return 621;
    }
    else if (!strcmp(v2, "AudioAccessory1,1"))
    {
      return 28943;
    }
    else if (!strcmp(v2, "AudioAccessory1,2"))
    {
      return 28944;
    }
    else if (!strcmp(v2, "AudioAccessory5,1"))
    {
      return 29715;
    }
    else if (!strcmp(v2, "BeatsSolo3,1"))
    {
      return 8198;
    }
    else if (!strcmp(v2, "BeatsSoloPro1,1"))
    {
      return 8204;
    }
    else if (!strcmp(v2, "BeatsStudio3,2"))
    {
      return 8201;
    }
    else if (!strcmp(v2, "BeatsStudioPro1,1"))
    {
      return 8215;
    }
    else if (!strcmp(v2, "Device1,8230"))
    {
      return 8230;
    }
    else if (!strcmp(v2, "Device1,8229"))
    {
      return 8229;
    }
    else if (!strcmp(v2, "Device1,8218"))
    {
      return 8218;
    }
    else if (!strcmp(v2, "BeatsX1,1"))
    {
      return 8197;
    }
    else if (!strcmp(v2, "PowerBeats3,1"))
    {
      return 8195;
    }
    else if (!strcmp(v2, "Powerbeats4,1"))
    {
      return 8205;
    }
    else if (!strcmp(v2, "PowerbeatsPro1,1"))
    {
      return 8203;
    }
    else if (!strcmp(v2, "BeatsStudioBuds1,1"))
    {
      return 8209;
    }
    else if (!strcmp(v2, "BeatsStudioBuds1,2"))
    {
      return 8214;
    }
    else if (!strcmp(v2, "ApGn"))
    {
      return 65534;
    }
    else if (!strcmp(v2, "HeGn"))
    {
      return 65533;
    }
    else
    {
      v10 = 0;
      if (sscanf(v2, "Device1,%u", &v10) != 1 || (v8 = v10) == 0 || (v3 = CBProductIDToString(v10), !strcmp(v3, "?")))
      {
        v9 = 0;
        v4 = sscanf(v2, "BTHeadphones%u,%u", &v9, &v10) == 2
          || sscanf(v2, "BTHeadset%u,%u", &v9, &v10) == 2
          || sscanf(v2, "BTSpeaker%u,%u", &v9, &v10) == 2;
        v8 = 0;
        if (v4 && v9 == 76)
        {
          v5 = v10;
          if (v10)
          {
            v6 = CBProductIDToString(v10);
            if (!strcmp(v6, "?"))
              return 0;
            else
              return v5;
          }
        }
      }
      return v8;
    }
  }
  return result;
}

const char *CBProductIDToString(int a1)
{
  const char *result;

  if (a1 > 21759)
  {
    if (a1 <= 28943)
    {
      if (a1 > 28935)
      {
        if (a1 == 28936)
          return "AppleTV6,2";
        if (a1 == 28943)
          return "AudioAccessory1,1";
      }
      else
      {
        if (a1 == 21760)
          return "Device1,21760";
        if (a1 == 28420)
          return "AppleTV5,3";
      }
    }
    else if (a1 <= 29714)
    {
      if (a1 == 28944)
        return "AudioAccessory1,2";
      if (a1 == 29455)
        return "AppleTV11,2";
    }
    else
    {
      switch(a1)
      {
        case 29715:
          return "AudioAccessory5,1";
        case 65533:
          return "HeGn";
        case 65534:
          return "ApGn";
      }
    }
    return "?";
  }
  switch(a1)
  {
    case 8194:
      return "AirPods1,1";
    case 8195:
      return "PowerBeats3,1";
    case 8196:
    case 8199:
    case 8200:
    case 8225:
    case 8226:
    case 8227:
      return "?";
    case 8197:
      return "BeatsX1,1";
    case 8198:
      return "BeatsSolo3,1";
    case 8201:
      return "BeatsStudio3,2";
    case 8202:
      return "Device1,8202";
    case 8203:
      return "PowerbeatsPro1,1";
    case 8204:
      return "BeatsSoloPro1,1";
    case 8205:
      return "Powerbeats4,1";
    case 8206:
      return "AirPodsPro1,1";
    case 8207:
      return "AirPods1,3";
    case 8208:
      return "Device1,8208";
    case 8209:
      return "BeatsStudioBuds1,1";
    case 8210:
      return "Device1,8210";
    case 8211:
      return "Device1,8211";
    case 8212:
      return "Device1,8212";
    case 8213:
      return "Device1,8213";
    case 8214:
      return "BeatsStudioBuds1,2";
    case 8215:
      return "BeatsStudioPro1,1";
    case 8216:
      return "Device1,8216";
    case 8217:
      return "Device1,8217";
    case 8218:
      return "Device1,8218";
    case 8219:
      return "Device1,8219";
    case 8220:
      return "Device1,8220";
    case 8221:
      return "Device1,8221";
    case 8222:
      return "Device1,8222";
    case 8223:
      return "Device1,8223";
    case 8224:
      return "Device1,8224";
    case 8228:
      return "Device1,8228";
    case 8229:
      return "Device1,8229";
    case 8230:
      return "Device1,8230";
    default:
      if (a1 == 614)
      {
        result = "ATVRemote1,1";
      }
      else
      {
        if (a1 != 621)
          return "?";
        result = "ATVRemote1,2";
      }
      break;
  }
  return result;
}

const char *CBDeviceTypeToString(unsigned int a1)
{
  if (a1 > 0x33)
    return "?";
  else
    return off_1E5401920[(char)a1];
}

uint64_t CBDeviceFlagsToString()
{
  return CUPrintFlags64();
}

uint64_t CBServiceFlagsToString()
{
  return CUPrintFlags64();
}

uint64_t CBDiscoveryTypeFromCString(const char *a1)
{
  if (!strcmp(a1, "AirDrop"))
    return 1;
  if (!strcmp(a1, "FieldDiagnostics"))
    return 2;
  if (!strcmp(a1, "iBeacon"))
    return 3;
  if (!strcmp(a1, "NearbyInfoV2"))
    return 4;
  if (!strcmp(a1, "AUAction"))
    return 6;
  if (!strcmp(a1, "AirPrint"))
    return 7;
  if (!strcmp(a1, "MacSetup"))
    return 8;
  if (!strcmp(a1, "MacMigrate"))
    return 9;
  if (!strcmp(a1, "SIMTransfer2"))
    return 5;
  if (!strcmp(a1, "AcceptedInvitation"))
    return 10;
  if (!strcmp(a1, "ADPDBuffer"))
    return 11;
  if (!strcmp(a1, "DockKitAccessory"))
    return 12;
  if (!strcmp(a1, "AppleIDSignIn"))
    return 13;
  if (!strcmp(a1, "FindMyAccessory"))
    return 14;
  if (!strcmp(a1, "NearbyActionNoWake"))
    return 15;
  if (!strcmp(a1, "PrecisionFinding"))
    return 16;
  if (!strcmp(a1, "ADPD"))
    return 18;
  if (!strcmp(a1, "MiLo"))
    return 19;
  if (!strcmp(a1, "NearbyInfoV2Invitation"))
    return 21;
  if (!strcmp(a1, "OSUpdate"))
    return 22;
  if (!strcmp(a1, "WatchSetup"))
    return 23;
  if (!strcmp(a1, "OSRecoveryExtended"))
    return 24;
  if (!strcmp(a1, "AllBuffer"))
    return 25;
  if (!strcmp(a1, "SafetyAlerts"))
    return 26;
  if (!strcmp(a1, "GenericServiceUUIDs"))
    return 27;
  if (!strcmp(a1, "ProximityPairingBuffer"))
    return 29;
  return 0;
}

void *CBDiscoveryTypesNearbyActionNoWake()
{
  if (qword_1ECF9A1B0 != -1)
    dispatch_once(&qword_1ECF9A1B0, &__block_literal_global_198);
  return &unk_1ECF9A170;
}

void *CBDiscoveryTypesProximityService()
{
  if (qword_1ECF9A1D8 != -1)
    dispatch_once(&qword_1ECF9A1D8, &__block_literal_global_203);
  return &unk_1ECF9A184;
}

char *CBDiscoveryTypesRemoveTypesAndReportChanges(char *result, char *a2, _BYTE *a3)
{
  char v3;
  char v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;

  v3 = *a2;
  v4 = *result;
  *result &= ~*a2;
  *a3 |= v4 & v3;
  v5 = a2[1];
  v6 = result[1];
  result[1] = v6 & ~v5;
  a3[1] |= v6 & v5;
  v7 = a2[2];
  v8 = result[2];
  result[2] = v8 & ~v7;
  a3[2] |= v8 & v7;
  v9 = a2[3];
  v10 = result[3];
  result[3] = v10 & ~v9;
  a3[3] |= v10 & v9;
  return result;
}

__CFString *CBDiscoveryTypesToString(uint64_t a1)
{
  id v2;
  char **v3;
  char *v4;
  int v5;
  id v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;

  CUAppendF();
  v2 = 0;
  v3 = &off_1E5401530;
  do
  {
    v5 = *((_DWORD *)v3 - 4);
    if ((v5 - 30) >= 0xFFFFFFE3
      && ((*(unsigned __int8 *)(a1 + ((unint64_t)(v5 - 1) >> 3)) >> (-(char)v5 & 7)) & 1) != 0)
    {
      CUAppendF();
      v6 = v2;

      v2 = v6;
    }
    v4 = *v3;
    v3 += 3;
  }
  while (v4);
  CUAppendF();
  v7 = (__CFString *)v2;

  v8 = &stru_1E5403C08;
  if (v7)
    v8 = v7;
  v9 = v8;

  return v9;
}

__CFString *CBDiscoveryTypesEnumToString(uint64_t a1)
{
  id v2;
  char **v3;
  char *v4;
  int v5;
  id v6;
  __CFString *v7;
  __CFString *v8;
  __CFString *v9;

  CUAppendF();
  v2 = 0;
  v3 = &off_1E5401530;
  do
  {
    v5 = *((_DWORD *)v3 - 4);
    if ((v5 - 30) >= 0xFFFFFFE3
      && ((*(unsigned __int8 *)(a1 + ((unint64_t)(v5 - 1) >> 3)) >> (-(char)v5 & 7)) & 1) != 0)
    {
      CUAppendF();
      v6 = v2;

      v2 = v6;
    }
    v4 = *v3;
    v3 += 3;
  }
  while (v4);
  CUAppendF();
  v7 = (__CFString *)v2;

  v8 = &stru_1E5403C08;
  if (v7)
    v8 = v7;
  v9 = v8;

  return v9;
}

id CBErrorF(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v10, &a9);
  v12 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v16 = CFSTR("cuErrorMsg");
  v17[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("CBErrorDomain"), a1, v13);

  return v14;
}

uint64_t CBUseCaseFromString(const char *a1)
{
  if (!strcasecmp(a1, "HealthKit"))
    return 1;
  if (!strcasecmp(a1, "HomeKit"))
    return 2;
  if (!strcasecmp(a1, "FindMyObjectConnection"))
    return 3;
  if (!strcasecmp(a1, "FindMyObjectConnectionTransient"))
    return 4;
  if (!strcasecmp(a1, "MIDI"))
    return 5;
  if (!strcasecmp(a1, "Continuity"))
    return 6;
  if (!strcasecmp(a1, "InstantHotSpot"))
    return 7;
  if (!strcasecmp(a1, "NearBy"))
    return 8;
  if (!strcasecmp(a1, "Sharing"))
    return 9;
  if (!strcasecmp(a1, "HearingSupport"))
    return 10;
  if (!strcasecmp(a1, "Magnet"))
    return 11;
  if (!strcasecmp(a1, "HID"))
    return 12;
  if (!strcasecmp(a1, "LEA"))
    return 13;
  if (!strcasecmp(a1, "External"))
    return 14;
  if (!strcasecmp(a1, "ExternalMedical"))
    return 15;
  if (!strcasecmp(a1, "ExternalLock"))
    return 16;
  if (!strcasecmp(a1, "ExternalWatch"))
    return 17;
  if (!strcasecmp(a1, "SmartRouting"))
    return 18;
  if (!strcasecmp(a1, "DigitalID"))
    return 19;
  if (!strcasecmp(a1, "DigitalKey"))
    return 20;
  if (!strcasecmp(a1, "DigitalCarKey"))
    return 21;
  if (!strcasecmp(a1, "DigitalCarKeyThirdParty"))
    return 0x40000;
  if (!strcasecmp(a1, "HeySiri"))
    return 22;
  if (!strcasecmp(a1, "ThirdPartyApp"))
    return 23;
  if (!strcasecmp(a1, "CNJ"))
    return 24;
  if (!strcasecmp(a1, "DevicePresenceDetection"))
    return 256;
  if (!strcasecmp(a1, "AudioBox"))
    return 257;
  if (!strcasecmp(a1, "SIMTransfer") || !strcasecmp(a1, "SIMTransfer2"))
    return 258;
  if (!strcasecmp(a1, "ProximityScreenOnLeechScan"))
    return 259;
  if (!strcasecmp(a1, "MacMigrate"))
    return 260;
  if (!strcasecmp(a1, "HIDUARTService"))
    return 263;
  if (!strcasecmp(a1, "AccessibilitySwitchControlPairing"))
    return 264;
  if (!strcasecmp(a1, "BaseBandFastConnect"))
    return 265;
  if (!strcasecmp(a1, "SafetyAlerts"))
    return 266;
  if (!strcasecmp(a1, "LECarPlay"))
    return 267;
  if (!strcasecmp(a1, "TCCBluetooth"))
    return 268;
  if (!strcasecmp(a1, "AOPBufferLeech"))
    return 269;
  if (!strcasecmp(a1, "FindMyAction"))
    return 0x10000;
  if (!strcasecmp(a1, "FindMyBackground"))
    return 65537;
  if (!strcasecmp(a1, "FindMyActionHELE"))
    return 65538;
  if (!strcasecmp(a1, "FindMyBackgroundHELE"))
    return 65539;
  if (!strcasecmp(a1, "FindMyActionTransient"))
    return 65540;
  if (!strcasecmp(a1, "FindMyBackgroundTransient"))
    return 65541;
  if (!strcasecmp(a1, "FindMyActionHELETransient"))
    return 65542;
  if (!strcasecmp(a1, "FindMyBackgroundHELETransient"))
    return 65543;
  if (!strcasecmp(a1, "FindMyNotOptedIn"))
    return 65544;
  if (!strcasecmp(a1, "FindMyOptedIn"))
    return 65545;
  if (!strcasecmp(a1, "FindMySepAlertsEnabled"))
    return 65546;
  if (!strcasecmp(a1, "FindMyTemporaryAggressiveLegacy"))
    return 65547;
  if (!strcasecmp(a1, "FindMyTemporaryLongAggressive"))
    return 65548;
  if (!strcasecmp(a1, "FindMyBTFindingUserInitiated"))
    return 65549;
  if (!strcasecmp(a1, "FindMyHELE"))
    return 65550;
  if (!strcasecmp(a1, "FindMyBeaconOnDemand"))
    return 65551;
  if (!strcasecmp(a1, "FindMyWildTimedScan"))
    return 65552;
  if (!strcasecmp(a1, "FindMyBackgroundLeechScan"))
    return 65553;
  if (!strcasecmp(a1, "FindMySnifferMode"))
    return 65554;
  if (!strcasecmp(a1, "FindMyUnpair"))
    return 65555;
  if (!strcasecmp(a1, "FindMyUnpairHELE"))
    return 65556;
  if (!strcasecmp(a1, "FindMyPlaySound"))
    return 65557;
  if (!strcasecmp(a1, "FindMyPlaySoundHELE"))
    return 65558;
  if (!strcasecmp(a1, "FindMyNotOptedInBeepOnMoveWaking"))
    return 65559;
  if (!strcasecmp(a1, "FindMyUTTransient"))
    return 65560;
  if (!strcasecmp(a1, "FindMyUTHELETransient"))
    return 65561;
  if (!strcasecmp(a1, "SharingDefault"))
    return 0x20000;
  if (!strcasecmp(a1, "SharingPhoneAutoUnlock"))
    return 131073;
  if (!strcasecmp(a1, "SharingSiriWatchAuth"))
    return 131074;
  if (!strcasecmp(a1, "SharingMacAutoUnlock"))
    return 131075;
  if (!strcasecmp(a1, "SharingEDTScreenOn"))
    return 131076;
  if (!strcasecmp(a1, "SharingEDTWiFiDisabled"))
    return 131077;
  if (!strcasecmp(a1, "SharingEDTWombatEligibleAsDefaultCamera"))
    return 131078;
  if (!strcasecmp(a1, "SharingEDTWombatCameraPicker"))
    return 131079;
  if (!strcasecmp(a1, "SharingWombatBackground"))
    return 131080;
  if (!strcasecmp(a1, "SharingUniversalControl"))
    return 131081;
  if (!strcasecmp(a1, "SharingPeopleProximity"))
    return 131082;
  if (!strcasecmp(a1, "SharingEDTEnsembleOpenDisplayPrefs"))
    return 131083;
  if (!strcasecmp(a1, "SharingEDTNearbydMotionStopped"))
    return 131084;
  if (!strcasecmp(a1, "SharingDoubleBoostGenericScan"))
    return 131085;
  if (!strcasecmp(a1, "SharingEDTIncomingAdvertisement"))
    return 131086;
  if (!strcasecmp(a1, "SharingEDTWombatStreamStart"))
    return 131087;
  if (!strcasecmp(a1, "SharingOYAutoUnlock"))
    return 131088;
  if (!strcasecmp(a1, "SharingAirDrop"))
    return 131090;
  if (!strcasecmp(a1, "SharingNearbyInvitationHost"))
    return 131091;
  if (!strcasecmp(a1, "SharingNearbyInvitationParticipant"))
    return 131092;
  if (!strcasecmp(a1, "SharingAirDropAskToAirDrop"))
    return 131093;
  if (!strcasecmp(a1, "SharingAirDropTempIdentity"))
    return 131094;
  if (!strcasecmp(a1, "SharingAirDropNeedsCLink"))
    return 131095;
  if (!strcasecmp(a1, "SharingRemoteWidgetUpdate"))
    return 131096;
  if (!strcasecmp(a1, "SharingCountryCodeUpdate"))
    return 131097;
  if (!strcasecmp(a1, "SharingMacPhoneAutoUnlock"))
    return 131098;
  if (!strcasecmp(a1, "SharingVisionProDiscovery"))
    return 131099;
  if (!strcasecmp(a1, "SharingVisionProStateChange"))
    return 131100;
  if (!strcasecmp(a1, "SharingContinuityScreen"))
    return 131101;
  if (!strcasecmp(a1, "SharingEDTRemoteDisplay"))
    return 131102;
  if (!strcasecmp(a1, "DigitalIDTSA"))
    return 196608;
  if (!strcasecmp(a1, "RapportThirdParty"))
    return 327680;
  if (!strcasecmp(a1, "CaptiveNetworkJoin"))
    return 393216;
  if (!strcasecmp(a1, "UseCaseSIMTransfer"))
    return 393217;
  if (!strcasecmp(a1, "MacSetup"))
    return 393218;
  if (!strcasecmp(a1, "AppleIDSignIn"))
    return 393219;
  if (!strcasecmp(a1, "AppleIDSignInSettings"))
    return 393220;
  if (!strcasecmp(a1, "PrecisionFindingFinder"))
    return 458752;
  if (!strcasecmp(a1, "PrecisionFindingFindee"))
    return 458753;
  if (!strcasecmp(a1, "PrecisionFindingFindeeHighPriority"))
    return 458754;
  if (!strcasecmp(a1, "ADPD"))
    return 0x80000;
  if (!strcasecmp(a1, "ADPDBuffer"))
    return 524289;
  if (!strcasecmp(a1, "MicroLocation"))
    return 524290;
  if (!strcasecmp(a1, "MicroLocationLeech"))
    return 524291;
  if (!strcasecmp(a1, "FindNearbyRemote"))
    return 589824;
  if (!strcasecmp(a1, "FindNearbyPencil"))
    return 589825;
  if (!strcasecmp(a1, "AccessDigitalHomeKey"))
    return 655360;
  if (!strcasecmp(a1, "InternalTestNoLockScan"))
    return 2147418112;
  if (!strcasecmp(a1, "InternalTestNoScreenOffScan"))
    return 2147418113;
  if (!strcasecmp(a1, "InternalTestScanWithNoDups"))
    return 2147418114;
  if (!strcasecmp(a1, "InternalTestScanWithDups"))
    return 2147418115;
  if (!strcasecmp(a1, "InternalTestScanFor20Seconds"))
    return 2147418116;
  if (!strcasecmp(a1, "InternalTestActiveScan"))
    return 2147418117;
  if (!strcasecmp(a1, "InternalTestUUIDScan"))
    return 2147418118;
  if (!strcasecmp(a1, "InternalTestScanFor10ClockSeconds"))
    return 2147418119;
  if (!strcasecmp(a1, "InternalTestScanBoost"))
    return 2147418120;
  return 0;
}

unint64_t CBUTF8Truncate(uint64_t a1, unint64_t a2, unint64_t a3)
{
  char v3;
  int v4;
  unint64_t v5;
  unsigned int v6;

  if (a2 <= a3)
    return a2;
  if (a2 - a3 < 2)
  {
    v3 = -80;
    if (!a3)
      goto LABEL_11;
  }
  else
  {
    v3 = *(_BYTE *)(a3 + a1 + 1);
    if (!a3)
      goto LABEL_11;
  }
  v4 = *(unsigned __int8 *)(a1 + a3);
  do
  {
    if ((v4 & 0xC0) != 0x80 && (v4 != 237 || (v3 & 0xF0) != 0xB0))
      break;
    v3 = v4;
    v4 = *(unsigned __int8 *)(a1 - 1 + a3--);
  }
  while (a3);
LABEL_11:
  while (a3)
  {
    v5 = a3 - 1;
    v6 = *(unsigned __int8 *)(a1 - 1 + a3--);
    if (v6 >= 0x21)
      return v5 + 1;
  }
  return 0;
}

uint64_t CBLTV8GetNext(unint64_t a1, unsigned __int8 *a2, _BYTE *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6)
{
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  uint64_t result;

  if ((unsigned __int8 *)a1 == a2)
    return 4294960531;
  if ((uint64_t)&a2[-a1] < 1)
    return 4294960591;
  v6 = *(unsigned __int8 *)a1;
  if ((unint64_t)&a2[~a1] < v6)
    return 4294960546;
  if (!*(_BYTE *)a1)
    return 4294960554;
  v7 = (unsigned __int8 *)(a1 + 2);
  *a3 = *(_BYTE *)(a1 + 1);
  *a4 = a1 + 2;
  v8 = (v6 - 1);
  *a5 = v8;
  result = 0;
  if (a6)
    *a6 = &v7[v8];
  return result;
}

uint64_t CBLTV8GetWithType(unint64_t a1, unsigned __int8 *a2, int a3, unsigned __int8 **a4, _QWORD *a5)
{
  unint64_t v5;
  unsigned __int8 *v6;
  int v7;
  uint64_t v8;
  uint64_t result;

  if ((unsigned __int8 *)a1 == a2)
    return 4294960531;
  do
  {
    if ((unsigned __int8 *)a1 == a2)
      return 4294960569;
    if ((uint64_t)&a2[-a1] < 1)
      return 4294960591;
    v5 = *(unsigned __int8 *)a1;
    if ((unint64_t)&a2[~a1] < v5)
      return 4294960546;
    if (!*(_BYTE *)a1)
      return 4294960554;
    v6 = (unsigned __int8 *)(a1 + 2);
    v7 = *(unsigned __int8 *)(a1 + 1);
    v8 = (v5 - 1);
    a1 += 2 + v8;
  }
  while (v7 != a3);
  if (a4)
    *a4 = v6;
  result = 0;
  if (a5)
    *a5 = v8;
  return result;
}

unint64_t CBLTV8GetSInt64(unint64_t a1, unsigned __int8 *a2, int a3, int *a4)
{
  unint64_t v4;
  unint64_t v5;
  char *v6;
  int v7;
  int v8;
  unint64_t result;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  if ((unsigned __int8 *)a1 == a2)
  {
    result = 0;
    v8 = -6765;
  }
  else
  {
    do
    {
      if ((unsigned __int8 *)a1 == a2)
      {
        result = 0;
        v8 = -6727;
        goto LABEL_19;
      }
      v4 = a1;
      if ((uint64_t)&a2[-a1] < 1)
      {
        result = 0;
        v8 = -6705;
        goto LABEL_19;
      }
      v5 = *(unsigned __int8 *)a1;
      if ((unint64_t)&a2[~a1] < v5)
      {
        result = 0;
        v8 = -6750;
        goto LABEL_19;
      }
      if (!*(_BYTE *)a1)
      {
        result = 0;
        v8 = -6742;
        goto LABEL_19;
      }
      v6 = (char *)(a1 + 2);
      v7 = *(unsigned __int8 *)(a1 + 1);
      a1 += 2 + (v5 - 1);
    }
    while (v7 != a3);
    switch((int)v5)
    {
      case 2:
        v8 = 0;
        result = *v6;
        break;
      case 3:
        v8 = 0;
        result = (__int16)(*(unsigned __int8 *)(v4 + 3) << 8) | (unint64_t)*(unsigned __int8 *)(v4 + 2);
        break;
      case 4:
        v8 = 0;
        v10 = (uint64_t)*(char *)(v4 + 4) << 16;
        goto LABEL_18;
      case 5:
        v8 = 0;
        result = *(int *)v6;
        break;
      case 6:
        v8 = 0;
        v11 = (uint64_t)*(char *)(v4 + 6) << 32;
        goto LABEL_17;
      case 7:
        v8 = 0;
        v12 = (uint64_t)*(char *)(v4 + 7) << 40;
        goto LABEL_16;
      case 8:
        v8 = 0;
        v12 = ((uint64_t)*(char *)(v4 + 8) << 48) | ((unint64_t)*(unsigned __int8 *)(v4 + 7) << 40);
LABEL_16:
        v11 = v12 | ((unint64_t)*(unsigned __int8 *)(v4 + 6) << 32);
LABEL_17:
        v10 = v11 | ((unint64_t)*(unsigned __int8 *)(v4 + 5) << 24) | ((unint64_t)*(unsigned __int8 *)(v4 + 4) << 16);
LABEL_18:
        result = v10 | ((unint64_t)*(unsigned __int8 *)(v4 + 3) << 8) | *(unsigned __int8 *)(v4 + 2);
        break;
      case 9:
        v8 = 0;
        result = *(_QWORD *)v6;
        break;
      default:
        result = 0;
        v8 = -6743;
        break;
    }
  }
LABEL_19:
  if (a4)
    *a4 = v8;
  return result;
}

unint64_t CBLTV8GetUInt64(unint64_t a1, unsigned __int8 *a2, int a3, int *a4)
{
  unint64_t v4;
  unint64_t v5;
  unsigned __int8 *v6;
  int v7;
  int v8;
  unint64_t result;

  if ((unsigned __int8 *)a1 == a2)
  {
    result = 0;
    v8 = -6765;
  }
  else
  {
    do
    {
      if ((unsigned __int8 *)a1 == a2)
      {
        result = 0;
        v8 = -6727;
        goto LABEL_17;
      }
      v4 = a1;
      if ((uint64_t)&a2[-a1] < 1)
      {
        result = 0;
        v8 = -6705;
        goto LABEL_17;
      }
      v5 = *(unsigned __int8 *)a1;
      if ((unint64_t)&a2[~a1] < v5)
      {
        result = 0;
        v8 = -6750;
        goto LABEL_17;
      }
      if (!*(_BYTE *)a1)
      {
        result = 0;
        v8 = -6742;
        goto LABEL_17;
      }
      v6 = (unsigned __int8 *)(a1 + 2);
      v7 = *(unsigned __int8 *)(a1 + 1);
      a1 += 2 + (v5 - 1);
    }
    while (v7 != a3);
    switch((int)v5)
    {
      case 2:
        v8 = 0;
        result = *v6;
        break;
      case 3:
        v8 = 0;
        result = *(unsigned __int16 *)(v4 + 2);
        break;
      case 4:
        v8 = 0;
        result = *(unsigned __int16 *)(v4 + 2) | ((unint64_t)*(unsigned __int8 *)(v4 + 4) << 16);
        break;
      case 5:
        v8 = 0;
        result = *(unsigned int *)v6;
        break;
      case 6:
        v8 = 0;
        result = *(unsigned int *)(v4 + 2) | ((unint64_t)*(unsigned __int8 *)(v4 + 6) << 32);
        break;
      case 7:
        v8 = 0;
        result = *(unsigned int *)(v4 + 2) | ((unint64_t)*(unsigned __int8 *)(v4 + 6) << 32) | ((unint64_t)*(unsigned __int8 *)(v4 + 7) << 40);
        break;
      case 8:
        v8 = 0;
        result = *(unsigned int *)(v4 + 2) | ((unint64_t)*(unsigned __int8 *)(v4 + 6) << 32) | ((unint64_t)*(unsigned __int8 *)(v4 + 7) << 40) | ((unint64_t)*(unsigned __int8 *)(v4 + 8) << 48);
        break;
      case 9:
        v8 = 0;
        result = *(_QWORD *)v6;
        break;
      default:
        result = 0;
        v8 = -6743;
        break;
    }
  }
LABEL_17:
  if (a4)
    *a4 = v8;
  return result;
}

void CBMockAddOrUpdateAdvertiser(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  os_unfair_lock_lock(&stru_1ECF9A18C);
  objc_msgSend((id)qword_1ECF9A208, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 0);
    v6 = (void *)qword_1ECF9A208;
    if (!qword_1ECF9A208)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = (void *)qword_1ECF9A208;
      qword_1ECF9A208 = (uint64_t)v7;

      v6 = (void *)qword_1ECF9A208;
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v3);
  }
  objc_msgSend(v5, "addObject:", v4);
  objc_msgSend(v4, "mockDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend((id)qword_1ECF9A210, "objectForKeyedSubscript:", v3, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "reportMockDeviceFound:", v9);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

  }
  os_unfair_lock_unlock(&stru_1ECF9A18C);

}

void CBMockRemoveAdvertiser(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
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

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  os_unfair_lock_lock(&stru_1ECF9A18C);
  objc_msgSend((id)qword_1ECF9A208, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v4) & 1) != 0)
  {
    objc_msgSend(v5, "removeObject:", v4);
    if (!objc_msgSend(v5, "count"))
      objc_msgSend((id)qword_1ECF9A208, "setObject:forKeyedSubscript:", 0, v3);
    objc_msgSend(v4, "mockDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      objc_msgSend((id)qword_1ECF9A210, "objectForKeyedSubscript:", v3, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v13;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v13 != v10)
              objc_enumerationMutation(v7);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "reportMockDeviceLost:", v6);
          }
          while (v9 != v11);
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v9);
      }

    }
    os_unfair_lock_unlock(&stru_1ECF9A18C);

  }
  else
  {
    os_unfair_lock_unlock(&stru_1ECF9A18C);
  }

}

void CBMockAddOrUpdateDiscovery(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  os_unfair_lock_lock(&stru_1ECF9A18C);
  objc_msgSend((id)qword_1ECF9A210, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 517, 0);
    v6 = (void *)qword_1ECF9A210;
    if (!qword_1ECF9A210)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = (void *)qword_1ECF9A210;
      qword_1ECF9A210 = (uint64_t)v7;

      v6 = (void *)qword_1ECF9A210;
    }
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v3);
  }
  objc_msgSend(v5, "addObject:", v4);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend((id)qword_1ECF9A208, "objectForKeyedSubscript:", v3, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13), "mockDevice");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v4, "reportMockDeviceFound:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

  os_unfair_lock_unlock(&stru_1ECF9A18C);
}

void CBMockRemoveDiscovery(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v5 = a1;
  v3 = a2;
  os_unfair_lock_lock(&stru_1ECF9A18C);
  objc_msgSend((id)qword_1ECF9A210, "objectForKeyedSubscript:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v3);

  if (!objc_msgSend(v4, "count"))
    objc_msgSend((id)qword_1ECF9A210, "setObject:forKeyedSubscript:", 0, v5);
  os_unfair_lock_unlock(&stru_1ECF9A18C);

}

id CBUserControllerXPCInterface()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  id v14;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE9A0478);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x1E0C99E60]);
  v13 = objc_opt_class();
  v12 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = (void *)objc_msgSend(v14, "initWithObjects:", v13, v12, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_appleAudioAccessoryLimitedLoggingWithCompletion_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_setAppleAudioAccessoryLimitedLogging_completion_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_getDistributedLoggingStatusWithCompletion_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_setDistributedLoggingStatus_completion_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_getCurrentUserGivenNameWithCompletion_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_getControllerInfoForDevice_completion_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_getCloudPairedDevicesWithCompletionHandler_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_getControllerInfoForDevice_completion_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_storeControllerInfo_completion_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_readPrefKeys_source_completion_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_writePrefKey_value_source_completion_, 0, 1);

  return v0;
}

id CBGetHexString(unsigned __int8 *a1, unsigned int a2)
{
  void *v4;
  uint64_t v5;
  unsigned int v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 2 * a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
  {
    v5 = a2;
    do
    {
      v6 = *a1++;
      objc_msgSend(v4, "appendFormat:", CFSTR("%02x"), v6);
      --v5;
    }
    while (v5);
  }
  return v4;
}

id CBGenerateSHA256HashedString(void *a1)
{
  const char *v1;
  CC_LONG v2;
  void *v3;
  unsigned __int8 md[16];
  __int128 v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = (const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
  *(_OWORD *)md = 0u;
  v6 = 0u;
  v2 = strlen(v1);
  if (CC_SHA256(v1, v2, md))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", 64);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), md[0]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), md[1]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), md[2]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), md[3]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), md[4]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), md[5]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), md[6]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), md[7]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), md[8]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), md[9]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), md[10]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), md[11]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), md[12]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), md[13]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), md[14]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), md[15]);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), v6);
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), BYTE1(v6));
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), BYTE2(v6));
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), BYTE3(v6));
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), BYTE4(v6));
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), BYTE5(v6));
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), BYTE6(v6));
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), BYTE7(v6));
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), BYTE8(v6));
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), BYTE9(v6));
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), BYTE10(v6));
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), BYTE11(v6));
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), BYTE12(v6));
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), BYTE13(v6));
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), BYTE14(v6));
    objc_msgSend(v3, "appendFormat:", CFSTR("%02x"), HIBYTE(v6));
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void sub_1A82F5734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  (*(void (**)(uint64_t))(v7 + 16))(v7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82F6654(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A82F678C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A82F67A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A82F68C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A82F68DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A82F6968(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

const char *CBCentralManagerConnectionLatencyToString(uint64_t a1)
{
  uint64_t v1;
  const char *result;

  v1 = a1 + 99;
  result = "Invalid";
  switch(v1)
  {
    case 0:
      return result;
    case 88:
      result = "MagnetSubrating";
      break;
    case 89:
      result = "VeryHigh";
      break;
    case 90:
      result = "Mid-Fixed";
      break;
    case 91:
      result = "Low-Fixed";
      break;
    case 92:
      result = "VeryLow";
      break;
    case 93:
      result = "PowerOptimize";
      break;
    case 94:
      result = "HomeKit";
      break;
    case 95:
      result = "Continuity";
      break;
    case 96:
      result = "MagnetUpgraded";
      break;
    case 97:
      result = "Magnet";
      break;
    case 98:
      result = "Midi";
      break;
    case 99:
      result = "Low";
      break;
    case 100:
      result = "Medium";
      break;
    case 101:
      result = "High";
      break;
    default:
      result = "?";
      break;
  }
  return result;
}

void sub_1A82FB588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82FBAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82FC790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82FE424(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  (*(void (**)(uint64_t))(v17 + 16))(v17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82FE900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82FEF94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A82FF7C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A8301A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  (*(void (**)(uint64_t))(v17 + 16))(v17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A8301AAC(_Unwind_Exception *a1, int a2)
{
  if (a2)
    objc_terminate();
  _Unwind_Resume(a1);
}

uint64_t convertToWhbMsgId(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (_MergedGlobals_2 != -1)
    dispatch_once(&_MergedGlobals_2, &__block_literal_global_4);
  v2 = (void *)MEMORY[0x1E0CB37E8];
  v3 = (id)qword_1ECF9A230;
  objc_msgSend(v2, "numberWithUnsignedShort:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_msgSend(v5, "unsignedShortValue");

    return v6;
  }
  else
  {

    return 0;
  }
}

uint64_t convertToCBMsgId(__int16 a1)
{
  id v2;
  uint64_t v3;
  _QWORD v5[5];
  __int16 v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  __int16 v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (_MergedGlobals_2 != -1)
    dispatch_once(&_MergedGlobals_2, &__block_literal_global_4);
  v2 = (id)qword_1ECF9A230;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __convertToCBMsgId_block_invoke;
  v5[3] = &unk_1E5402338;
  v6 = a1;
  v5[4] = &v7;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = *((unsigned __int16 *)v8 + 12);

  _Block_object_dispose(&v7, 8);
  return v3;
}

void sub_1A83036E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __msgConversionMap_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[35];
  _QWORD v3[36];

  v3[35] = *MEMORY[0x1E0C80C00];
  v2[0] = &unk_1E5423910;
  v2[1] = &unk_1E5423928;
  v3[0] = &unk_1E5423910;
  v3[1] = &unk_1E5423928;
  v2[2] = &unk_1E5423940;
  v2[3] = &unk_1E5423958;
  v3[2] = &unk_1E5423940;
  v3[3] = &unk_1E5423958;
  v2[4] = &unk_1E5423970;
  v2[5] = &unk_1E5423988;
  v3[4] = &unk_1E5423970;
  v3[5] = &unk_1E5423988;
  v2[6] = &unk_1E54239A0;
  v2[7] = &unk_1E54239D0;
  v3[6] = &unk_1E54239B8;
  v3[7] = &unk_1E54239E8;
  v2[8] = &unk_1E5423A00;
  v2[9] = &unk_1E5423A30;
  v3[8] = &unk_1E5423A18;
  v3[9] = &unk_1E54239D0;
  v2[10] = &unk_1E5423A48;
  v2[11] = &unk_1E5423A60;
  v3[10] = &unk_1E5423A00;
  v3[11] = &unk_1E5423A78;
  v2[12] = &unk_1E5423A90;
  v2[13] = &unk_1E5423AC0;
  v3[12] = &unk_1E5423AA8;
  v3[13] = &unk_1E5423AD8;
  v2[14] = &unk_1E5423AF0;
  v2[15] = &unk_1E5423B08;
  v3[14] = &unk_1E5423AF0;
  v3[15] = &unk_1E5423B20;
  v2[16] = &unk_1E5423B38;
  v2[17] = &unk_1E5423B68;
  v3[16] = &unk_1E5423B50;
  v3[17] = &unk_1E5423B80;
  v2[18] = &unk_1E5423B98;
  v2[19] = &unk_1E5423BC8;
  v3[18] = &unk_1E5423BB0;
  v3[19] = &unk_1E5423BE0;
  v2[20] = &unk_1E5423BF8;
  v2[21] = &unk_1E5423C10;
  v3[20] = &unk_1E5423AF0;
  v3[21] = &unk_1E5423C28;
  v2[22] = &unk_1E5423C40;
  v2[23] = &unk_1E5423C70;
  v3[22] = &unk_1E5423C58;
  v3[23] = &unk_1E5423C88;
  v2[24] = &unk_1E5423CA0;
  v2[25] = &unk_1E5423CD0;
  v3[24] = &unk_1E5423CB8;
  v3[25] = &unk_1E5423CE8;
  v2[26] = &unk_1E5423D00;
  v2[27] = &unk_1E5423D30;
  v3[26] = &unk_1E5423D18;
  v3[27] = &unk_1E5423D48;
  v2[28] = &unk_1E5423D60;
  v2[29] = &unk_1E5423D90;
  v3[28] = &unk_1E5423D78;
  v3[29] = &unk_1E5423B08;
  v2[30] = &unk_1E5423DA8;
  v2[31] = &unk_1E5423DC0;
  v3[30] = &unk_1E5423B38;
  v3[31] = &unk_1E5423DD8;
  v2[32] = &unk_1E5423DF0;
  v2[33] = &unk_1E5423E20;
  v3[32] = &unk_1E5423E08;
  v3[33] = &unk_1E5423E38;
  v2[34] = &unk_1E5423E50;
  v3[34] = &unk_1E5423E68;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 35);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECF9A230;
  qword_1ECF9A230 = v0;

}

void __convertToCBMsgId_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(a3, "unsignedShortValue") == *(unsigned __int16 *)(a1 + 40))
  {
    *(_WORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v7, "unsignedShortValue");
    *a4 = 1;
  }

}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

const char *CBUseCaseToString_0(int a1)
{
  const char *result;

  if (a1 >= 0x20000)
  {
    if (a1 >= 327680)
    {
      if (a1 >= 589824)
      {
        if (a1 <= 2147418111)
        {
          switch(a1)
          {
            case 589824:
              return "FindNearbyRemote";
            case 589825:
              return "FindNearbyPencil";
            case 655360:
              return "AccessDigitalHomeKey";
            default:
              return "?";
          }
        }
        else
        {
          switch(a1)
          {
            case 2147418112:
              result = "InternalTestNoLockScan";
              break;
            case 2147418113:
              result = "InternalTestNoScreenOffScan";
              break;
            case 2147418114:
              result = "InternalTestScanWithNoDups";
              break;
            case 2147418115:
              result = "InternalTestScanWithDups";
              break;
            case 2147418116:
              result = "InternalTestScanFor20Seconds";
              break;
            case 2147418117:
              result = "InternalTestActiveScan";
              break;
            case 2147418118:
              result = "InternalTestUUIDScan";
              break;
            case 2147418119:
              result = "InternalTestScanFor10ClockSeconds";
              break;
            case 2147418120:
              result = "InternalTestScanBoost";
              break;
            default:
              return "?";
          }
        }
      }
      else if (a1 > 458752)
      {
        switch(a1)
        {
          case 524288:
            result = "ADPD";
            break;
          case 524289:
            result = "ADPDBuffer";
            break;
          case 524290:
            result = "MicroLocation";
            break;
          case 524291:
            result = "MicroLocationLeech";
            break;
          default:
            if (a1 == 458753)
            {
              result = "PrecisionFindingFindee";
            }
            else
            {
              if (a1 != 458754)
                return "?";
              result = "PrecisionFindingFindeeHighPriority";
            }
            break;
        }
      }
      else
      {
        switch(a1)
        {
          case 393216:
            result = "CaptiveNetworkJoin";
            break;
          case 393217:
            result = "UseCaseSIMTransfer";
            break;
          case 393218:
            result = "MacSetup";
            break;
          case 393219:
            result = "AppleIDSignIn";
            break;
          case 393220:
            result = "AppleIDSignInSettings";
            break;
          default:
            if (a1 == 327680)
            {
              result = "RapportThirdParty";
            }
            else
            {
              if (a1 != 458752)
                return "?";
              result = "PrecisionFindingFinder";
            }
            break;
        }
      }
    }
    else
    {
      switch(a1)
      {
        case 131072:
          return "SharingDefault";
        case 131073:
          return "SharingPhoneAutoUnlock";
        case 131074:
          return "SharingSiriWatchAuth";
        case 131075:
          return "SharingMacAutoUnlock";
        case 131076:
          return "SharingEDTScreenOn";
        case 131077:
          return "SharingEDTWiFiDisabled";
        case 131078:
          return "SharingEDTWombatEligibleAsDefaultCamera";
        case 131079:
          return "SharingEDTWombatCameraPicker";
        case 131080:
          return "SharingWombatBackground";
        case 131081:
          return "SharingUniversalControl";
        case 131082:
          return "SharingPeopleProximity";
        case 131083:
          return "SharingEDTEnsembleOpenDisplayPrefs";
        case 131084:
          return "SharingEDTNearbydMotionStopped";
        case 131085:
          return "SharingDoubleBoostGenericScan";
        case 131086:
          return "SharingEDTIncomingAdvertisement ";
        case 131087:
          return "SharingEDTWombatStreamStart";
        case 131088:
          return "SharingOYAutoUnlock";
        case 131089:
          return "?";
        case 131090:
          return "SharingAirDrop";
        case 131091:
          return "SharingNearbyInvitationHost";
        case 131092:
          return "SharingNearbyInvitationParticipant";
        case 131093:
          return "SharingAirDropAskToAirDrop";
        case 131094:
          return "SharingAirDropTempIdentity";
        case 131095:
          return "SharingAirDropNeedsCLink";
        case 131096:
          return "SharingRemoteWidgetUpdate";
        case 131097:
          return "SharingCountryCodeUpdate";
        case 131098:
          return "SharingMacPhoneAutoUnlock";
        case 131099:
          return "SharingVisionProDiscovery";
        case 131100:
          return "SharingVisionProStateChange";
        case 131101:
          return "SharingContinuityScreen";
        case 131102:
          return "SharingEDTRemoteDisplay";
        default:
          if (a1 == 196608)
          {
            result = "DigitalIDTSA";
          }
          else
          {
            if (a1 != 0x40000)
              return "?";
            result = "DigitalCarKeyThirdParty";
          }
          break;
      }
    }
  }
  else
  {
    result = "Unspecified";
    switch(a1)
    {
      case 0:
        return result;
      case 1:
        result = "HealthKit";
        break;
      case 2:
        result = "HomeKit";
        break;
      case 3:
        result = "FindMyObjectConnection";
        break;
      case 4:
        result = "FindMyObjectConnectionTransient";
        break;
      case 5:
        result = "MIDI";
        break;
      case 6:
        result = "Continuity";
        break;
      case 7:
        result = "InstantHotSpot";
        break;
      case 8:
        result = "NearBy";
        break;
      case 9:
        result = "Sharing";
        break;
      case 10:
        result = "HearingSupport";
        break;
      case 11:
        result = "Magnet";
        break;
      case 12:
        result = "HID";
        break;
      case 13:
        result = "LEA";
        break;
      case 14:
        result = "External";
        break;
      case 15:
        result = "ExternalMedical";
        break;
      case 16:
        result = "ExternalLock";
        break;
      case 17:
        result = "ExternalWatch";
        break;
      case 18:
        result = "SmartRouting";
        break;
      case 19:
        result = "DigitalID";
        break;
      case 20:
        result = "DigitalKey";
        break;
      case 21:
        result = "DigitalCarKey";
        break;
      case 22:
        result = "HeySiri";
        break;
      case 23:
        result = "ThirdPartyApp";
        break;
      case 24:
        result = "CNJ";
        break;
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
      case 47:
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      case 58:
      case 59:
      case 60:
      case 61:
      case 62:
      case 63:
      case 64:
      case 65:
      case 66:
      case 67:
      case 68:
      case 69:
      case 70:
      case 71:
      case 72:
      case 73:
      case 74:
      case 75:
      case 76:
      case 77:
      case 78:
      case 79:
      case 80:
      case 81:
      case 82:
      case 83:
      case 84:
      case 85:
      case 86:
      case 87:
      case 88:
      case 89:
      case 90:
      case 91:
      case 92:
      case 93:
      case 94:
      case 95:
      case 96:
      case 97:
      case 98:
      case 99:
      case 100:
      case 101:
      case 102:
      case 103:
      case 104:
      case 105:
      case 106:
      case 107:
      case 108:
      case 109:
      case 110:
      case 111:
      case 112:
      case 113:
      case 114:
      case 115:
      case 116:
      case 117:
      case 118:
      case 119:
      case 120:
      case 121:
      case 122:
      case 123:
      case 124:
      case 125:
      case 126:
      case 127:
      case 128:
      case 129:
      case 130:
      case 131:
      case 132:
      case 133:
      case 134:
      case 135:
      case 136:
      case 137:
      case 138:
      case 139:
      case 140:
      case 141:
      case 142:
      case 143:
      case 144:
      case 145:
      case 146:
      case 147:
      case 148:
      case 149:
      case 150:
      case 151:
      case 152:
      case 153:
      case 154:
      case 155:
      case 156:
      case 157:
      case 158:
      case 159:
      case 160:
      case 161:
      case 162:
      case 163:
      case 164:
      case 165:
      case 166:
      case 167:
      case 168:
      case 169:
      case 170:
      case 171:
      case 172:
      case 173:
      case 174:
      case 175:
      case 176:
      case 177:
      case 178:
      case 179:
      case 180:
      case 181:
      case 182:
      case 183:
      case 184:
      case 185:
      case 186:
      case 187:
      case 188:
      case 189:
      case 190:
      case 191:
      case 192:
      case 193:
      case 194:
      case 195:
      case 196:
      case 197:
      case 198:
      case 199:
      case 200:
      case 201:
      case 202:
      case 203:
      case 204:
      case 205:
      case 206:
      case 207:
      case 208:
      case 209:
      case 210:
      case 211:
      case 212:
      case 213:
      case 214:
      case 215:
      case 216:
      case 217:
      case 218:
      case 219:
      case 220:
      case 221:
      case 222:
      case 223:
      case 224:
      case 225:
      case 226:
      case 227:
      case 228:
      case 229:
      case 230:
      case 231:
      case 232:
      case 233:
      case 234:
      case 235:
      case 236:
      case 237:
      case 238:
      case 239:
      case 240:
      case 241:
      case 242:
      case 243:
      case 244:
      case 245:
      case 246:
      case 247:
      case 248:
      case 249:
      case 250:
      case 251:
      case 252:
      case 253:
      case 254:
      case 255:
      case 261:
      case 262:
        return "?";
      case 256:
        result = "DevicePresenceDetection";
        break;
      case 257:
        result = "AudioBox";
        break;
      case 258:
        result = "SIMTransfer";
        break;
      case 259:
        result = "ProximityScreenOnLeechScan";
        break;
      case 260:
        result = "MacMigrate";
        break;
      case 263:
        result = "HIDUARTService";
        break;
      case 264:
        result = "AccessibilitySwitchControlPairing";
        break;
      case 265:
        result = "BaseBandFastConnect";
        break;
      case 266:
        result = "SafetyAlerts";
        break;
      case 267:
        result = "LECarPlay";
        break;
      case 268:
        result = "TCCBluetooth";
        break;
      case 269:
        result = "AOPBufferLeech";
        break;
      default:
        switch(a1)
        {
          case 65536:
            result = "FindMyAction";
            break;
          case 65537:
            result = "FindMyBackground";
            break;
          case 65538:
            result = "FindMyActionHELE";
            break;
          case 65539:
            result = "FindMyBackgroundHELE";
            break;
          case 65540:
            result = "FindMyActionTransient";
            break;
          case 65541:
            result = "FindMyBackgroundTransient";
            break;
          case 65542:
            result = "FindMyActionHELETransient";
            break;
          case 65543:
            result = "FindMyBackgroundHELETransient";
            break;
          case 65544:
            result = "FindMyNotOptedIn";
            break;
          case 65545:
            result = "FindMyOptedIn";
            break;
          case 65546:
            result = "FindMySepAlertsEnabled";
            break;
          case 65547:
            result = "FindMyTemporaryAggressiveLegacy";
            break;
          case 65548:
            result = "FindMyTemporaryLongAggressive";
            break;
          case 65549:
            result = "FindMyBTFindingUserInitiated";
            break;
          case 65550:
            result = "FindMyHELE";
            break;
          case 65551:
            result = "FindMyBeaconOnDemand";
            break;
          case 65552:
            result = "FindMyWildTimedScan";
            break;
          case 65553:
            result = "FindMyBackgroundLeechScan";
            break;
          case 65554:
            result = "FindMySnifferMode";
            break;
          case 65555:
            result = "FindMyUnpair";
            break;
          case 65556:
            result = "FindMyUnpairHELE";
            break;
          case 65557:
            result = "FindMyPlaySound";
            break;
          case 65558:
            result = "FindMyPlaySoundHELE";
            break;
          case 65559:
            result = "FindMyNotOptedInBeepOnMoveWaking";
            break;
          case 65560:
            result = "FindMyUTTransient";
            break;
          case 65561:
            result = "FindMyUTHELETransient";
            break;
          default:
            return "?";
        }
        break;
    }
  }
  return result;
}

void sub_1A83064E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 104), 8);
  _Unwind_Resume(a1);
}

void sub_1A830783C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A8307854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A8307BD4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A8308150(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A8308558(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A830856C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A83089F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A830ADF0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A830AE04(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A830AE18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A830AE30(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A830C118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C12C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C140(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C17C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C1A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C1B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C1CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C1E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C1F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C21C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C244(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C258(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C26C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C6D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C6E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C6FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C724(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C74C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C788(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C7A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830C888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830DC78(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A830DC8C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A830DCA0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A830DCB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A830DCCC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A830DEC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A830E24C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830E260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830E274(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830E288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830E29C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830E2B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830E2C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830E2D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830E2F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830E3FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A830E760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830E774(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830E788(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830E79C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830E7B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830E7C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830E7D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830E7EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830E800(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830E814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830E82C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A830E840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void OUTLINED_FUNCTION_1_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

_BYTE *OUTLINED_FUNCTION_2_1(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void sub_1A8311610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A8311628(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A8311640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A8311658(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const char *CBProductIDToString_0(int a1)
{
  const char *result;

  if (a1 > 21759)
  {
    if (a1 <= 28943)
    {
      if (a1 > 28935)
      {
        if (a1 == 28936)
          return "AppleTV6,2";
        if (a1 == 28943)
          return "AudioAccessory1,1";
      }
      else
      {
        if (a1 == 21760)
          return "Device1,21760";
        if (a1 == 28420)
          return "AppleTV5,3";
      }
    }
    else if (a1 <= 29714)
    {
      if (a1 == 28944)
        return "AudioAccessory1,2";
      if (a1 == 29455)
        return "AppleTV11,2";
    }
    else
    {
      switch(a1)
      {
        case 29715:
          return "AudioAccessory5,1";
        case 65533:
          return "HeGn";
        case 65534:
          return "ApGn";
      }
    }
    return "?";
  }
  if (a1 <= 8193)
  {
    switch(a1)
    {
      case 0:
        return "Invalid";
      case 614:
        return "ATVRemote1,1";
      case 621:
        return "ATVRemote1,2";
    }
    return "?";
  }
  switch(a1)
  {
    case 8194:
      result = "AirPods1,1";
      break;
    case 8195:
      result = "PowerBeats3,1";
      break;
    case 8197:
      result = "BeatsX1,1";
      break;
    case 8198:
      result = "BeatsSolo3,1";
      break;
    case 8201:
      result = "BeatsStudio3,2";
      break;
    case 8202:
      result = "Device1,8202";
      break;
    case 8203:
      result = "PowerbeatsPro1,1";
      break;
    case 8204:
      result = "BeatsSoloPro1,1";
      break;
    case 8205:
      result = "Powerbeats4,1";
      break;
    case 8206:
      result = "AirPodsPro1,1";
      break;
    case 8207:
      result = "AirPods1,3";
      break;
    case 8208:
      result = "Device1,8208";
      break;
    case 8209:
      result = "BeatsStudioBuds1,1";
      break;
    case 8210:
      result = "Device1,8210";
      break;
    case 8211:
      result = "Device1,8211";
      break;
    case 8212:
      result = "Device1,8212";
      break;
    case 8213:
      result = "Device1,8213";
      break;
    case 8214:
      result = "BeatsStudioBuds1,2";
      break;
    case 8215:
      result = "BeatsStudioPro1,1";
      break;
    case 8216:
      result = "Device1,8216";
      break;
    case 8217:
      result = "Device1,8217";
      break;
    case 8218:
      result = "Device1,8218";
      break;
    case 8219:
      result = "Device1,8219";
      break;
    case 8220:
      result = "Device1,8220";
      break;
    case 8221:
      result = "Device1,8221";
      break;
    case 8222:
      result = "Device1,8222";
      break;
    case 8223:
      result = "Device1,8223";
      break;
    case 8224:
      result = "Device1,8224";
      break;
    case 8228:
      result = "Device1,8228";
      break;
    case 8229:
      result = "Device1,8229";
      break;
    case 8230:
      result = "Device1,8230";
      break;
    default:
      return "?";
  }
  return result;
}

id CBProductIDToNSLocalizedProductNameString(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v3;
  void *v4;
  id result;
  void *v6;
  void *v7;

  if ((int)a1 > 776)
  {
    if ((int)a1 <= 8212)
    {
      switch((int)a1)
      {
        case 777:
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
          v1 = (void *)objc_claimAutoreleasedReturnValue();
          v2 = v1;
          v3 = CFSTR("apple_wireless_mouse");
          goto LABEL_4;
        case 780:
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
          v1 = (void *)objc_claimAutoreleasedReturnValue();
          v2 = v1;
          v3 = CFSTR("apple_mighty_mouse");
          goto LABEL_4;
        case 781:
LABEL_13:
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
          v1 = (void *)objc_claimAutoreleasedReturnValue();
          v2 = v1;
          v3 = CFSTR("apple_magic_mouse");
          goto LABEL_4;
        case 782:
LABEL_14:
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
          v1 = (void *)objc_claimAutoreleasedReturnValue();
          v2 = v1;
          v3 = CFSTR("apple_magic_trackpad");
          goto LABEL_4;
        default:
          goto LABEL_21;
      }
    }
    if ((_DWORD)a1 == 8220 || (_DWORD)a1 == 8216 || (_DWORD)a1 == 8213)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("apple_airpods_case");
LABEL_4:
      objc_msgSend(v1, "localizedStringForKey:value:table:", v3, &stru_1E5403C08, CFSTR("CBLocalizable"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      return v4;
    }
    else
    {
LABEL_21:
      +[CBProductInfo productInfoWithProductID:](CBProductInfo, "productInfoWithProductID:", a1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "productName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      return v7;
    }
  }
  else
  {
    switch((int)a1)
    {
      case 520:
      case 521:
      case 522:
      case 556:
      case 557:
      case 558:
      case 569:
      case 570:
      case 571:
      case 597:
      case 598:
      case 599:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
        v1 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = v1;
        v3 = CFSTR("apple_wireless_keyboard");
        goto LABEL_4;
      case 523:
      case 524:
      case 525:
      case 526:
      case 527:
      case 528:
      case 529:
      case 530:
      case 531:
      case 532:
      case 533:
      case 534:
      case 535:
      case 536:
      case 537:
      case 538:
      case 539:
      case 540:
      case 541:
      case 542:
      case 543:
      case 544:
      case 545:
      case 546:
      case 547:
      case 548:
      case 549:
      case 550:
      case 551:
      case 552:
      case 553:
      case 554:
      case 555:
      case 559:
      case 560:
      case 561:
      case 562:
      case 563:
      case 564:
      case 565:
      case 566:
      case 567:
      case 568:
      case 572:
      case 573:
      case 574:
      case 575:
      case 576:
      case 577:
      case 578:
      case 579:
      case 580:
      case 581:
      case 582:
      case 583:
      case 584:
      case 585:
      case 586:
      case 587:
      case 588:
      case 589:
      case 590:
      case 591:
      case 592:
      case 593:
      case 594:
      case 595:
      case 596:
      case 600:
      case 601:
      case 602:
      case 603:
      case 604:
      case 605:
      case 606:
      case 607:
      case 608:
      case 609:
      case 610:
      case 611:
      case 612:
      case 614:
      case 616:
      case 618:
      case 619:
      case 621:
      case 622:
      case 623:
      case 624:
      case 625:
      case 626:
      case 627:
      case 628:
      case 629:
      case 630:
      case 631:
      case 632:
      case 633:
      case 634:
      case 635:
      case 636:
      case 637:
      case 638:
      case 639:
      case 640:
      case 641:
      case 642:
      case 643:
      case 644:
      case 645:
      case 646:
      case 647:
      case 648:
      case 649:
      case 650:
      case 651:
      case 652:
      case 653:
      case 654:
      case 655:
      case 656:
      case 657:
      case 658:
      case 659:
      case 660:
      case 661:
      case 662:
      case 663:
      case 664:
      case 665:
      case 667:
      case 669:
      case 670:
        goto LABEL_21;
      case 613:
        goto LABEL_14;
      case 615:
      case 668:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
        v1 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = v1;
        v3 = CFSTR("apple_magic_keyboard");
        goto LABEL_4;
      case 617:
        goto LABEL_13;
      case 620:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
        v1 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = v1;
        v3 = CFSTR("apple_magic_keyboard_keypad");
        goto LABEL_4;
      case 666:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
        v1 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = v1;
        v3 = CFSTR("apple_magic_keyboard_touch");
        goto LABEL_4;
      case 671:
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreBluetooth"));
        v1 = (void *)objc_claimAutoreleasedReturnValue();
        v2 = v1;
        v3 = CFSTR("apple_magic_keyboard_touch_keypad");
        goto LABEL_4;
      default:
        if ((_DWORD)a1)
          goto LABEL_21;
        result = 0;
        break;
    }
  }
  return result;
}

void sub_1A8315814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  (*(void (**)(void))(a4 + 16))();
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A8315874(_Unwind_Exception *a1, int a2)
{
  if (a2)
    objc_terminate();
  _Unwind_Resume(a1);
}

void sub_1A831C0BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A831C0D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  (*(void (**)(uint64_t))(v9 + 16))(v9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A831C8B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  (*(void (**)(uint64_t))(v11 + 16))(v11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A831CC3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  (*(void (**)(uint64_t))(v13 + 16))(v13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A831F760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  (*(void (**)(uint64_t))(v17 + 16))(v17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A8321184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  (*(void (**)(void))(a11 + 16))();
  _Unwind_Resume(a1);
}

void sub_1A8323E0C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A8324D5C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(v1 + 16))(v1);
  _Block_object_dispose((const void *)(v2 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1A8325B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;

  (*(void (**)(void))(a12 + 16))();
  _Block_object_dispose((const void *)(v12 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A8326984(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A8326998(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A8326A5C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A83275CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A832786C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void CBXpcCreateNSObjectWithXpcObject_cold_1(void *a1)
{
  NSObject *v1;
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1A82A2000, v1, OS_LOG_TYPE_ERROR, "xpc_fd_dup failed: errno %d", (uint8_t *)v3, 8u);

  OUTLINED_FUNCTION_1();
}

void CBXpcCreateNSObjectWithXpcObject_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A82A2000, a2, a3, "Unknown XPC type: %p", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

uint64_t CFDictionaryGetCFDataOfLength()
{
  return MEMORY[0x1E0D1A938]();
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

uint64_t CFDictionaryGetDouble()
{
  return MEMORY[0x1E0D1A958]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x1E0D1A978]();
}

uint64_t CFDictionaryGetInt64Ranged()
{
  return MEMORY[0x1E0D1A988]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x1E0D1A998]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

uint64_t CFGetInt64Ranged()
{
  return MEMORY[0x1E0D1A9F8]();
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1E0C989D0](number);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

void CFStreamCreatePairWithSocket(CFAllocatorRef alloc, CFSocketNativeHandle sock, CFReadStreamRef *readStream, CFWriteStreamRef *writeStream)
{
  MEMORY[0x1E0C98EC8](alloc, *(_QWORD *)&sock, readStream, writeStream);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x1E0C99558](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x1E0C99568](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

uint64_t CUAppendF()
{
  return MEMORY[0x1E0D1AAF8]();
}

uint64_t CUDescriptionWithLevel()
{
  return MEMORY[0x1E0D1AB08]();
}

uint64_t CUDispatchTimerSet()
{
  return MEMORY[0x1E0D1AB10]();
}

uint64_t CUFatalErrorF()
{
  return MEMORY[0x1E0D1AB28]();
}

uint64_t CUPrintAddress()
{
  return MEMORY[0x1E0D1AB60]();
}

uint64_t CUPrintDurationDouble()
{
  return MEMORY[0x1E0D1AB80]();
}

uint64_t CUPrintErrorCode()
{
  return MEMORY[0x1E0D1AB88]();
}

uint64_t CUPrintFlags32()
{
  return MEMORY[0x1E0D1AB90]();
}

uint64_t CUPrintFlags64()
{
  return MEMORY[0x1E0D1ABA0]();
}

uint64_t CUPrintNSDataAddress()
{
  return MEMORY[0x1E0D1ABB8]();
}

uint64_t CUPrintNSDataHex()
{
  return MEMORY[0x1E0D1ABC0]();
}

uint64_t CUPrintNSError()
{
  return MEMORY[0x1E0D1ABC8]();
}

uint64_t CUPrintNSObjectMasked()
{
  return MEMORY[0x1E0D1ABE0]();
}

uint64_t CUPrintNSObjectOneLine()
{
  return MEMORY[0x1E0D1ABE8]();
}

uint64_t CUPrintNSObjectOneLineEx()
{
  return MEMORY[0x1E0D1ABF0]();
}

uint64_t CUPrintText()
{
  return MEMORY[0x1E0D1AC00]();
}

uint64_t CUPrintXPC()
{
  return MEMORY[0x1E0D1AC08]();
}

uint64_t CUXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0D1AC18]();
}

uint64_t CUXPCDecodeBool()
{
  return MEMORY[0x1E0D1AC20]();
}

uint64_t CUXPCDecodeDouble()
{
  return MEMORY[0x1E0D1AC28]();
}

uint64_t CUXPCDecodeNSArrayOfClass()
{
  return MEMORY[0x1E0D1AC30]();
}

uint64_t CUXPCDecodeNSArrayOfNSData()
{
  return MEMORY[0x1E0D1AC38]();
}

uint64_t CUXPCDecodeNSArrayOfNSString()
{
  return MEMORY[0x1E0D1AC40]();
}

uint64_t CUXPCDecodeNSData()
{
  return MEMORY[0x1E0D1AC48]();
}

uint64_t CUXPCDecodeNSDataOfLength()
{
  return MEMORY[0x1E0D1AC50]();
}

uint64_t CUXPCDecodeNSError()
{
  return MEMORY[0x1E0D1AC58]();
}

uint64_t CUXPCDecodeNSErrorIfNeeded()
{
  return MEMORY[0x1E0D1AC60]();
}

uint64_t CUXPCDecodeNSString()
{
  return MEMORY[0x1E0D1AC68]();
}

uint64_t CUXPCDecodeNSUUID()
{
  return MEMORY[0x1E0D1AC70]();
}

uint64_t CUXPCDecodeObject()
{
  return MEMORY[0x1E0D1AC78]();
}

uint64_t CUXPCDecodeSInt64RangedEx()
{
  return MEMORY[0x1E0D1AC80]();
}

uint64_t CUXPCDecodeUInt64RangedEx()
{
  return MEMORY[0x1E0D1AC88]();
}

uint64_t CUXPCEncodeNSArrayOfNSData()
{
  return MEMORY[0x1E0D1AC90]();
}

uint64_t CUXPCEncodeNSArrayOfNSString()
{
  return MEMORY[0x1E0D1AC98]();
}

uint64_t CUXPCEncodeNSArrayOfObjects()
{
  return MEMORY[0x1E0D1ACA0]();
}

uint64_t CUXPCEncodeNSError()
{
  return MEMORY[0x1E0D1ACA8]();
}

uint64_t CUXPCEncodeObject()
{
  return MEMORY[0x1E0D1ACB8]();
}

uint64_t CryptoHKDF()
{
  return MEMORY[0x1E0D1ACE8]();
}

uint64_t HardwareAddressToCString()
{
  return MEMORY[0x1E0D1AFE0]();
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return MEMORY[0x1E0CBAE10](*(_QWORD *)&service, pluginType, interfaceType, theInterface, theScore);
}

CFTypeRef IOHIDDeviceGetProperty(IOHIDDeviceRef device, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0CBAE80](device, key);
}

IOReturn IOHIDDeviceSetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, const uint8_t *report, CFIndex reportLength)
{
  return MEMORY[0x1E0CBAF18](device, *(_QWORD *)&reportType, reportID, report, reportLength);
}

IOReturn IOHIDManagerClose(IOHIDManagerRef manager, IOOptionBits options)
{
  return MEMORY[0x1E0CBB378](manager, *(_QWORD *)&options);
}

CFSetRef IOHIDManagerCopyDevices(IOHIDManagerRef manager)
{
  return (CFSetRef)MEMORY[0x1E0CBB390](manager);
}

IOHIDManagerRef IOHIDManagerCreate(CFAllocatorRef allocator, IOOptionBits options)
{
  return (IOHIDManagerRef)MEMORY[0x1E0CBB398](allocator, *(_QWORD *)&options);
}

IOReturn IOHIDManagerOpen(IOHIDManagerRef manager, IOOptionBits options)
{
  return MEMORY[0x1E0CBB3B0](manager, *(_QWORD *)&options);
}

void IOHIDManagerSetDeviceMatchingMultiple(IOHIDManagerRef manager, CFArrayRef multiple)
{
  MEMORY[0x1E0CBB400](manager, multiple);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1E0CBB660](*(_QWORD *)&iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6E8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB8F8](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1E0CBB9E8](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBB9F8](name);
}

uint64_t IsAppleInternalBuild()
{
  return MEMORY[0x1E0D1B000]();
}

uint64_t LogCategoryReplaceF()
{
  return MEMORY[0x1E0D1B058]();
}

uint64_t LogCategory_Remove()
{
  return MEMORY[0x1E0D1B060]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x1E0D1B090]();
}

uint64_t LogPrintF_safe()
{
  return MEMORY[0x1E0D1B0A0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t NSAppendPrintF()
{
  return MEMORY[0x1E0D1B138]();
}

uint64_t NSAppendPrintF_safe()
{
  return MEMORY[0x1E0D1B140]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

uint64_t NSDecodeNSDictionaryOfClassesIfPresent()
{
  return MEMORY[0x1E0D1B170]();
}

uint64_t NSErrorF()
{
  return MEMORY[0x1E0D1B1C8]();
}

uint64_t NSErrorF_safe()
{
  return MEMORY[0x1E0D1B1D0]();
}

uint64_t NSErrorNestedF()
{
  return MEMORY[0x1E0D1B1D8]();
}

uint64_t NSPrintF_safe()
{
  return MEMORY[0x1E0D1B218]();
}

uint64_t OPACKDecodeData()
{
  return MEMORY[0x1E0D1B4C8]();
}

uint64_t RandomBytes()
{
  return MEMORY[0x1E0D1B5F0]();
}

uint64_t SocketReadDataEx()
{
  return MEMORY[0x1E0D1B6B8]();
}

uint64_t SocketSetNonBlocking()
{
  return MEMORY[0x1E0D1B6D0]();
}

uint64_t SocketWriteData()
{
  return MEMORY[0x1E0D1B700]();
}

uint64_t TCCAccessRestricted()
{
  return MEMORY[0x1E0DB1050]();
}

uint64_t TextToHardwareAddress()
{
  return MEMORY[0x1E0D1B7A0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x1E0D1B888]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t abort_with_payload()
{
  return MEMORY[0x1E0C813B8]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t cc_clear()
{
  return MEMORY[0x1E0C81868]();
}

uint64_t ccaes_ecb_encrypt_mode()
{
  return MEMORY[0x1E0C818A8]();
}

uint64_t ccecb_context_size()
{
  return MEMORY[0x1E0C81E08]();
}

uint64_t ccecb_init()
{
  return MEMORY[0x1E0C81E10]();
}

uint64_t cclr_aes_init()
{
  return MEMORY[0x1E0C821D8]();
}

uint64_t cclr_decrypt_block()
{
  return MEMORY[0x1E0C821E0]();
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1E0C82670](*(_QWORD *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
{
  MEMORY[0x1E0C82E10](predicate, context, function);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
}

dispatch_qos_class_t dispatch_queue_get_qos_class(dispatch_queue_t queue, int *relative_priority_ptr)
{
  return MEMORY[0x1E0C82E60](queue, relative_priority_ptr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

uint64_t dispatch_workloop_copy_current()
{
  return MEMORY[0x1E0C82FD0]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

uint64_t os_channel_attr_create()
{
  return MEMORY[0x1E0C84550]();
}

uint64_t os_channel_attr_destroy()
{
  return MEMORY[0x1E0C84558]();
}

uint64_t os_channel_attr_set()
{
  return MEMORY[0x1E0C84568]();
}

uint64_t os_channel_create_extended()
{
  return MEMORY[0x1E0C84588]();
}

uint64_t os_channel_destroy()
{
  return MEMORY[0x1E0C84590]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x1E0C85060](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1E0C85388](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int shutdown(int a1, int a2)
{
  return MEMORY[0x1E0C853C0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x1E0C85500](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

uint64_t tcc_authorization_record_get_authorization_right()
{
  return MEMORY[0x1E0DB1210]();
}

uint64_t tcc_credential_singleton_for_self()
{
  return MEMORY[0x1E0DB1260]();
}

uint64_t tcc_message_options_create()
{
  return MEMORY[0x1E0DB12C0]();
}

uint64_t tcc_message_options_set_client_dict()
{
  return MEMORY[0x1E0DB12D8]();
}

uint64_t tcc_message_options_set_reply_handler_policy()
{
  return MEMORY[0x1E0DB12E8]();
}

uint64_t tcc_message_options_set_request_prompt_policy()
{
  return MEMORY[0x1E0DB12F8]();
}

uint64_t tcc_server_create()
{
  return MEMORY[0x1E0DB1318]();
}

uint64_t tcc_server_message_request_authorization()
{
  return MEMORY[0x1E0DB1350]();
}

uint64_t tcc_service_singleton_for_CF_name()
{
  return MEMORY[0x1E0DB1388]();
}

int uuid_is_null(const uuid_t uu)
{
  return MEMORY[0x1E0C85A30](uu);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1E0C85A38](in, uu);
}

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A50](uu, out);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x1E0C85ED0](xarray, index, string);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C85F00](xBOOL);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FA0](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
  MEMORY[0x1E0C86020](connection, barrier);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

uint64_t xpc_copy_entitlement_for_self()
{
  return MEMORY[0x1E0C86118]();
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C86178](bytes, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C86248](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1E0C86270](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x1E0C86348](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  MEMORY[0x1E0C863B0](xdict, key, uuid);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_object_t xpc_double_create(double value)
{
  return (xpc_object_t)MEMORY[0x1E0C863D0](value);
}

double xpc_double_get_value(xpc_object_t xdouble)
{
  double result;

  MEMORY[0x1E0C863E0](xdouble);
  return result;
}

int xpc_fd_dup(xpc_object_t xfd)
{
  return MEMORY[0x1E0C864B0](xfd);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C86568](value);
}

int64_t xpc_int64_get_value(xpc_object_t xint)
{
  return MEMORY[0x1E0C86570](xint);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86628]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1E0C867B8](xuint);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return (xpc_object_t)MEMORY[0x1E0C867E0](uuid);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x1E0C867F8](xuuid);
}

