BOOL sub_100004120(char a1, char a2)
{
  return a1 == a2;
}

void sub_100004130(uint64_t a1, unsigned __int8 a2)
{
  Hasher._combine(_:)(a2);
  sub_10000EACC();
}

Swift::Int sub_100004150(unsigned __int8 a1)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(a1);
  return Hasher._finalize()();
}

BOOL sub_100004194(char *a1, char *a2)
{
  return sub_100004120(*a1, *a2);
}

Swift::Int sub_1000041A0()
{
  unsigned __int8 *v0;

  return sub_100004150(*v0);
}

void sub_1000041A8(uint64_t a1)
{
  unsigned __int8 *v1;

  sub_100004130(a1, *v1);
}

Swift::Int sub_1000041B0(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_1000041F0(uint64_t a1, unsigned __int8 a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  int v9;
  uint64_t v10;

  v3 = a2;
  v4 = type metadata accessor for WidgetFamily(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = 0;
  if (!v3)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
    v9 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
    if (v9 == enum case for WidgetFamily.systemSmall(_:))
    {
      return 0x402C000000000000;
    }
    else if (v9 == enum case for WidgetFamily.systemExtraLarge(_:))
    {
      return 0x403E000000000000;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      return 0x4034000000000000;
    }
  }
  return result;
}

uint64_t sub_1000042E0(uint64_t a1, unsigned __int8 a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int v9;
  uint64_t v10;

  v3 = a2;
  v4 = type metadata accessor for WidgetFamily(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v3)
    return 0x4028000000000000;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v9 = (*(uint64_t (**)(char *, uint64_t))(v5 + 88))(v7, v4);
  if (v9 == enum case for WidgetFamily.systemSmall(_:))
    return 0x402C000000000000;
  if (v9 == enum case for WidgetFamily.systemExtraLarge(_:))
    return 0x403E000000000000;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return 0x4034000000000000;
}

uint64_t sub_1000043CC@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v6;
  int *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;

  v6 = a5;
  v28 = a1;
  v29 = a5;
  v30 = a6;
  v11 = (int *)sub_10000B8A0(&qword_100038CC8);
  v13 = __chkstk_darwin(v11, v12);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = &v15[*(int *)(v13 + 36)];
  v17 = type metadata accessor for WidgetFamily(0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 16))(v16, a1, v17);
  v15[v11[10]] = a2;
  *(_QWORD *)&v15[v11[11]] = a3;
  *(_QWORD *)&v15[v11[12]] = a4;
  v20 = static HorizontalAlignment.leading.getter(v19);
  sub_10000B64C(v6, (uint64_t)&v31);
  v21 = v31;
  v22 = v32;
  v23 = v33;
  v24 = v34;
  LOBYTE(v6) = v35;
  v25 = v36;
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v28, v17);
  *(_QWORD *)v15 = v20;
  *((_QWORD *)v15 + 1) = 0;
  v15[16] = 1;
  *((_QWORD *)v15 + 3) = v21;
  v15[32] = v22;
  *((_QWORD *)v15 + 5) = v23;
  *((_QWORD *)v15 + 6) = v24;
  v15[56] = v6;
  *((_QWORD *)v15 + 8) = v25;
  sub_10000D180((uint64_t)v15, v30, &qword_100038CC8);
  return swift_release(v29);
}

uint64_t sub_10000451C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t result;
  int v8;
  uint64_t v9;

  v3 = type metadata accessor for WidgetFamily(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = 0;
  if (!*(_BYTE *)(v1 + *(int *)(a1 + 40)))
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v1 + *(int *)(a1 + 36), v3);
    v8 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v6, v3);
    if (v8 == enum case for WidgetFamily.systemSmall(_:))
    {
      return 0x402C000000000000;
    }
    else if (v8 == enum case for WidgetFamily.systemExtraLarge(_:))
    {
      return 0x403E000000000000;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      return 0x4034000000000000;
    }
  }
  return result;
}

uint64_t sub_100004610(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int v8;
  uint64_t v9;

  v3 = type metadata accessor for WidgetFamily(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_BYTE *)(v1 + *(int *)(a1 + 40)))
    return 0x4028000000000000;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v1 + *(int *)(a1 + 36), v3);
  v8 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v6, v3);
  if (v8 == enum case for WidgetFamily.systemSmall(_:))
    return 0x402C000000000000;
  if (v8 == enum case for WidgetFamily.systemExtraLarge(_:))
    return 0x403E000000000000;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return 0x4034000000000000;
}

uint64_t sub_100004704@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t WitnessTable;
  uint64_t v31;
  unsigned int v32;
  unsigned int v33;
  uint64_t v34;
  int v35;
  int v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  void (*v43)(char *, char *, uint64_t);
  char *v44;
  void (*v45)(char *, uint64_t);
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  _BYTE v55[16];
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  void *v62;

  v54 = a2;
  v5 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v6 = type metadata accessor for VStack(0, v5, v4);
  v48 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6, v7);
  v9 = (char *)&v47 - v8;
  v10 = type metadata accessor for ModifiedContent(0, v6, &type metadata for _PaddingLayout);
  v50 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10, v11);
  v13 = (char *)&v47 - v12;
  v14 = type metadata accessor for ModifiedContent(0, v10, &type metadata for _PaddingLayout);
  v53 = *(_QWORD *)(v14 - 8);
  v16 = __chkstk_darwin(v14, v15);
  v49 = (char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16, v18);
  v51 = (char *)&v47 - v19;
  v20 = *(_QWORD *)(v2 + *(int *)(a1 + 44));
  v56 = v5;
  v57 = v4;
  v58 = v2;
  v21 = VStack.init(alignment:spacing:content:)(v20, 0, 1, sub_10000E528, v55, v5, v4);
  v22 = static Edge.Set.leading.getter(v21);
  v23 = static Edge.Set.trailing.getter();
  v24 = Edge.Set.init(rawValue:)(0);
  v25 = Edge.Set.init(rawValue:)(v24);
  if (Edge.Set.init(rawValue:)(v25 & v22) != v22)
    v24 = Edge.Set.init(rawValue:)(v24 | v22);
  v26 = Edge.Set.init(rawValue:)(v24);
  if (Edge.Set.init(rawValue:)(v26 & v23) != v23)
    v24 = Edge.Set.init(rawValue:)(v24 | v23);
  v52 = v2;
  v27 = sub_10000451C(a1);
  v29 = v28 & 1;
  WitnessTable = swift_getWitnessTable(&protocol conformance descriptor for VStack<A>, v6);
  View.padding(_:_:)(v24, v27, v29, v6, WitnessTable);
  v31 = (*(uint64_t (**)(char *, uint64_t))(v48 + 8))(v9, v6);
  v32 = static Edge.Set.bottom.getter(v31);
  v33 = static Edge.Set.top.getter();
  v34 = Edge.Set.init(rawValue:)(0);
  v35 = Edge.Set.init(rawValue:)(v34);
  if (Edge.Set.init(rawValue:)(v35 & v32) != v32)
    v34 = Edge.Set.init(rawValue:)(v34 | v32);
  v36 = Edge.Set.init(rawValue:)(v34);
  if (Edge.Set.init(rawValue:)(v36 & v33) != v33)
    v34 = Edge.Set.init(rawValue:)(v34 | v33);
  v37 = sub_100004610(a1);
  v39 = v38 & 1;
  v61 = WitnessTable;
  v62 = &protocol witness table for _PaddingLayout;
  v40 = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v10);
  v41 = v49;
  View.padding(_:_:)(v34, v37, v39, v10, v40);
  (*(void (**)(char *, uint64_t))(v50 + 8))(v13, v10);
  v59 = v40;
  v60 = &protocol witness table for _PaddingLayout;
  swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v14);
  v42 = v53;
  v43 = *(void (**)(char *, char *, uint64_t))(v53 + 16);
  v44 = v51;
  v43(v51, v41, v14);
  v45 = *(void (**)(char *, uint64_t))(v42 + 8);
  v45(v41, v14);
  v43(v54, v44, v14);
  return ((uint64_t (*)(char *, uint64_t))v45)(v44, v14);
}

uint64_t sub_100004A70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void (*v8)(char *);
  uint64_t v10;

  v5 = *(_QWORD *)(a2 - 8);
  __chkstk_darwin(a1, a1);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(void (**)(char *))(v5 + 16);
  v8(v7);
  ((void (*)(uint64_t, char *, uint64_t))v8)(a3, v7, a2);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, a2);
}

void (*sub_100004B10())(uint64_t a1)
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v1 = type metadata accessor for PhotosReliveWidgetPlaceholderContent(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  __chkstk_darwin(v1, v4);
  sub_10000D1AC(v0, (uint64_t)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for PhotosReliveWidgetPlaceholderContent);
  v5 = *(unsigned __int8 *)(v2 + 80);
  v6 = (v5 + 16) & ~v5;
  v7 = swift_allocObject(&unk_100035A08, v6 + v3, v5 | 7);
  sub_10000D140((uint64_t)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, type metadata accessor for PhotosReliveWidgetPlaceholderContent);
  return sub_10000D1DC;
}

void (*sub_100004BC8())(uint64_t a1)
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v1 = type metadata accessor for PhotosReliveWidgetMemoryContent(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  __chkstk_darwin(v1, v4);
  sub_10000D1AC(v0, (uint64_t)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for PhotosReliveWidgetMemoryContent);
  v5 = *(unsigned __int8 *)(v2 + 80);
  v6 = (v5 + 16) & ~v5;
  v7 = swift_allocObject(&unk_100035918, v6 + v3, v5 | 7);
  sub_10000D140((uint64_t)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, type metadata accessor for PhotosReliveWidgetMemoryContent);
  return sub_10000C450;
}

void (*sub_100004C80(uint64_t a1))(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  swift_retain(a1);
  return sub_10000D170;
}

void (*sub_100004CB0(uint64_t a1))(uint64_t a1)
{
  swift_retain(a1);
  return sub_10000D178;
}

void sub_100004CE0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v2)(_QWORD);
  uint64_t (*v3)(_QWORD);
  void (*v4)(uint64_t, uint64_t);
  void (*v5)(uint64_t, uint64_t);
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
  uint64_t v19;

  sub_10000F0E4();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  sub_10000B8A0(&qword_100038938);
  sub_10000E858();
  __chkstk_darwin(v10, v11);
  sub_10000E968();
  v12 = sub_10000B8A0(&qword_100038940);
  sub_10000E858();
  __chkstk_darwin(v13, v14);
  sub_10000E8F0();
  *v1 = static Alignment.center.getter(v15);
  v1[1] = v16;
  sub_10000B8A0(&qword_100038948);
  v5(v7, v9);
  v17 = *(_QWORD *)(v7 + *(int *)(v3(0) + 20))
      + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_destination;
  v18 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v0, v17, v18);
  sub_10000BA28(v0, 0, 1, v18);
  sub_10000E4AC(&qword_100038950, &qword_100038940);
  View.widgetURL(_:)(v0, v12, v19);
  sub_10000E988(v0);
  sub_10000E500((uint64_t)v1, &qword_100038940);
  sub_10000E8C0();
}

void sub_100004E24(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[20];
  uint64_t v31[20];
  uint64_t __dst[21];

  v29 = a3;
  v5 = sub_10000B8A0(&qword_100038938);
  __chkstk_darwin(v5, v6);
  v8 = (char *)&v30[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_10000B8A0(&qword_100038958);
  v11 = __chkstk_darwin(v9, v10);
  v13 = (char *)&v30[-1] - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11, v14);
  v16 = (char *)&v30[-1] - v15;
  v17 = sub_10000B8A0(&qword_100038C78);
  v19 = __chkstk_darwin(v17, v18);
  v21 = (_QWORD *)((char *)&v30[-1] - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v21 = static Alignment.center.getter(v19);
  v21[1] = v22;
  v23 = (uint64_t)v21 + *(int *)(sub_10000B8A0(&qword_100038C80) + 44);
  swift_retain(a2);
  sub_100005748(a2, (uint64_t)v16);
  swift_release(a2);
  v24 = swift_retain(a2);
  sub_10000581C(v30, v24, a1);
  swift_release(a2);
  sub_10000E4E0((uint64_t)v16, (uint64_t)v13, &qword_100038958);
  sub_10000E4E0((uint64_t)v13, v23, &qword_100038958);
  v25 = (void *)(v23 + *(int *)(sub_10000B8A0(&qword_100038C88) + 48));
  memcpy(v31, v30, sizeof(v31));
  memcpy(v25, v30, 0xA0uLL);
  sub_10000C50C(v31);
  sub_10000E500((uint64_t)v16, &qword_100038958);
  memcpy(__dst, v30, 0xA0uLL);
  sub_10000C570(__dst);
  sub_10000E500((uint64_t)v13, &qword_100038958);
  v26 = a2 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_destination;
  v27 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v8, v26, v27);
  sub_10000BA28((uint64_t)v8, 0, 1, v27);
  sub_10000E4AC(&qword_100038C90, &qword_100038C78);
  View.widgetURL(_:)(v8, v17, v28);
  sub_10000E500((uint64_t)v8, &qword_100038938);
  sub_10000E500((uint64_t)v21, &qword_100038C78);
}

void sub_1000050C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = sub_10000B8A0(&qword_100038938);
  __chkstk_darwin(v4, v5);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_10000B8A0(&qword_100038C98);
  v10 = __chkstk_darwin(v8, v9);
  v12 = (uint64_t *)((char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v12 = static Alignment.center.getter(v10);
  v12[1] = v13;
  v14 = sub_10000B8A0(&qword_100038CA0);
  sub_10000543C(a2, a1, (uint64_t)v12 + *(int *)(v14 + 44));
  v15 = a2 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_destination;
  v16 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v7, v15, v16);
  sub_10000BA28((uint64_t)v7, 0, 1, v16);
  sub_10000E4AC(&qword_100038CA8, &qword_100038C98);
  View.widgetURL(_:)(v7, v8, v17);
  sub_10000E500((uint64_t)v7, &qword_100038938);
  sub_10000E500((uint64_t)v12, &qword_100038C98);
}

void sub_100005238()
{
  sub_100005280();
}

void sub_10000525C()
{
  sub_100005280();
}

void sub_100005280()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  uint64_t v5;
  uint64_t (*v6)(_QWORD);
  uint64_t (*v7)(_QWORD);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  _QWORD *v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[20];
  uint64_t v39[20];
  uint64_t v40[21];

  sub_10000F0E4();
  v36 = v3;
  v37 = v2;
  v34 = v4;
  v35 = v5;
  v7 = v6;
  v9 = v8;
  v11 = sub_10000EF0C(v10, v8, v6);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  __chkstk_darwin(v11, v14);
  v16 = (char *)&v33 - v15;
  sub_10000B8A0(&qword_100038958);
  sub_10000E858();
  __chkstk_darwin(v17, v18);
  sub_10000EE64();
  __chkstk_darwin(v19, v20);
  v22 = (char *)&v33 - v21;
  v23 = *(_QWORD *)(v0 + *(int *)(v11 + 20));
  v24 = swift_retain(v23);
  v34(v24, v9);
  sub_10000F01C();
  v25 = swift_retain(v23);
  sub_10000581C(v38, v25, v9);
  sub_10000F01C();
  sub_10000D1AC(v0, (uint64_t)v16, v7);
  v26 = *(unsigned __int8 *)(v12 + 80);
  v27 = (v26 + 16) & ~v26;
  v28 = swift_allocObject(v35, v27 + v13, v26 | 7);
  sub_10000D140((uint64_t)v16, v28 + v27, v7);
  sub_10000EB70((uint64_t)v22, v1);
  v29 = v36;
  sub_10000EB70(v1, v36);
  sub_10000B8A0(&qword_100038960);
  sub_10000F174();
  v31 = (void *)(v29 + v30);
  sub_10000F2E8(v39, v38);
  sub_10000F2E8(v31, v38);
  v32 = (_QWORD *)(v29 + *(int *)(v27 + 64));
  *v32 = v37;
  v32[1] = v28;
  sub_10000C50C(v39);
  swift_retain(v28);
  sub_10000EEB8((uint64_t)v22);
  swift_release(v28);
  sub_10000F2E8(v40, v38);
  sub_10000C570(v40);
  sub_10000EEB8(v1);
  sub_10000E8C0();
}

void sub_10000543C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD v28[20];
  uint64_t v29[20];
  uint64_t __dst[21];

  v6 = sub_10000B8A0(&qword_100038CB0);
  v8 = __chkstk_darwin(v6, v7);
  v10 = (char *)&v28[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8, v11);
  v13 = (char *)&v28[-1] - v12;
  v14 = sub_10000B8A0(&qword_100038958);
  v16 = __chkstk_darwin(v14, v15);
  v18 = (char *)&v28[-1] - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16, v19);
  v21 = (char *)&v28[-1] - v20;
  swift_retain(a1);
  sub_100005748(a1, (uint64_t)v21);
  swift_release(a1);
  v22 = swift_retain(a1);
  sub_10000581C(v28, v22, a2);
  v23 = swift_release(a1);
  *(_QWORD *)v13 = static VerticalAlignment.center.getter(v23);
  *((_QWORD *)v13 + 1) = 0;
  v13[16] = 1;
  v24 = sub_10000B8A0(&qword_100038CB8);
  sub_10000B440(a1, (uint64_t)&v13[*(int *)(v24 + 44)]);
  sub_10000E4E0((uint64_t)v21, (uint64_t)v18, &qword_100038958);
  sub_10000E4E0((uint64_t)v13, (uint64_t)v10, &qword_100038CB0);
  sub_10000E4E0((uint64_t)v18, a3, &qword_100038958);
  v25 = sub_10000B8A0(&qword_100038CC0);
  v26 = (void *)(a3 + *(int *)(v25 + 48));
  memcpy(v29, v28, sizeof(v29));
  memcpy(v26, v28, 0xA0uLL);
  sub_10000E4E0((uint64_t)v10, a3 + *(int *)(v25 + 64), &qword_100038CB0);
  sub_10000C50C(v29);
  sub_10000E500((uint64_t)v13, &qword_100038CB0);
  sub_10000E500((uint64_t)v21, &qword_100038958);
  sub_10000E500((uint64_t)v10, &qword_100038CB0);
  memcpy(__dst, v28, 0xA0uLL);
  sub_10000C570(__dst);
  sub_10000E500((uint64_t)v18, &qword_100038958);
}

uint64_t sub_100005678@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
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
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
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
  uint64_t v37;

  v2 = sub_10000EE10();
  sub_10000F234(v2, (uint64_t)"PHOTOS_RELIVE_WIDGET_DISPLAY_NAME_ACCESSIBILITY");
  v4 = v3;
  v5 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  sub_10000EFB4();
  v6 = sub_10000F240();
  v12 = sub_10000EF34(v6, v7, v8, v4, v9, v10, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17 & 1;
  v25 = v15;
  v19 = sub_10000EDD8();
  sub_10000593C(v19, v20, v21, v22, v23, v12, v14, v18, v25, v1, a1, v27, v28, v29, v30, v31, v32, v33, v34,
    v35,
    v36,
    v37);
  sub_10000C5D4(v12, v14, v18);
  return sub_10000EA60(v16);
}

uint64_t sub_100005748@<X0>(uint64_t a1@<X2>, uint64_t a2@<X8>)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
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
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v3 = sub_10000EE10();
  sub_10000F234(v3, (uint64_t)"PHOTOS_RELIVE_WIDGET_DISPLAY_NAME_ACCESSIBILITY");
  v5 = v4;
  v6 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  sub_10000EFB4();
  v7 = sub_10000F240();
  v13 = sub_10000EF34(v7, v8, v9, v5, v10, v11, v12);
  v15 = v14;
  v17 = v16;
  v19 = v18 & 1;
  v26 = v16;
  v20 = sub_10000EDD8();
  sub_10000593C(v20, v21, v22, v23, v24, v13, v15, v19, v26, a1, a2, v28, v29, v30, v31, v32, v33, v34, v35,
    v36,
    v37,
    v38);
  sub_10000C5D4(v13, v15, v19);
  return sub_10000EA60(v17);
}

#error "100005930: call analysis failed (funcsize=67)"

void sub_10000593C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t (**v25)(uint64_t, uint64_t);
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
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t (**v59)(uint64_t, uint64_t);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _OWORD *v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _QWORD *v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;

  sub_10000E914();
  a21 = v27;
  a22 = v28;
  v30 = v29;
  type metadata accessor for ImageAccentDesaturateModifier(0);
  sub_10000E858();
  __chkstk_darwin(v31, v32);
  sub_10000EE80(v33, v79);
  sub_10000B8A0(&qword_100038BE0);
  sub_10000E858();
  __chkstk_darwin(v34, v35);
  sub_10000ECA8();
  sub_10000E868();
  __chkstk_darwin(v36, v37);
  sub_10000EB50();
  v38 = sub_10000B8A0(&qword_100038BE8);
  sub_10000E858();
  __chkstk_darwin(v39, v40);
  sub_10000E8F0();
  v82 = *(_QWORD *)(sub_10000B8A0(&qword_100038BF0) - 8);
  sub_10000E868();
  __chkstk_darwin(v41, v42);
  sub_10000F034();
  sub_10000B8A0(&qword_100038BF8);
  sub_10000E858();
  __chkstk_darwin(v43, v44);
  sub_10000E968();
  v83 = sub_10000B8A0(&qword_100038C00);
  sub_10000E858();
  __chkstk_darwin(v45, v46);
  sub_10000EB38();
  sub_10000B8A0(&qword_100038C08);
  sub_10000E858();
  __chkstk_darwin(v47, v48);
  sub_10000EE9C(v49, v80);
  sub_10000B8A0(&qword_100038C10);
  sub_10000E858();
  __chkstk_darwin(v50, v51);
  sub_10000EE2C();
  __chkstk_darwin(v52, v53);
  if (v30)
  {
    sub_10000F3C8();
    sub_10000E9F0(v54);
    sub_10000F084(*v55);
    v59 = v25;
    v60 = sub_10000F014();
    v61 = sub_10000F2B4(v60, (uint64_t)&type metadata for String);
    v65 = sub_10000E9B0(v61, v62, v63, v64);
    sub_10000EB18(v65, enum case for Image.ResizingMode.stretch(_:));
    sub_10000ED28();
    sub_10000EEC0();
    v66 = sub_10000EB98(v25[1]);
    static WidgetAccentedRenderingMode.fullColor.getter(v66);
    v67 = type metadata accessor for WidgetAccentedRenderingMode(0);
    sub_10000EBE4(v67);
    v68 = sub_10000F01C();
    sub_10000F0DC(v68, &qword_100038BE0);
    sub_10000EB68(v23, v26, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v82 + 16));
    v69 = sub_10000EA2C();
    v70 = static Alignment.topLeading.getter(v69);
    sub_10000EC50(v70, v71);
    sub_10000E980(v23, v22);
    v72 = (_OWORD *)(v22 + *(int *)(v83 + 36));
    *v72 = v85;
    v72[1] = v86;
    v72[2] = v87;
    sub_10000E988(v23);
    v73 = sub_10000CF9C();
    sub_10000EA7C(v73);
    sub_10000E500(v22, &qword_100038C00);
    *v84 = swift_getKeyPath(&unk_100029780);
    v74 = sub_10000B8A0(&qword_100038C70);
    sub_10000EA58((uint64_t)v84, v74);
    sub_10000F3DC();
    sub_10000D140((uint64_t)v84, v75, type metadata accessor for ImageAccentDesaturateModifier);
    sub_10000F28C(v76, v77, &qword_100038C08);
    sub_10000ED64();
    sub_10000E944((uint64_t)v25, (uint64_t)&a15);
    sub_10000EA58(v23, v81);
    sub_10000B8A0(&qword_100038C18);
    sub_10000CE94();
    v78 = sub_10000D080();
    sub_10000EC18(v78);
    sub_10000E988((uint64_t)v25);
  }
  else
  {
    v56 = v38;
    v57 = static Color.gray.getter();
    *v24 = swift_getKeyPath(&unk_100029750);
    v24[1] = v57;
    sub_10000EBC0((uint64_t)v24, v56);
    sub_10000B8A0(&qword_100038C18);
    sub_10000CE94();
    v58 = sub_10000D080();
    sub_10000EC34(v58);
  }
  sub_10000E898();
}

double sub_100005CD8()
{
  return 0.0;
}

void sub_100005CE0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char v22;
  void (*v23)(char *, uint64_t);
  void (*v24)(char *, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v35 = a1;
  v38 = a2;
  v2 = sub_10000B8A0(&qword_100038E68);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = sub_10000B8A0(&qword_100038E70);
  __chkstk_darwin(v36, v7);
  v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = sub_10000B8A0(&qword_100038E78);
  __chkstk_darwin(v37, v10);
  v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for WidgetRenderingMode(0);
  v14 = *(_QWORD *)(v13 - 8);
  v16 = __chkstk_darwin(v13, v15);
  v18 = (char *)&v35 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16, v19);
  v21 = (char *)&v35 - v20;
  sub_100010C3C((uint64_t)&v35 - v20);
  static WidgetRenderingMode.accented.getter();
  v22 = static WidgetRenderingMode.== infix(_:_:)(v21, v18);
  v23 = *(void (**)(char *, uint64_t))(v14 + 8);
  v23(v18, v13);
  v23(v21, v13);
  v24 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  if ((v22 & 1) != 0)
  {
    v24(v12, v35, v2);
    *(_QWORD *)&v12[*(int *)(sub_10000B8A0(&qword_100038E90) + 36)] = 0x3F847AE147AE147BLL;
    v25 = static Alignment.center.getter();
    v27 = v26;
    v28 = v37;
    v29 = (uint64_t)&v12[*(int *)(v37 + 36)];
    sub_100005FD4(v29);
    v30 = (uint64_t *)(v29 + *(int *)(sub_10000B8A0(&qword_100038EA8) + 36));
    *v30 = v25;
    v30[1] = v27;
    sub_10000E4E0((uint64_t)v12, (uint64_t)v9, &qword_100038E78);
    swift_storeEnumTagMultiPayload(v9, v36, 0);
    v31 = sub_10000E3A4();
    sub_10000E4AC(&qword_100038E98, &qword_100038E68);
    _ConditionalContent<>.init(storage:)(v9, v28, v2, v31, v32);
    sub_10000E500((uint64_t)v12, &qword_100038E78);
  }
  else
  {
    v24(v6, v35, v2);
    v24(v9, (uint64_t)v6, v2);
    swift_storeEnumTagMultiPayload(v9, v36, 1);
    v33 = sub_10000E3A4();
    sub_10000E4AC(&qword_100038E98, &qword_100038E68);
    _ConditionalContent<>.init(storage:)(v9, v37, v2, v33, v34);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
}

void sub_100005FD4(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[0] = a1;
  v1 = type metadata accessor for BlendMode(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1, v3);
  v5 = (char *)v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_10000B8A0(&qword_100038EB0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_10000B8A0(&qword_100038EB8);
  v13 = __chkstk_darwin(v11, v12);
  v15 = (char *)v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = static Color.black.getter(v13);
  v19[1] = v16;
  View.widgetAccentable(_:)(1);
  swift_release(v16);
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v15, v10, v6);
  *(_QWORD *)&v15[*(int *)(v11 + 36)] = 0x3FD0000000000000;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v5, enum case for BlendMode.multiply(_:), v1);
  v17 = sub_10000B8A0(&qword_100038EC0);
  v18 = v19[0];
  (*(void (**)(_QWORD, char *, uint64_t))(v2 + 16))(v19[0] + *(int *)(v17 + 36), v5, v1);
  sub_10000E4E0((uint64_t)v15, v18, &qword_100038EB8);
  (*(void (**)(char *, uint64_t))(v2 + 8))(v5, v1);
  sub_10000E500((uint64_t)v15, &qword_100038EB8);
}

uint64_t sub_1000061AC()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

void sub_1000061C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;

  sub_10000E914();
  sub_10000EF04();
  sub_10000ED84();
  __chkstk_darwin(v8, v9);
  sub_10000ECC4();
  sub_10000F254();
  __chkstk_darwin(v10, v11);
  sub_10000E8D8();
  sub_10000B8A0(&qword_100038AB0);
  sub_10000E858();
  __chkstk_darwin(v12, v13);
  sub_10000EE48();
  __chkstk_darwin(v14, v15);
  sub_10000F0AC();
  __chkstk_darwin(v16, v17);
  v18 = sub_10000F124();
  if (v18)
  {
    sub_10000F34C();

    v19 = 0;
  }
  else
  {
    v19 = 1;
  }
  sub_10000EF74(v18, v19);
  sub_10000EEF0(v2, v5);
  sub_10000EB70(v5, v7);
  if (sub_10000BA0C(v7, 1, v4) == 1)
  {
    v20 = CharacterSet.init()();
    sub_10000F0DC(v20, &qword_100038AB0);
  }
  else
  {
    sub_10000EEC8();
  }
  sub_10000CB8C();
  sub_10000ECF0();
  sub_10000ECE0();
  sub_10000E500(v5, &qword_100038AB0);
  v21 = sub_10000F394();
  sub_10000EB68(v1, *(_QWORD *)(v0 + *(int *)(v21 + 20))+ OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_widgetFamily, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16));
  v22 = sub_10000EFF4();
  if (v22 != enum case for WidgetFamily.systemSmall(_:)
    && v22 != enum case for WidgetFamily.systemMedium(_:)
    && v22 != enum case for WidgetFamily.systemLarge(_:)
    && v22 != enum case for WidgetFamily.systemExtraLarge(_:))
  {
    sub_10000EAF0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  }
  sub_10000E898();
}

void sub_1000063EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;

  sub_10000E914();
  sub_10000EF04();
  sub_10000ED84();
  __chkstk_darwin(v8, v9);
  sub_10000ECC4();
  sub_10000F254();
  __chkstk_darwin(v10, v11);
  sub_10000E8D8();
  sub_10000B8A0(&qword_100038AB0);
  sub_10000E858();
  __chkstk_darwin(v12, v13);
  sub_10000EE48();
  __chkstk_darwin(v14, v15);
  sub_10000F0AC();
  __chkstk_darwin(v16, v17);
  v18 = sub_10000F124();
  if (v18)
  {
    sub_10000F34C();

    v19 = 0;
  }
  else
  {
    v19 = 1;
  }
  sub_10000EF74(v18, v19);
  sub_10000EEF0(v2, v5);
  sub_10000EB70(v5, v7);
  if (sub_10000BA0C(v7, 1, v4) == 1)
  {
    v20 = CharacterSet.init()();
    sub_10000F0DC(v20, &qword_100038AB0);
  }
  else
  {
    sub_10000EEC8();
  }
  sub_10000CB8C();
  sub_10000ECF0();
  sub_10000ECE0();
  sub_10000E500(v5, &qword_100038AB0);
  v21 = sub_10000F394();
  sub_10000EB68(v1, *(_QWORD *)(v0 + *(int *)(v21 + 20))+ OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_widgetFamily, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16));
  v22 = sub_10000EFF4();
  if (v22 != enum case for WidgetFamily.systemSmall(_:)
    && v22 != enum case for WidgetFamily.systemMedium(_:)
    && v22 != enum case for WidgetFamily.systemLarge(_:)
    && v22 != enum case for WidgetFamily.systemExtraLarge(_:))
  {
    sub_10000EAF0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8));
  }
  sub_10000E898();
}

void (*sub_100006608@<X0>(void (**a1)(uint64_t a1)@<X8>))(uint64_t a1)
{
  void (*result)(uint64_t);
  void (*v3)(uint64_t);

  result = sub_100004B10();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_10000662C()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t inited;
  NSString *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  unint64_t v10;
  NSString *v11;
  NSNumber v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString *v18;
  id v19;
  Class isa;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  _BYTE v25[72];
  _BYTE v26[152];

  sub_10000F214();
  v2 = sub_10000B8A0(&qword_100038A80);
  if (v0 == 2)
  {
    inited = swift_initStackObject(v2, &v24);
    *(_OWORD *)(inited + 16) = xmmword_100029220;
    *(_QWORD *)(inited + 32) = UIFontWeightTrait;
    v4 = UIFontWeightTrait;
    sub_10000ED7C();
    v5 = sub_10000EC9C();
    *(_QWORD *)(inited + 72) = sub_10000F1CC(v5);
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIFontDescriptorSystemDesignDefault);
    *(_QWORD *)(inited + 104) = &type metadata for String;
    *(_QWORD *)(inited + 80) = v6;
    *(_QWORD *)(inited + 88) = v7;
  }
  else
  {
    v8 = swift_initStackObject(v2, v26);
    *(_OWORD *)(v8 + 16) = xmmword_100029230;
    *(_QWORD *)(v8 + 32) = UIFontWidthTrait;
    v9 = UIFontWidthTrait;
    sub_10000ED7C();
    v10 = sub_10000EC9C();
    *(_QWORD *)(v8 + 40) = v1;
    *(_QWORD *)(v8 + 64) = v10;
    *(_QWORD *)(v8 + 72) = UIFontWeightTrait;
    v11 = UIFontWeightTrait;
    v12.super.super.isa = sub_10000ED7C().super.super.isa;
    *(_QWORD *)(v8 + 112) = sub_10000F1B8((uint64_t)v12.super.super.isa);
    v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIFontDescriptorSystemDesignDefault);
    *(_QWORD *)(v8 + 144) = &type metadata for String;
    *(_QWORD *)(v8 + 120) = v13;
    *(_QWORD *)(v8 + 128) = v14;
  }
  type metadata accessor for TraitKey(0);
  sub_10000BDF4(&qword_100038A90, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey);
  v15 = sub_10000EDC4((uint64_t)&type metadata for Any);
  v16 = sub_10000B8A0(&qword_100038A98);
  v17 = swift_initStackObject(v16, v25);
  *(_OWORD *)(v17 + 16) = xmmword_100029240;
  *(_QWORD *)(v17 + 32) = UIFontDescriptorTraitsAttribute;
  *(_QWORD *)(v17 + 64) = sub_10000B8A0(&qword_100038AA0);
  *(_QWORD *)(v17 + 40) = v15;
  type metadata accessor for AttributeName(0);
  sub_10000BDF4(&qword_100038AA8, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName);
  v18 = UIFontDescriptorTraitsAttribute;
  sub_10000EDFC();
  v19 = objc_allocWithZone((Class)UIFontDescriptor);
  isa = sub_10000ED44().super.isa;
  v21 = sub_10000EC10();
  v22 = sub_10000F198(v21, "initWithFontAttributes:");

  sub_1000061C8();
  v23 = (void *)objc_opt_self(UIFont);
  if (sub_10000F310(v23, "fontWithDescriptor:size:"))
  {
    Font.init(_:)();

    sub_10000EB78();
  }
  else
  {
    __break(1u);
  }
}

void sub_1000068A4()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t inited;
  NSString *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSString *v9;
  unint64_t v10;
  NSString *v11;
  NSNumber v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSString *v18;
  id v19;
  Class isa;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  _BYTE v25[72];
  _BYTE v26[152];

  sub_10000F214();
  v2 = sub_10000B8A0(&qword_100038A80);
  if (v0 == 2)
  {
    inited = swift_initStackObject(v2, &v24);
    *(_OWORD *)(inited + 16) = xmmword_100029220;
    *(_QWORD *)(inited + 32) = UIFontWeightTrait;
    v4 = UIFontWeightTrait;
    sub_10000ED7C();
    v5 = sub_10000EC9C();
    *(_QWORD *)(inited + 72) = sub_10000F1CC(v5);
    v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIFontDescriptorSystemDesignDefault);
    *(_QWORD *)(inited + 104) = &type metadata for String;
    *(_QWORD *)(inited + 80) = v6;
    *(_QWORD *)(inited + 88) = v7;
  }
  else
  {
    v8 = swift_initStackObject(v2, v26);
    *(_OWORD *)(v8 + 16) = xmmword_100029230;
    *(_QWORD *)(v8 + 32) = UIFontWidthTrait;
    v9 = UIFontWidthTrait;
    sub_10000ED7C();
    v10 = sub_10000EC9C();
    *(_QWORD *)(v8 + 40) = v1;
    *(_QWORD *)(v8 + 64) = v10;
    *(_QWORD *)(v8 + 72) = UIFontWeightTrait;
    v11 = UIFontWeightTrait;
    v12.super.super.isa = sub_10000ED7C().super.super.isa;
    *(_QWORD *)(v8 + 112) = sub_10000F1B8((uint64_t)v12.super.super.isa);
    v13 = static String._unconditionallyBridgeFromObjectiveC(_:)(UIFontDescriptorSystemDesignDefault);
    *(_QWORD *)(v8 + 144) = &type metadata for String;
    *(_QWORD *)(v8 + 120) = v13;
    *(_QWORD *)(v8 + 128) = v14;
  }
  type metadata accessor for TraitKey(0);
  sub_10000BDF4(&qword_100038A90, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey);
  v15 = sub_10000EDC4((uint64_t)&type metadata for Any);
  v16 = sub_10000B8A0(&qword_100038A98);
  v17 = swift_initStackObject(v16, v25);
  *(_OWORD *)(v17 + 16) = xmmword_100029240;
  *(_QWORD *)(v17 + 32) = UIFontDescriptorTraitsAttribute;
  *(_QWORD *)(v17 + 64) = sub_10000B8A0(&qword_100038AA0);
  *(_QWORD *)(v17 + 40) = v15;
  type metadata accessor for AttributeName(0);
  sub_10000BDF4(&qword_100038AA8, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName);
  v18 = UIFontDescriptorTraitsAttribute;
  sub_10000EDFC();
  v19 = objc_allocWithZone((Class)UIFontDescriptor);
  isa = sub_10000ED44().super.isa;
  v21 = sub_10000EC10();
  v22 = sub_10000F198(v21, "initWithFontAttributes:");

  sub_1000063EC();
  v23 = (void *)objc_opt_self(UIFont);
  if (sub_10000F310(v23, "fontWithDescriptor:size:"))
  {
    Font.init(_:)();

    sub_10000EB78();
  }
  else
  {
    __break(1u);
  }
}

void sub_100006B1C(_QWORD *a1)
{
  uint64_t v2;
  unint64_t v3;

  type metadata accessor for PhotosReliveWidgetMemoryContent(0);
  sub_10000F228();
  if (*(_QWORD *)(v2 + *a1 + 8))
  {
    v3 = sub_10000CB8C();
    StringProtocol.localizedUppercase.getter(&type metadata for String, v3);
  }
  sub_10000EEF8();
}

uint64_t sub_100006B80()
{
  return static View._viewListCount(inputs:)();
}

void (*sub_100006B98@<X0>(void (**a1)(uint64_t a1)@<X8>))(uint64_t a1)
{
  void (*result)(uint64_t);
  void (*v3)(uint64_t);

  result = sub_100004BC8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100006BBC()
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
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  int v45;
  int v46;
  uint64_t v47;
  void (*v48)(char *, _QWORD, uint64_t);
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t (*v53)(char *, uint64_t);
  uint64_t result;
  _QWORD v55[2];
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;

  v61 = type metadata accessor for WidgetFamily(0);
  v59 = *(_QWORD *)(v61 - 8);
  __chkstk_darwin(v61, v1);
  v60 = (char *)v55 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_10000B8A0(&qword_100038AB0);
  v5 = __chkstk_darwin(v3, v4);
  v57 = (uint64_t)v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v5, v7);
  v10 = (char *)v55 - v9;
  __chkstk_darwin(v8, v11);
  v58 = (uint64_t)v55 - v12;
  v13 = type metadata accessor for CharacterSet(0);
  v14 = *(_QWORD *)(v13 - 8);
  v16 = __chkstk_darwin(v13, v15);
  v18 = (char *)v55 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __chkstk_darwin(v16, v19);
  v22 = (char *)v55 - v21;
  __chkstk_darwin(v20, v23);
  v25 = (char *)v55 - v24;
  v62 = v0;
  sub_100006B1C(&OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_title);
  v27 = v26;
  v29 = v28;
  if (qword_1000385C0 != -1)
    swift_once(&qword_1000385C0, sub_10000B16C);
  v30 = sub_10000CDF8(v13, (uint64_t)qword_1000385C8);
  v31 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 16))(v25, v30, v13);
  v64 = v27;
  v65 = v29;
  CharacterSet.inverted.getter(v31);
  v32 = 1;
  v55[1] = sub_10000CB8C();
  StringProtocol.rangeOfCharacter(from:options:range:)(v22, 0, 0, 0, 1);
  v56 = v33;
  v34 = *(void (**)(char *, uint64_t))(v14 + 8);
  v34(v22, v13);
  v34(v25, v13);
  swift_bridgeObjectRelease(v29);
  sub_100006B1C(&OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_title);
  v36 = v35;
  v38 = v37;
  v39 = CTFontCopySystemUIFontExcessiveLineHeightCharacterSet(v35);
  if (v39)
  {
    v40 = (void *)v39;
    static CharacterSet._unconditionallyBridgeFromObjectiveC(_:)();

    v32 = 0;
  }
  v41 = v61;
  sub_10000BA28((uint64_t)v10, v32, 1, v13);
  v42 = v58;
  sub_10000D180((uint64_t)v10, v58, &qword_100038AB0);
  v64 = v36;
  v65 = v38;
  v43 = v57;
  sub_10000E4E0(v42, v57, &qword_100038AB0);
  if (sub_10000BA0C(v43, 1, v13) == 1)
  {
    CharacterSet.init()();
    sub_10000E500(v43, &qword_100038AB0);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v14 + 32))(v18, v43, v13);
  }
  v44 = v60;
  StringProtocol.rangeOfCharacter(from:options:range:)(v18, 0, 0, 0, 1);
  v46 = v45;
  v34(v18, v13);
  sub_10000E500(v42, &qword_100038AB0);
  swift_bridgeObjectRelease(v38);
  type metadata accessor for PhotosReliveWidgetMemoryContent(0);
  v47 = v59;
  v48 = *(void (**)(char *, _QWORD, uint64_t))(v59 + 104);
  v48(v44, enum case for WidgetFamily.systemSmall(_:), v41);
  sub_10000BDF4(&qword_100038BC8, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily);
  v50 = v49;
  dispatch thunk of RawRepresentable.rawValue.getter(v41, v49);
  dispatch thunk of RawRepresentable.rawValue.getter(v41, v50);
  v52 = v63;
  v51 = v64;
  v53 = *(uint64_t (**)(char *, uint64_t))(v47 + 8);
  result = v53(v44, v41);
  if (v51 != v52)
  {
    LODWORD(v62) = v46;
    v48(v44, enum case for WidgetFamily.systemExtraLarge(_:), v41);
    dispatch thunk of RawRepresentable.rawValue.getter(v41, v50);
    dispatch thunk of RawRepresentable.rawValue.getter(v41, v50);
    return v53(v44, v41);
  }
  return result;
}

uint64_t sub_100007118()
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
  char *v11;
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
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  void (*v35)(char *, uint64_t);
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  int v49;
  uint64_t v50;
  void (*v51)(char *, _QWORD, uint64_t);
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t (*v57)(char *, uint64_t);
  uint64_t result;
  _QWORD v59[2];
  int v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;

  v1 = type metadata accessor for WidgetFamily(0);
  v62 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1, v2);
  v63 = (char *)v59 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_10000B8A0(&qword_100038AB0);
  v6 = __chkstk_darwin(v4, v5);
  v61 = (uint64_t)v59 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __chkstk_darwin(v6, v8);
  v11 = (char *)v59 - v10;
  __chkstk_darwin(v9, v12);
  v64 = (uint64_t)v59 - v13;
  v14 = type metadata accessor for CharacterSet(0);
  v15 = *(_QWORD *)(v14 - 8);
  v17 = __chkstk_darwin(v14, v16);
  v19 = (char *)v59 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __chkstk_darwin(v17, v20);
  v23 = (char *)v59 - v22;
  __chkstk_darwin(v21, v24);
  v26 = (char *)v59 - v25;
  v65 = *(int *)(type metadata accessor for PhotosReliveWidgetPlaceholderContent(0) + 20);
  v66 = v0;
  v27 = (uint64_t *)(*(_QWORD *)(v0 + v65) + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_title);
  v28 = v27[1];
  if (v28)
  {
    v29 = *v27;
    v30 = v27[1];
  }
  else
  {
    v29 = 0;
    v30 = 0xE000000000000000;
  }
  v31 = qword_1000385C0;
  swift_bridgeObjectRetain(v28);
  if (v31 != -1)
    swift_once(&qword_1000385C0, sub_10000B16C);
  v32 = sub_10000CDF8(v14, (uint64_t)qword_1000385C8);
  v33 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v15 + 16))(v26, v32, v14);
  v68 = v29;
  v69 = v30;
  CharacterSet.inverted.getter(v33);
  v59[1] = sub_10000CB8C();
  StringProtocol.rangeOfCharacter(from:options:range:)(v23, 0, 0, 0, 1);
  v60 = v34;
  v35 = *(void (**)(char *, uint64_t))(v15 + 8);
  v35(v23, v14);
  v35(v26, v14);
  swift_bridgeObjectRelease(v30);
  v36 = (uint64_t *)(*(_QWORD *)(v66 + v65) + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_title);
  v37 = v36[1];
  if (v37)
  {
    v38 = *v36;
    v39 = v36[1];
  }
  else
  {
    v38 = 0;
    v39 = 0xE000000000000000;
  }
  v40 = v63;
  v41 = swift_bridgeObjectRetain(v37);
  v42 = CTFontCopySystemUIFontExcessiveLineHeightCharacterSet(v41);
  if (v42)
  {
    v43 = (void *)v42;
    static CharacterSet._unconditionallyBridgeFromObjectiveC(_:)();

    v44 = 0;
  }
  else
  {
    v44 = 1;
  }
  sub_10000BA28((uint64_t)v11, v44, 1, v14);
  v45 = (uint64_t)v11;
  v46 = v64;
  sub_10000D180(v45, v64, &qword_100038AB0);
  v68 = v38;
  v69 = v39;
  v47 = v61;
  sub_10000E4E0(v46, v61, &qword_100038AB0);
  if (sub_10000BA0C(v47, 1, v14) == 1)
  {
    CharacterSet.init()();
    sub_10000E500(v47, &qword_100038AB0);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 32))(v19, v47, v14);
  }
  StringProtocol.rangeOfCharacter(from:options:range:)(v19, 0, 0, 0, 1);
  v49 = v48;
  v35(v19, v14);
  sub_10000E500(v64, &qword_100038AB0);
  swift_bridgeObjectRelease(v39);
  v50 = v62;
  v51 = *(void (**)(char *, _QWORD, uint64_t))(v62 + 104);
  v52 = v1;
  v51(v40, enum case for WidgetFamily.systemSmall(_:), v1);
  sub_10000BDF4(&qword_100038BC8, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily);
  v54 = v53;
  dispatch thunk of RawRepresentable.rawValue.getter(v1, v53);
  dispatch thunk of RawRepresentable.rawValue.getter(v1, v54);
  v56 = v67;
  v55 = v68;
  v57 = *(uint64_t (**)(char *, uint64_t))(v50 + 8);
  result = v57(v40, v52);
  if (v55 != v56)
  {
    LODWORD(v66) = v49;
    v51(v40, enum case for WidgetFamily.systemExtraLarge(_:), v52);
    dispatch thunk of RawRepresentable.rawValue.getter(v52, v54);
    dispatch thunk of RawRepresentable.rawValue.getter(v52, v54);
    return v57(v40, v52);
  }
  return result;
}

double sub_1000076B4(void (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double result;
  uint64_t v7;
  uint64_t v8;

  v3 = sub_10000EF04();
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  sub_10000E8F0();
  a1(0);
  sub_10000F228();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 104))(v1, enum case for WidgetFamily.systemSmall(_:), v3);
  sub_10000BDF4(&qword_100038BC8, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_10000F2C0();
  sub_10000F2C0();
  sub_10000EAF0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
  result = 18.0;
  if (v8 == v7)
    return 14.0;
  return result;
}

void sub_10000779C(uint64_t a1, _QWORD *a2, void (*a3)(void))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  sub_100006B1C(a2);
  v15[0] = v9;
  v15[1] = v10;
  v11 = sub_10000CB8C();
  Text.init<A>(_:)(v15, &type metadata for String, v11);
  sub_10000F358();
  sub_100006B1C(a2);
  a3();
  sub_10000F268();
  Text.font(_:)(a3, v3, v4, v6, v5);
  v13 = v12;
  sub_10000EEC0();
  v14 = sub_10000EBA4(v3);
  static Color.white.getter(v14);
  sub_10000F36C();
  Text.foregroundColor(_:)();
  swift_release(v13);
  sub_10000F114();
  sub_10000EDBC();
  sub_10000EBC8();
}

void sub_100007890(uint64_t a1, _QWORD *a2, uint64_t (*a3)(uint64_t, unint64_t, uint64_t, uint64_t (*)(uint64_t a1)))
{
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[2];

  type metadata accessor for PhotosReliveWidgetPlaceholderContent(0);
  sub_10000F228();
  v7 = (uint64_t *)(v6 + *a2);
  v8 = v7[1];
  if (v8)
    v9 = *v7;
  else
    v9 = 0;
  if (v8)
    v10 = v7[1];
  else
    v10 = 0xE000000000000000;
  v25[0] = v9;
  v25[1] = v10;
  v11 = sub_10000CB8C();
  sub_10000F014();
  v12 = Text.init<A>(_:)(v25, &type metadata for String, v11);
  v14 = v13;
  v16 = v15;
  v18 = v17 & 1;
  sub_10000F014();
  v19 = a3(v9, v10, a1, type metadata accessor for PhotosReliveWidgetPlaceholderContent);
  sub_10000EC10();
  Text.font(_:)(v19, v12, v14, v18, v16);
  v21 = v20;
  v23 = v22;
  sub_10000EEC0();
  v24 = sub_10000F1A4(v12, v14, v18);
  static Color.white.getter(v24);
  sub_10000F36C();
  Text.foregroundColor(_:)();
  swift_release(v21);
  sub_10000F114();
  swift_bridgeObjectRelease(v23);
  sub_10000EBC8();
}

void sub_1000079C8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t *, void (*)());
  uint64_t (*v4)(uint64_t, uint64_t *, void (*)());
  uint64_t (*v5)(_QWORD);
  uint64_t (*v6)(_QWORD);
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  int v25;
  int v26;
  double v27;
  int v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  NSString v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  BOOL v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  int v54;
  int v55;
  int v56;
  int v57;
  double v58;

  sub_10000E914();
  v4 = v3;
  v6 = v5;
  v7 = v0;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = v5(0);
  __chkstk_darwin(v14, v15);
  v17 = (char *)&v50 - v16;
  sub_10000B8A0(&qword_100038BD0);
  sub_10000E858();
  __chkstk_darwin(v18, v19);
  sub_10000E968();
  v20 = *(_QWORD *)(v7 + *(int *)(v14 + 20));
  v21 = *(unsigned __int8 *)(v20 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_titleSubtitleLayout);
  v22 = *(unsigned __int8 *)(v20
                           + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_titleSubtitleLayout
                           + 1);
  v23 = *(_QWORD *)(v20 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_titleSubtitleLayout + 8);
  v24 = *(_BYTE *)(v20 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_titleSubtitleLayout + 16);
  v25 = *(unsigned __int8 *)(v20
                           + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_titleSubtitleLayout
                           + 24);
  v26 = *(unsigned __int8 *)(v20
                           + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_titleSubtitleLayout
                           + 25);
  v27 = *(double *)(v20 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_titleSubtitleLayout + 32);
  v28 = *(unsigned __int8 *)(v20
                           + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_titleSubtitleLayout
                           + 40);
  if (*(_BYTE *)(v20 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_titleSubtitleLayout + 1))
  {
    if ((_DWORD)v22 != 1)
    {
      v22 = *(_QWORD *)(v20 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_title + 8);
      if (!v22)
      {
        LOBYTE(v22) = 2;
        goto LABEL_13;
      }
      v54 = *(unsigned __int8 *)(v20
                               + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_titleSubtitleLayout
                               + 40);
      v55 = v26;
      v56 = v21;
      v57 = v25;
      v58 = v27;
      swift_bridgeObjectRetain(v22);
      v32 = String._bridgeToObjectiveC()();
      sub_10000EC10();
      v33 = PXStoryTitleInternationalStyleKashidaMaximumWidthForTitle(v32, v11, v9);

      sub_10000D1AC(v7, (uint64_t)v17, v6);
      if (v33 <= 0.0)
      {
        sub_10000F3BC();
        sub_10000F2CC();
        LOBYTE(v25) = 2;
        LOBYTE(v28) = 1;
        v24 = 1;
      }
      else
      {
        v34 = v4(2, &OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_title, sub_10000662C);
        v51 = v34;
        v52 = v35;
        v23 = v36;
        v22 = v37 & 1;
        v24 = 1;
        v50 = sub_10000F3B4();
        sub_10000BA28(v1, 1, 1, v50);
        v38 = v34;
        v39 = v52;
        v53 = sub_10000F340(v38, v52, v22, v23);
        sub_10000C5D4(v51, v39, v22);
        v40 = sub_10000EDBC();
        sub_10000F1F8(v40, &qword_100038BD0);
        sub_10000F3BC();
        if (v53 <= 2)
        {
          v23 = *(_QWORD *)&v33;
          LOBYTE(v26) = v55;
          if (v55 == 2)
          {
            v58 = v33 * 0.6;
            LOBYTE(v22) = 2;
            v41 = v4(2, &OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_subtitle, sub_1000068A4);
            v43 = v42;
            v45 = v44;
            v47 = v46 & 1;
            sub_10000BA28(v1, 1, 1, v50);
            v48 = (unint64_t)sub_10000F340(v41, v43, v47, v45) < 2;
            v49 = sub_10000F1A4(v41, v43, v47);
            sub_10000F1F8(v49, &qword_100038BD0);
            v27 = v58;
            LOBYTE(v28) = 0;
            v24 = 0;
            LOBYTE(v26) = 2 * v48;
            LOBYTE(v21) = v56;
            LOBYTE(v25) = v57;
          }
          else
          {
            v24 = 0;
            LOBYTE(v22) = 2;
            LOBYTE(v21) = v56;
            LOBYTE(v25) = v57;
            v27 = v58;
            LOBYTE(v28) = v54;
          }
          goto LABEL_13;
        }
        sub_10000F2CC();
        LOBYTE(v28) = 1;
        LOBYTE(v25) = 2;
      }
      LOBYTE(v21) = 2;
      goto LABEL_13;
    }
    v56 = *(unsigned __int8 *)(v20
                             + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_titleSubtitleLayout);
    v57 = v25;
    v58 = v27;
    v54 = v28;
    v55 = v26;
    v4(1, &OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_title, sub_10000662C);
    sub_10000F358();
    static Text.WritingMode.verticalRightToLeft.getter();
    v29 = sub_10000F3B4();
    sub_10000BA28(v1, 0, 1, v29);
    v30 = Text.Measurements.numberOfLines(of:in:writingMode:)(v4, v6, v2, v22, v1, INFINITY);
    v31 = sub_10000EBA4((uint64_t)v4);
    sub_10000F1F8(v31, &qword_100038BD0);
    LOBYTE(v28) = v54;
    LOBYTE(v26) = v55;
    LOBYTE(v21) = v56;
    LOBYTE(v25) = v57;
    v27 = v58;
    LOBYTE(v22) = v30 < 2;
    if (v30 > 1)
    {
      v27 = 0.0;
      LOBYTE(v28) = 1;
      LOBYTE(v26) = 0;
      LOBYTE(v25) = 2;
      v23 = 0;
      v24 = 1;
      LOBYTE(v21) = 2;
    }
  }
LABEL_13:
  *(_BYTE *)v13 = v21;
  *(_BYTE *)(v13 + 1) = v22;
  *(_QWORD *)(v13 + 8) = v23;
  *(_BYTE *)(v13 + 16) = v24;
  *(_BYTE *)(v13 + 24) = v25;
  *(_BYTE *)(v13 + 25) = v26;
  *(double *)(v13 + 32) = v27;
  *(_BYTE *)(v13 + 40) = v28;
  sub_10000E898();
}

void sub_100007D94(uint64_t a1@<X0>, uint64_t a2@<X1>, void (*a3)(uint64_t, uint64_t)@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v8;

  *a4 = static Alignment.center.getter(a1);
  a4[1] = v8;
  sub_10000B8A0(&qword_100038968);
  a3(a1, a2);
  sub_10000E9E4();
}

void sub_100007DE4(uint64_t a1@<X1>, uint64_t a2@<X8>)
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  char v40;
  __int16 v41;
  uint64_t v42;
  char v43;

  v37 = a2;
  v3 = sub_10000B8A0(&qword_100038970);
  v5 = __chkstk_darwin(v3, v4);
  v36 = (uint64_t)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v35 - v8;
  v10 = sub_10000B8A0(&qword_100038978);
  v12 = __chkstk_darwin(v10, v11);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v12, v15);
  v18 = (char *)&v35 - v17;
  GeometryProxy.size.getter(v16);
  v19 = *(_QWORD *)(a1 + *(int *)(type metadata accessor for PhotosReliveWidgetMemoryContent(0) + 20))
      + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_widgetFamily;
  v20 = sub_1000041F0(v19, 0);
  GeometryProxy.size.getter(v20);
  sub_1000042E0(v19, 0);
  sub_1000079C8();
  v21 = sub_10001E42C(v38, v39, v40, v41, v42, v43);
  sub_100006BBC();
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v28 = sub_1000076B4((void (*)(_QWORD))type metadata accessor for PhotosReliveWidgetMemoryContent);
  *(_QWORD *)v18 = static VerticalAlignment.center.getter();
  *((_QWORD *)v18 + 1) = 0;
  v29 = 1;
  v18[16] = 1;
  v30 = sub_10000B8A0(&qword_100038980);
  sub_100008454(a1, &v38, v21 & 1, &v18[*(int *)(v30 + 44)], v23, v25, v27, v28);
  if ((v21 & 1) == 0)
  {
    *(_QWORD *)v9 = static VerticalAlignment.center.getter();
    *((_QWORD *)v9 + 1) = 0;
    v9[16] = 1;
    sub_10000B8A0(&qword_100038988);
    sub_10000A584();
    v29 = 0;
  }
  v31 = sub_10000B8A0(&qword_100038990);
  sub_10000BA28((uint64_t)v9, v29, 1, v31);
  sub_10000E4E0((uint64_t)v18, (uint64_t)v14, &qword_100038978);
  v32 = v36;
  sub_10000E4E0((uint64_t)v9, v36, &qword_100038970);
  v33 = v37;
  sub_10000E4E0((uint64_t)v14, v37, &qword_100038978);
  v34 = sub_10000B8A0(&qword_100038998);
  sub_10000E4E0(v32, v33 + *(int *)(v34 + 48), &qword_100038970);
  sub_10000E500((uint64_t)v9, &qword_100038970);
  sub_10000E500((uint64_t)v18, &qword_100038978);
  sub_10000E500(v32, &qword_100038970);
  sub_10000E500((uint64_t)v14, &qword_100038978);
}

void sub_10000811C(uint64_t a1@<X1>, uint64_t a2@<X8>)
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  char v40;
  __int16 v41;
  uint64_t v42;
  char v43;

  v37 = a2;
  v3 = sub_10000B8A0(&qword_100038970);
  v5 = __chkstk_darwin(v3, v4);
  v36 = (uint64_t)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v35 - v8;
  v10 = sub_10000B8A0(&qword_100038978);
  v12 = __chkstk_darwin(v10, v11);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v12, v15);
  v18 = (char *)&v35 - v17;
  GeometryProxy.size.getter(v16);
  v19 = *(_QWORD *)(a1 + *(int *)(type metadata accessor for PhotosReliveWidgetPlaceholderContent(0) + 20))
      + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_widgetFamily;
  v20 = sub_1000041F0(v19, 0);
  GeometryProxy.size.getter(v20);
  sub_1000042E0(v19, 0);
  sub_1000079C8();
  v21 = sub_10001E42C(v38, v39, v40, v41, v42, v43);
  sub_100007118();
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v28 = sub_1000076B4((void (*)(_QWORD))type metadata accessor for PhotosReliveWidgetPlaceholderContent);
  *(_QWORD *)v18 = static VerticalAlignment.center.getter();
  *((_QWORD *)v18 + 1) = 0;
  v29 = 1;
  v18[16] = 1;
  v30 = sub_10000B8A0(&qword_100038980);
  sub_1000089F8(a1, &v38, v21 & 1, &v18[*(int *)(v30 + 44)], v23, v25, v27, v28);
  if ((v21 & 1) == 0)
  {
    *(_QWORD *)v9 = static VerticalAlignment.center.getter();
    *((_QWORD *)v9 + 1) = 0;
    v9[16] = 1;
    sub_10000B8A0(&qword_100038988);
    sub_10000A584();
    v29 = 0;
  }
  v31 = sub_10000B8A0(&qword_100038990);
  sub_10000BA28((uint64_t)v9, v29, 1, v31);
  sub_10000E4E0((uint64_t)v18, (uint64_t)v14, &qword_100038978);
  v32 = v36;
  sub_10000E4E0((uint64_t)v9, v36, &qword_100038970);
  v33 = v37;
  sub_10000E4E0((uint64_t)v14, v37, &qword_100038978);
  v34 = sub_10000B8A0(&qword_100038998);
  sub_10000E4E0(v32, v33 + *(int *)(v34 + 48), &qword_100038970);
  sub_10000E500((uint64_t)v9, &qword_100038970);
  sub_10000E500((uint64_t)v18, &qword_100038978);
  sub_10000E500(v32, &qword_100038970);
  sub_10000E500((uint64_t)v14, &qword_100038978);
}

void sub_100008454(uint64_t a1@<X0>, _WORD *a2@<X1>, int a3@<W2>, _QWORD *a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
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
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _WORD *v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  uint64_t v90;
  uint64_t v91;
  _QWORD *v92;

  v86 = a3;
  v92 = a4;
  v14 = sub_10000B8A0(&qword_100038AB8);
  __chkstk_darwin(v14, v15);
  v80 = (uint64_t *)((char *)&v77 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v79 = type metadata accessor for WidgetFamily(0);
  v17 = *(_QWORD *)(v79 - 8);
  __chkstk_darwin(v79, v18);
  v20 = (char *)&v77 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = (int *)sub_10000B8A0(&qword_100038AC0);
  __chkstk_darwin(v21, v22);
  v24 = (char *)&v77 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = sub_10000B8A0(&qword_100038AC8);
  __chkstk_darwin(v82, v25);
  v27 = (char *)&v77 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = sub_10000B8A0(&qword_100038AD0);
  __chkstk_darwin(v84, v28);
  v81 = (uint64_t)&v77 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = sub_10000B8A0(&qword_100038AD8);
  __chkstk_darwin(v87, v30);
  v83 = (uint64_t)&v77 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = sub_10000B8A0(&qword_100038AE0);
  v33 = __chkstk_darwin(v90, v32);
  v91 = (uint64_t)&v77 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __chkstk_darwin(v33, v35);
  v85 = (uint64_t)&v77 - v37;
  __chkstk_darwin(v36, v38);
  v88 = (uint64_t)&v77 - v39;
  v78 = a2;
  sub_100008F9C(*a2);
  v41 = v40;
  v43 = v42;
  v44 = static HorizontalAlignment.trailing.getter();
  v89 = static HorizontalAlignment.== infix(_:_:)(v41, v44);
  v45 = type metadata accessor for PhotosReliveWidgetMemoryContent(0);
  v46 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
  v47 = v79;
  v46(v20, *(_QWORD *)(a1 + *(int *)(v45 + 20))+ OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_widgetFamily, v79);
  v46(&v24[v21[9]], (uint64_t)v20, v47);
  v24[v21[10]] = 0;
  v48 = v41;
  *(_QWORD *)&v24[v21[11]] = v41;
  *(_QWORD *)&v24[v21[12]] = v43;
  v49 = v80;
  v50 = v43;
  v51 = v48;
  sub_10000900C(v50, (uint64_t)v78, a1, v48, v86, (uint64_t (*)(_QWORD, uint64_t *, void (*)()))sub_10000779C, v80, a5, a6, a7);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v47);
  sub_10000D180((uint64_t)v49, (uint64_t)v24, &qword_100038AB8);
  v53 = static VerticalAlignment.top.getter(v52);
  v54 = swift_allocObject(&unk_100035968, 24, 7);
  *(double *)(v54 + 16) = a8;
  sub_10000E4E0((uint64_t)v24, (uint64_t)v27, &qword_100038AC0);
  v55 = (uint64_t *)&v27[*(int *)(v82 + 36)];
  *v55 = v53;
  v55[1] = (uint64_t)sub_10000CC30;
  v55[2] = v54;
  sub_10000E500((uint64_t)v24, &qword_100038AC0);
  v57 = static HorizontalAlignment.leading.getter(v56);
  v58 = swift_allocObject(&unk_100035990, 24, 7);
  *(double *)(v58 + 16) = a8;
  v59 = v81;
  sub_10000E4E0((uint64_t)v27, v81, &qword_100038AC8);
  v60 = (uint64_t *)(v59 + *(int *)(v84 + 36));
  *v60 = v57;
  v60[1] = (uint64_t)sub_10000E840;
  v60[2] = v58;
  sub_10000E500((uint64_t)v27, &qword_100038AC8);
  v61 = static HorizontalAlignment.trailing.getter();
  v62 = swift_allocObject(&unk_1000359B8, 24, 7);
  *(double *)(v62 + 16) = a8;
  v63 = v83;
  sub_10000E4E0(v59, v83, &qword_100038AD0);
  v64 = (uint64_t *)(v63 + *(int *)(v87 + 36));
  *v64 = v61;
  v64[1] = (uint64_t)sub_10000E840;
  v64[2] = v62;
  sub_10000E500(v59, &qword_100038AD0);
  v65 = static VerticalAlignment.bottom.getter();
  v66 = swift_allocObject(&unk_1000359E0, 24, 7);
  *(double *)(v66 + 16) = a8;
  v67 = v85;
  sub_10000E4E0(v63, v85, &qword_100038AD8);
  v68 = (uint64_t *)(v67 + *(int *)(v90 + 36));
  *v68 = v65;
  v68[1] = (uint64_t)sub_10000E840;
  v68[2] = v66;
  sub_10000E500(v63, &qword_100038AD8);
  v69 = v88;
  sub_10000D180(v67, v88, &qword_100038AE0);
  v71 = static HorizontalAlignment.leading.getter(v70);
  LOBYTE(v65) = static HorizontalAlignment.== infix(_:_:)(v51, v71);
  v72 = v91;
  sub_10000E4E0(v69, v91, &qword_100038AE0);
  v73 = v92;
  *v92 = 0;
  *((_BYTE *)v73 + 8) = 0;
  *((_BYTE *)v73 + 9) = (v89 & 1) == 0;
  v74 = v73;
  v75 = sub_10000B8A0(&qword_100038AE8);
  sub_10000E4E0(v72, (uint64_t)v74 + *(int *)(v75 + 48), &qword_100038AE0);
  v76 = (uint64_t)v74 + *(int *)(v75 + 64);
  *(_QWORD *)v76 = 0;
  *(_BYTE *)(v76 + 8) = 0;
  *(_BYTE *)(v76 + 9) = (v65 & 1) == 0;
  sub_10000E500(v69, &qword_100038AE0);
  sub_10000E500(v72, &qword_100038AE0);
}

void sub_1000089F8(uint64_t a1@<X0>, _WORD *a2@<X1>, int a3@<W2>, _QWORD *a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
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
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(char *, uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  _QWORD *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _WORD *v78;
  uint64_t v79;
  _QWORD *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  int v86;
  uint64_t v87;
  uint64_t v88;
  int v89;
  uint64_t v90;
  uint64_t v91;
  _QWORD *v92;

  v86 = a3;
  v92 = a4;
  v14 = sub_10000B8A0(&qword_100038AB8);
  __chkstk_darwin(v14, v15);
  v80 = (uint64_t *)((char *)&v77 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v79 = type metadata accessor for WidgetFamily(0);
  v17 = *(_QWORD *)(v79 - 8);
  __chkstk_darwin(v79, v18);
  v20 = (char *)&v77 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = (int *)sub_10000B8A0(&qword_100038AC0);
  __chkstk_darwin(v21, v22);
  v24 = (char *)&v77 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = sub_10000B8A0(&qword_100038AC8);
  __chkstk_darwin(v82, v25);
  v27 = (char *)&v77 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = sub_10000B8A0(&qword_100038AD0);
  __chkstk_darwin(v84, v28);
  v81 = (uint64_t)&v77 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v87 = sub_10000B8A0(&qword_100038AD8);
  __chkstk_darwin(v87, v30);
  v83 = (uint64_t)&v77 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = sub_10000B8A0(&qword_100038AE0);
  v33 = __chkstk_darwin(v90, v32);
  v91 = (uint64_t)&v77 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __chkstk_darwin(v33, v35);
  v85 = (uint64_t)&v77 - v37;
  __chkstk_darwin(v36, v38);
  v88 = (uint64_t)&v77 - v39;
  v78 = a2;
  sub_100008F9C(*a2);
  v41 = v40;
  v43 = v42;
  v44 = static HorizontalAlignment.trailing.getter();
  v89 = static HorizontalAlignment.== infix(_:_:)(v41, v44);
  v45 = type metadata accessor for PhotosReliveWidgetPlaceholderContent(0);
  v46 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
  v47 = v79;
  v46(v20, *(_QWORD *)(a1 + *(int *)(v45 + 20))+ OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_widgetFamily, v79);
  v46(&v24[v21[9]], (uint64_t)v20, v47);
  v24[v21[10]] = 0;
  v48 = v41;
  *(_QWORD *)&v24[v21[11]] = v41;
  *(_QWORD *)&v24[v21[12]] = v43;
  v49 = v80;
  v50 = v43;
  v51 = v48;
  sub_10000900C(v50, (uint64_t)v78, a1, v48, v86, (uint64_t (*)(_QWORD, uint64_t *, void (*)()))sub_100007890, v80, a5, a6, a7);
  (*(void (**)(char *, uint64_t))(v17 + 8))(v20, v47);
  sub_10000D180((uint64_t)v49, (uint64_t)v24, &qword_100038AB8);
  v53 = static VerticalAlignment.top.getter(v52);
  v54 = swift_allocObject(&unk_100035A58, 24, 7);
  *(double *)(v54 + 16) = a8;
  sub_10000E4E0((uint64_t)v24, (uint64_t)v27, &qword_100038AC0);
  v55 = (uint64_t *)&v27[*(int *)(v82 + 36)];
  *v55 = v53;
  v55[1] = (uint64_t)sub_10000E840;
  v55[2] = v54;
  sub_10000E500((uint64_t)v24, &qword_100038AC0);
  v57 = static HorizontalAlignment.leading.getter(v56);
  v58 = swift_allocObject(&unk_100035A80, 24, 7);
  *(double *)(v58 + 16) = a8;
  v59 = v81;
  sub_10000E4E0((uint64_t)v27, v81, &qword_100038AC8);
  v60 = (uint64_t *)(v59 + *(int *)(v84 + 36));
  *v60 = v57;
  v60[1] = (uint64_t)sub_10000E840;
  v60[2] = v58;
  sub_10000E500((uint64_t)v27, &qword_100038AC8);
  v61 = static HorizontalAlignment.trailing.getter();
  v62 = swift_allocObject(&unk_100035AA8, 24, 7);
  *(double *)(v62 + 16) = a8;
  v63 = v83;
  sub_10000E4E0(v59, v83, &qword_100038AD0);
  v64 = (uint64_t *)(v63 + *(int *)(v87 + 36));
  *v64 = v61;
  v64[1] = (uint64_t)sub_10000E840;
  v64[2] = v62;
  sub_10000E500(v59, &qword_100038AD0);
  v65 = static VerticalAlignment.bottom.getter();
  v66 = swift_allocObject(&unk_100035AD0, 24, 7);
  *(double *)(v66 + 16) = a8;
  v67 = v85;
  sub_10000E4E0(v63, v85, &qword_100038AD8);
  v68 = (uint64_t *)(v67 + *(int *)(v90 + 36));
  *v68 = v65;
  v68[1] = (uint64_t)sub_10000E840;
  v68[2] = v66;
  sub_10000E500(v63, &qword_100038AD8);
  v69 = v88;
  sub_10000D180(v67, v88, &qword_100038AE0);
  v71 = static HorizontalAlignment.leading.getter(v70);
  LOBYTE(v65) = static HorizontalAlignment.== infix(_:_:)(v51, v71);
  v72 = v91;
  sub_10000E4E0(v69, v91, &qword_100038AE0);
  v73 = v92;
  *v92 = 0;
  *((_BYTE *)v73 + 8) = 0;
  *((_BYTE *)v73 + 9) = (v89 & 1) == 0;
  v74 = v73;
  v75 = sub_10000B8A0(&qword_100038AE8);
  sub_10000E4E0(v72, (uint64_t)v74 + *(int *)(v75 + 48), &qword_100038AE0);
  v76 = (uint64_t)v74 + *(int *)(v75 + 64);
  *(_QWORD *)v76 = 0;
  *(_BYTE *)(v76 + 8) = 0;
  *(_BYTE *)(v76 + 9) = (v65 & 1) == 0;
  sub_10000E500(v69, &qword_100038AE0);
  sub_10000E500(v72, &qword_100038AE0);
}

void sub_100008F9C(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_100008FC4()
{
  uint64_t v0;

  v0 = ((uint64_t (*)(void))static HorizontalAlignment.leading.getter)();
  ((void (*)(void))static VerticalAlignment.top.getter)();
  return v0;
}

void sub_10000900C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, int a5@<W4>, uint64_t (*a6)(_QWORD, uint64_t *, void (*)())@<X5>, _QWORD *a7@<X8>, double a8@<D0>, double a9@<D1>, double a10@<D2>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
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
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char *v77;
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
  int v92;
  double v93;
  uint64_t (*v94)(_QWORD, uint64_t *, void (*)());
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char v98;
  char v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char v109;
  char v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t *v123;
  uint64_t v124;
  unint64_t v125;
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
  uint64_t v136;
  unint64_t v137;
  uint64_t v138;
  uint64_t (*v139)(uint64_t, _QWORD);
  uint64_t (*v140)(uint64_t, _QWORD);
  uint64_t v141;
  uint64_t (*v142)(_QWORD, uint64_t *, void (*)());
  uint64_t v143;
  uint64_t v144;
  char v145;
  _QWORD *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  char v152;
  char v153;
  uint64_t v154;
  uint64_t v155;
  char v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t KeyPath;
  uint64_t *v166;
  uint64_t v167;
  void (*v168)(_QWORD, _QWORD);
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
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
  char v188;
  char v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  unint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  char v200;
  double v201;
  char v202;
  uint64_t v203;
  uint64_t (*v204)(uint64_t, _QWORD);
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  _QWORD *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
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
  int v237;
  uint64_t v238;
  _QWORD *v239;
  uint64_t v240;
  uint64_t v241;
  void (*v242)(_QWORD, _QWORD);
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t (*v252)(_QWORD, uint64_t *, void (*)());
  int v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  _QWORD *v261;
  uint64_t v262;
  char v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  char v274;
  char v275;
  char v276[8];
  uint64_t v277;
  uint64_t v278;

  v252 = a6;
  v237 = a5;
  v238 = a4;
  v251 = a3;
  v261 = a7;
  v221 = type metadata accessor for TextJustification(0);
  v19 = *(_QWORD *)(v221 - 8);
  __chkstk_darwin(v221, v20);
  sub_10000E874();
  sub_10000E8B4(v21);
  v22 = sub_10000B8A0(&qword_100038AF0);
  sub_10000EDB0(v22, (uint64_t)&v258);
  v226 = v23;
  sub_10000E868();
  __chkstk_darwin(v24, v25);
  sub_10000E874();
  sub_10000E8B4(v26);
  v259 = sub_10000B8A0(&qword_100038AF8);
  sub_10000E858();
  __chkstk_darwin(v27, v28);
  sub_10000E954();
  sub_10000F0FC();
  __chkstk_darwin(v29, v30);
  sub_10000EF18();
  sub_10000E8B4(v31);
  v250 = sub_10000B8A0(&qword_100038B00);
  sub_10000E858();
  __chkstk_darwin(v32, v33);
  sub_10000E874();
  sub_10000E8B4(v34);
  v222 = sub_10000B8A0(&qword_1000389B8);
  sub_10000E858();
  __chkstk_darwin(v35, v36);
  sub_10000E874();
  sub_10000E8B4(v37);
  v230 = sub_10000B8A0(&qword_1000389C0);
  sub_10000E858();
  __chkstk_darwin(v38, v39);
  sub_10000E874();
  sub_10000E8B4(v40);
  v41 = sub_10000B8A0(&qword_100038B08);
  sub_10000EDB0(v41, (uint64_t)&v267);
  v235 = v42;
  sub_10000E868();
  __chkstk_darwin(v43, v44);
  sub_10000E874();
  v234 = v45;
  v225 = sub_10000F3B4();
  sub_10000ED84();
  __chkstk_darwin(v46, v47);
  sub_10000F04C();
  v48 = sub_10000B8A0(&qword_100038B10);
  sub_10000EDB0(v48, (uint64_t)&v264);
  v232 = v49;
  sub_10000E868();
  __chkstk_darwin(v50, v51);
  sub_10000E874();
  sub_10000E8B4(v52);
  v254 = sub_10000B8A0(&qword_100038B18);
  sub_10000E858();
  __chkstk_darwin(v53, v54);
  sub_10000E874();
  sub_10000E8B4(v55);
  v247 = sub_10000B8A0(&qword_100038B20);
  sub_10000E858();
  __chkstk_darwin(v56, v57);
  sub_10000E8B4((uint64_t)&v218 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0));
  v248 = sub_10000B8A0(&qword_100038B28);
  sub_10000E858();
  __chkstk_darwin(v59, v60);
  sub_10000E8D8();
  v255 = sub_10000B8A0(&qword_100038B30);
  sub_10000E858();
  __chkstk_darwin(v61, v62);
  sub_10000E874();
  v249 = v63;
  v64 = sub_10000F18C();
  sub_10000EDB0(v64, (uint64_t)v276);
  v244 = v65;
  sub_10000E868();
  __chkstk_darwin(v66, v67);
  sub_10000E874();
  sub_10000E8B4(v68);
  v69 = sub_10000B8A0(&qword_1000389F0);
  sub_10000EDB0(v69, (uint64_t)&v272);
  v240 = v70;
  sub_10000E868();
  __chkstk_darwin(v71, v72);
  sub_10000E8F0();
  v73 = sub_10000B8A0(&qword_1000389F8);
  sub_10000E858();
  __chkstk_darwin(v74, v75);
  v77 = (char *)&v218 - ((v76 + 15) & 0xFFFFFFFFFFFFFFF0);
  v219 = sub_10000B8A0(&qword_100038A00);
  sub_10000E858();
  __chkstk_darwin(v78, v79);
  sub_10000F024();
  v82 = v80 - v81;
  __chkstk_darwin(v83, v84);
  sub_10000EF18();
  sub_10000E8B4(v85);
  sub_10000B8A0(&qword_100038B38);
  sub_10000E858();
  __chkstk_darwin(v86, v87);
  sub_10000E954();
  sub_10000F0FC();
  __chkstk_darwin(v88, v89);
  sub_10000EF18();
  sub_10000E8B4(v90);
  v91 = static VerticalAlignment.bottom.getter();
  v260 = a1;
  v253 = static VerticalAlignment.== infix(_:_:)(a1, v91);
  v92 = *(unsigned __int8 *)(a2 + 1);
  v93 = *(double *)(a2 + 8);
  v275 = *(_BYTE *)(a2 + 16);
  if (!v92)
  {
    v142 = v252;
    v239 = (_QWORD *)v252(0, &OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_title, sub_10000662C);
    v238 = v143;
    v246 = v144;
    v237 = v145 & 1;
    v264 = 0;
    LOBYTE(v265) = 1;
    v227 = sub_10000B8A0(&qword_100038A70);
    v146 = State.init(wrappedValue:)(&v268, &v264, v227);
    v236 = v268;
    LODWORD(v235) = v269;
    v234 = v270;
    v147 = static Alignment.center.getter(v146);
    _FrameLayout.init(width:height:alignment:)(&v268, 0, 1, *(_QWORD *)&a10, 0, v147, v148);
    v233 = v268;
    LODWORD(v232) = v269;
    v231 = v270;
    LODWORD(v230) = v271;
    v229 = v272;
    v228 = v273;
    v149 = v142(0, &OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_subtitle, sub_1000068A4);
    v151 = v150;
    v264 = v149;
    v265 = v150;
    v153 = v152 & 1;
    LOBYTE(v266) = v152 & 1;
    v267 = v154;
    sub_10000F280();
    sub_10000F1A4(v149, v151, v153);
    v262 = 0;
    v263 = 1;
    State.init(wrappedValue:)(&v264, &v262, v227);
    v155 = v264;
    v156 = v265;
    v157 = v266;
    v158 = v240;
    v159 = v241;
    (*(void (**)(char *, uint64_t, uint64_t))(v240 + 16))(v77, v11, v241);
    *(double *)&v77[*(int *)(v73 + 36)] = a9;
    sub_10000F2FC();
    *(_QWORD *)(v160 + 8) = v161;
    *(_QWORD *)(v160 + 16) = 1;
    *(_BYTE *)(v160 + 24) = 0;
    *(_QWORD *)(v160 + 32) = v155;
    *(_BYTE *)(v160 + 40) = v156;
    *(_QWORD *)(v160 + 48) = v157;
    (*(void (**)(uint64_t, uint64_t))(v158 + 8))(v11, v159);
    v162 = v244;
    v163 = v243;
    v164 = v245;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v244 + 104))(v243, enum case for Text.TruncationMode.tail(_:), v245);
    KeyPath = swift_getKeyPath(&unk_100029720);
    v166 = (uint64_t *)(v82 + *(int *)(v219 + 36));
    v167 = sub_10000B8A0(&qword_100038A10);
    (*(void (**)(char *, uint64_t, uint64_t))(v162 + 16))((char *)v166 + *(int *)(v167 + 28), v163, v164);
    *v166 = KeyPath;
    sub_10000E980((uint64_t)v77, v82);
    (*(void (**)(uint64_t, uint64_t))(v162 + 8))(v163, v164);
    sub_10000E988((uint64_t)v77);
    v168 = v242;
    sub_10000D180(v82, (uint64_t)v242, &qword_100038A00);
    sub_10000E4E0((uint64_t)v168, v82, &qword_100038A00);
    v169 = v238;
    *(_QWORD *)v12 = v239;
    *(_QWORD *)(v12 + 8) = v169;
    *(_BYTE *)(v12 + 16) = v237;
    v170 = v246;
    *(_QWORD *)(v12 + 24) = v246;
    *(double *)(v12 + 32) = a8;
    *(_QWORD *)(v12 + 40) = 0x3FE3333333333333;
    *(_QWORD *)(v12 + 48) = 2;
    *(_BYTE *)(v12 + 56) = 0;
    *(_QWORD *)(v12 + 64) = v236;
    *(_BYTE *)(v12 + 72) = v235;
    v171 = v234;
    *(_QWORD *)(v12 + 80) = v234;
    *(_QWORD *)(v12 + 88) = 0;
    *(_BYTE *)(v12 + 96) = 1;
    *(_QWORD *)(v12 + 104) = v233;
    *(_BYTE *)(v12 + 112) = v232;
    *(_QWORD *)(v12 + 120) = v231;
    *(_BYTE *)(v12 + 128) = v230;
    v172 = v228;
    *(_QWORD *)(v12 + 136) = v229;
    *(_QWORD *)(v12 + 144) = v172;
    v173 = sub_10000B8A0(&qword_100038B80);
    sub_10000E4E0(v82, v12 + *(int *)(v173 + 64), &qword_100038A00);
    sub_10000F0CC();
    swift_retain(v171);
    swift_bridgeObjectRetain(v170);
    sub_10000F0CC();
    swift_bridgeObjectRetain(v170);
    swift_retain(v171);
    sub_10000E500(v82, &qword_100038A00);
    sub_10000F0BC();
    swift_release(v171);
    sub_10000EDBC();
    sub_10000E944(v12, (uint64_t)&v277);
    sub_10000EA58(v164, v247);
    sub_10000E4AC(&qword_100038B58, &qword_100038B28);
    sub_10000E4AC(&qword_100038B60, &qword_100038B00);
    v174 = v249;
    v175 = sub_10000EF84();
    sub_10000EDF4(v175, v176, v177, v178, v179);
    sub_10000E988(v12);
    sub_10000E944(v174, (uint64_t)&v278);
    sub_10000EA58(v164, v254);
    v129 = sub_10000CCC8();
    sub_10000CD64(&qword_100038B68, &qword_100038AF8, &qword_100038B40, (uint64_t (*)(void))sub_10000CC44);
    v180 = sub_10000EC6C();
    sub_10000EDF4(v180, v181, v182, v183, v184);
    sub_10000E988(v174);
    sub_10000E500((uint64_t)v242, &qword_100038A00);
    sub_10000F0BC();
    swift_release(v171);
    v141 = sub_10000EDBC();
LABEL_6:
    v127 = v260;
    goto LABEL_7;
  }
  if (v92 != 1)
  {
    v185 = v252(2, &OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_title, sub_10000662C);
    v187 = v186;
    v189 = v188;
    v191 = v190;
    v192 = swift_getKeyPath(&unk_1000296F0);
    v268 = v185;
    v269 = v187;
    LOBYTE(v270) = v189 & 1;
    v271 = v191;
    v272 = v192;
    v273 = 2;
    v274 = 0;
    v193 = v220;
    static TextJustification.stretched.getter();
    v194 = sub_10000B8A0(&qword_100038B40);
    v129 = (uint64_t)sub_10000CC44;
    v195 = sub_10000CC44();
    v12 = v224;
    View.justification(_:)(v193, v194, v195);
    sub_10000ED5C(v193, *(uint64_t (**)(uint64_t, _QWORD))(v19 + 8));
    sub_10000F298();
    v196 = swift_release(v272);
    LOBYTE(v187) = v275;
    v216 = static Alignment.center.getter(v196);
    v217 = v197;
    v198 = v223;
    v199 = sub_10000F3A0();
    sub_10000A3C8(*(double *)&v199, v200, v201, v202, v93, v187, 0.0, 1, v203, 0.0, 1, 0.0, 1, v216, v217, &qword_100038AF0, &qword_100038AF8);
    sub_10000F1EC();
    sub_10000ED5C(v12, v204);
    v205 = v228;
    sub_10000EEF0(v198, v228);
    v206 = v258;
    sub_10000EB70(v205, v258);
    sub_10000EBC0(v206, v254);
    sub_10000CCC8();
    sub_10000CD64(&qword_100038B68, &qword_100038AF8, &qword_100038B40, (uint64_t (*)(void))sub_10000CC44);
    v207 = sub_10000EC6C();
    sub_10000ED94(v207, v208, v209, v210, v211);
    sub_10000EEB8(v205);
    goto LABEL_6;
  }
  v94 = v252;
  v95 = v252(1, &OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_title, sub_10000662C);
  v97 = v96;
  v99 = v98;
  v101 = v100;
  v102 = swift_getKeyPath(&unk_1000296F0);
  v268 = v95;
  v269 = v97;
  LOBYTE(v270) = v99 & 1;
  v271 = v101;
  v272 = v102;
  v273 = 1;
  v274 = 0;
  static Text.WritingMode.verticalRightToLeft.getter();
  v103 = sub_10000B8A0(&qword_100038B40);
  v104 = sub_10000CC44();
  View.writingMode(_:)(v10, v103, v104);
  v242 = *(void (**)(_QWORD, _QWORD))(v13 + 8);
  v105 = v225;
  v242(v10, v225);
  sub_10000F298();
  swift_release(v272);
  v106 = v94(0, &OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_subtitle, sub_1000068A4);
  v108 = v107;
  v268 = v106;
  v269 = v107;
  v110 = v109 & 1;
  LOBYTE(v270) = v109 & 1;
  v271 = v111;
  sub_10000F280();
  sub_10000C5D4(v106, v108, v110);
  sub_10000EDBC();
  v112 = swift_getKeyPath(&unk_1000296F0);
  v113 = v240;
  v114 = v229;
  v115 = v241;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v240 + 16))(v229, v11, v241);
  v116 = v114 + *(int *)(v222 + 36);
  *(_QWORD *)v116 = v112;
  *(_QWORD *)(v116 + 8) = 1;
  *(_BYTE *)(v116 + 16) = 0;
  (*(void (**)(uint64_t, uint64_t))(v113 + 8))(v11, v115);
  v117 = v244;
  v118 = v243;
  v119 = v245;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v244 + 104))(v243, enum case for Text.TruncationMode.tail(_:), v245);
  v120 = swift_getKeyPath(&unk_100029720);
  v121 = v230;
  v122 = v231;
  v123 = (uint64_t *)(v231 + *(int *)(v230 + 36));
  v124 = sub_10000B8A0(&qword_100038A10);
  sub_10000F31C((uint64_t)v123 + *(int *)(v124 + 28), v118, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v117 + 16));
  *v123 = v120;
  sub_10000EA24(v114, v122);
  (*(void (**)(uint64_t, uint64_t))(v117 + 8))(v118, v119);
  sub_10000E9DC(v114);
  static Text.WritingMode.verticalRightToLeft.getter();
  v125 = sub_10000C8A4();
  v126 = v234;
  View.writingMode(_:)(v10, v121, v125);
  v242(v10, v105);
  sub_10000E500(v122, &qword_1000389C0);
  v127 = v260;
  v128 = (uint64_t)v239;
  *v239 = v260;
  *(_QWORD *)(v128 + 8) = 0;
  *(_BYTE *)(v128 + 16) = 1;
  sub_10000B8A0(&qword_100038B78);
  v129 = v246;
  sub_100009FA0();
  sub_10000E944(v128, (uint64_t)&v277);
  sub_10000EBC0((uint64_t)v123, v247);
  sub_10000E4AC(&qword_100038B58, &qword_100038B28);
  sub_10000E4AC(&qword_100038B60, &qword_100038B00);
  v130 = v249;
  v131 = sub_10000EF84();
  sub_10000ED94(v131, v132, v133, v134, v135);
  v136 = v258;
  sub_10000EA24(v130, v258);
  sub_10000EA58(v136, v254);
  v137 = sub_10000CCC8();
  sub_10000CD64(&qword_100038B68, &qword_100038AF8, &qword_100038B40, (uint64_t (*)(void))sub_10000CC44);
  v12 = v256;
  _ConditionalContent<>.init(storage:)(v136, v255, v259, v137, v138);
  sub_10000E9DC(v130);
  sub_10000E988(v128);
  sub_10000F1EC();
  sub_10000ED5C(v126, v139);
  sub_10000F1EC();
  v141 = sub_10000ED5C(v129, v140);
LABEL_7:
  v212 = static VerticalAlignment.top.getter(v141);
  static VerticalAlignment.== infix(_:_:)(v127, v212);
  v213 = v257;
  sub_10000EA24(v12, v257);
  v214 = v261;
  *v261 = 0;
  *((_BYTE *)v214 + 8) = 0;
  *((_BYTE *)v214 + 9) = (v253 & 1) == 0;
  sub_10000B8A0(&qword_100038B70);
  sub_10000F174();
  sub_10000EA24(v213, (uint64_t)v214 + v215);
  sub_10000F1D8((uint64_t)v214 + *(int *)(v129 + 64));
  sub_10000E9DC(v12);
  sub_10000E9DC(v213);
}

void sub_100009FA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
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
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  sub_10000F0E4();
  v59 = v3;
  v60 = v2;
  v62 = v4;
  v61 = v5;
  v67 = v6;
  v66 = sub_10000B8A0(&qword_100038B88);
  sub_10000E858();
  __chkstk_darwin(v7, v8);
  sub_10000E8D8();
  v63 = sub_10000B8A0(&qword_100038B90);
  sub_10000E858();
  __chkstk_darwin(v9, v10);
  sub_10000E874();
  v65 = v11;
  v64 = sub_10000B8A0(&qword_100038B98);
  sub_10000E858();
  __chkstk_darwin(v12, v13);
  v15 = (char *)&v58 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000B8A0(&qword_100038BA0);
  sub_10000E858();
  __chkstk_darwin(v16, v17);
  sub_10000F024();
  v20 = v18 - v19;
  v23 = __chkstk_darwin(v21, v22);
  v25 = (char *)&v58 - v24;
  __chkstk_darwin(v23, v26);
  v28 = (char *)&v58 - v27;
  v29 = sub_10000B8A0(&qword_100038B10);
  __chkstk_darwin(v29, v30);
  sub_10000EE64();
  v33 = __chkstk_darwin(v31, v32);
  v35 = (char *)&v58 - v34;
  v37 = __chkstk_darwin(v33, v36);
  v39 = (char *)&v58 - v38;
  v40 = static HorizontalAlignment.leading.getter(v37);
  if ((static HorizontalAlignment.== infix(_:_:)(v60, v40) & 1) != 0)
  {
    sub_10000F32C((uint64_t)v39, v61);
    v41 = sub_10000B8A0(&qword_100038B08);
    v42 = v41;
    if ((v62 & 1) != 0)
    {
      sub_10000EB68((uint64_t)v28, v59, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 16));
      v43 = 0;
    }
    else
    {
      v43 = 1;
    }
    sub_10000BA28((uint64_t)v28, v43, 1, v42);
    sub_10000F32C((uint64_t)v35, (uint64_t)v39);
    sub_10000E980((uint64_t)v28, v20);
    sub_10000F32C((uint64_t)v15, (uint64_t)v35);
    v48 = sub_10000B8A0(&qword_100038BC0);
    sub_10000E980(v20, (uint64_t)&v15[*(int *)(v48 + 48)]);
    sub_10000E988(v20);
    sub_10000F07C((uint64_t)v35);
    v49 = v65;
    sub_10000E4E0((uint64_t)v15, v65, &qword_100038B98);
    sub_10000EA58(v49, v63);
    sub_10000E4AC(&qword_100038BB0, &qword_100038B98);
    v51 = v50;
    sub_10000E4AC(&qword_100038BB8, &qword_100038B88);
    _ConditionalContent<>.init(storage:)(v49, v64, v66, v51, v52);
    sub_10000E500((uint64_t)v15, &qword_100038B98);
    sub_10000E988((uint64_t)v28);
    sub_10000F07C((uint64_t)v39);
  }
  else
  {
    v44 = v61;
    v45 = sub_10000B8A0(&qword_100038B08);
    v46 = v45;
    if ((v62 & 1) != 0)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v45 - 8) + 16))(v25, v59, v45);
      v47 = 0;
    }
    else
    {
      v47 = 1;
    }
    sub_10000BA28((uint64_t)v25, v47, 1, v46);
    sub_10000F324((uint64_t)v35, v44);
    sub_10000EA24((uint64_t)v25, v20);
    sub_10000F324(v0, (uint64_t)v35);
    sub_10000EA24(v20, v1);
    v53 = sub_10000B8A0(&qword_100038BA8);
    sub_10000F324(v1 + *(int *)(v53 + 48), v0);
    sub_10000F07C(v0);
    sub_10000E9DC(v20);
    v54 = v65;
    sub_10000E4E0(v1, v65, &qword_100038B88);
    sub_10000EBC0(v54, v63);
    sub_10000E4AC(&qword_100038BB0, &qword_100038B98);
    v56 = v55;
    sub_10000E4AC(&qword_100038BB8, &qword_100038B88);
    _ConditionalContent<>.init(storage:)(v54, v64, v66, v56, v57);
    sub_10000E500(v1, &qword_100038B88);
    sub_10000F07C((uint64_t)v35);
    sub_10000E9DC((uint64_t)v25);
  }
  sub_10000E8C0();
}

void *sub_10000A3C8@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v32;
  double v33;
  double v34;
  uint64_t v36;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int v44;
  double v45;
  double v46;
  double v47;
  double v48;
  _QWORD __src[15];

  v18 = a9;
  v19 = a16;
  v21 = a14;
  v20 = a15;
  v22 = a12;
  v23 = a10;
  v24 = a2 & 1;
  v25 = a1;
  if ((_DWORD)v24)
    v25 = -INFINITY;
  v26 = a4 & 1;
  v27 = a3;
  if ((_DWORD)v26)
    v27 = v25;
  v28 = a6 & 1;
  v29 = a8 & 1;
  v30 = a5;
  if ((a6 & 1) != 0)
    v30 = v27;
  if (v25 > v27 || v27 > v30)
    goto LABEL_22;
  v32 = a7;
  if ((a8 & 1) != 0)
    v32 = -INFINITY;
  v33 = a10;
  if ((a11 & 1) != 0)
    v33 = v32;
  v34 = a12;
  if ((a13 & 1) != 0)
    v34 = v33;
  if (v32 > v33 || v33 > v34)
  {
LABEL_22:
    v47 = a7;
    v48 = a5;
    v45 = a1;
    v46 = a3;
    v44 = v24;
    v36 = v26;
    v38 = static os_log_type_t.fault.getter();
    v39 = (void *)static Log.runtimeIssuesLog.getter();
    v40 = v38;
    v18 = a9;
    os_log(_:dso:log:_:_:)(v40, &_mh_execute_header, v39, "Contradictory frame constraints specified.", 42, 2, &_swiftEmptyArrayStorage);

    v26 = v36;
    v21 = a14;
    v20 = a15;
    v24 = v44;
    v23 = a10;
    v22 = a12;
    a1 = v45;
    a3 = v46;
    a7 = v47;
    a5 = v48;
    v19 = a16;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(__src, *(_QWORD *)&a1, v24, *(_QWORD *)&a3, v26, *(_QWORD *)&a5, v28, *(_QWORD *)&a7, v29, *(_QWORD *)&v23, a11 & 1, *(_QWORD *)&v22, a13 & 1, v21, v20);
  v41 = sub_10000B8A0(v19);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 16))(v18, v17, v41);
  v42 = sub_10000B8A0(a17);
  return memcpy((void *)(v18 + *(int *)(v42 + 36)), __src, 0x70uLL);
}

void sub_10000A584()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(_QWORD);
  char v5;
  char v6;
  uint64_t v7;
  int v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void (*v55)(_QWORD);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD *v60;
  uint64_t v61;
  uint64_t v62;

  sub_10000F0E4();
  v58 = v2;
  v59 = v3;
  v55 = v4;
  v6 = v5;
  v52 = v7;
  v9 = v8;
  HIDWORD(v51) = v8;
  v11 = v10;
  v60 = v12;
  sub_10000B8A0(&qword_1000389A0);
  sub_10000E858();
  __chkstk_darwin(v13, v14);
  sub_10000E874();
  v56 = v15;
  v16 = sub_10000EF04();
  sub_10000ED84();
  __chkstk_darwin(v17, v18);
  sub_10000E8D8();
  v19 = (int *)sub_10000B8A0(&qword_1000389A8);
  sub_10000E858();
  __chkstk_darwin(v20, v21);
  sub_10000E954();
  v57 = v22;
  v25 = __chkstk_darwin(v23, v24);
  v27 = (char *)&v49 - v26;
  __chkstk_darwin(v25, v28);
  v30 = (char *)&v49 - v29;
  v49 = v11;
  sub_100008F9C(v9);
  v32 = v31;
  v53 = v31;
  v50 = v33;
  v34 = static HorizontalAlignment.trailing.getter();
  HIDWORD(v54) = static HorizontalAlignment.== infix(_:_:)(v32, v34);
  v55(0);
  sub_10000F228();
  v36 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 16);
  v37 = v36(v0, v35 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_widgetFamily, v16);
  v38 = static HorizontalAlignment.center.getter(v37);
  v39 = static VerticalAlignment.bottom.getter();
  v36((uint64_t)&v27[v19[9]], v0, v16);
  v27[v19[10]] = 0;
  *(_QWORD *)&v27[v19[11]] = v38;
  *(_QWORD *)&v27[v19[12]] = v39;
  v40 = v56;
  sub_10000A7F0(v50, HIDWORD(v51), v52, v6 & 1, v49, v58, v59, v41, v49, v50, v51, v52, v53, v54, (uint64_t)v55, v56, v57, v58, v59,
    (uint64_t)v60,
    v61,
    v62);
  sub_10000ECE0();
  sub_10000D180(v40, (uint64_t)v27, &qword_1000389A0);
  sub_10000EEF0((uint64_t)v27, (uint64_t)v30);
  v43 = static HorizontalAlignment.leading.getter(v42);
  LOBYTE(v40) = static HorizontalAlignment.== infix(_:_:)(v53, v43);
  v44 = v57;
  sub_10000EB70((uint64_t)v30, v57);
  v45 = v60;
  *v60 = 0;
  *((_BYTE *)v45 + 8) = 0;
  *((_BYTE *)v45 + 9) = (v54 & 0x100000000) == 0;
  v46 = v45;
  sub_10000B8A0(&qword_1000389B0);
  sub_10000F174();
  sub_10000EB70(v44, (uint64_t)v46 + v47);
  v48 = (char *)v46 + *((int *)v27 + 16);
  *(_QWORD *)v48 = 0;
  v48[8] = 0;
  v48[9] = (v40 & 1) == 0;
  sub_10000EEB8((uint64_t)v30);
  sub_10000EEB8(v44);
  sub_10000E8C0();
}

void sub_10000A7F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  uint64_t v28;
  int v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  unsigned __int8 v35;
  int v36;
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
  unint64_t v88;
  uint64_t v89;
  uint64_t *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
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
  uint64_t *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  double v124;
  uint64_t v125;
  uint64_t v126;
  char v127;
  char v128;
  uint64_t v129;
  uint64_t KeyPath;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t *v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  uint64_t v143;
  uint64_t (*v144)(uint64_t, _QWORD);
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  char v149;
  double v150;
  char v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  unint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  int v165;
  uint64_t v166;
  void (*v167)(uint64_t);
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  double v177;
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
  int v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  char v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;

  sub_10000E914();
  a21 = v25;
  a22 = v26;
  v167 = v27;
  v181 = v28;
  v165 = v29;
  v177 = v30;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v37 = type metadata accessor for TextJustification(0);
  sub_10000EDB0(v37, (uint64_t)&a15);
  v175 = v38;
  sub_10000E868();
  __chkstk_darwin(v39, v40);
  sub_10000E874();
  sub_10000E8B4(v41);
  v166 = sub_10000B8A0(&qword_1000389B8);
  sub_10000E858();
  __chkstk_darwin(v42, v43);
  sub_10000E874();
  sub_10000E8B4(v44);
  v169 = sub_10000B8A0(&qword_1000389C0);
  sub_10000E858();
  __chkstk_darwin(v45, v46);
  sub_10000E874();
  sub_10000E8B4(v47);
  v173 = sub_10000B8A0(&qword_1000389C8);
  v48 = *(_QWORD *)(v173 - 8);
  __chkstk_darwin(v173, v49);
  sub_10000E8B4((uint64_t)&v163 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0));
  v51 = sub_10000B8A0(&qword_1000389D0);
  sub_10000E858();
  __chkstk_darwin(v52, v53);
  sub_10000E954();
  sub_10000F0FC();
  __chkstk_darwin(v54, v55);
  sub_10000EF18();
  sub_10000E8B4(v56);
  v191 = sub_10000B8A0(&qword_1000389D8);
  sub_10000E858();
  __chkstk_darwin(v57, v58);
  sub_10000E874();
  v194 = v59;
  v182 = sub_10000B8A0(&qword_1000389E0);
  sub_10000E858();
  __chkstk_darwin(v60, v61);
  sub_10000E874();
  v183 = v62;
  v193 = sub_10000B8A0(&qword_1000389E8);
  sub_10000E858();
  __chkstk_darwin(v63, v64);
  sub_10000E874();
  v187 = v65;
  v66 = sub_10000F18C();
  v185 = *(_QWORD *)(v66 - 8);
  v186 = v66;
  sub_10000E868();
  __chkstk_darwin(v67, v68);
  sub_10000E874();
  v184 = v69;
  v180 = sub_10000B8A0(&qword_1000389F0);
  v179 = *(_QWORD *)(v180 - 8);
  sub_10000E868();
  __chkstk_darwin(v70, v71);
  sub_10000EB50();
  v72 = sub_10000B8A0(&qword_1000389F8);
  sub_10000E858();
  __chkstk_darwin(v73, v74);
  sub_10000F04C();
  v178 = sub_10000B8A0(&qword_100038A00);
  sub_10000E858();
  __chkstk_darwin(v75, v76);
  sub_10000F024();
  sub_10000F0AC();
  __chkstk_darwin(v77, v78);
  sub_10000EF18();
  sub_10000E8B4(v79);
  sub_10000B8A0(&qword_100038A08);
  sub_10000E858();
  __chkstk_darwin(v80, v81);
  sub_10000E954();
  v192 = v82;
  __chkstk_darwin(v83, v84);
  sub_10000EF18();
  v190 = v85;
  v86 = static VerticalAlignment.bottom.getter();
  v188 = v32;
  v189 = static VerticalAlignment.== infix(_:_:)(v32, v86);
  if (v36)
  {
    if (v36 != 1)
    {
      LODWORD(v187) = v165 & 1;
      v121 = sub_10000F180();
      v123 = v122;
      v124 = v34;
      v126 = v125;
      v197 = v121;
      v198 = v122;
      v181 = v51;
      v128 = v127 & 1;
      LOBYTE(v199) = v127 & 1;
      v200 = v125;
      sub_10000EF24();
      sub_10000C5D4(v121, v123, v128);
      v129 = v126;
      v34 = v124;
      swift_bridgeObjectRelease(v129);
      KeyPath = swift_getKeyPath(&unk_1000296F0);
      v131 = v179;
      v132 = v168;
      sub_10000EB68(v168, v24, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v179 + 16));
      v133 = v132 + *(int *)(v166 + 36);
      *(_QWORD *)v133 = KeyPath;
      *(_QWORD *)(v133 + 8) = 1;
      *(_BYTE *)(v133 + 16) = 0;
      sub_10000EAF0(v24, *(uint64_t (**)(uint64_t, uint64_t))(v131 + 8));
      v134 = v185;
      v135 = v48;
      v48 = v184;
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v185 + 104))(v184, enum case for Text.TruncationMode.tail(_:), v186);
      v136 = swift_getKeyPath(&unk_100029720);
      v137 = v169;
      v138 = v170;
      v139 = (uint64_t *)(v170 + *(int *)(v169 + 36));
      v140 = sub_10000B8A0(&qword_100038A10);
      sub_10000EB68((uint64_t)v139 + *(int *)(v140 + 28), v48, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v134 + 16));
      *v139 = v136;
      sub_10000EA24(v132, v138);
      sub_10000EAF0(v48, *(uint64_t (**)(uint64_t, uint64_t))(v134 + 8));
      sub_10000E9DC(v132);
      v141 = v174;
      static TextJustification.stretched.getter();
      v91 = (uint64_t)sub_10000C8A4;
      v142 = sub_10000C8A4();
      v143 = v172;
      View.justification(_:)(v141, v137, v142);
      sub_10000F1EC();
      sub_10000ED5C(v141, v144);
      sub_10000E500(v138, &qword_1000389C0);
      v161 = static Alignment.center.getter(v145);
      v162 = v146;
      v147 = v171;
      v148 = sub_10000F3A0();
      sub_10000A3C8(*(double *)&v148, v149, v150, v151, v177, v187, 0.0, 1, v152, 0.0, 1, 0.0, 1, v161, v162, &qword_1000389C8, &qword_1000389D0);
      sub_10000ED5C(v143, *(uint64_t (**)(uint64_t, _QWORD))(v135 + 8));
      v153 = v176;
      sub_10000EEF0(v147, v176);
      v154 = v194;
      sub_10000EB70(v153, v194);
      sub_10000EBC0(v154, v191);
      v155 = sub_10000C9D0();
      sub_10000CD64(&qword_100038A60, &qword_1000389D0, &qword_1000389C0, (uint64_t (*)(void))sub_10000C8A4);
      sub_10000EFE4();
      _ConditionalContent<>.init(storage:)(v154, v193, v181, v155, v156);
      v94 = v153;
      v120 = &qword_1000389D0;
      goto LABEL_7;
    }
    v87 = v183;
    sub_10000EBC0(v183, v182);
    v88 = sub_10000CA3C();
    v89 = v187;
    _ConditionalContent<>.init(storage:)(v87, v178, &type metadata for EmptyView, v88, &protocol witness table for EmptyView);
    v90 = &qword_1000389E8;
    v91 = v194;
    sub_10000E980(v89, v194);
    sub_10000EA58(v91, v191);
    sub_10000C9D0();
    sub_10000CD64(&qword_100038A60, &qword_1000389D0, &qword_1000389C0, (uint64_t (*)(void))sub_10000C8A4);
    sub_10000EFE4();
    sub_10000ED94(v91, v193, v51, v92, v93);
    v94 = v89;
  }
  else
  {
    v95 = sub_10000F180();
    v177 = v34;
    v181 = v51;
    v197 = v95;
    v198 = v96;
    LOBYTE(v199) = v97 & 1;
    v200 = v98;
    sub_10000EF24();
    v99 = sub_10000EBA4(v95);
    v167(v99);
    v101 = v100;
    v195 = 0;
    v196 = 1;
    v102 = sub_10000B8A0(&qword_100038A70);
    State.init(wrappedValue:)(&v197, &v195, v102);
    v103 = v197;
    LOBYTE(v95) = v198;
    v104 = v199;
    v105 = v179;
    sub_10000F31C(v22, v24, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v179 + 16));
    *(_QWORD *)(v22 + *(int *)(v72 + 36)) = v101;
    sub_10000F2FC();
    *(_QWORD *)(v106 + 8) = v107;
    *(_QWORD *)(v106 + 16) = 1;
    *(_BYTE *)(v106 + 24) = 0;
    *(_QWORD *)(v106 + 32) = v103;
    *(_BYTE *)(v106 + 40) = v95;
    *(_QWORD *)(v106 + 48) = v104;
    v34 = v177;
    sub_10000EB98(*(uint64_t (**)(uint64_t, uint64_t))(v105 + 8));
    v108 = v184;
    v48 = v185;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v185 + 104))(v184, enum case for Text.TruncationMode.tail(_:), v186);
    v109 = swift_getKeyPath(&unk_100029720);
    v110 = v178;
    v111 = (uint64_t *)(v23 + *(int *)(v178 + 36));
    v112 = sub_10000B8A0(&qword_100038A10);
    sub_10000F31C((uint64_t)v111 + *(int *)(v112 + 28), v108, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v48 + 16));
    *v111 = v109;
    sub_10000EA24(v22, v23);
    sub_10000EB98(*(uint64_t (**)(uint64_t, uint64_t))(v48 + 8));
    sub_10000E9DC(v22);
    v90 = &qword_100038A00;
    v113 = v164;
    sub_10000D180(v23, v164, &qword_100038A00);
    v114 = v183;
    sub_10000E980(v113, v183);
    sub_10000EA58(v114, v182);
    v115 = sub_10000CA3C();
    v116 = v187;
    _ConditionalContent<>.init(storage:)(v114, v110, &type metadata for EmptyView, v115, &protocol witness table for EmptyView);
    v117 = v194;
    sub_10000EA24(v116, v194);
    sub_10000EA58(v117, v191);
    v91 = sub_10000C9D0();
    sub_10000CD64(&qword_100038A60, &qword_1000389D0, &qword_1000389C0, (uint64_t (*)(void))sub_10000C8A4);
    sub_10000EFE4();
    sub_10000EDF4(v117, v193, v181, v118, v119);
    sub_10000E9DC(v116);
    v94 = v113;
  }
  v120 = v90;
LABEL_7:
  sub_10000E500(v94, v120);
  v158 = static VerticalAlignment.top.getter(v157);
  static VerticalAlignment.== infix(_:_:)(v188, v158);
  v159 = v192;
  sub_10000EA24(v48, v192);
  **(_QWORD **)&v34 = 0;
  *(_BYTE *)(*(_QWORD *)&v34 + 8) = 0;
  *(_BYTE *)(*(_QWORD *)&v34 + 9) = (v189 & 1) == 0;
  sub_10000B8A0(&qword_100038A68);
  sub_10000F174();
  sub_10000EA24(v159, *(_QWORD *)&v34 + v160);
  sub_10000F1D8(*(_QWORD *)&v34 + *(int *)(v91 + 64));
  sub_10000E9DC(v48);
  sub_10000E9DC(v159);
  sub_10000E898();
}

uint64_t sub_10000B16C()
{
  uint64_t v0;

  v0 = type metadata accessor for CharacterSet(0);
  sub_10000CE10(v0, qword_1000385C8);
  sub_10000CDF8(v0, (uint64_t)qword_1000385C8);
  return sub_10000B1B4();
}

uint64_t sub_10000B1B4()
{
  uint64_t v0;
  uint64_t v1;
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
  char *v16;
  uint64_t v17;
  uint64_t (*v18)(char *, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;

  v0 = type metadata accessor for CharacterSet(0);
  v1 = *(_QWORD *)(v0 - 8);
  v3 = __chkstk_darwin(v0, v2);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __chkstk_darwin(v3, v6);
  v9 = (char *)&v22 - v8;
  v11 = __chkstk_darwin(v7, v10);
  v13 = (char *)&v22 - v12;
  __chkstk_darwin(v11, v14);
  v16 = (char *)&v22 - v15;
  v17 = CharacterSet.init(charactersIn:)(0x10000000000003B9, 0x800000010002B120);
  static CharacterSet.punctuationCharacters.getter(v17);
  CharacterSet.union(_:)(v5);
  v18 = *(uint64_t (**)(char *, uint64_t))(v1 + 8);
  v19 = v18(v5, v0);
  static CharacterSet.whitespacesAndNewlines.getter(v19);
  CharacterSet.union(_:)(v5);
  v18(v5, v0);
  v20 = v18(v9, v0);
  static CharacterSet.decimalDigits.getter(v20);
  CharacterSet.union(_:)(v9);
  v18(v9, v0);
  v18(v13, v0);
  return v18(v16, v0);
}

void (*sub_10000B32C@<X0>(void (**a1)(uint64_t a1@<X0>, uint64_t a2@<X8>)@<X8>))(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v1;
  void (*result)(uint64_t@<X0>, uint64_t@<X8>);
  void (*v4)(uint64_t@<X0>, uint64_t@<X8>);

  result = sub_100004C80(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_10000B354(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v8;
  id v9;

  v3 = sub_10000EF04();
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  sub_10000EB38();
  sub_10000EB68(v1, a1 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_widgetFamily, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16));
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 88))(v1, v3);
  if (v6 == enum case for WidgetFamily.systemSmall(_:) || v6 == enum case for WidgetFamily.systemMedium(_:))
  {
LABEL_9:
    v8 = 11;
    goto LABEL_10;
  }
  if (v6 != enum case for WidgetFamily.systemLarge(_:))
  {
    if (v6 != enum case for WidgetFamily.systemExtraLarge(_:))
      sub_10000EAF0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
    goto LABEL_9;
  }
  v8 = 6;
LABEL_10:
  v9 = (id)PXCappedFontWithTextStyleSymbolicTraits(v8, 2, 11);
  Font.init(_:)(v9);
  sub_10000E9E4();
}

void sub_10000B440(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
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
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;

  v4 = type metadata accessor for WidgetFamily(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_10000B8A0(&qword_100038CC8);
  __chkstk_darwin(v9, v10);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_10000B8A0(&qword_100038CD0);
  v15 = __chkstk_darwin(v13, v14);
  v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15, v18);
  v20 = (char *)&v28 - v19;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a1 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_widgetFamily, v4);
  v21 = swift_retain(a1);
  v22 = static HorizontalAlignment.leading.getter(v21);
  v23 = static VerticalAlignment.bottom.getter();
  v24 = sub_1000043CC((uint64_t)v8, 2, v22, v23, a1, (uint64_t)v12);
  v25 = static HorizontalAlignment.leading.getter(v24);
  sub_10000E4E0((uint64_t)v12, (uint64_t)v17, &qword_100038CC8);
  v26 = (uint64_t *)&v17[*(int *)(v13 + 36)];
  *v26 = v25;
  v26[1] = (uint64_t)sub_10000B7E4;
  v26[2] = 0;
  sub_10000E500((uint64_t)v12, &qword_100038CC8);
  sub_10000D180((uint64_t)v17, (uint64_t)v20, &qword_100038CD0);
  sub_10000E4E0((uint64_t)v20, (uint64_t)v17, &qword_100038CD0);
  sub_10000E4E0((uint64_t)v17, a2, &qword_100038CD0);
  v27 = a2 + *(int *)(sub_10000B8A0(&qword_100038CD8) + 48);
  *(_QWORD *)v27 = 0;
  *(_BYTE *)(v27 + 8) = 1;
  sub_10000E500((uint64_t)v20, &qword_100038CD0);
  sub_10000E500((uint64_t)v17, &qword_100038CD0);
}

uint64_t sub_10000B64C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD v33[2];

  v4 = *(_QWORD *)(a1 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_title + 8);
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_title);
    v6 = *(_QWORD *)(a1 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_title + 8);
  }
  else
  {
    v5 = 0;
    v6 = 0xE000000000000000;
  }
  v33[0] = v5;
  v33[1] = v6;
  v7 = sub_10000CB8C();
  swift_bridgeObjectRetain(v4);
  v8 = Text.init<A>(_:)(v33, &type metadata for String, v7);
  v10 = v9;
  v12 = v11;
  v14 = v13 & 1;
  sub_10000B354(a1);
  v16 = v15;
  v17 = Text.font(_:)(v15, v8, v10, v14, v12);
  v19 = v18;
  v21 = v20;
  v23 = v22;
  swift_release(v16);
  LOBYTE(v16) = v21 & 1;
  sub_10000C5D4(v8, v10, v14);
  v24 = swift_bridgeObjectRelease(v12);
  v25 = static Color.white.getter(v24);
  v26 = Text.foregroundColor(_:)(v25, v17, v19, v21 & 1, v23);
  v28 = v27;
  LOBYTE(v14) = v29;
  v31 = v30;
  swift_release(v25);
  sub_10000C5D4(v17, v19, v16);
  swift_bridgeObjectRelease(v23);
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  *(_QWORD *)(a2 + 16) = v26;
  *(_QWORD *)(a2 + 24) = v28;
  *(_BYTE *)(a2 + 32) = v14 & 1;
  *(_QWORD *)(a2 + 40) = v31;
  sub_10000CDE8(v26, v28, v14 & 1);
  swift_bridgeObjectRetain(v31);
  sub_10000C5D4(v26, v28, v14 & 1);
  return swift_bridgeObjectRelease(v31);
}

uint64_t sub_10000B7E4()
{
  uint64_t v0;

  v0 = static HorizontalAlignment.leading.getter();
  return ViewDimensions.subscript.getter(v0);
}

void (*sub_10000B808@<X0>(void (**a1)(uint64_t a1)@<X8>))(uint64_t a1)
{
  uint64_t *v1;
  void (*result)(uint64_t);
  void (*v4)(uint64_t);

  result = sub_100004CB0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t variable initialization expression of PhotosReliveWidgetView.entry()
{
  return 0;
}

uint64_t variable initialization expression of PhotosReliveWidgetView._widgetFamily@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;

  *a1 = swift_getKeyPath(&unk_100029290);
  v2 = sub_10000B8A0(&qword_100038640);
  return swift_storeEnumTagMultiPayload(a1, v2, 0);
}

void sub_10000B884()
{
  EnvironmentValues.widgetFamily.getter();
  sub_10000EACC();
}

uint64_t sub_10000B8A0(uint64_t *a1)
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

uint64_t variable initialization expression of PhotosReliveWidgetEntry.viewModel()
{
  return 0;
}

uint64_t sub_10000B8E8(__int128 *a1)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  if (!sub_10000EEDC())
    return v2;
  v3 = v2;
  return swift_getOpaqueTypeMetadata2(0, &v3, &opaque type descriptor for <<opaque return type of WidgetConfiguration._containerBackgroundRemovable(_:)>>, 0);
}

void sub_10000B93C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = *a1;
  v2 = sub_10000EEDC();
  if ((_DWORD)v2)
    sub_10000E908(v2, (uint64_t)&opaque type descriptor for <<opaque return type of WidgetConfiguration._containerBackgroundRemovable(_:)>>, v3, v4, v5, v6, v7, v8, v1);
  sub_10000EEF8();
}

uint64_t sub_10000B978(uint64_t *a1)
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

void type metadata accessor for CGImage(uint64_t a1)
{
  sub_10000E094(a1, &qword_100038698, (uint64_t)&unk_100035798);
}

void type metadata accessor for PXTimelineContentType(uint64_t a1)
{
  sub_10000E094(a1, &qword_1000386A0, (uint64_t)&unk_1000357C8);
}

uint64_t sub_10000B9FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000BA08);
}

uint64_t sub_10000BA0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_10000BA18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000BA24);
}

uint64_t sub_10000BA28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t type metadata accessor for PhotosReliveWidgetPlaceholderContent(uint64_t a1)
{
  return sub_10000CE64(a1, qword_100038700, (uint64_t)&nominal type descriptor for PhotosReliveWidgetPlaceholderContent);
}

void type metadata accessor for PhotosReliveWidgetFallbackContent()
{
  sub_10000F2E0();
}

void type metadata accessor for PhotosReliveWidgetFeaturedPhotoContent()
{
  sub_10000F2E0();
}

void sub_10000BA64(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((*(_DWORD *)(*(_QWORD *)(a3 - 8) + 80) & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
  }
  else
  {
    v6 = sub_10000EAE8();
    sub_10000E990(v6);
    v7 = *(int *)(a3 + 20);
    v8 = *(uint64_t *)((char *)a2 + v7);
    *(uint64_t *)((char *)a1 + v7) = v8;
  }
  swift_retain(v8);
  sub_10000E9E4();
}

uint64_t sub_10000BACC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000EAE8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return swift_release(*(_QWORD *)(a1 + *(int *)(a2 + 20)));
}

void sub_10000BB0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_10000E930();
  sub_10000EAE0(v2, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  v4 = *(int *)(v0 + 20);
  v5 = *(_QWORD *)(v1 + v4);
  *(_QWORD *)(v2 + v4) = v5;
  swift_retain(v5);
  sub_10000E9E4();
}

void sub_10000BB50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_10000E930();
  sub_10000EAE0(v2, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 24));
  v4 = *(int *)(v0 + 20);
  v5 = *(_QWORD *)(v1 + v4);
  *(_QWORD *)(v2 + v4) = v5;
  swift_retain(v5);
  sub_10000EEC0();
  sub_10000E9E4();
}

void sub_10000BB9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v3 = sub_10000E930();
  sub_10000EAE0(v2, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  *(_QWORD *)(v2 + *(int *)(v0 + 20)) = *(_QWORD *)(v1 + *(int *)(v0 + 20));
  sub_10000E9E4();
}

void sub_10000BBDC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_10000E930();
  sub_10000EAE0(v2, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40));
  v4 = *(int *)(v0 + 20);
  v5 = *(_QWORD *)(v2 + v4);
  *(_QWORD *)(v2 + v4) = *(_QWORD *)(v1 + v4);
  swift_release(v5);
  sub_10000E9E4();
}

uint64_t sub_10000BC24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000BC30);
}

uint64_t sub_10000BC34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;

  v6 = sub_10000EAE8();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return sub_10000BA0C(a1, a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  return (v8 + 1);
}

uint64_t sub_10000BCA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000BCB4);
}

void sub_10000BCB8(uint64_t a1, int a2, int a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (*(_DWORD *)(*(_QWORD *)(sub_10000EAE8() - 8) + 84) == a3)
  {
    v7 = sub_10000F200();
    sub_10000BA28(v7, v8, v9, v10);
  }
  else
  {
    *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
    sub_10000E9E4();
  }
}

uint64_t type metadata accessor for PhotosReliveWidgetMemoryContent(uint64_t a1)
{
  return sub_10000CE64(a1, qword_100038790, (uint64_t)&nominal type descriptor for PhotosReliveWidgetMemoryContent);
}

void sub_10000BD28(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[2];

  v2 = type metadata accessor for Text.Measurements(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.NativeObject + 64;
    swift_initStructMetadata(a1, 256, 2, v4, a1 + 16);
  }
  sub_10000EEF8();
}

void sub_10000BD94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000C404(a1, a2, a3, &qword_1000387C8, type metadata accessor for PhotosReliveWidgetMemoryContent, (uint64_t)&unk_1000294CC, (uint64_t)&unk_100030824);
}

void sub_10000BDB8(uint64_t a1)
{
  uint64_t v2;

  sub_10000BDF4(&qword_100038818, type metadata accessor for PhotosReliveWidgetMemoryContent);
  *(_QWORD *)(a1 + 8) = v2;
}

void sub_10000BDF4(unint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = a2(255);
    atomic_store(sub_10000F15C(v3), a1);
  }
  sub_10000EACC();
}

void sub_10000BE28(uint64_t a1)
{
  uint64_t v2;

  sub_10000BDF4(&qword_100038820, type metadata accessor for PhotosReliveWidgetMemoryContent);
  *(_QWORD *)(a1 + 8) = v2;
}

uint64_t sub_10000BE64(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000307D8, 1);
}

unint64_t sub_10000BE74(uint64_t a1)
{
  unint64_t result;

  result = sub_10000BE98();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10000BE98()
{
  unint64_t result;

  result = qword_100038870;
  if (!qword_100038870)
  {
    result = swift_getWitnessTable(&unk_100029650, &unk_100035810);
    atomic_store(result, (unint64_t *)&qword_100038870);
  }
  return result;
}

uint64_t sub_10000BED4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000307B0, 1);
}

unint64_t sub_10000BEE4(uint64_t a1)
{
  unint64_t result;

  result = sub_10000BF08();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10000BF08()
{
  unint64_t result;

  result = qword_1000388C0;
  if (!qword_1000388C0)
  {
    result = swift_getWitnessTable(&unk_100029600, &unk_1000357E8);
    atomic_store(result, (unint64_t *)&qword_1000388C0);
  }
  return result;
}

void sub_10000BF44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000C404(a1, a2, a3, &qword_1000388C8, type metadata accessor for PhotosReliveWidgetPlaceholderContent, (uint64_t)&unk_10002955C, (uint64_t)&unk_100030824);
}

void sub_10000BF68(uint64_t a1)
{
  uint64_t v2;

  sub_10000BDF4(&qword_100038918, type metadata accessor for PhotosReliveWidgetPlaceholderContent);
  *(_QWORD *)(a1 + 8) = v2;
}

void sub_10000BFA4(uint64_t a1)
{
  uint64_t v2;

  sub_10000BDF4(&qword_100038920, type metadata accessor for PhotosReliveWidgetPlaceholderContent);
  *(_QWORD *)(a1 + 8) = v2;
}

uint64_t sub_10000BFE0()
{
  return EnvironmentValues.widgetRenderingMode.getter();
}

void sub_10000C000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_10000C7DC(a1, a2, a3, a4, (uint64_t (*)(_QWORD))&type metadata accessor for WidgetRenderingMode, (void (*)(char *))&EnvironmentValues.widgetRenderingMode.setter);
}

void sub_10000C014()
{
  uint64_t *v0;

  sub_10000C11C(*v0, (void (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10000C034(uint64_t a1)
{
  uint64_t *v1;

  return sub_10000C04C(a1, *v1);
}

uint64_t sub_10000C04C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_10000F274(a1, a2);
  v5 = v4;
  String.hash(into:)(v2, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

uint64_t sub_10000C084(uint64_t a1)
{
  uint64_t *v1;

  return sub_10000C09C(a1, *v1);
}

uint64_t sub_10000C09C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[9];

  v3 = sub_10000F274(a1, a2);
  v5 = v4;
  Hasher.init(_seed:)(v7, v2);
  String.hash(into:)(v7, v3, v5);
  Hasher._finalize()();
  sub_10000F268();
  return v2;
}

void sub_10000C0FC()
{
  uint64_t *v0;

  sub_10000C11C(*v0, (void (*)(uint64_t))&String._bridgeToObjectiveC());
}

void sub_10000C11C(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v5 = v4;
  a2(v3);
  swift_bridgeObjectRelease(v5);
  sub_10000EACC();
}

uint64_t sub_10000C150(uint64_t a1, id *a2)
{
  return sub_10000C164(a1, a2);
}

uint64_t sub_10000C164(uint64_t a1, id *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  sub_10000EF44(a1, a2);
  v6 = 0;
  v7 = 0;
  result = static String._forceBridgeFromObjectiveC(_:result:)(v3, &v6);
  if (v7)
  {
    String._bridgeToObjectiveC()();
    result = sub_10000F168();
  }
  else
  {
    v4 = 0;
  }
  *v2 = v4;
  return result;
}

uint64_t sub_10000C1C4(uint64_t a1, id *a2)
{
  return sub_10000C1DC(a1, a2) & 1;
}

uint64_t sub_10000C1DC(uint64_t a1, id *a2)
{
  _QWORD *v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  NSString v6;
  uint64_t v8;
  uint64_t v9;

  sub_10000EF44(a1, a2);
  v8 = 0;
  v9 = 0;
  v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(v3, &v8);
  v5 = v9;
  if (v9)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *v2 = v6;
  return v4 & 1;
}

void sub_10000C24C(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  sub_10000C270(a1);
  *a2 = v3;
}

void sub_10000C270(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v2 = v1;
  String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  sub_10000EACC();
}

void sub_10000C2A0(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;

  sub_10000C2D0();
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3 & 1;
}

void sub_10000C2D8(_QWORD *a1@<X8>)
{
  uint64_t v2;

  PhotosReliveWidget.init()();
  *a1 = v2;
  sub_10000EACC();
}

void sub_10000C2FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000C404(a1, a2, a3, &qword_100038920, type metadata accessor for PhotosReliveWidgetPlaceholderContent, (uint64_t)&unk_100029540, (uint64_t)&unk_10003077C);
}

void sub_10000C320(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000C374(a1, a2, a3, (uint64_t (*)(void))sub_10000C32C);
}

unint64_t sub_10000C32C()
{
  unint64_t result;

  result = qword_100038928;
  if (!qword_100038928)
  {
    result = swift_getWitnessTable(&unk_100029504, &unk_1000357E8);
    atomic_store(result, (unint64_t *)&qword_100038928);
  }
  return result;
}

void sub_10000C368(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000C374(a1, a2, a3, (uint64_t (*)(void))sub_10000C3A4);
}

void sub_10000C374(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v11 = a4();
  sub_10000E908(v11, (uint64_t)&unk_10003077C, v5, v6, v7, v8, v9, v10, a2);
  sub_10000EEF8();
}

unint64_t sub_10000C3A4()
{
  unint64_t result;

  result = qword_100038930;
  if (!qword_100038930)
  {
    result = swift_getWitnessTable(&unk_1000294E8, &unk_100035810);
    atomic_store(result, (unint64_t *)&qword_100038930);
  }
  return result;
}

void sub_10000C3E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_10000C404(a1, a2, a3, &qword_100038820, type metadata accessor for PhotosReliveWidgetMemoryContent, (uint64_t)&unk_1000294B0, (uint64_t)&unk_10003077C);
}

void sub_10000C404(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t (*a5)(uint64_t), uint64_t a6, uint64_t a7)
{
  uint64_t v9;
  _QWORD v10[2];

  sub_10000BDF4(a4, a5);
  v10[0] = a2;
  v10[1] = v9;
  sub_10000E9A8((uint64_t)v10, a7);
  sub_10000EEF8();
}

uint64_t sub_10000C444()
{
  return sub_10000C470(type metadata accessor for PhotosReliveWidgetMemoryContent);
}

void sub_10000C450(uint64_t a1)
{
  sub_10000D1F0(a1, type metadata accessor for PhotosReliveWidgetMemoryContent);
}

uint64_t sub_10000C464()
{
  return sub_10000C470(type metadata accessor for PhotosReliveWidgetMemoryContent);
}

uint64_t sub_10000C470(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a1(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(unsigned __int8 *)(v3 + 80);
  v5 = (v4 + 16) & ~v4;
  v6 = v5 + *(_QWORD *)(v3 + 64);
  v7 = v4 | 7;
  v8 = v1 + v5;
  v9 = sub_10000EAE8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  swift_release(*(_QWORD *)(v8 + *(int *)(v2 + 20)));
  return swift_deallocObject(v1, v6, v7);
}

void sub_10000C4F8(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  sub_10000D264(a1, type metadata accessor for PhotosReliveWidgetMemoryContent, (void (*)(uint64_t, uint64_t))sub_100007DE4, a2);
}

uint64_t *sub_10000C50C(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *a1;
  v3 = a1[2];
  v4 = a1[10];
  v5 = a1[13];
  swift_retain(a1[1]);
  swift_bridgeObjectRetain(v3);
  swift_retain(v4);
  swift_retain(v5);
  swift_retain(v2);
  return a1;
}

uint64_t *sub_10000C570(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[2];
  v5 = a1[10];
  swift_release(a1[13]);
  swift_release(v5);
  swift_bridgeObjectRelease(v4);
  swift_release(v2);
  swift_release(v3);
  return a1;
}

uint64_t sub_10000C5D4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_10000C5E4(_QWORD *a1, _QWORD *a2)
{
  return sub_10001E3A4(*a1, *a2);
}

void sub_10000C5F4(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;

  *a1 = j___sSS10FoundationE36_unconditionallyBridgeFromObjectiveCySSSo8NSStringCSgFZ(*v1);
  a1[1] = v3;
  sub_10000EACC();
}

uint64_t sub_10000C61C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BDF4(&qword_100038A90, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey);
  v3 = v2;
  sub_10000BDF4(&qword_100038ED0, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v3, v4, &protocol witness table for String);
}

void sub_10000C6A0(_QWORD *a1@<X8>)
{
  uint64_t v1;

  String._bridgeToObjectiveC()();
  sub_10000F168();
  *a1 = v1;
  sub_10000E9E4();
}

uint64_t sub_10000C6D4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_10000BDF4(&qword_100038AA8, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName);
  v3 = v2;
  sub_10000BDF4(&qword_100038EC8, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v3, v4, &protocol witness table for String);
}

uint64_t sub_10000C758@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10000C780(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

uint64_t sub_10000C7A8()
{
  return EnvironmentValues.truncationMode.getter();
}

void sub_10000C7C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_10000C7DC(a1, a2, a3, a4, (uint64_t (*)(_QWORD))&type metadata accessor for Text.TruncationMode, (void (*)(char *))&EnvironmentValues.truncationMode.setter);
}

void sub_10000C7DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD), void (*a6)(char *))
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;

  v8 = a5(0);
  __chkstk_darwin(v8, v9);
  v11 = (char *)&v13 - v10;
  (*(void (**)(char *, uint64_t))(v12 + 16))((char *)&v13 - v10, a1);
  a6(v11);
  sub_10000E9E4();
}

void sub_10000C850(uint64_t a1@<X8>)
{
  char v2;

  *(_QWORD *)a1 = EnvironmentValues.lineLimit.getter();
  *(_BYTE *)(a1 + 8) = v2 & 1;
  sub_10000EACC();
}

void sub_10000C87C(uint64_t a1)
{
  EnvironmentValues.lineLimit.setter(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
  sub_10000EACC();
}

unint64_t sub_10000C8A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100038A18;
  if (!qword_100038A18)
  {
    v1 = sub_10000B978(&qword_1000389C0);
    sub_10000C928();
    sub_10000E4AC(&qword_100038A38, &qword_100038A10);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100038A18);
  }
  return result;
}

unint64_t sub_10000C928()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_100038A20;
  if (!qword_100038A20)
  {
    v1 = sub_10000B978(&qword_1000389B8);
    v2[0] = &type metadata for Text;
    v2[1] = &protocol witness table for Text;
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.widgetAccentable(_:)>>, 1);
    sub_10000E4AC(&qword_100038A28, &qword_100038A30);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100038A20);
  }
  return result;
}

unint64_t sub_10000C9D0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100038A40;
  if (!qword_100038A40)
  {
    v1 = sub_10000B978(&qword_1000389E8);
    sub_10000CA3C();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100038A40);
  }
  return result;
}

unint64_t sub_10000CA3C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100038A48;
  if (!qword_100038A48)
  {
    v1 = sub_10000B978(&qword_100038A00);
    sub_10000CAC0();
    sub_10000E4AC(&qword_100038A38, &qword_100038A10);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100038A48);
  }
  return result;
}

unint64_t sub_10000CAC0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_100038A50;
  if (!qword_100038A50)
  {
    v1 = sub_10000B978(&qword_1000389F8);
    v2[0] = &type metadata for Text;
    v2[1] = &protocol witness table for Text;
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.widgetAccentable(_:)>>, 1);
    sub_10000CB50();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100038A50);
  }
  return result;
}

unint64_t sub_10000CB50()
{
  unint64_t result;

  result = qword_100038A58;
  if (!qword_100038A58)
  {
    result = swift_getWitnessTable(&unk_10002A3F0, &type metadata for ScaleTextToFitWithLineHeight);
    atomic_store(result, (unint64_t *)&qword_100038A58);
  }
  return result;
}

unint64_t sub_10000CB8C()
{
  unint64_t result;

  result = qword_100038A78;
  if (!qword_100038A78)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100038A78);
  }
  return result;
}

unint64_t sub_10000CBC8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100038A88;
  if (!qword_100038A88)
  {
    v1 = objc_opt_self(NSNumber);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100038A88);
  }
  return result;
}

void type metadata accessor for TraitKey(uint64_t a1)
{
  sub_10000E094(a1, &qword_100038CE8, (uint64_t)&unk_100035B20);
}

void type metadata accessor for AttributeName(uint64_t a1)
{
  sub_10000E094(a1, &qword_100038CE0, (uint64_t)&unk_100035AF8);
}

double sub_10000CC30()
{
  uint64_t v0;

  return *(double *)(v0 + 16);
}

unint64_t sub_10000CC44()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100038B48;
  if (!qword_100038B48)
  {
    v1 = sub_10000B978(&qword_100038B40);
    sub_10000E4AC(&qword_100038A28, &qword_100038A30);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100038B48);
  }
  return result;
}

unint64_t sub_10000CCC8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100038B50;
  if (!qword_100038B50)
  {
    v1 = sub_10000B978(&qword_100038B30);
    sub_10000E4AC(&qword_100038B58, &qword_100038B28);
    sub_10000E4AC(&qword_100038B60, &qword_100038B00);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100038B50);
  }
  return result;
}

void sub_10000CD64(unint64_t *a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v7;
  _QWORD v8[2];

  if (!*a1)
  {
    v7 = sub_10000B978(a2);
    v8[0] = sub_10000B978(a3);
    v8[1] = a4();
    sub_10000E9A8((uint64_t)v8, (uint64_t)&opaque type descriptor for <<opaque return type of View.justification(_:)>>);
    atomic_store(swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v7), a1);
  }
  sub_10000EF64();
}

uint64_t sub_10000CDE8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

uint64_t sub_10000CDF8(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t *sub_10000CE10(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

uint64_t type metadata accessor for ImageAccentDesaturateModifier(uint64_t a1)
{
  return sub_10000CE64(a1, (uint64_t *)&unk_100038D50, (uint64_t)&nominal type descriptor for ImageAccentDesaturateModifier);
}

uint64_t sub_10000CE64(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

unint64_t sub_10000CE94()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100038C20;
  if (!qword_100038C20)
  {
    v1 = sub_10000B978(&qword_100038C10);
    sub_10000CF18();
    sub_10000BDF4(&qword_100038C48, type metadata accessor for ImageAccentDesaturateModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100038C20);
  }
  return result;
}

unint64_t sub_10000CF18()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100038C28;
  if (!qword_100038C28)
  {
    v1 = sub_10000B978(&qword_100038C08);
    sub_10000CF9C();
    sub_10000BDF4(&qword_100038C40, (uint64_t (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100038C28);
  }
  return result;
}

unint64_t sub_10000CF9C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100038C30;
  if (!qword_100038C30)
  {
    v1 = sub_10000B978(&qword_100038C00);
    sub_10000D008();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100038C30);
  }
  return result;
}

unint64_t sub_10000D008()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100038C38;
  if (!qword_100038C38)
  {
    v1 = sub_10000B978(&qword_100038BF8);
    swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of Image.widgetAccentedRenderingMode(_:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100038C38);
  }
  return result;
}

unint64_t sub_10000D080()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100038C50;
  if (!qword_100038C50)
  {
    v1 = sub_10000B978(&qword_100038C18);
    sub_10000D104();
    sub_10000E4AC(&qword_100038C60, &qword_100038C68);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100038C50);
  }
  return result;
}

unint64_t sub_10000D104()
{
  unint64_t result;

  result = qword_100038C58;
  if (!qword_100038C58)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Rectangle, &type metadata for Rectangle);
    atomic_store(result, (unint64_t *)&qword_100038C58);
  }
  return result;
}

void sub_10000D140(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = sub_10000EF0C(a1, a2, a3);
  sub_10000EAD4(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  sub_10000EACC();
}

void sub_10000D170(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  sub_100004E24(a1, v2, a2);
}

void sub_10000D178(uint64_t a1)
{
  uint64_t v1;

  sub_1000050C4(a1, v1);
}

void sub_10000D180(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = sub_10000EF54(a1, a2, a3);
  sub_10000EAD4(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  sub_10000EACC();
}

void sub_10000D1AC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = sub_10000EF0C(a1, a2, a3);
  sub_10000E990(v3);
  sub_10000EACC();
}

uint64_t sub_10000D1D0()
{
  return sub_10000C470(type metadata accessor for PhotosReliveWidgetPlaceholderContent);
}

void sub_10000D1DC(uint64_t a1)
{
  sub_10000D1F0(a1, type metadata accessor for PhotosReliveWidgetPlaceholderContent);
}

void sub_10000D1F0(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  sub_10000F38C(a1, a2);
  sub_10000F064();
  sub_100004CE0();
}

uint64_t sub_10000D244()
{
  return sub_10000C470(type metadata accessor for PhotosReliveWidgetPlaceholderContent);
}

void sub_10000D250(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  sub_10000D264(a1, type metadata accessor for PhotosReliveWidgetPlaceholderContent, (void (*)(uint64_t, uint64_t))sub_10000811C, a2);
}

void sub_10000D264(uint64_t a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, void (*a3)(uint64_t, uint64_t)@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v7;

  sub_10000F38C(a1, a2);
  sub_10000F064();
  sub_100007D94(a1, v7, a3, a4);
  sub_10000E9E4();
}

void sub_10000D2B0(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = sub_10000F38C(a1, a2);
  sub_10000ED9C(v2);
  sub_10000EACC();
}

uint64_t *sub_10000D2D4(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = sub_10000B8A0(&qword_100038C70);
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v11);
  }
  else
  {
    v6 = v4;
    if (swift_getEnumCaseMultiPayload(a2, v4) == 1)
    {
      v7 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
      v8 = a1;
      v9 = v6;
      v10 = 1;
    }
    else
    {
      v12 = *a2;
      *a1 = *a2;
      swift_retain(v12);
      v8 = a1;
      v9 = v6;
      v10 = 0;
    }
    swift_storeEnumTagMultiPayload(v8, v9, v10);
  }
  return a1;
}

uint64_t sub_10000D39C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_10000B8A0(&qword_100038C70);
  if (swift_getEnumCaseMultiPayload(a1, v2) != 1)
    return swift_release(*a1);
  v3 = type metadata accessor for WidgetRenderingMode(0);
  return (*(uint64_t (**)(_QWORD *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
}

uint64_t *sub_10000D400(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = sub_10000B8A0(&qword_100038C70);
  if (swift_getEnumCaseMultiPayload(a2, v4) == 1)
  {
    v5 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
    v6 = a1;
    v7 = v4;
    v8 = 1;
  }
  else
  {
    v9 = *a2;
    *a1 = *a2;
    swift_retain(v9);
    v6 = a1;
    v7 = v4;
    v8 = 0;
  }
  swift_storeEnumTagMultiPayload(v6, v7, v8);
  return a1;
}

uint64_t *sub_10000D49C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (a1 != a2)
  {
    sub_10000E500((uint64_t)a1, &qword_100038C70);
    v4 = sub_10000B8A0(&qword_100038C70);
    if (swift_getEnumCaseMultiPayload(a2, v4) == 1)
    {
      v5 = type metadata accessor for WidgetRenderingMode(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a1, a2, v5);
      v6 = a1;
      v7 = v4;
      v8 = 1;
    }
    else
    {
      v9 = *a2;
      *a1 = *a2;
      swift_retain(v9);
      v6 = a1;
      v7 = v4;
      v8 = 0;
    }
    swift_storeEnumTagMultiPayload(v6, v7, v8);
  }
  return a1;
}

void *sub_10000D550(void *a1, const void *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_10000B8A0(&qword_100038C70);
  if (swift_getEnumCaseMultiPayload(a2, v4) == 1)
  {
    v5 = type metadata accessor for WidgetRenderingMode(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a1, a2, v5);
    swift_storeEnumTagMultiPayload(a1, v4, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  }
  return a1;
}

void *sub_10000D5E8(void *a1, const void *a2)
{
  uint64_t v4;
  uint64_t v5;

  if (a1 != a2)
  {
    sub_10000E500((uint64_t)a1, &qword_100038C70);
    v4 = sub_10000B8A0(&qword_100038C70);
    if (swift_getEnumCaseMultiPayload(a2, v4) == 1)
    {
      v5 = type metadata accessor for WidgetRenderingMode(0);
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

uint64_t sub_10000D698(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000D6A4);
}

uint64_t sub_10000D6A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000B8A0(&qword_100038CF0);
  return sub_10000BA0C(a1, a2, v4);
}

uint64_t sub_10000D6DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000D6E8);
}

uint64_t sub_10000D6E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_10000B8A0(&qword_100038CF0);
  v0 = sub_10000F200();
  return sub_10000BA28(v0, v1, v2, v3);
}

void sub_10000D718(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  sub_10000D780(319);
  if (v3 <= 0x3F)
  {
    v4 = *(_QWORD *)(v2 - 8) + 64;
    swift_initStructMetadata(a1, 256, 1, &v4, a1 + 16);
  }
}

void sub_10000D780(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100038D60)
  {
    v2 = type metadata accessor for WidgetRenderingMode(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100038D60);
  }
}

uint64_t sub_10000D7D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 40);
}

uint64_t sub_10000D7DC(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  _QWORD v5[5];

  result = swift_checkMetadataState(319, *(_QWORD *)(a1 + 16));
  if (v3 <= 0x3F)
  {
    v5[0] = *(_QWORD *)(result - 8) + 64;
    result = type metadata accessor for WidgetFamily(319);
    if (v4 <= 0x3F)
    {
      v5[1] = *(_QWORD *)(result - 8) + 64;
      v5[2] = &unk_100029860;
      v5[3] = (char *)&value witness table for Builtin.Int64 + 64;
      v5[4] = (char *)&value witness table for Builtin.Int64 + 64;
      swift_initStructMetadata(a1, 0, 5, v5, a1 + 32);
      return 0;
    }
  }
  return result;
}

uint64_t *sub_10000D87C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = type metadata accessor for WidgetFamily(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_DWORD *)(v9 + 80);
  v11 = v10;
  v12 = v7 + v10;
  v13 = *(_QWORD *)(v9 + 64);
  v14 = v10 | *(_DWORD *)(v6 + 80) & 0xF8;
  v15 = (*(_DWORD *)(v6 + 80) | v10) & 0x100000;
  if (v14 > 7 || v15 != 0 || (((((v12 & ~v11) + v13) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + (((v14 | 7) + 16) & ~(unint64_t)(v14 | 7)));
    swift_retain(v18);
  }
  else
  {
    v19 = v8;
    v20 = ~v11;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    v21 = ((unint64_t)a1 + v12) & v20;
    v22 = ((unint64_t)a2 + v12) & v20;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))(v21, v22, v19);
    *(_BYTE *)(v21 + v13) = *(_BYTE *)(v22 + v13);
    v23 = (v21 + v13) & 0xFFFFFFFFFFFFFFF8;
    v24 = (v22 + v13) & 0xFFFFFFFFFFFFFFF8;
    *(_QWORD *)(v23 + 8) = *(_QWORD *)(v24 + 8);
    *(_QWORD *)((v23 + 23) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v24 + 23) & 0xFFFFFFFFFFFFF8);
  }
  return a1;
}

uint64_t sub_10000D9BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  (*(void (**)(void))(v3 + 8))();
  v4 = *(_QWORD *)(v3 + 64);
  v5 = type metadata accessor for WidgetFamily(0);
  return (*(uint64_t (**)(unint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))((v4 + a1 + *(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80), v5);
}

uint64_t sub_10000DA10(uint64_t a1, uint64_t a2, uint64_t a3)
{
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

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64);
  v7 = type metadata accessor for WidgetFamily(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v6 + v9;
  v11 = (v6 + v9 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v11, v12, v7);
  v13 = *(_QWORD *)(v8 + 64);
  v14 = v11 + v13;
  v15 = v12 + v13;
  *(_BYTE *)v14 = *(_BYTE *)v15;
  v14 &= 0xFFFFFFFFFFFFFFF8;
  v15 &= 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)(v14 + 8) = *(_QWORD *)(v15 + 8);
  *(_QWORD *)((v14 + 23) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v15 + 23) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_10000DAC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
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

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64);
  v7 = type metadata accessor for WidgetFamily(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v6 + v9;
  v11 = (v6 + v9 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 24))(v11, v12, v7);
  v13 = *(_QWORD *)(v8 + 64);
  v14 = v11 + v13;
  v15 = v12 + v13;
  *(_BYTE *)v14 = *(_BYTE *)v15;
  v14 &= 0xFFFFFFFFFFFFFFF8;
  v15 &= 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)(v14 + 8) = *(_QWORD *)(v15 + 8);
  *(_QWORD *)((v14 + 23) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v15 + 23) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_10000DB78(uint64_t a1, uint64_t a2, uint64_t a3)
{
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

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64);
  v7 = type metadata accessor for WidgetFamily(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v6 + v9;
  v11 = (v6 + v9 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 32))(v11, v12, v7);
  v13 = *(_QWORD *)(v8 + 64);
  v14 = v11 + v13;
  v15 = v12 + v13;
  *(_BYTE *)v14 = *(_BYTE *)v15;
  v14 &= 0xFFFFFFFFFFFFFFF8;
  v15 &= 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)(v14 + 8) = *(_QWORD *)(v15 + 8);
  *(_QWORD *)((v14 + 23) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v15 + 23) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_10000DC2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
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

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64);
  v7 = type metadata accessor for WidgetFamily(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v6 + v9;
  v11 = (v6 + v9 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 40))(v11, v12, v7);
  v13 = *(_QWORD *)(v8 + 64);
  v14 = v11 + v13;
  v15 = v12 + v13;
  *(_BYTE *)v14 = *(_BYTE *)v15;
  v14 &= 0xFFFFFFFFFFFFFFF8;
  v15 &= 0xFFFFFFFFFFFFFFF8;
  *(_QWORD *)(v14 + 8) = *(_QWORD *)(v15 + 8);
  *(_QWORD *)((v14 + 23) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((v15 + 23) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_10000DCE0(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v20;
  unsigned int v21;

  v5 = *(_QWORD *)(a3 + 16);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int *)(v6 + 84);
  v8 = type metadata accessor for WidgetFamily(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned int *)(v9 + 84);
  if (v10 <= v7)
    v11 = v7;
  else
    v11 = *(_DWORD *)(v9 + 84);
  if (v11 <= 0xFD)
    v11 = 253;
  if (!a2)
    return 0;
  v12 = v8;
  v13 = *(unsigned __int8 *)(v9 + 80);
  v14 = *(_QWORD *)(v6 + 64) + v13;
  v15 = *(_QWORD *)(v9 + 64);
  if (v11 < a2)
  {
    if ((((((((v14 & ~v13) + v15) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v16 = 2;
    else
      v16 = a2 - v11 + 1;
    if (v16 >= 0x10000)
      v17 = 4;
    else
      v17 = 2;
    if (v16 < 0x100)
      v17 = 1;
    if (v16 >= 2)
      v18 = v17;
    else
      v18 = 0;
    __asm { BR              X16 }
  }
  if ((_DWORD)v7 == v11)
  {
    v20 = a1;
    v10 = v7;
    v12 = v5;
    return sub_10000BA0C(v20, v10, v12);
  }
  v20 = (v14 + a1) & ~v13;
  if ((_DWORD)v10 == v11)
    return sub_10000BA0C(v20, v10, v12);
  v21 = *(unsigned __int8 *)(v20 + v15);
  if (v21 >= 3)
    return v21 - 2;
  else
    return 0;
}

void sub_10000DE60(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  size_t v11;
  unsigned int v12;
  int v13;
  int v14;
  unsigned int v15;

  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = *(_QWORD *)(type metadata accessor for WidgetFamily(0) - 8);
  if (*(_DWORD *)(v9 + 84) <= v8)
    v10 = v8;
  else
    v10 = *(_DWORD *)(v9 + 84);
  if (v10 <= 0xFD)
    v10 = 253;
  v11 = ((((((*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))
          + *(_QWORD *)(v9 + 64)) & 0xFFFFFFFFFFFFFFF8)
        + 23) & 0xFFFFFFFFFFFFFFF8)
      + 8;
  if (v10 >= a3)
  {
    v14 = 0;
  }
  else
  {
    if ((_DWORD)v11)
      v12 = 2;
    else
      v12 = a3 - v10 + 1;
    if (v12 >= 0x10000)
      v13 = 4;
    else
      v13 = 2;
    if (v12 < 0x100)
      v13 = 1;
    if (v12 >= 2)
      v14 = v13;
    else
      v14 = 0;
  }
  if (a2 > v10)
  {
    if ((_DWORD)v11)
    {
      v15 = ~v10 + a2;
      bzero(a1, v11);
      *a1 = v15;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X14 }
}

void sub_10000DF88(uint64_t a1@<X2>, uint64_t a2@<X3>, int a3@<W8>)
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
  uint64_t v12;

  *(_BYTE *)(v6 + v10) = 0;
  if ((_DWORD)v7)
  {
    if ((_DWORD)v9 == a3)
    {
      v11 = v6;
      v12 = v7;
      a1 = v9;
      a2 = v8;
LABEL_6:
      sub_10000BA28(v11, v12, a1, a2);
      return;
    }
    v11 = (v4 + v6) & v5;
    if ((_DWORD)a1 == a3)
    {
      v12 = v7;
      goto LABEL_6;
    }
    *(_BYTE *)(v11 + v3) = v7 + 2;
  }
}

uint64_t type metadata accessor for PhotosReliveWidgetPaddingVStack(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000E534(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PhotosReliveWidgetPaddingVStack);
}

__n128 sub_10000E028(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_10000E038(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_10000E058(uint64_t result, int a2, int a3)
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
  sub_10000E094(a1, &qword_100038E10, (uint64_t)&unk_100035BF8);
}

void sub_10000E094(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v5;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, a3);
    if (!v5)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_10000E0D8(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t TupleTypeMetadata3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t OpaqueTypeMetadata2;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v1 = *a1;
  v2 = a1[1];
  v3 = sub_10000B978(&qword_100038958);
  v4 = sub_10000B978(&qword_100038E18);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness(255, v2, v1, &unk_1000304BC, &unk_1000304D4);
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3(255, v3, v4, AssociatedTypeWitness, 0, 0);
  v7 = type metadata accessor for TupleView(255, TupleTypeMetadata3);
  v8 = sub_10000F1C4((uint64_t)&protocol conformance descriptor for TupleView<A>);
  v9 = type metadata accessor for ZStack(255, v7, v8);
  v10 = sub_10000F1C4((uint64_t)&protocol conformance descriptor for ZStack<A>);
  v15 = v9;
  v16 = v10;
  OpaqueTypeMetadata2 = swift_getOpaqueTypeMetadata2(255, &v15, &opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>, 0);
  v15 = v9;
  v16 = v10;
  v12 = sub_10000E9A8((uint64_t)&v15, (uint64_t)&opaque type descriptor for <<opaque return type of View.widgetURL(_:)>>);
  v13 = type metadata accessor for GeometryReader(255, OpaqueTypeMetadata2, v12);
  return swift_getWitnessTable(&protocol conformance descriptor for GeometryReader<A>, v13);
}

void sub_10000E1F4()
{
  sub_10000E4AC(&qword_100038E20, &qword_100038CB0);
}

void *sub_10000E220()
{
  return &protocol witness table for EmptyView;
}

void sub_10000E22C()
{
  sub_10000E4AC(&qword_100038E28, &qword_100038E30);
}

uint64_t sub_10000E258(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 16);
  return swift_getOpaqueTypeConformance2(&v3, &unk_1000308A8, 1);
}

void sub_10000E28C()
{
  sub_10000BDF4(&qword_100038E38, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey);
}

void sub_10000E2B8()
{
  sub_10000BDF4(&qword_100038E40, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey);
}

void sub_10000E2E4()
{
  sub_10000BDF4(&qword_100038E48, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName);
}

void sub_10000E310()
{
  sub_10000BDF4(&qword_100038E50, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName);
}

uint64_t sub_10000E33C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100030880, 1);
}

void sub_10000E34C()
{
  sub_10000BDF4(&qword_100038E58, (uint64_t (*)(uint64_t))type metadata accessor for AttributeName);
}

void sub_10000E378()
{
  sub_10000BDF4(&qword_100038E60, (uint64_t (*)(uint64_t))type metadata accessor for TraitKey);
}

unint64_t sub_10000E3A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100038E80;
  if (!qword_100038E80)
  {
    v1 = sub_10000B978(&qword_100038E78);
    sub_10000E428();
    sub_10000E4AC(&qword_100038EA0, &qword_100038EA8);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100038E80);
  }
  return result;
}

unint64_t sub_10000E428()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100038E88;
  if (!qword_100038E88)
  {
    v1 = sub_10000B978(&qword_100038E90);
    sub_10000E4AC(&qword_100038E98, &qword_100038E68);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100038E88);
  }
  return result;
}

void sub_10000E4AC(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = sub_10000B978(a2);
    atomic_store(sub_10000F15C(v3), a1);
  }
  sub_10000EACC();
}

void sub_10000E4E0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = sub_10000EF54(a1, a2, a3);
  sub_10000E990(v3);
  sub_10000EACC();
}

void sub_10000E500(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = sub_10000B8A0(a2);
  sub_10000ED9C(v2);
  sub_10000EACC();
}

uint64_t sub_10000E528@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100004A70(*(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_10000E534(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

_BYTE *initializeBufferWithCopyOfBuffer for PhotosReliveWidgetScheduledReloadConfiguration.CodingKeys(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PhotosReliveWidgetScheduledReloadConfiguration.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v5 = v6 - 3;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t sub_10000E5F4(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000E640 + 4 * byte_100029289[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_10000E674 + 4 * byte_100029284[v4]))();
}

uint64_t sub_10000E674(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000E67C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000E684);
  return result;
}

uint64_t sub_10000E690(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000E698);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_10000E69C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000E6A4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000E6B0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000E6BC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

void type metadata accessor for PhotosReliveWidgetContentType()
{
  sub_10000F2E0();
}

unint64_t sub_10000E6D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100038ED8;
  if (!qword_100038ED8)
  {
    v1 = sub_10000B978(&qword_100038EE0);
    sub_10000E3A4();
    sub_10000E4AC(&qword_100038E98, &qword_100038E68);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100038ED8);
  }
  return result;
}

void sub_10000E758(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for VStack(255, *a1, a1[1]);
  v2 = type metadata accessor for ModifiedContent(255, v1, &type metadata for _PaddingLayout);
  v3 = type metadata accessor for ModifiedContent(255, v2, &type metadata for _PaddingLayout);
  sub_10000F1C4((uint64_t)&protocol conformance descriptor for VStack<A>);
  swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v2);
  swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v3);
  sub_10000EF64();
}

unint64_t sub_10000E7FC()
{
  unint64_t result;

  result = qword_100038EE8;
  if (!qword_100038EE8)
  {
    result = swift_getWitnessTable(&unk_100029C50, &unk_100035C90);
    atomic_store(result, (unint64_t *)&qword_100038EE8);
  }
  return result;
}

uint64_t sub_10000E888()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_10000E8B4(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
}

uint64_t sub_10000E908(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return swift_getOpaqueTypeConformance2(&a9, a2, 1);
}

uint64_t sub_10000E930()
{
  return type metadata accessor for Text.Measurements(0);
}

void sub_10000E944(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;

  sub_10000E4E0(a1, *(_QWORD *)(a2 - 256), v2);
}

void sub_10000E980(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_10000E4E0(a1, a2, v2);
}

void sub_10000E988(uint64_t a1)
{
  uint64_t *v1;

  sub_10000E500(a1, v1);
}

uint64_t sub_10000E990(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 16))(v1, v2, a1);
}

uint64_t sub_10000E9A8(uint64_t a1, uint64_t a2)
{
  return swift_getOpaqueTypeConformance2(a1, a2, 1);
}

uint64_t sub_10000E9B0(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  double v5;

  return Image.init(_:scale:orientation:label:)(v4, 0, a1, a2, a3 & 1, a4, v5);
}

void sub_10000E9DC(uint64_t a1)
{
  uint64_t *v1;

  sub_10000E500(a1, v1);
}

uint64_t sub_10000E9F0(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  *(_QWORD *)(v4 - 304) = v3;
  *(_QWORD *)(v4 - 312) = v2;
  *(_QWORD *)(v4 - 320) = result;
  *(_QWORD *)(v4 - 328) = v1;
  return result;
}

void sub_10000EA24(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_10000E4E0(a1, a2, v2);
}

uint64_t sub_10000EA2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = v2 + *(int *)(*(_QWORD *)(v4 - 272) + 36);
  *(_QWORD *)v5 = 0;
  *(_WORD *)(v5 + 8) = 257;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10000EA58(uint64_t a1, uint64_t a2)
{
  return swift_storeEnumTagMultiPayload(a1, a2, 0);
}

uint64_t sub_10000EA60(uint64_t a1)
{
  return swift_bridgeObjectRelease(a1);
}

uint64_t sub_10000EA7C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return View.accessibilityLabel(_:)(*(_QWORD *)(v2 - 200), *(_QWORD *)(v2 - 192), *(_DWORD *)(v2 - 204) & 1, *(_QWORD *)(v2 - 336), v1, a1);
}

uint64_t sub_10000EAD4@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t sub_10000EAE0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_10000EAE8()
{
  return type metadata accessor for Text.Measurements(0);
}

uint64_t sub_10000EAF0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

_QWORD *sub_10000EAF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  uint64_t v9;
  va_list va;

  va_start(va, a8);
  return _FrameLayout.init(width:height:alignment:)((uint64_t *)va, v8, 0, v9, 0, a1, a2);
}

uint64_t sub_10000EB18(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v3 - 280) + 104))(v2, a2, *(_QWORD *)(v3 - 264));
}

uint64_t sub_10000EB68@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

void sub_10000EB70(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_10000E4E0(a1, a2, v2);
}

uint64_t sub_10000EB98@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t sub_10000EBA4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  sub_10000C5D4(a1, v1, v3);
  return swift_bridgeObjectRelease(v2);
}

uint64_t sub_10000EBC0(uint64_t a1, uint64_t a2)
{
  return swift_storeEnumTagMultiPayload(a1, a2, 1);
}

uint64_t sub_10000EBE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  sub_10000BA28(v2, 0, 1, a1);
  return Image.widgetAccentedRenderingMode(_:)(v2, v1);
}

uint64_t sub_10000EC10()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_10000EC18(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return _ConditionalContent<>.init(storage:)(v3, v4, v1, v2, a1);
}

uint64_t sub_10000EC34(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return _ConditionalContent<>.init(storage:)(v4, v3, v1, v2, a1);
}

_QWORD *sub_10000EC50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return _FrameLayout.init(width:height:alignment:)((_QWORD *)(v2 - 152), *(_QWORD *)(v2 - 224), 0, *(_QWORD *)(v2 - 216), 0, a1, a2);
}

uint64_t sub_10000EC6C()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_10000EC90()
{
  uint64_t v0;

  return swift_release(v0);
}

unint64_t sub_10000EC9C()
{
  return sub_10000CBC8();
}

uint64_t sub_10000ECA8()
{
  return type metadata accessor for Image.ResizingMode(0);
}

uint64_t sub_10000ECC4()
{
  return type metadata accessor for CharacterSet(0);
}

uint64_t sub_10000ECE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t sub_10000ECF0()
{
  uint64_t v0;

  return StringProtocol.rangeOfCharacter(from:options:range:)(v0, 0, 0, 0, 1);
}

_QWORD *sub_10000ED0C(double a1, double a2, uint64_t a3, ...)
{
  uint64_t v3;
  double v4;
  double v5;
  va_list va;

  va_start(va, a3);
  return LinearGradient.init(gradient:startPoint:endPoint:)((uint64_t *)va, v3, v4, v5, a1, a2);
}

uint64_t sub_10000ED28()
{
  uint64_t v0;
  uint64_t v1;

  return Image.resizable(capInsets:resizingMode:)(v1, v0, 0.0, 0.0, 0.0, 0.0);
}

NSDictionary sub_10000ED44()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10000ED5C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, _QWORD)@<X8>)
{
  uint64_t v2;

  return a2(a1, *(_QWORD *)(v2 - 256));
}

void sub_10000ED64()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  sub_10000D180(v1, *(_QWORD *)(v2 - 328), v0);
}

NSNumber sub_10000ED7C()
{
  return CGFloat._bridgeToObjectiveC()();
}

uint64_t sub_10000ED94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  return _ConditionalContent<>.init(storage:)(a1, a2, a3, v5, a5);
}

uint64_t sub_10000ED9C(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t sub_10000EDB0@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 - 256) = result;
  return result;
}

uint64_t sub_10000EDBC()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_10000EDC4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return Dictionary.init(dictionaryLiteral:)(v1, v2, a1 + 8);
}

uint64_t sub_10000EDD8()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_10000EDF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  return _ConditionalContent<>.init(storage:)(a1, a2, a3, v5, a5);
}

uint64_t sub_10000EDFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return Dictionary.init(dictionaryLiteral:)(v2, v0, v1);
}

unint64_t sub_10000EE10()
{
  return 0xD00000000000002FLL;
}

void sub_10000EE80(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 184) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void sub_10000EE9C(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 232) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void sub_10000EEB8(uint64_t a1)
{
  uint64_t *v1;

  sub_10000E500(a1, v1);
}

uint64_t sub_10000EEC0()
{
  uint64_t v0;

  return swift_release(v0);
}

uint64_t sub_10000EEC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 32))(v2, v3, v1);
}

uint64_t sub_10000EEDC()
{
  return sub_100027914(2, 17, 0, 0);
}

void sub_10000EEF0(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_10000D180(a1, a2, v2);
}

uint64_t sub_10000EF04()
{
  return type metadata accessor for WidgetFamily(0);
}

uint64_t sub_10000EF0C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(0);
}

uint64_t sub_10000EF24()
{
  return View.widgetAccentable(_:)(1);
}

uint64_t sub_10000EF34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return Text.init(_:tableName:bundle:comment:)(a1, a2, a3, a4, 0xD000000000000012, a6, a7, 0);
}

void sub_10000EF44(uint64_t a1, id *a2)
{

}

uint64_t sub_10000EF54(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_10000B8A0(a3);
}

uint64_t sub_10000EF74(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return sub_10000BA28(v2, a2, 1, v3);
}

uint64_t sub_10000EF84()
{
  uint64_t v0;

  return v0;
}

__n128 sub_10000EF9C@<Q0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, __int128 a8, __int128 a9, __n128 a10)
{
  uint64_t v10;
  __n128 result;

  *(_QWORD *)(v10 + 96) = a1;
  *(_QWORD *)(v10 + 104) = 0;
  *(_OWORD *)(v10 + 112) = a8;
  *(_OWORD *)(v10 + 128) = a9;
  result = a10;
  *(__n128 *)(v10 + 144) = a10;
  return result;
}

void sub_10000EFCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_QWORD *)v0 = v2;
  *(_QWORD *)(v0 + 8) = v1;
  *(_QWORD *)(v0 + 16) = v4;
  *(_QWORD *)(v0 + 24) = v5;
  *(_QWORD *)(v0 + 32) = v6;
  *(_QWORD *)(v0 + 40) = v7;
  *(_QWORD *)(v0 + 48) = v8;
  *(_BYTE *)(v0 + 56) = v3;
}

uint64_t sub_10000EFF4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v0);
}

uint64_t sub_10000F004()
{
  return static Alignment.center.getter();
}

uint64_t sub_10000F014()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_10000F01C()
{
  uint64_t v0;

  return swift_release(v0);
}

uint64_t sub_10000F07C(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

unint64_t sub_10000F084@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 152) = a1;
  *(_QWORD *)(v2 - 144) = v1;
  return sub_10000CB8C();
}

uint64_t sub_10000F094(uint64_t a1, double a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 48) = a1;
  *(double *)(v2 + 56) = a2;
  return Gradient.init(stops:)(v2);
}

uint64_t sub_10000F0A4()
{
  uint64_t v0;

  return Gradient.Stop.init(color:location:)(v0);
}

uint64_t sub_10000F0BC()
{
  uint64_t v0;
  char v1;
  uint64_t v2;

  return sub_10000C5D4(v2, v0, v1);
}

uint64_t sub_10000F0CC()
{
  uint64_t v0;
  char v1;
  uint64_t v2;

  return sub_10000CDE8(v2, v0, v1);
}

void sub_10000F0DC(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_10000E500(v2, a2);
}

void sub_10000F0FC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = v0;
}

uint64_t sub_10000F10C()
{
  double v0;

  return Color.opacity(_:)(v0);
}

uint64_t sub_10000F114()
{
  char v0;
  uint64_t v1;
  uint64_t v2;

  return sub_10000C5D4(v1, v2, v0);
}

uint64_t sub_10000F124()
{
  return CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
}

uint64_t sub_10000F15C(uint64_t a1)
{
  uint64_t v1;

  return swift_getWitnessTable(v1, a1);
}

uint64_t sub_10000F168()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_10000F180()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 - 264))();
}

uint64_t sub_10000F18C()
{
  return type metadata accessor for Text.TruncationMode(0);
}

id sub_10000F198(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;

  return objc_msgSend(v3, a2, v2);
}

uint64_t sub_10000F1A4(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;

  sub_10000C5D4(a1, a2, a3);
  return swift_bridgeObjectRelease(v3);
}

uint64_t sub_10000F1B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 104) = v2;
  *(_QWORD *)(v1 + 80) = a1;
  return static UIFontDescriptorTraitKey.design.getter();
}

uint64_t sub_10000F1C4(uint64_t a1)
{
  uint64_t v1;

  return swift_getWitnessTable(a1, v1);
}

uint64_t sub_10000F1CC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 64) = a1;
  *(_QWORD *)(v1 + 40) = v2;
  return static UIFontDescriptorTraitKey.design.getter();
}

void sub_10000F1D8(uint64_t a1@<X8>)
{
  char v1;
  char v2;

  *(_QWORD *)a1 = 0;
  *(_BYTE *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 9) = v2 & ~v1;
}

void sub_10000F1F8(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_10000E500(v2, a2);
}

uint64_t sub_10000F200()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_10000F234@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return LocalizedStringKey.init(stringLiteral:)(a1, (a2 - 32) | 0x8000000000000000);
}

uint64_t sub_10000F240()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_10000F268()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_10000F274(uint64_t a1, uint64_t a2)
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
}

uint64_t sub_10000F280()
{
  return View.widgetAccentable(_:)(1);
}

void sub_10000F28C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  sub_10000D180(v3, v4, a3);
}

uint64_t sub_10000F298()
{
  uint64_t v0;

  sub_10000C5D4(*(_QWORD *)(v0 - 184), *(_QWORD *)(v0 - 176), *(_BYTE *)(v0 - 168));
  return swift_bridgeObjectRelease(*(_QWORD *)(v0 - 160));
}

uint64_t sub_10000F2B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return Text.init<A>(_:)(v3 - 152, a2, v2);
}

uint64_t sub_10000F2C0()
{
  uint64_t v0;
  uint64_t v1;

  return dispatch thunk of RawRepresentable.rawValue.getter(v0, v1);
}

void *sub_10000F2E8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0xA0uLL);
}

uint64_t sub_10000F2F0()
{
  return static UnitPoint.bottom.getter();
}

id sub_10000F310(id a1, SEL a2)
{
  uint64_t v2;
  double v3;

  return objc_msgSend(a1, a2, v2, v3);
}

uint64_t sub_10000F31C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t sub_10000F324(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

uint64_t sub_10000F32C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t sub_10000F334(uint64_t a1, double a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = a1;
  *(double *)(v2 + 40) = a2;
  return static Color.black.getter();
}

uint64_t sub_10000F340(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  double v5;

  return Text.Measurements.numberOfLines(of:in:writingMode:)(a1, a2, a3, a4, v4, v5);
}

uint64_t sub_10000F34C()
{
  return static CharacterSet._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000F380(uint64_t a1)
{
  return swift_allocObject(a1, 64, 7);
}

uint64_t sub_10000F38C(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  return a2(0);
}

uint64_t sub_10000F394()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 - 136))(0);
}

uint64_t sub_10000F3A0()
{
  return 0;
}

uint64_t sub_10000F3B4()
{
  return type metadata accessor for Text.WritingMode(0);
}

void sub_10000F3BC()
{
  uint64_t v0;
  uint64_t (*v1)(_QWORD);

  sub_10000D2B0(v0, v1);
}

void sub_10000F3C8()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 336) = *(_QWORD *)(v0 + 16);
}

BOOL sub_10000F3F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 24);
  if (!v1)
    return 0;
  v2 = type metadata accessor for PhotosReliveWidgetPlaceholderViewModel(0);
  if (swift_dynamicCastClass(v1, v2))
    return 0;
  v3 = type metadata accessor for PhotosReliveWidgetFallbackViewModel(0);
  return !swift_dynamicCastClass(v1, v3) && *(_BYTE *)(v0 + 32) == 0;
}

void PhotosReliveWidgetView.body.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v2 = type metadata accessor for ContainerBackgroundPlacement(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_10000B8A0(&qword_100038EF0);
  __chkstk_darwin(v7, v8);
  sub_10000E8D8();
  sub_10000F56C(v0, v1);
  v9 = static ContainerBackgroundPlacement.widget.getter();
  v10 = static Alignment.center.getter(v9);
  v12 = v11;
  v13 = sub_1000100D4();
  View.containerBackground<A>(for:alignment:content:)(v6, v10, v12, sub_1000100B0, 0, v7, &type metadata for Color, v13, &protocol witness table for Color);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  sub_10000E500(v1, &qword_100038EF0);
  sub_10000E8C0();
}

void sub_10000F56C(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  unint64_t v59;
  id v60;
  int v61;
  int v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t *v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t OpaqueTypeConformance2;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void (*v85)(char *, uint64_t, uint64_t);
  char *v86;
  uint64_t v87;
  uint64_t v88;
  void (*v89)(uint64_t, uint64_t);
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t *v99;
  unint64_t v100;
  uint64_t v101;
  uint64_t *v102;
  uint64_t v103;
  unint64_t v104;
  unint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v112;
  unint64_t v113;
  uint64_t v114;
  unint64_t v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  char *v124;
  char *v125;
  char *v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  char *v130;
  uint64_t v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  char *v137;
  uint64_t *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;

  v145 = a2;
  v3 = type metadata accessor for RedactionReasons(0);
  v128 = *(_QWORD *)(v3 - 8);
  v129 = v3;
  __chkstk_darwin(v3, v4);
  v127 = (char *)&v117 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v139 = type metadata accessor for PhotosReliveWidgetPlaceholderContent(0);
  __chkstk_darwin(v139, v6);
  v126 = (char *)&v117 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v140 = sub_10000B8A0(&qword_100038FE8);
  v131 = *(_QWORD *)(v140 - 8);
  v9 = __chkstk_darwin(v140, v8);
  v125 = (char *)&v117 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9, v11);
  v130 = (char *)&v117 - v12;
  v136 = sub_10000B8A0(&qword_100038FF0);
  __chkstk_darwin(v136, v13);
  v138 = (uint64_t *)((char *)&v117 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = type metadata accessor for WidgetFamily(0);
  v134 = *(_QWORD *)(v15 - 8);
  v135 = v15;
  v17 = __chkstk_darwin(v15, v16);
  v124 = (char *)&v117 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __chkstk_darwin(v17, v19);
  v123 = (uint64_t)&v117 - v21;
  v23 = __chkstk_darwin(v20, v22);
  v122 = (char *)&v117 - v24;
  __chkstk_darwin(v23, v25);
  v132 = (char *)&v117 - v26;
  v133 = type metadata accessor for PhotosReliveWidgetView(0);
  v28 = __chkstk_darwin(v133, v27);
  v30 = (char *)&v117 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v28, v31);
  v33 = (char *)&v117 - v32;
  v144 = sub_10000B8A0(&qword_100038F38);
  __chkstk_darwin(v144, v34);
  v137 = (char *)&v117 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v142 = sub_10000B8A0(&qword_100038FF8);
  __chkstk_darwin(v142, v36);
  v143 = (uint64_t)&v117 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  v121 = sub_10000B8A0(&qword_100039000);
  __chkstk_darwin(v121, v38);
  v40 = (char *)&v117 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = sub_10000B8A0(&qword_100039008);
  __chkstk_darwin(v41, v42);
  v44 = (uint64_t *)((char *)&v117 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0));
  v119 = sub_10000B8A0(&qword_100038F28);
  __chkstk_darwin(v119, v45);
  v120 = (char *)&v117 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  v118 = type metadata accessor for PhotosReliveWidgetMemoryContent(0);
  __chkstk_darwin(v118, v47);
  v49 = (char *)&v117 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
  v141 = sub_10000B8A0(&qword_100038F18);
  __chkstk_darwin(v141, v50);
  v52 = (char *)&v117 - ((v51 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 24) || (v53 = *(_QWORD *)(a1 + 24), !sub_10000F3F0()))
  {
    v60 = *(id *)a1;
    sub_100010EB0(a1, (uint64_t)v33, type metadata accessor for PhotosReliveWidgetView);
    if (v60)
    {
      v61 = v33[32];
      sub_100010E6C((uint64_t)v33, (uint64_t)v30);
      if (v61 == 1)
      {
        sub_100010EDC((uint64_t)v30, type metadata accessor for PhotosReliveWidgetView);
LABEL_10:
        v63 = *(id *)a1;
        if (!*(_QWORD *)a1)
        {
          __break(1u);
          goto LABEL_28;
        }
        v64 = *(_QWORD *)(a1 + 16);
        v65 = *(unsigned __int8 *)(a1 + 8);
        swift_retain(v64);
        v66 = v63;
        v67 = (uint64_t)v132;
        sub_100010C68(&qword_100038640, (uint64_t (*)(_QWORD))&type metadata accessor for WidgetFamily, 0x6146746567646957, 0xEC000000796C696DLL, (uint64_t)v132);
        type metadata accessor for PhotosReliveWidgetFallbackViewModel(0);
        v69 = v134;
        v68 = v135;
        v70 = v122;
        (*(void (**)(char *, uint64_t, uint64_t))(v134 + 16))(v122, v67, v135);
        v71 = sub_10001E464(v66, v65, v64, v70);
        (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v67, v68);
        v72 = v138;
        *v138 = v71;
        swift_storeEnumTagMultiPayload(v72, v136, 0);
        v73 = sub_10000BF08();
        sub_100010344(&qword_100038918, type metadata accessor for PhotosReliveWidgetPlaceholderContent, (uint64_t)&unk_1000295B0);
        v146 = v139;
        v147 = v74;
        OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v146, &opaque type descriptor for <<opaque return type of View.redacted(reason:)>>, 1);
        v76 = (uint64_t)v137;
        _ConditionalContent<>.init(storage:)(v72, &unk_1000357E8, v140, v73, OpaqueTypeConformance2);
LABEL_22:
        v102 = &qword_100038F38;
        v103 = v143;
        sub_100010F04(v76, v143, &qword_100038F38);
        swift_storeEnumTagMultiPayload(v103, v142, 1);
        v104 = sub_1000101A4();
        v105 = sub_100010294();
        _ConditionalContent<>.init(storage:)(v103, v141, v144, v104, v105);
        v106 = v76;
LABEL_26:
        sub_10000E500(v106, v102);
        return;
      }
      v62 = v30[32];
      sub_100010EDC((uint64_t)v30, type metadata accessor for PhotosReliveWidgetView);
      if (v62 == 3)
        goto LABEL_10;
    }
    else
    {
      sub_100010EDC((uint64_t)v33, type metadata accessor for PhotosReliveWidgetView);
    }
    v77 = *(_QWORD *)(a1 + 24);
    if (v77)
    {
      v78 = type metadata accessor for PhotosReliveWidgetPlaceholderViewModel(0);
      v79 = swift_dynamicCastClass(v77, v78);
      v80 = (uint64_t)v126;
      if (v79)
        swift_retain(v77);
    }
    else
    {
      v79 = 0;
      v80 = (uint64_t)v126;
    }
    if (*(_QWORD *)a1)
      v81 = objc_msgSend(*(id *)a1, "contentType");
    else
      v81 = 0;
    swift_retain(v79);
    v82 = v123;
    sub_100010C68(&qword_100038640, (uint64_t (*)(_QWORD))&type metadata accessor for WidgetFamily, 0x6146746567646957, 0xEC000000796C696DLL, v123);
    ((void (*)(void))Text.Measurements.init())();
    v84 = v134;
    v83 = v135;
    v85 = *(void (**)(char *, uint64_t, uint64_t))(v134 + 16);
    v86 = v124;
    v85(v124, v82, v135);
    v87 = v79;
    if (!v79)
    {
      type metadata accessor for PhotosReliveWidgetPlaceholderViewModel(0);
      v88 = (uint64_t)v132;
      v85(v132, (uint64_t)v86, v83);
      v87 = sub_10001E130(v81, 0, 0, v88);
    }
    v89 = *(void (**)(uint64_t, uint64_t))(v84 + 8);
    v89(v82, v83);
    v90 = ((uint64_t (*)(char *, uint64_t))v89)(v86, v83);
    v91 = v139;
    *(_QWORD *)(v80 + *(int *)(v139 + 20)) = v87;
    v92 = v127;
    static RedactionReasons.placeholder.getter(v90);
    sub_100010344(&qword_100038918, type metadata accessor for PhotosReliveWidgetPlaceholderContent, (uint64_t)&unk_1000295B0);
    v94 = v93;
    v95 = v125;
    View.redacted(reason:)(v92, v91, v93);
    (*(void (**)(char *, uint64_t))(v128 + 8))(v92, v129);
    sub_100010EDC(v80, type metadata accessor for PhotosReliveWidgetPlaceholderContent);
    v97 = v130;
    v96 = v131;
    v98 = v140;
    (*(void (**)(char *, char *, uint64_t))(v131 + 32))(v130, v95, v140);
    v99 = v138;
    (*(void (**)(uint64_t *, char *, uint64_t))(v96 + 16))(v138, v97, v98);
    swift_storeEnumTagMultiPayload(v99, v136, 1);
    v100 = sub_10000BF08();
    v146 = v91;
    v147 = v94;
    v101 = swift_getOpaqueTypeConformance2(&v146, &opaque type descriptor for <<opaque return type of View.redacted(reason:)>>, 1);
    v76 = (uint64_t)v137;
    _ConditionalContent<>.init(storage:)(v99, &unk_1000357E8, v98, v100, v101);
    swift_release(v79);
    (*(void (**)(char *, uint64_t))(v96 + 8))(v97, v98);
    goto LABEL_22;
  }
  v54 = *(_QWORD *)(v53 + 16);
  if ((unint64_t)(v54 - 1) < 2)
  {
    *v44 = v53;
    swift_storeEnumTagMultiPayload(v44, v41, 1);
    sub_100010344(&qword_100038818, type metadata accessor for PhotosReliveWidgetMemoryContent, (uint64_t)&unk_1000296A0);
    v56 = v55;
    v57 = sub_10000BE98();
    swift_retain_n(v53, 2);
    v58 = (uint64_t)v120;
    _ConditionalContent<>.init(storage:)(v44, v118, &unk_100035810, v56, v57);
    sub_100010F04(v58, (uint64_t)v40, &qword_100038F28);
    swift_storeEnumTagMultiPayload(v40, v121, 0);
    v59 = sub_100010210();
    _ConditionalContent<>.init(storage:)(v40, v119, &type metadata for Never, v59, &protocol witness table for Never);
    sub_10000E500(v58, &qword_100038F28);
LABEL_25:
    v102 = &qword_100038F18;
    v114 = v143;
    sub_100010F04((uint64_t)v52, v143, &qword_100038F18);
    swift_storeEnumTagMultiPayload(v114, v142, 0);
    v115 = sub_1000101A4();
    v116 = sub_100010294();
    _ConditionalContent<>.init(storage:)(v114, v141, v144, v115, v116);
    swift_release(v53);
    v106 = (uint64_t)v52;
    goto LABEL_26;
  }
  if (!v54)
  {
    v107 = swift_retain_n(v53, 2);
    Text.Measurements.init()(v107);
    v108 = v118;
    *(_QWORD *)&v49[*(int *)(v118 + 20)] = v53;
    sub_100010EB0((uint64_t)v49, (uint64_t)v44, type metadata accessor for PhotosReliveWidgetMemoryContent);
    swift_storeEnumTagMultiPayload(v44, v41, 0);
    sub_100010344(&qword_100038818, type metadata accessor for PhotosReliveWidgetMemoryContent, (uint64_t)&unk_1000296A0);
    v110 = v109;
    v111 = sub_10000BE98();
    v112 = (uint64_t)v120;
    _ConditionalContent<>.init(storage:)(v44, v108, &unk_100035810, v110, v111);
    sub_100010F04(v112, (uint64_t)v40, &qword_100038F28);
    swift_storeEnumTagMultiPayload(v40, v121, 0);
    v113 = sub_100010210();
    _ConditionalContent<>.init(storage:)(v40, v119, &type metadata for Never, v113, &protocol witness table for Never);
    sub_10000E500(v112, &qword_100038F28);
    sub_100010EDC((uint64_t)v49, type metadata accessor for PhotosReliveWidgetMemoryContent);
    goto LABEL_25;
  }
LABEL_28:
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000017, 0x800000010002B550, "PhotosReliveWidget/PhotosReliveWidgetView.swift", 47, 2);
  __break(1u);
}

uint64_t sub_1000100B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = static Color.clear.getter();
  *a1 = result;
  return result;
}

unint64_t sub_1000100D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100038EF8;
  if (!qword_100038EF8)
  {
    v1 = sub_10000B978(&qword_100038EF0);
    sub_100010138();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> Group<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100038EF8);
  }
  return result;
}

unint64_t sub_100010138()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100038F00;
  if (!qword_100038F00)
  {
    v1 = sub_10000B978(&qword_100038F08);
    sub_1000101A4();
    sub_100010294();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100038F00);
  }
  return result;
}

unint64_t sub_1000101A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100038F10;
  if (!qword_100038F10)
  {
    v1 = sub_10000B978(&qword_100038F18);
    sub_100010210();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100038F10);
  }
  return result;
}

unint64_t sub_100010210()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100038F20;
  if (!qword_100038F20)
  {
    v1 = sub_10000B978(&qword_100038F28);
    sub_100010344(&qword_100038818, type metadata accessor for PhotosReliveWidgetMemoryContent, (uint64_t)&unk_1000296A0);
    sub_10000BE98();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100038F20);
  }
  return result;
}

unint64_t sub_100010294()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_100038F30;
  if (!qword_100038F30)
  {
    v1 = sub_10000B978(&qword_100038F38);
    sub_10000BF08();
    v2 = type metadata accessor for PhotosReliveWidgetPlaceholderContent(255);
    sub_100010344(&qword_100038918, type metadata accessor for PhotosReliveWidgetPlaceholderContent, (uint64_t)&unk_1000295B0);
    v4[0] = v2;
    v4[1] = v3;
    swift_getOpaqueTypeConformance2(v4, &opaque type descriptor for <<opaque return type of View.redacted(reason:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100038F30);
  }
  return result;
}

void sub_100010344(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(swift_getWitnessTable(a3, v5), a1);
  }
  sub_10000EACC();
}

uint64_t sub_100010380(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &opaque type descriptor for <<opaque return type of PhotosReliveWidgetView.body>>, 1);
}

char *initializeBufferWithCopyOfBuffer for PhotosReliveWidgetView(char *a1, char **a2, uint64_t a3)
{
  char *v4;
  int v5;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *(_QWORD *)v4 = *a2;
    v4 = &v10[(v5 + 16) & ~(unint64_t)v5];
    swift_retain(v10);
  }
  else
  {
    v7 = *a2;
    if (*a2)
    {
      *(_QWORD *)a1 = v7;
      a1[8] = *((_BYTE *)a2 + 8);
      v8 = a2[2];
      *((_QWORD *)a1 + 2) = v8;
      v9 = v7;
      swift_retain(v8);
    }
    else
    {
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((_QWORD *)a1 + 2) = a2[2];
    }
    v11 = a2[3];
    *((_QWORD *)v4 + 3) = v11;
    v4[32] = *((_BYTE *)a2 + 32);
    v12 = *(int *)(a3 + 28);
    v13 = &v4[v12];
    v14 = (uint64_t *)((char *)a2 + v12);
    swift_retain(v11);
    v15 = sub_10000B8A0(&qword_100038640);
    if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
    {
      v16 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(char *, uint64_t *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
      v17 = v13;
      v18 = v15;
      v19 = 1;
    }
    else
    {
      v20 = *v14;
      *(_QWORD *)v13 = *v14;
      swift_retain(v20);
      v17 = v13;
      v18 = v15;
      v19 = 0;
    }
    swift_storeEnumTagMultiPayload(v17, v18, v19);
  }
  return v4;
}

uint64_t destroy for PhotosReliveWidgetView(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  if (*(_QWORD *)a1)
  {

    swift_release(*(_QWORD *)(a1 + 16));
  }
  swift_release(*(_QWORD *)(a1 + 24));
  v4 = (_QWORD *)(a1 + *(int *)(a2 + 28));
  v5 = sub_10000B8A0(&qword_100038640);
  if (swift_getEnumCaseMultiPayload(v4, v5) != 1)
    return swift_release(*v4);
  v6 = type metadata accessor for WidgetFamily(0);
  return (*(uint64_t (**)(_QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
}

uint64_t initializeWithCopy for PhotosReliveWidgetView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = *(void **)a2;
  if (*(_QWORD *)a2)
  {
    *(_QWORD *)a1 = v6;
    *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
    v7 = *(_QWORD *)(a2 + 16);
    *(_QWORD *)(a1 + 16) = v7;
    v8 = v6;
    swift_retain(v7);
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  }
  v9 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v9;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v10 = *(int *)(a3 + 28);
  v11 = (uint64_t *)(a1 + v10);
  v12 = (uint64_t *)(a2 + v10);
  swift_retain(v9);
  v13 = sub_10000B8A0(&qword_100038640);
  if (swift_getEnumCaseMultiPayload(v12, v13) == 1)
  {
    v14 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v11, v12, v14);
    v15 = 1;
  }
  else
  {
    v16 = *v12;
    *v11 = *v12;
    swift_retain(v16);
    v15 = 0;
  }
  swift_storeEnumTagMultiPayload(v11, v13, v15);
  return a1;
}

uint64_t assignWithCopy for PhotosReliveWidgetView(uint64_t a1, __int128 *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  if (*(_QWORD *)a1)
  {
    if (v7)
    {
      *(_QWORD *)a1 = v7;
      v8 = v7;

      *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
      v9 = *(_QWORD *)(a1 + 16);
      v10 = *((_QWORD *)a2 + 2);
      *(_QWORD *)(a1 + 16) = v10;
      swift_retain(v10);
      swift_release(v9);
    }
    else
    {
      sub_1000107AC(a1);
      v13 = *((_QWORD *)a2 + 2);
      *(_OWORD *)a1 = *a2;
      *(_QWORD *)(a1 + 16) = v13;
    }
  }
  else if (v7)
  {
    *(_QWORD *)a1 = v7;
    *(_BYTE *)(a1 + 8) = *((_BYTE *)a2 + 8);
    v11 = *((_QWORD *)a2 + 2);
    *(_QWORD *)(a1 + 16) = v11;
    v12 = v7;
    swift_retain(v11);
  }
  else
  {
    v14 = *a2;
    *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)a1 = v14;
  }
  v15 = *(_QWORD *)(a1 + 24);
  v16 = *((_QWORD *)a2 + 3);
  *(_QWORD *)(a1 + 24) = v16;
  swift_retain(v16);
  swift_release(v15);
  *(_BYTE *)(a1 + 32) = *((_BYTE *)a2 + 32);
  if ((__int128 *)a1 != a2)
  {
    v17 = *(int *)(a3 + 28);
    v18 = (uint64_t *)(a1 + v17);
    v19 = (uint64_t *)((char *)a2 + v17);
    sub_10000E500(a1 + v17, &qword_100038640);
    v20 = sub_10000B8A0(&qword_100038640);
    if (swift_getEnumCaseMultiPayload(v19, v20) == 1)
    {
      v21 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v18, v19, v21);
      v22 = 1;
    }
    else
    {
      v23 = *v19;
      *v18 = *v19;
      swift_retain(v23);
      v22 = 0;
    }
    swift_storeEnumTagMultiPayload(v18, v20, v22);
  }
  return a1;
}

uint64_t sub_1000107AC(uint64_t a1)
{
  destroy for PhotosReliveWidgetEntry(a1);
  return a1;
}

uint64_t initializeWithTake for PhotosReliveWidgetView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v5 = *(int *)(a3 + 28);
  v6 = (void *)(a1 + v5);
  v7 = (const void *)(a2 + v5);
  v8 = sub_10000B8A0(&qword_100038640);
  if (swift_getEnumCaseMultiPayload(v7, v8) == 1)
  {
    v9 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v6, v7, v9);
    swift_storeEnumTagMultiPayload(v6, v8, 1);
  }
  else
  {
    memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  return a1;
}

uint64_t assignWithTake for PhotosReliveWidgetView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;

  v6 = *(void **)a1;
  if (*(_QWORD *)a1)
  {
    if (*(_QWORD *)a2)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;

      *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
      v7 = *(_QWORD *)(a1 + 16);
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
      swift_release(v7);
      goto LABEL_6;
    }
    sub_1000107AC(a1);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
LABEL_6:
  v8 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release(v8);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  if (a1 != a2)
  {
    v9 = *(int *)(a3 + 28);
    v10 = (void *)(a1 + v9);
    v11 = (const void *)(a2 + v9);
    sub_10000E500(a1 + v9, &qword_100038640);
    v12 = sub_10000B8A0(&qword_100038640);
    if (swift_getEnumCaseMultiPayload(v11, v12) == 1)
    {
      v13 = type metadata accessor for WidgetFamily(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v10, v11, v13);
      swift_storeEnumTagMultiPayload(v10, v12, 1);
    }
    else
    {
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotosReliveWidgetView(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000109C8);
}

uint64_t sub_1000109C8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = sub_10000B8A0(&qword_100038F40);
    return sub_10000BA0C((uint64_t)a1 + *(int *)(a3 + 28), a2, v9);
  }
}

uint64_t storeEnumTagSinglePayload for PhotosReliveWidgetView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100010A58);
}

_QWORD *sub_100010A58(_QWORD *result, uint64_t a2, int a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *result = a2;
  }
  else
  {
    v7 = sub_10000B8A0(&qword_100038F40);
    return (_QWORD *)sub_10000BA28((uint64_t)v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PhotosReliveWidgetView(uint64_t a1)
{
  uint64_t result;

  result = qword_100038FA0;
  if (!qword_100038FA0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PhotosReliveWidgetView);
  return result;
}

void sub_100010B00(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[4];

  v4[0] = &unk_100029CF8;
  v4[1] = &unk_100029D10;
  v4[2] = &unk_100029D28;
  sub_100010B88(319);
  if (v3 <= 0x3F)
  {
    v4[3] = *(_QWORD *)(v2 - 8) + 64;
    swift_initStructMetadata(a1, 256, 4, v4, a1 + 16);
  }
}

void sub_100010B88(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100038FB0)
  {
    v2 = type metadata accessor for WidgetFamily(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100038FB0);
  }
}

uint64_t sub_100010BDC()
{
  _QWORD v1[4];

  v1[0] = sub_10000B978(&qword_100038EF0);
  v1[1] = &type metadata for Color;
  v1[2] = sub_1000100D4();
  v1[3] = &protocol witness table for Color;
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of View.containerBackground<A>(for:alignment:content:)>>, 1);
}

void sub_100010C3C(uint64_t a1@<X8>)
{
  sub_100010C68(&qword_100038C70, (uint64_t (*)(_QWORD))&type metadata accessor for WidgetRenderingMode, 0xD000000000000013, 0x800000010002B570, a1);
}

void sub_100010C68(uint64_t *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  os_log_type_t v21;
  NSObject *v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v29 = a3;
  v10 = v5;
  v12 = type metadata accessor for EnvironmentValues(0);
  v13 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12, v14);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_10000B8A0(a1);
  __chkstk_darwin(v17, v18);
  sub_10000E8D8();
  sub_100010F04(v10, (uint64_t)v6, a1);
  if (swift_getEnumCaseMultiPayload(v6, v17) == 1)
  {
    v19 = a2(0);
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(a5, v6, v19);
  }
  else
  {
    v20 = *v6;
    v21 = static os_log_type_t.fault.getter();
    v22 = static Log.runtimeIssuesLog.getter();
    if (os_log_type_enabled(v22, v21))
    {
      v27 = a4;
      v23 = swift_slowAlloc(12, -1);
      v28 = a5;
      v24 = (uint8_t *)v23;
      v25 = swift_slowAlloc(32, -1);
      v31 = v25;
      *(_DWORD *)v24 = 136315138;
      v30 = sub_100019C88(v29, v27, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, &v31, v24 + 4, v24 + 12);
      _os_log_impl((void *)&_mh_execute_header, v22, v21, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v24, 0xCu);
      swift_arrayDestroy(v25, 1);
      sub_100010F30(v25);
      sub_100010F30((uint64_t)v24);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath(v16, v20);
    swift_release(v20);
    (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  }
  sub_10000E8C0();
}

uint64_t sub_100010E6C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PhotosReliveWidgetView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_100010EB0(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = a3(0);
  sub_10000E990(v3);
  sub_10000EACC();
}

void sub_100010EDC(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;

  v2 = a2(0);
  sub_10000ED9C(v2);
  sub_10000EACC();
}

void sub_100010F04(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = sub_10000B8A0(a3);
  sub_10000E990(v3);
  sub_10000EACC();
}

uint64_t sub_100010F30(uint64_t a1)
{
  return swift_slowDealloc(a1, -1, -1);
}

uint64_t sub_100010F3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(void);
  int v8;
  uint64_t result;

  v1 = sub_10000EF04();
  sub_10001C5E4();
  __chkstk_darwin(v2, v3);
  sub_10001C3EC();
  v6 = v5 - v4;
  sub_10001C498();
  v7();
  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 88))(v6, v1);
  result = 0;
  if (v8 != enum case for WidgetFamily.systemSmall(_:))
  {
    if (v8 == enum case for WidgetFamily.systemMedium(_:))
    {
      return 1;
    }
    else if (v8 == enum case for WidgetFamily.systemLarge(_:))
    {
      return 2;
    }
    else if (v8 == enum case for WidgetFamily.systemExtraLarge(_:))
    {
      return 3;
    }
    else
    {
      sub_10000EAF0(v6, *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
      return 0;
    }
  }
  return result;
}

uint64_t sub_10001102C()
{
  uint64_t v0;
  Swift::String v1;
  uint64_t v2;
  uint64_t v3;
  Swift::String v4;
  void *object;
  Swift::String v6;
  Swift::String v7;
  uint64_t v8;
  uint64_t v9;
  Swift::String v10;
  void *v11;
  _QWORD v13[2];
  _QWORD v14[2];

  v14[0] = 0;
  v14[1] = 0xE000000000000000;
  _StringGuts.grow(_:)(45);
  v1._object = (void *)0x800000010002B900;
  v1._countAndFlagsBits = 0xD000000000000011;
  String.append(_:)(v1);
  v2 = *(_QWORD *)(v0 + 8);
  v13[0] = *(_QWORD *)v0;
  v13[1] = v2;
  swift_bridgeObjectRetain(v2);
  v3 = sub_10000B8A0(&qword_1000392B0);
  v4._countAndFlagsBits = String.init<A>(describing:)(v13, v3);
  object = v4._object;
  String.append(_:)(v4);
  swift_bridgeObjectRelease(object);
  v6._countAndFlagsBits = 0x3A79616C656420;
  v6._object = (void *)0xE700000000000000;
  String.append(_:)(v6);
  Double.write<A>(to:)(v14, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation, *(double *)(v0 + 16));
  v7._countAndFlagsBits = 0x6C75646568637320;
  v7._object = (void *)0xEF20657461446465;
  String.append(_:)(v7);
  type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration(0);
  v8 = type metadata accessor for Date(0);
  sub_10000BDF4(&qword_1000392B8, (uint64_t (*)(uint64_t))&type metadata accessor for Date);
  v10._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(v8, v9);
  v11 = v10._object;
  String.append(_:)(v10);
  swift_bridgeObjectRelease(v11);
  return v14[0];
}

uint64_t sub_100011188(unint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  if (a1 > 2)
  {
    v3 = 0xE700000000000000;
    v2 = 0x6E776F6E6B6E75;
  }
  else
  {
    v2 = *(_QWORD *)&aMemory_0[8 * a1];
    v3 = qword_10002A380[a1];
  }
  v4 = v3;
  String.append(_:)(*(Swift::String *)&v2);
  return swift_bridgeObjectRelease(v3);
}

uint64_t sub_1000111E8()
{
  uint64_t result;

  sub_10001BB44(0, &qword_100039208, OS_os_log_ptr);
  result = OS_os_log.init(subsystem:category:)(0xD000000000000023, 0x800000010002B6B0, 0xD00000000000001CLL, 0x800000010002B9D0);
  qword_100039010 = result;
  return result;
}

uint64_t sub_10001125C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  NSString v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  os_log_type_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  __n128 v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE v46[4];
  int v47;
  os_log_t v48;
  uint64_t v49;
  unint64_t v50;
  _BYTE *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57[2];

  v4 = type metadata accessor for WidgetFamily(0);
  v54 = *(_QWORD *)(v4 - 8);
  v55 = v4;
  v6 = __chkstk_darwin(v4, v5);
  __chkstk_darwin(v6, v7);
  v51 = &v46[-v8];
  v9 = type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration(0);
  v11 = __chkstk_darwin(v9, v10);
  v13 = &v46[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v11, v14);
  v16 = &v46[-v15];
  sub_100011914();
  v18 = v17;
  v19 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
  v20 = String._bridgeToObjectiveC()();
  v21 = objc_msgSend(v19, "dataForKey:", v20, swift_bridgeObjectRelease(v18).n128_f64[0]);

  if (!v21)
    return sub_10000BA28(a2, 1, 1, v9);
  v53 = a2;
  v22 = static Data._unconditionallyBridgeFromObjectiveC(_:)(v21);
  v24 = v23;

  v25 = type metadata accessor for PropertyListDecoder(0);
  swift_allocObject(v25, *(unsigned int *)(v25 + 48), *(unsigned __int16 *)(v25 + 52));
  v26 = PropertyListDecoder.init()();
  sub_10000BDF4(&qword_100039308, type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration);
  dispatch thunk of PropertyListDecoder.decode<A>(_:from:)(v9, v22, v24, v9, v27);
  v52 = v9;
  v50 = v24;
  swift_release(v26);
  v30 = static os_log_type_t.debug.getter(v29);
  v31 = v55;
  if (qword_1000385E0 != -1)
    swift_once(&qword_1000385E0, sub_1000111E8);
  v32 = qword_100039010;
  sub_10001BEEC((uint64_t)v16, (uint64_t)v13, (void (*)(_QWORD))type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration);
  v33 = v54;
  v34 = v51;
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v54 + 16))(v51, a1, v31);
  if (os_log_type_enabled(v32, v30))
  {
    v35 = swift_slowAlloc(22, -1);
    v49 = swift_slowAlloc(64, -1);
    v57[0] = v49;
    *(_DWORD *)v35 = 136315394;
    v48 = v32;
    v47 = v30;
    v36 = sub_10001102C();
    v38 = v37;
    v56 = sub_100019C88(v36, v37, v57);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v56, v57, v35 + 4, v35 + 12);
    swift_bridgeObjectRelease(v38);
    sub_100010EDC((uint64_t)v13, type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration);
    *(_WORD *)(v35 + 12) = 2080;
    sub_10000BDF4(&qword_100039020, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily);
    v40 = dispatch thunk of CustomStringConvertible.description.getter(v31, v39);
    v42 = v41;
    v56 = sub_100019C88(v40, v41, v57);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v56, v57, v35 + 14, v35 + 22);
    v43 = swift_bridgeObjectRelease(v42);
    (*(void (**)(_BYTE *, uint64_t, __n128))(v33 + 8))(v34, v31, v43);
    _os_log_impl((void *)&_mh_execute_header, v48, (os_log_type_t)v47, "decoded saved scheduled reload config %s for widget family %s", (uint8_t *)v35, 0x16u);
    v44 = v49;
    swift_arrayDestroy(v49, 2);
    swift_slowDealloc(v44, -1, -1);
    swift_slowDealloc(v35, -1, -1);
    sub_10001C014(v22, v50);
  }
  else
  {
    sub_10001C014(v22, v50);
    sub_100010EDC((uint64_t)v13, type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration);
    (*(void (**)(_BYTE *, uint64_t))(v33 + 8))(v34, v31);
  }
  v45 = v53;
  sub_10001BF54((uint64_t)v16, v53);
  return sub_10000BA28(v45, 0, 1, v52);
}

unint64_t sub_100011914()
{
  uint64_t v0;
  Swift::String v1;
  void *object;

  _StringGuts.grow(_:)(18);
  v0 = swift_bridgeObjectRelease(0xE000000000000000);
  WidgetFamily.rawValue.getter(v0);
  v1._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter(&type metadata for Int, &protocol witness table for Int);
  object = v1._object;
  String.append(_:)(v1);
  swift_bridgeObjectRelease(object);
  return 0xD000000000000010;
}

uint64_t sub_1000119AC(uint64_t a1, uint64_t a2)
{
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  NSString v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSString v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  Class isa;
  NSString v48;
  double v49;
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  os_log_type_t v54;
  NSObject *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  os_log_type_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  unint64_t v69;
  __n128 v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  os_log_t v77;
  uint64_t v78;
  unint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  _OWORD v89[2];

  v4 = type metadata accessor for WidgetFamily(0);
  v5 = *(_QWORD *)(v4 - 8);
  v81 = v4;
  v82 = v5;
  __chkstk_darwin(v4, v6);
  v80 = (char *)&v77 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_10000B8A0(&qword_100039038);
  __chkstk_darwin(v8, v9);
  v11 = (char *)&v77 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration(0);
  v14 = __chkstk_darwin(v12, v13);
  v16 = (char *)&v77 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14, v17);
  v83 = (uint64_t)&v77 - v18;
  v19 = type metadata accessor for OSSignpostID(0);
  v84 = *(_QWORD *)(v19 - 8);
  v85 = v19;
  __chkstk_darwin(v19, v20);
  v22 = (char *)&v77 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v86 = objc_msgSend((id)objc_opt_self(NSUserDefaults), "standardUserDefaults");
  sub_100011914();
  v24 = v23;
  if (qword_1000385E0 != -1)
    swift_once(&qword_1000385E0, sub_1000111E8);
  v25 = (id)qword_100039010;
  OSSignpostID.init(log:)();
  sub_10001A404(a1, (uint64_t)v11);
  if (sub_10000BA0C((uint64_t)v11, 1, v12) == 1)
  {
    sub_10000E500((uint64_t)v11, &qword_100039038);
    v26 = String._bridgeToObjectiveC()();
    v27 = v86;
    v28 = objc_msgSend(v86, "objectForKey:", v26);

    if (v28)
    {
      _bridgeAnyObjectToAny(_:)(v89, v28);
      swift_unknownObjectRelease(v28);
      sub_10000E500((uint64_t)v89, &qword_1000392E0);
      v30 = static os_signpost_type_t.begin.getter(v29);
      v31 = qword_100039010;
      v32 = os_signpost(_:dso:log:name:signpostID:)(v30, &_mh_execute_header, qword_100039010, "removeScheduledReloadConfig", 27, 2, v22);
      v33 = static os_log_type_t.debug.getter(v32);
      os_log(_:dso:log:_:_:)(v33, &_mh_execute_header, v31, "deleted saved scheduled reload configuration", 44, 2, &_swiftEmptyArrayStorage);
      v34 = String._bridgeToObjectiveC()();
      objc_msgSend(v27, "removeObjectForKey:", v34, swift_bridgeObjectRelease(v24).n128_f64[0]);

      v35 = CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
      if (!(_DWORD)v35)
      {
        v36 = static os_log_type_t.error.getter(v35);
        v35 = os_log(_:dso:log:_:_:)(v36, &_mh_execute_header, qword_100039010, "Failed to synchronize defaults for scheduled reload config", 58, 2, &_swiftEmptyArrayStorage);
      }
      v37 = static os_signpost_type_t.end.getter(v35);
      os_signpost(_:dso:log:name:signpostID:)(v37, &_mh_execute_header, qword_100039010, "removeScheduledReloadConfig", 27, 2, v22);

    }
    else
    {
      memset(v89, 0, sizeof(v89));

      swift_bridgeObjectRelease(v24);
      sub_10000E500((uint64_t)v89, &qword_1000392E0);
    }
    return (*(uint64_t (**)(char *, uint64_t))(v84 + 8))(v22, v85);
  }
  else
  {
    v38 = v83;
    v39 = sub_10001BF54((uint64_t)v11, v83);
    v40 = static os_signpost_type_t.begin.getter(v39);
    os_signpost(_:dso:log:name:signpostID:)(v40, &_mh_execute_header, v25, "saveScheduledReloadConfig", 25, 2, v22);
    v41 = type metadata accessor for PropertyListEncoder(0);
    swift_allocObject(v41, *(unsigned int *)(v41 + 48), *(unsigned __int16 *)(v41 + 52));
    v42 = PropertyListEncoder.init()();
    v43 = sub_10001BF98();
    v44 = dispatch thunk of PropertyListEncoder.encode<A>(_:)(a1, v8, v43);
    v46 = v45;
    swift_release(v42);
    v78 = v44;
    v79 = v46;
    isa = Data._bridgeToObjectiveC()().super.isa;
    v48 = String._bridgeToObjectiveC()();
    *(_QWORD *)&v49 = swift_bridgeObjectRelease(v24).n128_u64[0];
    v50 = v86;
    objc_msgSend(v86, "setObject:forKey:", isa, v48, v49);

    v51 = CFPreferencesAppSynchronize(kCFPreferencesCurrentApplication);
    v52 = &qword_100039000;
    if (!(_DWORD)v51)
    {
      v53 = static os_log_type_t.error.getter(v51);
      v51 = os_log(_:dso:log:_:_:)(v53, &_mh_execute_header, qword_100039010, "Failed to synchronize defaults for scheduled reload config", 58, 2, &_swiftEmptyArrayStorage);
    }
    v54 = static os_log_type_t.debug.getter(v51);
    v55 = qword_100039010;
    sub_10001BEEC(v38, (uint64_t)v16, (void (*)(_QWORD))type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration);
    v56 = v82;
    v57 = v80;
    v58 = a2;
    v59 = v81;
    (*(void (**)(char *, uint64_t, uint64_t))(v82 + 16))(v80, v58, v81);
    v77 = v55;
    if (os_log_type_enabled(v55, v54))
    {
      v60 = swift_slowAlloc(22, -1);
      v61 = swift_slowAlloc(64, -1);
      *(_QWORD *)&v89[0] = v61;
      *(_DWORD *)v60 = 136315394;
      v62 = v54;
      v63 = sub_10001102C();
      v65 = v64;
      v87 = sub_100019C88(v63, v64, (uint64_t *)v89);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, &v88, v60 + 4, v60 + 12);
      swift_bridgeObjectRelease(v65);
      sub_100010EDC((uint64_t)v16, type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration);
      *(_WORD *)(v60 + 12) = 2080;
      sub_10000BDF4(&qword_100039020, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily);
      v67 = dispatch thunk of CustomStringConvertible.description.getter(v59, v66);
      v69 = v68;
      v87 = sub_100019C88(v67, v68, (uint64_t *)v89);
      v52 = &qword_100039000;
      v38 = v83;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v87, &v88, v60 + 14, v60 + 22);
      v70 = swift_bridgeObjectRelease(v69);
      (*(void (**)(char *, uint64_t, __n128))(v82 + 8))(v57, v59, v70);
      _os_log_impl((void *)&_mh_execute_header, v77, v62, "saved scheduled reload configuration %s for widget family %s", (uint8_t *)v60, 0x16u);
      swift_arrayDestroy(v61, 2);
      v71 = v61;
      v50 = v86;
      swift_slowDealloc(v71, -1, -1);
      swift_slowDealloc(v60, -1, -1);
      v72 = sub_10001C014(v78, v79);
    }
    else
    {
      sub_10001C014(v78, v79);
      sub_100010EDC((uint64_t)v16, type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration);
      v72 = (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v57, v59);
    }
    v75 = v84;
    v74 = v85;
    v76 = static os_signpost_type_t.end.getter(v72);
    os_signpost(_:dso:log:name:signpostID:)(v76, &_mh_execute_header, v52[2], "saveScheduledReloadConfig", 25, 2, v22);

    sub_100010EDC(v38, type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration);
    return (*(uint64_t (**)(char *, uint64_t))(v75 + 8))(v22, v74);
  }
}

void sub_100012234(uint64_t a1, unsigned __int8 a2)
{
  Hasher._combine(_:)(a2);
}

uint64_t sub_100012258(uint64_t a1, uint64_t a2)
{
  BOOL v3;
  BOOL v6;
  char v8;

  v3 = a1 == 0x6564497972746E65 && a2 == 0xEF7265696669746ELL;
  if (v3
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x6564497972746E65, 0xEF7265696669746ELL, a1, a2, 0) & 1) != 0)
  {
    swift_bridgeObjectRelease(a2);
    return 0;
  }
  else
  {
    v6 = a1 == 0x79616C6564 && a2 == 0xE500000000000000;
    if (v6 || (_stringCompareWithSmolCheck(_:_:expecting:)(0x79616C6564, 0xE500000000000000, a1, a2, 0) & 1) != 0)
    {
      swift_bridgeObjectRelease(a2);
      return 1;
    }
    else if (a1 == 0x656C756465686373 && a2 == 0xED00006574614464)
    {
      swift_bridgeObjectRelease(a2);
      return 2;
    }
    else
    {
      v8 = _stringCompareWithSmolCheck(_:_:expecting:)(0x656C756465686373, 0xED00006574614464, a1, a2, 0);
      swift_bridgeObjectRelease(a2);
      if ((v8 & 1) != 0)
        return 2;
      else
        return 3;
    }
  }
}

uint64_t sub_1000123BC()
{
  return 3;
}

void sub_1000123C4(unsigned __int8 a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, 0);
  Hasher._combine(_:)(a1);
  Hasher._finalize()();
  sub_10001C6DC();
}

uint64_t sub_100012400()
{
  return 0;
}

uint64_t sub_10001240C(char a1)
{
  return *(_QWORD *)&aEntryidedelay[8 * a1];
}

void sub_10001242C()
{
  unsigned __int8 *v0;

  sub_1000123C4(*v0);
}

void sub_100012444(uint64_t a1)
{
  unsigned __int8 *v1;

  sub_100012234(a1, *v1);
}

void sub_10001244C(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v3[9];

  v2 = *v1;
  Hasher.init(_seed:)(v3, a1);
  Hasher._combine(_:)(v2);
  Hasher._finalize()();
  sub_10001C6DC();
}

uint64_t sub_100012484()
{
  char *v0;

  return sub_10001240C(*v0);
}

uint64_t sub_10001248C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_100012258(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1000124B0()
{
  return sub_100012400();
}

uint64_t sub_1000124CC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1000123BC();
  *a1 = result;
  return result;
}

uint64_t sub_1000124F0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001BEB0();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100012518(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001BEB0();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100012540(_QWORD *a1)
{
  double *v1;
  uint64_t v2;
  double *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  char v21;
  char v22;
  char v23;

  v3 = v1;
  v5 = sub_10000B8A0(&qword_1000392A0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = a1[3];
  v11 = a1[4];
  sub_10001BE8C(a1, v10);
  v12 = sub_10001BEB0();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for PhotosReliveWidgetScheduledReloadConfiguration.CodingKeys, &type metadata for PhotosReliveWidgetScheduledReloadConfiguration.CodingKeys, v12, v10, v11);
  v13 = *v3;
  v14 = *((_QWORD *)v3 + 1);
  v23 = 0;
  KeyedEncodingContainer.encodeIfPresent(_:forKey:)(*(_QWORD *)&v13, v14, &v23, v5);
  if (!v2)
  {
    v15 = v3[2];
    v22 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(&v22, v5, v15);
    v16 = (char *)v3 + *(int *)(type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration(0) + 24);
    v21 = 2;
    v17 = type metadata accessor for Date(0);
    sub_10000BDF4(&qword_1000392A8, (uint64_t (*)(uint64_t))&type metadata accessor for Date);
    KeyedEncodingContainer.encode<A>(_:forKey:)(v16, &v21, v5, v17, v18);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

void sub_1000126BC(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
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
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  char v36;
  char v37;
  char v38;

  v32 = a2;
  v3 = type metadata accessor for Date(0);
  v30 = *(_QWORD *)(v3 - 8);
  v31 = v3;
  __chkstk_darwin(v3, v4);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_10000B8A0(&qword_100039288);
  v7 = *(_QWORD *)(v34 - 8);
  __chkstk_darwin(v34, v8);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration(0);
  __chkstk_darwin(v11, v12);
  v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = 0;
  v15 = a1[3];
  v16 = a1[4];
  sub_10001BE8C(a1, v15);
  v17 = sub_10001BEB0();
  v33 = v10;
  v18 = v35;
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for PhotosReliveWidgetScheduledReloadConfiguration.CodingKeys, &type metadata for PhotosReliveWidgetScheduledReloadConfiguration.CodingKeys, v17, v15, v16);
  if (v18)
  {
    sub_10001C094(a1);
    swift_bridgeObjectRelease(*((_QWORD *)v14 + 1));
  }
  else
  {
    v19 = v7;
    v21 = v31;
    v20 = v32;
    v38 = 0;
    *(_QWORD *)v14 = KeyedDecodingContainer.decodeIfPresent(_:forKey:)(&v38, v34);
    *((_QWORD *)v14 + 1) = v22;
    v37 = 1;
    KeyedDecodingContainer.decode(_:forKey:)(&v37, v34);
    *((_QWORD *)v14 + 2) = v23;
    v36 = 2;
    sub_10000BDF4(&qword_100039298, (uint64_t (*)(uint64_t))&type metadata accessor for Date);
    v25 = v24;
    v35 = v6;
    v26 = v21;
    v27 = v21;
    v28 = v33;
    v29 = v34;
    KeyedDecodingContainer.decode<A>(_:forKey:)(v27, &v36, v34, v26, v25);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v28, v29);
    (*(void (**)(char *, char *, uint64_t))(v30 + 32))(&v14[*(int *)(v11 + 24)], v35, v26);
    sub_10001BEEC((uint64_t)v14, v20, (void (*)(_QWORD))type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration);
    sub_10001C094(a1);
    sub_100010EDC((uint64_t)v14, type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration);
  }
}

void sub_100012920(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  sub_1000126BC(a1, a2);
}

uint64_t sub_100012934(_QWORD *a1)
{
  return sub_100012540(a1);
}

id sub_10001294C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSString v4;
  void *v5;
  id v6;

  if (a3)
    v4 = String._bridgeToObjectiveC()();
  else
    v4 = 0;
  v5 = (void *)objc_opt_self(PXTimelineEntry);
  v6 = objc_msgSend(v5, "fallbackEntryForContentType:sourceIdentifier:size:", a1, v4, sub_100010F3C());

  return v6;
}

uint64_t PhotosReliveWidgetEntry.shouldReload.getter(uint64_t a1, char a2, uint64_t a3)
{
  if (!a3 || a2)
    return 0;
  if (*(_QWORD *)(a3 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_image))
    return *(unsigned __int8 *)(a3 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_imageIsDegraded);
  return 1;
}

void PhotosReliveWidgetEntry.date.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;

  v5 = sub_10001C4DC();
  sub_10001C3B8();
  __chkstk_darwin(v6, v7);
  sub_10000E968();
  sub_10000B8A0(&qword_100039018);
  sub_10000E868();
  __chkstk_darwin(v8, v9);
  sub_10001C5CC();
  v11 = sub_10001C51C(v10, "startTime");
  if (!v11)
  {
    v14 = sub_10001C648(v1, 1);
    goto LABEL_5;
  }
  v12 = v11;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32);
  v13(v1, v2, v5);
  sub_10001C648(v1, 0);
  v14 = sub_10000BA0C(v1, 1, v5);
  if ((_DWORD)v14 == 1)
  {
LABEL_5:
    Date.init()(v14);
    sub_10000E500(v1, &qword_100039018);
    goto LABEL_6;
  }
  v13(a1, v1, v5);
LABEL_6:
  sub_10001C4F4();
}

void PhotosReliveWidgetEntry.endDate.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void (*v13)(void);
  uint64_t v14;
  uint64_t v15;

  v5 = sub_10001C4DC();
  sub_10001C3B8();
  __chkstk_darwin(v6, v7);
  sub_10001C5CC();
  sub_10000B8A0(&qword_100039018);
  sub_10000E868();
  __chkstk_darwin(v8, v9);
  sub_10000E968();
  v11 = sub_10001C51C(v10, "endTime");
  if (!v11)
  {
    v14 = sub_10001C63C(v2, 1);
    goto LABEL_5;
  }
  v12 = v11;
  static Date._unconditionallyBridgeFromObjectiveC(_:)();

  v13 = *(void (**)(void))(v3 + 32);
  sub_10001C498();
  v13();
  sub_10001C63C(v2, 0);
  v14 = sub_10000BA0C(v2, 1, v5);
  if ((_DWORD)v14 == 1)
  {
LABEL_5:
    v15 = Date.init()(v14);
    Date.addingTimeInterval(_:)(v15, 21600.0);
    sub_10000EAF0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
    sub_10000E500(v2, &qword_100039018);
    goto LABEL_6;
  }
  ((void (*)(uint64_t, uint64_t, uint64_t))v13)(a1, v2, v5);
LABEL_6:
  sub_10001C4F4();
}

void PhotosReliveWidgetEntry.description.getter()
{
  char v0;
  char v1;
  uint64_t v2;
  uint64_t v3;

  sub_10000F0E4();
  v1 = v0;
  sub_10000B8A0(&qword_100039018);
  sub_10000E868();
  __chkstk_darwin(v2, v3);
  sub_10001C5B4();
  __asm { BR              X10 }
}

uint64_t sub_100012CBC()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  Swift::String v9;
  uint64_t v10;
  id v11;
  Swift::String v12;
  uint64_t v13;
  id v14;
  Swift::String v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  Swift::String v21;
  void *object;
  uint64_t v23;
  uint64_t v24;
  Swift::String v25;

  *(_QWORD *)(v5 - 96) = 0;
  *(_QWORD *)(v5 - 88) = 0xE000000000000000;
  _StringGuts.grow(_:)(59);
  v6 = *(_QWORD *)(v5 - 88);
  *(_QWORD *)(v5 - 96) = *(_QWORD *)(v5 - 96);
  *(_QWORD *)(v5 - 88) = v6;
  sub_10001C724(v1 + 1, (uint64_t)"timelineEntry id: ");
  v8 = sub_10001C574(v7, "localIdentifier");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  sub_10001C6FC();
  sub_10001C5A4();
  sub_10000EDBC();
  v9._countAndFlagsBits = 0x746E65746E6F6320;
  v9._object = (void *)0xEE00203A65707954;
  String.append(_:)(v9);
  v11 = sub_10001C574(v10, "contentType");
  sub_100011188((unint64_t)v11);
  v12._countAndFlagsBits = 0x20746573736120;
  v12._object = (void *)0xE700000000000000;
  String.append(_:)(v12);
  v14 = sub_10001C574(v13, "assetLocalIdentifier");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
  sub_10001C6FC();
  sub_10001C5A4();
  sub_10000EDBC();
  v15._countAndFlagsBits = 0x6954747261747320;
  v15._object = (void *)0xEC000000203A656DLL;
  String.append(_:)(v15);
  v17 = sub_10001C574(v16, "startTime");
  if (v17)
  {
    v18 = v17;
    ((void (*)(void))static Date._unconditionallyBridgeFromObjectiveC(_:))();

    v19 = sub_10001C4DC();
    v20 = 0;
  }
  else
  {
    v19 = type metadata accessor for Date(0);
    v20 = 1;
  }
  sub_10000BA28(v4, v20, 1, v19);
  v21._countAndFlagsBits = ((uint64_t (*)(uint64_t, uint64_t))String.init<A>(describing:))(v4, v3);
  object = v21._object;
  String.append(_:)(v21);
  swift_bridgeObjectRelease(object);
  v23 = *(_QWORD *)(v5 - 88);
  *(_QWORD *)(v5 - 96) = *(_QWORD *)(v5 - 96);
  *(_QWORD *)(v5 - 88) = v23;
  if (v2 == 2)
    goto LABEL_7;
  if (!v0)
    return *(_QWORD *)(v5 - 96);
  v24 = type metadata accessor for PhotosReliveWidgetPlaceholderViewModel(0);
  if (swift_dynamicCastClass(v0, v24))
  {
LABEL_7:
    sub_10001C724(v1 + 5, (uint64_t)" Placeholder-displayed");
    if (!v0)
      return *(_QWORD *)(v5 - 96);
  }
  if (*(_BYTE *)(v0 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_imageIsDegraded) == 1)
  {
    swift_retain(v0);
    v25._countAndFlagsBits = 0x642D6567616D4920;
    v25._object = (void *)0xEF64656461726765;
    String.append(_:)(v25);
    swift_release(v0);
  }
  return *(_QWORD *)(v5 - 96);
}

void sub_100012F00(uint64_t a1@<X8>)
{
  PhotosReliveWidgetEntry.date.getter(a1);
}

void sub_100012F0C()
{
  PhotosReliveWidgetEntry.description.getter();
}

id sub_100012F1C(uint64_t a1)
{
  return sub_1000167F0(a1, &qword_10003C678);
}

uint64_t sub_100012F28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  NSString v54;
  NSString v55;
  id v56;
  uint64_t v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  __n128 v68;
  __n128 v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  Class isa;
  id v74;
  void *v75;
  id v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  char v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  __n128 v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  id v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  id v103;
  uint64_t v104;
  __int128 v105;
  unint64_t v106;
  unint64_t v107;
  unint64_t v108;
  uint64_t v109;

  v104 = a5;
  *(_QWORD *)&v105 = a4;
  v100 = type metadata accessor for PhotosReliveWidgetSize(0);
  __chkstk_darwin(v100, v7);
  v99 = (uint64_t)&v99 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_10000B8A0(&qword_100039210);
  __chkstk_darwin(v9, v10);
  v12 = (char *)&v99 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_10000B8A0(&qword_100039218);
  __chkstk_darwin(v13, v14);
  v16 = (char *)&v99 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for _IntentPhotoItemCollection(0);
  v18 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17, v19);
  v21 = (char *)&v99 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = type metadata accessor for OSSignpostID(0);
  __chkstk_darwin(v22, v23);
  v26 = (char *)&v99 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000385F0 == -1)
  {
    if (a6)
      goto LABEL_3;
LABEL_28:
    v97 = sub_10000B8A0(&qword_100039220);
    v66 = swift_allocObject(v97, 56, 7);
    *(_OWORD *)(v66 + 16) = xmmword_100029240;
    *(_QWORD *)(v66 + 32) = objc_msgSend((id)objc_opt_self(PXTimelineEntry), "privacyDisclosureEntryForContentType:", 2);
    *(_BYTE *)(v66 + 40) = 3;
    *(_QWORD *)(v66 + 48) = 0;
    return v66;
  }
  v102 = v24;
  swift_once(&qword_1000385F0, sub_1000167E4);
  v24 = v102;
  if (!a6)
    goto LABEL_28;
LABEL_3:
  v101 = v22;
  v102 = v24;
  v27 = (void *)qword_10003C680;
  v28 = a6;
  v29 = v27;
  v30 = OSSignpostID.init(log:)();
  v31 = static os_signpost_type_t.begin.getter(v30);
  v103 = v29;
  v32 = os_signpost(_:dso:log:name:signpostID:)(v31, &_mh_execute_header, v29, "LoadAllEntries", 14, 2, v26);
  IntentParameter.wrappedValue.getter(v32);
  if (sub_10000BA0C((uint64_t)v16, 1, v17) == 1)
  {
    sub_10000E500((uint64_t)v16, &qword_100039218);
    IntentParameter.wrappedValue.getter(v33);
    v34 = v106;
    if (v106)
    {
      v36 = v107;
      v35 = v108;
      v37 = v109;
      swift_release(v106);
      swift_bridgeObjectRelease(v37);
    }
    else
    {
      v36 = 0;
      v35 = 0;
    }
    v44 = v105;
    v45 = IntentParameter.wrappedValue.getter(v34);
    v42 = v106;
    if (v106)
    {
      v46 = v108;
      v47 = v109;
      EntityProperty.wrappedValue.getter(&v106, v45);
      swift_bridgeObjectRelease(v47);
      swift_bridgeObjectRelease(v46);
      swift_release(v42);
      v42 = v107;
    }
  }
  else
  {
    v38 = (*(uint64_t (**)(char *, char *, uint64_t))(v18 + 32))(v21, v16, v17);
    v39 = _IntentPhotoItemCollection.items.getter(v38);
    sub_1000137E0(v39, (uint64_t)v12);
    swift_bridgeObjectRelease(v39);
    v40 = type metadata accessor for _IntentPhotoItem(0);
    if (sub_10000BA0C((uint64_t)v12, 1, v40) == 1)
    {
      (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
      sub_10000E500((uint64_t)v12, &qword_100039210);
      v41 = 0;
      v42 = 0;
    }
    else
    {
      v41 = _IntentPhotoItem.identifier.getter();
      v42 = v43;
      (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v40 - 8) + 8))(v12, v40);
    }
    swift_bridgeObjectRetain(v42);
    v36 = v41;
    v35 = v42;
    v44 = v105;
  }
  v48 = v36;
  v49 = v28;
  v50 = sub_100013858(v48, v35, v28);
  v52 = v51;
  swift_bridgeObjectRelease(v35);
  if (v52)
  {
    if (v42)
    {
      v53 = (void *)objc_opt_self(PXWidgetTimeline);
      swift_bridgeObjectRetain(v52);
      v54 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v52);
      v55 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v42);
      v56 = objc_msgSend(v53, "timelineFromLibrary:albumIdentifier:widgetIdentifier:widgetSize:", v28, v54, v55, *(double *)(v44 + *(int *)(v100 + 20)), *(double *)(v44 + *(int *)(v100 + 20) + 8));

      v49 = v28;
      v57 = sub_10001BB44(0, &qword_100039230, PXTimelineEntry_ptr);
      v58 = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(v56, v57);

      goto LABEL_18;
    }
  }
  else
  {
    swift_bridgeObjectRelease(v42);
  }
  v58 = &_swiftEmptyArrayStorage;
LABEL_18:
  v59 = v103;
  v60 = sub_1000140F8(v104, (unint64_t)v58);
  __chkstk_darwin(v60, v61);
  *(&v99 - 2) = v44;
  *(&v99 - 1) = (uint64_t)v49;
  sub_1000142AC((void (*)(uint64_t *__return_ptr, id *))sub_10001C2A0, (uint64_t)(&v99 - 4), v60, v62, v63, v64);
  v66 = v65;
  v67 = static os_signpost_type_t.end.getter(v65);
  os_signpost(_:dso:log:name:signpostID:)(v67, &_mh_execute_header, v59, "LoadAllEntries", 14, 2, v26);
  if (!*(_QWORD *)(v66 + 16))
  {
    v69 = swift_bridgeObjectRelease(v66);
    if (v52)
    {
      v70 = (void *)objc_opt_self(PHAssetCollection);
      v71 = sub_10000B8A0(&qword_100039228);
      v72 = swift_allocObject(v71, 48, 7);
      v105 = xmmword_100029240;
      *(_OWORD *)(v72 + 16) = xmmword_100029240;
      *(_QWORD *)(v72 + 32) = v50;
      *(_QWORD *)(v72 + 40) = v52;
      swift_bridgeObjectRetain_n(v52, 2);
      isa = Array._bridgeToObjectiveC()().super.isa;
      v74 = objc_msgSend(v49, "librarySpecificFetchOptions", swift_bridgeObjectRelease(v72).n128_f64[0]);
      v75 = v49;
      v76 = objc_msgSend(v70, "fetchAssetCollectionsWithLocalIdentifiers:options:", isa, v74);

      v77 = objc_msgSend(v76, "firstObject");
      if (!v77)
      {
        v85 = swift_bridgeObjectRelease(v52);
        v86 = static os_log_type_t.default.getter(v85);
        os_log(_:dso:log:_:_:)(v86, &_mh_execute_header, v103, "timeline request returned no entries because album was deleted", 62, 2, &_swiftEmptyArrayStorage);
        v87 = (void *)objc_opt_self(PXTimelineEntry);
        v88 = sub_100010F3C();
        v89 = sub_10001AA44(v50, v52, v88, v87);
        v90 = v44;
        v91 = v99;
        sub_10001BEEC(v90, v99, (void (*)(_QWORD))type metadata accessor for PhotosReliveWidgetSize);
        type metadata accessor for PhotosReliveWidgetViewModel(0);
        v92 = v75;
        v93 = v89;
        sub_10001E594();
        v95 = v94;

        sub_100010EDC(v91, type metadata accessor for PhotosReliveWidgetSize);
        swift_release(v95);
        v96 = sub_10000B8A0(&qword_100039220);
        v66 = swift_allocObject(v96, 56, 7);
        *(_OWORD *)(v66 + 16) = v105;
        *(_QWORD *)(v66 + 32) = v93;
        *(_BYTE *)(v66 + 40) = 1;
        *(_QWORD *)(v66 + 48) = 0;

        goto LABEL_25;
      }

      v69 = swift_bridgeObjectRelease(v52);
      v49 = v75;
      v59 = v103;
    }
    v78 = static os_log_type_t.default.getter(v69);
    os_log(_:dso:log:_:_:)(v78, &_mh_execute_header, v59, "timeline request returned no entries; using fallback no-content state",
      69,
      2,
      &_swiftEmptyArrayStorage);
    v79 = sub_10000B8A0(&qword_100039220);
    v66 = swift_allocObject(v79, 56, 7);
    *(_OWORD *)(v66 + 16) = xmmword_100029240;
    v80 = sub_10001294C(2, v50, v52);
    v82 = v81;
    v84 = v83;
    swift_bridgeObjectRelease(v52);
    *(_QWORD *)(v66 + 32) = v80;
    *(_BYTE *)(v66 + 40) = v82;
    *(_QWORD *)(v66 + 48) = v84;

LABEL_25:
    swift_unknownObjectRelease(v60);
    goto LABEL_26;
  }
  swift_unknownObjectRelease(v60);

  v68 = swift_bridgeObjectRelease(v52);
LABEL_26:
  (*(void (**)(char *, uint64_t, __n128))(v102 + 8))(v26, v101, v68);
  return v66;
}

_QWORD *sub_100013750(uint64_t a1)
{
  _QWORD *result;
  int v3;
  char v4;
  uint64_t v5;

  result = (_QWORD *)sub_10001B9D8(a1);
  if ((v4 & 1) != 0)
    goto LABEL_8;
  if (*(_DWORD *)(a1 + 36) != v3)
  {
    __break(1u);
LABEL_8:
    __break(1u);
    return result;
  }
  if (result == (_QWORD *)(1 << *(_BYTE *)(a1 + 32)))
    return 0;
  else
    return sub_10001BA58(&v5, (uint64_t)result, v3, 0, a1);
}

uint64_t sub_1000137E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a1 + 16);
  v5 = type metadata accessor for _IntentPhotoItem(0);
  v6 = v5;
  if (v4)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1+ ((*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80)), v5);
    v7 = 0;
  }
  else
  {
    v7 = 1;
  }
  return sub_10000BA28(a2, v7, 1, v6);
}

uint64_t sub_100013858(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  char v48;
  os_log_type_t v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t result;
  uint64_t v53;
  os_log_type_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  _QWORD v60[3];
  _BYTE v61[8];
  uint64_t v62;
  uint64_t v63;

  if (!a2)
    return a1;
  v6 = qword_1000385F0;
  swift_bridgeObjectRetain(a2);
  if (v6 != -1)
    swift_once(&qword_1000385F0, sub_1000167E4);
  v7 = qword_10003C680;
  v8 = PXFavoritesAlbumWidgetIdentifier;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(PXFavoritesAlbumWidgetIdentifier);
  v11 = v10;
  if (v9 == a1 && v10 == a2)
    goto LABEL_18;
  v13 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, v9, v10, 0);
  swift_bridgeObjectRelease(v11);
  if ((v13 & 1) != 0)
    goto LABEL_19;
  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(PXDepthEffectAlbumWidgetIdentifier);
  v11 = v15;
  if (v14 == a1 && v15 == a2)
  {
LABEL_18:
    swift_bridgeObjectRelease(v11);
  }
  else
  {
    v17 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, v14, v15, 0);
    swift_bridgeObjectRelease(v11);
    if ((v17 & 1) == 0)
    {
      v18 = (void *)objc_opt_self(PHObject);
      if ((sub_10001AA00(a1, a2, v18) & 1) == 0)
      {
        v49 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v7, v49))
        {
          swift_bridgeObjectRetain_n(a2, 2);
          v50 = (uint8_t *)swift_slowAlloc(12, -1);
          v51 = swift_slowAlloc(32, -1);
          v63 = v51;
          *(_DWORD *)v50 = 136315138;
          swift_bridgeObjectRetain(a2);
          v62 = sub_100019C88(a1, a2, &v63);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &v63, v50 + 4, v50 + 12);
          swift_bridgeObjectRelease_n(a2, 3);
          _os_log_impl((void *)&_mh_execute_header, v7, v49, "using local identifier %s which will not support ICPL sync", v50, 0xCu);
          swift_arrayDestroy(v51, 1);
          swift_slowDealloc(v51, -1, -1);
          swift_slowDealloc(v50, -1, -1);
        }
        return a1;
      }
      v19 = sub_10000B8A0(&qword_100039238);
      v20 = swift_allocObject(v19, 40, 7);
      *(_OWORD *)(v20 + 16) = xmmword_100029DA0;
      sub_10001BB44(0, &qword_100039240, PHCloudIdentifier_ptr);
      swift_bridgeObjectRetain(a2);
      *(_QWORD *)(v20 + 32) = sub_10001442C(a1, a2);
      v63 = v20;
      specialized Array._endMutation()();
      v21 = PHPhotoLibrary.localIdentifierMappings(for:)(v20);
      swift_bridgeObjectRelease(v20);
      v22 = sub_100013750(v21);
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v29 = swift_bridgeObjectRelease(v21);
      if (v22)
      {

        if ((v28 & 1) == 0)
        {
          swift_bridgeObjectRelease(a2);
          return v24;
        }
        swift_errorRetain(v24);
        v53 = swift_errorRetain(v24);
        v54 = static os_log_type_t.error.getter(v53);
        if (os_log_type_enabled(v7, v54))
        {
          sub_10001B9C8(v24, v26, 1);
          swift_bridgeObjectRetain(a2);
          sub_10001B9C8(v24, v26, 1);
          v55 = swift_slowAlloc(22, -1);
          v56 = swift_slowAlloc(64, -1);
          v63 = v56;
          *(_DWORD *)v55 = 136315394;
          swift_bridgeObjectRetain(a2);
          v62 = sub_100019C88(a1, a2, &v63);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &v63, v55 + 4, v55 + 12);
          swift_bridgeObjectRelease_n(a2, 3);
          *(_WORD *)(v55 + 12) = 2080;
          swift_getErrorValue(v24, v61, v60);
          v57 = Error.localizedDescription.getter(v60[1], v60[2]);
          v59 = v58;
          v62 = sub_100019C88(v57, v58, &v63);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &v63, v55 + 14, v55 + 22);
          swift_bridgeObjectRelease(v59);
          sub_10001B9B8(v24, v26, 1, (uint64_t (*)(void))&_swift_errorRelease);
          sub_10001B9B8(v24, v26, 1, (uint64_t (*)(void))&_swift_errorRelease);
          _os_log_impl((void *)&_mh_execute_header, v7, v54, "could not get local identifier for cloud identifier %s with error %s", (uint8_t *)v55, 0x16u);
          swift_arrayDestroy(v56, 2);
          swift_slowDealloc(v56, -1, -1);
          swift_slowDealloc(v55, -1, -1);
          sub_10001B9B8(v24, v26, 1, (uint64_t (*)(void))&_swift_errorRelease);
          sub_10001B9B8(v24, v26, 1, (uint64_t (*)(void))&_swift_errorRelease);
          swift_errorRelease(v24);
        }
        else
        {
          sub_10001B9B8(v24, v26, 1, (uint64_t (*)(void))&_swift_errorRelease);
          swift_bridgeObjectRelease(a2);
          sub_10001B9B8(v24, v26, 1, (uint64_t (*)(void))&_swift_errorRelease);
          sub_10001B9B8(v24, v26, 1, (uint64_t (*)(void))&_swift_errorRelease);
        }
        return 0;
      }
      v41 = static os_log_type_t.error.getter(v29);
      if (os_log_type_enabled(v7, v41))
      {
        swift_bridgeObjectRetain(a2);
        v42 = (uint8_t *)swift_slowAlloc(12, -1);
        v43 = swift_slowAlloc(32, -1);
        v63 = v43;
        *(_DWORD *)v42 = 136315138;
        swift_bridgeObjectRetain(a2);
        v62 = sub_100019C88(a1, a2, &v63);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &v63, v42 + 4, v42 + 12);
        swift_bridgeObjectRelease_n(a2, 3);
        v44 = "could not get local identifier for cloud identifier %s";
        goto LABEL_31;
      }
      goto LABEL_44;
    }
  }
LABEL_19:
  v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
  v32 = v31;
  if (v30 == a1 && v31 == a2)
  {
    v35 = 203;
LABEL_26:
    swift_bridgeObjectRelease(v32);
    goto LABEL_27;
  }
  v34 = _stringCompareWithSmolCheck(_:_:expecting:)(v30, v31, a1, a2, 0);
  swift_bridgeObjectRelease(v32);
  if ((v34 & 1) != 0)
  {
    v35 = 203;
    goto LABEL_27;
  }
  v45 = static String._unconditionallyBridgeFromObjectiveC(_:)(PXDepthEffectAlbumWidgetIdentifier);
  v32 = v46;
  if (v45 == a1 && v46 == a2)
  {
    v35 = 212;
    goto LABEL_26;
  }
  v48 = _stringCompareWithSmolCheck(_:_:expecting:)(v45, v46, a1, a2, 0);
  swift_bridgeObjectRelease(v32);
  if ((v48 & 1) != 0)
  {
    v35 = 212;
LABEL_27:
    v36 = (void *)objc_opt_self(PHAssetCollection);
    v37 = objc_msgSend(a3, "librarySpecificFetchOptions");
    v38 = objc_msgSend(v36, "fetchAssetCollectionsWithType:subtype:options:", 2, v35, v37);

    v39 = objc_msgSend(v38, "firstObject");
    if (v39)
    {
      swift_bridgeObjectRelease(a2);
      v40 = objc_msgSend(v39, "localIdentifier");
      a1 = static String._unconditionallyBridgeFromObjectiveC(_:)(v40);

      return a1;
    }
    v41 = ((uint64_t (*)(void))static os_log_type_t.error.getter)();
    if (os_log_type_enabled(v7, v41))
    {
      swift_bridgeObjectRetain(a2);
      v42 = (uint8_t *)swift_slowAlloc(12, -1);
      v43 = swift_slowAlloc(32, -1);
      v63 = v43;
      *(_DWORD *)v42 = 136315138;
      swift_bridgeObjectRetain(a2);
      v62 = sub_100019C88(a1, a2, &v63);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v62, &v63, v42 + 4, v42 + 12);
      swift_bridgeObjectRelease_n(a2, 3);
      v44 = "could not find smart album type %s";
LABEL_31:
      _os_log_impl((void *)&_mh_execute_header, v7, v41, v44, v42, 0xCu);
      swift_arrayDestroy(v43, 1);
      swift_slowDealloc(v43, -1, -1);
      swift_slowDealloc(v42, -1, -1);
      return 0;
    }
LABEL_44:
    swift_bridgeObjectRelease(a2);
    return 0;
  }
  swift_bridgeObjectRelease(a2);
  result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001BLL, 0x800000010002B8A0, "PhotosReliveWidget/PhotosReliveWidget.swift", 43, 2);
  __break(1u);
  return result;
}

uint64_t sub_1000140F8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  Swift::Int v12;
  Swift::Int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    v2 = a2;
    v3 = a1;
    v4 = a2 >> 62;
    if (!(a2 >> 62))
    {
      v5 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_4;
    }
  }
  if (v2 < 0)
    v16 = v2;
  else
    v16 = v2 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v2);
  v5 = _CocoaArrayWrapper.endIndex.getter(v16);
  swift_bridgeObjectRelease(v2);
LABEL_4:
  result = sub_10001B96C(0, v3, v5);
  if ((v7 & 1) != 0)
    v8 = v5;
  else
    v8 = result;
  if (v8 < 0)
  {
    __break(1u);
    goto LABEL_33;
  }
  if (v4)
  {
    if (v2 < 0)
      v10 = v2;
    else
      v10 = v2 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v2);
    v11 = _CocoaArrayWrapper.endIndex.getter(v10);
    result = swift_bridgeObjectRelease(v2);
    if (v11 < 0)
      goto LABEL_34;
    swift_bridgeObjectRetain(v2);
    v9 = _CocoaArrayWrapper.endIndex.getter(v10);
    result = swift_bridgeObjectRelease(v2);
  }
  else
  {
    v9 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v9 < v8)
  {
LABEL_33:
    __break(1u);
LABEL_34:
    __break(1u);
    return result;
  }
  if ((v2 & 0xC000000000000001) != 0 && v8)
  {
    sub_10001BB44(0, &qword_100039230, PXTimelineEntry_ptr);
    v12 = 0;
    do
    {
      v13 = v12 + 1;
      _ArrayBuffer._typeCheckSlowPath(_:)(v12);
      v12 = v13;
    }
    while (v8 != v13);
  }
  if (!v4)
    return v2 & 0xFFFFFFFFFFFFFF8;
  if (v2 < 0)
    v15 = v2;
  else
    v15 = v2 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v2);
  v14 = _CocoaArrayWrapper.subscript.getter(0, v8, v15);
  swift_bridgeObjectRelease_n(v2, 2);
  return v14;
}

void sub_1000142AC(void (*a1)(uint64_t *__return_ptr, id *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  id v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v24;
  id v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  _QWORD *v30;

  v24 = a6 >> 1;
  v7 = (a6 >> 1) - a5;
  if (__OFSUB__(a6 >> 1, a5))
    goto LABEL_20;
  v8 = v6;
  if (v7)
  {
    v30 = &_swiftEmptyArrayStorage;
    sub_10001A488(0, v7 & ~(v7 >> 63), 0);
    if (v7 < 0)
    {
LABEL_21:
      __break(1u);
      return;
    }
    v10 = 0;
    v11 = v30;
    v21 = v7;
    v22 = a4 + 8 * a5;
    while (1)
    {
      v12 = v10 + 1;
      if (__OFADD__(v10, 1))
        break;
      if (a5 + v10 >= v24 || v10 >= v7)
        goto LABEL_19;
      v26 = *(id *)(v22 + 8 * v10);
      v14 = v26;
      a1(&v27, &v26);
      if (v8)
      {
        swift_release(v11);

        return;
      }

      v15 = v27;
      v16 = v28;
      v17 = v29;
      v30 = v11;
      v19 = v11[2];
      v18 = v11[3];
      if (v19 >= v18 >> 1)
      {
        sub_10001A488((char *)(v18 > 1), v19 + 1, 1);
        v11 = v30;
      }
      v11[2] = v19 + 1;
      v20 = &v11[3 * v19];
      v20[4] = v15;
      *((_BYTE *)v20 + 40) = v16;
      v20[6] = v17;
      ++v10;
      v7 = v21;
      v8 = 0;
      if (v12 == v21)
        return;
    }
    __break(1u);
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
}

id sub_10001442C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v4;
  NSString v5;
  id v6;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2));
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v6 = objc_msgSend(v4, "initWithStringValue:", v5);

  return v6;
}

uint64_t sub_10001449C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[7] = a3;
  v4[8] = a4;
  v4[5] = a1;
  v4[6] = a2;
  return sub_10001C38C((uint64_t)sub_1000144B0);
}

uint64_t sub_1000144B0()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  _QWORD *v3;

  v1 = swift_task_alloc(48);
  *(_QWORD *)(v0 + 72) = v1;
  v2 = *(_OWORD *)(v0 + 56);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v1 + 32) = v2;
  v3 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  *(_QWORD *)(v0 + 80) = v3;
  *v3 = v0;
  v3[1] = sub_100014540;
  sub_10001C614();
  return sub_10001C428();
}

uint64_t sub_100014540()
{
  uint64_t v0;
  uint64_t v1;

  sub_10001C3DC();
  v1 = *(_QWORD *)(v0 + 72);
  sub_10001C2D0();
  swift_task_dealloc(v1);
  return swift_task_switch(sub_100014588, 0, 0);
}

uint64_t sub_100014588()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16), *(unsigned __int8 *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_100014598(void *a1, char a2, uint64_t a3)
{
  id v4;
  uint64_t v5;
  void *v7;
  char v8;
  uint64_t v9;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  swift_retain(a3);
  v4 = a1;
  v5 = sub_10000B8A0(&qword_100039280);
  return CheckedContinuation.resume(returning:)(&v7, v5);
}

void sub_1000145F0(uint64_t a1, uint64_t a2, void (*a3)(char *, uint64_t), uint64_t a4, double (*a5)(uint64_t *, __n128), uint64_t a6)
{
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
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  __n128 v23;
  os_log_type_t v24;
  NSObject *v25;
  uint64_t (*v26)(char *, char *, uint64_t);
  void (*v27)(char *, uint64_t, uint64_t);
  os_log_type_t v28;
  _BOOL4 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  __n128 v36;
  uint64_t (*v37)(char *, uint64_t, __n128);
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  char v48;
  uint64_t v49;
  id v50;
  __n128 v51;
  __n128 v52;
  os_log_type_t v53;
  NSObject *v54;
  os_log_type_t v55;
  id v56;
  id v57;
  uint8_t *v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  os_log_t v67;
  double (*v68)(uint64_t *, __n128);
  char *v69;
  uint64_t (*v70)(char *, char *, uint64_t);
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void (*v75)(char *, uint64_t);
  uint64_t v76;
  id v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  uint64_t v83;

  v75 = a3;
  v76 = a6;
  v68 = a5;
  v73 = a1;
  v74 = a2;
  v71 = type metadata accessor for PhotosReliveWidgetSize(0);
  __chkstk_darwin(v71, v7);
  v9 = (char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for TimelineProviderContext(0);
  v79 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10, v11);
  v13 = (char *)&v66 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for WidgetFamily(0);
  v15 = *(_QWORD *)(v14 - 8);
  v17 = __chkstk_darwin(v14, v16);
  v19 = (char *)&v66 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17, v20);
  v22 = (char *)&v66 - v21;
  v77 = sub_100015940();
  v23.n128_f64[0] = TimelineProviderContext.family.getter();
  v24 = static os_log_type_t.default.getter(v23);
  if (qword_1000385E8 != -1)
    swift_once(&qword_1000385E8, sub_100012F1C);
  v25 = qword_10003C678;
  v26 = *(uint64_t (**)(char *, char *, uint64_t))(v15 + 16);
  v78 = v22;
  v70 = v26;
  v26(v19, v22, v14);
  v27 = *(void (**)(char *, uint64_t, uint64_t))(v79 + 16);
  v72 = a4;
  v27(v13, a4, v10);
  v28 = v24;
  v67 = v25;
  v29 = os_log_type_enabled(v25, v24);
  v69 = v9;
  if (v29)
  {
    v30 = swift_slowAlloc(18, -1);
    v31 = swift_slowAlloc(32, -1);
    v81 = v31;
    *(_DWORD *)v30 = 136446466;
    sub_10000BDF4(&qword_100039020, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily);
    v33 = dispatch thunk of CustomStringConvertible.description.getter(v14, v32);
    v35 = v34;
    v80 = sub_100019C88(v33, v34, &v81);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81, v30 + 4, v30 + 12);
    v36 = swift_bridgeObjectRelease(v35);
    v37 = *(uint64_t (**)(char *, uint64_t, __n128))(v15 + 8);
    v38 = v37(v19, v14, v36);
    *(_WORD *)(v30 + 12) = 1026;
    v39 = TimelineProviderContext.isPreview.getter(v38) & 1;
    (*(void (**)(char *, uint64_t))(v79 + 8))(v13, v10);
    LODWORD(v80) = v39;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, (char *)&v80 + 4, v30 + 14, v30 + 18);
    _os_log_impl((void *)&_mh_execute_header, v67, v28, "snapshot requested at size %{public}s inAddSheet  %{BOOL,public}d", (uint8_t *)v30, 0x12u);
    swift_arrayDestroy(v31, 1);
    swift_slowDealloc(v31, -1, -1);
    v40 = v30;
    v9 = v69;
    swift_slowDealloc(v40, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v79 + 8))(v13, v10);
    v37 = *(uint64_t (**)(char *, uint64_t, __n128))(v15 + 8);
    ((void (*)(char *, uint64_t))v37)(v19, v14);
  }
  v41 = v70(v9, v78, v14);
  v42 = TimelineProviderContext.displaySize.getter(v41);
  v43 = &v9[*(int *)(v71 + 20)];
  *(double *)v43 = v42;
  *((_QWORD *)v43 + 1) = v44;
  v45 = sub_100012F28(v73, v74, (uint64_t)v75, (uint64_t)v9, 1, v77);
  if (*(_QWORD *)(v45 + 16))
  {
    v46 = v45;
    v75 = (void (*)(char *, uint64_t))v37;
    v79 = v14;
    v47 = *(void **)(v45 + 32);
    v48 = *(_BYTE *)(v45 + 40);
    v49 = *(_QWORD *)(v45 + 48);
    swift_retain(v49);
    v50 = v47;
    v51 = swift_bridgeObjectRelease(v46);
    v81 = (uint64_t)v50;
    v82 = v48;
    v83 = v49;
    v52.n128_f64[0] = v68(&v81, v51);
    v53 = static os_log_type_t.default.getter(v52);
    v54 = qword_10003C678;
    v55 = v53;
    if (os_log_type_enabled((os_log_t)qword_10003C678, v53))
    {
      v56 = v50;
      swift_retain_n(v49, 2);
      v57 = v56;
      v58 = (uint8_t *)swift_slowAlloc(12, -1);
      v59 = swift_slowAlloc(32, -1);
      v81 = v59;
      *(_DWORD *)v58 = 136446210;
      v60 = v57;
      swift_retain(v49);
      PhotosReliveWidgetEntry.description.getter();
      v62 = v61;
      v64 = v63;
      swift_release(v49);

      v80 = sub_100019C88(v62, v64, &v81);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v80, &v81, v58 + 4, v58 + 12);
      swift_release_n(v49, 2);

      swift_bridgeObjectRelease(v64);
      _os_log_impl((void *)&_mh_execute_header, v54, v55, "snapshot request completed with entry %{public}s", v58, 0xCu);
      swift_arrayDestroy(v59, 1);
      swift_slowDealloc(v59, -1, -1);
      swift_slowDealloc(v58, -1, -1);
      swift_release(v49);

      v65 = (uint64_t)v69;
    }
    else
    {
      swift_release(v49);

      v65 = (uint64_t)v9;
    }
    sub_100010EDC(v65, type metadata accessor for PhotosReliveWidgetSize);
    v75(v78, v79);
    swift_release(v76);
  }
  else
  {
    __break(1u);
  }
}

void sub_100014B60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  double (*v3)(id, uint64_t (*)(uint64_t, uint64_t), uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  __n128 v27;
  os_log_type_t v28;
  NSObject *v29;
  uint64_t (*v30)(uint64_t, uint64_t, _QWORD);
  _BOOL4 v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  __n128 v55;
  os_log_type_t v56;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  os_log_t v67;
  uint64_t v68;
  double (*v69)(id, uint64_t (*)(uint64_t, uint64_t), uint64_t);
  uint64_t v70;
  void (*v71)(uint64_t, char *, uint64_t);
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(uint64_t, uint64_t);
  id v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  uint64_t v81;

  sub_10000F0E4();
  v68 = v4;
  v69 = v3;
  v6 = v5;
  v75 = v7;
  v76 = v8;
  v74 = v9;
  v72 = sub_10001C744();
  sub_10000E868();
  __chkstk_darwin(v10, v11);
  v79 = sub_10001C370();
  sub_10001C3B8();
  __chkstk_darwin(v12, v13);
  sub_10001C3EC();
  v16 = v15 - v14;
  v17 = sub_10000EF04();
  sub_10001C5E4();
  __chkstk_darwin(v18, v19);
  sub_10000F024();
  v22 = v20 - v21;
  __chkstk_darwin(v23, v24);
  v26 = (char *)&v66 - v25;
  v77 = sub_100015940();
  v27.n128_f64[0] = TimelineProviderContext.family.getter();
  v28 = static os_log_type_t.default.getter(v27);
  if (qword_1000385E8 != -1)
    swift_once(&qword_1000385E8, sub_100012F1C);
  v29 = qword_10003C678;
  v71 = *(void (**)(uint64_t, char *, uint64_t))(v1 + 16);
  v71(v22, v26, v17);
  v30 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v2 + 16);
  v73 = v6;
  sub_10001C6BC(v16, v30);
  v67 = v29;
  v31 = os_log_type_enabled(v29, v28);
  v32 = v26;
  v70 = v0;
  v78 = v17;
  if (v31)
  {
    v33 = sub_10001C2C8(18);
    v34 = sub_10001C2C8(32);
    v81 = v34;
    *(_DWORD *)v33 = 136446466;
    sub_10000BDF4(&qword_100039020, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily);
    v36 = dispatch thunk of CustomStringConvertible.description.getter(v78, v35);
    v38 = sub_10001C668(v36, v37);
    sub_10001C398(v38, v39, v40, v33 + 12);
    sub_10001C2E0();
    v41 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8);
    v42 = v41(v22, v78);
    *(_WORD *)(v33 + 12) = 1026;
    v43 = TimelineProviderContext.isPreview.getter(v42) & 1;
    sub_10001C4EC(v16, *(uint64_t (**)(uint64_t, _QWORD))(v2 + 8));
    v80 = v43;
    v0 = v70;
    v44 = sub_10001C654();
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v44, v45, v46, v47);
    _os_log_impl((void *)&_mh_execute_header, v67, v28, "snapshot requested at size %{public}s inAddSheet  %{BOOL,public}d", (uint8_t *)v33, 0x12u);
    sub_10001C434(v34);
    sub_100010F30(v34);
    v48 = v33;
    v17 = v78;
    sub_100010F30(v48);
  }
  else
  {
    sub_10001C4EC(v16, *(uint64_t (**)(uint64_t, _QWORD))(v2 + 8));
    v41 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8);
    v41(v22, v17);
  }
  v79 = (uint64_t)v32;
  v49 = ((uint64_t (*)(uint64_t, char *, uint64_t))v71)(v0, v32, v17);
  v50 = TimelineProviderContext.displaySize.getter(v49);
  v51 = v0 + *(int *)(v72 + 20);
  *(double *)v51 = v50;
  *(_QWORD *)(v51 + 8) = v52;
  v53 = sub_100012F28(v74, v75, (uint64_t)v76, v0, 1, v77);
  if (*(_QWORD *)(v53 + 16))
  {
    sub_10001C320(v53);
    v54 = (id)v28;
    sub_10001C2E0();
    v55.n128_f64[0] = v69(v54, v41, v2);
    v56 = static os_log_type_t.default.getter(v55);
    if (sub_10001C564(v56))
    {
      v57 = v54;
      sub_10001C5F4();
      v58 = v54;
      v59 = sub_10001C2C8(12);
      v60 = sub_10001C2C8(32);
      v81 = v60;
      sub_10001C554(4.8751e-34);
      sub_10001C730();
      sub_10001C57C();
      sub_10001C3B0();

      v61 = sub_10001C50C();
      sub_10001C304(v61);
      sub_10001C690();

      sub_10001C758();
      sub_10001C470((void *)&_mh_execute_header, v62, v63, "snapshot request completed with entry %{public}s");
      sub_10001C434(v60);
      sub_100010F30(v60);
      sub_100010F30(v59);
      sub_10001C3B0();

      sub_10001C52C();
      sub_100010EDC(v70, type metadata accessor for PhotosReliveWidgetSize);
      v65 = v78;
      v64 = v79;
    }
    else
    {
      sub_10001C3B0();

      sub_10001C52C();
      sub_100010EDC(v0, type metadata accessor for PhotosReliveWidgetSize);
      v64 = v79;
      v65 = v17;
    }
    v76(v64, v65);
    sub_10000E8C0();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100014F48(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v3 = swift_retain(v2);
  v1(v3);
  return swift_release(v2);
}

uint64_t sub_100014F74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = a1;
  return sub_10001C38C((uint64_t)sub_100014F8C);
}

uint64_t sub_100014F8C()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  _QWORD *v3;

  v1 = swift_task_alloc(48);
  *(_QWORD *)(v0 + 56) = v1;
  v2 = *(_OWORD *)(v0 + 40);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)(v0 + 24);
  *(_OWORD *)(v1 + 32) = v2;
  v3 = (_QWORD *)swift_task_alloc(async function pointer to withCheckedContinuation<A>(isolation:function:_:)[1]);
  *(_QWORD *)(v0 + 64) = v3;
  sub_10000B8A0(&qword_100039028);
  *v3 = v0;
  v3[1] = sub_100015020;
  sub_10001C614();
  return sub_10001C428();
}

uint64_t sub_100015020()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_10001C3DC();
  v2 = *(_QWORD *)(v1 + 56);
  sub_10001C2D0();
  swift_task_dealloc(v2);
  return sub_10001C41C(*(uint64_t (**)(void))(v0 + 8));
}

void sub_100015054(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
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
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
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
  void *v80;
  _QWORD v81[5];
  char *v82;

  sub_10000F0E4();
  v73 = v21;
  v68 = v23;
  v69 = v22;
  v25 = v24;
  v66 = v26;
  v70 = v27;
  v29 = v28;
  v64 = v28;
  v67 = v30;
  v74 = a21;
  v76 = type metadata accessor for DispatchWorkItemFlags(0);
  v79 = *(_QWORD *)(v76 - 8);
  sub_10000E868();
  __chkstk_darwin(v31, v32);
  sub_10000E874();
  v75 = v33;
  v34 = type metadata accessor for DispatchQoS(0);
  v77 = *(_QWORD *)(v34 - 8);
  v78 = v34;
  sub_10000E868();
  __chkstk_darwin(v35, v36);
  sub_10001C2E8(v37, v64);
  v38 = sub_10000B8A0(v25);
  v39 = *(_QWORD *)(v38 - 8);
  v65 = v38;
  v40 = *(_QWORD *)(v39 + 64);
  __chkstk_darwin(v38, v41);
  v42 = (char *)&v64 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  v43 = sub_10001C4E4();
  v44 = *(_QWORD *)(v43 - 8);
  v45 = *(_QWORD *)(v44 + 64);
  __chkstk_darwin(v43, v46);
  v47 = (char *)&v64 - ((v45 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001BB44(0, &qword_100039258, OS_dispatch_queue_ptr);
  v71 = static OS_dispatch_queue.main.getter();
  (*(void (**)(char *, uint64_t, uint64_t))(v44 + 16))(v47, v66, v43);
  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v42, v67, v38);
  v48 = *(unsigned __int8 *)(v44 + 80);
  v49 = (v48 + 40) & ~v48;
  v50 = *(unsigned __int8 *)(v39 + 80);
  v51 = (v45 + v50 + v49) & ~v50;
  v52 = (char *)swift_allocObject(v68, v51 + v40, v48 | v50 | 7);
  *((_QWORD *)v52 + 2) = v29;
  v54 = v69;
  v53 = v70;
  *((_QWORD *)v52 + 3) = v69;
  *((_QWORD *)v52 + 4) = v53;
  (*(void (**)(char *, char *, uint64_t))(v44 + 32))(&v52[v49], v47, v43);
  (*(void (**)(char *, char *, uint64_t))(v39 + 32))(&v52[v51], v42, v65);
  v81[4] = v73;
  v82 = v52;
  v81[0] = _NSConcreteStackBlock;
  v81[1] = 1107296256;
  v81[2] = sub_100014F48;
  v81[3] = v74;
  v55 = _Block_copy(v81);
  swift_retain(v64);
  swift_retain(v54);
  v56 = swift_retain(v53);
  v57 = v72;
  static DispatchQoS.unspecified.getter(v56);
  v80 = &_swiftEmptyArrayStorage;
  sub_10000BDF4(&qword_100039260, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  v59 = v58;
  v60 = sub_10000B8A0(&qword_100039268);
  sub_10000E4AC(&qword_100039270, &qword_100039268);
  v61 = v75;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v80, v60, v62, v76, v59);
  v63 = (void *)v71;
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v57, v61, v55);
  _Block_release(v55);

  sub_10000EAF0(v61, *(uint64_t (**)(uint64_t, uint64_t))(v79 + 8));
  (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v57, v78);
  swift_release(v82);
  sub_10000E8C0();
}

void sub_100015350(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void (*a21)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
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
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  sub_10000F0E4();
  v41 = v21;
  v42 = v22;
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  v34 = sub_10000B8A0(v33);
  v35 = *(_QWORD *)(v34 - 8);
  v36 = *(_QWORD *)(v35 + 64);
  __chkstk_darwin(v34, v37);
  (*(void (**)(char *, uint64_t, uint64_t))(v35 + 16))((char *)&v41 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0), v26, v34);
  v38 = *(unsigned __int8 *)(v35 + 80);
  v39 = (v38 + 16) & ~v38;
  v40 = swift_allocObject(v24, v39 + v36, v38 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v35 + 32))(v40 + v39, (char *)&v41 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0), v34);
  a21(v32, v30, v28, v41, v42, v40);
  swift_release(v40);
  sub_10000E8C0();
}

uint64_t sub_100015430(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v2 = sub_10000B8A0(&qword_100039028);
  __chkstk_darwin(v2, v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v6 + 16))(v5, a1);
  v7 = sub_10000B8A0(&qword_100039250);
  return CheckedContinuation.resume(returning:)(v5, v7);
}

void sub_1000154C0()
{
  uint64_t v0;
  void (*v1)(uint64_t);
  uint64_t v2;
  void *v3;
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  id v43;
  void (*v44)(void (*)(_QWORD, _QWORD), char *, uint64_t);
  uint64_t v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(uint64_t, char *);
  unint64_t v54;
  __n128 v55;
  os_log_type_t v56;
  NSObject *v57;
  void (*v58)(char *, uint64_t);
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int v70;
  os_log_t v71;
  void (*v72)(void (*)(_QWORD, _QWORD), char *, uint64_t);
  void (*v73)(char *, uint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  char *v79;
  uint64_t v80;
  void (*v81)(uint64_t);
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85[6];

  sub_10000F0E4();
  v80 = v2;
  v81 = v1;
  v78 = v3;
  v79 = (char *)v4;
  v74 = v5;
  v83 = sub_10000B8A0(&qword_100039028);
  v76 = *(_QWORD *)(v83 - 8);
  sub_10000E868();
  __chkstk_darwin(v6, v7);
  sub_10001C3FC(v8, v69);
  v11 = __chkstk_darwin(v9, v10);
  sub_10001C6E8(v11, v12, v13, v14, v15, v16, v17, v18, v69);
  v19 = sub_10000B8A0(&qword_100039030);
  sub_10000E868();
  __chkstk_darwin(v20, v21);
  sub_10000F024();
  v24 = v22 - v23;
  __chkstk_darwin(v25, v26);
  v28 = (char *)&v69 - v27;
  v29 = type metadata accessor for PhotosReliveWidgetSize(0);
  sub_10000E868();
  __chkstk_darwin(v30, v31);
  sub_10001C3EC();
  v34 = v33 - v32;
  v35 = sub_10000EF04();
  sub_10001C3B8();
  __chkstk_darwin(v36, v37);
  sub_10000E954();
  v73 = v38;
  __chkstk_darwin(v39, v40);
  v42 = (char *)&v69 - v41;
  v43 = sub_100015940();
  TimelineProviderContext.family.getter();
  v77 = v0;
  v44 = *(void (**)(void (*)(_QWORD, _QWORD), char *, uint64_t))(v0 + 16);
  v45 = v82;
  v72 = v44;
  v46 = ((uint64_t (*)(uint64_t, char *, uint64_t))v44)(v34, v42, v35);
  v47 = TimelineProviderContext.displaySize.getter(v46);
  v48 = v34 + *(int *)(v29 + 20);
  *(double *)v48 = v47;
  *(_QWORD *)(v48 + 8) = v49;
  v50 = sub_100012F28(v74, (uint64_t)v78, (uint64_t)v79, v34, 2, v43);
  v51 = (uint64_t)&v28[*(int *)(v19 + 48)];
  sub_100015B38((uint64_t)v28, v51, v50, (uint64_t)v42);
  v52 = v24 + *(int *)(v19 + 48);
  type metadata accessor for TimelineReloadPolicy(0);
  sub_10001C534();
  v79 = v28;
  v53(v24, v28);
  sub_10001A404(v51, v52);
  v54 = sub_10001A44C();
  Timeline.init(entries:policy:)(v50, v24, &type metadata for PhotosReliveWidgetEntry, v54);
  sub_10000E500(v52, &qword_100039038);
  type metadata accessor for PhotosReliveWidgetViewModel(0);
  v74 = v34;
  sub_10001E798(v34, (double *)v85);
  v78 = v43;
  objc_msgSend(v43, "setWidgetTimelineGeneratedForDisplaySize:", *(double *)v85, *(double *)&v85[1]);
  sub_1000119AC(v51, (uint64_t)v42);
  v56 = static os_log_type_t.default.getter(v55);
  if (qword_1000385E8 != -1)
    swift_once(&qword_1000385E8, sub_100012F1C);
  v57 = qword_10003C678;
  v58 = v73;
  v72((void (*)(_QWORD, _QWORD))v73, v42, v35);
  v59 = v75;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v76 + 16))(v75, v45, v83);
  if (os_log_type_enabled(v57, v56))
  {
    v60 = sub_10001C2C8(22);
    v71 = v57;
    v61 = v60;
    v72 = (void (*)(void (*)(_QWORD, _QWORD), char *, uint64_t))sub_10001C2C8(64);
    v85[0] = (uint64_t)v72;
    *(_DWORD *)v61 = 136446466;
    sub_10000BDF4(&qword_100039020, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily);
    v70 = v56;
    v63 = sub_10001C74C(v62, v62);
    v84 = sub_10001C43C(v63, v64);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v84, v85, v61 + 4, v61 + 12);
    sub_10001C2E0();
    sub_10001C484();
    *(_WORD *)(v61 + 12) = 2082;
    v77 = v61 + 14;
    Timeline.entries.getter(v83);
    v65 = Array.description.getter();
    v67 = v66;
    sub_10001C2E0();
    v84 = sub_100019C88(v65, v67, v85);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v84, v85, v77, v61 + 22);
    swift_bridgeObjectRelease(v67);
    sub_10001C688(v59);
    _os_log_impl((void *)&_mh_execute_header, v71, (os_log_type_t)v70, "timeline request completed for size %{public}s with entries %{public}s", (uint8_t *)v61, 0x16u);
    v68 = (uint64_t)v72;
    swift_arrayDestroy(v72, 2);
    sub_100010F30(v68);
    v45 = v82;
    sub_100010F30(v61);
  }
  else
  {
    sub_10001C484();
    sub_10001C688(v59);
  }
  v81(v45);

  sub_10001C688(v45);
  sub_10000E500((uint64_t)v79, &qword_100039030);
  sub_100010EDC(v74, type metadata accessor for PhotosReliveWidgetSize);
  v58(v42, v35);
  sub_10000E8C0();
}

id sub_100015940()
{
  id v0;
  unsigned int v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  os_log_type_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  void *v12;
  id v14;
  uint64_t v15;

  if ((sub_100017E44() & 1) != 0)
    return 0;
  v0 = objc_msgSend((id)objc_opt_self(PHPhotoLibrary), "sharedPhotoLibrary");
  v14 = 0;
  v1 = objc_msgSend(v0, "openAndWaitWithUpgrade:error:", 0, &v14);
  v2 = v14;
  if (v1)
  {
    v3 = v14;
  }
  else
  {
    v4 = v14;
    v5 = _convertNSErrorToError(_:)(v2);

    v6 = swift_willThrow();
    v7 = static os_log_type_t.error.getter(v6);
    if (qword_1000385F8 != -1)
      swift_once(&qword_1000385F8, sub_100017DD0);
    v8 = qword_10003C688;
    v9 = v7;
    if (os_log_type_enabled((os_log_t)qword_10003C688, v7))
    {
      sub_10001C71C();
      sub_10001C71C();
      v10 = (uint8_t *)sub_10001C2C8(12);
      v11 = (_QWORD *)sub_10001C2C8(8);
      *(_DWORD *)v10 = 138412290;
      sub_10001C71C();
      v12 = (void *)_swift_stdlib_bridgeErrorToNSError(v5);
      v14 = v12;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, &v15, v10 + 4, v10 + 12);
      *v11 = v12;
      sub_10001C714();
      sub_10001C714();
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Cannot open photo library %@", v10, 0xCu);
      sub_10000B8A0(&qword_100039328);
      sub_10001C434((uint64_t)v11);
      sub_100010F30((uint64_t)v11);
      sub_100010F30((uint64_t)v10);
    }
    sub_10001C714();
  }
  return v0;
}

void *sub_100015B38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  NSObject *v6;
  Class isa;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
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
  char *v31;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v45;
  id v46;
  uint64_t v47;
  NSObject *v48;
  NSObject *v49;
  double v50;
  double v51;
  id v52;
  void *v53;
  void (*v54)(char *, char *, uint64_t);
  char *v55;
  uint64_t v56;
  uint64_t v57;
  os_log_t v58;
  uint64_t v59;
  uint64_t v60;
  __n128 v61;
  os_log_type_t v62;
  NSObject *v63;
  char *v64;
  _QWORD *v65;
  double (*v66)(uint64_t, char *, uint64_t);
  uint64_t v67;
  os_log_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  __n128 v75;
  void (*v76)(char *, os_log_t, __n128);
  os_log_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  __n128 v83;
  void (*v84)(uint64_t, uint64_t, __n128);
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  os_log_type_t v88;
  NSObject *v89;
  _QWORD *v90;
  void (*v91)(char *, char *, uint64_t);
  uint64_t v92;
  _BOOL4 v93;
  os_log_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unint64_t v100;
  unint64_t v101;
  __n128 v102;
  void (*v103)(char *, uint64_t, __n128);
  uint64_t v104;
  uint64_t v105;
  unint64_t v106;
  unint64_t v107;
  __n128 v108;
  os_log_t v109;
  uint64_t v110;
  char *v111;
  __n128 v112;
  __n128 v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  os_log_t v124;
  uint64_t v125;
  os_log_t v126;
  id v127;
  uint64_t *v128;
  _QWORD *v129;
  char *v130;
  char *v131;
  uint64_t v132;
  uint64_t v133;
  double (*v134)(uint64_t, char *, uint64_t);
  uint64_t v135;
  uint64_t v136[2];

  v133 = a1;
  v134 = (double (*)(uint64_t, char *, uint64_t))a4;
  v6 = type metadata accessor for WidgetFamily(0);
  isa = v6[-1].isa;
  __chkstk_darwin(v6, v8);
  v10 = (char *)&v120 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_10000B8A0(&qword_100039018);
  __chkstk_darwin(v11, v12);
  v14 = (char *)&v120 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v132 = type metadata accessor for Date(0);
  v16 = __chkstk_darwin(v132, v15);
  __chkstk_darwin(v16, v17);
  v20 = __chkstk_darwin((char *)&v120 - v18, v19);
  v22 = (char *)&v120 - v21;
  v24 = __chkstk_darwin(v20, v23);
  v26 = (char *)&v120 - v25;
  v28 = __chkstk_darwin(v24, v27);
  v30 = __chkstk_darwin(v28, v29);
  v35 = (char *)&v120 - v34;
  v36 = *(_QWORD *)(a3 + 16);
  if (!v36)
  {
LABEL_8:
    v39 = sub_10001811C(a3);
    v41 = v40;
    v43 = v42;
    sub_100018180(v133, a2, v39, v40, v42, (uint64_t)v134);
    return sub_10001BF28(v39, v41, v43);
  }
  v37 = (_QWORD *)(a3 + 48);
  while (1)
  {
    v38 = *v37;
    if (*v37)
    {
      if (!*((_BYTE *)v37 - 8)
        && (!*(_QWORD *)(v38 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_image)
         || (*(_BYTE *)(v38 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_imageIsDegraded) & 1) != 0))
      {
        break;
      }
    }
    v37 += 3;
    if (!--v36)
      goto LABEL_8;
  }
  v120 = v10;
  v121 = v33;
  v123 = (uint64_t)isa;
  v124 = v6;
  v122 = v30;
  v129 = v32;
  v130 = v31;
  v128 = (uint64_t *)a2;
  v45 = (id)*(v37 - 2);
  swift_retain(v38);
  v46 = objc_msgSend(v45, "localIdentifier");
  v47 = static String._unconditionallyBridgeFromObjectiveC(_:)(v46);
  v49 = v48;

  v125 = v47;
  v126 = v49;
  v50 = sub_10001869C(v47, (unint64_t)v49, (uint64_t)v134, 300.0);
  v131 = v35;
  v51 = Date.init(timeIntervalSinceNow:)(v50);
  v127 = v45;
  v52 = objc_msgSend(v45, "endTime", v51);
  if (v52)
  {
    v53 = v52;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    v54 = (void (*)(char *, char *, uint64_t))v129[4];
    v55 = v26;
    v56 = v132;
    v54(v14, v55, v132);
    sub_10000BA28((uint64_t)v14, 0, 1, v56);
    v57 = sub_10000BA0C((uint64_t)v14, 1, v56);
    if ((_DWORD)v57 != 1)
    {
      v54(v130, v14, v56);
      goto LABEL_14;
    }
  }
  else
  {
    v56 = v132;
    v57 = sub_10000BA28((uint64_t)v14, 1, 1, v132);
  }
  static Date.distantFuture.getter(v57);
  sub_10000E500((uint64_t)v14, &qword_100039018);
LABEL_14:
  v59 = v123;
  v58 = v124;
  v61.n128_f64[0] = Date.timeIntervalSince(_:)(v131);
  if (v61.n128_f64[0] <= 300.0)
  {
    v88 = static os_log_type_t.debug.getter(v60);
    if (qword_1000385E0 != -1)
      swift_once(&qword_1000385E0, sub_1000111E8);
    v89 = qword_100039010;
    v90 = v129;
    v91 = (void (*)(char *, char *, uint64_t))v129[2];
    v91(v22, v131, v56);
    v92 = v122;
    v91((char *)v122, v130, v56);
    v93 = os_log_type_enabled(v89, v88);
    v95 = v125;
    v94 = v126;
    if (v93)
    {
      swift_bridgeObjectRetain(v126);
      v96 = swift_slowAlloc(32, -1);
      v124 = (os_log_t)swift_slowAlloc(96, -1);
      v136[0] = (uint64_t)v124;
      *(_DWORD *)v96 = 136446722;
      LODWORD(v123) = v88;
      swift_bridgeObjectRetain(v94);
      v135 = sub_100019C88(v95, (unint64_t)v94, v136);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v135, v136, v96 + 4, v96 + 12);
      swift_bridgeObjectRelease_n(v94, 3);
      *(_WORD *)(v96 + 12) = 2082;
      sub_10000BDF4(&qword_1000392B8, (uint64_t (*)(uint64_t))&type metadata accessor for Date);
      v98 = v97;
      v99 = dispatch thunk of CustomStringConvertible.description.getter(v132, v97);
      v101 = v100;
      v135 = sub_100019C88(v99, v100, v136);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v135, v136, v96 + 14, v96 + 22);
      v102 = swift_bridgeObjectRelease(v101);
      v126 = v89;
      v103 = (void (*)(char *, uint64_t, __n128))v90[1];
      v103(v22, v132, v102);
      *(_WORD *)(v96 + 22) = 2082;
      v104 = v122;
      v105 = dispatch thunk of CustomStringConvertible.description.getter(v132, v98);
      v107 = v106;
      v135 = sub_100019C88(v105, v106, v136);
      v56 = v132;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v135, v136, v96 + 24, v96 + 32);
      v108 = swift_bridgeObjectRelease(v107);
      v103((char *)v104, v56, v108);
      _os_log_impl((void *)&_mh_execute_header, v126, (os_log_type_t)v123, "not enough time to schedule reload for entry id %{public}s at %{public}s for entry ending at %{public}s", (uint8_t *)v96, 0x20u);
      v109 = v124;
      swift_arrayDestroy(v124, 3);
      swift_slowDealloc(v109, -1, -1);
      swift_slowDealloc(v96, -1, -1);
    }
    else
    {
      v113 = swift_bridgeObjectRelease(v126);
      v103 = (void (*)(char *, uint64_t, __n128))v90[1];
      v103(v22, v56, v113);
      ((void (*)(uint64_t, uint64_t))v103)(v92, v56);
    }
    v114 = (uint64_t)v128;
    v115 = sub_10001811C(a3);
    v117 = v116;
    v119 = v118;
    sub_100018180(v133, v114, v115, v116, v118, (uint64_t)v134);
    sub_10001BF28(v115, v117, v119);
    swift_release(v38);

    ((void (*)(char *, uint64_t))v103)(v130, v56);
    return (void *)((uint64_t (*)(char *, uint64_t))v103)(v131, v56);
  }
  else
  {
    v62 = static os_log_type_t.default.getter(v61);
    if (qword_1000385E0 != -1)
      swift_once(&qword_1000385E0, sub_1000111E8);
    v63 = qword_100039010;
    v64 = v120;
    (*(void (**)(char *, double (*)(uint64_t, char *, uint64_t), os_log_t))(v59 + 16))(v120, v134, v58);
    v65 = v129;
    v66 = (double (*)(uint64_t, char *, uint64_t))v129[2];
    v67 = v121;
    v66(v121, v131, v56);
    if (os_log_type_enabled(v63, v62))
    {
      v124 = v63;
      v68 = v126;
      swift_bridgeObjectRetain_n(v126, 2);
      v69 = swift_slowAlloc(32, -1);
      v134 = v66;
      v70 = v69;
      v123 = swift_slowAlloc(96, -1);
      v136[0] = v123;
      *(_DWORD *)v70 = 136446722;
      sub_10000BDF4(&qword_100039020, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily);
      LODWORD(v122) = v62;
      v72 = dispatch thunk of CustomStringConvertible.description.getter(v58, v71);
      v74 = v73;
      v135 = sub_100019C88(v72, v73, v136);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v135, v136, v70 + 4, v70 + 12);
      v75 = swift_bridgeObjectRelease(v74);
      v76 = *(void (**)(char *, os_log_t, __n128))(v59 + 8);
      v77 = v68;
      v76(v64, v58, v75);
      *(_WORD *)(v70 + 12) = 2082;
      swift_bridgeObjectRetain(v68);
      v78 = v125;
      v135 = sub_100019C88(v125, (unint64_t)v68, v136);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v135, v136, v70 + 14, v70 + 22);
      swift_bridgeObjectRelease_n(v68, 3);
      *(_WORD *)(v70 + 22) = 2082;
      sub_10000BDF4(&qword_1000392B8, (uint64_t (*)(uint64_t))&type metadata accessor for Date);
      v80 = dispatch thunk of CustomStringConvertible.description.getter(v132, v79);
      v82 = v81;
      v135 = sub_100019C88(v80, v81, v136);
      v56 = v132;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v135, v136, v70 + 24, v70 + 32);
      v83 = swift_bridgeObjectRelease(v82);
      v84 = (void (*)(uint64_t, uint64_t, __n128))v129[1];
      v84(v67, v56, v83);
      _os_log_impl((void *)&_mh_execute_header, v124, (os_log_type_t)v122, "scheduling reload for widget family %{public}s entry id %{public}s at %{public}s", (uint8_t *)v70, 0x20u);
      v85 = v123;
      swift_arrayDestroy(v123, 3);
      swift_slowDealloc(v85, -1, -1);
      v86 = v70;
      v66 = v134;
      swift_slowDealloc(v86, -1, -1);
      v87 = v128;
    }
    else
    {
      (*(void (**)(char *, os_log_t))(v59 + 8))(v64, v58);
      v84 = (void (*)(uint64_t, uint64_t, __n128))v65[1];
      ((void (*)(uint64_t, uint64_t))v84)(v67, v56);
      v87 = v128;
      v78 = v125;
      v77 = v126;
    }
    v110 = type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration(0);
    v111 = v131;
    v112.n128_f64[0] = v66((uint64_t)v87 + *(int *)(v110 + 24), v131, v56);
    *v87 = v78;
    v87[1] = (uint64_t)v77;
    *((double *)v87 + 2) = v50;
    static TimelineReloadPolicy.after(_:)(v111, v112);
    swift_release(v38);

    ((void (*)(char *, uint64_t))v84)(v130, v56);
    ((void (*)(char *, uint64_t))v84)(v111, v56);
    return (void *)sub_10000BA28((uint64_t)v87, 0, 1, v110);
  }
}

void sub_1000164A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v1 = type metadata accessor for PhotosReliveWidgetSize(0);
  sub_10000E868();
  __chkstk_darwin(v2, v3);
  v4 = sub_10001C354();
  v5 = TimelineProviderContext.displaySize.getter(v4);
  v6 = v0 + *(int *)(v1 + 20);
  *(double *)v6 = v5;
  *(_QWORD *)(v6 + 8) = v7;
  v8 = objc_msgSend((id)objc_opt_self(PXTimelineEntry), "placeholderEntryForContentType:", 2);
  sub_10001C604();
  sub_10001C6C8();
  sub_10000E9E4();
}

void sub_100016528(uint64_t a1@<X8>)
{
  uint64_t v2;

  sub_1000164A0();
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = 2;
  *(_QWORD *)(a1 + 16) = 0;
}

uint64_t sub_100016558(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  *(_QWORD *)(v3 + 16) = a1;
  v5 = *a2;
  v6 = a2[1];
  v7 = a2[2];
  v8 = (_QWORD *)swift_task_alloc(dword_10003927C);
  *(_QWORD *)(v3 + 24) = v8;
  *v8 = v3;
  v8[1] = sub_1000165C4;
  return sub_10001449C(v5, v6, v7, a3);
}

uint64_t sub_1000165C4(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;

  sub_10001C3DC();
  v8 = *(_QWORD *)(v7 + 16);
  sub_10001C2D0();
  *(_QWORD *)v8 = a1;
  *(_BYTE *)(v8 + 8) = a2;
  *(_QWORD *)(v8 + 16) = a3;
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_100016618(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v6 = *a2;
  v7 = a2[1];
  v8 = a2[2];
  v9 = (_QWORD *)swift_task_alloc(dword_10003924C);
  *(_QWORD *)(v3 + 16) = v9;
  *v9 = v3;
  v9[1] = sub_10001C2B4;
  return sub_100014F74(a1, v6, v7, v8, a3);
}

void sub_100016694(uint64_t *a1, uint64_t a2, double (*a3)(uint64_t *, __n128), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, uint64_t);

  v7 = *a1;
  v8 = a1[1];
  v9 = (void (*)(char *, uint64_t))a1[2];
  swift_retain(a4);
  sub_1000145F0(v7, v8, v9, a2, a3, a4);
}

void sub_1000166F0()
{
  sub_1000154C0();
}

uint64_t sub_10001670C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to AppIntentTimelineProvider.relevances()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_10001C2B4;
  return AppIntentTimelineProvider.relevances()(a1, a2, a3);
}

uint64_t sub_100016778(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to AppIntentTimelineProvider.relevance()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_10001C2B4;
  return AppIntentTimelineProvider.relevance()(a1, a2, a3);
}

id sub_1000167E4(uint64_t a1)
{
  return sub_1000167F0(a1, &qword_10003C680);
}

id sub_1000167F0(uint64_t a1, _QWORD *a2)
{
  void *v3;

  if (qword_1000385F8 != -1)
    swift_once(&qword_1000385F8, sub_100017DD0);
  v3 = (void *)qword_10003C688;
  *a2 = qword_10003C688;
  return v3;
}

uint64_t sub_100016840(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  double *v17;
  id v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __n128 v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _BYTE v35[16];

  v6 = type metadata accessor for OSSignpostID(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  v10 = &v35[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_1000385F0 != -1)
  {
    swift_once(&qword_1000385F0, sub_1000167E4);
    if (a3)
      goto LABEL_3;
LABEL_7:
    v33 = sub_10000B8A0(&qword_100039220);
    v27 = swift_allocObject(v33, 56, 7);
    *(_OWORD *)(v27 + 16) = xmmword_100029240;
    *(_QWORD *)(v27 + 32) = objc_msgSend((id)objc_opt_self(PXTimelineEntry), "privacyDisclosureEntryForContentType:", 1);
    *(_BYTE *)(v27 + 40) = 3;
    *(_QWORD *)(v27 + 48) = 0;
    return v27;
  }
  if (!a3)
    goto LABEL_7;
LABEL_3:
  v11 = (void *)qword_10003C680;
  v12 = a3;
  v13 = v11;
  v14 = OSSignpostID.init(log:)();
  v15 = static os_signpost_type_t.begin.getter(v14);
  os_signpost(_:dso:log:name:signpostID:)(v15, &_mh_execute_header, v13, "LoadAllEntries", 14, 2, v10);
  v16 = (void *)objc_opt_self(PXWidgetTimeline);
  v17 = (double *)(a1 + *(int *)(type metadata accessor for PhotosReliveWidgetSize(0) + 20));
  v18 = objc_msgSend(v16, "timelineFromLibrary:forWidgetSize:timelineSize:", v12, sub_100010F3C(), *v17, v17[1]);
  v19 = sub_10001BB44(0, &qword_100039230, PXTimelineEntry_ptr);
  v20 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v18, v19);

  v21 = sub_1000140F8(a2, v20);
  __chkstk_darwin(v21, v22);
  *(_QWORD *)&v35[-16] = a1;
  *(_QWORD *)&v35[-8] = v12;
  sub_1000142AC((void (*)(uint64_t *__return_ptr, id *))sub_10001C0F0, (uint64_t)&v35[-32], v21, v23, v24, v25);
  v27 = v26;
  v28 = static os_signpost_type_t.end.getter(v26);
  os_signpost(_:dso:log:name:signpostID:)(v28, &_mh_execute_header, v13, "LoadAllEntries", 14, 2, v10);
  if (!*(_QWORD *)(v27 + 16))
  {
    v29 = swift_bridgeObjectRelease(v27);
    v30 = static os_log_type_t.default.getter(v29);
    os_log(_:dso:log:_:_:)(v30, &_mh_execute_header, qword_10003C680, "timeline request returned no entries; using fallback no-content state",
      69,
      2,
      &_swiftEmptyArrayStorage);
    v31 = sub_10000B8A0(&qword_100039220);
    v27 = swift_allocObject(v31, 56, 7);
    *(_OWORD *)(v27 + 16) = xmmword_100029240;
    v32 = (void *)objc_opt_self(PXTimelineEntry);
    *(_QWORD *)(v27 + 32) = objc_msgSend(v32, "fallbackEntryForContentType:sourceIdentifier:size:", 1, 0, sub_100010F3C());
    *(_BYTE *)(v27 + 40) = 1;
    *(_QWORD *)(v27 + 48) = 0;
  }
  swift_unknownObjectRelease(v21);

  (*(void (**)(_BYTE *, uint64_t))(v7 + 8))(v10, v6);
  return v27;
}

void sub_100016B84(void **a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;

  type metadata accessor for PhotosReliveWidgetSize(0);
  sub_10000E868();
  __chkstk_darwin(v8, v9);
  sub_10001C3EC();
  v12 = v11 - v10;
  v13 = *a1;
  sub_10001BEEC(a2, v11 - v10, (void (*)(_QWORD))type metadata accessor for PhotosReliveWidgetSize);
  type metadata accessor for PhotosReliveWidgetViewModel(0);
  v14 = v13;
  v15 = a3;
  sub_10001E594();
  v17 = v16;

  sub_100010EDC(v12, type metadata accessor for PhotosReliveWidgetSize);
  *(_QWORD *)a4 = v14;
  *(_BYTE *)(a4 + 8) = 0;
  *(_QWORD *)(a4 + 16) = v17;
}

void sub_100016C70(void (*a1)(char *, uint64_t), double (*a2)(uint64_t *, __n128), uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  __n128 v21;
  os_log_type_t v22;
  NSObject *v23;
  uint64_t (*v24)(char *, char *, uint64_t);
  void (*v25)(char *, void (*)(_QWORD, _QWORD), uint64_t);
  os_log_type_t v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  __n128 v34;
  uint64_t (*v35)(char *, uint64_t, __n128);
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  char v46;
  uint64_t v47;
  id v48;
  __n128 v49;
  __n128 v50;
  os_log_type_t v51;
  NSObject *v52;
  os_log_type_t v53;
  id v54;
  id v55;
  uint8_t *v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  uint64_t v63;
  os_log_t v64;
  double (*v65)(uint64_t *, __n128);
  char *v66;
  uint64_t (*v67)(char *, char *, uint64_t);
  uint64_t v68;
  void (*v69)(char *, uint64_t);
  uint64_t v70;
  id v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  uint64_t v77;

  v70 = a3;
  v65 = a2;
  v68 = type metadata accessor for PhotosReliveWidgetSize(0);
  __chkstk_darwin(v68, v4);
  v6 = (char *)&v64 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TimelineProviderContext(0);
  v73 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7, v8);
  v10 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for WidgetFamily(0);
  v12 = *(_QWORD *)(v11 - 8);
  v14 = __chkstk_darwin(v11, v13);
  v16 = (char *)&v64 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __chkstk_darwin(v14, v17);
  v20 = (char *)&v64 - v19;
  TimelineProviderContext.family.getter(v18);
  v71 = sub_100015940();
  v22 = static os_log_type_t.default.getter(v21);
  if (qword_1000385F0 != -1)
    swift_once(&qword_1000385F0, sub_1000167E4);
  v23 = qword_10003C680;
  v24 = *(uint64_t (**)(char *, char *, uint64_t))(v12 + 16);
  v72 = v20;
  v67 = v24;
  v24(v16, v20, v11);
  v25 = *(void (**)(char *, void (*)(_QWORD, _QWORD), uint64_t))(v73 + 16);
  v69 = a1;
  v25(v10, (void (*)(_QWORD, _QWORD))a1, v7);
  v26 = v22;
  v64 = v23;
  v27 = os_log_type_enabled(v23, v22);
  v66 = v6;
  if (v27)
  {
    v28 = swift_slowAlloc(18, -1);
    v29 = swift_slowAlloc(32, -1);
    v75 = v29;
    *(_DWORD *)v28 = 136446466;
    sub_10000BDF4(&qword_100039020, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily);
    v31 = dispatch thunk of CustomStringConvertible.description.getter(v11, v30);
    v33 = v32;
    v74 = sub_100019C88(v31, v32, &v75);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, &v75, v28 + 4, v28 + 12);
    v34 = swift_bridgeObjectRelease(v33);
    v35 = *(uint64_t (**)(char *, uint64_t, __n128))(v12 + 8);
    v36 = v35(v16, v11, v34);
    *(_WORD *)(v28 + 12) = 1026;
    v37 = TimelineProviderContext.isPreview.getter(v36) & 1;
    (*(void (**)(char *, uint64_t))(v73 + 8))(v10, v7);
    LODWORD(v74) = v37;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, (char *)&v74 + 4, v28 + 14, v28 + 18);
    _os_log_impl((void *)&_mh_execute_header, v64, v26, "snapshot requested at size %{public}s inAddSheet  %{BOOL,public}d", (uint8_t *)v28, 0x12u);
    swift_arrayDestroy(v29, 1);
    swift_slowDealloc(v29, -1, -1);
    v38 = v28;
    v6 = v66;
    swift_slowDealloc(v38, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v73 + 8))(v10, v7);
    v35 = *(uint64_t (**)(char *, uint64_t, __n128))(v12 + 8);
    ((void (*)(char *, uint64_t))v35)(v16, v11);
  }
  v39 = v67(v6, v72, v11);
  v40 = TimelineProviderContext.displaySize.getter(v39);
  v41 = &v6[*(int *)(v68 + 20)];
  *(double *)v41 = v40;
  *((_QWORD *)v41 + 1) = v42;
  v43 = sub_100016840((uint64_t)v6, 1, v71);
  if (*(_QWORD *)(v43 + 16))
  {
    v44 = v43;
    v69 = (void (*)(char *, uint64_t))v35;
    v73 = v11;
    v45 = *(void **)(v43 + 32);
    v46 = *(_BYTE *)(v43 + 40);
    v47 = *(_QWORD *)(v43 + 48);
    swift_retain(v47);
    v48 = v45;
    v49 = swift_bridgeObjectRelease(v44);
    v75 = (uint64_t)v48;
    v76 = v46;
    v77 = v47;
    v50.n128_f64[0] = v65(&v75, v49);
    v51 = static os_log_type_t.default.getter(v50);
    v52 = qword_10003C680;
    v53 = v51;
    if (os_log_type_enabled((os_log_t)qword_10003C680, v51))
    {
      v54 = v48;
      swift_retain_n(v47, 2);
      v55 = v54;
      v56 = (uint8_t *)swift_slowAlloc(12, -1);
      v57 = swift_slowAlloc(32, -1);
      v75 = v57;
      *(_DWORD *)v56 = 136446210;
      v58 = v55;
      swift_retain(v47);
      PhotosReliveWidgetEntry.description.getter();
      v60 = v59;
      v62 = v61;
      swift_release(v47);

      v74 = sub_100019C88(v60, v62, &v75);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v74, &v75, v56 + 4, v56 + 12);
      swift_release_n(v47, 2);

      swift_bridgeObjectRelease(v62);
      _os_log_impl((void *)&_mh_execute_header, v52, v53, "snapshot request completed with entry %{public}s", v56, 0xCu);
      swift_arrayDestroy(v57, 1);
      swift_slowDealloc(v57, -1, -1);
      swift_slowDealloc(v56, -1, -1);
      swift_release(v47);

      v63 = (uint64_t)v66;
    }
    else
    {
      swift_release(v47);

      v63 = (uint64_t)v6;
    }
    sub_100010EDC(v63, type metadata accessor for PhotosReliveWidgetSize);
    v69(v72, v73);
    swift_release(v70);
  }
  else
  {
    __break(1u);
  }
}

void PhotosReliveWidgetEntryProvider.getSnapshot(in:completion:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  double (*v3)(id, uint64_t (*)(uint64_t, uint64_t), uint64_t);
  NSObject *v4;
  void (*v5)(uint64_t, uint64_t);
  void (*v6)(uint64_t, uint64_t);
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
  uint64_t v19;
  uint64_t v20;
  char *v21;
  __n128 v22;
  os_log_type_t v23;
  NSObject *v24;
  uint64_t (*v25)(uint64_t, uint64_t, _QWORD);
  _BOOL4 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  uint64_t v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  __n128 v49;
  os_log_type_t v50;
  id v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  os_log_t v60[2];
  double (*v61)(id, uint64_t (*)(uint64_t, uint64_t), uint64_t);
  uint64_t v62;
  void (*v63)(uint64_t, char *, uint64_t);
  uint64_t v64;
  void (*v65)(uint64_t, uint64_t);
  id v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  uint64_t v70;

  sub_10000F0E4();
  v60[1] = v4;
  v61 = v3;
  v6 = v5;
  v64 = sub_10001C744();
  sub_10000E868();
  __chkstk_darwin(v7, v8);
  v68 = sub_10001C370();
  v9 = *(_QWORD *)(v68 - 8);
  __chkstk_darwin(v68, v10);
  sub_10001C5B4();
  v11 = sub_10000EF04();
  sub_10001C5E4();
  __chkstk_darwin(v12, v13);
  sub_10000F024();
  v16 = v14 - v15;
  v19 = __chkstk_darwin(v17, v18);
  v21 = (char *)v60 - v20;
  TimelineProviderContext.family.getter(v19);
  v66 = sub_100015940();
  v23 = static os_log_type_t.default.getter(v22);
  if (qword_1000385F0 != -1)
    swift_once(&qword_1000385F0, sub_1000167E4);
  v24 = qword_10003C680;
  v63 = *(void (**)(uint64_t, char *, uint64_t))(v1 + 16);
  v63(v16, v21, v11);
  v25 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v9 + 16);
  v65 = v6;
  sub_10001C6BC(v2, v25);
  v60[0] = v24;
  v26 = os_log_type_enabled(v24, v23);
  v62 = v0;
  v67 = v11;
  if (v26)
  {
    v27 = sub_10001C2C8(18);
    v28 = sub_10001C2C8(32);
    v70 = v28;
    *(_DWORD *)v27 = 136446466;
    sub_10000BDF4(&qword_100039020, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily);
    v30 = dispatch thunk of CustomStringConvertible.description.getter(v67, v29);
    v32 = sub_10001C668(v30, v31);
    sub_10001C398(v32, v33, v34, v27 + 12);
    sub_10001C2E0();
    v35 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8);
    v36 = v35(v16, v67);
    *(_WORD *)(v27 + 12) = 1026;
    v37 = TimelineProviderContext.isPreview.getter(v36) & 1;
    sub_10001C4EC(v2, *(uint64_t (**)(uint64_t, _QWORD))(v9 + 8));
    v69 = v37;
    v0 = v62;
    v38 = sub_10001C654();
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v38, v39, v40, v41);
    _os_log_impl((void *)&_mh_execute_header, v60[0], v23, "snapshot requested at size %{public}s inAddSheet  %{BOOL,public}d", (uint8_t *)v27, 0x12u);
    sub_10001C434(v28);
    sub_100010F30(v28);
    v42 = v27;
    v11 = v67;
    sub_100010F30(v42);
  }
  else
  {
    sub_10001C4EC(v2, *(uint64_t (**)(uint64_t, _QWORD))(v9 + 8));
    v35 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8);
    v35(v16, v11);
  }
  v68 = (uint64_t)v21;
  v43 = ((uint64_t (*)(uint64_t, char *, uint64_t))v63)(v0, v21, v11);
  v44 = TimelineProviderContext.displaySize.getter(v43);
  v45 = v0 + *(int *)(v64 + 20);
  *(double *)v45 = v44;
  *(_QWORD *)(v45 + 8) = v46;
  v47 = sub_100016840(v0, 1, v66);
  if (*(_QWORD *)(v47 + 16))
  {
    sub_10001C320(v47);
    v48 = (id)v23;
    sub_10001C2E0();
    v49.n128_f64[0] = v61(v48, v35, v2);
    v50 = static os_log_type_t.default.getter(v49);
    if (sub_10001C564(v50))
    {
      v51 = v48;
      sub_10001C5F4();
      v52 = v48;
      v53 = sub_10001C2C8(12);
      v54 = sub_10001C2C8(32);
      v70 = v54;
      sub_10001C554(4.8751e-34);
      sub_10001C730();
      sub_10001C57C();
      sub_10001C3B0();

      v55 = sub_10001C50C();
      sub_10001C304(v55);
      sub_10001C690();

      sub_10001C758();
      sub_10001C470((void *)&_mh_execute_header, v56, v57, "snapshot request completed with entry %{public}s");
      sub_10001C434(v54);
      sub_100010F30(v54);
      sub_100010F30(v53);
      sub_10001C3B0();

      sub_10001C52C();
      sub_100010EDC(v62, type metadata accessor for PhotosReliveWidgetSize);
      v59 = v67;
      v58 = v68;
    }
    else
    {
      sub_10001C3B0();

      sub_10001C52C();
      sub_100010EDC(v0, type metadata accessor for PhotosReliveWidgetSize);
      v58 = v68;
      v59 = v11;
    }
    v65(v58, v59);
    sub_10000E8C0();
  }
  else
  {
    __break(1u);
  }
}

void PhotosReliveWidgetEntryProvider.getTimeline(in:completion:)()
{
  void (*v0)(char *);
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  __n128 v40;
  os_log_type_t v41;
  NSObject *v42;
  _BOOL4 v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(uint64_t, uint64_t, uint64_t);
  uint64_t v52;
  double v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
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
  void (*v67)(uint64_t, uint64_t);
  unint64_t v68;
  char *v69;
  __n128 v70;
  NSObject *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  os_log_type_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void (*v89)(uint64_t, uint64_t);
  uint64_t v90;
  uint64_t v91;
  void (*v92)(uint64_t, uint64_t);
  uint64_t v93;
  char *v94;
  void (*v95)(char *, uint64_t);
  uint64_t v96;
  void (*v97)(char *, char *, uint64_t);
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void (*v102)(char *);
  uint64_t v103;
  uint64_t v104;
  void (*v105)(char *, uint64_t);
  uint64_t v106;
  char *v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114[6];

  sub_10000F0E4();
  v101 = v1;
  v102 = v0;
  v3 = v2;
  v110 = sub_10000B8A0(&qword_100039028);
  v106 = *(_QWORD *)(v110 - 8);
  sub_10000E868();
  __chkstk_darwin(v4, v5);
  sub_10001C3FC(v6, v96);
  __chkstk_darwin(v7, v8);
  v112 = (char *)&v96 - v9;
  v98 = sub_10000B8A0(&qword_100039030);
  sub_10000E868();
  __chkstk_darwin(v10, v11);
  sub_10000E954();
  v100 = v12;
  v15 = __chkstk_darwin(v13, v14);
  sub_10001C6E8(v15, v16, v17, v18, v19, v20, v21, v22, v96);
  v23 = sub_10001C744();
  sub_10000E868();
  __chkstk_darwin(v24, v25);
  sub_10000E874();
  v109 = v26;
  v27 = sub_10000EF04();
  v28 = *(_QWORD *)(v27 - 8);
  __chkstk_darwin(v27, v29);
  sub_10000E954();
  v103 = v30;
  v33 = __chkstk_darwin(v31, v32);
  v35 = (char *)&v96 - v34;
  v37 = __chkstk_darwin(v33, v36);
  v39 = (char *)&v96 - v38;
  v99 = v3;
  TimelineProviderContext.family.getter(v37);
  v108 = sub_100015940();
  v41 = static os_log_type_t.default.getter(v40);
  if (qword_1000385F0 != -1)
    swift_once(&qword_1000385F0, sub_1000167E4);
  v42 = qword_10003C680;
  v97 = *(void (**)(char *, char *, uint64_t))(v28 + 16);
  v97(v35, v39, v27);
  v43 = os_log_type_enabled(v42, v41);
  v107 = v39;
  if (v43)
  {
    v44 = (uint8_t *)sub_10001C2C8(12);
    v45 = sub_10001C2C8(32);
    v114[0] = v45;
    *(_DWORD *)v44 = 136446210;
    v96 = v23;
    sub_10000BDF4(&qword_100039020, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily);
    v47 = sub_10001C74C(v46, v46);
    v113 = sub_10001C43C(v47, v48);
    v23 = v96;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v113, v114, v44 + 4, v44 + 12);
    sub_10001C2E0();
    v105 = *(void (**)(char *, uint64_t))(v28 + 8);
    v105(v35, v27);
    _os_log_impl((void *)&_mh_execute_header, v42, v41, "timeline requested for size %{public}s", v44, 0xCu);
    sub_10001C434(v45);
    sub_100010F30(v45);
    v49 = (uint64_t)v44;
    v39 = v107;
    sub_100010F30(v49);
  }
  else
  {
    v105 = *(void (**)(char *, uint64_t))(v28 + 8);
    v105(v35, v27);
  }
  v50 = v109;
  v51 = (void (*)(uint64_t, uint64_t, uint64_t))v97;
  v52 = ((uint64_t (*)(uint64_t, char *, uint64_t))v97)(v109, v39, v27);
  v53 = TimelineProviderContext.displaySize.getter(v52);
  v54 = v50 + *(int *)(v23 + 20);
  *(double *)v54 = v53;
  *(_QWORD *)(v54 + 8) = v55;
  v56 = v108;
  v57 = (uint64_t)v39;
  v58 = sub_100016840(v50, 2, v108);
  v59 = v98;
  v60 = v111;
  v61 = v111 + *(int *)(v98 + 48);
  sub_10001C498();
  sub_100015B38(v62, v63, v64, v57);
  v65 = v100;
  v66 = v100 + *(int *)(v59 + 48);
  type metadata accessor for TimelineReloadPolicy(0);
  sub_10001C534();
  v67(v65, v60);
  sub_10001A404(v61, v66);
  v68 = sub_10001A44C();
  v69 = v112;
  Timeline.init(entries:policy:)(v58, v65, &type metadata for PhotosReliveWidgetEntry, v68);
  sub_10000E500(v66, &qword_100039038);
  v102(v69);
  type metadata accessor for PhotosReliveWidgetViewModel(0);
  sub_10001E798(v50, (double *)v114);
  objc_msgSend(v56, "setWidgetTimelineGeneratedForDisplaySize:", *(double *)v114, *(double *)&v114[1]);
  sub_1000119AC(v61, v57);
  LOBYTE(v66) = static os_log_type_t.default.getter(v70);
  v71 = qword_10003C680;
  v72 = v103;
  v51(v103, v57, v27);
  v73 = v106;
  v74 = v104;
  (*(void (**)(uint64_t, char *, uint64_t))(v106 + 16))(v104, v69, v110);
  v75 = v66;
  if (os_log_type_enabled(v71, (os_log_type_t)v66))
  {
    v76 = sub_10001C2C8(22);
    v102 = (void (*)(char *))sub_10001C2C8(64);
    v114[0] = (uint64_t)v102;
    *(_DWORD *)v76 = 136446466;
    sub_10000BDF4(&qword_100039020, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily);
    v78 = dispatch thunk of CustomStringConvertible.description.getter(v27, v77);
    v113 = sub_10001C43C(v78, v79);
    sub_10001C544(v113, v80, v81, v76 + 12);
    sub_10001C2E0();
    v105((char *)v72, v27);
    *(_WORD *)(v76 + 12) = 2082;
    v82 = v110;
    Timeline.entries.getter(v110);
    v83 = Array.description.getter();
    v103 = v27;
    v84 = v83;
    v86 = v85;
    sub_10001C2E0();
    v113 = sub_100019C88(v84, v86, v114);
    sub_10001C544(v113, v87, v88, v76 + 22);
    sub_10000EDBC();
    v89 = *(void (**)(uint64_t, uint64_t))(v106 + 8);
    v89(v74, v82);
    _os_log_impl((void *)&_mh_execute_header, v71, v75, "timeline request completed for size %{public}s with entries %{public}s", (uint8_t *)v76, 0x16u);
    v90 = (uint64_t)v102;
    swift_arrayDestroy(v102, 2);
    sub_100010F30(v90);
    sub_100010F30(v76);

    v89((uint64_t)v112, v82);
    sub_10000E500(v111, &qword_100039030);
    sub_100010EDC(v109, type metadata accessor for PhotosReliveWidgetSize);
    v105(v107, v103);
  }
  else
  {
    v91 = v72;
    v92 = *(void (**)(uint64_t, uint64_t))(v73 + 8);
    v93 = v110;
    v92(v74, v110);
    v94 = (char *)v91;
    v95 = v105;
    v105(v94, v27);

    v92((uint64_t)v112, v93);
    sub_10000E500(v111, &qword_100039030);
    sub_100010EDC(v109, type metadata accessor for PhotosReliveWidgetSize);
    v95(v107, v27);
  }
  sub_10000E8C0();
}

void PhotosReliveWidgetEntryProvider.placeholder(in:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v1 = type metadata accessor for PhotosReliveWidgetSize(0);
  sub_10000E868();
  __chkstk_darwin(v2, v3);
  v4 = sub_10001C354();
  v5 = TimelineProviderContext.displaySize.getter(v4);
  v6 = v0 + *(int *)(v1 + 20);
  *(double *)v6 = v5;
  *(_QWORD *)(v6 + 8) = v7;
  v8 = objc_msgSend((id)objc_opt_self(PXTimelineEntry), "placeholderEntryForContentType:", 0);
  sub_10001C604();
  sub_10001C6C8();
  sub_10000E9E4();
}

void sub_100017C58(uint64_t a1@<X8>)
{
  uint64_t v2;

  PhotosReliveWidgetEntryProvider.placeholder(in:)();
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = 2;
  *(_QWORD *)(a1 + 16) = 0;
}

void sub_100017C88(void (*a1)(char *, uint64_t), double (*a2)(uint64_t *, __n128), uint64_t a3)
{
  swift_retain(a3);
  sub_100016C70(a1, a2, a3);
}

uint64_t sub_100017CCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to TimelineProvider.relevances()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_100017D38;
  return TimelineProvider.relevances()(a1, a2, a3);
}

uint64_t sub_100017D38()
{
  uint64_t v0;

  sub_10001C3DC();
  sub_10001C2D0();
  return sub_10001C41C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100017D64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(async function pointer to TimelineProvider.relevance()[1]);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_10001C2B4;
  return TimelineProvider.relevance()(a1, a2, a3);
}

uint64_t sub_100017DD0()
{
  uint64_t result;

  sub_10001BB44(0, &qword_100039208, OS_os_log_ptr);
  result = OS_os_log.init(subsystem:category:)(0xD000000000000023, 0x800000010002B6B0, 0xD000000000000010, 0x800000010002B6E0);
  qword_10003C688 = result;
  return result;
}

uint64_t sub_100017E44()
{
  id v0;
  id v1;
  void *v2;
  id v3;
  __n128 v4;
  uint64_t v5;

  if (!objc_msgSend((id)objc_opt_self(PDCPreflightManager), "isPreflightFeatureEnabled"))
    return 0;
  v0 = objc_allocWithZone((Class)LSApplicationRecord);
  v1 = sub_1000195E8(0xD000000000000019, 0x800000010002BC70, 0);
  sub_10001BB44(0, &qword_100039258, OS_dispatch_queue_ptr);
  v2 = (void *)static OS_dispatch_queue.main.getter();
  v3 = objc_msgSend(objc_allocWithZone((Class)PDCPreflightManager), "initWithTargetQueue:", v2);

  if (!objc_msgSend(v3, "requiresPreflightForApplicationRecord:", v1))
  {

    return 0;
  }
  v5 = static os_log_type_t.default.getter(v4);
  if (qword_1000385F8 != -1)
    swift_once(&qword_1000385F8, sub_100017DD0);
  os_log(_:dso:log:_:_:)(v5, &_mh_execute_header, qword_10003C688, "Photos requires privacy disclosure", 34, 2, &_swiftEmptyArrayStorage);

  return 1;
}

void *sub_10001811C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  v2 = a1 + 24 * v1;
  v3 = *(void **)(v2 + 8);
  swift_retain(*(_QWORD *)(v2 + 24));
  v4 = v3;
  return v3;
}

uint64_t sub_100018180(uint64_t a1, uint64_t a2, void *a3, char a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  double v30;
  double v31;
  __n128 v32;
  os_log_type_t v33;
  NSObject *v34;
  void (*v35)(char *, char *, uint64_t);
  uint64_t v36;
  os_log_type_t v37;
  uint64_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  __n128 v46;
  void (*v47)(char *, uint64_t, __n128);
  uint64_t v48;
  uint64_t v49;
  __n128 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  char v56;
  uint64_t (*v57)(char *, uint64_t);
  uint64_t v58;
  uint64_t v59;
  double v60;
  double v61;
  uint64_t v62;
  __n128 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  __n128 v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v75;
  void (*v76)(char *, char *, uint64_t);
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;

  v78 = a1;
  v79 = a2;
  v80 = type metadata accessor for Date(0);
  v10 = *(_QWORD *)(v80 - 8);
  v12 = __chkstk_darwin(v80, v11);
  v14 = (char *)&v75 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v12, v15);
  v18 = (char *)&v75 - v17;
  v20 = __chkstk_darwin(v16, v19);
  v22 = (char *)&v75 - v21;
  __chkstk_darwin(v20, v23);
  v25 = (char *)&v75 - v24;
  if (!a3)
  {
    v29 = 0xE400000000000000;
    v27 = 1701736302;
    goto LABEL_5;
  }
  if (!a4)
  {
    swift_retain(a5);
    v54 = a3;
    PhotosReliveWidgetEntry.date.getter((uint64_t)v25);
    Date.init()(v55);
    v56 = static Date.> infix(_:_:)(v25, v22);
    v57 = *(uint64_t (**)(char *, uint64_t))(v10 + 8);
    v58 = v80;
    v59 = v57(v22, v80);
    if ((v56 & 1) == 0)
    {
      static TimelineReloadPolicy.never.getter(v59);
      swift_release(a5);

      v72 = v25;
      v73 = v58;
      goto LABEL_16;
    }
    PhotosReliveWidgetEntry.endDate.getter((uint64_t)v22);
    v60 = Date.timeIntervalSince(_:)(v25);
    v57(v22, v58);
    if (v60 < 1200.0)
    {
      __break(1u);
    }
    else
    {
      sub_10001A8FC(1200.0, v60);
      Date.addingTimeInterval(_:)(v62, v61 + -1200.0);
      v58 = static os_log_type_t.default.getter(v63);
      if (qword_1000385F8 == -1)
      {
LABEL_14:
        v64 = qword_10003C688;
        v65 = sub_10000B8A0(&qword_100039310);
        v66 = swift_allocObject(v65, 112, 7);
        *(_OWORD *)(v66 + 16) = xmmword_100029220;
        v67 = Date.description.getter();
        v69 = v68;
        *(_QWORD *)(v66 + 56) = &type metadata for String;
        *(_QWORD *)(v66 + 64) = sub_10001C058();
        *(_QWORD *)(v66 + 32) = v67;
        *(_QWORD *)(v66 + 40) = v69;
        *(_QWORD *)(v66 + 96) = &type metadata for Double;
        *(_QWORD *)(v66 + 104) = &protocol witness table for Double;
        *(double *)(v66 + 72) = v60;
        os_log(_:dso:log:_:_:)(v58, &_mh_execute_header, v64, "next timeline reload at %@, last entry duration %.f", 51, 2, v66);
        v70 = swift_bridgeObjectRelease(v66);
        static TimelineReloadPolicy.after(_:)(v22, v70);
        swift_release(a5);

        v71 = v80;
        v57(v22, v80);
        v72 = v25;
        v73 = v71;
LABEL_16:
        v57(v72, v73);
        v53 = type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration(0);
        v51 = v79;
        v52 = 1;
        return sub_10000BA28(v51, v52, 1, v53);
      }
    }
    swift_once(&qword_1000385F8, sub_100017DD0);
    goto LABEL_14;
  }
  v26 = objc_msgSend(a3, "localIdentifier");
  v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(v26);
  v29 = v28;

LABEL_5:
  v30 = sub_10001869C(v27, v29, a6, 1200.0);
  sub_10001A8FC(0.0, 300.0);
  v32.n128_f64[0] = Date.init(timeIntervalSinceNow:)(v30 + v31);
  v33 = static os_log_type_t.default.getter(v32);
  if (qword_1000385F8 != -1)
    swift_once(&qword_1000385F8, sub_100017DD0);
  v77 = v27;
  v34 = qword_10003C688;
  v35 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v36 = v80;
  v35(v14, v18, v80);
  v37 = v33;
  if (os_log_type_enabled(v34, v33))
  {
    v38 = swift_slowAlloc(12, -1);
    v75 = v10;
    v39 = (uint8_t *)v38;
    v40 = swift_slowAlloc(32, -1);
    v82 = v40;
    v76 = v35;
    *(_DWORD *)v39 = 136315138;
    v41 = Date.description.getter();
    v42 = v29;
    v44 = v43;
    v81 = sub_100019C88(v41, v43, &v82);
    v35 = v76;
    v36 = v80;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v81, &v82, v39 + 4, v39 + 12);
    v45 = v44;
    v29 = v42;
    v46 = swift_bridgeObjectRelease(v45);
    v47 = *(void (**)(char *, uint64_t, __n128))(v75 + 8);
    v47(v14, v36, v46);
    _os_log_impl((void *)&_mh_execute_header, v34, v37, "scheduled timeline reload because content unavailable at %s", v39, 0xCu);
    swift_arrayDestroy(v40, 1);
    swift_slowDealloc(v40, -1, -1);
    swift_slowDealloc(v39, -1, -1);
  }
  else
  {
    v47 = *(void (**)(char *, uint64_t, __n128))(v10 + 8);
    ((void (*)(char *, uint64_t))v47)(v14, v36);
  }
  v48 = v79;
  v49 = type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration(0);
  v35((char *)(v48 + *(int *)(v49 + 24)), v18, v36);
  *(_QWORD *)v48 = v77;
  *(_QWORD *)(v48 + 8) = v29;
  *(double *)(v48 + 16) = v30;
  static TimelineReloadPolicy.after(_:)(v18, v50);
  ((void (*)(char *, uint64_t))v47)(v18, v36);
  v51 = v48;
  v52 = 0;
  v53 = v49;
  return sub_10000BA28(v51, v52, 1, v53);
}

double sub_10001869C(uint64_t a1, unint64_t a2, uint64_t a3, double a4)
{
  uint64_t v8;
  uint64_t v9;
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  os_log_type_t v27;
  NSObject *v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;

  v8 = type metadata accessor for Date(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8, v10);
  v12 = (char *)&v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_10000B8A0(&qword_100039038);
  __chkstk_darwin(v13, v14);
  v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration(0);
  __chkstk_darwin(v17, v18);
  v20 = (char *)&v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001125C(a3, (uint64_t)v16);
  if (sub_10000BA0C((uint64_t)v16, 1, v17) == 1)
  {
    sub_10000E500((uint64_t)v16, &qword_100039038);
  }
  else
  {
    sub_10001BF54((uint64_t)v16, (uint64_t)v20);
    v21 = *((_QWORD *)v20 + 1);
    if (v21)
    {
      v22 = *(_QWORD *)v20;
      v23 = *(_QWORD *)v20 == a1 && v21 == a2;
      if (v23 || (v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v22, v21, a1, a2, 0), (v22 & 1) != 0))
      {
        v24 = &v20[*(int *)(v17 + 24)];
        Date.init()(v22);
        sub_10000BDF4(&qword_100039300, (uint64_t (*)(uint64_t))&type metadata accessor for Date);
        LOBYTE(v24) = dispatch thunk of static Comparable.< infix(_:_:)(v12, v24, v8, v25);
        v26 = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
        if ((v24 & 1) != 0)
        {
          v27 = static os_log_type_t.debug.getter(v26);
          if (qword_1000385E0 != -1)
            swift_once(&qword_1000385E0, sub_1000111E8);
          v28 = qword_100039010;
          if (os_log_type_enabled((os_log_t)qword_100039010, v27))
          {
            swift_bridgeObjectRetain_n(a2, 2);
            v29 = (uint8_t *)swift_slowAlloc(12, -1);
            v30 = swift_slowAlloc(32, -1);
            v33 = v30;
            *(_DWORD *)v29 = 136446210;
            swift_bridgeObjectRetain(a2);
            v32 = sub_100019C88(a1, a2, &v33);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v32, &v33, v29 + 4, v29 + 12);
            swift_bridgeObjectRelease_n(a2, 3);
            _os_log_impl((void *)&_mh_execute_header, v28, v27, "Not increasing reload delay for entry id %{public}s because reload occurred before scheduled time", v29, 0xCu);
            swift_arrayDestroy(v30, 1);
            swift_slowDealloc(v30, -1, -1);
            swift_slowDealloc(v29, -1, -1);
          }
          a4 = *((double *)v20 + 2);
        }
        else if (*((double *)v20 + 2) + *((double *)v20 + 2) <= 3600.0)
        {
          a4 = *((double *)v20 + 2) + *((double *)v20 + 2);
        }
        else
        {
          a4 = 3600.0;
        }
      }
    }
    sub_100010EDC((uint64_t)v20, type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration);
  }
  return a4;
}

void PhotosReliveWidget.body.getter()
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
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
  unint64_t v64;
  unsigned int v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
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

  sub_10000F0E4();
  v73 = sub_10000B8A0(&qword_100038660);
  v71 = *(_QWORD *)(v73 - 8);
  sub_10000E868();
  __chkstk_darwin(v1, v2);
  sub_10000E874();
  v70 = v3;
  v76 = sub_10000B8A0(&qword_100038658);
  v74 = *(_QWORD *)(v76 - 8);
  sub_10000E868();
  __chkstk_darwin(v4, v5);
  sub_10001C4A4(v6, v58);
  v79 = sub_10000B8A0(&qword_100038650);
  v77 = *(_QWORD *)(v79 - 8);
  sub_10000E868();
  __chkstk_darwin(v7, v8);
  sub_10000EE9C(v9, v59);
  v10 = sub_10000B8A0(&qword_100038648);
  v80 = *(_QWORD *)(v10 - 8);
  v81 = v10;
  sub_10000E868();
  __chkstk_darwin(v11, v12);
  sub_10001C2E8(v13, v60);
  v14 = sub_10000B8A0(&qword_100039048);
  v83 = *(_QWORD *)(v14 - 8);
  v84 = v14;
  sub_10000E868();
  __chkstk_darwin(v15, v16);
  sub_10001C4C0(v17, v61);
  v18 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
  v69 = sub_10001AAAC(v18);
  v68 = v19;
  if (v19)
  {
    v20 = sub_10000B8A0(&qword_100039050);
    sub_10000EF04();
    sub_10001C628();
    v23 = v22 & ~v21;
    v67 = swift_allocObject(v20, v23 + 4 * v0, v21 | 7);
    *(_OWORD *)(v67 + 16) = xmmword_100029DB0;
    sub_10001C58C(v67 + v23, enum case for WidgetFamily.systemSmall(_:));
    sub_10001C58C(v67 + v23 + v0, enum case for WidgetFamily.systemMedium(_:));
    sub_10001C58C(v67 + v23 + 2 * v0, enum case for WidgetFamily.systemLarge(_:));
    sub_10001C58C(v67 + v23 + 3 * v0, enum case for WidgetFamily.systemExtraLarge(_:));
    v24 = sub_10000F234(0xD000000000000021, (uint64_t)"PHOTOS_RELIVE_WIDGET_DISPLAY_NAME");
    v26 = v25;
    v28 = v27;
    v30 = v29;
    v31 = sub_10000F234(0xD000000000000020, (uint64_t)"PHOTOS_RELIVE_WIDGET_DESCRIPTION");
    v33 = v32;
    v35 = v34;
    v37 = v36;
    v38 = sub_10001C51C(v31, "mainBundle");
    sub_10001C69C();
    v85 = sub_10001C45C(v24, v26, v28 & 1, v30, v39, v40, v41);
    v66 = v42;
    v86 = v43;
    v65 = v44 & 1;
    v45 = sub_10001C51C(v85, "mainBundle");
    sub_10001C69C();
    v62 = sub_10001C45C(v31, v33, v35 & 1, v37, v46, v47, v48);
    v63 = v49;
    v51 = v50 & 1;
    sub_10001C73C();
    sub_10000BDF4(&qword_100039058, type metadata accessor for PhotosReliveWidgetView);
    v64 = sub_10001AB18();
    StaticConfiguration.init<A>(kind:provider:content:)(v69, v68);
    sub_10000E4AC(&qword_100038668, &qword_100038660);
    v53 = v52;
    WidgetConfiguration.supportedFamilies(_:)(v67, v73, v52);
    sub_10001C758();
    (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v70, v73);
    v87 = v73;
    v88 = v53;
    v54 = sub_10000E9A8((uint64_t)&v87, (uint64_t)&opaque type descriptor for <<opaque return type of WidgetConfiguration.supportedFamilies(_:)>>);
    WidgetConfiguration.configurationDisplayName(_:)(v85, v66, v65, v86, v76, v54);
    sub_10001C504(v72, *(uint64_t (**)(uint64_t, uint64_t))(v74 + 8));
    v87 = v76;
    v88 = v54;
    v55 = sub_10000E9A8((uint64_t)&v87, (uint64_t)&opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>);
    WidgetConfiguration.description(_:)(v62, v64, v51, v63, v79, v55);
    sub_10001C504(v75, *(uint64_t (**)(uint64_t, uint64_t))(v77 + 8));
    v87 = v79;
    v88 = v55;
    v56 = sub_10000E9A8((uint64_t)&v87, (uint64_t)&opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>);
    WidgetConfiguration._containerBackgroundRemovable(_:)(0, v81, v56);
    sub_10001C504(v78, *(uint64_t (**)(uint64_t, uint64_t))(v80 + 8));
    v87 = v81;
    v88 = v56;
    v57 = sub_10000E9A8((uint64_t)&v87, (uint64_t)&unk_100030414);
    WidgetConfiguration.supportsAccentedContent()(v84, v57);
    sub_10001B9B8(v62, v64, v51, (uint64_t (*)(void))&_swift_release);
    swift_bridgeObjectRelease(v63);
    sub_10001C594(v85);
    swift_bridgeObjectRelease(v86);
    sub_10001C504(v82, *(uint64_t (**)(uint64_t, uint64_t))(v83 + 8));
    sub_10000E8C0();
  }
  else
  {
    __break(1u);
  }
}

void PhotosReliveCollectionsWidget.body.getter()
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  Swift::String v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  int v58;
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
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
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
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;

  sub_10000F0E4();
  v83 = sub_10000B8A0(&qword_100038688);
  v82 = *(_QWORD *)(v83 - 8);
  sub_10000E868();
  __chkstk_darwin(v0, v1);
  sub_10000E874();
  v81 = v2;
  v86 = sub_10000B8A0(&qword_100038680);
  v84 = *(_QWORD *)(v86 - 8);
  sub_10000E868();
  __chkstk_darwin(v3, v4);
  sub_10000E874();
  v88 = sub_10000B8A0(&qword_100038678);
  v87 = *(_QWORD *)(v88 - 8);
  sub_10000E868();
  __chkstk_darwin(v5, v6);
  sub_10001C4A4(v7, v72);
  v92 = sub_10000B8A0(&qword_100038670);
  v89 = *(_QWORD *)(v92 - 8);
  sub_10000E868();
  __chkstk_darwin(v8, v9);
  sub_10000EE9C(v10, v73);
  v93 = sub_10000B8A0(&qword_100039068);
  v91 = *(_QWORD *)(v93 - 8);
  sub_10000E868();
  __chkstk_darwin(v11, v12);
  sub_10001C2E8(v13, v74);
  v14 = sub_10000B8A0(&qword_100039070);
  v94 = *(_QWORD *)(v14 - 8);
  v95 = v14;
  sub_10000E868();
  __chkstk_darwin(v15, v16);
  sub_10001C4C0(v17, v75);
  v18 = (void *)objc_opt_self(NSBundle);
  v19 = sub_10001AAAC(objc_msgSend(v18, "mainBundle"));
  if (v20)
  {
    v21 = v20;
    v99 = v19;
    v100 = v20;
    swift_bridgeObjectRetain(v20);
    v22._countAndFlagsBits = 0x7463656C6C6F632ELL;
    v22._object = (void *)0xEC000000736E6F69;
    String.append(_:)(v22);
    swift_bridgeObjectRelease(v21);
    v80 = v99;
    v78 = v100;
    v23 = sub_10000B8A0(&qword_100039050);
    sub_10000EF04();
    sub_10001C628();
    v26 = v25 & ~v24;
    v76 = swift_allocObject(v23, v26 + 4 * (_QWORD)&v99, v24 | 7);
    *(_OWORD *)(v76 + 16) = xmmword_100029DB0;
    sub_10001C524(v76 + v26, enum case for WidgetFamily.systemSmall(_:));
    sub_10001C524((uint64_t)&v99 + v76 + v26, enum case for WidgetFamily.systemMedium(_:));
    sub_10001C524(v76 + v26 + 2 * (_QWORD)&v99, enum case for WidgetFamily.systemLarge(_:));
    sub_10001C524(v76 + v26 + 3 * (_QWORD)&v99, enum case for WidgetFamily.systemExtraLarge(_:));
    v27 = sub_10000F234(0xD00000000000002DLL, (uint64_t)"PHOTOS_RELIVE_WIDGET_COLLECTIONS_DISPLAY_NAME");
    v29 = v28;
    LOBYTE(v26) = v30;
    v32 = v31;
    v33 = sub_10000F234(0xD00000000000002CLL, (uint64_t)"PHOTOS_RELIVE_WIDGET_COLLECTIONS_DESCRIPTION");
    v35 = v34;
    v37 = v36;
    v39 = v38;
    v40 = objc_msgSend(v18, "mainBundle");
    sub_10001C69C();
    v44 = sub_10001C448(v27, v29, v26 & 1, v32, v41, v42, v43);
    v96 = v45;
    v97 = v44;
    v98 = v46;
    v47 = objc_msgSend(v18, "mainBundle", v76, v78);
    sub_10001C69C();
    LOWORD(v79) = 256;
    v51 = sub_10001C448(v33, v35, v37 & 1, v39, v48, v49, v50);
    v53 = v52;
    v55 = v54;
    v57 = v56 & 1;
    sub_10001C73C();
    sub_10000BDF4(&qword_100039058, type metadata accessor for PhotosReliveWidgetView);
    HIDWORD(v27) = v58;
    v77 = sub_10001AB54();
    AppIntentConfiguration.init<A>(kind:intent:provider:content:)(v80, v79);
    sub_10000E4AC(&qword_100038690, &qword_100038688);
    v60 = v59;
    sub_10001C498();
    WidgetConfiguration.supportedFamilies(_:)(v61, v62, v63);
    swift_bridgeObjectRelease(v77);
    sub_10001C34C(v81, *(uint64_t (**)(uint64_t, uint64_t))(v82 + 8));
    v99 = v83;
    v100 = v60;
    v64 = sub_10000E9A8((uint64_t)&v99, (uint64_t)&opaque type descriptor for <<opaque return type of WidgetConfiguration.supportedFamilies(_:)>>);
    WidgetConfiguration.configurationDisplayName(_:)(v97, v96, HIDWORD(v27), v98, v86, v64);
    sub_10001C33C(v84);
    v99 = v86;
    v100 = v64;
    v65 = sub_10000E9A8((uint64_t)&v99, (uint64_t)&opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>);
    WidgetConfiguration.description(_:)(v51, v53, v57, v55, v88, v65);
    sub_10001C34C(v85, *(uint64_t (**)(uint64_t, uint64_t))(v87 + 8));
    v99 = v88;
    v100 = v65;
    v66 = sub_10000E9A8((uint64_t)&v99, (uint64_t)&opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>);
    sub_10001C498();
    WidgetConfiguration._containerBackgroundRemovable(_:)(v67, v68, v69);
    sub_10001C33C(v89);
    v99 = v92;
    v100 = v66;
    v70 = sub_10000E9A8((uint64_t)&v99, (uint64_t)&unk_100030414);
    WidgetConfiguration.supportsAccentedContent()(v93, v70);
    sub_10001C34C(v90, *(uint64_t (**)(uint64_t, uint64_t))(v91 + 8));
    v99 = v93;
    v100 = v70;
    v71 = sub_10000E9A8((uint64_t)&v99, (uint64_t)&opaque type descriptor for <<opaque return type of WidgetConfiguration.supportsAccentedContent()>>);
    WidgetConfiguration.promptsForUserConfiguration()(v95, v71);
    sub_10001C594(v51);
    swift_bridgeObjectRelease(v55);
    sub_10001B9B8(v97, v96, SBYTE4(v27), (uint64_t (*)(void))&_swift_release);
    swift_bridgeObjectRelease(v98);
    sub_10001C33C(v94);
    sub_10000E8C0();
  }
  else
  {
    __break(1u);
  }
}

void *sub_1000194C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *result;

  v3 = *(void **)a1;
  v4 = *(unsigned __int8 *)(a1 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  v6 = sub_10001C73C();
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  v7 = (_QWORD *)(a2 + *(int *)(v6 + 28));
  *v7 = swift_getKeyPath(&unk_10002A220);
  v8 = sub_10000B8A0(&qword_100038640);
  swift_storeEnumTagMultiPayload(v7, v8, 0);
  v9 = *(void **)a2;
  v10 = *(_QWORD *)(a2 + 8);
  v11 = *(_QWORD *)(a2 + 16);
  swift_retain_n(v5, 2);
  v12 = v3;
  result = sub_10001BF28(v9, v10, v11);
  *(_QWORD *)a2 = v3;
  *(_QWORD *)(a2 + 8) = v4;
  *(_QWORD *)(a2 + 16) = v5;
  *(_QWORD *)(a2 + 24) = v5;
  *(_BYTE *)(a2 + 32) = v4;
  return result;
}

uint64_t PhotosReliveWidgetBundle.body.getter()
{
  uint64_t v0;

  v0 = sub_10000B8A0(&qword_100039080);
  return TupleWidget.init(_:)(v0, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_10001AB90();
  static WidgetBundle.main()();
  return 0;
}

id sub_1000195E8(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  NSString v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v12;

  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v12 = 0;
  v7 = objc_msgSend(v3, "initWithBundleIdentifier:allowPlaceholder:error:", v6, a3 & 1, &v12);

  v8 = v12;
  if (v7)
  {
    v9 = v12;
  }
  else
  {
    v10 = v12;
    _convertNSErrorToError(_:)(v8);

    swift_willThrow();
  }
  return v7;
}

char *sub_1000196C0(char *__src, uint64_t a2, char *__dst)
{
  char v4;

  if (a2 < 0)
  {
    v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v4, 1046, 0);
    __break(1u);
  }
  else if (__dst != __src || &__src[24 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 24 * a2);
  }
  return __src;
}

char *sub_10001974C(char *__src, uint64_t a2, char *__dst)
{
  char v4;

  if (a2 < 0)
  {
    v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v4, 1046, 0);
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_1000197D0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_1000197E8(a1, a2, a3, &qword_1000392C8);
}

uint64_t sub_1000197DC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_1000197E8(a1, a2, a3, &qword_1000392C0);
}

uint64_t sub_1000197E8(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;

  if (a2 < 0)
  {
    sub_10001C3C8();
    result = sub_10001C708((uint64_t)"Fatal error", 11, 2, (uint64_t)"UnsafeMutablePointer.moveInitialize with negative count", 55, v11, (uint64_t)"Swift/UnsafePointer.swift", v12, v13, v14, v15);
    __break(1u);
  }
  else if (a3 < a1 || (result = sub_10000B8A0(a4), a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    sub_10000B8A0(a4);
    v10 = sub_10001C6A8();
    return swift_arrayInitWithTakeFrontToBack(v10);
  }
  else if (a3 != a1)
  {
    v9 = sub_10001C6A8();
    return swift_arrayInitWithTakeBackToFront(v9);
  }
  return result;
}

char *sub_1000198BC(char *__src, uint64_t a2, char *__dst)
{
  char v4;

  if (a2 < 0)
  {
    v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v4, 1046, 0);
    __break(1u);
  }
  else if (__dst != __src || &__src[40 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 40 * a2);
  }
  return __src;
}

uint64_t sub_100019948(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
  }
  else
  {
    if (a3 + 24 * a2 <= a1 || a1 + 24 * a2 <= a3)
      return swift_arrayInitWithCopy(a3, a1);
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  }
  __break(1u);
  return result;
}

uint64_t sub_100019A18(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
  }
  else
  {
    if (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3)
      return swift_arrayInitWithCopy(a3, a1);
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  }
  __break(1u);
  return result;
}

uint64_t sub_100019AE4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  int v18;

  if (a2 < 0)
  {
    sub_10001C3C8();
    v14 = "UnsafeMutablePointer.initialize with negative count";
    v15 = 51;
  }
  else
  {
    v5 = *(_QWORD *)(*(_QWORD *)(sub_10000B8A0(&qword_1000392C0) - 8) + 72) * a2;
    v6 = a3 + v5;
    v7 = a1 + v5;
    if (v6 <= a1 || v7 <= a3)
    {
      sub_10001C498();
      return swift_arrayInitWithCopy(v9, v10);
    }
    sub_10001C3C8();
    v14 = "UnsafeMutablePointer.initialize overlapping range";
    v15 = 49;
  }
  result = sub_10001C708((uint64_t)"Fatal error", 11, 2, (uint64_t)v14, v15, v12, (uint64_t)"Swift/UnsafePointer.swift", v13, v16, v17, v18);
  __break(1u);
  return result;
}

uint64_t sub_100019BB8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a2 < 0)
  {
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
  }
  else
  {
    if (a3 + 40 * a2 <= a1 || a1 + 40 * a2 <= a3)
      return swift_arrayInitWithCopy(a3, a1);
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  }
  __break(1u);
  return result;
}

uint64_t sub_100019C88(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  _QWORD *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  void *ObjectType;

  v6 = sub_100019D58(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_10001C0B4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_10001C0B4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10001C094(v12);
  return v7;
}

_QWORD *sub_100019D58(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  _QWORD *result;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_100019EAC((char *)__src, HIBYTE(a6) & 0xF, __dst);
      UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_100019F70(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = _StringObject.sharedUTF8.getter(a5, a6);
    if (!v8)
    {
      result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return (_QWORD *)swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL, __dst);
}

void *sub_100019EAC(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) != 0)
  {
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory with negative count", 60, 2, "Swift/UnsafeRawPointer.swift", 28, 2, 1170, 0);
  }
  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst)
      return memcpy(__dst, __src, __n);
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, 2, 1173, 0);
  }
  __break(1u);
  return result;
}

_QWORD *sub_100019F70(uint64_t a1, unint64_t a2)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_10001A004(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_10001A1D8(0, v2[2] + 1, 1, (uint64_t)v2);
  v4 = v2[2];
  v3 = v2[3];
  if (v4 >= v3 >> 1)
    v2 = sub_10001A1D8((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  v2[2] = v4 + 1;
  *((_BYTE *)v2 + v4 + 32) = 0;
  return v2;
}

_QWORD *sub_10001A004(uint64_t a1, unint64_t a2)
{
  Swift::Int v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v4 = String.UTF8View._foreignCount()();
    if (v4)
      goto LABEL_6;
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v4)
    return &_swiftEmptyArrayStorage;
LABEL_6:
  v5 = sub_10001A174(v4, 0);
  if (v4 < 0)
  {
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, 2, 71, 0);
    __break(1u);
    goto LABEL_14;
  }
  v6 = v5;
  v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
  if ((v8 & 1) != 0)
  {
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    goto LABEL_15;
  }
  if (v7 == v4)
    return v6;
  result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, 2, 1122, 0);
LABEL_15:
  __break(1u);
  return result;
}

_QWORD *sub_10001A174(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = sub_10000B8A0(&qword_100039320);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

char *sub_10001A1D8(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_10000B8A0(&qword_100039320);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_10001A370(v14, v8, v13);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_10001A2AC(v14, v8, v13);
  }
  swift_bridgeObjectRelease(a4);
  return v11;
}

void *sub_10001A2AC(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) != 0)
  {
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
  }
  else
  {
    if (&__dst[__n] <= __src || &__src[__n] <= __dst)
      return memcpy(__dst, __src, __n);
    result = (void *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  }
  __break(1u);
  return result;
}

char *sub_10001A370(char *__src, size_t __len, char *__dst)
{
  char v4;

  if ((__len & 0x8000000000000000) != 0)
  {
    v4 = 2;
    __src = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.moveInitialize with negative count", 55, 2, "Swift/UnsafePointer.swift", 25, v4, 1046, 0);
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t type metadata accessor for PhotosReliveWidgetSize(uint64_t a1)
{
  return sub_10000CE64(a1, qword_1000391A0, (uint64_t)&nominal type descriptor for PhotosReliveWidgetSize);
}

uint64_t sub_10001A404(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000B8A0(&qword_100039038);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10001A44C()
{
  unint64_t result;

  result = qword_100039040;
  if (!qword_100039040)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for PhotosReliveWidgetEntry, &type metadata for PhotosReliveWidgetEntry);
    atomic_store(result, (unint64_t *)&qword_100039040);
  }
  return result;
}

char *sub_10001A488(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_10001A4F8(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

char *sub_10001A4A4(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_10001A5E0(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

char *sub_10001A4C0(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_10001A6C0(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

size_t sub_10001A4DC(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_10001A7A8(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

char *sub_10001A4F8(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_10000B8A0(&qword_100039220);
    v11 = (char *)swift_allocObject(v10, 24 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 24);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1000196C0(v14, v8, v13);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_100019948((unint64_t)v14, v8, (unint64_t)v13);
  }
  swift_release(a4);
  return v11;
}

char *sub_10001A5E0(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_10000B8A0(&qword_100039228);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 16);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_10001974C(v14, v8, v13);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_100019A18((unint64_t)v14, v8, (unint64_t)v13);
  }
  swift_release(a4);
  return v11;
}

char *sub_10001A6C0(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    v10 = sub_10000B8A0(&qword_1000392D0);
    v11 = (char *)swift_allocObject(v10, 40 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * ((uint64_t)(v12 - 32) / 40);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1000198BC(v14, v8, v13);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_100019BB8((unint64_t)v14, v8, (unint64_t)v13);
  }
  swift_release(a4);
  return v11;
}

size_t sub_10001A7A8(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_10000B8A0(&qword_1000392D8);
  v11 = *(_QWORD *)(sub_10000B8A0(&qword_1000392C0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  result = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v14 == 0x8000000000000000 && v12 == -1)
    goto LABEL_24;
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(result - v14) / v12);
LABEL_19:
  v17 = *(unsigned __int8 *)(*(_QWORD *)(sub_10000B8A0(&qword_1000392C0) - 8) + 80);
  v18 = (v17 + 32) & ~v17;
  v19 = (unint64_t)v15 + v18;
  v20 = a4 + v18;
  if ((v5 & 1) != 0)
  {
    sub_1000197E8(v20, v8, v19, &qword_1000392C0);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_100019AE4(v20, v8, v19);
  }
  swift_release(a4);
  return (size_t)v15;
}

void sub_10001A8FC(double a1, double a2)
{
  if ((~COERCE__INT64(a2 - a1) & 0x7FF0000000000000) != 0)
    sub_10001A978(0x20000000000001uLL);
  else
    __break(1u);
}

unint64_t sub_10001A978(unint64_t result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  if (result)
  {
    v1 = result;
    v3 = 0;
    swift_stdlib_random(&v3, 8);
    result = (v3 * (unsigned __int128)v1) >> 64;
    if (v3 * v1 < v1)
    {
      v2 = -(uint64_t)v1 % v1;
      if (v2 > v3 * v1)
      {
        do
        {
          v3 = 0;
          swift_stdlib_random(&v3, 8);
        }
        while (v2 > v3 * v1);
        return (v3 * (unsigned __int128)v1) >> 64;
      }
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_10001AA00(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4;
  id v5;

  v4 = String._bridgeToObjectiveC()();
  v5 = objc_msgSend(a3, "isValidCloudIdentifierStringValue:", v4);

  return v5;
}

id sub_10001AA44(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  NSString v7;
  id v8;

  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v8 = objc_msgSend(a4, "fallbackEntryForAlbumNotFoundWithLocalIdentifier:size:", v7, a3);

  return v8;
}

uint64_t sub_10001AAAC(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, "bundleIdentifier");

  if (!v2)
    return 0;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);

  return v3;
}

unint64_t sub_10001AB18()
{
  unint64_t result;

  result = qword_100039060;
  if (!qword_100039060)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for PhotosReliveWidgetEntryProvider, &type metadata for PhotosReliveWidgetEntryProvider);
    atomic_store(result, (unint64_t *)&qword_100039060);
  }
  return result;
}

unint64_t sub_10001AB54()
{
  unint64_t result;

  result = qword_100039078;
  if (!qword_100039078)
  {
    result = swift_getWitnessTable(&unk_10002A1A0, &unk_100035FD0);
    atomic_store(result, (unint64_t *)&qword_100039078);
  }
  return result;
}

unint64_t sub_10001AB90()
{
  unint64_t result;

  result = qword_100039088[0];
  if (!qword_100039088[0])
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for PhotosReliveWidgetBundle, &type metadata for PhotosReliveWidgetBundle);
    atomic_store(result, qword_100039088);
  }
  return result;
}

uint64_t sub_10001ABD0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &opaque type descriptor for <<opaque return type of PhotosReliveWidget.body>>, 1);
}

uint64_t sub_10001ABE0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &opaque type descriptor for <<opaque return type of PhotosReliveCollectionsWidget.body>>, 1);
}

uint64_t sub_10001ABF0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &opaque type descriptor for <<opaque return type of PhotosReliveWidgetBundle.body>>, 1);
}

uint64_t destroy for PhotosReliveWidgetEntry(uint64_t a1)
{

  return swift_release(*(_QWORD *)(a1 + 16));
}

void _s18PhotosReliveWidget23PhotosReliveWidgetEntryVwCP_0(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = v2;
  swift_retain(v3);
  sub_10000EACC();
}

uint64_t assignWithCopy for PhotosReliveWidgetEntry(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v7 = *(_QWORD *)(a1 + 16);
  v8 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v8;
  swift_retain(v8);
  swift_release(v7);
  return a1;
}

__n128 initializeWithTake for PhotosReliveWidgetEntry(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for PhotosReliveWidgetEntry(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release(v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotosReliveWidgetEntry(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PhotosReliveWidgetEntry(uint64_t result, int a2, int a3)
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

void type metadata accessor for PhotosReliveWidgetEntry()
{
  sub_10000F2E0();
}

void type metadata accessor for PhotosReliveWidgetEntryProvider()
{
  sub_10000F2E0();
}

void type metadata accessor for PhotosReliveWidget()
{
  sub_10000F2E0();
}

void type metadata accessor for PhotosReliveCollectionsWidget()
{
  sub_10000F2E0();
}

void type metadata accessor for PhotosReliveWidgetBundle()
{
  sub_10000F2E0();
}

uint64_t sub_10001ADE8()
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
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;

  v0 = sub_10000B978(&qword_100039048);
  v1 = sub_10000B978(&qword_100038648);
  v2 = sub_10000B978(&qword_100038650);
  v3 = sub_10000B978(&qword_100038658);
  v4 = sub_10000B978(&qword_100038660);
  sub_10000E4AC(&qword_100038668, &qword_100038660);
  v12 = sub_10000E908(v5, (uint64_t)&opaque type descriptor for <<opaque return type of WidgetConfiguration.supportedFamilies(_:)>>, v6, v7, v8, v9, v10, v11, v4);
  v19 = sub_10000E908(v12, (uint64_t)&opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, v13, v14, v15, v16, v17, v18, v3);
  v26 = sub_10000E908(v19, (uint64_t)&opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, v20, v21, v22, v23, v24, v25, v2);
  v40 = sub_10000E908(v26, (uint64_t)&unk_100030414, v27, v28, v29, v30, v31, v32, v1);
  return sub_10000E908(v40, (uint64_t)&opaque type descriptor for <<opaque return type of WidgetConfiguration.supportsAccentedContent()>>, v33, v34, v35, v36, v37, v38, v0);
}

uint64_t sub_10001AED4()
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
  uint64_t v48;

  v0 = sub_10000B978(&qword_100039070);
  v1 = sub_10000B978(&qword_100039068);
  v2 = sub_10000B978(&qword_100038670);
  v3 = sub_10000B978(&qword_100038678);
  v4 = sub_10000B978(&qword_100038680);
  v5 = sub_10000B978(&qword_100038688);
  sub_10000E4AC(&qword_100038690, &qword_100038688);
  v13 = sub_10000E908(v6, (uint64_t)&opaque type descriptor for <<opaque return type of WidgetConfiguration.supportedFamilies(_:)>>, v7, v8, v9, v10, v11, v12, v5);
  v20 = sub_10000E908(v13, (uint64_t)&opaque type descriptor for <<opaque return type of WidgetConfiguration.configurationDisplayName(_:)>>, v14, v15, v16, v17, v18, v19, v4);
  v27 = sub_10000E908(v20, (uint64_t)&opaque type descriptor for <<opaque return type of WidgetConfiguration.description(_:)>>, v21, v22, v23, v24, v25, v26, v3);
  v34 = sub_10000E908(v27, (uint64_t)&unk_100030414, v28, v29, v30, v31, v32, v33, v2);
  v48 = sub_10000E908(v34, (uint64_t)&opaque type descriptor for <<opaque return type of WidgetConfiguration.supportsAccentedContent()>>, v35, v36, v37, v38, v39, v40, v1);
  return sub_10000E908(v48, (uint64_t)&opaque type descriptor for <<opaque return type of WidgetConfiguration.promptsForUserConfiguration()>>, v41, v42, v43, v44, v45, v46, v0);
}

void sub_10001AFE8()
{
  sub_10000E4AC(&qword_1000390A0, &qword_1000390A8);
}

uint64_t sub_10001B014(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
    if (a2 + 3 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 3) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v5 = v6 - 4;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t sub_10001B09C(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_10001B0E8 + 4 * byte_100029DC5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_10001B11C + 4 * byte_100029DC0[v4]))();
}

uint64_t sub_10001B11C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001B124(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10001B12CLL);
  return result;
}

uint64_t sub_10001B138(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10001B140);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_10001B144(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001B14C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for PhotosReliveWidgetEntryRole()
{
  sub_10000F2E0();
}

void type metadata accessor for PhotosReliveWidgetCollectionsProvider()
{
  sub_10000F2E0();
}

uint64_t *sub_10001B170(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    swift_retain(v11);
  }
  else
  {
    v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    a1[2] = a2[2];
    v6 = *(int *)(a3 + 24);
    v7 = (char *)a1 + v6;
    v8 = (char *)a2 + v6;
    v9 = type metadata accessor for Date(0);
    v10 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16);
    swift_bridgeObjectRetain(v5);
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t sub_10001B214(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  v4 = a1 + *(int *)(a2 + 24);
  v5 = type metadata accessor for Date(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
}

_QWORD *sub_10001B25C(_QWORD *a1, _QWORD *a2, uint64_t a3)
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
  a1[2] = a2[2];
  v5 = *(int *)(a3 + 24);
  v6 = (char *)a1 + v5;
  v7 = (char *)a2 + v5;
  v8 = type metadata accessor for Date(0);
  v9 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16);
  swift_bridgeObjectRetain(v4);
  v9(v6, v7, v8);
  return a1;
}

_QWORD *sub_10001B2D4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  *a1 = *a2;
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[2] = a2[2];
  v8 = *(int *)(a3 + 24);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 24))(v9, v10, v11);
  return a1;
}

uint64_t sub_10001B358(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v4 = *(int *)(a3 + 24);
  v5 = a1 + v4;
  v6 = a2 + v4;
  v7 = type metadata accessor for Date(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *sub_10001B3BC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;

  v6 = a2[1];
  v7 = a1[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease(v7);
  a1[2] = a2[2];
  v8 = *(int *)(a3 + 24);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = type metadata accessor for Date(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 40))(v9, v10, v11);
  return a1;
}

uint64_t sub_10001B430(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001B43C);
}

uint64_t sub_10001B43C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 2147483646)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    v5 = v4 - 1;
    if (v5 < 0)
      v5 = -1;
    return (v5 + 1);
  }
  else
  {
    v9 = sub_10001C4DC();
    return sub_10000BA0C(a1 + *(int *)(a3 + 24), a2, v9);
  }
}

uint64_t sub_10001B4B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001B4C4);
}

uint64_t sub_10001B4C4(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 2147483646)
  {
    *(_QWORD *)(result + 8) = a2;
  }
  else
  {
    v7 = sub_10001C4DC();
    return sub_10000BA28(v5 + *(int *)(a4 + 24), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration(uint64_t a1)
{
  return sub_10000CE64(a1, qword_100039108, (uint64_t)&nominal type descriptor for PhotosReliveWidgetScheduledReloadConfiguration);
}

uint64_t sub_10001B540(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = &unk_10002A070;
  v4[1] = (char *)&value witness table for Builtin.Int64 + 64;
  result = type metadata accessor for Date(319);
  if (v3 <= 0x3F)
  {
    v4[2] = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t *sub_10001B5C0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v8);
  }
  else
  {
    v7 = type metadata accessor for WidgetFamily(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(_OWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t sub_10001B648(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for WidgetFamily(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_10001B67C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_10001B6D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;

  v6 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  return a1;
}

uint64_t sub_10001B744(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_10001B7A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = type metadata accessor for WidgetFamily(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_10001B7FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001B808);
}

uint64_t sub_10001B808(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000EF04();
  return sub_10000BA0C(a1, a2, v4);
}

uint64_t sub_10001B838(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10001B844);
}

uint64_t sub_10001B844(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000EF04();
  return sub_10000BA28(a1, a2, a2, v4);
}

uint64_t sub_10001B878(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  result = type metadata accessor for WidgetFamily(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = &unk_10002A0A8;
    swift_initStructMetadata(a1, 256, 2, v4, a1 + 16);
    return 0;
  }
  return result;
}

unint64_t sub_10001B8EC()
{
  unint64_t result;

  result = qword_1000391D8;
  if (!qword_1000391D8)
  {
    result = swift_getWitnessTable(&unk_10002A178, &unk_100035FB0);
    atomic_store(result, (unint64_t *)&qword_1000391D8);
  }
  return result;
}

unint64_t sub_10001B92C()
{
  unint64_t result;

  result = qword_1000391E0[0];
  if (!qword_1000391E0[0])
  {
    result = swift_getWitnessTable(&unk_10002A520, &type metadata for PhotosReliveWidgetConfiguration);
    atomic_store(result, qword_1000391E0);
  }
  return result;
}

uint64_t sub_10001B96C(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  BOOL v5;

  v3 = a3 - result;
  if (__OFSUB__(a3, result))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if (a2 < 1)
  {
    if (v3 <= 0 && v3 > a2)
      return 0;
  }
  else if ((v3 & 0x8000000000000000) == 0 && v3 < (unint64_t)a2)
  {
    return 0;
  }
  v5 = __OFADD__(result, a2);
  result += a2;
  if (v5)
    goto LABEL_14;
  return result;
}

uint64_t sub_10001B9B8(uint64_t a1, uint64_t a2, char a3, uint64_t (*a4)(void))
{
  if ((a3 & 1) != 0)
    return a4();
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_10001B9C8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_errorRetain();
  else
    return swift_bridgeObjectRetain(a2);
}

uint64_t sub_10001B9D8(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  uint64_t i;

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
  v2 = 64;
  for (i = 10; i - 8 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    v1 = *(_QWORD *)(a1 + 8 * i);
    v2 += 64;
    if (v1)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

_QWORD *sub_10001BA58(_QWORD *result, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  id v10;

  if (a2 < 0 || 1 << *(_BYTE *)(a5 + 32) <= a2)
  {
    __break(1u);
    goto LABEL_7;
  }
  if (((*(_QWORD *)(a5 + (((unint64_t)a2 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a2) & 1) == 0)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  if (*(_DWORD *)(a5 + 36) == a3)
  {
    v5 = *(void **)(*(_QWORD *)(a5 + 48) + 8 * a2);
    v6 = *(_QWORD *)(a5 + 56) + 24 * a2;
    v7 = *(_QWORD *)v6;
    v8 = *(_QWORD *)(v6 + 8);
    v9 = *(_BYTE *)(v6 + 16);
    *result = *(_QWORD *)v6;
    result[1] = v8;
    *((_BYTE *)result + 16) = v9;
    v10 = v5;
    sub_10001B9C8(v7, v8, v9);
    return v10;
  }
LABEL_8:
  __break(1u);
  return result;
}

#error "10001BB34: call analysis failed (funcsize=14)"

uint64_t sub_10001BB44(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_10001BB7C()
{
  return sub_10001BC58();
}

uint64_t sub_10001BB88()
{
  return sub_10001BD38(&qword_100039250, &unk_100036040, sub_10001BBD0, sub_1000154C0);
}

uint64_t sub_10001BBAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001BBBC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10001BBC4()
{
  return sub_10001BDE4(&qword_100039250);
}

uint64_t sub_10001BBD0(uint64_t a1)
{
  sub_10000B8A0(&qword_100039250);
  sub_10001C674();
  return sub_100015430(a1);
}

#error "10001BC3C: call analysis failed (funcsize=14)"

uint64_t sub_10001BC4C()
{
  return sub_10001BC58();
}

uint64_t sub_10001BC58()
{
  _QWORD *v0;
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_10000F0E4();
  v2 = v1;
  v3 = *(_QWORD *)(sub_10001C4E4() - 8);
  v4 = *(unsigned __int8 *)(v3 + 80);
  v5 = (v4 + 40) & ~v4;
  v6 = *(_QWORD *)(v3 + 64);
  v7 = *(_QWORD *)(sub_10000B8A0(v2) - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = (v5 + v6 + v8) & ~v8;
  v10 = v9 + *(_QWORD *)(v7 + 64);
  v11 = v4 | v8 | 7;
  swift_release(v0[2]);
  swift_release(v0[3]);
  swift_release(v0[4]);
  sub_10001C34C((uint64_t)v0 + v5, *(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  sub_10000EAF0((uint64_t)v0 + v9, *(uint64_t (**)(uint64_t, uint64_t))(v7 + 8));
  return swift_deallocObject(v0, v10, v11);
}

uint64_t sub_10001BD14()
{
  return sub_10001BD38(&qword_100039280, &unk_1000360B8, sub_10001BE40, sub_100014B60);
}

#error "10001BDB8: call analysis failed (funcsize=40)"

uint64_t sub_10001BDD8()
{
  return sub_10001BDE4(&qword_100039280);
}

uint64_t sub_10001BDE4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = sub_10000B8A0(a1);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(unsigned __int8 *)(v3 + 80);
  v5 = (v4 + 16) & ~v4;
  v6 = v5 + *(_QWORD *)(v3 + 64);
  v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);
  return swift_deallocObject(v1, v6, v7);
}

uint64_t sub_10001BE40(void *a1, char a2, uint64_t a3)
{
  sub_10000B8A0(&qword_100039280);
  sub_10001C674();
  return sub_100014598(a1, a2, a3);
}

_QWORD *sub_10001BE8C(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10001BEB0()
{
  unint64_t result;

  result = qword_100039290;
  if (!qword_100039290)
  {
    result = swift_getWitnessTable(&unk_10002A310, &type metadata for PhotosReliveWidgetScheduledReloadConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100039290);
  }
  return result;
}

void sub_10001BEEC(uint64_t a1, uint64_t a2, void (*a3)(_QWORD))
{
  void (*v5)(uint64_t, uint64_t);

  a3(0);
  sub_10001C534();
  v5(a2, a1);
  sub_10000EACC();
}

void *sub_10001BF28(void *result, uint64_t a2, uint64_t a3)
{
  if (result)
  {

    return (void *)swift_release(a3);
  }
  return result;
}

uint64_t sub_10001BF54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_10001BF98()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000392E8;
  if (!qword_1000392E8)
  {
    v1 = sub_10000B978(&qword_100039038);
    sub_10000BDF4(&qword_1000392F0, type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> A?, v1);
    atomic_store(result, (unint64_t *)&qword_1000392E8);
  }
  return result;
}

uint64_t sub_10001C014(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

unint64_t sub_10001C058()
{
  unint64_t result;

  result = qword_100039318;
  if (!qword_100039318)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100039318);
  }
  return result;
}

uint64_t sub_10001C094(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10001C0B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_10001C0F0(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  sub_100016B84(a1, *(_QWORD *)(v2 + 16), *(void **)(v2 + 24), a2);
}

uint64_t storeEnumTagSinglePayload for PhotosReliveWidgetScheduledReloadConfiguration.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10001C158 + 4 * byte_100029DCF[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_10001C18C + 4 * byte_100029DCA[v4]))();
}

uint64_t sub_10001C18C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001C194(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10001C19CLL);
  return result;
}

uint64_t sub_10001C1A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10001C1B0);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_10001C1B4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001C1BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PhotosReliveWidgetScheduledReloadConfiguration.CodingKeys()
{
  return &type metadata for PhotosReliveWidgetScheduledReloadConfiguration.CodingKeys;
}

unint64_t sub_10001C1DC()
{
  unint64_t result;

  result = qword_100039330;
  if (!qword_100039330)
  {
    result = swift_getWitnessTable(&unk_10002A2E8, &type metadata for PhotosReliveWidgetScheduledReloadConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100039330);
  }
  return result;
}

unint64_t sub_10001C21C()
{
  unint64_t result;

  result = qword_100039338;
  if (!qword_100039338)
  {
    result = swift_getWitnessTable(&unk_10002A258, &type metadata for PhotosReliveWidgetScheduledReloadConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100039338);
  }
  return result;
}

unint64_t sub_10001C25C()
{
  unint64_t result;

  result = qword_100039340;
  if (!qword_100039340)
  {
    result = swift_getWitnessTable(&unk_10002A280, &type metadata for PhotosReliveWidgetScheduledReloadConfiguration.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100039340);
  }
  return result;
}

void sub_10001C2A0(void **a1@<X0>, uint64_t a2@<X8>)
{
  sub_10001C0F0(a1, a2);
}

uint64_t sub_10001C2C8(uint64_t a1)
{
  return swift_slowAlloc(a1, -1);
}

uint64_t sub_10001C2D0()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t sub_10001C2E0()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

void sub_10001C2E8(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 208) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_10001C304(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 - 96) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(v3 - 96, v3 - 88, v2, v1);
}

uint64_t sub_10001C320(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 128) = v1;
  return swift_retain(*(_QWORD *)(a1 + 48));
}

uint64_t sub_10001C33C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 8))(v2, v1);
}

uint64_t sub_10001C34C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_10001C354()
{
  return TimelineProviderContext.family.getter();
}

uint64_t sub_10001C370()
{
  return type metadata accessor for TimelineProviderContext(0);
}

uint64_t sub_10001C38C(uint64_t a1)
{
  return swift_task_switch(a1, 0, 0);
}

uint64_t sub_10001C398(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v5 - 96) = a1;
  return UnsafeMutableRawBufferPointer.copyMemory(from:)(v5 - 96, v5 - 88, v4, a4);
}

uint64_t sub_10001C3B0()
{
  uint64_t v0;

  return swift_release(v0);
}

void sub_10001C3DC()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

void sub_10001C3FC(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 208) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_10001C41C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_10001C428()
{
  return ((uint64_t (*)(void))withCheckedContinuation<A>(isolation:function:_:))();
}

uint64_t sub_10001C434(uint64_t a1)
{
  return swift_arrayDestroy(a1, 1);
}

uint64_t sub_10001C43C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_100019C88(a1, a2, (uint64_t *)(v2 - 128));
}

uint64_t sub_10001C448(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;

  return Text.init(_:tableName:bundle:comment:)(a1, a2, a3, a4, 0xD000000000000012, v7, a7, 0);
}

uint64_t sub_10001C45C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;

  return Text.init(_:tableName:bundle:comment:)(a1, a2, a3, a4, 0xD000000000000012, v7, a7, 0);
}

void sub_10001C470(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  uint8_t *v4;
  NSObject *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v5, v6, a4, v4, 0xCu);
}

uint64_t sub_10001C484()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 192) + 8))(v0, v1);
}

void sub_10001C4A4(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 256) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

void sub_10001C4C0(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 176) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_10001C4DC()
{
  return type metadata accessor for Date(0);
}

uint64_t sub_10001C4E4()
{
  return type metadata accessor for TimelineProviderContext(0);
}

uint64_t sub_10001C4EC@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, _QWORD)@<X8>)
{
  uint64_t v2;

  return a2(a1, *(_QWORD *)(v2 - 104));
}

uint64_t sub_10001C504@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_10001C50C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;

  return sub_100019C88(v0, v1, (uint64_t *)(v2 - 88));
}

id sub_10001C51C(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t sub_10001C524(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

void sub_10001C52C()
{
  uint64_t v0;

}

uint64_t sub_10001C544(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  return UnsafeMutableRawBufferPointer.copyMemory(from:)(v6 - 136, v5, v4, a4);
}

id sub_10001C554(float a1)
{
  float *v1;
  void *v2;

  *v1 = a1;
  return v2;
}

BOOL sub_10001C564(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

id sub_10001C574(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

void sub_10001C57C()
{
  PhotosReliveWidgetEntry.description.getter();
}

uint64_t sub_10001C58C(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

uint64_t sub_10001C594(uint64_t a1)
{
  uint64_t (*v1)(void);
  uint64_t v2;
  char v3;

  return sub_10001B9B8(a1, v2, v3, v1);
}

void sub_10001C5A4()
{
  uint64_t v0;
  void *v1;
  Swift::String v2;

  v2._countAndFlagsBits = v0;
  v2._object = v1;
  String.append(_:)(v2);
}

uint64_t sub_10001C5F4()
{
  uint64_t v0;

  return swift_retain_n(v0, 2);
}

void sub_10001C604()
{
  uint64_t (*v0)(_QWORD);
  uint64_t v1;

  sub_100010EDC(v1, v0);
}

uint64_t sub_10001C63C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_10000BA28(a1, a2, 1, v2);
}

uint64_t sub_10001C648(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_10000BA28(a1, a2, 1, v2);
}

uint64_t sub_10001C654()
{
  uint64_t v0;

  return v0 - 96;
}

uint64_t sub_10001C668(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_100019C88(a1, a2, (uint64_t *)(v2 - 88));
}

uint64_t sub_10001C688(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t sub_10001C690()
{
  uint64_t v0;

  return swift_release_n(v0, 2);
}

uint64_t sub_10001C6A8()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_10001C6BC@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, _QWORD)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v2, *(_QWORD *)(v3 - 104));
}

uint64_t sub_10001C6C8()
{
  uint64_t v0;

  return v0;
}

void sub_10001C6E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v10 - 152) = (char *)&a9 - v9;
}

void sub_10001C6FC()
{
  void *v0;

}

uint64_t sub_10001C708(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, int a11)
{
  return _fatalErrorMessage(_:_:file:line:flags:)(a1, a2, a3, a4, a5, 2, a7, 25, a9, a10, a11);
}

uint64_t sub_10001C714()
{
  uint64_t v0;

  return swift_errorRelease(v0);
}

uint64_t sub_10001C71C()
{
  uint64_t v0;

  return swift_errorRetain(v0);
}

void sub_10001C724(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v2;

  v2 = (a2 - 32) | 0x8000000000000000;
  String.append(_:)(*(Swift::String *)&a1);
}

uint64_t sub_10001C730()
{
  uint64_t v0;

  return swift_retain(v0);
}

uint64_t sub_10001C73C()
{
  return type metadata accessor for PhotosReliveWidgetView(0);
}

uint64_t sub_10001C744()
{
  return type metadata accessor for PhotosReliveWidgetSize(0);
}

uint64_t sub_10001C74C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return dispatch thunk of CustomStringConvertible.description.getter(v2, a2);
}

uint64_t sub_10001C758()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t initializeBufferWithCopyOfBuffer for ScaleTextToFitWithLineHeight(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for ScaleTextToFitWithLineHeight(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 48));
}

uint64_t initializeWithCopy for ScaleTextToFitWithLineHeight(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v3 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v3;
  swift_retain(v3);
  return a1;
}

uint64_t assignWithCopy for ScaleTextToFitWithLineHeight(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  v3 = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v6;
  swift_retain(v6);
  swift_release(v5);
  return a1;
}

__n128 initializeWithTake for ScaleTextToFitWithLineHeight(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for ScaleTextToFitWithLineHeight(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_release(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for ScaleTextToFitWithLineHeight(uint64_t a1, unsigned int a2)
{
  int v2;
  unint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 56))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *(_QWORD *)(a1 + 48);
      if (v3 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ScaleTextToFitWithLineHeight(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 56) = 0;
    if (a2)
      *(_QWORD *)(result + 48) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ScaleTextToFitWithLineHeight()
{
  return &type metadata for ScaleTextToFitWithLineHeight;
}

uint64_t sub_10001C98C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100030B1C, 1);
}

void sub_10001C99C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
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
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t KeyPath;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  unint64_t v58;
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
  __int128 v69;
  _QWORD *v70;
  uint64_t v71;
  void (*v72)(uint64_t@<X8>);
  void (*v73)(uint64_t@<X8>);
  uint64_t v74;
  void (**v75)(uint64_t@<X8>);
  uint64_t v76;
  uint64_t v77;
  void (**v78)(double *);
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  _QWORD v89[5];
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  __int128 v105;
  uint64_t v106;
  double v107;
  char v108;
  __int128 v109;
  uint64_t v110;

  v3 = v2;
  v103 = a2;
  v101 = sub_10000B8A0(&qword_100039358);
  sub_10000E858();
  __chkstk_darwin(v5, v6);
  sub_10000E874();
  v102 = v7;
  v92 = sub_10000B8A0(&qword_100039360);
  sub_10000E858();
  __chkstk_darwin(v8, v9);
  sub_10000E874();
  v90 = v10;
  v96 = sub_10000B8A0(&qword_100039368);
  v94 = *(_QWORD *)(v96 - 8);
  __chkstk_darwin(v96, v11);
  sub_10000E874();
  v93 = v12;
  v89[2] = sub_10000B8A0(&qword_100039370);
  sub_10000E858();
  __chkstk_darwin(v13, v14);
  sub_10000E874();
  v91 = v15;
  v89[4] = sub_10000B8A0(&qword_100039378);
  sub_10000E858();
  __chkstk_darwin(v16, v17);
  sub_10000E874();
  v99 = v18;
  v97 = sub_10000B8A0(&qword_100039380);
  sub_10000E858();
  __chkstk_darwin(v19, v20);
  sub_10000E874();
  v98 = v21;
  sub_10000B8A0(&qword_100039388);
  sub_10000E858();
  __chkstk_darwin(v22, v23);
  sub_10000E874();
  v100 = v24;
  v25 = sub_10000B8A0(&qword_100039390);
  v26 = *(_QWORD *)(v25 - 8);
  __chkstk_darwin(v25, v27);
  v29 = (char *)v89 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = sub_10000B8A0(&qword_100039398);
  sub_10000E858();
  __chkstk_darwin(v31, v32);
  v34 = (char *)v89 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89[1] = sub_10000B8A0(&qword_1000393A0);
  sub_10000E858();
  __chkstk_darwin(v35, v36);
  sub_10000E874();
  v104 = v37;
  v89[3] = sub_10000B8A0(&qword_1000393A8);
  sub_10000E858();
  __chkstk_darwin(v38, v39);
  sub_10000E874();
  v95 = v40;
  v109 = *(_OWORD *)(v2 + 32);
  v110 = *(_QWORD *)(v2 + 48);
  v105 = *(_OWORD *)(v2 + 32);
  v106 = *(_QWORD *)(v2 + 48);
  v41 = sub_10000B8A0(&qword_1000393B0);
  State.wrappedValue.getter(&v107, v41);
  v42 = 1.0;
  if ((v108 & 1) == 0)
    v42 = *(double *)v2 / v107;
  v43 = sub_10000B8A0(&qword_1000393B8);
  sub_10001D524(&qword_1000393C0, &qword_1000393B8, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
  View.lineHeightMultiple(_:)(v43, v44, v42);
  v45 = *(_QWORD *)(v2 + 8);
  KeyPath = swift_getKeyPath(&unk_10002A440);
  (*(void (**)(char *, char *, uint64_t))(v26 + 16))(v34, v29, v25);
  v47 = (uint64_t *)&v34[*(int *)(v30 + 36)];
  *v47 = KeyPath;
  v47[1] = v45;
  (*(void (**)(char *, uint64_t))(v26 + 8))(v29, v25);
  v48 = *(_QWORD *)(v2 + 16);
  v49 = *(_BYTE *)(v2 + 24);
  v50 = swift_getKeyPath(&unk_10002A470);
  v51 = v104;
  sub_10001D2D8((uint64_t)v34, v104, &qword_100039398);
  sub_10001D570();
  v53 = v51 + v52;
  *(_QWORD *)v53 = v50;
  *(_QWORD *)(v53 + 8) = v48;
  *(_BYTE *)(v53 + 16) = v49;
  sub_10001D304((uint64_t)v34, &qword_100039398);
  v54 = swift_getKeyPath(&unk_10002A440);
  v55 = v90;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 16))(v90, a1, v43);
  v56 = v92;
  v57 = (uint64_t *)(v55 + *(int *)(v92 + 36));
  *v57 = v54;
  v57[1] = 0x3FF0000000000000;
  v58 = sub_10001D1A4();
  v59 = v93;
  View.lineHeightMultiple(_:)(v56, v58, 1.0);
  sub_10001D304(v55, &qword_100039360);
  v60 = swift_getKeyPath(&unk_10002A470);
  v61 = v94;
  v62 = v91;
  v63 = v96;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v94 + 16))(v91, v59, v96);
  sub_10001D570();
  v65 = v62 + v64;
  *(_QWORD *)v65 = v60;
  *(_QWORD *)(v65 + 8) = 1;
  *(_BYTE *)(v65 + 16) = 0;
  (*(void (**)(uint64_t, uint64_t))(v61 + 8))(v59, v63);
  v66 = v99;
  sub_10001D568(v62, v99);
  sub_10001D570();
  *(_WORD *)(v66 + v67) = 256;
  sub_10001D560(v62);
  v68 = swift_allocObject(&unk_1000363C8, 72, 7);
  v69 = *(_OWORD *)(v3 + 16);
  *(_OWORD *)(v68 + 16) = *(_OWORD *)v3;
  *(_OWORD *)(v68 + 32) = v69;
  *(_OWORD *)(v68 + 48) = *(_OWORD *)(v3 + 32);
  *(_QWORD *)(v68 + 64) = *(_QWORD *)(v3 + 48);
  sub_10000D180((uint64_t)&v110, (uint64_t)&v105, &qword_1000393E0);
  v70 = sub_10001D26C(&v105);
  v71 = static Alignment.center.getter(v70);
  v73 = v72;
  v74 = v102;
  sub_10001D2D8(v66, v102, &qword_100039378);
  v75 = (void (**)(uint64_t@<X8>))(v74 + *(int *)(v101 + 36));
  *v75 = sub_10001D11C;
  v75[1] = 0;
  v75[2] = (void (*)(uint64_t@<X8>))v71;
  v75[3] = v73;
  v76 = swift_allocObject(&unk_1000363F0, 32, 7);
  *(_QWORD *)(v76 + 16) = sub_10001D264;
  *(_QWORD *)(v76 + 24) = v68;
  v77 = v98;
  sub_10001D568(v74, v98);
  v78 = (void (**)(double *))(v77 + *(int *)(v97 + 36));
  *v78 = sub_10001D2B8;
  v78[1] = (void (*)(double *))v76;
  sub_10001D560(v74);
  sub_10001D304(v66, &qword_100039378);
  v79 = v100;
  sub_10001D568(v77, v100);
  sub_10001D560(v77);
  v81 = static Alignment.center.getter(v80);
  v83 = v82;
  sub_10001D570();
  v84 = v95;
  v86 = v95 + v85;
  sub_10001D2D8(v79, v95 + v85, &qword_100039388);
  v87 = (uint64_t *)(v86 + *(int *)(sub_10000B8A0(&qword_1000393E8) + 36));
  *v87 = v81;
  v87[1] = v83;
  v88 = v104;
  sub_10001D568(v104, v84);
  sub_10001D304(v79, &qword_100039388);
  sub_10001D560(v88);
  sub_10000D180(v84, v103, &qword_1000393A8);
}

uint64_t sub_10001CFFC(uint64_t a1, double a2, double a3)
{
  uint64_t v3;
  double v5;
  char v6;
  __int128 v7;
  uint64_t v8;

  v7 = *(_OWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  v5 = a3;
  v6 = 0;
  v3 = sub_10000B8A0(&qword_1000393B0);
  return State.wrappedValue.setter(&v5, v3);
}

void sub_10001D054()
{
  qword_100039348 = 0;
  unk_100039350 = 0;
}

uint64_t *sub_10001D064()
{
  if (qword_100038600 != -1)
    swift_once(&qword_100038600, sub_10001D054);
  return &qword_100039348;
}

double sub_10001D0A4(_OWORD *a1, void (*a2)(__int128 *__return_ptr))
{
  double result;
  __int128 v4;

  a2(&v4);
  result = *(double *)&v4;
  *a1 = v4;
  return result;
}

uint64_t sub_10001D0DC()
{
  return 1;
}

__n128 sub_10001D0E4@<Q0>(__n128 *a1@<X8>)
{
  __n128 *v2;
  __n128 result;

  v2 = (__n128 *)sub_10001D064();
  result = *v2;
  *a1 = *v2;
  return result;
}

void sub_10001D11C(uint64_t a1@<X8>)
{
  uint64_t v2;
  double v3;
  uint64_t v4;

  v2 = static Color.clear.getter();
  v3 = GeometryProxy.size.getter();
  *(_QWORD *)a1 = v2;
  *(double *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v4;
}

void sub_10001D158(double *a1@<X8>)
{
  *a1 = EnvironmentValues.minimumScaleFactor.getter();
  sub_10000EACC();
}

void sub_10001D17C(double *a1)
{
  EnvironmentValues.minimumScaleFactor.setter(*a1);
  sub_10000EACC();
}

unint64_t sub_10001D1A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000393C8;
  if (!qword_1000393C8)
  {
    v1 = sub_10000B978(&qword_100039360);
    sub_10001D524(&qword_1000393C0, &qword_1000393B8, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    sub_10001D524(&qword_1000393D0, &qword_1000393D8, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000393C8);
  }
  return result;
}

uint64_t sub_10001D240()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 64));
  return swift_deallocObject(v0, 72, 7);
}

uint64_t sub_10001D264(double a1, double a2)
{
  uint64_t v2;

  return sub_10001CFFC(v2 + 16, a1, a2);
}

_QWORD *sub_10001D26C(_QWORD *a1)
{
  swift_retain(*a1);
  return a1;
}

uint64_t sub_10001D294()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_10001D2B8(double *a1)
{
  uint64_t v1;

  (*(void (**)(double, double))(v1 + 16))(*a1, a1[1]);
  sub_10000EACC();
}

void sub_10001D2D8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = sub_10000EF54(a1, a2, a3);
  sub_10000EAD4(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  sub_10000EACC();
}

void sub_10001D304(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_10000B8A0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  sub_10000EACC();
}

ValueMetadata *type metadata accessor for ViewSizingKey()
{
  return &type metadata for ViewSizingKey;
}

unint64_t sub_10001D350()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000393F0;
  if (!qword_1000393F0)
  {
    v1 = sub_10000B978(&qword_1000393A8);
    sub_10001D3D4();
    sub_10001D524(&qword_100039408, &qword_1000393E8, (uint64_t)&protocol conformance descriptor for _OverlayModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000393F0);
  }
  return result;
}

unint64_t sub_10001D3D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000393F8;
  if (!qword_1000393F8)
  {
    v1 = sub_10000B978(&qword_1000393A0);
    sub_10001D458();
    sub_10001D524(&qword_100038A28, &qword_100038A30, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000393F8);
  }
  return result;
}

unint64_t sub_10001D458()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_100039400;
  if (!qword_100039400)
  {
    v1 = sub_10000B978(&qword_100039398);
    v2 = sub_10000B978(&qword_1000393B8);
    sub_10001D524(&qword_1000393C0, &qword_1000393B8, (uint64_t)&protocol conformance descriptor for _ViewModifier_Content<A>);
    v4[0] = v2;
    v4[1] = v3;
    swift_getOpaqueTypeConformance2(v4, &opaque type descriptor for <<opaque return type of View.lineHeightMultiple(_:)>>, 1);
    sub_10001D524(&qword_1000393D0, &qword_1000393D8, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100039400);
  }
  return result;
}

void sub_10001D524(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = sub_10000B978(a2);
    atomic_store(swift_getWitnessTable(a3, v5), a1);
  }
  sub_10000EACC();
}

void sub_10001D560(uint64_t a1)
{
  uint64_t *v1;

  sub_10001D304(a1, v1);
}

void sub_10001D568(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_10001D2D8(a1, a2, v2);
}

unint64_t sub_10001D580()
{
  unint64_t result;

  result = qword_100039410;
  if (!qword_100039410)
  {
    result = swift_getWitnessTable(&unk_10002A580, &type metadata for PhotosReliveWidgetConfiguration);
    atomic_store(result, (unint64_t *)&qword_100039410);
  }
  return result;
}

uint64_t sub_10001D5BC()
{
  uint64_t v0;

  v0 = type metadata accessor for LocalizedStringResource(0);
  sub_10000CE10(v0, qword_10003C690);
  sub_10000CDF8(v0, (uint64_t)qword_10003C690);
  return LocalizedStringResource.init(stringLiteral:)(0xD000000000000022, 0x800000010002BCF0);
}

uint64_t sub_10001D61C()
{
  uint64_t v0;

  if (qword_100038608 != -1)
    swift_once(&qword_100038608, sub_10001D5BC);
  v0 = type metadata accessor for LocalizedStringResource(0);
  return sub_10000CDF8(v0, (uint64_t)qword_10003C690);
}

uint64_t sub_10001D664()
{
  return IntentParameter.projectedValue.getter();
}

uint64_t sub_10001D684()
{
  unint64_t v0;

  v0 = sub_10001D580();
  return IntentParameterSummary.init(_:)(sub_10001D6C4, 0, &type metadata for PhotosReliveWidgetConfiguration, v0);
}

uint64_t sub_10001D6C4()
{
  uint64_t KeyPath;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  KeyPath = swift_getKeyPath(&unk_10002A6A0);
  v1 = sub_10001D580();
  v2 = static IntentParameterSummary.ParameterKeyPathsBuilder.buildExpression<A>(_:)(KeyPath, v1);
  swift_release(KeyPath);
  v3 = sub_10000B8A0(&qword_100039238);
  v4 = swift_allocObject(v3, 40, 7);
  *(_OWORD *)(v4 + 16) = xmmword_100029DA0;
  *(_QWORD *)(v4 + 32) = v2;
  v7 = v4;
  specialized Array._endMutation()();
  swift_retain(v2);
  v5 = static IntentParameterSummary.ParameterKeyPathsBuilder.buildBlock(_:)(v7, &type metadata for PhotosReliveWidgetConfiguration, v1);
  swift_release(v2);
  swift_bridgeObjectRelease(v7);
  return v5;
}

uint64_t sub_10001D788@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_10001D664();
  *a1 = result;
  return result;
}

uint64_t sub_10001D7B0()
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
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
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
  uint64_t v42;
  unint64_t v43;
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
  unint64_t v59;
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
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unsigned int v76;
  unint64_t v77;
  unint64_t v78;
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
  unsigned int v89;
  void (*v90)(uint64_t);
  uint64_t v91;
  _OWORD v92[2];
  uint64_t v93;

  v0 = type metadata accessor for _IntentPhotoItemCollection.PickerMode(0);
  v87 = *(_QWORD *)(v0 - 8);
  v88 = v0;
  __chkstk_darwin(v0, v1);
  sub_10000E874();
  v86 = v2;
  v3 = sub_10001E0FC();
  v91 = type metadata accessor for LocalizedStringResource.BundleDescription(v3);
  v82 = *(_QWORD *)(v91 - 8);
  __chkstk_darwin(v91, v4);
  sub_10000E874();
  v85 = v5;
  v6 = sub_10001E0FC();
  type metadata accessor for Locale(v6);
  sub_10000E858();
  __chkstk_darwin(v7, v8);
  sub_10000E874();
  v84 = v9;
  v10 = sub_10001E0FC();
  type metadata accessor for String.LocalizationValue(v10);
  sub_10000E858();
  __chkstk_darwin(v11, v12);
  sub_10000E874();
  v81 = v13;
  v14 = sub_10001E0FC();
  v15 = type metadata accessor for InputConnectionBehavior(v14);
  v16 = *(_QWORD *)(v15 - 8);
  v79 = v15;
  __chkstk_darwin(v15, v17);
  sub_10001C3EC();
  v20 = v19 - v18;
  sub_10000B8A0(&qword_100039450);
  sub_10000E858();
  v23 = __chkstk_darwin(v21, v22);
  v25 = (char *)&v72 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23, v26);
  v28 = (char *)&v72 - v27;
  sub_10000B8A0(&qword_100039458);
  sub_10000E858();
  __chkstk_darwin(v29, v30);
  sub_10001C3EC();
  v33 = v32 - v31;
  v34 = type metadata accessor for LocalizedStringResource(0);
  v80 = v34;
  __chkstk_darwin(v34, v35);
  sub_10001C3EC();
  v38 = v37 - v36;
  sub_10000B8A0(&qword_100039460);
  LocalizedStringResource.init(stringLiteral:)(1701869908, 0xE400000000000000);
  v39 = sub_10001E0E0();
  sub_10000BA28(v39, v40, v41, v34);
  LOBYTE(v92[0]) = 0;
  v42 = type metadata accessor for IntentDialog(0);
  sub_10001E0B8((uint64_t)v28);
  v72 = v25;
  sub_10001E0B8((uint64_t)v25);
  v89 = enum case for InputConnectionBehavior.default(_:);
  v90 = *(void (**)(uint64_t))(v16 + 104);
  v73 = v20;
  v90(v20);
  v43 = sub_10001E03C();
  v83 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:supportedValues:)(v38, v33, v92, v28, v25, v20, &off_100035568, v43);
  v75 = sub_10000B8A0(&qword_100039470);
  v78 = 0xD000000000000022;
  v77 = 0x800000010002BCC0;
  v44 = ((uint64_t (*)(void))String.LocalizationValue.init(stringLiteral:))();
  static Locale.current.getter(v44);
  v76 = enum case for LocalizedStringResource.BundleDescription.main(_:);
  v82 = *(_QWORD *)(v82 + 104);
  v45 = v85;
  ((void (*)(uint64_t))v82)(v85);
  v74 = 0x800000010002A640;
  v46 = sub_10001E108();
  sub_10001E0C8(v46, v47, v48);
  v49 = sub_10001E0E0();
  v50 = v80;
  sub_10000BA28(v49, v51, v52, v80);
  v93 = 0;
  memset(v92, 0, sizeof(v92));
  v53 = sub_10001E11C();
  *(_QWORD *)(v54 - 256) = v42;
  sub_10000BA28(v53, v55, v56, v42);
  v57 = (uint64_t)v72;
  sub_10001E0B8((uint64_t)v72);
  v58 = v73;
  sub_10001E0F0(v73, v89);
  v59 = sub_10001E078();
  v75 = IntentParameter<>.init(title:description:default:requestValueDialog:requestDisambiguationDialog:inputConnectionBehavior:)(v38, v33, v92, v28, v57, v58, v59);
  sub_10000B8A0(&qword_100039480);
  v60 = String.LocalizationValue.init(stringLiteral:)(v78, v77);
  static Locale.current.getter(v60);
  ((void (*)(uint64_t, _QWORD, uint64_t))v82)(v45, v76, v91);
  v61 = sub_10001E108();
  sub_10001E0C8(v61, v62, v74);
  v63 = sub_10001E0E0();
  sub_10000BA28(v63, v64, v65, v50);
  v66 = v86;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v87 + 104))(v86, enum case for _IntentPhotoItemCollection.PickerMode.albums(_:), v88);
  v67 = sub_10001E11C();
  sub_10000BA28(v67, v69, v70, *(_QWORD *)(v68 - 256));
  sub_10001E0F0(v58, v89);
  IntentParameter<>.init(title:description:pickerMode:selectionLimit:requestValueDialog:inputConnectionBehavior:)(v38, v33, v66, 1, v28, v58);
  return v83;
}

unint64_t sub_10001DC18()
{
  return 0xD000000000000027;
}

unint64_t sub_10001DC38()
{
  unint64_t result;

  result = qword_100039418;
  if (!qword_100039418)
  {
    result = swift_getWitnessTable(&unk_10002A610, &type metadata for PhotosReliveWidgetConfiguration);
    atomic_store(result, (unint64_t *)&qword_100039418);
  }
  return result;
}

unint64_t sub_10001DC78()
{
  unint64_t result;

  result = qword_100039420;
  if (!qword_100039420)
  {
    result = swift_getWitnessTable(&unk_10002A638, &type metadata for PhotosReliveWidgetConfiguration);
    atomic_store(result, (unint64_t *)&qword_100039420);
  }
  return result;
}

unint64_t sub_10001DCB8()
{
  unint64_t result;

  result = qword_100039428;
  if (!qword_100039428)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Never, &type metadata for Never);
    atomic_store(result, (unint64_t *)&qword_100039428);
  }
  return result;
}

uint64_t sub_10001DCF4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100030B60, 1);
}

uint64_t sub_10001DD04@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_10001D61C();
  v3 = type metadata accessor for LocalizedStringResource(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v2, v3);
}

uint64_t sub_10001DD58(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  unint64_t v5;

  v4 = (_QWORD *)swift_task_alloc(async function pointer to WidgetConfigurationIntent.perform()[1]);
  *(_QWORD *)(v2 + 16) = v4;
  v5 = sub_10001B92C();
  *v4 = v2;
  v4[1] = sub_10001DDBC;
  return WidgetConfigurationIntent.perform()(a2, v5);
}

uint64_t sub_10001DDBC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v5 = *v1;
  v2 = *(_QWORD *)(v5 + 16);
  v3 = *v1;
  v5 = v3;
  result = swift_task_dealloc(v2);
  if (v0)
    return (*(uint64_t (**)(void))(v3 + 8))();
  return result;
}

uint64_t sub_10001DE18@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = sub_10001D7B0();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

uint64_t sub_10001DE40(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001E000();
  return static CustomIntentMigratedAppIntent.persistentIdentifier.getter(a1, v2);
}

uint64_t destroy for PhotosReliveWidgetConfiguration(_QWORD *a1)
{
  swift_release(*a1);
  swift_release(a1[1]);
  return swift_release(a1[2]);
}

uint64_t *_s18PhotosReliveWidget31PhotosReliveWidgetConfigurationVwCP_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[2];
  a1[2] = v5;
  swift_retain(v3);
  swift_retain(v4);
  swift_retain(v5);
  return a1;
}

uint64_t *assignWithCopy for PhotosReliveWidgetConfiguration(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_retain(v4);
  swift_release(v5);
  v6 = a2[1];
  v7 = a1[1];
  a1[1] = v6;
  swift_retain(v6);
  swift_release(v7);
  v8 = a2[2];
  v9 = a1[2];
  a1[2] = v8;
  swift_retain(v8);
  swift_release(v9);
  return a1;
}

_QWORD *assignWithTake for PhotosReliveWidgetConfiguration(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_release(*a1);
  v4 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release(v4);
  v5 = a1[2];
  a1[2] = *(_QWORD *)(a2 + 16);
  swift_release(v5);
  return a1;
}

ValueMetadata *type metadata accessor for PhotosReliveWidgetConfiguration()
{
  return &type metadata for PhotosReliveWidgetConfiguration;
}

unint64_t sub_10001DFBC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100039438;
  if (!qword_100039438)
  {
    v1 = sub_10000B978(&qword_100039440);
    result = swift_getWitnessTable(&protocol conformance descriptor for IntentParameterSummary<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100039438);
  }
  return result;
}

unint64_t sub_10001E000()
{
  unint64_t result;

  result = qword_100039448;
  if (!qword_100039448)
  {
    result = swift_getWitnessTable(&unk_10002A550, &type metadata for PhotosReliveWidgetConfiguration);
    atomic_store(result, (unint64_t *)&qword_100039448);
  }
  return result;
}

unint64_t sub_10001E03C()
{
  unint64_t result;

  result = qword_100039468;
  if (!qword_100039468)
  {
    result = swift_getWitnessTable(&unk_10002AA3C, &type metadata for PhotosReliveWidgetType);
    atomic_store(result, (unint64_t *)&qword_100039468);
  }
  return result;
}

unint64_t sub_10001E078()
{
  unint64_t result;

  result = qword_100039478;
  if (!qword_100039478)
  {
    result = swift_getWitnessTable(&unk_10002AD88, &type metadata for PhotosReliveWidgetAlbum);
    atomic_store(result, (unint64_t *)&qword_100039478);
  }
  return result;
}

uint64_t sub_10001E0B8(uint64_t a1)
{
  uint64_t v1;

  return sub_10000BA28(a1, 1, 1, v1);
}

uint64_t sub_10001E0C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  return LocalizedStringResource.init(_:table:locale:bundle:comment:)(a1, a2, a3, v3, v4, 0, 0, 256);
}

uint64_t sub_10001E0E0()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_10001E0F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 - 168))(a1, a2, v2);
}

uint64_t sub_10001E0FC()
{
  return 0;
}

uint64_t sub_10001E108()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_10001E11C()
{
  uint64_t v0;

  return v0;
}

#error "10001E374: call analysis failed (funcsize=147)"

uint64_t sub_10001E3A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a2);
  if (v3 == v6 && v5 == v7)
  {
    v10 = 1;
    v9 = v5;
  }
  else
  {
    v9 = v7;
    v10 = _stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v6, v7, 0);
  }
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v9);
  return v10 & 1;
}

uint64_t sub_10001E42C(__int16 a1, uint64_t a2, char a3, __int16 a4, uint64_t a5, char a6)
{
  if (a1 == a4)
  {
    if ((a3 & 1) != 0)
    {
      if ((a6 & 1) != 0)
        return 1;
    }
    else if ((a6 & 1) == 0 && *(double *)&a2 == *(double *)&a5)
    {
      return 1;
    }
  }
  return 0;
}

#error "10001E568: call analysis failed (funcsize=74)"

void sub_10001E594()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  id v26;
  uint64_t v27;

  sub_10000F0E4();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  sub_10001C744();
  sub_10000E868();
  __chkstk_darwin(v13, v14);
  sub_10001C3EC();
  v17 = v16 - v15;
  v18 = sub_10000EF04();
  v19 = *(_QWORD *)(v18 - 8);
  __chkstk_darwin(v18, v20);
  sub_10001C5CC();
  if (v10 == 1)
  {
    type metadata accessor for PhotosReliveWidgetFallbackViewModel(0);
    sub_100023358(v0, v4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 16));
    swift_retain(v8);
    v26 = v12;
    sub_10001E464(v26, v27, v8, v0);
LABEL_10:
    sub_100023408();
    sub_10000E8C0();
    return;
  }
  if (v10 == 2)
  {
    type metadata accessor for PhotosReliveWidgetPlaceholderViewModel(0);
    v21 = v12;
    v22 = objc_msgSend(v21, "contentType");
    sub_100022B9C(v21, (SEL *)&selRef_sourceIdentifier);
    v23 = sub_100023360();
    v25 = v4;
    goto LABEL_8;
  }
  if (v10 != 3)
  {
    type metadata accessor for PhotosReliveWidgetViewModel(0);
    sub_1000227A4(v6, v17);
    swift_retain(v8);
    v21 = v12;
    if (sub_10001ECB0(v21, v10, v8, v17, v2))
    {
LABEL_9:

      goto LABEL_10;
    }
    type metadata accessor for PhotosReliveWidgetPlaceholderViewModel(0);
    v22 = objc_msgSend(v21, "contentType");
    sub_100022B9C(v21, (SEL *)&selRef_sourceIdentifier);
    v23 = sub_100023360();
    v25 = v4;
LABEL_8:
    sub_100023358(v23, v25, v24);
    sub_10001E130(v22, v10, v2, v0);
    goto LABEL_9;
  }
  sub_1000233A8((uint64_t)"Fatal error", 11, 2, 0xD000000000000043, 0x800000010002BEE0, (uint64_t)"PhotosReliveWidget/PhotosReliveWidgetViewModel.swift");
  __break(1u);
}

double sub_10001E798@<D0>(uint64_t a1@<X0>, double *a2@<X8>)
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  double *v17;
  double v18;
  double v19;
  uint64_t (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  double v29;
  double v30;
  double v31;
  double result;
  double *v33;
  uint64_t v34;
  double *v35;
  uint64_t v36;
  uint64_t v37;

  v35 = a2;
  v3 = sub_10000EF04();
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3, v5);
  sub_10000F024();
  v8 = v6 - v7;
  v11 = __chkstk_darwin(v9, v10);
  v13 = (char *)&v34 - v12;
  __chkstk_darwin(v11, v14);
  v16 = (char *)&v34 - v15;
  v17 = (double *)(a1 + *(int *)(sub_10001C744() + 20));
  v18 = *v17;
  v19 = v17[1];
  v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v21 = v20(v16, a1, v3);
  sub_1000233C0(v21, enum case for WidgetFamily.systemLarge(_:));
  sub_10000BDF4(&qword_100038BC8, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily);
  sub_100023268();
  sub_100023268();
  v22 = v36;
  v23 = v37;
  sub_1000232F8((uint64_t)v13);
  v24 = v20((char *)v8, (uint64_t)v16, v3);
  if (v23 == v22)
  {
    sub_1000232F8(v8);
    v25 = 2.0;
  }
  else
  {
    sub_1000233C0(v24, enum case for WidgetFamily.systemExtraLarge(_:));
    sub_100023268();
    sub_100023268();
    v27 = v36;
    v26 = v37;
    sub_1000232F8((uint64_t)v13);
    sub_1000232F8(v8);
    v25 = 2.0;
    if (v26 != v27)
    {
      v28 = objc_msgSend((id)objc_opt_self(UIScreen), "mainScreen");
      objc_msgSend(v28, "scale");
      v25 = v29;

    }
  }
  v30 = v19 + 2.0;
  v31 = v18 + 2.0;
  sub_1000232F8((uint64_t)v16);
  result = v31 * v25;
  v33 = v35;
  *v35 = v31 * v25;
  v33[1] = v30 * v25;
  v33[2] = v31;
  v33[3] = v30;
  v33[4] = v25;
  return result;
}

uint64_t sub_10001E9AC()
{
  uint64_t result;

  sub_10001BB44(0, &qword_100039208, OS_os_log_ptr);
  result = OS_os_log.init(subsystem:category:)(0xD000000000000023, 0x800000010002B6B0, 0x616F4C6567616D49, 0xEC000000676E6964);
  qword_10003C6A8 = result;
  return result;
}

uint64_t sub_10001EA20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  uint64_t result;
  uint64_t v18;
  void *v19;

  v0 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v5, v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v9, v10);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001BB44(0, &qword_100039258, OS_dispatch_queue_ptr);
  static DispatchQoS.userInteractive.getter();
  v19 = &_swiftEmptyArrayStorage;
  sub_10000BDF4(&qword_100039790, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  v14 = v13;
  v15 = sub_10000B8A0(&qword_100039798);
  sub_10000E4AC(&qword_1000397A0, &qword_100039798);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v19, v15, v16, v5, v14);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v4, enum case for OS_dispatch_queue.AutoreleaseFrequency.workItem(_:), v0);
  result = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD000000000000037, 0x800000010002C0A0, v12, v8, v4, 0);
  qword_10003C6B0 = result;
  return result;
}

void sub_10001EBF4(unsigned __int8 a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, 0);
  Hasher._combine(_:)(a1);
  sub_100023320();
  sub_10001C6DC();
}

void sub_10001EC2C()
{
  unsigned __int8 *v0;

  sub_10001EBF4(*v0);
}

void sub_10001EC48(uint64_t a1, uint64_t a2)
{
  unsigned __int8 *v2;
  Swift::UInt v3;

  v3 = *v2;
  sub_100023380(a1, a2);
  Hasher._combine(_:)(v3);
  sub_100023320();
  sub_10001C6DC();
}

void sub_10001EC78(_QWORD *a1@<X8>)
{
  *a1 = &off_100035590;
}

uint64_t sub_10001EC88(uint64_t a1, uint64_t a2)
{
  return sub_10001E42C(*(_WORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16), *(_WORD *)a2, *(_QWORD *)(a2 + 8), *(_BYTE *)(a2 + 16));
}

uint64_t sub_10001ECB0(void *a1, char a2, uint64_t a3, uint64_t a4, void *a5)
{
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
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  Class isa;
  id v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  id v50;
  char v51;
  CGImage *v52;
  uint64_t result;
  os_log_type_t v54;
  CGImage *v55;
  CGImage *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  size_t v61;
  uint64_t v62;
  size_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void (*v71)(uint64_t);
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  void *v81;
  uint64_t v82;
  CGImage *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  CGImage *v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t (*v100)(id, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id, char, id, uint64_t, uint64_t, uint64_t, uint64_t *);
  CGImage *v101;
  uint64_t v102;
  void (*v103)(uint64_t);
  os_log_type_t v104;
  uint8_t *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void (*v110)(uint64_t);
  uint64_t v111;
  char v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  os_log_type_t v116;
  uint64_t v117;
  CGImage *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  id v122;
  char v123;
  id v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  double v135;
  id v136;
  char v137;
  uint64_t v139;
  double v140;
  unsigned __int8 v141;
  unsigned __int8 v142;
  unsigned __int8 v143;
  uint64_t v144;
  char v145;
  uint64_t v146;
  double v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  char v151[8];
  uint64_t v152;

  sub_1000232C0();
  sub_10000E868();
  __chkstk_darwin(v7, v8);
  sub_10000E874();
  v131 = v9;
  v130 = sub_10000EF04();
  v129 = *(_QWORD *)(v130 - 8);
  sub_10000E868();
  __chkstk_darwin(v10, v11);
  sub_10000E874();
  v133 = v12;
  type metadata accessor for OSSignpostID(0);
  sub_10000E868();
  __chkstk_darwin(v13, v14);
  sub_10001C3EC();
  v17 = v16 - v15;
  if (qword_100038610 != -1)
    swift_once(&qword_100038610, sub_10001E9AC);
  v18 = (void *)qword_10003C6A8;
  v136 = a1;
  v19 = objc_msgSend(v136, "assetLocalIdentifier");
  v20 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
  v22 = v21;

  v23 = v18;
  v24 = OSSignpostID.init(log:)();
  v25 = static os_signpost_type_t.begin.getter(v24);
  v26 = sub_10000B8A0(&qword_100039310);
  v27 = swift_allocObject(v26, 72, 7);
  *(_OWORD *)(v27 + 16) = xmmword_100029240;
  *(_QWORD *)(v27 + 56) = &type metadata for String;
  *(_QWORD *)(v27 + 64) = sub_10001C058();
  *(_QWORD *)(v27 + 32) = v20;
  *(_QWORD *)(v27 + 40) = v22;
  sub_1000232E8();
  os_signpost(_:dso:log:name:signpostID:_:_:)(v25, &_mh_execute_header, v23, "FetchAsset", 10, 2, v17, "fetching asset with identifier %{public}s", 41, 2, v27);
  v28 = objc_msgSend(a5, "librarySpecificFetchOptions", swift_bridgeObjectRelease(v27).n128_f64[0]);
  objc_msgSend(v28, "setIncludeGuestAssets:", 1);
  v29 = (void *)objc_opt_self(PHAsset);
  v30 = sub_10000B8A0(&qword_100039228);
  v31 = swift_allocObject(v30, 48, 7);
  *(_OWORD *)(v31 + 16) = xmmword_100029240;
  v134 = (uint64_t)v20;
  *(_QWORD *)(v31 + 32) = v20;
  *(_QWORD *)(v31 + 40) = v22;
  sub_1000232E8();
  isa = Array._bridgeToObjectiveC()().super.isa;
  v33 = objc_msgSend(v29, "fetchAssetsWithLocalIdentifiers:options:", isa, v28, swift_bridgeObjectRelease(v31).n128_f64[0]);

  v35 = sub_100023318(v34, "firstObject");
  if (!v35)
  {
    if (a2)
    {
      sub_1000232F0();

    }
    else
    {
      v104 = static os_log_type_t.error.getter(0);
      if (os_log_type_enabled(v23, v104))
      {
        sub_1000232E8();
        v105 = (uint8_t *)sub_10001C2C8(12);
        *(double *)&v106 = COERCE_DOUBLE(sub_10001C2C8(32));
        v146 = v106;
        *(_DWORD *)v105 = 136446210;
        v107 = sub_1000232E8();
        v139 = sub_100023328(v107, v108, &v146);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v139, &v140, v105 + 4, v105 + 12);
        sub_1000233B4();
        _os_log_impl((void *)&_mh_execute_header, v23, v104, "Error fetching asset for identifier %{public}s", v105, 0xCu);
        swift_arrayDestroy(v106, 1);
        sub_100010F30(v106);
        sub_100010F30((uint64_t)v105);

        sub_100023238();
        sub_1000233E0();

        sub_10002327C();
        sub_1000233D8();
        v109 = sub_1000232C8();
LABEL_28:
        v110(v109);
        return 0;
      }

      sub_1000232F0();
    }
    sub_100023238();
    sub_1000233E0();

    sub_10002327C();
    sub_1000233D8();
    v109 = sub_100023338();
    goto LABEL_28;
  }
  v36 = v35;
  v37 = static os_signpost_type_t.end.getter(v35);
  os_signpost(_:dso:log:name:signpostID:)(v37, &_mh_execute_header, v23, "FetchAsset", 10, 2, v17);
  type metadata accessor for PhotosReliveWidgetViewModel(0);
  v38 = a4;
  sub_10001E798(a4, (double *)&v146);
  v39 = v146;
  v40 = v147;
  v128 = v148;
  v126 = v149;
  v125 = v150;
  v41 = sub_10001C744();
  v42 = sub_10001FABC(v36, *(double *)(v38 + *(int *)(v41 + 20)), *(double *)(v38 + *(int *)(v41 + 20) + 8));
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v49 = objc_autoreleasePoolPush();
  v50 = sub_10001FB3C(v36, v42, v44, v46, v48, *(double *)&v39, v40);
  v123 = v51;
  objc_autoreleasePoolPop(v49);
  if (!v50)
  {
    sub_1000232F0();

    sub_100023238();
    sub_1000233E0();

    sub_10002327C();
    sub_1000233D8();
    v70 = sub_100023338();
    v71(v70);
    return (uint64_t)v50;
  }
  v52 = (CGImage *)v50;
  PFSharedFigDecodeSessionDiscardCachedBuffers();
  result = CGImageGetWidth(v52);
  if ((~v39 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_31;
  }
  if (*(double *)&v39 <= -9.22337204e18)
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  if (*(double *)&v39 >= 9.22337204e18)
  {
LABEL_32:
    __break(1u);
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  v122 = v50;
  if (result < (uint64_t)*(double *)&v39)
    goto LABEL_13;
  result = CGImageGetHeight(v52);
  if ((~*(_QWORD *)&v40 & 0x7FF0000000000000) == 0)
    goto LABEL_33;
  if (v40 <= -9.22337204e18)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v40 < 9.22337204e18)
  {
    if (result >= (uint64_t)v40)
    {
LABEL_20:
      v72 = v136;
      if (sub_100023318(result, "contentType"))
      {
        sub_1000232F0();
        v111 = 0;
        v135 = 0.0;
        v73 = v38;
        v74 = 0;
        v115 = 0;
        v119 = 1;
        v117 = 2;
        v113 = 2;
        v112 = 1;
      }
      else
      {
        v120 = sub_100023310(0, (SEL *)&selRef_title);
        v76 = v75;
        v77 = sub_100023310(v120, (SEL *)&selRef_subtitle);
        v79 = v78;
        v80 = objc_msgSend(v136, "localIdentifier");
        v81 = v36;
        v82 = static String._unconditionallyBridgeFromObjectiveC(_:)(v80);
        v83 = v52;
        v85 = v84;

        v86 = v76;
        v87 = v82;
        v36 = v81;
        sub_1000201E4(v120, v76, v77, v79, v134, v22, v87, v85, v38);
        v117 = v139;
        v88 = BYTE1(v139);
        v135 = v140;
        v119 = v141;
        v113 = v142;
        v89 = v143;
        v115 = v144;
        v112 = v145;
        v90 = v85;
        v52 = v83;
        swift_bridgeObjectRelease(v90);
        sub_1000232F0();
        swift_bridgeObjectRelease(v79);
        swift_bridgeObjectRelease(v86);
        v111 = v88 << 8;
        v73 = v38;
        v74 = v89 << 8;
        v72 = v136;
      }
      v137 = v123 & 1;
      v91 = v52;
      v124 = sub_100023318((uint64_t)v91, "contentType");
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v129 + 16))(v133, v73, v130);
      v92 = sub_100023318((uint64_t)v36, "deeplink");
      static URL._unconditionallyBridgeFromObjectiveC(_:)(v92);

      v94 = sub_100023310(v93, (SEL *)&selRef_title);
      v96 = v95;
      v97 = sub_100023310(v94, (SEL *)&selRef_subtitle);
      v99 = v98;
      v146 = v111 | v117;
      v147 = v135;
      v148 = v119;
      v149 = v74 | v113;
      v150 = v115;
      v151[0] = v112;
      v100 = *(uint64_t (**)(id, uint64_t, void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id, char, id, uint64_t, uint64_t, uint64_t, uint64_t *))(v132 + 160);
      v101 = v91;
      v50 = (id)v100(v124, v133, v36, v131, v94, v96, v97, v99, v122, v137, v122, v128, v126, v125, &v146);
      sub_100023274((uint64_t)&v150);
      sub_100023274((uint64_t)&v152);

      sub_100023238();
      sub_100023274((uint64_t)v151);
      sub_10002327C();
      sub_100022C40(a4);
      v102 = sub_1000232C8();
      v103(v102);

      return (uint64_t)v50;
    }
LABEL_13:
    v121 = v36;
    v54 = static os_log_type_t.default.getter();
    v118 = v52;
    v55 = v52;
    if (os_log_type_enabled(v23, v54))
    {
      swift_bridgeObjectRetain_n(v22, 2);
      v116 = v54;
      v56 = v55;
      v57 = sub_10001C2C8(42);
      v114 = sub_10001C2C8(64);
      v139 = v114;
      *(_DWORD *)v57 = 136446978;
      v58 = sub_1000232E8();
      *(double *)&v146 = COERCE_DOUBLE(sub_100023328(v58, v59, &v139));
      sub_100023308((uint64_t)&v146, (uint64_t)&v147, v60, v57 + 12);
      sub_1000233B4();
      *(_WORD *)(v57 + 12) = 2050;
      *(double *)&v61 = COERCE_DOUBLE(CGImageGetWidth(v56));

      v146 = v61;
      sub_100023308((uint64_t)&v146, (uint64_t)&v147, v62, v57 + 22);

      *(_WORD *)(v57 + 22) = 2050;
      *(double *)&v63 = COERCE_DOUBLE(CGImageGetHeight(v56));

      v146 = v63;
      sub_100023308((uint64_t)&v146, (uint64_t)&v147, v64, v57 + 32);

      *(_WORD *)(v57 + 32) = 2082;
      v146 = v39;
      v147 = v40;
      type metadata accessor for CGSize(0);
      v66 = String.init<A>(describing:)(&v146, v65);
      v68 = v67;
      *(double *)&v146 = COERCE_DOUBLE(sub_100019C88(v66, v67, &v139));
      sub_100023308((uint64_t)&v146, (uint64_t)&v147, v69, v57 + 42);
      v38 = a4;
      swift_bridgeObjectRelease(v68);
      _os_log_impl((void *)&_mh_execute_header, v23, v116, "scaling up image for %{public}s because loaded size %{public}ld,%{public}ld is not targetSize %{public}s", (uint8_t *)v57, 0x2Au);
      swift_arrayDestroy(v114, 2);
      sub_100010F30(v114);
      result = sub_100010F30(v57);
    }
    else
    {

    }
    v36 = v121;
    v52 = v118;
    goto LABEL_20;
  }
LABEL_35:
  __break(1u);
  return result;
}

void sub_10001F834(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  sub_100023180(a1, a2, a3, a4, a5, a6, a7, a8);
  v8 = sub_1000231CC();
  sub_10001F86C(v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21);
  sub_100023288();
}

uint64_t sub_10001F86C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, __int128 a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v14;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  uint64_t v34;
  char v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  _QWORD v47[2];
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  char v51;
  _BYTE v52[56];

  sub_100022BF8(a14, (uint64_t)v47);
  v36 = v48;
  v45 = v49;
  v46 = v47[0];
  v38 = v47[1];
  v39 = v50;
  v37 = v51;
  *(_QWORD *)(v14 + 16) = a1;
  v21 = v14 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_widgetFamily;
  v22 = sub_10000EF04();
  v42 = *(_QWORD *)(v22 - 8);
  v44 = a2;
  sub_100023358(v21, a2, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v42 + 16));
  *(_QWORD *)(v14 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_asset) = a3;
  v23 = v14 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_destination;
  v24 = *(_QWORD *)(sub_1000232C0() - 8);
  v43 = a4;
  sub_10000F31C(v23, a4, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v24 + 16));
  v25 = (_QWORD *)(v14 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_title);
  *v25 = a5;
  v25[1] = a6;
  v26 = (_QWORD *)(v14 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_subtitle);
  *v26 = a7;
  v26[1] = a8;
  *(_QWORD *)(v14 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_image) = a9;
  *(_BYTE *)(v14 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_imageIsDegraded) = a10;
  v27 = v14 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_layoutDescription;
  *(_OWORD *)v27 = a11;
  *(_QWORD *)(v27 + 16) = a12;
  *(_QWORD *)(v27 + 24) = a13;
  sub_100022BF8(a14, (uint64_t)v52);
  if ((unint64_t)v52[1] << 8 == 768)
  {
    LOBYTE(v28) = 0;
    v29 = 0;
    LOBYTE(v30) = 0;
    v31 = 0;
    v32 = 1;
    LOBYTE(v46) = 2;
    LOBYTE(v45) = 2;
    v33 = 1;
  }
  else
  {
    v28 = v46 >> 8;
    v32 = v36 & 1;
    v30 = v45 >> 8;
    v33 = v37 & 1;
    v29 = v38;
    v31 = v39;
  }
  sub_100023350(v43, *(uint64_t (**)(uint64_t, uint64_t))(v24 + 8));
  (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v44, v22);
  v34 = v14 + OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_titleSubtitleLayout;
  *(_BYTE *)v34 = v46;
  *(_BYTE *)(v34 + 1) = v28;
  *(_QWORD *)(v34 + 8) = v29;
  *(_BYTE *)(v34 + 16) = v32;
  *(_BYTE *)(v34 + 24) = v45;
  *(_BYTE *)(v34 + 25) = v30;
  *(_QWORD *)(v34 + 32) = v31;
  *(_BYTE *)(v34 + 40) = v33;
  return v14;
}

double sub_10001FABC(void *a1, double a2, double a3)
{
  double v6;
  double v7;

  v6 = (double)(uint64_t)objc_msgSend(a1, "pixelWidth");
  objc_msgSend(a1, "pixelHeight");
  objc_msgSend(a1, "suggestedCropForTargetSize:", a2, a3);
  return v7 / v6;
}

id sub_10001FB3C(void *a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  char v19;
  void *v20;
  id v21;
  os_log_type_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  char v27;
  os_log_type_t v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  os_log_type_t v35;
  NSObject *v36;
  _BOOL4 v37;
  uint8_t *v38;
  uint64_t v39;
  uint8_t *v40;
  uint64_t v41;
  id v42;
  os_log_type_t v43;
  NSObject *v44;
  os_log_type_t v45;
  id v46;
  uint8_t *v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v54;
  uint64_t v55;

  v14 = objc_msgSend(a1, "localIdentifier");
  v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v14);
  v17 = v16;

  v18 = sub_100020A20(a1, a2, a3, a4, a5, a6, a7);
  if (v18)
  {
    v20 = v18;
    v21 = v18;
    v22 = static os_log_type_t.debug.getter(v21);
    if (qword_100038610 != -1)
      swift_once(&qword_100038610, sub_10001E9AC);
    v23 = qword_10003C6A8;
    v24 = v22;
    if (os_log_type_enabled((os_log_t)qword_10003C6A8, v22))
    {
      swift_bridgeObjectRetain(v17);
      v25 = (uint8_t *)swift_slowAlloc(12, -1);
      v26 = swift_slowAlloc(32, -1);
      v55 = v26;
      *(_DWORD *)v25 = 136446210;
      swift_bridgeObjectRetain(v17);
      v54 = sub_100019C88(v15, v17, &v55);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, &v55, v25 + 4, v25 + 12);
      swift_bridgeObjectRelease_n(v17, 3);
      _os_log_impl((void *)&_mh_execute_header, v23, v24, "Loaded local image for asset %{public}s", v25, 0xCu);
      swift_arrayDestroy(v26, 1);
      swift_slowDealloc(v26, -1, -1);
      swift_slowDealloc(v25, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease(v17);
    }

  }
  else
  {
    v27 = v19;
    v28 = static os_log_type_t.debug.getter(0);
    if (qword_100038610 != -1)
      swift_once(&qword_100038610, sub_10001E9AC);
    v29 = &unk_10003C000;
    v30 = qword_10003C6A8;
    v31 = os_log_type_enabled((os_log_t)qword_10003C6A8, v28);
    if ((_DWORD)v31)
    {
      swift_bridgeObjectRetain_n(v17, 2);
      v32 = (uint8_t *)swift_slowAlloc(12, -1);
      v33 = swift_slowAlloc(32, -1);
      v55 = v33;
      *(_DWORD *)v32 = 136446210;
      swift_bridgeObjectRetain(v17);
      v54 = sub_100019C88(v15, v17, &v55);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, &v55, v32 + 4, v32 + 12);
      swift_bridgeObjectRelease_n(v17, 3);
      _os_log_impl((void *)&_mh_execute_header, v30, v28, "Failed to load local image for asset %{public}s", v32, 0xCu);
      swift_arrayDestroy(v33, 1);
      v34 = v33;
      v29 = &unk_10003C000;
      swift_slowDealloc(v34, -1, -1);
      v31 = swift_slowDealloc(v32, -1, -1);
    }
    v35 = static os_log_type_t.debug.getter(v31);
    v36 = qword_10003C6A8;
    v37 = os_log_type_enabled((os_log_t)qword_10003C6A8, v35);
    if ((v27 & 1) != 0)
    {
      if (v37)
      {
        swift_bridgeObjectRetain(v17);
        v38 = (uint8_t *)swift_slowAlloc(12, -1);
        v39 = swift_slowAlloc(32, -1);
        v55 = v39;
        *(_DWORD *)v38 = 136446210;
        swift_bridgeObjectRetain(v17);
        v54 = sub_100019C88(v15, v17, &v55);
        v29 = &unk_10003C000;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, &v55, v38 + 4, v38 + 12);
        swift_bridgeObjectRelease_n(v17, 3);
        _os_log_impl((void *)&_mh_execute_header, v36, v35, "Attempting to load cloud image for asset %{public}s", v38, 0xCu);
        swift_arrayDestroy(v39, 1);
        swift_slowDealloc(v39, -1, -1);
        swift_slowDealloc(v38, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease(v17);
      }
      v42 = sub_1000210A0(a1, a2, a3, a4, a5, a6, a7);
      if (v42)
        return v42;
    }
    else if (v37)
    {
      swift_bridgeObjectRetain(v17);
      v40 = (uint8_t *)swift_slowAlloc(12, -1);
      v41 = swift_slowAlloc(32, -1);
      v55 = v41;
      *(_DWORD *)v40 = 136446210;
      swift_bridgeObjectRetain(v17);
      v54 = sub_100019C88(v15, v17, &v55);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, &v55, v40 + 4, v40 + 12);
      swift_bridgeObjectRelease_n(v17, 3);
      _os_log_impl((void *)&_mh_execute_header, v36, v35, "No cloud image available for asset %{public}s", v40, 0xCu);
      swift_arrayDestroy(v41, 1);
      swift_slowDealloc(v41, -1, -1);
      v42 = (id)swift_slowDealloc(v40, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease(v17);
    }
    v43 = static os_log_type_t.error.getter(v42);
    v44 = *((_QWORD *)v29 + 213);
    v45 = v43;
    if (os_log_type_enabled(v44, v43))
    {
      v46 = a1;
      v47 = (uint8_t *)swift_slowAlloc(12, -1);
      v48 = swift_slowAlloc(32, -1);
      v55 = v48;
      *(_DWORD *)v47 = 136446210;
      v49 = objc_msgSend(v46, "localIdentifier");
      v50 = static String._unconditionallyBridgeFromObjectiveC(_:)(v49);
      v52 = v51;

      v54 = sub_100019C88(v50, v52, &v55);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v54, &v55, v47 + 4, v47 + 12);

      swift_bridgeObjectRelease(v52);
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "Could not load any image for asset %{public}s", v47, 0xCu);
      swift_arrayDestroy(v48, 1);
      swift_slowDealloc(v48, -1, -1);
      swift_slowDealloc(v47, -1, -1);
    }
    return 0;
  }
  return v20;
}

void sub_1000201E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
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
  char *v31;
  uint64_t v32;
  void *ObjCClassFromMetadata;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSString v37;
  NSString v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  BOOL v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  char v46;
  void (*v47)(uint64_t, uint64_t);
  char v48;
  NSString v49;
  NSString v50;
  uint64_t v51;
  char v52;
  char v53;
  unint64_t v54;
  uint64_t v55;
  NSString v56;
  NSString v57;
  BOOL v58;
  _QWORD v59[3];
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  sub_10000F0E4();
  v61 = v9;
  v62 = v10;
  v12 = v11;
  v14 = v13;
  v59[2] = v16;
  v60 = v15;
  v59[1] = v17;
  v19 = v18;
  v21 = v20;
  v22 = sub_10000EF04();
  v23 = *(_QWORD *)(v22 - 8);
  __chkstk_darwin(v22, v24);
  sub_10000F024();
  v27 = v25 - v26;
  __chkstk_darwin(v28, v29);
  v31 = (char *)v59 - v30;
  if (!v19 || !v12)
    goto LABEL_15;
  v32 = sub_10001BB44(0, &qword_100039778, PHAssetCollection_ptr);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(v32);
  v34 = sub_100022B20(v14, v12, ObjCClassFromMetadata);
  if (!v35)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v36 = v34;
  v37 = String._bridgeToObjectiveC()();
  v59[0] = v36;
  v38 = String._bridgeToObjectiveC()();
  v39 = ((uint64_t (*)(NSString, NSString))PXStoryTitleInternationalStyleForStringAndAssetCollectionUUID)(v37, v38);

  switch(v39)
  {
    case 0:
      sub_100023300();
LABEL_15:
      v52 = 0;
      v48 = 0;
      v44 = 2;
      v53 = 2;
      goto LABEL_16;
    case 2:
      v40 = sub_1000233E8();
      v41 = ((uint64_t (*)(void *, unint64_t))StringProtocol.hash.getter)(&type metadata for String, v40);
      if ((v41 & 0x8000000000000000) == 0 || (v42 = __OFSUB__(0, v41), v41 = -v41, !v42))
      {
        v43 = v41 % 4;
        v44 = v41 % 4 < 3;
        (*(void (**)(char *, uint64_t, uint64_t))(v23 + 16))(v31, a9, v22);
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v23 + 104))(v27, enum case for WidgetFamily.systemSmall(_:), v22);
        sub_10000BDF4(&qword_100039780, (uint64_t (*)(uint64_t))&type metadata accessor for WidgetFamily);
        v46 = ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))dispatch thunk of static Equatable.== infix(_:_:))(v31, v27, v22, v45);
        v47 = *(void (**)(uint64_t, uint64_t))(v23 + 8);
        v47(v27, v22);
        v47((uint64_t)v31, v22);
        if (v60 && (v46 & 1) == 0)
        {
          v56 = String._bridgeToObjectiveC()();
          v57 = sub_100023388();
          sub_100023300();
          v58 = ((uint64_t (*)(NSString, NSString))PXStoryTitleInternationalStyleForStringAndAssetCollectionUUID)(v56, v57) == 2;

          v48 = 2 * v58;
        }
        else
        {
          sub_100023300();
          v48 = 0;
        }
        v52 = 2;
        if (v43 >= 3)
          v53 = 2;
        else
          v53 = 3;
        goto LABEL_16;
      }
      goto LABEL_27;
    case 1:
      if (v60)
      {
        v49 = String._bridgeToObjectiveC()();
        v50 = sub_100023388();
        sub_100023300();
        v51 = ((uint64_t (*)(NSString, NSString))PXStoryTitleInternationalStyleForStringAndAssetCollectionUUID)(v49, v50);

        if (v51 != 1)
          goto LABEL_15;
      }
      else
      {
        sub_100023300();
      }
      v54 = sub_1000233E8();
      v55 = ((uint64_t (*)(void *, unint64_t))StringProtocol.hash.getter)(&type metadata for String, v54);
      if (v55 < 0)
      {
        v42 = __OFSUB__(0, v55);
        v55 = -v55;
        if (v42)
          goto LABEL_28;
      }
      if (v55 % 4 < 0)
      {
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
        goto LABEL_29;
      }
      v44 = *((_BYTE *)&off_100035540 + v55 % 4 + 32);
      v52 = 1;
      v53 = v44;
      v48 = 1;
LABEL_16:
      *(_BYTE *)v21 = v44;
      *(_BYTE *)(v21 + 1) = v52;
      *(_QWORD *)(v21 + 8) = 0;
      *(_BYTE *)(v21 + 16) = 1;
      *(_BYTE *)(v21 + 24) = v53;
      *(_BYTE *)(v21 + 25) = v48;
      *(_QWORD *)(v21 + 32) = 0;
      *(_BYTE *)(v21 + 40) = 1;
      return;
  }
LABEL_30:
  sub_1000233A8((uint64_t)"Fatal error", 11, 2, 0, 0xE000000000000000, (uint64_t)"PhotosReliveWidget/PhotosReliveWidgetViewModel.swift");
  __break(1u);
}

id sub_100020550(id result)
{
  if (result)
    return objc_msgSend(result, "CGImage");
  return result;
}

void sub_100020578(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  os_log_type_t v8;
  NSObject *v9;
  uint8_t *v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  os_log_type_t v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29[5];
  __int128 v30;
  uint64_t v31;

  if (a3)
  {
    v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(PHImageCancelledKey);
    v28 = v6;
    AnyHashable.init<A>(_:)(v29, &v27, &type metadata for String, &protocol witness table for String);
    sub_1000209D0((uint64_t)v29, a3, &v30);
    sub_100022D54((uint64_t)v29);
    v7 = &unk_10003C000;
    if (v31)
    {
      if (swift_dynamicCast(&v27, &v30, (char *)&type metadata for Any + 8, &type metadata for Bool, 6)
        && (v27 & 1) != 0)
      {
        v8 = static os_log_type_t.debug.getter();
        if (qword_100038610 != -1)
          swift_once(&qword_100038610, sub_10001E9AC);
        v9 = qword_10003C6A8;
        if (os_log_type_enabled((os_log_t)qword_10003C6A8, v8))
        {
          swift_bridgeObjectRetain_n(a2, 2);
          v10 = (uint8_t *)swift_slowAlloc(12, -1);
          v11 = swift_slowAlloc(32, -1);
          v29[0] = v11;
          *(_DWORD *)v10 = 136446210;
          swift_bridgeObjectRetain(a2);
          *(_QWORD *)&v30 = sub_100019C88(a1, a2, v29);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, (char *)&v30 + 8, v10 + 4, v10 + 12);
          swift_bridgeObjectRelease_n(a2, 3);
          _os_log_impl((void *)&_mh_execute_header, v9, v8, "Cancelled image load for asset %{public}s", v10, 0xCu);
          swift_arrayDestroy(v11, 1);
          swift_slowDealloc(v11, -1, -1);
          v12 = v10;
          v7 = &unk_10003C000;
          swift_slowDealloc(v12, -1, -1);
        }
      }
    }
    else
    {
      sub_100022D14((uint64_t)&v30);
    }
    v27 = static String._unconditionallyBridgeFromObjectiveC(_:)(PHImageErrorKey);
    v28 = v13;
    AnyHashable.init<A>(_:)(v29, &v27, &type metadata for String, &protocol witness table for String);
    sub_1000209D0((uint64_t)v29, a3, &v30);
    sub_100022D54((uint64_t)v29);
    if (v31)
    {
      v14 = sub_10001BB44(0, &qword_100039788, NSError_ptr);
      v15 = swift_dynamicCast(&v27, &v30, (char *)&type metadata for Any + 8, v14, 6);
      if ((v15 & 1) != 0)
      {
        v16 = (void *)v27;
        v17 = static os_log_type_t.error.getter(v15);
        if (qword_100038610 != -1)
          swift_once(&qword_100038610, sub_10001E9AC);
        v18 = *((_QWORD *)v7 + 213);
        if (os_log_type_enabled(v18, v17))
        {
          swift_bridgeObjectRetain_n(a2, 2);
          v19 = v16;
          v20 = swift_slowAlloc(22, -1);
          v21 = swift_slowAlloc(64, -1);
          v29[0] = v21;
          *(_DWORD *)v20 = 136446466;
          swift_bridgeObjectRetain(a2);
          *(_QWORD *)&v30 = sub_100019C88(a1, a2, v29);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, (char *)&v30 + 8, v20 + 4, v20 + 12);
          swift_bridgeObjectRelease_n(a2, 3);
          *(_WORD *)(v20 + 12) = 2082;
          v22 = v19;
          v23 = objc_msgSend(v22, "description");
          v24 = static String._unconditionallyBridgeFromObjectiveC(_:)(v23);
          v26 = v25;

          *(_QWORD *)&v30 = sub_100019C88(v24, v26, v29);
          UnsafeMutableRawBufferPointer.copyMemory(from:)(&v30, (char *)&v30 + 8, v20 + 14, v20 + 22);

          swift_bridgeObjectRelease(v26);
          _os_log_impl((void *)&_mh_execute_header, v18, v17, "Error loading image for asset %{public}s: %{public}s", (uint8_t *)v20, 0x16u);
          swift_arrayDestroy(v21, 2);
          swift_slowDealloc(v21, -1, -1);
          swift_slowDealloc(v20, -1, -1);

        }
        else
        {

        }
      }
    }
    else
    {
      sub_100022D14((uint64_t)&v30);
    }
  }
}

double sub_1000209D0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unint64_t v5;
  char v6;
  double result;

  if (*(_QWORD *)(a2 + 16) && (v5 = sub_1000227E8(a1), (v6 & 1) != 0))
  {
    sub_10001C0B4(*(_QWORD *)(a2 + 56) + 32 * v5, (uint64_t)a3);
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

void *sub_100020A20(void *a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  _QWORD *v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t);
  void *v51;
  id v52;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  char v64[24];
  void **aBlock;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, void *, uint64_t);
  void *v68;
  uint64_t (*v69)(void *, uint64_t);
  _QWORD *v70;

  v14 = type metadata accessor for OSSignpostID(0);
  v62 = *(_QWORD *)(v14 - 8);
  v63 = v14;
  v16 = __chkstk_darwin(v14, v15);
  v61 = (char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16, v18);
  v20 = (char *)&v54 - v19;
  v59 = a1;
  v21 = objc_msgSend(a1, "localIdentifier");
  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(v21);
  v24 = v23;

  v25 = swift_allocObject(&unk_100036720, 24, 7);
  v60 = v25;
  *(_QWORD *)(v25 + 16) = 0;
  v58 = v25 + 16;
  v26 = swift_allocObject(&unk_100036748, 17, 7);
  v54 = v26;
  *(_BYTE *)(v26 + 16) = 0;
  v57 = v26 + 16;
  v55 = objc_msgSend((id)objc_opt_self(PHImageManager), "defaultManager");
  v27 = objc_msgSend(objc_allocWithZone((Class)PHImageRequestOptions), "init");
  objc_msgSend(v27, "setSynchronous:", 1);
  objc_msgSend(v27, "setNetworkAccessAllowed:", 0);
  objc_msgSend(v27, "setNormalizedCropRect:", a2, a3, a4, a5);
  objc_msgSend(v27, "setResizeMode:", 2);
  objc_msgSend(v27, "setDeliveryMode:", 1);
  objc_msgSend(v27, "setLoadingMode:", 6291456);
  if (qword_100038610 != -1)
    swift_once(&qword_100038610, sub_10001E9AC);
  v28 = (id)qword_10003C6A8;
  v29 = OSSignpostID.init(log:)();
  v30 = static os_signpost_type_t.begin.getter(v29);
  v31 = sub_10000B8A0(&qword_100039310);
  v32 = swift_allocObject(v31, 112, 7);
  *(_OWORD *)(v32 + 16) = xmmword_100029220;
  *(_QWORD *)(v32 + 56) = &type metadata for String;
  v33 = sub_10001C058();
  *(_QWORD *)(v32 + 64) = v33;
  *(_QWORD *)(v32 + 32) = v22;
  *(_QWORD *)(v32 + 40) = v24;
  aBlock = *(void ***)&a6;
  v66 = *(_QWORD *)&a7;
  type metadata accessor for CGSize(0);
  v35 = v34;
  swift_bridgeObjectRetain(v24);
  v36 = String.init<A>(describing:)(&aBlock, v35);
  *(_QWORD *)(v32 + 96) = &type metadata for String;
  *(_QWORD *)(v32 + 104) = v33;
  *(_QWORD *)(v32 + 72) = v36;
  *(_QWORD *)(v32 + 80) = v37;
  v38 = v20;
  os_signpost(_:dso:log:name:signpostID:_:_:)(v30, &_mh_execute_header, v28, "RequestLocalImage", 17, 2, v20, "Requesting local image for asset %{public}s with target size %{public}s", 71, 2, v32);
  swift_bridgeObjectRelease(v32);
  v39 = (_QWORD *)swift_allocObject(&unk_1000367C0, 56, 7);
  v39[2] = v56;
  v39[3] = v22;
  v40 = v60;
  v39[4] = v24;
  v39[5] = v40;
  v41 = v54;
  v39[6] = v54;
  v69 = sub_100022DF8;
  v70 = v39;
  aBlock = _NSConcreteStackBlock;
  v66 = 1107296256;
  v67 = sub_10002100C;
  v68 = &unk_1000367D8;
  v42 = _Block_copy(&aBlock);
  v43 = v70;
  v44 = v27;
  swift_retain(v40);
  swift_retain(v41);
  swift_release(v43);
  v45 = v55;
  objc_msgSend(v55, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v59, 1, v44, v42, a6, a7);
  _Block_release(v42);

  v46 = static os_signpost_type_t.end.getter();
  v47 = qword_10003C6A8;
  v48 = v61;
  static OSSignpostID.exclusive.getter();
  os_signpost(_:dso:log:name:signpostID:)(v46, &_mh_execute_header, v47, "RequestLocalImage", 17, 2, v48);

  v49 = v63;
  v50 = *(void (**)(char *, uint64_t))(v62 + 8);
  v50(v48, v63);
  v50(v38, v49);
  swift_beginAccess(v58, &aBlock, 0, 0);
  v51 = *(void **)(v40 + 16);
  swift_beginAccess(v57, v64, 0, 0);
  v52 = v51;
  swift_release(v40);
  swift_release(v41);
  return v51;
}

uint64_t sub_100020ED8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  char v15;
  uint64_t result;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  _BYTE v20[24];

  v11 = a6 + 16;
  sub_100020578(a4, a5, a2);
  v12 = sub_100020550(a1);
  swift_beginAccess(v11, v20, 1, 0);
  v13 = *(void **)(a6 + 16);
  *(_QWORD *)(a6 + 16) = v12;

  if (!a2)
  {
    v18 = 0u;
    v19 = 0u;
    goto LABEL_6;
  }
  *(_QWORD *)&v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(PHImageResultIsInCloudKey);
  *((_QWORD *)&v18 + 1) = v14;
  AnyHashable.init<A>(_:)(v17, &v18, &type metadata for String, &protocol witness table for String);
  sub_1000209D0((uint64_t)v17, a2, &v18);
  sub_100022D54((uint64_t)v17);
  if (!*((_QWORD *)&v19 + 1))
  {
LABEL_6:
    sub_100022D14((uint64_t)&v18);
    goto LABEL_7;
  }
  if (!swift_dynamicCast(v17, &v18, (char *)&type metadata for Any + 8, &type metadata for Bool, 6))
  {
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  v15 = v17[0];
LABEL_8:
  result = swift_beginAccess(a7 + 16, v17, 1, 0);
  *(_BYTE *)(a7 + 16) = v15;
  return result;
}

uint64_t sub_10002100C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  void (*v5)(void *, uint64_t);
  uint64_t v6;
  id v7;

  v5 = *(void (**)(void *, uint64_t))(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  if (a3)
    v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  else
    v6 = 0;
  swift_retain(v4);
  v7 = a2;
  v5(a2, v6);
  swift_release(v4);

  return swift_bridgeObjectRelease(v6);
}

id sub_1000210A0(void *a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  dispatch_semaphore_t v45;
  uint64_t v46;
  void *v47;
  _QWORD *v48;
  id v49;
  NSObject *v50;
  id v51;
  char *v52;
  _QWORD *v53;
  NSObject *v54;
  void (*v55)(char *, uint64_t);
  char *v56;
  void (*v57)(char *, uint64_t);
  char *v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  _QWORD *v62;
  os_log_type_t v63;
  NSObject *v64;
  os_log_type_t v65;
  uint8_t *v66;
  void **v67;
  uint8_t *v68;
  char *v69;
  char v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id *v74;
  _QWORD *v75;
  uint64_t v76;
  id v77;
  os_log_type_t v78;
  NSObject *v79;
  id v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  size_t Width;
  size_t Height;
  uint64_t v86;
  uint64_t v87;
  os_log_type_t v88;
  NSObject *v89;
  os_log_type_t v90;
  _QWORD *v91;
  uint8_t *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  NSObject *v96;
  uint64_t v97;
  char *v98;
  id v99;
  id v100;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  _QWORD *v105;
  dispatch_semaphore_t v106;
  uint64_t v107;
  void *v108;
  char *v109;
  uint64_t v110;
  NSObject *v111;
  void (*v112)(char *, uint64_t);
  char *v113;
  id *v114;
  uint64_t v115;
  char *v116;
  char *v117;
  uint64_t v118;
  id v119;
  uint64_t v120;
  uint64_t v121[3];
  uint64_t v122;
  uint64_t v123;
  void **aBlock;
  uint64_t v125;
  uint64_t (*v126)(uint64_t, void *, uint64_t);
  void *v127;
  void (*v128)(void *, uint64_t);
  _QWORD *v129;

  v112 = (void (*)(char *, uint64_t))type metadata accessor for DispatchTimeInterval(0);
  v111 = *((_QWORD *)v112 - 1);
  __chkstk_darwin(v112, v14);
  v105 = (uint64_t *)((char *)&v102 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v115 = type metadata accessor for DispatchTime(0);
  v110 = *(_QWORD *)(v115 - 8);
  v17 = __chkstk_darwin(v115, v16);
  v109 = (char *)&v102 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v17, v19);
  v116 = (char *)&v102 - v20;
  v104 = type metadata accessor for OSSignpostID(0);
  v103 = *(_QWORD *)(v104 - 8);
  __chkstk_darwin(v104, v21);
  v23 = (char *)&v102 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v108 = a1;
  v24 = objc_msgSend(a1, "localIdentifier");
  v25 = static String._unconditionallyBridgeFromObjectiveC(_:)(v24);
  v27 = v26;

  v28 = swift_allocObject(&unk_100036720, 24, 7);
  v118 = v28;
  *(_QWORD *)(v28 + 16) = 0;
  v114 = (id *)(v28 + 16);
  v119 = objc_msgSend((id)objc_opt_self(PHImageManager), "defaultManager");
  v106 = dispatch_semaphore_create(0);
  if (qword_100038610 != -1)
    swift_once(&qword_100038610, sub_10001E9AC);
  v29 = (id)qword_10003C6A8;
  v30 = OSSignpostID.init(log:)();
  v31 = static os_signpost_type_t.begin.getter(v30);
  v32 = sub_10000B8A0(&qword_100039310);
  v33 = swift_allocObject(v32, 112, 7);
  *(_OWORD *)(v33 + 16) = xmmword_100029220;
  *(_QWORD *)(v33 + 56) = &type metadata for String;
  v34 = sub_10001C058();
  *(_QWORD *)(v33 + 64) = v34;
  *(_QWORD *)(v33 + 32) = v25;
  *(_QWORD *)(v33 + 40) = v27;
  aBlock = *(void ***)&a6;
  v125 = *(_QWORD *)&a7;
  type metadata accessor for CGSize(0);
  v36 = v35;
  swift_bridgeObjectRetain(v27);
  v37 = String.init<A>(describing:)(&aBlock, v36);
  *(_QWORD *)(v33 + 96) = &type metadata for String;
  *(_QWORD *)(v33 + 104) = v34;
  *(_QWORD *)(v33 + 72) = v37;
  *(_QWORD *)(v33 + 80) = v38;
  v113 = v23;
  os_signpost(_:dso:log:name:signpostID:_:_:)(v31, &_mh_execute_header, v29, "RequestNetworkImage", 19, 2, v23, "Requesting cloud image for asset %{public}s with target size %{public}s", 71, 2, v33);
  swift_bridgeObjectRelease(v33);
  v39 = objc_msgSend(objc_allocWithZone((Class)PHImageRequestOptions), "init");
  objc_msgSend(v39, "setSynchronous:", 0);
  objc_msgSend(v39, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v39, "setNormalizedCropRect:", a2, a3, a4, a5);
  objc_msgSend(v39, "setResizeMode:", 2);
  objc_msgSend(v39, "setDeliveryMode:", 0);
  objc_msgSend(v39, "setAllowSecondaryDegradedImage:", 1);
  if (qword_100038618 != -1)
    swift_once(&qword_100038618, sub_10001EA20);
  objc_msgSend(v39, "setResultHandlerQueue:", qword_10003C6B0);
  objc_msgSend(v39, "setDownloadIntent:", 1);
  objc_msgSend(v39, "setLoadingMode:", 6291456);
  v40 = swift_allocObject(&unk_100036748, 17, 7);
  *(_BYTE *)(v40 + 16) = 0;
  v117 = (char *)(v40 + 16);
  v41 = static os_log_type_t.debug.getter(v40);
  v42 = qword_10003C6A8;
  v43 = swift_allocObject(v32, 72, 7);
  *(_OWORD *)(v43 + 16) = xmmword_100029240;
  *(_QWORD *)(v43 + 56) = &type metadata for String;
  *(_QWORD *)(v43 + 64) = v34;
  *(_QWORD *)(v43 + 32) = v25;
  *(_QWORD *)(v43 + 40) = v27;
  swift_bridgeObjectRetain(v27);
  os_log(_:dso:log:_:_:)(v41, &_mh_execute_header, v42, "Spawned background task to load cloud image for asset %{public}s", 64, 2, v43);
  swift_bridgeObjectRelease(v43);
  v44 = (_QWORD *)swift_allocObject(&unk_100036770, 64, 7);
  v44[2] = v107;
  v44[3] = v25;
  v102 = v25;
  v45 = v106;
  v44[4] = v27;
  v44[5] = v45;
  v46 = v118;
  v44[6] = v118;
  v44[7] = v40;
  v128 = sub_100022CEC;
  v129 = v44;
  aBlock = _NSConcreteStackBlock;
  v125 = 1107296256;
  v126 = sub_10002100C;
  v127 = &unk_100036788;
  v47 = _Block_copy(&aBlock);
  v48 = v129;
  swift_bridgeObjectRetain(v27);
  v49 = v39;
  v50 = v45;
  swift_retain(v46);
  v107 = v40;
  swift_retain(v40);
  swift_release(v48);
  v51 = objc_msgSend(v119, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v108, 1, v49, v47, a6, a7);
  _Block_release(v47);

  v52 = v109;
  static DispatchTime.now()();
  v53 = v105;
  *v105 = 10;
  v54 = v111;
  v55 = v112;
  ((void (*)(_QWORD *, _QWORD, void (*)(char *, uint64_t)))v111[13].isa)(v53, enum case for DispatchTimeInterval.seconds(_:), v112);
  v56 = v116;
  + infix(_:_:)(v52, v53);
  ((void (*)(_QWORD *, _QWORD *))v54[1].isa)(v53, v55);
  v57 = *(void (**)(char *, uint64_t))(v110 + 8);
  v58 = v52;
  v59 = v115;
  v57(v58, v115);
  v111 = v50;
  v60 = OS_dispatch_semaphore.wait(timeout:)(v56);
  v61 = static DispatchTimeoutResult.== infix(_:_:)(v60 & 1, 1);
  v62 = (_QWORD *)&loc_100029000;
  if ((v61 & 1) != 0)
  {
    v63 = static os_log_type_t.error.getter(v61);
    v64 = qword_10003C6A8;
    v65 = v63;
    if (os_log_type_enabled((os_log_t)qword_10003C6A8, v63))
    {
      swift_bridgeObjectRetain_n(v27, 2);
      v66 = (uint8_t *)swift_slowAlloc(12, -1);
      v67 = (void **)swift_slowAlloc(32, -1);
      aBlock = v67;
      *(_DWORD *)v66 = 136446210;
      swift_bridgeObjectRetain(v27);
      v122 = sub_100019C88(v102, v27, (uint64_t *)&aBlock);
      v59 = v115;
      v56 = v116;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v122, &v123, v66 + 4, v66 + 12);
      swift_bridgeObjectRelease_n(v27, 3);
      _os_log_impl((void *)&_mh_execute_header, v64, v65, "Timed out loading cloud image for asset %{public}s", v66, 0xCu);
      swift_arrayDestroy(v67, 1);
      swift_slowDealloc(v67, -1, -1);
      v68 = v66;
      v62 = &loc_100029000;
      swift_slowDealloc(v68, -1, -1);
    }
    objc_msgSend(v119, "cancelImageRequest:", v51);
  }
  v69 = v117;
  swift_beginAccess(v117, &aBlock, 0, 0);
  v70 = *v69;
  v112 = v57;
  if ((v70 & 1) != 0)
  {
    v71 = swift_bridgeObjectRelease(v27);
    v72 = v104;
    v73 = v103;
    v74 = v114;
    v75 = (_QWORD *)&unk_10003C000;
  }
  else
  {
    v74 = v114;
    v76 = swift_beginAccess(v114, &v122, 0, 0);
    v75 = &unk_10003C000;
    if (*v74)
    {
      v77 = *v74;
      v78 = static os_log_type_t.error.getter(v77);
      v79 = qword_10003C6A8;
      v80 = v77;
      if (os_log_type_enabled(v79, v78))
      {
        v81 = v80;
        swift_bridgeObjectRetain(v27);
        v80 = v81;
        v82 = swift_slowAlloc(32, -1);
        v83 = swift_slowAlloc(32, -1);
        v121[0] = v83;
        *(_DWORD *)v82 = 136446722;
        swift_bridgeObjectRetain(v27);
        v120 = sub_100019C88(v102, v27, v121);
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v120, v121, v82 + 4, v82 + 12);
        swift_bridgeObjectRelease_n(v27, 3);
        *(_WORD *)(v82 + 12) = 2050;
        Width = CGImageGetWidth((CGImageRef)v80);

        v120 = Width;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v120, v121, v82 + 14, v82 + 22);

        *(_WORD *)(v82 + 22) = 2050;
        Height = CGImageGetHeight((CGImageRef)v80);

        v120 = Height;
        v59 = v115;
        v56 = v116;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v120, v121, v82 + 24, v82 + 32);

        _os_log_impl((void *)&_mh_execute_header, v79, v78, "Using degraded quality for asset %{public}s; variant %{public}ld x %{public}ld",
          (uint8_t *)v82,
          0x20u);
        swift_arrayDestroy(v83, 1);
        v86 = v83;
        v74 = v114;
        swift_slowDealloc(v86, -1, -1);
        v87 = v82;
        v75 = (_QWORD *)&unk_10003C000;
        swift_slowDealloc(v87, -1, -1);
      }
      else
      {
        swift_bridgeObjectRelease(v27);

      }
    }
    else
    {
      v88 = static os_log_type_t.error.getter(v76);
      v89 = qword_10003C6A8;
      v90 = v88;
      if (os_log_type_enabled((os_log_t)qword_10003C6A8, v88))
      {
        swift_bridgeObjectRetain(v27);
        v91 = v62;
        v92 = (uint8_t *)swift_slowAlloc(12, -1);
        v93 = swift_slowAlloc(32, -1);
        v121[0] = v93;
        *(_DWORD *)v92 = v91[426];
        swift_bridgeObjectRetain(v27);
        v120 = sub_100019C88(v102, v27, v121);
        v56 = v116;
        v74 = v114;
        UnsafeMutableRawBufferPointer.copyMemory(from:)(&v120, v121, v92 + 4, v92 + 12);
        swift_bridgeObjectRelease_n(v27, 3);
        _os_log_impl((void *)&_mh_execute_header, v89, v90, "No degraded quality available for asset %{public}s;",
          v92,
          0xCu);
        swift_arrayDestroy(v93, 1);
        v94 = v93;
        v75 = (_QWORD *)&unk_10003C000;
        swift_slowDealloc(v94, -1, -1);
        v71 = swift_slowDealloc(v92, -1, -1);
      }
      else
      {
        v71 = swift_bridgeObjectRelease(v27);
      }
    }
    v72 = v104;
    v73 = v103;
  }
  v95 = v107;
  v96 = v111;
  v97 = static os_signpost_type_t.end.getter(v71);
  v98 = v113;
  os_signpost(_:dso:log:name:signpostID:)(v97, &_mh_execute_header, v75[213], "RequestNetworkImage", 19, 2, v113);

  v112(v56, v59);
  (*(void (**)(char *, uint64_t))(v73 + 8))(v98, v72);
  swift_beginAccess(v74, v121, 0, 0);
  v99 = *v74;
  if (*v74)
    v100 = v99;
  swift_release(v118);
  swift_release(v95);
  return v99;
}

void sub_100021C84(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  os_log_type_t v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  size_t Height;
  os_log_type_t v26;
  NSObject *v27;
  uint8_t *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  os_log_type_t v32;
  NSObject *v33;
  uint8_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38[5];
  __int128 v39;
  __int128 v40;
  _BYTE v41[24];
  _BYTE v42[24];

  sub_100020578(a4, a5, a2);
  if (a1)
  {
    v14 = sub_100020550(a1);
    swift_beginAccess(a7 + 16, v42, 1, 0);
    v15 = *(void **)(a7 + 16);
    *(_QWORD *)(a7 + 16) = v14;

    swift_beginAccess(a7 + 16, v41, 0, 0);
    v16 = *(void **)(a7 + 16);
    if (!v16)
      return;
    if (a2)
    {
      v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(PHImageResultIsDegradedKey);
      v37 = v17;
      v18 = v16;
      AnyHashable.init<A>(_:)(v38, &v36, &type metadata for String, &protocol witness table for String);
      sub_1000209D0((uint64_t)v38, a2, &v39);
      sub_100022D54((uint64_t)v38);
      if (*((_QWORD *)&v40 + 1))
      {
        v19 = swift_dynamicCast(v38, &v39, (char *)&type metadata for Any + 8, &type metadata for Bool, 6);
        if ((_DWORD)v19 && (v38[0] & 1) != 0)
        {
          v20 = static os_log_type_t.debug.getter(v19);
          if (qword_100038610 != -1)
            swift_once(&qword_100038610, sub_10001E9AC);
          v21 = qword_10003C6A8;
          v22 = v18;
          if (os_log_type_enabled(v21, v20))
          {
            swift_bridgeObjectRetain_n(a5, 2);
            v22 = v22;
            v23 = swift_slowAlloc(32, -1);
            v24 = swift_slowAlloc(32, -1);
            v38[0] = v24;
            *(_DWORD *)v23 = 134349570;
            *(_QWORD *)&v39 = CGImageGetWidth((CGImageRef)v22);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, (char *)&v39 + 8, v23 + 4, v23 + 12);
            *(_WORD *)(v23 + 12) = 2050;
            Height = CGImageGetHeight((CGImageRef)v22);

            *(_QWORD *)&v39 = Height;
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, (char *)&v39 + 8, v23 + 14, v23 + 22);

            *(_WORD *)(v23 + 22) = 2082;
            swift_bridgeObjectRetain(a5);
            *(_QWORD *)&v39 = sub_100019C88(a4, a5, v38);
            UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, (char *)&v39 + 8, v23 + 24, v23 + 32);
            swift_bridgeObjectRelease_n(a5, 3);
            _os_log_impl((void *)&_mh_execute_header, v21, v20, "Recieved degraded quality (%{public}ld x %{public}ld) cloud image for asset %{public}s", (uint8_t *)v23, 0x20u);
            swift_arrayDestroy(v24, 1);
            swift_slowDealloc(v24, -1, -1);
            swift_slowDealloc(v23, -1, -1);
          }
          else
          {

          }
          return;
        }
        goto LABEL_18;
      }
    }
    else
    {
      v39 = 0u;
      v40 = 0u;
      v30 = v16;
    }
    sub_100022D14((uint64_t)&v39);
LABEL_18:
    v31 = swift_beginAccess(a8 + 16, v38, 1, 0);
    *(_BYTE *)(a8 + 16) = 1;
    v32 = static os_log_type_t.debug.getter(v31);
    if (qword_100038610 != -1)
      swift_once(&qword_100038610, sub_10001E9AC);
    v33 = qword_10003C6A8;
    if (os_log_type_enabled((os_log_t)qword_10003C6A8, v32))
    {
      swift_bridgeObjectRetain_n(a5, 2);
      v34 = (uint8_t *)swift_slowAlloc(12, -1);
      v35 = swift_slowAlloc(32, -1);
      *(_QWORD *)&v39 = v35;
      *(_DWORD *)v34 = 136446210;
      swift_bridgeObjectRetain(a5);
      v36 = sub_100019C88(a4, a5, (uint64_t *)&v39);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37, v34 + 4, v34 + 12);
      swift_bridgeObjectRelease_n(a5, 3);
      _os_log_impl((void *)&_mh_execute_header, v33, v32, "Recieved final cloud image for asset %{public}s", v34, 0xCu);
      swift_arrayDestroy(v35, 1);
      swift_slowDealloc(v35, -1, -1);
      swift_slowDealloc(v34, -1, -1);
    }
    OS_dispatch_semaphore.signal()();

    return;
  }
  v26 = ((uint64_t (*)(void))static os_log_type_t.debug.getter)();
  if (qword_100038610 != -1)
    swift_once(&qword_100038610, sub_10001E9AC);
  v27 = qword_10003C6A8;
  if (os_log_type_enabled((os_log_t)qword_10003C6A8, v26))
  {
    swift_bridgeObjectRetain_n(a5, 2);
    v28 = (uint8_t *)swift_slowAlloc(12, -1);
    v29 = swift_slowAlloc(32, -1);
    v38[0] = v29;
    *(_DWORD *)v28 = 136446210;
    swift_bridgeObjectRetain(a5);
    *(_QWORD *)&v39 = sub_100019C88(a4, a5, v38);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v39, (char *)&v39 + 8, v28 + 4, v28 + 12);
    swift_bridgeObjectRelease_n(a5, 3);
    _os_log_impl((void *)&_mh_execute_header, v27, v26, "Recieved callback but no cloud image for asset %{public}s", v28, 0xCu);
    swift_arrayDestroy(v29, 1);
    swift_slowDealloc(v29, -1, -1);
    swift_slowDealloc(v28, -1, -1);
  }
  OS_dispatch_semaphore.signal()();
}

void sub_10002222C()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_10000EF04();
  sub_10000ED9C(v0);
  sub_100023414(OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_layoutDescription);
  sub_100023414(OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_asset);
  v1 = sub_1000232C0();
  sub_10000ED9C(v1);
  sub_100023374(OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_title);
  sub_100023374(OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_subtitle);
  sub_100023414(OBJC_IVAR____TtC18PhotosReliveWidget27PhotosReliveWidgetViewModel_image);
  sub_10000EACC();
}

uint64_t sub_1000222A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_10002222C();
  v0 = sub_1000233F4();
  return swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_1000222C0()
{
  return type metadata accessor for PhotosReliveWidgetViewModel(0);
}

uint64_t type metadata accessor for PhotosReliveWidgetViewModel(uint64_t a1)
{
  return sub_10000CE64(a1, qword_1000394B0, (uint64_t)&nominal type descriptor for PhotosReliveWidgetViewModel);
}

uint64_t sub_1000222DC(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  unint64_t v4;
  _QWORD v5[10];

  v5[0] = (char *)&value witness table for Builtin.Int64 + 64;
  result = type metadata accessor for WidgetFamily(319);
  if (v3 <= 0x3F)
  {
    v5[1] = *(_QWORD *)(result - 8) + 64;
    v5[2] = " ";
    v5[3] = &unk_10002A738;
    result = type metadata accessor for URL(319);
    if (v4 <= 0x3F)
    {
      v5[4] = *(_QWORD *)(result - 8) + 64;
      v5[5] = &unk_10002A750;
      v5[6] = &unk_10002A750;
      v5[7] = &unk_10002A738;
      v5[8] = &unk_10002A768;
      v5[9] = &unk_10002A780;
      return swift_updateClassMetadata2(a1, 256, 10, v5, a1 + 80);
    }
  }
  return result;
}

void sub_1000223A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
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
  char v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  sub_100023180(a1, a2, a3, a4, a5, a6, a7, a8);
  v8 = sub_1000231CC();
  sub_100022404(v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, v25, v26,
    v27,
    v28,
    v29,
    v30,
    v31,
    v32,
    v33);
  sub_100023288();
}

uint64_t sub_1000223E4()
{
  return type metadata accessor for PhotosReliveWidgetPlaceholderViewModel(0);
}

uint64_t type metadata accessor for PhotosReliveWidgetPlaceholderViewModel(uint64_t a1)
{
  return sub_10000CE64(a1, qword_1000395A8, (uint64_t)&nominal type descriptor for PhotosReliveWidgetPlaceholderViewModel);
}

void sub_100022404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,__int128 a23,uint64_t a24,uint64_t a25,uint64_t a26)
{
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
  uint64_t v50;
  uint64_t v51;

  sub_10000F0E4();
  v50 = v27;
  v51 = v28;
  v48 = v29;
  v49 = v30;
  v32 = v31;
  v46 = v33;
  v47 = v34;
  v36 = v35;
  v37 = sub_1000232C0();
  v38 = *(_QWORD *)(v37 - 8);
  __chkstk_darwin(v37, v39);
  sub_10001C3EC();
  v42 = v41 - v40;
  v43 = sub_10000EF04();
  v44 = *(_QWORD *)(v43 - 8);
  __chkstk_darwin(v43, v45);
  sub_10001C5B4();
  sub_10000F31C(v26, v36, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v44 + 16));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v42, v32, v37);
  sub_10001F86C(v46, v26, v47, v42, v48, v49, v50, v51, a21, a22, a23, a24, a25, a26);
  (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v32, v37);
  sub_100023350(v36, *(uint64_t (**)(uint64_t, uint64_t))(v44 + 8));
  sub_100023408();
  sub_10000E8C0();
}

uint64_t sub_100022530()
{
  return type metadata accessor for PhotosReliveWidgetFallbackViewModel(0);
}

uint64_t type metadata accessor for PhotosReliveWidgetFallbackViewModel(uint64_t a1)
{
  return sub_10000CE64(a1, qword_1000396A0, (uint64_t)&nominal type descriptor for PhotosReliveWidgetFallbackViewModel);
}

uint64_t sub_10002254C(uint64_t a1)
{
  _BYTE v2[8];

  return swift_updateClassMetadata2(a1, 256, 0, v2, a1 + 168);
}

__n128 sub_100022580(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_100022594(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;
  BOOL v4;

  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 41))
    {
      v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 1);
      v4 = v3 >= 3;
      v2 = v3 - 3;
      if (!v4)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_1000225D0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 1) = a2 + 2;
  }
  return result;
}

void type metadata accessor for PhotosReliveWidgetViewModel.TitleSubtitleLayout()
{
  sub_10000F2E0();
}

void sub_10002262C(id *a1)
{

}

uint64_t sub_100022634(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v4 = v3;
  return a1;
}

uint64_t sub_100022670(uint64_t a1, uint64_t a2)
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
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

__n128 sub_1000226C8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000226D4(uint64_t a1, uint64_t a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t sub_100022718(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_100022758(uint64_t result, int a2, int a3)
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

void type metadata accessor for PhotosReliveWidgetViewModel.LayoutDescription()
{
  sub_10000F2E0();
}

uint64_t sub_1000227A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PhotosReliveWidgetSize(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1000227E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_1000228C8(a1, v4);
}

unint64_t sub_100022818(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  char v5;
  Swift::Int v6;

  v3 = v2;
  v5 = a1 & 1;
  sub_100023380(*(_QWORD *)(v3 + 40), a2);
  Hasher._combine(_:)(a1 & 1);
  v6 = sub_100023320();
  return sub_10002298C(v5, v6);
}

unint64_t sub_10002286C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _BYTE v7[72];

  sub_100023380(*(_QWORD *)(v2 + 40), a2);
  String.hash(into:)(v7, a1, a2);
  v5 = sub_100023320();
  return sub_100022A40(a1, a2, v5);
}

unint64_t sub_1000228C8(uint64_t a1, uint64_t a2)
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
      sub_100022D88(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100022D54((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_10002298C(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (((((a1 & 1) == 0) ^ *(unsigned __int8 *)(v7 + result)) & 1) == 0)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (((((a1 & 1) == 0) ^ *(_BYTE *)(v7 + result)) & 1) != 0)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_100022A40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = v10[1];
    v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0) & 1) == 0)
    {
      v13 = ~v5;
      do
      {
        v6 = (v6 + 1) & v13;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v14 = (_QWORD *)(v9 + 16 * v6);
        v15 = v14[1];
        v16 = *v14 == a1 && v15 == a2;
      }
      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0) & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100022B20(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v4;
  id v5;
  uint64_t v6;

  v4 = String._bridgeToObjectiveC()();
  v5 = objc_msgSend(a3, "uuidFromLocalIdentifier:", v4);

  if (!v5)
    return 0;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v5);

  return v6;
}

uint64_t sub_100022B9C(void *a1, SEL *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, *a2);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);

  return v4;
}

uint64_t sub_100022BF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000B8A0(&qword_100039770);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100022C40(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PhotosReliveWidgetSize(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100022C7C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100022CA0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100022CB0()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));

  swift_release(*(_QWORD *)(v0 + 48));
  swift_release(*(_QWORD *)(v0 + 56));
  return swift_deallocObject(v0, 64, 7);
}

void sub_100022CEC(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_100021C84(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56));
}

uint64_t sub_100022CFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100022D0C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100022D14(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_10000B8A0(&qword_1000392E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100022D54(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_100022D88(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_100022DC4()
{
  _QWORD *v0;

  swift_bridgeObjectRelease(v0[4]);
  swift_release(v0[5]);
  swift_release(v0[6]);
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100022DF8(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_100020ED8(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48));
}

__n128 sub_100022E08(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t sub_100022E1C(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;
  BOOL v4;

  if (a2)
  {
    if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    {
      v2 = *(_DWORD *)a1 + 253;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 1);
      v4 = v3 >= 3;
      v2 = v3 - 3;
      if (!v4)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t sub_100022E58(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 1) = a2 + 2;
  }
  return result;
}

void type metadata accessor for PhotosReliveWidgetViewModel.TitleLayout()
{
  sub_10000F2E0();
}

uint64_t sub_100022EA8(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100022EF4 + 4 * byte_10002A6E5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_100022F28 + 4 * byte_10002A6E0[v4]))();
}

uint64_t sub_100022F28(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100022F30(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100022F38);
  return result;
}

uint64_t sub_100022F44(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100022F4CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_100022F50(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100022F58(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for PhotosReliveWidgetViewModel.TitleLayout.Style()
{
  sub_10000F2E0();
}

uint64_t sub_100022F70(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFC)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 5;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v5 = v6 - 5;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t sub_100022FF8(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100023044 + 4 * byte_10002A6EF[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_100023078 + 4 * byte_10002A6EA[v4]))();
}

uint64_t sub_100023078(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100023080(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100023088);
  return result;
}

uint64_t sub_100023094(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10002309CLL);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1000230A0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000230A8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for PhotosReliveWidgetViewModel.TitleLayout.Position()
{
  sub_10000F2E0();
}

void sub_1000230C0()
{
  sub_10000E4AC(&qword_1000397A8, &qword_1000397B0);
}

unint64_t sub_1000230F0()
{
  unint64_t result;

  result = qword_1000397B8;
  if (!qword_1000397B8)
  {
    result = swift_getWitnessTable(&unk_10002A8F0, &unk_100036998);
    atomic_store(result, (unint64_t *)&qword_1000397B8);
  }
  return result;
}

unint64_t sub_100023130()
{
  unint64_t result;

  result = qword_1000397C0;
  if (!qword_1000397C0)
  {
    result = swift_getWitnessTable(&unk_10002A958, &unk_100036908);
    atomic_store(result, (unint64_t *)&qword_1000397C0);
  }
  return result;
}

uint64_t sub_100023180(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)(v9 - 96) = a8;
  return swift_allocObject(v8, *(unsigned int *)(v8 + 48), *(unsigned __int16 *)(v8 + 52));
}

uint64_t sub_1000231CC()
{
  uint64_t v0;

  return v0;
}

__n128 sub_10002320C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __n128 result;

  sub_1000223A8(a1, a2, a3, a4, a5, a6, a7, a8);
  return result;
}

void sub_100023238()
{
  uint64_t v0;

}

double sub_100023244()
{
  return 0.0;
}

uint64_t sub_100023268()
{
  uint64_t v0;
  uint64_t v1;

  return dispatch thunk of RawRepresentable.rawValue.getter(v0, v1);
}

void sub_100023274(uint64_t a1@<X8>)
{

}

uint64_t sub_10002327C()
{
  uint64_t v0;

  return swift_release(*(_QWORD *)(v0 - 280));
}

uint64_t sub_1000232A4(uint64_t a1)
{
  uint64_t v1;

  *(_OWORD *)(v1 - 120) = 0u;
  *(_OWORD *)(v1 - 104) = 0u;
  *(_BYTE *)(v1 - 88) = 0;
  return swift_allocObject(a1, *(unsigned int *)(a1 + 48), *(unsigned __int16 *)(a1 + 52));
}

uint64_t sub_1000232C0()
{
  return type metadata accessor for URL(0);
}

uint64_t sub_1000232C8()
{
  uint64_t v0;

  return *(_QWORD *)(v0 - 384);
}

uint64_t sub_1000232E8()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_1000232F0()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_1000232F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t sub_100023300()
{
  uint64_t v0;

  return swift_bridgeObjectRelease(v0);
}

uint64_t sub_100023308(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return UnsafeMutableRawBufferPointer.copyMemory(from:)(a1, a2, v4, a4);
}

uint64_t sub_100023310(uint64_t a1, SEL *a2)
{
  void *v2;

  return sub_100022B9C(v2, a2);
}

id sub_100023318(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

Swift::Int sub_100023320()
{
  return Hasher._finalize()();
}

uint64_t sub_100023328(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;
  uint64_t v4;

  return sub_100019C88(*(_QWORD *)(v4 - 272), v3, a3);
}

uint64_t sub_100023338()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_100023350@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_100023358@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t sub_100023360()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_100023374@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return swift_bridgeObjectRelease(*(_QWORD *)(v1 + a1 + 8));
}

_QWORD *sub_100023380(uint64_t a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  return Hasher.init(_seed:)((uint64_t *)va, a1);
}

NSString sub_100023388()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_1000233A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return _assertionFailure(_:_:file:line:flags:)(a1, a2, a3, a4, a5, a6, 52, 2);
}

uint64_t sub_1000233B4()
{
  uint64_t v0;

  return swift_bridgeObjectRelease_n(v0, 3);
}

uint64_t sub_1000233C0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t);

  return v4(v3, a2, v2);
}

uint64_t sub_1000233CC()
{
  uint64_t v0;
  uint64_t v1;

  return dispatch thunk of RawRepresentable.rawValue.getter(v0, v1);
}

uint64_t sub_1000233D8()
{
  uint64_t v0;

  return sub_100022C40(v0);
}

void sub_1000233E0()
{
  uint64_t v0;

}

unint64_t sub_1000233E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 - 112);
  *(_QWORD *)(v1 - 96) = v0;
  *(_QWORD *)(v1 - 88) = v2;
  return sub_10000CB8C();
}

uint64_t sub_1000233F4()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_100023408()
{
  uint64_t v0;

  return v0;
}

void sub_100023414(uint64_t a1@<X8>)
{
  uint64_t v1;

}

Swift::Double __swiftcall Double.init(hours:)(Swift::Int hours)
{
  return _sSd18PhotosReliveWidgetE5hoursS2d_tcfC_0((double)hours);
}

Swift::Double __swiftcall Double.init(minutes:)(Swift::Int minutes)
{
  return _sSd18PhotosReliveWidgetE7minutesS2d_tcfC_0((double)minutes);
}

double Double.minutes.getter(double a1)
{
  return a1 / 60.0;
}

double Double.hours.getter(double a1)
{
  return a1 / 60.0 / 60.0;
}

double _sSd18PhotosReliveWidgetE5hoursS2d_tcfC_0(double a1)
{
  return a1 * 60.0 * 60.0;
}

double _sSd18PhotosReliveWidgetE7minutesS2d_tcfC_0(double a1)
{
  return a1 * 60.0;
}

uint64_t sub_10002347C()
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
  uint64_t v10;

  v0 = sub_10000B8A0(&qword_100039458);
  __chkstk_darwin(v0, v1);
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v4, v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_10000CE10(v8, qword_10003C700);
  sub_10000CDF8(v8, (uint64_t)qword_10003C700);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000019, 0x800000010002C150);
  sub_10000BA28((uint64_t)v3, 1, 1, v4);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v7, v3);
}

uint64_t sub_100023588()
{
  uint64_t v0;

  if (qword_100038620 != -1)
    swift_once(&qword_100038620, sub_10002347C);
  v0 = type metadata accessor for TypeDisplayRepresentation(0);
  return sub_10000CDF8(v0, (uint64_t)qword_10003C700);
}

uint64_t sub_1000235D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v0 = sub_10000B8A0(&qword_100039830);
  v1 = sub_10000B8A0(&qword_100039838);
  v2 = swift_allocObject(v0, ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80))+ *(_QWORD *)(*(_QWORD *)(v1 - 8) + 72), *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) | 7);
  *(_OWORD *)(v2 + 16) = xmmword_100029240;
  DisplayRepresentation.init(stringLiteral:)(0x6D75626C41, 0xE500000000000000);
  v3 = type metadata accessor for DisplayRepresentation(0);
  sub_100023B70();
  result = Dictionary.init(dictionaryLiteral:)(v2, &type metadata for PhotosReliveWidgetType, v3);
  qword_10003C718 = result;
  return result;
}

uint64_t *sub_100023680()
{
  if (qword_100038628 != -1)
    swift_once(&qword_100038628, sub_1000235D0);
  return &qword_10003C718;
}

BOOL sub_1000236C0(Swift::String string)
{
  void *object;
  Swift::String v2;
  Swift::Int v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000355B8, v2);
  swift_bridgeObjectRelease(object);
  return v3 != 0;
}

uint64_t sub_100023704()
{
  return 0x6D75626C61;
}

unint64_t sub_10002371C()
{
  unint64_t result;

  result = qword_1000397C8;
  if (!qword_1000397C8)
  {
    result = swift_getWitnessTable(&unk_10002A99C, &type metadata for PhotosReliveWidgetType);
    atomic_store(result, (unint64_t *)&qword_1000397C8);
  }
  return result;
}

Swift::Int sub_10002375C()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  String.hash(into:)(v1, 0x6D75626C61, 0xE500000000000000);
  return Hasher._finalize()();
}

uint64_t sub_1000237AC(uint64_t a1)
{
  return String.hash(into:)(a1, 0x6D75626C61, 0xE500000000000000);
}

Swift::Int sub_1000237C4(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  String.hash(into:)(v2, 0x6D75626C61, 0xE500000000000000);
  return Hasher._finalize()();
}

BOOL sub_10002380C@<W0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  _BOOL8 result;

  result = sub_1000236C0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100023840@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_100023704();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100023868()
{
  unint64_t result;

  result = qword_1000397D0;
  if (!qword_1000397D0)
  {
    result = swift_getWitnessTable(&unk_10002AA7C, &type metadata for PhotosReliveWidgetType);
    atomic_store(result, (unint64_t *)&qword_1000397D0);
  }
  return result;
}

unint64_t sub_1000238A8()
{
  unint64_t result;

  result = qword_1000397D8;
  if (!qword_1000397D8)
  {
    result = swift_getWitnessTable(&unk_10002AAB4, &type metadata for PhotosReliveWidgetType);
    atomic_store(result, (unint64_t *)&qword_1000397D8);
  }
  return result;
}

unint64_t sub_1000238E8()
{
  unint64_t result;

  result = qword_1000397E0;
  if (!qword_1000397E0)
  {
    result = swift_getWitnessTable(&unk_10002AA04, &type metadata for PhotosReliveWidgetType);
    atomic_store(result, (unint64_t *)&qword_1000397E0);
  }
  return result;
}

void *sub_100023924()
{
  return &protocol witness table for String;
}

unint64_t sub_100023934()
{
  unint64_t result;

  result = qword_1000397E8;
  if (!qword_1000397E8)
  {
    result = swift_getWitnessTable(&unk_10002AAE4, &type metadata for PhotosReliveWidgetType);
    atomic_store(result, (unint64_t *)&qword_1000397E8);
  }
  return result;
}

unint64_t sub_100023974()
{
  unint64_t result;

  result = qword_1000397F0;
  if (!qword_1000397F0)
  {
    result = swift_getWitnessTable(&unk_10002AB0C, &type metadata for PhotosReliveWidgetType);
    atomic_store(result, (unint64_t *)&qword_1000397F0);
  }
  return result;
}

unint64_t sub_1000239B4()
{
  unint64_t result;

  result = qword_1000397F8;
  if (!qword_1000397F8)
  {
    result = swift_getWitnessTable(&unk_10002AB34, &type metadata for PhotosReliveWidgetType);
    atomic_store(result, (unint64_t *)&qword_1000397F8);
  }
  return result;
}

unint64_t sub_1000239F4()
{
  unint64_t result;

  result = qword_100039800;
  if (!qword_100039800)
  {
    result = swift_getWitnessTable(&unk_10002AB8C, &type metadata for PhotosReliveWidgetType);
    atomic_store(result, (unint64_t *)&qword_100039800);
  }
  return result;
}

uint64_t sub_100023A34@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100023588();
  v3 = type metadata accessor for TypeDisplayRepresentation(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v2, v3);
}

uint64_t sub_100023A74(uint64_t a1, uint64_t a2)
{
  _QWORD v3[2];

  v3[0] = a2;
  v3[1] = sub_10001E03C();
  return swift_getOpaqueTypeConformance2(v3, &opaque type descriptor for <<opaque return type of static AppEnum.defaultResolverSpecification>>, 1);
}

uint64_t sub_100023AB4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001E03C();
  return static AppEnum.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100023AF0()
{
  unint64_t result;

  result = qword_100039808;
  if (!qword_100039808)
  {
    result = swift_getWitnessTable(&unk_10002ABCC, &type metadata for PhotosReliveWidgetType);
    atomic_store(result, (unint64_t *)&qword_100039808);
  }
  return result;
}

unint64_t sub_100023B30()
{
  unint64_t result;

  result = qword_100039810;
  if (!qword_100039810)
  {
    result = swift_getWitnessTable(&unk_10002ABF4, &type metadata for PhotosReliveWidgetType);
    atomic_store(result, (unint64_t *)&qword_100039810);
  }
  return result;
}

unint64_t sub_100023B70()
{
  unint64_t result;

  result = qword_100039818;
  if (!qword_100039818)
  {
    result = swift_getWitnessTable(&unk_10002A9C4, &type metadata for PhotosReliveWidgetType);
    atomic_store(result, (unint64_t *)&qword_100039818);
  }
  return result;
}

uint64_t sub_100023BAC()
{
  sub_100023680();
  return swift_bridgeObjectRetain(qword_10003C718);
}

uint64_t sub_100023BC8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_1000239F4();
  return CaseDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

unint64_t sub_100023C04()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100039820;
  if (!qword_100039820)
  {
    v1 = sub_10000B978(&qword_100039828);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100039820);
  }
  return result;
}

void sub_100023C48(_QWORD *a1@<X8>)
{
  *a1 = &off_1000355F0;
}

uint64_t getEnumTagSinglePayload for PhotosReliveWidgetType(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PhotosReliveWidgetType(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_100023CEC + 4 * byte_10002A990[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_100023D0C + 4 * byte_10002A995[v4]))();
}

_BYTE *sub_100023CEC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_100023D0C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100023D14(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100023D1C(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_100023D24(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_100023D2C(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_100023D38()
{
  return 0;
}

ValueMetadata *type metadata accessor for PhotosReliveWidgetType()
{
  return &type metadata for PhotosReliveWidgetType;
}

unint64_t sub_100023D54()
{
  unint64_t result;

  result = qword_100039840;
  if (!qword_100039840)
  {
    result = swift_getWitnessTable(&unk_10002AC8C, &type metadata for PhotosReliveWidgetAlbum.PhotoReliveWidgetAlbumOptionsProvider);
    atomic_store(result, (unint64_t *)&qword_100039840);
  }
  return result;
}

uint64_t sub_100023D90()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 8);
  swift_bridgeObjectRetain(*(_QWORD *)(v0 + 16));
  return v1;
}

uint64_t sub_100023DBC()
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
  uint64_t v10;

  v0 = sub_10000B8A0(&qword_100039458);
  __chkstk_darwin(v0, v1);
  v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for LocalizedStringResource(0);
  __chkstk_darwin(v4, v5);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TypeDisplayRepresentation(0);
  sub_10000CE10(v8, qword_10003C720);
  sub_10000CDF8(v8, (uint64_t)qword_10003C720);
  LocalizedStringResource.init(stringLiteral:)(0xD00000000000001ALL, 0x800000010002C170);
  sub_10000BA28((uint64_t)v3, 1, 1, v4);
  return TypeDisplayRepresentation.init(name:numericFormat:)(v7, v3);
}

uint64_t sub_100023EC8()
{
  uint64_t v0;

  if (qword_100038630 != -1)
    swift_once(&qword_100038630, sub_100023DBC);
  v0 = type metadata accessor for TypeDisplayRepresentation(0);
  return sub_10000CDF8(v0, (uint64_t)qword_10003C720);
}

BOOL sub_100023F10(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_100023F20(uint64_t a1, char a2)
{
  Hasher._combine(_:)(a2 & 1);
}

Swift::Int sub_100023F44(char a1)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(a1 & 1);
  return Hasher._finalize()();
}

BOOL sub_100023F88(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_100023F10(*a1, *a2);
}

Swift::Int sub_100023F94()
{
  char *v0;

  return sub_100023F44(*v0);
}

void sub_100023F9C(uint64_t a1)
{
  char *v1;

  sub_100023F20(a1, *v1);
}

uint64_t sub_100023FA4()
{
  uint64_t result;

  sub_10001BB44(0, &qword_100039208, OS_os_log_ptr);
  result = OS_os_log.init(subsystem:category:)(0xD00000000000002ALL, 0x800000010002C1D0, 0xD00000000000001FLL, 0x800000010002C200);
  qword_10003C738 = result;
  return result;
}

uint64_t sub_100024018(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[2] = a1;
  v2 = sub_10000B8A0(qword_100039888);
  v1[3] = v2;
  v3 = *(_QWORD *)(v2 - 8);
  v1[4] = v3;
  v1[5] = sub_100027804(v3);
  return sub_100027814((uint64_t)sub_100024068, 0, 0);
}

uint64_t sub_100024068()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(v0 + 32);
  v1 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD **)(v0 + 16);
  v3 = *(_QWORD *)(v0 + 24);
  sub_1000240F0(v1);
  v5 = IntentItemCollection.items.getter(v3);
  sub_100027854(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  swift_bridgeObjectRetain(v4);
  v6 = sub_100024D48(v5, v4);
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v6);
}

uint64_t sub_1000240F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  char *v16;
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
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  id v36;
  void *v37;
  uint64_t v38;
  _QWORD *v39;
  int v40;
  uint64_t v41;
  char v42;
  int v43;
  unint64_t v44;
  uint64_t v45;
  char *v46;
  char *v47;
  int64_t v48;
  unint64_t *v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  id v55;
  void *v56;
  _QWORD *v57;
  char *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t *v63;
  unint64_t v64;
  char v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v77;
  char v78;
  __n128 v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void (*v87)(char *, char *, uint64_t);
  char *v88;
  unint64_t v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  unint64_t v95;
  char **v96;
  uint64_t v97;
  char *v98;
  char *v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  void *v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t v111;
  unint64_t v112;
  unint64_t v113;
  unint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  char *v119;
  char *v120;
  unint64_t v121;
  unsigned int v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  _QWORD *v129;
  char *v130;
  uint64_t v131;
  uint64_t v132;
  char *v133;
  char *v134;
  _QWORD *v135;
  unint64_t v136;
  char *v137;
  int v138;
  char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  char *v143;
  int64_t v144;
  char *v145;
  uint64_t v146;
  uint64_t v147;
  unint64_t v148;
  int v149;
  unint64_t *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;

  v116 = a1;
  v1 = sub_10000B8A0(&qword_100039458);
  __chkstk_darwin(v1, v2);
  v115 = (uint64_t)&v111 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v124 = sub_10000B8A0(&qword_1000392C8);
  v123 = *(_QWORD *)(v124 - 8);
  __chkstk_darwin(v124, v4);
  v134 = (char *)&v111 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v126 = type metadata accessor for LocalizedStringResource.BundleDescription(0);
  v125 = *(_QWORD *)(v126 - 8);
  __chkstk_darwin(v126, v6);
  v8 = (char *)&v111 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for Locale(0);
  __chkstk_darwin(v9, v10);
  v12 = (char *)&v111 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for String.LocalizationValue(0);
  __chkstk_darwin(v13, v14);
  v16 = (char *)&v111 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v132 = type metadata accessor for UUID(0);
  v131 = *(_QWORD *)(v132 - 8);
  __chkstk_darwin(v132, v17);
  v130 = (char *)&v111 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = type metadata accessor for LocalizedStringResource(0);
  v20 = *(_QWORD *)(v19 - 8);
  v22 = __chkstk_darwin(v19, v21);
  v133 = (char *)&v111 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22, v24);
  v139 = (char *)&v111 - v25;
  v26 = sub_10000B8A0(&qword_100039910);
  __chkstk_darwin(v26, v27);
  v29 = (char *)&v111 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v141 = sub_10000B8A0(&qword_1000392C0);
  v146 = *(_QWORD *)(v141 - 8);
  v31 = __chkstk_darwin(v141, v30);
  v145 = (char *)&v111 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v31, v33);
  v143 = (char *)&v111 - v34;
  v35 = objc_msgSend((id)objc_opt_self(PLPhotoLibrary), "systemPhotoLibraryIsObtainable");
  if ((v35 & 1) == 0)
  {
    v56 = (void *)static os_log_type_t.error.getter(v35);
    if (qword_100038638 != -1)
      goto LABEL_61;
    goto LABEL_58;
  }
  v36 = sub_100015940();
  if (v36)
  {
    v37 = v36;
    v39 = sub_100025234(v36);
    v40 = 0;
    v41 = 0;
    v140 = PXFavoritesAlbumWidgetIdentifier;
    v122 = enum case for LocalizedStringResource.BundleDescription.main(_:);
    v114 = 0x800000010002C250;
    v112 = (unint64_t)&unk_10002AF60;
    v121 = 0x800000010002AF60;
    v113 = 0x800000010002C270;
    v136 = 0x800000010002C1B0;
    v135 = &_swiftEmptyArrayStorage;
    v128 = v19;
    v120 = v8;
    v119 = v12;
    v118 = v20;
    v117 = v16;
    v127 = v37;
    v137 = v29;
    v129 = v39;
    while (1)
    {
      v42 = v40;
      if (v39[2])
        break;
LABEL_55:
      v40 = 1;
      v41 = &_mh_execute_header.magic + 1;
      if ((v42 & 1) != 0)
      {
        swift_bridgeObjectRelease(v39);
        v106 = String.LocalizationValue.init(stringLiteral:)(0xD000000000000021, 0x800000010002C220);
        static Locale.current.getter(v106);
        (*(void (**)(char *, _QWORD, uint64_t))(v125 + 104))(v8, v122, v126);
        v107 = v139;
        LocalizedStringResource.init(_:table:locale:bundle:comment:)(v16, 0xD000000000000012, v112 | 0x8000000000000000, v12, v8, 0, 0, 256);
        v108 = v115;
        (*(void (**)(uint64_t, char *, uint64_t))(v20 + 16))(v115, v107, v19);
        sub_10000BA28(v108, 0, 1, v19);
        v109 = sub_100026874();
        IntentItemCollection.init(promptLabel:usesIndexedCollation:sections:)(v108, 0, v135, &type metadata for PhotosReliveWidgetAlbum, v109);

        return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v107, v19);
      }
    }
    v138 = v40;
    v43 = *((unsigned __int8 *)&off_100035618 + v41 + 32);
    v44 = sub_100022818(*((_BYTE *)&off_100035618 + v41 + 32), v38);
    if ((v38 & 1) == 0)
    {
LABEL_54:
      v42 = v138;
      goto LABEL_55;
    }
    v45 = v20;
    v46 = v12;
    v47 = v8;
    v48 = *(_QWORD *)(v39[7] + 8 * v44);
    swift_bridgeObjectRetain(v48);
    v49 = sub_1000255D8((char)v37, v43, v48);
    v149 = v43;
    v144 = v48;
    v150 = v49;
    if (!((unint64_t)v48 >> 62))
    {
      v50 = v43;
      v51 = *(_QWORD *)((v48 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain(v48);
      swift_bridgeObjectRetain(v49);
      if (v51)
        goto LABEL_8;
      goto LABEL_42;
    }
    if (v48 < 0)
      v93 = v48;
    else
      v93 = v48 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v48);
    swift_bridgeObjectRetain(v49);
    v94 = v93;
    v50 = v149;
    v51 = _CocoaArrayWrapper.endIndex.getter(v94);
    if (!v51)
    {
LABEL_42:
      v8 = v47;
      v63 = v150;
      swift_bridgeObjectRelease(v150);
      v53 = &_swiftEmptyArrayStorage;
      v12 = v46;
      v20 = v45;
      v19 = v128;
LABEL_43:
      swift_bridgeObjectRelease(v63);
      swift_bridgeObjectRelease_n(v144, 2);
      if (v53[2])
      {
        if ((v50 & 1) != 0)
        {
          v95 = 0xD00000000000001DLL;
          v96 = (char **)&v146;
        }
        else
        {
          v95 = 0xD00000000000001ELL;
          v96 = &v145;
        }
        v97 = String.LocalizationValue.init(stringLiteral:)(v95, *(v96 - 32));
        static Locale.current.getter(v97);
        (*(void (**)(char *, _QWORD, uint64_t))(v125 + 104))(v8, v122, v126);
        v98 = v133;
        LocalizedStringResource.init(_:table:locale:bundle:comment:)(v16, 0xD000000000000012, v121, v12, v8, 0, 0, 256);
        v99 = v139;
        (*(void (**)(char *, char *, uint64_t))(v20 + 16))(v139, v98, v19);
        v100 = sub_100026874();
        IntentItemSection.init(_:items:)(v99, v53, &type metadata for PhotosReliveWidgetAlbum, v100);
        if ((swift_isUniquelyReferenced_nonNull_native(v135) & 1) == 0)
          v135 = (_QWORD *)sub_100027138(0, v135[2] + 1, 1, (uint64_t)v135, &qword_100039918, &qword_1000392C8, (void (*)(uint64_t, uint64_t, unint64_t))sub_1000197D0);
        v37 = v127;
        v102 = v135[2];
        v101 = v135[3];
        if (v102 >= v101 >> 1)
          v135 = (_QWORD *)sub_100027138(v101 > 1, v102 + 1, 1, (uint64_t)v135, &qword_100039918, &qword_1000392C8, (void (*)(uint64_t, uint64_t, unint64_t))sub_1000197D0);
        v103 = v135;
        v135[2] = v102 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v123 + 32))((unint64_t)v103+ ((*(unsigned __int8 *)(v123 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v123 + 80))+ *(_QWORD *)(v123 + 72) * v102, v134, v124);
        (*(void (**)(char *, uint64_t))(v20 + 8))(v133, v19);
      }
      else
      {
        swift_bridgeObjectRelease(v53);
        v37 = v127;
      }
      v39 = v129;
      goto LABEL_54;
    }
LABEL_8:
    v19 = v144;
    v147 = v51;
    v148 = v144 & 0xC000000000000001;
    v52 = 4;
    v53 = &_swiftEmptyArrayStorage;
    v54 = v141;
    while (1)
    {
      if (v148)
        v55 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v52 - 4, v19);
      else
        v55 = *(id *)(v19 + 8 * v52);
      v56 = v55;
      if (__OFADD__(v52 - 4, 1))
      {
        __break(1u);
LABEL_61:
        swift_once(&qword_100038638, sub_100023FA4);
LABEL_58:
        os_log(_:dso:log:_:_:)(v56, &_mh_execute_header, qword_10003C738, "Photo library is not obtainable", 31, 2, &_swiftEmptyArrayStorage);
        break;
      }
      v151 = v52 - 3;
      v57 = v53;
      v58 = v29;
      v59 = objc_msgSend(v55, "localIdentifier");
      v60 = static String._unconditionallyBridgeFromObjectiveC(_:)(v59);
      v62 = v61;

      v63 = v150;
      if (v150[2] && (v64 = sub_10002286C(v60, v62), (v65 & 1) != 0))
      {
        v66 = (uint64_t *)(v63[7] + 16 * v64);
        v68 = *v66;
        v67 = v66[1];
        swift_bridgeObjectRetain(v67);
        swift_bridgeObjectRelease(v62);
        v69 = sub_1000275AC(v56);
        if (v70)
        {
          v71 = v70;
          v142 = v69;
          sub_10000B8A0(&qword_100039900);
          swift_bridgeObjectRetain(v67);
          v72 = v139;
          LocalizedStringResource.init(stringLiteral:)(0xD000000000000011, v136);
          v73 = EntityProperty<>.init(title:)(v72);
          v74 = static String._unconditionallyBridgeFromObjectiveC(_:)(v140);
          if (v68 == v74 && v67 == v75)
          {
            swift_bridgeObjectRelease_n(v67, 2);
            v53 = v57;
          }
          else
          {
            v77 = v75;
            v78 = _stringCompareWithSmolCheck(_:_:expecting:)(v68, v67, v74, v75, 0);
            swift_bridgeObjectRelease(v67);
            v79 = swift_bridgeObjectRelease(v77);
            v53 = v57;
            if ((v78 & 1) == 0)
            {
              v80 = v130;
              v81 = UUID.init()(v79);
              v82 = UUID.uuidString.getter(v81);
              v84 = v83;
              (*(void (**)(char *, uint64_t))(v131 + 8))(v80, v132);
              v152 = v82;
              v153 = v84;
LABEL_36:
              EntityProperty.wrappedValue.setter(&v152);
              v86 = v151;
              v152 = v73;
              v153 = v68;
              v154 = v67;
              v155 = v142;
              v156 = v71;
              v92 = sub_100026874();
              v29 = v137;
              IntentItem.init(_:)(&v152, &type metadata for PhotosReliveWidgetAlbum, v92);
              v85 = 0;
              v54 = v141;
              v19 = v144;
              v63 = v150;
              goto LABEL_24;
            }
          }
          v152 = static String._unconditionallyBridgeFromObjectiveC(_:)(v140);
          v153 = v91;
          goto LABEL_36;
        }
        swift_bridgeObjectRelease(v67);
        v85 = 1;
        v54 = v141;
        v63 = v150;
      }
      else
      {
        swift_bridgeObjectRelease(v62);
        v85 = 1;
      }
      v29 = v58;
      v53 = v57;
      v86 = v151;
LABEL_24:
      sub_10000BA28((uint64_t)v29, v85, 1, v54);

      if (sub_10000BA0C((uint64_t)v29, 1, v54) == 1)
      {
        sub_100027624((uint64_t)v29, &qword_100039910);
      }
      else
      {
        v87 = *(void (**)(char *, char *, uint64_t))(v146 + 32);
        v88 = v143;
        v87(v143, v29, v54);
        v87(v145, v88, v54);
        if ((swift_isUniquelyReferenced_nonNull_native(v53) & 1) == 0)
          v53 = (_QWORD *)sub_100027138(0, v53[2] + 1, 1, (uint64_t)v53, &qword_1000392D8, &qword_1000392C0, (void (*)(uint64_t, uint64_t, unint64_t))sub_1000197DC);
        v90 = v53[2];
        v89 = v53[3];
        if (v90 >= v89 >> 1)
          v53 = (_QWORD *)sub_100027138(v89 > 1, v90 + 1, 1, (uint64_t)v53, &qword_1000392D8, &qword_1000392C0, (void (*)(uint64_t, uint64_t, unint64_t))sub_1000197DC);
        v53[2] = v90 + 1;
        v87((char *)v53+ ((*(unsigned __int8 *)(v146 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v146 + 80))+ *(_QWORD *)(v146 + 72) * v90, v145, v54);
        v19 = v144;
      }
      ++v52;
      v50 = v149;
      if (v86 == v147)
      {
        swift_bridgeObjectRelease(v63);
        v19 = v128;
        v8 = v120;
        v12 = v119;
        v20 = v118;
        v16 = v117;
        goto LABEL_43;
      }
    }
  }
  v104 = v115;
  sub_10000BA28(v115, 1, 1, v19);
  v105 = sub_100026874();
  return IntentItemCollection.init(promptLabel:usesIndexedCollation:sections:)(v104, 0, &_swiftEmptyArrayStorage, &type metadata for PhotosReliveWidgetAlbum, v105);
}

uint64_t sub_100024D48(uint64_t result, _QWORD *a2)
{
  uint64_t v3;
  unint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v24;
  unint64_t v25;
  _QWORD *v26;
  uint64_t *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v3 = result;
  v33 = *(_QWORD *)(result + 16);
  if (v33)
  {
    v4 = 0;
    v29 = result + 32;
    v27 = a2 + 9;
    v5 = &_swiftEmptyArrayStorage;
    v32 = result;
    while (1)
    {
      v28 = v5;
      while (1)
      {
        if (v4 >= *(_QWORD *)(v3 + 16))
          goto LABEL_37;
        v6 = v4++;
        v7 = a2[2];
        if (!v7)
          goto LABEL_26;
        v8 = (uint64_t *)(v29 + 40 * v6);
        v9 = v8[1];
        v10 = v8[2];
        v30 = v8[3];
        v31 = *v8;
        v11 = v8[4];
        v12 = a2[4];
        v13 = a2[5];
        if (v12 == v9 && v13 == v10)
          break;
        result = _stringCompareWithSmolCheck(_:_:expecting:)(v12, v13, v9, v10, 0);
        if ((result & 1) != 0)
          break;
        if (v7 != 1)
        {
          v15 = a2[6];
          v16 = a2[7];
          if (v15 == v9 && v16 == v10)
            break;
          result = _stringCompareWithSmolCheck(_:_:expecting:)(v15, v16, v9, v10, 0);
          if ((result & 1) != 0)
            break;
          if (v7 != 2)
          {
            v18 = v27;
            v19 = 2;
            while (1)
            {
              v20 = v19 + 1;
              if (__OFADD__(v19, 1))
                break;
              v21 = *(v18 - 1);
              v22 = *v18;
              if (v21 == v9 && v22 == v10)
                goto LABEL_28;
              result = _stringCompareWithSmolCheck(_:_:expecting:)(v21, v22, v9, v10, 0);
              if ((result & 1) != 0)
                goto LABEL_28;
              v18 += 2;
              ++v19;
              if (v20 == v7)
                goto LABEL_26;
            }
            __break(1u);
LABEL_37:
            __break(1u);
            return result;
          }
        }
LABEL_26:
        v3 = v32;
        if (v4 == v33)
        {
          v5 = v28;
          goto LABEL_35;
        }
      }
LABEL_28:
      swift_retain(v31);
      swift_bridgeObjectRetain(v10);
      swift_bridgeObjectRetain(v11);
      v5 = v28;
      result = swift_isUniquelyReferenced_nonNull_native(v28);
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_10001A4C0(0, v28[2] + 1, 1);
        v5 = v28;
      }
      v25 = v5[2];
      v24 = v5[3];
      if (v25 >= v24 >> 1)
      {
        result = (uint64_t)sub_10001A4C0((char *)(v24 > 1), v25 + 1, 1);
        v5 = v28;
      }
      v5[2] = v25 + 1;
      v26 = &v5[5 * v25];
      v3 = v32;
      v26[4] = v31;
      v26[5] = v9;
      v26[6] = v10;
      v26[7] = v30;
      v26[8] = v11;
      if (v4 == v33)
        goto LABEL_35;
    }
  }
  v5 = &_swiftEmptyArrayStorage;
LABEL_35:
  swift_bridgeObjectRelease(a2);
  swift_bridgeObjectRelease(v3);
  return (uint64_t)v5;
}

uint64_t sub_100024F7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  char *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t countAndFlagsBits;
  uint64_t v18;
  Swift::String v19;
  Swift::String v20;
  unint64_t v21;
  char v22;
  __n128 v23;
  void (*v24)(char *, char *, uint64_t, __n128);
  _QWORD *v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD v28[2];
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  Swift::String v36;
  Swift::String v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;

  v33 = a2;
  v34 = a3;
  v5 = sub_10000B8A0(&qword_1000392C0);
  v6 = *(_QWORD *)(v5 - 8);
  v8 = __chkstk_darwin(v5, v7);
  v32 = (char *)v28 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = __chkstk_darwin(v8, v10);
  v13 = (char *)v28 - v12;
  v14 = &_swiftEmptyArrayStorage;
  v40 = &_swiftEmptyArrayStorage;
  v31 = *(_QWORD *)(a1 + 16);
  if (v31)
  {
    v28[1] = v3;
    v29 = (char *)v28 - v12;
    v15 = 0;
    v30 = a1;
    while (v15 < *(_QWORD *)(a1 + 16))
    {
      v16 = *(_QWORD *)(v6 + 72);
      v35 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v13, a1 + v35 + v16 * v15, v5);
      IntentItem.value.getter(&v37, v5);
      countAndFlagsBits = v37._countAndFlagsBits;
      v18 = v39;
      swift_bridgeObjectRelease(v38);
      swift_release(countAndFlagsBits);
      v19 = String.lowercased()();
      swift_bridgeObjectRelease(v18);
      v37 = v19;
      v20 = String.lowercased()();
      v36 = v20;
      v21 = sub_10000CB8C();
      v22 = StringProtocol.contains<A>(_:)(&v36, &type metadata for String, &type metadata for String, v21, v21);
      swift_bridgeObjectRelease(v19._object);
      v23 = swift_bridgeObjectRelease(v20._object);
      if ((v22 & 1) != 0)
      {
        v24 = *(void (**)(char *, char *, uint64_t, __n128))(v6 + 32);
        v24(v32, v13, v5, v23);
        v25 = v40;
        if ((swift_isUniquelyReferenced_nonNull_native(v40) & 1) == 0)
        {
          sub_10001A4DC(0, v25[2] + 1, 1);
          v25 = v40;
        }
        v27 = v25[2];
        v26 = v25[3];
        if (v27 >= v26 >> 1)
        {
          sub_10001A4DC(v26 > 1, v27 + 1, 1);
          v25 = v40;
        }
        v25[2] = v27 + 1;
        result = ((uint64_t (*)(char *, char *, uint64_t))v24)((char *)v25 + v35 + v27 * v16, v32, v5);
        v13 = v29;
      }
      else
      {
        result = (*(uint64_t (**)(char *, uint64_t, __n128))(v6 + 8))(v13, v5, v23);
      }
      ++v15;
      a1 = v30;
      if (v31 == v15)
      {
        v14 = v40;
        goto LABEL_13;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_13:
    swift_bridgeObjectRelease(v34);
    swift_bridgeObjectRelease(a1);
    return (uint64_t)v14;
  }
  return result;
}

uint64_t sub_1000251F0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch(sub_100025208, 0, 0);
}

uint64_t sub_100025208()
{
  uint64_t v0;

  sub_1000240F0(*(_QWORD *)(v0 + 16));
  return sub_10001C41C(*(uint64_t (**)(void))(v0 + 8));
}

void *sub_100025234(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  char isUniquelyReferenced_nonNull_native;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;

  v1 = objc_msgSend(a1, "librarySpecificFetchOptions");
  v2 = (void *)objc_opt_self(PHAssetCollection);
  v3 = objc_msgSend(v2, "fetchAssetCollectionsWithType:subtype:options:", 2, 203, v1);
  v4 = objc_msgSend(v3, "firstObject");

  if (v4)
  {
    v5 = v4;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    v7 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
    v6 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v7 >= v6 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v6 > 1, v7 + 1, 1);
    v8 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v7, v5);
    specialized Array._endMutation()(v8);

  }
  v9 = objc_msgSend(v2, "fetchAssetCollectionsWithType:subtype:options:", 2, 212, v1);
  v10 = objc_msgSend(v9, "firstObject");

  if (v10)
  {
    v11 = v10;
    specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
    v13 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x10);
    v12 = *(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 0x18);
    if (v13 >= v12 >> 1)
      specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(v12 > 1, v13 + 1, 1);
    v14 = specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)(v13, v11);
    specialized Array._endMutation()(v14);

  }
  if ((unint64_t)&_swiftEmptyArrayStorage >> 62)
  {
    if ((uint64_t)&_swiftEmptyArrayStorage < 0)
      v16 = &_swiftEmptyArrayStorage;
    else
      v16 = (void *)((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain(&_swiftEmptyArrayStorage);
    v17 = _CocoaArrayWrapper.endIndex.getter(v16);
    swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
    if (v17)
      goto LABEL_11;
  }
  else if (*(_QWORD *)(((unint64_t)&_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_11:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(&_swiftEmptyDictionarySingleton);
    sub_1000273F8((uint64_t)&_swiftEmptyArrayStorage, 0, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease(0x8000000000000000);
    goto LABEL_17;
  }
  swift_bridgeObjectRelease(&_swiftEmptyArrayStorage);
LABEL_17:
  v18 = sub_10000B8A0(&qword_100039238);
  v19 = swift_allocObject(v18, 40, 7);
  *(_OWORD *)(v19 + 16) = xmmword_100029DA0;
  v20 = objc_allocWithZone((Class)NSSortDescriptor);
  v21 = sub_1000270D0(0x657A696C61636F6CLL, 0xEE00656C74695464, 1);
  *(_QWORD *)(v19 + 32) = v21;
  specialized Array._endMutation()(v21);
  sub_10002753C(v19, v1);
  v22 = objc_msgSend(v2, "fetchAssetCollectionsWithType:subtype:options:", 1, 2, v1);
  v23 = objc_msgSend(v22, "fetchedObjects");

  if (!v23)
  {
LABEL_26:

    return &_swiftEmptyDictionarySingleton;
  }
  v24 = sub_10001BB44(0, &qword_100039778, PHAssetCollection_ptr);
  v25 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v23, v24);

  if ((unint64_t)v25 >> 62)
  {
    if (v25 < 0)
      v27 = v25;
    else
      v27 = v25 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v25);
    v28 = _CocoaArrayWrapper.endIndex.getter(v27);
    swift_bridgeObjectRelease(v25);
    if (v28)
      goto LABEL_20;
    goto LABEL_25;
  }
  if (!*(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_25:
    swift_bridgeObjectRelease(v25);
    goto LABEL_26;
  }
LABEL_20:
  v26 = swift_isUniquelyReferenced_nonNull_native(&_swiftEmptyDictionarySingleton);
  sub_1000273F8(v25, 1, v26);

  swift_bridgeObjectRelease(0x8000000000000000);
  return &_swiftEmptyDictionarySingleton;
}

unint64_t *sub_1000255D8(char a1, char a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  _BOOL8 v22;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  _BOOL8 v35;
  unint64_t v36;
  char v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t *v40;
  unint64_t v41;
  BOOL v42;
  unint64_t v43;
  uint64_t *v44;
  uint64_t *v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t *v48;
  uint64_t v49;
  unint64_t v50;
  id v51;
  void *v52;
  id v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t *v59;
  int64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  int64_t v66;
  unint64_t v67;
  int64_t v68;
  uint64_t *v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  NSObject *v75;
  uint64_t v76;
  int64_t v77;
  uint64_t v78;
  unint64_t *v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t *v82;
  uint64_t v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  char v88;
  unint64_t v89;
  _BOOL8 v90;
  Swift::Int v91;
  unint64_t v92;
  char v93;
  unint64_t v94;
  char v95;
  uint64_t *v96;
  uint64_t *v97;
  unint64_t v98;
  unint64_t v99;
  uint64_t v100;
  unint64_t *result;
  uint64_t v102;
  int64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  int64_t v113;
  _QWORD v114[3];
  char v115[8];
  unint64_t *v116;

  v3 = a3;
  LOBYTE(v4) = a2;
  LOBYTE(v5) = a1;
  v6 = a3 >> 62;
  if (a3 >> 62)
    goto LABEL_88;
  v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v7)
    return (unint64_t *)&_swiftEmptyDictionarySingleton;
LABEL_3:
  v108 = v3;
  if ((v4 & 1) == 0)
  {
    v107 = v3 & 0xC000000000000001;
    v104 = PXFavoritesAlbumWidgetIdentifier;
    v102 = PXDepthEffectAlbumWidgetIdentifier;
    swift_bridgeObjectRetain(v3);
    v5 = (unint64_t *)&_swiftEmptyDictionarySingleton;
    v8 = 4;
    v106 = v7;
    while (1)
    {
      v4 = v8 - 4;
      if (v107)
        v9 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v8 - 4, v3);
      else
        v9 = *(id *)(v3 + 8 * v8);
      v10 = v9;
      if (__OFADD__(v4, 1))
      {
        __break(1u);
LABEL_82:
        __break(1u);
LABEL_83:
        __break(1u);
LABEL_84:
        __break(1u);
LABEL_85:
        __break(1u);
LABEL_86:
        __break(1u);
LABEL_87:
        __break(1u);
LABEL_88:
        if (v3 < 0)
          v100 = v3;
        else
          v100 = v3 & 0xFFFFFFFFFFFFFF8;
        swift_bridgeObjectRetain(v3);
        v7 = _CocoaArrayWrapper.endIndex.getter(v100);
        swift_bridgeObjectRelease(v3);
        if (!v7)
          return (unint64_t *)&_swiftEmptyDictionarySingleton;
        goto LABEL_3;
      }
      v112 = v8 - 3;
      v11 = objc_msgSend(v9, "assetCollectionSubtype");
      v110 = v10;
      if (v11 == (id)203)
      {
        v4 = (uint64_t)objc_msgSend(v10, "localIdentifier");
        v12 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
        v14 = v13;

        v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v104);
        v17 = v16;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v5);
        v116 = v5;
        LOBYTE(v4) = (_BYTE)v5;
        v19 = sub_10002286C(v12, v14);
        v21 = v5[2];
        v22 = (v20 & 1) == 0;
        v5 = (unint64_t *)(v21 + v22);
        if (__OFADD__(v21, v22))
          goto LABEL_83;
        v3 = v19;
        v6 = v20;
        sub_10000B8A0(&qword_100039920);
        v4 = (uint64_t)&v116;
        if (_NativeDictionary.ensureUnique(isUnique:capacity:)(isUniquelyReferenced_nonNull_native, (Swift::Int)v5))
        {
          LOBYTE(v4) = (_BYTE)v116;
          v23 = sub_10002286C(v12, v14);
          if ((v6 & 1) != (v24 & 1))
            goto LABEL_98;
          v3 = v23;
        }
        v5 = v116;
        if ((v6 & 1) == 0)
        {
          v116[((unint64_t)v3 >> 6) + 8] |= 1 << v3;
          v39 = (uint64_t *)(v5[6] + 16 * v3);
          *v39 = v12;
          v39[1] = v14;
          v40 = (uint64_t *)(v5[7] + 16 * v3);
          *v40 = v15;
          v40[1] = v17;
          v41 = v5[2];
          v42 = __OFADD__(v41, 1);
          v43 = v41 + 1;
          if (v42)
            goto LABEL_85;
LABEL_27:
          v5[2] = v43;
          swift_bridgeObjectRetain(v14);
          goto LABEL_28;
        }
        v25 = (uint64_t *)(v116[7] + 16 * v3);
        swift_bridgeObjectRelease(v25[1]);
        *v25 = v15;
        v25[1] = v17;
      }
      else
      {
        if (v11 != (id)212)
          goto LABEL_97;
        v4 = (uint64_t)objc_msgSend(v10, "localIdentifier");
        v26 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
        v14 = v27;

        v28 = static String._unconditionallyBridgeFromObjectiveC(_:)(v102);
        v30 = v29;
        v31 = swift_isUniquelyReferenced_nonNull_native(v5);
        v116 = v5;
        LOBYTE(v4) = (_BYTE)v5;
        v32 = sub_10002286C(v26, v14);
        v34 = v5[2];
        v35 = (v33 & 1) == 0;
        v5 = (unint64_t *)(v34 + v35);
        if (__OFADD__(v34, v35))
          goto LABEL_84;
        v3 = v32;
        v6 = v33;
        sub_10000B8A0(&qword_100039920);
        v4 = (uint64_t)&v116;
        if (_NativeDictionary.ensureUnique(isUnique:capacity:)(v31, (Swift::Int)v5))
        {
          LOBYTE(v4) = (_BYTE)v116;
          v36 = sub_10002286C(v26, v14);
          if ((v6 & 1) != (v37 & 1))
            goto LABEL_98;
          v3 = v36;
        }
        v5 = v116;
        if ((v6 & 1) == 0)
        {
          v116[((unint64_t)v3 >> 6) + 8] |= 1 << v3;
          v44 = (uint64_t *)(v5[6] + 16 * v3);
          *v44 = v26;
          v44[1] = v14;
          v45 = (uint64_t *)(v5[7] + 16 * v3);
          *v45 = v28;
          v45[1] = v30;
          v46 = v5[2];
          v42 = __OFADD__(v46, 1);
          v43 = v46 + 1;
          if (v42)
            goto LABEL_86;
          goto LABEL_27;
        }
        v38 = (uint64_t *)(v116[7] + 16 * v3);
        swift_bridgeObjectRelease(v38[1]);
        *v38 = v28;
        v38[1] = v30;
      }
LABEL_28:

      swift_bridgeObjectRelease(v14);
      swift_bridgeObjectRelease(0x8000000000000000);
      v3 = v108;
      ++v8;
      if (v112 == v106)
      {
        swift_bridgeObjectRelease(v108);
        return v5;
      }
    }
  }
  if (v6)
  {
    if (v3 < 0)
      v47 = v3;
    else
      v47 = v3 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(v3);
    v6 = _CocoaArrayWrapper.endIndex.getter(v47);
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v6 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v48 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v6)
  {
    v116 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_10001A4A4(0, v6 & ~(v6 >> 63), 0);
    if ((v6 & 0x8000000000000000) == 0)
    {
      v49 = 0;
      v48 = v116;
      v50 = v3 & 0xC000000000000001;
      do
      {
        if (v50)
          v51 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v49, v3);
        else
          v51 = *(id *)(v3 + 8 * v49 + 32);
        v52 = v51;
        v53 = objc_msgSend(v51, "localIdentifier");
        v54 = static String._unconditionallyBridgeFromObjectiveC(_:)(v53);
        v56 = v55;

        v116 = v48;
        v58 = v48[2];
        v57 = v48[3];
        if (v58 >= v57 >> 1)
        {
          sub_10001A4A4((char *)(v57 > 1), v58 + 1, 1);
          v48 = v116;
        }
        ++v49;
        v48[2] = v58 + 1;
        v59 = &v48[2 * v58];
        v59[4] = v54;
        v59[5] = v56;
        v3 = v108;
      }
      while (v6 != v49);
      goto LABEL_45;
    }
  }
  else
  {
LABEL_45:
    LOBYTE(v4) = (_BYTE)v5;
    v3 = PHPhotoLibrary.cloudIdentifierMappings(forLocalIdentifiers:)(v48);
    swift_bridgeObjectRelease(v48);
    v60 = 0;
    v111 = v3 + 64;
    v61 = 1 << *(_BYTE *)(v3 + 32);
    v62 = -1;
    if (v61 < 64)
      v62 = ~(-1 << v61);
    v63 = v62 & *(_QWORD *)(v3 + 64);
    v113 = (unint64_t)(v61 + 63) >> 6;
    v5 = (unint64_t *)&_swiftEmptyDictionarySingleton;
    v109 = v3;
    while (1)
    {
      while (1)
      {
        if (v63)
        {
          v64 = __clz(__rbit64(v63));
          v63 &= v63 - 1;
          v65 = v64 | (v60 << 6);
        }
        else
        {
          v66 = v60 + 1;
          if (__OFADD__(v60, 1))
            goto LABEL_82;
          if (v66 >= v113)
            goto LABEL_80;
          v67 = *(_QWORD *)(v111 + 8 * v66);
          ++v60;
          if (!v67)
          {
            v60 = v66 + 1;
            if (v66 + 1 >= v113)
              goto LABEL_80;
            v67 = *(_QWORD *)(v111 + 8 * v60);
            if (!v67)
            {
              v60 = v66 + 2;
              if (v66 + 2 >= v113)
                goto LABEL_80;
              v67 = *(_QWORD *)(v111 + 8 * v60);
              if (!v67)
              {
                v68 = v66 + 3;
                if (v68 >= v113)
                  goto LABEL_80;
                v67 = *(_QWORD *)(v111 + 8 * v68);
                if (!v67)
                {
                  while (1)
                  {
                    v60 = v68 + 1;
                    if (__OFADD__(v68, 1))
                      goto LABEL_87;
                    if (v60 >= v113)
                      break;
                    v67 = *(_QWORD *)(v111 + 8 * v60);
                    ++v68;
                    if (v67)
                      goto LABEL_63;
                  }
LABEL_80:
                  swift_release(v3);
                  return v5;
                }
                v60 = v68;
              }
            }
          }
LABEL_63:
          v63 = (v67 - 1) & v67;
          v65 = __clz(__rbit64(v67)) + (v60 << 6);
        }
        v69 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v65);
        v71 = *v69;
        v70 = v69[1];
        v72 = *(_QWORD *)(v3 + 56) + 16 * v65;
        v73 = *(void **)v72;
        if ((*(_BYTE *)(v72 + 8) & 1) == 0)
          break;
        sub_10002760C(v73, 1);
        sub_10002760C(v73, 1);
        v74 = swift_bridgeObjectRetain(v70);
        LOBYTE(v4) = static os_log_type_t.error.getter(v74);
        if (qword_100038638 != -1)
          swift_once(&qword_100038638, sub_100023FA4);
        v75 = qword_10003C738;
        v6 = v4;
        if (os_log_type_enabled((os_log_t)qword_10003C738, (os_log_type_t)v4))
        {
          sub_10002760C(v73, 1);
          sub_10002760C(v73, 1);
          swift_bridgeObjectRetain(v70);
          v76 = v71;
          v77 = v60;
          v78 = swift_slowAlloc(22, -1);
          v79 = (unint64_t *)swift_slowAlloc(64, -1);
          v116 = v79;
          *(_DWORD *)v78 = 136315394;
          swift_bridgeObjectRetain(v70);
          *(_QWORD *)(v78 + 4) = sub_100019C88(v76, v70, (uint64_t *)&v116);
          swift_bridgeObjectRelease_n(v70, 3);
          *(_WORD *)(v78 + 12) = 2080;
          swift_getErrorValue(v73, v115, v114);
          v80 = Error.localizedDescription.getter(v114[1], v114[2]);
          v4 = v81;
          *(_QWORD *)(v78 + 14) = sub_100019C88(v80, v81, (uint64_t *)&v116);
          swift_bridgeObjectRelease(v4);
          sub_100027618(v73, 1);
          sub_100027618(v73, 1);
          _os_log_impl((void *)&_mh_execute_header, v75, (os_log_type_t)v6, "could not get cloud identifier for album %s with error %s", (uint8_t *)v78, 0x16u);
          swift_arrayDestroy(v79, 2);
          v82 = v79;
          v3 = v109;
          swift_slowDealloc(v82, -1, -1);
          v83 = v78;
          v60 = v77;
          swift_slowDealloc(v83, -1, -1);
        }
        else
        {
          swift_bridgeObjectRelease(v70);
        }
        sub_100027618(v73, 1);
        sub_100027618(v73, 1);
      }
      v103 = v60;
      sub_10002760C(v73, 0);
      sub_10002760C(v73, 0);
      swift_bridgeObjectRetain(v70);
      v84 = objc_msgSend(v73, "stringValue");
      v85 = static String._unconditionallyBridgeFromObjectiveC(_:)(v84);
      v105 = v86;

      v6 = swift_isUniquelyReferenced_nonNull_native(v5);
      v116 = v5;
      v87 = sub_10002286C(v71, v70);
      v89 = v5[2];
      v90 = (v88 & 1) == 0;
      v91 = v89 + v90;
      if (__OFADD__(v89, v90))
        break;
      v92 = v87;
      v93 = v88;
      sub_10000B8A0(&qword_100039920);
      v4 = (uint64_t)&v116;
      if (_NativeDictionary.ensureUnique(isUnique:capacity:)(v6, v91))
      {
        LOBYTE(v4) = (_BYTE)v116;
        v94 = sub_10002286C(v71, v70);
        if ((v93 & 1) != (v95 & 1))
          goto LABEL_98;
        v92 = v94;
      }
      v5 = v116;
      if ((v93 & 1) != 0)
      {
        v4 = v116[7] + 16 * v92;
        swift_bridgeObjectRelease(*(_QWORD *)(v4 + 8));
        *(_QWORD *)v4 = v85;
        *(_QWORD *)(v4 + 8) = v105;
      }
      else
      {
        v116[(v92 >> 6) + 8] |= 1 << v92;
        v96 = (uint64_t *)(v5[6] + 16 * v92);
        *v96 = v71;
        v96[1] = v70;
        v97 = (uint64_t *)(v5[7] + 16 * v92);
        *v97 = v85;
        v97[1] = v105;
        v98 = v5[2];
        v42 = __OFADD__(v98, 1);
        v99 = v98 + 1;
        if (v42)
          goto LABEL_95;
        v5[2] = v99;
        swift_bridgeObjectRetain(v70);
      }
      v3 = v109;
      v60 = v103;
      swift_bridgeObjectRelease(v70);
      swift_bridgeObjectRelease(0x8000000000000000);
      sub_100027618(v73, 0);
      sub_100027618(v73, 0);
    }
    __break(1u);
LABEL_95:
    __break(1u);
  }
  __break(1u);
LABEL_97:
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001BLL, 0x800000010002B8A0, "PhotosReliveWidget/PhotosReliveWidgetAlbum.swift", 48, 2);
  __break(1u);
LABEL_98:
  result = (unint64_t *)KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_100025FE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4[3] = a2;
  v4[4] = a3;
  v4[2] = a1;
  v5 = sub_10000B8A0(&qword_100039458);
  v4[5] = sub_100027804(*(_QWORD *)(v5 - 8));
  v6 = sub_10000B8A0(&qword_100039948);
  v4[6] = sub_100027804(*(_QWORD *)(v6 - 8));
  v7 = sub_100027874();
  v4[7] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v4[8] = v8;
  v4[9] = sub_100027840(v8);
  v4[10] = swift_task_alloc(v3);
  v9 = sub_10000B8A0(&qword_1000392C8);
  v4[11] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v4[12] = v10;
  v4[13] = sub_100027840(v10);
  v4[14] = swift_task_alloc(v3);
  v11 = sub_10000B8A0(qword_100039888);
  v4[15] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v4[16] = v12;
  v4[17] = sub_100027804(v12);
  return sub_100027814((uint64_t)sub_1000260B8, 0, 0);
}

uint64_t sub_1000260B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  void (*v44)(_QWORD, unint64_t, uint64_t);
  uint64_t v45;
  uint64_t v46;

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(_QWORD *)(v0 + 120);
  sub_1000240F0(*(_QWORD *)(v0 + 136));
  v3 = IntentItemCollection.sections.getter(v2);
  sub_100027854(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  v4 = *(_QWORD *)(v3 + 16);
  if (v4)
  {
    v5 = *(_QWORD *)(v0 + 96);
    v40 = v3;
    v41 = *(_QWORD *)(v0 + 64);
    v43 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    v6 = v3 + v43;
    v7 = &_swiftEmptyArrayStorage;
    v8 = *(_QWORD *)(v5 + 72);
    v44 = *(void (**)(_QWORD, unint64_t, uint64_t))(v5 + 16);
    v45 = v5;
    v42 = v8;
    do
    {
      v46 = (uint64_t)v7;
      v9 = *(_QWORD *)(v0 + 88);
      v11 = *(_QWORD *)(v0 + 24);
      v10 = *(_QWORD *)(v0 + 32);
      v44(*(_QWORD *)(v0 + 112), v6, v9);
      v12 = IntentItemSection.items.getter(v9);
      swift_bridgeObjectRetain(v10);
      v13 = sub_100024F7C(v12, v11, v10);
      if (*(_QWORD *)(v13 + 16))
      {
        v14 = *(_QWORD *)(v0 + 48);
        IntentItemSection.description.getter(*(_QWORD *)(v0 + 88));
        v15 = type metadata accessor for DisplayRepresentation(0);
        v16 = sub_10000BA0C(v14, 1, v15);
        v17 = *(_QWORD *)(v0 + 80);
        if (v16 == 1)
        {
          sub_100027624(*(_QWORD *)(v0 + 48), &qword_100039948);
          LocalizedStringResource.init(stringLiteral:)(0, 0xE000000000000000);
        }
        else
        {
          v18 = *(_QWORD *)(v0 + 72);
          v19 = *(_QWORD *)(v0 + 56);
          DisplayRepresentation.title.getter();
          sub_100027854(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8));
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 32))(v17, v18, v19);
        }
        v20 = *(_QWORD *)(v0 + 80);
        v21 = sub_100026874();
        IntentItemSection.init(_:items:)(v20, v13, &type metadata for PhotosReliveWidgetAlbum, v21);
        v7 = (_QWORD *)v46;
        if ((swift_isUniquelyReferenced_nonNull_native(v46) & 1) == 0)
          v7 = (_QWORD *)sub_100027138(0, *(_QWORD *)(v46 + 16) + 1, 1, v46, &qword_100039918, &qword_1000392C8, (void (*)(uint64_t, uint64_t, unint64_t))sub_1000197D0);
        v23 = v7[2];
        v22 = v7[3];
        if (v23 >= v22 >> 1)
          v7 = (_QWORD *)sub_100027138(v22 > 1, v23 + 1, 1, (uint64_t)v7, &qword_100039918, &qword_1000392C8, (void (*)(uint64_t, uint64_t, unint64_t))sub_1000197D0);
        v24 = *(_QWORD *)(v0 + 104);
        v25 = *(_QWORD *)(v0 + 112);
        v26 = *(_QWORD *)(v0 + 88);
        v7[2] = v23 + 1;
        v27 = (char *)v7 + v43 + v23 * v42;
        v8 = v42;
        (*(void (**)(char *, uint64_t, uint64_t))(v45 + 32))(v27, v24, v26);
        (*(void (**)(uint64_t, uint64_t))(v45 + 8))(v25, v26);
      }
      else
      {
        (*(void (**)(_QWORD, _QWORD))(v45 + 8))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 88));
        swift_bridgeObjectRelease(v13);
        v7 = (_QWORD *)v46;
      }
      v6 += v8;
      --v4;
    }
    while (v4);
    swift_bridgeObjectRelease(v40);
    v30 = v7;
  }
  else
  {
    swift_bridgeObjectRelease(v3);
    v30 = &_swiftEmptyArrayStorage;
  }
  v31 = *(_QWORD *)(v0 + 136);
  v33 = *(_QWORD *)(v0 + 104);
  v32 = *(_QWORD *)(v0 + 112);
  v35 = *(_QWORD *)(v0 + 72);
  v34 = *(_QWORD *)(v0 + 80);
  v36 = *(_QWORD *)(v0 + 48);
  v37 = *(_QWORD *)(v0 + 40);
  sub_100027868(v37, v28, v29, *(_QWORD *)(v0 + 56));
  v38 = sub_100026874();
  IntentItemCollection.init(promptLabel:usesIndexedCollation:sections:)(v37, 0, v30, &type metadata for PhotosReliveWidgetAlbum, v38);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  swift_task_dealloc(v36);
  swift_task_dealloc(v37);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100026418(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 32) = a1;
  v2 = sub_100027874();
  *(_QWORD *)(v1 + 40) = sub_100027804(*(_QWORD *)(v2 - 8));
  return sub_100027814((uint64_t)sub_100026458, 0, 0);
}

uint64_t sub_100026458()
{
  uint64_t v0;
  id v1;
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v1 = objc_msgSend((id)objc_opt_self(PLPhotoLibrary), "systemPhotoLibraryIsObtainable");
  if ((v1 & 1) == 0)
  {
    v12 = static os_log_type_t.error.getter(v1);
    if (qword_100038638 != -1)
      swift_once(&qword_100038638, sub_100023FA4);
    os_log(_:dso:log:_:_:)(v12, &_mh_execute_header, qword_10003C738, "Photo library is not obtainable", 31, 2, &_swiftEmptyArrayStorage);
    goto LABEL_12;
  }
  v2 = sub_100015940();
  if (!v2)
  {
LABEL_12:
    v9 = 0;
    v11 = 0xE000000000000000;
    goto LABEL_13;
  }
  v3 = v2;
  v4 = objc_msgSend(v2, "librarySpecificFetchOptions");
  v5 = objc_msgSend((id)objc_opt_self(PHAssetCollection), "fetchAssetCollectionsWithType:subtype:options:", 2, 203, v4);
  v6 = objc_msgSend(v5, "firstObject");

  if (!v6)
  {

LABEL_11:
    goto LABEL_12;
  }
  v7 = objc_msgSend(v6, "localizedTitle");
  if (!v7)
  {

    goto LABEL_11;
  }
  v8 = v7;
  v9 = static String._unconditionallyBridgeFromObjectiveC(_:)(v7);
  v11 = v10;

LABEL_13:
  v14 = *(uint64_t **)(v0 + 32);
  v13 = *(_QWORD *)(v0 + 40);
  v15 = PXFavoritesAlbumWidgetIdentifier;
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(PXFavoritesAlbumWidgetIdentifier);
  v18 = v17;
  sub_10000B8A0(&qword_100039900);
  LocalizedStringResource.init(stringLiteral:)(0xD000000000000011, 0x800000010002C1B0);
  v19 = EntityProperty<>.init(title:)(v13);
  *(_QWORD *)(v0 + 16) = static String._unconditionallyBridgeFromObjectiveC(_:)(v15);
  *(_QWORD *)(v0 + 24) = v20;
  EntityProperty.wrappedValue.setter(v0 + 16);
  swift_task_dealloc(v13);
  *v14 = v19;
  v14[1] = v16;
  v14[2] = v18;
  v14[3] = v9;
  v14[4] = v11;
  return sub_100027860(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_100026670(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc(dword_100039944);
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_100027800;
  return sub_100025FE4(a1, a2, a3);
}

unint64_t sub_1000266DC()
{
  unint64_t result;

  result = qword_100039850;
  if (!qword_100039850)
  {
    result = swift_getWitnessTable(&unk_10002ACE4, &type metadata for PhotosReliveWidgetAlbum.PhotoReliveWidgetAlbumOptionsProvider);
    atomic_store(result, (unint64_t *)&qword_100039850);
  }
  return result;
}

unint64_t sub_10002671C()
{
  unint64_t result;

  result = qword_100039858[0];
  if (!qword_100039858[0])
  {
    result = swift_getWitnessTable(&unk_10002AD44, &type metadata for PhotosReliveWidgetAlbum.PhotoReliveWidgetAlbumOptionsProvider);
    atomic_store(result, qword_100039858);
  }
  return result;
}

uint64_t sub_10002675C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc(dword_10003993C);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1000267A8;
  return sub_100024018(a1);
}

uint64_t sub_1000267A8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v4 = sub_100027820();
  if (!v1)
    v4 = a1;
  return (*(uint64_t (**)(uint64_t))(v2 + 8))(v4);
}

uint64_t sub_1000267E0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc(dword_10003990C);
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_100027800;
  return sub_1000251F0(a1);
}

unint64_t sub_100026834()
{
  unint64_t result;

  result = qword_100039870;
  if (!qword_100039870)
  {
    result = swift_getWitnessTable(&unk_10002AD6C, &type metadata for PhotosReliveWidgetAlbum.PhotoReliveWidgetAlbumOptionsProvider);
    atomic_store(result, (unint64_t *)&qword_100039870);
  }
  return result;
}

unint64_t sub_100026874()
{
  unint64_t result;

  result = qword_100039878;
  if (!qword_100039878)
  {
    result = swift_getWitnessTable(&unk_10002AED0, &type metadata for PhotosReliveWidgetAlbum);
    atomic_store(result, (unint64_t *)&qword_100039878);
  }
  return result;
}

uint64_t sub_1000268B0()
{
  return sub_100026D7C(&qword_100039880, qword_100039888, (uint64_t)&protocol conformance descriptor for IntentItemCollection<A>);
}

uint64_t sub_1000268DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  unint64_t v6;

  v5 = (_QWORD *)swift_task_alloc(async function pointer to EntityQuery.results()[1]);
  *(_QWORD *)(v2 + 16) = v5;
  v6 = sub_100023D54();
  *v5 = v2;
  v5[1] = sub_100026948;
  return EntityQuery.results()(a1, a2, v6);
}

uint64_t sub_100026948()
{
  uint64_t v0;

  sub_100027820();
  return sub_10001C41C(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_10002696C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;

  *(_QWORD *)(v1 + 56) = a1;
  v2 = (_QWORD *)swift_task_alloc(dword_1000398F4);
  *(_QWORD *)(v1 + 64) = v2;
  *v2 = v1;
  v2[1] = sub_1000269C0;
  return sub_100026418(v1 + 16);
}

uint64_t sub_1000269C0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v1 = *v0 + 16;
  v2 = *(_QWORD *)(*v0 + 56);
  v4 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 64));
  sub_100027088(v1, v2);
  return sub_100027860(*(uint64_t (**)(void))(v4 + 8));
}

unint64_t sub_100026A1C()
{
  unint64_t result;

  result = qword_1000398A0;
  if (!qword_1000398A0)
  {
    result = swift_getWitnessTable(&unk_10002ADE0, &type metadata for PhotosReliveWidgetAlbum);
    atomic_store(result, (unint64_t *)&qword_1000398A0);
  }
  return result;
}

unint64_t sub_100026A5C()
{
  unint64_t result;

  result = qword_1000398A8;
  if (!qword_1000398A8)
  {
    result = swift_getWitnessTable(&unk_10002AE18, &type metadata for PhotosReliveWidgetAlbum);
    atomic_store(result, (unint64_t *)&qword_1000398A8);
  }
  return result;
}

unint64_t sub_100026A9C()
{
  unint64_t result;

  result = qword_1000398B0;
  if (!qword_1000398B0)
  {
    result = swift_getWitnessTable(&unk_10002AE48, &type metadata for PhotosReliveWidgetAlbum);
    atomic_store(result, (unint64_t *)&qword_1000398B0);
  }
  return result;
}

void *sub_100026AD8()
{
  return &protocol witness table for String;
}

uint64_t sub_100026AE4()
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

  v1 = v0;
  sub_10000B8A0(&qword_1000398E8);
  sub_10000E858();
  __chkstk_darwin(v2, v3);
  sub_10001C3EC();
  v6 = v5 - v4;
  sub_10000B8A0(&qword_100039458);
  sub_10000E858();
  __chkstk_darwin(v7, v8);
  sub_10001C3EC();
  v11 = v10 - v9;
  v12 = sub_100027874();
  sub_10000E858();
  __chkstk_darwin(v13, v14);
  sub_10001C3EC();
  v17 = v16 - v15;
  type metadata accessor for String.LocalizationValue.StringInterpolation(0);
  sub_10000E858();
  __chkstk_darwin(v18, v19);
  sub_10001C3EC();
  v22 = v21 - v20;
  String.LocalizationValue.StringInterpolation.init(literalCapacity:interpolationCount:)(0, 1);
  sub_10002787C();
  String.LocalizationValue.StringInterpolation.appendInterpolation(_:)(*(Swift::String *)(v1 + 24));
  sub_10002787C();
  LocalizedStringResource.init(stringInterpolation:)(v22);
  sub_10000BA28(v11, 1, 1, v12);
  v23 = type metadata accessor for DisplayRepresentation.Image(0);
  sub_100027868(v6, v24, v25, v23);
  return DisplayRepresentation.init(title:subtitle:image:)(v17, v11, v6);
}

unint64_t sub_100026C24()
{
  unint64_t result;

  result = qword_1000398B8;
  if (!qword_1000398B8)
  {
    result = swift_getWitnessTable(&unk_10002AE80, &type metadata for PhotosReliveWidgetAlbum);
    atomic_store(result, (unint64_t *)&qword_1000398B8);
  }
  return result;
}

unint64_t sub_100026C64()
{
  unint64_t result;

  result = qword_1000398C0;
  if (!qword_1000398C0)
  {
    result = swift_getWitnessTable(&unk_10002AEA8, &type metadata for PhotosReliveWidgetAlbum);
    atomic_store(result, (unint64_t *)&qword_1000398C0);
  }
  return result;
}

unint64_t sub_100026CA4()
{
  unint64_t result;

  result = qword_1000398C8;
  if (!qword_1000398C8)
  {
    result = swift_getWitnessTable(&unk_10002AF28, &type metadata for PhotosReliveWidgetAlbum);
    atomic_store(result, (unint64_t *)&qword_1000398C8);
  }
  return result;
}

void *sub_100026CE0()
{
  return &protocol witness table for String;
}

uint64_t sub_100026CEC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_100023D90();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100026D10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100023EC8();
  v3 = type metadata accessor for TypeDisplayRepresentation(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v2, v3);
}

uint64_t sub_100026D50()
{
  return sub_100026D7C(&qword_1000398D0, &qword_1000398D8, (uint64_t)&protocol conformance descriptor for EmptyResolverSpecification<A>);
}

uint64_t sub_100026D7C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10000B978(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100026DBC(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10001E078();
  return static AppEntity.defaultResolverSpecification.getter(a1, v2);
}

unint64_t sub_100026DF8()
{
  unint64_t result;

  result = qword_1000398E0;
  if (!qword_1000398E0)
  {
    result = swift_getWitnessTable(&unk_10002AF58, &type metadata for PhotosReliveWidgetAlbum);
    atomic_store(result, (unint64_t *)&qword_1000398E0);
  }
  return result;
}

uint64_t sub_100026E38(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100026CA4();
  return InstanceDisplayRepresentable.localizedStringResource.getter(a1, v2);
}

uint64_t destroy for PhotosReliveWidgetAlbum(_QWORD *a1)
{
  swift_release(*a1);
  swift_bridgeObjectRelease(a1[2]);
  return swift_bridgeObjectRelease(a1[4]);
}

uint64_t *initializeWithCopy for PhotosReliveWidgetAlbum(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *a2;
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v6 = a2[2];
  v5 = a2[3];
  a1[2] = v6;
  a1[3] = v5;
  v7 = a2[4];
  a1[4] = v7;
  swift_retain(v3);
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRetain(v7);
  return a1;
}

uint64_t *assignWithCopy for PhotosReliveWidgetAlbum(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  swift_retain(v4);
  swift_release(v5);
  a1[1] = a2[1];
  v6 = a2[2];
  v7 = a1[2];
  a1[2] = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  a1[3] = a2[3];
  v8 = a2[4];
  v9 = a1[4];
  a1[4] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  return a1;
}

__n128 initializeWithTake for PhotosReliveWidgetAlbum(uint64_t a1, uint64_t a2)
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

uint64_t *assignWithTake for PhotosReliveWidgetAlbum(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = *a1;
  *a1 = *a2;
  swift_release(v4);
  v5 = a2[2];
  v6 = a1[2];
  a1[1] = a2[1];
  a1[2] = v5;
  swift_bridgeObjectRelease(v6);
  v7 = a2[4];
  v8 = a1[4];
  a1[3] = a2[3];
  a1[4] = v7;
  swift_bridgeObjectRelease(v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotosReliveWidgetAlbum(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 40))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PhotosReliveWidgetAlbum(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
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
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PhotosReliveWidgetAlbum()
{
  return &type metadata for PhotosReliveWidgetAlbum;
}

ValueMetadata *type metadata accessor for PhotosReliveWidgetAlbum.PhotoReliveWidgetAlbumOptionsProvider()
{
  return &type metadata for PhotosReliveWidgetAlbum.PhotoReliveWidgetAlbumOptionsProvider;
}

uint64_t sub_100027088(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_10000B8A0(&qword_1000398F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id sub_1000270D0(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  NSString v6;
  id v7;

  if (a2)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(v3, "initWithKey:ascending:", v6, a3 & 1);

  return v7;
}

uint64_t sub_100027138(char a1, int64_t a2, char a3, uint64_t a4, uint64_t *a5, uint64_t *a6, void (*a7)(uint64_t, uint64_t, unint64_t))
{
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  size_t v21;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t result;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  if ((a3 & 1) != 0)
  {
    v11 = *(_QWORD *)(a4 + 24);
    v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
LABEL_24:
        sub_10001C3C8();
        sub_100027888();
        v32 = 16;
LABEL_26:
        result = _assertionFailure(_:_:file:line:flags:)(v27, v28, v29, v30, v32, 2, v31, 24);
        __break(1u);
        return result;
      }
      v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v12 = a2;
    }
  }
  else
  {
    v12 = a2;
  }
  v13 = *(_QWORD *)(a4 + 16);
  if (v12 <= v13)
    v14 = *(_QWORD *)(a4 + 16);
  else
    v14 = v12;
  if (!v14)
  {
    v20 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v15 = sub_10000B8A0(a5);
  v16 = *(_QWORD *)(sub_10000B8A0(a6) - 8);
  v17 = *(_QWORD *)(v16 + 72);
  v18 = *(unsigned __int8 *)(v16 + 80);
  v19 = (v18 + 32) & ~v18;
  v20 = (_QWORD *)swift_allocObject(v15, v19 + v17 * v14, v18 | 7);
  v21 = j__malloc_size(v20);
  if (!v17)
    goto LABEL_24;
  if (v21 - v19 == 0x8000000000000000 && v17 == -1)
  {
    sub_10001C3C8();
    sub_100027888();
    v32 = 31;
    goto LABEL_26;
  }
  v20[2] = v13;
  v20[3] = 2 * ((uint64_t)(v21 - v19) / v17);
LABEL_19:
  v23 = *(unsigned __int8 *)(*(_QWORD *)(sub_10000B8A0(a6) - 8) + 80);
  v24 = (v23 + 32) & ~v23;
  v25 = (unint64_t)v20 + v24;
  if ((a1 & 1) != 0)
  {
    a7(a4 + v24, v13, v25);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease(a4);
  }
  else
  {
    sub_1000272F8(0, v13, v25, a4, a6);
  }
  return (uint64_t)v20;
}

uint64_t sub_1000272F8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t *a5)
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v5 < 0)
  {
LABEL_9:
    sub_10001C3C8();
    sub_100027888();
    v23 = 51;
    goto LABEL_11;
  }
  v9 = *(_QWORD *)(sub_10000B8A0(a5) - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = *(_QWORD *)(v9 + 72);
  v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
  v13 = v11 * v5;
  v14 = a3 + v13;
  v15 = v12 + v13;
  if (v12 >= v14 || v15 <= a3)
  {
    swift_arrayInitWithCopy(a3, v12);
    swift_bridgeObjectRelease(a4);
    return v14;
  }
  sub_10001C3C8();
  sub_100027888();
  v23 = 49;
LABEL_11:
  result = _fatalErrorMessage(_:_:file:line:flags:)(v18, v19, v20, v21, v23, 2, v22, 25);
  __break(1u);
  return result;
}

void sub_1000273F8(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD **v4;
  char v7;
  _QWORD *v8;
  unint64_t v9;
  char v10;
  uint64_t v11;
  _BOOL8 v12;
  Swift::Int v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  _QWORD *v19;
  uint64_t v20;

  v4 = (_QWORD **)v3;
  v7 = a2 & 1;
  v8 = (_QWORD *)*v3;
  v9 = sub_100022818(a2 & 1, a2);
  v11 = v8[2];
  v12 = (v10 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_9;
  }
  v14 = v9;
  v15 = v10;
  sub_10000B8A0(&qword_100039930);
  if (!_NativeDictionary.ensureUnique(isUnique:capacity:)(a3 & 1, v13))
    goto LABEL_5;
  v17 = sub_100022818(v7, v16);
  if ((v15 & 1) != (v18 & 1))
  {
LABEL_9:
    KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for PhotosReliveWidgetAlbum.PhotoReliveWidgetAlbumOptionsProvider.PhotosWidgetAlbumType);
    __break(1u);
    return;
  }
  v14 = v17;
LABEL_5:
  v19 = *v4;
  if ((v15 & 1) != 0)
  {
    v20 = v19[7];
    swift_bridgeObjectRelease(*(_QWORD *)(v20 + 8 * v14));
    *(_QWORD *)(v20 + 8 * v14) = a1;
  }
  else
  {
    sub_1000274F4(v14, v7, a1, v19);
  }
}

unint64_t sub_1000274F4(unint64_t result, char a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  a4[(result >> 6) + 8] |= 1 << result;
  *(_BYTE *)(a4[6] + result) = a2 & 1;
  *(_QWORD *)(a4[7] + 8 * result) = a3;
  v4 = a4[2];
  v5 = __OFADD__(v4, 1);
  v6 = v4 + 1;
  if (v5)
    __break(1u);
  else
    a4[2] = v6;
  return result;
}

void sub_10002753C(uint64_t a1, void *a2)
{
  Class isa;

  sub_10001BB44(0, &qword_100039928, NSSortDescriptor_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  objc_msgSend(a2, "setSortDescriptors:", isa, swift_bridgeObjectRelease(a1).n128_f64[0]);

}

uint64_t sub_1000275AC(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, "localizedTitle");
  if (!v1)
    return 0;
  v2 = v1;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(v1);

  return v3;
}

id sub_10002760C(void *a1, char a2)
{
  if ((a2 & 1) != 0)
    return (id)swift_errorRetain(a1);
  else
    return a1;
}

void sub_100027618(void *a1, char a2)
{
  if ((a2 & 1) != 0)
    swift_errorRelease(a1);
  else

}

uint64_t sub_100027624(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_10000B8A0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotosReliveWidgetAlbum.PhotoReliveWidgetAlbumOptionsProvider.PhotosWidgetAlbumType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
    if (a2 + 1 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 1) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v5 = v6 - 2;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for PhotosReliveWidgetAlbum.PhotoReliveWidgetAlbumOptionsProvider.PhotosWidgetAlbumType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_100027734 + 4 * byte_10002AC55[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_100027768 + 4 * asc_10002AC50[v4]))();
}

uint64_t sub_100027768(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100027770(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100027778);
  return result;
}

uint64_t sub_100027784(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10002778CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_100027790(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100027798(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_1000277A4(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PhotosReliveWidgetAlbum.PhotoReliveWidgetAlbumOptionsProvider.PhotosWidgetAlbumType()
{
  return &type metadata for PhotosReliveWidgetAlbum.PhotoReliveWidgetAlbumOptionsProvider.PhotosWidgetAlbumType;
}

unint64_t sub_1000277C4()
{
  unint64_t result;

  result = qword_100039950;
  if (!qword_100039950)
  {
    result = swift_getWitnessTable(&unk_10002B048, &type metadata for PhotosReliveWidgetAlbum.PhotoReliveWidgetAlbumOptionsProvider.PhotosWidgetAlbumType);
    atomic_store(result, (unint64_t *)&qword_100039950);
  }
  return result;
}

uint64_t sub_100027804@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc((*(_QWORD *)(a1 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_100027814(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_task_switch(a1, a2, a3);
}

uint64_t sub_100027820()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  v3 = *(_QWORD *)(v2 + 16);
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc(v3);
}

uint64_t sub_100027840@<X0>(uint64_t a1@<X8>)
{
  return swift_task_alloc((*(_QWORD *)(a1 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_100027854@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t sub_100027860(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_100027868(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000BA28(a1, 1, 1, a4);
}

uint64_t sub_100027874()
{
  return type metadata accessor for LocalizedStringResource(0);
}

void sub_10002787C()
{
  Swift::String v0;

  v0._countAndFlagsBits = 0;
  v0._object = (void *)0xE000000000000000;
  String.LocalizationValue.StringInterpolation.appendLiteral(_:)(v0);
}

uint64_t PXTimelineContentType.description.getter(unint64_t a1)
{
  if (a1 > 2)
    return 0x6E776F6E6B6E75;
  else
    return *(_QWORD *)&aMemory_1[8 * a1];
}

uint64_t sub_1000278D4()
{
  unint64_t *v0;

  return PXTimelineContentType.description.getter(*v0);
}

uint64_t sub_1000278DC()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC18PhotosReliveWidgetP33_C291146C2EF6671DEE920EA3EB768E7E19ResourceBundleClass);
}

uint64_t sub_10002790C()
{
  return sub_100027AA4(1);
}

uint64_t sub_100027914(int a1, int a2, int a3, int a4)
{
  BOOL v9;
  _DWORD v10[2];

  if (qword_10003C668 == -1)
  {
    if (qword_10003C670)
    {
LABEL_3:
      v10[0] = a1;
      v10[1] = (a2 << 16) | (a3 << 8) | a4;
      return _availability_version_check(1, v10);
    }
  }
  else
  {
    dispatch_once_f(&qword_10003C668, 0, (dispatch_function_t)sub_100027A9C);
    if (qword_10003C670)
      goto LABEL_3;
  }
  if (qword_10003C660 == -1)
  {
    v9 = dword_10003C650 < a2;
    if (dword_10003C650 > a2)
      return 1;
  }
  else
  {
    dispatch_once_f(&qword_10003C660, 0, (dispatch_function_t)sub_10002790C);
    v9 = dword_10003C650 < a2;
    if (dword_10003C650 > a2)
      return 1;
  }
  if (v9)
    return 0;
  if (dword_10003C654 > a3)
    return 1;
  return dword_10003C654 >= a3 && dword_10003C658 >= a4;
}

uint64_t sub_100027A9C()
{
  return sub_100027AA4(0);
}

uint64_t sub_100027AA4(uint64_t result)
{
  void *v1;
  BOOL v2;
  unsigned __int8 *v4;
  uint64_t (*v5)(_QWORD);
  unint64_t v6;
  uint64_t (*v7)(_QWORD, uint64_t, _QWORD, _QWORD);
  uint64_t (*v8)(_QWORD, const char *, uint64_t, unsigned __int8 *);
  uint64_t (*v9)(uint64_t, uint64_t);
  uint64_t (*v10)(uint64_t);
  uint64_t (*v11)(void);
  FILE *v12;
  FILE *v13;
  uint64_t v14;
  size_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  FILE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  FILE *v27;
  unsigned int (*v28)(uint64_t, char *, uint64_t, uint64_t);
  char v29[32];

  v1 = (void *)qword_10003C670;
  if (qword_10003C670)
    v2 = (_DWORD)result == 0;
  else
    v2 = 0;
  if (!v2)
  {
    if (&__availability_version_check)
    {
      qword_10003C670 = (uint64_t)&__availability_version_check;
      v1 = &__availability_version_check;
    }
    if (!v1 || (_DWORD)result != 0)
    {
      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "kCFAllocatorNull");
      if (result)
      {
        v4 = *(unsigned __int8 **)result;
        result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDataCreateWithBytesNoCopy");
        if (result)
        {
          v5 = (uint64_t (*)(_QWORD))result;
          v6 = (unint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateWithData");
          result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFPropertyListCreateFromXMLData");
          if (v6 | result)
          {
            v7 = (uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD))result;
            result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringCreateWithCStringNoCopy");
            if (result)
            {
              v8 = (uint64_t (*)(_QWORD, const char *, uint64_t, unsigned __int8 *))result;
              result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFDictionaryGetValue");
              if (result)
              {
                v9 = (uint64_t (*)(uint64_t, uint64_t))result;
                result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFGetTypeID");
                if (result)
                {
                  v10 = (uint64_t (*)(uint64_t))result;
                  result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetTypeID");
                  if (result)
                  {
                    v11 = (uint64_t (*)(void))result;
                    result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFStringGetCString");
                    v28 = (unsigned int (*)(uint64_t, char *, uint64_t, uint64_t))result;
                    if (result)
                    {
                      result = (uint64_t)dlsym((void *)0xFFFFFFFFFFFFFFFELL, "CFRelease");
                      if (result)
                      {
                        v12 = (FILE *)result;
                        result = (uint64_t)fopen("/System/Library/CoreServices/SystemVersion.plist", "r");
                        if (result)
                        {
                          v13 = (FILE *)result;
                          v27 = v12;
                          fseek((FILE *)result, 0, 2);
                          v14 = ftell(v13);
                          if (v14 < 0)
                          {
                            v16 = 0;
                          }
                          else
                          {
                            v15 = v14;
                            rewind(v13);
                            v16 = malloc(v15);
                            if (v16)
                            {
                              v26 = v16;
                              if (fread(v16, 1uLL, v15, v13) == v15)
                              {
                                v17 = v5(0);
                                if (v17)
                                {
                                  v18 = v17;
                                  v19 = v13;
                                  if (v6)
                                    v20 = ((uint64_t (*)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD))v6)(0, v17, 0, 0, 0);
                                  else
                                    v20 = v7(0, v17, 0, 0);
                                  v21 = v20;
                                  if (v20)
                                  {
                                    v22 = v8(0, "ProductVersion", 1536, v4);
                                    if (v22)
                                    {
                                      v23 = v22;
                                      v24 = v9(v21, v22);
                                      ((void (*)(uint64_t))v27)(v23);
                                      if (v24)
                                      {
                                        v25 = v10(v24);
                                        if (v25 == v11())
                                        {
                                          if (v28(v24, v29, 32, 134217984))
                                            sscanf(v29, "%d.%d.%d", &dword_10003C650, &dword_10003C654, &dword_10003C658);
                                        }
                                      }
                                    }
                                    ((void (*)(uint64_t))v27)(v21);
                                    v19 = v13;
                                  }
                                  ((void (*)(uint64_t))v27)(v18);
                                }
                                else
                                {
                                  v19 = v13;
                                }
                                v16 = v26;
                              }
                              else
                              {
                                v16 = v26;
                                v19 = v13;
                              }
                              goto LABEL_41;
                            }
                          }
                          v19 = v13;
LABEL_41:
                          free(v16);
                          return fclose(v19);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

