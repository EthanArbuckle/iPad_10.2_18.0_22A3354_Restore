__n128 initializeWithTake for BatteriesWidget(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100004F80(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100004FA0(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_10000C090)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_1000083A8);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10000C090);
  }
}

uint64_t sub_10000501C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for Date(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_100005054@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_100007280(v2 + *(int *)(a1 + 20), a2);
}

uint64_t sub_100005068@<X0>(uint64_t a1@<X8>)
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  double *v10;

  v2 = TimelineProviderContext.displaySize.getter();
  v4 = v3;
  v5 = type metadata accessor for BasicTimelineEntry(0);
  v6 = a1 + *(int *)(v5 + 20);
  v7 = type metadata accessor for TimelineEntryRelevance(0);
  v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  result = Date.init()(v8);
  v10 = (double *)(a1 + *(int *)(v5 + 24));
  *v10 = v2;
  *((_QWORD *)v10 + 1) = v4;
  return result;
}

uint64_t sub_1000050F0(uint64_t a1, uint64_t a2, void (*a3)(char *))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  double *v14;
  uint64_t v16;

  v4 = type metadata accessor for BasicTimelineEntry(0);
  v5 = __chkstk_darwin();
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = TimelineProviderContext.displaySize.getter(v5);
  v10 = v9;
  v11 = &v7[*(int *)(v4 + 20)];
  v12 = type metadata accessor for TimelineEntryRelevance(0);
  v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 1, 1, v12);
  Date.init()(v13);
  v14 = (double *)&v7[*(int *)(v4 + 24)];
  *v14 = v8;
  *((_QWORD *)v14 + 1) = v10;
  a3(v7);
  return sub_100007244((uint64_t)v7);
}

uint64_t sub_1000051C8(uint64_t a1, uint64_t a2, void (*a3)(char *))
{
  return sub_100006FFC(a2, a3);
}

uint64_t sub_1000051D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to IntentTimelineProvider.relevances()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_100005244;
  return IntentTimelineProvider.relevances()(a1, a2, a3);
}

uint64_t sub_100005244()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = *v0;
  v1 = *(_QWORD *)(v4 + 16);
  v2 = *v0;
  v4 = v2;
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000528C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to IntentTimelineProvider.relevance()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_1000072F4;
  return IntentTimelineProvider.relevance()(a1, a2, a3);
}

uint64_t sub_1000052F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t OpaqueTypeConformance2;
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
  void (*v44)(uint64_t, _QWORD, uint64_t);
  uint64_t v45;
  uint64_t v46;
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
  uint64_t v58;
  unint64_t v59;

  v49 = a1;
  v57 = a3;
  v4 = sub_1000059C4(&qword_10000C0A0);
  v50 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v6 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000059C4(&qword_10000C0A8);
  v52 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v9 = (char *)&v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1000059C4(&qword_10000C0B0);
  v11 = *(_QWORD *)(v10 - 8);
  v53 = v10;
  v54 = v11;
  __chkstk_darwin();
  v13 = (char *)&v48 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1000059C4(&qword_10000C0B8);
  v15 = *(_QWORD *)(v14 - 8);
  v55 = v14;
  v56 = v15;
  __chkstk_darwin();
  v51 = (char *)&v48 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_100005A04();
  type metadata accessor for BatteriesWidgetEntryView(0);
  sub_100006FAC(&qword_10000C0C8, type metadata accessor for BatteriesWidgetEntryView, (uint64_t)&unk_100007774);
  sub_100005A54();
  swift_bridgeObjectRetain(a2);
  IntentConfiguration.init<A>(kind:intent:provider:content:)(v49, a2, v17);
  v18 = LocalizedStringKey.init(stringLiteral:)(0xD00000000000001DLL, 0x8000000100007D30);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v25 = sub_100005A98();
  WidgetConfiguration.configurationDisplayName(_:)(v18, v20, v22 & 1, v24, v4, v25);
  swift_bridgeObjectRelease(v24);
  swift_bridgeObjectRelease(v20);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v6, v4);
  v26 = LocalizedStringKey.init(stringLiteral:)(0xD00000000000001CLL, 0x8000000100007D50);
  v28 = v27;
  LOBYTE(v6) = v29;
  v31 = v30;
  v58 = v4;
  v59 = v25;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v58, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  WidgetConfiguration.description(_:)(v26, v28, v6 & 1, v31, v7, OpaqueTypeConformance2);
  swift_bridgeObjectRelease(v31);
  swift_bridgeObjectRelease(v28);
  (*(void (**)(char *, uint64_t))(v52 + 8))(v9, v7);
  v58 = v7;
  v59 = OpaqueTypeConformance2;
  v33 = swift_getOpaqueTypeConformance2(&v58, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v34 = v51;
  v35 = v53;
  WidgetConfiguration.supportsInteraction(_:)(0, v53, v33);
  v36 = v35;
  (*(void (**)(char *, uint64_t))(v54 + 8))(v13, v35);
  v37 = sub_1000059C4(&qword_10000C0E0);
  v38 = type metadata accessor for WidgetFamily(0);
  v39 = *(_QWORD *)(v38 - 8);
  v40 = *(_QWORD *)(v39 + 72);
  v41 = *(unsigned __int8 *)(v39 + 80);
  v42 = (v41 + 32) & ~v41;
  v43 = swift_allocObject(v37, v42 + 2 * v40, v41 | 7);
  *(_OWORD *)(v43 + 16) = xmmword_1000075C0;
  v44 = *(void (**)(uint64_t, _QWORD, uint64_t))(v39 + 104);
  v44(v43 + v42, enum case for WidgetFamily.accessoryRectangular(_:), v38);
  v44(v43 + v42 + v40, enum case for WidgetFamily.accessoryCircular(_:), v38);
  v58 = v36;
  v59 = v33;
  v45 = swift_getOpaqueTypeConformance2(&v58, &opaque type descriptor for <<opaque return type of WidgetConfiguration.supportsInteraction(_:)>>, 1);
  v46 = v55;
  WidgetConfiguration.supportedFamilies(_:)(v43, v55, v45);
  swift_bridgeObjectRelease(v43);
  return (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v34, v46);
}

uint64_t sub_100005700@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char *v5;
  uint64_t KeyPath;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v10;

  type metadata accessor for BasicTimelineEntry(0);
  __chkstk_darwin();
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005B70(a1, (uint64_t)v5);
  KeyPath = swift_getKeyPath(&unk_100007650);
  v7 = (uint64_t *)(a2 + *(int *)(type metadata accessor for BatteriesWidgetEntryView(0) + 20));
  *v7 = KeyPath;
  v8 = sub_1000059C4(&qword_10000C0E8);
  swift_storeEnumTagMultiPayload(v7, v8, 0);
  return sub_100005BD4((uint64_t)v5, a2);
}

void sub_1000057B8(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000020;
  a1[1] = 0x8000000100007D70;
}

uint64_t sub_1000057D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_1000052F8(*v1, v1[1], a1);
}

uint64_t sub_1000057E8()
{
  return static View._viewListCount(inputs:)();
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100005838();
  static Widget.main()();
  return 0;
}

unint64_t sub_100005838()
{
  unint64_t result;

  result = qword_10000C098;
  if (!qword_10000C098)
  {
    result = swift_getWitnessTable(&unk_10000760C, &type metadata for BatteriesWidget);
    atomic_store(result, (unint64_t *)&qword_10000C098);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for BatteriesWidget(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for BatteriesWidget(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
}

_QWORD *assignWithCopy for BatteriesWidget(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  *a1 = *a2;
  v3 = a1[1];
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease(v3);
  return a1;
}

_QWORD *assignWithTake for BatteriesWidget(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease(v4);
  return a1;
}

uint64_t getEnumTagSinglePayload for BatteriesWidget(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for BatteriesWidget(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for BatteriesWidget()
{
  return &type metadata for BatteriesWidget;
}

uint64_t sub_1000059B4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000078C4, 1);
}

uint64_t sub_1000059C4(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_100005A04()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C0C0;
  if (!qword_10000C0C0)
  {
    v1 = objc_opt_self(ViewPossibleDevicesIntent);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10000C0C0);
  }
  return result;
}

uint64_t type metadata accessor for BatteriesWidgetEntryView(uint64_t a1)
{
  return sub_100005B3C(a1, (uint64_t *)&unk_10000C1F8, (uint64_t)&nominal type descriptor for BatteriesWidgetEntryView);
}

unint64_t sub_100005A54()
{
  unint64_t result;

  result = qword_10000C0D0;
  if (!qword_10000C0D0)
  {
    result = swift_getWitnessTable(&unk_10000770C, &type metadata for Provider);
    atomic_store(result, (unint64_t *)&qword_10000C0D0);
  }
  return result;
}

unint64_t sub_100005A98()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C0D8;
  if (!qword_10000C0D8)
  {
    v1 = sub_100005AE4(&qword_10000C0A0);
    result = swift_getWitnessTable(&protocol conformance descriptor for IntentConfiguration<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10000C0D8);
  }
  return result;
}

uint64_t sub_100005AE4(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for BasicTimelineEntry(uint64_t a1)
{
  return sub_100005B3C(a1, (uint64_t *)&unk_10000C150, (uint64_t)&nominal type descriptor for BasicTimelineEntry);
}

uint64_t sub_100005B3C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

uint64_t sub_100005B70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for BasicTimelineEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100005BB4()
{
  return EnvironmentValues.widgetFamily.getter();
}

uint64_t sub_100005BD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for BasicTimelineEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *sub_100005C18(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    v7 = type metadata accessor for Date(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for TimelineEntryRelevance(0);
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      v13 = sub_1000059C4(&qword_10000C0F0);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  }
  return a1;
}

uint64_t sub_100005D34(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v4 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = type metadata accessor for TimelineEntryRelevance(0);
  v7 = *(_QWORD *)(v6 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  return result;
}

uint64_t sub_100005DC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = type metadata accessor for TimelineEntryRelevance(0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = sub_1000059C4(&qword_10000C0F0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_100005EB4(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = type metadata accessor for TimelineEntryRelevance(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = sub_1000059C4(&qword_10000C0F0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  v16 = *(int *)(a3 + 24);
  v17 = (_QWORD *)(a1 + v16);
  v18 = (_QWORD *)(a2 + v16);
  *v17 = *v18;
  v17[1] = v18[1];
  return a1;
}

uint64_t sub_100006000(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = type metadata accessor for TimelineEntryRelevance(0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = sub_1000059C4(&qword_10000C0F0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_1000060F0(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = type metadata accessor for TimelineEntryRelevance(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = sub_1000059C4(&qword_10000C0F0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  *(_OWORD *)(a1 + *(int *)(a3 + 24)) = *(_OWORD *)(a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_10000622C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100006238);
}

uint64_t sub_100006238(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006CA0(a1, a2, a3, (uint64_t (*)(_QWORD))&type metadata accessor for Date, &qword_10000C0F0);
}

uint64_t sub_10000624C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100006258);
}

uint64_t sub_100006258(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return sub_100006D38(a1, a2, a3, a4, (uint64_t (*)(_QWORD))&type metadata accessor for Date, &qword_10000C0F0);
}

void sub_10000626C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[3];

  v2 = type metadata accessor for Date(319);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_100006E5C(319, (unint64_t *)&unk_10000C160, (uint64_t (*)(uint64_t))&type metadata accessor for TimelineEntryRelevance, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
    if (v5 <= 0x3F)
    {
      v6[1] = *(_QWORD *)(v4 - 8) + 64;
      v6[2] = &unk_100007698;
      swift_initStructMetadata(a1, 256, 3, v6, a1 + 16);
    }
  }
}

ValueMetadata *type metadata accessor for Provider()
{
  return &type metadata for Provider;
}

uint64_t *sub_100006320(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = type metadata accessor for Date(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = type metadata accessor for BasicTimelineEntry(0);
    v9 = *(int *)(v8 + 20);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = type metadata accessor for TimelineEntryRelevance(0);
    v13 = *(_QWORD *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
    {
      v14 = sub_1000059C4(&qword_10000C0F0);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v10, v11, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
    }
    *(_OWORD *)((char *)a1 + *(int *)(v8 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(v8 + 24));
    v16 = *(int *)(a3 + 20);
    v17 = (uint64_t *)((char *)a1 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = sub_1000059C4(&qword_10000C0E8);
    if (swift_getEnumCaseMultiPayload(v18, v19) == 1)
    {
      v20 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v17, v18, v20);
      v21 = v17;
      v22 = v19;
      v23 = 1;
    }
    else
    {
      *v17 = *v18;
      swift_retain();
      v21 = v17;
      v22 = v19;
      v23 = 0;
    }
    swift_storeEnumTagMultiPayload(v21, v22, v23);
  }
  return a1;
}

uint64_t sub_1000064C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(type metadata accessor for BasicTimelineEntry(0) + 20);
  v6 = type metadata accessor for TimelineEntryRelevance(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  v8 = (_QWORD *)(a1 + *(int *)(a2 + 20));
  v9 = sub_1000059C4(&qword_10000C0E8);
  if (swift_getEnumCaseMultiPayload(v8, v9) != 1)
    return swift_release(*v8);
  v10 = type metadata accessor for WidgetFamily(0);
  return (*(uint64_t (**)(_QWORD *, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v8, v10);
}

uint64_t sub_1000065B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = type metadata accessor for BasicTimelineEntry(0);
  v8 = *(int *)(v7 + 20);
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  v11 = type metadata accessor for TimelineEntryRelevance(0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = sub_1000059C4(&qword_10000C0F0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 16))(v9, v10, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  *(_OWORD *)(a1 + *(int *)(v7 + 24)) = *(_OWORD *)(a2 + *(int *)(v7 + 24));
  v14 = *(int *)(a3 + 20);
  v15 = (_QWORD *)(a1 + v14);
  v16 = (_QWORD *)(a2 + v14);
  v17 = sub_1000059C4(&qword_10000C0E8);
  if (swift_getEnumCaseMultiPayload(v16, v17) == 1)
  {
    v18 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v15, v16, v18);
    v19 = 1;
  }
  else
  {
    *v15 = *v16;
    swift_retain();
    v19 = 0;
  }
  swift_storeEnumTagMultiPayload(v15, v17, v19);
  return a1;
}

uint64_t sub_100006720(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = type metadata accessor for BasicTimelineEntry(0);
  v8 = *(int *)(v7 + 20);
  v9 = (void *)(a1 + v8);
  v10 = (void *)(a2 + v8);
  v11 = type metadata accessor for TimelineEntryRelevance(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v15)
  {
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
LABEL_6:
    v16 = sub_1000059C4(&qword_10000C0F0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 24))(v9, v10, v11);
LABEL_7:
  v17 = *(int *)(v7 + 24);
  v18 = (_QWORD *)(a1 + v17);
  v19 = (_QWORD *)(a2 + v17);
  *v18 = *v19;
  v18[1] = v19[1];
  if (a1 != a2)
  {
    v20 = *(int *)(a3 + 20);
    v21 = (_QWORD *)(a1 + v20);
    v22 = (_QWORD *)(a2 + v20);
    sub_1000068FC(a1 + v20);
    v23 = sub_1000059C4(&qword_10000C0E8);
    if (swift_getEnumCaseMultiPayload(v22, v23) == 1)
    {
      v24 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v24 - 8) + 16))(v21, v22, v24);
      v25 = 1;
    }
    else
    {
      *v21 = *v22;
      swift_retain();
      v25 = 0;
    }
    swift_storeEnumTagMultiPayload(v21, v23, v25);
  }
  return a1;
}

uint64_t sub_1000068FC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000059C4(&qword_10000C0E8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000693C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = type metadata accessor for BasicTimelineEntry(0);
  v8 = *(int *)(v7 + 20);
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  v11 = type metadata accessor for TimelineEntryRelevance(0);
  v12 = *(_QWORD *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    v13 = sub_1000059C4(&qword_10000C0F0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  *(_OWORD *)(a1 + *(int *)(v7 + 24)) = *(_OWORD *)(a2 + *(int *)(v7 + 24));
  v14 = *(int *)(a3 + 20);
  v15 = (void *)(a1 + v14);
  v16 = (const void *)(a2 + v14);
  v17 = sub_1000059C4(&qword_10000C0E8);
  if (swift_getEnumCaseMultiPayload(v16, v17) == 1)
  {
    v18 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v15, v16, v18);
    swift_storeEnumTagMultiPayload(v15, v17, 1);
  }
  else
  {
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  return a1;
}

uint64_t sub_100006AB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(void *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = type metadata accessor for BasicTimelineEntry(0);
  v8 = *(int *)(v7 + 20);
  v9 = (void *)(a1 + v8);
  v10 = (void *)(a2 + v8);
  v11 = type metadata accessor for TimelineEntryRelevance(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (v14)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v12 + 32))(v9, v10, v11);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v15)
  {
    (*(void (**)(void *, uint64_t))(v12 + 8))(v9, v11);
LABEL_6:
    v16 = sub_1000059C4(&qword_10000C0F0);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v12 + 40))(v9, v10, v11);
LABEL_7:
  *(_OWORD *)(a1 + *(int *)(v7 + 24)) = *(_OWORD *)(a2 + *(int *)(v7 + 24));
  if (a1 != a2)
  {
    v17 = *(int *)(a3 + 20);
    v18 = (void *)(a1 + v17);
    v19 = (const void *)(a2 + v17);
    sub_1000068FC(a1 + v17);
    v20 = sub_1000059C4(&qword_10000C0E8);
    if (swift_getEnumCaseMultiPayload(v19, v20) == 1)
    {
      v21 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v18, v19, v21);
      swift_storeEnumTagMultiPayload(v18, v20, 1);
    }
    else
    {
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100006C80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100006C8C);
}

uint64_t sub_100006C8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100006CA0(a1, a2, a3, type metadata accessor for BasicTimelineEntry, &qword_10000C198);
}

uint64_t sub_100006CA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD), uint64_t *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t);
  uint64_t v13;

  v9 = a4(0);
  v10 = *(_QWORD *)(v9 - 8);
  if (*(_DWORD *)(v10 + 84) == (_DWORD)a2)
  {
    v11 = v9;
    v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    v13 = a1;
  }
  else
  {
    v11 = sub_1000059C4(a5);
    v13 = a1 + *(int *)(a3 + 20);
    v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48);
  }
  return v12(v13, a2, v11);
}

uint64_t sub_100006D18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100006D24);
}

uint64_t sub_100006D24(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return sub_100006D38(a1, a2, a3, a4, type metadata accessor for BasicTimelineEntry, &qword_10000C198);
}

uint64_t sub_100006D38(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t (*a5)(_QWORD), uint64_t *a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v15;

  v11 = a5(0);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a3)
  {
    v13 = v11;
    v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
    v15 = a1;
  }
  else
  {
    v13 = sub_1000059C4(a6);
    v15 = a1 + *(int *)(a4 + 20);
    v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56);
  }
  return v14(v15, a2, a2, v13);
}

void sub_100006DC0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[2];

  v2 = type metadata accessor for BasicTimelineEntry(319);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_100006E5C(319, (unint64_t *)&unk_10000C208, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Environment.Content);
    if (v5 <= 0x3F)
    {
      v6[1] = *(_QWORD *)(v4 - 8) + 64;
      swift_initStructMetadata(a1, 256, 2, v6, a1 + 16);
    }
  }
}

void sub_100006E5C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

uint64_t sub_100006EB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;

  v0 = sub_100005AE4(&qword_10000C0B8);
  v1 = sub_100005AE4(&qword_10000C0B0);
  v2 = sub_100005AE4(&qword_10000C0A8);
  v7 = sub_100005AE4(&qword_10000C0A0);
  v8 = sub_100005A98();
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v7 = v2;
  v8 = OpaqueTypeConformance2;
  v4 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
  v7 = v1;
  v8 = v4;
  v5 = swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.supportsInteraction(_:)>>, 1);
  v7 = v0;
  v8 = v5;
  return swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of WidgetConfiguration.supportedFamilies(_:)>>, 1);
}

uint64_t sub_100006F80()
{
  return sub_100006FAC(qword_10000C238, type metadata accessor for BasicTimelineEntry, (uint64_t)&unk_1000076DC);
}

uint64_t sub_100006FAC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100006FEC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000078EC, 1);
}

uint64_t sub_100006FFC(uint64_t a1, void (*a2)(char *))
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double *v24;
  uint64_t v25;
  uint64_t v27;
  void (*v28)(char *);

  v28 = a2;
  type metadata accessor for TimelineReloadPolicy(0);
  __chkstk_darwin();
  v3 = (char *)&v27 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000059C4(&qword_10000C0F0);
  __chkstk_darwin();
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000059C4(&qword_10000C250);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1000059C4(&qword_10000C258);
  v11 = type metadata accessor for BasicTimelineEntry(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 72);
  v14 = *(unsigned __int8 *)(v12 + 80);
  v15 = (v14 + 32) & ~v14;
  v16 = swift_allocObject(v10, v15 + v13, v14 | 7);
  *(_OWORD *)(v16 + 16) = xmmword_1000075D0;
  v17 = v16 + v15;
  v18 = TimelineProviderContext.displaySize.getter(v16);
  v20 = v19;
  v21 = type metadata accessor for TimelineEntryRelevance(0);
  v22 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v5, 1, 1, v21);
  Date.init()(v22);
  v23 = sub_1000071FC((uint64_t)v5, v17 + *(int *)(v11 + 20));
  v24 = (double *)(v17 + *(int *)(v11 + 24));
  *v24 = v18;
  *((_QWORD *)v24 + 1) = v20;
  static TimelineReloadPolicy.never.getter(v23);
  v25 = sub_100006FAC(qword_10000C238, type metadata accessor for BasicTimelineEntry, (uint64_t)&unk_1000076DC);
  Timeline.init(entries:policy:)(v16, v3, v11, v25);
  v28(v9);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_1000071FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000059C4(&qword_10000C0F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100007244(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for BasicTimelineEntry(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100007280(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000059C4(&qword_10000C0F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000072C8()
{
  return sub_100006FAC(&qword_10000C260, (uint64_t (*)(uint64_t))&type metadata accessor for BatteryArchivableView, (uint64_t)&protocol conformance descriptor for BatteryArchivableView);
}

uint64_t sub_1000072FC()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC24BatteriesWidgetExtensionP33_77B12E90D3332099F9FEF2674244760419ResourceBundleClass);
}
