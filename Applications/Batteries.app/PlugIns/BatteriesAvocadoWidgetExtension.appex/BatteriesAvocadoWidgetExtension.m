uint64_t sub_100003FC0()
{
  unint64_t v0;
  _QWORD v2[2];

  v2[0] = 0xD000000000000016;
  v2[1] = 0x8000000100007C30;
  v0 = sub_1000040B4();
  return static WidgetBundleBuilder.buildBlock<A>(_:)(v2, &type metadata for BatteriesAvocadoWidget, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100004050();
  static WidgetBundle.main()();
  return 0;
}

unint64_t sub_100004050()
{
  unint64_t result;

  result = qword_10000C0A0;
  if (!qword_10000C0A0)
  {
    result = swift_getWitnessTable(&unk_100007250, &type metadata for BatteriesAvocadoWidgetBundle);
    atomic_store(result, (unint64_t *)&qword_10000C0A0);
  }
  return result;
}

ValueMetadata *type metadata accessor for BatteriesAvocadoWidgetBundle()
{
  return &type metadata for BatteriesAvocadoWidgetBundle;
}

uint64_t sub_1000040A4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000075C4, 1);
}

unint64_t sub_1000040B4()
{
  unint64_t result;

  result = qword_10000C0A8;
  if (!qword_10000C0A8)
  {
    result = swift_getWitnessTable(&unk_1000072F8, &type metadata for BatteriesAvocadoWidget);
    atomic_store(result, (unint64_t *)&qword_10000C0A8);
  }
  return result;
}

uint64_t sub_1000040F8()
{
  _QWORD v1[2];

  v1[0] = &type metadata for BatteriesAvocadoWidget;
  v1[1] = sub_1000040B4();
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of static WidgetBundleBuilder.buildBlock<A>(_:)>>, 1);
}

__n128 initializeWithTake for BatteriesAvocadoWidget(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100004144(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100004164(uint64_t result, int a2, int a3)
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

  if (!qword_10000C0B0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_1000084B0);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10000C0B0);
  }
}

_QWORD *initializeBufferWithCopyOfBuffer for BatteriesAvocadoWidget(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for BatteriesAvocadoWidget(uint64_t a1)
{
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
}

_QWORD *assignWithCopy for BatteriesAvocadoWidget(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  *a1 = *a2;
  v3 = a1[1];
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease(v3);
  return a1;
}

_QWORD *assignWithTake for BatteriesAvocadoWidget(_QWORD *a1, _QWORD *a2)
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

uint64_t getEnumTagSinglePayload for BatteriesAvocadoWidget(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for BatteriesAvocadoWidget(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for BatteriesAvocadoWidget()
{
  return &type metadata for BatteriesAvocadoWidget;
}

uint64_t sub_100004318(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000076A0, 1);
}

uint64_t sub_100004328@<X0>(uint64_t a1@<X8>)
{
  double v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  double *v12;

  v2 = TimelineProviderContext.displaySize.getter();
  v4 = v3;
  v5 = (int *)type metadata accessor for BatteriesAvocadoEntry(0);
  v6 = TimelineProviderContext.family.getter();
  v7 = TimelineProviderContext.isPreview.getter(v6);
  v8 = a1 + v5[5];
  v9 = type metadata accessor for TimelineEntryRelevance(0);
  v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  result = Date.init()(v10);
  v12 = (double *)(a1 + v5[6]);
  *v12 = v2;
  *((_QWORD *)v12 + 1) = v4;
  *(_BYTE *)(a1 + v5[8]) = v7 & 1;
  return result;
}

uint64_t sub_1000043D0(uint64_t a1, void (*a2)(char *))
{
  int *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  double *v15;
  uint64_t v17;

  v3 = (int *)type metadata accessor for BatteriesAvocadoEntry(0);
  v4 = __chkstk_darwin();
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = TimelineProviderContext.displaySize.getter(v4);
  v9 = v8;
  v10 = TimelineProviderContext.family.getter();
  v11 = TimelineProviderContext.isPreview.getter(v10);
  v12 = &v6[v3[5]];
  v13 = type metadata accessor for TimelineEntryRelevance(0);
  v14 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
  Date.init()(v14);
  v15 = (double *)&v6[v3[6]];
  *v15 = v7;
  *((_QWORD *)v15 + 1) = v9;
  v6[v3[8]] = v11 & 1;
  a2(v6);
  return sub_1000067CC((uint64_t)v6);
}

uint64_t sub_1000044CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to TimelineProvider.relevances()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_100004538;
  return TimelineProvider.relevances()(a1, a2, a3);
}

uint64_t sub_100004538()
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

uint64_t sub_100004580(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to TimelineProvider.relevance()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_1000068BC;
  return TimelineProvider.relevance()(a1, a2, a3);
}

uint64_t sub_1000045EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for Date(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_100004624@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_100006808(v2 + *(int *)(a1 + 20), a2);
}

uint64_t sub_100004634@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, _QWORD, uint64_t);
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t OpaqueTypeConformance2;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  unint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v66;
  char *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;

  v81 = a3;
  v77 = type metadata accessor for WidgetBackgroundStyle(0);
  v75 = *(_QWORD *)(v77 - 8);
  __chkstk_darwin();
  v74 = (char *)&v66 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100004BE8(&qword_10000C0B8);
  v69 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin();
  v8 = (char *)&v66 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100004BE8(&qword_10000C0C0);
  v10 = *(_QWORD *)(v9 - 8);
  v70 = v9;
  v71 = v10;
  __chkstk_darwin();
  v12 = (char *)&v66 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100004BE8(&qword_10000C0C8);
  v14 = *(_QWORD *)(v13 - 8);
  v72 = v13;
  v73 = v14;
  __chkstk_darwin();
  v67 = (char *)&v66 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = sub_100004BE8(&qword_10000C0D0);
  v78 = *(_QWORD *)(v76 - 8);
  __chkstk_darwin();
  v68 = (char *)&v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_100004BE8(&qword_10000C0D8);
  v79 = *(_QWORD *)(v17 - 8);
  v80 = v17;
  __chkstk_darwin();
  v19 = (char *)&v66 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for BatteriesAvocadoWidgetEntryView(0);
  sub_100006114(&qword_10000C0E0, type metadata accessor for BatteriesAvocadoWidgetEntryView, (uint64_t)&unk_100007448);
  sub_100004C3C();
  swift_bridgeObjectRetain(a2);
  StaticConfiguration.init<A>(kind:provider:content:)(a1, a2);
  v20 = sub_100004BE8(&qword_10000C0F0);
  v21 = type metadata accessor for WidgetFamily(0);
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(_QWORD *)(v22 + 72);
  v24 = *(unsigned __int8 *)(v22 + 80);
  v25 = (v24 + 32) & ~v24;
  v26 = swift_allocObject(v20, v25 + 3 * v23, v24 | 7);
  *(_OWORD *)(v26 + 16) = xmmword_1000072A0;
  v27 = v26 + v25;
  v28 = *(void (**)(uint64_t, _QWORD, uint64_t))(v22 + 104);
  v28(v27, enum case for WidgetFamily.systemSmall(_:), v21);
  v28(v27 + v23, enum case for WidgetFamily.systemMedium(_:), v21);
  v29 = v27 + 2 * v23;
  v30 = v19;
  v28(v29, enum case for WidgetFamily.systemLarge(_:), v21);
  v31 = sub_10000687C(&qword_10000C0F8, &qword_10000C0B8, (uint64_t)&protocol conformance descriptor for StaticConfiguration<A>);
  WidgetConfiguration.supportedFamilies(_:)(v26, v6, v31);
  swift_bridgeObjectRelease(v26);
  (*(void (**)(char *, uint64_t))(v69 + 8))(v8, v6);
  v82 = v6;
  v83 = v31;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v82, &opaque type descriptor for <<opaque return type of WidgetConfiguration.supportedFamilies(_:)>>, 1);
  v33 = v67;
  v34 = v70;
  WidgetConfiguration.supportsInteraction(_:)(0, v70, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v71 + 8))(v12, v34);
  v35 = v74;
  v36 = v75;
  v37 = v77;
  (*(void (**)(char *, _QWORD, uint64_t))(v75 + 104))(v74, enum case for WidgetBackgroundStyle.blur(_:), v77);
  v82 = v34;
  v83 = OpaqueTypeConformance2;
  v38 = swift_getOpaqueTypeConformance2(&v82, &opaque type descriptor for <<opaque return type of WidgetConfiguration.supportsInteraction(_:)>>, 1);
  v39 = v68;
  v40 = v72;
  WidgetConfiguration.preferredBackgroundStyle(_:)(v35, v72, v38);
  (*(void (**)(char *, uint64_t))(v36 + 8))(v35, v37);
  (*(void (**)(char *, uint64_t))(v73 + 8))(v33, v40);
  v41 = LocalizedStringKey.init(stringLiteral:)(0xD000000000000025, 0x8000000100007C50);
  v43 = v42;
  LOBYTE(v37) = v44;
  v46 = v45;
  v82 = v40;
  v83 = v38;
  v47 = swift_getOpaqueTypeConformance2(&v82, &opaque type descriptor for <<opaque return type of WidgetConfiguration.preferredBackgroundStyle(_:)>>, 1);
  v48 = v37 & 1;
  v49 = v76;
  WidgetConfiguration.configurationDisplayName(_:)(v41, v43, v48, v46, v76, v47);
  v50 = v46;
  v51 = v49;
  swift_bridgeObjectRelease(v50);
  swift_bridgeObjectRelease(v43);
  (*(void (**)(char *, uint64_t))(v78 + 8))(v39, v49);
  v52 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v53 = objc_msgSend(v52, "userInterfaceIdiom");

  if (v53 == (id)1)
  {
    v54 = 0xD000000000000029;
    v55 = "BATTERIES_AVOCADO_WIDGET_DESCRIPTION_IPAD";
  }
  else
  {
    v54 = 0xD00000000000002BLL;
    v55 = "BATTERIES_AVOCADO_WIDGET_DESCRIPTION_IPHONE";
  }
  v56 = LocalizedStringKey.init(stringLiteral:)(v54, (unint64_t)(v55 - 32) | 0x8000000000000000);
  v58 = v57;
  v60 = v59;
  v62 = v61;
  v82 = v51;
  v83 = v47;
  v63 = swift_getOpaqueTypeConformance2(&v82, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v64 = v80;
  WidgetConfiguration.description(_:)(v56, v58, v60 & 1, v62, v80, v63);
  swift_bridgeObjectRelease(v62);
  swift_bridgeObjectRelease(v58);
  return (*(uint64_t (**)(char *, uint64_t))(v79 + 8))(v30, v64);
}

uint64_t sub_100004BB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100004CC4(a1, a2);
}

void sub_100004BC0(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000016;
  a1[1] = 0x80000001000072C0;
}

uint64_t sub_100004BE0@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_100004634(*v1, v1[1], a1);
}

uint64_t sub_100004BE8(uint64_t *a1)
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

uint64_t type metadata accessor for BatteriesAvocadoWidgetEntryView(uint64_t a1)
{
  return sub_100004D1C(a1, qword_10000C208, (uint64_t)&nominal type descriptor for BatteriesAvocadoWidgetEntryView);
}

unint64_t sub_100004C3C()
{
  unint64_t result;

  result = qword_10000C0E8;
  if (!qword_10000C0E8)
  {
    result = swift_getWitnessTable(&unk_1000073F0, &type metadata for Provider);
    atomic_store(result, (unint64_t *)&qword_10000C0E8);
  }
  return result;
}

uint64_t sub_100004C80(uint64_t *a1)
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

uint64_t sub_100004CC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for BatteriesAvocadoEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t type metadata accessor for BatteriesAvocadoEntry(uint64_t a1)
{
  return sub_100004D1C(a1, (uint64_t *)&unk_10000C160, (uint64_t)&nominal type descriptor for BatteriesAvocadoEntry);
}

uint64_t sub_100004D1C(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

_QWORD *sub_100004D50(_QWORD *a1, _QWORD *a2, int *a3)
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
  char *v16;
  char *v17;
  uint64_t v18;

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
    v7 = type metadata accessor for Date(0);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for TimelineEntryRelevance(0);
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      v13 = sub_100004BE8(&qword_10000C100);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v15 = a3[7];
    *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
    v16 = (char *)a1 + v15;
    v17 = (char *)a2 + v15;
    v18 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
    *((_BYTE *)a1 + a3[8]) = *((_BYTE *)a2 + a3[8]);
  }
  return a1;
}

uint64_t sub_100004EA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = type metadata accessor for TimelineEntryRelevance(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  v8 = a1 + *(int *)(a2 + 28);
  v9 = type metadata accessor for WidgetFamily(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
}

uint64_t sub_100004F4C(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = type metadata accessor for TimelineEntryRelevance(0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = sub_100004BE8(&qword_10000C100);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_100005070(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
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
    v15 = sub_100004BE8(&qword_10000C100);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  v16 = a3[6];
  v17 = (_QWORD *)(a1 + v16);
  v18 = (_QWORD *)(a2 + v16);
  *v17 = *v18;
  v17[1] = v18[1];
  v19 = a3[7];
  v20 = a1 + v19;
  v21 = a2 + v19;
  v22 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 24))(v20, v21, v22);
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_1000051F4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = type metadata accessor for TimelineEntryRelevance(0);
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = sub_100004BE8(&qword_10000C100);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v13 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_100005318(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v6 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
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
    v15 = sub_100004BE8(&qword_10000C100);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
LABEL_7:
  v16 = a3[7];
  *(_OWORD *)(a1 + a3[6]) = *(_OWORD *)(a2 + a3[6]);
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  *(_BYTE *)(a1 + a3[8]) = *(_BYTE *)(a2 + a3[8]);
  return a1;
}

uint64_t sub_100005488(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100005494);
}

uint64_t sub_100005494(uint64_t a1, uint64_t a2, int *a3)
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
  unsigned int v16;

  v6 = type metadata accessor for Date(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = sub_100004BE8(&qword_10000C100);
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
  v14 = type metadata accessor for WidgetFamily(0);
  v12 = *(_QWORD *)(v14 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v14;
    v13 = a3[7];
    goto LABEL_7;
  }
  v16 = *(unsigned __int8 *)(a1 + a3[8]);
  if (v16 >= 2)
    return ((v16 + 2147483646) & 0x7FFFFFFF) + 1;
  else
    return 0;
}

uint64_t sub_100005574(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100005580);
}

uint64_t sub_100005580(uint64_t a1, uint64_t a2, int a3, int *a4)
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

  v8 = type metadata accessor for Date(0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  v13 = sub_100004BE8(&qword_10000C100);
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
  result = type metadata accessor for WidgetFamily(0);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v15 = a4[7];
    goto LABEL_7;
  }
  *(_BYTE *)(a1 + a4[8]) = a2 + 1;
  return result;
}

void sub_10000564C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v8[5];

  v2 = type metadata accessor for Date(319);
  if (v3 <= 0x3F)
  {
    v8[0] = *(_QWORD *)(v2 - 8) + 64;
    sub_1000056FC(319);
    if (v5 <= 0x3F)
    {
      v8[1] = *(_QWORD *)(v4 - 8) + 64;
      v8[2] = &unk_100007358;
      v6 = type metadata accessor for WidgetFamily(319);
      if (v7 <= 0x3F)
      {
        v8[3] = *(_QWORD *)(v6 - 8) + 64;
        v8[4] = &unk_100007370;
        swift_initStructMetadata(a1, 256, 5, v8, a1 + 16);
      }
    }
  }
}

void sub_1000056FC(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10000C170)
  {
    v2 = type metadata accessor for TimelineEntryRelevance(255);
    v3 = type metadata accessor for Optional(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10000C170);
  }
}

ValueMetadata *type metadata accessor for Provider()
{
  return &type metadata for Provider;
}

_QWORD *sub_100005760(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  int v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v4 = type metadata accessor for BatteriesAvocadoEntry(0);
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = (int *)v4;
    v7 = type metadata accessor for Date(0);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = v6[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for TimelineEntryRelevance(0);
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      v13 = sub_100004BE8(&qword_10000C100);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    *(_OWORD *)((char *)a1 + v6[6]) = *(_OWORD *)((char *)a2 + v6[6]);
    v15 = v6[7];
    v16 = (char *)a1 + v15;
    v17 = (char *)a2 + v15;
    v18 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
    *((_BYTE *)a1 + v6[8]) = *((_BYTE *)a2 + v6[8]);
  }
  return a1;
}

uint64_t sub_1000058BC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  v3 = type metadata accessor for BatteriesAvocadoEntry(0);
  v4 = a1 + *(int *)(v3 + 20);
  v5 = type metadata accessor for TimelineEntryRelevance(0);
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v7 = a1 + *(int *)(v3 + 28);
  v8 = type metadata accessor for WidgetFamily(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
}

uint64_t sub_100005970(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  v5 = (int *)type metadata accessor for BatteriesAvocadoEntry(0);
  v6 = v5[5];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = type metadata accessor for TimelineEntryRelevance(0);
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = sub_100004BE8(&qword_10000C100);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(_OWORD *)(a1 + v5[6]) = *(_OWORD *)(a2 + v5[6]);
  v12 = v5[7];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  *(_BYTE *)(a1 + v5[8]) = *(_BYTE *)(a2 + v5[8]);
  return a1;
}

uint64_t sub_100005AA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v4 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  v5 = (int *)type metadata accessor for BatteriesAvocadoEntry(0);
  v6 = v5[5];
  v7 = (void *)(a1 + v6);
  v8 = (void *)(a2 + v6);
  v9 = type metadata accessor for TimelineEntryRelevance(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 24))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = sub_100004BE8(&qword_10000C100);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  v15 = v5[6];
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  *v16 = *v17;
  v16[1] = v17[1];
  v18 = v5[7];
  v19 = a1 + v18;
  v20 = a2 + v18;
  v21 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 24))(v19, v20, v21);
  *(_BYTE *)(a1 + v5[8]) = *(_BYTE *)(a2 + v5[8]);
  return a1;
}

uint64_t sub_100005C2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  void *v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v4 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  v5 = (int *)type metadata accessor for BatteriesAvocadoEntry(0);
  v6 = v5[5];
  v7 = (void *)(a1 + v6);
  v8 = (const void *)(a2 + v6);
  v9 = type metadata accessor for TimelineEntryRelevance(0);
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = sub_100004BE8(&qword_10000C100);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  *(_OWORD *)(a1 + v5[6]) = *(_OWORD *)(a2 + v5[6]);
  v12 = v5[7];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  *(_BYTE *)(a1 + v5[8]) = *(_BYTE *)(a2 + v5[8]);
  return a1;
}

uint64_t sub_100005D5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(void *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  v5 = (int *)type metadata accessor for BatteriesAvocadoEntry(0);
  v6 = v5[5];
  v7 = (void *)(a1 + v6);
  v8 = (void *)(a2 + v6);
  v9 = type metadata accessor for TimelineEntryRelevance(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (!v12)
  {
    if (!v13)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 40))(v7, v8, v9);
      goto LABEL_7;
    }
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
    goto LABEL_6;
  }
  if (v13)
  {
LABEL_6:
    v14 = sub_100004BE8(&qword_10000C100);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v7, v8, v9);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
LABEL_7:
  *(_OWORD *)(a1 + v5[6]) = *(_OWORD *)(a2 + v5[6]);
  v15 = v5[7];
  v16 = a1 + v15;
  v17 = a2 + v15;
  v18 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 40))(v16, v17, v18);
  *(_BYTE *)(a1 + v5[8]) = *(_BYTE *)(a2 + v5[8]);
  return a1;
}

uint64_t sub_100005ED8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100005EE4);
}

uint64_t sub_100005EE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for BatteriesAvocadoEntry(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_100005F20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100005F2C);
}

uint64_t sub_100005F2C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for BatteriesAvocadoEntry(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_100005F6C(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  uint64_t v4;

  result = type metadata accessor for BatteriesAvocadoEntry(319);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 1, &v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_100005FD4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t OpaqueTypeConformance2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v0 = sub_100004C80(&qword_10000C0D8);
  v1 = sub_100004C80(&qword_10000C0D0);
  v2 = sub_100004C80(&qword_10000C0C8);
  v3 = sub_100004C80(&qword_10000C0C0);
  v9 = sub_100004C80(&qword_10000C0B8);
  v10 = sub_10000687C(&qword_10000C0F8, &qword_10000C0B8, (uint64_t)&protocol conformance descriptor for StaticConfiguration<A>);
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v9, &opaque type descriptor for <<opaque return type of WidgetConfiguration.supportedFamilies(_:)>>, 1);
  v9 = v3;
  v10 = OpaqueTypeConformance2;
  v5 = swift_getOpaqueTypeConformance2(&v9, &opaque type descriptor for <<opaque return type of WidgetConfiguration.supportsInteraction(_:)>>, 1);
  v9 = v2;
  v10 = v5;
  v6 = swift_getOpaqueTypeConformance2(&v9, &opaque type descriptor for <<opaque return type of WidgetConfiguration.preferredBackgroundStyle(_:)>>, 1);
  v9 = v1;
  v10 = v6;
  v7 = swift_getOpaqueTypeConformance2(&v9, &opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, 1);
  v9 = v0;
  v10 = v7;
  return swift_getOpaqueTypeConformance2(&v9, &opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, 1);
}

uint64_t sub_1000060E8()
{
  return sub_100006114(qword_10000C240, type metadata accessor for BatteriesAvocadoEntry, (uint64_t)&unk_1000073C0);
}

uint64_t sub_100006114(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100006154(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000076C8, 1);
}

uint64_t sub_100006164@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
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
  double *v16;
  double v17;
  double v18;
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
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v34 = a2;
  v3 = type metadata accessor for ContainerBackgroundPlacement(0);
  v32 = *(_QWORD *)(v3 - 8);
  v33 = v3;
  __chkstk_darwin();
  v5 = (char *)&v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004BE8(&qword_10000C260);
  __chkstk_darwin();
  v7 = (char *)&v31 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for BatteryAvocadoArchivableView(0);
  v31 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin();
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100004BE8(&qword_10000C268);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin();
  v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for BatteriesAvocadoEntry(0);
  v16 = (double *)(a1 + *(int *)(v15 + 24));
  v17 = *v16;
  v18 = v16[1];
  v19 = a1 + *(int *)(v15 + 28);
  v20 = type metadata accessor for WidgetFamily(0);
  v21 = *(_QWORD *)(v20 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v7, v19, v20);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v7, 0, 1, v20);
  v22 = BatteryAvocadoArchivableView.init(withSize:andFamily:)(v7, v17, v18);
  v23 = static ContainerBackgroundPlacement.widget.getter(v22);
  v24 = static Alignment.center.getter(v23);
  v26 = v25;
  v27 = type metadata accessor for Utilities.Background(0);
  v28 = sub_100006114(&qword_10000C270, (uint64_t (*)(uint64_t))&type metadata accessor for BatteryAvocadoArchivableView, (uint64_t)&protocol conformance descriptor for BatteryAvocadoArchivableView);
  v29 = sub_100006114(&qword_10000C278, type metadata accessor for Utilities.Background, (uint64_t)&unk_100007508);
  View.containerBackground<A>(for:alignment:content:)(v5, v24, v26, sub_1000063DC, 0, v8, v27, v28, v29);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v5, v33);
  (*(void (**)(char *, uint64_t))(v31 + 8))(v10, v8);
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 16))(v34, v14, v11);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_1000063DC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;

  *a1 = swift_getKeyPath(&unk_100007498);
  v2 = sub_100004BE8(&qword_10000C280);
  return swift_storeEnumTagMultiPayload(a1, v2, 0);
}

uint64_t sub_100006428()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100006440@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  *a2 = static Alignment.center.getter(a1);
  a2[1] = v4;
  v5 = sub_100004BE8(&qword_10000C258);
  return sub_100006164(v2, (uint64_t)a2 + *(int *)(v5 + 44));
}

uint64_t sub_100006480()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_1000064A0(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for ColorScheme(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.colorScheme.setter(v3);
}

uint64_t sub_100006520(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  double *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *);

  v35 = a3;
  v36 = a2;
  type metadata accessor for TimelineReloadPolicy(0);
  __chkstk_darwin();
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100004BE8(&qword_10000C100);
  __chkstk_darwin();
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for WidgetFamily(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100004BE8(&qword_10000C288);
  v33 = *(_QWORD *)(v11 - 8);
  v34 = v11;
  __chkstk_darwin();
  v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_100004BE8(&qword_10000C290);
  v15 = (int *)type metadata accessor for BatteriesAvocadoEntry(0);
  v16 = *((_QWORD *)v15 - 1);
  v17 = *(_QWORD *)(v16 + 72);
  v18 = *(unsigned __int8 *)(v16 + 80);
  v19 = (v18 + 32) & ~v18;
  v20 = swift_allocObject(v14, v19 + v17, v18 | 7);
  *(_OWORD *)(v20 + 16) = xmmword_1000072B0;
  v21 = v20 + v19;
  v22 = TimelineProviderContext.displaySize.getter(v20);
  v24 = v23;
  v25 = TimelineProviderContext.family.getter();
  v26 = TimelineProviderContext.isPreview.getter(v25);
  v27 = type metadata accessor for TimelineEntryRelevance(0);
  v28 = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v6, 1, 1, v27);
  Date.init()(v28);
  sub_100006784((uint64_t)v6, v21 + v15[5]);
  v29 = (double *)(v21 + v15[6]);
  *v29 = v22;
  *((_QWORD *)v29 + 1) = v24;
  v30 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v8 + 32))(v21 + v15[7], v10, v7);
  *(_BYTE *)(v21 + v15[8]) = v26 & 1;
  static TimelineReloadPolicy.atEnd.getter(v30);
  v31 = sub_100006114(qword_10000C240, type metadata accessor for BatteriesAvocadoEntry, (uint64_t)&unk_1000073C0);
  Timeline.init(entries:policy:)(v20, v4, v15, v31);
  v36(v13);
  return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v13, v34);
}

uint64_t sub_100006784(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004BE8(&qword_10000C100);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000067CC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for BatteriesAvocadoEntry(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006808(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004BE8(&qword_10000C100);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006850()
{
  return sub_10000687C(&qword_10000C298, &qword_10000C2A0, (uint64_t)&protocol conformance descriptor for ZStack<A>);
}

uint64_t sub_10000687C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100004C80(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for Utilities()
{
  return &type metadata for Utilities;
}

uint64_t *sub_1000068D4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = sub_100004BE8(&qword_10000C280);
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v6 = v4;
    if (swift_getEnumCaseMultiPayload(a2, v4) == 1)
    {
      v7 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      *a1 = *a2;
      swift_retain();
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }
  return a1;
}

uint64_t sub_10000699C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100004BE8(&qword_10000C280);
  if (swift_getEnumCaseMultiPayload(a1, v2) != 1)
    return swift_release(*a1);
  v3 = type metadata accessor for ColorScheme(0);
  return (*(uint64_t (**)(_QWORD *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
}

_QWORD *sub_100006A00(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = sub_100004BE8(&qword_10000C280);
  if (swift_getEnumCaseMultiPayload(a2, v4) == 1)
  {
    v5 = type metadata accessor for ColorScheme(0);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
    v6 = a1;
    v7 = v4;
    v8 = 1;
  }
  else
  {
    *a1 = *a2;
    swift_retain();
    v6 = a1;
    v7 = v4;
    v8 = 0;
  }
  swift_storeEnumTagMultiPayload(v6, v7, v8);
  return a1;
}

_QWORD *sub_100006A9C(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  if (a1 != a2)
  {
    sub_100006B48((uint64_t)a1);
    v4 = sub_100004BE8(&qword_10000C280);
    if (swift_getEnumCaseMultiPayload(a2, v4) == 1)
    {
      v5 = type metadata accessor for ColorScheme(0);
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
      v6 = a1;
      v7 = v4;
      v8 = 1;
    }
    else
    {
      *a1 = *a2;
      swift_retain();
      v6 = a1;
      v7 = v4;
      v8 = 0;
    }
    swift_storeEnumTagMultiPayload(v6, v7, v8);
  }
  return a1;
}

uint64_t sub_100006B48(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100004BE8(&qword_10000C280);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void *sub_100006B88(void *a1, const void *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_100004BE8(&qword_10000C280);
  if (swift_getEnumCaseMultiPayload(a2, v4) == 1)
  {
    v5 = type metadata accessor for ColorScheme(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, a2, v5);
    swift_storeEnumTagMultiPayload(a1, v4, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  }
  return a1;
}

void *sub_100006C20(void *a1, const void *a2)
{
  uint64_t v4;
  uint64_t v5;

  if (a1 != a2)
  {
    sub_100006B48((uint64_t)a1);
    v4 = sub_100004BE8(&qword_10000C280);
    if (swift_getEnumCaseMultiPayload(a2, v4) == 1)
    {
      v5 = type metadata accessor for ColorScheme(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, a2, v5);
      swift_storeEnumTagMultiPayload(a1, v4, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100006CC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100006CD4);
}

uint64_t sub_100006CD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004BE8(&qword_10000C2A8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_100006D14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100006D20);
}

uint64_t sub_100006D20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004BE8(&qword_10000C2A8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t type metadata accessor for Utilities.Background(uint64_t a1)
{
  uint64_t result;

  result = qword_10000C308;
  if (!qword_10000C308)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for Utilities.Background);
  return result;
}

void sub_100006DA0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  sub_100006E08(319);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(v2 - 8) + 64;
    swift_initStructMetadata(a1, 256, 1, &v4, a1 + 16);
  }
}

void sub_100006E08(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_10000C318)
  {
    v2 = type metadata accessor for ColorScheme(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_10000C318);
  }
}

uint64_t sub_100006E5C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100007734, 1);
}

uint64_t sub_100006E6C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static Color.clear.getter();
  *a1 = result;
  return result;
}

void *sub_100006E90()
{
  return &protocol witness table for Color;
}

uint64_t sub_100006E9C()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC31BatteriesAvocadoWidgetExtensionP33_E91F09FF7AF9F1BA17D900BF71201BDE19ResourceBundleClass);
}
