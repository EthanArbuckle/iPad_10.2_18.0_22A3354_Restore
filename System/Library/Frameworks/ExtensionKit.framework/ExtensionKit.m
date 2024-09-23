void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x26u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x1Cu);
}

uint64_t OUTLINED_FUNCTION_6@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 24) = a1;
  return objc_opt_class();
}

void sub_20AE790E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, id *a12, id *location, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,id a52)
{
  uint64_t v52;

  objc_destroyWeak(location);
  objc_destroyWeak(a12);
  objc_destroyWeak(a11);
  objc_destroyWeak(&a52);
  objc_destroyWeak((id *)(v52 - 256));
  _Block_object_dispose((const void *)(v52 - 248), 8);
  _Block_object_dispose((const void *)(v52 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_20AE79A08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __copy_constructor_8_8_t0w16_s16(uint64_t a1, uint64_t a2)
{
  id result;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(id *)(a2 + 16);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

void __move_assignment_8_8_t0w16_s16(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a2 + 16) = 0;
  v3 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v2;

}

void sub_20AE79C68(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x26u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_20AE7A1F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id appProtectionEffectiveContainerFor(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v1 = a1;
  objc_msgSend(v1, "applicationExtensionRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v3 = objc_alloc(MEMORY[0x24BDC1528]);
    objc_msgSend(v1, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:error:", v4, 0);

  }
  objc_msgSend(v2, "appProtectionEffectiveContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v5, 1, 0);
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(v2, "containingBundleRecord");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  return v9;
}

id getAPBaseExtensionShieldViewClass()
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
  v0 = (void *)getAPBaseExtensionShieldViewClass_softClass;
  v7 = getAPBaseExtensionShieldViewClass_softClass;
  if (!getAPBaseExtensionShieldViewClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAPBaseExtensionShieldViewClass_block_invoke;
    v3[3] = &unk_24C3E39D0;
    v3[4] = &v4;
    __getAPBaseExtensionShieldViewClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20AE7B050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id iconImageFor(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v1 = (objc_class *)MEMORY[0x24BE51A90];
  v2 = a1;
  v3 = [v1 alloc];
  objc_msgSend(v2, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(v3, "initWithBundleIdentifier:", v4);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51AB0]), "initWithSize:scale:", 64.0, 64.0, 2.0);
  objc_msgSend(v6, "setDrawBorder:", 1);
  objc_msgSend(v5, "prepareImageForDescriptor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BEBD640];
  v9 = objc_msgSend(v7, "CGImage");
  objc_msgSend(v7, "scale");
  objc_msgSend(v8, "imageWithCGImage:scale:orientation:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

Class __getAPBaseExtensionShieldViewClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AppProtectionUILibraryCore_frameworkLibrary)
  {
    AppProtectionUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AppProtectionUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("APBaseExtensionShieldView");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAPBaseExtensionShieldViewClass_block_invoke_cold_1();
    free(v3);
  }
  getAPBaseExtensionShieldViewClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x30u);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_20AE7D958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _EXExtensionPingLaunchdAfterEvent()
{
  NSObject *v0;

  _EXDefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    _EXExtensionPingLaunchdAfterEvent_cold_1();

  objc_msgSend(MEMORY[0x24BDC79B0], "checkInWithLaunchd");
  if (sPingLaunchdObserver)
  {
    CFRelease((CFTypeRef)sPingLaunchdObserver);
    sPingLaunchdObserver = 0;
  }
}

void sub_20AE7E25C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 96));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x26u);
}

void sub_20AE7F064(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20AE7FB24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20AE81180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

uint64_t initializeBufferWithCopyOfBuffer for _AnyViewConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_20AE81568(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_20AE81588(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_20AE81658(a1, &qword_25462DB90);
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
  sub_20AE81658(a1, &qword_25462DB98);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_20AE815E8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_20AE81608(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_20AE81658(a1, &qword_25462DBA0);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_20AE81658(a1, &qword_25462DBA8);
}

void sub_20AE81658(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_20AE8169C(uint64_t a1, uint64_t a2)
{
  return sub_20AE81764(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_20AE816A8()
{
  sub_20AE9D3D0();
  sub_20AE9D3F4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20AE816E8()
{
  uint64_t v0;

  sub_20AE9D3D0();
  sub_20AE9D5E0();
  sub_20AE9D3F4();
  v0 = sub_20AE9D5EC();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_20AE81758(uint64_t a1, uint64_t a2)
{
  return sub_20AE81764(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_20AE81764(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_20AE9D3D0();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_20AE817A0(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_20AE9D3B8();
  *a2 = 0;
  return result;
}

uint64_t sub_20AE81814(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_20AE9D3C4();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_20AE81890@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_20AE9D3D0();
  v2 = sub_20AE9D3AC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_20AE818D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_20AE9D3D0();
  v2 = v1;
  if (v0 == sub_20AE9D3D0() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_20AE9D5BC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_20AE81958@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_20AE9D3AC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_20AE8199C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_20AE9D3D0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_20AE819C4()
{
  sub_20AE81A78((unint64_t *)&qword_25462E330, (uint64_t)&unk_20AE9F774);
  sub_20AE81A78((unint64_t *)&unk_25462DBD0, (uint64_t)&unk_20AE9F6C8);
  return sub_20AE9D5A4();
}

uint64_t sub_20AE81A30()
{
  return sub_20AE81A78(&qword_25462DBB0, (uint64_t)&unk_20AE9F68C);
}

uint64_t sub_20AE81A54()
{
  return sub_20AE81A78(&qword_25462DBB8, (uint64_t)&unk_20AE9F660);
}

uint64_t sub_20AE81A78(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for LaunchOptionsKey(255);
    result = MEMORY[0x20BD34540](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_20AE81AB8()
{
  return sub_20AE81A78((unint64_t *)&unk_25462DBC0, (uint64_t)&unk_20AE9F6FC);
}

uint64_t sub_20AE81AE4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a1;
  *(_QWORD *)(v7 + 24) = a2;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a1;
  *(_QWORD *)(v9 + 24) = a2;
  *a3 = sub_20AE83A3C;
  a3[1] = v6;
  a3[2] = sub_20AE83A40;
  a3[3] = v7;
  a3[4] = sub_20AE83C18;
  a3[5] = v8;
  a3[6] = sub_20AE83C14;
  a3[7] = v9;
  return swift_bridgeObjectRetain_n();
}

uint64_t static _AppExtension<>.main()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  os_log_type_t v13;
  NSObject *v14;
  char **v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  _QWORD *v19;
  id v20;
  _QWORD *v21;
  uint8_t *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  _QWORD v31[2];
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v35 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v36 = AssociatedTypeWitness;
  v7 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v9 = (char *)v31 - v8;
  v10 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_20AE9D4D8();
  sub_20AE81E98(0, (unint64_t *)&qword_253DA1160);
  v14 = sub_20AE9D508();
  v15 = &selRef_prepareImageForDescriptor_;
  if (os_log_type_enabled(v14, v13))
  {
    v16 = swift_slowAlloc();
    v32 = a3;
    v17 = (uint8_t *)v16;
    v18 = swift_slowAlloc();
    v34 = v10;
    v19 = (_QWORD *)v18;
    v33 = a2;
    *(_DWORD *)v17 = 138412290;
    v31[1] = v17 + 4;
    sub_20AE81E98(0, &qword_253DA1158);
    v20 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
    v37 = v20;
    sub_20AE9D520();
    *v19 = v20;
    v15 = &selRef_prepareImageForDescriptor_;
    _os_log_impl(&dword_20AE73000, v14, v13, "Launching UI _AppExtension %@", v17, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(qword_25462DD00);
    swift_arrayDestroy();
    v21 = v19;
    v10 = v34;
    MEMORY[0x20BD345D0](v21, -1, -1);
    v22 = v17;
    a3 = v32;
    MEMORY[0x20BD345D0](v22, -1, -1);
  }

  sub_20AE9CFBC();
  sub_20AE81E98(0, &qword_253DA1158);
  v23 = objc_msgSend((id)swift_getObjCClassFromMetadata(), v15[109]);
  v24 = v36;
  type metadata accessor for _UIAppExtensionWrapper(0, v36, a3, v25);
  sub_20AE9CFB0();
  v29 = sub_20AE830D8((uint64_t)v9, v26, v27, v28);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v9, v24);
  objc_msgSend(v23, sel_setExtension_, v29);

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, a1);
}

{
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  os_log_type_t v13;
  NSObject *v14;
  char **v15;
  uint64_t v16;
  uint8_t *v17;
  uint64_t v18;
  _QWORD *v19;
  id v20;
  _QWORD *v21;
  uint8_t *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  _QWORD v31[2];
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v35 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v36 = AssociatedTypeWitness;
  v7 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v9 = (char *)v31 - v8;
  v10 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_20AE9D4D8();
  sub_20AE81E98(0, (unint64_t *)&qword_253DA1160);
  v14 = sub_20AE9D508();
  v15 = &selRef_prepareImageForDescriptor_;
  if (os_log_type_enabled(v14, v13))
  {
    v16 = swift_slowAlloc();
    v32 = a3;
    v17 = (uint8_t *)v16;
    v18 = swift_slowAlloc();
    v34 = v10;
    v19 = (_QWORD *)v18;
    v33 = a2;
    *(_DWORD *)v17 = 138412290;
    v31[1] = v17 + 4;
    sub_20AE81E98(0, &qword_253DA1158);
    v20 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
    v37 = v20;
    sub_20AE9D520();
    *v19 = v20;
    v15 = &selRef_prepareImageForDescriptor_;
    _os_log_impl(&dword_20AE73000, v14, v13, "Launching UI _AppExtension for scene configuration %@", v17, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(qword_25462DD00);
    swift_arrayDestroy();
    v21 = v19;
    v10 = v34;
    MEMORY[0x20BD345D0](v21, -1, -1);
    v22 = v17;
    a3 = v32;
    MEMORY[0x20BD345D0](v22, -1, -1);
  }

  sub_20AE9CFBC();
  sub_20AE81E98(0, &qword_253DA1158);
  v23 = objc_msgSend((id)swift_getObjCClassFromMetadata(), v15[109]);
  v24 = v36;
  type metadata accessor for _UIAppExtensionSceneConfigWrapper(0, v36, a3, v25);
  sub_20AE9CFB0();
  v29 = sub_20AE93B08((uint64_t)v9, v26, v27, v28);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v9, v24);
  objc_msgSend(v23, sel_setExtension_, v29);

  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, a1);
}

uint64_t sub_20AE81E98(uint64_t a1, unint64_t *a2)
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

uint64_t type metadata accessor for _UIAppExtensionWrapper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _UIAppExtensionWrapper);
}

id sub_20AE81EDC(_OWORD *a1)
{
  objc_class *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_allocWithZone(v1);
  return sub_20AE82068(a1, v4, v5, v6);
}

uint64_t sub_20AE81F14(uint64_t a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  __int128 v8[2];
  uint64_t v9;
  _QWORD v10[4];

  v2 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)v1) + 0x50);
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))((char *)v8 - v5, &v1[*(_QWORD *)(v3 + 96)], v2);
  __swift_instantiateConcreteTypeFromMangledName(qword_253DA1030);
  if (swift_dynamicCast())
  {
    sub_20AE832DC(v8, (uint64_t)v10);
    __swift_project_boxed_opaque_existential_1(v10, v10[3]);
    v6 = sub_20AE9D0D0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  else
  {
    v9 = 0;
    memset(v8, 0, sizeof(v8));
    sub_20AE8329C((uint64_t)v8);
    v6 = 0;
  }
  return v6 & 1;
}

uint64_t sub_20AE8201C(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  LOBYTE(a1) = sub_20AE81F14((uint64_t)v4);

  return a1 & 1;
}

id sub_20AE82068(_OWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  objc_class *v6;
  objc_super v8;

  v5 = *MEMORY[0x24BEE4EA0] & *v4;
  *(_OWORD *)((char *)v4 + qword_25462DD88) = *a1;
  v6 = (objc_class *)type metadata accessor for _UIAppExtensionWrapper._SceneFactory(0, *(_QWORD *)(v5 + 80), *(_QWORD *)(v5 + 88), a4);
  v8.receiver = v4;
  v8.super_class = v6;
  return objc_msgSendSuper2(&v8, sel_init);
}

void sub_20AE820C4(void *a1)
{
  _QWORD *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  os_log_type_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  os_log_type_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  NSObject *log;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35[2];
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v2 = *MEMORY[0x24BEE4EA0] & *v1;
  v3 = objc_msgSend(a1, sel_role);
  v4 = sub_20AE9D3D0();
  v6 = v5;

  v36 = *(_OWORD *)((char *)v1 + qword_25462DD88);
  v34 = v4;
  v35[0] = v4;
  v35[1] = v6;
  sub_20AE8C9E8(v35, &v37);
  v7 = v37;
  if ((_QWORD)v37)
  {
    v32 = v2;
    v8 = *((_QWORD *)&v37 + 1);
    v9 = v38;
    v11 = v39;
    v10 = v40;
    v12 = v41;
    v33 = v42;
    v13 = v43;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    v14 = sub_20AE9D4D8();
    sub_20AE81E98(0, (unint64_t *)&qword_253DA1160);
    v15 = sub_20AE9D508();
    if (os_log_type_enabled(v15, v14))
    {
      sub_20AE83AB4(v7);
      sub_20AE83AB4(v7);
      swift_bridgeObjectRetain();
      log = v15;
      v16 = swift_slowAlloc();
      v31 = swift_slowAlloc();
      *(_QWORD *)&v36 = v31;
      *(_DWORD *)v16 = 136315394;
      *(_QWORD *)&v37 = v7;
      *((_QWORD *)&v37 + 1) = v8;
      v38 = v9;
      v39 = v11;
      v40 = v10;
      v41 = v12;
      v42 = v33;
      v43 = v13;
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      v17 = sub_20AE9D3DC();
      *(_QWORD *)&v37 = sub_20AE98A70(v17, v18, (uint64_t *)&v36);
      sub_20AE9D520();
      swift_bridgeObjectRelease();
      sub_20AE83A64(v7);
      sub_20AE83A64(v7);
      *(_WORD *)(v16 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v37 = sub_20AE98A70(v34, v6, (uint64_t *)&v36);
      sub_20AE9D520();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_20AE73000, log, v14, "Using %s for requested role %s", (uint8_t *)v16, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x20BD345D0](v31, -1, -1);
      MEMORY[0x20BD345D0](v16, -1, -1);

    }
    else
    {
      swift_bridgeObjectRelease();

    }
    v24 = *(_QWORD *)(v32 + 80);
    v25 = *(_QWORD *)(v32 + 88);
    v26 = sub_20AE839D4();
    *(_QWORD *)&v37 = v24;
    *((_QWORD *)&v37 + 1) = &type metadata for _AnyViewConfiguration;
    v38 = v25;
    v39 = v26;
    type metadata accessor for _UIAppExtensionWrapper._Scene();
  }
  v19 = sub_20AE9D4E4();
  sub_20AE81E98(0, (unint64_t *)&qword_253DA1160);
  v20 = sub_20AE9D508();
  v21 = v19;
  if (os_log_type_enabled(v20, v19))
  {
    swift_bridgeObjectRetain_n();
    v22 = (uint8_t *)swift_slowAlloc();
    v23 = swift_slowAlloc();
    *(_QWORD *)&v37 = v23;
    *(_DWORD *)v22 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v36 = sub_20AE98A70(v34, v6, (uint64_t *)&v37);
    sub_20AE9D520();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_20AE73000, v20, v21, "No configuration found for requested role %s", v22, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x20BD345D0](v23, -1, -1);
    MEMORY[0x20BD345D0](v22, -1, -1);
  }

  v27 = *(_QWORD *)(v2 + 80);
  v28 = *(_QWORD *)(v2 + 88);
  v29 = sub_20AE839D4();
  *(_QWORD *)&v37 = v27;
  *((_QWORD *)&v37 + 1) = &type metadata for _AnyViewConfiguration;
  v38 = v28;
  v39 = v29;
  type metadata accessor for _UIAppExtensionWrapper._Scene();
}

void sub_20AE82634()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  if (qword_25462DA68 != -1)
    swift_once();
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = v0;
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v1;
  *(_QWORD *)(v4 + 24) = v0;
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v1;
  *(_QWORD *)(v5 + 24) = v0;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v1;
  *(_QWORD *)(v6 + 24) = v0;
  swift_bridgeObjectRetain_n();
  v7 = objc_msgSend(v2, sel_parameters);
  sub_20AE83904();
}

void sub_20AE8271C()
{
  void *v0;

  swift_release();
  swift_release();
  swift_release();
  swift_release();

  JUMPOUT(0x20AE82744);
}

void sub_20AE82780(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_20AE820C4(v4);
}

id sub_20AE827AC(void *a1)
{
  void *v1;
  void *v2;

  return a1;
}

uint64_t sub_20AE827CC(_QWORD *a1, uint64_t a2)
{
  return sub_20AE82ABC(a1, a2, (uint64_t (*)(_QWORD, _QWORD))sub_20AE8395C);
}

id sub_20AE827D8()
{
  return sub_20AE82AE4((uint64_t (*)(_QWORD, _QWORD, _QWORD))type metadata accessor for _UIAppExtensionWrapper._SceneFactory);
}

uint64_t sub_20AE827E4()
{
  return swift_release();
}

id sub_20AE827F8()
{
  return (id)sub_20AE83988();
}

void sub_20AE82818(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a1;
  sub_20AE82860((uint64_t)a3);

}

void sub_20AE82860(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x70);
  v3 = *(void **)((char *)v1 + v2);
  *(_QWORD *)((char *)v1 + v2) = a1;

}

uint64_t sub_20AE82884(uint64_t a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  __int128 v8[2];
  uint64_t v9;
  _QWORD v10[4];

  v2 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)v1) + 0x58);
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))((char *)v8 - v5, &v1[*(_QWORD *)(v3 + 120)], v2);
  __swift_instantiateConcreteTypeFromMangledName(qword_253DA1030);
  if (swift_dynamicCast())
  {
    sub_20AE832DC(v8, (uint64_t)v10);
    __swift_project_boxed_opaque_existential_1(v10, v10[3]);
    v6 = sub_20AE9D0D0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  else
  {
    v9 = 0;
    memset(v8, 0, sizeof(v8));
    sub_20AE8329C((uint64_t)v8);
    v6 = 0;
  }
  return v6 & 1;
}

uint64_t sub_20AE8298C(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  LOBYTE(a1) = sub_20AE82884((uint64_t)v4);

  return a1 & 1;
}

void sub_20AE829D8()
{
  sub_20AE839A8();
}

void sub_20AE829F8()
{
  type metadata accessor for _UIAppExtensionWrapper._Scene();
}

id sub_20AE82A2C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 16) = v1;
  *(_QWORD *)(v2 - 8) = a1;
  return objc_msgSendSuper2((objc_super *)(v2 - 16), sel_dealloc);
}

uint64_t sub_20AE82A4C(char *a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v3 = *MEMORY[0x24BEE4EA0] & *(_QWORD *)a1;

  return (*(uint64_t (**)(char *))(*(_QWORD *)(*(_QWORD *)(v3 + 88) - 8) + 8))(&a1[*(_QWORD *)((*v2 & *(_QWORD *)a1) + 0x78)]);
}

uint64_t sub_20AE82AB0(_QWORD *a1, uint64_t a2)
{
  return sub_20AE82ABC(a1, a2, (uint64_t (*)(_QWORD, _QWORD))sub_20AE83BA0);
}

uint64_t sub_20AE82ABC(_QWORD *a1, uint64_t a2, uint64_t (*a3)(_QWORD, _QWORD))
{
  return a3(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *a1) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *a1) + 0x58));
}

id sub_20AE82AD8()
{
  return sub_20AE82AE4((uint64_t (*)(_QWORD, _QWORD, _QWORD))type metadata accessor for _UIAppExtensionWrapper);
}

id sub_20AE82AE4(uint64_t (*a1)(_QWORD, _QWORD, _QWORD))
{
  _QWORD *v1;
  objc_class *v2;
  objc_super v4;

  v2 = (objc_class *)a1(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x58));
  v4.receiver = v1;
  v4.super_class = v2;
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t sub_20AE82B34(char *a1)
{
  return (*(uint64_t (**)(char *))(*(_QWORD *)(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)a1) + 0x50)
                                                       - 8)
                                           + 8))(&a1[*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)a1) + 0x60)]);
}

uint64_t sub_20AE82B60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  __int128 v5[2];
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[4];

  v7 = a2;
  v8 = a3;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(qword_253DA1030);
  if (swift_dynamicCast())
  {
    sub_20AE832DC(v5, (uint64_t)v9);
    __swift_project_boxed_opaque_existential_1(v9, v9[3]);
    v3 = sub_20AE9D0D0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  }
  else
  {
    v6 = 0;
    memset(v5, 0, sizeof(v5));
    sub_20AE8329C((uint64_t)v5);
    v3 = 0;
  }
  return v3 & 1;
}

uint64_t sub_20AE82C20(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_20AE82C30(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

_BYTE **sub_20AE82C64(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_20AE82C74(uint64_t (*a1)(void))
{
  return a1();
}

void sub_20AE82C94(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_20AE9D520();
  *a1 = v7;
  v8 = *a2;
  if (*a2)
  {
    *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {

  }
}

void sub_20AE82D44()
{
  id v0;

  sub_20AE9D4D8();
  sub_20AE81E98(0, (unint64_t *)&qword_253DA1160);
  v0 = (id)sub_20AE9D508();
  sub_20AE9D0F4();

}

id sub_20AE82DC0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  os_log_type_t v11;
  NSObject *v12;
  void (*v13)(char *, uint64_t, uint64_t);
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  objc_class *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  objc_class *v31;
  uint8_t *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  objc_super v37;
  __int128 v38;
  __int128 v39;

  v36 = *MEMORY[0x24BEE4EA0] & *v1;
  v3 = *(_QWORD *)(v36 + 80);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v33 - v8;
  v10 = v1;
  v11 = sub_20AE9D4D8();
  sub_20AE81E98(0, (unint64_t *)&qword_253DA1160);
  v12 = sub_20AE9D508();
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v13(v9, a1, v3);
  v14 = v11;
  if (os_log_type_enabled(v12, v11))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v35 = v10;
    v17 = v16;
    *(_QWORD *)&v39 = v16;
    v34 = a1;
    *(_DWORD *)v15 = 136315138;
    v33 = v15 + 4;
    v13(v7, (uint64_t)v9, v3);
    v18 = sub_20AE9D3DC();
    *(_QWORD *)&v38 = sub_20AE98A70(v18, v19, (uint64_t *)&v39);
    a1 = v34;
    sub_20AE9D520();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    _os_log_impl(&dword_20AE73000, v12, v14, "Creating _UIAppExtensionWrapper with content %s", v15, 0xCu);
    swift_arrayDestroy();
    v20 = v17;
    v10 = v35;
    MEMORY[0x20BD345D0](v20, -1, -1);
    MEMORY[0x20BD345D0](v15, -1, -1);

  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  }
  v13((char *)v10 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v10) + 0x60), a1, v3);

  sub_20AE81E98(0, &qword_253DA1158);
  v21 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
  v22 = *(_QWORD *)(v36 + 88);
  v24 = (objc_class *)type metadata accessor for _UIAppExtensionWrapper._SceneFactory(0, v3, v22, v23);
  (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v22 + 8))(&v39, v3, v22);
  v38 = v39;
  v25 = objc_allocWithZone(v24);
  v29 = sub_20AE82068(&v38, v26, v27, v28);
  objc_msgSend(v21, sel_setSceneFactory_, v29);

  v31 = (objc_class *)type metadata accessor for _UIAppExtensionWrapper(0, v3, v22, v30);
  v37.receiver = v10;
  v37.super_class = v31;
  return objc_msgSendSuper2(&v37, sel_init);
}

id sub_20AE830D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  id v6;

  v6 = objc_allocWithZone((Class)type metadata accessor for _UIAppExtensionWrapper(0, *(_QWORD *)(v4 + 80), *(_QWORD *)(v4 + 88), a4));
  return sub_20AE82DC0(a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD34528]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_20AE83154()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_20AE831C4()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for _UIAppExtensionWrapper._SceneFactory(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _UIAppExtensionWrapper._SceneFactory);
}

uint64_t sub_20AE83214()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void type metadata accessor for _UIAppExtensionWrapper._Scene()
{
  JUMPOUT(0x20BD344D4);
}

uint64_t sub_20AE8329C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_25462E5D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20AE832DC(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
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

void sub_20AE83338(uint64_t a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  os_log_type_t v18;
  NSObject *v19;
  void (*v20)(char *, uint64_t, uint64_t);
  os_log_type_t v21;
  _BOOL4 v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  os_log_type_t v31;
  NSObject *v32;
  os_log_type_t v33;
  id v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint8_t *v42;
  char *v43;
  uint64_t v44;
  uint64_t AssociatedConformanceWitness;
  unint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  _QWORD *v61;
  uint64_t v62;
  _QWORD *v63;
  uint64_t v64;
  uint64_t v65[6];
  _QWORD v66[3];

  v53 = a2;
  v4 = (_QWORD *)(*MEMORY[0x24BEE4EA0] & *v2);
  v5 = v4[13];
  v6 = v4[11];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25462DF58);
  v54 = sub_20AE9D184();
  v8 = MEMORY[0x24BDAC7A8](v54);
  v57 = (char *)&v50 - v9;
  v58 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v59 = AssociatedTypeWitness;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v56 = (char *)&v50 - v11;
  v12 = *(_QWORD *)(v6 - 8);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v15 = (char *)&v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v50 - v16;
  v55 = v4[14];
  *(_QWORD *)((char *)v2 + v55) = 0;
  v60 = v2;
  v63 = v2;
  v18 = sub_20AE9D4D8();
  v52 = sub_20AE81E98(0, (unint64_t *)&qword_253DA1160);
  v19 = sub_20AE9D508();
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v62 = a1;
  v20(v17, a1, v6);
  v21 = v18;
  v22 = os_log_type_enabled(v19, v18);
  v61 = v4;
  if (v22)
  {
    v23 = (uint8_t *)swift_slowAlloc();
    v24 = swift_slowAlloc();
    v65[0] = v24;
    v51 = v5;
    *(_DWORD *)v23 = 136315138;
    v50 = v23 + 4;
    v20(v15, (uint64_t)v17, v6);
    v25 = sub_20AE9D3DC();
    v64 = sub_20AE98A70(v25, v26, v65);
    v5 = v51;
    sub_20AE9D520();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v6);
    swift_arrayDestroy();
    MEMORY[0x20BD345D0](v24, -1, -1);
    MEMORY[0x20BD345D0](v23, -1, -1);

  }
  else
  {

    (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v6);
  }
  v27 = v63;
  v28 = v53;
  v20((char *)v63 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v63) + 0x78), v62, v6);
  v29 = objc_msgSend(v28, sel_initializationParametersPromise);
  if (v29)
  {
    v30 = v29;
    v31 = sub_20AE9D4D8();
    v32 = sub_20AE9D508();
    v33 = v31;
    if (os_log_type_enabled(v32, v31))
    {
      v34 = v30;
      v35 = (uint8_t *)swift_slowAlloc();
      v36 = swift_slowAlloc();
      v51 = v5;
      v37 = v36;
      v64 = (uint64_t)v34;
      v65[0] = v36;
      *(_DWORD *)v35 = 136315138;
      v38 = v34;
      v39 = sub_20AE9D3DC();
      v64 = sub_20AE98A70(v39, v40, v65);
      sub_20AE9D520();

      swift_bridgeObjectRelease();
      swift_arrayDestroy();
      v41 = v37;
      v5 = v51;
      MEMORY[0x20BD345D0](v41, -1, -1);
      v42 = v35;
      v27 = v63;
      MEMORY[0x20BD345D0](v42, -1, -1);
    }

    v65[0] = (uint64_t)v30;
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(v5 + 40))(v65, v6, v5);

  }
  v43 = v56;
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(v6, v5);
  v44 = v59;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v46 = sub_20AE83B48();
  v66[0] = AssociatedConformanceWitness;
  v66[1] = v46;
  MEMORY[0x20BD34540](MEMORY[0x24BDED300], v54, v66);
  sub_20AE9D220();
  v65[0] = sub_20AE9D340();
  sub_20AE9D2A4();
  sub_20AE9D31C();
  swift_release();
  v47 = sub_20AE9D208();
  (*(void (**)(char *, uint64_t))(v58 + 8))(v43, v44);
  v48 = *(void **)((char *)v60 + v55);
  *(_QWORD *)((char *)v60 + v55) = v47;

  v49 = v61[12];
  v65[0] = v61[10];
  v65[1] = v6;
  v65[2] = v49;
  v65[3] = v5;
  type metadata accessor for _UIAppExtensionWrapper._Scene();
}

id sub_20AE838D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 120) = v1;
  *(_QWORD *)(v2 - 112) = a1;
  return objc_msgSendSuper2((objc_super *)(v2 - 120), sel_init);
}

void sub_20AE83904()
{
  type metadata accessor for _UIAppExtensionWrapper._Scene();
}

void sub_20AE83934(objc_class *a1)
{
  void *v1;
  uint64_t v2;
  id v3;

  v3 = objc_allocWithZone(a1);
  sub_20AE83338(v2, v1);
}

void sub_20AE8395C()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_20AE83988()
{
  _QWORD *v0;

  return *(_QWORD *)((char *)v0 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0x70));
}

void sub_20AE839A8()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

unint64_t sub_20AE839D4()
{
  unint64_t result;

  result = qword_25462DF50;
  if (!qword_25462DF50)
  {
    result = MEMORY[0x20BD34540](&protocol conformance descriptor for _AnyViewConfiguration, &type metadata for _AnyViewConfiguration);
    atomic_store(result, (unint64_t *)&qword_25462DF50);
  }
  return result;
}

uint64_t sub_20AE83A18()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_20AE83A40()
{
  return sub_20AE9D364();
}

uint64_t sub_20AE83A54(uint64_t a1)
{
  uint64_t v1;

  return sub_20AE82B60(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_20AE83A5C()
{
  sub_20AE82D44();
}

uint64_t sub_20AE83A64(uint64_t result)
{
  if (result)
  {
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_20AE83AB4(uint64_t result)
{
  if (result)
  {
    swift_retain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x20BD34534](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_20AE83B48()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25462DF60;
  if (!qword_25462DF60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25462DF58);
    result = MEMORY[0x20BD34540](MEMORY[0x24BDF06D8], v1);
    atomic_store(result, (unint64_t *)&qword_25462DF60);
  }
  return result;
}

uint64_t sub_20AE83B94@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 24);
  *a1 = *(_QWORD *)(v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

void sub_20AE83BA0()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x20BD344D4](a1, v6, a5);
}

uint64_t sub_20AE83C1C()
{
  return 0;
}

Swift::Bool __swiftcall _ViewScene.shouldAccept(connection:)(NSXPCConnection connection)
{
  return 0;
}

void sub_20AE83C2C()
{
  id v0;

  sub_20AE9D4D8();
  sub_20AE81E98(0, (unint64_t *)&qword_253DA1160);
  v0 = (id)sub_20AE9D508();
  sub_20AE9D0F4();

}

void _ViewScene.consume(initializationParameters:)()
{
  id v0;

  sub_20AE9D4D8();
  sub_20AE81E98(0, (unint64_t *)&qword_253DA1160);
  v0 = (id)sub_20AE9D508();
  sub_20AE9D0F4();

}

uint64_t _ContentViewScene.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  if (qword_25462DA60 != -1)
    swift_once();
  v11 = qword_25462E260;
  v10 = *(_QWORD *)algn_25462E268;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = a1;
  v12[5] = a2;
  *a5 = v11;
  a5[1] = v10;
  a5[2] = (uint64_t)sub_20AE857D8;
  a5[3] = (uint64_t)v12;
  return swift_bridgeObjectRetain();
}

uint64_t sub_20AE83DD8@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (**a4)()@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, char *, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);

  v8 = *(_QWORD *)(a2 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
  v19 = a1;
  v21(v10, a1, a2);
  v11 = *(unsigned __int8 *)(v8 + 80);
  v12 = (v11 + 32) & ~v11;
  v20 = v11 | 7;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a2;
  *(_QWORD *)(v13 + 24) = a3;
  v14 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 32);
  v14(v13 + v12, v10, a2);
  v21(v10, a1, a2);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a2;
  *(_QWORD *)(v15 + 24) = a3;
  v14(v15 + v12, v10, a2);
  v14((uint64_t)v10, v19, a2);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  result = ((uint64_t (*)(uint64_t, char *, uint64_t))v14)(v16 + v12, v10, a2);
  *a4 = sub_20AE856C8;
  a4[1] = (uint64_t (*)())v13;
  a4[2] = sub_20AE856E8;
  a4[3] = (uint64_t (*)())v15;
  a4[4] = (uint64_t (*)())sub_20AE85780;
  a4[5] = (uint64_t (*)())v16;
  return result;
}

_QWORD *_ContentViewScene.init<A>(role:_:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  _QWORD *result;

  v11 = *a1;
  v12 = a1[1];
  result = (_QWORD *)swift_allocObject();
  result[2] = a4;
  result[3] = a5;
  result[4] = a2;
  result[5] = a3;
  *a6 = v11;
  a6[1] = v12;
  a6[2] = sub_20AE857D8;
  a6[3] = result;
  return result;
}

_QWORD *_ContentViewScene.init<A>(id:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  _QWORD *result;

  result = (_QWORD *)swift_allocObject();
  result[2] = a5;
  result[3] = a6;
  result[4] = a3;
  result[5] = a4;
  *a7 = a1;
  a7[1] = a2;
  a7[2] = sub_20AE84A60;
  a7[3] = result;
  return result;
}

double sub_20AE84044@<D0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, _OWORD *a4@<X8>)
{
  void (*v7)(void);
  uint64_t v8;
  char *v9;
  __int128 v10;
  double result;
  _OWORD v12[2];
  __int128 v13;

  v7 = (void (*)(void))MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7();
  sub_20AE83DD8(v9, a2, a3, (uint64_t (**)())v12);
  v10 = v12[1];
  *a4 = v12[0];
  a4[1] = v10;
  result = *(double *)&v13;
  a4[2] = v13;
  return result;
}

uint64_t _ConfigurationScene.init(main:scenes:)@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t result;

  result = sub_20AE832DC(a1, a3);
  *(_QWORD *)(a3 + 40) = a2;
  return result;
}

uint64_t _ConfigurationScene.init(scenes:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = sub_20AE9D0C4();
  v5 = MEMORY[0x24BDC7948];
  a2[3] = v4;
  a2[4] = v5;
  __swift_allocate_boxed_opaque_existential_1(a2);
  result = sub_20AE9D0B8();
  a2[5] = a1;
  return result;
}

Swift::Bool __swiftcall _ConfigurationScene.shouldAccept(connection:)(NSXPCConnection connection)
{
  _QWORD *v1;

  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  return sub_20AE9D0DC() & 1;
}

uint64_t sub_20AE8419C()
{
  _QWORD *v0;

  __swift_project_boxed_opaque_existential_1(v0, v0[3]);
  return sub_20AE9D0DC() & 1;
}

void _ConfigurationScene.content.getter(uint64_t (**a1)()@<X8>)
{
  *a1 = sub_20AE84AB8;
  a1[1] = 0;
}

void sub_20AE841F8(uint64_t (**a1)()@<X8>)
{
  *a1 = sub_20AE84AB8;
  a1[1] = 0;
}

void static _SceneBuilder.buildBlock(_:)(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  id v4;
  objc_class *v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  sub_20AE81E98(0, &qword_253DA1158);
  v4 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
  v5 = (objc_class *)type metadata accessor for _ViewSceneFactory();
  v6 = (char *)objc_allocWithZone(v5);
  *(_QWORD *)&v6[OBJC_IVAR____TtC12ExtensionKitP33_B73671B6E3271B2B0FF13F0EEBE6E03017_ViewSceneFactory_scenes] = a1;
  v10.receiver = v6;
  v10.super_class = v5;
  swift_bridgeObjectRetain();
  v7 = objc_msgSendSuper2(&v10, sel_init);
  objc_msgSend(v4, sel_setSceneFactory_, v7, v10.receiver, v10.super_class);

  v8 = sub_20AE9D0C4();
  v9 = MEMORY[0x24BDC7948];
  a2[3] = v8;
  a2[4] = v9;
  __swift_allocate_boxed_opaque_existential_1(a2);
  swift_bridgeObjectRetain();
  sub_20AE9D0B8();

  a2[5] = a1;
}

uint64_t static _SceneBuilder.buildBlock(_:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  id v6;
  objc_class *v7;
  char *v8;
  id v9;
  objc_super v11;

  sub_20AE81E98(0, &qword_253DA1158);
  v6 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
  v7 = (objc_class *)type metadata accessor for _ViewSceneFactory();
  v8 = (char *)objc_allocWithZone(v7);
  *(_QWORD *)&v8[OBJC_IVAR____TtC12ExtensionKitP33_B73671B6E3271B2B0FF13F0EEBE6E03017_ViewSceneFactory_scenes] = a2;
  v11.receiver = v8;
  v11.super_class = v7;
  swift_bridgeObjectRetain();
  v9 = objc_msgSendSuper2(&v11, sel_init);
  objc_msgSend(v6, sel_setSceneFactory_, v9, v11.receiver, v11.super_class);

  sub_20AE84B80(a1, a3);
  *(_QWORD *)(a3 + 40) = a2;
  return swift_bridgeObjectRetain();
}

id sub_20AE843E0(void *a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(_QWORD *__return_ptr, uint64_t);
  uint64_t v10;
  char v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)();
  uint64_t (*v16)();
  uint64_t (*v17)();
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  void *v23;
  _QWORD v24[6];
  _QWORD v25[6];

  v2 = a1;
  v3 = objc_msgSend(a1, sel_role);
  v4 = *(_QWORD *)(v1 + OBJC_IVAR____TtC12ExtensionKitP33_B73671B6E3271B2B0FF13F0EEBE6E03017_ViewSceneFactory_scenes);
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    v23 = v2;
    swift_bridgeObjectRetain_n();
    v6 = v4 + 56;
    while (1)
    {
      v8 = *(_QWORD *)(v6 - 24);
      v7 = *(_QWORD *)(v6 - 16);
      v9 = *(void (**)(_QWORD *__return_ptr, uint64_t))(v6 - 8);
      if (v8 == sub_20AE9D3D0() && v7 == v10)
        break;
      v12 = sub_20AE9D5BC();
      swift_bridgeObjectRetain();
      swift_retain();
      swift_bridgeObjectRelease();
      if ((v12 & 1) != 0)
        goto LABEL_12;
      swift_release();
      swift_bridgeObjectRelease();
      v6 += 32;
      if (!--v5)
      {
        swift_bridgeObjectRelease_n();
        v13 = 0;
        v14 = 0;
        v8 = 0;
        v7 = 0;
        v15 = sub_20AE85690;
        v16 = sub_20AE83C1C;
        v17 = sub_20AE83A40;
        goto LABEL_13;
      }
    }
    swift_retain();
LABEL_12:
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRetain();
    v18 = swift_retain();
    v9(v24, v18);
    swift_release();
    swift_bridgeObjectRelease();
    v15 = (void (*)())v24[4];
    v5 = v24[5];
    v16 = (uint64_t (*)())v24[2];
    v14 = v24[3];
    v17 = (uint64_t (*)())v24[0];
    v13 = v24[1];
LABEL_13:
    v2 = v23;
  }
  else
  {
    v13 = 0;
    v14 = 0;
    v8 = 0;
    v7 = 0;
    v15 = sub_20AE85690;
    v16 = sub_20AE83C1C;
    v17 = sub_20AE83A40;
  }
  v25[0] = v17;
  v25[1] = v13;
  v25[2] = v16;
  v25[3] = v14;
  v25[4] = v15;
  v25[5] = v5;
  swift_retain();
  swift_retain();
  swift_retain();
  v19 = objc_msgSend(v2, sel_parameters);
  v20 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_25462E060));
  v21 = sub_20AE85368((uint64_t)v25, v19);

  swift_release();
  swift_release();
  swift_release();

  sub_20AE85694(v8, v7);
  swift_release();
  swift_release();
  swift_release();
  return v21;
}

id sub_20AE846C8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _ViewSceneFactory();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_20AE8470C()
{
  return (id)sub_20AE85644();
}

void sub_20AE8472C(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a1;
  sub_20AE84774((uint64_t)a3);

}

void sub_20AE84774(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x60);
  v3 = *(void **)((char *)v1 + v2);
  *(_QWORD *)((char *)v1 + v2) = a1;

}

uint64_t sub_20AE84798(uint64_t a1)
{
  _QWORD *v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x58) + 32))(a1, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x50)) & 1;
}

uint64_t sub_20AE847DC(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  LOBYTE(a1) = sub_20AE84798((uint64_t)v4);

  return a1 & 1;
}

void sub_20AE84828()
{
  sub_20AE85664();
}

id sub_20AE84844(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for _ViewSceneAdaptor(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x58), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_20AE84890(char *a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v3 = *MEMORY[0x24BEE4EA0] & *(_QWORD *)a1;

  return (*(uint64_t (**)(char *))(*(_QWORD *)(*(_QWORD *)(v3 + 80) - 8) + 8))(&a1[*(_QWORD *)((*v2 & *(_QWORD *)a1) + 0x68)]);
}

uint64_t sub_20AE848F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
  swift_getAssociatedConformanceWitness();
  return sub_20AE9D364();
}

uint64_t sub_20AE849BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t (**v1)(void);
  uint64_t result;

  result = (*v1)();
  *a1 = result;
  return result;
}

uint64_t sub_20AE849E4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_20AE84A08(uint64_t *a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 32);
  v4 = *a1;
  return v2(&v4);
}

uint64_t sub_20AE84A3C()
{
  swift_release();
  return swift_deallocObject();
}

double sub_20AE84A60@<D0>(_OWORD *a1@<X8>)
{
  uint64_t *v1;

  return sub_20AE84044(v1[4], v1[2], v1[3], a1);
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_20AE84AB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  if (qword_25462DA68 != -1)
    swift_once();
  v0 = qword_25462E288;
  v1 = unk_25462E290;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25462E068);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_20AE9F8B0;
  swift_bridgeObjectRetain_n();
  sub_20AE81AE4(v0, v1, (_QWORD *)(v2 + 32));
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t type metadata accessor for _ViewSceneFactory()
{
  return objc_opt_self();
}

uint64_t sub_20AE84B80(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_20AE84BC4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t dispatch thunk of _ViewScene.body.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of _ViewScene.shouldAccept(connection:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of _ViewScene.consume(initializationParameters:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

ValueMetadata *type metadata accessor for _EmptyViewScene()
{
  return &type metadata for _EmptyViewScene;
}

uint64_t destroy for _ContentViewScene()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for _ContentViewScene(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for _ContentViewScene(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for _ContentViewScene(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for _ContentViewScene(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for _ContentViewScene(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for _ContentViewScene()
{
  return &type metadata for _ContentViewScene;
}

uint64_t destroy for _ConfigurationScene(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for _ConfigurationScene(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for _ConfigurationScene(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for _ConfigurationScene(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for _ConfigurationScene(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for _ConfigurationScene(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for _ConfigurationScene()
{
  return &type metadata for _ConfigurationScene;
}

uint64_t sub_20AE850C0()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for _ViewSceneAdaptor(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _ViewSceneAdaptor);
}

uint64_t sub_20AE85148()
{
  return MEMORY[0x24BDF5130];
}

uint64_t destroy for _AnyViewScene()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for _AnyViewScene(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for _AnyViewScene(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for _AnyViewScene(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for _AnyViewScene(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for _AnyViewScene(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
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
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for _AnyViewScene()
{
  return &type metadata for _AnyViewScene;
}

uint64_t sub_20AE85358()
{
  return swift_getOpaqueTypeConformance2();
}

id sub_20AE85368(uint64_t a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);
  void (*v6)(_QWORD);
  _QWORD *v7;
  uint64_t v8;
  _OWORD *v9;
  __int128 v10;
  _QWORD *v11;
  id v12;
  id v13;
  os_log_type_t v14;
  NSObject *v15;
  id v16;
  uint8_t *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void (*v25)(_QWORD);
  objc_super v26;
  uint64_t v27;

  v3 = v2;
  v5 = *(uint64_t (**)(void))a1;
  v6 = *(void (**)(_QWORD))(a1 + 32);
  v7 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v8 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v3) + 0x60);
  *(_QWORD *)((char *)v3 + v8) = 0;
  v9 = (_OWORD *)((char *)v3 + *(_QWORD *)((*v7 & *v3) + 0x68));
  v10 = *(_OWORD *)(a1 + 16);
  *v9 = *(_OWORD *)a1;
  v9[1] = v10;
  v9[2] = *(_OWORD *)(a1 + 32);
  swift_retain();
  swift_retain();
  swift_retain();
  v11 = v3;
  v12 = objc_msgSend(a2, sel_initializationParametersPromise);
  if (v12)
  {
    v13 = v12;
    v14 = sub_20AE9D4D8();
    sub_20AE81E98(0, (unint64_t *)&qword_253DA1160);
    v15 = sub_20AE9D508();
    if (os_log_type_enabled(v15, v14))
    {
      v25 = v6;
      v16 = v13;
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v27 = v18;
      *(_DWORD *)v17 = 136315138;
      v19 = v16;
      v20 = sub_20AE9D3DC();
      sub_20AE98A70(v20, v21, &v27);
      sub_20AE9D520();

      v6 = v25;
      swift_bridgeObjectRelease();
      swift_arrayDestroy();
      MEMORY[0x20BD345D0](v18, -1, -1);
      MEMORY[0x20BD345D0](v17, -1, -1);
    }

    v27 = (uint64_t)v13;
    v6(&v27);

  }
  v27 = v5();
  sub_20AE9D364();
  sub_20AE9D22C();
  swift_release();
  objc_opt_self();
  v22 = swift_dynamicCastObjCClassUnconditional();
  v23 = *(void **)((char *)v3 + v8);
  *(_QWORD *)((char *)v3 + v8) = v22;

  v26.receiver = v11;
  v26.super_class = (Class)__swift_instantiateConcreteTypeFromMangledName(&qword_25462E060);
  return objc_msgSendSuper2(&v26, sel_init);
}

uint64_t sub_20AE85644()
{
  _QWORD *v0;

  return *(_QWORD *)((char *)v0 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0x60));
}

void sub_20AE85664()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_20AE85694(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_20AE856C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  return sub_20AE848F4(v0 + ((v2 + 32) & ~v2), v1, *(_QWORD *)(v0 + 24));
}

uint64_t sub_20AE856E8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 24) + 32))() & 1;
}

uint64_t objectdestroy_14Tm()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_20AE85780(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + 24);
  v4 = *a1;
  return (*(uint64_t (**)(uint64_t *))(v2 + 40))(&v4);
}

uint64_t sub_20AE857CC()
{
  return MEMORY[0x24BDF4768];
}

double AppExtensionManager.configuration.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)a1 = sub_20AE96FA8;
  result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  return result;
}

void AppExtensionManagerScene.body.getter(uint64_t (**a1)()@<X8>)
{
  *a1 = sub_20AE972F4;
  a1[1] = 0;
  a1[2] = (uint64_t (*)())0x746C7561666564;
  a1[3] = (uint64_t (*)())0xE700000000000000;
  a1[4] = sub_20AE97100;
  a1[5] = 0;
  a1[6] = sub_20AE83C1C;
  a1[7] = 0;
}

void sub_20AE8584C(uint64_t (**a1)()@<X8>)
{
  *a1 = sub_20AE972F4;
  a1[1] = 0;
  a1[2] = (uint64_t (*)())0x746C7561666564;
  a1[3] = (uint64_t (*)())0xE700000000000000;
  a1[4] = sub_20AE97100;
  a1[5] = 0;
  a1[6] = sub_20AE83C1C;
  a1[7] = 0;
}

uint64_t sub_20AE8588C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD v17[2];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25462E128);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25462E120);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25462E118);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = v0
      + OBJC_IVAR____TtCV12ExtensionKit19ExtensionPickerViewP33_ABD14ED04C699754E7718E30E84C391A5Model__containerApps;
  v17[0] = MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25462E0A8);
  sub_20AE9D130();
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v12, v11, v8);
  v13 = v0 + OBJC_IVAR____TtCV12ExtensionKit19ExtensionPickerViewP33_ABD14ED04C699754E7718E30E84C391A5Model__hostAppName;
  v17[0] = 0x44454C5449544E55;
  v17[1] = 0xE800000000000000;
  sub_20AE9D130();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v13, v7, v4);
  v14 = sub_20AE9D4B4();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v3, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = v0;
  swift_retain();
  sub_20AE865F0((uint64_t)v3, (uint64_t)&unk_25462E138, (uint64_t)v15);
  swift_release();
  return v0;
}

uint64_t sub_20AE85A78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4[17] = a4;
  v5 = sub_20AE9CFF8();
  v4[18] = v5;
  v4[19] = *(_QWORD *)(v5 - 8);
  v4[20] = swift_task_alloc();
  v4[21] = swift_task_alloc();
  v6 = sub_20AE9CFEC();
  v4[22] = v6;
  v4[23] = *(_QWORD *)(v6 - 8);
  v4[24] = swift_task_alloc();
  v7 = sub_20AE9CFD4();
  v4[25] = v7;
  v4[26] = *(_QWORD *)(v7 - 8);
  v4[27] = swift_task_alloc();
  v8 = sub_20AE9CEFC();
  v4[28] = v8;
  v4[29] = *(_QWORD *)(v8 - 8);
  v4[30] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20AE85B8C()
{
  uint64_t v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _OWORD *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  __int128 v31;
  __int128 v32;

  sub_20AE81E98(0, &qword_253DA1158);
  v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
  *(_QWORD *)(v0 + 248) = v1;
  objc_msgSend(v1, sel_hostAuditToken);
  v2 = (void *)objc_opt_self();
  *(_QWORD *)(v0 + 120) = 0;
  *(_OWORD *)(v0 + 320) = v31;
  *(_OWORD *)(v0 + 336) = v32;
  v3 = objc_msgSend(v2, sel_bundleRecordForAuditToken_error_, v0 + 320, v0 + 120);
  *(_QWORD *)(v0 + 256) = v3;
  v4 = *(void **)(v0 + 120);
  if (!v3)
  {
    v24 = v4;
    v25 = (void *)sub_20AE9CEE4();

    swift_willThrow();
LABEL_14:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v5 = v3;
  objc_opt_self();
  v6 = (void *)swift_dynamicCastObjCClass();
  v7 = v4;
  if (!v6)
  {

    goto LABEL_14;
  }
  v8 = (_OWORD *)(v0 + 48);
  v9 = objc_msgSend(v6, sel_localizedName);
  v10 = sub_20AE9D3D0();
  v12 = v11;

  swift_getKeyPath();
  swift_getKeyPath();
  *(_QWORD *)(v0 + 80) = v10;
  *(_QWORD *)(v0 + 88) = v12;
  swift_retain();
  sub_20AE9D148();
  *(_QWORD *)(v0 + 264) = objc_msgSend((id)objc_opt_self(), sel_enumeratorWithParentApplicationRecord_, v6);
  sub_20AE9D4CC();
  sub_20AE9CEF0();
  if (*(_QWORD *)(v0 + 72))
  {
    v13 = MEMORY[0x24BEE4AF8];
    v14 = *(_QWORD *)(v0 + 152);
    while (1)
    {
      sub_20AE8B370(v8, (_OWORD *)(v0 + 16));
      sub_20AE81E98(0, &qword_25462E160);
      if (!swift_dynamicCast())
        return sub_20AE9D574();
      v15 = *(_QWORD *)(v0 + 160);
      v16 = *(_QWORD *)(v0 + 168);
      v17 = *(_QWORD *)(v0 + 144);
      v18 = *(id *)(v0 + 128);
      sub_20AE9CFC8();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v15, v16, v17);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v13 = sub_20AE8891C(0, *(_QWORD *)(v13 + 16) + 1, 1, v13, &qword_25462E168, (uint64_t (*)(_QWORD))MEMORY[0x24BDC7840]);
      v20 = *(_QWORD *)(v13 + 16);
      v19 = *(_QWORD *)(v13 + 24);
      if (v20 >= v19 >> 1)
        v13 = sub_20AE8891C(v19 > 1, v20 + 1, 1, v13, &qword_25462E168, (uint64_t (*)(_QWORD))MEMORY[0x24BDC7840]);
      v21 = *(_QWORD *)(v0 + 160);
      v22 = *(_QWORD *)(v0 + 168);
      v23 = *(_QWORD *)(v0 + 144);
      *(_QWORD *)(v13 + 16) = v20 + 1;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v14 + 32))(v13+ ((*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80))+ *(_QWORD *)(v14 + 72) * v20, v21, v23);

      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v22, v23);
      v8 = (_OWORD *)(v0 + 48);
      sub_20AE9CEF0();
      if (!*(_QWORD *)(v0 + 72))
        goto LABEL_16;
    }
  }
  else
  {
    v13 = MEMORY[0x24BEE4AF8];
LABEL_16:
    v28 = *(_QWORD *)(v0 + 184);
    v27 = *(_QWORD *)(v0 + 192);
    v29 = *(_QWORD *)(v0 + 176);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 232) + 8))(*(_QWORD *)(v0 + 240), *(_QWORD *)(v0 + 224));
    *(_QWORD *)(v0 + 96) = v13;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25462E140);
    sub_20AE8BBFC(&qword_25462E148, &qword_25462E140, MEMORY[0x24BEE12E0]);
    sub_20AE9D4C0();
    swift_bridgeObjectRelease();
    sub_20AE9CFE0();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
    *(_QWORD *)(v0 + 272) = sub_20AE8B330(&qword_25462E150, (uint64_t (*)(uint64_t))MEMORY[0x24BDC7808], MEMORY[0x24BDC7810]);
    v30 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 280) = v30;
    *v30 = v0;
    v30[1] = sub_20AE860FC;
    return sub_20AE9D484();
  }
}

uint64_t sub_20AE860FC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    *(_QWORD *)(v2 + 312) = v0;
  return swift_task_switch();
}

uint64_t sub_20AE861AC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 288) = *(_QWORD *)(v0 + 104);
  return swift_task_switch();
}

uint64_t sub_20AE86214()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  void *v4;
  void *v5;
  void *v6;

  v1 = *(_QWORD *)(v0 + 288);
  if (v1)
  {
    v2 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 296) = v2;
    *v2 = v0;
    v2[1] = sub_20AE86334;
    return sub_20AE8671C(v1);
  }
  else
  {
    v4 = *(void **)(v0 + 256);
    v5 = *(void **)(v0 + 264);
    v6 = *(void **)(v0 + 248);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 208) + 8))(*(_QWORD *)(v0 + 216), *(_QWORD *)(v0 + 200));

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_20AE86334()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *v0;
  v2 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 304) = v3;
  *v3 = v2;
  v3[1] = sub_20AE863E4;
  return sub_20AE9D484();
}

uint64_t sub_20AE863E4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    *(_QWORD *)(v2 + 312) = v0;
  return swift_task_switch();
}

uint64_t sub_20AE86494()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 112) = *(_QWORD *)(v0 + 312);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25462E158);
  swift_willThrowTypedImpl();
  return swift_task_switch();
}

uint64_t sub_20AE86520()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(void **)(v0 + 256);
  v2 = *(void **)(v0 + 248);
  v4 = *(_QWORD *)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 216);
  v5 = *(_QWORD *)(v0 + 200);

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20AE865F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_20AE9D4B4();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_20AE9D4A8();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_20AE8B2F0(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_20AE9D46C();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_20AE8671C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[3] = a1;
  v2[4] = v1;
  v3 = sub_20AE9D0AC();
  v2[5] = v3;
  v2[6] = *(_QWORD *)(v3 - 8);
  v2[7] = swift_task_alloc();
  v2[8] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25462E0F0);
  v2[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_20AE867B0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(_QWORD, _QWORD, _QWORD);
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(unint64_t, uint64_t, uint64_t);
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  unint64_t v22;
  id v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  id v32;
  char isUniquelyReferenced_nonNull_native;
  char v34;
  unint64_t v35;
  uint64_t v36;
  _BOOL8 v37;
  uint64_t result;
  char v39;
  char v40;
  uint64_t *v41;
  _QWORD *v42;
  uint64_t v43;
  BOOL v44;
  uint64_t v45;
  void (*v46)(_QWORD, uint64_t, uint64_t, _QWORD);
  uint64_t v47;
  void (*v48)(_QWORD, _QWORD, _QWORD);
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  void (*v52)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  id v55;
  _QWORD *v56;

  v1 = v0[3];
  v2 = *(_QWORD *)(v1 + 16);
  v3 = v0[6];
  if (v2)
  {
    v51 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    v4 = v1 + v51;
    v5 = *(_QWORD *)(v3 + 72);
    v6 = *(void (**)(_QWORD, _QWORD, _QWORD))(v3 + 16);
    swift_bridgeObjectRetain();
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    v49 = v5;
    v50 = v3;
    v48 = v6;
    while (1)
    {
      v10 = v0[9];
      v11 = v0[5];
      v6(v10, v4, v11);
      v52 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56);
      v52(v10, 0, 1, v11);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v10, 1, v11) == 1)
        goto LABEL_29;
      v12 = *(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32);
      v12(v0[8], v0[9], v0[5]);
      v13 = (void *)sub_20AE9D04C();
      if (v13)
        break;
LABEL_5:
      (*(void (**)(_QWORD, _QWORD))(v3 + 8))(v0[8], v0[5]);
      v4 += v5;
      if (!--v2)
      {
        v52(v0[9], 1, 1, v0[5]);
        goto LABEL_29;
      }
    }
    v14 = v13;
    v53 = v4;
    v15 = objc_msgSend(v13, sel_persistentIdentifier);
    v16 = sub_20AE9CF2C();
    v18 = v17;

    v54 = v2;
    if (v7[2] && (v19 = sub_20AE88B28(v16, v18), (v20 & 1) != 0))
    {
      v21 = v7[7] + 16 * v19;
      v22 = *(_QWORD *)(v21 + 8);
      v23 = *(id *)v21;
      swift_bridgeObjectRetain();
      sub_20AE88CD8(v16, v18);
    }
    else
    {
      sub_20AE88CD8(v16, v18);
      v23 = v14;
      v22 = MEMORY[0x24BEE4AF8];
    }
    v6(v0[7], v0[8], v0[5]);
    v55 = v14;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v22 = sub_20AE8891C(0, *(_QWORD *)(v22 + 16) + 1, 1, v22, &qword_25462E100, (uint64_t (*)(_QWORD))MEMORY[0x24BDC7920]);
    v25 = *(_QWORD *)(v22 + 16);
    v24 = *(_QWORD *)(v22 + 24);
    if (v25 >= v24 >> 1)
      v22 = sub_20AE8891C(v24 > 1, v25 + 1, 1, v22, &qword_25462E100, (uint64_t (*)(_QWORD))MEMORY[0x24BDC7920]);
    v26 = v0[7];
    v27 = v0[5];
    *(_QWORD *)(v22 + 16) = v25 + 1;
    v12(v22 + v51 + v25 * v5, v26, v27);
    v28 = objc_msgSend(v14, sel_persistentIdentifier);
    v29 = sub_20AE9CF2C();
    v31 = v30;

    v32 = v23;
    swift_bridgeObjectRetain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v56 = v7;
    v35 = sub_20AE88B28(v29, v31);
    v36 = v7[2];
    v37 = (v34 & 1) == 0;
    result = v36 + v37;
    if (__OFADD__(v36, v37))
    {
      __break(1u);
LABEL_32:
      __break(1u);
      return result;
    }
    v39 = v34;
    if (v7[3] < result)
    {
      sub_20AE89EA4(result, isUniquelyReferenced_nonNull_native);
      v7 = v56;
      result = sub_20AE88B28(v29, v31);
      if ((v39 & 1) != (v40 & 1))
        return sub_20AE9D5D4();
      v35 = result;
      if ((v39 & 1) == 0)
        goto LABEL_23;
LABEL_3:
      v8 = v7[7] + 16 * v35;
      v9 = *(void **)v8;
      swift_bridgeObjectRelease();

      *(_QWORD *)v8 = v32;
      *(_QWORD *)(v8 + 8) = v22;
LABEL_4:
      swift_bridgeObjectRelease();
      sub_20AE88CD8(v29, v31);

      swift_bridgeObjectRelease();
      v5 = v49;
      v3 = v50;
      v4 = v53;
      v2 = v54;
      v6 = v48;
      goto LABEL_5;
    }
    if ((isUniquelyReferenced_nonNull_native & 1) != 0)
    {
      if ((v34 & 1) != 0)
        goto LABEL_3;
    }
    else
    {
      result = (uint64_t)sub_20AE8AB48();
      v7 = v56;
      if ((v39 & 1) != 0)
        goto LABEL_3;
    }
LABEL_23:
    v7[(v35 >> 6) + 8] |= 1 << v35;
    v41 = (uint64_t *)(v7[6] + 16 * v35);
    *v41 = v29;
    v41[1] = v31;
    v42 = (_QWORD *)(v7[7] + 16 * v35);
    *v42 = v32;
    v42[1] = v22;
    v43 = v7[2];
    v44 = __OFADD__(v43, 1);
    v45 = v43 + 1;
    if (v44)
      goto LABEL_32;
    v7[2] = v45;
    sub_20AE8AD14(v29, v31);
    goto LABEL_4;
  }
  v46 = *(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v3 + 56);
  swift_bridgeObjectRetain();
  v7 = (_QWORD *)MEMORY[0x24BEE4B00];
  v46(v0[9], 1, 1, v0[5]);
LABEL_29:
  v0[10] = v7;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain_n();
  v47 = sub_20AE88BF4((uint64_t)v7);
  swift_bridgeObjectRelease();
  v56 = (_QWORD *)v47;
  sub_20AE88B8C((uint64_t *)&v56);
  swift_bridgeObjectRelease();
  v0[11] = v56;
  sub_20AE9D49C();
  v0[12] = sub_20AE9D490();
  sub_20AE9D46C();
  return swift_task_switch();
}

uint64_t sub_20AE86C94()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 88);
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  *(_QWORD *)(v0 + 16) = v1;
  swift_retain();
  sub_20AE9D148();
  return swift_task_switch();
}

uint64_t sub_20AE86D28()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20AE86D7C()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20AE9D13C();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_20AE86DEC()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20AE9D13C();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_20AE86E5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0
     + OBJC_IVAR____TtCV12ExtensionKit19ExtensionPickerViewP33_ABD14ED04C699754E7718E30E84C391A5Model__containerApps;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25462E118);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtCV12ExtensionKit19ExtensionPickerViewP33_ABD14ED04C699754E7718E30E84C391A5Model__hostAppName;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25462E120);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance();
}

uint64_t sub_20AE86EDC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for ExtensionPickerView.Model(0);
  result = sub_20AE9D124();
  *a1 = result;
  return result;
}

uint64_t sub_20AE86F18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  unsigned __int8 v12;
  unsigned __int8 v13;
  unsigned __int8 v14;
  char v15;
  uint64_t v16;
  char v17;
  _BYTE *v18;
  _BYTE *v19;
  uint64_t v20;
  void (*v21)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(_BYTE *, uint64_t);
  _BYTE v29[12];
  int v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE *v36;
  uint64_t v37;

  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_25462E178);
  v35 = *(_QWORD *)(v37 - 8);
  v2 = MEMORY[0x24BDAC7A8](v37);
  v36 = &v29[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v2);
  v5 = &v29[-v4];
  v6 = sub_20AE9D1D8();
  MEMORY[0x24BDAC7A8](v6);
  sub_20AE9D1CC();
  sub_20AE9D1C0();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20AE9D13C();
  swift_release();
  swift_release();
  sub_20AE9D1B4();
  swift_bridgeObjectRelease();
  sub_20AE9D1C0();
  sub_20AE9D1F0();
  v7 = sub_20AE9D2EC();
  v32 = v8;
  v33 = v7;
  v10 = v9;
  v34 = v11;
  v12 = sub_20AE9D2B0();
  v13 = sub_20AE9D2BC();
  v14 = sub_20AE9D2D4();
  v15 = sub_20AE9D2C8();
  sub_20AE9D2C8();
  if (sub_20AE9D2C8() != v12)
    v15 = sub_20AE9D2C8();
  sub_20AE9D2C8();
  if (sub_20AE9D2C8() != v13)
    v15 = sub_20AE9D2C8();
  sub_20AE9D2C8();
  v16 = sub_20AE9D2C8();
  if (v16 != v14)
  {
    v16 = sub_20AE9D2C8();
    v15 = v16;
  }
  v17 = v10 & 1;
  v30 = v10 & 1;
  MEMORY[0x24BDAC7A8](v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25462E180);
  sub_20AE8B85C(&qword_25462E188, &qword_25462E180, (uint64_t (*)(void))sub_20AE8B654);
  sub_20AE9D2E0();
  v18 = v5;
  v31 = v5;
  v20 = v35;
  v19 = v36;
  v21 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v35 + 16);
  v22 = v37;
  v21(v36, v18, v37);
  v24 = v32;
  v23 = v33;
  *(_QWORD *)a1 = v33;
  *(_QWORD *)(a1 + 8) = v24;
  *(_BYTE *)(a1 + 16) = v17;
  *(_QWORD *)(a1 + 24) = v34;
  *(_BYTE *)(a1 + 32) = v15;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_BYTE *)(a1 + 72) = 1;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25462E198);
  v21((_BYTE *)(a1 + *(int *)(v25 + 48)), v19, v22);
  v26 = a1 + *(int *)(v25 + 64);
  *(_QWORD *)v26 = 0;
  *(_BYTE *)(v26 + 8) = 1;
  LOBYTE(v25) = v30;
  sub_20AE8B698(v23, v24, v30);
  v27 = *(void (**)(_BYTE *, uint64_t))(v20 + 8);
  swift_bridgeObjectRetain();
  v27(v31, v22);
  v27(v19, v22);
  sub_20AE8B6A8(v23, v24, v25);
  return swift_bridgeObjectRelease();
}

uint64_t sub_20AE872A8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20AE9D13C();
  swift_release();
  swift_release();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25462E0A8);
  sub_20AE8BBFC(&qword_25462E1A0, &qword_25462E0A8, MEMORY[0x24BEE12D8]);
  sub_20AE8B330(&qword_25462E0E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
  sub_20AE8B654();
  return sub_20AE9D370();
}

void sub_20AE873C4(void *a1)
{
  id v1;

  v1 = objc_msgSend(a1, sel_URL);
  sub_20AE9CF14();

}

void sub_20AE8740C(id *a1)
{
  id v1;

  v1 = objc_msgSend(*a1, sel_URL);
  sub_20AE9CF14();

}

uint64_t sub_20AE87458@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)a1;
  v3 = *(_QWORD *)(a1 + 8);
  *a2 = *(_QWORD *)a1;
  a2[1] = v3;
  v4 = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_20AE87488@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  *(_QWORD *)a1 = sub_20AE9D1FC();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25462E170);
  return sub_20AE86F18(a1 + *(int *)(v2 + 44));
}

uint64_t sub_20AE874E0()
{
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25462E230);
  sub_20AE8BBFC(&qword_25462E238, &qword_25462E230, MEMORY[0x24BEE12D8]);
  sub_20AE8B330(&qword_25462E240, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_20AE8B8C0();
  return sub_20AE9D370();
}

uint64_t sub_20AE875BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  void (*v11)(_BYTE *, uint64_t, uint64_t);
  uint64_t v12;
  void (*v13)(_BYTE *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  _BYTE v18[8];

  v4 = sub_20AE9D0AC();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = &v18[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v6);
  v10 = &v18[-v9];
  v11 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16);
  v11(&v18[-v9], a1, v4);
  v11(v8, (uint64_t)v10, v4);
  type metadata accessor for AppExtensionView.ObservableAppExtensionIdentity(0);
  v12 = swift_allocObject();
  v11((_BYTE *)(v12+ OBJC_IVAR____TtCV12ExtensionKitP33_ABD14ED04C699754E7718E30E84C391A16AppExtensionView30ObservableAppExtensionIdentity_inner), (uint64_t)v8, v4);
  LOBYTE(v11) = sub_20AE9D0A0();
  swift_beginAccess();
  v18[7] = v11 & 1;
  sub_20AE9D130();
  swift_endAccess();
  v13 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
  v13(v8, v4);
  sub_20AE8B330(&qword_25462E1C8, type metadata accessor for AppExtensionView.ObservableAppExtensionIdentity, (uint64_t)"eCTAXR");
  v14 = sub_20AE9D160();
  v16 = v15;
  result = ((uint64_t (*)(_BYTE *, uint64_t))v13)(v10, v4);
  *(_QWORD *)a2 = v14;
  *(_QWORD *)(a2 + 8) = v16;
  *(_BYTE *)(a2 + 16) = 0;
  return result;
}

uint64_t sub_20AE87758@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;

  v4 = sub_20AE8B904(a1);
  v5 = objc_msgSend(a1, sel_localizedName);
  sub_20AE9D3D0();

  sub_20AE8B6BC();
  v6 = sub_20AE9D2F8();
  v8 = v7;
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v6;
  v10 = v9 & 1;
  *(_QWORD *)(a2 + 16) = v7;
  *(_BYTE *)(a2 + 24) = v9 & 1;
  *(_QWORD *)(a2 + 32) = v11;
  swift_retain();
  sub_20AE8B698(v6, v8, v10);
  swift_bridgeObjectRetain();
  sub_20AE8B6A8(v6, v8, v10);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20AE87840()
{
  void **v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  char v12;
  uint64_t v13;

  v1 = *v0;
  v2 = sub_20AE9D1A8();
  sub_20AE87758(v1, (uint64_t)&v8);
  v3 = v8;
  v4 = v10;
  v5 = v11;
  v6 = v9;
  v8 = v2;
  *(_QWORD *)&v9 = 0;
  BYTE8(v9) = 1;
  v10 = v3;
  v11 = v6;
  v12 = v4;
  v13 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25462E208);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25462E210);
  sub_20AE8BBFC(&qword_25462E218, &qword_25462E208, MEMORY[0x24BDF44A0]);
  sub_20AE8B85C(&qword_25462E220, &qword_25462E210, (uint64_t (*)(void))sub_20AE8B8C0);
  return sub_20AE9D37C();
}

uint64_t sub_20AE87944@<X0>(uint64_t a1@<X0>, char a2@<W2>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  _BYTE *v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  _BYTE *v26;
  void (*v27)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(_BYTE *, uint64_t);
  _BYTE v33[12];
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE *v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE *v47;
  uint64_t v48;
  uint64_t v49;

  v38 = a1;
  v5 = sub_20AE9D19C();
  v44 = *(_QWORD *)(v5 - 8);
  v45 = v5;
  MEMORY[0x24BDAC7A8](v5);
  v43 = &v33[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25462E1B0);
  v41 = *(_QWORD *)(v7 - 8);
  v42 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v40 = &v33[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25462E1B8);
  v46 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = &v33[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v10);
  v47 = &v33[-v13];
  v14 = 0;
  if ((a2 & 1) != 0)
    v14 = sub_20AE87E50();
  v39 = v14;
  v48 = sub_20AE9D040();
  v49 = v15;
  sub_20AE8B6BC();
  v16 = sub_20AE9D2F8();
  v35 = v17;
  v36 = v16;
  v37 = v18;
  v34 = v19 & 1;
  sub_20AE9D1E4();
  type metadata accessor for AppExtensionView.ObservableAppExtensionIdentity(0);
  sub_20AE8B330(&qword_25462E1C8, type metadata accessor for AppExtensionView.ObservableAppExtensionIdentity, (uint64_t)"eCTAXR");
  sub_20AE9D16C();
  swift_getKeyPath();
  sub_20AE9D178();
  swift_release();
  swift_release();
  v20 = v40;
  sub_20AE9D358();
  v21 = v43;
  sub_20AE9D190();
  sub_20AE8BBFC(&qword_25462E1D0, &qword_25462E1B0, MEMORY[0x24BDF46C8]);
  sub_20AE8B330(&qword_25462E1D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDEE6D0], MEMORY[0x24BDEE6B0]);
  v22 = v42;
  v23 = v45;
  sub_20AE9D328();
  (*(void (**)(_BYTE *, uint64_t))(v44 + 8))(v21, v23);
  (*(void (**)(_BYTE *, uint64_t))(v41 + 8))(v20, v22);
  v25 = v46;
  v24 = v47;
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v46 + 32))(v47, v12, v9);
  v26 = v12;
  v27 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v25 + 16);
  v27(v26, v24, v9);
  v29 = v35;
  v28 = v36;
  *(_QWORD *)a3 = v39;
  *(_QWORD *)(a3 + 8) = v28;
  *(_QWORD *)(a3 + 16) = v29;
  LOBYTE(v24) = v34;
  *(_BYTE *)(a3 + 24) = v34;
  *(_QWORD *)(a3 + 32) = v37;
  *(_QWORD *)(a3 + 40) = 0;
  *(_BYTE *)(a3 + 48) = 1;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_25462E1E0);
  v27((_BYTE *)(a3 + *(int *)(v30 + 80)), v26, v9);
  swift_retain();
  sub_20AE8B698(v28, v29, (char)v24);
  v31 = *(void (**)(_BYTE *, uint64_t))(v25 + 8);
  swift_bridgeObjectRetain();
  v31(v47, v9);
  v31(v26, v9);
  sub_20AE8B6A8(v28, v29, (char)v24);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20AE87CE0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20AE9D13C();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_20AE87D5C()
{
  char v1;

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_20AE9D148();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20AE9D13C();
  swift_release();
  swift_release();
  if (v1 == 1)
    return sub_20AE9D088();
  else
    return sub_20AE9D094();
}

uint64_t sub_20AE87E50()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t result;

  v0 = sub_20AE9D1D8();
  v1 = MEMORY[0x24BDAC7A8](v0);
  MEMORY[0x24BDAC7A8](v1);
  v2 = (void *)sub_20AE9D064();
  v3 = objc_msgSend(v2, sel_symbol);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_imageForSize_scale_, 32.0, 32.0, 2.0);
    if (v5)
    {
      v6 = v5;
      if (objc_msgSend(v5, sel_CGImage))
        goto LABEL_8;
LABEL_10:
      __break(1u);
      goto LABEL_11;
    }

  }
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE51AB0]), sel_init);
  objc_msgSend(v4, sel_setSize_, 32.0, 32.0);
  v7 = objc_msgSend(v2, sel_prepareImageForDescriptor_, v4);
  if (v7)
  {
    v6 = v7;
    if (objc_msgSend(v7, sel_CGImage))
    {
LABEL_8:
      objc_msgSend(v6, sel_scale);
      sub_20AE9D1CC();
      sub_20AE9D1C0();
      sub_20AE9D040();
      sub_20AE9D1B4();
      swift_bridgeObjectRelease();
      sub_20AE9D1C0();
      sub_20AE9D1F0();
      sub_20AE9D2EC();
      v8 = sub_20AE9D34C();

      return v8;
    }
    __break(1u);
    goto LABEL_10;
  }
LABEL_11:
  result = sub_20AE9D574();
  __break(1u);
  return result;
}

uint64_t sub_20AE881A8()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20AE9D13C();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_20AE88218()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0
     + OBJC_IVAR____TtCV12ExtensionKitP33_ABD14ED04C699754E7718E30E84C391A16AppExtensionView30ObservableAppExtensionIdentity_inner;
  v2 = sub_20AE9D0AC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0
     + OBJC_IVAR____TtCV12ExtensionKitP33_ABD14ED04C699754E7718E30E84C391A16AppExtensionView30ObservableAppExtensionIdentity__enabled;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25462E0E8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  return swift_deallocClassInstance();
}

uint64_t sub_20AE88294@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for AppExtensionView.ObservableAppExtensionIdentity(0);
  result = sub_20AE9D124();
  *a1 = result;
  return result;
}

uint64_t sub_20AE882D0()
{
  return sub_20AE9D334();
}

uint64_t sub_20AE882E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  char v4;
  uint64_t v5;

  v3 = *(_QWORD *)v1;
  v4 = *(_BYTE *)(v1 + 16);
  *(_QWORD *)a1 = sub_20AE9D1A8();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25462E1A8);
  return sub_20AE87944(v3, v4, a1 + *(int *)(v5 + 44));
}

void sub_20AE88348()
{
  id *v0;
  id v1;

  v1 = objc_msgSend(*v0, sel_URL);
  sub_20AE9CF14();

}

unint64_t sub_20AE88394(uint64_t a1)
{
  unint64_t result;

  result = sub_20AE883B8();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_20AE883B8()
{
  unint64_t result;

  result = qword_25462E070;
  if (!qword_25462E070)
  {
    result = MEMORY[0x20BD34540](&protocol conformance descriptor for AppExtensionManagerScene, &type metadata for AppExtensionManagerScene);
    atomic_store(result, (unint64_t *)&qword_25462E070);
  }
  return result;
}

uint64_t sub_20AE883FC()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for AppExtensionManagerScene()
{
  return &type metadata for AppExtensionManagerScene;
}

uint64_t sub_20AE8841C()
{
  return type metadata accessor for ExtensionPickerView.Model(0);
}

uint64_t type metadata accessor for ExtensionPickerView.Model(uint64_t a1)
{
  return sub_20AE884C8(a1, (uint64_t *)&unk_25462E088);
}

void sub_20AE88438(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20AE88518(a1, a2, a3, (void (*)(uint64_t))sub_20AE88454, &qword_25462E0B0);
}

void sub_20AE88454()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25462E0A0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25462E0A8);
    v0 = sub_20AE9D154();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25462E0A0);
  }
}

uint64_t sub_20AE884AC()
{
  return type metadata accessor for AppExtensionView.ObservableAppExtensionIdentity(0);
}

uint64_t type metadata accessor for AppExtensionView.ObservableAppExtensionIdentity(uint64_t a1)
{
  return sub_20AE884C8(a1, (uint64_t *)&unk_25462E0C8);
}

uint64_t sub_20AE884C8(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_20AE884FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_20AE88518(a1, a2, a3, (void (*)(uint64_t))MEMORY[0x24BDC7920], &qword_25462E0D8);
}

void sub_20AE88518(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t), unint64_t *a5)
{
  unint64_t v6;
  unint64_t v7;

  a4(319);
  if (v6 <= 0x3F)
  {
    sub_20AE885B8(319, a5);
    if (v7 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

void sub_20AE885B8(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_20AE9D154();
    if (!v4)
      atomic_store(v3, a2);
  }
}

_UNKNOWN **sub_20AE885FC()
{
  return &protocol witness table for PrimitiveAppExtensionScene;
}

_QWORD *initializeBufferWithCopyOfBuffer for ContainerApp(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ContainerApp(id *a1)
{

  return swift_bridgeObjectRelease();
}

id *assignWithTake for ContainerApp(id *a1, _OWORD *a2)
{

  *(_OWORD *)a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for ContainerApp()
{
  return &type metadata for ContainerApp;
}

uint64_t sub_20AE886BC()
{
  return sub_20AE8B330(&qword_25462E0E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAC0], MEMORY[0x24BDCDAF0]);
}

uint64_t sub_20AE886E8()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_20AE886F8()
{
  return sub_20AE87D5C();
}

uint64_t sub_20AE8871C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20AE9D13C();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_20AE88798()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_20AE9D148();
}

uint64_t sub_20AE88810@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20AE9D13C();
  swift_release();
  result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_20AE88890()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_20AE9D148();
}

uint64_t sub_20AE8891C(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = sub_20AE9D568();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v16 + v20;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(_QWORD *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_20AE8B0EC(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

uint64_t sub_20AE88B28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_20AE9D5E0();
  sub_20AE9CF38();
  v4 = sub_20AE9D5EC();
  return sub_20AE8A1C0(a1, a2, v4);
}

uint64_t sub_20AE88B8C(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_20AE8B0D8(v2);
  v3 = *(_QWORD *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  result = sub_20AE88D1C(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_20AE88BF4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25462E108);
  v3 = swift_allocObject();
  v4 = _swift_stdlib_malloc_size((const void *)v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = 2 * (v5 >> 4);
  v6 = sub_20AE8AEC0((uint64_t)&v8, (_OWORD *)(v3 + 32), v1, a1);
  swift_bridgeObjectRetain();
  sub_20AE8B208();
  if (v6 != v1)
  {
    __break(1u);
    return MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_20AE88CD8(uint64_t a1, unint64_t a2)
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

uint64_t sub_20AE88D1C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  int v39;
  __int128 *v40;
  uint64_t v41;
  uint64_t v42;
  __int128 *v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v61;
  unint64_t v62;
  unint64_t v63;
  char *v64;
  char *v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  BOOL v77;
  unint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  BOOL v87;
  uint64_t v88;
  char v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  BOOL v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  char *v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  unint64_t v110;
  char *v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  unint64_t v117;
  uint64_t *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void **v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  int v135;
  uint64_t v136;

  v3 = a1[1];
  result = sub_20AE9D5B0();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_151;
    if (v3)
      return sub_20AE8967C(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_159;
  v126 = v3;
  v121 = result;
  v130 = v1;
  v118 = a1;
  if (v3 < 2)
  {
    v7 = MEMORY[0x24BEE4AF8];
    v129 = (void **)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v11 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v10 = (char *)MEMORY[0x24BEE4AF8];
LABEL_116:
      v124 = v7;
      if (v11 >= 2)
      {
        v112 = *v118;
        do
        {
          v113 = v11 - 2;
          if (v11 < 2)
            goto LABEL_146;
          if (!v112)
            goto LABEL_158;
          v114 = *(_QWORD *)&v10[16 * v113 + 32];
          v115 = *(_QWORD *)&v10[16 * v11 + 24];
          sub_20AE89854((void **)(v112 + 16 * v114), (id *)(v112 + 16 * *(_QWORD *)&v10[16 * v11 + 16]), v112 + 16 * v115, v129);
          if (v130)
            goto LABEL_128;
          if (v115 < v114)
            goto LABEL_147;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v10 = sub_20AE89E90((uint64_t)v10);
          if (v113 >= *((_QWORD *)v10 + 2))
            goto LABEL_148;
          v116 = &v10[16 * v113 + 32];
          *(_QWORD *)v116 = v114;
          *((_QWORD *)v116 + 1) = v115;
          v117 = *((_QWORD *)v10 + 2);
          if (v11 > v117)
            goto LABEL_149;
          memmove(&v10[16 * v11 + 16], &v10[16 * v11 + 32], 16 * (v117 - v11));
          *((_QWORD *)v10 + 2) = v117 - 1;
          v11 = v117 - 1;
        }
        while (v117 > 2);
      }
      swift_bridgeObjectRelease();
      *(_QWORD *)(v124 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v6 = v5 >> 1;
    v7 = sub_20AE9D448();
    *(_QWORD *)(v7 + 16) = v6;
    v3 = v126;
    v129 = (void **)(v7 + 32);
  }
  v124 = v7;
  v8 = 0;
  v9 = *a1;
  v119 = *a1 - 16;
  v120 = *a1 + 40;
  v10 = (char *)MEMORY[0x24BEE4AF8];
  v131 = *a1;
  while (1)
  {
    v12 = v8;
    v13 = v8 + 1;
    v127 = v8;
    if (v8 + 1 < v3)
    {
      v122 = v10;
      v14 = *(void **)(v9 + 16 * v8);
      v15 = *(id *)(v9 + 16 * v13);
      swift_bridgeObjectRetain();
      v16 = v14;
      swift_bridgeObjectRetain();
      v17 = objc_msgSend(v15, sel_localizedName);
      v18 = sub_20AE9D3D0();
      v20 = v19;

      v21 = objc_msgSend(v16, sel_localizedName);
      v22 = sub_20AE9D3D0();
      v24 = v23;

      if (v18 == v22 && v20 == v24)
        v135 = 0;
      else
        v135 = sub_20AE9D5BC();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      v3 = v126;
      v12 = v127;
      v13 = v127 + 2;
      if (v127 + 2 >= v126)
      {
        v10 = v122;
      }
      else
      {
        v26 = v120 + 16 * v127;
        while (1)
        {
          v132 = v13;
          v27 = *(void **)(v26 - 24);
          v28 = *(id *)(v26 - 8);
          swift_bridgeObjectRetain();
          v29 = v27;
          swift_bridgeObjectRetain();
          v30 = objc_msgSend(v28, sel_localizedName);
          v31 = sub_20AE9D3D0();
          v33 = v32;

          v34 = objc_msgSend(v29, sel_localizedName);
          v35 = sub_20AE9D3D0();
          v37 = v36;

          v38 = v31 == v35 && v33 == v37;
          v39 = v38 ? 0 : sub_20AE9D5BC();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          v3 = v126;
          if (((v135 ^ v39) & 1) != 0)
            break;
          v13 = v132 + 1;
          v26 += 16;
          if (v126 == v132 + 1)
          {
            v13 = v126;
            v10 = v122;
            goto LABEL_35;
          }
        }
        v10 = v122;
        v13 = v132;
LABEL_35:
        v12 = v127;
      }
      v9 = v131;
      if ((v135 & 1) != 0)
      {
        if (v13 < v12)
          goto LABEL_152;
        if (v12 < v13)
        {
          v40 = (__int128 *)(v119 + 16 * v13);
          v41 = v13;
          v42 = v12;
          v43 = (__int128 *)(v131 + 16 * v12);
          do
          {
            if (v42 != --v41)
            {
              if (!v131)
                goto LABEL_157;
              v44 = *v43;
              *v43 = *v40;
              *v40 = v44;
            }
            ++v42;
            --v40;
            ++v43;
          }
          while (v42 < v41);
        }
      }
    }
    if (v13 < v3)
    {
      if (__OFSUB__(v13, v12))
        goto LABEL_150;
      if (v13 - v12 < v121)
        break;
    }
LABEL_68:
    if (v13 < v12)
      goto LABEL_145;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v10 = sub_20AE89CF0(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
    v63 = *((_QWORD *)v10 + 2);
    v62 = *((_QWORD *)v10 + 3);
    v11 = v63 + 1;
    v9 = v131;
    if (v63 >= v62 >> 1)
    {
      v111 = sub_20AE89CF0((char *)(v62 > 1), v63 + 1, 1, v10);
      v9 = v131;
      v10 = v111;
    }
    *((_QWORD *)v10 + 2) = v11;
    v64 = v10 + 32;
    v65 = &v10[16 * v63 + 32];
    *(_QWORD *)v65 = v127;
    *((_QWORD *)v65 + 1) = v13;
    v134 = v13;
    if (v63)
    {
      while (1)
      {
        v66 = v11 - 1;
        if (v11 >= 4)
        {
          v71 = &v64[16 * v11];
          v72 = *((_QWORD *)v71 - 8);
          v73 = *((_QWORD *)v71 - 7);
          v77 = __OFSUB__(v73, v72);
          v74 = v73 - v72;
          if (v77)
            goto LABEL_134;
          v76 = *((_QWORD *)v71 - 6);
          v75 = *((_QWORD *)v71 - 5);
          v77 = __OFSUB__(v75, v76);
          v69 = v75 - v76;
          v70 = v77;
          if (v77)
            goto LABEL_135;
          v78 = v11 - 2;
          v79 = &v64[16 * v11 - 32];
          v81 = *(_QWORD *)v79;
          v80 = *((_QWORD *)v79 + 1);
          v77 = __OFSUB__(v80, v81);
          v82 = v80 - v81;
          if (v77)
            goto LABEL_137;
          v77 = __OFADD__(v69, v82);
          v83 = v69 + v82;
          if (v77)
            goto LABEL_140;
          if (v83 >= v74)
          {
            v101 = &v64[16 * v66];
            v103 = *(_QWORD *)v101;
            v102 = *((_QWORD *)v101 + 1);
            v77 = __OFSUB__(v102, v103);
            v104 = v102 - v103;
            if (v77)
              goto LABEL_144;
            v94 = v69 < v104;
            goto LABEL_105;
          }
        }
        else
        {
          if (v11 != 3)
          {
            v95 = *((_QWORD *)v10 + 4);
            v96 = *((_QWORD *)v10 + 5);
            v77 = __OFSUB__(v96, v95);
            v88 = v96 - v95;
            v89 = v77;
            goto LABEL_99;
          }
          v68 = *((_QWORD *)v10 + 4);
          v67 = *((_QWORD *)v10 + 5);
          v77 = __OFSUB__(v67, v68);
          v69 = v67 - v68;
          v70 = v77;
        }
        if ((v70 & 1) != 0)
          goto LABEL_136;
        v78 = v11 - 2;
        v84 = &v64[16 * v11 - 32];
        v86 = *(_QWORD *)v84;
        v85 = *((_QWORD *)v84 + 1);
        v87 = __OFSUB__(v85, v86);
        v88 = v85 - v86;
        v89 = v87;
        if (v87)
          goto LABEL_139;
        v90 = &v64[16 * v66];
        v92 = *(_QWORD *)v90;
        v91 = *((_QWORD *)v90 + 1);
        v77 = __OFSUB__(v91, v92);
        v93 = v91 - v92;
        if (v77)
          goto LABEL_142;
        if (__OFADD__(v88, v93))
          goto LABEL_143;
        if (v88 + v93 >= v69)
        {
          v94 = v69 < v93;
LABEL_105:
          if (v94)
            v66 = v78;
          goto LABEL_107;
        }
LABEL_99:
        if ((v89 & 1) != 0)
          goto LABEL_138;
        v97 = &v64[16 * v66];
        v99 = *(_QWORD *)v97;
        v98 = *((_QWORD *)v97 + 1);
        v77 = __OFSUB__(v98, v99);
        v100 = v98 - v99;
        if (v77)
          goto LABEL_141;
        if (v100 < v88)
          goto LABEL_14;
LABEL_107:
        v105 = v66 - 1;
        if (v66 - 1 >= v11)
        {
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        if (!v9)
          goto LABEL_156;
        v106 = &v64[16 * v105];
        v107 = *(_QWORD *)v106;
        v108 = &v64[16 * v66];
        v109 = *((_QWORD *)v108 + 1);
        sub_20AE89854((void **)(v9 + 16 * *(_QWORD *)v106), (id *)(v9 + 16 * *(_QWORD *)v108), v9 + 16 * v109, v129);
        if (v130)
        {
LABEL_128:
          swift_bridgeObjectRelease();
          *(_QWORD *)(v124 + 16) = 0;
          return swift_bridgeObjectRelease();
        }
        if (v109 < v107)
          goto LABEL_131;
        if (v66 > *((_QWORD *)v10 + 2))
          goto LABEL_132;
        *(_QWORD *)v106 = v107;
        *(_QWORD *)&v64[16 * v105 + 8] = v109;
        v110 = *((_QWORD *)v10 + 2);
        if (v66 >= v110)
          goto LABEL_133;
        v130 = 0;
        v11 = v110 - 1;
        memmove(&v64[16 * v66], v108 + 16, 16 * (v110 - 1 - v66));
        *((_QWORD *)v10 + 2) = v110 - 1;
        v9 = v131;
        if (v110 <= 2)
          goto LABEL_14;
      }
    }
    v11 = 1;
LABEL_14:
    v3 = v126;
    v8 = v134;
    v7 = v124;
    if (v134 >= v126)
      goto LABEL_116;
  }
  if (__OFADD__(v12, v121))
    goto LABEL_153;
  if (v12 + v121 >= v3)
    v45 = v3;
  else
    v45 = v12 + v121;
  if (v45 >= v12)
  {
    if (v13 != v45)
    {
      v123 = v10;
      v46 = v119 + 16 * v13;
      v125 = v45;
      do
      {
        v48 = *(_OWORD *)(v9 + 16 * v13);
        v128 = v46;
        v133 = v13;
        while (1)
        {
          v136 = v12;
          v49 = *(void **)v46;
          v50 = (id)v48;
          swift_bridgeObjectRetain();
          v51 = v49;
          swift_bridgeObjectRetain();
          v52 = objc_msgSend(v50, sel_localizedName);
          v53 = sub_20AE9D3D0();
          v55 = v54;

          v56 = objc_msgSend(v51, sel_localizedName);
          v57 = sub_20AE9D3D0();
          v59 = v58;

          if (v53 == v57 && v55 == v59)
            break;
          v61 = sub_20AE9D5BC();
          swift_bridgeObjectRelease();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v61 & 1) == 0)
            goto LABEL_56;
          v9 = v131;
          v47 = v133;
          if (!v131)
            goto LABEL_155;
          v48 = *(_OWORD *)(v46 + 16);
          *(_OWORD *)(v46 + 16) = *(_OWORD *)v46;
          *(_OWORD *)v46 = v48;
          v46 -= 16;
          v12 = v136 + 1;
          if (v133 == v136 + 1)
            goto LABEL_57;
        }
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
LABEL_56:
        v9 = v131;
        v47 = v133;
LABEL_57:
        v13 = v47 + 1;
        v12 = v127;
        v46 = v128 + 16;
      }
      while (v13 != v125);
      v13 = v125;
      v10 = v123;
    }
    goto LABEL_68;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  result = sub_20AE9D568();
  __break(1u);
  return result;
}

uint64_t sub_20AE8967C(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v21 = result;
  if (a3 != a2)
  {
    v23 = *a4;
    v4 = *a4 + 16 * a3 - 16;
LABEL_6:
    v6 = *(_OWORD *)(v23 + 16 * a3);
    v25 = v21;
    v22 = v4;
    v24 = a3;
    while (1)
    {
      v7 = *(void **)v4;
      v8 = (id)v6;
      swift_bridgeObjectRetain();
      v9 = v7;
      swift_bridgeObjectRetain();
      v10 = objc_msgSend(v8, sel_localizedName);
      v11 = sub_20AE9D3D0();
      v13 = v12;

      v14 = objc_msgSend(v9, sel_localizedName);
      v15 = sub_20AE9D3D0();
      v17 = v16;

      if (v11 == v15 && v13 == v17)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease_n();
        v5 = v24;
LABEL_5:
        a3 = v5 + 1;
        v4 = v22 + 16;
        if (a3 == a2)
          return result;
        goto LABEL_6;
      }
      v19 = sub_20AE9D5BC();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      v5 = v24;
      if ((v19 & 1) == 0)
        goto LABEL_5;
      if (!v23)
        break;
      v6 = *(_OWORD *)(v4 + 16);
      *(_OWORD *)(v4 + 16) = *(_OWORD *)v4;
      *(_OWORD *)v4 = v6;
      v4 -= 16;
      if (v24 == ++v25)
        goto LABEL_5;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_20AE89854(void **__src, id *a2, unint64_t a3, void **__dst)
{
  void **v4;
  id *v5;
  id *v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v25;
  id *v26;
  id *v27;
  void **v28;
  id *v29;
  id *v30;
  void **v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  BOOL v43;
  char v44;
  id *v45;
  void **v46;
  uint64_t result;
  void *v48;
  void **v49;
  unint64_t v51;
  id *v52;
  id *v53;
  void **v54;
  void **v55;
  id *v56;
  void **v57;
  void **v58;
  id *v59;

  v4 = __dst;
  v5 = a2;
  v6 = __src;
  v7 = (char *)a2 - (char *)__src;
  v8 = (char *)a2 - (char *)__src + 15;
  if ((char *)a2 - (char *)__src >= 0)
    v8 = (char *)a2 - (char *)__src;
  v9 = v8 >> 4;
  v10 = a3 - (_QWORD)a2;
  v11 = a3 - (_QWORD)a2 + 15;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v11 = a3 - (_QWORD)a2;
  v12 = v11 >> 4;
  v59 = __src;
  v58 = __dst;
  if (v9 >= v11 >> 4)
  {
    if (v10 < -15)
      goto LABEL_56;
    if (__dst != a2 || &a2[2 * v12] <= __dst)
      memmove(__dst, a2, 16 * v12);
    v28 = &v4[2 * v12];
    v57 = v28;
    v59 = v5;
    if (v6 >= v5 || v10 < 16)
    {
LABEL_55:
      sub_20AE89DE8((void **)&v59, (const void **)&v58, &v57);
      return 1;
    }
    v29 = (id *)(a3 - 16);
    v30 = v5;
    v53 = v6;
    v55 = v4;
    while (1)
    {
      v56 = v5;
      v51 = (unint64_t)v28;
      v31 = v28 - 2;
      v32 = *(v30 - 2);
      v30 -= 2;
      v33 = *(v28 - 2);
      swift_bridgeObjectRetain();
      v34 = v32;
      swift_bridgeObjectRetain();
      v48 = v33;
      v35 = objc_msgSend(v33, sel_localizedName);
      v36 = sub_20AE9D3D0();
      v38 = v37;

      v39 = objc_msgSend(v34, sel_localizedName);
      v40 = sub_20AE9D3D0();
      v42 = v41;

      v43 = v36 == v40 && v38 == v42;
      v44 = v43 ? 0 : sub_20AE9D5BC();
      v45 = v29 + 2;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      if ((v44 & 1) != 0)
        break;
      v57 = v31;
      if ((unint64_t)v45 < v51 || (unint64_t)v29 >= v51)
      {
        *(_OWORD *)v29 = *(_OWORD *)v31;
        v30 = v56;
        v28 = v31;
        goto LABEL_53;
      }
      v30 = v56;
      if (v45 != (id *)v51)
        *(_OWORD *)v29 = *(_OWORD *)v31;
      v28 = v31;
      v46 = v55;
      if (v56 <= v53)
        goto LABEL_55;
LABEL_54:
      v29 -= 2;
      v5 = v30;
      if (v28 <= v46)
        goto LABEL_55;
    }
    v28 = (void **)v51;
    if (v45 != v56 || v29 >= v56)
      *(_OWORD *)v29 = *(_OWORD *)v30;
    v59 = v30;
LABEL_53:
    v46 = v55;
    if (v30 <= v53)
      goto LABEL_55;
    goto LABEL_54;
  }
  if (v7 >= -15)
  {
    if (__dst != __src || &__src[2 * v9] <= __dst)
      memmove(__dst, __src, 16 * v9);
    v49 = &v4[2 * v9];
    v57 = v49;
    if ((unint64_t)v5 < a3 && v7 >= 16)
    {
      while (1)
      {
        v52 = v6;
        v54 = v4;
        v13 = *v4;
        v14 = *v5;
        swift_bridgeObjectRetain();
        v15 = v13;
        swift_bridgeObjectRetain();
        v16 = objc_msgSend(v14, sel_localizedName);
        v17 = sub_20AE9D3D0();
        v19 = v18;

        v20 = objc_msgSend(v15, sel_localizedName);
        v21 = sub_20AE9D3D0();
        v23 = v22;

        if (v17 == v21 && v19 == v23)
          break;
        v25 = sub_20AE9D5BC();
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v25 & 1) == 0)
          goto LABEL_22;
        v4 = v54;
        v26 = v5 + 2;
        v27 = v52;
        if (v52 < v5 || v52 >= v26 || v52 != v5)
          *(_OWORD *)v52 = *(_OWORD *)v5;
LABEL_25:
        v6 = v27 + 2;
        if (v4 < v49)
        {
          v5 = v26;
          if ((unint64_t)v26 < a3)
            continue;
        }
        v59 = v6;
        goto LABEL_55;
      }
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease_n();
LABEL_22:
      v27 = v52;
      v26 = v5;
      if (v52 != v54)
        *(_OWORD *)v52 = *(_OWORD *)v54;
      v4 = v54 + 2;
      v58 = v54 + 2;
      goto LABEL_25;
    }
    goto LABEL_55;
  }
LABEL_56:
  result = sub_20AE9D598();
  __break(1u);
  return result;
}

char *sub_20AE89CF0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25462E110);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_20AE89DE8(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 15;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -16)
  {
    result = (char *)sub_20AE9D598();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 4;
    if (result != v3 || result >= &v3[16 * v7])
      return (char *)memmove(result, v3, 16 * v7);
  }
  return result;
}

char *sub_20AE89E90(uint64_t a1)
{
  return sub_20AE89CF0(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_20AE89EA4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  __int128 v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  id v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25462E0F8);
  v6 = sub_20AE9D58C();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v12 = (unint64_t)(v8 + 63) >> 6;
    v13 = v6 + 64;
    result = swift_retain();
    v15 = 0;
    while (1)
    {
      if (v11)
      {
        v22 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v23 = v22 | (v15 << 6);
      }
      else
      {
        v24 = v15 + 1;
        if (__OFADD__(v15, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v24 >= v12)
          goto LABEL_33;
        v25 = v9[v24];
        ++v15;
        if (!v25)
        {
          v15 = v24 + 1;
          if (v24 + 1 >= v12)
            goto LABEL_33;
          v25 = v9[v15];
          if (!v25)
          {
            v26 = v24 + 2;
            if (v26 >= v12)
            {
LABEL_33:
              swift_release();
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v34 = 1 << *(_BYTE *)(v5 + 32);
              if (v34 >= 64)
                bzero((void *)(v5 + 64), ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v9 = -1 << v34;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v25 = v9[v26];
            if (!v25)
            {
              while (1)
              {
                v15 = v26 + 1;
                if (__OFADD__(v26, 1))
                  goto LABEL_42;
                if (v15 >= v12)
                  goto LABEL_33;
                v25 = v9[v15];
                ++v26;
                if (v25)
                  goto LABEL_30;
              }
            }
            v15 = v26;
          }
        }
LABEL_30:
        v11 = (v25 - 1) & v25;
        v23 = __clz(__rbit64(v25)) + (v15 << 6);
      }
      v31 = 16 * v23;
      v32 = *(_OWORD *)(*(_QWORD *)(v5 + 48) + v31);
      v35 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + v31);
      v36 = v32;
      if ((a2 & 1) == 0)
      {
        sub_20AE8AD14(v32, *((unint64_t *)&v32 + 1));
        v33 = (id)v35;
        swift_bridgeObjectRetain();
      }
      sub_20AE9D5E0();
      sub_20AE9CF38();
      result = sub_20AE9D5EC();
      v16 = -1 << *(_BYTE *)(v7 + 32);
      v17 = result & ~v16;
      v18 = v17 >> 6;
      if (((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6))) != 0)
      {
        v19 = __clz(__rbit64((-1 << v17) & ~*(_QWORD *)(v13 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
        v20 = v36;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v16) >> 6;
        v20 = v36;
        do
        {
          if (++v18 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v29 = v18 == v28;
          if (v18 == v28)
            v18 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v13 + 8 * v18);
        }
        while (v30 == -1);
        v19 = __clz(__rbit64(~v30)) + (v18 << 6);
      }
      *(_QWORD *)(v13 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      v21 = 16 * v19;
      *(_OWORD *)(*(_QWORD *)(v7 + 48) + v21) = v20;
      *(_OWORD *)(*(_QWORD *)(v7 + 56) + v21) = v35;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_20AE8A1C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v4 = -1 << *(_BYTE *)(v3 + 32);
  v5 = a3 & ~v4;
  if (((*(_QWORD *)(v3 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
    __asm { BR              X8 }
  return a3 & ~v4;
}

void *sub_20AE8AB48()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  __int128 v17;
  id v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  __int128 v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25462E0F8);
  v2 = *v0;
  v3 = sub_20AE9D580();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v19 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v19);
    ++v9;
    if (!v20)
    {
      v9 = v19 + 1;
      if (v19 + 1 >= v13)
        goto LABEL_26;
      v20 = *(_QWORD *)(v6 + 8 * v9);
      if (!v20)
        break;
    }
LABEL_25:
    v12 = (v20 - 1) & v20;
    v15 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = *(_OWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v22 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_OWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + v16) = v22;
    sub_20AE8AD14(v17, *((unint64_t *)&v17 + 1));
    v18 = (id)v22;
    result = (void *)swift_bridgeObjectRetain();
  }
  v21 = v19 + 2;
  if (v21 >= v13)
    goto LABEL_26;
  v20 = *(_QWORD *)(v6 + 8 * v21);
  if (v20)
  {
    v9 = v21;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v20 = *(_QWORD *)(v6 + 8 * v9);
    ++v21;
    if (v20)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_20AE8AD14(uint64_t a1, unint64_t a2)
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

uint64_t sub_20AE8AD58(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25462E108);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_20AE9D598();
  __break(1u);
  return result;
}

uint64_t sub_20AE8AEC0(uint64_t result, _OWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  __int128 v20;
  id v21;
  id v22;
  uint64_t v23;

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_39:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  v23 = -1 << *(_BYTE *)(a4 + 32);
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = *(_OWORD *)(*(_QWORD *)(a4 + 56) + 16 * v16);
    *v11 = v20;
    if (v13 == v10)
    {
      v22 = (id)v20;
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    ++v11;
    v21 = (id)v20;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
    {
      v12 += 2;
      if (v17 + 1 >= v14)
      {
        v9 = 0;
        v12 = v17;
      }
      else
      {
        v18 = *(_QWORD *)(v6 + 8 * v12);
        if (v18)
          goto LABEL_14;
        v19 = v17 + 2;
        if (v17 + 2 >= v14)
          goto LABEL_33;
        v18 = *(_QWORD *)(v6 + 8 * v19);
        if (v18)
        {
LABEL_17:
          v17 = v19;
          goto LABEL_18;
        }
        v12 = v17 + 3;
        if (v17 + 3 < v14)
        {
          v18 = *(_QWORD *)(v6 + 8 * v12);
          if (v18)
          {
LABEL_14:
            v17 = v12;
            goto LABEL_18;
          }
          v19 = v17 + 4;
          if (v17 + 4 >= v14)
          {
LABEL_33:
            v9 = 0;
            goto LABEL_37;
          }
          v18 = *(_QWORD *)(v6 + 8 * v19);
          if (!v18)
          {
            while (1)
            {
              v17 = v19 + 1;
              if (__OFADD__(v19, 1))
                goto LABEL_42;
              if (v17 >= v14)
              {
                v9 = 0;
                v12 = v14 - 1;
                goto LABEL_37;
              }
              v18 = *(_QWORD *)(v6 + 8 * v17);
              ++v19;
              if (v18)
                goto LABEL_18;
            }
          }
          goto LABEL_17;
        }
        v9 = 0;
        v12 = v17 + 2;
      }
LABEL_37:
      v10 = v13;
LABEL_38:
      v7 = v23;
      goto LABEL_39;
    }
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_20AE8B0D8(uint64_t a1)
{
  return sub_20AE8AD58(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_20AE8B0EC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v9 = *(_QWORD *)(a5(0) - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      return v14;
    }
  }
  result = sub_20AE9D598();
  __break(1u);
  return result;
}

uint64_t sub_20AE8B208()
{
  return swift_release();
}

uint64_t sub_20AE8B210()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20AE8B23C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_20AE8B2A8;
  return sub_20AE85A78(a1, v4, v5, v6);
}

uint64_t sub_20AE8B2A8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_20AE8B2F0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25462E128);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20AE8B330(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x20BD34540](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

_OWORD *sub_20AE8B370(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

_QWORD *initializeBufferWithCopyOfBuffer for _ViewConfigurationGroup(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for ExtensionPickerView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *assignWithTake for ExtensionPickerView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Role(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Role(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ExtensionPickerView()
{
  return &type metadata for ExtensionPickerView;
}

uint64_t destroy for _ViewConfigurationGroup()
{
  return swift_release();
}

uint64_t _s12ExtensionKit16AppExtensionViewVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AppExtensionView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AppExtensionView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppExtensionView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppExtensionView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppExtensionView()
{
  return &type metadata for AppExtensionView;
}

uint64_t sub_20AE8B62C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20AE8B63C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20AE8B64C()
{
  return sub_20AE872A8();
}

unint64_t sub_20AE8B654()
{
  unint64_t result;

  result = qword_25462E190;
  if (!qword_25462E190)
  {
    result = MEMORY[0x20BD34540]("]ATALQ", &type metadata for ContainerAppView);
    atomic_store(result, (unint64_t *)&qword_25462E190);
  }
  return result;
}

uint64_t sub_20AE8B698(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_20AE8B6A8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

unint64_t sub_20AE8B6BC()
{
  unint64_t result;

  result = qword_25462E1C0;
  if (!qword_25462E1C0)
  {
    result = MEMORY[0x20BD34540](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25462E1C0);
  }
  return result;
}

uint64_t _s12ExtensionKit12ContainerAppVwca_0(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for _ViewConfigurationGroup(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for _ViewConfigurationGroup(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
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
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ContainerAppView()
{
  return &type metadata for ContainerAppView;
}

uint64_t sub_20AE8B7EC()
{
  return sub_20AE8BBFC(&qword_25462E1E8, &qword_25462E1F0, MEMORY[0x24BDF46F8]);
}

uint64_t sub_20AE8B818()
{
  return sub_20AE8BBFC(&qword_25462E1F8, &qword_25462E200, MEMORY[0x24BDF44A0]);
}

uint64_t sub_20AE8B844()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20AE8B854()
{
  return sub_20AE874E0();
}

uint64_t sub_20AE8B85C(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7 = a3();
    result = MEMORY[0x20BD34540](MEMORY[0x24BDF4A00], v6, &v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_20AE8B8C0()
{
  unint64_t result;

  result = qword_25462E228;
  if (!qword_25462E228)
  {
    result = MEMORY[0x20BD34540](&unk_20AE9FCE8, &type metadata for AppExtensionView);
    atomic_store(result, (unint64_t *)&qword_25462E228);
  }
  return result;
}

uint64_t sub_20AE8B904(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;

  v2 = sub_20AE9D1D8();
  MEMORY[0x24BDAC7A8](v2);
  v3 = sub_20AE9CF20();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend(a1, sel_URL);
  sub_20AE9CF14();

  v8 = objc_allocWithZone(MEMORY[0x24BE51A90]);
  v9 = (void *)sub_20AE9CF08();
  v10 = objc_msgSend(v8, sel_initWithURL_, v9);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE51AB0]), sel_init);
  objc_msgSend(v11, sel_setSize_, 32.0, 32.0);
  v12 = objc_msgSend(v10, sel_prepareImageForDescriptor_, v11);
  if (v12)
  {
    v13 = v12;
    if (objc_msgSend(v12, sel_CGImage))
    {
      objc_msgSend(v13, sel_scale);
      sub_20AE9D1CC();
      sub_20AE9D1C0();
      v14 = objc_msgSend(a1, sel_localizedName);
      sub_20AE9D3D0();

      sub_20AE9D1B4();
      swift_bridgeObjectRelease();
      sub_20AE9D1C0();
      sub_20AE9D1F0();
      sub_20AE9D2EC();
      v15 = sub_20AE9D34C();

      return v15;
    }
    __break(1u);
  }
  result = sub_20AE9D574();
  __break(1u);
  return result;
}

uint64_t sub_20AE8BBDC()
{
  return sub_20AE9D058();
}

uint64_t sub_20AE8BBFC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x20BD34540](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_20AE8BC40()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[3];

  result = qword_25462E248;
  if (!qword_25462E248)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25462E250);
    v2[0] = sub_20AE8BBFC(&qword_25462E218, &qword_25462E208, MEMORY[0x24BDF44A0]);
    v2[1] = sub_20AE8B85C(&qword_25462E220, &qword_25462E210, (uint64_t (*)(void))sub_20AE8B8C0);
    v2[2] = MEMORY[0x24BDF5130];
    result = MEMORY[0x20BD34540](MEMORY[0x24BDF4B00], v1, v2);
    atomic_store(result, (unint64_t *)&qword_25462E248);
  }
  return result;
}

uint64_t static AppExtension<>.main()(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  os_log_type_t v7;
  NSObject *v8;
  os_log_type_t v9;
  char **v10;
  uint8_t *v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  _QWORD *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v20[3];
  id v21[7];
  uint64_t v22;

  v4 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_20AE9D4D8();
  sub_20AE81E98(0, (unint64_t *)&qword_253DA1160);
  v8 = sub_20AE9D508();
  v9 = v7;
  v10 = &selRef_prepareImageForDescriptor_;
  if (os_log_type_enabled(v8, v7))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v22 = v4;
    v13 = (_QWORD *)v12;
    v20[2] = a2;
    *(_DWORD *)v11 = 138412290;
    v20[1] = v11 + 4;
    sub_20AE81E98(0, &qword_253DA1158);
    v14 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
    v21[0] = v14;
    sub_20AE9D520();
    *v13 = v14;
    v10 = &selRef_prepareImageForDescriptor_;
    _os_log_impl(&dword_20AE73000, v8, v9, "Launching UI AppExtension %@", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(qword_25462DD00);
    swift_arrayDestroy();
    v15 = v13;
    v4 = v22;
    MEMORY[0x20BD345D0](v15, -1, -1);
    MEMORY[0x20BD345D0](v11, -1, -1);
  }

  sub_20AE9CF74();
  sub_20AE81E98(0, &qword_253DA1158);
  v16 = objc_msgSend((id)swift_getObjCClassFromMetadata(), v10[109]);
  sub_20AE9CF68();
  v17 = objc_allocWithZone((Class)type metadata accessor for AppExtensionWrapper());
  v18 = sub_20AE8BF84(v21);
  objc_msgSend(v16, sel_setExtension_, v18);

  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, a1);
}

uint64_t type metadata accessor for AppExtensionWrapper()
{
  return objc_opt_self();
}

id sub_20AE8BF84(_QWORD *a1)
{
  void *v1;
  char *v3;
  os_log_type_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  id v12;
  objc_class *v13;
  id v14;
  id v15;
  objc_class *v16;
  id v17;
  uint64_t v19[7];
  uint64_t v20;
  objc_super v21;
  objc_super v22;
  _QWORD v23[8];

  v3 = v1;
  v4 = sub_20AE9D4D8();
  sub_20AE81E98(0, (unint64_t *)&qword_253DA1160);
  v5 = sub_20AE9D508();
  sub_20AE8C3F4(a1, (uint64_t)v23);
  v6 = v4;
  if (os_log_type_enabled(v5, v4))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v20 = v8;
    *(_DWORD *)v7 = 136315138;
    sub_20AE8C3F4(v23, (uint64_t)v19);
    v9 = sub_20AE9D3DC();
    v19[0] = sub_20AE98A70(v9, v10, &v20);
    sub_20AE9D520();
    swift_bridgeObjectRelease();
    sub_20AE8C3C0((uint64_t)v23);
    _os_log_impl(&dword_20AE73000, v5, v6, "Creating AppExtensionWrapper with content %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x20BD345D0](v8, -1, -1);
    MEMORY[0x20BD345D0](v7, -1, -1);

  }
  else
  {

    sub_20AE8C3C0((uint64_t)v23);
  }
  v11 = &v3[OBJC_IVAR____TtC12ExtensionKit19AppExtensionWrapper_configurationScene];
  sub_20AE8C3F4(a1, (uint64_t)&v3[OBJC_IVAR____TtC12ExtensionKit19AppExtensionWrapper_configurationScene]);
  sub_20AE81E98(0, &qword_253DA1158);
  v12 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
  sub_20AE8C3F4(v11, (uint64_t)v23);
  v13 = (objc_class *)type metadata accessor for _SceneFactory();
  v14 = objc_allocWithZone(v13);
  sub_20AE8C3F4(v23, (uint64_t)v14 + OBJC_IVAR____TtC12ExtensionKit13_SceneFactory_sceneConfiguration);
  v22.receiver = v14;
  v22.super_class = v13;
  v15 = objc_msgSendSuper2(&v22, sel_init);
  sub_20AE8C3C0((uint64_t)v23);

  objc_msgSend(v12, sel_setSceneFactory_, v15);
  v16 = (objc_class *)type metadata accessor for AppExtensionWrapper();
  v21.receiver = v3;
  v21.super_class = v16;
  v17 = objc_msgSendSuper2(&v21, sel_init);
  sub_20AE8C3C0((uint64_t)a1);
  return v17;
}

id sub_20AE8C2F8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppExtensionWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_20AE8C338(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25462E630);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20AE8C380(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25462E630);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20AE8C3C0(uint64_t a1)
{
  destroy for AppExtensionSceneConfiguration(a1);
  return a1;
}

uint64_t sub_20AE8C3F4(_QWORD *a1, uint64_t a2)
{
  initializeWithCopy for AppExtensionSceneConfiguration(a2, a1);
  return a2;
}

ExtensionKit::Role __swiftcall Role.init(rawValue:)(ExtensionKit::Role rawValue)
{
  ExtensionKit::Role *v1;

  *v1 = rawValue;
  return rawValue;
}

uint64_t sub_20AE8C438()
{
  sub_20AE9D5E0();
  swift_bridgeObjectRetain();
  sub_20AE9D3F4();
  swift_bridgeObjectRelease();
  return sub_20AE9D5EC();
}

uint64_t sub_20AE8C490()
{
  swift_bridgeObjectRetain();
  sub_20AE9D3F4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20AE8C4D4()
{
  sub_20AE9D5E0();
  swift_bridgeObjectRetain();
  sub_20AE9D3F4();
  swift_bridgeObjectRelease();
  return sub_20AE9D5EC();
}

_QWORD *sub_20AE8C528@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  v2 = result[1];
  *a2 = *result;
  a2[1] = v2;
  return result;
}

uint64_t sub_20AE8C534@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t Role.description.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

ExtensionKit::Role __swiftcall Role.init(stringLiteral:)(ExtensionKit::Role stringLiteral)
{
  ExtensionKit::Role *v1;

  *v1 = stringLiteral;
  return stringLiteral;
}

uint64_t sub_20AE8C574(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_20AE9D5BC();
}

uint64_t sub_20AE8C5A4()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_20AE8C5D0()
{
  uint64_t result;
  uint64_t v1;

  result = sub_20AE9D3D0();
  qword_25462E260 = result;
  *(_QWORD *)algn_25462E268 = v1;
  return result;
}

uint64_t static Role.default.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;

  if (qword_25462DA60 != -1)
    swift_once();
  v2 = *(_QWORD *)algn_25462E268;
  *a1 = qword_25462E260;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

unint64_t sub_20AE8C654()
{
  unint64_t result;

  result = qword_25462E270;
  if (!qword_25462E270)
  {
    result = MEMORY[0x20BD34540](&protocol conformance descriptor for Role, &type metadata for Role);
    atomic_store(result, (unint64_t *)&qword_25462E270);
  }
  return result;
}

unint64_t sub_20AE8C69C()
{
  unint64_t result;

  result = qword_25462E278;
  if (!qword_25462E278)
  {
    result = MEMORY[0x20BD34540]("u@TAdP", &type metadata for Role);
    atomic_store(result, (unint64_t *)&qword_25462E278);
  }
  return result;
}

uint64_t sub_20AE8C6E0()
{
  return MEMORY[0x24BEE0D80];
}

unint64_t sub_20AE8C6F0()
{
  unint64_t result;

  result = qword_25462E280;
  if (!qword_25462E280)
  {
    result = MEMORY[0x20BD34540]("]@TA$P", &type metadata for Role);
    atomic_store(result, (unint64_t *)&qword_25462E280);
  }
  return result;
}

uint64_t sub_20AE8C734()
{
  return MEMORY[0x24BEE0D90];
}

uint64_t sub_20AE8C740()
{
  return MEMORY[0x24BEE0D88];
}

_QWORD *initializeBufferWithCopyOfBuffer for Role(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for Role()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for Role(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for Role(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for Role()
{
  return &type metadata for Role;
}

uint64_t _AnyViewConfiguration.init<A>(erasing:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (**a4)()@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, char *, uint64_t);
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t (*v22)();
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;

  v8 = *(_QWORD *)(a2 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v11(v10, (uint64_t)a1, a2);
  v12 = *(unsigned __int8 *)(v8 + 80);
  v13 = (v12 + 32) & ~v12;
  v25 = v12 | 7;
  v23[1] = v13 + v9;
  v14 = swift_allocObject();
  v24 = v14;
  *(_QWORD *)(v14 + 16) = a2;
  *(_QWORD *)(v14 + 24) = a3;
  v23[0] = a3;
  v15 = *(void (**)(uint64_t, char *, uint64_t))(v8 + 32);
  v15(v14 + v13, v10, a2);
  v11(v10, (uint64_t)a1, a2);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  v15(v16 + v13, v10, a2);
  v17 = a1;
  v11(v10, (uint64_t)a1, a2);
  v18 = swift_allocObject();
  v19 = v23[0];
  *(_QWORD *)(v18 + 16) = a2;
  *(_QWORD *)(v18 + 24) = v19;
  v15(v18 + v13, v10, a2);
  v15((uint64_t)v10, v17, a2);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = a2;
  *(_QWORD *)(v20 + 24) = v19;
  result = ((uint64_t (*)(uint64_t, char *, uint64_t))v15)(v20 + v13, v10, a2);
  v22 = (uint64_t (*)())v24;
  *a4 = sub_20AE8D7B0;
  a4[1] = v22;
  a4[2] = sub_20AE8D8B4;
  a4[3] = (uint64_t (*)())v16;
  a4[4] = (uint64_t (*)())sub_20AE8D9C0;
  a4[5] = (uint64_t (*)())v18;
  a4[6] = (uint64_t (*)())sub_20AE85780;
  a4[7] = (uint64_t (*)())v20;
  return result;
}

ExtensionKit::_Role __swiftcall _Role.init(rawValue:)(ExtensionKit::_Role rawValue)
{
  ExtensionKit::_Role *v1;

  *v1 = rawValue;
  return rawValue;
}

double sub_20AE8C9E8@<D0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t (*v5)(void);
  uint64_t v6;
  uint64_t v7;
  os_log_type_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  os_log_type_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  os_log_type_t v26;
  NSObject *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t *v32;
  uint64_t v33;
  unint64_t v34;
  __int128 v35;
  double result;
  __int128 v37;
  _OWORD *v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  uint8_t *buf;
  __int128 v43;
  uint64_t v44;
  os_log_t log[2];
  void (*v46)(_OWORD *__return_ptr, uint64_t);
  _OWORD v47[4];
  _OWORD v48[5];

  v4 = *a1;
  buf = (uint8_t *)a1[1];
  v5 = *(uint64_t (**)(void))v2;
  v6 = *(_QWORD *)(v2 + 8);
  memset((char *)v48 + 8, 0, 64);
  v7 = v5();
  v8 = sub_20AE9D4D8();
  sub_20AE8D9E0();
  v9 = sub_20AE9D508();
  v10 = v8;
  v38 = a2;
  if (os_log_type_enabled(v9, v8))
  {
    swift_retain_n();
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    *(_QWORD *)&v48[0] = v12;
    *(_DWORD *)v11 = 136315138;
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = v5;
    *(_QWORD *)(v13 + 24) = v6;
    *((_QWORD *)&v47[0] + 1) = v13;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25462E298);
    v14 = sub_20AE9D3DC();
    *(_QWORD *)&v47[0] = sub_20AE98A70(v14, v15, (uint64_t *)v48);
    sub_20AE9D520();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_20AE73000, v9, v10, "Content %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x20BD345D0](v12, -1, -1);
    MEMORY[0x20BD345D0](v11, -1, -1);
  }

  v16 = *(_QWORD *)(v7 + 16);
  if (v16)
  {
    v17 = v7 + 56;
    v41 = v4;
    while (1)
    {
      v46 = *(void (**)(_OWORD *__return_ptr, uint64_t))(v17 - 24);
      v43 = *(_OWORD *)(v17 + 16);
      *(_OWORD *)log = *(_OWORD *)v17;
      v18 = *(_QWORD *)(v17 + 32);
      v40 = *(_OWORD *)(v17 - 16);
      swift_retain();
      swift_retain();
      swift_retain();
      swift_retain();
      v19 = sub_20AE9D4D8();
      v20 = sub_20AE9D508();
      v21 = v19;
      if (os_log_type_enabled(v20, v19))
      {
        swift_retain_n();
        swift_retain_n();
        swift_retain_n();
        swift_retain_n();
        swift_bridgeObjectRetain_n();
        v22 = swift_slowAlloc();
        v39 = swift_slowAlloc();
        *(_QWORD *)&v48[0] = v39;
        *(_DWORD *)v22 = 136315394;
        swift_retain();
        swift_retain();
        swift_retain();
        v23 = swift_retain();
        v46(v47, v23);
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        *(_QWORD *)(v22 + 4) = sub_20AE98A70(*(uint64_t *)&v47[0], *((unint64_t *)&v47[0] + 1), (uint64_t *)v48);
        swift_release_n();
        swift_release_n();
        swift_release_n();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v22 + 12) = 2080;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v22 + 14) = sub_20AE98A70(v41, (unint64_t)buf, (uint64_t *)v48);
        v4 = v41;
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_20AE73000, v20, v21, "Evaluating %s) for role %s", (uint8_t *)v22, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x20BD345D0](v39, -1, -1);
        MEMORY[0x20BD345D0](v22, -1, -1);
      }

      swift_retain();
      swift_retain();
      swift_retain();
      v24 = swift_retain();
      v46(v47, v24);
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      if (v47[0] == __PAIR128__((unint64_t)buf, v4))
        break;
      v25 = sub_20AE9D5BC();
      swift_bridgeObjectRelease();
      if ((v25 & 1) != 0)
        goto LABEL_12;
      swift_release();
      swift_release();
      swift_release();
      swift_release();
      v17 += 64;
      if (!--v16)
        goto LABEL_11;
    }
    swift_bridgeObjectRelease();
LABEL_12:
    swift_bridgeObjectRelease();
    sub_20AE83A64(*((uint64_t *)&v48[0] + 1));
    *((_QWORD *)&v48[0] + 1) = v46;
    v48[1] = v40;
    v48[2] = *(_OWORD *)log;
    v48[3] = v43;
    *(_QWORD *)&v48[4] = v18;
  }
  else
  {
LABEL_11:
    swift_bridgeObjectRelease();
  }
  v26 = sub_20AE9D4D8();
  v27 = sub_20AE9D508();
  if (os_log_type_enabled(v27, v26))
  {
    v28 = *(_OWORD *)((char *)&v48[3] + 8);
    v29 = *(_OWORD *)((char *)&v48[2] + 8);
    v30 = *(_OWORD *)((char *)&v48[1] + 8);
    v31 = *(_OWORD *)((char *)v48 + 8);
    sub_20AE83AB4(*((uint64_t *)&v48[0] + 1));
    sub_20AE83AB4(v31);
    v32 = (uint8_t *)swift_slowAlloc();
    v44 = swift_slowAlloc();
    *(_QWORD *)&v48[0] = v44;
    *(_DWORD *)v32 = 136315138;
    v47[0] = v31;
    v47[1] = v30;
    v47[2] = v29;
    v47[3] = v28;
    sub_20AE83AB4(v31);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25462E2B8);
    v33 = sub_20AE9D3DC();
    *(_QWORD *)&v47[0] = sub_20AE98A70(v33, v34, (uint64_t *)v48);
    sub_20AE9D520();
    swift_bridgeObjectRelease();
    sub_20AE83A64(v31);
    sub_20AE83A64(v31);
    _os_log_impl(&dword_20AE73000, v27, v26, "Made View configuration: %s", v32, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x20BD345D0](v44, -1, -1);
    MEMORY[0x20BD345D0](v32, -1, -1);
  }

  swift_beginAccess();
  v35 = *(_OWORD *)((char *)&v48[1] + 8);
  *v38 = *(_OWORD *)((char *)v48 + 8);
  v38[1] = v35;
  result = *((double *)&v48[2] + 1);
  v37 = *(_OWORD *)((char *)&v48[3] + 8);
  v38[2] = *(_OWORD *)((char *)&v48[2] + 8);
  v38[3] = v37;
  return result;
}

void sub_20AE8D124()
{
  sub_20AE8D478();
}

void _InitializationParametersConsumer.consume(initializationParameters:)()
{
  sub_20AE8D478();
}

ExtensionKit::_EmptyViewConfiguration __swiftcall _EmptyViewConfiguration.init()()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  ExtensionKit::_EmptyViewConfiguration result;

  v1 = v0;
  if (qword_25462DA68 != -1)
    swift_once();
  v2 = unk_25462E290;
  *v1 = qword_25462E288;
  v1[1] = v2;
  v3 = swift_bridgeObjectRetain();
  result.role.rawValue._object = v4;
  result.role.rawValue._countAndFlagsBits = v3;
  return result;
}

uint64_t static _ViewConfigurationBuilder.buildBlock<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v6 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25462E068);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_20AE9F8B0;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
  _AnyViewConfiguration.init<A>(erasing:)(v8, a2, a3, (uint64_t (**)())(v9 + 32));
  return v9;
}

uint64_t _ViewConfigurationGroup.init<A>(content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (**a5)()@<X8>)
{
  uint64_t result;
  uint64_t (*v11)();
  __int128 v12;

  swift_getFunctionTypeMetadata0();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25462E298);
  if ((swift_dynamicCast() & 1) != 0)
  {
    swift_release();
    result = swift_allocObject();
    *(_OWORD *)(result + 16) = v12;
    v11 = sub_20AE8DA70;
  }
  else
  {
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = a3;
    *(_QWORD *)(result + 24) = a4;
    *(_QWORD *)(result + 32) = a1;
    *(_QWORD *)(result + 40) = a2;
    v11 = sub_20AE8DA40;
  }
  *a5 = v11;
  a5[1] = (uint64_t (*)())result;
  return result;
}

uint64_t _Role.description.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

ExtensionKit::_Role __swiftcall _Role.init(stringLiteral:)(ExtensionKit::_Role stringLiteral)
{
  ExtensionKit::_Role *v1;

  *v1 = stringLiteral;
  return stringLiteral;
}

uint64_t sub_20AE8D370()
{
  uint64_t result;
  uint64_t v1;

  result = sub_20AE9D3D0();
  qword_25462E288 = result;
  unk_25462E290 = v1;
  return result;
}

uint64_t static _Role.default.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;

  if (qword_25462DA68 != -1)
    swift_once();
  v2 = unk_25462E290;
  *a1 = qword_25462E288;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_20AE8D3F0@<X0>(_QWORD *a1@<X8>)
{
  return _ViewConfiguration.role.getter(a1);
}

uint64_t _ViewConfiguration.role.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;

  if (qword_25462DA68 != -1)
    swift_once();
  v2 = unk_25462E290;
  *a1 = qword_25462E288;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

void sub_20AE8D458()
{
  sub_20AE8D478();
}

void _ViewConfiguration.consume(initializationParameters:)()
{
  sub_20AE8D478();
}

void sub_20AE8D478()
{
  id v0;

  sub_20AE9D4D8();
  sub_20AE8D9E0();
  v0 = (id)sub_20AE9D508();
  sub_20AE9D0F4();

}

uint64_t sub_20AE8D4F4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;

  if (qword_25462DA68 != -1)
    swift_once();
  v2 = unk_25462E290;
  *a1 = qword_25462E288;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

void sub_20AE8D548()
{
  id v0;

  sub_20AE9D4D8();
  sub_20AE8D9E0();
  v0 = (id)sub_20AE9D508();
  sub_20AE9D0F4();

}

uint64_t _EmptyViewConfiguration.role.getter@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t _EmptyViewConfiguration.role.setter(uint64_t *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  result = swift_bridgeObjectRelease();
  *v1 = v2;
  v1[1] = v3;
  return result;
}

uint64_t (*_EmptyViewConfiguration.role.modify())()
{
  return nullsub_3;
}

void Array<A>.view.getter()
{
  sub_20AE9D574();
  __break(1u);
}

void sub_20AE8D64C()
{
  sub_20AE9D574();
  __break(1u);
}

uint64_t sub_20AE8D694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void (*v10)(void);
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v15;

  v6 = *(_QWORD *)(a3 - 8);
  v7 = MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (void (*)(void))MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v15 - v11;
  v10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25462E068);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_20AE9F8B0;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v12, a3);
  _AnyViewConfiguration.init<A>(erasing:)(v9, a3, a4, (uint64_t (**)())(v13 + 32));
  (*(void (**)(char *, uint64_t))(v6 + 8))(v12, a3);
  return v13;
}

uint64_t _AnyViewConfiguration.role.getter()
{
  uint64_t (**v0)(void);

  return (*v0)();
}

uint64_t sub_20AE8D7B0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 24) + 24))();
}

uint64_t sub_20AE8D7E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  (*(void (**)(uint64_t, uint64_t))(a3 + 32))(a2, a3);
  swift_getAssociatedConformanceWitness();
  return sub_20AE9D364();
}

uint64_t sub_20AE8D8B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  return sub_20AE8D7E8(v0 + ((v2 + 32) & ~v2), v1, *(_QWORD *)(v0 + 24));
}

uint64_t sub_20AE8D8D0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  __int128 v5[2];
  uint64_t v6;
  _QWORD v7[4];

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *))(v2 + 16))((char *)v5 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(qword_253DA1030);
  if ((swift_dynamicCast() & 1) != 0)
  {
    sub_20AE832DC(v5, (uint64_t)v7);
    __swift_project_boxed_opaque_existential_1(v7, v7[3]);
    v3 = sub_20AE9D0D0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v7);
  }
  else
  {
    v6 = 0;
    memset(v5, 0, sizeof(v5));
    sub_20AE8329C((uint64_t)v5);
    v3 = 0;
  }
  return v3 & 1;
}

uint64_t sub_20AE8D9C0(uint64_t a1)
{
  return sub_20AE8D8D0(a1);
}

unint64_t sub_20AE8D9E0()
{
  unint64_t result;

  result = qword_253DA1160;
  if (!qword_253DA1160)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_253DA1160);
  }
  return result;
}

uint64_t sub_20AE8DA1C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20AE8DA40()
{
  uint64_t *v0;

  return sub_20AE8D694(v0[4], v0[5], v0[2], v0[3]);
}

uint64_t sub_20AE8DA4C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20AE8DA70()
{
  uint64_t v0;
  uint64_t v2;

  (*(void (**)(uint64_t *__return_ptr))(v0 + 16))(&v2);
  return v2;
}

uint64_t _AnyViewConfiguration.view.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

Swift::Bool __swiftcall _AnyViewConfiguration.shouldAccept(connection:)(NSXPCConnection connection)
{
  uint64_t v1;

  return (*(uint64_t (**)(Class))(v1 + 32))(connection.super.isa) & 1;
}

uint64_t _AnyViewConfiguration.consume(initializationParameters:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 48);
  v4 = *a1;
  return v2(&v4);
}

uint64_t sub_20AE8DB20()
{
  uint64_t (**v0)(void);

  return (*v0)();
}

uint64_t sub_20AE8DB40@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  return result;
}

uint64_t sub_20AE8DB68(uint64_t *a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 48);
  v4 = *a1;
  return v2(&v4);
}

uint64_t sub_20AE8DB9C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 32))() & 1;
}

id _InitializationParameters.resolve<A>()()
{
  void **v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v7[2];

  v7[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = *v0;
  v7[0] = 0;
  v2 = objc_msgSend(v1, sel_resolveObjectOfClass_error_, swift_getObjCClassFromMetadata(), v7);
  v3 = v7[0];
  if (v2)
  {
    v4 = (id)swift_dynamicCastUnknownClass();
    v5 = v3;
    if (!v4)
      swift_unknownObjectRelease();
  }
  else
  {
    v4 = v7[0];
    sub_20AE9CEE4();

    swift_willThrow();
  }
  return v4;
}

unint64_t sub_20AE8DCB0()
{
  unint64_t result;

  result = qword_25462E2A0;
  if (!qword_25462E2A0)
  {
    result = MEMORY[0x20BD34540](&protocol conformance descriptor for _Role, &type metadata for _Role);
    atomic_store(result, (unint64_t *)&qword_25462E2A0);
  }
  return result;
}

unint64_t sub_20AE8DCF8()
{
  unint64_t result;

  result = qword_25462E2A8;
  if (!qword_25462E2A8)
  {
    result = MEMORY[0x20BD34540](&protocol conformance descriptor for _Role, &type metadata for _Role);
    atomic_store(result, (unint64_t *)&qword_25462E2A8);
  }
  return result;
}

unint64_t sub_20AE8DD40()
{
  unint64_t result;

  result = qword_25462E2B0;
  if (!qword_25462E2B0)
  {
    result = MEMORY[0x20BD34540](&protocol conformance descriptor for _Role, &type metadata for _Role);
    atomic_store(result, (unint64_t *)&qword_25462E2B0);
  }
  return result;
}

uint64_t sub_20AE8DD84()
{
  return MEMORY[0x24BDF5130];
}

uint64_t sub_20AE8DD90()
{
  return MEMORY[0x24BDF5558];
}

uint64_t sub_20AE8DD9C()
{
  return swift_getOpaqueTypeConformance2();
}

ValueMetadata *type metadata accessor for _Role()
{
  return &type metadata for _Role;
}

uint64_t dispatch thunk of _ViewConfigurationProviding.content.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of _ViewConfiguration.role.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of _ViewConfiguration.view.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of _ViewConfiguration.consume(initializationParameters:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

ValueMetadata *type metadata accessor for _EmptyViewConfiguration()
{
  return &type metadata for _EmptyViewConfiguration;
}

ValueMetadata *type metadata accessor for _ViewConfigurationBuilder()
{
  return &type metadata for _ViewConfigurationBuilder;
}

_QWORD *assignWithCopy for _ViewConfigurationGroup(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for _ViewConfigurationGroup(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for _ViewConfigurationGroup()
{
  return &type metadata for _ViewConfigurationGroup;
}

uint64_t destroy for _AnyViewConfiguration()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for _AnyViewConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v3 = *(_QWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = v3;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for _AnyViewConfiguration(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_retain();
  swift_release();
  v7 = a2[7];
  a1[6] = a2[6];
  a1[7] = v7;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

_OWORD *assignWithTake for _AnyViewConfiguration(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  a1[2] = a2[2];
  swift_release();
  a1[3] = a2[3];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for _AnyViewConfiguration(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for _AnyViewConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
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
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for _AnyViewConfiguration()
{
  return &type metadata for _AnyViewConfiguration;
}

ValueMetadata *type metadata accessor for _InitializationParameters()
{
  return &type metadata for _InitializationParameters;
}

uint64_t dispatch thunk of _InitializationParametersConsumer.consume(initializationParameters:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t sub_20AE8E0FC()
{
  return MEMORY[0x24BDF4768];
}

id sub_20AE8E11C(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  objc_class *v16;
  id result;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  _QWORD aBlock[6];
  objc_super v34;

  v3 = v2;
  v6 = sub_20AE9D118();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)aBlock - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)aBlock - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)aBlock - v14;
  v16 = (objc_class *)type metadata accessor for _EXRunningUIKitSceneHostedExtension();
  v34.receiver = v3;
  v34.super_class = v16;
  result = objc_msgSendSuper2(&v34, sel__startWithArguments_count_, a1, a2);
  if (!(_DWORD)result)
  {
    sub_20AE9D100();
    v18 = sub_20AE9D10C();
    v19 = sub_20AE9D4F0();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v20 = 0;
      _os_log_impl(&dword_20AE73000, v18, v19, "Configuring service listener", v20, 2u);
      MEMORY[0x20BD345D0](v20, -1, -1);
    }

    v21 = *(void (**)(char *, uint64_t))(v7 + 8);
    v21(v15, v6);
    v22 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v23 = swift_allocObject();
    *(_QWORD *)(v23 + 16) = sub_20AE8F3F0;
    *(_QWORD *)(v23 + 24) = v22;
    aBlock[4] = sub_20AE8F408;
    aBlock[5] = v23;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_20AE8E684;
    aBlock[3] = &block_descriptor_7;
    v24 = _Block_copy(aBlock);
    v25 = (void *)objc_opt_self();
    swift_retain();
    v26 = objc_msgSend(v25, sel_listenerWithConfigurator_, v24);
    _Block_release(v24);
    swift_release();
    LOBYTE(v24) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if ((v24 & 1) != 0)
      __break(1u);
    objc_msgSend(v26, sel_activate);
    sub_20AE9D100();
    v27 = sub_20AE9D10C();
    v28 = sub_20AE9D4F0();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_20AE73000, v27, v28, "Checking in with launchd", v29, 2u);
      MEMORY[0x20BD345D0](v29, -1, -1);
    }

    v21(v13, v6);
    objc_msgSend(v3, sel_checkIn);
    sub_20AE9D100();
    v30 = sub_20AE9D10C();
    v31 = sub_20AE9D4F0();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_20AE73000, v30, v31, "Resuming service listener", v32, 2u);
      MEMORY[0x20BD345D0](v32, -1, -1);
    }

    v21(v10, v6);
    result = objc_msgSend((id)objc_opt_self(), sel_activateXPCService);
    __break(1u);
  }
  return result;
}

void sub_20AE8E4D4(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;

  v4 = sub_20AE9D118();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  v8 = MEMORY[0x20BD34648](a2 + 16);
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void *)sub_20AE9D3AC();
    objc_msgSend(a1, sel_setDomain_, v10);

    v11 = (void *)sub_20AE9D3AC();
    objc_msgSend(a1, sel_setService_, v11);

    objc_msgSend(a1, sel_setDelegate_, v9);
  }
  else
  {
    sub_20AE9D100();
    v12 = sub_20AE9D10C();
    v13 = sub_20AE9D4E4();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_20AE73000, v12, v13, "Could not find _EXRunningUIKitSceneHostedExtension when configuring listener", v14, 2u);
      MEMORY[0x20BD345D0](v14, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

id sub_20AE8E840(void *a1)
{
  objc_msgSend(a1, sel_setActivateOnResume);
  return objc_msgSend(a1, sel_setFaultOnSuspend);
}

uint64_t sub_20AE8E874(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);
  return swift_unknownObjectRelease();
}

id sub_20AE8E970()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _EXRunningUIKitSceneHostedExtension();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for _EXRunningUIKitSceneHostedExtension()
{
  return objc_opt_self();
}

uint64_t sub_20AE8E9C0(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = sub_20AE9D118();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20AE9D100();
  v8 = sub_20AE9D10C();
  v9 = sub_20AE9D4F0();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v17 = v4;
    v11 = a1;
    v12 = a2;
    v13 = (uint8_t *)v10;
    v14 = swift_slowAlloc();
    v19 = v14;
    *(_DWORD *)v13 = 136446210;
    v18 = sub_20AE98A70(v11, v12, &v19);
    sub_20AE9D520();
    _os_log_impl(&dword_20AE73000, v8, v9, "Received: %{public}s", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x20BD345D0](v14, -1, -1);
    MEMORY[0x20BD345D0](v13, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v17);
  }
  else
  {

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_20AE8EB60(void *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t *v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  char v22;
  uint64_t result;
  id v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v42 = a1;
  v3 = sub_20AE9D388();
  v43 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (uint64_t *)((char *)&v38 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = sub_20AE9D118();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v38 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v38 - v11;
  sub_20AE9D100();
  v13 = sub_20AE9D10C();
  v14 = sub_20AE9D4F0();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc();
    v41 = a2;
    v16 = (uint8_t *)v15;
    v17 = swift_slowAlloc();
    v39 = v7;
    v18 = v17;
    v45 = v17;
    v40 = v3;
    *(_DWORD *)v16 = 136446210;
    v44 = sub_20AE98A70(0xD000000000000032, 0x800000020AEA3E80, &v45);
    v3 = v40;
    sub_20AE9D520();
    _os_log_impl(&dword_20AE73000, v13, v14, "%{public}s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x20BD345D0](v18, -1, -1);
    v19 = v16;
    a2 = v41;
    MEMORY[0x20BD345D0](v19, -1, -1);

    v20 = *(void (**)(char *, uint64_t))(v39 + 8);
  }
  else
  {

    v20 = *(void (**)(char *, uint64_t))(v7 + 8);
  }
  v20(v12, v6);
  sub_20AE8F348();
  *v5 = sub_20AE9D4FC();
  v21 = v43;
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v43 + 104))(v5, *MEMORY[0x24BEE5610], v3);
  v22 = sub_20AE9D394();
  result = (*(uint64_t (**)(uint64_t *, uint64_t))(v21 + 8))(v5, v3);
  if ((v22 & 1) != 0)
  {
    sub_20AE9D100();
    v24 = a2;
    v25 = sub_20AE9D10C();
    v26 = sub_20AE9D4F0();
    if (os_log_type_enabled(v25, v26))
    {
      v43 = v6;
      v27 = (uint8_t *)swift_slowAlloc();
      v28 = swift_slowAlloc();
      v45 = v28;
      *(_DWORD *)v27 = 136446210;
      v29 = objc_msgSend(v24, sel_sourceApplication);
      if (v29)
      {
        v30 = v29;
        v31 = sub_20AE9D3D0();
        v33 = v32;

      }
      else
      {
        v31 = 0;
        v33 = 0xE000000000000000;
      }
      v44 = sub_20AE98A70(v31, v33, &v45);
      sub_20AE9D520();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_20AE73000, v25, v26, "Received scene connection request from host: %{public}s", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x20BD345D0](v28, -1, -1);
      MEMORY[0x20BD345D0](v27, -1, -1);

      v34 = v10;
      v35 = v43;
    }
    else
    {

      v34 = v10;
      v35 = v6;
    }
    v20(v34, v35);
    v36 = objc_msgSend(v42, sel_role);
    v37 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD8E8]), sel_initWithName_sessionRole_, 0, v36);

    type metadata accessor for EXRemoteSceneDelegate();
    objc_msgSend(v37, sel_setDelegateClass_, swift_getObjCClassFromMetadata());
    return (uint64_t)v37;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_20AE8EFA8(void *a1, void *a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  unint64_t aBlock;
  unint64_t v28;
  uint64_t (*v29)();
  void *v30;
  id (*v31)(void *);
  uint64_t v32;

  v5 = sub_20AE9D118();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = sub_20AE8E840;
  v32 = 0;
  aBlock = MEMORY[0x24BDAC760];
  v28 = 1107296256;
  v29 = sub_20AE8E684;
  v30 = &block_descriptor;
  v9 = _Block_copy(&aBlock);
  swift_release();
  v10 = objc_msgSend(a2, sel_extractNSXPCConnectionWithConfigurator_, v9);
  _Block_release(v9);
  if ((swift_isEscapingClosureAtFileLocation() & 1) != 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  v24 = a1;
  v25 = a2;
  v26 = v10;
  v11 = objc_msgSend(a2, sel_service);
  v12 = sub_20AE9D3D0();
  v14 = v13;

  if (v12 != 0x6C616E7265746E49 || v14 != 0xEF65636976726553)
  {
    v15 = sub_20AE9D5BC();
    swift_bridgeObjectRelease();
    if ((v15 & 1) != 0)
      goto LABEL_6;
LABEL_12:
    aBlock = 0;
    v28 = 0xE000000000000000;
    sub_20AE9D538();
    swift_bridgeObjectRelease();
    aBlock = 0xD000000000000030;
    v28 = 0x800000020AEA3E40;
    v22 = objc_msgSend(v24, sel_description);
    sub_20AE9D3D0();

    sub_20AE9D418();
    swift_bridgeObjectRelease();
    sub_20AE9D574();
    __break(1u);
    return;
  }
  swift_bridgeObjectRelease();
LABEL_6:
  sub_20AE9D100();
  v16 = sub_20AE9D10C();
  v17 = sub_20AE9D4D8();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_20AE73000, v16, v17, "Received scene session connection request on internal mach service listener", v18, 2u);
    MEMORY[0x20BD345D0](v18, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v19 = objc_msgSend(v2, sel_extension);
  v20 = objc_msgSend(objc_allocWithZone((Class)_EXUISceneSession), sel_initWithExtension_, v19);

  v21 = v26;
  LOBYTE(v19) = objc_msgSend(v20, sel_shouldAcceptXPCConnection_, v26);

  if ((v19 & 1) == 0)
    objc_msgSend(v25, sel_invalidate);

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

unint64_t sub_20AE8F348()
{
  unint64_t result;

  result = qword_25462E328;
  if (!qword_25462E328)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25462E328);
  }
  return result;
}

unint64_t sub_20AE8F384()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25462E330;
  if (!qword_25462E330)
  {
    type metadata accessor for LaunchOptionsKey(255);
    result = MEMORY[0x20BD34540](&unk_20AE9F774, v1);
    atomic_store(result, (unint64_t *)&qword_25462E330);
  }
  return result;
}

uint64_t sub_20AE8F3CC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_20AE8F3F0(void *a1)
{
  uint64_t v1;

  sub_20AE8E4D4(a1, v1);
}

uint64_t sub_20AE8F3F8()
{
  return swift_deallocObject();
}

uint64_t sub_20AE8F408()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_20AE8F474(uint64_t result)
{
  char v1;

  if (result)
  {
    if (result < 0)
    {
      __break(1u);
    }
    else
    {
      result = sub_20AE9D40C();
      if ((v1 & 1) == 0)
        return sub_20AE9D3E8();
    }
    __break(1u);
  }
  return result;
}

id sub_20AE8F5B0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for EXRemoteSceneDelegate();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for EXRemoteSceneDelegate()
{
  return objc_opt_self();
}

id sub_20AE8F610(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  id v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id result;
  id v33;
  char *v34;
  id v35;
  id v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  id v40;
  id v41;
  os_log_t v42;
  _QWORD *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  _QWORD v50[2];
  id v51;
  os_log_t v52;
  uint64_t v53;
  _QWORD *v54;
  int v55;
  char *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;

  v58 = a1;
  v3 = sub_20AE9D118();
  v60 = *(_QWORD *)(v3 - 8);
  v61 = v3;
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v56 = (char *)v50 - v7;
  v8 = sub_20AE9CF5C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25462E470);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v50 - v16;
  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB08]), sel_init);
  v19 = objc_msgSend(a2, sel_persistentIdentifier);
  v20 = sub_20AE9D3D0();
  v22 = v21;

  v65 = v20;
  v66 = v22;
  swift_bridgeObjectRetain();
  LOBYTE(v19) = sub_20AE9D430();
  swift_bridgeObjectRelease();
  if ((v19 & 1) != 0)
  {
    v23 = sub_20AE9D400();
    sub_20AE8F474(v23);
    v20 = v65;
    v22 = v66;
  }
  swift_bridgeObjectRetain();
  sub_20AE9CF44();
  swift_bridgeObjectRelease();
  sub_20AE8FD10((uint64_t)v17, (uint64_t)v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v15, 1, v8) == 1)
  {
    v57 = v18;
    sub_20AE8FD58((uint64_t)v15);
    sub_20AE9D100();
    swift_bridgeObjectRetain();
    v24 = sub_20AE9D10C();
    v25 = sub_20AE9D4E4();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      v27 = swift_slowAlloc();
      v64 = v27;
      *(_DWORD *)v26 = 136446210;
      swift_bridgeObjectRetain();
      v63 = sub_20AE98A70(v20, v22, &v64);
      sub_20AE9D520();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_20AE73000, v24, v25, "Session ID could not be found for scene id: %{public}s", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x20BD345D0](v27, -1, -1);
      MEMORY[0x20BD345D0](v26, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    (*(void (**)(char *, uint64_t))(v60 + 8))(v6, v61);
    return (id)sub_20AE8FD58((uint64_t)v17);
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v15, v8);
  v28 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v29 = (void *)sub_20AE9CF50();
  v30 = objc_msgSend(v28, sel_sessionForIdentifier_, v29);

  v31 = v30;
  result = objc_msgSend(v31, sel_scene);
  if (result)
  {
    v62 = &unk_254641D08;
    v33 = objc_msgSend((id)swift_dynamicCastObjCProtocolUnconditional(), sel_viewController);

    swift_unknownObjectRelease();
    if (v33)
    {

      swift_bridgeObjectRelease();
    }
    else
    {
      v57 = v18;
      v34 = v56;
      sub_20AE9D100();
      v35 = v31;
      swift_bridgeObjectRetain();
      v36 = v35;
      v37 = sub_20AE9D10C();
      v38 = sub_20AE9D4E4();
      v55 = v38;
      if (os_log_type_enabled(v37, v38))
      {
        v39 = swift_slowAlloc();
        v54 = (_QWORD *)swift_slowAlloc();
        v53 = swift_slowAlloc();
        v63 = (uint64_t)v36;
        v64 = v53;
        *(_DWORD *)v39 = 138543618;
        v50[0] = v39 + 12;
        v50[1] = v39 + 4;
        v51 = v31;
        v40 = v36;
        v52 = v37;
        v41 = v40;
        sub_20AE9D520();
        *v54 = v36;

        *(_WORD *)(v39 + 12) = 2082;
        swift_bridgeObjectRetain();
        v63 = sub_20AE98A70(v20, v22, &v64);
        v31 = v51;
        sub_20AE9D520();
        swift_bridgeObjectRelease_n();
        v42 = v52;
        _os_log_impl(&dword_20AE73000, v52, (os_log_type_t)v55, "Could not fetch view controller for session: %{public}@ scene id: %{public}s", (uint8_t *)v39, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(qword_25462DD00);
        v43 = v54;
        swift_arrayDestroy();
        MEMORY[0x20BD345D0](v43, -1, -1);
        v44 = v53;
        swift_arrayDestroy();
        MEMORY[0x20BD345D0](v44, -1, -1);
        MEMORY[0x20BD345D0](v39, -1, -1);

        (*(void (**)(char *, uint64_t))(v60 + 8))(v56, v61);
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v60 + 8))(v34, v61);
      }
      v33 = v57;
    }
    objc_opt_self();
    v45 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB58]), sel_initWithWindowScene_, swift_dynamicCastObjCClassUnconditional());
    v46 = OBJC_IVAR___EXRemoteSceneDelegate_window;
    v47 = v59;
    v48 = *(void **)(v59 + OBJC_IVAR___EXRemoteSceneDelegate_window);
    *(_QWORD *)(v59 + OBJC_IVAR___EXRemoteSceneDelegate_window) = v45;

    v49 = *(void **)(v47 + v46);
    if (v49)
    {
      objc_msgSend(v49, sel_setRootViewController_, v33);
      v49 = *(void **)(v47 + v46);
    }
    objc_msgSend(v49, sel_makeKeyAndVisible);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return (id)sub_20AE8FD58((uint64_t)v17);
  }
  __break(1u);
  return result;
}

uint64_t sub_20AE8FD10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25462E470);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20AE8FD58(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25462E470);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t EXHostViewController.Configuration.appExtension.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_20AE9CFA4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t EXHostViewController.Configuration.appExtension.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_20AE9CFA4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*EXHostViewController.Configuration.appExtension.modify())()
{
  return nullsub_3;
}

uint64_t EXHostViewController.Configuration.sceneID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for EXHostViewController.Configuration() + 20));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t type metadata accessor for EXHostViewController.Configuration()
{
  uint64_t result;

  result = qword_25462E480;
  if (!qword_25462E480)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t EXHostViewController.Configuration.sceneID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for EXHostViewController.Configuration() + 20));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*EXHostViewController.Configuration.sceneID.modify())()
{
  type metadata accessor for EXHostViewController.Configuration();
  return nullsub_3;
}

uint64_t EXHostViewController.Configuration.init(appExtension:sceneID:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t result;
  _QWORD *v10;

  v8 = sub_20AE9CFA4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a4, a1, v8);
  result = type metadata accessor for EXHostViewController.Configuration();
  v10 = (_QWORD *)(a4 + *(int *)(result + 20));
  *v10 = a2;
  v10[1] = a3;
  return result;
}

uint64_t EXHostViewController.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;

  v3 = objc_msgSend(v1, sel_configuration);
  if (v3)
  {
    v4 = v3;
    MEMORY[0x20BD337CC](objc_msgSend(v3, sel_extensionIdentity));
    v5 = objc_msgSend(v4, sel_role);
    v6 = sub_20AE9D3D0();
    v8 = v7;

    v9 = type metadata accessor for EXHostViewController.Configuration();
    v10 = (uint64_t *)(a1 + *(int *)(v9 + 20));
    *v10 = v6;
    v10[1] = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56);
    v12 = a1;
    v13 = 0;
  }
  else
  {
    v9 = type metadata accessor for EXHostViewController.Configuration();
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56);
    v12 = a1;
    v13 = 1;
  }
  return v11(v12, v13, 1, v9);
}

uint64_t sub_20AE90040(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25462E478);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20AE902B8(a1, (uint64_t)v4);
  return EXHostViewController.configuration.setter((uint64_t)v4);
}

uint64_t EXHostViewController.configuration.setter(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25462E478);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for EXHostViewController.Configuration();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v20 - v12;
  sub_20AE902B8(a1, (uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_20AE90300((uint64_t)v6);
    objc_msgSend(v2, sel_setConfiguration_, 0);
    return sub_20AE90300(a1);
  }
  else
  {
    sub_20AE90340((uint64_t)v6, (uint64_t)v13);
    sub_20AE90384((uint64_t)v13, (uint64_t)v11);
    v15 = objc_allocWithZone((Class)_EXHostViewControllerConfiguration);
    sub_20AE9CF98();
    objc_opt_self();
    v16 = (void *)swift_dynamicCastObjCClassUnconditional();
    v17 = objc_msgSend(v15, sel_initWithExtensionIdentity_, v16);

    v18 = v17;
    v19 = (void *)sub_20AE9D3AC();
    objc_msgSend(v18, sel_setRole_, v19);

    sub_20AE903C8((uint64_t)v11);
    objc_msgSend(v2, sel_setConfiguration_, v18);

    sub_20AE90300(a1);
    return sub_20AE903C8((uint64_t)v13);
  }
}

uint64_t sub_20AE902B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25462E478);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20AE90300(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25462E478);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20AE90340(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for EXHostViewController.Configuration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20AE90384(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for EXHostViewController.Configuration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20AE903C8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for EXHostViewController.Configuration();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void (*EXHostViewController.configuration.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  void *v1;
  size_t v3;
  char *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;

  *a1 = v1;
  v3 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25462E478) - 8) + 64);
  a1[1] = malloc(v3);
  v4 = (char *)malloc(v3);
  a1[2] = v4;
  v5 = objc_msgSend(v1, sel_configuration);
  if (v5)
  {
    v6 = v5;
    MEMORY[0x20BD337CC](objc_msgSend(v5, sel_extensionIdentity));
    v7 = objc_msgSend(v6, sel_role);
    v8 = sub_20AE9D3D0();
    v10 = v9;

    v11 = type metadata accessor for EXHostViewController.Configuration();
    v12 = (uint64_t *)&v4[*(int *)(v11 + 20)];
    *v12 = v8;
    v12[1] = v10;
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v4, 0, 1, v11);
  }
  else
  {
    v13 = type metadata accessor for EXHostViewController.Configuration();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v4, 1, 1, v13);
  }
  return sub_20AE90528;
}

void sub_20AE90528(uint64_t a1, char a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 8);
  v3 = *(void **)(a1 + 16);
  if ((a2 & 1) != 0)
  {
    sub_20AE902B8((uint64_t)v3, (uint64_t)v2);
    EXHostViewController.configuration.setter((uint64_t)v2);
    sub_20AE90300((uint64_t)v3);
  }
  else
  {
    EXHostViewController.configuration.setter((uint64_t)v3);
  }
  free(v3);
  free(v2);
}

uint64_t sub_20AE90584@<X0>(uint64_t a1@<X8>)
{
  return EXHostViewController.configuration.getter(a1);
}

uint64_t *_s13ConfigurationVwCP(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_20AE9CFA4();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (uint64_t *)((char *)a2 + v8);
    v11 = v10[1];
    *v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t _s13ConfigurationVwxx(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_20AE9CFA4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return swift_bridgeObjectRelease();
}

uint64_t _s13ConfigurationVwcp(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v6 = sub_20AE9CFA4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  *v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s13ConfigurationVwca(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = sub_20AE9CFA4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s13ConfigurationVwtk(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_20AE9CFA4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t _s13ConfigurationVwta(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_20AE9CFA4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s13ConfigurationVwet()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20AE9083C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_20AE9CFA4();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t _s13ConfigurationVwst()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20AE908C8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_20AE9CFA4();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_20AE90944()
{
  uint64_t result;
  unint64_t v1;

  result = sub_20AE9CFA4();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_20AE909B4()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

id sub_20AE909D8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExtensionHostingViewControllerRepresentable.Coordinator(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_20AE90B20(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  int *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void (*v18)(char *, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  void (*v23)(char *, uint64_t);
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;

  v2 = v1;
  v36 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25462E540);
  MEMORY[0x24BDAC7A8](v3);
  v37 = (uint64_t)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_20AE9D0AC();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v33 - v10;
  v12 = (int *)type metadata accessor for _EXHostViewController.Configuration();
  v35 = *((_QWORD *)v12 - 1);
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v33 - v16;
  v33 = v6;
  v34 = v2;
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v18(v11, v2, v5);
  if (qword_25462DA68 != -1)
    swift_once();
  v19 = qword_25462E288;
  v20 = unk_25462E290;
  v18(v9, (uint64_t)v11, v5);
  v21 = v12[8];
  v18(v15, (uint64_t)v9, v5);
  v22 = (uint64_t *)&v15[v12[7]];
  *v22 = v19;
  v22[1] = v20;
  *(_QWORD *)&v15[v21] = 0;
  swift_bridgeObjectRetain();
  LOBYTE(v20) = sub_20AE9D0E8();
  v23 = *(void (**)(char *, uint64_t))(v33 + 8);
  v23(v9, v5);
  v15[v12[5]] = v20 & 1;
  v15[v12[6]] = 0;
  sub_20AE920C0((uint64_t)v15, (uint64_t)v17);
  v23(v11, v5);
  v24 = (uint64_t *)(v34 + *(int *)(type metadata accessor for ExtensionHostingViewControllerRepresentable(0) + 20));
  v25 = v24[1];
  v26 = (uint64_t)v17;
  if (v25)
  {
    v27 = *v24;
    v28 = &v17[v12[7]];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(_QWORD *)v28 = v27;
    *((_QWORD *)v28 + 1) = v25;
  }
  v29 = objc_msgSend(objc_allocWithZone((Class)_EXHostViewController), sel_init);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25462E548);
  sub_20AE9D298();
  v30 = v38;
  objc_msgSend(v29, sel_setDelegate_, v38);

  v31 = v37;
  sub_20AE92104(v26, v37, (uint64_t (*)(_QWORD))type metadata accessor for _EXHostViewController.Configuration);
  (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(v35 + 56))(v31, 0, 1, v12);
  _EXHostViewController._configuration.setter(v31);
  sub_20AE92148(v26, (uint64_t (*)(_QWORD))type metadata accessor for _EXHostViewController.Configuration);
  return v29;
}

id sub_20AE90E08()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v9[2];

  v9[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = *(void **)(*(_QWORD *)(v0
                            + *(int *)(type metadata accessor for ExtensionHostingViewControllerRepresentable(0) + 28))
                + 16);
  if (v1)
  {
    v9[0] = 0;
    v2 = v1;
    v3 = objc_msgSend(v2, sel_makeXPCConnectionWithError_, v9);
    if (v3)
    {
      v4 = v3;
      v5 = v9[0];
    }
    else
    {
      v4 = v9[0];
      sub_20AE9CEE4();

      swift_willThrow();
    }

  }
  else
  {
    sub_20AE9D4E4();
    sub_20AE8D9E0();
    v6 = (void *)sub_20AE9D508();
    sub_20AE9D0F4();

    sub_20AE9D3D0();
    v4 = objc_allocWithZone(MEMORY[0x24BDD1540]);
    v7 = (void *)sub_20AE9D3AC();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v7, 6, 0);

    swift_willThrow();
  }
  return v4;
}

uint64_t sub_20AE90FB4@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  id v7;
  id v8;
  uint64_t result;
  objc_super v10;

  MEMORY[0x24BDAC7A8](a1);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20AE92104(v2, (uint64_t)v5, type metadata accessor for ExtensionHostingViewControllerRepresentable);
  v6 = (objc_class *)type metadata accessor for ExtensionHostingViewControllerRepresentable.Coordinator(0);
  v7 = objc_allocWithZone(v6);
  sub_20AE92104((uint64_t)v5, (uint64_t)v7 + OBJC_IVAR____TtCV12ExtensionKit43ExtensionHostingViewControllerRepresentable11Coordinator_parent, type metadata accessor for ExtensionHostingViewControllerRepresentable);
  v10.receiver = v7;
  v10.super_class = v6;
  v8 = objc_msgSendSuper2(&v10, sel_init);
  result = sub_20AE92148((uint64_t)v5, type metadata accessor for ExtensionHostingViewControllerRepresentable);
  *a2 = v8;
  return result;
}

uint64_t sub_20AE91080()
{
  return sub_20AE9D250();
}

uint64_t sub_20AE910B8()
{
  sub_20AE92080(&qword_25462E538, (uint64_t)&unk_20AEA0548);
  return sub_20AE9D28C();
}

uint64_t sub_20AE91118()
{
  sub_20AE92080(&qword_25462E538, (uint64_t)&unk_20AEA0548);
  return sub_20AE9D25C();
}

void sub_20AE91178()
{
  sub_20AE92080(&qword_25462E538, (uint64_t)&unk_20AEA0548);
  sub_20AE9D280();
  __break(1u);
}

uint64_t _ExtensionHost.extension.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t _ExtensionHost.sceneName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t _ExtensionHost._initializationParameters.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t _ExtensionHost.init(extension:sceneName:initializationParameters:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t result;

  *a5 = a1;
  if (a3)
  {
    v7 = a3;
  }
  else
  {
    a2 = sub_20AE9D3D0();
    v7 = v9;
  }
  a5[1] = a2;
  a5[2] = v7;
  a5[3] = a4;
  objc_opt_self();
  v10 = swift_dynamicCastObjCClassUnconditional();
  v11 = (char *)a5 + *(int *)(type metadata accessor for _ExtensionHost(0) + 28);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  MEMORY[0x20BD338B0](v10);
  v12 = (int *)type metadata accessor for ExtensionHostingViewControllerRepresentable(0);
  v13 = (uint64_t *)&v11[v12[5]];
  *v13 = a2;
  v13[1] = v7;
  *(_QWORD *)&v11[v12[6]] = a4;
  v14 = v12[7];
  type metadata accessor for ExtensionHostingViewControllerRepresentable.MutableState();
  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)&v11[v14] = result;
  return result;
}

uint64_t type metadata accessor for _ExtensionHost(uint64_t a1)
{
  return sub_20AE884C8(a1, (uint64_t *)&unk_25462E508);
}

uint64_t type metadata accessor for ExtensionHostingViewControllerRepresentable(uint64_t a1)
{
  return sub_20AE884C8(a1, (uint64_t *)&unk_25462E528);
}

uint64_t type metadata accessor for ExtensionHostingViewControllerRepresentable.MutableState()
{
  return objc_opt_self();
}

uint64_t _ExtensionHost.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for _ExtensionHost(0);
  return sub_20AE92104(v1 + *(int *)(v3 + 28), a1, type metadata accessor for ExtensionHostingViewControllerRepresentable);
}

NSXPCConnection __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _ExtensionHost.makeXPCConnection()()
{
  type metadata accessor for _ExtensionHost(0);
  return (NSXPCConnection)sub_20AE90E08();
}

Swift::Void __swiftcall _ExtensionHost.invalidate()()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = v0 + *(int *)(type metadata accessor for _ExtensionHost(0) + 28);
  v2 = *(void **)(*(_QWORD *)(v1
                            + *(int *)(type metadata accessor for ExtensionHostingViewControllerRepresentable(0) + 28))
                + 16);
  if (v2)
    objc_msgSend(v2, sel_setConfiguration_, 0);
}

uint64_t sub_20AE913F8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20AE91408@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_20AE92104(v2 + *(int *)(a1 + 28), a2, type metadata accessor for ExtensionHostingViewControllerRepresentable);
}

uint64_t sub_20AE91430()
{
  return type metadata accessor for ExtensionHostingViewControllerRepresentable.Coordinator(0);
}

uint64_t type metadata accessor for ExtensionHostingViewControllerRepresentable.Coordinator(uint64_t a1)
{
  return sub_20AE884C8(a1, qword_25462E4F0);
}

uint64_t sub_20AE9144C()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for ExtensionHostingViewControllerRepresentable(319);
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for _ExtensionHost(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v5 = (uint64_t *)(v4 + ((v3 + 16) & ~(unint64_t)v3));
  }
  else
  {
    v5 = a1;
    v6 = a2[2];
    a1[1] = a2[1];
    a1[2] = v6;
    a1[3] = a2[3];
    v7 = *(int *)(a3 + 28);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_20AE9D0AC();
    v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    v11(v8, v9, v10);
    v12 = (int *)type metadata accessor for ExtensionHostingViewControllerRepresentable(0);
    v13 = v12[5];
    v14 = &v8[v13];
    v15 = &v9[v13];
    v17 = *(_QWORD *)v15;
    v16 = *((_QWORD *)v15 + 1);
    *(_QWORD *)v14 = v17;
    *((_QWORD *)v14 + 1) = v16;
    *(_QWORD *)&v8[v12[6]] = *(_QWORD *)&v9[v12[6]];
    *(_QWORD *)&v8[v12[7]] = *(_QWORD *)&v9[v12[7]];
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
  }
  swift_retain();
  return v5;
}

uint64_t destroy for _ExtensionHost(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  v4 = a1 + *(int *)(a2 + 28);
  v5 = sub_20AE9D0AC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  type metadata accessor for ExtensionHostingViewControllerRepresentable(0);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return swift_release();
}

_QWORD *initializeWithCopy for _ExtensionHost(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = *(int *)(a3 + 28);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_20AE9D0AC();
  v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  v10(v7, v8, v9);
  v11 = (int *)type metadata accessor for ExtensionHostingViewControllerRepresentable(0);
  v12 = v11[5];
  v13 = &v7[v12];
  v14 = &v8[v12];
  v16 = *(_QWORD *)v14;
  v15 = *((_QWORD *)v14 + 1);
  *(_QWORD *)v13 = v16;
  *((_QWORD *)v13 + 1) = v15;
  *(_QWORD *)&v7[v11[6]] = *(_QWORD *)&v8[v11[6]];
  *(_QWORD *)&v7[v11[7]] = *(_QWORD *)&v8[v11[7]];
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for _ExtensionHost(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;

  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v6 = *(int *)(a3 + 28);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_20AE9D0AC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = (int *)type metadata accessor for ExtensionHostingViewControllerRepresentable(0);
  v11 = v10[5];
  v12 = &v7[v11];
  v13 = &v8[v11];
  *(_QWORD *)v12 = *(_QWORD *)v13;
  *((_QWORD *)v12 + 1) = *((_QWORD *)v13 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v7[v10[6]] = *(_QWORD *)&v8[v10[6]];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(_QWORD *)&v7[v10[7]] = *(_QWORD *)&v8[v10[7]];
  swift_retain();
  swift_release();
  return a1;
}

uint64_t initializeWithTake for _ExtensionHost(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v4 = *(int *)(a3 + 28);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = sub_20AE9D0AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  v8 = (int *)type metadata accessor for ExtensionHostingViewControllerRepresentable(0);
  *(_OWORD *)(v5 + v8[5]) = *(_OWORD *)(v6 + v8[5]);
  *(_QWORD *)(v5 + v8[6]) = *(_QWORD *)(v6 + v8[6]);
  *(_QWORD *)(v5 + v8[7]) = *(_QWORD *)(v6 + v8[7]);
  return a1;
}

_QWORD *assignWithTake for _ExtensionHost(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;

  *a1 = *a2;
  swift_unknownObjectRelease();
  v6 = a2[2];
  a1[1] = a2[1];
  a1[2] = v6;
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  swift_unknownObjectRelease();
  v7 = *(int *)(a3 + 28);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_20AE9D0AC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = (int *)type metadata accessor for ExtensionHostingViewControllerRepresentable(0);
  v12 = v11[5];
  v13 = &v8[v12];
  v14 = &v9[v12];
  v16 = *(_QWORD *)v14;
  v15 = *((_QWORD *)v14 + 1);
  *(_QWORD *)v13 = v16;
  *((_QWORD *)v13 + 1) = v15;
  swift_bridgeObjectRelease();
  *(_QWORD *)&v8[v11[6]] = *(_QWORD *)&v9[v11[6]];
  swift_unknownObjectRelease();
  *(_QWORD *)&v8[v11[7]] = *(_QWORD *)&v9[v11[7]];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for _ExtensionHost()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20AE919C8(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for ExtensionHostingViewControllerRepresentable(0);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 28)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for _ExtensionHost()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_20AE91A50(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for ExtensionHostingViewControllerRepresentable(0);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 28)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_20AE91AC4()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for ExtensionHostingViewControllerRepresentable(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_20AE91B4C()
{
  return sub_20AE92080((unint64_t *)&unk_25462E518, (uint64_t)&unk_20AEA05C0);
}

uint64_t *sub_20AE91B70(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v13 = *a2;
    *a1 = *a2;
    v4 = (uint64_t *)(v13 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = sub_20AE9D0AC();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v4, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = (uint64_t *)((char *)v4 + v8);
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    *(uint64_t *)((char *)v4 + v9) = *(uint64_t *)((char *)a2 + v9);
    *(uint64_t *)((char *)v4 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_20AE91C24(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_20AE9D0AC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return swift_release();
}

uint64_t sub_20AE91C84(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;

  v6 = sub_20AE9D0AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_20AE91D10(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = sub_20AE9D0AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_20AE91DC4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_20AE9D0AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_20AE91E34(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v6 = sub_20AE9D0AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_release();
  return a1;
}

uint64_t sub_20AE91EC8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20AE91ED4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_20AE9D0AC();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 28));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_20AE91F50()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20AE91F5C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_20AE9D0AC();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 28)) = (a2 - 1);
  return result;
}

uint64_t sub_20AE91FD4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_20AE9D0AC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_20AE9205C()
{
  return sub_20AE92080((unint64_t *)&unk_25462E518, (uint64_t)&unk_20AEA05C0);
}

uint64_t sub_20AE92080(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for ExtensionHostingViewControllerRepresentable(255);
    result = MEMORY[0x20BD34540](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_20AE920C0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for _EXHostViewController.Configuration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20AE92104(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_20AE92148(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t _AnySceneConfiguration.init<A>(erasing:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (**a4)()@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  void (*v13)(unint64_t, char *, uint64_t);
  uint64_t v14;
  uint64_t result;
  uint64_t v16;

  v8 = *(_QWORD *)(a2 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, a1, a2);
  v11 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a2;
  *(_QWORD *)(v12 + 24) = a3;
  v13 = *(void (**)(unint64_t, char *, uint64_t))(v8 + 32);
  v13(v12 + v11, v10, a2);
  v13((unint64_t)v10, a1, a2);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a2;
  *(_QWORD *)(v14 + 24) = a3;
  result = ((uint64_t (*)(unint64_t, char *, uint64_t))v13)(v14 + v11, v10, a2);
  *a4 = sub_20AE92D04;
  a4[1] = (uint64_t (*)())v12;
  a4[2] = sub_20AE92D40;
  a4[3] = (uint64_t (*)())v14;
  return result;
}

uint64_t sub_20AE922A8@<X0>(_QWORD *a1@<X8>)
{
  return _SceneConfiguration.role.getter(a1);
}

uint64_t _SceneConfiguration.role.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;

  if (qword_25462DA68 != -1)
    swift_once();
  v2 = unk_25462E290;
  *a1 = qword_25462E288;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

void _EmptySceneConfiguration.sceneDelegate.getter()
{
  sub_20AE9D574();
  __break(1u);
}

void sub_20AE92358()
{
  sub_20AE9D574();
  __break(1u);
}

uint64_t static _SceneConfigurationBuilder.buildBlock<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v6 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25462E550);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_20AE9F8B0;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, a2);
  _AnySceneConfiguration.init<A>(erasing:)(v8, a2, a3, (uint64_t (**)())(v9 + 32));
  return v9;
}

void Array<A>.sceneDelegate.getter()
{
  sub_20AE9D574();
  __break(1u);
}

void sub_20AE924AC()
{
  sub_20AE9D574();
  __break(1u);
}

uint64_t _SceneConfigurationGroup.init<A>(content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (**a5)()@<X8>)
{
  uint64_t result;
  uint64_t (*v11)();
  __int128 v12;

  swift_getFunctionTypeMetadata0();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253DA1148);
  if ((swift_dynamicCast() & 1) != 0)
  {
    swift_release();
    result = swift_allocObject();
    *(_OWORD *)(result + 16) = v12;
    v11 = sub_20AE8DA70;
  }
  else
  {
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = a3;
    *(_QWORD *)(result + 24) = a4;
    *(_QWORD *)(result + 32) = a1;
    *(_QWORD *)(result + 40) = a2;
    v11 = sub_20AE92D9C;
  }
  *a5 = v11;
  a5[1] = (uint64_t (*)())result;
  return result;
}

uint64_t sub_20AE925D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void (*v10)(void);
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v15;

  v6 = *(_QWORD *)(a3 - 8);
  v7 = MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (void (*)(void))MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v15 - v11;
  v10();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25462E550);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_20AE9F8B0;
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v12, a3);
  _AnySceneConfiguration.init<A>(erasing:)(v9, a3, a4, (uint64_t (**)())(v13 + 32));
  (*(void (**)(char *, uint64_t))(v6 + 8))(v12, a3);
  return v13;
}

double sub_20AE926CC@<D0>(uint64_t *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t (*v4)(void);
  uint64_t v5;
  uint64_t v6;
  os_log_type_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  void (*v17)(_OWORD *__return_ptr, uint64_t);
  uint64_t v18;
  os_log_type_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  os_log_type_t v27;
  NSObject *v28;
  __int128 v29;
  __int128 v30;
  uint8_t *v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  double result;
  __int128 v36;
  _OWORD *v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  unint64_t v41;
  _OWORD v42[2];
  _OWORD v43[3];

  v40 = *a1;
  v41 = a1[1];
  v4 = *(uint64_t (**)(void))v2;
  v5 = *(_QWORD *)(v2 + 8);
  memset((char *)v43 + 8, 0, 32);
  v6 = v4();
  v7 = sub_20AE9D4D8();
  sub_20AE81E98(0, (unint64_t *)&qword_253DA1160);
  v8 = sub_20AE9D508();
  v9 = v7;
  v37 = a2;
  if (os_log_type_enabled(v8, v7))
  {
    swift_retain_n();
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    *(_QWORD *)&v43[0] = v11;
    *(_DWORD *)v10 = 136315138;
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = v4;
    *(_QWORD *)(v12 + 24) = v5;
    *((_QWORD *)&v42[0] + 1) = v12;
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_253DA1148);
    v13 = sub_20AE9D3DC();
    *(_QWORD *)&v42[0] = sub_20AE98A70(v13, v14, (uint64_t *)v43);
    sub_20AE9D520();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_20AE73000, v8, v9, "Content %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x20BD345D0](v11, -1, -1);
    MEMORY[0x20BD345D0](v10, -1, -1);
  }

  v15 = *(_QWORD *)(v6 + 16);
  if (v15)
  {
    v16 = (_QWORD *)(v6 + 56);
    while (1)
    {
      v17 = (void (*)(_OWORD *__return_ptr, uint64_t))*(v16 - 3);
      v18 = *v16;
      v39 = *((_OWORD *)v16 - 1);
      swift_retain();
      swift_retain();
      v19 = sub_20AE9D4D8();
      v20 = sub_20AE9D508();
      v21 = v19;
      if (os_log_type_enabled(v20, v19))
      {
        swift_retain_n();
        swift_retain_n();
        swift_bridgeObjectRetain_n();
        v22 = swift_slowAlloc();
        v38 = swift_slowAlloc();
        *(_QWORD *)&v43[0] = v38;
        *(_DWORD *)v22 = 136315394;
        swift_retain();
        v23 = swift_retain();
        v17(v42, v23);
        swift_release();
        swift_release();
        *(_QWORD *)(v22 + 4) = sub_20AE98A70(*(uint64_t *)&v42[0], *((unint64_t *)&v42[0] + 1), (uint64_t *)v43);
        swift_release_n();
        swift_release_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v22 + 12) = 2080;
        swift_bridgeObjectRetain();
        v24 = v40;
        *(_QWORD *)(v22 + 14) = sub_20AE98A70(v40, v41, (uint64_t *)v43);
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_20AE73000, v20, v21, "Evaluating %s) for role %s", (uint8_t *)v22, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x20BD345D0](v38, -1, -1);
        MEMORY[0x20BD345D0](v22, -1, -1);

      }
      else
      {

        v24 = v40;
      }
      swift_retain();
      v25 = swift_retain();
      v17(v42, v25);
      swift_release();
      swift_release();
      if (v42[0] == __PAIR128__(v41, v24))
        break;
      v26 = sub_20AE9D5BC();
      swift_bridgeObjectRelease();
      if ((v26 & 1) != 0)
        goto LABEL_13;
      swift_release();
      swift_release();
      v16 += 4;
      if (!--v15)
        goto LABEL_12;
    }
    swift_bridgeObjectRelease();
LABEL_13:
    swift_bridgeObjectRelease();
    sub_20AE9408C(*((uint64_t *)&v43[0] + 1));
    *((_QWORD *)&v43[0] + 1) = v17;
    v43[1] = v39;
    *(_QWORD *)&v43[2] = v18;
  }
  else
  {
LABEL_12:
    swift_bridgeObjectRelease();
  }
  v27 = sub_20AE9D4D8();
  v28 = sub_20AE9D508();
  if (os_log_type_enabled(v28, v27))
  {
    v29 = *(_OWORD *)((char *)&v43[1] + 8);
    v30 = *(_OWORD *)((char *)v43 + 8);
    sub_20AE940BC(*((uint64_t *)&v43[0] + 1));
    sub_20AE940BC(v30);
    v31 = (uint8_t *)swift_slowAlloc();
    v32 = swift_slowAlloc();
    *(_DWORD *)v31 = 136315138;
    *(_QWORD *)&v43[0] = v32;
    v42[0] = v30;
    v42[1] = v29;
    sub_20AE940BC(v30);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25462E5C0);
    v33 = sub_20AE9D3DC();
    *(_QWORD *)&v42[0] = sub_20AE98A70(v33, v34, (uint64_t *)v43);
    sub_20AE9D520();
    swift_bridgeObjectRelease();
    sub_20AE9408C(v30);
    sub_20AE9408C(v30);
    _os_log_impl(&dword_20AE73000, v28, v27, "Made View configuration: %s", v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x20BD345D0](v32, -1, -1);
    MEMORY[0x20BD345D0](v31, -1, -1);
  }

  swift_beginAccess();
  result = *((double *)v43 + 1);
  v36 = *(_OWORD *)((char *)&v43[1] + 8);
  *v37 = *(_OWORD *)((char *)v43 + 8);
  v37[1] = v36;
  return result;
}

uint64_t _AnySceneConfiguration.role.getter()
{
  uint64_t (**v0)(void);

  return (*v0)();
}

uint64_t sub_20AE92D04()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 24) + 8))();
}

uint64_t sub_20AE92D40()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 24) + 16))();
}

uint64_t sub_20AE92D78()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20AE92D9C()
{
  uint64_t *v0;

  return sub_20AE925D4(v0[4], v0[5], v0[2], v0[3]);
}

uint64_t _AnySceneConfiguration.sceneDelegate.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t type metadata accessor for _UIAppExtensionSceneConfigWrapper(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _UIAppExtensionSceneConfigWrapper);
}

id sub_20AE930AC(_OWORD *a1)
{
  objc_class *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_allocWithZone(v1);
  return sub_20AE93130(a1, v4, v5, v6);
}

uint64_t sub_20AE930E4(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  LOBYTE(a1) = sub_20AE81F14((uint64_t)v4);

  return a1 & 1;
}

id sub_20AE93130(_OWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  objc_class *v6;
  objc_super v8;

  v5 = *MEMORY[0x24BEE4EA0] & *v4;
  *(_OWORD *)((char *)v4 + qword_25462E558) = *a1;
  v6 = (objc_class *)type metadata accessor for _UIAppExtensionSceneConfigWrapper._SceneFactory(0, *(_QWORD *)(v5 + 80), *(_QWORD *)(v5 + 88), a4);
  v8.receiver = v4;
  v8.super_class = v6;
  return objc_msgSendSuper2(&v8, sel_init);
}

void sub_20AE9318C(void *a1)
{
  _QWORD *v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _UNKNOWN **v10;
  os_log_type_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26[2];
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  _UNKNOWN **v30;

  v2 = *MEMORY[0x24BEE4EA0] & *v1;
  v3 = objc_msgSend(a1, sel_role);
  v4 = sub_20AE9D3D0();
  v6 = v5;

  v27 = *(_OWORD *)((char *)v1 + qword_25462E558);
  v26[0] = v4;
  v26[1] = v6;
  sub_20AE926CC(v26, &v28);
  v7 = v28;
  if ((_QWORD)v28)
  {
    v8 = *((_QWORD *)&v28 + 1);
    v9 = v29;
    v10 = v30;
    swift_retain();
    swift_retain();
    v11 = sub_20AE9D4D8();
    sub_20AE81E98(0, (unint64_t *)&qword_253DA1160);
    v12 = sub_20AE9D508();
    if (os_log_type_enabled(v12, v11))
    {
      sub_20AE940BC(v7);
      sub_20AE940BC(v7);
      swift_bridgeObjectRetain();
      v25 = v2;
      v13 = swift_slowAlloc();
      v24 = swift_slowAlloc();
      *(_QWORD *)&v27 = v24;
      *(_DWORD *)v13 = 136315394;
      *(_QWORD *)&v28 = v7;
      *((_QWORD *)&v28 + 1) = v8;
      v29 = v9;
      v30 = v10;
      swift_retain();
      swift_retain();
      v14 = sub_20AE9D3DC();
      *(_QWORD *)&v28 = sub_20AE98A70(v14, v15, (uint64_t *)&v27);
      sub_20AE9D520();
      swift_bridgeObjectRelease();
      sub_20AE9408C(v7);
      sub_20AE9408C(v7);
      *(_WORD *)(v13 + 12) = 2080;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v28 = sub_20AE98A70(v4, v6, (uint64_t *)&v27);
      sub_20AE9D520();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_20AE73000, v12, v11, "Using %s for requested role %s", (uint8_t *)v13, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x20BD345D0](v24, -1, -1);
      v16 = v13;
      v2 = v25;
      MEMORY[0x20BD345D0](v16, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v22 = *(_QWORD *)(v2 + 88);
    *(_QWORD *)&v28 = *(_QWORD *)(v2 + 80);
    *((_QWORD *)&v28 + 1) = &type metadata for _AnySceneConfiguration;
    v29 = v22;
    v30 = &protocol witness table for _AnySceneConfiguration;
    type metadata accessor for _UIAppExtensionSceneConfigWrapper._Scene();
  }
  v17 = sub_20AE9D4E4();
  sub_20AE81E98(0, (unint64_t *)&qword_253DA1160);
  v18 = sub_20AE9D508();
  v19 = v17;
  if (os_log_type_enabled(v18, (os_log_type_t)v17))
  {
    swift_bridgeObjectRetain();
    v20 = (uint8_t *)swift_slowAlloc();
    v21 = swift_slowAlloc();
    *(_QWORD *)&v28 = v21;
    *(_DWORD *)v20 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v27 = sub_20AE98A70(v4, v6, (uint64_t *)&v28);
    sub_20AE9D520();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_20AE73000, v18, v19, "No configuration found for requested role %s", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x20BD345D0](v21, -1, -1);
    MEMORY[0x20BD345D0](v20, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease();
  }

  v23 = *(_QWORD *)(v2 + 88);
  *(_QWORD *)&v28 = *(_QWORD *)(v2 + 80);
  *((_QWORD *)&v28 + 1) = &type metadata for _AnySceneConfiguration;
  v29 = v23;
  v30 = &protocol witness table for _AnySceneConfiguration;
  type metadata accessor for _UIAppExtensionSceneConfigWrapper._Scene();
}

void sub_20AE935D8()
{
  sub_20AE94040();
}

void sub_20AE93624(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  sub_20AE9318C(v4);
}

id sub_20AE93650(void *a1)
{
  void *v1;
  void *v2;

  return a1;
}

uint64_t sub_20AE93670(_QWORD *a1, uint64_t a2)
{
  return sub_20AE82ABC(a1, a2, (uint64_t (*)(_QWORD, _QWORD))sub_20AE8395C);
}

id sub_20AE9367C()
{
  return sub_20AE82AE4((uint64_t (*)(_QWORD, _QWORD, _QWORD))type metadata accessor for _UIAppExtensionSceneConfigWrapper._SceneFactory);
}

uint64_t sub_20AE93688()
{
  return swift_release();
}

id sub_20AE9369C(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  v2 = (void *)sub_20AE936CC();

  return v2;
}

uint64_t sub_20AE936CC()
{
  _QWORD *v0;

  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0x68) + 16))(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0x58));
}

void sub_20AE9370C()
{
  sub_20AE839A8();
}

void sub_20AE9372C()
{
  type metadata accessor for _UIAppExtensionSceneConfigWrapper._Scene();
}

id sub_20AE93760(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 16) = v1;
  *(_QWORD *)(v2 - 8) = a1;
  return objc_msgSendSuper2((objc_super *)(v2 - 16), sel_dealloc);
}

uint64_t sub_20AE93780(char *a1)
{
  return (*(uint64_t (**)(char *))(*(_QWORD *)(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)a1) + 0x58)
                                                       - 8)
                                           + 8))(&a1[*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)a1) + 0x70)]);
}

uint64_t sub_20AE937AC(_QWORD *a1, uint64_t a2)
{
  return sub_20AE82ABC(a1, a2, (uint64_t (*)(_QWORD, _QWORD))sub_20AE94110);
}

id sub_20AE937B8()
{
  return sub_20AE82AE4((uint64_t (*)(_QWORD, _QWORD, _QWORD))type metadata accessor for _UIAppExtensionSceneConfigWrapper);
}

uint64_t sub_20AE937C4(char *a1)
{
  return (*(uint64_t (**)(char *))(*(_QWORD *)(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)a1) + 0x50)
                                                       - 8)
                                           + 8))(&a1[*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)a1) + 0x60)]);
}

id sub_20AE937F0(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  _QWORD *v10;
  os_log_type_t v11;
  NSObject *v12;
  void (*v13)(char *, uint64_t, uint64_t);
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  objc_class *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  objc_class *v31;
  uint8_t *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  objc_super v37;
  __int128 v38;
  __int128 v39;

  v2 = a1;
  v36 = *MEMORY[0x24BEE4EA0] & *v1;
  v3 = *(_QWORD *)(v36 + 80);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v33 - v8;
  v10 = v1;
  v11 = sub_20AE9D4D8();
  sub_20AE81E98(0, (unint64_t *)&qword_253DA1160);
  v12 = sub_20AE9D508();
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v13(v9, v2, v3);
  v14 = v11;
  if (os_log_type_enabled(v12, v11))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v35 = v10;
    v17 = v16;
    *(_QWORD *)&v39 = v16;
    v34 = v2;
    *(_DWORD *)v15 = 136315138;
    v33 = v15 + 4;
    v13(v7, (uint64_t)v9, v3);
    v18 = sub_20AE9D3DC();
    *(_QWORD *)&v38 = sub_20AE98A70(v18, v19, (uint64_t *)&v39);
    v2 = v34;
    sub_20AE9D520();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    _os_log_impl(&dword_20AE73000, v12, v14, "Creating _UIAppExtensionSceneConfigWrapper with content %s", v15, 0xCu);
    swift_arrayDestroy();
    v20 = v17;
    v10 = v35;
    MEMORY[0x20BD345D0](v20, -1, -1);
    MEMORY[0x20BD345D0](v15, -1, -1);

  }
  else
  {

    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  }
  v13((char *)v10 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v10) + 0x60), v2, v3);

  sub_20AE81E98(0, &qword_253DA1158);
  v21 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
  v22 = *(_QWORD *)(v36 + 88);
  v24 = (objc_class *)type metadata accessor for _UIAppExtensionSceneConfigWrapper._SceneFactory(0, v3, v22, v23);
  (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v22 + 8))(&v39, v3, v22);
  v38 = v39;
  v25 = objc_allocWithZone(v24);
  v29 = sub_20AE93130(&v38, v26, v27, v28);
  objc_msgSend(v21, sel_setSceneFactory_, v29);

  v31 = (objc_class *)type metadata accessor for _UIAppExtensionSceneConfigWrapper(0, v3, v22, v30);
  v37.receiver = v10;
  v37.super_class = v31;
  return objc_msgSendSuper2(&v37, sel_init);
}

id sub_20AE93B08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  id v6;

  v6 = objc_allocWithZone((Class)type metadata accessor for _UIAppExtensionSceneConfigWrapper(0, *(_QWORD *)(v4 + 80), *(_QWORD *)(v4 + 88), a4));
  return sub_20AE937F0(a1);
}

uint64_t dispatch thunk of _SceneConfigurationProviding.content.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of _SceneConfiguration.role.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of _SceneConfiguration.sceneDelegate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

ValueMetadata *type metadata accessor for _EmptySceneConfiguration()
{
  return &type metadata for _EmptySceneConfiguration;
}

ValueMetadata *type metadata accessor for _SceneConfigurationBuilder()
{
  return &type metadata for _SceneConfigurationBuilder;
}

ValueMetadata *type metadata accessor for _SceneConfigurationGroup()
{
  return &type metadata for _SceneConfigurationGroup;
}

uint64_t destroy for _AnyAppExtensionScene()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for _AnyAppExtensionScene(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for _AnyAppExtensionScene(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for _AnyAppExtensionScene(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for _AnyAppExtensionScene(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for _AnyAppExtensionScene(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
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
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for _AnySceneConfiguration()
{
  return &type metadata for _AnySceneConfiguration;
}

uint64_t type metadata accessor for _UIAppExtensionSceneConfigWrapper._SceneFactory(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for _UIAppExtensionSceneConfigWrapper._SceneFactory);
}

uint64_t sub_20AE93D3C()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void type metadata accessor for _UIAppExtensionSceneConfigWrapper._Scene()
{
  JUMPOUT(0x20BD344D4);
}

void sub_20AE93DB8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  os_log_type_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26[2];
  __int128 v27;

  v2 = a1;
  v3 = *MEMORY[0x24BEE4EA0] & *v1;
  v4 = *(_QWORD *)(v3 + 0x58);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v21 - v9;
  v11 = v1;
  v12 = sub_20AE9D4D8();
  sub_20AE81E98(0, (unint64_t *)&qword_253DA1160);
  v13 = sub_20AE9D508();
  v24 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v24(v10, v2, v4);
  v14 = v12;
  if (os_log_type_enabled(v13, v12))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v23 = v3;
    v17 = v16;
    v26[0] = v16;
    v22 = v2;
    *(_DWORD *)v15 = 136315138;
    v21[1] = v15 + 4;
    v24(v8, (uint64_t)v10, v4);
    v18 = sub_20AE9D3DC();
    v25 = sub_20AE98A70(v18, v19, v26);
    v2 = v22;
    sub_20AE9D520();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    swift_arrayDestroy();
    v20 = v17;
    v3 = v23;
    MEMORY[0x20BD345D0](v20, -1, -1);
    MEMORY[0x20BD345D0](v15, -1, -1);

  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  }
  v24(&v11[*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)v11) + 0x70)], v2, v4);

  v26[0] = *(_QWORD *)(v3 + 80);
  v26[1] = v4;
  v27 = *(_OWORD *)(v3 + 96);
  type metadata accessor for _UIAppExtensionSceneConfigWrapper._Scene();
}

id sub_20AE9400C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 96) = v1;
  *(_QWORD *)(v2 - 88) = a1;
  return objc_msgSendSuper2((objc_super *)(v2 - 96), sel_init);
}

void sub_20AE94040()
{
  type metadata accessor for _UIAppExtensionSceneConfigWrapper._Scene();
}

void sub_20AE94068(objc_class *a1)
{
  uint64_t v1;
  id v2;

  v2 = objc_allocWithZone(a1);
  sub_20AE93DB8(v1);
}

uint64_t sub_20AE9408C(uint64_t result)
{
  if (result)
  {
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_20AE940BC(uint64_t result)
{
  if (result)
  {
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_20AE940EC()
{
  swift_release();
  return swift_deallocObject();
}

void sub_20AE94110()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t _EXHostViewController.Configuration.init(appExtension:role:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  int *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  char *v16;
  void (*v17)(char *, uint64_t);
  uint64_t v19;
  uint64_t v20;

  v20 = a3;
  v5 = (int *)type metadata accessor for _EXHostViewController.Configuration();
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_20AE9D0AC();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *a2;
  v12 = a2[1];
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v14(v11, a1, v8);
  v15 = v5[8];
  v14(v7, (uint64_t)v11, v8);
  v16 = &v7[v5[7]];
  *(_QWORD *)v16 = v13;
  *((_QWORD *)v16 + 1) = v12;
  *(_QWORD *)&v7[v15] = 0;
  LOBYTE(v12) = sub_20AE9D0E8();
  v17 = *(void (**)(char *, uint64_t))(v9 + 8);
  v17(v11, v8);
  v7[v5[5]] = v12 & 1;
  v7[v5[6]] = 0;
  sub_20AE920C0((uint64_t)v7, v20);
  return ((uint64_t (*)(uint64_t, uint64_t))v17)(a1, v8);
}

uint64_t _EXHostViewController.Configuration.role.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  v4 = (_QWORD *)(v1 + *(int *)(type metadata accessor for _EXHostViewController.Configuration() + 28));
  result = swift_bridgeObjectRelease();
  *v4 = v2;
  v4[1] = v3;
  return result;
}

uint64_t _EXHostViewController._configuration.setter(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  _BYTE v17[12];
  unsigned int v18;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25462E540);
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v17[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v7 = (int *)type metadata accessor for _EXHostViewController.Configuration();
  v8 = *((_QWORD *)v7 - 1);
  MEMORY[0x24BDAC7A8](v7);
  v10 = &v17[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_20AE94B18(a1, (uint64_t)v6);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, int *))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_20AE94B60((uint64_t)v6);
    objc_msgSend(v2, sel_setConfiguration_, 0);
    return sub_20AE94B60(a1);
  }
  else
  {
    sub_20AE920C0((uint64_t)v6, (uint64_t)v10);
    sub_20AE9CF98();
    v12 = *(_QWORD *)&v10[v7[8]];
    v18 = v10[v7[5]];
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    swift_bridgeObjectRetain();
    objc_opt_self();
    v13 = (void *)swift_dynamicCastObjCClassUnconditional();
    v14 = objc_msgSend(objc_allocWithZone((Class)_EXHostViewControllerConfiguration), sel_initWithExtensionIdentity_, v13);

    v15 = v10[v7[6]];
    v16 = (void *)sub_20AE9D3AC();
    swift_bridgeObjectRelease();
    objc_msgSend(v14, sel_setRole_, v16);

    objc_msgSend(v14, sel_setInitializationParameters_, v12);
    objc_msgSend(v14, sel_setBeginHostingImmediately_, v18);
    objc_msgSend(v14, sel_setRetryOnHostingFailure_, v15);
    objc_msgSend(v2, sel_setConfiguration_, v14);
    swift_unknownObjectRelease();

    swift_unknownObjectRelease();
    sub_20AE94B60(a1);
    return sub_20AE94BA0((uint64_t)v10);
  }
}

void _EXHostViewController.configuration.setter(void *a1)
{
  void *v1;

  objc_msgSend(v1, sel_setConfiguration_, a1);

}

id _EXHostViewController.configuration.getter()
{
  void *v0;

  return objc_msgSend(v0, sel_configuration);
}

void (*_EXHostViewController.configuration.modify(_QWORD *a1))(id *a1)
{
  void *v1;

  a1[1] = v1;
  *a1 = objc_msgSend(v1, sel_configuration);
  return sub_20AE945A8;
}

void sub_20AE945A8(id *a1)
{
  id v1;

  v1 = *a1;
  objc_msgSend(a1[1], sel_setConfiguration_);

}

uint64_t _EXHostViewController.appExtensionProcess.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;

  if (objc_msgSend(v1, sel_extensionProcess))
  {
    sub_20AE9D01C();
    v3 = sub_20AE9D034();
    v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56);
    v5 = a1;
    v6 = 0;
  }
  else
  {
    v3 = sub_20AE9D034();
    v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56);
    v5 = a1;
    v6 = 1;
  }
  return v4(v5, v6, 1, v3);
}

uint64_t _EXHostViewController.Configuration.appExtension.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_20AE9D0AC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t _EXHostViewController.Configuration.appExtension.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_20AE9D0AC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*_EXHostViewController.Configuration.appExtension.modify())()
{
  return nullsub_3;
}

uint64_t _EXHostViewController.Configuration.role.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(v1 + *(int *)(type metadata accessor for _EXHostViewController.Configuration() + 28));
  v4 = v3[1];
  *a1 = *v3;
  a1[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_20AE9470C(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t result;

  v3 = *a1;
  v2 = a1[1];
  v4 = (_QWORD *)(a2 + *(int *)(type metadata accessor for _EXHostViewController.Configuration() + 28));
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRelease();
  *v4 = v3;
  v4[1] = v2;
  return result;
}

uint64_t (*_EXHostViewController.Configuration.role.modify(uint64_t a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  *(_QWORD *)(a1 + 16) = v1;
  v3 = *(int *)(type metadata accessor for _EXHostViewController.Configuration() + 28);
  *(_DWORD *)(a1 + 24) = v3;
  v4 = (_QWORD *)(v1 + v3);
  v5 = v4[1];
  *(_QWORD *)a1 = *v4;
  *(_QWORD *)(a1 + 8) = v5;
  swift_bridgeObjectRetain();
  return sub_20AE947AC;
}

uint64_t sub_20AE947AC(uint64_t *a1, char a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t result;

  v2 = a1[1];
  v3 = (_QWORD *)(a1[2] + *((int *)a1 + 6));
  v4 = *a1;
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *v3 = v4;
    v3[1] = v2;
    return swift_bridgeObjectRelease();
  }
  else
  {
    result = swift_bridgeObjectRelease();
    *v3 = v4;
    v3[1] = v2;
  }
  return result;
}

uint64_t _EXHostViewController.Configuration.beginHostingImmediately.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for _EXHostViewController.Configuration() + 20));
}

uint64_t _EXHostViewController.Configuration.beginHostingImmediately.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for _EXHostViewController.Configuration();
  *(_BYTE *)(v1 + *(int *)(result + 20)) = a1;
  return result;
}

uint64_t (*_EXHostViewController.Configuration.beginHostingImmediately.modify())()
{
  type metadata accessor for _EXHostViewController.Configuration();
  return nullsub_3;
}

uint64_t _EXHostViewController.Configuration.retryOnHostingFailure.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + *(int *)(type metadata accessor for _EXHostViewController.Configuration() + 24));
}

uint64_t _EXHostViewController.Configuration.retryOnHostingFailure.setter(char a1)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for _EXHostViewController.Configuration();
  *(_BYTE *)(v1 + *(int *)(result + 24)) = a1;
  return result;
}

uint64_t (*_EXHostViewController.Configuration.retryOnHostingFailure.modify())()
{
  type metadata accessor for _EXHostViewController.Configuration();
  return nullsub_3;
}

uint64_t _EXHostViewController.Configuration.sceneID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for _EXHostViewController.Configuration() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t _EXHostViewController.Configuration.sceneID.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t result;

  v5 = (_QWORD *)(v2 + *(int *)(type metadata accessor for _EXHostViewController.Configuration() + 28));
  result = swift_bridgeObjectRelease();
  *v5 = a1;
  v5[1] = a2;
  return result;
}

uint64_t (*_EXHostViewController.Configuration.sceneID.modify())()
{
  type metadata accessor for _EXHostViewController.Configuration();
  return nullsub_3;
}

uint64_t _EXHostViewController.Configuration._initializationParameters.getter()
{
  type metadata accessor for _EXHostViewController.Configuration();
  return swift_unknownObjectRetain();
}

uint64_t _EXHostViewController.Configuration._initializationParameters.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;

  v3 = *(int *)(type metadata accessor for _EXHostViewController.Configuration() + 32);
  result = swift_unknownObjectRelease();
  *(_QWORD *)(v1 + v3) = a1;
  return result;
}

uint64_t (*_EXHostViewController.Configuration._initializationParameters.modify())()
{
  type metadata accessor for _EXHostViewController.Configuration();
  return nullsub_3;
}

uint64_t _EXHostViewController.Configuration.init(appExtension:sceneID:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t result;

  v8 = (int *)type metadata accessor for _EXHostViewController.Configuration();
  v9 = v8[8];
  v10 = sub_20AE9D0AC();
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(a4, a1, v10);
  v12 = (_QWORD *)(a4 + v8[7]);
  *v12 = a2;
  v12[1] = a3;
  *(_QWORD *)(a4 + v9) = 0;
  LOBYTE(a3) = sub_20AE9D0E8();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
  *(_BYTE *)(a4 + v8[5]) = a3 & 1;
  *(_BYTE *)(a4 + v8[6]) = 0;
  return result;
}

uint64_t type metadata accessor for _EXHostViewController.Configuration()
{
  uint64_t result;

  result = qword_25462E608;
  if (!qword_25462E608)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_20AE94B18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25462E540);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20AE94B60(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25462E540);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20AE94BA0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for _EXHostViewController.Configuration();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t _EXHostViewController._configuration.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  unsigned __int8 v10;
  unsigned __int8 v11;
  int *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t, int *);
  uint64_t v16;
  uint64_t v17;

  v3 = objc_msgSend(v1, sel_configuration);
  if (v3)
  {
    v4 = v3;
    MEMORY[0x20BD338B0](objc_msgSend(v3, sel_extensionIdentity));
    v5 = objc_msgSend(v4, sel_role);
    v6 = sub_20AE9D3D0();
    v8 = v7;

    v9 = objc_msgSend(v4, sel_initializationParameters);
    v10 = objc_msgSend(v4, sel_beginHostingImmediately);
    v11 = objc_msgSend(v4, sel_retryOnHostingFailure);

    v12 = (int *)type metadata accessor for _EXHostViewController.Configuration();
    v13 = v12[8];
    v14 = (uint64_t *)(a1 + v12[7]);
    *v14 = v6;
    v14[1] = v8;
    *(_QWORD *)(a1 + v13) = v9;
    *(_BYTE *)(a1 + v12[5]) = v10;
    *(_BYTE *)(a1 + v12[6]) = v11;
    v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(*((_QWORD *)v12 - 1) + 56);
    v16 = a1;
    v17 = 0;
  }
  else
  {
    v12 = (int *)type metadata accessor for _EXHostViewController.Configuration();
    v15 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *))(*((_QWORD *)v12 - 1) + 56);
    v16 = a1;
    v17 = 1;
  }
  return v15(v16, v17, 1, v12);
}

uint64_t sub_20AE94D1C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25462E540);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20AE94B18(a1, (uint64_t)v4);
  return _EXHostViewController._configuration.setter((uint64_t)v4);
}

void (*_EXHostViewController._configuration.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  size_t v3;
  void *v4;

  *a1 = v1;
  v3 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25462E540) - 8) + 64);
  a1[1] = malloc(v3);
  v4 = malloc(v3);
  a1[2] = v4;
  _EXHostViewController._configuration.getter((uint64_t)v4);
  return sub_20AE94E04;
}

void sub_20AE94E04(uint64_t a1, char a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 8);
  v3 = *(void **)(a1 + 16);
  if ((a2 & 1) != 0)
  {
    sub_20AE94B18((uint64_t)v3, (uint64_t)v2);
    _EXHostViewController._configuration.setter((uint64_t)v2);
    sub_20AE94B60((uint64_t)v3);
  }
  else
  {
    _EXHostViewController._configuration.setter((uint64_t)v3);
  }
  free(v3);
  free(v2);
}

uint64_t _EXHostViewController.Session.__allocating_init(processConfiguration:configuration:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;

  *(_QWORD *)(v3 + 112) = a1;
  *(_QWORD *)(v3 + 120) = v2;
  v5 = sub_20AE9D004();
  *(_QWORD *)(v3 + 128) = v5;
  *(_QWORD *)(v3 + 136) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v3 + 144) = swift_task_alloc();
  v6 = sub_20AE9D034();
  *(_QWORD *)(v3 + 152) = v6;
  *(_QWORD *)(v3 + 160) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v3 + 168) = swift_task_alloc();
  v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v3 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v3 + 64) = v7;
  *(_OWORD *)(v3 + 80) = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(v3 + 96) = *(_BYTE *)(a2 + 80);
  v8 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v3 + 32) = v8;
  return swift_task_switch();
}

uint64_t sub_20AE94F0C()
{
  _QWORD *v0;
  _QWORD *v1;

  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0[17] + 16))(v0[18], v0[14], v0[16]);
  v1 = (_QWORD *)swift_task_alloc();
  v0[22] = v1;
  *v1 = v0;
  v1[1] = sub_20AE94F74;
  return sub_20AE9D010();
}

uint64_t sub_20AE94F74()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 184) = v0;
  swift_task_dealloc();
  if (v0)
    sub_20AE95264(v2 + 16);
  return swift_task_switch();
}

uint64_t sub_20AE94FE0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[21];
  v2 = swift_task_alloc();
  v0[24] = v2;
  *(_QWORD *)(v2 + 16) = v0 + 2;
  *(_QWORD *)(v2 + 24) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  v0[25] = v3;
  sub_20AE9554C();
  *v3 = v0;
  v3[1] = sub_20AE95090;
  return sub_20AE9D5C8();
}

uint64_t sub_20AE95090()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)v1 + 16;
  *(_QWORD *)(*(_QWORD *)v1 + 208) = v0;
  swift_task_dealloc();
  sub_20AE95264(v2);
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20AE95110()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(v0 + 160);
  v1 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 152);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 136) + 8))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 128));
  v4 = *(_QWORD *)(v0 + 104);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v5);
}

uint64_t sub_20AE951A4()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 136) + 8))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 128));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20AE951F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 160);
  v1 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 152);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 136) + 8))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 128));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20AE95264(uint64_t a1)
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  return a1;
}

void sub_20AE952AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t aBlock;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t (*v23)();
  uint64_t v24;

  v18 = a1;
  v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25462E620);
  v3 = *(_QWORD *)(v17 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v17);
  v5 = objc_allocWithZone((Class)_EXHostViewControllerSessionConfiguration);
  swift_bridgeObjectRetain();
  v6 = (void *)sub_20AE9D3AC();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v5, sel_initWithSceneIdentifier_, v6);

  v8 = *(_QWORD *)(a2 + 56);
  v23 = *(uint64_t (**)())(a2 + 48);
  v24 = v8;
  aBlock = MEMORY[0x24BDAC760];
  v20 = 1107296256;
  v21 = sub_20AE95588;
  v22 = &block_descriptor_25;
  v9 = _Block_copy(&aBlock);
  v10 = v7;
  swift_retain();
  swift_release();
  objc_msgSend(v10, sel_setInvalidationHandler_, v9);
  _Block_release(v9);
  objc_msgSend(v10, sel_setInitialFrame_, *(double *)(a2 + 16), *(double *)(a2 + 24), *(double *)(a2 + 32), *(double *)(a2 + 40));
  objc_msgSend(v10, sel_setRetryOnHostingFailure_, *(unsigned __int8 *)(a2 + 64));
  objc_msgSend(v10, sel_set_shouldHostRemoteTextEffectsWindow_, *(unsigned __int8 *)(a2 + 80));
  v11 = (void *)objc_opt_self();
  sub_20AE9D028();
  objc_opt_self();
  v12 = (void *)swift_dynamicCastObjCClassUnconditional();
  v13 = v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v18, v17);
  v14 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v3 + 32))(v15 + v14, (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v13);
  v23 = sub_20AE968E8;
  v24 = v15;
  aBlock = MEMORY[0x24BDAC760];
  v20 = 1107296256;
  v21 = sub_20AE955B4;
  v22 = &block_descriptor_31;
  v16 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v11, sel_sessionWithProcess_configuration_completion_, v12, v10, v16);

  _Block_release(v16);
}

void sub_20AE95544(uint64_t a1)
{
  uint64_t v1;

  sub_20AE952AC(a1, *(_QWORD *)(v1 + 16));
}

unint64_t sub_20AE9554C()
{
  unint64_t result;

  result = qword_25462E5F0;
  if (!qword_25462E5F0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25462E5F0);
  }
  return result;
}

uint64_t sub_20AE95588(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_20AE955B4(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t _EXHostViewController.Session.__allocating_init(process:configuration:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;

  *(_QWORD *)(v3 + 112) = a1;
  *(_QWORD *)(v3 + 120) = v2;
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v3 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v3 + 64) = v4;
  *(_OWORD *)(v3 + 80) = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(v3 + 96) = *(_BYTE *)(a2 + 80);
  v5 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v3 + 32) = v5;
  return swift_task_switch();
}

uint64_t sub_20AE9563C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[14];
  v2 = swift_task_alloc();
  v0[16] = v2;
  *(_QWORD *)(v2 + 16) = v0 + 2;
  *(_QWORD *)(v2 + 24) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  v0[17] = v3;
  sub_20AE9554C();
  *v3 = v0;
  v3[1] = sub_20AE956EC;
  return sub_20AE9D5C8();
}

uint64_t sub_20AE956EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)v1 + 16;
  *(_QWORD *)(*(_QWORD *)v1 + 144) = v0;
  swift_task_dealloc();
  sub_20AE95264(v2);
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20AE9576C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 104);
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v2;
  v4 = sub_20AE9D034();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v1, v4);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v3);
}

uint64_t sub_20AE957DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 112);
  v2 = sub_20AE9D034();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_20AE95828(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t aBlock;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t (*v23)();
  uint64_t v24;

  v18 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25462E620);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  MEMORY[0x24BDAC7A8](v3);
  v6 = objc_allocWithZone((Class)_EXHostViewControllerSessionConfiguration);
  swift_bridgeObjectRetain();
  v7 = (void *)sub_20AE9D3AC();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v6, sel_initWithSceneIdentifier_, v7);

  v9 = *(_QWORD *)(a2 + 56);
  v23 = *(uint64_t (**)())(a2 + 48);
  v24 = v9;
  aBlock = MEMORY[0x24BDAC760];
  v20 = 1107296256;
  v21 = sub_20AE95588;
  v22 = &block_descriptor_0;
  v10 = _Block_copy(&aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_setInvalidationHandler_, v10);
  _Block_release(v10);
  objc_msgSend(v8, sel_setInitialFrame_, *(double *)(a2 + 16), *(double *)(a2 + 24), *(double *)(a2 + 32), *(double *)(a2 + 40));
  objc_msgSend(v8, sel_setRetryOnHostingFailure_, *(unsigned __int8 *)(a2 + 64));
  objc_msgSend(v8, sel_set_shouldHostRemoteTextEffectsWindow_, *(unsigned __int8 *)(a2 + 80));
  v11 = (void *)objc_opt_self();
  sub_20AE9D028();
  objc_opt_self();
  v12 = (void *)swift_dynamicCastObjCClassUnconditional();
  v13 = v3;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v18, v3);
  v14 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v15 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v15 + v14, (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v13);
  v23 = sub_20AE968E8;
  v24 = v15;
  aBlock = MEMORY[0x24BDAC760];
  v20 = 1107296256;
  v21 = sub_20AE955B4;
  v22 = &block_descriptor_22;
  v16 = _Block_copy(&aBlock);
  swift_release();
  objc_msgSend(v11, sel_sessionWithProcess_configuration_completion_, v12, v8, v16);
  _Block_release(v16);

}

void sub_20AE95AB8(uint64_t a1)
{
  uint64_t v1;

  sub_20AE95828(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_20AE95AC0(void *a1)
{
  id v1;

  v1 = a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25462E620);
  return sub_20AE9D478();
}

NSXPCConnection __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> _EXHostViewController.Session.makeXPCConnection()()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = *(void **)(v0 + 16);
  v6[0] = 0;
  v2 = objc_msgSend(v1, sel__makeXPCConnectionWithError_, v6);
  if (v2)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    sub_20AE9CEE4();

    swift_willThrow();
  }
  return (NSXPCConnection)v2;
}

Swift::Void __swiftcall _EXHostViewController.Session.invalidate()()
{
  uint64_t v0;

  objc_msgSend(*(id *)(v0 + 16), sel_invalidate);
}

double _EXHostViewController.Session.Configuration.init(sceneID:onInvalidation:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  double result;

  *(_QWORD *)a5 = a1;
  *(_QWORD *)(a5 + 8) = a2;
  result = 0.0;
  *(_OWORD *)(a5 + 16) = 0u;
  *(_OWORD *)(a5 + 32) = 0u;
  *(_QWORD *)(a5 + 48) = a3;
  *(_QWORD *)(a5 + 56) = a4;
  *(_BYTE *)(a5 + 64) = 0;
  *(_QWORD *)(a5 + 72) = 0;
  *(_BYTE *)(a5 + 80) = 1;
  return result;
}

uint64_t _EXHostViewController.Session.Configuration.sceneID.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t _EXHostViewController.Session.Configuration.sceneID.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*_EXHostViewController.Session.Configuration.sceneID.modify())()
{
  return nullsub_3;
}

double _EXHostViewController.Session.Configuration.initialFrame.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

void _EXHostViewController.Session.Configuration.initialFrame.setter(double a1, double a2, double a3, double a4)
{
  double *v4;

  v4[2] = a1;
  v4[3] = a2;
  v4[4] = a3;
  v4[5] = a4;
}

uint64_t (*_EXHostViewController.Session.Configuration.initialFrame.modify())()
{
  return nullsub_3;
}

uint64_t sub_20AE95C84(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = *a1;
  v3 = a1[1];
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = v3;
  swift_retain();
  result = swift_release();
  *(_QWORD *)(a2 + 48) = sub_20AE8F408;
  *(_QWORD *)(a2 + 56) = v5;
  return result;
}

uint64_t _EXHostViewController.Session.Configuration.onInvalidation.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_retain();
  return v1;
}

uint64_t _EXHostViewController.Session.Configuration.onInvalidation.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_release();
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  return result;
}

uint64_t (*_EXHostViewController.Session.Configuration.onInvalidation.modify())()
{
  return nullsub_3;
}

uint64_t _EXHostViewController.Session.Configuration.retryOnHostingFailure.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 64);
}

uint64_t _EXHostViewController.Session.Configuration.retryOnHostingFailure.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 64) = result;
  return result;
}

uint64_t (*_EXHostViewController.Session.Configuration.retryOnHostingFailure.modify())()
{
  return nullsub_3;
}

uint64_t _EXHostViewController.Session.Configuration._initializationParameters.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t _EXHostViewController.Session.Configuration._initializationParameters.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_unknownObjectRelease();
  *(_QWORD *)(v1 + 72) = a1;
  return result;
}

uint64_t (*_EXHostViewController.Session.Configuration._initializationParameters.modify())()
{
  return nullsub_3;
}

uint64_t _EXHostViewController.Session.Configuration._shouldHostRemoteTextEffectsWindow.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 80);
}

uint64_t _EXHostViewController.Session.Configuration._shouldHostRemoteTextEffectsWindow.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 80) = result;
  return result;
}

uint64_t (*_EXHostViewController.Session.Configuration._shouldHostRemoteTextEffectsWindow.modify())()
{
  return nullsub_3;
}

uint64_t _EXHostViewController.Session.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t _EXHostViewController.Session.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

_QWORD *_EXHostViewController.session.getter()
{
  void *v0;
  _QWORD *result;
  _QWORD *v2;

  result = objc_msgSend(v0, sel_session);
  if (result)
  {
    v2 = result;
    type metadata accessor for _EXHostViewController.Session();
    result = (_QWORD *)swift_allocObject();
    result[2] = v2;
  }
  return result;
}

uint64_t type metadata accessor for _EXHostViewController.Session()
{
  return objc_opt_self();
}

_QWORD *sub_20AE95E84@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *result;
  _QWORD *v4;

  result = objc_msgSend(*a1, sel_session);
  if (result)
  {
    v4 = result;
    type metadata accessor for _EXHostViewController.Session();
    result = (_QWORD *)swift_allocObject();
    result[2] = v4;
  }
  *a2 = result;
  return result;
}

id _EXHostViewController.session.setter(uint64_t a1)
{
  void *v1;

  if (!a1)
    return objc_msgSend(v1, sel_setSession_, 0);
  objc_msgSend(v1, sel_setSession_, *(_QWORD *)(a1 + 16));
  return (id)swift_release();
}

id (*_EXHostViewController.session.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  void *v1;
  _QWORD *v3;
  _QWORD *v4;

  a1[1] = v1;
  v3 = objc_msgSend(v1, sel_session);
  if (v3)
  {
    v4 = v3;
    type metadata accessor for _EXHostViewController.Session();
    v3 = (_QWORD *)swift_allocObject();
    v3[2] = v4;
  }
  *a1 = v3;
  return sub_20AE95F90;
}

id sub_20AE95F90(uint64_t *a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    if (v2)
      v3 = *(_QWORD *)(v2 + 16);
    else
      v3 = 0;
    v4 = (void *)a1[1];
    goto LABEL_8;
  }
  v4 = (void *)a1[1];
  if (v2)
  {
    v3 = *(_QWORD *)(v2 + 16);
LABEL_8:
    objc_msgSend(v4, sel_setSession_, v3);
    return (id)swift_release();
  }
  return objc_msgSend(v4, sel_setSession_, 0);
}

id sub_20AE95FFC@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_configuration);
  *a2 = result;
  return result;
}

id sub_20AE96034(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setConfiguration_, *a1);
}

uint64_t sub_20AE96048@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(a1 + *(int *)(type metadata accessor for _EXHostViewController.Configuration() + 28));
  v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_20AE96084@<X0>(uint64_t a1@<X8>)
{
  return _EXHostViewController._configuration.getter(a1);
}

uint64_t sub_20AE960A8@<X0>(uint64_t a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 56);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = v3;
  *a2 = sub_20AE8F408;
  a2[1] = (uint64_t (*)())v5;
  return swift_retain();
}

id sub_20AE96100(uint64_t a1, id *a2)
{
  uint64_t v2;

  if (*(_QWORD *)a1)
    v2 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  else
    v2 = 0;
  return objc_msgSend(*a2, sel_setSession_, v2);
}

_QWORD *_s13ConfigurationVwCP_0(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_20AE9D0AC();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    *((_BYTE *)a1 + v8) = *((_BYTE *)a2 + v8);
    v9 = a3[7];
    v10 = a3[8];
    v11 = (_QWORD *)((char *)a1 + v9);
    v12 = (_QWORD *)((char *)a2 + v9);
    v13 = v12[1];
    *v11 = *v12;
    v11[1] = v13;
    *(_QWORD *)((char *)a1 + v10) = *(_QWORD *)((char *)a2 + v10);
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
  }
  return a1;
}

uint64_t _s13ConfigurationVwxx_0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_20AE9D0AC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  return swift_unknownObjectRelease();
}

uint64_t _s13ConfigurationVwcp_0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;

  v6 = sub_20AE9D0AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  v8 = a3[7];
  v9 = a3[8];
  v10 = (_QWORD *)(a1 + v8);
  v11 = (_QWORD *)(a2 + v8);
  v12 = v11[1];
  *v10 = *v11;
  v10[1] = v12;
  *(_QWORD *)(a1 + v9) = *(_QWORD *)(a2 + v9);
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  return a1;
}

uint64_t _s13ConfigurationVwca_0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = sub_20AE9D0AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_BYTE *)(a1 + a3[6]) = *(_BYTE *)(a2 + a3[6]);
  v7 = a3[7];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

uint64_t _s13ConfigurationVwtk_0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_20AE9D0AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  return a1;
}

uint64_t _s13ConfigurationVwta_0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = sub_20AE9D0AC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_BYTE *)(a1 + v7) = *(_BYTE *)(a2 + v7);
  v8 = a3[7];
  v9 = (_QWORD *)(a1 + v8);
  v10 = (uint64_t *)(a2 + v8);
  v12 = *v10;
  v11 = v10[1];
  *v9 = v12;
  v9[1] = v11;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  swift_unknownObjectRelease();
  return a1;
}

uint64_t _s13ConfigurationVwet_0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20AE96484(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_20AE9D0AC();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 28) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t _s13ConfigurationVwst_0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20AE96510(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_20AE9D0AC();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 28) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_20AE9658C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_20AE9D0AC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t method lookup function for _EXHostViewController.Session()
{
  return swift_lookUpClassMethod();
}

uint64_t _s7SessionC13ConfigurationVwxx()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t _s7SessionC13ConfigurationVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v5;
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_unknownObjectRetain();
  return a1;
}

uint64_t _s7SessionC13ConfigurationVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  v4 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v4;
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  return a1;
}

__n128 __swift_memcpy81_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 64);
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t _s7SessionC13ConfigurationVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v5;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_release();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_unknownObjectRelease();
  *(_BYTE *)(a1 + 80) = *(_BYTE *)(a2 + 80);
  return a1;
}

uint64_t _s7SessionC13ConfigurationVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 81))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s7SessionC13ConfigurationVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 80) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 81) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 81) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for _EXHostViewController.Session.Configuration()
{
  return &type metadata for _EXHostViewController.Session.Configuration;
}

uint64_t sub_20AE968A8()
{
  swift_release();
  return swift_deallocObject();
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

uint64_t objectdestroy_18Tm()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25462E620);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_20AE96954(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25462E620);
  return sub_20AE95AC0(a1);
}

double AppExtensionSceneConfiguration.init<A>(_:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  _QWORD *v10;
  double result;

  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a3;
  v10[3] = a4;
  v10[4] = a1;
  v10[5] = a2;
  *(_QWORD *)a5 = sub_20AE9706C;
  *(_QWORD *)(a5 + 8) = v10;
  result = 0.0;
  *(_OWORD *)(a5 + 16) = 0u;
  *(_OWORD *)(a5 + 32) = 0u;
  *(_QWORD *)(a5 + 48) = 0;
  return result;
}

uint64_t (*PrimitiveAppExtensionScene.init<A>(id:content:onConnection:)@<X0>(uint64_t (*a1)()@<X0>, uint64_t (*a2)()@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t (*a5)()@<X4>, uint64_t (*a6)()@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t (**a9)()@<X8>))()
{
  uint64_t (*result)();

  result = (uint64_t (*)())swift_allocObject();
  *((_QWORD *)result + 2) = a7;
  *((_QWORD *)result + 3) = a8;
  *((_QWORD *)result + 4) = a3;
  *((_QWORD *)result + 5) = a4;
  *a9 = sub_20AE972F4;
  a9[1] = 0;
  a9[2] = a1;
  a9[3] = a2;
  a9[4] = sub_20AE99B14;
  a9[5] = result;
  a9[6] = a5;
  a9[7] = a6;
  return result;
}

uint64_t sub_20AE96AC0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  PrimitiveAppExtensionScene._makeScene(with:)(a1, a2, a3);
  return swift_bridgeObjectRelease();
}

uint64_t AppExtensionScene._makeScene(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t AssociatedConformanceWitness;
  uint64_t v14;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v11 = (char *)&v14 - v10;
  (*(void (**)(uint64_t, uint64_t))(a4 + 24))(a3, a4);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 32))(a1, a2, AssociatedTypeWitness, AssociatedConformanceWitness);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, AssociatedTypeWitness);
}

Swift::Bool __swiftcall AppExtensionSceneConfiguration.accept(connection:)(NSXPCConnection connection)
{
  uint64_t v1;
  char v2;
  _QWORD v4[3];
  uint64_t v5;

  sub_20AE8C338(v1 + 16, (uint64_t)v4);
  if (v5)
  {
    __swift_project_boxed_opaque_existential_1(v4, v5);
    v2 = sub_20AE9CF80();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v4);
  }
  else
  {
    sub_20AE8C380((uint64_t)v4);
    v2 = 0;
  }
  return v2 & 1;
}

uint64_t AppExtensionSceneConfiguration.init<A, B>(_:configuration:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t (**a8)@<X0>(uint64_t (**a1)()@<X8>)@<X8>)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t (*v19)@<X0>(uint64_t (**)()@<X8>);
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t *boxed_opaque_existential_1;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v25 = a6;
  v15 = sub_20AE9D514();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v24 - v17;
  v19 = (uint64_t (*)@<X0>(uint64_t (**)()@<X8>))swift_allocObject();
  *((_QWORD *)v19 + 2) = a4;
  *((_QWORD *)v19 + 3) = a5;
  *((_QWORD *)v19 + 4) = v25;
  *((_QWORD *)v19 + 5) = a7;
  *((_QWORD *)v19 + 6) = a1;
  *((_QWORD *)v19 + 7) = a2;
  *a8 = sub_20AE97320;
  a8[1] = v19;
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, a3, v15);
  v20 = *(_QWORD *)(a5 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, a5) == 1)
  {
    v21 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
    v21(a3, v15);
    v21((uint64_t)v18, v15);
    v28 = 0;
    v26 = 0u;
    v27 = 0u;
  }
  else
  {
    *((_QWORD *)&v27 + 1) = a5;
    v28 = a7;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v26);
    (*(void (**)(uint64_t *, char *, uint64_t))(v20 + 32))(boxed_opaque_existential_1, v18, a5);
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a3, v15);
  }
  return sub_20AE97330((uint64_t)&v26, (uint64_t)(a8 + 2));
}

uint64_t sub_20AE96E00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X4>, uint64_t (**a4)()@<X8>)
{
  void (*v7)(void);
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v7 = (void (*)(void))MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7();
  return _AnyAppExtensionScene.init<A>(erasing:)(v9, a2, a3, a4);
}

uint64_t _AnyAppExtensionScene.init<A>(erasing:)@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (**a4)()@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unint64_t v11;
  uint64_t v12;
  void (*v13)(unint64_t, char *, uint64_t);
  uint64_t v14;
  uint64_t result;
  uint64_t v16;

  v8 = *(_QWORD *)(a2 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v10, a1, a2);
  v11 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a2;
  *(_QWORD *)(v12 + 24) = a3;
  v13 = *(void (**)(unint64_t, char *, uint64_t))(v8 + 32);
  v13(v12 + v11, v10, a2);
  v13((unint64_t)v10, a1, a2);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a2;
  *(_QWORD *)(v14 + 24) = a3;
  result = ((uint64_t (*)(unint64_t, char *, uint64_t))v13)(v14 + v11, v10, a2);
  *a4 = sub_20AE97DF8;
  a4[1] = (uint64_t (*)())v12;
  a4[2] = sub_20AE97E18;
  a4[3] = (uint64_t (*)())v14;
  return result;
}

void sub_20AE96FA8(_QWORD *a1@<X8>)
{
  *a1 = sub_20AE99AC4;
  a1[1] = 0;
  a1[2] = sub_20AE96ABC;
  a1[3] = 0;
}

uint64_t sub_20AE96FC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t (**a4)()@<X8>)
{
  void (*v7)(void);
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v7 = (void (*)(void))MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7();
  return _AnyAppExtensionScene.init<A>(erasing:)(v9, a2, a3, a4);
}

uint64_t sub_20AE97048()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20AE9706C@<X0>(uint64_t (**a1)()@<X8>)
{
  uint64_t *v1;

  return sub_20AE96FC4(v1[4], v1[2], v1[3], a1);
}

uint64_t sub_20AE97078()
{
  uint64_t v0;
  char v1;
  _QWORD v3[3];
  uint64_t v4;

  sub_20AE8C338(v0 + 16, (uint64_t)v3);
  if (v4)
  {
    __swift_project_boxed_opaque_existential_1(v3, v4);
    v1 = sub_20AE9CF80();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
  }
  else
  {
    sub_20AE8C380((uint64_t)v3);
    v1 = 0;
  }
  return v1 & 1;
}

uint64_t sub_20AE97100()
{
  type metadata accessor for ExtensionPickerView.Model(0);
  swift_allocObject();
  sub_20AE8588C();
  sub_20AE99A38();
  sub_20AE9D160();
  sub_20AE99A80();
  return sub_20AE9D364();
}

uint64_t PrimitiveAppExtensionScene.init<A>(id:sceneDelegate:content:onConnection:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, uint64_t a10, uint64_t a11)
{
  _QWORD *v18;

  v18 = (_QWORD *)swift_allocObject();
  v18[2] = a10;
  v18[3] = a11;
  v18[4] = a5;
  v18[5] = a6;
  swift_bridgeObjectRetain_n();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRelease();
  *a9 = a3;
  a9[1] = a4;
  a9[2] = a1;
  a9[3] = a2;
  a9[4] = sub_20AE97E50;
  a9[5] = v18;
  a9[6] = a7;
  a9[7] = a8;
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_20AE97260(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void (*v5)(void);
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = *(_QWORD *)(a3 - 8);
  v5 = (void (*)(void))MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5();
  v8 = sub_20AE996B0((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, a3);
  return v8;
}

uint64_t sub_20AE972F4()
{
  return 0;
}

uint64_t sub_20AE972FC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20AE97320@<X0>(uint64_t (**a1)()@<X8>)
{
  uint64_t *v1;

  return sub_20AE96E00(v1[6], v1[2], v1[4], a1);
}

uint64_t sub_20AE97330(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25462E630);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void PrimitiveAppExtensionScene.body.getter()
{
  sub_20AE9D574();
  __break(1u);
}

void sub_20AE973C0()
{
  sub_20AE9D574();
  __break(1u);
}

double PrimitiveAppExtensionScene._makeScene(with:)@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  os_log_type_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  double result;
  uint64_t v20;
  os_log_type_t type;
  uint64_t v24;
  uint64_t v25[2];

  v6 = *v3;
  v5 = v3[1];
  v8 = v3[2];
  v7 = v3[3];
  v9 = v3[4];
  v10 = v3[5];
  v11 = v3[7];
  v24 = v3[6];
  v12 = sub_20AE9D4D8();
  sub_20AE8D9E0();
  v13 = sub_20AE9D508();
  if (os_log_type_enabled(v13, v12))
  {
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    swift_retain_n();
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    type = v12;
    v14 = swift_slowAlloc();
    v20 = swift_slowAlloc();
    v25[0] = v20;
    *(_DWORD *)v14 = 136315394;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    v15 = sub_20AE9D3DC();
    sub_20AE98A70(v15, v16, v25);
    sub_20AE9D520();
    swift_release_n();
    swift_release_n();
    swift_bridgeObjectRelease_n();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    swift_bridgeObjectRetain();
    sub_20AE98A70(a1, a2, v25);
    sub_20AE9D520();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_20AE73000, v13, type, "Evaluating %s for requested id %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x20BD345D0](v20, -1, -1);
    MEMORY[0x20BD345D0](v14, -1, -1);

    v17 = v24;
    v18 = a2;
    if (v8 != a1)
      goto LABEL_6;
  }
  else
  {

    v17 = v24;
    v18 = a2;
    if (v8 != a1)
      goto LABEL_6;
  }
  if (v7 == v18)
  {
LABEL_7:
    *a3 = v6;
    a3[1] = v5;
    a3[2] = v8;
    a3[3] = v7;
    a3[4] = v9;
    a3[5] = v10;
    a3[6] = v17;
    a3[7] = v11;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    return result;
  }
LABEL_6:
  if ((sub_20AE9D5BC() & 1) != 0)
    goto LABEL_7;
  result = 0.0;
  *((_OWORD *)a3 + 2) = 0u;
  *((_OWORD *)a3 + 3) = 0u;
  *(_OWORD *)a3 = 0u;
  *((_OWORD *)a3 + 1) = 0u;
  return result;
}

void Never._makeScene(with:)()
{
  sub_20AE9D574();
  __break(1u);
}

void Never.body.getter()
{
  sub_20AE9D574();
  __break(1u);
}

void sub_20AE977B4()
{
  sub_20AE9D574();
  __break(1u);
}

void sub_20AE977FC()
{
  sub_20AE9D574();
  __break(1u);
}

void Array<A>.body.getter()
{
  sub_20AE9D574();
  __break(1u);
}

uint64_t Array<A>._makeScene(with:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v10;
  char v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;
  _QWORD *v26;
  void (*v27)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[8];

  v30 = a1;
  v31 = a2;
  v33 = *(_QWORD *)(a4 - 8);
  v10 = *(_QWORD *)(v33 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v32 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  if (MEMORY[0x20BD33CA0](a3, a4))
  {
    v25 = v10;
    v26 = a6;
    a6 = 0;
    v34 = 0;
    v27 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t, uint64_t, uint64_t))(a5 + 32);
    v28 = a5;
    v29 = a3;
    while (1)
    {
      v11 = sub_20AE9D454();
      sub_20AE9D43C();
      if ((v11 & 1) != 0)
      {
        (*(void (**)(char *, unint64_t, uint64_t))(v33 + 16))(v32, a3+ ((*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80))+ *(_QWORD *)(v33 + 72) * (_QWORD)a6, a4);
        v12 = (char *)a6 + 1;
        if (__OFADD__(a6, 1))
          goto LABEL_12;
      }
      else
      {
        result = sub_20AE9D550();
        if (v25 != 8)
        {
          __break(1u);
          return result;
        }
        v35[0] = result;
        (*(void (**)(char *, _QWORD *, uint64_t))(v33 + 16))(v32, v35, a4);
        swift_unknownObjectRelease();
        v12 = (char *)a6 + 1;
        if (__OFADD__(a6, 1))
        {
LABEL_12:
          __break(1u);
          goto LABEL_13;
        }
      }
      v13 = v32;
      v27(v35, v30, v31, a4, v28);
      sub_20AE990B0(0);
      (*(void (**)(char *, uint64_t))(v33 + 8))(v13, a4);
      v14 = v35[0];
      v34 = v35[1];
      v16 = v35[2];
      v15 = v35[3];
      v17 = v35[4];
      v18 = v35[5];
      v19 = v35[6];
      v20 = v35[7];
      if (v35[0])
        break;
      v21 = v29;
      a6 = (_QWORD *)((char *)a6 + 1);
      v22 = v12 == (char *)MEMORY[0x20BD33CA0](v29, a4);
      a3 = v21;
      if (v22)
      {
        result = swift_bridgeObjectRelease();
        v14 = 0;
LABEL_15:
        a6 = v26;
        v23 = v34;
        goto LABEL_16;
      }
    }
    result = swift_bridgeObjectRelease();
    goto LABEL_15;
  }
LABEL_13:
  result = swift_bridgeObjectRelease();
  v14 = 0;
  v23 = 0;
  v16 = 0;
  v15 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
LABEL_16:
  *a6 = v14;
  a6[1] = v23;
  a6[2] = v16;
  a6[3] = v15;
  a6[4] = v17;
  a6[5] = v18;
  a6[6] = v19;
  a6[7] = v20;
  return result;
}

void sub_20AE97AEC()
{
  sub_20AE9D574();
  __break(1u);
}

uint64_t sub_20AE97B34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t *v5;

  return Array<A>._makeScene(with:)(a1, a2, *v5, *(_QWORD *)(a3 + 16), *(_QWORD *)(a4 - 8), a5);
}

unint64_t PrimitiveAppExtensionScene.debugDescription.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 32);
  v1 = *(_QWORD *)(v0 + 40);
  sub_20AE9D538();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_20AE9D418();
  swift_bridgeObjectRelease();
  sub_20AE9D418();
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25462E640);
  sub_20AE9D3DC();
  sub_20AE9D418();
  swift_bridgeObjectRelease();
  return 0xD00000000000001BLL;
}

uint64_t sub_20AE97C54@<X0>(void (**a1)()@<X8>)
{
  void (*v2)();
  void (*v3)();

  v2 = (void (*)())swift_allocObject();
  *((_QWORD *)v2 + 2) = sub_20AE972F4;
  *((_QWORD *)v2 + 3) = 0;
  *((_QWORD *)v2 + 4) = 0x746C7561666564;
  *((_QWORD *)v2 + 5) = 0xE700000000000000;
  *((_QWORD *)v2 + 6) = sub_20AE97100;
  *((_QWORD *)v2 + 7) = 0;
  *((_QWORD *)v2 + 8) = sub_20AE83C1C;
  *((_QWORD *)v2 + 9) = 0;
  v3 = (void (*)())swift_allocObject();
  *((_QWORD *)v3 + 2) = sub_20AE972F4;
  *((_QWORD *)v3 + 3) = 0;
  *((_QWORD *)v3 + 4) = 0x746C7561666564;
  *((_QWORD *)v3 + 5) = 0xE700000000000000;
  *((_QWORD *)v3 + 6) = sub_20AE97100;
  *((_QWORD *)v3 + 7) = 0;
  *((_QWORD *)v3 + 8) = sub_20AE83C1C;
  *((_QWORD *)v3 + 9) = 0;
  *a1 = sub_20AE973C0;
  a1[1] = v2;
  a1[2] = (void (*)())sub_20AE99B0C;
  a1[3] = v3;
  return swift_bridgeObjectRetain();
}

uint64_t sub_20AE97D1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  char *v7;
  uint64_t AssociatedConformanceWitness;
  uint64_t v10;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v7 = (char *)&v10 - v6;
  (*(void (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  return _AnyAppExtensionScene.init<A>(erasing:)(v7, AssociatedTypeWitness, AssociatedConformanceWitness);
}

uint64_t sub_20AE97DF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  return sub_20AE97D1C(v0 + ((v2 + 32) & ~v2), v1, *(_QWORD *)(v0 + 24));
}

uint64_t sub_20AE97E18()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 24) + 32))();
}

uint64_t sub_20AE97E50()
{
  uint64_t *v0;

  return sub_20AE97260(v0[4], v0[5], v0[2]);
}

uint64_t _AnyAppExtensionScene.body.getter()
{
  uint64_t (**v0)(void);

  return (*v0)();
}

uint64_t _AnyAppExtensionScene._makeScene(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_20AE97EAC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_20AE97ECC(void *a1)
{
  uint64_t v1;
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  __int128 v8;
  void (*v9)(_QWORD *__return_ptr, _QWORD, _QWORD);
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t (*v17)(void);
  uint64_t v18;
  void (*v19)(_QWORD *__return_ptr, _QWORD, _QWORD);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  os_log_type_t v25;
  void (*v26)(_QWORD *__return_ptr, _QWORD, _QWORD);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  os_log_type_t v33;
  NSObject *v34;
  uint8_t *v35;
  uint64_t v36;
  char *v37;
  uint64_t (*v38)();
  uint64_t (**v39)();
  char *v40;
  uint64_t result;
  id v42;
  id v43;
  uint64_t v44;
  void (*v45)(_QWORD *__return_ptr, _QWORD, _QWORD);
  uint64_t v46;
  unint64_t v47;
  void *v48;
  NSObject *log;
  uint64_t v50;
  objc_class *v51;
  objc_super v52;
  uint64_t v53;
  __int128 v54;
  void (*v55)(_QWORD *__return_ptr, _QWORD, _QWORD);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v3 = objc_msgSend(a1, sel_role);
  v4 = sub_20AE9D3D0();
  v6 = v5;

  v7 = objc_msgSend(a1, sel_parameters);
  (*(void (**)(__int128 *__return_ptr))(v1 + OBJC_IVAR____TtC12ExtensionKit13_SceneFactory_sceneConfiguration))(&v54);
  v8 = v54;
  v9 = v55;
  v10 = v56;
  LOBYTE(v3) = sub_20AE9D4D8();
  sub_20AE8D9E0();
  v11 = sub_20AE9D508();
  v12 = v3;
  v50 = v4;
  v48 = v7;
  if (os_log_type_enabled(v11, (os_log_type_t)v3))
  {
    swift_retain_n();
    swift_retain_n();
    swift_bridgeObjectRetain_n();
    v13 = swift_slowAlloc();
    v14 = swift_slowAlloc();
    v53 = v14;
    *(_QWORD *)&v54 = v8;
    *(_DWORD *)v13 = 136315394;
    *((_QWORD *)&v54 + 1) = *((_QWORD *)&v8 + 1);
    v55 = v9;
    v56 = v10;
    swift_retain();
    swift_retain();
    v15 = sub_20AE9D3DC();
    *(_QWORD *)&v54 = sub_20AE98A70(v15, v16, &v53);
    sub_20AE9D520();
    swift_release_n();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v54 = sub_20AE98A70(v4, v6, &v53);
    sub_20AE9D520();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_20AE73000, v11, v12, "Root scene %s for requested role id %s", (uint8_t *)v13, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x20BD345D0](v14, -1, -1);
    MEMORY[0x20BD345D0](v13, -1, -1);
  }

  v9(&v54, v4, v6);
  v17 = (uint64_t (*)(void))v54;
  if (!(_QWORD)v54)
  {
    v33 = sub_20AE9D4E4();
    v34 = sub_20AE9D508();
    if (os_log_type_enabled(v34, v33))
    {
      swift_bridgeObjectRetain();
      v35 = (uint8_t *)swift_slowAlloc();
      v36 = swift_slowAlloc();
      *(_QWORD *)&v54 = v36;
      *(_DWORD *)v35 = 136315138;
      swift_bridgeObjectRetain();
      v53 = sub_20AE98A70(v50, v6, (uint64_t *)&v54);
      sub_20AE9D520();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_20AE73000, v34, v33, "No configuration found for requested role id %s", v35, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x20BD345D0](v36, -1, -1);
      MEMORY[0x20BD345D0](v35, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease();
    }

    v42 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for _SceneFactory._Scene()), sel_init);
    swift_release();
    swift_release();
    return (uint64_t)v42;
  }
  v47 = v6;
  v18 = *((_QWORD *)&v54 + 1);
  v19 = v55;
  v20 = v56;
  v21 = v57;
  v23 = v58;
  v22 = v59;
  v24 = v60;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  v25 = sub_20AE9D4D8();
  log = sub_20AE9D508();
  v45 = v19;
  v46 = v20;
  if (os_log_type_enabled(log, v25))
  {
    v26 = v19;
    sub_20AE998D8((uint64_t)v17);
    swift_bridgeObjectRetain();
    sub_20AE998D8((uint64_t)v17);
    v27 = v24;
    v28 = swift_slowAlloc();
    v44 = swift_slowAlloc();
    v53 = v44;
    *(_QWORD *)&v54 = v17;
    *(_DWORD *)v28 = 136315394;
    *((_QWORD *)&v54 + 1) = v18;
    v55 = v26;
    v56 = v20;
    v57 = v21;
    v58 = v23;
    v59 = v22;
    v60 = v27;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    v29 = sub_20AE9D3DC();
    *(_QWORD *)&v54 = sub_20AE98A70(v29, v30, &v53);
    sub_20AE9D520();
    swift_bridgeObjectRelease();
    sub_20AE990B0((uint64_t)v17);
    v31 = v23;
    v32 = v27;
    sub_20AE990B0((uint64_t)v17);
    *(_WORD *)(v28 + 12) = 2080;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v54 = sub_20AE98A70(v50, v47, &v53);
    sub_20AE9D520();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_20AE73000, log, v25, "Using %s for requested role id %s", (uint8_t *)v28, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x20BD345D0](v44, -1, -1);
    MEMORY[0x20BD345D0](v28, -1, -1);
  }
  else
  {
    v31 = v23;
    v32 = v24;
    swift_bridgeObjectRelease();
  }

  if (!v17())
  {
    *(_QWORD *)&v54 = v17;
    *((_QWORD *)&v54 + 1) = v18;
    v55 = v45;
    v56 = v46;
    v57 = v21;
    v58 = v31;
    v59 = v22;
    v60 = v32;
    v43 = objc_allocWithZone((Class)type metadata accessor for _SceneFactory._Scene());
    sub_20AE998D8((uint64_t)v17);
    v42 = sub_20AE9972C(&v54);
    swift_release();
    swift_release();

    sub_20AE990B0((uint64_t)v17);
    sub_20AE990B0((uint64_t)v17);
    return (uint64_t)v42;
  }
  swift_unknownObjectRelease();
  v51 = (objc_class *)type metadata accessor for _SceneFactory._ExtensionUIScene();
  v37 = (char *)objc_allocWithZone(v51);
  v38 = (uint64_t (*)())swift_allocObject();
  *((_QWORD *)v38 + 2) = v17;
  *((_QWORD *)v38 + 3) = v18;
  *((_QWORD *)v38 + 4) = v45;
  *((_QWORD *)v38 + 5) = v46;
  *((_QWORD *)v38 + 6) = v21;
  *((_QWORD *)v38 + 7) = v31;
  *((_QWORD *)v38 + 8) = v22;
  *((_QWORD *)v38 + 9) = v32;
  v39 = (uint64_t (**)())&v37[OBJC_IVAR____TtCC12ExtensionKit13_SceneFactory17_ExtensionUIScene_connectionHandler];
  *v39 = sub_20AE9992C;
  v39[1] = v38;
  sub_20AE998D8((uint64_t)v17);
  v40 = v37;
  result = v17();
  if (result)
  {
    *(_QWORD *)&v40[OBJC_IVAR____TtCC12ExtensionKit13_SceneFactory17_ExtensionUIScene__sceneDelegate] = result;

    v52.receiver = v40;
    v52.super_class = v51;
    v42 = objc_msgSendSuper2(&v52, sel_init);
    swift_release();
    swift_release();
    sub_20AE990B0((uint64_t)v17);
    sub_20AE990B0((uint64_t)v17);

    return (uint64_t)v42;
  }
  __break(1u);
  return result;
}

id sub_20AE98838()
{
  return sub_20AE989C0(type metadata accessor for _SceneFactory._Scene);
}

uint64_t sub_20AE988BC(char *a1, uint64_t a2, void *a3, _QWORD *a4)
{
  uint64_t (*v5)(id);
  id v6;
  char *v7;
  char v8;

  v5 = *(uint64_t (**)(id))&a1[*a4];
  v6 = a3;
  v7 = a1;
  v8 = v5(v6);

  return v8 & 1;
}

id sub_20AE98940()
{
  return sub_20AE989C0(type metadata accessor for _SceneFactory._ExtensionUIScene);
}

id sub_20AE989B4()
{
  return sub_20AE989C0(type metadata accessor for _SceneFactory);
}

id sub_20AE989C0(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_20AE98A00(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_20AE98A70(v6, v7, a3);
  v8 = *a1 + 8;
  sub_20AE9D520();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_20AE98A70(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_20AE98B40(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_20AE999FC((uint64_t)v12, *a3);
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
      sub_20AE999FC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_20AE98B40(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_20AE9D52C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_20AE98CF8(a5, a6);
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
  v8 = sub_20AE9D55C();
  if (!v8)
  {
    sub_20AE9D568();
    __break(1u);
LABEL_17:
    result = sub_20AE9D598();
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

uint64_t sub_20AE98CF8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_20AE98D8C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_20AE98F64(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_20AE98F64(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_20AE98D8C(uint64_t a1, unint64_t a2)
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
      v3 = sub_20AE98F00(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_20AE9D544();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_20AE9D568();
      __break(1u);
LABEL_10:
      v2 = sub_20AE9D424();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_20AE9D598();
    __break(1u);
LABEL_14:
    result = sub_20AE9D568();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_20AE98F00(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25462E6A0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_20AE98F64(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25462E6A0);
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
  result = sub_20AE9D598();
  __break(1u);
  return result;
}

uint64_t sub_20AE990B0(uint64_t result)
{
  if (result)
  {
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_20AE99100()
{
  swift_release();
  return swift_deallocObject();
}

_UNKNOWN **sub_20AE99124()
{
  return &protocol witness table for Never;
}

uint64_t sub_20AE99130()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for AppExtensionSceneConfiguration(uint64_t a1)
{
  uint64_t result;

  result = swift_release();
  if (*(_QWORD *)(a1 + 40))
    return __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  return result;
}

uint64_t initializeWithCopy for AppExtensionSceneConfiguration(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v4 = a2[1];
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = a2 + 2;
  v6 = a2[5];
  swift_retain();
  if (v6)
  {
    v7 = a2[6];
    *(_QWORD *)(a1 + 40) = v6;
    *(_QWORD *)(a1 + 48) = v7;
    (**(void (***)(uint64_t, _QWORD *, uint64_t))(v6 - 8))(a1 + 16, v5, v6);
  }
  else
  {
    v8 = *((_OWORD *)v5 + 1);
    *(_OWORD *)(a1 + 16) = *(_OWORD *)v5;
    *(_OWORD *)(a1 + 32) = v8;
    *(_QWORD *)(a1 + 48) = v5[4];
  }
  return a1;
}

uint64_t assignWithCopy for AppExtensionSceneConfiguration(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_retain();
  swift_release();
  v5 = *(_QWORD *)(a2 + 40);
  if (!*(_QWORD *)(a1 + 40))
  {
    if (v5)
    {
      *(_QWORD *)(a1 + 40) = v5;
      *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
      (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 16, a2 + 16);
      return a1;
    }
LABEL_7:
    v6 = *(_OWORD *)(a2 + 16);
    v7 = *(_OWORD *)(a2 + 32);
    *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
    *(_OWORD *)(a1 + 16) = v6;
    *(_OWORD *)(a1 + 32) = v7;
    return a1;
  }
  if (!v5)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 16);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 16), (uint64_t *)(a2 + 16));
  return a1;
}

__n128 __swift_memcpy56_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for AppExtensionSceneConfiguration(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  if (*(_QWORD *)(a1 + 40))
    __swift_destroy_boxed_opaque_existential_1(a1 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for AppExtensionSceneConfiguration(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 56))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AppExtensionSceneConfiguration(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 56) = 1;
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
    *(_BYTE *)(result + 56) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AppExtensionSceneConfiguration()
{
  return &type metadata for AppExtensionSceneConfiguration;
}

uint64_t dispatch thunk of AppExtensionScene.body.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of AppExtensionScene._makeScene(with:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t destroy for PrimitiveAppExtensionScene()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for PrimitiveAppExtensionScene(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v4 = *(_QWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = v4;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for PrimitiveAppExtensionScene(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_retain();
  swift_release();
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for PrimitiveAppExtensionScene(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  v4 = *(_QWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = v4;
  swift_release();
  return a1;
}

ValueMetadata *type metadata accessor for PrimitiveAppExtensionScene()
{
  return &type metadata for PrimitiveAppExtensionScene;
}

ValueMetadata *type metadata accessor for AppExtensionSceneBuilder()
{
  return &type metadata for AppExtensionSceneBuilder;
}

ValueMetadata *type metadata accessor for _AnyAppExtensionScene()
{
  return &type metadata for _AnyAppExtensionScene;
}

uint64_t type metadata accessor for _SceneFactory()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for _SceneFactory._Scene()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for _SceneFactory._ExtensionUIScene()
{
  return objc_opt_self();
}

unint64_t sub_20AE9961C()
{
  unint64_t result;

  result = qword_25462E690;
  if (!qword_25462E690)
  {
    result = MEMORY[0x20BD34540](&protocol conformance descriptor for _AnyAppExtensionScene, &type metadata for _AnyAppExtensionScene);
    atomic_store(result, (unint64_t *)&qword_25462E690);
  }
  return result;
}

double sub_20AE99660@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  return PrimitiveAppExtensionScene._makeScene(with:)(a1, a2, a3);
}

uint64_t sub_20AE996B0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  return sub_20AE9D364();
}

id sub_20AE9972C(_OWORD *a1)
{
  char *v1;
  char *v2;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  uint64_t (*v7)();
  __int128 v8;
  __int128 v9;
  uint64_t (**v10)();
  uint64_t (*v11)(uint64_t);
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id result;
  void *v18;
  id v19;
  void *v20;
  objc_super v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  _OWORD v25[2];
  __int128 v26;
  __int128 v27;

  v2 = v1;
  v4 = a1[1];
  v25[0] = *a1;
  v25[1] = v4;
  v5 = a1[3];
  v26 = a1[2];
  v27 = v5;
  v6 = OBJC_IVAR____TtCC12ExtensionKit13_SceneFactory6_Scene_viewController;
  *(_QWORD *)&v2[OBJC_IVAR____TtCC12ExtensionKit13_SceneFactory6_Scene_viewController] = 0;
  v7 = (uint64_t (*)())swift_allocObject();
  v8 = a1[1];
  *((_OWORD *)v7 + 1) = *a1;
  *((_OWORD *)v7 + 2) = v8;
  v9 = a1[3];
  *((_OWORD *)v7 + 3) = a1[2];
  *((_OWORD *)v7 + 4) = v9;
  v10 = (uint64_t (**)())&v2[OBJC_IVAR____TtCC12ExtensionKit13_SceneFactory6_Scene_connectionHandler];
  *v10 = sub_20AE99B18;
  v10[1] = v7;
  v11 = (uint64_t (*)(uint64_t))v26;
  v12 = v2;
  v13 = sub_20AE99954((uint64_t)v25);
  v14 = v11(v13);
  sub_20AE999A8((uint64_t)v25);
  *(_QWORD *)&v12[OBJC_IVAR____TtCC12ExtensionKit13_SceneFactory6_Scene_innerView] = v14;
  swift_retain();
  v22 = v14;
  v23 = sub_20AE9D340();
  v24 = sub_20AE9D2A4();
  v15 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_25462E698));
  swift_retain();
  swift_retain();
  v16 = (void *)sub_20AE9D214();
  result = objc_msgSend(v16, sel_view);
  if (result)
  {
    v18 = result;
    v19 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    objc_msgSend(v18, sel_setBackgroundColor_, v19);

    swift_release();
    swift_release();
    v20 = *(void **)&v2[v6];
    *(_QWORD *)&v2[v6] = v16;

    v21.receiver = v12;
    v21.super_class = (Class)type metadata accessor for _SceneFactory._Scene();
    return objc_msgSendSuper2(&v21, sel_init);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20AE998D8(uint64_t result)
{
  if (result)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_20AE9992C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 64))() & 1;
}

uint64_t sub_20AE99954(uint64_t a1)
{
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_20AE999A8(uint64_t a1)
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return a1;
}

uint64_t sub_20AE999FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_20AE99A38()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25462E6A8;
  if (!qword_25462E6A8)
  {
    v1 = type metadata accessor for ExtensionPickerView.Model(255);
    result = MEMORY[0x20BD34540]("-CTApQ", v1);
    atomic_store(result, (unint64_t *)&qword_25462E6A8);
  }
  return result;
}

unint64_t sub_20AE99A80()
{
  unint64_t result;

  result = qword_25462E6B0;
  if (!qword_25462E6B0)
  {
    result = MEMORY[0x20BD34540](&unk_20AE9FD38, &type metadata for ExtensionPickerView);
    atomic_store(result, (unint64_t *)&qword_25462E6B0);
  }
  return result;
}

uint64_t objectdestroy_25Tm()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

double sub_20AE99B0C@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  return sub_20AE99660(a1, a2, a3);
}

uint64_t __getAPBaseExtensionShieldViewClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[_EXUISceneSession initWithExtension:].cold.1(v0);
}

void _EXExtensionPingLaunchdAfterEvent_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_7(&dword_20AE73000, v0, v1, "Pinging launchd", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

uint64_t sub_20AE9CEC0()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_20AE9CECC()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_20AE9CED8()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_20AE9CEE4()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_20AE9CEF0()
{
  return MEMORY[0x24BDCD508]();
}

uint64_t sub_20AE9CEFC()
{
  return MEMORY[0x24BDCD520]();
}

uint64_t sub_20AE9CF08()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_20AE9CF14()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_20AE9CF20()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_20AE9CF2C()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_20AE9CF38()
{
  return MEMORY[0x24BDCDCF8]();
}

uint64_t sub_20AE9CF44()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_20AE9CF50()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_20AE9CF5C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_20AE9CF68()
{
  return MEMORY[0x24BDC76E8]();
}

uint64_t sub_20AE9CF74()
{
  return MEMORY[0x24BDC76F0]();
}

uint64_t sub_20AE9CF80()
{
  return MEMORY[0x24BDC7700]();
}

uint64_t sub_20AE9CF8C()
{
  return MEMORY[0x24BDC77A8]();
}

uint64_t sub_20AE9CF98()
{
  return MEMORY[0x24BDC77B0]();
}

uint64_t sub_20AE9CFA4()
{
  return MEMORY[0x24BDC77B8]();
}

uint64_t sub_20AE9CFB0()
{
  return MEMORY[0x24BDC77D0]();
}

uint64_t sub_20AE9CFBC()
{
  return MEMORY[0x24BDC77D8]();
}

uint64_t sub_20AE9CFC8()
{
  return MEMORY[0x24BDC77E8]();
}

uint64_t sub_20AE9CFD4()
{
  return MEMORY[0x24BDC7808]();
}

uint64_t sub_20AE9CFE0()
{
  return MEMORY[0x24BDC7818]();
}

uint64_t sub_20AE9CFEC()
{
  return MEMORY[0x24BDC7820]();
}

uint64_t sub_20AE9CFF8()
{
  return MEMORY[0x24BDC7840]();
}

uint64_t sub_20AE9D004()
{
  return MEMORY[0x24BDC7870]();
}

uint64_t sub_20AE9D010()
{
  return MEMORY[0x24BDC7880]();
}

uint64_t sub_20AE9D01C()
{
  return MEMORY[0x24BDC7898]();
}

uint64_t sub_20AE9D028()
{
  return MEMORY[0x24BDC78A0]();
}

uint64_t sub_20AE9D034()
{
  return MEMORY[0x24BDC78A8]();
}

uint64_t sub_20AE9D040()
{
  return MEMORY[0x24BDC78C8]();
}

uint64_t sub_20AE9D04C()
{
  return MEMORY[0x24BDC78D8]();
}

uint64_t sub_20AE9D058()
{
  return MEMORY[0x24BDC78E8]();
}

uint64_t sub_20AE9D064()
{
  return MEMORY[0x24BDC78F0]();
}

uint64_t sub_20AE9D070()
{
  return MEMORY[0x24BDC78F8]();
}

uint64_t sub_20AE9D07C()
{
  return MEMORY[0x24BDC7900]();
}

uint64_t sub_20AE9D088()
{
  return MEMORY[0x24BDC7908]();
}

uint64_t sub_20AE9D094()
{
  return MEMORY[0x24BDC7910]();
}

uint64_t sub_20AE9D0A0()
{
  return MEMORY[0x24BDC7918]();
}

uint64_t sub_20AE9D0AC()
{
  return MEMORY[0x24BDC7920]();
}

uint64_t sub_20AE9D0B8()
{
  return MEMORY[0x24BDC7950]();
}

uint64_t sub_20AE9D0C4()
{
  return MEMORY[0x24BDC7958]();
}

uint64_t sub_20AE9D0D0()
{
  return MEMORY[0x24BDC7968]();
}

uint64_t sub_20AE9D0DC()
{
  return MEMORY[0x24BDC7978]();
}

uint64_t sub_20AE9D0E8()
{
  return MEMORY[0x24BDC7980]();
}

uint64_t sub_20AE9D0F4()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_20AE9D100()
{
  return MEMORY[0x24BDC7988]();
}

uint64_t sub_20AE9D10C()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_20AE9D118()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_20AE9D124()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_20AE9D130()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_20AE9D13C()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_20AE9D148()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_20AE9D154()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_20AE9D160()
{
  return MEMORY[0x24BDEC990]();
}

uint64_t sub_20AE9D16C()
{
  return MEMORY[0x24BDEC9A8]();
}

uint64_t sub_20AE9D178()
{
  return MEMORY[0x24BDEC9B8]();
}

uint64_t sub_20AE9D184()
{
  return MEMORY[0x24BDED2D8]();
}

uint64_t sub_20AE9D190()
{
  return MEMORY[0x24BDEE6C0]();
}

uint64_t sub_20AE9D19C()
{
  return MEMORY[0x24BDEE6D0]();
}

uint64_t sub_20AE9D1A8()
{
  return MEMORY[0x24BDEE738]();
}

uint64_t sub_20AE9D1B4()
{
  return MEMORY[0x24BDEEA10]();
}

uint64_t sub_20AE9D1C0()
{
  return MEMORY[0x24BDEEA20]();
}

uint64_t sub_20AE9D1CC()
{
  return MEMORY[0x24BDEEA38]();
}

uint64_t sub_20AE9D1D8()
{
  return MEMORY[0x24BDEEA48]();
}

uint64_t sub_20AE9D1E4()
{
  return MEMORY[0x24BDEEA58]();
}

uint64_t sub_20AE9D1F0()
{
  return MEMORY[0x24BDEEA68]();
}

uint64_t sub_20AE9D1FC()
{
  return MEMORY[0x24BDEEF68]();
}

uint64_t sub_20AE9D208()
{
  return MEMORY[0x24BDEF1C0]();
}

uint64_t sub_20AE9D214()
{
  return MEMORY[0x24BDEF1C8]();
}

uint64_t sub_20AE9D220()
{
  return MEMORY[0x24BDEF200]();
}

uint64_t sub_20AE9D22C()
{
  return MEMORY[0x24BDF0740]();
}

uint64_t sub_20AE9D238()
{
  return MEMORY[0x24BDF0EB8]();
}

uint64_t sub_20AE9D244()
{
  return MEMORY[0x24BDF0EC8]();
}

uint64_t sub_20AE9D250()
{
  return MEMORY[0x24BDF0ED8]();
}

uint64_t sub_20AE9D25C()
{
  return MEMORY[0x24BDF0EE8]();
}

uint64_t sub_20AE9D268()
{
  return MEMORY[0x24BDF0EF8]();
}

uint64_t sub_20AE9D274()
{
  return MEMORY[0x24BDF0F08]();
}

uint64_t sub_20AE9D280()
{
  return MEMORY[0x24BDF0F20]();
}

uint64_t sub_20AE9D28C()
{
  return MEMORY[0x24BDF0F30]();
}

uint64_t sub_20AE9D298()
{
  return MEMORY[0x24BDF1398]();
}

uint64_t sub_20AE9D2A4()
{
  return MEMORY[0x24BDF14B0]();
}

uint64_t sub_20AE9D2B0()
{
  return MEMORY[0x24BDF14B8]();
}

uint64_t sub_20AE9D2BC()
{
  return MEMORY[0x24BDF14D8]();
}

uint64_t sub_20AE9D2C8()
{
  return MEMORY[0x24BDF14F0]();
}

uint64_t sub_20AE9D2D4()
{
  return MEMORY[0x24BDF1500]();
}

uint64_t sub_20AE9D2E0()
{
  return MEMORY[0x24BDF1968]();
}

uint64_t sub_20AE9D2EC()
{
  return MEMORY[0x24BDF1FC8]();
}

uint64_t sub_20AE9D2F8()
{
  return MEMORY[0x24BDF1FE8]();
}

uint64_t sub_20AE9D304()
{
  return MEMORY[0x24BDF2090]();
}

uint64_t sub_20AE9D310()
{
  return MEMORY[0x24BDF2098]();
}

uint64_t sub_20AE9D31C()
{
  return MEMORY[0x24BDF20E0]();
}

uint64_t sub_20AE9D328()
{
  return MEMORY[0x24BDF2458]();
}

uint64_t sub_20AE9D334()
{
  return MEMORY[0x24BDF26A0]();
}

uint64_t sub_20AE9D340()
{
  return MEMORY[0x24BDF3D08]();
}

uint64_t sub_20AE9D34C()
{
  return MEMORY[0x24BDF4120]();
}

uint64_t sub_20AE9D358()
{
  return MEMORY[0x24BDF4690]();
}

uint64_t sub_20AE9D364()
{
  return MEMORY[0x24BDF4798]();
}

uint64_t sub_20AE9D370()
{
  return MEMORY[0x24BDF4998]();
}

uint64_t sub_20AE9D37C()
{
  return MEMORY[0x24BDF4AA8]();
}

uint64_t sub_20AE9D388()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_20AE9D394()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_20AE9D3A0()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_20AE9D3AC()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_20AE9D3B8()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_20AE9D3C4()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_20AE9D3D0()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_20AE9D3DC()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_20AE9D3E8()
{
  return MEMORY[0x24BEE0A58]();
}

uint64_t sub_20AE9D3F4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_20AE9D400()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_20AE9D40C()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_20AE9D418()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_20AE9D424()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_20AE9D430()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_20AE9D43C()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_20AE9D448()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_20AE9D454()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_20AE9D460()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_20AE9D46C()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_20AE9D478()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_20AE9D484()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_20AE9D490()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_20AE9D49C()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_20AE9D4A8()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_20AE9D4B4()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_20AE9D4C0()
{
  return MEMORY[0x24BDC7998]();
}

uint64_t sub_20AE9D4CC()
{
  return MEMORY[0x24BDCFE18]();
}

uint64_t sub_20AE9D4D8()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_20AE9D4E4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_20AE9D4F0()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_20AE9D4FC()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_20AE9D508()
{
  return MEMORY[0x24BDC79A0]();
}

uint64_t sub_20AE9D514()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_20AE9D520()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_20AE9D52C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_20AE9D538()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_20AE9D544()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_20AE9D550()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_20AE9D55C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_20AE9D568()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_20AE9D574()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_20AE9D580()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_20AE9D58C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_20AE9D598()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_20AE9D5A4()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_20AE9D5B0()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_20AE9D5BC()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_20AE9D5C8()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_20AE9D5D4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_20AE9D5E0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_20AE9D5EC()
{
  return MEMORY[0x24BEE4328]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C0](rl, observer, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x24BDBC320](allocator, activities, repeats, order, callout, context);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x24BDD1250](proto);
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

uint64_t _EXDefaultLog()
{
  return MEMORY[0x24BDC7A28]();
}

uint64_t _EXSignpostLog()
{
  return MEMORY[0x24BDC7A38]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

uint64_t abort_with_reason()
{
  return MEMORY[0x24BDAD020]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x24BEDCE60](cls, protocol);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
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

uint64_t memorystatus_control()
{
  return MEMORY[0x24BDAEEA0]();
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

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyCppObjectAtomic(void *dest, const void *src, void (__cdecl *copyHelper)(void *, const void *))
{
  MEMORY[0x24BEDD010](dest, src, copyHelper);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
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

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A0](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A8](state);
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

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x24BEE4C68]();
}

uint64_t swift_dynamicCastObjCProtocolUnconditional()
{
  return MEMORY[0x24BEE4C78]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x24BEE4C88]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getFunctionTypeMetadata0()
{
  return MEMORY[0x24BEE4D58]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

