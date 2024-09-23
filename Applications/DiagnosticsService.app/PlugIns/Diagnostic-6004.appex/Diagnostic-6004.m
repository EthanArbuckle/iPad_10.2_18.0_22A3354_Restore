BOOL sub_100004F04(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_100004F1C()
{
  unsigned __int8 *v0;
  Swift::UInt v1;
  _QWORD v3[9];

  v1 = *v0;
  Hasher.init(_seed:)(v3, 0);
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100004F60()
{
  unsigned __int8 *v0;

  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100004F88(uint64_t a1)
{
  unsigned __int8 *v1;
  Swift::UInt v2;
  _QWORD v4[9];

  v2 = *v1;
  Hasher.init(_seed:)(v4, a1);
  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

void sub_100004FC8(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;

  v2 = 1;
  if (*v1)
    v2 = 2;
  *a1 = v2;
}

void *sub_100004FE0(char a1, size_t a2)
{
  uint64_t v4;
  void *result;

  if ((a2 & 0x8000000000000000) != 0)
  {
    result = (void *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
    __break(1u);
  }
  else
  {
    if (!a2)
      return &_swiftEmptyArrayStorage;
    v4 = static Array._allocateBufferUninitialized(minimumCapacity:)(a2, &type metadata for Bool);
    *(_QWORD *)(v4 + 16) = a2;
    memset((void *)(v4 + 32), a1 & 1, a2);
    return (void *)v4;
  }
  return result;
}

void *sub_100005098(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  _QWORD *v10;
  void *result;

  if (a3 < 0)
  {
    result = (void *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Can't construct Array with count < 0", 36, 2, "Swift/Array.swift", 17, 2, 936, 0);
    __break(1u);
  }
  else
  {
    if (a3)
    {
      v6 = static Array._allocateBufferUninitialized(minimumCapacity:)(a3, &type metadata for MicrophoneTestEvaluatingView.ButtonState);
      v7 = v6;
      *(_QWORD *)(v6 + 16) = a3;
      v8 = a1 & 1;
      *(_BYTE *)(v6 + 32) = v8;
      *(_QWORD *)(v6 + 40) = a2;
      if (a3 != 1)
      {
        *(_BYTE *)(v6 + 48) = v8;
        *(_QWORD *)(v6 + 56) = a2;
        v9 = a3 - 2;
        if (v9)
        {
          v10 = (_QWORD *)(v6 + 72);
          do
          {
            *((_BYTE *)v10 - 8) = v8;
            *v10 = a2;
            v10 += 2;
            swift_retain(a2);
            --v9;
          }
          while (v9);
        }
        swift_retain(a2);
      }
    }
    else
    {
      swift_release(a2);
      return &_swiftEmptyArrayStorage;
    }
    return (void *)v7;
  }
  return result;
}

uint64_t sub_10000519C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  void *v19;
  id v20;
  id v21;
  __n128 v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  id v33;
  __n128 v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  id v46;
  __n128 v47;
  double v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t KeyPath;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  char *v68;
  uint64_t result;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char v81[16];
  uint64_t v82;
  uint64_t v83;

  v80 = a1;
  v74 = sub_100008128(&qword_100021728);
  v2 = *(_QWORD *)(v74 - 8);
  __chkstk_darwin(v74);
  v4 = (char *)&v73 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = sub_100008128(&qword_100021730);
  __chkstk_darwin(v73);
  v6 = (char *)&v73 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = sub_100008128(&qword_100021738);
  __chkstk_darwin(v76);
  v8 = (char *)&v73 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100008128(&qword_100021740);
  __chkstk_darwin(v9);
  v75 = (char *)&v73 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100008128(&qword_100021748);
  v78 = *(_QWORD *)(v11 - 8);
  v79 = v11;
  v12 = __chkstk_darwin(v11);
  v77 = (char *)&v73 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = v1;
  v14 = static Axis.Set.vertical.getter(v12);
  v15 = sub_100008128(&qword_100021750);
  v16 = sub_100008BCC();
  v17 = ScrollView.init(_:showsIndicators:content:)(v14, 1, sub_100008BC4, v81, v15, v16);
  v18 = static Edge.Set.horizontal.getter(v17);
  v19 = (void *)objc_opt_self(UIDevice);
  v20 = objc_msgSend(v19, "currentDevice");
  v21 = objc_msgSend(v20, "userInterfaceIdiom");

  v22.n128_u64[0] = 0x4064000000000000;
  if (v21 != (id)1)
    v22.n128_f64[0] = 20.0;
  v23 = EdgeInsets.init(_all:)(v22);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v30 = v74;
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v6, v4, v74);
  v31 = &v6[*(int *)(v73 + 36)];
  *v31 = v18;
  *((double *)v31 + 1) = v23;
  *((_QWORD *)v31 + 2) = v25;
  *((_QWORD *)v31 + 3) = v27;
  *((_QWORD *)v31 + 4) = v29;
  v31[40] = 0;
  v32 = (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v30);
  LOBYTE(v30) = static Edge.Set.top.getter(v32);
  v33 = objc_msgSend(v19, "currentDevice");
  objc_msgSend(v33, "userInterfaceIdiom");

  v34.n128_u64[0] = 0x4044000000000000;
  v35 = EdgeInsets.init(_all:)(v34);
  v37 = v36;
  v39 = v38;
  v41 = v40;
  sub_100009700((uint64_t)v6, (uint64_t)v8, &qword_100021730);
  v42 = &v8[*(int *)(v76 + 36)];
  *v42 = v30;
  *((double *)v42 + 1) = v35;
  *((_QWORD *)v42 + 2) = v37;
  *((_QWORD *)v42 + 3) = v39;
  *((_QWORD *)v42 + 4) = v41;
  v42[40] = 0;
  v43 = sub_100009744((uint64_t)v6, &qword_100021730);
  LOBYTE(v30) = static Edge.Set.bottom.getter(v43);
  v44 = v19;
  v45 = (uint64_t)v75;
  v46 = objc_msgSend(v44, "currentDevice");
  objc_msgSend(v46, "userInterfaceIdiom");

  v47.n128_u64[0] = 20.0;
  v48 = EdgeInsets.init(_all:)(v47);
  v50 = v49;
  v52 = v51;
  v54 = v53;
  sub_100009700((uint64_t)v8, v45, &qword_100021738);
  v55 = v45 + *(int *)(v9 + 36);
  *(_BYTE *)v55 = v30;
  *(double *)(v55 + 8) = v48;
  *(_QWORD *)(v55 + 16) = v50;
  *(_QWORD *)(v55 + 24) = v52;
  *(_QWORD *)(v55 + 32) = v54;
  *(_BYTE *)(v55 + 40) = 0;
  sub_100009744((uint64_t)v8, &qword_100021738);
  v56 = *(_QWORD *)(v1 + 8);
  if (v56)
  {
    KeyPath = swift_getKeyPath(&unk_100018A90);
    v58 = swift_getKeyPath(&unk_100018AB8);
    v59 = swift_retain(v56);
    static Published.subscript.getter(&v83, v59, KeyPath, v58);
    swift_release(v56);
    swift_release(KeyPath);
    swift_release(v58);
    v60 = swift_allocObject(&unk_10001CD78, 216, 7);
    v61 = *(_OWORD *)(v1 + 176);
    *(_OWORD *)(v60 + 176) = *(_OWORD *)(v1 + 160);
    *(_OWORD *)(v60 + 192) = v61;
    *(_QWORD *)(v60 + 208) = *(_QWORD *)(v1 + 192);
    v62 = *(_OWORD *)(v1 + 112);
    *(_OWORD *)(v60 + 112) = *(_OWORD *)(v1 + 96);
    *(_OWORD *)(v60 + 128) = v62;
    v63 = *(_OWORD *)(v1 + 144);
    *(_OWORD *)(v60 + 144) = *(_OWORD *)(v1 + 128);
    *(_OWORD *)(v60 + 160) = v63;
    v64 = *(_OWORD *)(v1 + 48);
    *(_OWORD *)(v60 + 48) = *(_OWORD *)(v1 + 32);
    *(_OWORD *)(v60 + 64) = v64;
    v65 = *(_OWORD *)(v1 + 80);
    *(_OWORD *)(v60 + 80) = *(_OWORD *)(v1 + 64);
    *(_OWORD *)(v60 + 96) = v65;
    v66 = *(_OWORD *)(v1 + 16);
    *(_OWORD *)(v60 + 16) = *(_OWORD *)v1;
    *(_OWORD *)(v60 + 32) = v66;
    sub_100008CA4((_QWORD *)v1);
    v67 = sub_100008DDC(&qword_100021770, &qword_100021740, (void (*)(void))sub_100008DC0);
    v68 = v77;
    View.onChange<A>(of:initial:_:)(&v83, 0, sub_100008C9C, v60, v9, &type metadata for Bool, v67, &protocol witness table for Bool);
    swift_release(v60);
    sub_100009744(v45, &qword_100021740);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v78 + 32))(v80, v68, v79);
  }
  else
  {
    v70 = *(_QWORD *)(v1 + 16);
    v71 = type metadata accessor for AudioManager(0);
    v72 = sub_1000080E0();
    result = EnvironmentObject.error()(0, v70, v71, v72);
    __break(1u);
  }
  return result;
}

_QWORD *sub_10000569C(_QWORD *result)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t KeyPath;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  _QWORD v15[2];

  v1 = *result;
  if ((*result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v2 = result;
    v15[0] = 0;
    v15[1] = v1;
    KeyPath = swift_getKeyPath(&unk_100018AE0);
    v4 = swift_allocObject(&unk_10001CDA0, 216, 7);
    v5 = *((_OWORD *)v2 + 11);
    *(_OWORD *)(v4 + 176) = *((_OWORD *)v2 + 10);
    *(_OWORD *)(v4 + 192) = v5;
    *(_QWORD *)(v4 + 208) = v2[24];
    v6 = *((_OWORD *)v2 + 7);
    *(_OWORD *)(v4 + 112) = *((_OWORD *)v2 + 6);
    *(_OWORD *)(v4 + 128) = v6;
    v7 = *((_OWORD *)v2 + 9);
    *(_OWORD *)(v4 + 144) = *((_OWORD *)v2 + 8);
    *(_OWORD *)(v4 + 160) = v7;
    v8 = *((_OWORD *)v2 + 3);
    *(_OWORD *)(v4 + 48) = *((_OWORD *)v2 + 2);
    *(_OWORD *)(v4 + 64) = v8;
    v9 = *((_OWORD *)v2 + 5);
    *(_OWORD *)(v4 + 80) = *((_OWORD *)v2 + 4);
    *(_OWORD *)(v4 + 96) = v9;
    v10 = *((_OWORD *)v2 + 1);
    *(_OWORD *)(v4 + 16) = *(_OWORD *)v2;
    *(_OWORD *)(v4 + 32) = v10;
    sub_100008CA4(v2);
    v11 = sub_100008128(&qword_100021790);
    v12 = sub_100008128(&qword_100021768);
    v13 = sub_100008EDC();
    v14 = sub_1000090E0(&qword_100021760, &qword_100021768, (uint64_t)&protocol conformance descriptor for VStack<A>);
    return (_QWORD *)ForEach<>.init(_:id:content:)(v15, KeyPath, sub_100008ED4, v4, v11, v12, v13, &protocol witness table for Int, v14);
  }
  return result;
}

uint64_t sub_1000057CC@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v5;
  uint64_t v6;

  v5 = *a1;
  *(_QWORD *)a3 = static HorizontalAlignment.center.getter();
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 1;
  v6 = sub_100008128(&qword_1000217A8);
  return sub_100005828(a2, v5, a3 + *(int *)(v6 + 44));
}

uint64_t sub_100005828@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  _OWORD *v6;
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
  char *v19;
  id v20;
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;

  v36 = a3;
  v35 = type metadata accessor for RoundedRectangle(0);
  __chkstk_darwin(v35);
  v6 = (_OWORD *)((char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = sub_100008128(&qword_1000217B0);
  __chkstk_darwin(v7);
  v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100008128(&qword_1000217B8);
  __chkstk_darwin(v10);
  v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100008128(&qword_1000217C0);
  v14 = __chkstk_darwin(v13);
  v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v9 = static VerticalAlignment.center.getter(v14);
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 1;
  v17 = sub_100008128(&qword_1000217C8);
  v18 = sub_100005ADC(a1, a2, (uint64_t)&v9[*(int *)(v17 + 44)]);
  LOBYTE(a1) = static Edge.Set.all.getter(v18);
  sub_100009700((uint64_t)v9, (uint64_t)v12, &qword_1000217B0);
  v19 = &v12[*(int *)(v10 + 36)];
  *v19 = a1;
  *(_OWORD *)(v19 + 8) = 0u;
  *(_OWORD *)(v19 + 24) = 0u;
  v19[40] = 1;
  sub_100009744((uint64_t)v9, &qword_1000217B0);
  v20 = objc_msgSend((id)objc_opt_self(UIColor), "secondarySystemBackgroundColor");
  v21 = Color.init(uiColor:)(v20);
  LOBYTE(a1) = static Edge.Set.all.getter(v21);
  sub_100009700((uint64_t)v12, (uint64_t)v16, &qword_1000217B8);
  v22 = &v16[*(int *)(v13 + 36)];
  *(_QWORD *)v22 = v21;
  v22[8] = a1;
  sub_100009744((uint64_t)v12, &qword_1000217B8);
  v23 = (char *)v6 + *(int *)(v35 + 20);
  v24 = enum case for RoundedCornerStyle.continuous(_:);
  v25 = type metadata accessor for RoundedCornerStyle(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 104))(v23, v24, v25);
  __asm { FMOV            V0.2D, #12.0 }
  *v6 = _Q0;
  v31 = sub_100008128(&qword_1000217D0);
  v32 = v36;
  v33 = v36 + *(int *)(v31 + 36);
  sub_100008F8C((uint64_t)v6, v33);
  *(_WORD *)(v33 + *(int *)(sub_100008128(&qword_1000217D8) + 36)) = 256;
  sub_100009700((uint64_t)v16, v32, &qword_1000217C0);
  sub_100008FD0((uint64_t)v6);
  return sub_100009744((uint64_t)v16, &qword_1000217C0);
}

uint64_t sub_100005ADC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t KeyPath;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  __int128 v61;
  uint64_t v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint64_t v68;
  unint64_t v69;
  char *v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81;
  uint64_t v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  char v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  int *v99;
  uint64_t v100;
  uint64_t result;
  uint64_t v102;
  uint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void (**v115)(char *, char *, uint64_t);
  uint64_t v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char v121[16];
  uint64_t v122;
  unint64_t v123;
  __int128 v124;
  uint64_t v125;
  _OWORD v126[2];

  v109 = a3;
  v111 = sub_100008128(&qword_1000217E0);
  v110 = *(_QWORD *)(v111 - 8);
  __chkstk_darwin(v111);
  v117 = (char *)&v105 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v118 = sub_100008128(&qword_1000217E8);
  v6 = __chkstk_darwin(v118);
  v108 = (uint64_t)&v105 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v6);
  v107 = (char *)&v105 - v9;
  v10 = __chkstk_darwin(v8);
  v119 = (uint64_t)&v105 - v11;
  __chkstk_darwin(v10);
  v112 = (uint64_t)&v105 - v12;
  v13 = sub_100008128(&qword_1000217F0);
  v14 = __chkstk_darwin(v13);
  v106 = (uint64_t)&v105 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v17 = (char *)&v105 - v16;
  v18 = sub_100008128(&qword_1000217F8);
  v113 = *(_QWORD *)(v18 - 8);
  __chkstk_darwin(v18);
  v20 = (char *)&v105 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_100008128(&qword_100021800);
  v115 = *(void (***)(char *, char *, uint64_t))(v21 - 8);
  v116 = v21;
  __chkstk_darwin(v21);
  v23 = (char *)&v105 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v114 = sub_100008128(&qword_100021808);
  v24 = __chkstk_darwin(v114);
  v105 = (uint64_t)&v105 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __chkstk_darwin(v24);
  v28 = (char *)&v105 - v27;
  __chkstk_darwin(v26);
  v120 = (uint64_t)&v105 - v29;
  v30 = swift_allocObject(&unk_10001CDC8, 224, 7);
  v31 = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(v30 + 176) = *(_OWORD *)(a1 + 160);
  *(_OWORD *)(v30 + 192) = v31;
  v32 = *(_QWORD *)(a1 + 192);
  v33 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v30 + 112) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v30 + 128) = v33;
  v34 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(v30 + 144) = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(v30 + 160) = v34;
  v35 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v30 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v30 + 64) = v35;
  v36 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v30 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v30 + 96) = v36;
  v37 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v30 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v30 + 32) = v37;
  *(_QWORD *)(v30 + 208) = v32;
  *(_QWORD *)(v30 + 216) = a2;
  v122 = a1;
  v123 = a2;
  sub_100008CA4((_QWORD *)a1);
  v38 = sub_100008128(&qword_100021810);
  v39 = sub_100009028();
  Button.init(action:label:)(sub_100009014, v30, sub_100009020, v121, v38, v39);
  v40 = *(_QWORD *)(a1 + 8);
  if (!v40)
    goto LABEL_9;
  KeyPath = swift_getKeyPath(&unk_100018AF8);
  v42 = swift_getKeyPath(&unk_100018B20);
  v43 = swift_retain(v40);
  static Published.subscript.getter(v126, v43, KeyPath, v42);
  swift_release(v40);
  swift_release(KeyPath);
  swift_release(v42);
  v44 = swift_allocObject(&unk_10001CDF0, 224, 7);
  v45 = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(v44 + 176) = *(_OWORD *)(a1 + 160);
  *(_OWORD *)(v44 + 192) = v45;
  v46 = *(_QWORD *)(a1 + 192);
  v47 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v44 + 112) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v44 + 128) = v47;
  v48 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(v44 + 144) = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(v44 + 160) = v48;
  v49 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v44 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v44 + 64) = v49;
  v50 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v44 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v44 + 96) = v50;
  v51 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v44 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v44 + 32) = v51;
  *(_QWORD *)(v44 + 208) = v46;
  *(_QWORD *)(v44 + 216) = a2;
  sub_100008CA4((_QWORD *)a1);
  v52 = sub_1000090E0(&qword_100021840, &qword_1000217F8, (uint64_t)&protocol conformance descriptor for Button<A>);
  View.onChange<A>(of:initial:_:)(v126, 0, sub_1000090D4, v44, v18, &type metadata for Bool, v52, &protocol witness table for Bool);
  swift_release(v44);
  (*(void (**)(char *, uint64_t))(v113 + 8))(v20, v18);
  v126[0] = *(_OWORD *)(a1 + 152);
  sub_100008128(&qword_100021848);
  State.wrappedValue.getter(&v124);
  LOBYTE(v44) = v124;
  v53 = swift_getKeyPath(&unk_100018B40);
  v54 = swift_allocObject(&unk_10001CE18, 17, 7);
  *(_BYTE *)(v54 + 16) = v44;
  v56 = (uint64_t)v115;
  v55 = v116;
  v115[2](v28, v23, v116);
  v57 = (uint64_t *)&v28[*(int *)(v114 + 36)];
  *v57 = v53;
  v57[1] = (uint64_t)sub_100009180;
  v57[2] = v54;
  (*(void (**)(char *, uint64_t))(v56 + 8))(v23, v55);
  v58 = sub_100009898((uint64_t)v28, v120, &qword_100021808);
  *(_QWORD *)v17 = static HorizontalAlignment.leading.getter(v58);
  *((_QWORD *)v17 + 1) = 0;
  v17[16] = 1;
  v59 = sub_100008128(&qword_100021850);
  sub_100007128(a2, (uint64_t)&v17[*(int *)(v59 + 44)]);
  v60 = swift_allocObject(&unk_10001CE40, 224, 7);
  v61 = *(_OWORD *)(a1 + 176);
  *(_OWORD *)(v60 + 176) = *(_OWORD *)(a1 + 160);
  *(_OWORD *)(v60 + 192) = v61;
  v62 = *(_QWORD *)(a1 + 192);
  v63 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)(v60 + 112) = *(_OWORD *)(a1 + 96);
  *(_OWORD *)(v60 + 128) = v63;
  v64 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)(v60 + 144) = *(_OWORD *)(a1 + 128);
  *(_OWORD *)(v60 + 160) = v64;
  v65 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v60 + 48) = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(v60 + 64) = v65;
  v66 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)(v60 + 80) = *(_OWORD *)(a1 + 64);
  *(_OWORD *)(v60 + 96) = v66;
  v67 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v60 + 16) = *(_OWORD *)a1;
  *(_OWORD *)(v60 + 32) = v67;
  *(_QWORD *)(v60 + 208) = v62;
  *(_QWORD *)(v60 + 216) = a2;
  __chkstk_darwin(v60);
  *(&v105 - 2) = a1;
  *(&v105 - 1) = a2;
  sub_100008CA4((_QWORD *)a1);
  v68 = sub_100008128(&qword_100021858);
  v69 = sub_1000091C8();
  v70 = v117;
  Button.init(action:label:)(sub_1000091A0, v60, sub_1000091C0, &v105 - 4, v68, v69);
  v126[0] = *(_OWORD *)(a1 + 56);
  v124 = *(_OWORD *)(a1 + 56);
  sub_100008128(&qword_100021888);
  State.wrappedValue.getter(&v125);
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)(v125 + 16) > a2)
  {
    v115 = (void (**)(char *, char *, uint64_t))v17;
    v116 = v68;
    v71 = *(_BYTE *)(v125 + a2 + 32);
    swift_bridgeObjectRelease(v125);
    v72 = swift_getKeyPath(&unk_100018B40);
    v73 = swift_allocObject(&unk_10001CE68, 17, 7);
    *(_BYTE *)(v73 + 16) = (v71 & 1) == 0;
    v74 = v110;
    v75 = v119;
    v76 = v111;
    v114 = *(_QWORD *)(v110 + 16);
    ((void (*)(uint64_t, char *, uint64_t))v114)(v119, v70, v111);
    v77 = (uint64_t *)(v75 + *(int *)(v118 + 36));
    *v77 = v72;
    v77[1] = (uint64_t)sub_100009A4C;
    v77[2] = v73;
    v113 = *(_QWORD *)(v74 + 8);
    ((void (*)(char *, uint64_t))v113)(v70, v76);
    v78 = v75;
    v79 = v112;
    sub_100009898(v78, v112, &qword_1000217E8);
    v80 = swift_allocObject(&unk_10001CE90, 224, 7);
    v81 = *(_OWORD *)(a1 + 176);
    *(_OWORD *)(v80 + 176) = *(_OWORD *)(a1 + 160);
    *(_OWORD *)(v80 + 192) = v81;
    v82 = *(_QWORD *)(a1 + 192);
    v83 = *(_OWORD *)(a1 + 112);
    *(_OWORD *)(v80 + 112) = *(_OWORD *)(a1 + 96);
    *(_OWORD *)(v80 + 128) = v83;
    v84 = *(_OWORD *)(a1 + 144);
    *(_OWORD *)(v80 + 144) = *(_OWORD *)(a1 + 128);
    *(_OWORD *)(v80 + 160) = v84;
    v85 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)(v80 + 48) = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(v80 + 64) = v85;
    v86 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)(v80 + 80) = *(_OWORD *)(a1 + 64);
    *(_OWORD *)(v80 + 96) = v86;
    v87 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v80 + 16) = *(_OWORD *)a1;
    *(_OWORD *)(v80 + 32) = v87;
    *(_QWORD *)(v80 + 208) = v82;
    *(_QWORD *)(v80 + 216) = a2;
    __chkstk_darwin(v80);
    *(&v105 - 2) = a1;
    *(&v105 - 1) = a2;
    sub_100008CA4((_QWORD *)a1);
    Button.init(action:label:)(sub_100009344, v80, sub_100009364, &v105 - 4, v116, v69);
    v124 = v126[0];
    State.wrappedValue.getter(&v125);
    if (*(_QWORD *)(v125 + 16) > a2)
    {
      v88 = *(_BYTE *)(v125 + a2 + 32);
      swift_bridgeObjectRelease(v125);
      v89 = swift_getKeyPath(&unk_100018B40);
      v90 = swift_allocObject(&unk_10001CEB8, 17, 7);
      *(_BYTE *)(v90 + 16) = (v88 & 1) == 0;
      v91 = (uint64_t)v107;
      ((void (*)(char *, char *, uint64_t))v114)(v107, v70, v76);
      v92 = (uint64_t *)(v91 + *(int *)(v118 + 36));
      *v92 = v89;
      v92[1] = (uint64_t)sub_100009A4C;
      v92[2] = v90;
      ((void (*)(char *, uint64_t))v113)(v70, v76);
      v93 = v119;
      sub_100009898(v91, v119, &qword_1000217E8);
      v94 = v105;
      sub_100009700(v120, v105, &qword_100021808);
      v95 = (uint64_t)v115;
      v96 = v106;
      sub_100009700((uint64_t)v115, v106, &qword_1000217F0);
      sub_100009700(v79, v91, &qword_1000217E8);
      v97 = v108;
      sub_100009700(v93, v108, &qword_1000217E8);
      v98 = v109;
      sub_100009700(v94, v109, &qword_100021808);
      v99 = (int *)sub_100008128(&qword_100021890);
      sub_100009700(v96, v98 + v99[12], &qword_1000217F0);
      v100 = v98 + v99[16];
      *(_QWORD *)v100 = 0;
      *(_BYTE *)(v100 + 8) = 1;
      sub_100009700(v91, v98 + v99[20], &qword_1000217E8);
      sub_100009700(v97, v98 + v99[24], &qword_1000217E8);
      sub_100009744(v93, &qword_1000217E8);
      sub_100009744(v79, &qword_1000217E8);
      sub_100009744(v95, &qword_1000217F0);
      sub_100009744(v120, &qword_100021808);
      sub_100009744(v97, &qword_1000217E8);
      sub_100009744(v91, &qword_1000217E8);
      sub_100009744(v96, &qword_1000217F0);
      return sub_100009744(v94, &qword_100021808);
    }
    goto LABEL_8;
  }
  __break(1u);
LABEL_8:
  __break(1u);
LABEL_9:
  v102 = *(_QWORD *)(a1 + 16);
  v103 = type metadata accessor for AudioManager(0);
  v104 = sub_1000080E0();
  result = EnvironmentObject.error()(0, v102, v103, v104);
  __break(1u);
  return result;
}

_QWORD *sub_1000064C0(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  char *v3;
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
  _QWORD *result;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  __int128 v20;
  char *v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;

  v2 = a1;
  v3 = *(char **)(a1 + 8);
  if (!v3)
    goto LABEL_13;
  v5 = qword_1000216E0;
  swift_retain(*(_QWORD *)(a1 + 8));
  if (v5 == -1)
  {
    if ((a2 & 0x8000000000000000) == 0)
      goto LABEL_4;
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  swift_once(&qword_1000216E0, sub_100009A50);
  if ((a2 & 0x8000000000000000) != 0)
    goto LABEL_9;
LABEL_4:
  v6 = *(_QWORD *)(qword_1000225B0 + 32);
  if (*(_QWORD *)(v6 + 16) <= a2)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v7 = v6 + 16 * a2;
  v8 = *(_QWORD *)(v7 + 32);
  v9 = *(_QWORD *)(v7 + 40);
  swift_bridgeObjectRetain(v9);
  sub_100010BF8(v8, v9);
  swift_bridgeObjectRelease(v9);
  swift_release(v3);
  v22 = *(_OWORD *)(v2 + 152);
  LOBYTE(v20) = 1;
  v10 = sub_100008128(&qword_100021848);
  State.wrappedValue.setter(&v20, v10);
  v22 = *(_OWORD *)(v2 + 120);
  *(_QWORD *)&v20 = a2;
  v11 = sub_100008128(&qword_1000218C8);
  State.wrappedValue.setter(&v20, v11);
  v12 = sub_1000066DC(a2);
  v5 = static Color.blue.getter(v12);
  v22 = *(_OWORD *)(v2 + 136);
  v24 = v22;
  sub_100009898((uint64_t)&v22 + 8, (uint64_t)&v23, &qword_1000218E8);
  v20 = v22;
  sub_1000093CC(&v24);
  sub_1000093F4(&v23);
  v2 = sub_100008128(&qword_1000218F0);
  State.wrappedValue.getter(&v21);
  v3 = v21;
  if ((swift_isUniquelyReferenced_nonNull_native(v21) & 1) == 0)
LABEL_11:
    v3 = sub_100007D84((uint64_t)v3);
  if (*((_QWORD *)v3 + 2) > a2)
  {
    v13 = &v3[16 * a2];
    v14 = *((_QWORD *)v13 + 5);
    *((_QWORD *)v13 + 5) = v5;
    swift_release(v14);
    v20 = v22;
    v19 = v3;
    State.wrappedValue.setter(&v19, v2);
    sub_10000941C(&v24);
    return sub_100009444(&v23);
  }
  __break(1u);
LABEL_13:
  v16 = *(_QWORD *)(v2 + 16);
  v17 = type metadata accessor for AudioManager(0);
  v18 = sub_1000080E0();
  result = (_QWORD *)EnvironmentObject.error()(0, v16, v17, v18);
  __break(1u);
  return result;
}

uint64_t sub_1000066DC(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  char *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  uint64_t v16;
  uint64_t result;
  char *v18;
  void *v19;
  char *v20;
  __int128 v21;
  char *v22;
  __int128 aBlock;
  void (*v24)(uint64_t, void *);
  void *v25;
  uint64_t (*v26)(uint64_t);
  uint64_t v27;
  uint64_t v28;
  char *v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;

  v2 = v1;
  v30 = *(_OWORD *)(v1 + 136);
  v32 = v30;
  sub_100009898((uint64_t)&v30 + 8, (uint64_t)&v31, &qword_1000218E8);
  aBlock = v30;
  sub_1000093CC(&v32);
  sub_1000093F4(&v31);
  v4 = (id)sub_100008128(&qword_1000218F0);
  State.wrappedValue.getter(&v21);
  v5 = (char *)v21;
  if ((swift_isUniquelyReferenced_nonNull_native(v21) & 1) != 0)
  {
    if ((a1 & 0x8000000000000000) == 0)
      goto LABEL_3;
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v5 = sub_100007D84((uint64_t)v5);
  if ((a1 & 0x8000000000000000) != 0)
    goto LABEL_8;
LABEL_3:
  if (*((_QWORD *)v5 + 2) > a1)
  {
    v5[16 * a1 + 32] = 1;
    aBlock = v30;
    v29 = v5;
    State.wrappedValue.setter(&v29, v4);
    sub_10000941C(&v32);
    sub_100009444(&v31);
    v6 = (void *)objc_opt_self(NSTimer);
    v7 = swift_allocObject(&unk_10001CEE0, 224, 7);
    v8 = *(_OWORD *)(v2 + 176);
    *(_OWORD *)(v7 + 176) = *(_OWORD *)(v2 + 160);
    *(_OWORD *)(v7 + 192) = v8;
    v9 = *(_QWORD *)(v2 + 192);
    v10 = *(_OWORD *)(v2 + 112);
    *(_OWORD *)(v7 + 112) = *(_OWORD *)(v2 + 96);
    *(_OWORD *)(v7 + 128) = v10;
    v11 = *(_OWORD *)(v2 + 144);
    *(_OWORD *)(v7 + 144) = *(_OWORD *)(v2 + 128);
    *(_OWORD *)(v7 + 160) = v11;
    v12 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)(v7 + 48) = *(_OWORD *)(v2 + 32);
    *(_OWORD *)(v7 + 64) = v12;
    v13 = *(_OWORD *)(v2 + 80);
    *(_OWORD *)(v7 + 80) = *(_OWORD *)(v2 + 64);
    *(_OWORD *)(v7 + 96) = v13;
    v14 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v7 + 16) = *(_OWORD *)v2;
    *(_OWORD *)(v7 + 32) = v14;
    *(_QWORD *)(v7 + 208) = v9;
    *(_QWORD *)(v7 + 216) = a1;
    v26 = sub_100009994;
    v27 = v7;
    *(_QWORD *)&aBlock = _NSConcreteStackBlock;
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v24 = sub_10000AD18;
    v25 = &unk_10001CEF8;
    v15 = _Block_copy(&aBlock);
    v16 = v27;
    sub_100008CA4((_QWORD *)v2);
    swift_release(v16);
    v4 = objc_msgSend(v6, "scheduledTimerWithTimeInterval:repeats:block:", 1, v15, 0.5);
    _Block_release(v15);
    aBlock = *(_OWORD *)(v2 + 104);
    v29 = (char *)aBlock;
    sub_100009898((uint64_t)&aBlock + 8, (uint64_t)&v28, &qword_1000218D8);
    v21 = aBlock;
    sub_1000093CC(&v29);
    sub_1000093F4(&v28);
    v2 = sub_100008128(&qword_1000218E0);
    State.wrappedValue.getter(&v22);
    v5 = v22;
    result = swift_isUniquelyReferenced_nonNull_native(v22);
    v22 = v5;
    if ((result & 1) != 0)
      goto LABEL_5;
    goto LABEL_10;
  }
LABEL_9:
  __break(1u);
LABEL_10:
  result = sub_100007D70((uint64_t)v5);
  v5 = (char *)result;
  v22 = (char *)result;
LABEL_5:
  if (*((_QWORD *)v5 + 2) <= a1)
  {
    __break(1u);
  }
  else
  {
    v18 = &v5[8 * a1];
    v19 = (void *)*((_QWORD *)v18 + 4);
    *((_QWORD *)v18 + 4) = v4;

    specialized Array._endMutation()();
    v21 = aBlock;
    v20 = v22;
    State.wrappedValue.setter(&v20, v2);
    sub_10000941C(&v29);
    return (uint64_t)sub_100009444(&v28);
  }
  return result;
}

_QWORD *sub_1000069A0@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _QWORD *result;
  int v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;

  v6 = type metadata accessor for Image.ResizingMode(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = *(_OWORD *)(a1 + 136);
  v30 = *(_OWORD *)(a1 + 136);
  sub_100008128(&qword_1000218F0);
  result = State.wrappedValue.getter(&v28);
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_12;
  }
  result = (_QWORD *)v28;
  if (*(_QWORD *)(v28 + 16) <= a2)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v11 = *(unsigned __int8 *)(v28 + 16 * a2 + 32);
  swift_bridgeObjectRelease(v28);
  if (v11)
    v12 = 0xD000000000000010;
  else
    v12 = 0x7269632E79616C70;
  if (v11)
    v13 = 0x8000000100017030;
  else
    v13 = 0xEB00000000656C63;
  v14 = Image.init(systemName:)(v12, v13);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for Image.ResizingMode.stretch(_:), v6);
  v27 = Image.resizable(capInsets:resizingMode:)(v9, v14, 0.0, 0.0, 0.0, 0.0);
  swift_release(v14);
  v15 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v16 = static Alignment.center.getter(v15);
  _FrameLayout.init(width:height:alignment:)(&v30, 0x4041000000000000, 0, 0x4041000000000000, 0, v16, v17);
  v18 = v30;
  v19 = BYTE8(v30);
  v20 = v31;
  v21 = v32;
  v23 = v33;
  v22 = v34;
  v28 = v35;
  result = State.wrappedValue.getter(&v29);
  v24 = v29;
  if (*(_QWORD *)(v29 + 16) > a2)
  {
    v25 = *(_QWORD *)(v29 + 16 * a2 + 40);
    swift_retain(v25);
    swift_bridgeObjectRelease(v24);
    result = (_QWORD *)swift_getKeyPath(&unk_100018B70);
    *(_QWORD *)a3 = v27;
    *(_QWORD *)(a3 + 8) = v18;
    *(_BYTE *)(a3 + 16) = v19;
    *(_QWORD *)(a3 + 24) = v20;
    *(_BYTE *)(a3 + 32) = v21;
    *(_QWORD *)(a3 + 40) = v23;
    *(_QWORD *)(a3 + 48) = v22;
    *(_QWORD *)(a3 + 56) = result;
    *(_QWORD *)(a3 + 64) = v25;
    return result;
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t sub_100006BB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t KeyPath;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  os_log_type_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  __int128 v19;
  char *v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;

  v2 = a1;
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
    goto LABEL_15;
  KeyPath = swift_getKeyPath(&unk_100018AF8);
  v6 = swift_getKeyPath(&unk_100018B20);
  v7 = swift_retain(v3);
  static Published.subscript.getter(&v24, v7, KeyPath, v6);
  swift_release(v3);
  swift_release(KeyPath);
  result = swift_release(v6);
  if ((v24 & 1) == 0)
    return result;
  v9 = static os_log_type_t.info.getter(result);
  if (qword_1000216E8 != -1)
    swift_once(&qword_1000216E8, sub_10000F050);
  v10 = qword_1000225B8;
  if (os_log_type_enabled((os_log_t)qword_1000225B8, v9))
  {
    sub_100008CA4((_QWORD *)v2);
    v11 = swift_slowAlloc(22, -1);
    *(_DWORD *)v11 = 134218240;
    *(_QWORD *)&v24 = a2;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v24, (char *)&v24 + 8, v11 + 4, v11 + 12);
    *(_WORD *)(v11 + 12) = 2048;
    v24 = *(_OWORD *)(v2 + 120);
    sub_100008128(&qword_1000218C8);
    State.wrappedValue.getter(&v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, (char *)&v21 + 8, v11 + 14, v11 + 22);
    sub_100009780((_QWORD *)v2);
    _os_log_impl((void *)&_mh_execute_header, v10, v9, "View: audio audioPlaybackCompleted : Index%ld, selectedPlaybackIndex%ld", (uint8_t *)v11, 0x16u);
    swift_slowDealloc(v11, -1, -1);
  }
  v24 = *(_OWORD *)(v2 + 152);
  LOBYTE(v21) = 0;
  v12 = sub_100008128(&qword_100021848);
  State.wrappedValue.setter(&v21, v12);
  v24 = *(_OWORD *)(v2 + 120);
  v21 = *(_OWORD *)(v2 + 120);
  sub_100008128(&qword_1000218C8);
  State.wrappedValue.getter(&v19);
  sub_100006EF0(v19);
  v21 = v24;
  State.wrappedValue.getter(&v19);
  v13 = v19;
  v21 = *(_OWORD *)(v2 + 56);
  v23 = v21;
  sub_100009898((uint64_t)&v21 + 8, (uint64_t)&v22, &qword_1000218D0);
  v19 = v21;
  sub_1000093CC(&v23);
  sub_1000093F4(&v22);
  v2 = sub_100008128(&qword_100021888);
  State.wrappedValue.getter(&v20);
  v14 = v20;
  if ((swift_isUniquelyReferenced_nonNull_native(v20) & 1) != 0)
  {
    if ((v13 & 0x8000000000000000) == 0)
      goto LABEL_9;
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  v14 = sub_100007D98((uint64_t)v14);
  if ((v13 & 0x8000000000000000) != 0)
    goto LABEL_13;
LABEL_9:
  if (v13 >= *((_QWORD *)v14 + 2))
  {
LABEL_14:
    __break(1u);
LABEL_15:
    v15 = *(_QWORD *)(v2 + 16);
    v16 = type metadata accessor for AudioManager(0);
    v17 = sub_1000080E0();
    result = EnvironmentObject.error()(0, v15, v16, v17);
    __break(1u);
    return result;
  }
  v14[v13 + 32] = 1;
  v19 = v21;
  v18 = v14;
  State.wrappedValue.setter(&v18, v2);
  sub_10000941C(&v23);
  sub_100009444(&v22);
  swift_retain(v3);
  sub_10000F738();
  return swift_release(v3);
}

char *sub_100006EF0(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  __int128 *v5;
  id v6;
  char isUniquelyReferenced_nonNull_native;
  char *v8;
  void *v9;
  char *result;
  __int128 *v11;
  __int128 v12;
  __int128 *v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  v2 = v1;
  v17 = *(_OWORD *)(v1 + 104);
  v19 = v17;
  sub_100009898((uint64_t)&v17 + 8, (uint64_t)&v18, &qword_1000218D8);
  v14 = v17;
  v4 = sub_100008128(&qword_1000218E0);
  v5 = &v14;
  State.wrappedValue.getter(&v12);
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else
  {
    v5 = (__int128 *)v12;
    if (*(_QWORD *)(v12 + 16) > a1)
    {
      v6 = *(id *)(v12 + 8 * a1 + 32);
      swift_bridgeObjectRelease(v5);
      objc_msgSend(v6, "invalidate");

      v14 = v17;
      sub_1000093CC(&v19);
      sub_1000093F4(&v18);
      State.wrappedValue.getter(&v12);
      v5 = (__int128 *)v12;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v12);
      *(_QWORD *)&v12 = v5;
      if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  __break(1u);
LABEL_10:
  v5 = (__int128 *)sub_100007D70((uint64_t)v5);
  *(_QWORD *)&v12 = v5;
LABEL_4:
  if (*((_QWORD *)v5 + 2) <= a1)
  {
    __break(1u);
  }
  else
  {
    v8 = (char *)v5 + 8 * a1;
    v9 = (void *)*((_QWORD *)v8 + 4);
    *((_QWORD *)v8 + 4) = 0;

    specialized Array._endMutation()();
    v14 = v17;
    v16 = v12;
    State.wrappedValue.setter(&v16, v4);
    sub_10000941C(&v19);
    sub_100009444(&v18);
    v14 = *(_OWORD *)(v2 + 136);
    v16 = v14;
    sub_100009898((uint64_t)&v14 + 8, (uint64_t)&v15, &qword_1000218E8);
    v12 = v14;
    sub_1000093CC(&v16);
    sub_1000093F4(&v15);
    v2 = sub_100008128(&qword_1000218F0);
    State.wrappedValue.getter(&v13);
    v5 = v13;
    result = (char *)swift_isUniquelyReferenced_nonNull_native(v13);
    if ((result & 1) != 0)
      goto LABEL_6;
  }
  result = sub_100007D84((uint64_t)v5);
  v5 = (__int128 *)result;
LABEL_6:
  if (*((_QWORD *)v5 + 2) <= a1)
  {
    __break(1u);
  }
  else
  {
    LOBYTE(v5[a1 + 2]) = 1;
    v12 = v14;
    v11 = v5;
    State.wrappedValue.setter(&v11, v2);
    sub_10000941C(&v16);
    return (char *)sub_100009444(&v15);
  }
  return result;
}

uint64_t sub_100007128@<X0>(unint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t KeyPath;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[2];

  v4 = sub_100008128(&qword_1000218A8);
  __chkstk_darwin();
  v6 = (uint64_t *)((char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = type metadata accessor for Text.TruncationMode(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin();
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100008128(&qword_1000218B0);
  result = __chkstk_darwin();
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000216E0 == -1)
  {
    if ((a1 & 0x8000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  result = swift_once(&qword_1000216E0, sub_100009A50);
  if ((a1 & 0x8000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  v15 = *(_QWORD *)(qword_1000225B0 + 32);
  if (*(_QWORD *)(v15 + 16) > a1)
  {
    v16 = v15 + 16 * a1;
    v37 = v4;
    v38 = a2;
    v17 = *(_QWORD *)(v16 + 32);
    v18 = *(_QWORD *)(v16 + 40);
    swift_bridgeObjectRetain(v18);
    v19 = sub_10000946C(v17, v18);
    v21 = v20;
    swift_bridgeObjectRelease(v18);
    v39[0] = v19;
    v39[1] = v21;
    v22 = sub_10000961C();
    v23 = Text.init<A>(_:)(v39, &type metadata for String, v22);
    v35 = v11;
    v36 = v24;
    v25 = v23;
    v27 = v26;
    LOBYTE(v19) = v28 & 1;
    KeyPath = swift_getKeyPath(&unk_100018BA0);
    (*(void (**)(char *, _QWORD, uint64_t))(v8 + 104))(v10, enum case for Text.TruncationMode.tail(_:), v7);
    v30 = v6;
    v31 = v7;
    v32 = swift_getKeyPath(&unk_100018BD0);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)v30 + *(int *)(v37 + 28), v10, v31);
    *v30 = v32;
    sub_100009700((uint64_t)v30, (uint64_t)&v14[*(int *)(v35 + 36)], &qword_1000218A8);
    *(_QWORD *)v14 = v25;
    *((_QWORD *)v14 + 1) = v27;
    v14[16] = v19;
    v33 = v36;
    *((_QWORD *)v14 + 3) = v36;
    *((_QWORD *)v14 + 4) = KeyPath;
    *((_QWORD *)v14 + 5) = 1;
    v14[48] = 0;
    sub_1000096E0(v25, v27, v19);
    swift_bridgeObjectRetain(v33);
    swift_retain(KeyPath);
    sub_100009744((uint64_t)v30, &qword_1000218A8);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v31);
    sub_1000096F0(v25, v27, v19);
    swift_release(KeyPath);
    swift_bridgeObjectRelease(v33);
    v34 = v38;
    sub_100009700((uint64_t)v14, v38, &qword_1000218B0);
    *(_WORD *)(v34 + *(int *)(sub_100008128(&qword_1000218C0) + 36)) = 256;
    return sub_100009744((uint64_t)v14, &qword_1000218B0);
  }
LABEL_7:
  __break(1u);
  return result;
}

_QWORD *sub_100007404@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *result;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;

  v6 = type metadata accessor for Image.ResizingMode(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = Image.init(systemName:)(0xD000000000000015, 0x8000000100016FD0);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for Image.ResizingMode.stretch(_:), v6);
  v34 = Image.resizable(capInsets:resizingMode:)(v9, v10, 0.0, 0.0, 0.0, 0.0);
  swift_release(v10);
  v11 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v12 = static Alignment.center.getter(v11);
  result = _FrameLayout.init(width:height:alignment:)(&v37, 0x4041000000000000, 0, 0x4041000000000000, 0, v12, v13);
  v15 = v37;
  v16 = v38;
  v17 = v39;
  v18 = v40;
  v20 = v41;
  v19 = v42;
  if (qword_1000216E0 == -1)
  {
    if ((a2 & 0x8000000000000000) == 0)
      goto LABEL_3;
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  result = (_QWORD *)swift_once(&qword_1000216E0, sub_100009A50);
  if ((a2 & 0x8000000000000000) != 0)
    goto LABEL_12;
LABEL_3:
  v21 = *(_QWORD *)(qword_1000225B0 + 32);
  if (*(_QWORD *)(v21 + 16) > a2)
  {
    v22 = v21 + 16 * a2;
    v24 = *(_QWORD *)(v22 + 32);
    v23 = *(_QWORD *)(v22 + 40);
    v35 = *(_OWORD *)(a1 + 72);
    swift_bridgeObjectRetain(v23);
    sub_100008128(&qword_100021898);
    State.wrappedValue.getter(&v36);
    v25 = v36;
    if (*(_QWORD *)(v36 + 16) && (v26 = sub_100015FB8(v24, v23), (v27 & 1) != 0))
    {
      v28 = *(unsigned __int8 *)(*(_QWORD *)(v25 + 56) + v26);
      swift_bridgeObjectRelease(v23);
      v29 = swift_bridgeObjectRelease(v25);
      if (v28 == 1)
      {
        v30 = static Color.green.getter(v29);
LABEL_10:
        v32 = v30;
        result = (_QWORD *)swift_getKeyPath(&unk_100018B70);
        *(_QWORD *)a3 = v34;
        *(_QWORD *)(a3 + 8) = 0;
        *(_WORD *)(a3 + 16) = 1;
        *(_QWORD *)(a3 + 24) = v15;
        *(_BYTE *)(a3 + 32) = v16;
        *(_QWORD *)(a3 + 40) = v17;
        *(_BYTE *)(a3 + 48) = v18;
        *(_QWORD *)(a3 + 56) = v20;
        *(_QWORD *)(a3 + 64) = v19;
        *(_QWORD *)(a3 + 72) = result;
        *(_QWORD *)(a3 + 80) = v32;
        return result;
      }
    }
    else
    {
      swift_bridgeObjectRelease(v23);
      swift_bridgeObjectRelease(v25);
    }
    v31 = objc_msgSend((id)objc_opt_self(UIColor), "lightGrayColor");
    v30 = Color.init(uiColor:)(v31);
    goto LABEL_10;
  }
LABEL_13:
  __break(1u);
  return result;
}

_QWORD *sub_100007660(_QWORD *result, unint64_t a2, char a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v12;
  void (*v13)(unint64_t);
  unint64_t v14;
  unint64_t v15;
  __int128 v16;
  unint64_t v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v5 = result;
  if (qword_1000216E0 == -1)
  {
    if ((a2 & 0x8000000000000000) == 0)
      goto LABEL_3;
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  result = (_QWORD *)swift_once(&qword_1000216E0, sub_100009A50);
  if ((a2 & 0x8000000000000000) != 0)
    goto LABEL_8;
LABEL_3:
  v6 = *(_QWORD *)(qword_1000225B0 + 32);
  if (*(_QWORD *)(v6 + 16) <= a2)
  {
LABEL_9:
    __break(1u);
    return result;
  }
  v7 = v6 + 16 * a2;
  v9 = *(_QWORD *)(v7 + 32);
  v8 = *(_QWORD *)(v7 + 40);
  v18 = *(_OWORD *)(v5 + 9);
  v20 = v18;
  sub_100009898((uint64_t)&v18 + 8, (uint64_t)&v19, &qword_1000218A0);
  swift_bridgeObjectRetain(v8);
  sub_1000093CC(&v20);
  sub_1000093F4(&v19);
  v10 = sub_100008128(&qword_100021898);
  State.wrappedValue.getter(&v17);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(v17);
  *(_QWORD *)&v16 = v17;
  v17 = 0x8000000000000000;
  sub_100014620(a3 & 1, v9, v8, isUniquelyReferenced_nonNull_native);
  v12 = v17;
  v17 = v16;
  swift_bridgeObjectRelease(v8);
  swift_bridgeObjectRelease(v12);
  v16 = v18;
  v15 = v17;
  State.wrappedValue.setter(&v15, v10);
  sub_10000941C(&v20);
  result = sub_100009444(&v19);
  v13 = (void (*)(unint64_t))v5[23];
  if (v13)
  {
    v16 = v18;
    State.wrappedValue.getter(&v17);
    v14 = v17;
    v13(v17);
    return (_QWORD *)swift_bridgeObjectRelease(v14);
  }
  return result;
}

_QWORD *sub_10000780C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *result;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;

  v6 = type metadata accessor for Image.ResizingMode(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = Image.init(systemName:)(0xD00000000000001BLL, 0x8000000100016FB0);
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for Image.ResizingMode.stretch(_:), v6);
  v34 = Image.resizable(capInsets:resizingMode:)(v9, v10, 0.0, 0.0, 0.0, 0.0);
  swift_release(v10);
  v11 = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v12 = static Alignment.center.getter(v11);
  result = _FrameLayout.init(width:height:alignment:)(&v37, 0x4041000000000000, 0, 0x4041000000000000, 0, v12, v13);
  v15 = v37;
  v16 = v38;
  v17 = v39;
  v18 = v40;
  v20 = v41;
  v19 = v42;
  if (qword_1000216E0 == -1)
  {
    if ((a2 & 0x8000000000000000) == 0)
      goto LABEL_3;
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  result = (_QWORD *)swift_once(&qword_1000216E0, sub_100009A50);
  if ((a2 & 0x8000000000000000) != 0)
    goto LABEL_12;
LABEL_3:
  v21 = *(_QWORD *)(qword_1000225B0 + 32);
  if (*(_QWORD *)(v21 + 16) > a2)
  {
    v22 = v21 + 16 * a2;
    v24 = *(_QWORD *)(v22 + 32);
    v23 = *(_QWORD *)(v22 + 40);
    v35 = *(_OWORD *)(a1 + 72);
    swift_bridgeObjectRetain(v23);
    sub_100008128(&qword_100021898);
    State.wrappedValue.getter(&v36);
    v25 = v36;
    if (*(_QWORD *)(v36 + 16) && (v26 = sub_100015FB8(v24, v23), (v27 & 1) != 0))
    {
      v28 = *(_BYTE *)(*(_QWORD *)(v25 + 56) + v26);
      swift_bridgeObjectRelease(v23);
      v29 = swift_bridgeObjectRelease(v25);
      if ((v28 & 1) == 0)
      {
        v30 = static Color.red.getter(v29);
LABEL_10:
        v32 = v30;
        result = (_QWORD *)swift_getKeyPath(&unk_100018B70);
        *(_QWORD *)a3 = v34;
        *(_QWORD *)(a3 + 8) = 0;
        *(_WORD *)(a3 + 16) = 1;
        *(_QWORD *)(a3 + 24) = v15;
        *(_BYTE *)(a3 + 32) = v16;
        *(_QWORD *)(a3 + 40) = v17;
        *(_BYTE *)(a3 + 48) = v18;
        *(_QWORD *)(a3 + 56) = v20;
        *(_QWORD *)(a3 + 64) = v19;
        *(_QWORD *)(a3 + 72) = result;
        *(_QWORD *)(a3 + 80) = v32;
        return result;
      }
    }
    else
    {
      swift_bridgeObjectRelease(v23);
      swift_bridgeObjectRelease(v25);
    }
    v31 = objc_msgSend((id)objc_opt_self(UIColor), "lightGrayColor");
    v30 = Color.init(uiColor:)(v31);
    goto LABEL_10;
  }
LABEL_13:
  __break(1u);
  return result;
}

void sub_100007A64(uint64_t a1)
{
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t Strong;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1)
  {
    KeyPath = swift_getKeyPath(&unk_100018A90);
    v3 = swift_getKeyPath(&unk_100018AB8);
    v4 = swift_retain(v1);
    static Published.subscript.getter(&v11, v4, KeyPath, v3);
    swift_release(v1);
    swift_release(KeyPath);
    swift_release(v3);
    if ((v11 & 1) != 0)
    {
      v5 = sub_100014E58((uint64_t)&_swiftEmptyArrayStorage);
      if (qword_1000216F8 != -1)
        swift_once(&qword_1000216F8, sub_100014F9C);
      Strong = swift_unknownObjectWeakLoadStrong(qword_1000225D8 + 16);
      if (Strong)
      {
        v7 = (void *)Strong;
        sub_100015ACC(3, v5);
        swift_bridgeObjectRelease(v5);

      }
      else
      {
        swift_bridgeObjectRelease(v5);
      }
    }
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 16);
    v9 = type metadata accessor for AudioManager(0);
    v10 = sub_1000080E0();
    EnvironmentObject.error()(0, v8, v9, v10);
    __break(1u);
  }
}

uint64_t sub_100007B8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD v5[6];

  v5[2] = a2;
  v5[3] = a3;
  v3 = static Animation.default.getter();
  withAnimation<A>(_:_:)(v3, sub_1000099B8, v5, (char *)&type metadata for () + 8);
  return swift_release(v3);
}

char *sub_100007BE8(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *result;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v9 = *(_OWORD *)(a1 + 136);
  v11 = v9;
  sub_100009898((uint64_t)&v9 + 8, (uint64_t)&v10, &qword_1000218E8);
  v7 = v9;
  sub_1000093CC(&v11);
  sub_1000093F4(&v10);
  v3 = sub_100008128(&qword_1000218F0);
  State.wrappedValue.getter(&v8);
  v4 = v8;
  result = (char *)swift_isUniquelyReferenced_nonNull_native(v8);
  if ((result & 1) != 0)
  {
    if ((a2 & 0x8000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  result = sub_100007D84(v4);
  v4 = (uint64_t)result;
  if ((a2 & 0x8000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if (*(_QWORD *)(v4 + 16) > a2)
  {
    *(_BYTE *)(v4 + 16 * a2 + 32) = (*(_BYTE *)(v4 + 16 * a2 + 32) & 1) == 0;
    v7 = v9;
    v6 = v4;
    State.wrappedValue.setter(&v6, v3);
    sub_10000941C(&v11);
    return (char *)sub_100009444(&v10);
  }
LABEL_7:
  __break(1u);
  return result;
}

uint64_t sub_100007CF8()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100007D10@<X0>(uint64_t a1@<X8>)
{
  return sub_10000519C(a1);
}

uint64_t sub_100007D70(uint64_t a1)
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(_QWORD *)(a1 + 16), 0, a1);
}

char *sub_100007D84(uint64_t a1)
{
  return sub_10000DCF4(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_100007D98(uint64_t a1)
{
  return sub_10000DE00(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_100007DAC(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v6;

  type metadata accessor for Text.TruncationMode(0);
  __chkstk_darwin();
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v4 + 16))(v3, a1);
  return EnvironmentValues.truncationMode.setter(v3);
}

void *sub_100007E28@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  _OWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _OWORD *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  size_t v18;
  void *v19;
  uint64_t v20;
  void *result;
  _OWORD *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _OWORD *v31;
  uint64_t v32;
  _BYTE v33[7];
  _BYTE v34[7];

  v2 = type metadata accessor for AudioManager(0);
  v3 = sub_1000080E0();
  v4 = EnvironmentObject.init()(v2, v3);
  v28 = v5;
  v29 = v4;
  LOBYTE(v30) = 0;
  State.init(wrappedValue:)(&v31, &v30, &type metadata for Bool);
  v26 = (char)v31;
  v27 = v32;
  LOBYTE(v30) = 0;
  State.init(wrappedValue:)(&v31, &v30, &type metadata for Bool);
  v24 = (char)v31;
  v25 = v32;
  v30 = 0x3FF0000000000000;
  State.init(wrappedValue:)(&v31, &v30, &type metadata for Double);
  v6 = v31;
  v23 = v32;
  v7 = sub_100008128(&qword_100021708);
  v8 = (_OWORD *)swift_allocObject(v7, 64, 7);
  v8[1] = xmmword_100018940;
  v8[2] = 0u;
  v8[3] = 0u;
  v31 = v8;
  specialized Array._endMutation()();
  v30 = (uint64_t)v31;
  v9 = sub_100008128(&qword_100021710);
  State.init(wrappedValue:)(&v31, &v30, v9);
  v10 = v32;
  v22 = v31;
  v30 = 0;
  State.init(wrappedValue:)(&v31, &v30, &type metadata for Int);
  v11 = v31;
  v12 = v32;
  LOBYTE(v30) = 0;
  State.init(wrappedValue:)(&v31, &v30, &type metadata for Bool);
  v13 = (char)v31;
  v14 = v32;
  LOBYTE(v30) = 2;
  v15 = sub_100008128(&qword_100021718);
  State.init(wrappedValue:)(&v31, &v30, v15);
  v16 = (char)v31;
  v17 = v32;
  if (qword_1000216E0 != -1)
    swift_once(&qword_1000216E0, sub_100009A50);
  v18 = *(_QWORD *)(*(_QWORD *)(qword_1000225B0 + 32) + 16);
  v19 = sub_100004FE0(0, v18);
  v20 = static Color.black.getter();
  result = sub_100005098(0, v20, v18);
  *(_QWORD *)a1 = v18;
  *(_QWORD *)(a1 + 8) = v29;
  *(_QWORD *)(a1 + 16) = v28;
  *(_BYTE *)(a1 + 24) = v26;
  *(_DWORD *)(a1 + 25) = (_DWORD)v31;
  *(_DWORD *)(a1 + 28) = *(_DWORD *)((char *)&v31 + 3);
  *(_QWORD *)(a1 + 32) = v27;
  *(_BYTE *)(a1 + 40) = v24;
  *(_DWORD *)(a1 + 41) = v30;
  *(_DWORD *)(a1 + 44) = *(_DWORD *)((char *)&v30 + 3);
  *(_QWORD *)(a1 + 48) = v25;
  *(_QWORD *)(a1 + 56) = v19;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = &_swiftEmptyDictionarySingleton;
  *(_QWORD *)(a1 + 80) = 0;
  *(_QWORD *)(a1 + 88) = v6;
  *(_QWORD *)(a1 + 96) = v23;
  *(_QWORD *)(a1 + 104) = v22;
  *(_QWORD *)(a1 + 112) = v10;
  *(_QWORD *)(a1 + 120) = v11;
  *(_QWORD *)(a1 + 128) = v12;
  *(_QWORD *)(a1 + 136) = result;
  *(_QWORD *)(a1 + 144) = 0;
  *(_BYTE *)(a1 + 152) = v13;
  *(_DWORD *)(a1 + 156) = *(_DWORD *)&v34[3];
  *(_DWORD *)(a1 + 153) = *(_DWORD *)v34;
  *(_QWORD *)(a1 + 160) = v14;
  *(_BYTE *)(a1 + 168) = v16;
  *(_DWORD *)(a1 + 172) = *(_DWORD *)&v33[3];
  *(_DWORD *)(a1 + 169) = *(_DWORD *)v33;
  *(_QWORD *)(a1 + 176) = v17;
  *(_QWORD *)(a1 + 184) = 0;
  *(_QWORD *)(a1 + 192) = 0;
  return result;
}

unint64_t sub_1000080E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021700;
  if (!qword_100021700)
  {
    v1 = type metadata accessor for AudioManager(255);
    result = swift_getWitnessTable(&unk_100018ED0, v1);
    atomic_store(result, (unint64_t *)&qword_100021700);
  }
  return result;
}

uint64_t sub_100008128(uint64_t *a1)
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

uint64_t initializeBufferWithCopyOfBuffer for MicrophoneTestEvaluatingView.ButtonState(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v3;
  swift_retain(v3);
  return a1;
}

uint64_t destroy for MicrophoneTestEvaluatingView.ButtonState(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 8));
}

uint64_t assignWithCopy for MicrophoneTestEvaluatingView.ButtonState(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v3;
  swift_retain(v3);
  swift_release(v4);
  return a1;
}

__n128 initializeWithTake for MicrophoneTestEvaluatingView.ButtonState(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t assignWithTake for MicrophoneTestEvaluatingView.ButtonState(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_release(v3);
  return a1;
}

uint64_t getEnumTagSinglePayload for MicrophoneTestEvaluatingView.ButtonState(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for MicrophoneTestEvaluatingView.ButtonState(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for MicrophoneTestEvaluatingView.ButtonState()
{
  return &type metadata for MicrophoneTestEvaluatingView.ButtonState;
}

_BYTE *initializeBufferWithCopyOfBuffer for MicrophoneTestEvaluatingView.AlertType(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MicrophoneTestEvaluatingView.AlertType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for MicrophoneTestEvaluatingView.AlertType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1000083A8 + 4 * byte_100018955[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1000083DC + 4 * byte_100018950[v4]))();
}

uint64_t sub_1000083DC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1000083E4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1000083ECLL);
  return result;
}

uint64_t sub_1000083F8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x100008400);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_100008404(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_10000840C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_100008418(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_100008424(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for MicrophoneTestEvaluatingView.AlertType()
{
  return &type metadata for MicrophoneTestEvaluatingView.AlertType;
}

uint64_t initializeBufferWithCopyOfBuffer for MicrophoneTestEvaluatingView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for MicrophoneTestEvaluatingView(_QWORD *a1)
{
  uint64_t result;

  swift_release(a1[1]);
  swift_release(a1[4]);
  swift_release(a1[6]);
  swift_bridgeObjectRelease(a1[7]);
  swift_release(a1[8]);
  swift_bridgeObjectRelease(a1[9]);
  swift_release(a1[10]);
  swift_release(a1[12]);
  swift_bridgeObjectRelease(a1[13]);
  swift_release(a1[14]);
  swift_release(a1[16]);
  swift_bridgeObjectRelease(a1[17]);
  swift_release(a1[18]);
  swift_release(a1[20]);
  result = swift_release(a1[22]);
  if (a1[23])
    return swift_release(a1[24]);
  return result;
}

uint64_t initializeWithCopy for MicrophoneTestEvaluatingView(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  _OWORD *v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v5;
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v6 = *(_QWORD *)(a2 + 48);
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = v6;
  *(_QWORD *)(a1 + 56) = v7;
  v9 = *(_QWORD *)(a2 + 64);
  v8 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = v9;
  *(_QWORD *)(a1 + 72) = v8;
  v11 = *(_QWORD *)(a2 + 80);
  v10 = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 80) = v11;
  *(_QWORD *)(a1 + 88) = v10;
  v12 = *(_QWORD *)(a2 + 96);
  v17 = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 96) = v12;
  *(_QWORD *)(a1 + 104) = v17;
  v13 = *(_QWORD *)(a2 + 120);
  v19 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 112) = v19;
  *(_QWORD *)(a1 + 120) = v13;
  v18 = *(_QWORD *)(a2 + 128);
  v22 = *(_QWORD *)(a2 + 136);
  *(_QWORD *)(a1 + 128) = v18;
  *(_QWORD *)(a1 + 136) = v22;
  v23 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 144) = v23;
  v14 = (_OWORD *)(a2 + 184);
  v24 = *(_QWORD *)(a2 + 184);
  *(_BYTE *)(a1 + 152) = *(_BYTE *)(a2 + 152);
  v21 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 160) = v21;
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  v20 = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 176) = v20;
  swift_retain(v4);
  swift_retain(v5);
  swift_retain(v6);
  swift_bridgeObjectRetain(v7);
  swift_retain(v9);
  swift_bridgeObjectRetain(v8);
  swift_retain(v11);
  swift_retain(v12);
  swift_bridgeObjectRetain(v17);
  swift_retain(v19);
  swift_retain(v18);
  swift_bridgeObjectRetain(v22);
  swift_retain(v23);
  swift_retain(v21);
  swift_retain(v20);
  if (v24)
  {
    v15 = *(_QWORD *)(a2 + 192);
    *(_QWORD *)(a1 + 184) = v24;
    *(_QWORD *)(a1 + 192) = v15;
    swift_retain(v15);
  }
  else
  {
    *(_OWORD *)(a1 + 184) = *v14;
  }
  return a1;
}

uint64_t assignWithCopy for MicrophoneTestEvaluatingView(uint64_t a1, uint64_t a2)
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

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v5;
  swift_retain(v5);
  swift_release(v4);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 32) = v7;
  swift_retain(v7);
  swift_release(v6);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 48) = v9;
  swift_retain(v9);
  swift_release(v8);
  v10 = *(_QWORD *)(a2 + 56);
  v11 = *(_QWORD *)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v10;
  swift_bridgeObjectRetain(v10);
  swift_bridgeObjectRelease(v11);
  v12 = *(_QWORD *)(a1 + 64);
  v13 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 64) = v13;
  swift_retain(v13);
  swift_release(v12);
  v14 = *(_QWORD *)(a2 + 72);
  v15 = *(_QWORD *)(a1 + 72);
  *(_QWORD *)(a1 + 72) = v14;
  swift_bridgeObjectRetain(v14);
  swift_bridgeObjectRelease(v15);
  v16 = *(_QWORD *)(a1 + 80);
  v17 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 80) = v17;
  swift_retain(v17);
  swift_release(v16);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  v18 = *(_QWORD *)(a1 + 96);
  v19 = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 96) = v19;
  swift_retain(v19);
  swift_release(v18);
  v20 = *(_QWORD *)(a2 + 104);
  v21 = *(_QWORD *)(a1 + 104);
  *(_QWORD *)(a1 + 104) = v20;
  swift_bridgeObjectRetain(v20);
  swift_bridgeObjectRelease(v21);
  v22 = *(_QWORD *)(a1 + 112);
  v23 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 112) = v23;
  swift_retain(v23);
  swift_release(v22);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  v24 = *(_QWORD *)(a1 + 128);
  v25 = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 128) = v25;
  swift_retain(v25);
  swift_release(v24);
  v26 = *(_QWORD *)(a2 + 136);
  v27 = *(_QWORD *)(a1 + 136);
  *(_QWORD *)(a1 + 136) = v26;
  swift_bridgeObjectRetain(v26);
  swift_bridgeObjectRelease(v27);
  v28 = *(_QWORD *)(a1 + 144);
  v29 = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 144) = v29;
  swift_retain(v29);
  swift_release(v28);
  *(_BYTE *)(a1 + 152) = *(_BYTE *)(a2 + 152);
  v30 = *(_QWORD *)(a1 + 160);
  v31 = *(_QWORD *)(a2 + 160);
  *(_QWORD *)(a1 + 160) = v31;
  swift_retain(v31);
  swift_release(v30);
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  v32 = *(_QWORD *)(a1 + 176);
  v33 = *(_QWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 176) = v33;
  swift_retain(v33);
  swift_release(v32);
  v34 = *(_QWORD *)(a2 + 184);
  if (!*(_QWORD *)(a1 + 184))
  {
    if (v34)
    {
      v37 = *(_QWORD *)(a2 + 192);
      *(_QWORD *)(a1 + 184) = v34;
      *(_QWORD *)(a1 + 192) = v37;
      swift_retain(v37);
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
    return a1;
  }
  if (!v34)
  {
    swift_release(*(_QWORD *)(a1 + 192));
    goto LABEL_7;
  }
  v35 = *(_QWORD *)(a2 + 192);
  v36 = *(_QWORD *)(a1 + 192);
  *(_QWORD *)(a1 + 184) = v34;
  *(_QWORD *)(a1 + 192) = v35;
  swift_retain(v35);
  swift_release(v36);
  return a1;
}

__n128 initializeWithTake for MicrophoneTestEvaluatingView(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __n128 result;
  __int128 v9;
  __int128 v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  v5 = *(_OWORD *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v7;
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 96) = v6;
  result = *(__n128 *)(a2 + 144);
  v9 = *(_OWORD *)(a2 + 160);
  v10 = *(_OWORD *)(a2 + 176);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 160) = v9;
  *(_OWORD *)(a1 + 176) = v10;
  *(__n128 *)(a1 + 144) = result;
  return result;
}

uint64_t assignWithTake for MicrophoneTestEvaluatingView(uint64_t a1, uint64_t a2)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = *(_QWORD *)(a1 + 8);
  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v5;
  swift_release(v4);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_release(v6);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  swift_release(*(_QWORD *)(a1 + 48));
  v7 = *(_QWORD *)(a1 + 56);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  swift_bridgeObjectRelease(v7);
  swift_release(*(_QWORD *)(a1 + 64));
  v8 = *(_QWORD *)(a1 + 72);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRelease(v8);
  v9 = *(_QWORD *)(a1 + 80);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_release(v9);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  swift_release(*(_QWORD *)(a1 + 96));
  v10 = *(_QWORD *)(a1 + 104);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  swift_bridgeObjectRelease(v10);
  v11 = *(_QWORD *)(a1 + 112);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_release(v11);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_release(*(_QWORD *)(a1 + 128));
  v12 = *(_QWORD *)(a1 + 136);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  swift_bridgeObjectRelease(v12);
  v13 = *(_QWORD *)(a1 + 144);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  swift_release(v13);
  *(_BYTE *)(a1 + 152) = *(_BYTE *)(a2 + 152);
  v14 = *(_QWORD *)(a1 + 160);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_release(v14);
  *(_BYTE *)(a1 + 168) = *(_BYTE *)(a2 + 168);
  v15 = *(_QWORD *)(a1 + 176);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);
  swift_release(v15);
  v16 = *(_QWORD *)(a2 + 184);
  if (!*(_QWORD *)(a1 + 184))
  {
    if (v16)
    {
      v19 = *(_QWORD *)(a2 + 192);
      *(_QWORD *)(a1 + 184) = v16;
      *(_QWORD *)(a1 + 192) = v19;
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
    return a1;
  }
  if (!v16)
  {
    swift_release(*(_QWORD *)(a1 + 192));
    goto LABEL_7;
  }
  v17 = *(_QWORD *)(a2 + 192);
  v18 = *(_QWORD *)(a1 + 192);
  *(_QWORD *)(a1 + 184) = v16;
  *(_QWORD *)(a1 + 192) = v17;
  swift_release(v18);
  return a1;
}

uint64_t getEnumTagSinglePayload for MicrophoneTestEvaluatingView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 200))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 56);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MicrophoneTestEvaluatingView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 184) = 0u;
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
      *(_BYTE *)(result + 200) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 56) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 200) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MicrophoneTestEvaluatingView()
{
  return &type metadata for MicrophoneTestEvaluatingView;
}

uint64_t sub_100008B60(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001A738, 1);
}

void *sub_100008B70()
{
  return &protocol witness table for Int;
}

unint64_t sub_100008B80()
{
  unint64_t result;

  result = qword_100021720;
  if (!qword_100021720)
  {
    result = swift_getWitnessTable(&unk_100018A68, &type metadata for MicrophoneTestEvaluatingView.AlertType);
    atomic_store(result, (unint64_t *)&qword_100021720);
  }
  return result;
}

_QWORD *sub_100008BC4()
{
  uint64_t v0;

  return sub_10000569C(*(_QWORD **)(v0 + 16));
}

unint64_t sub_100008BCC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021758;
  if (!qword_100021758)
  {
    v1 = sub_100008C48(&qword_100021750);
    sub_1000090E0(&qword_100021760, &qword_100021768, (uint64_t)&protocol conformance descriptor for VStack<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v1);
    atomic_store(result, (unint64_t *)&qword_100021758);
  }
  return result;
}

uint64_t sub_100008C48(uint64_t *a1)
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

uint64_t sub_100008C94()
{
  return sub_1000098E4(216);
}

void sub_100008C9C()
{
  uint64_t v0;

  sub_100007A64(v0 + 16);
}

_QWORD *sub_100008CA4(_QWORD *a1)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = a1[1];
  v3 = a1[4];
  v4 = a1[6];
  v5 = a1[7];
  v6 = a1[8];
  v7 = a1[9];
  v8 = a1[10];
  v9 = a1[12];
  v10 = a1[13];
  v12 = a1[14];
  v13 = a1[16];
  v14 = a1[17];
  v15 = a1[18];
  v18 = a1[23];
  v16 = a1[20];
  v17 = a1[24];
  swift_retain(a1[22]);
  swift_retain(v2);
  swift_retain(v3);
  swift_retain(v4);
  swift_bridgeObjectRetain(v5);
  swift_retain(v6);
  swift_bridgeObjectRetain(v7);
  swift_retain(v8);
  swift_retain(v9);
  swift_bridgeObjectRetain(v10);
  swift_retain(v12);
  swift_retain(v13);
  swift_bridgeObjectRetain(v14);
  swift_retain(v15);
  swift_retain(v16);
  sub_100008DB0(v18, v17);
  return a1;
}

uint64_t sub_100008DB0(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t sub_100008DC0()
{
  return sub_100008DDC(&qword_100021778, &qword_100021738, (void (*)(void))sub_100008E48);
}

uint64_t sub_100008DDC(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100008C48(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100008E48()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021780;
  if (!qword_100021780)
  {
    v1 = sub_100008C48(&qword_100021730);
    sub_1000090E0(&qword_100021788, &qword_100021728, (uint64_t)&protocol conformance descriptor for ScrollView<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100021780);
  }
  return result;
}

uint64_t sub_100008ECC()
{
  return sub_1000098E4(216);
}

uint64_t sub_100008ED4@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return sub_1000057CC(a1, v2 + 16, a2);
}

unint64_t sub_100008EDC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021798;
  if (!qword_100021798)
  {
    v1 = sub_100008C48(&qword_100021790);
    sub_100008F48();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> Range<A>, v1);
    atomic_store(result, (unint64_t *)&qword_100021798);
  }
  return result;
}

unint64_t sub_100008F48()
{
  unint64_t result;

  result = qword_1000217A0;
  if (!qword_1000217A0)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_1000217A0);
  }
  return result;
}

uint64_t sub_100008F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for RoundedRectangle(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100008FD0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RoundedRectangle(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000900C()
{
  return sub_1000098E4(224);
}

_QWORD *sub_100009014()
{
  uint64_t v0;

  return sub_1000064C0(v0 + 16, *(_QWORD *)(v0 + 216));
}

_QWORD *sub_100009020@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1000069A0(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_100009028()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021818;
  if (!qword_100021818)
  {
    v1 = sub_100008C48(&qword_100021810);
    sub_1000092D0(&qword_100021820, &qword_100021828);
    sub_1000090E0(&qword_100021830, &qword_100021838, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100021818);
  }
  return result;
}

uint64_t sub_1000090CC()
{
  return sub_1000098E4(224);
}

uint64_t sub_1000090D4()
{
  uint64_t v0;

  return sub_100006BB8(v0 + 16, *(_QWORD *)(v0 + 216));
}

uint64_t sub_1000090E0(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100008C48(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100009120@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.isEnabled.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_10000914C(unsigned __int8 *a1)
{
  return EnvironmentValues.isEnabled.setter(*a1);
}

uint64_t sub_100009170()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

_BYTE *sub_100009180(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_100009198()
{
  return sub_1000098E4(224);
}

_QWORD *sub_1000091A0()
{
  uint64_t v0;

  return sub_100007660((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 216), 1);
}

_QWORD *sub_1000091C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100007404(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_1000091C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021860;
  if (!qword_100021860)
  {
    v1 = sub_100008C48(&qword_100021858);
    sub_10000924C();
    sub_1000090E0(&qword_100021830, &qword_100021838, (uint64_t)&protocol conformance descriptor for _EnvironmentKeyWritingModifier<A>);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100021860);
  }
  return result;
}

unint64_t sub_10000924C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021868;
  if (!qword_100021868)
  {
    v1 = sub_100008C48(&qword_100021870);
    sub_1000092D0(&qword_100021878, &qword_100021880);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100021868);
  }
  return result;
}

uint64_t sub_1000092D0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_100008C48(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000932C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000933C()
{
  return sub_1000098E4(224);
}

_QWORD *sub_100009344()
{
  uint64_t v0;

  return sub_100007660((_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 216), 0);
}

_QWORD *sub_100009364@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_10000780C(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_10000936C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 17, 7);
}

uint64_t sub_10000937C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000093A4(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  return EnvironmentValues.foregroundColor.setter(v1);
}

_QWORD *sub_1000093CC(_QWORD *a1)
{
  swift_bridgeObjectRetain(*a1);
  return a1;
}

_QWORD *sub_1000093F4(_QWORD *a1)
{
  swift_retain(*a1);
  return a1;
}

_QWORD *sub_10000941C(_QWORD *a1)
{
  swift_bridgeObjectRelease(*a1);
  return a1;
}

_QWORD *sub_100009444(_QWORD *a1)
{
  swift_release(*a1);
  return a1;
}

uint64_t sub_10000946C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  unsigned int v5;
  unint64_t v6;
  void *v7;
  const char *v8;

  v2 = a1 == 0x74746F427466654CLL && a2 == 0xEA00000000006D6FLL;
  if (v2
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x74746F427466654CLL, 0xEA00000000006D6FLL, a1, a2, 0) & 1) != 0)
  {
    v5 = 1413891404;
LABEL_7:
    v6 = v5 | 0x43494D5F00000000;
    v7 = (void *)0xEF454E4F48504F52;
    return sub_100014D00(v6, v7);
  }
  if (a1 == 0x746F427468676952 && a2 == 0xEB000000006D6F74
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x746F427468676952, 0xEB000000006D6F74, a1, a2, 0) & 1) != 0)
  {
    v8 = "RIGHT_MICROPHONE";
LABEL_12:
    v7 = (void *)((unint64_t)(v8 - 32) | 0x8000000000000000);
    v6 = 0xD000000000000010;
    return sub_100014D00(v6, v7);
  }
  if (a1 == 0x746E6F7246 && a2 == 0xE500000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)(0x746E6F7246, 0xE500000000000000, a1, a2, 0) & 1) != 0)
  {
    v8 = "FRONT_MICROPHONE";
    goto LABEL_12;
  }
  if (a1 == 1801675074 && a2 == 0xE400000000000000
    || (_stringCompareWithSmolCheck(_:_:expecting:)(1801675074, 0xE400000000000000, a1, a2, 0) & 1) != 0)
  {
    v5 = 1380009298;
    goto LABEL_7;
  }
  return 0;
}

unint64_t sub_10000961C()
{
  unint64_t result;

  result = qword_1000218B8;
  if (!qword_1000218B8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_1000218B8);
  }
  return result;
}

uint64_t sub_100009660@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = EnvironmentValues.lineLimit.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_100009690(uint64_t a1)
{
  return EnvironmentValues.lineLimit.setter(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_1000096BC()
{
  return EnvironmentValues.truncationMode.getter();
}

uint64_t sub_1000096E0(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

uint64_t sub_1000096F0(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_100009700(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100008128(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100009744(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100008128(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_QWORD *sub_100009780(_QWORD *a1)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = a1[1];
  v3 = a1[4];
  v4 = a1[6];
  v5 = a1[7];
  v6 = a1[8];
  v7 = a1[9];
  v8 = a1[10];
  v9 = a1[12];
  v10 = a1[13];
  v12 = a1[14];
  v13 = a1[16];
  v14 = a1[18];
  v15 = a1[20];
  v18 = a1[23];
  v16 = a1[22];
  v17 = a1[24];
  swift_bridgeObjectRelease(a1[17]);
  swift_bridgeObjectRelease(v10);
  swift_bridgeObjectRelease(v7);
  swift_bridgeObjectRelease(v5);
  swift_release(v2);
  swift_release(v3);
  swift_release(v4);
  swift_release(v6);
  swift_release(v8);
  swift_release(v9);
  swift_release(v12);
  swift_release(v13);
  swift_release(v14);
  swift_release(v15);
  swift_release(v16);
  sub_100009888(v18, v17);
  return a1;
}

uint64_t sub_100009888(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_100009898(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100008128(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000098DC()
{
  return sub_1000098E4(224);
}

uint64_t sub_1000098E4(uint64_t a1)
{
  _QWORD *v1;

  swift_release(v1[3]);
  swift_release(v1[6]);
  swift_release(v1[8]);
  swift_bridgeObjectRelease(v1[9]);
  swift_release(v1[10]);
  swift_bridgeObjectRelease(v1[11]);
  swift_release(v1[12]);
  swift_release(v1[14]);
  swift_bridgeObjectRelease(v1[15]);
  swift_release(v1[16]);
  swift_release(v1[18]);
  swift_bridgeObjectRelease(v1[19]);
  swift_release(v1[20]);
  swift_release(v1[22]);
  swift_release(v1[24]);
  if (v1[25])
    swift_release(v1[26]);
  return swift_deallocObject(v1, a1, 7);
}

uint64_t sub_100009994(uint64_t a1)
{
  uint64_t v1;

  return sub_100007B8C(a1, v1 + 16, *(_QWORD *)(v1 + 216));
}

uint64_t sub_1000099A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000099B0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

char *sub_1000099B8()
{
  uint64_t v0;

  return sub_100007BE8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_1000099D0()
{
  _QWORD v1[4];

  v1[0] = sub_100008C48(&qword_100021740);
  v1[1] = &type metadata for Bool;
  v1[2] = sub_100008DDC(&qword_100021770, &qword_100021740, (void (*)(void))sub_100008DC0);
  v1[3] = &protocol witness table for Bool;
  return swift_getOpaqueTypeConformance2(v1, &opaque type descriptor for <<opaque return type of View.onChange<A>(of:initial:_:)>>, 1);
}

_QWORD *sub_100009A50()
{
  uint64_t v0;
  _QWORD *result;

  v0 = type metadata accessor for MicrophoneTestSharedData();
  result = (_QWORD *)swift_allocObject(v0, 40, 7);
  result[2] = 0x4008000000000000;
  result[3] = 100;
  result[4] = &_swiftEmptyArrayStorage;
  qword_1000225B0 = (uint64_t)result;
  return result;
}

uint64_t sub_100009A90()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for MicrophoneTestSharedData()
{
  return objc_opt_self(_TtC15Diagnostic_600424MicrophoneTestSharedData);
}

char *sub_100009AD4(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;
  NSString v11;
  char *v12;
  uint64_t v13;
  objc_super v15;

  v3 = OBJC_IVAR____TtC15Diagnostic_600437MicrophoneTestCompletedViewController_testResults;
  v4 = v1;
  *(_QWORD *)&v1[v3] = sub_100014E58((uint64_t)_swiftEmptyArrayStorage);

  sub_100014D00(0xD000000000000010, (void *)0x8000000100017190);
  v6 = v5;
  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  sub_100014D00(0xD000000000000016, (void *)0x80000001000171B0);
  v9 = v8;
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  v11 = String._bridgeToObjectiveC()();
  v15.receiver = v4;
  v15.super_class = (Class)type metadata accessor for MicrophoneTestCompletedViewController();
  v12 = (char *)objc_msgSendSuper2(&v15, "initWithTitle:detailText:symbolName:contentLayout:", v7, v10, v11, 2);

  v13 = *(_QWORD *)&v12[OBJC_IVAR____TtC15Diagnostic_600437MicrophoneTestCompletedViewController_testResults];
  *(_QWORD *)&v12[OBJC_IVAR____TtC15Diagnostic_600437MicrophoneTestCompletedViewController_testResults] = a1;
  swift_bridgeObjectRelease(v13);
  return v12;
}

void sub_100009C0C()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSString v6;
  uint64_t v7;
  void *v8;
  id v9;
  objc_super v10;

  v1 = v0;
  v10.receiver = v0;
  v10.super_class = (Class)type metadata accessor for MicrophoneTestCompletedViewController();
  objc_msgSendSuper2(&v10, "viewDidLoad");
  v2 = objc_msgSend(v0, "navigationItem");
  objc_msgSend(v2, "setHidesBackButton:", 1);

  v3 = objc_msgSend((id)objc_opt_self(OBBoldTrayButton), "boldButton");
  sub_100014D00(19279, (void *)0xE200000000000000);
  v5 = v4;
  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  objc_msgSend(v3, "setTitle:forState:", v6, 0);

  sub_10000A164();
  v7 = swift_allocObject(&unk_10001CFF0, 24, 7);
  swift_unknownObjectWeakInit(v7 + 16, v1);
  v8 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)(0, 0xE000000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, sub_10000A1C4, v7);
  objc_msgSend(v3, "addAction:forControlEvents:", v8, 64);

  v9 = objc_msgSend(v1, "buttonTray");
  objc_msgSend(v9, "addButton:", v3);

}

void sub_100009D9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t Strong;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[4];
  char v29[24];

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v29, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v2);
  if (!Strong)
    return;
  v4 = (char *)Strong;
  v27 = OBJC_IVAR____TtC15Diagnostic_600437MicrophoneTestCompletedViewController_testResults;
  v5 = *(_QWORD *)(Strong + OBJC_IVAR____TtC15Diagnostic_600437MicrophoneTestCompletedViewController_testResults);
  v6 = v5 + 64;
  v7 = 1 << *(_BYTE *)(v5 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(v5 + 64);
  v10 = (unint64_t)(v7 + 63) >> 6;
  swift_bridgeObjectRetain_n(*(_QWORD *)(Strong + OBJC_IVAR____TtC15Diagnostic_600437MicrophoneTestCompletedViewController_testResults), 2);
  v11 = 0;
  while (v9)
  {
    v12 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    v13 = v12 | (v11 << 6);
LABEL_6:
    v14 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 16 * v13);
    v16 = *v14;
    v15 = v14[1];
    v28[2] = v16;
    v28[3] = v15;
    v28[0] = 1818845510;
    v28[1] = 0xE400000000000000;
    v17 = sub_10000961C();
    if ((StringProtocol.contains<A>(_:)(v28, &type metadata for String, &type metadata for String, v17, v17) & 1) != 0)
    {
      swift_release(v5);
      swift_bridgeObjectRelease(v5);
      v5 = *(_QWORD *)&v4[v27];
      v21 = qword_1000216F8;
      swift_bridgeObjectRetain(v5);
      if (v21 == -1)
        goto LABEL_27;
      goto LABEL_38;
    }
  }
  v18 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
LABEL_38:
    swift_once(&qword_1000216F8, sub_100014F9C);
LABEL_27:
    v22 = swift_unknownObjectWeakLoadStrong(qword_1000225D8 + 16);
    if (v22)
    {
      v23 = (char *)v22;
      v24 = 900;
LABEL_33:
      sub_100015550(v24, v5);
      swift_bridgeObjectRelease(v5);

      v4 = v23;
LABEL_35:

      return;
    }
    goto LABEL_34;
  }
  if (v18 >= v10)
    goto LABEL_29;
  v19 = *(_QWORD *)(v6 + 8 * v18);
  ++v11;
  if (v19)
    goto LABEL_25;
  v11 = v18 + 1;
  if (v18 + 1 >= v10)
    goto LABEL_29;
  v19 = *(_QWORD *)(v6 + 8 * v11);
  if (v19)
    goto LABEL_25;
  v11 = v18 + 2;
  if (v18 + 2 >= v10)
    goto LABEL_29;
  v19 = *(_QWORD *)(v6 + 8 * v11);
  if (v19)
    goto LABEL_25;
  v11 = v18 + 3;
  if (v18 + 3 >= v10)
    goto LABEL_29;
  v19 = *(_QWORD *)(v6 + 8 * v11);
  if (v19)
    goto LABEL_25;
  v11 = v18 + 4;
  if (v18 + 4 >= v10)
    goto LABEL_29;
  v19 = *(_QWORD *)(v6 + 8 * v11);
  if (v19)
  {
LABEL_25:
    v9 = (v19 - 1) & v19;
    v13 = __clz(__rbit64(v19)) + (v11 << 6);
    goto LABEL_6;
  }
  v20 = v18 + 5;
  if (v20 >= v10)
  {
LABEL_29:
    swift_release(v5);
    swift_bridgeObjectRelease(v5);
    v5 = *(_QWORD *)&v4[v27];
    v25 = qword_1000216F8;
    swift_bridgeObjectRetain(v5);
    if (v25 != -1)
      swift_once(&qword_1000216F8, sub_100014F9C);
    v26 = swift_unknownObjectWeakLoadStrong(qword_1000225D8 + 16);
    if (v26)
    {
      v23 = (char *)v26;
      v24 = 0;
      goto LABEL_33;
    }
LABEL_34:
    swift_bridgeObjectRelease(v5);
    goto LABEL_35;
  }
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v11 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v11 >= v10)
      goto LABEL_29;
    v19 = *(_QWORD *)(v6 + 8 * v11);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
  __break(1u);
}

id sub_10000A104()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MicrophoneTestCompletedViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MicrophoneTestCompletedViewController()
{
  return objc_opt_self(_TtC15Diagnostic_600437MicrophoneTestCompletedViewController);
}

unint64_t sub_10000A164()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021A10;
  if (!qword_100021A10)
  {
    v1 = objc_opt_self(UIAction);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100021A10);
  }
  return result;
}

uint64_t sub_10000A1A0()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10000A1C4(uint64_t a1)
{
  uint64_t v1;

  sub_100009D9C(a1, v1);
}

id sub_10000A1CC(uint64_t a1)
{
  _BYTE *v1;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  NSString v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  objc_super v12;

  v1[OBJC_IVAR____TtC15Diagnostic_600437MicrophoneTestRecordingViewController_shouldStop] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC15Diagnostic_600437MicrophoneTestRecordingViewController_audioManager] = a1;
  swift_retain(a1);
  sub_100014D00(0xD000000000000010, (void *)0x80000001000172E0);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  v6 = String._bridgeToObjectiveC()();
  v7 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == (id)1)
    v9 = 3;
  else
    v9 = 2;
  v12.receiver = v1;
  v12.super_class = (Class)type metadata accessor for MicrophoneTestRecordingViewController();
  v10 = objc_msgSendSuper2(&v12, "initWithTitle:detailText:symbolName:contentLayout:", v5, 0, v6, v9);

  swift_release(a1);
  return v10;
}

void sub_10000A2F4()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  _QWORD *v5;
  char *v6;
  uint64_t v7;
  _QWORD *v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  Class isa;
  id v39;
  uint64_t v40;
  uint64_t v41;
  NSString v42;
  uint64_t v43;
  char *v44;
  void *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _OWORD v54[2];
  uint64_t v55;
  uint64_t v56;
  objc_super v57;
  _OWORD v58[7];
  _OWORD v59[2];

  v57.receiver = v0;
  v57.super_class = (Class)type metadata accessor for MicrophoneTestRecordingViewController();
  objc_msgSendSuper2(&v57, "viewDidLoad");
  v1 = objc_msgSend(v0, "navigationItem");
  objc_msgSend(v1, "setHidesBackButton:", 1);

  v2 = objc_msgSend(v0, "navigationController");
  type metadata accessor for MainActor(0);
  v3 = v0;
  v4 = static MainActor.shared.getter();
  v5 = (_QWORD *)swift_allocObject(&unk_10001D018, 40, 7);
  v5[2] = v4;
  v5[3] = &protocol witness table for MainActor;
  v5[4] = v3;
  v6 = (char *)v3;
  v7 = static MainActor.shared.getter();
  v8 = (_QWORD *)swift_allocObject(&unk_10001D040, 40, 7);
  v8[2] = v7;
  v8[3] = &protocol witness table for MainActor;
  v8[4] = v6;
  Binding.init(get:set:)(&v47, sub_10000AC30, v5, sub_10000AC78, v8, &type metadata for Bool);
  v9 = v47;
  LOBYTE(v5) = v48;
  v10 = type metadata accessor for AudioManager(0);
  v11 = sub_1000080E0();
  v12 = EnvironmentObject.init()(v10, v11);
  sub_10000C2FC(v12, v13, (uint64_t)v2, v9, *((uint64_t *)&v9 + 1), (char)v5, (uint64_t)v58);
  v14 = *(_QWORD *)&v6[OBJC_IVAR____TtC15Diagnostic_600437MicrophoneTestRecordingViewController_audioManager];
  swift_retain(v14);
  v15 = static ObservableObject.environmentStore.getter(v10, v11);
  v53 = v58[6];
  v54[0] = v59[0];
  *(_OWORD *)((char *)v54 + 9) = *(_OWORD *)((char *)v59 + 9);
  v49 = v58[2];
  v50 = v58[3];
  v51 = v58[4];
  v52 = v58[5];
  v47 = v58[0];
  v48 = v58[1];
  v55 = v15;
  v56 = v14;
  v16 = objc_allocWithZone((Class)sub_100008128(&qword_100021A50));
  v17 = (void *)UIHostingController.init(rootView:)(&v47);
  v18 = objc_msgSend(v17, "view");
  if (!v18)
    goto LABEL_4;
  v19 = v18;
  objc_msgSend(v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v20 = objc_msgSend(v6, "contentView");
  objc_msgSend(v20, "addSubview:", v19);

  v21 = sub_100008128(&qword_100021A58);
  v22 = swift_allocObject(v21, 56, 7);
  *(_OWORD *)(v22 + 16) = xmmword_100018C80;
  v23 = objc_msgSend(v19, "leadingAnchor");
  v24 = objc_msgSend(v6, "contentView");
  v25 = objc_msgSend(v24, "leadingAnchor");

  v26 = objc_msgSend(v23, "constraintEqualToAnchor:", v25);
  *(_QWORD *)(v22 + 32) = v26;
  v27 = objc_msgSend(v19, "trailingAnchor");
  v28 = objc_msgSend(v6, "contentView");
  v29 = objc_msgSend(v28, "trailingAnchor");

  v30 = objc_msgSend(v27, "constraintEqualToAnchor:", v29);
  *(_QWORD *)(v22 + 40) = v30;
  v31 = objc_msgSend(v19, "centerYAnchor");
  v32 = objc_msgSend(v6, "view");
  if (v32)
  {
    v33 = v32;
    v34 = (void *)objc_opt_self(NSLayoutConstraint);
    v35 = objc_msgSend(v33, "centerYAnchor");

    v36 = objc_msgSend(v31, "constraintEqualToAnchor:", v35);
    *(_QWORD *)(v22 + 48) = v36;
    *(_QWORD *)&v47 = v22;
    specialized Array._endMutation()();
    v37 = v47;
    sub_10000AC90(0, &qword_100021A60, NSLayoutConstraint_ptr);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v37);
    objc_msgSend(v34, "activateConstraints:", isa);

    v39 = objc_msgSend((id)objc_opt_self(OBLinkTrayButton), "linkButton");
    sub_100014D00(0x4345525F504F5453, (void *)0xEE00474E4944524FLL);
    v41 = v40;
    v42 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v41);
    objc_msgSend(v39, "setTitle:forState:", v42, 0);

    sub_10000AC90(0, (unint64_t *)&qword_100021A10, UIAction_ptr);
    v43 = swift_allocObject(&unk_10001D068, 24, 7);
    *(_QWORD *)(v43 + 16) = v6;
    v44 = v6;
    v45 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)(0, 0xE000000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, sub_10000ACEC, v43);
    objc_msgSend(v39, "addAction:forControlEvents:", v45, 64);

    v46 = objc_msgSend(v44, "buttonTray");
    objc_msgSend(v46, "addButton:", v39);

    v17 = v46;
LABEL_4:

    return;
  }
  __break(1u);
}

void sub_10000A8B8(uint64_t a1, _BYTE *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  NSString v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  NSString v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  uint64_t v18;

  a2[OBJC_IVAR____TtC15Diagnostic_600437MicrophoneTestRecordingViewController_shouldStop] = 1;
  sub_100014D00(0xD00000000000001ELL, (void *)0x8000000100017340);
  v4 = v3;
  sub_100014D00(0xD00000000000001ELL, (void *)0x8000000100017360);
  v6 = v5;
  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  v9 = objc_msgSend((id)objc_opt_self(UIAlertController), "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);

  sub_100014D00(0xD000000000000026, (void *)0x8000000100017380);
  v11 = v10;
  v12 = swift_allocObject(&unk_10001D090, 24, 7);
  *(_QWORD *)(v12 + 16) = a2;
  v13 = a2;
  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  v17[4] = sub_10000ACF4;
  v18 = v12;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_10000AD18;
  v17[3] = &unk_10001D0A8;
  v15 = _Block_copy(v17);
  swift_release(v18);
  v16 = objc_msgSend((id)objc_opt_self(UIAlertAction), "actionWithTitle:style:handler:", v14, 0, v15);
  _Block_release(v15);

  objc_msgSend(v9, "addAction:", v16);
  objc_msgSend(v13, "presentViewController:animated:completion:", v9, 1, 0);

}

void sub_10000AAD8(int a1, id a2)
{
  id v2;
  id v3;

  v2 = objc_msgSend(a2, "navigationController");
  if (v2)
  {
    v3 = v2;

  }
}

id sub_10000ABCC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MicrophoneTestRecordingViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MicrophoneTestRecordingViewController()
{
  return objc_opt_self(_TtC15Diagnostic_600437MicrophoneTestRecordingViewController);
}

void sub_10000AC30(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(*(_QWORD *)(v1 + 32)
                 + OBJC_IVAR____TtC15Diagnostic_600437MicrophoneTestRecordingViewController_shouldStop);
}

uint64_t sub_10000AC4C()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));

  return swift_deallocObject(v0, 40, 7);
}

_BYTE *sub_10000AC78(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)(v1 + 32) + OBJC_IVAR____TtC15Diagnostic_600437MicrophoneTestRecordingViewController_shouldStop) = *result;
  return result;
}

uint64_t sub_10000AC90(uint64_t a1, unint64_t *a2, _QWORD *a3)
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

uint64_t sub_10000ACC8()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_10000ACEC(uint64_t a1)
{
  uint64_t v1;

  sub_10000A8B8(a1, *(_BYTE **)(v1 + 16));
}

void sub_10000ACF4(int a1)
{
  uint64_t v1;

  sub_10000AAD8(a1, *(id *)(v1 + 16));
}

uint64_t sub_10000ACFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000AD0C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_10000AD18(uint64_t a1, void *a2)
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

uint64_t sub_10000AD68@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
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
  unint64_t v21;
  uint64_t v22;
  char v23;
  id v24;
  id v25;
  __n128 v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  _OWORD *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t (**v42)();
  uint64_t v43;
  uint64_t KeyPath;
  uint64_t v45;
  uint64_t v46;
  _OWORD *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char v57;
  _OWORD *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t OpaqueTypeConformance2;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  char *v70;
  uint64_t v71;
  _OWORD *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  _OWORD *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  char *v88;
  uint64_t v89;
  uint64_t v90;
  _OWORD *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;
  char *v97;
  uint64_t v98;
  uint64_t result;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  __int128 v121;
  uint64_t v122;
  void *v123;
  uint64_t v124;
  char v125;

  v2 = v1;
  v119 = a1;
  v3 = sub_100008128(&qword_100021A70);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v103 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = sub_100008128(&qword_100021A78);
  __chkstk_darwin(v104);
  v8 = (char *)&v103 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100008128(&qword_100021A80);
  __chkstk_darwin(v9);
  v11 = (char *)&v103 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v120 = sub_100008128(&qword_100021A88);
  v106 = *(_QWORD *)(v120 - 8);
  __chkstk_darwin(v120);
  v105 = (char *)&v103 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v109 = sub_100008128(&qword_100021A90);
  v108 = *(_QWORD *)(v109 - 8);
  __chkstk_darwin(v109);
  v107 = (char *)&v103 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v113 = sub_100008128(&qword_100021A98);
  v111 = *(_QWORD *)(v113 - 8);
  __chkstk_darwin(v113);
  v110 = (char *)&v103 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100008128(&qword_100021AA0);
  v117 = *(_QWORD *)(v15 - 8);
  v118 = v15;
  __chkstk_darwin(v15);
  v116 = (char *)&v103 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_100008128(&qword_100021AA8);
  v114 = *(_QWORD *)(v17 - 8);
  v115 = v17;
  __chkstk_darwin(v17);
  v112 = (char *)&v103 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v121 = *(_OWORD *)(v1 + 32);
  sub_100008128(&qword_100021AB0);
  State.wrappedValue.getter(&v124);
  v125 = 0;
  *(_QWORD *)&v121 = 0x3FF0000000000000;
  v19 = sub_100008128(&qword_100021AB8);
  v20 = sub_10000C940();
  v21 = sub_10000C9A4();
  v22 = ProgressView.init<A>(value:total:label:)(&v124, &v121, sub_10000B7D8, 0, v19, &type metadata for Double, v20, v21);
  v23 = static Edge.Set.horizontal.getter(v22);
  v24 = objc_msgSend((id)objc_opt_self(UIDevice), "currentDevice");
  v25 = objc_msgSend(v24, "userInterfaceIdiom");

  v26.n128_u64[0] = 0x4064000000000000;
  if (v25 != (id)1)
    v26.n128_f64[0] = 0.0;
  v27 = EdgeInsets.init(_all:)(v26);
  v29 = v28;
  v31 = v30;
  v33 = v32;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v8, v6, v3);
  v34 = &v8[*(int *)(v104 + 36)];
  *v34 = v23;
  *((double *)v34 + 1) = v27;
  *((_QWORD *)v34 + 2) = v29;
  *((_QWORD *)v34 + 3) = v31;
  *((_QWORD *)v34 + 4) = v33;
  v34[40] = 0;
  v35 = *(void (**)(char *, uint64_t))(v4 + 8);
  v36 = v9;
  v35(v6, v3);
  v37 = (_OWORD *)swift_allocObject(&unk_10001D180, 153, 7);
  v38 = *(_OWORD *)(v2 + 112);
  v37[7] = *(_OWORD *)(v2 + 96);
  v37[8] = v38;
  *(_OWORD *)((char *)v37 + 137) = *(_OWORD *)(v2 + 121);
  v39 = *(_OWORD *)(v2 + 48);
  v37[3] = *(_OWORD *)(v2 + 32);
  v37[4] = v39;
  v40 = *(_OWORD *)(v2 + 80);
  v37[5] = *(_OWORD *)(v2 + 64);
  v37[6] = v40;
  v41 = *(_OWORD *)(v2 + 16);
  v37[1] = *(_OWORD *)v2;
  v37[2] = v41;
  sub_10000C9F4((uint64_t)v8, (uint64_t)v11);
  v42 = (uint64_t (**)())&v11[*(int *)(v36 + 36)];
  *v42 = sub_10000C9EC;
  v42[1] = (uint64_t (*)())v37;
  v42[2] = 0;
  v42[3] = 0;
  sub_10000CA3C((uint64_t *)v2);
  sub_100009744((uint64_t)v8, &qword_100021A78);
  v43 = *(_QWORD *)v2;
  if (*(_QWORD *)v2)
  {
    KeyPath = swift_getKeyPath(&unk_100018D30);
    v45 = swift_getKeyPath(&unk_100018D58);
    v46 = swift_retain(v43);
    static Published.subscript.getter(&v121, v46, KeyPath, v45);
    swift_release(v43);
    swift_release(KeyPath);
    swift_release(v45);
    v47 = (_OWORD *)swift_allocObject(&unk_10001D1A8, 153, 7);
    v48 = *(_OWORD *)(v2 + 112);
    v47[7] = *(_OWORD *)(v2 + 96);
    v47[8] = v48;
    *(_OWORD *)((char *)v47 + 137) = *(_OWORD *)(v2 + 121);
    v49 = *(_OWORD *)(v2 + 48);
    v47[3] = *(_OWORD *)(v2 + 32);
    v47[4] = v49;
    v50 = *(_OWORD *)(v2 + 80);
    v47[5] = *(_OWORD *)(v2 + 64);
    v47[6] = v50;
    v51 = *(_OWORD *)(v2 + 16);
    v47[1] = *(_OWORD *)v2;
    v47[2] = v51;
    sub_10000CA3C((uint64_t *)v2);
    v52 = sub_10000CB34(&qword_100021AD0, &qword_100021A80, (void (*)(void))sub_10000CB10);
    v53 = v105;
    View.onChange<A>(of:initial:_:)(&v121, 0, sub_10000CB08, v47, v36, &type metadata for Bool, v52, &protocol witness table for Bool);
    swift_release(v47);
    sub_100009744((uint64_t)v11, &qword_100021A80);
    v54 = swift_getKeyPath(&unk_100018D78);
    v55 = swift_getKeyPath(&unk_100018DA0);
    v56 = swift_retain(v43);
    static Published.subscript.getter(&v121, v56, v54, v55);
    swift_release(v43);
    swift_release(v54);
    swift_release(v55);
    v57 = 0;
    if ((v121 & 1) != 0)
    {
      v121 = *(_OWORD *)(v2 + 64);
      sub_100008128(&qword_100021848);
      State.wrappedValue.getter(&v124);
      v57 = v124;
    }
    LOBYTE(v124) = v57;
    v58 = (_OWORD *)swift_allocObject(&unk_10001D1D0, 153, 7);
    v59 = *(_OWORD *)(v2 + 112);
    v58[7] = *(_OWORD *)(v2 + 96);
    v58[8] = v59;
    *(_OWORD *)((char *)v58 + 137) = *(_OWORD *)(v2 + 121);
    v60 = *(_OWORD *)(v2 + 48);
    v58[3] = *(_OWORD *)(v2 + 32);
    v58[4] = v60;
    v61 = *(_OWORD *)(v2 + 80);
    v58[5] = *(_OWORD *)(v2 + 64);
    v58[6] = v61;
    v62 = *(_OWORD *)(v2 + 16);
    v58[1] = *(_OWORD *)v2;
    v58[2] = v62;
    sub_10000CA3C((uint64_t *)v2);
    *(_QWORD *)&v121 = v36;
    *((_QWORD *)&v121 + 1) = &type metadata for Bool;
    v122 = v52;
    v123 = &protocol witness table for Bool;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v121, &opaque type descriptor for <<opaque return type of View.onChange<A>(of:initial:_:)>>, 1);
    v64 = v107;
    v65 = v120;
    View.onChange<A>(of:initial:_:)(&v124, 0, sub_10000CBF4, v58, v120, &type metadata for Bool, OpaqueTypeConformance2, &protocol witness table for Bool);
    swift_release(v58);
    (*(void (**)(char *, uint64_t))(v106 + 8))(v53, v65);
    v66 = swift_getKeyPath(&unk_100018DC0);
    v67 = swift_getKeyPath(&unk_100018DE8);
    v68 = swift_retain(v43);
    static Published.subscript.getter(&v121, v68, v66, v67);
    swift_release(v43);
    swift_release(v66);
    swift_release(v67);
    v69 = 0;
    v70 = v110;
    v71 = v109;
    if (v121 == 1)
    {
      v121 = *(_OWORD *)(v2 + 80);
      sub_100008128(&qword_100021848);
      State.wrappedValue.getter(&v124);
      v69 = v124;
    }
    LOBYTE(v124) = v69;
    v72 = (_OWORD *)swift_allocObject(&unk_10001D1F8, 153, 7);
    v73 = *(_OWORD *)(v2 + 112);
    v72[7] = *(_OWORD *)(v2 + 96);
    v72[8] = v73;
    *(_OWORD *)((char *)v72 + 137) = *(_OWORD *)(v2 + 121);
    v74 = *(_OWORD *)(v2 + 48);
    v72[3] = *(_OWORD *)(v2 + 32);
    v72[4] = v74;
    v75 = *(_OWORD *)(v2 + 80);
    v72[5] = *(_OWORD *)(v2 + 64);
    v72[6] = v75;
    v76 = *(_OWORD *)(v2 + 16);
    v72[1] = *(_OWORD *)v2;
    v72[2] = v76;
    sub_10000CA3C((uint64_t *)v2);
    *(_QWORD *)&v121 = v120;
    *((_QWORD *)&v121 + 1) = &type metadata for Bool;
    v122 = OpaqueTypeConformance2;
    v123 = &protocol witness table for Bool;
    v77 = swift_getOpaqueTypeConformance2(&v121, &opaque type descriptor for <<opaque return type of View.onChange<A>(of:initial:_:)>>, 1);
    View.onChange<A>(of:initial:_:)(&v124, 0, sub_10000CC08, v72, v71, &type metadata for Bool, v77, &protocol witness table for Bool);
    swift_release(v72);
    (*(void (**)(char *, uint64_t))(v108 + 8))(v64, v71);
    v78 = swift_getKeyPath(&unk_100018E08);
    v79 = swift_getKeyPath(&unk_100018E30);
    v80 = swift_retain(v43);
    static Published.subscript.getter(&v121, v80, v78, v79);
    swift_release(v43);
    swift_release(v78);
    swift_release(v79);
    v81 = 0;
    if (v121 == 1)
    {
      v121 = *(_OWORD *)(v2 + 96);
      sub_100008128(&qword_100021848);
      State.wrappedValue.getter(&v124);
      v81 = v124;
    }
    LOBYTE(v124) = v81;
    v82 = (_OWORD *)swift_allocObject(&unk_10001D220, 153, 7);
    v83 = *(_OWORD *)(v2 + 112);
    v82[7] = *(_OWORD *)(v2 + 96);
    v82[8] = v83;
    *(_OWORD *)((char *)v82 + 137) = *(_OWORD *)(v2 + 121);
    v84 = *(_OWORD *)(v2 + 48);
    v82[3] = *(_OWORD *)(v2 + 32);
    v82[4] = v84;
    v85 = *(_OWORD *)(v2 + 80);
    v82[5] = *(_OWORD *)(v2 + 64);
    v82[6] = v85;
    v86 = *(_OWORD *)(v2 + 16);
    v82[1] = *(_OWORD *)v2;
    v82[2] = v86;
    sub_10000CA3C((uint64_t *)v2);
    *(_QWORD *)&v121 = v71;
    *((_QWORD *)&v121 + 1) = &type metadata for Bool;
    v122 = v77;
    v123 = &protocol witness table for Bool;
    v87 = swift_getOpaqueTypeConformance2(&v121, &opaque type descriptor for <<opaque return type of View.onChange<A>(of:initial:_:)>>, 1);
    v88 = v116;
    v89 = v113;
    View.onChange<A>(of:initial:_:)(&v124, 0, sub_10000CC1C, v82, v113, &type metadata for Bool, v87, &protocol witness table for Bool);
    swift_release(v82);
    (*(void (**)(char *, uint64_t))(v111 + 8))(v70, v89);
    v121 = *(_OWORD *)(v2 + 120);
    LOBYTE(v122) = *(_BYTE *)(v2 + 136);
    v90 = sub_100008128(&qword_100021AE8);
    Binding.wrappedValue.getter(&v124, v90);
    v91 = (_OWORD *)swift_allocObject(&unk_10001D248, 153, 7);
    v92 = *(_OWORD *)(v2 + 112);
    v91[7] = *(_OWORD *)(v2 + 96);
    v91[8] = v92;
    *(_OWORD *)((char *)v91 + 137) = *(_OWORD *)(v2 + 121);
    v93 = *(_OWORD *)(v2 + 48);
    v91[3] = *(_OWORD *)(v2 + 32);
    v91[4] = v93;
    v94 = *(_OWORD *)(v2 + 80);
    v91[5] = *(_OWORD *)(v2 + 64);
    v91[6] = v94;
    v95 = *(_OWORD *)(v2 + 16);
    v91[1] = *(_OWORD *)v2;
    v91[2] = v95;
    sub_10000CA3C((uint64_t *)v2);
    *(_QWORD *)&v121 = v89;
    *((_QWORD *)&v121 + 1) = &type metadata for Bool;
    v122 = v87;
    v123 = &protocol witness table for Bool;
    v96 = swift_getOpaqueTypeConformance2(&v121, &opaque type descriptor for <<opaque return type of View.onChange<A>(of:initial:_:)>>, 1);
    v97 = v112;
    v98 = v118;
    View.onChange<A>(of:initial:_:)(&v124, 0, sub_10000CC9C, v91, v118, &type metadata for Bool, v96, &protocol witness table for Bool);
    swift_release(v91);
    (*(void (**)(char *, uint64_t))(v117 + 8))(v88, v98);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v114 + 32))(v119, v97, v115);
  }
  else
  {
    v100 = *(_QWORD *)(v2 + 8);
    v101 = type metadata accessor for AudioManager(0);
    v102 = sub_1000080E0();
    result = EnvironmentObject.error()(0, v100, v101, v102);
    __break(1u);
  }
  return result;
}

void sub_10000B7D8(uint64_t a1@<X8>)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  __n128 v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];

  v17[0] = sub_100014D00(0xD000000000000013, (void *)0x80000001000173D0);
  v17[1] = v2;
  v3 = sub_10000961C();
  v4 = Text.init<A>(_:)(v17, &type metadata for String, v3);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = static Edge.Set.bottom.getter(v4);
  v12.n128_u64[0] = 10.0;
  v13 = EdgeInsets.init(_all:)(v12);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = v8 & 1;
  *(_QWORD *)(a1 + 24) = v10;
  *(_BYTE *)(a1 + 32) = v11;
  *(double *)(a1 + 40) = v13;
  *(_QWORD *)(a1 + 48) = v14;
  *(_QWORD *)(a1 + 56) = v15;
  *(_QWORD *)(a1 + 64) = v16;
  *(_BYTE *)(a1 + 72) = 0;
}

uint64_t sub_10000B884(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  sub_10000BF7C();
  sub_10000CCEC();
  v2 = *a1;
  if (*a1)
  {
    swift_retain(*a1);
    sub_10000FB20();
    return swift_release(v2);
  }
  else
  {
    v4 = a1[1];
    v5 = type metadata accessor for AudioManager(0);
    v6 = sub_1000080E0();
    result = EnvironmentObject.error()(0, v4, v5, v6);
    __break(1u);
  }
  return result;
}

_QWORD *sub_10000B8F0(uint64_t *a1)
{
  uint64_t v2;
  uint64_t KeyPath;
  uint64_t v4;
  uint64_t v5;
  _QWORD *result;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  __int128 v14;
  uint64_t v15;

  v2 = *a1;
  if (*a1)
  {
    KeyPath = swift_getKeyPath(&unk_100018D30);
    v4 = swift_getKeyPath(&unk_100018D58);
    v5 = swift_retain(v2);
    static Published.subscript.getter(&v14, v5, KeyPath, v4);
    swift_release(v2);
    swift_release(KeyPath);
    result = (_QWORD *)swift_release(v4);
    if ((v14 & 1) != 0)
    {
      v14 = *((_OWORD *)a1 + 3);
      sub_100008128(&qword_100021848);
      result = State.wrappedValue.getter(&v15);
      if (v15 == 1)
      {
        sub_10000CCA4((uint64_t)(a1 + 14), (uint64_t)&v15);
        sub_10000CCA4((uint64_t)&v15, (uint64_t)&v14);
        v7 = (void *)v14;
        if ((_QWORD)v14)
        {
          v8 = objc_allocWithZone((Class)type metadata accessor for MicrophoneTestEvaluatingViewController());
          v9 = swift_retain(v2);
          v10 = sub_100012B38(v9);
          objc_msgSend(v7, "pushViewController:animated:", v10, 1);

        }
        swift_retain(v2);
        sub_10000F738();
        return (_QWORD *)swift_release(v2);
      }
    }
  }
  else
  {
    v11 = a1[1];
    v12 = type metadata accessor for AudioManager(0);
    v13 = sub_1000080E0();
    result = (_QWORD *)EnvironmentObject.error()(0, v11, v12, v13);
    __break(1u);
  }
  return result;
}

void sub_10000BA48(uint64_t *a1)
{
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t Strong;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v1 = *a1;
  if (*a1)
  {
    KeyPath = swift_getKeyPath(&unk_100018D78);
    v3 = swift_getKeyPath(&unk_100018DA0);
    v4 = swift_retain(v1);
    static Published.subscript.getter(&v11, v4, KeyPath, v3);
    swift_release(v1);
    swift_release(KeyPath);
    swift_release(v3);
    if ((v11 & 1) != 0)
    {
      v5 = sub_100014E58((uint64_t)&_swiftEmptyArrayStorage);
      if (qword_1000216F8 != -1)
        swift_once(&qword_1000216F8, sub_100014F9C);
      Strong = swift_unknownObjectWeakLoadStrong(qword_1000225D8 + 16);
      if (Strong)
      {
        v7 = (void *)Strong;
        sub_100015ACC(0, v5);
        swift_bridgeObjectRelease(v5);

      }
      else
      {
        swift_bridgeObjectRelease(v5);
      }
    }
  }
  else
  {
    v8 = a1[1];
    v9 = type metadata accessor for AudioManager(0);
    v10 = sub_1000080E0();
    EnvironmentObject.error()(0, v8, v9, v10);
    __break(1u);
  }
}

void sub_10000BB70(uint64_t *a1)
{
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t Strong;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v1 = *a1;
  if (*a1)
  {
    KeyPath = swift_getKeyPath(&unk_100018DC0);
    v3 = swift_getKeyPath(&unk_100018DE8);
    v4 = swift_retain(v1);
    static Published.subscript.getter(&v11, v4, KeyPath, v3);
    swift_release(v1);
    swift_release(KeyPath);
    swift_release(v3);
    if ((v11 & 1) != 0)
    {
      v5 = sub_100014E58((uint64_t)&_swiftEmptyArrayStorage);
      if (qword_1000216F8 != -1)
        swift_once(&qword_1000216F8, sub_100014F9C);
      Strong = swift_unknownObjectWeakLoadStrong(qword_1000225D8 + 16);
      if (Strong)
      {
        v7 = (void *)Strong;
        sub_100015ACC(1, v5);
        swift_bridgeObjectRelease(v5);

      }
      else
      {
        swift_bridgeObjectRelease(v5);
      }
    }
  }
  else
  {
    v8 = a1[1];
    v9 = type metadata accessor for AudioManager(0);
    v10 = sub_1000080E0();
    EnvironmentObject.error()(0, v8, v9, v10);
    __break(1u);
  }
}

void sub_10000BC98(uint64_t *a1)
{
  uint64_t v1;
  uint64_t KeyPath;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t Strong;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v1 = *a1;
  if (*a1)
  {
    KeyPath = swift_getKeyPath(&unk_100018E08);
    v3 = swift_getKeyPath(&unk_100018E30);
    v4 = swift_retain(v1);
    static Published.subscript.getter(&v11, v4, KeyPath, v3);
    swift_release(v1);
    swift_release(KeyPath);
    swift_release(v3);
    if ((v11 & 1) != 0)
    {
      v5 = sub_100014E58((uint64_t)&_swiftEmptyArrayStorage);
      if (qword_1000216F8 != -1)
        swift_once(&qword_1000216F8, sub_100014F9C);
      Strong = swift_unknownObjectWeakLoadStrong(qword_1000225D8 + 16);
      if (Strong)
      {
        v7 = (void *)Strong;
        sub_100015ACC(2, v5);
        swift_bridgeObjectRelease(v5);

      }
      else
      {
        swift_bridgeObjectRelease(v5);
      }
    }
  }
  else
  {
    v8 = a1[1];
    v9 = type metadata accessor for AudioManager(0);
    v10 = sub_1000080E0();
    EnvironmentObject.error()(0, v8, v9, v10);
    __break(1u);
  }
}

_QWORD *sub_10000BDC0()
{
  uint64_t v0;
  _QWORD *result;
  uint64_t v2;

  v0 = sub_100008128(&qword_100021AE8);
  result = Binding.wrappedValue.getter(&v2, v0);
  if (v2 == 1)
    return (_QWORD *)sub_10000BE20();
  return result;
}

uint64_t sub_10000BE20()
{
  uint64_t v0;
  _QWORD *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  id v10;

  v1 = (_QWORD *)v0;
  v9 = *(_OWORD *)(v0 + 16);
  sub_100008128(&qword_100021AF0);
  State.wrappedValue.getter(&v10);
  v2 = v10;
  objc_msgSend(v10, "invalidate", v9);

  v3 = *v1;
  if (*v1)
  {
    swift_retain(*v1);
    sub_10001046C();
    swift_release(v3);
    swift_retain(v3);
    sub_10000F738();
    swift_release(v3);
    LOBYTE(v10) = 0;
    v4 = sub_100008128(&qword_100021848);
    State.wrappedValue.setter(&v10, v4);
    LOBYTE(v10) = 0;
    State.wrappedValue.setter(&v10, v4);
    LOBYTE(v10) = 0;
    State.wrappedValue.setter(&v10, v4);
    LOBYTE(v10) = 0;
    State.wrappedValue.setter(&v10, v4);
    swift_retain(v3);
    sub_1000117E0();
    return swift_release(v3);
  }
  else
  {
    v6 = v1[1];
    v7 = type metadata accessor for AudioManager(0);
    v8 = sub_1000080E0();
    result = EnvironmentObject.error()(0, v6, v7, v8);
    __break(1u);
  }
  return result;
}

uint64_t sub_10000BF7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  __int128 v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  id (*v22)(void *);
  uint64_t v23;
  id v24;

  v1 = v0;
  v19 = *(_OWORD *)(v0 + 32);
  v24 = 0;
  v2 = sub_100008128(&qword_100021AB0);
  result = State.wrappedValue.setter(&v24, v2);
  if (qword_1000216E0 != -1)
    result = swift_once(&qword_1000216E0, sub_100009A50);
  v4 = *(double *)(qword_1000225B0 + 16);
  v5 = v4 / 100.0;
  v6 = v4 / (v4 / 100.0);
  if ((~*(_QWORD *)&v6 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
  if (v6 <= -9.22337204e18)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  if (v6 < 9.22337204e18)
  {
    v7 = (uint64_t)v6;
    v8 = swift_allocObject(&unk_10001D270, 24, 7);
    *(_QWORD *)(v8 + 16) = 0;
    v9 = (void *)objc_opt_self(NSTimer);
    v10 = swift_allocObject(&unk_10001D298, 176, 7);
    v11 = *(_OWORD *)(v1 + 112);
    *(_OWORD *)(v10 + 112) = *(_OWORD *)(v1 + 96);
    *(_OWORD *)(v10 + 128) = v11;
    *(_OWORD *)(v10 + 137) = *(_OWORD *)(v1 + 121);
    v12 = *(_OWORD *)(v1 + 48);
    *(_OWORD *)(v10 + 48) = *(_OWORD *)(v1 + 32);
    *(_OWORD *)(v10 + 64) = v12;
    v13 = *(_OWORD *)(v1 + 80);
    *(_OWORD *)(v10 + 80) = *(_OWORD *)(v1 + 64);
    *(_OWORD *)(v10 + 96) = v13;
    v14 = *(_OWORD *)(v1 + 16);
    *(_OWORD *)(v10 + 16) = *(_OWORD *)v1;
    *(_OWORD *)(v10 + 32) = v14;
    *(_QWORD *)(v10 + 160) = v8;
    *(_QWORD *)(v10 + 168) = v7;
    v22 = sub_10000D020;
    v23 = v10;
    *(_QWORD *)&v19 = _NSConcreteStackBlock;
    *((_QWORD *)&v19 + 1) = 1107296256;
    v20 = sub_10000AD18;
    v21 = &unk_10001D2B0;
    v15 = _Block_copy(&v19);
    v16 = v23;
    sub_10000CA3C((uint64_t *)v1);
    swift_retain(v8);
    swift_release(v16);
    v17 = objc_msgSend(v9, "scheduledTimerWithTimeInterval:repeats:block:", 1, v15, v5);
    _Block_release(v15);
    v19 = *(_OWORD *)(v1 + 16);
    v24 = v17;
    v18 = sub_100008128(&qword_100021AF0);
    State.wrappedValue.setter(&v24, v18);
    return swift_release(v8);
  }
LABEL_9:
  __break(1u);
  return result;
}

id sub_10000C194(void *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v8;
  double v9;
  uint64_t v10;
  id result;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  __int128 v19;
  double v20;
  char v21[24];

  v8 = (uint64_t *)(a3 + 16);
  swift_beginAccess(a3 + 16, v21, 0, 0);
  v9 = (double)*(uint64_t *)(a3 + 16) / (double)a4;
  v19 = *((_OWORD *)a2 + 2);
  v20 = v9;
  v10 = sub_100008128(&qword_100021AB0);
  State.wrappedValue.setter(&v20, v10);
  result = (id)swift_beginAccess(v8, &v19, 1, 0);
  v12 = *(_QWORD *)(a3 + 16);
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
  {
    __break(1u);
    goto LABEL_7;
  }
  *v8 = v14;
  if (v14 < a4)
    return result;
  v15 = *a2;
  if (!*a2)
  {
LABEL_7:
    v16 = a2[1];
    v17 = type metadata accessor for AudioManager(0);
    v18 = sub_1000080E0();
    result = (id)EnvironmentObject.error()(0, v16, v17, v18);
    __break(1u);
    return result;
  }
  swift_retain(*a2);
  sub_10001046C();
  swift_release(v15);
  return objc_msgSend(a1, "invalidate", v19);
}

uint64_t sub_10000C2AC@<X0>(uint64_t a1@<X8>)
{
  return sub_10000AD68(a1);
}

_QWORD *sub_10000C2FC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char a6@<W5>, uint64_t a7@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  _QWORD *result;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v28 = 0;
  v8 = sub_100008128(&qword_100021A68);
  State.init(wrappedValue:)(&v29, &v28, v8);
  v20 = v30;
  v21 = v29;
  v28 = 0;
  State.init(wrappedValue:)(&v29, &v28, &type metadata for Double);
  v9 = v29;
  v10 = v30;
  LOBYTE(v28) = 1;
  State.init(wrappedValue:)(&v29, &v28, &type metadata for Bool);
  v11 = v29;
  v12 = v30;
  LOBYTE(v28) = 1;
  State.init(wrappedValue:)(&v29, &v28, &type metadata for Bool);
  v13 = v29;
  v14 = v30;
  LOBYTE(v28) = 1;
  State.init(wrappedValue:)(&v29, &v28, &type metadata for Bool);
  v15 = v29;
  v16 = v30;
  LOBYTE(v28) = 1;
  result = State.init(wrappedValue:)(&v29, &v28, &type metadata for Bool);
  v18 = v29;
  v19 = v30;
  *(_QWORD *)a7 = a1;
  *(_QWORD *)(a7 + 8) = a2;
  *(_QWORD *)(a7 + 16) = v21;
  *(_QWORD *)(a7 + 24) = v20;
  *(_QWORD *)(a7 + 32) = v9;
  *(_QWORD *)(a7 + 40) = v10;
  *(_BYTE *)(a7 + 48) = v11;
  *(_QWORD *)(a7 + 56) = v12;
  *(_BYTE *)(a7 + 64) = v13;
  *(_QWORD *)(a7 + 72) = v14;
  *(_BYTE *)(a7 + 80) = v15;
  *(_QWORD *)(a7 + 88) = v16;
  *(_BYTE *)(a7 + 96) = v18;
  *(_QWORD *)(a7 + 104) = v19;
  *(_QWORD *)(a7 + 112) = a3;
  *(_QWORD *)(a7 + 120) = a4;
  *(_QWORD *)(a7 + 128) = a5;
  *(_BYTE *)(a7 + 136) = a6;
  return result;
}

uint64_t destroy for MicrophoneTestRecordingView(uint64_t a1)
{
  swift_release(*(_QWORD *)a1);

  swift_release(*(_QWORD *)(a1 + 24));
  swift_release(*(_QWORD *)(a1 + 40));
  swift_release(*(_QWORD *)(a1 + 56));
  swift_release(*(_QWORD *)(a1 + 72));
  swift_release(*(_QWORD *)(a1 + 88));
  swift_release(*(_QWORD *)(a1 + 104));

  swift_release(*(_QWORD *)(a1 + 120));
  return swift_release(*(_QWORD *)(a1 + 128));
}

uint64_t initializeWithCopy for MicrophoneTestRecordingView(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v17;

  v3 = *a2;
  v4 = a2[1];
  *(_QWORD *)a1 = *a2;
  *(_QWORD *)(a1 + 8) = v4;
  v6 = (void *)a2[2];
  v5 = a2[3];
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v5;
  v7 = a2[5];
  *(_QWORD *)(a1 + 32) = a2[4];
  *(_QWORD *)(a1 + 40) = v7;
  *(_BYTE *)(a1 + 48) = *((_BYTE *)a2 + 48);
  v8 = a2[7];
  *(_QWORD *)(a1 + 56) = v8;
  *(_BYTE *)(a1 + 64) = *((_BYTE *)a2 + 64);
  v9 = a2[9];
  *(_QWORD *)(a1 + 72) = v9;
  *(_BYTE *)(a1 + 80) = *((_BYTE *)a2 + 80);
  v10 = a2[11];
  *(_QWORD *)(a1 + 88) = v10;
  *(_BYTE *)(a1 + 96) = *((_BYTE *)a2 + 96);
  v11 = a2[13];
  v12 = (void *)a2[14];
  *(_QWORD *)(a1 + 104) = v11;
  *(_QWORD *)(a1 + 112) = v12;
  v13 = a2[15];
  v17 = a2[16];
  *(_QWORD *)(a1 + 120) = v13;
  *(_QWORD *)(a1 + 128) = v17;
  *(_BYTE *)(a1 + 136) = *((_BYTE *)a2 + 136);
  swift_retain(v3);
  v14 = v6;
  swift_retain(v5);
  swift_retain(v7);
  swift_retain(v8);
  swift_retain(v9);
  swift_retain(v10);
  swift_retain(v11);
  v15 = v12;
  swift_retain(v13);
  swift_retain(v17);
  return a1;
}

uint64_t *assignWithCopy for MicrophoneTestRecordingView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
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
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v4 = *a1;
  v5 = *a2;
  *a1 = *a2;
  swift_retain(v5);
  swift_release(v4);
  a1[1] = a2[1];
  v6 = (void *)a1[2];
  v7 = (void *)a2[2];
  a1[2] = (uint64_t)v7;
  v8 = v7;

  v9 = a1[3];
  v10 = a2[3];
  a1[3] = v10;
  swift_retain(v10);
  swift_release(v9);
  a1[4] = a2[4];
  v11 = a1[5];
  v12 = a2[5];
  a1[5] = v12;
  swift_retain(v12);
  swift_release(v11);
  *((_BYTE *)a1 + 48) = *((_BYTE *)a2 + 48);
  v13 = a1[7];
  v14 = a2[7];
  a1[7] = v14;
  swift_retain(v14);
  swift_release(v13);
  *((_BYTE *)a1 + 64) = *((_BYTE *)a2 + 64);
  v15 = a1[9];
  v16 = a2[9];
  a1[9] = v16;
  swift_retain(v16);
  swift_release(v15);
  *((_BYTE *)a1 + 80) = *((_BYTE *)a2 + 80);
  v17 = a1[11];
  v18 = a2[11];
  a1[11] = v18;
  swift_retain(v18);
  swift_release(v17);
  *((_BYTE *)a1 + 96) = *((_BYTE *)a2 + 96);
  v19 = a1[13];
  v20 = a2[13];
  a1[13] = v20;
  swift_retain(v20);
  swift_release(v19);
  v21 = (void *)a1[14];
  v22 = (void *)a2[14];
  a1[14] = (uint64_t)v22;
  v23 = v22;

  v24 = a1[15];
  v25 = a2[15];
  a1[15] = v25;
  swift_retain(v25);
  swift_release(v24);
  v26 = a2[16];
  v27 = a1[16];
  a1[16] = v26;
  swift_retain(v26);
  swift_release(v27);
  *((_BYTE *)a1 + 136) = *((_BYTE *)a2 + 136);
  return a1;
}

__n128 initializeWithTake for MicrophoneTestRecordingView(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(_OWORD *)(a1 + 16) = v2;
  *(_OWORD *)(a1 + 32) = v3;
  result = *(__n128 *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 121) = *(_OWORD *)(a2 + 121);
  *(_OWORD *)(a1 + 96) = v6;
  *(_OWORD *)(a1 + 112) = v7;
  *(__n128 *)(a1 + 80) = result;
  return result;
}

uint64_t *assignWithTake for MicrophoneTestRecordingView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v4 = *a1;
  *a1 = *a2;
  swift_release(v4);
  a1[1] = a2[1];

  v5 = a1[3];
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
  swift_release(v5);
  a1[4] = a2[4];
  v6 = a1[5];
  a1[5] = a2[5];
  swift_release(v6);
  *((_BYTE *)a1 + 48) = *((_BYTE *)a2 + 48);
  v7 = a1[7];
  a1[7] = a2[7];
  swift_release(v7);
  *((_BYTE *)a1 + 64) = *((_BYTE *)a2 + 64);
  v8 = a1[9];
  a1[9] = a2[9];
  swift_release(v8);
  *((_BYTE *)a1 + 80) = *((_BYTE *)a2 + 80);
  v9 = a1[11];
  a1[11] = a2[11];
  swift_release(v9);
  *((_BYTE *)a1 + 96) = *((_BYTE *)a2 + 96);
  swift_release(a1[13]);
  v10 = (void *)a1[14];
  *(_OWORD *)(a1 + 13) = *(_OWORD *)(a2 + 13);

  swift_release(a1[15]);
  v11 = a1[16];
  *(_OWORD *)(a1 + 15) = *(_OWORD *)(a2 + 15);
  swift_release(v11);
  *((_BYTE *)a1 + 136) = *((_BYTE *)a2 + 136);
  return a1;
}

uint64_t getEnumTagSinglePayload for MicrophoneTestRecordingView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 137))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 128);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MicrophoneTestRecordingView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 136) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 137) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 128) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 137) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MicrophoneTestRecordingView()
{
  return &type metadata for MicrophoneTestRecordingView;
}

uint64_t sub_10000C930(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10001A8B0, 1);
}

unint64_t sub_10000C940()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021AC0;
  if (!qword_100021AC0)
  {
    v1 = sub_100008C48(&qword_100021AB8);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100021AC0);
  }
  return result;
}

unint64_t sub_10000C9A4()
{
  unint64_t result;

  result = qword_100021AC8;
  if (!qword_100021AC8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Double, &type metadata for Double);
    atomic_store(result, (unint64_t *)&qword_100021AC8);
  }
  return result;
}

uint64_t sub_10000C9EC()
{
  uint64_t v0;

  return sub_10000B884((_QWORD *)(v0 + 16));
}

uint64_t sub_10000C9F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100008128(&qword_100021A78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *sub_10000CA3C(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v14;

  v2 = *a1;
  v4 = (void *)a1[2];
  v3 = a1[3];
  v5 = a1[5];
  v6 = a1[7];
  v7 = a1[9];
  v8 = a1[11];
  v9 = a1[13];
  v14 = (void *)a1[14];
  v10 = a1[16];
  swift_retain(a1[15]);
  swift_retain(v10);
  swift_retain(v2);
  v11 = v4;
  swift_retain(v3);
  swift_retain(v5);
  swift_retain(v6);
  swift_retain(v7);
  swift_retain(v8);
  swift_retain(v9);
  v12 = v14;
  return a1;
}

_QWORD *sub_10000CB08()
{
  uint64_t v0;

  return sub_10000B8F0((uint64_t *)(v0 + 16));
}

uint64_t sub_10000CB10()
{
  return sub_10000CB34(&qword_100021AD8, &qword_100021A78, (void (*)(void))sub_10000CB9C);
}

uint64_t sub_10000CB34(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_100008C48(a2);
    a3();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_10000CB9C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021AE0;
  if (!qword_100021AE0)
  {
    v1 = sub_100008C48(&qword_100021A70);
    result = swift_getWitnessTable(&protocol conformance descriptor for ProgressView<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100021AE0);
  }
  return result;
}

void sub_10000CBF4()
{
  uint64_t v0;

  sub_10000BA48((uint64_t *)(v0 + 16));
}

void sub_10000CC08()
{
  uint64_t v0;

  sub_10000BB70((uint64_t *)(v0 + 16));
}

void sub_10000CC1C()
{
  uint64_t v0;

  sub_10000BC98((uint64_t *)(v0 + 16));
}

uint64_t sub_10000CC28()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  swift_release(*(_QWORD *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 56));
  swift_release(*(_QWORD *)(v0 + 72));
  swift_release(*(_QWORD *)(v0 + 88));
  swift_release(*(_QWORD *)(v0 + 104));
  swift_release(*(_QWORD *)(v0 + 120));

  swift_release(*(_QWORD *)(v0 + 136));
  swift_release(*(_QWORD *)(v0 + 144));
  return swift_deallocObject(v0, 153, 7);
}

_QWORD *sub_10000CC9C()
{
  return sub_10000BDC0();
}

uint64_t sub_10000CCA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100008128(&qword_100021AF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id sub_10000CCEC()
{
  void *v0;
  id v1;
  unsigned int v2;
  id v3;
  id v4;
  id v5;
  unsigned int v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  os_log_type_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  _QWORD *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;

  v0 = (void *)objc_opt_self(AVAudioSession);
  v1 = objc_msgSend(v0, "sharedInstance");
  v19 = 0;
  v2 = objc_msgSend(v1, "setCategory:mode:options:error:", AVAudioSessionCategoryRecord, AVAudioSessionModeDefault, 0, &v19);

  v3 = v19;
  if (v2)
  {
    v4 = v19;
    v5 = objc_msgSend(v0, "sharedInstance");
    v19 = 0;
    v6 = objc_msgSend(v5, "setActive:error:", 1, &v19);

    v3 = v19;
    if (v6)
      return v19;
  }
  v18 = v3;
  v8 = v3;
  v9 = _convertNSErrorToError(_:)(v18);

  v10 = swift_willThrow();
  v11 = static os_log_type_t.error.getter(v10);
  if (qword_1000216E8 != -1)
    swift_once(&qword_1000216E8, sub_10000F050);
  v12 = qword_1000225B8;
  v13 = v11;
  if (os_log_type_enabled((os_log_t)qword_1000225B8, v11))
  {
    swift_errorRetain(v9);
    swift_errorRetain(v9);
    v14 = (uint8_t *)swift_slowAlloc(12, -1);
    v15 = (_QWORD *)swift_slowAlloc(8, -1);
    *(_DWORD *)v14 = 138412290;
    swift_errorRetain(v9);
    v16 = (void *)_swift_stdlib_bridgeErrorToNSError(v9);
    v19 = v16;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v19, &v20, v14 + 4, v14 + 12);
    *v15 = v16;
    swift_errorRelease(v9);
    swift_errorRelease(v9);
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Failed to set up the recording session: %@", v14, 0xCu);
    v17 = sub_100008128((uint64_t *)&unk_100021B00);
    swift_arrayDestroy(v15, 1, v17);
    swift_slowDealloc(v15, -1, -1);
    swift_slowDealloc(v14, -1, -1);
  }
  return (id)swift_errorRelease(v9);
}

uint64_t sub_10000CF94()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000CFA4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));

  swift_release(*(_QWORD *)(v0 + 40));
  swift_release(*(_QWORD *)(v0 + 56));
  swift_release(*(_QWORD *)(v0 + 72));
  swift_release(*(_QWORD *)(v0 + 88));
  swift_release(*(_QWORD *)(v0 + 104));
  swift_release(*(_QWORD *)(v0 + 120));

  swift_release(*(_QWORD *)(v0 + 136));
  swift_release(*(_QWORD *)(v0 + 144));
  swift_release(*(_QWORD *)(v0 + 160));
  return swift_deallocObject(v0, 176, 7);
}

id sub_10000D020(void *a1)
{
  uint64_t *v1;

  return sub_10000C194(a1, v1 + 2, v1[20], v1[21]);
}

uint64_t sub_10000D02C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000D03C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000D044()
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
  void *v10;
  uint64_t v11;
  void *v12;

  v0 = sub_100008C48(&qword_100021AA0);
  v1 = sub_100008C48(&qword_100021A98);
  v2 = sub_100008C48(&qword_100021A90);
  v3 = sub_100008C48(&qword_100021A88);
  v9 = sub_100008C48(&qword_100021A80);
  v10 = &type metadata for Bool;
  v11 = sub_10000CB34(&qword_100021AD0, &qword_100021A80, (void (*)(void))sub_10000CB10);
  v12 = &protocol witness table for Bool;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v9, &opaque type descriptor for <<opaque return type of View.onChange<A>(of:initial:_:)>>, 1);
  v9 = v3;
  v10 = &type metadata for Bool;
  v11 = OpaqueTypeConformance2;
  v12 = &protocol witness table for Bool;
  v5 = swift_getOpaqueTypeConformance2(&v9, &opaque type descriptor for <<opaque return type of View.onChange<A>(of:initial:_:)>>, 1);
  v9 = v2;
  v10 = &type metadata for Bool;
  v11 = v5;
  v12 = &protocol witness table for Bool;
  v6 = swift_getOpaqueTypeConformance2(&v9, &opaque type descriptor for <<opaque return type of View.onChange<A>(of:initial:_:)>>, 1);
  v9 = v1;
  v10 = &type metadata for Bool;
  v11 = v6;
  v12 = &protocol witness table for Bool;
  v7 = swift_getOpaqueTypeConformance2(&v9, &opaque type descriptor for <<opaque return type of View.onChange<A>(of:initial:_:)>>, 1);
  v9 = v0;
  v10 = &type metadata for Bool;
  v11 = v7;
  v12 = &protocol witness table for Bool;
  return swift_getOpaqueTypeConformance2(&v9, &opaque type descriptor for <<opaque return type of View.onChange<A>(of:initial:_:)>>, 1);
}

uint64_t sub_10000D18C(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  unint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v38;
  double v39;
  unint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  int64_t v47;
  int64_t v48;
  unint64_t v49;
  unint64_t v50;
  int64_t v51;
  unint64_t v52;
  int64_t v53;
  uint64_t *v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  double v67;
  uint64_t v68;
  uint64_t v69;
  unint64_t v70;
  uint64_t v71;
  double v72;
  __int128 v73;
  __int128 v74;

  v2 = v1;
  v4 = OBJC_IVAR___MicrophoneTestInputs_audioRecordingDuration;
  *(_QWORD *)&v1[OBJC_IVAR___MicrophoneTestInputs_audioRecordingDuration] = 0x4008000000000000;
  v6 = *(_QWORD *)&v1[OBJC_IVAR___MicrophoneTestInputs_audioRecordingDurationKey];
  v5 = *(_QWORD *)&v1[OBJC_IVAR___MicrophoneTestInputs_audioRecordingDurationKey + 8];
  if (!*(_QWORD *)(a1 + 16))
  {
    v73 = 0u;
    v74 = 0u;
    goto LABEL_11;
  }
  swift_bridgeObjectRetain(*(_QWORD *)&v1[OBJC_IVAR___MicrophoneTestInputs_audioRecordingDurationKey + 8]);
  v7 = sub_100015FB8(v6, v5);
  if ((v8 & 1) == 0)
  {
    v73 = 0u;
    v74 = 0u;
    swift_bridgeObjectRelease(v5);
    goto LABEL_11;
  }
  sub_10000E660(*(_QWORD *)(a1 + 56) + 32 * v7, (uint64_t)&v73);
  swift_bridgeObjectRelease(v5);
  if (!*((_QWORD *)&v74 + 1))
  {
LABEL_11:
    v9 = sub_10000E004((uint64_t)&v73);
    goto LABEL_12;
  }
  v9 = swift_dynamicCast(&v72, &v73, (char *)&type metadata for Any + 8, &type metadata for Double, 6);
  if ((v9 & 1) == 0 || v72 < 1.0 || v72 > 10.0)
  {
LABEL_12:
    v10 = static os_log_type_t.error.getter(v9);
    v11 = sub_100008128(&qword_100021BF8);
    v12 = swift_allocObject(v11, 72, 7);
    *(_OWORD *)(v12 + 16) = xmmword_100018E50;
    *(_QWORD *)(v12 + 56) = &type metadata for String;
    *(_QWORD *)(v12 + 64) = sub_10000E044();
    *(_QWORD *)(v12 + 32) = v6;
    *(_QWORD *)(v12 + 40) = v5;
    sub_10000E088();
    v13 = swift_bridgeObjectRetain(v5);
    v14 = (void *)static OS_os_log.default.getter(v13);
    os_log(_:dso:log:type:_:)("Input parameter validation: Default value is used for %@ ", 57, 2, &_mh_execute_header, v14, v10, v12);
    swift_bridgeObjectRelease(v12);

    if (!*(_QWORD *)(a1 + 16))
      goto LABEL_8;
    goto LABEL_13;
  }
  *(double *)&v1[v4] = v72;
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_8:
    v73 = 0u;
    v74 = 0u;
LABEL_20:
    sub_10000E004((uint64_t)&v73);
    goto LABEL_21;
  }
LABEL_13:
  v15 = *(_QWORD *)&v2[OBJC_IVAR___MicrophoneTestInputs_stringPropertiesKey];
  v16 = *(_QWORD *)&v2[OBJC_IVAR___MicrophoneTestInputs_stringPropertiesKey + 8];
  swift_bridgeObjectRetain(v16);
  v17 = sub_100015FB8(v15, v16);
  if ((v18 & 1) != 0)
  {
    sub_10000E660(*(_QWORD *)(a1 + 56) + 32 * v17, (uint64_t)&v73);
  }
  else
  {
    v73 = 0u;
    v74 = 0u;
  }
  swift_bridgeObjectRelease(v16);
  if (!*((_QWORD *)&v74 + 1))
    goto LABEL_20;
  v19 = sub_100008128(&qword_100021C20);
  if ((swift_dynamicCast(&v72, &v73, (char *)&type metadata for Any + 8, v19, 6) & 1) != 0)
  {
    v20 = *(_QWORD *)&v72;
    if (*(_QWORD *)(*(_QWORD *)&v72 + 16))
      goto LABEL_22;
    swift_bridgeObjectRelease(*(_QWORD *)&v72);
  }
LABEL_21:
  v20 = sub_100014E58((uint64_t)_swiftEmptyArrayStorage);
LABEL_22:
  v21 = *(_QWORD *)&v2[OBJC_IVAR___MicrophoneTestInputs_stringProperties];
  *(_QWORD *)&v2[OBJC_IVAR___MicrophoneTestInputs_stringProperties] = v20;
  swift_bridgeObjectRelease(v21);
  v23 = *(_QWORD *)&v2[OBJC_IVAR___MicrophoneTestInputs_microphoneSequenceKey];
  v22 = *(_QWORD *)&v2[OBJC_IVAR___MicrophoneTestInputs_microphoneSequenceKey + 8];
  if (!*(_QWORD *)(a1 + 16))
  {
    v73 = 0u;
    v74 = 0u;
LABEL_33:
    v27 = sub_10000E004((uint64_t)&v73);
    goto LABEL_34;
  }
  swift_bridgeObjectRetain(*(_QWORD *)&v2[OBJC_IVAR___MicrophoneTestInputs_microphoneSequenceKey + 8]);
  v24 = sub_100015FB8(v23, v22);
  if ((v25 & 1) != 0)
  {
    sub_10000E660(*(_QWORD *)(a1 + 56) + 32 * v24, (uint64_t)&v73);
  }
  else
  {
    v73 = 0u;
    v74 = 0u;
  }
  swift_bridgeObjectRelease(v22);
  if (!*((_QWORD *)&v74 + 1))
    goto LABEL_33;
  v26 = sub_100008128(&qword_100021C10);
  v27 = swift_dynamicCast(&v72, &v73, (char *)&type metadata for Any + 8, v26, 6);
  if ((v27 & 1) == 0)
  {
LABEL_34:
    v31 = static os_log_type_t.fault.getter(v27);
LABEL_35:
    v32 = v31;
    v33 = sub_100008128(&qword_100021BF8);
    v34 = swift_allocObject(v33, 72, 7);
    *(_OWORD *)(v34 + 16) = xmmword_100018E50;
    *(_QWORD *)(v34 + 56) = &type metadata for String;
    *(_QWORD *)(v34 + 64) = sub_10000E044();
    *(_QWORD *)(v34 + 32) = v23;
    *(_QWORD *)(v34 + 40) = v22;
    sub_10000E088();
    v35 = swift_bridgeObjectRetain(v22);
    v36 = (void *)static OS_os_log.default.getter(v35);
    os_log(_:dso:log:type:_:)("Input parameter validation: required value %@ is missing, abort text", 68, 2, &_mh_execute_header, v36, v32, v34);
    swift_bridgeObjectRelease(v34);

    return 0;
  }
  v28 = v72;
  if (!*(_QWORD *)(*(_QWORD *)&v72 + 16))
  {
    v27 = swift_bridgeObjectRelease(*(_QWORD *)&v72);
    goto LABEL_34;
  }
  v23 = *(_QWORD *)&v2[OBJC_IVAR___MicrophoneTestInputs_inputComponentsKey];
  v22 = *(_QWORD *)&v2[OBJC_IVAR___MicrophoneTestInputs_inputComponentsKey + 8];
  if (!*(_QWORD *)(a1 + 16))
  {
    v73 = 0u;
    v74 = 0u;
LABEL_73:
    swift_bridgeObjectRelease(*(_QWORD *)&v28);
    v60 = sub_10000E004((uint64_t)&v73);
    v31 = static os_log_type_t.error.getter(v60);
    goto LABEL_35;
  }
  swift_bridgeObjectRetain(*(_QWORD *)&v2[OBJC_IVAR___MicrophoneTestInputs_inputComponentsKey + 8]);
  v29 = sub_100015FB8(v23, v22);
  if ((v30 & 1) != 0)
  {
    sub_10000E660(*(_QWORD *)(a1 + 56) + 32 * v29, (uint64_t)&v73);
  }
  else
  {
    v73 = 0u;
    v74 = 0u;
  }
  swift_bridgeObjectRelease(v22);
  if (!*((_QWORD *)&v74 + 1))
    goto LABEL_73;
  v38 = sub_100008128(&qword_100021C18);
  if ((swift_dynamicCast(&v72, &v73, (char *)&type metadata for Any + 8, v38, 6) & 1) == 0)
  {
LABEL_75:
    v61 = swift_bridgeObjectRelease(*(_QWORD *)&v28);
    v31 = static os_log_type_t.error.getter(v61);
    goto LABEL_35;
  }
  v39 = v72;
  if (!*(_QWORD *)(*(_QWORD *)&v72 + 16))
  {
    swift_bridgeObjectRelease(*(_QWORD *)&v72);
    goto LABEL_75;
  }
  v69 = *(_QWORD *)(*(_QWORD *)&v28 + 16);
  if (!v69)
  {
    swift_bridgeObjectRelease(*(_QWORD *)&v72);
    swift_bridgeObjectRelease(*(_QWORD *)&v28);
    v42 = (char *)_swiftEmptyArrayStorage;
    goto LABEL_78;
  }
  v40 = 0;
  v41 = *(_QWORD *)&v72 + 64;
  v68 = *(_QWORD *)&v28 + 32;
  v42 = (char *)_swiftEmptyArrayStorage;
  v67 = v28;
  while (2)
  {
    if (v40 >= *(_QWORD *)(*(_QWORD *)&v28 + 16))
    {
LABEL_82:
      __break(1u);
      goto LABEL_83;
    }
    v43 = *(_QWORD *)(v68 + 8 * v40);
    v70 = v40 + 1;
    v44 = 1 << *(_BYTE *)(*(_QWORD *)&v39 + 32);
    if (v44 < 64)
      v45 = ~(-1 << v44);
    else
      v45 = -1;
    v46 = v45 & *(_QWORD *)(*(_QWORD *)&v39 + 64);
    v47 = (unint64_t)(v44 + 63) >> 6;
    swift_bridgeObjectRetain(*(_QWORD *)&v39);
    v48 = 0;
    if (v46)
    {
LABEL_50:
      v49 = __clz(__rbit64(v46));
      v46 &= v46 - 1;
      v50 = v49 | (v48 << 6);
      goto LABEL_51;
    }
    while (1)
    {
      v51 = v48 + 1;
      if (__OFADD__(v48, 1))
      {
        __break(1u);
LABEL_81:
        __break(1u);
        goto LABEL_82;
      }
      if (v51 >= v47)
        goto LABEL_44;
      v52 = *(_QWORD *)(v41 + 8 * v51);
      ++v48;
      if (!v52)
      {
        v48 = v51 + 1;
        if (v51 + 1 >= v47)
          goto LABEL_44;
        v52 = *(_QWORD *)(v41 + 8 * v48);
        if (!v52)
        {
          v48 = v51 + 2;
          if (v51 + 2 >= v47)
            goto LABEL_44;
          v52 = *(_QWORD *)(v41 + 8 * v48);
          if (!v52)
            break;
        }
      }
LABEL_66:
      v46 = (v52 - 1) & v52;
      v50 = __clz(__rbit64(v52)) + (v48 << 6);
LABEL_51:
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)&v39 + 56) + 8 * v50) == v43)
      {
        v54 = (uint64_t *)(*(_QWORD *)(*(_QWORD *)&v39 + 48) + 16 * v50);
        v55 = v54[1];
        v71 = *v54;
        swift_bridgeObjectRetain(v55);
        if ((swift_isUniquelyReferenced_nonNull_native(v42) & 1) == 0)
          v42 = sub_10000DEF8(0, *((_QWORD *)v42 + 2) + 1, 1, v42);
        v57 = *((_QWORD *)v42 + 2);
        v56 = *((_QWORD *)v42 + 3);
        v58 = v42;
        if (v57 >= v56 >> 1)
          v58 = sub_10000DEF8((char *)(v56 > 1), v57 + 1, 1, v42);
        *((_QWORD *)v58 + 2) = v57 + 1;
        v42 = v58;
        v59 = &v58[16 * v57];
        *((_QWORD *)v59 + 4) = v71;
        *((_QWORD *)v59 + 5) = v55;
        if (v46)
          goto LABEL_50;
      }
      else if (v46)
      {
        goto LABEL_50;
      }
    }
    v53 = v51 + 3;
    if (v53 < v47)
    {
      v52 = *(_QWORD *)(v41 + 8 * v53);
      if (!v52)
      {
        while (1)
        {
          v48 = v53 + 1;
          if (__OFADD__(v53, 1))
            goto LABEL_81;
          if (v48 >= v47)
            goto LABEL_44;
          v52 = *(_QWORD *)(v41 + 8 * v48);
          ++v53;
          if (v52)
            goto LABEL_66;
        }
      }
      v48 = v53;
      goto LABEL_66;
    }
LABEL_44:
    swift_release(*(_QWORD *)&v39);
    v40 = v70;
    v28 = v67;
    if (v70 != v69)
      continue;
    break;
  }
  swift_bridgeObjectRelease(*(_QWORD *)&v39);
  swift_bridgeObjectRelease(*(_QWORD *)&v67);
LABEL_78:
  if (qword_1000216E0 != -1)
LABEL_83:
    swift_once(&qword_1000216E0, sub_100009A50);
  v62 = qword_1000225B0;
  v63 = v2;
  v64 = swift_bridgeObjectRetain(v42);
  v65 = sub_10000E50C(v64, (uint64_t)v63);
  swift_bridgeObjectRelease_n(v42, 2);

  v66 = *(_QWORD *)(v62 + 32);
  *(_QWORD *)(v62 + 32) = v65;
  swift_bridgeObjectRelease(v66);
  return 1;
}

uint64_t sub_10000D954(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;

  v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v7 = *(_QWORD *)(a1 + *a4);
  *(_QWORD *)(a1 + *a4) = v6;
  swift_bridgeObjectRelease(v7);
  return 1;
}

id sub_10000D9B4()
{
  char *v0;
  char *v1;
  char *v2;
  char *v3;
  char *v4;
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  char *v8;
  objc_super v10;
  char v11[160];

  *(_QWORD *)&v0[OBJC_IVAR___MicrophoneTestInputs_audioRecordingDuration] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___MicrophoneTestInputs_stringProperties] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___MicrophoneTestInputs_microphoneSequence] = _swiftEmptyArrayStorage;
  v1 = &v0[OBJC_IVAR___MicrophoneTestInputs_audioRecordingDurationKey];
  *(_QWORD *)v1 = 0xD000000000000016;
  *((_QWORD *)v1 + 1) = 0x8000000100017410;
  v2 = &v0[OBJC_IVAR___MicrophoneTestInputs_stringPropertiesKey];
  *(_QWORD *)v2 = 0xD000000000000010;
  *((_QWORD *)v2 + 1) = 0x8000000100017430;
  v3 = &v0[OBJC_IVAR___MicrophoneTestInputs_microphoneSequenceKey];
  *(_QWORD *)v3 = 0x65636E6575716573;
  *((_QWORD *)v3 + 1) = 0xE800000000000000;
  v4 = &v0[OBJC_IVAR___MicrophoneTestInputs_inputComponentsKey];
  *(_QWORD *)v4 = 0x6D6F437475706E69;
  *((_QWORD *)v4 + 1) = 0xEF73746E656E6F70;
  v5 = sub_100008128(&qword_100021C30);
  inited = swift_initStackObject(v5, v11);
  *(_OWORD *)(inited + 16) = xmmword_100018940;
  *(_QWORD *)(inited + 32) = 0x6D6F74746F42;
  *(_QWORD *)(inited + 40) = 0xE600000000000000;
  *(_QWORD *)(inited + 48) = 0x74746F427466654CLL;
  *(_QWORD *)(inited + 56) = 0xEA00000000006D6FLL;
  *(_QWORD *)(inited + 64) = 0x746E6F7246;
  *(_QWORD *)(inited + 72) = 0xE500000000000000;
  *(_QWORD *)(inited + 80) = 0x746E6F7246;
  *(_QWORD *)(inited + 88) = 0xE500000000000000;
  *(_QWORD *)(inited + 96) = 1801675074;
  *(_QWORD *)(inited + 104) = 0xE400000000000000;
  *(_QWORD *)(inited + 112) = 1801675074;
  *(_QWORD *)(inited + 120) = 0xE400000000000000;
  *(_QWORD *)(inited + 128) = 4410946;
  *(_QWORD *)(inited + 136) = 0xE300000000000000;
  v7 = OBJC_IVAR___MicrophoneTestInputs_microphoneNameMapping;
  *(_QWORD *)(inited + 144) = 0x746F427468676952;
  *(_QWORD *)(inited + 152) = 0xEB000000006D6F74;
  v8 = v0;
  *(_QWORD *)&v0[v7] = sub_100014E58(inited);
  *(_QWORD *)&v8[OBJC_IVAR___MicrophoneTestInputs_predicates] = &_swiftEmptyDictionarySingleton;
  *(_QWORD *)&v8[OBJC_IVAR___MicrophoneTestInputs_parameters] = &_swiftEmptyDictionarySingleton;
  *(_QWORD *)&v8[OBJC_IVAR___MicrophoneTestInputs_specifications] = &_swiftEmptyDictionarySingleton;

  v10.receiver = v8;
  v10.super_class = (Class)type metadata accessor for MicrophoneTestInputs();
  return objc_msgSendSuper2(&v10, "init");
}

id sub_10000DBDC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MicrophoneTestInputs();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MicrophoneTestInputs()
{
  return objc_opt_self(MicrophoneTestInputs);
}

char *sub_10000DCF4(char *result, int64_t a2, char a3, char *a4)
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
      v10 = sub_100008128((uint64_t *)&unk_100021C40);
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
    sub_10000E248(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

char *sub_10000DE00(char *result, int64_t a2, char a3, char *a4)
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
      v10 = sub_100008128(&qword_100021C38);
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
    sub_10000E338(0, v8, v13, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

char *sub_10000DEF8(char *result, int64_t a2, char a3, char *a4)
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
      v10 = sub_100008128(&qword_100021C28);
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
    sub_10000E41C(0, v8, (unint64_t)v14, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease(a4);
    return v11;
  }
  __break(1u);
  return result;
}

uint64_t sub_10000E004(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100008128(&qword_100021BF0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_10000E044()
{
  unint64_t result;

  result = qword_100021C00;
  if (!qword_100021C00)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_100021C00);
  }
  return result;
}

unint64_t sub_10000E088()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100021C08;
  if (!qword_100021C08)
  {
    v1 = objc_opt_self(OS_os_log);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100021C08);
  }
  return result;
}

uint64_t sub_10000E0C4(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_10000E0E0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_10000E0E0(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
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
    v10 = sub_100008128(&qword_100021C28);
    v11 = (char *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * (v13 >> 4);
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v14 = v11 + 32;
  v15 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= &v15[16 * v8])
      memmove(v14, v15, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v15 >= &v14[16 * v8] || v14 >= &v15[16 * v8])
  {
    swift_arrayInitWithCopy(v14);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_10000E248(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  else
  {
    if (v4 < 0)
    {
      result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
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
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

char *sub_10000E338(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
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

uint64_t sub_10000E41C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  else
  {
    if (v4 < 0)
    {
      result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize with negative count", 51, 2, "Swift/UnsafePointer.swift", 25, 2, 1090, 0);
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
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
LABEL_9:
  __break(1u);
  return result;
}

_QWORD *sub_10000E50C(uint64_t a1, uint64_t a2)
{
  int64_t v2;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_10000E0C4(0, v2, 0);
    v5 = *(_QWORD *)(a2 + OBJC_IVAR___MicrophoneTestInputs_microphoneNameMapping);
    v6 = (uint64_t *)(a1 + 40);
    do
    {
      v7 = *v6;
      if (*(_QWORD *)(v5 + 16))
      {
        v8 = *(v6 - 1);
        swift_bridgeObjectRetain_n(*v6, 2);
        v9 = sub_100015FB8(v8, v7);
        if ((v10 & 1) != 0)
        {
          v11 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 16 * v9);
          v12 = *v11;
          v13 = v11[1];
          swift_bridgeObjectRetain(v13);
        }
        else
        {
          v12 = 0;
          v13 = 0xE000000000000000;
        }
      }
      else
      {
        v14 = swift_bridgeObjectRetain(*v6);
        v12 = 0;
        v13 = 0xE000000000000000;
        swift_bridgeObjectRetain(v14);
      }
      swift_bridgeObjectRelease_n(v7, 2);
      v16 = _swiftEmptyArrayStorage[2];
      v15 = _swiftEmptyArrayStorage[3];
      if (v16 >= v15 >> 1)
        sub_10000E0C4(v15 > 1, v16 + 1, 1);
      _swiftEmptyArrayStorage[2] = v16 + 1;
      v17 = (char *)&_swiftEmptyArrayStorage[2 * v16];
      *((_QWORD *)v17 + 4) = v12;
      *((_QWORD *)v17 + 5) = v13;
      v6 += 2;
      --v2;
    }
    while (v2);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_10000E660(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id sub_10000E6A0(uint64_t a1)
{
  char *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  NSString v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  Swift::String v15;
  Swift::String v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  Swift::String v24;
  NSString v25;
  NSString v26;
  id v27;
  objc_super v29;
  uint64_t v30;
  unint64_t v31;

  v2 = v1;
  *(_QWORD *)&v1[OBJC_IVAR____TtC15Diagnostic_600436MicrophoneTestStartingViewController_audioManager] = a1;
  swift_retain(a1);
  sub_100014D00(0xD000000000000016, (void *)0x80000001000176B0);
  v5 = v4;
  v6 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v5);
  v30 = 0;
  v31 = 0xE000000000000000;
  v7 = (void *)objc_opt_self(UIDevice);
  v8 = objc_msgSend(v7, "currentDevice");
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  if (v9 == (id)1)
    v10 = 0xD000000000000029;
  else
    v10 = 0xD00000000000002BLL;
  if (v9 == (id)1)
    v11 = (void *)0x8000000100017760;
  else
    v11 = (void *)0x80000001000176D0;
  v12 = sub_100014D00(v10, v11);
  v14 = v13;
  swift_bridgeObjectRelease(v11);
  v15._countAndFlagsBits = v12;
  v15._object = v14;
  String.append(_:)(v15);
  swift_bridgeObjectRelease(v14);
  v16._countAndFlagsBits = 657930;
  v16._object = (void *)0xE300000000000000;
  String.append(_:)(v16);
  v17 = objc_msgSend(v7, "currentDevice");
  v18 = objc_msgSend(v17, "userInterfaceIdiom");

  if (v18 == (id)1)
    v19 = 0xD00000000000002BLL;
  else
    v19 = 0xD00000000000002DLL;
  if (v18 == (id)1)
    v20 = (void *)0x8000000100017730;
  else
    v20 = (void *)0x8000000100017700;
  v21 = sub_100014D00(v19, v20);
  v23 = v22;
  swift_bridgeObjectRelease(v20);
  v24._countAndFlagsBits = v21;
  v24._object = v23;
  String.append(_:)(v24);
  swift_bridgeObjectRelease(v23);
  v25 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v31);
  v26 = String._bridgeToObjectiveC()();
  v29.receiver = v2;
  v29.super_class = (Class)type metadata accessor for MicrophoneTestStartingViewController();
  v27 = objc_msgSendSuper2(&v29, "initWithTitle:detailText:symbolName:contentLayout:", v6, v25, v26, 2);

  swift_release(a1);
  return v27;
}

void sub_10000E8EC()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  objc_super v18;

  v1 = v0;
  v18.receiver = v0;
  v18.super_class = (Class)type metadata accessor for MicrophoneTestStartingViewController();
  objc_msgSendSuper2(&v18, "viewDidLoad");
  v2 = objc_msgSend((id)objc_opt_self(OBBoldTrayButton), "boldButton");
  sub_100014D00(0x45525F5452415453, (void *)0xEF474E4944524F43);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  objc_msgSend(v2, "setTitle:forState:", v5, 0);

  sub_10000A164();
  v6 = swift_allocObject(&unk_10001D340, 24, 7);
  *(_QWORD *)(v6 + 16) = v1;
  v7 = v1;
  v8 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)(0, 0xE000000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, sub_10000F024, v6);
  objc_msgSend(v2, "addAction:forControlEvents:", v8, 64);

  v9 = objc_msgSend((id)objc_opt_self(OBLinkTrayButton), "linkButton");
  sub_100014D00(0x455F4C45434E4143, (void *)0xEB00000000544958);
  v11 = v10;
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  objc_msgSend(v9, "setTitle:forState:", v12, 0);

  v13 = swift_allocObject(&unk_10001D368, 24, 7);
  *(_QWORD *)(v13 + 16) = v7;
  v14 = v7;
  v15 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)(0, 0xE000000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, sub_10000F02C, v13);
  objc_msgSend(v9, "addAction:forControlEvents:", v15, 64);

  v16 = objc_msgSend(v14, "buttonTray");
  objc_msgSend(v16, "addButton:", v2);

  v17 = objc_msgSend(v14, "buttonTray");
  objc_msgSend(v17, "addButton:", v9);

}

void sub_10000EB88(int a1, char *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;

  v3 = objc_msgSend(a2, "navigationController");
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)&a2[OBJC_IVAR____TtC15Diagnostic_600436MicrophoneTestStartingViewController_audioManager];
    v6 = objc_allocWithZone((Class)type metadata accessor for MicrophoneTestRecordingViewController());
    v7 = swift_retain(v5);
    v8 = sub_10000A1CC(v7);
    objc_msgSend(v4, "pushViewController:animated:", v8, 1);

  }
}

void sub_10000EC38(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  NSString v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSString v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  uint64_t v21;

  sub_100014D00(0xD000000000000018, (void *)0x80000001000177D0);
  v4 = v3;
  sub_100014D00(0xD000000000000018, (void *)0x80000001000177F0);
  v6 = v5;
  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  v9 = objc_msgSend((id)objc_opt_self(UIAlertController), "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);

  sub_100014D00(20302, (void *)0xE200000000000000);
  v11 = v10;
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  v13 = (void *)objc_opt_self(UIAlertAction);
  v14 = objc_msgSend(v13, "actionWithTitle:style:handler:", v12, 0, 0);

  objc_msgSend(v9, "addAction:", v14);
  sub_100014D00(5457241, (void *)0xE300000000000000);
  v16 = v15;
  v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v16);
  v20[4] = sub_10000EE6C;
  v21 = 0;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 1107296256;
  v20[2] = sub_10000AD18;
  v20[3] = &unk_10001D380;
  v18 = _Block_copy(v20);
  swift_release(v21);
  v19 = objc_msgSend(v13, "actionWithTitle:style:handler:", v17, 1, v18);
  _Block_release(v18);

  objc_msgSend(v9, "addAction:", v19);
  objc_msgSend(a2, "presentViewController:animated:completion:", v9, 1, 0);

}

void sub_10000EE6C()
{
  unint64_t v0;
  uint64_t Strong;
  id v2;

  v0 = sub_100014E58((uint64_t)_swiftEmptyArrayStorage);
  if (qword_1000216F8 != -1)
    swift_once(&qword_1000216F8, sub_100014F9C);
  Strong = swift_unknownObjectWeakLoadStrong(qword_1000225D8 + 16);
  if (Strong)
  {
    v2 = (id)Strong;
    sub_100015550(-900, v0);
    swift_bridgeObjectRelease(v0);

  }
  else
  {
    swift_bridgeObjectRelease(v0);
  }
}

id sub_10000EFA0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MicrophoneTestStartingViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MicrophoneTestStartingViewController()
{
  return objc_opt_self(_TtC15Diagnostic_600436MicrophoneTestStartingViewController);
}

uint64_t sub_10000F000()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_10000F024(int a1)
{
  uint64_t v1;

  sub_10000EB88(a1, *(char **)(v1 + 16));
}

void sub_10000F02C(uint64_t a1)
{
  uint64_t v1;

  sub_10000EC38(a1, *(void **)(v1 + 16));
}

uint64_t sub_10000F034(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000F044(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000F050()
{
  uint64_t result;

  sub_10000AC90(0, (unint64_t *)&qword_100021C08, OS_os_log_ptr);
  result = OS_os_log.init(subsystem:category:)(0xD000000000000015, 0x8000000100017980, 0x6F68706F7263694DLL, 0xEE0074736554656ELL);
  qword_1000225B8 = result;
  return result;
}

uint64_t sub_10000F0C8()
{
  return sub_10000F154((uint64_t)&unk_100019028, (uint64_t)&unk_100019050);
}

uint64_t sub_10000F0DC()
{
  return sub_10000F154((uint64_t)&unk_100018F98, (uint64_t)&unk_100018FC0);
}

uint64_t sub_10000F0F0()
{
  return sub_10000F154((uint64_t)&unk_100019070, (uint64_t)&unk_100019098);
}

uint64_t sub_10000F104()
{
  return sub_10000F154((uint64_t)&unk_100018FE0, (uint64_t)&unk_100019008);
}

uint64_t sub_10000F118()
{
  return sub_10000F154((uint64_t)&unk_100018F50, (uint64_t)&unk_100018F78);
}

uint64_t sub_10000F12C()
{
  return sub_10000F154((uint64_t)&unk_100018F08, (uint64_t)&unk_100018F30);
}

uint64_t sub_10000F140()
{
  return sub_10000F154((uint64_t)&unk_1000190B8, (uint64_t)&unk_1000190E0);
}

uint64_t sub_10000F154(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t KeyPath;
  uint64_t v7;

  v4 = ((uint64_t (*)(void))swift_getKeyPath)();
  KeyPath = swift_getKeyPath(a2);
  static Published.subscript.getter(&v7, v2, v4, KeyPath);
  swift_release(v4);
  swift_release(KeyPath);
  return v7;
}

uint64_t sub_10000F1BC()
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
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(uint64_t, char *, uint64_t);
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
  void (*v31)(char *, uint64_t, uint64_t);
  char *v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  double v40;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;

  v1 = v0;
  v2 = type metadata accessor for URL(0);
  v51 = *(_QWORD *)(v2 - 8);
  v52 = v2;
  __chkstk_darwin(v2);
  v50 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency(0);
  v48 = *(_QWORD *)(v4 - 8);
  v49 = v4;
  __chkstk_darwin(v4);
  v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for OS_dispatch_queue.Attributes(0);
  __chkstk_darwin(v7);
  v9 = (char *)&v42 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for DispatchQoS(0);
  __chkstk_darwin(v10);
  v12 = (char *)&v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100008128(&qword_100021FF0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = v1 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__stopRecordingCompleted;
  LOBYTE(v53) = 0;
  Published.init(initialValue:)(&v53, &type metadata for Bool);
  v18 = *(void (**)(uint64_t, char *, uint64_t))(v14 + 32);
  v18(v17, v16, v13);
  v19 = v1 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__audioPlaybackCompleted;
  LOBYTE(v53) = 0;
  Published.init(initialValue:)(&v53, &type metadata for Bool);
  v18(v19, v16, v13);
  v20 = v1 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__audioStartRecordingFailed;
  LOBYTE(v53) = 0;
  Published.init(initialValue:)(&v53, &type metadata for Bool);
  v18(v20, v16, v13);
  v21 = v1 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__audioStopRecordingFailed;
  LOBYTE(v53) = 0;
  Published.init(initialValue:)(&v53, &type metadata for Bool);
  v18(v21, v16, v13);
  v22 = v1 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__audioPlaybackFailed;
  LOBYTE(v53) = 0;
  Published.init(initialValue:)(&v53, &type metadata for Bool);
  v18(v22, v16, v13);
  v23 = v1 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__createAudioFileFailed;
  LOBYTE(v53) = 0;
  Published.init(initialValue:)(&v53, &type metadata for Bool);
  v18(v23, v16, v13);
  v24 = v1 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__readAudioFileFailed;
  LOBYTE(v53) = 0;
  Published.init(initialValue:)(&v53, &type metadata for Bool);
  v18(v24, v16, v13);
  v47 = OBJC_IVAR____TtC15Diagnostic_600412AudioManager_audioInputQueue;
  v46 = sub_10000AC90(0, &qword_100021FF8, OS_dispatch_queue_ptr);
  v25 = v12;
  static DispatchQoS.unspecified.getter(v46);
  v53 = _swiftEmptyArrayStorage;
  v26 = sub_1000124AC(&qword_100022000, (uint64_t (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes, (uint64_t)&protocol conformance descriptor for OS_dispatch_queue.Attributes);
  v44 = v26;
  v27 = sub_100008128(&qword_100022008);
  v43 = v27;
  v45 = sub_1000124EC(&qword_100022010, &qword_100022008);
  v28 = v9;
  v29 = v7;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v53, v27, v45, v7, v26);
  v30 = enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:);
  v31 = *(void (**)(char *, uint64_t, uint64_t))(v48 + 104);
  v32 = v6;
  v33 = v6;
  v34 = v49;
  v31(v33, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v49);
  v35 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD00000000000002CLL, 0x80000001000179A0, v25, v28, v32, 0);
  *(_QWORD *)(v1 + v47) = v35;
  v48 = OBJC_IVAR____TtC15Diagnostic_600412AudioManager_audioOutputQueue;
  static DispatchQoS.unspecified.getter(v35);
  v53 = _swiftEmptyArrayStorage;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v53, v43, v45, v29, v44);
  v31(v32, v30, v34);
  v36 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)(0xD00000000000002DLL, 0x80000001000179D0, v25, v28, v32, 0);
  *(_QWORD *)(v1 + v48) = v36;
  v37 = OBJC_IVAR____TtC15Diagnostic_600412AudioManager_audioDeviceTest;
  *(_QWORD *)(v1 + v37) = objc_msgSend(objc_allocWithZone((Class)AVAudioDeviceTest), "init");
  v38 = v50;
  URL.init(fileURLWithPath:)(0xD000000000000011, 0x8000000100017A00);
  URL.appendingPathComponent(_:isDirectory:)(0xD00000000000002CLL, 0x8000000100017A20, 1);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v38, v52);
  v39 = OBJC_IVAR____TtC15Diagnostic_600412AudioManager_sequence;
  *(_QWORD *)(v1 + v39) = objc_msgSend(objc_allocWithZone((Class)AVAudioDeviceTestSequence), "init");
  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager_audioDeviceTest), "setProcessSequenceAsynchronously:", 1);
  objc_msgSend(*(id *)(v1 + v39), "setOutputMode:", 0);
  objc_msgSend(*(id *)(v1 + v39), "setPriority:", 0);
  LODWORD(v40) = 1.0;
  objc_msgSend(*(id *)(v1 + v39), "setVolume:", v40);
  objc_msgSend(*(id *)(v1 + v39), "setNumberOfChannels:", 4);
  return v1;
}

uint64_t sub_10000F738()
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
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  _QWORD aBlock[5];
  uint64_t v20;

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v18 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin();
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for DispatchQoS(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000AC90(0, &qword_100021FF8, OS_dispatch_queue_ptr);
  v9 = (void *)static OS_dispatch_queue.main.getter();
  aBlock[4] = sub_100012A78;
  v20 = v0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000FB1C;
  aBlock[3] = &unk_10001D650;
  v10 = _Block_copy(aBlock);
  v11 = v20;
  swift_retain(v1);
  v12 = swift_release(v11);
  static DispatchQoS.unspecified.getter(v12);
  aBlock[0] = &_swiftEmptyArrayStorage;
  v13 = sub_1000124AC(&qword_100022020, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v14 = sub_100008128(&qword_100022028);
  v15 = sub_1000124EC(&qword_100022030, &qword_100022028);
  dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v14, v15, v2, v13);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v8, v4, v10);
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v18 + 8))(v4, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_10000F930(uint64_t a1)
{
  uint64_t KeyPath;
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
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;

  KeyPath = swift_getKeyPath(&unk_100019028);
  v3 = swift_getKeyPath(&unk_100019050);
  v23 = 0;
  swift_retain(a1);
  static Published.subscript.setter(&v23, a1, KeyPath, v3);
  v4 = swift_getKeyPath(&unk_100018F98);
  v5 = swift_getKeyPath(&unk_100018FC0);
  v22 = 0;
  swift_retain(a1);
  static Published.subscript.setter(&v22, a1, v4, v5);
  v6 = swift_getKeyPath(&unk_100019070);
  v7 = swift_getKeyPath(&unk_100019098);
  v21 = 0;
  swift_retain(a1);
  static Published.subscript.setter(&v21, a1, v6, v7);
  v8 = swift_getKeyPath(&unk_100018FE0);
  v9 = swift_getKeyPath(&unk_100019008);
  v20 = 0;
  swift_retain(a1);
  static Published.subscript.setter(&v20, a1, v8, v9);
  v10 = swift_getKeyPath(&unk_100018F50);
  v11 = swift_getKeyPath(&unk_100018F78);
  v19 = 0;
  swift_retain(a1);
  static Published.subscript.setter(&v19, a1, v10, v11);
  v12 = swift_getKeyPath(&unk_100018F08);
  v13 = swift_getKeyPath(&unk_100018F30);
  v18 = 0;
  swift_retain(a1);
  static Published.subscript.setter(&v18, a1, v12, v13);
  v14 = swift_getKeyPath(&unk_1000190B8);
  v15 = swift_getKeyPath(&unk_1000190E0);
  v17 = 0;
  swift_retain(a1);
  return static Published.subscript.setter(&v17, a1, v14, v15);
}

uint64_t sub_10000FB20()
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
  char *v12;
  uint64_t (*v13)(char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  NSString v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  _QWORD *v32;
  void *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  _QWORD aBlock[5];
  _QWORD *v52;

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v48 = *(_QWORD *)(v2 - 8);
  v49 = v2;
  __chkstk_darwin(v2);
  v47 = (char *)&v43 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for DispatchQoS(0);
  v45 = *(_QWORD *)(v4 - 8);
  v46 = v4;
  __chkstk_darwin(v4);
  v44 = (char *)&v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = (char *)&v43 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v43 - v11;
  sub_1000119D4();
  URL.appendingPathComponent(_:)(0xD000000000000018, 0x8000000100017B10);
  URL.appendingPathExtension(_:)(6709603, 0xE300000000000000);
  v13 = *(uint64_t (**)(char *, uint64_t))(v7 + 8);
  v14 = v13(v10, v6);
  v15 = URL.path.getter(v14);
  v17 = v16;
  v13(v12, v6);
  v18 = OBJC_IVAR____TtC15Diagnostic_600412AudioManager_sequence;
  v19 = *(id *)(v1 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager_sequence);
  v20 = String._bridgeToObjectiveC()();
  objc_msgSend(v19, "setMicrophone:", v20);

  v22 = static os_log_type_t.default.getter(v21);
  if (qword_1000216E8 != -1)
    swift_once(&qword_1000216E8, sub_10000F050);
  v23 = qword_1000225B8;
  v24 = sub_100008128(&qword_100021BF8);
  v25 = swift_allocObject(v24, 112, 7);
  *(_OWORD *)(v25 + 16) = xmmword_100018EB0;
  v26 = *(id *)(v1 + v18);
  v27 = objc_msgSend(v26, "description");
  v28 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v30 = v29;

  *(_QWORD *)(v25 + 56) = &type metadata for String;
  v31 = sub_10000E044();
  *(_QWORD *)(v25 + 32) = v28;
  *(_QWORD *)(v25 + 40) = v30;
  *(_QWORD *)(v25 + 96) = &type metadata for String;
  *(_QWORD *)(v25 + 104) = v31;
  *(_QWORD *)(v25 + 64) = v31;
  *(_QWORD *)(v25 + 72) = v15;
  *(_QWORD *)(v25 + 80) = v17;
  swift_bridgeObjectRetain(v17);
  os_log(_:dso:log:_:_:)(v22, &_mh_execute_header, v23, "Recording audio with sequence: %@, urlPath: %@", 46, 2, v25);
  swift_bridgeObjectRelease(v25);
  v32 = (_QWORD *)swift_allocObject(&unk_10001D598, 40, 7);
  v32[2] = v1;
  v32[3] = v15;
  v32[4] = v17;
  aBlock[4] = sub_1000129C0;
  v52 = v32;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000FB1C;
  aBlock[3] = &unk_10001D5B0;
  v33 = _Block_copy(aBlock);
  v34 = swift_retain(v1);
  v35 = v44;
  static DispatchQoS.unspecified.getter(v34);
  v50 = &_swiftEmptyArrayStorage;
  v36 = sub_1000124AC(&qword_100022020, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v37 = sub_100008128(&qword_100022028);
  v38 = sub_1000124EC(&qword_100022030, &qword_100022028);
  v39 = v47;
  v40 = v37;
  v41 = v49;
  dispatch thunk of SetAlgebra.init<A>(_:)(&v50, v40, v38, v49, v36);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v35, v39, v33);
  _Block_release(v33);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v39, v41);
  (*(void (**)(char *, uint64_t))(v45 + 8))(v35, v46);
  return swift_release(v52);
}

void sub_10000FF1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  id v7;
  NSString v8;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  _QWORD v12[5];
  _QWORD *v13;

  v6 = *(void **)(a1 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager_audioDeviceTest);
  v7 = *(id *)(a1 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager_sequence);
  v8 = String._bridgeToObjectiveC()();
  v9 = (_QWORD *)swift_allocObject(&unk_10001D5E8, 40, 7);
  v9[2] = a1;
  v9[3] = a2;
  v9[4] = a3;
  v12[4] = sub_1000129FC;
  v13 = v9;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 1107296256;
  v12[2] = sub_1000103EC;
  v12[3] = &unk_10001D600;
  v10 = _Block_copy(v12);
  v11 = v13;
  swift_retain(a1);
  swift_bridgeObjectRetain(a3);
  swift_release(v11);
  objc_msgSend(v6, "startRecording:filePath:completion:", v7, v8, v10);
  _Block_release(v10);

}

uint64_t sub_100010038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD aBlock[5];
  uint64_t v43;

  v8 = type metadata accessor for DispatchWorkItemFlags(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for DispatchQoS(0);
  v13 = __chkstk_darwin(v12);
  v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v39 = v14;
    v40 = v13;
    v41 = v9;
    v17 = swift_errorRetain(a1);
    v18 = static os_log_type_t.error.getter(v17);
    if (qword_1000216E8 != -1)
      swift_once(&qword_1000216E8, sub_10000F050);
    v19 = qword_1000225B8;
    v20 = sub_100008128(&qword_100021BF8);
    v21 = swift_allocObject(v20, 72, 7);
    *(_OWORD *)(v21 + 16) = xmmword_100018E50;
    aBlock[0] = a1;
    swift_errorRetain(a1);
    v22 = sub_100008128(&qword_100022018);
    v23 = String.init<A>(describing:)(aBlock, v22);
    v25 = v24;
    *(_QWORD *)(v21 + 56) = &type metadata for String;
    *(_QWORD *)(v21 + 64) = sub_10000E044();
    *(_QWORD *)(v21 + 32) = v23;
    *(_QWORD *)(v21 + 40) = v25;
    os_log(_:dso:log:_:_:)(v18, &_mh_execute_header, v19, "Error recording: %@", 19, 2, v21);
    swift_bridgeObjectRelease(v21);
    sub_10000AC90(0, &qword_100021FF8, OS_dispatch_queue_ptr);
    v26 = (void *)static OS_dispatch_queue.main.getter();
    aBlock[4] = sub_100012A08;
    v43 = a2;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000FB1C;
    aBlock[3] = &unk_10001D628;
    v27 = _Block_copy(aBlock);
    v28 = v43;
    swift_retain(a2);
    v29 = swift_release(v28);
    static DispatchQoS.unspecified.getter(v29);
    aBlock[0] = &_swiftEmptyArrayStorage;
    v30 = sub_1000124AC(&qword_100022020, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v31 = sub_100008128(&qword_100022028);
    v32 = sub_1000124EC(&qword_100022030, &qword_100022028);
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v31, v32, v8, v30);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v16, v11, v27);
    _Block_release(v27);

    swift_errorRelease(a1);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v11, v8);
    return (*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v16, v40);
  }
  else
  {
    v34 = static os_log_type_t.default.getter(v13);
    if (qword_1000216E8 != -1)
      swift_once(&qword_1000216E8, sub_10000F050);
    v35 = qword_1000225B8;
    v36 = sub_100008128(&qword_100021BF8);
    v37 = swift_allocObject(v36, 72, 7);
    *(_OWORD *)(v37 + 16) = xmmword_100018E50;
    *(_QWORD *)(v37 + 56) = &type metadata for String;
    *(_QWORD *)(v37 + 64) = sub_10000E044();
    *(_QWORD *)(v37 + 32) = a3;
    *(_QWORD *)(v37 + 40) = a4;
    swift_bridgeObjectRetain(a4);
    os_log(_:dso:log:_:_:)(v34, &_mh_execute_header, v35, "Started recording to %@", 23, 2, v37);
    return swift_bridgeObjectRelease(v37);
  }
}

void sub_1000103EC(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void *);
  id v5;

  v4 = *(void (**)(void *))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4(a2);
  swift_release(v3);

}

uint64_t sub_100010440(uint64_t a1)
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

uint64_t sub_10001046C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  void *v19;
  _QWORD aBlock[5];
  uint64_t v21;

  v1 = type metadata accessor for DispatchWorkItemFlags(0);
  v18 = *(_QWORD *)(v1 - 8);
  __chkstk_darwin(v1);
  v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for DispatchQoS(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = static os_log_type_t.default.getter(v6);
  if (qword_1000216E8 != -1)
    swift_once(&qword_1000216E8, sub_10000F050);
  os_log(_:dso:log:_:_:)(v9, &_mh_execute_header, qword_1000225B8, "Stopping recording!", 19, 2, v18);
  aBlock[4] = sub_1000128CC;
  v21 = v0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000FB1C;
  aBlock[3] = &unk_10001D4E8;
  v10 = _Block_copy(aBlock);
  v11 = swift_retain(v0);
  static DispatchQoS.unspecified.getter(v11);
  v19 = &_swiftEmptyArrayStorage;
  v12 = sub_1000124AC(&qword_100022020, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v13 = sub_100008128(&qword_100022028);
  v14 = sub_1000124EC(&qword_100022030, &qword_100022028);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v19, v13, v14, v1, v12);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v8, v3, v10);
  _Block_release(v10);
  (*(void (**)(char *, uint64_t))(v18 + 8))(v3, v1);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  v15 = swift_release(v21);
  v16 = static os_log_type_t.default.getter(v15);
  return os_log(_:dso:log:_:_:)(v16, &_mh_execute_header, qword_1000225B8, "Stopping recording finished", 27, 2, &_swiftEmptyArrayStorage);
}

void sub_1000106C8(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  uint64_t v6;

  v2 = *(void **)(a1 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager_audioDeviceTest);
  v5[4] = sub_1000128D4;
  v6 = a1;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256;
  v5[2] = sub_1000103EC;
  v5[3] = &unk_10001D510;
  v3 = _Block_copy(v5);
  v4 = v6;
  swift_retain(a1);
  swift_release(v4);
  objc_msgSend(v2, "stopRecording:", v3);
  _Block_release(v3);
}

uint64_t sub_100010774(void **a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v29;
  void *v30;
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
  void **aBlock;
  uint64_t v43;
  uint64_t (*v44)(uint64_t);
  void *v45;
  uint64_t (*v46)();
  uint64_t v47;

  v4 = type metadata accessor for DispatchWorkItemFlags(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for DispatchQoS(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v38 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = v9;
  if (a1)
  {
    v39 = v5;
    v40 = v8;
    v12 = swift_errorRetain(a1);
    v13 = static os_log_type_t.error.getter(v12);
    if (qword_1000216E8 != -1)
      swift_once(&qword_1000216E8, sub_10000F050);
    v14 = qword_1000225B8;
    v15 = sub_100008128(&qword_100021BF8);
    v16 = swift_allocObject(v15, 72, 7);
    *(_OWORD *)(v16 + 16) = xmmword_100018E50;
    aBlock = a1;
    swift_errorRetain(a1);
    v17 = sub_100008128(&qword_100022018);
    v18 = String.init<A>(describing:)(&aBlock, v17);
    v20 = v19;
    *(_QWORD *)(v16 + 56) = &type metadata for String;
    *(_QWORD *)(v16 + 64) = sub_10000E044();
    *(_QWORD *)(v16 + 32) = v18;
    *(_QWORD *)(v16 + 40) = v20;
    os_log(_:dso:log:_:_:)(v13, &_mh_execute_header, v14, "Error saving recording file: %@", 31, 2, v16);
    swift_bridgeObjectRelease(v16);
    sub_10000AC90(0, &qword_100021FF8, OS_dispatch_queue_ptr);
    v21 = (void *)static OS_dispatch_queue.main.getter();
    v46 = sub_100012904;
    v47 = a2;
    aBlock = _NSConcreteStackBlock;
    v43 = 1107296256;
    v44 = sub_10000FB1C;
    v45 = &unk_10001D560;
    v22 = _Block_copy(&aBlock);
    v23 = v47;
    swift_retain(a2);
    v24 = swift_release(v23);
    static DispatchQoS.unspecified.getter(v24);
    aBlock = (void **)&_swiftEmptyArrayStorage;
    v25 = sub_1000124AC(&qword_100022020, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v26 = sub_100008128(&qword_100022028);
    v27 = sub_1000124EC(&qword_100022030, &qword_100022028);
    dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v26, v27, v4, v25);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v11, v7, v22);
    _Block_release(v22);

    swift_errorRelease(a1);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v7, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v11, v40);
  }
  else
  {
    sub_10000AC90(0, &qword_100021FF8, OS_dispatch_queue_ptr);
    v29 = (void *)static OS_dispatch_queue.main.getter();
    v46 = sub_1000128DC;
    v47 = a2;
    aBlock = _NSConcreteStackBlock;
    v43 = 1107296256;
    v44 = sub_10000FB1C;
    v45 = &unk_10001D538;
    v30 = _Block_copy(&aBlock);
    v31 = v47;
    swift_retain(a2);
    v32 = swift_release(v31);
    static DispatchQoS.unspecified.getter(v32);
    aBlock = (void **)&_swiftEmptyArrayStorage;
    v33 = sub_1000124AC(&qword_100022020, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v34 = sub_100008128(&qword_100022028);
    v35 = sub_1000124EC(&qword_100022030, &qword_100022028);
    dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v34, v35, v4, v33);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v11, v7, v30);
    _Block_release(v30);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v36 = (*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v11, v8);
    v37 = static os_log_type_t.info.getter(v36);
    if (qword_1000216E8 != -1)
      swift_once(&qword_1000216E8, sub_10000F050);
    return os_log(_:dso:log:_:_:)(v37, &_mh_execute_header, qword_1000225B8, "Stop Recording is Completed", 27, 2, &_swiftEmptyArrayStorage);
  }
}

uint64_t sub_100010BF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  void *v21;
  _QWORD aBlock[5];
  _QWORD *v23;

  v5 = type metadata accessor for DispatchWorkItemFlags(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *(_QWORD *)(v2 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager_audioOutputQueue);
  v13 = (_QWORD *)swift_allocObject(&unk_10001D430, 40, 7);
  v13[2] = v2;
  v13[3] = a1;
  v13[4] = a2;
  aBlock[4] = sub_1000126AC;
  v23 = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000FB1C;
  aBlock[3] = &unk_10001D448;
  v14 = _Block_copy(aBlock);
  swift_retain(v2);
  v15 = swift_bridgeObjectRetain(a2);
  static DispatchQoS.unspecified.getter(v15);
  v21 = &_swiftEmptyArrayStorage;
  v16 = sub_1000124AC(&qword_100022020, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v17 = sub_100008128(&qword_100022028);
  v18 = sub_1000124EC(&qword_100022030, &qword_100022028);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v21, v17, v18, v5, v16);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v12, v8, v14);
  _Block_release(v14);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return swift_release(v23);
}

void sub_100010DF8(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  _BYTE *v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  NSString v21;
  id v22;
  void (*v23)(_BYTE *, uint64_t);
  NSURL *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  _BYTE v48[12];
  unsigned int v49;
  void (*v50)(_BYTE *, uint64_t);
  id v51;
  _QWORD aBlock[5];
  uint64_t v53;
  Swift::String v54;

  v6 = type metadata accessor for URL(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = __chkstk_darwin(v6);
  v10 = &v48[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = __chkstk_darwin(v8);
  v13 = &v48[-v12];
  __chkstk_darwin(v11);
  v15 = &v48[-v14];
  v16 = *(void **)(a1 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager_audioDeviceTest);
  objc_msgSend(v16, "stopPlayback");
  v17 = OBJC_IVAR____TtC15Diagnostic_600412AudioManager_sequence;
  objc_msgSend(*(id *)(a1 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager_sequence), "setOutputMode:", 1);
  swift_bridgeObjectRetain(a3);
  v54._countAndFlagsBits = a2;
  v54._object = a3;
  v18 = sub_10001279C(v54);
  if (v18 == 5)
  {
    v19 = static os_log_type_t.error.getter(v18);
    if (qword_1000216E8 != -1)
      swift_once(&qword_1000216E8, sub_10000F050);
    os_log(_:dso:log:_:_:)(v19, &_mh_execute_header, qword_1000225B8, "Playback microphone name is invalid", 35, 2, &_swiftEmptyArrayStorage);
  }
  else
  {
    v51 = v16;
    v20 = *(id *)(a1 + v17);
    v21 = String._bridgeToObjectiveC()();
    objc_msgSend(v20, "setMicrophone:", v21);

    v22 = *(id *)(a1 + v17);
    URL.appendingPathComponent(_:)(0xD000000000000018, 0x8000000100017B10);
    URL.appendingPathExtension(_:)(6709603, 0xE300000000000000);
    v23 = *(void (**)(_BYTE *, uint64_t))(v7 + 8);
    v23(v13, v6);
    URL._bridgeToObjectiveC()(v24);
    v26 = v25;
    v50 = v23;
    v23(v15, v6);
    objc_msgSend(v22, "setStimulusURL:", v26);

    v49 = static os_log_type_t.default.getter(v27);
    if (qword_1000216E8 != -1)
      swift_once(&qword_1000216E8, sub_10000F050);
    v28 = qword_1000225B8;
    v29 = sub_100008128(&qword_100021BF8);
    v30 = swift_allocObject(v29, 112, 7);
    *(_OWORD *)(v30 + 16) = xmmword_100018EB0;
    v31 = objc_msgSend(*(id *)(a1 + v17), "microphone");
    if (v31)
    {
      v32 = v31;
      v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      v35 = v34;

    }
    else
    {
      v33 = 0;
      v35 = 0;
    }
    *(_QWORD *)(v30 + 56) = &type metadata for String;
    v36 = sub_10000E044();
    *(_QWORD *)(v30 + 64) = v36;
    v37 = 0xD000000000000010;
    if (v35)
      v37 = v33;
    v38 = 0x8000000100017B30;
    if (v35)
      v38 = v35;
    *(_QWORD *)(v30 + 32) = v37;
    *(_QWORD *)(v30 + 40) = v38;
    v39 = objc_msgSend(*(id *)(a1 + v17), "stimulusURL");
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v41 = URL.absoluteString.getter(v40);
    v43 = v42;
    v50(v10, v6);
    *(_QWORD *)(v30 + 96) = &type metadata for String;
    *(_QWORD *)(v30 + 104) = v36;
    *(_QWORD *)(v30 + 72) = v41;
    *(_QWORD *)(v30 + 80) = v43;
    os_log(_:dso:log:_:_:)(v49, &_mh_execute_header, v28, "Playing audio with microphone: %@, StimulusURL: %@", 50, 2, v30);
    swift_bridgeObjectRelease(v30);
    v44 = *(void **)(a1 + v17);
    aBlock[4] = sub_1000127E4;
    v53 = a1;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000103EC;
    aBlock[3] = &unk_10001D470;
    v45 = _Block_copy(aBlock);
    v46 = v53;
    v47 = v44;
    swift_retain(a1);
    swift_release(v46);
    objc_msgSend(v51, "playback:filePath:completion:", v47, 0, v45);
    _Block_release(v45);

  }
}

uint64_t sub_100011248(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  void **v17;
  char *v18;
  void **v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  void **v58;
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void **aBlock;
  uint64_t v67;
  uint64_t (*v68)(uint64_t);
  void *v69;
  uint64_t (*v70)();
  uint64_t v71;

  v3 = type metadata accessor for URL(0);
  v63 = *(_QWORD *)(v3 - 8);
  v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  v6 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v56 - v7;
  v9 = type metadata accessor for DispatchWorkItemFlags(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v56 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for DispatchQoS(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = __chkstk_darwin(v13);
  v18 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = v10;
  v65 = v15;
  if (v17)
  {
    v59 = (char *)&v56 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    v60 = v14;
    v61 = v12;
    v62 = v9;
    v19 = v17;
    v20 = swift_errorRetain(v17);
    v21 = static os_log_type_t.error.getter(v20);
    if (qword_1000216E8 != -1)
      swift_once(&qword_1000216E8, sub_10000F050);
    v57 = qword_1000225B8;
    v22 = sub_100008128(&qword_100021BF8);
    v23 = swift_allocObject(v22, 112, 7);
    *(_OWORD *)(v23 + 16) = xmmword_100018EB0;
    aBlock = v19;
    swift_errorRetain(v19);
    v24 = sub_100008128(&qword_100022018);
    v25 = String.init<A>(describing:)(&aBlock, v24);
    v58 = v19;
    v27 = v26;
    *(_QWORD *)(v23 + 56) = &type metadata for String;
    v28 = sub_10000E044();
    *(_QWORD *)(v23 + 64) = v28;
    *(_QWORD *)(v23 + 32) = v25;
    *(_QWORD *)(v23 + 40) = v27;
    v29 = a2;
    URL.appendingPathComponent(_:)(0xD000000000000018, 0x8000000100017B10);
    URL.appendingPathExtension(_:)(6709603, 0xE300000000000000);
    v30 = *(uint64_t (**)(char *, uint64_t))(v63 + 8);
    v31 = v30(v6, v3);
    v32 = URL.absoluteString.getter(v31);
    v34 = v33;
    v30(v8, v3);
    *(_QWORD *)(v23 + 96) = &type metadata for String;
    *(_QWORD *)(v23 + 104) = v28;
    *(_QWORD *)(v23 + 72) = v32;
    *(_QWORD *)(v23 + 80) = v34;
    os_log(_:dso:log:_:_:)(v21, &_mh_execute_header, v57, "Error reading recorded file: %@, file %@", 40, 2, v23);
    swift_bridgeObjectRelease(v23);
    sub_10000AC90(0, &qword_100021FF8, OS_dispatch_queue_ptr);
    v35 = (void *)static OS_dispatch_queue.main.getter();
    v70 = sub_100012814;
    v71 = v29;
    aBlock = _NSConcreteStackBlock;
    v67 = 1107296256;
    v68 = sub_10000FB1C;
    v69 = &unk_10001D4C0;
    v36 = _Block_copy(&aBlock);
    v37 = v71;
    swift_retain(v29);
    v38 = swift_release(v37);
    v39 = v59;
    static DispatchQoS.unspecified.getter(v38);
    aBlock = (void **)&_swiftEmptyArrayStorage;
    v40 = sub_1000124AC(&qword_100022020, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v41 = sub_100008128(&qword_100022028);
    v42 = sub_1000124EC(&qword_100022030, &qword_100022028);
    v44 = v61;
    v43 = v62;
    dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v41, v42, v62, v40);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v39, v44, v36);
    _Block_release(v36);

    (*(void (**)(char *, uint64_t))(v64 + 8))(v44, v43);
    (*(void (**)(char *, uint64_t))(v60 + 8))(v39, v65);
    sub_100011EA4();
    sub_10000F738();
    return swift_errorRelease(v58);
  }
  else
  {
    sub_10000AC90(0, &qword_100021FF8, OS_dispatch_queue_ptr);
    v46 = (void *)static OS_dispatch_queue.main.getter();
    v70 = sub_1000127EC;
    v71 = a2;
    aBlock = _NSConcreteStackBlock;
    v67 = 1107296256;
    v68 = sub_10000FB1C;
    v69 = &unk_10001D498;
    v47 = _Block_copy(&aBlock);
    v48 = v71;
    swift_retain(a2);
    v49 = swift_release(v48);
    static DispatchQoS.unspecified.getter(v49);
    aBlock = (void **)&_swiftEmptyArrayStorage;
    v50 = v12;
    v51 = sub_1000124AC(&qword_100022020, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v52 = sub_100008128(&qword_100022028);
    v53 = sub_1000124EC(&qword_100022030, &qword_100022028);
    dispatch thunk of SetAlgebra.init<A>(_:)(&aBlock, v52, v53, v9, v51);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v18, v50, v47);
    _Block_release(v47);

    (*(void (**)(char *, uint64_t))(v64 + 8))(v50, v9);
    v54 = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v18, v65);
    v55 = static os_log_type_t.info.getter(v54);
    if (qword_1000216E8 != -1)
      swift_once(&qword_1000216E8, sub_10000F050);
    return os_log(_:dso:log:_:_:)(v55, &_mh_execute_header, qword_1000225B8, "Playback is Completed", 21, 2, &_swiftEmptyArrayStorage);
  }
}

uint64_t sub_1000117E0()
{
  return sub_100011808((uint64_t)sub_100012670, (uint64_t)&unk_10001D3F8);
}

uint64_t sub_1000117F4()
{
  return sub_100011808((uint64_t)sub_100012664, (uint64_t)&unk_10001D3D0);
}

uint64_t sub_100011808(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  void *v20;
  _QWORD aBlock[5];
  uint64_t v22;

  v5 = type metadata accessor for DispatchWorkItemFlags(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for DispatchQoS(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = *(_QWORD *)(v2 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager_audioOutputQueue);
  aBlock[4] = a1;
  v22 = v2;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000FB1C;
  aBlock[3] = a2;
  v13 = _Block_copy(aBlock);
  v14 = swift_retain(v2);
  static DispatchQoS.unspecified.getter(v14);
  v20 = &_swiftEmptyArrayStorage;
  v15 = sub_1000124AC(&qword_100022020, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
  v16 = sub_100008128(&qword_100022028);
  v17 = sub_1000124EC(&qword_100022030, &qword_100022028);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v20, v16, v17, v5, v15);
  OS_dispatch_queue.async(group:qos:flags:execute:)(0, v12, v8, v13);
  _Block_release(v13);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return swift_release(v22);
}

uint64_t sub_1000119D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id aBlock[5];
  uint64_t v45;

  v1 = v0;
  v2 = type metadata accessor for DispatchWorkItemFlags(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for DispatchQoS(0);
  v43 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100011EA4();
  sub_10000F738();
  v9 = objc_msgSend((id)objc_opt_self(NSFileManager), "defaultManager");
  URL._bridgeToObjectiveC()((NSURL *)OBJC_IVAR____TtC15Diagnostic_600412AudioManager_audioFileFolderURL);
  v11 = v10;
  aBlock[0] = 0;
  v12 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 0, 0, aBlock);

  v13 = aBlock[0];
  if (v12)
  {
    v14 = static os_log_type_t.default.getter(aBlock[0]);
    if (qword_1000216E8 != -1)
      swift_once(&qword_1000216E8, sub_10000F050);
    v15 = qword_1000225B8;
    v16 = sub_100008128(&qword_100021BF8);
    v17 = swift_allocObject(v16, 72, 7);
    *(_OWORD *)(v17 + 16) = xmmword_100018E50;
    v18 = URL.path.getter();
    v20 = v19;
    *(_QWORD *)(v17 + 56) = &type metadata for String;
    *(_QWORD *)(v17 + 64) = sub_10000E044();
    *(_QWORD *)(v17 + 32) = v18;
    *(_QWORD *)(v17 + 40) = v20;
    os_log(_:dso:log:_:_:)(v14, &_mh_execute_header, v15, "Created directory: %@", 21, 2, v17);
    return swift_bridgeObjectRelease(v17);
  }
  else
  {
    v41 = v6;
    v42 = v3;
    v22 = aBlock[0];
    v23 = (void *)_convertNSErrorToError(_:)(v13);

    v24 = swift_willThrow();
    v25 = static os_log_type_t.error.getter(v24);
    if (qword_1000216E8 != -1)
      swift_once(&qword_1000216E8, sub_10000F050);
    v26 = qword_1000225B8;
    v27 = sub_100008128(&qword_100021BF8);
    v28 = swift_allocObject(v27, 72, 7);
    *(_OWORD *)(v28 + 16) = xmmword_100018E50;
    aBlock[0] = v23;
    swift_errorRetain(v23);
    v29 = sub_100008128(&qword_100022018);
    v30 = String.init<A>(describing:)(aBlock, v29);
    v32 = v31;
    *(_QWORD *)(v28 + 56) = &type metadata for String;
    *(_QWORD *)(v28 + 64) = sub_10000E044();
    *(_QWORD *)(v28 + 32) = v30;
    *(_QWORD *)(v28 + 40) = v32;
    os_log(_:dso:log:_:_:)(v25, &_mh_execute_header, v26, "Error creating directory: %@", 28, 2, v28);
    swift_bridgeObjectRelease(v28);
    sub_10000AC90(0, &qword_100021FF8, OS_dispatch_queue_ptr);
    v33 = (void *)static OS_dispatch_queue.main.getter();
    aBlock[4] = sub_10001246C;
    v45 = v1;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_10000FB1C;
    aBlock[3] = &unk_10001D3A8;
    v34 = _Block_copy(aBlock);
    v35 = v45;
    swift_retain(v1);
    v36 = swift_release(v35);
    static DispatchQoS.unspecified.getter(v36);
    aBlock[0] = &_swiftEmptyArrayStorage;
    v37 = sub_1000124AC(&qword_100022020, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v38 = sub_100008128(&qword_100022028);
    v39 = sub_1000124EC(&qword_100022030, &qword_100022028);
    dispatch thunk of SetAlgebra.init<A>(_:)(aBlock, v38, v39, v2, v37);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v8, v5, v34);
    _Block_release(v34);

    (*(void (**)(char *, uint64_t))(v42 + 8))(v5, v2);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v8, v41);
    sub_100011EA4();
    sub_10000F738();
    return swift_errorRelease(v23);
  }
}

uint64_t sub_100011E38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t KeyPath;
  uint64_t v6;
  char v8;

  KeyPath = swift_getKeyPath(a2);
  v6 = swift_getKeyPath(a3);
  v8 = 1;
  swift_retain(a1);
  return static Published.subscript.setter(&v8, a1, KeyPath, v6);
}

void sub_100011EA4()
{
  void *v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  id v5;
  NSURL *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
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
  id v30;

  v0 = (void *)objc_opt_self(NSFileManager);
  v1 = objc_msgSend(v0, "defaultManager");
  URL.path.getter();
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  LODWORD(v3) = objc_msgSend(v1, "fileExistsAtPath:", v4);

  if ((_DWORD)v3)
  {
    v5 = objc_msgSend(v0, "defaultManager");
    URL._bridgeToObjectiveC()(v6);
    v8 = v7;
    v30 = 0;
    v9 = objc_msgSend(v5, "removeItemAtURL:error:", v7, &v30);

    v10 = v30;
    if (v9)
    {
      v11 = static os_log_type_t.default.getter(v30);
      if (qword_1000216E8 != -1)
        swift_once(&qword_1000216E8, sub_10000F050);
      v12 = qword_1000225B8;
      v13 = sub_100008128(&qword_100021BF8);
      v14 = swift_allocObject(v13, 72, 7);
      *(_OWORD *)(v14 + 16) = xmmword_100018E50;
      v15 = URL.path.getter();
      v17 = v16;
      *(_QWORD *)(v14 + 56) = &type metadata for String;
      *(_QWORD *)(v14 + 64) = sub_10000E044();
      *(_QWORD *)(v14 + 32) = v15;
      *(_QWORD *)(v14 + 40) = v17;
      os_log(_:dso:log:_:_:)(v11, &_mh_execute_header, v12, "Deleted directory: %@", 21, 2, v14);
      swift_bridgeObjectRelease(v14);
    }
    else
    {
      v18 = v30;
      v19 = (void *)_convertNSErrorToError(_:)(v10);

      v20 = swift_willThrow();
      v21 = static os_log_type_t.error.getter(v20);
      if (qword_1000216E8 != -1)
        swift_once(&qword_1000216E8, sub_10000F050);
      v22 = qword_1000225B8;
      v23 = sub_100008128(&qword_100021BF8);
      v24 = swift_allocObject(v23, 72, 7);
      *(_OWORD *)(v24 + 16) = xmmword_100018E50;
      v30 = v19;
      swift_errorRetain(v19);
      v25 = sub_100008128(&qword_100022018);
      v26 = String.init<A>(describing:)(&v30, v25);
      v28 = v27;
      *(_QWORD *)(v24 + 56) = &type metadata for String;
      *(_QWORD *)(v24 + 64) = sub_10000E044();
      *(_QWORD *)(v24 + 32) = v26;
      *(_QWORD *)(v24 + 40) = v28;
      os_log(_:dso:log:_:_:)(v21, &_mh_execute_header, v22, "Error deleting directory: %@", 28, 2, v24);
      v29 = swift_bridgeObjectRelease(v24);
      sub_100011EA4(v29);
      sub_10000F738();
      swift_errorRelease(v19);
    }
  }
}

uint64_t sub_100012190()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;

  v1 = v0 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__stopRecordingCompleted;
  v2 = sub_100008128(&qword_100021FF0);
  v3 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8);
  v3(v1, v2);
  v3(v0 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__audioPlaybackCompleted, v2);
  v3(v0 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__audioStartRecordingFailed, v2);
  v3(v0 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__audioStopRecordingFailed, v2);
  v3(v0 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__audioPlaybackFailed, v2);
  v3(v0 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__createAudioFileFailed, v2);
  v3(v0 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager__readAudioFileFailed, v2);

  v4 = v0 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager_audioFileFolderURL;
  v5 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);

  return v0;
}

uint64_t sub_1000122C4()
{
  uint64_t v0;

  sub_100012190();
  return swift_deallocClassInstance(v0, *(unsigned int *)(*(_QWORD *)v0 + 48), *(unsigned __int16 *)(*(_QWORD *)v0 + 52));
}

uint64_t sub_1000122E8()
{
  return type metadata accessor for AudioManager(0);
}

uint64_t type metadata accessor for AudioManager(uint64_t a1)
{
  uint64_t result;

  result = qword_100021D50;
  if (!qword_100021D50)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for AudioManager);
  return result;
}

void sub_10001232C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[12];

  sub_1000123D0();
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    v6[1] = v6[0];
    v6[2] = v6[0];
    v6[3] = v6[0];
    v6[4] = v6[0];
    v6[5] = v6[0];
    v6[6] = v6[0];
    v6[7] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v6[8] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v6[9] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4 = type metadata accessor for URL(319);
    if (v5 <= 0x3F)
    {
      v6[10] = *(_QWORD *)(v4 - 8) + 64;
      v6[11] = (char *)&value witness table for Builtin.UnknownObject + 64;
      swift_updateClassMetadata2(a1, 256, 12, v6, a1 + 80);
    }
  }
}

void sub_1000123D0()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_100021D60)
  {
    v0 = type metadata accessor for Published(0, &type metadata for Bool);
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_100021D60);
  }
}

void *sub_100012424()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_100012430@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;

  v4 = type metadata accessor for AudioManager(0);
  result = ObservableObject<>.objectWillChange.getter(v4, a1);
  *a2 = result;
  return result;
}

uint64_t sub_10001246C()
{
  uint64_t v0;

  return sub_100011E38(v0, (uint64_t)&unk_100018F08, (uint64_t)&unk_100018F30);
}

uint64_t sub_100012494(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_1000124A4(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_1000124AC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

uint64_t sub_1000124EC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = sub_100008C48(a2);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001252C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_1000126B8(a1, (uint64_t)&unk_100019028, (uint64_t)&unk_100019050, a2);
}

uint64_t sub_100012540(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_100012730(a1, a2, a3, a4, (uint64_t)&unk_100019028, (uint64_t)&unk_100019050);
}

uint64_t sub_100012554@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_1000126B8(a1, (uint64_t)&unk_100018F98, (uint64_t)&unk_100018FC0, a2);
}

uint64_t sub_100012568(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_100012730(a1, a2, a3, a4, (uint64_t)&unk_100018F98, (uint64_t)&unk_100018FC0);
}

uint64_t sub_10001257C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_1000126B8(a1, (uint64_t)&unk_100019070, (uint64_t)&unk_100019098, a2);
}

uint64_t sub_100012590(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_100012730(a1, a2, a3, a4, (uint64_t)&unk_100019070, (uint64_t)&unk_100019098);
}

uint64_t sub_1000125A4@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_1000126B8(a1, (uint64_t)&unk_100018FE0, (uint64_t)&unk_100019008, a2);
}

uint64_t sub_1000125B8(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_100012730(a1, a2, a3, a4, (uint64_t)&unk_100018FE0, (uint64_t)&unk_100019008);
}

uint64_t sub_1000125CC@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_1000126B8(a1, (uint64_t)&unk_100018F50, (uint64_t)&unk_100018F78, a2);
}

uint64_t sub_1000125E0(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_100012730(a1, a2, a3, a4, (uint64_t)&unk_100018F50, (uint64_t)&unk_100018F78);
}

uint64_t sub_1000125F4@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_1000126B8(a1, (uint64_t)&unk_100018F08, (uint64_t)&unk_100018F30, a2);
}

uint64_t sub_100012608@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_1000126B8(a1, (uint64_t)&unk_100018F08, (uint64_t)&unk_100018F30, a2);
}

uint64_t sub_10001262C(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_100012730(a1, a2, a3, a4, (uint64_t)&unk_100018F08, (uint64_t)&unk_100018F30);
}

uint64_t sub_100012640(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_100012730(a1, a2, a3, a4, (uint64_t)&unk_100018F08, (uint64_t)&unk_100018F30);
}

uint64_t sub_100012664()
{
  return sub_10001267C((SEL *)&selRef_cancel);
}

uint64_t sub_100012670()
{
  return sub_10001267C((SEL *)&selRef_stopPlayback);
}

uint64_t sub_10001267C(SEL *a1)
{
  uint64_t v1;

  objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC15Diagnostic_600412AudioManager_audioDeviceTest), *a1);
  sub_100011EA4();
  return sub_10000F738();
}

void sub_1000126AC()
{
  uint64_t v0;

  sub_100010DF8(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_1000126B8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X4>, _BYTE *a4@<X8>)
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
  swift_release(KeyPath);
  result = swift_release(v8);
  *a4 = v10;
  return result;
}

uint64_t sub_100012730(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v7;
  uint64_t v8;
  uint64_t KeyPath;
  uint64_t v10;
  char v12;

  v7 = *a1;
  v8 = *a2;
  KeyPath = swift_getKeyPath(a5);
  v10 = swift_getKeyPath(a6);
  v12 = v7;
  swift_retain(v8);
  return static Published.subscript.setter(&v12, v8, KeyPath, v10);
}

unint64_t sub_10001279C(Swift::String string)
{
  void *object;
  Swift::String v2;
  unint64_t v3;

  object = string._object;
  v2._countAndFlagsBits = string._countAndFlagsBits;
  v2._object = object;
  v3 = _findStringSwitchCase(cases:string:)((Swift::OpaquePointer)&off_10001CA20, v2);
  swift_bridgeObjectRelease(object);
  if (v3 >= 5)
    return 5;
  else
    return v3;
}

uint64_t sub_1000127E4(uint64_t a1)
{
  uint64_t v1;

  return sub_100011248(a1, v1);
}

uint64_t sub_1000127EC()
{
  uint64_t v0;

  return sub_100011E38(v0, (uint64_t)&unk_100018F98, (uint64_t)&unk_100018FC0);
}

uint64_t sub_100012814()
{
  uint64_t v0;

  return sub_100011E38(v0, (uint64_t)&unk_100018F50, (uint64_t)&unk_100018F78);
}

uint64_t sub_10001283C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_1000126B8(a1, (uint64_t)&unk_100018F50, (uint64_t)&unk_100018F78, a2);
}

uint64_t sub_100012860(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_100012730(a1, a2, a3, a4, (uint64_t)&unk_100018F50, (uint64_t)&unk_100018F78);
}

uint64_t sub_100012884@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_1000126B8(a1, (uint64_t)&unk_100018F98, (uint64_t)&unk_100018FC0, a2);
}

uint64_t sub_1000128A8(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_100012730(a1, a2, a3, a4, (uint64_t)&unk_100018F98, (uint64_t)&unk_100018FC0);
}

void sub_1000128CC()
{
  uint64_t v0;

  sub_1000106C8(v0);
}

uint64_t sub_1000128D4(void **a1)
{
  uint64_t v1;

  return sub_100010774(a1, v1);
}

uint64_t sub_1000128DC()
{
  uint64_t v0;

  return sub_100011E38(v0, (uint64_t)&unk_100019028, (uint64_t)&unk_100019050);
}

uint64_t sub_100012904()
{
  uint64_t v0;

  return sub_100011E38(v0, (uint64_t)&unk_100018FE0, (uint64_t)&unk_100019008);
}

uint64_t sub_10001292C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_1000126B8(a1, (uint64_t)&unk_100018FE0, (uint64_t)&unk_100019008, a2);
}

uint64_t sub_100012950(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_100012730(a1, a2, a3, a4, (uint64_t)&unk_100018FE0, (uint64_t)&unk_100019008);
}

uint64_t sub_100012974@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_1000126B8(a1, (uint64_t)&unk_100019028, (uint64_t)&unk_100019050, a2);
}

uint64_t sub_100012998(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_100012730(a1, a2, a3, a4, (uint64_t)&unk_100019028, (uint64_t)&unk_100019050);
}

void sub_1000129C0()
{
  uint64_t *v0;

  sub_10000FF1C(v0[2], v0[3], v0[4]);
}

uint64_t sub_1000129D0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

uint64_t sub_1000129FC(uint64_t a1)
{
  uint64_t *v1;

  return sub_100010038(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100012A08()
{
  uint64_t v0;

  return sub_100011E38(v0, (uint64_t)&unk_100019070, (uint64_t)&unk_100019098);
}

uint64_t sub_100012A30@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_1000126B8(a1, (uint64_t)&unk_100019070, (uint64_t)&unk_100019098, a2);
}

uint64_t sub_100012A54(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_100012730(a1, a2, a3, a4, (uint64_t)&unk_100019070, (uint64_t)&unk_100019098);
}

uint64_t sub_100012A78()
{
  uint64_t v0;

  return sub_10000F930(v0);
}

uint64_t sub_100012A80@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  return sub_1000126B8(a1, (uint64_t)&unk_1000190B8, (uint64_t)&unk_1000190E0, a2);
}

uint64_t sub_100012AA4(char *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  return sub_100012730(a1, a2, a3, a4, (uint64_t)&unk_1000190B8, (uint64_t)&unk_1000190E0);
}

id sub_100012B38(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;
  NSString v9;
  id v10;
  objc_super v12;

  *(_QWORD *)&v1[OBJC_IVAR____TtC15Diagnostic_600438MicrophoneTestEvaluatingViewController_checked] = &_swiftEmptyDictionarySingleton;
  *(_QWORD *)&v1[OBJC_IVAR____TtC15Diagnostic_600438MicrophoneTestEvaluatingViewController_audioManager] = a1;
  swift_retain(a1);
  sub_100014D00(0xD000000000000015, (void *)0x8000000100017DC0);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  sub_100014D00(0xD00000000000001BLL, (void *)0x8000000100017DE0);
  v7 = v6;
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  v9 = String._bridgeToObjectiveC()();
  v12.receiver = v1;
  v12.super_class = (Class)type metadata accessor for MicrophoneTestEvaluatingViewController();
  v10 = objc_msgSendSuper2(&v12, "initWithTitle:detailText:symbolName:contentLayout:", v5, v8, v9, 3);

  swift_release(a1);
  return v10;
}

void sub_100012C5C()
{
  void *v0;
  id v1;
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  Class isa;
  id v48;
  uint64_t v49;
  uint64_t v50;
  NSString v51;
  uint64_t v52;
  char *v53;
  void *v54;
  id v55;
  id v56;
  uint64_t v57;
  char *v58;
  Class v59;
  id v60;
  uint64_t v61;
  char *v62;
  Class v63;
  id v64;
  id v65;
  id v66;
  _OWORD v67[12];
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char v71[24];
  objc_super v72;
  _OWORD v73[12];
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint64_t v87;
  UIAction_optional v88;
  UIAction_optional v89;
  UIMenu_optional v90;
  UIMenu_optional v91;

  v72.receiver = v0;
  v72.super_class = (Class)type metadata accessor for MicrophoneTestEvaluatingViewController();
  objc_msgSendSuper2(&v72, "viewDidLoad");
  v1 = objc_msgSend(v0, "navigationItem");
  objc_msgSend(v1, "setHidesBackButton:", 1);

  v2 = swift_allocObject(&unk_10001D6A8, 216, 7);
  sub_100007E28((uint64_t)v73);
  v3 = v73[11];
  *(_OWORD *)(v2 + 176) = v73[10];
  *(_OWORD *)(v2 + 192) = v3;
  *(_QWORD *)(v2 + 208) = v74;
  v4 = v73[7];
  *(_OWORD *)(v2 + 112) = v73[6];
  *(_OWORD *)(v2 + 128) = v4;
  v5 = v73[9];
  *(_OWORD *)(v2 + 144) = v73[8];
  *(_OWORD *)(v2 + 160) = v5;
  v6 = v73[3];
  *(_OWORD *)(v2 + 48) = v73[2];
  *(_OWORD *)(v2 + 64) = v6;
  v7 = v73[5];
  *(_OWORD *)(v2 + 80) = v73[4];
  *(_OWORD *)(v2 + 96) = v7;
  v8 = v73[1];
  *(_OWORD *)(v2 + 16) = v73[0];
  *(_OWORD *)(v2 + 32) = v8;
  v9 = swift_allocObject(&unk_10001D6D0, 32, 7);
  *(_QWORD *)(v9 + 16) = v0;
  *(_QWORD *)(v9 + 24) = v2;
  swift_beginAccess(v2 + 16, v71, 1, 0);
  v10 = *(_QWORD *)(v2 + 200);
  v11 = *(_QWORD *)(v2 + 208);
  *(_QWORD *)(v2 + 200) = sub_100014C78;
  *(_QWORD *)(v2 + 208) = v9;
  v12 = v0;
  swift_retain(v2);
  sub_100009888(v10, v11);
  v13 = *(_OWORD *)(v2 + 64);
  v77 = *(_OWORD *)(v2 + 48);
  v78 = v13;
  v14 = *(_OWORD *)(v2 + 128);
  v81 = *(_OWORD *)(v2 + 112);
  v82 = v14;
  v15 = *(_OWORD *)(v2 + 96);
  v79 = *(_OWORD *)(v2 + 80);
  v80 = v15;
  v87 = *(_QWORD *)(v2 + 208);
  v16 = *(_OWORD *)(v2 + 192);
  v85 = *(_OWORD *)(v2 + 176);
  v86 = v16;
  v17 = *(_OWORD *)(v2 + 160);
  v83 = *(_OWORD *)(v2 + 144);
  v84 = v17;
  v18 = *(_OWORD *)(v2 + 32);
  v75 = *(_OWORD *)(v2 + 16);
  v76 = v18;
  v19 = *(_QWORD *)&v12[OBJC_IVAR____TtC15Diagnostic_600438MicrophoneTestEvaluatingViewController_audioManager];
  v20 = type metadata accessor for AudioManager(0);
  swift_retain(v19);
  sub_100008CA4(&v75);
  v21 = sub_1000080E0();
  v22 = static ObservableObject.environmentStore.getter(v20, v21);
  v67[10] = v85;
  v67[11] = v86;
  v67[6] = v81;
  v67[7] = v82;
  v67[8] = v83;
  v67[9] = v84;
  v67[2] = v77;
  v67[3] = v78;
  v67[4] = v79;
  v67[5] = v80;
  v67[0] = v75;
  v67[1] = v76;
  v68 = v87;
  v69 = v22;
  v70 = v19;
  v23 = objc_allocWithZone((Class)sub_100008128(&qword_100022070));
  v24 = (void *)UIHostingController.init(rootView:)(v67);
  v25 = objc_msgSend(v24, "view");
  if (v25)
  {
    v26 = v25;
    objc_msgSend(v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v27 = objc_msgSend(v12, "contentView");
    objc_msgSend(v27, "addSubview:", v26);

    v66 = (id)objc_opt_self(NSLayoutConstraint);
    v28 = sub_100008128(&qword_100021A58);
    v29 = swift_allocObject(v28, 64, 7);
    *(_OWORD *)(v29 + 16) = xmmword_100019100;
    v30 = objc_msgSend(v26, "leadingAnchor");
    v31 = objc_msgSend(v12, "contentView");
    v32 = objc_msgSend(v31, "leadingAnchor");

    v33 = objc_msgSend(v30, "constraintEqualToAnchor:", v32);
    *(_QWORD *)(v29 + 32) = v33;
    v34 = objc_msgSend(v26, "trailingAnchor");
    v35 = objc_msgSend(v12, "contentView");
    v36 = objc_msgSend(v35, "trailingAnchor");

    v37 = objc_msgSend(v34, "constraintEqualToAnchor:", v36);
    *(_QWORD *)(v29 + 40) = v37;
    v38 = objc_msgSend(v26, "topAnchor");
    v39 = objc_msgSend(v12, "contentView");
    v40 = objc_msgSend(v39, "topAnchor");

    v41 = objc_msgSend(v38, "constraintEqualToAnchor:", v40);
    *(_QWORD *)(v29 + 48) = v41;
    v42 = objc_msgSend(v26, "bottomAnchor");
    v43 = objc_msgSend(v12, "contentView");
    v44 = objc_msgSend(v43, "bottomAnchor");

    v45 = objc_msgSend(v42, "constraintEqualToAnchor:", v44);
    *(_QWORD *)(v29 + 56) = v45;
    *(_QWORD *)&v67[0] = v29;
    specialized Array._endMutation()();
    v46 = *(_QWORD *)&v67[0];
    sub_10000AC90(0, &qword_100021A60, NSLayoutConstraint_ptr);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v46);
    objc_msgSend(v66, "activateConstraints:", isa);

    v48 = objc_msgSend((id)objc_opt_self(OBLinkTrayButton), "linkButton");
    sub_100014D00(0x415F44524F434552, (void *)0xEC0000004E494147);
    v50 = v49;
    v51 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v50);
    objc_msgSend(v48, "setTitle:forState:", v51, 0);

    sub_10000AC90(0, (unint64_t *)&qword_100021A10, UIAction_ptr);
    v52 = swift_allocObject(&unk_10001D6F8, 24, 7);
    *(_QWORD *)(v52 + 16) = v12;
    v53 = v12;
    v54 = (void *)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)(0, 0xE000000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, sub_100014C80, v52);
    objc_msgSend(v48, "addAction:forControlEvents:", v54, 64);

    v55 = objc_msgSend(v53, "buttonTray");
    objc_msgSend(v55, "addButton:", v48);

    v56 = objc_msgSend(v53, "navigationItem");
    sub_10000AC90(0, &qword_100022078, UIBarButtonItem_ptr);
    v57 = swift_allocObject(&unk_10001D720, 24, 7);
    *(_QWORD *)(v57 + 16) = v53;
    v58 = v53;
    v88.value.super.super.isa = (Class)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)(0, 0xE000000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, sub_100014C88, v57);
    v88.is_nil = 0;
    v59 = UIBarButtonItem.init(systemItem:primaryAction:menu:)(UIBarButtonSystemItemCancel, v88, v90).super.super.isa;
    objc_msgSend(v56, "setLeftBarButtonItem:", v59);

    v60 = objc_msgSend(v58, "navigationItem");
    v61 = swift_allocObject(&unk_10001D748, 24, 7);
    *(_QWORD *)(v61 + 16) = v58;
    v62 = v58;
    v89.value.super.super.isa = (Class)UIAction.init(title:subtitle:image:selectedImage:identifier:discoverabilityTitle:attributes:state:handler:)(0, 0xE000000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 0, sub_100014CB4, v61);
    v89.is_nil = 0;
    v63 = UIBarButtonItem.init(systemItem:primaryAction:menu:)(UIBarButtonSystemItemDone, v89, v91).super.super.isa;
    objc_msgSend(v60, "setRightBarButtonItem:", v63);

    v64 = objc_msgSend(v62, "navigationItem");
    v65 = objc_msgSend(v64, "rightBarButtonItem");

    if (v65)
    {
      objc_msgSend(v65, "setEnabled:", 0);
      swift_release(v2);

    }
    else
    {
      swift_release(v2);
    }

  }
  else
  {
    swift_release(v2);
  }

}

void sub_100013464(uint64_t a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  _BYTE v10[24];

  v6 = *(_QWORD *)&a2[OBJC_IVAR____TtC15Diagnostic_600438MicrophoneTestEvaluatingViewController_checked];
  *(_QWORD *)&a2[OBJC_IVAR____TtC15Diagnostic_600438MicrophoneTestEvaluatingViewController_checked] = a1;
  swift_bridgeObjectRetain(a1);
  swift_bridgeObjectRelease(v6);
  v7 = objc_msgSend(a2, "navigationItem");
  v8 = objc_msgSend(v7, "rightBarButtonItem");

  if (v8)
  {
    v9 = *(_QWORD *)(a1 + 16);
    swift_beginAccess(a3 + 16, v10, 0, 0);
    objc_msgSend(v8, "setEnabled:", v9 == *(_QWORD *)(a3 + 16));

  }
}

void sub_100013528(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  NSString v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  NSString v20;
  void *v21;
  id v22;
  void **v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  void (*v27)(uint64_t);
  uint64_t v28;

  sub_100014D00(0xD000000000000019, (void *)0x8000000100017D80);
  v4 = v3;
  sub_100014D00(0xD000000000000019, (void *)0x8000000100017DA0);
  v6 = v5;
  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  v9 = objc_msgSend((id)objc_opt_self(UIAlertController), "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);

  sub_100014D00(20302, (void *)0xE200000000000000);
  v11 = v10;
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  v27 = (void (*)(uint64_t))nullsub_1;
  v28 = 0;
  v23 = _NSConcreteStackBlock;
  v24 = 1107296256;
  v25 = sub_10000AD18;
  v26 = &unk_10001D7B0;
  v13 = _Block_copy(&v23);
  swift_release(v28);
  v14 = (void *)objc_opt_self(UIAlertAction);
  v15 = objc_msgSend(v14, "actionWithTitle:style:handler:", v12, 0, v13);
  _Block_release(v13);

  objc_msgSend(v9, "addAction:", v15);
  sub_100014D00(5457241, (void *)0xE300000000000000);
  v17 = v16;
  v18 = swift_allocObject(&unk_10001D7E8, 24, 7);
  *(_QWORD *)(v18 + 16) = a2;
  v19 = a2;
  v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v17);
  v27 = sub_100014CD4;
  v28 = v18;
  v23 = _NSConcreteStackBlock;
  v24 = 1107296256;
  v25 = sub_10000AD18;
  v26 = &unk_10001D800;
  v21 = _Block_copy(&v23);
  swift_release(v28);
  v22 = objc_msgSend(v14, "actionWithTitle:style:handler:", v20, 1, v21);
  _Block_release(v21);

  objc_msgSend(v9, "addAction:", v22);
  objc_msgSend(v19, "presentViewController:animated:completion:", v9, 1, 0);

}

void sub_1000137D8(uint64_t a1, char *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)&a2[OBJC_IVAR____TtC15Diagnostic_600438MicrophoneTestEvaluatingViewController_audioManager];
  swift_retain(v3);
  sub_1000117F4();
  swift_release(v3);
  v4 = objc_msgSend(a2, "navigationController");
  if (v4)
  {
    v5 = v4;

  }
}

void sub_10001386C(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  NSString v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  NSString v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  NSString v18;
  void *v19;
  id v20;
  void **v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  void (*v25)();
  uint64_t v26;

  sub_100014D00(0xD000000000000018, (void *)0x80000001000177D0);
  v4 = v3;
  sub_100014D00(0xD000000000000018, (void *)0x80000001000177F0);
  v6 = v5;
  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  v9 = objc_msgSend((id)objc_opt_self(UIAlertController), "alertControllerWithTitle:message:preferredStyle:", v7, v8, 1);

  sub_100014D00(20302, (void *)0xE200000000000000);
  v11 = v10;
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  v25 = (void (*)())nullsub_1;
  v26 = 0;
  v21 = _NSConcreteStackBlock;
  v22 = 1107296256;
  v23 = sub_10000AD18;
  v24 = &unk_10001D760;
  v13 = _Block_copy(&v21);
  swift_release(v26);
  v14 = (void *)objc_opt_self(UIAlertAction);
  v15 = objc_msgSend(v14, "actionWithTitle:style:handler:", v12, 0, v13);
  _Block_release(v13);

  objc_msgSend(v9, "addAction:", v15);
  sub_100014D00(5457241, (void *)0xE300000000000000);
  v17 = v16;
  v18 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v17);
  v25 = sub_10000EE6C;
  v26 = 0;
  v21 = _NSConcreteStackBlock;
  v22 = 1107296256;
  v23 = sub_10000AD18;
  v24 = &unk_10001D788;
  v19 = _Block_copy(&v21);
  swift_release(v26);
  v20 = objc_msgSend(v14, "actionWithTitle:style:handler:", v18, 1, v19);
  _Block_release(v19);

  objc_msgSend(v9, "addAction:", v20);
  objc_msgSend(a2, "presentViewController:animated:completion:", v9, 1, 0);

}

uint64_t sub_100013AEC(uint64_t a1, char *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  char *v11;
  void *v13;

  v13 = &_swiftEmptyDictionarySingleton;
  v3 = *(_QWORD *)&a2[OBJC_IVAR____TtC15Diagnostic_600438MicrophoneTestEvaluatingViewController_checked];
  v4 = swift_bridgeObjectRetain(v3);
  sub_100013C8C(v4, &v13);
  swift_bridgeObjectRelease(v3);
  v5 = *(_QWORD *)&a2[OBJC_IVAR____TtC15Diagnostic_600438MicrophoneTestEvaluatingViewController_audioManager];
  swift_retain(v5);
  sub_100011EA4();
  sub_10000F738();
  swift_release(v5);
  v6 = objc_msgSend(a2, "navigationController");
  v7 = v13;
  if (v6)
  {
    v8 = v6;
    v9 = objc_allocWithZone((Class)type metadata accessor for MicrophoneTestCompletedViewController());
    v10 = swift_bridgeObjectRetain(v7);
    v11 = sub_100009AD4(v10);
    objc_msgSend(v8, "pushViewController:animated:", v11, 1);

  }
  return swift_bridgeObjectRelease(v7);
}

uint64_t sub_100013BD8(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v9;

  v3 = *(_QWORD *)a1;
  v4 = *(_QWORD *)(a1 + 8);
  if (*(_BYTE *)(a1 + 16))
    v5 = 1936941392;
  else
    v5 = 1818845510;
  swift_bridgeObjectRetain(*(_QWORD *)(a1 + 8));
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*a2);
  v9 = *a2;
  *a2 = 0x8000000000000000;
  sub_100014778(v5, 0xE400000000000000, v3, v4, isUniquelyReferenced_nonNull_native);
  v7 = *a2;
  *a2 = v9;
  swift_bridgeObjectRelease(v4);
  return swift_bridgeObjectRelease(v7);
}

uint64_t sub_100013C8C(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  unint64_t i;
  unint64_t v15;
  int64_t v16;
  _QWORD *v17;
  uint64_t v18;
  char v19;
  int64_t v20;
  _QWORD v21[2];
  char v22;

  v5 = a1 + 64;
  v6 = 1 << *(_BYTE *)(a1 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(a1 + 64);
  v9 = (unint64_t)(v6 + 63) >> 6;
  result = swift_bridgeObjectRetain(a1);
  v11 = 0;
  if (!v8)
    goto LABEL_5;
LABEL_4:
  v12 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (i = v12 | (v11 << 6); ; i = __clz(__rbit64(v15)) + (v11 << 6))
  {
    v17 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * i);
    v18 = v17[1];
    v19 = *(_BYTE *)(*(_QWORD *)(a1 + 56) + i);
    v21[0] = *v17;
    v21[1] = v18;
    v22 = v19;
    swift_bridgeObjectRetain(v18);
    sub_100013BD8((uint64_t)v21, a2);
    if (v2)
    {
      swift_release(a1);
      return swift_bridgeObjectRelease(v18);
    }
    result = swift_bridgeObjectRelease(v18);
    if (v8)
      goto LABEL_4;
LABEL_5:
    if (__OFADD__(v11++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v11 >= v9)
      return swift_release(a1);
    v15 = *(_QWORD *)(v5 + 8 * v11);
    if (!v15)
    {
      v16 = v11 + 1;
      if (v11 + 1 >= v9)
        return swift_release(a1);
      v15 = *(_QWORD *)(v5 + 8 * v16);
      if (v15)
        goto LABEL_14;
      v16 = v11 + 2;
      if (v11 + 2 >= v9)
        return swift_release(a1);
      v15 = *(_QWORD *)(v5 + 8 * v16);
      if (v15)
        goto LABEL_14;
      v16 = v11 + 3;
      if (v11 + 3 >= v9)
        return swift_release(a1);
      v15 = *(_QWORD *)(v5 + 8 * v16);
      if (v15)
      {
LABEL_14:
        v11 = v16;
        goto LABEL_15;
      }
      v20 = v11 + 4;
      if (v11 + 4 >= v9)
        return swift_release(a1);
      v15 = *(_QWORD *)(v5 + 8 * v20);
      v11 += 4;
      if (!v15)
        break;
    }
LABEL_15:
    v8 = (v15 - 1) & v15;
  }
  while (1)
  {
    v11 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v11 >= v9)
      return swift_release(a1);
    v15 = *(_QWORD *)(v5 + 8 * v11);
    ++v20;
    if (v15)
      goto LABEL_15;
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_100013EC8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MicrophoneTestEvaluatingViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MicrophoneTestEvaluatingViewController()
{
  return objc_opt_self(_TtC15Diagnostic_600438MicrophoneTestEvaluatingViewController);
}

uint64_t sub_100013F50()
{
  _QWORD *v0;

  swift_release(v0[3]);
  swift_release(v0[6]);
  swift_release(v0[8]);
  swift_bridgeObjectRelease(v0[9]);
  swift_release(v0[10]);
  swift_bridgeObjectRelease(v0[11]);
  swift_release(v0[12]);
  swift_release(v0[14]);
  swift_bridgeObjectRelease(v0[15]);
  swift_release(v0[16]);
  swift_release(v0[18]);
  swift_bridgeObjectRelease(v0[19]);
  swift_release(v0[20]);
  swift_release(v0[22]);
  swift_release(v0[24]);
  if (v0[25])
    swift_release(v0[26]);
  return swift_deallocObject(v0, 216, 7);
}

Swift::Int sub_100013FF4(uint64_t a1, uint64_t a2)
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
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;
  _QWORD v39[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100008128(&qword_100022088);
  v38 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v35 = v3;
  v36 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain(v5);
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v20 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_34;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v22 >= v36)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v36)
        goto LABEL_36;
      v24 = *(_QWORD *)(v37 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v36)
        {
LABEL_36:
          swift_release(v5);
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v24 = *(_QWORD *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_45;
            if (v14 >= v36)
              goto LABEL_36;
            v24 = *(_QWORD *)(v37 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_33;
          }
        }
        v14 = v25;
      }
    }
LABEL_33:
    v11 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_34:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v21);
    if ((v38 & 1) == 0)
      swift_bridgeObjectRetain(v30[1]);
    Hasher.init(_seed:)(v39, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v39, v32, v31);
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
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v18);
    *v19 = v32;
    v19[1] = v31;
    *(_BYTE *)(*(_QWORD *)(v8 + 56) + v18) = v33;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v35;
  v23 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

Swift::Int sub_1000142FC(uint64_t a1, uint64_t a2)
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
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;
  _QWORD *v25;
  unint64_t v26;
  int64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  uint64_t v42;
  char v43;
  _QWORD v44[9];

  v3 = v2;
  v5 = *v2;
  if (*(_QWORD *)(*v2 + 24) <= a1)
    v6 = a1;
  else
    v6 = *(_QWORD *)(*v2 + 24);
  sub_100008128(&qword_100022080);
  v43 = a2;
  v7 = static _DictionaryStorage.resize(original:capacity:move:)(v5, v6, a2);
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_43;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v42 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v40 = v3;
  v41 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain(v5);
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v22 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v23 = v22 | (v14 << 6);
      goto LABEL_34;
    }
    v24 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_44:
      __break(1u);
LABEL_45:
      __break(1u);
      return result;
    }
    if (v24 >= v41)
      break;
    v25 = (_QWORD *)(v5 + 64);
    v26 = *(_QWORD *)(v42 + 8 * v24);
    ++v14;
    if (!v26)
    {
      v14 = v24 + 1;
      if (v24 + 1 >= v41)
        goto LABEL_36;
      v26 = *(_QWORD *)(v42 + 8 * v14);
      if (!v26)
      {
        v27 = v24 + 2;
        if (v27 >= v41)
        {
LABEL_36:
          swift_release(v5);
          v3 = v40;
          if ((v43 & 1) == 0)
            goto LABEL_43;
          goto LABEL_39;
        }
        v26 = *(_QWORD *)(v42 + 8 * v27);
        if (!v26)
        {
          while (1)
          {
            v14 = v27 + 1;
            if (__OFADD__(v27, 1))
              goto LABEL_45;
            if (v14 >= v41)
              goto LABEL_36;
            v26 = *(_QWORD *)(v42 + 8 * v14);
            ++v27;
            if (v26)
              goto LABEL_33;
          }
        }
        v14 = v27;
      }
    }
LABEL_33:
    v11 = (v26 - 1) & v26;
    v23 = __clz(__rbit64(v26)) + (v14 << 6);
LABEL_34:
    v32 = 16 * v23;
    v33 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v32);
    v35 = *v33;
    v34 = v33[1];
    v36 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v32);
    v37 = *v36;
    v38 = v36[1];
    if ((v43 & 1) == 0)
    {
      swift_bridgeObjectRetain(v33[1]);
      swift_bridgeObjectRetain(v38);
    }
    Hasher.init(_seed:)(v44, *(_QWORD *)(v8 + 40));
    String.hash(into:)(v44, v35, v34);
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
      v28 = 0;
      v29 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v29 && (v28 & 1) != 0)
        {
          __break(1u);
          goto LABEL_44;
        }
        v30 = v17 == v29;
        if (v17 == v29)
          v17 = 0;
        v28 |= v30;
        v31 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v31 == -1);
      v18 = __clz(__rbit64(~v31)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = 16 * v18;
    v20 = (_QWORD *)(*(_QWORD *)(v8 + 48) + v19);
    *v20 = v35;
    v20[1] = v34;
    v21 = (_QWORD *)(*(_QWORD *)(v8 + 56) + v19);
    *v21 = v37;
    v21[1] = v38;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release(v5);
  v3 = v40;
  v25 = (_QWORD *)(v5 + 64);
  if ((v43 & 1) == 0)
    goto LABEL_43;
LABEL_39:
  v39 = 1 << *(_BYTE *)(v5 + 32);
  if (v39 >= 64)
    bzero(v25, ((unint64_t)(v39 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v25 = -1 << v39;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_43:
  result = swift_release(v5);
  *v3 = v8;
  return result;
}

uint64_t sub_100014620(char a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  char v19;
  uint64_t *v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v5 = v4;
  v10 = *v4;
  v12 = sub_100015FB8(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= result && (a4 & 1) == 0)
  {
    result = (uint64_t)sub_1000148EC();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      *(_BYTE *)(v18[7] + v12) = a1 & 1;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v20 = (uint64_t *)(v18[6] + 16 * v12);
    *v20 = a2;
    v20[1] = a3;
    *(_BYTE *)(v18[7] + v12) = a1 & 1;
    v21 = v18[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (!v22)
    {
      v18[2] = v23;
      return swift_bridgeObjectRetain(a3);
    }
    goto LABEL_14;
  }
  sub_100013FF4(result, a4 & 1);
  result = sub_100015FB8(a2, a3);
  if ((v16 & 1) == (v19 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

uint64_t sub_100014778(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t result;
  unint64_t v23;
  char v24;
  uint64_t *v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;

  v6 = v5;
  v12 = *v5;
  v14 = sub_100015FB8(a3, a4);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_100014A94();
LABEL_7:
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = (_QWORD *)(v20[7] + 16 * v14);
      result = swift_bridgeObjectRelease(v21[1]);
      *v21 = a1;
      v21[1] = a2;
      return result;
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    v25 = (uint64_t *)(v20[6] + 16 * v14);
    *v25 = a3;
    v25[1] = a4;
    v26 = (_QWORD *)(v20[7] + 16 * v14);
    *v26 = a1;
    v26[1] = a2;
    v27 = v20[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (!v28)
    {
      v20[2] = v29;
      return swift_bridgeObjectRetain(a4);
    }
    goto LABEL_14;
  }
  sub_1000142FC(v17, a5 & 1);
  v23 = sub_100015FB8(a3, a4);
  if ((v18 & 1) == (v24 & 1))
  {
    v14 = v23;
    v20 = (_QWORD *)*v6;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)(&type metadata for String);
  __break(1u);
  return result;
}

void *sub_1000148EC()
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
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  sub_100008128(&qword_100022088);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = *v16;
    v17 = v16[1];
    LOBYTE(v16) = *(_BYTE *)(*(_QWORD *)(v2 + 56) + v15);
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v15);
    *v19 = v18;
    v19[1] = v17;
    *(_BYTE *)(*(_QWORD *)(v4 + 56) + v15) = (_BYTE)v16;
    result = (void *)swift_bridgeObjectRetain(v17);
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_100014A94()
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
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  sub_100008128(&qword_100022080);
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
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = *v20;
    v22 = v20[1];
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
    *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain(v18);
    result = (void *)swift_bridgeObjectRetain(v22);
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_100014C4C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_100014C78(uint64_t a1)
{
  uint64_t v1;

  sub_100013464(a1, *(char **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void sub_100014C80(uint64_t a1)
{
  uint64_t v1;

  sub_100013528(a1, *(void **)(v1 + 16));
}

void sub_100014C88(uint64_t a1)
{
  uint64_t v1;

  sub_10001386C(a1, *(void **)(v1 + 16));
}

uint64_t sub_100014C90()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100014CB4(uint64_t a1)
{
  uint64_t v1;

  return sub_100013AEC(a1, *(char **)(v1 + 16));
}

uint64_t sub_100014CBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100014CCC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_100014CD4(uint64_t a1)
{
  uint64_t v1;

  sub_1000137D8(a1, *(char **)(v1 + 16));
}

uint64_t sub_100014D00(uint64_t a1, void *a2)
{
  _QWORD *v4;
  unint64_t v5;
  char v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t countAndFlagsBits;
  uint64_t v10;
  id v11;
  Swift::String v12;
  Swift::String v13;
  _BYTE v15[24];
  Swift::String v16;

  if (qword_1000216F0 != -1)
    swift_once(&qword_1000216F0, sub_100014F78);
  swift_beginAccess(&off_100022090, v15, 32, 0);
  v4 = off_100022090;
  if (!*((_QWORD *)off_100022090 + 2))
    goto LABEL_10;
  swift_bridgeObjectRetain(a2);
  v5 = sub_100015FB8(a1, (uint64_t)a2);
  if ((v6 & 1) == 0)
  {
    swift_bridgeObjectRelease(a2);
LABEL_10:
    swift_endAccess(v15);
    goto LABEL_11;
  }
  v7 = (uint64_t *)(v4[7] + 16 * v5);
  countAndFlagsBits = *v7;
  v8 = v7[1];
  swift_endAccess(v15);
  swift_bridgeObjectRetain(v8);
  swift_bridgeObjectRelease(a2);
  v10 = HIBYTE(v8) & 0xF;
  if ((v8 & 0x2000000000000000) == 0)
    v10 = countAndFlagsBits & 0xFFFFFFFFFFFFLL;
  if (!v10)
  {
    swift_bridgeObjectRelease(v8);
LABEL_11:
    v11 = objc_msgSend((id)objc_opt_self(NSBundle), "mainBundle");
    v16._object = (void *)0xE000000000000000;
    v12._countAndFlagsBits = a1;
    v12._object = a2;
    v13._countAndFlagsBits = 0;
    v13._object = (void *)0xE000000000000000;
    v16._countAndFlagsBits = 0;
    countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v12, (Swift::String_optional)0, (NSBundle)v11, v13, v16)._countAndFlagsBits;

  }
  return countAndFlagsBits;
}

unint64_t sub_100014E58(uint64_t a1)
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
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100008128(&qword_100022080);
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
  v6 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v7 = *(v6 - 3);
    v8 = *(v6 - 2);
    v10 = *(v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    swift_bridgeObjectRetain(v9);
    result = sub_100015FB8(v7, v8);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v4[6] + 16 * result);
    *v13 = v7;
    v13[1] = v8;
    v14 = (_QWORD *)(v4[7] + 16 * result);
    *v14 = v10;
    v14[1] = v9;
    v15 = v4[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_11;
    v6 += 4;
    v4[2] = v17;
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

void *sub_100014F78()
{
  void *result;

  result = (void *)sub_100014E58((uint64_t)&_swiftEmptyArrayStorage);
  off_100022090 = result;
  return result;
}

uint64_t sub_100014F9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;

  v0 = type metadata accessor for MicrophoneTestViewControllerManager();
  v1 = swift_allocObject(v0, 24, 7);
  result = swift_unknownObjectWeakInit(v1 + 16, 0);
  qword_1000225D8 = v1;
  return result;
}

uint64_t sub_100014FDC()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocClassInstance(v0, 24, 7);
}

uint64_t type metadata accessor for MicrophoneTestViewControllerManager()
{
  return objc_opt_self(_TtC15Diagnostic_600435MicrophoneTestViewControllerManager);
}

void sub_100015020()
{
  char *v0;
  char *v1;
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t Strong;
  void *v12;
  id v13;
  objc_super v14;

  v1 = v0;
  v14.receiver = v0;
  v14.super_class = (Class)type metadata accessor for MicrophoneTestViewController();
  objc_msgSendSuper2(&v14, "viewDidLoad");
  v2 = objc_msgSend(v0, "view");
  if (v2)
  {
    v3 = v2;
    v4 = objc_msgSend((id)objc_opt_self(UIColor), "systemBackgroundColor");
    objc_msgSend(v3, "setBackgroundColor:", v4);

    if (qword_1000216F8 != -1)
      swift_once(&qword_1000216F8, sub_100014F9C);
    v5 = qword_1000225D8 + 16;
    swift_unknownObjectWeakAssign(qword_1000225D8 + 16, v1);
    v6 = *(_QWORD *)&v1[OBJC_IVAR___MicrophoneTestViewController_audioManager];
    v7 = objc_allocWithZone((Class)type metadata accessor for MicrophoneTestStartingViewController());
    v8 = swift_retain(v6);
    v9 = sub_10000E6A0(v8);
    v10 = objc_msgSend(objc_allocWithZone((Class)UINavigationController), "initWithRootViewController:", v9);
    objc_msgSend(v10, "setModalPresentationStyle:", 0);
    objc_msgSend(v1, "presentViewController:animated:completion:", v10, 1, 0);
    Strong = swift_unknownObjectWeakLoadStrong(v5);
    if (Strong)
    {
      v12 = (void *)Strong;
      v13 = *(id *)(Strong + OBJC_IVAR___MicrophoneTestViewController_headphonesDetector);

      objc_msgSend(v13, "stop");
      v9 = v10;
      v10 = v13;
    }

  }
  else
  {
    __break(1u);
  }
}

id sub_100015274()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;

  v1 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  static String._unconditionallyBridgeFromObjectiveC(_:)(CFSTR("HeadphonesConnectedNotification"));
  v3 = v2;
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  v5 = objc_msgSend((id)objc_opt_self(NSOperationQueue), "mainQueue");
  v6 = swift_allocObject(&unk_10001D838, 24, 7);
  swift_unknownObjectWeakInit(v6 + 16, v0);
  v10[4] = sub_100015F98;
  v11 = v6;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 1107296256;
  v10[2] = sub_100015450;
  v10[3] = &unk_10001D850;
  v7 = _Block_copy(v10);
  swift_release(v11);
  v8 = objc_msgSend(v1, "addObserverForName:object:queue:usingBlock:", v4, 0, v5, v7);
  _Block_release(v7);
  swift_unknownObjectRelease(v8);

  return objc_msgSend(*(id *)(v0 + OBJC_IVAR___MicrophoneTestViewController_headphonesDetector), "start");
}

uint64_t sub_1000153E0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  void *v4;
  unint64_t v5;
  _BYTE v6[24];

  v2 = a2 + 16;
  swift_beginAccess(a2 + 16, v6, 0, 0);
  result = swift_unknownObjectWeakLoadStrong(v2);
  if (result)
  {
    v4 = (void *)result;
    v5 = sub_100014E58((uint64_t)_swiftEmptyArrayStorage);
    sub_100015ACC(4, v5);

    return swift_bridgeObjectRelease(v5);
  }
  return result;
}

uint64_t sub_100015450(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *);
  uint64_t v11;

  v4 = type metadata accessor for Notification(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void (**)(char *))(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)(a2);
  swift_retain(v8);
  v9(v7);
  swift_release(v8);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

id sub_100015550(uint64_t a1, uint64_t a2)
{
  void *v2;
  os_log_type_t v5;
  NSObject *v6;
  uint8_t *v7;
  id v8;
  Class isa;
  id v10;
  uint64_t v11;
  Class v12;
  uint64_t v14;
  uint64_t v15;

  v5 = static os_log_type_t.default.getter(a1);
  if (qword_1000216E8 != -1)
    swift_once(&qword_1000216E8, sub_10000F050);
  v6 = qword_1000225B8;
  if (os_log_type_enabled((os_log_t)qword_1000225B8, v5))
  {
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v7 = 134217984;
    v14 = a1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, &v15, v7 + 4, v7 + 12);
    _os_log_impl((void *)&_mh_execute_header, v6, v5, "Finished test with status %ld", v7, 0xCu);
    swift_slowDealloc(v7, -1, -1);
  }
  v8 = objc_msgSend(v2, "result");
  isa = Int._bridgeToObjectiveC()().super.super.isa;
  objc_msgSend(v8, "setStatusCode:", isa);

  v10 = objc_msgSend(v2, "result");
  v11 = sub_100015710(a2);
  v12 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v11);
  objc_msgSend(v10, "setData:", v12);

  return objc_msgSend(v2, "setFinished:", 1);
}

uint64_t sub_100015710(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  _QWORD v33[2];
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  _OWORD v37[2];
  __int128 v38;
  __int128 v39;
  uint64_t v40;
  _OWORD v41[2];
  _OWORD v42[2];

  v2 = *(_QWORD *)(a1 + 16);
  if (v2)
  {
    sub_100008128((uint64_t *)&unk_1000221A0);
    v3 = (_QWORD *)static _DictionaryStorage.allocate(capacity:)(v2);
  }
  else
  {
    v3 = &_swiftEmptyDictionarySingleton;
  }
  v32 = a1 + 64;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v5 = ~(-1 << -(char)v4);
  else
    v5 = -1;
  v6 = v5 & *(_QWORD *)(a1 + 64);
  v31 = (unint64_t)(63 - v4) >> 6;
  v7 = (char *)(v3 + 8);
  swift_bridgeObjectRetain(a1);
  result = swift_retain(v3);
  v9 = 0;
  while (1)
  {
    if (v6)
    {
      v12 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v13 = v12 | (v9 << 6);
      goto LABEL_28;
    }
    v14 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v14 >= v31)
      goto LABEL_37;
    v15 = *(_QWORD *)(v32 + 8 * v14);
    v16 = v9 + 1;
    if (!v15)
    {
      v16 = v9 + 2;
      if (v9 + 2 >= v31)
        goto LABEL_37;
      v15 = *(_QWORD *)(v32 + 8 * v16);
      if (!v15)
      {
        v16 = v9 + 3;
        if (v9 + 3 >= v31)
          goto LABEL_37;
        v15 = *(_QWORD *)(v32 + 8 * v16);
        if (!v15)
        {
          v16 = v9 + 4;
          if (v9 + 4 >= v31)
            goto LABEL_37;
          v15 = *(_QWORD *)(v32 + 8 * v16);
          if (!v15)
            break;
        }
      }
    }
LABEL_27:
    v6 = (v15 - 1) & v15;
    v13 = __clz(__rbit64(v15)) + (v16 << 6);
    v9 = v16;
LABEL_28:
    v18 = 16 * v13;
    v19 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v13);
    v20 = v19[1];
    v21 = (uint64_t *)(*(_QWORD *)(a1 + 56) + v18);
    v23 = *v21;
    v22 = v21[1];
    *(_QWORD *)&v42[0] = *v19;
    *((_QWORD *)&v42[0] + 1) = v20;
    swift_bridgeObjectRetain(v20);
    swift_bridgeObjectRetain(v22);
    swift_dynamicCast(&v34, v42, &type metadata for String, &type metadata for AnyHashable, 7);
    v33[0] = v23;
    v33[1] = v22;
    swift_dynamicCast(v37, v33, &type metadata for String, (char *)&type metadata for Any + 8, 7);
    v38 = v34;
    v39 = v35;
    v40 = v36;
    sub_100015F5C(v37, v41);
    v34 = v38;
    v35 = v39;
    v36 = v40;
    sub_100015F5C(v41, v42);
    sub_100015F5C(v42, &v38);
    result = AnyHashable._rawHashValue(seed:)(v3[5]);
    v24 = -1 << *((_BYTE *)v3 + 32);
    v25 = result & ~v24;
    v26 = v25 >> 6;
    if (((-1 << v25) & ~*(_QWORD *)&v7[8 * (v25 >> 6)]) != 0)
    {
      v10 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)&v7[8 * (v25 >> 6)])) | v25 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_38;
        }
        v29 = v26 == v28;
        if (v26 == v28)
          v26 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)&v7[8 * v26];
      }
      while (v30 == -1);
      v10 = __clz(__rbit64(~v30)) + (v26 << 6);
    }
    *(_QWORD *)&v7[(v10 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v10;
    v11 = v3[6] + 40 * v10;
    *(_OWORD *)v11 = v34;
    *(_OWORD *)(v11 + 16) = v35;
    *(_QWORD *)(v11 + 32) = v36;
    result = (uint64_t)sub_100015F5C(&v38, (_OWORD *)(v3[7] + 32 * v10));
    ++v3[2];
  }
  v17 = v9 + 5;
  if (v9 + 5 >= v31)
  {
LABEL_37:
    swift_release(v3);
    sub_100015F6C(a1);
    return (uint64_t)v3;
  }
  v15 = *(_QWORD *)(v32 + 8 * v17);
  if (v15)
  {
    v16 = v9 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v16 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v16 >= v31)
      goto LABEL_37;
    v15 = *(_QWORD *)(v32 + 8 * v16);
    ++v17;
    if (v15)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

id sub_100015ACC(uint64_t a1, uint64_t a2)
{
  void *v2;
  char v4;
  os_log_type_t v5;
  NSObject *v6;
  uint8_t *v7;
  id v8;
  Class isa;
  id v10;
  uint64_t v11;
  Class v12;
  uint64_t v14;
  uint64_t v15;

  v4 = a1;
  v5 = static os_log_type_t.default.getter(a1);
  if (qword_1000216E8 != -1)
    swift_once(&qword_1000216E8, sub_10000F050);
  v6 = qword_1000225B8;
  if (os_log_type_enabled((os_log_t)qword_1000225B8, v5))
  {
    v7 = (uint8_t *)swift_slowAlloc(12, -1);
    *(_DWORD *)v7 = 134217984;
    v14 = qword_1000191A0[v4];
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v14, &v15, v7 + 4, v7 + 12);
    _os_log_impl((void *)&_mh_execute_header, v6, v5, "Finished test with status %ld", v7, 0xCu);
    swift_slowDealloc(v7, -1, -1);
  }
  v8 = objc_msgSend(v2, "result");
  isa = Int._bridgeToObjectiveC()().super.super.isa;
  objc_msgSend(v8, "setStatusCode:", isa);

  v10 = objc_msgSend(v2, "result");
  v11 = sub_100015710(a2);
  v12 = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v11);
  objc_msgSend(v10, "setData:", v12);

  return objc_msgSend(v2, "setFinished:", 1);
}

id sub_100015CA8(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  NSString v10;
  id v11;
  objc_super v13;

  v6 = OBJC_IVAR___MicrophoneTestViewController_audioManager;
  v7 = type metadata accessor for AudioManager(0);
  swift_allocObject(v7, *(unsigned int *)(v7 + 48), *(unsigned __int16 *)(v7 + 52));
  v8 = v3;
  *(_QWORD *)&v3[v6] = sub_10000F1BC();
  v9 = OBJC_IVAR___MicrophoneTestViewController_headphonesDetector;
  *(_QWORD *)&v8[v9] = objc_msgSend(objc_allocWithZone((Class)DAHeadphonesDetector), "init");

  if (a2)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v10 = 0;
  }
  v13.receiver = v8;
  v13.super_class = (Class)type metadata accessor for MicrophoneTestViewController();
  v11 = objc_msgSendSuper2(&v13, "initWithNibName:bundle:", v10, a3);

  return v11;
}

id sub_100015DF8(void *a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  v3 = OBJC_IVAR___MicrophoneTestViewController_audioManager;
  v4 = type metadata accessor for AudioManager(0);
  swift_allocObject(v4, *(unsigned int *)(v4 + 48), *(unsigned __int16 *)(v4 + 52));
  v5 = v1;
  *(_QWORD *)&v1[v3] = sub_10000F1BC();
  v6 = OBJC_IVAR___MicrophoneTestViewController_headphonesDetector;
  *(_QWORD *)&v5[v6] = objc_msgSend(objc_allocWithZone((Class)DAHeadphonesDetector), "init");

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for MicrophoneTestViewController();
  v7 = objc_msgSendSuper2(&v9, "initWithCoder:", a1);

  return v7;
}

id sub_100015ED4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for MicrophoneTestViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for MicrophoneTestViewController()
{
  return objc_opt_self(MicrophoneTestViewController);
}

_OWORD *sub_100015F5C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100015F6C(uint64_t a1)
{
  return swift_release(a1 & 0x7FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100015F74()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100015F98(uint64_t a1)
{
  uint64_t v1;

  return sub_1000153E0(a1, v1);
}

uint64_t sub_100015FA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100015FB0(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

unint64_t sub_100015FB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10001601C(a1, a2, v5);
}

unint64_t sub_10001601C(uint64_t a1, uint64_t a2, uint64_t a3)
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

uint64_t sub_1000160FC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  unint64_t v12;
  _BYTE v13[24];

  if (!a1 || (v2 = type metadata accessor for MicrophoneTestInputs(), (v3 = swift_dynamicCastClass(a1, v2)) == 0))
  {
    v12 = sub_100014E58((uint64_t)_swiftEmptyArrayStorage);
    sub_100015550(-912, v12);
    return swift_bridgeObjectRelease(v12);
  }
  v4 = v3;
  v5 = qword_1000216E0;
  v6 = swift_unknownObjectRetain(a1);
  if (v5 != -1)
    v6 = swift_once(&qword_1000216E0, sub_100009A50);
  v7 = *(double *)(v4 + OBJC_IVAR___MicrophoneTestInputs_audioRecordingDuration);
  if (v7 > 10.0)
    v7 = 10.0;
  *(double *)(qword_1000225B0 + 16) = v7;
  v8 = OBJC_IVAR___MicrophoneTestInputs_stringProperties;
  v9 = *(_QWORD *)(v4 + OBJC_IVAR___MicrophoneTestInputs_stringProperties);
  if (v9)
  {
    if (!*(_QWORD *)(v9 + 16))
      return swift_unknownObjectRelease(a1);
    if (qword_1000216F0 == -1 || (v6 = swift_once(&qword_1000216F0, sub_100014F78), (v9 = *(_QWORD *)(v4 + v8)) != 0))
    {
      swift_beginAccess(&off_100022090, v13, 1, 0);
      v10 = off_100022090;
      off_100022090 = (_UNKNOWN *)v9;
      swift_bridgeObjectRetain(v9);
      swift_unknownObjectRelease(a1);
      return swift_bridgeObjectRelease(v10);
    }
    __break(1u);
  }
  __break(1u);
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)(v6);
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_audioRouteChanged(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "audioRouteChanged");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentRoute(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentRoute");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_outputs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outputs");
}

id objc_msgSend_portType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "portType");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}
