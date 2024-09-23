void sub_237D8F3EC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_237D8F670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_237D8F79C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_237D8FEB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_237D900E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_237D90300()
{
  uint64_t v0;
  id v1;

  v0 = sub_237D99134();
  __swift_allocate_value_buffer(v0, static Logger.common);
  __swift_project_value_buffer(v0, (uint64_t)static Logger.common);
  v1 = objc_msgSend((id)objc_opt_self(), sel_commonLog);
  return sub_237D99140();
}

uint64_t Logger.common.unsafeMutableAddressor()
{
  uint64_t v0;

  if (qword_25688A8A8 != -1)
    swift_once();
  v0 = sub_237D99134();
  return __swift_project_value_buffer(v0, (uint64_t)static Logger.common);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t static Logger.common.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_25688A8A8 != -1)
    swift_once();
  v2 = sub_237D99134();
  v3 = __swift_project_value_buffer(v2, (uint64_t)static Logger.common);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t variable initialization expression of OpenApplicationVerifierResult.error()
{
  return 0;
}

uint64_t variable initialization expression of OpenApplicationVerifierResult.pptTestURL@<X0>(uint64_t a1@<X8>)
{
  return sub_237D90484((uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], a1);
}

uint64_t variable initialization expression of ApplicationSceneClientSettings._navigationTitles()
{
  return MEMORY[0x24BEE4AF8];
}

uint64_t variable initialization expression of ApplicationSceneClientSettings._chromeVisible()
{
  return 1;
}

uint64_t variable initialization expression of ApplicationSceneClientSettings._bottomBarTransitionProgress()
{
  return 0;
}

uint64_t variable initialization expression of LockState.lockStateChangedBlockIdentifier@<X0>(uint64_t a1@<X8>)
{
  return sub_237D90484((uint64_t (*)(_QWORD))MEMORY[0x24BDCEA58], a1);
}

uint64_t sub_237D90484@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;

  v3 = a1(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(a2, 1, 1, v3);
}

uint64_t variable initialization expression of LockState._isLocked()
{
  return 1;
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

uint64_t OpenApplicationVerifierRequest.verifierDescription.getter(uint64_t a1, uint64_t a2)
{
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v13[2];
  uint64_t v14;
  unint64_t v15;

  v14 = 0;
  v15 = 0xE000000000000000;
  sub_237D99398();
  sub_237D99230();
  (*(void (**)(uint64_t, uint64_t))(a2 + 8))(a1, a2);
  sub_237D99230();
  swift_bridgeObjectRelease();
  sub_237D99230();
  (*(void (**)(uint64_t, uint64_t))(a2 + 32))(a1, a2);
  sub_237D99230();
  swift_bridgeObjectRelease();
  sub_237D99230();
  (*(void (**)(uint64_t, uint64_t))(a2 + 24))(a1, a2);
  sub_237D99230();
  swift_bridgeObjectRelease();
  sub_237D99230();
  v4 = *(void (**)(uint64_t, uint64_t))(a2 + 40);
  v4(a1, a2);
  if (v5)
  {
    v6 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 48))(a1, a2);
    if (v6)
    {
      v7 = (void *)v6;
      sub_237D99398();
      swift_bridgeObjectRelease();
      strcpy((char *)v13, "bundle id: ");
      HIDWORD(v13[1]) = -352321536;
      sub_237D99230();
      swift_bridgeObjectRelease();
      sub_237D99230();
      v8 = objc_msgSend(v7, sel_description, v13[0]);
LABEL_9:
      v11 = v8;
      sub_237D9920C();

      sub_237D99230();
      swift_bridgeObjectRelease();
      sub_237D99230();

      goto LABEL_10;
    }
    swift_bridgeObjectRelease();
  }
  v4(a1, a2);
  if (!v9)
  {
    v10 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a2 + 48))(a1, a2);
    if (!v10)
    {
      sub_237D99230();
      goto LABEL_11;
    }
    v7 = v10;
    strcpy((char *)v13, "process id: ");
    BYTE5(v13[1]) = 0;
    HIWORD(v13[1]) = -5120;
    v8 = objc_msgSend(v10, sel_description, v13[0]);
    goto LABEL_9;
  }
  strcpy((char *)v13, "bundle id: ");
  HIDWORD(v13[1]) = -352321536;
  sub_237D99230();
  swift_bridgeObjectRelease();
  sub_237D99230();
LABEL_10:
  swift_bridgeObjectRelease();
LABEL_11:
  sub_237D99398();
  swift_bridgeObjectRelease();
  v13[0] = 0xD000000000000015;
  v13[1] = 0x8000000237D9A4F0;
  (*(void (**)(uint64_t, uint64_t))(a2 + 56))(a1, a2);
  sub_237D99230();
  swift_bridgeObjectRelease();
  sub_237D99230();
  swift_bridgeObjectRelease();
  return v14;
}

BOOL static OpenApplicationVerifierResult.ErrorCode.__derived_enum_equals(_:_:)(char a1, char a2)
{
  return a1 == a2;
}

uint64_t OpenApplicationVerifierResult.ErrorCode.hash(into:)()
{
  return sub_237D994A0();
}

uint64_t OpenApplicationVerifierResult.ErrorCode.hashValue.getter()
{
  sub_237D99494();
  sub_237D994A0();
  return sub_237D994AC();
}

BOOL sub_237D909DC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_237D909F0()
{
  sub_237D99494();
  sub_237D994A0();
  return sub_237D994AC();
}

uint64_t sub_237D90A34()
{
  return sub_237D994A0();
}

uint64_t sub_237D90A5C()
{
  sub_237D99494();
  sub_237D994A0();
  return sub_237D994AC();
}

uint64_t OpenApplicationVerifierResult.Error.code.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*OpenApplicationVerifierResult.Error.code.modify())()
{
  return nullsub_1;
}

uint64_t OpenApplicationVerifierResult.Error.description.getter(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRetain();
  return a2;
}

uint64_t OpenApplicationVerifierResult.Error.description.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

uint64_t (*OpenApplicationVerifierResult.Error.description.modify())()
{
  return nullsub_1;
}

uint64_t OpenApplicationVerifierResult.error.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t OpenApplicationVerifierResult.error.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v3 = a1;
  v3[1] = a2;
  v3[2] = a3;
  return result;
}

uint64_t (*OpenApplicationVerifierResult.error.modify())()
{
  return nullsub_1;
}

uint64_t OpenApplicationVerifierResult.pptTestURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for OpenApplicationVerifierResult() + 20);
  return sub_237D90C24(v3, a1);
}

uint64_t type metadata accessor for OpenApplicationVerifierResult()
{
  uint64_t result;

  result = qword_25688A950;
  if (!qword_25688A950)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_237D90C24(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688A8E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B823688]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t OpenApplicationVerifierResult.pptTestURL.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for OpenApplicationVerifierResult() + 20);
  return sub_237D90CDC(a1, v3);
}

uint64_t sub_237D90CDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688A8E0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*OpenApplicationVerifierResult.pptTestURL.modify())()
{
  type metadata accessor for OpenApplicationVerifierResult();
  return nullsub_1;
}

uint64_t OpenApplicationVerifier.__allocating_init(userSelectedApplicationBundleIdentifiers:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = swift_allocObject();
  v3 = sub_237D94100(a1);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = v3;
  return v2;
}

uint64_t OpenApplicationVerifier.init(userSelectedApplicationBundleIdentifiers:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = sub_237D94100(a1);
  swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = v2;
  return v1;
}

Swift::Bool __swiftcall OpenApplicationVerifier.shouldOpenApp(bundleIdentifier:)(Swift::String bundleIdentifier)
{
  uint64_t v1;
  void *object;
  uint64_t countAndFlagsBits;

  object = bundleIdentifier._object;
  countAndFlagsBits = bundleIdentifier._countAndFlagsBits;
  if (qword_25688A8B0 != -1)
    swift_once();
  if ((sub_237D90E8C(countAndFlagsBits, (uint64_t)object, qword_25688B108) & 1) != 0 || (sub_237D99248() & 1) != 0)
    return 1;
  else
    return sub_237D90E8C(countAndFlagsBits, (uint64_t)object, *(_QWORD *)(v1 + 16));
}

uint64_t sub_237D90E8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  BOOL v17;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_237D99494();
    sub_237D99224();
    v6 = sub_237D994AC();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_237D99464() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_237D99464() & 1) != 0)
            break;
          result = 0;
          v15 = (v15 + 1) & v14;
          if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
            return result;
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_237D90FC0(void *a1, uint64_t a2)
{
  id v3;
  char v4;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  char v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  id v15;

  if ((a2 & 0xC000000000000001) != 0)
  {
    v3 = a1;
    v4 = sub_237D99368();

    return v4 & 1;
  }
  if (!*(_QWORD *)(a2 + 16)
    || (v6 = sub_237D992CC(),
        v7 = -1 << *(_BYTE *)(a2 + 32),
        v8 = v6 & ~v7,
        v9 = a2 + 56,
        ((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0))
  {
LABEL_11:
    v12 = 0;
    return v12 & 1;
  }
  sub_237D9559C(0, &qword_25688AA60);
  v10 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v8);
  v11 = sub_237D992D8();

  if ((v11 & 1) == 0)
  {
    v13 = ~v7;
    v14 = (v8 + 1) & v13;
    if (((*(_QWORD *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
    {
      do
      {
        v15 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v14);
        v12 = sub_237D992D8();

        if ((v12 & 1) != 0)
          break;
        v14 = (v14 + 1) & v13;
      }
      while (((*(_QWORD *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0);
      return v12 & 1;
    }
    goto LABEL_11;
  }
  v12 = 1;
  return v12 & 1;
}

uint64_t OpenApplicationVerifier.verifyRequest(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3[28] = a2;
  v3[29] = v2;
  v3[27] = a1;
  v4 = sub_237D990F8();
  v3[30] = v4;
  v3[31] = *(_QWORD *)(v4 - 8);
  v3[32] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25688A8E0);
  v3[33] = swift_task_alloc();
  v3[34] = swift_task_alloc();
  sub_237D9926C();
  v3[35] = sub_237D99260();
  sub_237D99254();
  return swift_task_switch();
}

uint64_t sub_237D911E8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  void (*v30)(_QWORD, uint64_t, uint64_t, _QWORD);
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  void (*v35)(_QWORD, uint64_t, uint64_t, _QWORD);
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  int8x16_t v52;
  const char *v53;
  uint64_t v54;
  id v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(uint64_t, uint64_t, uint64_t);
  id v76;
  void *v77;
  unsigned int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  unint64_t v83;
  uint64_t v84;
  int8x16_t *v85;
  uint64_t v86;

  v1 = *(_QWORD **)(v0 + 224);
  swift_release();
  v2 = v1[3];
  v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  v6 = v5;
  v7 = v1[3];
  v8 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v7);
  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 40))(v7, v8);
  if (!v6)
  {
    if (!v10)
    {
LABEL_13:
      sub_237D941B8(*(_QWORD *)(v0 + 224), v0 + 16);
      goto LABEL_14;
    }
LABEL_10:
    v14 = *(_QWORD *)(v0 + 224);
    swift_bridgeObjectRelease();
    sub_237D941B8(v14, v0 + 16);
    goto LABEL_11;
  }
  if (!v10)
    goto LABEL_10;
  if (v4 == v9 && v6 == v10)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  v12 = *(_QWORD *)(v0 + 224);
  v13 = sub_237D99464();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_237D941B8(v12, v0 + 16);
  if ((v13 & 1) == 0)
  {
LABEL_11:
    v15 = *(_QWORD *)(v0 + 224);
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
    sub_237D941B8(v15, v0 + 56);
LABEL_17:
    __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
LABEL_18:
    v27 = (_QWORD *)(v0 + 136);
    v28 = (_QWORD *)(v0 + 176);
    v29 = *(_QWORD **)(v0 + 224);
    v30 = *(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 248) + 56);
    v30(*(_QWORD *)(v0 + 272), 1, 1, *(_QWORD *)(v0 + 240));
    v31 = v1[3];
    v32 = v1[4];
    __swift_project_boxed_opaque_existential_1(v29, v31);
    v33 = (*(uint64_t (**)(uint64_t, uint64_t))(v32 + 32))(v31, v32);
    sub_237D941B8((uint64_t)v29, v0 + 96);
    v34 = *(_QWORD *)(v0 + 224);
    if ((v33 & 1) != 0)
    {
      v35 = v30;
      v36 = *(_QWORD *)(v0 + 120);
      v37 = *(_QWORD *)(v0 + 128);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 96), v36);
      v38 = *(uint64_t (**)(uint64_t, uint64_t))(v37 + 8);
      v39 = v37;
      v30 = v35;
      v28 = (_QWORD *)(v0 + 176);
      v27 = (_QWORD *)(v0 + 136);
      v40 = v38(v36, v39);
      LOBYTE(v36) = sub_237D94444(v40, v41);
      swift_bridgeObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm(v0 + 96);
      sub_237D941B8(v34, v0 + 136);
      if ((v36 & 1) == 0)
      {
        v42 = *(_QWORD *)(v0 + 160);
        v43 = *(_QWORD *)(v0 + 168);
        __swift_project_boxed_opaque_existential_1(v27, v42);
        v44 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v43 + 48))(v42, v43);
        v45 = *(_QWORD *)(v0 + 160);
        v46 = *(_QWORD *)(v0 + 168);
        __swift_project_boxed_opaque_existential_1(v27, v45);
        v47 = (*(uint64_t (**)(uint64_t, uint64_t))(v46 + 40))(v45, v46);
        v49 = v48;
        if (v48)
        {
          v50 = v47;
          if (qword_25688A8D0 != -1)
            swift_once();
          if ((sub_237D90E8C(v50, v49, qword_25688B128) & 1) != 0)
          {
            swift_bridgeObjectRelease();

LABEL_32:
            v57 = *(_QWORD *)(v0 + 224);
            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v27);
            sub_237D941B8(v57, (uint64_t)v28);
            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
            goto LABEL_35;
          }
        }
        if (v44)
        {
          v54 = qword_25688A8C8;
          v55 = v44;
          if (v54 != -1)
            swift_once();
          v56 = sub_237D90FC0(v55, qword_25688B120);

          swift_bridgeObjectRelease();
          if ((v56 & 1) != 0)
            goto LABEL_32;
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        v58 = *(_QWORD *)(v0 + 224);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v27);
        sub_237D941B8(v58, (uint64_t)v28);
        v59 = *(_QWORD *)(v0 + 200);
        v60 = *(_QWORD *)(v0 + 208);
        __swift_project_boxed_opaque_existential_1(v28, v59);
        v61 = (*(uint64_t (**)(uint64_t, uint64_t))(v60 + 8))(v59, v60);
        LOBYTE(v59) = sub_237D94564(v61, v62);
        swift_bridgeObjectRelease();
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
        if ((v59 & 1) == 0)
        {
          swift_bridgeObjectRelease();
          v52 = (int8x16_t)xmmword_237D99BA0;
          v53 = "Not allowing open application request from unallowed client process.";
          goto LABEL_53;
        }
        goto LABEL_35;
      }
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_1Tm(v0 + 96);
      sub_237D941B8(v34, v0 + 136);
    }
    v51 = *(_QWORD *)(v0 + 224);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v27);
    sub_237D941B8(v51, (uint64_t)v28);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v28);
    if ((v33 & 1) == 0)
    {
      v52 = (int8x16_t)xmmword_237D99BB0;
      v53 = "Untrusted open application requests are not allowed in Assistive Access.";
      goto LABEL_53;
    }
LABEL_35:
    v63 = v1[3];
    v64 = v1[4];
    __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 224), v63);
    v65 = (*(uint64_t (**)(uint64_t, uint64_t))(v64 + 8))(v63, v64);
    if (v66)
    {
      v67 = v65;
      v68 = v66;
      if (qword_25688A8B0 != -1)
        swift_once();
      if ((sub_237D90E8C(v67, v68, qword_25688B108) & 1) == 0 && (sub_237D99248() & 1) == 0)
      {
        v82 = sub_237D90E8C(v67, v68, *(_QWORD *)(*(_QWORD *)(v0 + 232) + 16));
        swift_bridgeObjectRelease();
        v69 = 0x8000000237D9A590;
        if ((v82 & 1) != 0)
        {
          v69 = 0;
          v83 = -1;
        }
        else
        {
          v83 = 0;
        }
        v52 = vbicq_s8((int8x16_t)xmmword_237D99BC0, (int8x16_t)vdupq_n_s64(v83));
        goto LABEL_54;
      }
      swift_bridgeObjectRelease();
      goto LABEL_41;
    }
    v70 = *(_QWORD *)(v0 + 264);
    v71 = *(_QWORD *)(v0 + 240);
    v72 = *(_QWORD *)(v0 + 248);
    v74 = v1[3];
    v73 = v1[4];
    __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 224), v74);
    (*(void (**)(uint64_t, uint64_t))(v73 + 16))(v74, v73);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v72 + 48))(v70, 1, v71) == 1)
    {
      sub_237D95618(*(_QWORD *)(v0 + 264), &qword_25688A8E0);
    }
    else
    {
      v75 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 248) + 32);
      v75(*(_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 264), *(_QWORD *)(v0 + 240));
      v76 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
      v77 = (void *)sub_237D990EC();
      v78 = objc_msgSend(v76, sel__shouldHandleTestURL_, v77);

      v79 = *(_QWORD *)(v0 + 240);
      if (v78)
      {
        v80 = *(_QWORD *)(v0 + 272);
        v81 = *(_QWORD *)(v0 + 256);
        sub_237D95618(v80, &qword_25688A8E0);
        v75(v80, v81, v79);
        v30(v80, 0, 1, v79);
LABEL_41:
        v69 = 0;
        v52 = 0uLL;
LABEL_54:
        v84 = *(_QWORD *)(v0 + 272);
        v85 = *(int8x16_t **)(v0 + 216);
        *v85 = v52;
        v85[1].i64[0] = v69;
        v86 = type metadata accessor for OpenApplicationVerifierResult();
        sub_237D955D4(v84, (uint64_t)v85->i64 + *(int *)(v86 + 20), &qword_25688A8E0);
        goto LABEL_55;
      }
      (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 248) + 8))(*(_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 240));
    }
    v52 = (int8x16_t)xmmword_237D99BD0;
    v53 = "System app URL requests only supported for PPT.";
LABEL_53:
    v69 = (unint64_t)(v53 - 32) | 0x8000000000000000;
    goto LABEL_54;
  }
LABEL_14:
  v16 = *(_QWORD *)(v0 + 224);
  v17 = *(_QWORD *)(v0 + 40);
  v18 = *(_QWORD *)(v0 + 48);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v17);
  v19 = (*(uint64_t (**)(uint64_t, uint64_t))(v18 + 56))(v17, v18);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  sub_237D941B8(v16, v0 + 56);
  if ((v19 & 1) == 0)
    goto LABEL_17;
  v20 = *(_QWORD *)(v0 + 80);
  v21 = *(_QWORD *)(v0 + 88);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), v20);
  v22 = (*(uint64_t (**)(uint64_t, uint64_t))(v21 + 24))(v20, v21);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  if ((v22 & 1) != 0)
    goto LABEL_18;
  v24 = *(_QWORD *)(v0 + 240);
  v23 = *(_QWORD *)(v0 + 248);
  v25 = *(char **)(v0 + 216);
  v26 = type metadata accessor for OpenApplicationVerifierResult();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56))(&v25[*(int *)(v26 + 20)], 1, 1, v24);
  *(_QWORD *)v25 = 0;
  *((_QWORD *)v25 + 1) = 0;
  *((_QWORD *)v25 + 2) = 0;
LABEL_55:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_237D91948(uint64_t a1, uint64_t a2, char a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;
  id v9[2];

  v9[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = (void *)sub_237D99200();
  swift_bridgeObjectRelease();
  v9[0] = 0;
  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleRecordWithBundleIdentifier_allowPlaceholder_error_, v4, a3 & 1, v9);

  if (v5)
  {
    v6 = v9[0];
  }
  else
  {
    v7 = v9[0];
    sub_237D990E0();

    swift_willThrow();
  }
  return v5;
}

uint64_t sub_237D91A2C()
{
  uint64_t result;

  result = sub_237D91A48();
  qword_25688B108 = result;
  return result;
}

uint64_t sub_237D91A48()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25688AA58);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_237D99BE0;
  *(_QWORD *)(inited + 32) = sub_237D9920C();
  *(_QWORD *)(inited + 40) = v1;
  *(_QWORD *)(inited + 48) = sub_237D9920C();
  *(_QWORD *)(inited + 56) = v2;
  if (qword_25688A8B8 != -1)
    swift_once();
  v3 = swift_bridgeObjectRetain();
  sub_237D91B10(v3);
  v4 = sub_237D94100(inited);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_237D91B10(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_237D921E8(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = (unint64_t)&v3[2 * v8 + 4];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_237D9944C();
  __break(1u);
  return result;
}

uint64_t sub_237D91C60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25688AA58);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_237D99BF0;
  *(_QWORD *)(v0 + 32) = sub_237D9920C();
  *(_QWORD *)(v0 + 40) = v1;
  *(_QWORD *)(v0 + 48) = sub_237D9920C();
  *(_QWORD *)(v0 + 56) = v2;
  *(_QWORD *)(v0 + 64) = sub_237D9920C();
  *(_QWORD *)(v0 + 72) = v3;
  result = sub_237D9920C();
  *(_QWORD *)(v0 + 80) = result;
  *(_QWORD *)(v0 + 88) = v5;
  qword_25688B110 = v0;
  return result;
}

uint64_t sub_237D91CF8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t result;

  if (qword_25688A8B8 != -1)
    swift_once();
  v0 = (_QWORD *)qword_25688B110;
  v1 = sub_237D9920C();
  v3 = v2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v0 = sub_237D921E8(0, v0[2] + 1, 1, v0);
  v5 = v0[2];
  v4 = v0[3];
  if (v5 >= v4 >> 1)
    v0 = sub_237D921E8((_QWORD *)(v4 > 1), v5 + 1, 1, v0);
  v0[2] = v5 + 1;
  v6 = &v0[2 * v5];
  v6[4] = v1;
  v6[5] = v3;
  result = swift_bridgeObjectRelease();
  qword_25688B118 = (uint64_t)v0;
  return result;
}

uint64_t sub_237D91DF0()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t result;
  unint64_t v9;

  sub_237D9920C();
  sub_237D9920C();
  sub_237D9920C();
  v9 = MEMORY[0x24BEE4AF8];
  sub_237D993E0();
  v0 = (void *)objc_opt_self();
  swift_bridgeObjectRetain_n();
  v1 = (void *)sub_237D99200();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_identityForDaemonJobLabel_, v1);
  swift_bridgeObjectRelease();

  sub_237D993C8();
  sub_237D993EC();
  sub_237D993F8();
  sub_237D993D4();
  swift_bridgeObjectRetain_n();
  v3 = (void *)sub_237D99200();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v0, sel_identityForDaemonJobLabel_, v3);
  swift_bridgeObjectRelease();

  sub_237D993C8();
  sub_237D993EC();
  sub_237D993F8();
  sub_237D993D4();
  swift_bridgeObjectRetain_n();
  v5 = (void *)sub_237D99200();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v0, sel_identityForDaemonJobLabel_, v5);
  swift_bridgeObjectRelease();

  sub_237D993C8();
  sub_237D993EC();
  sub_237D993F8();
  sub_237D993D4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = sub_237D941FC(v9);
  result = swift_release();
  qword_25688B120 = v7;
  return result;
}

uint64_t sub_237D9205C()
{
  uint64_t inited;
  uint64_t v1;
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
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25688AA58);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_237D99C00;
  *(_QWORD *)(inited + 32) = sub_237D9920C();
  *(_QWORD *)(inited + 40) = v1;
  *(_QWORD *)(inited + 48) = sub_237D9920C();
  *(_QWORD *)(inited + 56) = v2;
  *(_QWORD *)(inited + 64) = sub_237D9920C();
  *(_QWORD *)(inited + 72) = v3;
  *(_QWORD *)(inited + 80) = sub_237D9920C();
  *(_QWORD *)(inited + 88) = v4;
  *(_QWORD *)(inited + 96) = sub_237D9920C();
  *(_QWORD *)(inited + 104) = v5;
  *(_QWORD *)(inited + 112) = sub_237D9920C();
  *(_QWORD *)(inited + 120) = v6;
  *(_QWORD *)(inited + 128) = sub_237D9920C();
  *(_QWORD *)(inited + 136) = v7;
  *(_QWORD *)(inited + 144) = sub_237D9920C();
  *(_QWORD *)(inited + 152) = v8;
  *(_QWORD *)(inited + 160) = sub_237D9920C();
  *(_QWORD *)(inited + 168) = v9;
  *(_QWORD *)(inited + 176) = sub_237D9920C();
  *(_QWORD *)(inited + 184) = v10;
  v11 = sub_237D94100(inited);
  swift_setDeallocating();
  result = swift_arrayDestroy();
  qword_25688B128 = v11;
  return result;
}

uint64_t OpenApplicationVerifier.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return v0;
}

uint64_t OpenApplicationVerifier.__deallocating_deinit()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

_QWORD *sub_237D921E8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25688AA58);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_237D94354(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_237D922F4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_237D923C4(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_237D95674((uint64_t)v12, *a3);
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
      sub_237D95674((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_237D923C4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_237D992FC();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_237D9257C(a5, a6);
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
  v8 = sub_237D993BC();
  if (!v8)
  {
    sub_237D99410();
    __break(1u);
LABEL_17:
    result = sub_237D9944C();
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

uint64_t sub_237D9257C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_237D92610(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_237D927E8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_237D927E8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_237D92610(uint64_t a1, unint64_t a2)
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
      v3 = sub_237D92784(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_237D993A4();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_237D99410();
      __break(1u);
LABEL_10:
      v2 = sub_237D9923C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_237D9944C();
    __break(1u);
LABEL_14:
    result = sub_237D99410();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_237D92784(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25688AA98);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_237D927E8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25688AA98);
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
  result = sub_237D9944C();
  __break(1u);
  return result;
}

uint64_t sub_237D92934(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_237D99494();
  swift_bridgeObjectRetain();
  sub_237D99224();
  v8 = sub_237D994AC();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_237D99464() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_237D99464() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_237D93568(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_237D92AE0(_QWORD *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char isUniquelyReferenced_nonNull_native;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v8 = a2;
    v9 = sub_237D99350();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_237D9559C(0, &qword_25688AA60);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_237D99344();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v21 = sub_237D92D7C(v7, result + 1);
    v27 = v21;
    if (*(_QWORD *)(v21 + 24) <= *(_QWORD *)(v21 + 16))
    {
      v25 = v8;
      sub_237D9324C();
      v22 = v27;
    }
    else
    {
      v22 = v21;
      v23 = v8;
    }
    sub_237D934E8((uint64_t)v8, v22);
    *v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    v11 = sub_237D992CC();
    v12 = -1 << *(_BYTE *)(v6 + 32);
    v13 = v11 & ~v12;
    if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
    {
      sub_237D9559C(0, &qword_25688AA60);
      v14 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
      v15 = sub_237D992D8();

      if ((v15 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v19 = *(void **)(*(_QWORD *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        v20 = v19;
        return 0;
      }
      v16 = ~v12;
      while (1)
      {
        v13 = (v13 + 1) & v16;
        if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
        v18 = sub_237D992D8();

        if ((v18 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v2;
    *v2 = 0x8000000000000000;
    v8 = a2;
    sub_237D93700((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_237D92D7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25688AA70);
    v2 = sub_237D9938C();
    v14 = v2;
    sub_237D99338();
    if (sub_237D9935C())
    {
      sub_237D9559C(0, &qword_25688AA60);
      do
      {
        swift_dynamicCast();
        v2 = v14;
        if (*(_QWORD *)(v14 + 24) <= *(_QWORD *)(v14 + 16))
        {
          sub_237D9324C();
          v2 = v14;
        }
        result = sub_237D992CC();
        v4 = v2 + 56;
        v5 = -1 << *(_BYTE *)(v2 + 32);
        v6 = result & ~v5;
        v7 = v6 >> 6;
        if (((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v9 = 0;
          v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v11 = v7 == v10;
            if (v7 == v10)
              v7 = 0;
            v9 |= v11;
            v12 = *(_QWORD *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v13;
        ++*(_QWORD *)(v2 + 16);
      }
      while (sub_237D9935C());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  return v2;
}

uint64_t sub_237D92F70()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAA0);
  v3 = sub_237D99380();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_237D99494();
      sub_237D99224();
      result = sub_237D994AC();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_237D9324C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25688AA70);
  v3 = sub_237D99380();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v28 = v0;
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v5 + 63) >> 6;
    v10 = v3 + 56;
    result = swift_retain();
    v12 = 0;
    while (1)
    {
      if (v8)
      {
        v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v15 = v14 | (v12 << 6);
      }
      else
      {
        v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9)
          goto LABEL_33;
        v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          v12 = v16 + 1;
          if (v16 + 1 >= v9)
            goto LABEL_33;
          v17 = v6[v12];
          if (!v17)
          {
            v12 = v16 + 2;
            if (v16 + 2 >= v9)
              goto LABEL_33;
            v17 = v6[v12];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                v1 = v28;
                v27 = 1 << *(_BYTE *)(v2 + 32);
                if (v27 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  v12 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v12 >= v9)
                    goto LABEL_33;
                  v17 = v6[v12];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v12 = v18;
            }
          }
        }
LABEL_23:
        v8 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      v19 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
      result = sub_237D992CC();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v25 = v22 == v24;
          if (v22 == v24)
            v22 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

unint64_t sub_237D934E8(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_237D992CC();
  result = sub_237D9932C();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

uint64_t sub_237D93568(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_237D92F70();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_237D93884();
      goto LABEL_22;
    }
    sub_237D93BDC();
  }
  v11 = *v4;
  sub_237D99494();
  sub_237D99224();
  result = sub_237D994AC();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_237D99464(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_237D99470();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_237D99464();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

void sub_237D93700(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_237D9324C();
  }
  else
  {
    if (v7 > v6)
    {
      sub_237D93A34();
      goto LABEL_14;
    }
    sub_237D93E88();
  }
  v8 = *v3;
  v9 = sub_237D992CC();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  a2 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_237D9559C(0, &qword_25688AA60);
    v11 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
    v12 = sub_237D992D8();

    if ((v12 & 1) != 0)
    {
LABEL_13:
      sub_237D99470();
      __break(1u);
    }
    else
    {
      v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v14 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
        v15 = sub_237D992D8();

        if ((v15 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v16 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v16 + 48) + 8 * a2) = a1;
  v17 = *(_QWORD *)(v16 + 16);
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (v18)
    __break(1u);
  else
    *(_QWORD *)(v16 + 16) = v19;
}

void *sub_237D93884()
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
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAA0);
  v2 = *v0;
  v3 = sub_237D99374();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_237D93A34()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25688AA70);
  v2 = *v0;
  v3 = sub_237D99374();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_237D93BDC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAA0);
  v3 = sub_237D99380();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_237D99494();
    swift_bridgeObjectRetain();
    sub_237D99224();
    result = sub_237D994AC();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_237D93E88()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25688AA70);
  v3 = sub_237D99380();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v27 = v0;
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v9 = (unint64_t)(v5 + 63) >> 6;
  v10 = v3 + 56;
  result = swift_retain();
  v12 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      v12 = v16 + 1;
      if (v16 + 1 >= v9)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v12);
      if (!v17)
      {
        v12 = v16 + 2;
        if (v16 + 2 >= v9)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v12);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    v19 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    result = sub_237D992CC();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v27;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v12 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v12);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_237D94100(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_237D99278();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_237D92934(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_237D941B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_237D941FC(unint64_t a1)
{
  unint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void **v7;
  void *v8;
  id v9;
  uint64_t v10;

  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_237D9941C();
    swift_bridgeObjectRelease();
  }
  sub_237D9559C(0, &qword_25688AA60);
  sub_237D95544();
  result = sub_237D99278();
  v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    v4 = sub_237D9941C();
    result = swift_bridgeObjectRelease();
    if (!v4)
      return v10;
  }
  else
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v4)
      return v10;
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (i = 0; i != v4; ++i)
      {
        v6 = (void *)MEMORY[0x23B823160](i, a1);
        sub_237D92AE0(&v9, v6);

      }
    }
    else
    {
      v7 = (void **)(a1 + 32);
      do
      {
        v8 = *v7++;
        sub_237D92AE0(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_237D94354(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_237D9944C();
  __break(1u);
  return result;
}

uint64_t sub_237D94444(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  if (!a2)
    return 0;
  if (qword_25688A8C0 != -1)
    swift_once();
  v4 = qword_25688B118;
  v5 = *(_QWORD *)(qword_25688B118 + 16);
  if (!v5)
    return 0;
  v6 = *(_QWORD *)(qword_25688B118 + 32) == a1 && *(_QWORD *)(qword_25688B118 + 40) == a2;
  if (v6 || (sub_237D99464() & 1) != 0)
    return 1;
  if (v5 == 1)
    return 0;
  if (*(_QWORD *)(v4 + 48) == a1 && *(_QWORD *)(v4 + 56) == a2)
    return 1;
  result = sub_237D99464();
  if ((result & 1) != 0)
    return 1;
  if (v5 == 2)
    return 0;
  v9 = (_QWORD *)(v4 + 72);
  for (i = 2; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_237D99464() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v5)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_237D94564(uint64_t a1, unint64_t a2)
{
  id v4;
  uint64_t result;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  unsigned __int8 v15;
  _OWORD v16[2];
  uint64_t v17[5];

  if (!a2)
    return 0;
  swift_bridgeObjectRetain();
  if (!_AXSAutomationEnabled())
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  sub_237D9559C(0, &qword_25688AA78);
  swift_bridgeObjectRetain();
  v4 = sub_237D91948(a1, a2, 0);
  if (!v4)
  {
    if (qword_25688A8A8 != -1)
      swift_once();
    v10 = sub_237D99134();
    __swift_project_value_buffer(v10, (uint64_t)static Logger.common);
    swift_bridgeObjectRetain();
    v11 = sub_237D99128();
    v12 = sub_237D99284();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      v17[0] = v14;
      *(_DWORD *)v13 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)&v16[0] = sub_237D922F4(a1, a2, v17);
      sub_237D992F0();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_237D8D000, v11, v12, "LSBundleRecord for %s is nil", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x23B823718](v14, -1, -1);
      MEMORY[0x23B823718](v13, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  v6 = v4;
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v6, sel_entitlements);
  v8 = (void *)sub_237D99200();
  sub_237D9559C(0, &qword_25688AA88);
  v9 = objc_msgSend(v7, sel_objectForKey_ofClass_, v8, swift_getObjCClassFromMetadata());

  if (v9)
  {
    sub_237D99308();
    swift_unknownObjectRelease();

  }
  else
  {

    memset(v16, 0, sizeof(v16));
  }
  sub_237D955D4((uint64_t)v16, (uint64_t)v17, &qword_25688AA90);
  if (!v17[3])
  {
    sub_237D95618((uint64_t)v17, &qword_25688AA90);
    return 0;
  }
  result = swift_dynamicCast();
  if ((_DWORD)result)
    return v15;
  return result;
}

unint64_t sub_237D94AAC()
{
  unint64_t result;

  result = qword_25688A8F0;
  if (!qword_25688A8F0)
  {
    result = MEMORY[0x23B8236A0](&protocol conformance descriptor for OpenApplicationVerifierResult.ErrorCode, &type metadata for OpenApplicationVerifierResult.ErrorCode);
    atomic_store(result, (unint64_t *)&qword_25688A8F0);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for OpenApplicationVerifierResult(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v13 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v5 = a2[2];
    a1[1] = a2[1];
    a1[2] = v5;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_237D990F8();
    v10 = *(_QWORD *)(v9 - 8);
    v11 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
    swift_bridgeObjectRetain();
    if (v11(v8, 1, v9))
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688A8E0);
      memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
    }
  }
  return v3;
}

uint64_t destroy for OpenApplicationVerifierResult(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_237D990F8();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return result;
}

uint64_t initializeWithCopy for OpenApplicationVerifierResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int (*v10)(const void *, uint64_t, uint64_t);
  uint64_t v11;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v4;
  v5 = *(int *)(a3 + 20);
  v6 = (void *)(a1 + v5);
  v7 = (const void *)(a2 + v5);
  v8 = sub_237D990F8();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48);
  swift_bridgeObjectRetain();
  if (v10(v7, 1, v8))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688A8E0);
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v9 + 16))(v6, v7, v8);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

uint64_t assignWithCopy for OpenApplicationVerifierResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (void *)(a1 + v6);
  v8 = (void *)(a2 + v6);
  v9 = sub_237D990F8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688A8E0);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  return a1;
}

uint64_t initializeWithTake for OpenApplicationVerifierResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(int *)(a3 + 20);
  v5 = (void *)(a1 + v4);
  v6 = (const void *)(a2 + v4);
  v7 = sub_237D990F8();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688A8E0);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

uint64_t assignWithTake for OpenApplicationVerifierResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_237D990F8();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688A8E0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for OpenApplicationVerifierResult()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_237D95060(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 16);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688A8E0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for OpenApplicationVerifierResult()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_237D950F8(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 16) = a2;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688A8E0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

void sub_237D95170()
{
  unint64_t v0;

  sub_237D951E4();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_237D951E4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25688A960)
  {
    sub_237D990F8();
    v0 = sub_237D992E4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25688A960);
  }
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for OpenApplicationVerifierResult.ErrorCode(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for OpenApplicationVerifierResult.ErrorCode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_237D95324 + 4 * byte_237D99C25[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_237D95358 + 4 * byte_237D99C20[v4]))();
}

uint64_t sub_237D95358(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_237D95360(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x237D95368);
  return result;
}

uint64_t sub_237D95374(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x237D9537CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_237D95380(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237D95388(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_237D95394(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_237D9539C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for OpenApplicationVerifierResult.ErrorCode()
{
  return &type metadata for OpenApplicationVerifierResult.ErrorCode;
}

uint64_t destroy for OpenApplicationVerifierResult.Error()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s22ClarityBoardFoundation29OpenApplicationVerifierResultV5ErrorVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for OpenApplicationVerifierResult.Error(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for OpenApplicationVerifierResult.Error(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for OpenApplicationVerifierResult.Error(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OpenApplicationVerifierResult.Error(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for OpenApplicationVerifierResult.Error()
{
  return &type metadata for OpenApplicationVerifierResult.Error;
}

uint64_t type metadata accessor for OpenApplicationVerifier()
{
  return objc_opt_self();
}

unint64_t sub_237D95544()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25688AA68;
  if (!qword_25688AA68)
  {
    v1 = sub_237D9559C(255, &qword_25688AA60);
    result = MEMORY[0x23B8236A0](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_25688AA68);
  }
  return result;
}

uint64_t sub_237D9559C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_237D955D4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_237D95618(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_237D95674(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

double static CLFSystemShellSwitcher.transitionDelayForSpeech.getter()
{
  return 3.0;
}

uint64_t property wrapper backing initializer of ApplicationSceneClientSettings.navigationTitles()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAB0);
  return sub_237D99158();
}

uint64_t ApplicationSceneClientSettings.navigationTitles.getter()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_237D99188();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_237D9576C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_237D99188();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_237D957EC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_237D99194();
}

uint64_t ApplicationSceneClientSettings.navigationTitles.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_237D99194();
}

uint64_t (*ApplicationSceneClientSettings.navigationTitles.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_237D9917C();
  return sub_237D9594C;
}

uint64_t ApplicationSceneClientSettings.$navigationTitles.getter()
{
  return sub_237D960DC((uint64_t)&OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__navigationTitles, &qword_25688AAC0);
}

uint64_t ApplicationSceneClientSettings.$navigationTitles.setter(uint64_t a1)
{
  return sub_237D9615C(a1, &qword_25688AAC8, (uint64_t)&OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__navigationTitles, &qword_25688AAC0);
}

uint64_t (*ApplicationSceneClientSettings.$navigationTitles.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAC8);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__navigationTitles;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAC0);
  sub_237D99164();
  swift_endAccess();
  return sub_237D95A48;
}

uint64_t property wrapper backing initializer of ApplicationSceneClientSettings.chromeVisible()
{
  return sub_237D99158();
}

uint64_t ApplicationSceneClientSettings.chromeVisible.getter()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_237D99188();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_237D95AE8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_237D99188();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_237D95B68()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_237D99194();
}

uint64_t ApplicationSceneClientSettings.chromeVisible.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_237D99194();
}

uint64_t (*ApplicationSceneClientSettings.chromeVisible.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_237D9917C();
  return sub_237D9594C;
}

uint64_t ApplicationSceneClientSettings.$chromeVisible.getter()
{
  return sub_237D960DC((uint64_t)&OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__chromeVisible, &qword_25688AAD8);
}

uint64_t ApplicationSceneClientSettings.$chromeVisible.setter(uint64_t a1)
{
  return sub_237D9615C(a1, &qword_25688AAE0, (uint64_t)&OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__chromeVisible, &qword_25688AAD8);
}

uint64_t (*ApplicationSceneClientSettings.$chromeVisible.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAE0);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__chromeVisible;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAD8);
  sub_237D99164();
  swift_endAccess();
  return sub_237D95A48;
}

uint64_t property wrapper backing initializer of ApplicationSceneClientSettings.bottomBarTransitionProgress()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAE8);
  return sub_237D99158();
}

uint64_t ApplicationSceneClientSettings.bottomBarTransitionProgress.getter()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_237D99188();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_237D95E78@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  char v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_237D99188();
  swift_release();
  result = swift_release();
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return result;
}

uint64_t sub_237D95F00()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_237D99194();
}

uint64_t ApplicationSceneClientSettings.bottomBarTransitionProgress.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_237D99194();
}

uint64_t (*ApplicationSceneClientSettings.bottomBarTransitionProgress.modify(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_237D9917C();
  return sub_237D9594C;
}

void sub_237D9607C(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t ApplicationSceneClientSettings.$bottomBarTransitionProgress.getter()
{
  return sub_237D960DC((uint64_t)&OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__bottomBarTransitionProgress, &qword_25688AAF8);
}

uint64_t sub_237D960DC(uint64_t a1, uint64_t *a2)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  sub_237D99164();
  return swift_endAccess();
}

uint64_t ApplicationSceneClientSettings.$bottomBarTransitionProgress.setter(uint64_t a1)
{
  return sub_237D9615C(a1, &qword_25688AB00, (uint64_t)&OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__bottomBarTransitionProgress, &qword_25688AAF8);
}

uint64_t sub_237D9615C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_237D99170();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*ApplicationSceneClientSettings.$bottomBarTransitionProgress.modify(_QWORD *a1))()
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688AB00);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__bottomBarTransitionProgress;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAF8);
  sub_237D99164();
  swift_endAccess();
  return sub_237D95A48;
}

void sub_237D962FC(uint64_t a1, char a2)
{
  _QWORD *v3;
  void (*v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t);

  v3 = *(_QWORD **)a1;
  v4 = *(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)a1 + 88) + 16);
  v4(*(_QWORD *)(*(_QWORD *)a1 + 104), v3[14], v3[10]);
  v5 = (void *)v3[13];
  v6 = (void *)v3[14];
  v8 = v3[11];
  v7 = (void *)v3[12];
  v9 = v3[10];
  if ((a2 & 1) != 0)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    sub_237D99170();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
    v10(v5, v9);
  }
  else
  {
    swift_beginAccess();
    sub_237D99170();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v10(v6, v9);
  free(v6);
  free(v5);
  free(v7);
  free(v3);
}

uint64_t sub_237D96414(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;

  v22 = a1;
  v23 = a2;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAF8);
  v3 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAD8);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAC0);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = v2 + OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__navigationTitles;
  v24 = MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAB0);
  sub_237D99158();
  (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v14, v13, v10);
  v15 = v2 + OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__chromeVisible;
  LOBYTE(v24) = 1;
  sub_237D99158();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v15, v9, v6);
  v16 = v2 + OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__bottomBarTransitionProgress;
  v24 = 0;
  v25 = 1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAE8);
  sub_237D99158();
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 32))(v16, v5, v21);
  v17 = (_QWORD *)(v2 + OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings_sceneID);
  v18 = v23;
  *v17 = v22;
  v17[1] = v18;
  return v2;
}

void *sub_237D965F0()
{
  void *result;

  result = (void *)sub_237D96614(MEMORY[0x24BEE4AF8]);
  off_25688AAA8 = result;
  return result;
}

unint64_t sub_237D96614(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25688ACA8);
  v2 = (_QWORD *)sub_237D99440();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 2);
    v6 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_retain();
    result = sub_237D96DD8(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
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

uint64_t static ApplicationSceneClientSettings.settingsForSceneID(_:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  unint64_t v5;
  char v6;
  uint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  void *v10;

  if (qword_25688A8D8 != -1)
    swift_once();
  swift_beginAccess();
  v4 = off_25688AAA8;
  if (!*((_QWORD *)off_25688AAA8 + 2))
    goto LABEL_7;
  swift_bridgeObjectRetain();
  v5 = sub_237D96DD8(a1, a2);
  if ((v6 & 1) == 0)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    swift_endAccess();
    type metadata accessor for ApplicationSceneClientSettings();
    swift_allocObject();
    swift_bridgeObjectRetain();
    v7 = sub_237D96414(a1, a2);
    swift_beginAccess();
    swift_bridgeObjectRetain();
    swift_retain();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v10 = off_25688AAA8;
    off_25688AAA8 = (_UNKNOWN *)0x8000000000000000;
    sub_237D9750C(v7, a1, a2, isUniquelyReferenced_nonNull_native);
    off_25688AAA8 = v10;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_endAccess();
    return v7;
  }
  v7 = *(_QWORD *)(v4[7] + 8 * v5);
  swift_endAccess();
  swift_retain();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t static ApplicationSceneClientSettings.removeSettingsForSceneID(_:)(uint64_t a1, uint64_t a2)
{
  if (qword_25688A8D8 != -1)
    swift_once();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_237D96F58(a1, a2);
  swift_endAccess();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t ApplicationSceneClientSettings.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = v0 + OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__navigationTitles;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__chromeVisible;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAD8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = v0 + OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__bottomBarTransitionProgress;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAF8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ApplicationSceneClientSettings.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = v0 + OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__navigationTitles;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__chromeVisible;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAD8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = v0 + OBJC_IVAR____TtC22ClarityBoardFoundation30ApplicationSceneClientSettings__bottomBarTransitionProgress;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAF8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_237D96AC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for ApplicationSceneClientSettings();
  result = sub_237D9914C();
  *a1 = result;
  return result;
}

uint64_t ApplicationSceneClientSettings.description.getter()
{
  sub_237D99398();
  swift_getMetatypeMetadata();
  sub_237D99218();
  sub_237D99230();
  swift_bridgeObjectRelease();
  sub_237D99230();
  swift_bridgeObjectRetain();
  sub_237D99230();
  swift_bridgeObjectRelease();
  sub_237D99230();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_237D99188();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  sub_237D99458();
  sub_237D99230();
  swift_bridgeObjectRelease();
  sub_237D99230();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_237D99188();
  swift_release();
  swift_release();
  sub_237D99230();
  swift_bridgeObjectRelease();
  sub_237D99230();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_237D99188();
  swift_release();
  swift_release();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAE8);
  sub_237D99218();
  sub_237D99230();
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_237D96DB8()
{
  return ApplicationSceneClientSettings.description.getter();
}

unint64_t sub_237D96DD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_237D99494();
  sub_237D99224();
  v4 = sub_237D994AC();
  return sub_237D96E78(a1, a2, v4);
}

uint64_t type metadata accessor for ApplicationSceneClientSettings()
{
  uint64_t result;

  result = qword_25688AB38;
  if (!qword_25688AB38)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_237D96E78(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_237D99464() & 1) == 0)
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
      while (!v14 && (sub_237D99464() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_237D96F58(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_237D96DD8(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_237D97828();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * v6);
  sub_237D97338(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_237D97024(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25688ACA8);
  v36 = a2;
  v6 = sub_237D99434();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          if ((v36 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_retain();
    }
    sub_237D99494();
    sub_237D99224();
    result = sub_237D994AC();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v22 = (_QWORD *)(v5 + 64);
  if ((v36 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_237D97338(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_237D99320();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_237D99494();
        swift_bridgeObjectRetain();
        sub_237D99224();
        v9 = sub_237D994AC();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_QWORD *)(v14 + 8 * v3);
          v16 = (_QWORD *)(v14 + 8 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_237D9750C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v5 = v4;
  v10 = *v4;
  v12 = sub_237D96DD8(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_237D97828();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];
      result = swift_release();
      *(_QWORD *)(v19 + 8 * v12) = a1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v23 = (uint64_t *)(v18[6] + 16 * v12);
    *v23 = a2;
    v23[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v24 = v18[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v18[2] = v26;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_237D97024(v15, a4 & 1);
  v21 = sub_237D96DD8(a2, a3);
  if ((v16 & 1) == (v22 & 1))
  {
    v12 = v21;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_237D9947C();
  __break(1u);
  return result;
}

uint64_t sub_237D97668()
{
  return MEMORY[0x24BDB9D70];
}

uint64_t sub_237D97674()
{
  return type metadata accessor for ApplicationSceneClientSettings();
}

void sub_237D9767C()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_237D977DC(319, &qword_25688AB48, &qword_25688AAB0);
  if (v0 <= 0x3F)
  {
    sub_237D97788();
    if (v1 <= 0x3F)
    {
      sub_237D977DC(319, qword_25688AB58, &qword_25688AAE8);
      if (v2 <= 0x3F)
        swift_updateClassMetadata2();
    }
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x23B823694](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_237D97788()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25688AB50)
  {
    v0 = sub_237D991A0();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25688AB50);
  }
}

void sub_237D977DC(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v4 = sub_237D991A0();
    if (!v5)
      atomic_store(v4, a2);
  }
}

void *sub_237D97828()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25688ACA8);
  v2 = *v0;
  v3 = sub_237D99428();
  v4 = v3;
  v5 = *(_QWORD *)(v2 + 16);
  if (!v5)
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v7 = v2 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v8)
  {
    result = memmove(result, (const void *)(v2 + 64), 8 * v8);
    v5 = *(_QWORD *)(v2 + 16);
  }
  v10 = 0;
  *(_QWORD *)(v4 + 16) = v5;
  v11 = 1 << *(_BYTE *)(v2 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v2 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    v23 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v23);
    ++v10;
    if (!v24)
    {
      v10 = v23 + 1;
      if (v23 + 1 >= v14)
        goto LABEL_26;
      v24 = *(_QWORD *)(v7 + 8 * v10);
      if (!v24)
        break;
    }
LABEL_25:
    v13 = (v24 - 1) & v24;
    v16 = __clz(__rbit64(v24)) + (v10 << 6);
LABEL_12:
    v17 = 16 * v16;
    v18 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v16);
    v19 = v18[1];
    v20 = 8 * v16;
    v21 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v17);
    *v22 = *v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v20) = v21;
    swift_bridgeObjectRetain();
    result = (void *)swift_retain();
  }
  v25 = v23 + 2;
  if (v25 >= v14)
    goto LABEL_26;
  v24 = *(_QWORD *)(v7 + 8 * v25);
  if (v24)
  {
    v10 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v10 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v10 >= v14)
      goto LABEL_26;
    v24 = *(_QWORD *)(v7 + 8 * v10);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t property wrapper backing initializer of LockState.isLocked()
{
  return sub_237D99158();
}

uint64_t LockState.isLocked.getter()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_237D99188();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_237D97A78@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_237D99188();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_237D97AF8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_237D99194();
}

uint64_t LockState.isLocked.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_237D99194();
}

void (*LockState.isLocked.modify(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_237D9917C();
  return sub_237D9607C;
}

uint64_t LockState.$isLocked.getter()
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAD8);
  sub_237D99164();
  return swift_endAccess();
}

uint64_t LockState.$isLocked.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAE0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v2);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAD8);
  sub_237D99170();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
}

void (*LockState.$isLocked.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAE0);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC22ClarityBoardFoundation9LockState__isLocked;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAD8);
  sub_237D99164();
  swift_endAccess();
  return sub_237D962FC;
}

uint64_t LockState.__allocating_init(mobileKeybagManager:)(void *a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  LockState.init(mobileKeybagManager:)(a1);
  return v2;
}

uint64_t LockState.init(mobileKeybagManager:)(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  _QWORD aBlock[6];

  __swift_instantiateConcreteTypeFromMangledName(&qword_25688ACB8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAD8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8]();
  v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = v1 + OBJC_IVAR____TtC22ClarityBoardFoundation9LockState_lockStateChangedBlockIdentifier;
  v10 = sub_237D9911C();
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  v11(v9, 1, 1, v10);
  v12 = v1 + OBJC_IVAR____TtC22ClarityBoardFoundation9LockState__isLocked;
  LOBYTE(aBlock[0]) = 1;
  sub_237D99158();
  (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(v12, v8, v5);
  *(_QWORD *)(v1 + 16) = a1;
  swift_unknownObjectRetain();
  sub_237D98610();
  v13 = swift_allocObject();
  swift_weakInit();
  aBlock[4] = sub_237D98814;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_237D982C4;
  aBlock[3] = &block_descriptor;
  v14 = _Block_copy(aBlock);
  swift_release();
  v15 = objc_msgSend(a1, sel_registerLockStateChangedBlock_, v14);
  _Block_release(v14);
  sub_237D99110();
  swift_unknownObjectRelease();

  v11((uint64_t)v4, 0, 1, v10);
  v16 = v1 + OBJC_IVAR____TtC22ClarityBoardFoundation9LockState_lockStateChangedBlockIdentifier;
  swift_beginAccess();
  sub_237D98834((uint64_t)v4, v16);
  swift_endAccess();
  return v1;
}

uint64_t sub_237D980BC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  void *v11;
  _QWORD aBlock[6];

  v2 = sub_237D991B8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_237D991D0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_237D98F00();
  v10 = (void *)sub_237D9929C();
  aBlock[4] = sub_237D98FD0;
  aBlock[5] = a1;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_237D982C4;
  aBlock[3] = &block_descriptor_8;
  v11 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  sub_237D991C4();
  aBlock[0] = MEMORY[0x24BEE4AF8];
  sub_237D98F3C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25688ADF8);
  sub_237D98F84();
  sub_237D99314();
  MEMORY[0x23B823058](0, v9, v5, v11);
  _Block_release(v11);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_237D98270()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_237D98610();
    return swift_release();
  }
  return result;
}

uint64_t sub_237D982C4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t LockState.deinit()
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
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25688ACB8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_237D9911C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v1 + OBJC_IVAR____TtC22ClarityBoardFoundation9LockState_lockStateChangedBlockIdentifier;
  swift_beginAccess();
  sub_237D9887C(v8, (uint64_t)v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_237D988C4((uint64_t)v3);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    v9 = *(void **)(v1 + 16);
    v10 = (void *)sub_237D99104();
    objc_msgSend(v9, sel_unregisterLockStateChangedBlockWithIdentifier_, v10);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  swift_unknownObjectRelease();
  sub_237D988C4(v8);
  v11 = v1 + OBJC_IVAR____TtC22ClarityBoardFoundation9LockState__isLocked;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAD8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  return v1;
}

uint64_t LockState.__deallocating_deinit()
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
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25688ACB8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_237D9911C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = v1 + OBJC_IVAR____TtC22ClarityBoardFoundation9LockState_lockStateChangedBlockIdentifier;
  swift_beginAccess();
  sub_237D9887C(v8, (uint64_t)v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_237D988C4((uint64_t)v3);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v3, v4);
    v9 = *(void **)(v1 + 16);
    v10 = (void *)sub_237D99104();
    objc_msgSend(v9, sel_unregisterLockStateChangedBlockWithIdentifier_, v10);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  swift_unknownObjectRelease();
  sub_237D988C4(v8);
  v11 = v1 + OBJC_IVAR____TtC22ClarityBoardFoundation9LockState__isLocked;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688AAD8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v11, v12);
  return swift_deallocClassInstance();
}

void sub_237D98610()
{
  uint64_t v0;
  __CFNotificationCenter *v1;
  __CFString *v2;
  id v3;
  UIAccessibilityNotifications v4;
  id v5;
  char v6;
  char v7;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_237D99188();
  swift_release();
  swift_release();
  objc_msgSend(*(id *)(v0 + 16), sel_isLocked);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_237D99194();
  v1 = CFNotificationCenterGetDarwinNotifyCenter();
  v2 = (__CFString *)sub_237D99200();
  CFNotificationCenterPostNotification(v1, v2, 0, 0, 0);

  if (v7 == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_237D99188();
    swift_release();
    swift_release();
    if ((v6 & 1) == 0)
    {
      if (_AXSVoiceOverTouchEnabled())
      {
        v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD7B8]), sel_init);
        objc_msgSend(v3, sel_notificationOccurred_, 0);
        if (*MEMORY[0x24BDFEE18])
        {
          v4 = *MEMORY[0x24BEBDDB0];
          v5 = (id)*MEMORY[0x24BDFEE18];
          UIAccessibilityPostNotification(v4, v5);

        }
        else
        {
          __break(1u);
        }
      }
    }
  }
}

uint64_t sub_237D987F0()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_237D98814()
{
  uint64_t v0;

  return sub_237D980BC(v0);
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

uint64_t sub_237D98834(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688ACB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_237D9887C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688ACB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_237D988C4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25688ACB8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

Swift::Bool __swiftcall LockState.unlock(with:)(Swift::String with)
{
  uint64_t v1;
  void *v2;
  void *v3;
  unsigned int v4;
  id v5;
  id v6;
  void *v7;
  id v9[2];

  v9[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = *(void **)(v1 + 16);
  v3 = (void *)sub_237D99200();
  v9[0] = 0;
  v4 = objc_msgSend(v2, sel_unlockWithPasscode_error_, v3, v9);

  if (v4)
  {
    v5 = v9[0];
  }
  else
  {
    v6 = v9[0];
    v7 = (void *)sub_237D990E0();

    swift_willThrow();
    swift_getErrorValue();
    if (sub_237D99488() == -14)
      sub_237D98A04();

  }
  sub_237D98610();
  return v4;
}

id sub_237D98A04()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  void *v17;
  id result;
  double v19;
  void (*v20)(char *, uint64_t);
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD aBlock[6];

  v0 = sub_237D991B8();
  v27 = *(_QWORD *)(v0 - 8);
  v28 = v0;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v2 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_237D991D0();
  v25 = *(_QWORD *)(v3 - 8);
  v26 = v3;
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_237D991AC();
  v7 = *(_QWORD *)(v6 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v9 = (uint64_t *)((char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v24 = sub_237D991E8();
  v10 = *(_QWORD *)(v24 - 8);
  v11 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v24 - v14;
  v16 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  objc_msgSend(v16, sel_postNotificationName_object_, CFSTR("CLBLockBackoffBlockNotification"), 0);

  sub_237D98F00();
  v17 = (void *)sub_237D9929C();
  sub_237D991DC();
  result = objc_msgSend(*(id *)(v29 + 16), sel_backOffTime);
  if ((~*(_QWORD *)&v19 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v19 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v19 < 9.22337204e18)
  {
    *v9 = (uint64_t)v19;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x24BEE5420], v6);
    MEMORY[0x23B822FA4](v13, v9);
    (*(void (**)(_QWORD *, uint64_t))(v7 + 8))(v9, v6);
    v20 = *(void (**)(char *, uint64_t))(v10 + 8);
    v21 = v24;
    v20(v13, v24);
    aBlock[4] = sub_237D98D3C;
    aBlock[5] = 0;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_237D982C4;
    aBlock[3] = &block_descriptor_5;
    v22 = _Block_copy(aBlock);
    sub_237D991C4();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_237D98F3C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25688ADF8);
    sub_237D98F84();
    v23 = v28;
    sub_237D99314();
    MEMORY[0x23B823040](v15, v5, v2, v22);
    _Block_release(v22);

    (*(void (**)(char *, uint64_t))(v27 + 8))(v2, v23);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v5, v26);
    return (id)((uint64_t (*)(char *, uint64_t))v20)(v15, v21);
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_237D98D3C()
{
  id v0;

  v0 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  objc_msgSend(v0, sel_postNotificationName_object_, CFSTR("CLBLockBackoffUnblockNotification"), 0);

}

uint64_t sub_237D98D98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for LockState();
  result = sub_237D9914C();
  *a1 = result;
  return result;
}

uint64_t sub_237D98DD4()
{
  return type metadata accessor for LockState();
}

uint64_t type metadata accessor for LockState()
{
  uint64_t result;

  result = qword_25688ACE8;
  if (!qword_25688ACE8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_237D98E18()
{
  unint64_t v0;
  unint64_t v1;

  sub_237D98EAC();
  if (v0 <= 0x3F)
  {
    sub_237D97788();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

void sub_237D98EAC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25688ACF8[0])
  {
    sub_237D9911C();
    v0 = sub_237D992E4();
    if (!v1)
      atomic_store(v0, qword_25688ACF8);
  }
}

unint64_t sub_237D98F00()
{
  unint64_t result;

  result = qword_25688ADE8;
  if (!qword_25688ADE8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25688ADE8);
  }
  return result;
}

unint64_t sub_237D98F3C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25688ADF0;
  if (!qword_25688ADF0)
  {
    v1 = sub_237D991B8();
    result = MEMORY[0x23B8236A0](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_25688ADF0);
  }
  return result;
}

unint64_t sub_237D98F84()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25688AE00;
  if (!qword_25688AE00)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25688ADF8);
    result = MEMORY[0x23B8236A0](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_25688AE00);
  }
  return result;
}

uint64_t sub_237D98FD0()
{
  return sub_237D98270();
}

uint64_t NSNotificationCenter.sendableNotifications(named:object:)()
{
  sub_237D992C0();
  sub_237D992B4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25688AE10);
  sub_237D99098();
  return sub_237D99404();
}

uint64_t sub_237D99060(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_237D99078()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = *(_QWORD **)(v0 + 16);
  v1[3] = MEMORY[0x24BEE0D00];
  *v1 = 0;
  v1[1] = 0xE000000000000000;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_237D99098()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25688AE18;
  if (!qword_25688AE18)
  {
    v1 = sub_237D992B4();
    result = MEMORY[0x23B8236A0](MEMORY[0x24BDD0050], v1);
    atomic_store(result, (unint64_t *)&qword_25688AE18);
  }
  return result;
}

uint64_t sub_237D990E0()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_237D990EC()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_237D990F8()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_237D99104()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_237D99110()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_237D9911C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_237D99128()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_237D99134()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_237D99140()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_237D9914C()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_237D99158()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_237D99164()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_237D99170()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_237D9917C()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_237D99188()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_237D99194()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_237D991A0()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_237D991AC()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_237D991B8()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_237D991C4()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_237D991D0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_237D991DC()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_237D991E8()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_237D991F4()
{
  return MEMORY[0x24BEE5620]();
}

uint64_t sub_237D99200()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_237D9920C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_237D99218()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_237D99224()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_237D99230()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_237D9923C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_237D99248()
{
  return MEMORY[0x24BEE0CD0]();
}

uint64_t sub_237D99254()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_237D99260()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_237D9926C()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_237D99278()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_237D99284()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_237D99290()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_237D9929C()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_237D992A8()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_237D992B4()
{
  return MEMORY[0x24BDD0040]();
}

uint64_t sub_237D992C0()
{
  return MEMORY[0x24BDD0058]();
}

uint64_t sub_237D992CC()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_237D992D8()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_237D992E4()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_237D992F0()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_237D992FC()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_237D99308()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_237D99314()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_237D99320()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_237D9932C()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_237D99338()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_237D99344()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_237D99350()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_237D9935C()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_237D99368()
{
  return MEMORY[0x24BEE2360]();
}

uint64_t sub_237D99374()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_237D99380()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_237D9938C()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_237D99398()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_237D993A4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_237D993B0()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_237D993BC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_237D993C8()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_237D993D4()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_237D993E0()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_237D993EC()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_237D993F8()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_237D99404()
{
  return MEMORY[0x24BEE6F00]();
}

uint64_t sub_237D99410()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_237D9941C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_237D99428()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_237D99434()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_237D99440()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_237D9944C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_237D99458()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_237D99464()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_237D99470()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_237D9947C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_237D99488()
{
  return MEMORY[0x24BEE3EE8]();
}

uint64_t sub_237D99494()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_237D994A0()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_237D994AC()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x24BE0BB38]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x24BE0BB60]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x24BE67140]();
}

uint64_t MKBEventsRegister()
{
  return MEMORY[0x24BE67148]();
}

uint64_t MKBEventsUnregister()
{
  return MEMORY[0x24BE67150]();
}

uint64_t MKBGetDeviceLockStateInfo()
{
  return MEMORY[0x24BE67170]();
}

uint64_t MKBLockDevice()
{
  return MEMORY[0x24BE671C8]();
}

uint64_t MKBUnlockDevice()
{
  return MEMORY[0x24BE671D8]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BEBDE98](*(_QWORD *)&notification, argument);
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x24BED20C0]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x24BED25B0]();
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
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

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

