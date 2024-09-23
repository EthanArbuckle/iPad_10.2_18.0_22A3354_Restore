void sub_2362EE3E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void __enablementControllerQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.AppProtectionUI.APEnablementController", v2);
  v1 = (void *)enablementControllerQueue_result;
  enablementControllerQueue_result = (uint64_t)v0;

}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_4(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_5(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

id APUIDefaultFrameworkLog()
{
  if (APUIDefaultFrameworkLog_onceToken != -1)
    dispatch_once(&APUIDefaultFrameworkLog_onceToken, &__block_literal_global_0);
  return (id)APUIDefaultFrameworkLog_log;
}

id APEducationIconForEnableableFeature(uint64_t a1)
{
  __CFString *v1;
  objc_class *v2;
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v1 = CFSTR("com.apple.appprotection.lock.education");
  if (a1 == 2)
    v1 = CFSTR("com.apple.appprotection.hide.education");
  v2 = (objc_class *)MEMORY[0x24BE51A90];
  v3 = v1;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithType:", v3);

  objc_msgSend(MEMORY[0x24BE51AB0], "imageDescriptorNamed:", *MEMORY[0x24BE51AC8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageForDescriptor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "placeholder"))
  {
    objc_msgSend(v4, "prepareImageForDescriptor:", v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  v8 = (void *)MEMORY[0x24BEBD640];
  v9 = objc_msgSend(v6, "CGImage");
  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "scale");
  objc_msgSend(v8, "imageWithCGImage:scale:orientation:", v9, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

uint64_t applicationRequiresEmergencyCallButton(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;

  v1 = a1;
  v2 = objc_alloc(MEMORY[0x24BDC1540]);
  objc_msgSend(v1, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 1;
  v5 = (void *)objc_msgSend(v2, "initWithBundleIdentifier:allowPlaceholder:error:", v3, 1, 0);

  objc_msgSend(v5, "entitlements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:ofClass:", CFSTR("com.apple.private.appprotection.needs_emergency_dialer"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if ((v8 & 1) == 0)
  {
    objc_msgSend(v1, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.mobilephone"));

  }
  return v4;
}

void sub_2362F2FB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __performTransition_block_invoke(uint64_t a1)
{
  uint64_t v2;
  _BOOL8 v3;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = v2 != 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setHidden:", v2 == 1);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setHidden:", v3);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id APFrameworkBundle()
{
  if (APFrameworkBundle_onceToken != -1)
    dispatch_once(&APFrameworkBundle_onceToken, &__block_literal_global_3);
  return (id)APFrameworkBundle_result;
}

id APUIFrameworkBundle()
{
  if (APUIFrameworkBundle_onceToken != -1)
    dispatch_once(&APUIFrameworkBundle_onceToken, &__block_literal_global_3);
  return (id)APUIFrameworkBundle_result;
}

id APGetPreferredAuthenticationMechanismLocalizedDescription()
{
  uint64_t v0;

  v0 = APGetPreferredAuthenticationMechanism();
  return APGetAuthenticationMechanismLocalizedDescription(v0);
}

id APGetAuthenticationMechanismLocalizedDescription(uint64_t a1)
{
  const __CFString *v1;
  void *v2;
  void *v3;

  if ((unint64_t)(a1 - 1) > 2)
    v1 = CFSTR("UNKNOWN");
  else
    v1 = off_2507A00C8[a1 - 1];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_2507A0B80, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t APGetPreferredAuthenticationMechanism()
{
  void *v0;
  uint64_t v1;

  MobileGestalt_get_current_device();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((MobileGestalt_get_pearlIDCapability() & 1) != 0)
  {
    v1 = 1;
  }
  else
  {
    if (!MobileGestalt_get_touchIDCapability())
    {
      v1 = 3;
      goto LABEL_9;
    }
    v1 = 2;
  }
  if (!isBioAuthUsable())
    v1 = 3;
LABEL_9:

  return v1;
}

__CFString *APGetPreferredAuthenticationMechanismLocKey()
{
  return off_2507A00C8[APGetPreferredAuthenticationMechanism() - 1];
}

uint64_t isBioAuthUsable()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(MEMORY[0x24BDDA940], "currentUser");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "state");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "biometry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isUsable");

  return v3;
}

id APLocStr(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  APFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_2507A0B80, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id APUILocStr(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  APUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_2507A0B80, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id APGetDescriptionFor(unint64_t a1)
{
  const __CFString *v1;
  void *v2;
  void *v3;

  if (a1 > 2)
    v1 = CFSTR("NOT A VALID STRING TYPE");
  else
    v1 = off_2507A00E0[a1];
  APUIFrameworkBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_2507A0B80, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id APUIImageIOQueue()
{
  if (APUIImageIOQueue_onceToken != -1)
    dispatch_once(&APUIImageIOQueue_onceToken, &__block_literal_global_26);
  return (id)APUIImageIOQueue_q;
}

id APUIDataclassLocalizedName(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v1 = a1;
  objc_msgSend(v1, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[؋ objectForKey:](&unk_2507A48C0, "objectForKey:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    APUILocStr(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v1, "findApplicationRecordWithError:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend(v1, "bundleIdentifier");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

    v10 = (void *)MEMORY[0x24BDD17C8];
    APUILocStr(CFSTR("APP_DATA_FMT"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v11, v9);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

void type metadata accessor for APEnablementAction(uint64_t a1)
{
  sub_2362F43BC(a1, &qword_2563DBAD8);
}

void type metadata accessor for APEnableableFeature(uint64_t a1)
{
  sub_2362F43BC(a1, &qword_2563DBAE0);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_2362F4120(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2362F4140(uint64_t result, int a2, int a3)
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
  sub_2362F43BC(a1, &qword_2563DBAE8);
}

uint64_t sub_2362F417C()
{
  unsigned int v0;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  MKBGetDeviceLockState();
  v0 = MKBGetDeviceLockState();
  if (v0 < 4)
    return (7u >> (v0 & 0xF)) & 1;
  if (qword_2563DBAD0 != -1)
    swift_once();
  v2 = sub_2362FF8E4();
  __swift_project_value_buffer(v2, (uint64_t)qword_2563DBE80);
  v3 = sub_2362FF8CC();
  v4 = sub_2362FF9B0();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v5 = 67109120;
    sub_2362FFA64();
    _os_log_impl(&dword_2362EA000, v3, v4, "unknown return %d from MKBGetDeviceLockState", v5, 8u);
    MEMORY[0x23B7EFDA4](v5, -1, -1);
  }

  return 0;
}

_QWORD *sub_2362F42B4@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_2362F42C4(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_2362F42E8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_2362F432C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2362F434C(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = (a2 - 1);
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
  *(_BYTE *)(result + 40) = v3;
  return result;
}

void type metadata accessor for APSymbolBadgedAppIconViewMetrics(uint64_t a1)
{
  sub_2362F43BC(a1, &qword_2563DBAF0);
}

void type metadata accessor for APAuthenticationMechanism(uint64_t a1)
{
  sub_2362F43BC(a1, &qword_2563DBAF8);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_2362F43BC(a1, &qword_2563DBB00);
}

void sub_2362F43BC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2362F4408()
{
  uint64_t v0;

  v0 = sub_2362FF8E4();
  __swift_allocate_value_buffer(v0, qword_2563DBE80);
  __swift_project_value_buffer(v0, (uint64_t)qword_2563DBE80);
  return sub_2362FF8D8();
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

Swift::Void __swiftcall APEducationVCPresentingViewController.loadView()()
{
  void *v0;
  id v1;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
  objc_msgSend(v0, sel_setView_, v1);

}

void __swiftcall APEducationVCPresentingViewController.init(nibName:bundle:)(APEducationVCPresentingViewController *__return_ptr retstr, Swift::String_optional nibName, NSBundle_optional bundle)
{
  Class isa;
  void *v4;

  isa = bundle.value.super.isa;
  if (nibName.value._object)
  {
    v4 = (void *)sub_2362FF938();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithNibName_bundle_, v4, isa);

}

id APEducationVCPresentingViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v5;
  id v6;
  objc_super v8;

  if (a2)
  {
    v5 = (void *)sub_2362FF938();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)APEducationVCPresentingViewController;
  v6 = objc_msgSendSuper2(&v8, sel_initWithNibName_bundle_, v5, a3);

  return v6;
}

void __swiftcall APEducationVCPresentingViewController.init(coder:)(APEducationVCPresentingViewController_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

id APEducationVCPresentingViewController.init(coder:)(void *a1)
{
  id v2;
  objc_super v4;

  v4.super_class = (Class)APEducationVCPresentingViewController;
  v2 = objc_msgSendSuper2(&v4, sel_initWithCoder_, a1);

  return v2;
}

unint64_t type metadata accessor for APEducationVCPresentingViewController()
{
  unint64_t result;

  result = qword_2563DBB08;
  if (!qword_2563DBB08)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2563DBB08);
  }
  return result;
}

void sub_2362F4A0C(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_2362FF878();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, _QWORD))(a3 + 16))(a3, a1 & 1);

}

uint64_t sub_2362F4A64(char a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD aBlock[6];

  v23 = a6;
  v24 = a7;
  v11 = sub_2362FF8F0();
  v27 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_2362FF908();
  v25 = *(_QWORD *)(v14 - 8);
  v26 = v14;
  MEMORY[0x24BDAC7A8]();
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2362F51D8(0, (unint64_t *)&unk_2563DBDA0);
  v17 = (void *)sub_2362FF9D4();
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a3;
  *(_QWORD *)(v18 + 24) = a4;
  *(_BYTE *)(v18 + 32) = a1;
  *(_QWORD *)(v18 + 40) = a2;
  aBlock[4] = v23;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2362F5F24;
  aBlock[3] = v24;
  v19 = _Block_copy(aBlock);
  swift_retain();
  v20 = a2;
  swift_release();
  sub_2362FF8FC();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_2362F5218();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DBDB0);
  sub_2362F52A0();
  sub_2362FFA7C();
  MEMORY[0x23B7EF738](0, v16, v13, v19);
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v11);
  return (*(uint64_t (**)(char *, uint64_t))(v25 + 8))(v16, v26);
}

id sub_2362F4F28(void *a1, uint64_t a2)
{
  id result;

  result = objc_msgSend(a1, sel_delegate);
  if (result)
  {
    objc_msgSend(result, sel_systemActionDelegate_requestsDismissalOfEducationController_, a1, a2);
    return (id)swift_unknownObjectRelease();
  }
  return result;
}

void __swiftcall APEducationViewControllerSystemActionDelegate.init()(APEducationViewControllerSystemActionDelegate *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id APEducationViewControllerSystemActionDelegate.init()()
{
  void *v0;
  objc_super v2;

  swift_unknownObjectWeakInit();
  v2.receiver = v0;
  v2.super_class = (Class)APEducationViewControllerSystemActionDelegate;
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for APEducationViewControllerSystemActionDelegate(uint64_t a1)
{
  return sub_2362F51D8(a1, (unint64_t *)&unk_2563DBB80);
}

uint64_t sub_2362F5154()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_2362F5180()
{
  uint64_t v0;

  return sub_2362F4F28(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24));
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

void sub_2362F51A0(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_2362F4A0C(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_2362F51A8(char a1, void *a2)
{
  uint64_t v2;

  return sub_2362F4A64(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), (uint64_t)&unk_2507A02B8, (uint64_t)sub_2362F5214, (uint64_t)&block_descriptor_16);
}

uint64_t sub_2362F51D8(uint64_t a1, unint64_t *a2)
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

unint64_t sub_2362F5218()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2563DBB90;
  if (!qword_2563DBB90)
  {
    v1 = sub_2362FF8F0();
    result = MEMORY[0x23B7EFD50](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_2563DBB90);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7EFD38]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_2362F52A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2563DBBA0;
  if (!qword_2563DBBA0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2563DBDB0);
    result = MEMORY[0x23B7EFD50](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_2563DBBA0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B7EFD44](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2362F5330()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_2362F5354()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2362F5378(char a1, void *a2)
{
  uint64_t v2;

  return sub_2362F4A64(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), (uint64_t)&unk_2507A0380, (uint64_t)sub_2362F5214, (uint64_t)&block_descriptor_32);
}

uint64_t sub_2362F53AC(char a1, void *a2)
{
  uint64_t v2;

  return sub_2362F4A64(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), (uint64_t)&unk_2507A0448, (uint64_t)sub_2362F5214, (uint64_t)&block_descriptor_48);
}

uint64_t objectdestroy_12Tm()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2362F540C()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 16))(*(unsigned __int8 *)(v0 + 32), *(_QWORD *)(v0 + 40));
}

uint64_t sub_2362F5438(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

void static APSymbolBadgedAppIconView.metricsForEducation()(__n128 *a1@<X8>)
{
  sub_2362F54E0(a1, (__n128)xmmword_236300B90);
}

void static APSymbolBadgedAppIconView.metricsForExtensionShield()(__n128 *a1@<X8>)
{
  sub_2362F54E0(a1, (__n128)xmmword_236300BA0);
}

void sub_2362F54E0(__n128 *a1@<X8>, __n128 a2@<Q2>)
{
  double v3;
  unint64_t v4;

  v3 = CGPointMake();
  *a1 = a2;
  a1[1].n128_f64[0] = v3;
  a1[1].n128_u64[1] = v4;
  a1[2].n128_u64[0] = 0x4010000000000000;
}

char *sub_2362F5534(void *a1, void *a2, double *a3)
{
  void *v3;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_class *v15;
  char *v16;
  id v17;
  CGFloat MaxX;
  double v19;
  double v20;
  CGFloat MaxY;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  char *v27;
  __int128 v28;
  double v29;
  double v30;
  double v31;
  double v32;
  char *v33;
  uint64_t v34;
  void *v35;
  char *v36;
  uint64_t v37;
  void *v38;
  id v39;
  id v40;
  double v41;
  id v42;
  id v43;
  id v44;
  id v45;
  void *v46;
  char *v47;
  id v48;
  objc_super v50;
  CGRect v51;
  CGRect v52;

  v7 = a3[4];
  v8 = CGPointMake(a3[2] + v7, a3[3] + v7, *a3, *a3);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (objc_class *)MEMORY[0x24BEBD668];
  v16 = v3;
  v17 = objc_msgSend(objc_allocWithZone(v15), sel_initWithFrame_, v8, v10, v12, v14);
  *(_QWORD *)&v16[OBJC_IVAR___APSymbolBadgedAppIconView_appIconImageView] = v17;
  objc_msgSend(v17, sel_frame);
  MaxX = CGRectGetMaxX(v51);
  v19 = a3[1];
  v20 = MaxX - v19 * 0.5;
  objc_msgSend(v17, sel_frame);
  MaxY = CGRectGetMaxY(v52);
  v22 = CGPointMake(v20, MaxY - v19 * 0.5, v19, v19);
  v26 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD668]), sel_initWithFrame_, v22, v23, v24, v25);
  *(_QWORD *)&v16[OBJC_IVAR___APSymbolBadgedAppIconView_badgeImageView] = v26;
  v27 = &v16[OBJC_IVAR___APSymbolBadgedAppIconView_metrics];
  v28 = *((_OWORD *)a3 + 1);
  *(_OWORD *)v27 = *(_OWORD *)a3;
  *((_OWORD *)v27 + 1) = v28;
  *((double *)v27 + 4) = a3[4];

  v29 = *MEMORY[0x24BDBF090];
  v30 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v31 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v32 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v50.receiver = v16;
  v50.super_class = (Class)APSymbolBadgedAppIconView;
  v33 = (char *)objc_msgSendSuper2(&v50, sel_initWithFrame_, v29, v30, v31, v32);
  v34 = OBJC_IVAR___APSymbolBadgedAppIconView_appIconImageView;
  v35 = *(void **)&v33[OBJC_IVAR___APSymbolBadgedAppIconView_appIconImageView];
  v36 = v33;
  objc_msgSend(v35, sel_setImage_, a1);
  v37 = OBJC_IVAR___APSymbolBadgedAppIconView_badgeImageView;
  v38 = *(void **)&v36[OBJC_IVAR___APSymbolBadgedAppIconView_badgeImageView];
  objc_msgSend(v38, sel_setImage_, a2);
  objc_msgSend(v38, sel_setContentMode_, 1);
  objc_msgSend(v35, sel_setContentMode_, 1);
  v39 = objc_msgSend(v36, sel_layer);
  objc_msgSend(v39, sel_setShadowRadius_, v7);

  v40 = objc_msgSend(v36, sel_layer);
  LODWORD(v41) = 1041865114;
  objc_msgSend(v40, sel_setShadowOpacity_, v41);

  v42 = objc_msgSend(v36, sel_layer);
  v43 = objc_msgSend((id)objc_opt_self(), sel_blackColor);
  v44 = objc_msgSend(v43, sel_CGColor);

  objc_msgSend(v42, sel_setShadowColor_, v44);
  v45 = objc_msgSend(v36, sel_layer);
  objc_msgSend(v45, sel_setShadowOffset_, 0.0, v7);

  objc_msgSend(v36, sel_addSubview_, *(_QWORD *)&v33[v34]);
  v46 = *(void **)&v36[v37];
  v47 = v36;
  v48 = v46;
  objc_msgSend(v47, sel_addSubview_, v48);

  return v47;
}

void sub_2362F5898(void *a1, void *a2, uint64_t a3)
{
  void *v3;
  double v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  void (*v11)();
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  double v22;
  double v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  double v28;
  double v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  __int128 v37;
  void *v38;
  char *v39;
  char *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  double aBlock;
  uint64_t v52;
  uint64_t (*v53)(uint64_t);
  void *v54;
  void (*v55)();
  uint64_t v56;

  v7 = *(double *)a3;
  v8 = *(_QWORD *)(a3 + 8);
  v9 = *(uint64_t (**)(uint64_t))(a3 + 16);
  v10 = *(void **)(a3 + 24);
  v11 = *(void (**)())(a3 + 32);
  v12 = sub_2362FF8F0();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8]();
  v48 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_2362FF908();
  v46 = *(_QWORD *)(v15 - 8);
  v47 = v15;
  MEMORY[0x24BDAC7A8]();
  v45 = (char *)&v42 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = objc_msgSend(a1, sel_bundleIdentifier);
  sub_2362FF944();

  v18 = objc_allocWithZone(MEMORY[0x24BE51A90]);
  v19 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  v20 = objc_msgSend(v18, sel_initWithBundleIdentifier_, v19);

  v21 = objc_msgSend((id)objc_opt_self(), sel_imageDescriptorNamed_, *MEMORY[0x24BE51AD0]);
  objc_msgSend(v21, sel_setSize_, CGPointMake(*(double *)a3, *(double *)a3, v22, v23));
  v24 = objc_msgSend(v20, sel_imageForDescriptor_, v21);

  v49 = v13;
  if (!v24)
  {
    v31 = (void *)objc_opt_self();
    v32 = (void *)sub_2362FF938();
    v30 = objc_msgSend(v31, sel___systemImageNamedSwift_, v32);

    if (v30)
      goto LABEL_5;
LABEL_12:
    __break(1u);
    return;
  }
  v25 = objc_msgSend(v24, sel_CGImage);
  if (!v25)
  {
    __break(1u);
    goto LABEL_12;
  }
  v26 = v25;
  v27 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v27, sel_scale);
  v29 = v28;

  v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_initWithCGImage_scale_orientation_, v26, 0, v29);
LABEL_5:
  aBlock = v7;
  v52 = v8;
  v53 = v9;
  v54 = v10;
  v55 = v11;
  v33 = objc_msgSend(v3, sel_initWithApplicationIconImage_badgeImage_metrics_, v30, a2, &aBlock);
  if (v24)
  {
    v34 = v33;
    v35 = v24;
    if ((objc_msgSend(v35, sel_placeholder) & 1) != 0)
    {
      v44 = APUIImageIOQueue();
      v36 = swift_allocObject();
      v37 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)(v36 + 24) = *(_OWORD *)a3;
      *(_QWORD *)(v36 + 16) = v20;
      *(_OWORD *)(v36 + 40) = v37;
      *(_QWORD *)(v36 + 56) = *(_QWORD *)(a3 + 32);
      *(_QWORD *)(v36 + 64) = v34;
      v55 = sub_2362F76D0;
      v56 = v36;
      aBlock = MEMORY[0x24BDAC760];
      v52 = 1107296256;
      v53 = sub_2362F5F24;
      v54 = &block_descriptor_31;
      v38 = _Block_copy(&aBlock);
      v43 = v20;
      v39 = v45;
      sub_2362FF8FC();
      v50 = MEMORY[0x24BEE4AF8];
      sub_2362F5218();
      v42 = a2;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2563DBDB0);
      sub_2362F52A0();
      v40 = v48;
      sub_2362FFA7C();
      v41 = v44;
      MEMORY[0x23B7EF738](0, v39, v40, v38);

      _Block_release(v38);
      (*(void (**)(char *, uint64_t))(v49 + 8))(v40, v12);
      (*(void (**)(char *, uint64_t))(v46 + 8))(v39, v47);
      swift_release();
      return;
    }

  }
  else
  {

  }
}

void sub_2362F5D28(void *a1, double *a2, void *a3)
{
  id v6;
  double v7;
  double v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  char isEscapingClosureAtFileLocation;
  _QWORD v17[6];

  v6 = objc_msgSend((id)objc_opt_self(), sel_imageDescriptorNamed_, *MEMORY[0x24BE51AD0]);
  objc_msgSend(v6, sel_setSize_, CGPointMake(*a2, *a2, v7, v8));
  v9 = objc_msgSend(a1, sel_prepareImageForDescriptor_, v6);

  if (v9)
  {
    sub_2362F51D8(0, (unint64_t *)&unk_2563DBDA0);
    v10 = sub_2362FF9D4();
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v9;
    *(_QWORD *)(v11 + 24) = a3;
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = sub_2362F76E0;
    *(_QWORD *)(v12 + 24) = v11;
    v17[4] = sub_2362F7CE0;
    v17[5] = v12;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 1107296256;
    v17[2] = sub_2362F5F04;
    v17[3] = &block_descriptor_41;
    v13 = _Block_copy(v17);
    v14 = v9;
    v15 = a3;
    swift_retain();
    swift_release();
    dispatch_sync(v10, v13);

    _Block_release(v13);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
      __break(1u);
  }
}

uint64_t sub_2362F5F04(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_2362F5F24(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_2362F5F5C(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t (*a6)(void *, void *, _OWORD *))
{
  uint64_t v6;
  __int128 v7;
  _OWORD v9[2];
  uint64_t v10;

  v6 = *(_QWORD *)(a5 + 32);
  v7 = *(_OWORD *)(a5 + 16);
  v9[0] = *(_OWORD *)a5;
  v9[1] = v7;
  v10 = v6;
  return a6(a3, a4, v9);
}

void sub_2362F5FC0(void *a1, uint64_t a2, uint64_t a3, double *a4)
{
  void *v4;
  double v7;
  double v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  void (*v11)();
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  double v22;
  double v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  double v28;
  double v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  __int128 v37;
  void *v38;
  char *v39;
  char *v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  id v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  double aBlock;
  uint64_t v52;
  uint64_t (*v53)(uint64_t);
  void *v54;
  void (*v55)();
  uint64_t v56;

  v8 = *a4;
  v7 = a4[1];
  v9 = (uint64_t (*)(uint64_t))*((_QWORD *)a4 + 2);
  v10 = (void *)*((_QWORD *)a4 + 3);
  v11 = (void (*)())*((_QWORD *)a4 + 4);
  v12 = sub_2362FF8F0();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8]();
  v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_2362FF908();
  v47 = *(_QWORD *)(v16 - 8);
  MEMORY[0x24BDAC7A8]();
  v46 = (char *)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = objc_allocWithZone(MEMORY[0x24BE51A90]);
  v19 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  v20 = objc_msgSend(v18, sel_initWithType_, v19);

  v21 = objc_msgSend((id)objc_opt_self(), sel_imageDescriptorNamed_, *MEMORY[0x24BE51AF0]);
  objc_msgSend(v21, sel_setSize_, CGPointMake(v7, v7, v22, v23));
  v24 = objc_msgSend(v20, sel_imageForDescriptor_, v21);

  v48 = v16;
  v49 = v15;
  if (!v24)
  {
    v31 = (void *)objc_opt_self();
    v32 = (void *)sub_2362FF938();
    v30 = objc_msgSend(v31, sel___systemImageNamedSwift_, v32);

    if (v30)
      goto LABEL_5;
LABEL_12:
    __break(1u);
    return;
  }
  v25 = objc_msgSend(v24, sel_CGImage);
  if (!v25)
  {
    __break(1u);
    goto LABEL_12;
  }
  v26 = v25;
  v27 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v27, sel_scale);
  v29 = v28;

  v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_initWithCGImage_scale_orientation_, v26, 0, v29);
LABEL_5:
  aBlock = v8;
  v52 = *(_QWORD *)&v7;
  v53 = v9;
  v54 = v10;
  v55 = v11;
  v33 = objc_msgSend(v4, sel_initWithApplicationIconImage_badgeImage_metrics_, a1, v30, &aBlock);
  if (v24)
  {
    v34 = v33;
    v35 = v24;
    if ((objc_msgSend(v35, sel_placeholder) & 1) != 0)
    {
      v45 = APUIImageIOQueue();
      v36 = swift_allocObject();
      v37 = *((_OWORD *)a4 + 1);
      *(_OWORD *)(v36 + 24) = *(_OWORD *)a4;
      *(_QWORD *)(v36 + 16) = v20;
      *(_OWORD *)(v36 + 40) = v37;
      *(double *)(v36 + 56) = a4[4];
      *(_QWORD *)(v36 + 64) = v34;
      v55 = sub_2362F7664;
      v56 = v36;
      aBlock = MEMORY[0x24BDAC760];
      v52 = 1107296256;
      v53 = sub_2362F5F24;
      v54 = &block_descriptor_15;
      v38 = _Block_copy(&aBlock);
      v43 = v20;
      v39 = v46;
      sub_2362FF8FC();
      v50 = MEMORY[0x24BEE4AF8];
      sub_2362F5218();
      v44 = v13;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2563DBDB0);
      sub_2362F52A0();
      v40 = v49;
      sub_2362FFA7C();
      v41 = v45;
      MEMORY[0x23B7EF738](0, v39, v40, v38);

      _Block_release(v38);
      (*(void (**)(char *, uint64_t))(v44 + 8))(v40, v12);
      (*(void (**)(char *, uint64_t))(v47 + 8))(v39, v48);
      swift_release();
      return;
    }

  }
  else
  {

  }
}

void sub_2362F6420(void *a1, uint64_t a2, void *a3)
{
  id v6;
  double v7;
  double v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  char isEscapingClosureAtFileLocation;
  _QWORD v17[6];

  v6 = objc_msgSend((id)objc_opt_self(), sel_imageDescriptorNamed_, *MEMORY[0x24BE51AF0]);
  objc_msgSend(v6, sel_setSize_, CGPointMake(*(double *)(a2 + 8), *(double *)(a2 + 8), v7, v8));
  v9 = objc_msgSend(a1, sel_prepareImageForDescriptor_, v6);

  if (v9)
  {
    sub_2362F51D8(0, (unint64_t *)&unk_2563DBDA0);
    v10 = sub_2362FF9D4();
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v9;
    *(_QWORD *)(v11 + 24) = a3;
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = sub_2362F76A0;
    *(_QWORD *)(v12 + 24) = v11;
    v17[4] = sub_2362F7CE0;
    v17[5] = v12;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 1107296256;
    v17[2] = sub_2362F5F04;
    v17[3] = &block_descriptor_25;
    v13 = _Block_copy(v17);
    v14 = v9;
    v15 = a3;
    swift_retain();
    swift_release();
    dispatch_sync(v10, v13);

    _Block_release(v13);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
      __break(1u);
  }
}

void sub_2362F6608(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  double v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  void (*v11)();
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  double v21;
  double v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  double v27;
  double v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  __int128 v38;
  void *v39;
  id v40;
  id v41;
  char *v42;
  char *v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  double aBlock;
  uint64_t v56;
  uint64_t (*v57)(uint64_t);
  void *v58;
  void (*v59)();
  uint64_t v60;

  v7 = *(double *)a4;
  v8 = *(_QWORD *)(a4 + 8);
  v9 = *(uint64_t (**)(uint64_t))(a4 + 16);
  v10 = *(void **)(a4 + 24);
  v11 = *(void (**)())(a4 + 32);
  v12 = sub_2362FF8F0();
  v52 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8]();
  v51 = (char *)&v46 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_2362FF908();
  v49 = *(_QWORD *)(v14 - 8);
  v50 = v14;
  MEMORY[0x24BDAC7A8]();
  v48 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = objc_msgSend(a1, sel_bundleIdentifier);
  sub_2362FF944();

  v17 = objc_allocWithZone(MEMORY[0x24BE51A90]);
  v18 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(v17, sel_initWithBundleIdentifier_, v18);

  v20 = objc_msgSend((id)objc_opt_self(), sel_imageDescriptorNamed_, *MEMORY[0x24BE51AD0]);
  objc_msgSend(v20, sel_setSize_, CGPointMake(*(double *)a4, *(double *)a4, v21, v22));
  v23 = objc_msgSend(v19, sel_imageForDescriptor_, v20);

  v53 = v12;
  if (!v23)
  {
    v30 = (void *)objc_opt_self();
    v31 = a1;
    v32 = (void *)sub_2362FF938();
    v29 = objc_msgSend(v30, sel___systemImageNamedSwift_, v32);

    a1 = v31;
    if (v29)
      goto LABEL_5;
LABEL_12:
    __break(1u);
    return;
  }
  v24 = objc_msgSend(v23, sel_CGImage);
  if (!v24)
  {
    __break(1u);
    goto LABEL_12;
  }
  v25 = v24;
  v26 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
  objc_msgSend(v26, sel_scale);
  v28 = v27;

  v29 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_initWithCGImage_scale_orientation_, v25, 0, v28);
LABEL_5:
  v33 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  aBlock = v7;
  v56 = v8;
  v57 = v9;
  v58 = v10;
  v59 = v11;
  v34 = objc_msgSend(v4, sel_initWithApplicationIconImage_symbolType_metrics_, v29, v33, &aBlock);

  if (v23)
  {
    v35 = v34;
    v36 = v23;
    if ((objc_msgSend(v36, sel_placeholder) & 1) != 0)
    {
      v47 = APUIImageIOQueue();
      v37 = swift_allocObject();
      v38 = *(_OWORD *)(a4 + 16);
      *(_OWORD *)(v37 + 24) = *(_OWORD *)a4;
      *(_QWORD *)(v37 + 16) = v19;
      *(_OWORD *)(v37 + 40) = v38;
      *(_QWORD *)(v37 + 56) = *(_QWORD *)(a4 + 32);
      *(_QWORD *)(v37 + 64) = v35;
      v59 = sub_2362F760C;
      v60 = v37;
      aBlock = MEMORY[0x24BDAC760];
      v56 = 1107296256;
      v57 = sub_2362F5F24;
      v58 = &block_descriptor_0;
      v39 = _Block_copy(&aBlock);
      v40 = v19;
      v46 = a1;
      v41 = v40;
      v42 = v48;
      sub_2362FF8FC();
      v54 = MEMORY[0x24BEE4AF8];
      sub_2362F5218();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2563DBDB0);
      sub_2362F52A0();
      v43 = v51;
      v44 = v53;
      sub_2362FFA7C();
      v45 = v47;
      MEMORY[0x23B7EF738](0, v42, v43, v39);

      _Block_release(v39);
      (*(void (**)(char *, uint64_t))(v52 + 8))(v43, v44);
      (*(void (**)(char *, uint64_t))(v49 + 8))(v42, v50);
      swift_release();
      return;
    }

  }
  else
  {

  }
}

void sub_2362F6ABC(void *a1, double *a2, void *a3)
{
  id v6;
  double v7;
  double v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  char isEscapingClosureAtFileLocation;
  _QWORD v17[6];

  v6 = objc_msgSend((id)objc_opt_self(), sel_imageDescriptorNamed_, *MEMORY[0x24BE51AD0]);
  objc_msgSend(v6, sel_setSize_, CGPointMake(*a2, *a2, v7, v8));
  v9 = objc_msgSend(a1, sel_prepareImageForDescriptor_, v6);

  if (v9)
  {
    sub_2362F51D8(0, (unint64_t *)&unk_2563DBDA0);
    v10 = sub_2362FF9D4();
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v9;
    *(_QWORD *)(v11 + 24) = a3;
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = sub_2362F7CE4;
    *(_QWORD *)(v12 + 24) = v11;
    v17[4] = sub_2362F7644;
    v17[5] = v12;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 1107296256;
    v17[2] = sub_2362F5F04;
    v17[3] = &block_descriptor_9;
    v13 = _Block_copy(v17);
    v14 = v9;
    v15 = a3;
    swift_retain();
    swift_release();
    dispatch_sync(v10, v13);

    _Block_release(v13);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
      __break(1u);
  }
}

void sub_2362F6C98(void *a1, uint64_t a2, _QWORD *a3)
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  id v9;

  v3 = *(void **)(a2 + *a3);
  v4 = objc_msgSend(a1, sel_CGImage);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
    objc_msgSend(v6, sel_scale);
    v8 = v7;

    v9 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_initWithCGImage_scale_orientation_, v5, 0, v8);
    objc_msgSend(v3, sel_setImage_, v9);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2362F6D78(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(void *, uint64_t, uint64_t, _OWORD *))
{
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD v13[2];
  uint64_t v14;

  v8 = *(_QWORD *)(a5 + 32);
  v9 = *(_OWORD *)(a5 + 16);
  v13[0] = *(_OWORD *)a5;
  v13[1] = v9;
  v14 = v8;
  v10 = sub_2362FF944();
  return a6(a3, v10, v11, v13);
}

void __swiftcall APSymbolBadgedAppIconView.init(coder:)(APSymbolBadgedAppIconView_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

void APSymbolBadgedAppIconView.init(coder:)()
{
  sub_2362FFAC4();
  __break(1u);
}

CGSize __swiftcall APSymbolBadgedAppIconView.sizeThatFits(_:)(CGSize a1)
{
  uint64_t v1;
  double width;
  uint64_t v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double MaxX;
  double v21;
  double MaxY;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  double v36;
  double v37;
  CGSize result;
  CGRect rect;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  width = a1.width;
  v3 = v1 + OBJC_IVAR___APSymbolBadgedAppIconView_metrics;
  v4 = *(double *)(v1 + OBJC_IVAR___APSymbolBadgedAppIconView_metrics);
  v5 = *(double *)(v1 + OBJC_IVAR___APSymbolBadgedAppIconView_metrics + 8);
  v6 = (width - v4) * 0.5;
  v7 = *(double *)(v1 + OBJC_IVAR___APSymbolBadgedAppIconView_metrics + 16);
  v8 = *(double *)(v1 + OBJC_IVAR___APSymbolBadgedAppIconView_metrics + 24);
  v9 = v7 + v4 + v6 - v5;
  rect.origin.x = v9;
  v10 = v4 + 0.0 - v5 + v8;
  v11 = CGPointMake(v4, v4, v7, v8);
  v13 = v12;
  v16 = CGPointMake(v5, v5, v14, v15);
  v18 = v17;
  v19 = *(double *)(v3 + 32);
  v40.origin.x = v9;
  v40.origin.y = v10;
  v40.size.width = v16;
  v40.size.height = v18;
  MaxX = CGRectGetMaxX(v40);
  v41.origin.y = 0.0;
  v41.origin.x = v6;
  v41.size.width = v11;
  v41.size.height = v13;
  v21 = v19 + MaxX - CGRectGetMaxX(v41);
  v42.origin.x = rect.origin.x;
  v42.origin.y = v10;
  v42.size.width = v16;
  v42.size.height = v18;
  MaxY = CGRectGetMaxY(v42);
  v43.origin.y = 0.0;
  v43.origin.x = v6;
  v43.size.width = v11;
  v43.size.height = v13;
  v23 = v19 + MaxY - CGRectGetMaxY(v43);
  if (v19 > v21)
    v24 = v19;
  else
    v24 = v21;
  v25 = v24 + v24;
  if (qword_2563DBAD0 != -1)
    swift_once();
  v26 = v13 + v23;
  v27 = sub_2362FF8E4();
  __swift_project_value_buffer(v27, (uint64_t)qword_2563DBE80);
  v28 = sub_2362FF8CC();
  v29 = sub_2362FF9BC();
  if (os_log_type_enabled(v28, v29))
  {
    v30 = swift_slowAlloc();
    v31 = swift_slowAlloc();
    *(_QWORD *)&rect.size.height = v31;
    *(_DWORD *)v30 = 136315394;
    type metadata accessor for CGSize(0);
    v32 = sub_2362FF968();
    sub_2362F74FC(v32, v33, (uint64_t *)&rect.size.height);
    sub_2362FFA64();
    swift_bridgeObjectRelease();
    *(_WORD *)(v30 + 12) = 2080;
    v34 = sub_2362FF968();
    sub_2362F74FC(v34, v35, (uint64_t *)&rect.size.height);
    sub_2362FFA64();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2362EA000, v28, v29, "size that fits %s is %s", (uint8_t *)v30, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x23B7EFDA4](v31, -1, -1);
    MEMORY[0x23B7EFDA4](v30, -1, -1);
  }

  v36 = v11 + v25;
  v37 = v26;
  result.height = v37;
  result.width = v36;
  return result;
}

id APSymbolBadgedAppIconView.intrinsicContentSize.getter()
{
  void *v0;

  return objc_msgSend(v0, sel_sizeThatFits_, 1000.0, 1000.0);
}

Swift::Void __swiftcall APSymbolBadgedAppIconView.layoutSubviews()()
{
  char *v0;
  double *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  id v23;
  objc_super v24;

  v24.super_class = (Class)APSymbolBadgedAppIconView;
  objc_msgSendSuper2(&v24, sel_layoutSubviews);
  objc_msgSend(v0, sel_bounds);
  v1 = (double *)&v0[OBJC_IVAR___APSymbolBadgedAppIconView_metrics];
  v2 = *(double *)&v0[OBJC_IVAR___APSymbolBadgedAppIconView_metrics];
  v3 = *(double *)&v0[OBJC_IVAR___APSymbolBadgedAppIconView_metrics + 8];
  v5 = (v4 - v2) * 0.5;
  v6 = *(double *)&v0[OBJC_IVAR___APSymbolBadgedAppIconView_metrics + 16];
  v7 = *(double *)&v0[OBJC_IVAR___APSymbolBadgedAppIconView_metrics + 24];
  v8 = v6 + v2 + v5 - v3;
  v9 = v2 + 0.0 - v3 + v7;
  v10 = CGPointMake(v2, v2, v6, v7);
  v12 = v11;
  v15 = CGPointMake(v3, v3, v13, v14);
  v17 = v16;
  v18 = v1[4];
  v19 = *(void **)&v0[OBJC_IVAR___APSymbolBadgedAppIconView_appIconImageView];
  objc_msgSend(v19, sel_setFrame_, v5, 0.0, v10, v12);
  objc_msgSend(*(id *)&v0[OBJC_IVAR___APSymbolBadgedAppIconView_badgeImageView], sel_setFrame_, v8, v9, v15, v17);
  v20 = objc_msgSend(v19, sel_layer);
  objc_msgSend(v20, sel_shadowRadius);
  v22 = v21;

  if (v22 != v18)
  {
    v23 = objc_msgSend(v19, sel_layer);
    objc_msgSend(v23, sel_setShadowRadius_, v18);

  }
}

void __swiftcall APSymbolBadgedAppIconView.init(frame:)(APSymbolBadgedAppIconView *__return_ptr retstr, CGRect frame)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
}

void APSymbolBadgedAppIconView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_2362F74FC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2362F7710(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2362F78E8((uint64_t)v12, *a3);
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
      sub_2362F78E8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t type metadata accessor for APSymbolBadgedAppIconView(uint64_t a1)
{
  return sub_2362F51D8(a1, &qword_2563DBC28);
}

uint64_t sub_2362F75E0()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_2362F760C()
{
  uint64_t v0;

  sub_2362F6ABC(*(void **)(v0 + 16), (double *)(v0 + 24), *(void **)(v0 + 64));
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

uint64_t sub_2362F7634()
{
  return swift_deallocObject();
}

uint64_t sub_2362F7644()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_2362F7664()
{
  uint64_t v0;

  sub_2362F6420(*(void **)(v0 + 16), v0 + 24, *(void **)(v0 + 64));
}

uint64_t sub_2362F7674()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_2362F76A0()
{
  uint64_t v0;

  sub_2362F6C98(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), &OBJC_IVAR___APSymbolBadgedAppIconView_badgeImageView);
}

uint64_t sub_2362F76C0()
{
  return swift_deallocObject();
}

void sub_2362F76D0()
{
  uint64_t v0;

  sub_2362F5D28(*(void **)(v0 + 16), (double *)(v0 + 24), *(void **)(v0 + 64));
}

void sub_2362F76E0()
{
  uint64_t v0;

  sub_2362F6C98(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), &OBJC_IVAR___APSymbolBadgedAppIconView_appIconImageView);
}

uint64_t sub_2362F7700()
{
  return swift_deallocObject();
}

uint64_t sub_2362F7710(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2362FFA70();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2362F7924(a5, a6);
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
  v8 = sub_2362FFAAC();
  if (!v8)
  {
    sub_2362FFAB8();
    __break(1u);
LABEL_17:
    result = sub_2362FFADC();
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

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2362F78E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2362F7924(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2362F79B8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2362F7B90(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2362F7B90(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2362F79B8(uint64_t a1, unint64_t a2)
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
      v3 = sub_2362F7B2C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2362FFA94();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2362FFAB8();
      __break(1u);
LABEL_10:
      v2 = sub_2362FF980();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2362FFADC();
    __break(1u);
LABEL_14:
    result = sub_2362FFAB8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2362F7B2C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2563DBC30);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2362F7B90(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2563DBC30);
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
  result = sub_2362FFADC();
  __break(1u);
  return result;
}

void sub_2362F7D20(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t ObjectType;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x23B7EFDEC](v2);
  if (v3)
  {
    v4 = (char *)v3;
    objc_msgSend(*(id *)(v3 + OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_button), sel_setEnabled_, 0);
    v5 = &v4[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_delegate];
    if (MEMORY[0x23B7EFDEC](&v4[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_delegate]))
    {
      v6 = *((_QWORD *)v5 + 1);
      ObjectType = swift_getObjectType();
      (*(void (**)(char *, uint64_t, uint64_t))(v6 + 8))(v4, ObjectType, v6);

      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
}

void sub_2362F7E28(char a1)
{
  char *v1;
  char *v3;
  void *v4;
  char *v5;
  id v6;
  id v7;
  objc_super v8;

  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for APHiddenAppConfirmationViewController();
  objc_msgSendSuper2(&v8, sel_viewDidAppear_, a1 & 1);
  v3 = *(char **)&v1[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_welcomeController];
  if (v3)
  {
    v4 = *(void **)&v3[OBJC_IVAR____TtC15AppProtectionUI29APOnBoardingWelcomeController_assistant];
    if (v4)
    {
      v5 = v3;
      v6 = v4;
      v7 = objc_msgSend(v5, sel_scrollView);
      objc_msgSend(v6, sel_performAdjustmentsForScrollView_, v7);

    }
  }
  else
  {
    __break(1u);
  }
}

void sub_2362F7F24()
{
  char *v0;
  char *v1;
  void *v2;
  char *v3;
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for APHiddenAppConfirmationViewController();
  objc_msgSendSuper2(&v6, sel_viewDidLayoutSubviews);
  v1 = *(char **)&v0[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_welcomeController];
  if (v1)
  {
    v2 = *(void **)&v1[OBJC_IVAR____TtC15AppProtectionUI29APOnBoardingWelcomeController_assistant];
    if (v2)
    {
      v3 = v1;
      v4 = v2;
      v5 = objc_msgSend(v3, sel_scrollView);
      objc_msgSend(v4, sel_performAdjustmentsForScrollView_, v5);

    }
  }
  else
  {
    __break(1u);
  }
}

id sub_2362F800C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for APHiddenAppConfirmationViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for APHiddenAppConfirmationViewController()
{
  return objc_opt_self();
}

void sub_2362F8160()
{
  char *v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)&v0[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_welcomeController] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_navController] = 0;
  v1 = OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_button;
  v2 = (void *)sub_2362FF938();
  v3 = APUILocStr(v2);

  v4 = sub_2362FF944();
  v6 = v5;

  v7 = sub_2362F9A8C(v4, v6);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v0[v1] = v7;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();

  sub_2362FFAC4();
  __break(1u);
}

void sub_2362F8270(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x23B7EFDEC](v2);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = v3 + OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_delegate;
    if (MEMORY[0x23B7EFDEC](v3 + OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_delegate))
    {
      v6 = *(_QWORD *)(v5 + 8);
      ObjectType = swift_getObjectType();
      (*(void (**)(void *, uint64_t, uint64_t))(v6 + 8))(v4, ObjectType, v6);

      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
}

void sub_2362F830C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t ObjectType;

  v4 = a2 + 16;
  swift_beginAccess();
  v5 = MEMORY[0x23B7EFDEC](v4);
  if (v5)
  {
    v6 = (void *)v5;
    swift_beginAccess();
    if (MEMORY[0x23B7EFDEC](a3 + 16))
    {
      v7 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType();
      (*(void (**)(void *, uint64_t, uint64_t))(v7 + 16))(v6, ObjectType, v7);

      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
}

id sub_2362F8544()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for APLockedAppDisclosureViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for APLockedAppDisclosureViewController()
{
  return objc_opt_self();
}

void sub_2362F85EC()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_scrollViewAssistant;
  *(_QWORD *)&v0[v1] = objc_msgSend(objc_allocWithZone((Class)APButtonTrayScrollViewAssistant), sel_init);
  v2 = OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_button;
  v3 = (void *)sub_2362FF938();
  v4 = APUILocStr(v3);

  v5 = sub_2362FF944();
  v7 = v6;

  v8 = sub_2362F9A8C(v5, v7);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v0[v2] = v8;
  *(_QWORD *)&v0[OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();

  sub_2362FFAC4();
  __break(1u);
}

id sub_2362F86F4()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)APFeatureSemioticsManager), sel_init);
  qword_2542A6608 = (uint64_t)result;
  return result;
}

APFeatureSemioticsManager __swiftcall APFeatureSemioticsManager.init()()
{
  return (APFeatureSemioticsManager)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id sub_2362F87A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, uint64_t))
{
  void *v5;

  a5(a3, a4);
  v5 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  return v5;
}

id APFeatureSemioticsManager.init()()
{
  objc_super v1;

  v1.super_class = (Class)APFeatureSemioticsManager;
  return objc_msgSendSuper2(&v1, sel_init);
}

unint64_t type metadata accessor for APFeatureSemioticsManager()
{
  unint64_t result;

  result = qword_2563DBCF0;
  if (!qword_2563DBCF0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2563DBCF0);
  }
  return result;
}

uint64_t sub_2362F8A18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString *v8;
  void *v9;
  id v10;
  __CFString *v11;
  id v12;
  uint64_t v13;
  uint64_t ObjCClassFromMetadata;
  id v16;

  v4 = sub_2362FF8C0();
  MEMORY[0x24BDAC7A8](v4, v5);
  v6 = sub_2362FF92C();
  MEMORY[0x24BDAC7A8](v6, v7);
  if (a1 == 2)
  {
    if ((unint64_t)(a2 - 1) <= 2)
      goto LABEL_8;
  }
  else if (a1 == 1)
  {
    switch(a2)
    {
      case 3:
        goto LABEL_8;
      case 2:
        sub_2362FFA88();
        swift_bridgeObjectRelease();
        v11 = APGetPreferredAuthenticationMechanismLocKey();
        sub_2362FF944();

        sub_2362FF974();
        swift_bridgeObjectRelease();
        v9 = (void *)sub_2362FF938();
        swift_bridgeObjectRelease();
        v10 = APUILocStr(v9);
        goto LABEL_12;
      case 1:
LABEL_8:
        v8 = APGetPreferredAuthenticationMechanismLocKey();
        sub_2362FF944();

        sub_2362FF974();
        swift_bridgeObjectRelease();
        v9 = (void *)sub_2362FF938();
        swift_bridgeObjectRelease();
        v10 = APUILocStr(v9);
LABEL_12:
        v12 = v10;

        v13 = sub_2362FF944();
        return v13;
    }
  }
  sub_2362FF920();
  type metadata accessor for APFeatureSemioticsManager();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v16 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  sub_2362FF8B4();
  return sub_2362FF95C();
}

uint64_t sub_2362F8DC0(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;

  if (a2 == 2)
  {
    if (a1 == 1)
      return 0x687361642E707061;
    else
      return 6650213;
  }
  else
  {
    v4 = APGetPreferredAuthenticationMechanism();
    result = 0x646965636166;
    switch(v4)
    {
      case 0:
      case 3:
        if (a1 == 2)
          result = 0x65706F2E6B636F6CLL;
        else
          result = 1801678700;
        break;
      case 1:
        return result;
      case 2:
        result = 0x64696863756F74;
        break;
      default:
        type metadata accessor for APAuthenticationMechanism(0);
        result = sub_2362FFAF4();
        __break(1u);
        break;
    }
  }
  return result;
}

id sub_2362F8F70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  char *v7;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v16;

  *(_QWORD *)&v7[OBJC_IVAR____TtC15AppProtectionUI29APOnBoardingWelcomeController_assistant] = 0;
  v11 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  if (!a4)
  {
    v12 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v13 = 0;
    goto LABEL_6;
  }
  v12 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  if (!a6)
    goto LABEL_5;
LABEL_3:
  v13 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
LABEL_6:
  v16.receiver = v7;
  v16.super_class = (Class)type metadata accessor for APOnBoardingWelcomeController();
  v14 = objc_msgSendSuper2(&v16, sel_initWithTitle_detailText_symbolName_contentLayout_, v11, v12, v13, a7);

  return v14;
}

id sub_2362F9204()
{
  return sub_2362F99F4(type metadata accessor for APOnBoardingWelcomeController);
}

uint64_t type metadata accessor for APOnBoardingWelcomeController()
{
  return objc_opt_self();
}

char *sub_2362F9240(double a1, double a2, double a3, double a4)
{
  char *v4;
  uint64_t v9;
  id v10;
  char *v11;
  uint64_t v12;
  id v13;
  id v14;
  char *v15;
  void *v16;
  id v17;
  objc_super v19;

  v9 = OBJC_IVAR____TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray_stack;
  v10 = objc_allocWithZone(MEMORY[0x24BEBD978]);
  v11 = v4;
  *(_QWORD *)&v4[v9] = objc_msgSend(v10, sel_init);
  v12 = OBJC_IVAR____TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray_background;
  v13 = objc_msgSend((id)objc_opt_self(), sel_effectWithStyle_, 4);
  v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB38]), sel_initWithEffect_, v13);

  *(_QWORD *)&v11[v12] = v14;
  v19.receiver = v11;
  v19.super_class = (Class)type metadata accessor for APBraveAndIconoclasticSafeAreaUsingButtonTray();
  v15 = (char *)objc_msgSendSuper2(&v19, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v15, sel_setInsetsLayoutMarginsFromSafeArea_, 0);
  objc_msgSend(v15, sel_setLayoutMarginsFollowReadableWidth_, 1);
  objc_msgSend(v15, sel_setLayoutMargins_, 16.0, 24.0, 24.0, 24.0);
  objc_msgSend(v15, sel_addSubview_, *(_QWORD *)&v15[OBJC_IVAR____TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray_background]);
  v16 = *(void **)&v15[OBJC_IVAR____TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray_stack];
  objc_msgSend(v15, sel_addSubview_, v16);
  objc_msgSend(v16, sel_setAxis_, 1);
  objc_msgSend(v16, sel_setAlignment_, 0);
  v17 = v16;
  objc_msgSend(v17, sel_setDistribution_, 3);

  return v15;
}

id sub_2362F9668()
{
  return sub_2362F99F4(type metadata accessor for APBraveAndIconoclasticSafeAreaUsingButtonTray);
}

uint64_t type metadata accessor for APBraveAndIconoclasticSafeAreaUsingButtonTray()
{
  return objc_opt_self();
}

char *sub_2362F978C(double a1, double a2, double a3, double a4)
{
  char *v4;
  uint64_t v9;
  id v10;
  char *v11;
  char *v12;
  objc_super v14;

  *(_QWORD *)&v4[OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeView] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeScrollView] = 0;
  v9 = OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_buttonTray;
  v10 = objc_allocWithZone((Class)type metadata accessor for APBraveAndIconoclasticSafeAreaUsingButtonTray());
  v11 = v4;
  *(_QWORD *)&v4[v9] = objc_msgSend(v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  v14.receiver = v11;
  v14.super_class = (Class)type metadata accessor for APWelcomeControllerWithBraveButtonTrayView();
  v12 = (char *)objc_msgSendSuper2(&v14, sel_initWithFrame_, a1, a2, a3, a4);
  objc_msgSend(v12, sel_addSubview_, *(_QWORD *)&v12[OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_buttonTray]);
  return v12;
}

id sub_2362F9898()
{
  char *v0;
  void *v1;
  id v2;
  void *v3;
  double Width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  v12.receiver = v0;
  v12.super_class = (Class)type metadata accessor for APWelcomeControllerWithBraveButtonTrayView();
  objc_msgSendSuper2(&v12, sel_layoutSubviews);
  v1 = *(void **)&v0[OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeView];
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v0, sel_bounds);
    objc_msgSend(v2, sel_setFrame_);
    objc_msgSend(v2, sel_layoutIfNeeded);

  }
  v3 = *(void **)&v0[OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_buttonTray];
  objc_msgSend(v0, sel_bounds);
  Width = CGRectGetWidth(v13);
  objc_msgSend(v3, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, CGPointMake(Width, 0.0, v5, v6));
  v8 = v7;
  objc_msgSend(v0, sel_bounds);
  v10 = v9 - v8;
  objc_msgSend(v0, sel_bounds);
  return objc_msgSend(v3, sel_setFrame_, 0.0, v10, CGRectGetWidth(v14), v8);
}

id sub_2362F99E8()
{
  return sub_2362F99F4(type metadata accessor for APWelcomeControllerWithBraveButtonTrayView);
}

id sub_2362F99F4(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for APWelcomeControllerWithBraveButtonTrayView()
{
  return objc_opt_self();
}

uint64_t sub_2362F9A8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
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
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  id v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;

  v24 = a2;
  v25 = a1;
  v2 = sub_2362FFA28();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2362FFA04();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2362FFA4C();
  v13 = *(_QWORD *)(v12 - 8);
  v15 = MEMORY[0x24BDAC7A8](v12, v14);
  v17 = (char *)&v24 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15, v18);
  v20 = (char *)&v24 - v19;
  sub_2362FFA40();
  (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v11, *MEMORY[0x24BEBD070], v7);
  sub_2362FFA10();
  v21 = objc_msgSend((id)objc_opt_self(), sel_whiteColor, v24, v25);
  sub_2362FFA1C();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v6, *MEMORY[0x24BEBD180], v2);
  sub_2362FF9F8();
  swift_bridgeObjectRetain();
  sub_2362FFA34();
  sub_2362F9C68();
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v17, v20, v12);
  v22 = sub_2362FFA58();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v20, v12);
  return v22;
}

unint64_t sub_2362F9C68()
{
  unint64_t result;

  result = qword_2563DBD28;
  if (!qword_2563DBD28)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2563DBD28);
  }
  return result;
}

double UIEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

void sub_2362F9CC0()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  id v4;

  v1 = OBJC_IVAR____TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray_stack;
  *(_QWORD *)&v0[v1] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD978]), sel_init);
  v2 = OBJC_IVAR____TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray_background;
  v3 = objc_msgSend((id)objc_opt_self(), sel_effectWithStyle_, 4);
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB38]), sel_initWithEffect_, v3);

  *(_QWORD *)&v0[v2] = v4;
  sub_2362FFAC4();
  __break(1u);
}

void sub_2362F9DA0(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

void sub_2362F9E00(void *a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  char *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  uint64_t v55;
  void *v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;

  v4 = objc_msgSend(a1, sel_localizedName);
  v5 = sub_2362FF944();
  v7 = v6;

  v8 = (void *)sub_2362FF938();
  v9 = APUILocStr(v8);

  sub_2362FF944();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DBD60);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_236300D40;
  *(_QWORD *)(v10 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v10 + 64) = sub_2362FDA88();
  *(_QWORD *)(v10 + 32) = v5;
  *(_QWORD *)(v10 + 40) = v7;
  swift_bridgeObjectRetain();
  sub_2362FF950();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2362FFA88();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v59 = 0xD000000000000017;
  *((_QWORD *)&v59 + 1) = 0x8000000236302870;
  v11 = APGetPreferredAuthenticationMechanismLocKey();
  sub_2362FF944();

  sub_2362FF974();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  v13 = APUILocStr(v12);

  sub_2362FF944();
  v14 = objc_allocWithZone((Class)type metadata accessor for APOnBoardingWelcomeController());
  v15 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  v16 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  v17 = (char *)objc_msgSend(v14, sel_initWithTitle_detailText_icon_contentLayout_, v15, v16, 0, 2);

  v18 = objc_msgSend(objc_allocWithZone((Class)APButtonTrayScrollViewAssistant), sel_initWithDelegate_, a2);
  v19 = *(void **)&v17[OBJC_IVAR____TtC15AppProtectionUI29APOnBoardingWelcomeController_assistant];
  *(_QWORD *)&v17[OBJC_IVAR____TtC15AppProtectionUI29APOnBoardingWelcomeController_assistant] = v18;

  v20 = objc_msgSend(a1, sel_application);
  objc_msgSend((id)objc_opt_self(), sel_metricsForEducation);
  v57 = v60;
  v58 = v59;
  v21 = v61;
  v22 = objc_allocWithZone((Class)APSymbolBadgedAppIconView);
  v23 = (void *)sub_2362FF938();
  v59 = v58;
  v60 = v57;
  v61 = v21;
  v24 = objc_msgSend(v22, sel_initWithApplication_symbolType_metrics_, v20, v23, &v59);

  objc_msgSend(v24, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v25 = objc_msgSend(v17, sel_headerView);
  v26 = objc_msgSend(v25, sel_customIconContainerView);

  objc_msgSend(v26, sel_addSubview_, v24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DBD70);
  v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_236300D50;
  v28 = objc_msgSend(v24, sel_centerXAnchor);
  v29 = objc_msgSend(v17, sel_headerView);
  v30 = objc_msgSend(v29, sel_customIconContainerView);

  if (!v30)
  {
    __break(1u);
    goto LABEL_13;
  }
  v31 = objc_msgSend(v30, sel_centerXAnchor);

  v32 = objc_msgSend(v28, sel_constraintEqualToAnchor_, v31);
  *(_QWORD *)(v27 + 32) = v32;
  v33 = objc_msgSend(v24, sel_centerYAnchor);
  v34 = objc_msgSend(v17, sel_headerView);
  v35 = objc_msgSend(v34, sel_customIconContainerView);

  if (!v35)
  {
LABEL_13:
    __break(1u);
    return;
  }
  v36 = (void *)objc_opt_self();
  v37 = objc_msgSend(v35, sel_centerYAnchor);

  v38 = objc_msgSend(v33, sel_constraintEqualToAnchor_, v37);
  *(_QWORD *)(v27 + 40) = v38;
  v39 = objc_msgSend(v24, sel_heightAnchor);
  v40 = objc_msgSend(v39, sel_constraintEqualToConstant_, 80.0);

  *(_QWORD *)(v27 + 48) = v40;
  v41 = objc_msgSend(v24, sel_widthAnchor);
  v42 = objc_msgSend(v41, sel_constraintEqualToConstant_, 80.0);

  *(_QWORD *)(v27 + 56) = v42;
  *(_QWORD *)&v59 = v27;
  sub_2362FF9A4();
  sub_2362F51D8(0, &qword_2563DBD90);
  v43 = (void *)sub_2362FF98C();
  swift_bridgeObjectRelease();
  objc_msgSend(v36, sel_activateConstraints_, v43);

  v44 = (void *)sub_2362FF938();
  v45 = APUILocStr(v44);

  if (!v45)
  {
    sub_2362FF944();
    v45 = (id)sub_2362FF938();
    swift_bridgeObjectRelease();
  }
  v46 = (void *)sub_2362FF938();
  v47 = APUILocStr(v46);

  if (!v47)
  {
    sub_2362FF944();
    v47 = (id)sub_2362FF938();
    swift_bridgeObjectRelease();
  }
  v48 = (void *)sub_2362FF938();
  objc_msgSend(v17, sel_addBulletedListItemWithTitle_description_symbolName_, v45, v47, v48);

  v49 = (void *)sub_2362FF938();
  v50 = APUILocStr(v49);

  if (!v50)
  {
    sub_2362FF944();
    v50 = (id)sub_2362FF938();
    swift_bridgeObjectRelease();
  }
  v51 = (void *)sub_2362FF938();
  v52 = APUILocStr(v51);

  if (!v52)
  {
    sub_2362FF944();
    v52 = (id)sub_2362FF938();
    swift_bridgeObjectRelease();
  }
  v53 = (void *)sub_2362FF938();
  objc_msgSend(v17, sel_addBulletedListItemWithTitle_description_symbolName_, v50, v52, v53);

  v54 = objc_msgSend(v17, sel_navigationItem);
  sub_2362F51D8(0, &qword_2563DBD98);
  sub_2362F51D8(0, &qword_2563DBD88);
  v55 = swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_2362FF9EC();
  v56 = (void *)sub_2362FF9C8();
  objc_msgSend(v54, sel_setRightBarButtonItem_, v56, 0, 0, 0, sub_2362FE7FC, v55);

}

void sub_2362FA6AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x23B7EFDEC](v2);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = v3 + OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_delegate;
    if (MEMORY[0x23B7EFDEC](v3 + OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_delegate))
    {
      v6 = *(_QWORD *)(v5 + 8);
      ObjectType = swift_getObjectType();
      (*(void (**)(void *, uint64_t, uint64_t))(v6 + 16))(v4, ObjectType, v6);

      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
}

id sub_2362FA74C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  __CFString *v7;
  void *v8;
  id v9;
  uint64_t v10;
  __CFString *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  id v39;
  __CFString *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  unint64_t v56;
  uint64_t v57;
  id v58;
  id result;
  uint64_t i;
  id v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  char v66;
  unint64_t aBlock;
  uint64_t v68;
  void (*v69)(uint64_t, void *);
  void *v70;
  void (*v71)(uint64_t);
  uint64_t v72;

  if ((sub_2362F417C() & 1) == 0)
  {
    v38 = (void *)sub_2362FF938();
    v39 = APUILocStr(v38);

    sub_2362FF944();
    sub_2362FF950();
    swift_bridgeObjectRelease();
    sub_2362FFA88();
    swift_bridgeObjectRelease();
    v40 = APGetPreferredAuthenticationMechanismLocKey();
    sub_2362FF944();

    sub_2362FF974();
    swift_bridgeObjectRelease();
    v41 = (void *)sub_2362FF938();
    swift_bridgeObjectRelease();
    v42 = APUILocStr(v41);

    sub_2362FF944();
    v43 = (void *)sub_2362FF938();
    swift_bridgeObjectRelease();
    v44 = (void *)sub_2362FF938();
    swift_bridgeObjectRelease();
    v16 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v43, v44, 1);

    objc_msgSend(v16, sel_setSeverity_, 1);
    v45 = (void *)sub_2362FF938();
    v46 = APUILocStr(v45);

    sub_2362FF944();
    v47 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    v48 = (void *)sub_2362FF938();
    swift_bridgeObjectRelease();
    v71 = sub_2362FDA50;
    v72 = v47;
    aBlock = MEMORY[0x24BDAC760];
    v68 = 1107296256;
    v69 = sub_2362FB944;
    v70 = &block_descriptor_1;
    v49 = _Block_copy(&aBlock);
    swift_release();
    v50 = (void *)objc_opt_self();
    v23 = objc_msgSend(v50, sel_actionWithTitle_style_handler_, v48, 0, v49);
    _Block_release(v49);
    swift_release();

    objc_msgSend(v16, sel_addAction_, v23);
    v51 = (void *)sub_2362FF938();
    v52 = APUILocStr(v51);

    sub_2362FF944();
    v53 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    v54 = (void *)sub_2362FF938();
    swift_bridgeObjectRelease();
    v71 = sub_2362FDA70;
    v72 = v53;
    aBlock = MEMORY[0x24BDAC760];
    v68 = 1107296256;
    v69 = sub_2362FB944;
    v70 = &block_descriptor_5;
    v55 = _Block_copy(&aBlock);
    swift_release();
    v30 = objc_msgSend(v50, sel_actionWithTitle_style_handler_, v54, 1, v55);
    _Block_release(v55);
    swift_release();

    objc_msgSend(v16, sel_addAction_, v30);
LABEL_16:

    return v16;
  }
  v66 = a4;
  sub_2362FFA88();
  swift_bridgeObjectRelease();
  v7 = APGetPreferredAuthenticationMechanismLocKey();
  sub_2362FF944();

  sub_2362FF974();
  swift_bridgeObjectRelease();
  sub_2362FF974();
  v8 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  v9 = APUILocStr(v8);

  sub_2362FF944();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DBD60);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_236300D40;
  *(_QWORD *)(v10 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v10 + 64) = sub_2362FDA88();
  *(_QWORD *)(v10 + 32) = a1;
  *(_QWORD *)(v10 + 40) = a2;
  swift_bridgeObjectRetain();
  sub_2362FF950();
  swift_bridgeObjectRelease();
  sub_2362FFA88();
  swift_bridgeObjectRelease();
  v11 = APGetPreferredAuthenticationMechanismLocKey();
  sub_2362FF944();

  sub_2362FF974();
  swift_bridgeObjectRelease();
  v12 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  v13 = APUILocStr(v12);

  sub_2362FF944();
  v14 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  v15 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  v16 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v14, v15, 1);

  objc_msgSend(v16, sel_setSeverity_, 1);
  v65 = (id)objc_opt_self();
  v17 = objc_msgSend(v65, sel_sharedManager);
  v18 = objc_msgSend(v17, sel_titleForEnablementAction_ofFeature_, 1, 1);

  sub_2362FF944();
  v19 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  v20 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  v71 = sub_2362FDACC;
  v72 = v19;
  aBlock = MEMORY[0x24BDAC760];
  v68 = 1107296256;
  v69 = sub_2362FB944;
  v70 = &block_descriptor_9_0;
  v21 = _Block_copy(&aBlock);
  swift_release();
  v22 = (void *)objc_opt_self();
  v23 = objc_msgSend(v22, sel_actionWithTitle_style_handler_, v20, 0, v21);
  _Block_release(v21);
  swift_release();

  v24 = (void *)sub_2362FF938();
  v25 = APUILocStr(v24);

  sub_2362FF944();
  v26 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  v27 = MEMORY[0x24BDAC760];
  v28 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  v71 = sub_2362FDA70;
  v72 = v26;
  aBlock = v27;
  v68 = 1107296256;
  v69 = sub_2362FB944;
  v70 = &block_descriptor_13;
  v29 = _Block_copy(&aBlock);
  swift_release();
  v30 = objc_msgSend(v22, sel_actionWithTitle_style_handler_, v28, 1, v29);
  _Block_release(v29);
  swift_release();

  if ((v66 & 1) != 0)
  {
    v31 = objc_msgSend(v65, sel_sharedManager);
    v32 = objc_msgSend(v31, sel_titleForEnablementAction_ofFeature_, 1, 2);

    sub_2362FF944();
    v33 = swift_allocObject();
    swift_unknownObjectWeakInit();
    swift_retain();
    v34 = (void *)sub_2362FF938();
    swift_bridgeObjectRelease();
    v71 = sub_2362FDAD4;
    v72 = v33;
    aBlock = v27;
    v68 = 1107296256;
    v69 = sub_2362FB944;
    v70 = &block_descriptor_17;
    v35 = _Block_copy(&aBlock);
    swift_release();
    v36 = objc_msgSend(v22, sel_actionWithTitle_style_handler_, v34, 0, v35);
    _Block_release(v35);
    swift_release();

    __swift_instantiateConcreteTypeFromMangledName(&qword_2563DBD70);
    v37 = swift_allocObject();
    *(_OWORD *)(v37 + 16) = xmmword_236300D70;
    *(_QWORD *)(v37 + 32) = v23;
    *(_QWORD *)(v37 + 40) = v36;
    *(_QWORD *)(v37 + 48) = v30;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2563DBD70);
    v37 = swift_allocObject();
    *(_OWORD *)(v37 + 16) = xmmword_236300D60;
    *(_QWORD *)(v37 + 32) = v23;
    *(_QWORD *)(v37 + 40) = v30;
  }
  aBlock = v37;
  sub_2362FF9A4();
  v56 = aBlock;
  if (!(aBlock >> 62))
  {
    v57 = *(_QWORD *)((aBlock & 0xFFFFFFFFFFFFF8) + 0x10);
    v58 = v23;
    result = v30;
    if (v57)
      goto LABEL_8;
LABEL_15:
    swift_bridgeObjectRelease();
    objc_msgSend(v16, sel_setPreferredAction_, v23);
    goto LABEL_16;
  }
  v63 = v23;
  v64 = v30;
  swift_bridgeObjectRetain();
  v57 = sub_2362FFAD0();
  result = (id)swift_bridgeObjectRelease();
  if (!v57)
    goto LABEL_15;
LABEL_8:
  if (v57 >= 1)
  {
    for (i = 0; i != v57; ++i)
    {
      if ((v56 & 0xC000000000000001) != 0)
        v61 = (id)MEMORY[0x23B7EF7F8](i, v56);
      else
        v61 = *(id *)(v56 + 8 * i + 32);
      v62 = v61;
      objc_msgSend(v16, sel_addAction_, v61);

    }
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

void sub_2362FB278(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD aBlock[6];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DBD78);
  MEMORY[0x24BDAC7A8](v3, v4);
  v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC15A0]), sel_init);
  objc_msgSend(v7, sel_setSensitive_, 1);
  v8 = objc_msgSend((id)objc_opt_self(), sel_defaultWorkspace);
  if (v8)
  {
    v9 = v8;
    sub_2362FF89C();
    v10 = sub_2362FF8A8();
    v11 = *(_QWORD *)(v10 - 8);
    v12 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v6, 1, v10) != 1)
    {
      v12 = (void *)sub_2362FF890();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v10);
    }
    v13 = swift_allocObject();
    swift_beginAccess();
    v14 = (void *)MEMORY[0x23B7EFDEC](a2 + 16);
    swift_unknownObjectWeakInit();
    v15 = v7;

    aBlock[4] = sub_2362FE874;
    aBlock[5] = v13;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2362FB8B0;
    aBlock[3] = &block_descriptor_77;
    v16 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v9, sel_openURL_configuration_completionHandler_, v12, v15, v16);
    _Block_release(v16);

  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2362FB488(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  _QWORD *v21;
  id v22;
  uint64_t v23;
  _QWORD *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD aBlock[6];

  v5 = sub_2362FF8F0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5, v7);
  v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2362FF908();
  v34 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10, v11);
  v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    v33 = v10;
    if (qword_2563DBAD0 != -1)
      swift_once();
    v14 = sub_2362FF8E4();
    __swift_project_value_buffer(v14, (uint64_t)qword_2563DBE80);
    v15 = a2;
    v16 = a2;
    v17 = sub_2362FF8CC();
    v18 = sub_2362FF9B0();
    if (os_log_type_enabled(v17, v18))
    {
      v30 = a3;
      v19 = (uint8_t *)swift_slowAlloc();
      v20 = swift_slowAlloc();
      v31 = v6;
      v21 = (_QWORD *)v20;
      v32 = v5;
      *(_DWORD *)v19 = 138412290;
      v22 = a2;
      v23 = _swift_stdlib_bridgeErrorToNSError();
      aBlock[0] = v23;
      v5 = v32;
      sub_2362FFA64();
      *v21 = v23;
      a3 = v30;

      _os_log_impl(&dword_2362EA000, v17, v18, "Error opening passcode settings %@", v19, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2563DBD80);
      swift_arrayDestroy();
      v24 = v21;
      v6 = v31;
      MEMORY[0x23B7EFDA4](v24, -1, -1);
      MEMORY[0x23B7EFDA4](v19, -1, -1);
    }
    else
    {

    }
    v10 = v33;
  }
  sub_2362F51D8(0, (unint64_t *)&unk_2563DBDA0);
  v25 = (void *)sub_2362FF9D4();
  v26 = swift_allocObject();
  swift_beginAccess();
  v27 = (void *)MEMORY[0x23B7EFDEC](a3 + 16);
  swift_unknownObjectWeakInit();

  aBlock[4] = sub_2362FE87C;
  aBlock[5] = v26;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2362F5F24;
  aBlock[3] = &block_descriptor_81;
  v28 = _Block_copy(aBlock);
  swift_release();
  sub_2362FF8FC();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_2362F5218();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DBDB0);
  sub_2362F52A0();
  sub_2362FFA7C();
  MEMORY[0x23B7EF738](0, v13, v9, v28);
  _Block_release(v28);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v13, v10);
}

void sub_2362FB824(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = a1 + 16;
  swift_beginAccess();
  v2 = (void *)MEMORY[0x23B7EFDEC](v1);
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(v2, sel_delegate);
    if (v4)
    {
      objc_msgSend(v4, sel_educationViewControllerRequestsDismissal_withResult_, v3, 0);

      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
}

uint64_t sub_2362FB8B0(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v4)(uint64_t, void *);
  uint64_t v5;
  id v6;

  v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
    v5 = sub_2362FF914();
  else
    v5 = 0;
  swift_retain();
  v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_2362FB944(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void sub_2362FB994(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD aBlock[6];

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x23B7EFDEC](v2);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_delegate);
    if (v5)
    {
      v6 = v5;
      v7 = swift_allocObject();
      *(_QWORD *)(v7 + 16) = v4;
      aBlock[4] = sub_2362FE804;
      aBlock[5] = v7;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_2362F9DA0;
      aBlock[3] = &block_descriptor_53;
      v8 = _Block_copy(aBlock);
      v9 = v4;
      swift_release();
      objc_msgSend(v6, sel_educationViewController_requestAuthenticationWithCompletion_, v9, v8);
      swift_unknownObjectRelease();
      _Block_release(v8);
    }

  }
}

void sub_2362FBAA4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x23B7EFDEC](v2);
  if (v3)
  {
    v4 = (void *)v3;
    sub_2362FD358();

  }
}

id sub_2362FBAF4()
{
  __CFString *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[6];

  sub_2362FFA88();
  swift_bridgeObjectRelease();
  v0 = APGetPreferredAuthenticationMechanismLocKey();
  sub_2362FF944();

  sub_2362FF974();
  swift_bridgeObjectRelease();
  v1 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  v2 = APUILocStr(v1);

  sub_2362FF944();
  v3 = (void *)sub_2362FF938();
  v4 = APUILocStr(v3);

  sub_2362FF944();
  v5 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  v6 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v5, v6, 1, 0xD000000000000025, 0x8000000236302980);

  v8 = (void *)sub_2362FF938();
  v9 = APUILocStr(v8);

  sub_2362FF944();
  v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  v11 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  v15[4] = sub_2362FDA70;
  v15[5] = v10;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 1107296256;
  v15[2] = sub_2362FB944;
  v15[3] = &block_descriptor_47;
  v12 = _Block_copy(v15);
  swift_release();
  v13 = objc_msgSend((id)objc_opt_self(), sel_actionWithTitle_style_handler_, v11, 0, v12);
  _Block_release(v12);
  swift_release();

  objc_msgSend(v7, sel_addAction_, v13);
  return v7;
}

id sub_2362FBDBC(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *);
  void *v29;
  void (*v30)(uint64_t);
  uint64_t v31;

  v4 = (void *)sub_2362FF938();
  v5 = APUILocStr(v4);

  sub_2362FF944();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2563DBD60);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_236300D40;
  *(_QWORD *)(v6 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v6 + 64) = sub_2362FDA88();
  *(_QWORD *)(v6 + 32) = a1;
  *(_QWORD *)(v6 + 40) = a2;
  swift_bridgeObjectRetain();
  sub_2362FF950();
  swift_bridgeObjectRelease();
  v7 = (void *)sub_2362FF938();
  v8 = APUILocStr(v7);

  sub_2362FF944();
  v9 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v9, v10, 1);

  v12 = (void *)sub_2362FF938();
  v13 = APUILocStr(v12);

  sub_2362FF944();
  v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  v15 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  v30 = sub_2362FDB08;
  v31 = v14;
  v26 = MEMORY[0x24BDAC760];
  v27 = 1107296256;
  v28 = sub_2362FB944;
  v29 = &block_descriptor_29;
  v16 = _Block_copy(&v26);
  swift_release();
  v17 = (void *)objc_opt_self();
  v18 = objc_msgSend(v17, sel_actionWithTitle_style_handler_, v15, 0, v16);
  _Block_release(v16);
  swift_release();

  objc_msgSend(v11, sel_addAction_, v18);
  v19 = (void *)sub_2362FF938();
  v20 = APUILocStr(v19);

  sub_2362FF944();
  v21 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  v22 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  v30 = sub_2362FDA70;
  v31 = v21;
  v26 = MEMORY[0x24BDAC760];
  v27 = 1107296256;
  v28 = sub_2362FB944;
  v29 = &block_descriptor_33;
  v23 = _Block_copy(&v26);
  swift_release();
  v24 = objc_msgSend(v17, sel_actionWithTitle_style_handler_, v22, 0, v23);
  _Block_release(v23);
  swift_release();

  objc_msgSend(v11, sel_addAction_, v24);
  return v11;
}

void sub_2362FC1CC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD aBlock[6];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2563DBD78);
  MEMORY[0x24BDAC7A8](v3, v4);
  v6 = (char *)&aBlock[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDC15A0]), sel_init);
  objc_msgSend(v7, sel_setSensitive_, 1);
  v8 = objc_msgSend((id)objc_opt_self(), sel_defaultWorkspace);
  if (v8)
  {
    v9 = v8;
    sub_2362FF89C();
    v10 = sub_2362FF8A8();
    v11 = *(_QWORD *)(v10 - 8);
    v12 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v6, 1, v10) != 1)
    {
      v12 = (void *)sub_2362FF890();
      (*(void (**)(char *, uint64_t))(v11 + 8))(v6, v10);
    }
    v13 = swift_allocObject();
    swift_beginAccess();
    v14 = (void *)MEMORY[0x23B7EFDEC](a2 + 16);
    swift_unknownObjectWeakInit();
    v15 = v7;

    aBlock[4] = sub_2362FDB10;
    aBlock[5] = v13;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2362FB8B0;
    aBlock[3] = &block_descriptor_37;
    v16 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v9, sel_openURL_configuration_completionHandler_, v12, v15, v16);
    _Block_release(v16);

  }
  else
  {
    __break(1u);
  }
}

void sub_2362FC3E4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;

  v3 = a3 + 16;
  if (a2)
  {
    if (qword_2563DBAD0 != -1)
      swift_once();
    v5 = sub_2362FF8E4();
    __swift_project_value_buffer(v5, (uint64_t)qword_2563DBE80);
    v6 = a2;
    v7 = a2;
    v8 = sub_2362FF8CC();
    v9 = sub_2362FF9B0();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v10 = 138412290;
      v12 = a2;
      v16 = _swift_stdlib_bridgeErrorToNSError();
      sub_2362FFA64();
      *v11 = v16;

      _os_log_impl(&dword_2362EA000, v8, v9, "Error opening notifications settings %@", v10, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2563DBD80);
      swift_arrayDestroy();
      MEMORY[0x23B7EFDA4](v11, -1, -1);
      MEMORY[0x23B7EFDA4](v10, -1, -1);
    }
    else
    {

    }
  }
  swift_beginAccess();
  v13 = (void *)MEMORY[0x23B7EFDEC](v3);
  if (v13)
  {
    v14 = v13;
    v15 = objc_msgSend(v13, sel_delegate);
    if (v15)
    {
      objc_msgSend(v15, sel_educationViewControllerRequestsDismissal_withResult_, v14, 0);

      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
}

id sub_2362FC5FC()
{
  __CFString *v0;
  void *v1;
  id v2;
  __CFString *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[6];

  sub_2362FFA88();
  swift_bridgeObjectRelease();
  v0 = APGetPreferredAuthenticationMechanismLocKey();
  sub_2362FF944();

  sub_2362FF974();
  swift_bridgeObjectRelease();
  v1 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  v2 = APUILocStr(v1);

  sub_2362FF944();
  sub_2362FFA88();
  swift_bridgeObjectRelease();
  v3 = APGetPreferredAuthenticationMechanismLocKey();
  sub_2362FF944();

  sub_2362FF974();
  swift_bridgeObjectRelease();
  v4 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  v5 = APUILocStr(v4);

  sub_2362FF944();
  v6 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  v7 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend((id)objc_opt_self(), sel_alertControllerWithTitle_message_preferredStyle_, v6, v7, 1, 0xD00000000000002ALL, 0x8000000236302A00);

  v9 = (void *)sub_2362FF938();
  v10 = APUILocStr(v9);

  sub_2362FF944();
  v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  v12 = (void *)sub_2362FF938();
  swift_bridgeObjectRelease();
  v16[4] = sub_2362FDA70;
  v16[5] = v11;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 1107296256;
  v16[2] = sub_2362FB944;
  v16[3] = &block_descriptor_73;
  v13 = _Block_copy(v16);
  swift_release();
  v14 = objc_msgSend((id)objc_opt_self(), sel_actionWithTitle_style_handler_, v12, 0, v13);
  _Block_release(v13);
  swift_release();

  objc_msgSend(v8, sel_addAction_, v14);
  return v8;
}

void sub_2362FC928(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x23B7EFDEC](v2);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_delegate);
    if (v5)
    {
      objc_msgSend(v5, sel_educationViewControllerRequestsDismissal_withResult_, v4, 0);

      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
}

char *sub_2362FC9F0(void *a1)
{
  char *v1;
  id v3;
  char *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  char v29;
  char *v30;
  uint64_t v31;
  char *v32;
  id v33;
  void *v34;
  char *v35;
  objc_super v37;
  id v38[2];

  v38[1] = *(id *)MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v1[OBJC_IVAR___APEducationFlowViewController_initialAlertController] = 0;
  swift_unknownObjectWeakInit();
  v3 = objc_allocWithZone(MEMORY[0x24BE04320]);
  v4 = v1;
  v5 = objc_msgSend(v3, sel_initWithApplication_, a1);
  v6 = OBJC_IVAR___APEducationFlowViewController_lazyRecordApp;
  *(_QWORD *)&v4[OBJC_IVAR___APEducationFlowViewController_lazyRecordApp] = v5;
  v7 = objc_msgSend(v5, sel_localizedName);
  v8 = sub_2362FF944();
  v10 = v9;

  v11 = objc_msgSend(a1, sel_bundleIdentifier);
  v12 = sub_2362FF944();
  v14 = v13;

  if (v12 == 0xD000000000000012 && v14 == 0x80000002363026F0)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = sub_2362FFAE8();
    swift_bridgeObjectRelease();
    if ((v15 & 1) == 0)
      goto LABEL_6;
  }
  swift_bridgeObjectRelease();
  v16 = (void *)sub_2362FF938();
  v17 = APUILocStr(v16);

  v8 = sub_2362FF944();
  v10 = v18;

LABEL_6:
  v19 = *(void **)&v4[v6];
  v38[0] = 0;
  v20 = objc_msgSend(v19, sel_loadRecordWithError_, v38);
  if (v20)
  {
    v21 = v20;
    v22 = v38[0];

  }
  else
  {
    v23 = v38[0];
    v24 = (void *)sub_2362FF884();

    swift_willThrow();
  }
  v25 = *(void **)&v4[v6];
  objc_msgSend(v25, sel_detach);
  v26 = objc_msgSend(objc_allocWithZone((Class)APWrappingView), sel_init);
  *(_QWORD *)&v4[OBJC_IVAR___APEducationFlowViewController_containerView] = v26;
  v27 = objc_msgSend((id)objc_opt_self(), sel_sharedManager);
  v28 = objc_msgSend(v25, sel_application);
  v29 = objc_msgSend(v27, sel_canChangeHiddenStatusOfSubject_, v28);

  v37.receiver = v4;
  v37.super_class = (Class)APEducationFlowViewController;
  v30 = (char *)objc_msgSendSuper2(&v37, sel_initWithNibName_bundle_, 0, 0);
  v31 = *(_QWORD *)&v30[OBJC_IVAR___APEducationFlowViewController_containerView];
  v32 = v30;
  objc_msgSend(v32, sel_setView_, v31);
  v33 = sub_2362FA74C(v8, v10, (uint64_t)v32, v29);
  swift_bridgeObjectRelease();
  v34 = *(void **)&v32[OBJC_IVAR___APEducationFlowViewController_initialAlertController];
  *(_QWORD *)&v32[OBJC_IVAR___APEducationFlowViewController_initialAlertController] = v33;

  v35 = v32;
  objc_msgSend(v35, sel_setModalPresentationStyle_, 0);

  return v35;
}

void __swiftcall APEducationFlowViewController.init(coder:)(APEducationFlowViewController_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

void APEducationFlowViewController.init(coder:)()
{
  char *v0;

  *(_QWORD *)&v0[OBJC_IVAR___APEducationFlowViewController_initialAlertController] = 0;
  swift_unknownObjectWeakInit();

  sub_2362FFAC4();
  __break(1u);
}

Swift::Void __swiftcall APEducationFlowViewController.viewDidAppear(_:)(Swift::Bool a1)
{
  char *v1;
  uint64_t v2;

  v2 = *(_QWORD *)&v1[OBJC_IVAR___APEducationFlowViewController_initialAlertController];
  if (v2)
    objc_msgSend(v1, sel_presentViewController_animated_completion_, v2, 1, 0);
  else
    __break(1u);
}

void __swiftcall APEducationFlowViewController.init(nibName:bundle:)(APEducationFlowViewController *__return_ptr retstr, Swift::String_optional nibName, NSBundle_optional bundle)
{
  Class isa;
  void *v4;

  isa = bundle.value.super.isa;
  if (nibName.value._object)
  {
    v4 = (void *)sub_2362FF938();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithNibName_bundle_, v4, isa);

}

void APEducationFlowViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_2362FD06C(char a1, uint64_t a2, char *a3)
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  char *v10;
  char *v11;
  char *v12;
  id v13;

  if ((a1 & 1) == 0)
  {
    v13 = sub_2362FBAF4();
    objc_msgSend(a3, sel_presentViewController_animated_completion_, v13, 1, 0);
    goto LABEL_7;
  }
  v4 = objc_msgSend((id)objc_opt_self(), sel_sharedManager);
  v5 = *(void **)&a3[OBJC_IVAR___APEducationFlowViewController_lazyRecordApp];
  v6 = objc_msgSend(v5, sel_bundleIdentifier);
  if (!v6)
  {
    sub_2362FF944();
    v6 = (id)sub_2362FF938();
    swift_bridgeObjectRelease();
  }
  v7 = objc_msgSend(v4, sel_TCCServicesForBundleIdentifier_, v6);

  v8 = sub_2362FF998();
  if (*(_QWORD *)(v8 + 16))
  {
    v9 = objc_msgSend(v5, sel_application);
    v10 = (char *)objc_allocWithZone((Class)type metadata accessor for APLockedAppDisclosureViewController());
    v11 = a3;
    v12 = sub_2362FDB18(v9, v8, v11, v10);
    v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6E420]), sel_initWithRootViewController_, v12);
    objc_msgSend(v13, sel_setModalInPresentation_, 1);
    objc_msgSend(v11, sel_presentViewController_animated_completion_, v13, 1, 0);

LABEL_7:
    return;
  }
  swift_bridgeObjectRelease();
  sub_2362FD244();
}

void sub_2362FD244()
{
  char *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  char *v6;
  _QWORD v7[6];

  v1 = objc_msgSend(v0, sel_delegate);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(*(id *)&v0[OBJC_IVAR___APEducationFlowViewController_lazyRecordApp], sel_application);
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v0;
    v7[4] = sub_2362FE86C;
    v7[5] = v4;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 1107296256;
    v7[2] = sub_2362F9DA0;
    v7[3] = &block_descriptor_69;
    v5 = _Block_copy(v7);
    v6 = v0;
    swift_release();
    objc_msgSend(v2, sel_educationViewController_requestLockOfApplication_completion_, v6, v3, v5);
    swift_unknownObjectRelease();
    _Block_release(v5);

  }
}

void sub_2362FD358()
{
  char *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  char *v15;
  id v16;
  id v17;
  _QWORD aBlock[6];

  v1 = objc_msgSend((id)objc_opt_self(), sel_currentNotificationSettingsCenter);
  v2 = *(void **)&v0[OBJC_IVAR___APEducationFlowViewController_lazyRecordApp];
  v3 = objc_msgSend(v2, sel_bundleIdentifier);
  if (!v3)
  {
    sub_2362FF944();
    v3 = (id)sub_2362FF938();
    swift_bridgeObjectRelease();
  }
  v17 = objc_msgSend(v1, sel_sourceWithIdentifier_, v3);

  if (v17
    && (v4 = objc_msgSend(v17, sel_sourceSettings),
        v5 = objc_msgSend(v4, sel_notificationSettings),
        v4,
        v6 = objc_msgSend(v5, sel_criticalAlertSetting),
        v5,
        v6 == (id)2))
  {
    v7 = objc_msgSend(v2, sel_localizedName);
    v8 = sub_2362FF944();
    v10 = v9;

    v16 = sub_2362FBDBC(v8, v10);
    swift_bridgeObjectRelease();
    objc_msgSend(v0, sel_presentViewController_animated_completion_, v16, 1, 0);

  }
  else
  {
    v11 = objc_msgSend(v0, sel_delegate);
    if (v11)
    {
      v12 = v11;
      v13 = swift_allocObject();
      *(_QWORD *)(v13 + 16) = v0;
      aBlock[4] = sub_2362FDB00;
      aBlock[5] = v13;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_2362F9DA0;
      aBlock[3] = &block_descriptor_23;
      v14 = _Block_copy(aBlock);
      v15 = v0;
      swift_release();
      objc_msgSend(v12, sel_educationViewController_requestAuthenticationWithCompletion_, v15, v14);
      swift_unknownObjectRelease();

      _Block_release(v14);
    }
    else
    {

    }
  }
}

void sub_2362FD5C8(char a1, uint64_t a2, char *a3)
{
  void *v4;
  char *v5;
  void *v6;
  id v7;

  if ((a1 & 1) != 0)
  {
    v4 = *(void **)&a3[OBJC_IVAR___APEducationFlowViewController_lazyRecordApp];
    v5 = (char *)objc_allocWithZone((Class)type metadata accessor for APHiddenAppConfirmationViewController());
    sub_2362FE214(v4, a3, v5);
    v7 = v6;
    objc_msgSend(v6, sel_setModalInPresentation_, 1);
  }
  else
  {
    v7 = sub_2362FBAF4();
  }
  objc_msgSend(a3, sel_presentViewController_animated_completion_, v7, 1, 0);

}

void sub_2362FD674(char *a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  char *v7;
  _QWORD v8[6];

  v2 = objc_msgSend(a1, sel_delegate);
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend(*(id *)&a1[OBJC_IVAR___APEducationFlowViewController_lazyRecordApp], sel_application);
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = a1;
    v8[4] = sub_2362FE9A0;
    v8[5] = v5;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 1107296256;
    v8[2] = sub_2362F9DA0;
    v8[3] = &block_descriptor_100;
    v6 = _Block_copy(v8);
    v7 = a1;
    swift_release();
    objc_msgSend(v3, sel_educationViewController_requestHideOfApplication_completion_, v7, v4, v6);
    swift_unknownObjectRelease();
    _Block_release(v6);

  }
}

void sub_2362FD788(char a1, int a2, id a3)
{
  id v4;
  id v5;

  if ((a1 & 1) != 0)
  {
    v4 = objc_msgSend(a3, sel_delegate);
    if (v4)
    {
      objc_msgSend(v4, sel_educationViewControllerRequestsDismissal_withResult_, a3, 2);
      swift_unknownObjectRelease();
    }
  }
  else
  {
    v5 = sub_2362FC5FC();
    objc_msgSend(a3, sel_presentViewController_animated_completion_, v5, 1, 0);

  }
}

void sub_2362FD834(char a1, int a2, id a3)
{
  id v4;
  id v5;

  if ((a1 & 1) != 0)
  {
    v4 = objc_msgSend(a3, sel_delegate);
    if (v4)
    {
      objc_msgSend(v4, sel_educationViewControllerRequestsDismissal_withResult_, a3, 1);
      swift_unknownObjectRelease();
    }
  }
  else
  {
    v5 = sub_2362FC5FC();
    objc_msgSend(a3, sel_presentViewController_animated_completion_, v5, 1, 0);

  }
}

void sub_2362FD8E0()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v6[6];

  v1 = objc_msgSend(v0, sel_presentedViewController);
  if (v1)
  {
    v2 = v1;
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = v0;
    v6[4] = sub_2362FE998;
    v6[5] = v3;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 1107296256;
    v6[2] = sub_2362F5F24;
    v6[3] = &block_descriptor_94;
    v4 = _Block_copy(v6);
    v5 = v0;
    swift_release();
    objc_msgSend(v2, sel_dismissViewControllerAnimated_completion_, 1, v4);
    _Block_release(v4);

  }
}

id sub_2362FD9B8()
{
  void *v0;
  id result;

  result = objc_msgSend(v0, sel_delegate);
  if (result)
  {
    objc_msgSend(result, sel_educationViewControllerRequestsDismissal_withResult_, v0, 0);
    return (id)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t type metadata accessor for APEducationFlowViewController(uint64_t a1)
{
  return sub_2362F51D8(a1, &qword_2563DBD58);
}

uint64_t sub_2362FDA2C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_2362FDA50(uint64_t a1)
{
  uint64_t v1;

  sub_2362FB278(a1, v1);
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

void sub_2362FDA70(uint64_t a1)
{
  uint64_t v1;

  sub_2362FC928(a1, v1);
}

unint64_t sub_2362FDA88()
{
  unint64_t result;

  result = qword_2563DBD68;
  if (!qword_2563DBD68)
  {
    result = MEMORY[0x23B7EFD50](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2563DBD68);
  }
  return result;
}

void sub_2362FDACC(uint64_t a1)
{
  uint64_t v1;

  sub_2362FB994(a1, v1);
}

void sub_2362FDAD4(uint64_t a1)
{
  uint64_t v1;

  sub_2362FBAA4(a1, v1);
}

uint64_t sub_2362FDADC()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_2362FDB00(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_2362FD5C8(a1, a2, *(char **)(v2 + 16));
}

void sub_2362FDB08(uint64_t a1)
{
  uint64_t v1;

  sub_2362FC1CC(a1, v1);
}

void sub_2362FDB10(uint64_t a1, void *a2)
{
  uint64_t v2;

  sub_2362FC3E4(a1, a2, v2);
}

char *sub_2362FDB18(void *a1, uint64_t a2, void *a3, char *a4)
{
  uint64_t v7;
  id v8;
  char *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  char *v24;
  void *v25;
  char *v26;
  id v27;
  char *v28;
  id v29;
  uint64_t v30;
  void *v31;
  char *result;
  char *v33;
  char *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  char *v49;
  id v50;
  char *v51;
  char *v52;
  id v53;
  uint64_t v54;
  void *v55;
  id v56;
  char *v57;
  uint64_t v58;
  id v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  objc_super v70;

  v7 = OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_scrollViewAssistant;
  v8 = objc_allocWithZone((Class)APButtonTrayScrollViewAssistant);
  v9 = a4;
  *(_QWORD *)&a4[v7] = objc_msgSend(v8, sel_init);
  v10 = OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_button;
  v11 = (void *)sub_2362FF938();
  v12 = APUILocStr(v11);

  v13 = sub_2362FF944();
  v15 = v14;

  v16 = sub_2362F9A8C(v13, v15);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v9[v10] = v16;
  *(_QWORD *)&v9[OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_delegate + 8] = 0;
  *(_QWORD *)(swift_unknownObjectWeakInit() + 8) = &off_25079F860;
  v69 = a3;
  swift_unknownObjectWeakAssign();
  v17 = *(void **)&a4[v7];
  v18 = objc_allocWithZone((Class)APTCCDisclosureController);
  v19 = a1;
  v20 = v17;
  v21 = (void *)sub_2362FF98C();
  swift_bridgeObjectRelease();
  v22 = objc_msgSend(v18, sel_initWithApplication_TCCServices_includeDoneButton_scrollViewAssistant_, v19, v21, 0, v20);

  *(_QWORD *)&v9[OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_tccController] = v22;
  v23 = v22;
  objc_msgSend(v23, sel_beginLoadUsers);

  v70.receiver = v9;
  v70.super_class = (Class)type metadata accessor for APLockedAppDisclosureViewController();
  v24 = (char *)objc_msgSendSuper2(&v70, sel_initWithNibName_bundle_, 0, 0);
  v25 = *(void **)&v24[OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_scrollViewAssistant];
  v26 = v24;
  objc_msgSend(v25, sel_setDelegate_, v26);
  v27 = objc_allocWithZone((Class)type metadata accessor for APWelcomeControllerWithBraveButtonTrayView());
  v28 = v26;
  v29 = objc_msgSend(v27, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v28, sel_setView_, v29);

  v30 = OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_tccController;
  v31 = *(void **)&v28[OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_tccController];
  objc_msgSend(v28, sel_addChildViewController_, v31);
  result = (char *)objc_msgSend(v31, sel_view);
  if (!result)
  {
    __break(1u);
    goto LABEL_12;
  }
  v33 = result;
  result = (char *)objc_msgSend(v28, sel_view);
  if (!result)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v34 = result;
  objc_msgSend(result, sel_bounds);
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;

  objc_msgSend(v33, sel_setFrame_, v36, v38, v40, v42);
  result = (char *)objc_msgSend(v28, sel_view);
  if (!result)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v43 = result;
  result = (char *)objc_msgSend(*(id *)&v28[v30], sel_view);
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v44 = result;
  v68 = v19;
  objc_msgSend(v43, sel_addSubview_, result);

  objc_msgSend(*(id *)&v28[v30], sel_didMoveToParentViewController_, v28);
  sub_2362F51D8(0, &qword_2563DBD88);
  v45 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v46 = sub_2362FF9EC();
  v47 = OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_button;
  v67 = (void *)v46;
  objc_msgSend(*(id *)&v28[OBJC_IVAR____TtC15AppProtectionUI35APLockedAppDisclosureViewController_button], sel_addAction_forControlEvents_, 0, 0, 0, sub_2362FE80C, v45);
  result = (char *)objc_msgSend(v28, sel_view);
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v48 = result;
  v49 = (char *)objc_retain(*(id *)(swift_dynamicCastClassUnconditional()
                                  + OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_buttonTray));

  v50 = *(id *)&v28[v47];
  objc_msgSend(v50, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(*(id *)&v49[OBJC_IVAR____TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray_stack], sel_addArrangedSubview_, v50);

  result = (char *)objc_msgSend(v28, sel_view);
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v51 = result;
  v52 = (char *)swift_dynamicCastClassUnconditional();
  v53 = objc_msgSend(*(id *)&v28[v30], sel_view);
  v54 = OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeView;
  v55 = *(void **)&v52[OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeView];
  *(_QWORD *)&v52[OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeView] = v53;
  v56 = v53;

  if (*(_QWORD *)&v52[v54])
    objc_msgSend(v52, sel_insertSubview_aboveSubview_, *(_QWORD *)&v52[OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_buttonTray]);

  result = (char *)objc_msgSend(v28, sel_view);
  if (result)
  {
    v57 = result;
    v58 = swift_dynamicCastClassUnconditional();
    v59 = objc_msgSend(*(id *)&v28[v30], sel_scrollView);
    v60 = *(void **)(v58
                   + OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeScrollView);
    *(_QWORD *)(v58 + OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeScrollView) = v59;

    v61 = objc_msgSend(v28, sel_navigationItem);
    sub_2362F51D8(0, &qword_2563DBD98);
    v62 = swift_allocObject();
    *(_QWORD *)(v62 + 24) = &off_25079F860;
    swift_unknownObjectWeakInit();
    v63 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v64 = swift_allocObject();
    *(_QWORD *)(v64 + 16) = v63;
    *(_QWORD *)(v64 + 24) = v62;
    v66 = v64;
    sub_2362FF9EC();
    v65 = (void *)sub_2362FF9C8();
    objc_msgSend(v61, sel_setRightBarButtonItem_, v65, 0, 0, 0, sub_2362FE864, v66);

    return v28;
  }
LABEL_17:
  __break(1u);
  return result;
}

void sub_2362FE214(void *a1, void *a2, char *a3)
{
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  id v17;
  char *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  id v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  id v49;
  void *v50;
  char *v51;
  id v52;
  id v53;
  void *v54;
  char *v55;
  void *v56;
  id v57;
  uint64_t v58;
  void *v59;
  id v60;
  id v61;
  void *v62;
  uint64_t v63;
  void *v64;
  id v65;
  void *v66;
  uint64_t v67;
  void *v68;
  objc_super v69;

  *(_QWORD *)&a3[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_welcomeController] = 0;
  *(_QWORD *)&a3[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_navController] = 0;
  v6 = OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_button;
  v7 = a3;
  v8 = (void *)sub_2362FF938();
  v9 = APUILocStr(v8);

  v10 = sub_2362FF944();
  v12 = v11;

  v13 = sub_2362F9A8C(v10, v12);
  swift_bridgeObjectRelease();
  *(_QWORD *)&a3[v6] = v13;
  v14 = &v7[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_delegate];
  *(_QWORD *)&v7[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v15 = objc_msgSend(a1, sel_application);
  *(_QWORD *)&v7[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_app] = v15;
  *((_QWORD *)v14 + 1) = &off_25079F848;
  swift_unknownObjectWeakAssign();

  v69.receiver = v7;
  v69.super_class = (Class)type metadata accessor for APHiddenAppConfirmationViewController();
  v16 = objc_msgSendSuper2(&v69, sel_initWithNibName_bundle_, 0, 0);
  v17 = objc_allocWithZone((Class)type metadata accessor for APWelcomeControllerWithBraveButtonTrayView());
  v18 = (char *)v16;
  v19 = objc_msgSend(v17, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  objc_msgSend(v18, sel_setView_, v19);

  sub_2362F9E00(a1, (uint64_t)v18);
  v20 = OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_welcomeController;
  v21 = *(void **)&v18[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_welcomeController];
  *(_QWORD *)&v18[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_welcomeController] = v22;

  v23 = *(_QWORD *)&v18[v20];
  if (!v23)
  {
    __break(1u);
    goto LABEL_19;
  }
  v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6E420]), sel_initWithRootViewController_, v23);
  v25 = OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_navController;
  v26 = *(void **)&v18[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_navController];
  *(_QWORD *)&v18[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_navController] = v24;

  if (!*(_QWORD *)&v18[v25])
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  objc_msgSend(v18, sel_addChildViewController_);
  v27 = *(void **)&v18[v25];
  if (!v27)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v28 = objc_msgSend(v27, sel_view);
  if (!v28)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v29 = v28;
  v30 = objc_msgSend(v18, sel_view);
  if (!v30)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v31 = v30;
  objc_msgSend(v30, sel_bounds);
  v33 = v32;
  v35 = v34;
  v37 = v36;
  v39 = v38;

  objc_msgSend(v29, sel_setFrame_, v33, v35, v37, v39);
  v40 = objc_msgSend(v18, sel_view);
  if (!v40)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v41 = v40;
  v42 = *(void **)&v18[v25];
  if (!v42)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v43 = objc_msgSend(v42, sel_view);
  if (!v43)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v44 = v43;
  v68 = a2;
  objc_msgSend(v41, sel_addSubview_, v43);

  v45 = *(void **)&v18[v25];
  if (!v45)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  objc_msgSend(v45, sel_didMoveToParentViewController_, v18);
  sub_2362F51D8(0, &qword_2563DBD88);
  v46 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v47 = (void *)sub_2362FF9EC();
  v48 = OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_button;
  objc_msgSend(*(id *)&v18[OBJC_IVAR____TtC15AppProtectionUI37APHiddenAppConfirmationViewController_button], sel_addAction_forControlEvents_, v47, 0x2000, 0, 0, 0, sub_2362FE7F4, v46);
  v49 = objc_msgSend(v18, sel_view);
  if (!v49)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v50 = v49;
  v67 = v20;
  v51 = (char *)objc_retain(*(id *)(swift_dynamicCastClassUnconditional()
                                  + OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_buttonTray));

  v52 = *(id *)&v18[v48];
  objc_msgSend(v52, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(*(id *)&v51[OBJC_IVAR____TtC15AppProtectionUI45APBraveAndIconoclasticSafeAreaUsingButtonTray_stack], sel_addArrangedSubview_, v52);

  v53 = objc_msgSend(v18, sel_view);
  if (!v53)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v54 = v53;
  v55 = (char *)swift_dynamicCastClassUnconditional();
  v56 = *(void **)&v18[v25];
  if (!v56)
  {
LABEL_29:
    __break(1u);
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  v57 = objc_msgSend(v56, sel_view);
  v58 = OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeView;
  v59 = *(void **)&v55[OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeView];
  *(_QWORD *)&v55[OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeView] = v57;
  v60 = v57;

  if (*(_QWORD *)&v55[v58])
    objc_msgSend(v55, sel_insertSubview_aboveSubview_, *(_QWORD *)&v55[OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_buttonTray]);

  v61 = objc_msgSend(v18, sel_view);
  if (!v61)
    goto LABEL_30;
  v62 = v61;
  v63 = swift_dynamicCastClassUnconditional();
  v64 = *(void **)&v18[v67];
  if (v64)
  {
    v65 = objc_msgSend(v64, sel_scrollView);
    v66 = *(void **)(v63
                   + OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeScrollView);
    *(_QWORD *)(v63 + OBJC_IVAR____TtC15AppProtectionUI42APWelcomeControllerWithBraveButtonTrayView_welcomeScrollView) = v65;

    return;
  }
LABEL_31:
  __break(1u);
}

void sub_2362FE7F4(uint64_t a1)
{
  uint64_t v1;

  sub_2362F7D20(a1, v1);
}

void sub_2362FE7FC(uint64_t a1)
{
  uint64_t v1;

  sub_2362FA6AC(a1, v1);
}

void sub_2362FE804(char a1, uint64_t a2)
{
  uint64_t v2;

  sub_2362FD06C(a1, a2, *(char **)(v2 + 16));
}

void sub_2362FE80C(uint64_t a1)
{
  uint64_t v1;

  sub_2362F8270(a1, v1);
}

uint64_t sub_2362FE814()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2362FE838()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_2362FE864(uint64_t a1)
{
  uint64_t v1;

  sub_2362F830C(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_2362FE86C(char a1, int a2)
{
  uint64_t v2;

  sub_2362FD834(a1, a2, *(id *)(v2 + 16));
}

uint64_t sub_2362FE874(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_2362FB488(a1, a2, v2);
}

void sub_2362FE87C()
{
  uint64_t v0;

  sub_2362FB824(v0);
}

void sub_2362FE884()
{
  char *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  char *v6;
  _QWORD v7[6];

  v1 = objc_msgSend(v0, sel_delegate);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(*(id *)&v0[OBJC_IVAR___APEducationFlowViewController_lazyRecordApp], sel_application);
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = v0;
    v7[4] = sub_2362FE9A8;
    v7[5] = v4;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 1107296256;
    v7[2] = sub_2362F9DA0;
    v7[3] = &block_descriptor_88;
    v5 = _Block_copy(v7);
    v6 = v0;
    swift_release();
    objc_msgSend(v2, sel_educationViewController_requestLockOfApplication_completion_, v6, v3, v5);
    swift_unknownObjectRelease();
    _Block_release(v5);

  }
}

void sub_2362FE998()
{
  uint64_t v0;

  sub_2362FD674(*(char **)(v0 + 16));
}

void sub_2362FE9A0(char a1, int a2)
{
  uint64_t v2;

  sub_2362FD788(a1, a2, *(id *)(v2 + 16));
}

id APEnablementSuggestion.subject.getter()
{
  id *v0;

  return *v0;
}

uint64_t APEnablementSuggestion.feature.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t APEnablementSuggestion.action.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

id sub_2362FEA70()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)APEnablementOracle), sel_init);
  qword_2542A6600 = (uint64_t)result;
  return result;
}

APEnablementOracle __swiftcall APEnablementOracle.init()()
{
  return (APEnablementOracle)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id static APEnablementOracle.shared.getter()
{
  return objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_sharedInstance);
}

id APEnablementOracle.init()()
{
  objc_super v1;

  v1.super_class = (Class)APEnablementOracle;
  return objc_msgSendSuper2(&v1, sel_init);
}

id APEnablementOracle.enablementSuggestion(for:)@<X0>(void *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;
  void *v3;
  unsigned int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v15[2];

  v3 = v2;
  v15[1] = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  v15[0] = 0;
  v13 = 0;
  v6 = objc_msgSend(v3, sel_getPreferredEnablementAction_preferredEnableableFeature_forSubject_error_, v15, &v14, a1, &v13);
  v7 = v13;
  if (v6)
  {
    v8 = v14;
    v9 = v15[0];
    *a2 = a1;
    a2[1] = v8;
    a2[2] = v9;
    v10 = v7;
    return a1;
  }
  else
  {
    v12 = v13;
    sub_2362FF884();

    return (id)swift_willThrow();
  }
}

uint64_t initializeBufferWithCopyOfBuffer for APEnablementSuggestion(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v4 = v3;
  return a1;
}

void destroy for APEnablementSuggestion(id *a1)
{

}

uint64_t assignWithCopy for APEnablementSuggestion(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for APEnablementSuggestion(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for APEnablementSuggestion(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for APEnablementSuggestion(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
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
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for APEnablementSuggestion()
{
  return &type metadata for APEnablementSuggestion;
}

unint64_t type metadata accessor for APEnablementOracle()
{
  unint64_t result;

  result = qword_2563DBDB8;
  if (!qword_2563DBDB8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2563DBDB8);
  }
  return result;
}

uint64_t sub_2362FEF18(uint64_t a1, uint64_t a2, id a3)
{
  id v5;
  unsigned int v7;
  unsigned __int8 v8;
  unsigned __int8 v9;
  char **v10;
  unsigned __int8 v11;
  void *v12;
  unsigned __int8 v13;
  unsigned int v14;
  id v15;
  unsigned __int8 v16;
  id v17;

  if (a1 != 1 && a1 != 2)
    return 0;
  if (a2 == 1)
  {
    v11 = objc_msgSend(a3, sel_isLocked);
    if (a1 == 1 && (v11 & 1) != 0)
      return 0;
    v9 = objc_msgSend(a3, sel_isLocked);
    v10 = &selRef_canChangeLockedStatusOfSubject_;
    if (a1 != 2)
    {
LABEL_22:
      v12 = (void *)objc_opt_self();
      goto LABEL_31;
    }
    goto LABEL_21;
  }
  if (a2 != 3)
  {
    if (a2 != 2)
      return 0;
    if (objc_msgSend(a3, sel_isLocked))
    {
      v7 = objc_msgSend(a3, sel_isHidden);
      if (a1 == 1 && !v7)
        return 0;
    }
    v8 = objc_msgSend(a3, sel_isHidden);
    if (a1 == 1 && (v8 & 1) != 0)
      return 0;
    v9 = objc_msgSend(a3, sel_isHidden);
    v10 = &selRef_canChangeHiddenStatusOfSubject_;
    if (a1 != 2)
      goto LABEL_22;
LABEL_21:
    if ((v9 & 1) != 0)
      goto LABEL_22;
    return 0;
  }
  if ((objc_msgSend(a3, sel_isLocked) & 1) != 0)
  {
    if (a1 == 1)
      return 0;
  }
  else
  {
    v13 = objc_msgSend(a3, sel_isHidden);
    if (a1 == 1 && (v13 & 1) != 0)
      return 0;
  }
  if ((objc_msgSend(a3, sel_isLocked) & 1) != 0
    || (v14 = objc_msgSend(a3, sel_isHidden), a1 != 2)
    || v14)
  {
    v12 = (void *)objc_opt_self();
    v15 = objc_msgSend(v12, sel_sharedManager);
    v16 = objc_msgSend(v15, sel_canChangeLockedStatusOfSubject_, a3);

    if ((v16 & 1) != 0)
      return 1;
    v10 = &selRef_canChangeHiddenStatusOfSubject_;
LABEL_31:
    v17 = objc_msgSend(v12, sel_sharedManager);
    v5 = objc_msgSend(v17, *v10, a3);

    return (uint64_t)v5;
  }
  return 0;
}

uint64_t sub_2362FF118(uint64_t *a1, _QWORD *a2, void *a3)
{
  void *v6;
  id v7;
  unsigned __int8 v8;
  id v9;
  unsigned int v10;
  uint64_t result;
  uint64_t v12;
  id v13;
  void *v14;

  v6 = (void *)objc_opt_self();
  v7 = objc_msgSend(v6, sel_sharedManager);
  v8 = objc_msgSend(v7, sel_canChangeLockedStatusOfSubject_, a3);

  if ((v8 & 1) != 0
    || (v9 = objc_msgSend(v6, sel_sharedManager),
        v10 = objc_msgSend(v9, sel_canChangeHiddenStatusOfSubject_, a3),
        v9,
        v10))
  {
    result = (uint64_t)objc_msgSend(a3, sel_isLocked);
    if ((result & 1) != 0)
    {
      v12 = 2;
    }
    else
    {
      result = (uint64_t)objc_msgSend(a3, sel_isHidden);
      v12 = 1;
      if ((_DWORD)result)
        v12 = 2;
    }
    *a1 = v12;
    *a2 = 3;
  }
  else
  {
    sub_2362FF944();
    v13 = objc_allocWithZone(MEMORY[0x24BDD1540]);
    v14 = (void *)sub_2362FF938();
    swift_bridgeObjectRelease();
    objc_msgSend(v13, sel_initWithDomain_code_userInfo_, v14, 3, 0);

    return swift_willThrow();
  }
  return result;
}

uint64_t sub_2362FF878()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2362FF884()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2362FF890()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2362FF89C()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_2362FF8A8()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2362FF8B4()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_2362FF8C0()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_2362FF8CC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2362FF8D8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2362FF8E4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2362FF8F0()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_2362FF8FC()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2362FF908()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2362FF914()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_2362FF920()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_2362FF92C()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_2362FF938()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2362FF944()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2362FF950()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_2362FF95C()
{
  return MEMORY[0x24BDCFB20]();
}

uint64_t sub_2362FF968()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2362FF974()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2362FF980()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2362FF98C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2362FF998()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_2362FF9A4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2362FF9B0()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2362FF9BC()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2362FF9C8()
{
  return MEMORY[0x24BEBCBD0]();
}

uint64_t sub_2362FF9D4()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_2362FF9E0()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_2362FF9EC()
{
  return MEMORY[0x24BEBD030]();
}

uint64_t sub_2362FF9F8()
{
  return MEMORY[0x24BEBD050]();
}

uint64_t sub_2362FFA04()
{
  return MEMORY[0x24BEBD080]();
}

uint64_t sub_2362FFA10()
{
  return MEMORY[0x24BEBD088]();
}

uint64_t sub_2362FFA1C()
{
  return MEMORY[0x24BEBD130]();
}

uint64_t sub_2362FFA28()
{
  return MEMORY[0x24BEBD190]();
}

uint64_t sub_2362FFA34()
{
  return MEMORY[0x24BEBD1C0]();
}

uint64_t sub_2362FFA40()
{
  return MEMORY[0x24BEBD1C8]();
}

uint64_t sub_2362FFA4C()
{
  return MEMORY[0x24BEBD1F8]();
}

uint64_t sub_2362FFA58()
{
  return MEMORY[0x24BEBD208]();
}

uint64_t sub_2362FFA64()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2362FFA70()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2362FFA7C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2362FFA88()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2362FFA94()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2362FFAA0()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2362FFAAC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2362FFAB8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2362FFAC4()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2362FFAD0()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2362FFADC()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2362FFAE8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2362FFAF4()
{
  return MEMORY[0x24BEE3D98]();
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x24BED8580]();
}

uint64_t MobileGestalt_get_pearlIDCapability()
{
  return MEMORY[0x24BED8660]();
}

uint64_t MobileGestalt_get_touchIDCapability()
{
  return MEMORY[0x24BED8678]();
}

uint64_t _APErrorCodeDescription()
{
  return MEMORY[0x24BE04340]();
}

uint64_t _APMakeNSError()
{
  return MEMORY[0x24BE04348]();
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return MEMORY[0x24BEE4C48]();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x24BDB0730](name, targetq);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

xpc_endpoint_t xpc_endpoint_create(xpc_connection_t connection)
{
  return (xpc_endpoint_t)MEMORY[0x24BDB09F8](connection);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x24BDB0BD0](type);
}

