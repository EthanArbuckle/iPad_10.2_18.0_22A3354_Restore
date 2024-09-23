const __CFString *ASAccessoryStateToString(uint64_t a1)
{
  const __CFString *v1;
  const __CFString *v2;

  v1 = CFSTR("Authorized");
  v2 = CFSTR("?");
  if (a1 == 10)
    v2 = CFSTR("AwaitingAuthorization");
  if (a1 != 20)
    v1 = v2;
  if (a1)
    return v1;
  else
    return CFSTR("Unauthorized");
}

void sub_232DC3524(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_232DC38E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
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

void sub_232DC40C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_232DC63C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

const __CFString *ASDiscoveryDescriptorRangeToString(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("?");
  if (a1 == 10)
    v1 = CFSTR("Immediate");
  if (a1)
    return v1;
  else
    return CFSTR("Default");
}

Class initPSSpecifier()
{
  Class result;

  if (PreferencesLibrary_sOnce != -1)
    dispatch_once(&PreferencesLibrary_sOnce, &__block_literal_global_230);
  result = objc_getClass("PSSpecifier");
  classPSSpecifier = (uint64_t)result;
  getPSSpecifierClass = (uint64_t (*)())PSSpecifierFunction;
  return result;
}

id PSSpecifierFunction()
{
  return (id)classPSSpecifier;
}

id ASErrorF(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v10, &a9);
  v12 = objc_alloc(MEMORY[0x24BDD1540]);
  v16 = CFSTR("cuErrorMsg");
  v17[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithDomain:code:userInfo:", CFSTR("ASErrorDomain"), a1, v13);

  return v14;
}

const __CFString *ASAccessoryEventTypeToString(uint64_t a1)
{
  if (a1 > 30)
  {
    if (a1 > 39)
    {
      if (a1 == 40)
        return CFSTR("PickerDidPresent");
      if (a1 == 50)
        return CFSTR("PickerDidDismiss");
    }
    else
    {
      if (a1 == 31)
        return CFSTR("AccessoryRemoved");
      if (a1 == 32)
        return CFSTR("AccessoryChanged");
    }
  }
  else if (a1 > 10)
  {
    if (a1 == 11)
      return CFSTR("Invalidated");
    if (a1 == 30)
      return CFSTR("AccessoryAdded");
  }
  else
  {
    if (!a1)
      return CFSTR("Unknown");
    if (a1 == 10)
      return CFSTR("Activated");
  }
  return CFSTR("?");
}

uint64_t sub_232DCC3D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_232DD0DA8();
  __swift_allocate_value_buffer(v0, qword_255FF9938);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_255FF9938);
  if (qword_255FF9960 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_255FFA180);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

id sub_232DCC468()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ASUIClientManager()), sel_init);
  qword_255FF9958 = (uint64_t)result;
  return result;
}

id ASUIClientManager.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id static ASUIClientManager.shared.getter()
{
  if (qword_255FF9950 != -1)
    swift_once();
  return (id)qword_255FF9958;
}

void sub_232DCC534(uint64_t a1, unint64_t a2, uint64_t a3, char **a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  _QWORD *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  double v35;
  double v36;
  id v37;
  double v38;
  double v39;
  id v40;
  id v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  unint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  const char *v60;
  char **v61;
  uint64_t ObjCClassFromMetadata;
  uint64_t v63;
  id v64;
  void *v65;
  unsigned __int8 v66;
  uint64_t v67;
  void *v68;
  void *v69;
  uint64_t v70;
  unint64_t v71;
  id *v72;
  id v73;
  id v74;
  void *v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  id v80;
  id v81;
  id v82;
  void *v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  id v87;
  id v88;
  id v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  uint64_t v94;
  void *v95;
  void *v96;
  id v97;
  uint64_t v98;
  void *v99;
  unint64_t v100;
  id *v101;
  uint64_t v102;
  void *v103;
  void *v104;
  unint64_t v105;
  unint64_t v106;

  v7 = v6;
  if (qword_255FF9930 != -1)
    swift_once();
  v13 = sub_232DD0DA8();
  __swift_project_value_buffer(v13, (uint64_t)qword_255FF9938);
  v14 = sub_232DD0D90();
  v15 = sub_232DD0E80();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_232DBE000, v14, v15, "activateConnection", v16, 2u);
    MEMORY[0x234928FD4](v16, -1, -1);
  }

  v17 = (_QWORD *)(v7 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_completionHandler);
  v18 = *(_QWORD *)(v7 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_completionHandler);
  *v17 = a5;
  v17[1] = a6;
  swift_retain();
  sub_232DCD34C(v18);
  if (*(_QWORD *)(v7 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_connection))
  {
    v19 = sub_232DD0D90();
    v20 = sub_232DD0E74();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_232DBE000, v19, v20, "Picker already activated", v21, 2u);
      MEMORY[0x234928FD4](v21, -1, -1);
    }

    type metadata accessor for ASError(0);
    v22 = 500;
LABEL_36:
    v106 = v22;
    sub_232DCFAAC(MEMORY[0x24BEE4AF8]);
    sub_232DD042C(&qword_255FF9988, (uint64_t (*)(uint64_t))type metadata accessor for ASError, (uint64_t)&unk_232DD4AD8);
    sub_232DD0D6C();
    sub_232DCE694(v103);

    return;
  }
  v23 = mach_absolute_time();
  v24 = OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_startTicksFull;
  v25 = *(_QWORD *)(v7 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_startTicksFull);
  if (!v25)
  {
    *(_QWORD *)(v7 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_startTicksFull) = v23;
    v25 = v23;
  }
  if (v23 < v25)
    goto LABEL_114;
  if ((unint64_t)UpTicksToSeconds() >= 0x10)
    *(_QWORD *)(v7 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_debounceCounter) = 0;
  v26 = *(_QWORD *)(v7 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_debounceCounter);
  if (v26 > 2)
  {
    v42 = sub_232DD0D90();
    v43 = sub_232DD0E74();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v44 = 0;
      _os_log_impl(&dword_232DBE000, v42, v43, "Picker rate limited for repeated calls", v44, 2u);
      MEMORY[0x234928FD4](v44, -1, -1);
    }

    type metadata accessor for ASError(0);
    v22 = 550;
    goto LABEL_36;
  }
  *(_QWORD *)(v7 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_debounceCounter) = v26 + 1;
  *(_QWORD *)(v7 + v24) = mach_absolute_time();
  v106 = MEMORY[0x24BEE4AF8];
  v105 = MEMORY[0x24BEE4AF8];
  a6 = a2 >> 62;
  if (a2 >> 62)
    goto LABEL_116;
  v27 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (1)
  {
    v101 = (id *)a2;
    v102 = v27;
    if (v27)
    {
      v98 = a3;
      if (v27 < 1)
      {
        __break(1u);
        goto LABEL_118;
      }
      v28 = 0;
      v29 = a2 & 0xC000000000000001;
      do
      {
        if (v29)
          v30 = (id)MEMORY[0x234928998](v28, a2);
        else
          v30 = *(id *)(a2 + 8 * v28 + 32);
        v31 = v30;
        v32 = objc_msgSend(v30, sel_productImage);
        v33 = objc_msgSend(v32, sel_imageAsset);

        if (!v33)
          goto LABEL_26;
        v34 = objc_msgSend(v31, sel_productImage);
        objc_msgSend(v34, sel_size);
        v36 = v35;

        if (v36 == 0.0
          || (v37 = objc_msgSend(v31, sel_productImage),
              objc_msgSend(v37, sel_size),
              v39 = v38,
              v37,
              v39 == 0.0))
        {
LABEL_26:
          v40 = v31;
          MEMORY[0x23492889C]();
          if (*(_QWORD *)((v105 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v105 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_232DD0E5C();
        }
        else
        {
          v41 = v31;
          MEMORY[0x23492889C]();
          if (*(_QWORD *)((v106 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v106 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_232DD0E5C();
        }
        sub_232DD0E68();
        ++v28;
        sub_232DD0E50();

        a2 = (unint64_t)v101;
      }
      while (v102 != v28);
      swift_bridgeObjectRelease();
      v45 = v105;
      a3 = v98;
      if (!(v105 >> 62))
      {
LABEL_38:
        if (!*(_QWORD *)((v45 & 0xFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_43;
        goto LABEL_39;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      v45 = MEMORY[0x24BEE4AF8];
      if (!(MEMORY[0x24BEE4AF8] >> 62))
        goto LABEL_38;
    }
    swift_bridgeObjectRetain();
    v56 = sub_232DD0F40();
    swift_bridgeObjectRelease();
    if (!v56)
      goto LABEL_43;
LABEL_39:
    v46 = sub_232DD0D90();
    v47 = sub_232DD0E74();
    if (os_log_type_enabled(v46, v47))
    {
      v48 = (uint8_t *)swift_slowAlloc();
      v99 = (void *)swift_slowAlloc();
      v104 = v99;
      *(_DWORD *)v48 = 136315138;
      swift_beginAccess();
      v49 = sub_232DD0A94(0, &qword_255FF99B8);
      v50 = swift_bridgeObjectRetain();
      v51 = MEMORY[0x2349288C0](v50, v49);
      v53 = v52;
      swift_bridgeObjectRelease();
      sub_232DCFDCC(v51, v53, (uint64_t *)&v104);
      sub_232DD0EE0();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_232DBE000, v46, v47, "Ignoring invalid display items: %s", v48, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x234928FD4](v99, -1, -1);
      MEMORY[0x234928FD4](v48, -1, -1);
    }

    a2 = (unint64_t)v101;
    if (!(v106 >> 62))
    {
      if (!*(_QWORD *)((v106 & 0xFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_119;
      goto LABEL_43;
    }
LABEL_118:
    swift_bridgeObjectRetain();
    v94 = sub_232DD0F40();
    swift_bridgeObjectRelease();
    if (!v94)
    {
LABEL_119:
      swift_bridgeObjectRelease();
      v57 = sub_232DD0D90();
      v58 = sub_232DD0E74();
      if (os_log_type_enabled(v57, v58))
      {
        v59 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v59 = 0;
        v60 = "Cannot launch picker due to no valid display item";
        goto LABEL_121;
      }
LABEL_122:

      type metadata accessor for ASError(0);
      sub_232DCFAAC(MEMORY[0x24BEE4AF8]);
      sub_232DD042C(&qword_255FF9988, (uint64_t (*)(uint64_t))type metadata accessor for ASError, (uint64_t)&unk_232DD4AD8);
      sub_232DD0D6C();
      v95 = v104;
      sub_232DCE694(v104);

      goto LABEL_123;
    }
LABEL_43:
    sub_232DCD98C();
    v54 = *(void **)(v7 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_server);
    if (!v54)
    {
      swift_bridgeObjectRelease();
      v57 = sub_232DD0D90();
      v58 = sub_232DD0E74();
      if (os_log_type_enabled(v57, v58))
      {
        v59 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v59 = 0;
        v60 = "No server connection available";
LABEL_121:
        _os_log_impl(&dword_232DBE000, v57, v58, v60, v59, 2u);
        MEMORY[0x234928FD4](v59, -1, -1);
        goto LABEL_122;
      }
      goto LABEL_122;
    }
    swift_unknownObjectWeakAssign();
    v55 = OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_displayItems;
    *(_QWORD *)(v7 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_displayItems) = v106;
    swift_unknownObjectRetain();
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v7 + v55) >> 62)
    {
      swift_bridgeObjectRetain();
      sub_232DD0F40();
      swift_bridgeObjectRelease();
    }
    sub_232DD0A94(0, &qword_255FF99A8);
    v96 = (void *)sub_232DD0EBC();
    if (a6)
    {
      swift_bridgeObjectRetain();
      v7 = sub_232DD0F40();
      swift_bridgeObjectRelease();
    }
    else
    {
      v7 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v97 = v54;
    if (!v102)
      break;
    v61 = a4;
    sub_232DD0A94(0, &qword_255FF99B0);
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    v100 = a2 & 0xC000000000000001;
    swift_bridgeObjectRetain();
    v63 = 4;
    a4 = &selRef_setNumberOfLines_;
    while (1)
    {
      v64 = v100 ? (id)MEMORY[0x234928998](v63 - 4, a2) : *(id *)(a2 + 8 * v63);
      v65 = v64;
      a6 = v63 - 3;
      if (__OFADD__(v63 - 4, 1))
        break;
      v66 = objc_msgSend(v64, sel_isKindOfClass_, ObjCClassFromMetadata);

      if ((v66 & 1) == 0)
      {
        swift_bridgeObjectRelease();
        a4 = v61;
        v67 = v102;
LABEL_68:
        v70 = a2 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain();
        v71 = 0;
        a3 = 0;
        v7 = 0;
        a6 = a2 & 0xFFFFFFFFFFFFFF8;
        if (v100)
        {
LABEL_69:
          v72 = (id *)MEMORY[0x234928998](v71, a2);
          goto LABEL_72;
        }
        while (2)
        {
          if (v71 >= *(_QWORD *)(v70 + 16))
            goto LABEL_115;
          v72 = (id *)*(id *)(a2 + 8 * v71 + 32);
LABEL_72:
          a2 = (unint64_t)v72;
          if (__OFADD__(v71, 1))
            goto LABEL_113;
          if ((v7 & 1) != 0)
          {
            if ((a3 & 1) != 0)
            {

LABEL_107:
              swift_bridgeObjectRelease();
              v90 = v97;
              if (!a4)
                goto LABEL_110;
              goto LABEL_108;
            }
LABEL_81:
            v7 = 1;
LABEL_82:
            v80 = objc_msgSend((id)a2, sel_descriptor);
            v81 = objc_msgSend(v80, sel_SSID);
            if (v81)
            {
              a3 = (uint64_t)v81;

              goto LABEL_85;
            }
            a3 = (uint64_t)objc_msgSend(v80, sel_SSIDPrefix);

            if (a3)
            {
LABEL_85:

              a3 = 1;
            }
LABEL_86:
            a2 = (unint64_t)v101;
            if (v71 + 1 == v67)
              goto LABEL_107;
            ++v71;
            if (v100)
              goto LABEL_69;
            continue;
          }
          break;
        }
        v73 = objc_msgSend(v72, sel_descriptor);
        if (objc_msgSend(v73, sel_bluetoothCompanyIdentifier))
        {

          if ((a3 & 1) == 0)
            goto LABEL_81;
LABEL_78:

          a3 = 1;
          v7 = 1;
          goto LABEL_86;
        }
        v74 = objc_msgSend(v73, sel_bluetoothManufacturerDataBlob);
        if (v74)
        {
          v75 = v74;
          v76 = sub_232DD0D84();
          v78 = v77;

          v79 = v78;
          v70 = a6;
          sub_232DCFBE0(v76, v79);
          v67 = v102;

          if ((a3 & 1) == 0)
            goto LABEL_81;
          goto LABEL_78;
        }
        v82 = objc_msgSend(v73, sel_bluetoothManufacturerDataMask);
        if (v82)
        {
LABEL_90:
          v83 = v82;
          v84 = sub_232DD0D84();
          v86 = v85;

          sub_232DCFBE0(v84, v86);
        }
        else
        {
          v87 = objc_msgSend(v73, sel_bluetoothNameSubstring);
          if (!v87)
          {
            v82 = objc_msgSend(v73, sel_bluetoothServiceDataBlob);
            if (!v82)
            {
              v82 = objc_msgSend(v73, sel_bluetoothServiceDataMask);
              if (!v82)
              {
                v89 = objc_msgSend(v73, sel_bluetoothServiceUUID);

                v70 = a6;
                if (v89)
                {

                  if ((a3 & 1) != 0)
                  {

                    a3 = 1;
                    v7 = 1;
                    v67 = v102;
                    goto LABEL_86;
                  }
                  v7 = 1;
                }
                else
                {
                  if ((a3 & 1) != 0)
                  {

                    v7 = 0;
                    a3 = 1;
                    v67 = v102;
                    goto LABEL_86;
                  }
                  v7 = 0;
                }
                v67 = v102;
                goto LABEL_82;
              }
            }
            goto LABEL_90;
          }
          v88 = v87;

          v73 = v88;
        }
        v67 = v102;
        v70 = a6;

        if ((a3 & 1) == 0)
          goto LABEL_81;
        goto LABEL_78;
      }
      ++v63;
      v67 = v102;
      if (a6 == v102)
      {
        swift_bridgeObjectRelease();
        a4 = v61;
        if (v7 <= 0)
          goto LABEL_68;
LABEL_65:
        v68 = (void *)sub_232DD0EC8();
        objc_msgSend(v97, sel_updateMigrationDisplayCount_, v68);

        if (a4)
          v69 = (void *)sub_232DD0DF0();
        else
          v69 = 0;
        objc_msgSend(v97, sel_showMigrationPickerWithOverrideBundleID_, v69);
        swift_unknownObjectRelease();

        goto LABEL_123;
      }
    }
    __break(1u);
LABEL_113:
    __break(1u);
LABEL_114:
    __break(1u);
LABEL_115:
    __break(1u);
LABEL_116:
    swift_bridgeObjectRetain();
    v27 = sub_232DD0F40();
  }
  if (v7 >= 1)
    goto LABEL_65;
  v90 = v54;
  if (a4)
LABEL_108:
    v91 = (void *)sub_232DD0DF0();
  else
LABEL_110:
    v91 = 0;
  v92 = (void *)sub_232DD0EBC();
  v93 = (void *)sub_232DD0EBC();
  objc_msgSend(v90, sel_showPickerWithOverrideBundleID_shouldRetrieveDisplayItems_needsBluetooth_needsWiFi_, v91, v96, v92, v93);
  swift_unknownObjectRelease();

LABEL_123:
  swift_bridgeObjectRelease();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_232DCD34C(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

void type metadata accessor for ASError(uint64_t a1)
{
  sub_232DD068C(a1, &qword_255FF9B68);
}

void sub_232DCD468(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = sub_232DD0D78();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

void sub_232DCD4B4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v4 = v3;
  v6 = (_QWORD *)(v3 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_completionHandler);
  v7 = *(_QWORD *)(v3 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_completionHandler);
  *v6 = a2;
  v6[1] = a3;
  swift_retain();
  sub_232DCD34C(v7);
  v8 = *(void **)(v4 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_server);
  if (v8)
  {
    swift_unknownObjectRetain();
    v9 = objc_msgSend(a1, sel_identifier);
    if (!v9)
    {
      sub_232DD0DFC();
      v10 = (id)sub_232DD0DF0();
      swift_bridgeObjectRelease();
      v9 = v10;
    }
    v11 = v9;
    objc_msgSend(v8, sel_failAccessory_);
    swift_unknownObjectRelease();

  }
  else
  {
    type metadata accessor for ASError(0);
    sub_232DCFAAC(MEMORY[0x24BEE4AF8]);
    sub_232DD042C(&qword_255FF9988, (uint64_t (*)(uint64_t))type metadata accessor for ASError, (uint64_t)&unk_232DD4AD8);
    sub_232DD0D6C();
    sub_232DCE694(v12);

  }
}

void sub_232DCD684(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;

  v7 = v6;
  v10 = (_QWORD *)(v6 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_completionHandler);
  v11 = *(_QWORD *)(v6 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_completionHandler);
  *v10 = a5;
  v10[1] = a6;
  swift_retain();
  sub_232DCD34C(v11);
  sub_232DCD98C();
  v12 = *(void **)(v7 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_server);
  if (!v12)
  {
    type metadata accessor for ASError(0);
    sub_232DCFAAC(MEMORY[0x24BEE4AF8]);
    sub_232DD042C(&qword_255FF9988, (uint64_t (*)(uint64_t))type metadata accessor for ASError, (uint64_t)&unk_232DD4AD8);
    sub_232DD0D6C();
    sub_232DCE694(v19);

    return;
  }
  swift_unknownObjectRetain();
  v13 = objc_msgSend(a1, sel_SSID);
  if (v13)

  sub_232DD0A94(0, &qword_255FF99A8);
  v14 = (void *)sub_232DD0EBC();
  v15 = objc_msgSend(a1, sel_identifier);
  if (!v15)
  {
    sub_232DD0DFC();
    v15 = (id)sub_232DD0DF0();
    swift_bridgeObjectRelease();
  }
  v16 = objc_msgSend(a1, sel_displayName);
  if (!v16)
  {
    sub_232DD0DFC();
    v16 = (id)sub_232DD0DF0();
    swift_bridgeObjectRelease();
    if (a4)
      goto LABEL_9;
LABEL_11:
    v17 = 0;
    goto LABEL_12;
  }
  if (!a4)
    goto LABEL_11;
LABEL_9:
  v17 = sub_232DD0DF0();
LABEL_12:
  v18 = (id)v17;
  objc_msgSend(v12, sel_renameAccessory_currentName_updateSSID_overrideBundleID_, v15, v16, v14);
  swift_unknownObjectRelease();

}

void sub_232DCD98C()
{
  char *v0;
  uint64_t v1;
  char *v2;
  char *v3;
  void *v4;
  char *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  void *v23;
  char *v24;
  id v25;
  id v26;
  char isEscapingClosureAtFileLocation;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  int v44;
  objc_class *v45;
  os_log_t oslog;
  NSObject *osloga;
  char *v48;
  char *v49;
  objc_class *v50;
  __int128 v51;
  __int128 v52;
  _QWORD aBlock[7];

  v1 = OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_server;
  if (*(_QWORD *)&v0[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_server])
    return;
  v2 = v0;
  v3 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ASUIClientWrapper()), sel_init);
  v4 = *(void **)&v3[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientWrapper_clientManager];
  *(_QWORD *)&v3[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientWrapper_clientManager] = v0;
  v5 = v0;

  v6 = *(void **)&v5[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_clientWrapper];
  *(_QWORD *)&v5[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_clientWrapper] = v3;
  v48 = v3;

  v7 = (void *)sub_232DD0DF0();
  v8 = objc_msgSend((id)objc_opt_self(), sel_interfaceWithIdentifier_, v7);

  v9 = (void *)objc_opt_self();
  v10 = objc_msgSend(v9, sel_protocolForProtocol_, &unk_256017080);
  objc_msgSend(v8, sel_setServer_, v10);

  v11 = objc_msgSend(v9, sel_protocolForProtocol_, &unk_256015BB0);
  objc_msgSend(v8, sel_setClient_, v11);

  objc_msgSend(v8, sel_setClientMessagingExpectation_, 0);
  v12 = (void *)sub_232DD0DF0();
  v13 = (void *)sub_232DD0DF0();
  v14 = objc_msgSend((id)objc_opt_self(), sel_endpointForMachName_service_instance_, v12, v13, 0);

  if (v14)
  {
    v15 = (void *)objc_opt_self();
    v16 = v14;
    v17 = objc_msgSend(v15, sel_connectionWithEndpoint_, v16);
    if (v17)
    {
      v18 = v17;
      aBlock[6] = &unk_256017020;
      v19 = swift_dynamicCastObjCProtocolConditional();
      if (v19)
      {
        v20 = (void *)v19;
        oslog = (os_log_t)v1;
        v21 = (_QWORD *)swift_allocObject();
        v21[2] = v8;
        v21[3] = v48;
        v21[4] = v5;
        v22 = swift_allocObject();
        *(_QWORD *)(v22 + 16) = sub_232DD0A58;
        *(_QWORD *)(v22 + 24) = v21;
        aBlock[4] = sub_232DD0A74;
        aBlock[5] = v22;
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_232DCE658;
        aBlock[3] = &block_descriptor_21;
        v23 = _Block_copy(aBlock);
        v24 = v5;
        v49 = v48;
        v25 = v18;
        v26 = v8;
        swift_retain();
        swift_release();
        objc_msgSend(v20, sel_configureConnection_, v23);

        _Block_release(v23);
        isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
        swift_release();
        if ((isEscapingClosureAtFileLocation & 1) != 0)
        {
          __break(1u);
        }
        else
        {
          v28 = *(void **)&v24[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_connection];
          *(_QWORD *)&v24[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_connection] = v20;
          v29 = v25;

          objc_msgSend(v20, sel_activate);
          v30 = (void *)sub_232DD0DF0();
          v31 = (void *)sub_232DD0DF0();
          v32 = objc_msgSend((id)objc_opt_self(), sel_attributeWithDomain_name_, v30, v31);

          __swift_instantiateConcreteTypeFromMangledName(&qword_255FF9C40);
          v33 = swift_allocObject();
          *(_OWORD *)(v33 + 16) = xmmword_232DD48F0;
          *(_QWORD *)(v33 + 32) = v32;
          aBlock[0] = v33;
          sub_232DD0E50();
          sub_232DD0A94(0, &qword_255FF9C48);
          v34 = v32;
          v35 = (void *)sub_232DD0E2C();
          swift_bridgeObjectRelease();
          v36 = objc_msgSend(v20, sel_remoteTargetWithLaunchingAssertionAttributes_, v35);

          if (v36)
          {
            sub_232DD0EF8();
            swift_unknownObjectRelease();
          }
          else
          {
            v51 = 0u;
            v52 = 0u;
          }
          sub_232DD0ACC((uint64_t)&v51, (uint64_t)aBlock);
          sub_232DD0BE8((uint64_t)aBlock, (uint64_t)&v51, &qword_255FF9C50);
          if (*((_QWORD *)&v52 + 1))
          {
            __swift_instantiateConcreteTypeFromMangledName(&qword_255FF9C58);
            v44 = swift_dynamicCast();
            v45 = v50;
            if (!v44)
              v45 = 0;
          }
          else
          {
            sub_232DD0B14((uint64_t)&v51);
            v45 = 0;
          }
          *(Class *)((char *)&oslog->isa + (_QWORD)v2) = v45;

          swift_unknownObjectRelease();
          sub_232DD0B14((uint64_t)aBlock);
          swift_release();
        }
        return;
      }

    }
    if (qword_255FF9930 != -1)
      swift_once();
    v40 = sub_232DD0DA8();
    __swift_project_value_buffer(v40, (uint64_t)qword_255FF9938);
    v41 = sub_232DD0D90();
    v42 = sub_232DD0E74();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v43 = 0;
      _os_log_impl(&dword_232DBE000, v41, v42, "No valid endpoint's connection available", v43, 2u);
      MEMORY[0x234928FD4](v43, -1, -1);

    }
    else
    {

    }
  }
  else
  {
    if (qword_255FF9930 != -1)
      swift_once();
    v37 = sub_232DD0DA8();
    __swift_project_value_buffer(v37, (uint64_t)qword_255FF9938);
    osloga = sub_232DD0D90();
    v38 = sub_232DD0E74();
    if (os_log_type_enabled(osloga, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v39 = 0;
      _os_log_impl(&dword_232DBE000, osloga, v38, "No server endpoint available", v39, 2u);
      MEMORY[0x234928FD4](v39, -1, -1);

    }
    else
    {

    }
  }
}

id sub_232DCE0F0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  void *v25;
  uint64_t v26;

  if (qword_255FF9930 != -1)
    swift_once();
  v8 = sub_232DD0DA8();
  __swift_project_value_buffer(v8, (uint64_t)qword_255FF9938);
  v9 = sub_232DD0D90();
  v10 = sub_232DD0E80();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_232DBE000, v9, v10, "configuring connection", v11, 2u);
    MEMORY[0x234928FD4](v11, -1, -1);
  }

  v12 = (void *)sub_232DD0DF0();
  objc_msgSend(a1, sel_setName_, v12);

  v13 = objc_msgSend((id)objc_opt_self(), sel_userInitiated);
  objc_msgSend(a1, sel_setServiceQuality_, v13);

  objc_msgSend(a1, sel_setInterface_, a2);
  objc_msgSend(a1, sel_setInterfaceTarget_, a3);
  v25 = sub_232DCE3EC;
  v26 = 0;
  v14 = MEMORY[0x24BDAC760];
  v21 = MEMORY[0x24BDAC760];
  v22 = 1107296256;
  v23 = sub_232DCE4B8;
  v24 = &block_descriptor_24;
  v15 = _Block_copy(&v21);
  objc_msgSend(a1, sel_setActivationHandler_, v15);
  _Block_release(v15);
  v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v25 = sub_232DD0B78;
  v26 = v16;
  v21 = v14;
  v22 = 1107296256;
  v23 = sub_232DCE4B8;
  v24 = &block_descriptor_30;
  v17 = _Block_copy(&v21);
  swift_release();
  objc_msgSend(a1, sel_setInvalidationHandler_, v17);
  _Block_release(v17);
  v18 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v25 = sub_232DD0B98;
  v26 = v18;
  v21 = v14;
  v22 = 1107296256;
  v23 = sub_232DCE4B8;
  v24 = &block_descriptor_34;
  v19 = _Block_copy(&v21);
  swift_release();
  objc_msgSend(a1, sel_setInterruptionHandler_, v19);
  _Block_release(v19);
  return objc_msgSend(a1, sel_setTargetQueue_, *(_QWORD *)(a4 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_queue));
}

void sub_232DCE3EC()
{
  uint64_t v0;
  os_log_type_t v1;
  uint8_t *v2;
  NSObject *oslog;

  if (qword_255FF9930 != -1)
    swift_once();
  v0 = sub_232DD0DA8();
  __swift_project_value_buffer(v0, (uint64_t)qword_255FF9938);
  oslog = sub_232DD0D90();
  v1 = sub_232DD0E80();
  if (os_log_type_enabled(oslog, v1))
  {
    v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_232DBE000, oslog, v1, "angel connection activated", v2, 2u);
    MEMORY[0x234928FD4](v2, -1, -1);
  }

}

void sub_232DCE4B8(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_232DCE508(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t result;
  char *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = a2 + 16;
  if (qword_255FF9930 != -1)
    swift_once();
  v5 = sub_232DD0DA8();
  __swift_project_value_buffer(v5, (uint64_t)qword_255FF9938);
  v6 = sub_232DD0D90();
  v7 = sub_232DD0E80();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_232DBE000, v6, v7, a3, v8, 2u);
    MEMORY[0x234928FD4](v8, -1, -1);
  }

  swift_beginAccess();
  result = MEMORY[0x23492901C](v4);
  if (result)
  {
    v10 = (char *)result;
    v11 = OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_connection;
    v12 = *(void **)(result + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_connection);
    if (v12)
    {
      objc_msgSend(v12, sel_invalidate);
      v13 = *(void **)&v10[v11];
    }
    else
    {
      v13 = 0;
    }
    *(_QWORD *)&v10[v11] = 0;

    *(_QWORD *)&v10[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_server] = 0;
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_232DCE658(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);
  return swift_unknownObjectRelease();
}

void *sub_232DCE694(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *result;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  char *v17;
  id v18;
  _QWORD v19[2];
  _QWORD aBlock[6];

  v3 = sub_232DD0DB4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_232DD0DD8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = (void *)MEMORY[0x23492901C](&v1[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_accessorySession]);
  if (result)
  {
    v12 = result;
    v13 = objc_msgSend(result, sel_queue);
    v19[0] = v4;
    v14 = v13;

    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = v1;
    *(_QWORD *)(v15 + 24) = a1;
    aBlock[4] = sub_232DD0C6C;
    aBlock[5] = v15;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_232DCE91C;
    aBlock[3] = &block_descriptor_41;
    v16 = _Block_copy(aBlock);
    v17 = v1;
    v18 = a1;
    sub_232DD0DC0();
    v19[1] = MEMORY[0x24BEE4AF8];
    sub_232DD042C(&qword_255FF9BB8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255FF9BC0);
    sub_232DD07C0(&qword_255FF9BC8, &qword_255FF9BC0);
    sub_232DD0F04();
    MEMORY[0x234928920](0, v10, v6, v16);
    _Block_release(v16);

    (*(void (**)(char *, uint64_t))(v19[0] + 8))(v6, v3);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    return (void *)swift_release();
  }
  return result;
}

uint64_t sub_232DCE8B0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  void (*v3)(uint64_t);
  uint64_t v5;

  v2 = (uint64_t *)(a1 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_completionHandler);
  v3 = *(void (**)(uint64_t))(a1 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_completionHandler);
  if (v3)
  {
    swift_retain();
    v3(a2);
    sub_232DCD34C((uint64_t)v3);
    v5 = *v2;
  }
  else
  {
    v5 = 0;
  }
  *v2 = 0;
  v2[1] = 0;
  return sub_232DCD34C(v5);
}

uint64_t sub_232DCE91C(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id ASUIClientManager.__deallocating_deinit()
{
  char *v0;
  void *v1;
  objc_super v3;

  v1 = *(void **)&v0[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_connection];
  if (v1)
    objc_msgSend(v1, sel_invalidate);
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for ASUIClientManager();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

id ASUIClientManager.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t (*v4)(uint64_t);
  uint64_t v5;
  char *v6;
  char *v7;
  objc_class *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  objc_super v13;
  uint64_t v14;

  v1 = sub_232DD0E98();
  v11 = *(_QWORD *)(v1 - 8);
  v12 = v1;
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_232DD0E8C();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8]();
  sub_232DD0DD8();
  MEMORY[0x24BDAC7A8]();
  swift_unknownObjectWeakInit();
  v5 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)&v0[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_displayItems] = MEMORY[0x24BEE4AF8];
  v10 = OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_queue;
  sub_232DD0A94(0, &qword_255FF99C8);
  v6 = v0;
  sub_232DD0DCC();
  v14 = v5;
  sub_232DD042C(&qword_255FF99D0, v4, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255FF99D8);
  sub_232DD07C0(&qword_255FF99E0, &qword_255FF99D8);
  sub_232DD0F04();
  (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v3, *MEMORY[0x24BEE5750], v12);
  *(_QWORD *)&v0[v10] = sub_232DD0EB0();
  v7 = &v6[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_completionHandler];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_connection] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_clientWrapper] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_server] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_startTicksFull] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_debounceCounter] = 0;

  v8 = (objc_class *)type metadata accessor for ASUIClientManager();
  v13.receiver = v6;
  v13.super_class = v8;
  return objc_msgSendSuper2(&v13, sel_init);
}

void sub_232DCED14()
{
  sub_232DCEEF4(80);
}

void sub_232DCED50(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v4;
  char *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientWrapper_clientManager);
  if (v2)
  {
    v4 = objc_allocWithZone((Class)ASAccessoryEvent);
    v5 = v2;
    v8 = objc_msgSend(v4, sel_initWithEventType_, 70);
    if (a1)
      v6 = (void *)sub_232DD0D78();
    else
      v6 = 0;
    objc_msgSend(v8, sel_setError_, v6);

    v7 = (void *)MEMORY[0x23492901C](&v5[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_accessorySession]);
    objc_msgSend(v7, sel_relayPickerEvent_, v8);

  }
}

void sub_232DCEE74()
{
  sub_232DCEEF4(60);
}

void sub_232DCEEB0()
{
  sub_232DCEEF4(90);
}

void sub_232DCEEEC()
{
  sub_232DCEEF4(40);
}

void sub_232DCEEF4(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v4;
  char *v5;
  void *v6;
  id v7;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientWrapper_clientManager);
  if (v2)
  {
    v4 = objc_allocWithZone((Class)ASAccessoryEvent);
    v5 = v2;
    v7 = objc_msgSend(v4, sel_initWithEventType_, a1);
    v6 = (void *)MEMORY[0x23492901C](&v5[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_accessorySession]);
    objc_msgSend(v6, sel_relayPickerEvent_, v7);

  }
}

void sub_232DCEFD8(void *a1)
{
  uint64_t v1;
  void *v2;
  id v4;
  char *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientWrapper_clientManager);
  if (v2)
  {
    v4 = objc_allocWithZone((Class)ASAccessoryEvent);
    v5 = v2;
    v6 = objc_msgSend(v4, sel_initWithEventType_, 50);
    if (a1)
      a1 = (void *)sub_232DD0D78();
    objc_msgSend(v6, sel_setError_, a1);

    v7 = (void *)MEMORY[0x23492901C](&v5[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_accessorySession]);
    objc_msgSend(v7, sel_relayPickerEvent_, v6);

    v8 = OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_connection;
    v9 = *(void **)&v5[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_connection];
    if (v9)
    {
      objc_msgSend(v9, sel_invalidate);
      v10 = *(void **)&v5[v8];
    }
    else
    {
      v10 = 0;
    }
    *(_QWORD *)&v5[v8] = 0;

    *(_QWORD *)&v5[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_server] = 0;
    swift_unknownObjectRelease();
    v11 = *(id *)&v5[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_clientWrapper];
    *(_QWORD *)&v5[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_clientWrapper] = 0;

  }
}

uint64_t sub_232DCF170(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  char *v11;
  char *v12;
  void *v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void *v17;
  char *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD aBlock[6];

  v3 = sub_232DD0DB4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_232DD0DD8();
  v8 = *(_QWORD *)(v7 - 8);
  result = MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(char **)(v1 + OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientWrapper_clientManager);
  if (v12)
  {
    result = MEMORY[0x23492901C](&v12[OBJC_IVAR____TtC17AccessorySetupKit17ASUIClientManager_accessorySession]);
    if (result)
    {
      v13 = (void *)result;
      v14 = v12;
      v23 = v4;
      v15 = v14;
      v22 = objc_msgSend(v13, sel_queue);

      v16 = swift_allocObject();
      *(_QWORD *)(v16 + 16) = v15;
      *(_QWORD *)(v16 + 24) = a1;
      aBlock[4] = sub_232DD07A0;
      aBlock[5] = v16;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_232DCE91C;
      aBlock[3] = &block_descriptor;
      v17 = _Block_copy(aBlock);
      v18 = v15;
      v19 = a1;
      sub_232DD0DC0();
      v24 = MEMORY[0x24BEE4AF8];
      sub_232DD042C(&qword_255FF9BB8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255FF9BC0);
      sub_232DD07C0(&qword_255FF9BC8, &qword_255FF9BC0);
      sub_232DD0F04();
      v20 = v22;
      MEMORY[0x234928920](0, v11, v6, v17);
      _Block_release(v17);

      (*(void (**)(char *, uint64_t))(v23 + 8))(v6, v3);
      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);

      return swift_release();
    }
  }
  return result;
}

uint64_t sub_232DCF3F8(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t i;
  unint64_t v6;
  unint64_t v7;
  id *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  _OWORD v12[2];
  uint64_t v13;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_232DD0F40();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x24BEE4AF8];
  if (!v2)
    return v3;
  v13 = MEMORY[0x24BEE4AF8];
  result = sub_232DD0800(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v2; ++i)
      {
        MEMORY[0x234928998](i, a1);
        sub_232DD0A94(0, &qword_255FF99B8);
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_232DD0800(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v7 = *(_QWORD *)(v3 + 16);
        v6 = *(_QWORD *)(v3 + 24);
        if (v7 >= v6 >> 1)
        {
          sub_232DD0800(v6 > 1, v7 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v7 + 1;
        sub_232DD081C(v12, (_OWORD *)(v3 + 32 * v7 + 32));
      }
    }
    else
    {
      v8 = (id *)(a1 + 32);
      sub_232DD0A94(0, &qword_255FF99B8);
      do
      {
        v9 = *v8;
        swift_dynamicCast();
        v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_232DD0800(0, *(_QWORD *)(v3 + 16) + 1, 1);
          v3 = v13;
        }
        v11 = *(_QWORD *)(v3 + 16);
        v10 = *(_QWORD *)(v3 + 24);
        if (v11 >= v10 >> 1)
        {
          sub_232DD0800(v10 > 1, v11 + 1, 1);
          v3 = v13;
        }
        *(_QWORD *)(v3 + 16) = v11 + 1;
        sub_232DD081C(v12, (_OWORD *)(v3 + 32 * v11 + 32));
        ++v8;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

id sub_232DCF73C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ASUIClientWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_232DCF77C()
{
  sub_232DD042C(&qword_255FF9B80, (uint64_t (*)(uint64_t))type metadata accessor for ASError, (uint64_t)&unk_232DD4A94);
  return sub_232DD0F7C();
}

uint64_t sub_232DCF7BC()
{
  sub_232DD042C(&qword_255FF9B80, (uint64_t (*)(uint64_t))type metadata accessor for ASError, (uint64_t)&unk_232DD4A94);
  return sub_232DD0F70();
}

uint64_t sub_232DCF800()
{
  sub_232DD042C(&qword_255FF9988, (uint64_t (*)(uint64_t))type metadata accessor for ASError, (uint64_t)&unk_232DD4AD8);
  return sub_232DD0D24();
}

id sub_232DCF840()
{
  id *v0;

  return *v0;
}

uint64_t sub_232DCF848@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_232DCF850()
{
  return sub_232DD0DFC();
}

uint64_t sub_232DCF860()
{
  sub_232DD042C(&qword_255FF9988, (uint64_t (*)(uint64_t))type metadata accessor for ASError, (uint64_t)&unk_232DD4AD8);
  return sub_232DD0D60();
}

uint64_t sub_232DCF8A0()
{
  sub_232DD042C(&qword_255FF9988, (uint64_t (*)(uint64_t))type metadata accessor for ASError, (uint64_t)&unk_232DD4AD8);
  return sub_232DD0D3C();
}

uint64_t sub_232DCF8E0(void *a1)
{
  id v2;

  sub_232DD042C(&qword_255FF9988, (uint64_t (*)(uint64_t))type metadata accessor for ASError, (uint64_t)&unk_232DD4AD8);
  v2 = a1;
  return sub_232DD0D30();
}

uint64_t sub_232DCF944()
{
  id *v0;
  id v1;
  uint64_t v2;

  v1 = *v0;
  v2 = sub_232DD0ED4();

  return v2;
}

uint64_t sub_232DCF978()
{
  sub_232DD042C(&qword_255FF9988, (uint64_t (*)(uint64_t))type metadata accessor for ASError, (uint64_t)&unk_232DD4AD8);
  return sub_232DD0D54();
}

uint64_t sub_232DCF9C8()
{
  sub_232DD0F94();
  sub_232DD0DE4();
  return sub_232DD0FA0();
}

_QWORD *sub_232DCFA24@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_232DCFA34(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_232DCFA40()
{
  sub_232DD042C(&qword_255FF9988, (uint64_t (*)(uint64_t))type metadata accessor for ASError, (uint64_t)&unk_232DD4AD8);
  return sub_232DD0D48();
}

BOOL sub_232DCFA98(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

unint64_t sub_232DCFAAC(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255FF9C60);
  v2 = sub_232DD0F4C();
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
    sub_232DD0BE8(v6, (uint64_t)&v15, &qword_255FF9C68);
    v7 = v15;
    v8 = v16;
    result = sub_232DCFC24(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_232DD081C(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
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

uint64_t sub_232DCFBE0(uint64_t a1, unint64_t a2)
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

unint64_t sub_232DCFC24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_232DD0F94();
  sub_232DD0E08();
  v4 = sub_232DD0FA0();
  return sub_232DCFC88(a1, a2, v4);
}

unint64_t sub_232DCFC88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v15;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  i = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_232DD0F64() & 1) == 0)
    {
      v12 = ~v5;
      i = (i + 1) & v12;
      if (((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
      {
        v13 = (_QWORD *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_232DD0F64() & 1) == 0)
        {
          for (i = (i + 1) & v12; ((*(_QWORD *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v12)
          {
            v15 = (_QWORD *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2)
              break;
            if ((sub_232DD0F64() & 1) != 0)
              break;
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_232DCFDCC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_232DCFE9C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_232DD09E8((uint64_t)v12, *a3);
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
      sub_232DD09E8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_232DCFE9C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_232DD0EEC();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_232DD0054(a5, a6);
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
  v8 = sub_232DD0F28();
  if (!v8)
  {
    sub_232DD0F34();
    __break(1u);
LABEL_17:
    result = sub_232DD0F58();
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

uint64_t sub_232DD0054(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_232DD00E8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_232DD02C0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_232DD02C0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_232DD00E8(uint64_t a1, unint64_t a2)
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
      v3 = sub_232DD025C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_232DD0F10();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_232DD0F34();
      __break(1u);
LABEL_10:
      v2 = sub_232DD0E14();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_232DD0F58();
    __break(1u);
LABEL_14:
    result = sub_232DD0F34();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_232DD025C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255FF9BD8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_232DD02C0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255FF9BD8);
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
  result = sub_232DD0F58();
  __break(1u);
  return result;
}

uint64_t type metadata accessor for ASUIClientManager()
{
  return objc_opt_self();
}

uint64_t sub_232DD042C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x234928F74](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x234928F5C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x234928F68](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t method lookup function for ASUIClientManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ASUIClientManager.activateConnection(session:with:for:completionHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x158))();
}

uint64_t dispatch thunk of ASUIClientManager.fail(accessory:completionHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x160))();
}

uint64_t dispatch thunk of ASUIClientManager.update(accessory:options:for:completionHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x168))();
}

uint64_t type metadata accessor for ASUIClientWrapper()
{
  return objc_opt_self();
}

uint64_t sub_232DD0570()
{
  return sub_232DD042C(&qword_255FF9B70, (uint64_t (*)(uint64_t))type metadata accessor for ASError, (uint64_t)&unk_232DD49AC);
}

uint64_t sub_232DD059C()
{
  return sub_232DD042C(&qword_255FF9B78, (uint64_t (*)(uint64_t))type metadata accessor for ASError, (uint64_t)&unk_232DD49D8);
}

uint64_t sub_232DD05C8()
{
  return sub_232DD042C(&qword_255FF9B80, (uint64_t (*)(uint64_t))type metadata accessor for ASError, (uint64_t)&unk_232DD4A94);
}

uint64_t sub_232DD05F4()
{
  return sub_232DD042C(&qword_255FF9B88, (uint64_t (*)(uint64_t))type metadata accessor for ASError, (uint64_t)&unk_232DD4A60);
}

uint64_t sub_232DD0620()
{
  return sub_232DD042C(&qword_255FF9B90, (uint64_t (*)(uint64_t))type metadata accessor for ASError, (uint64_t)&unk_232DD4A1C);
}

uint64_t sub_232DD064C()
{
  return sub_232DD042C(&qword_255FF9B98, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_232DD4B80);
}

void type metadata accessor for Code(uint64_t a1)
{
  sub_232DD068C(a1, (unint64_t *)&unk_255FF9C70);
}

void sub_232DD068C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_232DD06D0()
{
  return sub_232DD042C(&qword_255FF9BA0, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_232DD4B44);
}

unint64_t sub_232DD0700()
{
  unint64_t result;

  result = qword_255FF9BA8;
  if (!qword_255FF9BA8)
  {
    result = MEMORY[0x234928F74](MEMORY[0x24BEE17C8], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_255FF9BA8);
  }
  return result;
}

uint64_t sub_232DD0744()
{
  return sub_232DD042C(&qword_255FF9BB0, (uint64_t (*)(uint64_t))type metadata accessor for Code, (uint64_t)&unk_232DD4BBC);
}

uint64_t sub_232DD0770()
{
  return sub_232DD042C(&qword_255FF9988, (uint64_t (*)(uint64_t))type metadata accessor for ASError, (uint64_t)&unk_232DD4AD8);
}

uint64_t sub_232DD07A0()
{
  uint64_t v0;

  return sub_232DCE8B0(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
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

uint64_t sub_232DD07C0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x234928F74](MEMORY[0x24BEE12C8], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_232DD0800(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_232DD082C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

_OWORD *sub_232DD081C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_232DD082C(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_255FF9BD0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_232DD0F58();
  __break(1u);
  return result;
}

void sub_232DD099C(uint64_t a1)
{
  uint64_t v1;

  sub_232DCD468(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_232DD09A4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
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

uint64_t sub_232DD09E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_232DD0A24()
{
  id *v0;

  return swift_deallocObject();
}

id sub_232DD0A58(void *a1)
{
  uint64_t *v1;

  return sub_232DCE0F0(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_232DD0A64()
{
  return swift_deallocObject();
}

uint64_t sub_232DD0A74()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_232DD0A94(uint64_t a1, unint64_t *a2)
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

uint64_t sub_232DD0ACC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255FF9C50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_232DD0B14(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255FF9C50);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_232DD0B54()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_232DD0B78(uint64_t a1)
{
  uint64_t v1;

  return sub_232DCE508(a1, v1, "angel connection invalidated");
}

uint64_t sub_232DD0B98(uint64_t a1)
{
  uint64_t v1;

  return sub_232DCE508(a1, v1, "angel connection interrupted");
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_232DD0BE8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
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

uint64_t sub_232DD0CA4()
{
  uint64_t v0;

  v0 = sub_232DD0DA8();
  __swift_allocate_value_buffer(v0, qword_255FFA180);
  __swift_project_value_buffer(v0, (uint64_t)qword_255FFA180);
  return sub_232DD0D9C();
}

uint64_t sub_232DD0D24()
{
  return MEMORY[0x24BDCD280]();
}

uint64_t sub_232DD0D30()
{
  return MEMORY[0x24BDCD288]();
}

uint64_t sub_232DD0D3C()
{
  return MEMORY[0x24BDCD290]();
}

uint64_t sub_232DD0D48()
{
  return MEMORY[0x24BDCD298]();
}

uint64_t sub_232DD0D54()
{
  return MEMORY[0x24BDCD2A8]();
}

uint64_t sub_232DD0D60()
{
  return MEMORY[0x24BDCD2B8]();
}

uint64_t sub_232DD0D6C()
{
  return MEMORY[0x24BDCD2C0]();
}

uint64_t sub_232DD0D78()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_232DD0D84()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_232DD0D90()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_232DD0D9C()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_232DD0DA8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_232DD0DB4()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_232DD0DC0()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_232DD0DCC()
{
  return MEMORY[0x24BEE54D0]();
}

uint64_t sub_232DD0DD8()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_232DD0DE4()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_232DD0DF0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_232DD0DFC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_232DD0E08()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_232DD0E14()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_232DD0E20()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_232DD0E2C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_232DD0E38()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_232DD0E44()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_232DD0E50()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_232DD0E5C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_232DD0E68()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_232DD0E74()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_232DD0E80()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_232DD0E8C()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_232DD0E98()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_232DD0EA4()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_232DD0EB0()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_232DD0EBC()
{
  return MEMORY[0x24BDD01F0]();
}

uint64_t sub_232DD0EC8()
{
  return MEMORY[0x24BDD01F8]();
}

uint64_t sub_232DD0ED4()
{
  return MEMORY[0x24BEE5BD0]();
}

uint64_t sub_232DD0EE0()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_232DD0EEC()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_232DD0EF8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_232DD0F04()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_232DD0F10()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_232DD0F1C()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_232DD0F28()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_232DD0F34()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_232DD0F40()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_232DD0F4C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_232DD0F58()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_232DD0F64()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_232DD0F70()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_232DD0F7C()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_232DD0F88()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_232DD0F94()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_232DD0FA0()
{
  return MEMORY[0x24BEE4328]();
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

uint64_t CUAppendF()
{
  return MEMORY[0x24BE29110]();
}

uint64_t CUPrintFlags64()
{
  return MEMORY[0x24BE291B8]();
}

uint64_t CUPrintHex()
{
  return MEMORY[0x24BE291C0]();
}

uint64_t CUPrintNSError()
{
  return MEMORY[0x24BE291D8]();
}

uint64_t CUXPCDecodeNSData()
{
  return MEMORY[0x24BE29238]();
}

uint64_t CUXPCDecodeNSString()
{
  return MEMORY[0x24BE29258]();
}

uint64_t CUXPCDecodeNSUUID()
{
  return MEMORY[0x24BE29260]();
}

uint64_t CUXPCDecodeObject()
{
  return MEMORY[0x24BE29268]();
}

uint64_t CUXPCDecodeSInt64RangedEx()
{
  return MEMORY[0x24BE29270]();
}

uint64_t CUXPCDecodeUInt64RangedEx()
{
  return MEMORY[0x24BE29278]();
}

uint64_t CUXPCEncodeObject()
{
  return MEMORY[0x24BE292A0]();
}

uint64_t FatalErrorF()
{
  return MEMORY[0x24BE29380]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x24BE295F0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t NSDecodeObjectIfPresent()
{
  return MEMORY[0x24BE29660]();
}

uint64_t NSDecodeSInt64RangedIfPresent()
{
  return MEMORY[0x24BE29668]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BEBE2E0](image);
}

uint64_t UpTicksToSeconds()
{
  return MEMORY[0x24BE29B00]();
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

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x24BE29B48]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x24BDADBA8]();
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x24BDAE148]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
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

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x24BEE4C70]();
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

uint64_t tcc_authorization_record_get_authorization_right()
{
  return MEMORY[0x24BEB39B0]();
}

uint64_t tcc_credential_singleton_for_self()
{
  return MEMORY[0x24BEB39E0]();
}

uint64_t tcc_message_options_create()
{
  return MEMORY[0x24BEB3A08]();
}

uint64_t tcc_message_options_set_reply_handler_policy()
{
  return MEMORY[0x24BEB3A10]();
}

uint64_t tcc_message_options_set_request_prompt_policy()
{
  return MEMORY[0x24BEB3A18]();
}

uint64_t tcc_server_create()
{
  return MEMORY[0x24BEB3A20]();
}

uint64_t tcc_server_message_request_authorization()
{
  return MEMORY[0x24BEB3A38]();
}

uint64_t tcc_service_singleton_for_CF_name()
{
  return MEMORY[0x24BEB3A50]();
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x24BDB0830]();
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  MEMORY[0x24BDB09D8](xdict, key, uuid);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

