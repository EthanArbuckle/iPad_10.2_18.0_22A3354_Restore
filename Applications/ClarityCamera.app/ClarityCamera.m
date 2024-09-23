void type metadata accessor for UIInterfaceOrientation(uint64_t a1)
{
  sub_100006DC0(a1, &qword_10002D388, (uint64_t)&unk_100029440);
}

uint64_t sub_1000056C0@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  __int128 *v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t (*v23)();
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (**v27)();
  _OWORD *v28;
  __int128 v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;

  v2 = v1;
  v38 = a1;
  v34 = sub_1000071DC(&qword_10002D3F8);
  __chkstk_darwin(v34);
  v4 = (uint64_t *)((char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = sub_1000071DC(&qword_10002D400);
  v36 = *(_QWORD *)(v5 - 8);
  v37 = v5;
  __chkstk_darwin(v5);
  v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = sub_1000071DC(&qword_10002D408);
  v8 = __chkstk_darwin(v35);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *v4 = static Alignment.bottom.getter(v8);
  v4[1] = v11;
  v12 = sub_1000071DC(&qword_10002D410);
  sub_100005A04(v2, (uint64_t)v4 + *(int *)(v12 + 44));
  v13 = LocalizedStringKey.init(stringLiteral:)(0x6F746F6850, 0xE500000000000000);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = Image.init(systemName:)(0x662E6172656D6163, 0xEB000000006C6C69);
  *(_QWORD *)&v43 = v20;
  v21 = sub_1000074EC(&qword_10002D418, &qword_10002D3F8, (uint64_t)&protocol conformance descriptor for ZStack<A>);
  View.navigationTitle<A>(_:icon:)(v13, v15, v17 & 1, v19, &v43, v34, &type metadata for Image, v21, &protocol witness table for Image);
  swift_release(v20);
  swift_bridgeObjectRelease(v19);
  swift_bridgeObjectRelease(v15);
  sub_1000077A4((uint64_t)v4, &qword_10002D3F8);
  v22 = *v2;
  v42 = v2[1];
  v43 = v22;
  v39 = v2[2];
  sub_1000075B0((uint64_t)&v39, (uint64_t)&v41, &qword_10002D420);
  sub_1000075B0((uint64_t)&v39 + 8, (uint64_t)&v40, &qword_10002D428);
  v23 = (uint64_t (*)())swift_allocObject(&unk_100029558, 64, 7);
  v24 = v2[1];
  *((_OWORD *)v23 + 1) = *v2;
  *((_OWORD *)v23 + 2) = v24;
  *((_OWORD *)v23 + 3) = v2[2];
  v26 = v36;
  v25 = v37;
  (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v10, v7, v37);
  v27 = (uint64_t (**)())&v10[*(int *)(v35 + 36)];
  *v27 = sub_100007264;
  v27[1] = v23;
  v27[2] = 0;
  v27[3] = 0;
  sub_10000726C((uint64_t)&v43);
  sub_100007294((uint64_t)&v42);
  sub_1000072BC(&v41);
  sub_1000072BC(&v40);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v25);
  v28 = (_OWORD *)swift_allocObject(&unk_100029580, 64, 7);
  v29 = v2[1];
  v28[1] = *v2;
  v28[2] = v29;
  v28[3] = v2[2];
  v30 = v38;
  sub_1000075F4((uint64_t)v10, v38, &qword_10002D408);
  v31 = (_QWORD *)(v30 + *(int *)(sub_1000071DC(&qword_10002D430) + 36));
  *v31 = 0;
  v31[1] = 0;
  v31[2] = sub_1000072E8;
  v31[3] = v28;
  sub_10000726C((uint64_t)&v43);
  sub_100007294((uint64_t)&v42);
  sub_1000072BC(&v41);
  sub_1000072BC(&v40);
  return sub_1000077A4((uint64_t)v10, &qword_10002D408);
}

void sub_100005A04(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
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
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  _OWORD *v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  unint64_t v39;
  uint64_t v40;
  char *v41;
  unint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  uint64_t KeyPath;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  unsigned __int8 v88;
  uint64_t v89;
  unsigned __int8 v90;
  uint64_t v91;
  uint64_t v92;
  __int128 v93;
  uint64_t v94;
  uint64_t v95;
  __int128 v96;
  __int128 v97;

  v4 = type metadata accessor for BorderedProminentButtonStyle(0);
  v85 = *(_QWORD *)(v4 - 8);
  v86 = v4;
  ((void (*)(void))__chkstk_darwin)();
  v84 = (char *)&v61 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = sub_1000071DC(&qword_10002D440);
  v75 = *(_QWORD *)(v77 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v7 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000071DC(&qword_10002D448);
  ((void (*)(void))__chkstk_darwin)();
  v10 = (char *)&v61 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = sub_1000071DC(&qword_10002D450);
  ((void (*)(void))__chkstk_darwin)();
  v12 = (char *)&v61 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v81 = sub_1000071DC(&qword_10002D458);
  v80 = *(_QWORD *)(v81 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v74 = (char *)&v61 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = sub_1000071DC(&qword_10002D460);
  v14 = ((uint64_t (*)(void))__chkstk_darwin)();
  v83 = (uint64_t)&v61 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __chkstk_darwin(v14);
  v18 = (char *)&v61 - v17;
  v19 = __chkstk_darwin(v16);
  v82 = (uint64_t)&v61 - v20;
  v73 = static Alignment.topTrailing.getter(v19);
  v72 = v21;
  v97 = *a1;
  v79 = *((id *)&v97 + 1);
  v22 = ((uint64_t (*)(void))static Alignment.center.getter)();
  v24 = _FrameLayout.init(width:height:alignment:)(&v87, 0x7FF0000000000000, 0, 0x7FF0000000000000, 0, v22, v23);
  v70 = v87;
  v69 = v88;
  v68 = v89;
  v67 = v90;
  v66 = v91;
  v65 = v92;
  v64 = static Alignment.center.getter(v24);
  v63 = v25;
  v96 = a1[1];
  v93 = a1[1];
  sub_1000071DC(&qword_10002D468);
  v26 = State.wrappedValue.getter(&v95);
  if (v95 == 1)
    v28 = static Color.black.getter(v26, v27);
  else
    v28 = static Color.clear.getter(v26);
  v71 = v28;
  KeyPath = swift_getKeyPath(&unk_10001FCD8);
  v93 = a1[2];
  sub_1000075B0((uint64_t)&v93, (uint64_t)&v95, &qword_10002D420);
  sub_1000075B0((uint64_t)&v93 + 8, (uint64_t)&v94, &qword_10002D428);
  v29 = (_OWORD *)swift_allocObject(&unk_1000295D0, 64, 7);
  v30 = a1[1];
  v29[1] = *a1;
  v29[2] = v30;
  v29[3] = a1[2];
  sub_10000726C((uint64_t)&v97);
  sub_100007294((uint64_t)&v96);
  sub_1000072BC(&v95);
  sub_1000072BC(&v94);
  v31 = sub_1000071DC(&qword_10002D470);
  v32 = sub_1000074EC(&qword_10002D478, &qword_10002D470, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  v33 = Button.init(action:label:)(sub_100007440, v29, sub_1000065F0, 0, v31, v32);
  v34 = static Color.yellow.getter(v33);
  v35 = swift_getKeyPath(&unk_10001FD08);
  v36 = v75;
  v37 = v77;
  (*(void (**)(char *, char *, uint64_t))(v75 + 16))(v10, v7, v77);
  v38 = (uint64_t *)&v10[*(int *)(v8 + 36)];
  *v38 = v35;
  v38[1] = v34;
  (*(void (**)(char *, uint64_t))(v36 + 8))(v7, v37);
  v39 = sub_100007450();
  View.accessibilityIdentifier(_:)(0x746F6850656B6174, 0xEF6E6F747475426FLL, v8, v39);
  v40 = sub_1000077A4((uint64_t)v10, &qword_10002D448);
  v41 = v84;
  BorderedProminentButtonStyle.init()(v40);
  v42 = sub_10000752C();
  v43 = sub_100006E5C(&qword_10002D4B0, (uint64_t (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle, (uint64_t)&protocol conformance descriptor for BorderedProminentButtonStyle);
  v44 = v74;
  v45 = v86;
  View.buttonStyle<A>(_:)(v41, v78, v86, v42, v43);
  (*(void (**)(char *, uint64_t))(v85 + 8))(v41, v45);
  v46 = sub_1000077A4((uint64_t)v12, &qword_10002D450);
  LOBYTE(v42) = static Edge.Set.all.getter(v46);
  v47 = v80;
  v48 = v81;
  (*(void (**)(char *, char *, uint64_t))(v80 + 16))(v18, v44, v81);
  v49 = &v18[*(int *)(v76 + 36)];
  *v49 = v42;
  *(_OWORD *)(v49 + 8) = 0u;
  *(_OWORD *)(v49 + 24) = 0u;
  v49[40] = 1;
  (*(void (**)(char *, uint64_t))(v47 + 8))(v44, v48);
  v50 = v82;
  sub_1000075B0((uint64_t)v18, v82, &qword_10002D460);
  v51 = v83;
  sub_1000075F4(v50, v83, &qword_10002D460);
  v52 = v72;
  *(_QWORD *)a2 = v73;
  *(_QWORD *)(a2 + 8) = v52;
  v53 = v79;
  v54 = v70;
  *(_QWORD *)(a2 + 16) = v79;
  *(_QWORD *)(a2 + 24) = v54;
  *(_BYTE *)(a2 + 32) = v69;
  *(_QWORD *)(a2 + 40) = v68;
  *(_BYTE *)(a2 + 48) = v67;
  v55 = v65;
  *(_QWORD *)(a2 + 56) = v66;
  *(_QWORD *)(a2 + 64) = v55;
  v56 = KeyPath;
  v57 = v71;
  *(_QWORD *)(a2 + 72) = KeyPath;
  *(_QWORD *)(a2 + 80) = v57;
  v58 = v63;
  *(_QWORD *)(a2 + 88) = v64;
  *(_QWORD *)(a2 + 96) = v58;
  v59 = sub_1000071DC(&qword_10002D4B8);
  sub_1000075F4(v51, a2 + *(int *)(v59 + 48), &qword_10002D460);
  v60 = v53;
  swift_retain(v56);
  swift_retain(v57);
  sub_1000077A4(v50, &qword_10002D460);
  sub_1000077A4(v51, &qword_10002D460);
  swift_release(v57);
  swift_release(v56);

}

_QWORD *sub_10000608C(__int128 *a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;

  sub_1000071DC(&qword_10002D6B0);
  __chkstk_darwin();
  v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = a1[2];
  v21 = v20;
  v4 = sub_1000071DC(&qword_10002D4D0);
  State.wrappedValue.getter(&v19);
  v5 = v19;
  if ((_QWORD)v19)
  {
    sub_1000071DC(&qword_10002D4D8);
    Task.cancel()();
    swift_release(v5);
  }
  sub_1000075B0((uint64_t)&v21, (uint64_t)&v23, &qword_10002D420);
  sub_1000075B0((uint64_t)&v21 + 8, (uint64_t)&v22, &qword_10002D428);
  v20 = *a1;
  v6 = *((id *)&v20 + 1);
  sub_10000B350();
  sub_1000073D0((uint64_t)&v20);
  v18 = a1[1];
  v19 = v18;
  LOBYTE(v17) = 1;
  v7 = sub_1000071DC(&qword_10002D468);
  State.wrappedValue.setter(&v17, v7);
  v8 = objc_msgSend(objc_allocWithZone((Class)UIImpactFeedbackGenerator), "initWithStyle:", 1);
  objc_msgSend(v8, "impactOccurred");
  v9 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v3, 1, 1, v9);
  type metadata accessor for MainActor(0);
  sub_10000726C((uint64_t)&v20);
  sub_100007294((uint64_t)&v19);
  sub_1000072BC(&v23);
  v10 = sub_1000072BC(&v22);
  v11 = static MainActor.shared.getter(v10);
  v12 = swift_allocObject(&unk_1000295F8, 80, 7);
  *(_QWORD *)(v12 + 16) = v11;
  *(_QWORD *)(v12 + 24) = &protocol witness table for MainActor;
  v13 = a1[1];
  *(_OWORD *)(v12 + 32) = *a1;
  *(_OWORD *)(v12 + 48) = v13;
  *(_OWORD *)(v12 + 64) = a1[2];
  v14 = sub_1000064BC((uint64_t)v3, (uint64_t)&unk_10002D4E8, v12);
  v18 = v21;
  v17 = v14;
  sub_1000072BC(&v23);
  sub_1000072BC(&v22);
  swift_retain(v14);
  State.wrappedValue.setter(&v17, v4);
  swift_release(v14);

  sub_10000777C(&v23);
  return sub_10000777C(&v22);
}

uint64_t sub_1000062F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;

  v4[2] = a4;
  v5 = type metadata accessor for MainActor(0);
  v4[3] = v5;
  v4[4] = static MainActor.shared.getter(v5);
  v6 = (_QWORD *)swift_task_alloc(async function pointer to static Task<>.sleep(nanoseconds:)[1]);
  v4[5] = v6;
  *v6 = v4;
  v6[1] = sub_100006360;
  return static Task<>.sleep(nanoseconds:)(50000000);
}

uint64_t sub_100006360()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 40);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 24);
  *(_QWORD *)(*(_QWORD *)v1 + 48) = v0;
  swift_task_dealloc(v2);
  v5 = dispatch thunk of Actor.unownedExecutor.getter(v3, &protocol witness table for MainActor);
  if (v0)
    v6 = sub_100006488;
  else
    v6 = sub_1000063E8;
  return swift_task_switch(v6, v5, v4);
}

uint64_t sub_1000063E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  swift_release(*(_QWORD *)(v0 + 32));
  v2 = static Animation.spring(response:dampingFraction:blendDuration:)(0.5, 1.0, 0.0);
  v3 = swift_task_alloc(32);
  *(_QWORD *)(v3 + 16) = v1;
  withAnimation<A>(_:_:)(v2, sub_1000077E0, v3, (char *)&type metadata for () + 8);
  swift_release(v2);
  swift_task_dealloc(v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100006488()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000064BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  unsigned __int8 v16;
  _QWORD v18[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_1000077A4(a1, &qword_10002D6B0);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (!v9)
    {
LABEL_6:
      v15 = 0;
      return swift_task_create(v8, v15, (char *)&type metadata for () + 8, a2, a3);
    }
  }
  else
  {
    v16 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v16 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (!v9)
      goto LABEL_6;
  }
  v10 = *(_QWORD *)(a3 + 24);
  ObjectType = swift_getObjectType(v9);
  swift_unknownObjectRetain(v9);
  v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
  v14 = v13;
  swift_unknownObjectRelease(v9);
  if (!(v14 | v12))
    goto LABEL_6;
  v18[0] = 0;
  v18[1] = 0;
  v15 = v18;
  v18[2] = v12;
  v18[3] = v14;
  return swift_task_create(v8, v15, (char *)&type metadata for () + 8, a2, a3);
}

uint64_t sub_1000065F0()
{
  uint64_t v0;
  unint64_t v1;

  v0 = sub_1000071DC(&qword_10002D4C0);
  v1 = sub_100007638();
  return Label.init(title:icon:)(sub_100006654, 0, sub_100006744, 0, &type metadata for Text, v0, &protocol witness table for Text, v1);
}

uint64_t sub_100006654@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;

  v2 = LocalizedStringKey.init(stringLiteral:)(0x6F685020656B6154, 0xEA00000000006F74);
  v3 = Text.init(_:tableName:bundle:comment:)(v2);
  v5 = v4;
  v7 = v6;
  v9 = v8 & 1;
  v10 = static Color.black.getter(v3, v4);
  v11 = Text.foregroundColor(_:)(v10, v3, v5, v9, v7);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  swift_release(v10);
  sub_1000076BC(v3, v5, v9);
  result = swift_bridgeObjectRelease(v7);
  *(_QWORD *)a1 = v11;
  *(_QWORD *)(a1 + 8) = v13;
  *(_BYTE *)(a1 + 16) = v15 & 1;
  *(_QWORD *)(a1 + 24) = v17;
  return result;
}

uint64_t sub_100006744@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = Image.init(systemName:)(0x662E6172656D6163, 0xEB000000006C6C69);
  v3 = static Color.black.getter();
  result = swift_getKeyPath(&unk_10001FCD8);
  *a1 = v2;
  a1[1] = result;
  a1[2] = v3;
  return result;
}

uint64_t sub_1000067A8(__int128 *a1)
{
  id v1;
  __int128 v3;

  v3 = *a1;
  v1 = *((id *)&v3 + 1);
  sub_10000A080();
  return sub_1000073D0((uint64_t)&v3);
}

uint64_t sub_1000067E8(__int128 *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  __int128 v12;

  v2 = sub_1000071DC(&qword_10002D6B0);
  __chkstk_darwin(v2);
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *a1;
  v5 = (void *)*((_QWORD *)&v12 + 1);
  v6 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v4, 1, 1, v6);
  type metadata accessor for MainActor(0);
  v7 = v5;
  v8 = static MainActor.shared.getter(v7);
  v9 = (_QWORD *)swift_allocObject(&unk_1000295A8, 40, 7);
  v9[2] = v8;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v7;
  v10 = sub_100009270((uint64_t)v4, (uint64_t)&unk_10002D438, (uint64_t)v9);
  swift_release(v10);
  return sub_1000073D0((uint64_t)&v12);
}

uint64_t sub_1000068E8()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100006900@<X0>(uint64_t a1@<X8>)
{
  return sub_1000056C0(a1);
}

uint64_t sub_100006938(uint64_t a1, uint64_t a2)
{
  return sub_100006C10(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100006950(uint64_t a1, id *a2)
{
  uint64_t result;
  uint64_t v5;
  NSString v6;
  uint64_t v7;
  uint64_t v8;

  v7 = 0;
  v8 = 0;
  result = static String._forceBridgeFromObjectiveC(_:result:)(a1, &v7);
  v5 = v8;
  if (v8)
  {
    v6 = String._bridgeToObjectiveC()();
    result = swift_bridgeObjectRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
  return result;
}

uint64_t sub_1000069C4(uint64_t a1, id *a2)
{
  char v4;
  uint64_t v5;
  NSString v6;
  uint64_t v8;
  uint64_t v9;

  v8 = 0;
  v9 = 0;
  v4 = static String._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v8);
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
  *a2 = v6;
  return v4 & 1;
}

uint64_t sub_100006A40@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  uint64_t result;

  static String._unconditionallyBridgeFromObjectiveC(_:)();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a1 = v4;
  return result;
}

uint64_t sub_100006A84@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;
  uint64_t v4;

  result = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100006AB0@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  NSString v4;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = String._bridgeToObjectiveC()();
  result = swift_bridgeObjectRelease(v3);
  *a2 = v4;
  return result;
}

uint64_t sub_100006AF4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100006E5C(&qword_10002D3D8, (uint64_t (*)(uint64_t))type metadata accessor for DeviceType, (uint64_t)&unk_10001FBE0);
  v3 = sub_100006E5C(&qword_10002D3E0, (uint64_t (*)(uint64_t))type metadata accessor for DeviceType, (uint64_t)&unk_10001FB88);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100006B78(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_100006E5C(&qword_10002D3E8, (uint64_t (*)(uint64_t))type metadata accessor for AVVideoCodecType, (uint64_t)&unk_10001FAA0);
  v3 = sub_100006E5C(&qword_10002D3F0, (uint64_t (*)(uint64_t))type metadata accessor for AVVideoCodecType, (uint64_t)&unk_10001FA48);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100006C04(uint64_t a1, uint64_t a2)
{
  return sub_100006C10(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100006C10(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v3);
  v7 = v6;
  v8 = a3(v5);
  swift_bridgeObjectRelease(v7);
  return v8;
}

uint64_t sub_100006C4C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  String.hash(into:)(a1, v3, v4);
  return swift_bridgeObjectRelease(v5);
}

Swift::Int sub_100006C8C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::Int v6;
  _QWORD v8[9];

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*v1);
  v5 = v4;
  Hasher.init(_seed:)(v8, a1);
  String.hash(into:)(v8, v3, v5);
  v6 = Hasher._finalize()();
  swift_bridgeObjectRelease(v5);
  return v6;
}

uint64_t sub_100006CFC(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  char v10;

  v2 = *a2;
  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(*a1);
  v5 = v4;
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);
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

void type metadata accessor for UIDeviceOrientation(uint64_t a1)
{
  sub_100006DC0(a1, &qword_10002D390, (uint64_t)&unk_100029460);
}

void type metadata accessor for DeviceType(uint64_t a1)
{
  sub_100006DC0(a1, &qword_10002D398, (uint64_t)&unk_100029480);
}

void type metadata accessor for AVVideoCodecType(uint64_t a1)
{
  sub_100006DC0(a1, &qword_10002D3A0, (uint64_t)&unk_1000294A8);
}

void sub_100006DC0(uint64_t a1, unint64_t *a2, uint64_t a3)
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

uint64_t sub_100006E04()
{
  return sub_100006E5C(&qword_10002D3A8, (uint64_t (*)(uint64_t))type metadata accessor for AVVideoCodecType, (uint64_t)&unk_10001FA10);
}

uint64_t sub_100006E30()
{
  return sub_100006E5C(&qword_10002D3B0, (uint64_t (*)(uint64_t))type metadata accessor for AVVideoCodecType, (uint64_t)&unk_10001F9E8);
}

uint64_t sub_100006E5C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_100006E9C()
{
  return sub_100006E5C(&qword_10002D3B8, (uint64_t (*)(uint64_t))type metadata accessor for AVVideoCodecType, (uint64_t)&unk_10001FA78);
}

uint64_t sub_100006EC8()
{
  return sub_100006E5C(&qword_10002D3C0, (uint64_t (*)(uint64_t))type metadata accessor for DeviceType, (uint64_t)&unk_10001FB50);
}

uint64_t sub_100006EF4()
{
  return sub_100006E5C(&qword_10002D3C8, (uint64_t (*)(uint64_t))type metadata accessor for DeviceType, (uint64_t)&unk_10001FB28);
}

uint64_t sub_100006F20()
{
  return sub_100006E5C(&qword_10002D3D0, (uint64_t (*)(uint64_t))type metadata accessor for DeviceType, (uint64_t)&unk_10001FBB8);
}

uint64_t initializeBufferWithCopyOfBuffer for CameraPhotoView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for CameraPhotoView(uint64_t a1)
{

  swift_release(*(_QWORD *)(a1 + 24));
  swift_release(*(_QWORD *)(a1 + 32));
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t initializeWithCopy for CameraPhotoView(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v6;
  v7 = v3;
  swift_retain(v4);
  swift_retain(v5);
  swift_retain(v6);
  return a1;
}

uint64_t assignWithCopy for CameraPhotoView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  v6 = v4;

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v8;
  swift_retain(v8);
  swift_release(v7);
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v10;
  swift_retain(v10);
  swift_release(v9);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v12;
  swift_retain(v12);
  swift_release(v11);
  return a1;
}

__n128 initializeWithTake for CameraPhotoView(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for CameraPhotoView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(void **)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;

  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_release(*(_QWORD *)(a1 + 24));
  v6 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release(v6);
  v7 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release(v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for CameraPhotoView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for CameraPhotoView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for CameraPhotoView()
{
  return &type metadata for CameraPhotoView;
}

uint64_t sub_1000071CC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000218C4, 1);
}

uint64_t sub_1000071DC(uint64_t *a1)
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

uint64_t sub_10000721C(uint64_t *a1)
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

uint64_t sub_100007264()
{
  uint64_t v0;

  return sub_1000067A8((__int128 *)(v0 + 16));
}

uint64_t sub_10000726C(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 8);
  return a1;
}

uint64_t sub_100007294(uint64_t a1)
{
  swift_retain(*(_QWORD *)(a1 + 8));
  return a1;
}

_QWORD *sub_1000072BC(_QWORD *a1)
{
  swift_retain(*a1);
  return a1;
}

uint64_t sub_1000072E8()
{
  uint64_t v0;

  return sub_1000067E8((__int128 *)(v0 + 16));
}

uint64_t sub_1000072F0()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000731C(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_10002D7A4);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_100007388;
  return sub_10000BCDC(a1, v4, v5, v6);
}

uint64_t sub_100007388()
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

uint64_t sub_1000073D0(uint64_t a1)
{

  return a1;
}

uint64_t sub_100007404()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 48));
  swift_release(*(_QWORD *)(v0 + 56));
  return swift_deallocObject(v0, 64, 7);
}

_QWORD *sub_100007440()
{
  uint64_t v0;

  return sub_10000608C((__int128 *)(v0 + 16));
}

unint64_t sub_100007450()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D480;
  if (!qword_10002D480)
  {
    v1 = sub_10000721C(&qword_10002D448);
    sub_1000074EC(&qword_10002D488, &qword_10002D440, (uint64_t)&protocol conformance descriptor for Button<A>);
    sub_1000074EC(&qword_10002D490, &qword_10002D498, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D480);
  }
  return result;
}

uint64_t sub_1000074EC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10000721C(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000752C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D4A0;
  if (!qword_10002D4A0)
  {
    v1 = sub_10000721C(&qword_10002D450);
    sub_100007450();
    sub_100006E5C((unint64_t *)&qword_10002D4A8, (uint64_t (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier, (uint64_t)&protocol conformance descriptor for AccessibilityAttachmentModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D4A0);
  }
  return result;
}

uint64_t sub_1000075B0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000071DC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000075F4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_1000071DC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_100007638()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D4C8;
  if (!qword_10002D4C8)
  {
    v1 = sub_10000721C(&qword_10002D4C0);
    sub_1000074EC(&qword_10002D490, &qword_10002D498, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D4C8);
  }
  return result;
}

uint64_t sub_1000076BC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_1000076CC()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  swift_release(*(_QWORD *)(v0 + 56));
  swift_release(*(_QWORD *)(v0 + 64));
  swift_release(*(_QWORD *)(v0 + 72));
  return swift_deallocObject(v0, 80, 7);
}

uint64_t sub_100007710(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = (_QWORD *)swift_task_alloc(dword_10002D4E4);
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_100007388;
  return sub_1000062F4(a1, v4, v5, v1 + 32);
}

_QWORD *sub_10000777C(_QWORD *a1)
{
  swift_release(*a1);
  return a1;
}

uint64_t sub_1000077A4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1000071DC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000077E0()
{
  uint64_t v0;
  uint64_t v1;
  char v3;
  __int128 v4;

  v4 = *(_OWORD *)(*(_QWORD *)(v0 + 16) + 16);
  v3 = 0;
  v1 = sub_1000071DC(&qword_10002D468);
  return State.wrappedValue.setter(&v3, v1);
}

unint64_t sub_100007838()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D4F0;
  if (!qword_10002D4F0)
  {
    v1 = sub_10000721C(&qword_10002D430);
    sub_1000078A4();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D4F0);
  }
  return result;
}

unint64_t sub_1000078A4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_10002D4F8;
  if (!qword_10002D4F8)
  {
    v1 = sub_10000721C(&qword_10002D408);
    v2[0] = sub_10000721C(&qword_10002D3F8);
    v2[1] = &type metadata for Image;
    v2[2] = sub_1000074EC(&qword_10002D418, &qword_10002D3F8, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    v2[3] = &protocol witness table for Image;
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.navigationTitle<A>(_:icon:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D4F8);
  }
  return result;
}

char *sub_100007974()
{
  id v0;

  v0 = objc_allocWithZone((Class)type metadata accessor for CameraModel(0));
  return sub_100009708(2);
}

__n128 sub_1000079A4@<Q0>(__n128 *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  __n128 result;
  uint64_t v15;
  __n128 v16;

  v3 = *v1;
  v4 = v1[1];
  v5 = *((unsigned __int8 *)v1 + 16);
  v6 = type metadata accessor for CameraModel(0);
  v7 = sub_100007C48();
  v8 = StateObject.wrappedValue.getter(v3, v4, v5, v6, v7);
  v9 = ObservedObject.init(wrappedValue:)(v8, v6, v7);
  v11 = v10;
  LOBYTE(v15) = 0;
  State.init(wrappedValue:)(&v16, &v15, &type metadata for Bool);
  LOBYTE(v4) = v16.n128_u8[0];
  v12 = v16.n128_u64[1];
  v15 = 0;
  v13 = sub_1000071DC(&qword_10002D420);
  State.init(wrappedValue:)(&v16, &v15, v13);
  result = v16;
  a1->n128_u64[0] = v9;
  a1->n128_u64[1] = v11;
  a1[1].n128_u8[0] = v4;
  a1[1].n128_u64[1] = v12;
  a1[2] = result;
  return result;
}

id sub_100007A78(uint64_t a1, void *a2, char a3)
{
  if ((a3 & 1) != 0)
    return a2;
  else
    return (id)swift_retain(a2);
}

void destroy for FrontCameraPhotoView(uint64_t a1)
{
  sub_100007A98(*(_QWORD *)a1, *(void **)(a1 + 8), *(_BYTE *)(a1 + 16));
}

void sub_100007A98(uint64_t a1, void *a2, char a3)
{
  if ((a3 & 1) != 0)

  else
    swift_release(a2);
}

uint64_t _s13ClarityCamera20FrontCameraPhotoViewVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_100007A78(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for FrontCameraPhotoView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(void **)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_100007A78(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(void **)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_100007A98(v6, v7, v8);
  return a1;
}

__n128 initializeWithTake for FrontCameraPhotoView(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for FrontCameraPhotoView(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  void *v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(void **)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_100007A98(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for FrontCameraPhotoView(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for FrontCameraPhotoView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for FrontCameraPhotoView()
{
  return &type metadata for FrontCameraPhotoView;
}

uint64_t sub_100007C38(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100021908, 1);
}

unint64_t sub_100007C48()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D500;
  if (!qword_10002D500)
  {
    v1 = type metadata accessor for CameraModel(255);
    result = swift_getWitnessTable(&unk_100020090, v1);
    atomic_store(result, (unint64_t *)&qword_10002D500);
  }
  return result;
}

unint64_t sub_100007C94()
{
  unint64_t result;

  result = qword_10002D508;
  if (!qword_10002D508)
  {
    result = swift_getWitnessTable(&unk_10001FC88, &type metadata for CameraPhotoView);
    atomic_store(result, (unint64_t *)&qword_10002D508);
  }
  return result;
}

char *sub_100007CD8()
{
  id v0;

  v0 = objc_allocWithZone((Class)type metadata accessor for CameraModel(0));
  return sub_100009708(0);
}

ValueMetadata *type metadata accessor for BackCameraPhotoView()
{
  return &type metadata for BackCameraPhotoView;
}

uint64_t sub_100007D18(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10002194C, 1);
}

char *sub_100007D28()
{
  id v0;

  v0 = objc_allocWithZone((Class)type metadata accessor for CameraModel(0));
  return sub_100009708(3);
}

uint64_t sub_100007D58@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v3 = *v1;
  v4 = v1[1];
  v5 = *((unsigned __int8 *)v1 + 16);
  v6 = type metadata accessor for CameraModel(0);
  v7 = sub_100007C48();
  v8 = StateObject.wrappedValue.getter(v3, v4, v5, v6, v7);
  result = ObservedObject.init(wrappedValue:)(v8, v6, v7);
  *a1 = result;
  a1[1] = v10;
  return result;
}

ValueMetadata *type metadata accessor for FrontCameraVideoView()
{
  return &type metadata for FrontCameraVideoView;
}

uint64_t sub_100007DD8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100021990, 1);
}

unint64_t sub_100007DEC()
{
  unint64_t result;

  result = qword_10002D510;
  if (!qword_10002D510)
  {
    result = swift_getWitnessTable(&unk_1000201B8, &type metadata for CameraVideoView);
    atomic_store(result, (unint64_t *)&qword_10002D510);
  }
  return result;
}

uint64_t sub_100007E30@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  void (*v23)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v28 = a1;
  v27 = sub_1000071DC(&qword_10002D520);
  __chkstk_darwin(v27);
  v2 = (char *)&v25 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1000071DC(&qword_10002D528);
  v26 = *(_QWORD *)(v3 - 8);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v25 - v7;
  v9 = sub_1000071DC(&qword_10002D530);
  v25 = *(_QWORD *)(v9 - 8);
  v10 = v25;
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = (char *)&v25 - v14;
  v16 = sub_1000071DC(&qword_10002D538);
  v17 = sub_1000082AC();
  WindowGroup.init(id:title:lazyContent:)(0, 0, 0, 0, 0, 0, sub_100008074, 0, v16, v17);
  ClarityUIScene.init(content:)(sub_100008074, 0, v16, v17);
  v18 = *(void (**)(char *, char *, uint64_t))(v10 + 16);
  v18(v13, v15, v9);
  v19 = v26;
  v20 = *(void (**)(char *, char *, uint64_t))(v26 + 16);
  v20(v6, v8, v3);
  v18(v2, v13, v9);
  v21 = v27;
  v20(&v2[*(int *)(v27 + 48)], v6, v3);
  _TupleScene.init(_:)(v2, v21);
  v22 = *(void (**)(char *, uint64_t))(v19 + 8);
  v22(v8, v3);
  v23 = *(void (**)(char *, uint64_t))(v25 + 8);
  v23(v15, v9);
  v22(v6, v3);
  return ((uint64_t (*)(char *, uint64_t))v23)(v13, v9);
}

uint64_t sub_100008078(uint64_t a1)
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

uint64_t sub_1000080F4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t KeyPath;
  uint64_t v11;

  v2 = sub_1000071DC(&qword_10002D558);
  __chkstk_darwin(v2);
  v4 = (uint64_t *)((char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = type metadata accessor for ColorScheme(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_10001FEE8);
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, enum case for ColorScheme.dark(_:), v5);
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))((char *)v4 + *(int *)(v2 + 28), v8, v5);
  *v4 = KeyPath;
  sub_100008398((uint64_t)v4, a1);
  sub_1000083E0((uint64_t)v4);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100008248();
  static App.main()();
  return 0;
}

unint64_t sub_100008248()
{
  unint64_t result;

  result = qword_10002D518;
  if (!qword_10002D518)
  {
    result = swift_getWitnessTable(&unk_10001FEA4, &type metadata for ClarityCameraApp);
    atomic_store(result, (unint64_t *)&qword_10002D518);
  }
  return result;
}

ValueMetadata *type metadata accessor for ClarityCameraApp()
{
  return &type metadata for ClarityCameraApp;
}

uint64_t sub_10000829C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000219D4, 1);
}

unint64_t sub_1000082AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D540;
  if (!qword_10002D540)
  {
    v1 = sub_10000721C(&qword_10002D538);
    sub_100008330();
    sub_1000074EC(&qword_10002D550, &qword_10002D558, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D540);
  }
  return result;
}

unint64_t sub_100008330()
{
  unint64_t result;

  result = qword_10002D548;
  if (!qword_10002D548)
  {
    result = swift_getWitnessTable(&unk_1000202F8, &type metadata for ContentView);
    atomic_store(result, (unint64_t *)&qword_10002D548);
  }
  return result;
}

uint64_t sub_100008374()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100008398(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000071DC(&qword_10002D558);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000083E0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000071DC(&qword_10002D558);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100008420()
{
  return sub_1000074EC(&qword_10002D560, &qword_10002D568, (uint64_t)&protocol conformance descriptor for _TupleScene<A>);
}

uint64_t sub_10000844C(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_100008484 + 4 * byte_10001FF18[a1]))(0xD000000000000010, 0x8000000100020F00);
}

uint64_t sub_100008484()
{
  return 0x656D61436B636162;
}

uint64_t sub_1000084CC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_100008504 + 4 * byte_10001FF1C[a1]))(0xD000000000000010, 0x8000000100020F00);
}

uint64_t sub_100008504()
{
  return 0x656D61436B636162;
}

void sub_10000854C(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_100008598()
{
  swift_bridgeObjectRelease(0xEF6F746F68506172);
  return 1;
}

void sub_1000086CC(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_100008718(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_100008790 + 4 * byte_10001FF28[a2]))(0x656D61436B636162);
}

uint64_t sub_100008790(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x656D61436B636162 && v1 == 0xEF6F746F68506172)
    v2 = 1;
  else
    v2 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, v1, 0x656D61436B636162, 0xEF6F746F68506172, 0);
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(0xEF6F746F68506172);
  return v2 & 1;
}

void sub_10000884C(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_10000889C()
{
  char v1;

  v1 = _stringCompareWithSmolCheck(_:_:expecting:)(0x656D61436B636162, 0xEF6F746F68506172, 0x656D61436B636162, 0xEF6F656469566172, 0);
  swift_bridgeObjectRelease(0xEF6F746F68506172);
  if ((v1 & 1) == 0)
    __asm { BR              X13 }
  return 1;
}

void sub_1000089F4(char a1)
{
  __asm { BR              X13 }
}

uint64_t sub_100008A80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  char v3;

  v3 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, 0xEF6F656469566172, 0xD000000000000010, a2 | 0x8000000000000000, 0);
  swift_bridgeObjectRelease(0xEF6F656469566172);
  if ((v3 & 1) == 0)
    __asm { BR              X12 }
  return 1;
}

void sub_100008B9C(char *a1)
{
  sub_1000086CC(*a1);
}

void sub_100008BA8()
{
  char *v0;

  sub_100008BB0(*v0);
}

void sub_100008BB0(char a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, 0);
  __asm { BR              X10 }
}

Swift::Int sub_100008C08()
{
  uint64_t v1;

  String.hash(into:)(&v1, 0x656D61436B636162, 0xEF6F746F68506172);
  swift_bridgeObjectRelease(0xEF6F746F68506172);
  return Hasher._finalize()();
}

void sub_100008C80(uint64_t a1)
{
  char *v1;

  sub_100008C88(a1, *v1);
}

void sub_100008C88(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_100008CCC(uint64_t a1)
{
  String.hash(into:)(a1, 0x656D61436B636162, 0xEF6F746F68506172);
  return swift_bridgeObjectRelease(0xEF6F746F68506172);
}

void sub_100008D28(uint64_t a1)
{
  char *v1;

  sub_100008D30(a1, *v1);
}

void sub_100008D30(uint64_t a1, char a2)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, a1);
  __asm { BR              X10 }
}

Swift::Int sub_100008D84()
{
  uint64_t v1;

  String.hash(into:)(&v1, 0x656D61436B636162, 0xEF6F746F68506172);
  swift_bridgeObjectRelease(0xEF6F746F68506172);
  return Hasher._finalize()();
}

unint64_t sub_100008DFC@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_10000CF90(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100008E28@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_1000084CC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100008E50@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_10000844C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_100008E78()
{
  return sub_1000096A0((uint64_t)&unk_100020110, (uint64_t)&unk_100020138);
}

void sub_100008E8C(char a1)
{
  void *v1;
  int v2;
  uint64_t KeyPath;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  void *v12;
  SystemSoundID v13;
  uint64_t v14;
  void **v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  double (*v19)();
  uint64_t v20;

  v2 = a1 & 1;
  KeyPath = swift_getKeyPath(&unk_1000200C8);
  v4 = swift_getKeyPath(&unk_1000200F0);
  static Published.subscript.getter(&v15, v1, KeyPath, v4);
  swift_release(v4);
  swift_release(KeyPath);
  if (v15 != v2)
  {
    v5 = swift_getKeyPath(&unk_100020110);
    v6 = swift_getKeyPath(&unk_100020138);
    LOBYTE(v15) = 0;
    v7 = v1;
    static Published.subscript.setter(&v15, v7, v5, v6);
    v8 = swift_getKeyPath(&unk_1000200C8);
    v9 = swift_getKeyPath(&unk_1000200F0);
    static Published.subscript.getter(&v15, v7, v8, v9);
    swift_release(v9);
    *(_QWORD *)&v10 = swift_release(v8).n128_u64[0];
    if (v15 == 1)
    {
      v11 = swift_allocObject(&unk_100029A78, 24, 7);
      swift_unknownObjectWeakInit(v11 + 16, v7);
      v19 = sub_10000D2B4;
      v20 = v11;
      v15 = _NSConcreteStackBlock;
      v16 = 1107296256;
      v17 = sub_1000093BC;
      v18 = &unk_100029AB8;
      v12 = _Block_copy(&v15);
      swift_release(v20);
      v13 = 1117;
    }
    else
    {
      objc_msgSend(*(id *)&v7[OBJC_IVAR____TtC13ClarityCamera11CameraModel_videoOutput], "stopRecording", v10);
      v14 = swift_allocObject(&unk_100029A78, 24, 7);
      swift_unknownObjectWeakInit(v14 + 16, v7);
      v19 = sub_10000D274;
      v20 = v14;
      v15 = _NSConcreteStackBlock;
      v16 = 1107296256;
      v17 = sub_1000093BC;
      v18 = &unk_100029A90;
      v12 = _Block_copy(&v15);
      swift_release(v20);
      v13 = 1118;
    }
    AudioServicesPlaySystemSoundWithCompletion(v13, v12);
    _Block_release(v12);
  }
}

uint64_t sub_1000090AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v4 + 40) = a4;
  v5 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v4 + 48) = static MainActor.shared.getter(v5);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  return swift_task_switch(sub_100009118, v6, v7);
}

uint64_t sub_100009118()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t Strong;
  __n128 v3;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;

  v1 = *(_QWORD *)(v0 + 40);
  swift_release(*(_QWORD *)(v0 + 48));
  v1 += 16;
  swift_beginAccess(v1, v0 + 16, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v4 = Strong;
    AudioServicesDisposeSystemSoundID(0x45Du);
    sub_10000B8C4();
    KeyPath = swift_getKeyPath(&unk_100020110);
    v6 = swift_getKeyPath(&unk_100020138);
    *(_BYTE *)(v0 + 56) = 1;
    static Published.subscript.setter(v0 + 56, v4, KeyPath, v6);
  }
  else
  {
    if (qword_10002D380 != -1)
      swift_once(&qword_10002D380, sub_10001354C, v3);
    v7 = type metadata accessor for Logger(0);
    v8 = sub_10000CFD8(v7, (uint64_t)qword_10002FB88);
    v9 = Logger.logObject.getter(v8);
    v10 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Unable to play begin recording system sound", v11, 2u);
      swift_slowDealloc(v11, -1, -1);
    }

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_100009270(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD v19[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) == 1)
  {
    sub_1000077A4(a1, &qword_10002D6B0);
    v8 = 7168;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
    {
LABEL_3:
      v10 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v9);
      swift_unknownObjectRetain(v9);
      v12 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v10);
      v14 = v13;
      swift_unknownObjectRelease(v9);
      goto LABEL_6;
    }
  }
  else
  {
    v15 = TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v8 = v15 | 0x1C00;
    v9 = *(_QWORD *)(a3 + 16);
    if (v9)
      goto LABEL_3;
  }
  v12 = 0;
  v14 = 0;
LABEL_6:
  v16 = swift_allocObject(&unk_100029A50, 32, 7);
  *(_QWORD *)(v16 + 16) = a2;
  *(_QWORD *)(v16 + 24) = a3;
  if (v14 | v12)
  {
    v19[0] = 0;
    v19[1] = 0;
    v17 = v19;
    v19[2] = v12;
    v19[3] = v14;
  }
  else
  {
    v17 = 0;
  }
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_10002E260, v16);
}

uint64_t sub_1000093BC(uint64_t a1)
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

double sub_1000093E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  double result;
  uint64_t v15;

  v6 = sub_1000071DC(&qword_10002D6B0);
  __chkstk_darwin(v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  type metadata accessor for MainActor(0);
  v10 = swift_retain(a1);
  v11 = static MainActor.shared.getter(v10);
  v12 = (_QWORD *)swift_allocObject(a2, 40, 7);
  v12[2] = v11;
  v12[3] = &protocol witness table for MainActor;
  v12[4] = a1;
  v13 = sub_100009270((uint64_t)v8, a3, (uint64_t)v12);
  *(_QWORD *)&result = swift_release(v13).n128_u64[0];
  return result;
}

uint64_t sub_1000094CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v4 + 40) = a4;
  v5 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v4 + 48) = static MainActor.shared.getter(v5);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  return swift_task_switch(sub_100009538, v6, v7);
}

uint64_t sub_100009538()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t Strong;
  __n128 v3;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;

  v1 = *(_QWORD *)(v0 + 40);
  swift_release(*(_QWORD *)(v0 + 48));
  v1 += 16;
  swift_beginAccess(v1, v0 + 16, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v4 = Strong;
    AudioServicesDisposeSystemSoundID(0x45Eu);
    KeyPath = swift_getKeyPath(&unk_100020110);
    v6 = swift_getKeyPath(&unk_100020138);
    *(_BYTE *)(v0 + 56) = 1;
    static Published.subscript.setter(v0 + 56, v4, KeyPath, v6);
  }
  else
  {
    if (qword_10002D380 != -1)
      swift_once(&qword_10002D380, sub_10001354C, v3);
    v7 = type metadata accessor for Logger(0);
    v8 = sub_10000CFD8(v7, (uint64_t)qword_10002FB88);
    v9 = Logger.logObject.getter(v8);
    v10 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "Unable to play end recording system sound", v11, 2u);
      swift_slowDealloc(v11, -1, -1);
    }

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000968C()
{
  return sub_1000096A0((uint64_t)&unk_1000200C8, (uint64_t)&unk_1000200F0);
}

uint64_t sub_1000096A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v7;

  KeyPath = swift_getKeyPath(a1);
  v5 = swift_getKeyPath(a2);
  static Published.subscript.getter(&v7, v2, KeyPath, v5);
  swift_release(v5);
  swift_release(KeyPath);
  return v7;
}

char *sub_100009708(char a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  char *v8;
  void (*v9)(char *, char *, uint64_t);
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __objc2_prot_list *v16;
  id v17;
  id v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  __n128 v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  const char *v33;
  uint64_t v34;
  __n128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  objc_class *v42;
  char *v43;
  id v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  id v49;
  uint64_t v51;
  uint64_t v52;
  objc_super v53;

  v3 = sub_1000071DC(&qword_10002D790);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_DWORD *)&v1[OBJC_IVAR____TtC13ClarityCamera11CameraModel_beginRecordingSoundID] = 1117;
  *(_DWORD *)&v1[OBJC_IVAR____TtC13ClarityCamera11CameraModel_endRecordingSoundID] = 1118;
  v7 = &v1[OBJC_IVAR____TtC13ClarityCamera11CameraModel__recordButtonEnabled];
  LOBYTE(v52) = 1;
  v8 = v1;
  Published.init(initialValue:)(&v52, &type metadata for Bool);
  v9 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
  v9(v7, v6, v3);
  v10 = &v8[OBJC_IVAR____TtC13ClarityCamera11CameraModel__isRecordingVideo];
  LOBYTE(v52) = 0;
  Published.init(initialValue:)(&v52, &type metadata for Bool);
  v9(v10, v6, v3);
  v11 = &v8[OBJC_IVAR____TtC13ClarityCamera11CameraModel_captureSessionRuntimeErrorSubscription];
  *(_OWORD *)v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;
  *((_QWORD *)v11 + 4) = 0;
  v12 = OBJC_IVAR____TtC13ClarityCamera11CameraModel_captureSession;
  *(_QWORD *)&v8[v12] = objc_msgSend(objc_allocWithZone((Class)AVCaptureSession), "init");
  v13 = OBJC_IVAR____TtC13ClarityCamera11CameraModel_photoOutput;
  *(_QWORD *)&v8[v13] = objc_msgSend(objc_allocWithZone((Class)AVCapturePhotoOutput), "init");
  v14 = OBJC_IVAR____TtC13ClarityCamera11CameraModel_videoOutput;
  *(_QWORD *)&v8[v14] = objc_msgSend(objc_allocWithZone((Class)AVCaptureMovieFileOutput), "init");
  *(_QWORD *)&v8[OBJC_IVAR____TtC13ClarityCamera11CameraModel_videoDeviceInput] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC13ClarityCamera11CameraModel_audioDeviceInput] = 0;
  *(_QWORD *)&v8[OBJC_IVAR____TtC13ClarityCamera11CameraModel_currentPhoto] = 0;
  v8[OBJC_IVAR____TtC13ClarityCamera11CameraModel_mode] = a1;
  v15 = (void *)objc_opt_self(UIDevice);
  v16 = &CameraModel;
  v17 = objc_msgSend(v15, "currentDevice");
  v18 = objc_msgSend(v17, "orientation");

  v19 = static UIInterfaceOrientation.fromDeviceOrientation(_:)((uint64_t)v18);
  if ((v20 & 1) != 0)
  {
    v34 = static UIInterfaceOrientation.window.getter();
    *(_QWORD *)&v8[OBJC_IVAR____TtC13ClarityCamera11CameraModel_lastSeenValidOrientation] = v34;

    if (qword_10002D380 != -1)
      swift_once(&qword_10002D380, sub_10001354C, v35);
    v36 = type metadata accessor for Logger(0);
    v37 = sub_10000CFD8(v36, (uint64_t)qword_10002FB88);
    v25 = Logger.logObject.getter(v37);
    v26 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc(12, -1);
      v28 = swift_slowAlloc(32, -1);
      v51 = v34;
      v52 = v28;
      *(_DWORD *)v27 = 136315138;
      type metadata accessor for UIInterfaceOrientation(0);
      v39 = String.init<A>(describing:)(&v51, v38);
      v41 = v40;
      v51 = sub_1000127E8(v39, v40, &v52);
      v16 = &CameraModel;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52, v27 + 4, v27 + 12);
      swift_bridgeObjectRelease(v41);
      v33 = "Initial orientation from window: %s";
      goto LABEL_10;
    }
  }
  else
  {
    v21 = v19;
    *(_QWORD *)&v8[OBJC_IVAR____TtC13ClarityCamera11CameraModel_lastSeenValidOrientation] = v19;

    if (qword_10002D380 != -1)
      swift_once(&qword_10002D380, sub_10001354C, v22);
    v23 = type metadata accessor for Logger(0);
    v24 = sub_10000CFD8(v23, (uint64_t)qword_10002FB88);
    v25 = Logger.logObject.getter(v24);
    v26 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = (uint8_t *)swift_slowAlloc(12, -1);
      v28 = swift_slowAlloc(32, -1);
      v51 = v21;
      v52 = v28;
      *(_DWORD *)v27 = 136315138;
      type metadata accessor for UIInterfaceOrientation(0);
      v30 = String.init<A>(describing:)(&v51, v29);
      v32 = v31;
      v51 = sub_1000127E8(v30, v31, &v52);
      v16 = &CameraModel;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v51, &v52, v27 + 4, v27 + 12);
      swift_bridgeObjectRelease(v32);
      v33 = "Initial orientation from device: %s";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v25, v26, v33, v27, 0xCu);
      swift_arrayDestroy(v28, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v28, -1, -1);
      swift_slowDealloc(v27, -1, -1);
    }
  }

  v42 = (objc_class *)type metadata accessor for CameraModel(0);
  v53.receiver = v8;
  v53.super_class = v42;
  v43 = (char *)objc_msgSendSuper2(&v53, "init");
  v44 = objc_msgSend(v15, (SEL)v16[374].count);
  objc_msgSend(v44, "beginGeneratingDeviceOrientationNotifications");

  v45 = (void *)objc_opt_self(NSNotificationCenter);
  v46 = objc_msgSend(v45, "defaultCenter");
  objc_msgSend(v46, "addObserver:selector:name:object:", v43, "orientationChangedWithNotification:", UIDeviceOrientationDidChangeNotification, 0);

  v47 = objc_msgSend(v45, "defaultCenter");
  v48 = OBJC_IVAR____TtC13ClarityCamera11CameraModel_captureSession;
  objc_msgSend(v47, "addObserver:selector:name:object:", v43, "sessionWasInterruptedWithNotification:", AVCaptureSessionWasInterruptedNotification, *(_QWORD *)&v43[OBJC_IVAR____TtC13ClarityCamera11CameraModel_captureSession]);

  v49 = objc_msgSend(v45, "defaultCenter");
  objc_msgSend(v49, "addObserver:selector:name:object:", v43, "sessionInterruptionEndedWithNotification:", AVCaptureSessionInterruptionEndedNotification, *(_QWORD *)&v43[v48]);

  return v43;
}

id sub_100009CAC()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_class *v10;
  objc_super v12;

  v1 = v0;
  v2 = sub_1000071DC(&qword_10002D6B0);
  __chkstk_darwin(v2);
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  v6 = type metadata accessor for MainActor(0);
  v7 = static MainActor.shared.getter(v6);
  v8 = swift_allocObject(&unk_100029C80, 32, 7);
  *(_QWORD *)(v8 + 16) = v7;
  *(_QWORD *)(v8 + 24) = &protocol witness table for MainActor;
  v9 = sub_100009270((uint64_t)v4, (uint64_t)&unk_10002D798, v8);
  swift_release(v9);
  v10 = (objc_class *)type metadata accessor for CameraModel(0);
  v12.receiver = v1;
  v12.super_class = v10;
  return objc_msgSendSuper2(&v12, "dealloc");
}

uint64_t sub_100009D9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v0 + 16) = static MainActor.shared.getter(v1);
  v2 = dispatch thunk of Actor.unownedExecutor.getter(v1, &protocol witness table for MainActor);
  return swift_task_switch(sub_100009E04, v2, v3);
}

uint64_t sub_100009E04()
{
  uint64_t v0;
  id v1;

  swift_release(*(_QWORD *)(v0 + 16));
  v1 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  objc_msgSend(v1, "endGeneratingDeviceOrientationNotifications");

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000A03C()
{
  return type metadata accessor for CameraModel(0);
}

uint64_t type metadata accessor for CameraModel(uint64_t a1)
{
  uint64_t result;

  result = qword_10002D678;
  if (!qword_10002D678)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for CameraModel);
  return result;
}

void sub_10000A080()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSString *v23;
  NSString *v24;
  NSString *v25;
  NSString *v26;
  char v27;
  uint64_t v28;
  Class isa;
  NSObject *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  __n128 v34;
  NSObject *v35;
  NSObject *v36;
  id v37;
  __n128 v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  os_log_type_t v49;
  uint8_t *v50;
  _BYTE v51[24];
  id v52[5];

  v1 = v0;
  v2 = sub_1000071DC(&qword_10002D6E0);
  __chkstk_darwin(v2);
  v4 = &v51[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = type metadata accessor for NSNotificationCenter.Publisher(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = &v51[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = sub_1000071DC(&qword_10002D6E8);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = &v51[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  NSNotificationCenter.publisher(for:object:)(AVCaptureSessionRuntimeErrorNotification, 0);

  v52[0] = objc_msgSend((id)objc_opt_self(NSRunLoop), "mainRunLoop");
  v14 = type metadata accessor for NSRunLoop.SchedulerOptions(0);
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v4, 1, 1, v14);
  v15 = sub_10000D1C8(0, &qword_10002D6F0, NSRunLoop_ptr);
  v16 = sub_100006E5C(&qword_10002D6F8, (uint64_t (*)(uint64_t))&type metadata accessor for NSNotificationCenter.Publisher, (uint64_t)&protocol conformance descriptor for NSNotificationCenter.Publisher);
  v17 = sub_10000D0DC();
  Publisher.receive<A>(on:options:)(v52, v4, v5, v15, v16, v17);
  sub_1000077A4((uint64_t)v4, &qword_10002D6E0);

  (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
  v18 = sub_10000D134();
  v19 = (void *)Publisher<>.sink(receiveValue:)(sub_10000A688, 0, v9, v18);
  (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v12, v9);
  v52[3] = (id)type metadata accessor for AnyCancellable(0);
  v52[4] = &protocol witness table for AnyCancellable;
  v52[0] = v19;
  v20 = v1 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_captureSessionRuntimeErrorSubscription;
  swift_beginAccess(v1 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_captureSessionRuntimeErrorSubscription, v51, 33, 0);
  sub_10000D180((uint64_t)v52, v20);
  swift_endAccess(v51);
  v21 = sub_1000071DC(&qword_10002D718);
  v22 = swift_allocObject(v21, 56, 7);
  *(_OWORD *)(v22 + 16) = xmmword_100020180;
  *(_QWORD *)(v22 + 32) = AVCaptureDeviceTypeBuiltInTrueDepthCamera;
  *(_QWORD *)(v22 + 40) = AVCaptureDeviceTypeBuiltInDualCamera;
  *(_QWORD *)(v22 + 48) = AVCaptureDeviceTypeBuiltInWideAngleCamera;
  LOBYTE(v1) = *(_BYTE *)(v1 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_mode);
  v23 = AVCaptureDeviceTypeBuiltInTrueDepthCamera;
  v24 = AVCaptureDeviceTypeBuiltInDualCamera;
  v25 = AVCaptureDeviceTypeBuiltInWideAngleCamera;
  v26 = AVMediaTypeVideo;
  sub_1000089F4(v1);
  if ((v27 & 1) != 0)
    v28 = 2;
  else
    v28 = 1;
  type metadata accessor for DeviceType(0);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v22);
  v30 = objc_msgSend((id)objc_opt_self(AVCaptureDeviceDiscoverySession), "discoverySessionWithDeviceTypes:mediaType:position:", isa, v26, v28);

  v31 = -[NSObject devices](v30, "devices");
  v32 = sub_10000D1C8(0, &qword_10002D720, AVCaptureDevice_ptr);
  v33 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v31, v32);

  if (!((unint64_t)v33 >> 62))
  {
    if (*(_QWORD *)((v33 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_6;
LABEL_20:
    swift_bridgeObjectRelease(v33);
    if (qword_10002D380 == -1)
      goto LABEL_21;
    goto LABEL_27;
  }
  if (v33 < 0)
    v45 = v33;
  else
    v45 = v33 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v33);
  v46 = _CocoaArrayWrapper.endIndex.getter(v45);
  swift_bridgeObjectRelease(v33);
  if (!v46)
    goto LABEL_20;
LABEL_6:
  if ((v33 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)((v33 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v35 = *(id *)(v33 + 32);
      goto LABEL_9;
    }
    __break(1u);
LABEL_27:
    swift_once(&qword_10002D380, sub_10001354C, v34);
LABEL_21:
    v47 = type metadata accessor for Logger(0);
    v48 = sub_10000CFD8(v47, (uint64_t)qword_10002FB88);
    v42 = Logger.logObject.getter(v48);
    v49 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v42, v49))
    {
      v50 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v50 = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, v49, "Could not find appropriate AVCaptureDevice", v50, 2u);
      swift_slowDealloc(v50, -1, -1);
    }
    goto LABEL_23;
  }
  v35 = specialized _ArrayBuffer._getElementSlowPath(_:)(0, v33);
LABEL_9:
  v36 = v35;
  swift_bridgeObjectRelease(v33);
  v37 = objc_msgSend((id)objc_opt_self(AVCaptureDevice), "defaultDeviceWithDeviceType:mediaType:position:", AVCaptureDeviceTypeMicrophone, AVMediaTypeAudio, 0);
  if (!v37)
  {
    if (qword_10002D380 != -1)
      swift_once(&qword_10002D380, sub_10001354C, v38);
    v40 = type metadata accessor for Logger(0);
    v41 = sub_10000CFD8(v40, (uint64_t)qword_10002FB88);
    v42 = Logger.logObject.getter(v41);
    v43 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v44 = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "Could not create microphone capture device", v44, 2u);
      swift_slowDealloc(v44, -1, -1);
    }

LABEL_23:
    v36 = v30;
    v30 = v42;
    goto LABEL_24;
  }
  v39 = v37;
  sub_10000A898(v36, v37);

LABEL_24:
}

void sub_10000A688(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  __n128 v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = type metadata accessor for Notification(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_10002D380 != -1)
    swift_once(&qword_10002D380, sub_10001354C, v4);
  v7 = type metadata accessor for Logger(0);
  sub_10000CFD8(v7, (uint64_t)qword_10002FB88);
  v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, a1, v2);
  v9 = Logger.logObject.getter(v8);
  v10 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc(12, -1);
    v12 = swift_slowAlloc(32, -1);
    v18 = v12;
    *(_DWORD *)v11 = 136315138;
    v13 = sub_100006E5C(&qword_10002D728, (uint64_t (*)(uint64_t))&type metadata accessor for Notification, (uint64_t)&protocol conformance descriptor for Notification);
    v14 = dispatch thunk of CustomStringConvertible.description.getter(v2, v13);
    v16 = v15;
    v17 = sub_1000127E8(v14, v15, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v17, &v18, v11 + 4, v11 + 12);
    swift_bridgeObjectRelease(v16);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    _os_log_impl((void *)&_mh_execute_header, v9, v10, "Capture session runtime error: %s", v11, 0xCu);
    swift_arrayDestroy(v12, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v12, -1, -1);
    swift_slowDealloc(v11, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }

}

void sub_10000A898(void *a1, void *a2)
{
  char *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  __n128 v15;
  void *v16;
  NSObject *v17;
  char v18;
  char v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  __n128 v25;
  void *v26;
  id v27;
  uint64_t *v28;
  char v29;
  id v30;
  __n128 v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  __n128 v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  _QWORD *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  char *v50;
  id v51;
  char *v52;
  os_log_type_t v53;
  uint64_t v54;
  _QWORD *v55;
  id v56;
  id v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  id v62;
  id v63;
  os_log_type_t v64;
  uint64_t v65;
  _QWORD *v66;
  id v67;
  id v68;
  os_log_t v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  id v73;
  char *v74;
  id v75;
  os_log_type_t v76;
  uint64_t v77;
  _QWORD *v78;
  id v79;
  id v80;
  os_log_t v81;
  uint64_t v82;
  uint64_t v83;
  os_log_t v84;
  NSObject *v85;
  id v86;
  uint64_t v87;

  v5 = sub_1000071DC(&qword_10002D6B0);
  __chkstk_darwin(v5);
  v7 = (char *)&v83 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(void **)&v2[OBJC_IVAR____TtC13ClarityCamera11CameraModel_captureSession];
  objc_msgSend(v8, "beginConfiguration");
  v9 = objc_allocWithZone((Class)AVCaptureDeviceInput);
  v86 = 0;
  v10 = a1;
  v11 = objc_msgSend(v9, "initWithDevice:error:", v10, &v86);
  v12 = v86;
  if (!v11)
  {
    v37 = v86;
    v38 = _convertNSErrorToError(_:)(v12);

    swift_willThrow();
LABEL_12:

    if (qword_10002D380 != -1)
      swift_once(&qword_10002D380, sub_10001354C, v39);
    v40 = type metadata accessor for Logger(0);
    sub_10000CFD8(v40, (uint64_t)qword_10002FB88);
    swift_errorRetain(v38);
    v41 = swift_errorRetain(v38);
    v42 = Logger.logObject.getter(v41);
    v43 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc(12, -1);
      v45 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v44 = 138412290;
      swift_errorRetain(v38);
      v46 = (void *)_swift_stdlib_bridgeErrorToNSError(v38);
      v86 = v46;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, &v87, v44 + 4, v44 + 12);
      *v45 = v46;
      swift_errorRelease(v38);
      swift_errorRelease(v38);
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "Error setting up capture session: %@", v44, 0xCu);
      v47 = sub_1000071DC(&qword_10002D6B8);
      swift_arrayDestroy(v45, 1, v47);
      swift_slowDealloc(v45, -1, -1);
      swift_slowDealloc(v44, -1, -1);

      swift_errorRelease(v38);
      return;
    }
    swift_errorRelease(v38);
    swift_errorRelease(v38);
    swift_errorRelease(v38);
    goto LABEL_35;
  }
  v13 = v11;
  v14 = v86;

  if ((objc_msgSend(v8, "canAddInput:", v13) & 1) == 0)
  {
    if (qword_10002D380 != -1)
      swift_once(&qword_10002D380, sub_10001354C, v15);
    v48 = type metadata accessor for Logger(0);
    sub_10000CFD8(v48, (uint64_t)qword_10002FB88);
    v49 = v13;
    v50 = v2;
    v51 = v49;
    v52 = v50;
    v42 = Logger.logObject.getter(v52);
    v53 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v42, v53))
    {
      v54 = swift_slowAlloc(22, -1);
      v55 = (_QWORD *)swift_slowAlloc(16, -1);
      *(_DWORD *)v54 = 138412546;
      v86 = v51;
      v85 = v42;
      v56 = v51;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, &v87, v54 + 4, v54 + 12);
      *v55 = v13;

      *(_WORD *)(v54 + 12) = 2112;
      v86 = v8;
      v57 = v8;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, &v87, v54 + 14, v54 + 22);
      v55[1] = v8;

      v58 = v85;
      _os_log_impl((void *)&_mh_execute_header, v85, v53, "Unable to add input %@ to session %@", (uint8_t *)v54, 0x16u);
      v59 = sub_1000071DC(&qword_10002D6B8);
      swift_arrayDestroy(v55, 2, v59);
      swift_slowDealloc(v55, -1, -1);
      swift_slowDealloc(v54, -1, -1);

      return;
    }

    goto LABEL_34;
  }
  v16 = *(void **)&v2[OBJC_IVAR____TtC13ClarityCamera11CameraModel_videoDeviceInput];
  *(_QWORD *)&v2[OBJC_IVAR____TtC13ClarityCamera11CameraModel_videoDeviceInput] = v13;
  v17 = v13;

  v85 = v17;
  objc_msgSend(v8, "addInput:", v17);
  v18 = v2[OBJC_IVAR____TtC13ClarityCamera11CameraModel_mode];
  sub_10000884C(v18);
  if ((v19 & 1) == 0)
  {
LABEL_7:
    sub_10000854C(v18);
    v28 = &OBJC_IVAR____TtC13ClarityCamera11CameraModel_photoOutput;
    if ((v29 & 1) == 0)
      v28 = &OBJC_IVAR____TtC13ClarityCamera11CameraModel_videoOutput;
    v30 = *(id *)&v2[*v28];
    if (objc_msgSend(v8, "canAddOutput:", v30))
    {
      objc_msgSend(v8, "setSessionPreset:", *(_QWORD *)*(&off_100029C98 + v18));
      objc_msgSend(v8, "addOutput:", v30);
      static TaskPriority.userInitiated.getter(objc_msgSend(v8, "commitConfiguration"));
      v32 = type metadata accessor for TaskPriority(0);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v7, 0, 1, v32);
      type metadata accessor for MainActor(0);
      v33 = v2;
      v34 = static MainActor.shared.getter(v33);
      v35 = (_QWORD *)swift_allocObject(&unk_100029A28, 40, 7);
      v35[2] = v34;
      v35[3] = &protocol witness table for MainActor;
      v35[4] = v33;
      v36 = sub_100009270((uint64_t)v7, (uint64_t)&unk_10002D6C8, (uint64_t)v35);
      swift_release(v36);

LABEL_32:
      return;
    }
    if (qword_10002D380 != -1)
      swift_once(&qword_10002D380, sub_10001354C, v31);
    v60 = type metadata accessor for Logger(0);
    sub_10000CFD8(v60, (uint64_t)qword_10002FB88);
    v61 = v2;
    v62 = v30;
    v52 = v61;
    v63 = v62;
    v42 = Logger.logObject.getter(v63);
    v64 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v42, v64))
    {
      v65 = swift_slowAlloc(22, -1);
      v66 = (_QWORD *)swift_slowAlloc(16, -1);
      *(_DWORD *)v65 = 138412546;
      v84 = v42;
      v86 = v63;
      v67 = v63;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, &v87, v65 + 4, v65 + 12);
      *v66 = v63;

      *(_WORD *)(v65 + 12) = 2112;
      v86 = v8;
      v68 = v8;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, &v87, v65 + 14, v65 + 22);
      v66[1] = v8;

      v69 = v84;
      _os_log_impl((void *)&_mh_execute_header, v84, v64, "Unable to add output %@ to session %@", (uint8_t *)v65, 0x16u);
      v70 = sub_1000071DC(&qword_10002D6B8);
      swift_arrayDestroy(v66, 2, v70);
      swift_slowDealloc(v66, -1, -1);
      swift_slowDealloc(v65, -1, -1);

      goto LABEL_32;
    }

    goto LABEL_34;
  }
  v20 = objc_allocWithZone((Class)AVCaptureDeviceInput);
  v86 = 0;
  v10 = a2;
  v21 = objc_msgSend(v20, "initWithDevice:error:", v10, &v86);
  v22 = v86;
  if (!v21)
  {
    v71 = v86;
    v38 = _convertNSErrorToError(_:)(v22);

    swift_willThrow();
    goto LABEL_12;
  }
  v23 = v21;
  v24 = v86;

  if ((objc_msgSend(v8, "canAddInput:", v23) & 1) != 0)
  {
    v26 = *(void **)&v2[OBJC_IVAR____TtC13ClarityCamera11CameraModel_audioDeviceInput];
    *(_QWORD *)&v2[OBJC_IVAR____TtC13ClarityCamera11CameraModel_audioDeviceInput] = v23;
    v27 = v23;

    objc_msgSend(v8, "addInput:", v27);
    goto LABEL_7;
  }
  if (qword_10002D380 != -1)
    swift_once(&qword_10002D380, sub_10001354C, v25);
  v72 = type metadata accessor for Logger(0);
  sub_10000CFD8(v72, (uint64_t)qword_10002FB88);
  v73 = v23;
  v74 = v2;
  v75 = v73;
  v52 = v74;
  v42 = Logger.logObject.getter(v52);
  v76 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v42, v76))
  {
    v77 = swift_slowAlloc(22, -1);
    v78 = (_QWORD *)swift_slowAlloc(16, -1);
    *(_DWORD *)v77 = 138412546;
    v86 = v75;
    v84 = v42;
    v79 = v75;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, &v87, v77 + 4, v77 + 12);
    *v78 = v23;

    *(_WORD *)(v77 + 12) = 2112;
    v86 = v8;
    v80 = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v86, &v87, v77 + 14, v77 + 22);
    v78[1] = v8;

    v81 = v84;
    _os_log_impl((void *)&_mh_execute_header, v84, v76, "Unable to add input %@ to session %@", (uint8_t *)v77, 0x16u);
    v82 = sub_1000071DC(&qword_10002D6B8);
    swift_arrayDestroy(v78, 2, v82);
    swift_slowDealloc(v78, -1, -1);
    swift_slowDealloc(v77, -1, -1);

    goto LABEL_32;
  }

LABEL_34:
LABEL_35:

}

uint64_t sub_10000B29C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v4 + 16) = a4;
  v5 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v4 + 24) = static MainActor.shared.getter(v5);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  return swift_task_switch(sub_10000B308, v6, v7);
}

uint64_t sub_10000B308()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_release(*(_QWORD *)(v0 + 24));
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_captureSession), "startRunning");
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_10000B350()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSString *v8;
  char v9;
  uint64_t v10;
  uint64_t inited;
  uint64_t v12;
  NSString *v13;
  unint64_t v14;
  Class isa;
  id v16;
  id v17;
  id v18;
  unsigned int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  Class v26;
  id v27;
  void *v28;
  _BYTE v29[80];
  _BYTE v30[88];

  v1 = v0;
  v2 = objc_msgSend(objc_allocWithZone((Class)AVCapturePhotoSettings), "init");
  v3 = *(void **)(v0 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_photoOutput);
  v4 = objc_msgSend(v3, "availablePhotoCodecTypes");
  type metadata accessor for AVVideoCodecType(0);
  v6 = v5;
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v5);

  v8 = AVVideoCodecTypeHEVC;
  v9 = sub_10000B648((uint64_t)v8, v7);
  swift_bridgeObjectRelease(v7);

  if ((v9 & 1) != 0)
  {
    v10 = sub_1000071DC(&qword_10002D698);
    inited = swift_initStackObject(v10, v29);
    *(_OWORD *)(inited + 16) = xmmword_100020190;
    *(_QWORD *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(AVVideoCodecKey);
    *(_QWORD *)(inited + 40) = v12;
    *(_QWORD *)(inited + 72) = v6;
    *(_QWORD *)(inited + 48) = v8;
    v13 = v8;
    v14 = sub_10000B79C(inited);
    isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v14);
    v16 = objc_msgSend((id)objc_opt_self(AVCapturePhotoSettings), "photoSettingsWithFormat:", isa);

    v2 = v16;
  }
  v17 = *(id *)(v1 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_videoDeviceInput);
  if (v17)
  {
    v18 = objc_msgSend(v17, "device");
    v19 = objc_msgSend(v18, "isFlashAvailable");

    if (v19)
      v17 = objc_msgSend(v2, "setFlashMode:", 2);
  }
  v20 = AVCapturePhotoSettings.availablePreviewPhotoPixelFormatTypes.getter(v17);
  if (*(_QWORD *)(v20 + 16))
  {
    v21 = *(_DWORD *)(v20 + 32);
    swift_bridgeObjectRelease(v20);
    v22 = sub_1000071DC(&qword_10002D698);
    v23 = swift_initStackObject(v22, v30);
    *(_OWORD *)(v23 + 16) = xmmword_100020190;
    *(_QWORD *)(v23 + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)(kCVPixelBufferPixelFormatTypeKey);
    *(_QWORD *)(v23 + 40) = v24;
    *(_QWORD *)(v23 + 72) = &type metadata for UInt32;
    *(_DWORD *)(v23 + 48) = v21;
    v25 = sub_10000B79C(v23);
    v26 = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v25);
    objc_msgSend(v2, "setPreviewPhotoFormat:", v26);

  }
  else
  {
    swift_bridgeObjectRelease(v20);
  }
  v27 = objc_msgSend(v3, "connectionWithMediaType:", AVMediaTypeVideo);
  if (v27)
  {
    v28 = v27;
    objc_msgSend(v27, "setVideoRotationAngle:", sub_10000C674(*(_QWORD *)(v1 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_lastSeenValidOrientation), 0));

  }
  objc_msgSend(v3, "capturePhotoWithSettings:delegate:", v2, v1);

}

uint64_t sub_10000B648(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  char v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  char v22;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(a2 + 32));
  v7 = v6;
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
  if (v5 == v8 && v7 == v9)
  {
LABEL_20:
    swift_bridgeObjectRelease_n(v7, 2);
    return 1;
  }
  v11 = v9;
  v12 = _stringCompareWithSmolCheck(_:_:expecting:)(v5, v7, v8, v9, 0);
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRelease(v7);
  result = swift_bridgeObjectRelease(v11);
  if ((v12 & 1) != 0)
  {
LABEL_7:
    swift_bridgeObjectRelease(a2);
    return 1;
  }
  if (v2 == 1)
  {
LABEL_17:
    swift_bridgeObjectRelease(a2);
    return 0;
  }
  v14 = 5;
  while (1)
  {
    v15 = v14 - 3;
    if (__OFADD__(v14 - 4, 1))
      break;
    v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(*(_QWORD *)(a2 + 8 * v14));
    v7 = v17;
    v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a1);
    if (v16 == v18 && v7 == v19)
    {
      swift_bridgeObjectRelease(a2);
      goto LABEL_20;
    }
    v21 = v19;
    v22 = _stringCompareWithSmolCheck(_:_:expecting:)(v16, v7, v18, v19, 0);
    swift_bridgeObjectRelease(v7);
    result = swift_bridgeObjectRelease(v21);
    if ((v22 & 1) != 0)
      goto LABEL_7;
    ++v14;
    if (v15 == v2)
      goto LABEL_17;
  }
  __break(1u);
  return result;
}

unint64_t sub_10000B79C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000071DC(&qword_10002D6A0);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  v6 = v3 + 64;
  v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_10000CFF0(v7, (uint64_t)&v16);
    v8 = v16;
    v9 = v17;
    result = sub_10000CE4C(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_10000D038(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 48;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

void sub_10000B8C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
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
  NSObject *v15;
  __n128 v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  Swift::String v25;
  unint64_t v26;
  void (*v27)(char *, uint64_t);
  NSURL *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  os_log_type_t v37;
  uint8_t *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  NSURL *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  id v51;
  unint64_t v52;

  v1 = type metadata accessor for UUID(0);
  v2 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v4 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for URL(0, v5, v6, v7, v8);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  v15 = ((char *)&v49 - v14);
  if (objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_captureSession), "isRunning"))
  {
    v49 = v0;
    v50 = v15;
    v17 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
    v18 = objc_msgSend(v17, "URLsForDirectory:inDomains:", 9, 1);
    v19 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v18, v9);

    if (*(_QWORD *)(v19 + 16))
    {
      (*(void (**)(char *, unint64_t, uint64_t))(v10 + 16))(v13, v19 + ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80)), v9);
      v20 = swift_bridgeObjectRelease(v19);
      v51 = 0;
      v52 = 0xE000000000000000;
      v21 = UUID.init()(v20);
      v22 = (void *)UUID.uuidString.getter(v21);
      v24 = v23;
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      swift_bridgeObjectRelease(v52);
      v51 = v22;
      v52 = v24;
      v25._countAndFlagsBits = 1987013934;
      v25._object = (void *)0xE400000000000000;
      String.append(_:)(v25);
      v26 = v52;
      URL.appendingPathComponent(_:)(v51, v52);
      swift_bridgeObjectRelease(v26);
      v27 = *(void (**)(char *, uint64_t))(v10 + 8);
      v27(v13, v9);
      URL._bridgeToObjectiveC()(v28);
      v30 = v29;
      v51 = 0;
      v31 = objc_msgSend(v17, "removeItemAtURL:error:", v29, &v51);

      v32 = v51;
      v33 = v17;
      if (v31)
      {
        v34 = v51;
      }
      else
      {
        v39 = v51;
        v40 = _convertNSErrorToError(_:)(v32);

        swift_willThrow();
        swift_errorRelease(v40);
      }
      v41 = v49;
      v42 = *(void **)(v49 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_videoOutput);
      v43 = objc_msgSend(v42, "connectionWithMediaType:", AVMediaTypeVideo);
      v45 = v50;
      if (v43)
      {
        v46 = v43;
        objc_msgSend(v43, "setVideoRotationAngle:", sub_10000C674(*(_QWORD *)(v41 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_lastSeenValidOrientation), 0));

      }
      URL._bridgeToObjectiveC()(v44);
      v48 = v47;
      objc_msgSend(v42, "startRecordingToOutputFileURL:recordingDelegate:", v47, v41);

      v27((char *)v45, v9);
      return;
    }
    __break(1u);
    goto LABEL_14;
  }
  if (qword_10002D380 != -1)
LABEL_14:
    swift_once(&qword_10002D380, sub_10001354C, v16);
  v35 = type metadata accessor for Logger(0);
  v36 = sub_10000CFD8(v35, (uint64_t)qword_10002FB88);
  v50 = Logger.logObject.getter(v36);
  v37 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v50, v37))
  {
    v38 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v38 = 0;
    _os_log_impl((void *)&_mh_execute_header, v50, v37, "Capture session is not running on record video request", v38, 2u);
    swift_slowDealloc(v38, -1, -1);
  }

}

uint64_t sub_10000BCDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)(v4 + 16) = a4;
  v5 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v4 + 24) = static MainActor.shared.getter(v5);
  v6 = dispatch thunk of Actor.unownedExecutor.getter(v5, &protocol witness table for MainActor);
  return swift_task_switch(sub_10000BD48, v6, v7);
}

uint64_t sub_10000BD48()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_release(*(_QWORD *)(v0 + 24));
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_captureSession), "stopRunning");
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000BD90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5[2] = a4;
  v5[3] = a5;
  v6 = type metadata accessor for MainActor(0);
  v5[4] = static MainActor.shared.getter(v6);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
  return swift_task_switch(sub_10000BDFC, v7, v8);
}

uint64_t sub_10000BDFC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 16);
  swift_release(*(_QWORD *)(v0 + 32));
  v3 = *(void **)(v2 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_currentPhoto);
  *(_QWORD *)(v2 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_currentPhoto) = v1;
  v4 = v1;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000BEC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4[2] = a4;
  v5 = sub_1000071DC(&qword_10002D6B0);
  v4[3] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v5 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for MainActor(0);
  v4[4] = v6;
  v4[5] = static MainActor.shared.getter(v6);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
  return swift_task_switch(sub_10000BF54, v7, v8);
}

uint64_t sub_10000BF54()
{
  uint64_t v0;
  uint64_t v1;
  __n128 v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = swift_release(*(_QWORD *)(v0 + 40));
  v3 = *(void **)(v1 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_currentPhoto);
  if (v3
    && (v4 = objc_msgSend(v3, "fileDataRepresentation", v2.n128_f64[0])) != 0)
  {
    v5 = v4;
    v6 = *(_QWORD *)(v0 + 24);
    v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v9 = v8;

    static TaskPriority.userInitiated.getter(v10);
    v11 = type metadata accessor for TaskPriority(0);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v6, 0, 1, v11);
    v12 = sub_10000E0B8(v7, v9);
    v13 = static MainActor.shared.getter(v12);
    v14 = (_QWORD *)swift_allocObject(&unk_100029B68, 48, 7);
    v14[2] = v13;
    v14[3] = &protocol witness table for MainActor;
    v14[4] = v7;
    v14[5] = v9;
    v15 = sub_100009270(v6, (uint64_t)&unk_10002D768, (uint64_t)v14);
    sub_10000E128(v7, v9);
    swift_release(v15);
  }
  else
  {
    if (qword_10002D380 != -1)
      swift_once(&qword_10002D380, sub_10001354C, v2);
    v16 = type metadata accessor for Logger(0);
    v17 = sub_10000CFD8(v16, (uint64_t)qword_10002FB88);
    v18 = Logger.logObject.getter(v17);
    v19 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "Could not get photo data representation", v20, 2u);
      swift_slowDealloc(v20, -1, -1);
    }

  }
  swift_task_dealloc(*(_QWORD *)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000C120(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5[8] = a4;
  v5[9] = a5;
  v6 = type metadata accessor for MainActor(0);
  v5[10] = static MainActor.shared.getter(v6);
  v7 = dispatch thunk of Actor.unownedExecutor.getter(v6, &protocol witness table for MainActor);
  return swift_task_switch(sub_10000C18C, v7, v8);
}

uint64_t sub_10000C18C()
{
  _QWORD *v0;
  unint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v1 = v0[9];
  v2 = v0[8];
  swift_release(v0[10]);
  v3 = (void *)objc_opt_self(PHPhotoLibrary);
  v4 = swift_allocObject(&unk_100029B90, 32, 7);
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v1;
  v0[6] = sub_10000E1E8;
  v0[7] = v4;
  v0[2] = _NSConcreteStackBlock;
  v0[3] = 1107296256;
  v0[4] = sub_10000C4B8;
  v0[5] = &unk_100029BA8;
  v5 = _Block_copy(v0 + 2);
  v6 = v0[7];
  sub_10000E0B8(v2, v1);
  objc_msgSend(v3, "requestAuthorization:", v5, swift_release(v6).n128_f64[0]);
  _Block_release(v5);
  return ((uint64_t (*)(void))v0[1])();
}

void sub_10000C270(uint64_t a1, uint64_t a2, unint64_t a3, __n128 a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  os_log_type_t v12;
  uint8_t *v13;
  NSObject *oslog;
  _QWORD aBlock[5];
  uint64_t v16;

  if (a1 == 3)
  {
    v6 = objc_msgSend((id)objc_opt_self(PHPhotoLibrary), "sharedPhotoLibrary");
    v7 = swift_allocObject(&unk_100029BE0, 32, 7);
    *(_QWORD *)(v7 + 16) = a2;
    *(_QWORD *)(v7 + 24) = a3;
    aBlock[4] = sub_10000E218;
    v16 = v7;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000093BC;
    aBlock[3] = &unk_100029BF8;
    v8 = _Block_copy(aBlock);
    v9 = v16;
    sub_10000E0B8(a2, a3);
    objc_msgSend(v6, "performChanges:completionHandler:", v8, 0, swift_release(v9).n128_f64[0]);
    _Block_release(v8);

  }
  else
  {
    if (qword_10002D380 != -1)
      swift_once(&qword_10002D380, sub_10001354C, a4);
    v10 = type metadata accessor for Logger(0);
    v11 = sub_10000CFD8(v10, (uint64_t)qword_10002FB88);
    oslog = Logger.logObject.getter(v11);
    v12 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v12, "Library status is not authorized", v13, 2u);
      swift_slowDealloc(v13, -1, -1);
    }

  }
}

void sub_10000C430()
{
  id v0;
  Class isa;

  v0 = objc_msgSend((id)objc_opt_self(PHAssetCreationRequest), "creationRequestForAsset");
  isa = Data._bridgeToObjectiveC()().super.isa;
  objc_msgSend(v0, "addResourceWithType:data:options:", 1, isa, 0);

}

uint64_t sub_10000C4B8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v4(a2);
  return swift_release(v3);
}

double sub_10000C674(uint64_t a1, char a2)
{
  uint64_t v2;
  char v5;
  __n128 v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;

  sub_1000089F4(*(_BYTE *)(v2 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_mode));
  if ((a2 & 1) != 0)
  {
LABEL_4:
    if (qword_10002D380 != -1)
      swift_once(&qword_10002D380, sub_10001354C, v6);
    v7 = type metadata accessor for Logger(0);
    sub_10000CFD8(v7, (uint64_t)qword_10002FB88);
    v8 = Logger.logObject.getter();
    v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Unable to get valid video rotation angle.", v10, 2u);
      swift_slowDealloc(v10, -1, -1);
    }

    v6.n128_u64[0] = 0;
  }
  else
  {
    v6.n128_u64[0] = 0x4056800000000000;
    switch(a1)
    {
      case 1:
        return v6.n128_f64[0];
      case 2:
        v6.n128_u64[0] = 0x4070E00000000000;
        break;
      case 3:
        v6.n128_u64[0] = 0x4066800000000000;
        if ((v5 & 1) == 0)
          v6.n128_f64[0] = 0.0;
        break;
      case 4:
        v6.n128_u64[0] = 0x4066800000000000;
        if ((v5 & 1) != 0)
          v6.n128_f64[0] = 0.0;
        break;
      default:
        goto LABEL_4;
    }
  }
  return v6.n128_f64[0];
}

void sub_10000C89C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[2];
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char *v9;
  char *v10;
  char *v11;
  void *v12;
  void *v13;
  char *v14;
  void *v15;

  v4[0] = (char *)&value witness table for Builtin.Int32 + 64;
  v4[1] = (char *)&value witness table for Builtin.Int32 + 64;
  sub_10000C958();
  if (v3 <= 0x3F)
  {
    v5 = *(_QWORD *)(v2 - 8) + 64;
    v6 = v5;
    v7 = &unk_10001FF68;
    v8 = &unk_10001FF80;
    v9 = (char *)&value witness table for Builtin.UnknownObject + 64;
    v10 = (char *)&value witness table for Builtin.UnknownObject + 64;
    v11 = (char *)&value witness table for Builtin.UnknownObject + 64;
    v12 = &unk_10001FF98;
    v13 = &unk_10001FF98;
    v14 = (char *)&value witness table for Builtin.Int64 + 64;
    v15 = &unk_10001FF98;
    swift_updateClassMetadata2(a1, 256, 13, v4, a1 + 80);
  }
}

void sub_10000C958()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_10002D688)
  {
    v0 = type metadata accessor for Published(0, &type metadata for Bool);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_10002D688);
  }
}

_BYTE *initializeBufferWithCopyOfBuffer for CameraModel.Mode(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for CameraModel.Mode(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for CameraModel.Mode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000CA98 + 4 * byte_10001FF51[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_10000CACC + 4 * byte_10001FF4C[v4]))();
}

uint64_t sub_10000CACC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000CAD4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000CADCLL);
  return result;
}

uint64_t sub_10000CAE8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000CAF0);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_10000CAF4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000CAFC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000CB08(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_10000CB10(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CameraModel.Mode()
{
  return &type metadata for CameraModel.Mode;
}

void *sub_10000CB28()
{
  return &protocol witness table for String;
}

unint64_t sub_10000CB38()
{
  unint64_t result;

  result = qword_10002D690;
  if (!qword_10002D690)
  {
    result = swift_getWitnessTable(&unk_100020068, &type metadata for CameraModel.Mode);
    atomic_store(result, (unint64_t *)&qword_10002D690);
  }
  return result;
}

void *sub_10000CB7C()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_10000CB88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = type metadata accessor for CameraModel(0);
  result = ObservableObject<>.objectWillChange.getter(v2);
  *a1 = result;
  return result;
}

uint64_t sub_10000CBC4@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_10000CC58(a1, (uint64_t)&unk_100020110, (uint64_t)&unk_100020138, a2);
}

uint64_t sub_10000CBD8(char *a1, void **a2)
{
  char v2;
  void *v3;
  uint64_t KeyPath;
  uint64_t v5;
  char v7;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100020110);
  v5 = swift_getKeyPath(&unk_100020138);
  v7 = v2;
  return static Published.subscript.setter(&v7, v3, KeyPath, v5);
}

uint64_t sub_10000CC44@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_10000CC58(a1, (uint64_t)&unk_1000200C8, (uint64_t)&unk_1000200F0, a2);
}

uint64_t sub_10000CC58@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, _BYTE *a4@<X8>)
{
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  v6 = *a1;
  KeyPath = swift_getKeyPath(a2);
  v8 = swift_getKeyPath(a3);
  static Published.subscript.getter(&v10, v6, KeyPath, v8);
  swift_release(v8);
  result = swift_release(KeyPath);
  *a4 = v10;
  return result;
}

void sub_10000CCD0(char *a1, void **a2)
{
  char v2;
  void *v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_1000200C8);
  v5 = swift_getKeyPath(&unk_1000200F0);
  static Published.subscript.getter(&v9, v3, KeyPath, v5);
  swift_release(v5);
  swift_release(KeyPath);
  LOBYTE(KeyPath) = v9;
  v6 = swift_getKeyPath(&unk_1000200C8);
  v7 = swift_getKeyPath(&unk_1000200F0);
  v8 = v2;
  static Published.subscript.setter(&v8, v3, v6, v7);
  sub_100008E8C(KeyPath);
}

uint64_t sub_10000CD9C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10000CE00;
  return v6(a1);
}

uint64_t sub_10000CE00()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

unint64_t sub_10000CE4C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10000CEB0(a1, a2, v5);
}

unint64_t sub_10000CEB0(uint64_t a1, uint64_t a2, uint64_t a3)
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

unint64_t sub_10000CF90(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000292B8, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 4)
    return 4;
  else
    return v3;
}

uint64_t sub_10000CFD8(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_10000CFF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000071DC(&qword_10002D6A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_10000D038(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000D04C(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_10002D6C4);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10000E354;
  return sub_10000B29C(a1, v4, v5, v6);
}

uint64_t sub_10000D0B8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

unint64_t sub_10000D0DC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D700;
  if (!qword_10002D700)
  {
    v1 = sub_10000D1C8(255, &qword_10002D6F0, NSRunLoop_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSRunLoop, v1);
    atomic_store(result, (unint64_t *)&qword_10002D700);
  }
  return result;
}

unint64_t sub_10000D134()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D708;
  if (!qword_10002D708)
  {
    v1 = sub_10000721C(&qword_10002D6E8);
    result = swift_getWitnessTable(&protocol conformance descriptor for Publishers.ReceiveOn<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D708);
  }
  return result;
}

uint64_t sub_10000D180(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000071DC(&qword_10002D710);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D1C8(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_10000D200@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_10000CC58(a1, (uint64_t)&unk_1000200C8, (uint64_t)&unk_1000200F0, a2);
}

uint64_t sub_10000D228@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_10000CC58(a1, (uint64_t)&unk_100020110, (uint64_t)&unk_100020138, a2);
}

uint64_t sub_10000D250()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

double sub_10000D274()
{
  uint64_t v0;

  return sub_1000093E8(v0, (uint64_t)&unk_100029B18, (uint64_t)&unk_10002D748);
}

uint64_t sub_10000D29C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000D2AC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

double sub_10000D2B4()
{
  uint64_t v0;

  return sub_1000093E8(v0, (uint64_t)&unk_100029AF0, (uint64_t)&unk_10002D738);
}

uint64_t sub_10000D2E0(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_10002D734);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10000E354;
  return sub_1000090AC(a1, v4, v5, v6);
}

uint64_t sub_10000D350()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000D37C(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_10002D744);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10000E354;
  return sub_1000094CC(a1, v4, v5, v6);
}

void sub_10000D3E8(void *a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __n128 v8;
  uint64_t v9;
  uint64_t v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;

  v5 = sub_1000071DC(&qword_10002D6B0);
  __chkstk_darwin(v5);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_errorRetain(a2);
    if (qword_10002D380 != -1)
      swift_once(&qword_10002D380, sub_10001354C, v8);
    v9 = type metadata accessor for Logger(0);
    sub_10000CFD8(v9, (uint64_t)qword_10002FB88);
    swift_errorRetain(a2);
    v10 = swift_errorRetain(a2);
    v22 = Logger.logObject.getter(v10);
    v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v22, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(12, -1);
      v13 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v12 = 138412290;
      swift_errorRetain(a2);
      v14 = _swift_stdlib_bridgeErrorToNSError(a2);
      v23 = v14;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v23, &v24, v12 + 4, v12 + 12);
      *v13 = v14;
      swift_errorRelease(a2);
      swift_errorRelease(a2);
      _os_log_impl((void *)&_mh_execute_header, v22, v11, "Error processing photo: %@", v12, 0xCu);
      v15 = sub_1000071DC(&qword_10002D6B8);
      swift_arrayDestroy(v13, 1, v15);
      swift_slowDealloc(v13, -1, -1);
      swift_slowDealloc(v12, -1, -1);

      swift_errorRelease(a2);
    }
    else
    {
      swift_errorRelease(a2);
      swift_errorRelease(a2);
      swift_errorRelease(a2);

    }
  }
  else
  {
    v16 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v7, 1, 1, v16);
    type metadata accessor for MainActor(0);
    v17 = v2;
    v18 = a1;
    v19 = static MainActor.shared.getter(v18);
    v20 = (_QWORD *)swift_allocObject(&unk_100029C30, 48, 7);
    v20[2] = v19;
    v20[3] = &protocol witness table for MainActor;
    v20[4] = v17;
    v20[5] = v18;
    v21 = sub_100009270((uint64_t)v7, (uint64_t)&unk_10002D778, (uint64_t)v20);
    swift_release(v21);
  }
}

void sub_10000D68C(uint64_t a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  __n128 v6;
  uint64_t v7;
  uint64_t v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;

  v3 = sub_1000071DC(&qword_10002D6B0);
  __chkstk_darwin(v3);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_errorRetain(a1);
    if (qword_10002D380 != -1)
      swift_once(&qword_10002D380, sub_10001354C, v6);
    v7 = type metadata accessor for Logger(0);
    sub_10000CFD8(v7, (uint64_t)qword_10002FB88);
    swift_errorRetain(a1);
    v8 = swift_errorRetain(a1);
    v19 = Logger.logObject.getter(v8);
    v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v19, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(12, -1);
      v11 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v10 = 138412290;
      swift_errorRetain(a1);
      v12 = _swift_stdlib_bridgeErrorToNSError(a1);
      v20 = v12;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21, v10 + 4, v10 + 12);
      *v11 = v12;
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, v19, v9, "Error capturing photo: %@", v10, 0xCu);
      v13 = sub_1000071DC(&qword_10002D6B8);
      swift_arrayDestroy(v11, 1, v13);
      swift_slowDealloc(v11, -1, -1);
      swift_slowDealloc(v10, -1, -1);

      swift_errorRelease(a1);
    }
    else
    {
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      swift_errorRelease(a1);

    }
  }
  else
  {
    v14 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v5, 1, 1, v14);
    type metadata accessor for MainActor(0);
    v15 = v1;
    v16 = static MainActor.shared.getter(v15);
    v17 = (_QWORD *)swift_allocObject(&unk_100029B40, 40, 7);
    v17[2] = v16;
    v17[3] = &protocol witness table for MainActor;
    v17[4] = v15;
    v18 = sub_100009270((uint64_t)v5, (uint64_t)&unk_10002D758, (uint64_t)v17);
    swift_release(v18);
  }
}

void sub_10000D924(__n128 a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  void *object;
  NSObject *oslog;
  uint64_t v13;
  uint64_t v14;

  if (a3)
  {
    if (qword_10002D380 != -1)
      swift_once(&qword_10002D380, sub_10001354C, a1);
    v4 = type metadata accessor for Logger(0);
    sub_10000CFD8(v4, (uint64_t)qword_10002FB88);
    swift_errorRetain(a3);
    v5 = swift_errorRetain(a3);
    oslog = Logger.logObject.getter(v5);
    v6 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(oslog, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc(12, -1);
      v8 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v7 = 138412290;
      swift_errorRetain(a3);
      v9 = _swift_stdlib_bridgeErrorToNSError(a3);
      v13 = v9;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v7 + 4, v7 + 12);
      *v8 = v9;
      swift_errorRelease(a3);
      swift_errorRelease(a3);
      _os_log_impl((void *)&_mh_execute_header, oslog, v6, "Error recording video: %@", v7, 0xCu);
      v10 = sub_1000071DC(&qword_10002D6B8);
      swift_arrayDestroy(v8, 1, v10);
      swift_slowDealloc(v8, -1, -1);
      swift_slowDealloc(v7, -1, -1);

      return;
    }
    swift_errorRelease(a3);
    swift_errorRelease(a3);
  }
  else
  {
    object = URL.path(percentEncoded:)(1)._object;
    oslog = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(object);
    UISaveVideoAtPathToSavedPhotosAlbum((NSString *)&oslog->isa, 0, 0, 0);
  }

}

void sub_10000DB20()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  __n128 v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  NSObject *oslog;
  uint64_t v28;
  uint64_t v29;

  v1 = v0;
  v2 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v3 = objc_msgSend(v2, "orientation");

  v4 = static UIInterfaceOrientation.fromDeviceOrientation(_:)((uint64_t)v3);
  if ((v6 & 1) != 0)
  {
    if (qword_10002D380 != -1)
      swift_once(&qword_10002D380, sub_10001354C, v5);
    v18 = type metadata accessor for Logger(0);
    v19 = sub_10000CFD8(v18, (uint64_t)qword_10002FB88);
    oslog = Logger.logObject.getter(v19);
    v20 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(oslog, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc(12, -1);
      v22 = swift_slowAlloc(32, -1);
      v28 = (uint64_t)v3;
      v29 = v22;
      *(_DWORD *)v21 = 136315138;
      type metadata accessor for UIDeviceOrientation(0);
      v24 = String.init<A>(describing:)(&v28, v23);
      v26 = v25;
      v28 = sub_1000127E8(v24, v25, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, &v29, v21 + 4, v21 + 12);
      swift_bridgeObjectRelease(v26);
      _os_log_impl((void *)&_mh_execute_header, oslog, v20, "Not updating for non-interface orientation: %s", v21, 0xCu);
      swift_arrayDestroy(v22, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v22, -1, -1);
      swift_slowDealloc(v21, -1, -1);

    }
    else
    {

    }
  }
  else
  {
    v7 = v4;
    if (qword_10002D380 != -1)
      swift_once(&qword_10002D380, sub_10001354C, v5);
    v8 = type metadata accessor for Logger(0);
    v9 = sub_10000CFD8(v8, (uint64_t)qword_10002FB88);
    v10 = Logger.logObject.getter(v9);
    v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(12, -1);
      v13 = swift_slowAlloc(32, -1);
      v28 = v7;
      v29 = v13;
      *(_DWORD *)v12 = 136315138;
      type metadata accessor for UIInterfaceOrientation(0);
      v15 = String.init<A>(describing:)(&v28, v14);
      v17 = v16;
      v28 = sub_1000127E8(v15, v16, &v29);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v28, &v29, v12 + 4, v12 + 12);
      swift_bridgeObjectRelease(v17);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Updated orientation: %s", v12, 0xCu);
      swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v13, -1, -1);
      swift_slowDealloc(v12, -1, -1);
    }

    *(_QWORD *)(v1 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_lastSeenValidOrientation) = v7;
  }
}

void sub_10000DE5C(void *a1, const char *a2, __n128 a3)
{
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;

  if (qword_10002D380 != -1)
    swift_once(&qword_10002D380, sub_10001354C, a3);
  v5 = type metadata accessor for Logger(0);
  sub_10000CFD8(v5, (uint64_t)qword_10002FB88);
  v12 = a1;
  v6 = Logger.logObject.getter(v12);
  v7 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc(12, -1);
    v9 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v8 = 138412290;
    v13 = v12;
    v10 = v12;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v8 + 4, v8 + 12);
    *v9 = v12;

    _os_log_impl((void *)&_mh_execute_header, v6, v7, a2, v8, 0xCu);
    v11 = sub_1000071DC(&qword_10002D6B8);
    swift_arrayDestroy(v9, 1, v11);
    swift_slowDealloc(v9, -1, -1);
    swift_slowDealloc(v8, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_10000E020()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000E04C(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_10002D754);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_100007388;
  return sub_10000BEC0(a1, v4, v5, v6);
}

uint64_t sub_10000E0B8(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000E0FC()
{
  _QWORD *v0;

  swift_unknownObjectRelease(v0[2]);
  sub_10000E128(v0[4], v0[5]);
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000E128(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_10000E16C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc(dword_10002D764);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_10000E354;
  return sub_10000C120(a1, v4, v5, v7, v6);
}

void sub_10000E1E8(uint64_t a1, __n128 a2)
{
  uint64_t v2;

  sub_10000C270(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), a2);
}

uint64_t sub_10000E1F4()
{
  uint64_t v0;

  sub_10000E128(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_10000E218()
{
  sub_10000C430();
}

uint64_t sub_10000E220()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000E254(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc(dword_10002D774);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_10000E354;
  return sub_10000BD90(a1, v4, v5, v7, v6);
}

uint64_t sub_10000E2CC()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000E2F0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc(dword_10002D784);
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_10000E354;
  return sub_100009D9C();
}

uint64_t sub_10000E374@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
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
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void (**v27)();
  void (*v28)(char *, uint64_t);
  id v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  id v33;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v36 = a1;
  v37 = a2;
  v4 = a1;
  v41 = a3;
  v38 = sub_1000071DC(&qword_10002D810);
  __chkstk_darwin(v38);
  v6 = (uint64_t *)((char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v40 = sub_1000071DC(&qword_10002D818);
  v7 = *(_QWORD *)(v40 - 8);
  __chkstk_darwin(v40);
  v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = sub_1000071DC(&qword_10002D820);
  v10 = __chkstk_darwin(v39);
  v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *v6 = static Alignment.bottom.getter(v10);
  v6[1] = v13;
  v14 = sub_1000071DC(&qword_10002D828);
  sub_10000E63C(v4, a2, (uint64_t)v6 + *(int *)(v14 + 44));
  v15 = LocalizedStringKey.init(stringLiteral:)(0x6F65646956, 0xE500000000000000);
  v17 = v16;
  LOBYTE(v4) = v18;
  v20 = v19;
  v21 = Image.init(systemName:)(0x69662E6F65646976, 0xEA00000000006C6CLL);
  v42 = v21;
  v22 = sub_1000074EC(&qword_10002D830, &qword_10002D810, (uint64_t)&protocol conformance descriptor for ZStack<A>);
  View.navigationTitle<A>(_:icon:)(v15, v17, v4 & 1, v20, &v42, v38, &type metadata for Image, v22, &protocol witness table for Image);
  swift_release(v21);
  swift_bridgeObjectRelease(v20);
  swift_bridgeObjectRelease(v17);
  sub_1000077A4((uint64_t)v6, &qword_10002D810);
  v23 = swift_allocObject(&unk_100029DE0, 32, 7);
  v24 = v36;
  v25 = v37;
  *(_QWORD *)(v23 + 16) = v36;
  *(_QWORD *)(v23 + 24) = v25;
  v26 = v40;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v12, v9, v40);
  v27 = (void (**)())&v12[*(int *)(v39 + 36)];
  *v27 = sub_10000F298;
  v27[1] = (void (*)())v23;
  v27[2] = 0;
  v27[3] = 0;
  v28 = *(void (**)(char *, uint64_t))(v7 + 8);
  v29 = v25;
  v28(v9, v26);
  v30 = swift_allocObject(&unk_100029E08, 32, 7);
  *(_QWORD *)(v30 + 16) = v24;
  *(_QWORD *)(v30 + 24) = v29;
  v31 = v41;
  sub_1000075F4((uint64_t)v12, v41, &qword_10002D820);
  v32 = (_QWORD *)(v31 + *(int *)(sub_1000071DC(&qword_10002D838) + 36));
  *v32 = 0;
  v32[1] = 0;
  v32[2] = sub_10000F2D0;
  v32[3] = v30;
  v33 = v29;
  return sub_1000077A4((uint64_t)v12, &qword_10002D820);
}

void sub_10000E63C(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t KeyPath;
  uint64_t v37;
  id v38;
  __n128 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  char *v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  __n128 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __n128 v60;
  uint64_t *v61;
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
  id v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  uint64_t v81;
  int v82;
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
  char v95[16];
  uint64_t v96;
  id v97;
  uint64_t v98;
  uint64_t v99;
  unsigned __int8 v100;
  uint64_t v101;
  unsigned __int8 v102;
  uint64_t v103;
  uint64_t v104;

  v84 = type metadata accessor for BorderedProminentButtonStyle(0);
  v85 = *(_QWORD *)(v84 - 8);
  __chkstk_darwin(v84);
  v77 = (char *)&v73 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000071DC(&qword_10002D840);
  v74 = *(_QWORD *)(v7 - 8);
  v8 = v7;
  __chkstk_darwin(v7);
  v10 = (char *)&v73 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = sub_1000071DC(&qword_10002D848);
  __chkstk_darwin(v73);
  v12 = (char *)&v73 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = sub_1000071DC(&qword_10002D850);
  __chkstk_darwin(v76);
  v14 = (char *)&v73 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1000071DC(&qword_10002D858);
  v91 = *(_QWORD *)(v15 - 8);
  v92 = v15;
  __chkstk_darwin(v15);
  v17 = (char *)&v73 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = sub_1000071DC(&qword_10002D860);
  __chkstk_darwin(v89);
  v75 = (char *)&v73 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = sub_1000071DC(&qword_10002D868);
  v19 = __chkstk_darwin(v90);
  v94 = (uint64_t)&v73 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __chkstk_darwin(v19);
  v88 = (uint64_t)&v73 - v22;
  v23 = __chkstk_darwin(v21);
  v93 = (uint64_t)&v73 - v24;
  v25 = static Alignment.topTrailing.getter(v23);
  v86 = v26;
  v87 = v25;
  v27 = a2;
  v28 = static Alignment.center.getter(v27);
  _FrameLayout.init(width:height:alignment:)(&v99, 0x7FF0000000000000, 0, 0x7FF0000000000000, 0, v28, v29);
  v83 = v99;
  v82 = v100;
  v81 = v101;
  v80 = v102;
  v79 = v103;
  v78 = v104;
  v30 = swift_allocObject(&unk_100029E58, 32, 7);
  *(_QWORD *)(v30 + 16) = a1;
  *(_QWORD *)(v30 + 24) = v27;
  v96 = a1;
  v97 = v27;
  v31 = v27;
  v32 = sub_1000071DC(&qword_10002D870);
  v33 = sub_1000074EC(&qword_10002D878, &qword_10002D870, (uint64_t)&protocol conformance descriptor for Label<A, B>);
  v34 = v30;
  v35 = v17;
  Button.init(action:label:)(sub_10000F304, v34, sub_10000F30C, v95, v32, v33);
  KeyPath = swift_getKeyPath(&unk_100020208);
  v37 = swift_getKeyPath(&unk_100020230);
  v38 = v31;
  static Published.subscript.getter(&v98, v38, KeyPath, v37);

  swift_release(KeyPath);
  v39 = swift_release(v37);
  LOBYTE(KeyPath) = v98;
  v40 = v74;
  v41 = v8;
  (*(void (**)(char *, char *, uint64_t, __n128))(v74 + 16))(v12, v10, v8, v39);
  v42 = v73;
  v12[*(int *)(v73 + 36)] = KeyPath;
  (*(void (**)(char *, uint64_t))(v40 + 8))(v10, v41);
  v43 = sub_10000F374();
  View.accessibilityIdentifier(_:)(0x746F6850656B6174, 0xEF6E6F747475426FLL, v42, v43);
  v44 = sub_1000077A4((uint64_t)v12, &qword_10002D848);
  v45 = v77;
  BorderedProminentButtonStyle.init()(v44);
  v46 = sub_10000F43C();
  v47 = sub_100006E5C(&qword_10002D4B0, (uint64_t (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle, (uint64_t)&protocol conformance descriptor for BorderedProminentButtonStyle);
  v48 = v84;
  View.buttonStyle<A>(_:)(v45, v76, v84, v46, v47);
  (*(void (**)(char *, uint64_t))(v85 + 8))(v45, v48);
  sub_1000077A4((uint64_t)v14, &qword_10002D850);
  v49 = swift_getKeyPath(&unk_100020250);
  v50 = swift_getKeyPath(&unk_100020278);
  v51 = v38;
  static Published.subscript.getter(&v98, v51, v49, v50);

  swift_release(v49);
  v52 = swift_release(v50);
  if (v98 == 1)
    v53 = static Color.red.getter(v52);
  else
    v53 = static Color.green.getter(v52);
  v54 = v53;
  v55 = swift_getKeyPath(&unk_100020298);
  v98 = v54;
  swift_retain(v54);
  v56 = AnyShapeStyle.init<A>(_:)(&v98, &type metadata for Color, &protocol witness table for Color);
  v58 = v91;
  v57 = v92;
  v59 = (uint64_t)v75;
  (*(void (**)(char *, char *, uint64_t))(v91 + 16))(v75, v35, v92);
  v60 = swift_release(v54);
  v61 = (uint64_t *)(v59 + *(int *)(v89 + 36));
  *v61 = v55;
  v61[1] = v56;
  v62 = (*(uint64_t (**)(char *, uint64_t, __n128))(v58 + 8))(v35, v57, v60);
  LOBYTE(v54) = static Edge.Set.all.getter(v62);
  v63 = v88;
  sub_1000075F4(v59, v88, &qword_10002D860);
  v64 = v63 + *(int *)(v90 + 36);
  *(_BYTE *)v64 = v54;
  *(_OWORD *)(v64 + 8) = 0u;
  *(_OWORD *)(v64 + 24) = 0u;
  *(_BYTE *)(v64 + 40) = 1;
  sub_1000077A4(v59, &qword_10002D860);
  v65 = v63;
  v66 = v93;
  sub_10000F4D0(v65, v93);
  v67 = v94;
  sub_1000075F4(v66, v94, &qword_10002D868);
  v68 = v86;
  *(_QWORD *)a3 = v87;
  *(_QWORD *)(a3 + 8) = v68;
  v69 = v83;
  *(_QWORD *)(a3 + 16) = v51;
  *(_QWORD *)(a3 + 24) = v69;
  *(_BYTE *)(a3 + 32) = v82;
  *(_QWORD *)(a3 + 40) = v81;
  *(_BYTE *)(a3 + 48) = v80;
  v70 = v78;
  *(_QWORD *)(a3 + 56) = v79;
  *(_QWORD *)(a3 + 64) = v70;
  v71 = sub_1000071DC(&qword_10002D8A0);
  sub_1000075F4(v67, a3 + *(int *)(v71 + 48), &qword_10002D868);
  v72 = v51;
  sub_1000077A4(v66, &qword_10002D868);
  sub_1000077A4(v67, &qword_10002D868);

}

void sub_10000ECE4(uint64_t a1, uint64_t a2)
{
  id v2;
  _QWORD v3[6];

  v3[2] = a1;
  v3[3] = a2;
  withAnimation<A>(_:_:)(0, sub_10000F528, v3, (char *)&type metadata for () + 8);
  v2 = objc_msgSend(objc_allocWithZone((Class)UIImpactFeedbackGenerator), "initWithStyle:", 1);
  objc_msgSend(v2, "impactOccurred");

}

void sub_10000ED64(uint64_t a1, void *a2)
{
  uint64_t KeyPath;
  uint64_t v4;
  id v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  BOOL v12;
  uint64_t v13;

  KeyPath = swift_getKeyPath(&unk_100020250);
  v4 = swift_getKeyPath(&unk_100020278);
  v5 = a2;
  static Published.subscript.getter((uint64_t *)((char *)&v13 + 1), v5, KeyPath, v4);
  swift_release(KeyPath);
  swift_release(v4);
  v6 = BYTE1(v13);
  v7 = swift_getKeyPath(&unk_100020250);
  v8 = swift_getKeyPath(&unk_100020278);
  static Published.subscript.getter(&v13, v5, v7, v8);
  swift_release(v7);
  swift_release(v8);
  LOBYTE(v7) = v13;
  v9 = swift_getKeyPath(&unk_100020250);
  v10 = swift_getKeyPath(&unk_100020278);
  v12 = (v6 & 1) == 0;
  v11 = v5;
  static Published.subscript.setter(&v12, v11, v9, v10);
  sub_100008E8C(v7);

}

uint64_t sub_10000EE84@<X0>(void *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t KeyPath;
  uint64_t v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;

  KeyPath = swift_getKeyPath(&unk_100020250);
  v5 = swift_getKeyPath(&unk_100020278);
  v6 = a1;
  static Published.subscript.getter(&v14, v6, KeyPath, v5);

  swift_release(KeyPath);
  swift_release(v5);
  if (v14 == 1)
  {
    v7 = 1347376211;
    v8 = 0xE400000000000000;
  }
  else
  {
    v7 = 0x4449565F454B4154;
    v8 = 0xEA00000000004F45;
  }
  v9 = LocalizedStringKey.init(stringLiteral:)(v7, v8);
  result = Text.init(_:tableName:bundle:comment:)(v9);
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v11;
  *(_BYTE *)(a2 + 16) = v12 & 1;
  *(_QWORD *)(a2 + 24) = v13;
  return result;
}

uint64_t sub_10000EF6C@<X0>(void *a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t KeyPath;
  uint64_t v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t result;
  uint64_t v10;

  KeyPath = swift_getKeyPath(&unk_100020250);
  v5 = swift_getKeyPath(&unk_100020278);
  v6 = a1;
  static Published.subscript.getter(&v10, v6, KeyPath, v5);

  swift_release(KeyPath);
  swift_release(v5);
  if ((_BYTE)v10)
    v7 = 0x6C69662E706F7473;
  else
    v7 = 0x69662E6F65646976;
  if ((_BYTE)v10)
    v8 = 0xE90000000000006CLL;
  else
    v8 = 0xEA00000000006C6CLL;
  result = Image.init(systemName:)(v7, v8);
  *a2 = result;
  return result;
}

double sub_10000F030(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  double result;
  uint64_t v12;

  v3 = sub_1000071DC(&qword_10002D6B0);
  __chkstk_darwin(v3);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  type metadata accessor for MainActor(0);
  v7 = a2;
  v8 = static MainActor.shared.getter(v7);
  v9 = (_QWORD *)swift_allocObject(&unk_100029E30, 40, 7);
  v9[2] = v8;
  v9[3] = &protocol witness table for MainActor;
  v9[4] = v7;
  v10 = sub_100009270((uint64_t)v5, (uint64_t)&unk_10002D438, (uint64_t)v9);

  *(_QWORD *)&result = swift_release(v10).n128_u64[0];
  return result;
}

uint64_t sub_10000F11C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_10000E374(*(_QWORD *)v1, *(void **)(v1 + 8), a1);
}

_QWORD *initializeBufferWithCopyOfBuffer for CameraVideoView(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  id v4;

  v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = v3;
  return a1;
}

void destroy for CameraVideoView(uint64_t a1)
{

}

_QWORD *assignWithCopy for CameraVideoView(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;

  *a1 = *a2;
  v3 = (void *)a2[1];
  v4 = (void *)a1[1];
  a1[1] = v3;
  v5 = v3;

  return a1;
}

__n128 initializeWithTake for CameraVideoView(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for CameraVideoView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;

  v3 = a2[1];
  v4 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for CameraVideoView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CameraVideoView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CameraVideoView()
{
  return &type metadata for CameraVideoView;
}

uint64_t sub_10000F264(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100021BC4, 1);
}

uint64_t sub_10000F274()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void sub_10000F298()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + 24);
  sub_10000A080();

}

double sub_10000F2D0()
{
  uint64_t v0;

  return sub_10000F030(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_10000F2D8()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 40, 7);
}

void sub_10000F304()
{
  uint64_t v0;

  sub_10000ECE4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_10000F30C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD v3[4];
  _BYTE v4[16];
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + 24);
  v5 = *(_QWORD *)(v0 + 16);
  v6 = v1;
  v3[2] = v5;
  v3[3] = v1;
  return Label.init(title:icon:)(sub_10000F518, v4, sub_10000F520, v3, &type metadata for Text, &type metadata for Image, &protocol witness table for Text, &protocol witness table for Image);
}

unint64_t sub_10000F374()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D880;
  if (!qword_10002D880)
  {
    v1 = sub_10000721C(&qword_10002D848);
    sub_1000074EC(&qword_10002D888, &qword_10002D840, (uint64_t)&protocol conformance descriptor for Button<A>);
    sub_10000F3F8();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D880);
  }
  return result;
}

unint64_t sub_10000F3F8()
{
  unint64_t result;

  result = qword_10002D890;
  if (!qword_10002D890)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for _AllowsHitTestingModifier, &type metadata for _AllowsHitTestingModifier);
    atomic_store(result, (unint64_t *)&qword_10002D890);
  }
  return result;
}

unint64_t sub_10000F43C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D898;
  if (!qword_10002D898)
  {
    v1 = sub_10000721C(&qword_10002D850);
    sub_10000F374();
    sub_100006E5C((unint64_t *)&qword_10002D4A8, (uint64_t (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier, (uint64_t)&protocol conformance descriptor for AccessibilityAttachmentModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D898);
  }
  return result;
}

uint64_t sub_10000F4D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000071DC(&qword_10002D868);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000F518@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_10000EE84(*(void **)(v1 + 24), a1);
}

uint64_t sub_10000F520@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_10000EF6C(*(void **)(v1 + 24), a1);
}

void sub_10000F528()
{
  uint64_t v0;

  sub_10000ED64(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

unint64_t sub_10000F544()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D8A8;
  if (!qword_10002D8A8)
  {
    v1 = sub_10000721C(&qword_10002D838);
    sub_10000F5B0();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D8A8);
  }
  return result;
}

unint64_t sub_10000F5B0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_10002D8B0;
  if (!qword_10002D8B0)
  {
    v1 = sub_10000721C(&qword_10002D820);
    v2[0] = sub_10000721C(&qword_10002D810);
    v2[1] = &type metadata for Image;
    v2[2] = sub_1000074EC(&qword_10002D830, &qword_10002D810, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    v2[3] = &protocol witness table for Image;
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.navigationTitle<A>(_:icon:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D8B0);
  }
  return result;
}

ValueMetadata *type metadata accessor for ContentView()
{
  return &type metadata for ContentView;
}

uint64_t sub_10000F694(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100021C08, 1);
}

uint64_t sub_10000F6A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void *ObjCClassFromMetadata;
  id v23;
  char *v24;
  uint64_t v25;
  id v26;
  char *v27;
  char v28;
  __int16 v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t OpaqueTypeConformance2;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  unsigned int *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  char *v56;
  __int128 v57;
  uint64_t v58;
  char *v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __int128 v76;
  uint64_t v77;
  __int128 v78;
  uint64_t v79;
  void *v80;

  v77 = a1;
  v66 = type metadata accessor for MultimodalListStyle.IconStyle(0);
  v71 = *(_QWORD *)(v66 - 8);
  v1 = __chkstk_darwin(v66);
  v70 = (char *)&v65 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  v4 = (char *)&v65 - v3;
  v5 = sub_1000071DC(&qword_10002D980);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v65 - v9;
  *((_QWORD *)&v76 + 1) = type metadata accessor for MultimodalListStyle(0);
  v69 = *(_QWORD *)(*((_QWORD *)&v76 + 1) - 8);
  __chkstk_darwin(*((_QWORD *)&v76 + 1));
  v12 = (char *)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v76 = sub_1000071DC(&qword_10002D930);
  v68 = *(_QWORD *)(v76 - 8);
  __chkstk_darwin(v76);
  v14 = (char *)&v65 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1000071DC(&qword_10002D988);
  v73 = *(_QWORD *)(v15 - 8);
  v74 = v15;
  v16 = __chkstk_darwin(v15);
  v67 = (char *)&v65 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  v72 = (char *)&v65 - v18;
  v75 = sub_1000071DC(&qword_10002D990);
  __chkstk_darwin(v75);
  v20 = (char *)&v65 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_10000D1C8(0, &qword_10002D998, CLFCameraSettings_ptr);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata(v21);
  v23 = objc_msgSend(ObjCClassFromMetadata, "sharedInstance");
  v24 = sub_100012ED8();

  v25 = *((_QWORD *)v24 + 2);
  swift_bridgeObjectRelease(v24);
  if (v25 == 1)
  {
    v26 = objc_msgSend(ObjCClassFromMetadata, "sharedInstance");
    v27 = sub_100012ED8();

    if (*((_QWORD *)v27 + 2))
    {
      v28 = v27[32];
      swift_bridgeObjectRelease(v27);
      sub_10000FD3C(v28);
      v29 = v79;
      v30 = BYTE2(v79);
      *(_OWORD *)v20 = v78;
      *((_WORD *)v20 + 8) = v29;
      v20[18] = v30;
      swift_storeEnumTagMultiPayload(v20, v75, 0);
      v31 = sub_1000071DC(&qword_10002D8E8);
      v32 = sub_100011274(&qword_10002D8E0, &qword_10002D8E8, (void (*)(void))sub_100011250, (void (*)(void))sub_10001136C);
      v33 = sub_1000074EC(&qword_10002D938, &qword_10002D930, (uint64_t)&protocol conformance descriptor for List<A, B>);
      v78 = v76;
      v79 = v33;
      v80 = &protocol witness table for MultimodalListStyle;
      OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v78, &opaque type descriptor for <<opaque return type of View.listStyle<A>(_:)>>, 1);
      return _ConditionalContent<>.init(storage:)(v20, v31, v74, v32, OpaqueTypeConformance2);
    }
    swift_bridgeObjectRelease(v27);
  }
  v36 = sub_1000071DC(&qword_10002D9A0);
  v37 = sub_10001160C();
  List<>.init(content:)(sub_100011608, 0, v36, v37);
  v38 = sub_10000D1C8(0, &qword_10002D9D0, CLFSettings_ptr);
  v39 = objc_msgSend((id)swift_getObjCClassFromMetadata(v38), "sharedInstance");
  v40 = objc_msgSend(v39, "listLayout");

  v41 = CLFListLayoutStack;
  v42 = static String._unconditionallyBridgeFromObjectiveC(_:)(v40);
  v44 = v43;
  v46 = static String._unconditionallyBridgeFromObjectiveC(_:)(v41);
  v47 = v45;
  if (v42 == v46 && v44 == v45)
  {

    swift_bridgeObjectRelease_n(v44, 2);
    v48 = v66;
  }
  else
  {
    v49 = _stringCompareWithSmolCheck(_:_:expecting:)(v42, v44, v46, v45, 0);

    swift_bridgeObjectRelease(v44);
    swift_bridgeObjectRelease(v47);
    v48 = v66;
    if ((v49 & 1) == 0)
    {
      v50 = (unsigned int *)&enum case for MultimodalListStyle.Layout.grid(_:);
      goto LABEL_11;
    }
  }
  v50 = (unsigned int *)&enum case for MultimodalListStyle.Layout.stack(_:);
LABEL_11:
  v51 = *v50;
  v52 = type metadata accessor for MultimodalListStyle.Layout(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v52 - 8) + 104))(v10, v51, v52);
  type metadata accessor for MultimodalListStyle.Layout(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v52 - 8) + 56))(v10, 0, 1, v52);
  v53 = v71;
  (*(void (**)(char *, _QWORD, uint64_t))(v71 + 104))(v4, enum case for MultimodalListStyle.IconStyle.circle(_:), v48);
  sub_1000075F4((uint64_t)v10, (uint64_t)v8, &qword_10002D980);
  v54 = v70;
  (*(void (**)(char *, char *, uint64_t))(v53 + 16))(v70, v4, v48);
  MultimodalListStyle.init(layout:iconStyle:)(v8, v54);
  (*(void (**)(char *, uint64_t))(v53 + 8))(v4, v48);
  sub_1000077A4((uint64_t)v10, &qword_10002D980);
  v55 = sub_1000074EC(&qword_10002D938, &qword_10002D930, (uint64_t)&protocol conformance descriptor for List<A, B>);
  v56 = v67;
  v57 = v76;
  View.listStyle<A>(_:)(v12, v76, *((_QWORD *)&v76 + 1), v55, &protocol witness table for MultimodalListStyle);
  (*(void (**)(char *, _QWORD))(v69 + 8))(v12, *((_QWORD *)&v57 + 1));
  (*(void (**)(char *, _QWORD))(v68 + 8))(v14, v57);
  v59 = v72;
  v58 = v73;
  v60 = v56;
  v61 = v74;
  (*(void (**)(char *, char *, uint64_t))(v73 + 32))(v72, v60, v74);
  (*(void (**)(char *, char *, uint64_t))(v58 + 16))(v20, v59, v61);
  swift_storeEnumTagMultiPayload(v20, v75, 1);
  v62 = sub_1000071DC(&qword_10002D8E8);
  v63 = sub_100011274(&qword_10002D8E0, &qword_10002D8E8, (void (*)(void))sub_100011250, (void (*)(void))sub_10001136C);
  v78 = v57;
  v79 = v55;
  v80 = &protocol witness table for MultimodalListStyle;
  v64 = swift_getOpaqueTypeConformance2(&v78, &opaque type descriptor for <<opaque return type of View.listStyle<A>(_:)>>, 1);
  _ConditionalContent<>.init(storage:)(v20, v62, v61, v63, v64);
  return (*(uint64_t (**)(char *, uint64_t))(v58 + 8))(v59, v61);
}

void sub_10000FD3C(char a1)
{
  __asm { BR              X10 }
}

double sub_10000FD70()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double result;
  __int16 v9;
  char v10;
  __int128 v11;
  __int16 v12;
  char v13;
  __int128 v14;
  __int16 v15;
  char v16;

  *(_QWORD *)&v11 = sub_100007CD8;
  *((_QWORD *)&v11 + 1) = 0;
  v12 = 0;
  v1 = sub_1000112E4();
  v2 = sub_100011328();
  ((void (*)(__int128 *__return_ptr, __int128 *, ValueMetadata *, ValueMetadata *, unint64_t, unint64_t))_ConditionalContent<>.init(storage:))(&v14, &v11, &type metadata for BackCameraPhotoView, &type metadata for BackCameraVideoView, v1, v2);
  if (HIBYTE(v15))
    v3 = 256;
  else
    v3 = 0;
  v11 = v14;
  v12 = v3 | v15;
  v13 = 0;
  v4 = sub_1000071DC(&qword_10002D8F8);
  v5 = sub_1000071DC(&qword_10002D918);
  v6 = sub_100011250();
  v7 = sub_10001136C();
  ((void (*)(__int128 *__return_ptr, __int128 *, uint64_t, uint64_t, uint64_t, uint64_t))_ConditionalContent<>.init(storage:))(&v14, &v11, v4, v5, v6, v7);
  result = *(double *)&v14;
  v9 = v15;
  v10 = v16;
  *(_OWORD *)v0 = v14;
  *(_WORD *)(v0 + 16) = v9;
  *(_BYTE *)(v0 + 18) = v10;
  return result;
}

uint64_t sub_10000FF6C()
{
  uint64_t v0;
  id v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char *v9;

  v0 = sub_10000D1C8(0, &qword_10002D998, CLFCameraSettings_ptr);
  v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(v0), "sharedInstance");
  v2 = sub_100012ED8();

  v9 = v2;
  v3 = sub_1000071DC(&qword_10002D9D8);
  v4 = sub_1000071DC(&qword_10002D9B8);
  v5 = sub_1000074EC(&qword_10002D9E0, &qword_10002D9D8, (uint64_t)&protocol conformance descriptor for [A]);
  v6 = sub_100011670();
  v7 = sub_100011740();
  return ((uint64_t (*)(char **, uint64_t (*)(), _QWORD, uint64_t, void *, uint64_t, uint64_t, unint64_t, unint64_t))ForEach<>.init(_:content:))(&v9, sub_10001173C, 0, v3, &type metadata for String, v4, v5, v6, v7);
}

void sub_100010064(unsigned __int8 *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BYTE v8[31];
  char v9;

  v2 = sub_1000071DC(&qword_10002D9C8);
  __chkstk_darwin(v2);
  v3 = sub_1000071DC(&qword_10002D9B8);
  __chkstk_darwin(v3);
  v4 = *a1;
  v9 = v4;
  v8[16] = v4;
  v5 = sub_1000071DC(&qword_10002D9F0);
  v6 = sub_10001178C();
  v7 = sub_100011418();
  NavigationLink<>.init<A>(value:label:)(&v9, sub_100011784, v8, v5, &type metadata for NavigationStage, v6, v7);
  __asm { BR              X9 }
}

uint64_t sub_10001018C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = sub_1000074EC(&qword_10002D9C0, &qword_10002D9C8, (uint64_t)&protocol conformance descriptor for NavigationLink<A, B>);
  View.accessibilityIdentifier(_:)(0x656D61436B636162, 0xEF6F746F68506172, v2, v5);
  swift_bridgeObjectRelease(0xEF6F746F68506172);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v2);
  return sub_1000075B0(v3, v0, &qword_10002D9B8);
}

void sub_100010250(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _BYTE v8[32];
  _BYTE v9[32];

  v2 = sub_1000071DC(&qword_10002DA08);
  __chkstk_darwin(v2);
  v3 = sub_1000071DC(&qword_10002D9F0);
  __chkstk_darwin(v3);
  v9[16] = a1;
  v8[16] = a1;
  v4 = sub_1000071DC(&qword_10002DA20);
  v5 = sub_1000071DC(&qword_10002D4C0);
  v6 = sub_100011878(&qword_10002DA28, &qword_10002DA20, (void (*)(void))sub_1000118DC);
  v7 = sub_100007638();
  Label.init(title:icon:)(sub_100011828, v9, sub_100011870, v8, v4, v5, v6, v7);
  __asm { BR              X10 }
}

uint64_t sub_100010388(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t KeyPath;
  uint64_t v10;
  __n128 v11;
  uint64_t *v12;

  v8 = static Color.yellow.getter(a1);
  KeyPath = swift_getKeyPath(&unk_100020378);
  *(_QWORD *)(v7 - 88) = v8;
  swift_retain(v8);
  v10 = AnyShapeStyle.init<A>(_:)(v7 - 88, &type metadata for Color, &protocol witness table for Color);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v3, v2);
  v11 = swift_release(v8);
  v12 = (uint64_t *)(v4 + *(int *)(v5 + 36));
  *v12 = KeyPath;
  v12[1] = v10;
  (*(void (**)(uint64_t, uint64_t, __n128))(v6 + 8))(v3, v2, v11);
  return sub_1000075B0(v4, v1, &qword_10002D9F0);
}

void sub_10001043C(char a1)
{
  __asm { BR              X10 }
}

double sub_100010474()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  unint64_t v10;
  double result;
  __int128 v12;
  char v13;
  char v14;
  __int128 v15;
  __int128 v16;
  char v17;
  char v18;
  __int128 v19;
  __int128 v20;
  char v21;
  char v22;

  v1 = LocalizedStringKey.init(stringLiteral:)(0x6F746F6850, 0xE500000000000000);
  v2 = Text.init(_:tableName:bundle:comment:)(v1);
  v4 = v3;
  v6 = v5;
  *(_QWORD *)&v15 = v2;
  *((_QWORD *)&v15 + 1) = v3;
  v8 = v7 & 1;
  *(_QWORD *)&v16 = v7 & 1;
  *((_QWORD *)&v16 + 1) = v5;
  v17 = 0;
  sub_100011A78(v2, v3, v7 & 1);
  swift_bridgeObjectRetain(v6);
  ((void (*)(__int128 *__return_ptr, __int128 *, void *, void *, void *, void *))_ConditionalContent<>.init(storage:))(&v19, &v15, &type metadata for Text, &type metadata for Text, &protocol witness table for Text, &protocol witness table for Text);
  v15 = v19;
  v16 = v20;
  v17 = v21;
  v18 = 0;
  v9 = sub_1000071DC(&qword_10002DA38);
  v10 = sub_1000118DC();
  ((void (*)(__int128 *__return_ptr, __int128 *, uint64_t, uint64_t, unint64_t, unint64_t))_ConditionalContent<>.init(storage:))(&v19, &v15, v9, v9, v10, v10);
  sub_1000076BC(v2, v4, v8);
  swift_bridgeObjectRelease(v6);
  result = *(double *)&v19;
  v12 = v20;
  v13 = v21;
  v14 = v22;
  *(_OWORD *)v0 = v19;
  *(_OWORD *)(v0 + 16) = v12;
  *(_BYTE *)(v0 + 32) = v13;
  *(_BYTE *)(v0 + 33) = v14;
  return result;
}

void sub_100010744(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_100010774()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v1 = Image.init(systemName:)(0x662E6172656D6163, 0xEB000000006C6C69);
  v2 = static Color.black.getter();
  result = swift_getKeyPath(&unk_1000203A8);
  *v0 = v1;
  v0[1] = result;
  v0[2] = v2;
  return result;
}

uint64_t sub_100010838()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = sub_1000071DC(&qword_10002D8C8);
  __chkstk_darwin(v0);
  v2 = (char *)&v8 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000F6A4((uint64_t)v2);
  v3 = sub_1000071DC(&qword_10002D8D0);
  v4 = sub_10001115C();
  v5 = sub_100011418();
  v6 = sub_100011274(&qword_10002D948, &qword_10002D8D0, (void (*)(void))sub_10001145C, (void (*)(void))sub_1000114FC);
  View.navigationDestination<A, B>(for:destination:)(&type metadata for NavigationStage, sub_1000115E0, 0, v0, &type metadata for NavigationStage, v3, v4, v5, v6);
  return sub_1000077A4((uint64_t)v2, &qword_10002D8C8);
}

void sub_100010944(uint64_t a1)
{
  __asm { BR              X10 }
}

double sub_100010984()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  __int16 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  const mach_header_64 *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  double result;
  unint64_t v21;
  char v22;
  __int128 v23;
  int v24;
  char v25;
  char v26;
  __int128 v27;
  unsigned int v28;
  unsigned __int8 v29;
  char v30;

  *(_QWORD *)&v23 = sub_100007CD8;
  *((_QWORD *)&v23 + 1) = 0;
  LOWORD(v24) = 0;
  v1 = sub_1000112E4();
  v2 = sub_100011328();
  _ConditionalContent<>.init(storage:)(&v23, &type metadata for BackCameraPhotoView, &type metadata for BackCameraVideoView, v1, v2);
  if (BYTE1(v28))
    v3 = 256;
  else
    v3 = 0;
  v23 = v27;
  LOWORD(v24) = v3 | v28;
  BYTE2(v24) = 0;
  v4 = sub_1000071DC(&qword_10002D8F8);
  v5 = sub_1000071DC(&qword_10002D918);
  v6 = sub_100011250();
  v7 = sub_10001136C();
  _ConditionalContent<>.init(storage:)(&v23, v4, v5, v6, v7);
  v8 = v27;
  v9 = BYTE2(v28);
  v10 = (unsigned __int16)v28;
  v23 = v27;
  BYTE2(v24) = BYTE2(v28) != 0;
  LOWORD(v24) = v28;
  HIBYTE(v24) = 0;
  sub_1000115EC(v27, *((uint64_t *)&v27 + 1), (unsigned __int16)v28, SBYTE2(v28), (uint64_t (*)(void))sub_1000115E4, (uint64_t (*)(void))sub_100011B8C);
  v11 = sub_1000071DC(&qword_10002D8E8);
  v12 = sub_100011274(&qword_10002D8E0, &qword_10002D8E8, (void (*)(void))sub_100011250, (void (*)(void))sub_10001136C);
  _ConditionalContent<>.init(storage:)(&v23, v11, v11, v12, v12);
  if (HIBYTE(v28))
    v13 = 0x1000000;
  else
    v13 = 0;
  v23 = v27;
  v24 = v13 | (unsigned __int16)v28 | (BYTE2(v28) << 16);
  v25 = 0;
  v14 = sub_1000071DC(&qword_10002D968);
  v15 = sub_100011478();
  _ConditionalContent<>.init(storage:)(&v23, v14, v14, v15, v15);
  v16 = &_mh_execute_header;
  if (!v29)
    BYTE4(v16) = 0;
  v23 = v27;
  v25 = BYTE4(v16);
  v24 = v28;
  v26 = 0;
  v17 = sub_1000071DC(&qword_10002D958);
  v18 = sub_10001145C();
  v19 = sub_1000114FC();
  _ConditionalContent<>.init(storage:)(&v23, v17, &type metadata for PhotoLibraryView, v18, v19);
  sub_1000115EC(v8, *((uint64_t *)&v8 + 1), v10, v9, (uint64_t (*)(void))sub_100011600, (uint64_t (*)(void))sub_100011B90);
  result = *(double *)&v27;
  v21 = v28 | ((unint64_t)v29 << 32);
  v22 = v30;
  *(_OWORD *)v0 = v27;
  *(_DWORD *)(v0 + 16) = v21;
  *(_BYTE *)(v0 + 20) = BYTE4(v21);
  *(_BYTE *)(v0 + 21) = v22;
  return result;
}

uint64_t sub_100010FE4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t OpaqueTypeConformance2;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t KeyPath;
  uint64_t *v16;
  _QWORD v18[6];

  v2 = sub_1000071DC(&qword_10002D8B8);
  __chkstk_darwin(v2);
  v4 = (char *)v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1000071DC(&qword_10002D8C0);
  v6 = sub_10000721C(&qword_10002D8C8);
  v7 = sub_10000721C(&qword_10002D8D0);
  v8 = sub_10001115C();
  v9 = sub_100011418();
  v10 = sub_100011274(&qword_10002D948, &qword_10002D8D0, (void (*)(void))sub_10001145C, (void (*)(void))sub_1000114FC);
  v18[0] = v6;
  v18[1] = &type metadata for NavigationStage;
  v18[2] = v7;
  v18[3] = v8;
  v18[4] = v9;
  v18[5] = v10;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v18, &opaque type descriptor for <<opaque return type of View.navigationDestination<A, B>(for:destination:)>>, 1);
  v12 = NavigationStack.init<>(root:)(sub_100011158, 0, v5, OpaqueTypeConformance2);
  v14 = static Color.black.getter(v12, v13);
  KeyPath = swift_getKeyPath(&unk_100020348);
  sub_1000075F4((uint64_t)v4, a1, &qword_10002D8B8);
  v16 = (uint64_t *)(a1 + *(int *)(sub_1000071DC(&qword_10002D978) + 36));
  *v16 = KeyPath;
  v16[1] = v14;
  return sub_1000077A4((uint64_t)v4, &qword_10002D8B8);
}

unint64_t sub_10001115C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_10002D8D8;
  if (!qword_10002D8D8)
  {
    v1 = sub_10000721C(&qword_10002D8C8);
    sub_100011274(&qword_10002D8E0, &qword_10002D8E8, (void (*)(void))sub_100011250, (void (*)(void))sub_10001136C);
    v2[0] = sub_10000721C(&qword_10002D930);
    v2[1] = type metadata accessor for MultimodalListStyle(255);
    v2[2] = sub_1000074EC(&qword_10002D938, &qword_10002D930, (uint64_t)&protocol conformance descriptor for List<A, B>);
    v2[3] = &protocol witness table for MultimodalListStyle;
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.listStyle<A>(_:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D8D8);
  }
  return result;
}

uint64_t sub_100011250()
{
  return sub_100011274(&qword_10002D8F0, &qword_10002D8F8, (void (*)(void))sub_1000112E4, (void (*)(void))sub_100011328);
}

uint64_t sub_100011274(unint64_t *a1, uint64_t *a2, void (*a3)(void), void (*a4)(void))
{
  uint64_t result;
  uint64_t v8;

  result = *a1;
  if (!result)
  {
    v8 = sub_10000721C(a2);
    a3();
    a4();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000112E4()
{
  unint64_t result;

  result = qword_10002D900;
  if (!qword_10002D900)
  {
    result = swift_getWitnessTable(&unk_10001FDC4, &type metadata for BackCameraPhotoView);
    atomic_store(result, (unint64_t *)&qword_10002D900);
  }
  return result;
}

unint64_t sub_100011328()
{
  unint64_t result;

  result = qword_10002D908;
  if (!qword_10002D908)
  {
    result = swift_getWitnessTable(&unk_100020444, &type metadata for BackCameraVideoView);
    atomic_store(result, (unint64_t *)&qword_10002D908);
  }
  return result;
}

uint64_t sub_10001136C()
{
  return sub_100011274(&qword_10002D910, &qword_10002D918, (void (*)(void))sub_100011390, (void (*)(void))sub_1000113D4);
}

unint64_t sub_100011390()
{
  unint64_t result;

  result = qword_10002D920;
  if (!qword_10002D920)
  {
    result = swift_getWitnessTable(&unk_10001FD58, &type metadata for FrontCameraPhotoView);
    atomic_store(result, (unint64_t *)&qword_10002D920);
  }
  return result;
}

unint64_t sub_1000113D4()
{
  unint64_t result;

  result = qword_10002D928;
  if (!qword_10002D928)
  {
    result = swift_getWitnessTable(&unk_10001FE38, &type metadata for FrontCameraVideoView);
    atomic_store(result, (unint64_t *)&qword_10002D928);
  }
  return result;
}

unint64_t sub_100011418()
{
  unint64_t result;

  result = qword_10002D940;
  if (!qword_10002D940)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for NavigationStage, &type metadata for NavigationStage);
    atomic_store(result, (unint64_t *)&qword_10002D940);
  }
  return result;
}

uint64_t sub_10001145C()
{
  return sub_100011878(&qword_10002D950, &qword_10002D958, (void (*)(void))sub_100011478);
}

unint64_t sub_100011478()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D960;
  if (!qword_10002D960)
  {
    v1 = sub_10000721C(&qword_10002D968);
    sub_100011274(&qword_10002D8E0, &qword_10002D8E8, (void (*)(void))sub_100011250, (void (*)(void))sub_10001136C);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D960);
  }
  return result;
}

unint64_t sub_1000114FC()
{
  unint64_t result;

  result = qword_10002D970;
  if (!qword_10002D970)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for PhotoLibraryView, &type metadata for PhotoLibraryView);
    atomic_store(result, (unint64_t *)&qword_10002D970);
  }
  return result;
}

uint64_t sub_100011540@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.tintColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100011568@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.tintColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100011590(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.tintColor.setter(v1);
}

uint64_t sub_1000115B8(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.tintColor.setter(v1);
}

id sub_1000115E4(uint64_t a1, void *a2, char a3)
{
  return sub_100007A78(a1, a2, a3 & 1);
}

uint64_t sub_1000115EC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t (*a5)(void), uint64_t (*a6)(void))
{
  if ((a4 & 1) != 0)
    a5 = a6;
  return a5();
}

void sub_100011600(uint64_t a1, void *a2, char a3)
{
  sub_100007A98(a1, a2, a3 & 1);
}

unint64_t sub_10001160C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D9A8;
  if (!qword_10002D9A8)
  {
    v1 = sub_10000721C(&qword_10002D9A0);
    sub_100011670();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D9A8);
  }
  return result;
}

unint64_t sub_100011670()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D9B0;
  if (!qword_10002D9B0)
  {
    v1 = sub_10000721C(&qword_10002D9B8);
    sub_1000074EC(&qword_10002D9C0, &qword_10002D9C8, (uint64_t)&protocol conformance descriptor for NavigationLink<A, B>);
    sub_1000116F4();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D9B0);
  }
  return result;
}

unint64_t sub_1000116F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D4A8;
  if (!qword_10002D4A8)
  {
    v1 = type metadata accessor for AccessibilityAttachmentModifier(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for AccessibilityAttachmentModifier, v1);
    atomic_store(result, (unint64_t *)&qword_10002D4A8);
  }
  return result;
}

unint64_t sub_100011740()
{
  unint64_t result;

  result = qword_10002D9E8;
  if (!qword_10002D9E8)
  {
    result = swift_getWitnessTable(&unk_10001FFB8, &type metadata for CameraModel.Mode);
    atomic_store(result, (unint64_t *)&qword_10002D9E8);
  }
  return result;
}

void sub_100011784()
{
  uint64_t v0;

  sub_100010250(*(_BYTE *)(v0 + 16));
}

unint64_t sub_10001178C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002D9F8;
  if (!qword_10002D9F8)
  {
    v1 = sub_10000721C(&qword_10002D9F0);
    sub_1000074EC(&qword_10002DA00, &qword_10002DA08, (uint64_t)&protocol conformance descriptor for Label<A, B>);
    sub_1000074EC(&qword_10002DA10, &qword_10002DA18, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002D9F8);
  }
  return result;
}

double sub_100011828@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  double result;
  __int128 v4;
  __int128 v5;
  char v6;
  char v7;

  sub_10001043C(*(_BYTE *)(v1 + 16));
  result = *(double *)&v4;
  *(_OWORD *)a1 = v4;
  *(_OWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 32) = v6;
  *(_BYTE *)(a1 + 33) = v7;
  return result;
}

void sub_100011870()
{
  uint64_t v0;

  sub_100010744(*(_BYTE *)(v0 + 16));
}

uint64_t sub_100011878(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10000721C(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000118DC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002DA30;
  if (!qword_10002DA30)
  {
    v1 = sub_10000721C(&qword_10002DA38);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002DA30);
  }
  return result;
}

uint64_t sub_100011938@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100011960(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

uint64_t sub_100011988@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.tint.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000119B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.tint.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000119D8(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.tint.setter(v1);
}

uint64_t sub_100011A00(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.tint.setter(v1);
}

uint64_t sub_100011A28@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100011A50(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

uint64_t sub_100011A78(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

unint64_t sub_100011A8C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002DA40;
  if (!qword_10002DA40)
  {
    v1 = sub_10000721C(&qword_10002D978);
    sub_100011B10();
    sub_1000074EC(&qword_10002D490, &qword_10002D498, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002DA40);
  }
  return result;
}

unint64_t sub_100011B10()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002DA48;
  if (!qword_10002DA48)
  {
    v1 = sub_10000721C(&qword_10002D8B8);
    sub_1000074EC(&qword_10002DA50, &qword_10002DA58, (uint64_t)&protocol conformance descriptor for NavigationStack<A, B>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> Group<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10002DA48);
  }
  return result;
}

id sub_100011C6C()
{
  return sub_100012760(type metadata accessor for PreviewView);
}

uint64_t type metadata accessor for PreviewView()
{
  return objc_opt_self(_TtC13ClarityCamera11PreviewView);
}

void sub_100011C98()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;

  v1 = *(id *)(v0 + OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_previewView);
  v7 = objc_msgSend(v1, "layer");
  v2 = objc_opt_self(AVCaptureVideoPreviewLayer);
  v3 = (void *)swift_dynamicCastObjCClass(v7, v2);

  if (v3)
  {
    v4 = *(_QWORD *)(v0 + OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_cameraModel);
    if (v4)
      v5 = *(id *)(v4 + OBJC_IVAR____TtC13ClarityCamera11CameraModel_captureSession);
    else
      v5 = 0;
    v6 = v7;
    objc_msgSend(v3, "setSession:", v5);

    objc_msgSend(v3, "setVideoGravity:", AVLayerVideoGravityResizeAspectFill);
  }

}

id sub_100011E60()
{
  char *v0;
  char *v1;
  uint64_t v2;
  id result;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  Class isa;

  v1 = v0;
  v2 = OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_previewView;
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_previewView], "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  result = objc_msgSend(v0, "view");
  if (!result)
  {
    __break(1u);
    goto LABEL_8;
  }
  v4 = result;
  objc_msgSend(result, "addSubview:", *(_QWORD *)&v1[v2]);

  v5 = sub_1000071DC(&qword_10002DAC8);
  v6 = swift_allocObject(v5, 64, 7);
  *(_OWORD *)(v6 + 16) = xmmword_1000203E0;
  v7 = objc_msgSend(*(id *)&v1[v2], "widthAnchor");
  result = objc_msgSend(v1, "view");
  if (!result)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v8 = result;
  v9 = objc_msgSend(result, "widthAnchor");

  v10 = objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  *(_QWORD *)(v6 + 32) = v10;
  v11 = objc_msgSend(*(id *)&v1[v2], "heightAnchor");
  result = objc_msgSend(v1, "view");
  if (!result)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v12 = result;
  v13 = objc_msgSend(result, "heightAnchor");

  v14 = objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  *(_QWORD *)(v6 + 40) = v14;
  v15 = objc_msgSend(*(id *)&v1[v2], "centerXAnchor");
  result = objc_msgSend(v1, "view");
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v16 = result;
  v17 = objc_msgSend(result, "centerXAnchor");

  v18 = objc_msgSend(v15, "constraintEqualToAnchor:", v17);
  *(_QWORD *)(v6 + 48) = v18;
  v19 = objc_msgSend(*(id *)&v1[v2], "centerYAnchor");
  result = objc_msgSend(v1, "view");
  if (result)
  {
    v20 = result;
    v21 = (void *)objc_opt_self(NSLayoutConstraint);
    v22 = objc_msgSend(v20, "centerYAnchor");

    v23 = objc_msgSend(v19, "constraintEqualToAnchor:", v22);
    *(_QWORD *)(v6 + 56) = v23;
    specialized Array._endMutation()();
    sub_10000D1C8(0, &qword_10002DAD0, NSLayoutConstraint_ptr);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
    objc_msgSend(v21, "activateConstraints:", isa);

    return objc_msgSend(*(id *)&v1[v2], "setAccessibilityIgnoresInvertColors:", 1);
  }
LABEL_11:
  __break(1u);
  return result;
}

void sub_10001224C(__n128 a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  __n128 v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  os_log_type_t v22;
  uint8_t *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;

  v2 = *(void **)(v1 + OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_cameraModel);
  if (!v2)
  {
    if (qword_10002D380 != -1)
      swift_once(&qword_10002D380, sub_10001354C, a1);
    v20 = type metadata accessor for Logger(0);
    v21 = sub_10000CFD8(v20, (uint64_t)qword_10002FB88);
    v24 = Logger.logObject.getter(v21);
    v22 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v23 = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, v22, "Attempted to update preview rotation angle, but no camera model was set.", v23, 2u);
      swift_slowDealloc(v23, -1, -1);
    }
    goto LABEL_15;
  }
  v24 = v2;
  v3 = static UIInterfaceOrientation.window.getter();
  v4 = *(id *)(v1 + OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_previewView);
  v5 = objc_msgSend(v4, "layer");
  v6 = objc_opt_self(AVCaptureVideoPreviewLayer);
  v7 = (void *)swift_dynamicCastObjCClass(v5, v6);

  if (!v7)
    goto LABEL_5;
  v8 = objc_msgSend(v7, "connection");

  if (v8)
  {
    objc_msgSend(v8, "setVideoRotationAngle:", sub_10000C674(v3, 0));
    v5 = v8;
LABEL_5:

  }
  if (qword_10002D380 != -1)
    swift_once(&qword_10002D380, sub_10001354C, v9);
  v10 = type metadata accessor for Logger(0);
  v11 = sub_10000CFD8(v10, (uint64_t)qword_10002FB88);
  v12 = Logger.logObject.getter(v11);
  v13 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc(12, -1);
    v15 = swift_slowAlloc(32, -1);
    v25 = v3;
    v26 = v15;
    *(_DWORD *)v14 = 136315138;
    type metadata accessor for UIInterfaceOrientation(0);
    v17 = String.init<A>(describing:)(&v25, v16);
    v19 = v18;
    v25 = sub_1000127E8(v17, v18, &v26);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v25, &v26, v14 + 4, v14 + 12);
    swift_bridgeObjectRelease(v19);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Updating AVCaptureVideoPreviewLayer orientation to %s", v14, 0xCu);
    swift_arrayDestroy(v15, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v15, -1, -1);
    swift_slowDealloc(v14, -1, -1);

    return;
  }

LABEL_15:
}

id sub_100012558(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  char *v9;
  NSString v10;
  id v11;
  objc_super v13;

  v6 = OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_previewView;
  v7 = type metadata accessor for PreviewView();
  v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v7));
  v9 = v3;
  *(_QWORD *)&v3[v6] = objc_msgSend(v8, "init");
  *(_QWORD *)&v9[OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_cameraModel] = 0;

  if (a2)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v10 = 0;
  }
  v13.receiver = v9;
  v13.super_class = (Class)type metadata accessor for PreviewViewController();
  v11 = objc_msgSendSuper2(&v13, "initWithNibName:bundle:", v10, a3);

  return v11;
}

id sub_100012690(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  id v5;
  char *v6;
  id v7;
  objc_super v9;

  v3 = OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_previewView;
  v4 = type metadata accessor for PreviewView();
  v5 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v4));
  v6 = v1;
  *(_QWORD *)&v1[v3] = objc_msgSend(v5, "init");
  *(_QWORD *)&v6[OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_cameraModel] = 0;

  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for PreviewViewController();
  v7 = objc_msgSendSuper2(&v9, "initWithCoder:", a1);

  return v7;
}

id sub_100012754()
{
  return sub_100012760(type metadata accessor for PreviewViewController);
}

id sub_100012760(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for PreviewViewController()
{
  return objc_opt_self(_TtC13ClarityCamera21PreviewViewController);
}

uint64_t sub_1000127E8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_1000128B8(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100012A90((uint64_t)v12, *a3);
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
      sub_100012A90((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_100012A70(v12);
  return v7;
}

uint64_t sub_1000128B8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_100012ACC(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
}

uint64_t sub_100012A70(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_100012A90(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100012ACC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100012B60(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100012D38(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100012D38(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100012B60(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_100012CD4(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_100012CD4(uint64_t a1, uint64_t a2)
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
  v4 = sub_1000071DC(&qword_10002DAC0);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100012D38(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
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
    v10 = sub_1000071DC(&qword_10002DAC0);
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
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

char *sub_100012E88()
{
  id v0;

  v0 = objc_allocWithZone((Class)type metadata accessor for CameraModel(0));
  return sub_100009708(1);
}

ValueMetadata *type metadata accessor for BackCameraVideoView()
{
  return &type metadata for BackCameraVideoView;
}

uint64_t sub_100012EC8(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100021CF4, 1);
}

char *sub_100012ED8()
{
  void *v0;
  char *v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  if (objc_msgSend(v0, "allowPhotoCapture"))
  {
    v1 = sub_1000130F4(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
    v3 = *((_QWORD *)v1 + 2);
    v2 = *((_QWORD *)v1 + 3);
    if (v3 >= v2 >> 1)
      v1 = sub_1000130F4((char *)(v2 > 1), v3 + 1, 1, v1);
    *((_QWORD *)v1 + 2) = v3 + 1;
    v1[v3 + 32] = 0;
  }
  else
  {
    v1 = (char *)&_swiftEmptyArrayStorage;
  }
  if (objc_msgSend(v0, "allowSelfieCapture"))
  {
    if ((swift_isUniquelyReferenced_nonNull_native(v1) & 1) == 0)
      v1 = sub_1000130F4(0, *((_QWORD *)v1 + 2) + 1, 1, v1);
    v5 = *((_QWORD *)v1 + 2);
    v4 = *((_QWORD *)v1 + 3);
    if (v5 >= v4 >> 1)
      v1 = sub_1000130F4((char *)(v4 > 1), v5 + 1, 1, v1);
    *((_QWORD *)v1 + 2) = v5 + 1;
    v1[v5 + 32] = 2;
  }
  if (objc_msgSend(v0, "allowVideoCapture"))
  {
    if ((swift_isUniquelyReferenced_nonNull_native(v1) & 1) == 0)
      v1 = sub_1000130F4(0, *((_QWORD *)v1 + 2) + 1, 1, v1);
    v7 = *((_QWORD *)v1 + 2);
    v6 = *((_QWORD *)v1 + 3);
    if (v7 >= v6 >> 1)
      v1 = sub_1000130F4((char *)(v6 > 1), v7 + 1, 1, v1);
    *((_QWORD *)v1 + 2) = v7 + 1;
    v1[v7 + 32] = 1;
  }
  if (objc_msgSend(v0, "allowSelfieVideoCapture"))
  {
    if ((swift_isUniquelyReferenced_nonNull_native(v1) & 1) == 0)
      v1 = sub_1000130F4(0, *((_QWORD *)v1 + 2) + 1, 1, v1);
    v9 = *((_QWORD *)v1 + 2);
    v8 = *((_QWORD *)v1 + 3);
    if (v9 >= v8 >> 1)
      v1 = sub_1000130F4((char *)(v8 > 1), v9 + 1, 1, v1);
    *((_QWORD *)v1 + 2) = v9 + 1;
    v1[v9 + 32] = 3;
  }
  return v1;
}

char *sub_1000130F4(char *result, int64_t a2, char a3, char *a4)
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

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_1000071DC(&qword_10002DAE0);
      v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
      v12 = j__malloc_size(v11);
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * v12 - 64;
      v13 = v11 + 32;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v11 != a4 || v13 >= &a4[v8 + 32])
          memmove(v13, a4 + 32, v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v13 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_1000131EC(0, v8, v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

char *sub_1000131EC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  size_t v4;
  char *v5;
  char *v6;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else
  {
    if ((v4 & 0x8000000000000000) != 0)
    {
      result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v5 = (char *)(a4 + a1 + 32);
    v6 = &__dst[v4];
    if (v5 >= &__dst[v4] || &v5[v4] <= __dst)
    {
      memcpy(__dst, v5, v4);
      return v6;
    }
  }
  result = (char *)_fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for PreviewViewRepresentable()
{
  return &type metadata for PreviewViewRepresentable;
}

void *sub_1000132E0()
{
  return &protocol witness table for Never;
}

char *sub_1000132EC()
{
  void **v0;
  void *v1;
  uint64_t v2;
  char *v3;
  void *v4;
  id v5;

  v1 = *v0;
  v2 = type metadata accessor for PreviewViewController();
  v3 = (char *)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2)), "init");
  v4 = *(void **)&v3[OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_cameraModel];
  *(_QWORD *)&v3[OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_cameraModel] = v1;
  v5 = v1;

  sub_100011C98();
  return v3;
}

void sub_100013360(uint64_t a1)
{
  void **v1;
  void *v2;
  void *v3;
  id v4;

  v2 = *v1;
  v3 = *(void **)(a1 + OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_cameraModel);
  *(_QWORD *)(a1 + OBJC_IVAR____TtC13ClarityCamera21PreviewViewController_cameraModel) = v2;
  v4 = v2;

  sub_100011C98();
}

uint64_t sub_1000133C4(uint64_t a1, char a2)
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)(a1, a2 & 1);
}

uint64_t sub_1000133FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100013508();
  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_10001344C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100013508();
  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_10001349C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100013508();
  UIViewControllerRepresentable.body.getter(a1, v2);
  __break(1u);
}

unint64_t sub_1000134C4()
{
  unint64_t result;

  result = qword_10002DAE8;
  if (!qword_10002DAE8)
  {
    result = swift_getWitnessTable(&unk_1000204BC, &type metadata for PreviewViewRepresentable);
    atomic_store(result, (unint64_t *)&qword_10002DAE8);
  }
  return result;
}

unint64_t sub_100013508()
{
  unint64_t result;

  result = qword_10002DAF0;
  if (!qword_10002DAF0)
  {
    result = swift_getWitnessTable(&unk_10002050C, &type metadata for PreviewViewRepresentable);
    atomic_store(result, (unint64_t *)&qword_10002DAF0);
  }
  return result;
}

uint64_t sub_10001354C()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_1000135CC(v0, qword_10002FB88);
  sub_10000CFD8(v0, (uint64_t)qword_10002FB88);
  return Logger.init(subsystem:category:)(0xD000000000000017, 0x8000000100021510, 0x4379746972616C43, 0xED00006172656D61);
}

uint64_t *sub_1000135CC(uint64_t a1, uint64_t *a2)
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

uint64_t sub_10001360C()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC13ClarityCameraP33_0A5806A94E05906D4ADB0016FD6CB26619ResourceBundleClass);
}

uint64_t static UIInterfaceOrientation.window.getter()
{
  id v0;
  id v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  __n128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  __n128 v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  os_log_type_t v26;
  uint8_t *v27;
  uint64_t v29;
  uint64_t v30[2];

  v0 = objc_msgSend((id)objc_opt_self(UIApplication), "sharedApplication");
  v1 = objc_msgSend(v0, "connectedScenes");

  v2 = sub_10000D1C8(0, &qword_10002DBB0, UIScene_ptr);
  v3 = sub_1000139A0();
  v4 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v1, v2, v3);

  if ((v4 & 0xC000000000000001) != 0)
  {
    if (v4 < 0)
      v6 = v4;
    else
      v6 = v4 & 0xFFFFFFFFFFFFFF8;
    v7 = __CocoaSet.count.getter(v6);
  }
  else
  {
    v7 = *(_QWORD *)(v4 + 16);
  }
  if (v7 >= 2)
  {
    if (qword_10002DB90 != -1)
      swift_once(&qword_10002DB90, sub_100018734, v5);
    v8 = type metadata accessor for Logger(0);
    sub_10000CFD8(v8, (uint64_t)qword_10002FBA0);
    v9 = swift_bridgeObjectRetain_n(v4, 2);
    v10 = Logger.logObject.getter(v9);
    v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(12, -1);
      v13 = swift_slowAlloc(32, -1);
      v30[0] = v13;
      *(_DWORD *)v12 = 136315138;
      v14 = swift_bridgeObjectRetain(v4);
      v15 = Set.description.getter(v14, v2, v3);
      v17 = v16;
      swift_bridgeObjectRelease(v4);
      v29 = sub_1000127E8(v15, v17, v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v29, v30, v12 + 4, v12 + 12);
      swift_bridgeObjectRelease_n(v4, 2);
      swift_bridgeObjectRelease(v17);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Unexpectedly had multiple scenes: %s", v12, 0xCu);
      swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v13, -1, -1);
      swift_slowDealloc(v12, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n(v4, 2);
    }
  }
  sub_1000139F8(v4);
  v19 = v18;
  swift_bridgeObjectRelease(v4);
  if (v19)
  {
    v21 = objc_opt_self(UIWindowScene);
    v22 = (void *)swift_dynamicCastObjCClass(v19, v21);
    if (v22)
    {
      v23 = (uint64_t)objc_msgSend(v22, "interfaceOrientation");
      goto LABEL_22;
    }

  }
  if (qword_10002DB90 != -1)
    swift_once(&qword_10002DB90, sub_100018734, v20);
  v24 = type metadata accessor for Logger(0);
  v25 = sub_10000CFD8(v24, (uint64_t)qword_10002FBA0);
  v19 = Logger.logObject.getter(v25);
  v26 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v19, v26))
  {
    v27 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v27 = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, v26, "Unexpectedly had no window scene.", v27, 2u);
    swift_slowDealloc(v27, -1, -1);
  }
  v23 = 1;
LABEL_22:

  return v23;
}

unint64_t sub_1000139A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002DBB8;
  if (!qword_10002DBB8)
  {
    v1 = sub_10000D1C8(255, &qword_10002DBB0, UIScene_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_10002DBB8);
  }
  return result;
}

void sub_1000139F8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id i;
  int64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  void *v28;

  v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    if (a1 < 0)
      v2 = a1;
    else
      v2 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v3 = __CocoaSet.makeIterator()(v2);
    v4 = sub_10000D1C8(0, &qword_10002DBB0, UIScene_ptr);
    v5 = sub_1000139A0();
    v6 = Set.Iterator.init(_cocoa:)(v27, v3, v4, v5);
    v1 = v27[0];
    v25 = v27[1];
    v7 = v27[2];
    v8 = v27[3];
    v9 = v27[4];
  }
  else
  {
    v10 = -1 << *(_BYTE *)(a1 + 32);
    v25 = a1 + 56;
    v7 = ~v10;
    v11 = -v10;
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v9 = v12 & *(_QWORD *)(a1 + 56);
    v6 = (_QWORD *)swift_bridgeObjectRetain(a1);
    v8 = 0;
  }
  v24 = (unint64_t)(v7 + 64) >> 6;
  if (v1 < 0)
    goto LABEL_13;
LABEL_11:
  if (v9)
  {
    v13 = (v9 - 1) & v9;
    v14 = __clz(__rbit64(v9)) | (v8 << 6);
    v15 = v8;
    goto LABEL_32;
  }
  v20 = v8 + 1;
  if (!__OFADD__(v8, 1))
  {
    if (v20 < v24)
    {
      v21 = *(_QWORD *)(v25 + 8 * v20);
      v15 = v8 + 1;
      if (v21)
        goto LABEL_31;
      v15 = v8 + 2;
      if (v8 + 2 >= v24)
        goto LABEL_36;
      v21 = *(_QWORD *)(v25 + 8 * v15);
      if (v21)
        goto LABEL_31;
      v15 = v8 + 3;
      if (v8 + 3 >= v24)
        goto LABEL_36;
      v21 = *(_QWORD *)(v25 + 8 * v15);
      if (v21)
        goto LABEL_31;
      v15 = v8 + 4;
      if (v8 + 4 >= v24)
        goto LABEL_36;
      v21 = *(_QWORD *)(v25 + 8 * v15);
      if (v21)
      {
LABEL_31:
        v13 = (v21 - 1) & v21;
        v14 = __clz(__rbit64(v21)) + (v15 << 6);
LABEL_32:
        for (i = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v14); i; v13 = v9)
        {
          v23 = sub_10000D1C8(0, &qword_10002DBC8, UIWindowScene_ptr);
          if (objc_msgSend(i, "isKindOfClass:", swift_getObjCClassFromMetadata(v23)))
            break;

          v8 = v15;
          v9 = v13;
          if ((v1 & 0x8000000000000000) == 0)
            goto LABEL_11;
LABEL_13:
          v16 = __CocoaSet.Iterator.next()(v6);
          if (!v16)
            break;
          v17 = v16;
          v26 = v16;
          v18 = sub_10000D1C8(0, &qword_10002DBB0, UIScene_ptr);
          swift_unknownObjectRetain(v17);
          swift_dynamicCast(&v28, &v26, (char *)&type metadata for Swift.AnyObject + 8, v18, 7);
          i = v28;
          swift_unknownObjectRelease(v17);
          v15 = v8;
        }
        goto LABEL_36;
      }
      v15 = v8 + 5;
      if (v8 + 5 < v24)
      {
        v21 = *(_QWORD *)(v25 + 8 * v15);
        if (!v21)
        {
          v22 = v8 + 6;
          while (v24 != v22)
          {
            v21 = *(_QWORD *)(v25 + 8 * v22++);
            if (v21)
            {
              v15 = v22 - 1;
              goto LABEL_31;
            }
          }
          goto LABEL_36;
        }
        goto LABEL_31;
      }
    }
LABEL_36:
    sub_100013DFC(v1);
    return;
  }
  __break(1u);
}

uint64_t static UIInterfaceOrientation.fromDeviceOrientation(_:)(uint64_t result)
{
  if ((unint64_t)(result - 5) < 0xFFFFFFFFFFFFFFFCLL)
    return 0;
  return result;
}

BOOL variable initialization expression of PhotoLibraryView.isPad()
{
  id v0;
  id v1;

  v0 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  return v1 == (id)1;
}

uint64_t sub_100013D60(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_100013D80(uint64_t result, int a2, int a3)
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

  if (!qword_10002DBC0)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_10002A2A0);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10002DBC0);
  }
}

uint64_t sub_100013DFC(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100013E08(uint64_t a1, uint64_t a2)
{
  return swift_retain(a2);
}

uint64_t destroy for VideoDetailView(uint64_t *a1)
{
  return sub_100013E20(*a1, a1[1]);
}

uint64_t sub_100013E20(uint64_t a1, uint64_t a2)
{
  return swift_release(a2);
}

uint64_t _s15ClarityPhotosUI15VideoDetailViewVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_100013E08(*(_QWORD *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for VideoDetailView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_100013E08(*(_QWORD *)a2, v4);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_100013E20(v6, v7);
  return a1;
}

uint64_t assignWithTake for VideoDetailView(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_100013E20(v4, v5);
  return a1;
}

ValueMetadata *type metadata accessor for VideoDetailView()
{
  return &type metadata for VideoDetailView;
}

uint64_t sub_100013F18(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100021DC4, 1);
}

uint64_t sub_100013F28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  __n128 v22;
  uint64_t v23;
  uint64_t v24;
  double (**v25)();
  uint64_t v26;
  char *v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  double v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v49 = a4;
  v43 = sub_1000071DC(&qword_10002DBD8);
  v7 = *(_QWORD *)(v43 - 8);
  __chkstk_darwin(v43);
  v9 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = sub_1000071DC(&qword_10002DBE0);
  __chkstk_darwin(v42);
  v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = sub_1000071DC(&qword_10002DBE8);
  __chkstk_darwin(v47);
  v13 = (char *)&v42 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = sub_1000071DC(&qword_10002DBF0);
  __chkstk_darwin(v48);
  v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1000071DC(&qword_10002DBF8);
  __chkstk_darwin(v16);
  v46 = (char *)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for PlayerViewModel();
  v45 = v18;
  v44 = sub_1000143B8();
  v19 = a3 & 1;
  v20 = StateObject.wrappedValue.getter(a1, a2, v19, v18, v44);
  v21 = *(id *)(v20 + 16);
  v22 = swift_release(v20);
  VideoPlayer<>.init(player:)(v21, v22);
  v23 = swift_allocObject(&unk_10002A348, 33, 7);
  *(_QWORD *)(v23 + 16) = a1;
  *(_QWORD *)(v23 + 24) = a2;
  *(_BYTE *)(v23 + 32) = v19;
  v24 = v43;
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v11, v9, v43);
  v25 = (double (**)())&v11[*(int *)(v42 + 36)];
  *v25 = sub_100014404;
  v25[1] = (double (*)())v23;
  v25[2] = 0;
  v25[3] = 0;
  sub_100013E08(a1, a2);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v24);
  v26 = swift_allocObject(&unk_10002A370, 33, 7);
  *(_QWORD *)(v26 + 16) = a1;
  *(_QWORD *)(v26 + 24) = a2;
  *(_BYTE *)(v26 + 32) = v19;
  sub_1000075F4((uint64_t)v11, (uint64_t)v13, &qword_10002DBE0);
  v27 = &v13[*(int *)(v47 + 36)];
  *(_QWORD *)v27 = 0;
  *((_QWORD *)v27 + 1) = 0;
  *((_QWORD *)v27 + 2) = sub_100014454;
  *((_QWORD *)v27 + 3) = v26;
  sub_100013E08(a1, a2);
  sub_1000077A4((uint64_t)v11, &qword_10002DBE0);
  sub_1000075F4((uint64_t)v13, (uint64_t)v15, &qword_10002DBE8);
  v28 = v48;
  v15[*(int *)(v48 + 36)] = 1;
  sub_1000077A4((uint64_t)v13, &qword_10002DBE8);
  v29 = sub_100014478();
  v30 = v46;
  View.accessibilityIdentifier(_:)(0x6F65646956, 0xE500000000000000, v28, v29);
  sub_1000077A4((uint64_t)v15, &qword_10002DBF0);
  v32 = v44;
  v31 = v45;
  v33 = StateObject.wrappedValue.getter(a1, a2, v19, v45, v44);
  v34 = *(double *)(v33 + 24);
  swift_release(v33);
  v35 = StateObject.wrappedValue.getter(a1, a2, v19, v31, v32);
  v36 = *(double *)(v35 + 32);
  swift_release(v35);
  v37 = (uint64_t)v30;
  v38 = (uint64_t)v30;
  v39 = v49;
  sub_1000075F4(v38, v49, &qword_10002DBF8);
  v40 = v39 + *(int *)(sub_1000071DC(&qword_10002DC30) + 36);
  *(double *)v40 = v34 / v36;
  *(_WORD *)(v40 + 8) = 0;
  return sub_1000077A4(v37, &qword_10002DBF8);
}

double sub_1000142E4(uint64_t a1, uint64_t a2, char a3, SEL *a4)
{
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  double result;

  v7 = a3 & 1;
  v8 = type metadata accessor for PlayerViewModel();
  v9 = sub_1000143B8();
  v10 = StateObject.wrappedValue.getter(a1, a2, v7, v8, v9);
  objc_msgSend(*(id *)(v10 + 16), *a4);
  *(_QWORD *)&result = swift_release(v10).n128_u64[0];
  return result;
}

uint64_t sub_100014358@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;

  v3 = *(_QWORD *)v1;
  v4 = *(_QWORD *)(v1 + 8);
  v5 = *(_BYTE *)(v1 + 16);
  *(_QWORD *)a1 = static HorizontalAlignment.center.getter();
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  v6 = sub_1000071DC(&qword_10002DBD0);
  return sub_100013F28(v3, v4, v5, a1 + *(int *)(v6 + 44));
}

unint64_t sub_1000143B8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002DC00;
  if (!qword_10002DC00)
  {
    v1 = type metadata accessor for PlayerViewModel();
    result = swift_getWitnessTable(&unk_100020C38, v1);
    atomic_store(result, (unint64_t *)&qword_10002DC00);
  }
  return result;
}

double sub_100014404()
{
  uint64_t v0;

  return sub_1000142E4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32), (SEL *)&selRef_play);
}

uint64_t sub_10001442C()
{
  uint64_t v0;

  sub_100013E20(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 33, 7);
}

double sub_100014454()
{
  uint64_t v0;

  return sub_1000142E4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32), (SEL *)&selRef_pause);
}

unint64_t sub_100014478()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002DC08;
  if (!qword_10002DC08)
  {
    v1 = sub_10000721C(&qword_10002DBF0);
    sub_1000144E4();
    sub_1000145D4();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002DC08);
  }
  return result;
}

unint64_t sub_1000144E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002DC10;
  if (!qword_10002DC10)
  {
    v1 = sub_10000721C(&qword_10002DBE8);
    sub_100014550();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002DC10);
  }
  return result;
}

unint64_t sub_100014550()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002DC18;
  if (!qword_10002DC18)
  {
    v1 = sub_10000721C(&qword_10002DBE0);
    sub_1000074EC(&qword_10002DC20, &qword_10002DBD8, (uint64_t)&protocol conformance descriptor for VideoPlayer<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002DC18);
  }
  return result;
}

unint64_t sub_1000145D4()
{
  unint64_t result;

  result = qword_10002DC28;
  if (!qword_10002DC28)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for _AccessibilityIgnoresInvertColorsViewModifier, &type metadata for _AccessibilityIgnoresInvertColorsViewModifier);
    atomic_store(result, (unint64_t *)&qword_10002DC28);
  }
  return result;
}

uint64_t sub_100014618()
{
  return sub_1000074EC(&qword_10002DC38, &qword_10002DC40, (uint64_t)&protocol conformance descriptor for VStack<A>);
}

char *sub_100014644(char *a1, char **a2, uint64_t a3)
{
  int v4;
  char *v5;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  char v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain(v5);
  }
  else
  {
    a1[8] = *((_BYTE *)a2 + 8);
    v9 = a2[2];
    v8 = a2[3];
    *((_QWORD *)a1 + 2) = v9;
    *((_QWORD *)a1 + 3) = v8;
    *((_DWORD *)a1 + 8) = *((_DWORD *)a2 + 8);
    a1[36] = *((_BYTE *)a2 + 36);
    v10 = a2[5];
    v11 = (uint64_t)a2[6];
    *((_QWORD *)a1 + 5) = v10;
    v12 = *((_BYTE *)a2 + 56);
    v13 = v5;
    v14 = v9;
    swift_retain(v8);
    swift_retain(v10);
    sub_100014750(v11, v12);
    *((_QWORD *)a1 + 6) = v11;
    a1[56] = v12;
    v15 = *(int *)(a3 + 36);
    v16 = &a1[v15];
    v17 = (uint64_t)a2 + v15;
    *(_OWORD *)&a1[v15] = *(_OWORD *)((char *)a2 + v15);
    v18 = *(int *)(type metadata accessor for RoundedRectangle(0) + 20);
    v19 = &v16[v18];
    v20 = v17 + v18;
    v21 = type metadata accessor for RoundedCornerStyle(0);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v19, v20, v21);
  }
  return a1;
}

uint64_t sub_100014750(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return swift_retain(result);
  return result;
}

uint64_t sub_10001475C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_release(*(_QWORD *)(a1 + 24));
  swift_release(*(_QWORD *)(a1 + 40));
  sub_1000147D8(*(_QWORD *)(a1 + 48), *(_BYTE *)(a1 + 56));
  v4 = a1 + *(int *)(a2 + 36);
  v5 = v4 + *(int *)(type metadata accessor for RoundedRectangle(0) + 20);
  v6 = type metadata accessor for RoundedCornerStyle(0);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t sub_1000147D8(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return swift_release(result);
  return result;
}

uint64_t sub_1000147E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;

  v6 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v8 = *(void **)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 24) = v7;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  v9 = *(_QWORD *)(a2 + 40);
  v10 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = v9;
  v11 = *(_BYTE *)(a2 + 56);
  v12 = v6;
  v13 = v8;
  swift_retain(v7);
  swift_retain(v9);
  sub_100014750(v10, v11);
  *(_QWORD *)(a1 + 48) = v10;
  *(_BYTE *)(a1 + 56) = v11;
  v14 = *(int *)(a3 + 36);
  v15 = a1 + v14;
  v16 = (_OWORD *)(a2 + v14);
  *(_OWORD *)(a1 + v14) = *v16;
  v17 = *(int *)(type metadata accessor for RoundedRectangle(0) + 20);
  v18 = v15 + v17;
  v19 = (char *)v16 + v17;
  v20 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v18, v19, v20);
  return a1;
}

uint64_t sub_1000148CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;

  v6 = *(void **)a2;
  v7 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v6;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v9 = *(void **)(a1 + 16);
  v10 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v10;
  v11 = v10;

  v12 = *(_QWORD *)(a1 + 24);
  v13 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v13;
  swift_retain(v13);
  swift_release(v12);
  v14 = *(_DWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  *(_DWORD *)(a1 + 32) = v14;
  v15 = *(_QWORD *)(a1 + 40);
  v16 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v16;
  swift_retain(v16);
  swift_release(v15);
  v17 = *(_QWORD *)(a2 + 48);
  v18 = *(_BYTE *)(a2 + 56);
  sub_100014750(v17, v18);
  v19 = *(_QWORD *)(a1 + 48);
  v20 = *(_BYTE *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = v17;
  *(_BYTE *)(a1 + 56) = v18;
  sub_1000147D8(v19, v20);
  v21 = *(int *)(a3 + 36);
  v22 = (_QWORD *)(a1 + v21);
  v23 = a2 + v21;
  *v22 = *(_QWORD *)(a2 + v21);
  v22[1] = *(_QWORD *)(a2 + v21 + 8);
  v24 = *(int *)(type metadata accessor for RoundedRectangle(0) + 20);
  v25 = (char *)v22 + v24;
  v26 = v23 + v24;
  v27 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 24))(v25, v26, v27);
  return a1;
}

uint64_t sub_1000149EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  v5 = *(int *)(a3 + 36);
  v6 = a1 + v5;
  v7 = a2 + v5;
  *(_OWORD *)(a1 + v5) = *(_OWORD *)(a2 + v5);
  v8 = *(int *)(type metadata accessor for RoundedRectangle(0) + 20);
  v9 = v6 + v8;
  v10 = v7 + v8;
  v11 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  return a1;
}

uint64_t sub_100014A84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v7 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  v8 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release(v8);
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 36) = *(_BYTE *)(a2 + 36);
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release(v9);
  v10 = *(_BYTE *)(a2 + 56);
  v11 = *(_QWORD *)(a1 + 48);
  v12 = *(_BYTE *)(a1 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = v10;
  sub_1000147D8(v11, v12);
  v13 = *(int *)(a3 + 36);
  v14 = a1 + v13;
  v15 = (_OWORD *)(a2 + v13);
  *(_OWORD *)(a1 + v13) = *v15;
  v16 = *(int *)(type metadata accessor for RoundedRectangle(0) + 20);
  v17 = v14 + v16;
  v18 = (char *)v15 + v16;
  v19 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 40))(v17, v18, v19);
  return a1;
}

uint64_t sub_100014B70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100014B7C);
}

uint64_t sub_100014B7C(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for RoundedRectangle(0);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 36)], a2, v8);
  }
}

uint64_t sub_100014BF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100014C04);
}

char *sub_100014C04(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for RoundedRectangle(0);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 36)], a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for PhotoViewInternal(uint64_t a1)
{
  uint64_t result;

  result = qword_10002DCA0;
  if (!qword_10002DCA0)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PhotoViewInternal);
  return result;
}

uint64_t sub_100014CB4(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[6];

  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v4[1] = &unk_100020638;
  v4[2] = &unk_100020650;
  v4[3] = &unk_100020650;
  v4[4] = &unk_100020668;
  result = type metadata accessor for RoundedRectangle(319);
  if (v3 <= 0x3F)
  {
    v4[5] = *(_QWORD *)(result - 8) + 64;
    swift_initStructMetadata(a1, 256, 6, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_100014D4C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100021E14, 1);
}

uint64_t sub_100014D5C@<X0>(uint64_t a1@<X8>)
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
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __n128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t (**v38)@<X0>(uint64_t@<X0>, uint64_t@<X8>);
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t (**v48)@<X0>(uint64_t@<X0>, uint64_t@<X8>);
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  id v56;
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
  uint64_t (**v67)@<X0>(uint64_t@<X0>, uint64_t@<X8>);
  __int128 v68;
  void *v69;

  v66 = sub_1000071DC(&qword_10002DCE8);
  __chkstk_darwin(v66);
  v67 = (uint64_t (**)@<X0>(uint64_t@<X0>, uint64_t@<X8>))((char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v60 = type metadata accessor for PhotoViewInternal(0);
  v62 = *(_QWORD *)(v60 - 8);
  __chkstk_darwin(v60);
  v63 = v4;
  v64 = (uint64_t)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = sub_1000071DC(&qword_10002DCF0);
  __chkstk_darwin(v59);
  v6 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Image.ResizingMode(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = sub_1000071DC(&qword_10002DCF8);
  __chkstk_darwin(v57);
  v12 = (char *)&v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v58 = sub_1000071DC(&qword_10002DD00);
  __chkstk_darwin(v58);
  v14 = (char *)&v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = sub_1000071DC(&qword_10002DD08);
  v15 = __chkstk_darwin(v65);
  v17 = (char *)&v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v61 = (uint64_t)&v52 - v18;
  v19 = v1;
  v68 = *(_OWORD *)(v1 + 16);
  sub_1000071DC(&qword_10002DD10);
  v20 = State.wrappedValue.getter(&v69);
  v21 = v69;
  if (v69)
  {
    v52 = static Color.clear.getter(v20);
    v22 = static Alignment.center.getter(v52);
    v53 = v23;
    v54 = v22;
    v56 = v21;
    v24 = Image.init(uiImage:)();
    (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for Image.ResizingMode.stretch(_:), v7);
    v25 = Image.resizable(capInsets:resizingMode:)(v10, v24, 0.0, 0.0, 0.0, 0.0);
    v55 = a1;
    v26 = v25;
    v27 = swift_release(v24);
    (*(void (**)(char *, uint64_t, __n128))(v8 + 8))(v10, v7, v27);
    v28 = v19 + *(int *)(v60 + 36);
    sub_100015BB4(v28, (uint64_t)v6, (uint64_t (*)(_QWORD))&type metadata accessor for RoundedRectangle);
    *(_WORD *)&v6[*(int *)(v59 + 36)] = 256;
    sub_1000075F4((uint64_t)v6, (uint64_t)&v12[*(int *)(v57 + 36)], &qword_10002DCF0);
    *(_QWORD *)v12 = v52;
    *((_QWORD *)v12 + 1) = 0x3FF0000000000000;
    *((_WORD *)v12 + 8) = 0;
    *((_QWORD *)v12 + 3) = v26;
    *((_QWORD *)v12 + 4) = 0;
    *((_WORD *)v12 + 20) = 257;
    v29 = v53;
    *((_QWORD *)v12 + 6) = v54;
    *((_QWORD *)v12 + 7) = v29;
    sub_1000077A4((uint64_t)v6, &qword_10002DCF0);
    v30 = (uint64_t)&v14[*(int *)(v58 + 36)];
    sub_100015BB4(v28, v30, (uint64_t (*)(_QWORD))&type metadata accessor for RoundedRectangle);
    *(_BYTE *)(v30 + *(int *)(sub_1000071DC(&qword_10002DD78) + 36)) = 0;
    sub_1000075B0((uint64_t)v12, (uint64_t)v14, &qword_10002DCF8);
    v31 = v64;
    sub_100015BB4(v19, v64, type metadata accessor for PhotoViewInternal);
    v32 = *(unsigned __int8 *)(v62 + 80);
    v33 = (v32 + 16) & ~v32;
    v34 = swift_allocObject(&unk_10002A3F8, v33 + v63, v32 | 7);
    sub_100015844(v31, v34 + v33);
    sub_1000075F4((uint64_t)v14, (uint64_t)v17, &qword_10002DD00);
    v35 = v65;
    v36 = &v17[*(int *)(v65 + 36)];
    *(_QWORD *)v36 = 0;
    *((_QWORD *)v36 + 1) = 0;
    *((_QWORD *)v36 + 2) = sub_100015BFC;
    *((_QWORD *)v36 + 3) = v34;
    sub_1000077A4((uint64_t)v14, &qword_10002DD00);
    v37 = v61;
    sub_1000075B0((uint64_t)v17, v61, &qword_10002DD08);
    v38 = v67;
    sub_1000075F4(v37, (uint64_t)v67, &qword_10002DD08);
    swift_storeEnumTagMultiPayload(v38, v66, 0);
    v39 = sub_1000071DC(&qword_10002DD18);
    v40 = sub_1000158D4();
    v41 = sub_100015B30();
    _ConditionalContent<>.init(storage:)(v38, v35, v39, v40, v41);

    return sub_1000077A4(v37, &qword_10002DD08);
  }
  else
  {
    v43 = v64;
    sub_100015BB4(v19, v64, type metadata accessor for PhotoViewInternal);
    v44 = *(unsigned __int8 *)(v62 + 80);
    v45 = (v44 + 16) & ~v44;
    v46 = swift_allocObject(&unk_10002A3D0, v45 + v63, v44 | 7);
    sub_100015844(v43, v46 + v45);
    v47 = v66;
    v48 = v67;
    *v67 = sub_100015888;
    v48[1] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))v46;
    v48[2] = (uint64_t (*)@<X0>(uint64_t@<X0>, uint64_t@<X8>))0x3FF0000000000000;
    *((_WORD *)v48 + 12) = 0;
    swift_storeEnumTagMultiPayload(v48, v47, 1);
    v49 = sub_1000071DC(&qword_10002DD18);
    v50 = sub_1000158D4();
    v51 = sub_100015B30();
    return _ConditionalContent<>.init(storage:)(v48, v65, v49, v50, v51);
  }
}

uint64_t sub_1000152A8(uint64_t a1)
{
  uint64_t v2;
  int v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v10;
  __int128 v11;

  v11 = *(_OWORD *)(a1 + 16);
  v10 = 0;
  v2 = sub_1000071DC(&qword_10002DD10);
  State.wrappedValue.setter(&v10, v2);
  v3 = *(_DWORD *)(a1 + 32);
  v4 = *(_BYTE *)(a1 + 36);
  v5 = *(_QWORD *)(a1 + 40);
  LODWORD(v11) = v3;
  BYTE4(v11) = v4;
  *((_QWORD *)&v11 + 1) = v5;
  v6 = sub_1000071DC(&qword_10002DD98);
  State.wrappedValue.getter(&v10);
  if ((v10 & 0x100000000) == 0)
  {
    v7 = v10;
    v8 = objc_msgSend((id)objc_opt_self(PHImageManager), "defaultManager");
    objc_msgSend(v8, "cancelImageRequest:", v7);

  }
  LODWORD(v11) = v3;
  BYTE4(v11) = v4;
  *((_QWORD *)&v11 + 1) = v5;
  LODWORD(v10) = 0;
  BYTE4(v10) = 1;
  return State.wrappedValue.setter(&v10, v6);
}

uint64_t sub_1000153A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (**v22)();
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v25 = a2;
  v26 = a1;
  v27 = a3;
  v3 = type metadata accessor for GeometryProxy(0);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  __chkstk_darwin(v3);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for PhotoViewInternal(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  __chkstk_darwin(v7);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000071DC(&qword_10002DDA0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = __chkstk_darwin(v11);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  ProgressView<>.init<>()(v13);
  sub_100015BB4(v25, (uint64_t)v10, type metadata accessor for PhotoViewInternal);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v26, v3);
  v16 = *(unsigned __int8 *)(v8 + 80);
  v17 = (v16 + 16) & ~v16;
  v18 = *(unsigned __int8 *)(v4 + 80);
  v19 = (v9 + v18 + v17) & ~v18;
  v20 = swift_allocObject(&unk_10002A420, v19 + v5, v16 | v18 | 7);
  sub_100015844((uint64_t)v10, v20 + v17);
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v20 + v19, v6, v3);
  v21 = v27;
  (*(void (**)(uint64_t, char *, uint64_t))(v12 + 16))(v27, v15, v11);
  v22 = (uint64_t (**)())(v21 + *(int *)(sub_1000071DC(&qword_10002DDA8) + 36));
  *v22 = sub_100015D28;
  v22[1] = (uint64_t (*)())v20;
  v22[2] = 0;
  v22[3] = 0;
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v15, v11);
}

uint64_t sub_100015568(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  char v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  int v27;
  char v28;
  void **aBlock;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, void *, uint64_t);
  void *v32;
  void *(*v33)(void *, uint64_t);
  uint64_t v34;

  v2 = type metadata accessor for PhotoViewInternal(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  __chkstk_darwin(v2);
  v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend((id)objc_opt_self(PHImageManager), "defaultManager");
  v7 = *(_QWORD *)a1;
  v8 = ((double (*)(void))GeometryProxy.size.getter)();
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(_BYTE *)(a1 + 56);
  sub_100014750(v9, v10);
  v11 = sub_100017C6C(v9, v10);
  v12 = sub_1000147D8(v9, v10);
  v13 = v8 * v11;
  GeometryProxy.size.getter(v12);
  v15 = v14;
  sub_100014750(v9, v10);
  v16 = sub_100017C6C(v9, v10);
  sub_1000147D8(v9, v10);
  v17 = objc_msgSend(objc_allocWithZone((Class)PHImageRequestOptions), "init");
  objc_msgSend(v17, "setDeliveryMode:", 0);
  objc_msgSend(v17, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v17, "setAllowSecondaryDegradedImage:", 1);
  sub_100015BB4(a1, (uint64_t)v5, type metadata accessor for PhotoViewInternal);
  v18 = *(unsigned __int8 *)(v3 + 80);
  v19 = (v18 + 16) & ~v18;
  v20 = swift_allocObject(&unk_10002A448, v19 + v4, v18 | 7);
  sub_100015844((uint64_t)v5, v20 + v19);
  v33 = sub_100015E4C;
  v34 = v20;
  aBlock = _NSConcreteStackBlock;
  v30 = 1107296256;
  v31 = sub_10001620C;
  v32 = &unk_10002A460;
  v21 = _Block_copy(&aBlock);
  swift_release(v34);
  LODWORD(v7) = objc_msgSend(v6, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v7, 1, v17, v21, v13, v15 * v16);
  _Block_release(v21);

  v22 = *(_BYTE *)(a1 + 36);
  v23 = *(_QWORD *)(a1 + 40);
  LODWORD(aBlock) = *(_DWORD *)(a1 + 32);
  BYTE4(aBlock) = v22;
  v30 = v23;
  v27 = v7;
  v28 = 0;
  v24 = sub_1000071DC(&qword_10002DD98);
  return State.wrappedValue.setter(&v27, v24);
}

void *sub_1000157EC(void *result, uint64_t a2, uint64_t a3)
{
  id v3;
  uint64_t v4;
  void *v5;
  __int128 v6;

  if (result)
  {
    v6 = *(_OWORD *)(a3 + 16);
    v5 = result;
    v3 = result;
    v4 = sub_1000071DC(&qword_10002DD10);
    return (void *)State.wrappedValue.setter(&v5, v4);
  }
  return result;
}

uint64_t sub_100015844(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PhotoViewInternal(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100015888@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PhotoViewInternal(0) - 8) + 80);
  return sub_1000153A4(a1, v2 + ((v5 + 16) & ~v5), a2);
}

unint64_t sub_1000158D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002DD20;
  if (!qword_10002DD20)
  {
    v1 = sub_10000721C(&qword_10002DD08);
    sub_100015940();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002DD20);
  }
  return result;
}

unint64_t sub_100015940()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002DD28;
  if (!qword_10002DD28)
  {
    v1 = sub_10000721C(&qword_10002DD00);
    sub_1000159C4();
    sub_1000074EC(&qword_10002DD70, &qword_10002DD78, (uint64_t)&protocol conformance descriptor for _ContentShapeModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002DD28);
  }
  return result;
}

unint64_t sub_1000159C4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002DD30;
  if (!qword_10002DD30)
  {
    v1 = sub_10000721C(&qword_10002DCF8);
    sub_100015A48();
    sub_1000074EC(&qword_10002DD68, &qword_10002DCF0, (uint64_t)&protocol conformance descriptor for _ClipEffect<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002DD30);
  }
  return result;
}

unint64_t sub_100015A48()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002DD38;
  if (!qword_10002DD38)
  {
    v1 = sub_10000721C(&qword_10002DD40);
    sub_100015ACC();
    sub_1000074EC(&qword_10002DD58, &qword_10002DD60, (uint64_t)&protocol conformance descriptor for _OverlayModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002DD38);
  }
  return result;
}

unint64_t sub_100015ACC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002DD48;
  if (!qword_10002DD48)
  {
    v1 = sub_10000721C(&qword_10002DD50);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002DD48);
  }
  return result;
}

unint64_t sub_100015B30()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002DD80;
  if (!qword_10002DD80)
  {
    v1 = sub_10000721C(&qword_10002DD18);
    sub_1000074EC(&qword_10002DD88, &qword_10002DD90, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002DD80);
  }
  return result;
}

uint64_t sub_100015BB4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100015BFC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PhotoViewInternal(0) - 8) + 80);
  return sub_1000152A8(v0 + ((v1 + 16) & ~v1));
}

uint64_t sub_100015C28()
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

  v1 = type metadata accessor for PhotoViewInternal(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = type metadata accessor for GeometryProxy(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v9 = (v4 + v5 + v8) & ~v8;
  v10 = v9 + *(_QWORD *)(v7 + 64);
  v11 = v3 | v8 | 7;
  v12 = v0 + v4;

  swift_release(*(_QWORD *)(v12 + 24));
  swift_release(*(_QWORD *)(v12 + 40));
  sub_1000147D8(*(_QWORD *)(v12 + 48), *(_BYTE *)(v12 + 56));
  v13 = *(int *)(v1 + 36);
  v14 = v12 + v13 + *(int *)(type metadata accessor for RoundedRectangle(0) + 20);
  v15 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v0 + v9, v6);
  return swift_deallocObject(v0, v10, v11);
}

uint64_t sub_100015D28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PhotoViewInternal(0) - 8) + 80);
  v2 = (v1 + 16) & ~v1;
  type metadata accessor for GeometryProxy(0);
  return sub_100015568(v0 + v2);
}

uint64_t sub_100015D8C()
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

  v1 = type metadata accessor for PhotoViewInternal(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  v7 = v0 + v4;

  swift_release(*(_QWORD *)(v7 + 24));
  swift_release(*(_QWORD *)(v7 + 40));
  sub_1000147D8(*(_QWORD *)(v7 + 48), *(_BYTE *)(v7 + 56));
  v8 = *(int *)(v1 + 36);
  v9 = v7 + v8 + *(int *)(type metadata accessor for RoundedRectangle(0) + 20);
  v10 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  return swift_deallocObject(v0, v5, v6);
}

void *sub_100015E4C(void *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for PhotoViewInternal(0) - 8) + 80);
  return sub_1000157EC(a1, a2, v2 + ((v5 + 16) & ~v5));
}

uint64_t sub_100015E98(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100015EA8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_100015EB4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002DDB0;
  if (!qword_10002DDB0)
  {
    v1 = sub_10000721C(&qword_10002DDB8);
    sub_1000158D4();
    sub_100015B30();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002DDB0);
  }
  return result;
}

uint64_t destroy for PhotoDetailView(uint64_t a1)
{

  swift_release(*(_QWORD *)(a1 + 16));
  swift_release(*(_QWORD *)(a1 + 24));
  swift_release(*(_QWORD *)(a1 + 32));
  return sub_1000147D8(*(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48));
}

uint64_t initializeWithCopy for PhotoDetailView(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  id v10;
  id v11;

  v3 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = v7;
  v9 = *(_BYTE *)(a2 + 48);
  v10 = v3;
  v11 = v4;
  swift_retain(v5);
  swift_retain(v6);
  swift_retain(v7);
  sub_100014750(v8, v9);
  *(_QWORD *)(a1 + 40) = v8;
  *(_BYTE *)(a1 + 48) = v9;
  return a1;
}

uint64_t assignWithCopy for PhotoDetailView(uint64_t a1, void **a2)
{
  void **v2;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  v2 = a2;
  v4 = *a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *a2;
  v6 = v4;

  v7 = *(void **)(a1 + 8);
  v8 = v2[1];
  *(_QWORD *)(a1 + 8) = v8;
  v9 = v8;

  v10 = *(_QWORD *)(a1 + 16);
  v11 = v2[2];
  *(_QWORD *)(a1 + 16) = v11;
  swift_retain(v11);
  swift_release(v10);
  v12 = *(_QWORD *)(a1 + 24);
  v13 = v2[3];
  *(_QWORD *)(a1 + 24) = v13;
  swift_retain(v13);
  swift_release(v12);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v2[4];
  *(_QWORD *)(a1 + 32) = v15;
  swift_retain(v15);
  swift_release(v14);
  v16 = (uint64_t)v2[5];
  LOBYTE(v2) = *((_BYTE *)v2 + 48);
  sub_100014750(v16, (char)v2);
  v17 = *(_QWORD *)(a1 + 40);
  v18 = *(_BYTE *)(a1 + 48);
  *(_QWORD *)(a1 + 40) = v16;
  *(_BYTE *)(a1 + 48) = (_BYTE)v2;
  sub_1000147D8(v17, v18);
  return a1;
}

__n128 initializeWithTake for PhotoDetailView(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for PhotoDetailView(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;

  swift_release(*(_QWORD *)(a1 + 16));
  v5 = *(_QWORD *)(a1 + 24);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release(v5);
  v6 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release(v6);
  v7 = *(_BYTE *)(a2 + 48);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_BYTE *)(a1 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_BYTE *)(a1 + 48) = v7;
  sub_1000147D8(v8, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotoDetailView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 49))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PhotoDetailView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 49) = 1;
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
    *(_BYTE *)(result + 49) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PhotoDetailView()
{
  return &type metadata for PhotoDetailView;
}

uint64_t sub_1000161FC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100021ED0, 1);
}

uint64_t sub_100016210()
{
  void (**v0)(void);

  return sub_1000185C0(*v0);
}

uint64_t sub_100016220()
{
  return sub_100018640();
}

uint64_t sub_100016238(uint64_t a1, char a2)
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)(a1, a2 & 1);
}

uint64_t sub_100016278(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100020778, a3);
  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, WitnessTable);
}

uint64_t sub_1000162D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100020778, a3);
  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, WitnessTable);
}

void sub_100016330(uint64_t a1)
{
  uint64_t WitnessTable;

  WitnessTable = swift_getWitnessTable(&unk_100020778, a1);
  UIViewRepresentable.body.getter(a1, WitnessTable);
  __break(1u);
}

uint64_t sub_100016360()
{
  uint64_t v0;
  uint64_t v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[3];
  uint64_t v15;
  char v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  id v22;
  id v23;

  v23 = *(id *)v0;
  v20 = *(_OWORD *)(v0 + 8);
  sub_1000075B0((uint64_t)&v20, (uint64_t)&v22, &qword_10002DDC0);
  sub_1000075B0((uint64_t)&v20 + 8, (uint64_t)&v21, &qword_10002DDC8);
  v17 = *(_OWORD *)(v0 + 24);
  sub_1000075B0((uint64_t)&v17, (uint64_t)&v19, &qword_10002DDD0);
  sub_1000075B0((uint64_t)&v17 + 8, (uint64_t)&v18, &qword_10002DDD8);
  v15 = *(_QWORD *)(v0 + 40);
  v16 = *(_BYTE *)(v0 + 48);
  v1 = swift_allocObject(&unk_10002A558, 65, 7);
  v2 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v1 + 16) = *(_OWORD *)v0;
  *(_OWORD *)(v1 + 32) = v2;
  *(_OWORD *)(v1 + 48) = *(_OWORD *)(v0 + 32);
  *(_BYTE *)(v1 + 64) = *(_BYTE *)(v0 + 48);
  v14[1] = sub_100017BD0;
  v14[2] = v1;
  sub_100017C18(&v23);
  sub_100017C18(&v22);
  sub_1000072BC(&v21);
  sub_1000072BC(&v19);
  sub_1000072BC(&v18);
  sub_100017C40((uint64_t)&v15);
  v3 = LocalizedStringKey.init(stringLiteral:)(0, 0xE000000000000000);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = Image.init(systemName:)(0, 0xE000000000000000);
  v14[0] = v10;
  v11 = sub_1000071DC(&qword_10002DDE0);
  v12 = sub_1000074EC(&qword_10002DDE8, &qword_10002DDE0, (uint64_t)&unk_100020858);
  View.navigationTitle<A>(_:icon:)(v3, v5, v7 & 1, v9, v14, v11, &type metadata for Image, v12, &protocol witness table for Image);
  swift_release(v1);
  swift_release(v10);
  swift_bridgeObjectRelease(v9);
  return swift_bridgeObjectRelease(v5);
}

double sub_100016548@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int16 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  double result;
  __int128 v12;
  __int16 v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int16 v17;
  char v18;
  __int128 v19;
  __int128 v20;
  __int16 v21;
  char v22;
  uint64_t v23;
  char v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  id v30;
  id v31;

  v31 = *(id *)a1;
  if (objc_msgSend(v31, "mediaType") == (id)2)
  {
    sub_100016738((uint64_t)&v19);
    if (HIBYTE(v21))
      v4 = 256;
    else
      v4 = 0;
    v15 = v19;
    v16 = v20;
    v17 = v4 | v21;
    v18 = 0;
  }
  else
  {
    v28 = *(_OWORD *)(a1 + 8);
    sub_1000075B0((uint64_t)&v28, (uint64_t)&v30, &qword_10002DDC0);
    sub_1000075B0((uint64_t)&v28 + 8, (uint64_t)&v29, &qword_10002DDC8);
    v25 = *(_OWORD *)(a1 + 24);
    sub_1000075B0((uint64_t)&v25, (uint64_t)&v27, &qword_10002DDD0);
    sub_1000075B0((uint64_t)&v25 + 8, (uint64_t)&v26, &qword_10002DDD8);
    v23 = *(_QWORD *)(a1 + 40);
    v24 = *(_BYTE *)(a1 + 48);
    v5 = swift_allocObject(&unk_10002A580, 65, 7);
    v6 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v5 + 16) = *(_OWORD *)a1;
    *(_OWORD *)(v5 + 32) = v6;
    *(_OWORD *)(v5 + 48) = *(_OWORD *)(a1 + 32);
    *(_BYTE *)(v5 + 64) = *(_BYTE *)(a1 + 48);
    *(_QWORD *)&v15 = sub_100017E30;
    *((_QWORD *)&v15 + 1) = v5;
    v16 = 0uLL;
    v17 = 0;
    v18 = 1;
    sub_100017C18(&v31);
    sub_100017C18(&v30);
    sub_1000072BC(&v29);
    sub_1000072BC(&v27);
    sub_1000072BC(&v26);
    sub_100017C40((uint64_t)&v23);
  }
  v7 = sub_1000071DC(&qword_10002DDF0);
  v8 = sub_1000071DC(&qword_10002DDF8);
  v9 = sub_100017E38();
  v10 = sub_1000074EC(&qword_10002DE30, &qword_10002DDF8, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
  _ConditionalContent<>.init(storage:)(&v15, v7, v8, v9, v10);
  result = *(double *)&v19;
  v12 = v20;
  v13 = v21;
  v14 = v22;
  *(_OWORD *)a2 = v19;
  *(_OWORD *)(a2 + 16) = v12;
  *(_WORD *)(a2 + 32) = v13;
  *(_BYTE *)(a2 + 34) = v14;
  return result;
}

double sub_100016738@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  void (*v5)(__n128);
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double result;
  __int128 v14;
  char v15;
  char v16;
  void (*v17)(__n128);
  uint64_t v18;
  uint64_t (*v19)();
  void (*v20)(__n128);
  __int16 v21;
  __int128 v22;
  __int128 v23;
  char v24;
  char v25;
  uint64_t v26;
  char v27;
  __int128 v28;
  uint64_t v29;
  id v30;
  id v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;

  v2 = v1;
  v32 = *(_OWORD *)(v1 + 24);
  v22 = *(_OWORD *)(v1 + 24);
  sub_1000071DC(&qword_10002DE38);
  v4 = State.wrappedValue.getter(&v17);
  v5 = v17;
  if (v17)
  {
    v17 = (void (*)(__n128))static Alignment.bottom.getter(v4);
    v18 = v6;
    v19 = sub_100017F2C;
    v20 = v5;
    v21 = 0;
  }
  else
  {
    sub_1000075B0((uint64_t)&v32 + 8, (uint64_t)&v34, &qword_10002DDD8);
    sub_1000075B0((uint64_t)&v32, (uint64_t)&v33, &qword_10002DDD0);
    v31 = *(id *)v2;
    v28 = *(_OWORD *)(v2 + 8);
    sub_1000075B0((uint64_t)&v28, (uint64_t)&v30, &qword_10002DDC0);
    sub_1000075B0((uint64_t)&v28 + 8, (uint64_t)&v29, &qword_10002DDC8);
    v26 = *(_QWORD *)(v2 + 40);
    v27 = *(_BYTE *)(v2 + 48);
    v7 = swift_allocObject(&unk_10002A5A8, 65, 7);
    v8 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v7 + 16) = *(_OWORD *)v2;
    *(_OWORD *)(v7 + 32) = v8;
    *(_OWORD *)(v7 + 48) = *(_OWORD *)(v2 + 32);
    *(_BYTE *)(v7 + 64) = *(_BYTE *)(v2 + 48);
    v17 = sub_100017F24;
    v18 = v7;
    v19 = 0;
    v20 = 0;
    v21 = 256;
    sub_100017C18(&v31);
    sub_100017C18(&v30);
    sub_1000072BC(&v29);
    sub_1000072BC(&v33);
    sub_1000072BC(&v34);
    sub_100017C40((uint64_t)&v26);
  }
  v9 = sub_1000071DC(&qword_10002DE10);
  v10 = sub_1000071DC(&qword_10002DE20);
  v11 = sub_1000074EC(&qword_10002DE08, &qword_10002DE10, (uint64_t)&protocol conformance descriptor for ZStack<A>);
  v12 = sub_10001807C(&qword_10002DE18, &qword_10002DE20, (void (*)(void))sub_100017EDC);
  _ConditionalContent<>.init(storage:)(&v17, v9, v10, v11, v12);
  result = *(double *)&v22;
  v14 = v23;
  v15 = v24;
  v16 = v25;
  *(_OWORD *)a1 = v22;
  *(_OWORD *)(a1 + 16) = v14;
  *(_BYTE *)(a1 + 32) = v15;
  *(_BYTE *)(a1 + 33) = v16;
  return result;
}

void sub_100016940(uint64_t a1, __n128 a2)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  __int128 v12;
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t v18;
  char v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  id v25;
  id v26;

  if (qword_10002DB90 != -1)
    swift_once(&qword_10002DB90, sub_100018734, a2);
  v3 = type metadata accessor for Logger(0);
  v4 = sub_10000CFD8(v3, (uint64_t)qword_10002FBA0);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "Requesting asset for video", v7, 2u);
    swift_slowDealloc(v7, -1, -1);
  }

  v8 = objc_msgSend(objc_allocWithZone((Class)PHVideoRequestOptions), "init");
  objc_msgSend(v8, "setNetworkAccessAllowed:", 1);
  v9 = objc_msgSend((id)objc_opt_self(PHImageManager), "defaultManager");
  v26 = *(id *)a1;
  v10 = v26;
  v23 = *(_OWORD *)(a1 + 8);
  sub_1000075B0((uint64_t)&v23, (uint64_t)&v25, &qword_10002DDC0);
  sub_1000075B0((uint64_t)&v23 + 8, (uint64_t)&v24, &qword_10002DDC8);
  v20 = *(_OWORD *)(a1 + 24);
  sub_1000075B0((uint64_t)&v20, (uint64_t)&v22, &qword_10002DDD0);
  sub_1000075B0((uint64_t)&v20 + 8, (uint64_t)&v21, &qword_10002DDD8);
  v18 = *(_QWORD *)(a1 + 40);
  v19 = *(_BYTE *)(a1 + 48);
  v11 = swift_allocObject(&unk_10002A5D0, 65, 7);
  v12 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v11 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v11 + 32) = v12;
  *(_OWORD *)(v11 + 48) = *(_OWORD *)(a1 + 32);
  *(_BYTE *)(v11 + 64) = *(_BYTE *)(a1 + 48);
  v16[4] = sub_100017F38;
  v17 = v11;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 1107296256;
  v16[2] = sub_10001620C;
  v16[3] = &unk_10002A5E8;
  v13 = _Block_copy(v16);
  v14 = v17;
  v15 = v8;
  sub_100017C18(&v26);
  sub_100017C18(&v25);
  sub_1000072BC(&v24);
  sub_1000072BC(&v22);
  sub_1000072BC(&v21);
  sub_100017C40((uint64_t)&v18);
  objc_msgSend(v9, "requestPlayerItemForVideo:options:resultHandler:", v10, v15, v13, swift_release(v14).n128_f64[0]);
  _Block_release(v13);

}

void sub_100016BD4(void *a1, uint64_t a2, uint64_t a3, __n128 a4)
{
  uint64_t v5;
  id v6;
  __n128 v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  id v13;
  id v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  id v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  id v45;
  id v46;

  if (a1)
  {
    v5 = qword_10002DB90;
    v6 = a1;
    if (v5 != -1)
      swift_once(&qword_10002DB90, sub_100018734, v7);
    v8 = type metadata accessor for Logger(0);
    v9 = sub_10000CFD8(v8, (uint64_t)qword_10002FBA0);
    v10 = Logger.logObject.getter(v9);
    v11 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Got player item", v12, 2u);
      swift_slowDealloc(v12, -1, -1);
    }

    v13 = *(id *)a3;
    v14 = v6;
    v15 = (double)(uint64_t)objc_msgSend(v13, "pixelWidth");
    v16 = (double)(uint64_t)objc_msgSend(v13, "pixelHeight");
    v17 = type metadata accessor for PlayerViewModel();
    v18 = swift_allocObject(v17, 40, 7);
    v19 = objc_msgSend(objc_allocWithZone((Class)AVPlayer), "initWithPlayerItem:", v14);

    *(_QWORD *)(v18 + 16) = v19;
    *(double *)(v18 + 24) = v15;
    *(double *)(v18 + 32) = v16;
    v43 = *(_OWORD *)(a3 + 24);
    *(_QWORD *)&v40 = v18;
    v20 = sub_1000071DC(&qword_10002DE38);
    State.wrappedValue.setter(&v40, v20);

  }
  else
  {
    if (qword_10002DB90 != -1)
      swift_once(&qword_10002DB90, sub_100018734, a4);
    v22 = type metadata accessor for Logger(0);
    sub_10000CFD8(v22, (uint64_t)qword_10002FBA0);
    v46 = *(id *)a3;
    v43 = *(_OWORD *)(a3 + 8);
    sub_1000075B0((uint64_t)&v43, (uint64_t)&v45, &qword_10002DDC0);
    sub_1000075B0((uint64_t)&v43 + 8, (uint64_t)&v44, &qword_10002DDC8);
    v40 = *(_OWORD *)(a3 + 24);
    sub_1000075B0((uint64_t)&v40, (uint64_t)&v42, &qword_10002DDD0);
    sub_1000075B0((uint64_t)&v40 + 8, (uint64_t)&v41, &qword_10002DDD8);
    v38 = *(_QWORD *)(a3 + 40);
    v39 = *(_BYTE *)(a3 + 48);
    sub_100017C18(&v46);
    sub_100017C18(&v45);
    sub_1000072BC(&v44);
    sub_1000072BC(&v42);
    sub_1000072BC(&v41);
    sub_100017C40((uint64_t)&v38);
    swift_bridgeObjectRetain(a2);
    sub_100017C18(&v46);
    sub_100017C18(&v45);
    sub_1000072BC(&v44);
    sub_1000072BC(&v42);
    sub_1000072BC(&v41);
    sub_100017C40((uint64_t)&v38);
    v23 = swift_bridgeObjectRetain(a2);
    v24 = Logger.logObject.getter(v23);
    v25 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = v46;
      v27 = swift_slowAlloc(22, -1);
      v28 = (_QWORD *)swift_slowAlloc(8, -1);
      v29 = swift_slowAlloc(32, -1);
      v36 = (uint64_t)v26;
      v37 = v29;
      *(_DWORD *)v27 = 138412546;
      v30 = v26;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37, v27 + 4, v27 + 12);
      *v28 = v26;
      sub_100017F58(&v46);
      sub_100017F58(&v45);
      sub_10000777C(&v44);
      sub_10000777C(&v42);
      sub_10000777C(&v41);
      sub_100017F80((uint64_t)&v38);
      sub_100017F58(&v46);
      sub_100017F58(&v45);
      sub_10000777C(&v44);
      sub_10000777C(&v42);
      sub_10000777C(&v41);
      sub_100017F80((uint64_t)&v38);
      *(_WORD *)(v27 + 12) = 2080;
      v36 = a2;
      swift_bridgeObjectRetain(a2);
      v31 = sub_1000071DC(&qword_10002DE40);
      v32 = String.init<A>(describing:)(&v36, v31);
      v34 = v33;
      v36 = sub_1000127E8(v32, v33, &v37);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v36, &v37, v27 + 14, v27 + 22);
      swift_bridgeObjectRelease_n(a2, 2);
      swift_bridgeObjectRelease(v34);
      _os_log_impl((void *)&_mh_execute_header, v24, v25, "Could not get playerItem for %@. Info: %s", (uint8_t *)v27, 0x16u);
      v35 = sub_1000071DC(&qword_10002D6B8);
      swift_arrayDestroy(v28, 1, v35);
      swift_slowDealloc(v28, -1, -1);
      swift_arrayDestroy(v29, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v29, -1, -1);
      swift_slowDealloc(v27, -1, -1);

    }
    else
    {
      sub_100017F58(&v46);
      sub_100017F58(&v45);
      sub_10000777C(&v44);
      sub_10000777C(&v42);
      sub_10000777C(&v41);
      sub_100017F80((uint64_t)&v38);
      sub_100017F58(&v46);
      sub_100017F58(&v45);
      sub_10000777C(&v44);
      sub_10000777C(&v42);
      sub_10000777C(&v41);
      sub_100017F80((uint64_t)&v38);

      swift_bridgeObjectRelease_n(a2, 2);
    }
  }
}

uint64_t sub_100017114(uint64_t a1, void *a2, uint64_t a3)
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

uint64_t sub_1000171A8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD v37[2];
  _QWORD v38[2];
  _OWORD v39[3];
  uint64_t v40;
  char v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  id v47;
  id v48;

  v37[1] = a3;
  v37[0] = type metadata accessor for GeometryProxy(0);
  v5 = *(_QWORD *)(v37[0] - 8);
  v6 = *(_QWORD *)(v5 + 64);
  __chkstk_darwin(v37[0]);
  v7 = (char *)v37 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000071DC(&qword_10002DE48);
  __chkstk_darwin(v8);
  v10 = (char *)v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000071DC(&qword_10002DE50);
  __chkstk_darwin(v11);
  v13 = (char *)v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1000174D8(a2, (uint64_t)v10);
  v15 = GeometryProxy.size.getter(v14);
  GeometryProxy.size.getter(v16);
  v18 = v17;
  v20 = static Alignment.center.getter(v19);
  _FrameLayout.init(width:height:alignment:)(v39, *(_QWORD *)&v15, 0, v18, 0, v20, v21);
  sub_1000075F4((uint64_t)v10, (uint64_t)v13, &qword_10002DE48);
  v22 = &v13[*(int *)(v11 + 36)];
  v23 = v39[1];
  *(_OWORD *)v22 = v39[0];
  *((_OWORD *)v22 + 1) = v23;
  *((_OWORD *)v22 + 2) = v39[2];
  v24 = sub_1000077A4((uint64_t)v10, &qword_10002DE48);
  v38[0] = GeometryProxy.size.getter(v24);
  v38[1] = v25;
  v48 = *(id *)a2;
  v45 = *(_OWORD *)(a2 + 8);
  sub_1000075B0((uint64_t)&v45, (uint64_t)&v47, &qword_10002DDC0);
  sub_1000075B0((uint64_t)&v45 + 8, (uint64_t)&v46, &qword_10002DDC8);
  v42 = *(_OWORD *)(a2 + 24);
  sub_1000075B0((uint64_t)&v42, (uint64_t)&v44, &qword_10002DDD0);
  sub_1000075B0((uint64_t)&v42 + 8, (uint64_t)&v43, &qword_10002DDD8);
  v40 = *(_QWORD *)(a2 + 40);
  v41 = *(_BYTE *)(a2 + 48);
  v26 = a1;
  v27 = v37[0];
  (*(void (**)(char *, uint64_t, _QWORD))(v5 + 16))(v7, v26, v37[0]);
  v28 = *(unsigned __int8 *)(v5 + 80);
  v29 = (v28 + 65) & ~v28;
  v30 = swift_allocObject(&unk_10002A620, v29 + v6, v28 | 7);
  v31 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(v30 + 16) = *(_OWORD *)a2;
  *(_OWORD *)(v30 + 32) = v31;
  *(_OWORD *)(v30 + 48) = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(v30 + 64) = *(_BYTE *)(a2 + 48);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v30 + v29, v7, v27);
  sub_100017C18(&v48);
  sub_100017C18(&v47);
  sub_1000072BC(&v46);
  sub_1000072BC(&v44);
  sub_1000072BC(&v43);
  sub_100017C40((uint64_t)&v40);
  type metadata accessor for CGSize();
  v33 = v32;
  v34 = sub_10001807C(&qword_10002DE58, &qword_10002DE50, (void (*)(void))sub_1000180E4);
  v35 = sub_100006E5C(&qword_10002DE98, (uint64_t (*)(uint64_t))type metadata accessor for CGSize, (uint64_t)&protocol conformance descriptor for CGSize);
  View.onChange<A>(of:initial:_:)(v38, 1, sub_10001804C, v30, v11, v33, v34, v35);
  swift_release(v30);
  return sub_1000077A4((uint64_t)v13, &qword_10002DE50);
}

uint64_t sub_1000174D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  __n128 v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v24;
  unint64_t v25;
  _QWORD v26[2];
  __int128 v27;
  __int16 v28;
  id v29;

  v4 = type metadata accessor for Image.ResizingMode(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1000071DC(&qword_10002DE80);
  __chkstk_darwin(v8);
  v10 = (char *)v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1000071DC(qword_10002DEA0);
  __chkstk_darwin(v11);
  v13 = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = *(_OWORD *)(a1 + 8);
  sub_1000071DC(&qword_10002DD10);
  State.wrappedValue.getter(&v29);
  if (v29)
  {
    v14 = v29;
    v26[1] = a2;
    v15 = v14;
    v16 = Image.init(uiImage:)();
    (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for Image.ResizingMode.stretch(_:), v4);
    v17 = Image.resizable(capInsets:resizingMode:)(v7, v16, 0.0, 0.0, 0.0, 0.0);
    v18 = swift_release(v16);
    (*(void (**)(char *, uint64_t, __n128))(v5 + 8))(v7, v4, v18);
    v27 = (unint64_t)v17;
    v28 = 1;
    v19 = sub_1000071DC(&qword_10002DE90);
    v20 = sub_100018238();
    View.accessibilityIdentifier(_:)(0x6F746F6850, 0xE500000000000000, v19, v20);
    swift_release(v17);
    sub_1000075F4((uint64_t)v10, (uint64_t)v13, &qword_10002DE80);
    swift_storeEnumTagMultiPayload(v13, v11, 0);
    v21 = sub_1000181B4();
    v22 = sub_100017EDC();
    _ConditionalContent<>.init(storage:)(v13, v8, &type metadata for PhotoDetailView.LoadingView, v21, v22);

    return sub_1000077A4((uint64_t)v10, &qword_10002DE80);
  }
  else
  {
    swift_storeEnumTagMultiPayload(v13, v11, 1);
    v24 = sub_1000181B4();
    v25 = sub_100017EDC();
    return _ConditionalContent<>.init(storage:)(v13, v8, &type metadata for PhotoDetailView.LoadingView, v24, v25);
  }
}

void sub_100017750(uint64_t a1)
{
  id v2;
  id v3;
  double v4;
  uint64_t v5;
  char v6;
  double v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  uint64_t v14;
  __int128 v15;
  void *v16;
  uint64_t v17;
  _QWORD v18[5];
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  id v25;
  id v26;

  v2 = objc_msgSend((id)objc_opt_self(PHImageManager), "defaultManager");
  v26 = *(id *)a1;
  v3 = v26;
  v4 = GeometryProxy.size.getter(v2);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_BYTE *)(a1 + 48);
  sub_100014750(v5, v6);
  v7 = sub_100017C6C(v5, v6);
  v8 = sub_1000147D8(v5, v6);
  v9 = v4 * v7;
  GeometryProxy.size.getter(v8);
  v11 = v10;
  sub_100014750(v5, v6);
  v12 = sub_100017C6C(v5, v6);
  sub_1000147D8(v5, v6);
  v13 = objc_msgSend(objc_allocWithZone((Class)PHImageRequestOptions), "init");
  objc_msgSend(v13, "setDeliveryMode:", 0);
  objc_msgSend(v13, "setNetworkAccessAllowed:", 1);
  objc_msgSend(v13, "setAllowSecondaryDegradedImage:", 1);
  v23 = *(_OWORD *)(a1 + 8);
  sub_1000075B0((uint64_t)&v23, (uint64_t)&v25, &qword_10002DDC0);
  sub_1000075B0((uint64_t)&v23 + 8, (uint64_t)&v24, &qword_10002DDC8);
  v20 = *(_OWORD *)(a1 + 24);
  sub_1000075B0((uint64_t)&v20, (uint64_t)&v22, &qword_10002DDD0);
  sub_1000075B0((uint64_t)&v20 + 8, (uint64_t)&v21, &qword_10002DDD8);
  v14 = swift_allocObject(&unk_10002A648, 65, 7);
  v15 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v14 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v14 + 32) = v15;
  *(_OWORD *)(v14 + 48) = *(_OWORD *)(a1 + 32);
  *(_BYTE *)(v14 + 64) = *(_BYTE *)(a1 + 48);
  v18[4] = sub_1000182F0;
  v19 = v14;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 1107296256;
  v18[2] = sub_10001620C;
  v18[3] = &unk_10002A660;
  v16 = _Block_copy(v18);
  v17 = v19;
  sub_100014750(v5, v6);
  sub_100017C18(&v26);
  sub_100017C18(&v25);
  sub_1000072BC(&v24);
  sub_1000072BC(&v22);
  sub_1000072BC(&v21);
  swift_release(v17);
  objc_msgSend(v2, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v3, 0, v13, v16, v9, v11 * v12);
  _Block_release(v16);

}

uint64_t sub_1000179E0(void *a1, uint64_t a2, uint64_t a3)
{
  id v3;
  uint64_t v4;
  void *v6;
  __int128 v7;

  v7 = *(_OWORD *)(a3 + 8);
  v6 = a1;
  v3 = a1;
  v4 = sub_1000071DC(&qword_10002DD10);
  return State.wrappedValue.setter(&v6, v4);
}

uint64_t sub_100017A2C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;

  v2 = LocalizedStringKey.init(stringLiteral:)(0x474E4944414F4CLL, 0xE700000000000000);
  result = Text.init(_:tableName:bundle:comment:)(v2);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5 & 1;
  *(_QWORD *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_100017A9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t KeyPath;
  uint64_t *v10;
  uint64_t v12;

  v2 = sub_1000071DC(&qword_10002DDA0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = ProgressView<>.init<>()(v4);
  v8 = static Color.white.getter(v7);
  KeyPath = swift_getKeyPath(&unk_1000208A8);
  (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(a1, v6, v2);
  v10 = (uint64_t *)(a1 + *(int *)(sub_1000071DC(&qword_10002DF28) + 36));
  *v10 = KeyPath;
  v10[1] = v8;
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_100017B64()
{
  uint64_t v0;
  unint64_t v1;

  v0 = sub_1000071DC(&qword_10002DF28);
  v1 = sub_1000184D4();
  return Label.init(title:icon:)(sub_100017A2C, 0, sub_100017A9C, 0, &type metadata for Text, v0, &protocol witness table for Text, v1);
}

double sub_100017BD0@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int16 v3;
  char v4;
  double result;
  __int128 v6;
  _OWORD v7[2];
  __int16 v8;
  char v9;

  sub_100016548(v1 + 16, (uint64_t)v7);
  v3 = v8;
  v4 = v9;
  result = *(double *)v7;
  v6 = v7[1];
  *(_OWORD *)a1 = v7[0];
  *(_OWORD *)(a1 + 16) = v6;
  *(_WORD *)(a1 + 32) = v3;
  *(_BYTE *)(a1 + 34) = v4;
  return result;
}

id *sub_100017C18(id *a1)
{
  id v2;

  v2 = *a1;
  return a1;
}

uint64_t sub_100017C40(uint64_t a1)
{
  sub_100014750(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  return a1;
}

double sub_100017C6C(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  os_log_type_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v15;
  double v16;

  v4 = type metadata accessor for EnvironmentValues(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return *(double *)&a1;
  v8 = swift_retain(a1);
  v9 = static os_log_type_t.fault.getter(v8);
  v10 = static Log.runtimeIssuesLog.getter();
  v11 = v9;
  if (os_log_type_enabled(v10, v9))
  {
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v13 = swift_slowAlloc(32, -1);
    v16 = *(double *)&v13;
    *(_DWORD *)v12 = 136315138;
    v15 = sub_1000127E8(0x74616F6C464743, 0xE700000000000000, (uint64_t *)&v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v12 + 4, v12 + 12);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v12, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath(&v16, v7, a1);
  sub_1000147D8(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v16;
}

uint64_t sub_100017E30@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1000171A8(a1, v2 + 16, a2);
}

unint64_t sub_100017E38()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002DE00;
  if (!qword_10002DE00)
  {
    v1 = sub_10000721C(&qword_10002DDF0);
    sub_1000074EC(&qword_10002DE08, &qword_10002DE10, (uint64_t)&protocol conformance descriptor for ZStack<A>);
    sub_10001807C(&qword_10002DE18, &qword_10002DE20, (void (*)(void))sub_100017EDC);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002DE00);
  }
  return result;
}

unint64_t sub_100017EDC()
{
  unint64_t result;

  result = qword_10002DE28;
  if (!qword_10002DE28)
  {
    result = swift_getWitnessTable(&unk_100020808, &type metadata for PhotoDetailView.LoadingView);
    atomic_store(result, (unint64_t *)&qword_10002DE28);
  }
  return result;
}

void sub_100017F24(__n128 a1)
{
  uint64_t v1;

  sub_100016940(v1 + 16, a1);
}

uint64_t sub_100017F2C()
{
  uint64_t v0;

  return swift_retain(v0);
}

void sub_100017F38(void *a1, uint64_t a2, __n128 a3)
{
  uint64_t v3;

  sub_100016BD4(a1, a2, v3 + 16, a3);
}

uint64_t sub_100017F40(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100017F50(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

id *sub_100017F58(id *a1)
{

  return a1;
}

uint64_t sub_100017F80(uint64_t a1)
{
  sub_1000147D8(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
  return a1;
}

uint64_t sub_100017FAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for GeometryProxy(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 65) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;

  swift_release(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 48));
  sub_1000147D8(*(_QWORD *)(v0 + 56), *(_BYTE *)(v0 + 64));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_10001804C()
{
  uint64_t v0;

  type metadata accessor for GeometryProxy(0);
  sub_100017750(v0 + 16);
}

uint64_t sub_10001807C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10000721C(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1000180E4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002DE60;
  if (!qword_10002DE60)
  {
    v1 = sub_10000721C(&qword_10002DE48);
    sub_100018148();
    result = swift_getWitnessTable(&protocol conformance descriptor for <A> Group<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10002DE60);
  }
  return result;
}

unint64_t sub_100018148()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002DE68;
  if (!qword_10002DE68)
  {
    v1 = sub_10000721C(&qword_10002DE70);
    sub_1000181B4();
    sub_100017EDC();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002DE68);
  }
  return result;
}

unint64_t sub_1000181B4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002DE78;
  if (!qword_10002DE78)
  {
    v1 = sub_10000721C(&qword_10002DE80);
    sub_100018238();
    sub_100006E5C((unint64_t *)&qword_10002D4A8, (uint64_t (*)(uint64_t))&type metadata accessor for AccessibilityAttachmentModifier, (uint64_t)&protocol conformance descriptor for AccessibilityAttachmentModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002DE78);
  }
  return result;
}

unint64_t sub_100018238()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002DE88;
  if (!qword_10002DE88)
  {
    v1 = sub_10000721C(&qword_10002DE90);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002DE88);
  }
  return result;
}

uint64_t sub_1000182A0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 48));
  sub_1000147D8(*(_QWORD *)(v0 + 56), *(_BYTE *)(v0 + 64));
  return swift_deallocObject(v0, 65, 7);
}

uint64_t sub_1000182F0(void *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1000179E0(a1, a2, v2 + 16);
}

ValueMetadata *type metadata accessor for PhotoDetailView.LoadingView()
{
  return &type metadata for PhotoDetailView.LoadingView;
}

uint64_t sub_100018308(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_allocateGenericValueMetadata(a1, a2, a3, 24);
}

_QWORD *sub_100018310(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain(v3);
  return a1;
}

uint64_t sub_10001833C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 8));
}

_QWORD *sub_100018344(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  v4 = a1[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain(v3);
  swift_release(v4);
  return a1;
}

uint64_t sub_10001837C(uint64_t a1, _OWORD *a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *a2;
  swift_release(v3);
  return a1;
}

uint64_t sub_1000183AC(uint64_t *a1, int a2)
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

uint64_t sub_1000183F4(uint64_t result, int a2, int a3)
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

uint64_t type metadata accessor for PhotoViewHost(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000186CC(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PhotoViewHost);
}

uint64_t sub_10001843C()
{
  _QWORD v1[4];

  v1[0] = sub_10000721C(&qword_10002DDE0);
  v1[1] = &type metadata for Image;
  v1[2] = sub_1000074EC(&qword_10002DDE8, &qword_10002DDE0, (uint64_t)&unk_100020858);
  v1[3] = &protocol witness table for Image;
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of View.navigationTitle<A>(_:icon:)>>, 1);
}

uint64_t sub_1000184B4(uint64_t a1)
{
  return swift_getWitnessTable(&unk_100020858, a1);
}

uint64_t sub_1000184C4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100021EF8, 1);
}

unint64_t sub_1000184D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002DF30;
  if (!qword_10002DF30)
  {
    v1 = sub_10000721C(&qword_10002DF28);
    sub_1000074EC(&qword_10002DF38, &qword_10002DDA0, (uint64_t)&protocol conformance descriptor for ProgressView<A, B>);
    sub_1000074EC(&qword_10002D490, &qword_10002D498, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002DF30);
  }
  return result;
}

uint64_t sub_100018570@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.tintColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100018598(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.tintColor.setter(v1);
}

uint64_t sub_1000185C0(void (*a1)(void))
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  __chkstk_darwin();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for _UIHostingView(0, v4, v5);
  a1();
  return _UIHostingView.__allocating_init(rootView:)(v3);
}

uint64_t sub_100018640()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  void (*v3)(uint64_t);
  uint64_t v5;

  v0 = __chkstk_darwin();
  v2 = (char *)&v5 - v1;
  v3(v0);
  return dispatch thunk of _UIHostingView.rootView.setter(v2);
}

uint64_t sub_1000186CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

uint64_t sub_1000186F8()
{
  return sub_1000074EC(&qword_10002DF40, &qword_10002DF48, (uint64_t)&protocol conformance descriptor for Label<A, B>);
}

uint64_t sub_100018734()
{
  uint64_t v0;

  v0 = type metadata accessor for Logger(0);
  sub_1000135CC(v0, qword_10002FBA0);
  sub_10000CFD8(v0, (uint64_t)qword_10002FBA0);
  return Logger.init(subsystem:category:)(0xD000000000000017, 0x8000000100021510, 0x5079746972616C43, 0xEF4955736F746F68);
}

uint64_t sub_1000187B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  __n128 v5;
  uint64_t v6;
  uint64_t v8;

  v0 = type metadata accessor for Logger(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for OSSignposter(0);
  sub_1000135CC(v4, qword_10002FBB8);
  sub_10000CFD8(v4, (uint64_t)qword_10002FBB8);
  if (qword_10002DB90 != -1)
    swift_once(&qword_10002DB90, sub_100018734, v5);
  v6 = sub_10000CFD8(v0, (uint64_t)qword_10002FBA0);
  (*(void (**)(char *, uint64_t, uint64_t))(v1 + 16))(v3, v6, v0);
  return OSSignposter.init(logger:)(v3);
}

ValueMetadata *type metadata accessor for PhotoCollection()
{
  return &type metadata for PhotoCollection;
}

uint64_t sub_1000188AC()
{
  return sub_1000074EC(&qword_10002DF50, &qword_10002DF58, (uint64_t)&protocol conformance descriptor for IndexingIterator<A>);
}

id sub_1000188E0(int64_t a1, uint64_t a2, int64_t a3, id a4)
{
  id result;
  uint64_t v9;
  int64_t v10;
  BOOL v11;

  result = objc_msgSend(a4, "count");
  if (a1 < 0 || (uint64_t)result < a1)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  result = objc_msgSend(a4, "count");
  if (a3 < 0 || (uint64_t)result < a3)
    goto LABEL_17;
  v9 = a3 - a1;
  if (a2 >= 1)
  {
    if (v9 < 0 || v9 >= a2)
      goto LABEL_12;
    return 0;
  }
  if (v9 <= 0 && v9 > a2)
    return 0;
LABEL_12:
  v11 = __OFADD__(a1, a2);
  v10 = a1 + a2;
  if (v11)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  result = objc_msgSend(a4, "count");
  if ((v10 & 0x8000000000000000) == 0 && (uint64_t)result >= v10)
    return (id)v10;
LABEL_19:
  __break(1u);
  return result;
}

_QWORD *sub_1000189C0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  if (__OFSUB__(*result, 1))
    __break(1u);
  else
    *a2 = *result - 1;
  return result;
}

_QWORD *sub_1000189D8(_QWORD *result)
{
  if (__OFSUB__(*result, 1))
    __break(1u);
  else
    --*result;
  return result;
}

void sub_1000189F0(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

id sub_1000189F8@<X0>(_QWORD *a1@<X8>)
{
  id *v1;
  id result;

  result = objc_msgSend(*v1, "count");
  *a1 = result;
  return result;
}

void (*sub_100018A28(_QWORD *a1, _QWORD *a2))(uint64_t a1)
{
  id *v2;
  id v4;

  v4 = objc_msgSend(*v2, "objectAtIndexedSubscript:", *a2);
  *a1 = v4;
  a1[1] = v4;
  return destroy for CameraVideoView;
}

uint64_t sub_100018A70@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  id *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  id v7;

  v5 = *a1;
  v4 = a1[1];
  v7 = *v2;
  result = (uint64_t)objc_msgSend(*v2, "count");
  if (result < 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v5 < 0)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (result >= v4)
  {
    *a2 = v5;
    a2[1] = v4;
    a2[2] = v7;
    return (uint64_t)v7;
  }
LABEL_7:
  __break(1u);
  return result;
}

unint64_t sub_100018ADC@<X0>(_QWORD *a1@<X8>)
{
  id *v1;
  unint64_t result;

  result = (unint64_t)objc_msgSend(*v1, "count");
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    *a1 = 0;
    a1[1] = result;
  }
  return result;
}

BOOL sub_100018B14()
{
  id *v0;

  return objc_msgSend(*v0, "count") == 0;
}

void sub_100018B40(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

_QWORD *sub_100018B50@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  id *v3;
  uint64_t v5;

  v5 = *result + a2;
  if (__OFADD__(*result, a2))
  {
    __break(1u);
  }
  else
  {
    result = objc_msgSend(*v3, "count");
    if ((v5 & 0x8000000000000000) == 0 && (uint64_t)result >= v5)
    {
      *a3 = v5;
      return result;
    }
  }
  __break(1u);
  return result;
}

id sub_100018BA8@<X0>(int64_t *a1@<X0>, uint64_t a2@<X1>, int64_t *a3@<X2>, uint64_t a4@<X8>)
{
  id *v4;
  id result;
  char v7;

  result = sub_1000188E0(*a1, a2, *a3, *v4);
  *(_QWORD *)a4 = result;
  *(_BYTE *)(a4 + 8) = v7 & 1;
  return result;
}

id sub_100018BE0(uint64_t *a1, uint64_t *a2)
{
  id *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id result;

  v3 = *a1;
  v4 = *a2;
  v5 = *v2;
  result = objc_msgSend(*v2, "count");
  if (v3 < 0 || (uint64_t)result < v3)
  {
    __break(1u);
  }
  else
  {
    result = objc_msgSend(v5, "count");
    if ((v4 & 0x8000000000000000) == 0 && (uint64_t)result >= v4)
      return (id)(v4 - v3);
  }
  __break(1u);
  return result;
}

uint64_t *sub_100018C4C(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  BOOL v5;

  v2 = *result;
  v3 = a2[1];
  if (*result >= *a2)
  {
    v5 = __OFSUB__(v2, v3);
    v4 = v2 - v3 < 0;
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  if (v4 == v5)
    __break(1u);
  return result;
}

_QWORD *sub_100018C68(_QWORD *result, _QWORD *a2)
{
  if (*result < *a2 || a2[1] < *result)
    __break(1u);
  return result;
}

_QWORD *sub_100018C84(_QWORD *result, _QWORD *a2)
{
  if (*result < *a2 || a2[1] < result[1])
    __break(1u);
  return result;
}

_QWORD *sub_100018CA0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  if (__OFADD__(*result, 1))
    __break(1u);
  else
    *a2 = *result + 1;
  return result;
}

_QWORD *sub_100018CB8(_QWORD *result)
{
  if (__OFADD__(*result, 1))
    __break(1u);
  else
    ++*result;
  return result;
}

void sub_100018CD0(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = 0;
}

int64_t sub_100018CDC()
{
  void **v0;
  void *v1;
  int64_t v2;
  int64_t result;

  v1 = *v0;
  v2 = (int64_t)objc_msgSend(v1, "count");
  result = (int64_t)objc_msgSend(v1, "count");
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    result = (int64_t)objc_msgSend(v1, "count");
    if ((v2 & 0x8000000000000000) == 0 && result >= v2)
      return v2;
  }
  __break(1u);
  return result;
}

uint64_t sub_100018D48()
{
  return 2;
}

uint64_t sub_100018D50()
{
  void **v0;
  void *v1;
  uint64_t v2;

  v1 = *v0;
  v2 = sub_1000191C0(*v0);

  return v2;
}

_QWORD *sub_100018D80(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  id *v3;

  return sub_100018D88(a1, a2, a3, *v3);
}

_QWORD *sub_100018D88(_QWORD *result, _QWORD *a2, uint64_t a3, id a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v8;

  v5 = result;
  if (!a2)
  {
LABEL_10:
    v6 = 0;
    goto LABEL_11;
  }
  v6 = a3;
  if (!a3)
  {
LABEL_11:
    *v5 = a4;
    v5[1] = v6;
    return (_QWORD *)v6;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (objc_msgSend(a4, "count"))
    {
      *a2 = objc_msgSend(a4, "objectAtIndexedSubscript:", 0);
      if (v6 != 1)
      {
        v8 = 1;
        while ((id)v8 != objc_msgSend(a4, "count"))
        {
          a2[v8] = objc_msgSend(a4, "objectAtIndexedSubscript:", v8);
          if (v6 == ++v8)
            goto LABEL_11;
        }
        v6 = v8;
      }
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100018E70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return Sequence.withContiguousStorageIfAvailable<A>(_:)(a1, a2, a4, a3);
}

unint64_t sub_100018E94()
{
  unint64_t result;

  result = qword_10002DF60;
  if (!qword_10002DF60)
  {
    result = swift_getWitnessTable(&unk_1000208E8, &type metadata for PhotoCollection);
    atomic_store(result, (unint64_t *)&qword_10002DF60);
  }
  return result;
}

void *sub_100018ED8()
{
  return &protocol witness table for Int;
}

uint64_t sub_100018EE4()
{
  return sub_10001907C(&qword_10002DF68, (uint64_t)&protocol conformance descriptor for <> Range<A>);
}

unint64_t sub_100018F08()
{
  unint64_t result;

  result = qword_10002DF78;
  if (!qword_10002DF78)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_10002DF78);
  }
  return result;
}

uint64_t sub_100018F4C()
{
  return sub_1000074EC(&qword_10002DF80, &qword_10002DF88, (uint64_t)&protocol conformance descriptor for Slice<A>);
}

unint64_t sub_100018F7C()
{
  unint64_t result;

  result = qword_10002DF90;
  if (!qword_10002DF90)
  {
    result = swift_getWitnessTable(&unk_100020950, &type metadata for PhotoCollection);
    atomic_store(result, (unint64_t *)&qword_10002DF90);
  }
  return result;
}

uint64_t sub_100018FC0()
{
  return sub_10001907C(&qword_10002DF98, (uint64_t)&protocol conformance descriptor for <> Range<A>);
}

uint64_t sub_100018FE4()
{
  return sub_100019114(&qword_10002DFA0, (void (*)(void))sub_100019010, (uint64_t)&protocol conformance descriptor for <> Slice<A>);
}

unint64_t sub_100019010()
{
  unint64_t result;

  result = qword_10002DFA8;
  if (!qword_10002DFA8)
  {
    result = swift_getWitnessTable(&unk_100020A30, &type metadata for PhotoCollection);
    atomic_store(result, (unint64_t *)&qword_10002DFA8);
  }
  return result;
}

uint64_t sub_100019058()
{
  return sub_10001907C(&qword_10002DFB0, (uint64_t)&protocol conformance descriptor for <> Range<A>);
}

uint64_t sub_10001907C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_10000721C(&qword_10002DF70);
    sub_100018F08();
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000190E8()
{
  return sub_100019114(&qword_10002DFB8, (void (*)(void))sub_10001917C, (uint64_t)&protocol conformance descriptor for <> Slice<A>);
}

uint64_t sub_100019114(unint64_t *a1, void (*a2)(void), uint64_t a3)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = sub_10000721C(&qword_10002DF88);
    a2();
    result = swift_getWitnessTable(a3, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10001917C()
{
  unint64_t result;

  result = qword_10002DFC0;
  if (!qword_10002DFC0)
  {
    result = swift_getWitnessTable(&unk_100020A90, &type metadata for PhotoCollection);
    atomic_store(result, (unint64_t *)&qword_10002DFC0);
  }
  return result;
}

uint64_t sub_1000191C0(void *a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  _QWORD *v5;
  int64_t v6;
  uint64_t v7;
  _QWORD *v8;
  id v9[2];

  v2 = (uint64_t)objc_msgSend(a1, "count");
  result = (uint64_t)objc_msgSend(a1, "count");
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    result = (uint64_t)objc_msgSend(a1, "count");
    if ((v2 & 0x8000000000000000) == 0 && result >= v2)
    {
      if (v2)
      {
        v4 = sub_1000071DC(&qword_10002DFC8);
        v5 = (_QWORD *)swift_allocObject(v4, 8 * v2 + 32, 7);
        v6 = j__malloc_size(v5);
        v7 = v6 - 32;
        if (v6 < 32)
          v7 = v6 - 25;
        v5[2] = v2;
        v5[3] = 2 * (v7 >> 3);
        v8 = sub_100018D88(v9, v5 + 4, v2, a1);

        if (v8 == (_QWORD *)v2)
          return (uint64_t)v5;
        __break(1u);
      }
      return (uint64_t)&_swiftEmptyArrayStorage;
    }
  }
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for PhotoView()
{
  return &type metadata for PhotoView;
}

uint64_t sub_1000192C0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_100021F58, 1);
}

uint64_t sub_1000192D0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t OpaqueTypeConformance2;
  unint64_t v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD v46[2];
  __int128 v47;

  v45 = a2;
  v3 = type metadata accessor for AccessibilityChildBehavior(0);
  v43 = *(_QWORD *)(v3 - 8);
  v44 = v3;
  __chkstk_darwin(v3);
  v5 = (char *)&v42 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for PhotoViewInternal(0);
  __chkstk_darwin(v6);
  v8 = (char *)&v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1000071DC(&qword_10002DFD0);
  __chkstk_darwin(v9);
  v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1000071DC(&qword_10002DFD8);
  v42 = *(_QWORD *)(v12 - 8);
  __chkstk_darwin(v12);
  v14 = (char *)&v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46[0] = 0;
  v15 = a1;
  v16 = sub_1000071DC(&qword_10002DDC0);
  State.init(wrappedValue:)(&v47, v46, v16);
  *((_OWORD *)v8 + 1) = v47;
  LODWORD(v46[0]) = 0;
  BYTE4(v46[0]) = 1;
  v17 = sub_1000071DC(&qword_10002DFE0);
  State.init(wrappedValue:)(&v47, v46, v17);
  v18 = BYTE4(v47);
  v19 = *((_QWORD *)&v47 + 1);
  *((_DWORD *)v8 + 8) = v47;
  v8[36] = v18;
  *((_QWORD *)v8 + 5) = v19;
  *((_QWORD *)v8 + 6) = swift_getKeyPath(&unk_100020B40);
  v8[56] = 0;
  v20 = &v8[*(int *)(v6 + 36)];
  v21 = &v20[*(int *)(type metadata accessor for RoundedRectangle(0) + 20)];
  v22 = enum case for RoundedCornerStyle.continuous(_:);
  v23 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 104))(v21, v22, v23);
  __asm { FMOV            V0.2D, #10.0 }
  *(_OWORD *)v20 = _Q0;
  *(_QWORD *)v8 = v15;
  v8[8] = 0;
  v29 = objc_msgSend(v15, "localIdentifier");
  v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(v29);
  v32 = v31;

  sub_100019674((uint64_t)v8, (uint64_t)v11);
  v33 = (uint64_t *)&v11[*(int *)(v9 + 52)];
  *v33 = v30;
  v33[1] = v32;
  v34 = sub_1000196B8((uint64_t)v8);
  static AccessibilityChildBehavior.ignore.getter(v34);
  v35 = sub_1000196F4();
  View.accessibilityElement(children:)(v5, v9, v35);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v5, v44);
  sub_100019740((uint64_t)v11);
  v36 = sub_10001985C(v15);
  v38 = v37;
  *(_QWORD *)&v47 = v36;
  *((_QWORD *)&v47 + 1) = v37;
  v46[0] = v9;
  v46[1] = v35;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v46, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
  v40 = sub_100019780();
  View.accessibilityLabel<A>(_:)(&v47, v12, &type metadata for String, OpaqueTypeConformance2, v40);
  swift_bridgeObjectRelease(v38);
  return (*(uint64_t (**)(char *, uint64_t))(v42 + 8))(v14, v12);
}

uint64_t sub_1000195D4@<X0>(uint64_t a1@<X8>)
{
  void **v1;

  return sub_1000192D0(*v1, a1);
}

void sub_1000195DC(double *a1@<X8>)
{
  *a1 = EnvironmentValues.displayScale.getter();
}

void sub_100019604(double *a1@<X8>)
{
  *a1 = EnvironmentValues.displayScale.getter();
}

uint64_t sub_10001962C(double *a1)
{
  return EnvironmentValues.displayScale.setter(*a1);
}

uint64_t sub_100019650(double *a1)
{
  return EnvironmentValues.displayScale.setter(*a1);
}

uint64_t sub_100019674(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PhotoViewInternal(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000196B8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PhotoViewInternal(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000196F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002DFE8;
  if (!qword_10002DFE8)
  {
    v1 = sub_10000721C(&qword_10002DFD0);
    result = swift_getWitnessTable(&protocol conformance descriptor for IDView<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002DFE8);
  }
  return result;
}

uint64_t sub_100019740(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000071DC(&qword_10002DFD0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100019780()
{
  unint64_t result;

  result = qword_10002DFF0;
  if (!qword_10002DFF0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10002DFF0);
  }
  return result;
}

unint64_t sub_1000197C8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_10002DFF8;
  if (!qword_10002DFF8)
  {
    v1 = sub_10000721C(&qword_10002E000);
    v2[0] = sub_10000721C(&qword_10002DFD0);
    v2[1] = sub_1000196F4();
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.accessibilityElement(children:)>>, 1);
    sub_1000116F4();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002DFF8);
  }
  return result;
}

uint64_t sub_10001985C(void *a1)
{
  Swift::String v2;
  Swift::String v3;
  void *object;
  uint64_t v6;

  v6 = sub_1000198B8(a1);
  v2._countAndFlagsBits = 8236;
  v2._object = (void *)0xE200000000000000;
  String.append(_:)(v2);
  v3._countAndFlagsBits = sub_1000199C8(a1);
  object = v3._object;
  String.append(_:)(v3);
  swift_bridgeObjectRelease(object);
  return v6;
}

uint64_t sub_1000198B8(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  Swift::String v4;
  Swift::String v5;
  unint64_t v6;
  uint64_t countAndFlagsBits;
  unint64_t v9;

  v1 = objc_msgSend(a1, "mediaType");
  if (v1 == (id)2)
  {
    v2 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v9 = 0x8000000100021630;
    v3 = 1162103126;
  }
  else
  {
    if (v1 != (id)1)
      return 0;
    v2 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v9 = 0x8000000100021630;
    v3 = 1414482000;
  }
  v4._countAndFlagsBits = v3 & 0xFFFF0000FFFFFFFFLL | 0x4F00000000;
  v4._object = (void *)0xE500000000000000;
  v5._countAndFlagsBits = 0;
  v5._object = (void *)0xE000000000000000;
  v6 = 0xD00000000000001ELL;
  countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v4, (Swift::String_optional)0, (NSBundle)v2, v5, *(Swift::String *)(&v9 - 1))._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_1000199C8(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __n128 v16;
  void *v17;
  Class isa;
  id v19;
  uint64_t v21;

  v2 = sub_1000071DC(&qword_10002E008);
  v3 = __chkstk_darwin(v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v21 - v6;
  v8 = type metadata accessor for Date(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = objc_msgSend(a1, "creationDate");
  if (v12)
  {
    v13 = v12;
    static Date._unconditionallyBridgeFromObjectiveC(_:)();

    v14 = 0;
  }
  else
  {
    v14 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5, v14, 1, v8);
  sub_100019BA8((uint64_t)v5, (uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_100019BF0((uint64_t)v7);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    if (qword_10002DBA0 != -1)
      swift_once(&qword_10002DBA0, sub_100019D9C, v16);
    v17 = (void *)qword_10002FBD0;
    isa = Date._bridgeToObjectiveC()().super.isa;
    v19 = objc_msgSend(v17, "stringFromDate:", isa);

    v15 = static String._unconditionallyBridgeFromObjectiveC(_:)(v19);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
  return v15;
}

uint64_t sub_100019BA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1000071DC(&qword_10002E008);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100019BF0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000071DC(&qword_10002E008);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100019C30(uint64_t *a1@<X8>)
{
  id *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_msgSend(*v1, "localIdentifier");
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
  v6 = v5;

  *a1 = v4;
  a1[1] = v6;
}

Swift::Int sub_100019C84()
{
  void **v0;
  void *v1;
  id v2;
  _QWORD v4[9];

  v1 = *v0;
  Hasher.init(_seed:)(v4, 0);
  v2 = v1;
  NSObject.hash(into:)(v4);

  return Hasher._finalize()();
}

void sub_100019CD0(uint64_t a1)
{
  id *v1;
  id v3;

  v3 = *v1;
  NSObject.hash(into:)(a1);

}

Swift::Int sub_100019D14(uint64_t a1)
{
  void **v1;
  void *v2;
  id v3;
  _QWORD v5[9];

  v2 = *v1;
  Hasher.init(_seed:)(v5, a1);
  v3 = v2;
  NSObject.hash(into:)(v5);

  return Hasher._finalize()();
}

uint64_t sub_100019D5C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a1;
  v3 = *a2;
  sub_100019E64();
  return static NSObject.== infix(_:_:)(v2, v3) & 1;
}

void sub_100019D9C()
{
  id v0;
  NSString v1;

  v0 = objc_msgSend(objc_allocWithZone((Class)NSDateFormatter), "init");
  v1 = String._bridgeToObjectiveC()();
  objc_msgSend(v0, "setDateFormat:", v1);

  qword_10002FBD0 = (uint64_t)v0;
}

ValueMetadata *type metadata accessor for Photo()
{
  return &type metadata for Photo;
}

unint64_t sub_100019E20()
{
  unint64_t result;

  result = qword_10002E010;
  if (!qword_10002E010)
  {
    result = swift_getWitnessTable(&unk_100020B78, &type metadata for Photo);
    atomic_store(result, (unint64_t *)&qword_10002E010);
  }
  return result;
}

unint64_t sub_100019E64()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002E018;
  if (!qword_10002E018)
  {
    v1 = objc_opt_self(NSObject);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10002E018);
  }
  return result;
}

uint64_t sub_100019EA0()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for PlayerViewModel()
{
  return objc_opt_self(_TtC15ClarityPhotosUI15PlayerViewModel);
}

uint64_t sub_100019EE4@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  result = ObservableObject<>.objectWillChange.getter(*v1);
  *a1 = result;
  return result;
}

void sub_100019F0C(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_100019F58(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_100019FEC + 4 * byte_100020C75[a2]))(0x6D61436F746F6870);
}

uint64_t sub_100019FEC(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x6D61436F746F6870 && v1 == 0xEB00000000617265)
    v2 = 1;
  else
    v2 = _stringCompareWithSmolCheck(_:_:expecting:)(a1, v1, 0x6D61436F746F6870, 0xEB00000000617265, 0);
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(0xEB00000000617265);
  return v2 & 1;
}

uint64_t NavigationStage.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_10001A0F8 + 4 * byte_100020C7A[a1]))(0xD000000000000011, 0x80000001000215B0);
}

uint64_t sub_10001A0F8()
{
  return 0x6D61436F746F6870;
}

uint64_t sub_10001A124()
{
  return 0x61436569666C6573;
}

uint64_t sub_10001A144()
{
  return 0x62694C6F746F6870;
}

void sub_10001A164(char *a1)
{
  sub_100019F0C(*a1);
}

unint64_t sub_10001A170@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = _s15ClarityPhotosUI15NavigationStageO8rawValueACSgSS_tcfC_0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_10001A19C@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = NavigationStage.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void sub_10001A1C4()
{
  char *v0;

  sub_10001A1CC(*v0);
}

void sub_10001A1CC(char a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, 0);
  __asm { BR              X10 }
}

Swift::Int sub_10001A220()
{
  uint64_t v1;

  String.hash(into:)(&v1, 0x6D61436F746F6870, 0xEB00000000617265);
  swift_bridgeObjectRelease(0xEB00000000617265);
  return Hasher._finalize()();
}

void sub_10001A2B4(uint64_t a1)
{
  char *v1;

  sub_10001A2BC(a1, *v1);
}

void sub_10001A2BC(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_10001A300(uint64_t a1)
{
  String.hash(into:)(a1, 0x6D61436F746F6870, 0xEB00000000617265);
  return swift_bridgeObjectRelease(0xEB00000000617265);
}

void sub_10001A380(uint64_t a1)
{
  char *v1;

  sub_10001A388(a1, *v1);
}

void sub_10001A388(uint64_t a1, char a2)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, a1);
  __asm { BR              X10 }
}

Swift::Int sub_10001A3D8()
{
  uint64_t v1;

  String.hash(into:)(&v1, 0x6D61436F746F6870, 0xEB00000000617265);
  swift_bridgeObjectRelease(0xEB00000000617265);
  return Hasher._finalize()();
}

unint64_t _s15ClarityPhotosUI15NavigationStageO8rawValueACSgSS_tcfC_0(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10002A0A8, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 5)
    return 5;
  else
    return v3;
}

unint64_t sub_10001A4B8()
{
  unint64_t result;

  result = qword_10002E0C8;
  if (!qword_10002E0C8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for NavigationStage, &type metadata for NavigationStage);
    atomic_store(result, (unint64_t *)&qword_10002E0C8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for NavigationStage(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for NavigationStage(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10001A5D8 + 4 * byte_100020C93[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_10001A60C + 4 * byte_100020C8E[v4]))();
}

uint64_t sub_10001A60C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001A614(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10001A61CLL);
  return result;
}

uint64_t sub_10001A628(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10001A630);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_10001A634(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10001A63C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for NavigationStage()
{
  return &type metadata for NavigationStage;
}

id (*variable initialization expression of PhotoLibraryView._photoLibrary())()
{
  return sub_10001A670;
}

id sub_10001A670()
{
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PhotoLibrary(0)), "init");
}

id PhotoLibraryView.body.getter@<X0>(uint64_t a1@<X0>, void *a2@<X1>, __int16 a3@<W2>, _QWORD *a4@<X8>)
{
  uint64_t v8;

  v8 = swift_allocObject(&unk_10002AB78, 34, 7);
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  *(_BYTE *)(v8 + 32) = a3 & 1;
  *(_BYTE *)(v8 + 33) = HIBYTE(a3) & 1;
  *a4 = sub_10001ABFC;
  a4[1] = v8;
  return sub_100007A78(a1, a2, a3 & 1);
}

uint64_t sub_10001A700@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, __int16 a4@<W3>, uint64_t a5@<X8>)
{
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
  double v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t OpaqueTypeConformance2;
  uint64_t v38;
  unsigned int v39;
  unsigned int v40;
  uint64_t v41;
  int v42;
  int v43;
  __n128 v44;
  double v45;
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
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  char *v65;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char v79[16];
  uint64_t v80;
  uint64_t v81;
  __int16 v82;
  uint64_t v83;
  _QWORD v84[3];

  v67 = a1;
  v78 = a5;
  v70 = type metadata accessor for ScrollAnchorRole(0);
  v69 = *(_QWORD *)(v70 - 8);
  __chkstk_darwin(v70);
  v9 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1000071DC(&qword_10002E0E8);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v67 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1000071DC(&qword_10002E0F0);
  v68 = *(_QWORD *)(v14 - 8);
  __chkstk_darwin(v14);
  v16 = (char *)&v67 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_1000071DC(&qword_10002E0F8);
  v72 = *(_QWORD *)(v17 - 8);
  v73 = v17;
  __chkstk_darwin(v17);
  v19 = (char *)&v67 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = sub_1000071DC(&qword_10002E100);
  __chkstk_darwin(v75);
  v71 = (char *)&v67 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_1000071DC(&qword_10002E108);
  v76 = *(_QWORD *)(v21 - 8);
  v77 = v21;
  v22 = __chkstk_darwin(v21);
  v74 = (char *)&v67 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = a2;
  v81 = a3;
  v82 = a4 & 0x101;
  v83 = v67;
  v24 = static Axis.Set.vertical.getter(v22);
  v25 = sub_1000071DC(&qword_10002E110);
  v26 = sub_1000074EC(&qword_10002E118, &qword_10002E110, (uint64_t)&protocol conformance descriptor for LazyVGrid<A>);
  v27 = ScrollView.init(_:showsIndicators:content:)(v24, 0, sub_10001B690, v79, v25, v26);
  v28 = static UnitPoint.bottom.getter(v27);
  v30 = v29;
  v31 = sub_1000074EC(&qword_10002E120, &qword_10002E0E8, (uint64_t)&protocol conformance descriptor for ScrollView<A>);
  View.defaultScrollAnchor(_:)(*(_QWORD *)&v28, v30, 0, v10, v31);
  v32 = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v33 = static UnitPoint.top.getter(v32);
  v35 = v34;
  static ScrollAnchorRole.alignment.getter();
  v84[0] = v10;
  v84[1] = v31;
  v36 = v19;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v84, &opaque type descriptor for <<opaque return type of View.defaultScrollAnchor(_:)>>, 1);
  View.defaultScrollAnchor(_:for:)(*(_QWORD *)&v33, v35, 0, v9, v14, OpaqueTypeConformance2);
  (*(void (**)(char *, uint64_t))(v69 + 8))(v9, v70);
  v38 = (*(uint64_t (**)(char *, uint64_t))(v68 + 8))(v16, v14);
  v39 = static Edge.Set.leading.getter(v38);
  v40 = static Edge.Set.trailing.getter();
  v41 = Edge.Set.init(rawValue:)(0);
  v42 = Edge.Set.init(rawValue:)(v41);
  if (Edge.Set.init(rawValue:)(v42 & v39) != v39)
    v41 = Edge.Set.init(rawValue:)(v41 | v39);
  v43 = Edge.Set.init(rawValue:)(v41);
  if (Edge.Set.init(rawValue:)(v43 & v40) != v40)
    LOBYTE(v41) = Edge.Set.init(rawValue:)(v41 | v40);
  if (qword_10002DBA8 != -1)
    swift_once(&qword_10002DBA8, sub_10001B3B0, v44);
  v45 = EdgeInsets.init(_all:)(*(double *)&qword_10002E0D0);
  v47 = v46;
  v49 = v48;
  v51 = v50;
  v52 = (uint64_t)v71;
  v53 = v72;
  v54 = v73;
  (*(void (**)(char *, char *, uint64_t))(v72 + 16))(v71, v36, v73);
  v55 = v75;
  v56 = v52 + *(int *)(v75 + 36);
  *(_BYTE *)v56 = v41;
  *(double *)(v56 + 8) = v45;
  *(_QWORD *)(v56 + 16) = v47;
  *(_QWORD *)(v56 + 24) = v49;
  *(_QWORD *)(v56 + 32) = v51;
  *(_BYTE *)(v56 + 40) = 0;
  (*(void (**)(char *, uint64_t))(v53 + 8))(v36, v54);
  v57 = LocalizedStringKey.init(stringLiteral:)(0x534F544F4850, 0xE600000000000000);
  v59 = v58;
  LOBYTE(v54) = v60;
  v62 = v61;
  v63 = Image.init(systemName:)(0x69662E6F746F6870, 0xEA00000000006C6CLL);
  v84[0] = v63;
  v64 = sub_10001B6BC();
  v65 = v74;
  View.navigationTitle<A>(_:icon:)(v57, v59, v54 & 1, v62, v84, v55, &type metadata for Image, v64, &protocol witness table for Image);
  swift_release(v63);
  swift_bridgeObjectRelease(v62);
  swift_bridgeObjectRelease(v59);
  sub_10001B798(v52);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v76 + 32))(v78, v65, v77);
}

uint64_t sub_10001AC00@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int16 a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  double v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE v34[16];
  uint64_t v35;
  uint64_t v36;
  __int16 v37;
  int v38;

  v30 = a1;
  v31 = a2;
  v33 = a4;
  v5 = type metadata accessor for PinnedScrollableViews(0);
  __chkstk_darwin(v5);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for GridItem.Size(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (_OWORD *)((char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = type metadata accessor for GridItem(0);
  __chkstk_darwin(v12);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = sub_1000071DC(&qword_10002E110);
  v29 = *(_QWORD *)(v32 - 8);
  v15 = __chkstk_darwin(v32);
  v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = GeometryProxy.size.getter(v15);
  v19 = 3;
  if (v20 < v18)
    v19 = 4;
  if ((a3 & 0x100) != 0)
    v21 = v19;
  else
    v21 = 2;
  *v11 = xmmword_100020D50;
  (*(void (**)(_OWORD *, _QWORD, uint64_t))(v9 + 104))(v11, enum case for GridItem.Size.flexible(_:), v8);
  GridItem.init(_:spacing:alignment:)(v11, 0, 1, 0, 0, 1);
  v22 = sub_10001B280((uint64_t)v14, v21);
  v35 = v30;
  v36 = v31;
  v37 = a3 & 0x101;
  v23 = static HorizontalAlignment.center.getter();
  v38 = 0;
  v24 = sub_100006E5C(&qword_10002E130, (uint64_t (*)(uint64_t))&type metadata accessor for PinnedScrollableViews, (uint64_t)&protocol conformance descriptor for PinnedScrollableViews);
  dispatch thunk of OptionSet.init(rawValue:)(&v38, v5, v24);
  v25 = sub_1000071DC(&qword_10002E138);
  v26 = sub_10001B800();
  LazyVGrid.init(columns:alignment:spacing:pinnedViews:content:)(v22, v23, 0, 1, v7, sub_10001B7D8, v34, v25, v26);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v29 + 32))(v33, v17, v32);
}

uint64_t sub_10001AE6C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t KeyPath;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t OpaqueTypeConformance2;
  unint64_t v18;
  _QWORD v20[4];
  uint64_t v21;

  v6 = type metadata accessor for PhotoLibrary(0);
  v7 = sub_100006E5C(&qword_10002E160, type metadata accessor for PhotoLibrary, (uint64_t)&unk_100020E80);
  v8 = (void *)StateObject.wrappedValue.getter(a1, a2, a3 & 1, v6, v7);
  KeyPath = swift_getKeyPath(&unk_100020DD8);
  v10 = swift_getKeyPath(&unk_100020E00);
  static Published.subscript.getter(v20, v8, KeyPath, v10);

  swift_release(KeyPath);
  swift_release(v10);
  v21 = v20[0];
  v11 = sub_1000071DC(&qword_10002E168);
  v12 = sub_10001917C();
  v13 = sub_10000721C(&qword_10002E148);
  v14 = type metadata accessor for PlainButtonStyle(255);
  v15 = sub_1000074EC(&qword_10002E150, &qword_10002E148, (uint64_t)&protocol conformance descriptor for NavigationLink<A, B>);
  v16 = sub_100006E5C(&qword_10002E158, (uint64_t (*)(uint64_t))&type metadata accessor for PlainButtonStyle, (uint64_t)&protocol conformance descriptor for PlainButtonStyle);
  v20[0] = v13;
  v20[1] = v14;
  v20[2] = v15;
  v20[3] = v16;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v20, &opaque type descriptor for <<opaque return type of View.buttonStyle<A>(_:)>>, 1);
  v18 = sub_10001B8F0();
  return ForEach<>.init(_:content:)(&v21, sub_10001B018, 0, &type metadata for PhotoCollection, &type metadata for String, v11, v12, OpaqueTypeConformance2, v18, v20[0]);
}

uint64_t sub_10001B018@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t KeyPath;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[2];
  char v26[16];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  char v34;
  uint64_t v35;

  v25[1] = a2;
  v3 = type metadata accessor for PlainButtonStyle(0);
  v25[0] = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v5 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1000071DC(&qword_10002E148);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *a1;
  v35 = 0;
  v11 = v10;
  v12 = sub_1000071DC(&qword_10002DDC0);
  State.init(wrappedValue:)(&v28, &v35, v12);
  v13 = v28;
  v14 = v29;
  v35 = 0;
  v15 = sub_1000071DC(&qword_10002DDD0);
  State.init(wrappedValue:)(&v28, &v35, v15);
  v16 = v28;
  v17 = v29;
  KeyPath = swift_getKeyPath(&unk_100020E20);
  v28 = v11;
  v29 = v13;
  v30 = v14;
  v31 = v16;
  v32 = v17;
  v33 = KeyPath;
  v34 = 0;
  v27 = v11;
  v19 = sub_10001B948();
  v20 = sub_10001B98C();
  v21 = NavigationLink.init(destination:label:)(&v28, sub_10001B93C, v26, &type metadata for PhotoView, &type metadata for PhotoDetailView, v19, v20);
  PlainButtonStyle.init()(v21);
  v22 = sub_1000074EC(&qword_10002E150, &qword_10002E148, (uint64_t)&protocol conformance descriptor for NavigationLink<A, B>);
  v23 = sub_100006E5C(&qword_10002E158, (uint64_t (*)(uint64_t))&type metadata accessor for PlainButtonStyle, (uint64_t)&protocol conformance descriptor for PlainButtonStyle);
  View.buttonStyle<A>(_:)(v5, v6, v3, v22, v23);
  (*(void (**)(char *, uint64_t))(v25[0] + 8))(v5, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

id (*PhotoLibraryView.init()())()
{
  id v0;

  v0 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  objc_msgSend(v0, "userInterfaceIdiom");

  return sub_10001A670;
}

uint64_t sub_10001B280(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  void (*v8)(char *, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t result;

  if (a2 < 0)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
    __break(1u);
  }
  else
  {
    if (a2)
    {
      v4 = type metadata accessor for GridItem(0);
      v5 = (char *)static Array._allocateBufferUninitialized(minimumCapacity:)(a2, v4);
      *((_QWORD *)v5 + 2) = a2;
      v6 = *(_QWORD *)(v4 - 8);
      v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
      v8 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
      v8(&v5[v7], a1, v4);
      v9 = a2 - 1;
      if (a2 != 1)
      {
        v10 = *(_QWORD *)(v6 + 72);
        v11 = &v5[v10 + v7];
        do
        {
          v8(v11, a1, v4);
          v11 += v10;
          --v9;
        }
        while (v9);
      }
    }
    else
    {
      v5 = (char *)&_swiftEmptyArrayStorage;
    }
    v12 = type metadata accessor for GridItem(0);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a1, v12);
    return (uint64_t)v5;
  }
  return result;
}

void sub_10001B3B0()
{
  qword_10002E0D0 = static ClarityUIMetrics.titleHorizontalPadding.getter();
}

id sub_10001B3CC@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  char v5;
  char v6;
  uint64_t v7;

  v3 = *(_QWORD *)v1;
  v4 = *(void **)(v1 + 8);
  v5 = *(_BYTE *)(v1 + 16);
  v6 = *(_BYTE *)(v1 + 17);
  v7 = swift_allocObject(&unk_10002AC20, 34, 7);
  *(_QWORD *)(v7 + 16) = v3;
  *(_QWORD *)(v7 + 24) = v4;
  *(_BYTE *)(v7 + 32) = v5;
  *(_BYTE *)(v7 + 33) = v6;
  *a1 = sub_10001ABFC;
  a1[1] = v7;
  return sub_100007A78(v3, v4, v5);
}

uint64_t sub_10001B43C(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &opaque type descriptor for <<opaque return type of PhotoLibraryView.body>>, 1);
}

uint64_t sub_10001B450(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  char v6;

  v4 = *(_QWORD *)a2;
  v5 = *(void **)(a2 + 8);
  v6 = *(_BYTE *)(a2 + 16);
  sub_100007A78(*(_QWORD *)a2, v5, v6);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  return a1;
}

uint64_t assignWithCopy for PhotoLibraryView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  char v6;
  uint64_t v7;
  void *v8;
  char v9;

  v4 = *(_QWORD *)a2;
  v5 = *(void **)(a2 + 8);
  v6 = *(_BYTE *)(a2 + 16);
  sub_100007A78(*(_QWORD *)a2, v5, v6);
  v7 = *(_QWORD *)a1;
  v8 = *(void **)(a1 + 8);
  v9 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v6;
  sub_100007A98(v7, v8, v9);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  return a1;
}

__n128 initializeWithTake for PhotoLibraryView(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for PhotoLibraryView(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  void *v6;
  char v7;

  v4 = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)a1;
  v6 = *(void **)(a1 + 8);
  v7 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v4;
  sub_100007A98(v5, v6, v7);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotoLibraryView(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 18))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for PhotoLibraryView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_WORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 18) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 18) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for PhotoLibraryView()
{
  return &type metadata for PhotoLibraryView;
}

uint64_t sub_10001B610()
{
  return sub_1000074EC(&qword_10002E0D8, &qword_10002E0E0, (uint64_t)&protocol conformance descriptor for GeometryReader<A>);
}

uint64_t sub_10001B640()
{
  uint64_t v0;

  sub_100007A98(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_BYTE *)(v0 + 32));
  return swift_deallocObject(v0, 34, 7);
}

uint64_t sub_10001B668@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __int16 v3;

  if (*(_BYTE *)(v2 + 33))
    v3 = 256;
  else
    v3 = 0;
  return sub_10001A700(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), v3 | *(unsigned __int8 *)(v2 + 32), a2);
}

uint64_t sub_10001B690@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  __int16 v2;

  if (*(_BYTE *)(v1 + 33))
    v2 = 256;
  else
    v2 = 0;
  return sub_10001AC00(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), v2 | *(unsigned __int8 *)(v1 + 32), a1);
}

unint64_t sub_10001B6BC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t OpaqueTypeConformance2;
  uint64_t v4;
  uint64_t v5;

  result = qword_10002E128;
  if (!qword_10002E128)
  {
    v1 = sub_10000721C(&qword_10002E100);
    v2 = sub_10000721C(&qword_10002E0F0);
    v4 = sub_10000721C(&qword_10002E0E8);
    v5 = sub_1000074EC(&qword_10002E120, &qword_10002E0E8, (uint64_t)&protocol conformance descriptor for ScrollView<A>);
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v4, &opaque type descriptor for <<opaque return type of View.defaultScrollAnchor(_:)>>, 1);
    v4 = v2;
    v5 = OpaqueTypeConformance2;
    swift_getOpaqueTypeConformance2(&v4, &opaque type descriptor for <<opaque return type of View.defaultScrollAnchor(_:for:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10002E128);
  }
  return result;
}

uint64_t sub_10001B798(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1000071DC(&qword_10002E100);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001B7D8()
{
  uint64_t v0;

  return sub_10001AE6C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_BYTE *)(v0 + 32));
}

unint64_t sub_10001B800()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_10002E140;
  if (!qword_10002E140)
  {
    v1 = sub_10000721C(&qword_10002E138);
    v2[0] = sub_10000721C(&qword_10002E148);
    v2[1] = type metadata accessor for PlainButtonStyle(255);
    v2[2] = sub_1000074EC(&qword_10002E150, &qword_10002E148, (uint64_t)&protocol conformance descriptor for NavigationLink<A, B>);
    v2[3] = sub_100006E5C(&qword_10002E158, (uint64_t (*)(uint64_t))&type metadata accessor for PlainButtonStyle, (uint64_t)&protocol conformance descriptor for PlainButtonStyle);
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.buttonStyle<A>(_:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v1);
    atomic_store(result, (unint64_t *)&qword_10002E140);
  }
  return result;
}

unint64_t sub_10001B8F0()
{
  unint64_t result;

  result = qword_10002E170;
  if (!qword_10002E170)
  {
    result = swift_getWitnessTable(&unk_100020BE0, &type metadata for Photo);
    atomic_store(result, (unint64_t *)&qword_10002E170);
  }
  return result;
}

id sub_10001B93C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1 + 16);
  *a1 = v2;
  return v2;
}

unint64_t sub_10001B948()
{
  unint64_t result;

  result = qword_10002E178;
  if (!qword_10002E178)
  {
    result = swift_getWitnessTable(&unk_100020AEC, &type metadata for PhotoView);
    atomic_store(result, (unint64_t *)&qword_10002E178);
  }
  return result;
}

unint64_t sub_10001B98C()
{
  unint64_t result;

  result = qword_10002E180;
  if (!qword_10002E180)
  {
    result = swift_getWitnessTable(&unk_1000206E8, &type metadata for PhotoDetailView);
    atomic_store(result, (unint64_t *)&qword_10002E180);
  }
  return result;
}

uint64_t sub_10001B9D0()
{
  uint64_t v0;
  uint64_t KeyPath;
  uint64_t v2;
  uint64_t v4;

  KeyPath = swift_getKeyPath(&unk_100020EB8);
  v2 = swift_getKeyPath(&unk_100020EE0);
  static Published.subscript.getter(&v4, v0, KeyPath, v2);
  swift_release(v2);
  swift_release(KeyPath);
  return v4;
}

char *sub_10001BA40()
{
  char *v0;
  uint64_t v1;
  void *v2;
  char *v3;
  id v4;
  id v5;
  id v6;
  char *v7;
  void *v8;
  char *v9;
  objc_super v11;
  id v12;
  _BYTE v13[24];

  v1 = OBJC_IVAR____TtC15ClarityPhotosUI12PhotoLibrary_photoLibrary;
  v2 = (void *)objc_opt_self(PHPhotoLibrary);
  v3 = v0;
  v4 = objc_msgSend(v2, "sharedPhotoLibrary");
  *(_QWORD *)&v0[v1] = v4;
  v5 = v4;
  v6 = sub_10001D5E4();

  swift_beginAccess(&v3[OBJC_IVAR____TtC15ClarityPhotosUI12PhotoLibrary__collection], v13, 33, 0);
  v12 = v6;
  Published.init(initialValue:)(&v12, &type metadata for PhotoCollection);
  swift_endAccess(v13);

  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for PhotoLibrary(0);
  v7 = (char *)objc_msgSendSuper2(&v11, "init");
  v8 = *(void **)&v7[OBJC_IVAR____TtC15ClarityPhotosUI12PhotoLibrary_photoLibrary];
  v9 = v7;
  objc_msgSend(v8, "registerChangeObserver:", v9);
  sub_10001E3E4();

  return v9;
}

id sub_10001BB70()
{
  char *v0;
  objc_super v2;

  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC15ClarityPhotosUI12PhotoLibrary_photoLibrary], "unregisterChangeObserver:", v0);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotoLibrary(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10001BC78()
{
  return type metadata accessor for PhotoLibrary(0);
}

uint64_t type metadata accessor for PhotoLibrary(uint64_t a1)
{
  uint64_t result;

  result = qword_10002E220;
  if (!qword_10002E220)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for PhotoLibrary);
  return result;
}

uint64_t sub_10001BCBC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char **v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  _BYTE v16[24];

  v5 = (char **)(a4 + 16);
  v6 = objc_msgSend(a1, "localIdentifier");
  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(v6);
  v9 = v8;

  swift_beginAccess(v5, v16, 33, 0);
  v10 = *(char **)(a4 + 16);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v10);
  *(_QWORD *)(a4 + 16) = v10;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v10 = sub_10001CA5C(0, *((_QWORD *)v10 + 2) + 1, 1, v10);
    *v5 = v10;
  }
  v13 = *((_QWORD *)v10 + 2);
  v12 = *((_QWORD *)v10 + 3);
  if (v13 >= v12 >> 1)
  {
    v10 = sub_10001CA5C((char *)(v12 > 1), v13 + 1, 1, v10);
    *v5 = v10;
  }
  *((_QWORD *)v10 + 2) = v13 + 1;
  v14 = &v10[16 * v13];
  *((_QWORD *)v14 + 4) = v7;
  *((_QWORD *)v14 + 5) = v9;
  return swift_endAccess(v16);
}

void sub_10001BDB0(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void);
  id v5;

  v4 = *(void (**)(void))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4();
  swift_release(v3);

}

double sub_10001BE1C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t KeyPath;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double result;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v1 = v0;
  v2 = sub_1000071DC(&qword_10002D6B0);
  __chkstk_darwin(v2);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  KeyPath = swift_getKeyPath(&unk_100020EB8);
  v6 = swift_getKeyPath(&unk_100020EE0);
  static Published.subscript.getter(&v18, v0, KeyPath, v6);
  swift_release(v6);
  swift_release(KeyPath);
  v7 = v18;
  v8 = sub_10000D1C8(0, &qword_10002E240, PHAsset_ptr);
  v9 = (void *)PHChange.changeDetails<A>(for:)(v7, v8);

  if (v9)
  {
    v11 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v4, 1, 1, v11);
    type metadata accessor for MainActor(0);
    v12 = v9;
    v13 = v1;
    v14 = static MainActor.shared.getter(v13);
    v15 = (_QWORD *)swift_allocObject(&unk_10002AC90, 48, 7);
    v15[2] = v14;
    v15[3] = &protocol witness table for MainActor;
    v15[4] = v12;
    v15[5] = v13;
    v16 = sub_100009270((uint64_t)v4, (uint64_t)&unk_10002E250, (uint64_t)v15);

    *(_QWORD *)&result = swift_release(v16).n128_u64[0];
  }
  return result;
}

uint64_t sub_10001BF98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5[7] = a4;
  v5[8] = a5;
  v6 = type metadata accessor for IndexSet.Index(0);
  v5[9] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[10] = v7;
  v8 = (*(_QWORD *)(v7 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5[11] = swift_task_alloc(v8);
  v5[12] = swift_task_alloc(v8);
  v9 = sub_1000071DC(&qword_10002E268);
  v5[13] = v9;
  v5[14] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for IndexSet(0);
  v5[15] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v5[16] = v11;
  v12 = (*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5[17] = swift_task_alloc(v12);
  v5[18] = swift_task_alloc(v12);
  v13 = (*(_QWORD *)(*(_QWORD *)(sub_1000071DC(&qword_10002E270) - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5[19] = swift_task_alloc(v13);
  v5[20] = swift_task_alloc(v13);
  v5[21] = swift_task_alloc(v13);
  v14 = type metadata accessor for MainActor(0);
  v5[22] = static MainActor.shared.getter(v14);
  v15 = dispatch thunk of Actor.unownedExecutor.getter(v14, &protocol witness table for MainActor);
  return swift_task_switch(sub_10001C0DC, v15, v16);
}

uint64_t sub_10001C0DC()
{
  uint64_t v0;
  __n128 v1;
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t KeyPath;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v35;
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t, uint64_t);
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
  char v54;
  void (*v55)(uint64_t, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void (*v60)(uint64_t, _QWORD);
  uint64_t *v61;
  uint64_t v62;
  void (*v63)(uint64_t, uint64_t);
  id v64;
  id v65;
  id v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(uint64_t, uint64_t, uint64_t);
  uint64_t v73;

  if (!objc_msgSend(*(id *)(v0 + 56), "hasIncrementalChanges", swift_release(*(_QWORD *)(v0 + 176)).n128_f64[0]))goto LABEL_10;
  v2 = objc_msgSend(*(id *)(v0 + 56), "insertedIndexes");
  v3 = *(_QWORD *)(v0 + 168);
  if (v2)
  {
    v4 = v2;
    v5 = *(_QWORD *)(v0 + 144);
    v6 = *(_QWORD *)(v0 + 120);
    v7 = *(_QWORD *)(v0 + 128);
    static IndexSet._unconditionallyBridgeFromObjectiveC(_:)();

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(v3, v5, v6);
    v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
    v8(v3, 0, 1, v6);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v3, 1, v6) != 1)
    {
      v9 = *(_QWORD *)(v0 + 168);
LABEL_9:
      sub_1000077A4(v9, &qword_10002E270);
LABEL_10:
      if (qword_10002DB90 != -1)
        swift_once(&qword_10002DB90, sub_100018734, v1);
      v17 = type metadata accessor for Logger(0);
      v18 = sub_10000CFD8(v17, (uint64_t)qword_10002FBA0);
      v19 = Logger.logObject.getter(v18);
      v20 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "Updating photo collection for photo library change.", v21, 2u);
        swift_slowDealloc(v21, -1, -1);
      }
      v22 = *(void **)(v0 + 56);
      v23 = *(void **)(v0 + 64);

      v24 = objc_msgSend(v22, "fetchResultAfterChanges");
      KeyPath = swift_getKeyPath(&unk_100020EB8);
      v26 = swift_getKeyPath(&unk_100020EE0);
      *(_QWORD *)(v0 + 48) = v24;
      static Published.subscript.setter(v0 + 48, v23, KeyPath, v26);
      goto LABEL_15;
    }
  }
  else
  {
    v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 128) + 56);
    v8(*(_QWORD *)(v0 + 168), 1, 1, *(_QWORD *)(v0 + 120));
  }
  v10 = *(void **)(v0 + 56);
  sub_1000077A4(*(_QWORD *)(v0 + 168), &qword_10002E270);
  v11 = objc_msgSend(v10, "removedIndexes");
  v12 = *(_QWORD *)(v0 + 160);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)(v0 + 144);
    v15 = *(_QWORD *)(v0 + 120);
    v16 = *(_QWORD *)(v0 + 128);
    static IndexSet._unconditionallyBridgeFromObjectiveC(_:)();

    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v12, v14, v15);
    v8(v12, 0, 1, v15);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(v12, 1, v15) != 1)
    {
      v9 = *(_QWORD *)(v0 + 160);
      goto LABEL_9;
    }
  }
  else
  {
    v8(*(_QWORD *)(v0 + 160), 1, 1, *(_QWORD *)(v0 + 120));
  }
  v35 = *(void **)(v0 + 56);
  sub_1000077A4(*(_QWORD *)(v0 + 160), &qword_10002E270);
  v36 = objc_msgSend(v35, "changedIndexes");
  v37 = *(_QWORD *)(v0 + 152);
  if (!v36)
  {
    v8(*(_QWORD *)(v0 + 152), 1, 1, *(_QWORD *)(v0 + 120));
    goto LABEL_24;
  }
  v38 = v36;
  v39 = *(_QWORD *)(v0 + 144);
  v40 = *(_QWORD *)(v0 + 120);
  v41 = *(_QWORD *)(v0 + 128);
  static IndexSet._unconditionallyBridgeFromObjectiveC(_:)();

  v42 = *(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 32);
  v42(v37, v39, v40);
  v8(v37, 0, 1, v40);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v41 + 48))(v37, 1, v40) == 1)
  {
LABEL_24:
    sub_1000077A4(*(_QWORD *)(v0 + 152), &qword_10002E270);
    goto LABEL_15;
  }
  v71 = *(_QWORD *)(v0 + 128);
  v43 = *(_QWORD *)(v0 + 112);
  v44 = *(_QWORD *)(v0 + 104);
  v45 = *(_QWORD *)(v0 + 80);
  v46 = ((uint64_t (*)(_QWORD, _QWORD, _QWORD))v42)(*(_QWORD *)(v0 + 136), *(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 120));
  IndexSet.makeIterator()(v46);
  v47 = v43 + *(int *)(v44 + 36);
  v72 = *(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 16);
  v73 = v45;
  while (1)
  {
    v48 = *(_QWORD *)(v0 + 120);
    v50 = *(_QWORD *)(v0 + 88);
    v49 = *(_QWORD *)(v0 + 96);
    v51 = *(_QWORD *)(v0 + 72);
    v72(v49, v47, v51);
    v52 = sub_100006E5C(&qword_10002E278, (uint64_t (*)(uint64_t))&type metadata accessor for IndexSet, (uint64_t)&protocol conformance descriptor for IndexSet);
    dispatch thunk of Collection.endIndex.getter(v48, v52);
    v53 = sub_100006E5C((unint64_t *)&unk_10002E280, (uint64_t (*)(uint64_t))&type metadata accessor for IndexSet.Index, (uint64_t)&protocol conformance descriptor for IndexSet.Index);
    v54 = dispatch thunk of static Equatable.== infix(_:_:)(v49, v50, v51, v53);
    v55 = *(void (**)(uint64_t, uint64_t))(v73 + 8);
    v55(v50, v51);
    v55(v49, v51);
    v56 = *(_QWORD *)(v0 + 112);
    v57 = *(_QWORD *)(v0 + 120);
    if ((v54 & 1) != 0)
      break;
    v58 = *(_QWORD *)(v0 + 144);
    v59 = *(void **)(v0 + 56);
    v60 = (void (*)(uint64_t, _QWORD))dispatch thunk of Collection.subscript.read(v0 + 16, v47, *(_QWORD *)(v0 + 120), v52);
    v62 = *v61;
    v60(v0 + 16, 0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v71 + 16))(v58, v56, v57);
    dispatch thunk of Collection.formIndex(after:)(v47, v57, v52);
    v63 = *(void (**)(uint64_t, uint64_t))(v71 + 8);
    v63(v58, v57);
    v64 = objc_msgSend(v59, "fetchResultBeforeChanges");
    v65 = objc_msgSend(v64, "objectAtIndexedSubscript:", v62);

    v66 = objc_msgSend(v59, "fetchResultAfterChanges");
    v67 = objc_msgSend(v66, "objectAtIndexedSubscript:", v62);

    sub_10000D1C8(0, &qword_10002E240, PHAsset_ptr);
    LOBYTE(v66) = static NSObject.== infix(_:_:)(v65, v67);

    if ((v66 & 1) == 0)
    {
      v68 = *(_QWORD *)(v0 + 136);
      v69 = *(_QWORD *)(v0 + 120);
      sub_1000077A4(*(_QWORD *)(v0 + 112), &qword_10002E268);
      v63(v68, v69);
      goto LABEL_10;
    }
  }
  v70 = *(_QWORD *)(v0 + 136);
  sub_1000077A4(*(_QWORD *)(v0 + 112), &qword_10002E268);
  (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v70, v57);
LABEL_15:
  v27 = *(_QWORD *)(v0 + 160);
  v29 = *(_QWORD *)(v0 + 144);
  v28 = *(_QWORD *)(v0 + 152);
  v30 = *(_QWORD *)(v0 + 136);
  v31 = *(_QWORD *)(v0 + 112);
  v33 = *(_QWORD *)(v0 + 88);
  v32 = *(_QWORD *)(v0 + 96);
  swift_task_dealloc(*(_QWORD *)(v0 + 168));
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_10001C744(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[2];

  sub_10001C7BC();
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(v2 - 8) + 64;
    v4[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
    swift_updateClassMetadata2(a1, 256, 2, v4, a1 + 80);
  }
}

void sub_10001C7BC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_10002E230)
  {
    v0 = type metadata accessor for Published(0, &type metadata for PhotoCollection);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_10002E230);
  }
}

uint64_t sub_10001C810@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = type metadata accessor for PhotoLibrary(0);
  result = ObservableObject<>.objectWillChange.getter(v2);
  *a1 = result;
  return result;
}

uint64_t sub_10001C84C@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = *a1;
  KeyPath = swift_getKeyPath(&unk_100020EB8);
  v5 = swift_getKeyPath(&unk_100020EE0);
  static Published.subscript.getter(&v7, v3, KeyPath, v5);
  swift_release(v5);
  result = swift_release(KeyPath);
  *a2 = v7;
  return result;
}

uint64_t sub_10001C8CC(void **a1, void **a2)
{
  void *v2;
  void *v3;
  uint64_t KeyPath;
  uint64_t v5;
  id v6;
  void *v8;

  v2 = *a1;
  v3 = *a2;
  KeyPath = swift_getKeyPath(&unk_100020EB8);
  v5 = swift_getKeyPath(&unk_100020EE0);
  v8 = v2;
  v6 = v2;
  return static Published.subscript.setter(&v8, v3, KeyPath, v5);
}

uint64_t sub_10001C940()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10001C974(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc(dword_10002E24C);
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_100007388;
  return sub_10001BF98(a1, v4, v5, v7, v6);
}

uint64_t sub_10001C9EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_10002D6D4);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100007388;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_10002D6D0 + dword_10002D6D0))(a1, v4);
}

char *sub_10001CA5C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      v10 = sub_1000071DC(&qword_10002E2D0);
      v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
      v12 = j__malloc_size(v11);
      v13 = v12 - 32;
      if (v12 < 32)
        v13 = v12 - 17;
      *((_QWORD *)v11 + 2) = v8;
      *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
      v14 = v11 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v11 = (char *)&_swiftEmptyArrayStorage;
      v14 = (char *)&_swiftEmptyArrayStorage + 32;
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v11 != a4 || v14 >= &a4[16 * v8 + 32])
          memmove(v14, a4 + 32, 16 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_10001E724(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_10001CB68(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v7;
  Swift::Int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  BOOL v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  _QWORD v24[9];

  v7 = *v3;
  Hasher.init(_seed:)(v24, *(_QWORD *)(*v3 + 40));
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(v24, a2, a3);
  v8 = Hasher._finalize()();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = v12[1];
    v14 = *v12 == a2 && v13 == a3;
    if (v14 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v12, v13, a2, a3, 0) & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease(a3);
      swift_bridgeObjectRelease(v7);
      v15 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v16 = v15[1];
      *a1 = *v15;
      a1[1] = v16;
      swift_bridgeObjectRetain(v16);
      return 0;
    }
    v18 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v18;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v19 = (_QWORD *)(v11 + 16 * v10);
      v20 = v19[1];
      v21 = *v19 == a2 && v20 == a3;
      if (v21 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v19, v20, a2, a3, 0) & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease(v7);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v24[0] = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain(a3);
  sub_10001CFF0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  v23 = *v3;
  *v3 = v24[0];
  swift_bridgeObjectRelease(v23);
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

void sub_10001CD14(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  int64_t v12;
  unint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  Swift::Int v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  _QWORD *v33;
  _QWORD v34[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_1000071DC(&qword_10002E2C8);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 1);
  v6 = v5;
  if (*(_QWORD *)(v3 + 16))
  {
    v7 = 1 << *(_BYTE *)(v3 + 32);
    v32 = v2;
    v33 = (_QWORD *)(v3 + 56);
    if (v7 < 64)
      v8 = ~(-1 << v7);
    else
      v8 = -1;
    v9 = v8 & *(_QWORD *)(v3 + 56);
    v10 = (unint64_t)(v7 + 63) >> 6;
    v11 = v5 + 56;
    swift_retain(v3);
    v12 = 0;
    while (1)
    {
      if (v9)
      {
        v15 = __clz(__rbit64(v9));
        v9 &= v9 - 1;
        v16 = v15 | (v12 << 6);
      }
      else
      {
        v17 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return;
        }
        if (v17 >= v10)
          goto LABEL_36;
        v18 = v33[v17];
        ++v12;
        if (!v18)
        {
          v12 = v17 + 1;
          if (v17 + 1 >= v10)
            goto LABEL_36;
          v18 = v33[v12];
          if (!v18)
          {
            v12 = v17 + 2;
            if (v17 + 2 >= v10)
              goto LABEL_36;
            v18 = v33[v12];
            if (!v18)
            {
              v19 = v17 + 3;
              if (v19 >= v10)
              {
LABEL_36:
                swift_release(v3);
                v2 = v32;
                v31 = 1 << *(_BYTE *)(v3 + 32);
                if (v31 > 63)
                  bzero(v33, ((unint64_t)(v31 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v33 = -1 << v31;
                *(_QWORD *)(v3 + 16) = 0;
                break;
              }
              v18 = v33[v19];
              if (!v18)
              {
                while (1)
                {
                  v12 = v19 + 1;
                  if (__OFADD__(v19, 1))
                    goto LABEL_42;
                  if (v12 >= v10)
                    goto LABEL_36;
                  v18 = v33[v12];
                  ++v19;
                  if (v18)
                    goto LABEL_26;
                }
              }
              v12 = v19;
            }
          }
        }
LABEL_26:
        v9 = (v18 - 1) & v18;
        v16 = __clz(__rbit64(v18)) + (v12 << 6);
      }
      v20 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v16);
      v21 = *v20;
      v22 = v20[1];
      Hasher.init(_seed:)(v34, *(_QWORD *)(v6 + 40));
      String.hash(into:)(v34, v21, v22);
      v23 = Hasher._finalize()();
      v24 = -1 << *(_BYTE *)(v6 + 32);
      v25 = v23 & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v27 = 0;
        v28 = (unint64_t)(63 - v24) >> 6;
        do
        {
          if (++v26 == v28 && (v27 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v29 = v26 == v28;
          if (v26 == v28)
            v26 = 0;
          v27 |= v29;
          v30 = *(_QWORD *)(v11 + 8 * v26);
        }
        while (v30 == -1);
        v13 = __clz(__rbit64(~v30)) + (v26 << 6);
      }
      *(_QWORD *)(v11 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      v14 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v13);
      *v14 = v21;
      v14[1] = v22;
      ++*(_QWORD *)(v6 + 16);
    }
  }
  swift_release(v3);
  *v2 = v6;
}

void sub_10001CFF0(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  Swift::Int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  _QWORD v29[9];

  v5 = v4;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  v11 = v9 + 1;
  if ((a4 & 1) != 0)
  {
    sub_10001CD14(v11);
  }
  else
  {
    if (v10 > v9)
    {
      sub_10001D188();
      goto LABEL_22;
    }
    sub_10001D338(v11);
  }
  v12 = *v4;
  Hasher.init(_seed:)(v29, *(_QWORD *)(*v4 + 40));
  String.hash(into:)(v29, a1, a2);
  v13 = Hasher._finalize()();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a3 = v13 & ~v14;
  v15 = v12 + 56;
  if (((*(_QWORD *)(v12 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v16 = *(_QWORD *)(v12 + 48);
    v17 = (_QWORD *)(v16 + 16 * a3);
    v18 = v17[1];
    v19 = *v17 == a1 && v18 == a2;
    if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v17, v18, a1, a2, 0) & 1) != 0)
    {
LABEL_21:
      ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
      __break(1u);
    }
    else
    {
      v20 = ~v14;
      while (1)
      {
        a3 = (a3 + 1) & v20;
        if (((*(_QWORD *)(v15 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v21 = (_QWORD *)(v16 + 16 * a3);
        v22 = v21[1];
        v23 = *v21 == a1 && v22 == a2;
        if (v23 || (_stringCompareWithSmolCheck(_:_:expecting:)(*v21, v22, a1, a2, 0) & 1) != 0)
          goto LABEL_21;
      }
    }
  }
LABEL_22:
  v24 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v25 = (_QWORD *)(*(_QWORD *)(v24 + 48) + 16 * a3);
  *v25 = a1;
  v25[1] = a2;
  v26 = *(_QWORD *)(v24 + 16);
  v27 = __OFADD__(v26, 1);
  v28 = v26 + 1;
  if (v27)
    __break(1u);
  else
    *(_QWORD *)(v24 + 16) = v28;
}

void sub_10001D188()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
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
  sub_1000071DC(&qword_10002E2C8);
  v2 = *v0;
  v3 = static _SetStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    swift_release(v2);
    *v1 = v4;
    return;
  }
  v5 = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)v5 >= v2 + 56 + 8 * v7)
    memmove(v5, (const void *)(v2 + 56), 8 * v7);
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
    swift_bridgeObjectRetain(v18);
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
}

void sub_10001D338(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  int64_t v12;
  unint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  Swift::Int v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  int64_t v32;
  _QWORD v33[9];

  v2 = v1;
  v3 = *v1;
  if (*(_QWORD *)(*v1 + 24) <= a1)
    v4 = a1;
  else
    v4 = *(_QWORD *)(*v1 + 24);
  sub_1000071DC(&qword_10002E2C8);
  v5 = static _SetStorage.resize(original:capacity:move:)(v3, v4, 0);
  v6 = v5;
  if (!*(_QWORD *)(v3 + 16))
  {
    swift_release(v3);
LABEL_38:
    *v2 = v6;
    return;
  }
  v7 = 1 << *(_BYTE *)(v3 + 32);
  v8 = v3 + 56;
  if (v7 < 64)
    v9 = ~(-1 << v7);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v3 + 56);
  v31 = v2;
  v32 = (unint64_t)(v7 + 63) >> 6;
  v11 = v5 + 56;
  swift_retain(v3);
  v12 = 0;
  while (1)
  {
    if (v10)
    {
      v15 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v16 = v15 | (v12 << 6);
      goto LABEL_27;
    }
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v32)
      goto LABEL_36;
    v18 = *(_QWORD *)(v8 + 8 * v17);
    ++v12;
    if (!v18)
    {
      v12 = v17 + 1;
      if (v17 + 1 >= v32)
        goto LABEL_36;
      v18 = *(_QWORD *)(v8 + 8 * v12);
      if (!v18)
      {
        v12 = v17 + 2;
        if (v17 + 2 >= v32)
          goto LABEL_36;
        v18 = *(_QWORD *)(v8 + 8 * v12);
        if (!v18)
          break;
      }
    }
LABEL_26:
    v10 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v12 << 6);
LABEL_27:
    v20 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v16);
    v21 = *v20;
    v22 = v20[1];
    Hasher.init(_seed:)(v33, *(_QWORD *)(v6 + 40));
    swift_bridgeObjectRetain(v22);
    String.hash(into:)(v33, v21, v22);
    v23 = Hasher._finalize()();
    v24 = -1 << *(_BYTE *)(v6 + 32);
    v25 = v23 & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v11 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v24) >> 6;
      do
      {
        if (++v26 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v29 = v26 == v28;
        if (v26 == v28)
          v26 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v26);
      }
      while (v30 == -1);
      v13 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(_QWORD *)(v11 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    v14 = (_QWORD *)(*(_QWORD *)(v6 + 48) + 16 * v13);
    *v14 = v21;
    v14[1] = v22;
    ++*(_QWORD *)(v6 + 16);
  }
  v19 = v17 + 3;
  if (v19 >= v32)
  {
LABEL_36:
    swift_release_n(v3, 2);
    v2 = v31;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v8 + 8 * v19);
  if (v18)
  {
    v12 = v19;
    goto LABEL_26;
  }
  while (1)
  {
    v12 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v12 >= v32)
      goto LABEL_36;
    v18 = *(_QWORD *)(v8 + 8 * v12);
    ++v19;
    if (v18)
      goto LABEL_26;
  }
LABEL_40:
  __break(1u);
}

id sub_10001D5E4()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  os_signpost_type_t v14;
  char v15;
  void (*v16)(char *, int64_t, uint64_t);
  uint64_t v17;
  char *v18;
  uint8_t *v19;
  os_signpost_id_t v20;
  uint8_t *v21;
  uint64_t v22;
  void (*v23)(char *, int64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  int64_t v45;
  unint64_t v46;
  int64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  __n128 v54;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  BOOL v70;
  uint64_t v71;
  uint64_t v72;
  BOOL v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  BOOL v79;
  void *v80;
  void *v81;
  Class isa;
  id v83;
  __n128 v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  NSObject *v88;
  uint64_t v89;
  uint64_t v90;
  os_log_type_t v91;
  uint8_t *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  id v96;
  NSString v97;
  id v98;
  uint64_t v99;
  Class v100;
  void *v101;
  id v102;
  id v103;
  uint64_t v104;
  NSObject *v105;
  char *v106;
  uint64_t v107;
  os_signpost_type_t v108;
  uint64_t v109;
  __n128 v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  char *v115;
  uint64_t v116;
  char *v117;
  uint8_t *v118;
  os_signpost_id_t v119;
  char *v120;
  void (*v121)(char *, uint64_t);
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  id v126;
  id v127;
  uint64_t v128;
  void (*v129)(char *, char *, uint64_t);
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void (*v133)(int64_t, uint64_t);
  char *v134;
  char *v135;
  uint64_t v136;
  uint64_t v137;
  char *v138;
  __n128 v139;
  unint64_t v140;
  _QWORD *v141;
  uint64_t v142;
  int64_t v143;
  uint64_t v144;
  uint64_t v145[2];
  void *v146;
  _QWORD aBlock[5];
  uint64_t v148;

  v131 = type metadata accessor for OSSignpostError(0);
  v130 = *(_QWORD *)(v131 - 8);
  __chkstk_darwin(v131);
  v1 = (unint64_t)&v123 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v136 = type metadata accessor for OSSignpostID(0);
  v2 = *(_QWORD *)(v136 - 8);
  v3 = __chkstk_darwin(v136);
  v134 = (char *)&v123 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __chkstk_darwin(v3);
  v135 = (char *)&v123 - v6;
  __chkstk_darwin(v5);
  v9 = (int64_t)&v123 - v8;
  if (qword_10002DB98 != -1)
LABEL_77:
    swift_once(&qword_10002DB98, sub_1000187B4, v7);
  v10 = type metadata accessor for OSSignposter(0);
  v11 = sub_10000CFD8(v10, (uint64_t)qword_10002FBB8);
  v12 = static OSSignpostID.exclusive.getter();
  v13 = OSSignposter.logHandle.getter(v12);
  v14 = static os_signpost_type_t.begin.getter();
  v15 = OS_os_log.signpostsEnabled.getter();
  v140 = v1;
  v132 = v11;
  if ((v15 & 1) != 0)
  {
    v16 = *(void (**)(char *, int64_t, uint64_t))(v2 + 16);
    v18 = v135;
    v17 = v136;
    v16(v135, v9, v136);
    v19 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v19 = 0;
    v20 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, v14, v20, "makePhotoCollection", "", v19, 2u);
    v21 = v19;
    v1 = v140;
    swift_slowDealloc(v21, -1, -1);

    v22 = v17;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v18, v17);
    v23 = v16;
  }
  else
  {

    v23 = *(void (**)(char *, int64_t, uint64_t))(v2 + 16);
    v18 = v135;
    v22 = v136;
  }
  v129 = (void (*)(char *, char *, uint64_t))v23;
  v23(v18, v9, v22);
  v24 = type metadata accessor for OSSignpostIntervalState(0);
  swift_allocObject(v24, *(unsigned int *)(v24 + 48), *(unsigned __int16 *)(v24 + 52));
  v25 = OSSignpostIntervalState.init(id:isOpen:)(v18, 1);
  v133 = *(void (**)(int64_t, uint64_t))(v2 + 8);
  v133(v9, v22);
  v26 = objc_msgSend(objc_allocWithZone((Class)PHFetchOptions), "init");
  objc_msgSend(v26, "setIncludeAssetSourceTypes:", 5);
  v27 = sub_10000D1C8(0, (unint64_t *)&unk_10002E290, CLFPhotosSettings_ptr);
  v28 = objc_msgSend((id)swift_getObjCClassFromMetadata(v27), "sharedInstance");
  if (!objc_msgSend(v28, "includeSharedAlbums"))
    goto LABEL_67;
  v128 = v25;
  v29 = objc_msgSend(v28, "selectedSharedAlbumCloudIdentifiers");
  v30 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v29, &type metadata for String);

  v137 = *(_QWORD *)(v30 + 16);
  if (!v137)
  {
    swift_bridgeObjectRelease(v30);
    v25 = v128;
    goto LABEL_67;
  }
  v126 = v28;
  v31 = (_QWORD *)v30;
  v32 = swift_allocObject(&unk_10002ACB8, 24, 7);
  *(_QWORD *)(v32 + 16) = &_swiftEmptyArrayStorage;
  v33 = (void *)objc_opt_self(PHAssetCollection);
  v2 = 1;
  v127 = v26;
  v34 = objc_msgSend(v33, "fetchAssetCollectionsWithType:subtype:options:", 1, 101, v26);
  aBlock[4] = sub_10001E6A0;
  v148 = v32;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10001BDB0;
  aBlock[3] = &unk_10002ACD0;
  v35 = _Block_copy(aBlock);
  v36 = v148;
  v125 = v32;
  swift_retain(v32);
  objc_msgSend(v34, "enumerateObjectsUsingBlock:", v35, swift_release(v36).n128_f64[0]);
  _Block_release(v35);

  swift_beginAccess(v32 + 16, aBlock, 0, 0);
  v37 = *(_QWORD *)(v32 + 16);
  v38 = swift_bridgeObjectRetain(v37);
  v39 = PHPhotoLibrary.cloudIdentifierMappings(forLocalIdentifiers:)(v38);
  swift_bridgeObjectRelease(v37);
  v9 = 0;
  v40 = *(_QWORD *)(v39 + 64);
  v141 = v31;
  v142 = v39 + 64;
  v41 = 1 << *(_BYTE *)(v39 + 32);
  v146 = &_swiftEmptySetSingleton;
  if (v41 < 64)
    v42 = ~(-1 << v41);
  else
    v42 = -1;
  v1 = v42 & v40;
  v143 = (unint64_t)(v41 + 63) >> 6;
  v144 = v39;
  v124 = v31 + 9;
  v7.n128_u64[0] = 136315394;
  v139 = v7;
  v138 = (char *)&type metadata for Any + 8;
  while (v1)
  {
    v43 = __clz(__rbit64(v1));
    v1 &= v1 - 1;
    v44 = v43 | (v9 << 6);
LABEL_28:
    v48 = 16 * v44;
    v49 = (uint64_t *)(*(_QWORD *)(v144 + 48) + v48);
    v50 = *v49;
    v2 = v49[1];
    v51 = *(_QWORD *)(v144 + 56) + v48;
    v52 = *(void **)v51;
    if ((*(_BYTE *)(v51 + 8) & 1) != 0)
    {
      sub_10001E6C0(v52, 1);
      sub_10001E6C0(v52, 1);
      v53 = qword_10002DB90;
      swift_bridgeObjectRetain(v2);
      if (v53 != -1)
        swift_once(&qword_10002DB90, sub_100018734, v54);
      v55 = type metadata accessor for Logger(0);
      sub_10000CFD8(v55, (uint64_t)qword_10002FBA0);
      sub_10001E6C0(v52, 1);
      sub_10001E6C0(v52, 1);
      v56 = swift_bridgeObjectRetain(v2);
      v57 = Logger.logObject.getter(v56);
      v58 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v57, v58))
      {
        v59 = swift_slowAlloc(22, -1);
        v60 = (uint64_t *)swift_slowAlloc(8, -1);
        v61 = swift_slowAlloc(32, -1);
        v145[0] = v61;
        *(_DWORD *)v59 = v139.n128_u32[0];
        swift_bridgeObjectRetain(v2);
        *(_QWORD *)(v59 + 4) = sub_1000127E8(v50, v2, v145);
        swift_bridgeObjectRelease_n(v2, 3);
        *(_WORD *)(v59 + 12) = 2112;
        swift_errorRetain(v52);
        v62 = _swift_stdlib_bridgeErrorToNSError(v52);
        *(_QWORD *)(v59 + 14) = v62;
        *v60 = v62;
        sub_10001E6CC(v52, 1);
        sub_10001E6CC(v52, 1);
        _os_log_impl((void *)&_mh_execute_header, v57, v58, "Error fetching album cloud identifier for local identifier: %s. Error: %@.", (uint8_t *)v59, 0x16u);
        v63 = sub_1000071DC(&qword_10002D6B8);
        swift_arrayDestroy(v60, 1, v63);
        swift_slowDealloc(v60, -1, -1);
        swift_arrayDestroy(v61, 1, v138);
        swift_slowDealloc(v61, -1, -1);
        swift_slowDealloc(v59, -1, -1);

        sub_10001E6CC(v52, 1);
      }
      else
      {
        sub_10001E6CC(v52, 1);
        swift_bridgeObjectRelease_n(v2, 2);
        sub_10001E6CC(v52, 1);
        sub_10001E6CC(v52, 1);

      }
      sub_10001E6CC(v52, 1);
    }
    else
    {
      sub_10001E6C0(v52, 0);
      sub_10001E6C0(v52, 0);
      swift_bridgeObjectRetain(v2);
      v64 = objc_msgSend(v52, "stringValue");
      v65 = static String._unconditionallyBridgeFromObjectiveC(_:)(v64);
      v67 = v66;

      v68 = v141[4];
      v69 = v141[5];
      v70 = v68 == v65 && v69 == v67;
      if (v70 || (_stringCompareWithSmolCheck(_:_:expecting:)(v68, v69, v65, v67, 0) & 1) != 0)
        goto LABEL_11;
      if (v137 == 1)
        goto LABEL_39;
      v71 = v141[6];
      v72 = v141[7];
      v73 = v71 == v65 && v72 == v67;
      if (v73 || (_stringCompareWithSmolCheck(_:_:expecting:)(v71, v72, v65, v67, 0) & 1) != 0)
      {
LABEL_11:
        swift_bridgeObjectRelease(v67);
        sub_10001CB68(v145, v50, v2);
        sub_10001E6CC(v52, 0);
        sub_10001E6CC(v52, 0);
        swift_bridgeObjectRelease(v145[1]);
      }
      else
      {
        if (v137 != 2)
        {
          v74 = v124;
          v75 = 2;
          do
          {
            v76 = v75 + 1;
            if (__OFADD__(v75, 1))
              goto LABEL_76;
            v77 = *(v74 - 1);
            v78 = *v74;
            v79 = v77 == v65 && v78 == v67;
            if (v79 || (_stringCompareWithSmolCheck(_:_:expecting:)(v77, v78, v65, v67, 0) & 1) != 0)
              goto LABEL_11;
            v74 += 2;
            ++v75;
          }
          while (v76 != v137);
        }
LABEL_39:
        swift_bridgeObjectRelease(v67);
        sub_10001E6CC(v52, 0);
        swift_bridgeObjectRelease(v2);
        sub_10001E6CC(v52, 0);
      }
    }
  }
  v45 = v9 + 1;
  if (__OFADD__(v9, 1))
  {
    __break(1u);
LABEL_75:
    __break(1u);
LABEL_76:
    __break(1u);
    goto LABEL_77;
  }
  if (v45 >= v143)
  {
    swift_bridgeObjectRelease(v141);
    swift_release(v144);
    v1 = v140;
    goto LABEL_60;
  }
  v46 = *(_QWORD *)(v142 + 8 * v45);
  ++v9;
  v1 = v140;
  if (v46)
    goto LABEL_27;
  v9 = v45 + 1;
  if (v45 + 1 >= v143)
    goto LABEL_59;
  v46 = *(_QWORD *)(v142 + 8 * v9);
  if (v46)
    goto LABEL_27;
  v9 = v45 + 2;
  if (v45 + 2 >= v143)
    goto LABEL_59;
  v46 = *(_QWORD *)(v142 + 8 * v9);
  if (v46)
  {
LABEL_27:
    v1 = (v46 - 1) & v46;
    v44 = __clz(__rbit64(v46)) + (v9 << 6);
    goto LABEL_28;
  }
  v47 = v45 + 3;
  if (v47 < v143)
  {
    v46 = *(_QWORD *)(v142 + 8 * v47);
    if (!v46)
    {
      while (1)
      {
        v9 = v47 + 1;
        if (__OFADD__(v47, 1))
          goto LABEL_75;
        if (v9 >= v143)
          goto LABEL_59;
        v46 = *(_QWORD *)(v142 + 8 * v9);
        ++v47;
        if (v46)
          goto LABEL_27;
      }
    }
    v9 = v47;
    goto LABEL_27;
  }
LABEL_59:
  swift_bridgeObjectRelease(v141);
  swift_release(v144);
LABEL_60:
  v80 = (void *)objc_opt_self(PHObject);
  v81 = v146;
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v81);
  v83 = objc_msgSend(v80, "uuidsFromLocalIdentifiers:", isa);

  v26 = v127;
  if (v83)
  {
    v85 = static Set._unconditionallyBridgeFromObjectiveC(_:)(v83, &type metadata for String, &protocol witness table for String);

    sub_10000D1C8(0, &qword_10002E2A8, NSPredicate_ptr);
    v86 = sub_1000071DC(&qword_10002E2B0);
    v87 = swift_allocObject(v86, 72, 7);
    *(_OWORD *)(v87 + 16) = xmmword_100020190;
    *(_QWORD *)(v87 + 56) = sub_1000071DC(&qword_10002E2B8);
    *(_QWORD *)(v87 + 64) = sub_10001E6D8();
    *(_QWORD *)(v87 + 32) = v85;
    v88 = NSPredicate.init(format:_:)(0xD00000000000002FLL, 0x80000001000217C0, v87);
    objc_msgSend(v26, "setInternalInclusionPredicate:", v88);
  }
  else
  {
    if (qword_10002DB90 != -1)
      swift_once(&qword_10002DB90, sub_100018734, v84);
    v89 = type metadata accessor for Logger(0);
    v90 = sub_10000CFD8(v89, (uint64_t)qword_10002FBA0);
    v88 = Logger.logObject.getter(v90);
    v91 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v88, v91))
    {
      v92 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v92 = 0;
      _os_log_impl((void *)&_mh_execute_header, v88, v91, "Unable to get UUIDs from shared album local identifiers.", v92, 2u);
      swift_slowDealloc(v92, -1, -1);
    }
  }
  swift_release(v125);

  v25 = v128;
  v28 = v126;
LABEL_67:
  v93 = sub_1000071DC(&qword_10002DAC8);
  v94 = swift_allocObject(v93, 40, 7);
  *(_OWORD *)(v94 + 16) = xmmword_100020E60;
  v95 = v28;
  v96 = objc_allocWithZone((Class)NSSortDescriptor);
  v97 = String._bridgeToObjectiveC()();
  v98 = objc_msgSend(v96, "initWithKey:ascending:", v97, 1);

  *(_QWORD *)(v94 + 32) = v98;
  v145[0] = v94;
  specialized Array._endMutation()();
  v99 = v145[0];
  sub_10000D1C8(0, &qword_10002E2A0, NSSortDescriptor_ptr);
  v100 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v99);
  objc_msgSend(v26, "setSortDescriptors:", v100);

  v101 = (void *)objc_opt_self(PHAsset);
  v102 = v26;
  v103 = objc_msgSend(v101, "fetchAssetsWithOptions:", v102);

  v105 = OSSignposter.logHandle.getter(v104);
  v106 = v134;
  v107 = OSSignpostIntervalState.signpostID.getter();
  v108 = static os_signpost_type_t.end.getter(v107);
  if ((OS_os_log.signpostsEnabled.getter() & 1) != 0)
  {
    v109 = swift_retain(v25);
    checkForErrorAndConsumeState(state:)(v109);
    v110 = swift_release(v25);
    v111 = v130;
    v112 = v131;
    v113 = v25;
    if ((*(unsigned int (**)(unint64_t, uint64_t, __n128))(v130 + 88))(v1, v131, v110) == enum case for OSSignpostError.doubleEnd(_:))
    {
      v114 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(unint64_t, uint64_t))(v111 + 8))(v1, v112);
      v114 = "";
    }
    v115 = v135;
    v116 = v136;
    v117 = v134;
    v129(v135, v134, v136);
    v118 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v118 = 0;
    v119 = OSSignpostID.rawValue.getter();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v105, v108, v119, "makePhotoCollection", v114, v118, 2u);
    swift_slowDealloc(v118, -1, -1);

    v120 = v115;
    v121 = (void (*)(char *, uint64_t))v133;
    v133((int64_t)v117, v116);
    v25 = v113;
    v121(v120, v116);
  }
  else
  {

    v133((int64_t)v106, v136);
  }
  swift_release(v25);
  return v103;
}

void sub_10001E3E4()
{
  id v0;
  unsigned int v1;
  id v2;
  id v3;
  uint64_t v4;
  __n128 v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;

  v0 = objc_msgSend((id)objc_opt_self(AVAudioSession), "sharedInstance");
  v15 = 0;
  v1 = objc_msgSend(v0, "setCategory:mode:options:error:", AVAudioSessionCategoryPlayback, AVAudioSessionModeDefault, 0, &v15);

  if (v1)
  {
    v2 = v15;
  }
  else
  {
    v14 = v15;
    v3 = v15;
    v4 = _convertNSErrorToError(_:)(v14);

    swift_willThrow();
    if (qword_10002DB90 != -1)
      swift_once(&qword_10002DB90, sub_100018734, v5);
    v6 = type metadata accessor for Logger(0);
    sub_10000CFD8(v6, (uint64_t)qword_10002FBA0);
    swift_errorRetain(v4);
    v7 = swift_errorRetain(v4);
    v8 = Logger.logObject.getter(v7);
    v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc(12, -1);
      v11 = (_QWORD *)swift_slowAlloc(8, -1);
      *(_DWORD *)v10 = 138412290;
      swift_errorRetain(v4);
      v12 = (void *)_swift_stdlib_bridgeErrorToNSError(v4);
      v15 = v12;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v10 + 4, v10 + 12);
      *v11 = v12;
      swift_errorRelease(v4);
      swift_errorRelease(v4);
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Error setting AVAudioSession playback category. Error: %@.", v10, 0xCu);
      v13 = sub_1000071DC(&qword_10002D6B8);
      swift_arrayDestroy(v11, 1, v13);
      swift_slowDealloc(v11, -1, -1);
      swift_slowDealloc(v10, -1, -1);

      swift_errorRelease(v4);
    }
    else
    {
      swift_errorRelease(v4);
      swift_errorRelease(v4);
      swift_errorRelease(v4);

    }
  }
}

uint64_t sub_10001E67C()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10001E6A0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_10001BCBC(a1, a2, a3, v3);
}

uint64_t sub_10001E6A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10001E6B8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

id sub_10001E6C0(void *a1, char a2)
{
  if ((a2 & 1) != 0)
    return (id)swift_errorRetain();
  else
    return a1;
}

void sub_10001E6CC(void *a1, char a2)
{
  if ((a2 & 1) != 0)
    swift_errorRelease();
  else

}

unint64_t sub_10001E6D8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10002E2C0;
  if (!qword_10002E2C0)
  {
    v1 = sub_10000721C(&qword_10002E2B8);
    result = swift_getWitnessTable(&protocol conformance descriptor for Set<A>, v1);
    atomic_store(result, (unint64_t *)&qword_10002E2C0);
  }
  return result;
}

uint64_t sub_10001E724(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v8;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else
  {
    if (v4 < 0)
    {
      v8 = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
      goto LABEL_9;
    }
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy(a3);
      return v6;
    }
  }
  v8 = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return type metadata accessor for Notification(v8);
}
