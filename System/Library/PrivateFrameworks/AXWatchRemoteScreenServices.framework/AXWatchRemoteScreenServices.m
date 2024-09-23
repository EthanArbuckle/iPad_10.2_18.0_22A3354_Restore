_TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger *AXTwiceRemoteScreenMessengerObjc()
{
  return +[AXTwiceRemoteScreenMessenger sharedInstance](_TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger, "sharedInstance");
}

uint64_t AXWatchRemoteScreenIsTwiceFeatureOn()
{
  return _os_feature_enabled_impl();
}

uint64_t AXWatchRemoteScreenIsPairedGizmoSupported()
{
  void *v0;
  uint64_t v1;

  +[AXDeviceRemoteScreenUtil sharedInstance](AXDeviceRemoteScreenUtil, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isPairedGizmoSupported");

  return v1;
}

id AX_NRDEVICECAPABILITY_MULTIBAND_WIFI()
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("776630FC-BE65-4716-B3B0-E36BA8679ECE"));
}

uint64_t AXWatchRemoteScreenIsPairedGizmoHasStingSupport()
{
  void *v0;
  uint64_t v1;

  +[AXDeviceRemoteScreenUtil sharedInstance](AXDeviceRemoteScreenUtil, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isPairedGizmoHasStingSupport");

  return v1;
}

id AX_NRDEVICECAPABILITY_STING()
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("15BF559D-D50B-44FE-AC84-DFBA323EC985"));
}

uint64_t AXDeviceRemoteScreenIsBluetoothOn()
{
  void *v0;
  uint64_t v1;
  uint64_t v3;
  _QWORD block[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    objc_msgSend(getBluetoothManagerClass(), "sharedInstance");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    v1 = objc_msgSend(v0, "powered");

    return v1;
  }
  else
  {
    v5 = 0;
    v6 = &v5;
    v7 = 0x2020000000;
    v8 = 0;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __AXDeviceRemoteScreenIsBluetoothOn_block_invoke;
    block[3] = &unk_24E1A2328;
    block[4] = &v5;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);
    v3 = *((unsigned __int8 *)v6 + 24);
    _Block_object_dispose(&v5, 8);
    return v3;
  }
}

id getBluetoothManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getBluetoothManagerClass_softClass;
  v7 = getBluetoothManagerClass_softClass;
  if (!getBluetoothManagerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getBluetoothManagerClass_block_invoke;
    v3[3] = &unk_24E1A2328;
    v3[4] = &v4;
    __getBluetoothManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21DBF5AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AXDeviceRemoteScreenIsWifiOn()
{
  void *v0;
  objc_class *v1;
  id v2;
  uint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v0 = (void *)getWFClientClass_softClass;
  v9 = getWFClientClass_softClass;
  if (!getWFClientClass_softClass)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getWFClientClass_block_invoke;
    v5[3] = &unk_24E1A2328;
    v5[4] = &v6;
    __getWFClientClass_block_invoke((uint64_t)v5);
    v0 = (void *)v7[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v6, 8);
  v2 = objc_alloc_init(v1);
  v3 = objc_msgSend(v2, "powered");

  return v3;
}

void sub_21DBF5C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double AXDisplayCornerRadiusWithMargin(double a1)
{
  float (*v2)(const __CFString *, float);
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = (float (*)(const __CFString *, float))getMGGetFloat32AnswerSymbolLoc_ptr;
  v8 = getMGGetFloat32AnswerSymbolLoc_ptr;
  if (!getMGGetFloat32AnswerSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __getMGGetFloat32AnswerSymbolLoc_block_invoke;
    v4[3] = &unk_24E1A2328;
    v4[4] = &v5;
    __getMGGetFloat32AnswerSymbolLoc_block_invoke((uint64_t)v4);
    v2 = (float (*)(const __CFString *, float))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    AXDisplayCornerRadiusWithMargin_cold_1();
  return fmax(v2(CFSTR("DeviceCornerRadius"), 0.0) - a1, 13.0);
}

void sub_21DBF5CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double AXDisplayCornerRadius()
{
  return AXDisplayCornerRadiusWithMargin(0.0);
}

const __CFString *AXkMobileKeyBagLockStatusNotificationID()
{
  return CFSTR("com.apple.mobile.keybagd.lock_status");
}

const __CFString *AXkNanoOrientationStatusNotificationID()
{
  return CFSTR("NanoOrientationSettingChangedNotification");
}

id _AXCurrentPairedGizmo()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  char v4;
  id v5;

  objc_msgSend(MEMORY[0x24BE6B4E0], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "getActivePairedDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(v1, "valueForProperty:", *MEMORY[0x24BE6B340]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "BOOLValue"))
    {

    }
    else
    {
      objc_msgSend(v1, "valueForProperty:", *MEMORY[0x24BE6B348]);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "BOOLValue");

      if ((v4 & 1) == 0)
      {
        v5 = v1;
        goto LABEL_6;
      }
    }
  }
  v5 = 0;
LABEL_6:

  return v5;
}

void AXNPSSetWatchRemoteScreenEnabled(uint64_t a1)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  _AXCurrentPairedGizmo();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v2 = (objc_class *)MEMORY[0x24BE6B2C0];
    v3 = (id)*MEMORY[0x24BED2948];
    v4 = [v2 alloc];
    v5 = (void *)objc_msgSend(v4, "initWithDomain:pairedDevice:", *MEMORY[0x24BED26B8], v10);
    objc_msgSend(v5, "setBool:forKey:", a1, v3);
    v6 = (id)objc_msgSend(v5, "synchronize");
    v7 = (void *)objc_opt_new();
    objc_msgSend(v5, "domain");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "synchronizeNanoDomain:keys:", v8, v9);
  }

}

uint64_t AXIsCrownOrientationOnRightSide()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  _AXCurrentPairedGizmo();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "valueForProperty:", *MEMORY[0x24BE6B378]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:pairingID:pairingDataStore:", CFSTR("com.apple.nano"), v2, v3);
    v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("invertUI")) ^ 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

Class __getBluetoothManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!BluetoothManagerLibraryCore_frameworkLibrary)
  {
    BluetoothManagerLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!BluetoothManagerLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getBluetoothManagerClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("BluetoothManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getBluetoothManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getWFClientClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!WiFiKitLibraryCore_frameworkLibrary)
  {
    WiFiKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!WiFiKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getWFClientClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("WFClient");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getWFClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getMGGetFloat32AnswerSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = (void *)libMobileGestaltLibraryCore_frameworkLibrary;
  v8 = libMobileGestaltLibraryCore_frameworkLibrary;
  if (!libMobileGestaltLibraryCore_frameworkLibrary)
  {
    v9 = xmmword_24E1A2378;
    v10 = 0;
    v2 = (void *)_sl_dlopen();
    v6[3] = (uint64_t)v2;
    libMobileGestaltLibraryCore_frameworkLibrary = (uint64_t)v2;
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
  {
    v4 = (void *)abort_report_np();
    __break(1u);
    free(v4);
  }
  result = dlsym(v2, "MGGetFloat32Answer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMGGetFloat32AnswerSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_21DBF62A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

_TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService *AXTwiceRemoteScreenServiceObjc()
{
  return +[AXDeviceRemoteScreenService sharedInstance](_TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService, "sharedInstance");
}

uint64_t sub_21DBF62D0()
{
  uint64_t v0;

  v0 = sub_21DC00870();
  __swift_allocate_value_buffer(v0, qword_2540EA988);
  __swift_project_value_buffer(v0, (uint64_t)qword_2540EA988);
  return sub_21DC00864();
}

uint64_t AXLogTwiceRemoteScreen.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2540EA980 != -1)
    swift_once();
  v2 = sub_21DC00870();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2540EA988);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void type metadata accessor for AXAction()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_2553A5A78)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_2553A5A78);
  }
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

id AXTwiceRemoteScreenService.getter()
{
  if (qword_2553A5990 != -1)
    swift_once();
  return (id)qword_2553A5AE0;
}

id sub_21DBF64AC()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AXDeviceRemoteScreenService()), sel_init);
  qword_2553A5AE0 = (uint64_t)result;
  return result;
}

id AXDeviceRemoteScreenService.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id static AXDeviceRemoteScreenService.sharedInstance.getter()
{
  if (qword_2553A5990 != -1)
    swift_once();
  return (id)qword_2553A5AE0;
}

id AXDeviceRemoteScreenService.init()()
{
  char *v0;
  objc_class *ObjectType;
  char *v2;
  objc_class *v3;
  id v4;
  char *v5;
  id v6;
  char *v7;
  char *v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = &v0[OBJC_IVAR____TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService_serviceImpl];
  v3 = (objc_class *)type metadata accessor for AXWatchRemoteScreenServiceAXUIService();
  v4 = objc_allocWithZone(v3);
  v5 = v0;
  v6 = objc_msgSend(v4, sel_init);
  *((_QWORD *)v2 + 3) = v3;
  *((_QWORD *)v2 + 4) = &off_24E1A2688;
  *(_QWORD *)v2 = v6;
  v7 = &v5[OBJC_IVAR____TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService_twiceEnabledEvent];
  *(_QWORD *)v7 = 0xD000000000000036;
  *((_QWORD *)v7 + 1) = 0x800000021DC01B50;
  v8 = &v5[OBJC_IVAR____TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService_twiceEnabledKey];
  *(_QWORD *)v8 = 0x64656C62616E65;
  *((_QWORD *)v8 + 1) = 0xE700000000000000;

  v10.receiver = v5;
  v10.super_class = ObjectType;
  return objc_msgSendSuper2(&v10, sel_init);
}

id AXDeviceRemoteScreenService.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Bool __swiftcall AXDeviceRemoteScreenService.npsSetTwiceEnabled(_:)(Swift::Bool a1)
{
  uint64_t v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[3];
  uint64_t v7;
  uint64_t v8;

  v2 = a1;
  sub_21DBF6858(v1 + OBJC_IVAR____TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService_serviceImpl, (uint64_t)v6);
  v3 = v7;
  v4 = v8;
  __swift_project_boxed_opaque_existential_1(v6, v7);
  (*(void (**)(_BOOL8, uint64_t, uint64_t))(v4 + 24))(v2, v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return 1;
}

uint64_t sub_21DBF6858(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

Swift::Bool __swiftcall AXDeviceRemoteScreenService.startTwiceRemoteScreen()()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  unint64_t (*v6)();
  _QWORD aBlock[3];
  void *v9;
  unint64_t (*v10)();
  uint64_t v11;

  v1 = (void *)sub_21DC008A0();
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v0;
  v10 = sub_21DBF6AD0;
  v11 = v2;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21DBF6AEC;
  v9 = &block_descriptor;
  v3 = _Block_copy(aBlock);
  v4 = v0;
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v3);

  sub_21DBF6858((uint64_t)v4 + OBJC_IVAR____TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService_serviceImpl, (uint64_t)aBlock);
  v5 = v9;
  v6 = v10;
  __swift_project_boxed_opaque_existential_1(aBlock, (uint64_t)v9);
  (*((void (**)(void *, unint64_t (*)()))v6 + 1))(v5, v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
  return 1;
}

uint64_t sub_21DBF6AAC()
{
  uint64_t v0;

  return swift_deallocObject();
}

unint64_t sub_21DBF6AD0()
{
  uint64_t v0;

  return sub_21DBF6CDC(*(_QWORD *)(v0 + 16));
}

id sub_21DBF6AEC(uint64_t a1)
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_release();
  if (v3)
  {
    sub_21DBF6E74(0, (unint64_t *)&unk_2540EA938);
    v4 = (void *)sub_21DC0087C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

Swift::Bool __swiftcall AXDeviceRemoteScreenService.stopTwiceRemoteScreen()()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  unint64_t (*v6)();
  _QWORD aBlock[3];
  void *v9;
  unint64_t (*v10)();
  uint64_t v11;

  v1 = (void *)sub_21DC008A0();
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v0;
  v10 = sub_21DBF6D80;
  v11 = v2;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_21DBF6AEC;
  v9 = &block_descriptor_6;
  v3 = _Block_copy(aBlock);
  v4 = v0;
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v3);

  sub_21DBF6858((uint64_t)v4 + OBJC_IVAR____TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService_serviceImpl, (uint64_t)aBlock);
  v5 = v9;
  v6 = v10;
  __swift_project_boxed_opaque_existential_1(aBlock, (uint64_t)v9);
  (*((void (**)(void *, unint64_t (*)()))v6 + 2))(v5, v6);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)aBlock);
  return 1;
}

unint64_t sub_21DBF6CDC(uint64_t a1)
{
  uint64_t inited;
  uint64_t v3;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2553A5BE8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21DC01170;
  v3 = *(_QWORD *)(a1 + OBJC_IVAR____TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService_twiceEnabledKey);
  v4 = *(_QWORD *)(a1 + OBJC_IVAR____TtC27AXWatchRemoteScreenServices27AXDeviceRemoteScreenService_twiceEnabledKey + 8);
  *(_QWORD *)(inited + 32) = v3;
  *(_QWORD *)(inited + 40) = v4;
  sub_21DBF6E74(0, (unint64_t *)&qword_2553A5BF0);
  swift_bridgeObjectRetain();
  *(_QWORD *)(inited + 48) = sub_21DC00984();
  return sub_21DBF9E14(inited);
}

unint64_t sub_21DBF6D80()
{
  uint64_t v0;

  return sub_21DBF6CDC(*(_QWORD *)(v0 + 16));
}

uint64_t dispatch thunk of AXTwiceRemoteScreenXPCServiceProtocol.startTwiceXPCRequest()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of AXTwiceRemoteScreenXPCServiceProtocol.stopTwiceXPCRequest()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of AXTwiceRemoteScreenXPCServiceProtocol.npsSetTwiceEnabledXPCRequest(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t type metadata accessor for AXDeviceRemoteScreenService()
{
  return objc_opt_self();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22079C6E4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_21DBF6E74(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

AXWatchRemoteScreenServices::AXWatchRemoteScreenAXUIServiceMessageID_optional __swiftcall AXWatchRemoteScreenAXUIServiceMessageID.init(rawValue:)(Swift::Int rawValue)
{
  _BYTE *v1;
  unint64_t v2;

  v2 = 0x40302010005uLL >> (8 * rawValue);
  if ((unint64_t)rawValue >= 6)
    LOBYTE(v2) = 5;
  *v1 = v2;
  return (AXWatchRemoteScreenServices::AXWatchRemoteScreenAXUIServiceMessageID_optional)rawValue;
}

uint64_t AXWatchRemoteScreenAXUIServiceMessageID.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0 + 1;
}

BOOL sub_21DBF6EEC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t sub_21DBF6F04()
{
  unint64_t result;

  result = qword_2553A5C00;
  if (!qword_2553A5C00)
  {
    result = MEMORY[0x22079C6F0](&protocol conformance descriptor for AXWatchRemoteScreenAXUIServiceMessageID, &type metadata for AXWatchRemoteScreenAXUIServiceMessageID);
    atomic_store(result, (unint64_t *)&qword_2553A5C00);
  }
  return result;
}

uint64_t sub_21DBF6F48()
{
  sub_21DC00A98();
  sub_21DC00AA4();
  return sub_21DC00AB0();
}

uint64_t sub_21DBF6F8C()
{
  return sub_21DC00AA4();
}

uint64_t sub_21DBF6FB8()
{
  sub_21DC00A98();
  sub_21DC00AA4();
  return sub_21DC00AB0();
}

AXWatchRemoteScreenServices::AXWatchRemoteScreenAXUIServiceMessageID_optional sub_21DBF6FF8(Swift::Int *a1)
{
  return AXWatchRemoteScreenAXUIServiceMessageID.init(rawValue:)(*a1);
}

void sub_21DBF7000(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1 + 1;
}

unint64_t sub_21DBF7010(uint64_t a1)
{
  unint64_t result;

  result = sub_21DBF7034();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_21DBF7034()
{
  unint64_t result;

  result = qword_2553A5C08;
  if (!qword_2553A5C08)
  {
    result = MEMORY[0x22079C6F0](&protocol conformance descriptor for AXWatchRemoteScreenAXUIServiceMessageID, &type metadata for AXWatchRemoteScreenAXUIServiceMessageID);
    atomic_store(result, (unint64_t *)&qword_2553A5C08);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AXWatchRemoteScreenAXUIServiceMessageID(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AXWatchRemoteScreenAXUIServiceMessageID(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_21DBF7164 + 4 * byte_21DC01215[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_21DBF7198 + 4 * byte_21DC01210[v4]))();
}

uint64_t sub_21DBF7198(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DBF71A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21DBF71A8);
  return result;
}

uint64_t sub_21DBF71B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21DBF71BCLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_21DBF71C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DBF71C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DBF71D4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_21DBF71E0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AXWatchRemoteScreenAXUIServiceMessageID()
{
  return &type metadata for AXWatchRemoteScreenAXUIServiceMessageID;
}

uint64_t sub_21DBF71F8(void *a1)
{
  id v2;

  v2 = a1;
  sub_21DC009F0();
  sub_21DC008D0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553A5C98);
  sub_21DC00A14();

  return 0;
}

uint64_t sub_21DBF7298()
{
  void **v0;

  return sub_21DBF71F8(*v0);
}

uint64_t sub_21DBF72BC(uint64_t result, void *a2, void (*a3)(void *, uint64_t))
{
  id v5;
  unint64_t v6;
  unint64_t v7;

  if (a3)
  {
    if (a2)
    {
      sub_21DBF8554((uint64_t)a3);
      v5 = a2;
      a3(a2, 1);

      return sub_21DBF8544((uint64_t)a3);
    }
    else
    {
      v6 = result;
      if (result)
      {
        swift_retain();
        v7 = v6;
      }
      else
      {
        swift_retain();
        v7 = sub_21DBF9F2C(MEMORY[0x24BEE4AF8]);
      }
      swift_bridgeObjectRetain();
      a3((void *)v7, 0);
      sub_21DBF8544((uint64_t)a3);
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t sub_21DBF7394(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v4)(uint64_t, void *);
  uint64_t v5;
  id v6;

  v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
    v5 = sub_21DC00888();
  else
    v5 = 0;
  swift_retain();
  v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

id sub_21DBF7428()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id result;
  void *v12;
  id v13;

  v1 = OBJC_IVAR____TtC27AXWatchRemoteScreenServices37AXWatchRemoteScreenServiceAXUIService__client;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC27AXWatchRemoteScreenServices37AXWatchRemoteScreenServiceAXUIService__client);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC27AXWatchRemoteScreenServices37AXWatchRemoteScreenServiceAXUIService__client);
LABEL_6:
    v13 = v2;
    return v3;
  }
  v4 = v0;
  v5 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  objc_msgSend(v5, sel_processIdentifier);

  sub_21DC00A50();
  sub_21DC008D0();
  swift_bridgeObjectRelease();
  v6 = objc_allocWithZone(MEMORY[0x24BDFF8E8]);
  v7 = (void *)sub_21DC008A0();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_21DC008A0();
  v9 = objc_msgSend(v6, sel_initWithIdentifier_serviceBundleName_, v7, v8);

  v10 = *(void **)(v4 + v1);
  *(_QWORD *)(v4 + v1) = v9;

  result = *(id *)(v4 + v1);
  if (result)
  {
    result = objc_msgSend(result, sel_setDelegate_, v4);
    v12 = *(void **)(v4 + v1);
    if (v12)
    {
      v3 = v12;
      v2 = 0;
      goto LABEL_6;
    }
  }
  __break(1u);
  return result;
}

void sub_21DBF75B0(char a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];

  if (qword_2540EA980 != -1)
    swift_once();
  v2 = sub_21DC00870();
  __swift_project_value_buffer(v2, (uint64_t)qword_2540EA988);
  v3 = sub_21DC00858();
  v4 = sub_21DC0096C();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v5 = 67109120;
    LODWORD(v10[0]) = a1 & 1;
    sub_21DC0099C();
    _os_log_impl(&dword_21DBF3000, v3, v4, "[TWICE] Client requesting TWICE npsSetTwiceEnabledXPCRequest %{BOOL}d", v5, 8u);
    MEMORY[0x22079C744](v5, -1, -1);
  }

  v6 = sub_21DBF7428();
  if ((a1 & 1) != 0)
    v7 = 4;
  else
    v7 = 5;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = sub_21DBF7780;
  *(_QWORD *)(v8 + 24) = 0;
  v10[4] = sub_21DBF8754;
  v10[5] = v8;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_21DBF7394;
  v10[3] = &block_descriptor_21;
  v9 = _Block_copy(v10);
  swift_release();
  objc_msgSend(v6, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, 0, v7, 0, v9);
  _Block_release(v9);

}

void sub_21DBF7780(void *a1, char a2)
{
  sub_21DBF7C78(a1, a2, "[TWICE] Failed to start TWICE: %@", MEMORY[0x24BEE7928], "[TWICE] Client received TWICE start success callback %s");
}

void sub_21DBF779C()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];

  if (qword_2540EA980 != -1)
    swift_once();
  v0 = sub_21DC00870();
  __swift_project_value_buffer(v0, (uint64_t)qword_2540EA988);
  v1 = sub_21DC00858();
  v2 = sub_21DC0096C();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21DBF3000, v1, v2, "[TWICE] Client requesting TWICE start", v3, 2u);
    MEMORY[0x22079C744](v3, -1, -1);
  }

  v4 = sub_21DBF7428();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_21DBF7780;
  *(_QWORD *)(v5 + 24) = 0;
  v7[4] = sub_21DBF8754;
  v7[5] = v5;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_21DBF7394;
  v7[3] = &block_descriptor_14;
  v6 = _Block_copy(v7);
  swift_release();
  objc_msgSend(v4, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, 0, 1, 0, v6);
  _Block_release(v6);

}

void sub_21DBF7928()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];

  if (qword_2540EA980 != -1)
    swift_once();
  v0 = sub_21DC00870();
  __swift_project_value_buffer(v0, (uint64_t)qword_2540EA988);
  v1 = sub_21DC00858();
  v2 = sub_21DC0096C();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21DBF3000, v1, v2, "[TWICE] Client requesting TWICE stop", v3, 2u);
    MEMORY[0x22079C744](v3, -1, -1);
  }

  v4 = sub_21DBF7428();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_21DBF7AB4;
  *(_QWORD *)(v5 + 24) = 0;
  v7[4] = sub_21DBF8754;
  v7[5] = v5;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_21DBF7394;
  v7[3] = &block_descriptor_7;
  v6 = _Block_copy(v7);
  swift_release();
  objc_msgSend(v4, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, 0, 2, 0, v6);
  _Block_release(v6);

}

void sub_21DBF7AB4(void *a1, char a2)
{
  sub_21DBF7C78(a1, a2, "[TWICE] Failed to stop TWICE: %@", MEMORY[0x24BEE7910], "[TWICE] Client received TWICE stop success callback %s");
}

void sub_21DBF7AD0()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];

  if (qword_2540EA980 != -1)
    swift_once();
  v0 = sub_21DC00870();
  __swift_project_value_buffer(v0, (uint64_t)qword_2540EA988);
  v1 = sub_21DC00858();
  v2 = sub_21DC0096C();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21DBF3000, v1, v2, "[TWICE] Client requesting TWICE restart", v3, 2u);
    MEMORY[0x22079C744](v3, -1, -1);
  }

  v4 = sub_21DBF7428();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = sub_21DBF7C5C;
  *(_QWORD *)(v5 + 24) = 0;
  v7[4] = sub_21DBF8524;
  v7[5] = v5;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_21DBF7394;
  v7[3] = &block_descriptor_0;
  v6 = _Block_copy(v7);
  swift_release();
  objc_msgSend(v4, sel_sendAsynchronousMessage_withIdentifier_targetAccessQueue_completion_, 0, 3, 0, v6);
  _Block_release(v6);

}

void sub_21DBF7C5C(void *a1, char a2)
{
  sub_21DBF7C78(a1, a2, "[TWICE] Failed to restart TWICE: %@", MEMORY[0x24BEE7910], "[TWICE] Client received TWICE restart success callback %s");
}

void sub_21DBF7C78(id a1, char a2, const char *a3, uint64_t (*a4)(void), const char *a5)
{
  uint64_t v8;
  uint64_t v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  os_log_type_t v21;
  uint8_t *v22;
  _QWORD *v23;
  _QWORD *v24;
  id v25;
  NSObject *oslog;
  uint64_t v27;

  if ((a2 & 1) != 0)
  {
    v17 = a1;
    if (qword_2540EA980 != -1)
      swift_once();
    v18 = sub_21DC00870();
    __swift_project_value_buffer(v18, (uint64_t)qword_2540EA988);
    v19 = a1;
    v20 = a1;
    oslog = sub_21DC00858();
    v21 = sub_21DC00960();
    if (os_log_type_enabled(oslog, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v22 = 138412290;
      sub_21DBF8570();
      swift_allocError();
      *v24 = a1;
      v25 = a1;
      v27 = _swift_stdlib_bridgeErrorToNSError();
      sub_21DC0099C();
      *v23 = v27;
      sub_21DBF8564(a1, 1);
      sub_21DBF8564(a1, 1);
      _os_log_impl(&dword_21DBF3000, oslog, v21, a3, v22, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2553A5C88);
      swift_arrayDestroy();
      MEMORY[0x22079C744](v23, -1, -1);
      MEMORY[0x22079C744](v22, -1, -1);

      sub_21DBF8564(a1, 1);
      return;
    }
    sub_21DBF8564(a1, 1);
    sub_21DBF8564(a1, 1);

  }
  else
  {
    v8 = qword_2540EA980;
    swift_bridgeObjectRetain();
    if (v8 != -1)
      swift_once();
    v9 = sub_21DC00870();
    __swift_project_value_buffer(v9, (uint64_t)qword_2540EA988);
    swift_bridgeObjectRetain();
    oslog = sub_21DC00858();
    v10 = a4();
    if (os_log_type_enabled(oslog, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v27 = v12;
      *(_DWORD *)v11 = 136315138;
      swift_bridgeObjectRetain();
      v13 = sub_21DC00894();
      v15 = v14;
      sub_21DBF8564(a1, 0);
      sub_21DBFC848(v13, v15, &v27);
      sub_21DC0099C();
      swift_bridgeObjectRelease();
      sub_21DBF8564(a1, 0);
      sub_21DBF8564(a1, 0);
      _os_log_impl(&dword_21DBF3000, oslog, v10, a5, v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22079C744](v12, -1, -1);
      MEMORY[0x22079C744](v11, -1, -1);

      return;
    }
    sub_21DBF8564(a1, 0);
    sub_21DBF8564(a1, 0);
  }

}

id sub_21DBF8098()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AXWatchRemoteScreenServiceAXUIService();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AXWatchRemoteScreenServiceAXUIService()
{
  return objc_opt_self();
}

void sub_21DBF80F8()
{
  sub_21DBF779C();
}

void sub_21DBF8118()
{
  sub_21DBF7928();
}

void sub_21DBF8138(char a1)
{
  sub_21DBF75B0(a1);
}

void sub_21DBF8158(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  char v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20[2];

  v2 = v1;
  v20[1] = *MEMORY[0x24BDAC8D0];
  if (qword_2540EA980 != -1)
    swift_once();
  v4 = sub_21DC00870();
  __swift_project_value_buffer(v4, (uint64_t)qword_2540EA988);
  v5 = a1;
  v6 = sub_21DC00858();
  v7 = sub_21DC00960();
  if (os_log_type_enabled(v6, v7))
  {
    v19 = v2;
    v8 = swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v20[0] = v10;
    *(_DWORD *)v8 = 136315394;
    sub_21DBFC848(0xD00000000000003CLL, 0x800000021DC01CE0, v20);
    sub_21DC0099C();
    *(_WORD *)(v8 + 12) = 2112;
    if (a1)
      v11 = v5;
    sub_21DC0099C();
    *v9 = a1;

    _os_log_impl(&dword_21DBF3000, v6, v7, "[TWICE]: %s %@", (uint8_t *)v8, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2553A5C88);
    swift_arrayDestroy();
    MEMORY[0x22079C744](v9, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x22079C744](v10, -1, -1);
    MEMORY[0x22079C744](v8, -1, -1);

    v2 = v19;
  }
  else
  {

  }
  v12 = *(void **)(v2 + OBJC_IVAR____TtC27AXWatchRemoteScreenServices37AXWatchRemoteScreenServiceAXUIService__client);
  if (a1)
  {
    if (!v12)
      return;
    sub_21DBF84E4();
    v13 = v5;
    v14 = v12;
    v15 = sub_21DC00990();

    if ((v15 & 1) == 0)
      return;
  }
  else if (v12)
  {
    return;
  }
  if (_AXSTwiceRemoteScreenEnabled())
  {
    v16 = sub_21DC00858();
    v17 = sub_21DC0096C();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_21DBF3000, v16, v17, "[TWICE]: start Twice again after axuiserver disconnected", v18, 2u);
      MEMORY[0x22079C744](v18, -1, -1);
    }

    sub_21DBF7AD0();
  }
}

unint64_t sub_21DBF84E4()
{
  unint64_t result;

  result = qword_2540EA930;
  if (!qword_2540EA930)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2540EA930);
  }
  return result;
}

uint64_t sub_21DBF8524(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_21DBF72BC(a1, a2, *(void (**)(void *, uint64_t))(v2 + 16));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_21DBF8544(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_21DBF8554(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

void sub_21DBF8564(id a1, char a2)
{
  if ((a2 & 1) != 0)

  else
    swift_bridgeObjectRelease();
}

unint64_t sub_21DBF8570()
{
  unint64_t result;

  result = qword_2553A5C90;
  if (!qword_2553A5C90)
  {
    result = MEMORY[0x22079C6F0](&unk_21DC01424, &type metadata for AXUIServiceError);
    atomic_store(result, (unint64_t *)&qword_2553A5C90);
  }
  return result;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

_QWORD *initializeBufferWithCopyOfBuffer for AXUIServiceError(_QWORD *a1, id *a2)
{
  id v3;
  id v4;

  v3 = *a2;
  v4 = *a2;
  *a1 = v3;
  return a1;
}

void destroy for AXUIServiceError(id *a1)
{

}

void **assignWithCopy for AXUIServiceError(void **a1, id *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = *a2;
  v4 = *a2;
  v5 = *a1;
  *a1 = v3;

  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for AXUIServiceError(void **a1, void **a2)
{
  void *v3;

  v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for AXUIServiceError(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 8))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AXUIServiceError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 8) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_21DBF871C()
{
  return 0;
}

ValueMetadata *type metadata accessor for AXUIServiceError()
{
  return &type metadata for AXUIServiceError;
}

void sub_21DBF8758(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_21DBF87A4(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_21DBF8844 + 4 * byte_21DC01496[a2]))(1701602409);
}

uint64_t sub_21DBF8844(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 1701602409 && v1 == 0xE400000000000000)
    v2 = 1;
  else
    v2 = sub_21DC00A5C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_21DBF8930(char a1)
{
  sub_21DC00A98();
  __asm { BR              X10 }
}

uint64_t sub_21DBF8988()
{
  sub_21DC008C4();
  swift_bridgeObjectRelease();
  return sub_21DC00AB0();
}

void sub_21DBF8A3C(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_21DBF8A80()
{
  sub_21DC008C4();
  return swift_bridgeObjectRelease();
}

void sub_21DBF8B18(uint64_t a1, char a2)
{
  sub_21DC00A98();
  __asm { BR              X10 }
}

uint64_t sub_21DBF8B6C()
{
  sub_21DC008C4();
  swift_bridgeObjectRelease();
  return sub_21DC00AB0();
}

BOOL static AXTwiceBluetoothWifiError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AXTwiceBluetoothWifiError.hash(into:)()
{
  return sub_21DC00AA4();
}

uint64_t AXTwiceBluetoothWifiError.hashValue.getter()
{
  sub_21DC00A98();
  sub_21DC00AA4();
  return sub_21DC00AB0();
}

uint64_t sub_21DBF8CA0()
{
  sub_21DC00A98();
  sub_21DC00AA4();
  return sub_21DC00AB0();
}

uint64_t sub_21DBF8CE4()
{
  return sub_21DC00AA4();
}

uint64_t sub_21DBF8D0C()
{
  sub_21DC00A98();
  sub_21DC00AA4();
  return sub_21DC00AB0();
}

void AXTwiceCompanionState.AXTwiceCompanionEvent.stringDescription.getter()
{
  uint64_t *v0;
  _QWORD v1[9];

  sub_21DBF9090(v0, (uint64_t)v1);
  __asm { BR              X10 }
}

uint64_t sub_21DBF8D8C()
{
  void *v0;

  return 0x6576456863756F74;
}

uint64_t sub_21DBF9090(uint64_t *a1, uint64_t a2)
{
  initializeWithCopy for AXTwiceCompanionState.AXTwiceCompanionEvent(a2, a1);
  return a2;
}

uint64_t sub_21DBF90C4(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t sub_21DBF9108(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553A5CA0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void static AXTwiceCompanionState.initialState.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

AXWatchRemoteScreenServices::AXTwiceCompanionState_optional __swiftcall AXTwiceCompanionState.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  AXWatchRemoteScreenServices::AXTwiceCompanionState_optional result;
  char v5;

  v2 = v1;
  v3 = sub_21DC00A44();
  result.value = swift_bridgeObjectRelease();
  v5 = 6;
  if (v3 < 6)
    v5 = v3;
  *v2 = v5;
  return result;
}

void sub_21DBF91A8(char *a1)
{
  sub_21DBF8758(*a1);
}

void sub_21DBF91B4()
{
  char *v0;

  sub_21DBF8930(*v0);
}

void sub_21DBF91BC(uint64_t a1)
{
  char *v1;

  sub_21DBF8A3C(a1, *v1);
}

void sub_21DBF91C4(uint64_t a1)
{
  char *v1;

  sub_21DBF8B18(a1, *v1);
}

AXWatchRemoteScreenServices::AXTwiceCompanionState_optional sub_21DBF91CC(Swift::String *a1)
{
  return AXTwiceCompanionState.init(rawValue:)(*a1);
}

uint64_t sub_21DBF91D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = AXTwiceCompanionState.description.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_21DBF91FC(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

uint64_t AXTwiceCompanionState.description.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_21DBF9238 + 4 * byte_21DC014B5[*v0]))(0xD000000000000010, 0x800000021DC01AC0);
}

uint64_t sub_21DBF9238()
{
  return 1701602409;
}

uint64_t sub_21DBF9248()
{
  return 0x6F43656369766564;
}

uint64_t sub_21DBF9280()
{
  return 0x6E696D6165727473;
}

uint64_t sub_21DBF92A0()
{
  return 0x657373696D736964;
}

unint64_t sub_21DBF92C0()
{
  unint64_t result;

  result = qword_2553A5CA8;
  if (!qword_2553A5CA8)
  {
    result = MEMORY[0x22079C6F0](&protocol conformance descriptor for AXTwiceBluetoothWifiError, &type metadata for AXTwiceBluetoothWifiError);
    atomic_store(result, (unint64_t *)&qword_2553A5CA8);
  }
  return result;
}

unint64_t sub_21DBF9308()
{
  unint64_t result;

  result = qword_2553A5CB0;
  if (!qword_2553A5CB0)
  {
    result = MEMORY[0x22079C6F0](&protocol conformance descriptor for AXTwiceCompanionState, &type metadata for AXTwiceCompanionState);
    atomic_store(result, (unint64_t *)&qword_2553A5CB0);
  }
  return result;
}

unint64_t sub_21DBF934C(uint64_t a1)
{
  unint64_t result;

  result = sub_21DBF9370();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_21DBF9370()
{
  unint64_t result;

  result = qword_2553A5CB8;
  if (!qword_2553A5CB8)
  {
    result = MEMORY[0x22079C6F0](&protocol conformance descriptor for AXTwiceCompanionState, &type metadata for AXTwiceCompanionState);
    atomic_store(result, (unint64_t *)&qword_2553A5CB8);
  }
  return result;
}

uint64_t dispatch thunk of static AXTwiceStateType.initialState.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t getEnumTagSinglePayload for AXTwiceBluetoothWifiError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AXTwiceBluetoothWifiError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_21DBF949C + 4 * byte_21DC014C0[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_21DBF94D0 + 4 * byte_21DC014BB[v4]))();
}

uint64_t sub_21DBF94D0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DBF94D8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21DBF94E0);
  return result;
}

uint64_t sub_21DBF94EC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21DBF94F4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_21DBF94F8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DBF9500(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AXTwiceBluetoothWifiError()
{
  return &type metadata for AXTwiceBluetoothWifiError;
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for AXTwiceInternalError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 3)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AXTwiceInternalError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_21DBF95BC(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 2u)
    return *(unsigned __int8 *)(a1 + 8);
  else
    return (*(_DWORD *)a1 + 3);
}

uint64_t sub_21DBF95D4(uint64_t result, unsigned int a2)
{
  if (a2 >= 3)
  {
    *(_QWORD *)result = a2 - 3;
    LOBYTE(a2) = 3;
  }
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for AXTwiceInternalError()
{
  return &type metadata for AXTwiceInternalError;
}

uint64_t getEnumTagSinglePayload for AXTwiceCompanionState(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AXTwiceCompanionState(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_21DBF96D8 + 4 * byte_21DC014CA[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_21DBF970C + 4 * byte_21DC014C5[v4]))();
}

uint64_t sub_21DBF970C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DBF9714(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x21DBF971CLL);
  return result;
}

uint64_t sub_21DBF9728(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x21DBF9730);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_21DBF9734(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_21DBF973C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AXTwiceCompanionState()
{
  return &type metadata for AXTwiceCompanionState;
}

uint64_t initializeBufferWithCopyOfBuffer for AXTwiceCompanionState.AXTwiceCompanionEvent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_21DBF9788(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

void destroy for AXTwiceCompanionState.AXTwiceCompanionEvent(uint64_t a1)
{
  unsigned int v2;

  v2 = *(unsigned __int8 *)(a1 + 72);
  if (v2 >= 6)
    v2 = *(_DWORD *)a1 + 6;
  switch(v2)
  {
    case 0u:
    case 1u:

      break;
    case 2u:
      if (*(_QWORD *)(a1 + 32))
        __swift_destroy_boxed_opaque_existential_1(a1 + 8);
      if (*(_QWORD *)(a1 + 64))
        __swift_destroy_boxed_opaque_existential_1(a1 + 40);
      break;
    case 3u:
      sub_21DBF90C4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
      break;
    default:
      return;
  }
}

uint64_t initializeWithCopy for AXTwiceCompanionState.AXTwiceCompanionEvent(uint64_t a1, uint64_t *a2)
{
  unsigned int v4;
  void *v5;
  id v6;
  __int128 v7;
  __int128 v8;
  void *v9;
  id v10;
  _OWORD *v11;
  _OWORD *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  _OWORD *v18;
  _OWORD *v19;
  uint64_t v20;
  __int128 v21;

  v4 = *((unsigned __int8 *)a2 + 72);
  if (v4 >= 6)
    v4 = *(_DWORD *)a2 + 6;
  switch(v4)
  {
    case 0u:
      v5 = (void *)*a2;
      *(_QWORD *)a1 = *a2;
      *(_BYTE *)(a1 + 72) = 0;
      v6 = v5;
      return a1;
    case 1u:
      v9 = (void *)*a2;
      *(_QWORD *)a1 = *a2;
      *(_BYTE *)(a1 + 72) = 1;
      v10 = v9;
      return a1;
    case 2u:
      *(_DWORD *)a1 = *(_DWORD *)a2;
      v11 = (_OWORD *)(a1 + 8);
      v12 = a2 + 1;
      v13 = a2[4];
      if (v13)
      {
        *(_QWORD *)(a1 + 32) = v13;
        (**(void (***)(_OWORD *, _OWORD *))(v13 - 8))(v11, v12);
      }
      else
      {
        v17 = *(_OWORD *)(a2 + 3);
        *v11 = *v12;
        *(_OWORD *)(a1 + 24) = v17;
      }
      v18 = (_OWORD *)(a1 + 40);
      v19 = a2 + 5;
      v20 = a2[8];
      if (v20)
      {
        *(_QWORD *)(a1 + 64) = v20;
        (**(void (***)(_OWORD *, _OWORD *))(v20 - 8))(v18, v19);
      }
      else
      {
        v21 = *(_OWORD *)(a2 + 7);
        *v18 = *v19;
        *(_OWORD *)(a1 + 56) = v21;
      }
      v16 = 2;
      goto LABEL_17;
    case 3u:
      v15 = *a2;
      v14 = a2[1];
      sub_21DBF9788(*a2, v14);
      *(_QWORD *)a1 = v15;
      *(_QWORD *)(a1 + 8) = v14;
      v16 = 3;
      goto LABEL_17;
    case 4u:
      *(_QWORD *)a1 = *a2;
      *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
      v16 = 4;
      goto LABEL_17;
    case 5u:
      *(_BYTE *)a1 = *(_BYTE *)a2;
      v16 = 5;
LABEL_17:
      *(_BYTE *)(a1 + 72) = v16;
      break;
    default:
      v7 = *((_OWORD *)a2 + 3);
      *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
      *(_OWORD *)(a1 + 48) = v7;
      *(_OWORD *)(a1 + 57) = *(_OWORD *)((char *)a2 + 57);
      v8 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v8;
      break;
  }
  return a1;
}

uint64_t assignWithCopy for AXTwiceCompanionState.AXTwiceCompanionEvent(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  void *v6;
  id v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  id v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  __int128 v20;
  _OWORD *v21;
  _OWORD *v22;
  uint64_t v23;
  __int128 v24;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 72);
    if (v4 >= 6)
      v4 = *(_DWORD *)a1 + 6;
    switch(v4)
    {
      case 0u:
      case 1u:

        break;
      case 2u:
        if (*(_QWORD *)(a1 + 32))
          __swift_destroy_boxed_opaque_existential_1(a1 + 8);
        if (*(_QWORD *)(a1 + 64))
          __swift_destroy_boxed_opaque_existential_1(a1 + 40);
        break;
      case 3u:
        sub_21DBF90C4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
        break;
      default:
        break;
    }
    v5 = *(unsigned __int8 *)(a2 + 72);
    if (v5 >= 6)
      v5 = *(_DWORD *)a2 + 6;
    switch(v5)
    {
      case 0u:
        v6 = *(void **)a2;
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_BYTE *)(a1 + 72) = 0;
        v7 = v6;
        return a1;
      case 1u:
        v11 = *(void **)a2;
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_BYTE *)(a1 + 72) = 1;
        v12 = v11;
        return a1;
      case 2u:
        *(_DWORD *)a1 = *(_DWORD *)a2;
        v13 = (_OWORD *)(a1 + 8);
        v14 = (_OWORD *)(a2 + 8);
        v15 = *(_QWORD *)(a2 + 32);
        if (v15)
        {
          *(_QWORD *)(a1 + 32) = v15;
          (**(void (***)(_OWORD *, _OWORD *))(v15 - 8))(v13, v14);
        }
        else
        {
          v20 = *(_OWORD *)(a2 + 24);
          *v13 = *v14;
          *(_OWORD *)(a1 + 24) = v20;
        }
        v21 = (_OWORD *)(a1 + 40);
        v22 = (_OWORD *)(a2 + 40);
        v23 = *(_QWORD *)(a2 + 64);
        if (v23)
        {
          *(_QWORD *)(a1 + 64) = v23;
          (**(void (***)(_OWORD *, _OWORD *))(v23 - 8))(v21, v22);
        }
        else
        {
          v24 = *(_OWORD *)(a2 + 56);
          *v21 = *v22;
          *(_OWORD *)(a1 + 56) = v24;
        }
        v18 = 2;
        goto LABEL_27;
      case 3u:
        v17 = *(_QWORD *)a2;
        v16 = *(_QWORD *)(a2 + 8);
        sub_21DBF9788(v17, v16);
        *(_QWORD *)a1 = v17;
        *(_QWORD *)(a1 + 8) = v16;
        v18 = 3;
        goto LABEL_27;
      case 4u:
        v19 = *(_QWORD *)a2;
        *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
        *(_QWORD *)a1 = v19;
        v18 = 4;
        goto LABEL_27;
      case 5u:
        *(_BYTE *)a1 = *(_BYTE *)a2;
        v18 = 5;
LABEL_27:
        *(_BYTE *)(a1 + 72) = v18;
        break;
      default:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        v8 = *(_OWORD *)(a2 + 16);
        v9 = *(_OWORD *)(a2 + 32);
        v10 = *(_OWORD *)(a2 + 48);
        *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
        *(_OWORD *)(a1 + 32) = v9;
        *(_OWORD *)(a1 + 48) = v10;
        *(_OWORD *)(a1 + 16) = v8;
        break;
    }
  }
  return a1;
}

__n128 __swift_memcpy73_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for AXTwiceCompanionState.AXTwiceCompanionEvent(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  __int128 v6;
  __int128 v7;
  char v8;
  __int128 v9;
  __int128 v10;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 72);
    if (v4 >= 6)
      v4 = *(_DWORD *)a1 + 6;
    switch(v4)
    {
      case 0u:
      case 1u:

        break;
      case 2u:
        if (*(_QWORD *)(a1 + 32))
          __swift_destroy_boxed_opaque_existential_1(a1 + 8);
        if (*(_QWORD *)(a1 + 64))
          __swift_destroy_boxed_opaque_existential_1(a1 + 40);
        break;
      case 3u:
        sub_21DBF90C4(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
        break;
      default:
        break;
    }
    v5 = *(unsigned __int8 *)(a2 + 72);
    if (v5 >= 6)
      v5 = *(_DWORD *)a2 + 6;
    switch(v5)
    {
      case 0u:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_BYTE *)(a1 + 72) = 0;
        return a1;
      case 1u:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        v8 = 1;
        goto LABEL_21;
      case 2u:
        v9 = *(_OWORD *)(a2 + 48);
        *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
        *(_OWORD *)(a1 + 48) = v9;
        *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
        v10 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v10;
        v8 = 2;
        goto LABEL_21;
      case 3u:
        *(_OWORD *)a1 = *(_OWORD *)a2;
        v8 = 3;
        goto LABEL_21;
      case 4u:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
        v8 = 4;
        goto LABEL_21;
      case 5u:
        *(_BYTE *)a1 = *(_BYTE *)a2;
        v8 = 5;
LABEL_21:
        *(_BYTE *)(a1 + 72) = v8;
        break;
      default:
        v6 = *(_OWORD *)(a2 + 48);
        *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
        *(_OWORD *)(a1 + 48) = v6;
        *(_OWORD *)(a1 + 57) = *(_OWORD *)(a2 + 57);
        v7 = *(_OWORD *)(a2 + 16);
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_OWORD *)(a1 + 16) = v7;
        break;
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for AXTwiceCompanionState.AXTwiceCompanionEvent(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xFA && *(_BYTE *)(a1 + 73))
    return (*(_DWORD *)a1 + 250);
  v3 = *(unsigned __int8 *)(a1 + 72);
  if (v3 >= 7)
    return (v3 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AXTwiceCompanionState.AXTwiceCompanionEvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xF9)
  {
    *(_OWORD *)(result + 57) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 250;
    if (a3 >= 0xFA)
      *(_BYTE *)(result + 73) = 1;
  }
  else
  {
    if (a3 >= 0xFA)
      *(_BYTE *)(result + 73) = 0;
    if (a2)
      *(_BYTE *)(result + 72) = -(char)a2;
  }
  return result;
}

uint64_t sub_21DBF9DB0(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 72);
  if (result >= 6)
    return (*(_DWORD *)a1 + 6);
  return result;
}

uint64_t sub_21DBF9DCC(uint64_t result, unsigned int a2)
{
  if (a2 > 5)
  {
    *(_QWORD *)(result + 64) = 0;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 6;
    LOBYTE(a2) = 6;
  }
  *(_BYTE *)(result + 72) = a2;
  return result;
}

ValueMetadata *type metadata accessor for AXTwiceCompanionState.AXTwiceCompanionEvent()
{
  return &type metadata for AXTwiceCompanionState.AXTwiceCompanionEvent;
}

unint64_t sub_21DBF9E14(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553A5EB8);
  v2 = (_QWORD *)sub_21DC00A2C();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_21DBFCE24(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_21DBF9F2C(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553A5EC0);
  v2 = sub_21DC00A2C();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_21DBFD930(v6, (uint64_t)v15);
    result = sub_21DBFCE88((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_21DBFD978(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_21DBFA058(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553A5ED8);
  v2 = (_QWORD *)sub_21DC00A2C();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_21DBFCE24(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_21DBFA178(uint64_t a1, uint64_t *a2)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v3 = (_QWORD *)sub_21DC00A2C();
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  swift_retain();
  v5 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v6 = *(v5 - 2);
    v7 = *(v5 - 1);
    v8 = *v5;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_21DBFCE24(v6, v7);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v6;
    v11[1] = v7;
    *(_QWORD *)(v3[7] + 8 * result) = v8;
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v5 += 3;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t static AXTwiceRemoteScreenMessageKey.jumpstart.getter()
{
  return 0xD000000000000023;
}

unint64_t static AXTwiceRemoteScreenMessageKey.start.getter()
{
  return 0xD00000000000001FLL;
}

unint64_t static AXTwiceRemoteScreenMessageKey.axStatus.getter()
{
  return 0xD000000000000022;
}

unint64_t static AXTwiceRemoteScreenMessageKey.airplay.getter()
{
  return 0xD000000000000021;
}

unint64_t static AXTwiceRemoteScreenMessageKey.streaming.getter()
{
  return 0xD000000000000023;
}

unint64_t static AXTwiceRemoteScreenMessageKey.touchEvent.getter()
{
  return 0xD000000000000024;
}

unint64_t static AXTwiceRemoteScreenMessageKey.axTree.getter()
{
  return 0xD000000000000020;
}

unint64_t static AXTwiceRemoteScreenMessageKey.dismiss.getter()
{
  return 0xD000000000000021;
}

unint64_t static AXTwiceRemoteScreenMessageKey.reset.getter()
{
  return 0xD00000000000001FLL;
}

unint64_t static AXTwiceRemoteScreenMessageKey.ids.getter()
{
  return 0xD00000000000001DLL;
}

unint64_t static AXTwiceRemoteScreenMessageKey.systemLock.getter()
{
  return 0xD000000000000024;
}

void sub_21DBFA3C0()
{
  qword_2553A5CC0 = 0x74736575716572;
  *(_QWORD *)algn_2553A5CC8 = 0xE700000000000000;
}

uint64_t static AXTwiceRemoteScreenMessageKey.request.getter()
{
  return sub_21DBFA7B8(&qword_2553A5998, &qword_2553A5CC0);
}

void sub_21DBFA404()
{
  qword_2553A5CD0 = 0x73736563637573;
  *(_QWORD *)algn_2553A5CD8 = 0xE700000000000000;
}

uint64_t static AXTwiceRemoteScreenMessageKey.sucess.getter()
{
  return sub_21DBFA7B8(&qword_2553A59A0, &qword_2553A5CD0);
}

void sub_21DBFA448()
{
  qword_2553A5CE0 = 0x6572756C696166;
  *(_QWORD *)algn_2553A5CE8 = 0xE700000000000000;
}

uint64_t static AXTwiceRemoteScreenMessageKey.failure.getter()
{
  return sub_21DBFA7B8(&qword_2553A59A8, &qword_2553A5CE0);
}

void sub_21DBFA48C()
{
  qword_2553A5CF0 = 0x6F656D6954736469;
  *(_QWORD *)algn_2553A5CF8 = 0xEA00000000007475;
}

uint64_t static AXTwiceRemoteScreenMessageKey.idsTimeout.getter()
{
  return sub_21DBFA7B8(&qword_2553A59B0, &qword_2553A5CF0);
}

void sub_21DBFA4D4()
{
  qword_2553A5D00 = 0x6567617373656DLL;
  qword_2553A5D08 = 0xE700000000000000;
}

uint64_t static AXTwiceRemoteScreenMessageKey.idsMessage.getter()
{
  return sub_21DBFA7B8(&qword_2553A59B8, &qword_2553A5D00);
}

void sub_21DBFA518()
{
  qword_2553A5D10 = 0x696669746E656469;
  qword_2553A5D18 = 0xEA00000000007265;
}

uint64_t static AXTwiceRemoteScreenMessageKey.idsMessageIdentifier.getter()
{
  return sub_21DBFA7B8(&qword_2553A59C0, &qword_2553A5D10);
}

unint64_t static AXTwiceRemoteScreenEventPayloadKey.isGeneratedEvent.getter()
{
  return 0xD000000000000010;
}

void sub_21DBFA57C()
{
  qword_2553A5D20 = 0x69746172656E6567;
  *(_QWORD *)algn_2553A5D28 = 0xEF746E756F436E6FLL;
}

uint64_t static AXTwiceRemoteScreenEventPayloadKey.generationCount.getter()
{
  return sub_21DBFA7B8(&qword_2553A59C8, &qword_2553A5D20);
}

void sub_21DBFA5CC()
{
  strcpy((char *)&qword_2553A5D30, "willUpdateMask");
  algn_2553A5D38[7] = -18;
}

uint64_t static AXTwiceRemoteScreenEventPayloadKey.willUpdateMask.getter()
{
  return sub_21DBFA7B8(&qword_2553A59D0, &qword_2553A5D30);
}

void sub_21DBFA61C()
{
  strcpy((char *)&qword_2553A5D40, "didUpdateMask");
  *(_WORD *)&algn_2553A5D48[6] = -4864;
}

uint64_t static AXTwiceRemoteScreenEventPayloadKey.didUpdateMask.getter()
{
  return sub_21DBFA7B8(&qword_2553A59D8, &qword_2553A5D40);
}

unint64_t static AXTwiceRemoteScreenEventPayloadKey.useOriginalHIDTime.getter()
{
  return 0xD000000000000012;
}

void sub_21DBFA688()
{
  qword_2553A5D50 = 0x656D6954646968;
  *(_QWORD *)algn_2553A5D58 = 0xE700000000000000;
}

uint64_t static AXTwiceRemoteScreenEventPayloadKey.hidTime.getter()
{
  return sub_21DBFA7B8(&qword_2553A59E0, &qword_2553A5D50);
}

unint64_t static AXTwiceRemoteScreenEventPayloadKey.isDisplayIntegrated.getter()
{
  return 0xD000000000000013;
}

void sub_21DBFA6E8()
{
  qword_2553A5D60 = 0x44497265646E6573;
  *(_QWORD *)algn_2553A5D68 = 0xE800000000000000;
}

uint64_t static AXTwiceRemoteScreenEventPayloadKey.senderID.getter()
{
  return sub_21DBFA7B8(&qword_2553A59E8, &qword_2553A5D60);
}

void sub_21DBFA72C()
{
  qword_2553A5D70 = 0x49747865746E6F63;
  *(_QWORD *)algn_2553A5D78 = 0xE900000000000064;
}

uint64_t static AXTwiceRemoteScreenEventPayloadKey.contextId.getter()
{
  return sub_21DBFA7B8(&qword_2553A59F0, &qword_2553A5D70);
}

void sub_21DBFA774()
{
  qword_2553A5D80 = 0x6F666E49646E6168;
  *(_QWORD *)algn_2553A5D88 = 0xE800000000000000;
}

uint64_t static AXTwiceRemoteScreenEventPayloadKey.handInfo.getter()
{
  return sub_21DBFA7B8(&qword_2553A59F8, &qword_2553A5D80);
}

uint64_t sub_21DBFA7B8(_QWORD *a1, uint64_t *a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

unint64_t static AXTwiceRemoteScreenEventPayloadKey.hidAttributeData.getter()
{
  return 0xD000000000000010;
}

id sub_21DBFA824()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AXTwiceRemoteScreenMessenger()), sel_init);
  qword_2553A5D90 = (uint64_t)result;
  return result;
}

id static AXTwiceRemoteScreenMessenger.sharedInstance.getter()
{
  if (qword_2553A5A00 != -1)
    swift_once();
  return (id)qword_2553A5D90;
}

uint64_t AXTwiceRemoteScreenMessenger.delegate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger_delegate;
  swift_beginAccess();
  return MEMORY[0x22079C78C](v1);
}

uint64_t AXTwiceRemoteScreenMessenger.delegate.setter()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*AXTwiceRemoteScreenMessenger.delegate.modify(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR____TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x22079C78C](v5);
  return sub_21DBFAA78;
}

void sub_21DBFAA78(void **a1, char a2)
{
  void *v3;

  v3 = *a1;
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

id AXTwiceRemoteScreenMessenger.__deallocating_deinit()
{
  void *v0;
  objc_class *ObjectType;
  id result;
  void *v3;
  objc_super v4;

  ObjectType = (objc_class *)swift_getObjectType();
  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (result)
  {
    v3 = result;
    objc_msgSend(result, sel_deregisterForIncomingData_, v0);

    v4.receiver = v0;
    v4.super_class = ObjectType;
    return objc_msgSendSuper2(&v4, sel_dealloc);
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall AXTwiceRemoteScreenMessenger.cleanup()()
{
  uint64_t v0;
  id v1;
  id v2;

  v1 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, sel_deregisterForIncomingData_, v0);

  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall AXTwiceRemoteScreenMessenger.reconnectToAXUIServerIfNeeded()()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  unsigned __int8 v4;
  id v5;
  void *v6;
  uint64_t v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  NSObject *oslog;
  uint64_t v12;

  v1 = (void *)objc_opt_self();
  v2 = objc_msgSend(v1, sel_sharedInstance);
  if (!v2)
  {
    __break(1u);
    goto LABEL_11;
  }
  v3 = v2;
  v4 = objc_msgSend(v2, sel_containsClient_, v0);

  if ((v4 & 1) != 0)
    return;
  v5 = objc_msgSend(v1, sel_sharedInstance);
  if (!v5)
  {
LABEL_11:
    __break(1u);
    return;
  }
  v6 = v5;
  objc_msgSend(v5, sel_registerForIncomingData_, v0);

  if (qword_2540EA980 != -1)
    swift_once();
  v7 = sub_21DC00870();
  __swift_project_value_buffer(v7, (uint64_t)qword_2540EA988);
  oslog = sub_21DC00858();
  v8 = sub_21DC0096C();
  if (os_log_type_enabled(oslog, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v12 = v10;
    *(_DWORD *)v9 = 136315138;
    sub_21DBFC848(0xD00000000000001FLL, 0x800000021DC020F0, &v12);
    sub_21DC0099C();
    _os_log_impl(&dword_21DBF3000, oslog, v8, "[TWICE] %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22079C744](v10, -1, -1);
    MEMORY[0x22079C744](v9, -1, -1);

  }
  else
  {

  }
}

Swift::Bool __swiftcall AXTwiceRemoteScreenMessenger.isDeviceConnected()()
{
  id v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (!v0)
  {
    __break(1u);
    return (char)v0;
  }
  v1 = v0;
  v2 = objc_msgSend(v0, sel_connectedDevices);

  if (!v2
    || (__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2553A5DA0),
        v3 = sub_21DC0093C(),
        v2,
        v4 = sub_21DBFB120(v3),
        swift_bridgeObjectRelease(),
        !v4))
  {
    v6 = 0;
    goto LABEL_9;
  }
  v5 = *(_QWORD *)(v4 + 16);
  if (!v5 || _AXSTwiceRemoteScreenPlatform())
  {
LABEL_6:
    v6 = 0;
    goto LABEL_7;
  }
  v7 = (uint64_t *)(v4 + 32);
  while (1)
  {
    v8 = *v7;
    v9 = sub_21DC008AC();
    v11 = v10;
    if (*(_QWORD *)(v8 + 16))
      break;
LABEL_11:
    swift_bridgeObjectRelease();
LABEL_12:
    ++v7;
    if (!--v5)
      goto LABEL_6;
  }
  v12 = v9;
  swift_bridgeObjectRetain();
  sub_21DBFCE24(v12, v11);
  if ((v13 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (qword_2553A5A08 != -1)
    swift_once();
  v14 = _s27AXWatchRemoteScreenServices08AXDevicebC4UtilC22isPairedGizmoSupported8deviceIDSbSS_tF_0();
  swift_bridgeObjectRelease();
  if ((v14 & 1) == 0)
    goto LABEL_12;
  v6 = 1;
LABEL_7:
  swift_bridgeObjectRelease();
LABEL_9:
  LOBYTE(v0) = v6;
  return (char)v0;
}

uint64_t sub_21DBFB120(uint64_t a1)
{
  int64_t v2;
  uint64_t v3;
  uint64_t i;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 16);
  v9 = MEMORY[0x24BEE4AF8];
  sub_21DBFD05C(0, v2, 0);
  v3 = v9;
  if (v2)
  {
    for (i = a1 + 32; ; i += 8)
    {
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2553A5DA0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2553A5F08);
      if (!swift_dynamicCast())
        break;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_21DBFD05C(0, *(_QWORD *)(v3 + 16) + 1, 1);
        v3 = v9;
      }
      v6 = *(_QWORD *)(v3 + 16);
      v5 = *(_QWORD *)(v3 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_21DBFD05C(v5 > 1, v6 + 1, 1);
        v3 = v9;
      }
      *(_QWORD *)(v3 + 16) = v6 + 1;
      *(_QWORD *)(v3 + 8 * v6 + 32) = v8;
      if (!--v2)
        return v3;
    }
    swift_release();
    swift_bridgeObjectRelease();
    return 0;
  }
  return v3;
}

void AXTwiceRemoteScreenMessenger.sendData(_:)()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (v0)
  {
    v1 = v0;
    v2 = (id)sub_21DC007EC();

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_21DBFB304(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _OWORD v35[2];
  _OWORD v36[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2553A5EC0);
    v2 = sub_21DC00A2C();
  }
  else
  {
    v2 = MEMORY[0x24BEE4B00];
  }
  v27 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v26 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v26)
        goto LABEL_37;
      v14 = *(_QWORD *)(v27 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v26)
          goto LABEL_37;
        v14 = *(_QWORD *)(v27 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v26)
            goto LABEL_37;
          v14 = *(_QWORD *)(v27 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v18 = v17[1];
    *(_QWORD *)&v36[0] = *v17;
    *((_QWORD *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2553A5DA0);
    swift_dynamicCast();
    v32 = v28;
    v33 = v29;
    v34 = v30;
    sub_21DBFD978(&v31, v35);
    v28 = v32;
    v29 = v33;
    v30 = v34;
    sub_21DBFD978(v35, v36);
    sub_21DBFD978(v36, &v32);
    result = sub_21DC009CC();
    v19 = -1 << *(_BYTE *)(v2 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(_QWORD *)(v10 + 32) = v30;
    result = (uint64_t)sub_21DBFD978(&v32, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_21DBFDA00();
    return v2;
  }
  v14 = *(_QWORD *)(v27 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

unint64_t sub_21DBFB6B8(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t result;
  int64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  char v17;
  uint64_t *v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE v26[40];
  _OWORD v27[2];
  _OWORD v28[2];
  uint64_t v29;
  _OWORD v30[2];
  _OWORD v31[2];
  uint64_t v32;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2553A5EF0);
    v2 = (_QWORD *)sub_21DC00A2C();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v23 = a1 + 64;
  v3 = -1;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v3 = ~(-1 << -(char)v4);
  v5 = v3 & *(_QWORD *)(a1 + 64);
  v22 = (unint64_t)(63 - v4) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  if (v5)
    goto LABEL_9;
LABEL_10:
  v13 = v7 + 1;
  if (__OFADD__(v7, 1))
    goto LABEL_40;
  if (v13 >= v22)
    goto LABEL_36;
  v14 = *(_QWORD *)(v23 + 8 * v13);
  v12 = v7 + 1;
  if (!v14)
  {
    v12 = v7 + 2;
    if (v7 + 2 >= v22)
      goto LABEL_36;
    v14 = *(_QWORD *)(v23 + 8 * v12);
    if (!v14)
    {
      v12 = v7 + 3;
      if (v7 + 3 >= v22)
        goto LABEL_36;
      v14 = *(_QWORD *)(v23 + 8 * v12);
      if (!v14)
      {
        v12 = v7 + 4;
        if (v7 + 4 >= v22)
          goto LABEL_36;
        v14 = *(_QWORD *)(v23 + 8 * v12);
        if (!v14)
        {
          v15 = v7 + 5;
          if (v7 + 5 < v22)
          {
            v14 = *(_QWORD *)(v23 + 8 * v15);
            if (v14)
            {
              v12 = v7 + 5;
              goto LABEL_25;
            }
            while (1)
            {
              v12 = v15 + 1;
              if (__OFADD__(v15, 1))
                goto LABEL_41;
              if (v12 >= v22)
                break;
              v14 = *(_QWORD *)(v23 + 8 * v12);
              ++v15;
              if (v14)
                goto LABEL_25;
            }
          }
LABEL_36:
          sub_21DBFDA00();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_25:
  v10 = (v14 - 1) & v14;
  v11 = __clz(__rbit64(v14)) + (v12 << 6);
  while (1)
  {
    sub_21DBFD988(*(_QWORD *)(a1 + 48) + 40 * v11, (uint64_t)v30);
    sub_21DBFD7E8(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)v31 + 8);
    v28[0] = v31[0];
    v28[1] = v31[1];
    v29 = v32;
    v27[0] = v30[0];
    v27[1] = v30[1];
    sub_21DBFD988((uint64_t)v27, (uint64_t)v26);
    if (!swift_dynamicCast())
    {
      sub_21DBFD9C4((uint64_t)v27, &qword_2553A5EF8);
      swift_bridgeObjectRelease();
LABEL_35:
      sub_21DBFDA00();
      swift_release();
      return 0;
    }
    sub_21DBFD7E8((uint64_t)v28 + 8, (uint64_t)v26);
    sub_21DBFD9C4((uint64_t)v27, &qword_2553A5EF8);
    if ((swift_dynamicCast() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      swift_unknownObjectRelease();
      goto LABEL_35;
    }
    v5 = v10;
    result = sub_21DBFCE24(v24, v25);
    v16 = result;
    if ((v17 & 1) != 0)
    {
      v8 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v8 = v24;
      v8[1] = v25;
      v9 = v2[7];
      result = swift_unknownObjectRelease();
      *(_QWORD *)(v9 + 8 * v16) = v24;
      v7 = v12;
      if (!v10)
        goto LABEL_10;
      goto LABEL_9;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v18 = (uint64_t *)(v2[6] + 16 * result);
    *v18 = v24;
    v18[1] = v25;
    *(_QWORD *)(v2[7] + 8 * result) = v24;
    v19 = v2[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_39;
    v2[2] = v21;
    v7 = v12;
    if (!v10)
      goto LABEL_10;
LABEL_9:
    v10 = (v5 - 1) & v5;
    v11 = __clz(__rbit64(v5)) | (v7 << 6);
    v12 = v7;
  }
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

Swift::Void __swiftcall AXTwiceRemoteScreenMessenger.receiveMessage(_:)(Swift::OpaquePointer a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v4;
  char v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char v18;
  unint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30[5];
  __int128 v31;
  __int128 v32;

  v2 = v1;
  v27 = sub_21DC008AC();
  sub_21DC009E4();
  if (*((_QWORD *)a1._rawValue + 2) && (v4 = sub_21DBFCE88((uint64_t)v30), (v5 & 1) != 0))
  {
    sub_21DBFD7E8(*((_QWORD *)a1._rawValue + 7) + 32 * v4, (uint64_t)&v31);
  }
  else
  {
    v31 = 0u;
    v32 = 0u;
  }
  sub_21DBFD7B4((uint64_t)v30);
  if (!*((_QWORD *)&v32 + 1))
    goto LABEL_17;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2553A5DA0);
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_18;
  sub_21DC009E4();
  if (*(_QWORD *)(v27 + 16) && (v6 = sub_21DBFCE88((uint64_t)v30), (v7 & 1) != 0))
  {
    sub_21DBFD7E8(*(_QWORD *)(v27 + 56) + 32 * v6, (uint64_t)&v31);
  }
  else
  {
    v31 = 0u;
    v32 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_21DBFD7B4((uint64_t)v30);
  if (!*((_QWORD *)&v32 + 1))
  {
LABEL_17:
    sub_21DBFD9C4((uint64_t)&v31, &qword_2553A5CA0);
    goto LABEL_18;
  }
  if ((swift_dynamicCast() & 1) != 0)
  {
    if (qword_2540EA980 != -1)
      swift_once();
    v8 = sub_21DC00870();
    __swift_project_value_buffer(v8, (uint64_t)qword_2540EA988);
    swift_bridgeObjectRetain_n();
    v9 = sub_21DC00858();
    v10 = sub_21DC0096C();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v30[0] = v12;
      *(_DWORD *)v11 = 136315138;
      swift_bridgeObjectRetain();
      v13 = sub_21DC00894();
      v15 = v14;
      swift_bridgeObjectRelease();
      *(_QWORD *)&v31 = sub_21DBFC848(v13, v15, v30);
      sub_21DC0099C();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21DBF3000, v9, v10, "[TWICE] Receive message: %s", v11, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22079C744](v12, -1, -1);
      MEMORY[0x22079C744](v11, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v25 = v2 + OBJC_IVAR____TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger_delegate;
    swift_beginAccess();
    v26 = MEMORY[0x22079C78C](v25);
    if (v26)
    {
      v23 = (void *)v26;
      v24 = (void *)sub_21DC0087C();
      swift_bridgeObjectRelease();
      goto LABEL_34;
    }
    swift_bridgeObjectRelease();
    return;
  }
LABEL_18:
  v28 = sub_21DC008AC();
  v29 = v16;
  sub_21DC009E4();
  if (*((_QWORD *)a1._rawValue + 2) && (v17 = sub_21DBFCE88((uint64_t)v30), (v18 & 1) != 0))
  {
    sub_21DBFD7E8(*((_QWORD *)a1._rawValue + 7) + 32 * v17, (uint64_t)&v31);
  }
  else
  {
    v31 = 0u;
    v32 = 0u;
  }
  sub_21DBFD7B4((uint64_t)v30);
  if (!*((_QWORD *)&v32 + 1))
  {
    sub_21DBFD9C4((uint64_t)&v31, &qword_2553A5CA0);
LABEL_26:
    sub_21DC008AC();
    sub_21DC009E4();
    if (*((_QWORD *)a1._rawValue + 2) && (v19 = sub_21DBFCE88((uint64_t)v30), (v20 & 1) != 0))
    {
      sub_21DBFD7E8(*((_QWORD *)a1._rawValue + 7) + 32 * v19, (uint64_t)&v31);
    }
    else
    {
      v31 = 0u;
      v32 = 0u;
    }
    sub_21DBFD7B4((uint64_t)v30);
    if (!*((_QWORD *)&v32 + 1))
    {
      sub_21DBFD9C4((uint64_t)&v31, &qword_2553A5CA0);
      return;
    }
    if (!swift_dynamicCast())
      return;
    goto LABEL_32;
  }
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_26;
  sub_21DBF90C4(v28, v29);
LABEL_32:
  v21 = v1 + OBJC_IVAR____TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger_delegate;
  swift_beginAccess();
  v22 = MEMORY[0x22079C78C](v21);
  if (v22)
  {
    v23 = (void *)v22;
    v24 = (void *)sub_21DC0087C();
LABEL_34:
    objc_msgSend(v23, sel_twiceRemoteScreenReceiveMessage_, v24);

    swift_unknownObjectRelease();
  }
}

Swift::Void __swiftcall AXTwiceRemoteScreenMessenger.didReceiveIncomingData(_:)(Swift::OpaquePointer_optional a1)
{
  if (a1.value._rawValue)
    AXTwiceRemoteScreenMessenger.receiveMessage(_:)(a1.value);
  else
    __break(1u);
}

Swift::Void __swiftcall AXTwiceRemoteScreenMessenger.connectedDevicesDidChange(_:)(Swift::OpaquePointer_optional a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *rawValue;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t inited;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28[2];

  v2 = v1;
  rawValue = a1.value._rawValue;
  v4 = sub_21DC00870();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_2540EA980 != -1)
    swift_once();
  v8 = __swift_project_value_buffer(v4, (uint64_t)qword_2540EA988);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  swift_bridgeObjectRetain_n();
  v9 = sub_21DC00858();
  v10 = sub_21DC00960();
  if (os_log_type_enabled(v9, v10))
  {
    v25 = v5;
    *(_QWORD *)&v26 = v2;
    v11 = swift_slowAlloc();
    v24 = swift_slowAlloc();
    v28[0] = v24;
    *(_DWORD *)v11 = 136315394;
    v27 = sub_21DBFC848(0xD00000000000001DLL, 0x800000021DC02130, v28);
    sub_21DC0099C();
    *(_WORD *)(v11 + 12) = 2080;
    if (rawValue)
    {
      swift_bridgeObjectRetain();
      v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2553A5DA0);
      v13 = MEMORY[0x22079C210](rawValue, v12);
      v15 = v14;
      swift_bridgeObjectRelease();
      v27 = sub_21DBFC848(v13, v15, v28);
      sub_21DC0099C();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_21DBF3000, v9, v10, "[TWICE] %s %s", (uint8_t *)v11, 0x16u);
      v16 = v24;
      swift_arrayDestroy();
      MEMORY[0x22079C744](v16, -1, -1);
      MEMORY[0x22079C744](v11, -1, -1);

      (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v4);
      goto LABEL_7;
    }
    __break(1u);
LABEL_13:
    __break(1u);
    return;
  }

  swift_bridgeObjectRelease_n();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (!rawValue)
    goto LABEL_13;
LABEL_7:
  if (!rawValue[2])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2553A5DB0);
    inited = swift_initStackObject();
    v26 = xmmword_21DC01170;
    *(_OWORD *)(inited + 16) = xmmword_21DC01170;
    *(_QWORD *)(inited + 32) = 0xD00000000000001ALL;
    *(_QWORD *)(inited + 40) = 0x800000021DC02110;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2553A5DB8);
    v18 = swift_initStackObject();
    *(_OWORD *)(v18 + 16) = v26;
    *(_QWORD *)(v18 + 32) = 0xD00000000000001DLL;
    *(_QWORD *)(v18 + 40) = 0x800000021DC02020;
    if (qword_2553A59A8 != -1)
      swift_once();
    v19 = *(_QWORD *)algn_2553A5CE8;
    *(_QWORD *)(v18 + 48) = qword_2553A5CE0;
    *(_QWORD *)(v18 + 56) = v19;
    swift_bridgeObjectRetain();
    *(_QWORD *)(inited + 48) = sub_21DBFA058(v18);
    v20 = sub_21DBFA178(inited, &qword_2553A5ED0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2553A5DC0);
    v21 = swift_initStackObject();
    *(_OWORD *)(v21 + 16) = v26;
    v28[0] = sub_21DC008AC();
    v28[1] = v22;
    sub_21DC009E4();
    *(_QWORD *)(v21 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_2553A5DC8);
    *(_QWORD *)(v21 + 72) = v20;
    v23 = sub_21DBF9F2C(v21);
    AXTwiceRemoteScreenMessenger.receiveMessage(_:)((Swift::OpaquePointer)v23);
    swift_bridgeObjectRelease();
  }
}

Swift::Void __swiftcall AXTwiceRemoteScreenMessenger.serverConnectionWasInterrupted()()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v5;

  if (qword_2540EA980 != -1)
    swift_once();
  v0 = sub_21DC00870();
  __swift_project_value_buffer(v0, (uint64_t)qword_2540EA988);
  v1 = sub_21DC00858();
  v2 = sub_21DC00960();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    v4 = swift_slowAlloc();
    v5 = v4;
    *(_DWORD *)v3 = 136315138;
    sub_21DBFC848(0xD000000000000020, 0x800000021DC02150, &v5);
    sub_21DC0099C();
    _os_log_impl(&dword_21DBF3000, v1, v2, "[TWICE] %s", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22079C744](v4, -1, -1);
    MEMORY[0x22079C744](v3, -1, -1);
  }

  if (_AXSTwiceRemoteScreenEnabled())
    AXTwiceRemoteScreenMessenger.reconnectToAXUIServerIfNeeded()();
}

uint64_t sub_21DBFC848(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_21DBFC918(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21DBFD7E8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_21DBFD7E8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_21DBFC918(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_21DC009A8();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_21DBFCAD0(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_21DC00A08();
  if (!v8)
  {
    sub_21DC00A20();
    __break(1u);
LABEL_17:
    result = sub_21DC00A38();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_21DBFCAD0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_21DBFCB64(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_21DBFCCD8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_21DBFCCD8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21DBFCB64(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_21DBFEB30(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_21DC009FC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_21DC00A20();
      __break(1u);
LABEL_10:
      v2 = sub_21DC008DC();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_21DC00A38();
    __break(1u);
LABEL_14:
    result = sub_21DC00A20();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

uint64_t sub_21DBFCCD8(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540EA948);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_21DC00A38();
  __break(1u);
  return result;
}

unint64_t sub_21DBFCE24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_21DC00A98();
  sub_21DC008C4();
  v4 = sub_21DC00AB0();
  return sub_21DBFCEB8(a1, a2, v4);
}

unint64_t sub_21DBFCE88(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21DC009CC();
  return sub_21DBFCF98(a1, v2);
}

unint64_t sub_21DBFCEB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_21DC00A5C() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_21DC00A5C() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_21DBFCF98(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_21DBFD988(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x22079C2A0](v9, a1);
      sub_21DBFD7B4((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_21DBFD05C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_21DBFD078(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_21DBFD078(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2553A5F10);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v13 = (unint64_t)(v10 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8)
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2553A5F08);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_21DC00A38();
  __break(1u);
  return result;
}

id _s27AXWatchRemoteScreenServices07AXTwicebC9MessengerC11sendMessageySSSgSDys11AnyHashableVypGF_0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t inited;
  unint64_t v7;
  id result;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44[2];
  uint64_t v45;

  v2 = sub_21DC00870();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2553A5EE0);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21DC01170;
  *(_QWORD *)(inited + 32) = 0xD00000000000001ALL;
  *(_QWORD *)(inited + 40) = 0x800000021DC02110;
  *(_QWORD *)(inited + 48) = a1;
  swift_bridgeObjectRetain();
  v7 = sub_21DBFA178(inited, &qword_2553A5F00);
  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (!result)
  {
    __break(1u);
    return result;
  }
  v9 = result;
  sub_21DBFB304(v7);
  swift_bridgeObjectRelease();
  v10 = MEMORY[0x24BEE4AD8];
  v11 = (void *)sub_21DC0087C();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v9, sel_publishDirectIDSMessage_, v11);

  if (v12)
  {
    v13 = sub_21DC00888();

    v14 = sub_21DBFB6B8(v13);
    swift_bridgeObjectRelease();
    if (!v14)
    {
LABEL_20:
      v27 = 0;
      v12 = 0;
      goto LABEL_21;
    }
    if (qword_2553A59B8 == -1)
    {
      if (*(_QWORD *)(v14 + 16))
      {
LABEL_6:
        v15 = qword_2553A5D08;
        v16 = qword_2553A5D00;
        swift_bridgeObjectRetain();
        v17 = sub_21DBFCE24(v16, v15);
        if ((v18 & 1) != 0)
        {
          v19 = *(_QWORD *)(*(_QWORD *)(v14 + 56) + 8 * v17);
          swift_unknownObjectRetain();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v44[0] = v19;
          __swift_instantiateConcreteTypeFromMangledName(&qword_2553A5EE8);
          if ((swift_dynamicCast() & 1) == 0)
          {
LABEL_35:
            v27 = 0;
            v12 = 0;
            goto LABEL_21;
          }
          v20 = v45;
          if (qword_2553A59C0 == -1)
          {
            if (*(_QWORD *)(v45 + 16))
            {
LABEL_10:
              v21 = qword_2553A5D18;
              v22 = qword_2553A5D10;
              swift_bridgeObjectRetain();
              v23 = sub_21DBFCE24(v22, v21);
              if ((v24 & 1) != 0)
              {
                v25 = *(_QWORD *)(*(_QWORD *)(v20 + 56) + 8 * v23);
                swift_unknownObjectRetain();
                swift_bridgeObjectRelease();
                swift_bridgeObjectRelease();
                v45 = v25;
                v26 = swift_dynamicCast();
                if (v26)
                  v27 = v44[0];
                else
                  v27 = 0;
                if (v26)
                  v12 = (id)v44[1];
                else
                  v12 = 0;
                goto LABEL_21;
              }
              swift_bridgeObjectRelease();
            }
          }
          else
          {
            swift_once();
            if (*(_QWORD *)(v20 + 16))
              goto LABEL_10;
          }
          swift_bridgeObjectRelease();
          goto LABEL_35;
        }
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      swift_once();
      if (*(_QWORD *)(v14 + 16))
        goto LABEL_6;
    }
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  v27 = 0;
LABEL_21:
  if (qword_2540EA980 != -1)
    swift_once();
  v28 = __swift_project_value_buffer(v2, (uint64_t)qword_2540EA988);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v28, v2);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v29 = sub_21DC00858();
  v30 = sub_21DC0096C();
  if (os_log_type_enabled(v29, v30))
  {
    v31 = swift_slowAlloc();
    v32 = swift_slowAlloc();
    v43 = v2;
    v44[0] = v32;
    v33 = v32;
    *(_DWORD *)v31 = 136315394;
    v42 = v5;
    swift_bridgeObjectRetain();
    v40 = v10 + 8;
    v41 = v3;
    v34 = sub_21DC00894();
    v35 = v27;
    v37 = v36;
    swift_bridgeObjectRelease();
    v45 = sub_21DBFC848(v34, v37, v44);
    sub_21DC0099C();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v31 + 12) = 2080;
    if (v12)
      v38 = v35;
    else
      v38 = 0x6E776F6E6B6E75;
    if (v12)
      v39 = (unint64_t)v12;
    else
      v39 = 0xE700000000000000;
    swift_bridgeObjectRetain();
    v45 = sub_21DBFC848(v38, v39, v44);
    v27 = v35;
    sub_21DC0099C();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_21DBF3000, v29, v30, "[TWICE] Publish message: %s, with identifier %s", (uint8_t *)v31, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22079C744](v33, -1, -1);
    MEMORY[0x22079C744](v31, -1, -1);

    (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v43);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return (id)v27;
}

uint64_t sub_21DBFD7B4(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_21DBFD7E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_21DBFD824@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1 + OBJC_IVAR____TtC27AXWatchRemoteScreenServices28AXTwiceRemoteScreenMessenger_delegate;
  swift_beginAccess();
  result = MEMORY[0x22079C78C](v3);
  *a2 = result;
  return result;
}

uint64_t sub_21DBFD878()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

ValueMetadata *type metadata accessor for AXTwiceRemoteScreenMessageKey()
{
  return &type metadata for AXTwiceRemoteScreenMessageKey;
}

ValueMetadata *type metadata accessor for AXTwiceRemoteScreenEventPayloadKey()
{
  return &type metadata for AXTwiceRemoteScreenEventPayloadKey;
}

uint64_t type metadata accessor for AXTwiceRemoteScreenMessenger()
{
  return objc_opt_self();
}

uint64_t sub_21DBFD90C(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_21DBFD930(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553A5EC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_21DBFD978(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_21DBFD988(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_21DBFD9C4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21DBFDA00()
{
  return swift_release();
}

id sub_21DBFDA10()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for AXDeviceRemoteScreenUtil()), sel_init);
  qword_2553A5F18 = (uint64_t)result;
  return result;
}

id AXDeviceRemoteScreenUtil.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id static AXDeviceRemoteScreenUtil.sharedInstance.getter()
{
  if (qword_2553A5A08 != -1)
    swift_once();
  return (id)qword_2553A5F18;
}

void sub_21DBFDADC()
{
  strcpy((char *)&qword_2553A5F20, "Accessibility");
  *(_WORD *)&algn_2553A5F28[6] = -4864;
}

uint64_t static AXDeviceRemoteScreenUtil.AXWatchRemoteScreenFeatureDomain.getter()
{
  uint64_t v0;

  if (qword_2553A5A10 != -1)
    swift_once();
  v0 = qword_2553A5F20;
  swift_bridgeObjectRetain();
  return v0;
}

unint64_t static AXDeviceRemoteScreenUtil.AXWatchRemoteScreenFeatureKey.getter()
{
  return 0xD000000000000012;
}

uint64_t AXDeviceRemoteScreenUtil.caSessionIntervalEvent.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___AXDeviceRemoteScreenUtil_caSessionIntervalEvent);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AXDeviceRemoteScreenUtil.caSessionIntervalKey.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___AXDeviceRemoteScreenUtil_caSessionIntervalKey);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AXDeviceRemoteScreenUtil.caErrorEvent.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___AXDeviceRemoteScreenUtil_caErrorEvent);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AXDeviceRemoteScreenUtil.caErrorKey.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___AXDeviceRemoteScreenUtil_caErrorKey);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t AXDeviceRemoteScreenUtil.caInactiveEvent.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___AXDeviceRemoteScreenUtil_caInactiveEvent);
  swift_bridgeObjectRetain();
  return v1;
}

id sub_21DBFDD80()
{
  void *v0;

  swift_bridgeObjectRetain();
  v0 = (void *)sub_21DC008A0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AXDeviceRemoteScreenUtil.caInactiveKey.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___AXDeviceRemoteScreenUtil_caInactiveKey);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_21DBFDE00()
{
  return 1;
}

uint64_t sub_21DBFDE08()
{
  sub_21DC00A98();
  sub_21DC00AA4();
  return sub_21DC00AB0();
}

uint64_t sub_21DBFDE48()
{
  return sub_21DC00AA4();
}

uint64_t sub_21DBFDE6C()
{
  sub_21DC00A98();
  sub_21DC00AA4();
  return sub_21DC00AB0();
}

const char *sub_21DBFDEA8()
{
  return "Accessibility";
}

const char *sub_21DBFDEBC()
{
  return "Twice_RemoteScreen";
}

Swift::Bool __swiftcall AXDeviceRemoteScreenUtil.isTwiceFeatureOn()()
{
  char v0;
  _BYTE v2[24];
  ValueMetadata *v3;
  unint64_t v4;

  v3 = &type metadata for AXDeviceRemoteScreenUtil.AXWatchRemoteScreenFeatureFlags;
  v4 = sub_21DBFF71C();
  v0 = sub_21DC0084C();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
  return v0 & 1;
}

Swift::String __swiftcall AXDeviceRemoteScreenUtil.localizedString(key:)(Swift::String key)
{
  uint64_t v1;
  void *v2;
  Swift::String result;

  v1 = sub_21DBFF760();
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

Swift::String __swiftcall AXDeviceRemoteScreenUtil.localizedStingString(key:)(Swift::String key)
{
  uint64_t v1;
  void *v2;
  Swift::String result;

  v1 = sub_21DBFF760();
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

id sub_21DBFE018(void *a1)
{
  id v2;
  void *v3;

  sub_21DC008AC();
  v2 = a1;
  sub_21DBFF760();

  swift_bridgeObjectRelease();
  v3 = (void *)sub_21DC008A0();
  swift_bridgeObjectRelease();
  return v3;
}

void AXDeviceRemoteScreenUtil.logSessionInterval(beforeDate:afterDate:)()
{
  void *v0;
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[6];

  v1 = v0;
  sub_21DC007F8();
  v3 = v2;
  sub_21DC007F8();
  v5 = v3 - v4;
  v6 = (void *)sub_21DC008A0();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v1;
  *(double *)(v7 + 24) = v5;
  v10[4] = sub_21DC00474;
  v10[5] = v7;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 1107296256;
  v10[2] = sub_21DBF6AEC;
  v10[3] = &block_descriptor_1;
  v8 = _Block_copy(v10);
  v9 = v1;
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v8);

}

unint64_t sub_21DBFE284(uint64_t a1)
{
  uint64_t inited;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2553A5BE8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21DC01170;
  v3 = *(_QWORD *)(a1 + OBJC_IVAR___AXDeviceRemoteScreenUtil_caSessionIntervalKey + 8);
  *(_QWORD *)(inited + 32) = *(_QWORD *)(a1 + OBJC_IVAR___AXDeviceRemoteScreenUtil_caSessionIntervalKey);
  *(_QWORD *)(inited + 40) = v3;
  swift_bridgeObjectRetain();
  *(_QWORD *)(inited + 48) = sub_21DC00954();
  return sub_21DBF9E14(inited);
}

Swift::Void __swiftcall AXDeviceRemoteScreenUtil.logSessionError(errorName:)(Swift::String errorName)
{
  void *v1;
  void *object;
  uint64_t countAndFlagsBits;
  void *v4;
  _QWORD *v5;
  void *v6;
  id v7;
  _QWORD v8[6];

  object = errorName._object;
  countAndFlagsBits = errorName._countAndFlagsBits;
  v4 = (void *)sub_21DC008A0();
  v5 = (_QWORD *)swift_allocObject();
  v5[2] = v1;
  v5[3] = countAndFlagsBits;
  v5[4] = object;
  v8[4] = sub_21DC0049C;
  v8[5] = v5;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 1107296256;
  v8[2] = sub_21DBF6AEC;
  v8[3] = &block_descriptor_6_0;
  v6 = _Block_copy(v8);
  v7 = v1;
  swift_bridgeObjectRetain();
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v6);

}

unint64_t sub_21DBFE580(uint64_t a1)
{
  uint64_t inited;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2553A5BE8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21DC01170;
  v3 = *(_QWORD *)(a1 + OBJC_IVAR___AXDeviceRemoteScreenUtil_caErrorKey + 8);
  *(_QWORD *)(inited + 32) = *(_QWORD *)(a1 + OBJC_IVAR___AXDeviceRemoteScreenUtil_caErrorKey);
  *(_QWORD *)(inited + 40) = v3;
  swift_bridgeObjectRetain();
  *(_QWORD *)(inited + 48) = sub_21DC008A0();
  return sub_21DBF9E14(inited);
}

Swift::Void __swiftcall AXDeviceRemoteScreenUtil.logInactiveSession()()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v5[6];

  v1 = (void *)sub_21DC008A0();
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = v0;
  v5[4] = sub_21DC004A8;
  v5[5] = v2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 1107296256;
  v5[2] = sub_21DBF6AEC;
  v5[3] = &block_descriptor_12;
  v3 = _Block_copy(v5);
  v4 = v0;
  swift_release();
  AnalyticsSendEventLazy();
  _Block_release(v3);

}

unint64_t sub_21DBFE7D8(uint64_t a1)
{
  uint64_t inited;
  uint64_t v3;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2553A5BE8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_21DC01170;
  v3 = *(_QWORD *)(a1 + OBJC_IVAR___AXDeviceRemoteScreenUtil_caInactiveKey);
  v4 = *(_QWORD *)(a1 + OBJC_IVAR___AXDeviceRemoteScreenUtil_caInactiveKey + 8);
  *(_QWORD *)(inited + 32) = v3;
  *(_QWORD *)(inited + 40) = v4;
  sub_21DC006E8();
  swift_bridgeObjectRetain();
  *(_QWORD *)(inited + 48) = sub_21DC00978();
  return sub_21DBF9E14(inited);
}

id AXDeviceRemoteScreenUtil.init()()
{
  char *v0;
  objc_class *ObjectType;
  char *v2;
  char *v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = &v0[OBJC_IVAR___AXDeviceRemoteScreenUtil_caSessionIntervalEvent];
  *(_QWORD *)v2 = 0xD00000000000003FLL;
  *((_QWORD *)v2 + 1) = 0x800000021DC02520;
  v3 = &v0[OBJC_IVAR___AXDeviceRemoteScreenUtil_caSessionIntervalKey];
  *(_QWORD *)v3 = 0x6C61767265746E69;
  *((_QWORD *)v3 + 1) = 0xE800000000000000;
  v4 = &v0[OBJC_IVAR___AXDeviceRemoteScreenUtil_caErrorEvent];
  *(_QWORD *)v4 = 0xD000000000000034;
  *((_QWORD *)v4 + 1) = 0x800000021DC02560;
  v5 = &v0[OBJC_IVAR___AXDeviceRemoteScreenUtil_caErrorKey];
  *(_QWORD *)v5 = 0x726F727265;
  *((_QWORD *)v5 + 1) = 0xE500000000000000;
  v6 = &v0[OBJC_IVAR___AXDeviceRemoteScreenUtil_caInactiveEvent];
  *(_QWORD *)v6 = 0xD000000000000037;
  *((_QWORD *)v6 + 1) = 0x800000021DC025A0;
  v7 = &v0[OBJC_IVAR___AXDeviceRemoteScreenUtil_caInactiveKey];
  *(_QWORD *)v7 = 0x6576697463616E69;
  *((_QWORD *)v7 + 1) = 0xE800000000000000;
  v9.receiver = v0;
  v9.super_class = ObjectType;
  return objc_msgSendSuper2(&v9, sel_init);
}

id AXDeviceRemoteScreenUtil.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

_QWORD *sub_21DBFEB30(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2540EA948);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21DBFEB94(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_21DC00918();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x22079C1BC](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

unsigned __int8 *sub_21DBFEC0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_21DC00924();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_21DBFEF6C();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_21DC00A08();
  }
LABEL_7:
  v11 = sub_21DBFECF0(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unsigned __int8 *sub_21DBFECF0(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_21DBFEF6C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_21DC00930();
  v4 = sub_21DBFEFE8(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_21DBFEFE8(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_21DBFF12C(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_21DBFEB30(v9, 0);
      v12 = sub_21DBFF218((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x22079C180](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x22079C180);
LABEL_9:
      sub_21DC00A08();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x22079C180]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_21DBFF12C(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_21DBFEB94(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_21DBFEB94(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_21DC00900();
  }
  __break(1u);
  return result;
}

unint64_t sub_21DBFF218(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_21DBFEB94(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_21DC0090C();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_21DC00A08();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_21DBFEB94(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_21DC008E8();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t _s27AXWatchRemoteScreenServices08AXDevicebC4UtilC22isPairedGizmoSupported8deviceIDSbSS_tF_0()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void (*v15)(char *, uint64_t);
  unsigned int v16;
  id v17;
  unsigned __int8 v18;
  uint64_t v19;
  id v20;
  _OWORD v21[2];
  _BYTE v22[24];
  uint64_t v23;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2553A5FA0);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v1 = (char *)&v19 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_21DC00840();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v19 - v7;
  sub_21DC0081C();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    sub_21DBFD9C4((uint64_t)v1, (uint64_t *)&unk_2553A5FA0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v8, v1, v2);
    result = (uint64_t)objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
    if (!result)
    {
      __break(1u);
      return result;
    }
    v10 = (void *)result;
    v11 = (void *)sub_21DC00828();
    v12 = objc_msgSend(v10, sel_deviceForBluetoothID_, v11);

    if (v12)
    {
      v13 = AX_NRDEVICECAPABILITY_MULTIBAND_WIFI();
      sub_21DC00834();

      v14 = (void *)sub_21DC00828();
      v15 = *(void (**)(char *, uint64_t))(v3 + 8);
      v15(v6, v2);
      v16 = objc_msgSend(v12, sel_supportsCapability_, v14);

      if (v16)
      {
        if (objc_msgSend(v12, sel_valueForProperty_, *MEMORY[0x24BE6B340]))
        {
          sub_21DC009C0();
          swift_unknownObjectRelease();
        }
        else
        {
          memset(v21, 0, sizeof(v21));
        }
        sub_21DC0065C((uint64_t)v21, (uint64_t)v22);
        if (v23)
        {
          sub_21DC006E8();
          if ((swift_dynamicCast() & 1) != 0)
          {
            v17 = v20;
            v18 = objc_msgSend(v20, sel_BOOLValue);

            v15(v8, v2);
            return (v18 & 1) == 0;
          }

        }
        else
        {

          sub_21DBFD9C4((uint64_t)v22, &qword_2553A5CA0);
        }
        v15(v8, v2);
        return 1;
      }
      v15(v8, v2);

    }
    else
    {
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    }
  }
  return 0;
}

unint64_t sub_21DBFF71C()
{
  unint64_t result;

  result = qword_2553A5F60;
  if (!qword_2553A5F60)
  {
    result = MEMORY[0x22079C6F0](&unk_21DC018D8, &type metadata for AXDeviceRemoteScreenUtil.AXWatchRemoteScreenFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_2553A5F60);
  }
  return result;
}

uint64_t sub_21DBFF760()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  type metadata accessor for AXDeviceRemoteScreenUtil();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = (void *)sub_21DC008A0();
  v3 = (void *)sub_21DC008A0();
  v4 = objc_msgSend(v1, sel_localizedStringForKey_value_table_, v2, 0, v3);

  v5 = sub_21DC008AC();
  return v5;
}

id sub_21DBFF83C()
{
  id result;
  void *v1;
  id v2;
  unsigned int v3;
  unsigned int v4;
  _QWORD *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 *v23;
  unsigned int v24;
  uint64_t v25;
  char v26;
  id v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (!result)
    goto LABEL_85;
  v1 = result;
  v2 = objc_msgSend(result, sel_getActivePairedDevice);

  if (!v2)
    return v2;
  if (objc_msgSend(v2, sel_valueForProperty_, *MEMORY[0x24BE6B340]))
  {
    sub_21DC009C0();
    swift_unknownObjectRelease();
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
  }
  sub_21DC0065C((uint64_t)&v29, (uint64_t)&v31);
  if (v33)
  {
    sub_21DC006E8();
    if ((swift_dynamicCast() & 1) != 0)
    {
      v3 = objc_msgSend(v27, sel_BOOLValue);

      if (v3)
        goto LABEL_62;
    }
  }
  else
  {
    sub_21DBFD9C4((uint64_t)&v31, &qword_2553A5CA0);
  }
  if (objc_msgSend(v2, sel_valueForProperty_, *MEMORY[0x24BE6B348]))
  {
    sub_21DC009C0();
    swift_unknownObjectRelease();
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
  }
  sub_21DC0065C((uint64_t)&v29, (uint64_t)&v31);
  if (v33)
  {
    sub_21DC006E8();
    if ((swift_dynamicCast() & 1) != 0)
    {
      v4 = objc_msgSend(v27, sel_BOOLValue);

      if (v4)
      {
LABEL_62:

        return 0;
      }
    }
  }
  else
  {
    sub_21DBFD9C4((uint64_t)&v31, &qword_2553A5CA0);
  }
  if (objc_msgSend(v2, sel_valueForProperty_, *MEMORY[0x24BE6B3F0]))
  {
    sub_21DC009C0();
    swift_unknownObjectRelease();
  }
  else
  {
    v29 = 0u;
    v30 = 0u;
  }
  sub_21DC0065C((uint64_t)&v29, (uint64_t)&v31);
  if (!v33)
  {
    sub_21DBFD9C4((uint64_t)&v31, &qword_2553A5CA0);
    return v2;
  }
  if ((swift_dynamicCast() & 1) == 0)
    return v2;
  v31 = (uint64_t)v27;
  v32 = v28;
  *(_QWORD *)&v29 = 46;
  *((_QWORD *)&v29 + 1) = 0xE100000000000000;
  sub_21DC006A4();
  v5 = (_QWORD *)sub_21DC009B4();
  swift_bridgeObjectRelease();
  if (!v5[2]
    || ((v7 = v5[4],
         v6 = v5[5],
         swift_bridgeObjectRetain(),
         result = (id)swift_bridgeObjectRelease(),
         v8 = HIBYTE(v6) & 0xF,
         v9 = v7 & 0xFFFFFFFFFFFFLL,
         (v6 & 0x2000000000000000) != 0)
      ? (v10 = HIBYTE(v6) & 0xF)
      : (v10 = v7 & 0xFFFFFFFFFFFFLL),
        !v10))
  {
    swift_bridgeObjectRelease();
    return v2;
  }
  if ((v6 & 0x1000000000000000) != 0)
  {
    v12 = (uint64_t)sub_21DBFEC0C(v7, v6, 10);
    LOBYTE(v7) = v26;
    goto LABEL_60;
  }
  if ((v6 & 0x2000000000000000) == 0)
  {
    if ((v7 & 0x1000000000000000) != 0)
      v11 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v11 = (unsigned __int8 *)sub_21DC00A08();
    v12 = (uint64_t)sub_21DBFECF0(v11, v9, 10);
    LOBYTE(v7) = v13 & 1;
LABEL_60:
    swift_bridgeObjectRelease();
    if ((v7 & 1) != 0 || v12 >= 9)
      return v2;
    goto LABEL_62;
  }
  v31 = v7;
  v32 = v6 & 0xFFFFFFFFFFFFFFLL;
  if (v7 == 43)
  {
    if (v8)
    {
      if (v8 != 1 && (BYTE1(v7) - 48) <= 9u)
      {
        v12 = (BYTE1(v7) - 48);
        if (v8 == 2)
          goto LABEL_59;
        if ((BYTE2(v7) - 48) <= 9u)
        {
          v12 = 10 * (BYTE1(v7) - 48) + (BYTE2(v7) - 48);
          v14 = v8 - 3;
          if (v14)
          {
            v15 = (unsigned __int8 *)&v31 + 3;
            while (1)
            {
              v16 = *v15 - 48;
              if (v16 > 9)
                goto LABEL_57;
              v17 = 10 * v12;
              if ((unsigned __int128)(v12 * (__int128)10) >> 64 != (10 * v12) >> 63)
                goto LABEL_57;
              v12 = v17 + v16;
              if (__OFADD__(v17, v16))
                goto LABEL_57;
              LOBYTE(v7) = 0;
              ++v15;
              if (!--v14)
                goto LABEL_60;
            }
          }
          goto LABEL_59;
        }
      }
      goto LABEL_57;
    }
  }
  else
  {
    if (v7 != 45)
    {
      if (v8 && (v7 - 48) <= 9u)
      {
        v12 = (v7 - 48);
        if (v8 == 1)
          goto LABEL_59;
        if ((BYTE1(v7) - 48) <= 9u)
        {
          v12 = 10 * (v7 - 48) + (BYTE1(v7) - 48);
          v18 = v8 - 2;
          if (v18)
          {
            v19 = (unsigned __int8 *)&v31 + 2;
            while (1)
            {
              v20 = *v19 - 48;
              if (v20 > 9)
                goto LABEL_57;
              v21 = 10 * v12;
              if ((unsigned __int128)(v12 * (__int128)10) >> 64 != (10 * v12) >> 63)
                goto LABEL_57;
              v12 = v21 + v20;
              if (__OFADD__(v21, v20))
                goto LABEL_57;
              LOBYTE(v7) = 0;
              ++v19;
              if (!--v18)
                goto LABEL_60;
            }
          }
          goto LABEL_59;
        }
      }
LABEL_57:
      v12 = 0;
      LOBYTE(v7) = 1;
      goto LABEL_60;
    }
    if (v8)
    {
      if (v8 != 1 && (BYTE1(v7) - 48) <= 9u)
      {
        if (v8 == 2)
        {
          LOBYTE(v7) = 0;
          v12 = -(uint64_t)(BYTE1(v7) - 48);
          goto LABEL_60;
        }
        if ((BYTE2(v7) - 48) <= 9u)
        {
          v12 = -10 * (BYTE1(v7) - 48) - (BYTE2(v7) - 48);
          v22 = v8 - 3;
          if (v22)
          {
            v23 = (unsigned __int8 *)&v31 + 3;
            while (1)
            {
              v24 = *v23 - 48;
              if (v24 > 9)
                goto LABEL_57;
              v25 = 10 * v12;
              if ((unsigned __int128)(v12 * (__int128)10) >> 64 != (10 * v12) >> 63)
                goto LABEL_57;
              v12 = v25 - v24;
              if (__OFSUB__(v25, v24))
                goto LABEL_57;
              LOBYTE(v7) = 0;
              ++v23;
              if (!--v22)
                goto LABEL_60;
            }
          }
LABEL_59:
          LOBYTE(v7) = 0;
          goto LABEL_60;
        }
      }
      goto LABEL_57;
    }
    __break(1u);
  }
  __break(1u);
LABEL_85:
  __break(1u);
  return result;
}

uint64_t _s27AXWatchRemoteScreenServices08AXDevicebC4UtilC28isPairedGizmoHasStingSupportSbyF_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;

  v0 = sub_21DC00840();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21DBFF83C();
  if (!v4)
  {
    if (qword_2540EA980 != -1)
      swift_once();
    v14 = sub_21DC00870();
    __swift_project_value_buffer(v14, (uint64_t)qword_2540EA988);
    v5 = sub_21DC00858();
    v15 = sub_21DC0096C();
    if (os_log_type_enabled(v5, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_21DBF3000, v5, v15, "[TWICE] currentPairedGizmo is nil", v16, 2u);
      MEMORY[0x22079C744](v16, -1, -1);
    }
    goto LABEL_12;
  }
  v5 = v4;
  v6 = AX_NRDEVICECAPABILITY_STING();
  sub_21DC00834();

  v7 = (void *)sub_21DC00828();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8 = -[NSObject supportsCapability:](v5, sel_supportsCapability_, v7);

  if (!v8)
  {
LABEL_12:

    return 0;
  }
  if (qword_2540EA980 != -1)
    swift_once();
  v9 = sub_21DC00870();
  __swift_project_value_buffer(v9, (uint64_t)qword_2540EA988);
  v10 = sub_21DC00858();
  v11 = sub_21DC0096C();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_21DBF3000, v10, v11, "[TWICE] currentPairedGizmo is sting supported", v12, 2u);
    MEMORY[0x22079C744](v12, -1, -1);
  }

  return 1;
}

uint64_t _s27AXWatchRemoteScreenServices08AXDevicebC4UtilC22isPairedGizmoSupportedSbyF_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;

  v0 = sub_21DC00840();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v21 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_21DBFF83C();
  if (!v4)
  {
    if (qword_2540EA980 != -1)
      swift_once();
    v14 = sub_21DC00870();
    __swift_project_value_buffer(v14, (uint64_t)qword_2540EA988);
    v5 = sub_21DC00858();
    v15 = sub_21DC0096C();
    if (os_log_type_enabled(v5, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_21DBF3000, v5, v15, "[TWICE] currentPairedGizmo is nil", v16, 2u);
      MEMORY[0x22079C744](v16, -1, -1);
    }
    goto LABEL_17;
  }
  v5 = v4;
  v6 = AX_NRDEVICECAPABILITY_MULTIBAND_WIFI();
  sub_21DC00834();

  v7 = (void *)sub_21DC00828();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v8 = -[NSObject supportsCapability:](v5, sel_supportsCapability_, v7);

  if (!v8)
  {
    if (qword_2540EA980 != -1)
      swift_once();
    v17 = sub_21DC00870();
    __swift_project_value_buffer(v17, (uint64_t)qword_2540EA988);
    v18 = sub_21DC00858();
    v19 = sub_21DC0096C();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_21DBF3000, v18, v19, "[TWICE] currentPairedGizmo is NOT multiband wifi", v20, 2u);
      MEMORY[0x22079C744](v20, -1, -1);
    }

LABEL_17:
    return 0;
  }
  if (qword_2540EA980 != -1)
    swift_once();
  v9 = sub_21DC00870();
  __swift_project_value_buffer(v9, (uint64_t)qword_2540EA988);
  v10 = sub_21DC00858();
  v11 = sub_21DC0096C();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_21DBF3000, v10, v11, "[TWICE] currentPairedGizmo is TWICE supported", v12, 2u);
    MEMORY[0x22079C744](v12, -1, -1);
  }

  return 1;
}

uint64_t _s27AXWatchRemoteScreenServices08AXDevicebC4UtilC15pairedGizmoNameSSSgyF_0()
{
  id v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v7;
  _OWORD v8[2];
  _BYTE v9[24];
  uint64_t v10;

  v0 = sub_21DBFF83C();
  if (v0)
  {
    v1 = v0;
    if (objc_msgSend(v0, sel_valueForProperty_, *MEMORY[0x24BE6B398]))
    {
      sub_21DC009C0();

      swift_unknownObjectRelease();
    }
    else
    {

      memset(v8, 0, sizeof(v8));
    }
    sub_21DC0065C((uint64_t)v8, (uint64_t)v9);
    if (v10)
    {
      if ((swift_dynamicCast() & 1) != 0)
        return v7;
    }
    else
    {
      sub_21DBFD9C4((uint64_t)v9, &qword_2553A5CA0);
    }
  }
  else
  {
    if (qword_2540EA980 != -1)
      swift_once();
    v2 = sub_21DC00870();
    __swift_project_value_buffer(v2, (uint64_t)qword_2540EA988);
    v3 = sub_21DC00858();
    v4 = sub_21DC0096C();
    if (os_log_type_enabled(v3, v4))
    {
      v5 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_21DBF3000, v3, v4, "[TWICE] currentPairedGizmo is nil", v5, 2u);
      MEMORY[0x22079C744](v5, -1, -1);
    }

  }
  return 0;
}

uint64_t sub_21DC00450()
{
  uint64_t v0;

  return swift_deallocObject();
}

unint64_t sub_21DC00474()
{
  uint64_t v0;

  return sub_21DBFE284(*(_QWORD *)(v0 + 16));
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

unint64_t sub_21DC0049C()
{
  uint64_t v0;

  return sub_21DBFE580(*(_QWORD *)(v0 + 16));
}

unint64_t sub_21DC004A8()
{
  uint64_t v0;

  return sub_21DBFE7D8(*(_QWORD *)(v0 + 16));
}

uint64_t type metadata accessor for AXDeviceRemoteScreenUtil()
{
  return objc_opt_self();
}

uint64_t getEnumTagSinglePayload for AXDeviceRemoteScreenUtil.AXWatchRemoteScreenFeatureFlags(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for AXDeviceRemoteScreenUtil.AXWatchRemoteScreenFeatureFlags(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_21DC00564 + 4 * byte_21DC01810[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_21DC00584 + 4 * byte_21DC01815[v4]))();
}

_BYTE *sub_21DC00564(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_21DC00584(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21DC0058C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21DC00594(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_21DC0059C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_21DC005A4(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for AXDeviceRemoteScreenUtil.AXWatchRemoteScreenFeatureFlags()
{
  return &type metadata for AXDeviceRemoteScreenUtil.AXWatchRemoteScreenFeatureFlags;
}

unint64_t sub_21DC005C4()
{
  unint64_t result;

  result = qword_2553A5F90;
  if (!qword_2553A5F90)
  {
    result = MEMORY[0x22079C6F0](&unk_21DC018B0, &type metadata for AXDeviceRemoteScreenUtil.AXWatchRemoteScreenFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_2553A5F90);
  }
  return result;
}

uint64_t sub_21DC00608()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_21DC0065C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2553A5CA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_21DC006A4()
{
  unint64_t result;

  result = qword_2553A5F98;
  if (!qword_2553A5F98)
  {
    result = MEMORY[0x22079C6F0](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2553A5F98);
  }
  return result;
}

unint64_t sub_21DC006E8()
{
  unint64_t result;

  result = qword_2553A5BF0;
  if (!qword_2553A5BF0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2553A5BF0);
  }
  return result;
}

void AXDisplayCornerRadiusWithMargin_cold_1()
{
  dlerror();
  abort_report_np();
  __getBluetoothManagerClass_block_invoke_cold_1();
}

void __getBluetoothManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getWFClientClass_block_invoke_cold_1(v0);
}

void __getWFClientClass_block_invoke_cold_1()
{
  abort_report_np();
  sub_21DC007C8();
}

uint64_t sub_21DC007C8()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_21DC007D4()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_21DC007E0()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_21DC007EC()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_21DC007F8()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_21DC00804()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_21DC00810()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_21DC0081C()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_21DC00828()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_21DC00834()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_21DC00840()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_21DC0084C()
{
  return MEMORY[0x24BE30BE0]();
}

uint64_t sub_21DC00858()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21DC00864()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_21DC00870()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21DC0087C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_21DC00888()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_21DC00894()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_21DC008A0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21DC008AC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21DC008B8()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_21DC008C4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21DC008D0()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21DC008DC()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21DC008E8()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_21DC008F4()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_21DC00900()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_21DC0090C()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_21DC00918()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_21DC00924()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_21DC00930()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_21DC0093C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_21DC00948()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_21DC00954()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_21DC00960()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21DC0096C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_21DC00978()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_21DC00984()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_21DC00990()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_21DC0099C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21DC009A8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21DC009B4()
{
  return MEMORY[0x24BDD04C8]();
}

uint64_t sub_21DC009C0()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_21DC009CC()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_21DC009D8()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_21DC009E4()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_21DC009F0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_21DC009FC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21DC00A08()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21DC00A14()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_21DC00A20()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21DC00A2C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21DC00A38()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21DC00A44()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_21DC00A50()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21DC00A5C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21DC00A68()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_21DC00A74()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_21DC00A80()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_21DC00A8C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_21DC00A98()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21DC00AA4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21DC00AB0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

uint64_t _AXSTwiceRemoteScreenEnabled()
{
  return MEMORY[0x24BED2568]();
}

uint64_t _AXSTwiceRemoteScreenPlatform()
{
  return MEMORY[0x24BED2570]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

