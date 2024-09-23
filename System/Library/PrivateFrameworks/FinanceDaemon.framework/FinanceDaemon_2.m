uint64_t sub_1CF4F0194(uint64_t a1, uint64_t a2, void *a3)
{
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t i;
  id v43;
  void *v44;
  id v45;
  void *v46;
  unint64_t v47;
  uint64_t v48;
  id v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  unint64_t v63;
  _OWORD v64[2];
  __int128 v65;
  __int128 v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_opt_self();
  v7 = objc_msgSend(v6, sel_fetchRequest);
  v8 = MEMORY[0x1E0DEE9D8];
  if (!v7)
    return v8;
  v9 = v7;
  v10 = objc_msgSend(v6, sel_entityDescriptionWithContext_, a3);
  if (!v10)
  {

    return v8;
  }
  v11 = v10;
  v12 = objc_msgSend(v10, sel_propertiesByName);
  sub_1CF3D3DF4(0, &qword_1EFB900B8);
  v13 = sub_1CF524E0C();

  if (!*(_QWORD *)(v13 + 16)
    || (v62 = v11, v14 = sub_1CF4485EC(0x456465676E616863, 0xED0000797469746ELL), (v15 & 1) == 0))
  {

    swift_bridgeObjectRelease();
    return v8;
  }
  v16 = *(id *)(*(_QWORD *)(v13 + 56) + 8 * v14);
  swift_bridgeObjectRelease();
  sub_1CF3D3DF4(0, (unint64_t *)&qword_1ED8F4498);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F3680);
  v17 = swift_allocObject();
  v18 = MEMORY[0x1E0DEDC60];
  *(_OWORD *)(v17 + 16) = xmmword_1CF528560;
  v19 = MEMORY[0x1E0DEDCD8];
  *(_QWORD *)(v17 + 56) = v18;
  *(_QWORD *)(v17 + 64) = v19;
  *(_QWORD *)(v17 + 32) = a1;
  v59 = (void *)sub_1CF5251CC();
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_1CF527020;
  v61 = v16;
  v21 = objc_msgSend(v16, sel_name);
  v22 = sub_1CF524E9C();
  v24 = v23;

  *(_QWORD *)(v20 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v20 + 64) = sub_1CF4321C4();
  *(_QWORD *)(v20 + 32) = v22;
  *(_QWORD *)(v20 + 40) = v24;
  *(_QWORD *)(v20 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB941F8);
  *(_QWORD *)(v20 + 104) = sub_1CF4157B4(&qword_1EFB94200, &qword_1EFB941F8, MEMORY[0x1E0CB1BE8]);
  *(_QWORD *)(v20 + 72) = a2;
  swift_bridgeObjectRetain();
  v25 = (void *)sub_1CF5251CC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F29D8);
  v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = xmmword_1CF526FD0;
  *(_QWORD *)(v26 + 32) = v59;
  *(_QWORD *)(v26 + 40) = v25;
  sub_1CF525004();
  v27 = v59;
  v28 = v25;
  v29 = (void *)sub_1CF524FE0();
  swift_bridgeObjectRelease();
  v30 = objc_msgSend((id)objc_opt_self(), sel_andPredicateWithSubpredicates_, v29);

  objc_msgSend(v9, sel_setPredicate_, v30);
  v31 = objc_msgSend((id)objc_opt_self(), sel_fetchHistoryWithFetchRequest_, v9);
  objc_msgSend(v31, sel_setResultType_, 5);
  *(_QWORD *)&v65 = 0;
  v32 = objc_msgSend(a3, sel_executeRequest_error_, v31, &v65);
  v33 = (void *)v65;
  if (!v32)
  {
    v38 = (id)v65;
    sub_1CF5248C0();

    swift_willThrow();
    return v8;
  }
  v34 = v32;
  v60 = v31;
  objc_opt_self();
  v35 = (void *)swift_dynamicCastObjCClassUnconditional();
  v36 = v33;
  if (objc_msgSend(v35, sel_result))
  {
    sub_1CF525454();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v64, 0, sizeof(v64));
  }
  sub_1CF3F7218((uint64_t)v64, (uint64_t)&v65, &qword_1ED8F29E8);
  v57 = v28;
  if (*((_QWORD *)&v66 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F29A8);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v58 = v34;
      *(_QWORD *)&v65 = v8;
      if (v63 >> 62)
      {
        swift_bridgeObjectRetain();
        v39 = sub_1CF5256F4();
        swift_bridgeObjectRelease();
      }
      else
      {
        v39 = *(_QWORD *)((v63 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      v41 = v60;
      v40 = v61;
      if (v39)
      {
        v56 = v27;
        if (v39 < 1)
          __break(1u);
        for (i = 0; i != v39; ++i)
        {
          if ((v63 & 0xC000000000000001) != 0)
            v43 = (id)MEMORY[0x1D17D05F8](i);
          else
            v43 = *(id *)(v63 + 8 * i + 32);
          v44 = v43;
          v45 = objc_msgSend(v43, sel_changes, v56, v57, v58);
          if (v45)
          {
            v46 = v45;
            sub_1CF3D3DF4(0, &qword_1EFB900B0);
            v47 = sub_1CF524FEC();

            sub_1CF428C80(v47);
          }

        }
        swift_bridgeObjectRelease();
        v8 = v65;
        v41 = v60;
        v40 = v61;
        v27 = v56;
      }
      else
      {

        swift_bridgeObjectRelease();
      }

      return v8;
    }
  }
  else
  {
    sub_1CF3CB808((uint64_t)&v65, &qword_1ED8F29E8);
  }
  if (qword_1ED8F4410 != -1)
    swift_once();
  v48 = sub_1CF524C5C();
  __swift_project_value_buffer(v48, (uint64_t)qword_1ED8F2958);
  v49 = v34;
  v50 = sub_1CF524C44();
  v51 = sub_1CF525208();
  if (os_log_type_enabled(v50, v51))
  {
    v52 = (uint8_t *)swift_slowAlloc();
    v53 = swift_slowAlloc();
    *(_QWORD *)&v64[0] = v53;
    *(_DWORD *)v52 = 136315138;
    if (objc_msgSend(v35, sel_result))
    {
      sub_1CF525454();
      swift_unknownObjectRelease();
    }
    else
    {
      v65 = 0u;
      v66 = 0u;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F29E8);
    v54 = sub_1CF524EE4();
    *(_QWORD *)&v65 = sub_1CF3F9B9C(v54, v55, (uint64_t *)v64);
    sub_1CF525418();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1CF3C3000, v50, v51, "Failed to cast history results %s", v52, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D17D1060](v53, -1, -1);
    MEMORY[0x1D17D1060](v52, -1, -1);

    return MEMORY[0x1E0DEE9D8];
  }
  else
  {

  }
  return v8;
}

uint64_t sub_1CF4F0A04(uint64_t a1)
{
  uint64_t v1;

  return sub_1CF4E9348(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24)) & 1;
}

uint64_t type metadata accessor for AccountAndStartingDate()
{
  uint64_t result;

  result = qword_1ED8F26E8;
  if (!qword_1ED8F26E8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1CF4F0A5C(unint64_t *a1, unint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = sub_1CF3D3DF4(255, a2);
    result = MEMORY[0x1D17D0F7C](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1CF4F0A9C(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1CF4F0AC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_1CF4EB51C(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t sub_1CF4F0ACC(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *sub_1CF4F0AF4(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return a2;
}

ValueMetadata *type metadata accessor for AccountTombstone()
{
  return &type metadata for AccountTombstone;
}

ValueMetadata *type metadata accessor for AccountBalanceTombstone()
{
  return &type metadata for AccountBalanceTombstone;
}

ValueMetadata *type metadata accessor for TransactionTombstone()
{
  return &type metadata for TransactionTombstone;
}

ValueMetadata *type metadata accessor for ConsentTombstone()
{
  return &type metadata for ConsentTombstone;
}

_QWORD *initializeBufferWithCopyOfBuffer for AllowedAccountAndDates(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for AllowedAccountAndDates(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for AllowedAccountAndDates(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AllowedAccountAndDates(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for AllowedAccountAndDates(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

uint64_t sub_1CF4F0C7C(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_1CF4F0C94(_QWORD *result, int a2)
{
  unsigned int v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2)
      return result;
    v2 = a2 - 1;
  }
  *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for AllowedAccountAndDates()
{
  return &type metadata for AllowedAccountAndDates;
}

uint64_t *sub_1CF4F0CC4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1CF524AB8();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_1CF524A70();
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
  }
  return a1;
}

uint64_t sub_1CF4F0DCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v4 = sub_1CF524AB8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_1CF524A70();
  v7 = *(_QWORD *)(v6 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  return result;
}

uint64_t sub_1CF4F0E5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = sub_1CF524AB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_1CF524A70();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t sub_1CF4F0F38(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = sub_1CF524AB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_1CF524A70();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t sub_1CF4F1060(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = sub_1CF524AB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_1CF524A70();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t sub_1CF4F113C(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = sub_1CF524AB8();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_1CF524A70();
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
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t sub_1CF4F1264()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF4F1270(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = sub_1CF524AB8();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_1CF4F12E8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF4F12F4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = sub_1CF524AB8();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_1CF4F1374()
{
  unint64_t v0;
  unint64_t v1;

  sub_1CF524AB8();
  if (v0 <= 0x3F)
  {
    sub_1CF3D5B68();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t storeEnumTagSinglePayload for FinancialDataHistoricalError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1CF4F1438 + 4 * asc_1CF52B8E0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1CF4F1458 + 4 * byte_1CF52B8E5[v4]))();
}

_BYTE *sub_1CF4F1438(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1CF4F1458(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1CF4F1460(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1CF4F1468(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1CF4F1470(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1CF4F1478(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for FinancialDataHistoricalError()
{
  return &type metadata for FinancialDataHistoricalError;
}

unint64_t sub_1CF4F1498()
{
  unint64_t result;

  result = qword_1EFB94210;
  if (!qword_1EFB94210)
  {
    result = MEMORY[0x1D17D0F7C](&unk_1CF52BA60, &type metadata for FinancialDataHistoricalError);
    atomic_store(result, (unint64_t *)&qword_1EFB94210);
  }
  return result;
}

uint64_t sub_1CF4F14DC()
{
  return sub_1CF3C6DA0(qword_1EFB94218, (uint64_t (*)(uint64_t))type metadata accessor for AccountAndStartingDate, (uint64_t)&unk_1CF52BA88);
}

uint64_t sub_1CF4F150C(uint64_t a1)
{
  return sub_1CF4F0A04(a1) & 1;
}

uint64_t sub_1CF4F1524(uint64_t (*a1)(id *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  id v18;
  uint64_t v19;

  v4 = a3;
  v19 = MEMORY[0x1E0DEE9D8];
  if (a3 >> 62)
    goto LABEL_18;
  v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v7)
  {
    while (1)
    {
      v8 = 0;
      v16 = v4 & 0xFFFFFFFFFFFFFF8;
      v17 = v4 & 0xC000000000000001;
      v15 = v4;
      while (v17)
      {
        v9 = (id)MEMORY[0x1D17D05F8](v8, v4);
LABEL_9:
        v10 = v9;
        v11 = v8 + 1;
        if (__OFADD__(v8, 1))
          goto LABEL_17;
        v18 = v9;
        v12 = a2;
        v13 = a1(&v18);
        if (v3)
        {
          swift_bridgeObjectRelease();

          swift_release();
          return v12;
        }
        if ((v13 & 1) != 0)
        {
          sub_1CF5255EC();
          sub_1CF525610();
          v4 = v15;
          sub_1CF52561C();
          sub_1CF5255F8();
        }
        else
        {

        }
        ++v8;
        if (v11 == v7)
        {
          v12 = v19;
          goto LABEL_20;
        }
      }
      if (v8 < *(_QWORD *)(v16 + 16))
        break;
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      v7 = sub_1CF5256F4();
      if (!v7)
        goto LABEL_19;
    }
    v9 = *(id *)(v4 + 8 * v8 + 32);
    goto LABEL_9;
  }
LABEL_19:
  v12 = MEMORY[0x1E0DEE9D8];
LABEL_20:
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_1CF4F16C8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2778);
  swift_allocBox();
  LOBYTE(v8) = 0;
  sub_1CF3D3ECC(v0 + 24, (uint64_t)v7);
  sub_1CF521E78();
  sub_1CF521E48();
  v7[0] = MEMORY[0x1E0DEE9D8];
  sub_1CF5227E4();
  v2 = (void *)sub_1CF5227C0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F29D8);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1CF526FD0;
  *(_QWORD *)(v3 + 32) = sub_1CF52279C();
  *(_QWORD *)(v3 + 40) = sub_1CF5227CC();
  v8 = v3;
  sub_1CF525004();
  sub_1CF3DDA3C();
  v4 = (void *)sub_1CF524FE0();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend((id)objc_opt_self(), sel_andPredicateWithSubpredicates_, v4);

  objc_msgSend(v2, sel_setPredicate_, v5);
  sub_1CF525364();
  if (v1)
  {

    swift_release();
    return swift_bridgeObjectRelease();
  }
  else
  {
    swift_release();

    return v7[0];
  }
}

unint64_t sub_1CF4F18AC(uint64_t a1, char *a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  unint64_t result;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  id v28;
  BOOL v29;
  unint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  char *v32;
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint8_t *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  NSObject *v53;
  os_log_type_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  NSObject *v65;
  os_log_type_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  uint64_t v75;
  id v76;
  NSObject *v77;
  os_log_type_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  unint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  __int128 v104;
  _QWORD *v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  unint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  char *v114;
  uint64_t v115;

  v111 = a3;
  v112 = a2;
  v113 = sub_1CF524AB8();
  v6 = *(_QWORD *)(v113 - 8);
  MEMORY[0x1E0C80A78](v113);
  v8 = (char *)&v88 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1CF524A70();
  v10 = *(_QWORD *)(v9 - 8);
  v107 = v9;
  v108 = v10;
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v88 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v88 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2778);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v19 = (char *)&v88 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v92 = a1;
  sub_1CF5227E4();
  v20 = v114;
  result = sub_1CF525388();
  if (v20)
    return result;
  v97 = v19;
  v95 = v17;
  v98 = 0;
  v99 = v16;
  v106 = v15;
  v112 = v12;
  v91 = result;
  if (result >> 62)
    goto LABEL_60;
  v22 = *(_QWORD *)((result & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_4:
  v23 = v108;
  v24 = v99;
  v25 = v95;
  if (!v22)
    return swift_bridgeObjectRelease();
  v96 = swift_projectBox();
  v26 = 0;
  v94 = v91 & 0xC000000000000001;
  v90 = v91 & 0xFFFFFFFFFFFFFF8;
  v89 = v91 + 32;
  *(_QWORD *)&v27 = 136315138;
  v104 = v27;
  v103 = MEMORY[0x1E0DEE9B8] + 8;
  v105 = a4;
  v114 = v8;
  v93 = v22;
  while (1)
  {
    if (v94)
    {
      v28 = (id)MEMORY[0x1D17D05F8](v26, v91);
    }
    else
    {
      if (v26 >= *(_QWORD *)(v90 + 16))
        goto LABEL_59;
      v28 = *(id *)(v89 + 8 * v26);
    }
    v101 = v28;
    v29 = __OFADD__(v26, 1);
    v30 = v26 + 1;
    if (v29)
    {
      __break(1u);
LABEL_58:
      __break(1u);
LABEL_59:
      __break(1u);
LABEL_60:
      swift_bridgeObjectRetain();
      v22 = sub_1CF5256F4();
      swift_bridgeObjectRelease();
      goto LABEL_4;
    }
    v100 = v30;
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v25 + 16);
    v32 = v97;
    v31(v97, v96, v24);
    sub_1CF521E3C();
    v33 = *(void (**)(char *, uint64_t))(v25 + 8);
    v33(v32, v24);
    if ((v115 & 1) != 0)
    {
      if (qword_1ED8F2750 != -1)
        swift_once();
      v34 = sub_1CF524C5C();
      __swift_project_value_buffer(v34, (uint64_t)qword_1ED8F3650);
      v35 = sub_1CF524C44();
      v36 = sub_1CF525208();
      if (os_log_type_enabled(v35, v36))
      {
        v37 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v37 = 0;
        _os_log_impl(&dword_1CF3C3000, v35, v36, "Force FLL Enabled override is on.", v37, 2u);
        v38 = v37;
        v24 = v99;
        MEMORY[0x1D17D1060](v38, -1, -1);
      }

      v32 = v97;
    }
    if ((objc_msgSend(v101, sel_financialLabEnabled) & 1) == 0)
    {
      v31(v32, v96, v24);
      sub_1CF521E3C();
      v33(v32, v24);
      if (v115 != 1)
      {
        if (qword_1ED8F2750 != -1)
          swift_once();
        v75 = sub_1CF524C5C();
        __swift_project_value_buffer(v75, (uint64_t)qword_1ED8F3650);
        v76 = v101;
        v77 = sub_1CF524C44();
        v78 = sub_1CF525220();
        if (os_log_type_enabled(v77, v78))
        {
          v79 = swift_slowAlloc();
          v80 = swift_slowAlloc();
          v115 = v80;
          *(_DWORD *)v79 = v104;
          v81 = objc_msgSend(v76, sel_id);
          v82 = sub_1CF524E9C();
          v84 = v83;

          v85 = v82;
          v23 = v108;
          *(_QWORD *)(v79 + 4) = sub_1CF3F9B9C(v85, v84, &v115);

          v8 = v114;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1CF3C3000, v77, v78, "Not considering any accounts for institution id: %s because FLL is not enabled for this institution.", (uint8_t *)v79, 0xCu);
          swift_arrayDestroy();
          v86 = v80;
          a4 = v105;
          MEMORY[0x1D17D1060](v86, -1, -1);
          v87 = v79;
          v24 = v99;
          MEMORY[0x1D17D1060](v87, -1, -1);

        }
        else
        {

        }
        goto LABEL_7;
      }
    }
    sub_1CF52321C();
    v39 = objc_msgSend(v101, sel_id);
    sub_1CF524E9C();

    v40 = v98;
    v41 = sub_1CF5231BC();
    v98 = v40;
    if (v40)
      break;
    v42 = v41;
    swift_bridgeObjectRelease();
    if (v42 >> 62)
    {
      swift_bridgeObjectRetain();
      v43 = sub_1CF5256F4();
      swift_bridgeObjectRelease();
    }
    else
    {
      v43 = *(_QWORD *)((v42 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v24 = v99;
    if (v43)
    {
      if (v43 >= 1)
      {
        v44 = 0;
        v109 = v42;
        v110 = v42 & 0xC000000000000001;
        v111 = v43;
        while (1)
        {
          v45 = v110 ? (id)MEMORY[0x1D17D05F8](v44, v42) : *(id *)(v42 + 8 * v44 + 32);
          v46 = v45;
          v47 = objc_msgSend(v45, sel_earliestHistoricalTransactionsRequestStartDate);
          if (!v47)
            break;
          v48 = v47;
          sub_1CF524A40();

          v49 = v107;
          v50 = (uint64_t)v106;
          (*(void (**)(void))(v23 + 32))();
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v23 + 56))(v50, 0, 1, v49);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48))(v50, 1, v49) == 1)
            goto LABEL_39;
          sub_1CF3D52A0(v50);
          if (qword_1ED8F2750 != -1)
            swift_once();
          v51 = sub_1CF524C5C();
          __swift_project_value_buffer(v51, (uint64_t)qword_1ED8F3650);
          v52 = v46;
          v53 = sub_1CF524C44();
          v54 = sub_1CF525220();
          if (os_log_type_enabled(v53, v54))
          {
            v55 = swift_slowAlloc();
            v102 = swift_slowAlloc();
            v115 = v102;
            *(_DWORD *)v55 = v104;
            sub_1CF5231F8();
            sub_1CF3C6DA0(&qword_1EFB8F9B0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
            v56 = v113;
            v57 = sub_1CF5257F0();
            v59 = v58;
            (*(void (**)(char *, uint64_t))(v6 + 8))(v114, v56);
            v60 = v57;
            v8 = v114;
            *(_QWORD *)(v55 + 4) = sub_1CF3F9B9C(v60, v59, &v115);

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_1CF3C3000, v53, v54, "Not considering acount id: %s because historical transactions have not been fetched", (uint8_t *)v55, 0xCu);
            v61 = v102;
            swift_arrayDestroy();
            MEMORY[0x1D17D1060](v61, -1, -1);
            v62 = v55;
            a4 = v105;
            MEMORY[0x1D17D1060](v62, -1, -1);

          }
          else
          {

          }
LABEL_28:
          v23 = v108;
          v42 = v109;
          if (v111 == ++v44)
          {

            swift_bridgeObjectRelease();
            v24 = v99;
            goto LABEL_7;
          }
        }
        v50 = (uint64_t)v106;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v23 + 56))(v106, 1, 1, v107);
LABEL_39:
        sub_1CF3D52A0(v50);
        if (qword_1ED8F2750 != -1)
          swift_once();
        v63 = sub_1CF524C5C();
        __swift_project_value_buffer(v63, (uint64_t)qword_1ED8F3650);
        v64 = v46;
        v65 = sub_1CF524C44();
        v66 = sub_1CF525220();
        if (os_log_type_enabled(v65, v66))
        {
          v67 = swift_slowAlloc();
          v68 = swift_slowAlloc();
          v115 = v68;
          *(_DWORD *)v67 = v104;
          sub_1CF5231F8();
          sub_1CF3C6DA0(&qword_1EFB8F9B0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
          v69 = sub_1CF5257F0();
          v71 = v70;
          (*(void (**)(char *, uint64_t))(v6 + 8))(v114, v113);
          *(_QWORD *)(v67 + 4) = sub_1CF3F9B9C(v69, v71, &v115);

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1CF3C3000, v65, v66, "Account id: %s has fetched historical transactions. Account passed consideration test.", (uint8_t *)v67, 0xCu);
          swift_arrayDestroy();
          v72 = v68;
          v8 = v114;
          MEMORY[0x1D17D1060](v72, -1, -1);
          v73 = v67;
          a4 = v105;
          MEMORY[0x1D17D1060](v73, -1, -1);

        }
        else
        {

        }
        v74 = v64;
        MEMORY[0x1D17CFFEC]();
        if (*(_QWORD *)((*a4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*a4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1CF52501C();
        sub_1CF52504C();
        sub_1CF525004();

        goto LABEL_28;
      }
      goto LABEL_58;
    }

    swift_bridgeObjectRelease();
LABEL_7:
    v26 = v100;
    v25 = v95;
    if (v100 == v93)
      return swift_bridgeObjectRelease();
  }

  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CF4F2374@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _BYTE v9[16];
  uint64_t v10;

  result = sub_1CF4F16C8();
  if (!v2)
  {
    MEMORY[0x1E0C80A78](result);
    v10 = a1;
    v7 = sub_1CF4F1524(sub_1CF4F2458, (uint64_t)v9, v6);
    MEMORY[0x1E0C80A78](v7);
    v10 = a1;
    v8 = sub_1CF4AAEB0((void (*)(id *))sub_1CF4F2B58, (uint64_t)v9, v7);
    result = swift_bridgeObjectRelease();
    *a2 = v8;
  }
  return result;
}

uint64_t sub_1CF4F2458(void **a1)
{
  uint64_t v1;

  return sub_1CF4F2480(*a1, **(_QWORD **)(v1 + 16), *(_QWORD *)(*(_QWORD *)(v1 + 16) + 8), *(_QWORD *)(*(_QWORD *)(v1 + 16) + 16)) & 1;
}

uint64_t sub_1CF4F2480(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  void *v29;
  uint64_t (*v30)(uint64_t *);
  id v31;
  id v32;
  uint8_t *v33;
  char v34;
  char *v35;
  NSObject *v36;
  char *v37;
  uint64_t v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  unint64_t v42;
  const char *v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  char *v47;
  uint8_t *v49;
  char *v50;
  char *v51;
  char *v52;
  void (*v53)(char *, char *, uint64_t);
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint8_t *v58;
  uint64_t v59;
  uint64_t v60[5];
  uint64_t v61;

  v59 = a3;
  v56 = a4;
  v57 = a2;
  v5 = sub_1CF523E7C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x1E0C80A78](v7);
  v50 = (char *)&v49 - v11;
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v49 - v13;
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v49 - v15;
  v55 = a1;
  sub_1CF523174();
  if (qword_1ED8F2750 != -1)
    swift_once();
  v17 = sub_1CF524C5C();
  v18 = __swift_project_value_buffer(v17, (uint64_t)qword_1ED8F3650);
  v53 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
  v53(v14, v16, v5);
  v54 = v18;
  v19 = sub_1CF524C44();
  v20 = sub_1CF5251F0();
  v21 = os_log_type_enabled(v19, v20);
  v51 = v9;
  if (v21)
  {
    v22 = (uint8_t *)swift_slowAlloc();
    v23 = swift_slowAlloc();
    v52 = v16;
    v24 = v23;
    v60[0] = v23;
    *(_DWORD *)v22 = 136315138;
    v49 = v22 + 4;
    sub_1CF3C6DA0((unint64_t *)&qword_1EFB8F7F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD380], MEMORY[0x1E0CAD3A0]);
    v25 = sub_1CF5257F0();
    v61 = sub_1CF3F9B9C(v25, v26, v60);
    sub_1CF525418();
    swift_bridgeObjectRelease();
    v27 = *(void (**)(char *, uint64_t))(v6 + 8);
    v27(v14, v5);
    _os_log_impl(&dword_1CF3C3000, v19, v20, "Determining if fqai: %s should be processed...", v22, 0xCu);
    swift_arrayDestroy();
    v28 = v24;
    v16 = v52;
    MEMORY[0x1D17D1060](v28, -1, -1);
    MEMORY[0x1D17D1060](v22, -1, -1);
  }
  else
  {
    v27 = *(void (**)(char *, uint64_t))(v6 + 8);
    v27(v14, v5);
  }

  v60[3] = (uint64_t)&type metadata for OfflineLabCoreDataAttributeProvider;
  v60[4] = (uint64_t)&off_1E8C6D690;
  v29 = (void *)v56;
  v60[0] = (uint64_t)v55;
  v60[1] = v56;
  v30 = *(uint64_t (**)(uint64_t *))(v59 + 8);
  v31 = v55;
  v32 = v29;
  v33 = v58;
  v34 = v30(v60);
  if (!v33)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v60);
    if ((v34 & 1) != 0)
    {
      v35 = v50;
      v53(v50, v16, v5);
      v36 = sub_1CF524C44();
      v37 = v16;
      v38 = v5;
      v39 = sub_1CF5251F0();
      if (os_log_type_enabled(v36, v39))
      {
        v52 = v37;
        v40 = (uint8_t *)swift_slowAlloc();
        v59 = swift_slowAlloc();
        v60[0] = v59;
        *(_DWORD *)v40 = 136315138;
        v58 = v40 + 4;
        sub_1CF3C6DA0((unint64_t *)&qword_1EFB8F7F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD380], MEMORY[0x1E0CAD3A0]);
        v41 = sub_1CF5257F0();
        v61 = sub_1CF3F9B9C(v41, v42, v60);
        sub_1CF525418();
        swift_bridgeObjectRelease();
        v27(v50, v38);
        v43 = "fqai: %s has met the criteria for processing";
LABEL_13:
        _os_log_impl(&dword_1CF3C3000, v36, v39, v43, v40, 0xCu);
        v46 = v59;
        swift_arrayDestroy();
        MEMORY[0x1D17D1060](v46, -1, -1);
        MEMORY[0x1D17D1060](v40, -1, -1);

        v47 = v52;
LABEL_15:
        v27(v47, v38);
        return v34 & 1;
      }
    }
    else
    {
      v35 = v51;
      v53(v51, v16, v5);
      v36 = sub_1CF524C44();
      v37 = v16;
      v38 = v5;
      v39 = sub_1CF5251F0();
      if (os_log_type_enabled(v36, v39))
      {
        v52 = v37;
        v40 = (uint8_t *)swift_slowAlloc();
        v59 = swift_slowAlloc();
        v60[0] = v59;
        *(_DWORD *)v40 = 136315138;
        v58 = v40 + 4;
        sub_1CF3C6DA0((unint64_t *)&qword_1EFB8F7F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD380], MEMORY[0x1E0CAD3A0]);
        v44 = sub_1CF5257F0();
        v61 = sub_1CF3F9B9C(v44, v45, v60);
        sub_1CF525418();
        swift_bridgeObjectRelease();
        v27(v51, v38);
        v43 = "fqai: %s has not met the criterial for processing";
        goto LABEL_13;
      }
    }

    v27(v35, v38);
    v47 = v37;
    goto LABEL_15;
  }
  v27(v16, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v60);
  return v34 & 1;
}

uint64_t sub_1CF4F2A04@<X0>(void **a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void (*v16)(_QWORD *, uint64_t, uint64_t);
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];

  v22 = a3;
  v5 = sub_1CF524A70();
  v23 = *(_QWORD *)(v5 - 8);
  v24 = v5;
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1CF523E7C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *a1;
  sub_1CF523174();
  v14 = *a2;
  v13 = a2[1];
  v15 = (void *)a2[2];
  v25[3] = &type metadata for OfflineLabCoreDataAttributeProvider;
  v25[4] = &off_1E8C6D690;
  v25[0] = v12;
  v25[1] = v15;
  v16 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v13 + 16);
  v17 = v12;
  v18 = v15;
  v16(v25, v14, v13);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  v19 = v22;
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v22, v11, v8);
  v20 = type metadata accessor for OfflineLabAccountInfo();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v23 + 32))(v19 + *(int *)(v20 + 20), v7, v24);
}

uint64_t sub_1CF4F2B58@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1CF4F2A04(a1, *(uint64_t **)(v2 + 16), a2);
}

uint64_t type metadata accessor for OfflineLabAccountInfo()
{
  uint64_t result;

  result = qword_1EFB94278;
  if (!qword_1EFB94278)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_1CF4F2BB0()
{
  uint64_t v0;

  return sub_1CF4F18AC(*(_QWORD *)(v0 + 16), *(char **)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD **)(v0 + 40));
}

void destroy for OfflineLabAccountProvider(uint64_t a1)
{

  __swift_destroy_boxed_opaque_existential_1(a1 + 24);
}

uint64_t initializeWithCopy for OfflineLabAccountProvider(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  id v10;
  void *v11;
  id v12;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v4;
  v5 = a1 + 24;
  v6 = a2 + 24;
  v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 48) = v7;
  v8 = v7;
  v9 = **(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8);
  v10 = v4;
  v9(v5, v6, v8);
  v11 = *(void **)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v11;
  v12 = v11;
  return a1;
}

uint64_t assignWithCopy for OfflineLabAccountProvider(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(void **)(a2 + 16);
  v5 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v4;
  v6 = v4;

  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 24), (uint64_t *)(a2 + 24));
  v7 = *(void **)(a2 + 64);
  v8 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = v7;
  v9 = v7;

  return a1;
}

__n128 __swift_memcpy72_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for OfflineLabAccountProvider(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  __swift_destroy_boxed_opaque_existential_1(a1 + 24);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  v5 = *(_QWORD *)(a2 + 64);
  v6 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v5;

  return a1;
}

uint64_t getEnumTagSinglePayload for OfflineLabAccountProvider(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for OfflineLabAccountProvider(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 72) = 1;
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
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for OfflineLabAccountProvider()
{
  return &type metadata for OfflineLabAccountProvider;
}

uint64_t *sub_1CF4F2E14(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
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
    v7 = sub_1CF523E7C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_1CF524A70();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
  }
  return a1;
}

uint64_t sub_1CF4F2EBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_1CF523E7C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_1CF524A70();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t sub_1CF4F2F18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_1CF523E7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1CF524A70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  return a1;
}

uint64_t sub_1CF4F2F94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_1CF523E7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1CF524A70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_1CF4F3010(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_1CF523E7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1CF524A70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  return a1;
}

uint64_t sub_1CF4F308C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_1CF523E7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1CF524A70();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_1CF4F3108()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF4F3114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = sub_1CF523E7C();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = sub_1CF524A70();
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_1CF4F3188()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF4F3194(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = sub_1CF523E7C();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = sub_1CF524A70();
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_1CF4F3210()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_1CF523E7C();
  if (v1 <= 0x3F)
  {
    result = sub_1CF524A70();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for OfflineLabAccountProvider.LogicCoordinator(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = v3;
  return a1;
}

void destroy for OfflineLabAccountProvider.LogicCoordinator(uint64_t a1)
{

}

uint64_t assignWithCopy for OfflineLabAccountProvider.LogicCoordinator(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(void **)(a2 + 16);
  v4 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v3;
  v5 = v3;

  return a1;
}

uint64_t assignWithTake for OfflineLabAccountProvider.LogicCoordinator(uint64_t a1, uint64_t a2)
{
  void *v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  return a1;
}

ValueMetadata *type metadata accessor for OfflineLabAccountProvider.LogicCoordinator()
{
  return &type metadata for OfflineLabAccountProvider.LogicCoordinator;
}

uint64_t sub_1CF4F3358(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v16;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v16 = MEMORY[0x1E0DEE9D8];
    sub_1CF514AEC(0, v1, 0);
    v2 = v16;
    v4 = (uint64_t *)(a1 + 56);
    do
    {
      v5 = *(v4 - 3);
      v6 = *(v4 - 2);
      v7 = *(v4 - 1);
      v8 = *v4;
      swift_bridgeObjectRetain();
      v9 = MEMORY[0x1D17CFF38](v5, v6, v7, v8);
      v11 = v10;
      swift_bridgeObjectRelease();
      v13 = *(_QWORD *)(v16 + 16);
      v12 = *(_QWORD *)(v16 + 24);
      if (v13 >= v12 >> 1)
        sub_1CF514AEC(v12 > 1, v13 + 1, 1);
      *(_QWORD *)(v16 + 16) = v13 + 1;
      v14 = v16 + 16 * v13;
      *(_QWORD *)(v14 + 32) = v9;
      *(_QWORD *)(v14 + 40) = v11;
      v4 += 4;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t RawAddress.addressLines.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t RawAddress.addressLines.setter(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v1 = a1;
  return result;
}

uint64_t (*RawAddress.addressLines.modify())()
{
  return nullsub_1;
}

uint64_t RawAddress.locality.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RawAddress.locality.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 8) = a1;
  *(_QWORD *)(v2 + 16) = a2;
  return result;
}

uint64_t (*RawAddress.locality.modify())()
{
  return nullsub_1;
}

uint64_t RawAddress.subLocality.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RawAddress.subLocality.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return result;
}

uint64_t (*RawAddress.subLocality.modify())()
{
  return nullsub_1;
}

uint64_t RawAddress.administrativeArea.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RawAddress.administrativeArea.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = a2;
  return result;
}

uint64_t (*RawAddress.administrativeArea.modify())()
{
  return nullsub_1;
}

uint64_t RawAddress.subAdministrativeArea.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RawAddress.subAdministrativeArea.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = a2;
  return result;
}

uint64_t (*RawAddress.subAdministrativeArea.modify())()
{
  return nullsub_1;
}

uint64_t RawAddress.postalCode.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RawAddress.postalCode.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 72) = a1;
  *(_QWORD *)(v2 + 80) = a2;
  return result;
}

uint64_t (*RawAddress.postalCode.modify())()
{
  return nullsub_1;
}

uint64_t RawAddress.countryCode.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 88);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t RawAddress.countryCode.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 88) = a1;
  *(_QWORD *)(v2 + 96) = a2;
  return result;
}

uint64_t (*RawAddress.countryCode.modify())()
{
  return nullsub_1;
}

__n128 RawAddress.init(addressLines:locality:subLocality:administrativeArea:subAdministrativeArea:postalCode:countryCode:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, __int128 a10, __n128 a11, uint64_t a12)
{
  __n128 result;

  result = a11;
  *(_QWORD *)a9 = a1;
  *(_QWORD *)(a9 + 8) = a2;
  *(_QWORD *)(a9 + 16) = a3;
  *(_QWORD *)(a9 + 24) = a4;
  *(_QWORD *)(a9 + 32) = a5;
  *(_QWORD *)(a9 + 40) = a6;
  *(_QWORD *)(a9 + 48) = a7;
  *(_QWORD *)(a9 + 56) = a8;
  *(_OWORD *)(a9 + 64) = a10;
  *(__n128 *)(a9 + 80) = a11;
  *(_QWORD *)(a9 + 96) = a12;
  return result;
}

uint64_t RawAddress.hash(into:)()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v1 = *v0;
  v2 = v0[2];
  v3 = v0[4];
  v4 = v0[6];
  v5 = v0[8];
  v12 = v0[10];
  v6 = v0[12];
  if (*v0)
  {
    sub_1CF5258C8();
    sub_1CF5258BC();
    v7 = *(_QWORD *)(v1 + 16);
    if (v7)
    {
      v11 = v6;
      swift_bridgeObjectRetain();
      v8 = v1 + 40;
      do
      {
        swift_bridgeObjectRetain();
        sub_1CF524F08();
        swift_bridgeObjectRelease();
        v8 += 16;
        --v7;
      }
      while (v7);
      swift_bridgeObjectRelease();
      v6 = v11;
    }
    if (v2)
    {
LABEL_7:
      sub_1CF5258C8();
      swift_bridgeObjectRetain();
      sub_1CF524F08();
      swift_bridgeObjectRelease();
      v9 = v12;
      if (v3)
        goto LABEL_8;
      goto LABEL_15;
    }
  }
  else
  {
    sub_1CF5258C8();
    if (v2)
      goto LABEL_7;
  }
  sub_1CF5258C8();
  v9 = v12;
  if (v3)
  {
LABEL_8:
    sub_1CF5258C8();
    swift_bridgeObjectRetain();
    sub_1CF524F08();
    swift_bridgeObjectRelease();
    if (v4)
      goto LABEL_9;
    goto LABEL_16;
  }
LABEL_15:
  sub_1CF5258C8();
  if (v4)
  {
LABEL_9:
    sub_1CF5258C8();
    swift_bridgeObjectRetain();
    sub_1CF524F08();
    swift_bridgeObjectRelease();
    if (v5)
      goto LABEL_10;
    goto LABEL_17;
  }
LABEL_16:
  sub_1CF5258C8();
  if (v5)
  {
LABEL_10:
    sub_1CF5258C8();
    swift_bridgeObjectRetain();
    sub_1CF524F08();
    swift_bridgeObjectRelease();
    if (v9)
      goto LABEL_11;
LABEL_18:
    sub_1CF5258C8();
    if (v6)
      goto LABEL_12;
    return sub_1CF5258C8();
  }
LABEL_17:
  sub_1CF5258C8();
  if (!v9)
    goto LABEL_18;
LABEL_11:
  sub_1CF5258C8();
  swift_bridgeObjectRetain();
  sub_1CF524F08();
  swift_bridgeObjectRelease();
  if (v6)
  {
LABEL_12:
    sub_1CF5258C8();
    swift_bridgeObjectRetain();
    sub_1CF524F08();
    return swift_bridgeObjectRelease();
  }
  return sub_1CF5258C8();
}

uint64_t sub_1CF4F39E4(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1CF4F3A20
                                                            + 4 * asc_1CF52BBF4[a1]))(0x4C73736572646461, 0xEC00000073656E69);
}

uint64_t sub_1CF4F3A20()
{
  return 0x7974696C61636F6CLL;
}

uint64_t sub_1CF4F3A38()
{
  return 0x6C61636F4C627573;
}

unint64_t sub_1CF4F3A58()
{
  return 0xD000000000000012;
}

unint64_t sub_1CF4F3A74()
{
  return 0xD000000000000015;
}

uint64_t sub_1CF4F3A94()
{
  return 0x6F436C6174736F70;
}

uint64_t sub_1CF4F3AB0()
{
  return 0x437972746E756F63;
}

uint64_t sub_1CF4F3AD0()
{
  unsigned __int8 *v0;

  return sub_1CF4F39E4(*v0);
}

uint64_t sub_1CF4F3AD8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CF4F5C7C(a1, a2);
  *a3 = result;
  return result;
}

void sub_1CF4F3AFC(_BYTE *a1@<X8>)
{
  *a1 = 7;
}

uint64_t sub_1CF4F3B08()
{
  sub_1CF4F5578();
  return sub_1CF525928();
}

uint64_t sub_1CF4F3B30()
{
  sub_1CF4F5578();
  return sub_1CF525934();
}

uint64_t RawAddress.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[13];
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  uint64_t v24;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB942B0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v1;
  v8 = v1[1];
  v16[11] = v1[2];
  v16[12] = v8;
  v10 = v1[3];
  v16[9] = v1[4];
  v16[10] = v10;
  v11 = v1[5];
  v16[7] = v1[6];
  v16[8] = v11;
  v12 = v1[7];
  v16[5] = v1[8];
  v16[6] = v12;
  v13 = v1[10];
  v16[3] = v1[9];
  v16[4] = v13;
  v14 = v1[11];
  v16[1] = v1[12];
  v16[2] = v14;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1CF4F5578();
  sub_1CF52591C();
  v24 = v9;
  v23 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F29A0);
  sub_1CF4F55BC(&qword_1EFB942C0, MEMORY[0x1E0DEA970], MEMORY[0x1E0DEAF10]);
  sub_1CF52579C();
  if (!v2)
  {
    v22 = 1;
    sub_1CF525790();
    v21 = 2;
    sub_1CF525790();
    v20 = 3;
    sub_1CF525790();
    v19 = 4;
    sub_1CF525790();
    v18 = 5;
    sub_1CF525790();
    v17 = 6;
    sub_1CF525790();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t RawAddress.hashValue.getter()
{
  sub_1CF5258B0();
  RawAddress.hash(into:)();
  return sub_1CF5258F8();
}

uint64_t RawAddress.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  _QWORD *v29;
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
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char v48;
  char v49;
  char v50;
  char v51;
  char v52;
  char v53;
  uint64_t v54;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB942C8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1CF4F5578();
  sub_1CF525910();
  if (!v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F29A0);
    v53 = 0;
    sub_1CF4F55BC(&qword_1EFB942D0, MEMORY[0x1E0DEA9A0], MEMORY[0x1E0DEAF40]);
    sub_1CF525760();
    v10 = v54;
    v52 = 1;
    swift_bridgeObjectRetain();
    v11 = sub_1CF525754();
    v46 = v10;
    v51 = 2;
    v13 = v12;
    swift_bridgeObjectRetain();
    v44 = sub_1CF525754();
    v45 = v13;
    v50 = 3;
    v15 = v14;
    swift_bridgeObjectRetain();
    v41 = sub_1CF525754();
    v42 = a2;
    v43 = v15;
    v49 = 4;
    v17 = v16;
    swift_bridgeObjectRetain();
    v18 = sub_1CF525754();
    v20 = v19;
    v38 = v18;
    v39 = v11;
    v40 = v17;
    v48 = 5;
    swift_bridgeObjectRetain();
    v21 = sub_1CF525754();
    v23 = v22;
    v47 = 6;
    swift_bridgeObjectRetain();
    v24 = sub_1CF525754();
    v26 = v25;
    v27 = *(void (**)(char *, uint64_t))(v6 + 8);
    v37 = v24;
    v27(v8, v5);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v28 = v45;
    v29 = v42;
    v30 = v43;
    v31 = v39;
    *v42 = v46;
    v29[1] = v31;
    v32 = v44;
    v29[2] = v28;
    v29[3] = v32;
    v33 = v41;
    v29[4] = v30;
    v29[5] = v33;
    v34 = v38;
    v29[6] = v40;
    v29[7] = v34;
    v29[8] = v20;
    v29[9] = v21;
    v35 = v37;
    v29[10] = v23;
    v29[11] = v35;
    v29[12] = v26;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CF4F434C()
{
  sub_1CF5258B0();
  RawAddress.hash(into:)();
  return sub_1CF5258F8();
}

uint64_t sub_1CF4F43B4()
{
  sub_1CF5258B0();
  RawAddress.hash(into:)();
  return sub_1CF5258F8();
}

uint64_t sub_1CF4F4418@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return RawAddress.init(from:)(a1, a2);
}

uint64_t sub_1CF4F442C(_QWORD *a1)
{
  return RawAddress.encode(to:)(a1);
}

uint64_t RawAddress.init(_:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t result;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD v74[5];
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  _QWORD v82[2];

  v4 = objc_msgSend(a1, sel_street);
  v5 = sub_1CF524E9C();
  v7 = v6;

  swift_bridgeObjectRelease();
  v8 = HIBYTE(v7) & 0xF;
  if ((v7 & 0x2000000000000000) == 0)
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  if (v8)
  {
    v9 = objc_msgSend(a1, sel_street);
    v10 = sub_1CF524E9C();
    v12 = v11;

    v82[0] = 10;
    v82[1] = 0xE100000000000000;
    MEMORY[0x1E0C80A78](v13);
    v74[2] = v82;
    swift_bridgeObjectRetain();
    v14 = sub_1CF4F4C48(0x7FFFFFFFFFFFFFFFLL, 1, sub_1CF4F561C, (uint64_t)v74, v10, v12);
    swift_bridgeObjectRelease();
    v15 = sub_1CF4F3358(v14);
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = 0;
  }
  v81 = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(a1, sel_city);
  v17 = sub_1CF524E9C();
  v19 = v18;

  swift_bridgeObjectRelease();
  v20 = HIBYTE(v19) & 0xF;
  if ((v19 & 0x2000000000000000) == 0)
    v20 = v17 & 0xFFFFFFFFFFFFLL;
  if (v20)
  {
    v21 = objc_msgSend(a1, sel_city);
    v80 = sub_1CF524E9C();
    v23 = v22;

  }
  else
  {
    v80 = 0;
    v23 = 0;
  }
  v79 = v23;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v24 = objc_msgSend(a1, sel_subLocality);
  v25 = sub_1CF524E9C();
  v27 = v26;

  swift_bridgeObjectRelease();
  v28 = HIBYTE(v27) & 0xF;
  if ((v27 & 0x2000000000000000) == 0)
    v28 = v25 & 0xFFFFFFFFFFFFLL;
  if (v28)
  {
    v29 = objc_msgSend(a1, sel_subLocality);
    v78 = sub_1CF524E9C();
    v31 = v30;

  }
  else
  {
    v78 = 0;
    v31 = 0;
  }
  v77 = v31;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v32 = objc_msgSend(a1, sel_state);
  v33 = sub_1CF524E9C();
  v35 = v34;

  swift_bridgeObjectRelease();
  v36 = HIBYTE(v35) & 0xF;
  if ((v35 & 0x2000000000000000) == 0)
    v36 = v33 & 0xFFFFFFFFFFFFLL;
  if (v36)
  {
    v37 = objc_msgSend(a1, sel_state);
    v76 = sub_1CF524E9C();
    v39 = v38;

  }
  else
  {
    v76 = 0;
    v39 = 0;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v40 = objc_msgSend(a1, sel_subAdministrativeArea);
  v41 = sub_1CF524E9C();
  v43 = v42;

  swift_bridgeObjectRelease();
  v44 = HIBYTE(v43) & 0xF;
  if ((v43 & 0x2000000000000000) == 0)
    v44 = v41 & 0xFFFFFFFFFFFFLL;
  if (v44)
  {
    v45 = objc_msgSend(a1, sel_subAdministrativeArea);
    v75 = sub_1CF524E9C();
    v47 = v46;

  }
  else
  {
    v75 = 0;
    v47 = 0;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v48 = objc_msgSend(a1, sel_postalCode);
  v49 = sub_1CF524E9C();
  v51 = v50;

  swift_bridgeObjectRelease();
  v52 = HIBYTE(v51) & 0xF;
  if ((v51 & 0x2000000000000000) == 0)
    v52 = v49 & 0xFFFFFFFFFFFFLL;
  if (v52)
  {
    v53 = objc_msgSend(a1, sel_postalCode);
    v54 = sub_1CF524E9C();
    v56 = v55;

  }
  else
  {
    v54 = 0;
    v56 = 0;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v57 = objc_msgSend(a1, sel_ISOCountryCode);
  v58 = sub_1CF524E9C();
  v60 = v59;

  swift_bridgeObjectRelease();
  v61 = HIBYTE(v60) & 0xF;
  if ((v60 & 0x2000000000000000) == 0)
    v61 = v58 & 0xFFFFFFFFFFFFLL;
  if (v61)
  {
    v62 = objc_msgSend(a1, sel_ISOCountryCode);
    v63 = sub_1CF524E9C();
    v65 = v64;

  }
  else
  {

    v63 = 0;
    v65 = 0;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v66 = v77;
  swift_bridgeObjectRelease();
  v67 = v79;
  swift_bridgeObjectRelease();
  v68 = v81;
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  v70 = v80;
  *a2 = v68;
  a2[1] = v70;
  v71 = v78;
  a2[2] = v67;
  a2[3] = v71;
  v72 = v76;
  a2[4] = v66;
  a2[5] = v72;
  v73 = v75;
  a2[6] = v39;
  a2[7] = v73;
  a2[8] = v47;
  a2[9] = v54;
  a2[10] = v56;
  a2[11] = v63;
  a2[12] = v65;
  return result;
}

void *CNMutablePostalAddress.init(rawAddress:)(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;

  v1 = *a1;
  v2 = a1[2];
  v3 = a1[4];
  v4 = a1[6];
  v5 = a1[8];
  v18 = a1[10];
  v19 = a1[12];
  v6 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
  v7 = v6;
  if (v1)
  {
    v8 = v6;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F29A0);
    sub_1CF3D7ADC();
    sub_1CF524E48();
    swift_bridgeObjectRelease();
    v9 = (void *)sub_1CF524E78();
    swift_bridgeObjectRelease();
    objc_msgSend(v8, sel_setStreet_, v9);

    if (!v2)
      goto LABEL_4;
    goto LABEL_3;
  }
  v16 = v6;
  if (v2)
  {
LABEL_3:
    swift_bridgeObjectRetain();
    v10 = (void *)sub_1CF524E78();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_setCity_, v10);

  }
LABEL_4:
  if (v3)
  {
    swift_bridgeObjectRetain();
    v11 = (void *)sub_1CF524E78();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_setSubLocality_, v11);

  }
  if (v4)
  {
    swift_bridgeObjectRetain();
    v12 = (void *)sub_1CF524E78();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_setState_, v12);

  }
  if (v5)
  {
    swift_bridgeObjectRetain();
    v13 = (void *)sub_1CF524E78();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_setSubAdministrativeArea_, v13);

  }
  if (v18)
  {
    swift_bridgeObjectRetain();
    v14 = (void *)sub_1CF524E78();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_setPostalCode_, v14);

  }
  swift_bridgeObjectRelease();
  if (v19)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v15 = (void *)sub_1CF524E78();
    swift_bridgeObjectRelease();
    objc_msgSend(v7, sel_setISOCountryCode_, v15);

  }
  else
  {

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_1CF4F4C48(uint64_t a1, char a2, uint64_t (*a3)(_QWORD *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
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
  _QWORD *v40;
  uint64_t result;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  unint64_t v48;
  _QWORD v50[4];

  v50[3] = a4;
  if (a1 < 0)
    goto LABEL_42;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = MEMORY[0x1E0DEE9D8];
  v47 = swift_allocObject();
  *(_QWORD *)(v47 + 16) = 15;
  v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (v12 = HIBYTE(a6) & 0xF) : (v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0)
      v11 = a5 & 0xFFFFFFFFFFFFLL;
    v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0)
      v30 = 11;
    sub_1CF4F50E4(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    v13 = *(_QWORD **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  v42 = a1;
  v43 = v10;
  v48 = 4 * v12;
  v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v14 = 15;
  v15 = 15;
  v16 = 15;
  while (1)
  {
    v50[0] = sub_1CF524F5C();
    v50[1] = v17;
    v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    v19 = v18;
    swift_bridgeObjectRelease();
    if ((v19 & 1) != 0)
      break;
    v14 = sub_1CF524F14();
LABEL_9:
    if (v48 == v14 >> 14)
      goto LABEL_29;
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    v14 = sub_1CF524F14();
    *(_QWORD *)(v47 + 16) = v14;
    v15 = v14;
    v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14)
    goto LABEL_41;
  v20 = sub_1CF524F68();
  v44 = v21;
  v45 = v20;
  v23 = v22;
  v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v13 = sub_1CF412A34(0, v13[2] + 1, 1, v13);
  v27 = v13[2];
  v26 = v13[3];
  if (v27 >= v26 >> 1)
    v13 = sub_1CF412A34((_QWORD *)(v26 > 1), v27 + 1, 1, v13);
  v13[2] = v27 + 1;
  v28 = &v13[4 * v27];
  v28[4] = v45;
  v28[5] = v23;
  v28[6] = v25;
  v28[7] = v44;
  *(_QWORD *)(v43 + 16) = v13;
  v29 = sub_1CF524F14();
  v14 = v29;
  *(_QWORD *)(v47 + 16) = v29;
  if (v13[2] != v42)
  {
    v15 = v29;
    v16 = v29;
    goto LABEL_9;
  }
  v16 = v29;
  v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }
  if (v48 >= v16 >> 14)
  {
    v31 = sub_1CF524F68();
    v33 = v32;
    v35 = v34;
    v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v13 = sub_1CF412A34(0, v13[2] + 1, 1, v13);
    v39 = v13[2];
    v38 = v13[3];
    if (v39 >= v38 >> 1)
      v13 = sub_1CF412A34((_QWORD *)(v38 > 1), v39 + 1, 1, v13);
    v13[2] = v39 + 1;
    v40 = &v13[4 * v39];
    v40[4] = v31;
    v40[5] = v33;
    v40[6] = v35;
    v40[7] = v37;
    *(_QWORD *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  sub_1CF5256DC();
  __break(1u);
LABEL_42:
  result = sub_1CF5256DC();
  __break(1u);
  return result;
}

uint64_t sub_1CF4F50E4(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t result;

  v4 = *(_QWORD *)(a2 + 16) >> 14;
  v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1)
    return v5 ^ 1u;
  if (a1 >> 14 >= v4)
  {
    v7 = sub_1CF524F68();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = *(_QWORD **)(a4 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v14 = sub_1CF412A34(0, v14[2] + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v17 = v14[2];
    v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      v14 = sub_1CF412A34((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  result = sub_1CF5256DC();
  __break(1u);
  return result;
}

uint64_t sub_1CF4F523C(_QWORD *a1, _QWORD *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1])
    return 1;
  else
    return sub_1CF525814() & 1;
}

BOOL _s13FinanceDaemon10RawAddressV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
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
  char v37;
  char v38;
  char v39;
  _BOOL8 result;
  uint64_t v41;
  char v42;
  char v43;
  uint64_t v44;
  char v45;
  char v46;
  uint64_t v47;
  char v48;
  char v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;

  v4 = *(_QWORD **)a1;
  v6 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a1 + 24);
  v7 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 72);
  v14 = *(_QWORD *)(a1 + 80);
  v71 = *(_QWORD *)(a1 + 88);
  v72 = *(_QWORD *)(a1 + 96);
  v15 = *(_QWORD **)a2;
  v17 = *(_QWORD *)(a2 + 8);
  v16 = *(_QWORD *)(a2 + 16);
  v19 = *(_QWORD *)(a2 + 24);
  v18 = *(_QWORD *)(a2 + 32);
  v20 = *(_QWORD *)(a2 + 40);
  v21 = *(_QWORD *)(a2 + 48);
  v22 = *(_QWORD *)(a2 + 56);
  v23 = *(_QWORD *)(a2 + 64);
  v25 = *(_QWORD *)(a2 + 72);
  v24 = *(_QWORD *)(a2 + 80);
  v27 = *(_QWORD *)(a2 + 88);
  v26 = *(_QWORD *)(a2 + 96);
  v70 = v27;
  if (v4)
  {
    if (!v15)
      return 0;
    v51 = v26;
    v52 = v16;
    v62 = v22;
    v64 = v10;
    v58 = v11;
    v60 = v23;
    v55 = v25;
    v56 = v12;
    v53 = v14;
    v54 = v24;
    v28 = v13;
    v67 = v21;
    v29 = v20;
    v30 = v7;
    v31 = v8;
    v32 = v18;
    v33 = v19;
    v34 = v5;
    v35 = v6;
    v36 = v17;
    v37 = sub_1CF3E1E38(v4, v15);
    v17 = v36;
    v6 = v35;
    v5 = v34;
    v19 = v33;
    v18 = v32;
    v8 = v31;
    v7 = v30;
    v20 = v29;
    v10 = v64;
    v21 = v67;
    v13 = v28;
    v16 = v52;
    v14 = v53;
    v24 = v54;
    v25 = v55;
    v12 = v56;
    v11 = v58;
    v23 = v60;
    v22 = v62;
    if ((v37 & 1) == 0)
      return 0;
  }
  else
  {
    v51 = v26;
    if (v15)
      return 0;
  }
  if (!v5)
  {
    if (v16)
      return 0;
LABEL_13:
    if (v7)
    {
      if (!v18)
        return 0;
      if (v8 != v19 || v7 != v18)
      {
        v66 = v20;
        v69 = v21;
        v41 = v13;
        v42 = sub_1CF525814();
        v20 = v66;
        v21 = v69;
        v13 = v41;
        v43 = v42;
        result = 0;
        if ((v43 & 1) == 0)
          return result;
      }
    }
    else if (v18)
    {
      return 0;
    }
    if (v9)
    {
      if (!v21)
        return 0;
      if (v10 != v20 || v9 != v21)
      {
        v44 = v13;
        v45 = sub_1CF525814();
        v13 = v44;
        v46 = v45;
        result = 0;
        if ((v46 & 1) == 0)
          return result;
      }
    }
    else if (v21)
    {
      return 0;
    }
    if (v11)
    {
      if (!v23)
        return 0;
      if (v12 != v22 || v11 != v23)
      {
        v47 = v13;
        v48 = sub_1CF525814();
        v13 = v47;
        v49 = v48;
        result = 0;
        if ((v49 & 1) == 0)
          return result;
      }
    }
    else if (v23)
    {
      return 0;
    }
    if (v14)
    {
      if (!v24)
        return 0;
      if (v13 != v25 || v14 != v24)
      {
        v50 = sub_1CF525814();
        result = 0;
        if ((v50 & 1) == 0)
          return result;
      }
    }
    else if (v24)
    {
      return 0;
    }
    if (v72)
      return v51 && (v71 == v70 && v72 == v51 || (sub_1CF525814() & 1) != 0);
    return !v51;
  }
  if (!v16)
    return 0;
  if (v6 == v17 && v5 == v16)
    goto LABEL_13;
  v65 = v20;
  v68 = v21;
  v61 = v13;
  v63 = v7;
  v57 = v19;
  v59 = v18;
  v38 = sub_1CF525814();
  v19 = v57;
  v18 = v59;
  v7 = v63;
  v20 = v65;
  v21 = v68;
  v13 = v61;
  v39 = v38;
  result = 0;
  if ((v39 & 1) != 0)
    goto LABEL_13;
  return result;
}

unint64_t sub_1CF4F5578()
{
  unint64_t result;

  result = qword_1EFB942B8;
  if (!qword_1EFB942B8)
  {
    result = MEMORY[0x1D17D0F7C](&unk_1CF52BDB0, &type metadata for RawAddress.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFB942B8);
  }
  return result;
}

uint64_t sub_1CF4F55BC(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ED8F29A0);
    v8 = a2;
    result = MEMORY[0x1D17D0F7C](a3, v7, &v8);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1CF4F561C(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1])
    return 1;
  else
    return sub_1CF525814() & 1;
}

unint64_t sub_1CF4F5674()
{
  unint64_t result;

  result = qword_1EFB942D8;
  if (!qword_1EFB942D8)
  {
    result = MEMORY[0x1D17D0F7C](&protocol conformance descriptor for RawAddress, &type metadata for RawAddress);
    atomic_store(result, (unint64_t *)&qword_1EFB942D8);
  }
  return result;
}

uint64_t destroy for RawAddress()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for RawAddress(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  v7 = a2[9];
  a1[8] = a2[8];
  a1[9] = v7;
  v8 = a2[11];
  a1[10] = a2[10];
  a1[11] = v8;
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for RawAddress(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[11] = a2[11];
  a1[12] = a2[12];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy104_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[5];
  *(_QWORD *)(a1 + 96) = *((_QWORD *)a2 + 12);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

_QWORD *assignWithTake for RawAddress(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v4 = a2[2];
  a1[1] = a2[1];
  a1[2] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[4];
  a1[3] = a2[3];
  a1[4] = v5;
  swift_bridgeObjectRelease();
  v6 = a2[6];
  a1[5] = a2[5];
  a1[6] = v6;
  swift_bridgeObjectRelease();
  v7 = a2[8];
  a1[7] = a2[7];
  a1[8] = v7;
  swift_bridgeObjectRelease();
  v8 = a2[10];
  a1[9] = a2[9];
  a1[10] = v8;
  swift_bridgeObjectRelease();
  v9 = a2[12];
  a1[11] = a2[11];
  a1[12] = v9;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RawAddress(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 104))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for RawAddress(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 104) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 104) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for RawAddress()
{
  return &type metadata for RawAddress;
}

uint64_t getEnumTagSinglePayload for RawAddress.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for RawAddress.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_1CF4F5B24 + 4 * byte_1CF52BC00[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_1CF4F5B58 + 4 * byte_1CF52BBFB[v4]))();
}

uint64_t sub_1CF4F5B58(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CF4F5B60(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CF4F5B68);
  return result;
}

uint64_t sub_1CF4F5B74(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CF4F5B7CLL);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_1CF4F5B80(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CF4F5B88(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RawAddress.CodingKeys()
{
  return &type metadata for RawAddress.CodingKeys;
}

unint64_t sub_1CF4F5BA8()
{
  unint64_t result;

  result = qword_1EFB942E0;
  if (!qword_1EFB942E0)
  {
    result = MEMORY[0x1D17D0F7C](&unk_1CF52BD88, &type metadata for RawAddress.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFB942E0);
  }
  return result;
}

unint64_t sub_1CF4F5BF0()
{
  unint64_t result;

  result = qword_1EFB942E8;
  if (!qword_1EFB942E8)
  {
    result = MEMORY[0x1D17D0F7C](&unk_1CF52BCF8, &type metadata for RawAddress.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFB942E8);
  }
  return result;
}

unint64_t sub_1CF4F5C38()
{
  unint64_t result;

  result = qword_1EFB942F0;
  if (!qword_1EFB942F0)
  {
    result = MEMORY[0x1D17D0F7C](&unk_1CF52BD20, &type metadata for RawAddress.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EFB942F0);
  }
  return result;
}

uint64_t sub_1CF4F5C7C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x4C73736572646461 && a2 == 0xEC00000073656E69;
  if (v2 || (sub_1CF525814() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7974696C61636F6CLL && a2 == 0xE800000000000000 || (sub_1CF525814() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6C61636F4C627573 && a2 == 0xEB00000000797469 || (sub_1CF525814() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x80000001CF531A20 || (sub_1CF525814() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0xD000000000000015 && a2 == 0x80000001CF531A40 || (sub_1CF525814() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x6F436C6174736F70 && a2 == 0xEA00000000006564 || (sub_1CF525814() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x437972746E756F63 && a2 == 0xEB0000000065646FLL)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else
  {
    v6 = sub_1CF525814();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 6;
    else
      return 7;
  }
}

uint64_t sub_1CF4F5FA8()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1CF4F5FCC()
{
  return swift_deallocObject();
}

uint64_t sub_1CF4F5FDC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
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
  BOOL v13;
  uint64_t v14;
  uint64_t v16;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1CF524A70();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for BankConnectNotificationEventsRegisterTask();
  sub_1CF3CB844(v1 + *(int *)(v10 + 32), (uint64_t)v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_1CF3D52A0((uint64_t)v5);
    v11 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v9, v5, v6);
    v12 = *(_QWORD *)(v1 + *(int *)(v10 + 28));
    v13 = v12 < 1;
    v14 = v12 - 1;
    if (!v13)
      exp2((double)v14);
    sub_1CF524A04();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v11 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a1, v11, 1, v6);
}

unint64_t sub_1CF4F6154()
{
  sub_1CF525598();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_1CF524F38();
  swift_bridgeObjectRelease();
  sub_1CF524F38();
  return 0xD000000000000035;
}

uint64_t sub_1CF4F61F0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[7] = a1;
  v2[8] = v1;
  v3 = *(_QWORD *)(type metadata accessor for BankConnectNotificationEventsRegisterTask() - 8);
  v2[9] = v3;
  v2[10] = *(_QWORD *)(v3 + 64);
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CF4F6260()
{
  uint64_t v0;
  _QWORD *v1;

  __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 56), *(_QWORD *)(*(_QWORD *)(v0 + 56) + 24));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v1;
  sub_1CF3D06CC();
  *v1 = v0;
  v1[1] = sub_1CF4F62E0;
  return sub_1CF523F24();
}

uint64_t sub_1CF4F62E0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CF4F633C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(void);

  v2 = *(_QWORD *)(v0 + 88);
  v1 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 72);
  v4 = *(_QWORD *)(v0 + 56);
  sub_1CF3CB780(*(_QWORD *)(v0 + 64), v1, (uint64_t (*)(_QWORD))type metadata accessor for BankConnectNotificationEventsRegisterTask);
  sub_1CF3D3ECC(v4, v0 + 16);
  sub_1CF4F74B8(v1, v2);
  v5 = (*(unsigned __int8 *)(v3 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v6 = swift_allocObject();
  *(_QWORD *)(v0 + 120) = v6;
  sub_1CF3EDB64((__int128 *)(v0 + 16), v6 + 16);
  sub_1CF4F74B8(v2, v6 + v5);
  v9 = (uint64_t (*)(void))((int)*MEMORY[0x1E0CAC158] + MEMORY[0x1E0CAC158]);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v7;
  *v7 = v0;
  v7[1] = sub_1CF4F643C;
  return v9();
}

uint64_t sub_1CF4F643C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_1CF4F64A8()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CF4F64F0()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CF4F6548(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[7] = a2;
  v3[8] = a3;
  v4 = sub_1CF522994();
  v3[9] = v4;
  v3[10] = *(_QWORD *)(v4 - 8);
  v3[11] = swift_task_alloc();
  v5 = sub_1CF524620();
  v3[12] = v5;
  v3[13] = *(_QWORD *)(v5 - 8);
  v3[14] = swift_task_alloc();
  v6 = sub_1CF522730();
  v3[15] = v6;
  v3[16] = *(_QWORD *)(v6 - 8);
  v3[17] = swift_task_alloc();
  v3[18] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CF4F6608()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;

  v1 = (_QWORD *)v0[7];
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_1CF523EF4();
  __swift_project_boxed_opaque_existential_1(v0 + 2, v0[5]);
  sub_1CF5235C4();
  v2 = v0[17];
  v3 = v0[18];
  v4 = v0[15];
  v5 = v0[16];
  v12 = v0[14];
  v6 = (_QWORD *)v0[7];
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 2));
  v7 = __swift_project_boxed_opaque_existential_1(v6, v1[3]);
  __swift_project_boxed_opaque_existential_1(v7 + 1, v7[4]);
  v8 = sub_1CF5242B4();
  v0[19] = v8;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v2, v3, v4);
  type metadata accessor for BankConnectNotificationEventsRegisterTask();
  sub_1CF52405C();
  swift_bridgeObjectRetain();
  sub_1CF524614();
  v9 = swift_task_alloc();
  v0[20] = v9;
  *(_QWORD *)(v9 + 16) = v8;
  *(_QWORD *)(v9 + 24) = v12;
  v10 = (_QWORD *)swift_task_alloc();
  v0[21] = v10;
  *v10 = v0;
  v10[1] = sub_1CF4F6800;
  return sub_1CF523924();
}

uint64_t sub_1CF4F6800()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 176) = v0;
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CF4F686C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v1 = *(_QWORD *)(v0 + 176);
  v2 = *(_QWORD *)(v0 + 88);
  v3 = *(_QWORD *)(v0 + 64);
  __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 56), *(_QWORD *)(*(_QWORD *)(v0 + 56) + 24));
  swift_retain();
  v4 = (void *)sub_1CF52210C();
  swift_release();
  v5 = (_QWORD *)swift_task_alloc();
  v5[2] = v3;
  v5[3] = v4;
  v5[4] = v2;
  sub_1CF525358();
  v6 = *(_QWORD *)(v0 + 144);
  v7 = *(_QWORD *)(v0 + 128);
  if (v1)
  {
    v16 = *(_QWORD *)(v0 + 120);
    v18 = *(_QWORD *)(v0 + 104);
    v8 = *(_QWORD *)(v0 + 88);
    v20 = *(_QWORD *)(v0 + 96);
    v22 = *(_QWORD *)(v0 + 112);
    v10 = *(_QWORD *)(v0 + 72);
    v9 = *(_QWORD *)(v0 + 80);

    swift_release();
    swift_task_dealloc();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v16);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v22, v20);
  }
  else
  {
    v11 = *(_QWORD *)(v0 + 112);
    v17 = *(_QWORD *)(v0 + 120);
    v19 = *(_QWORD *)(v0 + 104);
    v12 = *(_QWORD *)(v0 + 88);
    v21 = *(_QWORD *)(v0 + 96);
    v13 = *(_QWORD *)(v0 + 72);
    v14 = *(_QWORD *)(v0 + 80);

    swift_release();
    swift_task_dealloc();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v12, v13);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v17);
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v11, v21);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CF4F6A38()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = *(_QWORD *)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 128);
  v5 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 112);
  v6 = *(_QWORD *)(v0 + 96);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CF4F6AD0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1CF3CE884;
  return sub_1CF523930();
}

void sub_1CF4F6B3C(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  id v17[2];

  v17[1] = *(id *)MEMORY[0x1E0C80C00];
  v4 = sub_1CF524098();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1CF524AB8();
  MEMORY[0x1E0C80A78](v7);
  sub_1CF5243EC();
  v8 = sub_1CF524398();
  if (!v2)
  {
    v16[1] = v6;
    if (v8)
    {
      v9 = (void *)v8;
    }
    else
    {
      sub_1CF524AAC();
      v13 = a2;
      v9 = (void *)sub_1CF5243E0();
      sub_1CF522298();
      v14 = (void *)sub_1CF5221E4();
      v15 = v14;
      if (v14)
      {
        objc_msgSend(v14, sel_setNotificationSubscriptionObject_, v9);

      }
    }
    sub_1CF522988();
    v10 = (void *)sub_1CF524E78();
    swift_bridgeObjectRelease();
    objc_msgSend(v9, sel_setSubscriptionID_, v10);

    type metadata accessor for BankConnectNotificationEventsRegisterTask();
    sub_1CF52405C();
    sub_1CF524068();
    sub_1CF5243C8();
    objc_msgSend(v9, sel_setRegisterRequestAttemptCount_, 0);
    objc_msgSend(v9, sel_setLastRegisterRequestAttemptDate_, 0);
    v17[0] = 0;
    if ((objc_msgSend(a2, sel_save_, v17) & 1) != 0)
    {
      v11 = v17[0];
    }
    else
    {
      v12 = v17[0];
      sub_1CF5248C0();

      swift_willThrow();
    }

  }
}

uint64_t sub_1CF4F6DAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[5] = a2;
  v3[6] = v2;
  v3[4] = a1;
  v3[7] = sub_1CF521D64();
  v3[8] = swift_task_alloc();
  type metadata accessor for BankConnectNotificationEventsRegisterTask();
  v3[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CF4F6E2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t (*v14)(void);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;

  if (qword_1ED8F3648 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 72);
  v4 = *(_QWORD *)(v0 + 48);
  v5 = sub_1CF524C5C();
  __swift_project_value_buffer(v5, (uint64_t)qword_1ED8F2918);
  sub_1CF3CB780(v4, v2, (uint64_t (*)(_QWORD))type metadata accessor for BankConnectNotificationEventsRegisterTask);
  sub_1CF3CB780(v1, v3, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAAFA8]);
  v6 = sub_1CF524C44();
  v7 = sub_1CF525208();
  v8 = os_log_type_enabled(v6, v7);
  v9 = *(_QWORD *)(v0 + 64);
  v10 = *(uint64_t **)(v0 + 72);
  if (v8)
  {
    v11 = swift_slowAlloc();
    v21 = (_QWORD *)swift_slowAlloc();
    v22 = swift_slowAlloc();
    v23 = v22;
    *(_DWORD *)v11 = 136315394;
    v12 = *v10;
    v13 = v10[1];
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 16) = sub_1CF3F9B9C(v12, v13, &v23);
    sub_1CF525418();
    swift_bridgeObjectRelease();
    sub_1CF3C7E20((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for BankConnectNotificationEventsRegisterTask);
    *(_WORD *)(v11 + 12) = 2112;
    v14 = MEMORY[0x1E0CAAFA8];
    sub_1CF3C6DA0(&qword_1EFB8F9C0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAAFA8], MEMORY[0x1E0CAAFB0]);
    swift_allocError();
    sub_1CF3CB780(v9, v15, (uint64_t (*)(_QWORD))v14);
    v16 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 24) = v16;
    sub_1CF525418();
    *v21 = v16;
    sub_1CF3C7E20(v9, (uint64_t (*)(_QWORD))v14);
    _os_log_impl(&dword_1CF3C3000, v6, v7, "Failed to register to notification events with consentID %s %@", (uint8_t *)v11, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFB94080);
    swift_arrayDestroy();
    MEMORY[0x1D17D1060](v21, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1D17D1060](v22, -1, -1);
    MEMORY[0x1D17D1060](v11, -1, -1);
  }
  else
  {
    sub_1CF3C7E20(*(_QWORD *)(v0 + 72), (uint64_t (*)(_QWORD))type metadata accessor for BankConnectNotificationEventsRegisterTask);
    sub_1CF3C7E20(v9, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAAFA8]);
  }

  if ((sub_1CF52513C() & 1) == 0)
  {
    v17 = *(_QWORD *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 40), *(_QWORD *)(*(_QWORD *)(v0 + 40) + 24));
    swift_retain();
    v18 = (void *)sub_1CF52210C();
    swift_release();
    v19 = swift_task_alloc();
    *(_QWORD *)(v19 + 16) = v17;
    *(_QWORD *)(v19 + 24) = v18;
    sub_1CF525358();

    swift_task_dealloc();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1CF4F71A8(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14[2];

  v14[1] = *(id *)MEMORY[0x1E0C80C00];
  v4 = sub_1CF524AB8();
  MEMORY[0x1E0C80A78](v4);
  sub_1CF5243EC();
  v5 = sub_1CF524398();
  if (!v2)
  {
    v6 = (void *)v5;
    if (!v5)
    {
      sub_1CF524AAC();
      v11 = a2;
      v6 = (void *)sub_1CF5243E0();
      sub_1CF522298();
      v12 = (void *)sub_1CF5221E4();
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, sel_setNotificationSubscriptionObject_, v6);

      }
    }
    v7 = (char *)objc_msgSend(v6, sel_registerRequestAttemptCount);
    if (__OFADD__(v7, 1))
      __break(1u);
    objc_msgSend(v6, sel_setRegisterRequestAttemptCount_, v7 + 1);
    type metadata accessor for BankConnectNotificationEventsRegisterTask();
    v8 = (void *)sub_1CF524A10();
    objc_msgSend(v6, sel_setLastRegisterRequestAttemptDate_, v8);

    v14[0] = 0;
    if ((objc_msgSend(a2, sel_save_, v14) & 1) != 0)
    {
      v9 = v14[0];
    }
    else
    {
      v10 = v14[0];
      sub_1CF5248C0();

      swift_willThrow();
    }

  }
}

uint64_t sub_1CF4F73A4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1;
  v4 = v1[1];
  *a1 = v3;
  a1[1] = v4;
  type metadata accessor for BankConnectWebServiceTaskIdentifier(0);
  swift_storeEnumTagMultiPayload();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1CF4F73EC(uint64_t a1)
{
  uint64_t result;

  result = sub_1CF3C6DA0(&qword_1EFB94350, (uint64_t (*)(uint64_t))type metadata accessor for BankConnectNotificationEventsRegisterTask, (uint64_t)&unk_1CF52BE00);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t type metadata accessor for BankConnectNotificationEventsRegisterTask()
{
  uint64_t result;

  result = qword_1ED8F4888;
  if (!qword_1ED8F4888)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1CF4F7464(uint64_t a1)
{
  uint64_t result;

  result = sub_1CF3C6DA0(&qword_1EFB94358, (uint64_t (*)(uint64_t))type metadata accessor for BankConnectNotificationEventsRegisterTask, (uint64_t)&unk_1CF52BE44);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

void sub_1CF4F74A0()
{
  uint64_t v0;

  sub_1CF4F71A8(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_1CF4F74B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for BankConnectNotificationEventsRegisterTask();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1CF4F74FC()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void (*v10)(uint64_t, uint64_t);

  v1 = (int *)type metadata accessor for BankConnectNotificationEventsRegisterTask();
  v2 = *(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  v3 = v0 + ((v2 + 56) & ~v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = v3 + v1[6];
  v5 = sub_1CF524098();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = v3 + v1[8];
  v7 = sub_1CF524A70();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  v10 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  if (!v9)
    v10(v6, v7);
  v10(v3 + v1[9], v7);
  return swift_deallocObject();
}

uint64_t sub_1CF4F75F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for BankConnectNotificationEventsRegisterTask() - 8)
                          + 80);
  v5 = v1 + 16;
  v6 = v1 + ((v4 + 56) & ~v4);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1CF3D1338;
  return sub_1CF4F6548(a1, v5, v6);
}

uint64_t sub_1CF4F7678()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1CF3CE884;
  v2 = (_QWORD *)swift_task_alloc();
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_1CF3CE884;
  return sub_1CF523930();
}

void sub_1CF4F76FC()
{
  uint64_t v0;

  sub_1CF4F6B3C(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

char *sub_1CF4F7718(char *a1, char *a2, int *a3)
{
  char *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, char *, uint64_t);

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *(_QWORD *)a2;
    *(_QWORD *)v4 = *(_QWORD *)a2;
    v4 = (char *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = *((_QWORD *)a2 + 1);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *((_QWORD *)a1 + 1) = v7;
    v8 = *((_QWORD *)a2 + 3);
    *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
    *((_QWORD *)a1 + 3) = v8;
    v9 = a3[6];
    v10 = &a1[v9];
    v11 = &a2[v9];
    v12 = sub_1CF524098();
    v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v13(v10, v11, v12);
    v14 = a3[8];
    *(_QWORD *)&v4[a3[7]] = *(_QWORD *)&a2[a3[7]];
    v15 = &v4[v14];
    v16 = &a2[v14];
    v17 = sub_1CF524A70();
    v18 = *(_QWORD *)(v17 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
    {
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(&v4[a3[9]], &a2[a3[9]], v17);
    }
    else
    {
      v21 = *(void (**)(char *, char *, uint64_t))(v18 + 16);
      v21(v15, v16, v17);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
      v21(&v4[a3[9]], &a2[a3[9]], v17);
    }
  }
  return v4;
}

uint64_t sub_1CF4F7880(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v12)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + a2[6];
  v5 = sub_1CF524098();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + a2[8];
  v7 = sub_1CF524A70();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  v10 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  if (!v9)
  {
    v12 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    v10(v6, v7);
    v10 = v12;
  }
  return ((uint64_t (*)(uint64_t, uint64_t))v10)(a1 + a2[9], v7);
}

char *sub_1CF4F7940(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);

  v6 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  v7 = *((_QWORD *)a2 + 3);
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = v7;
  v8 = a3[6];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_1CF524098();
  v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v12(v9, v10, v11);
  v13 = a3[8];
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  v14 = &a1[v13];
  v15 = &a2[v13];
  v16 = sub_1CF524A70();
  v17 = *(_QWORD *)(v16 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    (*(void (**)(char *, char *, uint64_t))(v17 + 16))(&a1[a3[9]], &a2[a3[9]], v16);
  }
  else
  {
    v19 = *(void (**)(char *, char *, uint64_t))(v17 + 16);
    v19(v14, v15, v16);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
    v19(&a1[a3[9]], &a2[a3[9]], v16);
  }
  return a1;
}

char *sub_1CF4F7A7C(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(char *, uint64_t, uint64_t);
  int v16;
  int v17;
  uint64_t v18;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = *((_QWORD *)a2 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = *((_QWORD *)a2 + 3);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[6];
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_1CF524098();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  v10 = a3[8];
  v11 = &a1[v10];
  v12 = &a2[v10];
  v13 = sub_1CF524A70();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48);
  v16 = v15(v11, 1, v13);
  v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(char *, char *, uint64_t))(v14 + 24))(v11, v12, v13);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v11, v12, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
LABEL_7:
  (*(void (**)(char *, char *, uint64_t))(v14 + 24))(&a1[a3[9]], &a2[a3[9]], v13);
  return a1;
}

char *sub_1CF4F7C1C(char *a1, char *a2, int *a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);

  v6 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v6;
  v7 = a3[6];
  v8 = &a1[v7];
  v9 = &a2[v7];
  v10 = sub_1CF524098();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[8];
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  v12 = &a1[v11];
  v13 = &a2[v11];
  v14 = sub_1CF524A70();
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(&a1[a3[9]], &a2[a3[9]], v14);
  }
  else
  {
    v17 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
    v17(v12, v13, v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    v17(&a1[a3[9]], &a2[a3[9]], v14);
  }
  return a1;
}

char *sub_1CF4F7D34(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;

  v6 = *((_QWORD *)a2 + 1);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *((_QWORD *)a1 + 1) = v6;
  swift_bridgeObjectRelease();
  v7 = *((_QWORD *)a2 + 3);
  *((_QWORD *)a1 + 2) = *((_QWORD *)a2 + 2);
  *((_QWORD *)a1 + 3) = v7;
  swift_bridgeObjectRelease();
  v8 = a3[6];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = sub_1CF524098();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  v12 = a3[8];
  *(_QWORD *)&a1[a3[7]] = *(_QWORD *)&a2[a3[7]];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_1CF524A70();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 40))(v13, v14, v15);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v13, v14, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
LABEL_7:
  (*(void (**)(char *, char *, uint64_t))(v16 + 40))(&a1[a3[9]], &a2[a3[9]], v15);
  return a1;
}

uint64_t sub_1CF4F7EB0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF4F7EBC(uint64_t a1, uint64_t a2, int *a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_1CF524098();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = a3[6];
    }
    else
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
      {
        v10 = v12;
        v11 = a3[8];
      }
      else
      {
        v10 = sub_1CF524A70();
        v9 = *(_QWORD *)(v10 - 8);
        v11 = a3[9];
      }
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t sub_1CF4F7F84()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF4F7F90(uint64_t result, uint64_t a2, int a3, int *a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v8 = sub_1CF524098();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = a4[6];
    }
    else
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
      v9 = *(_QWORD *)(v12 - 8);
      if (*(_DWORD *)(v9 + 84) == a3)
      {
        v10 = v12;
        v11 = a4[8];
      }
      else
      {
        v10 = sub_1CF524A70();
        v9 = *(_QWORD *)(v10 - 8);
        v11 = a4[9];
      }
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_1CF4F8054()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_1CF524098();
  if (v0 <= 0x3F)
  {
    sub_1CF3D5B68();
    if (v1 <= 0x3F)
    {
      sub_1CF524A70();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

uint64_t sub_1CF4F8114(uint64_t a1)
{
  uint64_t result;

  result = sub_1CF3C6DA0(&qword_1EFB90B20, (uint64_t (*)(uint64_t))type metadata accessor for BankConnectNotificationEventsRegisterTask, (uint64_t)&unk_1CF52BE28);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1CF4F8150(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_1CF3C6DA0(&qword_1EFB94390, (uint64_t (*)(uint64_t))type metadata accessor for BankConnectNotificationEventsRegisterTask, (uint64_t)&unk_1CF52BE60);
  result = sub_1CF3C6DA0(&qword_1EFB94398, (uint64_t (*)(uint64_t))type metadata accessor for BankConnectNotificationEventsRegisterTask, (uint64_t)&unk_1CF52BEE0);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1CF4F81B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v12;

  v9[11] = v12;
  v9[12] = v8;
  v9[9] = a7;
  v9[10] = a8;
  v9[7] = a5;
  v9[8] = a6;
  v9[5] = a3;
  v9[6] = a4;
  v9[3] = a1;
  v9[4] = a2;
  v10 = sub_1CF522A00();
  v9[13] = v10;
  v9[14] = *(_QWORD *)(v10 - 8);
  v9[15] = swift_task_alloc();
  v9[16] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CF4F8234()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;

  sub_1CF4F8890();
  v1 = *(_QWORD *)(v0 + 120);
  v18 = *(_QWORD *)(v0 + 112);
  v19 = *(_QWORD *)(v0 + 104);
  v2 = *(_QWORD **)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 48);
  v17 = *(_QWORD *)(v0 + 56);
  v5 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v6 = *(_QWORD *)(v0 + 24);
  v8 = v2[23];
  v7 = v2[24];
  __swift_project_boxed_opaque_existential_1(v2 + 20, v8);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 8))(v5, v4, v3, v17, v6, v8, v7);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v18 + 104))(v1, *MEMORY[0x1E0CABF00], v19);
  v9 = sub_1CF5229F4();
  v10 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
  v10(v1, v19);
  if ((v9 & 1) != 0)
  {
    v12 = *(_QWORD *)(v0 + 64);
    v11 = *(_QWORD *)(v0 + 72);
    v20 = *(_OWORD *)(v0 + 80);
    v13 = (void *)sub_1CF52210C();
    v14 = swift_task_alloc();
    *(_QWORD *)(v14 + 16) = v13;
    *(_QWORD *)(v14 + 24) = v11;
    *(_OWORD *)(v14 + 32) = v20;
    *(_QWORD *)(v14 + 48) = v12;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94188);
    sub_1CF525364();

    swift_task_dealloc();
    v15 = *(_QWORD *)(v0 + 16);
  }
  else
  {
    v15 = MEMORY[0x1E0DEE9D8];
  }
  v10(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 104));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v15);
}

uint64_t sub_1CF4F8438(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  uint64_t v15;

  *(_QWORD *)(v9 + 96) = v15;
  *(_QWORD *)(v9 + 104) = v8;
  *(_OWORD *)(v9 + 80) = v14;
  *(_QWORD *)(v9 + 64) = a7;
  *(_QWORD *)(v9 + 72) = a8;
  *(_QWORD *)(v9 + 48) = a5;
  *(_QWORD *)(v9 + 56) = a6;
  *(_QWORD *)(v9 + 32) = a3;
  *(_QWORD *)(v9 + 40) = a4;
  *(_QWORD *)(v9 + 16) = a1;
  *(_QWORD *)(v9 + 24) = a2;
  v10 = sub_1CF522478();
  *(_QWORD *)(v9 + 112) = v10;
  *(_QWORD *)(v9 + 120) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v9 + 128) = swift_task_alloc();
  v11 = sub_1CF5233CC();
  *(_QWORD *)(v9 + 136) = v11;
  *(_QWORD *)(v9 + 144) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v9 + 152) = swift_task_alloc();
  v12 = sub_1CF522A00();
  *(_QWORD *)(v9 + 160) = v12;
  *(_QWORD *)(v9 + 168) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v9 + 176) = swift_task_alloc();
  *(_QWORD *)(v9 + 184) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CF4F8514()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  sub_1CF4F8890();
  v1 = *(_QWORD *)(v0 + 176);
  v34 = *(_QWORD *)(v0 + 168);
  v35 = *(_QWORD *)(v0 + 160);
  v2 = *(_QWORD **)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  v6 = *(_QWORD *)(v0 + 32);
  v5 = *(_QWORD *)(v0 + 40);
  v7 = *(_QWORD *)(v0 + 24);
  v9 = v2[23];
  v8 = v2[24];
  __swift_project_boxed_opaque_existential_1(v2 + 20, v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 8))(v6, v5, v4, v3, v7, v9, v8);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v34 + 104))(v1, *MEMORY[0x1E0CABF00], v35);
  LOBYTE(v3) = sub_1CF5229F4();
  v10 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
  v10(v1, v35);
  if ((v3 & 1) == 0)
  {
LABEL_10:
    sub_1CF5242CC();
    goto LABEL_11;
  }
  v11 = sub_1CF522424();
  if (!v12)
  {
    if (qword_1ED8F4438 != -1)
      swift_once();
    v22 = sub_1CF524C5C();
    __swift_project_value_buffer(v22, (uint64_t)qword_1ED8F4418);
    v23 = sub_1CF524C44();
    v24 = sub_1CF525208();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_1CF3C3000, v23, v24, "Application without application Identifier", v25, 2u);
      MEMORY[0x1D17D1060](v25, -1, -1);
    }

    goto LABEL_10;
  }
  v13 = v12;
  v15 = *(char **)(v0 + 176);
  v14 = *(_QWORD *)(v0 + 184);
  v16 = *(_QWORD *)(v0 + 160);
  v17 = *(_QWORD *)(v0 + 168);
  v18 = *(_QWORD *)(v0 + 152);
  v19 = *(_QWORD *)(v0 + 128);
  v29 = v11;
  v30 = *(_QWORD *)(v0 + 72);
  v32 = *(_QWORD *)(v0 + 80);
  v33 = *(_QWORD *)(v0 + 64);
  v36 = *(_QWORD *)(v0 + 144);
  v31 = *(_OWORD *)(v0 + 88);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 120) + 16))(v19, *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 112));
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v15, v14, v16);
  sub_1CF494D60(v19, v15, v18);
  v20 = (void *)sub_1CF52210C();
  v21 = swift_task_alloc();
  *(_QWORD *)(v21 + 16) = v30;
  *(_QWORD *)(v21 + 24) = v32;
  *(_QWORD *)(v21 + 32) = v29;
  *(_QWORD *)(v21 + 40) = v13;
  *(_QWORD *)(v21 + 48) = v18;
  *(_QWORD *)(v21 + 56) = v20;
  *(_OWORD *)(v21 + 64) = v31;
  *(_QWORD *)(v21 + 80) = v33;
  sub_1CF5242D8();
  sub_1CF525364();
  v27 = *(_QWORD *)(v0 + 152);
  v28 = *(_QWORD *)(v0 + 136);
  swift_bridgeObjectRelease();

  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v27, v28);
LABEL_11:
  v10(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 160));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CF4F8890()
{
  id v0;
  id v1;
  void *v2;
  unsigned __int8 v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C8F2B8]), sel_init);
  v1 = objc_msgSend(v0, sel_aa_primaryAppleAccount);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v1, sel_aa_isManagedAppleID);

    if ((v3 & 1) != 0 || (sub_1CF521E60() & 1) != 0)
      goto LABEL_7;
LABEL_6:
    result = sub_1CF521E6C();
    if ((result & 1) != 0)
      return result;
    goto LABEL_7;
  }

  if ((sub_1CF521E60() & 1) == 0)
    goto LABEL_6;
LABEL_7:
  v5 = sub_1CF521DF4();
  sub_1CF4C91B0();
  swift_allocError();
  v7 = v6;
  v8 = *MEMORY[0x1E0CAB238];
  v9 = sub_1CF521E30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 104))(v7, v8, v9);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(v5 - 8) + 104))(v7, *MEMORY[0x1E0CAB098], v5);
  return swift_willThrow();
}

uint64_t sub_1CF4F89AC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v16;
  uint64_t IsMarkedAsCompleteEntryVMa;
  uint64_t v18;

  IsMarkedAsCompleteEntryVMa = _s8MetadataV23IsMarkedAsCompleteEntryVMa(0);
  v3 = *(_QWORD *)(IsMarkedAsCompleteEntryVMa - 8);
  MEMORY[0x1E0C80A78](IsMarkedAsCompleteEntryVMa);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_QWORD *)(a1 + 16);
  v7 = MEMORY[0x1E0DEE9D8];
  if (v6)
  {
    v16 = v1;
    v18 = MEMORY[0x1E0DEE9D8];
    sub_1CF514B8C(0, v6, 0);
    v7 = v18;
    v8 = _s8MetadataV9CloudItemV6ObjectVMa_2(0);
    v9 = *(_QWORD *)(v8 - 8);
    v10 = a1 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    v11 = *(_QWORD *)(v9 + 72);
    do
    {
      v12 = *(_BYTE *)(v10 + *(int *)(v8 + 28));
      sub_1CF3E2B24(v10 + *(int *)(v8 + 32), (uint64_t)&v5[*(int *)(IsMarkedAsCompleteEntryVMa + 20)], &qword_1ED8F2790);
      *v5 = v12;
      v18 = v7;
      v14 = *(_QWORD *)(v7 + 16);
      v13 = *(_QWORD *)(v7 + 24);
      if (v14 >= v13 >> 1)
      {
        sub_1CF514B8C(v13 > 1, v14 + 1, 1);
        v7 = v18;
      }
      *(_QWORD *)(v7 + 16) = v14 + 1;
      sub_1CF3CB7C4((uint64_t)v5, v7+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(_QWORD *)(v3 + 72) * v14, _s8MetadataV23IsMarkedAsCompleteEntryVMa);
      v10 += v11;
      --v6;
    }
    while (v6);
  }
  return v7;
}

uint64_t sub_1CF4F8B24@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t IsMarkedAsCompleteEntryVMa;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;

  v3 = __swift_instantiateConcreteTypeFromMangledName(qword_1EFB943B8);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB90BC0);
  v7 = MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v18 - v10;
  v12 = _s8MetadataV9CloudItemVMa_2(0);
  v13 = *(_QWORD *)(v1 + *(int *)(v12 + 24));
  sub_1CF3CB780(v1 + *(int *)(v12 + 20), (uint64_t)v11, _s8MetadataV9CloudItemV6ObjectVMa_2);
  v19 = v13;
  sub_1CF3E2B24((uint64_t)v11, (uint64_t)v9, &qword_1EFB90BC0);
  swift_bridgeObjectRetain_n();
  sub_1CF427EC8((uint64_t)v9);
  v14 = v19;
  sub_1CF3CB808((uint64_t)v11, &qword_1EFB90BC0);
  swift_bridgeObjectRelease();
  v15 = sub_1CF4F89AC(v14);
  swift_bridgeObjectRelease();
  sub_1CF3F0644(v15, (uint64_t)v5);
  swift_bridgeObjectRelease();
  IsMarkedAsCompleteEntryVMa = _s8MetadataV23IsMarkedAsCompleteEntryVMa(0);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(IsMarkedAsCompleteEntryVMa - 8) + 48))(v5, 1, IsMarkedAsCompleteEntryVMa);
  if ((_DWORD)result != 1)
    return sub_1CF3CB7C4((uint64_t)v5, a1, _s8MetadataV23IsMarkedAsCompleteEntryVMa);
  __break(1u);
  return result;
}

BOOL sub_1CF4F8CCC(uint64_t a1, unsigned __int8 *a2)
{
  return (sub_1CF4FAC5C(a2, a1) & 1) == 0;
}

BOOL sub_1CF4F8CF4(unsigned __int8 *a1, uint64_t a2)
{
  return (sub_1CF4FAC5C(a1, a2) & 1) == 0;
}

uint64_t sub_1CF4F8D10(uint64_t a1, unsigned __int8 *a2)
{
  return sub_1CF4FAC5C(a2, a1);
}

uint64_t sub_1CF4F8D24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  uint64_t v13;

  v1 = v0;
  v2 = sub_1CF524A70();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870];
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF3C6DA0(&qword_1EFB8F6E0, v3, MEMORY[0x1E0CB08A8]);
  sub_1CF524E3C();
  v10 = _s8MetadataV9CloudItemV6ObjectVMa_2(0);
  sub_1CF524AB8();
  sub_1CF3C6DA0(&qword_1EFB8F6D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
  sub_1CF524E3C();
  v11 = *(id *)(v1 + *(int *)(v10 + 24));
  sub_1CF5253DC();

  sub_1CF5258C8();
  sub_1CF3E2B24(v1 + *(int *)(v10 + 32), (uint64_t)v9, &qword_1ED8F2790);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v2) == 1)
  {
    sub_1CF5258C8();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v9, v2);
    sub_1CF5258C8();
    sub_1CF524E3C();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
  }
  return sub_1CF5258D4();
}

uint64_t sub_1CF4F8F24(uint64_t a1, uint64_t a2)
{
  return sub_1CF3C69A8(a1, a2, (void (*)(_BYTE *))sub_1CF4F8D24);
}

uint64_t sub_1CF4F8F34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1CF3C69F8(a1, a2, a3, (void (*)(_BYTE *))sub_1CF4F8D24);
}

uint64_t sub_1CF4F8F44()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
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
  id v14;
  uint64_t (*v15)(char *, uint64_t, uint64_t);
  int v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29[72];

  v1 = v0;
  v2 = sub_1CF524A70();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870];
  v4 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
  v8 = MEMORY[0x1E0C80A78](v7);
  v28 = (uint64_t)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v24 - v10;
  sub_1CF5258B0();
  sub_1CF3C6DA0(&qword_1EFB8F6E0, v3, MEMORY[0x1E0CB08A8]);
  sub_1CF524E3C();
  v12 = _s8MetadataV9CloudItemV6ObjectVMa_2(0);
  v13 = sub_1CF524AB8();
  sub_1CF3C6DA0(&qword_1EFB8F6D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
  v27 = v13;
  sub_1CF524E3C();
  v14 = *(id *)(v1 + *(int *)(v12 + 24));
  sub_1CF5253DC();

  sub_1CF5258C8();
  sub_1CF3E2B24(v1 + *(int *)(v12 + 32), (uint64_t)v11, &qword_1ED8F2790);
  v15 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48);
  v16 = v15(v11, 1, v2);
  v25 = v6;
  v26 = v4;
  if (v16 == 1)
  {
    sub_1CF5258C8();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v11, v2);
    sub_1CF5258C8();
    sub_1CF524E3C();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
  }
  sub_1CF5258D4();
  v17 = _s8MetadataV9CloudItemVMa_2(0);
  v18 = v1 + *(int *)(v17 + 20);
  sub_1CF524E3C();
  sub_1CF524E3C();
  v19 = *(id *)(v18 + *(int *)(v12 + 24));
  sub_1CF5253DC();

  sub_1CF5258C8();
  v20 = v28;
  sub_1CF3E2B24(v18 + *(int *)(v12 + 32), v28, &qword_1ED8F2790);
  if (v15((char *)v20, 1, v2) == 1)
  {
    sub_1CF5258C8();
  }
  else
  {
    v22 = v25;
    v21 = v26;
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 32))(v25, v20, v2);
    sub_1CF5258C8();
    sub_1CF524E3C();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v22, v2);
  }
  sub_1CF5258D4();
  sub_1CF3C75FC((uint64_t)v29, *(_QWORD *)(v1 + *(int *)(v17 + 24)));
  return sub_1CF5258F8();
}

uint64_t sub_1CF4F928C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t (*v19)(_QWORD);
  uint64_t v20;
  uint64_t v21;
  id v22;
  int v23;
  char *v24;
  char *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(char *, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;

  v3 = sub_1CF524A70();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v34 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
  v7 = MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v29 - v10;
  v12 = _s8MetadataV9CloudItemVMa_2(0);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _s8MetadataV15CloudItemStatusOMa_2(0);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF3CB780(v1, (uint64_t)v18, v19);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v18, 2, v12))
    return sub_1CF5258BC();
  v33 = v9;
  sub_1CF3CB7C4((uint64_t)v18, (uint64_t)v15, _s8MetadataV9CloudItemVMa_2);
  sub_1CF5258BC();
  sub_1CF3C6DA0(&qword_1EFB8F6E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
  sub_1CF524E3C();
  v20 = _s8MetadataV9CloudItemV6ObjectVMa_2(0);
  v21 = sub_1CF524AB8();
  v31 = sub_1CF3C6DA0(&qword_1EFB8F6D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
  v32 = v21;
  sub_1CF524E3C();
  v22 = *(id *)&v15[*(int *)(v20 + 24)];
  sub_1CF5253DC();

  sub_1CF5258C8();
  sub_1CF3E2B24((uint64_t)&v15[*(int *)(v20 + 32)], (uint64_t)v11, &qword_1ED8F2790);
  v30 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48);
  v23 = v30(v11, 1, v3);
  v24 = v34;
  if (v23 == 1)
  {
    sub_1CF5258C8();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v34, v11, v3);
    sub_1CF5258C8();
    sub_1CF524E3C();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v24, v3);
  }
  sub_1CF5258D4();
  v26 = &v15[*(int *)(v12 + 20)];
  sub_1CF524E3C();
  sub_1CF524E3C();
  v27 = *(id *)&v26[*(int *)(v20 + 24)];
  sub_1CF5253DC();

  sub_1CF5258C8();
  v28 = (uint64_t)v33;
  sub_1CF3E2B24((uint64_t)&v26[*(int *)(v20 + 32)], (uint64_t)v33, &qword_1ED8F2790);
  if (v30((char *)v28, 1, v3) == 1)
  {
    sub_1CF5258C8();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(v24, v28, v3);
    sub_1CF5258C8();
    sub_1CF524E3C();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v24, v3);
  }
  sub_1CF5258D4();
  sub_1CF3C75FC(a1, *(_QWORD *)&v15[*(int *)(v12 + 24)]);
  return sub_1CF3C7E20((uint64_t)v15, _s8MetadataV9CloudItemVMa_2);
}

uint64_t sub_1CF4F96AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t (*v19)(char *, uint64_t, uint64_t);
  int v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v32 = a2;
  v3 = v2;
  v5 = sub_1CF524A70();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870];
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
  v11 = MEMORY[0x1E0C80A78](v10);
  v31 = (uint64_t)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v27 - v13;
  sub_1CF3C6DA0(&qword_1EFB8F6E0, v6, MEMORY[0x1E0CB08A8]);
  sub_1CF524E3C();
  v15 = _s8MetadataV9CloudItemV6ObjectVMa_2(0);
  v16 = sub_1CF524AB8();
  v29 = sub_1CF3C6DA0(&qword_1EFB8F6D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
  v30 = v16;
  sub_1CF524E3C();
  v17 = *(id *)(v3 + *(int *)(v15 + 24));
  sub_1CF5253DC();

  sub_1CF5258C8();
  v18 = v7;
  sub_1CF3E2B24(v3 + *(int *)(v15 + 32), (uint64_t)v14, &qword_1ED8F2790);
  v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v20 = v19(v14, 1, v5);
  v27 = v9;
  v28 = v18;
  if (v20 == 1)
  {
    sub_1CF5258C8();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v9, v14, v5);
    sub_1CF5258C8();
    sub_1CF524E3C();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v9, v5);
  }
  sub_1CF5258D4();
  v21 = v3 + *(int *)(v32 + 20);
  sub_1CF524E3C();
  sub_1CF524E3C();
  v22 = *(id *)(v21 + *(int *)(v15 + 24));
  sub_1CF5253DC();

  sub_1CF5258C8();
  v23 = v31;
  sub_1CF3E2B24(v21 + *(int *)(v15 + 32), v31, &qword_1ED8F2790);
  if (v19((char *)v23, 1, v5) == 1)
  {
    sub_1CF5258C8();
  }
  else
  {
    v25 = v27;
    v24 = v28;
    (*(void (**)(char *, uint64_t, uint64_t))(v28 + 32))(v27, v23, v5);
    sub_1CF5258C8();
    sub_1CF524E3C();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v25, v5);
  }
  sub_1CF5258D4();
  return sub_1CF3C75FC(a1, *(_QWORD *)(v3 + *(int *)(v32 + 24)));
}

uint64_t sub_1CF4F99F4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t (*v18)(char *, uint64_t, uint64_t);
  int v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  _QWORD v24[2];
  uint64_t v25;
  _BYTE v26[72];

  v25 = a2;
  v3 = v2;
  v4 = sub_1CF524A70();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870];
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
  v10 = MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)v24 - v13;
  sub_1CF5258B0();
  v24[1] = sub_1CF3C6DA0(&qword_1EFB8F6E0, v5, MEMORY[0x1E0CB08A8]);
  sub_1CF524E3C();
  v15 = _s8MetadataV9CloudItemV6ObjectVMa_2(0);
  sub_1CF524AB8();
  sub_1CF3C6DA0(&qword_1EFB8F6D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
  sub_1CF524E3C();
  v16 = *(id *)(v2 + *(int *)(v15 + 24));
  sub_1CF5253DC();

  sub_1CF5258C8();
  v17 = v6;
  sub_1CF3E2B24(v3 + *(int *)(v15 + 32), (uint64_t)v14, &qword_1ED8F2790);
  v18 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48);
  v19 = v18(v14, 1, v4);
  v24[0] = v17;
  if (v19 == 1)
  {
    sub_1CF5258C8();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v8, v14, v4);
    sub_1CF5258C8();
    sub_1CF524E3C();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v8, v4);
  }
  sub_1CF5258D4();
  v20 = v3 + *(int *)(v25 + 20);
  sub_1CF524E3C();
  sub_1CF524E3C();
  v21 = *(id *)(v20 + *(int *)(v15 + 24));
  sub_1CF5253DC();

  sub_1CF5258C8();
  sub_1CF3E2B24(v20 + *(int *)(v15 + 32), (uint64_t)v12, &qword_1ED8F2790);
  if (v18(v12, 1, v4) == 1)
  {
    sub_1CF5258C8();
  }
  else
  {
    v22 = v24[0];
    (*(void (**)(char *, char *, uint64_t))(v24[0] + 32))(v8, v12, v4);
    sub_1CF5258C8();
    sub_1CF524E3C();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v8, v4);
  }
  sub_1CF5258D4();
  sub_1CF3C75FC((uint64_t)v26, *(_QWORD *)(v3 + *(int *)(v25 + 24)));
  return sub_1CF5258F8();
}

BOOL sub_1CF4F9D38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (((uint64_t (*)(void))sub_1CF4F8F20)() & 1) != 0
      && (sub_1CF4F8F20(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20)) & 1) != 0
      && sub_1CF3E1A38(*(_QWORD *)(a1 + *(int *)(a3 + 24)), *(_QWORD *)(a2 + *(int *)(a3 + 24)));
}

uint64_t sub_1CF4F9DA0(uint64_t a1, uint64_t a2)
{
  return sub_1CF3C69A8(a1, a2, (void (*)(_BYTE *))sub_1CF4F928C);
}

uint64_t sub_1CF4F9DB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1CF3C69F8(a1, a2, a3, (void (*)(_BYTE *))sub_1CF4F928C);
}

uint64_t sub_1CF4F9DC0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v1 = sub_1CF524A70();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870];
  v3 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF5258B0();
  sub_1CF5253DC();
  v9 = _s8MetadataV9LocalItemVMa_2(0);
  sub_1CF3C6DA0(&qword_1EFB8F6E0, v2, MEMORY[0x1E0CB08A8]);
  sub_1CF524E3C();
  sub_1CF5258C8();
  sub_1CF3E2B24(v0 + *(int *)(v9 + 28), (uint64_t)v8, &qword_1ED8F2790);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v1) == 1)
  {
    sub_1CF5258C8();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v5, v8, v1);
    sub_1CF5258C8();
    sub_1CF524E3C();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v1);
  }
  return sub_1CF5258F8();
}

uint64_t sub_1CF4F9F6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t (*v15)(_QWORD);
  uint64_t v17;

  v1 = sub_1CF524A70();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _s8MetadataV9LocalItemVMa_2(0);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _s8MetadataV15LocalItemStatusOMa_2(0);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF3CB780(v0, (uint64_t)v14, v15);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v14, 2, v8))
    return sub_1CF5258BC();
  sub_1CF3CB7C4((uint64_t)v14, (uint64_t)v11, _s8MetadataV9LocalItemVMa_2);
  sub_1CF5258BC();
  sub_1CF5253DC();
  sub_1CF3C6DA0(&qword_1EFB8F6E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
  sub_1CF524E3C();
  sub_1CF5258C8();
  sub_1CF3E2B24((uint64_t)&v11[*(int *)(v8 + 28)], (uint64_t)v7, &qword_1ED8F2790);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1) == 1)
  {
    sub_1CF5258C8();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v7, v1);
    sub_1CF5258C8();
    sub_1CF524E3C();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return sub_1CF3C7E20((uint64_t)v11, _s8MetadataV9LocalItemVMa_2);
}

uint64_t sub_1CF4FA1E4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  char *v30;
  char *v31;
  id v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v45;
  _QWORD v46[3];
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;

  v3 = _s8MetadataV9LocalItemVMa_2(0);
  v55 = *(_QWORD *)(v3 - 8);
  v56 = v3;
  MEMORY[0x1E0C80A78](v3);
  v50 = (uint64_t)v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = sub_1CF524A70();
  v52 = *(_QWORD *)(v57 - 8);
  MEMORY[0x1E0C80A78](v57);
  v51 = (char *)v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
  v7 = MEMORY[0x1E0C80A78](v6);
  v49 = (uint64_t)v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)v46 - v10;
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)v46 - v12;
  v14 = _s8MetadataV15LocalItemStatusOMa_2(0);
  MEMORY[0x1E0C80A78](v14);
  v54 = (uint64_t)v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _s8MetadataV9CloudItemVMa_2(0);
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v19 = (char *)v46 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = _s8MetadataV15CloudItemStatusOMa_2(0);
  MEMORY[0x1E0C80A78](v20);
  v22 = (char *)v46 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF523C54();
  sub_1CF3C6DA0(qword_1EFB91E98, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD148], MEMORY[0x1E0CAD158]);
  v23 = v1;
  sub_1CF524E3C();
  v53 = _s8MetadataVMa_2(0);
  sub_1CF3CB780(v1 + *(int *)(v53 + 20), (uint64_t)v22, _s8MetadataV15CloudItemStatusOMa_2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48))(v22, 2, v16))
  {
    sub_1CF5258BC();
    v29 = v57;
  }
  else
  {
    v47 = v11;
    sub_1CF3CB7C4((uint64_t)v22, (uint64_t)v19, _s8MetadataV9CloudItemVMa_2);
    sub_1CF5258BC();
    sub_1CF3C6DA0(&qword_1EFB8F6E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
    v29 = v57;
    sub_1CF524E3C();
    v24 = _s8MetadataV9CloudItemV6ObjectVMa_2(0);
    v25 = sub_1CF524AB8();
    v46[1] = sub_1CF3C6DA0(&qword_1EFB8F6D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
    v46[2] = v25;
    sub_1CF524E3C();
    v26 = *(id *)&v19[*(int *)(v24 + 24)];
    sub_1CF5253DC();

    sub_1CF5258C8();
    sub_1CF3E2B24((uint64_t)&v19[*(int *)(v24 + 32)], (uint64_t)v13, &qword_1ED8F2790);
    v27 = v52;
    v46[0] = *(_QWORD *)(v52 + 48);
    v28 = ((uint64_t (*)(char *, uint64_t, uint64_t))v46[0])(v13, 1, v29);
    v48 = v23;
    if (v28 == 1)
    {
      sub_1CF5258C8();
    }
    else
    {
      v30 = v51;
      (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v51, v13, v29);
      sub_1CF5258C8();
      sub_1CF524E3C();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v30, v29);
    }
    sub_1CF5258D4();
    v31 = &v19[*(int *)(v16 + 20)];
    sub_1CF524E3C();
    sub_1CF524E3C();
    v32 = *(id *)&v31[*(int *)(v24 + 24)];
    sub_1CF5253DC();

    sub_1CF5258C8();
    v33 = (uint64_t)v47;
    sub_1CF3E2B24((uint64_t)&v31[*(int *)(v24 + 32)], (uint64_t)v47, &qword_1ED8F2790);
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v46[0])(v33, 1, v29) == 1)
    {
      sub_1CF5258C8();
    }
    else
    {
      v34 = v51;
      v35 = v52;
      (*(void (**)(char *, uint64_t, uint64_t))(v52 + 32))(v51, v33, v29);
      sub_1CF5258C8();
      sub_1CF524E3C();
      (*(void (**)(char *, uint64_t))(v35 + 8))(v34, v29);
    }
    v23 = v48;
    sub_1CF5258D4();
    sub_1CF3C75FC(a1, *(_QWORD *)&v19[*(int *)(v16 + 24)]);
    sub_1CF3C7E20((uint64_t)v19, _s8MetadataV9CloudItemVMa_2);
  }
  v36 = v55;
  v37 = v56;
  v38 = v54;
  sub_1CF3CB780(v23 + *(int *)(v53 + 24), v54, _s8MetadataV15LocalItemStatusOMa_2);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v36 + 48))(v38, 2, v37))
    return sub_1CF5258BC();
  v39 = v38;
  v40 = v29;
  v41 = v50;
  sub_1CF3CB7C4(v39, v50, _s8MetadataV9LocalItemVMa_2);
  sub_1CF5258BC();
  sub_1CF5253DC();
  sub_1CF3C6DA0(&qword_1EFB8F6E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08A8]);
  sub_1CF524E3C();
  sub_1CF5258C8();
  v42 = v49;
  sub_1CF3E2B24(v41 + *(int *)(v37 + 28), v49, &qword_1ED8F2790);
  v43 = v52;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v52 + 48))(v42, 1, v40) == 1)
  {
    sub_1CF5258C8();
  }
  else
  {
    v45 = v51;
    (*(void (**)(char *, uint64_t, uint64_t))(v43 + 32))(v51, v42, v40);
    sub_1CF5258C8();
    sub_1CF524E3C();
    (*(void (**)(char *, uint64_t))(v43 + 8))(v45, v40);
  }
  return sub_1CF3C7E20(v41, _s8MetadataV9LocalItemVMa_2);
}

uint64_t sub_1CF4FA878(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  v4 = sub_1CF524A70();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870];
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF5253DC();
  sub_1CF3C6DA0(&qword_1EFB8F6E0, v5, MEMORY[0x1E0CB08A8]);
  sub_1CF524E3C();
  sub_1CF5258C8();
  sub_1CF3E2B24(v2 + *(int *)(a2 + 28), (uint64_t)v11, &qword_1ED8F2790);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v4) == 1)
    return sub_1CF5258C8();
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v11, v4);
  sub_1CF5258C8();
  sub_1CF524E3C();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v4);
}

uint64_t sub_1CF4FAA10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  v4 = sub_1CF524A70();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870];
  v6 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF5258B0();
  sub_1CF5253DC();
  sub_1CF3C6DA0(&qword_1EFB8F6E0, v5, MEMORY[0x1E0CB08A8]);
  sub_1CF524E3C();
  sub_1CF5258C8();
  sub_1CF3E2B24(v2 + *(int *)(a2 + 28), (uint64_t)v11, &qword_1ED8F2790);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v4) == 1)
  {
    sub_1CF5258C8();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v11, v4);
    sub_1CF5258C8();
    sub_1CF524E3C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v4);
  }
  return sub_1CF5258F8();
}

uint64_t sub_1CF4FABBC(uint64_t a1, uint64_t a2)
{
  return sub_1CF3C69A8(a1, a2, (void (*)(_BYTE *))sub_1CF4F9F6C);
}

uint64_t sub_1CF4FABCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1CF3C69F8(a1, a2, a3, (void (*)(_BYTE *))sub_1CF4F9F6C);
}

uint64_t sub_1CF4FABD8(uint64_t a1, uint64_t a2)
{
  return sub_1CF3C69A8(a1, a2, (void (*)(_BYTE *))sub_1CF4FA1E4);
}

uint64_t sub_1CF4FABE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1CF3C69F8(a1, a2, a3, (void (*)(_BYTE *))sub_1CF4FA1E4);
}

uint64_t sub_1CF4FABF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((MEMORY[0x1D17CEC84]() & 1) != 0 && (sub_1CF4F96A4(a1 + *(int *)(a3 + 20), a2 + *(int *)(a3 + 20)) & 1) != 0)
    return sub_1CF4FA1E0(a1 + *(int *)(a3 + 24), a2 + *(int *)(a3 + 24));
  else
    return 0;
}

uint64_t sub_1CF4FAC5C(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t IsMarkedAsCompleteEntryVMa;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int (*v25)(uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  int v27;
  _BYTE *v28;
  char v29;
  uint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  char *v32;
  char *v33;
  void (*v34)(char *, uint64_t);
  char v35;
  void (*v36)(char *, uint64_t);
  char *v38;
  char *v39;
  char *v40;
  char *v41;
  unsigned __int8 *v42;
  uint64_t v43;

  IsMarkedAsCompleteEntryVMa = _s8MetadataV23IsMarkedAsCompleteEntryVMa(0);
  v5 = MEMORY[0x1E0C80A78](IsMarkedAsCompleteEntryVMa);
  v41 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v38 = (char *)&v38 - v7;
  v8 = sub_1CF524A70();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v39 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v40 = (char *)&v38 - v12;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB8FB98);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v38 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
  v17 = MEMORY[0x1E0C80A78](v16);
  v19 = (char *)&v38 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v21 = (char *)&v38 - v20;
  v22 = *(int *)(IsMarkedAsCompleteEntryVMa + 20);
  v42 = a1;
  sub_1CF3E2B24((uint64_t)&a1[v22], (uint64_t)&v38 - v20, &qword_1ED8F2790);
  v23 = *(int *)(IsMarkedAsCompleteEntryVMa + 20);
  v43 = a2;
  sub_1CF3E2B24(a2 + v23, (uint64_t)v19, &qword_1ED8F2790);
  v24 = (uint64_t)&v15[*(int *)(v13 + 48)];
  sub_1CF3E2B24((uint64_t)v21, (uint64_t)v15, &qword_1ED8F2790);
  sub_1CF3E2B24((uint64_t)v19, v24, &qword_1ED8F2790);
  v25 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48);
  if (v25((uint64_t)v15, 1, v8) != 1)
  {
    if (v25(v24, 1, v8) == 1)
    {
      sub_1CF3CB808((uint64_t)v19, &qword_1ED8F2790);
      sub_1CF3CB808((uint64_t)v21, &qword_1ED8F2790);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v15, v8);
      v29 = 0;
      return v29 & 1;
    }
    v31 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v32 = v40;
    v31(v40, v15, v8);
    v33 = v39;
    v31(v39, (char *)v24, v8);
    if ((sub_1CF524A28() & 1) == 0)
    {
      v35 = sub_1CF524A1C();
      v36 = *(void (**)(char *, uint64_t))(v9 + 8);
      v36(v33, v8);
      v36(v32, v8);
      sub_1CF3CB808((uint64_t)v19, &qword_1ED8F2790);
      sub_1CF3CB808((uint64_t)v21, &qword_1ED8F2790);
      if ((v35 & 1) != 0)
      {
        v29 = 0;
        return v29 & 1;
      }
      v26 = v43;
      v27 = *v42;
      v28 = v38;
      goto LABEL_13;
    }
    v34 = *(void (**)(char *, uint64_t))(v9 + 8);
    v34(v33, v8);
    v34(v32, v8);
    sub_1CF3CB808((uint64_t)v19, &qword_1ED8F2790);
    v30 = (uint64_t)v21;
LABEL_9:
    sub_1CF3CB808(v30, &qword_1ED8F2790);
    v29 = 1;
    return v29 & 1;
  }
  sub_1CF3CB808((uint64_t)v19, &qword_1ED8F2790);
  sub_1CF3CB808((uint64_t)v21, &qword_1ED8F2790);
  if (v25(v24, 1, v8) != 1)
  {
    v30 = v24;
    goto LABEL_9;
  }
  v26 = v43;
  v27 = *v42;
  v28 = v41;
LABEL_13:
  sub_1CF3CB780(v26, (uint64_t)v28, _s8MetadataV23IsMarkedAsCompleteEntryVMa);
  if (v27 == 1)
    v29 = *v28 ^ 1;
  else
    v29 = 0;
  sub_1CF3C7E20((uint64_t)v28, _s8MetadataV23IsMarkedAsCompleteEntryVMa);
  return v29 & 1;
}

BOOL sub_1CF4FB034(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t IsMarkedAsCompleteEntryVMa;
  uint64_t v21;
  unsigned int (*v22)(uint64_t, uint64_t, uint64_t);
  char *v23;
  char v24;
  void (*v25)(char *, uint64_t);
  uint64_t v27;
  char *v28;

  v4 = sub_1CF524A70();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB8FB98);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v12);
  v17 = (char *)&v27 - v16;
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v27 - v18;
  if (*a1 != *a2)
    return 0;
  v28 = v7;
  IsMarkedAsCompleteEntryVMa = _s8MetadataV23IsMarkedAsCompleteEntryVMa(0);
  sub_1CF3E2B24((uint64_t)&a1[*(int *)(IsMarkedAsCompleteEntryVMa + 20)], (uint64_t)v19, &qword_1ED8F2790);
  sub_1CF3E2B24((uint64_t)&a2[*(int *)(IsMarkedAsCompleteEntryVMa + 20)], (uint64_t)v17, &qword_1ED8F2790);
  v21 = (uint64_t)&v10[*(int *)(v8 + 48)];
  sub_1CF3E2B24((uint64_t)v19, (uint64_t)v10, &qword_1ED8F2790);
  sub_1CF3E2B24((uint64_t)v17, v21, &qword_1ED8F2790);
  v22 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v22((uint64_t)v10, 1, v4) == 1)
  {
    sub_1CF3CB808((uint64_t)v17, &qword_1ED8F2790);
    sub_1CF3CB808((uint64_t)v19, &qword_1ED8F2790);
    if (v22(v21, 1, v4) == 1)
    {
      sub_1CF3CB808((uint64_t)v10, &qword_1ED8F2790);
      return 1;
    }
    goto LABEL_7;
  }
  sub_1CF3E2B24((uint64_t)v10, (uint64_t)v14, &qword_1ED8F2790);
  if (v22(v21, 1, v4) == 1)
  {
    sub_1CF3CB808((uint64_t)v17, &qword_1ED8F2790);
    sub_1CF3CB808((uint64_t)v19, &qword_1ED8F2790);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v14, v4);
LABEL_7:
    sub_1CF3CB808((uint64_t)v10, &qword_1EFB8FB98);
    return 0;
  }
  v23 = v28;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v28, v21, v4);
  sub_1CF3C6DA0((unint64_t *)&qword_1EFB8FBA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08B8]);
  v24 = sub_1CF524E6C();
  v25 = *(void (**)(char *, uint64_t))(v5 + 8);
  v25(v23, v4);
  sub_1CF3CB808((uint64_t)v17, &qword_1ED8F2790);
  sub_1CF3CB808((uint64_t)v19, &qword_1ED8F2790);
  v25(v14, v4);
  sub_1CF3CB808((uint64_t)v10, &qword_1ED8F2790);
  return (v24 & 1) != 0;
}

BOOL sub_1CF4FB354(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int (*v28)(uint64_t, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char v32;
  void (*v33)(char *, uint64_t);
  char *v35;
  char *v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;

  v4 = sub_1CF524A70();
  v39 = *(_QWORD *)(v4 - 8);
  v40 = v4;
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB8FB98);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
  v11 = MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x1E0C80A78](v11);
  v16 = (char *)&v35 - v15;
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v35 - v17;
  sub_1CF3C7E5C();
  v19 = a1;
  v20 = a2;
  if ((sub_1CF5253D0() & 1) == 0)
    return 0;
  v37 = v16;
  v38 = v18;
  v35 = v6;
  v36 = v13;
  v22 = v39;
  v21 = v40;
  v23 = _s8MetadataV9LocalItemVMa_2(0);
  if ((sub_1CF524A34() & 1) == 0
    || *(unsigned __int8 *)(v19 + *(int *)(v23 + 24)) != *(unsigned __int8 *)(v20 + *(int *)(v23 + 24)))
  {
    return 0;
  }
  v24 = (uint64_t)v38;
  sub_1CF3E2B24(v19 + *(int *)(v23 + 28), (uint64_t)v38, &qword_1ED8F2790);
  v25 = (uint64_t)v37;
  sub_1CF3E2B24(v20 + *(int *)(v23 + 28), (uint64_t)v37, &qword_1ED8F2790);
  v26 = (uint64_t)v9;
  v27 = (uint64_t)&v9[*(int *)(v7 + 48)];
  sub_1CF3E2B24(v24, (uint64_t)v9, &qword_1ED8F2790);
  sub_1CF3E2B24(v25, v27, &qword_1ED8F2790);
  v28 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v22 + 48);
  v29 = v21;
  if (v28((uint64_t)v9, 1, v21) == 1)
  {
    sub_1CF3CB808(v25, &qword_1ED8F2790);
    sub_1CF3CB808(v24, &qword_1ED8F2790);
    if (v28(v27, 1, v21) == 1)
    {
      sub_1CF3CB808((uint64_t)v9, &qword_1ED8F2790);
      return 1;
    }
    goto LABEL_9;
  }
  v30 = (uint64_t)v36;
  sub_1CF3E2B24((uint64_t)v9, (uint64_t)v36, &qword_1ED8F2790);
  if (v28(v27, 1, v21) == 1)
  {
    sub_1CF3CB808(v25, &qword_1ED8F2790);
    sub_1CF3CB808(v24, &qword_1ED8F2790);
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v30, v21);
LABEL_9:
    sub_1CF3CB808((uint64_t)v9, &qword_1EFB8FB98);
    return 0;
  }
  v31 = v35;
  (*(void (**)(char *, uint64_t, uint64_t))(v22 + 32))(v35, v27, v21);
  sub_1CF3C6DA0((unint64_t *)&qword_1EFB8FBA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08B8]);
  v32 = sub_1CF524E6C();
  v33 = *(void (**)(char *, uint64_t))(v22 + 8);
  v33(v31, v29);
  sub_1CF3CB808(v25, &qword_1ED8F2790);
  sub_1CF3CB808(v24, &qword_1ED8F2790);
  v33((char *)v30, v29);
  sub_1CF3CB808(v26, &qword_1ED8F2790);
  return (v32 & 1) != 0;
}

BOOL sub_1CF4FB6D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t (*v16)(char *, uint64_t, uint64_t);
  int v17;
  BOOL v18;
  uint64_t v20;

  v4 = _s8MetadataV9LocalItemVMa_2(0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _s8MetadataV15LocalItemStatusOMa_2(0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB943B0);
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (uint64_t)&v14[*(int *)(v12 + 48)];
  sub_1CF3CB780(a1, (uint64_t)v14, _s8MetadataV15LocalItemStatusOMa_2);
  sub_1CF3CB780(a2, v15, _s8MetadataV15LocalItemStatusOMa_2);
  v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  v17 = v16(v14, 2, v4);
  if (!v17)
  {
    sub_1CF3CB780((uint64_t)v14, (uint64_t)v10, _s8MetadataV15LocalItemStatusOMa_2);
    if (!v16((char *)v15, 2, v4))
    {
      sub_1CF3CB7C4(v15, (uint64_t)v7, _s8MetadataV9LocalItemVMa_2);
      v18 = sub_1CF4FB354((uint64_t)v10, (uint64_t)v7);
      sub_1CF3C7E20((uint64_t)v7, _s8MetadataV9LocalItemVMa_2);
      sub_1CF3C7E20((uint64_t)v10, _s8MetadataV9LocalItemVMa_2);
      sub_1CF3C7E20((uint64_t)v14, _s8MetadataV15LocalItemStatusOMa_2);
      return v18;
    }
    sub_1CF3C7E20((uint64_t)v10, _s8MetadataV9LocalItemVMa_2);
    goto LABEL_9;
  }
  if (v17 == 1)
  {
    if (v16((char *)v15, 2, v4) != 1)
      goto LABEL_9;
  }
  else if (v16((char *)v15, 2, v4) != 2)
  {
LABEL_9:
    sub_1CF3CB808((uint64_t)v14, &qword_1EFB943B0);
    return 0;
  }
  sub_1CF3C7E20((uint64_t)v14, _s8MetadataV15LocalItemStatusOMa_2);
  return 1;
}

uint64_t _s8MetadataV9LocalItemVMa_2(uint64_t a1)
{
  return sub_1CF3CB49C(a1, qword_1EFB945B0);
}

uint64_t _s8MetadataV15LocalItemStatusOMa_2(uint64_t a1)
{
  return sub_1CF3CB49C(a1, qword_1EFB94548);
}

uint64_t _s8MetadataV23IsMarkedAsCompleteEntryVMa(uint64_t a1)
{
  return sub_1CF3CB49C(a1, qword_1EFB94648);
}

uint64_t _s8MetadataV9CloudItemVMa_2(uint64_t a1)
{
  return sub_1CF3CB49C(a1, qword_1EFB94418);
}

uint64_t _s8MetadataV9CloudItemV6ObjectVMa_2(uint64_t a1)
{
  return sub_1CF3CB49C(a1, qword_1EFB946D8);
}

char *sub_1CF4FB968(char *a1, char *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  unsigned int (*v19)(char *, uint64_t, uint64_t);
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  id v31;
  uint64_t v32;
  void (*v34)(char *, char *, uint64_t);
  unsigned int (*v35)(char *, uint64_t, uint64_t);
  void (*v36)(char *, char *, uint64_t);

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v22 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v22 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1CF524A70();
    v8 = *(_QWORD *)(v7 - 8);
    v36 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    v36(a1, a2, v7);
    v9 = (int *)_s8MetadataV9CloudItemV6ObjectVMa_2(0);
    v10 = v9[5];
    v11 = &a1[v10];
    v12 = &a2[v10];
    v13 = sub_1CF524AB8();
    v34 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    v34(v11, v12, v13);
    v14 = v9[6];
    v15 = *(void **)&a2[v14];
    *(_QWORD *)&a1[v14] = v15;
    a1[v9[7]] = a2[v9[7]];
    v16 = v9[8];
    v17 = &a1[v16];
    v18 = &a2[v16];
    v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
    v20 = v15;
    v35 = v19;
    if (v19(v18, 1, v7))
    {
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
      memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      v36(v17, v18, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v17, 0, 1, v7);
    }
    *(_WORD *)&a1[v9[9]] = *(_WORD *)&a2[v9[9]];
    v23 = *(int *)(a3 + 20);
    v24 = &a1[v23];
    v25 = &a2[v23];
    v36(&a1[v23], &a2[v23], v7);
    v34(&v24[v9[5]], &v25[v9[5]], v13);
    v26 = v9[6];
    v27 = *(void **)&v25[v26];
    *(_QWORD *)&v24[v26] = v27;
    v24[v9[7]] = v25[v9[7]];
    v28 = v9[8];
    v29 = &v24[v28];
    v30 = &v25[v28];
    v31 = v27;
    if (v35(v30, 1, v7))
    {
      v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
      memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    }
    else
    {
      v36(v29, v30, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v29, 0, 1, v7);
    }
    *(_WORD *)&v24[v9[9]] = *(_WORD *)&v25[v9[9]];
    *(_QWORD *)&a1[*(int *)(a3 + 24)] = *(_QWORD *)&a2[*(int *)(a3 + 24)];
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1CF4FBBD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  int *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  unsigned int (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;

  v4 = sub_1CF524A70();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v6(a1, v4);
  v7 = (int *)_s8MetadataV9CloudItemV6ObjectVMa_2(0);
  v8 = a1 + v7[5];
  v9 = sub_1CF524AB8();
  v10 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8);
  v10(v8, v9);

  v11 = a1 + v7[8];
  v12 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (!v12(v11, 1, v4))
    v6(v11, v4);
  v13 = a1 + *(int *)(a2 + 20);
  v6(v13, v4);
  v10(v13 + v7[5], v9);

  v14 = v13 + v7[8];
  if (!v12(v14, 1, v4))
    v6(v14, v4);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CF4FBD00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  int *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const void *v17;
  unsigned int (*v18)(const void *, uint64_t, uint64_t);
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  const void *v28;
  id v29;
  uint64_t v30;
  void (*v32)(uint64_t, uint64_t, uint64_t);
  unsigned int (*v33)(const void *, uint64_t, uint64_t);

  v5 = sub_1CF524A70();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v7(a1, a2, v5);
  v8 = (int *)_s8MetadataV9CloudItemV6ObjectVMa_2(0);
  v9 = v8[5];
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_1CF524AB8();
  v32 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  v32(v10, v11, v12);
  v13 = v8[6];
  v14 = *(void **)(a2 + v13);
  *(_QWORD *)(a1 + v13) = v14;
  *(_BYTE *)(a1 + v8[7]) = *(_BYTE *)(a2 + v8[7]);
  v15 = v8[8];
  v16 = (void *)(a1 + v15);
  v17 = (const void *)(a2 + v15);
  v18 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v6 + 48);
  v19 = v14;
  v33 = v18;
  if (v18(v17, 1, v5))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v16, (uint64_t)v17, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v16, 0, 1, v5);
  }
  *(_WORD *)(a1 + v8[9]) = *(_WORD *)(a2 + v8[9]);
  v21 = *(int *)(a3 + 20);
  v22 = a1 + v21;
  v23 = a2 + v21;
  v7(a1 + v21, a2 + v21, v5);
  v32(v22 + v8[5], v23 + v8[5], v12);
  v24 = v8[6];
  v25 = *(void **)(v23 + v24);
  *(_QWORD *)(v22 + v24) = v25;
  *(_BYTE *)(v22 + v8[7]) = *(_BYTE *)(v23 + v8[7]);
  v26 = v8[8];
  v27 = (void *)(v22 + v26);
  v28 = (const void *)(v23 + v26);
  v29 = v25;
  if (v33(v28, 1, v5))
  {
    v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v30 - 8) + 64));
  }
  else
  {
    v7((uint64_t)v27, (uint64_t)v28, v5);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v27, 0, 1, v5);
  }
  *(_WORD *)(v22 + v8[9]) = *(_WORD *)(v23 + v8[9]);
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1CF4FBF3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  const void *v19;
  uint64_t (*v20)(const void *, uint64_t, uint64_t);
  int v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  const void *v33;
  int v34;
  int v35;
  uint64_t v36;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, uint64_t);

  v5 = sub_1CF524A70();
  v6 = *(_QWORD *)(v5 - 8);
  v39 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 24);
  v39(a1, a2, v5);
  v7 = (int *)_s8MetadataV9CloudItemV6ObjectVMa_2(0);
  v8 = v7[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_1CF524AB8();
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 24);
  v12(v9, v10, v11);
  v13 = v7[6];
  v14 = *(void **)(a2 + v13);
  v15 = *(void **)(a1 + v13);
  *(_QWORD *)(a1 + v13) = v14;
  v16 = v14;

  *(_BYTE *)(a1 + v7[7]) = *(_BYTE *)(a2 + v7[7]);
  v17 = v7[8];
  v18 = (void *)(a1 + v17);
  v19 = (const void *)(a2 + v17);
  v38 = v6;
  v20 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v6 + 48);
  LODWORD(v6) = v20((const void *)(a1 + v17), 1, v5);
  v21 = v20(v19, 1, v5);
  if ((_DWORD)v6)
  {
    if (!v21)
    {
      (*(void (**)(void *, const void *, uint64_t))(v38 + 16))(v18, v19, v5);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v18, 0, 1, v5);
LABEL_7:
      v23 = v39;
      goto LABEL_8;
    }
LABEL_6:
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    goto LABEL_7;
  }
  if (v21)
  {
    (*(void (**)(void *, uint64_t))(v38 + 8))(v18, v5);
    goto LABEL_6;
  }
  v23 = v39;
  v39((uint64_t)v18, (uint64_t)v19, v5);
LABEL_8:
  *(_WORD *)(a1 + v7[9]) = *(_WORD *)(a2 + v7[9]);
  v24 = *(int *)(a3 + 20);
  v25 = a1 + v24;
  v26 = a2 + v24;
  v23(a1 + v24, a2 + v24, v5);
  v12(v25 + v7[5], v26 + v7[5], v11);
  v27 = v7[6];
  v28 = *(void **)(v26 + v27);
  v29 = *(void **)(v25 + v27);
  *(_QWORD *)(v25 + v27) = v28;
  v30 = v28;

  *(_BYTE *)(v25 + v7[7]) = *(_BYTE *)(v26 + v7[7]);
  v31 = v7[8];
  v32 = (void *)(v25 + v31);
  v33 = (const void *)(v26 + v31);
  v34 = v20((const void *)(v25 + v31), 1, v5);
  v35 = v20(v33, 1, v5);
  if (!v34)
  {
    if (!v35)
    {
      v39((uint64_t)v32, (uint64_t)v33, v5);
      goto LABEL_14;
    }
    (*(void (**)(void *, uint64_t))(v38 + 8))(v32, v5);
    goto LABEL_13;
  }
  if (v35)
  {
LABEL_13:
    v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(void *, const void *, uint64_t))(v38 + 16))(v32, v33, v5);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v38 + 56))(v32, 0, 1, v5);
LABEL_14:
  *(_WORD *)(v25 + v7[9]) = *(_WORD *)(v26 + v7[9]);
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_1CF4FC228(char *a1, char *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  void (*v7)(void *, const void *, uint64_t);
  int *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  unsigned int (*v26)(char *, uint64_t, uint64_t);

  v5 = sub_1CF524A70();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(void (**)(void *, const void *, uint64_t))(v6 + 32);
  v7(a1, a2, v5);
  v8 = (int *)_s8MetadataV9CloudItemV6ObjectVMa_2(0);
  v9 = v8[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_1CF524AB8();
  v13 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32);
  v13(v10, v11, v12);
  *(_QWORD *)&a1[v8[6]] = *(_QWORD *)&a2[v8[6]];
  a1[v8[7]] = a2[v8[7]];
  v14 = v8[8];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48);
  if (v26(&a2[v14], 1, v5))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    v7(v15, v16, v5);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v15, 0, 1, v5);
  }
  *(_WORD *)&a1[v8[9]] = *(_WORD *)&a2[v8[9]];
  v18 = *(int *)(a3 + 20);
  v19 = &a1[v18];
  v20 = &a2[v18];
  v7(&a1[v18], &a2[v18], v5);
  v13(&v19[v8[5]], &v20[v8[5]], v12);
  *(_QWORD *)&v19[v8[6]] = *(_QWORD *)&v20[v8[6]];
  v19[v8[7]] = v20[v8[7]];
  v21 = v8[8];
  v22 = &v19[v21];
  v23 = &v20[v21];
  if (v26(&v20[v21], 1, v5))
  {
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
  }
  else
  {
    v7(v22, v23, v5);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v6 + 56))(v22, 0, 1, v5);
  }
  *(_WORD *)&v19[v8[9]] = *(_WORD *)&v20[v8[9]];
  *(_QWORD *)&a1[*(int *)(a3 + 24)] = *(_QWORD *)&a2[*(int *)(a3 + 24)];
  return a1;
}

uint64_t sub_1CF4FC450(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const void *v17;
  uint64_t (*v18)(const void *, uint64_t, uint64_t);
  int v19;
  int v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const void *v30;
  int v31;
  int v32;
  uint64_t v33;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t, uint64_t);

  v5 = sub_1CF524A70();
  v6 = *(_QWORD *)(v5 - 8);
  v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 40);
  v36(a1, a2, v5);
  v7 = (int *)_s8MetadataV9CloudItemV6ObjectVMa_2(0);
  v8 = v7[5];
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = sub_1CF524AB8();
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 40);
  v12(v9, v10, v11);
  v13 = v7[6];
  v14 = *(void **)(a1 + v13);
  *(_QWORD *)(a1 + v13) = *(_QWORD *)(a2 + v13);

  *(_BYTE *)(a1 + v7[7]) = *(_BYTE *)(a2 + v7[7]);
  v15 = v7[8];
  v16 = (void *)(a1 + v15);
  v17 = (const void *)(a2 + v15);
  v35 = v6;
  v18 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v6 + 48);
  v19 = v18((const void *)(a1 + v15), 1, v5);
  v20 = v18(v17, 1, v5);
  if (v19)
  {
    if (!v20)
    {
      (*(void (**)(void *, const void *, uint64_t))(v35 + 32))(v16, v17, v5);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v16, 0, 1, v5);
LABEL_7:
      v22 = v36;
      goto LABEL_8;
    }
LABEL_6:
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    goto LABEL_7;
  }
  if (v20)
  {
    (*(void (**)(void *, uint64_t))(v35 + 8))(v16, v5);
    goto LABEL_6;
  }
  v22 = v36;
  v36((uint64_t)v16, (uint64_t)v17, v5);
LABEL_8:
  *(_WORD *)(a1 + v7[9]) = *(_WORD *)(a2 + v7[9]);
  v23 = *(int *)(a3 + 20);
  v24 = a1 + v23;
  v25 = a2 + v23;
  v22(a1 + v23, a2 + v23, v5);
  v12(v24 + v7[5], v25 + v7[5], v11);
  v26 = v7[6];
  v27 = *(void **)(v24 + v26);
  *(_QWORD *)(v24 + v26) = *(_QWORD *)(v25 + v26);

  *(_BYTE *)(v24 + v7[7]) = *(_BYTE *)(v25 + v7[7]);
  v28 = v7[8];
  v29 = (void *)(v24 + v28);
  v30 = (const void *)(v25 + v28);
  v31 = v18((const void *)(v24 + v28), 1, v5);
  v32 = v18(v30, 1, v5);
  if (!v31)
  {
    if (!v32)
    {
      v36((uint64_t)v29, (uint64_t)v30, v5);
      goto LABEL_14;
    }
    (*(void (**)(void *, uint64_t))(v35 + 8))(v29, v5);
    goto LABEL_13;
  }
  if (v32)
  {
LABEL_13:
    v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v33 - 8) + 64));
    goto LABEL_14;
  }
  (*(void (**)(void *, const void *, uint64_t))(v35 + 32))(v29, v30, v5);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v29, 0, 1, v5);
LABEL_14:
  *(_WORD *)(v24 + v7[9]) = *(_WORD *)(v25 + v7[9]);
  *(_QWORD *)(a1 + *(int *)(a3 + 24)) = *(_QWORD *)(a2 + *(int *)(a3 + 24));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1CF4FC72C()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF4FC738(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = _s8MetadataV9CloudItemV6ObjectVMa_2(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_1CF4FC7B4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF4FC7C0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = _s8MetadataV9CloudItemV6ObjectVMa_2(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

uint64_t sub_1CF4FC838()
{
  uint64_t result;
  unint64_t v1;

  result = _s8MetadataV9CloudItemV6ObjectVMa_2(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1CF4FC8B0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  char *v20;
  char *v21;
  unsigned int (*v22)(char *, uint64_t, uint64_t);
  id v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  id v33;
  uint64_t v34;
  void (*v35)(uint64_t *, _QWORD, uint64_t, uint64_t);
  uint64_t v37;
  void (*v38)(char *, char *, uint64_t);
  uint64_t v39;
  void (*v40)(uint64_t *, uint64_t *, uint64_t);

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v7 = _s8MetadataV9CloudItemVMa_2(0);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 2, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v39 = v8;
      v10 = sub_1CF524A70();
      v11 = *(_QWORD *)(v10 - 8);
      v40 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v11 + 16);
      v40(a1, a2, v10);
      v12 = (int *)_s8MetadataV9CloudItemV6ObjectVMa_2(0);
      v13 = v12[5];
      v14 = (char *)a1 + v13;
      v15 = (char *)a2 + v13;
      v16 = sub_1CF524AB8();
      v38 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
      v38(v14, v15, v16);
      v17 = v12[6];
      v18 = *(void **)((char *)a2 + v17);
      *(uint64_t *)((char *)a1 + v17) = (uint64_t)v18;
      *((_BYTE *)a1 + v12[7]) = *((_BYTE *)a2 + v12[7]);
      v19 = v12[8];
      v20 = (char *)a1 + v19;
      v21 = (char *)a2 + v19;
      v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
      v23 = v18;
      v37 = v11;
      if (v22(v21, 1, v10))
      {
        v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
        memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
      }
      else
      {
        v40((uint64_t *)v20, (uint64_t *)v21, v10);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v20, 0, 1, v10);
      }
      *(_WORD *)((char *)a1 + v12[9]) = *(_WORD *)((char *)a2 + v12[9]);
      v25 = *(int *)(v7 + 20);
      v26 = (char *)a1 + v25;
      v27 = (char *)a2 + v25;
      v40((uint64_t *)((char *)a1 + v25), (uint64_t *)((char *)a2 + v25), v10);
      v38(&v26[v12[5]], &v27[v12[5]], v16);
      v28 = v12[6];
      v29 = *(void **)&v27[v28];
      *(_QWORD *)&v26[v28] = v29;
      v26[v12[7]] = v27[v12[7]];
      v30 = v12[8];
      v31 = &v26[v30];
      v32 = &v27[v30];
      v33 = v29;
      if (v22(v32, 1, v10))
      {
        v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
        memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
      }
      else
      {
        v40((uint64_t *)v31, (uint64_t *)v32, v10);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v31, 0, 1, v10);
      }
      *(_WORD *)&v26[v12[9]] = *(_WORD *)&v27[v12[9]];
      *(uint64_t *)((char *)a1 + *(int *)(v7 + 24)) = *(uint64_t *)((char *)a2 + *(int *)(v7 + 24));
      v35 = *(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v39 + 56);
      swift_bridgeObjectRetain();
      v35(a1, 0, 2, v7);
    }
  }
  return a1;
}

uint64_t sub_1CF4FCB78(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  int *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  uint64_t v11;
  unsigned int (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;

  v2 = _s8MetadataV9CloudItemVMa_2(0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 2, v2);
  if (!(_DWORD)result)
  {
    v4 = sub_1CF524A70();
    v5 = *(_QWORD *)(v4 - 8);
    v6 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
    v6(a1, v4);
    v7 = (int *)_s8MetadataV9CloudItemV6ObjectVMa_2(0);
    v8 = a1 + v7[5];
    v9 = sub_1CF524AB8();
    v10 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8);
    v10(v8, v9);

    v11 = a1 + v7[8];
    v12 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
    if (!v12(v11, 1, v4))
      v6(v11, v4);
    v13 = a1 + *(int *)(v2 + 20);
    v6(v13, v4);
    v10(v13 + v7[5], v9);

    v14 = v13 + v7[8];
    if (!v12(v14, 1, v4))
      v6(v14, v4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

char *sub_1CF4FCCE4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  unsigned int (*v20)(char *, uint64_t, uint64_t);
  id v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  id v31;
  uint64_t v32;
  void (*v33)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v35;
  void (*v36)(char *, char *, uint64_t);
  uint64_t v37;
  void (*v38)(char *, char *, uint64_t);

  v6 = _s8MetadataV9CloudItemVMa_2(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v37 = v7;
    v8 = sub_1CF524A70();
    v9 = *(_QWORD *)(v8 - 8);
    v38 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
    v38(a1, a2, v8);
    v10 = (int *)_s8MetadataV9CloudItemV6ObjectVMa_2(0);
    v11 = v10[5];
    v12 = &a1[v11];
    v13 = &a2[v11];
    v14 = sub_1CF524AB8();
    v36 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    v36(v12, v13, v14);
    v15 = v10[6];
    v16 = *(void **)&a2[v15];
    *(_QWORD *)&a1[v15] = v16;
    a1[v10[7]] = a2[v10[7]];
    v17 = v10[8];
    v18 = &a1[v17];
    v19 = &a2[v17];
    v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
    v21 = v16;
    v35 = v9;
    if (v20(v19, 1, v8))
    {
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      v38(v18, v19, v8);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v18, 0, 1, v8);
    }
    *(_WORD *)&a1[v10[9]] = *(_WORD *)&a2[v10[9]];
    v23 = *(int *)(v6 + 20);
    v24 = &a1[v23];
    v25 = &a2[v23];
    v38(&a1[v23], &a2[v23], v8);
    v36(&v24[v10[5]], &v25[v10[5]], v14);
    v26 = v10[6];
    v27 = *(void **)&v25[v26];
    *(_QWORD *)&v24[v26] = v27;
    v24[v10[7]] = v25[v10[7]];
    v28 = v10[8];
    v29 = &v24[v28];
    v30 = &v25[v28];
    v31 = v27;
    if (v20(v30, 1, v8))
    {
      v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
      memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    }
    else
    {
      v38(v29, v30, v8);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v35 + 56))(v29, 0, 1, v8);
    }
    *(_WORD *)&v24[v10[9]] = *(_WORD *)&v25[v10[9]];
    *(_QWORD *)&a1[*(int *)(v6 + 24)] = *(_QWORD *)&a2[*(int *)(v6 + 24)];
    v33 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56);
    swift_bridgeObjectRetain();
    v33(a1, 0, 2, v6);
  }
  return a1;
}

_BYTE *sub_1CF4FCF88(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_BYTE *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  unsigned int (*v23)(char *, uint64_t, uint64_t);
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t (*v40)(char *, uint64_t, uint64_t);
  int v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  id v50;
  uint64_t v51;
  void (*v52)(_BYTE *, _QWORD, uint64_t, uint64_t);
  uint64_t v53;
  void (*v54)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  int v65;
  int v66;
  size_t v67;
  char *v68;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(char *, char *);
  char *v73;
  void *__src;
  void (*__srca)(char *, char *, uint64_t);
  unsigned int (*v76)(char *, uint64_t, uint64_t);
  uint64_t (*v77)(char *, uint64_t, uint64_t);
  void (*v78)(char *, char *, uint64_t);
  void (*v79)(_BYTE *, _BYTE *, uint64_t);

  v6 = _s8MetadataV9CloudItemVMa_2(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 2, v6);
  v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_1CF3C7E20((uint64_t)a1, _s8MetadataV9CloudItemVMa_2);
      goto LABEL_7;
    }
    v26 = sub_1CF524A70();
    v27 = *(_QWORD *)(v26 - 8);
    v79 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v27 + 24);
    v79(a1, a2, v26);
    v28 = (int *)_s8MetadataV9CloudItemV6ObjectVMa_2(0);
    v29 = v28[5];
    v30 = &a1[v29];
    v31 = &a2[v29];
    v32 = sub_1CF524AB8();
    __srca = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v32 - 8) + 24);
    __srca(v30, v31, v32);
    v33 = v28[6];
    v34 = *(void **)&a2[v33];
    v35 = *(void **)&a1[v33];
    *(_QWORD *)&a1[v33] = v34;
    v36 = v34;

    a1[v28[7]] = a2[v28[7]];
    v37 = v28[8];
    v38 = &a1[v37];
    v39 = &a2[v37];
    v71 = v27;
    v40 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v27 + 48);
    LODWORD(v27) = v40(&a1[v37], 1, v26);
    v77 = v40;
    v41 = v40(v39, 1, v26);
    if ((_DWORD)v27)
    {
      if (!v41)
      {
        (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v38, v39, v26);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v71 + 56))(v38, 0, 1, v26);
LABEL_19:
        v54 = v79;
        goto LABEL_20;
      }
    }
    else
    {
      if (!v41)
      {
        v54 = v79;
        v79(v38, v39, v26);
LABEL_20:
        *(_WORD *)&a1[v28[9]] = *(_WORD *)&a2[v28[9]];
        v55 = *(int *)(v6 + 20);
        v56 = &a1[v55];
        v57 = &a2[v55];
        v54(&a1[v55], &a2[v55], v26);
        __srca(&v56[v28[5]], &v57[v28[5]], v32);
        v58 = v28[6];
        v59 = *(void **)&v57[v58];
        v60 = *(void **)&v56[v58];
        *(_QWORD *)&v56[v58] = v59;
        v61 = v59;

        v56[v28[7]] = v57[v28[7]];
        v62 = v28[8];
        v63 = v26;
        v64 = &v57[v62];
        v73 = &v56[v62];
        v65 = ((uint64_t (*)(void))v40)();
        v66 = v77(v64, 1, v63);
        if (v65)
        {
          if (!v66)
          {
            (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v73, v64, v63);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v71 + 56))(v73, 0, 1, v63);
            goto LABEL_29;
          }
          v67 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790) - 8) + 64);
          v68 = v73;
        }
        else
        {
          if (!v66)
          {
            v79(v73, v64, v63);
            goto LABEL_29;
          }
          (*(void (**)(char *, uint64_t))(v71 + 8))(v73, v63);
          v67 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790) - 8) + 64);
          v68 = v73;
        }
        memcpy(v68, v64, v67);
LABEL_29:
        *(_WORD *)&v56[v28[9]] = *(_WORD *)&v57[v28[9]];
        *(_QWORD *)&a1[*(int *)(v6 + 24)] = *(_QWORD *)&a2[*(int *)(v6 + 24)];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        return a1;
      }
      (*(void (**)(char *, uint64_t))(v71 + 8))(v38, v26);
    }
    v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v53 - 8) + 64));
    goto LABEL_19;
  }
  if (v10)
  {
LABEL_7:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v11 = sub_1CF524A70();
  v12 = *(_QWORD *)(v11 - 8);
  v78 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
  v78(a1, a2, v11);
  v13 = (int *)_s8MetadataV9CloudItemV6ObjectVMa_2(0);
  v14 = v13[5];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = sub_1CF524AB8();
  v72 = *(void (**)(char *, char *))(*(_QWORD *)(v17 - 8) + 16);
  __src = (void *)v17;
  v72(v15, v16);
  v18 = v13[6];
  v19 = *(void **)&a2[v18];
  *(_QWORD *)&a1[v18] = v19;
  a1[v13[7]] = a2[v13[7]];
  v20 = v13[8];
  v21 = &a1[v20];
  v22 = &a2[v20];
  v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  v24 = v19;
  v76 = v23;
  v70 = v12;
  if (v23(v22, 1, v11))
  {
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
  }
  else
  {
    v78(v21, v22, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v21, 0, 1, v11);
  }
  *(_WORD *)&a1[v13[9]] = *(_WORD *)&a2[v13[9]];
  v42 = *(int *)(v6 + 20);
  v43 = &a1[v42];
  v44 = &a2[v42];
  v78(&a1[v42], &a2[v42], v11);
  ((void (*)(char *, char *, void *))v72)(&v43[v13[5]], &v44[v13[5]], __src);
  v45 = v13[6];
  v46 = *(void **)&v44[v45];
  *(_QWORD *)&v43[v45] = v46;
  v43[v13[7]] = v44[v13[7]];
  v47 = v13[8];
  v48 = &v43[v47];
  v49 = &v44[v47];
  v50 = v46;
  if (v76(v49, 1, v11))
  {
    v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v48, v49, *(_QWORD *)(*(_QWORD *)(v51 - 8) + 64));
  }
  else
  {
    v78(v48, v49, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v70 + 56))(v48, 0, 1, v11);
  }
  *(_WORD *)&v43[v13[9]] = *(_WORD *)&v44[v13[9]];
  *(_QWORD *)&a1[*(int *)(v6 + 24)] = *(_QWORD *)&a2[*(int *)(v6 + 24)];
  v52 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v7 + 56);
  swift_bridgeObjectRetain();
  v52(a1, 0, 2, v6);
  return a1;
}

char *sub_1CF4FD514(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v27;
  unsigned int (*v28)(char *, uint64_t, uint64_t);
  void (*v29)(char *, char *, uint64_t);
  void (*v30)(char *, char *, uint64_t);

  v6 = _s8MetadataV9CloudItemVMa_2(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = sub_1CF524A70();
    v9 = *(_QWORD *)(v8 - 8);
    v30 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v30(a1, a2, v8);
    v10 = (int *)_s8MetadataV9CloudItemV6ObjectVMa_2(0);
    v11 = v10[5];
    v12 = &a1[v11];
    v13 = &a2[v11];
    v14 = sub_1CF524AB8();
    v29 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32);
    v29(v12, v13, v14);
    *(_QWORD *)&a1[v10[6]] = *(_QWORD *)&a2[v10[6]];
    a1[v10[7]] = a2[v10[7]];
    v15 = v10[8];
    v16 = &a1[v15];
    v17 = &a2[v15];
    v28 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48);
    v27 = v9;
    if (v28(&a2[v15], 1, v8))
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      v30(v16, v17, v8);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v16, 0, 1, v8);
    }
    *(_WORD *)&a1[v10[9]] = *(_WORD *)&a2[v10[9]];
    v19 = *(int *)(v6 + 20);
    v20 = &a1[v19];
    v21 = &a2[v19];
    v30(&a1[v19], &a2[v19], v8);
    v29(&v20[v10[5]], &v21[v10[5]], v14);
    *(_QWORD *)&v20[v10[6]] = *(_QWORD *)&v21[v10[6]];
    v20[v10[7]] = v21[v10[7]];
    v22 = v10[8];
    v23 = &v20[v22];
    v24 = &v21[v22];
    if (v28(&v21[v22], 1, v8))
    {
      v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
      memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    }
    else
    {
      v30(v23, v24, v8);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v23, 0, 1, v8);
    }
    *(_WORD *)&v20[v10[9]] = *(_WORD *)&v21[v10[9]];
    *(_QWORD *)&a1[*(int *)(v6 + 24)] = *(_QWORD *)&a2[*(int *)(v6 + 24)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

_BYTE *sub_1CF4FD7A4(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_BYTE *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  char *v32;
  char *v33;
  uint64_t (*v34)(char *, uint64_t, uint64_t);
  int v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  char *v51;
  int v52;
  int v53;
  size_t v54;
  char *v55;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  unsigned int (*__src)(char *, uint64_t, uint64_t);
  void (*__srca)(char *, char *, uint64_t);
  void (*v62)(char *, char *, uint64_t);
  uint64_t (*v63)(char *, uint64_t, uint64_t);
  void (*v64)(char *, char *, uint64_t);
  void (*v65)(_BYTE *, _BYTE *, uint64_t);

  v6 = _s8MetadataV9CloudItemVMa_2(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 2, v6);
  v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (v10)
    {
      sub_1CF3C7E20((uint64_t)a1, _s8MetadataV9CloudItemVMa_2);
      goto LABEL_7;
    }
    v22 = sub_1CF524A70();
    v23 = *(_QWORD *)(v22 - 8);
    v65 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v23 + 40);
    v65(a1, a2, v22);
    v24 = (int *)_s8MetadataV9CloudItemV6ObjectVMa_2(0);
    v25 = v24[5];
    v26 = &a1[v25];
    v27 = &a2[v25];
    v28 = sub_1CF524AB8();
    __srca = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 40);
    __srca(v26, v27, v28);
    v29 = v24[6];
    v30 = *(void **)&a1[v29];
    *(_QWORD *)&a1[v29] = *(_QWORD *)&a2[v29];

    a1[v24[7]] = a2[v24[7]];
    v31 = v24[8];
    v32 = &a1[v31];
    v33 = &a2[v31];
    v57 = v23;
    v34 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
    LODWORD(v23) = v34(&a1[v31], 1, v22);
    v63 = v34;
    v35 = v34(v33, 1, v22);
    if ((_DWORD)v23)
    {
      if (!v35)
      {
        (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v32, v33, v22);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v57 + 56))(v32, 0, 1, v22);
LABEL_19:
        v44 = v65;
        goto LABEL_20;
      }
    }
    else
    {
      if (!v35)
      {
        v44 = v65;
        v65(v32, v33, v22);
LABEL_20:
        *(_WORD *)&a1[v24[9]] = *(_WORD *)&a2[v24[9]];
        v45 = *(int *)(v6 + 20);
        v46 = &a1[v45];
        v47 = &a2[v45];
        v44(&a1[v45], &a2[v45], v22);
        __srca(&v46[v24[5]], &v47[v24[5]], v28);
        v48 = v24[6];
        v49 = *(void **)&v46[v48];
        *(_QWORD *)&v46[v48] = *(_QWORD *)&v47[v48];

        v46[v24[7]] = v47[v24[7]];
        v50 = v24[8];
        v51 = &v47[v50];
        v59 = &v46[v50];
        v52 = ((uint64_t (*)(void))v34)();
        v53 = v63(v51, 1, v22);
        if (v52)
        {
          if (!v53)
          {
            (*(void (**)(char *, char *, uint64_t))(v57 + 32))(v59, v51, v22);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v57 + 56))(v59, 0, 1, v22);
            goto LABEL_29;
          }
          v54 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790) - 8) + 64);
          v55 = v59;
        }
        else
        {
          if (!v53)
          {
            v65(v59, v51, v22);
            goto LABEL_29;
          }
          (*(void (**)(char *, uint64_t))(v57 + 8))(v59, v22);
          v54 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790) - 8) + 64);
          v55 = v59;
        }
        memcpy(v55, v51, v54);
LABEL_29:
        *(_WORD *)&v46[v24[9]] = *(_WORD *)&v47[v24[9]];
        *(_QWORD *)&a1[*(int *)(v6 + 24)] = *(_QWORD *)&a2[*(int *)(v6 + 24)];
        swift_bridgeObjectRelease();
        return a1;
      }
      (*(void (**)(char *, uint64_t))(v57 + 8))(v32, v22);
    }
    v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v43 - 8) + 64));
    goto LABEL_19;
  }
  if (v10)
  {
LABEL_7:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v11 = sub_1CF524A70();
  v12 = *(_QWORD *)(v11 - 8);
  v64 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
  v64(a1, a2, v11);
  v13 = (int *)_s8MetadataV9CloudItemV6ObjectVMa_2(0);
  v14 = v13[5];
  v15 = &a1[v14];
  v16 = &a2[v14];
  v17 = sub_1CF524AB8();
  v62 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32);
  v62(v15, v16, v17);
  *(_QWORD *)&a1[v13[6]] = *(_QWORD *)&a2[v13[6]];
  a1[v13[7]] = a2[v13[7]];
  v18 = v13[8];
  v19 = &a1[v18];
  v20 = &a2[v18];
  __src = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
  v58 = v12;
  if (__src(&a2[v18], 1, v11))
  {
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    v64(v19, v20, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v19, 0, 1, v11);
  }
  *(_WORD *)&a1[v13[9]] = *(_WORD *)&a2[v13[9]];
  v36 = *(int *)(v6 + 20);
  v37 = &a1[v36];
  v38 = &a2[v36];
  v64(&a1[v36], &a2[v36], v11);
  v62(&v37[v13[5]], &v38[v13[5]], v17);
  *(_QWORD *)&v37[v13[6]] = *(_QWORD *)&v38[v13[6]];
  v37[v13[7]] = v38[v13[7]];
  v39 = v13[8];
  v40 = &v37[v39];
  v41 = &v38[v39];
  if (__src(&v38[v39], 1, v11))
  {
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v40, v41, *(_QWORD *)(*(_QWORD *)(v42 - 8) + 64));
  }
  else
  {
    v64(v40, v41, v11);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v58 + 56))(v40, 0, 1, v11);
  }
  *(_WORD *)&v37[v13[9]] = *(_WORD *)&v38[v13[9]];
  *(_QWORD *)&a1[*(int *)(v6 + 24)] = *(_QWORD *)&a2[*(int *)(v6 + 24)];
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

uint64_t sub_1CF4FDD14()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF4FDD20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_3Tm(a1, a2, a3, _s8MetadataV9CloudItemVMa_2);
}

uint64_t sub_1CF4FDD2C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF4FDD38(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_4Tm(a1, a2, a3, a4, _s8MetadataV9CloudItemVMa_2);
}

uint64_t sub_1CF4FDD44(uint64_t a1, uint64_t a2)
{
  return sub_1CF3C9E60(a1, a2, _s8MetadataV9CloudItemVMa_2);
}

uint64_t sub_1CF4FDD50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1CF3C9EA4(a1, a2, a3, _s8MetadataV9CloudItemVMa_2);
}

uint64_t _s8MetadataV15CloudItemStatusOMa_2(uint64_t a1)
{
  return sub_1CF3CB49C(a1, qword_1EFB944C8);
}

uint64_t sub_1CF4FDD70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1CF3C9EF0(a1, a2, a3, _s8MetadataV9CloudItemVMa_2);
}

char *sub_1CF4FDD7C(char *a1, char **a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  int *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  char *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = &v9[(v6 + 16) & ~(unint64_t)v6];
    swift_retain();
  }
  else
  {
    v7 = (int *)_s8MetadataV9LocalItemVMa_2(0);
    v8 = *((_QWORD *)v7 - 1);
    if ((*(unsigned int (**)(char **, uint64_t, int *))(v8 + 48))(a2, 2, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v10 = *a2;
      *(_QWORD *)a1 = *a2;
      v11 = v7[5];
      v12 = &a1[v11];
      v13 = (char *)a2 + v11;
      v14 = sub_1CF524A70();
      v15 = *(_QWORD *)(v14 - 8);
      v16 = *(void (**)(char *, char *, uint64_t))(v15 + 16);
      v17 = v10;
      v16(v12, v13, v14);
      a1[v7[6]] = *((_BYTE *)a2 + v7[6]);
      v18 = v7[7];
      v19 = &a1[v18];
      v20 = (char *)a2 + v18;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v20, 1, v14))
      {
        v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
        memcpy(v19, v20, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
      }
      else
      {
        v16(v19, v20, v14);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v19, 0, 1, v14);
      }
      (*(void (**)(char *, _QWORD, uint64_t, int *))(v8 + 56))(a1, 0, 2, v7);
    }
  }
  return a1;
}

uint64_t sub_1CF4FDEF8(id *a1)
{
  uint64_t v2;
  uint64_t result;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void (*v8)(char *, uint64_t);

  v2 = _s8MetadataV9LocalItemVMa_2(0);
  result = (*(uint64_t (**)(id *, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 2, v2);
  if (!(_DWORD)result)
  {

    v4 = (char *)a1 + *(int *)(v2 + 20);
    v5 = sub_1CF524A70();
    v6 = *(_QWORD *)(v5 - 8);
    v8 = *(void (**)(char *, uint64_t))(v6 + 8);
    v8(v4, v5);
    v7 = (char *)a1 + *(int *)(v2 + 28);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v7, 1, v5);
    if (!(_DWORD)result)
      return ((uint64_t (*)(char *, uint64_t))v8)(v7, v5);
  }
  return result;
}

void **sub_1CF4FDFCC(void **a1, void **a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  id v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = (int *)_s8MetadataV9LocalItemVMa_2(0);
  v7 = *((_QWORD *)v6 - 1);
  if ((*(unsigned int (**)(void **, uint64_t, int *))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = *a2;
    *a1 = *a2;
    v9 = v6[5];
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = sub_1CF524A70();
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
    v15 = v8;
    v14(v10, v11, v12);
    *((_BYTE *)a1 + v6[6]) = *((_BYTE *)a2 + v6[6]);
    v16 = v6[7];
    v17 = (char *)a1 + v16;
    v18 = (char *)a2 + v16;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v18, 1, v12))
    {
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
      memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    }
    else
    {
      v14(v17, v18, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v17, 0, 1, v12);
    }
    (*(void (**)(void **, _QWORD, uint64_t, int *))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

void **sub_1CF4FE124(void **a1, void **a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t (*v8)(void **, uint64_t, int *);
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  id v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  size_t v23;
  void **v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(char *, char *, uint64_t);
  uint64_t v34;
  char *v35;
  uint64_t (*v36)(char *, uint64_t, uint64_t);
  int v37;

  v6 = (int *)_s8MetadataV9LocalItemVMa_2(0);
  v7 = *((_QWORD *)v6 - 1);
  v8 = *(uint64_t (**)(void **, uint64_t, int *))(v7 + 48);
  v9 = v8(a1, 2, v6);
  v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (!v10)
    {
      v25 = *a2;
      v26 = *a1;
      *a1 = *a2;
      v27 = v25;

      v28 = v6[5];
      v29 = (char *)a1 + v28;
      v30 = (char *)a2 + v28;
      v31 = sub_1CF524A70();
      v32 = *(_QWORD *)(v31 - 8);
      v33 = *(void (**)(char *, char *, uint64_t))(v32 + 24);
      v33(v29, v30, v31);
      *((_BYTE *)a1 + v6[6]) = *((_BYTE *)a2 + v6[6]);
      v34 = v6[7];
      v35 = (char *)a1 + v34;
      a2 = (void **)((char *)a2 + v34);
      v36 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v32 + 48);
      LODWORD(v29) = v36((char *)a1 + v34, 1, v31);
      v37 = v36((char *)a2, 1, v31);
      if ((_DWORD)v29)
      {
        if (!v37)
        {
          (*(void (**)(char *, void **, uint64_t))(v32 + 16))(v35, a2, v31);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v32 + 56))(v35, 0, 1, v31);
          return a1;
        }
      }
      else
      {
        if (!v37)
        {
          v33(v35, (char *)a2, v31);
          return a1;
        }
        (*(void (**)(char *, uint64_t))(v32 + 8))(v35, v31);
      }
      v23 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790) - 8) + 64);
      v24 = (void **)v35;
      goto LABEL_8;
    }
    sub_1CF3C7E20((uint64_t)a1, _s8MetadataV9LocalItemVMa_2);
LABEL_7:
    v23 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64);
    v24 = a1;
LABEL_8:
    memcpy(v24, a2, v23);
    return a1;
  }
  if (v10)
    goto LABEL_7;
  v11 = *a2;
  *a1 = *a2;
  v12 = v6[5];
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  v15 = sub_1CF524A70();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
  v18 = v11;
  v17(v13, v14, v15);
  *((_BYTE *)a1 + v6[6]) = *((_BYTE *)a2 + v6[6]);
  v19 = v6[7];
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v21, 1, v15))
  {
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    v17(v20, v21, v15);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v20, 0, 1, v15);
  }
  (*(void (**)(void **, _QWORD, uint64_t, int *))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

_QWORD *sub_1CF4FE3A4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;

  v6 = (int *)_s8MetadataV9LocalItemVMa_2(0);
  v7 = *((_QWORD *)v6 - 1);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, int *))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    *a1 = *a2;
    v8 = v6[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_1CF524A70();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(void (**)(char *, char *, uint64_t))(v12 + 32);
    v13(v9, v10, v11);
    *((_BYTE *)a1 + v6[6]) = *((_BYTE *)a2 + v6[6]);
    v14 = v6[7];
    v15 = (char *)a1 + v14;
    v16 = (char *)a2 + v14;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v16, 1, v11))
    {
      v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      v13(v15, v16, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v15, 0, 1, v11);
    }
    (*(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

_QWORD *sub_1CF4FE4F8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD *, uint64_t, int *);
  int v9;
  int v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  size_t v21;
  char *v22;
  void *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  uint64_t v30;
  char *v31;
  uint64_t (*v32)(char *, uint64_t, uint64_t);
  int v33;

  v6 = (int *)_s8MetadataV9LocalItemVMa_2(0);
  v7 = *((_QWORD *)v6 - 1);
  v8 = *(uint64_t (**)(_QWORD *, uint64_t, int *))(v7 + 48);
  v9 = v8(a1, 2, v6);
  v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (!v10)
    {
      v23 = (void *)*a1;
      *a1 = *a2;

      v24 = v6[5];
      v25 = (char *)a1 + v24;
      v26 = (char *)a2 + v24;
      v27 = sub_1CF524A70();
      v28 = *(_QWORD *)(v27 - 8);
      v29 = *(void (**)(char *, char *, uint64_t))(v28 + 40);
      v29(v25, v26, v27);
      *((_BYTE *)a1 + v6[6]) = *((_BYTE *)a2 + v6[6]);
      v30 = v6[7];
      v31 = (char *)a1 + v30;
      a2 = (_QWORD *)((char *)a2 + v30);
      v32 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
      LODWORD(v25) = v32((char *)a1 + v30, 1, v27);
      v33 = v32((char *)a2, 1, v27);
      if ((_DWORD)v25)
      {
        if (!v33)
        {
          (*(void (**)(char *, _QWORD *, uint64_t))(v28 + 32))(v31, a2, v27);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56))(v31, 0, 1, v27);
          return a1;
        }
      }
      else
      {
        if (!v33)
        {
          v29(v31, (char *)a2, v27);
          return a1;
        }
        (*(void (**)(char *, uint64_t))(v28 + 8))(v31, v27);
      }
      v21 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790) - 8) + 64);
      v22 = v31;
      goto LABEL_8;
    }
    sub_1CF3C7E20((uint64_t)a1, _s8MetadataV9LocalItemVMa_2);
LABEL_7:
    v21 = *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64);
    v22 = (char *)a1;
LABEL_8:
    memcpy(v22, a2, v21);
    return a1;
  }
  if (v10)
    goto LABEL_7;
  *a1 = *a2;
  v11 = v6[5];
  v12 = (char *)a1 + v11;
  v13 = (char *)a2 + v11;
  v14 = sub_1CF524A70();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(void (**)(char *, char *, uint64_t))(v15 + 32);
  v16(v12, v13, v14);
  *((_BYTE *)a1 + v6[6]) = *((_BYTE *)a2 + v6[6]);
  v17 = v6[7];
  v18 = (char *)a1 + v17;
  v19 = (char *)a2 + v17;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v19, 1, v14))
  {
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  else
  {
    v16(v18, v19, v14);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v18, 0, 1, v14);
  }
  (*(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

uint64_t sub_1CF4FE770()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF4FE77C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_3Tm(a1, a2, a3, _s8MetadataV9LocalItemVMa_2);
}

uint64_t sub_1CF4FE788()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF4FE794(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_4Tm(a1, a2, a3, a4, _s8MetadataV9LocalItemVMa_2);
}

uint64_t sub_1CF4FE7A0(uint64_t a1, uint64_t a2)
{
  return sub_1CF3C9E60(a1, a2, _s8MetadataV9LocalItemVMa_2);
}

uint64_t sub_1CF4FE7AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1CF3C9EA4(a1, a2, a3, _s8MetadataV9LocalItemVMa_2);
}

uint64_t sub_1CF4FE7B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1CF3C9EF0(a1, a2, a3, _s8MetadataV9LocalItemVMa_2);
}

void **sub_1CF4FE7C4(void **a1, void **a2, int *a3)
{
  int v3;
  char *v4;
  void **v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, char *, uint64_t);
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_1CF524A70();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(void (**)(char *, char *, uint64_t))(v12 + 16);
    v14 = v4;
    v13(v9, v10, v11);
    v15 = a3[7];
    *((_BYTE *)v7 + a3[6]) = *((_BYTE *)a2 + a3[6]);
    v16 = (char *)v7 + v15;
    v17 = (char *)a2 + v15;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v17, 1, v11))
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      v13(v16, v17, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v16, 0, 1, v11);
    }
  }
  return v7;
}

uint64_t sub_1CF4FE8E8(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  void (*v9)(char *, uint64_t);

  v4 = (char *)a1 + *(int *)(a2 + 20);
  v5 = sub_1CF524A70();
  v6 = *(_QWORD *)(v5 - 8);
  v9 = *(void (**)(char *, uint64_t))(v6 + 8);
  v9(v4, v5);
  v7 = (char *)a1 + *(int *)(a2 + 28);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v7, 1, v5);
  if (!(_DWORD)result)
    return ((uint64_t (*)(char *, uint64_t))v9)(v7, v5);
  return result;
}

void **sub_1CF4FE998(void **a1, void **a2, int *a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  id v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;

  v6 = *a2;
  *a1 = *a2;
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_1CF524A70();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v13 = v6;
  v12(v8, v9, v10);
  v14 = a3[7];
  *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
  v15 = (char *)a1 + v14;
  v16 = (char *)a2 + v14;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v16, 1, v10))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    v12(v15, v16, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v15, 0, 1, v10);
  }
  return a1;
}

void **sub_1CF4FEA94(void **a1, void **a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t (*v18)(char *, uint64_t, uint64_t);
  int v19;
  uint64_t v20;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = v6;

  v9 = a3[5];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_1CF524A70();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(void (**)(char *, char *, uint64_t))(v13 + 24);
  v14(v10, v11, v12);
  *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
  v15 = a3[7];
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v13 + 48);
  LODWORD(v10) = v18((char *)a1 + v15, 1, v12);
  v19 = v18(v17, 1, v12);
  if (!(_DWORD)v10)
  {
    if (!v19)
    {
      v14(v16, v17, v12);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v17, v12);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v16, 0, 1, v12);
  return a1;
}

_QWORD *sub_1CF4FEBD8(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1CF524A70();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(void (**)(char *, char *, uint64_t))(v10 + 32);
  v11(v7, v8, v9);
  v12 = a3[7];
  *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
  v13 = (char *)a1 + v12;
  v14 = (char *)a2 + v12;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v14, 1, v9))
  {
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    v11(v13, v14, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v13, 0, 1, v9);
  }
  return a1;
}

void **sub_1CF4FECC8(void **a1, void **a2, int *a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t (*v16)(char *, uint64_t, uint64_t);
  int v17;
  uint64_t v18;

  v6 = *a1;
  *a1 = *a2;

  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_1CF524A70();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(void (**)(char *, char *, uint64_t))(v11 + 40);
  v12(v8, v9, v10);
  v13 = a3[7];
  *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  LODWORD(v8) = v16((char *)a1 + v13, 1, v10);
  v17 = v16(v15, 1, v10);
  if (!(_DWORD)v8)
  {
    if (!v17)
    {
      v12(v14, v15, v10);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v14, v15, v10);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v14, 0, 1, v10);
  return a1;
}

uint64_t sub_1CF4FEE04()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF4FEE10(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_1CF524A70();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 20);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 28);
    }
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(&a1[v11], a2, v10);
  }
}

uint64_t sub_1CF4FEEB4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_1CF4FEEC0(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v8 = sub_1CF524A70();
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 28);
    }
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(&v5[v11], a2, a2, v10);
  }
  return result;
}

void sub_1CF4FEF60()
{
  unint64_t v0;
  unint64_t v1;

  sub_1CF524A70();
  if (v0 <= 0x3F)
  {
    sub_1CF3D5B68();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t *sub_1CF4FEFFC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  _BYTE *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v5 = *(int *)(a3 + 20);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    v8 = sub_1CF524A70();
    v9 = *(_QWORD *)(v8 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
      memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(_BYTE *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
    }
  }
  return v3;
}

uint64_t sub_1CF4FF0E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_1CF524A70();
  v4 = *(_QWORD *)(v3 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  return result;
}

_BYTE *sub_1CF4FF150(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_1CF524A70();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 16))(v5, v6, v7);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

_BYTE *sub_1CF4FF20C(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(_BYTE *, uint64_t, uint64_t);
  int v10;
  int v11;
  uint64_t v12;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_1CF524A70();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v8 + 48);
  v10 = v9(v5, 1, v7);
  v11 = v9(v6, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 24))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    return a1;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 16))(v5, v6, v7);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  return a1;
}

_BYTE *sub_1CF4FF314(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_1CF524A70();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

_BYTE *sub_1CF4FF3D0(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(_BYTE *, uint64_t, uint64_t);
  int v10;
  int v11;
  uint64_t v12;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_1CF524A70();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v8 + 48);
  v10 = v9(v5, 1, v7);
  v11 = v9(v6, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 40))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    return a1;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 32))(v5, v6, v7);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  return a1;
}

uint64_t sub_1CF4FF4D8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF4FF4E4(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  BOOL v5;
  int v6;
  uint64_t v10;

  if ((_DWORD)a2 == 254)
  {
    v4 = *a1;
    v5 = v4 >= 2;
    v6 = (v4 + 2147483646) & 0x7FFFFFFF;
    if (v5)
      return (v6 + 1);
    else
      return 0;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    return (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v10);
  }
}

uint64_t sub_1CF4FF564()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_BYTE *sub_1CF4FF570(_BYTE *result, uint64_t a2, int a3, uint64_t a4)
{
  _BYTE *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 254)
  {
    *result = a2 + 1;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    return (_BYTE *)(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

void sub_1CF4FF5E4()
{
  unint64_t v0;

  sub_1CF3D5B68();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

char *sub_1CF4FF658(char *a1, char *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  char *v18;
  char *v19;
  unsigned int (*v20)(char *, uint64_t, uint64_t);
  id v21;
  uint64_t v22;
  uint64_t v23;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v23 = *(_QWORD *)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    a1 = (char *)(v23 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1CF524A70();
    v8 = *(_QWORD *)(v7 - 8);
    v9 = *(void (**)(char *, char *, uint64_t))(v8 + 16);
    v9(a1, a2, v7);
    v10 = a3[5];
    v11 = &a1[v10];
    v12 = &a2[v10];
    v13 = sub_1CF524AB8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    v14 = a3[6];
    v15 = a3[7];
    v16 = *(void **)&a2[v14];
    *(_QWORD *)&a1[v14] = v16;
    a1[v15] = a2[v15];
    v17 = a3[8];
    v18 = &a1[v17];
    v19 = &a2[v17];
    v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
    v21 = v16;
    if (v20(v19, 1, v7))
    {
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      v9(v18, v19, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v18, 0, 1, v7);
    }
    *(_WORD *)&a1[a3[9]] = *(_WORD *)&a2[a3[9]];
  }
  return a1;
}

uint64_t sub_1CF4FF7B0(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  void (*v10)(uint64_t, uint64_t);

  v4 = sub_1CF524A70();
  v5 = *(_QWORD *)(v4 - 8);
  v10 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v10(a1, v4);
  v6 = a1 + a2[5];
  v7 = sub_1CF524AB8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);

  v8 = a1 + a2[8];
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v8, 1, v4);
  if (!(_DWORD)result)
    return ((uint64_t (*)(uint64_t, uint64_t))v10)(v8, v4);
  return result;
}

char *sub_1CF4FF880(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  unsigned int (*v19)(const void *, uint64_t, uint64_t);
  id v20;
  uint64_t v21;

  v6 = sub_1CF524A70();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 16);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_1CF524AB8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
  v13 = a3[6];
  v14 = a3[7];
  v15 = *(void **)&a2[v13];
  *(_QWORD *)&a1[v13] = v15;
  a1[v14] = a2[v14];
  v16 = a3[8];
  v17 = &a1[v16];
  v18 = &a2[v16];
  v19 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  v20 = v15;
  if (v19(v18, 1, v6))
  {
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    v8(v17, v18, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v17, 0, 1, v6);
  }
  *(_WORD *)&a1[a3[9]] = *(_WORD *)&a2[a3[9]];
  return a1;
}

char *sub_1CF4FF9AC(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t (*v20)(const void *, uint64_t, uint64_t);
  int v21;
  int v22;
  uint64_t v23;

  v6 = sub_1CF524A70();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_1CF524AB8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  v13 = a3[6];
  v14 = *(void **)&a2[v13];
  v15 = *(void **)&a1[v13];
  *(_QWORD *)&a1[v13] = v14;
  v16 = v14;

  a1[a3[7]] = a2[a3[7]];
  v17 = a3[8];
  v18 = &a1[v17];
  v19 = &a2[v17];
  v20 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  v21 = v20(&a1[v17], 1, v6);
  v22 = v20(v19, 1, v6);
  if (!v21)
  {
    if (!v22)
    {
      v8(v18, v19, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v18, v6);
    goto LABEL_6;
  }
  if (v22)
  {
LABEL_6:
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v18, v19, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v18, 0, 1, v6);
LABEL_7:
  *(_WORD *)&a1[a3[9]] = *(_WORD *)&a2[a3[9]];
  return a1;
}

char *sub_1CF4FFB28(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;

  v6 = sub_1CF524A70();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_1CF524AB8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  v13 = a3[7];
  *(_QWORD *)&a1[a3[6]] = *(_QWORD *)&a2[a3[6]];
  a1[v13] = a2[v13];
  v14 = a3[8];
  v15 = &a1[v14];
  v16 = &a2[v14];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(&a2[v14], 1, v6))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    v8(v15, v16, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v15, 0, 1, v6);
  }
  *(_WORD *)&a1[a3[9]] = *(_WORD *)&a2[a3[9]];
  return a1;
}

char *sub_1CF4FFC48(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t (*v18)(const void *, uint64_t, uint64_t);
  int v19;
  int v20;
  uint64_t v21;

  v6 = sub_1CF524A70();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  v9 = a3[5];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_1CF524AB8();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 40))(v10, v11, v12);
  v13 = a3[6];
  v14 = *(void **)&a1[v13];
  *(_QWORD *)&a1[v13] = *(_QWORD *)&a2[v13];

  v15 = a3[8];
  a1[a3[7]] = a2[a3[7]];
  v16 = &a1[v15];
  v17 = &a2[v15];
  v18 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  v19 = v18(&a1[v15], 1, v6);
  v20 = v18(v17, 1, v6);
  if (!v19)
  {
    if (!v20)
    {
      v8(v16, v17, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v16, v6);
    goto LABEL_6;
  }
  if (v20)
  {
LABEL_6:
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v16, v17, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v16, 0, 1, v6);
LABEL_7:
  *(_WORD *)&a1[a3[9]] = *(_WORD *)&a2[a3[9]];
  return a1;
}

uint64_t sub_1CF4FFDBC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF4FFDC8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v6 = sub_1CF524A70();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_1CF524AB8();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v13 = a3[5];
LABEL_10:
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    v12 = *(_QWORD *)(v8 - 8);
    v13 = a3[8];
    goto LABEL_10;
  }
  v14 = *(_QWORD *)(a1 + a3[6]);
  if (v14 >= 0xFFFFFFFF)
    LODWORD(v14) = -1;
  return (v14 + 1);
}

uint64_t sub_1CF4FFE98()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF4FFEA4(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;

  v8 = sub_1CF524A70();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    result = sub_1CF524AB8();
    v14 = *(_QWORD *)(result - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = result;
      v15 = a4[5];
    }
    else
    {
      if (a3 == 0x7FFFFFFF)
      {
        *(_QWORD *)(a1 + a4[6]) = (a2 - 1);
        return result;
      }
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = a4[8];
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_1CF4FFF70()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;

  sub_1CF524A70();
  if (v0 <= 0x3F)
  {
    sub_1CF524AB8();
    if (v1 <= 0x3F)
    {
      sub_1CF3D5B68();
      if (v2 <= 0x3F)
        swift_initStructMetadata();
    }
  }
}

uint64_t *sub_1CF500034(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  char *v28;
  unsigned int (*v29)(char *, uint64_t, uint64_t);
  id v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  id v40;
  uint64_t v41;
  void (*v42)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v43;
  void **v44;
  void **v45;
  int *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(char *, char *, uint64_t);
  id v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v61;
  char *__dst;
  void (*v63)(char *, char *);
  unsigned int (*v64)(char *, uint64_t, uint64_t);
  uint64_t v65;
  void *v66;
  char *v67;
  void (*v68)(char *, char *, uint64_t);
  uint64_t v69;
  char *v70;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1CF523C54();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = _s8MetadataV9CloudItemVMa_2(0);
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 2, v11))
    {
      v13 = _s8MetadataV15CloudItemStatusOMa_2(0);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      v69 = v11;
      v65 = v12;
      v15 = sub_1CF524A70();
      v16 = *(_QWORD *)(v15 - 8);
      v68 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
      v68(v9, v10, v15);
      v17 = (int *)_s8MetadataV9CloudItemV6ObjectVMa_2(0);
      v18 = v17[5];
      v19 = &v9[v18];
      v20 = &v10[v18];
      v21 = sub_1CF524AB8();
      v22 = v19;
      v23 = v15;
      v24 = v16;
      v66 = (void *)v21;
      v63 = *(void (**)(char *, char *))(*(_QWORD *)(v21 - 8) + 16);
      v63(v22, v20);
      v25 = v17[6];
      v26 = *(void **)&v10[v25];
      *(_QWORD *)&v9[v25] = v26;
      v9[v17[7]] = v10[v17[7]];
      v27 = v17[8];
      __dst = &v9[v27];
      v28 = &v10[v27];
      v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48);
      v30 = v26;
      v64 = v29;
      v61 = v24;
      if (v29(v28, 1, v23))
      {
        v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
        memcpy(__dst, v28, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
      }
      else
      {
        v68(__dst, v28, v23);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(__dst, 0, 1, v23);
      }
      *(_WORD *)&v9[v17[9]] = *(_WORD *)&v10[v17[9]];
      v32 = *(int *)(v69 + 20);
      v33 = &v9[v32];
      v34 = &v10[v32];
      v68(&v9[v32], &v10[v32], v23);
      ((void (*)(char *, char *, void *))v63)(&v33[v17[5]], &v34[v17[5]], v66);
      v35 = v17[6];
      v36 = *(void **)&v34[v35];
      *(_QWORD *)&v33[v35] = v36;
      v33[v17[7]] = v34[v17[7]];
      v37 = v17[8];
      v67 = &v33[v37];
      v38 = v23;
      v39 = &v34[v37];
      v40 = v36;
      if (v64(v39, 1, v38))
      {
        v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
        memcpy(v67, v39, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
      }
      else
      {
        v68(v67, v39, v38);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v61 + 56))(v67, 0, 1, v38);
      }
      *(_WORD *)&v33[v17[9]] = *(_WORD *)&v34[v17[9]];
      *(_QWORD *)&v9[*(int *)(v69 + 24)] = *(_QWORD *)&v10[*(int *)(v69 + 24)];
      v42 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v65 + 56);
      swift_bridgeObjectRetain();
      v42(v9, 0, 2, v69);
    }
    v43 = *(int *)(a3 + 24);
    v44 = (void **)((char *)a1 + v43);
    v45 = (void **)((char *)a2 + v43);
    v46 = (int *)_s8MetadataV9LocalItemVMa_2(0);
    v47 = *((_QWORD *)v46 - 1);
    if ((*(unsigned int (**)(void **, uint64_t, int *))(v47 + 48))(v45, 2, v46))
    {
      v48 = _s8MetadataV15LocalItemStatusOMa_2(0);
      memcpy(v44, v45, *(_QWORD *)(*(_QWORD *)(v48 - 8) + 64));
    }
    else
    {
      v49 = *v45;
      *v44 = *v45;
      v50 = v46[5];
      v51 = (char *)v44 + v50;
      v70 = (char *)v45 + v50;
      v52 = sub_1CF524A70();
      v53 = *(_QWORD *)(v52 - 8);
      v54 = *(void (**)(char *, char *, uint64_t))(v53 + 16);
      v55 = v49;
      v54(v51, v70, v52);
      *((_BYTE *)v44 + v46[6]) = *((_BYTE *)v45 + v46[6]);
      v56 = v46[7];
      v57 = (char *)v44 + v56;
      v58 = (char *)v45 + v56;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v53 + 48))(v58, 1, v52))
      {
        v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
        memcpy(v57, v58, *(_QWORD *)(*(_QWORD *)(v59 - 8) + 64));
      }
      else
      {
        v54(v57, v58, v52);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v53 + 56))(v57, 0, 1, v52);
      }
      (*(void (**)(void **, _QWORD, uint64_t, int *))(v47 + 56))(v44, 0, 2, v46);
    }
  }
  return a1;
}

uint64_t sub_1CF500480(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  unsigned int (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  id *v17;
  uint64_t v18;
  uint64_t result;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(char *, uint64_t);

  v4 = sub_1CF523C54();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = _s8MetadataV9CloudItemVMa_2(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v5, 2, v6))
  {
    v7 = sub_1CF524A70();
    v8 = *(_QWORD *)(v7 - 8);
    v24 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
    v24(v5, v7);
    v9 = (int *)_s8MetadataV9CloudItemV6ObjectVMa_2(0);
    v10 = v5 + v9[5];
    v11 = sub_1CF524AB8();
    v12 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8);
    v12(v10, v11);

    v13 = v5 + v9[8];
    v14 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48);
    if (!v14(v13, 1, v7))
      v24(v13, v7);
    v15 = v5 + *(int *)(v6 + 20);
    v24(v15, v7);
    v12(v15 + v9[5], v11);

    v16 = v15 + v9[8];
    if (!v14(v16, 1, v7))
      v24(v16, v7);
    swift_bridgeObjectRelease();
  }
  v17 = (id *)(a1 + *(int *)(a2 + 24));
  v18 = _s8MetadataV9LocalItemVMa_2(0);
  result = (*(uint64_t (**)(id *, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 48))(v17, 2, v18);
  if (!(_DWORD)result)
  {

    v20 = (char *)v17 + *(int *)(v18 + 20);
    v21 = sub_1CF524A70();
    v22 = *(_QWORD *)(v21 - 8);
    v25 = *(void (**)(char *, uint64_t))(v22 + 8);
    v25(v20, v21);
    v23 = (char *)v17 + *(int *)(v18 + 28);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48))(v23, 1, v21);
    if (!(_DWORD)result)
      return ((uint64_t (*)(char *, uint64_t))v25)(v23, v21);
  }
  return result;
}

uint64_t sub_1CF5006C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  unsigned int (*v27)(char *, uint64_t, uint64_t);
  id v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  char *v36;
  char *v37;
  id v38;
  uint64_t v39;
  void (*v40)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v41;
  void **v42;
  void **v43;
  int *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(char *, char *, uint64_t);
  id v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v60;
  void (*v61)(char *, char *);
  uint64_t v62;
  unsigned int (*v63)(char *, uint64_t, uint64_t);
  uint64_t v64;
  uint64_t v65;
  void (*v66)(char *, char *, uint64_t);
  uint64_t v67;
  uint64_t v68;

  v6 = sub_1CF523C54();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (char *)(a1 + v7);
  v9 = (char *)(a2 + v7);
  v10 = _s8MetadataV9CloudItemVMa_2(0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 2, v10))
  {
    v12 = _s8MetadataV15CloudItemStatusOMa_2(0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v64 = v11;
    v65 = a3;
    v67 = a1;
    v13 = sub_1CF524A70();
    v14 = *(_QWORD *)(v13 - 8);
    v66 = *(void (**)(char *, char *, uint64_t))(v14 + 16);
    v66(v8, v9, v13);
    v15 = (int *)_s8MetadataV9CloudItemV6ObjectVMa_2(0);
    v16 = v15[5];
    v17 = &v8[v16];
    v18 = &v9[v16];
    v19 = sub_1CF524AB8();
    v20 = v17;
    v21 = v14;
    v61 = *(void (**)(char *, char *))(*(_QWORD *)(v19 - 8) + 16);
    v62 = v19;
    v61(v20, v18);
    v22 = v15[6];
    v23 = *(void **)&v9[v22];
    *(_QWORD *)&v8[v22] = v23;
    v8[v15[7]] = v9[v15[7]];
    v24 = v15[8];
    v25 = &v8[v24];
    v26 = &v9[v24];
    v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
    v28 = v23;
    v63 = v27;
    v60 = v21;
    if (v27(v26, 1, v13))
    {
      v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
      memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
    }
    else
    {
      v66(v25, v26, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v25, 0, 1, v13);
    }
    *(_WORD *)&v8[v15[9]] = *(_WORD *)&v9[v15[9]];
    v30 = *(int *)(v10 + 20);
    v31 = &v8[v30];
    v32 = &v9[v30];
    v66(&v8[v30], &v9[v30], v13);
    ((void (*)(char *, char *, uint64_t))v61)(&v31[v15[5]], &v32[v15[5]], v62);
    v33 = v15[6];
    v34 = *(void **)&v32[v33];
    *(_QWORD *)&v31[v33] = v34;
    v31[v15[7]] = v32[v15[7]];
    v35 = v15[8];
    v36 = &v31[v35];
    v37 = &v32[v35];
    v38 = v34;
    if (v63(v37, 1, v13))
    {
      v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
      memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
    }
    else
    {
      v66(v36, v37, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v60 + 56))(v36, 0, 1, v13);
    }
    *(_WORD *)&v31[v15[9]] = *(_WORD *)&v32[v15[9]];
    *(_QWORD *)&v8[*(int *)(v10 + 24)] = *(_QWORD *)&v9[*(int *)(v10 + 24)];
    v40 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v64 + 56);
    swift_bridgeObjectRetain();
    v40(v8, 0, 2, v10);
    a1 = v67;
    a3 = v65;
  }
  v41 = *(int *)(a3 + 24);
  v42 = (void **)(a1 + v41);
  v43 = (void **)(a2 + v41);
  v44 = (int *)_s8MetadataV9LocalItemVMa_2(0);
  v45 = *((_QWORD *)v44 - 1);
  if ((*(unsigned int (**)(void **, uint64_t, int *))(v45 + 48))(v43, 2, v44))
  {
    v46 = _s8MetadataV15LocalItemStatusOMa_2(0);
    memcpy(v42, v43, *(_QWORD *)(*(_QWORD *)(v46 - 8) + 64));
  }
  else
  {
    v68 = a1;
    v47 = *v43;
    *v42 = *v43;
    v48 = v44[5];
    v49 = (char *)v42 + v48;
    v50 = (char *)v43 + v48;
    v51 = sub_1CF524A70();
    v52 = *(_QWORD *)(v51 - 8);
    v53 = *(void (**)(char *, char *, uint64_t))(v52 + 16);
    v54 = v47;
    v53(v49, v50, v51);
    *((_BYTE *)v42 + v44[6]) = *((_BYTE *)v43 + v44[6]);
    v55 = v44[7];
    v56 = (char *)v42 + v55;
    v57 = (char *)v43 + v55;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v52 + 48))((char *)v43 + v55, 1, v51))
    {
      v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
      memcpy(v56, v57, *(_QWORD *)(*(_QWORD *)(v58 - 8) + 64));
    }
    else
    {
      v53(v56, v57, v51);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v52 + 56))(v56, 0, 1, v51);
    }
    (*(void (**)(void **, _QWORD, uint64_t, int *))(v45 + 56))(v42, 0, 2, v44);
    return v68;
  }
  return a1;
}

uint64_t sub_1CF500AD0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  unsigned int (*v29)(char *, uint64_t, uint64_t);
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int *v35;
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t (*v47)(void);
  int v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  char *v55;
  char *v56;
  id v57;
  uint64_t v58;
  void (*v59)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v60;
  void (*v61)(char *, char *, uint64_t);
  uint64_t v62;
  char *v63;
  char *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  char *v70;
  int v71;
  size_t v72;
  char *v73;
  uint64_t v74;
  void **v75;
  void **v76;
  int *v77;
  uint64_t v78;
  uint64_t (*v79)(void **, uint64_t, int *);
  int v80;
  int v81;
  void *v82;
  uint64_t v83;
  char *v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  void (*v88)(char *, char *, uint64_t);
  id v89;
  uint64_t v90;
  char *v91;
  char *v92;
  uint64_t v93;
  size_t v94;
  void **v95;
  void **v96;
  void *v97;
  void *v98;
  id v99;
  uint64_t v100;
  char *v101;
  char *v102;
  uint64_t v103;
  uint64_t v104;
  void (*v105)(char *, char *, uint64_t);
  uint64_t v106;
  char *v107;
  void **v108;
  uint64_t (*v109)(char *, uint64_t, uint64_t);
  int v110;
  uint64_t v112;
  uint64_t v113;
  void (*v114)(char *, char *);
  uint64_t v115;
  void (*v116)(char *, char *);
  char *v117;
  unsigned int (*__src)(char *, uint64_t, uint64_t);
  void *__srca;
  void (*v120)(char *, char *, uint64_t);
  void (*v121)(char *, char *, uint64_t);
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;

  v6 = sub_1CF523C54();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (char *)(a1 + v7);
  v9 = (char *)(a2 + v7);
  v10 = _s8MetadataV9CloudItemVMa_2(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 2, v10);
  v14 = v12(v9, 2, v10);
  if (v13)
  {
    if (!v14)
    {
      v122 = a2;
      v123 = a3;
      v125 = a1;
      v15 = sub_1CF524A70();
      v16 = *(_QWORD *)(v15 - 8);
      v120 = *(void (**)(char *, char *, uint64_t))(v16 + 16);
      v120(v8, v9, v15);
      v17 = (int *)_s8MetadataV9CloudItemV6ObjectVMa_2(0);
      v18 = v17[5];
      v19 = &v8[v18];
      v20 = &v9[v18];
      v21 = sub_1CF524AB8();
      v22 = v19;
      v23 = v16;
      v114 = *(void (**)(char *, char *))(*(_QWORD *)(v21 - 8) + 16);
      v115 = v21;
      v114(v22, v20);
      v24 = v17[6];
      v25 = *(void **)&v9[v24];
      *(_QWORD *)&v8[v24] = v25;
      v8[v17[7]] = v9[v17[7]];
      v26 = v17[8];
      v27 = &v8[v26];
      v28 = &v9[v26];
      v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
      v30 = v25;
      __src = v29;
      v113 = v23;
      if (v29(v28, 1, v15))
      {
        v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
        memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
      }
      else
      {
        v120(v27, v28, v15);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v27, 0, 1, v15);
      }
      *(_WORD *)&v8[v17[9]] = *(_WORD *)&v9[v17[9]];
      v49 = *(int *)(v10 + 20);
      v50 = &v8[v49];
      v51 = &v9[v49];
      v120(&v8[v49], &v9[v49], v15);
      ((void (*)(char *, char *, uint64_t))v114)(&v50[v17[5]], &v51[v17[5]], v115);
      v52 = v17[6];
      v53 = *(void **)&v51[v52];
      *(_QWORD *)&v50[v52] = v53;
      v50[v17[7]] = v51[v17[7]];
      v54 = v17[8];
      v55 = &v50[v54];
      v56 = &v51[v54];
      v57 = v53;
      if (__src(v56, 1, v15))
      {
        v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
        memcpy(v55, v56, *(_QWORD *)(*(_QWORD *)(v58 - 8) + 64));
      }
      else
      {
        v120(v55, v56, v15);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v113 + 56))(v55, 0, 1, v15);
      }
      a3 = v123;
      *(_WORD *)&v50[v17[9]] = *(_WORD *)&v51[v17[9]];
      *(_QWORD *)&v8[*(int *)(v10 + 24)] = *(_QWORD *)&v9[*(int *)(v10 + 24)];
      v59 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56);
      swift_bridgeObjectRetain();
      v59(v8, 0, 2, v10);
      a1 = v125;
      goto LABEL_30;
    }
LABEL_7:
    v32 = _s8MetadataV15CloudItemStatusOMa_2(0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    goto LABEL_31;
  }
  if (v14)
  {
    sub_1CF3C7E20((uint64_t)v8, _s8MetadataV9CloudItemVMa_2);
    goto LABEL_7;
  }
  v122 = a2;
  v124 = a3;
  v126 = a1;
  v33 = sub_1CF524A70();
  v34 = *(_QWORD *)(v33 - 8);
  v121 = *(void (**)(char *, char *, uint64_t))(v34 + 24);
  v121(v8, v9, v33);
  v35 = (int *)_s8MetadataV9CloudItemV6ObjectVMa_2(0);
  v36 = v35[5];
  v37 = &v8[v36];
  v38 = &v9[v36];
  v39 = sub_1CF524AB8();
  v116 = *(void (**)(char *, char *))(*(_QWORD *)(v39 - 8) + 24);
  __srca = (void *)v39;
  v116(v37, v38);
  v40 = v35[6];
  v41 = *(void **)&v9[v40];
  v42 = *(void **)&v8[v40];
  *(_QWORD *)&v8[v40] = v41;
  v43 = v41;

  v8[v35[7]] = v9[v35[7]];
  v44 = v35[8];
  v45 = &v8[v44];
  v46 = &v9[v44];
  v47 = *(uint64_t (**)(void))(v34 + 48);
  LODWORD(v42) = ((uint64_t (*)(char *, uint64_t, uint64_t))v47)(&v8[v44], 1, v33);
  v48 = ((uint64_t (*)(char *, uint64_t, uint64_t))v47)(v46, 1, v33);
  v112 = v34;
  if ((_DWORD)v42)
  {
    if (!v48)
    {
      (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v45, v46, v33);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v45, 0, 1, v33);
LABEL_19:
      v61 = v121;
      goto LABEL_20;
    }
LABEL_18:
    v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v45, v46, *(_QWORD *)(*(_QWORD *)(v60 - 8) + 64));
    goto LABEL_19;
  }
  if (v48)
  {
    (*(void (**)(char *, uint64_t))(v34 + 8))(v45, v33);
    goto LABEL_18;
  }
  v61 = v121;
  v121(v45, v46, v33);
LABEL_20:
  *(_WORD *)&v8[v35[9]] = *(_WORD *)&v9[v35[9]];
  v62 = *(int *)(v10 + 20);
  v63 = &v8[v62];
  v64 = &v9[v62];
  v61(&v8[v62], &v9[v62], v33);
  ((void (*)(char *, char *, void *))v116)(&v63[v35[5]], &v64[v35[5]], __srca);
  v65 = v35[6];
  v66 = *(void **)&v64[v65];
  v67 = *(void **)&v63[v65];
  *(_QWORD *)&v63[v65] = v66;
  v68 = v66;

  v63[v35[7]] = v64[v35[7]];
  v69 = v35[8];
  v70 = &v64[v69];
  v117 = &v63[v69];
  LODWORD(v67) = v47();
  v71 = ((uint64_t (*)(char *, uint64_t, uint64_t))v47)(v70, 1, v33);
  if ((_DWORD)v67)
  {
    if (!v71)
    {
      (*(void (**)(char *, char *, uint64_t))(v112 + 16))(v117, v70, v33);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v112 + 56))(v117, 0, 1, v33);
      goto LABEL_29;
    }
    v72 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790) - 8) + 64);
    v73 = v117;
  }
  else
  {
    if (!v71)
    {
      v121(v117, v70, v33);
      goto LABEL_29;
    }
    (*(void (**)(char *, uint64_t))(v112 + 8))(v117, v33);
    v72 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790) - 8) + 64);
    v73 = v117;
  }
  memcpy(v73, v70, v72);
LABEL_29:
  *(_WORD *)&v63[v35[9]] = *(_WORD *)&v64[v35[9]];
  *(_QWORD *)&v8[*(int *)(v10 + 24)] = *(_QWORD *)&v9[*(int *)(v10 + 24)];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a3 = v124;
  a1 = v126;
LABEL_30:
  a2 = v122;
LABEL_31:
  v74 = *(int *)(a3 + 24);
  v75 = (void **)(a1 + v74);
  v76 = (void **)(a2 + v74);
  v77 = (int *)_s8MetadataV9LocalItemVMa_2(0);
  v78 = *((_QWORD *)v77 - 1);
  v79 = *(uint64_t (**)(void **, uint64_t, int *))(v78 + 48);
  v80 = v79(v75, 2, v77);
  v81 = v79(v76, 2, v77);
  if (!v80)
  {
    if (!v81)
    {
      v97 = *v76;
      v98 = *v75;
      *v75 = *v76;
      v99 = v97;

      v100 = v77[5];
      v101 = (char *)v75 + v100;
      v102 = (char *)v76 + v100;
      v103 = sub_1CF524A70();
      v104 = *(_QWORD *)(v103 - 8);
      v105 = *(void (**)(char *, char *, uint64_t))(v104 + 24);
      v105(v101, v102, v103);
      *((_BYTE *)v75 + v77[6]) = *((_BYTE *)v76 + v77[6]);
      v106 = v77[7];
      v107 = (char *)v75 + v106;
      v108 = (void **)((char *)v76 + v106);
      v109 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v104 + 48);
      LODWORD(v101) = v109(v107, 1, v103);
      v110 = v109((char *)v108, 1, v103);
      if ((_DWORD)v101)
      {
        if (!v110)
        {
          (*(void (**)(char *, void **, uint64_t))(v104 + 16))(v107, v108, v103);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v104 + 56))(v107, 0, 1, v103);
          return a1;
        }
      }
      else
      {
        if (!v110)
        {
          v105(v107, (char *)v108, v103);
          return a1;
        }
        (*(void (**)(char *, uint64_t))(v104 + 8))(v107, v103);
      }
      v94 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790) - 8) + 64);
      v95 = (void **)v107;
      v96 = v108;
      goto LABEL_38;
    }
    sub_1CF3C7E20((uint64_t)v75, _s8MetadataV9LocalItemVMa_2);
LABEL_37:
    v94 = *(_QWORD *)(*(_QWORD *)(_s8MetadataV15LocalItemStatusOMa_2(0) - 8) + 64);
    v95 = v75;
    v96 = v76;
LABEL_38:
    memcpy(v95, v96, v94);
    return a1;
  }
  if (v81)
    goto LABEL_37;
  v127 = a1;
  v82 = *v76;
  *v75 = *v76;
  v83 = v77[5];
  v84 = (char *)v75 + v83;
  v85 = (char *)v76 + v83;
  v86 = sub_1CF524A70();
  v87 = *(_QWORD *)(v86 - 8);
  v88 = *(void (**)(char *, char *, uint64_t))(v87 + 16);
  v89 = v82;
  v88(v84, v85, v86);
  *((_BYTE *)v75 + v77[6]) = *((_BYTE *)v76 + v77[6]);
  v90 = v77[7];
  v91 = (char *)v75 + v90;
  v92 = (char *)v76 + v90;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v87 + 48))((char *)v76 + v90, 1, v86))
  {
    v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v91, v92, *(_QWORD *)(*(_QWORD *)(v93 - 8) + 64));
  }
  else
  {
    v88(v91, v92, v86);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v87 + 56))(v91, 0, 1, v86);
  }
  a1 = v127;
  (*(void (**)(void **, _QWORD, uint64_t, int *))(v78 + 56))(v75, 0, 2, v77);
  return a1;
}

uint64_t sub_1CF5012FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  int *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, char *, uint64_t);
  uint64_t v45;
  char *v46;
  char *v47;
  uint64_t v48;
  uint64_t v50;
  unsigned int (*v51)(char *, uint64_t, uint64_t);
  void (*v52)(char *, char *, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(char *, char *, uint64_t);

  v6 = sub_1CF523C54();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (char *)(a1 + v7);
  v9 = (char *)(a2 + v7);
  v10 = _s8MetadataV9CloudItemVMa_2(0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 2, v10))
  {
    v12 = _s8MetadataV15CloudItemStatusOMa_2(0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v53 = v11;
    v54 = a3;
    v55 = a1;
    v13 = sub_1CF524A70();
    v14 = *(_QWORD *)(v13 - 8);
    v56 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
    v56(v8, v9, v13);
    v15 = (int *)_s8MetadataV9CloudItemV6ObjectVMa_2(0);
    v16 = v15[5];
    v17 = &v8[v16];
    v18 = &v9[v16];
    v19 = sub_1CF524AB8();
    v20 = v17;
    v21 = v14;
    v52 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32);
    v52(v20, v18, v19);
    *(_QWORD *)&v8[v15[6]] = *(_QWORD *)&v9[v15[6]];
    v8[v15[7]] = v9[v15[7]];
    v22 = v15[8];
    v23 = &v8[v22];
    v24 = &v9[v22];
    v51 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
    v50 = v21;
    if (v51(&v9[v22], 1, v13))
    {
      v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
      memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    }
    else
    {
      v56(v23, v24, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v23, 0, 1, v13);
    }
    *(_WORD *)&v8[v15[9]] = *(_WORD *)&v9[v15[9]];
    v26 = *(int *)(v10 + 20);
    v27 = &v8[v26];
    v28 = &v9[v26];
    v56(&v8[v26], &v9[v26], v13);
    v52(&v27[v15[5]], &v28[v15[5]], v19);
    *(_QWORD *)&v27[v15[6]] = *(_QWORD *)&v28[v15[6]];
    v27[v15[7]] = v28[v15[7]];
    v29 = v15[8];
    v30 = &v27[v29];
    v31 = &v28[v29];
    if (v51(&v28[v29], 1, v13))
    {
      v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
      memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v32 - 8) + 64));
    }
    else
    {
      v56(v30, v31, v13);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v50 + 56))(v30, 0, 1, v13);
    }
    *(_WORD *)&v27[v15[9]] = *(_WORD *)&v28[v15[9]];
    *(_QWORD *)&v8[*(int *)(v10 + 24)] = *(_QWORD *)&v9[*(int *)(v10 + 24)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v53 + 56))(v8, 0, 2, v10);
    a3 = v54;
    a1 = v55;
  }
  v33 = *(int *)(a3 + 24);
  v34 = (_QWORD *)(a1 + v33);
  v35 = (_QWORD *)(a2 + v33);
  v36 = (int *)_s8MetadataV9LocalItemVMa_2(0);
  v37 = *((_QWORD *)v36 - 1);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, int *))(v37 + 48))(v35, 2, v36))
  {
    v38 = _s8MetadataV15LocalItemStatusOMa_2(0);
    memcpy(v34, v35, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
  }
  else
  {
    *v34 = *v35;
    v39 = v36[5];
    v40 = (char *)v34 + v39;
    v41 = (char *)v35 + v39;
    v42 = sub_1CF524A70();
    v43 = *(_QWORD *)(v42 - 8);
    v44 = *(void (**)(char *, char *, uint64_t))(v43 + 32);
    v44(v40, v41, v42);
    *((_BYTE *)v34 + v36[6]) = *((_BYTE *)v35 + v36[6]);
    v45 = v36[7];
    v46 = (char *)v34 + v45;
    v47 = (char *)v35 + v45;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v43 + 48))(v47, 1, v42))
    {
      v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
      memcpy(v46, v47, *(_QWORD *)(*(_QWORD *)(v48 - 8) + 64));
    }
    else
    {
      v44(v46, v47, v42);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v43 + 56))(v46, 0, 1, v42);
    }
    (*(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v37 + 56))(v34, 0, 2, v36);
  }
  return a1;
}

uint64_t sub_1CF5016F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(_BYTE *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t (*v41)(void);
  int v42;
  uint64_t v43;
  char *v44;
  char *v45;
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  char *v58;
  int v59;
  int v60;
  size_t v61;
  char *v62;
  uint64_t v63;
  _QWORD *v64;
  _QWORD *v65;
  int *v66;
  uint64_t v67;
  uint64_t (*v68)(_QWORD *, uint64_t, int *);
  int v69;
  int v70;
  uint64_t v71;
  char *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(char *, char *, uint64_t);
  uint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;
  size_t v81;
  char *v82;
  char *v83;
  void *v84;
  uint64_t v85;
  char *v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  void (*v90)(char *, char *, uint64_t);
  uint64_t v91;
  char *v92;
  char *v93;
  uint64_t (*v94)(char *, uint64_t, uint64_t);
  int v95;
  uint64_t v97;
  uint64_t v98;
  uint64_t (*v99)(void);
  unsigned int (*v100)(char *, uint64_t, uint64_t);
  void (*v101)(char *, char *);
  char *v102;
  void (*__src)(char *, char *, uint64_t);
  void *__srca;
  void (*v105)(char *, char *, uint64_t);
  void (*v106)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;

  v6 = sub_1CF523C54();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_BYTE *)(a1 + v7);
  v9 = (_BYTE *)(a2 + v7);
  v10 = _s8MetadataV9CloudItemVMa_2(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 2, v10);
  v14 = v12(v9, 2, v10);
  if (!v13)
  {
    if (v14)
    {
      sub_1CF3C7E20((uint64_t)v8, _s8MetadataV9CloudItemVMa_2);
      goto LABEL_7;
    }
    v112 = a3;
    v108 = a2;
    v29 = sub_1CF524A70();
    v30 = *(_QWORD *)(v29 - 8);
    v106 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v30 + 40);
    v106(v8, v9, v29);
    v31 = (int *)_s8MetadataV9CloudItemV6ObjectVMa_2(0);
    v32 = v31[5];
    v33 = &v8[v32];
    v34 = &v9[v32];
    v35 = sub_1CF524AB8();
    v101 = *(void (**)(char *, char *))(*(_QWORD *)(v35 - 8) + 40);
    __srca = (void *)v35;
    v101(v33, v34);
    v36 = v31[6];
    v37 = *(void **)&v8[v36];
    *(_QWORD *)&v8[v36] = *(_QWORD *)&v9[v36];

    v8[v31[7]] = v9[v31[7]];
    v38 = v31[8];
    v39 = &v8[v38];
    v40 = &v9[v38];
    v97 = v30;
    v41 = *(uint64_t (**)(void))(v30 + 48);
    LODWORD(v33) = ((uint64_t (*)(_BYTE *, uint64_t, uint64_t))v41)(&v8[v38], 1, v29);
    v99 = v41;
    v42 = ((uint64_t (*)(char *, uint64_t, uint64_t))v41)(v40, 1, v29);
    v110 = a1;
    if ((_DWORD)v33)
    {
      if (!v42)
      {
        (*(void (**)(char *, char *, uint64_t))(v97 + 32))(v39, v40, v29);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v97 + 56))(v39, 0, 1, v29);
LABEL_19:
        v51 = v106;
        goto LABEL_20;
      }
    }
    else
    {
      if (!v42)
      {
        v51 = v106;
        v106(v39, v40, v29);
LABEL_20:
        *(_WORD *)&v8[v31[9]] = *(_WORD *)&v9[v31[9]];
        v52 = *(int *)(v10 + 20);
        v53 = &v8[v52];
        v54 = &v9[v52];
        v51(&v8[v52], &v9[v52], v29);
        ((void (*)(char *, char *, void *))v101)(&v53[v31[5]], &v54[v31[5]], __srca);
        v55 = v31[6];
        v56 = *(void **)&v53[v55];
        *(_QWORD *)&v53[v55] = *(_QWORD *)&v54[v55];

        v53[v31[7]] = v54[v31[7]];
        v57 = v31[8];
        v58 = &v54[v57];
        v102 = &v53[v57];
        v59 = v99();
        v60 = ((uint64_t (*)(char *, uint64_t, uint64_t))v99)(v58, 1, v29);
        if (v59)
        {
          if (!v60)
          {
            (*(void (**)(char *, char *, uint64_t))(v97 + 32))(v102, v58, v29);
            (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v97 + 56))(v102, 0, 1, v29);
            goto LABEL_29;
          }
          v61 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790) - 8) + 64);
          v62 = v102;
        }
        else
        {
          if (!v60)
          {
            v106(v102, v58, v29);
            goto LABEL_29;
          }
          (*(void (**)(char *, uint64_t))(v97 + 8))(v102, v29);
          v61 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790) - 8) + 64);
          v62 = v102;
        }
        memcpy(v62, v58, v61);
LABEL_29:
        *(_WORD *)&v53[v31[9]] = *(_WORD *)&v54[v31[9]];
        *(_QWORD *)&v8[*(int *)(v10 + 24)] = *(_QWORD *)&v9[*(int *)(v10 + 24)];
        swift_bridgeObjectRelease();
        a2 = v108;
        a1 = v110;
        a3 = v112;
        goto LABEL_30;
      }
      (*(void (**)(char *, uint64_t))(v97 + 8))(v39, v29);
    }
    v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v39, v40, *(_QWORD *)(*(_QWORD *)(v50 - 8) + 64));
    goto LABEL_19;
  }
  if (v14)
  {
LABEL_7:
    v28 = _s8MetadataV15CloudItemStatusOMa_2(0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
    goto LABEL_30;
  }
  v109 = a1;
  v111 = a3;
  v107 = a2;
  v15 = sub_1CF524A70();
  v16 = *(_QWORD *)(v15 - 8);
  v105 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
  v105(v8, v9, v15);
  v17 = (int *)_s8MetadataV9CloudItemV6ObjectVMa_2(0);
  v18 = v17[5];
  v19 = &v8[v18];
  v20 = &v9[v18];
  v21 = sub_1CF524AB8();
  v22 = v19;
  v23 = v16;
  __src = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 32);
  __src(v22, v20, v21);
  *(_QWORD *)&v8[v17[6]] = *(_QWORD *)&v9[v17[6]];
  v8[v17[7]] = v9[v17[7]];
  v24 = v17[8];
  v25 = &v8[v24];
  v26 = &v9[v24];
  v100 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
  v98 = v23;
  if (v100(&v9[v24], 1, v15))
  {
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
  }
  else
  {
    v105(v25, v26, v15);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v25, 0, 1, v15);
  }
  *(_WORD *)&v8[v17[9]] = *(_WORD *)&v9[v17[9]];
  v43 = *(int *)(v10 + 20);
  v44 = &v8[v43];
  v45 = &v9[v43];
  v105(&v8[v43], &v9[v43], v15);
  __src(&v44[v17[5]], &v45[v17[5]], v21);
  *(_QWORD *)&v44[v17[6]] = *(_QWORD *)&v45[v17[6]];
  v44[v17[7]] = v45[v17[7]];
  v46 = v17[8];
  v47 = &v44[v46];
  v48 = &v45[v46];
  if (v100(&v45[v46], 1, v15))
  {
    v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v47, v48, *(_QWORD *)(*(_QWORD *)(v49 - 8) + 64));
  }
  else
  {
    v105(v47, v48, v15);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v98 + 56))(v47, 0, 1, v15);
  }
  a3 = v111;
  *(_WORD *)&v44[v17[9]] = *(_WORD *)&v45[v17[9]];
  *(_QWORD *)&v8[*(int *)(v10 + 24)] = *(_QWORD *)&v9[*(int *)(v10 + 24)];
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 2, v10);
  a2 = v107;
  a1 = v109;
LABEL_30:
  v63 = *(int *)(a3 + 24);
  v64 = (_QWORD *)(a1 + v63);
  v65 = (_QWORD *)(a2 + v63);
  v66 = (int *)_s8MetadataV9LocalItemVMa_2(0);
  v67 = *((_QWORD *)v66 - 1);
  v68 = *(uint64_t (**)(_QWORD *, uint64_t, int *))(v67 + 48);
  v69 = v68(v64, 2, v66);
  v70 = v68(v65, 2, v66);
  if (!v69)
  {
    if (!v70)
    {
      v84 = (void *)*v64;
      *v64 = *v65;

      v85 = v66[5];
      v86 = (char *)v64 + v85;
      v87 = (char *)v65 + v85;
      v88 = sub_1CF524A70();
      v89 = *(_QWORD *)(v88 - 8);
      v90 = *(void (**)(char *, char *, uint64_t))(v89 + 40);
      v90(v86, v87, v88);
      *((_BYTE *)v64 + v66[6]) = *((_BYTE *)v65 + v66[6]);
      v91 = v66[7];
      v92 = (char *)v64 + v91;
      v93 = (char *)v65 + v91;
      v94 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v89 + 48);
      LODWORD(v86) = v94(v92, 1, v88);
      v95 = v94(v93, 1, v88);
      if ((_DWORD)v86)
      {
        if (!v95)
        {
          (*(void (**)(char *, char *, uint64_t))(v89 + 32))(v92, v93, v88);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v89 + 56))(v92, 0, 1, v88);
          return a1;
        }
      }
      else
      {
        if (!v95)
        {
          v90(v92, v93, v88);
          return a1;
        }
        (*(void (**)(char *, uint64_t))(v89 + 8))(v92, v88);
      }
      v81 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790) - 8) + 64);
      v82 = v92;
      v83 = v93;
      goto LABEL_37;
    }
    sub_1CF3C7E20((uint64_t)v64, _s8MetadataV9LocalItemVMa_2);
LABEL_36:
    v81 = *(_QWORD *)(*(_QWORD *)(_s8MetadataV15LocalItemStatusOMa_2(0) - 8) + 64);
    v82 = (char *)v64;
    v83 = (char *)v65;
LABEL_37:
    memcpy(v82, v83, v81);
    return a1;
  }
  if (v70)
    goto LABEL_36;
  *v64 = *v65;
  v71 = v66[5];
  v72 = (char *)v64 + v71;
  v73 = (char *)v65 + v71;
  v74 = sub_1CF524A70();
  v75 = *(_QWORD *)(v74 - 8);
  v76 = *(void (**)(char *, char *, uint64_t))(v75 + 32);
  v76(v72, v73, v74);
  *((_BYTE *)v64 + v66[6]) = *((_BYTE *)v65 + v66[6]);
  v77 = v66[7];
  v78 = (char *)v64 + v77;
  v79 = (char *)v65 + v77;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v75 + 48))(v79, 1, v74))
  {
    v80 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v78, v79, *(_QWORD *)(*(_QWORD *)(v80 - 8) + 64));
  }
  else
  {
    v76(v78, v79, v74);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v75 + 56))(v78, 0, 1, v74);
  }
  (*(void (**)(_QWORD *, _QWORD, uint64_t, int *))(v67 + 56))(v64, 0, 2, v66);
  return a1;
}

uint64_t sub_1CF501F04()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF501F10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = sub_1CF523C54();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v11 = _s8MetadataV15CloudItemStatusOMa_2(0);
    v12 = *(_QWORD *)(v11 - 8);
    if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
    {
      v8 = v11;
      v13 = *(int *)(a3 + 20);
    }
    else
    {
      v8 = _s8MetadataV15LocalItemStatusOMa_2(0);
      v12 = *(_QWORD *)(v8 - 8);
      v13 = *(int *)(a3 + 24);
    }
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_1CF501FA8()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF501FB4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v8 = sub_1CF523C54();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v13 = _s8MetadataV15CloudItemStatusOMa_2(0);
    v14 = *(_QWORD *)(v13 - 8);
    if (*(_DWORD *)(v14 + 84) == a3)
    {
      v10 = v13;
      v15 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = _s8MetadataV15LocalItemStatusOMa_2(0);
      v14 = *(_QWORD *)(v10 - 8);
      v15 = *(int *)(a4 + 24);
    }
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t _s8MetadataVMa_2(uint64_t a1)
{
  return sub_1CF3CB49C(a1, qword_1EFB94778);
}

uint64_t sub_1CF502068()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = sub_1CF523C54();
  if (v1 <= 0x3F)
  {
    result = _s8MetadataV15CloudItemStatusOMa_2(319);
    if (v2 <= 0x3F)
    {
      result = _s8MetadataV15LocalItemStatusOMa_2(319);
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_1CF502108()
{
  return sub_1CF3C6DA0(&qword_1EFB947B8, _s8MetadataVMa_2, (uint64_t)&unk_1CF52BF98);
}

uint64_t sub_1CF502134()
{
  return sub_1CF3C6DA0(&qword_1EFB947C0, _s8MetadataV9CloudItemV6ObjectVMa_2, (uint64_t)&unk_1CF52C000);
}

uint64_t sub_1CF502160()
{
  return sub_1CF3C6DA0(&qword_1EFB947C8, _s8MetadataV23IsMarkedAsCompleteEntryVMa, (uint64_t)&unk_1CF52C068);
}

uint64_t sub_1CF50218C()
{
  return sub_1CF3C6DA0(&qword_1EFB947D0, _s8MetadataV9LocalItemVMa_2, (uint64_t)&unk_1CF52C0D8);
}

uint64_t sub_1CF5021B8()
{
  return sub_1CF3C6DA0(&qword_1EFB947D8, _s8MetadataV15LocalItemStatusOMa_2, (uint64_t)&unk_1CF52C140);
}

uint64_t sub_1CF5021E4()
{
  return sub_1CF3C6DA0(&qword_1EFB947E0, _s8MetadataV15CloudItemStatusOMa_2, (uint64_t)&unk_1CF52C1A8);
}

uint64_t sub_1CF502210()
{
  return sub_1CF3C6DA0(&qword_1EFB947E8, _s8MetadataV9CloudItemVMa_2, (uint64_t)&unk_1CF52C210);
}

BOOL sub_1CF50223C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unsigned int (*v23)(uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  char v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;

  v4 = sub_1CF524A70();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB8FB98);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v12);
  v17 = (char *)&v29 - v16;
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v29 - v18;
  if ((sub_1CF524A34() & 1) == 0)
    return 0;
  v32 = v10;
  v20 = _s8MetadataV9CloudItemV6ObjectVMa_2(0);
  if ((sub_1CF524A94() & 1) == 0)
    return 0;
  v31 = v4;
  sub_1CF3C7E5C();
  if ((sub_1CF5253D0() & 1) == 0
    || *(unsigned __int8 *)(a1 + *(int *)(v20 + 28)) != *(unsigned __int8 *)(a2 + *(int *)(v20 + 28)))
  {
    return 0;
  }
  sub_1CF3E2B24(a1 + *(int *)(v20 + 32), (uint64_t)v19, &qword_1ED8F2790);
  v30 = v20;
  sub_1CF3E2B24(a2 + *(int *)(v20 + 32), (uint64_t)v17, &qword_1ED8F2790);
  v21 = (uint64_t)v32;
  v22 = (uint64_t)&v32[*(int *)(v8 + 48)];
  sub_1CF3E2B24((uint64_t)v19, (uint64_t)v32, &qword_1ED8F2790);
  sub_1CF3E2B24((uint64_t)v17, v22, &qword_1ED8F2790);
  v23 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  if (v23(v21, 1, v31) == 1)
  {
    sub_1CF3CB808((uint64_t)v17, &qword_1ED8F2790);
    sub_1CF3CB808((uint64_t)v19, &qword_1ED8F2790);
    if (v23(v22, 1, v31) == 1)
    {
      sub_1CF3CB808(v21, &qword_1ED8F2790);
      return *(unsigned __int16 *)(a1 + *(int *)(v30 + 36)) == *(unsigned __int16 *)(a2 + *(int *)(v30 + 36));
    }
    goto LABEL_10;
  }
  sub_1CF3E2B24(v21, (uint64_t)v14, &qword_1ED8F2790);
  if (v23(v22, 1, v31) == 1)
  {
    sub_1CF3CB808((uint64_t)v17, &qword_1ED8F2790);
    sub_1CF3CB808((uint64_t)v19, &qword_1ED8F2790);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v14, v31);
LABEL_10:
    sub_1CF3CB808(v21, &qword_1EFB8FB98);
    return 0;
  }
  v25 = v22;
  v26 = v31;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v7, v25, v31);
  sub_1CF3C6DA0((unint64_t *)&qword_1EFB8FBA0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08B8]);
  v27 = sub_1CF524E6C();
  v28 = *(void (**)(char *, uint64_t))(v5 + 8);
  v28(v7, v26);
  sub_1CF3CB808((uint64_t)v17, &qword_1ED8F2790);
  sub_1CF3CB808((uint64_t)v19, &qword_1ED8F2790);
  v28(v14, v26);
  sub_1CF3CB808(v21, &qword_1ED8F2790);
  if ((v27 & 1) != 0)
    return *(unsigned __int16 *)(a1 + *(int *)(v30 + 36)) == *(unsigned __int16 *)(a2 + *(int *)(v30 + 36));
  return 0;
}

uint64_t sub_1CF5025C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t (*v16)(char *, uint64_t, uint64_t);
  int v17;
  uint64_t v19;

  v4 = _s8MetadataV9CloudItemVMa_2(0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _s8MetadataV15CloudItemStatusOMa_2(0);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB947F0);
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = (uint64_t)&v14[*(int *)(v12 + 48)];
  sub_1CF3CB780(a1, (uint64_t)v14, _s8MetadataV15CloudItemStatusOMa_2);
  sub_1CF3CB780(a2, v15, _s8MetadataV15CloudItemStatusOMa_2);
  v16 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48);
  v17 = v16(v14, 2, v4);
  if (v17)
  {
    if (v17 == 1)
    {
      if (v16((char *)v15, 2, v4) != 1)
        goto LABEL_9;
LABEL_8:
      sub_1CF3C7E20((uint64_t)v14, _s8MetadataV15CloudItemStatusOMa_2);
      return 1;
    }
    if (v16((char *)v15, 2, v4) == 2)
      goto LABEL_8;
  }
  else
  {
    sub_1CF3CB780((uint64_t)v14, (uint64_t)v10, _s8MetadataV15CloudItemStatusOMa_2);
    if (!v16((char *)v15, 2, v4))
    {
      sub_1CF3CB7C4(v15, (uint64_t)v7, _s8MetadataV9CloudItemVMa_2);
      if (!sub_1CF50223C((uint64_t)v10, (uint64_t)v7)
        || !sub_1CF50223C((uint64_t)&v10[*(int *)(v4 + 20)], (uint64_t)&v7[*(int *)(v4 + 20)])
        || !sub_1CF3E1A38(*(_QWORD *)&v10[*(int *)(v4 + 24)], *(_QWORD *)&v7[*(int *)(v4 + 24)]))
      {
        sub_1CF3C7E20((uint64_t)v7, _s8MetadataV9CloudItemVMa_2);
        sub_1CF3C7E20((uint64_t)v10, _s8MetadataV9CloudItemVMa_2);
        sub_1CF3C7E20((uint64_t)v14, _s8MetadataV15CloudItemStatusOMa_2);
        return 0;
      }
      sub_1CF3C7E20((uint64_t)v7, _s8MetadataV9CloudItemVMa_2);
      sub_1CF3C7E20((uint64_t)v10, _s8MetadataV9CloudItemVMa_2);
      goto LABEL_8;
    }
    sub_1CF3C7E20((uint64_t)v10, _s8MetadataV9CloudItemVMa_2);
  }
LABEL_9:
  sub_1CF3CB808((uint64_t)v14, &qword_1EFB947F0);
  return 0;
}

uint64_t sub_1CF50283C()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 24))
  {
    swift_retain();
    sub_1CF525124();
    swift_release();
  }
  *(_QWORD *)(v0 + 24) = 0;
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DaemonPersistentHistoryObserver()
{
  return objc_opt_self();
}

uint64_t sub_1CF5028DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[15] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2788);
  v4[16] = swift_task_alloc();
  v5 = sub_1CF5252EC();
  v4[17] = v5;
  v4[18] = *(_QWORD *)(v5 - 8);
  v4[19] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CF502960()
{
  _QWORD *v0;
  id v1;
  _QWORD *v2;

  v1 = objc_msgSend((id)objc_opt_self(), sel_defaultCenter);
  v0[20] = sub_1CF5252F8();

  swift_retain();
  sub_1CF5252E0();
  swift_beginAccess();
  v0[21] = sub_1CF502E48();
  v2 = (_QWORD *)swift_task_alloc();
  v0[22] = v2;
  *v2 = v0;
  v2[1] = sub_1CF502A50;
  return sub_1CF5250C4();
}

uint64_t sub_1CF502A50()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    *(_QWORD *)(v2 + 184) = v0;
  return swift_task_switch();
}

uint64_t sub_1CF502AB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t Strong;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t result;
  _QWORD *v16;
  uint64_t v17;

  v1 = *(_QWORD *)(v0 + 128);
  v2 = sub_1CF524800();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 144) + 8))(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 136));
    swift_release();
LABEL_11:
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  Strong = swift_weakLoadStrong();
  if (!Strong)
  {
    v17 = *(_QWORD *)(v0 + 128);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 144) + 8))(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 136));
    swift_release();
    sub_1CF502E90(v17);
    goto LABEL_11;
  }
  v4 = Strong;
  swift_beginAccess();
  v5 = *(_QWORD *)(v4 + 16);
  v6 = *(_QWORD *)(v5 + 16);
  if (v6)
  {
    v7 = (_QWORD *)(v5 + 32);
    swift_bridgeObjectRetain();
    while (1)
    {
      v8 = __swift_project_boxed_opaque_existential_1(v7, v7[3]);
      v9 = *v8;
      __swift_project_boxed_opaque_existential_1((_QWORD *)(*v8 + 16), *(_QWORD *)(*v8 + 40));
      swift_retain();
      v10 = (void *)sub_1CF52210C();
      swift_release();
      v11 = swift_allocObject();
      *(_QWORD *)(v11 + 16) = v10;
      *(_QWORD *)(v11 + 24) = v9;
      v12 = swift_allocObject();
      *(_QWORD *)(v12 + 16) = sub_1CF502EFC;
      *(_QWORD *)(v12 + 24) = v11;
      *(_QWORD *)(v0 + 48) = sub_1CF3D3EAC;
      *(_QWORD *)(v0 + 56) = v12;
      *(_QWORD *)(v0 + 16) = MEMORY[0x1E0C809B0];
      *(_QWORD *)(v0 + 24) = 1107296256;
      *(_QWORD *)(v0 + 32) = sub_1CF4B43F0;
      *(_QWORD *)(v0 + 40) = &block_descriptor_10;
      v13 = _Block_copy((const void *)(v0 + 16));
      v14 = v10;
      swift_retain();
      swift_retain();
      swift_release();
      objc_msgSend(v14, sel_performBlockAndWait_, v13);

      _Block_release(v13);
      LOBYTE(v14) = swift_isEscapingClosureAtFileLocation();
      swift_release();
      result = swift_release();
      if ((v14 & 1) != 0)
        break;
      v7 += 5;
      if (!--v6)
      {
        swift_bridgeObjectRelease();
        goto LABEL_9;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_9:
    swift_release();
    sub_1CF502E90(*(_QWORD *)(v0 + 128));
    v16 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 192) = v16;
    *v16 = v0;
    v16[1] = sub_1CF502DE4;
    return sub_1CF5250C4();
  }
  return result;
}

uint64_t sub_1CF502D84()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 112) = *(_QWORD *)(v0 + 184);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB8F770);
  swift_dynamicCast();
  return swift_willThrowTypedImpl();
}

uint64_t sub_1CF502DE4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    *(_QWORD *)(v2 + 184) = v0;
  return swift_task_switch();
}

unint64_t sub_1CF502E48()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED8F2770;
  if (!qword_1ED8F2770)
  {
    v1 = sub_1CF5252EC();
    result = MEMORY[0x1D17D0F7C](MEMORY[0x1E0CB1EE8], v1);
    atomic_store(result, (unint64_t *)&qword_1ED8F2770);
  }
  return result;
}

uint64_t sub_1CF502E90(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2788);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1CF502ED0()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_1CF502EFC()
{
  uint64_t v0;

  sub_1CF3EC568(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1CF502F04()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_10()
{
  return swift_release();
}

uint64_t getEnumTagSinglePayload for RetryStrategy(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for RetryStrategy(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for RetryStrategy()
{
  return &type metadata for RetryStrategy;
}

uint64_t sub_1CF502F84(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[19] = a2;
  v3[20] = v2;
  v3[18] = a1;
  v3[21] = type metadata accessor for OrderRefreshTask();
  v3[22] = swift_task_alloc();
  v3[23] = swift_task_alloc();
  v3[24] = swift_task_alloc();
  v3[25] = swift_task_alloc();
  v3[26] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CF503018()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, void *, uint64_t, _QWORD);
  uint64_t v33;

  if (qword_1ED8F4448 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 200);
  v1 = *(_QWORD *)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 160);
  v4 = sub_1CF524C5C();
  *(_QWORD *)(v0 + 216) = __swift_project_value_buffer(v4, (uint64_t)qword_1ED8F2970);
  sub_1CF3CB780(v3, v1, (uint64_t (*)(_QWORD))type metadata accessor for OrderRefreshTask);
  sub_1CF3CB780(v3, v2, (uint64_t (*)(_QWORD))type metadata accessor for OrderRefreshTask);
  v5 = sub_1CF524C44();
  v6 = sub_1CF525220();
  v7 = os_log_type_enabled(v5, v6);
  v9 = *(_QWORD *)(v0 + 200);
  v8 = *(_QWORD *)(v0 + 208);
  if (v7)
  {
    v10 = swift_slowAlloc();
    v30 = swift_slowAlloc();
    v33 = v30;
    *(_DWORD *)v10 = 136315394;
    sub_1CF523C54();
    sub_1CF3C6DA0(&qword_1EFB926D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD148], MEMORY[0x1E0CAD160]);
    v11 = sub_1CF5257F0();
    *(_QWORD *)(v0 + 128) = sub_1CF3F9B9C(v11, v12, &v33);
    sub_1CF525418();
    swift_bridgeObjectRelease();
    sub_1CF3C7E20(v8, (uint64_t (*)(_QWORD))type metadata accessor for OrderRefreshTask);
    *(_WORD *)(v10 + 12) = 2080;
    sub_1CF524980();
    sub_1CF3C6DA0((unint64_t *)&qword_1EFB90630, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v13 = sub_1CF5257F0();
    *(_QWORD *)(v0 + 136) = sub_1CF3F9B9C(v13, v14, &v33);
    sub_1CF525418();
    swift_bridgeObjectRelease();
    sub_1CF3C7E20(v9, (uint64_t (*)(_QWORD))type metadata accessor for OrderRefreshTask);
    _os_log_impl(&dword_1CF3C3000, v5, v6, "Refreshing order %s from web service %s", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1D17D1060](v30, -1, -1);
    MEMORY[0x1D17D1060](v10, -1, -1);
  }
  else
  {
    sub_1CF3C7E20(*(_QWORD *)(v0 + 208), (uint64_t (*)(_QWORD))type metadata accessor for OrderRefreshTask);
    sub_1CF3C7E20(v9, (uint64_t (*)(_QWORD))type metadata accessor for OrderRefreshTask);
  }

  v15 = *(_QWORD *)(v0 + 184);
  v16 = *(_QWORD *)(v0 + 160);
  sub_1CF3CB780(v16, *(_QWORD *)(v0 + 192), (uint64_t (*)(_QWORD))type metadata accessor for OrderRefreshTask);
  sub_1CF3CB780(v16, v15, (uint64_t (*)(_QWORD))type metadata accessor for OrderRefreshTask);
  v17 = sub_1CF524C44();
  v18 = sub_1CF525220();
  v19 = os_log_type_enabled(v17, v18);
  v21 = *(_QWORD *)(v0 + 184);
  v20 = *(_QWORD *)(v0 + 192);
  if (v19)
  {
    v22 = swift_slowAlloc();
    v31 = swift_slowAlloc();
    v33 = v31;
    *(_DWORD *)v22 = 136315394;
    sub_1CF523C54();
    sub_1CF3C6DA0(&qword_1EFB926D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD148], MEMORY[0x1E0CAD160]);
    v23 = sub_1CF5257F0();
    *(_QWORD *)(v0 + 112) = sub_1CF3F9B9C(v23, v24, &v33);
    sub_1CF525418();
    swift_bridgeObjectRelease();
    sub_1CF3C7E20(v20, (uint64_t (*)(_QWORD))type metadata accessor for OrderRefreshTask);
    *(_WORD *)(v22 + 12) = 2080;
    sub_1CF524980();
    sub_1CF3C6DA0((unint64_t *)&qword_1EFB90630, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAFFF8], MEMORY[0x1E0CB0048]);
    v25 = sub_1CF5257F0();
    *(_QWORD *)(v0 + 120) = sub_1CF3F9B9C(v25, v26, &v33);
    sub_1CF525418();
    swift_bridgeObjectRelease();
    sub_1CF3C7E20(v21, (uint64_t (*)(_QWORD))type metadata accessor for OrderRefreshTask);
    _os_log_impl(&dword_1CF3C3000, v17, v18, "Fetching order %s from web service %s", (uint8_t *)v22, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1D17D1060](v31, -1, -1);
    MEMORY[0x1D17D1060](v22, -1, -1);
  }
  else
  {
    sub_1CF3C7E20(*(_QWORD *)(v0 + 192), (uint64_t (*)(_QWORD))type metadata accessor for OrderRefreshTask);
    sub_1CF3C7E20(v21, (uint64_t (*)(_QWORD))type metadata accessor for OrderRefreshTask);
  }

  v27 = swift_task_alloc();
  *(_QWORD *)(v0 + 224) = v27;
  *(_OWORD *)(v27 + 16) = *(_OWORD *)(v0 + 152);
  v32 = (uint64_t (*)(uint64_t, void *, uint64_t, _QWORD))((int)*MEMORY[0x1E0CAC4B8] + MEMORY[0x1E0CAC4B8]);
  v28 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 232) = v28;
  *v28 = v0;
  v28[1] = sub_1CF50354C;
  return v32(v0 + 56, &unk_1EFB94810, v27, MEMORY[0x1E0CAD030]);
}

uint64_t sub_1CF50354C()
{
  uint64_t v0;
  uint64_t **v1;
  uint64_t *v2;
  _QWORD *v4;

  v2 = *v1;
  v2[30] = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  sub_1CF489B44((uint64_t)(v2 + 7), (uint64_t)(v2 + 2));
  v4 = (_QWORD *)swift_task_alloc();
  v2[31] = (uint64_t)v4;
  *v4 = v2;
  v4[1] = sub_1CF503608;
  return sub_1CF503D3C((uint64_t)(v2 + 2), v2[18]);
}

uint64_t sub_1CF503608()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 256) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CF50366C()
{
  uint64_t v0;

  sub_1CF505018(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CF5036E4()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  swift_task_dealloc();
  v1 = *(void **)(v0 + 240);
  sub_1CF3CB780(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 176), (uint64_t (*)(_QWORD))type metadata accessor for OrderRefreshTask);
  v2 = v1;
  v3 = v1;
  v4 = sub_1CF524C44();
  v5 = sub_1CF525220();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(_QWORD *)(v0 + 176);
    v7 = swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v15 = v14;
    *(_DWORD *)v7 = 136315394;
    sub_1CF523C54();
    sub_1CF3C6DA0(&qword_1EFB926D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD148], MEMORY[0x1E0CAD160]);
    v9 = sub_1CF5257F0();
    *(_QWORD *)(v0 + 96) = sub_1CF3F9B9C(v9, v10, &v15);
    sub_1CF525418();
    swift_bridgeObjectRelease();
    sub_1CF3C7E20(v6, (uint64_t (*)(_QWORD))type metadata accessor for OrderRefreshTask);
    *(_WORD *)(v7 + 12) = 2112;
    v11 = v1;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 104) = v12;
    sub_1CF525418();
    *v8 = v12;

    _os_log_impl(&dword_1CF3C3000, v4, v5, "Error refreshing order %s with error %@", (uint8_t *)v7, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFB94080);
    swift_arrayDestroy();
    MEMORY[0x1D17D1060](v8, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1D17D1060](v14, -1, -1);
    MEMORY[0x1D17D1060](v7, -1, -1);
  }
  else
  {
    sub_1CF3C7E20(*(_QWORD *)(v0 + 176), (uint64_t (*)(_QWORD))type metadata accessor for OrderRefreshTask);

  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CF503978()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  sub_1CF505018(v0 + 16);
  v1 = *(void **)(v0 + 256);
  sub_1CF3CB780(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 176), (uint64_t (*)(_QWORD))type metadata accessor for OrderRefreshTask);
  v2 = v1;
  v3 = v1;
  v4 = sub_1CF524C44();
  v5 = sub_1CF525220();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(_QWORD *)(v0 + 176);
    v7 = swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v15 = v14;
    *(_DWORD *)v7 = 136315394;
    sub_1CF523C54();
    sub_1CF3C6DA0(&qword_1EFB926D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD148], MEMORY[0x1E0CAD160]);
    v9 = sub_1CF5257F0();
    *(_QWORD *)(v0 + 96) = sub_1CF3F9B9C(v9, v10, &v15);
    sub_1CF525418();
    swift_bridgeObjectRelease();
    sub_1CF3C7E20(v6, (uint64_t (*)(_QWORD))type metadata accessor for OrderRefreshTask);
    *(_WORD *)(v7 + 12) = 2112;
    v11 = v1;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 104) = v12;
    sub_1CF525418();
    *v8 = v12;

    _os_log_impl(&dword_1CF3C3000, v4, v5, "Error refreshing order %s with error %@", (uint8_t *)v7, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFB94080);
    swift_arrayDestroy();
    MEMORY[0x1D17D1060](v8, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1D17D1060](v14, -1, -1);
    MEMORY[0x1D17D1060](v7, -1, -1);
  }
  else
  {
    sub_1CF3C7E20(*(_QWORD *)(v0 + 176), (uint64_t (*)(_QWORD))type metadata accessor for OrderRefreshTask);

  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for OrderRefreshTask()
{
  uint64_t result;

  result = qword_1EFB94888;
  if (!qword_1EFB94888)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1CF503C48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  *(_QWORD *)(v3 + 56) = a1;
  v4 = a3 + *(int *)(type metadata accessor for OrderRefreshTask() + 24);
  v7 = (uint64_t (*)(uint64_t, uint64_t))((int)*MEMORY[0x1E0CAC4C8] + MEMORY[0x1E0CAC4C8]);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 64) = v5;
  *v5 = v3;
  v5[1] = sub_1CF487580;
  return v7(v3 + 16, v4);
}

uint64_t sub_1CF503CD8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v5 = *(_QWORD *)(v1 + 16);
  v4 = *(_QWORD *)(v1 + 24);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_1CF3D1338;
  return sub_1CF503C48(a1, v5, v4);
}

uint64_t sub_1CF503D3C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[9] = a2;
  v3[10] = v2;
  v3[8] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
  v3[11] = swift_task_alloc();
  type metadata accessor for OrderRefreshTask();
  v3[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CF503DBC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  _BOOL4 v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int8x16_t *v22;
  uint64_t v23;
  __int128 v24;
  int8x16_t v25;
  uint64_t v26;

  sub_1CF489B44(*(_QWORD *)(v0 + 64), v0 + 16);
  v1 = *(_QWORD *)(v0 + 16);
  *(_QWORD *)(v0 + 104) = v1;
  if (v1)
  {
    v3 = *(_QWORD *)(v0 + 72);
    v2 = *(_QWORD *)(v0 + 80);
    v4 = *(_QWORD *)(v0 + 24);
    v5 = *(_QWORD *)(v0 + 32);
    *(_QWORD *)(v0 + 112) = v4;
    *(_QWORD *)(v0 + 120) = v5;
    v24 = *(_OWORD *)(v0 + 40);
    v6 = swift_task_alloc();
    *(_QWORD *)(v0 + 128) = v6;
    *(_QWORD *)(v6 + 16) = v2;
    *(_QWORD *)(v6 + 24) = v1;
    *(_QWORD *)(v6 + 32) = v4;
    *(_QWORD *)(v6 + 40) = v5;
    *(_OWORD *)(v6 + 48) = v24;
    *(_QWORD *)(v6 + 64) = v3;
    swift_retain();
    sub_1CF40D8E4(v4, v5);
    v7 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 136) = v7;
    *v7 = v0;
    v7[1] = sub_1CF504118;
    return sub_1CF521F50();
  }
  else
  {
    if (qword_1ED8F4448 != -1)
      swift_once();
    v9 = *(_QWORD *)(v0 + 96);
    v10 = *(_QWORD *)(v0 + 80);
    v11 = sub_1CF524C5C();
    __swift_project_value_buffer(v11, (uint64_t)qword_1ED8F2970);
    sub_1CF3CB780(v10, v9, (uint64_t (*)(_QWORD))type metadata accessor for OrderRefreshTask);
    v12 = sub_1CF524C44();
    v13 = sub_1CF525220();
    v14 = os_log_type_enabled(v12, v13);
    v15 = *(_QWORD *)(v0 + 96);
    if (v14)
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v26 = v17;
      *(_DWORD *)v16 = 136315138;
      sub_1CF523C54();
      sub_1CF3C6DA0(&qword_1EFB926D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD148], MEMORY[0x1E0CAD160]);
      v18 = sub_1CF5257F0();
      *(_QWORD *)(v0 + 56) = sub_1CF3F9B9C(v18, v19, &v26);
      sub_1CF525418();
      swift_bridgeObjectRelease();
      sub_1CF3C7E20(v15, (uint64_t (*)(_QWORD))type metadata accessor for OrderRefreshTask);
      _os_log_impl(&dword_1CF3C3000, v12, v13, "Order %s not modified since last fetch", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17D1060](v17, -1, -1);
      MEMORY[0x1D17D1060](v16, -1, -1);
    }
    else
    {
      sub_1CF3C7E20(*(_QWORD *)(v0 + 96), (uint64_t (*)(_QWORD))type metadata accessor for OrderRefreshTask);
    }

    v20 = *(_QWORD *)(v0 + 88);
    v21 = sub_1CF524A70();
    v25 = *(int8x16_t *)(v0 + 72);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v20, 1, 1, v21);
    v22 = (int8x16_t *)swift_task_alloc();
    v22[1] = vextq_s8(v25, v25, 8uLL);
    v22[2].i64[0] = v20;
    sub_1CF525358();
    v23 = *(_QWORD *)(v0 + 88);
    swift_task_dealloc();
    sub_1CF3D52A0(v23);
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CF504118()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 144) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CF504184()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;

  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 120);
  swift_release();
  sub_1CF40A04C(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CF5041D8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 120);
  v2 = *(_QWORD *)(v0 + 112);
  swift_release();
  sub_1CF40A04C(v2, v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CF50423C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8[9] = a7;
  v8[10] = a8;
  v8[7] = a5;
  v8[8] = a6;
  v8[5] = a3;
  v8[6] = a4;
  v8[4] = a2;
  v8[11] = type metadata accessor for OrderRefreshTask();
  v8[12] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CF5042A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  _BOOL4 v6;
  uint64_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  if (qword_1ED8F4448 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = sub_1CF524C5C();
  __swift_project_value_buffer(v3, (uint64_t)qword_1ED8F2970);
  sub_1CF3CB780(v2, v1, (uint64_t (*)(_QWORD))type metadata accessor for OrderRefreshTask);
  v4 = sub_1CF524C44();
  v5 = sub_1CF525220();
  v6 = os_log_type_enabled(v4, v5);
  v7 = *(_QWORD *)(v0 + 96);
  if (v6)
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v21 = v9;
    *(_DWORD *)v8 = 136315138;
    sub_1CF523C54();
    sub_1CF3C6DA0(&qword_1EFB926D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD148], MEMORY[0x1E0CAD160]);
    v10 = sub_1CF5257F0();
    *(_QWORD *)(v0 + 24) = sub_1CF3F9B9C(v10, v11, &v21);
    sub_1CF525418();
    swift_bridgeObjectRelease();
    sub_1CF3C7E20(v7, (uint64_t (*)(_QWORD))type metadata accessor for OrderRefreshTask);
    _os_log_impl(&dword_1CF3C3000, v4, v5, "Updating content for order %s", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D17D1060](v9, -1, -1);
    MEMORY[0x1D17D1060](v8, -1, -1);
  }
  else
  {
    sub_1CF3C7E20(*(_QWORD *)(v0 + 96), (uint64_t (*)(_QWORD))type metadata accessor for OrderRefreshTask);
  }

  v12 = *(_QWORD *)(v0 + 72);
  v13 = *(_QWORD *)(v0 + 80);
  v19 = *(_OWORD *)(v0 + 40);
  v20 = *(_OWORD *)(v0 + 56);
  v14 = *(_QWORD *)(v0 + 32);
  v15 = swift_task_alloc();
  *(_QWORD *)(v15 + 16) = v14;
  *(_QWORD *)(v15 + 24) = v13;
  *(_OWORD *)(v15 + 32) = v19;
  *(_OWORD *)(v15 + 48) = v20;
  *(_QWORD *)(v15 + 64) = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB92B30);
  sub_1CF525358();
  v16 = *(_QWORD *)(v0 + 88);
  v17 = *(_QWORD *)(v0 + 32);
  swift_task_dealloc();
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v17 + *(int *)(v16 + 28)), *(_QWORD *)(v17 + *(int *)(v16 + 28) + 24));
  sub_1CF5230F0();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CF504578@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X8>)
{
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t refreshed;
  uint64_t v23;
  char *v24;
  uint64_t result;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  int v36;
  uint8_t *v37;
  uint64_t v38;
  unint64_t v39;
  os_log_t v40;
  uint64_t v41;
  _BYTE *v42;
  void *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  void *v47;
  id v48;
  uint64_t v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  id v60;
  _QWORD v61[3];
  uint64_t v62;
  os_log_t v63;
  int v64;
  void *v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  _OWORD v89[2];
  uint64_t v90;
  uint64_t v91;

  v75 = a7;
  v71 = a6;
  v78 = a5;
  v77 = a4;
  v76 = a3;
  v72 = a8;
  v91 = *MEMORY[0x1E0C80C00];
  v68 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB90700);
  MEMORY[0x1E0C80A78](v68);
  v70 = (uint64_t)v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for OrderNotificationCenter.Continuation(0);
  MEMORY[0x1E0C80A78](v12);
  v69 = (uint64_t)v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = sub_1CF524104();
  v73 = *(_QWORD *)(v74 - 8);
  MEMORY[0x1E0C80A78](v74);
  v15 = (_QWORD *)((char *)v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v16 = sub_1CF522D54();
  v17 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v19 = (char *)v61 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_1CF522D00();
  MEMORY[0x1E0C80A78](v20);
  v79 = (uint64_t)v61 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  refreshed = type metadata accessor for OrderRefreshTask();
  MEMORY[0x1E0C80A78](refreshed);
  v24 = (char *)v61 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = sub_1CF525148();
  if (!v8)
  {
    sub_1CF5220DC();
    v26 = (void *)sub_1CF522088();
    v65 = a2;
    if (!v26)
    {
      sub_1CF478EB0();
      swift_allocError();
      *v42 = 0;
      return swift_willThrow();
    }
    v67 = v26;
    v90 = 0;
    memset(v89, 0, sizeof(v89));
    v27 = sub_1CF523144();
    v28 = sub_1CF523138();
    v87 = v27;
    v88 = MEMORY[0x1E0CAC620];
    v86 = v28;
    v29 = sub_1CF3EDFDC();
    v30 = sub_1CF52522C();
    v31 = MEMORY[0x1E0CADC40];
    v84 = v29;
    v85 = MEMORY[0x1E0CADC40];
    v83 = v30;
    v32 = sub_1CF525238();
    v81 = v29;
    v82 = v31;
    v80 = v32;
    sub_1CF522694();
    sub_1CF522D60();
    swift_allocObject();
    v66 = sub_1CF522CDC();
    if (qword_1ED8F4448 != -1)
      swift_once();
    v33 = sub_1CF524C5C();
    __swift_project_value_buffer(v33, (uint64_t)qword_1ED8F2970);
    sub_1CF3CB780(a1, (uint64_t)v24, (uint64_t (*)(_QWORD))type metadata accessor for OrderRefreshTask);
    v34 = sub_1CF524C44();
    v35 = sub_1CF525220();
    v36 = v35;
    if (os_log_type_enabled(v34, v35))
    {
      v63 = v34;
      v64 = v36;
      v37 = (uint8_t *)swift_slowAlloc();
      v62 = swift_slowAlloc();
      *(_QWORD *)&v89[0] = v62;
      *(_DWORD *)v37 = 136315138;
      v61[2] = v37 + 4;
      v61[1] = sub_1CF523C54();
      sub_1CF3C6DA0(&qword_1EFB926D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD148], MEMORY[0x1E0CAD160]);
      v38 = sub_1CF5257F0();
      v86 = sub_1CF3F9B9C(v38, v39, (uint64_t *)v89);
      sub_1CF525418();
      swift_bridgeObjectRelease();
      sub_1CF3C7E20((uint64_t)v24, (uint64_t (*)(_QWORD))type metadata accessor for OrderRefreshTask);
      v40 = v63;
      _os_log_impl(&dword_1CF3C3000, v63, (os_log_type_t)v64, "Updating content for order %s", v37, 0xCu);
      v41 = v62;
      swift_arrayDestroy();
      MEMORY[0x1D17D1060](v41, -1, -1);
      MEMORY[0x1D17D1060](v37, -1, -1);

    }
    else
    {
      sub_1CF3C7E20((uint64_t)v24, (uint64_t (*)(_QWORD))type metadata accessor for OrderRefreshTask);

    }
    v43 = v65;
    sub_1CF522D3C();
    v44 = v79;
    v45 = v67;
    sub_1CF522D30();
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    *v15 = objc_msgSend(v45, sel_requestAttemptCount);
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v73 + 104))(v15, *MEMORY[0x1E0CAD658], v74);
    sub_1CF52411C();
    swift_allocObject();
    sub_1CF524110();
    v46 = sub_1CF5240F8();
    if (v75)
      v47 = (void *)sub_1CF524E78();
    else
      v47 = 0;
    v48 = v67;
    objc_msgSend(v67, sel_setLastModifiedValue_, v47);

    objc_msgSend(v48, sel_setRequestAttemptCount_, 0);
    objc_msgSend(v48, sel_setLastRequestAttemptDate_, 0);
    if (objc_msgSend(v43, sel_hasChanges))
    {
      *(_QWORD *)&v89[0] = 0;
      if (!objc_msgSend(v43, sel_save_, v89))
      {
        v60 = *(id *)&v89[0];
        swift_bridgeObjectRelease();
        sub_1CF5248C0();

        swift_willThrow();
        swift_release();
        sub_1CF3C7E20(v44, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAC1C0]);
        objc_msgSend(v43, sel_rollback);
        swift_willThrow();

        return swift_release();
      }
      v49 = qword_1EFB8F240;
      v50 = *(id *)&v89[0];
      if (v49 != -1)
        swift_once();
      v51 = v68;
      v52 = __swift_project_value_buffer(v68, (uint64_t)qword_1EFB9DFB0);
      v53 = *(int *)(v51 + 48);
      v54 = v70;
      v55 = v70 + v53;
      v56 = v52 + v53;
      sub_1CF3D3ECC(v52, v70);
      sub_1CF3CB780(v56, v55, type metadata accessor for OrderNotificationCenter.Continuation);
      v57 = v69;
      sub_1CF43E6E0(v55, v69);
      __swift_destroy_boxed_opaque_existential_1(v54);
      v58 = v79;
      sub_1CF451828(v79, v57);
      sub_1CF3C7E20(v57, type metadata accessor for OrderNotificationCenter.Continuation);
      v59 = v67;
      objc_msgSend(v43, sel_refreshObject_mergeChanges_, v67, 0);

      swift_release();
      swift_release();
      result = sub_1CF3C7E20(v58, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAC1C0]);
    }
    else
    {
      sub_1CF3C7E20(v44, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAC1C0]);

      swift_release();
      result = swift_release();
    }
    *v72 = v46;
  }
  return result;
}

void sub_1CF504DE4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _BYTE *v15;
  id v16;
  id v17[2];

  v17[1] = *(id *)MEMORY[0x1E0C80C00];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF525148();
  if (!v3)
  {
    sub_1CF5220DC();
    v9 = (void *)sub_1CF522088();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, sel_setRequestAttemptCount_, 0);
      sub_1CF3CB844(a3, (uint64_t)v8);
      v11 = sub_1CF524A70();
      v12 = *(_QWORD *)(v11 - 8);
      v13 = 0;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v8, 1, v11) != 1)
      {
        v13 = (void *)sub_1CF524A10();
        (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v11);
      }
      objc_msgSend(v10, sel_setLastRequestAttemptDate_, v13);

      if (objc_msgSend(a2, sel_hasChanges))
      {
        v17[0] = 0;
        if (objc_msgSend(a2, sel_save_, v17))
        {
          v14 = v17[0];
          objc_msgSend(a2, sel_refreshObject_mergeChanges_, v10, 0);
        }
        else
        {
          v16 = v17[0];
          sub_1CF5248C0();

          swift_willThrow();
          objc_msgSend(a2, sel_rollback);
          swift_willThrow();
        }
      }

    }
    else
    {
      sub_1CF478EB0();
      swift_allocError();
      *v15 = 0;
      swift_willThrow();
    }
  }
}

uint64_t sub_1CF505018(uint64_t a1)
{
  sub_1CF493BEC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
  return a1;
}

void sub_1CF505048()
{
  uint64_t v0;

  sub_1CF504DE4(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_1CF505064(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_1CF3CE884;
  return sub_1CF50423C(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_1CF5050F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_1CF504578(*(_QWORD *)(v1 + 16), *(void **)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64), a1);
}

uint64_t *sub_1CF50511C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1CF523C54();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_1CF524980();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = a3[6];
    v13 = (char *)a1 + v12;
    v14 = (char *)a2 + v12;
    v15 = sub_1CF523A50();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
    v16 = a3[7];
    v17 = *(_OWORD *)((char *)a2 + v16 + 24);
    *(_OWORD *)((char *)a1 + v16 + 24) = v17;
    (**(void (***)(void))(v17 - 8))();
  }
  return a1;
}

uint64_t sub_1CF50521C(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_1CF523C54();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + a2[5];
  v6 = sub_1CF524980();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = a1 + a2[6];
  v8 = sub_1CF523A50();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  return __swift_destroy_boxed_opaque_existential_1(a1 + a2[7]);
}

uint64_t sub_1CF5052B0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;

  v6 = sub_1CF523C54();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1CF524980();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_1CF523A50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
  v15 = a3[7];
  v16 = *(_OWORD *)(a2 + v15 + 24);
  *(_OWORD *)(a1 + v15 + 24) = v16;
  (**(void (***)(void))(v16 - 8))();
  return a1;
}

uint64_t sub_1CF505384(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = sub_1CF523C54();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1CF524980();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_1CF523A50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 24))(v12, v13, v14);
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + a3[7]), (uint64_t *)(a2 + a3[7]));
  return a1;
}

uint64_t sub_1CF505444(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;

  v6 = sub_1CF523C54();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1CF524980();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_1CF523A50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = *(_OWORD *)(v17 + 16);
  *(_OWORD *)v16 = *(_OWORD *)v17;
  *(_OWORD *)(v16 + 16) = v18;
  *(_QWORD *)(v16 + 32) = *(_QWORD *)(v17 + 32);
  return a1;
}

uint64_t sub_1CF505510(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;

  v6 = sub_1CF523C54();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_1CF524980();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = sub_1CF523A50();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 40))(v12, v13, v14);
  v15 = a3[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  __swift_destroy_boxed_opaque_existential_1(a1 + v15);
  v18 = *(_OWORD *)(v17 + 16);
  *(_OWORD *)v16 = *(_OWORD *)v17;
  *(_OWORD *)(v16 + 16) = v18;
  *(_QWORD *)(v16 + 32) = *(_QWORD *)(v17 + 32);
  return a1;
}

uint64_t sub_1CF5055E4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF5055F0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v16;

  v6 = sub_1CF523C54();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_1CF524980();
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v13 = a3[5];
LABEL_7:
    v10 = a1 + v13;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = sub_1CF523A50();
  v12 = *(_QWORD *)(v14 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v14;
    v13 = a3[6];
    goto LABEL_7;
  }
  v16 = *(_QWORD *)(a1 + a3[7] + 24);
  if (v16 >= 0xFFFFFFFF)
    LODWORD(v16) = -1;
  return (v16 + 1);
}

uint64_t sub_1CF5056C0()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF5056CC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;

  v8 = sub_1CF523C54();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  v13 = sub_1CF524980();
  v14 = *(_QWORD *)(v13 - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = v13;
    v15 = a4[5];
LABEL_7:
    v12 = a1 + v15;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  result = sub_1CF523A50();
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v15 = a4[6];
    goto LABEL_7;
  }
  *(_QWORD *)(a1 + a4[7] + 24) = (a2 - 1);
  return result;
}

uint64_t sub_1CF505798()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = sub_1CF523C54();
  if (v1 <= 0x3F)
  {
    result = sub_1CF524980();
    if (v2 <= 0x3F)
    {
      result = sub_1CF523A50();
      if (v3 <= 0x3F)
      {
        swift_initStructMetadata();
        return 0;
      }
    }
  }
  return result;
}

uint64_t *sub_1CF505840(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *, char *, uint64_t);
  uint64_t v11;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    v6 = *(int *)(a3 + 20);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = sub_1CF524A70();
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_1CF5058DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_1CF524A70();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_1CF505924(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = *(int *)(a3 + 20);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = sub_1CF524A70();
  v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

_QWORD *sub_1CF505994(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_1CF524A70();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *sub_1CF505A10(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1CF524A70();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *sub_1CF505A6C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_1CF524A70();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_1CF505AD8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF505AE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_1CF524A70();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t sub_1CF505B60()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF505B6C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = sub_1CF524A70();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for BankConnectConsentTokenOutdatedTimeoutTask()
{
  uint64_t result;

  result = qword_1EFB94920;
  if (!qword_1EFB94920)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1CF505C1C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1CF524A70();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_1CF505C90(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12[2];

  v12[1] = *(id *)MEMORY[0x1E0C80C00];
  v4 = sub_1CF52339C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF522298();
  v8 = sub_1CF5221E4();
  if (!v2)
  {
    v9 = (void *)v8;
    if (v8)
    {
      (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0CAC830], v4);
      sub_1CF522214();
      v12[0] = 0;
      if (objc_msgSend(a2, sel_save_, v12))
      {
        v10 = v12[0];
      }
      else
      {
        v11 = v12[0];
        sub_1CF5248C0();

        swift_willThrow();
      }

    }
  }
}

uint64_t sub_1CF505DD4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1;
  v4 = v1[1];
  *a1 = v3;
  a1[1] = v4;
  type metadata accessor for BankConnectWebServiceTaskIdentifier(0);
  swift_storeEnumTagMultiPayload();
  return swift_bridgeObjectRetain();
}

uint64_t sub_1CF505E14()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB8F9E8);
  type metadata accessor for BankConnectWebServiceTaskExclusivityIdentifier(0);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1CF528560;
  swift_storeEnumTagMultiPayload();
  v1 = sub_1CF42EA10(v0);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return v1;
}

uint64_t sub_1CF505ED0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = v2 + *(int *)(a1 + 20);
  v5 = sub_1CF524A70();
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(a2, v4, v5);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v6 + 56))(a2, 0, 1, v5);
}

uint64_t sub_1CF505F34(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_1CF505F4C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 24);
  __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 16), *(_QWORD *)(*(_QWORD *)(v0 + 16) + 24));
  swift_retain();
  v2 = (void *)sub_1CF52210C();
  swift_release();
  v3 = swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = v2;
  sub_1CF525358();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_1CF505FFC()
{
  swift_bridgeObjectRetain();
  sub_1CF524F38();
  swift_bridgeObjectRelease();
  return 0xD00000000000002BLL;
}

uint64_t sub_1CF506068(uint64_t a1)
{
  uint64_t result;

  result = sub_1CF3C6DA0(&qword_1EFB90B48, (uint64_t (*)(uint64_t))type metadata accessor for BankConnectConsentTokenOutdatedTimeoutTask, (uint64_t)&unk_1CF52C39C);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1CF5060A4(uint64_t a1)
{
  uint64_t result;

  result = sub_1CF3C6DA0(qword_1EFB949B8, (uint64_t (*)(uint64_t))type metadata accessor for BankConnectConsentTokenOutdatedTimeoutTask, (uint64_t)&unk_1CF52C358);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

void sub_1CF5060E0()
{
  uint64_t v0;

  sub_1CF505C90(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_1CF5060F8()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_release();

  sub_1CF506174(v0 + 80);
  __swift_destroy_boxed_opaque_existential_1(v0 + 120);
  __swift_destroy_boxed_opaque_existential_1(v0 + 160);
  __swift_destroy_boxed_opaque_existential_1(v0 + 200);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DaemonFinanceStoreImplementation()
{
  return objc_opt_self();
}

uint64_t sub_1CF506174(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F4670);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t destroy for DaemonFinanceStoreEnvironmentImplementation(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  swift_release();

  if (*(_QWORD *)(a1 + 88))
    __swift_destroy_boxed_opaque_existential_1(a1 + 64);
  __swift_destroy_boxed_opaque_existential_1(a1 + 104);
  __swift_destroy_boxed_opaque_existential_1(a1 + 144);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 184);
}

uint64_t initializeWithCopy for DaemonFinanceStoreEnvironmentImplementation(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(void **)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v5;
  v6 = *(void **)(a2 + 56);
  *(_QWORD *)(a1 + 56) = v6;
  v7 = *(_QWORD *)(a2 + 88);
  swift_retain();
  v8 = v5;
  v9 = v6;
  if (v7)
  {
    v10 = *(_QWORD *)(a2 + 96);
    *(_QWORD *)(a1 + 88) = v7;
    *(_QWORD *)(a1 + 96) = v10;
    (**(void (***)(uint64_t, uint64_t, uint64_t))(v7 - 8))(a1 + 64, a2 + 64, v7);
  }
  else
  {
    v11 = *(_OWORD *)(a2 + 80);
    *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
    *(_OWORD *)(a1 + 80) = v11;
    *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  }
  v12 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 128) = v12;
  (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 104, a2 + 104);
  v13 = *(_OWORD *)(a2 + 168);
  *(_OWORD *)(a1 + 168) = v13;
  (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 144, a2 + 144);
  v14 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 208) = v14;
  (**(void (***)(uint64_t, uint64_t))(v14 - 8))(a1 + 184, a2 + 184);
  return a1;
}

uint64_t assignWithCopy for DaemonFinanceStoreEnvironmentImplementation(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;

  __swift_assign_boxed_opaque_existential_1((uint64_t *)a1, (uint64_t *)a2);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
  v4 = *(void **)(a2 + 48);
  v5 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = v4;
  v6 = v4;

  v7 = *(void **)(a1 + 56);
  v8 = *(void **)(a2 + 56);
  *(_QWORD *)(a1 + 56) = v8;
  v9 = v8;

  v10 = *(_QWORD *)(a2 + 88);
  if (!*(_QWORD *)(a1 + 88))
  {
    if (v10)
    {
      *(_QWORD *)(a1 + 88) = v10;
      *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
      (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 64, a2 + 64);
      goto LABEL_8;
    }
LABEL_7:
    v11 = *(_OWORD *)(a2 + 64);
    v12 = *(_OWORD *)(a2 + 80);
    *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
    *(_OWORD *)(a1 + 64) = v11;
    *(_OWORD *)(a1 + 80) = v12;
    goto LABEL_8;
  }
  if (!v10)
  {
    __swift_destroy_boxed_opaque_existential_1(a1 + 64);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 64), (uint64_t *)(a2 + 64));
LABEL_8:
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 104), (uint64_t *)(a2 + 104));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 144), (uint64_t *)(a2 + 144));
  __swift_assign_boxed_opaque_existential_1((uint64_t *)(a1 + 184), (uint64_t *)(a2 + 184));
  return a1;
}

__n128 __swift_memcpy224_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __n128 result;
  __int128 v10;
  __int128 v11;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v8;
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  result = *(__n128 *)(a2 + 160);
  v10 = *(_OWORD *)(a2 + 176);
  v11 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v11;
  *(__n128 *)(a1 + 160) = result;
  *(_OWORD *)(a1 + 176) = v10;
  return result;
}

uint64_t assignWithTake for DaemonFinanceStoreEnvironmentImplementation(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  swift_release();
  v6 = *(void **)(a1 + 48);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);

  v7 = *(void **)(a1 + 56);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);

  if (*(_QWORD *)(a1 + 88))
    __swift_destroy_boxed_opaque_existential_1(a1 + 64);
  v8 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v8;
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  __swift_destroy_boxed_opaque_existential_1(a1 + 104);
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  __swift_destroy_boxed_opaque_existential_1(a1 + 144);
  v9 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 160) = v9;
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  __swift_destroy_boxed_opaque_existential_1(a1 + 184);
  *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);
  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  return a1;
}

uint64_t getEnumTagSinglePayload for DaemonFinanceStoreEnvironmentImplementation(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 224))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DaemonFinanceStoreEnvironmentImplementation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 216) = 0;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 224) = 1;
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
    *(_BYTE *)(result + 224) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for DaemonFinanceStoreEnvironmentImplementation()
{
  return &type metadata for DaemonFinanceStoreEnvironmentImplementation;
}

uint64_t sub_1CF506610@<X0>(__int16 *a1@<X0>, char *a2@<X8>)
{
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
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  char v16;
  void (*v17)(char *, uint64_t);
  uint64_t v19;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1CF524A70();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v19 - v12;
  if (*a1 < 1)
  {
    v14 = type metadata accessor for TokenBucket.State();
    sub_1CF3CB844((uint64_t)a1 + *(int *)(v14 + 20), (uint64_t)v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    {
      sub_1CF3D52A0((uint64_t)v6);
    }
    else
    {
      v15 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
      v15(v13, v6, v7);
      sub_1CF524A04();
      v16 = sub_1CF524A1C();
      v17 = *(void (**)(char *, uint64_t))(v8 + 8);
      v17(v13, v7);
      if ((v16 & 1) != 0)
      {
        v15(a2, v11, v7);
        return (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a2, 0, 1, v7);
      }
      v17(v11, v7);
    }
  }
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(a2, 1, 1, v7);
}

uint64_t type metadata accessor for TokenBucket.State()
{
  uint64_t result;

  result = qword_1EFB94A18;
  if (!qword_1EFB94A18)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t *sub_1CF506834(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_WORD *)a1 = *(_WORD *)a2;
    v5 = *(int *)(a3 + 20);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    v8 = sub_1CF524A70();
    v9 = *(_QWORD *)(v8 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
      memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
    }
  }
  return v3;
}

_WORD *sub_1CF50691C(_WORD *a1, _WORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1CF524A70();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v5, v6, v7);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

_WORD *sub_1CF5069D8(_WORD *a1, _WORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(char *, uint64_t, uint64_t);
  int v10;
  int v11;
  uint64_t v12;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1CF524A70();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48);
  v10 = v9(v5, 1, v7);
  v11 = v9(v6, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 24))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v5, v6, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  return a1;
}

_WORD *sub_1CF506AE0(_WORD *a1, _WORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1CF524A70();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

_WORD *sub_1CF506B9C(_WORD *a1, _WORD *a2, uint64_t a3)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(char *, uint64_t, uint64_t);
  int v10;
  int v11;
  uint64_t v12;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = sub_1CF524A70();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48);
  v10 = v9(v5, 1, v7);
  v11 = v9(v6, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 40))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v5, v6, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  return a1;
}

uint64_t sub_1CF506CA4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF506CB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a1 + *(int *)(a3 + 20);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, a2, v5);
}

uint64_t sub_1CF506CF4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF506D00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a1 + *(int *)(a4 + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, a2, a2, v6);
}

void sub_1CF506D48()
{
  unint64_t v0;

  sub_1CF3D5B68();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_1CF506DC0(__int16 *a1, uint64_t a2, __int16 a3, double a4)
{
  int v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t result;
  double v20;
  double v21;
  double v22;
  __int16 v23;
  int v24;
  int v25;
  uint64_t v26;

  LOWORD(v5) = a3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v26 - v12;
  v14 = sub_1CF524A70();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = (uint64_t)a1 + *(int *)(type metadata accessor for TokenBucket.State() + 20);
  sub_1CF3CB844(v18, (uint64_t)v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1)
  {
    sub_1CF3D52A0((uint64_t)v13);
    *a1 = v5;
    sub_1CF3D52A0(v18);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v18, a2, v14);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v15 + 56))(v18, 0, 1, v14);
  }
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v17, v13, v14);
  result = sub_1CF5249EC();
  v21 = v20 * a4;
  v22 = 0.0;
  if (v20 * a4 < 0.0)
    goto LABEL_8;
  v22 = 32767.0;
  if (v21 > 32767.0)
    goto LABEL_8;
  if ((~*(_QWORD *)&v21 & 0x7FF0000000000000) != 0)
  {
    if (v21 <= -32769.0)
    {
LABEL_13:
      __break(1u);
      goto LABEL_14;
    }
    v22 = v20 * a4;
    if (v21 >= 32768.0)
    {
LABEL_14:
      __break(1u);
LABEL_15:
      __break(1u);
      goto LABEL_16;
    }
LABEL_8:
    v23 = *a1;
    v24 = (__int16)v5 - *a1;
    if ((__int16)(v5 - *a1) == v24)
    {
      v25 = (int)v22;
      if ((int)v22 > (__int16)v24 || (v5 = v25 + v23, v5 == (__int16)(v25 + v23)))
      {
        *a1 = v5;
        sub_1CF524A04();
        (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v11, 0, 1, v14);
        return sub_1CF3E31B8((uint64_t)v11, v18);
      }
      goto LABEL_15;
    }
    __break(1u);
    goto LABEL_13;
  }
LABEL_16:
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for TokenBucket()
{
  return &type metadata for TokenBucket;
}

uint64_t BankConnectServiceImplementation.loadTransactions(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v3[2] = v2;
  v6 = sub_1CF523E7C();
  v3[3] = v6;
  v3[4] = *(_QWORD *)(v6 - 8);
  v7 = swift_task_alloc();
  v3[5] = v7;
  v8 = (_QWORD *)swift_task_alloc();
  v3[6] = v8;
  *v8 = v3;
  v8[1] = sub_1CF5070D8;
  return sub_1CF460048(v7, a1, a2);
}

uint64_t sub_1CF5070D8()
{
  uint64_t v0;
  uint64_t **v1;
  uint64_t *v2;
  _QWORD *v4;

  v2 = *v1;
  v2[7] = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  v4 = (_QWORD *)swift_task_alloc();
  v2[8] = (uint64_t)v4;
  *v4 = v2;
  v4[1] = sub_1CF3F8C64;
  return BankConnectServiceImplementation.loadTransactions(for:)(v2[5]);
}

uint64_t BankConnectServiceImplementation.loadTransactions(for:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[6] = a1;
  v2[7] = v1;
  v3 = sub_1CF5220E8();
  v2[8] = v3;
  v2[9] = *(_QWORD *)(v3 - 8);
  v2[10] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
  v2[11] = swift_task_alloc();
  v4 = sub_1CF5240C8();
  v2[12] = v4;
  v2[13] = *(_QWORD *)(v4 - 8);
  v2[14] = swift_task_alloc();
  v5 = sub_1CF524A70();
  v2[15] = v5;
  v2[16] = *(_QWORD *)(v5 - 8);
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  v6 = sub_1CF523E7C();
  v2[20] = v6;
  v2[21] = *(_QWORD *)(v6 - 8);
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CF5072A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint8_t *v19;
  uint64_t v20;
  unint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 192);
  v3 = *(_QWORD *)(v0 + 160);
  v4 = *(_QWORD *)(v0 + 152);
  v5 = *(_QWORD *)(v0 + 56);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 168) + 16);
  *(_QWORD *)(v0 + 200) = v6;
  v6(v2, v1, v3);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v5 + 16), *(_QWORD *)(v5 + 40));
  swift_retain();
  v7 = (void *)sub_1CF52210C();
  *(_QWORD *)(v0 + 208) = v7;
  swift_release();
  sub_1CF524A4C();
  v8 = (_QWORD *)swift_task_alloc();
  v8[2] = v7;
  v8[3] = v2;
  v8[4] = v4;
  sub_1CF525358();
  swift_task_dealloc();
  if (*(_BYTE *)(v0 + 272) == 1)
  {
    if (qword_1EFB8F220 != -1)
      swift_once();
    v10 = *(_QWORD *)(v0 + 184);
    v9 = *(_QWORD *)(v0 + 192);
    v11 = *(_QWORD *)(v0 + 160);
    v12 = sub_1CF524C5C();
    *(_QWORD *)(v0 + 216) = __swift_project_value_buffer(v12, (uint64_t)qword_1EFB915A0);
    v6(v10, v9, v11);
    v13 = sub_1CF524C44();
    v14 = sub_1CF5251F0();
    v15 = os_log_type_enabled(v13, v14);
    v16 = *(_QWORD *)(v0 + 184);
    v17 = *(_QWORD *)(v0 + 160);
    v18 = *(_QWORD *)(v0 + 168);
    if (v15)
    {
      v19 = (uint8_t *)swift_slowAlloc();
      v32 = swift_slowAlloc();
      v33 = v32;
      *(_DWORD *)v19 = 136315138;
      sub_1CF3C6DA0((unint64_t *)&qword_1EFB8F7F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD380], MEMORY[0x1E0CAD3A0]);
      v20 = sub_1CF5257F0();
      *(_QWORD *)(v0 + 40) = sub_1CF3F9B9C(v20, v21, &v33);
      sub_1CF525418();
      swift_bridgeObjectRelease();
      v22 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
      v22(v16, v17);
      _os_log_impl(&dword_1CF3C3000, v13, v14, "Fetching transactions (refresh) for %s.", v19, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17D1060](v32, -1, -1);
      MEMORY[0x1D17D1060](v19, -1, -1);
    }
    else
    {
      v22 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
      v22(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 160));
    }

    *(_QWORD *)(v0 + 224) = v22;
    v28 = sub_1CF523E4C();
    v30 = v29;
    *(_QWORD *)(v0 + 232) = v29;
    v31 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 240) = v31;
    *v31 = v0;
    v31[1] = sub_1CF5076E0;
    return sub_1CF50825C(*(_QWORD *)(v0 + 144), v28, v30);
  }
  else
  {
    v23 = *(_QWORD *)(v0 + 128);

    v24 = *(_QWORD *)(v0 + 192);
    v25 = *(_QWORD *)(v0 + 168);
    v26 = *(_QWORD *)(v0 + 160);
    (*(void (**)(_QWORD, _QWORD))(v23 + 8))(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 120));
    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v26);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CF5076E0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 248) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_1CF50774C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v1 = v0[17];
  v2 = v0[18];
  v4 = v0[15];
  v3 = v0[16];
  v5 = v0[11];
  v6 = v0[9];
  v10 = v0[8];
  v11 = v0[10];
  v7 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0[7] + 16), *(_QWORD *)(v0[7] + 40));
  sub_1CF3D06CC();
  v12 = swift_allocObject();
  sub_1CF3D0690((uint64_t)v7, v12 + 16);
  sub_1CF5240D4();
  swift_allocObject();
  v0[2] = sub_1CF5240B0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v2, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v5, 1, 1, v4);
  sub_1CF5240BC();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v11, *MEMORY[0x1E0CAB4B8], v10);
  v8 = (_QWORD *)swift_task_alloc();
  v0[32] = v8;
  *v8 = v0;
  v8[1] = sub_1CF5078B4;
  return sub_1CF5241C4();
}

uint64_t sub_1CF5078B4()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 264) = v0;
  swift_task_dealloc();
  v4 = v2[13];
  v3 = v2[14];
  v5 = v2[12];
  (*(void (**)(_QWORD, _QWORD))(v2[9] + 8))(v2[10], v2[8]);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  return swift_task_switch();
}

uint64_t sub_1CF507950()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void (*v3)(_QWORD, _QWORD);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(void **)(v0 + 208);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 128) + 8);
  v3(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 120));
  swift_release();
  sub_1CF5080F0(v2);

  v4 = *(_QWORD *)(v0 + 192);
  v5 = *(_QWORD *)(v0 + 168);
  v6 = *(_QWORD *)(v0 + 160);
  v3(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 120));
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CF507A58()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(void **)(v0 + 208);
  v2 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRelease();
  sub_1CF5080F0(v2);

  v3 = *(_QWORD *)(v0 + 192);
  v4 = *(_QWORD *)(v0 + 168);
  v5 = *(_QWORD *)(v0 + 160);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 128) + 8))(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 120));
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CF507B60()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v30)(uint64_t, uint64_t);
  _QWORD *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;

  v1 = *(void **)(v0 + 264);
  v2 = *(_QWORD *)(v0 + 192);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 200);
  v4 = *(_QWORD *)(v0 + 176);
  v5 = *(_QWORD *)(v0 + 160);
  swift_release();
  v3(v4, v2, v5);
  v6 = v1;
  v7 = v1;
  v8 = sub_1CF524C44();
  v9 = sub_1CF525208();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = *(void **)(v0 + 264);
    v30 = *(void (**)(uint64_t, uint64_t))(v0 + 224);
    v11 = *(_QWORD *)(v0 + 176);
    v12 = *(_QWORD *)(v0 + 160);
    v13 = swift_slowAlloc();
    v31 = (_QWORD *)swift_slowAlloc();
    v33 = swift_slowAlloc();
    v34 = v33;
    *(_DWORD *)v13 = 136315394;
    sub_1CF3C6DA0((unint64_t *)&qword_1EFB8F7F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD380], MEMORY[0x1E0CAD3A0]);
    v14 = sub_1CF5257F0();
    *(_QWORD *)(v0 + 24) = sub_1CF3F9B9C(v14, v15, &v34);
    sub_1CF525418();
    swift_bridgeObjectRelease();
    v30(v11, v12);
    *(_WORD *)(v13 + 12) = 2112;
    v16 = v10;
    v17 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 32) = v17;
    sub_1CF525418();
    *v31 = v17;

    _os_log_impl(&dword_1CF3C3000, v8, v9, "Failed to fetch transactions (refresh) for %s with: %@.", (uint8_t *)v13, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFB94080);
    swift_arrayDestroy();
    MEMORY[0x1D17D1060](v31, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1D17D1060](v33, -1, -1);
    MEMORY[0x1D17D1060](v13, -1, -1);
  }
  else
  {
    v18 = *(void **)(v0 + 264);
    (*(void (**)(_QWORD, _QWORD))(v0 + 224))(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 160));

  }
  v19 = *(_QWORD *)(v0 + 264);
  v32 = *(void **)(v0 + 208);
  v20 = *(_QWORD *)(v0 + 144);
  v21 = *(_QWORD *)(v0 + 120);
  v22 = *(_QWORD *)(v0 + 128);
  v23 = *(_QWORD *)(v0 + 56);
  v24 = sub_1CF523330();
  sub_1CF3C6DA0((unint64_t *)&qword_1EFB902D0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAC7D8], MEMORY[0x1E0CAC7E0]);
  swift_allocError();
  *v25 = v19;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v24 - 8) + 104))(v25, *MEMORY[0x1E0CAC7C0], v24);
  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v20, v21);
  sub_1CF5080F0(v23);

  v26 = *(_QWORD *)(v0 + 192);
  v27 = *(_QWORD *)(v0 + 168);
  v28 = *(_QWORD *)(v0 + 160);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 128) + 8))(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 120));
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v28);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1CF507F08(void *a1@<X0>, _BYTE *a2@<X8>)
{
  void *v2;
  id v5;
  unsigned int v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15[2];

  v15[1] = *(id *)MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_opt_self(), sel_currentQueryGenerationToken);
  v15[0] = 0;
  v6 = objc_msgSend(a1, sel_setQueryGenerationFromToken_error_, v5, v15);

  v7 = v15[0];
  if (v6)
  {
    sub_1CF52321C();
    v8 = v7;
    v9 = sub_1CF52318C();
    if (v2)
    {

LABEL_4:
      *a2 = 1;
      return;
    }
    v11 = (void *)v9;
    if (!v9)
      goto LABEL_4;
    if ((sub_1CF5231EC() & 1) != 0)
    {
      v12 = (void *)sub_1CF524A10();
      objc_msgSend(v11, sel_setLastTransactionsRefreshDate_, v12);

      v15[0] = 0;
      if (objc_msgSend(a1, sel_save_, v15))
      {
        v13 = v15[0];

        goto LABEL_4;
      }
      v14 = v15[0];
      sub_1CF5248C0();

      swift_willThrow();
    }
    else
    {

      *a2 = 0;
    }
  }
  else
  {
    v10 = v15[0];
    sub_1CF5248C0();

    swift_willThrow();
  }
}

void sub_1CF5080D4(_BYTE *a1@<X8>)
{
  uint64_t v1;

  sub_1CF507F08(*(void **)(v1 + 16), a1);
}

uint64_t sub_1CF5080F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD v15[5];

  v2 = sub_1CF524A70();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v15[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF524A4C();
  v6 = __swift_project_boxed_opaque_existential_1((_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 40));
  __swift_project_boxed_opaque_existential_1(v6 + 41, v6[44]);
  v7 = sub_1CF523E4C();
  v9 = v8;
  sub_1CF5249EC();
  v11 = v10;
  v15[0] = 0;
  v15[1] = 0xE000000000000000;
  sub_1CF525598();
  swift_bridgeObjectRelease();
  v15[3] = &_s24InstitutionDurationEventVN;
  v15[4] = sub_1CF3FA1DC();
  v12 = (_QWORD *)swift_allocObject();
  v15[0] = v12;
  v12[2] = 0xD000000000000030;
  v12[3] = 0x80000001CF531C70;
  v12[4] = v7;
  v12[5] = v9;
  v12[6] = v11;
  sub_1CF5230FC();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
}

uint64_t sub_1CF50825C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  v5 = sub_1CF525370();
  v4[6] = v5;
  v4[7] = *(_QWORD *)(v5 - 8);
  v4[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CF5082C0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;

  v2 = v0[7];
  v1 = v0[8];
  v3 = v0[6];
  v5 = v0[3];
  v4 = v0[4];
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0[5] + 16), *(_QWORD *)(v0[5] + 40));
  sub_1CF523EDC();
  v6 = (void *)sub_1CF52210C();
  v0[9] = v6;
  swift_release();
  v7 = (_QWORD *)swift_allocObject();
  v0[10] = v7;
  v7[2] = v5;
  v7[3] = v4;
  v7[4] = v6;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x1E0C977C0], v3);
  swift_bridgeObjectRetain();
  v6;
  v8 = (_QWORD *)swift_task_alloc();
  v0[11] = v8;
  sub_1CF524A70();
  *v8 = v0;
  v8[1] = sub_1CF4601D0;
  return sub_1CF525394();
}

uint64_t sub_1CF5083E4()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  __swift_destroy_boxed_opaque_existential_1(v0 + 144);
  __swift_destroy_boxed_opaque_existential_1(v0 + 184);
  __swift_destroy_boxed_opaque_existential_1(v0 + 224);
  __swift_destroy_boxed_opaque_existential_1(v0 + 264);
  __swift_destroy_boxed_opaque_existential_1(v0 + 304);
  __swift_destroy_boxed_opaque_existential_1(v0 + 344);
  __swift_destroy_boxed_opaque_existential_1(v0 + 384);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 432);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 480);
  __swift_destroy_boxed_opaque_existential_1(v0 + 520);
  __swift_destroy_boxed_opaque_existential_1(v0 + 560);
  __swift_destroy_boxed_opaque_existential_1(v0 + 600);
  if (*(_QWORD *)(v0 + 664))
    __swift_destroy_boxed_opaque_existential_1(v0 + 640);
  if (*(_QWORD *)(v0 + 704))
    __swift_destroy_boxed_opaque_existential_1(v0 + 680);
  __swift_destroy_boxed_opaque_existential_1(v0 + 720);
  return swift_deallocObject();
}

uint64_t sub_1CF5084B8(uint64_t a1, unint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  unint64_t v18;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;

  v5 = sub_1CF524A70();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF5227E4();
  v9 = sub_1CF5227A8();
  if (v2)
  {

  }
  else
  {
    v20 = (void *)v9;
    if (v9)
    {
      sub_1CF524A4C();
      objc_msgSend(v20, sel_maxAgeTransactionsRefreshRequest);
      sub_1CF524A04();

      return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    }
  }
  if (qword_1EFB8F220 != -1)
    swift_once();
  v10 = sub_1CF524C5C();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EFB915A0);
  swift_bridgeObjectRetain_n();
  v11 = sub_1CF524C44();
  v12 = sub_1CF525208();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v21 = v14;
    *(_DWORD *)v13 = 136315138;
    swift_bridgeObjectRetain();
    v23 = sub_1CF3F9B9C(a1, a2, &v21);
    sub_1CF525418();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1CF3C3000, v11, v12, "Failed to fetch ManagedInstitution for: %s.", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D17D1060](v14, -1, -1);
    MEMORY[0x1D17D1060](v13, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v15 = sub_1CF523330();
  sub_1CF3C6DA0((unint64_t *)&qword_1EFB902D0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAC7D8], MEMORY[0x1E0CAC7E0]);
  swift_allocError();
  v17 = v16;
  v21 = 0;
  v22 = 0xE000000000000000;
  sub_1CF525598();
  swift_bridgeObjectRelease();
  v21 = 0xD000000000000024;
  v22 = 0x80000001CF531CB0;
  sub_1CF524F38();
  sub_1CF524F38();
  v18 = v22;
  *v17 = v21;
  v17[1] = v18;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v17, *MEMORY[0x1E0CAC7D0], v15);
  return swift_willThrow();
}

uint64_t sub_1CF5087E4()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1CF508810()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1CF50883C()
{
  uint64_t v0;

  return sub_1CF5084B8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_1CF508858(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }
}

unint64_t sub_1CF508894()
{
  void *v0;
  void *v1;
  id v2;
  id v3;

  v2 = v1;
  sub_1CF525598();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v2, sel_description);
  sub_1CF524E9C();

  sub_1CF524F38();
  swift_bridgeObjectRelease();
  sub_1CF524F38();
  sub_1CF45B0B4(v1, v0, 0);
  return 0xD000000000000021;
}

void sub_1CF508D08(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  __asm { BR              X10 }
}

void sub_1CF508D44()
{
  void *v0;
  void *v1;
  void *v2;

  sub_1CF45B068(v1, v0, 0);
  sub_1CF509130((uint64_t)v1, v2);
  sub_1CF45B0B4(v1, v0, 0);
}

void sub_1CF508E84(uint64_t a1)
{
  sub_1CF508EAC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

void sub_1CF508EA0()
{
  uint64_t v0;

  sub_1CF508858(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

void sub_1CF508EAC(uint64_t a1, uint64_t a2, char a3)
{
  __asm { BR              X10 }
}

uint64_t sub_1CF508EEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  if (a6)
    return 0;
  sub_1CF3C7E5C();
  sub_1CF45B068(v8, v6, 0);
  sub_1CF45B068(v9, v7, 0);
  v10 = sub_1CF5253D0();
  sub_1CF45B0B4(v9, v7, 0);
  sub_1CF45B0B4(v8, v6, 0);
  return v10 & 1;
}

void sub_1CF509130(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v13[6];

  v13[5] = *(id *)MEMORY[0x1E0C80C00];
  v4 = sub_1CF52204C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF523444();
  v8 = (void *)sub_1CF523420();
  if (!v2)
  {
    v9 = v8;
    sub_1CF522010();
    v13[3] = (id)sub_1CF524434();
    v13[4] = (id)MEMORY[0x1E0CAD988];
    __swift_allocate_boxed_opaque_existential_1((uint64_t *)v13);
    sub_1CF524428();
    sub_1CF523984();
    swift_allocObject();
    sub_1CF523978();

    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v13[0] = 0;
    if (objc_msgSend(a2, sel_save_, v13))
    {
      v10 = v13[0];
    }
    else
    {
      v11 = v13[0];
      sub_1CF5248C0();

      swift_willThrow();
    }

  }
}

void sub_1CF5094A0(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x1E0C80C00];
  sub_1CF522ACC();
  v4 = sub_1CF522AC0();
  if (!v2)
  {
    v5 = (void *)v4;
    sub_1CF523444();
    v6 = v5;
    v7 = a2;

    v10[0] = 0;
    if ((objc_msgSend(v7, sel_save_, v10) & 1) != 0)
    {
      v8 = v10[0];
    }
    else
    {
      v9 = v10[0];
      sub_1CF5248C0();

      swift_willThrow();
    }

  }
}

void sub_1CF5095B4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x1E0C80C00];
  sub_1CF523444();
  v5 = sub_1CF523420();
  if (!v3)
  {
    v6 = (void *)v5;
    v7 = (void *)sub_1CF523420();
    sub_1CF523438();
    v10[0] = 0;
    if (objc_msgSend(a3, sel_save_, v10))
    {
      v8 = v10[0];
    }
    else
    {
      v9 = v10[0];
      sub_1CF5248C0();

      swift_willThrow();
    }

  }
}

void sub_1CF5097CC(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x1E0C80C00];
  sub_1CF523444();
  v5 = sub_1CF523420();
  if (!v3)
  {
    v6 = (void *)v5;
    sub_1CF522ACC();
    v7 = (void *)sub_1CF522AC0();
    sub_1CF52342C();
    v10[0] = 0;
    if (objc_msgSend(a3, sel_save_, v10))
    {
      v8 = v10[0];
    }
    else
    {
      v9 = v10[0];
      sub_1CF5248C0();

      swift_willThrow();
    }

  }
}

void sub_1CF5099F4(void *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  void *v27;
  id v28;
  unsigned __int8 v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t);
  id v32;
  id v33;
  uint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  id v44[2];

  v42 = a1;
  v44[1] = *(id *)MEMORY[0x1E0C80C00];
  v3 = sub_1CF524434();
  v40 = *(_QWORD *)(v3 - 8);
  v41 = v3;
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1CF523F6C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB90AD0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1CF523E7C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF522ACC();
  v17 = v43;
  v42 = a2;
  v18 = sub_1CF522AC0();
  if (!v17)
  {
    v19 = v18;
    v43 = v13;
    v35 = v12;
    v36 = v5;
    v37 = v9;
    v38 = v7;
    v39 = v6;
    sub_1CF52321C();
    v20 = (void *)v19;
    sub_1CF522AA8();
    v21 = v42;
    v22 = (void *)sub_1CF52318C();
    v23 = v20;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v43);
    if (v22)
    {
      objc_msgSend(v22, sel_setExternalAccountId_, 0);
      v24 = sub_1CF5229DC();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v35, 1, 1, v24);
      sub_1CF5231D4();

    }
    v25 = v36;
    sub_1CF524428();
    v26 = v37;
    sub_1CF52441C();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v25, v41);
    v27 = v23;
    v28 = objc_msgSend(v23, sel_fpanID);
    sub_1CF524E9C();

    sub_1CF523F60();
    swift_bridgeObjectRelease();
    objc_msgSend(v21, sel_deleteObject_, v23);
    v44[0] = 0;
    v29 = objc_msgSend(v21, sel_save_, v44);
    v30 = v38;
    if ((v29 & 1) != 0)
    {
      v31 = *(void (**)(char *, uint64_t))(v38 + 8);
      v32 = v44[0];
      v31(v26, v39);

    }
    else
    {
      v33 = v44[0];
      sub_1CF5248C0();

      swift_willThrow();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v26, v39);
    }
  }
}

void sub_1CF509D3C(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  id v8[2];

  v8[1] = *(id *)MEMORY[0x1E0C80C00];
  sub_1CF523444();
  v4 = sub_1CF523420();
  if (!v2)
  {
    v5 = (void *)v4;
    objc_msgSend(a2, sel_deleteObject_, v4);
    v8[0] = 0;
    if ((objc_msgSend(a2, sel_save_, v8) & 1) != 0)
    {
      v6 = v8[0];
    }
    else
    {
      v7 = v8[0];
      sub_1CF5248C0();

      swift_willThrow();
    }

  }
}

void _s9OperationOwxx_0(uint64_t a1)
{
  sub_1CF45B0B4(*(void **)a1, *(void **)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s9OperationOwCP_0_0(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  unsigned __int8 v5;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1CF45B068(*(id *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s9OperationOwca_0(uint64_t a1, uint64_t a2)
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;

  v3 = *(id *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_1CF45B068(*(id *)a2, v4, v5);
  v6 = *(void **)a1;
  v7 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  v8 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v5;
  sub_1CF45B0B4(v6, v7, v8);
  return a1;
}

uint64_t _s9OperationOwta_0(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(void **)a1;
  v5 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_BYTE *)(a1 + 16);
  *(_BYTE *)(a1 + 16) = v3;
  sub_1CF45B0B4(v4, v5, v6);
  return a1;
}

uint64_t _s9OperationOwet_0(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFB && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 251);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 5)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t _s9OperationOwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFA)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 251;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFB)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

ValueMetadata *_s9OperationOMa_2()
{
  return &_s9OperationON_0;
}

uint64_t sub_1CF509FBC(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x1E0DEE9D8];
  if (v2)
  {
    v9 = MEMORY[0x1E0DEE9D8];
    sub_1CF525604();
    v4 = _s8MetadataV9CloudItemV6ObjectVMa(0);
    v5 = *(_QWORD *)(v4 - 8);
    v6 = a1 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    v7 = *(_QWORD *)(v5 + 72);
    do
    {
      v8 = *(id *)(v6 + *(int *)(v4 + 20));
      sub_1CF5255EC();
      sub_1CF525610();
      sub_1CF52561C();
      sub_1CF5255F8();
      v6 += v7;
      --v2;
    }
    while (v2);
    return v9;
  }
  return result;
}

uint64_t sub_1CF50A098@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v13;

  v4 = objc_msgSend(a1, sel_changedObjectID);
  v5 = objc_msgSend(v4, sel_entity);

  v6 = objc_msgSend(v5, sel_name);
  if (!v6)
    goto LABEL_13;
  v7 = sub_1CF524E9C();
  v9 = v8;

  if (v7 != 0x646572436B6E6142 || v9 != 0xEE006C6169746E65)
  {
    if ((sub_1CF525814() & 1) == 0)
    {
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
    if (v7 == 0xD000000000000013 && v9 == 0x80000001CF531DE0)
    {
      swift_bridgeObjectRelease();
      return sub_1CF50A24C(a1, a2);
    }
  }
  v11 = sub_1CF525814();
  swift_bridgeObjectRelease();
  if ((v11 & 1) != 0)
    return sub_1CF50A24C(a1, a2);
LABEL_13:
  v13 = type metadata accessor for BankCredentialMappingModel.Change();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(a2, 1, 1, v13);
}

uint64_t sub_1CF50A24C@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  int v17;
  id v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  id v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  uint64_t v28;
  int v29;
  void (*v30)(uint64_t, _QWORD, uint64_t, uint64_t);
  void (*v31)(char *, uint64_t, uint64_t);
  char *v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  const char *v39;
  uint64_t v40;
  _BOOL4 v41;
  char *v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  _BYTE v49[40];
  __int128 v50;
  __int128 v51;

  v46 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(qword_1ED8F46B0);
  MEMORY[0x1E0C80A78](v3);
  v43 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1CF524AB8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v42 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for BankCredentialMappingModel.Change();
  v45 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend(a1, sel_changedObjectID);
  v44 = *(int *)(v8 + 24);
  *(_QWORD *)&v10[v44] = v11;
  v12 = objc_msgSend(v11, sel_entityName);
  v13 = sub_1CF524E9C();
  v15 = v14;

  v16 = v13 == 0x646572436B6E6142 && v15 == 0xEE006C6169746E65;
  if (v16 || (sub_1CF525814() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    v17 = 1;
  }
  else
  {
    if (v13 == 0xD000000000000013 && v15 == 0x80000001CF531DE0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v33 = sub_1CF525814();
      swift_bridgeObjectRelease();
      if ((v33 & 1) == 0)
      {
        if (qword_1ED8F2950 != -1)
          swift_once();
        v40 = sub_1CF524C5C();
        __swift_project_value_buffer(v40, (uint64_t)qword_1ED8F2930);
        v36 = sub_1CF524C44();
        v37 = sub_1CF525208();
        v41 = os_log_type_enabled(v36, v37);
        v34 = v46;
        if (!v41)
          goto LABEL_40;
        v38 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v38 = 0;
        v39 = "Change was not for a cloud or local bank credential";
LABEL_39:
        _os_log_impl(&dword_1CF3C3000, v36, v37, v39, v38, 2u);
        MEMORY[0x1D17D1060](v38, -1, -1);
LABEL_40:

        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v45 + 56))(v34, 1, 1, v8);
      }
    }
    v17 = 0;
  }
  v10[*(int *)(v8 + 20)] = v17;
  v18 = objc_msgSend(a1, sel_changeType);
  if (!v18)
  {

    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v10, 1, 2, v5);
    goto LABEL_11;
  }
  if (v18 == (id)1)
  {

    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v10, 2, 2, v5);
LABEL_11:
    v19 = v46;
    sub_1CF3CB780((uint64_t)v10, v46, (uint64_t (*)(_QWORD))type metadata accessor for BankCredentialMappingModel.Change);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v45 + 56))(v19, 0, 1, v8);
    return sub_1CF3C7E20((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for BankCredentialMappingModel.Change);
  }
  if (v18 == (id)2)
  {
    if (v17)
      v21 = 0xE200000000000000;
    else
      v21 = 0x80000001CF530C60;
    v22 = objc_msgSend(a1, sel_tombstone);
    if (v22)
    {
      v23 = v22;
      if (v17)
        v24 = 25705;
      else
        v24 = 0xD000000000000014;
      v25 = sub_1CF524E0C();

      v47 = v24;
      v48 = v21;
      sub_1CF52555C();
      if (*(_QWORD *)(v25 + 16) && (v26 = sub_1CF4485BC((uint64_t)v49), (v27 & 1) != 0))
      {
        sub_1CF3D1FB4(*(_QWORD *)(v25 + 56) + 32 * v26, (uint64_t)&v50);
      }
      else
      {
        v50 = 0u;
        v51 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_1CF3D1EFC((uint64_t)v49);
      if (*((_QWORD *)&v51 + 1))
      {
        v28 = (uint64_t)v43;
        v29 = swift_dynamicCast();
        v30 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v6 + 56);
        v30(v28, v29 ^ 1u, 1, v5);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v28, 1, v5) != 1)
        {

          v31 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 32);
          v32 = v42;
          v31(v42, v28, v5);
          v31(v10, (uint64_t)v32, v5);
          v30((uint64_t)v10, 0, 2, v5);
          goto LABEL_11;
        }
      }
      else
      {
        sub_1CF3CB808((uint64_t)&v50, &qword_1ED8F29E8);
        v28 = (uint64_t)v43;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v43, 1, 1, v5);
      }
      sub_1CF3CB808(v28, qword_1ED8F46B0);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    v34 = v46;
    if (qword_1ED8F2950 != -1)
      swift_once();
    v35 = sub_1CF524C5C();
    __swift_project_value_buffer(v35, (uint64_t)qword_1ED8F2930);
    v36 = sub_1CF524C44();
    v37 = sub_1CF525208();
    if (!os_log_type_enabled(v36, v37))
      goto LABEL_40;
    v38 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v38 = 0;
    v39 = "Received delete change but no tombstone";
    goto LABEL_39;
  }
  result = sub_1CF5256E8();
  __break(1u);
  return result;
}

void sub_1CF50A89C(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t (*v15)(_QWORD);
  id v16;
  char v17;
  uint64_t v18;
  uint64_t v19;

  v19 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(qword_1EFB94B78);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for BankCredentialMappingModel.Change();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v18 - v13;
  sub_1CF3CB780(a1, (uint64_t)&v18 - v13, v15);
  sub_1CF3D3DF4(0, (unint64_t *)&qword_1EFB8F2E0);
  v16 = objc_msgSend(a2, sel_changedObjectID);
  v17 = sub_1CF5253D0();

  if ((v17 & 1) != 0)
  {
    sub_1CF3C7E20((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for BankCredentialMappingModel.Change);
    sub_1CF50A24C(a2, (uint64_t)v7);
    sub_1CF3CB780(a1, (uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for BankCredentialMappingModel.Change);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
    {
      sub_1CF3CB7C4((uint64_t)v12, v19, (uint64_t (*)(_QWORD))type metadata accessor for BankCredentialMappingModel.Change);
      sub_1CF3CB808((uint64_t)v7, qword_1EFB94B78);
    }
    else
    {
      sub_1CF3C7E20((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for BankCredentialMappingModel.Change);
      sub_1CF3CB7C4((uint64_t)v7, v19, (uint64_t (*)(_QWORD))type metadata accessor for BankCredentialMappingModel.Change);
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1CF50AA74@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  void *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  _QWORD *v25;
  unsigned int (*v26)(char *, uint64_t, uint64_t);
  void (*v27)(char *, char *, uint64_t);
  uint64_t v28;
  void *v29;
  char **v30;
  uint64_t v31;
  id v32;
  char *v33;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  _BOOL4 v47;
  uint8_t *v48;
  void *v49;
  id v50;
  uint64_t v51;
  _QWORD *v52;
  id v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  id v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  _QWORD *v62;
  id v63;
  uint64_t v64;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  void (*v80)(char *, uint64_t, uint64_t, uint64_t);
  void *v81;
  void *v82;
  id v83;

  v77 = a2;
  v78 = type metadata accessor for BankCredentialMappingModel.Change();
  MEMORY[0x1E0C80A78](v78);
  v69 = (uint64_t)&v67 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1CF52471C();
  v72 = *(_QWORD *)(v7 - 8);
  v73 = v7;
  v8 = MEMORY[0x1E0C80A78](v7);
  v71 = (char *)&v67 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v70 = (char *)&v67 - v10;
  v11 = sub_1CF524728();
  v76 = *(_QWORD *)(v11 - 8);
  v12 = MEMORY[0x1E0C80A78](v11);
  v74 = (char *)&v67 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v75 = (char *)&v67 - v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94B70);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v67 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(qword_1ED8F46B0);
  v19 = MEMORY[0x1E0C80A78](v18);
  v21 = (char *)&v67 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v19);
  v23 = (char *)&v67 - v22;
  v79 = a1;
  sub_1CF50CE4C((uint64_t)a1, (uint64_t)v17);
  v24 = sub_1CF524AB8();
  v25 = *(_QWORD **)(v24 - 8);
  v26 = (unsigned int (*)(char *, uint64_t, uint64_t))v25[6];
  if (v26(v17, 2, v24))
  {
    sub_1CF3CB808((uint64_t)v17, &qword_1EFB94B70);
    v80 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v25[7];
    v80(v23, 1, 1, v24);
  }
  else
  {
    v68 = v11;
    v27 = (void (*)(char *, char *, uint64_t))v25[4];
    v27(v23, v17, v24);
    v80 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v25[7];
    v80(v23, 0, 1, v24);
    if (v26(v23, 1, v24) != 1)
    {
      v27((char *)a3, v23, v24);
      return ((uint64_t (*)(uint64_t, _QWORD, uint64_t, uint64_t))v80)(a3, 0, 1, v24);
    }
    v11 = v68;
  }
  sub_1CF3CB808((uint64_t)v23, qword_1ED8F46B0);
  if (*((_BYTE *)v79 + *(int *)(v78 + 20)) == 1)
  {
    sub_1CF522F10();
    v28 = sub_1CF522EEC();
    if (!v3)
    {
      v29 = (void *)v28;
      v30 = &selRef_id;
LABEL_17:
      v54 = objc_msgSend(v29, *v30);

      sub_1CF524AA0();
      v80(v21, 0, 1, v24);
      return sub_1CF4407A8((uint64_t)v21, a3);
    }
  }
  else
  {
    sub_1CF5237BC();
    v31 = sub_1CF523798();
    if (!v3)
    {
      v29 = (void *)v31;
      v30 = &selRef_credentialIdentifier;
      goto LABEL_17;
    }
  }
  v83 = v3;
  v32 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB8F770);
  v33 = v75;
  if (swift_dynamicCast())
  {
    v67 = v24;
    v77 = a3;
    v34 = v74;
    (*(void (**)(char *, char *, uint64_t))(v76 + 32))(v74, v33, v11);
    sub_1CF3F7260(&qword_1EFB90230, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE48], MEMORY[0x1E0CADE40]);
    v35 = v70;
    sub_1CF5248A8();
    v36 = v71;
    sub_1CF524710();
    sub_1CF3F7260(&qword_1EFB90238, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADE20], MEMORY[0x1E0CADE30]);
    v37 = v73;
    sub_1CF524F8C();
    sub_1CF524F8C();
    v39 = v81;
    v38 = v82;
    v40 = v11;
    v41 = *(void (**)(char *, uint64_t))(v72 + 8);
    v41(v36, v37);
    v41(v35, v37);
    if (v38 == v39)
    {
      v42 = v76;
      v68 = v40;

      if (qword_1ED8F2950 != -1)
        swift_once();
      v43 = sub_1CF524C5C();
      __swift_project_value_buffer(v43, (uint64_t)qword_1ED8F2930);
      v44 = v69;
      sub_1CF3CB780((uint64_t)v79, v69, (uint64_t (*)(_QWORD))type metadata accessor for BankCredentialMappingModel.Change);
      v45 = sub_1CF524C44();
      v46 = sub_1CF525208();
      v47 = os_log_type_enabled(v45, v46);
      v24 = v67;
      if (v47)
      {
        v48 = (uint8_t *)swift_slowAlloc();
        v79 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v48 = 138412290;
        v49 = *(void **)(v44 + *(int *)(v78 + 24));
        v82 = v49;
        v50 = v49;
        v51 = v76;
        sub_1CF525418();
        v52 = v79;
        *v79 = v49;
        sub_1CF3C7E20(v69, (uint64_t (*)(_QWORD))type metadata accessor for BankCredentialMappingModel.Change);
        _os_log_impl(&dword_1CF3C3000, v45, v46, "Object %@ does not exist. Ignoring.", v48, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFB94080);
        swift_arrayDestroy();
        MEMORY[0x1D17D1060](v52, -1, -1);
        MEMORY[0x1D17D1060](v48, -1, -1);

      }
      else
      {
        v51 = v42;

        sub_1CF3C7E20(v44, (uint64_t (*)(_QWORD))type metadata accessor for BankCredentialMappingModel.Change);
      }
      v55 = v77;
      (*(void (**)(char *, uint64_t))(v51 + 8))(v74, v68);
      v66 = v83;
      goto LABEL_26;
    }
    (*(void (**)(char *, uint64_t))(v76 + 8))(v34, v40);
    a3 = v77;
    v24 = v67;
  }
  v55 = a3;

  if (qword_1ED8F2950 != -1)
    swift_once();
  v56 = sub_1CF524C5C();
  __swift_project_value_buffer(v56, (uint64_t)qword_1ED8F2930);
  v57 = v3;
  v58 = v3;
  v59 = sub_1CF524C44();
  v60 = sub_1CF525208();
  if (os_log_type_enabled(v59, v60))
  {
    v77 = v55;
    v61 = (uint8_t *)swift_slowAlloc();
    v62 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v61 = 138412290;
    v63 = v3;
    v64 = v24;
    v65 = (void *)_swift_stdlib_bridgeErrorToNSError();
    v83 = v65;
    sub_1CF525418();
    *v62 = v65;
    v24 = v64;

    v55 = v77;
    _os_log_impl(&dword_1CF3C3000, v59, v60, "Error fetching identifier: %@", v61, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFB94080);
    swift_arrayDestroy();
    MEMORY[0x1D17D1060](v62, -1, -1);
    MEMORY[0x1D17D1060](v61, -1, -1);

    v66 = v3;
LABEL_26:

    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v80)(v55, 1, 1, v24);
  }

  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v80)(v55, 1, 1, v24);
}

void *sub_1CF50B2B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  void *result;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  NSObject *v40;
  os_log_type_t v41;
  _BOOL4 v42;
  uint64_t v43;
  uint8_t *v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v48 = (char *)a1;
  v49 = a3;
  v47 = a2;
  v5 = _s8MetadataV15CloudItemStatusOMa(0);
  MEMORY[0x1E0C80A78](v5);
  v51 = (uint64_t)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = _s8MetadataV9CloudItemVMa(0);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94B70);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for BankCredentialMappingModel.Change();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = v54;
  result = sub_1CF50B790((uint64_t)v48, v49, a4);
  if (!v18)
  {
    v52 = v14;
    v53 = v8;
    v48 = v10;
    v50 = v7;
    v54 = a4;
    v20 = *(_QWORD *)(v47 + 16);
    if (v20)
    {
      v46 = 0;
      v21 = v47 + ((*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80));
      v22 = *(_QWORD *)(v15 + 72);
      swift_bridgeObjectRetain();
      v23 = v52;
      v49 = v22;
      while (1)
      {
        sub_1CF3CB780(v21, (uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for BankCredentialMappingModel.Change);
        sub_1CF50CE4C((uint64_t)v17, (uint64_t)v13);
        v24 = sub_1CF524AB8();
        v25 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 48))(v13, 2, v24);
        sub_1CF3CB808((uint64_t)v13, &qword_1EFB94B70);
        if (v25)
        {
          sub_1CF3C7E20((uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for BankCredentialMappingModel.Change);
        }
        else
        {
          if ((v17[*(int *)(v23 + 20)] & 1) == 0)
          {
            v28 = v54 + *(int *)(_s8MetadataVMa(0) + 20);
            v29 = v51;
            sub_1CF3CB780(v28, v51, _s8MetadataV15CloudItemStatusOMa);
            v30 = v50;
            if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v53 + 48))(v29, 2, v50))
            {
              sub_1CF3C7E20((uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for BankCredentialMappingModel.Change);
              sub_1CF3C7E20(v29, _s8MetadataV15CloudItemStatusOMa);
              v23 = v52;
              goto LABEL_13;
            }
            v31 = v29;
            v32 = (uint64_t)v48;
            sub_1CF3CB7C4(v31, (uint64_t)v48, _s8MetadataV9CloudItemVMa);
            v33 = *(int *)(v30 + 20);
            v34 = v32;
            v35 = *(void **)(v32 + v33 + *(int *)(_s8MetadataV9CloudItemV6ObjectVMa(0) + 20));
            v36 = *(void **)&v17[*(int *)(v52 + 24)];
            sub_1CF3D3DF4(0, &qword_1EFB94CC0);
            v37 = v35;
            v38 = v36;
            LOBYTE(v32) = sub_1CF5253D0();

            if ((v32 & 1) != 0)
            {
              sub_1CF3C7E20(v34, _s8MetadataV9CloudItemVMa);
              sub_1CF3C7E20((uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for BankCredentialMappingModel.Change);
              v30 = v50;
              v23 = v52;
LABEL_13:
              sub_1CF3C7E20(v28, _s8MetadataV15CloudItemStatusOMa);
              (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v53 + 56))(v28, 1, 2, v30);
            }
            else
            {
              if (qword_1ED8F2950 != -1)
                swift_once();
              v39 = sub_1CF524C5C();
              __swift_project_value_buffer(v39, (uint64_t)qword_1ED8F2930);
              v40 = sub_1CF524C44();
              v41 = sub_1CF5251F0();
              v42 = os_log_type_enabled(v40, v41);
              v23 = v52;
              if (v42)
              {
                v43 = v52;
                v44 = (uint8_t *)swift_slowAlloc();
                *(_WORD *)v44 = 0;
                _os_log_impl(&dword_1CF3C3000, v40, v41, "Deleted duplicate cloud credential. Ignoring change.", v44, 2u);
                v45 = v44;
                v23 = v43;
                MEMORY[0x1D17D1060](v45, -1, -1);
              }

              sub_1CF3C7E20((uint64_t)v48, _s8MetadataV9CloudItemVMa);
              sub_1CF3C7E20((uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for BankCredentialMappingModel.Change);
            }
            v22 = v49;
            goto LABEL_5;
          }
          sub_1CF3C7E20((uint64_t)v17, (uint64_t (*)(_QWORD))type metadata accessor for BankCredentialMappingModel.Change);
          v26 = v54 + *(int *)(_s8MetadataVMa(0) + 24);
          sub_1CF3C7E20(v26, _s8MetadataV15LocalItemStatusOMa);
          v27 = _s8MetadataV9LocalItemVMa(0);
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v26, 1, 2, v27);
        }
LABEL_5:
        v21 += v22;
        if (!--v20)
          return (void *)swift_bridgeObjectRelease();
      }
    }
  }
  return result;
}

void *sub_1CF50B790@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  void *result;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(_QWORD *, _QWORD, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  unint64_t v62;
  char *v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  _QWORD *v69;

  v66 = a3;
  v5 = _s8MetadataV9CloudItemV6ObjectVMa(0);
  v6 = *(_QWORD *)(v5 - 8);
  v67 = v5;
  v68 = v6;
  v7 = MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x1E0C80A78](v7);
  v12 = (char *)&v61 - v11;
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v61 - v13;
  v15 = _s8MetadataV15CloudItemStatusOMa(0);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = _s8MetadataV15LocalItemStatusOMa(0);
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)&v61 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF522F10();
  v21 = a1;
  v22 = a2;
  v23 = v69;
  result = (void *)sub_1CF522ED4();
  if (!v23)
  {
    v25 = result;
    v62 = 0;
    v63 = v9;
    v26 = v21;
    v27 = v22;
    v64 = v12;
    v65 = v17;
    v61 = v14;
    v69 = v20;
    if (result)
    {
      v28 = objc_msgSend(result, sel_objectID);
      v29 = objc_msgSend(v25, sel_updatedDate);
      v30 = _s8MetadataV9LocalItemVMa(0);
      v31 = v69;
      sub_1CF524A40();

      v32 = v26;
      v33 = (uint64_t)v31;

      *v31 = v28;
      v34 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56);
      v35 = v30;
      v36 = (uint64_t)v65;
      v34(v31, 0, 2, v35);
      v37 = v68;
      v38 = v27;
    }
    else
    {
      v39 = _s8MetadataV9LocalItemVMa(0);
      v33 = (uint64_t)v69;
      (*(void (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v69, 2, 2, v39);
      v37 = v68;
      v36 = (uint64_t)v65;
      v38 = v27;
      v32 = v26;
    }
    v40 = v62;
    v41 = sub_1CF50BDBC(v32, v38);
    v43 = (uint64_t)v63;
    v42 = (uint64_t)v64;
    if (v40)
    {
      return (void *)sub_1CF3C7E20(v33, _s8MetadataV15LocalItemStatusOMa);
    }
    else
    {
      v44 = v41;
      v67 = v32;
      v45 = *(_QWORD *)(v41 + 16);
      if (v45)
      {
        v62 = (*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80);
        v46 = v41 + v62;
        sub_1CF3CB780(v41 + v62, (uint64_t)v61, _s8MetadataV9CloudItemV6ObjectVMa);
        sub_1CF525820();
        swift_unknownObjectRetain_n();
        v47 = swift_dynamicCastClass();
        if (!v47)
        {
          swift_bridgeObjectRelease();
          v47 = MEMORY[0x1E0DEE9D8];
        }
        v48 = *(_QWORD *)(v47 + 16);
        swift_release();
        if (v48 == v45 - 1)
        {
          v49 = swift_dynamicCastClass();
          v36 = (uint64_t)v65;
          if (!v49)
          {
            swift_bridgeObjectRelease();
            v49 = MEMORY[0x1E0DEE9D8];
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          v49 = sub_1CF3F1CA4(v44, v46, 1, (2 * v45) | 1);
          v36 = (uint64_t)v65;
        }
        swift_bridgeObjectRelease();
        v50 = (uint64_t)v61;
        sub_1CF3CB780((uint64_t)v61, v42, _s8MetadataV9CloudItemV6ObjectVMa);
        v51 = *(_QWORD *)(v49 + 16);
        if (v51)
        {
          v52 = v49;
          v53 = v49 + v62;
          v54 = *(_QWORD *)(v68 + 72);
          v68 = v52;
          swift_bridgeObjectRetain();
          do
          {
            sub_1CF3CB780(v53, v43, _s8MetadataV9CloudItemV6ObjectVMa);
            if ((sub_1CF524A1C() & 1) != 0)
            {
              sub_1CF3C7E20(v42, _s8MetadataV9CloudItemV6ObjectVMa);
              sub_1CF3CB7C4(v43, v42, _s8MetadataV9CloudItemV6ObjectVMa);
            }
            else
            {
              sub_1CF3C7E20(v43, _s8MetadataV9CloudItemV6ObjectVMa);
            }
            v53 += v54;
            --v51;
          }
          while (v51);
          v49 = v68;
          swift_release();
          v36 = (uint64_t)v65;
          v50 = (uint64_t)v61;
        }
        sub_1CF3CB7C4(v42, v36, _s8MetadataV9CloudItemV6ObjectVMa);
        v55 = v49;
        v56 = _s8MetadataV9CloudItemVMa(0);
        sub_1CF3CB7C4(v50, v36 + *(int *)(v56 + 20), _s8MetadataV9CloudItemV6ObjectVMa);
        *(_QWORD *)(v36 + *(int *)(v56 + 24)) = v55;
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v56 - 8) + 56))(v36, 0, 2, v56);
        v33 = (uint64_t)v69;
      }
      else
      {
        swift_bridgeObjectRelease();
        v57 = _s8MetadataV9CloudItemVMa(0);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v57 - 8) + 56))(v36, 2, 2, v57);
      }
      v58 = sub_1CF524AB8();
      v59 = v66;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v58 - 8) + 16))(v66, v67, v58);
      v60 = _s8MetadataVMa(0);
      sub_1CF3CB7C4(v36, v59 + *(int *)(v60 + 20), _s8MetadataV15CloudItemStatusOMa);
      return (void *)sub_1CF3CB7C4(v33, v59 + *(int *)(v60 + 24), _s8MetadataV15LocalItemStatusOMa);
    }
  }
  return result;
}

uint64_t type metadata accessor for BankCredentialMappingModel()
{
  return objc_opt_self();
}

uint64_t sub_1CF50BCC0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1CF50A098(a1, a2);
}

void sub_1CF50BCE4(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  sub_1CF50A89C(a1, a2, a3);
}

uint64_t sub_1CF50BCF8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return sub_1CF50AA74(a1, a2, a3);
}

void *sub_1CF50BD0C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t a4@<X8>)
{
  return sub_1CF50B2B4(a1, a2, a3, a4);
}

void sub_1CF50BD30(uint64_t a1, uint64_t a2)
{
  sub_1CF4D5F68(a2, *(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

unint64_t sub_1CF50BD64()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_1CF50BD80(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_1CF3F7260(&qword_1EFB94B68, a2, (uint64_t (*)(uint64_t))type metadata accessor for BankCredentialMappingModel, (uint64_t)&unk_1CF52C52C);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1CF50BDBC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t result;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  id v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v31 = a2;
  v2 = _s8MetadataV9CloudItemV6ObjectVMa(0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF5237BC();
  v6 = (void *)sub_1CF52378C();
  v7 = (void *)sub_1CF523774();
  objc_msgSend(v6, sel_setPredicate_, v7);

  objc_msgSend(v6, sel_setReturnsObjectsAsFaults_, 0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F29D8);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1CF527D60;
  v9 = objc_allocWithZone(MEMORY[0x1E0CB3928]);
  v10 = (void *)sub_1CF524E78();
  v11 = objc_msgSend(v9, sel_initWithKey_ascending_, v10, 0);

  *(_QWORD *)(v8 + 32) = v11;
  v33 = v8;
  sub_1CF525004();
  sub_1CF3D3DF4(0, &qword_1EFB90228);
  v12 = (void *)sub_1CF524FE0();
  swift_bridgeObjectRelease();
  objc_msgSend(v6, sel_setSortDescriptors_, v12);

  v13 = v31;
  v14 = v32;
  v15 = sub_1CF525388();
  if (v14)
  {

    return v13;
  }
  v16 = v15;
  if (!(v15 >> 62))
  {
    v17 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v17)
      goto LABEL_5;
LABEL_15:
    swift_bridgeObjectRelease();

    return MEMORY[0x1E0DEE9D8];
  }
  swift_bridgeObjectRetain();
  v17 = sub_1CF5256F4();
  swift_bridgeObjectRelease();
  if (!v17)
    goto LABEL_15;
LABEL_5:
  v33 = MEMORY[0x1E0DEE9D8];
  result = sub_1CF514C84(0, v17 & ~(v17 >> 63), 0);
  if ((v17 & 0x8000000000000000) == 0)
  {
    v29 = 0;
    v30 = v6;
    v19 = 0;
    v13 = v33;
    v31 = v16 & 0xC000000000000001;
    v32 = v3;
    v20 = v16;
    v21 = v17;
    do
    {
      if (v31)
        v22 = (id)MEMORY[0x1D17D05F8](v19, v16);
      else
        v22 = *(id *)(v16 + 8 * v19 + 32);
      v23 = v22;
      v24 = objc_msgSend(v23, sel_objectID);
      v25 = objc_msgSend(v23, sel_id);
      sub_1CF524AA0();

      v26 = objc_msgSend(v23, sel_updatedDate);
      sub_1CF524A40();

      *(_QWORD *)&v5[*(int *)(v2 + 20)] = v24;
      v33 = v13;
      v28 = *(_QWORD *)(v13 + 16);
      v27 = *(_QWORD *)(v13 + 24);
      if (v28 >= v27 >> 1)
      {
        sub_1CF514C84(v27 > 1, v28 + 1, 1);
        v13 = v33;
      }
      ++v19;
      *(_QWORD *)(v13 + 16) = v28 + 1;
      sub_1CF3CB7C4((uint64_t)v5, v13+ ((*(unsigned __int8 *)(v32 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 80))+ *(_QWORD *)(v32 + 72) * v28, _s8MetadataV9CloudItemV6ObjectVMa);
      v16 = v20;
    }
    while (v21 != v19);
    swift_bridgeObjectRelease();

    return v13;
  }
  __break(1u);
  return result;
}

_QWORD *sub_1CF50C158(uint64_t a1)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t (*v45)(char *, uint64_t, uint64_t);
  uint64_t v46;
  uint64_t (*v47)(uint64_t);
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  void *v54;
  _QWORD *v55;
  id v56;
  id v57;
  unint64_t v58;
  unint64_t v59;
  _QWORD *v60;
  uint64_t (*v61)(char *, uint64_t, uint64_t);
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  id *v74;
  unsigned __int8 v75;
  void **v76;
  void *v77;
  id v78;
  id v79;
  _QWORD *v80;
  unint64_t v81;
  unint64_t v82;
  _QWORD *v83;
  id *v84;
  uint64_t v85;
  int v86;
  unint64_t v87;
  uint64_t *v88;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  char v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t (*v100)(uint64_t, uint64_t, uint64_t);
  uint64_t v101;
  uint64_t (*v102)(uint64_t);
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  int v107;
  uint64_t v108;
  void *v109;
  _QWORD *v110;
  id v111;
  char v112;
  unint64_t v113;
  unint64_t v114;
  char v115;
  _QWORD *v116;
  _QWORD *v117;
  unint64_t v118;
  unint64_t v119;
  _QWORD *v120;
  uint64_t v121;
  uint64_t (*v122)(uint64_t);
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  id v128;
  id v129;
  unint64_t v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t (*v134)(char *, uint64_t, uint64_t);
  uint64_t v135;
  uint64_t v136;
  void **v137;
  uint64_t v138;
  id *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  char *v146;
  uint64_t v147;
  char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  _QWORD *v154;

  v2 = _s8MetadataV9LocalItemVMa(0);
  v3 = *(_QWORD *)(v2 - 8);
  v149 = v2;
  v150 = v3;
  v4 = MEMORY[0x1E0C80A78](v2);
  v139 = (id *)((char *)&v134 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x1E0C80A78](v4);
  v137 = (void **)((char *)&v134 - v6);
  v7 = _s8MetadataV15LocalItemStatusOMa(0);
  v8 = MEMORY[0x1E0C80A78](v7);
  v136 = (uint64_t)&v134 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x1E0C80A78](v8);
  v144 = (uint64_t)&v134 - v11;
  v12 = MEMORY[0x1E0C80A78](v10);
  v146 = (char *)&v134 - v13;
  v14 = MEMORY[0x1E0C80A78](v12);
  v138 = (uint64_t)&v134 - v15;
  v16 = MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v134 - v17;
  MEMORY[0x1E0C80A78](v16);
  v20 = (char *)&v134 - v19;
  v21 = _s8MetadataV15CloudItemStatusOMa(0);
  v22 = MEMORY[0x1E0C80A78](v21);
  v145 = (uint64_t)&v134 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x1E0C80A78](v22);
  v142 = (uint64_t)&v134 - v25;
  v26 = MEMORY[0x1E0C80A78](v24);
  v135 = (uint64_t)&v134 - v27;
  v28 = MEMORY[0x1E0C80A78](v26);
  v148 = (char *)&v134 - v29;
  v30 = MEMORY[0x1E0C80A78](v28);
  v32 = (char *)&v134 - v31;
  MEMORY[0x1E0C80A78](v30);
  v34 = (char *)&v134 - v33;
  v35 = _s8MetadataV9CloudItemVMa(0);
  v36 = *(_QWORD *)(v35 - 8);
  v37 = MEMORY[0x1E0C80A78](v35);
  v143 = (uint64_t)&v134 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = MEMORY[0x1E0C80A78](v37);
  v140 = (uint64_t)&v134 - v40;
  v41 = MEMORY[0x1E0C80A78](v39);
  v141 = (uint64_t)&v134 - v42;
  MEMORY[0x1E0C80A78](v41);
  v44 = (char *)&v134 - v43;
  v154 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v151 = _s8MetadataVMa(0);
  v152 = a1;
  v147 = a1 + *(int *)(v151 + 20);
  sub_1CF3CB780(v147, (uint64_t)v34, _s8MetadataV15CloudItemStatusOMa);
  v45 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v36 + 48);
  if (v45(v34, 2, v35))
  {
    v46 = v35;
    v47 = _s8MetadataV15CloudItemStatusOMa;
    v48 = (uint64_t)v34;
LABEL_12:
    sub_1CF3C7E20(v48, v47);
    v61 = v45;
    v51 = v150;
    goto LABEL_13;
  }
  sub_1CF3CB7C4((uint64_t)v34, (uint64_t)v44, _s8MetadataV9CloudItemVMa);
  v46 = v35;
  v49 = &v44[*(int *)(v35 + 20)];
  v50 = _s8MetadataV9CloudItemV6ObjectVMa(0);
  if ((sub_1CF524A28() & 1) == 0)
  {
    v47 = _s8MetadataV9CloudItemVMa;
    v48 = (uint64_t)v44;
    goto LABEL_12;
  }
  sub_1CF3CB780(v152 + *(int *)(v151 + 24), (uint64_t)v20, _s8MetadataV15LocalItemStatusOMa);
  v51 = v150;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v150 + 56))(v18, 1, 2, v149);
  v52 = sub_1CF3C7B88((uint64_t)v20, (uint64_t)v18);
  sub_1CF3C7E20((uint64_t)v18, _s8MetadataV15LocalItemStatusOMa);
  sub_1CF3C7E20((uint64_t)v20, _s8MetadataV15LocalItemStatusOMa);
  if ((v52 & 1) == 0)
  {
    v53 = *(int *)(v50 + 20);
    v54 = *(void **)&v44[v53];
    v55 = v154;
    v56 = *(id *)&v49[v53];
    v57 = v54;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v55 = sub_1CF412750(0, v55[2] + 1, 1, v55);
    v59 = v55[2];
    v58 = v55[3];
    if (v59 >= v58 >> 1)
      v55 = sub_1CF412750((_QWORD *)(v58 > 1), v59 + 1, 1, v55);
    v55[2] = v59 + 1;
    v60 = &v55[3 * v59];
    v60[4] = v56;
    v60[5] = v57;
    *((_BYTE *)v60 + 48) = 6;
    v154 = v55;
  }
  sub_1CF3C7E20((uint64_t)v44, _s8MetadataV9CloudItemVMa);
  v61 = v45;
LABEL_13:
  v62 = (uint64_t)v146;
  v63 = v147;
  sub_1CF3CB780(v147, (uint64_t)v32, _s8MetadataV15CloudItemStatusOMa);
  v64 = v46;
  v65 = v61(v32, 2, v46);
  v67 = v151;
  v66 = v152;
  v68 = (uint64_t)v148;
  if (v65)
  {
    sub_1CF3C7E20((uint64_t)v32, _s8MetadataV15CloudItemStatusOMa);
    v69 = v149;
  }
  else
  {
    v134 = v61;
    v70 = v141;
    sub_1CF3CB7C4((uint64_t)v32, v141, _s8MetadataV9CloudItemVMa);
    v71 = v138;
    sub_1CF3CB780(v66 + *(int *)(v67 + 24), v138, _s8MetadataV15LocalItemStatusOMa);
    v69 = v149;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v51 + 48))(v71, 2, v149))
    {
      sub_1CF3C7E20(v70, _s8MetadataV9CloudItemVMa);
      sub_1CF3C7E20(v71, _s8MetadataV15LocalItemStatusOMa);
      v61 = v134;
    }
    else
    {
      sub_1CF3CB7C4(v71, (uint64_t)v137, _s8MetadataV9LocalItemVMa);
      v72 = _s8MetadataV9CloudItemV6ObjectVMa(0);
      sub_1CF524A70();
      sub_1CF3F7260((unint64_t *)&qword_1EFB8FBA0, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08B8]);
      v73 = sub_1CF524E6C();
      v61 = v134;
      if ((v73 & 1) == 0)
      {
        if ((sub_1CF524A1C() & 1) != 0)
        {
          v74 = (id *)(v141 + *(int *)(v64 + 20) + (uint64_t)*(int *)(v72 + 20));
          v75 = 4;
          v76 = v137;
        }
        else
        {
          v76 = (void **)(v141 + *(int *)(v72 + 20));
          v75 = 5;
          v74 = v137;
        }
        v77 = *v76;
        v78 = *v74;
        v79 = v77;
        v80 = v154;
        sub_1CF4D6F8C(v78, v79, v75);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v80 = sub_1CF412750(0, v80[2] + 1, 1, v80);
        v82 = v80[2];
        v81 = v80[3];
        if (v82 >= v81 >> 1)
          v80 = sub_1CF412750((_QWORD *)(v81 > 1), v82 + 1, 1, v80);
        v80[2] = v82 + 1;
        v83 = &v80[3 * v82];
        v83[4] = v78;
        v83[5] = v79;
        *((_BYTE *)v83 + 48) = v75;
        sub_1CF4D6FC8(v78, v79, v75);
        v154 = v80;
        v62 = (uint64_t)v146;
        v63 = v147;
      }
      sub_1CF3C7E20((uint64_t)v137, _s8MetadataV9LocalItemVMa);
      sub_1CF3C7E20(v141, _s8MetadataV9CloudItemVMa);
      v67 = v151;
      v66 = v152;
      v68 = (uint64_t)v148;
    }
  }
  sub_1CF3CB780(v63, v68, _s8MetadataV15CloudItemStatusOMa);
  if (v61((char *)v68, 2, v64))
  {
    sub_1CF3CB780(v66 + *(int *)(v67 + 24), v62, _s8MetadataV15LocalItemStatusOMa);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v51 + 48))(v62, 2, v69))
    {
      v84 = v139;
      sub_1CF3CB7C4(v62, (uint64_t)v139, _s8MetadataV9LocalItemVMa);
      v85 = v135;
      sub_1CF3CB780(v63, v135, _s8MetadataV15CloudItemStatusOMa);
      v86 = v61((char *)v85, 2, v64);
      sub_1CF3C7E20(v85, _s8MetadataV15CloudItemStatusOMa);
      v87 = (unint64_t)v154;
      v88 = (uint64_t *)*v84;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if (v86 == 1)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
          goto LABEL_33;
        goto LABEL_76;
      }
      if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        v87 = (unint64_t)sub_1CF412750(0, *(_QWORD *)(v87 + 16) + 1, 1, (_QWORD *)v87);
      v96 = *(_QWORD *)(v87 + 16);
      v95 = *(_QWORD *)(v87 + 24);
      if (v96 >= v95 >> 1)
        v87 = (unint64_t)sub_1CF412750((_QWORD *)(v95 > 1), v96 + 1, 1, (_QWORD *)v87);
      *(_QWORD *)(v87 + 16) = v96 + 1;
      v97 = v87 + 24 * v96;
      *(_QWORD *)(v97 + 32) = v88;
      v93 = v97 + 32;
      v94 = 2;
      goto LABEL_41;
    }
    sub_1CF3C7E20(v62, _s8MetadataV15LocalItemStatusOMa);
  }
  else
  {
    sub_1CF3C7E20(v68, _s8MetadataV15CloudItemStatusOMa);
  }
  while (1)
  {
    v98 = v66 + *(int *)(v67 + 24);
    v99 = v144;
    sub_1CF3CB780(v98, v144, _s8MetadataV15LocalItemStatusOMa);
    v100 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v51 + 48);
    if (v100(v99, 2, v69))
    {
      v101 = v142;
      sub_1CF3CB780(v63, v142, _s8MetadataV15CloudItemStatusOMa);
      if (v61((char *)v101, 2, v64))
      {
        v102 = _s8MetadataV15CloudItemStatusOMa;
        v103 = v101;
      }
      else
      {
        v104 = v140;
        sub_1CF3CB7C4(v101, v140, _s8MetadataV9CloudItemVMa);
        v105 = v98;
        v106 = v136;
        sub_1CF3CB780(v105, v136, _s8MetadataV15LocalItemStatusOMa);
        v107 = v100(v106, 2, v69);
        sub_1CF3C7E20(v106, _s8MetadataV15LocalItemStatusOMa);
        v108 = v104 + *(int *)(v64 + 20);
        v109 = *(void **)(v108 + *(int *)(_s8MetadataV9CloudItemV6ObjectVMa(0) + 20));
        v110 = v154;
        v111 = v109;
        v112 = swift_isUniquelyReferenced_nonNull_native();
        if (v107 == 1)
        {
          if ((v112 & 1) == 0)
            v110 = sub_1CF412750(0, v110[2] + 1, 1, v110);
          v114 = v110[2];
          v113 = v110[3];
          if (v114 >= v113 >> 1)
            v110 = sub_1CF412750((_QWORD *)(v113 > 1), v114 + 1, 1, v110);
          v115 = 0;
          v110[2] = v114 + 1;
          v116 = &v110[3 * v114];
          v116[4] = v111;
          v117 = v116 + 4;
        }
        else
        {
          if ((v112 & 1) == 0)
            v110 = sub_1CF412750(0, v110[2] + 1, 1, v110);
          v119 = v110[2];
          v118 = v110[3];
          if (v119 >= v118 >> 1)
            v110 = sub_1CF412750((_QWORD *)(v118 > 1), v119 + 1, 1, v110);
          v110[2] = v119 + 1;
          v120 = &v110[3 * v119];
          v120[4] = v111;
          v117 = v120 + 4;
          v115 = 3;
        }
        v117[1] = 0;
        *((_BYTE *)v117 + 16) = v115;
        v154 = v110;
        v102 = _s8MetadataV9CloudItemVMa;
        v103 = v140;
      }
    }
    else
    {
      v102 = _s8MetadataV15LocalItemStatusOMa;
      v103 = v99;
    }
    sub_1CF3C7E20(v103, v102);
    v121 = v145;
    sub_1CF3CB780(v63, v145, _s8MetadataV15CloudItemStatusOMa);
    if (v61((char *)v121, 2, v64))
    {
      v122 = _s8MetadataV15CloudItemStatusOMa;
      v123 = v121;
      goto LABEL_74;
    }
    sub_1CF3CB7C4(v121, v143, _s8MetadataV9CloudItemVMa);
    v124 = swift_bridgeObjectRetain();
    v87 = sub_1CF509FBC(v124);
    swift_bridgeObjectRelease();
    if (v87 >> 62)
    {
      swift_bridgeObjectRetain();
      v125 = sub_1CF5256F4();
      swift_bridgeObjectRelease();
      if (!v125)
      {
LABEL_72:
        swift_bridgeObjectRelease();
        v127 = MEMORY[0x1E0DEE9D8];
        goto LABEL_73;
      }
    }
    else
    {
      v125 = *(_QWORD *)((v87 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v125)
        goto LABEL_72;
    }
    v153 = MEMORY[0x1E0DEE9D8];
    v88 = &v153;
    sub_1CF514C10(0, v125 & ~(v125 >> 63), 0);
    if ((v125 & 0x8000000000000000) == 0)
      break;
    __break(1u);
LABEL_76:
    v87 = (unint64_t)sub_1CF412750(0, *(_QWORD *)(v87 + 16) + 1, 1, (_QWORD *)v87);
LABEL_33:
    v91 = *(_QWORD *)(v87 + 16);
    v90 = *(_QWORD *)(v87 + 24);
    if (v91 >= v90 >> 1)
      v87 = (unint64_t)sub_1CF412750((_QWORD *)(v90 > 1), v91 + 1, 1, (_QWORD *)v87);
    *(_QWORD *)(v87 + 16) = v91 + 1;
    v92 = v87 + 24 * v91;
    *(_QWORD *)(v92 + 32) = v88;
    v93 = v92 + 32;
    v94 = 1;
LABEL_41:
    *(_QWORD *)(v93 + 8) = 0;
    *(_BYTE *)(v93 + 16) = v94;
    v154 = (_QWORD *)v87;
    sub_1CF3C7E20((uint64_t)v139, _s8MetadataV9LocalItemVMa);
    v51 = v150;
  }
  v126 = 0;
  v127 = v153;
  do
  {
    if ((v87 & 0xC000000000000001) != 0)
      v128 = (id)MEMORY[0x1D17D05F8](v126, v87);
    else
      v128 = *(id *)(v87 + 8 * v126 + 32);
    v129 = v128;
    v153 = v127;
    v131 = *(_QWORD *)(v127 + 16);
    v130 = *(_QWORD *)(v127 + 24);
    if (v131 >= v130 >> 1)
    {
      sub_1CF514C10(v130 > 1, v131 + 1, 1);
      v127 = v153;
    }
    ++v126;
    *(_QWORD *)(v127 + 16) = v131 + 1;
    v132 = v127 + 24 * v131;
    *(_QWORD *)(v132 + 32) = v129;
    *(_QWORD *)(v132 + 40) = 0;
    *(_BYTE *)(v132 + 48) = 0;
  }
  while (v125 != v126);
  swift_bridgeObjectRelease();
LABEL_73:
  sub_1CF428554(v127);
  v122 = _s8MetadataV9CloudItemVMa;
  v123 = v143;
LABEL_74:
  sub_1CF3C7E20(v123, v122);
  return v154;
}

uint64_t type metadata accessor for BankCredentialMappingModel.Change()
{
  uint64_t result;

  result = qword_1EFB94BD8;
  if (!qword_1EFB94BD8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1CF50CE4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94B70);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *sub_1CF50CE94(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1CF524AB8();
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 2, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94B70);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 2, v7);
    }
    v11 = *(int *)(a3 + 24);
    *((_BYTE *)a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
    v12 = *(void **)((char *)a2 + v11);
    *(uint64_t *)((char *)a1 + v11) = (uint64_t)v12;
    v13 = v12;
  }
  return a1;
}

void sub_1CF50CF88(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1CF524AB8();
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 2, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);

}

char *sub_1CF50CFF0(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = sub_1CF524AB8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94B70);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  v9 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  v10 = *(void **)&a2[v9];
  *(_QWORD *)&a1[v9] = v10;
  v11 = v10;
  return a1;
}

char *sub_1CF50D0B8(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v6 = sub_1CF524AB8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 2, v6);
  v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94B70);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
LABEL_7:
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  v12 = *(int *)(a3 + 24);
  v13 = *(void **)&a2[v12];
  v14 = *(void **)&a1[v12];
  *(_QWORD *)&a1[v12] = v13;
  v15 = v13;

  return a1;
}

char *sub_1CF50D1D8(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = sub_1CF524AB8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94B70);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  v9 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  *(_QWORD *)&a1[v9] = *(_QWORD *)&a2[v9];
  return a1;
}

char *sub_1CF50D29C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v6 = sub_1CF524AB8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 2, v6);
  v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94B70);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
LABEL_7:
  v12 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  v13 = *(void **)&a1[v12];
  *(_QWORD *)&a1[v12] = *(_QWORD *)&a2[v12];

  return a1;
}

uint64_t sub_1CF50D3B4()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF50D3C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94B70);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_1CF50D440()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF50D44C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94B70);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
  return result;
}

void sub_1CF50D4C8()
{
  unint64_t v0;

  sub_1CF50D548(319);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_1CF50D548(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  if (!qword_1EFB94BE8[0])
  {
    v2 = sub_1CF524AB8();
    v3 = sub_1CF3F7260(&qword_1EFB8F6D8, 255, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
    v5 = type metadata accessor for StoreMappingChangeType(a1, v2, v3, v4);
    if (!v6)
      atomic_store(v5, qword_1EFB94BE8);
  }
}

uint64_t static URL.financeLibraryURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F36A0);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1CF524980();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL.libraryURL.getter((uint64_t)v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_1CF3CB808((uint64_t)v4, &qword_1ED8F36A0);
    v9 = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
    sub_1CF524908();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v9 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a1, v9, 1, v5);
}

uint64_t static URL.libraryURL.getter@<X0>(uint64_t a1@<X8>)
{
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v8;
  void *v9;
  uint64_t v10;
  id v11[2];

  v11[1] = *(id *)MEMORY[0x1E0C80C00];
  v2 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
  v11[0] = 0;
  v3 = objc_msgSend(v2, sel_URLForDirectory_inDomain_appropriateForURL_create_error_, 5, 1, 0, 0, v11);

  v4 = v11[0];
  if (v3)
  {
    sub_1CF524938();
    v5 = v4;

    v6 = sub_1CF524980();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, 0, 1, v6);
  }
  else
  {
    v8 = v11[0];
    v9 = (void *)sub_1CF5248C0();

    swift_willThrow();
    v10 = sub_1CF524980();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(a1, 1, 1, v10);
  }
}

uint64_t static URL.financeLocalDatabaseURL.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF50D870(0xD000000000000010, 0x80000001CF531E30, a1);
}

uint64_t static URL.financeCloudDatabaseURL.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF50D870(0xD000000000000010, 0x80000001CF531E50, a1);
}

uint64_t sub_1CF50D870@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  unsigned int (*v19)(char *, uint64_t, uint64_t);
  void (*v20)(char *, uint64_t, uint64_t, uint64_t);
  void (*v21)(char *, char *, uint64_t);
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  _QWORD v26[2];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F36A0);
  v7 = MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)v26 - v10;
  v12 = sub_1CF524980();
  v13 = *(_QWORD **)(v12 - 8);
  v14 = MEMORY[0x1E0C80A78](v12);
  v16 = (char *)v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)v26 - v17;
  static URL.libraryURL.getter((uint64_t)v9);
  v19 = (unsigned int (*)(char *, uint64_t, uint64_t))v13[6];
  if (v19(v9, 1, v12) == 1)
  {
    sub_1CF3CB808((uint64_t)v9, &qword_1ED8F36A0);
    v20 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v13[7];
    v20(v11, 1, 1, v12);
  }
  else
  {
    v26[0] = a1;
    v26[1] = a2;
    v21 = (void (*)(char *, char *, uint64_t))v13[4];
    v21(v16, v9, v12);
    sub_1CF524908();
    v22 = (void (*)(char *, uint64_t))v13[1];
    v22(v16, v12);
    v20 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v13[7];
    v20(v11, 0, 1, v12);
    if (v19(v11, 1, v12) != 1)
    {
      v21(v18, v11, v12);
      sub_1CF524914();
      v22(v18, v12);
      v23 = a3;
      v24 = 0;
      return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v20)(v23, v24, 1, v12);
    }
  }
  sub_1CF3CB808((uint64_t)v11, &qword_1ED8F36A0);
  v23 = a3;
  v24 = 1;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v20)(v23, v24, 1, v12);
}

uint64_t static URL.financeDropboxDatabaseURL.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CF50D870(0xD000000000000012, 0x80000001CF531E70, a1);
}

uint64_t URL.filePath(relativeTo:resolveSymlinks:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  void (*v25)(char *, uint64_t, uint64_t);
  uint64_t v26;
  unsigned int (*v27)(char *, uint64_t, uint64_t);
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  uint64_t v30;
  char *v32;
  char v33;
  void (*v34)(char *, uint64_t);
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  char *v37;
  char *v38;
  uint64_t v39;
  void (*v40)(void);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v39 = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94C20);
  v6 = MEMORY[0x1E0C80A78](v5);
  v38 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v36 - v8;
  v10 = sub_1CF524D1C();
  v42 = *(_QWORD *)(v10 - 8);
  v11 = MEMORY[0x1E0C80A78](v10);
  v37 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v36 - v13;
  v15 = sub_1CF524980();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x1E0C80A78](v17);
  v22 = (char *)&v36 - v21;
  MEMORY[0x1E0C80A78](v20);
  v24 = (char *)&v36 - v23;
  v43 = a3;
  v41 = v16;
  if ((a2 & 1) != 0)
  {
    sub_1CF524920();
    sub_1CF524920();
    v25 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  }
  else
  {
    v25 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
    v25((char *)&v36 - v23, v39, v15);
    v25(v22, (uint64_t)v40, v15);
  }
  v25(v19, (uint64_t)v24, v15);
  sub_1CF524D04();
  v26 = v42;
  v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48);
  if (v27(v9, 1, v10) == 1)
    goto LABEL_7;
  v40 = *(void (**)(void))(v26 + 32);
  ((void (*)(char *, char *, uint64_t))v40)(v14, v9, v10);
  v25(v19, (uint64_t)v22, v15);
  v9 = v38;
  sub_1CF524D04();
  if (v27(v9, 1, v10) == 1)
  {
    (*(void (**)(char *, uint64_t))(v26 + 8))(v14, v10);
LABEL_7:
    v28 = *(void (**)(char *, uint64_t))(v41 + 8);
    v28(v22, v15);
    v28(v24, v15);
    sub_1CF3CB808((uint64_t)v9, &qword_1EFB94C20);
    goto LABEL_8;
  }
  v32 = v37;
  v40();
  v33 = sub_1CF524D10();
  v34 = *(void (**)(char *, uint64_t))(v26 + 8);
  v34(v14, v10);
  v35 = *(void (**)(char *, uint64_t))(v41 + 8);
  v35(v22, v15);
  v35(v24, v15);
  if ((v33 & 1) != 0)
  {
    v30 = v43;
    ((void (*)(uint64_t, char *, uint64_t))v40)(v43, v32, v10);
    v29 = 0;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 56))(v30, v29, 1, v10);
  }
  v34(v32, v10);
LABEL_8:
  v29 = 1;
  v30 = v43;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v26 + 56))(v30, v29, 1, v10);
}

_QWORD *sub_1CF50DDD8@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void sub_1CF50DDF8(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_1CF50DE04()
{
  sub_1CF50F234();
  sub_1CF50F278();
  return sub_1CF52588C();
}

uint64_t sub_1CF50DE4C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint8_t *v7;
  float v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  os_log_type_t v13;
  uint8_t *v14;
  _BYTE *v15;
  uint64_t v17;

  if ((unint64_t)(a1 - 129) < 0xFFFFFFFFFFFFFFAALL)
  {
    if (qword_1ED8F3648 != -1)
      swift_once();
    v2 = sub_1CF524C5C();
    __swift_project_value_buffer(v2, (uint64_t)qword_1ED8F2918);
    v3 = sub_1CF524C44();
    v4 = sub_1CF525208();
    v5 = v4;
    if (!os_log_type_enabled(v3, v4))
      goto LABEL_15;
    v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v6 = 134217984;
    sub_1CF525418();
    _os_log_impl(&dword_1CF3C3000, v3, (os_log_type_t)v5, "The codeVerifier length should be within [43,128] range: %ld", v6, 0xCu);
    v7 = v6;
    goto LABEL_14;
  }
  v8 = rintf((float)((float)a1 * 6.0) * 0.125);
  if ((~LODWORD(v8) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  if (v8 <= -9.2234e18)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (v8 >= 9.2234e18)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = (*(uint64_t (**)(uint64_t))(v1 + 16))((uint64_t)v8);
  if (!*(_QWORD *)(v9 + 16))
  {
    swift_bridgeObjectRelease();
    if (qword_1ED8F3648 == -1)
    {
LABEL_12:
      v12 = sub_1CF524C5C();
      __swift_project_value_buffer(v12, (uint64_t)qword_1ED8F2918);
      v3 = sub_1CF524C44();
      v13 = sub_1CF525208();
      v5 = v13;
      if (!os_log_type_enabled(v3, v13))
      {
LABEL_15:

        sub_1CF50EE98();
        swift_allocError();
        *v15 = 0;
        swift_willThrow();
        return v5;
      }
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1CF3C3000, v3, (os_log_type_t)v5, "Failed to generate random bytes", v14, 2u);
      v7 = v14;
LABEL_14:
      MEMORY[0x1D17D1060](v7, -1, -1);
      goto LABEL_15;
    }
LABEL_20:
    swift_once();
    goto LABEL_12;
  }
  v17 = sub_1CF50E5FC(v9);
  v11 = v10;
  sub_1CF5249B0();
  sub_1CF425DB8();
  sub_1CF525448();
  swift_bridgeObjectRelease();
  sub_1CF525448();
  swift_bridgeObjectRelease();
  v5 = sub_1CF525448();
  sub_1CF40A04C(v17, v11);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1CF50E210(int a1, size_t a2)
{
  uint64_t v4;
  uint64_t result;

  if ((a2 & 0x8000000000000000) != 0)
  {
    result = sub_1CF5256DC();
    __break(1u);
  }
  else
  {
    if (!a2)
      return MEMORY[0x1E0DEE9D8];
    v4 = sub_1CF525034();
    *(_QWORD *)(v4 + 16) = a2;
    memset((void *)(v4 + 32), a1, a2);
    return v4;
  }
  return result;
}

uint64_t sub_1CF50E2C8()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BankConnectPKCEGenerator()
{
  return objc_opt_self();
}

_BYTE *sub_1CF50E30C@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!result)
    goto LABEL_4;
  v4 = a2 - result;
  if (a2 == result)
  {
    result = 0;
LABEL_4:
    v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    result = (_BYTE *)sub_1CF50E444(result, a2);
    v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    result = (_BYTE *)sub_1CF50E504((uint64_t)result, (uint64_t)a2);
    v5 = v8 | 0x8000000000000000;
  }
  else
  {
    result = (_BYTE *)sub_1CF50E57C((uint64_t)result, (uint64_t)a2);
    v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_1CF50E380(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_1CF524818();
  if (!result || (result = sub_1CF524830(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_1CF524824();
      sub_1CF524DF4();
      sub_1CF3C6DA0(&qword_1EFB94C40, (uint64_t (*)(uint64_t))MEMORY[0x1E0CA9940], MEMORY[0x1E0CA9930]);
      return sub_1CF524D70();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1CF50E444(_BYTE *__src, _BYTE *a2)
{
  unint64_t v2;
  _BYTE __dst[14];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (__src)
    v2 = a2 - __src;
  else
    v2 = 0;
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF)
    goto LABEL_11;
  memset(__dst, 0, sizeof(__dst));
  v5 = v2;
  if (__src && a2 != __src)
    memcpy(__dst, __src, a2 - __src);
  return *(_QWORD *)__dst;
}

uint64_t sub_1CF50E504(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_1CF52483C();
  swift_allocObject();
  result = sub_1CF52480C();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_1CF52498C();
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_1CF50E57C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a1)
    v2 = a2 - a1;
  else
    v2 = 0;
  sub_1CF52483C();
  swift_allocObject();
  result = sub_1CF52480C();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0)
    return v2 << 32;
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_1CF50E5FC(uint64_t a1)
{
  _QWORD *v2;
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v7;
  _QWORD v8[3];
  uint64_t v9;
  unint64_t v10;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94C48);
  v10 = sub_1CF50EF64();
  v8[0] = a1;
  v2 = __swift_project_boxed_opaque_existential_1(v8, v9);
  v3 = (_BYTE *)(*v2 + 32);
  v4 = &v3[*(_QWORD *)(*v2 + 16)];
  swift_bridgeObjectRetain();
  sub_1CF50E30C(v3, v4, &v7);
  v5 = v7;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
  return v5;
}

uint8_t *sub_1CF50E694(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t *v23;
  unint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BYTE *v40;
  _QWORD v42[2];
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;

  v48 = a2;
  v55 = *MEMORY[0x1E0C80C00];
  v3 = sub_1CF524D94();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v45 = (char *)v42 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v46 = (char *)v42 - v7;
  v8 = sub_1CF524DF4();
  v44 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1CF524ECC();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94C28);
  v14 = MEMORY[0x1E0C80A78](v13);
  v47 = (uint64_t)v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)v42 - v16;
  sub_1CF524EC0();
  v43 = a1;
  sub_1CF524EA8();
  v18 = v12;
  v20 = v19;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v18, v9);
  if (v20 >> 60 != 15)
  {
    v42[1] = v4;
    sub_1CF3C6DA0(&qword_1EFB94C40, (uint64_t (*)(uint64_t))MEMORY[0x1E0CA9940], MEMORY[0x1E0CA9930]);
    sub_1CF524D88();
    __asm { BR              X10 }
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v17, 1, 1, v3);
  v21 = v47;
  sub_1CF50EEDC((uint64_t)v17, v47);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v21, 1, v3) == 1)
  {
    sub_1CF50EF24((uint64_t)v17);
    if (qword_1ED8F3648 != -1)
      swift_once();
    v22 = sub_1CF524C5C();
    v23 = (uint8_t *)__swift_project_value_buffer(v22, (uint64_t)qword_1ED8F2918);
    v24 = v48;
    swift_bridgeObjectRetain_n();
    v25 = sub_1CF524C44();
    v26 = sub_1CF525208();
    if (os_log_type_enabled(v25, v26))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v27 = swift_slowAlloc();
      v53 = v27;
      *(_DWORD *)v23 = 136315138;
      swift_bridgeObjectRetain();
      v51 = sub_1CF3F9B9C(v43, v24, &v53);
      sub_1CF525418();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1CF3C3000, v25, v26, "Failed to create codeChallenge from codeVerifier: %s", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17D1060](v27, -1, -1);
      MEMORY[0x1D17D1060](v23, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_1CF50EE98();
    swift_allocError();
    *v40 = 1;
    swift_willThrow();
  }
  else
  {
    v28 = v46;
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(v46, v21, v3);
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v45, v28, v3);
    sub_1CF3C6DA0(&qword_1EFB94C38, (uint64_t (*)(uint64_t))MEMORY[0x1E0CA92F8], MEMORY[0x1E0CA9308]);
    sub_1CF524F74();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v28, v3);
    sub_1CF50EF24((uint64_t)v17);
    v29 = swift_retain();
    v30 = sub_1CF50E5FC(v29);
    v32 = v31;
    v53 = sub_1CF5249B0();
    v54 = v33;
    v51 = 61;
    v52 = 0xE100000000000000;
    v49 = 0;
    v50 = 0xE000000000000000;
    sub_1CF425DB8();
    v34 = sub_1CF525448();
    v36 = v35;
    swift_bridgeObjectRelease();
    v53 = v34;
    v54 = v36;
    v51 = 43;
    v52 = 0xE100000000000000;
    v49 = 45;
    v50 = 0xE100000000000000;
    v37 = sub_1CF525448();
    v39 = v38;
    swift_bridgeObjectRelease();
    v53 = v37;
    v54 = v39;
    v51 = 47;
    v52 = 0xE100000000000000;
    v49 = 95;
    v50 = 0xE100000000000000;
    v23 = (uint8_t *)sub_1CF525448();
    sub_1CF40A04C(v30, v32);
    swift_release_n();
    swift_bridgeObjectRelease();
  }
  return v23;
}

unint64_t sub_1CF50EE98()
{
  unint64_t result;

  result = qword_1EFB94C30;
  if (!qword_1EFB94C30)
  {
    result = MEMORY[0x1D17D0F7C](&unk_1CF52C6C0, &type metadata for BankConnectPKCEGeneratorError);
    atomic_store(result, (unint64_t *)&qword_1EFB94C30);
  }
  return result;
}

uint64_t sub_1CF50EEDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94C28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1CF50EF24(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94C28);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1CF50EF64()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EFB94C50;
  if (!qword_1EFB94C50)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFB94C48);
    result = MEMORY[0x1D17D0F7C](MEMORY[0x1E0CB1B08], v1);
    atomic_store(result, (unint64_t *)&qword_1EFB94C50);
  }
  return result;
}

uint64_t sub_1CF50EFB0(size_t a1)
{
  uint64_t v1;
  const __SecRandom *v2;
  size_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;

  v1 = sub_1CF50E210(0, a1);
  v2 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
  v3 = *(_QWORD *)(v1 + 16);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v1 = (uint64_t)sub_1CF412EF0(0, v3, 0, (char *)v1);
  if (SecRandomCopyBytes(v2, v3, (void *)(v1 + 32)))
  {
    swift_bridgeObjectRelease();
    if (qword_1ED8F3648 != -1)
      swift_once();
    v4 = sub_1CF524C5C();
    __swift_project_value_buffer(v4, (uint64_t)qword_1ED8F2918);
    v5 = sub_1CF524C44();
    v6 = sub_1CF525208();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v7 = 67109120;
      sub_1CF525418();
      _os_log_impl(&dword_1CF3C3000, v5, v6, "Failed to generate random bytes %d", v7, 8u);
      MEMORY[0x1D17D1060](v7, -1, -1);
    }

    return MEMORY[0x1E0DEE9D8];
  }
  return v1;
}

uint64_t storeEnumTagSinglePayload for BankConnectPKCEGeneratorError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1CF50F16C + 4 * byte_1CF52C595[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1CF50F1A0 + 4 * byte_1CF52C590[v4]))();
}

uint64_t sub_1CF50F1A0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CF50F1A8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CF50F1B0);
  return result;
}

uint64_t sub_1CF50F1BC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CF50F1C4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1CF50F1C8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CF50F1D0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for BankConnectPKCEGeneratorError()
{
  return &type metadata for BankConnectPKCEGeneratorError;
}

unint64_t sub_1CF50F1F0()
{
  unint64_t result;

  result = qword_1EFB94C58;
  if (!qword_1EFB94C58)
  {
    result = MEMORY[0x1D17D0F7C](&unk_1CF52C698, &type metadata for BankConnectPKCEGeneratorError);
    atomic_store(result, (unint64_t *)&qword_1EFB94C58);
  }
  return result;
}

unint64_t sub_1CF50F234()
{
  unint64_t result;

  result = qword_1EFB94C60;
  if (!qword_1EFB94C60)
  {
    result = MEMORY[0x1D17D0F7C](&unk_1CF52C620, &type metadata for BankConnectPKCEGeneratorError);
    atomic_store(result, (unint64_t *)&qword_1EFB94C60);
  }
  return result;
}

unint64_t sub_1CF50F278()
{
  unint64_t result;

  result = qword_1EFB94C68;
  if (!qword_1EFB94C68)
  {
    result = MEMORY[0x1D17D0F7C](MEMORY[0x1E0DEB470], MEMORY[0x1E0DEB418]);
    atomic_store(result, (unint64_t *)&qword_1EFB94C68);
  }
  return result;
}

uint64_t sub_1CF50F2BC(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int16 v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v11 = MEMORY[0x1E0DEE9D8];
    sub_1CF514E74(0, v1, 0);
    v2 = v11;
    v4 = *(_QWORD *)(sub_1CF522418() - 8);
    v5 = a1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v6 = *(_QWORD *)(v4 + 72);
    do
    {
      v7 = sub_1CF52240C();
      v9 = *(_QWORD *)(v11 + 16);
      v8 = *(_QWORD *)(v11 + 24);
      if (v9 >= v8 >> 1)
        sub_1CF514E74(v8 > 1, v9 + 1, 1);
      *(_QWORD *)(v11 + 16) = v9 + 1;
      *(_WORD *)(v11 + 2 * v9 + 32) = v7;
      v5 += v6;
      --v1;
    }
    while (v1);
  }
  return v2;
}

uint64_t sub_1CF50F3AC(uint64_t a1, int a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  __int128 v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;

  v47 = a2;
  v9 = sub_1CF522598();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = MEMORY[0x1E0DEE9D8];
  if ((a3 & 1) != 0)
  {
    v13 = v48;
    if (!a1)
      goto LABEL_18;
    goto LABEL_15;
  }
  v42 = a1;
  v45 = a3;
  v44 = a5;
  sub_1CF3D3DF4(0, (unint64_t *)&qword_1ED8F4498);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F3680);
  v14 = swift_allocObject();
  v46 = xmmword_1CF528560;
  *(_OWORD *)(v14 + 16) = xmmword_1CF528560;
  v15 = sub_1CF522400();
  v16 = sub_1CF50F2BC(v15);
  v43 = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(v14 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94C70);
  *(_QWORD *)(v14 + 64) = sub_1CF50FBCC();
  *(_QWORD *)(v14 + 32) = v16;
  v40 = (id)sub_1CF5251CC();
  v41 = sub_1CF50FCD4();
  v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = v46;
  (*(void (**)(char *, _QWORD, uint64_t))(v10 + 104))(v12, *MEMORY[0x1E0CAB9B0], v9);
  LOWORD(v14) = sub_1CF52258C();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v18 = MEMORY[0x1E0DEDBA8];
  *(_QWORD *)(v17 + 56) = MEMORY[0x1E0DEDB58];
  *(_QWORD *)(v17 + 64) = v18;
  *(_WORD *)(v17 + 32) = v14;
  v19 = (void *)sub_1CF5251CC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F29D8);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_1CF526FD0;
  *(_QWORD *)(v20 + 32) = sub_1CF5251CC();
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = v46;
  v22 = sub_1CF524A10();
  *(_QWORD *)(v21 + 56) = sub_1CF3D3DF4(0, &qword_1EFB92120);
  *(_QWORD *)(v21 + 64) = sub_1CF46F438();
  *(_QWORD *)(v21 + 32) = v22;
  *(_QWORD *)(v20 + 40) = sub_1CF5251CC();
  v49 = v20;
  sub_1CF525004();
  v23 = (void *)sub_1CF524FE0();
  swift_bridgeObjectRelease();
  v24 = objc_msgSend((id)objc_opt_self(), sel_orPredicateWithSubpredicates_, v23);

  v25 = (id)v50;
  if (v50 >> 62)
  {
    swift_bridgeObjectRetain();
    v26 = sub_1CF5256F4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v26 = *(_QWORD *)((v50 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  LOBYTE(a3) = v45;
  if (__OFADD__(v26, 4))
  {
    __break(1u);
  }
  else
  {
    sub_1CF50FC18(v26 + 4, 1);
    sub_1CF525004();
    v25 = v40;
    MEMORY[0x1D17CFFEC]();
    if (*(_QWORD *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10) < *(_QWORD *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_8;
  }
  sub_1CF52501C();
LABEL_8:
  sub_1CF52504C();
  sub_1CF525004();
  v27 = v41;
  MEMORY[0x1D17CFFEC]();
  if (*(_QWORD *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1CF52501C();
  sub_1CF52504C();
  sub_1CF525004();
  v28 = v19;
  MEMORY[0x1D17CFFEC]();
  if (*(_QWORD *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1CF52501C();
  sub_1CF52504C();
  sub_1CF525004();
  v29 = v24;
  MEMORY[0x1D17CFFEC]();
  if (*(_QWORD *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_1CF52501C();
  sub_1CF52504C();
  sub_1CF525004();

  v13 = v48;
  if (v42)
  {
LABEL_15:
    sub_1CF523834();
    sub_1CF523828();
    MEMORY[0x1D17CFFEC]();
    if (*(_QWORD *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1CF52501C();
    sub_1CF52504C();
    sub_1CF525004();
  }
LABEL_18:
  if ((v47 & 1) != 0 && (a3 & 1) == 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F29D8);
    v30 = swift_allocObject();
    *(_OWORD *)(v30 + 16) = xmmword_1CF526FD0;
    sub_1CF3D3DF4(0, (unint64_t *)&qword_1ED8F4498);
    *(_QWORD *)(v30 + 32) = sub_1CF5251CC();
    *(_QWORD *)(v30 + 40) = sub_1CF5251CC();
    v49 = v30;
    sub_1CF525004();
    v31 = (void *)sub_1CF524FE0();
    swift_bridgeObjectRelease();
    v32 = objc_msgSend((id)objc_opt_self(), sel_orPredicateWithSubpredicates_, v31);

    MEMORY[0x1D17CFFEC]();
    if (*(_QWORD *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_1CF52501C();
    sub_1CF52504C();
    sub_1CF525004();
  }
  sub_1CF523834();
  v33 = (void *)sub_1CF523804();
  sub_1CF3D3DF4(0, (unint64_t *)&qword_1ED8F4498);
  v34 = (void *)sub_1CF524FE0();
  swift_bridgeObjectRelease();
  v35 = objc_msgSend((id)objc_opt_self(), sel_andPredicateWithSubpredicates_, v34);

  objc_msgSend(v33, sel_setPredicate_, v35);
  sub_1CF3D3DF4(0, &qword_1EFB90228);
  v36 = (void *)sub_1CF524FE0();
  objc_msgSend(v33, sel_setSortDescriptors_, v36);

  objc_msgSend(v33, sel_setReturnsObjectsAsFaults_, 0);
  if (*(_QWORD *)(v13 + 40))
    v37 = (void *)sub_1CF524FE0();
  else
    v37 = 0;
  objc_msgSend(v33, sel_setRelationshipKeyPathsForPrefetching_, v37);

  if ((*(_BYTE *)(v13 + 32) & 1) == 0)
    objc_msgSend(v33, sel_setFetchLimit_, *(_QWORD *)(v13 + 24));
  v38 = sub_1CF525388();

  return v38;
}

uint64_t sub_1CF50FB80()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ClassifiableTransactionSource()
{
  return objc_opt_self();
}

unint64_t sub_1CF50FBCC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EFB94C78;
  if (!qword_1EFB94C78)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFB94C70);
    result = MEMORY[0x1D17D0F7C](MEMORY[0x1E0CB1B18], v1);
    atomic_store(result, (unint64_t *)&qword_1EFB94C78);
  }
  return result;
}

uint64_t sub_1CF50FC18(uint64_t a1, char a2)
{
  uint64_t *v2;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *v2;
  result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v2 = v5;
  v7 = 0;
  if ((result & 1) != 0 && (v5 & 0x8000000000000000) == 0 && (v5 & 0x4000000000000000) == 0)
  {
    if (a1 <= *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x18) >> 1)
      return result;
    v7 = 1;
  }
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    v8 = sub_1CF5256F4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v8 <= a1)
    v9 = a1;
  else
    v9 = v8;
  result = MEMORY[0x1D17D0604](v7, v9, a2 & 1, v5);
  *v2 = result;
  return result;
}

id sub_1CF50FCD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[2];

  v0 = sub_1CF522664();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F29D8);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1CF526FD0;
  sub_1CF3D3DF4(0, (unint64_t *)&qword_1ED8F4498);
  *(_QWORD *)(v4 + 32) = sub_1CF5251CC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F3680);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1CF528560;
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0CABA68], v0);
  v6 = sub_1CF522658();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  v7 = MEMORY[0x1E0DEDBA8];
  *(_QWORD *)(v5 + 56) = MEMORY[0x1E0DEDB58];
  *(_QWORD *)(v5 + 64) = v7;
  *(_WORD *)(v5 + 32) = v6;
  *(_QWORD *)(v4 + 40) = sub_1CF5251CC();
  v11[1] = v4;
  sub_1CF525004();
  v8 = (void *)sub_1CF524FE0();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend((id)objc_opt_self(), sel_orPredicateWithSubpredicates_, v8);

  return v9;
}

uint64_t BankConnectServiceImplementation.validateAccountConnection(with:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[14] = a1;
  v2[15] = v1;
  v3 = sub_1CF523E7C();
  v2[16] = v3;
  v2[17] = *(_QWORD *)(v3 - 8);
  v2[18] = swift_task_alloc();
  type metadata accessor for BankConnectAccountConnectionValidationResult();
  v2[19] = swift_task_alloc();
  v2[20] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CF50FF44()
{
  _QWORD *v0;
  _QWORD *v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  const void *v7;
  uint64_t v8;
  _QWORD *v9;

  v1 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v0[15] + 16), *(_QWORD *)(v0[15] + 40));
  v0[10] = &type metadata for BankConnectEnvironmentImplementation;
  v2 = sub_1CF415200();
  v0[11] = v2;
  v3 = swift_allocObject();
  v0[7] = v3;
  sub_1CF3D0690((uint64_t)v1, v3 + 16);
  v4 = type metadata accessor for BankConnectAccountConnectionValidator();
  v5 = (_QWORD *)swift_allocObject();
  v6 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)(v0 + 7), (uint64_t)&type metadata for BankConnectEnvironmentImplementation);
  v7 = (const void *)swift_task_alloc();
  initializeWithCopy for BankConnectEnvironmentImplementation((uint64_t)v7, v6);
  v5[5] = &type metadata for BankConnectEnvironmentImplementation;
  v5[6] = v2;
  v8 = swift_allocObject();
  v5[2] = v8;
  memcpy((void *)(v8 + 16), v7, 0x2E8uLL);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)(v0 + 7));
  swift_task_dealloc();
  v0[5] = v4;
  v0[6] = &off_1E8C6E648;
  v0[2] = v5;
  __swift_project_boxed_opaque_existential_1(v0 + 2, v4);
  v9 = (_QWORD *)swift_task_alloc();
  v0[21] = v9;
  *v9 = v0;
  v9[1] = sub_1CF5100BC;
  return sub_1CF4D07A4(v0[20], v0[14]);
}

uint64_t sub_1CF5100BC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CF510110()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  os_log_type_t type;
  uint64_t v23;
  uint64_t v24;

  if (qword_1EFB8F220 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 160);
  v5 = *(_QWORD *)(v0 + 136);
  v4 = *(_QWORD *)(v0 + 144);
  v6 = *(_QWORD *)(v0 + 128);
  v7 = sub_1CF524C5C();
  __swift_project_value_buffer(v7, (uint64_t)qword_1EFB915A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v1, v6);
  sub_1CF4D23A0(v2, v3);
  v8 = sub_1CF524C44();
  v9 = sub_1CF525220();
  v10 = os_log_type_enabled(v8, v9);
  v12 = *(_QWORD *)(v0 + 152);
  v11 = *(_QWORD *)(v0 + 160);
  v14 = *(_QWORD *)(v0 + 136);
  v13 = *(_QWORD *)(v0 + 144);
  v15 = *(_QWORD *)(v0 + 128);
  if (v10)
  {
    type = v9;
    v16 = swift_slowAlloc();
    v23 = swift_slowAlloc();
    *(_DWORD *)v16 = 136315394;
    v24 = v23;
    sub_1CF510768();
    v17 = sub_1CF5257F0();
    *(_QWORD *)(v0 + 96) = sub_1CF3F9B9C(v17, v18, &v24);
    sub_1CF525418();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    *(_WORD *)(v16 + 12) = 2080;
    sub_1CF510470();
    *(_QWORD *)(v0 + 104) = sub_1CF3F9B9C(v19, v20, &v24);
    sub_1CF525418();
    swift_bridgeObjectRelease();
    sub_1CF4D1CDC(v12);
    _os_log_impl(&dword_1CF3C3000, v8, type, "Finished validating account(%s) with result %s", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1D17D1060](v23, -1, -1);
    MEMORY[0x1D17D1060](v16, -1, -1);

  }
  else
  {

    sub_1CF4D1CDC(v12);
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  }
  sub_1CF4D1CDC(v11);
  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CF51039C()
{
  uint64_t v0;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  __swift_destroy_boxed_opaque_existential_1(v0 + 64);
  __swift_destroy_boxed_opaque_existential_1(v0 + 104);
  __swift_destroy_boxed_opaque_existential_1(v0 + 144);
  __swift_destroy_boxed_opaque_existential_1(v0 + 184);
  __swift_destroy_boxed_opaque_existential_1(v0 + 224);
  __swift_destroy_boxed_opaque_existential_1(v0 + 264);
  __swift_destroy_boxed_opaque_existential_1(v0 + 304);
  __swift_destroy_boxed_opaque_existential_1(v0 + 344);
  __swift_destroy_boxed_opaque_existential_1(v0 + 384);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 432);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1(v0 + 480);
  __swift_destroy_boxed_opaque_existential_1(v0 + 520);
  __swift_destroy_boxed_opaque_existential_1(v0 + 560);
  __swift_destroy_boxed_opaque_existential_1(v0 + 600);
  if (*(_QWORD *)(v0 + 664))
    __swift_destroy_boxed_opaque_existential_1(v0 + 640);
  if (*(_QWORD *)(v0 + 704))
    __swift_destroy_boxed_opaque_existential_1(v0 + 680);
  __swift_destroy_boxed_opaque_existential_1(v0 + 720);
  return swift_deallocObject();
}

void sub_1CF510470()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;

  v1 = sub_1CF523E7C();
  MEMORY[0x1E0C80A78](v1);
  v2 = sub_1CF5229DC();
  MEMORY[0x1E0C80A78](v2);
  v3 = type metadata accessor for BankConnectAccountConnectionValidationResult();
  MEMORY[0x1E0C80A78](v3);
  sub_1CF4D23A0(v0, (uint64_t)&v6 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = (char *)sub_1CF510584 + 4 * byte_1CF52C770[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_1CF510584()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v1, v2, v0);
  *(_QWORD *)(v4 - 96) = 0;
  *(_QWORD *)(v4 - 88) = 0xE000000000000000;
  sub_1CF525598();
  v5 = *(_QWORD *)(v4 - 88);
  *(_QWORD *)(v4 - 96) = *(_QWORD *)(v4 - 96);
  *(_QWORD *)(v4 - 88) = v5;
  sub_1CF524F38();
  sub_1CF525628();
  sub_1CF524F38();
  v6 = *(_QWORD *)(v4 - 96);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v0);
  return v6;
}

unint64_t sub_1CF510768()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EFB8F7F8;
  if (!qword_1EFB8F7F8)
  {
    v1 = sub_1CF523E7C();
    result = MEMORY[0x1D17D0F7C](MEMORY[0x1E0CAD3A0], v1);
    atomic_store(result, (unint64_t *)&qword_1EFB8F7F8);
  }
  return result;
}

uint64_t sub_1CF5107B0(unint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  if (a1 >> 62)
    goto LABEL_14;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = MEMORY[0x1E0DEE9D8];
    if (!v2)
      break;
    v8 = MEMORY[0x1E0DEE9D8];
    result = sub_1CF525604();
    if (v2 < 0)
    {
      __break(1u);
      return result;
    }
    v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x1D17D05F8](v4, a1);
      else
        v5 = *(id *)(a1 + 8 * v4 + 32);
      v6 = v5;
      ++v4;
      v7 = objc_msgSend(v5, sel_key);

      sub_1CF5255EC();
      sub_1CF525610();
      sub_1CF52561C();
      sub_1CF5255F8();
      if (v2 == v4)
        return v8;
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    v2 = sub_1CF5256F4();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1CF5108F0(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if (a1 >> 62)
    goto LABEL_15;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v3 = MEMORY[0x1E0DEE9D8];
    if (!v2)
      return v3;
    v15 = MEMORY[0x1E0DEE9D8];
    result = sub_1CF514AEC(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0)
      break;
    v5 = 0;
    v3 = v15;
    while (v2 != v5)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v6 = (id)MEMORY[0x1D17D05F8](v5, a1);
      else
        v6 = *(id *)(a1 + 8 * v5 + 32);
      v7 = v6;
      v8 = objc_msgSend(v6, sel_identifier);
      v9 = sub_1CF524E9C();
      v11 = v10;

      v13 = *(_QWORD *)(v15 + 16);
      v12 = *(_QWORD *)(v15 + 24);
      if (v13 >= v12 >> 1)
        sub_1CF514AEC(v12 > 1, v13 + 1, 1);
      ++v5;
      *(_QWORD *)(v15 + 16) = v13 + 1;
      v14 = v15 + 16 * v13;
      *(_QWORD *)(v14 + 32) = v9;
      *(_QWORD *)(v14 + 40) = v11;
      if (v2 == v5)
        return v3;
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    v2 = sub_1CF5256F4();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_1CF510A68(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_1CF5258B0();
    sub_1CF524F08();
    v6 = sub_1CF5258F8();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_1CF525814() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_1CF525814() & 1) != 0)
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

uint64_t sub_1CF510B9C(void *a1, uint64_t a2)
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
    v4 = sub_1CF525520();

    return v4 & 1;
  }
  if (!*(_QWORD *)(a2 + 16)
    || (v6 = sub_1CF5253C4(),
        v7 = -1 << *(_BYTE *)(a2 + 32),
        v8 = v6 & ~v7,
        v9 = a2 + 56,
        ((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0))
  {
LABEL_11:
    v12 = 0;
    return v12 & 1;
  }
  sub_1CF3D3DF4(0, &qword_1EFB94CC0);
  v10 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v8);
  v11 = sub_1CF5253D0();

  if ((v11 & 1) == 0)
  {
    v13 = ~v7;
    v14 = (v8 + 1) & v13;
    if (((*(_QWORD *)(v9 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
    {
      do
      {
        v15 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v14);
        v12 = sub_1CF5253D0();

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

uint64_t WalletMessagingProvider.processMessages()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[14] = v0;
  v2 = sub_1CF524980();
  v1[15] = v2;
  v1[16] = *(_QWORD *)(v2 - 8);
  v1[17] = swift_task_alloc();
  v3 = sub_1CF525370();
  v1[18] = v3;
  v1[19] = *(_QWORD *)(v3 - 8);
  v1[20] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CF510D98()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t result;
  NSObject *v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;

  if (qword_1ED8F43E0 != -1)
    swift_once();
  v1 = sub_1CF524C5C();
  *(_QWORD *)(v0 + 168) = __swift_project_value_buffer(v1, (uint64_t)qword_1ED8F43C0);
  v2 = sub_1CF524C44();
  v3 = sub_1CF5251F0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CF3C3000, v2, v3, "Processing Wallet messages", v4, 2u);
    MEMORY[0x1D17D1060](v4, -1, -1);
  }
  v5 = *(_QWORD *)(v0 + 112);

  v6 = *(_QWORD *)(v5 + OBJC_IVAR____TtC13FinanceDaemon23WalletMessagingProvider_messageSink);
  *(_QWORD *)(v0 + 176) = v6;
  if (v6)
  {
    v7 = *(_QWORD *)(v0 + 112);
    v8 = OBJC_IVAR____TtC13FinanceDaemon23WalletMessagingProvider_coreDataStore;
    if (*(_QWORD *)(v7 + OBJC_IVAR____TtC13FinanceDaemon23WalletMessagingProvider_coreDataStore))
    {
      swift_unknownObjectRetain();
LABEL_8:
      v10 = *(_QWORD *)(v0 + 152);
      v9 = *(_QWORD *)(v0 + 160);
      v11 = *(_QWORD *)(v0 + 144);
      swift_retain();
      v12 = (void *)sub_1CF52210C();
      *(_QWORD *)(v0 + 184) = v12;
      swift_release();
      v13 = swift_allocObject();
      *(_QWORD *)(v0 + 192) = v13;
      *(_QWORD *)(v13 + 16) = v12;
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v10 + 104))(v9, *MEMORY[0x1E0C977C0], v11);
      v12;
      v14 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 200) = v14;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94CB0);
      *v14 = v0;
      v14[1] = sub_1CF5111DC;
      return sub_1CF525394();
    }
    sub_1CF5224CC();
    swift_unknownObjectRetain();
    sub_1CF5224B4();
    v19 = sub_1CF5224C0();
    swift_release();
    *(_QWORD *)(v7 + v8) = v19;
    result = swift_release();
    if (*(_QWORD *)(v7 + v8))
    {
      swift_retain();
      goto LABEL_8;
    }
    __break(1u);
  }
  else
  {
    v16 = sub_1CF524C44();
    v17 = sub_1CF525208();
    if (os_log_type_enabled(v16, (os_log_type_t)v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1CF3C3000, v16, (os_log_type_t)v17, "No message sink, skipping Wallet message processing", v18, 2u);
      MEMORY[0x1D17D1060](v18, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  return result;
}

uint64_t sub_1CF5111DC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(void **)(*(_QWORD *)v1 + 184);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 152);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 160);
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 144);
  *(_QWORD *)(*(_QWORD *)v1 + 208) = v0;
  swift_task_dealloc();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  return swift_task_switch();
}

void sub_1CF511268()
{
  uint64_t v0;
  unint64_t v1;
  id v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  int64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  unsigned __int8 v37;
  id v38;
  NSObject *v39;
  os_log_type_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  int64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  char v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  void (*v76)(uint64_t, _QWORD);
  uint64_t v77;
  uint64_t v78;
  int64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  int64_t v84;
  void *v85;
  void *v86;
  uint64_t v88;
  int64_t v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  int64_t v94;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char v103;

  v1 = *(_QWORD *)(v0 + 48);
  v2 = objc_msgSend(*(id *)(v0 + 176), sel_registrations);
  if (v2)
  {
    v3 = v2;
    sub_1CF3D3DF4(0, &qword_1EFB94CD0);
    v4 = sub_1CF524FEC();

    v5 = sub_1CF5107B0(v4);
    swift_bridgeObjectRelease();
    v6 = sub_1CF5108F0(v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = MEMORY[0x1E0DEE9D8];
  }
  v7 = sub_1CF4D4D44(v6);
  swift_bridgeObjectRelease();
  v98 = v1 & 0xC000000000000001;
  if ((v1 & 0xC000000000000001) != 0)
  {
    v8 = sub_1CF525664();
    v96 = 0;
    v9 = 0;
    v10 = v1;
    v11 = 0;
    v12 = v8 | 0x8000000000000000;
  }
  else
  {
    v13 = -1 << *(_BYTE *)(v1 + 32);
    v9 = ~v13;
    v96 = v1 + 64;
    v14 = -v13;
    if (v14 < 64)
      v15 = ~(-1 << v14);
    else
      v15 = -1;
    v10 = v1;
    v11 = v15 & *(_QWORD *)(v1 + 64);
    v12 = v1;
  }
  v99 = *(_QWORD *)(v0 + 128);
  v94 = (unint64_t)(v9 + 64) >> 6;
  v95 = v10;
  swift_bridgeObjectRetain();
  v16 = 0;
  v91 = v7;
  v97 = v12;
  if ((v12 & 0x8000000000000000) == 0)
    goto LABEL_16;
LABEL_11:
  v17 = sub_1CF5256C4();
  if (v17)
  {
    v19 = v18;
    *(_QWORD *)(v0 + 72) = v17;
    sub_1CF3D3DF4(0, &qword_1EFB94CC0);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v20 = *(id *)(v0 + 64);
    swift_unknownObjectRelease();
    *(_QWORD *)(v0 + 88) = v19;
    sub_1CF3D3DF4(0, &qword_1EFB94CC8);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v21 = *(id *)(v0 + 80);
    swift_unknownObjectRelease();
    v22 = v16;
    v23 = v11;
    if (v20)
    {
      while (1)
      {
        v29 = *(_QWORD *)(v0 + 136);
        v30 = *(_QWORD *)(v0 + 120);
        v31 = objc_msgSend(v20, sel_URIRepresentation);
        sub_1CF524938();

        v32 = sub_1CF5248E4();
        v34 = v33;
        (*(void (**)(uint64_t, uint64_t))(v99 + 8))(v29, v30);
        if ((sub_1CF510A68(v32, v34, v7) & 1) != 0)
        {
          swift_bridgeObjectRelease();

          goto LABEL_15;
        }
        v35 = *(void **)(v0 + 176);
        v36 = (void *)sub_1CF524E78();
        swift_bridgeObjectRelease();
        v37 = objc_msgSend(v35, sel_registerMessageForIdentifier_withRequest_, v36, v21);

        if ((v37 & 1) != 0)
          break;
        v38 = v20;
        v39 = sub_1CF524C44();
        v40 = sub_1CF525208();
        if (!os_log_type_enabled(v39, v40))
        {

LABEL_15:
          v16 = v22;
          v11 = v23;
          v12 = v97;
          if ((v97 & 0x8000000000000000) != 0)
            goto LABEL_11;
          goto LABEL_16;
        }
        v41 = swift_slowAlloc();
        v92 = swift_slowAlloc();
        v101 = v92;
        *(_DWORD *)v41 = 136315138;
        v42 = objc_msgSend(v38, sel_debugDescription);
        v43 = sub_1CF524E9C();
        v93 = v23;
        v45 = v44;

        v7 = v91;
        *(_QWORD *)(v41 + 4) = sub_1CF3F9B9C(v43, v45, &v101);
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_1CF3C3000, v39, v40, "Error registering message %s", (uint8_t *)v41, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1D17D1060](v92, -1, -1);
        MEMORY[0x1D17D1060](v41, -1, -1);

        v16 = v22;
        v11 = v93;
        v12 = v97;
        if ((v97 & 0x8000000000000000) != 0)
          goto LABEL_11;
LABEL_16:
        if (v11)
        {
          v23 = (v11 - 1) & v11;
          v24 = __clz(__rbit64(v11)) | (v16 << 6);
          v22 = v16;
        }
        else
        {
          v22 = v16 + 1;
          if (__OFADD__(v16, 1))
            goto LABEL_88;
          if (v22 >= v94)
            goto LABEL_41;
          v25 = *(_QWORD *)(v96 + 8 * v22);
          if (!v25)
          {
            v26 = v16 + 2;
            if (v16 + 2 >= v94)
              goto LABEL_41;
            v25 = *(_QWORD *)(v96 + 8 * v26);
            if (v25)
              goto LABEL_25;
            v26 = v16 + 3;
            if (v16 + 3 >= v94)
              goto LABEL_41;
            v25 = *(_QWORD *)(v96 + 8 * v26);
            if (v25)
            {
LABEL_25:
              v22 = v26;
            }
            else
            {
              v22 = v16 + 4;
              if (v16 + 4 >= v94)
                goto LABEL_41;
              v25 = *(_QWORD *)(v96 + 8 * v22);
              if (!v25)
              {
                v46 = v16 + 5;
                while (v94 != v46)
                {
                  v25 = *(_QWORD *)(v96 + 8 * v46++);
                  if (v25)
                  {
                    v22 = v46 - 1;
                    goto LABEL_26;
                  }
                }
                goto LABEL_41;
              }
            }
          }
LABEL_26:
          v23 = (v25 - 1) & v25;
          v24 = __clz(__rbit64(v25)) + (v22 << 6);
        }
        v27 = 8 * v24;
        v28 = *(void **)(*(_QWORD *)(v12 + 56) + v27);
        v20 = *(id *)(*(_QWORD *)(v12 + 48) + v27);
        v21 = v28;
        if (!v20)
          goto LABEL_41;
      }

      goto LABEL_15;
    }
  }
LABEL_41:
  sub_1CF3D1FAC();
  if (v98)
  {
    v47 = v95;
    v48 = sub_1CF5254F0();
    if (v48)
    {
LABEL_43:
      v100 = MEMORY[0x1E0DEE9D8];
      sub_1CF514AEC(0, v48 & ~(v48 >> 63), 0);
      if (v98)
      {
        v49 = sub_1CF525658();
        v51 = 1;
      }
      else
      {
        v49 = sub_1CF519B70(v47);
        v51 = v53 & 1;
      }
      v101 = v49;
      v102 = v50;
      v103 = v51;
      if (v48 < 0)
        goto LABEL_89;
      do
      {
        while (1)
        {
          v64 = *(_QWORD *)(v0 + 136);
          v65 = *(_QWORD *)(v0 + 120);
          sub_1CF5199B4(v101, v102, v103, v47);
          v67 = v66;
          v68 = objc_msgSend(v66, sel_URIRepresentation);
          sub_1CF524938();

          v69 = sub_1CF5248E4();
          v71 = v70;
          (*(void (**)(uint64_t, uint64_t))(v99 + 8))(v64, v65);

          v72 = v100;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1CF514AEC(0, *(_QWORD *)(v100 + 16) + 1, 1);
            v72 = v100;
          }
          v74 = *(_QWORD *)(v72 + 16);
          v73 = *(_QWORD *)(v72 + 24);
          if (v74 >= v73 >> 1)
          {
            sub_1CF514AEC(v73 > 1, v74 + 1, 1);
            v72 = v100;
          }
          *(_QWORD *)(v72 + 16) = v74 + 1;
          v75 = v72 + 16 * v74;
          *(_QWORD *)(v75 + 32) = v69;
          *(_QWORD *)(v75 + 40) = v71;
          if (v98)
            break;
          v55 = v101;
          v54 = v102;
          v56 = v103;
          sub_1CF519818(v101, v102, v103, v47);
          v58 = v57;
          v60 = v59;
          v62 = v61;
          sub_1CF3EDC40(v55, v54, v56);
          v101 = v58;
          v102 = v60;
          v63 = v62 & 1;
          v47 = v95;
          v103 = v63;
          if (!--v48)
            goto LABEL_60;
        }
        if ((v103 & 1) == 0)
          goto LABEL_90;
        if (sub_1CF525688())
          swift_isUniquelyReferenced_nonNull_native();
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94CB8);
        v76 = (void (*)(uint64_t, _QWORD))sub_1CF524E24();
        sub_1CF5256D0();
        v76(v0 + 16, 0);
        --v48;
      }
      while (v48);
LABEL_60:
      sub_1CF3EDC40(v101, v102, v103);
      swift_bridgeObjectRelease();
      v52 = v100;
      v7 = v91;
      goto LABEL_61;
    }
  }
  else
  {
    v47 = v95;
    v48 = *(_QWORD *)(v95 + 16);
    if (v48)
      goto LABEL_43;
  }
  swift_bridgeObjectRelease();
  v52 = MEMORY[0x1E0DEE9D8];
LABEL_61:
  v77 = sub_1CF4D4D44(v52);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v77 + 16) <= *(_QWORD *)(v7 + 16) >> 3)
  {
    v101 = v7;
    sub_1CF518630(v77);
    swift_bridgeObjectRelease();
    v78 = v101;
  }
  else
  {
    v78 = sub_1CF51684C(v77, v7);
    swift_bridgeObjectRelease();
  }
  v79 = 0;
  v80 = v78 + 56;
  v81 = -1;
  v82 = -1 << *(_BYTE *)(v78 + 32);
  if (-v82 < 64)
    v81 = ~(-1 << -(char)v82);
  v83 = v81 & *(_QWORD *)(v78 + 56);
  v84 = (unint64_t)(63 - v82) >> 6;
  while (1)
  {
    if (v83)
    {
      v83 &= v83 - 1;
      goto LABEL_68;
    }
    if (__OFADD__(v79++, 1))
    {
      __break(1u);
      goto LABEL_87;
    }
    if (v79 >= v84)
      goto LABEL_85;
    v88 = *(_QWORD *)(v80 + 8 * v79);
    if (!v88)
      break;
LABEL_80:
    v83 = (v88 - 1) & v88;
LABEL_68:
    v85 = *(void **)(v0 + 176);
    swift_bridgeObjectRetain();
    v86 = (void *)sub_1CF524E78();
    swift_bridgeObjectRelease();
    objc_msgSend(v85, sel_unregisterMessageForIdentifier_, v86);

  }
  v89 = v79 + 1;
  if (v79 + 1 >= v84)
    goto LABEL_85;
  v88 = *(_QWORD *)(v80 + 8 * v89);
  if (v88)
    goto LABEL_79;
  v89 = v79 + 2;
  if (v79 + 2 >= v84)
    goto LABEL_85;
  v88 = *(_QWORD *)(v80 + 8 * v89);
  if (v88)
    goto LABEL_79;
  v89 = v79 + 3;
  if (v79 + 3 >= v84)
  {
LABEL_85:
    v90 = *(void **)(v0 + 184);
    swift_release();

    swift_unknownObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    (*(void (**)(void))(v0 + 8))();
    return;
  }
  v88 = *(_QWORD *)(v80 + 8 * v89);
  if (v88)
  {
LABEL_79:
    v79 = v89;
    goto LABEL_80;
  }
  while (1)
  {
    v79 = v89 + 1;
    if (__OFADD__(v89, 1))
      break;
    if (v79 >= v84)
      goto LABEL_85;
    v88 = *(_QWORD *)(v80 + 8 * v79);
    ++v89;
    if (v88)
      goto LABEL_80;
  }
LABEL_87:
  __break(1u);
LABEL_88:
  __break(1u);
LABEL_89:
  __break(1u);
LABEL_90:
  __break(1u);
}

void sub_1CF511C88(uint64_t *a1@<X8>)
{
  void *v1;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t *v12;
  _QWORD *v13;
  id v14;
  _QWORD *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  id v23;
  id v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char isUniquelyReferenced_nonNull_native;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  _BOOL8 v32;
  uint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  id v40;
  uint64_t *v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;

  sub_1CF522DA8();
  v3 = (void *)sub_1CF522D90();
  v4 = sub_1CF525388();
  v5 = v1;
  if (v1)
  {

    if (qword_1ED8F43E0 != -1)
LABEL_38:
      swift_once();
    v6 = sub_1CF524C5C();
    __swift_project_value_buffer(v6, (uint64_t)qword_1ED8F43C0);
    v7 = v5;
    v8 = v5;
    v9 = sub_1CF524C44();
    v10 = sub_1CF525208();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = a1;
      v13 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v11 = 138412290;
      v14 = v5;
      v45 = _swift_stdlib_bridgeErrorToNSError();
      sub_1CF525418();
      *v13 = v45;

      _os_log_impl(&dword_1CF3C3000, v9, v10, "Error fetching messages: %@", v11, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFB94080);
      swift_arrayDestroy();
      v15 = v13;
      a1 = v12;
      MEMORY[0x1D17D1060](v15, -1, -1);
      MEMORY[0x1D17D1060](v11, -1, -1);
    }
    else
    {

    }
    v18 = sub_1CF4208F0(MEMORY[0x1E0DEE9D8]);

    goto LABEL_42;
  }
  v16 = v4;

  if (v16 >> 62)
  {
    swift_bridgeObjectRetain_n();
    v17 = sub_1CF5256F4();
    swift_bridgeObjectRelease();
    v41 = a1;
    if (v17)
      goto LABEL_7;
LABEL_40:
    v18 = MEMORY[0x1E0DEE9E0];
LABEL_41:
    swift_bridgeObjectRelease_n();
    a1 = v41;
LABEL_42:
    *a1 = v18;
    return;
  }
  v17 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v41 = a1;
  if (!v17)
    goto LABEL_40;
LABEL_7:
  v43 = v16 & 0xC000000000000001;
  v18 = MEMORY[0x1E0DEE9E0];
  v19 = 4;
  v42 = v16;
  while (1)
  {
    if (v43)
      v22 = (uint64_t *)MEMORY[0x1D17D05F8](v19 - 4, v16);
    else
      v22 = (uint64_t *)*(id *)(v16 + 8 * v19);
    a1 = v22;
    if (__OFADD__(v19 - 4, 1))
    {
      __break(1u);
LABEL_35:
      __break(1u);
LABEL_36:
      __break(1u);
LABEL_37:
      __break(1u);
      goto LABEL_38;
    }
    v23 = objc_msgSend(v22, sel_objectID);
    v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D66AF0]), sel_init);
    v25 = (unint64_t)objc_msgSend(a1, sel_priority);
    if ((v25 & 0x8000000000000000) != 0)
      break;
    objc_msgSend(v24, sel_setPriority_, v25);
    v44 = v19 - 3;
    if ((v18 & 0xC000000000000001) != 0)
    {
      if (v18 < 0)
        v26 = v18;
      else
        v26 = v18 & 0xFFFFFFFFFFFFFF8;
      v27 = sub_1CF5254F0();
      if (__OFADD__(v27, 1))
        goto LABEL_36;
      v18 = sub_1CF517F88(v26, v27 + 1);
    }
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v30 = sub_1CF448744((uint64_t)v23);
    v31 = *(_QWORD *)(v18 + 16);
    v32 = (v29 & 1) == 0;
    v33 = v31 + v32;
    if (__OFADD__(v31, v32))
      goto LABEL_35;
    v5 = v29;
    if (*(_QWORD *)(v18 + 24) >= v33)
    {
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
      {
        if ((v29 & 1) != 0)
          goto LABEL_8;
      }
      else
      {
        sub_1CF450730();
        if ((v5 & 1) != 0)
          goto LABEL_8;
      }
    }
    else
    {
      sub_1CF44C410(v33, isUniquelyReferenced_nonNull_native);
      v34 = sub_1CF448744((uint64_t)v23);
      if ((v5 & 1) != (v35 & 1))
        goto LABEL_44;
      v30 = v34;
      if ((v5 & 1) != 0)
      {
LABEL_8:
        v20 = *(_QWORD *)(v18 + 56);
        v21 = 8 * v30;

        *(_QWORD *)(v20 + v21) = v24;
        goto LABEL_9;
      }
    }
    *(_QWORD *)(v18 + 8 * (v30 >> 6) + 64) |= 1 << v30;
    v36 = 8 * v30;
    *(_QWORD *)(*(_QWORD *)(v18 + 48) + v36) = v23;
    *(_QWORD *)(*(_QWORD *)(v18 + 56) + v36) = v24;
    v37 = *(_QWORD *)(v18 + 16);
    v38 = __OFADD__(v37, 1);
    v39 = v37 + 1;
    if (v38)
      goto LABEL_37;
    *(_QWORD *)(v18 + 16) = v39;
    v40 = v23;
LABEL_9:

    swift_bridgeObjectRelease();
    ++v19;
    v16 = v42;
    if (v44 == v17)
      goto LABEL_41;
  }
  sub_1CF5256DC();
  __break(1u);
LABEL_44:
  sub_1CF3D3DF4(0, &qword_1EFB94CC0);
  sub_1CF525844();
  __break(1u);
}

uint64_t sub_1CF512294(const void *a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v4;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_1CF5122F4;
  return WalletMessagingProvider.processMessages()();
}

uint64_t sub_1CF5122F4()
{
  uint64_t *v0;
  void (**v1)(_QWORD);
  void *v2;
  uint64_t v4;

  v1 = *(void (***)(_QWORD))(*v0 + 24);
  v2 = *(void **)(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

id WalletMessagingProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void WalletMessagingProvider.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id WalletMessagingProvider.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void WalletMessagingProvider.connect(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v1 + OBJC_IVAR____TtC13FinanceDaemon23WalletMessagingProvider_messageSink) = a1;
  swift_unknownObjectRelease();
  v2 = OBJC_IVAR____TtC13FinanceDaemon23WalletMessagingProvider_coreDataStore;
  if (*(_QWORD *)(v1 + OBJC_IVAR____TtC13FinanceDaemon23WalletMessagingProvider_coreDataStore))
  {
    swift_unknownObjectRetain();
LABEL_3:
    swift_retain();
    v3 = (void *)sub_1CF52210C();
    v4 = swift_release();
    MEMORY[0x1E0C80A78](v4);
    sub_1CF525364();

    return;
  }
  sub_1CF5224CC();
  swift_unknownObjectRetain();
  sub_1CF5224B4();
  v5 = sub_1CF5224C0();
  swift_release();
  *(_QWORD *)(v1 + v2) = v5;
  swift_release();
  if (*(_QWORD *)(v1 + v2))
  {
    swift_retain();
    goto LABEL_3;
  }
  __break(1u);
}

uint64_t WalletMessagingProvider.applicationMessageSink(_:createContentForMessageWith:)()
{
  return sub_1CF519DDC();
}

void sub_1CF512774(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t *a4@<X8>)
{
  id v8;
  unsigned int v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15[2];

  v15[1] = *(id *)MEMORY[0x1E0C80C00];
  v8 = objc_msgSend((id)objc_opt_self(), sel_currentQueryGenerationToken);
  v15[0] = 0;
  v9 = objc_msgSend(a1, sel_setQueryGenerationFromToken_error_, v8, v15);

  if (v9)
  {
    v10 = v15[0];
    v11 = sub_1CF51A0A4(a3, a1);
    if (v11)
    {
      v12 = (void *)v11;
      v13 = sub_1CF5128A4((void *)(a2 + OBJC_IVAR____TtC13FinanceDaemon23WalletMessagingProvider_imageProcessingService));

      *a4 = v13;
    }
    else
    {
      *a4 = 0;
    }
  }
  else
  {
    v14 = v15[0];
    sub_1CF5248C0();

    swift_willThrow();
  }
}

uint64_t sub_1CF5128A4(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  int v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  void *v21;
  void *v22;
  uint64_t result;
  uint64_t v24;

  v2 = sub_1CF523C54();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1CF522D78();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (uint64_t *)((char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_1CF522D84();
  v10 = (*(uint64_t (**)(uint64_t *, uint64_t))(v7 + 88))(v9, v6);
  if (v10 == *MEMORY[0x1E0CAC258])
  {
    (*(void (**)(uint64_t *, uint64_t))(v7 + 96))(v9, v6);
    v11 = v9[3];
    v12 = sub_1CF51A630();
    v13 = (void *)sub_1CF524E78();
    swift_bridgeObjectRelease();
    if (v11)
    {
      v14 = (void *)sub_1CF524E78();
      swift_bridgeObjectRelease();
    }
    else
    {
      v14 = 0;
    }
    v15 = objc_msgSend((id)objc_opt_self(), sel_createWithGroup_action_icon_title_body_, v12, 0, 0, v13, v14);

    return (uint64_t)v15;
  }
  if (v10 == *MEMORY[0x1E0CAC250])
  {
    (*(void (**)(uint64_t *, uint64_t))(v7 + 96))(v9, v6);
    v15 = (id)sub_1CF5131AC(*v9, v9[1]);
    swift_bridgeObjectRelease();
    return (uint64_t)v15;
  }
  if (v10 == *MEMORY[0x1E0CAC248])
  {
    (*(void (**)(uint64_t *, uint64_t))(v7 + 96))(v9, v6);
    v16 = (uint64_t *)((char *)v9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94E58) + 48));
    v17 = *v16;
    v18 = v16[1];
    (*(void (**)(char *, uint64_t *, uint64_t))(v3 + 32))(v5, v9, v2);
    v19 = sub_1CF5137C0((uint64_t)v5, v17, v18, a1);
LABEL_12:
    v15 = (id)v19;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (uint64_t)v15;
  }
  if (v10 == *MEMORY[0x1E0CAC240])
  {
    (*(void (**)(uint64_t *, uint64_t))(v7 + 96))(v9, v6);
    v20 = (char *)v9 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94E50) + 48);
    v21 = *(void **)v20;
    v22 = (void *)*((_QWORD *)v20 + 1);
    (*(void (**)(char *, uint64_t *, uint64_t))(v3 + 32))(v5, v9, v2);
    v19 = sub_1CF514074((uint64_t)v5, v21, v22, a1);
    goto LABEL_12;
  }
  result = sub_1CF5256E8();
  __break(1u);
  return result;
}

void WalletMessagingProvider.applicationMessageSink(_:removedMessageWith:)()
{
  sub_1CF51AE14();
}

void sub_1CF512C00(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  id v9;
  os_log_type_t v10;
  uint8_t *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  void *v17;
  id v18[2];

  v18[1] = *(id *)MEMORY[0x1E0C80C00];
  v5 = sub_1CF51A0A4(a2, a3);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(a3, sel_deleteObject_, v5);
    v18[0] = 0;
    if ((objc_msgSend(a3, sel_save_, v18) & 1) != 0)
    {
      v7 = v18[0];
    }
    else
    {
      v16 = v18[0];
      sub_1CF5248C0();

      swift_willThrow();
    }
    goto LABEL_9;
  }
  if (qword_1ED8F43E0 != -1)
    swift_once();
  v8 = sub_1CF524C5C();
  __swift_project_value_buffer(v8, (uint64_t)qword_1ED8F43C0);
  v9 = a2;
  v6 = sub_1CF524C44();
  v10 = sub_1CF525208();
  if (os_log_type_enabled(v6, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v17 = (void *)swift_slowAlloc();
    v18[0] = v17;
    *(_DWORD *)v11 = 136315138;
    v12 = objc_msgSend(v9, sel_debugDescription);
    v13 = sub_1CF524E9C();
    v15 = v14;

    sub_1CF3F9B9C(v13, v15, (uint64_t *)v18);
    sub_1CF525418();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1CF3C3000, v6, v10, "Could not find message to remove: %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D17D1060](v17, -1, -1);
    MEMORY[0x1D17D1060](v11, -1, -1);
LABEL_9:

    return;
  }

}

void WalletMessagingProvider.applicationMessageSink(_:tappedMessageWith:)(void *a1, void *a2)
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;

  if (qword_1ED8F43E0 != -1)
    swift_once();
  v4 = sub_1CF524C5C();
  __swift_project_value_buffer(v4, (uint64_t)qword_1ED8F43C0);
  v5 = a2;
  v6 = sub_1CF524C44();
  v7 = sub_1CF5251F0();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v17 = a1;
    v9 = swift_slowAlloc();
    v18 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = objc_msgSend(v5, sel_debugDescription);
    v11 = sub_1CF524E9C();
    v13 = v12;

    sub_1CF3F9B9C(v11, v13, &v18);
    sub_1CF525418();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1CF3C3000, v6, v7, "Tapped message: %s", v8, 0xCu);
    swift_arrayDestroy();
    v14 = v9;
    a1 = v17;
    MEMORY[0x1D17D1060](v14, -1, -1);
    MEMORY[0x1D17D1060](v8, -1, -1);

  }
  else
  {

  }
  v15 = objc_msgSend(v5, sel_key);
  v16 = objc_msgSend(v15, sel_identifier);

  if (!v16)
  {
    sub_1CF524E9C();
    v16 = (id)sub_1CF524E78();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(a1, sel_unregisterMessageForIdentifier_, v16);

  sub_1CF51AE14();
}

uint64_t sub_1CF5131AC(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  id v18;
  void *v19;
  id v20;
  char *v21;
  void *v22;
  id v23;
  char *v24;
  char *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t result;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  id v46;

  v4 = sub_1CF524980();
  v44 = *(_QWORD *)(v4 - 8);
  v45 = v4;
  MEMORY[0x1E0C80A78](v4);
  v43 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1CF524A70();
  v36 = *(_QWORD *)(v6 - 8);
  v37 = v6;
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1CF5245F0();
  v41 = *(_QWORD *)(v9 - 8);
  v42 = v9;
  MEMORY[0x1E0C80A78](v9);
  v40 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1CF524B60();
  MEMORY[0x1E0C80A78](v11);
  v12 = sub_1CF524B48();
  MEMORY[0x1E0C80A78](v12);
  v13 = sub_1CF524B00();
  MEMORY[0x1E0C80A78](v13);
  v14 = sub_1CF523114();
  MEMORY[0x1E0C80A78](v14);
  v15 = sub_1CF524608();
  v38 = *(_QWORD *)(v15 - 8);
  v39 = v15;
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = objc_msgSend(v2, sel_managedObjectContext);
  if (v18)
  {
    v19 = v18;
    sub_1CF5242F0();
    v46 = v19;
    v20 = (id)sub_1CF5242E4();
    v35 = a2;
    if (v20)
    {
      sub_1CF524AD0();
      sub_1CF524B24();
      sub_1CF524B54();
      sub_1CF523108();
      v21 = v17;
      sub_1CF5245CC();
      v22 = v20;
      v23 = objc_msgSend(v20, sel_inEffectOn, v35);
      sub_1CF524A40();

      v24 = v40;
      sub_1CF5245FC();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v8, v37);
      v25 = v43;
      sub_1CF521D28();
      v26 = (void *)objc_opt_self();
      v27 = (void *)sub_1CF5248FC();
      v28 = objc_msgSend(v26, sel_createWithURL_, v27);

      v29 = (void *)objc_opt_self();
      v30 = sub_1CF51A7D0();
      v31 = v28;
      sub_1CF5245E4();
      v32 = (void *)sub_1CF524E78();
      swift_bridgeObjectRelease();
      sub_1CF5245D8();
      v33 = (void *)sub_1CF524E78();
      swift_bridgeObjectRelease();
      v20 = objc_msgSend(v29, sel_createWithGroup_action_icon_title_body_, v30, v31, 0, v32, v33);

      (*(void (**)(char *, uint64_t))(v44 + 8))(v25, v45);
      (*(void (**)(char *, uint64_t))(v41 + 8))(v24, v42);
      (*(void (**)(char *, uint64_t))(v38 + 8))(v21, v39);
    }
    else
    {

    }
    return (uint64_t)v20;
  }
  else
  {
    result = sub_1CF5256E8();
    __break(1u);
  }
  return result;
}

uint64_t sub_1CF5137C0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t result;
  char *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  char *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;

  v67 = a4;
  v78 = a2;
  v79 = a3;
  v6 = sub_1CF524980();
  v63 = *(_QWORD *)(v6 - 8);
  v64 = v6;
  MEMORY[0x1E0C80A78](v6);
  v65 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1CF523B4C();
  v68 = *(_QWORD *)(v8 - 8);
  v69 = v8;
  MEMORY[0x1E0C80A78](v8);
  v66 = (char *)&v58 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1CF524674();
  v75 = *(_QWORD *)(v10 - 8);
  v76 = v10;
  MEMORY[0x1E0C80A78](v10);
  v70 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1CF524B60();
  MEMORY[0x1E0C80A78](v12);
  v74 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1CF524B48();
  MEMORY[0x1E0C80A78](v14);
  v72 = (char *)&v58 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1CF524B00();
  MEMORY[0x1E0C80A78](v16);
  v17 = sub_1CF523114();
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_1CF524680();
  v71 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  v22 = (char *)&v58 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_1CF524650();
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x1E0C80A78](v23);
  v26 = (char *)&v58 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94E60);
  v28 = MEMORY[0x1E0C80A78](v27);
  v73 = (uint64_t)&v58 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v28);
  v77 = (uint64_t)&v58 - v30;
  v31 = objc_msgSend(v4, sel_managedObjectContext);
  if (v31)
  {
    v32 = v31;
    sub_1CF5220DC();
    v80 = v32;
    v33 = (void *)sub_1CF522088();
    v34 = a1;
    v35 = v33;
    v62 = v34;
    if (v33)
    {
      v36 = objc_msgSend(v33, sel_ecommerceOrderContent);
      if (!v36)
      {

        return (uint64_t)v36;
      }
      v61 = sub_1CF523B28();
      if ((~v61 & 0xF000000000000007) != 0)
      {
        v60 = v35;
        v37 = v36;
        sub_1CF51B374(v61);
        v59 = v37;
        sub_1CF524638();
        sub_1CF524AD0();
        sub_1CF524B24();
        sub_1CF524B54();
        sub_1CF523108();
        MEMORY[0x1D17CF668](v19);
        sub_1CF3C6DA0(&qword_1EFB94E68, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADB88], MEMORY[0x1E0CADB40]);
        v38 = v77;
        sub_1CF524644();
        (*(void (**)(char *, uint64_t))(v71 + 8))(v22, v20);
        (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
        v39 = v73;
        sub_1CF51B38C(v38, v73);
        v41 = v75;
        v40 = v76;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v75 + 48))(v39, 1, v76) != 1)
        {
          v43 = v70;
          (*(void (**)(char *, uint64_t, uint64_t))(v41 + 32))(v70, v39, v40);
          v44 = v61;
          v45 = (id)(v61 & 0x7FFFFFFFFFFFFFFFLL);
          v46 = (uint64_t)v66;
          v47 = (uint64_t)v59;
          sub_1CF523B58();
          sub_1CF51B3D4(v44);
          v48 = sub_1CF51AAF8(v47, v46, v67);
          (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v46, v69);
          sub_1CF521D10();
          v49 = (void *)objc_opt_self();
          v50 = (void *)sub_1CF5248FC();
          v51 = objc_msgSend(v49, sel_createWithURL_, v50);

          v52 = (void *)objc_opt_self();
          v53 = sub_1CF51A630();
          v54 = v51;
          sub_1CF52465C();
          v55 = v43;
          v56 = (void *)sub_1CF524E78();
          swift_bridgeObjectRelease();
          sub_1CF524668();
          v57 = (void *)sub_1CF524E78();
          swift_bridgeObjectRelease();
          v36 = objc_msgSend(v52, sel_createWithGroup_action_icon_title_body_, v53, v54, v48, v56, v57);

          sub_1CF51B3D4(v61);
          (*(void (**)(char *, uint64_t))(v63 + 8))(v65, v64);
          (*(void (**)(char *, uint64_t))(v41 + 8))(v55, v40);
          sub_1CF3CB808(v77, &qword_1EFB94E60);
          return (uint64_t)v36;
        }
        sub_1CF3CB808(v38, &qword_1EFB94E60);

        sub_1CF51B3D4(v61);
        sub_1CF3CB808(v39, &qword_1EFB94E60);
      }
      else
      {

      }
    }
    else
    {

    }
    return 0;
  }
  result = sub_1CF5256E8();
  __break(1u);
  return result;
}

uint64_t sub_1CF514074(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t result;
  id v46;
  uint64_t v47;
  id v48;
  char *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  id v78;
  id v79;

  v66 = a4;
  v77 = a2;
  v78 = a3;
  v6 = sub_1CF524980();
  v62 = *(_QWORD *)(v6 - 8);
  v63 = v6;
  MEMORY[0x1E0C80A78](v6);
  v64 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1CF523B4C();
  v67 = *(_QWORD *)(v8 - 8);
  v68 = v8;
  MEMORY[0x1E0C80A78](v8);
  v65 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1CF524674();
  v74 = *(_QWORD *)(v10 - 8);
  v75 = v10;
  MEMORY[0x1E0C80A78](v10);
  v69 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1CF524B60();
  MEMORY[0x1E0C80A78](v12);
  v73 = (char *)&v57 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1CF524B48();
  MEMORY[0x1E0C80A78](v14);
  v71 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1CF524B00();
  MEMORY[0x1E0C80A78](v16);
  v17 = sub_1CF523114();
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v57 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_1CF5246D4();
  v70 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  v22 = (char *)&v57 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_1CF5246C8();
  v24 = *(_QWORD *)(v23 - 8);
  MEMORY[0x1E0C80A78](v23);
  v26 = (char *)&v57 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94E60);
  v28 = MEMORY[0x1E0C80A78](v27);
  v72 = (uint64_t)&v57 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v28);
  v76 = (uint64_t)&v57 - v30;
  v31 = objc_msgSend(v4, sel_managedObjectContext);
  if (v31)
  {
    v32 = v31;
    sub_1CF5220DC();
    v79 = v32;
    v33 = (void *)sub_1CF522088();
    v34 = a1;
    v35 = v33;
    v61 = v34;
    if (v33)
    {
      v36 = objc_msgSend(v33, sel_ecommerceOrderContent);
      if (!v36)
      {

        return (uint64_t)v36;
      }
      v37 = (void *)sub_1CF523B34();
      if (v37)
      {
        v60 = v37;
        v38 = v35;
        v39 = v36;
        v40 = v60;
        v58 = v38;
        v59 = v39;
        v60 = v40;
        sub_1CF5246B0();
        sub_1CF524AD0();
        sub_1CF524B24();
        sub_1CF524B54();
        sub_1CF523108();
        MEMORY[0x1D17CF6E0](v19);
        sub_1CF3C6DA0((unint64_t *)&unk_1EFB94E70, (uint64_t (*)(uint64_t))MEMORY[0x1E0CADBE0], MEMORY[0x1E0CADBB8]);
        v41 = v76;
        sub_1CF524644();
        (*(void (**)(char *, uint64_t))(v70 + 8))(v22, v20);
        (*(void (**)(char *, uint64_t))(v24 + 8))(v26, v23);
        v42 = v72;
        sub_1CF51B38C(v41, v72);
        v44 = v74;
        v43 = v75;
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v74 + 48))(v42, 1, v75) != 1)
        {
          v46 = v58;
          (*(void (**)(char *, uint64_t, uint64_t))(v44 + 32))(v69, v42, v43);
          v47 = (uint64_t)v65;
          v48 = v59;
          sub_1CF523B64();
          v49 = sub_1CF51AAF8((uint64_t)v48, v47, v66);
          (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v47, v68);
          sub_1CF521D1C();
          v50 = (void *)objc_opt_self();
          v51 = (void *)sub_1CF5248FC();
          v52 = objc_msgSend(v50, sel_createWithURL_, v51);

          v78 = (id)objc_opt_self();
          v77 = sub_1CF51A630();
          v53 = v52;
          sub_1CF52465C();
          v54 = (void *)sub_1CF524E78();
          swift_bridgeObjectRelease();
          sub_1CF524668();
          v55 = (void *)sub_1CF524E78();
          swift_bridgeObjectRelease();
          v56 = v77;
          v36 = objc_msgSend(v78, sel_createWithGroup_action_icon_title_body_, v77, v53, v49, v54, v55);

          (*(void (**)(char *, uint64_t))(v62 + 8))(v64, v63);
          (*(void (**)(char *, uint64_t))(v44 + 8))(v69, v43);
          sub_1CF3CB808(v76, &qword_1EFB94E60);
          return (uint64_t)v36;
        }
        sub_1CF3CB808(v41, &qword_1EFB94E60);

        sub_1CF3CB808(v42, &qword_1EFB94E60);
      }
      else
      {

      }
    }
    else
    {

    }
    return 0;
  }
  result = sub_1CF5256E8();
  __break(1u);
  return result;
}

uint64_t sub_1CF5148F8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_1CF3D1338;
  return v6();
}

uint64_t sub_1CF51494C(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_1CF3D1338;
  return v7();
}

uint64_t sub_1CF5149A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1CF5250E8();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1CF5250DC();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1CF3CB808(a1, &qword_1ED8F29B0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1CF525088();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1CF514AEC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1CF514FD0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1CF514B08(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1CF515DA4(a1, a2, a3, (_QWORD *)*v3, &qword_1EFB90220, _s8MetadataV9CloudItemV6ObjectVMa_0);
  *v3 = result;
  return result;
}

uint64_t sub_1CF514B34(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1CF515DA4(a1, a2, a3, (_QWORD *)*v3, (uint64_t *)&unk_1EFB94D60, (uint64_t (*)(_QWORD))_s9OperationOMa);
  *v3 = result;
  return result;
}

uint64_t sub_1CF514B60(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1CF515DA4(a1, a2, a3, (_QWORD *)*v3, (uint64_t *)&unk_1EFB94D30, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAD380]);
  *v3 = result;
  return result;
}

uint64_t sub_1CF514B8C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1CF515DA4(a1, a2, a3, (_QWORD *)*v3, (uint64_t *)&unk_1EFB94D80, _s8MetadataV23IsMarkedAsCompleteEntryVMa);
  *v3 = result;
  return result;
}

uint64_t sub_1CF514BB8(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1CF515DA4(a1, a2, a3, (_QWORD *)*v3, &qword_1EFB90668, (uint64_t (*)(_QWORD))_s9OperationOMa_0);
  *v3 = result;
  return result;
}

uint64_t sub_1CF514BE4(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1CF515138(a1, a2, a3, *v3, (uint64_t *)&unk_1EFB94D70);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1CF514C10(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1CF515138(a1, a2, a3, *v3, &qword_1EFB94DB0);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1CF514C3C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1CF5152B4(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_1CF514C58(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1CF515DA4(a1, a2, a3, (_QWORD *)*v3, &qword_1EFB90248, _s8MetadataV9CloudItemV6ObjectVMa_1);
  *v3 = result;
  return result;
}

uint64_t sub_1CF514C84(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1CF515DA4(a1, a2, a3, (_QWORD *)*v3, &qword_1EFB90258, _s8MetadataV9CloudItemV6ObjectVMa);
  *v3 = result;
  return result;
}

uint64_t sub_1CF514CB0(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1CF515C00(a1, a2, a3, (_QWORD *)*v3, (uint64_t *)&unk_1EFB94D10, &qword_1EFB936B8);
  *v3 = result;
  return result;
}

uint64_t sub_1CF514CDC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1CF51549C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1CF514CF8(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1CF515DA4(a1, a2, a3, (_QWORD *)*v3, &qword_1EFB90738, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAB5F0]);
  *v3 = result;
  return result;
}

uint64_t sub_1CF514D24(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1CF515C00(a1, a2, a3, (_QWORD *)*v3, (uint64_t *)&unk_1EFB94D40, &qword_1ED8F35C8);
  *v3 = result;
  return result;
}

uint64_t sub_1CF514D50(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1CF51561C(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_1CF514D6C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1CF515DA4(a1, a2, a3, (_QWORD *)*v3, (uint64_t *)&unk_1EFB94D20, (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0870]);
  *v3 = result;
  return result;
}

uint64_t sub_1CF514D98(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1CF515DA4(a1, a2, a3, (_QWORD *)*v3, &qword_1EFB90660, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAB6E8]);
  *v3 = result;
  return result;
}

uint64_t sub_1CF514DC4(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1CF515DA4(a1, a2, a3, (_QWORD *)*v3, &qword_1EFB906B0, (uint64_t (*)(_QWORD))MEMORY[0x1E0CB0998]);
  *v3 = result;
  return result;
}

uint64_t sub_1CF514DF0(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1CF515DA4(a1, a2, a3, (_QWORD *)*v3, &qword_1EFB90728, (uint64_t (*)(_QWORD))MEMORY[0x1E0CADBE8]);
  *v3 = result;
  return result;
}

uint64_t sub_1CF514E1C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1CF515DA4(a1, a2, a3, (_QWORD *)*v3, (uint64_t *)&unk_1EFB94D90, _s8MetadataV9CloudItemV6ObjectVMa_2);
  *v3 = result;
  return result;
}

uint64_t sub_1CF514E48(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1CF515C00(a1, a2, a3, (_QWORD *)*v3, &qword_1EFB94E30, (uint64_t *)&unk_1EFB94E38);
  *v3 = result;
  return result;
}

uint64_t sub_1CF514E74(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1CF5157A4(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1CF514E90(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1CF515DA4(a1, a2, a3, (_QWORD *)*v3, (uint64_t *)&unk_1EFB94E10, (uint64_t (*)(_QWORD))MEMORY[0x1E0CACEB0]);
  *v3 = result;
  return result;
}

uint64_t sub_1CF514EBC(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1CF515910(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1CF514ED8(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1CF515A7C(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1CF514EF4(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1CF515C00(a1, a2, a3, (_QWORD *)*v3, (uint64_t *)&unk_1EFB94E20, &qword_1ED8F3940);
  *v3 = result;
  return result;
}

uint64_t sub_1CF514F20(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1CF515DA4(a1, a2, a3, (_QWORD *)*v3, &qword_1EFB94EE0, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAD9E8]);
  *v3 = result;
  return result;
}

uint64_t sub_1CF514F4C(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1CF515DA4(a1, a2, a3, (_QWORD *)*v3, (uint64_t *)&unk_1EFB94EB0, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAD9F8]);
  *v3 = result;
  return result;
}

uint64_t sub_1CF514F78(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1CF515DA4(a1, a2, a3, (_QWORD *)*v3, &qword_1EFB90748, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAFFF8]);
  *v3 = result;
  return result;
}

uint64_t sub_1CF514FA4(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_1CF515DA4(a1, a2, a3, (_QWORD *)*v3, (uint64_t *)&unk_1EFB94EC0, (uint64_t (*)(_QWORD))type metadata accessor for OfflineLabAccountInfo);
  *v3 = result;
  return result;
}

uint64_t sub_1CF514FD0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F44D8);
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
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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
  result = sub_1CF525730();
  __break(1u);
  return result;
}

uint64_t sub_1CF515138(char a1, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;
  size_t v15;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v7 = *((_QWORD *)a4 + 3);
    v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v8 = a2;
    }
  }
  else
  {
    v8 = a2;
  }
  v9 = *((_QWORD *)a4 + 2);
  if (v8 <= v9)
    v10 = *((_QWORD *)a4 + 2);
  else
    v10 = v8;
  if (v10)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v11 = (char *)swift_allocObject();
    v12 = _swift_stdlib_malloc_size(v11);
    *((_QWORD *)v11 + 2) = v9;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 24);
  }
  else
  {
    v11 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  v15 = 24 * v9;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v15])
      memmove(v13, v14, v15);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v11;
  }
LABEL_30:
  result = sub_1CF525730();
  __break(1u);
  return result;
}

uint64_t sub_1CF5152B4(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFB94DA0);
  v10 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFB93390) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v14 - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_34;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFB93390) - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
  if ((a1 & 1) != 0)
  {
    if (v13 < a4 || v18 >= &v19[*(_QWORD *)(v16 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v20 = *(_QWORD *)(v16 + 72) * v8;
  v21 = &v18[v20];
  v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  result = sub_1CF525730();
  __break(1u);
  return result;
}

uint64_t sub_1CF51549C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94D08);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[40 * v8])
      memmove(v12, v13, 40 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[40 * v8] || v12 >= &v13[40 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_1CF525730();
  __break(1u);
  return result;
}

uint64_t sub_1CF51561C(char a1, int64_t a2, char a3, _QWORD *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFB94D50);
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
    v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F3670);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1CF525730();
  __break(1u);
  return result;
}

uint64_t sub_1CF5157A4(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  int64_t v12;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94DF8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 31;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = v12 & 0xFFFFFFFFFFFFFFFELL;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[2 * v8])
      memmove(v13, v14, 2 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[2 * v8] || v13 >= &v14[2 * v8])
  {
    memcpy(v13, v14, 2 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1CF525730();
  __break(1u);
  return result;
}

uint64_t sub_1CF5158FC(char a1, int64_t a2, char a3, _QWORD *a4)
{
  return sub_1CF515DA4(a1, a2, a3, a4, &qword_1EFB90250, (uint64_t (*)(_QWORD))MEMORY[0x1E0CABDE8]);
}

uint64_t sub_1CF515910(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F29E0);
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
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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
  result = sub_1CF525730();
  __break(1u);
  return result;
}

uint64_t sub_1CF515A7C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(qword_1EFB94EE8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8])
      memmove(v12, v13, 24 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[24 * v8] || v12 >= &v13[24 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_1CF525730();
  __break(1u);
  return result;
}

uint64_t sub_1CF515C00(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t *a6)
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  size_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (v12)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v13 = (_QWORD *)swift_allocObject();
    v14 = _swift_stdlib_malloc_size(v13);
    v13[2] = v11;
    v13[3] = 2 * ((uint64_t)(v14 - 32) / 40);
  }
  else
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v15 = (unint64_t)(v13 + 4);
  v16 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v13 != a4 || v15 >= v16 + 40 * v11)
      memmove(v13 + 4, a4 + 4, 40 * v11);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v16 >= v15 + 40 * v11 || v15 >= v16 + 40 * v11)
  {
    __swift_instantiateConcreteTypeFromMangledName(a6);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_30:
  result = sub_1CF525730();
  __break(1u);
  return result;
}

uint64_t sub_1CF515DA4(char a1, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  uint64_t v19;
  unint64_t v20;
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_35:
        __break(1u);
        goto LABEL_36;
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
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v17 - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_34;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v16 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v16 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v11])
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v11;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v16;
  }
LABEL_36:
  result = sub_1CF525730();
  __break(1u);
  return result;
}

uint64_t sub_1CF515F84(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t isStackAllocationSafe;
  char v19;
  unint64_t v20;
  size_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v2 = a2;
  v28 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x1E0DEE9E8];
  }
  v26 = a1;
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = a2 + 56;
    v25[0] = a1 + 32;
    swift_bridgeObjectRetain();
    v5 = 0;
    while (1)
    {
      v6 = (uint64_t *)(v25[0] + 16 * v5);
      v8 = *v6;
      v7 = v6[1];
      ++v5;
      sub_1CF5258B0();
      swift_bridgeObjectRetain();
      sub_1CF524F08();
      v9 = sub_1CF5258F8();
      v10 = -1 << *(_BYTE *)(v2 + 32);
      v11 = v9 & ~v10;
      if (((*(_QWORD *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) != 0)
      {
        v12 = *(_QWORD *)(v2 + 48);
        v13 = (_QWORD *)(v12 + 16 * v11);
        v14 = *v13 == v8 && v13[1] == v7;
        if (v14 || (sub_1CF525814() & 1) != 0)
        {
          isStackAllocationSafe = swift_bridgeObjectRelease();
          v27 = v5;
LABEL_19:
          v19 = *(_BYTE *)(v2 + 32);
          v20 = (unint64_t)((1 << v19) + 63) >> 6;
          v21 = 8 * v20;
          if ((v19 & 0x3Fu) < 0xE
            || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (_DWORD)isStackAllocationSafe))
          {
            MEMORY[0x1E0C80A78](isStackAllocationSafe);
            memcpy((char *)v25 - ((v21 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v21);
            v22 = sub_1CF516CB4((uint64_t)v25 - ((v21 + 15) & 0x3FFFFFFFFFFFFFF0), v20, v2, v11, &v26);
            swift_release();
            swift_bridgeObjectRelease();
          }
          else
          {
            v23 = (void *)swift_slowAlloc();
            memcpy(v23, (const void *)(v2 + 56), v21);
            v22 = sub_1CF516CB4((uint64_t)v23, v20, v2, v11, &v26);
            swift_release();
            swift_bridgeObjectRelease();
            MEMORY[0x1D17D1060](v23, -1, -1);
          }
          return v22;
        }
        v15 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v15;
          if (((*(_QWORD *)(v4 + ((v11 >> 3) & 0xFFFFFFFFFFFFF8)) >> v11) & 1) == 0)
            break;
          v16 = (_QWORD *)(v12 + 16 * v11);
          v17 = *v16 == v8 && v16[1] == v7;
          if (v17 || (sub_1CF525814() & 1) != 0)
          {
            v27 = v5;
            isStackAllocationSafe = swift_bridgeObjectRelease();
            goto LABEL_19;
          }
        }
      }
      swift_bridgeObjectRelease();
      if (v5 == v3)
      {
        swift_bridgeObjectRelease();
        return v2;
      }
    }
  }
  return v2;
}

uint64_t sub_1CF516290(uint64_t a1, uint64_t a2)
{
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  uint64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, unint64_t, uint64_t);
  char v40;
  void (*v41)(char *, uint64_t);
  uint64_t isStackAllocationSafe;
  char v43;
  unint64_t v44;
  size_t v45;
  uint64_t v46;
  void *v48;
  uint64_t v49;
  char *v50;
  unint64_t v51;
  int64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  int64_t v59;
  unint64_t v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_1ED8F46B0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1CF524AB8();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v49 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v55 = (char *)&v49 - v12;
  if (!*(_QWORD *)(a2 + 16))
  {
    swift_release();
    return MEMORY[0x1E0DEE9E8];
  }
  v13 = -1 << *(_BYTE *)(a1 + 32);
  v14 = *(_QWORD *)(a1 + 56);
  v15 = ~v13;
  v16 = -v13;
  if (v16 < 64)
    v17 = ~(-1 << v16);
  else
    v17 = -1;
  v56 = a1;
  v57 = a1 + 56;
  v18 = a1;
  v19 = a1 + 56;
  v20 = v17 & v14;
  v21 = v15;
  v58 = v15;
  v59 = 0;
  v60 = v17 & v14;
  v54 = (char *)(a2 + 56);
  v22 = v18;
  swift_bridgeObjectRetain();
  v23 = 0;
  v50 = v6;
  v53 = a2;
  v51 = v20;
  v52 = 0;
  if (!v20)
    goto LABEL_8;
LABEL_6:
  v24 = (v20 - 1) & v20;
  v25 = __clz(__rbit64(v20)) | (v23 << 6);
  v26 = v23;
  v27 = v19;
LABEL_7:
  (*(void (**)(char *, unint64_t, uint64_t))(v8 + 16))(v6, *(_QWORD *)(v22 + 48) + *(_QWORD *)(v8 + 72) * v25, v7);
  v28 = 0;
  while (1)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, v28, 1, v7);
    v56 = v22;
    v57 = v27;
    v58 = v21;
    v59 = v26;
    v60 = v24;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    {
      sub_1CF3D1FAC();
      sub_1CF3CB808((uint64_t)v6, qword_1ED8F46B0);
      return v53;
    }
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v55, v6, v7);
    v32 = v53;
    sub_1CF3C6DA0(&qword_1EFB8F6D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
    v33 = sub_1CF524E30();
    v34 = -1 << *(_BYTE *)(v32 + 32);
    v35 = v33 & ~v34;
    if (((*(_QWORD *)&v54[(v35 >> 3) & 0xFFFFFFFFFFFFF8] >> v35) & 1) != 0)
      break;
    v41 = *(void (**)(char *, uint64_t))(v8 + 8);
LABEL_34:
    v41(v55, v7);
    v23 = v59;
    v20 = v60;
    v22 = v56;
    v19 = v57;
    v21 = v58;
    v6 = v50;
    v51 = v60;
    v52 = v59;
    if (v60)
      goto LABEL_6;
LABEL_8:
    v26 = v23 + 1;
    if (__OFADD__(v23, 1))
      __break(1u);
    v27 = v19;
    v29 = (unint64_t)(v21 + 64) >> 6;
    if (v26 >= v29)
      goto LABEL_26;
    v30 = *(_QWORD *)(v19 + 8 * v26);
    if (v30)
      goto LABEL_11;
    v23 += 2;
    if (v26 + 1 >= v29)
      goto LABEL_36;
    v30 = *(_QWORD *)(v19 + 8 * v23);
    if (v30)
      goto LABEL_14;
    if (v26 + 2 >= v29)
    {
LABEL_26:
      v24 = 0;
      v28 = 1;
      v26 = v23;
    }
    else
    {
      v30 = *(_QWORD *)(v19 + 8 * (v26 + 2));
      if (v30)
      {
        v26 += 2;
        goto LABEL_11;
      }
      v23 = v26 + 3;
      if (v26 + 3 >= v29)
      {
        v24 = 0;
        v28 = 1;
        v26 += 2;
      }
      else
      {
        v30 = *(_QWORD *)(v19 + 8 * v23);
        if (v30)
        {
LABEL_14:
          v26 = v23;
LABEL_11:
          v24 = (v30 - 1) & v30;
          v25 = __clz(__rbit64(v30)) + (v26 << 6);
          goto LABEL_7;
        }
        v26 += 4;
        if (v26 >= v29)
          goto LABEL_26;
        v30 = *(_QWORD *)(v19 + 8 * v26);
        if (v30)
          goto LABEL_11;
        v26 = v29 - 1;
        v31 = v52 + 6;
        while (v29 != v31)
        {
          v30 = *(_QWORD *)(v19 + 8 * v31++);
          if (v30)
          {
            v26 = v31 - 1;
            goto LABEL_11;
          }
        }
LABEL_36:
        v24 = 0;
        v28 = 1;
      }
    }
  }
  v36 = v32;
  v37 = ~v34;
  v38 = *(_QWORD *)(v8 + 72);
  v39 = *(void (**)(char *, unint64_t, uint64_t))(v8 + 16);
  while (1)
  {
    v39(v11, *(_QWORD *)(v36 + 48) + v38 * v35, v7);
    sub_1CF3C6DA0((unint64_t *)&unk_1EFB94E00, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09D0]);
    v40 = sub_1CF524E6C();
    v41 = *(void (**)(char *, uint64_t))(v8 + 8);
    v41(v11, v7);
    if ((v40 & 1) != 0)
      break;
    v35 = (v35 + 1) & v37;
    if (((*(_QWORD *)&v54[(v35 >> 3) & 0xFFFFFFFFFFFFF8] >> v35) & 1) == 0)
      goto LABEL_34;
  }
  isStackAllocationSafe = ((uint64_t (*)(char *, uint64_t))v41)(v55, v7);
  v43 = *(_BYTE *)(v36 + 32);
  v44 = (unint64_t)((1 << v43) + 63) >> 6;
  v45 = 8 * v44;
  if ((v43 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (_DWORD)isStackAllocationSafe))
  {
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    memcpy((char *)&v49 - ((v45 + 15) & 0x3FFFFFFFFFFFFFF0), v54, v45);
    v46 = sub_1CF516EDC((unint64_t *)((char *)&v49 - ((v45 + 15) & 0x3FFFFFFFFFFFFFF0)), v44, v36, v35, &v56);
    swift_release();
    sub_1CF3D1FAC();
  }
  else
  {
    v48 = (void *)swift_slowAlloc();
    memcpy(v48, v54, v45);
    v46 = sub_1CF516EDC((unint64_t *)v48, v44, v36, v35, &v56);
    swift_release();
    sub_1CF3D1FAC();
    MEMORY[0x1D17D1060](v48, -1, -1);
  }
  return v46;
}

uint64_t sub_1CF51684C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  BOOL v24;
  uint64_t v25;
  _QWORD *v26;
  BOOL v27;
  uint64_t isStackAllocationSafe;
  char v29;
  unint64_t v30;
  size_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v35;
  int64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;
  unint64_t v42;
  uint64_t v43;

  v2 = a2;
  v43 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a2 + 16))
  {
    v4 = *(_QWORD *)(a1 + 56);
    v37 = a1 + 56;
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v35 = ~v5;
    if (-v5 < 64)
      v6 = ~(-1 << -(char)v5);
    else
      v6 = -1;
    v7 = v6 & v4;
    v36 = (unint64_t)(63 - v5) >> 6;
    v8 = a2 + 56;
    swift_bridgeObjectRetain();
    v9 = 0;
    while (1)
    {
      if (v7)
      {
        v10 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v11 = v10 | (v9 << 6);
      }
      else
      {
        v12 = v9 + 1;
        if (__OFADD__(v9, 1))
        {
          __break(1u);
          goto LABEL_49;
        }
        if (v12 >= v36)
          goto LABEL_47;
        v13 = *(_QWORD *)(v37 + 8 * v12);
        v14 = v9 + 1;
        if (!v13)
        {
          v14 = v9 + 2;
          if (v9 + 2 >= v36)
            goto LABEL_47;
          v13 = *(_QWORD *)(v37 + 8 * v14);
          if (!v13)
          {
            v14 = v9 + 3;
            if (v9 + 3 >= v36)
              goto LABEL_47;
            v13 = *(_QWORD *)(v37 + 8 * v14);
            if (!v13)
            {
              v14 = v9 + 4;
              if (v9 + 4 >= v36)
                goto LABEL_47;
              v13 = *(_QWORD *)(v37 + 8 * v14);
              if (!v13)
              {
                v15 = v9 + 5;
                if (v9 + 5 >= v36)
                {
LABEL_47:
                  sub_1CF3D1FAC();
                  return v2;
                }
                v13 = *(_QWORD *)(v37 + 8 * v15);
                if (!v13)
                {
                  while (1)
                  {
                    v14 = v15 + 1;
                    if (__OFADD__(v15, 1))
                      break;
                    if (v14 >= v36)
                      goto LABEL_47;
                    v13 = *(_QWORD *)(v37 + 8 * v14);
                    ++v15;
                    if (v13)
                      goto LABEL_24;
                  }
LABEL_49:
                  __break(1u);
                }
                v14 = v9 + 5;
              }
            }
          }
        }
LABEL_24:
        v7 = (v13 - 1) & v13;
        v11 = __clz(__rbit64(v13)) + (v14 << 6);
        v9 = v14;
      }
      v16 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v11);
      v18 = *v16;
      v17 = v16[1];
      sub_1CF5258B0();
      swift_bridgeObjectRetain();
      sub_1CF524F08();
      v19 = sub_1CF5258F8();
      v20 = -1 << *(_BYTE *)(v2 + 32);
      v21 = v19 & ~v20;
      if (((*(_QWORD *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) != 0)
        break;
LABEL_6:
      swift_bridgeObjectRelease();
    }
    v22 = *(_QWORD *)(v2 + 48);
    v23 = (_QWORD *)(v22 + 16 * v21);
    v24 = *v23 == v18 && v23[1] == v17;
    if (v24 || (sub_1CF525814() & 1) != 0)
    {
      isStackAllocationSafe = swift_bridgeObjectRelease();
      v38 = a1;
      v39 = v37;
      v40 = v35;
      v41 = v9;
      v42 = v7;
    }
    else
    {
      v25 = ~v20;
      do
      {
        v21 = (v21 + 1) & v25;
        if (((*(_QWORD *)(v8 + ((v21 >> 3) & 0xFFFFFFFFFFFFF8)) >> v21) & 1) == 0)
          goto LABEL_6;
        v26 = (_QWORD *)(v22 + 16 * v21);
        v27 = *v26 == v18 && v26[1] == v17;
      }
      while (!v27 && (sub_1CF525814() & 1) == 0);
      v38 = a1;
      v39 = v37;
      v40 = v35;
      v41 = v9;
      v42 = v7;
      isStackAllocationSafe = swift_bridgeObjectRelease();
    }
    v29 = *(_BYTE *)(v2 + 32);
    v30 = (unint64_t)((1 << v29) + 63) >> 6;
    v31 = 8 * v30;
    if ((v29 & 0x3Fu) < 0xE
      || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (_DWORD)isStackAllocationSafe))
    {
      MEMORY[0x1E0C80A78](isStackAllocationSafe);
      memcpy((char *)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), (const void *)(v2 + 56), v31);
      v32 = sub_1CF517334((uint64_t)&v35 - ((v31 + 15) & 0x3FFFFFFFFFFFFFF0), v30, v2, v21, &v38);
      swift_release();
      sub_1CF3D1FAC();
    }
    else
    {
      v33 = (void *)swift_slowAlloc();
      memcpy(v33, (const void *)(v2 + 56), v31);
      v32 = sub_1CF517334((uint64_t)v33, v30, v2, v21, &v38);
      swift_release();
      sub_1CF3D1FAC();
      MEMORY[0x1D17D1060](v33, -1, -1);
    }
    return v32;
  }
  else
  {
    swift_release();
    return MEMORY[0x1E0DEE9E8];
  }
}

uint64_t sub_1CF516CB4(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  BOOL v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t i;
  unint64_t v26;
  _QWORD *v27;
  BOOL v28;
  unint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v6 = *(_QWORD *)(a3 + 16);
  *(_QWORD *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  v30 = (unint64_t *)result;
  v31 = v6 - 1;
  v8 = *a5;
  v7 = a5[1];
  v9 = *(_QWORD *)(*a5 + 16);
  if (v7 == v9)
  {
LABEL_2:
    swift_retain();
    return sub_1CF42BEF8(v30, a2, v31, a3);
  }
  v32 = a3 + 56;
  while ((v7 & 0x8000000000000000) == 0)
  {
    if (v7 >= v9)
      goto LABEL_29;
    v11 = v8 + 16 * v7;
    v13 = *(_QWORD *)(v11 + 32);
    v12 = *(_QWORD *)(v11 + 40);
    a5[1] = v7 + 1;
    sub_1CF5258B0();
    swift_bridgeObjectRetain();
    sub_1CF524F08();
    v14 = sub_1CF5258F8();
    v15 = -1 << *(_BYTE *)(a3 + 32);
    v16 = v14 & ~v15;
    v17 = v16 >> 6;
    v18 = 1 << v16;
    if (((1 << v16) & *(_QWORD *)(v32 + 8 * (v16 >> 6))) == 0)
      goto LABEL_4;
    v19 = *(_QWORD *)(a3 + 48);
    v20 = (_QWORD *)(v19 + 16 * v16);
    v21 = *v20 == v13 && v20[1] == v12;
    if (!v21 && (sub_1CF525814() & 1) == 0)
    {
      v24 = ~v15;
      for (i = v16 + 1; ; i = v26 + 1)
      {
        v26 = i & v24;
        if (((*(_QWORD *)(v32 + (((i & v24) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v24)) & 1) == 0)
          break;
        v27 = (_QWORD *)(v19 + 16 * v26);
        v28 = *v27 == v13 && v27[1] == v12;
        if (v28 || (sub_1CF525814() & 1) != 0)
        {
          result = swift_bridgeObjectRelease();
          v17 = v26 >> 6;
          v18 = 1 << v26;
          goto LABEL_15;
        }
      }
LABEL_4:
      result = swift_bridgeObjectRelease();
      goto LABEL_5;
    }
    result = swift_bridgeObjectRelease();
LABEL_15:
    v22 = v30[v17];
    v30[v17] = v22 & ~v18;
    if ((v18 & v22) != 0)
    {
      v23 = v31 - 1;
      if (__OFSUB__(v31, 1))
        goto LABEL_30;
      --v31;
      if (!v23)
        return MEMORY[0x1E0DEE9E8];
    }
LABEL_5:
    v8 = *a5;
    v7 = a5[1];
    v9 = *(_QWORD *)(*a5 + 16);
    if (v7 == v9)
      goto LABEL_2;
  }
  __break(1u);
LABEL_29:
  __break(1u);
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1CF516EDC(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, unint64_t, uint64_t);
  char v39;
  int64_t v40;
  int64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int64_t v45;
  int64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t *v51;
  char *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;

  v49 = a2;
  v9 = __swift_instantiateConcreteTypeFromMangledName(qword_1ED8F46B0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1CF524AB8();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v48 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x1E0C80A78](v14);
  v57 = (char *)&v48 - v18;
  v19 = *(_QWORD *)(a3 + 16);
  v20 = (a4 >> 3) & 0x1FFFFFFFFFFFFFF8;
  v21 = *(unint64_t *)((char *)a1 + v20) & ((-1 << a4) - 1);
  v51 = a1;
  v52 = v11;
  *(unint64_t *)((char *)a1 + v20) = v21;
  v22 = v19 - 1;
  v55 = a3 + 56;
  v56 = a3;
  v53 = a5;
  while (2)
  {
    v50 = v22;
    do
    {
      while (1)
      {
        v24 = *a5;
        v25 = a5[1];
        v27 = a5[2];
        v26 = a5[3];
        v28 = a5[4];
        v54 = v27;
        if (v28)
        {
          v29 = (v28 - 1) & v28;
          v30 = __clz(__rbit64(v28)) | (v26 << 6);
LABEL_7:
          (*(void (**)(char *, unint64_t, uint64_t))(v13 + 16))(v11, *(_QWORD *)(v24 + 48) + *(_QWORD *)(v13 + 72) * v30, v12);
          v31 = 0;
          goto LABEL_8;
        }
        v40 = v26 + 1;
        if (__OFADD__(v26, 1))
        {
          __break(1u);
          goto LABEL_44;
        }
        v41 = (unint64_t)(v27 + 64) >> 6;
        if (v40 >= v41)
        {
          v29 = 0;
          v31 = 1;
          goto LABEL_8;
        }
        v42 = *(_QWORD *)(v25 + 8 * v40);
        if (v42)
          goto LABEL_17;
        v45 = v26 + 2;
        if (v26 + 2 >= v41)
          goto LABEL_35;
        v42 = *(_QWORD *)(v25 + 8 * v45);
        if (v42)
          goto LABEL_23;
        if (v26 + 3 >= v41)
          goto LABEL_36;
        v42 = *(_QWORD *)(v25 + 8 * (v26 + 3));
        if (v42)
        {
          v40 = v26 + 3;
          goto LABEL_17;
        }
        v45 = v26 + 4;
        if (v26 + 4 < v41)
        {
          v42 = *(_QWORD *)(v25 + 8 * v45);
          if (v42)
          {
LABEL_23:
            v40 = v45;
LABEL_17:
            v29 = (v42 - 1) & v42;
            v30 = __clz(__rbit64(v42)) + (v40 << 6);
            v26 = v40;
            goto LABEL_7;
          }
          v40 = v26 + 5;
          if (v26 + 5 < v41)
          {
            v42 = *(_QWORD *)(v25 + 8 * v40);
            if (v42)
              goto LABEL_17;
            v40 = v41 - 1;
            v46 = v26 + 6;
            while (v41 != v46)
            {
              v42 = *(_QWORD *)(v25 + 8 * v46++);
              if (v42)
              {
                v40 = v46 - 1;
                goto LABEL_17;
              }
            }
LABEL_35:
            v29 = 0;
            v31 = 1;
            v26 = v40;
            goto LABEL_8;
          }
LABEL_36:
          v29 = 0;
          v31 = 1;
          v26 = v45;
          goto LABEL_8;
        }
        v29 = 0;
        v31 = 1;
        v26 += 3;
LABEL_8:
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, v31, 1, v12);
        *a5 = v24;
        a5[1] = v25;
        a5[2] = v54;
        a5[3] = v26;
        a5[4] = v29;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
        {
          sub_1CF3CB808((uint64_t)v11, qword_1ED8F46B0);
          v47 = v56;
          swift_retain();
          return sub_1CF42C18C(v51, v49, v50, v47);
        }
        (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v57, v11, v12);
        v32 = v56;
        sub_1CF3C6DA0(&qword_1EFB8F6D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
        v33 = sub_1CF524E30();
        v34 = -1 << *(_BYTE *)(v32 + 32);
        v35 = v33 & ~v34;
        if (((*(_QWORD *)(v55 + ((v35 >> 3) & 0xFFFFFFFFFFFFF8)) >> v35) & 1) != 0)
          break;
        v23 = *(uint64_t (**)(char *, uint64_t))(v13 + 8);
LABEL_4:
        result = v23(v57, v12);
        v11 = v52;
        a5 = v53;
      }
      v36 = ~v34;
      v37 = *(_QWORD *)(v13 + 72);
      v38 = *(void (**)(char *, unint64_t, uint64_t))(v13 + 16);
      while (1)
      {
        v38(v16, *(_QWORD *)(v56 + 48) + v37 * v35, v12);
        sub_1CF3C6DA0((unint64_t *)&unk_1EFB94E00, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09D0]);
        v39 = sub_1CF524E6C();
        v23 = *(uint64_t (**)(char *, uint64_t))(v13 + 8);
        v23(v16, v12);
        if ((v39 & 1) != 0)
          break;
        v35 = (v35 + 1) & v36;
        if (((*(_QWORD *)(v55 + ((v35 >> 3) & 0xFFFFFFFFFFFFF8)) >> v35) & 1) == 0)
          goto LABEL_4;
      }
      result = v23(v57, v12);
      v43 = (v35 >> 3) & 0x1FFFFFFFFFFFFFF8;
      v11 = v52;
      v44 = *(unint64_t *)((char *)v51 + v43);
      *(unint64_t *)((char *)v51 + v43) = v44 & ~(1 << v35);
      a5 = v53;
    }
    while ((v44 & (1 << v35)) == 0);
    v22 = v50 - 1;
    if (__OFSUB__(v50, 1))
    {
LABEL_44:
      __break(1u);
      return result;
    }
    if (v50 != 1)
      continue;
    return MEMORY[0x1E0DEE9E8];
  }
}

uint64_t sub_1CF517334(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  int64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  BOOL v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t i;
  unint64_t v33;
  _QWORD *v34;
  BOOL v35;
  uint64_t v37;
  unint64_t *v38;
  uint64_t v39;

  v7 = *(_QWORD *)(a3 + 16);
  v38 = (unint64_t *)result;
  *(_QWORD *)(result + ((a4 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a4) - 1;
  v8 = v7 - 1;
  v39 = a3 + 56;
  while (2)
  {
    v37 = v8;
    do
    {
      while (1)
      {
        v9 = a5[3];
        v10 = a5[4];
        if (v10)
        {
          v11 = (v10 - 1) & v10;
          v12 = __clz(__rbit64(v10)) | (v9 << 6);
        }
        else
        {
          v13 = v9 + 1;
          if (__OFADD__(v9, 1))
          {
            __break(1u);
            goto LABEL_45;
          }
          v14 = (unint64_t)(a5[2] + 64) >> 6;
          v15 = a5[3];
          if (v13 >= v14)
            goto LABEL_43;
          v16 = a5[1];
          v17 = *(_QWORD *)(v16 + 8 * v13);
          if (!v17)
          {
            v15 = v9 + 1;
            if (v9 + 2 >= v14)
              goto LABEL_43;
            v17 = *(_QWORD *)(v16 + 8 * (v9 + 2));
            if (v17)
            {
              v13 = v9 + 2;
            }
            else
            {
              v15 = v9 + 2;
              if (v9 + 3 >= v14)
                goto LABEL_43;
              v17 = *(_QWORD *)(v16 + 8 * (v9 + 3));
              if (v17)
              {
                v13 = v9 + 3;
              }
              else
              {
                v13 = v9 + 4;
                v15 = v9 + 3;
                if (v9 + 4 >= v14)
                  goto LABEL_43;
                v17 = *(_QWORD *)(v16 + 8 * v13);
                if (!v17)
                {
                  v15 = v14 - 1;
                  v18 = v9 + 5;
                  while (v14 != v18)
                  {
                    v17 = *(_QWORD *)(v16 + 8 * v18++);
                    if (v17)
                    {
                      v13 = v18 - 1;
                      goto LABEL_21;
                    }
                  }
LABEL_43:
                  a5[3] = v15;
                  a5[4] = 0;
                  swift_retain();
                  return sub_1CF42BEF8(v38, a2, v37, a3);
                }
              }
            }
          }
LABEL_21:
          v11 = (v17 - 1) & v17;
          v12 = __clz(__rbit64(v17)) + (v13 << 6);
          v9 = v13;
        }
        v19 = (uint64_t *)(*(_QWORD *)(*a5 + 48) + 16 * v12);
        v21 = *v19;
        v20 = v19[1];
        a5[3] = v9;
        a5[4] = v11;
        sub_1CF5258B0();
        swift_bridgeObjectRetain();
        sub_1CF524F08();
        v22 = sub_1CF5258F8();
        v23 = -1 << *(_BYTE *)(a3 + 32);
        v24 = v22 & ~v23;
        v25 = v24 >> 6;
        v26 = 1 << v24;
        if (((1 << v24) & *(_QWORD *)(v39 + 8 * (v24 >> 6))) != 0)
          break;
LABEL_3:
        result = swift_bridgeObjectRelease();
      }
      v27 = *(_QWORD *)(a3 + 48);
      v28 = (_QWORD *)(v27 + 16 * v24);
      v29 = *v28 == v21 && v28[1] == v20;
      if (!v29 && (sub_1CF525814() & 1) == 0)
      {
        v31 = ~v23;
        for (i = v24 + 1; ; i = v33 + 1)
        {
          v33 = i & v31;
          if (((*(_QWORD *)(v39 + (((i & v31) >> 3) & 0xFFFFFFFFFFFFF8)) >> (i & v31)) & 1) == 0)
            break;
          v34 = (_QWORD *)(v27 + 16 * v33);
          v35 = *v34 == v21 && v34[1] == v20;
          if (v35 || (sub_1CF525814() & 1) != 0)
          {
            result = swift_bridgeObjectRelease();
            v25 = v33 >> 6;
            v26 = 1 << v33;
            goto LABEL_29;
          }
        }
        goto LABEL_3;
      }
      result = swift_bridgeObjectRelease();
LABEL_29:
      v30 = v38[v25];
      v38[v25] = v30 & ~v26;
    }
    while ((v26 & v30) == 0);
    v8 = v37 - 1;
    if (__OFSUB__(v37, 1))
    {
LABEL_45:
      __break(1u);
      return result;
    }
    if (v37 != 1)
      continue;
    return MEMORY[0x1E0DEE9E8];
  }
}

void *sub_1CF517610()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB90BE0);
  v2 = *v0;
  v3 = sub_1CF525568();
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

void *sub_1CF5177C0()
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
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  _OWORD v23[2];
  uint64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94D00);
  v2 = *v0;
  v3 = sub_1CF525568();
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
    v16 = 40 * v15;
    result = (void *)sub_1CF4502D8(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v23);
    v17 = *(_QWORD *)(v4 + 48) + v16;
    v18 = v23[0];
    v19 = v23[1];
    *(_QWORD *)(v17 + 32) = v24;
    *(_OWORD *)v17 = v18;
    *(_OWORD *)(v17 + 16) = v19;
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

void *sub_1CF51798C()
{
  return sub_1CF5179B4((uint64_t (*)(_QWORD))MEMORY[0x1E0CABF70], (uint64_t *)&unk_1EFB94ED0);
}

void *sub_1CF5179A0()
{
  return sub_1CF5179B4((uint64_t (*)(_QWORD))MEMORY[0x1E0CB0998], &qword_1EFB90BD8);
}

void *sub_1CF5179B4(uint64_t (*a1)(_QWORD), uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *result;
  uint64_t v13;
  unint64_t v14;
  int64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v4 = v2;
  v5 = a1(0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v27 - v7;
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v9 = *v2;
  v10 = sub_1CF525568();
  v11 = v10;
  if (!*(_QWORD *)(v9 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v4 = v11;
    return result;
  }
  v28 = v4;
  result = (void *)(v10 + 56);
  v13 = v9 + 56;
  v14 = (unint64_t)((1 << *(_BYTE *)(v11 + 32)) + 63) >> 6;
  if (v11 != v9 || (unint64_t)result >= v9 + 56 + 8 * v14)
    result = memmove(result, (const void *)(v9 + 56), 8 * v14);
  v16 = 0;
  *(_QWORD *)(v11 + 16) = *(_QWORD *)(v9 + 16);
  v17 = 1 << *(_BYTE *)(v9 + 32);
  v18 = -1;
  if (v17 < 64)
    v18 = ~(-1 << v17);
  v19 = v18 & *(_QWORD *)(v9 + 56);
  v20 = (unint64_t)(v17 + 63) >> 6;
  while (1)
  {
    if (v19)
    {
      v21 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      v22 = v21 | (v16 << 6);
      goto LABEL_12;
    }
    v24 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v24 >= v20)
      goto LABEL_28;
    v25 = *(_QWORD *)(v13 + 8 * v24);
    ++v16;
    if (!v25)
    {
      v16 = v24 + 1;
      if (v24 + 1 >= v20)
        goto LABEL_28;
      v25 = *(_QWORD *)(v13 + 8 * v16);
      if (!v25)
      {
        v16 = v24 + 2;
        if (v24 + 2 >= v20)
          goto LABEL_28;
        v25 = *(_QWORD *)(v13 + 8 * v16);
        if (!v25)
          break;
      }
    }
LABEL_27:
    v19 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v16 << 6);
LABEL_12:
    v23 = *(_QWORD *)(v6 + 72) * v22;
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v8, *(_QWORD *)(v9 + 48) + v23, v5);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v6 + 32))(*(_QWORD *)(v11 + 48) + v23, v8, v5);
  }
  v26 = v24 + 3;
  if (v26 >= v20)
  {
LABEL_28:
    result = (void *)swift_release();
    v4 = v28;
    goto LABEL_30;
  }
  v25 = *(_QWORD *)(v13 + 8 * v26);
  if (v25)
  {
    v16 = v26;
    goto LABEL_27;
  }
  while (1)
  {
    v16 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v16 >= v20)
      goto LABEL_28;
    v25 = *(_QWORD *)(v13 + 8 * v16);
    ++v26;
    if (v25)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

void *sub_1CF517BD8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;

  v1 = v0;
  v2 = type metadata accessor for AccountAndStartingDate();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFB94E90);
  v6 = *v0;
  v7 = sub_1CF525568();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v8;
    return result;
  }
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 56);
  v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v21 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v17)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v17)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_27:
    v16 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    sub_1CF497D84(*(_QWORD *)(v6 + 48) + v20, (uint64_t)v5);
    result = (void *)sub_1CF497DC8((uint64_t)v5, *(_QWORD *)(v8 + 48) + v20);
  }
  v23 = v21 + 3;
  if (v23 >= v17)
    goto LABEL_28;
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_1CF517DD0()
{
  return sub_1CF517DE8((uint64_t *)&unk_1EFB94EA0);
}

id sub_1CF517DDC()
{
  return sub_1CF517DE8(&qword_1EFB90BE8);
}

id sub_1CF517DE8(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id result;
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
  void *v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_1CF525568();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v2 = v5;
    return result;
  }
  result = (id)(v4 + 56);
  v7 = v3 + 56;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 56 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 56), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 56);
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
    v19 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v19 >= v14)
      goto LABEL_28;
    v20 = *(_QWORD *)(v7 + 8 * v19);
    ++v10;
    if (!v20)
    {
      v10 = v19 + 1;
      if (v19 + 1 >= v14)
        goto LABEL_28;
      v20 = *(_QWORD *)(v7 + 8 * v10);
      if (!v20)
      {
        v10 = v19 + 2;
        if (v19 + 2 >= v14)
          goto LABEL_28;
        v20 = *(_QWORD *)(v7 + 8 * v10);
        if (!v20)
          break;
      }
    }
LABEL_27:
    v13 = (v20 - 1) & v20;
    v16 = __clz(__rbit64(v20)) + (v10 << 6);
LABEL_12:
    v17 = 8 * v16;
    v18 = *(void **)(*(_QWORD *)(v3 + 48) + v17);
    *(_QWORD *)(*(_QWORD *)(v5 + 48) + v17) = v18;
    result = v18;
  }
  v21 = v19 + 3;
  if (v21 >= v14)
    goto LABEL_28;
  v20 = *(_QWORD *)(v7 + 8 * v21);
  if (v20)
  {
    v10 = v21;
    goto LABEL_27;
  }
  while (1)
  {
    v10 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v10 >= v14)
      goto LABEL_28;
    v20 = *(_QWORD *)(v7 + 8 * v10);
    ++v21;
    if (v20)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1CF517F88(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFB94E80);
    v2 = sub_1CF525718();
    v18 = v2;
    sub_1CF525664();
    v3 = sub_1CF5256C4();
    if (v3)
    {
      v4 = v3;
      sub_1CF3D3DF4(0, &qword_1EFB94CC0);
      do
      {
        swift_dynamicCast();
        sub_1CF3D3DF4(0, &qword_1EFB94CC8);
        swift_dynamicCast();
        v2 = v18;
        v12 = *(_QWORD *)(v18 + 16);
        if (*(_QWORD *)(v18 + 24) <= v12)
        {
          sub_1CF44C410(v12 + 1, 1);
          v2 = v18;
        }
        result = sub_1CF5253C4();
        v6 = v2 + 64;
        v7 = -1 << *(_BYTE *)(v2 + 32);
        v8 = result & ~v7;
        v9 = v8 >> 6;
        if (((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          v10 = __clz(__rbit64((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v13 = 0;
          v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v15 = v9 == v14;
            if (v9 == v14)
              v9 = 0;
            v13 |= v15;
            v16 = *(_QWORD *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(_QWORD *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        v11 = 8 * v10;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + v11) = v17;
        *(_QWORD *)(*(_QWORD *)(v2 + 56) + v11) = v4;
        ++*(_QWORD *)(v2 + 16);
        v4 = sub_1CF5256C4();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x1E0DEE9E0];
  }
  return v2;
}

uint64_t sub_1CF5181D8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t result;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  unint64_t i;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  int64_t v25;

  v3 = sub_1CF524AB8();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(qword_1ED8F46B0);
  v8 = MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x1E0C80A78](v8);
  v13 = (char *)&v24 - v12;
  if (!*(_QWORD *)(*(_QWORD *)v1 + 16))
    return result;
  v14 = a1 + 56;
  v15 = 1 << *(_BYTE *)(a1 + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & *(_QWORD *)(a1 + 56);
  v25 = (unint64_t)(v15 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v18 = 0;
  if (!v17)
    goto LABEL_6;
LABEL_5:
  v19 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  for (i = v19 | (v18 << 6); ; i = __clz(__rbit64(v22)) + (v18 << 6))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v4 + 16))(v13, *(_QWORD *)(a1 + 48) + *(_QWORD *)(v4 + 72) * i, v3);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v4 + 56))(v13, 0, 1, v3);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v13, 1, v3) == 1)
      return swift_release();
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v13, v3);
    sub_1CF5187C4((uint64_t)v6, (uint64_t)v10);
    sub_1CF3CB808((uint64_t)v10, qword_1ED8F46B0);
    result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    if (v17)
      goto LABEL_5;
LABEL_6:
    v21 = v18 + 1;
    if (__OFADD__(v18, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v21 >= v25)
      goto LABEL_25;
    v22 = *(_QWORD *)(v14 + 8 * v21);
    ++v18;
    if (!v22)
    {
      v18 = v21 + 1;
      if (v21 + 1 >= v25)
        goto LABEL_25;
      v22 = *(_QWORD *)(v14 + 8 * v18);
      if (!v22)
      {
        v18 = v21 + 2;
        if (v21 + 2 >= v25)
          goto LABEL_25;
        v22 = *(_QWORD *)(v14 + 8 * v18);
        if (!v22)
        {
          v18 = v21 + 3;
          if (v21 + 3 >= v25)
            goto LABEL_25;
          v22 = *(_QWORD *)(v14 + 8 * v18);
          if (!v22)
            break;
        }
      }
    }
LABEL_21:
    v17 = (v22 - 1) & v22;
  }
  v23 = v21 + 4;
  if (v23 >= v25)
  {
LABEL_25:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v13, 1, 1, v3);
    return swift_release();
  }
  v22 = *(_QWORD *)(v14 + 8 * v23);
  if (v22)
  {
    v18 = v23;
    goto LABEL_21;
  }
  while (1)
  {
    v18 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v18 >= v25)
      goto LABEL_25;
    v22 = *(_QWORD *)(v14 + 8 * v18);
    ++v23;
    if (v22)
      goto LABEL_21;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_1CF51848C(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  _BYTE v14[40];
  _OWORD v15[2];
  uint64_t v16;
  _OWORD v17[2];
  uint64_t v18;

  if (!*(_QWORD *)(*(_QWORD *)v1 + 16))
    return result;
  v2 = result;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    v11 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v11 >= v7)
      return swift_release();
    v12 = *(_QWORD *)(v3 + 8 * v11);
    ++v8;
    if (!v12)
    {
      v8 = v11 + 1;
      if (v11 + 1 >= v7)
        return swift_release();
      v12 = *(_QWORD *)(v3 + 8 * v8);
      if (!v12)
      {
        v8 = v11 + 2;
        if (v11 + 2 >= v7)
          return swift_release();
        v12 = *(_QWORD *)(v3 + 8 * v8);
        if (!v12)
        {
          v8 = v11 + 3;
          if (v11 + 3 >= v7)
            return swift_release();
          v12 = *(_QWORD *)(v3 + 8 * v8);
          if (!v12)
            break;
        }
      }
    }
LABEL_23:
    v6 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v8 << 6);
LABEL_6:
    sub_1CF4502D8(*(_QWORD *)(v2 + 48) + 40 * v10, (uint64_t)v17);
    v15[0] = v17[0];
    v15[1] = v17[1];
    v16 = v18;
    sub_1CF518A10((uint64_t)v15, (uint64_t)v14);
    sub_1CF3CB808((uint64_t)v14, &qword_1EFB94CF8);
    result = sub_1CF3D1EFC((uint64_t)v15);
  }
  v13 = v11 + 4;
  if (v13 >= v7)
    return swift_release();
  v12 = *(_QWORD *)(v3 + 8 * v13);
  if (v12)
  {
    v8 = v13;
    goto LABEL_23;
  }
  while (1)
  {
    v8 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v8 >= v7)
      return swift_release();
    v12 = *(_QWORD *)(v3 + 8 * v8);
    ++v13;
    if (v12)
      goto LABEL_23;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_1CF518630(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;

  if (!*(_QWORD *)(*(_QWORD *)v1 + 16))
    return result;
  v2 = result;
  v3 = result + 56;
  v4 = 1 << *(_BYTE *)(result + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(result + 56);
  v7 = (unint64_t)(v4 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v8 = 0;
  while (1)
  {
    if (v6)
    {
      v9 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v10 = v9 | (v8 << 6);
      goto LABEL_6;
    }
    v14 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v14 >= v7)
      return swift_release();
    v15 = *(_QWORD *)(v3 + 8 * v14);
    ++v8;
    if (!v15)
    {
      v8 = v14 + 1;
      if (v14 + 1 >= v7)
        return swift_release();
      v15 = *(_QWORD *)(v3 + 8 * v8);
      if (!v15)
      {
        v8 = v14 + 2;
        if (v14 + 2 >= v7)
          return swift_release();
        v15 = *(_QWORD *)(v3 + 8 * v8);
        if (!v15)
        {
          v8 = v14 + 3;
          if (v14 + 3 >= v7)
            return swift_release();
          v15 = *(_QWORD *)(v3 + 8 * v8);
          if (!v15)
            break;
        }
      }
    }
LABEL_23:
    v6 = (v15 - 1) & v15;
    v10 = __clz(__rbit64(v15)) + (v8 << 6);
LABEL_6:
    v11 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v10);
    v12 = *v11;
    v13 = v11[1];
    swift_bridgeObjectRetain();
    sub_1CF518D4C(v12, v13);
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v16 = v14 + 4;
  if (v16 >= v7)
    return swift_release();
  v15 = *(_QWORD *)(v3 + 8 * v16);
  if (v15)
  {
    v8 = v16;
    goto LABEL_23;
  }
  while (1)
  {
    v8 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v8 >= v7)
      return swift_release();
    v15 = *(_QWORD *)(v3 + 8 * v8);
    ++v16;
    if (v15)
      goto LABEL_23;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_1CF5187C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  unint64_t v24;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v3 = v2;
  v6 = sub_1CF524AB8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_1CF3C6DA0(&qword_1EFB8F6D8, v11, MEMORY[0x1E0CB09C8]);
  swift_bridgeObjectRetain();
  v29 = a1;
  v12 = sub_1CF524E30();
  v13 = -1 << *(_BYTE *)(v10 + 32);
  v14 = v12 & ~v13;
  if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v27 = v3;
    v28 = a2;
    v15 = ~v13;
    v16 = *(_QWORD *)(v7 + 72);
    v30 = v7;
    v17 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    while (1)
    {
      v18 = v16 * v14;
      v17(v9, *(_QWORD *)(v10 + 48) + v16 * v14, v6);
      sub_1CF3C6DA0((unint64_t *)&unk_1EFB94E00, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09D0]);
      v19 = sub_1CF524E6C();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v9, v6);
      if ((v19 & 1) != 0)
        break;
      v14 = (v14 + 1) & v15;
      if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v20 = 1;
        a2 = v28;
        v7 = v30;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a2, v20, 1, v6);
      }
    }
    swift_bridgeObjectRelease();
    v21 = v27;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v23 = *v21;
    v31 = *v21;
    *v21 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_1CF5179B4((uint64_t (*)(_QWORD))MEMORY[0x1E0CB0998], &qword_1EFB90BD8);
      v23 = v31;
    }
    v24 = *(_QWORD *)(v23 + 48) + v18;
    v7 = v30;
    a2 = v28;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v30 + 32))(v28, v24, v6);
    sub_1CF519070(v14);
    *v21 = v31;
    swift_bridgeObjectRelease();
    v20 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v20 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a2, v20, 1, v6);
}

uint64_t sub_1CF518A10@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  _QWORD v17[5];

  v3 = v2;
  v6 = *v3;
  swift_bridgeObjectRetain();
  v7 = sub_1CF525544();
  v8 = -1 << *(_BYTE *)(v6 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) != 0)
  {
    v10 = ~v8;
    while (1)
    {
      sub_1CF4502D8(*(_QWORD *)(v6 + 48) + 40 * v9, (uint64_t)v17);
      v11 = MEMORY[0x1D17D058C](v17, a1);
      sub_1CF3D1EFC((uint64_t)v17);
      if ((v11 & 1) != 0)
        break;
      v9 = (v9 + 1) & v10;
      if (((*(_QWORD *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
        goto LABEL_5;
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v14 = *v3;
    v17[0] = *v3;
    *v3 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_1CF5177C0();
      v14 = v17[0];
    }
    v15 = *(_QWORD *)(v14 + 48) + 40 * v9;
    v16 = *(_OWORD *)(v15 + 16);
    *(_OWORD *)a2 = *(_OWORD *)v15;
    *(_OWORD *)(a2 + 16) = v16;
    *(_QWORD *)(a2 + 32) = *(_QWORD *)(v15 + 32);
    sub_1CF5192EC(v9);
    *v3 = v17[0];
    return swift_bridgeObjectRelease();
  }
  else
  {
LABEL_5:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)(a2 + 32) = 0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

uint64_t sub_1CF518B70(void *a1)
{
  uint64_t *v1;
  uint64_t v3;
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  char v11;
  uint64_t v12;
  id v13;
  char v14;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v16;
  uint64_t v18;

  v3 = *v1;
  if ((*v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    v4 = a1;
    v5 = sub_1CF525520();

    if ((v5 & 1) != 0)
    {
      v6 = sub_1CF518ED8();
      swift_bridgeObjectRelease();
      return v6;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRetain();
  v7 = sub_1CF5253C4();
  v8 = -1 << *(_BYTE *)(v3 + 32);
  v9 = v7 & ~v8;
  if (((*(_QWORD *)(v3 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
    goto LABEL_12;
  sub_1CF3D3DF4(0, &qword_1EFB94CC0);
  v10 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v9);
  v11 = sub_1CF5253D0();

  if ((v11 & 1) == 0)
  {
    v12 = ~v8;
    do
    {
      v9 = (v9 + 1) & v12;
      if (((*(_QWORD *)(v3 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
        goto LABEL_12;
      v13 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v9);
      v14 = sub_1CF5253D0();

    }
    while ((v14 & 1) == 0);
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v16 = *v1;
  v18 = *v1;
  *v1 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1CF517DE8((uint64_t *)&unk_1EFB94EA0);
    v16 = v18;
  }
  v6 = *(_QWORD *)(*(_QWORD *)(v16 + 48) + 8 * v9);
  sub_1CF5194B4(v9);
  *v1 = v18;
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1CF518D4C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v19;

  v5 = *v2;
  sub_1CF5258B0();
  swift_bridgeObjectRetain();
  sub_1CF524F08();
  v6 = sub_1CF5258F8();
  v7 = -1 << *(_BYTE *)(v5 + 32);
  v8 = v6 & ~v7;
  if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    return 0;
  }
  v9 = *(_QWORD *)(v5 + 48);
  v10 = (_QWORD *)(v9 + 16 * v8);
  v11 = *v10 == a1 && v10[1] == a2;
  if (!v11 && (sub_1CF525814() & 1) == 0)
  {
    v15 = ~v7;
    do
    {
      v8 = (v8 + 1) & v15;
      if (((*(_QWORD *)(v5 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) == 0)
        goto LABEL_18;
      v16 = (_QWORD *)(v9 + 16 * v8);
      v17 = *v16 == a1 && v16[1] == a2;
    }
    while (!v17 && (sub_1CF525814() & 1) == 0);
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v13 = *v2;
  v19 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1CF517610();
    v13 = v19;
  }
  v14 = *(_QWORD *)(*(_QWORD *)(v13 + 48) + 16 * v8);
  sub_1CF519654(v8);
  *v2 = v19;
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_1CF518ED8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  char v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;

  v1 = v0;
  swift_bridgeObjectRelease();
  v2 = sub_1CF5254F0();
  v3 = swift_unknownObjectRetain();
  v4 = sub_1CF4EEBF8(v3, v2);
  v15 = v4;
  swift_retain();
  v5 = sub_1CF5253C4();
  v6 = -1 << *(_BYTE *)(v4 + 32);
  v7 = v5 & ~v6;
  if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0)
  {
    sub_1CF3D3DF4(0, &qword_1EFB94CC0);
    v8 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v7);
    v9 = sub_1CF5253D0();

    if ((v9 & 1) != 0)
    {
LABEL_6:
      swift_release();
      v13 = *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v7);
      sub_1CF5194B4(v7);
      if ((sub_1CF5253D0() & 1) != 0)
      {
        *v1 = v15;
        return v13;
      }
      __break(1u);
    }
    else
    {
      v10 = ~v6;
      while (1)
      {
        v7 = (v7 + 1) & v10;
        if (((*(_QWORD *)(v4 + 56 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) == 0)
          break;
        v11 = *(id *)(*(_QWORD *)(v4 + 48) + 8 * v7);
        v12 = sub_1CF5253D0();

        if ((v12 & 1) != 0)
          goto LABEL_6;
      }
    }
    swift_release();
    __break(1u);
  }
  result = swift_release();
  __break(1u);
  return result;
}

uint64_t sub_1CF519070(int64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  void (*v26)(char *, unint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;

  v3 = sub_1CF524AB8();
  v28 = *(_QWORD *)(v3 - 8);
  result = MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  v8 = *v1 + 56;
  v9 = -1 << *(_BYTE *)(*v1 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(v8 + 8 * (v10 >> 6))) != 0)
  {
    v25 = v1;
    v11 = ~v9;
    swift_retain();
    v12 = sub_1CF525490();
    v27 = v8;
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v13 = (v12 + 1) & v11;
      v14 = *(_QWORD *)(v28 + 72);
      v26 = *(void (**)(char *, unint64_t, uint64_t))(v28 + 16);
      do
      {
        v15 = v14 * v10;
        v26(v6, *(_QWORD *)(v7 + 48) + v14 * v10, v3);
        sub_1CF3C6DA0(&qword_1EFB8F6D8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09C8]);
        v16 = sub_1CF524E30();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v6, v3);
        v17 = v16 & v11;
        if (a1 >= (uint64_t)v13)
        {
          if (v17 < v13 || a1 < (uint64_t)v17)
            goto LABEL_6;
        }
        else if (v17 < v13 && a1 < (uint64_t)v17)
        {
          goto LABEL_6;
        }
        v20 = v14 * a1;
        if (v14 * a1 < v15 || *(_QWORD *)(v7 + 48) + v14 * a1 >= (unint64_t)(*(_QWORD *)(v7 + 48) + v15 + v14))
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          a1 = v10;
          if (v20 == v15)
            goto LABEL_6;
          swift_arrayInitWithTakeBackToFront();
        }
        a1 = v10;
LABEL_6:
        v10 = (v10 + 1) & v11;
      }
      while (((*(_QWORD *)(v27 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    *(_QWORD *)(v27 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    result = swift_release();
    v1 = v25;
  }
  else
  {
    *(_QWORD *)(v8 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  v21 = *v1;
  v22 = *(_QWORD *)(*v1 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v21 + 16) = v24;
    ++*(_DWORD *)(v21 + 36);
  }
  return result;
}

unint64_t sub_1CF5192EC(unint64_t result)
{
  uint64_t *v1;
  uint64_t *v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v17;
  unint64_t v18;
  __int128 *v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  _BYTE v24[40];

  v2 = v1;
  v3 = result;
  v4 = *v1;
  v5 = *v1 + 56;
  v6 = -1 << *(_BYTE *)(*v1 + 32);
  v7 = (result + 1) & ~v6;
  if (((1 << v7) & *(_QWORD *)(v5 + 8 * (v7 >> 6))) != 0)
  {
    v8 = ~v6;
    swift_retain();
    v9 = sub_1CF525490();
    if ((*(_QWORD *)(v5 + 8 * (v7 >> 6)) & (1 << v7)) != 0)
    {
      v10 = (v9 + 1) & v8;
      do
      {
        sub_1CF4502D8(*(_QWORD *)(v4 + 48) + 40 * v7, (uint64_t)v24);
        v13 = sub_1CF525544();
        sub_1CF3D1EFC((uint64_t)v24);
        v14 = v13 & v8;
        if (v3 >= (uint64_t)v10)
        {
          if (v14 >= v10 && v3 >= (uint64_t)v14)
          {
LABEL_16:
            v17 = *(_QWORD *)(v4 + 48);
            v18 = v17 + 40 * v3;
            v19 = (__int128 *)(v17 + 40 * v7);
            if (v3 != v7 || (v3 = v7, v18 >= (unint64_t)v19 + 40))
            {
              v11 = *v19;
              v12 = v19[1];
              *(_QWORD *)(v18 + 32) = *((_QWORD *)v19 + 4);
              *(_OWORD *)v18 = v11;
              *(_OWORD *)(v18 + 16) = v12;
              v3 = v7;
            }
          }
        }
        else if (v14 >= v10 || v3 >= (uint64_t)v14)
        {
          goto LABEL_16;
        }
        v7 = (v7 + 1) & v8;
      }
      while (((*(_QWORD *)(v5 + ((v7 >> 3) & 0xFFFFFFFFFFFFF8)) >> v7) & 1) != 0);
    }
    *(_QWORD *)(v5 + (((unint64_t)v3 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v3) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v20 = *v2;
  v21 = *(_QWORD *)(*v2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v20 + 16) = v23;
    ++*(_DWORD *)(v20 + 36);
  }
  return result;
}

unint64_t sub_1CF5194B4(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_1CF525490();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v6);
        v11 = sub_1CF5253C4();

        v12 = v11 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v2 >= (uint64_t)v12)
          {
LABEL_16:
            v15 = *(_QWORD *)(v3 + 48);
            v16 = (_QWORD *)(v15 + 8 * v2);
            v17 = (_QWORD *)(v15 + 8 * v6);
            if (v2 != v6 || (v2 = v6, v16 >= v17 + 1))
            {
              *v16 = *v17;
              v2 = v6;
            }
          }
        }
        else if (v12 >= v9 || v2 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v18 = *(_QWORD *)(v3 + 16);
  v19 = __OFSUB__(v18, 1);
  v20 = v18 - 1;
  if (v19)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v20;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

unint64_t sub_1CF519654(unint64_t result)
{
  uint64_t *v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v2 = result;
  v3 = *v1;
  v4 = *v1 + 56;
  v5 = -1 << *(_BYTE *)(*v1 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    swift_retain();
    v8 = sub_1CF525490();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        sub_1CF5258B0();
        swift_bridgeObjectRetain();
        sub_1CF524F08();
        v10 = sub_1CF5258F8();
        swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v11 < v9)
            goto LABEL_5;
        }
        else if (v11 >= v9)
        {
          goto LABEL_11;
        }
        if (v2 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(v3 + 48);
          v13 = (_OWORD *)(v12 + 16 * v2);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v2 != v6 || (v2 = v6, v13 >= v14 + 1))
          {
            *v13 = *v14;
            v2 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(_QWORD *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    result = swift_release();
  }
  else
  {
    *(_QWORD *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  v15 = *(_QWORD *)(v3 + 16);
  v16 = __OFSUB__(v15, 1);
  v17 = v15 - 1;
  if (v16)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v3 + 16) = v17;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

void sub_1CF519818(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  char v6;
  char v7;
  void *v8;

  if ((a3 & 1) == 0)
  {
    if (a1 < 0 || -(-1 << *(_BYTE *)(a4 + 32)) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + 64 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8)) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
      {
        sub_1CF52549C();
        return;
      }
      goto LABEL_12;
    }
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (sub_1CF525694() != *(_DWORD *)(a4 + 36))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  sub_1CF5256A0();
  sub_1CF51B3EC(a1, a2, 1);
  sub_1CF3D3DF4(0, &qword_1EFB94CC0);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
  sub_1CF448744((uint64_t)v8);
  v7 = v6;

  if ((v7 & 1) != 0)
  {
    sub_1CF52567C();
    sub_1CF5256B8();
    sub_1CF3EDC40(a1, a2, 1);
    swift_unknownObjectRelease();
    return;
  }
LABEL_14:
  __break(1u);
}

void sub_1CF5199B4(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v5;
  char v6;
  char v7;
  id v8;
  void *v9;

  v5 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if ((a3 & 1) != 0)
    {
      sub_1CF525670();
      sub_1CF3D3DF4(0, &qword_1EFB94CC0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_17;
  }
  if ((a3 & 1) != 0)
    goto LABEL_10;
  if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a1) & 1) == 0)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (*(_DWORD *)(a4 + 36) == a2)
  {
LABEL_12:
    v8 = *(id *)(*(_QWORD *)(a4 + 48) + 8 * v5);
    return;
  }
  __break(1u);
LABEL_10:
  if (sub_1CF525694() != *(_DWORD *)(a4 + 36))
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  sub_1CF5256A0();
  sub_1CF3D3DF4(0, &qword_1EFB94CC0);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
  v5 = sub_1CF448744((uint64_t)v9);
  v7 = v6;

  if ((v7 & 1) != 0)
    goto LABEL_12;
LABEL_16:
  __break(1u);
LABEL_17:
  __break(1u);
}

uint64_t sub_1CF519B70(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 80);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v1 = *(_QWORD *)(a1 + 88);
  if (v1)
  {
    v2 = 192;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 4)
    v7 = 4;
  v8 = v7 - 4;
  v9 = (unint64_t *)(a1 + 96);
  v2 = 192;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

id _s13FinanceDaemon23WalletMessagingProviderC04makeE0ACyFZ_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  objc_class *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t *v10;
  id v11;
  objc_super v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v0 = sub_1CF3D3DF4(0, (unint64_t *)&qword_1ED8F4B38);
  v1 = sub_1CF525238();
  v15[3] = v0;
  v15[4] = MEMORY[0x1E0CADC40];
  v15[0] = v1;
  v2 = sub_1CF521E78();
  v3 = sub_1CF523144();
  v4 = sub_1CF523138();
  v14[3] = v3;
  v14[4] = MEMORY[0x1E0CAC620];
  v14[0] = v4;
  v5 = (objc_class *)type metadata accessor for WalletMessagingProvider();
  v6 = (char *)objc_allocWithZone(v5);
  *(_QWORD *)&v6[OBJC_IVAR____TtC13FinanceDaemon23WalletMessagingProvider_messageSink] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC13FinanceDaemon23WalletMessagingProvider_coreDataStore] = 0;
  v7 = &v6[OBJC_IVAR____TtC13FinanceDaemon23WalletMessagingProvider_userDefaults];
  v8 = v6;
  sub_1CF3D3ECC((uint64_t)v15, (uint64_t)v7);
  v9 = MEMORY[0x1E0CAB298];
  v10 = (uint64_t *)&v8[OBJC_IVAR____TtC13FinanceDaemon23WalletMessagingProvider_deviceInfo];
  *v10 = v2;
  v10[1] = v9;
  sub_1CF3D3ECC((uint64_t)v14, (uint64_t)&v8[OBJC_IVAR____TtC13FinanceDaemon23WalletMessagingProvider_imageProcessingService]);

  v13.receiver = v8;
  v13.super_class = v5;
  v11 = objc_msgSendSuper2(&v13, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
  return v11;
}

uint64_t sub_1CF519D44()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1CF519D68(uint64_t *a1@<X8>)
{
  sub_1CF511C88(a1);
}

uint64_t sub_1CF519D80()
{
  sub_1CF522DA8();
  return sub_1CF522D6C();
}

uint64_t sub_1CF519DDC()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t result;
  void *v7;

  v1 = OBJC_IVAR____TtC13FinanceDaemon23WalletMessagingProvider_coreDataStore;
  if (!*(_QWORD *)(v0 + OBJC_IVAR____TtC13FinanceDaemon23WalletMessagingProvider_coreDataStore))
  {
    sub_1CF5224CC();
    sub_1CF5224B4();
    v5 = sub_1CF5224C0();
    swift_release();
    *(_QWORD *)(v0 + v1) = v5;
    result = swift_release();
    if (!*(_QWORD *)(v0 + v1))
    {
      __break(1u);
      return result;
    }
    swift_retain();
  }
  swift_retain();
  v2 = (void *)sub_1CF52210C();
  v3 = swift_release();
  MEMORY[0x1E0C80A78](v3);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94E48);
  sub_1CF525364();
  if (v7)
    v4 = v7;

  return (uint64_t)v7;
}

uint64_t sub_1CF51A0A4(void *a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  _QWORD v30[9];
  uint64_t v31;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F36A0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1CF524980();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend(a2, sel_persistentStoreCoordinator);
  if (v11)
  {
    v12 = v11;
    v13 = objc_msgSend(a1, sel_key);
    v14 = objc_msgSend(v13, sel_identifier);

    sub_1CF524E9C();
    sub_1CF524968();
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
    {

      sub_1CF3CB808((uint64_t)v6, &qword_1ED8F36A0);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v6, v7);
      v15 = (void *)sub_1CF5248FC();
      v16 = objc_msgSend(v12, sel_managedObjectIDForURIRepresentation_, v15);

      if (v16)
      {
        sub_1CF522DA8();
        v28 = sub_1CF522D9C();
        (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

        return v28;
      }
      (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

    }
  }
  if (qword_1ED8F43E0 != -1)
    swift_once();
  v17 = sub_1CF524C5C();
  __swift_project_value_buffer(v17, (uint64_t)qword_1ED8F43C0);
  v18 = a1;
  v19 = sub_1CF524C44();
  v20 = sub_1CF525208();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v22 = swift_slowAlloc();
    v31 = v22;
    *(_DWORD *)v21 = 136315138;
    v23 = objc_msgSend(v18, sel_key);
    v24 = objc_msgSend(v23, sel_identifier);

    v25 = sub_1CF524E9C();
    v27 = v26;

    v30[8] = sub_1CF3F9B9C(v25, v27, &v31);
    sub_1CF525418();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1CF3C3000, v19, v20, "Could not create ObjectID from %s", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D17D1060](v22, -1, -1);
    MEMORY[0x1D17D1060](v21, -1, -1);

  }
  else
  {

  }
  return 0;
}

id sub_1CF51A630()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t, uint64_t);
  void (*v8)(char *, uint64_t);
  void *v9;
  void *v10;
  id v11;
  uint64_t v13;

  v0 = sub_1CF522CB8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (void *)objc_opt_self();
  v5 = (void *)sub_1CF524E78();
  v6 = *MEMORY[0x1E0CAC180];
  v7 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v7(v3, v6, v0);
  sub_1CF5225BC();
  v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v3, v0);
  v9 = (void *)sub_1CF524E78();
  swift_bridgeObjectRelease();
  v7(v3, v6, v0);
  sub_1CF5225BC();
  v8(v3, v0);
  v10 = (void *)sub_1CF524E78();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v4, sel_createForIdentifier_withSingularSummary_pluralSummary_, v5, v9, v10);

  return v11;
}

id sub_1CF51A7D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void (*v7)(char *, uint64_t, uint64_t);
  void (*v8)(char *, uint64_t);
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[2];

  v0 = sub_1CF522CB8();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (void *)objc_opt_self();
  v13[0] = 0;
  v13[1] = 0xE000000000000000;
  sub_1CF525598();
  sub_1CF524F38();
  sub_1CF524F38();
  v5 = (void *)sub_1CF524E78();
  swift_bridgeObjectRelease();
  v6 = *MEMORY[0x1E0CAC180];
  v7 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 104);
  v7(v3, v6, v0);
  sub_1CF5225BC();
  v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v3, v0);
  v9 = (void *)sub_1CF524E78();
  swift_bridgeObjectRelease();
  v7(v3, v6, v0);
  sub_1CF5225BC();
  v8(v3, v0);
  v10 = (void *)sub_1CF524E78();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v4, sel_createForIdentifier_withSingularSummary_pluralSummary_, v5, v9, v10);

  return v11;
}

uint64_t sub_1CF51A9B4(uint64_t a1, id a2)
{
  uint64_t v2;
  uint64_t result;
  float v5;
  double v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;

  result = GSMainScreenScaleFactor();
  if ((~LODWORD(v5) & 0x7F800000) == 0)
  {
    __break(1u);
    goto LABEL_10;
  }
  if (v5 <= -9.2234e18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (v5 >= 9.2234e18)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  v6 = (double)(uint64_t)v5;
  v7 = sub_1CF523B40();
  if (!v2)
  {
    v9 = v8;
    if (v8 >> 60 == 15)
    {
      return 0;
    }
    else
    {
      v10 = v7;
      v11 = objc_allocWithZone(MEMORY[0x1E0D66DF8]);
      sub_1CF40D8E4(v10, v9);
      v12 = (void *)sub_1CF5249A4();
      sub_1CF46F050(v10, v9);
      a2 = objc_msgSend(v11, sel_initWithData_scale_, v12, v6);

      sub_1CF46F050(v10, v9);
    }
  }
  return (uint64_t)a2;
}

char *sub_1CF51AAF8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
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
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;

  v35 = a1;
  v36 = a3;
  v34 = a2;
  v3 = sub_1CF522568();
  MEMORY[0x1E0C80A78](v3);
  v33 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1CF52252C();
  MEMORY[0x1E0C80A78](v5);
  v30 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1CF522514();
  v28 = *(_QWORD *)(v7 - 8);
  v29 = v7;
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1CF522544();
  MEMORY[0x1E0C80A78](v10);
  v11 = sub_1CF522574();
  v31 = *(_QWORD *)(v11 - 8);
  v32 = v11;
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1CF524AE8();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v27 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1CF524B00();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  v21 = (char *)&v27 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF524AD0();
  sub_1CF524AF4();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v21, v18);
  sub_1CF524ADC();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  sub_1CF522538();
  (*(void (**)(char *, _QWORD, uint64_t))(v28 + 104))(v9, *MEMORY[0x1E0CAB950], v29);
  sub_1CF522520();
  sub_1CF52255C();
  sub_1CF522550();
  v22 = v37;
  v23 = sub_1CF51A9B4(v35, v36);
  if (v22)
  {
    (*(void (**)(char *, uint64_t))(v31 + 8))(v13, v32);
  }
  else
  {
    v24 = (void *)v23;
    (*(void (**)(char *, uint64_t))(v31 + 8))(v13, v32);
    if (v24)
    {
      v25 = objc_msgSend((id)objc_opt_self(), sel_createForImage_withTintColor_, v24, 0);
      v13 = (char *)objc_msgSend((id)objc_opt_self(), sel_createWithImage_style_, v25, 0);

    }
    else
    {
      return 0;
    }
  }
  return v13;
}

void sub_1CF51AE14()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = OBJC_IVAR____TtC13FinanceDaemon23WalletMessagingProvider_coreDataStore;
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC13FinanceDaemon23WalletMessagingProvider_coreDataStore))
    goto LABEL_2;
  sub_1CF5224CC();
  sub_1CF5224B4();
  v4 = sub_1CF5224C0();
  swift_release();
  *(_QWORD *)(v0 + v1) = v4;
  swift_release();
  if (*(_QWORD *)(v0 + v1))
  {
    swift_retain();
LABEL_2:
    swift_retain();
    v2 = (void *)sub_1CF52210C();
    v3 = swift_release();
    MEMORY[0x1E0C80A78](v3);
    sub_1CF525358();

    return;
  }
  __break(1u);
}

uint64_t type metadata accessor for WalletMessagingProvider()
{
  return objc_opt_self();
}

uint64_t method lookup function for WalletMessagingProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1CF51B0E8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_1CF51B114()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1CF3CE884;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_1EFB94DB8 + dword_1EFB94DB8))(v2, v3);
}

uint64_t sub_1CF51B17C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1CF3D1338;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1EFB94DC8 + dword_1EFB94DC8))(v2, v3, v4);
}

uint64_t objectdestroy_7Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CF51B224(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1CF3D1338;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EFB94DD8 + dword_1EFB94DD8))(a1, v4, v5, v6);
}

uint64_t sub_1CF51B2A8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CF51B2CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1CF3CE884;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EFB94DE8 + dword_1EFB94DE8))(a1, v4);
}

void sub_1CF51B33C()
{
  uint64_t v0;

  sub_1CF512C00(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(void **)(v0 + 32));
}

void sub_1CF51B358(uint64_t *a1@<X8>)
{
  uint64_t v1;

  sub_1CF512774(*(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(void **)(v1 + 32), a1);
}

unint64_t sub_1CF51B374(unint64_t result)
{
  if ((~result & 0xF000000000000007) != 0)
    return (unint64_t)(id)(result & 0x7FFFFFFFFFFFFFFFLL);
  return result;
}

uint64_t sub_1CF51B38C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94E60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_1CF51B3D4(uint64_t a1)
{
  if ((~a1 & 0xF000000000000007) != 0)

}

uint64_t sub_1CF51B3EC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t type metadata accessor for PrismWebServiceRegisterTransactionTask()
{
  uint64_t result;

  result = qword_1EFB95010;
  if (!qword_1EFB95010)
    return swift_getSingletonMetadata();
  return result;
}

unint64_t sub_1CF51B434()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  unint64_t v8;
  unint64_t v9;

  v1 = sub_1CF523BC4();
  v2 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD078];
  v3 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v0, v1);
  v8 = 0;
  v9 = 0xE000000000000000;
  sub_1CF525598();
  swift_bridgeObjectRelease();
  v8 = 0xD00000000000001ELL;
  v9 = 0x80000001CF532500;
  sub_1CF3C6DA0(&qword_1EFB933A8, v2, MEMORY[0x1E0CAD090]);
  sub_1CF5257F0();
  sub_1CF524F38();
  swift_bridgeObjectRelease();
  v6 = v8;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v1);
  return v6;
}

uint64_t sub_1CF51B548(void (*a1)(NSObject *, uint64_t))
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  uint8_t *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  id v39;
  uint64_t v40;
  char *v41;
  os_log_t v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t *v46;
  void *v47;
  os_log_t v48;
  char *v49;
  uint64_t v50;
  void (*v51)(NSObject *, char *, uint64_t);
  void (*v52)(NSObject *, uint64_t);
  uint64_t v53;
  uint64_t v54;

  v3 = v2;
  v52 = a1;
  v4 = sub_1CF523BC4();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = ((char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = MEMORY[0x1E0C80A78](v6);
  v11 = (char *)&v46 - v10;
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v46 - v12;
  v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v14((char *)&v46 - v12, v1, v4);
  if (qword_1ED8F4448 != -1)
    swift_once();
  v15 = sub_1CF524C5C();
  v16 = __swift_project_value_buffer(v15, (uint64_t)qword_1ED8F2970);
  v51 = (void (*)(NSObject *, char *, uint64_t))v14;
  v14(v11, (uint64_t)v13, v4);
  v50 = v16;
  v17 = sub_1CF524C44();
  v18 = sub_1CF525220();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = swift_slowAlloc();
    v47 = v2;
    v20 = (uint8_t *)v19;
    v21 = swift_slowAlloc();
    v49 = v13;
    v22 = v21;
    v54 = v21;
    v48 = v8;
    *(_DWORD *)v20 = 136315138;
    v46 = v20 + 4;
    sub_1CF3C6DA0(&qword_1EFB933A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD078], MEMORY[0x1E0CAD090]);
    v23 = sub_1CF5257F0();
    v53 = sub_1CF3F9B9C(v23, v24, &v54);
    v8 = v48;
    sub_1CF525418();
    swift_bridgeObjectRelease();
    v25 = *(void (**)(char *, uint64_t))(v5 + 8);
    v25(v11, v4);
    _os_log_impl(&dword_1CF3C3000, v17, v18, "Fetching pending registration for transaction %s", v20, 0xCu);
    swift_arrayDestroy();
    v26 = v22;
    v13 = v49;
    MEMORY[0x1D17D1060](v26, -1, -1);
    v27 = v20;
    v3 = v47;
    MEMORY[0x1D17D1060](v27, -1, -1);
  }
  else
  {
    v25 = *(void (**)(char *, uint64_t))(v5 + 8);
    v25(v11, v4);
  }

  sub_1CF524590();
  v28 = v3;
  v29 = sub_1CF524554();
  if (v3)
  {
    v51(v8, v13, v4);
    v30 = v3;
    v31 = v3;
    v32 = sub_1CF524C44();
    v33 = sub_1CF525208();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = swift_slowAlloc();
      v51 = (void (*)(NSObject *, char *, uint64_t))v29;
      v35 = v34;
      v49 = (char *)swift_slowAlloc();
      v50 = swift_slowAlloc();
      v54 = v50;
      *(_DWORD *)v35 = 136315394;
      v52 = (void (*)(NSObject *, uint64_t))v25;
      v36 = v4;
      sub_1CF3C6DA0(&qword_1EFB933A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD078], MEMORY[0x1E0CAD090]);
      v48 = v32;
      v37 = sub_1CF5257F0();
      v53 = sub_1CF3F9B9C(v37, v38, &v54);
      sub_1CF525418();
      swift_bridgeObjectRelease();
      v52(v8, v4);
      *(_WORD *)(v35 + 12) = 2112;
      v39 = v28;
      v40 = _swift_stdlib_bridgeErrorToNSError();
      v53 = v40;
      sub_1CF525418();
      v41 = v49;
      *(_QWORD *)v49 = v40;
      v4 = v36;
      v25 = (void (*)(char *, uint64_t))v52;

      v42 = v48;
      _os_log_impl(&dword_1CF3C3000, v48, v33, "Failed to fetch pending registration for transaction %s with error: %@", (uint8_t *)v35, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFB94080);
      swift_arrayDestroy();
      MEMORY[0x1D17D1060](v41, -1, -1);
      v43 = v50;
      swift_arrayDestroy();
      MEMORY[0x1D17D1060](v43, -1, -1);
      v44 = v35;
      v29 = (uint64_t)v51;
      MEMORY[0x1D17D1060](v44, -1, -1);

    }
    else
    {
      v25((char *)v8, v4);

    }
    swift_willThrow();
  }
  v25(v13, v4);
  return v29;
}

uint64_t sub_1CF51BA30@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  char *v26;
  void (*v27)(char *, uint64_t);
  char *v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  void (*v31)(char *, uint64_t);
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  _QWORD *v36;
  void (*v37)(char *, uint64_t);
  uint64_t v38;
  _QWORD *v39;
  char *v40;
  NSObject *v41;
  os_log_type_t v42;
  char *v43;
  uint64_t v44;
  uint8_t *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  unint64_t v49;
  void (*v50)(char *, uint64_t);
  char *v51;
  char *v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t);
  char *v56;
  uint64_t v57;
  uint8_t *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint8_t *v65;
  char *v66;
  uint64_t v67;
  void (*v68)(char *, uint64_t);
  char *v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;

  v67 = a1;
  v62 = a2;
  v64 = sub_1CF524AB8();
  v70 = *(_QWORD *)(v64 - 8);
  v2 = MEMORY[0x1E0C80A78](v64);
  v69 = (char *)&v58 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v58 - v4;
  v6 = sub_1CF524314();
  v60 = *(_QWORD *)(v6 - 8);
  v61 = v6;
  MEMORY[0x1E0C80A78](v6);
  v66 = (char *)&v58 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1CF524A70();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v58 - v13;
  sub_1CF524584();
  if (qword_1ED8F4448 != -1)
    swift_once();
  v15 = sub_1CF524C5C();
  v16 = __swift_project_value_buffer(v15, (uint64_t)qword_1ED8F2970);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
  v65 = (uint8_t *)v16;
  v17 = sub_1CF524C44();
  v18 = sub_1CF525220();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    v20 = swift_slowAlloc();
    v59 = v5;
    v21 = v20;
    v72 = (char *)v20;
    v63 = v14;
    *(_DWORD *)v19 = 136315138;
    v58 = v19 + 4;
    sub_1CF3C6DA0((unint64_t *)&qword_1EFB8FAC8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08F0]);
    v22 = sub_1CF5257F0();
    v71 = sub_1CF3F9B9C(v22, v23, (uint64_t *)&v72);
    v14 = v63;
    sub_1CF525418();
    swift_bridgeObjectRelease();
    v24 = *(void (**)(char *, uint64_t))(v9 + 8);
    v24(v12, v8);
    _os_log_impl(&dword_1CF3C3000, v17, v18, "Retrieving credential valid until %s", v19, 0xCu);
    swift_arrayDestroy();
    v25 = v21;
    v5 = v59;
    MEMORY[0x1D17D1060](v25, -1, -1);
    MEMORY[0x1D17D1060](v19, -1, -1);
  }
  else
  {
    v24 = *(void (**)(char *, uint64_t))(v9 + 8);
    v24(v12, v8);
  }

  v26 = v66;
  v27 = v68;
  sub_1CF5244B8();
  v28 = v69;
  v29 = v70;
  if (v27)
  {
    v30 = v27;
    v31 = v27;
    v32 = sub_1CF524C44();
    v33 = sub_1CF525208();
    if (os_log_type_enabled(v32, v33))
    {
      v63 = v14;
      v34 = (uint8_t *)swift_slowAlloc();
      v35 = swift_slowAlloc();
      v68 = v24;
      v36 = (_QWORD *)v35;
      *(_DWORD *)v34 = 138412290;
      v37 = v27;
      v38 = _swift_stdlib_bridgeErrorToNSError();
      v72 = (char *)v38;
      v14 = v63;
      sub_1CF525418();
      *v36 = v38;

      _os_log_impl(&dword_1CF3C3000, v32, v33, "Failed to retrieve credential with error: %@", v34, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFB94080);
      swift_arrayDestroy();
      v39 = v36;
      v24 = v68;
      MEMORY[0x1D17D1060](v39, -1, -1);
      MEMORY[0x1D17D1060](v34, -1, -1);
    }
    else
    {

    }
    swift_willThrow();
    v53 = v14;
    v54 = v8;
  }
  else
  {
    v67 = v8;
    (*(void (**)(uint64_t, char *, uint64_t))(v60 + 32))(v62, v26, v61);
    sub_1CF5242FC();
    (*(void (**)(char *, char *, uint64_t))(v29 + 16))(v28, v5, v64);
    v40 = v28;
    v41 = sub_1CF524C44();
    v42 = sub_1CF525220();
    v43 = v5;
    if (os_log_type_enabled(v41, v42))
    {
      v44 = swift_slowAlloc();
      v68 = v24;
      v45 = (uint8_t *)v44;
      v66 = (char *)swift_slowAlloc();
      v72 = v66;
      v46 = v64;
      v59 = v43;
      *(_DWORD *)v45 = 136315138;
      v65 = v45 + 4;
      sub_1CF3C6DA0(&qword_1EFB8F9B0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
      v47 = v40;
      v48 = sub_1CF5257F0();
      v71 = sub_1CF3F9B9C(v48, v49, (uint64_t *)&v72);
      sub_1CF525418();
      swift_bridgeObjectRelease();
      v50 = *(void (**)(char *, uint64_t))(v70 + 8);
      v50(v47, v46);
      _os_log_impl(&dword_1CF3C3000, v41, v42, "Got credential %s", v45, 0xCu);
      v51 = v66;
      swift_arrayDestroy();
      MEMORY[0x1D17D1060](v51, -1, -1);
      MEMORY[0x1D17D1060](v45, -1, -1);

      v50(v59, v46);
      return ((uint64_t (*)(char *, uint64_t))v68)(v14, v67);
    }

    v55 = *(void (**)(char *, uint64_t))(v29 + 8);
    v56 = v40;
    v57 = v64;
    v55(v56, v64);
    v55(v43, v57);
    v53 = v14;
    v54 = v67;
  }
  return ((uint64_t (*)(char *, uint64_t))v24)(v53, v54);
}

uint64_t sub_1CF51C068(void (*a1)(char *, uint64_t), void *a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  _BOOL4 v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  unint64_t v42;
  void (*v43)(char *, uint64_t);
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  char *v47;
  BOOL v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t);
  uint64_t v51;
  char *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  NSObject *v56;
  char *v57;
  os_log_type_t v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  void (*v63)(char *, uint64_t);
  uint64_t v64;
  unint64_t v65;
  void (*v66)(char *, uint64_t);
  os_log_type_t v67;
  void (*v68)(char *, uint64_t);
  char *v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  NSObject *v73;
  os_log_type_t v74;
  int v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  void *v83;
  uint64_t v84;
  void *v85;
  id v86;
  char *v87;
  unsigned int v88;
  unsigned int v89;
  id v90;
  char *v91;
  id v92;
  NSObject *v93;
  char *v94;
  os_log_type_t v95;
  uint8_t *v96;
  void *v97;
  void *v98;
  uint64_t v99;
  unint64_t v100;
  uint64_t (*v101)(char *, uint64_t);
  const char *v102;
  void (*v103)(char *, uint64_t);
  id v104;
  void *v105;
  char *v106;
  id v107;
  id v108;
  NSObject *v109;
  os_log_type_t v110;
  char *v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  unint64_t v115;
  id v116;
  uint64_t v117;
  _QWORD *v118;
  void *v119;
  const char *v120;
  id v121;
  void *v122;
  uint64_t v123;
  unint64_t v124;
  id v126;
  id v127;
  char *v128;
  void *v129;
  uint64_t v130;
  unint64_t v131;
  id v132;
  uint64_t v133;
  void *v134;
  void (*v135)(char *, char *, uint64_t);
  uint64_t v136;
  char *v137;
  char *v138;
  char *v139;
  char *v140;
  uint64_t v141;
  char *v142;
  char *v143;
  uint64_t v144;
  char *v145;
  char *v146;
  id v147;
  char *v148;
  uint64_t v149;
  void *v150;
  uint64_t v151;
  char *v152;
  void (*v153)(char *, uint64_t);
  _QWORD *v154;
  void (*v155)(char *, char *, uint64_t);
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  id v159[3];

  v147 = a3;
  v150 = a2;
  v153 = a1;
  v159[1] = *(id *)MEMORY[0x1E0C80C00];
  v157 = sub_1CF524A70();
  v151 = *(_QWORD *)(v157 - 8);
  v5 = MEMORY[0x1E0C80A78](v157);
  v146 = (char *)&v136 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x1E0C80A78](v5);
  v145 = (char *)&v136 - v8;
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v136 - v9;
  v11 = sub_1CF523BC4();
  v12 = MEMORY[0x1E0C80A78](v11);
  v139 = (char *)&v136 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x1E0C80A78](v12);
  v140 = (char *)&v136 - v15;
  v16 = MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v136 - v17;
  v19 = MEMORY[0x1E0C80A78](v16);
  v21 = (char *)&v136 - v20;
  v22 = MEMORY[0x1E0C80A78](v19);
  v142 = (char *)&v136 - v23;
  v24 = MEMORY[0x1E0C80A78](v22);
  v143 = (char *)&v136 - v25;
  v26 = MEMORY[0x1E0C80A78](v24);
  v28 = (char *)&v136 - v27;
  MEMORY[0x1E0C80A78](v26);
  v30 = (char *)&v136 - v29;
  v144 = v31;
  v32 = *(void (**)(char *, uint64_t, uint64_t))(v31 + 16);
  v32((char *)&v136 - v29, v3, v11);
  v33 = *(_QWORD *)(v3 + *(int *)(type metadata accessor for PrismWebServiceRegisterTransactionTask() + 20));
  v149 = v33 + 1;
  if (__OFADD__(v33, 1))
  {
    __break(1u);
  }
  else
  {
    v137 = v21;
    v138 = v18;
    if (qword_1ED8F4448 == -1)
      goto LABEL_3;
  }
  swift_once();
LABEL_3:
  v34 = sub_1CF524C5C();
  v35 = __swift_project_value_buffer(v34, (uint64_t)qword_1ED8F2970);
  v155 = (void (*)(char *, char *, uint64_t))v32;
  v32(v28, (uint64_t)v30, v11);
  v154 = (_QWORD *)v35;
  v36 = sub_1CF524C44();
  v37 = sub_1CF525220();
  v38 = os_log_type_enabled(v36, v37);
  v156 = v11;
  v148 = v10;
  v152 = v30;
  v141 = v4;
  if (v38)
  {
    v39 = swift_slowAlloc();
    v40 = (void *)swift_slowAlloc();
    v159[0] = v40;
    *(_DWORD *)v39 = 136315394;
    sub_1CF3C6DA0(&qword_1EFB933A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD078], MEMORY[0x1E0CAD090]);
    v41 = sub_1CF5257F0();
    v158 = sub_1CF3F9B9C(v41, v42, (uint64_t *)v159);
    sub_1CF525418();
    swift_bridgeObjectRelease();
    v43 = *(void (**)(char *, uint64_t))(v144 + 8);
    v43(v28, v11);
    *(_WORD *)(v39 + 12) = 2048;
    v10 = v148;
    v44 = v149;
    v158 = v149;
    sub_1CF525418();
    v45 = v43;
    _os_log_impl(&dword_1CF3C3000, v36, v37, "Registration for transaction %s failed %lld times", (uint8_t *)v39, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1D17D1060](v40, -1, -1);
    v46 = v39;
    v30 = v152;
    MEMORY[0x1D17D1060](v46, -1, -1);

    v47 = v145;
  }
  else
  {
    v45 = *(void (**)(char *, uint64_t))(v144 + 8);
    v45(v28, v11);

    v47 = v145;
    v44 = v149;
  }
  v49 = v44 - 1;
  v48 = v44 < 1;
  v50 = v153;
  v51 = v151;
  v52 = v146;
  if (!v48)
    exp2((double)v49);
  v53 = v156;
  sub_1CF524A04();
  if ((sub_1CF52456C() & 1) != 0)
  {
    v146 = (char *)v45;
    v54 = v143;
    v155(v143, v30, v53);
    v55 = v157;
    (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v47, v10, v157);
    v56 = sub_1CF524C44();
    v57 = v47;
    v58 = sub_1CF525220();
    if (os_log_type_enabled(v56, v58))
    {
      v59 = swift_slowAlloc();
      v145 = (char *)swift_slowAlloc();
      v159[0] = v145;
      *(_DWORD *)v59 = 136315394;
      sub_1CF3C6DA0(&qword_1EFB933A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD078], MEMORY[0x1E0CAD090]);
      v60 = sub_1CF5257F0();
      v158 = sub_1CF3F9B9C(v60, v61, (uint64_t *)v159);
      sub_1CF525418();
      swift_bridgeObjectRelease();
      v62 = v54;
      v63 = (void (*)(char *, uint64_t))v146;
      ((void (*)(char *, uint64_t))v146)(v62, v156);
      *(_WORD *)(v59 + 12) = 2080;
      sub_1CF3C6DA0((unint64_t *)&qword_1EFB8FAC8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08F0]);
      v64 = sub_1CF5257F0();
      v158 = sub_1CF3F9B9C(v64, v65, (uint64_t *)v159);
      sub_1CF525418();
      swift_bridgeObjectRelease();
      v66 = *(void (**)(char *, uint64_t))(v151 + 8);
      v66(v57, v55);
      v67 = v58;
      v68 = v63;
      _os_log_impl(&dword_1CF3C3000, v56, v67, "Updating pending registration for transaction %s eligible for earliest next attempt at %s", (uint8_t *)v59, 0x16u);
      v69 = v145;
      swift_arrayDestroy();
      v53 = v156;
      MEMORY[0x1D17D1060](v69, -1, -1);
      v70 = v59;
      v50 = v153;
      MEMORY[0x1D17D1060](v70, -1, -1);
    }
    else
    {
      v68 = (void (*)(char *, uint64_t))v146;
      ((void (*)(char *, uint64_t))v146)(v54, v53);
      v66 = *(void (**)(char *, uint64_t))(v51 + 8);
      v66(v57, v55);
    }

    objc_msgSend(v50, sel_setRegistrationAttemptCount_, v149);
    v85 = (void *)sub_1CF524A10();
    objc_msgSend(v50, sel_setLastRegistrationAttemptDate_, v85);

    v30 = v152;
    v86 = v147;
  }
  else
  {
    v71 = v142;
    v155(v142, v30, v53);
    (*(void (**)(char *, char *, uint64_t))(v51 + 16))(v52, v10, v157);
    v72 = v51;
    v73 = sub_1CF524C44();
    v74 = sub_1CF525220();
    v75 = v74;
    if (os_log_type_enabled(v73, v74))
    {
      v76 = swift_slowAlloc();
      v150 = (void *)swift_slowAlloc();
      v159[0] = v150;
      *(_DWORD *)v76 = 136315394;
      sub_1CF3C6DA0(&qword_1EFB933A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD078], MEMORY[0x1E0CAD090]);
      v77 = sub_1CF5257F0();
      v158 = sub_1CF3F9B9C(v77, v78, (uint64_t *)v159);
      LODWORD(v149) = v75;
      sub_1CF525418();
      swift_bridgeObjectRelease();
      v79 = v71;
      v68 = v45;
      v45(v79, v53);
      *(_WORD *)(v76 + 12) = 2080;
      sub_1CF3C6DA0((unint64_t *)&qword_1EFB8FAC8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08F0]);
      v80 = v157;
      v81 = sub_1CF5257F0();
      v158 = sub_1CF3F9B9C(v81, v82, (uint64_t *)v159);
      sub_1CF525418();
      swift_bridgeObjectRelease();
      v66 = *(void (**)(char *, uint64_t))(v151 + 8);
      v66(v52, v80);
      _os_log_impl(&dword_1CF3C3000, v73, (os_log_type_t)v149, "Deleting pending registration for transaction %s not eligible for earliest next attempt at %s", (uint8_t *)v76, 0x16u);
      v83 = v150;
      swift_arrayDestroy();
      MEMORY[0x1D17D1060](v83, -1, -1);
      v84 = v76;
      v30 = v152;
      MEMORY[0x1D17D1060](v84, -1, -1);
    }
    else
    {
      v87 = v71;
      v68 = v45;
      v45(v87, v53);
      v66 = *(void (**)(char *, uint64_t))(v72 + 8);
      v66(v52, v157);
    }

    v86 = v147;
    v50 = v153;
    objc_msgSend(v147, sel_deleteObject_, v153);
  }
  v88 = objc_msgSend(v50, sel_isDeleted);
  v159[0] = 0;
  v89 = objc_msgSend(v86, sel_save_, v159);
  v90 = v159[0];
  if (!v89)
  {
    v153 = v66;
    v103 = v68;
    v104 = v159[0];
    v105 = (void *)sub_1CF5248C0();

    swift_willThrow();
    if (v88)
    {
      v106 = v140;
      v155(v140, v30, v53);
      v107 = v105;
      v108 = v105;
      v109 = sub_1CF524C44();
      v110 = sub_1CF525208();
      if (os_log_type_enabled(v109, v110))
      {
        v111 = v106;
        v112 = swift_slowAlloc();
        v154 = (_QWORD *)swift_slowAlloc();
        v155 = (void (*)(char *, char *, uint64_t))swift_slowAlloc();
        v159[0] = v155;
        *(_DWORD *)v112 = 136315394;
        v113 = v105;
        sub_1CF3C6DA0(&qword_1EFB933A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD078], MEMORY[0x1E0CAD090]);
        v114 = sub_1CF5257F0();
        v158 = sub_1CF3F9B9C(v114, v115, (uint64_t *)v159);
        sub_1CF525418();
        swift_bridgeObjectRelease();
        v103(v111, v156);
        *(_WORD *)(v112 + 12) = 2112;
        v116 = v105;
        v117 = _swift_stdlib_bridgeErrorToNSError();
        v158 = v117;
        v30 = v152;
        sub_1CF525418();
        v118 = v154;
        *v154 = v117;
        v119 = v113;
        v53 = v156;

        v120 = "Failed to delete pending registration for transaction %s with error: %@";
LABEL_30:
        _os_log_impl(&dword_1CF3C3000, v109, v110, v120, (uint8_t *)v112, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFB94080);
        swift_arrayDestroy();
        MEMORY[0x1D17D1060](v118, -1, -1);
        v135 = v155;
        swift_arrayDestroy();
        MEMORY[0x1D17D1060](v135, -1, -1);
        MEMORY[0x1D17D1060](v112, -1, -1);
LABEL_32:

        swift_willThrow();
        v153(v148, v157);
        return ((uint64_t (*)(char *, uint64_t))v103)(v30, v53);
      }
    }
    else
    {
      v106 = v139;
      v155(v139, v30, v53);
      v126 = v105;
      v127 = v105;
      v109 = sub_1CF524C44();
      v110 = sub_1CF525208();
      if (os_log_type_enabled(v109, v110))
      {
        v128 = v106;
        v112 = swift_slowAlloc();
        v154 = (_QWORD *)swift_slowAlloc();
        v155 = (void (*)(char *, char *, uint64_t))swift_slowAlloc();
        v159[0] = v155;
        *(_DWORD *)v112 = 136315394;
        v129 = v105;
        sub_1CF3C6DA0(&qword_1EFB933A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD078], MEMORY[0x1E0CAD090]);
        v130 = sub_1CF5257F0();
        v158 = sub_1CF3F9B9C(v130, v131, (uint64_t *)v159);
        sub_1CF525418();
        swift_bridgeObjectRelease();
        v103(v128, v156);
        *(_WORD *)(v112 + 12) = 2112;
        v132 = v105;
        v133 = _swift_stdlib_bridgeErrorToNSError();
        v158 = v133;
        v30 = v152;
        sub_1CF525418();
        v118 = v154;
        *v154 = v133;
        v134 = v129;
        v53 = v156;

        v120 = "Failed to update pending registration for transaction %s with error: %@";
        goto LABEL_30;
      }
    }
    v103(v106, v53);

    goto LABEL_32;
  }
  if (v88)
  {
    v91 = v137;
    v155(v137, v30, v53);
    v92 = v90;
    v93 = sub_1CF524C44();
    v94 = v30;
    v95 = sub_1CF525220();
    if (os_log_type_enabled(v93, v95))
    {
      v96 = (uint8_t *)swift_slowAlloc();
      v97 = (void *)swift_slowAlloc();
      v146 = (char *)v68;
      v98 = v97;
      v159[0] = v97;
      v153 = v66;
      *(_DWORD *)v96 = 136315138;
      sub_1CF3C6DA0(&qword_1EFB933A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD078], MEMORY[0x1E0CAD090]);
      v99 = sub_1CF5257F0();
      v158 = sub_1CF3F9B9C(v99, v100, (uint64_t *)v159);
      sub_1CF525418();
      swift_bridgeObjectRelease();
      v101 = (uint64_t (*)(char *, uint64_t))v146;
      ((void (*)(char *, uint64_t))v146)(v91, v53);
      v102 = "Deleted pending registration for transaction %s";
LABEL_26:
      _os_log_impl(&dword_1CF3C3000, v93, v95, v102, v96, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17D1060](v98, -1, -1);
      MEMORY[0x1D17D1060](v96, -1, -1);

      v153(v148, v157);
      return v101(v152, v53);
    }
  }
  else
  {
    v91 = v138;
    v155(v138, v30, v53);
    v121 = v90;
    v93 = sub_1CF524C44();
    v94 = v30;
    v95 = sub_1CF525220();
    if (os_log_type_enabled(v93, v95))
    {
      v96 = (uint8_t *)swift_slowAlloc();
      v122 = (void *)swift_slowAlloc();
      v146 = (char *)v68;
      v98 = v122;
      v159[0] = v122;
      v153 = v66;
      *(_DWORD *)v96 = 136315138;
      sub_1CF3C6DA0(&qword_1EFB933A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD078], MEMORY[0x1E0CAD090]);
      v123 = sub_1CF5257F0();
      v158 = sub_1CF3F9B9C(v123, v124, (uint64_t *)v159);
      sub_1CF525418();
      swift_bridgeObjectRelease();
      v101 = (uint64_t (*)(char *, uint64_t))v146;
      ((void (*)(char *, uint64_t))v146)(v91, v53);
      v102 = "Updated pending registration for transaction %s";
      goto LABEL_26;
    }
  }

  v68(v91, v53);
  v66(v148, v157);
  return ((uint64_t (*)(char *, uint64_t))v68)(v94, v53);
}

uint64_t sub_1CF51D040(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  _BOOL4 v21;
  uint8_t *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  void *v28;
  uint8_t *v29;
  unsigned int v30;
  id v31;
  void (*v32)(char *, char *, uint64_t);
  char *v33;
  id v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t (*v42)(char *, uint64_t);
  id v44;
  void *v45;
  id v46;
  id v47;
  NSObject *v48;
  os_log_type_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t (*v53)(char *, uint64_t);
  id v54;
  uint64_t v55;
  void (*v56)(char *, char *, uint64_t);
  void *v57;
  uint64_t v58;
  uint64_t (*v59)(char *, uint64_t);
  void *v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(char *, char *, uint64_t);
  void (*v66)(char *, uint64_t);
  char *v67;
  void *v68;
  uint64_t v69;
  id v70[2];

  v64 = a1;
  v70[1] = *(id *)MEMORY[0x1E0C80C00];
  v4 = sub_1CF523BC4();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v6);
  v62 = (char *)&v60 - v10;
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v60 - v12;
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v60 - v14;
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v16((char *)&v60 - v14, v2, v4);
  if (qword_1ED8F4448 != -1)
    swift_once();
  v17 = sub_1CF524C5C();
  v18 = __swift_project_value_buffer(v17, (uint64_t)qword_1ED8F2970);
  v65 = (void (*)(char *, char *, uint64_t))v16;
  v16(v13, (uint64_t)v15, v4);
  v63 = v18;
  v19 = sub_1CF524C44();
  v20 = sub_1CF525220();
  v21 = os_log_type_enabled(v19, v20);
  v67 = v15;
  if (v21)
  {
    v22 = (uint8_t *)swift_slowAlloc();
    v23 = (void *)swift_slowAlloc();
    v61 = v8;
    v24 = v4;
    v25 = v23;
    v70[0] = v23;
    v60 = a2;
    *(_DWORD *)v22 = 136315138;
    v66 = (void (*)(char *, uint64_t))(v22 + 4);
    sub_1CF3C6DA0(&qword_1EFB933A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD078], MEMORY[0x1E0CAD090]);
    v26 = sub_1CF5257F0();
    v69 = sub_1CF3F9B9C(v26, v27, (uint64_t *)v70);
    a2 = v60;
    sub_1CF525418();
    swift_bridgeObjectRelease();
    v66 = *(void (**)(char *, uint64_t))(v5 + 8);
    v66(v13, v24);
    _os_log_impl(&dword_1CF3C3000, v19, v20, "Deleting pending registration for transaction %s", v22, 0xCu);
    swift_arrayDestroy();
    v28 = v25;
    v4 = v24;
    v8 = v61;
    MEMORY[0x1D17D1060](v28, -1, -1);
    v29 = v22;
    v15 = v67;
    MEMORY[0x1D17D1060](v29, -1, -1);
  }
  else
  {
    v66 = *(void (**)(char *, uint64_t))(v5 + 8);
    v66(v13, v4);
  }

  objc_msgSend(a2, sel_deleteObject_, v64);
  v70[0] = 0;
  v30 = objc_msgSend(a2, sel_save_, v70);
  v31 = v70[0];
  v32 = v65;
  if (v30)
  {
    v33 = v62;
    v65(v62, v15, v4);
    v34 = v31;
    v35 = sub_1CF524C44();
    v36 = sub_1CF525220();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      v38 = v4;
      v39 = (void *)swift_slowAlloc();
      v70[0] = v39;
      *(_DWORD *)v37 = 136315138;
      v65 = (void (*)(char *, char *, uint64_t))(v37 + 4);
      sub_1CF3C6DA0(&qword_1EFB933A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD078], MEMORY[0x1E0CAD090]);
      v40 = sub_1CF5257F0();
      v69 = sub_1CF3F9B9C(v40, v41, (uint64_t *)v70);
      sub_1CF525418();
      swift_bridgeObjectRelease();
      v42 = (uint64_t (*)(char *, uint64_t))v66;
      v66(v33, v38);
      _os_log_impl(&dword_1CF3C3000, v35, v36, "Deleted pending registration for transaction %s", v37, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17D1060](v39, -1, -1);
      MEMORY[0x1D17D1060](v37, -1, -1);

      return v42(v67, v38);
    }
    else
    {

      v59 = (uint64_t (*)(char *, uint64_t))v66;
      v66(v33, v4);
      return v59(v15, v4);
    }
  }
  else
  {
    v44 = v70[0];
    v45 = (void *)sub_1CF5248C0();

    swift_willThrow();
    v32(v8, v15, v4);
    v46 = v45;
    v47 = v45;
    v48 = sub_1CF524C44();
    v49 = sub_1CF525208();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = swift_slowAlloc();
      v65 = (void (*)(char *, char *, uint64_t))swift_slowAlloc();
      v68 = (void *)swift_slowAlloc();
      v70[0] = v68;
      *(_DWORD *)v50 = 136315394;
      sub_1CF3C6DA0(&qword_1EFB933A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD078], MEMORY[0x1E0CAD090]);
      v51 = sub_1CF5257F0();
      v69 = sub_1CF3F9B9C(v51, v52, (uint64_t *)v70);
      sub_1CF525418();
      swift_bridgeObjectRelease();
      v53 = (uint64_t (*)(char *, uint64_t))v66;
      v66(v8, v4);
      *(_WORD *)(v50 + 12) = 2112;
      v54 = v45;
      v55 = _swift_stdlib_bridgeErrorToNSError();
      v69 = v55;
      sub_1CF525418();
      v56 = v65;
      *(_QWORD *)v65 = v55;

      _os_log_impl(&dword_1CF3C3000, v48, v49, "Failed to delete pending registration for transaction %s with error: %@", (uint8_t *)v50, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFB94080);
      swift_arrayDestroy();
      MEMORY[0x1D17D1060](v56, -1, -1);
      v57 = v68;
      swift_arrayDestroy();
      MEMORY[0x1D17D1060](v57, -1, -1);
      v58 = v50;
      v15 = v67;
      MEMORY[0x1D17D1060](v58, -1, -1);
    }
    else
    {
      v53 = (uint64_t (*)(char *, uint64_t))v66;
      v66(v8, v4);

    }
    swift_willThrow();
    return v53(v15, v4);
  }
}

uint64_t sub_1CF51D714@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  char *v30;
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
  char *v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;
  void (*v53)(char *, char *, uint64_t);
  NSObject *v54;
  os_log_type_t v55;
  _BOOL4 v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  char *v65;
  char *v66;
  char *v67;
  NSObject *v68;
  os_log_type_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  char *v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  void *v81;
  char *v82;
  id v83;
  id v84;
  NSObject *v85;
  os_log_type_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  id v90;
  uint64_t v91;
  _QWORD *v92;
  void (*v93)(char *, char *, uint64_t);
  uint64_t v94;
  uint64_t v95;
  unint64_t v96;
  unint64_t v97;
  char *v98;
  NSObject *v99;
  os_log_type_t v100;
  int v101;
  _BOOL4 v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  char *v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  void (*v112)(char *, uint64_t);
  void (*v113)(char *, uint64_t);
  uint64_t v114;
  char *v115;
  uint64_t v116;
  void (*v117)(char *, uint64_t);
  uint64_t v118;
  uint64_t v119;
  char *v120;
  _QWORD *v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v126;
  uint64_t v127;
  void (*v128)(char *, char *, uint64_t);
  char *v129;
  char *v130;
  char *v131;
  uint64_t v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  char *v142;
  char *v143;
  char *v144;
  uint64_t v145;
  char *v146;
  char *v147;
  char *v148;
  char *v149;
  char *v150;
  void (*v151)(char *, uint64_t);
  uint64_t v152;
  char *v153;
  uint64_t v154;
  char *v155;
  uint64_t v156;
  void *v157;
  char *v158;
  uint64_t v159;
  uint64_t v160;
  char *v161;
  uint64_t v162;
  char *v163;
  uint64_t v164;
  char *v165;
  _QWORD *v166;
  char *v167;
  void (*v168)(char *, char *, uint64_t);
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173[2];
  uint64_t v174;

  v156 = a1;
  v160 = a2;
  v132 = a3;
  v136 = sub_1CF5232D0();
  v135 = *(_QWORD *)(v136 - 8);
  MEMORY[0x1E0C80A78](v136);
  v148 = (char *)&v126 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v145 = sub_1CF524DAC();
  v138 = *(_QWORD *)(v145 - 8);
  v5 = MEMORY[0x1E0C80A78](v145);
  v144 = (char *)&v126 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v137 = (char *)&v126 - v7;
  v134 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94FA8);
  v141 = *(_QWORD *)(v134 - 8);
  v8 = MEMORY[0x1E0C80A78](v134);
  v131 = (char *)&v126 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v126 - v10;
  v140 = sub_1CF524DD0();
  v139 = *(_QWORD *)(v140 - 8);
  MEMORY[0x1E0C80A78](v140);
  v149 = (char *)&v126 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v162 = sub_1CF524DE8();
  v164 = *(_QWORD *)(v162 - 8);
  v13 = MEMORY[0x1E0C80A78](v162);
  v143 = (char *)&v126 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v13);
  v155 = (char *)&v126 - v16;
  MEMORY[0x1E0C80A78](v15);
  v163 = (char *)&v126 - v17;
  v169 = sub_1CF524AB8();
  v154 = *(_QWORD *)(v169 - 8);
  v18 = MEMORY[0x1E0C80A78](v169);
  v130 = (char *)&v126 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = MEMORY[0x1E0C80A78](v18);
  v153 = (char *)&v126 - v21;
  MEMORY[0x1E0C80A78](v20);
  v165 = (char *)&v126 - v22;
  v23 = sub_1CF524140();
  v170 = *(_QWORD *)(v23 - 8);
  v24 = MEMORY[0x1E0C80A78](v23);
  v129 = (char *)&v126 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x1E0C80A78](v24);
  v28 = (char *)&v126 - v27;
  MEMORY[0x1E0C80A78](v26);
  v30 = (char *)&v126 - v29;
  v31 = sub_1CF523BC4();
  v32 = MEMORY[0x1E0C80A78](v31);
  v133 = (char *)&v126 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = MEMORY[0x1E0C80A78](v32);
  v147 = (char *)&v126 - v35;
  v36 = MEMORY[0x1E0C80A78](v34);
  v146 = (char *)&v126 - v37;
  v38 = MEMORY[0x1E0C80A78](v36);
  v161 = (char *)&v126 - v39;
  v40 = MEMORY[0x1E0C80A78](v38);
  v42 = (char *)&v126 - v41;
  v43 = MEMORY[0x1E0C80A78](v40);
  v45 = (char *)&v126 - v44;
  MEMORY[0x1E0C80A78](v43);
  v47 = (char *)&v126 - v46;
  v152 = v48;
  v49 = v3;
  v50 = *(void (**)(char *, uint64_t, uint64_t))(v48 + 16);
  v50((char *)&v126 - v46, v49, v31);
  v50(v45, (uint64_t)v47, v31);
  v142 = v45;
  sub_1CF524134();
  if (qword_1ED8F4448 != -1)
    swift_once();
  v51 = sub_1CF524C5C();
  v52 = __swift_project_value_buffer(v51, (uint64_t)qword_1ED8F2970);
  v53 = *(void (**)(char *, char *, uint64_t))(v170 + 16);
  v158 = v30;
  v128 = v53;
  v53(v28, v30, v23);
  v167 = v47;
  v168 = (void (*)(char *, char *, uint64_t))v50;
  v50(v42, (uint64_t)v47, v31);
  v166 = (_QWORD *)v52;
  v54 = sub_1CF524C44();
  v55 = sub_1CF525220();
  v56 = os_log_type_enabled(v54, v55);
  v174 = v31;
  v159 = v23;
  v150 = v11;
  if (v56)
  {
    v57 = swift_slowAlloc();
    v127 = swift_slowAlloc();
    v173[0] = v127;
    *(_DWORD *)v57 = 136315394;
    sub_1CF3C6DA0(qword_1EFB94FB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD690], MEMORY[0x1E0CAD698]);
    v58 = sub_1CF5257F0();
    v171 = sub_1CF3F9B9C(v58, v59, v173);
    v31 = v174;
    sub_1CF525418();
    swift_bridgeObjectRelease();
    v151 = *(void (**)(char *, uint64_t))(v170 + 8);
    v151(v28, v23);
    *(_WORD *)(v57 + 12) = 2080;
    sub_1CF3C6DA0(&qword_1EFB933A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD078], MEMORY[0x1E0CAD090]);
    v60 = sub_1CF5257F0();
    v171 = sub_1CF3F9B9C(v60, v61, v173);
    sub_1CF525418();
    swift_bridgeObjectRelease();
    v170 = *(_QWORD *)(v152 + 8);
    ((void (*)(char *, uint64_t))v170)(v42, v31);
    _os_log_impl(&dword_1CF3C3000, v54, v55, "Using topic %s to register for transaction %s", (uint8_t *)v57, 0x16u);
    v62 = v127;
    swift_arrayDestroy();
    MEMORY[0x1D17D1060](v62, -1, -1);
    MEMORY[0x1D17D1060](v57, -1, -1);
  }
  else
  {
    v151 = *(void (**)(char *, uint64_t))(v170 + 8);
    v151(v28, v23);
    v170 = *(_QWORD *)(v152 + 8);
    ((void (*)(char *, uint64_t))v170)(v42, v31);
  }

  v63 = v165;
  sub_1CF5242FC();
  v64 = v154;
  v65 = v153;
  v152 = *(_QWORD *)(v154 + 16);
  ((void (*)(char *, char *, uint64_t))v152)(v153, v63, v169);
  v66 = v161;
  v67 = v167;
  v168(v161, v167, v31);
  v68 = sub_1CF524C44();
  v69 = sub_1CF525220();
  if (os_log_type_enabled(v68, v69))
  {
    v70 = swift_slowAlloc();
    v127 = swift_slowAlloc();
    v173[0] = v127;
    *(_DWORD *)v70 = 136315394;
    sub_1CF3C6DA0(&qword_1EFB8F9B0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0998], MEMORY[0x1E0CB09F0]);
    v71 = v169;
    v72 = sub_1CF5257F0();
    v171 = sub_1CF3F9B9C(v72, v73, v173);
    sub_1CF525418();
    swift_bridgeObjectRelease();
    v154 = *(_QWORD *)(v64 + 8);
    ((void (*)(char *, uint64_t))v154)(v65, v71);
    *(_WORD *)(v70 + 12) = 2080;
    sub_1CF3C6DA0(&qword_1EFB933A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD078], MEMORY[0x1E0CAD090]);
    v74 = v161;
    v75 = sub_1CF5257F0();
    v171 = sub_1CF3F9B9C(v75, v76, v173);
    v31 = v174;
    sub_1CF525418();
    swift_bridgeObjectRelease();
    ((void (*)(char *, uint64_t))v170)(v74, v31);
    _os_log_impl(&dword_1CF3C3000, v68, v69, "Using credential %s to register for transaction %s", (uint8_t *)v70, 0x16u);
    v77 = v127;
    swift_arrayDestroy();
    v67 = v167;
    MEMORY[0x1D17D1060](v77, -1, -1);
    MEMORY[0x1D17D1060](v70, -1, -1);
  }
  else
  {
    v154 = *(_QWORD *)(v64 + 8);
    ((void (*)(char *, uint64_t))v154)(v65, v169);
    ((void (*)(char *, uint64_t))v170)(v66, v31);
  }

  v78 = v162;
  v79 = v163;
  v80 = v155;
  v81 = v157;
  sub_1CF524548();
  if (v81)
  {
    v82 = v147;
    v168(v147, v67, v31);
    v83 = v81;
    v84 = v81;
    v85 = sub_1CF524C44();
    v86 = sub_1CF525208();
    if (os_log_type_enabled(v85, v86))
    {
      v87 = swift_slowAlloc();
      v166 = (_QWORD *)swift_slowAlloc();
      v168 = (void (*)(char *, char *, uint64_t))swift_slowAlloc();
      v173[0] = (uint64_t)v168;
      *(_DWORD *)v87 = 136315394;
      sub_1CF3C6DA0(&qword_1EFB933A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD078], MEMORY[0x1E0CAD090]);
      v88 = sub_1CF5257F0();
      v171 = sub_1CF3F9B9C(v88, v89, v173);
      v67 = v167;
      sub_1CF525418();
      swift_bridgeObjectRelease();
      ((void (*)(char *, uint64_t))v170)(v82, v31);
      *(_WORD *)(v87 + 12) = 2112;
      v90 = v81;
      v91 = _swift_stdlib_bridgeErrorToNSError();
      v171 = v91;
      sub_1CF525418();
      v92 = v166;
      *v166 = v91;

      _os_log_impl(&dword_1CF3C3000, v85, v86, "Failed to access private key for transaction %s with error: %@", (uint8_t *)v87, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFB94080);
      swift_arrayDestroy();
      MEMORY[0x1D17D1060](v92, -1, -1);
      v93 = v168;
      swift_arrayDestroy();
      MEMORY[0x1D17D1060](v93, -1, -1);
      MEMORY[0x1D17D1060](v87, -1, -1);
    }
    else
    {
      ((void (*)(char *, uint64_t))v170)(v82, v31);

    }
    v110 = v158;
    v111 = v159;
    v112 = v151;
    v113 = (void (*)(char *, uint64_t))v154;
    swift_willThrow();
    v113(v165, v169);
    v112(v110, v111);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v164 + 32))(v79, v80, v78);
    v94 = sub_1CF524DDC();
    v95 = MEMORY[0x1D17CFE00](v94);
    v97 = v96;
    v98 = v146;
    v168(v146, v67, v31);
    sub_1CF40D8E4(v95, v97);
    sub_1CF40D8E4(v95, v97);
    v99 = sub_1CF524C44();
    v100 = sub_1CF525220();
    v101 = v100;
    v102 = os_log_type_enabled(v99, v100);
    v161 = (char *)v97;
    if (v102)
    {
      v103 = swift_slowAlloc();
      v156 = swift_slowAlloc();
      v173[0] = v156;
      *(_DWORD *)v103 = 136315394;
      LODWORD(v155) = v101;
      v104 = sub_1CF5249B0();
      v171 = sub_1CF3F9B9C(v104, v105, v173);
      sub_1CF525418();
      swift_bridgeObjectRelease();
      sub_1CF40A04C(v95, v97);
      sub_1CF40A04C(v95, v97);
      *(_WORD *)(v103 + 12) = 2080;
      sub_1CF3C6DA0(&qword_1EFB933A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD078], MEMORY[0x1E0CAD090]);
      v106 = v146;
      v107 = sub_1CF5257F0();
      v171 = sub_1CF3F9B9C(v107, v108, v173);
      sub_1CF525418();
      swift_bridgeObjectRelease();
      ((void (*)(char *, uint64_t))v170)(v106, v31);
      _os_log_impl(&dword_1CF3C3000, v99, (os_log_type_t)v155, "Using public key %s to register for transaction %s", (uint8_t *)v103, 0x16u);
      v109 = v156;
      swift_arrayDestroy();
      MEMORY[0x1D17D1060](v109, -1, -1);
      MEMORY[0x1D17D1060](v103, -1, -1);
    }
    else
    {
      sub_1CF40A04C(v95, v97);
      sub_1CF40A04C(v95, v97);
      ((void (*)(char *, uint64_t))v170)(v98, v31);
    }

    v114 = v138;
    v115 = v137;
    v157 = (void *)v95;
    v173[0] = v95;
    v173[1] = (uint64_t)v161;
    v67 = v167;
    v171 = sub_1CF523BB8();
    v172 = v116;
    sub_1CF524DA0();
    sub_1CF524DF4();
    sub_1CF3C6DA0(&qword_1EFB94C40, (uint64_t (*)(uint64_t))MEMORY[0x1E0CA9940], MEMORY[0x1E0CA9930]);
    sub_1CF47C580();
    sub_1CF524DB8();
    v117 = *(void (**)(char *, uint64_t))(v114 + 8);
    v118 = v145;
    v117(v115, v145);
    v168(v142, v67, v174);
    v119 = v162;
    (*(void (**)(char *, char *, uint64_t))(v164 + 16))(v143, v163, v162);
    sub_1CF5232B8();
    v120 = v144;
    sub_1CF524308();
    v168 = (void (*)(char *, char *, uint64_t))sub_1CF5232C4();
    v166 = v121;
    v117(v120, v118);
    v128(v129, v158, v159);
    ((void (*)(char *, char *, uint64_t))v152)(v130, v165, v169);
    v122 = v141;
    v123 = v150;
    v124 = v134;
    (*(void (**)(char *, char *, uint64_t))(v141 + 16))(v131, v150, v134);
    sub_1CF5244A0();
    (*(void (**)(char *, uint64_t))(v135 + 8))(v148, v136);
    (*(void (**)(char *, uint64_t))(v122 + 8))(v123, v124);
    (*(void (**)(char *, uint64_t))(v139 + 8))(v149, v140);
    (*(void (**)(char *, uint64_t))(v164 + 8))(v163, v119);
    ((void (*)(char *, uint64_t))v154)(v165, v169);
    v151(v158, v159);
  }
  return ((uint64_t (*)(char *, uint64_t))v170)(v67, v174);
}

uint64_t sub_1CF51EA38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[8] = a3;
  v4[9] = v3;
  v4[6] = a1;
  v4[7] = a2;
  v5 = sub_1CF5244F4();
  v4[10] = v5;
  v4[11] = *(_QWORD *)(v5 - 8);
  v4[12] = swift_task_alloc();
  v6 = sub_1CF523BC4();
  v4[13] = v6;
  v4[14] = *(_QWORD *)(v6 - 8);
  v4[15] = swift_task_alloc();
  v4[16] = swift_task_alloc();
  v4[17] = swift_task_alloc();
  v4[18] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CF51EAEC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  _QWORD *v20;
  uint64_t (*v22)(_QWORD, _QWORD);
  uint64_t v23;

  v1 = v0[18];
  v2 = v0[13];
  v3 = v0[9];
  v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0[14] + 16);
  v0[19] = v4;
  v4(v1, v3, v2);
  if (qword_1ED8F4448 != -1)
    swift_once();
  v5 = v0[17];
  v6 = v0[18];
  v7 = v0[13];
  v8 = sub_1CF524C5C();
  v0[20] = __swift_project_value_buffer(v8, (uint64_t)qword_1ED8F2970);
  v4(v5, v6, v7);
  v9 = sub_1CF524C44();
  v10 = sub_1CF525220();
  v11 = os_log_type_enabled(v9, v10);
  v12 = v0[17];
  v13 = v0[13];
  v14 = v0[14];
  if (v11)
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v23 = v16;
    *(_DWORD *)v15 = 136315138;
    sub_1CF3C6DA0(&qword_1EFB933A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD078], MEMORY[0x1E0CAD090]);
    v17 = sub_1CF5257F0();
    v0[5] = sub_1CF3F9B9C(v17, v18, &v23);
    sub_1CF525418();
    swift_bridgeObjectRelease();
    v19 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v19(v12, v13);
    _os_log_impl(&dword_1CF3C3000, v9, v10, "Registering for transaction %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D17D1060](v16, -1, -1);
    MEMORY[0x1D17D1060](v15, -1, -1);
  }
  else
  {
    v19 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v19(v0[17], v0[13]);
  }

  v0[21] = v19;
  v22 = (uint64_t (*)(_QWORD, _QWORD))((int)*MEMORY[0x1E0CAC4E8] + MEMORY[0x1E0CAC4E8]);
  v20 = (_QWORD *)swift_task_alloc();
  v0[22] = v20;
  *v20 = v0;
  v20[1] = sub_1CF51ED30;
  return v22(v0[12], v0[7]);
}

uint64_t sub_1CF51ED30()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 184) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CF51ED94()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;

  v1 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 152);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 128);
  v4 = *(_QWORD *)(v0 + 104);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 88) + 32))(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 96), *(_QWORD *)(v0 + 80));
  v1(v3, v2, v4);
  v5 = sub_1CF524C44();
  v6 = sub_1CF525220();
  if (os_log_type_enabled(v5, v6))
  {
    v18 = *(void (**)(uint64_t, uint64_t))(v0 + 168);
    v19 = *(_QWORD *)(v0 + 144);
    v7 = *(_QWORD *)(v0 + 128);
    v8 = *(_QWORD *)(v0 + 104);
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v20 = v10;
    *(_DWORD *)v9 = 136315138;
    sub_1CF3C6DA0(&qword_1EFB933A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD078], MEMORY[0x1E0CAD090]);
    v11 = sub_1CF5257F0();
    *(_QWORD *)(v0 + 32) = sub_1CF3F9B9C(v11, v12, &v20);
    sub_1CF525418();
    swift_bridgeObjectRelease();
    v18(v7, v8);
    _os_log_impl(&dword_1CF3C3000, v5, v6, "Registered for transaction %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D17D1060](v10, -1, -1);
    MEMORY[0x1D17D1060](v9, -1, -1);

    v18(v19, v8);
  }
  else
  {
    v13 = *(void (**)(uint64_t, uint64_t))(v0 + 168);
    v14 = *(_QWORD *)(v0 + 144);
    v15 = *(_QWORD *)(v0 + 128);
    v16 = *(_QWORD *)(v0 + 104);

    v13(v15, v16);
    v13(v14, v16);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CF51EFB4()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  void (*v19)(uint64_t, uint64_t);
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;

  v1 = *(void **)(v0 + 184);
  (*(void (**)(_QWORD, _QWORD, _QWORD))(v0 + 152))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 104));
  v2 = v1;
  v3 = v1;
  v4 = sub_1CF524C44();
  v5 = sub_1CF525208();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 184);
    v19 = *(void (**)(uint64_t, uint64_t))(v0 + 168);
    v7 = *(_QWORD *)(v0 + 120);
    v8 = *(_QWORD *)(v0 + 104);
    v9 = swift_slowAlloc();
    v20 = (_QWORD *)swift_slowAlloc();
    v21 = swift_slowAlloc();
    v22 = v21;
    *(_DWORD *)v9 = 136315394;
    sub_1CF3C6DA0(&qword_1EFB933A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD078], MEMORY[0x1E0CAD090]);
    v10 = sub_1CF5257F0();
    *(_QWORD *)(v0 + 16) = sub_1CF3F9B9C(v10, v11, &v22);
    sub_1CF525418();
    swift_bridgeObjectRelease();
    v19(v7, v8);
    *(_WORD *)(v9 + 12) = 2112;
    v12 = v6;
    v13 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 24) = v13;
    sub_1CF525418();
    *v20 = v13;

    _os_log_impl(&dword_1CF3C3000, v4, v5, "Failed to register for transaction %s with error: %@", (uint8_t *)v9, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EFB94080);
    swift_arrayDestroy();
    MEMORY[0x1D17D1060](v20, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x1D17D1060](v21, -1, -1);
    MEMORY[0x1D17D1060](v9, -1, -1);
  }
  else
  {
    v14 = *(void **)(v0 + 184);
    (*(void (**)(_QWORD, _QWORD))(v0 + 168))(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 104));

  }
  v15 = *(void (**)(uint64_t, uint64_t))(v0 + 168);
  v16 = *(_QWORD *)(v0 + 144);
  v17 = *(_QWORD *)(v0 + 104);
  swift_willThrow();
  v15(v16, v17);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CF51F258(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2[7] = a1;
  v2[8] = v1;
  v3 = sub_1CF525094();
  v2[9] = v3;
  v2[10] = *(_QWORD *)(v3 - 8);
  v2[11] = swift_task_alloc();
  v4 = sub_1CF5244F4();
  v2[12] = v4;
  v2[13] = *(_QWORD *)(v4 - 8);
  v2[14] = swift_task_alloc();
  v5 = sub_1CF5244AC();
  v2[15] = v5;
  v2[16] = *(_QWORD *)(v5 - 8);
  v2[17] = swift_task_alloc();
  v2[18] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94F70);
  v2[19] = swift_task_alloc();
  v2[20] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94F78);
  v2[21] = swift_task_alloc();
  v2[22] = swift_task_alloc();
  v2[23] = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94F80);
  v2[24] = swift_task_alloc();
  v2[25] = swift_task_alloc();
  v6 = sub_1CF523BC4();
  v2[26] = v6;
  v2[27] = *(_QWORD *)(v6 - 8);
  v2[28] = swift_task_alloc();
  v2[29] = swift_task_alloc();
  v2[30] = swift_task_alloc();
  v2[31] = swift_task_alloc();
  v2[32] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CF51F3FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t, uint64_t);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  _BOOL4 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint8_t *v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  int EnumCaseMultiPayload;
  _QWORD *v45;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  _QWORD *v52;
  uint64_t v53;
  uint64_t v54;
  int8x16_t *v55;
  int8x16_t v56;
  void (*v57)(uint64_t, uint64_t, uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  _BOOL4 v63;
  void *v64;
  void (*v65)(uint64_t, uint64_t);
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint8_t *v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  void (*v75)(uint64_t, uint64_t);
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void (*v79)(uint64_t, uint64_t, uint64_t);
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t (*v84)(_QWORD, void *, _QWORD *, _QWORD);
  uint64_t v85[2];

  v1 = *(_QWORD *)(v0 + 256);
  v2 = *(_QWORD *)(v0 + 208);
  v3 = *(_QWORD *)(v0 + 64);
  v4 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 216) + 16);
  *(_QWORD *)(v0 + 264) = v4;
  v4(v1, v3, v2);
  if (qword_1ED8F4448 != -1)
    swift_once();
  v6 = *(_QWORD *)(v0 + 248);
  v5 = *(_QWORD *)(v0 + 256);
  v7 = *(_QWORD *)(v0 + 208);
  v8 = sub_1CF524C5C();
  *(_QWORD *)(v0 + 272) = __swift_project_value_buffer(v8, (uint64_t)qword_1ED8F2970);
  v79 = v4;
  v4(v6, v5, v7);
  v9 = sub_1CF524C44();
  v10 = sub_1CF525220();
  v11 = os_log_type_enabled(v9, v10);
  v12 = *(_QWORD *)(v0 + 248);
  v14 = *(_QWORD *)(v0 + 208);
  v13 = *(_QWORD *)(v0 + 216);
  if (v11)
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    *(_DWORD *)v15 = 136315138;
    v85[0] = v16;
    sub_1CF3C6DA0(&qword_1EFB933A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD078], MEMORY[0x1E0CAD090]);
    v17 = sub_1CF5257F0();
    *(_QWORD *)(v0 + 48) = sub_1CF3F9B9C(v17, v18, v85);
    sub_1CF525418();
    swift_bridgeObjectRelease();
    v19 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v19(v12, v14);
    _os_log_impl(&dword_1CF3C3000, v9, v10, "Starting register task for transaction %s", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D17D1060](v16, -1, -1);
    MEMORY[0x1D17D1060](v15, -1, -1);
  }
  else
  {
    v19 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v19(*(_QWORD *)(v0 + 248), *(_QWORD *)(v0 + 208));
  }

  *(_QWORD *)(v0 + 280) = v19;
  v20 = *(_QWORD *)(v0 + 256);
  v22 = *(_QWORD *)(v0 + 56);
  v21 = *(_QWORD *)(v0 + 64);
  v23 = (void *)sub_1CF52210C();
  *(_QWORD *)(v0 + 288) = v23;
  v24 = (_QWORD *)swift_task_alloc();
  v24[2] = v21;
  v24[3] = v23;
  v24[4] = v20;
  v24[5] = v22;
  sub_1CF525364();
  v25 = *(_QWORD *)(v0 + 192);
  v26 = *(_QWORD *)(v0 + 200);
  swift_task_dealloc();
  sub_1CF3E2B24(v26, v25, &qword_1EFB94F80);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94F88);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 48))(v25, 1, v27) == 1)
  {
    v28 = *(_QWORD *)(v0 + 256);
    v29 = *(_QWORD *)(v0 + 232);
    v30 = *(_QWORD *)(v0 + 208);
    sub_1CF3CB808(*(_QWORD *)(v0 + 192), &qword_1EFB94F80);
    v79(v29, v28, v30);
    v31 = sub_1CF524C44();
    v32 = sub_1CF525220();
    v33 = os_log_type_enabled(v31, v32);
    v34 = *(_QWORD *)(v0 + 232);
    v35 = *(_QWORD *)(v0 + 200);
    v36 = *(_QWORD *)(v0 + 208);
    if (v33)
    {
      v82 = *(_QWORD *)(v0 + 200);
      v37 = (uint8_t *)swift_slowAlloc();
      v80 = swift_slowAlloc();
      v85[0] = v80;
      *(_DWORD *)v37 = 136315138;
      sub_1CF3C6DA0(&qword_1EFB933A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD078], MEMORY[0x1E0CAD090]);
      v38 = sub_1CF5257F0();
      *(_QWORD *)(v0 + 16) = sub_1CF3F9B9C(v38, v39, v85);
      sub_1CF525418();
      swift_bridgeObjectRelease();
      v19(v34, v36);
      _os_log_impl(&dword_1CF3C3000, v31, v32, "Stopping register task for transaction %s", v37, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17D1060](v80, -1, -1);
      MEMORY[0x1D17D1060](v37, -1, -1);

      v40 = v82;
    }
    else
    {

      v19(v34, v36);
      v40 = v35;
    }
    sub_1CF3CB808(v40, &qword_1EFB94F80);
    v19(*(_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 208));
    goto LABEL_13;
  }
  v41 = *(_QWORD **)(v0 + 192);
  v43 = *(_QWORD *)(v0 + 168);
  v42 = *(_QWORD *)(v0 + 176);
  *(_QWORD *)(v0 + 296) = *v41;
  sub_1CF521430((uint64_t)v41 + *(int *)(v27 + 48), v42);
  sub_1CF3E2B24(v42, v43, &qword_1EFB94F78);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v45 = *(_QWORD **)(v0 + 168);
  if (EnumCaseMultiPayload == 1)
  {
    **(_QWORD **)(v0 + 152) = *v45;
    swift_storeEnumTagMultiPayload();
    v53 = *(_QWORD *)(v0 + 152);
    v54 = *(_QWORD *)(v0 + 64);
    v55 = (int8x16_t *)swift_task_alloc();
    v56 = *(int8x16_t *)(v0 + 288);
    v55[1].i64[0] = v53;
    v55[1].i64[1] = v54;
    v55[2] = vextq_s8(v56, v56, 8uLL);
    sub_1CF525358();
    v57 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 264);
    v58 = *(_QWORD *)(v0 + 256);
    v59 = *(_QWORD *)(v0 + 240);
    v60 = *(_QWORD *)(v0 + 208);
    swift_task_dealloc();
    v57(v59, v58, v60);
    v61 = sub_1CF524C44();
    v62 = sub_1CF525220();
    v63 = os_log_type_enabled(v61, v62);
    v64 = *(void **)(v0 + 296);
    v65 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    v66 = *(_QWORD *)(v0 + 240);
    v67 = *(_QWORD *)(v0 + 200);
    v68 = *(_QWORD *)(v0 + 208);
    v69 = *(_QWORD *)(v0 + 176);
    if (v63)
    {
      v78 = *(void **)(v0 + 288);
      v83 = *(_QWORD *)(v0 + 176);
      v70 = (uint8_t *)swift_slowAlloc();
      v81 = v67;
      v71 = swift_slowAlloc();
      v85[0] = v71;
      *(_DWORD *)v70 = 136315138;
      sub_1CF3C6DA0(&qword_1EFB933A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD078], MEMORY[0x1E0CAD090]);
      v72 = sub_1CF5257F0();
      *(_QWORD *)(v0 + 24) = sub_1CF3F9B9C(v72, v73, v85);
      sub_1CF525418();
      swift_bridgeObjectRelease();
      v65(v66, v68);
      _os_log_impl(&dword_1CF3C3000, v61, v62, "Finished register task for transaction %s", v70, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17D1060](v71, -1, -1);
      MEMORY[0x1D17D1060](v70, -1, -1);

      sub_1CF3CB808(v83, &qword_1EFB94F78);
      v74 = v81;
    }
    else
    {

      v65(v66, v68);
      sub_1CF3CB808(v69, &qword_1EFB94F78);
      v74 = v67;
    }
    sub_1CF3CB808(v74, &qword_1EFB94F80);
    v75 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    v76 = *(_QWORD *)(v0 + 256);
    v77 = *(_QWORD *)(v0 + 208);
    sub_1CF3CB808(*(_QWORD *)(v0 + 152), &qword_1EFB94F70);
    v75(v76, v77);
LABEL_13:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  (*(void (**)(_QWORD, _QWORD *, _QWORD))(*(_QWORD *)(v0 + 128) + 32))(*(_QWORD *)(v0 + 136), v45, *(_QWORD *)(v0 + 120));
  v47 = sub_1CF40DA30();
  *(_QWORD *)(v0 + 304) = v47;
  v48 = v47;
  v49 = *(_QWORD *)(v0 + 136);
  v50 = *(_QWORD *)(v0 + 64);
  v51 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 312) = v51;
  v51[2] = v50;
  v51[3] = v49;
  v51[4] = v48;
  v84 = (uint64_t (*)(_QWORD, void *, _QWORD *, _QWORD))((int)*MEMORY[0x1E0CAC4F0] + MEMORY[0x1E0CAC4F0]);
  v52 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 320) = v52;
  *v52 = v0;
  v52[1] = sub_1CF520028;
  return v84(*(_QWORD *)(v0 + 112), &unk_1EFB94F98, v51, *(_QWORD *)(v0 + 96));
}

uint64_t sub_1CF520028()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 328) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CF520094()
{
  uint64_t v0;
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
  int8x16_t *v11;
  int8x16_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(void);
  void (*v22)(uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  void *v28;
  void (*v29)(uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  void (*v43)(uint64_t, uint64_t);
  void *v44;
  uint64_t v45;
  uint64_t v46;

  v1 = *(_QWORD *)(v0 + 152);
  v3 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 136);
  v5 = *(_QWORD *)(v0 + 112);
  v4 = *(_QWORD *)(v0 + 120);
  v6 = *(_QWORD *)(v0 + 96);
  v7 = *(_QWORD *)(v0 + 104);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v1, v5, v6);
  swift_storeEnumTagMultiPayload();
  v8 = *(_QWORD *)(v0 + 328);
  v9 = *(_QWORD *)(v0 + 152);
  v10 = *(_QWORD *)(v0 + 64);
  v11 = (int8x16_t *)swift_task_alloc();
  v12 = *(int8x16_t *)(v0 + 288);
  v11[1].i64[0] = v9;
  v11[1].i64[1] = v10;
  v11[2] = vextq_s8(v12, v12, 8uLL);
  sub_1CF525358();
  v13 = *(_QWORD *)(v0 + 256);
  if (v8)
  {
    v15 = *(void **)(v0 + 288);
    v14 = *(void **)(v0 + 296);
    v16 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    v18 = *(_QWORD *)(v0 + 200);
    v17 = *(_QWORD *)(v0 + 208);
    v19 = *(_QWORD *)(v0 + 176);
    v20 = *(_QWORD *)(v0 + 152);
    swift_task_dealloc();
    sub_1CF3CB808(v19, &qword_1EFB94F78);
    sub_1CF3CB808(v18, &qword_1EFB94F80);

    sub_1CF3CB808(v20, &qword_1EFB94F70);
    v16(v13, v17);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v21 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 264);
    v23 = *(_QWORD *)(v0 + 240);
    v24 = *(_QWORD *)(v0 + 208);
    swift_task_dealloc();
    v22(v23, v13, v24);
    v25 = sub_1CF524C44();
    v26 = sub_1CF525220();
    v27 = os_log_type_enabled(v25, v26);
    v28 = *(void **)(v0 + 296);
    v29 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    v30 = *(_QWORD *)(v0 + 240);
    v31 = *(_QWORD *)(v0 + 200);
    v32 = *(_QWORD *)(v0 + 208);
    v33 = *(_QWORD *)(v0 + 176);
    if (v27)
    {
      v44 = *(void **)(v0 + 288);
      v45 = *(_QWORD *)(v0 + 200);
      v34 = (uint8_t *)swift_slowAlloc();
      v43 = v29;
      v35 = swift_slowAlloc();
      v46 = v35;
      *(_DWORD *)v34 = 136315138;
      sub_1CF3C6DA0(&qword_1EFB933A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD078], MEMORY[0x1E0CAD090]);
      v36 = sub_1CF5257F0();
      *(_QWORD *)(v0 + 24) = sub_1CF3F9B9C(v36, v37, &v46);
      sub_1CF525418();
      swift_bridgeObjectRelease();
      v43(v30, v32);
      _os_log_impl(&dword_1CF3C3000, v25, v26, "Finished register task for transaction %s", v34, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17D1060](v35, -1, -1);
      MEMORY[0x1D17D1060](v34, -1, -1);

      sub_1CF3CB808(v33, &qword_1EFB94F78);
      v38 = v45;
    }
    else
    {

      v29(v30, v32);
      sub_1CF3CB808(v33, &qword_1EFB94F78);
      v38 = v31;
    }
    sub_1CF3CB808(v38, &qword_1EFB94F80);
    v39 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    v40 = *(_QWORD *)(v0 + 256);
    v41 = *(_QWORD *)(v0 + 208);
    sub_1CF3CB808(*(_QWORD *)(v0 + 152), &qword_1EFB94F70);
    v39(v40, v41);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v21 = *(uint64_t (**)(void))(v0 + 8);
  }
  return v21();
}

uint64_t sub_1CF520510()
{
  uint64_t v0;
  void *v1;
  id v2;
  void (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  void *v10;
  void (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  int8x16_t *v24;
  int8x16_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  _BOOL4 v38;
  void *v39;
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  uint64_t v50;
  uint64_t v51;
  void (*v53)(uint64_t, uint64_t);
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59[2];

  swift_release();
  swift_task_dealloc();
  v1 = *(void **)(v0 + 328);
  *(_QWORD *)(v0 + 32) = v1;
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB8F770);
  if ((swift_dynamicCast() & 1) != 0)
  {
    v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 264);
    v4 = *(_QWORD *)(v0 + 256);
    v5 = *(_QWORD *)(v0 + 224);
    v6 = *(_QWORD *)(v0 + 208);

    v3(v5, v4, v6);
    v7 = sub_1CF524C44();
    v8 = sub_1CF525208();
    v9 = os_log_type_enabled(v7, v8);
    v10 = *(void **)(v0 + 296);
    v11 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    v12 = *(_QWORD *)(v0 + 224);
    v13 = *(_QWORD *)(v0 + 200);
    v14 = *(_QWORD *)(v0 + 208);
    v15 = *(_QWORD *)(v0 + 176);
    if (v9)
    {
      v55 = *(void **)(v0 + 288);
      v57 = *(_QWORD *)(v0 + 200);
      v16 = (uint8_t *)swift_slowAlloc();
      v54 = v10;
      v17 = swift_slowAlloc();
      v59[0] = v17;
      *(_DWORD *)v16 = 136315138;
      sub_1CF3C6DA0(&qword_1EFB933A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD078], MEMORY[0x1E0CAD090]);
      v18 = sub_1CF5257F0();
      *(_QWORD *)(v0 + 40) = sub_1CF3F9B9C(v18, v19, v59);
      sub_1CF525418();
      swift_bridgeObjectRelease();
      v11(v12, v14);
      _os_log_impl(&dword_1CF3C3000, v7, v8, "Register task for transaction %s was cancelled", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17D1060](v17, -1, -1);
      MEMORY[0x1D17D1060](v16, -1, -1);

      sub_1CF3CB808(v15, &qword_1EFB94F78);
      v20 = v57;
    }
    else
    {

      v11(v12, v14);
      sub_1CF3CB808(v15, &qword_1EFB94F78);
      v20 = v13;
    }
    sub_1CF3CB808(v20, &qword_1EFB94F80);
    v27 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    v28 = *(_QWORD *)(v0 + 256);
    v29 = *(_QWORD *)(v0 + 208);
    v31 = *(_QWORD *)(v0 + 80);
    v30 = *(_QWORD *)(v0 + 88);
    v32 = *(_QWORD *)(v0 + 72);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 128) + 8))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 120));
    v27(v28, v29);
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);

  }
  else
  {
    v21 = *(_QWORD **)(v0 + 152);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 128) + 8))(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 120));

    *v21 = v1;
    swift_storeEnumTagMultiPayload();
    v22 = *(_QWORD *)(v0 + 152);
    v23 = *(_QWORD *)(v0 + 64);
    v24 = (int8x16_t *)swift_task_alloc();
    v25 = *(int8x16_t *)(v0 + 288);
    v24[1].i64[0] = v22;
    v24[1].i64[1] = v23;
    v24[2] = vextq_s8(v25, v25, 8uLL);
    sub_1CF525358();
    v26 = *(_QWORD *)(v0 + 256);
    v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 264);
    v34 = *(_QWORD *)(v0 + 240);
    v35 = *(_QWORD *)(v0 + 208);
    swift_task_dealloc();
    v33(v34, v26, v35);
    v36 = sub_1CF524C44();
    v37 = sub_1CF525220();
    v38 = os_log_type_enabled(v36, v37);
    v39 = *(void **)(v0 + 296);
    v40 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    v41 = *(_QWORD *)(v0 + 240);
    v42 = *(_QWORD *)(v0 + 200);
    v43 = *(_QWORD *)(v0 + 208);
    v44 = *(_QWORD *)(v0 + 176);
    if (v38)
    {
      v56 = *(void **)(v0 + 288);
      v58 = *(_QWORD *)(v0 + 176);
      v45 = (uint8_t *)swift_slowAlloc();
      v53 = v40;
      v46 = swift_slowAlloc();
      v59[0] = v46;
      *(_DWORD *)v45 = 136315138;
      sub_1CF3C6DA0(&qword_1EFB933A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD078], MEMORY[0x1E0CAD090]);
      v47 = sub_1CF5257F0();
      *(_QWORD *)(v0 + 24) = sub_1CF3F9B9C(v47, v48, v59);
      sub_1CF525418();
      swift_bridgeObjectRelease();
      v53(v41, v43);
      _os_log_impl(&dword_1CF3C3000, v36, v37, "Finished register task for transaction %s", v45, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D17D1060](v46, -1, -1);
      MEMORY[0x1D17D1060](v45, -1, -1);

      sub_1CF3CB808(v58, &qword_1EFB94F78);
    }
    else
    {

      v40(v41, v43);
      sub_1CF3CB808(v44, &qword_1EFB94F78);
    }
    sub_1CF3CB808(v42, &qword_1EFB94F80);
    v49 = *(void (**)(uint64_t, uint64_t))(v0 + 280);
    v50 = *(_QWORD *)(v0 + 256);
    v51 = *(_QWORD *)(v0 + 208);
    sub_1CF3CB808(*(_QWORD *)(v0 + 152), &qword_1EFB94F70);
    v49(v50, v51);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void *sub_1CF520BF4@<X0>(void (*a1)(NSObject *, uint64_t)@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, _QWORD *a4@<X8>)
{
  void (*v4)(NSObject *, uint64_t);
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void *result;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  _QWORD *v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  void (*v40)(NSObject *, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v40 = a1;
  v38 = a4;
  v39 = a3;
  v37 = a2;
  v36 = sub_1CF524314();
  v4 = *(void (**)(NSObject *, uint64_t))(v36 - 8);
  MEMORY[0x1E0C80A78](v36);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94F78);
  v8 = MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (uint64_t *)((char *)&v35 - v11);
  v13 = sub_1CF523BC4();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = v41;
  result = (void *)sub_1CF51B548(v40);
  v41 = v17;
  if (!v17)
  {
    v40 = v4;
    if (result)
    {
      v19 = *(_QWORD *)(v39 + 88);
      v20 = result;
      v21 = v41;
      sub_1CF51BA30(v19, (uint64_t)v6);
      if (v21)
      {
        v41 = 0;
        v34 = v38;
        *v12 = v21;
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        sub_1CF51D714((uint64_t)v20, (uint64_t)v6, (uint64_t)v10);
        v41 = 0;
        (*((void (**)(char *, uint64_t))v40 + 1))(v6, v36);
        swift_storeEnumTagMultiPayload();
        sub_1CF521430((uint64_t)v10, (uint64_t)v12);
        v34 = v38;
      }
      v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94F88);
      sub_1CF521430((uint64_t)v12, (uint64_t)v34 + *(int *)(v22 + 48));

      *v34 = v20;
      return (void *)(*(uint64_t (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v34, 0, 1, v22);
    }
    else
    {
      if (qword_1ED8F4448 != -1)
        swift_once();
      v23 = sub_1CF524C5C();
      __swift_project_value_buffer(v23, (uint64_t)qword_1ED8F2970);
      v24 = v16;
      (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v16, v37, v13);
      v25 = sub_1CF524C44();
      v26 = sub_1CF525208();
      if (os_log_type_enabled(v25, v26))
      {
        v27 = swift_slowAlloc();
        v40 = (void (*)(NSObject *, uint64_t))v14;
        v28 = (uint8_t *)v27;
        v29 = swift_slowAlloc();
        v43 = v29;
        *(_DWORD *)v28 = 136315138;
        sub_1CF3C6DA0(&qword_1EFB933A8, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAD078], MEMORY[0x1E0CAD090]);
        v30 = sub_1CF5257F0();
        v42 = sub_1CF3F9B9C(v30, v31, &v43);
        sub_1CF525418();
        swift_bridgeObjectRelease();
        (*((void (**)(char *, uint64_t))v40 + 1))(v24, v13);
        _os_log_impl(&dword_1CF3C3000, v25, v26, "Pending registration for transaction %s not found", v28, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1D17D1060](v29, -1, -1);
        MEMORY[0x1D17D1060](v28, -1, -1);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v14 + 8))(v24, v13);
      }

      v32 = v38;
      v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94F88);
      return (void *)(*(uint64_t (**)(_QWORD *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v32, 1, 1, v33);
    }
  }
  return result;
}

uint64_t sub_1CF520FE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v8;

  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v8;
  *v8 = v4;
  v8[1] = sub_1CF3CE884;
  return sub_1CF51EA38(a1, a3, a4);
}

uint64_t sub_1CF521050(uint64_t a1, uint64_t a2, void (*a3)(char *, uint64_t), void *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v14;
  void *v15;

  v15 = a4;
  v6 = sub_1CF524A70();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94F70);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CF3E2B24(a1, (uint64_t)v12, &qword_1EFB94F70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_1CF3CB808((uint64_t)v12, &qword_1EFB94F70);
    sub_1CF524A4C();
    sub_1CF51C068(a3, v9, v15);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    sub_1CF51D040((uint64_t)a3, v15);
    return sub_1CF3CB808((uint64_t)v12, &qword_1EFB94F70);
  }
}

uint64_t sub_1CF5211AC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1CF523BC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
  type metadata accessor for OrderWebServiceTaskIdentifier(0);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_1CF5211FC()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB926E0);
  v1 = type metadata accessor for OrderWebServiceTaskExclusivityIdentifier(0);
  v2 = (*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_1CF527020;
  v4 = sub_1CF523BC4();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(v3 + v2, v0, v4);
  swift_storeEnumTagMultiPayload();
  swift_storeEnumTagMultiPayload();
  v5 = sub_1CF43224C(v3);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return v5;
}

uint64_t sub_1CF5212F0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1CF3D1338;
  return sub_1CF51F258(a1);
}

uint64_t sub_1CF52133C(uint64_t a1)
{
  uint64_t result;

  result = sub_1CF3C6DA0(&qword_1EFB94F50, (uint64_t (*)(uint64_t))type metadata accessor for PrismWebServiceRegisterTransactionTask, (uint64_t)&unk_1CF52C818);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_1CF52137C(uint64_t a1)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = sub_1CF3C6DA0(&qword_1EFB94F58, (uint64_t (*)(uint64_t))type metadata accessor for PrismWebServiceRegisterTransactionTask, (uint64_t)&unk_1CF52C85C);
  result = sub_1CF3C6DA0(&qword_1EFB94F60, (uint64_t (*)(uint64_t))type metadata accessor for PrismWebServiceRegisterTransactionTask, (uint64_t)&unk_1CF52C7E0);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_1CF5213D8(uint64_t a1)
{
  uint64_t result;

  result = sub_1CF3C6DA0(&qword_1EFB93198, (uint64_t (*)(uint64_t))type metadata accessor for PrismWebServiceRegisterTransactionTask, (uint64_t)&unk_1CF52C7FC);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

void *sub_1CF521414@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_1CF520BF4(*(void (**)(NSObject *, uint64_t))(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), a1);
}

uint64_t sub_1CF521430(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFB94F78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1CF521478()
{
  uint64_t v0;

  return sub_1CF521050(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void (**)(char *, uint64_t))(v0 + 32), *(void **)(v0 + 40));
}

uint64_t sub_1CF521494(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;

  v4 = *(_QWORD *)(v1 + 24);
  v5 = *(_QWORD *)(v1 + 32);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_1CF3CE884;
  v7 = (_QWORD *)swift_task_alloc();
  v6[2] = v7;
  *v7 = v6;
  v7[1] = sub_1CF3CE884;
  return sub_1CF51EA38(a1, v4, v5);
}

uint64_t *sub_1CF521524(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_1CF523BC4();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 24);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_1CF524A70();
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
  }
  return a1;
}

uint64_t sub_1CF521634(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v4 = sub_1CF523BC4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 24);
  v6 = sub_1CF524A70();
  v7 = *(_QWORD *)(v6 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  return result;
}

uint64_t sub_1CF5216C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = sub_1CF523BC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_1CF524A70();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t sub_1CF5217A8(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = sub_1CF523BC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  v7 = *(int *)(a3 + 24);
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_1CF524A70();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t sub_1CF5218DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = sub_1CF523BC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_1CF524A70();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t sub_1CF5219C0(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = sub_1CF523BC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 24);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_1CF524A70();
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
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t sub_1CF521AF0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF521AFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = sub_1CF523BC4();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    v10 = a1 + *(int *)(a3 + 24);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t sub_1CF521B74()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CF521B80(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = sub_1CF523BC4();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED8F2790);
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_1CF521C00()
{
  unint64_t v0;
  unint64_t v1;

  sub_1CF523BC4();
  if (v0 <= 0x3F)
  {
    sub_1CF3D5B68();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t sub_1CF521CD4()
{
  return MEMORY[0x1E0CAAF10]();
}

uint64_t sub_1CF521CE0()
{
  return MEMORY[0x1E0CAAF18]();
}

uint64_t sub_1CF521CEC()
{
  return MEMORY[0x1E0CAAF30]();
}

uint64_t sub_1CF521CF8()
{
  return MEMORY[0x1E0CAAF40]();
}

uint64_t sub_1CF521D04()
{
  return MEMORY[0x1E0CAAF48]();
}

uint64_t sub_1CF521D10()
{
  return MEMORY[0x1E0CAAF50]();
}

uint64_t sub_1CF521D1C()
{
  return MEMORY[0x1E0CAAF58]();
}

uint64_t sub_1CF521D28()
{
  return MEMORY[0x1E0CAAF60]();
}

uint64_t sub_1CF521D34()
{
  return MEMORY[0x1E0CAAF78]();
}

uint64_t sub_1CF521D40()
{
  return MEMORY[0x1E0CAAF80]();
}

uint64_t sub_1CF521D4C()
{
  return MEMORY[0x1E0CAAF88]();
}

uint64_t sub_1CF521D58()
{
  return MEMORY[0x1E0CAAF90]();
}

uint64_t sub_1CF521D64()
{
  return MEMORY[0x1E0CAAFA8]();
}

uint64_t sub_1CF521D70()
{
  return MEMORY[0x1E0CAAFC0]();
}

uint64_t sub_1CF521D7C()
{
  return MEMORY[0x1E0CAAFC8]();
}

uint64_t sub_1CF521D88()
{
  return MEMORY[0x1E0CAAFD0]();
}

uint64_t sub_1CF521D94()
{
  return MEMORY[0x1E0CAAFE0]();
}

uint64_t sub_1CF521DA0()
{
  return MEMORY[0x1E0CAAFF0]();
}

uint64_t sub_1CF521DAC()
{
  return MEMORY[0x1E0CAAFF8]();
}

uint64_t sub_1CF521DB8()
{
  return MEMORY[0x1E0CAB000]();
}

uint64_t sub_1CF521DC4()
{
  return MEMORY[0x1E0CAB078]();
}

uint64_t sub_1CF521DD0()
{
  return MEMORY[0x1E0CAB080]();
}

uint64_t sub_1CF521DDC()
{
  return MEMORY[0x1E0CAB088]();
}

uint64_t sub_1CF521DE8()
{
  return MEMORY[0x1E0CAB090]();
}

uint64_t sub_1CF521DF4()
{
  return MEMORY[0x1E0CAB0A0]();
}

uint64_t sub_1CF521E00()
{
  return MEMORY[0x1E0CAB0B0]();
}

uint64_t sub_1CF521E0C()
{
  return MEMORY[0x1E0CAB0F8]();
}

uint64_t sub_1CF521E18()
{
  return MEMORY[0x1E0CAB140]();
}

uint64_t sub_1CF521E24()
{
  return MEMORY[0x1E0CAB228]();
}

uint64_t sub_1CF521E30()
{
  return MEMORY[0x1E0CAB250]();
}

uint64_t sub_1CF521E3C()
{
  return MEMORY[0x1E0CAB268]();
}

uint64_t sub_1CF521E48()
{
  return MEMORY[0x1E0CAB270]();
}

uint64_t sub_1CF521E54()
{
  return MEMORY[0x1E0CAB280]();
}

uint64_t sub_1CF521E60()
{
  return MEMORY[0x1E0CAB288]();
}

uint64_t sub_1CF521E6C()
{
  return MEMORY[0x1E0CAB290]();
}

uint64_t sub_1CF521E78()
{
  return MEMORY[0x1E0CAB2A0]();
}

uint64_t sub_1CF521E84()
{
  return MEMORY[0x1E0CAB2A8]();
}

uint64_t sub_1CF521E90()
{
  return MEMORY[0x1E0CAB2C0]();
}

uint64_t sub_1CF521E9C()
{
  return MEMORY[0x1E0CAB2C8]();
}

uint64_t sub_1CF521EA8()
{
  return MEMORY[0x1E0CAB2D0]();
}

uint64_t sub_1CF521EB4()
{
  return MEMORY[0x1E0CAB2D8]();
}

uint64_t sub_1CF521EC0()
{
  return MEMORY[0x1E0CAB2F0]();
}

uint64_t sub_1CF521ECC()
{
  return MEMORY[0x1E0CAB300]();
}

uint64_t sub_1CF521ED8()
{
  return MEMORY[0x1E0CAB308]();
}

uint64_t sub_1CF521EE4()
{
  return MEMORY[0x1E0CAB318]();
}

uint64_t sub_1CF521EF0()
{
  return MEMORY[0x1E0CAB330]();
}

uint64_t sub_1CF521EFC()
{
  return MEMORY[0x1E0CAB338]();
}

uint64_t sub_1CF521F08()
{
  return MEMORY[0x1E0CAB340]();
}

uint64_t sub_1CF521F14()
{
  return MEMORY[0x1E0CAB348]();
}

uint64_t sub_1CF521F20()
{
  return MEMORY[0x1E0CAB350]();
}

uint64_t sub_1CF521F2C()
{
  return MEMORY[0x1E0CAB358]();
}

uint64_t sub_1CF521F38()
{
  return MEMORY[0x1E0CAB360]();
}

uint64_t sub_1CF521F44()
{
  return MEMORY[0x1E0CAB370]();
}

uint64_t sub_1CF521F50()
{
  return MEMORY[0x1E0CAB378]();
}

uint64_t sub_1CF521F5C()
{
  return MEMORY[0x1E0CAB388]();
}

uint64_t sub_1CF521F68()
{
  return MEMORY[0x1E0CAB390]();
}

uint64_t sub_1CF521F74()
{
  return MEMORY[0x1E0CAB398]();
}

uint64_t sub_1CF521F80()
{
  return MEMORY[0x1E0CAB3A0]();
}

uint64_t sub_1CF521F8C()
{
  return MEMORY[0x1E0CAB3A8]();
}

uint64_t sub_1CF521F98()
{
  return MEMORY[0x1E0CAB3B0]();
}

uint64_t sub_1CF521FA4()
{
  return MEMORY[0x1E0CAB3C0]();
}

uint64_t sub_1CF521FB0()
{
  return MEMORY[0x1E0CAB3C8]();
}

uint64_t sub_1CF521FBC()
{
  return MEMORY[0x1E0CAB3D0]();
}

uint64_t sub_1CF521FC8()
{
  return MEMORY[0x1E0CAB3D8]();
}

uint64_t sub_1CF521FD4()
{
  return MEMORY[0x1E0CAB3E0]();
}

uint64_t sub_1CF521FE0()
{
  return MEMORY[0x1E0CAB3E8]();
}

uint64_t sub_1CF521FEC()
{
  return MEMORY[0x1E0CAB3F0]();
}

uint64_t sub_1CF521FF8()
{
  return MEMORY[0x1E0CAB3F8]();
}

uint64_t sub_1CF522004()
{
  return MEMORY[0x1E0CAB400]();
}

uint64_t sub_1CF522010()
{
  return MEMORY[0x1E0CAB408]();
}

uint64_t sub_1CF52201C()
{
  return MEMORY[0x1E0CAB410]();
}

uint64_t sub_1CF522028()
{
  return MEMORY[0x1E0CAB418]();
}

uint64_t sub_1CF522034()
{
  return MEMORY[0x1E0CAB420]();
}

uint64_t sub_1CF522040()
{
  return MEMORY[0x1E0CAB428]();
}

uint64_t sub_1CF52204C()
{
  return MEMORY[0x1E0CAB430]();
}

uint64_t sub_1CF522058()
{
  return MEMORY[0x1E0CAB438]();
}

uint64_t sub_1CF522064()
{
  return MEMORY[0x1E0CAB440]();
}

uint64_t sub_1CF522070()
{
  return MEMORY[0x1E0CAB448]();
}

uint64_t sub_1CF52207C()
{
  return MEMORY[0x1E0CAB450]();
}

uint64_t sub_1CF522088()
{
  return MEMORY[0x1E0CAB458]();
}

uint64_t sub_1CF522094()
{
  return MEMORY[0x1E0CAB460]();
}

uint64_t sub_1CF5220A0()
{
  return MEMORY[0x1E0CAB470]();
}

uint64_t sub_1CF5220AC()
{
  return MEMORY[0x1E0CAB478]();
}

uint64_t sub_1CF5220B8()
{
  return MEMORY[0x1E0CAB480]();
}

uint64_t sub_1CF5220C4()
{
  return MEMORY[0x1E0CAB488]();
}

uint64_t sub_1CF5220D0()
{
  return MEMORY[0x1E0CAB490]();
}

uint64_t sub_1CF5220DC()
{
  return MEMORY[0x1E0CAB498]();
}

uint64_t sub_1CF5220E8()
{
  return MEMORY[0x1E0CAB4C0]();
}

uint64_t sub_1CF5220F4()
{
  return MEMORY[0x1E0CAB4C8]();
}

uint64_t sub_1CF522100()
{
  return MEMORY[0x1E0CAB4D0]();
}

uint64_t sub_1CF52210C()
{
  return MEMORY[0x1E0CAB4D8]();
}

uint64_t sub_1CF522118()
{
  return MEMORY[0x1E0CAB4E0]();
}

uint64_t sub_1CF522124()
{
  return MEMORY[0x1E0CAB500]();
}

uint64_t sub_1CF522130()
{
  return MEMORY[0x1E0CAB508]();
}

uint64_t sub_1CF52213C()
{
  return MEMORY[0x1E0CAB518]();
}

uint64_t sub_1CF522148()
{
  return MEMORY[0x1E0CAB560]();
}

uint64_t sub_1CF522154()
{
  return MEMORY[0x1E0CAB5D8]();
}

uint64_t sub_1CF522160()
{
  return MEMORY[0x1E0CAB5E8]();
}

uint64_t sub_1CF52216C()
{
  return MEMORY[0x1E0CAB5F0]();
}

uint64_t sub_1CF522178()
{
  return MEMORY[0x1E0CAB600]();
}

uint64_t sub_1CF522184()
{
  return MEMORY[0x1E0CAB608]();
}

uint64_t sub_1CF522190()
{
  return MEMORY[0x1E0CAB610]();
}

uint64_t sub_1CF52219C()
{
  return MEMORY[0x1E0CAB620]();
}

uint64_t sub_1CF5221A8()
{
  return MEMORY[0x1E0CAB628]();
}

uint64_t sub_1CF5221B4()
{
  return MEMORY[0x1E0CAB630]();
}

uint64_t sub_1CF5221C0()
{
  return MEMORY[0x1E0CAB668]();
}

uint64_t sub_1CF5221CC()
{
  return MEMORY[0x1E0CAB678]();
}

uint64_t sub_1CF5221D8()
{
  return MEMORY[0x1E0CAB680]();
}

uint64_t sub_1CF5221E4()
{
  return MEMORY[0x1E0CAB688]();
}

uint64_t sub_1CF5221F0()
{
  return MEMORY[0x1E0CAB690]();
}

uint64_t sub_1CF5221FC()
{
  return MEMORY[0x1E0CAB698]();
}

uint64_t sub_1CF522208()
{
  return MEMORY[0x1E0CAB6A0]();
}

uint64_t sub_1CF522214()
{
  return MEMORY[0x1E0CAB6A8]();
}

uint64_t sub_1CF522220()
{
  return MEMORY[0x1E0CAB6B0]();
}

uint64_t sub_1CF52222C()
{
  return MEMORY[0x1E0CAB6B8]();
}

uint64_t sub_1CF522238()
{
  return MEMORY[0x1E0CAB6C0]();
}

uint64_t sub_1CF522244()
{
  return MEMORY[0x1E0CAB6C8]();
}

uint64_t sub_1CF522250()
{
  return MEMORY[0x1E0CAB6D0]();
}

uint64_t sub_1CF52225C()
{
  return MEMORY[0x1E0CAB6D8]();
}

uint64_t sub_1CF522268()
{
  return MEMORY[0x1E0CAB6E0]();
}

uint64_t sub_1CF522274()
{
  return MEMORY[0x1E0CAB6E8]();
}

uint64_t sub_1CF522280()
{
  return MEMORY[0x1E0CAB6F8]();
}

uint64_t sub_1CF52228C()
{
  return MEMORY[0x1E0CAB700]();
}

uint64_t sub_1CF522298()
{
  return MEMORY[0x1E0CAB708]();
}

uint64_t sub_1CF5222A4()
{
  return MEMORY[0x1E0CAB710]();
}

uint64_t sub_1CF5222B0()
{
  return MEMORY[0x1E0CAB718]();
}

uint64_t sub_1CF5222BC()
{
  return MEMORY[0x1E0CAB720]();
}

uint64_t sub_1CF5222C8()
{
  return MEMORY[0x1E0CAB728]();
}

uint64_t sub_1CF5222D4()
{
  return MEMORY[0x1E0CAB750]();
}

uint64_t sub_1CF5222E0()
{
  return MEMORY[0x1E0CAB758]();
}

uint64_t sub_1CF5222EC()
{
  return MEMORY[0x1E0CAB760]();
}

uint64_t sub_1CF5222F8()
{
  return MEMORY[0x1E0CAB780]();
}

uint64_t sub_1CF522304()
{
  return MEMORY[0x1E0CAB798]();
}

uint64_t sub_1CF522310()
{
  return MEMORY[0x1E0CAB7A0]();
}

uint64_t sub_1CF52231C()
{
  return MEMORY[0x1E0CAB7A8]();
}

uint64_t sub_1CF522328()
{
  return MEMORY[0x1E0CAB7B0]();
}

uint64_t sub_1CF522334()
{
  return MEMORY[0x1E0CAB7B8]();
}

uint64_t sub_1CF522340()
{
  return MEMORY[0x1E0CAB7C0]();
}

uint64_t sub_1CF52234C()
{
  return MEMORY[0x1E0CAB7C8]();
}

uint64_t sub_1CF522358()
{
  return MEMORY[0x1E0CAB7D8]();
}

uint64_t sub_1CF522364()
{
  return MEMORY[0x1E0CAB7E0]();
}

uint64_t sub_1CF522370()
{
  return MEMORY[0x1E0CAB7F0]();
}

uint64_t sub_1CF52237C()
{
  return MEMORY[0x1E0CAB7F8]();
}

uint64_t sub_1CF522388()
{
  return MEMORY[0x1E0CAB800]();
}

uint64_t sub_1CF522394()
{
  return MEMORY[0x1E0CAB808]();
}

uint64_t sub_1CF5223A0()
{
  return MEMORY[0x1E0CAB818]();
}

uint64_t sub_1CF5223AC()
{
  return MEMORY[0x1E0CAB820]();
}

uint64_t sub_1CF5223B8()
{
  return MEMORY[0x1E0CAB828]();
}

uint64_t sub_1CF5223C4()
{
  return MEMORY[0x1E0CAB830]();
}

uint64_t sub_1CF5223D0()
{
  return MEMORY[0x1E0CAB838]();
}

uint64_t sub_1CF5223DC()
{
  return MEMORY[0x1E0CAB840]();
}

uint64_t sub_1CF5223E8()
{
  return MEMORY[0x1E0CAB848]();
}

uint64_t sub_1CF5223F4()
{
  return MEMORY[0x1E0CAB860]();
}

uint64_t sub_1CF522400()
{
  return MEMORY[0x1E0CAB868]();
}

uint64_t sub_1CF52240C()
{
  return MEMORY[0x1E0CAB870]();
}

uint64_t sub_1CF522418()
{
  return MEMORY[0x1E0CAB878]();
}

uint64_t sub_1CF522424()
{
  return MEMORY[0x1E0CAB880]();
}

uint64_t sub_1CF522430()
{
  return MEMORY[0x1E0CAB888]();
}

uint64_t sub_1CF52243C()
{
  return MEMORY[0x1E0CAB890]();
}

uint64_t sub_1CF522448()
{
  return MEMORY[0x1E0CAB898]();
}

uint64_t sub_1CF522454()
{
  return MEMORY[0x1E0CAB8A0]();
}

uint64_t sub_1CF522460()
{
  return MEMORY[0x1E0CAB8A8]();
}

uint64_t sub_1CF52246C()
{
  return MEMORY[0x1E0CAB8B0]();
}

uint64_t sub_1CF522478()
{
  return MEMORY[0x1E0CAB8B8]();
}

uint64_t sub_1CF522484()
{
  return MEMORY[0x1E0CAB8C8]();
}

uint64_t sub_1CF522490()
{
  return MEMORY[0x1E0CAB8D0]();
}

uint64_t sub_1CF52249C()
{
  return MEMORY[0x1E0CAB8D8]();
}

uint64_t sub_1CF5224A8()
{
  return MEMORY[0x1E0CAB8E0]();
}

uint64_t sub_1CF5224B4()
{
  return MEMORY[0x1E0CAB8E8]();
}

uint64_t sub_1CF5224C0()
{
  return MEMORY[0x1E0CAB8F0]();
}

uint64_t sub_1CF5224CC()
{
  return MEMORY[0x1E0CAB900]();
}

uint64_t sub_1CF5224D8()
{
  return MEMORY[0x1E0CAB918]();
}

uint64_t sub_1CF5224E4()
{
  return MEMORY[0x1E0CAB920]();
}

uint64_t sub_1CF5224F0()
{
  return MEMORY[0x1E0CAB928]();
}

uint64_t sub_1CF5224FC()
{
  return MEMORY[0x1E0CAB930]();
}

uint64_t sub_1CF522508()
{
  return MEMORY[0x1E0CAB948]();
}

uint64_t sub_1CF522514()
{
  return MEMORY[0x1E0CAB958]();
}

uint64_t sub_1CF522520()
{
  return MEMORY[0x1E0CAB960]();
}

uint64_t sub_1CF52252C()
{
  return MEMORY[0x1E0CAB968]();
}

uint64_t sub_1CF522538()
{
  return MEMORY[0x1E0CAB970]();
}

uint64_t sub_1CF522544()
{
  return MEMORY[0x1E0CAB978]();
}

uint64_t sub_1CF522550()
{
  return MEMORY[0x1E0CAB980]();
}

uint64_t sub_1CF52255C()
{
  return MEMORY[0x1E0CAB988]();
}

uint64_t sub_1CF522568()
{
  return MEMORY[0x1E0CAB990]();
}

uint64_t sub_1CF522574()
{
  return MEMORY[0x1E0CAB998]();
}

uint64_t sub_1CF522580()
{
  return MEMORY[0x1E0CAB9A8]();
}

uint64_t sub_1CF52258C()
{
  return MEMORY[0x1E0CAB9B8]();
}

uint64_t sub_1CF522598()
{
  return MEMORY[0x1E0CAB9C0]();
}

uint64_t sub_1CF5225A4()
{
  return MEMORY[0x1E0CAB9C8]();
}

uint64_t sub_1CF5225B0()
{
  return MEMORY[0x1E0CAB9E8]();
}

uint64_t sub_1CF5225BC()
{
  return MEMORY[0x1E0CAB9F0]();
}

uint64_t sub_1CF5225C8()
{
  return MEMORY[0x1E0CAB9F8]();
}

uint64_t sub_1CF5225D4()
{
  return MEMORY[0x1E0CABA00]();
}

uint64_t sub_1CF5225E0()
{
  return MEMORY[0x1E0CABA10]();
}

uint64_t sub_1CF5225EC()
{
  return MEMORY[0x1E0CABA18]();
}

uint64_t sub_1CF5225F8()
{
  return MEMORY[0x1E0CABA20]();
}

uint64_t sub_1CF522604()
{
  return MEMORY[0x1E0CABA28]();
}

uint64_t sub_1CF522610()
{
  return MEMORY[0x1E0CABA30]();
}

uint64_t sub_1CF52261C()
{
  return MEMORY[0x1E0CABA38]();
}

uint64_t sub_1CF522628()
{
  return MEMORY[0x1E0CABA40]();
}

uint64_t sub_1CF522634()
{
  return MEMORY[0x1E0CABA48]();
}

uint64_t sub_1CF522640()
{
  return MEMORY[0x1E0CABA50]();
}

uint64_t sub_1CF52264C()
{
  return MEMORY[0x1E0CABA58]();
}

uint64_t sub_1CF522658()
{
  return MEMORY[0x1E0CABA70]();
}

uint64_t sub_1CF522664()
{
  return MEMORY[0x1E0CABA78]();
}

uint64_t sub_1CF522670()
{
  return MEMORY[0x1E0CABA88]();
}

uint64_t sub_1CF52267C()
{
  return MEMORY[0x1E0CABA98]();
}

uint64_t sub_1CF522688()
{
  return MEMORY[0x1E0CABAA8]();
}

uint64_t sub_1CF522694()
{
  return MEMORY[0x1E0CABAB8]();
}

uint64_t sub_1CF5226A0()
{
  return MEMORY[0x1E0CABAC0]();
}

uint64_t sub_1CF5226AC()
{
  return MEMORY[0x1E0CABAC8]();
}

uint64_t sub_1CF5226B8()
{
  return MEMORY[0x1E0CABAD0]();
}

uint64_t sub_1CF5226C4()
{
  return MEMORY[0x1E0CABAD8]();
}

uint64_t sub_1CF5226D0()
{
  return MEMORY[0x1E0CABAE0]();
}

uint64_t sub_1CF5226DC()
{
  return MEMORY[0x1E0CABAF8]();
}

uint64_t sub_1CF5226E8()
{
  return MEMORY[0x1E0CABB10]();
}

uint64_t sub_1CF5226F4()
{
  return MEMORY[0x1E0CABB20]();
}

uint64_t sub_1CF522700()
{
  return MEMORY[0x1E0CABB28]();
}

uint64_t sub_1CF52270C()
{
  return MEMORY[0x1E0CABB30]();
}

uint64_t sub_1CF522718()
{
  return MEMORY[0x1E0CABB38]();
}

uint64_t sub_1CF522724()
{
  return MEMORY[0x1E0CABB40]();
}

uint64_t sub_1CF522730()
{
  return MEMORY[0x1E0CABB48]();
}

uint64_t sub_1CF52273C()
{
  return MEMORY[0x1E0CABB58]();
}

uint64_t sub_1CF522748()
{
  return MEMORY[0x1E0CABB70]();
}

uint64_t sub_1CF522754()
{
  return MEMORY[0x1E0CABC88]();
}

uint64_t sub_1CF522760()
{
  return MEMORY[0x1E0CABCA8]();
}

uint64_t sub_1CF52276C()
{
  return MEMORY[0x1E0CABCB0]();
}

uint64_t sub_1CF522778()
{
  return MEMORY[0x1E0CABCB8]();
}

uint64_t sub_1CF522784()
{
  return MEMORY[0x1E0CABCC0]();
}

uint64_t sub_1CF522790()
{
  return MEMORY[0x1E0CABCC8]();
}

uint64_t sub_1CF52279C()
{
  return MEMORY[0x1E0CABCD0]();
}

uint64_t sub_1CF5227A8()
{
  return MEMORY[0x1E0CABCD8]();
}

uint64_t sub_1CF5227B4()
{
  return MEMORY[0x1E0CABCE0]();
}

uint64_t sub_1CF5227C0()
{
  return MEMORY[0x1E0CABCE8]();
}

uint64_t sub_1CF5227CC()
{
  return MEMORY[0x1E0CABCF0]();
}

uint64_t sub_1CF5227D8()
{
  return MEMORY[0x1E0CABCF8]();
}

uint64_t sub_1CF5227E4()
{
  return MEMORY[0x1E0CABD00]();
}

uint64_t sub_1CF5227F0()
{
  return MEMORY[0x1E0CABD18]();
}

uint64_t sub_1CF5227FC()
{
  return MEMORY[0x1E0CABD20]();
}

uint64_t sub_1CF522808()
{
  return MEMORY[0x1E0CABD28]();
}

uint64_t sub_1CF522814()
{
  return MEMORY[0x1E0CABD30]();
}

uint64_t sub_1CF522820()
{
  return MEMORY[0x1E0CABD38]();
}

uint64_t sub_1CF52282C()
{
  return MEMORY[0x1E0CABD40]();
}

uint64_t sub_1CF522838()
{
  return MEMORY[0x1E0CABD50]();
}

uint64_t sub_1CF522844()
{
  return MEMORY[0x1E0CABD58]();
}

uint64_t sub_1CF522850()
{
  return MEMORY[0x1E0CABD60]();
}

uint64_t sub_1CF52285C()
{
  return MEMORY[0x1E0CABD68]();
}

uint64_t sub_1CF522868()
{
  return MEMORY[0x1E0CABD78]();
}

uint64_t sub_1CF522874()
{
  return MEMORY[0x1E0CABD88]();
}

uint64_t sub_1CF522880()
{
  return MEMORY[0x1E0CABD90]();
}

uint64_t sub_1CF52288C()
{
  return MEMORY[0x1E0CABD98]();
}

uint64_t sub_1CF522898()
{
  return MEMORY[0x1E0CABDA8]();
}

uint64_t sub_1CF5228A4()
{
  return MEMORY[0x1E0CABDB0]();
}

uint64_t sub_1CF5228B0()
{
  return MEMORY[0x1E0CABDB8]();
}

uint64_t sub_1CF5228BC()
{
  return MEMORY[0x1E0CABDC8]();
}

uint64_t sub_1CF5228C8()
{
  return MEMORY[0x1E0CABDD0]();
}

uint64_t sub_1CF5228D4()
{
  return MEMORY[0x1E0CABDD8]();
}

uint64_t sub_1CF5228E0()
{
  return MEMORY[0x1E0CABDE0]();
}

uint64_t sub_1CF5228EC()
{
  return MEMORY[0x1E0CABDE8]();
}

uint64_t sub_1CF5228F8()
{
  return MEMORY[0x1E0CABE00]();
}

uint64_t sub_1CF522904()
{
  return MEMORY[0x1E0CABE08]();
}

uint64_t sub_1CF522910()
{
  return MEMORY[0x1E0CABE30]();
}

uint64_t sub_1CF52291C()
{
  return MEMORY[0x1E0CABE40]();
}

uint64_t sub_1CF522928()
{
  return MEMORY[0x1E0CABE48]();
}

uint64_t sub_1CF522934()
{
  return MEMORY[0x1E0CABE58]();
}

uint64_t sub_1CF522940()
{
  return MEMORY[0x1E0CABE60]();
}

uint64_t sub_1CF52294C()
{
  return MEMORY[0x1E0CABE68]();
}

uint64_t sub_1CF522958()
{
  return MEMORY[0x1E0CABE78]();
}

uint64_t sub_1CF522964()
{
  return MEMORY[0x1E0CABE80]();
}

uint64_t sub_1CF522970()
{
  return MEMORY[0x1E0CABE88]();
}

uint64_t sub_1CF52297C()
{
  return MEMORY[0x1E0CABE90]();
}

uint64_t sub_1CF522988()
{
  return MEMORY[0x1E0CABE98]();
}

uint64_t sub_1CF522994()
{
  return MEMORY[0x1E0CABEA0]();
}

uint64_t sub_1CF5229A0()
{
  return MEMORY[0x1E0CABEA8]();
}

uint64_t sub_1CF5229AC()
{
  return MEMORY[0x1E0CABEB0]();
}

uint64_t sub_1CF5229B8()
{
  return MEMORY[0x1E0CABEB8]();
}

uint64_t sub_1CF5229C4()
{
  return MEMORY[0x1E0CABEC0]();
}

uint64_t sub_1CF5229D0()
{
  return MEMORY[0x1E0CABED8]();
}

uint64_t sub_1CF5229DC()
{
  return MEMORY[0x1E0CABEE0]();
}

uint64_t sub_1CF5229E8()
{
  return MEMORY[0x1E0CABEF8]();
}

uint64_t sub_1CF5229F4()
{
  return MEMORY[0x1E0CABF10]();
}

uint64_t sub_1CF522A00()
{
  return MEMORY[0x1E0CABF20]();
}

uint64_t sub_1CF522A0C()
{
  return MEMORY[0x1E0CABF38]();
}

uint64_t sub_1CF522A18()
{
  return MEMORY[0x1E0CABF40]();
}

uint64_t sub_1CF522A24()
{
  return MEMORY[0x1E0CABF48]();
}

uint64_t sub_1CF522A30()
{
  return MEMORY[0x1E0CABF50]();
}

uint64_t sub_1CF522A3C()
{
  return MEMORY[0x1E0CABF60]();
}

uint64_t sub_1CF522A48()
{
  return MEMORY[0x1E0CABF68]();
}

uint64_t sub_1CF522A54()
{
  return MEMORY[0x1E0CABF70]();
}

uint64_t sub_1CF522A60()
{
  return MEMORY[0x1E0CABF98]();
}

uint64_t sub_1CF522A6C()
{
  return MEMORY[0x1E0CABFA0]();
}

uint64_t sub_1CF522A78()
{
  return MEMORY[0x1E0CABFA8]();
}

uint64_t sub_1CF522A84()
{
  return MEMORY[0x1E0CABFB0]();
}

uint64_t sub_1CF522A90()
{
  return MEMORY[0x1E0CABFB8]();
}

uint64_t sub_1CF522A9C()
{
  return MEMORY[0x1E0CABFC0]();
}

uint64_t sub_1CF522AA8()
{
  return MEMORY[0x1E0CABFC8]();
}

uint64_t sub_1CF522AB4()
{
  return MEMORY[0x1E0CABFD0]();
}

uint64_t sub_1CF522AC0()
{
  return MEMORY[0x1E0CABFD8]();
}

uint64_t sub_1CF522ACC()
{
  return MEMORY[0x1E0CABFE0]();
}

uint64_t sub_1CF522AD8()
{
  return MEMORY[0x1E0CABFE8]();
}

uint64_t sub_1CF522AE4()
{
  return MEMORY[0x1E0CABFF0]();
}

uint64_t sub_1CF522AF0()
{
  return MEMORY[0x1E0CABFF8]();
}

uint64_t sub_1CF522AFC()
{
  return MEMORY[0x1E0CAC000]();
}

uint64_t sub_1CF522B08()
{
  return MEMORY[0x1E0CAC008]();
}

uint64_t sub_1CF522B14()
{
  return MEMORY[0x1E0CAC010]();
}

uint64_t sub_1CF522B20()
{
  return MEMORY[0x1E0CAC018]();
}

uint64_t sub_1CF522B2C()
{
  return MEMORY[0x1E0CAC020]();
}

uint64_t sub_1CF522B38()
{
  return MEMORY[0x1E0CAC028]();
}

uint64_t sub_1CF522B44()
{
  return MEMORY[0x1E0CAC038]();
}

uint64_t sub_1CF522B50()
{
  return MEMORY[0x1E0CAC040]();
}

uint64_t sub_1CF522B5C()
{
  return MEMORY[0x1E0CAC048]();
}

uint64_t sub_1CF522B68()
{
  return MEMORY[0x1E0CAC050]();
}

uint64_t sub_1CF522B74()
{
  return MEMORY[0x1E0CAC058]();
}

uint64_t sub_1CF522B80()
{
  return MEMORY[0x1E0CAC060]();
}

uint64_t sub_1CF522B8C()
{
  return MEMORY[0x1E0CAC068]();
}

uint64_t sub_1CF522B98()
{
  return MEMORY[0x1E0CAC070]();
}

uint64_t sub_1CF522BA4()
{
  return MEMORY[0x1E0CAC078]();
}

uint64_t sub_1CF522BB0()
{
  return MEMORY[0x1E0CAC080]();
}

uint64_t sub_1CF522BBC()
{
  return MEMORY[0x1E0CAC088]();
}

uint64_t sub_1CF522BC8()
{
  return MEMORY[0x1E0CAC090]();
}

uint64_t sub_1CF522BD4()
{
  return MEMORY[0x1E0CAC098]();
}

uint64_t sub_1CF522BE0()
{
  return MEMORY[0x1E0CAC0A0]();
}

uint64_t sub_1CF522BEC()
{
  return MEMORY[0x1E0CAC0A8]();
}

uint64_t sub_1CF522BF8()
{
  return MEMORY[0x1E0CAC0B0]();
}

uint64_t sub_1CF522C04()
{
  return MEMORY[0x1E0CAC0B8]();
}

uint64_t sub_1CF522C10()
{
  return MEMORY[0x1E0CAC0C8]();
}

uint64_t sub_1CF522C1C()
{
  return MEMORY[0x1E0CAC0D8]();
}

uint64_t sub_1CF522C28()
{
  return MEMORY[0x1E0CAC0E8]();
}

uint64_t sub_1CF522C34()
{
  return MEMORY[0x1E0CAC0F0]();
}

uint64_t sub_1CF522C40()
{
  return MEMORY[0x1E0CAC108]();
}

uint64_t sub_1CF522C4C()
{
  return MEMORY[0x1E0CAC110]();
}

uint64_t sub_1CF522C58()
{
  return MEMORY[0x1E0CAC130]();
}

uint64_t sub_1CF522C64()
{
  return MEMORY[0x1E0CAC138]();
}

uint64_t sub_1CF522C70()
{
  return MEMORY[0x1E0CAC140]();
}

uint64_t sub_1CF522C7C()
{
  return MEMORY[0x1E0CAC150]();
}

uint64_t sub_1CF522C88()
{
  return MEMORY[0x1E0CAC160]();
}

uint64_t sub_1CF522C94()
{
  return MEMORY[0x1E0CAC168]();
}

uint64_t sub_1CF522CA0()
{
  return MEMORY[0x1E0CAC170]();
}

uint64_t sub_1CF522CAC()
{
  return MEMORY[0x1E0CAC178]();
}

uint64_t sub_1CF522CB8()
{
  return MEMORY[0x1E0CAC190]();
}

uint64_t sub_1CF522CC4()
{
  return MEMORY[0x1E0CAC198]();
}

uint64_t sub_1CF522CD0()
{
  return MEMORY[0x1E0CAC1A0]();
}

uint64_t sub_1CF522CDC()
{
  return MEMORY[0x1E0CAC1A8]();
}

uint64_t sub_1CF522CE8()
{
  return MEMORY[0x1E0CAC1B0]();
}

uint64_t sub_1CF522CF4()
{
  return MEMORY[0x1E0CAC1B8]();
}

uint64_t sub_1CF522D00()
{
  return MEMORY[0x1E0CAC1C0]();
}

uint64_t sub_1CF522D0C()
{
  return MEMORY[0x1E0CAC1D0]();
}

uint64_t sub_1CF522D18()
{
  return MEMORY[0x1E0CAC1E8]();
}

uint64_t sub_1CF522D24()
{
  return MEMORY[0x1E0CAC1F8]();
}

uint64_t sub_1CF522D30()
{
  return MEMORY[0x1E0CAC200]();
}

uint64_t sub_1CF522D3C()
{
  return MEMORY[0x1E0CAC208]();
}

uint64_t sub_1CF522D48()
{
  return MEMORY[0x1E0CAC210]();
}

uint64_t sub_1CF522D54()
{
  return MEMORY[0x1E0CAC218]();
}

uint64_t sub_1CF522D60()
{
  return MEMORY[0x1E0CAC228]();
}

uint64_t sub_1CF522D6C()
{
  return MEMORY[0x1E0CAC238]();
}

uint64_t sub_1CF522D78()
{
  return MEMORY[0x1E0CAC260]();
}

uint64_t sub_1CF522D84()
{
  return MEMORY[0x1E0CAC268]();
}

uint64_t sub_1CF522D90()
{
  return MEMORY[0x1E0CAC270]();
}

uint64_t sub_1CF522D9C()
{
  return MEMORY[0x1E0CAC278]();
}

uint64_t sub_1CF522DA8()
{
  return MEMORY[0x1E0CAC280]();
}

uint64_t sub_1CF522DB4()
{
  return MEMORY[0x1E0CAC288]();
}

uint64_t sub_1CF522DC0()
{
  return MEMORY[0x1E0CAC290]();
}

uint64_t sub_1CF522DCC()
{
  return MEMORY[0x1E0CAC2A0]();
}

uint64_t sub_1CF522DD8()
{
  return MEMORY[0x1E0CAC2B0]();
}

uint64_t sub_1CF522DE4()
{
  return MEMORY[0x1E0CAC2B8]();
}

uint64_t sub_1CF522DF0()
{
  return MEMORY[0x1E0CAC2E0]();
}

uint64_t sub_1CF522DFC()
{
  return MEMORY[0x1E0CAC2E8]();
}

uint64_t sub_1CF522E08()
{
  return MEMORY[0x1E0CAC2F8]();
}

uint64_t sub_1CF522E14()
{
  return MEMORY[0x1E0CAC300]();
}

uint64_t sub_1CF522E20()
{
  return MEMORY[0x1E0CAC310]();
}

uint64_t sub_1CF522E2C()
{
  return MEMORY[0x1E0CAC318]();
}

uint64_t sub_1CF522E38()
{
  return MEMORY[0x1E0CAC320]();
}

uint64_t sub_1CF522E44()
{
  return MEMORY[0x1E0CAC328]();
}

uint64_t sub_1CF522E50()
{
  return MEMORY[0x1E0CAC348]();
}

uint64_t sub_1CF522E5C()
{
  return MEMORY[0x1E0CAC358]();
}

uint64_t sub_1CF522E68()
{
  return MEMORY[0x1E0CAC368]();
}

uint64_t sub_1CF522E74()
{
  return MEMORY[0x1E0CAC370]();
}

uint64_t sub_1CF522E80()
{
  return MEMORY[0x1E0CAC378]();
}

uint64_t sub_1CF522E8C()
{
  return MEMORY[0x1E0CAC388]();
}

uint64_t sub_1CF522E98()
{
  return MEMORY[0x1E0CAC390]();
}

uint64_t sub_1CF522EA4()
{
  return MEMORY[0x1E0CAC398]();
}

uint64_t sub_1CF522EB0()
{
  return MEMORY[0x1E0CAC3A8]();
}

uint64_t sub_1CF522EBC()
{
  return MEMORY[0x1E0CAC3B8]();
}

uint64_t sub_1CF522EC8()
{
  return MEMORY[0x1E0CAC3C8]();
}

uint64_t sub_1CF522ED4()
{
  return MEMORY[0x1E0CAC3D0]();
}

uint64_t sub_1CF522EE0()
{
  return MEMORY[0x1E0CAC3D8]();
}

uint64_t sub_1CF522EEC()
{
  return MEMORY[0x1E0CAC3E0]();
}

uint64_t sub_1CF522EF8()
{
  return MEMORY[0x1E0CAC3E8]();
}

uint64_t sub_1CF522F04()
{
  return MEMORY[0x1E0CAC3F0]();
}

uint64_t sub_1CF522F10()
{
  return MEMORY[0x1E0CAC3F8]();
}

uint64_t sub_1CF522F1C()
{
  return MEMORY[0x1E0CAC408]();
}

uint64_t sub_1CF522F28()
{
  return MEMORY[0x1E0CAC410]();
}

uint64_t sub_1CF522F34()
{
  return MEMORY[0x1E0CAC418]();
}

uint64_t sub_1CF522F40()
{
  return MEMORY[0x1E0CAC420]();
}

uint64_t sub_1CF522F4C()
{
  return MEMORY[0x1E0CAC428]();
}

uint64_t sub_1CF522F58()
{
  return MEMORY[0x1E0CAC430]();
}

uint64_t sub_1CF522F64()
{
  return MEMORY[0x1E0CAC438]();
}

uint64_t sub_1CF522F70()
{
  return MEMORY[0x1E0CAC448]();
}

uint64_t sub_1CF522F7C()
{
  return MEMORY[0x1E0CAC450]();
}

uint64_t sub_1CF522F88()
{
  return MEMORY[0x1E0CAC460]();
}

uint64_t sub_1CF522F94()
{
  return MEMORY[0x1E0CAC468]();
}

uint64_t sub_1CF522FA0()
{
  return MEMORY[0x1E0CAC470]();
}

uint64_t sub_1CF522FAC()
{
  return MEMORY[0x1E0CAC478]();
}

uint64_t sub_1CF522FB8()
{
  return MEMORY[0x1E0CAC480]();
}

uint64_t sub_1CF522FC4()
{
  return MEMORY[0x1E0CAC488]();
}

uint64_t sub_1CF522FD0()
{
  return MEMORY[0x1E0CAC490]();
}

uint64_t sub_1CF522FDC()
{
  return MEMORY[0x1E0CAC498]();
}

uint64_t sub_1CF522FE8()
{
  return MEMORY[0x1E0CAC4A0]();
}

uint64_t sub_1CF522FF4()
{
  return MEMORY[0x1E0CAC4D0]();
}

uint64_t sub_1CF523000()
{
  return MEMORY[0x1E0CAC4E0]();
}

uint64_t sub_1CF52300C()
{
  return MEMORY[0x1E0CAC4F8]();
}

uint64_t sub_1CF523018()
{
  return MEMORY[0x1E0CAC500]();
}

uint64_t sub_1CF523024()
{
  return MEMORY[0x1E0CAC508]();
}

uint64_t sub_1CF523030()
{
  return MEMORY[0x1E0CAC510]();
}

uint64_t sub_1CF52303C()
{
  return MEMORY[0x1E0CAC528]();
}

uint64_t sub_1CF523048()
{
  return MEMORY[0x1E0CAC530]();
}

uint64_t sub_1CF523054()
{
  return MEMORY[0x1E0CAC548]();
}

uint64_t sub_1CF523060()
{
  return MEMORY[0x1E0CAC558]();
}

uint64_t sub_1CF52306C()
{
  return MEMORY[0x1E0CAC560]();
}

uint64_t sub_1CF523078()
{
  return MEMORY[0x1E0CAC580]();
}

uint64_t sub_1CF523084()
{
  return MEMORY[0x1E0CAC588]();
}

uint64_t sub_1CF523090()
{
  return MEMORY[0x1E0CAC590]();
}

uint64_t sub_1CF52309C()
{
  return MEMORY[0x1E0CAC598]();
}

uint64_t sub_1CF5230A8()
{
  return MEMORY[0x1E0CAC5A0]();
}

uint64_t sub_1CF5230B4()
{
  return MEMORY[0x1E0CAC5A8]();
}

uint64_t sub_1CF5230C0()
{
  return MEMORY[0x1E0CAC5B8]();
}

uint64_t sub_1CF5230CC()
{
  return MEMORY[0x1E0CAC5C8]();
}

uint64_t sub_1CF5230D8()
{
  return MEMORY[0x1E0CAC5D0]();
}

uint64_t sub_1CF5230E4()
{
  return MEMORY[0x1E0CAC5D8]();
}

uint64_t sub_1CF5230F0()
{
  return MEMORY[0x1E0CAC5E8]();
}

uint64_t sub_1CF5230FC()
{
  return MEMORY[0x1E0CAC5F0]();
}

uint64_t sub_1CF523108()
{
  return MEMORY[0x1E0CAC5F8]();
}

uint64_t sub_1CF523114()
{
  return MEMORY[0x1E0CAC600]();
}

uint64_t sub_1CF523120()
{
  return MEMORY[0x1E0CAC608]();
}

uint64_t sub_1CF52312C()
{
  return MEMORY[0x1E0CAC618]();
}

uint64_t sub_1CF523138()
{
  return MEMORY[0x1E0CAC628]();
}

uint64_t sub_1CF523144()
{
  return MEMORY[0x1E0CAC630]();
}

uint64_t sub_1CF523150()
{
  return MEMORY[0x1E0CAC638]();
}

uint64_t sub_1CF52315C()
{
  return MEMORY[0x1E0CAC640]();
}

uint64_t sub_1CF523168()
{
  return MEMORY[0x1E0CAC650]();
}

uint64_t sub_1CF523174()
{
  return MEMORY[0x1E0CAC658]();
}

uint64_t sub_1CF523180()
{
  return MEMORY[0x1E0CAC660]();
}

uint64_t sub_1CF52318C()
{
  return MEMORY[0x1E0CAC668]();
}

uint64_t sub_1CF523198()
{
  return MEMORY[0x1E0CAC670]();
}

uint64_t sub_1CF5231A4()
{
  return MEMORY[0x1E0CAC678]();
}

uint64_t sub_1CF5231B0()
{
  return MEMORY[0x1E0CAC680]();
}

uint64_t sub_1CF5231BC()
{
  return MEMORY[0x1E0CAC688]();
}

uint64_t sub_1CF5231C8()
{
  return MEMORY[0x1E0CAC690]();
}

uint64_t sub_1CF5231D4()
{
  return MEMORY[0x1E0CAC698]();
}

uint64_t sub_1CF5231E0()
{
  return MEMORY[0x1E0CAC6A0]();
}

uint64_t sub_1CF5231EC()
{
  return MEMORY[0x1E0CAC6A8]();
}

uint64_t sub_1CF5231F8()
{
  return MEMORY[0x1E0CAC6B0]();
}

uint64_t sub_1CF523204()
{
  return MEMORY[0x1E0CAC6B8]();
}

uint64_t sub_1CF523210()
{
  return MEMORY[0x1E0CAC6C0]();
}

uint64_t sub_1CF52321C()
{
  return MEMORY[0x1E0CAC6C8]();
}

uint64_t sub_1CF523228()
{
  return MEMORY[0x1E0CAC6D8]();
}

uint64_t sub_1CF523234()
{
  return MEMORY[0x1E0CAC6E0]();
}

uint64_t sub_1CF523240()
{
  return MEMORY[0x1E0CAC6E8]();
}

uint64_t sub_1CF52324C()
{
  return MEMORY[0x1E0CAC6F0]();
}

uint64_t sub_1CF523258()
{
  return MEMORY[0x1E0CAC6F8]();
}

uint64_t sub_1CF523264()
{
  return MEMORY[0x1E0CAC700]();
}

uint64_t sub_1CF523270()
{
  return MEMORY[0x1E0CAC708]();
}

uint64_t sub_1CF52327C()
{
  return MEMORY[0x1E0CAC718]();
}

uint64_t sub_1CF523288()
{
  return MEMORY[0x1E0CAC720]();
}

uint64_t sub_1CF523294()
{
  return MEMORY[0x1E0CAC730]();
}

uint64_t sub_1CF5232A0()
{
  return MEMORY[0x1E0CAC748]();
}

uint64_t sub_1CF5232AC()
{
  return MEMORY[0x1E0CAC750]();
}

uint64_t sub_1CF5232B8()
{
  return MEMORY[0x1E0CAC758]();
}

uint64_t sub_1CF5232C4()
{
  return MEMORY[0x1E0CAC760]();
}

uint64_t sub_1CF5232D0()
{
  return MEMORY[0x1E0CAC768]();
}

uint64_t sub_1CF5232DC()
{
  return MEMORY[0x1E0CAC770]();
}

uint64_t sub_1CF5232E8()
{
  return MEMORY[0x1E0CAC778]();
}

uint64_t sub_1CF5232F4()
{
  return MEMORY[0x1E0CAC780]();
}

uint64_t sub_1CF523300()
{
  return MEMORY[0x1E0CAC788]();
}

uint64_t sub_1CF52330C()
{
  return MEMORY[0x1E0CAC798]();
}

uint64_t sub_1CF523318()
{
  return MEMORY[0x1E0CAC7A0]();
}

uint64_t sub_1CF523324()
{
  return MEMORY[0x1E0CAC7B0]();
}

uint64_t sub_1CF523330()
{
  return MEMORY[0x1E0CAC7D8]();
}

uint64_t sub_1CF52333C()
{
  return MEMORY[0x1E0CAC7E8]();
}

uint64_t sub_1CF523348()
{
  return MEMORY[0x1E0CAC7F0]();
}

uint64_t sub_1CF523354()
{
  return MEMORY[0x1E0CAC7F8]();
}

uint64_t sub_1CF523360()
{
  return MEMORY[0x1E0CAC800]();
}

uint64_t sub_1CF52336C()
{
  return MEMORY[0x1E0CAC808]();
}

uint64_t sub_1CF523378()
{
  return MEMORY[0x1E0CAC810]();
}

uint64_t sub_1CF523384()
{
  return MEMORY[0x1E0CAC820]();
}

uint64_t sub_1CF523390()
{
  return MEMORY[0x1E0CAC838]();
}

uint64_t sub_1CF52339C()
{
  return MEMORY[0x1E0CAC840]();
}

uint64_t sub_1CF5233A8()
{
  return MEMORY[0x1E0CAC870]();
}

uint64_t sub_1CF5233B4()
{
  return MEMORY[0x1E0CAC878]();
}

uint64_t sub_1CF5233C0()
{
  return MEMORY[0x1E0CAC890]();
}

uint64_t sub_1CF5233CC()
{
  return MEMORY[0x1E0CAC8B0]();
}

uint64_t sub_1CF5233D8()
{
  return MEMORY[0x1E0CAC8B8]();
}

uint64_t sub_1CF5233E4()
{
  return MEMORY[0x1E0CAC8C8]();
}

uint64_t sub_1CF5233F0()
{
  return MEMORY[0x1E0CAC8D8]();
}

uint64_t sub_1CF5233FC()
{
  return MEMORY[0x1E0CAC8E0]();
}

uint64_t sub_1CF523408()
{
  return MEMORY[0x1E0CAC8E8]();
}

uint64_t sub_1CF523414()
{
  return MEMORY[0x1E0CAC8F0]();
}

uint64_t sub_1CF523420()
{
  return MEMORY[0x1E0CAC8F8]();
}

uint64_t sub_1CF52342C()
{
  return MEMORY[0x1E0CAC900]();
}

uint64_t sub_1CF523438()
{
  return MEMORY[0x1E0CAC908]();
}

uint64_t sub_1CF523444()
{
  return MEMORY[0x1E0CAC910]();
}

uint64_t sub_1CF523450()
{
  return MEMORY[0x1E0CAC918]();
}

uint64_t sub_1CF52345C()
{
  return MEMORY[0x1E0CAC920]();
}

uint64_t sub_1CF523468()
{
  return MEMORY[0x1E0CAC928]();
}

uint64_t sub_1CF523474()
{
  return MEMORY[0x1E0CAC930]();
}

uint64_t sub_1CF523480()
{
  return MEMORY[0x1E0CAC938]();
}

uint64_t sub_1CF52348C()
{
  return MEMORY[0x1E0CAC940]();
}

uint64_t sub_1CF523498()
{
  return MEMORY[0x1E0CAC948]();
}

uint64_t sub_1CF5234A4()
{
  return MEMORY[0x1E0CAC950]();
}

uint64_t sub_1CF5234B0()
{
  return MEMORY[0x1E0CAC958]();
}

uint64_t sub_1CF5234BC()
{
  return MEMORY[0x1E0CAC960]();
}

uint64_t sub_1CF5234C8()
{
  return MEMORY[0x1E0CAC968]();
}

uint64_t sub_1CF5234D4()
{
  return MEMORY[0x1E0CAC970]();
}

uint64_t sub_1CF5234E0()
{
  return MEMORY[0x1E0CAC978]();
}

uint64_t sub_1CF5234EC()
{
  return MEMORY[0x1E0CAC980]();
}

uint64_t sub_1CF5234F8()
{
  return MEMORY[0x1E0CAC988]();
}

uint64_t sub_1CF523504()
{
  return MEMORY[0x1E0CAC990]();
}

uint64_t sub_1CF523510()
{
  return MEMORY[0x1E0CAC998]();
}

uint64_t sub_1CF52351C()
{
  return MEMORY[0x1E0CAC9A0]();
}

uint64_t sub_1CF523528()
{
  return MEMORY[0x1E0CAC9B8]();
}

uint64_t sub_1CF523534()
{
  return MEMORY[0x1E0CAC9C0]();
}

uint64_t sub_1CF523540()
{
  return MEMORY[0x1E0CAC9D8]();
}

uint64_t sub_1CF52354C()
{
  return MEMORY[0x1E0CAC9E0]();
}

uint64_t sub_1CF523558()
{
  return MEMORY[0x1E0CACA00]();
}

uint64_t sub_1CF523564()
{
  return MEMORY[0x1E0CACA10]();
}

uint64_t sub_1CF523570()
{
  return MEMORY[0x1E0CACA38]();
}

uint64_t sub_1CF52357C()
{
  return MEMORY[0x1E0CACA48]();
}

uint64_t sub_1CF523588()
{
  return MEMORY[0x1E0CACA58]();
}

uint64_t sub_1CF523594()
{
  return MEMORY[0x1E0CACA60]();
}

uint64_t sub_1CF5235A0()
{
  return MEMORY[0x1E0CACA68]();
}

uint64_t sub_1CF5235AC()
{
  return MEMORY[0x1E0CACA78]();
}

uint64_t sub_1CF5235B8()
{
  return MEMORY[0x1E0CACA88]();
}

uint64_t sub_1CF5235C4()
{
  return MEMORY[0x1E0CACA90]();
}

uint64_t sub_1CF5235D0()
{
  return MEMORY[0x1E0CACA98]();
}

uint64_t sub_1CF5235DC()
{
  return MEMORY[0x1E0CACAA0]();
}

uint64_t sub_1CF5235E8()
{
  return MEMORY[0x1E0CACAA8]();
}

uint64_t sub_1CF5235F4()
{
  return MEMORY[0x1E0CACAB0]();
}

uint64_t sub_1CF523600()
{
  return MEMORY[0x1E0CACAB8]();
}

uint64_t sub_1CF52360C()
{
  return MEMORY[0x1E0CACAC0]();
}

uint64_t sub_1CF523618()
{
  return MEMORY[0x1E0CACAC8]();
}

uint64_t sub_1CF523624()
{
  return MEMORY[0x1E0CACAD0]();
}

uint64_t sub_1CF523630()
{
  return MEMORY[0x1E0CACAD8]();
}

uint64_t sub_1CF52363C()
{
  return MEMORY[0x1E0CACAE8]();
}

uint64_t sub_1CF523648()
{
  return MEMORY[0x1E0CACAF0]();
}

uint64_t sub_1CF523654()
{
  return MEMORY[0x1E0CACAF8]();
}

uint64_t sub_1CF523660()
{
  return MEMORY[0x1E0CACB00]();
}

uint64_t sub_1CF52366C()
{
  return MEMORY[0x1E0CACB08]();
}

uint64_t sub_1CF523678()
{
  return MEMORY[0x1E0CACB10]();
}

uint64_t sub_1CF523684()
{
  return MEMORY[0x1E0CACB18]();
}

uint64_t sub_1CF523690()
{
  return MEMORY[0x1E0CACB20]();
}

uint64_t sub_1CF52369C()
{
  return MEMORY[0x1E0CACB28]();
}

uint64_t sub_1CF5236A8()
{
  return MEMORY[0x1E0CACB30]();
}

uint64_t sub_1CF5236B4()
{
  return MEMORY[0x1E0CACB38]();
}

uint64_t sub_1CF5236C0()
{
  return MEMORY[0x1E0CACB40]();
}

uint64_t sub_1CF5236CC()
{
  return MEMORY[0x1E0CACB48]();
}

uint64_t sub_1CF5236D8()
{
  return MEMORY[0x1E0CACB50]();
}

uint64_t sub_1CF5236E4()
{
  return MEMORY[0x1E0CACB60]();
}

uint64_t sub_1CF5236F0()
{
  return MEMORY[0x1E0CACB70]();
}

uint64_t sub_1CF5236FC()
{
  return MEMORY[0x1E0CACB80]();
}

uint64_t sub_1CF523708()
{
  return MEMORY[0x1E0CACBA0]();
}

uint64_t sub_1CF523714()
{
  return MEMORY[0x1E0CACBB0]();
}

uint64_t sub_1CF523720()
{
  return MEMORY[0x1E0CACBC0]();
}

uint64_t sub_1CF52372C()
{
  return MEMORY[0x1E0CACBC8]();
}

uint64_t sub_1CF523738()
{
  return MEMORY[0x1E0CACBD0]();
}

uint64_t sub_1CF523744()
{
  return MEMORY[0x1E0CACBD8]();
}

uint64_t sub_1CF523750()
{
  return MEMORY[0x1E0CACBE8]();
}

uint64_t sub_1CF52375C()
{
  return MEMORY[0x1E0CACBF0]();
}

uint64_t sub_1CF523768()
{
  return MEMORY[0x1E0CACBF8]();
}

uint64_t sub_1CF523774()
{
  return MEMORY[0x1E0CACC00]();
}

uint64_t sub_1CF523780()
{
  return MEMORY[0x1E0CACC08]();
}

uint64_t sub_1CF52378C()
{
  return MEMORY[0x1E0CACC10]();
}

uint64_t sub_1CF523798()
{
  return MEMORY[0x1E0CACC18]();
}

uint64_t sub_1CF5237A4()
{
  return MEMORY[0x1E0CACC20]();
}

uint64_t sub_1CF5237B0()
{
  return MEMORY[0x1E0CACC28]();
}

uint64_t sub_1CF5237BC()
{
  return MEMORY[0x1E0CACC30]();
}

uint64_t sub_1CF5237C8()
{
  return MEMORY[0x1E0CACC38]();
}

uint64_t sub_1CF5237D4()
{
  return MEMORY[0x1E0CACC40]();
}

uint64_t sub_1CF5237E0()
{
  return MEMORY[0x1E0CACC48]();
}

uint64_t sub_1CF5237EC()
{
  return MEMORY[0x1E0CACC50]();
}

uint64_t sub_1CF5237F8()
{
  return MEMORY[0x1E0CACC58]();
}

uint64_t sub_1CF523804()
{
  return MEMORY[0x1E0CACC60]();
}

uint64_t sub_1CF523810()
{
  return MEMORY[0x1E0CACC68]();
}

uint64_t sub_1CF52381C()
{
  return MEMORY[0x1E0CACC70]();
}

uint64_t sub_1CF523828()
{
  return MEMORY[0x1E0CACC78]();
}

uint64_t sub_1CF523834()
{
  return MEMORY[0x1E0CACC80]();
}

uint64_t sub_1CF523840()
{
  return MEMORY[0x1E0CACC88]();
}

uint64_t sub_1CF52384C()
{
  return MEMORY[0x1E0CACC90]();
}

uint64_t sub_1CF523858()
{
  return MEMORY[0x1E0CACCD0]();
}

uint64_t sub_1CF523864()
{
  return MEMORY[0x1E0CACCE8]();
}

uint64_t sub_1CF523870()
{
  return MEMORY[0x1E0CACCF0]();
}

uint64_t sub_1CF52387C()
{
  return MEMORY[0x1E0CACD08]();
}

uint64_t sub_1CF523888()
{
  return MEMORY[0x1E0CACD10]();
}

uint64_t sub_1CF523894()
{
  return MEMORY[0x1E0CACD20]();
}

uint64_t sub_1CF5238A0()
{
  return MEMORY[0x1E0CACD58]();
}

uint64_t sub_1CF5238AC()
{
  return MEMORY[0x1E0CACD60]();
}

uint64_t sub_1CF5238B8()
{
  return MEMORY[0x1E0CACD68]();
}

uint64_t sub_1CF5238C4()
{
  return MEMORY[0x1E0CACD78]();
}

uint64_t sub_1CF5238D0()
{
  return MEMORY[0x1E0CACD80]();
}

uint64_t sub_1CF5238DC()
{
  return MEMORY[0x1E0CACD90]();
}

uint64_t sub_1CF5238E8()
{
  return MEMORY[0x1E0CACDA0]();
}

uint64_t sub_1CF5238F4()
{
  return MEMORY[0x1E0CACDB0]();
}

uint64_t sub_1CF523900()
{
  return MEMORY[0x1E0CACDC0]();
}

uint64_t sub_1CF52390C()
{
  return MEMORY[0x1E0CACDD0]();
}

uint64_t sub_1CF523918()
{
  return MEMORY[0x1E0CACDE0]();
}

uint64_t sub_1CF523924()
{
  return MEMORY[0x1E0CACDF0]();
}

uint64_t sub_1CF523930()
{
  return MEMORY[0x1E0CACE00]();
}

uint64_t sub_1CF52393C()
{
  return MEMORY[0x1E0CACE10]();
}

uint64_t sub_1CF523948()
{
  return MEMORY[0x1E0CACE20]();
}

uint64_t sub_1CF523954()
{
  return MEMORY[0x1E0CACE28]();
}

uint64_t sub_1CF523960()
{
  return MEMORY[0x1E0CACE30]();
}

uint64_t sub_1CF52396C()
{
  return MEMORY[0x1E0CACE40]();
}

uint64_t sub_1CF523978()
{
  return MEMORY[0x1E0CACE48]();
}

uint64_t sub_1CF523984()
{
  return MEMORY[0x1E0CACE50]();
}

uint64_t sub_1CF523990()
{
  return MEMORY[0x1E0CACE58]();
}

uint64_t sub_1CF52399C()
{
  return MEMORY[0x1E0CACE60]();
}

uint64_t sub_1CF5239A8()
{
  return MEMORY[0x1E0CACE68]();
}

uint64_t sub_1CF5239B4()
{
  return MEMORY[0x1E0CACE70]();
}

uint64_t sub_1CF5239C0()
{
  return MEMORY[0x1E0CACE78]();
}

uint64_t sub_1CF5239CC()
{
  return MEMORY[0x1E0CACE80]();
}

uint64_t sub_1CF5239D8()
{
  return MEMORY[0x1E0CACE88]();
}

uint64_t sub_1CF5239E4()
{
  return MEMORY[0x1E0CACE90]();
}

uint64_t sub_1CF5239F0()
{
  return MEMORY[0x1E0CACE98]();
}

uint64_t sub_1CF5239FC()
{
  return MEMORY[0x1E0CACEA0]();
}

uint64_t sub_1CF523A08()
{
  return MEMORY[0x1E0CACEA8]();
}

uint64_t sub_1CF523A14()
{
  return MEMORY[0x1E0CACEB0]();
}

uint64_t sub_1CF523A20()
{
  return MEMORY[0x1E0CACEC0]();
}

uint64_t sub_1CF523A2C()
{
  return MEMORY[0x1E0CACEC8]();
}

uint64_t sub_1CF523A38()
{
  return MEMORY[0x1E0CACED8]();
}

uint64_t sub_1CF523A44()
{
  return MEMORY[0x1E0CACEE0]();
}

uint64_t sub_1CF523A50()
{
  return MEMORY[0x1E0CACEE8]();
}

uint64_t sub_1CF523A5C()
{
  return MEMORY[0x1E0CACEF8]();
}

uint64_t sub_1CF523A68()
{
  return MEMORY[0x1E0CACF00]();
}

uint64_t sub_1CF523A74()
{
  return MEMORY[0x1E0CACF08]();
}

uint64_t sub_1CF523A80()
{
  return MEMORY[0x1E0CACF10]();
}

uint64_t sub_1CF523A8C()
{
  return MEMORY[0x1E0CACF18]();
}

uint64_t sub_1CF523A98()
{
  return MEMORY[0x1E0CACF20]();
}

uint64_t sub_1CF523AA4()
{
  return MEMORY[0x1E0CACF28]();
}

uint64_t sub_1CF523AB0()
{
  return MEMORY[0x1E0CACF30]();
}

uint64_t sub_1CF523ABC()
{
  return MEMORY[0x1E0CACF38]();
}

uint64_t sub_1CF523AC8()
{
  return MEMORY[0x1E0CACF40]();
}

uint64_t sub_1CF523AD4()
{
  return MEMORY[0x1E0CACF48]();
}

uint64_t sub_1CF523AE0()
{
  return MEMORY[0x1E0CACF58]();
}

uint64_t sub_1CF523AEC()
{
  return MEMORY[0x1E0CACF68]();
}

uint64_t sub_1CF523AF8()
{
  return MEMORY[0x1E0CACF70]();
}

uint64_t sub_1CF523B04()
{
  return MEMORY[0x1E0CACF80]();
}

uint64_t sub_1CF523B10()
{
  return MEMORY[0x1E0CACF90]();
}

uint64_t sub_1CF523B1C()
{
  return MEMORY[0x1E0CACF98]();
}

uint64_t sub_1CF523B28()
{
  return MEMORY[0x1E0CACFA0]();
}

uint64_t sub_1CF523B34()
{
  return MEMORY[0x1E0CACFA8]();
}

uint64_t sub_1CF523B40()
{
  return MEMORY[0x1E0CACFB0]();
}

uint64_t sub_1CF523B4C()
{
  return MEMORY[0x1E0CACFB8]();
}

uint64_t sub_1CF523B58()
{
  return MEMORY[0x1E0CACFC0]();
}

uint64_t sub_1CF523B64()
{
  return MEMORY[0x1E0CACFC8]();
}

uint64_t sub_1CF523B70()
{
  return MEMORY[0x1E0CACFF0]();
}

uint64_t sub_1CF523B7C()
{
  return MEMORY[0x1E0CAD018]();
}

uint64_t sub_1CF523B88()
{
  return MEMORY[0x1E0CAD040]();
}

uint64_t sub_1CF523B94()
{
  return MEMORY[0x1E0CAD048]();
}

uint64_t sub_1CF523BA0()
{
  return MEMORY[0x1E0CAD060]();
}

uint64_t sub_1CF523BAC()
{
  return MEMORY[0x1E0CAD068]();
}

uint64_t sub_1CF523BB8()
{
  return MEMORY[0x1E0CAD070]();
}

uint64_t sub_1CF523BC4()
{
  return MEMORY[0x1E0CAD078]();
}

uint64_t sub_1CF523BD0()
{
  return MEMORY[0x1E0CAD0A0]();
}

uint64_t sub_1CF523BDC()
{
  return MEMORY[0x1E0CAD0A8]();
}

uint64_t sub_1CF523BE8()
{
  return MEMORY[0x1E0CAD0B8]();
}

uint64_t sub_1CF523BF4()
{
  return MEMORY[0x1E0CAD0D0]();
}

uint64_t sub_1CF523C00()
{
  return MEMORY[0x1E0CAD0F8]();
}

uint64_t sub_1CF523C0C()
{
  return MEMORY[0x1E0CAD110]();
}

uint64_t sub_1CF523C18()
{
  return MEMORY[0x1E0CAD118]();
}

uint64_t sub_1CF523C24()
{
  return MEMORY[0x1E0CAD128]();
}

uint64_t sub_1CF523C30()
{
  return MEMORY[0x1E0CAD130]();
}

uint64_t sub_1CF523C3C()
{
  return MEMORY[0x1E0CAD138]();
}

uint64_t sub_1CF523C48()
{
  return MEMORY[0x1E0CAD140]();
}

uint64_t sub_1CF523C54()
{
  return MEMORY[0x1E0CAD148]();
}

uint64_t sub_1CF523C60()
{
  return MEMORY[0x1E0CAD168]();
}

uint64_t sub_1CF523C6C()
{
  return MEMORY[0x1E0CAD170]();
}

uint64_t sub_1CF523C78()
{
  return MEMORY[0x1E0CAD178]();
}

uint64_t sub_1CF523C84()
{
  return MEMORY[0x1E0CAD180]();
}

uint64_t sub_1CF523C90()
{
  return MEMORY[0x1E0CAD188]();
}

uint64_t sub_1CF523C9C()
{
  return MEMORY[0x1E0CAD190]();
}

uint64_t sub_1CF523CA8()
{
  return MEMORY[0x1E0CAD198]();
}

uint64_t sub_1CF523CB4()
{
  return MEMORY[0x1E0CAD1A0]();
}

uint64_t sub_1CF523CC0()
{
  return MEMORY[0x1E0CAD1B0]();
}

uint64_t sub_1CF523CCC()
{
  return MEMORY[0x1E0CAD1C0]();
}

uint64_t sub_1CF523CD8()
{
  return MEMORY[0x1E0CAD1C8]();
}

uint64_t sub_1CF523CE4()
{
  return MEMORY[0x1E0CAD1E8]();
}

uint64_t sub_1CF523CF0()
{
  return MEMORY[0x1E0CAD1F8]();
}

uint64_t sub_1CF523CFC()
{
  return MEMORY[0x1E0CAD208]();
}

uint64_t sub_1CF523D08()
{
  return MEMORY[0x1E0CAD210]();
}

uint64_t sub_1CF523D14()
{
  return MEMORY[0x1E0CAD218]();
}

uint64_t sub_1CF523D20()
{
  return MEMORY[0x1E0CAD240]();
}

uint64_t sub_1CF523D2C()
{
  return MEMORY[0x1E0CAD248]();
}

uint64_t sub_1CF523D38()
{
  return MEMORY[0x1E0CAD250]();
}

uint64_t sub_1CF523D44()
{
  return MEMORY[0x1E0CAD258]();
}

uint64_t sub_1CF523D50()
{
  return MEMORY[0x1E0CAD268]();
}

uint64_t sub_1CF523D5C()
{
  return MEMORY[0x1E0CAD270]();
}

uint64_t sub_1CF523D68()
{
  return MEMORY[0x1E0CAD278]();
}

uint64_t sub_1CF523D74()
{
  return MEMORY[0x1E0CAD288]();
}

uint64_t sub_1CF523D80()
{
  return MEMORY[0x1E0CAD298]();
}

uint64_t sub_1CF523D8C()
{
  return MEMORY[0x1E0CAD2A0]();
}

uint64_t sub_1CF523D98()
{
  return MEMORY[0x1E0CAD2A8]();
}

uint64_t sub_1CF523DA4()
{
  return MEMORY[0x1E0CAD2B0]();
}

uint64_t sub_1CF523DB0()
{
  return MEMORY[0x1E0CAD2B8]();
}

uint64_t sub_1CF523DBC()
{
  return MEMORY[0x1E0CAD2C0]();
}

uint64_t sub_1CF523DC8()
{
  return MEMORY[0x1E0CAD2C8]();
}

uint64_t sub_1CF523DD4()
{
  return MEMORY[0x1E0CAD2D0]();
}

uint64_t sub_1CF523DE0()
{
  return MEMORY[0x1E0CAD2D8]();
}

uint64_t sub_1CF523DEC()
{
  return MEMORY[0x1E0CAD310]();
}

uint64_t sub_1CF523DF8()
{
  return MEMORY[0x1E0CAD318]();
}

uint64_t sub_1CF523E04()
{
  return MEMORY[0x1E0CAD320]();
}

uint64_t sub_1CF523E10()
{
  return MEMORY[0x1E0CAD328]();
}

uint64_t sub_1CF523E1C()
{
  return MEMORY[0x1E0CAD330]();
}

uint64_t sub_1CF523E28()
{
  return MEMORY[0x1E0CAD338]();
}

uint64_t sub_1CF523E34()
{
  return MEMORY[0x1E0CAD348]();
}

uint64_t sub_1CF523E40()
{
  return MEMORY[0x1E0CAD350]();
}

uint64_t sub_1CF523E4C()
{
  return MEMORY[0x1E0CAD360]();
}

uint64_t sub_1CF523E58()
{
  return MEMORY[0x1E0CAD368]();
}

uint64_t sub_1CF523E64()
{
  return MEMORY[0x1E0CAD370]();
}

uint64_t sub_1CF523E70()
{
  return MEMORY[0x1E0CAD378]();
}

uint64_t sub_1CF523E7C()
{
  return MEMORY[0x1E0CAD380]();
}

uint64_t sub_1CF523E88()
{
  return MEMORY[0x1E0CAD3A8]();
}

uint64_t sub_1CF523E94()
{
  return MEMORY[0x1E0CAD3B8]();
}

uint64_t sub_1CF523EA0()
{
  return MEMORY[0x1E0CAD3C0]();
}

uint64_t sub_1CF523EAC()
{
  return MEMORY[0x1E0CAD3C8]();
}

uint64_t sub_1CF523EB8()
{
  return MEMORY[0x1E0CAD3D0]();
}

uint64_t sub_1CF523EC4()
{
  return MEMORY[0x1E0CAD3E0]();
}

uint64_t sub_1CF523ED0()
{
  return MEMORY[0x1E0CAD3E8]();
}

uint64_t sub_1CF523EDC()
{
  return MEMORY[0x1E0CAD3F0]();
}

uint64_t sub_1CF523EE8()
{
  return MEMORY[0x1E0CAD3F8]();
}

uint64_t sub_1CF523EF4()
{
  return MEMORY[0x1E0CAD400]();
}

uint64_t sub_1CF523F00()
{
  return MEMORY[0x1E0CAD408]();
}

uint64_t sub_1CF523F0C()
{
  return MEMORY[0x1E0CAD410]();
}

uint64_t sub_1CF523F18()
{
  return MEMORY[0x1E0CAD418]();
}

uint64_t sub_1CF523F24()
{
  return MEMORY[0x1E0CAD420]();
}

uint64_t sub_1CF523F30()
{
  return MEMORY[0x1E0CAD430]();
}

uint64_t sub_1CF523F3C()
{
  return MEMORY[0x1E0CAD440]();
}

uint64_t sub_1CF523F48()
{
  return MEMORY[0x1E0CAD448]();
}

uint64_t sub_1CF523F54()
{
  return MEMORY[0x1E0CAD450]();
}

uint64_t sub_1CF523F60()
{
  return MEMORY[0x1E0CAD458]();
}

uint64_t sub_1CF523F6C()
{
  return MEMORY[0x1E0CAD460]();
}

uint64_t sub_1CF523F78()
{
  return MEMORY[0x1E0CAD470]();
}

uint64_t sub_1CF523F84()
{
  return MEMORY[0x1E0CAD478]();
}

uint64_t sub_1CF523F90()
{
  return MEMORY[0x1E0CAD480]();
}

uint64_t sub_1CF523F9C()
{
  return MEMORY[0x1E0CAD490]();
}

uint64_t sub_1CF523FA8()
{
  return MEMORY[0x1E0CAD498]();
}

uint64_t sub_1CF523FB4()
{
  return MEMORY[0x1E0CAD4A0]();
}

uint64_t sub_1CF523FC0()
{
  return MEMORY[0x1E0CAD4A8]();
}

uint64_t sub_1CF523FCC()
{
  return MEMORY[0x1E0CAD4B0]();
}

uint64_t sub_1CF523FD8()
{
  return MEMORY[0x1E0CAD4D0]();
}

uint64_t sub_1CF523FE4()
{
  return MEMORY[0x1E0CAD4D8]();
}

uint64_t sub_1CF523FF0()
{
  return MEMORY[0x1E0CAD4E8]();
}

uint64_t sub_1CF523FFC()
{
  return MEMORY[0x1E0CAD548]();
}

uint64_t sub_1CF524008()
{
  return MEMORY[0x1E0CAD550]();
}

uint64_t sub_1CF524014()
{
  return MEMORY[0x1E0CAD558]();
}

uint64_t sub_1CF524020()
{
  return MEMORY[0x1E0CAD560]();
}

uint64_t sub_1CF52402C()
{
  return MEMORY[0x1E0CAD568]();
}

uint64_t sub_1CF524038()
{
  return MEMORY[0x1E0CAD570]();
}

uint64_t sub_1CF524044()
{
  return MEMORY[0x1E0CAD580]();
}

uint64_t sub_1CF524050()
{
  return MEMORY[0x1E0CAD588]();
}

uint64_t sub_1CF52405C()
{
  return MEMORY[0x1E0CAD590]();
}

uint64_t sub_1CF524068()
{
  return MEMORY[0x1E0CAD598]();
}

uint64_t sub_1CF524074()
{
  return MEMORY[0x1E0CAD5A0]();
}

uint64_t sub_1CF524080()
{
  return MEMORY[0x1E0CAD5A8]();
}

uint64_t sub_1CF52408C()
{
  return MEMORY[0x1E0CAD5B0]();
}

uint64_t sub_1CF524098()
{
  return MEMORY[0x1E0CAD5B8]();
}

uint64_t sub_1CF5240A4()
{
  return MEMORY[0x1E0CAD5E8]();
}

uint64_t sub_1CF5240B0()
{
  return MEMORY[0x1E0CAD5F8]();
}

uint64_t sub_1CF5240BC()
{
  return MEMORY[0x1E0CAD600]();
}

uint64_t sub_1CF5240C8()
{
  return MEMORY[0x1E0CAD608]();
}

uint64_t sub_1CF5240D4()
{
  return MEMORY[0x1E0CAD618]();
}

uint64_t sub_1CF5240E0()
{
  return MEMORY[0x1E0CAD620]();
}

uint64_t sub_1CF5240EC()
{
  return MEMORY[0x1E0CAD630]();
}

uint64_t sub_1CF5240F8()
{
  return MEMORY[0x1E0CAD638]();
}

uint64_t sub_1CF524104()
{
  return MEMORY[0x1E0CAD660]();
}

uint64_t sub_1CF524110()
{
  return MEMORY[0x1E0CAD668]();
}

uint64_t sub_1CF52411C()
{
  return MEMORY[0x1E0CAD670]();
}

uint64_t sub_1CF524128()
{
  return MEMORY[0x1E0CAD678]();
}

uint64_t sub_1CF524134()
{
  return MEMORY[0x1E0CAD688]();
}

uint64_t sub_1CF524140()
{
  return MEMORY[0x1E0CAD690]();
}

uint64_t sub_1CF52414C()
{
  return MEMORY[0x1E0CAD6B0]();
}

uint64_t sub_1CF524158()
{
  return MEMORY[0x1E0CAD6C8]();
}

uint64_t sub_1CF524164()
{
  return MEMORY[0x1E0CAD6D8]();
}

uint64_t sub_1CF524170()
{
  return MEMORY[0x1E0CAD6E8]();
}

uint64_t sub_1CF52417C()
{
  return MEMORY[0x1E0CAD6F0]();
}

uint64_t sub_1CF524188()
{
  return MEMORY[0x1E0CAD700]();
}

uint64_t sub_1CF524194()
{
  return MEMORY[0x1E0CAD710]();
}

uint64_t sub_1CF5241A0()
{
  return MEMORY[0x1E0CAD718]();
}

uint64_t sub_1CF5241AC()
{
  return MEMORY[0x1E0CAD728]();
}

uint64_t sub_1CF5241B8()
{
  return MEMORY[0x1E0CAD738]();
}

uint64_t sub_1CF5241C4()
{
  return MEMORY[0x1E0CAD748]();
}

uint64_t sub_1CF5241D0()
{
  return MEMORY[0x1E0CAD760]();
}

uint64_t sub_1CF5241DC()
{
  return MEMORY[0x1E0CAD768]();
}

uint64_t sub_1CF5241E8()
{
  return MEMORY[0x1E0CAD770]();
}

uint64_t sub_1CF5241F4()
{
  return MEMORY[0x1E0CAD778]();
}

uint64_t sub_1CF524200()
{
  return MEMORY[0x1E0CAD780]();
}

uint64_t sub_1CF52420C()
{
  return MEMORY[0x1E0CAD788]();
}

uint64_t sub_1CF524218()
{
  return MEMORY[0x1E0CAD790]();
}

uint64_t sub_1CF524224()
{
  return MEMORY[0x1E0CAD798]();
}

uint64_t sub_1CF524230()
{
  return MEMORY[0x1E0CAD7A0]();
}

uint64_t sub_1CF52423C()
{
  return MEMORY[0x1E0CAD7B0]();
}

uint64_t sub_1CF524248()
{
  return MEMORY[0x1E0CAD7B8]();
}

uint64_t sub_1CF524254()
{
  return MEMORY[0x1E0CAD7C8]();
}

uint64_t sub_1CF524260()
{
  return MEMORY[0x1E0CAD7D0]();
}

uint64_t sub_1CF52426C()
{
  return MEMORY[0x1E0CAD7D8]();
}

uint64_t sub_1CF524278()
{
  return MEMORY[0x1E0CAD7E0]();
}

uint64_t sub_1CF524284()
{
  return MEMORY[0x1E0CAD7E8]();
}

uint64_t sub_1CF524290()
{
  return MEMORY[0x1E0CAD7F0]();
}

uint64_t sub_1CF52429C()
{
  return MEMORY[0x1E0CAD808]();
}

uint64_t sub_1CF5242A8()
{
  return MEMORY[0x1E0CAD810]();
}

uint64_t sub_1CF5242B4()
{
  return MEMORY[0x1E0CAD820]();
}

uint64_t sub_1CF5242C0()
{
  return MEMORY[0x1E0CAD828]();
}

uint64_t sub_1CF5242CC()
{
  return MEMORY[0x1E0CAD830]();
}

uint64_t sub_1CF5242D8()
{
  return MEMORY[0x1E0CAD838]();
}

uint64_t sub_1CF5242E4()
{
  return MEMORY[0x1E0CAD848]();
}

uint64_t sub_1CF5242F0()
{
  return MEMORY[0x1E0CAD850]();
}

uint64_t sub_1CF5242FC()
{
  return MEMORY[0x1E0CAD858]();
}

uint64_t sub_1CF524308()
{
  return MEMORY[0x1E0CAD860]();
}

uint64_t sub_1CF524314()
{
  return MEMORY[0x1E0CAD868]();
}

uint64_t sub_1CF524320()
{
  return MEMORY[0x1E0CAD890]();
}

uint64_t sub_1CF52432C()
{
  return MEMORY[0x1E0CAD8C8]();
}

uint64_t sub_1CF524338()
{
  return MEMORY[0x1E0CAD8D0]();
}

uint64_t sub_1CF524344()
{
  return MEMORY[0x1E0CAD8D8]();
}

uint64_t sub_1CF524350()
{
  return MEMORY[0x1E0CAD8E0]();
}

uint64_t sub_1CF52435C()
{
  return MEMORY[0x1E0CAD8E8]();
}

uint64_t sub_1CF524368()
{
  return MEMORY[0x1E0CAD8F8]();
}

uint64_t sub_1CF524374()
{
  return MEMORY[0x1E0CAD900]();
}

uint64_t sub_1CF524380()
{
  return MEMORY[0x1E0CAD910]();
}

uint64_t sub_1CF52438C()
{
  return MEMORY[0x1E0CAD918]();
}

uint64_t sub_1CF524398()
{
  return MEMORY[0x1E0CAD920]();
}

uint64_t sub_1CF5243A4()
{
  return MEMORY[0x1E0CAD928]();
}

uint64_t sub_1CF5243B0()
{
  return MEMORY[0x1E0CAD930]();
}

uint64_t sub_1CF5243BC()
{
  return MEMORY[0x1E0CAD938]();
}

uint64_t sub_1CF5243C8()
{
  return MEMORY[0x1E0CAD940]();
}

uint64_t sub_1CF5243D4()
{
  return MEMORY[0x1E0CAD948]();
}

uint64_t sub_1CF5243E0()
{
  return MEMORY[0x1E0CAD950]();
}

uint64_t sub_1CF5243EC()
{
  return MEMORY[0x1E0CAD958]();
}

uint64_t sub_1CF5243F8()
{
  return MEMORY[0x1E0CAD968]();
}

uint64_t sub_1CF524404()
{
  return MEMORY[0x1E0CAD970]();
}

uint64_t sub_1CF524410()
{
  return MEMORY[0x1E0CAD978]();
}

uint64_t sub_1CF52441C()
{
  return MEMORY[0x1E0CAD980]();
}

uint64_t sub_1CF524428()
{
  return MEMORY[0x1E0CAD990]();
}

uint64_t sub_1CF524434()
{
  return MEMORY[0x1E0CAD998]();
}

uint64_t sub_1CF524440()
{
  return MEMORY[0x1E0CAD9A8]();
}

uint64_t sub_1CF52444C()
{
  return MEMORY[0x1E0CAD9C0]();
}

uint64_t sub_1CF524458()
{
  return MEMORY[0x1E0CAD9C8]();
}

uint64_t sub_1CF524464()
{
  return MEMORY[0x1E0CAD9D0]();
}

uint64_t sub_1CF524470()
{
  return MEMORY[0x1E0CAD9D8]();
}

uint64_t sub_1CF52447C()
{
  return MEMORY[0x1E0CAD9E0]();
}

uint64_t sub_1CF524488()
{
  return MEMORY[0x1E0CAD9E8]();
}

uint64_t sub_1CF524494()
{
  return MEMORY[0x1E0CAD9F8]();
}

uint64_t sub_1CF5244A0()
{
  return MEMORY[0x1E0CADA08]();
}

uint64_t sub_1CF5244AC()
{
  return MEMORY[0x1E0CADA10]();
}

uint64_t sub_1CF5244B8()
{
  return MEMORY[0x1E0CADA20]();
}

uint64_t sub_1CF5244C4()
{
  return MEMORY[0x1E0CADA28]();
}

uint64_t sub_1CF5244D0()
{
  return MEMORY[0x1E0CADA30]();
}

uint64_t sub_1CF5244DC()
{
  return MEMORY[0x1E0CADA38]();
}

uint64_t sub_1CF5244E8()
{
  return MEMORY[0x1E0CADA58]();
}

uint64_t sub_1CF5244F4()
{
  return MEMORY[0x1E0CADA60]();
}

uint64_t sub_1CF524500()
{
  return MEMORY[0x1E0CADA70]();
}

uint64_t sub_1CF52450C()
{
  return MEMORY[0x1E0CADA78]();
}

uint64_t sub_1CF524518()
{
  return MEMORY[0x1E0CADA80]();
}

uint64_t sub_1CF524524()
{
  return MEMORY[0x1E0CADA88]();
}

uint64_t sub_1CF524530()
{
  return MEMORY[0x1E0CADA90]();
}

uint64_t sub_1CF52453C()
{
  return MEMORY[0x1E0CADA98]();
}

uint64_t sub_1CF524548()
{
  return MEMORY[0x1E0CADAA0]();
}

uint64_t sub_1CF524554()
{
  return MEMORY[0x1E0CADAA8]();
}

uint64_t sub_1CF524560()
{
  return MEMORY[0x1E0CADAB0]();
}

uint64_t sub_1CF52456C()
{
  return MEMORY[0x1E0CADAB8]();
}

uint64_t sub_1CF524578()
{
  return MEMORY[0x1E0CADAC0]();
}

uint64_t sub_1CF524584()
{
  return MEMORY[0x1E0CADAC8]();
}

uint64_t sub_1CF524590()
{
  return MEMORY[0x1E0CADAD0]();
}

uint64_t sub_1CF52459C()
{
  return MEMORY[0x1E0CADAE0]();
}

uint64_t sub_1CF5245A8()
{
  return MEMORY[0x1E0CADAE8]();
}

uint64_t sub_1CF5245B4()
{
  return MEMORY[0x1E0CADAF0]();
}

uint64_t sub_1CF5245C0()
{
  return MEMORY[0x1E0CADAF8]();
}

uint64_t sub_1CF5245CC()
{
  return MEMORY[0x1E0CADB00]();
}

uint64_t sub_1CF5245D8()
{
  return MEMORY[0x1E0CADB08]();
}

uint64_t sub_1CF5245E4()
{
  return MEMORY[0x1E0CADB10]();
}

uint64_t sub_1CF5245F0()
{
  return MEMORY[0x1E0CADB18]();
}

uint64_t sub_1CF5245FC()
{
  return MEMORY[0x1E0CADB20]();
}

uint64_t sub_1CF524608()
{
  return MEMORY[0x1E0CADB28]();
}

uint64_t sub_1CF524614()
{
  return MEMORY[0x1E0CADB30]();
}

uint64_t sub_1CF524620()
{
  return MEMORY[0x1E0CADB38]();
}

uint64_t sub_1CF52462C()
{
  return MEMORY[0x1E0CADB48]();
}

uint64_t sub_1CF524638()
{
  return MEMORY[0x1E0CADB50]();
}

uint64_t sub_1CF524644()
{
  return MEMORY[0x1E0CADB58]();
}

uint64_t sub_1CF524650()
{
  return MEMORY[0x1E0CADB60]();
}

uint64_t sub_1CF52465C()
{
  return MEMORY[0x1E0CADB68]();
}

uint64_t sub_1CF524668()
{
  return MEMORY[0x1E0CADB70]();
}

uint64_t sub_1CF524674()
{
  return MEMORY[0x1E0CADB78]();
}

uint64_t sub_1CF524680()
{
  return MEMORY[0x1E0CADB88]();
}

uint64_t sub_1CF52468C()
{
  return MEMORY[0x1E0CADBA8]();
}

uint64_t sub_1CF524698()
{
  return MEMORY[0x1E0CADBB0]();
}

uint64_t sub_1CF5246A4()
{
  return MEMORY[0x1E0CADBC0]();
}

uint64_t sub_1CF5246B0()
{
  return MEMORY[0x1E0CADBC8]();
}

uint64_t sub_1CF5246BC()
{
  return MEMORY[0x1E0CADBD0]();
}

uint64_t sub_1CF5246C8()
{
  return MEMORY[0x1E0CADBD8]();
}

uint64_t sub_1CF5246D4()
{
  return MEMORY[0x1E0CADBE0]();
}

uint64_t sub_1CF5246E0()
{
  return MEMORY[0x1E0CADBE8]();
}

uint64_t sub_1CF5246EC()
{
  return MEMORY[0x1E0CADBF8]();
}

uint64_t sub_1CF5246F8()
{
  return MEMORY[0x1E0CADC00]();
}

uint64_t sub_1CF524704()
{
  return MEMORY[0x1E0CADC10]();
}

uint64_t sub_1CF524710()
{
  return MEMORY[0x1E0C97788]();
}

uint64_t sub_1CF52471C()
{
  return MEMORY[0x1E0CADE20]();
}

uint64_t sub_1CF524728()
{
  return MEMORY[0x1E0CADE48]();
}

uint64_t sub_1CF524734()
{
  return MEMORY[0x1E0CADF98]();
}

uint64_t sub_1CF524740()
{
  return MEMORY[0x1E0CAE070]();
}

uint64_t sub_1CF52474C()
{
  return MEMORY[0x1E0CAE0A8]();
}

uint64_t sub_1CF524758()
{
  return MEMORY[0x1E0CAE0B8]();
}

uint64_t sub_1CF524764()
{
  return MEMORY[0x1E0CAE0C8]();
}

uint64_t sub_1CF524770()
{
  return MEMORY[0x1E0CAE0E0]();
}

uint64_t sub_1CF52477C()
{
  return MEMORY[0x1E0CAE108]();
}

uint64_t sub_1CF524788()
{
  return MEMORY[0x1E0CAE160]();
}

uint64_t sub_1CF524794()
{
  return MEMORY[0x1E0CAE178]();
}

uint64_t sub_1CF5247A0()
{
  return MEMORY[0x1E0CAE1A0]();
}

uint64_t sub_1CF5247AC()
{
  return MEMORY[0x1E0CAE1D8]();
}

uint64_t sub_1CF5247B8()
{
  return MEMORY[0x1E0CAE1E8]();
}

uint64_t sub_1CF5247C4()
{
  return MEMORY[0x1E0CAE430]();
}

uint64_t sub_1CF5247D0()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_1CF5247DC()
{
  return MEMORY[0x1E0CAE590]();
}

uint64_t sub_1CF5247E8()
{
  return MEMORY[0x1E0CAE5D0]();
}

uint64_t sub_1CF5247F4()
{
  return MEMORY[0x1E0CAE638]();
}

uint64_t sub_1CF524800()
{
  return MEMORY[0x1E0CAE648]();
}

uint64_t sub_1CF52480C()
{
  return MEMORY[0x1E0CAE8B8]();
}

uint64_t sub_1CF524818()
{
  return MEMORY[0x1E0CAE8D0]();
}

uint64_t sub_1CF524824()
{
  return MEMORY[0x1E0CAE8F0]();
}

uint64_t sub_1CF524830()
{
  return MEMORY[0x1E0CAE8F8]();
}

uint64_t sub_1CF52483C()
{
  return MEMORY[0x1E0CAE910]();
}

uint64_t sub_1CF524848()
{
  return MEMORY[0x1E0CAEB10]();
}

uint64_t sub_1CF524854()
{
  return MEMORY[0x1E0CAEB20]();
}

uint64_t sub_1CF524860()
{
  return MEMORY[0x1E0CAEB38]();
}

uint64_t sub_1CF52486C()
{
  return MEMORY[0x1E0CAEB50]();
}

uint64_t sub_1CF524878()
{
  return MEMORY[0x1E0CAF328]();
}

uint64_t sub_1CF524884()
{
  return MEMORY[0x1E0CAF388]();
}

uint64_t sub_1CF524890()
{
  return MEMORY[0x1E0CAF3D0]();
}

uint64_t sub_1CF52489C()
{
  return MEMORY[0x1E0CAF3D8]();
}

uint64_t sub_1CF5248A8()
{
  return MEMORY[0x1E0CAF910]();
}

uint64_t sub_1CF5248B4()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1CF5248C0()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1CF5248CC()
{
  return MEMORY[0x1E0CAFB58]();
}

uint64_t sub_1CF5248D8()
{
  return MEMORY[0x1E0CAFD90]();
}

uint64_t sub_1CF5248E4()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1CF5248F0()
{
  return MEMORY[0x1E0CAFE18]();
}

uint64_t sub_1CF5248FC()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1CF524908()
{
  return MEMORY[0x1E0CAFE78]();
}

uint64_t sub_1CF524914()
{
  return MEMORY[0x1E0CAFE80]();
}

uint64_t sub_1CF524920()
{
  return MEMORY[0x1E0CAFEA0]();
}

uint64_t sub_1CF52492C()
{
  return MEMORY[0x1E0CAFED8]();
}

uint64_t sub_1CF524938()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1CF524944()
{
  return MEMORY[0x1E0CAFF18]();
}

uint64_t sub_1CF524950()
{
  return MEMORY[0x1E0CAFF30]();
}

uint64_t sub_1CF52495C()
{
  return MEMORY[0x1E0CAFF40]();
}

uint64_t sub_1CF524968()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1CF524974()
{
  return MEMORY[0x1E0CAFFD0]();
}

uint64_t sub_1CF524980()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1CF52498C()
{
  return MEMORY[0x1E0CB0140]();
}

uint64_t sub_1CF524998()
{
  return MEMORY[0x1E0CB0188]();
}

uint64_t sub_1CF5249A4()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1CF5249B0()
{
  return MEMORY[0x1E0CB01F8]();
}

uint64_t sub_1CF5249BC()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1CF5249C8()
{
  return MEMORY[0x1E0CADC20]();
}

uint64_t sub_1CF5249D4()
{
  return MEMORY[0x1E0CB0588]();
}

uint64_t sub_1CF5249E0()
{
  return MEMORY[0x1E0CB05A8]();
}

uint64_t sub_1CF5249EC()
{
  return MEMORY[0x1E0CB05D8]();
}

uint64_t sub_1CF5249F8()
{
  return MEMORY[0x1E0CB0670]();
}

uint64_t sub_1CF524A04()
{
  return MEMORY[0x1E0CB0680]();
}

uint64_t sub_1CF524A10()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1CF524A1C()
{
  return MEMORY[0x1E0CB06D0]();
}

uint64_t sub_1CF524A28()
{
  return MEMORY[0x1E0CB06D8]();
}

uint64_t sub_1CF524A34()
{
  return MEMORY[0x1E0CB07C8]();
}

uint64_t sub_1CF524A40()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1CF524A4C()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1CF524A58()
{
  return MEMORY[0x1E0CB0840]();
}

uint64_t sub_1CF524A64()
{
  return MEMORY[0x1E0CB0848]();
}

uint64_t sub_1CF524A70()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1CF524A7C()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1CF524A88()
{
  return MEMORY[0x1E0CB0930]();
}

uint64_t sub_1CF524A94()
{
  return MEMORY[0x1E0CB0948]();
}

uint64_t sub_1CF524AA0()
{
  return MEMORY[0x1E0CB0958]();
}

uint64_t sub_1CF524AAC()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1CF524AB8()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1CF524AC4()
{
  return MEMORY[0x1E0CB0BD8]();
}

uint64_t sub_1CF524AD0()
{
  return MEMORY[0x1E0CB0BF8]();
}

uint64_t sub_1CF524ADC()
{
  return MEMORY[0x1E0CB0DA0]();
}

uint64_t sub_1CF524AE8()
{
  return MEMORY[0x1E0CB0DB8]();
}

uint64_t sub_1CF524AF4()
{
  return MEMORY[0x1E0CB0DF0]();
}

uint64_t sub_1CF524B00()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1CF524B0C()
{
  return MEMORY[0x1E0CB0F00]();
}

uint64_t sub_1CF524B18()
{
  return MEMORY[0x1E0CB0F20]();
}

uint64_t sub_1CF524B24()
{
  return MEMORY[0x1E0CB1030]();
}

uint64_t sub_1CF524B30()
{
  return MEMORY[0x1E0CB1070]();
}

uint64_t sub_1CF524B3C()
{
  return MEMORY[0x1E0CB11B8]();
}

uint64_t sub_1CF524B48()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1CF524B54()
{
  return MEMORY[0x1E0CB1448]();
}

uint64_t sub_1CF524B60()
{
  return MEMORY[0x1E0CB1470]();
}

uint64_t sub_1CF524B6C()
{
  return MEMORY[0x1E0D662A8]();
}

uint64_t sub_1CF524B78()
{
  return MEMORY[0x1E0D662C0]();
}

uint64_t sub_1CF524B84()
{
  return MEMORY[0x1E0D662E0]();
}

uint64_t sub_1CF524B90()
{
  return MEMORY[0x1E0D662E8]();
}

uint64_t sub_1CF524B9C()
{
  return MEMORY[0x1E0DEF0A0]();
}

uint64_t sub_1CF524BA8()
{
  return MEMORY[0x1E0DEF0A8]();
}

uint64_t sub_1CF524BB4()
{
  return MEMORY[0x1E0DEF0B0]();
}

uint64_t sub_1CF524BC0()
{
  return MEMORY[0x1E0DF2108]();
}

uint64_t sub_1CF524BCC()
{
  return MEMORY[0x1E0DF2110]();
}

uint64_t sub_1CF524BD8()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_1CF524BE4()
{
  return MEMORY[0x1E0DF2150]();
}

uint64_t sub_1CF524BF0()
{
  return MEMORY[0x1E0DF2158]();
}

uint64_t sub_1CF524BFC()
{
  return MEMORY[0x1E0DF2170]();
}

uint64_t sub_1CF524C08()
{
  return MEMORY[0x1E0DF2198]();
}

uint64_t sub_1CF524C14()
{
  return MEMORY[0x1E0DF2218]();
}

uint64_t sub_1CF524C20()
{
  return MEMORY[0x1E0DF2220]();
}

uint64_t sub_1CF524C2C()
{
  return MEMORY[0x1E0DF2228]();
}

uint64_t sub_1CF524C38()
{
  return MEMORY[0x1E0DF2238]();
}

uint64_t sub_1CF524C44()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1CF524C50()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1CF524C5C()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1CF524C68()
{
  return MEMORY[0x1E0DF0488]();
}

uint64_t sub_1CF524C74()
{
  return MEMORY[0x1E0DF04A8]();
}

uint64_t sub_1CF524C80()
{
  return MEMORY[0x1E0DF04B0]();
}

uint64_t sub_1CF524C8C()
{
  return MEMORY[0x1E0DF04C0]();
}

uint64_t sub_1CF524C98()
{
  return MEMORY[0x1E0DF04C8]();
}

uint64_t sub_1CF524CA4()
{
  return MEMORY[0x1E0DF04D0]();
}

uint64_t sub_1CF524CB0()
{
  return MEMORY[0x1E0DF04D8]();
}

uint64_t sub_1CF524CBC()
{
  return MEMORY[0x1E0DF0520]();
}

uint64_t sub_1CF524CC8()
{
  return MEMORY[0x1E0DF0548]();
}

uint64_t sub_1CF524CD4()
{
  return MEMORY[0x1E0DF0550]();
}

uint64_t sub_1CF524CE0()
{
  return MEMORY[0x1E0DF0558]();
}

uint64_t sub_1CF524CEC()
{
  return MEMORY[0x1E0DF0560]();
}

uint64_t sub_1CF524CF8()
{
  return MEMORY[0x1E0DF0568]();
}

uint64_t sub_1CF524D04()
{
  return MEMORY[0x1E0CB1768]();
}

uint64_t sub_1CF524D10()
{
  return MEMORY[0x1E0DF0088]();
}

uint64_t sub_1CF524D1C()
{
  return MEMORY[0x1E0DF0138]();
}

uint64_t sub_1CF524D28()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1CF524D34()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1CF524D40()
{
  return MEMORY[0x1E0DEF580]();
}

uint64_t sub_1CF524D4C()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1CF524D58()
{
  return MEMORY[0x1E0DEF748]();
}

uint64_t sub_1CF524D64()
{
  return MEMORY[0x1E0DEF778]();
}

uint64_t sub_1CF524D70()
{
  return MEMORY[0x1E0CA92A8]();
}

uint64_t sub_1CF524D7C()
{
  return MEMORY[0x1E0CA92B0]();
}

uint64_t sub_1CF524D88()
{
  return MEMORY[0x1E0CA92C8]();
}

uint64_t sub_1CF524D94()
{
  return MEMORY[0x1E0CA92F8]();
}

uint64_t sub_1CF524DA0()
{
  return MEMORY[0x1E0CA93B0]();
}

uint64_t sub_1CF524DAC()
{
  return MEMORY[0x1E0CA93C8]();
}

uint64_t sub_1CF524DB8()
{
  return MEMORY[0x1E0CA9588]();
}

uint64_t sub_1CF524DC4()
{
  return MEMORY[0x1E0CA9678]();
}

uint64_t sub_1CF524DD0()
{
  return MEMORY[0x1E0CA9690]();
}

uint64_t sub_1CF524DDC()
{
  return MEMORY[0x1E0CA96A8]();
}

uint64_t sub_1CF524DE8()
{
  return MEMORY[0x1E0CA96D8]();
}

uint64_t sub_1CF524DF4()
{
  return MEMORY[0x1E0CA9940]();
}

uint64_t sub_1CF524E00()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1CF524E0C()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1CF524E18()
{
  return MEMORY[0x1E0DE9E78]();
}

uint64_t sub_1CF524E24()
{
  return MEMORY[0x1E0DE9F18]();
}

uint64_t sub_1CF524E30()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1CF524E3C()
{
  return MEMORY[0x1E0DEA1C0]();
}

uint64_t sub_1CF524E48()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1CF524E54()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1CF524E60()
{
  return MEMORY[0x1E0DEA3C8]();
}

uint64_t sub_1CF524E6C()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1CF524E78()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1CF524E84()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1CF524E90()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1CF524E9C()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1CF524EA8()
{
  return MEMORY[0x1E0CB1988]();
}

uint64_t sub_1CF524EB4()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_1CF524EC0()
{
  return MEMORY[0x1E0CB19F0]();
}

uint64_t sub_1CF524ECC()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_1CF524ED8()
{
  return MEMORY[0x1E0CB1A58]();
}

uint64_t sub_1CF524EE4()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1CF524EF0()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_1CF524EFC()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_1CF524F08()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1CF524F14()
{
  return MEMORY[0x1E0DEA7C0]();
}

uint64_t sub_1CF524F20()
{
  return MEMORY[0x1E0DEA7D0]();
}

uint64_t sub_1CF524F2C()
{
  return MEMORY[0x1E0DEA7F0]();
}

uint64_t sub_1CF524F38()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1CF524F44()
{
  return MEMORY[0x1E0DEA828]();
}

uint64_t sub_1CF524F50()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1CF524F5C()
{
  return MEMORY[0x1E0DEAA08]();
}

uint64_t sub_1CF524F68()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1CF524F74()
{
  return MEMORY[0x1E0DEAA70]();
}

uint64_t sub_1CF524F80()
{
  return MEMORY[0x1E0DEAB28]();
}

uint64_t sub_1CF524F8C()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_1CF524F98()
{
  return MEMORY[0x1E0DEACE0]();
}

uint64_t sub_1CF524FA4()
{
  return MEMORY[0x1E0DEAD58]();
}

uint64_t sub_1CF524FB0()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1CF524FBC()
{
  return MEMORY[0x1E0CADC28]();
}

uint64_t sub_1CF524FC8()
{
  return MEMORY[0x1E0CADC30]();
}

uint64_t sub_1CF524FD4()
{
  return MEMORY[0x1E0CADC38]();
}

uint64_t sub_1CF524FE0()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1CF524FEC()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1CF524FF8()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1CF525004()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1CF525010()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_1CF52501C()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1CF525028()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1CF525034()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1CF525040()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_1CF52504C()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1CF525058()
{
  return MEMORY[0x1E0DEAE80]();
}

uint64_t sub_1CF525064()
{
  return MEMORY[0x1E0DEAE98]();
}

uint64_t sub_1CF525070()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1CF52507C()
{
  return MEMORY[0x1E0CB1B28]();
}

uint64_t sub_1CF525088()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1CF525094()
{
  return MEMORY[0x1E0DF05E0]();
}

uint64_t sub_1CF5250A0()
{
  return MEMORY[0x1E0DF0608]();
}

uint64_t sub_1CF5250AC()
{
  return MEMORY[0x1E0DF0640]();
}

uint64_t sub_1CF5250B8()
{
  return MEMORY[0x1E0DF0670]();
}

uint64_t sub_1CF5250C4()
{
  return MEMORY[0x1E0DF0688]();
}

uint64_t sub_1CF5250D0()
{
  return MEMORY[0x1E0DF0698]();
}

uint64_t sub_1CF5250DC()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1CF5250E8()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1CF5250F4()
{
  return MEMORY[0x1E0DF0770]();
}

uint64_t sub_1CF525100()
{
  return MEMORY[0x1E0DF07D8]();
}

uint64_t sub_1CF52510C()
{
  return MEMORY[0x1E0DF07E8]();
}

uint64_t sub_1CF525118()
{
  return MEMORY[0x1E0DF0860]();
}

uint64_t sub_1CF525124()
{
  return MEMORY[0x1E0DF0870]();
}

uint64_t sub_1CF525130()
{
  return MEMORY[0x1E0DF08A8]();
}

uint64_t sub_1CF52513C()
{
  return MEMORY[0x1E0DF08B8]();
}

uint64_t sub_1CF525148()
{
  return MEMORY[0x1E0DF08C8]();
}

uint64_t sub_1CF525154()
{
  return MEMORY[0x1E0DF09D0]();
}

uint64_t sub_1CF525160()
{
  return MEMORY[0x1E0CB1B50]();
}

uint64_t sub_1CF52516C()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1CF525178()
{
  return MEMORY[0x1E0CB1BB8]();
}

uint64_t sub_1CF525184()
{
  return MEMORY[0x1E0CB1BC0]();
}

uint64_t sub_1CF525190()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1CF52519C()
{
  return MEMORY[0x1E0DEB258]();
}

uint64_t sub_1CF5251A8()
{
  return MEMORY[0x1E0DEB2A8]();
}

uint64_t sub_1CF5251B4()
{
  return MEMORY[0x1E0DEB310]();
}

uint64_t sub_1CF5251C0()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_1CF5251CC()
{
  return MEMORY[0x1E0CB1C90]();
}

uint64_t sub_1CF5251D8()
{
  return MEMORY[0x1E0CB1CE8]();
}

uint64_t sub_1CF5251E4()
{
  return MEMORY[0x1E0CB1CF8]();
}

uint64_t sub_1CF5251F0()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1CF5251FC()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1CF525208()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1CF525214()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1CF525220()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1CF52522C()
{
  return MEMORY[0x1E0CADC48]();
}

uint64_t sub_1CF525238()
{
  return MEMORY[0x1E0CADC50]();
}

uint64_t sub_1CF525244()
{
  return MEMORY[0x1E0CB1E40]();
}

uint64_t sub_1CF525250()
{
  return MEMORY[0x1E0CB1E68]();
}

uint64_t sub_1CF52525C()
{
  return MEMORY[0x1E0CADC58]();
}

uint64_t sub_1CF525268()
{
  return MEMORY[0x1E0CADC60]();
}

uint64_t sub_1CF525274()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1CF525280()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1CF52528C()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1CF525298()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t sub_1CF5252A4()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1CF5252B0()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1CF5252BC()
{
  return MEMORY[0x1E0CADC68]();
}

uint64_t sub_1CF5252C8()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t sub_1CF5252D4()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t sub_1CF5252E0()
{
  return MEMORY[0x1E0CB1ED8]();
}

uint64_t sub_1CF5252EC()
{
  return MEMORY[0x1E0CB1EE0]();
}

uint64_t sub_1CF5252F8()
{
  return MEMORY[0x1E0CB1F08]();
}

uint64_t sub_1CF525304()
{
  return MEMORY[0x1E0DEFA68]();
}

uint64_t sub_1CF525310()
{
  return MEMORY[0x1E0DEFA70]();
}

uint64_t sub_1CF52531C()
{
  return MEMORY[0x1E0CADC70]();
}

uint64_t sub_1CF525328()
{
  return MEMORY[0x1E0CADC78]();
}

uint64_t sub_1CF525334()
{
  return MEMORY[0x1E0CADC80]();
}

uint64_t sub_1CF525340()
{
  return MEMORY[0x1E0CADC88]();
}

uint64_t sub_1CF52534C()
{
  return MEMORY[0x1E0CADC90]();
}

uint64_t sub_1CF525358()
{
  return MEMORY[0x1E0CADC98]();
}

uint64_t sub_1CF525364()
{
  return MEMORY[0x1E0C977B8]();
}

uint64_t sub_1CF525370()
{
  return MEMORY[0x1E0C977C8]();
}

uint64_t sub_1CF52537C()
{
  return MEMORY[0x1E0C977D0]();
}

uint64_t sub_1CF525388()
{
  return MEMORY[0x1E0C977D8]();
}

uint64_t sub_1CF525394()
{
  return MEMORY[0x1E0C977E0]();
}

uint64_t sub_1CF5253A0()
{
  return MEMORY[0x1E0CB1FA0]();
}

uint64_t sub_1CF5253AC()
{
  return MEMORY[0x1E0CB20D0]();
}

uint64_t sub_1CF5253B8()
{
  return MEMORY[0x1E0CB20E0]();
}

uint64_t sub_1CF5253C4()
{
  return MEMORY[0x1E0DEFCD8]();
}

uint64_t sub_1CF5253D0()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1CF5253DC()
{
  return MEMORY[0x1E0DEFCE8]();
}

uint64_t sub_1CF5253E8()
{
  return MEMORY[0x1E0CB2130]();
}

uint64_t sub_1CF5253F4()
{
  return MEMORY[0x1E0DF22B0]();
}

uint64_t sub_1CF525400()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1CF52540C()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1CF525418()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1CF525424()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1CF525430()
{
  return MEMORY[0x1E0CB2400]();
}

uint64_t sub_1CF52543C()
{
  return MEMORY[0x1E0CB2430]();
}

uint64_t sub_1CF525448()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1CF525454()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1CF525460()
{
  return MEMORY[0x1E0DEBFD0]();
}

uint64_t sub_1CF52546C()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1CF525478()
{
  return MEMORY[0x1E0DEC058]();
}

uint64_t sub_1CF525484()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1CF525490()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1CF52549C()
{
  return MEMORY[0x1E0DEC070]();
}

uint64_t sub_1CF5254A8()
{
  return MEMORY[0x1E0DEC078]();
}

uint64_t sub_1CF5254B4()
{
  return MEMORY[0x1E0DEC0A8]();
}

uint64_t sub_1CF5254C0()
{
  return MEMORY[0x1E0DEC0B0]();
}

uint64_t sub_1CF5254CC()
{
  return MEMORY[0x1E0DEC0B8]();
}

uint64_t sub_1CF5254D8()
{
  return MEMORY[0x1E0DEC0D0]();
}

uint64_t sub_1CF5254E4()
{
  return MEMORY[0x1E0DEC0D8]();
}

uint64_t sub_1CF5254F0()
{
  return MEMORY[0x1E0DEC0E0]();
}

uint64_t sub_1CF5254FC()
{
  return MEMORY[0x1E0DEC0F8]();
}

uint64_t sub_1CF525508()
{
  return MEMORY[0x1E0DEC100]();
}

uint64_t sub_1CF525514()
{
  return MEMORY[0x1E0DEC110]();
}

uint64_t sub_1CF525520()
{
  return MEMORY[0x1E0DEC118]();
}

uint64_t sub_1CF52552C()
{
  return MEMORY[0x1E0DEC128]();
}

uint64_t sub_1CF525538()
{
  return MEMORY[0x1E0DEC140]();
}

uint64_t sub_1CF525544()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1CF525550()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1CF52555C()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1CF525568()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1CF525574()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1CF525580()
{
  return MEMORY[0x1E0DEC258]();
}

uint64_t sub_1CF52558C()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1CF525598()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1CF5255A4()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1CF5255B0()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_1CF5255BC()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1CF5255C8()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1CF5255D4()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1CF5255E0()
{
  return MEMORY[0x1E0DF0B08]();
}

uint64_t sub_1CF5255EC()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1CF5255F8()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1CF525604()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1CF525610()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1CF52561C()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1CF525628()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1CF525634()
{
  return MEMORY[0x1E0DECAE0]();
}

uint64_t sub_1CF525640()
{
  return MEMORY[0x1E0DECB08]();
}

uint64_t sub_1CF52564C()
{
  return MEMORY[0x1E0DECB20]();
}

uint64_t sub_1CF525658()
{
  return MEMORY[0x1E0DECB38]();
}

uint64_t sub_1CF525664()
{
  return MEMORY[0x1E0DECB40]();
}

uint64_t sub_1CF525670()
{
  return MEMORY[0x1E0DECB48]();
}

uint64_t sub_1CF52567C()
{
  return MEMORY[0x1E0DECB50]();
}

uint64_t sub_1CF525688()
{
  return MEMORY[0x1E0DECB58]();
}

uint64_t sub_1CF525694()
{
  return MEMORY[0x1E0DECB70]();
}

uint64_t sub_1CF5256A0()
{
  return MEMORY[0x1E0DECB78]();
}

uint64_t sub_1CF5256AC()
{
  return MEMORY[0x1E0DECB80]();
}

uint64_t sub_1CF5256B8()
{
  return MEMORY[0x1E0DECB88]();
}

uint64_t sub_1CF5256C4()
{
  return MEMORY[0x1E0DECBB8]();
}

uint64_t sub_1CF5256D0()
{
  return MEMORY[0x1E0DECBD8]();
}

uint64_t sub_1CF5256DC()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1CF5256E8()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1CF5256F4()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1CF525700()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1CF52570C()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1CF525718()
{
  return MEMORY[0x1E0DECD48]();
}

uint64_t sub_1CF525724()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1CF525730()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1CF52573C()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1CF525748()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1CF525754()
{
  return MEMORY[0x1E0DECF58]();
}

uint64_t sub_1CF525760()
{
  return MEMORY[0x1E0DECF88]();
}

uint64_t sub_1CF52576C()
{
  return MEMORY[0x1E0DECFA8]();
}

uint64_t sub_1CF525778()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_1CF525784()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1CF525790()
{
  return MEMORY[0x1E0DED090]();
}

uint64_t sub_1CF52579C()
{
  return MEMORY[0x1E0DED0C0]();
}

uint64_t sub_1CF5257A8()
{
  return MEMORY[0x1E0DED0D8]();
}

uint64_t sub_1CF5257B4()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_1CF5257C0()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1CF5257CC()
{
  return MEMORY[0x1E0DED1A0]();
}

uint64_t sub_1CF5257D8()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1CF5257E4()
{
  return MEMORY[0x1E0DED1B8]();
}

uint64_t sub_1CF5257F0()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1CF5257FC()
{
  return MEMORY[0x1E0DF0DE0]();
}

uint64_t sub_1CF525808()
{
  return MEMORY[0x1E0DED4A0]();
}

uint64_t sub_1CF525814()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1CF525820()
{
  return MEMORY[0x1E0DED770]();
}

uint64_t sub_1CF52582C()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_1CF525838()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1CF525844()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1CF525850()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1CF52585C()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1CF525868()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1CF525874()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1CF525880()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1CF52588C()
{
  return MEMORY[0x1E0DEDB30]();
}

uint64_t sub_1CF525898()
{
  return MEMORY[0x1E0CB2688]();
}

uint64_t sub_1CF5258A4()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1CF5258B0()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1CF5258BC()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1CF5258C8()
{
  return MEMORY[0x1E0DEDF18]();
}

uint64_t sub_1CF5258D4()
{
  return MEMORY[0x1E0DEDF20]();
}

uint64_t sub_1CF5258E0()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_1CF5258EC()
{
  return MEMORY[0x1E0DEDF38]();
}

uint64_t sub_1CF5258F8()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1CF525904()
{
  return MEMORY[0x1E0DEDF48]();
}

uint64_t sub_1CF525910()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1CF52591C()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1CF525928()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1CF525934()
{
  return MEMORY[0x1E0DEE8E8]();
}

uint64_t sub_1CF525940()
{
  return MEMORY[0x1E0DEE8F8]();
}

uint64_t FKSetCrashLogSignatureString()
{
  return MEMORY[0x1E0CADCB8]();
}

uint64_t GSMainScreenScaleFactor()
{
  return MEMORY[0x1E0D27C58]();
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1E0CBB700](AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, AssertionID, Timeout);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1E0CBB738](*(_QWORD *)&AssertionID);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t PKDisableRateLimiting()
{
  return MEMORY[0x1E0D69D90]();
}

CFStringRef SecCopyErrorMessageString(OSStatus status, void *reserved)
{
  return (CFStringRef)MEMORY[0x1E0CD6218](*(_QWORD *)&status, reserved);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6290](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1E0CD62A0](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1E0CD62D8](query, attributesToUpdate);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1E0CD65A0](rnd, count, bytes);
}

uint64_t TCCAccessCheckAuditToken()
{
  return MEMORY[0x1E0DB0F90]();
}

uint64_t TCCAccessPreflightWithAuditToken()
{
  return MEMORY[0x1E0DB1008]();
}

uint64_t TCCAccessResetForBundleIdWithOptions()
{
  return MEMORY[0x1E0DB1040]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x1E0DE7960]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x1E0DE7970]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _set_user_dir_suffix()
{
  return MEMORY[0x1E0C811A0]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x1E0DEEBB0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getExtendedExistentialTypeMetadata_unique()
{
  return MEMORY[0x1E0DEEC70]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x1E0DEED10]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x1E0DEED70]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x1E0DEEE08]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x1E0DEEE90]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_taskGroup_addPending()
{
  return MEMORY[0x1E0DF0FE8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_weakAssign()
{
  return MEMORY[0x1E0DEEF80]();
}

uint64_t swift_weakCopyAssign()
{
  return MEMORY[0x1E0DEEF88]();
}

uint64_t swift_weakCopyInit()
{
  return MEMORY[0x1E0DEEF90]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_weakTakeAssign()
{
  return MEMORY[0x1E0DEEFB0]();
}

uint64_t swift_weakTakeInit()
{
  return MEMORY[0x1E0DEEFB8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x1E0DEEFC8]();
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1E0C85D80](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85D90](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

uint64_t xpc_activity_set_completion_status()
{
  return MEMORY[0x1E0C85DA8]();
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  MEMORY[0x1E0C85DB0](activity, criteria);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x1E0C85DD0](identifier);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86218]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1E0C86420](object1, object2);
}

