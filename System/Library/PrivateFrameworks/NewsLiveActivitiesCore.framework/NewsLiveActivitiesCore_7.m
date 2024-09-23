uint64_t getEnumTagSinglePayload for ActivityFlexibleUpdateTheme(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 2408))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 888);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ActivityFlexibleUpdateTheme(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
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
    *(_OWORD *)(result + 2376) = 0u;
    *(_OWORD *)(result + 2392) = 0u;
    *(_OWORD *)(result + 2360) = 0u;
    *(_OWORD *)(result + 2344) = 0u;
    *(_OWORD *)(result + 2328) = 0u;
    *(_OWORD *)(result + 2312) = 0u;
    *(_OWORD *)(result + 2296) = 0u;
    *(_OWORD *)(result + 2280) = 0u;
    *(_OWORD *)(result + 2264) = 0u;
    *(_OWORD *)(result + 2248) = 0u;
    *(_OWORD *)(result + 2232) = 0u;
    *(_OWORD *)(result + 2216) = 0u;
    *(_OWORD *)(result + 2200) = 0u;
    *(_OWORD *)(result + 2184) = 0u;
    *(_OWORD *)(result + 2168) = 0u;
    *(_OWORD *)(result + 2152) = 0u;
    *(_OWORD *)(result + 2136) = 0u;
    *(_OWORD *)(result + 2120) = 0u;
    *(_OWORD *)(result + 2104) = 0u;
    *(_OWORD *)(result + 2088) = 0u;
    *(_OWORD *)(result + 2072) = 0u;
    *(_OWORD *)(result + 2056) = 0u;
    *(_OWORD *)(result + 2040) = 0u;
    *(_OWORD *)(result + 2024) = 0u;
    *(_OWORD *)(result + 2008) = 0u;
    *(_OWORD *)(result + 1992) = 0u;
    *(_OWORD *)(result + 1976) = 0u;
    *(_OWORD *)(result + 1960) = 0u;
    *(_OWORD *)(result + 1944) = 0u;
    *(_OWORD *)(result + 1928) = 0u;
    *(_OWORD *)(result + 1912) = 0u;
    *(_OWORD *)(result + 1896) = 0u;
    *(_OWORD *)(result + 1880) = 0u;
    *(_OWORD *)(result + 1864) = 0u;
    *(_OWORD *)(result + 1848) = 0u;
    *(_OWORD *)(result + 1832) = 0u;
    *(_OWORD *)(result + 1816) = 0u;
    *(_OWORD *)(result + 1800) = 0u;
    *(_OWORD *)(result + 1784) = 0u;
    *(_OWORD *)(result + 1768) = 0u;
    *(_OWORD *)(result + 1752) = 0u;
    *(_OWORD *)(result + 1736) = 0u;
    *(_OWORD *)(result + 1720) = 0u;
    *(_OWORD *)(result + 1704) = 0u;
    *(_OWORD *)(result + 1688) = 0u;
    *(_OWORD *)(result + 1672) = 0u;
    *(_OWORD *)(result + 1656) = 0u;
    *(_OWORD *)(result + 1640) = 0u;
    *(_OWORD *)(result + 1624) = 0u;
    *(_OWORD *)(result + 1608) = 0u;
    *(_OWORD *)(result + 1592) = 0u;
    *(_OWORD *)(result + 1576) = 0u;
    *(_OWORD *)(result + 1560) = 0u;
    *(_OWORD *)(result + 1544) = 0u;
    *(_OWORD *)(result + 1528) = 0u;
    *(_OWORD *)(result + 1512) = 0u;
    *(_OWORD *)(result + 1496) = 0u;
    *(_OWORD *)(result + 1480) = 0u;
    *(_OWORD *)(result + 1464) = 0u;
    *(_OWORD *)(result + 1448) = 0u;
    *(_OWORD *)(result + 1432) = 0u;
    *(_OWORD *)(result + 1416) = 0u;
    *(_OWORD *)(result + 1400) = 0u;
    *(_OWORD *)(result + 1384) = 0u;
    *(_OWORD *)(result + 1368) = 0u;
    *(_OWORD *)(result + 1352) = 0u;
    *(_OWORD *)(result + 1336) = 0u;
    *(_OWORD *)(result + 1320) = 0u;
    *(_OWORD *)(result + 1304) = 0u;
    *(_OWORD *)(result + 1288) = 0u;
    *(_OWORD *)(result + 1272) = 0u;
    *(_OWORD *)(result + 1256) = 0u;
    *(_OWORD *)(result + 1240) = 0u;
    *(_OWORD *)(result + 1224) = 0u;
    *(_OWORD *)(result + 1208) = 0u;
    *(_OWORD *)(result + 1192) = 0u;
    *(_OWORD *)(result + 1176) = 0u;
    *(_OWORD *)(result + 1160) = 0u;
    *(_OWORD *)(result + 1144) = 0u;
    *(_OWORD *)(result + 1128) = 0u;
    *(_OWORD *)(result + 1112) = 0u;
    *(_OWORD *)(result + 1096) = 0u;
    *(_OWORD *)(result + 1080) = 0u;
    *(_OWORD *)(result + 1064) = 0u;
    *(_OWORD *)(result + 1048) = 0u;
    *(_OWORD *)(result + 1032) = 0u;
    *(_OWORD *)(result + 1016) = 0u;
    *(_OWORD *)(result + 1000) = 0u;
    *(_OWORD *)(result + 984) = 0u;
    *(_OWORD *)(result + 968) = 0u;
    *(_OWORD *)(result + 952) = 0u;
    *(_OWORD *)(result + 936) = 0u;
    *(_OWORD *)(result + 920) = 0u;
    *(_OWORD *)(result + 904) = 0u;
    *(_OWORD *)(result + 888) = 0u;
    *(_OWORD *)(result + 872) = 0u;
    *(_OWORD *)(result + 856) = 0u;
    *(_OWORD *)(result + 840) = 0u;
    *(_OWORD *)(result + 824) = 0u;
    *(_OWORD *)(result + 808) = 0u;
    *(_OWORD *)(result + 792) = 0u;
    *(_OWORD *)(result + 776) = 0u;
    *(_OWORD *)(result + 760) = 0u;
    *(_OWORD *)(result + 744) = 0u;
    *(_OWORD *)(result + 728) = 0u;
    *(_OWORD *)(result + 712) = 0u;
    *(_OWORD *)(result + 696) = 0u;
    *(_OWORD *)(result + 680) = 0u;
    *(_OWORD *)(result + 664) = 0u;
    *(_OWORD *)(result + 648) = 0u;
    *(_OWORD *)(result + 632) = 0u;
    *(_OWORD *)(result + 616) = 0u;
    *(_OWORD *)(result + 600) = 0u;
    *(_OWORD *)(result + 584) = 0u;
    *(_OWORD *)(result + 568) = 0u;
    *(_OWORD *)(result + 552) = 0u;
    *(_OWORD *)(result + 536) = 0u;
    *(_OWORD *)(result + 520) = 0u;
    *(_OWORD *)(result + 504) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 2408) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 2408) = 0;
    if (a2)
      *(_QWORD *)(result + 888) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ActivityFlexibleUpdateTheme()
{
  return &type metadata for ActivityFlexibleUpdateTheme;
}

uint64_t initializeBufferWithCopyOfBuffer for ActivityFlexibleUpdate.Graphic(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  void (*v29)(_QWORD *, _QWORD, uint64_t, uint64_t);

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v11 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    type metadata accessor for ActivityAsset();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      v8 = sub_242FF4720();
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
      if (EnumCaseMultiPayload == 1)
      {
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257259D40);
        *(_QWORD *)(a1 + *(int *)(v9 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v9 + 28));
        *(_QWORD *)(a1 + *(int *)(v9 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(v9 + 32));
        v10 = type metadata accessor for URLAssetConfiguration.Recipe(0);
        *(_QWORD *)(a1 + *(int *)(v10 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v10 + 20));
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      v12 = *a2;
      v13 = a2[1];
      v14 = *((_BYTE *)a2 + 16);
      sub_242CCC104();
      *(_QWORD *)a1 = v12;
      *(_QWORD *)(a1 + 8) = v13;
      *(_BYTE *)(a1 + 16) = v14;
      *(_WORD *)(a1 + 17) = *(_WORD *)((char *)a2 + 17);
    }
    swift_storeEnumTagMultiPayload();
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_257259D48);
    *(_QWORD *)(a1 + *(int *)(v15 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v15 + 28));
    *(_QWORD *)(a1 + *(int *)(v15 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(v15 + 32));
    v16 = *(int *)(a3 + 24);
    *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
    v17 = (_QWORD *)(a1 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543B9D80);
    v20 = *(_QWORD *)(v19 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
    {
      v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_257259D50);
      memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        type metadata accessor for URLAssetConfiguration.Format(0);
        v22 = swift_getEnumCaseMultiPayload();
        v23 = sub_242FF4720();
        (*(void (**)(_QWORD *, uint64_t *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v17, v18, v23);
        if (v22 == 1)
        {
          v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_257259D40);
          *(_QWORD *)((char *)v17 + *(int *)(v24 + 28)) = *(uint64_t *)((char *)v18 + *(int *)(v24 + 28));
          *(_QWORD *)((char *)v17 + *(int *)(v24 + 32)) = *(uint64_t *)((char *)v18 + *(int *)(v24 + 32));
          v25 = type metadata accessor for URLAssetConfiguration.Recipe(0);
          *(_QWORD *)((char *)v17 + *(int *)(v25 + 20)) = *(uint64_t *)((char *)v18 + *(int *)(v25 + 20));
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        v26 = *v18;
        v27 = v18[1];
        v28 = *((_BYTE *)v18 + 16);
        sub_242CCC104();
        *v17 = v26;
        v17[1] = v27;
        *((_BYTE *)v17 + 16) = v28;
        *(_WORD *)((char *)v17 + 17) = *(_WORD *)((char *)v18 + 17);
      }
      swift_storeEnumTagMultiPayload();
      *(_QWORD *)((char *)v17 + *(int *)(v15 + 28)) = *(uint64_t *)((char *)v18 + *(int *)(v15 + 28));
      *(_QWORD *)((char *)v17 + *(int *)(v15 + 32)) = *(uint64_t *)((char *)v18 + *(int *)(v15 + 32));
      v29 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v20 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v29(v17, 0, 1, v19);
    }
  }
  return a1;
}

uint64_t destroy for ActivityFlexibleUpdate.Graphic(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  int v9;
  uint64_t v10;

  type metadata accessor for ActivityAsset();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    type metadata accessor for URLAssetConfiguration.Format(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v5 = sub_242FF4720();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
    if (EnumCaseMultiPayload == 1)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_257259D40);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      type metadata accessor for URLAssetConfiguration.Recipe(0);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_242CCCA54();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257259D48);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v6 = a1 + *(int *)(a2 + 24);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543B9D80);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7);
  if (!(_DWORD)result)
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      v9 = swift_getEnumCaseMultiPayload();
      v10 = sub_242FF4720();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v6, v10);
      if (v9 == 1)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_257259D40);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        type metadata accessor for URLAssetConfiguration.Recipe(0);
        swift_bridgeObjectRelease();
      }
    }
    else
    {
      sub_242CCCA54();
    }
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for ActivityFlexibleUpdate.Graphic(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  void (*v27)(_QWORD *, _QWORD, uint64_t, uint64_t);

  type metadata accessor for ActivityAsset();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    type metadata accessor for URLAssetConfiguration.Format(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v7 = sub_242FF4720();
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    if (EnumCaseMultiPayload == 1)
    {
      v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257259D40);
      *(_QWORD *)(a1 + *(int *)(v8 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 28));
      *(_QWORD *)(a1 + *(int *)(v8 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 32));
      v9 = type metadata accessor for URLAssetConfiguration.Recipe(0);
      *(_QWORD *)(a1 + *(int *)(v9 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v9 + 20));
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    v10 = *a2;
    v11 = a2[1];
    v12 = *((_BYTE *)a2 + 16);
    sub_242CCC104();
    *(_QWORD *)a1 = v10;
    *(_QWORD *)(a1 + 8) = v11;
    *(_BYTE *)(a1 + 16) = v12;
    *(_WORD *)(a1 + 17) = *(_WORD *)((char *)a2 + 17);
  }
  swift_storeEnumTagMultiPayload();
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257259D48);
  *(_QWORD *)(a1 + *(int *)(v13 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v13 + 28));
  *(_QWORD *)(a1 + *(int *)(v13 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(v13 + 32));
  v14 = *(int *)(a3 + 24);
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  v15 = (_QWORD *)(a1 + v14);
  v16 = (uint64_t *)((char *)a2 + v14);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543B9D80);
  v18 = *(_QWORD *)(v17 - 8);
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_257259D50);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      v20 = swift_getEnumCaseMultiPayload();
      v21 = sub_242FF4720();
      (*(void (**)(_QWORD *, uint64_t *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v15, v16, v21);
      if (v20 == 1)
      {
        v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_257259D40);
        *(_QWORD *)((char *)v15 + *(int *)(v22 + 28)) = *(uint64_t *)((char *)v16 + *(int *)(v22 + 28));
        *(_QWORD *)((char *)v15 + *(int *)(v22 + 32)) = *(uint64_t *)((char *)v16 + *(int *)(v22 + 32));
        v23 = type metadata accessor for URLAssetConfiguration.Recipe(0);
        *(_QWORD *)((char *)v15 + *(int *)(v23 + 20)) = *(uint64_t *)((char *)v16 + *(int *)(v23 + 20));
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      v24 = *v16;
      v25 = v16[1];
      v26 = *((_BYTE *)v16 + 16);
      sub_242CCC104();
      *v15 = v24;
      v15[1] = v25;
      *((_BYTE *)v15 + 16) = v26;
      *(_WORD *)((char *)v15 + 17) = *(_WORD *)((char *)v16 + 17);
    }
    swift_storeEnumTagMultiPayload();
    *(_QWORD *)((char *)v15 + *(int *)(v13 + 28)) = *(uint64_t *)((char *)v16 + *(int *)(v13 + 28));
    *(_QWORD *)((char *)v15 + *(int *)(v13 + 32)) = *(uint64_t *)((char *)v16 + *(int *)(v13 + 32));
    v27 = *(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v18 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v27(v15, 0, 1, v17);
  }
  return a1;
}

uint64_t assignWithCopy for ActivityFlexibleUpdate.Graphic(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int EnumCaseMultiPayload;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t, uint64_t);
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  void (*v34)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  char v37;

  if ((uint64_t *)a1 != a2)
  {
    sub_242CC8E20(a1, (uint64_t (*)(_QWORD))type metadata accessor for ActivityAsset);
    type metadata accessor for ActivityAsset();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      v7 = sub_242FF4720();
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      if (EnumCaseMultiPayload == 1)
      {
        v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257259D40);
        *(_QWORD *)(a1 + *(int *)(v8 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 28));
        *(_QWORD *)(a1 + *(int *)(v8 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(v8 + 32));
        v9 = type metadata accessor for URLAssetConfiguration.Recipe(0);
        *(_QWORD *)(a1 + *(int *)(v9 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(v9 + 20));
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      v10 = *a2;
      v11 = a2[1];
      v12 = *((_BYTE *)a2 + 16);
      sub_242CCC104();
      *(_QWORD *)a1 = v10;
      *(_QWORD *)(a1 + 8) = v11;
      *(_BYTE *)(a1 + 16) = v12;
      *(_BYTE *)(a1 + 17) = *((_BYTE *)a2 + 17);
      *(_BYTE *)(a1 + 18) = *((_BYTE *)a2 + 18);
    }
    swift_storeEnumTagMultiPayload();
  }
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_257259D48);
  *(_QWORD *)(a1 + *(int *)(v13 + 28)) = *(uint64_t *)((char *)a2 + *(int *)(v13 + 28));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + *(int *)(v13 + 32)) = *(uint64_t *)((char *)a2 + *(int *)(v13 + 32));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + *(int *)(a3 + 20)) = *((_BYTE *)a2 + *(int *)(a3 + 20));
  v14 = *(int *)(a3 + 24);
  v15 = a1 + v14;
  v16 = (uint64_t *)((char *)a2 + v14);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543B9D80);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v18 + 48);
  v20 = v19(v15, 1, v17);
  v21 = v19((uint64_t)v16, 1, v17);
  if (v20)
  {
    if (!v21)
    {
      type metadata accessor for ActivityAsset();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        type metadata accessor for URLAssetConfiguration.Format(0);
        v22 = swift_getEnumCaseMultiPayload();
        v23 = sub_242FF4720();
        (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v15, v16, v23);
        if (v22 == 1)
        {
          v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_257259D40);
          *(_QWORD *)(v15 + *(int *)(v24 + 28)) = *(uint64_t *)((char *)v16 + *(int *)(v24 + 28));
          *(_QWORD *)(v15 + *(int *)(v24 + 32)) = *(uint64_t *)((char *)v16 + *(int *)(v24 + 32));
          v25 = type metadata accessor for URLAssetConfiguration.Recipe(0);
          *(_QWORD *)(v15 + *(int *)(v25 + 20)) = *(uint64_t *)((char *)v16 + *(int *)(v25 + 20));
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
        }
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        v31 = *v16;
        v32 = v16[1];
        v33 = *((_BYTE *)v16 + 16);
        sub_242CCC104();
        *(_QWORD *)v15 = v31;
        *(_QWORD *)(v15 + 8) = v32;
        *(_BYTE *)(v15 + 16) = v33;
        *(_BYTE *)(v15 + 17) = *((_BYTE *)v16 + 17);
        *(_BYTE *)(v15 + 18) = *((_BYTE *)v16 + 18);
      }
      swift_storeEnumTagMultiPayload();
      *(_QWORD *)(v15 + *(int *)(v13 + 28)) = *(uint64_t *)((char *)v16 + *(int *)(v13 + 28));
      *(_QWORD *)(v15 + *(int *)(v13 + 32)) = *(uint64_t *)((char *)v16 + *(int *)(v13 + 32));
      v34 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v34(v15, 0, 1, v17);
      return a1;
    }
LABEL_15:
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_257259D50);
    memcpy((void *)v15, v16, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    return a1;
  }
  if (v21)
  {
    sub_242CBBA7C(v15, &qword_2543B9D80);
    goto LABEL_15;
  }
  if ((uint64_t *)a1 != a2)
  {
    sub_242CC8E20(v15, (uint64_t (*)(_QWORD))type metadata accessor for ActivityAsset);
    type metadata accessor for ActivityAsset();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      v27 = swift_getEnumCaseMultiPayload();
      v28 = sub_242FF4720();
      (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v15, v16, v28);
      if (v27 == 1)
      {
        v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_257259D40);
        *(_QWORD *)(v15 + *(int *)(v29 + 28)) = *(uint64_t *)((char *)v16 + *(int *)(v29 + 28));
        *(_QWORD *)(v15 + *(int *)(v29 + 32)) = *(uint64_t *)((char *)v16 + *(int *)(v29 + 32));
        v30 = type metadata accessor for URLAssetConfiguration.Recipe(0);
        *(_QWORD *)(v15 + *(int *)(v30 + 20)) = *(uint64_t *)((char *)v16 + *(int *)(v30 + 20));
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      v35 = *v16;
      v36 = v16[1];
      v37 = *((_BYTE *)v16 + 16);
      sub_242CCC104();
      *(_QWORD *)v15 = v35;
      *(_QWORD *)(v15 + 8) = v36;
      *(_BYTE *)(v15 + 16) = v37;
      *(_BYTE *)(v15 + 17) = *((_BYTE *)v16 + 17);
      *(_BYTE *)(v15 + 18) = *((_BYTE *)v16 + 18);
    }
    swift_storeEnumTagMultiPayload();
  }
  *(_QWORD *)(v15 + *(int *)(v13 + 28)) = *(uint64_t *)((char *)v16 + *(int *)(v13 + 28));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v15 + *(int *)(v13 + 32)) = *(uint64_t *)((char *)v16 + *(int *)(v13 + 32));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *initializeWithTake for ActivityFlexibleUpdate.Graphic(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6 = type metadata accessor for ActivityAsset();
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    type metadata accessor for URLAssetConfiguration.Format(0);
    EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    v8 = sub_242FF4720();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    if (EnumCaseMultiPayload == 1)
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257259D40);
      *(_QWORD *)&a1[*(int *)(v9 + 28)] = *(_QWORD *)&a2[*(int *)(v9 + 28)];
      *(_QWORD *)&a1[*(int *)(v9 + 32)] = *(_QWORD *)&a2[*(int *)(v9 + 32)];
      v10 = type metadata accessor for URLAssetConfiguration.Recipe(0);
      *(_QWORD *)&a1[*(int *)(v10 + 20)] = *(_QWORD *)&a2[*(int *)(v10 + 20)];
    }
    swift_storeEnumTagMultiPayload();
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257259D48);
  *(_QWORD *)&a1[*(int *)(v11 + 28)] = *(_QWORD *)&a2[*(int *)(v11 + 28)];
  *(_QWORD *)&a1[*(int *)(v11 + 32)] = *(_QWORD *)&a2[*(int *)(v11 + 32)];
  v12 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543B9D80);
  v16 = *(_QWORD *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_257259D50);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      v18 = swift_getEnumCaseMultiPayload();
      v19 = sub_242FF4720();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v13, v14, v19);
      if (v18 == 1)
      {
        v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_257259D40);
        *(_QWORD *)&v13[*(int *)(v20 + 28)] = *(_QWORD *)&v14[*(int *)(v20 + 28)];
        *(_QWORD *)&v13[*(int *)(v20 + 32)] = *(_QWORD *)&v14[*(int *)(v20 + 32)];
        v21 = type metadata accessor for URLAssetConfiguration.Recipe(0);
        *(_QWORD *)&v13[*(int *)(v21 + 20)] = *(_QWORD *)&v14[*(int *)(v21 + 20)];
      }
      swift_storeEnumTagMultiPayload();
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    *(_QWORD *)&v13[*(int *)(v11 + 28)] = *(_QWORD *)&v14[*(int *)(v11 + 28)];
    *(_QWORD *)&v13[*(int *)(v11 + 32)] = *(_QWORD *)&v14[*(int *)(v11 + 32)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  }
  return a1;
}

char *assignWithTake for ActivityFlexibleUpdate.Graphic(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  int EnumCaseMultiPayload;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  if (a1 != a2)
  {
    sub_242CC8E20((uint64_t)a1, (uint64_t (*)(_QWORD))type metadata accessor for ActivityAsset);
    v6 = type metadata accessor for ActivityAsset();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
      v8 = sub_242FF4720();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
      if (EnumCaseMultiPayload == 1)
      {
        v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257259D40);
        *(_QWORD *)&a1[*(int *)(v9 + 28)] = *(_QWORD *)&a2[*(int *)(v9 + 28)];
        *(_QWORD *)&a1[*(int *)(v9 + 32)] = *(_QWORD *)&a2[*(int *)(v9 + 32)];
        v10 = type metadata accessor for URLAssetConfiguration.Recipe(0);
        *(_QWORD *)&a1[*(int *)(v10 + 20)] = *(_QWORD *)&a2[*(int *)(v10 + 20)];
      }
      swift_storeEnumTagMultiPayload();
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257259D48);
  *(_QWORD *)&a1[*(int *)(v11 + 28)] = *(_QWORD *)&a2[*(int *)(v11 + 28)];
  swift_bridgeObjectRelease();
  *(_QWORD *)&a1[*(int *)(v11 + 32)] = *(_QWORD *)&a2[*(int *)(v11 + 32)];
  swift_bridgeObjectRelease();
  v12 = *(int *)(a3 + 24);
  a1[*(int *)(a3 + 20)] = a2[*(int *)(a3 + 20)];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543B9D80);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      v20 = type metadata accessor for ActivityAsset();
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        type metadata accessor for URLAssetConfiguration.Format(0);
        v21 = swift_getEnumCaseMultiPayload();
        v22 = sub_242FF4720();
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v13, v14, v22);
        if (v21 == 1)
        {
          v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_257259D40);
          *(_QWORD *)&v13[*(int *)(v23 + 28)] = *(_QWORD *)&v14[*(int *)(v23 + 28)];
          *(_QWORD *)&v13[*(int *)(v23 + 32)] = *(_QWORD *)&v14[*(int *)(v23 + 32)];
          v24 = type metadata accessor for URLAssetConfiguration.Recipe(0);
          *(_QWORD *)&v13[*(int *)(v24 + 20)] = *(_QWORD *)&v14[*(int *)(v24 + 20)];
        }
        swift_storeEnumTagMultiPayload();
        swift_storeEnumTagMultiPayload();
      }
      else
      {
        memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
      }
      *(_QWORD *)&v13[*(int *)(v11 + 28)] = *(_QWORD *)&v14[*(int *)(v11 + 28)];
      *(_QWORD *)&v13[*(int *)(v11 + 32)] = *(_QWORD *)&v14[*(int *)(v11 + 32)];
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      return a1;
    }
LABEL_14:
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_257259D50);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    return a1;
  }
  if (v19)
  {
    sub_242CBBA7C((uint64_t)v13, &qword_2543B9D80);
    goto LABEL_14;
  }
  if (a1 != a2)
  {
    sub_242CC8E20((uint64_t)v13, (uint64_t (*)(_QWORD))type metadata accessor for ActivityAsset);
    v26 = type metadata accessor for ActivityAsset();
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      type metadata accessor for URLAssetConfiguration.Format(0);
      v27 = swift_getEnumCaseMultiPayload();
      v28 = sub_242FF4720();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v28 - 8) + 32))(v13, v14, v28);
      if (v27 == 1)
      {
        v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_257259D40);
        *(_QWORD *)&v13[*(int *)(v29 + 28)] = *(_QWORD *)&v14[*(int *)(v29 + 28)];
        *(_QWORD *)&v13[*(int *)(v29 + 32)] = *(_QWORD *)&v14[*(int *)(v29 + 32)];
        v30 = type metadata accessor for URLAssetConfiguration.Recipe(0);
        *(_QWORD *)&v13[*(int *)(v30 + 20)] = *(_QWORD *)&v14[*(int *)(v30 + 20)];
      }
      swift_storeEnumTagMultiPayload();
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
    }
  }
  *(_QWORD *)&v13[*(int *)(v11 + 28)] = *(_QWORD *)&v14[*(int *)(v11 + 28)];
  swift_bridgeObjectRelease();
  *(_QWORD *)&v13[*(int *)(v11 + 32)] = *(_QWORD *)&v14[*(int *)(v11 + 32)];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ActivityFlexibleUpdate.Graphic()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_242FEF094(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2543B9D80);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  if ((_DWORD)a2 == 253)
  {
    v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20));
    if (v9 >= 3)
      return v9 - 2;
    else
      return 0;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257259D50);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ActivityFlexibleUpdate.Graphic()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_242FEF148(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2543B9D80);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 253)
    {
      *(_BYTE *)(a1 + *(int *)(a4 + 20)) = a2 + 2;
      return result;
    }
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257259D50);
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_242FEF1F0()
{
  unint64_t v0;
  unint64_t v1;

  sub_242FEF294(319, qword_2543BA030, (uint64_t (*)(uint64_t))type metadata accessor for ActivityAsset, (uint64_t (*)(uint64_t, uint64_t))type metadata accessor for Dynamic.Variant);
  if (v0 <= 0x3F)
  {
    sub_242CC7674();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_242FEF294(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

ValueMetadata *type metadata accessor for ActivityFlexibleUpdate.GraphicSize()
{
  return &type metadata for ActivityFlexibleUpdate.GraphicSize;
}

uint64_t destroy for ActivityFlexibleUpdateTheme.Graphic(uint64_t result)
{
  uint64_t v1;
  unsigned int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = result;
  v2 = (unsigned int *)(result + 328);
  v3 = *(_QWORD *)(result + 72);
  if (v3)
  {
    if (v3 == 1)
      goto LABEL_7;
    if (v3 == 2)
      goto LABEL_12;
    sub_242CCCA5C(*(_QWORD *)result, *(_QWORD *)(result + 8), *(_QWORD *)(result + 16), *(_QWORD *)(result + 24), *(_QWORD *)(result + 32), *(_QWORD *)(result + 40), *(_QWORD *)(result + 48), *(_QWORD *)(result + 56), *(unsigned int *)(result + 64) | ((unint64_t)*(unsigned __int8 *)(result + 68) << 32));
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  if (*(_QWORD *)(v1 + 160))
  {
    sub_242CCCA5C(*(_QWORD *)(v1 + 88), *(_QWORD *)(v1 + 96), *(_QWORD *)(v1 + 104), *(_QWORD *)(v1 + 112), *(_QWORD *)(v1 + 120), *(_QWORD *)(v1 + 128), *(_QWORD *)(v1 + 136), *(_QWORD *)(v1 + 144), *(unsigned int *)(v1 + 152) | ((unint64_t)*(unsigned __int8 *)(v1 + 156) << 32));
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
LABEL_7:
  v4 = *(_QWORD *)(v1 + 248);
  if (v4)
  {
    if (v4 == 1)
      goto LABEL_12;
    sub_242CCCA5C(*(_QWORD *)(v1 + 176), *(_QWORD *)(v1 + 184), *(_QWORD *)(v1 + 192), *(_QWORD *)(v1 + 200), *(_QWORD *)(v1 + 208), *(_QWORD *)(v1 + 216), *(_QWORD *)(v1 + 224), *(_QWORD *)(v1 + 232), *(unsigned int *)(v1 + 240) | ((unint64_t)*(unsigned __int8 *)(v1 + 244) << 32));
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  if (*(_QWORD *)(v1 + 336))
  {
    sub_242CCCA5C(*(_QWORD *)(v1 + 264), *(_QWORD *)(v1 + 272), *(_QWORD *)(v1 + 280), *(_QWORD *)(v1 + 288), *(_QWORD *)(v1 + 296), *(_QWORD *)(v1 + 304), *(_QWORD *)(v1 + 312), *(_QWORD *)(v1 + 320), *v2 | ((unint64_t)*((unsigned __int8 *)v2 + 4) << 32));
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
LABEL_12:
  v5 = *(_QWORD *)(v1 + 424);
  if (v5)
  {
    if (v5 == 1)
      goto LABEL_18;
    if (v5 == 2)
      return result;
    sub_242CCCA5C(*(_QWORD *)(v1 + 352), *(_QWORD *)(v1 + 360), *(_QWORD *)(v1 + 368), *(_QWORD *)(v1 + 376), *(_QWORD *)(v1 + 384), *(_QWORD *)(v1 + 392), *(_QWORD *)(v1 + 400), *(_QWORD *)(v1 + 408), v2[22] | ((unint64_t)*((unsigned __int8 *)v2 + 92) << 32));
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  if (*(_QWORD *)(v1 + 512))
  {
    sub_242CCCA5C(*(_QWORD *)(v1 + 440), *(_QWORD *)(v1 + 448), *(_QWORD *)(v1 + 456), *(_QWORD *)(v1 + 464), *(_QWORD *)(v1 + 472), *(_QWORD *)(v1 + 480), *(_QWORD *)(v1 + 488), *(_QWORD *)(v1 + 496), v2[44] | ((unint64_t)*((unsigned __int8 *)v2 + 180) << 32));
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
LABEL_18:
  v6 = *(_QWORD *)(v1 + 600);
  if (v6)
  {
    if (v6 == 1)
      return result;
    sub_242CCCA5C(*(_QWORD *)(v1 + 528), *(_QWORD *)(v1 + 536), *(_QWORD *)(v1 + 544), *(_QWORD *)(v1 + 552), *(_QWORD *)(v1 + 560), *(_QWORD *)(v1 + 568), *(_QWORD *)(v1 + 576), *(_QWORD *)(v1 + 584), v2[66] | ((unint64_t)*((unsigned __int8 *)v2 + 268) << 32));
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  if (*(_QWORD *)(v1 + 688))
  {
    sub_242CCCA5C(*(_QWORD *)(v1 + 616), *(_QWORD *)(v1 + 624), *(_QWORD *)(v1 + 632), *(_QWORD *)(v1 + 640), *(_QWORD *)(v1 + 648), *(_QWORD *)(v1 + 656), *(_QWORD *)(v1 + 664), *(_QWORD *)(v1 + 672), v2[88] | ((unint64_t)*((unsigned __int8 *)v2 + 356) << 32));
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

_OWORD *initializeWithCopy for ActivityFlexibleUpdateTheme.Graphic(_OWORD *__dst, char *__src)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
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
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  _OWORD *v32;
  _OWORD *v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
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
  __int128 v60;
  __int128 v61;
  _OWORD *v62;
  _OWORD *v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  _OWORD *v91;
  _OWORD *v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  __int128 v117;
  __int128 v118;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unsigned int *v135;
  uint64_t v136;
  char *v137;

  v135 = (unsigned int *)(__src + 328);
  v137 = (char *)__dst + 328;
  v4 = *((_QWORD *)__src + 9);
  switch(v4)
  {
    case 0:
      v5 = *((_OWORD *)__src + 3);
      __dst[2] = *((_OWORD *)__src + 2);
      __dst[3] = v5;
      __dst[4] = *((_OWORD *)__src + 4);
      *((_QWORD *)__dst + 10) = *((_QWORD *)__src + 10);
      v6 = *((_OWORD *)__src + 1);
      *__dst = *(_OWORD *)__src;
      __dst[1] = v6;
      if (!*((_QWORD *)__src + 20))
        goto LABEL_9;
LABEL_6:
      v7 = *((_QWORD *)__src + 11);
      v8 = *((_QWORD *)__src + 12);
      v9 = *((_QWORD *)__src + 13);
      v10 = *((_QWORD *)__src + 14);
      v11 = *((_QWORD *)__src + 15);
      v12 = *((_QWORD *)__src + 16);
      v13 = *((_QWORD *)__src + 17);
      v14 = *((_QWORD *)__src + 18);
      v120 = __src[156];
      v127 = *((unsigned int *)__src + 38);
      sub_242CCC10C(v7, v8, v9, v10, v11, v12, v13, v14, v127 | (v120 << 32));
      *((_QWORD *)__dst + 11) = v7;
      *((_QWORD *)__dst + 12) = v8;
      *((_QWORD *)__dst + 13) = v9;
      *((_QWORD *)__dst + 14) = v10;
      *((_QWORD *)__dst + 15) = v11;
      *((_QWORD *)__dst + 16) = v12;
      *((_QWORD *)__dst + 17) = v13;
      *((_QWORD *)__dst + 18) = v14;
      *((_BYTE *)__dst + 156) = v120;
      *((_DWORD *)__dst + 38) = v127;
      v15 = *((_QWORD *)__src + 21);
      *((_QWORD *)__dst + 20) = *((_QWORD *)__src + 20);
      *((_QWORD *)__dst + 21) = v15;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_10;
    case 1:
      v16 = *((_OWORD *)__src + 9);
      __dst[8] = *((_OWORD *)__src + 8);
      __dst[9] = v16;
      __dst[10] = *((_OWORD *)__src + 10);
      v17 = *((_OWORD *)__src + 5);
      __dst[4] = *((_OWORD *)__src + 4);
      __dst[5] = v17;
      v18 = *((_OWORD *)__src + 7);
      __dst[6] = *((_OWORD *)__src + 6);
      __dst[7] = v18;
      v19 = *((_OWORD *)__src + 1);
      *__dst = *(_OWORD *)__src;
      __dst[1] = v19;
      v20 = *((_OWORD *)__src + 3);
      __dst[2] = *((_OWORD *)__src + 2);
      __dst[3] = v20;
      goto LABEL_10;
    case 2:
      memcpy(__dst, __src, 0x160uLL);
      goto LABEL_17;
  }
  v21 = *(_QWORD *)__src;
  v22 = *((_QWORD *)__src + 1);
  v23 = *((_QWORD *)__src + 2);
  v24 = *((_QWORD *)__src + 3);
  v25 = *((_QWORD *)__src + 4);
  v26 = *((_QWORD *)__src + 5);
  v27 = *((_QWORD *)__src + 6);
  v28 = *((_QWORD *)__src + 7);
  v121 = __src[68];
  v128 = *((unsigned int *)__src + 16);
  sub_242CCC10C(*(_QWORD *)__src, v22, v23, v24, v25, v26, v27, v28, v128 | (v121 << 32));
  *(_QWORD *)__dst = v21;
  *((_QWORD *)__dst + 1) = v22;
  *((_QWORD *)__dst + 2) = v23;
  *((_QWORD *)__dst + 3) = v24;
  *((_QWORD *)__dst + 4) = v25;
  *((_QWORD *)__dst + 5) = v26;
  *((_QWORD *)__dst + 6) = v27;
  *((_QWORD *)__dst + 7) = v28;
  *((_BYTE *)__dst + 68) = v121;
  *((_DWORD *)__dst + 16) = v128;
  v29 = *((_QWORD *)__src + 10);
  *((_QWORD *)__dst + 9) = *((_QWORD *)__src + 9);
  *((_QWORD *)__dst + 10) = v29;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (*((_QWORD *)__src + 20))
    goto LABEL_6;
LABEL_9:
  v30 = *(_OWORD *)(__src + 136);
  *(_OWORD *)((char *)__dst + 120) = *(_OWORD *)(__src + 120);
  *(_OWORD *)((char *)__dst + 136) = v30;
  *(_OWORD *)((char *)__dst + 152) = *(_OWORD *)(__src + 152);
  *((_QWORD *)__dst + 21) = *((_QWORD *)__src + 21);
  v31 = *(_OWORD *)(__src + 104);
  *(_OWORD *)((char *)__dst + 88) = *(_OWORD *)(__src + 88);
  *(_OWORD *)((char *)__dst + 104) = v31;
LABEL_10:
  v32 = __dst + 11;
  v33 = __src + 176;
  v34 = *((_QWORD *)__src + 31);
  if (v34)
  {
    if (v34 == 1)
    {
      v35 = *((_OWORD *)__src + 20);
      __dst[19] = *((_OWORD *)__src + 19);
      __dst[20] = v35;
      __dst[21] = *((_OWORD *)__src + 21);
      v36 = *((_OWORD *)__src + 16);
      __dst[15] = *((_OWORD *)__src + 15);
      __dst[16] = v36;
      v37 = *((_OWORD *)__src + 18);
      __dst[17] = *((_OWORD *)__src + 17);
      __dst[18] = v37;
      v38 = *((_OWORD *)__src + 12);
      *v32 = *v33;
      __dst[12] = v38;
      v39 = *((_OWORD *)__src + 14);
      __dst[13] = *((_OWORD *)__src + 13);
      __dst[14] = v39;
      goto LABEL_17;
    }
    v51 = *((_QWORD *)__src + 22);
    v52 = *((_QWORD *)__src + 23);
    v53 = *((_QWORD *)__src + 24);
    v54 = *((_QWORD *)__src + 25);
    v55 = *((_QWORD *)__src + 26);
    v56 = *((_QWORD *)__src + 27);
    v57 = *((_QWORD *)__src + 28);
    v58 = *((_QWORD *)__src + 29);
    v123 = __src[244];
    v130 = *((unsigned int *)__src + 60);
    sub_242CCC10C(v51, v52, v53, v54, v55, v56, v57, v58, v130 | (v123 << 32));
    *((_QWORD *)__dst + 22) = v51;
    *((_QWORD *)__dst + 23) = v52;
    *((_QWORD *)__dst + 24) = v53;
    *((_QWORD *)__dst + 25) = v54;
    *((_QWORD *)__dst + 26) = v55;
    *((_QWORD *)__dst + 27) = v56;
    *((_QWORD *)__dst + 28) = v57;
    *((_QWORD *)__dst + 29) = v58;
    *((_BYTE *)__dst + 244) = v123;
    *((_DWORD *)__dst + 60) = v130;
    v59 = *((_QWORD *)__src + 32);
    *((_QWORD *)__dst + 31) = *((_QWORD *)__src + 31);
    *((_QWORD *)__dst + 32) = v59;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (!*((_QWORD *)__src + 42))
      goto LABEL_16;
LABEL_14:
    v42 = *((_QWORD *)__src + 33);
    v43 = *((_QWORD *)__src + 34);
    v44 = *((_QWORD *)__src + 35);
    v45 = *((_QWORD *)__src + 36);
    v46 = *((_QWORD *)__src + 37);
    v47 = *((_QWORD *)__src + 38);
    v48 = *((_QWORD *)__src + 39);
    v49 = *((_QWORD *)__src + 40);
    v122 = *((unsigned __int8 *)v135 + 4);
    v129 = *v135;
    sub_242CCC10C(v42, v43, v44, v45, v46, v47, v48, v49, v129 | (v122 << 32));
    *((_QWORD *)__dst + 33) = v42;
    *((_QWORD *)__dst + 34) = v43;
    *((_QWORD *)__dst + 35) = v44;
    *((_QWORD *)__dst + 36) = v45;
    *((_QWORD *)__dst + 37) = v46;
    *((_QWORD *)__dst + 38) = v47;
    *((_QWORD *)__dst + 39) = v48;
    *((_QWORD *)__dst + 40) = v49;
    v137[4] = v122;
    *(_DWORD *)v137 = v129;
    v50 = *((_QWORD *)__src + 43);
    *((_QWORD *)__dst + 42) = *((_QWORD *)__src + 42);
    *((_QWORD *)__dst + 43) = v50;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_17;
  }
  v40 = *((_OWORD *)__src + 14);
  __dst[13] = *((_OWORD *)__src + 13);
  __dst[14] = v40;
  __dst[15] = *((_OWORD *)__src + 15);
  *((_QWORD *)__dst + 32) = *((_QWORD *)__src + 32);
  v41 = *((_OWORD *)__src + 12);
  *v32 = *v33;
  __dst[12] = v41;
  if (*((_QWORD *)__src + 42))
    goto LABEL_14;
LABEL_16:
  v60 = *(_OWORD *)(__src + 312);
  *(_OWORD *)((char *)__dst + 296) = *(_OWORD *)(__src + 296);
  *(_OWORD *)((char *)__dst + 312) = v60;
  *(_OWORD *)((char *)__dst + 328) = *(_OWORD *)(__src + 328);
  *((_QWORD *)__dst + 43) = *((_QWORD *)__src + 43);
  v61 = *(_OWORD *)(__src + 280);
  *(_OWORD *)((char *)__dst + 264) = *(_OWORD *)(__src + 264);
  *(_OWORD *)((char *)__dst + 280) = v61;
LABEL_17:
  v62 = __dst + 22;
  v63 = __src + 352;
  v64 = *((_QWORD *)__src + 53);
  if (!v64)
  {
    v65 = *((_OWORD *)__src + 25);
    __dst[24] = *((_OWORD *)__src + 24);
    __dst[25] = v65;
    __dst[26] = *((_OWORD *)__src + 26);
    *((_QWORD *)__dst + 54) = *((_QWORD *)__src + 54);
    v66 = *((_OWORD *)__src + 23);
    *v62 = *v63;
    __dst[23] = v66;
    if (!*((_QWORD *)__src + 64))
    {
LABEL_25:
      v89 = *(_OWORD *)(__src + 488);
      *(_OWORD *)((char *)__dst + 472) = *(_OWORD *)(__src + 472);
      *(_OWORD *)((char *)__dst + 488) = v89;
      *(_OWORD *)((char *)__dst + 504) = *(_OWORD *)(__src + 504);
      *((_QWORD *)__dst + 65) = *((_QWORD *)__src + 65);
      v90 = *(_OWORD *)(__src + 456);
      *(_OWORD *)((char *)__dst + 440) = *(_OWORD *)(__src + 440);
      *(_OWORD *)((char *)__dst + 456) = v90;
LABEL_26:
      v91 = __dst + 33;
      v92 = __src + 528;
      v93 = *((_QWORD *)__src + 75);
      if (v93)
      {
        if (v93 == 1)
        {
          v94 = *((_OWORD *)__src + 42);
          __dst[41] = *((_OWORD *)__src + 41);
          __dst[42] = v94;
          __dst[43] = *((_OWORD *)__src + 43);
          v95 = *((_OWORD *)__src + 38);
          __dst[37] = *((_OWORD *)__src + 37);
          __dst[38] = v95;
          v96 = *((_OWORD *)__src + 40);
          __dst[39] = *((_OWORD *)__src + 39);
          __dst[40] = v96;
          v97 = *((_OWORD *)__src + 34);
          *v91 = *v92;
          __dst[34] = v97;
          v98 = *((_OWORD *)__src + 36);
          __dst[35] = *((_OWORD *)__src + 35);
          __dst[36] = v98;
          return __dst;
        }
        v109 = *((_QWORD *)__src + 66);
        v110 = *((_QWORD *)__src + 67);
        v111 = *((_QWORD *)__src + 68);
        v112 = *((_QWORD *)__src + 69);
        v113 = *((_QWORD *)__src + 70);
        v114 = *((_QWORD *)__src + 71);
        v115 = *((_QWORD *)__src + 72);
        v116 = *((_QWORD *)__src + 73);
        v126 = *((unsigned __int8 *)v135 + 268);
        v134 = v135[66];
        sub_242CCC10C(v109, v110, v111, v112, v113, v114, v115, v116, v134 | (v126 << 32));
        *((_QWORD *)__dst + 66) = v109;
        *((_QWORD *)__dst + 67) = v110;
        *((_QWORD *)__dst + 68) = v111;
        *((_QWORD *)__dst + 69) = v112;
        *((_QWORD *)__dst + 70) = v113;
        *((_QWORD *)__dst + 71) = v114;
        *((_QWORD *)__dst + 72) = v115;
        *((_QWORD *)__dst + 73) = v116;
        v137[268] = v126;
        *((_DWORD *)v137 + 66) = v134;
        *((_QWORD *)__dst + 75) = *((_QWORD *)__src + 75);
        *((_QWORD *)__dst + 76) = *((_QWORD *)__src + 76);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (!*((_QWORD *)__src + 86))
        {
LABEL_32:
          v117 = *(_OWORD *)(__src + 664);
          *(_OWORD *)((char *)__dst + 648) = *(_OWORD *)(__src + 648);
          *(_OWORD *)((char *)__dst + 664) = v117;
          *(_OWORD *)((char *)__dst + 680) = *(_OWORD *)(__src + 680);
          *((_QWORD *)__dst + 87) = *((_QWORD *)__src + 87);
          v118 = *(_OWORD *)(__src + 632);
          *(_OWORD *)((char *)__dst + 616) = *(_OWORD *)(__src + 616);
          *(_OWORD *)((char *)__dst + 632) = v118;
          return __dst;
        }
      }
      else
      {
        v99 = *((_OWORD *)__src + 36);
        __dst[35] = *((_OWORD *)__src + 35);
        __dst[36] = v99;
        __dst[37] = *((_OWORD *)__src + 37);
        *((_QWORD *)__dst + 76) = *((_QWORD *)__src + 76);
        v100 = *((_OWORD *)__src + 34);
        *v91 = *v92;
        __dst[34] = v100;
        if (!*((_QWORD *)__src + 86))
          goto LABEL_32;
      }
      v101 = *((_QWORD *)__src + 77);
      v102 = *((_QWORD *)__src + 78);
      v103 = *((_QWORD *)__src + 79);
      v104 = *((_QWORD *)__src + 80);
      v105 = *((_QWORD *)__src + 81);
      v106 = *((_QWORD *)__src + 82);
      v107 = *((_QWORD *)__src + 83);
      v108 = *((_QWORD *)__src + 84);
      v133 = *((unsigned __int8 *)v135 + 356);
      v136 = v135[88];
      sub_242CCC10C(v101, v102, v103, v104, v105, v106, v107, v108, v136 | (v133 << 32));
      *((_QWORD *)__dst + 77) = v101;
      *((_QWORD *)__dst + 78) = v102;
      *((_QWORD *)__dst + 79) = v103;
      *((_QWORD *)__dst + 80) = v104;
      *((_QWORD *)__dst + 81) = v105;
      *((_QWORD *)__dst + 82) = v106;
      *((_QWORD *)__dst + 83) = v107;
      *((_QWORD *)__dst + 84) = v108;
      v137[356] = v133;
      *((_DWORD *)v137 + 88) = v136;
      *((_QWORD *)__dst + 86) = *((_QWORD *)__src + 86);
      *((_QWORD *)__dst + 87) = *((_QWORD *)__src + 87);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      return __dst;
    }
LABEL_22:
    v67 = *((_QWORD *)__src + 55);
    v68 = *((_QWORD *)__src + 56);
    v69 = *((_QWORD *)__src + 57);
    v70 = *((_QWORD *)__src + 58);
    v71 = *((_QWORD *)__src + 59);
    v72 = *((_QWORD *)__src + 60);
    v73 = *((_QWORD *)__src + 61);
    v74 = *((_QWORD *)__src + 62);
    v124 = *((unsigned __int8 *)v135 + 180);
    v131 = v135[44];
    sub_242CCC10C(v67, v68, v69, v70, v71, v72, v73, v74, v131 | (v124 << 32));
    *((_QWORD *)__dst + 55) = v67;
    *((_QWORD *)__dst + 56) = v68;
    *((_QWORD *)__dst + 57) = v69;
    *((_QWORD *)__dst + 58) = v70;
    *((_QWORD *)__dst + 59) = v71;
    *((_QWORD *)__dst + 60) = v72;
    *((_QWORD *)__dst + 61) = v73;
    *((_QWORD *)__dst + 62) = v74;
    v137[180] = v124;
    *((_DWORD *)v137 + 44) = v131;
    *((_QWORD *)__dst + 64) = *((_QWORD *)__src + 64);
    *((_QWORD *)__dst + 65) = *((_QWORD *)__src + 65);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_26;
  }
  if (v64 == 1)
  {
    v75 = *((_OWORD *)__src + 31);
    __dst[30] = *((_OWORD *)__src + 30);
    __dst[31] = v75;
    __dst[32] = *((_OWORD *)__src + 32);
    v76 = *((_OWORD *)__src + 27);
    __dst[26] = *((_OWORD *)__src + 26);
    __dst[27] = v76;
    v77 = *((_OWORD *)__src + 29);
    __dst[28] = *((_OWORD *)__src + 28);
    __dst[29] = v77;
    v78 = *((_OWORD *)__src + 23);
    *v62 = *v63;
    __dst[23] = v78;
    v79 = *((_OWORD *)__src + 25);
    __dst[24] = *((_OWORD *)__src + 24);
    __dst[25] = v79;
    goto LABEL_26;
  }
  if (v64 != 2)
  {
    v80 = *((_QWORD *)__src + 44);
    v81 = *((_QWORD *)__src + 45);
    v82 = *((_QWORD *)__src + 46);
    v83 = *((_QWORD *)__src + 47);
    v84 = *((_QWORD *)__src + 48);
    v85 = *((_QWORD *)__src + 49);
    v86 = *((_QWORD *)__src + 50);
    v87 = *((_QWORD *)__src + 51);
    v125 = *((unsigned __int8 *)v135 + 92);
    v132 = v135[22];
    sub_242CCC10C(v80, v81, v82, v83, v84, v85, v86, v87, v132 | (v125 << 32));
    *((_QWORD *)__dst + 44) = v80;
    *((_QWORD *)__dst + 45) = v81;
    *((_QWORD *)__dst + 46) = v82;
    *((_QWORD *)__dst + 47) = v83;
    *((_QWORD *)__dst + 48) = v84;
    *((_QWORD *)__dst + 49) = v85;
    *((_QWORD *)__dst + 50) = v86;
    *((_QWORD *)__dst + 51) = v87;
    v137[92] = v125;
    *((_DWORD *)v137 + 22) = v132;
    v88 = *((_QWORD *)__src + 54);
    *((_QWORD *)__dst + 53) = *((_QWORD *)__src + 53);
    *((_QWORD *)__dst + 54) = v88;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (!*((_QWORD *)__src + 64))
      goto LABEL_25;
    goto LABEL_22;
  }
  memcpy(v62, v63, 0x160uLL);
  return __dst;
}

char *assignWithCopy for ActivityFlexibleUpdateTheme.Graphic(char *__dst, char *__src)
{
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
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
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 *v54;
  __int128 *v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _OWORD *v118;
  _OWORD *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  unint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 *v153;
  __int128 *v154;
  uint64_t v155;
  uint64_t v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  unint64_t v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  _OWORD *v221;
  _OWORD *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  unint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  _OWORD *v249;
  _OWORD *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  _OWORD *v293;
  _OWORD *v294;
  uint64_t v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  unint64_t v332;
  __int128 v333;
  __int128 v334;
  __int128 v335;
  __int128 v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  __int128 v345;
  __int128 v346;
  __int128 v347;
  __int128 v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  __int128 v357;
  __int128 v358;
  __int128 v359;
  __int128 v360;
  __int128 v361;
  __int128 v362;
  __int128 v363;
  __int128 v364;
  __int128 v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  __int128 v371;
  __int128 v372;
  _OWORD *v373;
  _OWORD *v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  unint64_t v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  _OWORD *v401;
  _OWORD *v402;
  uint64_t v403;
  uint64_t v404;
  __int128 v405;
  __int128 v406;
  __int128 v407;
  __int128 v408;
  __int128 v409;
  __int128 v410;
  __int128 v411;
  __int128 v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  __int128 v421;
  __int128 v422;
  __int128 v423;
  __int128 v424;
  __int128 v425;
  __int128 v426;
  __int128 v427;
  __int128 v428;
  __int128 v429;
  __int128 v430;
  __int128 v431;
  __int128 v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  unint64_t v449;
  __int128 v450;
  __int128 v451;
  __int128 v452;
  __int128 v453;
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  __int128 v462;
  __int128 v463;
  __int128 v464;
  __int128 v465;
  __int128 v466;
  __int128 v467;
  __int128 v468;
  __int128 v469;
  __int128 v470;
  __int128 v471;
  __int128 v472;
  __int128 v473;
  __int128 v474;
  __int128 v475;
  __int128 v476;
  __int128 v477;
  _OWORD *v478;
  _OWORD *v479;
  uint64_t v480;
  uint64_t v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  uint64_t v485;
  uint64_t v486;
  uint64_t v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  uint64_t v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t v495;
  uint64_t v496;
  unint64_t v497;
  uint64_t v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t v502;
  uint64_t v503;
  uint64_t v504;
  uint64_t v505;
  __int128 v507;
  __int128 v508;
  __int128 v509;
  __int128 v510;
  __int128 v511;
  __int128 v512;
  __int128 v513;
  __int128 v514;
  uint64_t v515;
  uint64_t v516;
  uint64_t v517;
  uint64_t v518;
  uint64_t v519;
  uint64_t v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t v524;
  uint64_t v525;
  uint64_t v526;
  uint64_t v527;
  uint64_t v528;
  uint64_t v529;
  uint64_t v530;
  uint64_t v531;
  uint64_t v532;
  uint64_t v533;
  uint64_t v534;
  uint64_t v535;
  uint64_t v536;
  uint64_t v537;
  uint64_t v538;
  uint64_t v539;
  uint64_t v540;
  uint64_t v541;
  uint64_t v542;
  uint64_t v543;
  uint64_t v544;
  uint64_t v545;
  uint64_t v546;
  uint64_t v547;
  uint64_t v548;
  uint64_t v549;
  uint64_t v550;
  uint64_t v551;
  uint64_t v552;
  uint64_t v553;
  uint64_t v554;
  uint64_t v555;
  uint64_t v556;
  uint64_t v557;
  uint64_t v558;
  uint64_t v559;
  uint64_t v560;
  uint64_t v561;
  uint64_t v562;
  uint64_t v563;
  unsigned int *v564;
  uint64_t v565;
  unsigned int *v566;

  v564 = (unsigned int *)(__src + 328);
  v566 = (unsigned int *)(__dst + 328);
  v4 = *((_QWORD *)__dst + 9);
  v5 = *((_QWORD *)__src + 9);
  if (v4 == 2)
  {
    if (v5 != 2)
    {
      if (v5)
      {
        if (v5 == 1)
        {
          v6 = *(_OWORD *)__src;
          v7 = *((_OWORD *)__src + 2);
          *((_OWORD *)__dst + 1) = *((_OWORD *)__src + 1);
          *((_OWORD *)__dst + 2) = v7;
          *(_OWORD *)__dst = v6;
          v8 = *((_OWORD *)__src + 3);
          v9 = *((_OWORD *)__src + 4);
          v10 = *((_OWORD *)__src + 6);
          *((_OWORD *)__dst + 5) = *((_OWORD *)__src + 5);
          *((_OWORD *)__dst + 6) = v10;
          *((_OWORD *)__dst + 3) = v8;
          *((_OWORD *)__dst + 4) = v9;
          v11 = *((_OWORD *)__src + 7);
          v12 = *((_OWORD *)__src + 8);
          v13 = *((_OWORD *)__src + 10);
          *((_OWORD *)__dst + 9) = *((_OWORD *)__src + 9);
          *((_OWORD *)__dst + 10) = v13;
          *((_OWORD *)__dst + 7) = v11;
          *((_OWORD *)__dst + 8) = v12;
          goto LABEL_18;
        }
        v42 = *(_QWORD *)__src;
        v43 = *((_QWORD *)__src + 1);
        v44 = *((_QWORD *)__src + 2);
        v45 = *((_QWORD *)__src + 3);
        v46 = *((_QWORD *)__src + 4);
        v47 = *((_QWORD *)__src + 5);
        v48 = *((_QWORD *)__src + 6);
        v49 = *((_QWORD *)__src + 7);
        v518 = __src[68];
        v541 = *((unsigned int *)__src + 16);
        sub_242CCC10C(*(_QWORD *)__src, v43, v44, v45, v46, v47, v48, v49, v541 | (v518 << 32));
        *(_QWORD *)__dst = v42;
        *((_QWORD *)__dst + 1) = v43;
        *((_QWORD *)__dst + 2) = v44;
        *((_QWORD *)__dst + 3) = v45;
        *((_QWORD *)__dst + 4) = v46;
        *((_QWORD *)__dst + 5) = v47;
        *((_QWORD *)__dst + 6) = v48;
        *((_QWORD *)__dst + 7) = v49;
        __dst[68] = v518;
        *((_DWORD *)__dst + 16) = v541;
        *((_QWORD *)__dst + 9) = *((_QWORD *)__src + 9);
        *((_QWORD *)__dst + 10) = *((_QWORD *)__src + 10);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (!*((_QWORD *)__src + 20))
          goto LABEL_17;
      }
      else
      {
        v30 = *((_OWORD *)__src + 1);
        *(_OWORD *)__dst = *(_OWORD *)__src;
        *((_OWORD *)__dst + 1) = v30;
        v31 = *((_OWORD *)__src + 2);
        v32 = *((_OWORD *)__src + 3);
        v33 = *((_OWORD *)__src + 4);
        *((_QWORD *)__dst + 10) = *((_QWORD *)__src + 10);
        *((_OWORD *)__dst + 3) = v32;
        *((_OWORD *)__dst + 4) = v33;
        *((_OWORD *)__dst + 2) = v31;
        if (!*((_QWORD *)__src + 20))
        {
LABEL_17:
          v50 = *(_OWORD *)(__src + 104);
          *(_OWORD *)(__dst + 88) = *(_OWORD *)(__src + 88);
          *(_OWORD *)(__dst + 104) = v50;
          v51 = *(_OWORD *)(__src + 120);
          v52 = *(_OWORD *)(__src + 136);
          v53 = *(_OWORD *)(__src + 152);
          *((_QWORD *)__dst + 21) = *((_QWORD *)__src + 21);
          *(_OWORD *)(__dst + 136) = v52;
          *(_OWORD *)(__dst + 152) = v53;
          *(_OWORD *)(__dst + 120) = v51;
LABEL_18:
          v54 = (__int128 *)(__dst + 176);
          v55 = (__int128 *)(__src + 176);
          v56 = *((_QWORD *)__src + 31);
          if (v56)
          {
            if (v56 == 1)
            {
              v57 = *v55;
              v58 = *((_OWORD *)__src + 13);
              *((_OWORD *)__dst + 12) = *((_OWORD *)__src + 12);
              *((_OWORD *)__dst + 13) = v58;
              *v54 = v57;
              v59 = *((_OWORD *)__src + 14);
              v60 = *((_OWORD *)__src + 15);
              v61 = *((_OWORD *)__src + 17);
              *((_OWORD *)__dst + 16) = *((_OWORD *)__src + 16);
              *((_OWORD *)__dst + 17) = v61;
              *((_OWORD *)__dst + 14) = v59;
              *((_OWORD *)__dst + 15) = v60;
              v62 = *((_OWORD *)__src + 18);
              v63 = *((_OWORD *)__src + 19);
              v64 = *((_OWORD *)__src + 21);
              *((_OWORD *)__dst + 20) = *((_OWORD *)__src + 20);
              *((_OWORD *)__dst + 21) = v64;
              *((_OWORD *)__dst + 18) = v62;
              *((_OWORD *)__dst + 19) = v63;
              goto LABEL_64;
            }
            goto LABEL_48;
          }
          v65 = *((_OWORD *)__src + 12);
          *v54 = *v55;
          *((_OWORD *)__dst + 12) = v65;
          v66 = *((_OWORD *)__src + 13);
          v67 = *((_OWORD *)__src + 14);
          v68 = *((_OWORD *)__src + 15);
          *((_QWORD *)__dst + 32) = *((_QWORD *)__src + 32);
          *((_OWORD *)__dst + 14) = v67;
          *((_OWORD *)__dst + 15) = v68;
          *((_OWORD *)__dst + 13) = v66;
          if (!*((_QWORD *)__src + 42))
            goto LABEL_54;
          goto LABEL_63;
        }
      }
      v34 = *((_QWORD *)__src + 11);
      v35 = *((_QWORD *)__src + 12);
      v36 = *((_QWORD *)__src + 13);
      v37 = *((_QWORD *)__src + 14);
      v38 = *((_QWORD *)__src + 15);
      v39 = *((_QWORD *)__src + 16);
      v40 = *((_QWORD *)__src + 17);
      v41 = *((_QWORD *)__src + 18);
      v517 = __src[156];
      v540 = *((unsigned int *)__src + 38);
      sub_242CCC10C(v34, v35, v36, v37, v38, v39, v40, v41, v540 | (v517 << 32));
      *((_QWORD *)__dst + 11) = v34;
      *((_QWORD *)__dst + 12) = v35;
      *((_QWORD *)__dst + 13) = v36;
      *((_QWORD *)__dst + 14) = v37;
      *((_QWORD *)__dst + 15) = v38;
      *((_QWORD *)__dst + 16) = v39;
      *((_QWORD *)__dst + 17) = v40;
      *((_QWORD *)__dst + 18) = v41;
      __dst[156] = v517;
      *((_DWORD *)__dst + 38) = v540;
      *((_QWORD *)__dst + 20) = *((_QWORD *)__src + 20);
      *((_QWORD *)__dst + 21) = *((_QWORD *)__src + 21);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_18;
    }
LABEL_8:
    memcpy(__dst, __src, 0x160uLL);
    goto LABEL_64;
  }
  if (v5 == 2)
  {
    sub_242DF61C0((uint64_t)__dst);
    goto LABEL_8;
  }
  if (v4 == 1)
  {
    if (v5 == 1)
    {
      v14 = *(_OWORD *)__src;
      v15 = *((_OWORD *)__src + 2);
      *((_OWORD *)__dst + 1) = *((_OWORD *)__src + 1);
      *((_OWORD *)__dst + 2) = v15;
      *(_OWORD *)__dst = v14;
      v16 = *((_OWORD *)__src + 3);
      v17 = *((_OWORD *)__src + 4);
      v18 = *((_OWORD *)__src + 6);
      *((_OWORD *)__dst + 5) = *((_OWORD *)__src + 5);
      *((_OWORD *)__dst + 6) = v18;
      *((_OWORD *)__dst + 3) = v16;
      *((_OWORD *)__dst + 4) = v17;
      v19 = *((_OWORD *)__src + 7);
      v20 = *((_OWORD *)__src + 8);
      v21 = *((_OWORD *)__src + 10);
      *((_OWORD *)__dst + 9) = *((_OWORD *)__src + 9);
      *((_OWORD *)__dst + 10) = v21;
      *((_OWORD *)__dst + 7) = v19;
      *((_OWORD *)__dst + 8) = v20;
      goto LABEL_42;
    }
    if (v5)
    {
      v69 = *(_QWORD *)__src;
      v70 = *((_QWORD *)__src + 1);
      v71 = *((_QWORD *)__src + 2);
      v72 = *((_QWORD *)__src + 3);
      v73 = *((_QWORD *)__src + 4);
      v74 = *((_QWORD *)__src + 5);
      v75 = *((_QWORD *)__src + 6);
      v76 = *((_QWORD *)__src + 7);
      v519 = __src[68];
      v542 = *((unsigned int *)__src + 16);
      sub_242CCC10C(*(_QWORD *)__src, v70, v71, v72, v73, v74, v75, v76, v542 | (v519 << 32));
      *(_QWORD *)__dst = v69;
      *((_QWORD *)__dst + 1) = v70;
      *((_QWORD *)__dst + 2) = v71;
      *((_QWORD *)__dst + 3) = v72;
      *((_QWORD *)__dst + 4) = v73;
      *((_QWORD *)__dst + 5) = v74;
      *((_QWORD *)__dst + 6) = v75;
      *((_QWORD *)__dst + 7) = v76;
      __dst[68] = v519;
      *((_DWORD *)__dst + 16) = v542;
      *((_QWORD *)__dst + 9) = *((_QWORD *)__src + 9);
      *((_QWORD *)__dst + 10) = *((_QWORD *)__src + 10);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (!*((_QWORD *)__src + 20))
        goto LABEL_30;
    }
    else
    {
      v94 = *((_OWORD *)__src + 1);
      *(_OWORD *)__dst = *(_OWORD *)__src;
      *((_OWORD *)__dst + 1) = v94;
      v95 = *((_OWORD *)__src + 2);
      v96 = *((_OWORD *)__src + 3);
      v97 = *((_OWORD *)__src + 4);
      *((_QWORD *)__dst + 10) = *((_QWORD *)__src + 10);
      *((_OWORD *)__dst + 3) = v96;
      *((_OWORD *)__dst + 4) = v97;
      *((_OWORD *)__dst + 2) = v95;
      if (!*((_QWORD *)__src + 20))
      {
LABEL_30:
        v98 = *(_OWORD *)(__src + 104);
        *(_OWORD *)(__dst + 88) = *(_OWORD *)(__src + 88);
        *(_OWORD *)(__dst + 104) = v98;
        v99 = *(_OWORD *)(__src + 120);
        v100 = *(_OWORD *)(__src + 136);
        v101 = *(_OWORD *)(__src + 152);
        *((_QWORD *)__dst + 21) = *((_QWORD *)__src + 21);
        *(_OWORD *)(__dst + 136) = v100;
        *(_OWORD *)(__dst + 152) = v101;
        *(_OWORD *)(__dst + 120) = v99;
        goto LABEL_42;
      }
    }
    goto LABEL_39;
  }
  if (v5 == 1)
  {
    sub_242CD1900((uint64_t)__dst);
    v23 = *((_OWORD *)__src + 1);
    v22 = *((_OWORD *)__src + 2);
    *(_OWORD *)__dst = *(_OWORD *)__src;
    *((_OWORD *)__dst + 1) = v23;
    *((_OWORD *)__dst + 2) = v22;
    v24 = *((_OWORD *)__src + 6);
    v26 = *((_OWORD *)__src + 3);
    v25 = *((_OWORD *)__src + 4);
    *((_OWORD *)__dst + 5) = *((_OWORD *)__src + 5);
    *((_OWORD *)__dst + 6) = v24;
    *((_OWORD *)__dst + 3) = v26;
    *((_OWORD *)__dst + 4) = v25;
    v27 = *((_OWORD *)__src + 10);
    v29 = *((_OWORD *)__src + 7);
    v28 = *((_OWORD *)__src + 8);
    *((_OWORD *)__dst + 9) = *((_OWORD *)__src + 9);
    *((_OWORD *)__dst + 10) = v27;
    *((_OWORD *)__dst + 7) = v29;
    *((_OWORD *)__dst + 8) = v28;
    goto LABEL_42;
  }
  if (v4)
  {
    if (v5)
    {
      v77 = *((_QWORD *)__src + 1);
      v78 = *((_QWORD *)__src + 2);
      v79 = *((_QWORD *)__src + 3);
      v80 = *((_QWORD *)__src + 4);
      v81 = *((_QWORD *)__src + 5);
      v82 = *((_QWORD *)__src + 6);
      v83 = *((_QWORD *)__src + 7);
      v520 = *(_QWORD *)__src;
      v543 = __src[68];
      v84 = *((unsigned int *)__src + 16);
      sub_242CCC10C(*(_QWORD *)__src, v77, v78, v79, v80, v81, v82, v83, v84 | (v543 << 32));
      v85 = *(_QWORD *)__dst;
      v86 = *((_QWORD *)__dst + 1);
      v87 = *((_QWORD *)__dst + 2);
      v88 = *((_QWORD *)__dst + 3);
      v89 = *((_QWORD *)__dst + 4);
      v90 = *((_QWORD *)__dst + 5);
      v91 = *((_QWORD *)__dst + 6);
      v92 = *((_QWORD *)__dst + 7);
      v93 = *((unsigned int *)__dst + 16) | ((unint64_t)__dst[68] << 32);
      *(_QWORD *)__dst = v520;
      *((_QWORD *)__dst + 1) = v77;
      *((_QWORD *)__dst + 2) = v78;
      *((_QWORD *)__dst + 3) = v79;
      *((_QWORD *)__dst + 4) = v80;
      *((_QWORD *)__dst + 5) = v81;
      *((_QWORD *)__dst + 6) = v82;
      *((_QWORD *)__dst + 7) = v83;
      *((_DWORD *)__dst + 16) = v84;
      __dst[68] = v543;
      sub_242CCCA5C(v85, v86, v87, v88, v89, v90, v91, v92, v93);
      *((_QWORD *)__dst + 9) = *((_QWORD *)__src + 9);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((_QWORD *)__dst + 10) = *((_QWORD *)__src + 10);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_242CBBA7C((uint64_t)__dst, &qword_257259D68);
      v110 = *((_OWORD *)__src + 1);
      *(_OWORD *)__dst = *(_OWORD *)__src;
      *((_OWORD *)__dst + 1) = v110;
      v112 = *((_OWORD *)__src + 3);
      v111 = *((_OWORD *)__src + 4);
      v113 = *((_OWORD *)__src + 2);
      *((_QWORD *)__dst + 10) = *((_QWORD *)__src + 10);
      *((_OWORD *)__dst + 3) = v112;
      *((_OWORD *)__dst + 4) = v111;
      *((_OWORD *)__dst + 2) = v113;
    }
  }
  else if (v5)
  {
    v102 = *(_QWORD *)__src;
    v103 = *((_QWORD *)__src + 1);
    v104 = *((_QWORD *)__src + 2);
    v105 = *((_QWORD *)__src + 3);
    v106 = *((_QWORD *)__src + 4);
    v107 = *((_QWORD *)__src + 5);
    v108 = *((_QWORD *)__src + 6);
    v109 = *((_QWORD *)__src + 7);
    v521 = __src[68];
    v544 = *((unsigned int *)__src + 16);
    sub_242CCC10C(*(_QWORD *)__src, v103, v104, v105, v106, v107, v108, v109, v544 | (v521 << 32));
    *(_QWORD *)__dst = v102;
    *((_QWORD *)__dst + 1) = v103;
    *((_QWORD *)__dst + 2) = v104;
    *((_QWORD *)__dst + 3) = v105;
    *((_QWORD *)__dst + 4) = v106;
    *((_QWORD *)__dst + 5) = v107;
    *((_QWORD *)__dst + 6) = v108;
    *((_QWORD *)__dst + 7) = v109;
    __dst[68] = v521;
    *((_DWORD *)__dst + 16) = v544;
    *((_QWORD *)__dst + 9) = *((_QWORD *)__src + 9);
    *((_QWORD *)__dst + 10) = *((_QWORD *)__src + 10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v114 = *((_OWORD *)__src + 1);
    *(_OWORD *)__dst = *(_OWORD *)__src;
    *((_OWORD *)__dst + 1) = v114;
    v115 = *((_OWORD *)__src + 2);
    v116 = *((_OWORD *)__src + 3);
    v117 = *((_OWORD *)__src + 4);
    *((_QWORD *)__dst + 10) = *((_QWORD *)__src + 10);
    *((_OWORD *)__dst + 3) = v116;
    *((_OWORD *)__dst + 4) = v117;
    *((_OWORD *)__dst + 2) = v115;
  }
  v118 = __dst + 88;
  v119 = __src + 88;
  v120 = *((_QWORD *)__src + 20);
  if (*((_QWORD *)__dst + 20))
  {
    if (v120)
    {
      v515 = *((_QWORD *)__src + 12);
      v522 = *((_QWORD *)__src + 11);
      v121 = *((_QWORD *)__src + 13);
      v122 = *((_QWORD *)__src + 14);
      v123 = *((_QWORD *)__src + 15);
      v124 = *((_QWORD *)__src + 16);
      v125 = *((_QWORD *)__src + 17);
      v126 = *((_QWORD *)__src + 18);
      v545 = __src[156];
      v127 = *((unsigned int *)__src + 38);
      sub_242CCC10C(v522, v515, v121, v122, v123, v124, v125, v126, v127 | (v545 << 32));
      v128 = *((_QWORD *)__dst + 11);
      v129 = *((_QWORD *)__dst + 12);
      v130 = *((_QWORD *)__dst + 13);
      v131 = *((_QWORD *)__dst + 14);
      v132 = *((_QWORD *)__dst + 15);
      v133 = *((_QWORD *)__dst + 16);
      v134 = *((_QWORD *)__dst + 17);
      v135 = *((_QWORD *)__dst + 18);
      v136 = *((unsigned int *)__dst + 38) | ((unint64_t)__dst[156] << 32);
      *((_QWORD *)__dst + 11) = v522;
      *((_QWORD *)__dst + 12) = v515;
      *((_QWORD *)__dst + 13) = v121;
      *((_QWORD *)__dst + 14) = v122;
      *((_QWORD *)__dst + 15) = v123;
      *((_QWORD *)__dst + 16) = v124;
      *((_QWORD *)__dst + 17) = v125;
      *((_QWORD *)__dst + 18) = v126;
      *((_DWORD *)__dst + 38) = v127;
      __dst[156] = v545;
      sub_242CCCA5C(v128, v129, v130, v131, v132, v133, v134, v135, v136);
      *((_QWORD *)__dst + 20) = *((_QWORD *)__src + 20);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((_QWORD *)__dst + 21) = *((_QWORD *)__src + 21);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_242CBBA7C((uint64_t)(__dst + 88), &qword_257259D68);
      v145 = *(_OWORD *)(__src + 104);
      *v118 = *v119;
      *(_OWORD *)(__dst + 104) = v145;
      v147 = *(_OWORD *)(__src + 136);
      v146 = *(_OWORD *)(__src + 152);
      v148 = *(_OWORD *)(__src + 120);
      *((_QWORD *)__dst + 21) = *((_QWORD *)__src + 21);
      *(_OWORD *)(__dst + 136) = v147;
      *(_OWORD *)(__dst + 152) = v146;
      *(_OWORD *)(__dst + 120) = v148;
    }
  }
  else
  {
    if (v120)
    {
LABEL_39:
      v137 = *((_QWORD *)__src + 11);
      v138 = *((_QWORD *)__src + 12);
      v139 = *((_QWORD *)__src + 13);
      v140 = *((_QWORD *)__src + 14);
      v141 = *((_QWORD *)__src + 15);
      v142 = *((_QWORD *)__src + 16);
      v143 = *((_QWORD *)__src + 17);
      v144 = *((_QWORD *)__src + 18);
      v523 = __src[156];
      v546 = *((unsigned int *)__src + 38);
      sub_242CCC10C(v137, v138, v139, v140, v141, v142, v143, v144, v546 | (v523 << 32));
      *((_QWORD *)__dst + 11) = v137;
      *((_QWORD *)__dst + 12) = v138;
      *((_QWORD *)__dst + 13) = v139;
      *((_QWORD *)__dst + 14) = v140;
      *((_QWORD *)__dst + 15) = v141;
      *((_QWORD *)__dst + 16) = v142;
      *((_QWORD *)__dst + 17) = v143;
      *((_QWORD *)__dst + 18) = v144;
      __dst[156] = v523;
      *((_DWORD *)__dst + 38) = v546;
      *((_QWORD *)__dst + 20) = *((_QWORD *)__src + 20);
      *((_QWORD *)__dst + 21) = *((_QWORD *)__src + 21);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_42;
    }
    v149 = *(_OWORD *)(__src + 104);
    *v118 = *v119;
    *(_OWORD *)(__dst + 104) = v149;
    v150 = *(_OWORD *)(__src + 120);
    v151 = *(_OWORD *)(__src + 136);
    v152 = *(_OWORD *)(__src + 152);
    *((_QWORD *)__dst + 21) = *((_QWORD *)__src + 21);
    *(_OWORD *)(__dst + 136) = v151;
    *(_OWORD *)(__dst + 152) = v152;
    *(_OWORD *)(__dst + 120) = v150;
  }
LABEL_42:
  v153 = (__int128 *)(__dst + 176);
  v154 = (__int128 *)(__src + 176);
  v155 = *((_QWORD *)__dst + 31);
  v156 = *((_QWORD *)__src + 31);
  if (v155 == 1)
  {
    if (v156)
    {
      if (v156 == 1)
      {
        v157 = *v154;
        v158 = *((_OWORD *)__src + 13);
        *((_OWORD *)__dst + 12) = *((_OWORD *)__src + 12);
        *((_OWORD *)__dst + 13) = v158;
        *v153 = v157;
        v159 = *((_OWORD *)__src + 14);
        v160 = *((_OWORD *)__src + 15);
        v161 = *((_OWORD *)__src + 17);
        *((_OWORD *)__dst + 16) = *((_OWORD *)__src + 16);
        *((_OWORD *)__dst + 17) = v161;
        *((_OWORD *)__dst + 14) = v159;
        *((_OWORD *)__dst + 15) = v160;
        v162 = *((_OWORD *)__src + 18);
        v163 = *((_OWORD *)__src + 19);
        v164 = *((_OWORD *)__src + 21);
        *((_OWORD *)__dst + 20) = *((_OWORD *)__src + 20);
        *((_OWORD *)__dst + 21) = v164;
        *((_OWORD *)__dst + 18) = v162;
        *((_OWORD *)__dst + 19) = v163;
        goto LABEL_64;
      }
LABEL_48:
      v173 = *((_QWORD *)__src + 22);
      v174 = *((_QWORD *)__src + 23);
      v175 = *((_QWORD *)__src + 24);
      v176 = *((_QWORD *)__src + 25);
      v177 = *((_QWORD *)__src + 26);
      v178 = *((_QWORD *)__src + 27);
      v179 = *((_QWORD *)__src + 28);
      v180 = *((_QWORD *)__src + 29);
      v524 = __src[244];
      v547 = *((unsigned int *)__src + 60);
      sub_242CCC10C(v173, v174, v175, v176, v177, v178, v179, v180, v547 | (v524 << 32));
      *((_QWORD *)__dst + 22) = v173;
      *((_QWORD *)__dst + 23) = v174;
      *((_QWORD *)__dst + 24) = v175;
      *((_QWORD *)__dst + 25) = v176;
      *((_QWORD *)__dst + 26) = v177;
      *((_QWORD *)__dst + 27) = v178;
      *((_QWORD *)__dst + 28) = v179;
      *((_QWORD *)__dst + 29) = v180;
      __dst[244] = v524;
      *((_DWORD *)__dst + 60) = v547;
      *((_QWORD *)__dst + 31) = *((_QWORD *)__src + 31);
      *((_QWORD *)__dst + 32) = *((_QWORD *)__src + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (!*((_QWORD *)__src + 42))
        goto LABEL_54;
      goto LABEL_63;
    }
    v197 = *((_OWORD *)__src + 12);
    *v153 = *v154;
    *((_OWORD *)__dst + 12) = v197;
    v198 = *((_OWORD *)__src + 13);
    v199 = *((_OWORD *)__src + 14);
    v200 = *((_OWORD *)__src + 15);
    *((_QWORD *)__dst + 32) = *((_QWORD *)__src + 32);
    *((_OWORD *)__dst + 14) = v199;
    *((_OWORD *)__dst + 15) = v200;
    *((_OWORD *)__dst + 13) = v198;
    if (!*((_QWORD *)__src + 42))
    {
LABEL_54:
      v201 = *(_OWORD *)(__src + 280);
      *(_OWORD *)(__dst + 264) = *(_OWORD *)(__src + 264);
      *(_OWORD *)(__dst + 280) = v201;
      v202 = *(_OWORD *)(__src + 296);
      v203 = *(_OWORD *)(__src + 312);
      v204 = *(_OWORD *)(__src + 328);
      *((_QWORD *)__dst + 43) = *((_QWORD *)__src + 43);
      *(_OWORD *)(__dst + 312) = v203;
      *(_OWORD *)(__dst + 328) = v204;
      *(_OWORD *)(__dst + 296) = v202;
      goto LABEL_64;
    }
LABEL_63:
    v241 = *((_QWORD *)__src + 33);
    v242 = *((_QWORD *)__src + 34);
    v243 = *((_QWORD *)__src + 35);
    v244 = *((_QWORD *)__src + 36);
    v245 = *((_QWORD *)__src + 37);
    v246 = *((_QWORD *)__src + 38);
    v247 = *((_QWORD *)__src + 39);
    v248 = *((_QWORD *)__src + 40);
    v528 = *((unsigned __int8 *)v564 + 4);
    v551 = *v564;
    sub_242CCC10C(v241, v242, v243, v244, v245, v246, v247, v248, v551 | (v528 << 32));
    *((_QWORD *)__dst + 33) = v241;
    *((_QWORD *)__dst + 34) = v242;
    *((_QWORD *)__dst + 35) = v243;
    *((_QWORD *)__dst + 36) = v244;
    *((_QWORD *)__dst + 37) = v245;
    *((_QWORD *)__dst + 38) = v246;
    *((_QWORD *)__dst + 39) = v247;
    *((_QWORD *)__dst + 40) = v248;
    *((_BYTE *)v566 + 4) = v528;
    *v566 = v551;
    *((_QWORD *)__dst + 42) = *((_QWORD *)__src + 42);
    *((_QWORD *)__dst + 43) = *((_QWORD *)__src + 43);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_64;
  }
  if (v156 == 1)
  {
    sub_242CD18CC((uint64_t)(__dst + 176));
    v166 = *((_OWORD *)__src + 12);
    v165 = *((_OWORD *)__src + 13);
    *v153 = *v154;
    *((_OWORD *)__dst + 12) = v166;
    *((_OWORD *)__dst + 13) = v165;
    v167 = *((_OWORD *)__src + 17);
    v169 = *((_OWORD *)__src + 14);
    v168 = *((_OWORD *)__src + 15);
    *((_OWORD *)__dst + 16) = *((_OWORD *)__src + 16);
    *((_OWORD *)__dst + 17) = v167;
    *((_OWORD *)__dst + 14) = v169;
    *((_OWORD *)__dst + 15) = v168;
    v170 = *((_OWORD *)__src + 21);
    v172 = *((_OWORD *)__src + 18);
    v171 = *((_OWORD *)__src + 19);
    *((_OWORD *)__dst + 20) = *((_OWORD *)__src + 20);
    *((_OWORD *)__dst + 21) = v170;
    *((_OWORD *)__dst + 18) = v172;
    *((_OWORD *)__dst + 19) = v171;
    goto LABEL_64;
  }
  if (v155)
  {
    if (v156)
    {
      v516 = *((_QWORD *)__src + 23);
      v525 = *((_QWORD *)__src + 22);
      v181 = *((_QWORD *)__src + 24);
      v182 = *((_QWORD *)__src + 25);
      v183 = *((_QWORD *)__src + 26);
      v184 = *((_QWORD *)__src + 27);
      v185 = *((_QWORD *)__src + 28);
      v186 = *((_QWORD *)__src + 29);
      v548 = __src[244];
      v187 = *((unsigned int *)__src + 60);
      sub_242CCC10C(v525, v516, v181, v182, v183, v184, v185, v186, v187 | (v548 << 32));
      v188 = *((_QWORD *)__dst + 22);
      v189 = *((_QWORD *)__dst + 23);
      v190 = *((_QWORD *)__dst + 24);
      v191 = *((_QWORD *)__dst + 25);
      v192 = *((_QWORD *)__dst + 26);
      v193 = *((_QWORD *)__dst + 27);
      v194 = *((_QWORD *)__dst + 28);
      v195 = *((_QWORD *)__dst + 29);
      v196 = *((unsigned int *)__dst + 60) | ((unint64_t)__dst[244] << 32);
      *((_QWORD *)__dst + 22) = v525;
      *((_QWORD *)__dst + 23) = v516;
      *((_QWORD *)__dst + 24) = v181;
      *((_QWORD *)__dst + 25) = v182;
      *((_QWORD *)__dst + 26) = v183;
      *((_QWORD *)__dst + 27) = v184;
      *((_QWORD *)__dst + 28) = v185;
      *((_QWORD *)__dst + 29) = v186;
      *((_DWORD *)__dst + 60) = v187;
      __dst[244] = v548;
      sub_242CCCA5C(v188, v189, v190, v191, v192, v193, v194, v195, v196);
      *((_QWORD *)__dst + 31) = *((_QWORD *)__src + 31);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((_QWORD *)__dst + 32) = *((_QWORD *)__src + 32);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_242CBBA7C((uint64_t)(__dst + 176), &qword_257259D68);
      v213 = *((_OWORD *)__src + 12);
      *v153 = *v154;
      *((_OWORD *)__dst + 12) = v213;
      v215 = *((_OWORD *)__src + 14);
      v214 = *((_OWORD *)__src + 15);
      v216 = *((_OWORD *)__src + 13);
      *((_QWORD *)__dst + 32) = *((_QWORD *)__src + 32);
      *((_OWORD *)__dst + 14) = v215;
      *((_OWORD *)__dst + 15) = v214;
      *((_OWORD *)__dst + 13) = v216;
    }
  }
  else if (v156)
  {
    v205 = *((_QWORD *)__src + 22);
    v206 = *((_QWORD *)__src + 23);
    v207 = *((_QWORD *)__src + 24);
    v208 = *((_QWORD *)__src + 25);
    v209 = *((_QWORD *)__src + 26);
    v210 = *((_QWORD *)__src + 27);
    v211 = *((_QWORD *)__src + 28);
    v212 = *((_QWORD *)__src + 29);
    v526 = __src[244];
    v549 = *((unsigned int *)__src + 60);
    sub_242CCC10C(v205, v206, v207, v208, v209, v210, v211, v212, v549 | (v526 << 32));
    *((_QWORD *)__dst + 22) = v205;
    *((_QWORD *)__dst + 23) = v206;
    *((_QWORD *)__dst + 24) = v207;
    *((_QWORD *)__dst + 25) = v208;
    *((_QWORD *)__dst + 26) = v209;
    *((_QWORD *)__dst + 27) = v210;
    *((_QWORD *)__dst + 28) = v211;
    *((_QWORD *)__dst + 29) = v212;
    __dst[244] = v526;
    *((_DWORD *)__dst + 60) = v549;
    *((_QWORD *)__dst + 31) = *((_QWORD *)__src + 31);
    *((_QWORD *)__dst + 32) = *((_QWORD *)__src + 32);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v217 = *((_OWORD *)__src + 12);
    *v153 = *v154;
    *((_OWORD *)__dst + 12) = v217;
    v218 = *((_OWORD *)__src + 13);
    v219 = *((_OWORD *)__src + 14);
    v220 = *((_OWORD *)__src + 15);
    *((_QWORD *)__dst + 32) = *((_QWORD *)__src + 32);
    *((_OWORD *)__dst + 14) = v219;
    *((_OWORD *)__dst + 15) = v220;
    *((_OWORD *)__dst + 13) = v218;
  }
  v221 = __dst + 264;
  v222 = __src + 264;
  v223 = *((_QWORD *)__src + 42);
  if (*((_QWORD *)__dst + 42))
  {
    if (v223)
    {
      v224 = *((_QWORD *)__src + 34);
      v225 = *((_QWORD *)__src + 35);
      v226 = *((_QWORD *)__src + 36);
      v227 = *((_QWORD *)__src + 37);
      v228 = *((_QWORD *)__src + 38);
      v229 = *((_QWORD *)__src + 39);
      v230 = *((_QWORD *)__src + 40);
      v527 = *((_QWORD *)__src + 33);
      v550 = *((unsigned __int8 *)v564 + 4);
      v231 = *v564;
      sub_242CCC10C(v527, v224, v225, v226, v227, v228, v229, v230, v231 | (v550 << 32));
      v232 = *((_QWORD *)__dst + 33);
      v233 = *((_QWORD *)__dst + 34);
      v234 = *((_QWORD *)__dst + 35);
      v235 = *((_QWORD *)__dst + 36);
      v236 = *((_QWORD *)__dst + 37);
      v237 = *((_QWORD *)__dst + 38);
      v238 = *((_QWORD *)__dst + 39);
      v239 = *((_QWORD *)__dst + 40);
      v240 = *v566 | ((unint64_t)*((unsigned __int8 *)v566 + 4) << 32);
      *((_QWORD *)__dst + 33) = v527;
      *((_QWORD *)__dst + 34) = v224;
      *((_QWORD *)__dst + 35) = v225;
      *((_QWORD *)__dst + 36) = v226;
      *((_QWORD *)__dst + 37) = v227;
      *((_QWORD *)__dst + 38) = v228;
      *((_QWORD *)__dst + 39) = v229;
      *((_QWORD *)__dst + 40) = v230;
      *v566 = v231;
      *((_BYTE *)v566 + 4) = v550;
      sub_242CCCA5C(v232, v233, v234, v235, v236, v237, v238, v239, v240);
      *((_QWORD *)__dst + 42) = *((_QWORD *)__src + 42);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((_QWORD *)__dst + 43) = *((_QWORD *)__src + 43);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_242CBBA7C((uint64_t)(__dst + 264), &qword_257259D68);
      v357 = *(_OWORD *)(__src + 280);
      *v221 = *v222;
      *(_OWORD *)(__dst + 280) = v357;
      v359 = *(_OWORD *)(__src + 312);
      v358 = *(_OWORD *)(__src + 328);
      v360 = *(_OWORD *)(__src + 296);
      *((_QWORD *)__dst + 43) = *((_QWORD *)__src + 43);
      *(_OWORD *)(__dst + 312) = v359;
      *(_OWORD *)(__dst + 328) = v358;
      *(_OWORD *)(__dst + 296) = v360;
    }
  }
  else
  {
    if (v223)
      goto LABEL_63;
    v365 = *(_OWORD *)(__src + 280);
    *v221 = *v222;
    *(_OWORD *)(__dst + 280) = v365;
    v366 = *(_OWORD *)(__src + 296);
    v367 = *(_OWORD *)(__src + 312);
    v368 = *(_OWORD *)(__src + 328);
    *((_QWORD *)__dst + 43) = *((_QWORD *)__src + 43);
    *(_OWORD *)(__dst + 312) = v367;
    *(_OWORD *)(__dst + 328) = v368;
    *(_OWORD *)(__dst + 296) = v366;
  }
LABEL_64:
  v249 = __dst + 352;
  v250 = __src + 352;
  v251 = *((_QWORD *)__dst + 53);
  v252 = *((_QWORD *)__src + 53);
  if (v251 == 2)
  {
    if (!v252)
    {
      v277 = *((_OWORD *)__src + 23);
      *v249 = *v250;
      *((_OWORD *)__dst + 23) = v277;
      v278 = *((_OWORD *)__src + 24);
      v279 = *((_OWORD *)__src + 25);
      v280 = *((_OWORD *)__src + 26);
      *((_QWORD *)__dst + 54) = *((_QWORD *)__src + 54);
      *((_OWORD *)__dst + 25) = v279;
      *((_OWORD *)__dst + 26) = v280;
      *((_OWORD *)__dst + 24) = v278;
      if (*((_QWORD *)__src + 64))
        goto LABEL_69;
      goto LABEL_78;
    }
    if (v252 == 1)
    {
      v285 = *v250;
      v286 = *((_OWORD *)__src + 24);
      *((_OWORD *)__dst + 23) = *((_OWORD *)__src + 23);
      *((_OWORD *)__dst + 24) = v286;
      *v249 = v285;
      v287 = *((_OWORD *)__src + 25);
      v288 = *((_OWORD *)__src + 26);
      v289 = *((_OWORD *)__src + 28);
      *((_OWORD *)__dst + 27) = *((_OWORD *)__src + 27);
      *((_OWORD *)__dst + 28) = v289;
      *((_OWORD *)__dst + 25) = v287;
      *((_OWORD *)__dst + 26) = v288;
      v290 = *((_OWORD *)__src + 29);
      v291 = *((_OWORD *)__src + 30);
      v292 = *((_OWORD *)__src + 32);
      *((_OWORD *)__dst + 31) = *((_OWORD *)__src + 31);
      *((_OWORD *)__dst + 32) = v292;
      *((_OWORD *)__dst + 29) = v290;
      *((_OWORD *)__dst + 30) = v291;
      goto LABEL_80;
    }
    if (v252 != 2)
    {
      v253 = *((_QWORD *)__src + 44);
      v254 = *((_QWORD *)__src + 45);
      v255 = *((_QWORD *)__src + 46);
      v256 = *((_QWORD *)__src + 47);
      v257 = *((_QWORD *)__src + 48);
      v258 = *((_QWORD *)__src + 49);
      v259 = *((_QWORD *)__src + 50);
      v260 = *((_QWORD *)__src + 51);
      v529 = *((unsigned __int8 *)v564 + 92);
      v552 = v564[22];
      sub_242CCC10C(v253, v254, v255, v256, v257, v258, v259, v260, v552 | (v529 << 32));
      *((_QWORD *)__dst + 44) = v253;
      *((_QWORD *)__dst + 45) = v254;
      *((_QWORD *)__dst + 46) = v255;
      *((_QWORD *)__dst + 47) = v256;
      *((_QWORD *)__dst + 48) = v257;
      *((_QWORD *)__dst + 49) = v258;
      *((_QWORD *)__dst + 50) = v259;
      *((_QWORD *)__dst + 51) = v260;
      *((_BYTE *)v566 + 92) = v529;
      v566[22] = v552;
      *((_QWORD *)__dst + 53) = *((_QWORD *)__src + 53);
      *((_QWORD *)__dst + 54) = *((_QWORD *)__src + 54);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      if (*((_QWORD *)__src + 64))
      {
LABEL_69:
        v261 = *((_QWORD *)__src + 55);
        v262 = *((_QWORD *)__src + 56);
        v263 = *((_QWORD *)__src + 57);
        v264 = *((_QWORD *)__src + 58);
        v265 = *((_QWORD *)__src + 59);
        v266 = *((_QWORD *)__src + 60);
        v267 = *((_QWORD *)__src + 61);
        v268 = *((_QWORD *)__src + 62);
        v530 = *((unsigned __int8 *)v564 + 180);
        v553 = v564[44];
        sub_242CCC10C(v261, v262, v263, v264, v265, v266, v267, v268, v553 | (v530 << 32));
        *((_QWORD *)__dst + 55) = v261;
        *((_QWORD *)__dst + 56) = v262;
        *((_QWORD *)__dst + 57) = v263;
        *((_QWORD *)__dst + 58) = v264;
        *((_QWORD *)__dst + 59) = v265;
        *((_QWORD *)__dst + 60) = v266;
        *((_QWORD *)__dst + 61) = v267;
        *((_QWORD *)__dst + 62) = v268;
        *((_BYTE *)v566 + 180) = v530;
        v566[44] = v553;
        *((_QWORD *)__dst + 64) = *((_QWORD *)__src + 64);
        *((_QWORD *)__dst + 65) = *((_QWORD *)__src + 65);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
LABEL_80:
        v293 = __dst + 528;
        v294 = __src + 528;
        v295 = *((_QWORD *)__src + 75);
        if (!v295)
        {
          v312 = *((_OWORD *)__src + 34);
          *v293 = *v294;
          *((_OWORD *)__dst + 34) = v312;
          v313 = *((_OWORD *)__src + 35);
          v314 = *((_OWORD *)__src + 36);
          v315 = *((_OWORD *)__src + 37);
          *((_QWORD *)__dst + 76) = *((_QWORD *)__src + 76);
          *((_OWORD *)__dst + 36) = v314;
          *((_OWORD *)__dst + 37) = v315;
          *((_OWORD *)__dst + 35) = v313;
          if (!*((_QWORD *)__src + 86))
            goto LABEL_110;
          goto LABEL_128;
        }
        if (v295 == 1)
        {
          v296 = *v294;
          v297 = *((_OWORD *)__src + 35);
          *((_OWORD *)__dst + 34) = *((_OWORD *)__src + 34);
          *((_OWORD *)__dst + 35) = v297;
          *v293 = v296;
          v298 = *((_OWORD *)__src + 36);
          v299 = *((_OWORD *)__src + 37);
          v300 = *((_OWORD *)__src + 39);
          *((_OWORD *)__dst + 38) = *((_OWORD *)__src + 38);
          *((_OWORD *)__dst + 39) = v300;
          *((_OWORD *)__dst + 36) = v298;
          *((_OWORD *)__dst + 37) = v299;
          v301 = *((_OWORD *)__src + 40);
          v302 = *((_OWORD *)__src + 41);
          v303 = *((_OWORD *)__src + 43);
          *((_OWORD *)__dst + 42) = *((_OWORD *)__src + 42);
          *((_OWORD *)__dst + 43) = v303;
          *((_OWORD *)__dst + 40) = v301;
          *((_OWORD *)__dst + 41) = v302;
          return __dst;
        }
LABEL_109:
        v413 = *((_QWORD *)__src + 66);
        v414 = *((_QWORD *)__src + 67);
        v415 = *((_QWORD *)__src + 68);
        v416 = *((_QWORD *)__src + 69);
        v417 = *((_QWORD *)__src + 70);
        v418 = *((_QWORD *)__src + 71);
        v419 = *((_QWORD *)__src + 72);
        v420 = *((_QWORD *)__src + 73);
        v536 = *((unsigned __int8 *)v564 + 268);
        v559 = v564[66];
        sub_242CCC10C(v413, v414, v415, v416, v417, v418, v419, v420, v559 | (v536 << 32));
        *((_QWORD *)__dst + 66) = v413;
        *((_QWORD *)__dst + 67) = v414;
        *((_QWORD *)__dst + 68) = v415;
        *((_QWORD *)__dst + 69) = v416;
        *((_QWORD *)__dst + 70) = v417;
        *((_QWORD *)__dst + 71) = v418;
        *((_QWORD *)__dst + 72) = v419;
        *((_QWORD *)__dst + 73) = v420;
        *((_BYTE *)v566 + 268) = v536;
        v566[66] = v559;
        *((_QWORD *)__dst + 75) = *((_QWORD *)__src + 75);
        *((_QWORD *)__dst + 76) = *((_QWORD *)__src + 76);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (!*((_QWORD *)__src + 86))
        {
LABEL_110:
          v421 = *(_OWORD *)(__src + 632);
          *(_OWORD *)(__dst + 616) = *(_OWORD *)(__src + 616);
          *(_OWORD *)(__dst + 632) = v421;
          v422 = *(_OWORD *)(__src + 648);
          v423 = *(_OWORD *)(__src + 664);
          v424 = *(_OWORD *)(__src + 680);
          *((_QWORD *)__dst + 87) = *((_QWORD *)__src + 87);
          *(_OWORD *)(__dst + 664) = v423;
          *(_OWORD *)(__dst + 680) = v424;
          *(_OWORD *)(__dst + 648) = v422;
          return __dst;
        }
LABEL_128:
        v498 = *((_QWORD *)__src + 77);
        v499 = *((_QWORD *)__src + 78);
        v500 = *((_QWORD *)__src + 79);
        v501 = *((_QWORD *)__src + 80);
        v502 = *((_QWORD *)__src + 81);
        v503 = *((_QWORD *)__src + 82);
        v504 = *((_QWORD *)__src + 83);
        v505 = *((_QWORD *)__src + 84);
        v563 = *((unsigned __int8 *)v564 + 356);
        v565 = v564[88];
        sub_242CCC10C(v498, v499, v500, v501, v502, v503, v504, v505, v565 | (v563 << 32));
        *((_QWORD *)__dst + 77) = v498;
        *((_QWORD *)__dst + 78) = v499;
        *((_QWORD *)__dst + 79) = v500;
        *((_QWORD *)__dst + 80) = v501;
        *((_QWORD *)__dst + 81) = v502;
        *((_QWORD *)__dst + 82) = v503;
        *((_QWORD *)__dst + 83) = v504;
        *((_QWORD *)__dst + 84) = v505;
        *((_BYTE *)v566 + 356) = v563;
        v566[88] = v565;
        *((_QWORD *)__dst + 86) = *((_QWORD *)__src + 86);
        *((_QWORD *)__dst + 87) = *((_QWORD *)__src + 87);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        return __dst;
      }
LABEL_78:
      v281 = *(_OWORD *)(__src + 456);
      *(_OWORD *)(__dst + 440) = *(_OWORD *)(__src + 440);
      *(_OWORD *)(__dst + 456) = v281;
      v282 = *(_OWORD *)(__src + 472);
      v283 = *(_OWORD *)(__src + 488);
      v284 = *(_OWORD *)(__src + 504);
      *((_QWORD *)__dst + 65) = *((_QWORD *)__src + 65);
      *(_OWORD *)(__dst + 488) = v283;
      *(_OWORD *)(__dst + 504) = v284;
      *(_OWORD *)(__dst + 472) = v282;
      goto LABEL_80;
    }
    goto LABEL_72;
  }
  if (v252 == 2)
  {
    sub_242DF61C0((uint64_t)(__dst + 352));
LABEL_72:
    memcpy(__dst + 352, __src + 352, 0x160uLL);
    return __dst;
  }
  if (v251 != 1)
  {
    if (v252 == 1)
    {
      sub_242CD1900((uint64_t)(__dst + 352));
      v305 = *((_OWORD *)__src + 23);
      v304 = *((_OWORD *)__src + 24);
      *v249 = *v250;
      *((_OWORD *)__dst + 23) = v305;
      *((_OWORD *)__dst + 24) = v304;
      v306 = *((_OWORD *)__src + 28);
      v308 = *((_OWORD *)__src + 25);
      v307 = *((_OWORD *)__src + 26);
      *((_OWORD *)__dst + 27) = *((_OWORD *)__src + 27);
      *((_OWORD *)__dst + 28) = v306;
      *((_OWORD *)__dst + 25) = v308;
      *((_OWORD *)__dst + 26) = v307;
      v309 = *((_OWORD *)__src + 32);
      v311 = *((_OWORD *)__src + 29);
      v310 = *((_OWORD *)__src + 30);
      *((_OWORD *)__dst + 31) = *((_OWORD *)__src + 31);
      *((_OWORD *)__dst + 32) = v309;
      *((_OWORD *)__dst + 29) = v311;
      *((_OWORD *)__dst + 30) = v310;
      goto LABEL_105;
    }
    if (v251)
    {
      if (v252)
      {
        v316 = *((_QWORD *)__src + 45);
        v317 = *((_QWORD *)__src + 46);
        v318 = *((_QWORD *)__src + 47);
        v319 = *((_QWORD *)__src + 48);
        v320 = *((_QWORD *)__src + 49);
        v321 = *((_QWORD *)__src + 50);
        v322 = *((_QWORD *)__src + 51);
        v531 = *((_QWORD *)__src + 44);
        v554 = *((unsigned __int8 *)v564 + 92);
        v323 = v564[22];
        sub_242CCC10C(v531, v316, v317, v318, v319, v320, v321, v322, v323 | (v554 << 32));
        v324 = *((_QWORD *)__dst + 44);
        v325 = *((_QWORD *)__dst + 45);
        v326 = *((_QWORD *)__dst + 46);
        v327 = *((_QWORD *)__dst + 47);
        v328 = *((_QWORD *)__dst + 48);
        v329 = *((_QWORD *)__dst + 49);
        v330 = *((_QWORD *)__dst + 50);
        v331 = *((_QWORD *)__dst + 51);
        v332 = v566[22] | ((unint64_t)*((unsigned __int8 *)v566 + 92) << 32);
        *((_QWORD *)__dst + 44) = v531;
        *((_QWORD *)__dst + 45) = v316;
        *((_QWORD *)__dst + 46) = v317;
        *((_QWORD *)__dst + 47) = v318;
        *((_QWORD *)__dst + 48) = v319;
        *((_QWORD *)__dst + 49) = v320;
        *((_QWORD *)__dst + 50) = v321;
        *((_QWORD *)__dst + 51) = v322;
        v566[22] = v323;
        *((_BYTE *)v566 + 92) = v554;
        sub_242CCCA5C(v324, v325, v326, v327, v328, v329, v330, v331, v332);
        *((_QWORD *)__dst + 53) = *((_QWORD *)__src + 53);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((_QWORD *)__dst + 54) = *((_QWORD *)__src + 54);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_242CBBA7C((uint64_t)(__dst + 352), &qword_257259D68);
        v361 = *((_OWORD *)__src + 23);
        *v249 = *v250;
        *((_OWORD *)__dst + 23) = v361;
        v363 = *((_OWORD *)__src + 25);
        v362 = *((_OWORD *)__src + 26);
        v364 = *((_OWORD *)__src + 24);
        *((_QWORD *)__dst + 54) = *((_QWORD *)__src + 54);
        *((_OWORD *)__dst + 25) = v363;
        *((_OWORD *)__dst + 26) = v362;
        *((_OWORD *)__dst + 24) = v364;
      }
    }
    else if (v252)
    {
      v349 = *((_QWORD *)__src + 44);
      v350 = *((_QWORD *)__src + 45);
      v351 = *((_QWORD *)__src + 46);
      v352 = *((_QWORD *)__src + 47);
      v353 = *((_QWORD *)__src + 48);
      v354 = *((_QWORD *)__src + 49);
      v355 = *((_QWORD *)__src + 50);
      v356 = *((_QWORD *)__src + 51);
      v533 = *((unsigned __int8 *)v564 + 92);
      v556 = v564[22];
      sub_242CCC10C(v349, v350, v351, v352, v353, v354, v355, v356, v556 | (v533 << 32));
      *((_QWORD *)__dst + 44) = v349;
      *((_QWORD *)__dst + 45) = v350;
      *((_QWORD *)__dst + 46) = v351;
      *((_QWORD *)__dst + 47) = v352;
      *((_QWORD *)__dst + 48) = v353;
      *((_QWORD *)__dst + 49) = v354;
      *((_QWORD *)__dst + 50) = v355;
      *((_QWORD *)__dst + 51) = v356;
      *((_BYTE *)v566 + 92) = v533;
      v566[22] = v556;
      *((_QWORD *)__dst + 53) = *((_QWORD *)__src + 53);
      *((_QWORD *)__dst + 54) = *((_QWORD *)__src + 54);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      v369 = *((_OWORD *)__src + 23);
      *v249 = *v250;
      *((_OWORD *)__dst + 23) = v369;
      v370 = *((_OWORD *)__src + 24);
      v371 = *((_OWORD *)__src + 25);
      v372 = *((_OWORD *)__src + 26);
      *((_QWORD *)__dst + 54) = *((_QWORD *)__src + 54);
      *((_OWORD *)__dst + 25) = v371;
      *((_OWORD *)__dst + 26) = v372;
      *((_OWORD *)__dst + 24) = v370;
    }
    v373 = __dst + 440;
    v374 = __src + 440;
    v375 = *((_QWORD *)__src + 64);
    if (*((_QWORD *)__dst + 64))
    {
      if (v375)
      {
        v376 = *((_QWORD *)__src + 56);
        v377 = *((_QWORD *)__src + 57);
        v378 = *((_QWORD *)__src + 58);
        v379 = *((_QWORD *)__src + 59);
        v380 = *((_QWORD *)__src + 60);
        v381 = *((_QWORD *)__src + 61);
        v382 = *((_QWORD *)__src + 62);
        v534 = *((_QWORD *)__src + 55);
        v557 = *((unsigned __int8 *)v564 + 180);
        v383 = v564[44];
        sub_242CCC10C(v534, v376, v377, v378, v379, v380, v381, v382, v383 | (v557 << 32));
        v384 = *((_QWORD *)__dst + 55);
        v385 = *((_QWORD *)__dst + 56);
        v386 = *((_QWORD *)__dst + 57);
        v387 = *((_QWORD *)__dst + 58);
        v388 = *((_QWORD *)__dst + 59);
        v389 = *((_QWORD *)__dst + 60);
        v390 = *((_QWORD *)__dst + 61);
        v391 = *((_QWORD *)__dst + 62);
        v392 = v566[44] | ((unint64_t)*((unsigned __int8 *)v566 + 180) << 32);
        *((_QWORD *)__dst + 55) = v534;
        *((_QWORD *)__dst + 56) = v376;
        *((_QWORD *)__dst + 57) = v377;
        *((_QWORD *)__dst + 58) = v378;
        *((_QWORD *)__dst + 59) = v379;
        *((_QWORD *)__dst + 60) = v380;
        *((_QWORD *)__dst + 61) = v381;
        *((_QWORD *)__dst + 62) = v382;
        v566[44] = v383;
        *((_BYTE *)v566 + 180) = v557;
        sub_242CCCA5C(v384, v385, v386, v387, v388, v389, v390, v391, v392);
        *((_QWORD *)__dst + 64) = *((_QWORD *)__src + 64);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        *((_QWORD *)__dst + 65) = *((_QWORD *)__src + 65);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_242CBBA7C((uint64_t)(__dst + 440), &qword_257259D68);
        v462 = *(_OWORD *)(__src + 456);
        *v373 = *v374;
        *(_OWORD *)(__dst + 456) = v462;
        v464 = *(_OWORD *)(__src + 488);
        v463 = *(_OWORD *)(__src + 504);
        v465 = *(_OWORD *)(__src + 472);
        *((_QWORD *)__dst + 65) = *((_QWORD *)__src + 65);
        *(_OWORD *)(__dst + 488) = v464;
        *(_OWORD *)(__dst + 504) = v463;
        *(_OWORD *)(__dst + 472) = v465;
      }
      goto LABEL_105;
    }
    if (!v375)
    {
      v470 = *(_OWORD *)(__src + 456);
      *v373 = *v374;
      *(_OWORD *)(__dst + 456) = v470;
      v471 = *(_OWORD *)(__src + 472);
      v472 = *(_OWORD *)(__src + 488);
      v473 = *(_OWORD *)(__src + 504);
      *((_QWORD *)__dst + 65) = *((_QWORD *)__src + 65);
      *(_OWORD *)(__dst + 488) = v472;
      *(_OWORD *)(__dst + 504) = v473;
      *(_OWORD *)(__dst + 472) = v471;
      goto LABEL_105;
    }
    goto LABEL_104;
  }
  if (!v252)
  {
    v333 = *((_OWORD *)__src + 23);
    *v249 = *v250;
    *((_OWORD *)__dst + 23) = v333;
    v334 = *((_OWORD *)__src + 24);
    v335 = *((_OWORD *)__src + 25);
    v336 = *((_OWORD *)__src + 26);
    *((_QWORD *)__dst + 54) = *((_QWORD *)__src + 54);
    *((_OWORD *)__dst + 25) = v335;
    *((_OWORD *)__dst + 26) = v336;
    *((_OWORD *)__dst + 24) = v334;
    if (!*((_QWORD *)__src + 64))
      goto LABEL_93;
    goto LABEL_104;
  }
  if (v252 != 1)
  {
    v337 = *((_QWORD *)__src + 44);
    v338 = *((_QWORD *)__src + 45);
    v339 = *((_QWORD *)__src + 46);
    v340 = *((_QWORD *)__src + 47);
    v341 = *((_QWORD *)__src + 48);
    v342 = *((_QWORD *)__src + 49);
    v343 = *((_QWORD *)__src + 50);
    v344 = *((_QWORD *)__src + 51);
    v532 = *((unsigned __int8 *)v564 + 92);
    v555 = v564[22];
    sub_242CCC10C(v337, v338, v339, v340, v341, v342, v343, v344, v555 | (v532 << 32));
    *((_QWORD *)__dst + 44) = v337;
    *((_QWORD *)__dst + 45) = v338;
    *((_QWORD *)__dst + 46) = v339;
    *((_QWORD *)__dst + 47) = v340;
    *((_QWORD *)__dst + 48) = v341;
    *((_QWORD *)__dst + 49) = v342;
    *((_QWORD *)__dst + 50) = v343;
    *((_QWORD *)__dst + 51) = v344;
    *((_BYTE *)v566 + 92) = v532;
    v566[22] = v555;
    *((_QWORD *)__dst + 53) = *((_QWORD *)__src + 53);
    *((_QWORD *)__dst + 54) = *((_QWORD *)__src + 54);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (!*((_QWORD *)__src + 64))
    {
LABEL_93:
      v345 = *(_OWORD *)(__src + 456);
      *(_OWORD *)(__dst + 440) = *(_OWORD *)(__src + 440);
      *(_OWORD *)(__dst + 456) = v345;
      v346 = *(_OWORD *)(__src + 472);
      v347 = *(_OWORD *)(__src + 488);
      v348 = *(_OWORD *)(__src + 504);
      *((_QWORD *)__dst + 65) = *((_QWORD *)__src + 65);
      *(_OWORD *)(__dst + 488) = v347;
      *(_OWORD *)(__dst + 504) = v348;
      *(_OWORD *)(__dst + 472) = v346;
      goto LABEL_105;
    }
LABEL_104:
    v393 = *((_QWORD *)__src + 55);
    v394 = *((_QWORD *)__src + 56);
    v395 = *((_QWORD *)__src + 57);
    v396 = *((_QWORD *)__src + 58);
    v397 = *((_QWORD *)__src + 59);
    v398 = *((_QWORD *)__src + 60);
    v399 = *((_QWORD *)__src + 61);
    v400 = *((_QWORD *)__src + 62);
    v535 = *((unsigned __int8 *)v564 + 180);
    v558 = v564[44];
    sub_242CCC10C(v393, v394, v395, v396, v397, v398, v399, v400, v558 | (v535 << 32));
    *((_QWORD *)__dst + 55) = v393;
    *((_QWORD *)__dst + 56) = v394;
    *((_QWORD *)__dst + 57) = v395;
    *((_QWORD *)__dst + 58) = v396;
    *((_QWORD *)__dst + 59) = v397;
    *((_QWORD *)__dst + 60) = v398;
    *((_QWORD *)__dst + 61) = v399;
    *((_QWORD *)__dst + 62) = v400;
    *((_BYTE *)v566 + 180) = v535;
    v566[44] = v558;
    *((_QWORD *)__dst + 64) = *((_QWORD *)__src + 64);
    *((_QWORD *)__dst + 65) = *((_QWORD *)__src + 65);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    goto LABEL_105;
  }
  v269 = *v250;
  v270 = *((_OWORD *)__src + 24);
  *((_OWORD *)__dst + 23) = *((_OWORD *)__src + 23);
  *((_OWORD *)__dst + 24) = v270;
  *v249 = v269;
  v271 = *((_OWORD *)__src + 25);
  v272 = *((_OWORD *)__src + 26);
  v273 = *((_OWORD *)__src + 28);
  *((_OWORD *)__dst + 27) = *((_OWORD *)__src + 27);
  *((_OWORD *)__dst + 28) = v273;
  *((_OWORD *)__dst + 25) = v271;
  *((_OWORD *)__dst + 26) = v272;
  v274 = *((_OWORD *)__src + 29);
  v275 = *((_OWORD *)__src + 30);
  v276 = *((_OWORD *)__src + 32);
  *((_OWORD *)__dst + 31) = *((_OWORD *)__src + 31);
  *((_OWORD *)__dst + 32) = v276;
  *((_OWORD *)__dst + 29) = v274;
  *((_OWORD *)__dst + 30) = v275;
LABEL_105:
  v401 = __dst + 528;
  v402 = __src + 528;
  v403 = *((_QWORD *)__dst + 75);
  v404 = *((_QWORD *)__src + 75);
  if (v403 == 1)
  {
    if (!v404)
    {
      v450 = *((_OWORD *)__src + 34);
      *v401 = *v402;
      *((_OWORD *)__dst + 34) = v450;
      v451 = *((_OWORD *)__src + 35);
      v452 = *((_OWORD *)__src + 36);
      v453 = *((_OWORD *)__src + 37);
      *((_QWORD *)__dst + 76) = *((_QWORD *)__src + 76);
      *((_OWORD *)__dst + 36) = v452;
      *((_OWORD *)__dst + 37) = v453;
      *((_OWORD *)__dst + 35) = v451;
      if (!*((_QWORD *)__src + 86))
        goto LABEL_110;
      goto LABEL_128;
    }
    if (v404 == 1)
    {
      v405 = *v402;
      v406 = *((_OWORD *)__src + 35);
      *((_OWORD *)__dst + 34) = *((_OWORD *)__src + 34);
      *((_OWORD *)__dst + 35) = v406;
      *v401 = v405;
      v407 = *((_OWORD *)__src + 36);
      v408 = *((_OWORD *)__src + 37);
      v409 = *((_OWORD *)__src + 39);
      *((_OWORD *)__dst + 38) = *((_OWORD *)__src + 38);
      *((_OWORD *)__dst + 39) = v409;
      *((_OWORD *)__dst + 36) = v407;
      *((_OWORD *)__dst + 37) = v408;
      v410 = *((_OWORD *)__src + 40);
      v411 = *((_OWORD *)__src + 41);
      v412 = *((_OWORD *)__src + 43);
      *((_OWORD *)__dst + 42) = *((_OWORD *)__src + 42);
      *((_OWORD *)__dst + 43) = v412;
      *((_OWORD *)__dst + 40) = v410;
      *((_OWORD *)__dst + 41) = v411;
      return __dst;
    }
    goto LABEL_109;
  }
  if (v404 == 1)
  {
    sub_242CD18CC((uint64_t)(__dst + 528));
    v426 = *((_OWORD *)__src + 34);
    v425 = *((_OWORD *)__src + 35);
    *v401 = *v402;
    *((_OWORD *)__dst + 34) = v426;
    *((_OWORD *)__dst + 35) = v425;
    v427 = *((_OWORD *)__src + 39);
    v429 = *((_OWORD *)__src + 36);
    v428 = *((_OWORD *)__src + 37);
    *((_OWORD *)__dst + 38) = *((_OWORD *)__src + 38);
    *((_OWORD *)__dst + 39) = v427;
    *((_OWORD *)__dst + 36) = v429;
    *((_OWORD *)__dst + 37) = v428;
    v430 = *((_OWORD *)__src + 43);
    v432 = *((_OWORD *)__src + 40);
    v431 = *((_OWORD *)__src + 41);
    *((_OWORD *)__dst + 42) = *((_OWORD *)__src + 42);
    *((_OWORD *)__dst + 43) = v430;
    *((_OWORD *)__dst + 40) = v432;
    *((_OWORD *)__dst + 41) = v431;
    return __dst;
  }
  if (v403)
  {
    if (v404)
    {
      v433 = *((_QWORD *)__src + 67);
      v434 = *((_QWORD *)__src + 68);
      v435 = *((_QWORD *)__src + 69);
      v436 = *((_QWORD *)__src + 70);
      v437 = *((_QWORD *)__src + 71);
      v438 = *((_QWORD *)__src + 72);
      v439 = *((_QWORD *)__src + 73);
      v537 = *((_QWORD *)__src + 66);
      v560 = *((unsigned __int8 *)v564 + 268);
      v440 = v564[66];
      sub_242CCC10C(v537, v433, v434, v435, v436, v437, v438, v439, v440 | (v560 << 32));
      v441 = *((_QWORD *)__dst + 66);
      v442 = *((_QWORD *)__dst + 67);
      v443 = *((_QWORD *)__dst + 68);
      v444 = *((_QWORD *)__dst + 69);
      v445 = *((_QWORD *)__dst + 70);
      v446 = *((_QWORD *)__dst + 71);
      v447 = *((_QWORD *)__dst + 72);
      v448 = *((_QWORD *)__dst + 73);
      v449 = v566[66] | ((unint64_t)*((unsigned __int8 *)v566 + 268) << 32);
      *((_QWORD *)__dst + 66) = v537;
      *((_QWORD *)__dst + 67) = v433;
      *((_QWORD *)__dst + 68) = v434;
      *((_QWORD *)__dst + 69) = v435;
      *((_QWORD *)__dst + 70) = v436;
      *((_QWORD *)__dst + 71) = v437;
      *((_QWORD *)__dst + 72) = v438;
      *((_QWORD *)__dst + 73) = v439;
      v566[66] = v440;
      *((_BYTE *)v566 + 268) = v560;
      sub_242CCCA5C(v441, v442, v443, v444, v445, v446, v447, v448, v449);
      *((_QWORD *)__dst + 75) = *((_QWORD *)__src + 75);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *((_QWORD *)__dst + 76) = *((_QWORD *)__src + 76);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_242CBBA7C((uint64_t)(__dst + 528), &qword_257259D68);
      v466 = *((_OWORD *)__src + 34);
      *v401 = *v402;
      *((_OWORD *)__dst + 34) = v466;
      v468 = *((_OWORD *)__src + 36);
      v467 = *((_OWORD *)__src + 37);
      v469 = *((_OWORD *)__src + 35);
      *((_QWORD *)__dst + 76) = *((_QWORD *)__src + 76);
      *((_OWORD *)__dst + 36) = v468;
      *((_OWORD *)__dst + 37) = v467;
      *((_OWORD *)__dst + 35) = v469;
    }
  }
  else if (v404)
  {
    v454 = *((_QWORD *)__src + 66);
    v455 = *((_QWORD *)__src + 67);
    v456 = *((_QWORD *)__src + 68);
    v457 = *((_QWORD *)__src + 69);
    v458 = *((_QWORD *)__src + 70);
    v459 = *((_QWORD *)__src + 71);
    v460 = *((_QWORD *)__src + 72);
    v461 = *((_QWORD *)__src + 73);
    v538 = *((unsigned __int8 *)v564 + 268);
    v561 = v564[66];
    sub_242CCC10C(v454, v455, v456, v457, v458, v459, v460, v461, v561 | (v538 << 32));
    *((_QWORD *)__dst + 66) = v454;
    *((_QWORD *)__dst + 67) = v455;
    *((_QWORD *)__dst + 68) = v456;
    *((_QWORD *)__dst + 69) = v457;
    *((_QWORD *)__dst + 70) = v458;
    *((_QWORD *)__dst + 71) = v459;
    *((_QWORD *)__dst + 72) = v460;
    *((_QWORD *)__dst + 73) = v461;
    *((_BYTE *)v566 + 268) = v538;
    v566[66] = v561;
    *((_QWORD *)__dst + 75) = *((_QWORD *)__src + 75);
    *((_QWORD *)__dst + 76) = *((_QWORD *)__src + 76);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v474 = *((_OWORD *)__src + 34);
    *v401 = *v402;
    *((_OWORD *)__dst + 34) = v474;
    v475 = *((_OWORD *)__src + 35);
    v476 = *((_OWORD *)__src + 36);
    v477 = *((_OWORD *)__src + 37);
    *((_QWORD *)__dst + 76) = *((_QWORD *)__src + 76);
    *((_OWORD *)__dst + 36) = v476;
    *((_OWORD *)__dst + 37) = v477;
    *((_OWORD *)__dst + 35) = v475;
  }
  v478 = __dst + 616;
  v479 = __src + 616;
  v480 = *((_QWORD *)__src + 86);
  if (!*((_QWORD *)__dst + 86))
  {
    if (!v480)
    {
      v511 = *(_OWORD *)(__src + 632);
      *v478 = *v479;
      *(_OWORD *)(__dst + 632) = v511;
      v512 = *(_OWORD *)(__src + 648);
      v513 = *(_OWORD *)(__src + 664);
      v514 = *(_OWORD *)(__src + 680);
      *((_QWORD *)__dst + 87) = *((_QWORD *)__src + 87);
      *(_OWORD *)(__dst + 664) = v513;
      *(_OWORD *)(__dst + 680) = v514;
      *(_OWORD *)(__dst + 648) = v512;
      return __dst;
    }
    goto LABEL_128;
  }
  if (v480)
  {
    v481 = *((_QWORD *)__src + 78);
    v482 = *((_QWORD *)__src + 79);
    v483 = *((_QWORD *)__src + 80);
    v484 = *((_QWORD *)__src + 81);
    v485 = *((_QWORD *)__src + 82);
    v486 = *((_QWORD *)__src + 83);
    v487 = *((_QWORD *)__src + 84);
    v539 = *((_QWORD *)__src + 77);
    v562 = *((unsigned __int8 *)v564 + 356);
    v488 = v564[88];
    sub_242CCC10C(v539, v481, v482, v483, v484, v485, v486, v487, v488 | (v562 << 32));
    v489 = *((_QWORD *)__dst + 77);
    v490 = *((_QWORD *)__dst + 78);
    v491 = *((_QWORD *)__dst + 79);
    v492 = *((_QWORD *)__dst + 80);
    v493 = *((_QWORD *)__dst + 81);
    v494 = *((_QWORD *)__dst + 82);
    v495 = *((_QWORD *)__dst + 83);
    v496 = *((_QWORD *)__dst + 84);
    v497 = v566[88] | ((unint64_t)*((unsigned __int8 *)v566 + 356) << 32);
    *((_QWORD *)__dst + 77) = v539;
    *((_QWORD *)__dst + 78) = v481;
    *((_QWORD *)__dst + 79) = v482;
    *((_QWORD *)__dst + 80) = v483;
    *((_QWORD *)__dst + 81) = v484;
    *((_QWORD *)__dst + 82) = v485;
    *((_QWORD *)__dst + 83) = v486;
    *((_QWORD *)__dst + 84) = v487;
    v566[88] = v488;
    *((_BYTE *)v566 + 356) = v562;
    sub_242CCCA5C(v489, v490, v491, v492, v493, v494, v495, v496, v497);
    *((_QWORD *)__dst + 86) = *((_QWORD *)__src + 86);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *((_QWORD *)__dst + 87) = *((_QWORD *)__src + 87);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_242CBBA7C((uint64_t)(__dst + 616), &qword_257259D68);
    v507 = *(_OWORD *)(__src + 632);
    *v478 = *v479;
    *(_OWORD *)(__dst + 632) = v507;
    v509 = *(_OWORD *)(__src + 664);
    v508 = *(_OWORD *)(__src + 680);
    v510 = *(_OWORD *)(__src + 648);
    *((_QWORD *)__dst + 87) = *((_QWORD *)__src + 87);
    *(_OWORD *)(__dst + 664) = v509;
    *(_OWORD *)(__dst + 680) = v508;
    *(_OWORD *)(__dst + 648) = v510;
  }
  return __dst;
}

void *__swift_memcpy704_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x2C0uLL);
}

char *assignWithTake for ActivityFlexibleUpdateTheme.Graphic(char *__dst, char *__src)
{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _OWORD *v22;
  _OWORD *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _OWORD *v31;
  _OWORD *v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  char v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  __int128 v52;
  __int128 v53;
  char v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  __int128 v65;
  __int128 v66;
  char v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  __int128 v78;
  __int128 v79;
  char v80;
  int v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  char v95;
  int v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  char v110;
  int v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unint64_t v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  char v125;
  int v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  char v140;
  int v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  unint64_t v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;

  v4 = __dst + 264;
  v5 = __src + 264;
  v6 = *((_QWORD *)__dst + 9);
  if (v6 == 2)
    goto LABEL_4;
  v7 = *((_QWORD *)__src + 9);
  if (v7 == 2)
  {
    sub_242DF61C0((uint64_t)__dst);
LABEL_4:
    memcpy(__dst, __src, 0x160uLL);
    goto LABEL_13;
  }
  if (v6 == 1)
    goto LABEL_8;
  if (v7 == 1)
  {
    sub_242CD1900((uint64_t)__dst);
LABEL_8:
    v8 = *((_OWORD *)__src + 9);
    *((_OWORD *)__dst + 8) = *((_OWORD *)__src + 8);
    *((_OWORD *)__dst + 9) = v8;
    *((_OWORD *)__dst + 10) = *((_OWORD *)__src + 10);
    v9 = *((_OWORD *)__src + 5);
    *((_OWORD *)__dst + 4) = *((_OWORD *)__src + 4);
    *((_OWORD *)__dst + 5) = v9;
    v10 = *((_OWORD *)__src + 7);
    *((_OWORD *)__dst + 6) = *((_OWORD *)__src + 6);
    *((_OWORD *)__dst + 7) = v10;
    v11 = *((_OWORD *)__src + 1);
    *(_OWORD *)__dst = *(_OWORD *)__src;
    *((_OWORD *)__dst + 1) = v11;
    v12 = *((_OWORD *)__src + 3);
    *((_OWORD *)__dst + 2) = *((_OWORD *)__src + 2);
    *((_OWORD *)__dst + 3) = v12;
    goto LABEL_9;
  }
  if (v6)
  {
    if (v7)
    {
      v41 = __src[68];
      v42 = *((_DWORD *)__src + 16);
      v43 = *(_QWORD *)__dst;
      v44 = *((_QWORD *)__dst + 1);
      v45 = *((_QWORD *)__dst + 2);
      v46 = *((_QWORD *)__dst + 3);
      v47 = *((_QWORD *)__dst + 4);
      v48 = *((_QWORD *)__dst + 5);
      v49 = *((_QWORD *)__dst + 6);
      v50 = *((_QWORD *)__dst + 7);
      v51 = *((unsigned int *)__dst + 16) | ((unint64_t)__dst[68] << 32);
      v52 = *((_OWORD *)__src + 1);
      *(_OWORD *)__dst = *(_OWORD *)__src;
      *((_OWORD *)__dst + 1) = v52;
      v53 = *((_OWORD *)__src + 3);
      *((_OWORD *)__dst + 2) = *((_OWORD *)__src + 2);
      *((_OWORD *)__dst + 3) = v53;
      *((_DWORD *)__dst + 16) = v42;
      __dst[68] = v41;
      sub_242CCCA5C(v43, v44, v45, v46, v47, v48, v49, v50, v51);
      *((_QWORD *)__dst + 9) = *((_QWORD *)__src + 9);
      swift_bridgeObjectRelease();
      *((_QWORD *)__dst + 10) = *((_QWORD *)__src + 10);
      swift_bridgeObjectRelease();
      goto LABEL_40;
    }
    sub_242CBBA7C((uint64_t)__dst, &qword_257259D68);
  }
  v93 = *((_OWORD *)__src + 3);
  *((_OWORD *)__dst + 2) = *((_OWORD *)__src + 2);
  *((_OWORD *)__dst + 3) = v93;
  *((_OWORD *)__dst + 4) = *((_OWORD *)__src + 4);
  *((_QWORD *)__dst + 10) = *((_QWORD *)__src + 10);
  v94 = *((_OWORD *)__src + 1);
  *(_OWORD *)__dst = *(_OWORD *)__src;
  *((_OWORD *)__dst + 1) = v94;
LABEL_40:
  if (*((_QWORD *)__dst + 20))
  {
    if (*((_QWORD *)__src + 20))
    {
      v95 = __src[156];
      v96 = *((_DWORD *)__src + 38);
      v97 = *((_QWORD *)__dst + 11);
      v98 = *((_QWORD *)__dst + 12);
      v99 = *((_QWORD *)__dst + 13);
      v100 = *((_QWORD *)__dst + 14);
      v101 = *((_QWORD *)__dst + 15);
      v102 = *((_QWORD *)__dst + 16);
      v103 = *((_QWORD *)__dst + 17);
      v104 = *((_QWORD *)__dst + 18);
      v105 = *((unsigned int *)__dst + 38) | ((unint64_t)__dst[156] << 32);
      v106 = *(_OWORD *)(__src + 104);
      *(_OWORD *)(__dst + 88) = *(_OWORD *)(__src + 88);
      *(_OWORD *)(__dst + 104) = v106;
      v107 = *(_OWORD *)(__src + 136);
      *(_OWORD *)(__dst + 120) = *(_OWORD *)(__src + 120);
      *(_OWORD *)(__dst + 136) = v107;
      *((_DWORD *)__dst + 38) = v96;
      __dst[156] = v95;
      sub_242CCCA5C(v97, v98, v99, v100, v101, v102, v103, v104, v105);
      *((_QWORD *)__dst + 20) = *((_QWORD *)__src + 20);
      swift_bridgeObjectRelease();
      *((_QWORD *)__dst + 21) = *((_QWORD *)__src + 21);
      swift_bridgeObjectRelease();
      goto LABEL_9;
    }
    sub_242CBBA7C((uint64_t)(__dst + 88), &qword_257259D68);
  }
  v153 = *(_OWORD *)(__src + 136);
  *(_OWORD *)(__dst + 120) = *(_OWORD *)(__src + 120);
  *(_OWORD *)(__dst + 136) = v153;
  *(_OWORD *)(__dst + 152) = *(_OWORD *)(__src + 152);
  *((_QWORD *)__dst + 21) = *((_QWORD *)__src + 21);
  v154 = *(_OWORD *)(__src + 104);
  *(_OWORD *)(__dst + 88) = *(_OWORD *)(__src + 88);
  *(_OWORD *)(__dst + 104) = v154;
LABEL_9:
  v13 = __dst + 176;
  v14 = __src + 176;
  v15 = *((_QWORD *)__dst + 31);
  if (v15 == 1)
  {
LABEL_12:
    v17 = *((_OWORD *)__src + 20);
    *((_OWORD *)__dst + 19) = *((_OWORD *)__src + 19);
    *((_OWORD *)__dst + 20) = v17;
    *((_OWORD *)__dst + 21) = *((_OWORD *)__src + 21);
    v18 = *((_OWORD *)__src + 16);
    *((_OWORD *)__dst + 15) = *((_OWORD *)__src + 15);
    *((_OWORD *)__dst + 16) = v18;
    v19 = *((_OWORD *)__src + 18);
    *((_OWORD *)__dst + 17) = *((_OWORD *)__src + 17);
    *((_OWORD *)__dst + 18) = v19;
    v20 = *((_OWORD *)__src + 12);
    *v13 = *v14;
    *((_OWORD *)__dst + 12) = v20;
    v21 = *((_OWORD *)__src + 14);
    *((_OWORD *)__dst + 13) = *((_OWORD *)__src + 13);
    *((_OWORD *)__dst + 14) = v21;
    goto LABEL_13;
  }
  v16 = *((_QWORD *)__src + 31);
  if (v16 == 1)
  {
    sub_242CD18CC((uint64_t)(__dst + 176));
    goto LABEL_12;
  }
  if (v15)
  {
    if (v16)
    {
      v54 = __src[244];
      v55 = *((_DWORD *)__src + 60);
      v56 = *((_QWORD *)__dst + 22);
      v57 = *((_QWORD *)__dst + 23);
      v58 = *((_QWORD *)__dst + 24);
      v59 = *((_QWORD *)__dst + 25);
      v60 = *((_QWORD *)__dst + 26);
      v61 = *((_QWORD *)__dst + 27);
      v62 = *((_QWORD *)__dst + 28);
      v63 = *((_QWORD *)__dst + 29);
      v64 = *((unsigned int *)__dst + 60) | ((unint64_t)__dst[244] << 32);
      v65 = *((_OWORD *)__src + 12);
      *((_OWORD *)__dst + 11) = *((_OWORD *)__src + 11);
      *((_OWORD *)__dst + 12) = v65;
      v66 = *((_OWORD *)__src + 14);
      *((_OWORD *)__dst + 13) = *((_OWORD *)__src + 13);
      *((_OWORD *)__dst + 14) = v66;
      *((_DWORD *)__dst + 60) = v55;
      __dst[244] = v54;
      sub_242CCCA5C(v56, v57, v58, v59, v60, v61, v62, v63, v64);
      *((_QWORD *)__dst + 31) = *((_QWORD *)__src + 31);
      swift_bridgeObjectRelease();
      *((_QWORD *)__dst + 32) = *((_QWORD *)__src + 32);
      swift_bridgeObjectRelease();
      goto LABEL_45;
    }
    sub_242CBBA7C((uint64_t)(__dst + 176), &qword_257259D68);
  }
  v108 = *((_OWORD *)__src + 14);
  *((_OWORD *)__dst + 13) = *((_OWORD *)__src + 13);
  *((_OWORD *)__dst + 14) = v108;
  *((_OWORD *)__dst + 15) = *((_OWORD *)__src + 15);
  *((_QWORD *)__dst + 32) = *((_QWORD *)__src + 32);
  v109 = *((_OWORD *)__src + 12);
  *v13 = *v14;
  *((_OWORD *)__dst + 12) = v109;
LABEL_45:
  if (*((_QWORD *)__dst + 42))
  {
    if (*((_QWORD *)__src + 42))
    {
      v110 = v5[68];
      v111 = *((_DWORD *)v5 + 16);
      v112 = *((_QWORD *)__dst + 33);
      v113 = *((_QWORD *)__dst + 34);
      v114 = *((_QWORD *)__dst + 35);
      v115 = *((_QWORD *)__dst + 36);
      v116 = *((_QWORD *)__dst + 37);
      v117 = *((_QWORD *)__dst + 38);
      v118 = *((_QWORD *)__dst + 39);
      v119 = *((_QWORD *)__dst + 40);
      v120 = *((unsigned int *)v4 + 16) | ((unint64_t)v4[68] << 32);
      v121 = *((_OWORD *)v5 + 1);
      *(_OWORD *)v4 = *(_OWORD *)v5;
      *((_OWORD *)v4 + 1) = v121;
      v122 = *((_OWORD *)v5 + 3);
      *((_OWORD *)v4 + 2) = *((_OWORD *)v5 + 2);
      *((_OWORD *)v4 + 3) = v122;
      *((_DWORD *)v4 + 16) = v111;
      v4[68] = v110;
      sub_242CCCA5C(v112, v113, v114, v115, v116, v117, v118, v119, v120);
      *((_QWORD *)__dst + 42) = *((_QWORD *)__src + 42);
      swift_bridgeObjectRelease();
      *((_QWORD *)__dst + 43) = *((_QWORD *)__src + 43);
      swift_bridgeObjectRelease();
      goto LABEL_13;
    }
    sub_242CBBA7C((uint64_t)v4, &qword_257259D68);
  }
  v155 = *((_OWORD *)v5 + 3);
  *((_OWORD *)v4 + 2) = *((_OWORD *)v5 + 2);
  *((_OWORD *)v4 + 3) = v155;
  *((_OWORD *)v4 + 4) = *((_OWORD *)v5 + 4);
  *((_QWORD *)v4 + 10) = *((_QWORD *)v5 + 10);
  v156 = *((_OWORD *)v5 + 1);
  *(_OWORD *)v4 = *(_OWORD *)v5;
  *((_OWORD *)v4 + 1) = v156;
LABEL_13:
  v22 = __dst + 352;
  v23 = __src + 352;
  v24 = *((_QWORD *)__dst + 53);
  if (v24 != 2)
  {
    v25 = *((_QWORD *)__src + 53);
    if (v25 == 2)
    {
      sub_242DF61C0((uint64_t)(__dst + 352));
      goto LABEL_16;
    }
    if (v24 == 1)
      goto LABEL_20;
    if (v25 == 1)
    {
      sub_242CD1900((uint64_t)(__dst + 352));
LABEL_20:
      v26 = *((_OWORD *)__src + 31);
      *((_OWORD *)__dst + 30) = *((_OWORD *)__src + 30);
      *((_OWORD *)__dst + 31) = v26;
      *((_OWORD *)__dst + 32) = *((_OWORD *)__src + 32);
      v27 = *((_OWORD *)__src + 27);
      *((_OWORD *)__dst + 26) = *((_OWORD *)__src + 26);
      *((_OWORD *)__dst + 27) = v27;
      v28 = *((_OWORD *)__src + 29);
      *((_OWORD *)__dst + 28) = *((_OWORD *)__src + 28);
      *((_OWORD *)__dst + 29) = v28;
      v29 = *((_OWORD *)__src + 23);
      *v22 = *v23;
      *((_OWORD *)__dst + 23) = v29;
      v30 = *((_OWORD *)__src + 25);
      *((_OWORD *)__dst + 24) = *((_OWORD *)__src + 24);
      *((_OWORD *)__dst + 25) = v30;
      goto LABEL_21;
    }
    if (v24)
    {
      if (v25)
      {
        v67 = v5[156];
        v68 = *((_DWORD *)v5 + 38);
        v69 = *((_QWORD *)__dst + 44);
        v70 = *((_QWORD *)__dst + 45);
        v71 = *((_QWORD *)__dst + 46);
        v72 = *((_QWORD *)__dst + 47);
        v73 = *((_QWORD *)__dst + 48);
        v74 = *((_QWORD *)__dst + 49);
        v75 = *((_QWORD *)__dst + 50);
        v76 = *((_QWORD *)__dst + 51);
        v77 = *((unsigned int *)v4 + 38) | ((unint64_t)v4[156] << 32);
        v78 = *((_OWORD *)__src + 23);
        *((_OWORD *)__dst + 22) = *((_OWORD *)__src + 22);
        *((_OWORD *)__dst + 23) = v78;
        v79 = *((_OWORD *)__src + 25);
        *((_OWORD *)__dst + 24) = *((_OWORD *)__src + 24);
        *((_OWORD *)__dst + 25) = v79;
        *((_DWORD *)v4 + 38) = v68;
        v4[156] = v67;
        sub_242CCCA5C(v69, v70, v71, v72, v73, v74, v75, v76, v77);
        *((_QWORD *)__dst + 53) = *((_QWORD *)__src + 53);
        swift_bridgeObjectRelease();
        *((_QWORD *)__dst + 54) = *((_QWORD *)__src + 54);
        swift_bridgeObjectRelease();
        goto LABEL_50;
      }
      sub_242CBBA7C((uint64_t)(__dst + 352), &qword_257259D68);
    }
    v123 = *((_OWORD *)__src + 25);
    *((_OWORD *)__dst + 24) = *((_OWORD *)__src + 24);
    *((_OWORD *)__dst + 25) = v123;
    *((_OWORD *)__dst + 26) = *((_OWORD *)__src + 26);
    *((_QWORD *)__dst + 54) = *((_QWORD *)__src + 54);
    v124 = *((_OWORD *)__src + 23);
    *v22 = *v23;
    *((_OWORD *)__dst + 23) = v124;
LABEL_50:
    if (*((_QWORD *)__dst + 64))
    {
      if (*((_QWORD *)__src + 64))
      {
        v125 = v5[244];
        v126 = *((_DWORD *)v5 + 60);
        v127 = *((_QWORD *)__dst + 55);
        v128 = *((_QWORD *)__dst + 56);
        v129 = *((_QWORD *)__dst + 57);
        v130 = *((_QWORD *)__dst + 58);
        v131 = *((_QWORD *)__dst + 59);
        v132 = *((_QWORD *)__dst + 60);
        v133 = *((_QWORD *)__dst + 61);
        v134 = *((_QWORD *)__dst + 62);
        v135 = *((unsigned int *)v4 + 60) | ((unint64_t)v4[244] << 32);
        v136 = *((_OWORD *)v5 + 12);
        *((_OWORD *)v4 + 11) = *((_OWORD *)v5 + 11);
        *((_OWORD *)v4 + 12) = v136;
        v137 = *((_OWORD *)v5 + 14);
        *((_OWORD *)v4 + 13) = *((_OWORD *)v5 + 13);
        *((_OWORD *)v4 + 14) = v137;
        *((_DWORD *)v4 + 60) = v126;
        v4[244] = v125;
        sub_242CCCA5C(v127, v128, v129, v130, v131, v132, v133, v134, v135);
        *((_QWORD *)__dst + 64) = *((_QWORD *)__src + 64);
        swift_bridgeObjectRelease();
        *((_QWORD *)__dst + 65) = *((_QWORD *)__src + 65);
        swift_bridgeObjectRelease();
        goto LABEL_21;
      }
      sub_242CBBA7C((uint64_t)(v4 + 176), &qword_257259D68);
    }
    v157 = *((_OWORD *)v5 + 14);
    *((_OWORD *)v4 + 13) = *((_OWORD *)v5 + 13);
    *((_OWORD *)v4 + 14) = v157;
    *((_OWORD *)v4 + 15) = *((_OWORD *)v5 + 15);
    *((_QWORD *)v4 + 32) = *((_QWORD *)v5 + 32);
    v158 = *((_OWORD *)v5 + 12);
    *((_OWORD *)v4 + 11) = *((_OWORD *)v5 + 11);
    *((_OWORD *)v4 + 12) = v158;
LABEL_21:
    v31 = __dst + 528;
    v32 = __src + 528;
    v33 = *((_QWORD *)__dst + 75);
    if (v33 == 1)
    {
LABEL_24:
      v35 = *((_OWORD *)__src + 42);
      *((_OWORD *)__dst + 41) = *((_OWORD *)__src + 41);
      *((_OWORD *)__dst + 42) = v35;
      *((_OWORD *)__dst + 43) = *((_OWORD *)__src + 43);
      v36 = *((_OWORD *)__src + 38);
      *((_OWORD *)__dst + 37) = *((_OWORD *)__src + 37);
      *((_OWORD *)__dst + 38) = v36;
      v37 = *((_OWORD *)__src + 40);
      *((_OWORD *)__dst + 39) = *((_OWORD *)__src + 39);
      *((_OWORD *)__dst + 40) = v37;
      v38 = *((_OWORD *)__src + 34);
      *v31 = *v32;
      *((_OWORD *)__dst + 34) = v38;
      v39 = *((_OWORD *)__src + 36);
      *((_OWORD *)__dst + 35) = *((_OWORD *)__src + 35);
      *((_OWORD *)__dst + 36) = v39;
      return __dst;
    }
    v34 = *((_QWORD *)__src + 75);
    if (v34 == 1)
    {
      sub_242CD18CC((uint64_t)(__dst + 528));
      goto LABEL_24;
    }
    if (v33)
    {
      if (v34)
      {
        v80 = v5[332];
        v81 = *((_DWORD *)v5 + 82);
        v82 = *((_QWORD *)__dst + 66);
        v83 = *((_QWORD *)__dst + 67);
        v84 = *((_QWORD *)__dst + 68);
        v85 = *((_QWORD *)__dst + 69);
        v86 = *((_QWORD *)__dst + 70);
        v87 = *((_QWORD *)__dst + 71);
        v88 = *((_QWORD *)__dst + 72);
        v89 = *((_QWORD *)__dst + 73);
        v90 = *((unsigned int *)v4 + 82) | ((unint64_t)v4[332] << 32);
        v91 = *((_OWORD *)__src + 34);
        *((_OWORD *)__dst + 33) = *((_OWORD *)__src + 33);
        *((_OWORD *)__dst + 34) = v91;
        v92 = *((_OWORD *)__src + 36);
        *((_OWORD *)__dst + 35) = *((_OWORD *)__src + 35);
        *((_OWORD *)__dst + 36) = v92;
        *((_DWORD *)v4 + 82) = v81;
        v4[332] = v80;
        sub_242CCCA5C(v82, v83, v84, v85, v86, v87, v88, v89, v90);
        *((_QWORD *)__dst + 75) = *((_QWORD *)__src + 75);
        swift_bridgeObjectRelease();
        *((_QWORD *)__dst + 76) = *((_QWORD *)__src + 76);
        swift_bridgeObjectRelease();
        goto LABEL_55;
      }
      sub_242CBBA7C((uint64_t)(__dst + 528), &qword_257259D68);
    }
    v138 = *((_OWORD *)__src + 36);
    *((_OWORD *)__dst + 35) = *((_OWORD *)__src + 35);
    *((_OWORD *)__dst + 36) = v138;
    *((_OWORD *)__dst + 37) = *((_OWORD *)__src + 37);
    *((_QWORD *)__dst + 76) = *((_QWORD *)__src + 76);
    v139 = *((_OWORD *)__src + 34);
    *v31 = *v32;
    *((_OWORD *)__dst + 34) = v139;
LABEL_55:
    if (*((_QWORD *)__dst + 86))
    {
      if (*((_QWORD *)__src + 86))
      {
        v140 = v5[420];
        v141 = *((_DWORD *)v5 + 104);
        v142 = *((_QWORD *)__dst + 77);
        v143 = *((_QWORD *)__dst + 78);
        v144 = *((_QWORD *)__dst + 79);
        v145 = *((_QWORD *)__dst + 80);
        v146 = *((_QWORD *)__dst + 81);
        v147 = *((_QWORD *)__dst + 82);
        v148 = *((_QWORD *)__dst + 83);
        v149 = *((_QWORD *)__dst + 84);
        v150 = *((unsigned int *)v4 + 104) | ((unint64_t)v4[420] << 32);
        v151 = *((_OWORD *)v5 + 23);
        *((_OWORD *)v4 + 22) = *((_OWORD *)v5 + 22);
        *((_OWORD *)v4 + 23) = v151;
        v152 = *((_OWORD *)v5 + 25);
        *((_OWORD *)v4 + 24) = *((_OWORD *)v5 + 24);
        *((_OWORD *)v4 + 25) = v152;
        *((_DWORD *)v4 + 104) = v141;
        v4[420] = v140;
        sub_242CCCA5C(v142, v143, v144, v145, v146, v147, v148, v149, v150);
        *((_QWORD *)__dst + 86) = *((_QWORD *)__src + 86);
        swift_bridgeObjectRelease();
        *((_QWORD *)__dst + 87) = *((_QWORD *)__src + 87);
        swift_bridgeObjectRelease();
        return __dst;
      }
      sub_242CBBA7C((uint64_t)(v4 + 352), &qword_257259D68);
    }
    v159 = *((_OWORD *)v5 + 25);
    *((_OWORD *)v4 + 24) = *((_OWORD *)v5 + 24);
    *((_OWORD *)v4 + 25) = v159;
    *((_OWORD *)v4 + 26) = *((_OWORD *)v5 + 26);
    *((_QWORD *)v4 + 54) = *((_QWORD *)v5 + 54);
    v160 = *((_OWORD *)v5 + 23);
    *((_OWORD *)v4 + 22) = *((_OWORD *)v5 + 22);
    *((_OWORD *)v4 + 23) = v160;
    return __dst;
  }
LABEL_16:
  memcpy(__dst + 352, __src + 352, 0x160uLL);
  return __dst;
}

uint64_t getEnumTagSinglePayload for ActivityFlexibleUpdateTheme.Graphic(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;
  int v5;
  int v6;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFD && *(_BYTE *)(a1 + 704))
    return (*(_DWORD *)a1 + 2147483645);
  v3 = *(_QWORD *)(a1 + 72);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v5 = -1;
  else
    v5 = v4;
  if (v4 <= 1)
    v4 = 1;
  v6 = v4 - 2;
  if (v5 < 1)
    v6 = -1;
  return (v6 + 1);
}

uint64_t storeEnumTagSinglePayload for ActivityFlexibleUpdateTheme.Graphic(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFC)
  {
    *(_QWORD *)(result + 696) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
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
    *(_OWORD *)(result + 680) = 0u;
    *(_OWORD *)(result + 664) = 0u;
    *(_OWORD *)(result + 648) = 0u;
    *(_OWORD *)(result + 632) = 0u;
    *(_OWORD *)(result + 616) = 0u;
    *(_OWORD *)(result + 600) = 0u;
    *(_OWORD *)(result + 584) = 0u;
    *(_OWORD *)(result + 568) = 0u;
    *(_OWORD *)(result + 552) = 0u;
    *(_OWORD *)(result + 536) = 0u;
    *(_OWORD *)(result + 520) = 0u;
    *(_OWORD *)(result + 504) = 0u;
    *(_OWORD *)(result + 488) = 0u;
    *(_OWORD *)(result + 472) = 0u;
    *(_OWORD *)(result + 456) = 0u;
    *(_OWORD *)(result + 440) = 0u;
    *(_OWORD *)(result + 424) = 0u;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 704) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 704) = 0;
    if (a2)
      *(_QWORD *)(result + 72) = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ActivityFlexibleUpdateTheme.Graphic()
{
  return &type metadata for ActivityFlexibleUpdateTheme.Graphic;
}

uint64_t storeEnumTagSinglePayload for ActivityFlexibleUpdateTheme.Graphic.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_242FF1FE0 + 4 * byte_243008E09[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_242FF2014 + 4 * byte_243008E04[v4]))();
}

uint64_t sub_242FF2014(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_242FF201C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x242FF2024);
  return result;
}

uint64_t sub_242FF2030(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x242FF2038);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_242FF203C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_242FF2044(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ActivityFlexibleUpdateTheme.Graphic.CodingKeys()
{
  return &type metadata for ActivityFlexibleUpdateTheme.Graphic.CodingKeys;
}

uint64_t _s22NewsLiveActivitiesCore22ActivityFlexibleUpdateV11GraphicSizeOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_242FF20AC + 4 * byte_243008E13[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_242FF20E0 + 4 * byte_243008E0E[v4]))();
}

uint64_t sub_242FF20E0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_242FF20E8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x242FF20F0);
  return result;
}

uint64_t sub_242FF20FC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x242FF2104);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_242FF2108(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_242FF2110(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ActivityFlexibleUpdate.Graphic.CodingKeys()
{
  return &type metadata for ActivityFlexibleUpdate.Graphic.CodingKeys;
}

unint64_t sub_242FF2130()
{
  unint64_t result;

  result = qword_257260580;
  if (!qword_257260580)
  {
    result = MEMORY[0x2494F057C](&unk_2430092E4, &type metadata for ActivityFlexibleUpdate.Graphic.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257260580);
  }
  return result;
}

unint64_t sub_242FF2178()
{
  unint64_t result;

  result = qword_257260588;
  if (!qword_257260588)
  {
    result = MEMORY[0x2494F057C](&unk_24300939C, &type metadata for ActivityFlexibleUpdateTheme.Graphic.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257260588);
  }
  return result;
}

unint64_t sub_242FF21C0()
{
  unint64_t result;

  result = qword_257260590;
  if (!qword_257260590)
  {
    result = MEMORY[0x2494F057C](&unk_24300930C, &type metadata for ActivityFlexibleUpdateTheme.Graphic.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257260590);
  }
  return result;
}

unint64_t sub_242FF2208()
{
  unint64_t result;

  result = qword_257260598;
  if (!qword_257260598)
  {
    result = MEMORY[0x2494F057C](&unk_243009334, &type metadata for ActivityFlexibleUpdateTheme.Graphic.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257260598);
  }
  return result;
}

unint64_t sub_242FF2250()
{
  unint64_t result;

  result = qword_2572605A0;
  if (!qword_2572605A0)
  {
    result = MEMORY[0x2494F057C](&unk_243009254, &type metadata for ActivityFlexibleUpdate.Graphic.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2572605A0);
  }
  return result;
}

unint64_t sub_242FF2298()
{
  unint64_t result;

  result = qword_2572605A8;
  if (!qword_2572605A8)
  {
    result = MEMORY[0x2494F057C](&unk_24300927C, &type metadata for ActivityFlexibleUpdate.Graphic.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2572605A8);
  }
  return result;
}

uint64_t sub_242FF22DC(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x7465737361 && a2 == 0xE500000000000000;
  if (v2 || (sub_242FF6160() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 1702521203 && a2 == 0xE400000000000000 || (sub_242FF6160() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6567646162 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_242FF6160();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_242FF2410(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x7465737361 && a2 == 0xE500000000000000;
  if (v2 || (sub_242FF6160() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6567646162 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_242FF6160();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

unint64_t sub_242FF24F0()
{
  unint64_t result;

  result = qword_2572605B0;
  if (!qword_2572605B0)
  {
    result = MEMORY[0x2494F057C](&protocol conformance descriptor for ActivityFlexibleUpdate.GraphicSize, &type metadata for ActivityFlexibleUpdate.GraphicSize);
    atomic_store(result, (unint64_t *)&qword_2572605B0);
  }
  return result;
}

uint64_t sub_242FF2534(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;

  v4 = *(_QWORD *)(a1 + 368);
  v37 = *(_QWORD *)(a1 + 360);
  v38 = *(_QWORD *)(a1 + 352);
  v5 = *(_QWORD *)(a1 + 376);
  v6 = *(_QWORD *)(a1 + 384);
  v7 = *(_QWORD *)(a1 + 392);
  v8 = *(_QWORD *)(a1 + 400);
  v9 = *(_QWORD *)(a1 + 408);
  v35 = *(_OWORD *)(a1 + 432);
  v36 = *(_OWORD *)(a1 + 416);
  v33 = *(_OWORD *)(a1 + 464);
  v34 = *(_OWORD *)(a1 + 448);
  v31 = *(_OWORD *)(a1 + 496);
  v32 = *(_OWORD *)(a1 + 480);
  v29 = *(_OWORD *)(a1 + 528);
  v30 = *(_OWORD *)(a1 + 512);
  v28 = *(_OWORD *)(a1 + 544);
  v26 = *(_OWORD *)(a1 + 576);
  v27 = *(_OWORD *)(a1 + 560);
  v24 = *(_OWORD *)(a1 + 608);
  v25 = *(_OWORD *)(a1 + 592);
  v10 = *(_QWORD *)(a1 + 688);
  v11 = *(_QWORD *)(a1 + 696);
  v22 = *(_OWORD *)(a1 + 640);
  v23 = *(_OWORD *)(a1 + 624);
  v20 = *(_OWORD *)(a1 + 672);
  v21 = *(_OWORD *)(a1 + 656);
  v18 = *(_OWORD *)(a1 + 304);
  v19 = *(_OWORD *)(a1 + 320);
  v16 = *(_OWORD *)(a1 + 272);
  v17 = *(_OWORD *)(a1 + 288);
  v14 = *(_OWORD *)(a1 + 240);
  v15 = *(_OWORD *)(a1 + 256);
  v13 = *(_OWORD *)(a1 + 208);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    *(_QWORD *)(a1 + 192),
    *(_QWORD *)(a1 + 200),
    v13,
    *((_QWORD *)&v13 + 1),
    *(_QWORD *)(a1 + 224),
    *(_QWORD *)(a1 + 232),
    v14,
    *((_QWORD *)&v14 + 1),
    v15,
    *((_QWORD *)&v15 + 1),
    v16,
    *((_QWORD *)&v16 + 1),
    v17,
    *((_QWORD *)&v17 + 1),
    v18,
    *((_QWORD *)&v18 + 1),
    v19,
    *((_QWORD *)&v19 + 1),
    *(_QWORD *)(a1 + 336),
    *(_QWORD *)(a1 + 344));
  a2(v38, v37, v4, v5, v6, v7, v8, v9, v36, *((_QWORD *)&v36 + 1), v35, *((_QWORD *)&v35 + 1), v34, *((_QWORD *)&v34 + 1), v33, *((_QWORD *)&v33 + 1), v32, *((_QWORD *)&v32 + 1), v31,
    *((_QWORD *)&v31 + 1),
    v30,
    *((_QWORD *)&v30 + 1),
    v29,
    *((_QWORD *)&v29 + 1),
    v28,
    *((_QWORD *)&v28 + 1),
    v27,
    *((_QWORD *)&v27 + 1),
    v26,
    *((_QWORD *)&v26 + 1),
    v25,
    *((_QWORD *)&v25 + 1),
    v24,
    *((_QWORD *)&v24 + 1),
    v23,
    *((_QWORD *)&v23 + 1),
    v22,
    *((_QWORD *)&v22 + 1),
    v21,
    *((_QWORD *)&v21 + 1),
    v20,
    *((_QWORD *)&v20 + 1),
    v10,
    v11);
  return a1;
}

uint64_t sub_242FF271C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;

  v54 = *(_QWORD *)(a1 + 704);
  v2 = *(_QWORD *)(a1 + 712);
  v3 = *(_QWORD *)(a1 + 720);
  v4 = *(_QWORD *)(a1 + 728);
  v5 = *(_QWORD *)(a1 + 736);
  v6 = *(_QWORD *)(a1 + 744);
  v7 = *(_QWORD *)(a1 + 752);
  v8 = *(_QWORD *)(a1 + 760);
  v53 = *(_OWORD *)(a1 + 768);
  v52 = *(_OWORD *)(a1 + 784);
  v51 = *(_OWORD *)(a1 + 800);
  v50 = *(_OWORD *)(a1 + 816);
  v49 = *(_OWORD *)(a1 + 832);
  v48 = *(_OWORD *)(a1 + 848);
  v47 = *(_OWORD *)(a1 + 864);
  v46 = *(_OWORD *)(a1 + 880);
  v45 = *(_OWORD *)(a1 + 896);
  v44 = *(_OWORD *)(a1 + 912);
  v43 = *(_OWORD *)(a1 + 928);
  v42 = *(_OWORD *)(a1 + 944);
  v41 = *(_OWORD *)(a1 + 960);
  v40 = *(_OWORD *)(a1 + 976);
  v39 = *(_OWORD *)(a1 + 992);
  v38 = *(_OWORD *)(a1 + 1008);
  v37 = *(_OWORD *)(a1 + 1024);
  v36 = *(_OWORD *)(a1 + 1040);
  v35 = *(_OWORD *)(a1 + 1056);
  v34 = *(_OWORD *)(a1 + 1072);
  v33 = *(_OWORD *)(a1 + 1088);
  v32 = *(_OWORD *)(a1 + 1104);
  v31 = *(_OWORD *)(a1 + 1120);
  v30 = *(_OWORD *)(a1 + 1136);
  v29 = *(_OWORD *)(a1 + 1152);
  v28 = *(_OWORD *)(a1 + 1168);
  v27 = *(_OWORD *)(a1 + 1184);
  v26 = *(_OWORD *)(a1 + 1200);
  v24 = *(_OWORD *)(a1 + 464);
  v25 = *(_OWORD *)(a1 + 480);
  v22 = *(_OWORD *)(a1 + 432);
  v23 = *(_OWORD *)(a1 + 448);
  v20 = *(_OWORD *)(a1 + 400);
  v21 = *(_OWORD *)(a1 + 416);
  v18 = *(_OWORD *)(a1 + 368);
  v19 = *(_OWORD *)(a1 + 384);
  v16 = *(_OWORD *)(a1 + 336);
  v17 = *(_OWORD *)(a1 + 352);
  v14 = *(_OWORD *)(a1 + 304);
  v15 = *(_OWORD *)(a1 + 320);
  v12 = *(_OWORD *)(a1 + 272);
  v13 = *(_OWORD *)(a1 + 288);
  v10 = *(_OWORD *)(a1 + 240);
  v11 = *(_OWORD *)(a1 + 256);
  sub_242DFE684(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    *(_QWORD *)(a1 + 192),
    *(_QWORD *)(a1 + 200),
    *(_QWORD *)(a1 + 208),
    *(_QWORD *)(a1 + 216),
    *(_QWORD *)(a1 + 224),
    *(_QWORD *)(a1 + 232),
    v10,
    *((uint64_t *)&v10 + 1),
    v11,
    *((uint64_t *)&v11 + 1),
    v12,
    *((uint64_t *)&v12 + 1),
    v13,
    *((uint64_t *)&v13 + 1),
    v14,
    *((uint64_t *)&v14 + 1),
    v15,
    *((unint64_t *)&v15 + 1),
    v16,
    *((uint64_t *)&v16 + 1),
    v17,
    *((uint64_t *)&v17 + 1),
    v18,
    *((uint64_t *)&v18 + 1),
    v19,
    *((uint64_t *)&v19 + 1),
    v20,
    *((uint64_t *)&v20 + 1),
    v21,
    *((uint64_t *)&v21 + 1),
    v22,
    *((uint64_t *)&v22 + 1),
    v23,
    *((uint64_t *)&v23 + 1),
    v24,
    *((uint64_t *)&v24 + 1),
    v25,
    *((uint64_t *)&v25 + 1),
    *(_QWORD *)(a1 + 496));
  sub_242DFE684(v54, v2, v3, v4, v5, v6, v7, v8, v53, *((uint64_t *)&v53 + 1), v52, *((uint64_t *)&v52 + 1), v51, *((uint64_t *)&v51 + 1), v50, *((uint64_t *)&v50 + 1), v49, *((uint64_t *)&v49 + 1), v48,
    *((unint64_t *)&v48 + 1),
    v47,
    *((uint64_t *)&v47 + 1),
    v46,
    *((uint64_t *)&v46 + 1),
    v45,
    *((uint64_t *)&v45 + 1),
    v44,
    *((uint64_t *)&v44 + 1),
    v43,
    *((uint64_t *)&v43 + 1),
    v42,
    *((uint64_t *)&v42 + 1),
    v41,
    *((uint64_t *)&v41 + 1),
    v40,
    *((uint64_t *)&v40 + 1),
    v39,
    *((uint64_t *)&v39 + 1),
    v38,
    *((uint64_t *)&v38 + 1),
    v37,
    *((unint64_t *)&v37 + 1),
    v36,
    *((uint64_t *)&v36 + 1),
    v35,
    *((uint64_t *)&v35 + 1),
    v34,
    *((uint64_t *)&v34 + 1),
    v33,
    *((uint64_t *)&v33 + 1),
    v32,
    *((uint64_t *)&v32 + 1),
    v31,
    *((uint64_t *)&v31 + 1),
    v30,
    *((uint64_t *)&v30 + 1),
    v29,
    *((uint64_t *)&v29 + 1),
    v28,
    *((uint64_t *)&v28 + 1),
    v27,
    *((uint64_t *)&v27 + 1),
    v26);
  return a1;
}

uint64_t Optional<A>.merging(with:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  int v8;

  v3 = *(_QWORD *)result;
  v4 = *(_QWORD *)(result + 8);
  v5 = *(_QWORD *)(result + 16);
  v6 = *(_BYTE *)(result + 24);
  v7 = *(_BYTE *)(result + 25);
  if ((*((_BYTE *)v2 + 25) & 1) == 0)
  {
    result = (v2[3] & 1) != 0;
    if ((v4 & 1) != 0)
      v3 = *v2;
    v4 = v4 & ((v2[1] & 1) != 0);
    v8 = v6 & 1;
    if (v8)
      v5 = v2[2];
    v6 = v8 & result;
    if ((v7 & 1) != 0)
    {
      v3 = *v2;
      v4 = v2[1] & 1;
      v5 = v2[2];
      v6 = v2[3] & 1;
    }
    v7 = 0;
  }
  *(_QWORD *)a2 = v3;
  *(_QWORD *)(a2 + 8) = v4;
  *(_QWORD *)(a2 + 16) = v5;
  *(_BYTE *)(a2 + 24) = v6;
  *(_BYTE *)(a2 + 25) = v7;
  return result;
}

NewsLiveActivitiesCore::PrimaryElectionHeaderTemplateProperties::Count __swiftcall PrimaryElectionHeaderTemplateProperties.Count.init(count:)(NewsLiveActivitiesCore::PrimaryElectionHeaderTemplateProperties::Count count)
{
  NewsLiveActivitiesCore::PrimaryElectionHeaderTemplateProperties::Count *v1;

  v1->count = count.count;
  return count;
}

NewsLiveActivitiesCore::PrimaryElectionHeaderTemplateProperties::Percentage __swiftcall PrimaryElectionHeaderTemplateProperties.Percentage.init(percentage:)(NewsLiveActivitiesCore::PrimaryElectionHeaderTemplateProperties::Percentage percentage)
{
  NewsLiveActivitiesCore::PrimaryElectionHeaderTemplateProperties::Percentage *v1;

  v1->percentage = percentage.percentage;
  return percentage;
}

void PrimaryElectionHeaderTemplateProperties.reporting.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_BYTE *)(a1 + 8) = v2;
}

uint64_t PrimaryElectionHeaderTemplateProperties.reporting.setter(uint64_t result)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(result + 8);
  *(_QWORD *)v1 = *(_QWORD *)result;
  *(_BYTE *)(v1 + 8) = v2;
  return result;
}

uint64_t (*PrimaryElectionHeaderTemplateProperties.reporting.modify())(_QWORD, _QWORD)
{
  return nullsub_1;
}

double PrimaryElectionHeaderTemplateProperties.Percentage.percentage.getter()
{
  uint64_t v0;

  return *(double *)v0;
}

void PrimaryElectionHeaderTemplateProperties.Percentage.percentage.setter(double a1)
{
  double *v1;

  *v1 = a1;
}

uint64_t (*PrimaryElectionHeaderTemplateProperties.Percentage.percentage.modify())(_QWORD, _QWORD)
{
  return nullsub_1;
}

uint64_t PrimaryElectionHeaderTemplateProperties.Percentage.hash(into:)()
{
  return sub_242FF6280();
}

BOOL static PrimaryElectionHeaderTemplateProperties.Percentage.== infix(_:_:)(double *a1, double *a2)
{
  return *a1 == *a2;
}

uint64_t sub_242FF2C44()
{
  return 0x61746E6563726570;
}

uint64_t sub_242FF2C60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x61746E6563726570 && a2 == 0xEA00000000006567)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_242FF6160();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_242FF2D00()
{
  sub_242FF3654();
  return sub_242FF6358();
}

uint64_t sub_242FF2D28()
{
  sub_242FF3654();
  return sub_242FF6364();
}

uint64_t PrimaryElectionHeaderTemplateProperties.Percentage.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572605C0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FF3654();
  sub_242FF6310();
  sub_242FF60D0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t PrimaryElectionHeaderTemplateProperties.Percentage.hashValue.getter()
{
  sub_242FF6250();
  sub_242FF6280();
  return sub_242FF628C();
}

uint64_t PrimaryElectionHeaderTemplateProperties.Percentage.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572605D0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FF3654();
  sub_242FF62EC();
  if (!v2)
  {
    sub_242FF6028();
    v10 = v9;
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v10;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_242FF2F8C()
{
  sub_242FF6250();
  sub_242FF6280();
  return sub_242FF628C();
}

uint64_t sub_242FF2FD4()
{
  return sub_242FF6280();
}

uint64_t sub_242FF3004()
{
  sub_242FF6250();
  sub_242FF6280();
  return sub_242FF628C();
}

uint64_t sub_242FF3048@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return PrimaryElectionHeaderTemplateProperties.Percentage.init(from:)(a1, a2);
}

uint64_t sub_242FF305C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572605C0);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FF3654();
  sub_242FF6310();
  sub_242FF60D0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

BOOL sub_242FF3144(double *a1, double *a2)
{
  return *a1 == *a2;
}

void PrimaryElectionHeaderTemplateProperties.delegates.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(v1 + 24);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 16);
  *(_BYTE *)(a1 + 8) = v2;
}

uint64_t PrimaryElectionHeaderTemplateProperties.delegates.setter(uint64_t result)
{
  uint64_t v1;
  char v2;

  v2 = *(_BYTE *)(result + 8);
  *(_QWORD *)(v1 + 16) = *(_QWORD *)result;
  *(_BYTE *)(v1 + 24) = v2;
  return result;
}

uint64_t (*PrimaryElectionHeaderTemplateProperties.delegates.modify())(_QWORD, _QWORD)
{
  return nullsub_1;
}

uint64_t PrimaryElectionHeaderTemplateProperties.Count.count.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t PrimaryElectionHeaderTemplateProperties.Count.count.setter(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

uint64_t (*PrimaryElectionHeaderTemplateProperties.Count.count.modify())(_QWORD, _QWORD)
{
  return nullsub_1;
}

uint64_t PrimaryElectionHeaderTemplateProperties.Count.hash(into:)()
{
  return sub_242FF625C();
}

BOOL static PrimaryElectionHeaderTemplateProperties.Count.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_242FF31EC()
{
  return 0x746E756F63;
}

uint64_t sub_242FF3200@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  char v5;
  uint64_t result;
  char v7;

  if (a1 == 0x746E756F63 && a2 == 0xE500000000000000)
  {
    result = swift_bridgeObjectRelease();
    v7 = 0;
  }
  else
  {
    v5 = sub_242FF6160();
    result = swift_bridgeObjectRelease();
    v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_242FF328C()
{
  sub_242FF3698();
  return sub_242FF6358();
}

uint64_t sub_242FF32B4()
{
  sub_242FF3698();
  return sub_242FF6364();
}

uint64_t PrimaryElectionHeaderTemplateProperties.Count.encode(to:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572605D8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FF3698();
  sub_242FF6310();
  sub_242FF60DC();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t PrimaryElectionHeaderTemplateProperties.Count.hashValue.getter()
{
  sub_242FF6250();
  sub_242FF625C();
  return sub_242FF628C();
}

uint64_t PrimaryElectionHeaderTemplateProperties.Count.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572605E8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FF3698();
  sub_242FF62EC();
  if (!v2)
  {
    v9 = sub_242FF6034();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *a2 = v9;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_242FF350C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return PrimaryElectionHeaderTemplateProperties.Count.init(from:)(a1, a2);
}

uint64_t sub_242FF3520(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572605D8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FF3698();
  sub_242FF6310();
  sub_242FF60DC();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

NewsLiveActivitiesCore::PrimaryElectionHeaderTemplateProperties __swiftcall PrimaryElectionHeaderTemplateProperties.merging(with:)(NewsLiveActivitiesCore::PrimaryElectionHeaderTemplateProperties with)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  char v4;
  char v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  v3 = (uint64_t *)(*(_QWORD *)&with.reporting.is_nil + 16);
  v4 = *(_BYTE *)(*(_QWORD *)&with.reporting.is_nil + 24);
  v5 = *(_BYTE *)(v2 + 24);
  if (*(_BYTE *)(*(_QWORD *)&with.reporting.is_nil + 8))
    v6 = (uint64_t *)v2;
  else
    v6 = *(uint64_t **)&with.reporting.is_nil;
  v7 = *v6;
  v8 = *(_BYTE *)(*(_QWORD *)&with.reporting.is_nil + 8) & *(_BYTE *)(v2 + 8);
  if (*(_BYTE *)(*(_QWORD *)&with.reporting.is_nil + 24))
    v3 = (uint64_t *)(v2 + 16);
  v9 = *v3;
  *(_QWORD *)v1 = v7;
  *(_BYTE *)(v1 + 8) = v8;
  *(_QWORD *)(v1 + 16) = v9;
  *(_BYTE *)(v1 + 24) = v4 & v5;
  return with;
}

unint64_t sub_242FF3654()
{
  unint64_t result;

  result = qword_2572605C8;
  if (!qword_2572605C8)
  {
    result = MEMORY[0x2494F057C](&unk_2430099DC, &type metadata for PrimaryElectionHeaderTemplateProperties.Percentage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2572605C8);
  }
  return result;
}

unint64_t sub_242FF3698()
{
  unint64_t result;

  result = qword_2572605E0;
  if (!qword_2572605E0)
  {
    result = MEMORY[0x2494F057C](&unk_24300998C, &type metadata for PrimaryElectionHeaderTemplateProperties.Count.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2572605E0);
  }
  return result;
}

uint64_t PrimaryElectionHeaderTemplateProperties.hash(into:)()
{
  uint64_t v0;
  int v1;

  v1 = *(unsigned __int8 *)(v0 + 24);
  if (*(_BYTE *)(v0 + 8) == 1)
  {
    sub_242FF6268();
    if (!v1)
    {
LABEL_3:
      sub_242FF6268();
      return sub_242FF625C();
    }
  }
  else
  {
    sub_242FF6268();
    sub_242FF6280();
    if (!v1)
      goto LABEL_3;
  }
  return sub_242FF6268();
}

uint64_t sub_242FF3760()
{
  _BYTE *v0;

  if (*v0)
    return 0x65746167656C6564;
  else
    return 0x6E6974726F706572;
}

uint64_t sub_242FF37A0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_242FF4364(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_242FF37C4()
{
  sub_242FF3CB4();
  return sub_242FF6358();
}

uint64_t sub_242FF37EC()
{
  sub_242FF3CB4();
  return sub_242FF6364();
}

uint64_t PrimaryElectionHeaderTemplateProperties.encode(to:)(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  _QWORD v11[2];
  uint64_t v12;
  char v13;
  int v14;
  char v15;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2572605F0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  v8 = *((_BYTE *)v1 + 8);
  v11[0] = v1[2];
  v14 = *((unsigned __int8 *)v1 + 24);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FF3CB4();
  sub_242FF6310();
  v12 = v7;
  v13 = v8;
  v15 = 0;
  sub_242FF3CF8();
  v9 = v11[1];
  sub_242FF60AC();
  if (!v9)
  {
    v12 = v11[0];
    v13 = v14;
    v15 = 1;
    sub_242FF3D3C();
    sub_242FF60AC();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t PrimaryElectionHeaderTemplateProperties.hashValue.getter()
{
  sub_242FF6250();
  PrimaryElectionHeaderTemplateProperties.hash(into:)();
  return sub_242FF628C();
}

uint64_t PrimaryElectionHeaderTemplateProperties.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v14;
  char v15;
  char v16;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_257260610);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_242FF3CB4();
  sub_242FF62EC();
  if (!v2)
  {
    v16 = 0;
    sub_242FF3D80();
    sub_242FF6004();
    v9 = v14;
    v10 = v15;
    v16 = 1;
    sub_242FF3DC4();
    sub_242FF6004();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    v11 = v14;
    v12 = v15;
    *(_QWORD *)a2 = v9;
    *(_BYTE *)(a2 + 8) = v10;
    *(_QWORD *)(a2 + 16) = v11;
    *(_BYTE *)(a2 + 24) = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
}

uint64_t sub_242FF3B6C()
{
  sub_242FF6250();
  PrimaryElectionHeaderTemplateProperties.hash(into:)();
  return sub_242FF628C();
}

uint64_t sub_242FF3BD0()
{
  sub_242FF6250();
  PrimaryElectionHeaderTemplateProperties.hash(into:)();
  return sub_242FF628C();
}

uint64_t sub_242FF3C2C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return PrimaryElectionHeaderTemplateProperties.init(from:)(a1, a2);
}

uint64_t sub_242FF3C40(_QWORD *a1)
{
  return PrimaryElectionHeaderTemplateProperties.encode(to:)(a1);
}

BOOL _s22NewsLiveActivitiesCore39PrimaryElectionHeaderTemplatePropertiesV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  char v2;
  char v4;

  v2 = *(_BYTE *)(a2 + 8);
  if ((*(_BYTE *)(a1 + 8) & 1) != 0)
  {
    if (!*(_BYTE *)(a2 + 8))
      return 0;
  }
  else
  {
    if (*(double *)a1 != *(double *)a2)
      v2 = 1;
    if ((v2 & 1) != 0)
      return 0;
  }
  if ((*(_BYTE *)(a1 + 24) & 1) == 0)
  {
    if (*(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16))
      v4 = *(_BYTE *)(a2 + 24);
    else
      v4 = 1;
    return (v4 & 1) == 0;
  }
  return (*(_BYTE *)(a2 + 24) & 1) != 0;
}

unint64_t sub_242FF3CB4()
{
  unint64_t result;

  result = qword_2572605F8;
  if (!qword_2572605F8)
  {
    result = MEMORY[0x2494F057C](&unk_24300993C, &type metadata for PrimaryElectionHeaderTemplateProperties.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_2572605F8);
  }
  return result;
}

unint64_t sub_242FF3CF8()
{
  unint64_t result;

  result = qword_257260600;
  if (!qword_257260600)
  {
    result = MEMORY[0x2494F057C](&protocol conformance descriptor for PrimaryElectionHeaderTemplateProperties.Percentage, &type metadata for PrimaryElectionHeaderTemplateProperties.Percentage);
    atomic_store(result, (unint64_t *)&qword_257260600);
  }
  return result;
}

unint64_t sub_242FF3D3C()
{
  unint64_t result;

  result = qword_257260608;
  if (!qword_257260608)
  {
    result = MEMORY[0x2494F057C](&protocol conformance descriptor for PrimaryElectionHeaderTemplateProperties.Count, &type metadata for PrimaryElectionHeaderTemplateProperties.Count);
    atomic_store(result, (unint64_t *)&qword_257260608);
  }
  return result;
}

unint64_t sub_242FF3D80()
{
  unint64_t result;

  result = qword_257260618;
  if (!qword_257260618)
  {
    result = MEMORY[0x2494F057C](&protocol conformance descriptor for PrimaryElectionHeaderTemplateProperties.Percentage, &type metadata for PrimaryElectionHeaderTemplateProperties.Percentage);
    atomic_store(result, (unint64_t *)&qword_257260618);
  }
  return result;
}

unint64_t sub_242FF3DC4()
{
  unint64_t result;

  result = qword_257260620;
  if (!qword_257260620)
  {
    result = MEMORY[0x2494F057C](&protocol conformance descriptor for PrimaryElectionHeaderTemplateProperties.Count, &type metadata for PrimaryElectionHeaderTemplateProperties.Count);
    atomic_store(result, (unint64_t *)&qword_257260620);
  }
  return result;
}

unint64_t sub_242FF3E0C()
{
  unint64_t result;

  result = qword_257260628;
  if (!qword_257260628)
  {
    result = MEMORY[0x2494F057C](&protocol conformance descriptor for PrimaryElectionHeaderTemplateProperties.Percentage, &type metadata for PrimaryElectionHeaderTemplateProperties.Percentage);
    atomic_store(result, (unint64_t *)&qword_257260628);
  }
  return result;
}

unint64_t sub_242FF3E54()
{
  unint64_t result;

  result = qword_257260630;
  if (!qword_257260630)
  {
    result = MEMORY[0x2494F057C](&protocol conformance descriptor for PrimaryElectionHeaderTemplateProperties.Count, &type metadata for PrimaryElectionHeaderTemplateProperties.Count);
    atomic_store(result, (unint64_t *)&qword_257260630);
  }
  return result;
}

unint64_t sub_242FF3E9C()
{
  unint64_t result;

  result = qword_257260638;
  if (!qword_257260638)
  {
    result = MEMORY[0x2494F057C](&protocol conformance descriptor for PrimaryElectionHeaderTemplateProperties, &type metadata for PrimaryElectionHeaderTemplateProperties);
    atomic_store(result, (unint64_t *)&qword_257260638);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PrimaryElectionHeaderTemplateProperties(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for PrimaryElectionHeaderTemplateProperties(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
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
  *(_BYTE *)(result + 25) = v3;
  return result;
}

ValueMetadata *type metadata accessor for PrimaryElectionHeaderTemplateProperties()
{
  return &type metadata for PrimaryElectionHeaderTemplateProperties;
}

ValueMetadata *type metadata accessor for PrimaryElectionHeaderTemplateProperties.Percentage()
{
  return &type metadata for PrimaryElectionHeaderTemplateProperties.Percentage;
}

ValueMetadata *type metadata accessor for PrimaryElectionHeaderTemplateProperties.Count()
{
  return &type metadata for PrimaryElectionHeaderTemplateProperties.Count;
}

uint64_t storeEnumTagSinglePayload for PrimaryElectionHeaderTemplateProperties.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_242FF3FAC + 4 * byte_243009485[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_242FF3FE0 + 4 * byte_243009480[v4]))();
}

uint64_t sub_242FF3FE0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_242FF3FE8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x242FF3FF0);
  return result;
}

uint64_t sub_242FF3FFC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x242FF4004);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_242FF4008(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_242FF4010(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PrimaryElectionHeaderTemplateProperties.CodingKeys()
{
  return &type metadata for PrimaryElectionHeaderTemplateProperties.CodingKeys;
}

ValueMetadata *type metadata accessor for PrimaryElectionHeaderTemplateProperties.Count.CodingKeys()
{
  return &type metadata for PrimaryElectionHeaderTemplateProperties.Count.CodingKeys;
}

uint64_t _s22NewsLiveActivitiesCore39PrimaryElectionHeaderTemplatePropertiesV5CountV10CodingKeysOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_242FF4080 + 4 * byte_24300948A[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_242FF40A0 + 4 * byte_24300948F[v4]))();
}

_BYTE *sub_242FF4080(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_242FF40A0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_242FF40A8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_242FF40B0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_242FF40B8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_242FF40C0(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for PrimaryElectionHeaderTemplateProperties.Percentage.CodingKeys()
{
  return &type metadata for PrimaryElectionHeaderTemplateProperties.Percentage.CodingKeys;
}

unint64_t sub_242FF40E0()
{
  unint64_t result;

  result = qword_257260640;
  if (!qword_257260640)
  {
    result = MEMORY[0x2494F057C](&unk_2430097A4, &type metadata for PrimaryElectionHeaderTemplateProperties.Percentage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257260640);
  }
  return result;
}

unint64_t sub_242FF4128()
{
  unint64_t result;

  result = qword_257260648;
  if (!qword_257260648)
  {
    result = MEMORY[0x2494F057C](&unk_24300985C, &type metadata for PrimaryElectionHeaderTemplateProperties.Count.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257260648);
  }
  return result;
}

unint64_t sub_242FF4170()
{
  unint64_t result;

  result = qword_257260650;
  if (!qword_257260650)
  {
    result = MEMORY[0x2494F057C](&unk_243009914, &type metadata for PrimaryElectionHeaderTemplateProperties.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257260650);
  }
  return result;
}

unint64_t sub_242FF41B8()
{
  unint64_t result;

  result = qword_257260658;
  if (!qword_257260658)
  {
    result = MEMORY[0x2494F057C](&unk_243009884, &type metadata for PrimaryElectionHeaderTemplateProperties.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257260658);
  }
  return result;
}

unint64_t sub_242FF4200()
{
  unint64_t result;

  result = qword_257260660;
  if (!qword_257260660)
  {
    result = MEMORY[0x2494F057C](&unk_2430098AC, &type metadata for PrimaryElectionHeaderTemplateProperties.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257260660);
  }
  return result;
}

unint64_t sub_242FF4248()
{
  unint64_t result;

  result = qword_257260668;
  if (!qword_257260668)
  {
    result = MEMORY[0x2494F057C](&unk_2430097CC, &type metadata for PrimaryElectionHeaderTemplateProperties.Count.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257260668);
  }
  return result;
}

unint64_t sub_242FF4290()
{
  unint64_t result;

  result = qword_257260670;
  if (!qword_257260670)
  {
    result = MEMORY[0x2494F057C](&unk_2430097F4, &type metadata for PrimaryElectionHeaderTemplateProperties.Count.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257260670);
  }
  return result;
}

unint64_t sub_242FF42D8()
{
  unint64_t result;

  result = qword_257260678;
  if (!qword_257260678)
  {
    result = MEMORY[0x2494F057C](&unk_243009714, &type metadata for PrimaryElectionHeaderTemplateProperties.Percentage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257260678);
  }
  return result;
}

unint64_t sub_242FF4320()
{
  unint64_t result;

  result = qword_257260680;
  if (!qword_257260680)
  {
    result = MEMORY[0x2494F057C](&unk_24300973C, &type metadata for PrimaryElectionHeaderTemplateProperties.Percentage.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257260680);
  }
  return result;
}

uint64_t sub_242FF4364(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x6E6974726F706572 && a2 == 0xE900000000000067;
  if (v2 || (sub_242FF6160() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x65746167656C6564 && a2 == 0xE900000000000073)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    v6 = sub_242FF6160();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 1;
    else
      return 2;
  }
}

uint64_t sub_242FF4468()
{
  return MEMORY[0x24BDCB220]();
}

uint64_t sub_242FF4474()
{
  return MEMORY[0x24BDCB260]();
}

uint64_t sub_242FF4480()
{
  return MEMORY[0x24BDCB268]();
}

uint64_t sub_242FF448C()
{
  return MEMORY[0x24BDCB288]();
}

uint64_t sub_242FF4498()
{
  return MEMORY[0x24BDCB290]();
}

uint64_t sub_242FF44A4()
{
  return MEMORY[0x24BDCB2A0]();
}

uint64_t sub_242FF44B0()
{
  return MEMORY[0x24BDCB2A8]();
}

uint64_t sub_242FF44BC()
{
  return MEMORY[0x24BDCB2E0]();
}

uint64_t sub_242FF44C8()
{
  return MEMORY[0x24BDCB3B8]();
}

uint64_t sub_242FF44D4()
{
  return MEMORY[0x24BDCB400]();
}

uint64_t sub_242FF44E0()
{
  return MEMORY[0x24BDCB410]();
}

uint64_t sub_242FF44EC()
{
  return MEMORY[0x24BDCB958]();
}

uint64_t sub_242FF44F8()
{
  return MEMORY[0x24BDCB960]();
}

uint64_t sub_242FF4504()
{
  return MEMORY[0x24BDCB988]();
}

uint64_t sub_242FF4510()
{
  return MEMORY[0x24BDCBA00]();
}

uint64_t sub_242FF451C()
{
  return MEMORY[0x24BDCBA58]();
}

uint64_t sub_242FF4528()
{
  return MEMORY[0x24BDCBA60]();
}

uint64_t sub_242FF4534()
{
  return MEMORY[0x24BDCBA98]();
}

uint64_t sub_242FF4540()
{
  return MEMORY[0x24BDCBAB0]();
}

uint64_t sub_242FF454C()
{
  return MEMORY[0x24BDCBAC0]();
}

uint64_t sub_242FF4558()
{
  return MEMORY[0x24BDCBB78]();
}

uint64_t sub_242FF4564()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_242FF4570()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_242FF457C()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_242FF4588()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_242FF4594()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_242FF45A0()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_242FF45AC()
{
  return MEMORY[0x24BDCC6B8]();
}

uint64_t sub_242FF45B8()
{
  return MEMORY[0x24BDCC8D0]();
}

uint64_t sub_242FF45C4()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_242FF45D0()
{
  return MEMORY[0x24BDCD438]();
}

uint64_t sub_242FF45DC()
{
  return MEMORY[0x24BDCD450]();
}

uint64_t sub_242FF45E8()
{
  return MEMORY[0x24BDCD650]();
}

uint64_t sub_242FF45F4()
{
  return MEMORY[0x24BDCD678]();
}

uint64_t sub_242FF4600()
{
  return MEMORY[0x24BDCD730]();
}

uint64_t sub_242FF460C()
{
  return MEMORY[0x24BEB42C0]();
}

uint64_t sub_242FF4618()
{
  return MEMORY[0x24BDCD760]();
}

uint64_t sub_242FF4624()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_242FF4630()
{
  return MEMORY[0x24BDCD7E0]();
}

uint64_t sub_242FF463C()
{
  return MEMORY[0x24BDCD7E8]();
}

uint64_t sub_242FF4648()
{
  return MEMORY[0x24BDCD7F0]();
}

uint64_t sub_242FF4654()
{
  return MEMORY[0x24BDCD7F8]();
}

uint64_t sub_242FF4660()
{
  return MEMORY[0x24BDCD808]();
}

uint64_t sub_242FF466C()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_242FF4678()
{
  return MEMORY[0x24BDCD898]();
}

uint64_t sub_242FF4684()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_242FF4690()
{
  return MEMORY[0x24BDCD918]();
}

uint64_t sub_242FF469C()
{
  return MEMORY[0x24BDCD928]();
}

uint64_t sub_242FF46A8()
{
  return MEMORY[0x24BDCD968]();
}

uint64_t sub_242FF46B4()
{
  return MEMORY[0x24BDCD988]();
}

uint64_t sub_242FF46C0()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_242FF46CC()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_242FF46D8()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_242FF46E4()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_242FF46F0()
{
  return MEMORY[0x24BDCDA70]();
}

uint64_t sub_242FF46FC()
{
  return MEMORY[0x24BDCDA88]();
}

uint64_t sub_242FF4708()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_242FF4714()
{
  return MEMORY[0x24BDCDAA8]();
}

uint64_t sub_242FF4720()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_242FF472C()
{
  return MEMORY[0x24BDCDB18]();
}

uint64_t sub_242FF4738()
{
  return MEMORY[0x24BDCDB78]();
}

uint64_t sub_242FF4744()
{
  return MEMORY[0x24BDCDBE0]();
}

uint64_t sub_242FF4750()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_242FF475C()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_242FF4768()
{
  return MEMORY[0x24BDCDCF8]();
}

uint64_t sub_242FF4774()
{
  return MEMORY[0x24BDCDD20]();
}

uint64_t sub_242FF4780()
{
  return MEMORY[0x24BDCDE90]();
}

uint64_t sub_242FF478C()
{
  return MEMORY[0x24BDCDEC0]();
}

uint64_t sub_242FF4798()
{
  return MEMORY[0x24BDCDEE8]();
}

uint64_t sub_242FF47A4()
{
  return MEMORY[0x24BDCDEF8]();
}

uint64_t sub_242FF47B0()
{
  return MEMORY[0x24BDCDF30]();
}

uint64_t sub_242FF47BC()
{
  return MEMORY[0x24BDCE2D0]();
}

uint64_t sub_242FF47C8()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_242FF47D4()
{
  return MEMORY[0x24BDCE778]();
}

uint64_t sub_242FF47E0()
{
  return MEMORY[0x24BDCE780]();
}

uint64_t sub_242FF47EC()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_242FF47F8()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_242FF4804()
{
  return MEMORY[0x24BDCE8C0]();
}

uint64_t sub_242FF4810()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_242FF481C()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_242FF4828()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_242FF4834()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_242FF4840()
{
  return MEMORY[0x24BDCECA0]();
}

uint64_t sub_242FF484C()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_242FF4858()
{
  return MEMORY[0x24BE6CD48]();
}

uint64_t sub_242FF4864()
{
  return MEMORY[0x24BE6CD50]();
}

uint64_t sub_242FF4870()
{
  return MEMORY[0x24BE6CD58]();
}

uint64_t sub_242FF487C()
{
  return MEMORY[0x24BE6CD60]();
}

uint64_t sub_242FF4888()
{
  return MEMORY[0x24BE6CD68]();
}

uint64_t sub_242FF4894()
{
  return MEMORY[0x24BE6CD70]();
}

uint64_t sub_242FF48A0()
{
  return MEMORY[0x24BE6CD78]();
}

uint64_t sub_242FF48AC()
{
  return MEMORY[0x24BE6CD80]();
}

uint64_t sub_242FF48B8()
{
  return MEMORY[0x24BE6CD88]();
}

uint64_t sub_242FF48C4()
{
  return MEMORY[0x24BE6CD90]();
}

uint64_t sub_242FF48D0()
{
  return MEMORY[0x24BE6CD98]();
}

uint64_t sub_242FF48DC()
{
  return MEMORY[0x24BE6CDA0]();
}

uint64_t sub_242FF48E8()
{
  return MEMORY[0x24BE6CDA8]();
}

uint64_t sub_242FF48F4()
{
  return MEMORY[0x24BE6CDB0]();
}

uint64_t sub_242FF4900()
{
  return MEMORY[0x24BE6CDB8]();
}

uint64_t sub_242FF490C()
{
  return MEMORY[0x24BE6CDC0]();
}

uint64_t sub_242FF4918()
{
  return MEMORY[0x24BE6CDC8]();
}

uint64_t sub_242FF4924()
{
  return MEMORY[0x24BE6CDD0]();
}

uint64_t sub_242FF4930()
{
  return MEMORY[0x24BE6CDD8]();
}

uint64_t sub_242FF493C()
{
  return MEMORY[0x24BE6CDE0]();
}

uint64_t sub_242FF4948()
{
  return MEMORY[0x24BDB4688]();
}

uint64_t sub_242FF4954()
{
  return MEMORY[0x24BDB4698]();
}

uint64_t sub_242FF4960()
{
  return MEMORY[0x24BDB46B8]();
}

uint64_t sub_242FF496C()
{
  return MEMORY[0x24BDB46D8]();
}

uint64_t sub_242FF4978()
{
  return MEMORY[0x24BDB46E0]();
}

uint64_t sub_242FF4984()
{
  return MEMORY[0x24BDB46E8]();
}

uint64_t sub_242FF4990()
{
  return MEMORY[0x24BDB46F0]();
}

uint64_t sub_242FF499C()
{
  return MEMORY[0x24BDB4710]();
}

uint64_t sub_242FF49A8()
{
  return MEMORY[0x24BDB4718]();
}

uint64_t sub_242FF49B4()
{
  return MEMORY[0x24BDB4720]();
}

uint64_t sub_242FF49C0()
{
  return MEMORY[0x24BDB4728]();
}

uint64_t sub_242FF49CC()
{
  return MEMORY[0x24BDB4750]();
}

uint64_t sub_242FF49D8()
{
  return MEMORY[0x24BDB4768]();
}

uint64_t sub_242FF49E4()
{
  return MEMORY[0x24BDB47C8]();
}

uint64_t sub_242FF49F0()
{
  return MEMORY[0x24BDB4808]();
}

uint64_t sub_242FF49FC()
{
  return MEMORY[0x24BDB4810]();
}

uint64_t sub_242FF4A08()
{
  return MEMORY[0x24BDB4818]();
}

uint64_t sub_242FF4A14()
{
  return MEMORY[0x24BDB4820]();
}

uint64_t sub_242FF4A20()
{
  return MEMORY[0x24BDB4828]();
}

uint64_t sub_242FF4A2C()
{
  return MEMORY[0x24BDB4830]();
}

uint64_t sub_242FF4A38()
{
  return MEMORY[0x24BDB4838]();
}

uint64_t sub_242FF4A44()
{
  return MEMORY[0x24BDB4848]();
}

uint64_t sub_242FF4A50()
{
  return MEMORY[0x24BDB4858]();
}

uint64_t sub_242FF4A5C()
{
  return MEMORY[0x24BDB4870]();
}

uint64_t sub_242FF4A68()
{
  return MEMORY[0x24BDB4878]();
}

uint64_t sub_242FF4A74()
{
  return MEMORY[0x24BDB48A0]();
}

uint64_t sub_242FF4A80()
{
  return MEMORY[0x24BDB48D0]();
}

uint64_t sub_242FF4A8C()
{
  return MEMORY[0x24BDB48E8]();
}

uint64_t sub_242FF4A98()
{
  return MEMORY[0x24BDB48F0]();
}

uint64_t sub_242FF4AA4()
{
  return MEMORY[0x24BDB48F8]();
}

uint64_t sub_242FF4AB0()
{
  return MEMORY[0x24BDB4900]();
}

uint64_t sub_242FF4ABC()
{
  return MEMORY[0x24BDB4908]();
}

uint64_t sub_242FF4AC8()
{
  return MEMORY[0x24BDB4910]();
}

uint64_t sub_242FF4AD4()
{
  return MEMORY[0x24BDB4A00]();
}

uint64_t sub_242FF4AE0()
{
  return MEMORY[0x24BEB47B8]();
}

uint64_t sub_242FF4AEC()
{
  return MEMORY[0x24BEB47C0]();
}

uint64_t sub_242FF4AF8()
{
  return MEMORY[0x24BEB47C8]();
}

uint64_t sub_242FF4B04()
{
  return MEMORY[0x24BEB47D0]();
}

uint64_t sub_242FF4B10()
{
  return MEMORY[0x24BEB4810]();
}

uint64_t sub_242FF4B1C()
{
  return MEMORY[0x24BEB4820]();
}

uint64_t sub_242FF4B28()
{
  return MEMORY[0x24BEB4830]();
}

uint64_t sub_242FF4B34()
{
  return MEMORY[0x24BEB4838]();
}

uint64_t sub_242FF4B40()
{
  return MEMORY[0x24BEB4840]();
}

uint64_t sub_242FF4B4C()
{
  return MEMORY[0x24BEB4848]();
}

uint64_t sub_242FF4B58()
{
  return MEMORY[0x24BEB4850]();
}

uint64_t sub_242FF4B64()
{
  return MEMORY[0x24BEB4858]();
}

uint64_t sub_242FF4B70()
{
  return MEMORY[0x24BEB4300]();
}

uint64_t sub_242FF4B7C()
{
  return MEMORY[0x24BEB4348]();
}

uint64_t sub_242FF4B88()
{
  return MEMORY[0x24BEB4378]();
}

uint64_t sub_242FF4B94()
{
  return MEMORY[0x24BEB4390]();
}

uint64_t sub_242FF4BA0()
{
  return MEMORY[0x24BEB4398]();
}

uint64_t sub_242FF4BAC()
{
  return MEMORY[0x24BEB43A8]();
}

uint64_t sub_242FF4BB8()
{
  return MEMORY[0x24BEB43B0]();
}

uint64_t sub_242FF4BC4()
{
  return MEMORY[0x24BEB43D8]();
}

uint64_t sub_242FF4BD0()
{
  return MEMORY[0x24BEB4430]();
}

uint64_t sub_242FF4BDC()
{
  return MEMORY[0x24BEB4438]();
}

uint64_t sub_242FF4BE8()
{
  return MEMORY[0x24BEB4440]();
}

uint64_t sub_242FF4BF4()
{
  return MEMORY[0x24BEB4460]();
}

uint64_t sub_242FF4C00()
{
  return MEMORY[0x24BEB4468]();
}

uint64_t sub_242FF4C0C()
{
  return MEMORY[0x24BEB4470]();
}

uint64_t sub_242FF4C18()
{
  return MEMORY[0x24BEB4478]();
}

uint64_t sub_242FF4C24()
{
  return MEMORY[0x24BEB4480]();
}

uint64_t sub_242FF4C30()
{
  return MEMORY[0x24BEB4498]();
}

uint64_t sub_242FF4C3C()
{
  return MEMORY[0x24BEB44A8]();
}

uint64_t sub_242FF4C48()
{
  return MEMORY[0x24BEB44E8]();
}

uint64_t sub_242FF4C54()
{
  return MEMORY[0x24BEB44F0]();
}

uint64_t sub_242FF4C60()
{
  return MEMORY[0x24BEB44F8]();
}

uint64_t sub_242FF4C6C()
{
  return MEMORY[0x24BEB4500]();
}

uint64_t sub_242FF4C78()
{
  return MEMORY[0x24BEB4508]();
}

uint64_t sub_242FF4C84()
{
  return MEMORY[0x24BEB4530]();
}

uint64_t sub_242FF4C90()
{
  return MEMORY[0x24BEB4560]();
}

uint64_t sub_242FF4C9C()
{
  return MEMORY[0x24BEB4568]();
}

uint64_t sub_242FF4CA8()
{
  return MEMORY[0x24BEB4590]();
}

uint64_t sub_242FF4CB4()
{
  return MEMORY[0x24BEB4598]();
}

uint64_t sub_242FF4CC0()
{
  return MEMORY[0x24BEB45A8]();
}

uint64_t sub_242FF4CCC()
{
  return MEMORY[0x24BEB4608]();
}

uint64_t sub_242FF4CD8()
{
  return MEMORY[0x24BEB4610]();
}

uint64_t sub_242FF4CE4()
{
  return MEMORY[0x24BEB4628]();
}

uint64_t sub_242FF4CF0()
{
  return MEMORY[0x24BEB4630]();
}

uint64_t sub_242FF4CFC()
{
  return MEMORY[0x24BEB4638]();
}

uint64_t sub_242FF4D08()
{
  return MEMORY[0x24BEB4648]();
}

uint64_t sub_242FF4D14()
{
  return MEMORY[0x24BEB4650]();
}

uint64_t sub_242FF4D20()
{
  return MEMORY[0x24BEB4668]();
}

uint64_t sub_242FF4D2C()
{
  return MEMORY[0x24BEB4670]();
}

uint64_t sub_242FF4D38()
{
  return MEMORY[0x24BEB4678]();
}

uint64_t sub_242FF4D44()
{
  return MEMORY[0x24BEB4688]();
}

uint64_t sub_242FF4D50()
{
  return MEMORY[0x24BEB4698]();
}

uint64_t sub_242FF4D5C()
{
  return MEMORY[0x24BEB46B8]();
}

uint64_t sub_242FF4D68()
{
  return MEMORY[0x24BEB46F0]();
}

uint64_t sub_242FF4D74()
{
  return MEMORY[0x24BEB46F8]();
}

uint64_t sub_242FF4D80()
{
  return MEMORY[0x24BEB4708]();
}

uint64_t sub_242FF4D8C()
{
  return MEMORY[0x24BEB4710]();
}

uint64_t sub_242FF4D98()
{
  return MEMORY[0x24BEB4718]();
}

uint64_t sub_242FF4DA4()
{
  return MEMORY[0x24BEB4720]();
}

uint64_t sub_242FF4DB0()
{
  return MEMORY[0x24BEE73C0]();
}

uint64_t sub_242FF4DBC()
{
  return MEMORY[0x24BEE7408]();
}

uint64_t sub_242FF4DC8()
{
  return MEMORY[0x24BEE7420]();
}

uint64_t sub_242FF4DD4()
{
  return MEMORY[0x24BEE76F0]();
}

uint64_t sub_242FF4DE0()
{
  return MEMORY[0x24BE6CDE8]();
}

uint64_t sub_242FF4DEC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_242FF4DF8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_242FF4E04()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_242FF4E10()
{
  return MEMORY[0x24BEB4270]();
}

uint64_t sub_242FF4E1C()
{
  return MEMORY[0x24BEB4278]();
}

uint64_t sub_242FF4E28()
{
  return MEMORY[0x24BEB4290]();
}

uint64_t sub_242FF4E34()
{
  return MEMORY[0x24BEB42A8]();
}

uint64_t sub_242FF4E40()
{
  return MEMORY[0x24BEB42B0]();
}

uint64_t sub_242FF4E4C()
{
  return MEMORY[0x24BDEAE98]();
}

uint64_t sub_242FF4E58()
{
  return MEMORY[0x24BDEAEB0]();
}

uint64_t sub_242FF4E64()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_242FF4E70()
{
  return MEMORY[0x24BDEB268]();
}

uint64_t sub_242FF4E7C()
{
  return MEMORY[0x24BDEB270]();
}

uint64_t sub_242FF4E88()
{
  return MEMORY[0x24BDEB280]();
}

uint64_t sub_242FF4E94()
{
  return MEMORY[0x24BDEB2F0]();
}

uint64_t sub_242FF4EA0()
{
  return MEMORY[0x24BDEB3E0]();
}

uint64_t sub_242FF4EAC()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_242FF4EB8()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_242FF4EC4()
{
  return MEMORY[0x24BDEB7B8]();
}

uint64_t sub_242FF4ED0()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_242FF4EDC()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_242FF4EE8()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_242FF4EF4()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_242FF4F00()
{
  return MEMORY[0x24BDEBF88]();
}

uint64_t sub_242FF4F0C()
{
  return MEMORY[0x24BDEC000]();
}

uint64_t sub_242FF4F18()
{
  return MEMORY[0x24BDEC638]();
}

uint64_t sub_242FF4F24()
{
  return MEMORY[0x24BDEC648]();
}

uint64_t sub_242FF4F30()
{
  return MEMORY[0x24BDEC708]();
}

uint64_t sub_242FF4F3C()
{
  return MEMORY[0x24BDEC7B0]();
}

uint64_t sub_242FF4F48()
{
  return MEMORY[0x24BDEC850]();
}

uint64_t sub_242FF4F54()
{
  return MEMORY[0x24BDEC860]();
}

uint64_t sub_242FF4F60()
{
  return MEMORY[0x24BDECA40]();
}

uint64_t sub_242FF4F6C()
{
  return MEMORY[0x24BDECA50]();
}

uint64_t sub_242FF4F78()
{
  return MEMORY[0x24BDECF50]();
}

uint64_t sub_242FF4F84()
{
  return MEMORY[0x24BDED1D8]();
}

uint64_t sub_242FF4F90()
{
  return MEMORY[0x24BDED1F8]();
}

uint64_t sub_242FF4F9C()
{
  return MEMORY[0x24BDED2D0]();
}

uint64_t sub_242FF4FA8()
{
  return MEMORY[0x24BDEDBA8]();
}

uint64_t sub_242FF4FB4()
{
  return MEMORY[0x24BDEDD58]();
}

uint64_t sub_242FF4FC0()
{
  return MEMORY[0x24BDEDD60]();
}

uint64_t sub_242FF4FCC()
{
  return MEMORY[0x24BDEDDD8]();
}

uint64_t sub_242FF4FD8()
{
  return MEMORY[0x24BDEDE90]();
}

uint64_t sub_242FF4FE4()
{
  return MEMORY[0x24BDEDE98]();
}

uint64_t sub_242FF4FF0()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_242FF4FFC()
{
  return MEMORY[0x24BDEDEF8]();
}

uint64_t sub_242FF5008()
{
  return MEMORY[0x24BDEDF68]();
}

uint64_t sub_242FF5014()
{
  return MEMORY[0x24BDEE100]();
}

uint64_t sub_242FF5020()
{
  return MEMORY[0x24BDEE108]();
}

uint64_t sub_242FF502C()
{
  return MEMORY[0x24BDEE160]();
}

uint64_t sub_242FF5038()
{
  return MEMORY[0x24BDEE190]();
}

uint64_t sub_242FF5044()
{
  return MEMORY[0x24BDEE198]();
}

uint64_t sub_242FF5050()
{
  return MEMORY[0x24BDEE1C0]();
}

uint64_t sub_242FF505C()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_242FF5068()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_242FF5074()
{
  return MEMORY[0x24BDFAB70]();
}

uint64_t sub_242FF5080()
{
  return MEMORY[0x24BDEE490]();
}

uint64_t sub_242FF508C()
{
  return MEMORY[0x24BDEE4A0]();
}

uint64_t sub_242FF5098()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_242FF50A4()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_242FF50B0()
{
  return MEMORY[0x24BDEE530]();
}

uint64_t sub_242FF50BC()
{
  return MEMORY[0x24BDEE538]();
}

uint64_t sub_242FF50C8()
{
  return MEMORY[0x24BDEE628]();
}

uint64_t sub_242FF50D4()
{
  return MEMORY[0x24BDEE630]();
}

uint64_t sub_242FF50E0()
{
  return MEMORY[0x24BDEE6F8]();
}

uint64_t sub_242FF50EC()
{
  return MEMORY[0x24BDEE718]();
}

uint64_t sub_242FF50F8()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_242FF5104()
{
  return MEMORY[0x24BDEEA00]();
}

uint64_t sub_242FF5110()
{
  return MEMORY[0x24BDEEA08]();
}

uint64_t sub_242FF511C()
{
  return MEMORY[0x24BDEEA18]();
}

uint64_t sub_242FF5128()
{
  return MEMORY[0x24BDEEA28]();
}

uint64_t sub_242FF5134()
{
  return MEMORY[0x24BDEEA30]();
}

uint64_t sub_242FF5140()
{
  return MEMORY[0x24BDEEA40]();
}

uint64_t sub_242FF514C()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_242FF5158()
{
  return MEMORY[0x24BDEEA60]();
}

uint64_t sub_242FF5164()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_242FF5170()
{
  return MEMORY[0x24BDEEE00]();
}

uint64_t sub_242FF517C()
{
  return MEMORY[0x24BDEEF60]();
}

uint64_t sub_242FF5188()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_242FF5194()
{
  return MEMORY[0x24BDEEF80]();
}

uint64_t sub_242FF51A0()
{
  return MEMORY[0x24BDEF300]();
}

uint64_t sub_242FF51AC()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_242FF51B8()
{
  return MEMORY[0x24BDEFC98]();
}

uint64_t sub_242FF51C4()
{
  return MEMORY[0x24BDEFCA8]();
}

uint64_t sub_242FF51D0()
{
  return MEMORY[0x24BDEFCB0]();
}

uint64_t sub_242FF51DC()
{
  return MEMORY[0x24BDEFCB8]();
}

uint64_t sub_242FF51E8()
{
  return MEMORY[0x24BDEFCC8]();
}

uint64_t sub_242FF51F4()
{
  return MEMORY[0x24BDF09F8]();
}

uint64_t sub_242FF5200()
{
  return MEMORY[0x24BDF0A10]();
}

uint64_t sub_242FF520C()
{
  return MEMORY[0x24BDF0A20]();
}

uint64_t sub_242FF5218()
{
  return MEMORY[0x24BDF1088]();
}

uint64_t sub_242FF5224()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_242FF5230()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_242FF523C()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_242FF5248()
{
  return MEMORY[0x24BDF14C0]();
}

uint64_t sub_242FF5254()
{
  return MEMORY[0x24BDF14C8]();
}

uint64_t sub_242FF5260()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_242FF526C()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_242FF5278()
{
  return MEMORY[0x24BDF15F8]();
}

uint64_t sub_242FF5284()
{
  return MEMORY[0x24BDF1600]();
}

uint64_t sub_242FF5290()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_242FF529C()
{
  return MEMORY[0x24BDF1698]();
}

uint64_t sub_242FF52A8()
{
  return MEMORY[0x24BDF16A8]();
}

uint64_t sub_242FF52B4()
{
  return MEMORY[0x24BDF16B0]();
}

uint64_t sub_242FF52C0()
{
  return MEMORY[0x24BDF16B8]();
}

uint64_t sub_242FF52CC()
{
  return MEMORY[0x24BDF16C0]();
}

uint64_t sub_242FF52D8()
{
  return MEMORY[0x24BDF16D0]();
}

uint64_t sub_242FF52E4()
{
  return MEMORY[0x24BDF16D8]();
}

uint64_t sub_242FF52F0()
{
  return MEMORY[0x24BDF16E8]();
}

uint64_t sub_242FF52FC()
{
  return MEMORY[0x24BDF1700]();
}

uint64_t sub_242FF5308()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_242FF5314()
{
  return MEMORY[0x24BDF1778]();
}

uint64_t sub_242FF5320()
{
  return MEMORY[0x24BDF1790]();
}

uint64_t sub_242FF532C()
{
  return MEMORY[0x24BDF1798]();
}

uint64_t sub_242FF5338()
{
  return MEMORY[0x24BDF17D8]();
}

uint64_t sub_242FF5344()
{
  return MEMORY[0x24BDF17E8]();
}

uint64_t sub_242FF5350()
{
  return MEMORY[0x24BDF17F8]();
}

uint64_t sub_242FF535C()
{
  return MEMORY[0x24BDF1818]();
}

uint64_t sub_242FF5368()
{
  return MEMORY[0x24BDF1820]();
}

uint64_t sub_242FF5374()
{
  return MEMORY[0x24BDF1828]();
}

uint64_t sub_242FF5380()
{
  return MEMORY[0x24BDF1840]();
}

uint64_t sub_242FF538C()
{
  return MEMORY[0x24BDF1BE8]();
}

uint64_t sub_242FF5398()
{
  return MEMORY[0x24BDF1D18]();
}

uint64_t sub_242FF53A4()
{
  return MEMORY[0x24BDF1D68]();
}

uint64_t sub_242FF53B0()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_242FF53BC()
{
  return MEMORY[0x24BDF1EA8]();
}

uint64_t sub_242FF53C8()
{
  return MEMORY[0x24BDF1F68]();
}

uint64_t sub_242FF53D4()
{
  return MEMORY[0x24BDF1FB8]();
}

uint64_t sub_242FF53E0()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_242FF53EC()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_242FF53F8()
{
  return MEMORY[0x24BDFAC18]();
}

uint64_t sub_242FF5404()
{
  return MEMORY[0x24BDFAC38]();
}

uint64_t sub_242FF5410()
{
  return MEMORY[0x24BDFAC48]();
}

uint64_t sub_242FF541C()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_242FF5428()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_242FF5434()
{
  return MEMORY[0x24BDF2138]();
}

uint64_t sub_242FF5440()
{
  return MEMORY[0x24BDF2258]();
}

uint64_t sub_242FF544C()
{
  return MEMORY[0x24BDF2260]();
}

uint64_t sub_242FF5458()
{
  return MEMORY[0x24BDF2370]();
}

uint64_t sub_242FF5464()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_242FF5470()
{
  return MEMORY[0x24BDF27E0]();
}

uint64_t sub_242FF547C()
{
  return MEMORY[0x24BDF2B40]();
}

uint64_t sub_242FF5488()
{
  return MEMORY[0x24BDF2B50]();
}

uint64_t sub_242FF5494()
{
  return MEMORY[0x24BDF2DB8]();
}

uint64_t sub_242FF54A0()
{
  return MEMORY[0x24BDF2F08]();
}

uint64_t sub_242FF54AC()
{
  return MEMORY[0x24BDF3A30]();
}

uint64_t sub_242FF54B8()
{
  return MEMORY[0x24BDF3BF8]();
}

uint64_t sub_242FF54C4()
{
  return MEMORY[0x24BDF3C40]();
}

uint64_t sub_242FF54D0()
{
  return MEMORY[0x24BDF3C50]();
}

uint64_t sub_242FF54DC()
{
  return MEMORY[0x24BDF3C78]();
}

uint64_t sub_242FF54E8()
{
  return MEMORY[0x24BDF3C90]();
}

uint64_t sub_242FF54F4()
{
  return MEMORY[0x24BDF3C98]();
}

uint64_t sub_242FF5500()
{
  return MEMORY[0x24BDF3CA8]();
}

uint64_t sub_242FF550C()
{
  return MEMORY[0x24BDF3CB8]();
}

uint64_t sub_242FF5518()
{
  return MEMORY[0x24BDF3CD0]();
}

uint64_t sub_242FF5524()
{
  return MEMORY[0x24BDF3CD8]();
}

uint64_t sub_242FF5530()
{
  return MEMORY[0x24BDF3CE0]();
}

uint64_t sub_242FF553C()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_242FF5548()
{
  return MEMORY[0x24BDF3D00]();
}

uint64_t sub_242FF5554()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_242FF5560()
{
  return MEMORY[0x24BDF3D18]();
}

uint64_t sub_242FF556C()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_242FF5578()
{
  return MEMORY[0x24BDF3D40]();
}

uint64_t sub_242FF5584()
{
  return MEMORY[0x24BDF3D50]();
}

uint64_t sub_242FF5590()
{
  return MEMORY[0x24BDF3D58]();
}

uint64_t sub_242FF559C()
{
  return MEMORY[0x24BDF3D60]();
}

uint64_t sub_242FF55A8()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_242FF55B4()
{
  return MEMORY[0x24BDF3D90]();
}

uint64_t sub_242FF55C0()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_242FF55CC()
{
  return MEMORY[0x24BDF3E70]();
}

uint64_t sub_242FF55D8()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_242FF55E4()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_242FF55F0()
{
  return MEMORY[0x24BDF3FE8]();
}

uint64_t sub_242FF55FC()
{
  return MEMORY[0x24BDF4048]();
}

uint64_t sub_242FF5608()
{
  return MEMORY[0x24BDF40C0]();
}

uint64_t sub_242FF5614()
{
  return MEMORY[0x24BDF40D8]();
}

uint64_t sub_242FF5620()
{
  return MEMORY[0x24BDF41F8]();
}

uint64_t sub_242FF562C()
{
  return MEMORY[0x24BDF4208]();
}

uint64_t sub_242FF5638()
{
  return MEMORY[0x24BDF4218]();
}

uint64_t sub_242FF5644()
{
  return MEMORY[0x24BDF4230]();
}

uint64_t sub_242FF5650()
{
  return MEMORY[0x24BDF4238]();
}

uint64_t sub_242FF565C()
{
  return MEMORY[0x24BDF4248]();
}

uint64_t sub_242FF5668()
{
  return MEMORY[0x24BDF4278]();
}

uint64_t sub_242FF5674()
{
  return MEMORY[0x24BDF4470]();
}

uint64_t sub_242FF5680()
{
  return MEMORY[0x24BDF4480]();
}

uint64_t sub_242FF568C()
{
  return MEMORY[0x24BDF4728]();
}

uint64_t sub_242FF5698()
{
  return MEMORY[0x24BDF4730]();
}

uint64_t sub_242FF56A4()
{
  return MEMORY[0x24BDF48E8]();
}

uint64_t sub_242FF56B0()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_242FF56BC()
{
  return MEMORY[0x24BDF4CE0]();
}

uint64_t sub_242FF56C8()
{
  return MEMORY[0x24BDF4D00]();
}

uint64_t sub_242FF56D4()
{
  return MEMORY[0x24BDF4D08]();
}

uint64_t sub_242FF56E0()
{
  return MEMORY[0x24BDF4E08]();
}

uint64_t sub_242FF56EC()
{
  return MEMORY[0x24BDF4E58]();
}

uint64_t sub_242FF56F8()
{
  return MEMORY[0x24BDF4ED8]();
}

uint64_t sub_242FF5704()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_242FF5710()
{
  return MEMORY[0x24BDF4F20]();
}

uint64_t sub_242FF571C()
{
  return MEMORY[0x24BDF4F38]();
}

uint64_t sub_242FF5728()
{
  return MEMORY[0x24BDF53F0]();
}

uint64_t sub_242FF5734()
{
  return MEMORY[0x24BDF5418]();
}

uint64_t sub_242FF5740()
{
  return MEMORY[0x24BDF5448]();
}

uint64_t sub_242FF574C()
{
  return MEMORY[0x24BDF5450]();
}

uint64_t sub_242FF5758()
{
  return MEMORY[0x24BDF5458]();
}

uint64_t sub_242FF5764()
{
  return MEMORY[0x24BDF5460]();
}

uint64_t sub_242FF5770()
{
  return MEMORY[0x24BDF5478]();
}

uint64_t sub_242FF577C()
{
  return MEMORY[0x24BDF5490]();
}

uint64_t sub_242FF5788()
{
  return MEMORY[0x24BDF54A8]();
}

uint64_t sub_242FF5794()
{
  return MEMORY[0x24BDF54B0]();
}

uint64_t sub_242FF57A0()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_242FF57AC()
{
  return MEMORY[0x24BEE54B0]();
}

uint64_t sub_242FF57B8()
{
  return MEMORY[0x24BEE54C0]();
}

uint64_t sub_242FF57C4()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_242FF57D0()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_242FF57DC()
{
  return MEMORY[0x24BDFB008]();
}

uint64_t sub_242FF57E8()
{
  return MEMORY[0x24BDFB010]();
}

uint64_t sub_242FF57F4()
{
  return MEMORY[0x24BDFB018]();
}

uint64_t sub_242FF5800()
{
  return MEMORY[0x24BDFB020]();
}

uint64_t sub_242FF580C()
{
  return MEMORY[0x24BDFB028]();
}

uint64_t sub_242FF5818()
{
  return MEMORY[0x24BDFB0C8]();
}

uint64_t sub_242FF5824()
{
  return MEMORY[0x24BDFB0D0]();
}

uint64_t sub_242FF5830()
{
  return MEMORY[0x24BDFB0E0]();
}

uint64_t sub_242FF583C()
{
  return MEMORY[0x24BDFB0E8]();
}

uint64_t sub_242FF5848()
{
  return MEMORY[0x24BDFB1A0]();
}

uint64_t sub_242FF5854()
{
  return MEMORY[0x24BDFB3E0]();
}

uint64_t sub_242FF5860()
{
  return MEMORY[0x24BDFB3F0]();
}

uint64_t sub_242FF586C()
{
  return MEMORY[0x24BDFB3F8]();
}

uint64_t sub_242FF5878()
{
  return MEMORY[0x24BDFB400]();
}

uint64_t sub_242FF5884()
{
  return MEMORY[0x24BDFB408]();
}

uint64_t sub_242FF5890()
{
  return MEMORY[0x24BDFB410]();
}

uint64_t sub_242FF589C()
{
  return MEMORY[0x24BDFB490]();
}

uint64_t sub_242FF58A8()
{
  return MEMORY[0x24BDFB498]();
}

uint64_t sub_242FF58B4()
{
  return MEMORY[0x24BDFB4A0]();
}

uint64_t sub_242FF58C0()
{
  return MEMORY[0x24BDFB4A8]();
}

uint64_t sub_242FF58CC()
{
  return MEMORY[0x24BDCF7F0]();
}

uint64_t sub_242FF58D8()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_242FF58E4()
{
  return MEMORY[0x24BEB4768]();
}

uint64_t sub_242FF58F0()
{
  return MEMORY[0x24BEE02C0]();
}

uint64_t sub_242FF58FC()
{
  return MEMORY[0x24BEE0388]();
}

uint64_t sub_242FF5908()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_242FF5914()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_242FF5920()
{
  return MEMORY[0x24BEE75F8]();
}

uint64_t sub_242FF592C()
{
  return MEMORY[0x24BEE07C0]();
}

uint64_t sub_242FF5938()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_242FF5944()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_242FF5950()
{
  return MEMORY[0x24BDCF850]();
}

uint64_t sub_242FF595C()
{
  return MEMORY[0x24BDCF858]();
}

uint64_t sub_242FF5968()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_242FF5974()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_242FF5980()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_242FF598C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_242FF5998()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_242FF59A4()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_242FF59B0()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_242FF59BC()
{
  return MEMORY[0x24BEE0A08]();
}

uint64_t sub_242FF59C8()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_242FF59D4()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_242FF59E0()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_242FF59EC()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_242FF59F8()
{
  return MEMORY[0x24BEE0B88]();
}

uint64_t sub_242FF5A04()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_242FF5A10()
{
  return MEMORY[0x24BEE0C00]();
}

uint64_t sub_242FF5A1C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_242FF5A28()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_242FF5A34()
{
  return MEMORY[0x24BDCFB60]();
}

uint64_t sub_242FF5A40()
{
  return MEMORY[0x24BEE0ED0]();
}

uint64_t sub_242FF5A4C()
{
  return MEMORY[0x24BEE0F30]();
}

uint64_t sub_242FF5A58()
{
  return MEMORY[0x24BEE1000]();
}

uint64_t sub_242FF5A64()
{
  return MEMORY[0x24BEE1068]();
}

uint64_t sub_242FF5A70()
{
  return MEMORY[0x24BEE1070]();
}

uint64_t sub_242FF5A7C()
{
  return MEMORY[0x24BEE1078]();
}

uint64_t sub_242FF5A88()
{
  return MEMORY[0x24BEE1080]();
}

uint64_t sub_242FF5A94()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_242FF5AA0()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_242FF5AAC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_242FF5AB8()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_242FF5AC4()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_242FF5AD0()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_242FF5ADC()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_242FF5AE8()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_242FF5AF4()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_242FF5B00()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_242FF5B0C()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_242FF5B18()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_242FF5B24()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_242FF5B30()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_242FF5B3C()
{
  return MEMORY[0x24BEE1260]();
}

uint64_t sub_242FF5B48()
{
  return MEMORY[0x24BEE1268]();
}

uint64_t sub_242FF5B54()
{
  return MEMORY[0x24BEE1278]();
}

uint64_t sub_242FF5B60()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_242FF5B6C()
{
  return MEMORY[0x24BEE6820]();
}

uint64_t sub_242FF5B78()
{
  return MEMORY[0x24BEE6828]();
}

uint64_t sub_242FF5B84()
{
  return MEMORY[0x24BEE6838]();
}

uint64_t sub_242FF5B90()
{
  return MEMORY[0x24BEE6860]();
}

uint64_t sub_242FF5B9C()
{
  return MEMORY[0x24BEE6888]();
}

uint64_t sub_242FF5BA8()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_242FF5BB4()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_242FF5BC0()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_242FF5BCC()
{
  return MEMORY[0x24BEE6978]();
}

uint64_t sub_242FF5BD8()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_242FF5BE4()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_242FF5BF0()
{
  return MEMORY[0x24BEE69F8]();
}

uint64_t sub_242FF5BFC()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_242FF5C08()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_242FF5C14()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_242FF5C20()
{
  return MEMORY[0x24BEE6A90]();
}

uint64_t sub_242FF5C2C()
{
  return MEMORY[0x24BEE6AA0]();
}

uint64_t sub_242FF5C38()
{
  return MEMORY[0x24BEE6AD0]();
}

uint64_t sub_242FF5C44()
{
  return MEMORY[0x24BEE6B00]();
}

uint64_t sub_242FF5C50()
{
  return MEMORY[0x24BEE6B20]();
}

uint64_t sub_242FF5C5C()
{
  return MEMORY[0x24BEE6B38]();
}

uint64_t sub_242FF5C68()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_242FF5C74()
{
  return MEMORY[0x24BEE1478]();
}

uint64_t sub_242FF5C80()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_242FF5C8C()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_242FF5C98()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_242FF5CA4()
{
  return MEMORY[0x24BDCFD30]();
}

uint64_t sub_242FF5CB0()
{
  return MEMORY[0x24BDCFD38]();
}

uint64_t sub_242FF5CBC()
{
  return MEMORY[0x24BDCFD40]();
}

uint64_t sub_242FF5CC8()
{
  return MEMORY[0x24BEE1758]();
}

uint64_t sub_242FF5CD4()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_242FF5CE0()
{
  return MEMORY[0x24BEE7640]();
}

uint64_t sub_242FF5CEC()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_242FF5CF8()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_242FF5D04()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_242FF5D10()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_242FF5D1C()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_242FF5D28()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_242FF5D34()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_242FF5D40()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_242FF5D4C()
{
  return MEMORY[0x24BEE57B0]();
}

uint64_t sub_242FF5D58()
{
  return MEMORY[0x24BDD0460]();
}

uint64_t sub_242FF5D64()
{
  return MEMORY[0x24BDD0470]();
}

uint64_t sub_242FF5D70()
{
  return MEMORY[0x24BDD0478]();
}

uint64_t sub_242FF5D7C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_242FF5D88()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_242FF5D94()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_242FF5DA0()
{
  return MEMORY[0x24BDD0568]();
}

uint64_t sub_242FF5DAC()
{
  return MEMORY[0x24BDD0590]();
}

uint64_t sub_242FF5DB8()
{
  return MEMORY[0x24BDD0638]();
}

uint64_t sub_242FF5DC4()
{
  return MEMORY[0x24BDD0668]();
}

uint64_t sub_242FF5DD0()
{
  return MEMORY[0x24BEE2090]();
}

uint64_t sub_242FF5DDC()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_242FF5DE8()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_242FF5DF4()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_242FF5E00()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_242FF5E0C()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_242FF5E18()
{
  return MEMORY[0x24BEE23B8]();
}

uint64_t sub_242FF5E24()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_242FF5E30()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_242FF5E3C()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_242FF5E48()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_242FF5E54()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_242FF5E60()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_242FF5E6C()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_242FF5E78()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_242FF5E84()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_242FF5E90()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_242FF5E9C()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_242FF5EA8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_242FF5EB4()
{
  return MEMORY[0x24BEE6D68]();
}

uint64_t sub_242FF5EC0()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_242FF5ECC()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_242FF5ED8()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_242FF5EE4()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_242FF5EF0()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_242FF5EFC()
{
  return MEMORY[0x24BEE6DB0]();
}

uint64_t sub_242FF5F08()
{
  return MEMORY[0x24BEE6DB8]();
}

uint64_t sub_242FF5F14()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_242FF5F20()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_242FF5F2C()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_242FF5F38()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_242FF5F44()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_242FF5F50()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_242FF5F5C()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_242FF5F68()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_242FF5F74()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_242FF5F80()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_242FF5F8C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_242FF5F98()
{
  return MEMORY[0x24BEE3100]();
}

uint64_t sub_242FF5FA4()
{
  return MEMORY[0x24BEE3120]();
}

uint64_t sub_242FF5FB0()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_242FF5FBC()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_242FF5FC8()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_242FF5FD4()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_242FF5FE0()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_242FF5FEC()
{
  return MEMORY[0x24BEE32E8]();
}

uint64_t sub_242FF5FF8()
{
  return MEMORY[0x24BEE32F8]();
}

uint64_t sub_242FF6004()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_242FF6010()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_242FF601C()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_242FF6028()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_242FF6034()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_242FF6040()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_242FF604C()
{
  return MEMORY[0x24BEE33A0]();
}

uint64_t sub_242FF6058()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_242FF6064()
{
  return MEMORY[0x24BEE33D0]();
}

uint64_t sub_242FF6070()
{
  return MEMORY[0x24BEE33E0]();
}

uint64_t sub_242FF607C()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_242FF6088()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_242FF6094()
{
  return MEMORY[0x24BEE3438]();
}

uint64_t sub_242FF60A0()
{
  return MEMORY[0x24BEE3448]();
}

uint64_t sub_242FF60AC()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_242FF60B8()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_242FF60C4()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_242FF60D0()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_242FF60DC()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_242FF60E8()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_242FF60F4()
{
  return MEMORY[0x24BEE34F0]();
}

uint64_t sub_242FF6100()
{
  return MEMORY[0x24BEE3520]();
}

uint64_t sub_242FF610C()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_242FF6118()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_242FF6124()
{
  return MEMORY[0x24BEE7058]();
}

uint64_t sub_242FF6130()
{
  return MEMORY[0x24BEE3618]();
}

uint64_t sub_242FF613C()
{
  return MEMORY[0x24BEE3668]();
}

uint64_t sub_242FF6148()
{
  return MEMORY[0x24BEE3750]();
}

uint64_t sub_242FF6154()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_242FF6160()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_242FF616C()
{
  return MEMORY[0x24BEE3A58]();
}

uint64_t sub_242FF6178()
{
  return MEMORY[0x24BEE3A78]();
}

uint64_t sub_242FF6184()
{
  return MEMORY[0x24BEE3A88]();
}

uint64_t sub_242FF6190()
{
  return MEMORY[0x24BEE3AF0]();
}

uint64_t sub_242FF619C()
{
  return MEMORY[0x24BEE3B10]();
}

uint64_t sub_242FF61A8()
{
  return MEMORY[0x24BEE3B20]();
}

uint64_t sub_242FF61B4()
{
  return MEMORY[0x24BEE3BB8]();
}

uint64_t sub_242FF61C0()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_242FF61CC()
{
  return MEMORY[0x24BEE70E0]();
}

uint64_t sub_242FF61D8()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_242FF61E4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_242FF61F0()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_242FF61FC()
{
  return MEMORY[0x24BEE3EE8]();
}

uint64_t sub_242FF6208()
{
  return MEMORY[0x24BEE3EF0]();
}

uint64_t sub_242FF6214()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_242FF6220()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_242FF622C()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_242FF6238()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_242FF6244()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_242FF6250()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_242FF625C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_242FF6268()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_242FF6274()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_242FF6280()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_242FF628C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_242FF6298()
{
  return MEMORY[0x24BEE4358]();
}

uint64_t sub_242FF62A4()
{
  return MEMORY[0x24BEE4398]();
}

uint64_t sub_242FF62B0()
{
  return MEMORY[0x24BEE43C8]();
}

uint64_t sub_242FF62BC()
{
  return MEMORY[0x24BEE43F0]();
}

uint64_t sub_242FF62C8()
{
  return MEMORY[0x24BEE45E8]();
}

uint64_t sub_242FF62D4()
{
  return MEMORY[0x24BEE45F0]();
}

uint64_t sub_242FF62E0()
{
  return MEMORY[0x24BEE45F8]();
}

uint64_t sub_242FF62EC()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_242FF62F8()
{
  return MEMORY[0x24BEE4620]();
}

uint64_t sub_242FF6304()
{
  return MEMORY[0x24BEE4628]();
}

uint64_t sub_242FF6310()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_242FF631C()
{
  return MEMORY[0x24BEE4830]();
}

uint64_t sub_242FF6328()
{
  return MEMORY[0x24BEE4860]();
}

uint64_t sub_242FF6334()
{
  return MEMORY[0x24BEE4880]();
}

uint64_t sub_242FF6340()
{
  return MEMORY[0x24BEE4898]();
}

uint64_t sub_242FF634C()
{
  return MEMORY[0x24BEE49E8]();
}

uint64_t sub_242FF6358()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_242FF6364()
{
  return MEMORY[0x24BEE4A10]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x24BED8580]();
}

uint64_t MobileGestalt_get_deviceSupportsAlwaysOnTime()
{
  return MEMORY[0x24BED85A8]();
}

uint64_t MobileGestalt_get_mainScreenScale()
{
  return MEMORY[0x24BED8638]();
}

uint64_t SBSIsSystemApertureAvailable()
{
  return MEMORY[0x24BEB0C98]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x24BDAC7D8](a1);
  return result;
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t lroundf(float a1)
{
  return MEMORY[0x24BDAEB18](a1);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
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

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
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

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocUninitializedObject()
{
  return MEMORY[0x24BEE4C20]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
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

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_getOpaqueTypeMetadata2()
{
  return MEMORY[0x24BEE4DC8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
}

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
}

uint64_t swift_stdlib_random()
{
  return MEMORY[0x24BEE4F50]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
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

uint64_t swift_task_isCancelled()
{
  return MEMORY[0x24BEE7248]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
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

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

