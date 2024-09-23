void sub_22F72A110(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void NotificationCallback(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  unint64_t v5;
  int v6;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  uint8_t v19[16];
  uint8_t v20[16];
  uint8_t buf[16];

  v3 = (id)_currentDevice;
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "syncSettings");
    v6 = v5;
    if (a2 == 1)
    {
      sharedBluetoothSettingsLogComponent();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v20 = 0;
        _os_log_impl(&dword_22F721000, v17, OS_LOG_TYPE_DEFAULT, "User wants to disallow phonebook transfer", v20, 2u);
      }

      LOBYTE(v8) = 0;
    }
    else if (a2)
    {
      v8 = v5 >> 8;
      sharedBluetoothSettingsLogComponent();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v19 = 0;
        _os_log_impl(&dword_22F721000, v18, OS_LOG_TYPE_DEFAULT, "User did not act on phonebook transfer privacy alert", v19, 2u);
      }

    }
    else
    {
      sharedBluetoothSettingsLogComponent();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_22F721000, v7, OS_LOG_TYPE_DEFAULT, "User wants to allow phonebook transfer", buf, 2u);
      }

      dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_524);
      LOBYTE(v8) = 1;
    }
    objc_msgSend(v4, "setSyncSettings:", v6 & 0xFFFF00FF | ((unint64_t)v8 << 8) | 0x100000000);
    v9 = _currentDevice;
    _currentDevice = 0;
  }
  else
  {
    sharedBluetoothSettingsLogComponent();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      NotificationCallback_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
  }

}

void sub_22F7367DC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_22F736C0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22F736EE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_11(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_12(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

void OUTLINED_FUNCTION_15(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

void sub_22F7391C0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_22F73A324(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 96));
  _Unwind_Resume(a1);
}

id sharedBluetoothSettingsLogComponent()
{
  if (sharedBluetoothSettingsLogComponent_onceToken[0] != -1)
    dispatch_once(sharedBluetoothSettingsLogComponent_onceToken, &__block_literal_global_0);
  return (id)sharedBluetoothSettingsLogComponent_sharedBTSLog;
}

void __sharedBluetoothSettingsLogComponent_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.bluetooth", "BluetoothSettings");
  v1 = (void *)sharedBluetoothSettingsLogComponent_sharedBTSLog;
  sharedBluetoothSettingsLogComponent_sharedBTSLog = (uint64_t)v0;

}

uint64_t sub_22F73C158()
{
  return sub_22F73EA84();
}

id sub_22F73C174()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  _BYTE v7[16];
  void *v8;
  uint64_t v9[5];

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E08330);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = &v7[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E08338);
  sub_22F73DB58(&qword_255E08340, &qword_255E08338, MEMORY[0x24BE855C8]);
  sub_22F73EA30();
  sub_22F73EA3C();
  v9[3] = v2;
  v9[4] = sub_22F73DB58(&qword_255E08348, &qword_255E08330, MEMORY[0x24BDEFEA0]);
  __swift_allocate_boxed_opaque_existential_1(v9);
  sub_22F73EA24();
  (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
  MEMORY[0x2348A26EC](v9);
  return objc_msgSend(v1, sel_setSelectionStyle_, 0);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348A2C50]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_22F73C2F0(void *a1)
{
  uint64_t ObjCClassFromMetadata;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;

  swift_getObjectType();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = (void *)objc_opt_self();
  v4 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_22F73EA0C();

  sub_22F73EACC();
  v5 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata, 0xE000000000000000);
  sub_22F73EA0C();

  v6 = objc_msgSend((id)objc_opt_self(), sel_currentDevice, 0xE000000000000000);
  objc_msgSend(v6, sel_userInterfaceIdiom);

  *(_QWORD *)(swift_allocObject() + 16) = a1;
  v7 = a1;
  sub_22F73EAC0();
  sub_22F73EAC0();
  swift_bridgeObjectRelease();
  sub_22F73EAC0();
  sub_22F73EAC0();
  swift_bridgeObjectRelease();
  sub_22F73EAC0();
  return sub_22F73EA6C();
}

uint64_t sub_22F73C59C()
{
  uint64_t v0;

  return sub_22F73C2F0(*(void **)(v0 + 16));
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348A2C5C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
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

uint64_t sub_22F73C624()
{
  uint64_t ObjCClassFromMetadata;
  id v1;
  uint64_t v2;

  swift_getObjectType();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v2 = sub_22F73EA0C();

  return v2;
}

id sub_22F73C6D8(void *a1, double a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id result;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t inited;
  void **v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD aBlock[9];

  v4 = sub_22F73EA48();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_22F73EA60();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend(a1, sel_specifier);
  if (result)
  {
    v13 = result;
    v14 = objc_msgSend(result, sel_target);

    v39 = v8;
    v40 = v5;
    v38 = v9;
    if (v14)
    {
      objc_opt_self();
      v15 = (void *)swift_dynamicCastObjCClass();
      if (v15)
      {
        v37 = v15;
        v14 = objc_msgSend(v15, sel_navigationItem);
LABEL_7:
        v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
        v17 = (void *)objc_opt_self();
        v18 = (void *)sub_22F73EA84();
        v19 = objc_msgSend(v17, sel_preferredFontForTextStyle_, v18);

        objc_msgSend(v16, sel_setFont_, v19);
        v20 = v16;
        __swift_instantiateConcreteTypeFromMangledName(&qword_255E083B0);
        inited = swift_initStackObject();
        v22 = (void **)MEMORY[0x24BEBB368];
        *(_OWORD *)(inited + 16) = xmmword_22F7402C0;
        v23 = *v22;
        *(_QWORD *)(inited + 32) = *v22;
        v24 = (void *)objc_opt_self();
        v25 = v23;
        v26 = objc_msgSend(v24, sel_labelColor);
        v27 = objc_msgSend(v26, sel_colorWithAlphaComponent_, a2);

        *(_QWORD *)(inited + 64) = sub_22F73DB98(0, &qword_255E083B8);
        *(_QWORD *)(inited + 40) = v27;
        sub_22F73CBB0(inited, &qword_255E083C8, &qword_255E083D0, (uint64_t (*)(uint64_t))sub_22F73D8B4);
        v28 = objc_allocWithZone(MEMORY[0x24BDD1458]);
        v29 = (void *)sub_22F73EA84();
        type metadata accessor for Key(0);
        sub_22F73DB18(&qword_255E083C0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_22F7405C4);
        v30 = (void *)sub_22F73EA78();
        swift_bridgeObjectRelease();
        v31 = objc_msgSend(v28, sel_initWithString_attributes_, v29, v30);

        objc_msgSend(v20, sel_setAttributedText_, v31);
        sub_22F73DB98(0, &qword_255E08390);
        v32 = (void *)sub_22F73EAE4();
        v33 = swift_allocObject();
        *(_QWORD *)(v33 + 16) = v14;
        *(_QWORD *)(v33 + 24) = v20;
        aBlock[4] = sub_22F73DAE4;
        aBlock[5] = v33;
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_22F73CCD8;
        aBlock[3] = &block_descriptor;
        v34 = _Block_copy(aBlock);
        v35 = v14;
        swift_release();
        sub_22F73EA54();
        aBlock[0] = MEMORY[0x24BEE4AF8];
        sub_22F73DB18(&qword_255E08398, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255E083A0);
        sub_22F73DB58(&qword_255E083A8, &qword_255E083A0, MEMORY[0x24BEE12C8]);
        sub_22F73EAFC();
        MEMORY[0x2348A2704](0, v11, v7, v34);

        _Block_release(v34);
        (*(void (**)(char *, uint64_t))(v40 + 8))(v7, v4);
        return (id)(*(uint64_t (**)(char *, uint64_t))(v38 + 8))(v11, v39);
      }
      swift_unknownObjectRelease();
      v14 = 0;
    }
    v37 = 0;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

unint64_t sub_22F73CBB0(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t result;
  char v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;

  if (!*(_QWORD *)(a1 + 16))
  {
    v8 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = sub_22F73EB08();
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  v10 = v7 + 64;
  v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_22F73DC28(v11, (uint64_t)&v18, a3);
    v12 = v18;
    result = a4(v18);
    if ((v14 & 1) != 0)
      break;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v8[6] + 8 * result) = v12;
    result = (unint64_t)sub_22F73D934(&v19, (_OWORD *)(v8[7] + 32 * result));
    v15 = v8[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_11;
    v8[2] = v17;
    v11 += 40;
    if (!--v9)
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

uint64_t sub_22F73CCD8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_22F73CD04()
{
  void *v0;
  id v1;
  void *v2;
  unsigned int v3;
  id v4;
  void *v5;
  id v6;

  v0 = (void *)objc_opt_self();
  v1 = objc_msgSend(v0, sel_sharedApplication);
  v2 = (void *)sub_22F73EA18();
  v3 = objc_msgSend(v1, sel_canOpenURL_, v2);

  if (v3)
  {
    v4 = objc_msgSend(v0, sel_sharedApplication);
    v5 = (void *)sub_22F73EA18();
    sub_22F73CBB0(MEMORY[0x24BEE4AF8], &qword_255E08380, &qword_255E08388, (uint64_t (*)(uint64_t))sub_22F73D8B4);
    type metadata accessor for OpenExternalURLOptionsKey(0);
    sub_22F73DB18(&qword_255E08378, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_22F740608);
    v6 = (id)sub_22F73EA78();
    swift_bridgeObjectRelease();
    objc_msgSend(v4, sel_openURL_options_completionHandler_, v5, v6, 0);

  }
}

id sub_22F73CFBC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  objc_class *v4;
  objc_class *v5;
  void *v8;
  id v9;

  v5 = v4;
  if (a3)
  {
    v8 = (void *)sub_22F73EA84();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(objc_allocWithZone(v5), sel_initWithStyle_reuseIdentifier_specifier_, a1, v8, a4);

  return v9;
}

id sub_22F73D048(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  void *v5;
  objc_class *ObjectType;
  void *v10;
  id v11;
  id v12;
  objc_super v14;

  v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    v10 = (void *)sub_22F73EA84();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v14.receiver = v5;
  v14.super_class = ObjectType;
  v11 = objc_msgSendSuper2(&v14, sel_initWithStyle_reuseIdentifier_specifier_, a1, v10, a4);

  v12 = v11;
  if (v12)

  return v12;
}

id sub_22F73D168(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a3)
  {
    v6 = (void *)sub_22F73EA84();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithStyle_reuseIdentifier_, a1, v6);

  return v7;
}

id sub_22F73D1E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  objc_class *ObjectType;
  void *v7;
  id v8;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    v7 = (void *)sub_22F73EA84();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  v10.receiver = v3;
  v10.super_class = ObjectType;
  v8 = objc_msgSendSuper2(&v10, sel_initWithStyle_reuseIdentifier_, a1, v7);

  return v8;
}

id sub_22F73D300(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id sub_22F73D340(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)swift_getObjectType();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id sub_22F73D3D4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for BTSettingsPlacardView()
{
  return objc_opt_self();
}

uint64_t sub_22F73D428(uint64_t a1, uint64_t a2)
{
  return sub_22F73D584(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_22F73D440(uint64_t a1, uint64_t a2)
{
  return sub_22F73D584(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_22F73D454(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_22F73EA90();
  *a2 = 0;
  return result;
}

uint64_t sub_22F73D4C8(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_22F73EA9C();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_22F73D544@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_22F73EAA8();
  v2 = sub_22F73EA84();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22F73D584(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_22F73EAA8();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_22F73D5C0()
{
  sub_22F73EAA8();
  sub_22F73EAB4();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22F73D600()
{
  uint64_t v0;

  sub_22F73EAA8();
  sub_22F73EB2C();
  sub_22F73EAB4();
  v0 = sub_22F73EB38();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_22F73D670()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_22F73D694(double a1)
{
  uint64_t v1;

  return sub_22F73C6D8(*(void **)(v1 + 16), a1);
}

void type metadata accessor for OpenExternalURLOptionsKey(uint64_t a1)
{
  sub_22F73DBE4(a1, &qword_255E083E0);
}

uint64_t sub_22F73D6B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_22F73EAA8();
  v2 = v1;
  if (v0 == sub_22F73EAA8() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_22F73EB20();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_22F73D740@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_22F73EAA8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_22F73D768()
{
  sub_22F73DB18(&qword_255E083C0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_22F7405C4);
  sub_22F73DB18(&qword_255E08418, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_22F740518);
  return sub_22F73EB14();
}

uint64_t sub_22F73D7EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_22F73EA84();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_22F73D830()
{
  sub_22F73DB18(&qword_255E08378, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_22F740608);
  sub_22F73DB18(&qword_255E08420, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_22F7403F8);
  return sub_22F73EB14();
}

unint64_t sub_22F73D8B4(uint64_t a1)
{
  uint64_t v2;

  sub_22F73EAA8();
  sub_22F73EB2C();
  sub_22F73EAB4();
  v2 = sub_22F73EB38();
  swift_bridgeObjectRelease();
  return sub_22F73D944(a1, v2);
}

_OWORD *sub_22F73D934(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_22F73D944(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_22F73EAA8();
    v8 = v7;
    if (v6 == sub_22F73EAA8() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_22F73EB20();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_22F73EAA8();
          v15 = v14;
          if (v13 == sub_22F73EAA8() && v15 == v16)
            break;
          v18 = sub_22F73EB20();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_22F73DAB8()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_22F73DAE4()
{
  uint64_t v0;
  id result;

  result = *(id *)(v0 + 16);
  if (result)
    return objc_msgSend(result, sel_setTitleView_, *(_QWORD *)(v0 + 24));
  return result;
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

uint64_t sub_22F73DB18(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2348A2C68](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22F73DB58(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2348A2C68](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22F73DB98(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for Key(uint64_t a1)
{
  sub_22F73DBE4(a1, &qword_255E083D8);
}

void sub_22F73DBE4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_22F73DC28(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_22F73DC6C()
{
  return sub_22F73DB18(&qword_255E083E8, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_22F7403BC);
}

uint64_t sub_22F73DC98()
{
  return sub_22F73DB18(&qword_255E083F0, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_22F740390);
}

uint64_t sub_22F73DCC4()
{
  return sub_22F73DB18(&qword_255E083F8, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_22F7404DC);
}

uint64_t sub_22F73DCF0()
{
  return sub_22F73DB18(&qword_255E08400, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_22F7404B0);
}

uint64_t sub_22F73DD1C()
{
  return sub_22F73DB18(&qword_255E08408, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_22F74054C);
}

uint64_t sub_22F73DD48()
{
  return sub_22F73DB18(&qword_255E08410, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_22F74042C);
}

void NotificationCallback_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_11(&dword_22F721000, a1, a3, "Unable to set contact sync for null device", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_14();
}

uint64_t sub_22F73EA0C()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_22F73EA18()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_22F73EA24()
{
  return MEMORY[0x24BDEFE58]();
}

uint64_t sub_22F73EA30()
{
  return MEMORY[0x24BDEFE68]();
}

uint64_t sub_22F73EA3C()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_22F73EA48()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_22F73EA54()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_22F73EA60()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_22F73EA6C()
{
  return MEMORY[0x24BE855A8]();
}

uint64_t sub_22F73EA78()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_22F73EA84()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22F73EA90()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_22F73EA9C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_22F73EAA8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22F73EAB4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_22F73EAC0()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_22F73EACC()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_22F73EAD8()
{
  return MEMORY[0x24BEBCBF0]();
}

uint64_t sub_22F73EAE4()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_22F73EAF0()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_22F73EAFC()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_22F73EB08()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_22F73EB14()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_22F73EB20()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22F73EB2C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22F73EB38()
{
  return MEMORY[0x24BEE4328]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBC928](allocator, userNotification, callout, order);
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDBF038]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t CRConfirmAndContinueBluetoothClassicPairing()
{
  return MEMORY[0x24BE151D8]();
}

uint64_t CRConnectBluetoothLE()
{
  return MEMORY[0x24BE151E0]();
}

uint64_t CRStartBluetoothClassicPairing()
{
  return MEMORY[0x24BE151F8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x24BED84C0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

CFStringRef SCDynamicStoreCopyComputerName(SCDynamicStoreRef store, CFStringEncoding *nameEncoding)
{
  return (CFStringRef)MEMORY[0x24BDF5648](store, nameEncoding);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x24BEBE0B0](category);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _NETRBClientCreate()
{
  return MEMORY[0x24BE6B640]();
}

uint64_t _NETRBClientDestroy()
{
  return MEMORY[0x24BE6B648]();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x24BDAF198](*(_QWORD *)&token, state64);
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

uint64_t random(void)
{
  return MEMORY[0x24BDAFA48]();
}

void srandom(unsigned int a1)
{
  MEMORY[0x24BDAFE98](*(_QWORD *)&a1);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

