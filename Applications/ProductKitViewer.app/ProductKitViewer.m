uint64_t sub_1000033F0()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_100004B94(&qword_1000144F0);
  v1 = sub_100005E0C(&qword_1000144F8, &qword_1000144F0, (uint64_t)&protocol conformance descriptor for TupleView<A>);
  return TabView<>.init(content:)(sub_10000345C, 0, v0, v1);
}

uint64_t sub_10000345C@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  void (*v23)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t (*v28)();
  uint64_t v29;
  char v30;

  v27 = a1;
  v1 = sub_100004B94(&qword_100014500);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = __chkstk_darwin(v1);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v25 - v6;
  v8 = sub_100004B94(&qword_100014508);
  v26 = *(_QWORD *)(v8 - 8);
  v9 = v26;
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v14 = (char *)&v25 - v13;
  v15 = sub_100004C18();
  View.tabItem<A>(_:)(sub_100003674, 0, &type metadata for AssetMovieViewControllerView, &type metadata for Text, v15, &protocol witness table for Text);
  v28 = sub_100004104;
  v29 = 0;
  v30 = 0;
  v16 = sub_100004C5C();
  View.tabItem<A>(_:)(sub_100003688, 0, &type metadata for AirDropImages, &type metadata for Text, v16, &protocol witness table for Text);
  v17 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v17(v12, v14, v8);
  v18 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  v19 = v2;
  v18(v5, v7, v1);
  v20 = v27;
  v17(v27, v12, v8);
  v21 = sub_100004B94(&qword_100014520);
  v18(&v20[*(int *)(v21 + 48)], v5, v1);
  v22 = *(void (**)(char *, uint64_t))(v19 + 8);
  v22(v7, v1);
  v23 = *(void (**)(char *, uint64_t))(v26 + 8);
  v23(v14, v8);
  v22(v5, v1);
  return ((uint64_t (*)(char *, uint64_t))v23)(v12, v8);
}

uint64_t sub_100003674@<X0>(uint64_t a1@<X8>)
{
  return sub_1000036A0(a1);
}

uint64_t sub_100003688@<X0>(uint64_t a1@<X8>)
{
  return sub_1000036A0(a1);
}

uint64_t sub_1000036A0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;

  v2 = LocalizedStringKey.init(stringLiteral:)();
  result = Text.init(_:tableName:bundle:comment:)(v2);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5 & 1;
  *(_QWORD *)(a1 + 24) = v6;
  return result;
}

uint64_t sub_1000036FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = sub_100004B94(&qword_1000144D0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100004B94(&qword_1000144D8);
  v5 = sub_100005E0C(&qword_1000144E0, &qword_1000144D8, (uint64_t)&protocol conformance descriptor for TabView<A, B>);
  WindowGroup.init(id:title:lazyContent:)(0, 0, 0, 0, 0, 0, sub_1000033F0, 0, v4, v5);
  v6 = sub_100005E0C(&qword_1000144E8, &qword_1000144D0, (uint64_t)&protocol conformance descriptor for WindowGroup<A>);
  static SceneBuilder.buildBlock<A>(_:)(v3, v0, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

id sub_100003814()
{
  uint64_t v0;

  v0 = type metadata accessor for AssetMovieViewController();
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v0)), "init");
}

uint64_t sub_100003848(uint64_t a1, char a2)
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)(a1, a2 & 1);
}

uint64_t sub_100003880(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100005E5C();
  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000038D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6;

  v6 = sub_100005E5C();
  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100003920()
{
  return static View._viewListCount(inputs:)();
}

void sub_100003938(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100005E5C();
  UIViewControllerRepresentable.body.getter(a1, v2);
  __break(1u);
}

uint64_t sub_10000395C@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_100003968()
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
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)();
  uint64_t v19;
  uint64_t (*v20)@<X0>(uint64_t *@<X8>);
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  void (*v37)(unint64_t, char *, uint64_t);
  uint64_t v38;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v40;
  char v41;
  unint64_t v42;
  uint64_t v43;
  _BOOL8 v44;
  uint64_t v45;
  char v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  BOOL v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  _QWORD *v65;
  unint64_t v66;
  char v67;
  char *v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  uint64_t KeyPath;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t result;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void (*v95)(char *, char *, uint64_t);
  uint64_t v96;
  uint64_t v97;
  char *v98;
  char *v99;
  uint64_t v100;
  void (*v101)(unint64_t, char *, uint64_t);
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t (*v105)@<X0>(uint64_t *@<X8>);
  uint64_t (*v106)();
  uint64_t v107;
  uint64_t v108;
  _QWORD *v109;

  v1 = v0;
  v2 = sub_100004B94(&qword_100014528);
  v3 = *(_QWORD *)(v2 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v91 = (char *)&v87 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for iosmacHardware(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  v9 = __chkstk_darwin(v8);
  v98 = (char *)&v87 - v10;
  v11 = __chkstk_darwin(v9);
  v99 = (char *)&v87 - v12;
  v13 = static iosmacHardware.allCases.getter(v11);
  *(_QWORD *)(v1 + 16) = v13;
  v14 = (_QWORD *)sub_100003F5C((uint64_t)&_swiftEmptyArrayStorage);
  if (*(_QWORD *)(v13 + 16))
  {
    v106 = *(uint64_t (**)())(v13 + 16);
    v88 = v3;
    v89 = v2;
    v90 = v1;
    v15 = *(unsigned __int8 *)(v6 + 80);
    v16 = (v15 + 32) & ~v15;
    v17 = v13 + v16;
    v93 = *(_QWORD *)(v6 + 72);
    v107 = v16;
    v96 = v15 | 7;
    v97 = v16 + v7;
    v95 = *(void (**)(char *, char *, uint64_t))(v6 + 16);
    v87 = v13;
    swift_bridgeObjectRetain(v13);
    v18 = 0;
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v22 = (char *)&v87 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
    v23 = v99;
    v24 = v6;
    v94 = v6;
    v92 = v5;
    while (1)
    {
      v103 = v19;
      v104 = v21;
      v108 = (uint64_t)v18;
      v105 = v20;
      v102 = v17;
      v25 = v95;
      v26 = ((uint64_t (*)(char *, uint64_t, uint64_t))v95)(v23, v17, v5);
      v27 = v14;
      v28 = v24;
      v29 = v5;
      v30 = iosmacHardware.imageName.getter(v26);
      v32 = v31 ? v30 : 7104878;
      v33 = v31 ? v31 : 0xE300000000000000;
      v34 = v23;
      v35 = v98;
      v25(v98, v34, v5);
      v36 = swift_allocObject(&unk_100010BA0, v97, v96);
      *(_QWORD *)(v36 + 16) = v32;
      *(_QWORD *)(v36 + 24) = v33;
      v37 = *(void (**)(unint64_t, char *, uint64_t))(v28 + 32);
      v14 = v27;
      v101 = v37;
      v37(v36 + v107, v35, v29);
      swift_bridgeObjectRetain(v33);
      sub_100004FE0(v108, v103);
      v25(v22, v34, v29);
      v38 = swift_allocObject(&unk_100010BC8, 32, 7);
      *(_QWORD *)(v38 + 16) = sub_100004F80;
      *(_QWORD *)(v38 + 24) = v36;
      v108 = v38;
      sub_100004FE0((uint64_t)v105, v104);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v27);
      v109 = v14;
      v40 = v32;
      v42 = sub_100004EA8(v32, v33);
      v43 = v14[2];
      v44 = (v41 & 1) == 0;
      v45 = v43 + v44;
      if (__OFADD__(v43, v44))
        break;
      v46 = v41;
      v47 = v22;
      v48 = v14[3];
      v100 = v36;
      if (v48 >= v45)
      {
        v49 = v33;
        v24 = v94;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_100005458();
          v14 = v109;
        }
      }
      else
      {
        sub_10000502C(v45, isUniquelyReferenced_nonNull_native);
        v14 = v109;
        v49 = v33;
        v50 = sub_100004EA8(v40, v33);
        v24 = v94;
        if ((v46 & 1) != (v51 & 1))
          goto LABEL_28;
        v42 = v50;
      }
      swift_bridgeObjectRelease(0x8000000000000000);
      v52 = swift_bridgeObjectRetain(v14);
      if ((v46 & 1) == 0)
      {
        v53 = (*(uint64_t (**)(uint64_t))(v108 + 16))(v52);
        v14[(v42 >> 6) + 8] |= 1 << v42;
        v54 = (uint64_t *)(v14[6] + 16 * v42);
        *v54 = v40;
        v54[1] = v49;
        v55 = (uint64_t *)(v14[7] + 32 * v42);
        *v55 = v53;
        v55[1] = v56;
        v55[2] = v57;
        v55[3] = v58;
        v59 = v14[2];
        v60 = __OFADD__(v59, 1);
        v61 = v59 + 1;
        if (v60)
          goto LABEL_27;
        v14[2] = v61;
        swift_bridgeObjectRetain(v49);
      }
      v62 = v14[7];
      swift_bridgeObjectRelease(v14);
      v63 = v62 + 32 * v42;
      v66 = *(_QWORD *)(v63 + 24);
      v65 = (_QWORD *)(v63 + 24);
      v64 = v66;
      v67 = swift_isUniquelyReferenced_nonNull_native(v66);
      *v65 = v66;
      v68 = v47;
      if ((v67 & 1) == 0)
      {
        v64 = sub_100004CA0(0, *(_QWORD *)(v64 + 16) + 1, 1, v64);
        *v65 = v64;
      }
      v23 = v99;
      v70 = *(_QWORD *)(v64 + 16);
      v69 = *(_QWORD *)(v64 + 24);
      v71 = v107;
      if (v70 >= v69 >> 1)
      {
        v77 = sub_100004CA0(v69 > 1, v70 + 1, 1, v64);
        v71 = v107;
        v64 = v77;
        *v65 = v77;
      }
      *(_QWORD *)(v64 + 16) = v70 + 1;
      v72 = v64 + v71;
      v5 = v92;
      v73 = v93;
      v74 = v68;
      v101(v72 + v70 * v93, v68, v92);
      swift_bridgeObjectRelease(v49);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v23, v5);
      v17 = v102 + v73;
      v18 = sub_100004F80;
      v75 = v100;
      v19 = v100;
      v20 = sub_100005000;
      v76 = v108;
      v21 = v108;
      v106 = (uint64_t (*)())((char *)v106 - 1);
      v22 = v74;
      if (!v106)
      {
        swift_bridgeObjectRelease(v87);
        v106 = sub_100004F80;
        v107 = 0x100005000;
        v2 = v89;
        v1 = v90;
        v3 = v88;
        goto LABEL_25;
      }
    }
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
    __break(1u);
  }
  else
  {
    v106 = 0;
    v107 = 0;
    v75 = 0;
    v76 = 0;
LABEL_25:
    v78 = swift_bridgeObjectRetain(v14);
    v79 = sub_100005870(v78);
    swift_bridgeObjectRelease(v14);
    v109 = v79;
    KeyPath = swift_getKeyPath(&unk_10000DC88);
    v81 = v91;
    KeyPathComparator.init<A>(_:order:)(KeyPath, 0, &protocol witness table for String);
    v82 = sub_100004B94(&qword_100014530);
    v83 = sub_100005E0C(&qword_100014538, &qword_100014530, (uint64_t)&protocol conformance descriptor for [A]);
    v84 = sub_100005E0C(&qword_100014540, &qword_100014528, (uint64_t)&protocol conformance descriptor for KeyPathComparator<A>);
    v85 = Sequence.sorted<A>(using:)(v81, v82, v2, v83, v84);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v81, v2);
    swift_bridgeObjectRelease(v109);
    *(_QWORD *)(v1 + 24) = v85;
    swift_bridgeObjectRelease(v14);
    sub_100004FE0((uint64_t)v106, v75);
    sub_100004FE0(v107, v76);
    return v1;
  }
  return result;
}

unint64_t sub_100003F5C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t result;
  char v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100004B94(&qword_100014548);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (uint64_t *)(a1 + 40);
  while (1)
  {
    v7 = *(v6 - 1);
    v8 = *v6;
    v9 = v6[1];
    v18 = *((_OWORD *)v6 + 1);
    v10 = v6[4];
    swift_bridgeObjectRetain(*v6);
    swift_bridgeObjectRetain(v18);
    swift_retain(*((_QWORD *)&v18 + 1));
    swift_bridgeObjectRetain(v10);
    result = sub_100004EA8(v7, v8);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v4[6] + 16 * result);
    *v13 = v7;
    v13[1] = v8;
    v14 = v4[7] + 32 * result;
    *(_QWORD *)v14 = v9;
    *(_OWORD *)(v14 + 8) = v18;
    *(_QWORD *)(v14 + 24) = v10;
    v15 = v4[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_11;
    v4[2] = v17;
    v6 += 6;
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

uint64_t sub_1000040B0()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  return swift_deallocClassInstance(v0, 32, 7);
}

uint64_t sub_1000040DC@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  result = ObservableObject<>.objectWillChange.getter(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_100004104()
{
  uint64_t v0;
  uint64_t v1;

  v0 = type metadata accessor for AirDropImages.Model();
  v1 = swift_allocObject(v0, 32, 7);
  sub_100003968();
  return v1;
}

uint64_t sub_100004138(uint64_t *a1)
{
  uint64_t v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v7[3];
  __int128 v8;
  uint64_t v9;
  _QWORD v10[2];

  v1 = *a1;
  v9 = a1[3];
  v10[0] = v1;
  v7[2] = v1;
  v2 = *(_OWORD *)(a1 + 1);
  v10[1] = a1[1];
  v8 = v2;
  swift_bridgeObjectRetain(v2);
  v3 = sub_100004B94(&qword_100014590);
  v4 = sub_100005E0C(&qword_100014588, &qword_100014590, (uint64_t)&protocol conformance descriptor for VStack<A>);
  v5 = sub_100005D20();
  return Section<>.init<A>(_:content:)(v10, sub_100005D14, v7, v3, &type metadata for String, v4, v5);
}

uint64_t sub_1000041E8@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v6;

  *(_QWORD *)a3 = static HorizontalAlignment.leading.getter();
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 1;
  v6 = sub_100004B94(&qword_1000145B0);
  return sub_10000425C(a1, a2, (char *)(a3 + *(int *)(v6 + 44)));
}

uint64_t sub_10000425C@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, char *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
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
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  void (*v20)(char *, uint64_t);
  uint64_t v22;
  uint64_t v23;

  v6 = sub_100004B94(&qword_1000145B8);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v22 - v11;
  v23 = a2;
  swift_retain(a1);
  swift_bridgeObjectRetain(a2);
  v13 = sub_100004B94(&qword_1000145C0);
  v14 = sub_100004B94(&qword_1000145C8);
  v15 = sub_100005E0C(&qword_1000145D0, &qword_1000145C0, (uint64_t)&protocol conformance descriptor for [A]);
  v16 = sub_100005E0C(&qword_1000145D8, &qword_1000145C8, (uint64_t)&protocol conformance descriptor for HStack<A>);
  v17 = sub_100005D64(&qword_1000145E0, 255, (uint64_t (*)(uint64_t))&type metadata accessor for iosmacHardware, (uint64_t)&protocol conformance descriptor for iosmacHardware);
  ForEach<>.init(_:content:)(&v23, sub_100004430, 0, v13, &type metadata for String, v14, v15, v16, v17);
  v18 = *(void (**)(char *, char *, uint64_t))(v7 + 16);
  v18(v10, v12, v6);
  *(_QWORD *)a3 = a1;
  v19 = sub_100004B94(&qword_1000145E8);
  v18(&a3[*(int *)(v19 + 48)], v10, v6);
  v20 = *(void (**)(char *, uint64_t))(v7 + 8);
  swift_retain(a1);
  v20(v12, v6);
  v20(v10, v6);
  return swift_release(a1);
}

__n128 sub_100004430@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;
  uint64_t v4;
  __n128 result;
  __n128 v6;
  char v7;
  uint64_t v8;

  v2 = static VerticalAlignment.center.getter();
  sub_100004498((uint64_t)&v6);
  v3 = v7;
  v4 = v8;
  result = v6;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
  *(__n128 *)(a1 + 24) = result;
  *(_BYTE *)(a1 + 40) = v3;
  *(_QWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t sub_100004498@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  Swift::String v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  Swift::String v13;
  Swift::String v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _BYTE v20[16];

  v2 = type metadata accessor for iosmacHardware.Model(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v5 = &v20[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for LocalizedStringKey.StringInterpolation(0);
  __chkstk_darwin();
  v7 = &v20[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)(3, 1);
  v8._countAndFlagsBits = 0;
  v8._object = (void *)0xE000000000000000;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v8);
  v9 = iosmacHardware.model.getter();
  v10 = iosmacHardware.Model.id.getter(v9);
  v12 = v11;
  (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
  v13._countAndFlagsBits = v10;
  v13._object = v12;
  LocalizedStringKey.StringInterpolation.appendInterpolation(_:)(v13);
  swift_bridgeObjectRelease(v12);
  v14._countAndFlagsBits = 2108704;
  v14._object = (void *)0xE300000000000000;
  LocalizedStringKey.StringInterpolation.appendLiteral(_:)(v14);
  v15 = LocalizedStringKey.init(stringInterpolation:)(v7);
  result = Text.init(_:tableName:bundle:comment:)(v15);
  *(_QWORD *)a1 = result;
  *(_QWORD *)(a1 + 8) = v17;
  *(_BYTE *)(a1 + 16) = v18 & 1;
  *(_QWORD *)(a1 + 24) = v19;
  return result;
}

uint64_t sub_100004604()
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
  unint64_t v10;
  _QWORD v12[5];
  uint64_t v13;

  v1 = *v0;
  v2 = v0[1];
  v3 = *((unsigned __int8 *)v0 + 16);
  v4 = type metadata accessor for AirDropImages.Model();
  v6 = sub_100005D64(&qword_100014560, v5, (uint64_t (*)(uint64_t))type metadata accessor for AirDropImages.Model, (uint64_t)&unk_10000DC0C);
  v7 = StateObject.wrappedValue.getter(v1, v2, v3, v4, v6);
  v8 = *(_QWORD *)(v7 + 24);
  swift_bridgeObjectRetain(v8);
  swift_release(v7);
  v12[4] = 0;
  v13 = v8;
  v12[2] = &v13;
  v12[3] = sub_100004138;
  v9 = sub_100004B94(&qword_100014568);
  v10 = sub_100005B74();
  List<>.init(content:)(sub_100005B68, v12, v9, v10);
  return swift_bridgeObjectRelease(v13);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_100004714();
  static App.main()();
  return 0;
}

unint64_t sub_100004714()
{
  unint64_t result;

  result = qword_100014420;
  if (!qword_100014420)
  {
    result = swift_getWitnessTable(&unk_10000DC44, &type metadata for ProductKitViewerApp);
    atomic_store(result, (unint64_t *)&qword_100014420);
  }
  return result;
}

uint64_t type metadata accessor for AirDropImages.Model()
{
  return objc_opt_self(_TtCV16ProductKitViewer13AirDropImages5Model);
}

uint64_t sub_10000477C(uint64_t a1, uint64_t a2)
{
  return swift_retain(a2);
}

uint64_t destroy for AirDropImages(uint64_t *a1)
{
  return sub_100004794(*a1, a1[1]);
}

uint64_t sub_100004794(uint64_t a1, uint64_t a2)
{
  return swift_release(a2);
}

uint64_t _s16ProductKitViewer13AirDropImagesVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_10000477C(*(_QWORD *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for AirDropImages(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_10000477C(*(_QWORD *)a2, v4);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_100004794(v6, v7);
  return a1;
}

__n128 initializeWithTake for AirDropImages(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AirDropImages(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_100004794(v4, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for AirDropImages(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AirDropImages(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for AirDropImages()
{
  return &type metadata for AirDropImages;
}

uint64_t initializeBufferWithCopyOfBuffer for AirDropImages.Model.Row(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for AirDropImages.Model.Row(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[1]);
  swift_release(a1[2]);
  return swift_bridgeObjectRelease(a1[3]);
}

_QWORD *initializeWithCopy for AirDropImages.Model.Row(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[2];
  v5 = a2[3];
  a1[2] = v4;
  a1[3] = v5;
  ((void (*)(void))swift_bridgeObjectRetain)();
  swift_retain(v4);
  swift_bridgeObjectRetain(v5);
  return a1;
}

_QWORD *assignWithCopy for AirDropImages.Model.Row(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  v6 = a2[2];
  v7 = a1[2];
  a1[2] = v6;
  swift_retain(v6);
  swift_release(v7);
  v8 = a2[3];
  v9 = a1[3];
  a1[3] = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  return a1;
}

__n128 initializeWithTake for AirDropImages.Model.Row(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_QWORD *assignWithTake for AirDropImages.Model.Row(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  *a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease(a1[1]);
  v4 = a1[2];
  *(_OWORD *)(a1 + 1) = *(_OWORD *)(a2 + 8);
  swift_release(v4);
  v5 = a1[3];
  a1[3] = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease(v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for AirDropImages.Model.Row(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AirDropImages.Model.Row(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for AirDropImages.Model.Row()
{
  return &type metadata for AirDropImages.Model.Row;
}

ValueMetadata *type metadata accessor for ProductKitViewerApp()
{
  return &type metadata for ProductKitViewerApp;
}

void *sub_100004B5C()
{
  return &protocol witness table for String;
}

uint64_t sub_100004B68(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000E848, 1);
}

void *sub_100004B78()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_100004B84(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000E820, 1);
}

uint64_t sub_100004B94(uint64_t *a1)
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

uint64_t sub_100004BD4(uint64_t *a1)
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

unint64_t sub_100004C18()
{
  unint64_t result;

  result = qword_100014510;
  if (!qword_100014510)
  {
    result = swift_getWitnessTable(&unk_10000DD48, &type metadata for AssetMovieViewControllerView);
    atomic_store(result, (unint64_t *)&qword_100014510);
  }
  return result;
}

unint64_t sub_100004C5C()
{
  unint64_t result;

  result = qword_100014518;
  if (!qword_100014518)
  {
    result = swift_getWitnessTable(&unk_10000DBBC, &type metadata for AirDropImages);
    atomic_store(result, (unint64_t *)&qword_100014518);
  }
  return result;
}

uint64_t sub_100004CA0(char a1, int64_t a2, char a3, unint64_t a4)
{
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
  size_t v16;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
LABEL_29:
        result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division by zero", 16, 2, "Swift/IntegerTypes.swift", 24, 2, 14377, 0);
LABEL_31:
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
  v10 = sub_100004B94(&qword_100014558);
  v11 = *(_QWORD *)(type metadata accessor for iosmacHardware(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = j__malloc_size(v15);
  if (!v12)
    goto LABEL_29;
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
  {
    result = _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Division results in an overflow", 31, 2, "Swift/IntegerTypes.swift", 24, 2, 14384, 0);
    goto LABEL_31;
  }
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = type metadata accessor for iosmacHardware(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v15 + v20;
  if ((a1 & 1) != 0)
  {
    v22 = a4 + v20;
    if ((unint64_t)v15 < a4 || v21 >= v22 + *(_QWORD *)(v19 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack((char *)v15 + v20, v22, v8, v18);
    }
    else if (v15 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront((char *)v15 + v20);
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_100005A50(0, v8, v21, a4);
  }
  swift_bridgeObjectRelease(a4);
  return (uint64_t)v15;
}

unint64_t sub_100004EA8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100005378(a1, a2, v5);
}

uint64_t sub_100004F0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for iosmacHardware(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 32) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100004F80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  type metadata accessor for iosmacHardware(0);
  v1 = *(_QWORD *)(v0 + 16);
  v2 = swift_bridgeObjectRetain(*(_QWORD *)(v0 + 24));
  iosmacHardware.image.getter(v2);
  return v1;
}

uint64_t sub_100004FE0(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_100004FF0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100005000@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = (*(uint64_t (**)(void))(v1 + 16))();
  *a1 = result;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  return result;
}

Swift::Int sub_10000502C(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  Swift::Int result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  int64_t v39;
  uint64_t v40;
  char v41;
  __int128 v42;
  _QWORD v43[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100004B94(&qword_100014548);
  v41 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v40 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v38 = v3;
  v39 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain(v5);
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v21 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v22 = v21 | (v14 << 6);
      goto LABEL_34;
    }
    v23 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v23 >= v39)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v40 + 8 * v23);
    ++v14;
    if (!v25)
    {
      v14 = v23 + 1;
      if (v23 + 1 >= v39)
        goto LABEL_36;
      v25 = *(_QWORD *)(v40 + 8 * v14);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v39)
        {
LABEL_36:
          swift_release(v5);
          v3 = v38;
          if ((v41 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v25 = *(_QWORD *)(v40 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v14 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_45;
            if (v14 >= v39)
              goto LABEL_36;
            v25 = *(_QWORD *)(v40 + 8 * v14);
            ++v26;
            if (v25)
              goto LABEL_33;
          }
        }
        v14 = v26;
      }
    }
LABEL_33:
    v11 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v14 << 6);
LABEL_34:
    v31 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v22);
    v33 = *v31;
    v32 = v31[1];
    v34 = *(_QWORD *)(v5 + 56) + 32 * v22;
    v35 = *(_QWORD *)v34;
    v42 = *(_OWORD *)(v34 + 8);
    v36 = *(_QWORD *)(v34 + 24);
    if ((v41 & 1) == 0)
    {
      swift_bridgeObjectRetain(v32);
      swift_bridgeObjectRetain(v42);
      swift_retain(*((_QWORD *)&v42 + 1));
      swift_bridgeObjectRetain(v36);
    }
    Hasher.init(_seed:)(v43, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v43, v33, v32);
    result = Hasher._finalize()();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v29 = v17 == v28;
        if (v17 == v28)
          v17 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v30 == -1);
      v18 = __clz(__rbit64(~v30)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v33;
    v19[1] = v32;
    v20 = *(_QWORD *)(v8 + 56) + 32 * v18;
    *(_QWORD *)v20 = v35;
    *(_OWORD *)(v20 + 8) = v42;
    *(_QWORD *)(v20 + 24) = v36;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v38;
  v24 = (_QWORD *)(v5 + 64);
  if ((v41 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v37 = 1 << *(_BYTE *)(v5 + 32);
  if (v37 >= 64)
    bzero(v24, ((unint64_t)(v37 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v37;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

unint64_t sub_100005378(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
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
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

void *sub_100005458()
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
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;
  __int128 v29;

  v1 = v0;
  sub_100004B94(&qword_100014548);
  v2 = *v0;
  v3 = static _DictionaryStorage.copy(original:)(*v0);
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release(v2);
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
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
    v26 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v13)
      goto LABEL_26;
    v27 = *(_QWORD *)(v6 + 8 * v26);
    ++v9;
    if (!v27)
    {
      v9 = v26 + 1;
      if (v26 + 1 >= v13)
        goto LABEL_26;
      v27 = *(_QWORD *)(v6 + 8 * v9);
      if (!v27)
        break;
    }
LABEL_25:
    v12 = (v27 - 1) & v27;
    v15 = __clz(__rbit64(v27)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    v21 = *(_QWORD *)(v2 + 56) + v20;
    v22 = *(_QWORD *)v21;
    v23 = *(_QWORD *)(v21 + 24);
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    v29 = *(_OWORD *)(v21 + 8);
    *v24 = v19;
    v24[1] = v18;
    v25 = *(_QWORD *)(v4 + 56) + v20;
    *(_QWORD *)v25 = v22;
    *(_OWORD *)(v25 + 8) = v29;
    *(_QWORD *)(v25 + 24) = v23;
    swift_bridgeObjectRetain(v18);
    swift_bridgeObjectRetain(v29);
    swift_retain(*((_QWORD *)&v29 + 1));
    result = (void *)swift_bridgeObjectRetain(v23);
  }
  v28 = v26 + 2;
  if (v28 >= v13)
    goto LABEL_26;
  v27 = *(_QWORD *)(v6 + 8 * v28);
  if (v27)
  {
    v9 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v27 = *(_QWORD *)(v6 + 8 * v9);
    ++v28;
    if (v27)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

_QWORD *sub_100005648(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;

  v5 = a4 + 64;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v7 = ~(-1 << -(char)v6);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v11 = 0;
    v9 = 0;
LABEL_39:
    *result = a4;
    result[1] = v5;
    result[2] = ~v6;
    result[3] = v11;
    result[4] = v8;
    return (_QWORD *)v9;
  }
  v9 = a3;
  if (!a3)
  {
    v11 = 0;
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v10 = a2;
  v23 = -1 << *(_BYTE *)(a4 + 32);
  v24 = result;
  v11 = 0;
  v12 = 0;
  v13 = (unint64_t)(63 - v6) >> 6;
  if (!v8)
    goto LABEL_9;
LABEL_8:
  v14 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  v15 = v14 | (v11 << 6);
  while (1)
  {
    ++v12;
    v19 = (_QWORD *)(*(_QWORD *)(a4 + 56) + 32 * v15);
    v20 = v19[1];
    v22 = v19[2];
    v21 = v19[3];
    *v10 = *v19;
    v10[1] = v20;
    v10[2] = v22;
    v10[3] = v21;
    if (v12 == v9)
    {
      swift_bridgeObjectRetain(v20);
      swift_retain(v22);
      swift_bridgeObjectRetain(v21);
      goto LABEL_38;
    }
    v10 += 4;
    swift_bridgeObjectRetain(v20);
    swift_retain(v22);
    result = (_QWORD *)swift_bridgeObjectRetain(v21);
    if (v8)
      goto LABEL_8;
LABEL_9:
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v16 >= v13)
      goto LABEL_33;
    v17 = *(_QWORD *)(v5 + 8 * v16);
    if (!v17)
    {
      v11 += 2;
      if (v16 + 1 >= v13)
      {
        v8 = 0;
        v11 = v16;
      }
      else
      {
        v17 = *(_QWORD *)(v5 + 8 * v11);
        if (v17)
          goto LABEL_14;
        v18 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_33;
        v17 = *(_QWORD *)(v5 + 8 * v18);
        if (v17)
        {
LABEL_17:
          v16 = v18;
          goto LABEL_18;
        }
        v11 = v16 + 3;
        if (v16 + 3 < v13)
        {
          v17 = *(_QWORD *)(v5 + 8 * v11);
          if (v17)
          {
LABEL_14:
            v16 = v11;
            goto LABEL_18;
          }
          v18 = v16 + 4;
          if (v16 + 4 >= v13)
          {
LABEL_33:
            v8 = 0;
            goto LABEL_37;
          }
          v17 = *(_QWORD *)(v5 + 8 * v18);
          if (!v17)
          {
            while (1)
            {
              v16 = v18 + 1;
              if (__OFADD__(v18, 1))
                goto LABEL_42;
              if (v16 >= v13)
              {
                v8 = 0;
                v11 = v13 - 1;
                goto LABEL_37;
              }
              v17 = *(_QWORD *)(v5 + 8 * v16);
              ++v18;
              if (v17)
                goto LABEL_18;
            }
          }
          goto LABEL_17;
        }
        v8 = 0;
        v11 = v16 + 2;
      }
LABEL_37:
      v9 = v12;
LABEL_38:
      v6 = v23;
      result = v24;
      goto LABEL_39;
    }
LABEL_18:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v16 << 6);
    v11 = v16;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

_QWORD *sub_100005870(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v10;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return &_swiftEmptyArrayStorage;
  v3 = sub_100004B94(&qword_100014550);
  v4 = (_QWORD *)swift_allocObject(v3, 32 * v1 + 32, 7);
  v5 = j__malloc_size(v4);
  v6 = v5 - 32;
  if (v5 < 32)
    v6 = v5 - 1;
  v4[2] = v1;
  v4[3] = 2 * (v6 >> 5);
  v7 = sub_100005648(&v10, v4 + 4, v1, a1);
  v8 = v10;
  swift_bridgeObjectRetain(a1);
  sub_100005954(v8);
  if (v7 != (_QWORD *)v1)
  {
    __break(1u);
    return &_swiftEmptyArrayStorage;
  }
  return v4;
}

uint64_t sub_100005954(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100005960(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;

  v13 = *a1;
  v5 = v13;
  v6 = swift_allocObject(&unk_100010BF0, 32, 7);
  *(_QWORD *)(v6 + 16) = a2;
  *(_QWORD *)(v6 + 24) = a3;
  swift_bridgeObjectRetain(v5);
  swift_retain(a3);
  v7 = sub_100004B94(&qword_100014530);
  v8 = sub_100004B94(&qword_100014580);
  v9 = sub_100005E0C(&qword_100014598, &qword_100014530, (uint64_t)&protocol conformance descriptor for [A]);
  v10 = sub_100005BD8();
  v11 = sub_100005CD0();
  return ForEach<>.init(_:content:)(&v13, sub_100005C8C, v6, v7, &type metadata for String, v8, v9, v10, v11);
}

uint64_t sub_100005A50(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v4 < 0)
  {
LABEL_9:
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
    goto LABEL_11;
  }
  v8 = *(_QWORD *)(type metadata accessor for iosmacHardware(0) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = *(_QWORD *)(v8 + 72);
  v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
  v12 = v10 * v4;
  v13 = a3 + v12;
  v14 = v11 + v12;
  if (v11 >= v13 || v14 <= a3)
  {
    swift_arrayInitWithCopy(a3);
    return v13;
  }
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_100005B68()
{
  uint64_t v0;

  return sub_100005960(*(uint64_t **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

unint64_t sub_100005B74()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100014570;
  if (!qword_100014570)
  {
    v1 = sub_100004BD4(&qword_100014568);
    sub_100005BD8();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v1);
    atomic_store(result, (unint64_t *)&qword_100014570);
  }
  return result;
}

unint64_t sub_100005BD8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100014578;
  if (!qword_100014578)
  {
    v1 = sub_100004BD4(&qword_100014580);
    sub_100005E0C(&qword_100014588, &qword_100014590, (uint64_t)&protocol conformance descriptor for VStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> Section<A, B, C>, v1);
    atomic_store(result, (unint64_t *)&qword_100014578);
  }
  return result;
}

uint64_t sub_100005C68()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100005C8C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v3;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v3 = a1[3];
  v5 = *a1;
  v6 = *(_OWORD *)(a1 + 1);
  v7 = v3;
  return v2(&v5);
}

unint64_t sub_100005CD0()
{
  unint64_t result;

  result = qword_1000145A0;
  if (!qword_1000145A0)
  {
    result = swift_getWitnessTable(&unk_10000DB84, &type metadata for AirDropImages.Model.Row);
    atomic_store(result, (unint64_t *)&qword_1000145A0);
  }
  return result;
}

uint64_t sub_100005D14@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1000041E8(*(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), a1);
}

unint64_t sub_100005D20()
{
  unint64_t result;

  result = qword_1000145A8;
  if (!qword_1000145A8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_1000145A8);
  }
  return result;
}

uint64_t sub_100005D64(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = swift_getWitnessTable(a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for AssetMovieViewControllerView()
{
  return &type metadata for AssetMovieViewControllerView;
}

uint64_t sub_100005DB4()
{
  return sub_100005E0C(&qword_1000144E8, &qword_1000144D0, (uint64_t)&protocol conformance descriptor for WindowGroup<A>);
}

uint64_t sub_100005DE0()
{
  return sub_100005E0C(&qword_1000145F0, &qword_1000145F8, (uint64_t)&protocol conformance descriptor for List<A, B>);
}

uint64_t sub_100005E0C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100004BD4(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

void *sub_100005E50()
{
  return &protocol witness table for Never;
}

unint64_t sub_100005E5C()
{
  unint64_t result;

  result = qword_100014600;
  if (!qword_100014600)
  {
    result = swift_getWitnessTable(&unk_10000DCD0, &type metadata for AssetMovieViewControllerView);
    atomic_store(result, (unint64_t *)&qword_100014600);
  }
  return result;
}

uint64_t sub_100005EA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = v0 + OBJC_IVAR____TtC16ProductKitViewer24MobileAssetBundleManager_repositoryURL;
  v2 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + OBJC_IVAR____TtC16ProductKitViewer24MobileAssetBundleManager_bundles));
  v3 = v0 + OBJC_IVAR____TtC16ProductKitViewer24MobileAssetBundleManager__selectedProduct;
  v4 = sub_100004B94(&qword_1000147C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = v0 + OBJC_IVAR____TtC16ProductKitViewer24MobileAssetBundleManager__color;
  v6 = sub_100004B94(&qword_1000147D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_release(*(_QWORD *)(v0 + OBJC_IVAR____TtC16ProductKitViewer24MobileAssetBundleManager_cancellable));
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_100005F6C()
{
  return type metadata accessor for MobileAssetBundleManager(0);
}

uint64_t type metadata accessor for MobileAssetBundleManager(uint64_t a1)
{
  uint64_t result;

  result = qword_100014648;
  if (!qword_100014648)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MobileAssetBundleManager);
  return result;
}

void sub_100005FB0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD v8[5];

  v2 = type metadata accessor for URL(319);
  if (v3 <= 0x3F)
  {
    v8[0] = *(_QWORD *)(v2 - 8) + 64;
    v8[1] = (char *)&value witness table for Builtin.BridgeObject + 64;
    sub_100006084(319, &qword_100014658, &qword_100014660);
    if (v5 <= 0x3F)
    {
      v8[2] = *(_QWORD *)(v4 - 8) + 64;
      sub_100006084(319, &qword_100014668, (uint64_t *)&unk_100014670);
      if (v7 <= 0x3F)
      {
        v8[3] = *(_QWORD *)(v6 - 8) + 64;
        v8[4] = "\b";
        swift_updateClassMetadata2(a1, 256, 5, v8, a1 + 80);
      }
    }
  }
}

void sub_100006084(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;

  if (!*a2)
  {
    v5 = sub_100004BD4(a3);
    v6 = type metadata accessor for Published(a1, v5);
    if (!v7)
      atomic_store(v6, a2);
  }
}

uint64_t sub_1000060D0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = type metadata accessor for MobileAssetBundleManager(0);
  result = ObservableObject<>.objectWillChange.getter(v2);
  *a1 = result;
  return result;
}

uint64_t *sub_10000610C(uint64_t *a1, uint64_t *a2, uint64_t a3)
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

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v16);
  }
  else
  {
    v7 = type metadata accessor for URL(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(int *)(a3 + 24);
    v10 = (char *)a1 + v8;
    v11 = (char *)a2 + v8;
    v12 = *((_QWORD *)v11 + 1);
    *(_QWORD *)v10 = *(_QWORD *)v11;
    *((_QWORD *)v10 + 1) = v12;
    v13 = *((_QWORD *)v11 + 3);
    *((_QWORD *)v10 + 2) = *((_QWORD *)v11 + 2);
    *((_QWORD *)v10 + 3) = v13;
    v14 = *((_QWORD *)v11 + 5);
    *((_QWORD *)v10 + 4) = *((_QWORD *)v11 + 4);
    *((_QWORD *)v10 + 5) = v14;
    *((_OWORD *)v10 + 3) = *((_OWORD *)v11 + 3);
    v10[64] = v11[64];
    v15 = *(uint64_t *)((char *)a2 + v9);
    *(uint64_t *)((char *)a1 + v9) = v15;
    swift_bridgeObjectRetain(v12);
    swift_bridgeObjectRetain(v13);
    swift_bridgeObjectRetain(v14);
    swift_bridgeObjectRetain(v15);
  }
  return a1;
}

uint64_t sub_1000061E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;

  v4 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = (_QWORD *)(a1 + *(int *)(a2 + 20));
  swift_bridgeObjectRelease(v5[1]);
  swift_bridgeObjectRelease(v5[3]);
  swift_bridgeObjectRelease(v5[5]);
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + *(int *)(a2 + 24)));
}

uint64_t sub_10000624C(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = a1 + v7;
  v10 = a2 + v7;
  v11 = *(_QWORD *)(v10 + 8);
  *(_QWORD *)v9 = *(_QWORD *)v10;
  *(_QWORD *)(v9 + 8) = v11;
  v12 = *(_QWORD *)(v10 + 24);
  *(_QWORD *)(v9 + 16) = *(_QWORD *)(v10 + 16);
  *(_QWORD *)(v9 + 24) = v12;
  v13 = *(_QWORD *)(v10 + 40);
  *(_QWORD *)(v9 + 32) = *(_QWORD *)(v10 + 32);
  *(_QWORD *)(v9 + 40) = v13;
  *(_OWORD *)(v9 + 48) = *(_OWORD *)(v10 + 48);
  *(_BYTE *)(v9 + 64) = *(_BYTE *)(v10 + 64);
  v14 = *(_QWORD *)(a2 + v8);
  *(_QWORD *)(a1 + v8) = v14;
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRetain(v13);
  swift_bridgeObjectRetain(v14);
  return a1;
}

uint64_t sub_1000062F4(uint64_t a1, uint64_t a2, uint64_t a3)
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
  uint64_t v18;

  v6 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_QWORD *)v8 = *(_QWORD *)(a2 + v7);
  v10 = *(_QWORD *)(a2 + v7 + 8);
  v11 = *(_QWORD *)(a1 + v7 + 8);
  *(_QWORD *)(v8 + 8) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v9 + 16);
  v12 = *(_QWORD *)(v9 + 24);
  v13 = *(_QWORD *)(v8 + 24);
  *(_QWORD *)(v8 + 24) = v12;
  swift_bridgeObjectRetain(v12);
  swift_bridgeObjectRelease(v13);
  *(_QWORD *)(v8 + 32) = *(_QWORD *)(v9 + 32);
  v14 = *(_QWORD *)(v9 + 40);
  v15 = *(_QWORD *)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v14;
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRelease(v15);
  *(_QWORD *)(v8 + 48) = *(_QWORD *)(v9 + 48);
  *(_QWORD *)(v8 + 56) = *(_QWORD *)(v9 + 56);
  *(_BYTE *)(v8 + 64) = *(_BYTE *)(v9 + 64);
  v16 = *(int *)(a3 + 24);
  v17 = *(_QWORD *)(a2 + v16);
  v18 = *(_QWORD *)(a1 + v16);
  *(_QWORD *)(a1 + v16) = v17;
  swift_bridgeObjectRetain(v17);
  swift_bridgeObjectRelease(v18);
  return a1;
}

uint64_t sub_1000063EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;

  v6 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(int *)(a3 + 24);
  v9 = a1 + v7;
  v10 = a2 + v7;
  v11 = *(_OWORD *)(v10 + 48);
  *(_OWORD *)(v9 + 32) = *(_OWORD *)(v10 + 32);
  *(_OWORD *)(v9 + 48) = v11;
  *(_BYTE *)(v9 + 64) = *(_BYTE *)(v10 + 64);
  v12 = *(_OWORD *)(v10 + 16);
  *(_OWORD *)v9 = *(_OWORD *)v10;
  *(_OWORD *)(v9 + 16) = v12;
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  return a1;
}

uint64_t sub_100006468(uint64_t a1, uint64_t a2, uint64_t a3)
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

  v6 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_QWORD *)(a2 + v7 + 8);
  v11 = *(_QWORD *)(a1 + v7 + 8);
  *(_QWORD *)v8 = *(_QWORD *)(a2 + v7);
  *(_QWORD *)(v8 + 8) = v10;
  swift_bridgeObjectRelease(v11);
  v12 = *(_QWORD *)(v9 + 24);
  v13 = *(_QWORD *)(v8 + 24);
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v9 + 16);
  *(_QWORD *)(v8 + 24) = v12;
  swift_bridgeObjectRelease(v13);
  v14 = *(_QWORD *)(v9 + 40);
  v15 = *(_QWORD *)(v8 + 40);
  *(_QWORD *)(v8 + 32) = *(_QWORD *)(v9 + 32);
  *(_QWORD *)(v8 + 40) = v14;
  swift_bridgeObjectRelease(v15);
  *(_OWORD *)(v8 + 48) = *(_OWORD *)(v9 + 48);
  *(_BYTE *)(v8 + 64) = *(_BYTE *)(v9 + 64);
  v16 = *(int *)(a3 + 24);
  v17 = *(_QWORD *)(a1 + v16);
  *(_QWORD *)(a1 + v16) = *(_QWORD *)(a2 + v16);
  swift_bridgeObjectRelease(v17);
  return a1;
}

uint64_t sub_100006520(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000652C);
}

uint64_t sub_10000652C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_1000065AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000065B8);
}

uint64_t sub_1000065B8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for MobileAssetBundle(uint64_t a1)
{
  uint64_t result;

  result = qword_100014830;
  if (!qword_100014830)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for MobileAssetBundle);
  return result;
}

uint64_t sub_100006670(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  result = type metadata accessor for URL(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = "A";
    v4[2] = (char *)&value witness table for Builtin.BridgeObject + 64;
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_1000066F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  Swift::UInt v14;
  uint64_t v15;
  Swift::UInt v17;
  Swift::UInt8 v18;

  v2 = v1;
  v4 = type metadata accessor for URL(0);
  v5 = sub_100006DA0(&qword_100014878, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
  dispatch thunk of Hashable.hash(into:)(a1, v4, v5);
  v6 = type metadata accessor for MobileAssetBundle(0);
  v7 = (uint64_t *)(v1 + *(int *)(v6 + 20));
  v8 = *v7;
  v9 = v7[1];
  v11 = v7[2];
  v10 = v7[3];
  v13 = v7[4];
  v12 = v7[5];
  v14 = v7[6];
  v17 = v7[7];
  v18 = *((_BYTE *)v7 + 64);
  swift_bridgeObjectRetain_n(v9, 2);
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRetain(v12);
  String.hash(into:)(a1, v8, v9);
  swift_bridgeObjectRelease(v9);
  swift_bridgeObjectRetain(v10);
  String.hash(into:)(a1, v11, v10);
  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRetain(v12);
  String.hash(into:)(a1, v13, v12);
  swift_bridgeObjectRelease(v12);
  Hasher._combine(_:)(v14);
  Hasher._combine(_:)(v17);
  Hasher._combine(_:)(v18);
  swift_bridgeObjectRelease(v12);
  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v9);
  v15 = *(_QWORD *)(v2 + *(int *)(v6 + 24));
  swift_bridgeObjectRetain(v15);
  sub_100006A94(a1, v15);
  return swift_bridgeObjectRelease(v15);
}

Swift::Int sub_100006868()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  sub_1000066F0((uint64_t)v1);
  return Hasher._finalize()();
}

Swift::Int sub_1000068A8(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  sub_1000066F0((uint64_t)v2);
  return Hasher._finalize()();
}

uint64_t sub_1000068E4()
{
  return sub_100006DA0(&qword_100014870, type metadata accessor for MobileAssetBundle, (uint64_t)&unk_10000DE50);
}

uint64_t sub_100006910(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  void (*v13)(char *, unint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  void (*v19)(char *, uint64_t);
  BOOL v21;
  uint64_t v23;
  uint64_t v24;

  v4 = type metadata accessor for URL(0);
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v10 = (char *)&v23 - v9;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11 == *(_QWORD *)(a2 + 16))
  {
    if (!v11 || a1 == a2)
    {
      v18 = 1;
    }
    else
    {
      v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
      v23 = *(_QWORD *)(v8 + 72);
      v24 = v8;
      v13 = *(void (**)(char *, unint64_t, uint64_t))(v8 + 16);
      v14 = v11 - 1;
      do
      {
        v15 = a1;
        v13(v10, a1 + v12, v4);
        v16 = a2;
        v13(v7, a2 + v12, v4);
        v17 = sub_100006DA0(&qword_100014888, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
        v18 = dispatch thunk of static Equatable.== infix(_:_:)(v10, v7, v4, v17);
        v19 = *(void (**)(char *, uint64_t))(v24 + 8);
        v19(v7, v4);
        v19(v10, v4);
        v21 = v14-- != 0;
        if ((v18 & 1) == 0)
          break;
        v12 += v23;
        a2 = v16;
        a1 = v15;
      }
      while (v21);
    }
  }
  else
  {
    v18 = 0;
  }
  return v18 & 1;
}

uint64_t sub_100006A94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  Swift::UInt v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  uint64_t (*v15)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100004B94(&qword_100014880);
  __chkstk_darwin(v8);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(a2 + 16);
  v19 = a1;
  Hasher._combine(_:)(v11);
  if (v11)
  {
    v12 = a2 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    v13 = *(_QWORD *)(v5 + 72);
    v14 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
    while (1)
    {
      v14(v10, v12, v4);
      v15 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
      v15(v10, 0, 1, v4);
      result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4);
      if ((_DWORD)result == 1)
        break;
      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
      v17 = sub_100006DA0(&qword_100014878, (uint64_t (*)(uint64_t))&type metadata accessor for URL, (uint64_t)&protocol conformance descriptor for URL);
      dispatch thunk of Hashable.hash(into:)(v19, v4, v17);
      (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      v12 += v13;
      if (!--v11)
        return v15(v10, 1, 1, v4);
    }
  }
  else
  {
    v15 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
    return v15(v10, 1, 1, v4);
  }
  return result;
}

uint64_t sub_100006C38(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  BOOL v19;
  BOOL v20;
  BOOL v21;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  if ((static URL.== infix(_:_:)() & 1) == 0)
    return 0;
  v23 = type metadata accessor for MobileAssetBundle(0);
  v4 = *(int *)(v23 + 20);
  v5 = *(_QWORD *)(a1 + v4);
  v6 = *(_QWORD *)(a1 + v4 + 8);
  v7 = *(_QWORD *)(a1 + v4 + 16);
  v8 = *(_QWORD *)(a1 + v4 + 24);
  v9 = *(_QWORD *)(a1 + v4 + 32);
  v10 = *(_QWORD *)(a1 + v4 + 40);
  v28 = *(_QWORD *)(a1 + v4 + 48);
  v29 = *(_QWORD *)(a1 + v4 + 56);
  v11 = *(unsigned __int8 *)(a1 + v4 + 64);
  v12 = a2 + v4;
  v13 = *(_QWORD *)(v12 + 8);
  v15 = *(_QWORD *)(v12 + 16);
  v14 = *(_QWORD *)(v12 + 24);
  v16 = *(_QWORD *)(v12 + 32);
  v17 = *(_QWORD *)(v12 + 40);
  v26 = *(_QWORD *)(v12 + 48);
  v27 = *(_QWORD *)(v12 + 56);
  v24 = *(unsigned __int8 *)(v12 + 64);
  v25 = v11;
  v18 = v5 == *(_QWORD *)v12 && v6 == v13;
  if ((v18 || (_stringCompareWithSmolCheck(_:_:expecting:)(v5, v6, *(_QWORD *)v12, v13, 0) & 1) != 0)
    && (v7 == v15 ? (v19 = v8 == v14) : (v19 = 0),
        (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)(v7, v8, v15, v14, 0) & 1) != 0)
     && (v9 == v16 ? (v20 = v10 == v17) : (v20 = 0),
         (v20 || (_stringCompareWithSmolCheck(_:_:expecting:)(v9, v10, v16, v17, 0) & 1) != 0)
      && (v28 == v26 ? (v21 = v29 == v27) : (v21 = 0), v21 && ((v25 ^ v24) & 1) == 0))))
  {
    return sub_100006910(*(_QWORD *)(a1 + *(int *)(v23 + 24)), *(_QWORD *)(a2 + *(int *)(v23 + 24)));
  }
  else
  {
    return 0;
  }
}

uint64_t sub_100006DA0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

__n128 initializeWithTake for MobileAssetProperties(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

ValueMetadata *type metadata accessor for MobileAssetProperties()
{
  return &type metadata for MobileAssetProperties;
}

uint64_t destroy for MobileAssetProperties.Color(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  return swift_bridgeObjectRelease(*(_QWORD *)(a1 + 24));
}

uint64_t initializeWithCopy for MobileAssetProperties.Color(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  return a1;
}

uint64_t assignWithCopy for MobileAssetProperties.Color(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

__n128 initializeWithTake for MobileAssetProperties.Color(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for MobileAssetProperties.Color(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRelease(v7);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for MobileAssetProperties.Color(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 33))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MobileAssetProperties.Color(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 33) = 1;
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
    *(_BYTE *)(result + 33) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MobileAssetProperties.Color()
{
  return &type metadata for MobileAssetProperties.Color;
}

uint64_t sub_100007008(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_100007040 + 4 * byte_10000DEC0[a1]))(0xD000000000000015, 0x800000010000E4B0);
}

uint64_t sub_100007040()
{
  return 19523;
}

uint64_t sub_10000704C()
{
  return 0x54746375646F7250;
}

uint64_t sub_100007070()
{
  return 0x4E746E6169726156;
}

uint64_t sub_100007090()
{
  return 0x746E65746E6F435FLL;
}

uint64_t sub_1000070B4()
{
  return 0x7269757165525F5FLL;
}

uint64_t sub_1000070D8(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_100007110 + 4 * byte_10000DEC6[a1]))(0xD000000000000015, 0x800000010000E4B0);
}

uint64_t sub_100007110()
{
  return 19523;
}

uint64_t sub_10000711C()
{
  return 0x54746375646F7250;
}

uint64_t sub_100007140()
{
  return 0x4E746E6169726156;
}

uint64_t sub_100007160()
{
  return 0x746E65746E6F435FLL;
}

uint64_t sub_100007184()
{
  return 0x7269757165525F5FLL;
}

Swift::Int sub_1000071A8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  Swift::UInt8 v5;
  _QWORD v7[9];

  v1 = *v0;
  v2 = v0[1];
  v3 = v0[2];
  v4 = v0[3];
  v5 = *((_BYTE *)v0 + 32);
  Hasher.init(_seed:)(v7, 0);
  swift_bridgeObjectRetain(v2);
  String.hash(into:)(v7, v1, v2);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRetain(v4);
  String.hash(into:)(v7, v3, v4);
  swift_bridgeObjectRelease(v4);
  Hasher._combine(_:)(v5);
  return Hasher._finalize()();
}

void sub_100007244(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  Swift::UInt8 v7;

  v3 = *v1;
  v4 = v1[1];
  v5 = v1[2];
  v6 = v1[3];
  v7 = *((_BYTE *)v1 + 32);
  swift_bridgeObjectRetain(v4);
  String.hash(into:)(a1, v3, v4);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRetain(v6);
  String.hash(into:)(a1, v5, v6);
  swift_bridgeObjectRelease(v6);
  Hasher._combine(_:)(v7);
}

Swift::Int sub_1000072C8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  Swift::UInt8 v6;
  _QWORD v8[9];

  v2 = *v1;
  v3 = v1[1];
  v4 = v1[2];
  v5 = v1[3];
  v6 = *((_BYTE *)v1 + 32);
  Hasher.init(_seed:)(v8, a1);
  swift_bridgeObjectRetain(v3);
  String.hash(into:)(v8, v2, v3);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRetain(v5);
  String.hash(into:)(v8, v4, v5);
  swift_bridgeObjectRelease(v5);
  Hasher._combine(_:)(v6);
  return Hasher._finalize()();
}

uint64_t sub_100007360(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  _OWORD v5[2];
  char v6;
  _OWORD v7[2];
  char v8;

  v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  v6 = *(_BYTE *)(a1 + 32);
  v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  v8 = *(_BYTE *)(a2 + 32);
  return sub_100009554((uint64_t)v5, (uint64_t)v7) & 1;
}

unint64_t sub_1000073AC()
{
  unint64_t result;

  result = qword_100014890;
  if (!qword_100014890)
  {
    result = swift_getWitnessTable("%1", &type metadata for MobileAssetProperties.Color);
    atomic_store(result, (unint64_t *)&qword_100014890);
  }
  return result;
}

void sub_1000073F0(char *a1)
{
  sub_1000073FC(*a1);
}

void sub_1000073FC(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_100007448(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1000074FC + 4 * byte_10000DED2[a2]))(19523);
}

uint64_t sub_1000074FC(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 19523 && v1 == 0xE200000000000000)
    v2 = 1;
  else
    v2 = _stringCompareWithSmolCheck(_:_:expecting:)();
  swift_bridgeObjectRelease(v1);
  swift_bridgeObjectRelease(0xE200000000000000);
  return v2 & 1;
}

void sub_1000075FC()
{
  char *v0;

  sub_100007604(*v0);
}

void sub_100007604(char a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, 0);
  __asm { BR              X10 }
}

Swift::Int sub_100007658()
{
  uint64_t v1;

  String.hash(into:)(&v1, 19523, 0xE200000000000000);
  swift_bridgeObjectRelease(0xE200000000000000);
  return Hasher._finalize()();
}

void sub_100007718(uint64_t a1)
{
  char *v1;

  sub_100007720(a1, *v1);
}

void sub_100007720(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_100007764(uint64_t a1)
{
  String.hash(into:)(a1, 19523, 0xE200000000000000);
  return swift_bridgeObjectRelease(0xE200000000000000);
}

void sub_100007810(uint64_t a1)
{
  char *v1;

  sub_100007818(a1, *v1);
}

void sub_100007818(uint64_t a1, char a2)
{
  _QWORD v3[9];

  Hasher.init(_seed:)(v3, a1);
  __asm { BR              X10 }
}

Swift::Int sub_100007868()
{
  uint64_t v1;

  String.hash(into:)(&v1, 19523, 0xE200000000000000);
  swift_bridgeObjectRelease(0xE200000000000000);
  return Hasher._finalize()();
}

unint64_t sub_100007928@<X0>(Swift::String *a1@<X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_1000097D0(*a1);
  *a2 = result;
  return result;
}

uint64_t sub_100007954@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_100007008(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_10000797C()
{
  unsigned __int8 *v0;

  return sub_1000070D8(*v0);
}

unint64_t sub_100007984@<X0>(Swift::String a1@<X1:X0>, _BYTE *a2@<X8>)
{
  unint64_t result;

  result = sub_1000097D0(a1);
  *a2 = result;
  return result;
}

uint64_t sub_1000079A8()
{
  return 0;
}

void sub_1000079B4(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_1000079C0(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100009B80();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000079E8(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_100009B80();
  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100007A10(_QWORD *a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  char v23;
  char v24;
  char v25;
  char v26;
  char v27;
  char v28;

  v3 = v1;
  v5 = sub_100004B94(&qword_1000148B8);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_100009B5C(a1, v9);
  v11 = sub_100009B80();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for MobileAssetProperties.CodingKeys, &type metadata for MobileAssetProperties.CodingKeys, v11, v9, v10);
  v12 = *v3;
  v13 = v3[1];
  v28 = 0;
  KeyedEncodingContainer.encode(_:forKey:)(v12, v13, &v28, v5);
  if (!v2)
  {
    v14 = v3[2];
    v15 = v3[3];
    v27 = 1;
    KeyedEncodingContainer.encode(_:forKey:)(v14, v15, &v27, v5);
    v16 = v3[4];
    v17 = v3[5];
    v26 = 2;
    KeyedEncodingContainer.encode(_:forKey:)(v16, v17, &v26, v5);
    v18 = v3[6];
    v25 = 3;
    KeyedEncodingContainer.encode(_:forKey:)(v18, &v25, v5);
    v19 = v3[7];
    v24 = 4;
    KeyedEncodingContainer.encode(_:forKey:)(v19, &v24, v5);
    v20 = *((unsigned __int8 *)v3 + 64);
    v23 = 5;
    KeyedEncodingContainer.encode(_:forKey:)(v20, &v23, v5);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

Swift::Int sub_100007BC4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[9];

  v1 = v0;
  Hasher.init(_seed:)(v9, 0);
  v2 = *v0;
  v3 = v1[1];
  swift_bridgeObjectRetain(v3);
  String.hash(into:)(v9, v2, v3);
  swift_bridgeObjectRelease(v3);
  v4 = v1[2];
  v5 = v1[3];
  swift_bridgeObjectRetain(v5);
  String.hash(into:)(v9, v4, v5);
  swift_bridgeObjectRelease(v5);
  v6 = v1[4];
  v7 = v1[5];
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(v9, v6, v7);
  swift_bridgeObjectRelease(v7);
  Hasher._combine(_:)(v1[6]);
  Hasher._combine(_:)(v1[7]);
  Hasher._combine(_:)(v1[8] & 1);
  return Hasher._finalize()();
}

__n128 sub_100007C9C@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  _OWORD v6[4];
  char v7;

  sub_100009818(a1, (uint64_t)v6);
  if (!v2)
  {
    v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_BYTE *)(a2 + 64) = v7;
    result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_100007CEC(_QWORD *a1)
{
  return sub_100007A10(a1);
}

void sub_100007D04(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Swift::UInt v9;
  Swift::UInt v10;
  Swift::UInt8 v11;

  v3 = *v1;
  v4 = v1[1];
  v5 = v1[2];
  v6 = v1[3];
  v7 = v1[4];
  v8 = v1[5];
  v9 = v1[6];
  v10 = v1[7];
  v11 = *((_BYTE *)v1 + 64);
  swift_bridgeObjectRetain(v4);
  String.hash(into:)(a1, v3, v4);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRetain(v6);
  String.hash(into:)(a1, v5, v6);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRetain(v8);
  String.hash(into:)(a1, v7, v8);
  swift_bridgeObjectRelease(v8);
  Hasher._combine(_:)(v9);
  Hasher._combine(_:)(v10);
  Hasher._combine(_:)(v11);
}

Swift::Int sub_100007DDC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  Swift::UInt v8;
  Swift::UInt v9;
  Swift::UInt8 v10;
  _QWORD v12[9];

  v2 = *v1;
  v3 = v1[1];
  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = *((_BYTE *)v1 + 64);
  Hasher.init(_seed:)(v12, a1);
  swift_bridgeObjectRetain(v3);
  String.hash(into:)(v12, v2, v3);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRetain(v5);
  String.hash(into:)(v12, v4, v5);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(v12, v6, v7);
  swift_bridgeObjectRelease(v7);
  Hasher._combine(_:)(v8);
  Hasher._combine(_:)(v9);
  Hasher._combine(_:)(v10);
  return Hasher._finalize()();
}

uint64_t sub_100007EC4(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[4];
  char v8;
  _OWORD v9[4];
  char v10;

  v2 = *(_OWORD *)(a1 + 48);
  v7[2] = *(_OWORD *)(a1 + 32);
  v7[3] = v2;
  v8 = *(_BYTE *)(a1 + 64);
  v3 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v3;
  v4 = *(_OWORD *)(a2 + 48);
  v9[2] = *(_OWORD *)(a2 + 32);
  v9[3] = v4;
  v10 = *(_BYTE *)(a2 + 64);
  v5 = *(_OWORD *)(a2 + 16);
  v9[0] = *(_OWORD *)a2;
  v9[1] = v5;
  return sub_1000095D8((uint64_t)v7, (uint64_t)v9) & 1;
}

unint64_t sub_100007F20()
{
  unint64_t result;

  result = qword_100014898;
  if (!qword_100014898)
  {
    result = swift_getWitnessTable(&unk_10000DF84, &type metadata for MobileAssetProperties);
    atomic_store(result, (unint64_t *)&qword_100014898);
  }
  return result;
}

uint64_t sub_100007F64(uint64_t result, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  unsigned int v20;
  uint64_t v21;
  char v22;
  _QWORD v23[3];

  v3 = HIBYTE(a2) & 0xF;
  v4 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v5 = v3;
  else
    v5 = result & 0xFFFFFFFFFFFFLL;
  if (!v5)
  {
    swift_bridgeObjectRelease(a2);
    return 0;
  }
  if ((a2 & 0x1000000000000000) == 0)
  {
    if ((a2 & 0x2000000000000000) == 0)
    {
      if ((result & 0x1000000000000000) != 0)
        v6 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
      else
        v6 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(result, a2);
      v7 = (uint64_t)sub_100008A28(v6, v4, 10);
      v9 = v8 & 1;
      goto LABEL_37;
    }
    v23[0] = result;
    v23[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (!v3)
        goto LABEL_50;
      if (v3 == 1 || (BYTE1(result) - 48) > 9u)
        goto LABEL_34;
      v7 = (BYTE1(result) - 48);
      v14 = v3 - 2;
      if (v14)
      {
        v15 = (unsigned __int8 *)v23 + 2;
        while (1)
        {
          v16 = *v15 - 48;
          if (v16 > 9)
            goto LABEL_34;
          v17 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v17 + v16;
          if (__OFADD__(v17, v16))
            goto LABEL_34;
          v9 = 0;
          ++v15;
          if (!--v14)
            goto LABEL_37;
        }
      }
    }
    else
    {
      if (result == 45)
      {
        if (v3)
        {
          if (v3 != 1 && (BYTE1(result) - 48) <= 9u)
          {
            v7 = -(uint64_t)(BYTE1(result) - 48);
            v10 = v3 - 2;
            if (v10)
            {
              v11 = (unsigned __int8 *)v23 + 2;
              while (1)
              {
                v12 = *v11 - 48;
                if (v12 > 9)
                  goto LABEL_34;
                v13 = 10 * v7;
                if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
                  goto LABEL_34;
                v7 = v13 - v12;
                if (__OFSUB__(v13, v12))
                  goto LABEL_34;
                v9 = 0;
                ++v11;
                if (!--v10)
                  goto LABEL_37;
              }
            }
            goto LABEL_36;
          }
LABEL_34:
          v7 = 0;
          v9 = 1;
          goto LABEL_37;
        }
        __break(1u);
LABEL_50:
        __break(1u);
        return result;
      }
      if (!v3 || (result - 48) > 9u)
        goto LABEL_34;
      v7 = (result - 48);
      v18 = v3 - 1;
      if (v18)
      {
        v19 = (unsigned __int8 *)v23 + 1;
        while (1)
        {
          v20 = *v19 - 48;
          if (v20 > 9)
            goto LABEL_34;
          v21 = 10 * v7;
          if ((unsigned __int128)(v7 * (__int128)10) >> 64 != (10 * v7) >> 63)
            goto LABEL_34;
          v7 = v21 + v20;
          if (__OFADD__(v21, v20))
            goto LABEL_34;
          v9 = 0;
          ++v19;
          if (!--v18)
            goto LABEL_37;
        }
      }
    }
LABEL_36:
    v9 = 0;
    goto LABEL_37;
  }
  v7 = (uint64_t)sub_100008944(result, a2, 10);
  v9 = v22;
LABEL_37:
  swift_bridgeObjectRelease(a2);
  if ((v9 & 1) != 0)
    return 0;
  else
    return v7;
}

BOOL sub_1000081B0(uint64_t a1, uint64_t a2)
{
  return sub_10000923C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)a2, *(_QWORD *)(a2 + 8));
}

BOOL sub_1000081C4(uint64_t a1, uint64_t a2)
{
  return !sub_10000923C(*(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

BOOL sub_1000081E8(uint64_t a1, uint64_t a2)
{
  return !sub_10000923C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)a2, *(_QWORD *)(a2 + 8));
}

BOOL sub_100008214(uint64_t a1, uint64_t a2)
{
  return sub_10000923C(*(_QWORD *)a2, *(_QWORD *)(a2 + 8), *(_QWORD *)a1, *(_QWORD *)(a1 + 8));
}

uint64_t sub_100008220(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  __int128 v11;
  __int128 v12;
  _OWORD v14[4];
  char v15;

  v2 = v1;
  v4 = sub_100004B94(&qword_1000148F8);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a1[3];
  v9 = a1[4];
  sub_100009B5C(a1, v8);
  v10 = sub_10000A224();
  dispatch thunk of Encoder.container<A>(keyedBy:)(&type metadata for MobileAssetPropertyList.CodingKeys, &type metadata for MobileAssetPropertyList.CodingKeys, v10, v8, v9);
  v11 = *(_OWORD *)(v2 + 48);
  v14[2] = *(_OWORD *)(v2 + 32);
  v14[3] = v11;
  v15 = *(_BYTE *)(v2 + 64);
  v12 = *(_OWORD *)(v2 + 16);
  v14[0] = *(_OWORD *)v2;
  v14[1] = v12;
  sub_10000A2AC();
  KeyedEncodingContainer.encode<A>(_:forKey:)(v14);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

Swift::Int sub_10000832C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  Swift::UInt v8;
  Swift::UInt v9;
  char v10;
  _QWORD v12[9];

  v1 = v0;
  Hasher.init(_seed:)(v12, 0);
  v2 = *v0;
  v3 = v1[1];
  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = *((_BYTE *)v1 + 64);
  sub_10000A2F0(v1);
  swift_bridgeObjectRetain(v3);
  String.hash(into:)(v12, v2, v3);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRetain(v5);
  String.hash(into:)(v12, v4, v5);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(v12, v6, v7);
  swift_bridgeObjectRelease(v7);
  Hasher._combine(_:)(v8);
  Hasher._combine(_:)(v9);
  Hasher._combine(_:)(v10 & 1);
  sub_10000A338(v1);
  return Hasher._finalize()();
}

uint64_t sub_100008430()
{
  return 1;
}

Swift::Int sub_100008438()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  String.hash(into:)(v1, 0xD000000000000015, 0x800000010000DEE0);
  return Hasher._finalize()();
}

uint64_t sub_10000848C(uint64_t a1)
{
  return String.hash(into:)(a1, 0xD000000000000015, 0x800000010000DEE0);
}

Swift::Int sub_1000084A8(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  String.hash(into:)(v2, 0xD000000000000015, 0x800000010000DEE0);
  return Hasher._finalize()();
}

uint64_t sub_1000084F8@<X0>(uint64_t *a1@<X0>, BOOL *a2@<X8>)
{
  Swift::String v3;
  void *v4;
  Swift::Int v5;
  uint64_t result;

  v3._countAndFlagsBits = *a1;
  v4 = (void *)a1[1];
  v3._object = v4;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_1000108E8, v3);
  result = swift_bridgeObjectRelease(v4);
  *a2 = v5 != 0;
  return result;
}

void sub_100008548(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000015;
  a1[1] = 0x800000010000DEE0;
}

unint64_t sub_100008568()
{
  return 0xD000000000000015;
}

uint64_t sub_100008584@<X0>(Swift::String string@<0:X0, 8:X1>, BOOL *a2@<X8>)
{
  void *object;
  Swift::String v3;
  Swift::Int v5;
  uint64_t result;

  object = string._object;
  v3._countAndFlagsBits = string._countAndFlagsBits;
  v3._object = object;
  v5 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100010920, v3);
  result = swift_bridgeObjectRelease(object);
  *a2 = v5 != 0;
  return result;
}

void sub_1000085D8(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_1000085E4(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000A224();
  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000860C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000A224();
  return CodingKey.debugDescription.getter(a1, v2);
}

__n128 sub_100008634@<Q0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __n128 result;
  __int128 v5;
  _OWORD v6[4];
  char v7;

  sub_10000A0C8(a1, (uint64_t)v6);
  if (!v2)
  {
    v5 = v6[3];
    *(_OWORD *)(a2 + 32) = v6[2];
    *(_OWORD *)(a2 + 48) = v5;
    *(_BYTE *)(a2 + 64) = v7;
    result = (__n128)v6[1];
    *(_OWORD *)a2 = v6[0];
    *(__n128 *)(a2 + 16) = result;
  }
  return result;
}

uint64_t sub_100008684(_QWORD *a1)
{
  return sub_100008220(a1);
}

Swift::Int sub_100008698()
{
  return sub_10000832C();
}

uint64_t sub_1000086D8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Swift::UInt v9;
  Swift::UInt v10;
  Swift::UInt8 v12;

  v4 = *v1;
  v3 = v1[1];
  v6 = v1[2];
  v5 = v1[3];
  v8 = v1[4];
  v7 = v1[5];
  v9 = v1[6];
  v10 = v1[7];
  v12 = *((_BYTE *)v1 + 64);
  swift_bridgeObjectRetain_n(v3, 2);
  swift_bridgeObjectRetain(v5);
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(a1, v4, v3);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRetain(v5);
  String.hash(into:)(a1, v6, v5);
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRetain(v7);
  String.hash(into:)(a1, v8, v7);
  swift_bridgeObjectRelease(v7);
  Hasher._combine(_:)(v9);
  Hasher._combine(_:)(v10);
  Hasher._combine(_:)(v12);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v5);
  return swift_bridgeObjectRelease(v3);
}

Swift::Int sub_1000087D8(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  Swift::UInt v8;
  Swift::UInt v9;
  Swift::UInt8 v10;
  _QWORD v12[9];

  v3 = *v1;
  v2 = v1[1];
  v5 = v1[2];
  v4 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v9 = v1[6];
  v8 = v1[7];
  v10 = *((_BYTE *)v1 + 64);
  Hasher.init(_seed:)(v12, a1);
  swift_bridgeObjectRetain_n(v2, 2);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v6);
  String.hash(into:)(v12, v3, v2);
  swift_bridgeObjectRelease(v2);
  swift_bridgeObjectRetain(v4);
  String.hash(into:)(v12, v5, v4);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRetain(v6);
  String.hash(into:)(v12, v7, v6);
  swift_bridgeObjectRelease(v6);
  Hasher._combine(_:)(v9);
  Hasher._combine(_:)(v8);
  Hasher._combine(_:)(v10);
  swift_bridgeObjectRelease(v6);
  swift_bridgeObjectRelease(v4);
  swift_bridgeObjectRelease(v2);
  return Hasher._finalize()();
}

BOOL sub_1000088EC(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[4];
  char v8;
  _OWORD v9[4];
  char v10;

  v2 = *(_OWORD *)(a1 + 48);
  v7[2] = *(_OWORD *)(a1 + 32);
  v7[3] = v2;
  v8 = *(_BYTE *)(a1 + 64);
  v3 = *(_OWORD *)(a1 + 16);
  v7[0] = *(_OWORD *)a1;
  v7[1] = v3;
  v4 = *(_OWORD *)(a2 + 48);
  v9[2] = *(_OWORD *)(a2 + 32);
  v9[3] = v4;
  v10 = *(_BYTE *)(a2 + 64);
  v5 = *(_OWORD *)(a2 + 16);
  v9[0] = *(_OWORD *)a2;
  v9[1] = v5;
  return sub_1000096AC((uint64_t)v7, (uint64_t)v9);
}

unsigned __int8 *sub_100008944(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unsigned __int8 *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unsigned __int8 *v12;
  uint64_t v14;
  uint64_t v15;

  v14 = a1;
  v15 = a2;
  swift_bridgeObjectRetain(a2);
  v4 = String.init<A>(_:)(&v14, &type metadata for String, &protocol witness table for String, &protocol witness table for String);
  v6 = v4;
  v7 = v5;
  if ((v5 & 0x1000000000000000) == 0)
  {
    if ((v5 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v9 = HIBYTE(v7) & 0xF;
    v14 = v6;
    v15 = v7 & 0xFFFFFFFFFFFFFFLL;
    v8 = (unsigned __int8 *)&v14;
    goto LABEL_7;
  }
  v6 = sub_100008CA4(v4, v5);
  v11 = v10;
  swift_bridgeObjectRelease(v7);
  v7 = v11;
  if ((v11 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v6 & 0x1000000000000000) != 0)
  {
    v8 = (unsigned __int8 *)((v7 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v9 = v6 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v8 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(v6, v7);
  }
LABEL_7:
  v12 = sub_100008A28(v8, v9, a3);
  swift_bridgeObjectRelease(v7);
  return v12;
}

unsigned __int8 *sub_100008A28(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_100008CA4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1;
  v3 = 7;
  if (((a2 >> 60) & ((a1 & 0x800000000000000) == 0)) != 0)
    v3 = 11;
  v4 = String.subscript.getter(15, v3 | (v2 << 16), a1, a2);
  v6 = v5;
  v9 = sub_100008D20(v4, v7, v8, v5);
  swift_bridgeObjectRelease(v6);
  return v9;
}

uint64_t sub_100008D20(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v5;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];

  v5 = a3;
  if ((a4 & 0x1000000000000000) != 0)
  {
    v12 = sub_100008E64(a1, a2, a3, a4);
    if (v12)
    {
      v9 = v12;
      v8 = (unint64_t)sub_100008F50(v12, 0);
      v5 = sub_100008FB4((unint64_t)v15, v8 + 32, v9, a1, a2, v5, a4);
      v13 = v15[3];
      swift_bridgeObjectRetain(a4);
      swift_bridgeObjectRelease(v13);
      if (v5 != v9)
      {
        __break(1u);
        goto LABEL_11;
      }
    }
    else
    {
      v8 = (unint64_t)&_swiftEmptyArrayStorage;
    }
    v14 = static String._uncheckedFromUTF8(_:)(v8 + 32, *(_QWORD *)(v8 + 16));
    swift_release(v8);
    return v14;
  }
  else
  {
    v8 = a1 >> 16;
    v9 = a2 >> 16;
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
      {
        v10 = (a4 & 0xFFFFFFFFFFFFFFFLL) + 32;
LABEL_5:
        v10 += v8;
        return static String._uncheckedFromUTF8(_:)(v10, v9 - v8);
      }
LABEL_11:
      v10 = _StringObject.sharedUTF8.getter(v5, a4);
      if (!v10)
        return static String._uncheckedFromUTF8(_:)(v10, v9 - v8);
      goto LABEL_5;
    }
    v15[0] = a3;
    v15[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return static String._uncheckedFromUTF8(_:)((char *)v15 + v8, v9 - v8);
  }
}

unint64_t sub_100008E64(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_1000091C4(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_1000091C4(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return String.UTF8View._foreignDistance(from:to:)(v7, a2, a3, a4);
  }
  __break(1u);
  return result;
}

_QWORD *sub_100008F50(uint64_t a1, uint64_t a2)
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
  v4 = sub_100004B94(&qword_1000148A0);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

unint64_t sub_100008FB4(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_1000091C4(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = String.UTF8View._foreignSubscript(position:)();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = _StringObject.sharedUTF8.getter(a6, a7);
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_1000091C4(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = String.UTF8View._foreignIndex(after:)(v12, a6, a7);
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_1000091C4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v5 = a1;
  v6 = a1 >> 16;
  v7 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v13 = String.UTF16View.index(_:offsetBy:)(15, v6, a2);
    v14 = v13 + (v7 << 16);
    v15 = v13 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    v16 = v14 & 0xFFFFFFFFFFFF0000;
    if (!v7)
      v16 = v15;
    return v16 | 4;
  }
  else
  {
    v8 = String.UTF8View._foreignIndex(_:offsetBy:)(15, v6);
    v9 = v8 + (v7 << 16);
    v10 = v8 & 0xFFFFFFFFFFFFFFFCLL | v5 & 3;
    v11 = v9 & 0xFFFFFFFFFFFF0000;
    if (!v7)
      v11 = v10;
    return v11 | 8;
  }
}

BOOL sub_10000923C(_BOOL8 result, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v22;
  unsigned __int8 *v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 *v27;
  unsigned int v28;
  uint64_t v29;
  char v30;
  char v31;
  _QWORD v32[3];

  v7 = HIBYTE(a2) & 0xF;
  v8 = result & 0xFFFFFFFFFFFFLL;
  if ((a2 & 0x2000000000000000) != 0)
    v9 = v7;
  else
    v9 = result & 0xFFFFFFFFFFFFLL;
  if (!v9)
    goto LABEL_32;
  v10 = result;
  if ((a2 & 0x1000000000000000) != 0)
  {
    swift_bridgeObjectRetain(a2);
    v14 = (uint64_t)sub_100008944(v10, a2, 10);
    v31 = v30;
    swift_bridgeObjectRelease(a2);
    if ((v31 & 1) == 0)
      goto LABEL_33;
    goto LABEL_32;
  }
  if ((a2 & 0x2000000000000000) != 0)
  {
    v32[0] = result;
    v32[1] = a2 & 0xFFFFFFFFFFFFFFLL;
    if (result == 43)
    {
      if (v7)
      {
        if (v7 != 1 && (BYTE1(result) - 48) <= 9u)
        {
          v14 = (BYTE1(result) - 48);
          if (v7 == 2)
            goto LABEL_33;
          if ((BYTE2(result) - 48) <= 9u)
          {
            v14 = 10 * (BYTE1(result) - 48) + (BYTE2(result) - 48);
            v15 = v7 - 3;
            if (v7 == 3)
              goto LABEL_33;
            v16 = (unsigned __int8 *)v32 + 3;
            while (1)
            {
              v17 = *v16 - 48;
              if (v17 > 9)
                break;
              v18 = 10 * v14;
              if ((unsigned __int128)(v14 * (__int128)10) >> 64 != (10 * v14) >> 63)
                break;
              v14 = v18 + v17;
              if (__OFADD__(v18, v17))
                break;
              ++v16;
              if (!--v15)
                goto LABEL_33;
            }
          }
        }
        goto LABEL_32;
      }
    }
    else
    {
      if (result != 45)
      {
        if (v7 && (result - 48) <= 9u)
        {
          v14 = result - 48;
          if (v7 == 1)
            goto LABEL_33;
          if ((BYTE1(result) - 48) <= 9u)
          {
            v14 = 10 * (result - 48) + (BYTE1(result) - 48);
            v22 = v7 - 2;
            if (v7 == 2)
              goto LABEL_33;
            v23 = (unsigned __int8 *)v32 + 2;
            while (1)
            {
              v24 = *v23 - 48;
              if (v24 > 9)
                break;
              v25 = 10 * v14;
              if ((unsigned __int128)(v14 * (__int128)10) >> 64 != (10 * v14) >> 63)
                break;
              v14 = v25 + v24;
              if (__OFADD__(v25, v24))
                break;
              ++v23;
              if (!--v22)
                goto LABEL_33;
            }
          }
        }
        goto LABEL_32;
      }
      if (v7)
      {
        if (v7 != 1 && (BYTE1(result) - 48) <= 9u)
        {
          if (v7 == 2)
          {
            v14 = -(uint64_t)(BYTE1(result) - 48);
            goto LABEL_33;
          }
          if ((BYTE2(result) - 48) <= 9u)
          {
            v14 = -10 * (BYTE1(result) - 48) - (BYTE2(result) - 48);
            v26 = v7 - 3;
            if (v7 == 3)
              goto LABEL_33;
            v27 = (unsigned __int8 *)v32 + 3;
            while (1)
            {
              v28 = *v27 - 48;
              if (v28 > 9)
                break;
              v29 = 10 * v14;
              if ((unsigned __int128)(v14 * (__int128)10) >> 64 != (10 * v14) >> 63)
                break;
              v14 = v29 - v28;
              if (__OFSUB__(v29, v28))
                break;
              ++v27;
              if (!--v26)
                goto LABEL_33;
            }
          }
        }
LABEL_32:
        v14 = 0x8000000000000000;
        goto LABEL_33;
      }
      __break(1u);
    }
    __break(1u);
    return result;
  }
  if ((result & 0x1000000000000000) != 0)
    v11 = (unsigned __int8 *)((a2 & 0xFFFFFFFFFFFFFFFLL) + 32);
  else
    v11 = (unsigned __int8 *)_StringObject.sharedUTF8.getter(result, a2);
  v12 = sub_100008A28(v11, v8, 10);
  if ((v13 & 1) != 0)
    goto LABEL_32;
  v14 = (uint64_t)v12;
LABEL_33:
  swift_bridgeObjectRetain(a4);
  v19 = sub_100007F64(a3, a4);
  return (v20 & 1) == 0 && v19 > v14;
}

uint64_t sub_100009554(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  char v5;
  char v6;
  BOOL v7;
  char v8;

  v4 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  if (v4 || (v5 = _stringCompareWithSmolCheck(_:_:expecting:)(), v6 = 0, (v5 & 1) != 0))
  {
    v7 = *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16) && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24);
    if (v7 || (v8 = _stringCompareWithSmolCheck(_:_:expecting:)(), v6 = 0, (v8 & 1) != 0))
      v6 = ((*(_BYTE *)(a1 + 32) & 1) == 0) ^ *(_BYTE *)(a2 + 32);
  }
  return v6 & 1;
}

uint64_t sub_1000095D8(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  char v5;
  char v6;
  BOOL v7;
  char v8;
  char v9;

  v4 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  if (v4 || (v5 = _stringCompareWithSmolCheck(_:_:expecting:)(), v6 = 0, (v5 & 1) != 0))
  {
    v7 = *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16) && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24);
    if (v7 || (v8 = _stringCompareWithSmolCheck(_:_:expecting:)(), v6 = 0, (v8 & 1) != 0))
    {
      if (*(_QWORD *)(a1 + 32) == *(_QWORD *)(a2 + 32) && *(_QWORD *)(a1 + 40) == *(_QWORD *)(a2 + 40)
        || (v9 = _stringCompareWithSmolCheck(_:_:expecting:)(), v6 = 0, (v9 & 1) != 0))
      {
        if (*(_QWORD *)(a1 + 48) == *(_QWORD *)(a2 + 48) && *(_QWORD *)(a1 + 56) == *(_QWORD *)(a2 + 56))
          v6 = ((*(_BYTE *)(a1 + 64) & 1) == 0) ^ *(_BYTE *)(a2 + 64);
        else
          v6 = 0;
      }
    }
  }
  return v6 & 1;
}

BOOL sub_1000096AC(uint64_t a1, uint64_t a2)
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
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a2 + 16);
  v8 = *(_QWORD *)(a2 + 24);
  v9 = *(_QWORD *)(a2 + 32);
  v10 = *(_QWORD *)(a2 + 40);
  v11 = *(_QWORD *)(a2 + 48);
  v15 = *(_QWORD *)(a2 + 56);
  v16 = *(_QWORD *)(a1 + 56);
  v13 = *(_BYTE *)(a2 + 64);
  v14 = *(_BYTE *)(a1 + 64);
  return (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8)
       || (((uint64_t (*)(void))_stringCompareWithSmolCheck(_:_:expecting:))() & 1) != 0)
      && (v2 == v7 && v4 == v8 || (_stringCompareWithSmolCheck(_:_:expecting:)(v2, v4, v7, v8, 0) & 1) != 0)
      && (v3 == v9 && v5 == v10 || (_stringCompareWithSmolCheck(_:_:expecting:)(v3, v5, v9, v10, 0) & 1) != 0)
      && v6 == v11
      && v16 == v15
      && (v14 & 1) == (v13 & 1);
}

unint64_t sub_1000097D0(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_100010838, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 6)
    return 6;
  else
    return v3;
}

uint64_t sub_100009818@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;
  char v36;
  char v37;
  char v38;
  char v39;

  v5 = sub_100004B94(&qword_1000148A8);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_100009B5C(a1, v9);
  v11 = sub_100009B80();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for MobileAssetProperties.CodingKeys, &type metadata for MobileAssetProperties.CodingKeys, v11, v9, v10);
  if (v2)
    return sub_100009BC4(a1);
  v39 = 0;
  v12 = KeyedDecodingContainer.decode(_:forKey:)(&v39, v5);
  v14 = v13;
  v33 = v12;
  v38 = 1;
  swift_bridgeObjectRetain(v13);
  v15 = KeyedDecodingContainer.decode(_:forKey:)(&v38, v5);
  v17 = v16;
  v31 = v15;
  v37 = 2;
  swift_bridgeObjectRetain(v16);
  v18 = KeyedDecodingContainer.decode(_:forKey:)(&v37, v5);
  v32 = v19;
  v28 = v18;
  v30 = v17;
  v36 = 3;
  swift_bridgeObjectRetain(v19);
  v29 = 0;
  v27 = KeyedDecodingContainer.decode(_:forKey:)(&v36, v5);
  v35 = 4;
  v20 = KeyedDecodingContainer.decode(_:forKey:)(&v35, v5);
  v34 = 5;
  v21 = KeyedDecodingContainer.decode(_:forKey:)(&v34, v5);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_100009BC4(a1);
  v22 = v20;
  v23 = v32;
  swift_bridgeObjectRelease(v32);
  v24 = v30;
  swift_bridgeObjectRelease(v30);
  result = swift_bridgeObjectRelease(v14);
  *(_QWORD *)a2 = v33;
  *(_QWORD *)(a2 + 8) = v14;
  *(_QWORD *)(a2 + 16) = v31;
  *(_QWORD *)(a2 + 24) = v24;
  *(_QWORD *)(a2 + 32) = v28;
  *(_QWORD *)(a2 + 40) = v23;
  *(_QWORD *)(a2 + 48) = v27;
  *(_QWORD *)(a2 + 56) = v22;
  *(_BYTE *)(a2 + 64) = v21 & 1;
  return result;
}

_QWORD *sub_100009B5C(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_100009B80()
{
  unint64_t result;

  result = qword_1000148B0;
  if (!qword_1000148B0)
  {
    result = swift_getWitnessTable(&unk_10000E250, &type metadata for MobileAssetProperties.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000148B0);
  }
  return result;
}

uint64_t sub_100009BC4(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

_BYTE *initializeBufferWithCopyOfBuffer for MobileAssetProperties.CodingKeys(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MobileAssetProperties.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for MobileAssetProperties.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_100009CD0 + 4 * byte_10000DEEF[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_100009D04 + 4 * byte_10000DEEA[v4]))();
}

uint64_t sub_100009D04(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_100009D0C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x100009D14);
  return result;
}

uint64_t sub_100009D20(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100009D28);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_100009D2C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100009D34(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100009D40(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100009D48(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MobileAssetProperties.CodingKeys()
{
  return &type metadata for MobileAssetProperties.CodingKeys;
}

uint64_t _s16ProductKitViewer21MobileAssetPropertiesVwxx_0(_QWORD *a1)
{
  swift_bridgeObjectRelease(a1[1]);
  swift_bridgeObjectRelease(a1[3]);
  return swift_bridgeObjectRelease(a1[5]);
}

uint64_t _s16ProductKitViewer21MobileAssetPropertiesVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  swift_bridgeObjectRetain(v3);
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRetain(v5);
  return a1;
}

uint64_t _s16ProductKitViewer21MobileAssetPropertiesVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease(v7);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(v9);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  return a1;
}

uint64_t _s16ProductKitViewer21MobileAssetPropertiesVwta_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease(v5);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRelease(v7);
  v8 = *(_QWORD *)(a2 + 40);
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v8;
  swift_bridgeObjectRelease(v9);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  return a1;
}

uint64_t _s16ProductKitViewer21MobileAssetPropertiesVwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 65))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_100009F44(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 64) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 65) = 1;
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
    *(_BYTE *)(result + 65) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MobileAssetPropertyList()
{
  return &type metadata for MobileAssetPropertyList;
}

unint64_t sub_100009FAC()
{
  unint64_t result;

  result = qword_1000148C0;
  if (!qword_1000148C0)
  {
    result = swift_getWitnessTable(&unk_10000E0A8, &type metadata for MobileAssetPropertyList);
    atomic_store(result, (unint64_t *)&qword_1000148C0);
  }
  return result;
}

unint64_t sub_100009FF4()
{
  unint64_t result;

  result = qword_1000148C8;
  if (!qword_1000148C8)
  {
    result = swift_getWitnessTable(&unk_10000E228, &type metadata for MobileAssetProperties.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000148C8);
  }
  return result;
}

unint64_t sub_10000A03C()
{
  unint64_t result;

  result = qword_1000148D0;
  if (!qword_1000148D0)
  {
    result = swift_getWitnessTable(&unk_10000E160, &type metadata for MobileAssetProperties.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000148D0);
  }
  return result;
}

unint64_t sub_10000A084()
{
  unint64_t result;

  result = qword_1000148D8;
  if (!qword_1000148D8)
  {
    result = swift_getWitnessTable(&unk_10000E188, &type metadata for MobileAssetProperties.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000148D8);
  }
  return result;
}

uint64_t sub_10000A0C8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t result;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _OWORD v20[3];
  uint64_t v21;
  uint64_t v22;
  char v23;

  v5 = sub_100004B94(&qword_1000148E0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[3];
  v10 = a1[4];
  sub_100009B5C(a1, v9);
  v11 = sub_10000A224();
  dispatch thunk of Decoder.container<A>(keyedBy:)(&type metadata for MobileAssetPropertyList.CodingKeys, &type metadata for MobileAssetPropertyList.CodingKeys, v11, v9, v10);
  if (v2)
    return sub_100009BC4(a1);
  sub_10000A268();
  KeyedDecodingContainer.decode<A>(_:forKey:)(v20);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v18 = v20[1];
  v19 = v20[0];
  v17 = v20[2];
  v12 = v21;
  v13 = v22;
  v14 = v23;
  result = sub_100009BC4(a1);
  v16 = v18;
  *(_OWORD *)a2 = v19;
  *(_OWORD *)(a2 + 16) = v16;
  *(_OWORD *)(a2 + 32) = v17;
  *(_QWORD *)(a2 + 48) = v12;
  *(_QWORD *)(a2 + 56) = v13;
  *(_BYTE *)(a2 + 64) = v14;
  return result;
}

unint64_t sub_10000A224()
{
  unint64_t result;

  result = qword_1000148E8;
  if (!qword_1000148E8)
  {
    result = swift_getWitnessTable(&unk_10000E390, &type metadata for MobileAssetPropertyList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1000148E8);
  }
  return result;
}

unint64_t sub_10000A268()
{
  unint64_t result;

  result = qword_1000148F0;
  if (!qword_1000148F0)
  {
    result = swift_getWitnessTable(&unk_10000E014, &type metadata for MobileAssetProperties);
    atomic_store(result, (unint64_t *)&qword_1000148F0);
  }
  return result;
}

unint64_t sub_10000A2AC()
{
  unint64_t result;

  result = qword_100014900;
  if (!qword_100014900)
  {
    result = swift_getWitnessTable(&unk_10000DFEC, &type metadata for MobileAssetProperties);
    atomic_store(result, (unint64_t *)&qword_100014900);
  }
  return result;
}

_QWORD *sub_10000A2F0(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[3];
  v3 = a1[5];
  swift_bridgeObjectRetain(a1[1]);
  swift_bridgeObjectRetain(v2);
  swift_bridgeObjectRetain(v3);
  return a1;
}

_QWORD *sub_10000A338(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1[1];
  v3 = a1[3];
  swift_bridgeObjectRelease(a1[5]);
  swift_bridgeObjectRelease(v3);
  swift_bridgeObjectRelease(v2);
  return a1;
}

uint64_t getEnumTagSinglePayload for MobileAssetPropertyList.CodingKeys(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MobileAssetPropertyList.CodingKeys(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_10000A414 + 4 * byte_10000DEF4[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_10000A434 + 4 * byte_10000DEF9[v4]))();
}

_BYTE *sub_10000A414(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_10000A434(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10000A43C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10000A444(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10000A44C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10000A454(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_10000A460()
{
  return 0;
}

ValueMetadata *type metadata accessor for MobileAssetPropertyList.CodingKeys()
{
  return &type metadata for MobileAssetPropertyList.CodingKeys;
}

unint64_t sub_10000A47C()
{
  unint64_t result;

  result = qword_100014908;
  if (!qword_100014908)
  {
    result = swift_getWitnessTable(&unk_10000E368, &type metadata for MobileAssetPropertyList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100014908);
  }
  return result;
}

unint64_t sub_10000A4C4()
{
  unint64_t result;

  result = qword_100014910;
  if (!qword_100014910)
  {
    result = swift_getWitnessTable(&unk_10000E2A0, &type metadata for MobileAssetPropertyList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100014910);
  }
  return result;
}

unint64_t sub_10000A50C()
{
  unint64_t result;

  result = qword_100014918;
  if (!qword_100014918)
  {
    result = swift_getWitnessTable(&unk_10000E2C8, &type metadata for MobileAssetPropertyList.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_100014918);
  }
  return result;
}

BOOL sub_10000A554(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_10000A56C()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10000A5B0()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10000A5D8(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

id sub_10000A618()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  objc_class *v4;
  id result;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  objc_super v13;

  v1 = sub_100004B94(&qword_100014958);
  __chkstk_darwin(v1);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (objc_class *)type metadata accessor for AssetMovieViewController();
  v13.receiver = v0;
  v13.super_class = v4;
  objc_msgSendSuper2(&v13, "viewDidLoad");
  result = objc_msgSend(v0, "view");
  if (result)
  {
    v6 = result;
    v7 = objc_msgSend((id)objc_opt_self(UIColor), "systemBackgroundColor");
    objc_msgSend(v6, "setBackgroundColor:", v7);

    v8 = type metadata accessor for TaskPriority(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v3, 1, 1, v8);
    type metadata accessor for MainActor(0);
    v9 = v0;
    v10 = static MainActor.shared.getter();
    v11 = (_QWORD *)swift_allocObject(&unk_1000111E0, 40, 7);
    v11[2] = v10;
    v11[3] = &protocol witness table for MainActor;
    v11[4] = v9;
    v12 = sub_10000CA6C((uint64_t)v3, (uint64_t)&unk_100014968, (uint64_t)v11);
    return (id)swift_release(v12);
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_10000A774(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v4[11] = a4;
  v5 = type metadata accessor for HeadphonePairing.Assets.VideoViewIdentifier(0);
  v4[12] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v4[13] = v6;
  v4[14] = swift_task_alloc((*(_QWORD *)(v6 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for HeadphonePairing.Assets(0);
  v4[15] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v4[16] = v8;
  v4[17] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100004B94(&qword_100014980);
  v4[18] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v9 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for HeadphonePairing.Configuration(0);
  v4[19] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v4[20] = v11;
  v12 = (*(_QWORD *)(v11 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4[21] = swift_task_alloc(v12);
  v4[22] = swift_task_alloc(v12);
  v13 = type metadata accessor for HeadphoneHardwareModel(0);
  v4[23] = v13;
  v14 = *(_QWORD *)(v13 - 8);
  v4[24] = v14;
  v15 = (*(_QWORD *)(v14 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4[25] = swift_task_alloc(v15);
  v4[26] = swift_task_alloc(v15);
  v16 = type metadata accessor for AirTagPairing.Assets.ViewIdentifier(0);
  v4[27] = v16;
  v17 = *(_QWORD *)(v16 - 8);
  v4[28] = v17;
  v4[29] = swift_task_alloc((*(_QWORD *)(v17 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for AirTagPairing.Assets(0);
  v4[30] = v18;
  v19 = *(_QWORD *)(v18 - 8);
  v4[31] = v19;
  v4[32] = swift_task_alloc((*(_QWORD *)(v19 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_100004B94(&qword_100014988);
  v4[33] = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v20 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = type metadata accessor for AirTagPairing.Configuration(0);
  v4[34] = v21;
  v22 = *(_QWORD *)(v21 - 8);
  v4[35] = v22;
  v23 = (*(_QWORD *)(v22 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4[36] = swift_task_alloc(v23);
  v4[37] = swift_task_alloc(v23);
  v24 = type metadata accessor for PersonalizationAssetManager.PrePairingAssetInfo(0);
  v4[38] = v24;
  v25 = *(_QWORD *)(v24 - 8);
  v4[39] = v25;
  v26 = (*(_QWORD *)(v25 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4[40] = swift_task_alloc(v26);
  v4[41] = swift_task_alloc(v26);
  v27 = type metadata accessor for AirTagPairing.Configuration.Color(0);
  v4[42] = v27;
  v28 = *(_QWORD *)(v27 - 8);
  v4[43] = v28;
  v29 = (*(_QWORD *)(v28 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4[44] = swift_task_alloc(v29);
  v4[45] = swift_task_alloc(v29);
  v30 = type metadata accessor for AirTagHardwareModel(0);
  v4[46] = v30;
  v31 = *(_QWORD *)(v30 - 8);
  v4[47] = v31;
  v32 = (*(_QWORD *)(v31 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v4[48] = swift_task_alloc(v32);
  v4[49] = swift_task_alloc(v32);
  v33 = type metadata accessor for MainActor(0);
  v4[50] = static MainActor.shared.getter();
  v34 = dispatch thunk of Actor.unownedExecutor.getter(v33, &protocol witness table for MainActor);
  v4[51] = v34;
  v4[52] = v35;
  return swift_task_switch(sub_10000AA18, v34, v35);
}

uint64_t sub_10000AA18()
{
  _QWORD *v0;
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
  _QWORD *v15;
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
  _QWORD *v27;
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

  if ((*(_BYTE *)(v0[11] + OBJC_IVAR____TtC16ProductKitViewer24AssetMovieViewController_mode) & 1) != 0)
  {
    v1 = v0[39];
    v2 = v0[40];
    v3 = v0[38];
    v5 = v0[25];
    v4 = v0[26];
    v7 = v0[23];
    v6 = v0[24];
    v8 = v0[22];
    v32 = v0[20];
    v34 = v0[21];
    v9 = v0[18];
    v36 = v0[19];
    v10 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v6 + 104))(v4, enum case for HeadphoneHardwareModel.airPodsPro(_:), v7);
    static PersonalizationAssetManager.PrePairingAssetInfo.fixture_airpods_test1.getter(v10);
    v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v4, v7);
    DefaultAssetRequestTimeout.getter(v11);
    HeadphonePairing.Configuration.init(hardwareModel:color:timeout:)(v5, 0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16))(v9, v2, v3);
    v12 = enum case for PersonalizationAssetManager.AssetInfo.prePairing(_:);
    v13 = type metadata accessor for PersonalizationAssetManager.AssetInfo(0);
    v14 = *(_QWORD *)(v13 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 104))(v9, v12, v13);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(v9, 0, 1, v13);
    HeadphonePairing.Configuration.engravingInformation.setter(v9);
    type metadata accessor for HeadphonePairing.AssetRequest(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16))(v34, v8, v36);
    v0[56] = AbstractAssetRequest.__allocating_init(configuration:)(v34);
    v15 = (_QWORD *)swift_task_alloc(async function pointer to HeadphonePairing.AssetRequest.assets()[1]);
    v0[57] = v15;
    *v15 = v0;
    v15[1] = sub_10000B960;
    return HeadphonePairing.AssetRequest.assets()(v0[17]);
  }
  else
  {
    v17 = v0[49];
    v19 = v0[46];
    v18 = v0[47];
    v20 = v0[44];
    v21 = v0[45];
    v22 = v0[42];
    v23 = v0[43];
    v24 = v0[41];
    v30 = v0[39];
    v31 = v0[38];
    v28 = v0[48];
    v29 = v0[37];
    v33 = v0[35];
    v35 = v0[36];
    v25 = v0[33];
    v37 = v0[34];
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v18 + 104))(v17, enum case for AirTagHardwareModel.original(_:), v19);
    v26 = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v23 + 104))(v21, enum case for AirTagPairing.Configuration.Color.white(_:), v22);
    static PersonalizationAssetManager.PrePairingAssetInfo.fixture_airtag_anusree_AB21.getter(v26);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v18 + 16))(v28, v17, v19);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v20, v21, v22);
    AirTagPairing.Configuration.init(hardwareModel:color:timeout:)(v28, v20, 3.0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v30 + 16))(v25, v24, v31);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v30 + 56))(v25, 0, 1, v31);
    AirTagPairing.Configuration.engravingInformation.setter(v25);
    type metadata accessor for AirTagPairing.AssetRequest(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 16))(v35, v29, v37);
    v0[53] = AbstractAssetRequest.__allocating_init(configuration:)(v35);
    v27 = (_QWORD *)swift_task_alloc(async function pointer to AirTagPairing.AssetRequest.assets()[1]);
    v0[54] = v27;
    *v27 = v0;
    v27[1] = sub_10000AD28;
    return AirTagPairing.AssetRequest.assets()(v0[32]);
  }
}

uint64_t sub_10000AD28()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 432);
  *(_QWORD *)(*v1 + 440) = v0;
  swift_task_dealloc(v3);
  if (v0)
    v4 = sub_10000C580;
  else
    v4 = sub_10000AD88;
  return swift_task_switch(v4, *(_QWORD *)(v2 + 408), *(_QWORD *)(v2 + 416));
}

id sub_10000AD88()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  UIButton v18;
  NSString v19;
  uint64_t v20;
  id v21;
  UIButton v22;
  NSString v23;
  uint64_t v24;
  id v25;
  UIButton v26;
  NSString v27;
  id result;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  Class v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  id v82;
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
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  Class isa;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  UIAction_optional v113;
  UIAction_optional v114;
  UIAction_optional v115;

  v1 = v0[53];
  v111 = v0[49];
  v104 = v0[47];
  v106 = v0[46];
  v100 = v0[42];
  v102 = v0[45];
  v96 = v0[41];
  v98 = v0[43];
  v94 = v0[39];
  v95 = v0[38];
  v2 = v0[35];
  v92 = v0[34];
  v93 = v0[37];
  v4 = v0[31];
  v3 = v0[32];
  v6 = v0[29];
  v5 = v0[30];
  v8 = v0[27];
  v7 = v0[28];
  swift_release(v0[50]);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 104))(v6, enum case for AirTagPairing.Assets.ViewIdentifier.intro(_:), v8);
  v9 = (void *)AirTagPairing.Assets.view(_:)(v6);
  v109 = v10;
  swift_release(v1);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v93, v92);
  (*(void (**)(uint64_t, uint64_t))(v94 + 8))(v96, v95);
  (*(void (**)(uint64_t, uint64_t))(v98 + 8))(v102, v100);
  (*(void (**)(uint64_t, uint64_t))(v104 + 8))(v111, v106);
  v11 = (void *)v0[11];
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "setAlpha:", 0.0);
  v12 = objc_msgSend(v9, "layer");
  v13 = objc_msgSend((id)objc_opt_self(UIColor), "redColor");
  v14 = objc_msgSend(v13, "CGColor");

  objc_msgSend(v12, "setBorderColor:", v14);
  v15 = objc_msgSend(v9, "layer");
  objc_msgSend(v15, "setBorderWidth:", 1.0);

  sub_10000D1E8(0, &qword_1000149A0, UIButton_ptr);
  sub_10000D1E8(0, &qword_1000149A8, UIAction_ptr);
  v16 = swift_allocObject(&unk_100011230, 32, 7);
  *(_QWORD *)(v16 + 16) = v9;
  *(_QWORD *)(v16 + 24) = v109;
  v17 = v9;
  v113.value.super.super.isa = (Class)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)(0, 0xE000000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, sub_10000D158, v16);
  v18.super.super.super.super.isa = UIButton.init(type:primaryAction:)(UIButtonTypeSystem, v113).super.super.super.super.isa;
  v19 = String._bridgeToObjectiveC()();
  -[objc_class setTitle:forState:](v18.super.super.super.super.isa, "setTitle:forState:", v19, 0);

  isa = v18.super.super.super.super.isa;
  -[objc_class setTranslatesAutoresizingMaskIntoConstraints:](v18.super.super.super.super.isa, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v20 = swift_allocObject(&unk_100011258, 32, 7);
  *(_QWORD *)(v20 + 16) = v17;
  *(_QWORD *)(v20 + 24) = v109;
  v21 = v17;
  v114.value.super.super.isa = (Class)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)(0, 0xE000000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, sub_10000D188, v20);
  v22.super.super.super.super.isa = UIButton.init(type:primaryAction:)(UIButtonTypeSystem, v114).super.super.super.super.isa;
  v23 = String._bridgeToObjectiveC()();
  -[objc_class setTitle:forState:](v22.super.super.super.super.isa, "setTitle:forState:", v23, 0);

  -[objc_class setTranslatesAutoresizingMaskIntoConstraints:](v22.super.super.super.super.isa, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v24 = swift_allocObject(&unk_100011280, 32, 7);
  *(_QWORD *)(v24 + 16) = v21;
  *(_QWORD *)(v24 + 24) = v109;
  v25 = v21;
  v115.value.super.super.isa = (Class)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)(0, 0xE000000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, sub_10000D194, v24);
  v26.super.super.super.super.isa = UIButton.init(type:primaryAction:)(UIButtonTypeSystem, v115).super.super.super.super.isa;
  v27 = String._bridgeToObjectiveC()();
  -[objc_class setTitle:forState:](v26.super.super.super.super.isa, "setTitle:forState:", v27, 0);

  -[objc_class setTranslatesAutoresizingMaskIntoConstraints:](v26.super.super.super.super.isa, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  result = objc_msgSend(v11, "view");
  if (!result)
  {
    __break(1u);
    goto LABEL_12;
  }
  v29 = result;
  v30 = (void *)v0[11];
  objc_msgSend(result, "addSubview:", v25);

  result = objc_msgSend(v30, "view");
  if (!result)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v31 = result;
  v32 = (void *)v0[11];
  objc_msgSend(result, "addSubview:", v18.super.super.super.super.isa);

  result = objc_msgSend(v32, "view");
  if (!result)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v33 = result;
  v34 = (void *)v0[11];
  objc_msgSend(result, "addSubview:", v22.super.super.super.super.isa);

  result = objc_msgSend(v34, "view");
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v35 = result;
  v36 = (void *)v0[11];
  objc_msgSend(result, "addSubview:", v26.super.super.super.super.isa);

  v37 = sub_100004B94(&qword_1000149B0);
  v38 = swift_allocObject(v37, 112, 7);
  *(_OWORD *)(v38 + 16) = xmmword_10000E3E0;
  v39 = objc_msgSend(v25, "centerXAnchor");
  result = objc_msgSend(v36, "view");
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v40 = result;
  v41 = (void *)v0[11];
  v42 = objc_msgSend(result, "centerXAnchor");

  v43 = objc_msgSend(v39, "constraintEqualToAnchor:", v42);
  *(_QWORD *)(v38 + 32) = v43;
  v44 = objc_msgSend(v25, "centerYAnchor");
  result = objc_msgSend(v41, "view");
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v45 = result;
  v46 = (void *)v0[11];
  v47 = objc_msgSend(result, "centerYAnchor");

  v48 = objc_msgSend(v44, "constraintEqualToAnchor:", v47);
  *(_QWORD *)(v38 + 40) = v48;
  v49 = objc_msgSend(v25, "widthAnchor");
  v50 = objc_msgSend(v49, "constraintEqualToConstant:", 350.0);

  *(_QWORD *)(v38 + 48) = v50;
  v51 = objc_msgSend(v25, "heightAnchor");
  v52 = objc_msgSend(v51, "constraintEqualToConstant:", 362.0);

  *(_QWORD *)(v38 + 56) = v52;
  v53 = -[objc_class centerXAnchor](v22.super.super.super.super.isa, "centerXAnchor");
  result = objc_msgSend(v46, "view");
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v54 = result;
  v55 = (void *)v0[11];
  v56 = objc_msgSend(result, "centerXAnchor");

  v57 = objc_msgSend(v53, "constraintEqualToAnchor:", v56);
  *(_QWORD *)(v38 + 64) = v57;
  v58 = -[objc_class topAnchor](v22.super.super.super.super.isa, "topAnchor");
  v59 = objc_msgSend(v25, "bottomAnchor");
  v60 = objc_msgSend(v58, "constraintEqualToAnchor:constant:", v59, 10.0);

  *(_QWORD *)(v38 + 72) = v60;
  v61 = -[objc_class centerXAnchor](v26.super.super.super.super.isa, "centerXAnchor");
  result = objc_msgSend(v55, "view");
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v62 = result;
  v63 = (void *)v0[11];
  v64 = objc_msgSend(result, "centerXAnchor");

  v65 = objc_msgSend(v61, "constraintEqualToAnchor:", v64);
  *(_QWORD *)(v38 + 80) = v65;
  v66 = -[objc_class topAnchor](v26.super.super.super.super.isa, "topAnchor");
  v67 = -[objc_class bottomAnchor](v22.super.super.super.super.isa, "bottomAnchor");
  v68 = objc_msgSend(v66, "constraintEqualToAnchor:constant:", v67, 10.0);

  *(_QWORD *)(v38 + 88) = v68;
  v69 = -[objc_class centerXAnchor](v18.super.super.super.super.isa, "centerXAnchor");
  result = objc_msgSend(v63, "view");
  if (result)
  {
    v70 = result;
    v71 = (void *)objc_opt_self(NSLayoutConstraint);
    v72 = objc_msgSend(v70, "centerXAnchor");

    v73 = objc_msgSend(v69, "constraintEqualToAnchor:", v72);
    *(_QWORD *)(v38 + 96) = v73;
    v74 = -[objc_class topAnchor](isa, "topAnchor");
    v75 = -[objc_class bottomAnchor](v26.super.super.super.super.isa, "bottomAnchor");
    v76 = objc_msgSend(v74, "constraintEqualToAnchor:constant:", v75, 10.0);

    *(_QWORD *)(v38 + 104) = v76;
    specialized Array._endMutation()();
    sub_10000D1E8(0, &qword_1000149B8, NSLayoutConstraint_ptr);
    v77 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v38);
    objc_msgSend(v71, "activateConstraints:", v77);

    v78 = (void *)objc_opt_self(UIView);
    v79 = swift_allocObject(&unk_1000112A8, 32, 7);
    *(_QWORD *)(v79 + 16) = v25;
    *(_QWORD *)(v79 + 24) = v109;
    v0[6] = sub_10000D220;
    v0[7] = v79;
    v0[2] = _NSConcreteStackBlock;
    v0[3] = 1107296256;
    v0[4] = sub_10000CA40;
    v0[5] = &unk_1000112C0;
    v80 = _Block_copy(v0 + 2);
    v81 = v0[7];
    v82 = v25;
    swift_release(v81);
    objc_msgSend(v78, "animateWithDuration:animations:", v80, 0.3);

    _Block_release(v80);
    v83 = v0[48];
    v85 = v0[44];
    v84 = v0[45];
    v87 = v0[40];
    v86 = v0[41];
    v88 = v0[36];
    v89 = v0[37];
    v91 = v0[32];
    v90 = v0[33];
    v97 = v0[29];
    v99 = v0[26];
    v101 = v0[25];
    v103 = v0[22];
    v105 = v0[21];
    v108 = v0[18];
    v110 = v0[17];
    v112 = v0[14];
    swift_task_dealloc(v0[49]);
    swift_task_dealloc(v83);
    swift_task_dealloc(v84);
    swift_task_dealloc(v85);
    swift_task_dealloc(v86);
    swift_task_dealloc(v87);
    swift_task_dealloc(v89);
    swift_task_dealloc(v88);
    swift_task_dealloc(v90);
    swift_task_dealloc(v91);
    swift_task_dealloc(v97);
    swift_task_dealloc(v99);
    swift_task_dealloc(v101);
    swift_task_dealloc(v103);
    swift_task_dealloc(v105);
    swift_task_dealloc(v108);
    swift_task_dealloc(v110);
    swift_task_dealloc(v112);
    return (id)((uint64_t (*)(void))v0[1])();
  }
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_10000B960()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 456);
  *(_QWORD *)(*v1 + 464) = v0;
  swift_task_dealloc(v3);
  if (v0)
    v4 = sub_10000C7EC;
  else
    v4 = sub_10000B9C0;
  return swift_task_switch(v4, *(_QWORD *)(v2 + 408), *(_QWORD *)(v2 + 416));
}

id sub_10000B9C0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  UIButton v18;
  NSString v19;
  uint64_t v20;
  id v21;
  UIButton v22;
  NSString v23;
  uint64_t v24;
  id v25;
  UIButton v26;
  NSString v27;
  id result;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  Class v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  id v82;
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
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  Class isa;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  UIAction_optional v110;
  UIAction_optional v111;
  UIAction_optional v112;

  v1 = v0[56];
  v101 = v0[40];
  v95 = v0[39];
  v97 = v0[38];
  v108 = v0[26];
  v99 = v0[24];
  v103 = v0[23];
  v2 = v0[20];
  v92 = v0[19];
  v93 = v0[22];
  v3 = v0[16];
  v4 = v0[17];
  v6 = v0[14];
  v5 = v0[15];
  v7 = v0[12];
  v8 = v0[13];
  swift_release(v0[50]);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 104))(v6, enum case for HeadphonePairing.Assets.VideoViewIdentifier.loopCharged(_:), v7);
  v9 = (void *)HeadphonePairing.Assets.videoView(_:)(v6);
  v106 = v10;
  swift_release(v1);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v93, v92);
  (*(void (**)(uint64_t, uint64_t))(v95 + 8))(v101, v97);
  (*(void (**)(uint64_t, uint64_t))(v99 + 8))(v108, v103);
  v11 = (void *)v0[11];
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "setAlpha:", 0.0);
  v12 = objc_msgSend(v9, "layer");
  v13 = objc_msgSend((id)objc_opt_self(UIColor), "redColor");
  v14 = objc_msgSend(v13, "CGColor");

  objc_msgSend(v12, "setBorderColor:", v14);
  v15 = objc_msgSend(v9, "layer");
  objc_msgSend(v15, "setBorderWidth:", 1.0);

  sub_10000D1E8(0, &qword_1000149A0, UIButton_ptr);
  sub_10000D1E8(0, &qword_1000149A8, UIAction_ptr);
  v16 = swift_allocObject(&unk_100011230, 32, 7);
  *(_QWORD *)(v16 + 16) = v9;
  *(_QWORD *)(v16 + 24) = v106;
  v17 = v9;
  v110.value.super.super.isa = (Class)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)(0, 0xE000000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, sub_10000D158, v16);
  v18.super.super.super.super.isa = UIButton.init(type:primaryAction:)(UIButtonTypeSystem, v110).super.super.super.super.isa;
  v19 = String._bridgeToObjectiveC()();
  -[objc_class setTitle:forState:](v18.super.super.super.super.isa, "setTitle:forState:", v19, 0);

  isa = v18.super.super.super.super.isa;
  -[objc_class setTranslatesAutoresizingMaskIntoConstraints:](v18.super.super.super.super.isa, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v20 = swift_allocObject(&unk_100011258, 32, 7);
  *(_QWORD *)(v20 + 16) = v17;
  *(_QWORD *)(v20 + 24) = v106;
  v21 = v17;
  v111.value.super.super.isa = (Class)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)(0, 0xE000000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, sub_10000D188, v20);
  v22.super.super.super.super.isa = UIButton.init(type:primaryAction:)(UIButtonTypeSystem, v111).super.super.super.super.isa;
  v23 = String._bridgeToObjectiveC()();
  -[objc_class setTitle:forState:](v22.super.super.super.super.isa, "setTitle:forState:", v23, 0);

  -[objc_class setTranslatesAutoresizingMaskIntoConstraints:](v22.super.super.super.super.isa, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v24 = swift_allocObject(&unk_100011280, 32, 7);
  *(_QWORD *)(v24 + 16) = v21;
  *(_QWORD *)(v24 + 24) = v106;
  v25 = v21;
  v112.value.super.super.isa = (Class)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)(0, 0xE000000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, sub_10000D194, v24);
  v26.super.super.super.super.isa = UIButton.init(type:primaryAction:)(UIButtonTypeSystem, v112).super.super.super.super.isa;
  v27 = String._bridgeToObjectiveC()();
  -[objc_class setTitle:forState:](v26.super.super.super.super.isa, "setTitle:forState:", v27, 0);

  -[objc_class setTranslatesAutoresizingMaskIntoConstraints:](v26.super.super.super.super.isa, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  result = objc_msgSend(v11, "view");
  if (!result)
  {
    __break(1u);
    goto LABEL_12;
  }
  v29 = result;
  v30 = (void *)v0[11];
  objc_msgSend(result, "addSubview:", v25);

  result = objc_msgSend(v30, "view");
  if (!result)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v31 = result;
  v32 = (void *)v0[11];
  objc_msgSend(result, "addSubview:", v18.super.super.super.super.isa);

  result = objc_msgSend(v32, "view");
  if (!result)
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v33 = result;
  v34 = (void *)v0[11];
  objc_msgSend(result, "addSubview:", v22.super.super.super.super.isa);

  result = objc_msgSend(v34, "view");
  if (!result)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v35 = result;
  v36 = (void *)v0[11];
  objc_msgSend(result, "addSubview:", v26.super.super.super.super.isa);

  v37 = sub_100004B94(&qword_1000149B0);
  v38 = swift_allocObject(v37, 112, 7);
  *(_OWORD *)(v38 + 16) = xmmword_10000E3E0;
  v39 = objc_msgSend(v25, "centerXAnchor");
  result = objc_msgSend(v36, "view");
  if (!result)
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  v40 = result;
  v41 = (void *)v0[11];
  v42 = objc_msgSend(result, "centerXAnchor");

  v43 = objc_msgSend(v39, "constraintEqualToAnchor:", v42);
  *(_QWORD *)(v38 + 32) = v43;
  v44 = objc_msgSend(v25, "centerYAnchor");
  result = objc_msgSend(v41, "view");
  if (!result)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v45 = result;
  v46 = (void *)v0[11];
  v47 = objc_msgSend(result, "centerYAnchor");

  v48 = objc_msgSend(v44, "constraintEqualToAnchor:", v47);
  *(_QWORD *)(v38 + 40) = v48;
  v49 = objc_msgSend(v25, "widthAnchor");
  v50 = objc_msgSend(v49, "constraintEqualToConstant:", 350.0);

  *(_QWORD *)(v38 + 48) = v50;
  v51 = objc_msgSend(v25, "heightAnchor");
  v52 = objc_msgSend(v51, "constraintEqualToConstant:", 362.0);

  *(_QWORD *)(v38 + 56) = v52;
  v53 = -[objc_class centerXAnchor](v22.super.super.super.super.isa, "centerXAnchor");
  result = objc_msgSend(v46, "view");
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  v54 = result;
  v55 = (void *)v0[11];
  v56 = objc_msgSend(result, "centerXAnchor");

  v57 = objc_msgSend(v53, "constraintEqualToAnchor:", v56);
  *(_QWORD *)(v38 + 64) = v57;
  v58 = -[objc_class topAnchor](v22.super.super.super.super.isa, "topAnchor");
  v59 = objc_msgSend(v25, "bottomAnchor");
  v60 = objc_msgSend(v58, "constraintEqualToAnchor:constant:", v59, 10.0);

  *(_QWORD *)(v38 + 72) = v60;
  v61 = -[objc_class centerXAnchor](v26.super.super.super.super.isa, "centerXAnchor");
  result = objc_msgSend(v55, "view");
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v62 = result;
  v63 = (void *)v0[11];
  v64 = objc_msgSend(result, "centerXAnchor");

  v65 = objc_msgSend(v61, "constraintEqualToAnchor:", v64);
  *(_QWORD *)(v38 + 80) = v65;
  v66 = -[objc_class topAnchor](v26.super.super.super.super.isa, "topAnchor");
  v67 = -[objc_class bottomAnchor](v22.super.super.super.super.isa, "bottomAnchor");
  v68 = objc_msgSend(v66, "constraintEqualToAnchor:constant:", v67, 10.0);

  *(_QWORD *)(v38 + 88) = v68;
  v69 = -[objc_class centerXAnchor](v18.super.super.super.super.isa, "centerXAnchor");
  result = objc_msgSend(v63, "view");
  if (result)
  {
    v70 = result;
    v71 = (void *)objc_opt_self(NSLayoutConstraint);
    v72 = objc_msgSend(v70, "centerXAnchor");

    v73 = objc_msgSend(v69, "constraintEqualToAnchor:", v72);
    *(_QWORD *)(v38 + 96) = v73;
    v74 = -[objc_class topAnchor](isa, "topAnchor");
    v75 = -[objc_class bottomAnchor](v26.super.super.super.super.isa, "bottomAnchor");
    v76 = objc_msgSend(v74, "constraintEqualToAnchor:constant:", v75, 10.0);

    *(_QWORD *)(v38 + 104) = v76;
    specialized Array._endMutation()();
    sub_10000D1E8(0, &qword_1000149B8, NSLayoutConstraint_ptr);
    v77 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v38);
    objc_msgSend(v71, "activateConstraints:", v77);

    v78 = (void *)objc_opt_self(UIView);
    v79 = swift_allocObject(&unk_1000112A8, 32, 7);
    *(_QWORD *)(v79 + 16) = v25;
    *(_QWORD *)(v79 + 24) = v106;
    v0[6] = sub_10000D220;
    v0[7] = v79;
    v0[2] = _NSConcreteStackBlock;
    v0[3] = 1107296256;
    v0[4] = sub_10000CA40;
    v0[5] = &unk_1000112C0;
    v80 = _Block_copy(v0 + 2);
    v81 = v0[7];
    v82 = v25;
    swift_release(v81);
    objc_msgSend(v78, "animateWithDuration:animations:", v80, 0.3);

    _Block_release(v80);
    v83 = v0[48];
    v85 = v0[44];
    v84 = v0[45];
    v87 = v0[40];
    v86 = v0[41];
    v88 = v0[36];
    v89 = v0[37];
    v91 = v0[32];
    v90 = v0[33];
    v94 = v0[29];
    v96 = v0[26];
    v98 = v0[25];
    v100 = v0[22];
    v102 = v0[21];
    v105 = v0[18];
    v107 = v0[17];
    v109 = v0[14];
    swift_task_dealloc(v0[49]);
    swift_task_dealloc(v83);
    swift_task_dealloc(v84);
    swift_task_dealloc(v85);
    swift_task_dealloc(v86);
    swift_task_dealloc(v87);
    swift_task_dealloc(v89);
    swift_task_dealloc(v88);
    swift_task_dealloc(v90);
    swift_task_dealloc(v91);
    swift_task_dealloc(v94);
    swift_task_dealloc(v96);
    swift_task_dealloc(v98);
    swift_task_dealloc(v100);
    swift_task_dealloc(v102);
    swift_task_dealloc(v105);
    swift_task_dealloc(v107);
    swift_task_dealloc(v109);
    return (id)((uint64_t (*)(void))v0[1])();
  }
LABEL_19:
  __break(1u);
  return result;
}

uint64_t sub_10000C580()
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
  Swift::String v14;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v1 = *(_QWORD *)(v0 + 424);
  v2 = *(_QWORD *)(v0 + 296);
  v3 = *(_QWORD *)(v0 + 272);
  v4 = *(_QWORD *)(v0 + 280);
  swift_release(*(_QWORD *)(v0 + 400));
  swift_release(v1);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  v5 = *(_QWORD *)(v0 + 440);
  v6 = *(_QWORD *)(v0 + 392);
  v7 = *(_QWORD *)(v0 + 368);
  v8 = *(_QWORD *)(v0 + 376);
  v9 = *(_QWORD *)(v0 + 360);
  v10 = *(_QWORD *)(v0 + 336);
  v11 = *(_QWORD *)(v0 + 344);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 312) + 8))(*(_QWORD *)(v0 + 328), *(_QWORD *)(v0 + 304));
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v9, v10);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  v12 = sub_100004B94(&qword_100014990);
  v13 = swift_allocObject(v12, 64, 7);
  *(_OWORD *)(v13 + 16) = xmmword_10000E3F0;
  _StringGuts.grow(_:)(17);
  *(_QWORD *)(v0 + 64) = 0;
  *(_QWORD *)(v0 + 72) = 0xE000000000000000;
  v14._countAndFlagsBits = 0x6465766965636552;
  v14._object = (void *)0xEF20726F72726520;
  String.append(_:)(v14);
  *(_QWORD *)(v0 + 80) = v5;
  v15 = sub_100004B94(&qword_100014998);
  _print_unlocked<A, B>(_:_:)(v0 + 80, v0 + 64, v15, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v16 = *(_QWORD *)(v0 + 64);
  v17 = *(_QWORD *)(v0 + 72);
  *(_QWORD *)(v13 + 56) = &type metadata for String;
  *(_QWORD *)(v13 + 32) = v16;
  *(_QWORD *)(v13 + 40) = v17;
  print(_:separator:terminator:)(v13, 32, 0xE100000000000000, 10, 0xE100000000000000);
  swift_bridgeObjectRelease(v13);
  swift_errorRelease(v5);
  v18 = *(_QWORD *)(v0 + 384);
  v20 = *(_QWORD *)(v0 + 352);
  v19 = *(_QWORD *)(v0 + 360);
  v22 = *(_QWORD *)(v0 + 320);
  v21 = *(_QWORD *)(v0 + 328);
  v23 = *(_QWORD *)(v0 + 288);
  v24 = *(_QWORD *)(v0 + 296);
  v26 = *(_QWORD *)(v0 + 256);
  v25 = *(_QWORD *)(v0 + 264);
  v28 = *(_QWORD *)(v0 + 232);
  v29 = *(_QWORD *)(v0 + 208);
  v30 = *(_QWORD *)(v0 + 200);
  v31 = *(_QWORD *)(v0 + 176);
  v32 = *(_QWORD *)(v0 + 168);
  v33 = *(_QWORD *)(v0 + 144);
  v34 = *(_QWORD *)(v0 + 136);
  v35 = *(_QWORD *)(v0 + 112);
  swift_task_dealloc(*(_QWORD *)(v0 + 392));
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v20);
  swift_task_dealloc(v21);
  swift_task_dealloc(v22);
  swift_task_dealloc(v24);
  swift_task_dealloc(v23);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  swift_task_dealloc(v33);
  swift_task_dealloc(v34);
  swift_task_dealloc(v35);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000C7EC()
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
  Swift::String v11;
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v1 = *(_QWORD *)(v0 + 448);
  swift_release(*(_QWORD *)(v0 + 400));
  swift_release(v1);
  v2 = *(_QWORD *)(v0 + 464);
  v4 = *(_QWORD *)(v0 + 312);
  v3 = *(_QWORD *)(v0 + 320);
  v5 = *(_QWORD *)(v0 + 304);
  v6 = *(_QWORD *)(v0 + 208);
  v7 = *(_QWORD *)(v0 + 184);
  v8 = *(_QWORD *)(v0 + 192);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 160) + 8))(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 152));
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  v9 = sub_100004B94(&qword_100014990);
  v10 = swift_allocObject(v9, 64, 7);
  *(_OWORD *)(v10 + 16) = xmmword_10000E3F0;
  _StringGuts.grow(_:)(17);
  *(_QWORD *)(v0 + 64) = 0;
  *(_QWORD *)(v0 + 72) = 0xE000000000000000;
  v11._countAndFlagsBits = 0x6465766965636552;
  v11._object = (void *)0xEF20726F72726520;
  String.append(_:)(v11);
  *(_QWORD *)(v0 + 80) = v2;
  v12 = sub_100004B94(&qword_100014998);
  _print_unlocked<A, B>(_:_:)(v0 + 80, v0 + 64, v12, &type metadata for DefaultStringInterpolation, &protocol witness table for DefaultStringInterpolation);
  v13 = *(_QWORD *)(v0 + 64);
  v14 = *(_QWORD *)(v0 + 72);
  *(_QWORD *)(v10 + 56) = &type metadata for String;
  *(_QWORD *)(v10 + 32) = v13;
  *(_QWORD *)(v10 + 40) = v14;
  print(_:separator:terminator:)(v10, 32, 0xE100000000000000, 10, 0xE100000000000000);
  swift_bridgeObjectRelease(v10);
  swift_errorRelease(v2);
  v15 = *(_QWORD *)(v0 + 384);
  v17 = *(_QWORD *)(v0 + 352);
  v16 = *(_QWORD *)(v0 + 360);
  v19 = *(_QWORD *)(v0 + 320);
  v18 = *(_QWORD *)(v0 + 328);
  v20 = *(_QWORD *)(v0 + 288);
  v21 = *(_QWORD *)(v0 + 296);
  v23 = *(_QWORD *)(v0 + 256);
  v22 = *(_QWORD *)(v0 + 264);
  v25 = *(_QWORD *)(v0 + 232);
  v26 = *(_QWORD *)(v0 + 208);
  v27 = *(_QWORD *)(v0 + 200);
  v28 = *(_QWORD *)(v0 + 176);
  v29 = *(_QWORD *)(v0 + 168);
  v30 = *(_QWORD *)(v0 + 144);
  v31 = *(_QWORD *)(v0 + 136);
  v32 = *(_QWORD *)(v0 + 112);
  swift_task_dealloc(*(_QWORD *)(v0 + 392));
  swift_task_dealloc(v15);
  swift_task_dealloc(v16);
  swift_task_dealloc(v17);
  swift_task_dealloc(v18);
  swift_task_dealloc(v19);
  swift_task_dealloc(v21);
  swift_task_dealloc(v20);
  swift_task_dealloc(v22);
  swift_task_dealloc(v23);
  swift_task_dealloc(v25);
  swift_task_dealloc(v26);
  swift_task_dealloc(v27);
  swift_task_dealloc(v28);
  swift_task_dealloc(v29);
  swift_task_dealloc(v30);
  swift_task_dealloc(v31);
  swift_task_dealloc(v32);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10000CA40(uint64_t a1)
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

uint64_t sub_10000CA6C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    sub_10000CFD4(a1);
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
  v16 = swift_allocObject(&unk_100011208, 32, 7);
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
  return swift_task_create(v8, v17, (char *)&type metadata for () + 8, &unk_100014978, v16);
}

id sub_10000CCF4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AssetMovieViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AssetMovieViewController()
{
  return objc_opt_self(_TtC16ProductKitViewer24AssetMovieViewController);
}

uint64_t getEnumTagSinglePayload for AssetMovieViewController.Mode(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
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
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AssetMovieViewController.Mode(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_10000CE20 + 4 * byte_10000E415[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_10000CE54 + 4 * byte_10000E410[v4]))();
}

uint64_t sub_10000CE54(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000CE5C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x10000CE64);
  return result;
}

uint64_t sub_10000CE70(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x10000CE78);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_10000CE7C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000CE84(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_10000CE90(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AssetMovieViewController.Mode()
{
  return &type metadata for AssetMovieViewController.Mode;
}

unint64_t sub_10000CEB0()
{
  unint64_t result;

  result = qword_100014950;
  if (!qword_100014950)
  {
    result = swift_getWitnessTable(&unk_10000E480, &type metadata for AssetMovieViewController.Mode);
    atomic_store(result, (unint64_t *)&qword_100014950);
  }
  return result;
}

uint64_t sub_10000CEF4()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10000CF20(uint64_t a1)
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
  v7 = (_QWORD *)swift_task_alloc(dword_100014964);
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_10000CF8C;
  return sub_10000A774(a1, v4, v5, v6);
}

uint64_t sub_10000CF8C()
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

uint64_t sub_10000CFD4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100004B94(&qword_100014958);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000D014(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10000D078;
  return v6(a1);
}

uint64_t sub_10000D078()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000D0C4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000D0E8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_100014974);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_10000CF8C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_100014970 + dword_100014970))(a1, v4);
}

uint64_t sub_10000D158(uint64_t a1)
{
  return sub_10000D1A0(a1, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of VideoPlaybackControllable.transitionToFeatures());
}

uint64_t sub_10000D164()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000D188(uint64_t a1)
{
  return sub_10000D1A0(a1, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of VideoPlaybackControllable.play());
}

uint64_t sub_10000D194(uint64_t a1)
{
  return sub_10000D1A0(a1, (uint64_t (*)(uint64_t, uint64_t))&dispatch thunk of VideoPlaybackControllable.stop());
}

uint64_t sub_10000D1A0(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v4;
  uint64_t ObjectType;

  v4 = *(_QWORD *)(v2 + 24);
  ObjectType = swift_getObjectType(*(_QWORD *)(v2 + 16));
  return a2(ObjectType, v4);
}

uint64_t sub_10000D1E8(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

id sub_10000D220()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), "setAlpha:", 1.0);
}

uint64_t sub_10000D234(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000D244(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}
