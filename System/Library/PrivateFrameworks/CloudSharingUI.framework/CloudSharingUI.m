id TCPContactStore()
{
  void *v0;
  double Current;
  id v2;
  uint64_t v3;
  void *v4;
  double v5;
  NSObject *v6;
  int v8;
  double v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)TCPContactStore_contactStore;
  if (!TCPContactStore_contactStore)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v2 = objc_alloc_init(MEMORY[0x24BDBAD00]);
    objc_msgSend(v2, "setIncludeIncludeManagedAppleIDs:", 1);
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBACF8]), "initWithConfiguration:", v2);
    v4 = (void *)TCPContactStore_contactStore;
    TCPContactStore_contactStore = v3;

    v5 = CFAbsoluteTimeGetCurrent();
    CSLogForCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = 134217984;
      v9 = (v5 - Current) * 1000.0;
      _os_log_impl(&dword_20D60A000, v6, OS_LOG_TYPE_INFO, "Time to create CNContactStore: %fms", (uint8_t *)&v8, 0xCu);
    }

    v0 = (void *)TCPContactStore_contactStore;
  }
  return v0;
}

id CSCNAutocompleteSearchControllerHeaderView(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "headerView");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  }
  v3 = v2;

  return v3;
}

void CSSetCNAutocompleteSearchControllerHeaderView(void *a1, void *a2)
{
  id v3;
  id v4;

  v4 = a1;
  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "setHeaderView:", v3);

}

void sub_20D60D0D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id CSCKSharingSummaryStringFromOptionsGroups()
{
  void *v0;
  void *v1;
  id v2;

  CKSharingSummaryStringFromOptionsGroups();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "length"))
    v1 = v0;
  else
    v1 = 0;
  v2 = v1;

  return v2;
}

uint64_t sub_20D60EADC()
{
  sub_20D6354CC();
  sub_20D6354D8();
  return sub_20D6354F0();
}

uint64_t sub_20D60EB20()
{
  return sub_20D6354D8();
}

uint64_t sub_20D60EB48()
{
  sub_20D6354CC();
  sub_20D6354D8();
  return sub_20D6354F0();
}

BOOL sub_20D60EB88(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

BOOL sub_20D60EBA0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_20D60EBB4@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_20D60EBC0(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  _OWORD v5[3];
  __int16 v6;
  _OWORD v7[3];
  __int16 v8;

  v2 = *(_OWORD *)(a1 + 16);
  v5[0] = *(_OWORD *)a1;
  v5[1] = v2;
  v5[2] = *(_OWORD *)(a1 + 32);
  v6 = *(_WORD *)(a1 + 48);
  v3 = *(_OWORD *)(a2 + 16);
  v7[0] = *(_OWORD *)a2;
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a2 + 32);
  v8 = *(_WORD *)(a2 + 48);
  return sub_20D617294((uint64_t)v5, (uint64_t)v7) & 1;
}

double sub_20D60EC18@<D0>(id *a1@<X0>, _BYTE *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X4>, uint64_t a6@<X8>)
{
  id v7;
  __objc2_ivar_list *v8;
  unsigned int v9;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double result;
  char v39;
  uint64_t v40;
  char v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  __int16 v47;
  __int16 v48;

  v7 = *a1;
  v8 = &OBJC_INSTANCE_VARIABLES__TtC14CloudSharingUI13UserInterface;
  if ((*a2 & 1) != 0)
  {
    v9 = objc_msgSend(*a1, sel_isSelected) ^ 1;
LABEL_18:
    v48 = v9;
    v25 = v7;
    v26 = objc_msgSend(v25, *(SEL *)&v8[497]);
    v27 = sub_20D635190();
    v29 = v28;

    v30 = objc_msgSend(v25, sel_title);
    v31 = sub_20D635190();
    v33 = v32;

    v34 = objc_msgSend(v25, sel_subtitle);
    v35 = sub_20D635190();
    v37 = v36;

    *(_QWORD *)a6 = v27;
    *(_QWORD *)(a6 + 8) = v29;
    *(_QWORD *)(a6 + 16) = v31;
    *(_QWORD *)(a6 + 24) = v33;
    *(_QWORD *)(a6 + 32) = v35;
    *(_QWORD *)(a6 + 40) = v37;
    *(_WORD *)(a6 + 48) = v48 | 0x100;
    return result;
  }
  v13 = objc_msgSend(*a1, sel_identifier);
  v14 = sub_20D635190();
  v16 = v15;

  if (!a4)
  {
    swift_bridgeObjectRelease();
LABEL_11:
    LOWORD(v9) = 1;
    goto LABEL_12;
  }
  if (v14 == a3 && v16 == a4)
  {
    swift_bridgeObjectRelease();
    LOWORD(v9) = 0;
    v19 = a5[1];
    if (v19)
      goto LABEL_13;
LABEL_17:
    v8 = &OBJC_INSTANCE_VARIABLES__TtC14CloudSharingUI13UserInterface;
    goto LABEL_18;
  }
  v18 = sub_20D635490();
  swift_bridgeObjectRelease();
  LOWORD(v9) = 0;
  if ((v18 & 1) == 0)
    goto LABEL_11;
LABEL_12:
  v19 = a5[1];
  if (!v19)
    goto LABEL_17;
LABEL_13:
  v47 = v9;
  v20 = *a5;
  swift_bridgeObjectRetain();
  v21 = objc_msgSend(v7, sel_identifier);
  v22 = sub_20D635190();
  v24 = v23;

  if (v20 == v22 && v19 == v24)
  {
    swift_bridgeObjectRelease();
LABEL_28:
    swift_bridgeObjectRelease();
    goto LABEL_29;
  }
  v39 = sub_20D635490();
  swift_bridgeObjectRelease();
  if ((v39 & 1) != 0)
    goto LABEL_28;
  if (v20 == sub_20D635190() && v19 == v40)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v41 = sub_20D635490();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v41 & 1) == 0)
    {
      v8 = &OBJC_INSTANCE_VARIABLES__TtC14CloudSharingUI13UserInterface;
      LOWORD(v9) = v47;
      goto LABEL_18;
    }
  }
  v8 = &OBJC_INSTANCE_VARIABLES__TtC14CloudSharingUI13UserInterface;
  v42 = objc_msgSend(v7, sel_identifier);
  v43 = sub_20D635190();
  v45 = v44;

  if (!a4)
    goto LABEL_28;
  if (v43 == a3 && v45 == a4)
  {
    swift_bridgeObjectRelease();
    LOWORD(v9) = v47;
    goto LABEL_18;
  }
  v46 = sub_20D635490();
  swift_bridgeObjectRelease();
  LOWORD(v9) = v47;
  if ((v46 & 1) != 0)
    goto LABEL_18;
LABEL_29:
  *(_WORD *)(a6 + 48) = 0;
  result = 0.0;
  *(_OWORD *)(a6 + 16) = 0u;
  *(_OWORD *)(a6 + 32) = 0u;
  *(_OWORD *)a6 = 0u;
  return result;
}

uint64_t sub_20D60EF60(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;
  _OWORD v5[2];
  _OWORD v6[2];
  _OWORD v7[2];
  _OWORD v8[2];

  v2 = a1[1];
  v5[0] = *a1;
  v5[1] = v2;
  v6[0] = a1[2];
  *(_OWORD *)((char *)v6 + 9) = *(_OWORD *)((char *)a1 + 41);
  v3 = a2[1];
  v7[0] = *a2;
  v7[1] = v3;
  v8[0] = a2[2];
  *(_OWORD *)((char *)v8 + 9) = *(_OWORD *)((char *)a2 + 41);
  return sub_20D617AEC((uint64_t)v5, (uint64_t)v7) & 1;
}

uint64_t (*sub_20D60EFC0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_20D60EFFC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 24);
  *a2 = *(_QWORD *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_20D60F0A0()
{
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  swift_bridgeObjectRetain();
  sub_20D634B54();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20D60F15C()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_20D60F204()
{
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B54();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20D60F2B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  *(_QWORD *)(a1 + 16) = a2;
  *(_QWORD *)(a1 + 24) = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void (*sub_20D60F320(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_20D634B78();
  swift_release();
  v4[7] = sub_20D60EFC0();
  return sub_20D60F408;
}

void sub_20D60F408(_QWORD *a1)
{
  sub_20D61014C(a1);
}

uint64_t (*sub_20D60F414())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_20D60F450@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *a1;
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 32);
  v5 = *(_QWORD *)(v3 + 40);
  v6 = *(_QWORD *)(v3 + 48);
  v7 = *(_QWORD *)(v3 + 56);
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v5;
  *(_QWORD *)(a2 + 16) = v6;
  *(_QWORD *)(a2 + 24) = v7;
  *(_BYTE *)(a2 + 32) = *(_BYTE *)(v3 + 64);
  return sub_20D617A08(v4, v5);
}

uint64_t sub_20D60F504(uint64_t a1)
{
  _BYTE v2[40];

  sub_20D61A08C(a1, (uint64_t)v2, &qword_2549BD918);
  swift_getKeyPath();
  sub_20D61A908((uint64_t)v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_20D617A08);
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B54();
  sub_20D61A908((uint64_t)v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_20D617A90);
  return swift_release();
}

uint64_t sub_20D60F5DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  swift_beginAccess();
  v3 = *(_QWORD *)(v1 + 32);
  v4 = *(_QWORD *)(v1 + 40);
  v5 = *(_QWORD *)(v1 + 48);
  v6 = *(_QWORD *)(v1 + 56);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(v1 + 64);
  return sub_20D617A08(v3, v4);
}

uint64_t sub_20D60F690(uint64_t a1)
{
  _BYTE v2[40];

  sub_20D61A08C(a1, (uint64_t)v2, &qword_2549BD918);
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B54();
  sub_20D61A908((uint64_t)v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_20D617A90);
  return swift_release();
}

uint64_t sub_20D60F754(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a1 + 32;
  swift_beginAccess();
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  sub_20D61A08C(a2, v4, &qword_2549BD918);
  sub_20D61A908(a2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_20D617A08);
  return sub_20D617A90(v5, v6);
}

void (*sub_20D60F7FC(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_20D634B78();
  swift_release();
  v4[7] = sub_20D60F414();
  return sub_20D60F8E4;
}

void sub_20D60F8E4(_QWORD *a1)
{
  sub_20D61014C(a1);
}

uint64_t (*sub_20D60F8F0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

__n128 sub_20D60F92C@<Q0>(uint64_t *a1@<X0>, __n128 *a2@<X8>)
{
  uint64_t v3;
  __n128 result;

  v3 = *a1;
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  swift_beginAccess();
  result = *(__n128 *)(v3 + 72);
  *a2 = result;
  return result;
}

uint64_t sub_20D60F9CC()
{
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B54();
  return swift_release();
}

double sub_20D60FA7C()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  swift_beginAccess();
  return *(double *)(v0 + 72);
}

uint64_t sub_20D60FB14()
{
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B54();
  return swift_release();
}

uint64_t sub_20D60FBC8(uint64_t a1, double a2, double a3)
{
  uint64_t result;

  result = swift_beginAccess();
  *(double *)(a1 + 72) = a2;
  *(double *)(a1 + 80) = a3;
  return result;
}

void (*sub_20D60FC1C(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_20D634B78();
  swift_release();
  v4[7] = sub_20D60F8F0();
  return sub_20D60FD04;
}

void sub_20D60FD04(_QWORD *a1)
{
  sub_20D61014C(a1);
}

uint64_t (*sub_20D60FD10())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_20D60FD50@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  swift_beginAccess();
  *a2 = *(_QWORD *)(v3 + 88);
  return swift_bridgeObjectRetain();
}

uint64_t sub_20D60FDF4()
{
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  swift_bridgeObjectRetain();
  sub_20D634B54();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20D60FEAC()
{
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_20D60FF48()
{
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B54();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20D60FFF4(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  *(_QWORD *)(a1 + 88) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void (*sub_20D610058(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  v4[5] = OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel___observationRegistrar;
  *v4 = v2;
  v4[6] = sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  *v4 = v2;
  swift_getKeyPath();
  sub_20D634B78();
  swift_release();
  v4[7] = sub_20D60FD10();
  return sub_20D610140;
}

void sub_20D610140(_QWORD *a1)
{
  sub_20D61014C(a1);
}

void sub_20D61014C(_QWORD *a1)
{
  _QWORD *v1;

  v1 = (_QWORD *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 56))(*a1, 0);
  *v1 = v1[4];
  swift_getKeyPath();
  sub_20D634B6C();
  swift_release();
  free(v1);
}

uint64_t sub_20D6101BC()
{
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  return swift_bridgeObjectRetain();
}

uint64_t sub_20D610244@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  *a2 = *(_QWORD *)(v3 + 152);
  return swift_bridgeObjectRetain();
}

uint64_t sub_20D6102D4()
{
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  swift_bridgeObjectRetain();
  sub_20D634B54();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20D61038C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  v3 = v1 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlert;
  swift_beginAccess();
  return sub_20D61A1BC(v3, a1);
}

uint64_t sub_20D61043C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BD998);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D61A1BC(a2, (uint64_t)v6);
  v7 = a1 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlert;
  swift_beginAccess();
  sub_20D61A204((uint64_t)v6, v7);
  return swift_endAccess();
}

uint64_t sub_20D6104EC()
{
  return sub_20D6108FC((uint64_t)&unk_20D636468, &OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlertBool);
}

uint64_t sub_20D610500(uint64_t result, char a2)
{
  *(_BYTE *)(result + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlertBool) = a2;
  return result;
}

uint64_t sub_20D610510()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__disableGroupWithID);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_20D6105B0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  v4 = *(_QWORD *)(v3 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__disableGroupWithID + 8);
  *a2 = *(_QWORD *)(v3 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__disableGroupWithID);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_20D61064C()
{
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  swift_bridgeObjectRetain();
  sub_20D634B54();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20D610708()
{
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  return swift_bridgeObjectRetain();
}

uint64_t sub_20D610798@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  *a2 = *(_QWORD *)(v3 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__allGroups);
  return swift_bridgeObjectRetain();
}

uint64_t sub_20D610830()
{
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  swift_bridgeObjectRetain();
  sub_20D634B54();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20D6108E8()
{
  return sub_20D6108FC((uint64_t)"ȓ8G", &OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__shouldValidateWithAlert);
}

uint64_t sub_20D6108FC(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  return *(unsigned __int8 *)(v2 + *a2);
}

uint64_t sub_20D610980@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__shouldValidateWithAlert);
  return result;
}

uint64_t sub_20D610A14()
{
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B54();
  return swift_release();
}

id sub_20D610ABC()
{
  uint64_t ObjCClassFromMetadata;
  id result;

  type metadata accessor for SharingOptionsViewModel();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  qword_2549BD8F8 = (uint64_t)result;
  return result;
}

uint64_t SharingOptionsObservableModel.__allocating_init(collaborationOptionsGroups:layoutMargins:userDidChangeOption:contentSizeDidChange:)(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, double a8, double a9)
{
  uint64_t v18;

  v18 = swift_allocObject();
  SharingOptionsObservableModel.init(collaborationOptionsGroups:layoutMargins:userDidChangeOption:contentSizeDidChange:)(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  return v18;
}

uint64_t SharingOptionsObservableModel.init(collaborationOptionsGroups:layoutMargins:userDidChangeOption:contentSizeDidChange:)(unint64_t isUniquelyReferenced_nonNull_native, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, double a8, double a9)
{
  uint64_t v9;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  double *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  unint64_t v49;
  uint64_t v50;
  _BOOL8 v51;
  uint64_t v52;
  char v53;
  unint64_t v54;
  char v55;
  _QWORD *v56;
  uint64_t v57;
  BOOL v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  unint64_t v64;
  unint64_t v65;
  _OWORD *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  unint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char v79;
  uint64_t v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char v87;
  unint64_t v88;
  uint64_t v89;
  unsigned __int8 *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t v103;
  _QWORD *v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD *v107;
  uint64_t result;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  unint64_t v117;
  uint64_t v118;
  unint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  _OWORD v124[2];
  _OWORD v125[2];

  v113 = a5;
  v112 = a4;
  v115 = a3;
  v114 = a2;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BD920);
  MEMORY[0x24BDAC7A8](v15);
  v111 = (char *)&v109 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_BYTE *)(v9 + 64) = 0;
  *(_OWORD *)(v9 + 32) = 0u;
  *(_OWORD *)(v9 + 48) = 0u;
  *(_OWORD *)(v9 + 16) = 0u;
  *(_QWORD *)(v9 + 72) = 0;
  *(_QWORD *)(v9 + 80) = 0;
  *(_OWORD *)(v9 + 96) = 0u;
  *(_OWORD *)(v9 + 112) = 0u;
  *(_BYTE *)(v9 + 128) = 0;
  *(_QWORD *)(v9 + 136) = 0;
  *(_QWORD *)(v9 + 144) = 0;
  v17 = v9 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlert;
  v18 = type metadata accessor for AlertViewModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v17, 1, 1, v18);
  *(_BYTE *)(v9 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlertBool) = 0;
  v19 = (_QWORD *)(v9 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__disableGroupWithID);
  *v19 = 0;
  v19[1] = 0;
  v20 = (_QWORD *)(v9 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__disabledGroupText);
  *v20 = 0;
  v20[1] = 0;
  v110 = OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__shouldValidateWithAlert;
  *(_BYTE *)(v9 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__shouldValidateWithAlert) = 0;
  sub_20D634B84();
  *(_QWORD *)(v9 + 88) = isUniquelyReferenced_nonNull_native;
  v118 = v9;
  v21 = (double *)(v9 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_layoutMargins);
  *v21 = a6;
  v21[1] = a7;
  v21[2] = a8;
  v21[3] = a9;
  *(_QWORD *)&v124[0] = MEMORY[0x24BEE4AF8];
  v117 = isUniquelyReferenced_nonNull_native >> 62;
  if (isUniquelyReferenced_nonNull_native >> 62)
    goto LABEL_32;
  v22 = *(_QWORD *)((isUniquelyReferenced_nonNull_native & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  if (!v22)
    goto LABEL_33;
LABEL_3:
  if (v22 >= 1)
  {
    v23 = 0;
    do
    {
      if ((isUniquelyReferenced_nonNull_native & 0xC000000000000001) != 0)
        v24 = (id)MEMORY[0x212BA50B0](v23, isUniquelyReferenced_nonNull_native);
      else
        v24 = *(id *)(isUniquelyReferenced_nonNull_native + 8 * v23 + 32);
      v25 = v24;
      ++v23;
      v26 = objc_msgSend(v24, sel_options);
      sub_20D61A578(0, &qword_2549BD950);
      v27 = sub_20D6351CC();

      sub_20D615788(v27);
    }
    while (v22 != v23);
    swift_bridgeObjectRelease();
    v28 = *(_QWORD *)&v124[0];
    if (*(_QWORD *)&v124[0] >> 62)
    {
      while (1)
      {
        swift_bridgeObjectRetain_n();
        v29 = sub_20D635448();
        swift_bridgeObjectRelease();
        v116 = v28;
        if (!v29)
          break;
LABEL_11:
        v30 = 0;
        v120 = v28 + 32;
        v31 = (_QWORD *)MEMORY[0x24BEE4B00];
        v119 = isUniquelyReferenced_nonNull_native;
        while (1)
        {
          v32 = v30 + 1;
          if (__OFADD__(v30, 1))
            break;
          v33 = *(id *)(v120 + 8 * v30);
          v34 = objc_msgSend(v33, sel_identifier);
          v122 = sub_20D635190();
          v36 = v35;

          v37 = objc_msgSend(v33, sel_requiredOptionsIdentifiers);
          v38 = sub_20D6351CC();

          v39 = sub_20D635280();
          v123 = v39;
          v40 = *(_QWORD *)(v38 + 16);
          if (v40)
          {
            v121 = v32;
            v41 = v33;
            v42 = v29;
            v43 = v31;
            v44 = (uint64_t *)(v38 + 40);
            do
            {
              v45 = *(v44 - 1);
              v46 = *v44;
              swift_bridgeObjectRetain();
              sub_20D615940((uint64_t *)v124, v45, v46);
              swift_bridgeObjectRelease();
              v44 += 2;
              --v40;
            }
            while (v40);
            swift_bridgeObjectRelease();
            v47 = v123;
            v31 = v43;
            v29 = v42;
            v33 = v41;
            v32 = v121;
          }
          else
          {
            v47 = v39;
            swift_bridgeObjectRelease();
          }
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          *(_QWORD *)&v124[0] = v31;
          v49 = sub_20D615AEC(v122, v36);
          v50 = v31[2];
          v51 = (v48 & 1) == 0;
          v52 = v50 + v51;
          if (__OFADD__(v50, v51))
            goto LABEL_30;
          v53 = v48;
          if (v31[3] >= v52)
          {
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              sub_20D615F20();
          }
          else
          {
            sub_20D615B50(v52, isUniquelyReferenced_nonNull_native);
            v54 = sub_20D615AEC(v122, v36);
            if ((v53 & 1) != (v55 & 1))
              goto LABEL_87;
            v49 = v54;
          }
          isUniquelyReferenced_nonNull_native = v119;
          v31 = *(_QWORD **)&v124[0];
          if ((v53 & 1) != 0)
          {
            *(_QWORD *)(*(_QWORD *)(*(_QWORD *)&v124[0] + 56) + 8 * v49) = v47;
            swift_bridgeObjectRelease();
          }
          else
          {
            *(_QWORD *)(*(_QWORD *)&v124[0] + 8 * (v49 >> 6) + 64) |= 1 << v49;
            v56 = (_QWORD *)(v31[6] + 16 * v49);
            *v56 = v122;
            v56[1] = v36;
            *(_QWORD *)(v31[7] + 8 * v49) = v47;
            v57 = v31[2];
            v58 = __OFADD__(v57, 1);
            v59 = v57 + 1;
            if (v58)
              goto LABEL_31;
            v31[2] = v59;
            swift_bridgeObjectRetain();
          }

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v30 = v32;
          if (v32 == v29)
            goto LABEL_36;
        }
        __break(1u);
LABEL_30:
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        swift_bridgeObjectRetain_n();
        v22 = sub_20D635448();
        if (v22)
          goto LABEL_3;
LABEL_33:
        swift_bridgeObjectRelease();
        v28 = MEMORY[0x24BEE4AF8];
        if (!(MEMORY[0x24BEE4AF8] >> 62))
          goto LABEL_10;
      }
    }
    else
    {
LABEL_10:
      v29 = *(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      v116 = v28;
      if (v29)
        goto LABEL_11;
    }
    v31 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_36:
    swift_bridgeObjectRelease_n();
    *(_QWORD *)(v118 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_optionsDependency) = v31;
    if (v117)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v60 = sub_20D635448();
      swift_bridgeObjectRelease();
      if (v60)
        goto LABEL_38;
    }
    else
    {
      v60 = *(_QWORD *)((isUniquelyReferenced_nonNull_native & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v60)
      {
LABEL_38:
        v123 = MEMORY[0x24BEE4AF8];
        sub_20D61698C(0, v60 & ~(v60 >> 63), 0);
        if (v60 < 0)
          goto LABEL_86;
        v61 = 0;
        v62 = v123;
        do
        {
          if ((isUniquelyReferenced_nonNull_native & 0xC000000000000001) != 0)
            v63 = (id)MEMORY[0x212BA50B0](v61, isUniquelyReferenced_nonNull_native);
          else
            v63 = *(id *)(isUniquelyReferenced_nonNull_native + 8 * v61 + 32);
          sub_20D617DE4(v63, (uint64_t *)v124);
          v123 = v62;
          v65 = *(_QWORD *)(v62 + 16);
          v64 = *(_QWORD *)(v62 + 24);
          if (v65 >= v64 >> 1)
          {
            sub_20D61698C(v64 > 1, v65 + 1, 1);
            v62 = v123;
          }
          ++v61;
          *(_QWORD *)(v62 + 16) = v65 + 1;
          v66 = (_OWORD *)(v62 + (v65 << 6));
          v67 = v124[0];
          v68 = v124[1];
          v69 = v125[0];
          *(_OWORD *)((char *)v66 + 73) = *(_OWORD *)((char *)v125 + 9);
          v66[3] = v68;
          v66[4] = v69;
          v66[2] = v67;
        }
        while (v60 != v61);
        swift_bridgeObjectRelease();
        goto LABEL_49;
      }
    }
    swift_bridgeObjectRelease();
    v62 = MEMORY[0x24BEE4AF8];
LABEL_49:
    *(_QWORD *)(v118 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__allGroups) = v62;
    v70 = *(_QWORD *)(v62 + 16);
    if (!v70)
    {
      swift_bridgeObjectRetain();
LABEL_81:
      v97 = v118;
      v98 = (uint64_t *)(v118 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_userDidChangeOption);
      v99 = v114;
      v100 = v115;
      *v98 = v114;
      v98[1] = v100;
      v101 = (uint64_t *)(v97 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_contentSizeDidChange);
      v102 = v112;
      v103 = v113;
      *v101 = v112;
      v101[1] = v103;
      sub_20D6187C4(v99);
      sub_20D6187C4(v102);
      v104 = sub_20D61861C(v62, (uint64_t)v31);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v97 + 152) = v104;
      v105 = sub_20D635238();
      v106 = (uint64_t)v111;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v105 - 8) + 56))(v111, 1, 1, v105);
      v107 = (_QWORD *)swift_allocObject();
      v107[2] = 0;
      v107[3] = 0;
      v107[4] = v97;
      swift_retain();
      sub_20D611758(v106, (uint64_t)&unk_2549BD980, (uint64_t)v107);
      sub_20D618880(v102);
      sub_20D618880(v99);
      swift_release();
      return v97;
    }
    v122 = *MEMORY[0x24BDB8FA8];
    swift_bridgeObjectRetain_n();
    v71 = (unint64_t *)(v62 + 80);
    while (1)
    {
      v73 = *(v71 - 6);
      v72 = *(v71 - 5);
      v74 = *(v71 - 3);
      v76 = *(v71 - 1);
      v75 = *v71;
      if (v73 == sub_20D635190() && v72 == v77)
        break;
      v79 = sub_20D635490();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if ((v79 & 1) != 0)
        goto LABEL_60;
      v71 += 8;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!--v70)
        goto LABEL_80;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
LABEL_60:
    swift_bridgeObjectRelease();
    v80 = *(_QWORD *)(v75 + 16);
    if (!v80)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_80:
      swift_bridgeObjectRelease();
      goto LABEL_81;
    }
    v109 = v74;
    v116 = v76;
    v122 = *MEMORY[0x24BDB8F68];
    swift_bridgeObjectRetain_n();
    v117 = v75;
    v81 = (uint64_t *)(v75 + 40);
    v120 = v80;
    v82 = v80;
    while (1)
    {
      v84 = *(v81 - 1);
      v83 = *v81;
      if (v84 == sub_20D635190() && v83 == v85)
        break;
      v87 = sub_20D635490();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if ((v87 & 1) != 0)
        goto LABEL_71;
      v81 += 7;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!--v82)
      {
LABEL_79:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        goto LABEL_80;
      }
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
LABEL_71:
    v88 = v117;
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v121 = *MEMORY[0x24BDB8F60];
    swift_bridgeObjectRetain_n();
    v89 = 0;
    v90 = (unsigned __int8 *)(v88 + 80);
    while (1)
    {
      v91 = v89 + 1;
      if (__OFADD__(v89, 1))
        break;
      v93 = *((_QWORD *)v90 - 6);
      v92 = *((_QWORD *)v90 - 5);
      v122 = *((_QWORD *)v90 - 3);
      LODWORD(v119) = *v90;
      if (v93 == sub_20D635190() && v92 == v94)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
LABEL_83:
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        *(_BYTE *)(v118 + v110) = (_DWORD)v119 == 0;
        goto LABEL_81;
      }
      v96 = sub_20D635490();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if ((v96 & 1) != 0)
        goto LABEL_83;
      v90 += 56;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      ++v89;
      if (v91 == v120)
        goto LABEL_79;
    }
    __break(1u);
  }
  __break(1u);
LABEL_86:
  __break(1u);
LABEL_87:
  result = sub_20D6354B4();
  __break(1u);
  return result;
}

uint64_t sub_20D6116F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_20D611708()
{
  uint64_t v0;

  sub_20D634B48();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D611758(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_20D635238();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_20D63522C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_20D61A7A8(a1, &qword_2549BD920);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_20D6351FC();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t SharingOptionsObservableModel.__allocating_init(collaborationOptionsGroups:userDidChangeOption:)(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  SharingOptionsObservableModel.init(collaborationOptionsGroups:userDidChangeOption:)(a1, a2, a3);
  return v6;
}

uint64_t SharingOptionsObservableModel.init(collaborationOptionsGroups:userDidChangeOption:)(unint64_t isUniquelyReferenced_nonNull_native, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _OWORD *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  unint64_t v38;
  uint64_t v39;
  _BOOL8 v40;
  uint64_t v41;
  char v42;
  unint64_t v43;
  char v44;
  _QWORD *v45;
  uint64_t v46;
  BOOL v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  unint64_t v53;
  unint64_t v54;
  _OWORD *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  uint64_t result;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _OWORD v80[2];
  _OWORD v81[2];

  v71 = a2;
  v72 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BD920);
  MEMORY[0x24BDAC7A8](v5);
  v70 = (char *)&v69 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_BYTE *)(v3 + 64) = 0;
  *(_OWORD *)(v3 + 32) = 0u;
  *(_OWORD *)(v3 + 48) = 0u;
  *(_OWORD *)(v3 + 16) = 0u;
  *(_QWORD *)(v3 + 72) = 0;
  *(_QWORD *)(v3 + 80) = 0;
  *(_OWORD *)(v3 + 96) = 0u;
  *(_OWORD *)(v3 + 112) = 0u;
  *(_BYTE *)(v3 + 128) = 0;
  *(_QWORD *)(v3 + 136) = 0;
  *(_QWORD *)(v3 + 144) = 0;
  v7 = v3 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlert;
  v8 = type metadata accessor for AlertViewModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  *(_BYTE *)(v3 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlertBool) = 0;
  v9 = (_QWORD *)(v3 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__disableGroupWithID);
  *v9 = 0;
  v9[1] = 0;
  v10 = (_QWORD *)(v3 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__disabledGroupText);
  *v10 = 0;
  v10[1] = 0;
  *(_BYTE *)(v3 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__shouldValidateWithAlert) = 0;
  sub_20D634B84();
  *(_QWORD *)(v3 + 88) = isUniquelyReferenced_nonNull_native;
  v74 = v3;
  v11 = (_OWORD *)(v3 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_layoutMargins);
  *v11 = 0u;
  v11[1] = 0u;
  *(_QWORD *)&v80[0] = MEMORY[0x24BEE4AF8];
  v73 = isUniquelyReferenced_nonNull_native >> 62;
  if (isUniquelyReferenced_nonNull_native >> 62)
    goto LABEL_32;
  v12 = *(_QWORD *)((isUniquelyReferenced_nonNull_native & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  if (!v12)
    goto LABEL_33;
LABEL_3:
  if (v12 < 1)
  {
    __break(1u);
    goto LABEL_51;
  }
  v13 = 0;
  do
  {
    if ((isUniquelyReferenced_nonNull_native & 0xC000000000000001) != 0)
      v14 = (id)MEMORY[0x212BA50B0](v13, isUniquelyReferenced_nonNull_native);
    else
      v14 = *(id *)(isUniquelyReferenced_nonNull_native + 8 * v13 + 32);
    v15 = v14;
    ++v13;
    v16 = objc_msgSend(v14, sel_options, v69);
    sub_20D61A578(0, &qword_2549BD950);
    v17 = sub_20D6351CC();

    sub_20D615788(v17);
  }
  while (v12 != v13);
  swift_bridgeObjectRelease();
  v18 = *(_QWORD *)&v80[0];
  if (*(_QWORD *)&v80[0] >> 62)
  {
    while (1)
    {
      swift_bridgeObjectRetain_n();
      v19 = sub_20D635448();
      swift_bridgeObjectRelease();
      v69 = v18;
      if (!v19)
        break;
LABEL_11:
      v20 = 0;
      v76 = v18 + 32;
      v21 = (_QWORD *)MEMORY[0x24BEE4B00];
      v75 = isUniquelyReferenced_nonNull_native;
      while (1)
      {
        v22 = v20 + 1;
        if (__OFADD__(v20, 1))
          break;
        v23 = *(id *)(v76 + 8 * v20);
        v24 = objc_msgSend(v23, sel_identifier);
        v78 = sub_20D635190();
        v26 = v25;

        v27 = objc_msgSend(v23, sel_requiredOptionsIdentifiers);
        v28 = sub_20D6351CC();

        v29 = sub_20D635280();
        v79 = v29;
        v30 = *(_QWORD *)(v28 + 16);
        if (v30)
        {
          v77 = v22;
          v31 = v23;
          v32 = v19;
          v33 = (uint64_t *)(v28 + 40);
          do
          {
            v34 = *(v33 - 1);
            v35 = *v33;
            swift_bridgeObjectRetain();
            sub_20D615940((uint64_t *)v80, v34, v35);
            swift_bridgeObjectRelease();
            v33 += 2;
            --v30;
          }
          while (v30);
          swift_bridgeObjectRelease();
          v36 = v79;
          v19 = v32;
          v23 = v31;
          v22 = v77;
        }
        else
        {
          v36 = v29;
          swift_bridgeObjectRelease();
        }
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(_QWORD *)&v80[0] = v21;
        v38 = sub_20D615AEC(v78, v26);
        v39 = v21[2];
        v40 = (v37 & 1) == 0;
        v41 = v39 + v40;
        if (__OFADD__(v39, v40))
          goto LABEL_30;
        v42 = v37;
        if (v21[3] >= v41)
        {
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            sub_20D615F20();
        }
        else
        {
          sub_20D615B50(v41, isUniquelyReferenced_nonNull_native);
          v43 = sub_20D615AEC(v78, v26);
          if ((v42 & 1) != (v44 & 1))
            goto LABEL_52;
          v38 = v43;
        }
        isUniquelyReferenced_nonNull_native = v75;
        v21 = *(_QWORD **)&v80[0];
        if ((v42 & 1) != 0)
        {
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)&v80[0] + 56) + 8 * v38) = v36;
          swift_bridgeObjectRelease();
        }
        else
        {
          *(_QWORD *)(*(_QWORD *)&v80[0] + 8 * (v38 >> 6) + 64) |= 1 << v38;
          v45 = (_QWORD *)(v21[6] + 16 * v38);
          *v45 = v78;
          v45[1] = v26;
          *(_QWORD *)(v21[7] + 8 * v38) = v36;
          v46 = v21[2];
          v47 = __OFADD__(v46, 1);
          v48 = v46 + 1;
          if (v47)
            goto LABEL_31;
          v21[2] = v48;
          swift_bridgeObjectRetain();
        }

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v20 = v22;
        if (v22 == v19)
          goto LABEL_36;
      }
      __break(1u);
LABEL_30:
      __break(1u);
LABEL_31:
      __break(1u);
LABEL_32:
      swift_bridgeObjectRetain_n();
      v12 = sub_20D635448();
      if (v12)
        goto LABEL_3;
LABEL_33:
      swift_bridgeObjectRelease();
      v18 = MEMORY[0x24BEE4AF8];
      if (!(MEMORY[0x24BEE4AF8] >> 62))
        goto LABEL_10;
    }
  }
  else
  {
LABEL_10:
    v19 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    v69 = v18;
    if (v19)
      goto LABEL_11;
  }
  v21 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_36:
  swift_bridgeObjectRelease_n();
  *(_QWORD *)(v74 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_optionsDependency) = v21;
  if (!v73)
  {
    v49 = *(_QWORD *)((isUniquelyReferenced_nonNull_native & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v49)
      goto LABEL_38;
LABEL_48:
    swift_bridgeObjectRelease();
    v51 = MEMORY[0x24BEE4AF8];
LABEL_49:
    v59 = v74;
    *(_QWORD *)(v74 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__allGroups) = v51;
    v60 = (uint64_t *)(v59 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_userDidChangeOption);
    v62 = v71;
    v61 = v72;
    *v60 = v71;
    v60[1] = v61;
    v63 = (_QWORD *)(v59 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_contentSizeDidChange);
    *v63 = 0;
    v63[1] = 0;
    swift_bridgeObjectRetain();
    sub_20D6187C4(v62);
    v64 = sub_20D61861C(v51, (uint64_t)v21);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *(_QWORD *)(v59 + 152) = v64;
    v65 = sub_20D635238();
    v66 = (uint64_t)v70;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v65 - 8) + 56))(v70, 1, 1, v65);
    v67 = (_QWORD *)swift_allocObject();
    v67[2] = 0;
    v67[3] = 0;
    v67[4] = v59;
    swift_retain();
    sub_20D611758(v66, (uint64_t)&unk_2549BD990, (uint64_t)v67);
    sub_20D618880(v62);
    swift_release();
    return v59;
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v49 = sub_20D635448();
  swift_bridgeObjectRelease();
  if (!v49)
    goto LABEL_48;
LABEL_38:
  v79 = MEMORY[0x24BEE4AF8];
  sub_20D61698C(0, v49 & ~(v49 >> 63), 0);
  if ((v49 & 0x8000000000000000) == 0)
  {
    v50 = 0;
    v51 = v79;
    do
    {
      if ((isUniquelyReferenced_nonNull_native & 0xC000000000000001) != 0)
        v52 = (id)MEMORY[0x212BA50B0](v50, isUniquelyReferenced_nonNull_native);
      else
        v52 = *(id *)(isUniquelyReferenced_nonNull_native + 8 * v50 + 32);
      sub_20D617DE4(v52, (uint64_t *)v80);
      v79 = v51;
      v54 = *(_QWORD *)(v51 + 16);
      v53 = *(_QWORD *)(v51 + 24);
      if (v54 >= v53 >> 1)
      {
        sub_20D61698C(v53 > 1, v54 + 1, 1);
        v51 = v79;
      }
      ++v50;
      *(_QWORD *)(v51 + 16) = v54 + 1;
      v55 = (_OWORD *)(v51 + (v54 << 6));
      v56 = v80[0];
      v57 = v80[1];
      v58 = v81[0];
      *(_OWORD *)((char *)v55 + 73) = *(_OWORD *)((char *)v81 + 9);
      v55[3] = v57;
      v55[4] = v58;
      v55[2] = v56;
    }
    while (v49 != v50);
    swift_bridgeObjectRelease();
    goto LABEL_49;
  }
LABEL_51:
  __break(1u);
LABEL_52:
  result = sub_20D6354B4();
  __break(1u);
  return result;
}

uint64_t sub_20D612038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_20D612050()
{
  uint64_t v0;

  sub_20D634B48();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_20D6120A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, unint64_t a6, uint64_t a7, uint64_t a8, void (*a9)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, id))
{
  void *v14;
  id v15;
  unint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v25;

  sub_20D61A578(0, (unint64_t *)&qword_2549BDDB8);
  v14 = (void *)sub_20D6351C0();
  v15 = CSCKSharingSummaryStringFromOptionsGroups();

  if (v15)
  {
    sub_20D635190();

    if (!(a6 >> 62))
      goto LABEL_7;
    sub_20D61A578(0, &qword_2549BDDC0);
LABEL_17:
    swift_bridgeObjectRetain();
    sub_20D63543C();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  v16 = a6 >> 62;
  if (!a8)
  {
    if (v16)
    {
      sub_20D61A578(0, &qword_2549BDDC0);
      swift_bridgeObjectRetain();
      sub_20D63543C();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRetain();
      sub_20D63549C();
      sub_20D61A578(0, &qword_2549BDDC0);
    }
    v22 = objc_allocWithZone(MEMORY[0x24BDE9790]);
    sub_20D61A578(0, &qword_2549BDDC0);
    v19 = (void *)sub_20D6351C0();
    swift_bridgeObjectRelease();
    v25 = objc_msgSend(v22, sel_initWithOptionsGroups_, v19);
    goto LABEL_9;
  }
  if (v16)
  {
    sub_20D61A578(0, &qword_2549BDDC0);
    swift_bridgeObjectRetain();
    goto LABEL_17;
  }
  swift_bridgeObjectRetain();
LABEL_7:
  swift_bridgeObjectRetain();
  sub_20D63549C();
  sub_20D61A578(0, &qword_2549BDDC0);
LABEL_8:
  v17 = objc_allocWithZone(MEMORY[0x24BDE9790]);
  sub_20D61A578(0, &qword_2549BDDC0);
  v18 = (void *)sub_20D6351C0();
  swift_bridgeObjectRelease();
  v19 = (void *)sub_20D635160();
  swift_bridgeObjectRelease();
  v25 = objc_msgSend(v17, sel_initWithOptionsGroups_summary_, v18, v19);

LABEL_9:
  v20 = v25;
  if (a9)
  {
    v21 = v25;
    a9(a1, a2, a3, a4, a5 & 1, v25);

    v20 = v25;
  }

}

uint64_t SharingOptionsObservableModel.__allocating_init(collaborationShareOptions:userDidChangeOption:)(void *a1, uint64_t a2, uint64_t a3)
{
  return _s14CloudSharingUI0B22OptionsObservableModelC018collaborationShareD013layoutMargins19userDidChangeOption011contentSizelM0ACSo016_SWCollaborationhD0CSg_05SwiftC010EdgeInsetsVySS_SSSbAJtcSgySo6CGSizeVcSgtcfC_0(a1, a2, a3, 0, 0, 0.0, 0.0, 0.0, 0.0);
}

uint64_t sub_20D6123E8()
{
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  swift_bridgeObjectRetain();
  sub_20D634B54();
  swift_release();
  return swift_bridgeObjectRelease();
}

id sub_20D6124A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[2];
  uint64_t v18;
  uint64_t v19;

  v1 = sub_20D634BB4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  v19 = v0;
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  swift_beginAccess();
  v5 = *(_QWORD *)(v0 + 24);
  v6 = 0x24BEBD000uLL;
  if (!v5)
    return objc_msgSend(objc_allocWithZone(*(Class *)(v6 + 1600)), sel_init);
  v7 = *(_QWORD *)(v0 + 16);
  v8 = (void *)objc_opt_self();
  swift_bridgeObjectRetain();
  v9 = (void *)sub_20D635160();
  v10 = objc_msgSend(v8, sel__applicationIconImageForBundleIdentifier_format_, v9, 1);

  if (!v10)
  {
    sub_20D634B9C();
    swift_bridgeObjectRetain();
    v11 = sub_20D634BA8();
    v12 = sub_20D63528C();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      v18 = v14;
      *(_DWORD *)v13 = 136315138;
      v17[0] = v13 + 4;
      swift_bridgeObjectRetain();
      v17[1] = sub_20D62C034(v7, v5, &v18);
      sub_20D63537C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_20D60A000, v11, v12, "Failed to get appIcon for %s", v13, 0xCu);
      swift_arrayDestroy();
      v15 = v14;
      v6 = 9863680000;
      MEMORY[0x212BA56C8](v15, -1, -1);
      MEMORY[0x212BA56C8](v13, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return objc_msgSend(objc_allocWithZone(*(Class *)(v6 + 1600)), sel_init);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_20D612750(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, __int128 *a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  char v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t (**v44)();
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t (*v52)();
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t (**v57)();
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  int *v70;
  uint64_t *v71;
  uint64_t *v72;
  uint64_t KeyPath;
  uint64_t v74;
  uint64_t v76;
  _BYTE v77[12];
  int v78;
  uint64_t v79;
  void (*v80)(_BYTE *, _QWORD, uint64_t, uint64_t);
  _BYTE *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _BYTE *v85;
  _BYTE *v86;
  uint64_t v87;
  __int128 v88;
  uint64_t v89;
  uint64_t v90;
  __int128 v91;
  uint64_t v92;
  uint64_t v93;
  char v94;
  _QWORD v95[2];
  __int128 v96;
  __int128 v97;
  __int128 v98;
  char v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  char v103;

  v9 = v8;
  v90 = a6;
  v89 = a4;
  v87 = a3;
  *((_QWORD *)&v88 + 1) = a2;
  *(_QWORD *)&v88 = a1;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BD998);
  MEMORY[0x24BDAC7A8](v13);
  v85 = &v77[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = (int *)type metadata accessor for AlertViewModelButton(0);
  v82 = *((_QWORD *)v15 - 1);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = &v77[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v16);
  v86 = &v77[-v19];
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDD98);
  MEMORY[0x24BDAC7A8](v20);
  v22 = &v77[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v23 = a8[1];
  v100 = *a8;
  v101 = v23;
  v102 = a8[2];
  v103 = *((_BYTE *)a8 + 48);
  swift_getKeyPath();
  v24 = v9 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel___observationRegistrar;
  *(_QWORD *)&v96 = v9;
  v83 = sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  v84 = v24;
  sub_20D634B60();
  swift_release();
  if (*(_BYTE *)(v9 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__shouldValidateWithAlert) != 1)
    goto LABEL_13;
  if (sub_20D635190() == v90 && v25 == a7)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v26 = sub_20D635490();
    swift_bridgeObjectRelease();
    if ((v26 & 1) == 0)
      goto LABEL_13;
  }
  v96 = v88;
  *(_QWORD *)&v97 = v87;
  *((_QWORD *)&v97 + 1) = v89;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDDB0);
  MEMORY[0x212BA4D5C](&v91, v27);
  v28 = v91;
  if ((_QWORD)v28 != sub_20D635190() || *((_QWORD *)&v28 + 1) != v29)
  {
    v30 = sub_20D635490();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v30 & 1) != 0)
      goto LABEL_10;
LABEL_13:
    v96 = v100;
    v97 = v101;
    v98 = v102;
    v99 = v103;
    v91 = v88;
    v92 = v87;
    v93 = v89;
    sub_20D61A01C((uint64_t)&v100);
    swift_bridgeObjectRetain();
    v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDDB0);
    MEMORY[0x212BA4D5C](v95, v76);
    *(_QWORD *)&v91 = v90;
    *((_QWORD *)&v91 + 1) = a7;
    v92 = v95[0];
    v93 = v95[1];
    v94 = a5 & 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDDA0);
    sub_20D635088();
    return sub_20D61A264((uint64_t)&v100);
  }
  swift_bridgeObjectRelease_n();
LABEL_10:
  v81 = v18;
  sub_20D634DF4();
  if (qword_2549BD8F0 != -1)
    swift_once();
  v31 = (id)qword_2549BD8F8;
  v32 = sub_20D634F20();
  v79 = v33;
  v78 = v34;
  v36 = v35;
  sub_20D634C68();
  v37 = sub_20D634C80();
  v80 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 56);
  v80(v22, 0, 1, v37);
  v38 = swift_allocObject();
  swift_weakInit();
  v39 = swift_allocObject();
  *(_QWORD *)(v39 + 16) = v38;
  v40 = v101;
  *(_OWORD *)(v39 + 24) = v100;
  *(_OWORD *)(v39 + 40) = v40;
  *(_OWORD *)(v39 + 56) = v102;
  *(_BYTE *)(v39 + 72) = v103;
  *(_QWORD *)(v39 + 80) = v90;
  *(_QWORD *)(v39 + 88) = a7;
  swift_retain();
  sub_20D61A01C((uint64_t)&v100);
  swift_bridgeObjectRetain();
  v41 = (uint64_t)v81;
  sub_20D634B30();
  v42 = v41 + v15[5];
  v43 = v79;
  *(_QWORD *)v42 = v32;
  *(_QWORD *)(v42 + 8) = v43;
  *(_BYTE *)(v42 + 16) = v78 & 1;
  *(_QWORD *)(v42 + 24) = v36;
  sub_20D61A08C((uint64_t)v22, v41 + v15[6], &qword_2549BDD98);
  swift_release();
  v44 = (uint64_t (**)())(v41 + v15[7]);
  *v44 = sub_20D61B028;
  v44[1] = (uint64_t (*)())v39;
  sub_20D634DF4();
  v45 = (id)qword_2549BD8F8;
  v46 = sub_20D634F20();
  v48 = v47;
  LOBYTE(v38) = v49;
  v90 = v50;
  sub_20D634C74();
  v80(v22, 0, 1, v37);
  v51 = swift_allocObject();
  swift_weakInit();
  v52 = (uint64_t (*)())swift_allocObject();
  *((_QWORD *)v52 + 2) = v51;
  v53 = *((_QWORD *)&v88 + 1);
  *((_QWORD *)v52 + 3) = v88;
  *((_QWORD *)v52 + 4) = v53;
  v54 = v89;
  *((_QWORD *)v52 + 5) = v87;
  *((_QWORD *)v52 + 6) = v54;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  v55 = (uint64_t)v86;
  sub_20D634B30();
  v56 = v55 + v15[5];
  *(_QWORD *)v56 = v46;
  *(_QWORD *)(v56 + 8) = v48;
  *(_BYTE *)(v56 + 16) = v38 & 1;
  *(_QWORD *)(v56 + 24) = v90;
  sub_20D61A08C((uint64_t)v22, v55 + v15[6], &qword_2549BDD98);
  swift_release();
  v57 = (uint64_t (**)())(v55 + v15[7]);
  *v57 = sub_20D61A360;
  v57[1] = v52;
  v58 = sub_20D634AA0();
  v60 = v59;
  v61 = sub_20D634AA0();
  v63 = v62;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDDA8);
  v64 = *(_QWORD *)(v82 + 72);
  v65 = (*(unsigned __int8 *)(v82 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v82 + 80);
  v66 = swift_allocObject();
  *(_OWORD *)(v66 + 16) = xmmword_20D635FF0;
  v67 = v66 + v65;
  v68 = (uint64_t)v81;
  sub_20D61A0FC((uint64_t)v81, v67);
  sub_20D61A0FC(v55, v67 + v64);
  v69 = (uint64_t)v85;
  sub_20D634B30();
  v70 = (int *)type metadata accessor for AlertViewModel(0);
  v71 = (uint64_t *)(v69 + v70[5]);
  *v71 = v58;
  v71[1] = v60;
  v72 = (uint64_t *)(v69 + v70[6]);
  *v72 = v61;
  v72[1] = v63;
  *(_QWORD *)(v69 + v70[7]) = v66;
  (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(*((_QWORD *)v70 - 1) + 56))(v69, 0, 1, v70);
  KeyPath = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](KeyPath);
  *(_QWORD *)&v96 = v9;
  sub_20D634B54();
  swift_release();
  sub_20D61A7A8(v69, &qword_2549BD998);
  v74 = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](v74);
  *(_QWORD *)&v96 = v9;
  sub_20D634B54();
  swift_release();
  sub_20D61A180(v55);
  return sub_20D61A180(v68);
}

uint64_t sub_20D613108()
{
  uint64_t Strong;
  uint64_t result;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  result = swift_release();
  if (Strong)
  {
    sub_20D635190();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDDB0);
    return sub_20D635088();
  }
  return result;
}

uint64_t sub_20D6131AC(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, __int128 *a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  char v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  int *v40;
  _BYTE *v41;
  uint64_t (**v42)();
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  _BYTE *v53;
  _BYTE *v54;
  uint64_t (**v55)();
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int *v69;
  uint64_t *v70;
  uint64_t *v71;
  uint64_t KeyPath;
  uint64_t v73;
  _BYTE v75[12];
  int v76;
  uint64_t v77;
  void (*v78)(_BYTE *, _QWORD, uint64_t, uint64_t);
  _BYTE *v79;
  uint64_t v80;
  _BYTE *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _BYTE *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  char v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  char v98;

  v7 = v6;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BD998);
  MEMORY[0x24BDAC7A8](v14);
  v85 = &v75[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v80 = type metadata accessor for AlertViewModelButton(0);
  v82 = *(_QWORD *)(v80 - 8);
  v16 = MEMORY[0x24BDAC7A8](v80);
  v18 = &v75[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v16);
  v81 = &v75[-v19];
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDD98);
  MEMORY[0x24BDAC7A8](v20);
  v22 = &v75[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v23 = a6[1];
  v95 = *a6;
  v24 = a6[2];
  v96 = v23;
  v97 = v24;
  v98 = *((_BYTE *)a6 + 48);
  swift_getKeyPath();
  v25 = v7 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel___observationRegistrar;
  *(_QWORD *)&v91 = v7;
  v83 = sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  v84 = v25;
  sub_20D634B60();
  swift_release();
  if (*(_BYTE *)(v7 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__shouldValidateWithAlert) != 1)
    goto LABEL_13;
  if (sub_20D635190() == a4 && v26 == a5)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    v27 = sub_20D635490();
    swift_bridgeObjectRelease();
    if ((v27 & 1) == 0)
      goto LABEL_13;
  }
  if (sub_20D635190() != a1 || v28 != a2)
  {
    v29 = sub_20D635490();
    swift_bridgeObjectRelease();
    if ((v29 & 1) != 0)
      goto LABEL_10;
LABEL_13:
    v91 = v95;
    v92 = v96;
    v93 = v97;
    v94 = v98;
    v86 = a4;
    v87 = a5;
    v88 = a1;
    v89 = a2;
    v90 = a3 & 1;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDDA0);
    return sub_20D635088();
  }
  swift_bridgeObjectRelease();
LABEL_10:
  sub_20D634DF4();
  if (qword_2549BD8F0 != -1)
    swift_once();
  v30 = (id)qword_2549BD8F8;
  v31 = sub_20D634F20();
  v33 = v32;
  v76 = v34;
  v79 = (_BYTE *)v35;
  sub_20D634C68();
  v36 = sub_20D634C80();
  v78 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v36 - 8) + 56);
  v78(v22, 0, 1, v36);
  v37 = swift_allocObject();
  swift_weakInit();
  v38 = swift_allocObject();
  *(_QWORD *)(v38 + 16) = v37;
  *(_OWORD *)(v38 + 24) = v95;
  v39 = v97;
  *(_OWORD *)(v38 + 40) = v96;
  *(_OWORD *)(v38 + 56) = v39;
  *(_BYTE *)(v38 + 72) = v98;
  v77 = a4;
  *(_QWORD *)(v38 + 80) = a4;
  *(_QWORD *)(v38 + 88) = a5;
  swift_retain();
  sub_20D61A01C((uint64_t)&v95);
  swift_bridgeObjectRetain();
  sub_20D634B30();
  v40 = (int *)v80;
  v41 = &v18[*(int *)(v80 + 20)];
  *(_QWORD *)v41 = v31;
  *((_QWORD *)v41 + 1) = v33;
  v41[16] = v76 & 1;
  *((_QWORD *)v41 + 3) = v79;
  sub_20D61A08C((uint64_t)v22, (uint64_t)&v18[v40[6]], &qword_2549BDD98);
  swift_release();
  v42 = (uint64_t (**)())&v18[v40[7]];
  *v42 = sub_20D619FF4;
  v42[1] = (uint64_t (*)())v38;
  sub_20D634DF4();
  v79 = v18;
  v43 = (id)qword_2549BD8F8;
  v44 = sub_20D634F20();
  v46 = v45;
  LOBYTE(v37) = v47;
  v49 = v48;
  sub_20D634C74();
  v78(v22, 0, 1, v36);
  v50 = swift_allocObject();
  swift_weakInit();
  v51 = swift_allocObject();
  *(_QWORD *)(v51 + 16) = v50;
  *(_OWORD *)(v51 + 24) = v95;
  v52 = v97;
  *(_OWORD *)(v51 + 40) = v96;
  *(_OWORD *)(v51 + 56) = v52;
  *(_BYTE *)(v51 + 72) = v98;
  *(_QWORD *)(v51 + 80) = v77;
  *(_QWORD *)(v51 + 88) = a5;
  sub_20D61A01C((uint64_t)&v95);
  swift_bridgeObjectRetain();
  swift_retain();
  v53 = v81;
  sub_20D634B30();
  v54 = &v53[v40[5]];
  *(_QWORD *)v54 = v44;
  *((_QWORD *)v54 + 1) = v46;
  v54[16] = v37 & 1;
  *((_QWORD *)v54 + 3) = v49;
  sub_20D61A08C((uint64_t)v22, (uint64_t)&v53[v40[6]], &qword_2549BDD98);
  swift_release();
  v55 = (uint64_t (**)())&v53[v40[7]];
  v56 = (uint64_t)v53;
  *v55 = sub_20D61A0D4;
  v55[1] = (uint64_t (*)())v51;
  v57 = sub_20D634AA0();
  v59 = v58;
  v60 = sub_20D634AA0();
  v62 = v61;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDDA8);
  v63 = *(_QWORD *)(v82 + 72);
  v64 = (*(unsigned __int8 *)(v82 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v82 + 80);
  v65 = swift_allocObject();
  *(_OWORD *)(v65 + 16) = xmmword_20D635FF0;
  v66 = v65 + v64;
  v67 = (uint64_t)v79;
  sub_20D61A0FC((uint64_t)v79, v66);
  sub_20D61A0FC(v56, v66 + v63);
  v68 = (uint64_t)v85;
  sub_20D634B30();
  v69 = (int *)type metadata accessor for AlertViewModel(0);
  v70 = (uint64_t *)(v68 + v69[5]);
  *v70 = v57;
  v70[1] = v59;
  v71 = (uint64_t *)(v68 + v69[6]);
  *v71 = v60;
  v71[1] = v62;
  *(_QWORD *)(v68 + v69[7]) = v65;
  (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(*((_QWORD *)v69 - 1) + 56))(v68, 0, 1, v69);
  KeyPath = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](KeyPath);
  *(_QWORD *)&v91 = v7;
  sub_20D634B54();
  swift_release();
  sub_20D61A7A8(v68, &qword_2549BD998);
  v73 = swift_getKeyPath();
  MEMORY[0x24BDAC7A8](v73);
  *(_QWORD *)&v91 = v7;
  sub_20D634B54();
  swift_release();
  sub_20D61A180(v56);
  return sub_20D61A180(v67);
}

uint64_t sub_20D613A70()
{
  uint64_t Strong;
  uint64_t result;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  result = swift_release();
  if (Strong)
  {
    sub_20D635190();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDDA0);
    return sub_20D635088();
  }
  return result;
}

uint64_t sub_20D613B30(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t result;
  int64_t i;
  unint64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  BOOL v29;
  int64_t v30;
  uint64_t v31;
  uint64_t v32;

  if (*(_QWORD *)(a1 + 16) < *(_QWORD *)(a2 + 16))
    return 0;
  v3 = a2;
  v4 = a1;
  v31 = a2 + 56;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  if (-v5 < 64)
    v6 = ~(-1 << -(char)v5);
  else
    v6 = -1;
  v7 = v6 & *(_QWORD *)(a2 + 56);
  v30 = (unint64_t)(63 - v5) >> 6;
  v32 = a1 + 56;
  result = swift_bridgeObjectRetain();
  for (i = 0; ; i = v12)
  {
    if (v7)
    {
      v10 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v11 = v10 | (i << 6);
      v12 = i;
      if (!*(_QWORD *)(v4 + 16))
        goto LABEL_40;
      goto LABEL_25;
    }
    v13 = i + 1;
    if (__OFADD__(i, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v13 >= v30)
      goto LABEL_41;
    v14 = *(_QWORD *)(v31 + 8 * v13);
    v12 = i + 1;
    if (!v14)
    {
      v12 = i + 2;
      if (i + 2 >= v30)
        goto LABEL_41;
      v14 = *(_QWORD *)(v31 + 8 * v12);
      if (!v14)
      {
        v12 = i + 3;
        if (i + 3 >= v30)
          goto LABEL_41;
        v14 = *(_QWORD *)(v31 + 8 * v12);
        if (!v14)
          break;
      }
    }
LABEL_24:
    v7 = (v14 - 1) & v14;
    v11 = __clz(__rbit64(v14)) + (v12 << 6);
    if (!*(_QWORD *)(v4 + 16))
    {
LABEL_40:
      v2 = 0;
      goto LABEL_42;
    }
LABEL_25:
    v16 = v3;
    v17 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v11);
    v19 = *v17;
    v18 = v17[1];
    sub_20D6354CC();
    swift_bridgeObjectRetain();
    sub_20D63519C();
    v20 = sub_20D6354F0();
    v21 = v4;
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = v20 & ~v22;
    if (((*(_QWORD *)(v32 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
      goto LABEL_39;
    v24 = *(_QWORD *)(v21 + 48);
    v25 = (_QWORD *)(v24 + 16 * v23);
    v26 = *v25 == v19 && v25[1] == v18;
    if (!v26 && (sub_20D635490() & 1) == 0)
    {
      v27 = ~v22;
      while (1)
      {
        v23 = (v23 + 1) & v27;
        if (((*(_QWORD *)(v32 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
          break;
        v28 = (_QWORD *)(v24 + 16 * v23);
        v29 = *v28 == v19 && v28[1] == v18;
        if (v29 || (sub_20D635490() & 1) != 0)
          goto LABEL_7;
      }
LABEL_39:
      swift_bridgeObjectRelease();
      v2 = 0;
LABEL_42:
      sub_20D61A6A4();
      return v2;
    }
LABEL_7:
    result = swift_bridgeObjectRelease();
    v3 = v16;
    v4 = v21;
  }
  v15 = i + 4;
  if (i + 4 >= v30)
  {
LABEL_41:
    v2 = 1;
    goto LABEL_42;
  }
  v14 = *(_QWORD *)(v31 + 8 * v15);
  if (v14)
  {
    v12 = i + 4;
    goto LABEL_24;
  }
  while (1)
  {
    v12 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v12 >= v30)
      goto LABEL_41;
    v14 = *(_QWORD *)(v31 + 8 * v12);
    ++v15;
    if (v14)
      goto LABEL_24;
  }
LABEL_45:
  __break(1u);
  return result;
}

id sub_20D613E20(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  __int128 *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v20;
  _OWORD v21[3];
  __int16 v22;

  v20 = a1[6];
  v4 = v20;
  sub_20D61A604((uint64_t)&v20);
  sub_20D63540C();
  v5 = *(_QWORD *)(v4 + 16);
  swift_bridgeObjectRetain();
  if (v5)
  {
    v6 = (__int128 *)(v4 + 32);
    sub_20D61A578(0, &qword_2549BD950);
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = *v6;
      v10 = v6[1];
      v11 = v6[2];
      v22 = *((_WORD *)v6 + 24);
      v21[1] = v10;
      v21[2] = v11;
      v21[0] = v9;
      v12 = v8 + 1;
      if (!(_BYTE)v22)
        v7 = v8;
      sub_20D61A6B0((uint64_t)v21);
      swift_bridgeObjectRetain();
      sub_20D614D00((uint64_t)v21, a2);
      sub_20D6353F4();
      sub_20D635418();
      sub_20D635424();
      sub_20D635400();
      v6 = (__int128 *)((char *)v6 + 56);
      v8 = v12;
    }
    while (v5 != v12);
  }
  else
  {
    v7 = 0;
  }
  sub_20D61A62C((uint64_t)&v20);
  sub_20D61A62C((uint64_t)&v20);
  swift_bridgeObjectRelease();
  if (a1[3])
  {
    swift_bridgeObjectRetain();
    v13 = (void *)sub_20D635160();
    swift_bridgeObjectRelease();
  }
  else
  {
    v13 = 0;
  }
  v14 = (void *)sub_20D635160();
  if (a1[5])
  {
    swift_bridgeObjectRetain();
    v15 = (void *)sub_20D635160();
    sub_20D61A654((uint64_t)a1);
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_20D61A654((uint64_t)a1);
    v15 = 0;
  }
  v16 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  sub_20D61A578(0, &qword_2549BD950);
  v17 = (void *)sub_20D6351C0();
  swift_release();
  v18 = objc_msgSend(v16, sel_initWithTitle_identifier_footer_options_selectedOptionIdentifierIndex_, v13, v14, v15, v17, v7);

  return v18;
}

uint64_t *SharingOptionsObservableModel.deinit()
{
  uint64_t *v0;
  char *v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  sub_20D617A90(v0[4], v0[5]);
  swift_bridgeObjectRelease();
  sub_20D617A90(v0[12], v0[13]);
  swift_bridgeObjectRelease();
  sub_20D61A7A8((uint64_t)v0 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlert, &qword_2549BD998);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_20D618880(*(uint64_t *)((char *)v0
                           + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_userDidChangeOption));
  sub_20D618880(*(uint64_t *)((char *)v0
                           + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_contentSizeDidChange));
  v1 = (char *)v0 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel___observationRegistrar;
  v2 = sub_20D634B90();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t SharingOptionsObservableModel.__deallocating_deinit()
{
  SharingOptionsObservableModel.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_20D6141A8()
{
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  swift_getKeyPath();
  sub_20D634B60();
  return swift_release();
}

uint64_t sub_20D614258()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD aBlock[6];

  v0 = sub_20D635100();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v20 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_20D635118();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v20 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v9 = result;
    swift_getKeyPath();
    v24 = v5;
    aBlock[0] = v9;
    sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
    v23 = v4;
    sub_20D634B60();
    swift_release();
    swift_beginAccess();
    v10 = *(_QWORD *)(v9 + 32);
    v11 = *(_QWORD *)(v9 + 40);
    v12 = *(_QWORD *)(v9 + 48);
    v13 = *(_QWORD *)(v9 + 56);
    v14 = *(_QWORD *)(v9 + 96);
    v15 = *(_QWORD *)(v9 + 104);
    v21 = v3;
    v22 = v1;
    *(_QWORD *)(v9 + 96) = v10;
    *(_QWORD *)(v9 + 104) = v11;
    *(_QWORD *)(v9 + 112) = v12;
    *(_QWORD *)(v9 + 120) = v13;
    *(_BYTE *)(v9 + 128) = *(_BYTE *)(v9 + 64);
    sub_20D617A08(v10, v11);
    sub_20D617A90(v14, v15);
    swift_getKeyPath();
    aBlock[0] = v9;
    sub_20D634B60();
    swift_release();
    swift_beginAccess();
    *(_OWORD *)(v9 + 136) = *(_OWORD *)(v9 + 72);
    sub_20D61A578(0, (unint64_t *)&unk_2549BEA00);
    v16 = (void *)sub_20D6352BC();
    v17 = swift_allocObject();
    swift_weakInit();
    aBlock[4] = sub_20D61A49C;
    aBlock[5] = v17;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_20D614CD4;
    aBlock[3] = &block_descriptor;
    v18 = _Block_copy(aBlock);
    swift_retain();
    sub_20D63510C();
    v25 = MEMORY[0x24BEE4AF8];
    sub_20D619F34(&qword_2549BDDC8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549BEA10);
    sub_20D61A878(&qword_2549BDDD0, (uint64_t *)&unk_2549BEA10, MEMORY[0x24BEE12C8]);
    v19 = v21;
    sub_20D6353A0();
    MEMORY[0x212BA4FA8](0, v7, v19, v18);
    _Block_release(v18);
    swift_release();

    (*(void (**)(char *, uint64_t))(v22 + 8))(v19, v0);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v23);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_20D6145B0()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  char v11;
  int v12;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v1 = result;
    swift_getKeyPath();
    sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
    sub_20D634B60();
    swift_release();
    swift_beginAccess();
    if (*(double *)(v1 + 72) != *(double *)(v1 + 136) || *(double *)(v1 + 80) != *(double *)(v1 + 144))
      sub_20D614844();
    v3 = *(_QWORD *)(v1 + 104);
    if (v3)
    {
      v4 = *(_QWORD *)(v1 + 96);
      v6 = *(_QWORD *)(v1 + 112);
      v5 = *(_QWORD *)(v1 + 120);
      v12 = *(unsigned __int8 *)(v1 + 128);
      swift_getKeyPath();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_20D634B60();
      swift_release();
      swift_beginAccess();
      v7 = *(_QWORD *)(v1 + 40);
      if (v7
        && ((v8 = *(_QWORD *)(v1 + 48),
             v9 = *(_QWORD *)(v1 + 56),
             v10 = *(unsigned __int8 *)(v1 + 64),
             *(_QWORD *)(v1 + 32) == v4)
         && v7 == v3
         || (sub_20D635490() & 1) != 0))
      {
        if (v8 == v6 && v9 == v5)
        {
          sub_20D617A90(v4, v3);
          if (((v12 ^ v10) & 1) == 0)
          {
LABEL_18:
            swift_release();
            swift_beginAccess();
            result = swift_weakLoadStrong();
            if (result)
            {
              sub_20D634B48();
              return swift_release();
            }
            return result;
          }
        }
        else
        {
          v11 = sub_20D635490();
          sub_20D617A90(v4, v3);
          if ((v11 & 1) != 0 && ((v12 ^ v10) & 1) == 0)
            goto LABEL_18;
        }
      }
      else
      {
        sub_20D617A90(v4, v3);
      }
    }
    sub_20D61494C();
    goto LABEL_18;
  }
  return result;
}

uint64_t sub_20D614844()
{
  uint64_t v0;
  uint64_t result;
  uint64_t (*v2)(uint64_t, double, double);
  uint64_t v3;

  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  result = swift_beginAccess();
  if (*(double *)(v0 + 72) != 0.0 || *(double *)(v0 + 80) != 0.0)
  {
    v2 = *(uint64_t (**)(uint64_t, double, double))(v0
                                                           + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_contentSizeDidChange);
    if (v2)
    {
      swift_getKeyPath();
      sub_20D634B60();
      v3 = swift_release();
      return v2(v3, *(double *)(v0 + 72), *(double *)(v0 + 80));
    }
  }
  return result;
}

uint64_t sub_20D61494C()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t KeyPath;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16[4];
  char v17;

  swift_getKeyPath();
  v16[0] = v0;
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  result = swift_beginAccess();
  v2 = *(_QWORD *)(v0 + 40);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 48);
    v4 = *(_QWORD *)(v0 + 56);
    v5 = *(_BYTE *)(v0 + 64);
    v16[0] = *(_QWORD *)(v0 + 32);
    v16[1] = v2;
    v16[2] = v3;
    v16[3] = v4;
    v13 = v5 & 1;
    v17 = v5 & 1;
    swift_getKeyPath();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_20D634B60();
    swift_release();
    v15 = v16[0];
    v14 = v3;
    sub_20D617A08(v16[0], v2);
    v6 = swift_bridgeObjectRetain();
    v7 = sub_20D618AB0(v6, v16);
    sub_20D617A90(v15, v2);
    swift_bridgeObjectRelease();
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    swift_bridgeObjectRetain();
    sub_20D634B54();
    swift_release();
    swift_bridgeObjectRelease();
    v9 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_optionsDependency);
    sub_20D61861C(v7, v9);
    swift_bridgeObjectRetain();
    v10 = sub_20D618EA0(v7, v9);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v11 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v11);
    sub_20D634B54();
    swift_release();
    swift_bridgeObjectRelease();
    v12 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v12);
    swift_bridgeObjectRetain();
    sub_20D634B54();
    swift_release();
    swift_bridgeObjectRelease();
    if (*(_QWORD *)(v0 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_userDidChangeOption))
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t))(v0
                                                                                  + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_userDidChangeOption))(v15, v2, v14, v4, v13, v10);
    swift_bridgeObjectRelease();
    return sub_20D617A90(v15, v2);
  }
  return result;
}

uint64_t sub_20D614CD4(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_20D614D00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _BOOL8 v13;
  void *v14;
  id v15;

  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  if (*(_QWORD *)(a2 + 16))
  {
    swift_bridgeObjectRetain();
    v6 = sub_20D615AEC(v4, v5);
    if ((v7 & 1) != 0)
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v6);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (*(_QWORD *)(v8 + 16))
        sub_20D616CA4(v8);
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
  v9 = (void *)sub_20D635160();
  v10 = (void *)sub_20D635160();
  if (*(_QWORD *)(a1 + 40))
  {
    swift_bridgeObjectRetain();
    v11 = (void *)sub_20D635160();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  sub_20D61A6F8(a1);
  v12 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v13 = *(_BYTE *)(a1 + 48) == 0;
  v14 = (void *)sub_20D6351C0();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v12, sel_initWithTitle_identifier_subtitle_selected_requiredOptionsIdentifiers_, v9, v10, v11, v13, v14);

  return v15;
}

uint64_t sub_20D614E90(uint64_t a1, uint64_t a2)
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
  char v13;
  uint64_t result;
  uint64_t v15;
  int v17;
  int v18;
  int v19;
  int v20;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2)
  {
    v3 = a2;
    if (a1 != a2)
    {
      v4 = 0;
      v15 = a1;
      while (1)
      {
        v5 = *(_QWORD *)(a1 + v4 + 48);
        v6 = *(_QWORD *)(a1 + v4 + 56);
        v7 = *(_QWORD *)(a1 + v4 + 64);
        v8 = *(_QWORD *)(a1 + v4 + 72);
        v9 = *(_QWORD *)(v3 + v4 + 48);
        v10 = *(_QWORD *)(v3 + v4 + 56);
        v12 = *(_QWORD *)(v3 + v4 + 64);
        v11 = *(_QWORD *)(v3 + v4 + 72);
        v19 = *(unsigned __int8 *)(v3 + v4 + 80);
        v20 = *(unsigned __int8 *)(a1 + v4 + 80);
        v17 = *(unsigned __int8 *)(v3 + v4 + 81);
        v18 = *(unsigned __int8 *)(a1 + v4 + 81);
        if ((*(_QWORD *)(a1 + v4 + 32) != *(_QWORD *)(v3 + v4 + 32)
           || *(_QWORD *)(a1 + v4 + 40) != *(_QWORD *)(v3 + v4 + 40))
          && (sub_20D635490() & 1) == 0
          || (v5 != v9 || v6 != v10) && (sub_20D635490() & 1) == 0)
        {
          return 0;
        }
        if (!v8)
          break;
        if (!v11)
          return 0;
        if (v7 == v12 && v8 == v11)
          goto LABEL_18;
        v13 = sub_20D635490();
        result = 0;
        if ((v13 & 1) == 0)
          return result;
LABEL_19:
        if (v20 != v19 || ((v18 ^ v17) & 1) != 0)
          return result;
        v4 += 56;
        --v2;
        a1 = v15;
        v3 = a2;
        if (!v2)
          return 1;
      }
      if (v11)
        return 0;
LABEL_18:
      result = 0;
      goto LABEL_19;
    }
  }
  return 1;
}

uint64_t sub_20D614FF4()
{
  return sub_20D635244();
}

uint64_t sub_20D614FFC(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  char v4;
  int v5;
  int v6;
  char v7;

  v6 = 0;
  v7 = 1;
  result = MEMORY[0x212BA4F30](a1, &v6);
  v4 = v7;
  v5 = v6;
  if (v7)
    v5 = 0;
  *(_DWORD *)a2 = v5;
  *(_BYTE *)(a2 + 4) = v4;
  return result;
}

uint64_t sub_20D61504C(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;
  int v5;
  int v7;
  char v8;

  v7 = 0;
  v8 = 1;
  v3 = MEMORY[0x212BA4F3C](a1, &v7);
  v4 = v8;
  v5 = v7;
  if (v8)
    v5 = 0;
  *(_DWORD *)a2 = v5;
  *(_BYTE *)(a2 + 4) = v4;
  return v3 & 1;
}

void sub_20D6150A0(float *a1@<X8>)
{
  *a1 = MEMORY[0x212BA4F48]();
}

uint64_t sub_20D6150C4(uint64_t a1, uint64_t a2)
{
  return sub_20D61520C(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_20D6150D0(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_20D635178();
  *a2 = 0;
  return result;
}

uint64_t sub_20D615144(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_20D635184();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_20D6151C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_20D635190();
  v2 = sub_20D635160();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_20D615200(uint64_t a1, uint64_t a2)
{
  return sub_20D61520C(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_20D61520C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_20D635190();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_20D615248()
{
  sub_20D635190();
  sub_20D63519C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20D615288()
{
  uint64_t v0;

  sub_20D635190();
  sub_20D6354CC();
  sub_20D63519C();
  v0 = sub_20D6354F0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_20D6152F8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_20D635190();
  v2 = v1;
  if (v0 == sub_20D635190() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_20D635490();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

_DWORD *sub_20D615380@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

float sub_20D615390@<S0>(_DWORD *a1@<X8>)
{
  float *v1;
  float result;

  result = *v1;
  *a1 = *(_DWORD *)v1;
  return result;
}

uint64_t sub_20D61539C()
{
  sub_20D619F34(&qword_2549BDE58, (uint64_t (*)(uint64_t))type metadata accessor for UILayoutPriority, (uint64_t)&unk_20D636740);
  sub_20D619F34(&qword_2549BDE60, (uint64_t (*)(uint64_t))type metadata accessor for UILayoutPriority, (uint64_t)&unk_20D6366E0);
  return sub_20D635484();
}

uint64_t sub_20D615430@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_20D635160();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_20D615474@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_20D635190();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_20D61549C()
{
  sub_20D619F34(&qword_2549BDD88, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_20D636388);
  sub_20D619F34(&qword_2549BDD90, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_20D636328);
  return sub_20D635484();
}

uint64_t sub_20D615520()
{
  return sub_20D635274();
}

uint64_t sub_20D615528()
{
  return sub_20D6354E4();
}

void sub_20D615558()
{
  JUMPOUT(0x212BA51A0);
}

BOOL sub_20D61556C(float *a1, float *a2)
{
  return *a1 == *a2;
}

uint64_t sub_20D615580(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_20D6155E4;
  return v6(a1);
}

uint64_t sub_20D6155E4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_20D615630(uint64_t a1)
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
  v3 = sub_20D62BCF8(isUniquelyReferenced_nonNull_native, v14, 1, v3);
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
  v9 = (unint64_t)&v3[7 * v8 + 4];
  if (a1 + 32 < v9 + 56 * v2 && v9 < a1 + 32 + 56 * v2)
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
  result = sub_20D635478();
  __break(1u);
  return result;
}

uint64_t sub_20D615788(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_20D635448();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_20D635448();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x212BA50BC](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_20D616D88(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_20D635448();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_20D6351D8();
  }
  __break(1u);
  return result;
}

uint64_t sub_20D615940(uint64_t *a1, uint64_t a2, uint64_t a3)
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
  sub_20D6354CC();
  swift_bridgeObjectRetain();
  sub_20D63519C();
  v8 = sub_20D6354F0();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_20D635490() & 1) != 0)
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
      if (v19 || (sub_20D635490() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_20D616398(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

unint64_t sub_20D615AEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_20D6354CC();
  sub_20D63519C();
  v4 = sub_20D6354F0();
  return sub_20D615E40(a1, a2, v4);
}

uint64_t sub_20D615B50(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDDF0);
  v37 = a2;
  v6 = sub_20D635460();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_38;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v2;
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_21;
    }
    if (__OFADD__(v14++, 1))
      goto LABEL_40;
    if (v14 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v14);
    if (!v24)
    {
      v25 = v14 + 1;
      if (v14 + 1 >= v11)
      {
LABEL_31:
        swift_release();
        v3 = v35;
        if ((v37 & 1) == 0)
          goto LABEL_38;
        goto LABEL_34;
      }
      v24 = *(_QWORD *)(v36 + 8 * v25);
      if (!v24)
      {
        while (1)
        {
          v14 = v25 + 1;
          if (__OFADD__(v25, 1))
            break;
          if (v14 >= v11)
            goto LABEL_31;
          v24 = *(_QWORD *)(v36 + 8 * v14);
          ++v25;
          if (v24)
            goto LABEL_20;
        }
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      ++v14;
    }
LABEL_20:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_21:
    v26 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v28 = *v26;
    v27 = v26[1];
    v29 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v21);
    if ((v37 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_20D6354CC();
    sub_20D63519C();
    result = sub_20D6354F0();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v30 = 0;
      v31 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v32 = v17 == v31;
        if (v17 == v31)
          v17 = 0;
        v30 |= v32;
        v33 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v33 == -1);
      v18 = __clz(__rbit64(~v33)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v18);
    *v19 = v28;
    v19[1] = v27;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v18) = v29;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v23 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_38;
LABEL_34:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_38:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_20D615E40(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_20D635490() & 1) == 0)
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
      while (!v14 && (sub_20D635490() & 1) == 0);
    }
  }
  return v6;
}

void *sub_20D615F20()
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
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDDF0);
  v2 = *v0;
  v3 = sub_20D635454();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_24:
    result = (void *)swift_release();
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
    if (__OFADD__(v9++, 1))
      goto LABEL_26;
    if (v9 >= v13)
      goto LABEL_24;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    if (!v23)
      break;
LABEL_23:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v9 + 1;
  if (v9 + 1 >= v13)
    goto LABEL_24;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_24;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_23;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_20D6160BC()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE10);
  v3 = sub_20D6353B8();
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
      sub_20D6354CC();
      sub_20D63519C();
      result = sub_20D6354F0();
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

uint64_t sub_20D616398(uint64_t result, uint64_t a2, unint64_t a3, char a4)
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
    sub_20D6160BC();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_20D616530();
      goto LABEL_22;
    }
    sub_20D6166E0();
  }
  v11 = *v4;
  sub_20D6354CC();
  sub_20D63519C();
  result = sub_20D6354F0();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_20D635490(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_20D6354A8();
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
          result = sub_20D635490();
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

void *sub_20D616530()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE10);
  v2 = *v0;
  v3 = sub_20D6353AC();
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

uint64_t sub_20D6166E0()
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE10);
  v3 = sub_20D6353B8();
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
    sub_20D6354CC();
    swift_bridgeObjectRetain();
    sub_20D63519C();
    result = sub_20D6354F0();
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

uint64_t sub_20D61698C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_20D6169C4(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_20D6169A8(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_20D616B28(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_20D6169C4(char a1, int64_t a2, char a3, char *a4)
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
  size_t v15;
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549BEA70);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 + 31;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 6);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  v15 = v8 << 6;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[v15])
      memmove(v13, v14, v15);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[v15] || v13 >= &v14[v15])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_20D635478();
  __break(1u);
  return result;
}

uint64_t sub_20D616B28(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  size_t v14;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDDE8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 56);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  v14 = 56 * v8;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v14])
      memmove(v12, v13, v14);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v14] || v12 >= &v13[v14])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_20D635478();
  __break(1u);
  return result;
}

_QWORD *sub_20D616CA4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDDE0);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_20D617098((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_20D61A6A4();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_20D616D88(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_20D635448();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_20D635448();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_20D61A878(&qword_2549BDE20, &qword_2549BDE18, MEMORY[0x24BEE12E0]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE18);
          v12 = sub_20D616FA4(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_20D61A578(0, &qword_2549BD950);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_20D635478();
  __break(1u);
  return result;
}

void (*sub_20D616FA4(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_20D617024(v6, a2, a3);
  return sub_20D616FF8;
}

void sub_20D616FF8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_20D617024(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x212BA50B0](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_20D617090;
  }
  __break(1u);
  return result;
}

void sub_20D617090(id *a1)
{

}

uint64_t sub_20D617098(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 56;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 56);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_20D617294(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  char v5;
  char v6;
  BOOL v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v4 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  if (v4 || (v5 = sub_20D635490(), v6 = 0, (v5 & 1) != 0))
  {
    v7 = *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16) && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24);
    if (v7 || (v8 = sub_20D635490(), v6 = 0, (v8 & 1) != 0))
    {
      v9 = *(_QWORD *)(a1 + 40);
      v10 = *(_QWORD *)(a2 + 40);
      if (v9)
      {
        if (!v10)
          goto LABEL_20;
        if (*(_QWORD *)(a1 + 32) != *(_QWORD *)(a2 + 32) || v9 != v10)
        {
          v11 = sub_20D635490();
          v6 = 0;
          if ((v11 & 1) == 0)
            return v6 & 1;
        }
      }
      else if (v10)
      {
        goto LABEL_20;
      }
      if (*(unsigned __int8 *)(a1 + 48) == *(unsigned __int8 *)(a2 + 48))
      {
        v6 = ((*(_BYTE *)(a1 + 49) & 1) == 0) ^ *(_BYTE *)(a2 + 49);
        return v6 & 1;
      }
LABEL_20:
      v6 = 0;
    }
  }
  return v6 & 1;
}

uint64_t sub_20D617370(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  char v27;
  NSObject *v28;
  NSObject *v29;
  os_log_type_t v30;
  _BOOL4 v31;
  uint8_t *v32;
  _QWORD *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char v41;
  NSObject *v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  NSObject *v46;
  _QWORD *v47;
  id v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;

  v2 = sub_20D634BB4();
  v51 = *(_QWORD *)(v2 - 8);
  v3 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v5 = (char *)&v49 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v49 - v6;
  v8 = objc_msgSend(a1, sel_identifier);
  v9 = sub_20D635190();
  v11 = v10;

  if (v9 == sub_20D635190() && v11 == v12)
    goto LABEL_8;
  v14 = sub_20D635490();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v14 & 1) == 0)
  {
    v15 = objc_msgSend(a1, sel_identifier);
    v16 = sub_20D635190();
    v18 = v17;

    if (v16 == sub_20D635190() && v18 == v19)
    {
LABEL_8:
      swift_bridgeObjectRelease_n();
      goto LABEL_9;
    }
    v40 = sub_20D635490();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v40 & 1) == 0)
      goto LABEL_27;
  }
LABEL_9:
  v20 = objc_msgSend(a1, sel_selectedOptionIdentifier);
  v21 = sub_20D635190();
  v23 = v22;

  v24 = *MEMORY[0x24BDB8F90];
  if (sub_20D635190() != v21 || v25 != v23)
  {
    v26 = v7;
    v27 = sub_20D635490();
    swift_bridgeObjectRelease();
    if ((v27 & 1) != 0)
      goto LABEL_13;
    v38 = *MEMORY[0x24BDB8F78];
    if (sub_20D635190() == v21 && v39 == v23)
    {
      swift_bridgeObjectRelease_n();
LABEL_25:
      sub_20D634B9C();
      v42 = a1;
      v43 = sub_20D634BA8();
      v44 = sub_20D6352A4();
      if (os_log_type_enabled(v43, v44))
      {
        v45 = (uint8_t *)swift_slowAlloc();
        v49 = (_QWORD *)swift_slowAlloc();
        v50 = v38;
        *(_DWORD *)v45 = 138412290;
        v52 = v42;
        v46 = v42;
        sub_20D63537C();
        v47 = v49;
        *v49 = v42;

        _os_log_impl(&dword_20D60A000, v43, v44, "SharingOptionsObservableModel converted mixed allow others to invite to on: %@", v45, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE08);
        swift_arrayDestroy();
        MEMORY[0x212BA56C8](v47, -1, -1);
        MEMORY[0x212BA56C8](v45, -1, -1);
      }
      else
      {

        v43 = v42;
      }

      (*(void (**)(char *, uint64_t))(v51 + 8))(v5, v2);
      v36 = sub_20D635190();
      goto LABEL_17;
    }
    v41 = sub_20D635490();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v41 & 1) != 0)
      goto LABEL_25;
LABEL_27:
    v48 = objc_msgSend(a1, sel_selectedOptionIdentifier);
    v36 = sub_20D635190();

    return v36;
  }
  v26 = v7;
  swift_bridgeObjectRelease();
LABEL_13:
  swift_bridgeObjectRelease();
  sub_20D634B9C();
  v28 = a1;
  v29 = sub_20D634BA8();
  v30 = sub_20D6352A4();
  v31 = os_log_type_enabled(v29, v30);
  v50 = v24;
  if (v31)
  {
    v32 = (uint8_t *)swift_slowAlloc();
    v33 = (_QWORD *)swift_slowAlloc();
    v49 = v26;
    *(_DWORD *)v32 = 138412290;
    v52 = v28;
    v34 = v28;
    v26 = v49;
    sub_20D63537C();
    *v33 = v28;

    _os_log_impl(&dword_20D60A000, v29, v30, "SharingOptionsObservableModel converted mixed permission to read-only: %@", v32, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE08);
    swift_arrayDestroy();
    MEMORY[0x212BA56C8](v33, -1, -1);
    MEMORY[0x212BA56C8](v32, -1, -1);
  }
  else
  {

    v29 = v28;
  }
  v35 = v51;

  (*(void (**)(_QWORD *, uint64_t))(v35 + 8))(v26, v2);
  v36 = sub_20D635190();
LABEL_17:
  sub_20D635190();
  return v36;
}

uint64_t _s14CloudSharingUI0B22OptionsObservableModelC10UserActionV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  BOOL v8;
  char v9;
  uint64_t result;
  char v12;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(unsigned __int8 *)(a1 + 32);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(unsigned __int8 *)(a2 + 32);
  v8 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  if (v8 || (v9 = sub_20D635490(), result = 0, (v9 & 1) != 0))
  {
    if (v2 == v5 && v3 == v6)
      return v4 ^ v7 ^ 1u;
    v12 = sub_20D635490();
    result = 0;
    if ((v12 & 1) != 0)
      return v4 ^ v7 ^ 1u;
  }
  return result;
}

uint64_t type metadata accessor for SharingOptionsObservableModel()
{
  uint64_t result;

  result = qword_2549BD9C8;
  if (!qword_2549BD9C8)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_20D6179EC()
{
  uint64_t *v0;

  return sub_20D60F2B8(v0[2], v0[3], v0[4]);
}

uint64_t sub_20D617A08(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BA562C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_20D617A78()
{
  uint64_t v0;

  return sub_20D60F754(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_20D617A90(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_20D617AC0()
{
  return sub_20D61A8B8();
}

uint64_t sub_20D617AD4()
{
  uint64_t v0;

  return sub_20D60FFF4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_20D617AEC(uint64_t a1, uint64_t a2)
{
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  if (*(_QWORD *)a1 != *(_QWORD *)a2 || *(_QWORD *)(a1 + 8) != *(_QWORD *)(a2 + 8))
  {
    v5 = sub_20D635490();
    v6 = 0;
    if ((v5 & 1) == 0)
      return v6 & 1;
  }
  v7 = *(_QWORD *)(a1 + 24);
  v8 = *(_QWORD *)(a2 + 24);
  if (!v7)
  {
    if (v8)
      goto LABEL_24;
    goto LABEL_15;
  }
  if (!v8)
    goto LABEL_24;
  v9 = *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16) && v7 == v8;
  if (v9 || (v10 = sub_20D635490(), v6 = 0, (v10 & 1) != 0))
  {
LABEL_15:
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(a2 + 40);
    if (v11)
    {
      if (!v12)
        goto LABEL_24;
      if (*(_QWORD *)(a1 + 32) != *(_QWORD *)(a2 + 32) || v11 != v12)
      {
        v13 = sub_20D635490();
        v6 = 0;
        if ((v13 & 1) == 0)
          return v6 & 1;
      }
    }
    else if (v12)
    {
      goto LABEL_24;
    }
    if ((sub_20D614E90(*(_QWORD *)(a1 + 48), *(_QWORD *)(a2 + 48)) & 1) != 0)
    {
      v6 = *(_BYTE *)(a1 + 56) ^ *(_BYTE *)(a2 + 56) ^ 1;
      return v6 & 1;
    }
LABEL_24:
    v6 = 0;
  }
  return v6 & 1;
}

_QWORD *sub_20D617BDC(unint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int16 v17;
  _QWORD *v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int16 v37;
  id v38;

  v6 = a1;
  if (a1 >> 62)
    goto LABEL_19;
  v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v7; v7 = sub_20D635448())
  {
    v25 = v6 & 0xC000000000000001;
    v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v9 = 4;
    v23 = v7;
    v24 = v6;
    while (1)
    {
      v11 = v25 ? (id)MEMORY[0x212BA50B0](v9 - 4, v6) : *(id *)(v6 + 8 * v9);
      v12 = v11;
      v13 = v9 - 3;
      if (__OFADD__(v9 - 4, 1))
        break;
      v38 = v11;
      sub_20D60EC18(&v38, a2, a3, a4, a5, (uint64_t)&v32);
      if (v5)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

        return v8;
      }

      v14 = v33;
      if (v33)
      {
        v15 = v32;
        v16 = v34;
        v31 = v36;
        v17 = v37;
        v30 = v35;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v8 = sub_20D62BCF8(0, v8[2] + 1, 1, v8);
        v18 = v8;
        v19 = v8[2];
        v20 = v18;
        v21 = v18[3];
        if (v19 >= v21 >> 1)
          v20 = sub_20D62BCF8((_QWORD *)(v21 > 1), v19 + 1, 1, v20);
        v20[2] = v19 + 1;
        v10 = &v20[7 * v19];
        v8 = v20;
        v10[4] = v15;
        v10[5] = v14;
        v10[6] = v16;
        v10[7] = v30;
        *((_OWORD *)v10 + 4) = v31;
        *((_BYTE *)v10 + 80) = v17;
        *((_BYTE *)v10 + 81) = HIBYTE(v17) & 1;
        v7 = v23;
        v6 = v24;
      }
      ++v9;
      if (v13 == v7)
      {
        swift_bridgeObjectRelease();
        return v8;
      }
    }
    __break(1u);
LABEL_19:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return (_QWORD *)MEMORY[0x24BEE4AF8];
}

uint64_t sub_20D617DE4@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  _BOOL4 v11;
  uint64_t v12;
  uint8_t *v13;
  NSObject *v14;
  _QWORD *v15;
  uint8_t *v16;
  void *v17;
  BOOL v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  char v26;
  id v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  char v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t result;
  uint64_t *v46;
  _QWORD *v47;
  uint64_t v48;
  _QWORD *v49;
  _QWORD *v50;
  uint64_t *v51;
  NSObject *v52;
  void *v53;
  char v54;

  v4 = sub_20D634BB4();
  v5 = *(_QWORD **)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D634B9C();
  v8 = a1;
  v9 = sub_20D634BA8();
  v10 = sub_20D6352A4();
  v11 = os_log_type_enabled(v9, v10);
  v51 = a2;
  if (v11)
  {
    v12 = swift_slowAlloc();
    v50 = v5;
    v13 = (uint8_t *)v12;
    v49 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v13 = 138412290;
    v52 = v8;
    v14 = v8;
    sub_20D63537C();
    v15 = v49;
    *v49 = v8;

    _os_log_impl(&dword_20D60A000, v9, v10, "SharingOptionsObservableModel init options: %@", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE08);
    swift_arrayDestroy();
    MEMORY[0x212BA56C8](v15, -1, -1);
    v16 = v13;
    v5 = v50;
    MEMORY[0x212BA56C8](v16, -1, -1);
  }
  else
  {

    v9 = v8;
  }

  ((void (*)(char *, uint64_t))v5[1])(v7, v4);
  v52 = 0;
  v53 = 0;
  objc_opt_self();
  v17 = (void *)swift_dynamicCastObjCClass();
  v18 = v17 == 0;
  if (v17)
  {
    v19 = v8;
    v20 = sub_20D617370(v17);
    v22 = v21;
    v24 = v23;
    v17 = v25;

    v26 = 0;
    v52 = v24;
    v53 = v17;
  }
  else
  {
    v20 = 0;
    v22 = 0;
    v24 = 0;
    v26 = 1;
  }
  v54 = v26;
  v27 = -[NSObject options](v8, sel_options);
  sub_20D61A578(0, &qword_2549BD950);
  v28 = sub_20D6351CC();

  swift_bridgeObjectRetain();
  v50 = sub_20D617BDC(v28, &v54, v20, v22, (uint64_t *)&v52);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  v29 = sub_20D635190();
  if (v17)
  {
    if (v24 == v29 && v17 == v30)
    {
      swift_bridgeObjectRelease();
LABEL_13:
      v18 = 1;
      goto LABEL_14;
    }
    v31 = sub_20D635490();
    swift_bridgeObjectRelease();
    if ((v31 & 1) != 0)
      goto LABEL_13;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
LABEL_14:
  v32 = -[NSObject identifier](v8, sel_identifier);
  v33 = sub_20D635190();
  v35 = v34;

  v36 = -[NSObject title](v8, sel_title);
  v37 = sub_20D635190();
  v38 = v18;
  v40 = v39;

  v41 = -[NSObject footer](v8, sel_footer);
  v42 = sub_20D635190();
  v44 = v43;

  result = swift_bridgeObjectRelease();
  v47 = v50;
  v46 = v51;
  *v51 = v33;
  v46[1] = v35;
  v46[2] = v37;
  v46[3] = v40;
  v46[4] = v42;
  v46[5] = v44;
  v46[6] = (uint64_t)v47;
  *((_BYTE *)v46 + 56) = v38;
  return result;
}

_QWORD *sub_20D6181B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  __int128 v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  __int128 v40;
  char v42;
  uint64_t v43;
  uint64_t v44;
  char v45;
  char v46;
  uint64_t v47;
  uint64_t v48;

  v32 = *(_QWORD *)(a1 + 16);
  if (!v32)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  v31 = a1 + 32;
  swift_bridgeObjectRetain();
  v4 = 0;
  v5 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v44 = a2;
  do
  {
    v39 = v5;
    v6 = (uint64_t *)(v31 + (v4 << 6));
    v34 = v6[2];
    v35 = *v6;
    v7 = v6[6];
    v36 = *((unsigned __int8 *)v6 + 56);
    v8 = *(_QWORD *)(v7 + 16);
    v37 = v6[1];
    v38 = v6[5];
    v40 = *(_OWORD *)(v6 + 3);
    if (v8)
    {
      v33 = v4;
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v9 = 0;
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v43 = v7;
      while (1)
      {
        v11 = v7 + v9;
        v13 = *(_QWORD *)(v7 + v9 + 32);
        v12 = *(_QWORD *)(v11 + 40);
        v14 = *(_QWORD *)(v11 + 56);
        v48 = *(_QWORD *)(v11 + 48);
        v15 = *(_QWORD *)(v11 + 72);
        v47 = *(_QWORD *)(v11 + 64);
        v45 = *(_BYTE *)(v11 + 81);
        v46 = *(_BYTE *)(v11 + 80);
        v16 = *(_QWORD *)(a2 + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (!v16)
          break;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v17 = sub_20D615AEC(v13, v12);
        if ((v18 & 1) == 0
          || (v19 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v17),
              swift_bridgeObjectRetain(),
              swift_bridgeObjectRelease(),
              !*(_QWORD *)(v19 + 16)))
        {
          swift_bridgeObjectRelease();
          goto LABEL_16;
        }
        v42 = sub_20D613B30(a3, v19);
        swift_bridgeObjectRelease();
        a2 = v44;
        if ((v42 & 1) != 0)
          goto LABEL_16;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
LABEL_8:
        v7 = v43;
        v9 += 56;
        if (!--v8)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          v4 = v33;
          goto LABEL_23;
        }
      }
      swift_bridgeObjectRetain();
LABEL_16:
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v10 = sub_20D62BCF8(0, v10[2] + 1, 1, v10);
      v21 = v10[2];
      v20 = v10[3];
      if (v21 >= v20 >> 1)
        v10 = sub_20D62BCF8((_QWORD *)(v20 > 1), v21 + 1, 1, v10);
      v10[2] = v21 + 1;
      v22 = &v10[7 * v21];
      v22[4] = v13;
      v22[5] = v12;
      v22[6] = v48;
      v22[7] = v14;
      v22[8] = v47;
      v22[9] = v15;
      *((_BYTE *)v22 + 80) = v46;
      *((_BYTE *)v22 + 81) = v45;
      a2 = v44;
      goto LABEL_8;
    }
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_23:
    if (v36)
      v23 = 1;
    else
      v23 = 2;
    v24 = v10[2];
    swift_bridgeObjectRelease();
    v5 = v39;
    if (v24 < v23)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v5 = sub_20D62BE1C(0, v39[2] + 1, 1, v39);
      v26 = v5[2];
      v25 = v5[3];
      v27 = v40;
      if (v26 >= v25 >> 1)
      {
        v29 = sub_20D62BE1C((_QWORD *)(v25 > 1), v26 + 1, 1, v5);
        v27 = v40;
        v5 = v29;
      }
      v5[2] = v26 + 1;
      v28 = &v5[8 * v26];
      v28[4] = v35;
      v28[5] = v37;
      v28[6] = v34;
      *(_OWORD *)(v28 + 7) = v27;
      v28[9] = v38;
      v28[10] = v10;
      *((_BYTE *)v28 + 88) = v36;
    }
    ++v4;
  }
  while (v4 != v32);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_20D618588(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_20D635280();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_20D615940(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

_QWORD *sub_20D61861C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v19;

  v4 = MEMORY[0x24BEE4AF8];
  v19 = MEMORY[0x24BEE4AF8];
  v5 = *(_QWORD *)(a1 + 16);
  if (v5)
  {
    swift_bridgeObjectRetain();
    v6 = 80;
    do
    {
      v7 = swift_bridgeObjectRetain();
      sub_20D615630(v7);
      v6 += 64;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease();
    v4 = v19;
  }
  v8 = *(_QWORD *)(v4 + 16);
  if (v8)
  {
    swift_bridgeObjectRetain();
    v9 = (uint64_t *)(v4 + 40);
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if (!*((_BYTE *)v9 + 40))
      {
        v13 = *(v9 - 1);
        v12 = *v9;
        swift_bridgeObjectRetain();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v10 = sub_20D62BF28(0, v10[2] + 1, 1, v10);
        v15 = v10[2];
        v14 = v10[3];
        if (v15 >= v14 >> 1)
          v10 = sub_20D62BF28((_QWORD *)(v14 > 1), v15 + 1, 1, v10);
        v10[2] = v15 + 1;
        v11 = &v10[2 * v15];
        v11[4] = v13;
        v11[5] = v12;
      }
      v9 += 7;
      --v8;
    }
    while (v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRelease();
  v16 = sub_20D618588((uint64_t)v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v17 = sub_20D6181B0(a1, a2, v16);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease_n();
  return v17;
}

uint64_t sub_20D6187C4(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_20D6187D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_20D618838;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_20D618838()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_20D618880(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D6188C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_20D61AFE0;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_20D618920(uint64_t a1, uint64_t a2)
{
  int64_t v2;
  uint64_t v3;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  BOOL v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v23 = MEMORY[0x24BEE4AF8];
    sub_20D6169A8(0, v2, 0);
    v3 = v23;
    v6 = (uint64_t *)(a1 + 40);
    v17 = *(_QWORD *)(a2 + 24);
    v18 = *(_QWORD *)(a2 + 16);
    do
    {
      v7 = *v6;
      v8 = v6[2];
      v9 = v6[4];
      v21 = v6[3];
      v22 = v6[1];
      LOBYTE(v10) = *((_BYTE *)v6 + 40);
      v11 = *(v6 - 1) == v18 && v7 == v17;
      v20 = *(v6 - 1);
      if (v11 || (v12 = *((_BYTE *)v6 + 41), (sub_20D635490() & 1) != 0))
      {
        v19 = 1;
        v10 = 1u >> (8 * v10);
      }
      else
      {
        v19 = v12;
      }
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v14 = *(_QWORD *)(v23 + 16);
      v13 = *(_QWORD *)(v23 + 24);
      if (v14 >= v13 >> 1)
        sub_20D6169A8(v13 > 1, v14 + 1, 1);
      v6 += 7;
      *(_QWORD *)(v23 + 16) = v14 + 1;
      v15 = v23 + 56 * v14;
      *(_QWORD *)(v15 + 32) = v20;
      *(_QWORD *)(v15 + 40) = v7;
      *(_QWORD *)(v15 + 48) = v22;
      *(_QWORD *)(v15 + 56) = v8;
      *(_QWORD *)(v15 + 64) = v21;
      *(_QWORD *)(v15 + 72) = v9;
      *(_BYTE *)(v15 + 80) = v10;
      *(_BYTE *)(v15 + 81) = v19;
      --v2;
    }
    while (v2);
  }
  return v3;
}

uint64_t sub_20D618AB0(uint64_t a1, uint64_t *a2)
{
  int64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v32;
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
  int v43;
  uint64_t v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  BOOL v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v52 = MEMORY[0x24BEE4AF8];
    sub_20D61698C(0, v2, 0);
    v6 = 0;
    v3 = v52;
    v7 = *a2;
    v38 = a1 + 32;
    v39 = a2[1];
    v37 = *a2;
    v32 = v2;
    v33 = (uint64_t)a2;
    do
    {
      v8 = (uint64_t *)(v38 + (v6 << 6));
      v9 = *v8;
      v45 = *(_OWORD *)(v8 + 3);
      v44 = v8[5];
      v41 = v8[1];
      v42 = v8[6];
      v43 = *((unsigned __int8 *)v8 + 56);
      v10 = v7 == *v8 && v39 == v8[1];
      v40 = v8[2];
      if (v10 || (sub_20D635490() & 1) != 0)
      {
        if (v43)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          sub_20D61A740((uint64_t)a2);
          v11 = swift_bridgeObjectRetain();
          v12 = sub_20D618920(v11, (uint64_t)a2);
          sub_20D61A774((uint64_t)a2);
          swift_bridgeObjectRelease();
        }
        else
        {
          v36 = v3;
          v13 = *(_QWORD *)(v42 + 16);
          if (v13)
          {
            v34 = v9;
            v35 = v6;
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            sub_20D61A740((uint64_t)a2);
            v51 = MEMORY[0x24BEE4AF8];
            swift_bridgeObjectRetain();
            sub_20D6169A8(0, v13, 0);
            v12 = v51;
            v14 = (uint64_t *)(v42 + 72);
            v15 = a2[2];
            v16 = a2[3];
            v46 = v16;
            v47 = v15;
            do
            {
              v17 = *(v14 - 5);
              v18 = *(v14 - 4);
              v19 = *(v14 - 2);
              v20 = *v14;
              v49 = *(v14 - 1);
              v50 = *(v14 - 3);
              v48 = (v17 != v15 || v18 != v16) && (sub_20D635490() & 1) == 0;
              v23 = *(_QWORD *)(v51 + 16);
              v22 = *(_QWORD *)(v51 + 24);
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              swift_bridgeObjectRetain();
              if (v23 >= v22 >> 1)
                sub_20D6169A8(v22 > 1, v23 + 1, 1);
              v14 += 7;
              *(_QWORD *)(v51 + 16) = v23 + 1;
              v24 = v51 + 56 * v23;
              *(_QWORD *)(v24 + 32) = v17;
              *(_QWORD *)(v24 + 40) = v18;
              *(_QWORD *)(v24 + 48) = v50;
              *(_QWORD *)(v24 + 56) = v19;
              *(_QWORD *)(v24 + 64) = v49;
              *(_QWORD *)(v24 + 72) = v20;
              *(_BYTE *)(v24 + 80) = v48;
              *(_BYTE *)(v24 + 81) = 1;
              --v13;
              v16 = v46;
              v15 = v47;
            }
            while (v13);
            a2 = (uint64_t *)v33;
            sub_20D61A774(v33);
            swift_bridgeObjectRelease();
            v6 = v35;
            v2 = v32;
            v3 = v36;
            v9 = v34;
          }
          else
          {
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            swift_bridgeObjectRetain();
            v12 = MEMORY[0x24BEE4AF8];
            v3 = v36;
          }
        }
        v25 = v9;
        swift_bridgeObjectRelease();
        v26 = v12;
        v7 = v37;
      }
      else
      {
        v25 = v9;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v26 = v42;
      }
      v53 = v3;
      v28 = *(_QWORD *)(v3 + 16);
      v27 = *(_QWORD *)(v3 + 24);
      if (v28 >= v27 >> 1)
      {
        v30 = v26;
        sub_20D61698C(v27 > 1, v28 + 1, 1);
        v26 = v30;
        v7 = v37;
        v3 = v53;
      }
      ++v6;
      *(_QWORD *)(v3 + 16) = v28 + 1;
      v29 = v3 + (v28 << 6);
      *(_QWORD *)(v29 + 32) = v25;
      *(_QWORD *)(v29 + 40) = v41;
      *(_QWORD *)(v29 + 48) = v40;
      *(_OWORD *)(v29 + 56) = v45;
      *(_QWORD *)(v29 + 72) = v44;
      *(_QWORD *)(v29 + 80) = v26;
      *(_BYTE *)(v29 + 88) = v43;
    }
    while (v6 != v2);
  }
  return v3;
}

uint64_t sub_20D618EA0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  __int128 *v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  uint64_t v26;
  uint64_t result;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[6];
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  _OWORD v47[3];
  uint64_t v48;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (!v2)
    return v3;
  v44 = MEMORY[0x24BEE4AF8];
  sub_20D63540C();
  v6 = 0;
  v38 = a1 + 32;
  v41 = a2;
  v36 = v2;
  do
  {
    v7 = (__int128 *)(v38 + (v6 << 6));
    *(_OWORD *)((char *)v47 + 9) = *(__int128 *)((char *)v7 + 41);
    v8 = v7[1];
    v45 = *v7;
    v46 = v8;
    v47[0] = v7[2];
    if (BYTE8(v47[1]) != 1)
    {
      sub_20D61A578(0, &qword_2549BDDD8);
      sub_20D61A5B0((uint64_t)&v45);
      swift_bridgeObjectRetain();
      sub_20D613E20(&v45, a2);
      goto LABEL_4;
    }
    v9 = *(_QWORD *)&v47[1];
    v48 = *(_QWORD *)&v47[1];
    v10 = *(_QWORD *)(*(_QWORD *)&v47[1] + 16);
    if (v10)
    {
      v37 = v6;
      v43[5] = v3;
      sub_20D61A5B0((uint64_t)&v45);
      swift_bridgeObjectRetain();
      sub_20D61A604((uint64_t)&v48);
      sub_20D63540C();
      v11 = v9 + 40;
      do
      {
        v16 = *(_QWORD *)(v11 - 8);
        v15 = *(_QWORD *)v11;
        v42 = v10;
        v17 = *(_QWORD *)(v11 + 32);
        v18 = *(unsigned __int8 *)(v11 + 40);
        v19 = *(_QWORD *)(a2 + 16);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        if (v19)
        {
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          v20 = sub_20D615AEC(v16, v15);
          if ((v21 & 1) != 0)
          {
            v40 = v18;
            v22 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v20);
            swift_bridgeObjectRetain();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v23 = *(_QWORD *)(v22 + 16);
            if (v23)
            {
              __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDDE0);
              v24 = (_QWORD *)swift_allocObject();
              v25 = _swift_stdlib_malloc_size(v24);
              v26 = v25 - 32;
              if (v25 < 32)
                v26 = v25 - 17;
              v24[2] = v23;
              v24[3] = 2 * (v26 >> 4);
              v39 = sub_20D617098((uint64_t)v43, v24 + 4, v23, v22);
              swift_bridgeObjectRetain();
              result = sub_20D61A6A4();
              if (v39 != v23)
              {
                __break(1u);
                return result;
              }
            }
            swift_bridgeObjectRelease();
            v18 = v40;
          }
          else
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
        }
        else
        {
          swift_bridgeObjectRetain();
        }
        v28 = (void *)sub_20D635160();
        v29 = (void *)sub_20D635160();
        if (v17)
        {
          swift_bridgeObjectRetain();
          v12 = (void *)sub_20D635160();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v12 = 0;
        }
        v11 += 56;
        v13 = objc_allocWithZone(MEMORY[0x24BDE9778]);
        v14 = (void *)sub_20D6351C0();
        swift_bridgeObjectRelease();
        objc_msgSend(v13, sel_initWithTitle_identifier_subtitle_selected_requiredOptionsIdentifiers_, v28, v29, v12, v18 == 0, v14);

        sub_20D6353F4();
        sub_20D635418();
        sub_20D635424();
        sub_20D635400();
        v10 = v42 - 1;
        a2 = v41;
      }
      while (v42 != 1);
      sub_20D61A62C((uint64_t)&v48);
      swift_bridgeObjectRelease();
      v3 = MEMORY[0x24BEE4AF8];
      v2 = v36;
      v6 = v37;
      if (!*((_QWORD *)&v46 + 1))
        goto LABEL_25;
    }
    else
    {
      sub_20D61A5B0((uint64_t)&v45);
      if (!*((_QWORD *)&v46 + 1))
      {
LABEL_25:
        v30 = 0;
        goto LABEL_26;
      }
    }
    swift_bridgeObjectRetain();
    v30 = (void *)sub_20D635160();
    swift_bridgeObjectRelease();
LABEL_26:
    v31 = (void *)sub_20D635160();
    v32 = v6;
    if (*((_QWORD *)&v47[0] + 1))
    {
      swift_bridgeObjectRetain();
      v33 = (void *)sub_20D635160();
      sub_20D61A654((uint64_t)&v45);
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_20D61A654((uint64_t)&v45);
      v33 = 0;
    }
    v34 = objc_allocWithZone(MEMORY[0x24BDE9780]);
    sub_20D61A578(0, &qword_2549BD950);
    v35 = (void *)sub_20D6351C0();
    swift_bridgeObjectRelease();
    objc_msgSend(v34, sel_initWithTitle_identifier_footer_options_, v30, v31, v33, v35);

    v6 = v32;
LABEL_4:
    ++v6;
    sub_20D6353F4();
    sub_20D635418();
    sub_20D635424();
    sub_20D635400();
    a2 = v41;
  }
  while (v6 != v2);
  return v44;
}

uint64_t _s14CloudSharingUI0B22OptionsObservableModelC018collaborationShareD013layoutMargins19userDidChangeOption011contentSizelM0ACSo016_SWCollaborationhD0CSg_05SwiftC010EdgeInsetsVySS_SSSbAJtcSgySo6CGSizeVcSgtcfC_0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, double a8, double a9)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  id v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  id v35;
  void *v36;
  unint64_t v37;
  void (*v38)(uint64_t, uint64_t, uint64_t, uint64_t, char, unint64_t);
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;

  v46 = a4;
  v17 = sub_20D634BB4();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D634B9C();
  v21 = a1;
  v22 = sub_20D634BA8();
  v23 = sub_20D6352A4();
  if (os_log_type_enabled(v22, v23))
  {
    v41 = v18;
    v42 = v17;
    v43 = a5;
    v45 = a3;
    v24 = (uint8_t *)swift_slowAlloc();
    v25 = swift_slowAlloc();
    v48 = v25;
    *(_DWORD *)v24 = 136315138;
    v44 = a2;
    if (a1)
    {
      v26 = objc_msgSend(v21, sel_description);
      v27 = sub_20D635190();
      v29 = v28;

    }
    else
    {
      v29 = 0xE500000000000000;
      v27 = 0x296C696E28;
    }
    v47 = sub_20D62C034(v27, v29, &v48);
    sub_20D63537C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_20D60A000, v22, v23, "SharingOptionsViewModel init options: %s", v24, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BA56C8](v25, -1, -1);
    MEMORY[0x212BA56C8](v24, -1, -1);

    (*(void (**)(char *, uint64_t))(v41 + 8))(v20, v42);
    a2 = v44;
    a3 = v45;
    a5 = v43;
    if (!a1)
      goto LABEL_10;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
    if (!a1)
    {
LABEL_10:
      v34 = (_QWORD *)swift_allocObject();
      v34[2] = 0;
      v34[3] = 0;
      v34[4] = a2;
      v34[5] = a3;
      sub_20D6187C4(a2);
      v38 = sub_20D61A3E4;
      goto LABEL_11;
    }
  }
  v30 = objc_msgSend(v21, sel_summary);
  v31 = sub_20D635190();
  v33 = v32;

  v34 = (_QWORD *)swift_allocObject();
  v34[2] = v31;
  v34[3] = v33;
  v34[4] = a2;
  v34[5] = a3;
  sub_20D6187C4(a2);
  v35 = objc_msgSend(v21, sel_optionsGroups);
  if (!v35)
  {
    v38 = sub_20D61AFE4;
LABEL_11:
    v37 = MEMORY[0x24BEE4AF8];
    goto LABEL_12;
  }
  v36 = v35;
  sub_20D61A578(0, (unint64_t *)&qword_2549BDDB8);
  v37 = sub_20D6351CC();

  v38 = sub_20D61AFE4;
LABEL_12:
  type metadata accessor for SharingOptionsObservableModel();
  v39 = swift_allocObject();
  swift_retain();
  SharingOptionsObservableModel.init(collaborationOptionsGroups:layoutMargins:userDidChangeOption:contentSizeDidChange:)(v37, (uint64_t)v38, (uint64_t)v34, v46, a5, a6, a7, a8, a9);
  sub_20D618880(a2);
  swift_release();

  return v39;
}

uint64_t sub_20D619790()
{
  return type metadata accessor for SharingOptionsObservableModel();
}

void sub_20D619798()
{
  unint64_t v0;
  unint64_t v1;

  sub_20D619930();
  if (v0 <= 0x3F)
  {
    sub_20D634B90();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for SharingOptionsObservableModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.sourceAppBundleID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.sourceAppBundleID.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.sourceAppBundleID.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.userAction.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.userAction.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.userAction.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.contentSize.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.contentSize.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.contentSize.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.collaborationOptionsGroups.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.collaborationOptionsGroups.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.collaborationOptionsGroups.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 408))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.__allocating_init(collaborationOptionsGroups:layoutMargins:userDidChangeOption:contentSizeDidChange:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 800))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.__allocating_init(collaborationOptionsGroups:userDidChangeOption:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 808))();
}

uint64_t dispatch thunk of SharingOptionsObservableModel.setSourceAppBundleID(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 816))();
}

void sub_20D619930()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2549BD9D8[0])
  {
    type metadata accessor for AlertViewModel(255);
    v0 = sub_20D635370();
    if (!v1)
      atomic_store(v0, qword_2549BD9D8);
  }
}

uint64_t initializeBufferWithCopyOfBuffer for SharingOptionsObservableModel.UserAction(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SharingOptionsObservableModel.UserAction()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SharingOptionsObservableModel.UserAction(uint64_t a1, uint64_t a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SharingOptionsObservableModel.UserAction(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
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

uint64_t assignWithTake for SharingOptionsObservableModel.UserAction(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for SharingOptionsObservableModel.UserAction(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SharingOptionsObservableModel.UserAction(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SharingOptionsObservableModel.UserAction()
{
  return &type metadata for SharingOptionsObservableModel.UserAction;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_20D619BA0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_20D619BC0(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
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
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for UIEdgeInsets(uint64_t a1)
{
  sub_20D61AD6C(a1, &qword_2549BDD58);
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
  sub_20D61AD6C(a1, &qword_2549BDD60);
}

uint64_t destroy for SharingOptionsObservableModel.Group()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SharingOptionsObservableModel.Group(uint64_t a1, uint64_t a2)
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
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SharingOptionsObservableModel.Group(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SharingOptionsObservableModel.Group(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for SharingOptionsObservableModel.Group(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 57))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SharingOptionsObservableModel.Group(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 56) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 57) = 1;
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
    *(_BYTE *)(result + 57) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SharingOptionsObservableModel.Group()
{
  return &type metadata for SharingOptionsObservableModel.Group;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_20D619EA0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_20D619EC0(uint64_t result, int a2, int a3)
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
  sub_20D61AD6C(a1, &qword_2549BDD68);
}

uint64_t sub_20D619EFC()
{
  return MEMORY[0x24BEE0D10];
}

uint64_t sub_20D619F08()
{
  return sub_20D619F34(&qword_2549BDD70, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_20D6362EC);
}

uint64_t sub_20D619F34(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x212BA5644](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_20D619F74()
{
  return sub_20D619F34(&qword_2549BDD78, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_20D6362C0);
}

uint64_t sub_20D619FA0()
{
  return sub_20D619F34(&qword_2549BDD80, (uint64_t (*)(uint64_t))type metadata accessor for URLResourceKey, (uint64_t)&unk_20D63635C);
}

uint64_t sub_20D619FCC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_20D619FF4()
{
  return sub_20D613A70();
}

uint64_t sub_20D61A01C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  swift_retain();
  swift_retain();
  sub_20D617A08(v2, v3);
  return a1;
}

uint64_t sub_20D61A08C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_20D61A0D4()
{
  return sub_20D613A70();
}

uint64_t sub_20D61A0FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AlertViewModelButton(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20D61A148()
{
  uint64_t v0;

  return sub_20D61043C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_20D61A168()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlertBool) = *(_BYTE *)(v0 + 24);
}

uint64_t sub_20D61A180(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AlertViewModelButton(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20D61A1BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BD998);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20D61A204(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BD998);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_20D61A24C()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16)
           + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__shouldValidateWithAlert) = *(_BYTE *)(v0 + 24);
}

uint64_t sub_20D61A264(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  swift_release();
  swift_release();
  sub_20D617A90(v2, v3);
  return a1;
}

uint64_t objectdestroy_19Tm()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  if (*(_QWORD *)(v0 + 48))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_20D61A324()
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_20D61A360()
{
  return sub_20D613108();
}

uint64_t sub_20D61A370()
{
  return sub_20D61A500();
}

uint64_t sub_20D61A384()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = v0[4];
  v2 = (_QWORD *)(v0[2] + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__disableGroupWithID);
  *v2 = v0[3];
  v2[1] = v1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20D61A3CC()
{
  return sub_20D61A540();
}

void sub_20D61A3E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, unint64_t a6)
{
  uint64_t v6;

  sub_20D6120A4(a1, a2, a3, a4, a5, a6, *(_QWORD *)(v6 + 16), *(_QWORD *)(v6 + 24), *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, id))(v6 + 32));
}

uint64_t objectdestroy_48Tm()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v0 + 32))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D61A444()
{
  return sub_20D6141A8();
}

uint64_t (*sub_20D61A44C())()
{
  swift_allocObject();
  swift_weakInit();
  return sub_20D61A494;
}

uint64_t sub_20D61A494()
{
  return sub_20D614258();
}

uint64_t sub_20D61A49C()
{
  return sub_20D6145B0();
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

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BA5638](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_20D61A500()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__allGroups) = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20D61A540()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + 152) = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20D61A578(uint64_t a1, unint64_t *a2)
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

uint64_t sub_20D61A5B0(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_20D61A604(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_20D61A62C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_20D61A654(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_20D61A6A4()
{
  return swift_release();
}

uint64_t sub_20D61A6B0(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_20D61A6F8(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_20D61A740(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_20D61A774(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_20D61A7A8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_20D61A7E4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D61A808(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_20D618838;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2549BDDF8 + dword_2549BDDF8))(a1, v4);
}

uint64_t sub_20D61A878(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x212BA5644](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_20D61A8B8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v1 = v0[2];
  v2 = v0[3];
  v3 = v0[4];
  result = swift_beginAccess();
  *(_QWORD *)(v1 + 72) = v2;
  *(_QWORD *)(v1 + 80) = v3;
  return result;
}

uint64_t sub_20D61A908(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(unsigned __int8 *)(a1 + 32));
  return a1;
}

uint64_t destroy for SharingOptionsObservableModel.Group.Option()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for SharingOptionsObservableModel.Group.Option(uint64_t a1, uint64_t a2)
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
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SharingOptionsObservableModel.Group.Option(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  return a1;
}

__n128 __swift_memcpy50_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SharingOptionsObservableModel.Group.Option(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  return a1;
}

uint64_t getEnumTagSinglePayload for SharingOptionsObservableModel.Group.Option(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 50))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SharingOptionsObservableModel.Group.Option(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 50) = 1;
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
    *(_BYTE *)(result + 50) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SharingOptionsObservableModel.Group.Option()
{
  return &type metadata for SharingOptionsObservableModel.Group.Option;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SharingOptionsObservableModel.Group.Kind(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SharingOptionsObservableModel.Group.Kind(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20D61AC78 + 4 * byte_20D636005[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_20D61ACAC + 4 * byte_20D636000[v4]))();
}

uint64_t sub_20D61ACAC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D61ACB4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20D61ACBCLL);
  return result;
}

uint64_t sub_20D61ACC8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20D61ACD0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_20D61ACD4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D61ACDC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D61ACE8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_20D61ACF4(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for SharingOptionsObservableModel.Group.Kind()
{
  return &type metadata for SharingOptionsObservableModel.Group.Kind;
}

unint64_t sub_20D61AD14()
{
  unint64_t result;

  result = qword_2549BDE28;
  if (!qword_2549BDE28)
  {
    result = MEMORY[0x212BA5644](&unk_20D636514, &type metadata for SharingOptionsObservableModel.Group.Kind);
    atomic_store(result, (unint64_t *)&qword_2549BDE28);
  }
  return result;
}

void type metadata accessor for UILayoutPriority(uint64_t a1)
{
  sub_20D61AD6C(a1, &qword_2549BDE30);
}

void sub_20D61AD6C(uint64_t a1, unint64_t *a2)
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

uint64_t getEnumTagSinglePayload for SharingOptionsObservableModel.Group.Option.AccessoryState(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SharingOptionsObservableModel.Group.Option.AccessoryState(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20D61AE8C + 4 * byte_20D63600F[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_20D61AEC0 + 4 * byte_20D63600A[v4]))();
}

uint64_t sub_20D61AEC0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D61AEC8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20D61AED0);
  return result;
}

uint64_t sub_20D61AEDC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20D61AEE4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_20D61AEE8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D61AEF0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_20D61AEFC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SharingOptionsObservableModel.Group.Option.AccessoryState()
{
  return &type metadata for SharingOptionsObservableModel.Group.Option.AccessoryState;
}

unint64_t sub_20D61AF18()
{
  unint64_t result;

  result = qword_2549BDE38;
  if (!qword_2549BDE38)
  {
    result = MEMORY[0x212BA5644](&unk_20D636604, &type metadata for SharingOptionsObservableModel.Group.Option.AccessoryState);
    atomic_store(result, (unint64_t *)&qword_2549BDE38);
  }
  return result;
}

uint64_t sub_20D61AF5C()
{
  return sub_20D619F34(&qword_2549BDE40, (uint64_t (*)(uint64_t))type metadata accessor for UILayoutPriority, (uint64_t)&unk_20D6366A4);
}

uint64_t sub_20D61AF88()
{
  return sub_20D619F34(&qword_2549BDE48, (uint64_t (*)(uint64_t))type metadata accessor for UILayoutPriority, (uint64_t)&unk_20D636678);
}

uint64_t sub_20D61AFB4()
{
  return sub_20D619F34(&qword_2549BDE50, (uint64_t (*)(uint64_t))type metadata accessor for UILayoutPriority, (uint64_t)&unk_20D636714);
}

uint64_t sub_20D61AFE8()
{
  return sub_20D61A148();
}

uint64_t sub_20D61AFFC()
{
  return sub_20D617AD4();
}

uint64_t sub_20D61B010()
{
  return sub_20D617A78();
}

uint64_t sub_20D61B030()
{
  return sub_20D6179EC();
}

void sub_20D61B048()
{
  sub_20D61A168();
}

uint64_t sub_20D61B05C()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20D634C2C();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_20D61B0CC()
{
  uint64_t v0;
  id v1;

  v1 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  objc_msgSend(v1, sel_userInterfaceIdiom);

  swift_beginAccess();
  sub_20D634BFC();
  swift_endAccess();
  return v0;
}

uint64_t sub_20D61B18C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC14CloudSharingUI13UserInterface__idiom;
  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_2549BE030);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_20D61B1E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_20D634BF0();
  *a1 = result;
  return result;
}

uint64_t sub_20D61B208()
{
  uint64_t v0;

  type metadata accessor for UserInterface(0);
  v0 = swift_allocObject();
  sub_20D61B0CC();
  return v0;
}

uint64_t SharingOptionsView.viewModel.getter()
{
  return sub_20D61B26C((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x24BDEB790]);
}

uint64_t type metadata accessor for SharingOptionsView(uint64_t a1)
{
  return sub_20D61BC98(a1, (uint64_t *)&unk_2549BDFC8);
}

uint64_t SharingOptionsView.$viewModel.getter()
{
  return sub_20D61B26C(MEMORY[0x24BDEB798]);
}

uint64_t sub_20D61B26C(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (uint64_t *)(v1 + *(int *)(type metadata accessor for SharingOptionsView(0) + 24));
  v3 = *v2;
  v4 = v2[1];
  v5 = *((unsigned __int8 *)v2 + 16);
  v6 = type metadata accessor for SharingOptionsViewModel();
  v7 = sub_20D619F34(&qword_2549BDE68, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsViewModel, (uint64_t)&protocol conformance descriptor for SharingOptionsViewModel);
  return a1(v3, v4, v5, v6, v7);
}

double SharingOptionsView.init(viewModel:)@<D0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  int *v4;
  char *v5;
  uint64_t v6;
  double result;
  char *v8;
  __int128 v9;

  *a2 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE70);
  swift_storeEnumTagMultiPayload();
  v4 = (int *)type metadata accessor for SharingOptionsView(0);
  v5 = (char *)a2 + v4[5];
  *(_QWORD *)v5 = sub_20D61B208;
  *((_QWORD *)v5 + 1) = 0;
  v5[16] = 0;
  v6 = v4[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE78);
  sub_20D635010();
  result = *(double *)&v9;
  *(_OWORD *)((char *)a2 + v6) = v9;
  v8 = (char *)a2 + v4[6];
  *(_QWORD *)v8 = sub_20D61BA4C;
  *((_QWORD *)v8 + 1) = a1;
  v8[16] = 0;
  return result;
}

uint64_t SharingOptionsView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t v32;

  v29 = a1;
  v30 = sub_20D635238();
  v28 = *(_QWORD *)(v30 - 8);
  MEMORY[0x24BDAC7A8](v30);
  v3 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for SharingOptionsView(0);
  v26 = *(_QWORD *)(v4 - 8);
  v5 = *(_QWORD *)(v26 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for SharingOptionsGroupsView(0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (uint64_t *)((char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = *(int *)(v4 + 28);
  v27 = v1;
  v31 = *(_OWORD *)(v1 + v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE88);
  sub_20D63501C();
  v14 = v32;
  *v12 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE70);
  swift_storeEnumTagMultiPayload();
  v15 = (char *)v12 + *(int *)(v10 + 20);
  *(_QWORD *)v15 = sub_20D61F324;
  *((_QWORD *)v15 + 1) = 0;
  v15[16] = 0;
  if (!v14)
    _s14CloudSharingUI0B22OptionsObservableModelC018collaborationShareD013layoutMargins19userDidChangeOption011contentSizelM0ACSo016_SWCollaborationhD0CSg_05SwiftC010EdgeInsetsVySS_SSSbAJtcSgySo6CGSizeVcSgtcfC_0(0, 0, 0, 0, 0, 0.0, 0.0, 0.0, 0.0);
  type metadata accessor for SharingOptionsObservableModel();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D6350D0();
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))((char *)v12 + *(int *)(v10 + 24), v9, v6);
  sub_20D61BBEC(v27, (uint64_t)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SharingOptionsView);
  v16 = (*(unsigned __int8 *)(v26 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
  v17 = swift_allocObject();
  sub_20D61BB44((uint64_t)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), v17 + v16);
  sub_20D635220();
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDEA0);
  v19 = v29;
  v20 = (char *)(v29 + *(int *)(v18 + 36));
  v21 = sub_20D634D1C();
  v22 = v28;
  v23 = v30;
  (*(void (**)(char *, char *, uint64_t))(v28 + 16))(&v20[*(int *)(v21 + 20)], v3, v30);
  *(_QWORD *)v20 = &unk_2549BDE98;
  *((_QWORD *)v20 + 1) = v17;
  sub_20D61BBEC((uint64_t)v12, v19, type metadata accessor for SharingOptionsGroupsView);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v3, v23);
  return sub_20D61BC30((uint64_t)v12);
}

uint64_t sub_20D61B6A4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = a1;
  sub_20D635214();
  *(_QWORD *)(v1 + 48) = sub_20D635208();
  sub_20D6351FC();
  return swift_task_switch();
}

uint64_t sub_20D61B710()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v16 = *(_QWORD *)(v0 + 40);
  swift_release();
  v15 = type metadata accessor for SharingOptionsView(0);
  type metadata accessor for SharingOptionsViewModel();
  sub_20D619F34(&qword_2549BDE68, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsViewModel, (uint64_t)&protocol conformance descriptor for SharingOptionsViewModel);
  sub_20D634CC8();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20D634C2C();
  swift_release();
  swift_release();
  swift_release();
  v1 = *(_QWORD *)(v0 + 16);
  v2 = sub_20D634CC8();
  v3 = *(double *)(v2 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_layoutMargins);
  v4 = *(double *)(v2 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_layoutMargins + 8);
  v5 = *(double *)(v2 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_layoutMargins + 16);
  v6 = *(double *)(v2 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_layoutMargins + 24);
  swift_release();
  v7 = sub_20D634CC8();
  v8 = *(_QWORD *)(v7 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_userDidChangeOption);
  v9 = *(_QWORD *)(v7 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_userDidChangeOption + 8);
  sub_20D6187C4(v8);
  swift_release();
  v10 = sub_20D634CC8();
  v11 = *(_QWORD *)(v10 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_contentSizeDidChange);
  v12 = *(_QWORD *)(v10 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_contentSizeDidChange + 8);
  sub_20D6187C4(v11);
  swift_release();
  type metadata accessor for SharingOptionsObservableModel();
  swift_allocObject();
  v13 = SharingOptionsObservableModel.init(collaborationOptionsGroups:layoutMargins:userDidChangeOption:contentSizeDidChange:)(v1, v8, v9, v11, v12, v3, v4, v5, v6);
  *(_OWORD *)(v0 + 16) = *(_OWORD *)(v16 + *(int *)(v15 + 28));
  *(_QWORD *)(v0 + 32) = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE88);
  sub_20D635028();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20D61B970()
{
  return sub_20D634F5C();
}

uint64_t sub_20D61B98C()
{
  return sub_20D634D64();
}

uint64_t sub_20D61B9AC()
{
  return sub_20D634D64();
}

uint64_t sub_20D61B9CC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_20D634CB0();
  MEMORY[0x24BDAC7A8](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_20D634D70();
}

uint64_t sub_20D61BA4C()
{
  return swift_retain();
}

uint64_t sub_20D61BA54()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SharingOptionsView(0) - 8) + 80);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v2 = sub_20D634CB0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v0 + ((v1 + 16) & ~v1), v2);
  }
  else
  {
    swift_release();
  }
  sub_20D61BB3C();
  sub_20D61BB3C();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D61BB3C()
{
  return swift_release();
}

uint64_t sub_20D61BB44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SharingOptionsView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20D61BB88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SharingOptionsView(0) - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_20D618838;
  return sub_20D61B6A4(v3);
}

uint64_t sub_20D61BBEC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_20D61BC30(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SharingOptionsGroupsView(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20D61BC6C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D61BC7C()
{
  return type metadata accessor for UserInterface(0);
}

uint64_t type metadata accessor for UserInterface(uint64_t a1)
{
  return sub_20D61BC98(a1, (uint64_t *)&unk_2549BDED8);
}

uint64_t sub_20D61BC98(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

void sub_20D61BCCC()
{
  unint64_t v0;

  sub_20D61BD38();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_20D61BD38()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2549BDEE8[0])
  {
    v0 = sub_20D634C44();
    if (!v1)
      atomic_store(v0, qword_2549BDEE8);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for SharingOptionsView(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    v4 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE70);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_20D634CB0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v4, a2, v7);
    }
    else
    {
      *v4 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = a3[5];
    v10 = (char *)v4 + v9;
    v11 = (char *)a2 + v9;
    v12 = *(_QWORD *)v11;
    v13 = *((_QWORD *)v11 + 1);
    v14 = v11[16];
    sub_20D61BEDC();
    *(_QWORD *)v10 = v12;
    *((_QWORD *)v10 + 1) = v13;
    v10[16] = v14;
    v15 = a3[6];
    v16 = (char *)v4 + v15;
    v17 = (char *)a2 + v15;
    v18 = *(_QWORD *)v17;
    v19 = *((_QWORD *)v17 + 1);
    v20 = v17[16];
    sub_20D61BEDC();
    *(_QWORD *)v16 = v18;
    *((_QWORD *)v16 + 1) = v19;
    v16[16] = v20;
    v21 = a3[7];
    v22 = (uint64_t *)((char *)v4 + v21);
    v23 = (uint64_t *)((char *)a2 + v21);
    v24 = v23[1];
    *v22 = *v23;
    v22[1] = v24;
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_20D61BEDC()
{
  return swift_retain();
}

uint64_t destroy for SharingOptionsView(uint64_t a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v2 = sub_20D634CB0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  }
  else
  {
    swift_release();
  }
  sub_20D61BB3C();
  sub_20D61BB3C();
  swift_release();
  return swift_release();
}

_QWORD *initializeWithCopy for SharingOptionsView(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_20D634CB0();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = *(_QWORD *)v9;
  v11 = *((_QWORD *)v9 + 1);
  v12 = v9[16];
  sub_20D61BEDC();
  *(_QWORD *)v8 = v10;
  *((_QWORD *)v8 + 1) = v11;
  v8[16] = v12;
  v13 = a3[6];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = *(_QWORD *)v15;
  v17 = *((_QWORD *)v15 + 1);
  v18 = v15[16];
  sub_20D61BEDC();
  *(_QWORD *)v14 = v16;
  *((_QWORD *)v14 + 1) = v17;
  v14[16] = v18;
  v19 = a3[7];
  v20 = (_QWORD *)((char *)a1 + v19);
  v21 = (_QWORD *)((char *)a2 + v19);
  v22 = v21[1];
  *v20 = *v21;
  v20[1] = v22;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for SharingOptionsView(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char *v20;
  char *v21;

  if (a1 != a2)
  {
    sub_20D61C21C((uint64_t)a1);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE70);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_20D634CB0();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = *(_QWORD *)v9;
  v11 = *((_QWORD *)v9 + 1);
  v12 = v9[16];
  sub_20D61BEDC();
  *(_QWORD *)v8 = v10;
  *((_QWORD *)v8 + 1) = v11;
  v8[16] = v12;
  sub_20D61BB3C();
  v13 = a3[6];
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = *(_QWORD *)v15;
  v17 = *((_QWORD *)v15 + 1);
  v18 = v15[16];
  sub_20D61BEDC();
  *(_QWORD *)v14 = v16;
  *((_QWORD *)v14 + 1) = v17;
  v14[16] = v18;
  sub_20D61BB3C();
  v19 = a3[7];
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  *(_QWORD *)((char *)a1 + v19) = *(_QWORD *)((char *)a2 + v19);
  swift_retain();
  swift_release();
  *((_QWORD *)v20 + 1) = *((_QWORD *)v21 + 1);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_20D61C21C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE70);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *initializeWithTake for SharingOptionsView(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  char *v13;
  char *v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_20D634CB0();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = a3[5];
  v9 = a3[6];
  v10 = &a1[v8];
  v11 = &a2[v8];
  v12 = *(_OWORD *)v11;
  v10[16] = v11[16];
  *(_OWORD *)v10 = v12;
  v13 = &a1[v9];
  v14 = &a2[v9];
  *(_OWORD *)v13 = *(_OWORD *)v14;
  v13[16] = v14[16];
  *(_OWORD *)&a1[a3[7]] = *(_OWORD *)&a2[a3[7]];
  return a1;
}

char *assignWithTake for SharingOptionsView(char *a1, char *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char v15;
  uint64_t v16;
  char *v17;
  char *v18;

  if (a1 != a2)
  {
    sub_20D61C21C((uint64_t)a1);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE70);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_20D634CB0();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = a3[5];
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = v10[16];
  *(_OWORD *)v9 = *(_OWORD *)v10;
  v9[16] = v11;
  sub_20D61BB3C();
  v12 = a3[6];
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = v14[16];
  *(_OWORD *)v13 = *(_OWORD *)v14;
  v13[16] = v15;
  sub_20D61BB3C();
  v16 = a3[7];
  v17 = &a1[v16];
  v18 = &a2[v16];
  *(_QWORD *)&a1[v16] = *(_QWORD *)v18;
  swift_release();
  *((_QWORD *)v17 + 1) = *((_QWORD *)v18 + 1);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SharingOptionsView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D61C46C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDF68);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 28));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  v10 = v9 - 1;
  if (v10 < 0)
    v10 = -1;
  return (v10 + 1);
}

uint64_t storeEnumTagSinglePayload for SharingOptionsView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D61C504(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDF68);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 28)) = a2;
  return result;
}

void sub_20D61C580()
{
  unint64_t v0;

  sub_20D61C5FC();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_20D61C5FC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2549BDFD8[0])
  {
    sub_20D634CB0();
    v0 = sub_20D634CBC();
    if (!v1)
      atomic_store(v0, qword_2549BDFD8);
  }
}

unint64_t sub_20D61C654()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549BE010;
  if (!qword_2549BE010)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BDEA0);
    v2[0] = sub_20D619F34(&qword_2549BE018, type metadata accessor for SharingOptionsGroupsView, (uint64_t)&protocol conformance descriptor for SharingOptionsGroupsView);
    v2[1] = sub_20D619F34(&qword_2549BE020, (uint64_t (*)(uint64_t))MEMORY[0x24BDEC4E0], MEMORY[0x24BDEC4C8]);
    result = MEMORY[0x212BA5644](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549BE010);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for UserInterface.Idiom(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20D61C73C + 4 * byte_20D6367E5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_20D61C770 + 4 * byte_20D6367E0[v4]))();
}

uint64_t sub_20D61C770(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D61C778(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20D61C780);
  return result;
}

uint64_t sub_20D61C78C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20D61C794);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_20D61C798(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20D61C7A0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for UserInterface.Idiom()
{
  return &type metadata for UserInterface.Idiom;
}

unint64_t sub_20D61C7C0()
{
  unint64_t result;

  result = qword_2549BE028;
  if (!qword_2549BE028)
  {
    result = MEMORY[0x212BA5644](&unk_20D636930, &type metadata for UserInterface.Idiom);
    atomic_store(result, (unint64_t *)&qword_2549BE028);
  }
  return result;
}

uint64_t sub_20D61C804()
{
  return MEMORY[0x24BDB9D70];
}

char *sub_20D61C820(char *a1, uint64_t *a2, uint64_t a3)
{
  char *v4;
  int v5;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  _QWORD *v18;
  uint64_t v19;
  void (*v20)(char *, _QWORD, uint64_t, int *);
  uint64_t v21;
  char *v22;
  char *v23;
  uint64_t v24;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *(_QWORD *)a1 = *a2;
    v4 = (char *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = (int *)type metadata accessor for AlertViewModel(0);
    v8 = *((_QWORD *)v7 - 1);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, int *))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BD998);
      memcpy(v4, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      v11 = sub_20D634B3C();
      (*(void (**)(char *, uint64_t *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v4, a2, v11);
      v12 = v7[5];
      v13 = &v4[v12];
      v14 = (uint64_t *)((char *)a2 + v12);
      v15 = v14[1];
      *(_QWORD *)v13 = *v14;
      *((_QWORD *)v13 + 1) = v15;
      v16 = v7[6];
      v17 = &v4[v16];
      v18 = (uint64_t *)((char *)a2 + v16);
      v19 = v18[1];
      *(_QWORD *)v17 = *v18;
      *((_QWORD *)v17 + 1) = v19;
      *(_QWORD *)&v4[v7[7]] = *(uint64_t *)((char *)a2 + v7[7]);
      v20 = *(void (**)(char *, _QWORD, uint64_t, int *))(v8 + 56);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v20(v4, 0, 1, v7);
    }
    v21 = *(int *)(a3 + 20);
    v22 = &v4[v21];
    v23 = (char *)a2 + v21;
    v24 = *((_QWORD *)v23 + 1);
    *(_QWORD *)v22 = *(_QWORD *)v23;
    *((_QWORD *)v22 + 1) = v24;
    v22[16] = v23[16];
    swift_retain();
  }
  swift_retain();
  return v4;
}

uint64_t type metadata accessor for AlertViewModel(uint64_t a1)
{
  return sub_20D61BC98(a1, qword_2549BE120);
}

uint64_t sub_20D61C990(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = type metadata accessor for AlertViewModel(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 1, v2))
  {
    v3 = sub_20D634B3C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_release();
  return swift_release();
}

char *sub_20D61CA3C(char *a1, char *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, _QWORD, uint64_t, int *);
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;

  v6 = (int *)type metadata accessor for AlertViewModel(0);
  v7 = *((_QWORD *)v6 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BD998);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    v9 = sub_20D634B3C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(a1, a2, v9);
    v10 = v6[5];
    v11 = &a1[v10];
    v12 = &a2[v10];
    v13 = *((_QWORD *)v12 + 1);
    *(_QWORD *)v11 = *(_QWORD *)v12;
    *((_QWORD *)v11 + 1) = v13;
    v14 = v6[6];
    v15 = &a1[v14];
    v16 = &a2[v14];
    v17 = *((_QWORD *)v16 + 1);
    *(_QWORD *)v15 = *(_QWORD *)v16;
    *((_QWORD *)v15 + 1) = v17;
    *(_QWORD *)&a1[v6[7]] = *(_QWORD *)&a2[v6[7]];
    v18 = *(void (**)(char *, _QWORD, uint64_t, int *))(v7 + 56);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v18(a1, 0, 1, v6);
  }
  v19 = *(int *)(a3 + 20);
  v20 = &a1[v19];
  v21 = &a2[v19];
  v22 = *((_QWORD *)v21 + 1);
  *(_QWORD *)v20 = *(_QWORD *)v21;
  *((_QWORD *)v20 + 1) = v22;
  v20[16] = v21[16];
  swift_retain();
  swift_retain();
  return a1;
}

char *sub_20D61CB70(char *a1, char *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, int *);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  void (*v18)(char *, _QWORD, uint64_t, int *);
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  char *v29;
  char *v30;

  v6 = (int *)type metadata accessor for AlertViewModel(0);
  v7 = *((_QWORD *)v6 - 1);
  v8 = *(uint64_t (**)(char *, uint64_t, int *))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      v24 = sub_20D634B3C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v24 - 8) + 24))(a1, a2, v24);
      v25 = v6[5];
      v26 = &a1[v25];
      v27 = &a2[v25];
      *(_QWORD *)v26 = *(_QWORD *)v27;
      *((_QWORD *)v26 + 1) = *((_QWORD *)v27 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v28 = v6[6];
      v29 = &a1[v28];
      v30 = &a2[v28];
      *(_QWORD *)v29 = *(_QWORD *)v30;
      *((_QWORD *)v29 + 1) = *((_QWORD *)v30 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)&a1[v6[7]] = *(_QWORD *)&a2[v6[7]];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    sub_20D61CD8C((uint64_t)a1);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BD998);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
    goto LABEL_7;
  }
  v11 = sub_20D634B3C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
  v12 = v6[5];
  v13 = &a1[v12];
  v14 = &a2[v12];
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *((_QWORD *)v13 + 1) = *((_QWORD *)v14 + 1);
  v15 = v6[6];
  v16 = &a1[v15];
  v17 = &a2[v15];
  *(_QWORD *)v16 = *(_QWORD *)v17;
  *((_QWORD *)v16 + 1) = *((_QWORD *)v17 + 1);
  *(_QWORD *)&a1[v6[7]] = *(_QWORD *)&a2[v6[7]];
  v18 = *(void (**)(char *, _QWORD, uint64_t, int *))(v7 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v18(a1, 0, 1, v6);
LABEL_7:
  v20 = *(int *)(a3 + 20);
  v21 = &a1[v20];
  v22 = &a2[v20];
  *(_QWORD *)&a1[v20] = *(_QWORD *)&a2[v20];
  swift_retain();
  swift_release();
  *((_QWORD *)v21 + 1) = *((_QWORD *)v22 + 1);
  swift_retain();
  swift_release();
  v21[16] = v22[16];
  return a1;
}

uint64_t sub_20D61CD8C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AlertViewModel(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_20D61CDC8(char *a1, char *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;

  v6 = (int *)type metadata accessor for AlertViewModel(0);
  v7 = *((_QWORD *)v6 - 1);
  if ((*(unsigned int (**)(char *, uint64_t, int *))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BD998);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    v9 = sub_20D634B3C();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(a1, a2, v9);
    *(_OWORD *)&a1[v6[5]] = *(_OWORD *)&a2[v6[5]];
    *(_OWORD *)&a1[v6[6]] = *(_OWORD *)&a2[v6[6]];
    *(_QWORD *)&a1[v6[7]] = *(_QWORD *)&a2[v6[7]];
    (*(void (**)(char *, _QWORD, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
  }
  v10 = *(int *)(a3 + 20);
  v11 = &a1[v10];
  v12 = &a2[v10];
  *(_OWORD *)v11 = *(_OWORD *)v12;
  v11[16] = v12[16];
  return a1;
}

char *sub_20D61CEC4(char *a1, char *a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, int *);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;

  v6 = (int *)type metadata accessor for AlertViewModel(0);
  v7 = *((_QWORD *)v6 - 1);
  v8 = *(uint64_t (**)(char *, uint64_t, int *))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      v17 = sub_20D634B3C();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 40))(a1, a2, v17);
      v18 = v6[5];
      v19 = &a1[v18];
      v20 = &a2[v18];
      v22 = *(_QWORD *)v20;
      v21 = *((_QWORD *)v20 + 1);
      *(_QWORD *)v19 = v22;
      *((_QWORD *)v19 + 1) = v21;
      swift_bridgeObjectRelease();
      v23 = v6[6];
      v24 = &a1[v23];
      v25 = &a2[v23];
      v27 = *(_QWORD *)v25;
      v26 = *((_QWORD *)v25 + 1);
      *(_QWORD *)v24 = v27;
      *((_QWORD *)v24 + 1) = v26;
      swift_bridgeObjectRelease();
      *(_QWORD *)&a1[v6[7]] = *(_QWORD *)&a2[v6[7]];
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    sub_20D61CD8C((uint64_t)a1);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BD998);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    goto LABEL_7;
  }
  v11 = sub_20D634B3C();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, a2, v11);
  *(_OWORD *)&a1[v6[5]] = *(_OWORD *)&a2[v6[5]];
  *(_OWORD *)&a1[v6[6]] = *(_OWORD *)&a2[v6[6]];
  *(_QWORD *)&a1[v6[7]] = *(_QWORD *)&a2[v6[7]];
  (*(void (**)(char *, _QWORD, uint64_t, int *))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  v13 = *(int *)(a3 + 20);
  v14 = &a1[v13];
  v15 = &a2[v13];
  *(_QWORD *)&a1[v13] = *(_QWORD *)v15;
  swift_release();
  *((_QWORD *)v14 + 1) = *((_QWORD *)v15 + 1);
  swift_release();
  v14[16] = v15[16];
  return a1;
}

uint64_t sub_20D61D074()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D61D080(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BD998);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_20D61D104()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D61D110(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BD998);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t type metadata accessor for AlertViewModelAlert(uint64_t a1)
{
  return sub_20D61BC98(a1, qword_2549BE090);
}

void sub_20D61D1A4()
{
  unint64_t v0;

  sub_20D61EDD0(319, qword_2549BD9D8, (void (*)(uint64_t))type metadata accessor for AlertViewModel);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t *sub_20D61D224(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_20D634B3C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = (uint64_t *)((char *)a1 + v8);
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (uint64_t *)((char *)a1 + v9);
    v14 = (uint64_t *)((char *)a2 + v9);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_20D61D2E4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_20D634B3C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20D61D348(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;

  v6 = sub_20D634B3C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = (_QWORD *)(a1 + v8);
  v13 = (_QWORD *)(a2 + v8);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_20D61D3DC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  v6 = sub_20D634B3C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[6];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_20D61D4A0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_20D634B3C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t sub_20D61D510(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v6 = sub_20D634B3C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = a3[6];
  v13 = (_QWORD *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  v16 = *v14;
  v15 = v14[1];
  *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_20D61D5AC()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D61D5B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_20D634B3C();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_20D61D638()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D61D644(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_20D634B3C();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  return result;
}

uint64_t sub_20D61D6C0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_20D634B3C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_20D61D748()
{
  return sub_20D619F34(&qword_2549BE160, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
}

uint64_t sub_20D61D778@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_20D634B3C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t sub_20D61D7B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D61D7C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  _DWORD v20[4];
  _DWORD *v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  unsigned __int8 v30;
  uint64_t v31;
  unint64_t v32;

  v3 = v2;
  v25 = a1;
  v26 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BD998);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE168);
  v23 = *(_QWORD *)(v7 - 8);
  v24 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v22 = (char *)v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D61E170(v3, (uint64_t)v6, &qword_2549BD998);
  v9 = type metadata accessor for AlertViewModel(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v6, 1, v9) == 1)
  {
    sub_20D61DF8C((uint64_t)v6);
    v10 = 0;
    v11 = 0xE000000000000000;
  }
  else
  {
    v12 = &v6[*(int *)(v9 + 20)];
    v10 = *(_QWORD *)v12;
    v11 = *((_QWORD *)v12 + 1);
    swift_bridgeObjectRetain();
    sub_20D61CD8C((uint64_t)v6);
  }
  v31 = v10;
  v32 = v11;
  v13 = v3 + *(int *)(type metadata accessor for AlertViewModelAlert(0) + 20);
  v14 = *(_QWORD *)v13;
  v15 = *(_QWORD *)(v13 + 8);
  LOBYTE(v13) = *(_BYTE *)(v13 + 16);
  v27 = v14;
  v28 = v15;
  v29 = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE170);
  v16 = sub_20D635094();
  v21 = v20;
  v20[3] = v30;
  v17 = MEMORY[0x24BDAC7A8](v16);
  MEMORY[0x24BDAC7A8](v17);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE178);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE180);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE188);
  sub_20D61A878(&qword_2549BE190, &qword_2549BE178, MEMORY[0x24BDEFB78]);
  sub_20D61DFDC();
  sub_20D61E020();
  sub_20D61E100();
  v18 = v22;
  sub_20D634FB0();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v23 + 32))(v26, v18, v24);
}

uint64_t sub_20D61DA70@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  _QWORD v17[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE1A8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BD998);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for AlertViewModel(0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D61E170(a1, (uint64_t)v10, &qword_2549BD998);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) == 1)
  {
    sub_20D61DF8C((uint64_t)v10);
    v15 = 1;
  }
  else
  {
    sub_20D61E2BC((uint64_t)v10, (uint64_t)v14, type metadata accessor for AlertViewModel);
    v17[1] = *(_QWORD *)&v14[*(int *)(v11 + 28)];
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE1C8);
    sub_20D634B3C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE1B8);
    sub_20D61A878(&qword_2549BE1D0, &qword_2549BE1C8, MEMORY[0x24BEE12D8]);
    sub_20D61A878(&qword_2549BE1B0, &qword_2549BE1B8, MEMORY[0x24BDF43B0]);
    sub_20D619F34(qword_2549BE1D8, type metadata accessor for AlertViewModelButton, (uint64_t)&unk_20D636B50);
    sub_20D6350A0();
    sub_20D61CD8C((uint64_t)v14);
    (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(a2, v7, v4);
    v15 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, v15, 1, v4);
}

uint64_t sub_20D61DCB8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _BYTE v10[16];
  uint64_t v11;

  v2 = type metadata accessor for AlertViewModelButton(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDD98);
  MEMORY[0x24BDAC7A8](v5);
  sub_20D61E170(a1 + *(int *)(v2 + 24), (uint64_t)&v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)], &qword_2549BDD98);
  sub_20D61A0FC(a1, (uint64_t)&v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)]);
  v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v8 = swift_allocObject();
  sub_20D61E2BC((uint64_t)&v10[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)], v8 + v7, type metadata accessor for AlertViewModelButton);
  v11 = a1;
  return sub_20D635040();
}

uint64_t sub_20D61DE08@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v3 = a1 + *(int *)(type metadata accessor for AlertViewModelButton(0) + 20);
  v4 = *(_QWORD *)v3;
  v5 = *(_QWORD *)(v3 + 8);
  v6 = *(_BYTE *)(v3 + 16);
  v7 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)a2 = *(_QWORD *)v3;
  *(_QWORD *)(a2 + 8) = v5;
  *(_BYTE *)(a2 + 16) = v6;
  *(_QWORD *)(a2 + 24) = v7;
  sub_20D61E354(v4, v5, v6);
  return swift_bridgeObjectRetain();
}

uint64_t sub_20D61DE58@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD v16[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BD998);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D61E170(a1, (uint64_t)v6, &qword_2549BD998);
  v7 = type metadata accessor for AlertViewModel(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 48))(v6, 1, v7) == 1)
  {
    sub_20D61DF8C((uint64_t)v6);
LABEL_5:
    result = 0;
    v12 = 0;
    v15 = 0;
    v13 = 0;
    goto LABEL_6;
  }
  v8 = &v6[*(int *)(v7 + 24)];
  v10 = *(_QWORD *)v8;
  v9 = *((_QWORD *)v8 + 1);
  swift_bridgeObjectRetain();
  sub_20D61CD8C((uint64_t)v6);
  if (!v9)
    goto LABEL_5;
  v16[0] = v10;
  v16[1] = v9;
  sub_20D61DFDC();
  result = sub_20D634F2C();
  v15 = v14 & 1;
LABEL_6:
  *a2 = result;
  a2[1] = v12;
  a2[2] = v15;
  a2[3] = v13;
  return result;
}

uint64_t sub_20D61DF70()
{
  return sub_20D634CEC();
}

uint64_t sub_20D61DF8C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BD998);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20D61DFCC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_20D61DA70(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_20D61DFD4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_20D61DE58(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_20D61DFDC()
{
  unint64_t result;

  result = qword_2549BE9D0;
  if (!qword_2549BE9D0)
  {
    result = MEMORY[0x212BA5644](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2549BE9D0);
  }
  return result;
}

unint64_t sub_20D61E020()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2549BE198;
  if (!qword_2549BE198)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE180);
    v2 = sub_20D61E084();
    result = MEMORY[0x212BA5644](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2549BE198);
  }
  return result;
}

unint64_t sub_20D61E084()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2549BE1A0;
  if (!qword_2549BE1A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE1A8);
    v2 = sub_20D61A878(&qword_2549BE1B0, &qword_2549BE1B8, MEMORY[0x24BDF43B0]);
    result = MEMORY[0x212BA5644](MEMORY[0x24BDF4A08], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2549BE1A0);
  }
  return result;
}

unint64_t sub_20D61E100()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2549BE1C0;
  if (!qword_2549BE1C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE188);
    v2 = MEMORY[0x24BDF1F80];
    result = MEMORY[0x212BA5644](MEMORY[0x24BDF5578], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2549BE1C0);
  }
  return result;
}

uint64_t type metadata accessor for AlertViewModelButton(uint64_t a1)
{
  return sub_20D61BC98(a1, (uint64_t *)&unk_2549BE238);
}

uint64_t sub_20D61E170(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_20D61E1B4()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = (int *)type metadata accessor for AlertViewModelButton(0);
  v2 = *(unsigned __int8 *)(*((_QWORD *)v1 - 1) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  v4 = sub_20D634B3C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_20D61E2AC(*(_QWORD *)(v3 + v1[5]), *(_QWORD *)(v3 + v1[5] + 8), *(_BYTE *)(v3 + v1[5] + 16));
  swift_bridgeObjectRelease();
  v5 = v3 + v1[6];
  v6 = sub_20D634C80();
  v7 = *(_QWORD *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  if (*(_QWORD *)(v3 + v1[7]))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D61E2AC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_20D61E2BC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_20D61E300()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;
  uint64_t (**v3)(void);

  result = type metadata accessor for AlertViewModelButton(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(result - 8) + 80);
  v3 = (uint64_t (**)(void))(v0 + *(int *)(result + 28) + ((v2 + 16) & ~v2));
  if (*v3)
    return (*v3)();
  return result;
}

uint64_t sub_20D61E34C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_20D61DE08(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_20D61E354(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

_QWORD *sub_20D61E364(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t v25;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_20D634B3C();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = *(_QWORD *)((char *)a2 + v8);
    v12 = *(_QWORD *)((char *)a2 + v8 + 8);
    v13 = *((_BYTE *)a2 + v8 + 16);
    sub_20D61E354(v11, v12, v13);
    *(_QWORD *)v9 = v11;
    *((_QWORD *)v9 + 1) = v12;
    v9[16] = v13;
    *((_QWORD *)v9 + 3) = *((_QWORD *)v10 + 3);
    v14 = a3[6];
    v15 = (char *)a1 + v14;
    v16 = (char *)a2 + v14;
    v17 = sub_20D634C80();
    v18 = *(_QWORD *)(v17 - 8);
    v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48);
    swift_bridgeObjectRetain();
    if (v19(v16, 1, v17))
    {
      v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDD98);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v18 + 16))(v15, v16, v17);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
    }
    v22 = a3[7];
    v23 = (_QWORD *)((char *)a1 + v22);
    v24 = (_QWORD *)((char *)a2 + v22);
    if (*v24)
    {
      v25 = v24[1];
      *v23 = *v24;
      v23[1] = v25;
      swift_retain();
    }
    else
    {
      *(_OWORD *)v23 = *(_OWORD *)v24;
    }
  }
  return a1;
}

uint64_t sub_20D61E4E4(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v4 = sub_20D634B3C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  sub_20D61E2AC(*(_QWORD *)(a1 + a2[5]), *(_QWORD *)(a1 + a2[5] + 8), *(_BYTE *)(a1 + a2[5] + 16));
  swift_bridgeObjectRelease();
  v5 = a1 + a2[6];
  v6 = sub_20D634C80();
  v7 = *(_QWORD *)(v6 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  if (!(_DWORD)result)
    result = (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  if (*(_QWORD *)(a1 + a2[7]))
    return swift_release();
  return result;
}

uint64_t sub_20D61E5B4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  void *v14;
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int (*v18)(const void *, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;

  v6 = sub_20D634B3C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_QWORD *)(a2 + v7);
  v11 = *(_QWORD *)(a2 + v7 + 8);
  v12 = *(_BYTE *)(a2 + v7 + 16);
  sub_20D61E354(v10, v11, v12);
  *(_QWORD *)v8 = v10;
  *(_QWORD *)(v8 + 8) = v11;
  *(_BYTE *)(v8 + 16) = v12;
  *(_QWORD *)(v8 + 24) = *(_QWORD *)(v9 + 24);
  v13 = a3[6];
  v14 = (void *)(a1 + v13);
  v15 = (const void *)(a2 + v13);
  v16 = sub_20D634C80();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48);
  swift_bridgeObjectRetain();
  if (v18(v15, 1, v16))
  {
    v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDD98);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v19 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 16))(v14, v15, v16);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  v20 = a3[7];
  v21 = (_QWORD *)(a1 + v20);
  v22 = (_QWORD *)(a2 + v20);
  if (*v22)
  {
    v23 = v22[1];
    *v21 = *v22;
    v21[1] = v23;
    swift_retain();
  }
  else
  {
    *(_OWORD *)v21 = *(_OWORD *)v22;
  }
  return a1;
}

uint64_t sub_20D61E708(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(void *, uint64_t, uint64_t);
  int v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v6 = sub_20D634B3C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_QWORD *)(a2 + v7);
  v11 = *(_QWORD *)(a2 + v7 + 8);
  v12 = *(_BYTE *)(a2 + v7 + 16);
  sub_20D61E354(v10, v11, v12);
  v13 = *(_QWORD *)v8;
  v14 = *(_QWORD *)(v8 + 8);
  v15 = *(_BYTE *)(v8 + 16);
  *(_QWORD *)v8 = v10;
  *(_QWORD *)(v8 + 8) = v11;
  *(_BYTE *)(v8 + 16) = v12;
  sub_20D61E2AC(v13, v14, v15);
  *(_QWORD *)(v8 + 24) = *(_QWORD *)(v9 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v16 = a3[6];
  v17 = (void *)(a1 + v16);
  v18 = (void *)(a2 + v16);
  v19 = sub_20D634C80();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v20 + 48);
  LODWORD(v8) = v21(v17, 1, v19);
  v22 = v21(v18, 1, v19);
  if ((_DWORD)v8)
  {
    if (!v22)
    {
      (*(void (**)(void *, void *, uint64_t))(v20 + 16))(v17, v18, v19);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v22)
  {
    (*(void (**)(void *, uint64_t))(v20 + 8))(v17, v19);
LABEL_6:
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDD98);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v20 + 24))(v17, v18, v19);
LABEL_7:
  v24 = a3[7];
  v25 = (_QWORD *)(a1 + v24);
  v26 = (uint64_t *)(a2 + v24);
  v27 = *(_QWORD *)(a1 + v24);
  v28 = *v26;
  if (!v27)
  {
    if (v28)
    {
      v30 = v26[1];
      *v25 = v28;
      v25[1] = v30;
      swift_retain();
      return a1;
    }
LABEL_13:
    *(_OWORD *)v25 = *(_OWORD *)v26;
    return a1;
  }
  if (!v28)
  {
    swift_release();
    goto LABEL_13;
  }
  v29 = v26[1];
  *v25 = v28;
  v25[1] = v29;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_20D61E8E4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  _OWORD *v10;
  __int128 v11;
  void *v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = sub_20D634B3C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = (_OWORD *)(a1 + v7);
  v10 = (_OWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = (void *)(a1 + v8);
  v13 = (const void *)(a2 + v8);
  v14 = sub_20D634C80();
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDD98);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  v17 = a3[7];
  v18 = (_QWORD *)(a1 + v17);
  v19 = (uint64_t *)(a2 + v17);
  v20 = *v19;
  if (*v19)
  {
    v21 = v19[1];
    *v18 = v20;
    v18[1] = v21;
  }
  else
  {
    *(_OWORD *)v18 = *(_OWORD *)v19;
  }
  return a1;
}

uint64_t sub_20D61EA00(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(void *, uint64_t, uint64_t);
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v6 = sub_20D634B3C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = a1 + v7;
  v9 = a2 + v7;
  LOBYTE(v7) = *(_BYTE *)(a2 + v7 + 16);
  v10 = *(_QWORD *)v8;
  v11 = *(_QWORD *)(v8 + 8);
  v12 = *(_BYTE *)(v8 + 16);
  *(_OWORD *)v8 = *(_OWORD *)v9;
  *(_BYTE *)(v8 + 16) = v7;
  sub_20D61E2AC(v10, v11, v12);
  *(_QWORD *)(v8 + 24) = *(_QWORD *)(v9 + 24);
  swift_bridgeObjectRelease();
  v13 = a3[6];
  v14 = (void *)(a1 + v13);
  v15 = (void *)(a2 + v13);
  v16 = sub_20D634C80();
  v17 = *(_QWORD *)(v16 - 8);
  v18 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v17 + 48);
  v19 = v18(v14, 1, v16);
  v20 = v18(v15, 1, v16);
  if (v19)
  {
    if (!v20)
    {
      (*(void (**)(void *, void *, uint64_t))(v17 + 32))(v14, v15, v16);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v20)
  {
    (*(void (**)(void *, uint64_t))(v17 + 8))(v14, v16);
LABEL_6:
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDD98);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v17 + 40))(v14, v15, v16);
LABEL_7:
  v22 = a3[7];
  v23 = (_QWORD *)(a1 + v22);
  v24 = (uint64_t *)(a2 + v22);
  v25 = *(_QWORD *)(a1 + v22);
  v26 = *v24;
  if (!v25)
  {
    if (v26)
    {
      v28 = v24[1];
      *v23 = v26;
      v23[1] = v28;
      return a1;
    }
LABEL_13:
    *(_OWORD *)v23 = *(_OWORD *)v24;
    return a1;
  }
  if (!v26)
  {
    swift_release();
    goto LABEL_13;
  }
  v27 = v24[1];
  *v23 = v26;
  v23[1] = v27;
  swift_release();
  return a1;
}

uint64_t sub_20D61EBB8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D61EBC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = sub_20D634B3C();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDD98);
    v10 = a1 + *(int *)(a3 + 24);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 24);
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t sub_20D61EC74()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D61EC80(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = sub_20D634B3C();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20) + 24) = (a2 - 1);
      return result;
    }
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDD98);
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_20D61ED2C()
{
  unint64_t v0;
  unint64_t v1;

  sub_20D634B3C();
  if (v0 <= 0x3F)
  {
    sub_20D61EDD0(319, qword_2549BE248, (void (*)(uint64_t))MEMORY[0x24BDEAFA8]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_20D61EDD0(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    a3(255);
    v4 = sub_20D635370();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_20D61EE1C()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE178);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE180);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE188);
  sub_20D61A878(&qword_2549BE190, &qword_2549BE178, MEMORY[0x24BDEFB78]);
  sub_20D61DFDC();
  sub_20D61E020();
  sub_20D61E100();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D61EEDC@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  v4 = v3 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlert;
  swift_beginAccess();
  return sub_20D61E170(v4, a2, &qword_2549BD998);
}

uint64_t sub_20D61EF94(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE v9[16];
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BD998);
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_20D61E170(a1, (uint64_t)v6, &qword_2549BD998);
  v7 = *a2;
  swift_getKeyPath();
  v10 = v7;
  v11 = v6;
  v12 = v7;
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B54();
  swift_release();
  return sub_20D61A7A8((uint64_t)v6, &qword_2549BD998);
}

uint64_t sub_20D61F09C@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlertBool);
  return result;
}

uint64_t sub_20D61F130()
{
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B54();
  return swift_release();
}

uint64_t SharingOptionsGroupsView.init(viewModel:)@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v11;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a2 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE70);
  swift_storeEnumTagMultiPayload();
  v8 = type metadata accessor for SharingOptionsGroupsView(0);
  v9 = (char *)a2 + *(int *)(v8 + 20);
  *(_QWORD *)v9 = sub_20D61F324;
  *((_QWORD *)v9 + 1) = 0;
  v9[16] = 0;
  if (!a1)
    _s14CloudSharingUI0B22OptionsObservableModelC018collaborationShareD013layoutMargins19userDidChangeOption011contentSizelM0ACSo016_SWCollaborationhD0CSg_05SwiftC010EdgeInsetsVySS_SSSbAJtcSgySo6CGSizeVcSgtcfC_0(0, 0, 0, 0, 0, 0.0, 0.0, 0.0, 0.0);
  type metadata accessor for SharingOptionsObservableModel();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D6350D0();
  return (*(uint64_t (**)(char *, char *, uint64_t))(v5 + 32))((char *)a2 + *(int *)(v8 + 24), v7, v4);
}

uint64_t sub_20D61F324()
{
  type metadata accessor for UserInterface(0);
  swift_allocObject();
  return sub_20D61B0CC();
}

uint64_t SharingOptionsGroupsView.body.getter@<X0>(uint64_t a1@<X8>)
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
  char *v10;
  uint64_t v11;
  uint64_t v12;
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
  unint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  char *v57;
  uint64_t v58;
  char *v59;
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
  unint64_t v70;
  char v71;
  uint64_t v72;

  v67 = a1;
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE280);
  v53 = *(_QWORD *)(v54 - 8);
  MEMORY[0x24BDAC7A8](v54);
  v59 = (char *)&v50 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE288);
  MEMORY[0x24BDAC7A8](v65);
  v56 = (char *)&v50 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE290);
  v58 = *(_QWORD *)(v66 - 8);
  v4 = MEMORY[0x24BDAC7A8](v66);
  v55 = (char *)&v50 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v57 = (char *)&v50 - v6;
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE298);
  MEMORY[0x24BDAC7A8](v63);
  v64 = (uint64_t)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
  v60 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BD998);
  MEMORY[0x24BDAC7A8](v11);
  v61 = (uint64_t)&v50 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE2A0);
  v50 = *(_QWORD *)(v51 - 8);
  MEMORY[0x24BDAC7A8](v51);
  v14 = (char *)&v50 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE2A8);
  v15 = MEMORY[0x24BDAC7A8](v62);
  v17 = (char *)&v50 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v52 = (uint64_t)&v50 - v18;
  type metadata accessor for SharingOptionsGroupsView(0);
  type metadata accessor for UserInterface(0);
  sub_20D619F34(&qword_2549BE2B0, type metadata accessor for UserInterface, (uint64_t)&unk_20D636958);
  sub_20D634CC8();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20D634C2C();
  swift_release();
  swift_release();
  swift_release();
  v68 = v1;
  if ((v72 & 1) != 0)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE2B8);
    sub_20D624CB8(&qword_2549BE2C0, &qword_2549BE2B8, (uint64_t (*)(void))sub_20D6234F8);
    sub_20D634EF0();
    sub_20D6350B8();
    v19 = v72;
    swift_getKeyPath();
    v72 = v19;
    sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
    sub_20D634B60();
    swift_release();
    v20 = v19 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlert;
    swift_beginAccess();
    v21 = v61;
    sub_20D61E170(v20, v61, &qword_2549BD998);
    swift_release();
    sub_20D6350C4();
    swift_getKeyPath();
    sub_20D6350DC();
    swift_release();
    (*(void (**)(char *, uint64_t))(v60 + 8))(v10, v8);
    v22 = v69;
    v23 = v70;
    v24 = v71;
    v25 = v65;
    v26 = (uint64_t)v56;
    v27 = (uint64_t)&v56[*(int *)(v65 + 36)];
    sub_20D61E170(v21, v27, &qword_2549BD998);
    v28 = v27 + *(int *)(type metadata accessor for AlertViewModelAlert(0) + 20);
    *(_QWORD *)v28 = v22;
    *(_QWORD *)(v28 + 8) = v23;
    *(_BYTE *)(v28 + 16) = v24;
    v29 = v53;
    v30 = v59;
    v31 = v54;
    (*(void (**)(uint64_t, char *, uint64_t))(v53 + 16))(v26, v59, v54);
    sub_20D61A7A8(v21, &qword_2549BD998);
    (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
    sub_20D6350B8();
    sub_20D6124A8();
    swift_release();
    sub_20D634FF8();
    v32 = sub_20D623628();
    v33 = v55;
    sub_20D634F50();
    swift_release();
    sub_20D61A7A8(v26, &qword_2549BE288);
    v35 = v57;
    v34 = v58;
    v36 = v66;
    (*(void (**)(char *, char *, uint64_t))(v58 + 32))(v57, v33, v66);
    (*(void (**)(uint64_t, char *, uint64_t))(v34 + 16))(v64, v35, v36);
    swift_storeEnumTagMultiPayload();
    sub_20D6236C4();
    v69 = v25;
    v70 = v32;
    swift_getOpaqueTypeConformance2();
    sub_20D634E18();
    return (*(uint64_t (**)(char *, uint64_t))(v34 + 8))(v35, v36);
  }
  else
  {
    sub_20D634EB4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE328);
    sub_20D623768();
    sub_20D634C98();
    sub_20D6350B8();
    v38 = v72;
    swift_getKeyPath();
    v72 = v38;
    sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
    sub_20D634B60();
    swift_release();
    v39 = v38 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__showingAlert;
    swift_beginAccess();
    v40 = v61;
    sub_20D61E170(v39, v61, &qword_2549BD998);
    swift_release();
    sub_20D6350C4();
    swift_getKeyPath();
    sub_20D6350DC();
    swift_release();
    (*(void (**)(char *, uint64_t))(v60 + 8))(v10, v8);
    v41 = v69;
    v42 = v70;
    v43 = v71;
    v44 = (uint64_t)&v17[*(int *)(v62 + 36)];
    sub_20D61E170(v40, v44, &qword_2549BD998);
    v45 = v44 + *(int *)(type metadata accessor for AlertViewModelAlert(0) + 20);
    *(_QWORD *)v45 = v41;
    *(_QWORD *)(v45 + 8) = v42;
    *(_BYTE *)(v45 + 16) = v43;
    v46 = v50;
    v47 = v51;
    (*(void (**)(char *, char *, uint64_t))(v50 + 16))(v17, v14, v51);
    sub_20D61A7A8(v40, &qword_2549BD998);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v14, v47);
    v48 = v52;
    sub_20D61A08C((uint64_t)v17, v52, &qword_2549BE2A8);
    sub_20D61E170(v48, v64, &qword_2549BE2A8);
    swift_storeEnumTagMultiPayload();
    sub_20D6236C4();
    v49 = sub_20D623628();
    v69 = v65;
    v70 = v49;
    swift_getOpaqueTypeConformance2();
    sub_20D634E18();
    return sub_20D61A7A8(v48, &qword_2549BE2A8);
  }
}

uint64_t sub_20D61FBD4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  double v24;
  double v25;
  BOOL v26;
  uint64_t v27;
  BOOL *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)@<X0>(uint64_t *@<X8>);
  uint64_t (*v33)@<X0>(uint64_t *@<X8>);
  uint64_t v34;
  uint64_t (**v35)@<X0>(uint64_t *@<X8>);
  uint64_t v36;
  uint64_t v37;
  uint64_t (**v38)(double *);
  __int128 v40;
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

  v52 = a2;
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE340);
  MEMORY[0x24BDAC7A8](v51);
  v50 = (uint64_t)&v40 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for SharingOptionsGroupsView(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v53 = (uint64_t)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE370);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE360);
  MEMORY[0x24BDAC7A8](v45);
  v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE350);
  MEMORY[0x24BDAC7A8](v47);
  v46 = (uint64_t)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE328);
  MEMORY[0x24BDAC7A8](v49);
  v48 = (uint64_t)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v9 = sub_20D634E00();
  *((_QWORD *)v9 + 1) = 0x4024000000000000;
  v9[16] = 0;
  *(_QWORD *)&v40 = &v9[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549BE5B8) + 44)];
  v44 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
  sub_20D6350B8();
  v14 = v54;
  swift_getKeyPath();
  v54 = v14;
  v41 = sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  v15 = *(_QWORD *)(v14 + 152);
  swift_bridgeObjectRetain();
  swift_release();
  v54 = v15;
  v16 = v53;
  sub_20D61BBEC(a1, v53, type metadata accessor for SharingOptionsGroupsView);
  v17 = *(unsigned __int8 *)(v5 + 80);
  v18 = (v17 + 16) & ~v17;
  v42 = v17 | 7;
  v43 = v18 + v6;
  v19 = swift_allocObject();
  sub_20D61E2BC(v16, v19 + v18, type metadata accessor for SharingOptionsGroupsView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE5C0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE5C8);
  sub_20D61A878(&qword_2549BE5D0, &qword_2549BE5C0, MEMORY[0x24BEE12D8]);
  sub_20D61A878(&qword_2549BE5D8, &qword_2549BE5C8, MEMORY[0x24BDF5428]);
  sub_20D625178();
  sub_20D6350A0();
  sub_20D6350B8();
  v40 = *(_OWORD *)(v54 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_layoutMargins);
  v20 = *(_QWORD *)(v54 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_layoutMargins + 16);
  v21 = *(_QWORD *)(v54 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel_layoutMargins + 24);
  swift_release();
  LOBYTE(v15) = sub_20D634EC0();
  sub_20D61E170((uint64_t)v9, (uint64_t)v11, &qword_2549BE370);
  v22 = &v11[*(int *)(v45 + 36)];
  *v22 = v15;
  *(_OWORD *)(v22 + 8) = v40;
  *((_QWORD *)v22 + 3) = v20;
  *((_QWORD *)v22 + 4) = v21;
  v22[40] = 0;
  sub_20D61A7A8((uint64_t)v9, &qword_2549BE370);
  sub_20D6350B8();
  v23 = v54;
  swift_getKeyPath();
  v54 = v23;
  sub_20D634B60();
  swift_release();
  swift_beginAccess();
  v24 = *(double *)(v23 + 72);
  v25 = *(double *)(v23 + 80);
  swift_release();
  v26 = v25 == 0.0 && v24 == 0.0;
  v27 = v46;
  sub_20D61E170((uint64_t)v11, v46, &qword_2549BE360);
  v28 = (BOOL *)(v27 + *(int *)(v47 + 36));
  *v28 = v26;
  v28[1] = 0;
  sub_20D61A7A8((uint64_t)v11, &qword_2549BE360);
  v29 = v53;
  sub_20D61BBEC(v44, v53, type metadata accessor for SharingOptionsGroupsView);
  v30 = swift_allocObject();
  sub_20D61E2BC(v29, v30 + v18, type metadata accessor for SharingOptionsGroupsView);
  v31 = sub_20D6350E8();
  v33 = v32;
  v34 = v50;
  sub_20D61E170(v27, v50, &qword_2549BE350);
  v35 = (uint64_t (**)@<X0>(uint64_t *@<X8>))(v34 + *(int *)(v51 + 36));
  *v35 = sub_20D62D068;
  v35[1] = 0;
  v35[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v31;
  v35[3] = v33;
  v36 = swift_allocObject();
  *(_QWORD *)(v36 + 16) = sub_20D6252AC;
  *(_QWORD *)(v36 + 24) = v30;
  v37 = v48;
  sub_20D61E170(v34, v48, &qword_2549BE340);
  v38 = (uint64_t (**)(double *))(v37 + *(int *)(v49 + 36));
  *v38 = sub_20D625314;
  v38[1] = (uint64_t (*)(double *))v36;
  sub_20D61A7A8(v34, &qword_2549BE340);
  sub_20D61A7A8(v27, &qword_2549BE350);
  return sub_20D61A08C(v37, v52, &qword_2549BE328);
}

uint64_t sub_20D620188@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
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
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  _QWORD *v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t v67;
  void (*v68)(char *, uint64_t);
  unsigned int *v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void (*v74)(char *, uint64_t);
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  _QWORD *v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  char v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  char v94;
  char v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char v101;
  char v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  void (*v107)(char *, uint64_t);
  unsigned int *v108;
  char *v109;
  uint64_t v110;
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
  uint64_t v123;
  uint64_t v124;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  char *v141;
  char *v142;
  uint64_t v143;
  uint64_t v144;
  int v145;
  _QWORD *v146;
  uint64_t v147;
  uint64_t v148;
  unint64_t v149;
  char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  char *v156;
  uint64_t v157;
  uint64_t v158;
  __int128 v159[3];
  char v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  char v164;

  v157 = a2;
  v154 = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v150 = (char *)&v126 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for SharingOptionsGroupsView.GroupView(0);
  v8 = MEMORY[0x24BDAC7A8](v7);
  v153 = (uint64_t)&v126 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v158 = (uint64_t)&v126 - v10;
  v11 = sub_20D634D58();
  MEMORY[0x24BDAC7A8](v11);
  v141 = (char *)&v126 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v138 = sub_20D634CB0();
  v137 = *(_QWORD *)(v138 - 8);
  v13 = MEMORY[0x24BDAC7A8](v138);
  v136 = (char *)&v126 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v135 = (uint64_t)&v126 - v15;
  v140 = sub_20D6350F4();
  v139 = *(_QWORD *)(v140 - 8);
  v16 = MEMORY[0x24BDAC7A8](v140);
  v18 = (char *)&v126 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v142 = (char *)&v126 - v19;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE5E8);
  v21 = *(_QWORD *)(v20 - 8);
  v22 = MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v126 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = MEMORY[0x24BDAC7A8](v22);
  v131 = (uint64_t)&v126 - v26;
  v27 = MEMORY[0x24BDAC7A8](v25);
  v29 = (char *)&v126 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v130 = (uint64_t)&v126 - v30;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE5F0);
  v32 = MEMORY[0x24BDAC7A8](v31);
  v33 = MEMORY[0x24BDAC7A8](v32);
  v152 = (uint64_t)&v126 - v34;
  v35 = MEMORY[0x24BDAC7A8](v33);
  v143 = (uint64_t)&v126 - v36;
  MEMORY[0x24BDAC7A8](v35);
  v38 = (char *)&v126 - v37;
  v39 = *(_QWORD *)a1;
  v40 = *(_QWORD *)(a1 + 8);
  v42 = *(_QWORD *)(a1 + 24);
  v41 = *(_QWORD *)(a1 + 32);
  v43 = *(_QWORD **)(a1 + 48);
  v149 = *(_QWORD *)(a1 + 40);
  v44 = *(unsigned __int8 *)(a1 + 56);
  v144 = v45;
  v155 = v20;
  v156 = v38;
  v133 = v18;
  v132 = v24;
  v151 = v5;
  v134 = v41;
  v148 = v39;
  v147 = v40;
  v146 = v43;
  v145 = v44;
  if (!v42)
    goto LABEL_8;
  v46 = HIBYTE(v42) & 0xF;
  if ((v42 & 0x2000000000000000) == 0)
    v46 = *(_QWORD *)(a1 + 16) & 0xFFFFFFFFFFFFLL;
  if (v46)
  {
    *(_QWORD *)&v161 = *(_QWORD *)(a1 + 16);
    *((_QWORD *)&v161 + 1) = v42;
    sub_20D61DFDC();
    swift_bridgeObjectRetain();
    v47 = sub_20D634F2C();
    v49 = v48;
    v129 = v4;
    v51 = v50 & 1;
    sub_20D634FEC();
    v52 = sub_20D634F08();
    v128 = v21;
    v54 = v53;
    v56 = v55;
    swift_release();
    sub_20D61E2AC(v47, v49, v51);
    swift_bridgeObjectRelease();
    sub_20D634EE4();
    v57 = sub_20D634EFC();
    v59 = v58;
    v127 = v60;
    v62 = v61 & 1;
    v63 = v139;
    sub_20D61E2AC(v52, v54, v56 & 1);
    swift_bridgeObjectRelease();
    v64 = v135;
    sub_20D62A3E0(v135);
    v65 = v137;
    v66 = v136;
    v67 = v138;
    (*(void (**)(char *, _QWORD, uint64_t))(v137 + 104))(v136, *MEMORY[0x24BDEB3F0], v138);
    LOBYTE(v49) = sub_20D634CA4();
    v68 = *(void (**)(char *, uint64_t))(v65 + 8);
    v68(v66, v67);
    v68((char *)v64, v67);
    v69 = (unsigned int *)MEMORY[0x24BDF5068];
    if ((v49 & 1) == 0)
      v69 = (unsigned int *)MEMORY[0x24BDF50D0];
    v70 = v142;
    v71 = v140;
    (*(void (**)(char *, _QWORD, uint64_t))(v63 + 104))(v142, *v69, v140);
    v72 = (uint64_t)v141;
    (*(void (**)(char *, char *, uint64_t))(v63 + 16))(v141, v70, v71);
    v73 = v155;
    sub_20D61BBEC(v72, (uint64_t)&v29[*(int *)(v155 + 36)], (uint64_t (*)(_QWORD))MEMORY[0x24BDEDB60]);
    *(_QWORD *)v29 = v57;
    *((_QWORD *)v29 + 1) = v59;
    v29[16] = v62;
    *((_QWORD *)v29 + 3) = v127;
    sub_20D61E354(v57, v59, v62);
    swift_bridgeObjectRetain();
    sub_20D625340(v72, (uint64_t (*)(_QWORD))MEMORY[0x24BDEDB60]);
    v74 = *(void (**)(char *, uint64_t))(v63 + 8);
    v4 = v129;
    v74(v70, v71);
    sub_20D61E2AC(v57, v59, v62);
    swift_bridgeObjectRelease();
    v75 = v130;
    sub_20D61A08C((uint64_t)v29, v130, &qword_2549BE5E8);
    v76 = v75;
    v77 = (uint64_t)v156;
    sub_20D61A08C(v76, (uint64_t)v156, &qword_2549BE5E8);
    v78 = *(char **)(v128 + 56);
    v38 = (char *)v77;
    v79 = 0;
    v80 = v73;
  }
  else
  {
LABEL_8:
    v78 = *(char **)(v21 + 56);
    v79 = 1;
    v80 = v20;
  }
  v142 = v78;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v78)(v38, v79, 1, v80);
  type metadata accessor for SharingOptionsGroupsView(0);
  type metadata accessor for UserInterface(0);
  sub_20D619F34(&qword_2549BE2B0, type metadata accessor for UserInterface, (uint64_t)&unk_20D636958);
  v81 = v147;
  swift_bridgeObjectRetain();
  sub_20D634CC8();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20D634C2C();
  swift_release();
  swift_release();
  swift_release();
  v82 = v161;
  v83 = v146;
  swift_bridgeObjectRetain();
  sub_20D6350B8();
  v84 = v150;
  sub_20D6350C4();
  swift_getKeyPath();
  sub_20D6350DC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v151 + 8))(v84, v4);
  v159[0] = v161;
  v159[1] = v162;
  v159[2] = v163;
  v160 = v164;
  sub_20D620D58(v148, v81, v82, v145, v83, v159, v158);
  if (!v149)
    goto LABEL_16;
  v85 = HIBYTE(v149) & 0xF;
  if ((v149 & 0x2000000000000000) == 0)
    v85 = v134 & 0xFFFFFFFFFFFFLL;
  if (v85)
  {
    *(_QWORD *)&v161 = v134;
    *((_QWORD *)&v161 + 1) = v149;
    sub_20D61DFDC();
    swift_bridgeObjectRetain();
    v86 = sub_20D634F2C();
    v88 = v87;
    v90 = v89 & 1;
    sub_20D634FEC();
    v91 = sub_20D634F08();
    v93 = v92;
    v95 = v94;
    v96 = v139;
    swift_release();
    sub_20D61E2AC(v86, v88, v90);
    swift_bridgeObjectRelease();
    sub_20D634EE4();
    v97 = sub_20D634EFC();
    v99 = v98;
    v151 = v100;
    v102 = v101 & 1;
    sub_20D61E2AC(v91, v93, v95 & 1);
    swift_bridgeObjectRelease();
    v103 = v135;
    sub_20D62A3E0(v135);
    v104 = v137;
    v105 = v136;
    v106 = v138;
    (*(void (**)(char *, _QWORD, uint64_t))(v137 + 104))(v136, *MEMORY[0x24BDEB3F0], v138);
    LOBYTE(v88) = sub_20D634CA4();
    v107 = *(void (**)(char *, uint64_t))(v104 + 8);
    v107(v105, v106);
    v107((char *)v103, v106);
    v108 = (unsigned int *)MEMORY[0x24BDF5068];
    if ((v88 & 1) == 0)
      v108 = (unsigned int *)MEMORY[0x24BDF50D0];
    v109 = v133;
    v110 = v140;
    (*(void (**)(char *, _QWORD, uint64_t))(v96 + 104))(v133, *v108, v140);
    v111 = (uint64_t)v141;
    (*(void (**)(char *, char *, uint64_t))(v96 + 16))(v141, v109, v110);
    v112 = v155;
    v113 = (uint64_t)v132;
    sub_20D61BBEC(v111, (uint64_t)&v132[*(int *)(v155 + 36)], (uint64_t (*)(_QWORD))MEMORY[0x24BDEDB60]);
    *(_QWORD *)v113 = v97;
    *(_QWORD *)(v113 + 8) = v99;
    *(_BYTE *)(v113 + 16) = v102;
    *(_QWORD *)(v113 + 24) = v151;
    sub_20D61E354(v97, v99, v102);
    swift_bridgeObjectRetain();
    sub_20D625340(v111, (uint64_t (*)(_QWORD))MEMORY[0x24BDEDB60]);
    (*(void (**)(char *, uint64_t))(v96 + 8))(v109, v110);
    sub_20D61E2AC(v97, v99, v102);
    swift_bridgeObjectRelease();
    v114 = v113;
    v115 = v131;
    sub_20D61A08C(v114, v131, &qword_2549BE5E8);
    v116 = v143;
    sub_20D61A08C(v115, v143, &qword_2549BE5E8);
    v117 = 0;
    v118 = v144;
  }
  else
  {
LABEL_16:
    v117 = 1;
    v118 = v144;
    v112 = v155;
    v116 = v143;
  }
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v142)(v116, v117, 1, v112);
  v119 = (uint64_t)v156;
  v120 = v152;
  sub_20D61E170((uint64_t)v156, v152, &qword_2549BE5F0);
  v121 = v158;
  v122 = v153;
  sub_20D61BBEC(v158, v153, type metadata accessor for SharingOptionsGroupsView.GroupView);
  sub_20D61E170(v116, v118, &qword_2549BE5F0);
  v123 = v154;
  sub_20D61E170(v120, v154, &qword_2549BE5F0);
  v124 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE5F8);
  sub_20D61BBEC(v122, v123 + *(int *)(v124 + 48), type metadata accessor for SharingOptionsGroupsView.GroupView);
  sub_20D61E170(v118, v123 + *(int *)(v124 + 64), &qword_2549BE5F0);
  sub_20D61A7A8(v116, &qword_2549BE5F0);
  sub_20D625340(v121, type metadata accessor for SharingOptionsGroupsView.GroupView);
  sub_20D61A7A8(v119, &qword_2549BE5F0);
  sub_20D61A7A8(v118, &qword_2549BE5F0);
  sub_20D625340(v122, type metadata accessor for SharingOptionsGroupsView.GroupView);
  return sub_20D61A7A8(v120, &qword_2549BE5F0);
}

uint64_t sub_20D620D58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, char a4@<W3>, _QWORD *a5@<X4>, __int128 *a6@<X6>, uint64_t a7@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t result;
  _QWORD *v19;
  __int128 v20;
  __int128 v21;

  v20 = a6[1];
  v21 = *a6;
  v9 = *((_QWORD *)a6 + 4);
  v10 = *((_QWORD *)a6 + 5);
  v11 = *((_BYTE *)a6 + 48);
  *(_QWORD *)a7 = a1;
  *(_QWORD *)(a7 + 8) = a2;
  *(_BYTE *)(a7 + 17) = a3 & 1;
  *(_BYTE *)(a7 + 16) = a4 & 1;
  *(_QWORD *)(a7 + 24) = a5;
  v12 = type metadata accessor for SharingOptionsGroupsView.GroupView(0);
  type metadata accessor for SharingOptionsObservableModel();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_20D6350D0();
  v13 = a7 + *(int *)(v12 + 36);
  *(_OWORD *)v13 = v21;
  *(_OWORD *)(v13 + 16) = v20;
  *(_QWORD *)(v13 + 32) = v9;
  *(_QWORD *)(v13 + 40) = v10;
  *(_BYTE *)(v13 + 48) = v11;
  v14 = a5[2];
  if (v14)
  {
    v15 = a5 + 5;
    while (*((_BYTE *)v15 + 40))
    {
      v15 += 7;
      if (!--v14)
      {
        v17 = a5[4];
        v16 = a5[5];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_release();
        swift_bridgeObjectRelease();
        result = swift_bridgeObjectRelease();
        goto LABEL_8;
      }
    }
    v17 = *(v15 - 1);
    v16 = *v15;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    result = swift_release();
  }
  else
  {
    swift_release();
    result = swift_bridgeObjectRelease();
    v17 = 0;
    v16 = 0xE000000000000000;
  }
LABEL_8:
  v19 = (_QWORD *)(a7 + *(int *)(v12 + 40));
  *v19 = v17;
  v19[1] = v16;
  v19[2] = 0;
  return result;
}

uint64_t sub_20D620EE8()
{
  double v0;
  double v1;
  uint64_t KeyPath;
  uint64_t v3;
  uint64_t v5;

  type metadata accessor for SharingOptionsGroupsView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
  sub_20D6350B8();
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  swift_beginAccess();
  v1 = *(double *)(v5 + 72);
  v0 = *(double *)(v5 + 80);
  swift_release();
  if (v1 == 0.0 && v0 == 0.0)
  {
    sub_20D6350B8();
    KeyPath = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](KeyPath);
    sub_20D634B54();
    swift_release();
  }
  else
  {
    sub_20D6350B8();
    sub_20D6350B8();
    swift_getKeyPath();
    sub_20D634B60();
    swift_release();
    swift_beginAccess();
    swift_release();
    v3 = swift_getKeyPath();
    MEMORY[0x24BDAC7A8](v3);
    sub_20D634B54();
    swift_release();
  }
  return swift_release();
}

uint64_t sub_20D621170(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v2 = type metadata accessor for SharingOptionsGroupsView(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x24BDAC7A8](v2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
  sub_20D6350B8();
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  v5 = *(_QWORD *)(v10 + 152);
  swift_bridgeObjectRetain();
  swift_release();
  v10 = v5;
  sub_20D61BBEC(a1, (uint64_t)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SharingOptionsGroupsView);
  v6 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v7 = swift_allocObject();
  sub_20D61E2BC((uint64_t)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, type metadata accessor for SharingOptionsGroupsView);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE5C0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE2D0);
  sub_20D61A878(&qword_2549BE5D0, &qword_2549BE5C0, MEMORY[0x24BEE12D8]);
  sub_20D6234F8();
  sub_20D625178();
  return sub_20D6350A0();
}

uint64_t sub_20D621348@<X0>(__int128 *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  __int128 v13;
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
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t result;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t KeyPath;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  __int128 *v44;
  uint64_t v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  _OWORD v55[3];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE2E0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE2D0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1[1];
  v53 = *a1;
  v54 = v13;
  v55[0] = a1[2];
  *(_OWORD *)((char *)v55 + 9) = *(__int128 *)((char *)a1 + 41);
  v44 = &v53;
  v45 = a2;
  if (!*((_QWORD *)&v13 + 1))
    goto LABEL_6;
  v14 = HIBYTE(*((_QWORD *)&v13 + 1)) & 0xFLL;
  if ((*((_QWORD *)&v13 + 1) & 0x2000000000000000) == 0)
    v14 = v54 & 0xFFFFFFFFFFFFLL;
  if (v14)
  {
    v49 = v54;
    v50 = *((_QWORD *)&v13 + 1);
    sub_20D61DFDC();
    swift_bridgeObjectRetain();
    v15 = sub_20D634F2C();
    v19 = v18 & 1;
  }
  else
  {
LABEL_6:
    v15 = 0;
    v16 = 0;
    v19 = 0;
    v17 = 0;
  }
  v49 = v15;
  v50 = v16;
  v51 = v19;
  v52 = v17;
  v43 = a3;
  v42 = v6;
  v41 = v7;
  v40 = v10;
  if (!*((_QWORD *)&v55[0] + 1))
    goto LABEL_12;
  v20 = HIBYTE(v55[0]) & 0xF;
  if ((*((_QWORD *)&v55[0] + 1) & 0x2000000000000000) == 0)
    v20 = *(_QWORD *)&v55[0] & 0xFFFFFFFFFFFFLL;
  if (v20)
  {
    v46 = v55[0];
    sub_20D61DFDC();
    swift_bridgeObjectRetain();
    v21 = sub_20D634F2C();
    v25 = v24 & 1;
  }
  else
  {
LABEL_12:
    v21 = 0;
    v22 = 0;
    v25 = 0;
    v23 = 0;
  }
  *(_QWORD *)&v46 = v21;
  *((_QWORD *)&v46 + 1) = v22;
  v47 = v25;
  v48 = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE188);
  type metadata accessor for SharingOptionsGroupsView.GroupView(0);
  sub_20D61E100();
  sub_20D619F34(&qword_2549BE2E8, type metadata accessor for SharingOptionsGroupsView.GroupView, (uint64_t)&unk_20D636D90);
  sub_20D6350AC();
  type metadata accessor for SharingOptionsGroupsView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
  sub_20D6350B8();
  v26 = v49;
  swift_getKeyPath();
  v49 = v26;
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  sub_20D634B60();
  swift_release();
  v27 = *(_QWORD *)(v26 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__disableGroupWithID + 8);
  swift_release();
  if (!v27)
  {
    v32 = 0;
    v33 = v43;
    v34 = v42;
    v35 = v41;
    v36 = v40;
LABEL_20:
    KeyPath = swift_getKeyPath();
    v38 = swift_allocObject();
    *(_BYTE *)(v38 + 16) = v32 & 1;
    (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v12, v9, v34);
    v39 = (uint64_t *)&v12[*(int *)(v36 + 36)];
    *v39 = KeyPath;
    v39[1] = (uint64_t)sub_20D625474;
    v39[2] = v38;
    (*(void (**)(char *, uint64_t))(v35 + 8))(v9, v34);
    return sub_20D61A08C((uint64_t)v12, v33, &qword_2549BE2D0);
  }
  sub_20D6350B8();
  v28 = v49;
  swift_getKeyPath();
  v49 = v28;
  sub_20D634B60();
  swift_release();
  v30 = *(_QWORD *)(v28 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__disableGroupWithID);
  v29 = *(_QWORD *)(v28 + OBJC_IVAR____TtC14CloudSharingUI29SharingOptionsObservableModel__disableGroupWithID + 8);
  swift_bridgeObjectRetain();
  result = swift_release();
  if (v29)
  {
    if (__PAIR128__(v29, v30) == v53)
      v32 = 1;
    else
      v32 = sub_20D635490();
    v33 = v43;
    v34 = v42;
    v35 = v41;
    v36 = v40;
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_20D6217A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char v8;
  char v9;
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17[3];
  char v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  char v22;

  v12 = a2;
  v16 = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
  v14 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(_QWORD *)(a1 + 8);
  v15 = *(_QWORD *)a1;
  v13 = v7;
  type metadata accessor for SharingOptionsGroupsView(0);
  type metadata accessor for UserInterface(0);
  sub_20D619F34(&qword_2549BE2B0, type metadata accessor for UserInterface, (uint64_t)&unk_20D636958);
  swift_bridgeObjectRetain();
  sub_20D634CC8();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20D634C2C();
  swift_release();
  swift_release();
  swift_release();
  v8 = v19;
  v9 = *(_BYTE *)(a1 + 56);
  v10 = *(_QWORD **)(a1 + 48);
  swift_bridgeObjectRetain();
  sub_20D6350B8();
  sub_20D6350C4();
  swift_getKeyPath();
  sub_20D6350DC();
  swift_release();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v6, v4);
  v17[0] = v19;
  v17[1] = v20;
  v17[2] = v21;
  v18 = v22;
  return sub_20D620D58(v15, v13, v8, v9, v10, v17, v16);
}

uint64_t sub_20D6219AC()
{
  swift_getKeyPath();
  sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
  swift_bridgeObjectRetain();
  sub_20D634B54();
  swift_release();
  return swift_bridgeObjectRelease();
}

double sub_20D621A74@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  double result;
  __int128 v9;
  _OWORD v10[8];
  _BYTE v11[135];

  v4 = sub_20D634DE8();
  sub_20D621B3C(a1, (uint64_t)v10);
  *(_OWORD *)&v11[71] = v10[4];
  *(_OWORD *)&v11[87] = v10[5];
  *(_OWORD *)&v11[103] = v10[6];
  *(_OWORD *)&v11[119] = v10[7];
  *(_OWORD *)&v11[7] = v10[0];
  *(_OWORD *)&v11[23] = v10[1];
  *(_OWORD *)&v11[39] = v10[2];
  *(_OWORD *)&v11[55] = v10[3];
  v5 = *(_OWORD *)&v11[64];
  *(_OWORD *)(a2 + 97) = *(_OWORD *)&v11[80];
  v6 = *(_OWORD *)&v11[112];
  *(_OWORD *)(a2 + 113) = *(_OWORD *)&v11[96];
  *(_OWORD *)(a2 + 129) = v6;
  v7 = *(_OWORD *)v11;
  *(_OWORD *)(a2 + 33) = *(_OWORD *)&v11[16];
  result = *(double *)&v11[32];
  v9 = *(_OWORD *)&v11[48];
  *(_OWORD *)(a2 + 49) = *(_OWORD *)&v11[32];
  *(_OWORD *)(a2 + 65) = v9;
  *(_OWORD *)(a2 + 81) = v5;
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  *(_QWORD *)(a2 + 144) = *(_QWORD *)&v11[127];
  *(_OWORD *)(a2 + 17) = v7;
  return result;
}

uint64_t sub_20D621B3C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t KeyPath;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v4 = sub_20D634E00();
  sub_20D621CC8(a1, (uint64_t)v17);
  v5 = v17[0];
  v6 = v17[1];
  v7 = v18;
  v8 = v19;
  v16 = v20;
  v9 = v21;
  v10 = v22;
  v11 = v23;
  if ((*(_BYTE *)(a1 + 48) & 1) != 0)
  {
    v15 = sub_20D635004();
    v14 = sub_20D634FC8();
    KeyPath = swift_getKeyPath();
  }
  else
  {
    v14 = 0;
    v15 = 0;
    KeyPath = 0;
  }
  LOBYTE(v17[0]) = 1;
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  *(_QWORD *)(a2 + 24) = v5;
  *(_QWORD *)(a2 + 32) = v6;
  *(_BYTE *)(a2 + 40) = v7;
  *(_QWORD *)(a2 + 48) = v8;
  *(_QWORD *)(a2 + 56) = v16;
  *(_QWORD *)(a2 + 64) = v9;
  *(_QWORD *)(a2 + 72) = v10;
  *(_QWORD *)(a2 + 80) = v11;
  *(_QWORD *)(a2 + 88) = 0;
  *(_BYTE *)(a2 + 96) = 1;
  *(_QWORD *)(a2 + 104) = v15;
  *(_QWORD *)(a2 + 112) = KeyPath;
  *(_QWORD *)(a2 + 120) = v14;
  sub_20D61E354(v5, v6, v7);
  swift_bridgeObjectRetain();
  sub_20D625B5C(v16, v9, v10, v11);
  sub_20D625B8C(v15);
  sub_20D625BC8(v15);
  sub_20D61E2AC(v5, v6, v7);
  swift_bridgeObjectRelease();
  return sub_20D625C00(v16, v9, v10, v11);
}

uint64_t sub_20D621CC8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  uint64_t v40;

  sub_20D61DFDC();
  swift_bridgeObjectRetain();
  v4 = sub_20D634F2C();
  v6 = v5;
  v8 = v7 & 1;
  sub_20D634FE0();
  v9 = sub_20D634F08();
  v11 = v10;
  v39 = v12;
  v40 = v13;
  swift_release();
  sub_20D61E2AC(v4, v6, v8);
  swift_bridgeObjectRelease();
  v14 = *(_QWORD *)(a1 + 40);
  if (!v14)
    goto LABEL_6;
  v15 = HIBYTE(v14) & 0xF;
  if ((v14 & 0x2000000000000000) == 0)
    v15 = *(_QWORD *)(a1 + 32) & 0xFFFFFFFFFFFFLL;
  if (v15)
  {
    swift_bridgeObjectRetain();
    v16 = sub_20D634F2C();
    v18 = v17;
    v20 = v19 & 1;
    sub_20D634ECC();
    v37 = v11;
    v38 = v9;
    v21 = sub_20D634F14();
    v23 = v22;
    v25 = v24;
    swift_release();
    v36 = v25 & 1;
    sub_20D61E2AC(v16, v18, v20);
    swift_bridgeObjectRelease();
    sub_20D634FEC();
    v26 = sub_20D634F08();
    v28 = v27;
    LOBYTE(v18) = v29;
    v31 = v30;
    swift_release();
    v32 = v18 & 1;
    v33 = v21;
    v34 = v23;
    v11 = v37;
    v9 = v38;
    sub_20D61E2AC(v33, v34, v36);
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_6:
    v26 = 0;
    v28 = 0;
    v32 = 0;
    v31 = 0;
  }
  *(_QWORD *)a2 = v9;
  *(_QWORD *)(a2 + 8) = v11;
  *(_BYTE *)(a2 + 16) = v39 & 1;
  *(_QWORD *)(a2 + 24) = v40;
  *(_QWORD *)(a2 + 32) = v26;
  *(_QWORD *)(a2 + 40) = v28;
  *(_QWORD *)(a2 + 48) = v32;
  *(_QWORD *)(a2 + 56) = v31;
  sub_20D61E354(v9, v11, v39 & 1);
  swift_bridgeObjectRetain();
  sub_20D625B5C(v26, v28, v32, v31);
  sub_20D625C00(v26, v28, v32, v31);
  sub_20D61E2AC(v9, v11, v39 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_20D621F1C()
{
  uint64_t v0;
  __int128 v1;
  __int128 v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[4];
  uint64_t v8;

  v1 = *(_OWORD *)(v0 + 48);
  v7[2] = *(_OWORD *)(v0 + 32);
  v7[3] = v1;
  v8 = *(_QWORD *)(v0 + 64);
  v2 = *(_OWORD *)(v0 + 16);
  v7[0] = *(_OWORD *)v0;
  v7[1] = v2;
  v3 = swift_allocObject();
  v4 = *(_OWORD *)(v0 + 48);
  *(_OWORD *)(v3 + 48) = *(_OWORD *)(v0 + 32);
  *(_OWORD *)(v3 + 64) = v4;
  *(_QWORD *)(v3 + 80) = *(_QWORD *)(v0 + 64);
  v5 = *(_OWORD *)(v0 + 16);
  *(_OWORD *)(v3 + 16) = *(_OWORD *)v0;
  *(_OWORD *)(v3 + 32) = v5;
  sub_20D625B08((uint64_t)v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE610);
  sub_20D61A878(&qword_2549BE618, &qword_2549BE610, MEMORY[0x24BDF4498]);
  return sub_20D63504C();
}

uint64_t sub_20D621FF4@<X0>(uint64_t a1@<X8>)
{
  _OWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _OWORD *v6;
  __int128 v7;
  __int128 v8;
  _QWORD v10[2];
  _OWORD *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v10[1] = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE620);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = v1[3];
  v12 = v1[3];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE628);
  sub_20D635034();
  v11 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE630);
  sub_20D61A878(&qword_2549BE638, &qword_2549BE630, MEMORY[0x24BDF4700]);
  sub_20D635070();
  v13 = v14;
  sub_20D63501C();
  LOBYTE(v13) = v12;
  v6 = (_OWORD *)swift_allocObject();
  v7 = v1[3];
  v6[3] = v1[2];
  v6[4] = v7;
  v6[5] = v1[4];
  v8 = v1[1];
  v6[1] = *v1;
  v6[2] = v8;
  sub_20D625CF8((uint64_t)v1);
  sub_20D61A878(&qword_2549BE640, &qword_2549BE620, MEMORY[0x24BDF46D0]);
  sub_20D634FBC();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

__n128 sub_20D6221C8@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  __n128 result;
  __int128 v8;
  __int128 v9;
  __n128 v10;
  char v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;

  v4 = sub_20D634E00();
  sub_20D62223C(a1, (uint64_t)&v10);
  v5 = v11;
  v6 = v12;
  result = v10;
  v8 = v13;
  v9 = v14;
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  *(__n128 *)(a2 + 24) = result;
  *(_BYTE *)(a2 + 40) = v5;
  *(_QWORD *)(a2 + 48) = v6;
  *(_OWORD *)(a2 + 56) = v8;
  *(_OWORD *)(a2 + 72) = v9;
  return result;
}

uint64_t sub_20D62223C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;

  sub_20D61DFDC();
  swift_bridgeObjectRetain();
  v4 = sub_20D634F2C();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 40);
  if (!v11)
    goto LABEL_6;
  v12 = HIBYTE(v11) & 0xF;
  if ((v11 & 0x2000000000000000) == 0)
    v12 = *(_QWORD *)(a1 + 32) & 0xFFFFFFFFFFFFLL;
  if (v12)
  {
    swift_bridgeObjectRetain();
    v13 = sub_20D634F2C();
    v15 = v14;
    v17 = v16;
    v19 = v18 & 1;
  }
  else
  {
LABEL_6:
    v13 = 0;
    v15 = 0;
    v19 = 0;
    v17 = 0;
  }
  v20 = v8 & 1;
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v6;
  *(_BYTE *)(a2 + 16) = v20;
  *(_QWORD *)(a2 + 24) = v10;
  *(_QWORD *)(a2 + 32) = v13;
  *(_QWORD *)(a2 + 40) = v15;
  *(_QWORD *)(a2 + 48) = v19;
  *(_QWORD *)(a2 + 56) = v17;
  sub_20D61E354(v4, v6, v20);
  swift_bridgeObjectRetain();
  sub_20D625B5C(v13, v15, v19, v17);
  sub_20D625C00(v13, v15, v19, v17);
  sub_20D61E2AC(v4, v6, v20);
  return swift_bridgeObjectRelease();
}

uint64_t sub_20D622390@<X0>(uint64_t a1@<X8>)
{
  return sub_20D621FF4(a1);
}

uint64_t sub_20D6223D0@<X0>(uint64_t a1@<X8>)
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
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t *v58;
  char *v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  __int128 v73;
  uint64_t v74;
  __int128 v75;
  uint64_t v76;
  uint64_t v77;

  v72 = a1;
  v70 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE4E0);
  v60 = *(_QWORD *)(v70 - 8);
  MEMORY[0x24BDAC7A8](v70);
  v58 = (uint64_t *)((char *)&v53 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE4E8);
  MEMORY[0x24BDAC7A8](v65);
  v68 = (char *)&v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE4F0);
  v62 = *(_QWORD *)(v66 - 8);
  MEMORY[0x24BDAC7A8](v66);
  v61 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE4F8);
  v64 = *(_QWORD *)(v67 - 8);
  v5 = MEMORY[0x24BDAC7A8](v67);
  v59 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v63 = (char *)&v53 - v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE500);
  MEMORY[0x24BDAC7A8](v8);
  v69 = (char *)&v53 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE508);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for SharingOptionsGroupsView.GroupView(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(_QWORD *)(v14 + 64);
  MEMORY[0x24BDAC7A8](v13);
  v16 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2549BE510) - 8);
  v17 = MEMORY[0x24BDAC7A8](v1);
  v19 = (char *)&v53 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  LODWORD(v18) = *(unsigned __int8 *)(v1 + 16);
  v71 = v20;
  if ((_DWORD)v18 == 1)
  {
    *(_QWORD *)&v75 = *(_QWORD *)(v17 + 24);
    sub_20D61BBEC(v17, (uint64_t)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SharingOptionsGroupsView.GroupView);
    v21 = (*(unsigned __int8 *)(v14 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
    v22 = swift_allocObject();
    sub_20D61E2BC((uint64_t)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v22 + v21, type metadata accessor for SharingOptionsGroupsView.GroupView);
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE518);
    sub_20D61A878(&qword_2549BE520, &qword_2549BE518, MEMORY[0x24BEE12D8]);
    sub_20D624D1C();
    sub_20D624C74();
    sub_20D6350A0();
    v23 = v71;
    (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v12, v19, v71);
    swift_storeEnumTagMultiPayload();
    sub_20D624CB8(&qword_2549BE548, &qword_2549BE510, (uint64_t (*)(void))sub_20D624D1C);
    sub_20D624D60();
    sub_20D634E18();
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v19, v23);
  }
  else
  {
    v54 = v14;
    v55 = v10;
    v56 = v12;
    v57 = v8;
    if ((*(_BYTE *)(v17 + 17) & 1) != 0)
    {
      *(_QWORD *)&v75 = *(_QWORD *)(v17 + 24);
      sub_20D61BBEC(v17, (uint64_t)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SharingOptionsGroupsView.GroupView);
      v25 = (*(unsigned __int8 *)(v54 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80);
      v26 = swift_allocObject();
      sub_20D61E2BC((uint64_t)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v26 + v25, type metadata accessor for SharingOptionsGroupsView.GroupView);
      swift_bridgeObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE518);
      sub_20D61A878(&qword_2549BE520, &qword_2549BE518, MEMORY[0x24BEE12D8]);
      sub_20D624C30();
      sub_20D624C74();
      v27 = MEMORY[0x24BEE0D00];
      v28 = v58;
      sub_20D6350A0();
      v29 = v60;
      v30 = v70;
      (*(void (**)(char *, uint64_t *, uint64_t))(v60 + 16))(v68, v28, v70);
      swift_storeEnumTagMultiPayload();
      v31 = sub_20D61A878(&qword_2549BE538, &qword_2549BE4F0, MEMORY[0x24BDF4570]);
      *(_QWORD *)&v75 = v66;
      *((_QWORD *)&v75 + 1) = v27;
      v76 = v31;
      v77 = MEMORY[0x24BEE0D28];
      swift_getOpaqueTypeConformance2();
      sub_20D624CB8(&qword_2549BE540, &qword_2549BE4E0, (uint64_t (*)(void))sub_20D624C30);
      v32 = (uint64_t)v69;
      sub_20D634E18();
      (*(void (**)(uint64_t *, uint64_t))(v29 + 8))(v28, v30);
    }
    else
    {
      v33 = v17 + *(int *)(v13 + 40);
      v34 = *(_QWORD *)(v33 + 16);
      v73 = *(_OWORD *)v33;
      v74 = v34;
      v35 = v17;
      v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE560);
      v36 = sub_20D635034();
      v58 = &v53;
      v37 = v75;
      v38 = v77;
      MEMORY[0x24BDAC7A8](v36);
      v75 = v37;
      v76 = v39;
      v77 = v38;
      swift_retain();
      swift_retain();
      swift_bridgeObjectRetain();
      v53 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE568);
      sub_20D624CB8(&qword_2549BE570, &qword_2549BE568, (uint64_t (*)(void))sub_20D624E48);
      v40 = MEMORY[0x24BEE0D00];
      v41 = v61;
      sub_20D635064();
      swift_bridgeObjectRelease();
      swift_release();
      swift_release();
      v42 = *(_QWORD *)(v33 + 16);
      v75 = *(_OWORD *)v33;
      v76 = v42;
      sub_20D63501C();
      v75 = v73;
      sub_20D61BBEC(v35, (uint64_t)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SharingOptionsGroupsView.GroupView);
      v43 = (*(unsigned __int8 *)(v54 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v54 + 80);
      v44 = swift_allocObject();
      sub_20D61E2BC((uint64_t)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v44 + v43, type metadata accessor for SharingOptionsGroupsView.GroupView);
      v45 = sub_20D61A878(&qword_2549BE538, &qword_2549BE4F0, MEMORY[0x24BDF4570]);
      v46 = MEMORY[0x24BEE0D28];
      v47 = v59;
      v48 = v66;
      sub_20D634FBC();
      swift_release();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v62 + 8))(v41, v48);
      v50 = v63;
      v49 = v64;
      v51 = v47;
      v52 = v67;
      (*(void (**)(char *, char *, uint64_t))(v64 + 32))(v63, v51, v67);
      (*(void (**)(char *, char *, uint64_t))(v49 + 16))(v68, v50, v52);
      swift_storeEnumTagMultiPayload();
      *(_QWORD *)&v75 = v48;
      *((_QWORD *)&v75 + 1) = v40;
      v76 = v45;
      v77 = v46;
      swift_getOpaqueTypeConformance2();
      sub_20D624CB8(&qword_2549BE540, &qword_2549BE4E0, (uint64_t (*)(void))sub_20D624C30);
      v32 = (uint64_t)v69;
      sub_20D634E18();
      (*(void (**)(char *, uint64_t))(v49 + 8))(v50, v52);
    }
    sub_20D61E170(v32, (uint64_t)v56, &qword_2549BE500);
    swift_storeEnumTagMultiPayload();
    sub_20D624CB8(&qword_2549BE548, &qword_2549BE510, (uint64_t (*)(void))sub_20D624D1C);
    sub_20D624D60();
    sub_20D634E18();
    return sub_20D61A7A8(v32, &qword_2549BE500);
  }
}

uint64_t sub_20D622CD0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(_QWORD);
  unint64_t v15;
  uint64_t v16;
  uint64_t result;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;

  v6 = type metadata accessor for SharingOptionsGroupsView.GroupView(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v10 = *a1;
  v9 = a1[1];
  v11 = a1[2];
  v12 = a1[3];
  v13 = a1[5];
  v21 = a1[4];
  v22 = v11;
  LOBYTE(a1) = *((_BYTE *)a1 + 48) == 0;
  sub_20D61BBEC(a2, (uint64_t)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v14);
  v15 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v16 = swift_allocObject();
  sub_20D61E2BC((uint64_t)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v16 + v15, type metadata accessor for SharingOptionsGroupsView.GroupView);
  v23 = (char)a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  result = sub_20D635010();
  v18 = v24;
  v19 = v25;
  *(_QWORD *)a3 = v10;
  *(_QWORD *)(a3 + 8) = v9;
  *(_QWORD *)(a3 + 16) = v22;
  *(_QWORD *)(a3 + 24) = v12;
  *(_QWORD *)(a3 + 32) = v21;
  *(_QWORD *)(a3 + 40) = v13;
  *(_BYTE *)(a3 + 48) = v18;
  *(_QWORD *)(a3 + 56) = v19;
  *(_QWORD *)(a3 + 64) = sub_20D6250D8;
  *(_QWORD *)(a3 + 72) = v16;
  return result;
}

uint64_t sub_20D622E18()
{
  type metadata accessor for SharingOptionsGroupsView.GroupView(0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDDA0);
  return sub_20D635088();
}

uint64_t sub_20D622EC0()
{
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE518);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE580);
  sub_20D61A878(&qword_2549BE520, &qword_2549BE518, MEMORY[0x24BEE12D8]);
  sub_20D624E48();
  sub_20D624C74();
  return sub_20D6350A0();
}

uint64_t sub_20D622F80@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;

  v4 = *a1;
  v3 = a1[1];
  sub_20D61DFDC();
  swift_bridgeObjectRetain();
  *(_QWORD *)a2 = sub_20D634F2C();
  *(_QWORD *)(a2 + 8) = v5;
  *(_BYTE *)(a2 + 16) = v6 & 1;
  *(_QWORD *)(a2 + 24) = v7;
  *(_QWORD *)(a2 + 32) = v4;
  *(_QWORD *)(a2 + 40) = v3;
  *(_QWORD *)(a2 + 48) = v4;
  *(_QWORD *)(a2 + 56) = v3;
  return swift_bridgeObjectRetain_n();
}

uint64_t sub_20D623008(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  char *v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  char v19;

  v4 = type metadata accessor for SharingOptionsGroupsView.GroupView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
  sub_20D6350B8();
  v5 = (char *)a3 + *(int *)(v4 + 40);
  v6 = *(_OWORD *)v5;
  v7 = *((_QWORD *)v5 + 2);
  v12 = v6;
  *(_QWORD *)&v13 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE560);
  sub_20D635034();
  v11 = *a3;
  v10 = a3[1];
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDDA0);
  sub_20D635094();
  v8 = v17;
  v12 = v16;
  v13 = v17;
  v14 = v18;
  v15 = v19;
  sub_20D612750(v16, *((uint64_t *)&v16 + 1), v17, *((uint64_t *)&v17 + 1), 1, v11, v10, &v12);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return sub_20D617A90(v8, *((uint64_t *)&v8 + 1));
}

uint64_t sub_20D623190@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v6 = type metadata accessor for SharingOptionsGroupsView.GroupView(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x24BDAC7A8](v6);
  v9 = *a1;
  v10 = a1[1];
  v11 = a1[2];
  v12 = a1[3];
  v13 = a1[5];
  v17 = a1[4];
  v18 = v11;
  LOBYTE(a1) = *((_BYTE *)a1 + 48) == 0;
  sub_20D61BBEC(a2, (uint64_t)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for SharingOptionsGroupsView.GroupView);
  v14 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v15 = swift_allocObject();
  sub_20D61E2BC((uint64_t)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v15 + v14, type metadata accessor for SharingOptionsGroupsView.GroupView);
  *(_QWORD *)a3 = v9;
  *(_QWORD *)(a3 + 8) = v10;
  *(_QWORD *)(a3 + 16) = v18;
  *(_QWORD *)(a3 + 24) = v12;
  *(_QWORD *)(a3 + 32) = v17;
  *(_QWORD *)(a3 + 40) = v13;
  *(_BYTE *)(a3 + 48) = (_BYTE)a1;
  *(_QWORD *)(a3 + 56) = sub_20D6250E8;
  *(_QWORD *)(a3 + 64) = v15;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRetain();
}

uint64_t sub_20D6232B4(uint64_t a1, uint64_t a2, char a3, uint64_t *a4)
{
  uint64_t v5;
  __int128 v6;
  uint64_t v8;
  __int128 v12[3];
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;

  type metadata accessor for SharingOptionsGroupsView.GroupView(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
  sub_20D6350B8();
  v5 = a4[1];
  v8 = *a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDDA0);
  sub_20D635094();
  v6 = v15;
  v12[0] = v14;
  v12[1] = v15;
  v12[2] = v16;
  v13 = v17;
  sub_20D6131AC(a1, a2, a3, v8, v5, v12);
  swift_release();
  swift_release();
  swift_release();
  return sub_20D617A90(v6, *((uint64_t *)&v6 + 1));
}

uint64_t sub_20D6233E0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20D634C2C();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_20D62345C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_20D634C38();
}

uint64_t type metadata accessor for SharingOptionsGroupsView(uint64_t a1)
{
  return sub_20D61BC98(a1, (uint64_t *)&unk_2549BE3E0);
}

uint64_t sub_20D6234F0()
{
  uint64_t v0;

  return sub_20D621170(*(_QWORD *)(v0 + 16));
}

unint64_t sub_20D6234F8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549BE2C8;
  if (!qword_2549BE2C8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE2D0);
    v2[0] = sub_20D62357C();
    v2[1] = sub_20D61A878(&qword_2549BE2F0, &qword_2549BE2F8, MEMORY[0x24BDF1248]);
    result = MEMORY[0x212BA5644](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549BE2C8);
  }
  return result;
}

unint64_t sub_20D62357C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[3];

  result = qword_2549BE2D8;
  if (!qword_2549BE2D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE2E0);
    v2[0] = sub_20D61E100();
    v2[1] = sub_20D619F34(&qword_2549BE2E8, type metadata accessor for SharingOptionsGroupsView.GroupView, (uint64_t)&unk_20D636D90);
    v2[2] = v2[0];
    result = MEMORY[0x212BA5644](MEMORY[0x24BDF4AF8], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549BE2D8);
  }
  return result;
}

uint64_t type metadata accessor for SharingOptionsGroupsView.GroupView(uint64_t a1)
{
  return sub_20D61BC98(a1, qword_2549BE490);
}

unint64_t sub_20D623628()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549BE300;
  if (!qword_2549BE300)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE288);
    v2[0] = sub_20D61A878(&qword_2549BE308, &qword_2549BE280, MEMORY[0x24BDF1A30]);
    v2[1] = sub_20D619F34(&qword_2549BE310, type metadata accessor for AlertViewModelAlert, (uint64_t)&unk_20D636AC8);
    result = MEMORY[0x212BA5644](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549BE300);
  }
  return result;
}

unint64_t sub_20D6236C4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549BE318;
  if (!qword_2549BE318)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE2A8);
    v2[0] = sub_20D61A878(&qword_2549BE320, &qword_2549BE2A0, MEMORY[0x24BDEB238]);
    v2[1] = sub_20D619F34(&qword_2549BE310, type metadata accessor for AlertViewModelAlert, (uint64_t)&unk_20D636AC8);
    result = MEMORY[0x212BA5644](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549BE318);
  }
  return result;
}

uint64_t sub_20D623760@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_20D61FBD4(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_20D623768()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549BE330;
  if (!qword_2549BE330)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE328);
    v2[0] = sub_20D6237EC();
    v2[1] = sub_20D61A878(&qword_2549BE380, &qword_2549BE9B0, MEMORY[0x24BDF09B0]);
    result = MEMORY[0x212BA5644](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549BE330);
  }
  return result;
}

unint64_t sub_20D6237EC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549BE338;
  if (!qword_2549BE338)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE340);
    v2[0] = sub_20D623870();
    v2[1] = sub_20D61A878(&qword_2549BE378, (uint64_t *)&unk_2549BE9A0, MEMORY[0x24BDEF370]);
    result = MEMORY[0x212BA5644](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549BE338);
  }
  return result;
}

unint64_t sub_20D623870()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549BE348;
  if (!qword_2549BE348)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE350);
    v2[0] = sub_20D6238DC();
    v2[1] = MEMORY[0x24BDEDB80];
    result = MEMORY[0x212BA5644](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549BE348);
  }
  return result;
}

unint64_t sub_20D6238DC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549BE358;
  if (!qword_2549BE358)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE360);
    v2[0] = sub_20D61A878(&qword_2549BE368, &qword_2549BE370, MEMORY[0x24BDF4700]);
    v2[1] = MEMORY[0x24BDECC60];
    result = MEMORY[0x212BA5644](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549BE358);
  }
  return result;
}

uint64_t sub_20D623960()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for SharingOptionsGroupsView(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE70);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_20D634CB0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
    v9 = *(int *)(a3 + 20);
    v10 = (char *)a1 + v9;
    v11 = (char *)a2 + v9;
    v12 = *(_QWORD *)v11;
    v13 = *((_QWORD *)v11 + 1);
    v14 = v11[16];
    sub_20D61BEDC();
    *(_QWORD *)v10 = v12;
    *((_QWORD *)v10 + 1) = v13;
    v10[16] = v14;
    v15 = *(int *)(a3 + 24);
    v16 = (char *)a1 + v15;
    v17 = (char *)a2 + v15;
    v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(v16, v17, v18);
  }
  return a1;
}

uint64_t destroy for SharingOptionsGroupsView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_20D634CB0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  sub_20D61BB3C();
  v5 = a1 + *(int *)(a2 + 24);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

_QWORD *initializeWithCopy for SharingOptionsGroupsView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_20D634CB0();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = *(_QWORD *)v9;
  v11 = *((_QWORD *)v9 + 1);
  v12 = v9[16];
  sub_20D61BEDC();
  *(_QWORD *)v8 = v10;
  *((_QWORD *)v8 + 1) = v11;
  v8[16] = v12;
  v13 = *(int *)(a3 + 24);
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
  return a1;
}

_QWORD *assignWithCopy for SharingOptionsGroupsView(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;

  if (a1 != a2)
  {
    sub_20D61A7A8((uint64_t)a1, &qword_2549BDE70);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE70);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_20D634CB0();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = *(_QWORD *)v9;
  v11 = *((_QWORD *)v9 + 1);
  v12 = v9[16];
  sub_20D61BEDC();
  *(_QWORD *)v8 = v10;
  *((_QWORD *)v8 + 1) = v11;
  v8[16] = v12;
  sub_20D61BB3C();
  v13 = *(int *)(a3 + 24);
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 24))(v14, v15, v16);
  return a1;
}

char *initializeWithTake for SharingOptionsGroupsView(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_20D634CB0();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = *(int *)(a3 + 20);
  v9 = *(int *)(a3 + 24);
  v10 = &a1[v8];
  v11 = &a2[v8];
  *(_OWORD *)v10 = *(_OWORD *)v11;
  v10[16] = v11[16];
  v12 = &a1[v9];
  v13 = &a2[v9];
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  return a1;
}

char *assignWithTake for SharingOptionsGroupsView(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

  if (a1 != a2)
  {
    sub_20D61A7A8((uint64_t)a1, &qword_2549BDE70);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE70);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_20D634CB0();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = v10[16];
  *(_OWORD *)v9 = *(_OWORD *)v10;
  v9[16] = v11;
  sub_20D61BB3C();
  v12 = *(int *)(a3 + 24);
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t getEnumTagSinglePayload for SharingOptionsGroupsView()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D623F80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned int v9;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDF68);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  if ((_DWORD)a2 == 254)
  {
    v9 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 20) + 16);
    if (v9 > 1)
      return (v9 ^ 0xFF) + 1;
    else
      return 0;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(a1 + *(int *)(a3 + 24), a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for SharingOptionsGroupsView()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D624038(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDF68);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 254)
    {
      *(_BYTE *)(a1 + *(int *)(a4 + 20) + 16) = -(char)a2;
      return result;
    }
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_20D6240E4()
{
  unint64_t v0;
  unint64_t v1;

  sub_20D6241A0(319, qword_2549BDFD8, (uint64_t (*)(uint64_t))MEMORY[0x24BDEB418], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x24BDEB560]);
  if (v0 <= 0x3F)
  {
    sub_20D6241A0(319, qword_2549BE3F0, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, MEMORY[0x24BDF4C28]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_20D6241A0(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
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

unint64_t sub_20D6241FC()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[4];

  result = qword_2549BE428;
  if (!qword_2549BE428)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_2549BE430);
    v2 = sub_20D6236C4();
    v3[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE288);
    v3[3] = sub_20D623628();
    v3[0] = v2;
    v3[1] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x212BA5644](MEMORY[0x24BDEF3E0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2549BE428);
  }
  return result;
}

_QWORD *sub_20D624298(_QWORD *a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
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
  __int128 v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v18 = *a2;
    *a1 = *a2;
    v4 = (_QWORD *)(v18 + ((v5 + 16) & ~(unint64_t)v5));
  }
  else
  {
    v7 = a2[1];
    *v4 = *a2;
    v4[1] = v7;
    *((_BYTE *)v4 + 16) = *((_BYTE *)a2 + 16);
    *((_BYTE *)v4 + 17) = *((_BYTE *)a2 + 17);
    v8 = a3[8];
    v9 = (char *)v4 + v8;
    v10 = (uint64_t)a2 + v8;
    v4[3] = a2[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(v9, v10, v11);
    v12 = a3[9];
    v13 = (char *)v4 + v12;
    v14 = (uint64_t)a2 + v12;
    v15 = *(uint64_t *)((char *)a2 + v12 + 8);
    *(_QWORD *)v13 = *(uint64_t *)((char *)a2 + v12);
    *((_QWORD *)v13 + 1) = v15;
    v16 = *(uint64_t *)((char *)a2 + v12 + 24);
    swift_retain();
    swift_retain();
    if (v16)
    {
      *((_QWORD *)v13 + 2) = *(_QWORD *)(v14 + 16);
      *((_QWORD *)v13 + 3) = v16;
      v17 = *(_QWORD *)(v14 + 40);
      *((_QWORD *)v13 + 4) = *(_QWORD *)(v14 + 32);
      *((_QWORD *)v13 + 5) = v17;
      v13[48] = *(_BYTE *)(v14 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    else
    {
      v19 = *(_OWORD *)(v14 + 32);
      *((_OWORD *)v13 + 1) = *(_OWORD *)(v14 + 16);
      *((_OWORD *)v13 + 2) = v19;
      v13[48] = *(_BYTE *)(v14 + 48);
    }
    v20 = a3[10];
    v21 = (_QWORD *)((char *)v4 + v20);
    v22 = (uint64_t *)((char *)a2 + v20);
    v23 = v22[1];
    *v21 = *v22;
    v21[1] = v23;
    v21[2] = v22[2];
    swift_bridgeObjectRetain();
  }
  swift_retain();
  return v4;
}

uint64_t sub_20D6243F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 32);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = a1 + *(int *)(a2 + 36);
  swift_release();
  swift_release();
  if (*(_QWORD *)(v6 + 24))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t sub_20D624490(uint64_t a1, uint64_t a2, int *a3)
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
  __int128 v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v7 = a3[8];
  v8 = a1 + v7;
  v9 = a2 + v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = a3[9];
  v12 = a1 + v11;
  v13 = a2 + v11;
  v14 = *(_QWORD *)(a2 + v11 + 8);
  *(_QWORD *)v12 = *(_QWORD *)(a2 + v11);
  *(_QWORD *)(v12 + 8) = v14;
  v15 = *(_QWORD *)(a2 + v11 + 24);
  swift_retain();
  swift_retain();
  if (v15)
  {
    *(_QWORD *)(v12 + 16) = *(_QWORD *)(v13 + 16);
    *(_QWORD *)(v12 + 24) = v15;
    v16 = *(_QWORD *)(v13 + 40);
    *(_QWORD *)(v12 + 32) = *(_QWORD *)(v13 + 32);
    *(_QWORD *)(v12 + 40) = v16;
    *(_BYTE *)(v12 + 48) = *(_BYTE *)(v13 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v17 = *(_OWORD *)(v13 + 32);
    *(_OWORD *)(v12 + 16) = *(_OWORD *)(v13 + 16);
    *(_OWORD *)(v12 + 32) = v17;
    *(_BYTE *)(v12 + 48) = *(_BYTE *)(v13 + 48);
  }
  v18 = a3[10];
  v19 = (_QWORD *)(a1 + v18);
  v20 = (_QWORD *)(a2 + v18);
  v21 = v20[1];
  *v19 = *v20;
  v19[1] = v21;
  v19[2] = v20[2];
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t sub_20D6245C0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[8];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = a3[9];
  v11 = a1 + v10;
  v12 = a2 + v10;
  *(_QWORD *)(a1 + v10) = *(_QWORD *)(a2 + v10);
  swift_retain();
  swift_release();
  *(_QWORD *)(v11 + 8) = *(_QWORD *)(v12 + 8);
  swift_retain();
  swift_release();
  v13 = (_OWORD *)(v11 + 16);
  v14 = (_OWORD *)(v12 + 16);
  v15 = *(_QWORD *)(v12 + 24);
  if (*(_QWORD *)(v11 + 24))
  {
    if (v15)
    {
      *(_QWORD *)(v11 + 16) = *(_QWORD *)(v12 + 16);
      *(_QWORD *)(v11 + 24) = *(_QWORD *)(v12 + 24);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v11 + 32) = *(_QWORD *)(v12 + 32);
      *(_QWORD *)(v11 + 40) = *(_QWORD *)(v12 + 40);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(_BYTE *)(v11 + 48) = *(_BYTE *)(v12 + 48);
    }
    else
    {
      sub_20D6247C0(v11 + 16);
      v16 = *(_BYTE *)(v12 + 48);
      v17 = *(_OWORD *)(v12 + 32);
      *v13 = *v14;
      *(_OWORD *)(v11 + 32) = v17;
      *(_BYTE *)(v11 + 48) = v16;
    }
  }
  else if (v15)
  {
    *(_QWORD *)(v11 + 16) = *(_QWORD *)(v12 + 16);
    *(_QWORD *)(v11 + 24) = *(_QWORD *)(v12 + 24);
    *(_QWORD *)(v11 + 32) = *(_QWORD *)(v12 + 32);
    *(_QWORD *)(v11 + 40) = *(_QWORD *)(v12 + 40);
    *(_BYTE *)(v11 + 48) = *(_BYTE *)(v12 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    v18 = *v14;
    v19 = *(_OWORD *)(v12 + 32);
    *(_BYTE *)(v11 + 48) = *(_BYTE *)(v12 + 48);
    *v13 = v18;
    *(_OWORD *)(v11 + 32) = v19;
  }
  v20 = a3[10];
  v21 = (_QWORD *)(a1 + v20);
  v22 = a2 + v20;
  *v21 = *(_QWORD *)(a2 + v20);
  v21[1] = *(_QWORD *)(a2 + v20 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v21[2] = *(_QWORD *)(v22 + 16);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t sub_20D6247C0(uint64_t a1)
{
  destroy for SharingOptionsObservableModel.UserAction();
  return a1;
}

uint64_t sub_20D6247F4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  v6 = a3[8];
  v7 = a1 + v6;
  v8 = a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[9];
  v11 = a3[10];
  v12 = a1 + v10;
  v13 = a2 + v10;
  v14 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)v12 = *(_OWORD *)v13;
  *(_OWORD *)(v12 + 16) = v14;
  *(_OWORD *)(v12 + 32) = *(_OWORD *)(v13 + 32);
  *(_BYTE *)(v12 + 48) = *(_BYTE *)(v13 + 48);
  v15 = a1 + v11;
  v16 = a2 + v11;
  *(_QWORD *)(v15 + 16) = *(_QWORD *)(v16 + 16);
  *(_OWORD *)v15 = *(_OWORD *)v16;
  return a1;
}

uint64_t sub_20D6248B8(uint64_t a1, uint64_t a2, int *a3)
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
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v20;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_BYTE *)(a1 + 17) = *(_BYTE *)(a2 + 17);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  v7 = a3[8];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[9];
  v12 = a1 + v11;
  v13 = a2 + v11;
  *(_QWORD *)(a1 + v11) = *(_QWORD *)(a2 + v11);
  swift_release();
  *(_QWORD *)(v12 + 8) = *(_QWORD *)(v13 + 8);
  swift_release();
  if (!*(_QWORD *)(v12 + 24))
    goto LABEL_5;
  v14 = *(_QWORD *)(v13 + 24);
  if (!v14)
  {
    sub_20D6247C0(v12 + 16);
LABEL_5:
    v16 = *(_OWORD *)(v13 + 32);
    *(_OWORD *)(v12 + 16) = *(_OWORD *)(v13 + 16);
    *(_OWORD *)(v12 + 32) = v16;
    *(_BYTE *)(v12 + 48) = *(_BYTE *)(v13 + 48);
    goto LABEL_6;
  }
  *(_QWORD *)(v12 + 16) = *(_QWORD *)(v13 + 16);
  *(_QWORD *)(v12 + 24) = v14;
  swift_bridgeObjectRelease();
  v15 = *(_QWORD *)(v13 + 40);
  *(_QWORD *)(v12 + 32) = *(_QWORD *)(v13 + 32);
  *(_QWORD *)(v12 + 40) = v15;
  swift_bridgeObjectRelease();
  *(_BYTE *)(v12 + 48) = *(_BYTE *)(v13 + 48);
LABEL_6:
  v17 = a3[10];
  v18 = (_QWORD *)(a1 + v17);
  v19 = (_QWORD *)(a2 + v17);
  v20 = v19[1];
  *v18 = *v19;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  v18[2] = v19[2];
  swift_release();
  return a1;
}

uint64_t sub_20D624A08()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D624A14(uint64_t a1, uint64_t a2, uint64_t a3)
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
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 32), a2, v8);
  }
}

uint64_t sub_20D624A94()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D624AA0(uint64_t result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 32), a2, a2, v7);
  }
  return result;
}

void sub_20D624B18()
{
  unint64_t v0;

  sub_20D6241A0(319, qword_2549BE3F0, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, MEMORY[0x24BDF4C28]);
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t sub_20D624BD0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D624BE4@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SharingOptionsGroupsView.GroupView(0) - 8) + 80);
  return sub_20D623190(a1, v2 + ((v5 + 16) & ~v5), a2);
}

unint64_t sub_20D624C30()
{
  unint64_t result;

  result = qword_2549BE528;
  if (!qword_2549BE528)
  {
    result = MEMORY[0x212BA5644](&unk_20D636FB0, &type metadata for SharingOptionsGroupsView.GroupView.PickerRow);
    atomic_store(result, (unint64_t *)&qword_2549BE528);
  }
  return result;
}

unint64_t sub_20D624C74()
{
  unint64_t result;

  result = qword_2549BE530;
  if (!qword_2549BE530)
  {
    result = MEMORY[0x212BA5644](&unk_20D6365A4, &type metadata for SharingOptionsObservableModel.Group.Option);
    atomic_store(result, (unint64_t *)&qword_2549BE530);
  }
  return result;
}

uint64_t sub_20D624CB8(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7 = a3();
    result = MEMORY[0x212BA5644](MEMORY[0x24BDF4A08], v6, &v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_20D624D1C()
{
  unint64_t result;

  result = qword_2549BE550;
  if (!qword_2549BE550)
  {
    result = MEMORY[0x212BA5644](&unk_20D636F60, &type metadata for SharingOptionsGroupsView.GroupView.TogglesRow);
    atomic_store(result, (unint64_t *)&qword_2549BE550);
  }
  return result;
}

unint64_t sub_20D624D60()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[6];

  result = qword_2549BE558;
  if (!qword_2549BE558)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE500);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE4F0);
    v3 = sub_20D61A878(&qword_2549BE538, &qword_2549BE4F0, MEMORY[0x24BDF4570]);
    v4[2] = v2;
    v4[3] = MEMORY[0x24BEE0D00];
    v4[4] = v3;
    v4[5] = MEMORY[0x24BEE0D28];
    v4[0] = swift_getOpaqueTypeConformance2();
    v4[1] = sub_20D624CB8(&qword_2549BE540, &qword_2549BE4E0, (uint64_t (*)(void))sub_20D624C30);
    result = MEMORY[0x212BA5644](MEMORY[0x24BDEF3E0], v1, v4);
    atomic_store(result, (unint64_t *)&qword_2549BE558);
  }
  return result;
}

uint64_t sub_20D624E40()
{
  return sub_20D622EC0();
}

unint64_t sub_20D624E48()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549BE578;
  if (!qword_2549BE578)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE580);
    v2[0] = sub_20D624ECC();
    v2[1] = sub_20D61A878(&qword_2549BE5A8, &qword_2549BE5B0, MEMORY[0x24BDEFB48]);
    result = MEMORY[0x212BA5644](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549BE578);
  }
  return result;
}

unint64_t sub_20D624ECC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_2549BE588;
  if (!qword_2549BE588)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE590);
    v2 = sub_20D61A878(&qword_2549BE598, &qword_2549BE5A0, MEMORY[0x24BDEFB48]);
    v3[0] = MEMORY[0x24BDF1F80];
    v3[1] = v2;
    result = MEMORY[0x212BA5644](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2549BE588);
  }
  return result;
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for SharingOptionsGroupsView.GroupView(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = v3 + *(int *)(v1 + 32);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  v6 = v3 + *(int *)(v1 + 36);
  swift_release();
  swift_release();
  if (*(_QWORD *)(v6 + 24))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D625038(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SharingOptionsGroupsView.GroupView(0) - 8) + 80);
  return sub_20D623008(a1, a2, (uint64_t *)(v2 + ((v5 + 16) & ~v5)));
}

uint64_t sub_20D625088@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SharingOptionsGroupsView.GroupView(0) - 8) + 80);
  return sub_20D622CD0(a1, v2 + ((v5 + 16) & ~v5), a2);
}

uint64_t sub_20D6250D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D6250F4(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_20D622E18);
}

uint64_t sub_20D6250E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D6250F4(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_20D6232B4);
}

uint64_t sub_20D6250F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v8;

  v8 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SharingOptionsGroupsView.GroupView(0) - 8) + 80);
  return a4(a1, a2, a3, v4 + ((v8 + 16) & ~v8));
}

uint64_t sub_20D62516C(uint64_t a1)
{
  return sub_20D6253A8(a1, (uint64_t (*)(uint64_t, uint64_t))sub_20D620188);
}

unint64_t sub_20D625178()
{
  unint64_t result;

  result = qword_2549BE5E0;
  if (!qword_2549BE5E0)
  {
    result = MEMORY[0x212BA5644](&unk_20D63627C, &type metadata for SharingOptionsObservableModel.Group);
    atomic_store(result, (unint64_t *)&qword_2549BE5E0);
  }
  return result;
}

uint64_t objectdestroy_39Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for SharingOptionsGroupsView(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 16) & ~v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_20D634CB0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v0 + v3, v4);
  }
  else
  {
    swift_release();
  }
  sub_20D61BB3C();
  v5 = v0 + v3 + *(int *)(v1 + 24);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return swift_deallocObject();
}

uint64_t sub_20D6252AC()
{
  type metadata accessor for SharingOptionsGroupsView(0);
  return sub_20D620EE8();
}

uint64_t sub_20D6252F0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D625314(double *a1)
{
  uint64_t v1;

  return sub_20D62A3BC(a1, *(uint64_t (**)(double, double))(v1 + 16));
}

uint64_t sub_20D62531C()
{
  uint64_t v0;

  return sub_20D60FBC8(*(_QWORD *)(v0 + 16), *(double *)(v0 + 24), *(double *)(v0 + 32));
}

uint64_t sub_20D625340(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_20D62537C()
{
  uint64_t v0;

  return sub_20D610500(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24));
}

uint64_t sub_20D62539C(uint64_t a1)
{
  return sub_20D6253A8(a1, (uint64_t (*)(uint64_t, uint64_t))sub_20D621348);
}

uint64_t sub_20D6253A8(uint64_t a1, uint64_t (*a2)(uint64_t, uint64_t))
{
  uint64_t v2;
  uint64_t v4;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SharingOptionsGroupsView(0) - 8) + 80);
  return a2(a1, v2 + ((v4 + 16) & ~v4));
}

uint64_t sub_20D625404@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_20D6217A4(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_20D625414@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_20D634DAC();
  *a1 = result & 1;
  return result;
}

uint64_t sub_20D625440()
{
  return sub_20D634DB8();
}

uint64_t sub_20D625464()
{
  return swift_deallocObject();
}

_BYTE *sub_20D625474(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

uint64_t destroy for SharingOptionsGroupsView.GroupView.PickerRow()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for SharingOptionsGroupsView.GroupView.PickerRow(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v6 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SharingOptionsGroupsView.GroupView.PickerRow(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v4 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v4;
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for SharingOptionsGroupsView.GroupView.PickerRow(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SharingOptionsGroupsView.GroupView.PickerRow(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 72))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SharingOptionsGroupsView.GroupView.PickerRow(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SharingOptionsGroupsView.GroupView.PickerRow()
{
  return &type metadata for SharingOptionsGroupsView.GroupView.PickerRow;
}

uint64_t destroy for SharingOptionsGroupsView.GroupView.TogglesRow()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for SharingOptionsGroupsView.GroupView.TogglesRow(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  v6 = *(_QWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = v6;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SharingOptionsGroupsView.GroupView.TogglesRow(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_retain();
  swift_release();
  v4 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for SharingOptionsGroupsView.GroupView.TogglesRow(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  swift_release();
  v7 = *(_QWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = v7;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SharingOptionsGroupsView.GroupView.TogglesRow(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SharingOptionsGroupsView.GroupView.TogglesRow(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
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
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SharingOptionsGroupsView.GroupView.TogglesRow()
{
  return &type metadata for SharingOptionsGroupsView.GroupView.TogglesRow;
}

unint64_t sub_20D6259EC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549BE600;
  if (!qword_2549BE600)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE608);
    v2[0] = sub_20D624CB8(&qword_2549BE548, &qword_2549BE510, (uint64_t (*)(void))sub_20D624D1C);
    v2[1] = sub_20D624D60();
    result = MEMORY[0x212BA5644](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549BE600);
  }
  return result;
}

uint64_t sub_20D625A70()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D625A80()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D625A90()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D625ACC()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD, BOOL))(v0 + 72))(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), (*(_BYTE *)(v0 + 64) & 1) == 0);
}

double sub_20D625B00@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_20D621A74(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_20D625B08(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_20D625B5C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_20D61E354(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_20D625B8C(uint64_t result)
{
  if (result)
  {
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_20D625BC8(uint64_t result)
{
  if (result)
  {
    swift_release();
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_20D625C00(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_20D61E2AC(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_20D625C30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_20D634D7C();
  *a1 = result;
  return result;
}

uint64_t sub_20D625C58()
{
  swift_retain();
  return sub_20D634D88();
}

double sub_20D625C80@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  double result;

  *(_QWORD *)&result = sub_20D6221C8(*(_QWORD *)(v1 + 16), a1).n128_u64[0];
  return result;
}

uint64_t sub_20D625C88()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D625CCC(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v2 + 80))(*(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *a2);
}

uint64_t sub_20D625CF8(uint64_t a1)
{
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_20D625D60()
{
  return sub_20D61A878(&qword_2549BE648, (uint64_t *)&unk_2549BE650, MEMORY[0x24BDF43B0]);
}

uint64_t sub_20D625D8C()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE620);
  sub_20D61A878(&qword_2549BE640, &qword_2549BE620, MEMORY[0x24BDF46D0]);
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D625E08()
{
  return sub_20D62531C();
}

uint64_t AddressingView.viewModel.getter()
{
  return sub_20D625E34((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))MEMORY[0x24BDEB790]);
}

uint64_t AddressingView.$viewModel.getter()
{
  return sub_20D625E34(MEMORY[0x24BDEB798]);
}

uint64_t sub_20D625E34(uint64_t (*a1)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *v1;
  v3 = v1[1];
  v4 = *((unsigned __int8 *)v1 + 16);
  v5 = type metadata accessor for AddressingViewModel();
  v6 = sub_20D619F34(&qword_2549BE660, (uint64_t (*)(uint64_t))type metadata accessor for AddressingViewModel, (uint64_t)&protocol conformance descriptor for AddressingViewModel);
  return a1(v2, v3, v4, v5, v6);
}

uint64_t AddressingView.init(viewModel:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = sub_20D61BA4C;
  *(_QWORD *)(a2 + 8) = result;
  *(_BYTE *)(a2 + 16) = 0;
  return result;
}

uint64_t AddressingView.body.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t KeyPath;
  uint64_t result;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  sub_20D61BEDC();
  type metadata accessor for AddressingViewModel();
  sub_20D619F34(&qword_2549BE660, (uint64_t (*)(uint64_t))type metadata accessor for AddressingViewModel, (uint64_t)&protocol conformance descriptor for AddressingViewModel);
  sub_20D634CC8();
  sub_20D61BB3C();
  KeyPath = swift_getKeyPath();
  *(_QWORD *)(a1 + *(int *)(type metadata accessor for AddressingView_iOS(0) + 28)) = KeyPath;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE668);
  swift_storeEnumTagMultiPayload();
  type metadata accessor for CGSize(0);
  sub_20D635010();
  *(_OWORD *)a1 = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = sub_20D625FFC;
  *(_QWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 40) = 0;
  result = sub_20D634D34();
  *(_QWORD *)(a1 + 48) = result;
  *(_QWORD *)(a1 + 56) = v4;
  return result;
}

uint64_t sub_20D625FFC()
{
  uint64_t v0;

  type metadata accessor for KeyboardObserver(0);
  v0 = swift_allocObject();
  sub_20D634BFC();
  return v0;
}

uint64_t sub_20D626058@<X0>(uint64_t a1@<X8>)
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  char *v43;
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
  unint64_t v56;

  v51 = a1;
  v2 = type metadata accessor for AddressingView_iOS(0);
  v3 = *(_QWORD *)(*(_QWORD *)(v2 - 8) + 64);
  v44 = *(_QWORD *)(v2 - 8);
  v45 = v3;
  MEMORY[0x24BDAC7A8](v2);
  v40 = (uint64_t)&v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE1B8);
  v6 = *(_QWORD *)(v5 - 8);
  v47 = v5;
  v48 = v6;
  MEMORY[0x24BDAC7A8](v5);
  v41 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE900);
  v9 = *(_QWORD *)(v8 - 8);
  v49 = v8;
  v50 = v9;
  MEMORY[0x24BDAC7A8](v8);
  v43 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_20D634DDC();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE908);
  v38 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v16 = (char *)&v36 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE910);
  v46 = *(_QWORD *)(v42 - 8);
  MEMORY[0x24BDAC7A8](v42);
  v39 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE918);
  sub_20D62B5DC(&qword_2549BE920, &qword_2549BE918, sub_20D62B5B8, MEMORY[0x24BDF0910]);
  sub_20D634D28();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_20D634C2C();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, *MEMORY[0x24BDEE5F0], v11);
  v18 = sub_20D61A878(&qword_2549BE9C8, &qword_2549BE908, MEMORY[0x24BDEC988]);
  v19 = sub_20D61DFDC();
  v20 = v37;
  v21 = MEMORY[0x24BEE0D00];
  sub_20D634F8C();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  swift_bridgeObjectRelease();
  v22 = v16;
  v23 = v20;
  (*(void (**)(char *, uint64_t))(v38 + 8))(v22, v20);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_20D634C2C();
  swift_release();
  swift_release();
  swift_release();
  v24 = v40;
  sub_20D62B8F8(v1, v40);
  v25 = (*(unsigned __int8 *)(v44 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
  v26 = swift_allocObject();
  sub_20D62B940(v24, v26 + v25);
  v27 = v41;
  v28 = v21;
  sub_20D635058();
  v29 = sub_20D61A878(&qword_2549BE1B0, &qword_2549BE1B8, MEMORY[0x24BDF43B0]);
  v30 = v43;
  v31 = v47;
  sub_20D634FA4();
  (*(void (**)(char *, uint64_t))(v48 + 8))(v27, v31);
  v53 = v23;
  v54 = v28;
  v55 = v18;
  v56 = v19;
  swift_getOpaqueTypeConformance2();
  v53 = v31;
  v54 = v29;
  swift_getOpaqueTypeConformance2();
  v32 = v42;
  v33 = v49;
  v34 = v39;
  sub_20D634F80();
  (*(void (**)(char *, uint64_t))(v50 + 8))(v30, v33);
  return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v34, v32);
}

uint64_t sub_20D62651C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)@<X0>(uint64_t *@<X8>);
  uint64_t (*v36)@<X0>(uint64_t *@<X8>);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t (**v40)@<X0>(uint64_t *@<X8>);
  uint64_t v41;
  uint64_t (**v42)(double *);
  uint64_t v43;
  char v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t (**v65)();
  uint64_t v66;
  uint64_t v67;
  _QWORD *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;

  v94 = a2;
  v3 = sub_20D634DDC();
  v91 = *(_QWORD *)(v3 - 8);
  v92 = v3;
  MEMORY[0x24BDAC7A8](v3);
  v89 = (char *)&v69 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE978);
  MEMORY[0x24BDAC7A8](v77);
  v6 = (char *)&v69 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for AddressingView_iOS(0);
  v72 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v73 = v8;
  v9 = (char *)&v69 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE980);
  MEMORY[0x24BDAC7A8](v71);
  v11 = (char *)&v69 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE9E0);
  v75 = *(_QWORD *)(v76 - 8);
  MEMORY[0x24BDAC7A8](v76);
  v13 = (char *)&v69 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v74 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE968);
  MEMORY[0x24BDAC7A8](v74);
  v15 = (char *)&v69 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE950);
  MEMORY[0x24BDAC7A8](v78);
  v17 = (char *)&v69 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE948);
  v80 = *(_QWORD *)(v18 - 8);
  v81 = v18;
  MEMORY[0x24BDAC7A8](v18);
  v79 = (char *)&v69 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE9E8);
  v85 = *(_QWORD *)(v20 - 8);
  v86 = v20;
  MEMORY[0x24BDAC7A8](v20);
  v83 = (char *)&v69 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE940);
  MEMORY[0x24BDAC7A8](v82);
  v87 = (char *)&v69 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE930);
  MEMORY[0x24BDAC7A8](v84);
  v93 = (uint64_t)&v69 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE918);
  MEMORY[0x24BDAC7A8](v88);
  v90 = (uint64_t)&v69 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AddressingViewModel();
  sub_20D619F34(&qword_2549BE660, (uint64_t (*)(uint64_t))type metadata accessor for AddressingViewModel, (uint64_t)&protocol conformance descriptor for AddressingViewModel);
  swift_retain();
  v25 = sub_20D634D34();
  v95 = 0x4034000000000000;
  v96 = v25;
  v97 = v26;
  v27 = *MEMORY[0x24BDECEA0];
  v28 = sub_20D634D40();
  v29 = (uint64_t (*)(uint64_t))MEMORY[0x24BDECF50];
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 104))(v11, v27, v28);
  sub_20D619F34(&qword_2549BE9F0, v29, MEMORY[0x24BDECF78]);
  result = sub_20D635154();
  if ((result & 1) != 0)
  {
    sub_20D62B8A4();
    sub_20D61A878((unint64_t *)&unk_2549BE990, &qword_2549BE980, MEMORY[0x24BEE30C8]);
    sub_20D634F68();
    sub_20D61A7A8((uint64_t)v11, &qword_2549BE980);
    swift_release();
    sub_20D62B8F8(a1, (uint64_t)v9);
    v31 = *(unsigned __int8 *)(v72 + 80);
    v32 = (v31 + 16) & ~v31;
    v72 = v32 + v73;
    v71 = v31 | 7;
    v33 = swift_allocObject();
    v73 = v32;
    v69 = v9;
    sub_20D62B940((uint64_t)v9, v33 + v32);
    v34 = sub_20D6350E8();
    v36 = v35;
    v37 = a1;
    v38 = v75;
    v39 = v76;
    (*(void (**)(char *, char *, uint64_t))(v75 + 16))(v6, v13, v76);
    v40 = (uint64_t (**)@<X0>(uint64_t *@<X8>))&v6[*(int *)(v77 + 36)];
    *v40 = sub_20D62D068;
    v40[1] = 0;
    v40[2] = (uint64_t (*)@<X0>(uint64_t *@<X8>))v34;
    v40[3] = v36;
    v41 = swift_allocObject();
    *(_QWORD *)(v41 + 16) = sub_20D62BA84;
    *(_QWORD *)(v41 + 24) = v33;
    sub_20D61E170((uint64_t)v6, (uint64_t)v15, &qword_2549BE978);
    v42 = (uint64_t (**)(double *))&v15[*(int *)(v74 + 36)];
    *v42 = sub_20D62BAEC;
    v42[1] = (uint64_t (*)(double *))v41;
    sub_20D61A7A8((uint64_t)v6, &qword_2549BE978);
    (*(void (**)(char *, uint64_t))(v38 + 8))(v13, v39);
    v43 = sub_20D634D4C();
    v44 = sub_20D634EC0();
    sub_20D61E170((uint64_t)v15, (uint64_t)v17, &qword_2549BE968);
    v45 = v78;
    v46 = &v17[*(int *)(v78 + 36)];
    *(_QWORD *)v46 = v43;
    v46[8] = v44;
    sub_20D61A7A8((uint64_t)v15, &qword_2549BE968);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_20D634C2C();
    swift_release();
    swift_release();
    swift_release();
    v70 = v37;
    sub_20D634DF4();
    v47 = sub_20D62B5DC(&qword_2549BE958, &qword_2549BE950, (uint64_t (*)(void))sub_20D62B740, MEMORY[0x24BDF1050]);
    v48 = v79;
    sub_20D634F74();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_20D61A7A8((uint64_t)v17, &qword_2549BE950);
    v50 = v91;
    v49 = v92;
    v51 = v89;
    (*(void (**)(char *, _QWORD, uint64_t))(v91 + 104))(v89, *MEMORY[0x24BDEE5F0], v92);
    v95 = v45;
    v96 = v47;
    swift_getOpaqueTypeConformance2();
    v52 = v83;
    v53 = v81;
    sub_20D634F98();
    (*(void (**)(char *, uint64_t))(v50 + 8))(v51, v49);
    (*(void (**)(char *, uint64_t))(v80 + 8))(v48, v53);
    v54 = v70;
    type metadata accessor for KeyboardObserver(0);
    sub_20D619F34(&qword_2549BE9F8, type metadata accessor for KeyboardObserver, (uint64_t)&unk_20D63720C);
    sub_20D634CC8();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_20D634C2C();
    swift_release();
    swift_release();
    swift_release();
    v55 = v95;
    v56 = (uint64_t)v69;
    sub_20D62B8F8(v54, (uint64_t)v69);
    v57 = swift_allocObject();
    v58 = v73;
    sub_20D62B940(v56, v57 + v73);
    v60 = v85;
    v59 = v86;
    v61 = (uint64_t)v87;
    (*(void (**)(char *, char *, uint64_t))(v85 + 16))(v87, v52, v86);
    v62 = (uint64_t *)(v61 + *(int *)(v82 + 36));
    *v62 = v55;
    v62[1] = (uint64_t)sub_20D62BC18;
    v62[2] = v57;
    (*(void (**)(char *, uint64_t))(v60 + 8))(v52, v59);
    sub_20D62B8F8(v54, v56);
    v63 = swift_allocObject();
    sub_20D62B940(v56, v63 + v58);
    v64 = v93;
    sub_20D61E170(v61, v93, &qword_2549BE940);
    v65 = (uint64_t (**)())(v64 + *(int *)(v84 + 36));
    *v65 = sub_20D62BC58;
    v65[1] = (uint64_t (*)())v63;
    v65[2] = 0;
    v65[3] = 0;
    sub_20D61A7A8(v61, &qword_2549BE940);
    sub_20D62B8F8(v54, v56);
    v66 = swift_allocObject();
    sub_20D62B940(v56, v66 + v58);
    v67 = v90;
    sub_20D61E170(v64, v90, &qword_2549BE930);
    v68 = (_QWORD *)(v67 + *(int *)(v88 + 36));
    *v68 = 0;
    v68[1] = 0;
    v68[2] = sub_20D62BCA4;
    v68[3] = v66;
    sub_20D61A7A8(v64, &qword_2549BE930);
    return sub_20D61A08C(v67, v94, &qword_2549BE918);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_20D626ED8(__int128 *a1, double a2, double a3)
{
  __int128 v5;

  v5 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEA20);
  sub_20D635028();
  type metadata accessor for KeyboardObserver(0);
  sub_20D619F34(&qword_2549BE9F8, type metadata accessor for KeyboardObserver, (uint64_t)&unk_20D63720C);
  sub_20D634CC8();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20D634C2C();
  swift_release();
  swift_release();
  swift_release();
  sub_20D626FF8(a2, a3, *(double *)&v5);
}

void sub_20D626FF8(double a1, double a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
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
  char *v17;
  uint64_t v18;
  char *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  char v24;
  void (*v25)(char *, uint64_t);
  id v26;
  void *v27;
  uint64_t v28;

  v4 = v3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE848);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_20D634E30();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (char *)&v28 - v16;
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v28 - v18;
  v20 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v21 = objc_msgSend(v20, sel_userInterfaceIdiom);

  if (!v21)
  {
    type metadata accessor for AddressingView_iOS(0);
    sub_20D62A620((uint64_t)v9);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
    {
      sub_20D61A7A8((uint64_t)v9, &qword_2549BE848);
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v19, v9, v10);
      v22 = MEMORY[0x212BA5758](*(_QWORD *)(v4 + 56) + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_contactsSearchController);
      if (v22)
      {
        v23 = (void *)v22;
        (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v17, v19, v10);
        if (a3 + 80.0 <= a2)
        {
          v24 = 0;
          v25 = *(void (**)(char *, uint64_t))(v11 + 8);
        }
        else
        {
          (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v14, *MEMORY[0x24BDEFEE8], v10);
          v24 = sub_20D634E24();
          v25 = *(void (**)(char *, uint64_t))(v11 + 8);
          v25(v14, v10);
        }
        v25(v17, v10);
        v26 = objc_msgSend(v23, sel_footerView);
        if (v26)
        {
          v27 = v26;
          objc_msgSend(v26, sel_setHidden_, v24 & 1);

          v25(v19, v10);
        }
        else
        {
          v25(v19, v10);

        }
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v11 + 8))(v19, v10);
      }
    }
  }
}

void sub_20D627290(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  double v3;
  double v4;

  v2 = *a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEA20);
  sub_20D63501C();
  type metadata accessor for KeyboardObserver(0);
  sub_20D619F34(&qword_2549BE9F8, type metadata accessor for KeyboardObserver, (uint64_t)&unk_20D63720C);
  sub_20D634CC8();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20D634C2C();
  swift_release();
  swift_release();
  swift_release();
  sub_20D626FF8(v3, v4, *(double *)&v2);
}

uint64_t sub_20D6273A4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  uint64_t result;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD aBlock[6];

  v2 = sub_20D635100();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_20D635118();
  v21 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v10 = objc_msgSend(v9, sel_userInterfaceIdiom);

  if (!v10)
  {
    type metadata accessor for KeyboardObserver(0);
    sub_20D619F34(&qword_2549BE9F8, type metadata accessor for KeyboardObserver, (uint64_t)&unk_20D63720C);
    v11 = sub_20D634CC8();
    v12 = (void *)objc_opt_self();
    v13 = objc_msgSend(v12, sel_defaultCenter);
    objc_msgSend(v13, sel_addObserver_selector_name_object_, v11, sel_keyboardWillShow_, *MEMORY[0x24BEBE580], 0);

    v14 = objc_msgSend(v12, sel_defaultCenter);
    objc_msgSend(v14, sel_addObserver_selector_name_object_, v11, sel_keyboardWillHide_, *MEMORY[0x24BEBE578], 0);
    swift_release();

  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_20D634C2C();
  swift_release();
  swift_release();
  result = swift_release();
  if ((aBlock[0] & 1) == 0)
  {
    sub_20D61A578(0, (unint64_t *)&unk_2549BEA00);
    v16 = (void *)sub_20D6352BC();
    v17 = *(_QWORD *)(a1 + 56);
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = v17;
    *(_BYTE *)(v18 + 24) = 1;
    aBlock[4] = sub_20D62BCD4;
    aBlock[5] = v18;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_20D614CD4;
    aBlock[3] = &block_descriptor_0;
    v19 = _Block_copy(aBlock);
    swift_retain();
    swift_release();
    sub_20D63510C();
    aBlock[0] = MEMORY[0x24BEE4AF8];
    sub_20D619F34(&qword_2549BDDC8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549BEA10);
    sub_20D61A878(&qword_2549BDDD0, (uint64_t *)&unk_2549BEA10, MEMORY[0x24BEE12C8]);
    sub_20D6353A0();
    MEMORY[0x212BA4FA8](0, v8, v5, v19);
    _Block_release(v19);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v21 + 8))(v8, v6);
  }
  return result;
}

uint64_t sub_20D627748()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_20D634C38();
}

void sub_20D6277B8()
{
  id v0;
  id v1;
  uint64_t v2;
  void *v3;
  id v4;
  id v5;

  v0 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  v1 = objc_msgSend(v0, sel_userInterfaceIdiom);

  if (!v1)
  {
    type metadata accessor for KeyboardObserver(0);
    sub_20D619F34(&qword_2549BE9F8, type metadata accessor for KeyboardObserver, (uint64_t)&unk_20D63720C);
    v2 = sub_20D634CC8();
    v3 = (void *)objc_opt_self();
    v4 = objc_msgSend(v3, sel_defaultCenter);
    objc_msgSend(v4, sel_removeObserver_name_object_, v2, *MEMORY[0x24BEBE580], 0);

    v5 = objc_msgSend(v3, sel_defaultCenter);
    objc_msgSend(v5, sel_removeObserver_name_object_, v2, *MEMORY[0x24BEBE578], 0);
    swift_release();

  }
}

uint64_t sub_20D627918(uint64_t result)
{
  void (*v1)();

  v1 = *(void (**)())(*(_QWORD *)(result + 56)
                               + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_secondaryButtonDidClick);
  if (v1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_20D6187C4((uint64_t)v1);
    swift_retain();
    sub_20D634C2C();
    swift_release();
    swift_release();
    swift_release();
    v1();
    sub_20D618880((uint64_t)v1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_20D627C48(void *a1, void *a2)
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
  char *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  _QWORD aBlock[6];

  v4 = sub_20D635100();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_20D635118();
  v30 = *(_QWORD *)(v8 - 8);
  v31 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_20D635130();
  v11 = *(_QWORD *)(v29 - 8);
  v12 = MEMORY[0x24BDAC7A8](v29);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v25 - v15;
  v17 = objc_msgSend(a2, sel_contact);
  if (v17)
  {
    v32 = v17;
    v18 = objc_msgSend(a1, sel_navigationController);
    if (v18)
    {
      v19 = v18;
      swift_getKeyPath();
      swift_getKeyPath();
      v28 = v5;
      LOBYTE(aBlock[0]) = 0;
      swift_retain();
      sub_20D634C38();
      sub_20D61A578(0, (unint64_t *)&unk_2549BEA00);
      v26 = sub_20D6352BC();
      sub_20D635124();
      MEMORY[0x212BA4E1C](v14, 0.01);
      v27 = *(void (**)(char *, uint64_t))(v11 + 8);
      v20 = v29;
      v27(v14, v29);
      v21 = swift_allocObject();
      *(_QWORD *)(v21 + 16) = v32;
      *(_QWORD *)(v21 + 24) = v19;
      aBlock[4] = sub_20D62CA38;
      aBlock[5] = v21;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_20D614CD4;
      aBlock[3] = &block_descriptor_56;
      v22 = _Block_copy(aBlock);
      v25 = v19;
      v23 = v32;
      swift_release();
      sub_20D63510C();
      aBlock[0] = MEMORY[0x24BEE4AF8];
      sub_20D619F34(&qword_2549BDDC8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549BEA10);
      sub_20D61A878(&qword_2549BDDD0, (uint64_t *)&unk_2549BEA10, MEMORY[0x24BEE12C8]);
      sub_20D6353A0();
      v24 = (void *)v26;
      MEMORY[0x212BA4F90](v16, v10, v7, v22);
      _Block_release(v22);

      (*(void (**)(char *, uint64_t))(v28 + 8))(v7, v4);
      (*(void (**)(char *, uint64_t))(v30 + 8))(v10, v31);
      v27(v16, v20);
    }
    else
    {

    }
  }
}

void sub_20D627FC4(uint64_t a1, void *a2)
{
  id v3;

  v3 = objc_msgSend((id)objc_opt_self(), sel_viewControllerForContact_, a1);
  objc_msgSend(a2, sel_pushViewController_animated_, v3, 1);

}

uint64_t sub_20D628098(unint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  _QWORD *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  uint64_t v18;

  v3 = *(_QWORD *)(v1
                 + OBJC_IVAR____TtCV14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D24CNAutocompleteSearchView11Coordinator_viewModel);
  if (!(a1 >> 62))
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    v18 = v3;
    if (v4)
      goto LABEL_3;
LABEL_17:
    swift_bridgeObjectRelease();
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    return sub_20D634C38();
  }
  swift_bridgeObjectRetain();
  result = sub_20D635448();
  v4 = result;
  v18 = v3;
  if (!result)
    goto LABEL_17;
LABEL_3:
  if (v4 >= 1)
  {
    v6 = 0;
    v7 = (_QWORD *)MEMORY[0x24BEE4AF8];
    do
    {
      if ((a1 & 0xC000000000000001) != 0)
        v8 = (id)MEMORY[0x212BA50B0](v6, a1);
      else
        v8 = *(id *)(a1 + 8 * v6 + 32);
      v9 = v8;
      v10 = objc_msgSend(v8, sel_normalizedAddress, v18);
      if (v10)
      {
        v11 = v10;
        v12 = sub_20D635190();
        v14 = v13;

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v7 = sub_20D62BF28(0, v7[2] + 1, 1, v7);
        v16 = v7[2];
        v15 = v7[3];
        if (v16 >= v15 >> 1)
          v7 = sub_20D62BF28((_QWORD *)(v15 > 1), v16 + 1, 1, v7);
        v7[2] = v16 + 1;
        v17 = &v7[2 * v16];
        v17[4] = v12;
        v17[5] = v14;
      }
      else
      {

      }
      ++v6;
    }
    while (v4 != v6);
    goto LABEL_17;
  }
  __break(1u);
  return result;
}

id sub_20D6282A0()
{
  return sub_20D629BDC((uint64_t (*)(_QWORD))type metadata accessor for CNAutocompleteSearchView.Coordinator);
}

id sub_20D6282BC(uint64_t a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id result;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;

  v78 = a2;
  v79 = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEAB0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v71 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_20D6352EC();
  v71 = *(_QWORD *)(v9 - 8);
  v72 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v71 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_20D635328();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v71 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_20D635340();
  v76 = *(_QWORD *)(v16 - 8);
  v77 = v16;
  v17 = MEMORY[0x24BDAC7A8](v16);
  v19 = (char *)&v71 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v75 = (char *)&v71 - v20;
  v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE19140]), sel_initWithSearchType_, 1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEAB8);
  v73 = a1;
  sub_20D634E9C();
  v22 = v80;
  objc_msgSend(v21, sel_setDelegate_, v80);

  v74 = v21;
  result = objc_msgSend(v21, sel_view);
  if (result)
  {
    v24 = result;
    objc_msgSend(result, sel_setClipsToBounds_, 1);

    type metadata accessor for InsetLabel();
    v25 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
    v26 = (void *)objc_opt_self();
    v27 = v25;
    v28 = objc_msgSend(v26, sel_secondaryLabelColor);
    objc_msgSend(v27, sel_setTextColor_, v28);

    v29 = (void *)objc_opt_self();
    v30 = *MEMORY[0x24BEBE1F0];
    v31 = v27;
    v32 = objc_msgSend(v29, sel_preferredFontForTextStyle_, v30);
    objc_msgSend(v31, sel_setFont_, v32);

    objc_msgSend(v31, sel_setAdjustsFontForContentSizeCategory_, 1);
    objc_msgSend(v31, sel_setMaximumContentSizeCategory_, *MEMORY[0x24BEBE068]);
    objc_msgSend(v31, sel_setNumberOfLines_, 0);
    v33 = v74;
    CSSetCNAutocompleteSearchControllerHeaderView(v74, v31);

    v34 = v75;
    sub_20D635304();
    (*(void (**)(char *, _QWORD, uint64_t))(v13 + 104))(v15, *MEMORY[0x24BEBD180], v12);
    sub_20D6352E0();
    (*(void (**)(char *, _QWORD, uint64_t))(v71 + 104))(v11, *MEMORY[0x24BEBD068], v72);
    sub_20D6352F8();
    sub_20D634BD8();
    v35 = sub_20D634BCC();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 56))(v8, 0, 1, v35);
    sub_20D63531C();
    sub_20D61A578(0, &qword_2549BEAC0);
    (*(void (**)(char *, char *, uint64_t))(v76 + 16))(v19, v34, v77);
    sub_20D61A578(0, &qword_2549BEAC8);
    v36 = swift_allocObject();
    *(double *)(v36 + 16) = a4;
    *(_QWORD *)(v36 + 24) = v78;
    *(_QWORD *)(v36 + 32) = v79;
    swift_retain();
    sub_20D6352D4();
    v37 = (void *)sub_20D63534C();
    objc_msgSend(v37, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    v38 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
    objc_msgSend(v38, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    v39 = objc_msgSend(v26, sel_systemBackgroundColor);
    objc_msgSend(v38, sel_setBackgroundColor_, v39);

    objc_msgSend(v38, sel_setClipsToBounds_, 1);
    v40 = objc_msgSend(v38, sel_layer);
    objc_msgSend(v40, sel_setCornerRadius_, 10.0);

    v41 = objc_msgSend(v38, sel_layer);
    objc_msgSend(v41, sel_setCornerCurve_, *MEMORY[0x24BDE58E8]);

    v42 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
    objc_msgSend(v42, sel_addSubview_, v38);
    objc_msgSend(v42, sel_addSubview_, v37);
    objc_msgSend(v33, sel_setFooterView_, v42);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEAD0);
    v43 = swift_allocObject();
    *(_OWORD *)(v43 + 16) = xmmword_20D637040;
    v44 = objc_msgSend(v37, sel_topAnchor);
    v45 = objc_msgSend(v42, (SEL)&stru_24C74D6E0.type + 4);
    v46 = objc_msgSend(v44, sel_constraintEqualToAnchor_constant_, v45, a4);

    *(_QWORD *)(v43 + 32) = v46;
    v47 = objc_msgSend(v37, sel_leadingAnchor);
    v48 = objc_msgSend(v42, (SEL)&selRef_setNumberOfLines_ + 6);
    v49 = objc_msgSend(v47, sel_constraintEqualToAnchor_constant_, v48, a4);

    *(_QWORD *)(v43 + 40) = v49;
    v50 = objc_msgSend(v37, sel_bottomAnchor);
    v51 = objc_msgSend(v42, sel_bottomAnchor);
    v52 = objc_msgSend(v50, sel_constraintEqualToAnchor_constant_, v51, -a4);

    *(_QWORD *)(v43 + 48) = v52;
    v53 = objc_msgSend(v37, sel_trailingAnchor);
    v54 = objc_msgSend(v42, sel_trailingAnchor);
    v55 = objc_msgSend(v53, sel_constraintEqualToAnchor_constant_, v54, -a4);

    *(_QWORD *)(v43 + 56) = v55;
    v56 = objc_msgSend(v38, sel_topAnchor);
    v57 = objc_msgSend(v42, sel_topAnchor);
    v58 = objc_msgSend(v56, sel_constraintEqualToAnchor_constant_, v57, a4);

    *(_QWORD *)(v43 + 64) = v58;
    v59 = objc_msgSend(v38, sel_leadingAnchor);
    v60 = objc_msgSend(v42, sel_leadingAnchor);
    v61 = objc_msgSend(v59, sel_constraintEqualToAnchor_constant_, v60, a4);

    *(_QWORD *)(v43 + 72) = v61;
    v62 = objc_msgSend(v38, sel_bottomAnchor);
    v63 = objc_msgSend(v42, sel_bottomAnchor);
    v64 = objc_msgSend(v62, sel_constraintEqualToAnchor_constant_, v63, -a4);

    *(_QWORD *)(v43 + 80) = v64;
    v65 = objc_msgSend(v38, sel_trailingAnchor);
    v66 = objc_msgSend(v42, sel_trailingAnchor);
    v67 = objc_msgSend(v65, sel_constraintEqualToAnchor_constant_, v66, -a4);

    *(_QWORD *)(v43 + 88) = v67;
    v80 = (void *)v43;
    sub_20D6351D8();
    v68 = (void *)objc_opt_self();
    sub_20D61A578(0, &qword_2549BEAD8);
    v69 = (void *)sub_20D6351C0();
    swift_bridgeObjectRelease();
    objc_msgSend(v68, sel_activateConstraints_, v69);

    (*(void (**)(char *, uint64_t))(v76 + 8))(v75, v77);
    v70 = v74;
    swift_unknownObjectWeakAssign();
    sub_20D628E78(v70, a4);
    return v70;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20D628C44@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v6;

  v4 = sub_20D634AD0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20D62CF70();
  sub_20D634AB8();
  swift_release();
  if (v6)
  {
    sub_20D634ED8();
    swift_release();
  }
  return sub_20D634AC4();
}

uint64_t sub_20D628D3C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEAE8);
  return sub_20D635154() & 1;
}

uint64_t sub_20D628D94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v3)();
  uint64_t result;

  v3 = *(void (**)())(a3 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_primaryButtonDidClick);
  if (v3)
  {
    *(_BYTE *)(a3 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_primaryButtonWasClicked) = 1;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_20D6187C4((uint64_t)v3);
    sub_20D634C2C();
    swift_release();
    swift_release();
    v3();
    swift_bridgeObjectRelease();
    sub_20D618880((uint64_t)v3);
    return swift_release();
  }
  return result;
}

void sub_20D628E78(void *a1, double a2)
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
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  id v29;
  id v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  unsigned int (*v38)(char *, uint64_t, uint64_t);
  uint64_t v39;
  id v40;
  BOOL v41;
  id v42;
  id v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  id v55;
  void *v56;
  uint64_t v57;
  char *v58;
  id v59;
  id v60;
  int v61;
  int v62;
  uint64_t v63;
  unint64_t v64;
  CGRect v65;
  CGRect v66;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEA88);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v58 - v9;
  v11 = MEMORY[0x24BDAC7A8](v8);
  v13 = (char *)&v58 - v12;
  v14 = MEMORY[0x24BDAC7A8](v11);
  v16 = (char *)&v58 - v15;
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v58 - v17;
  v19 = CSCNAutocompleteSearchControllerHeaderView(a1);
  if (!v19)
    return;
  v60 = v19;
  objc_opt_self();
  v20 = swift_dynamicCastObjCClass();
  if (!v20)
    goto LABEL_14;
  v21 = (void *)v20;
  v58 = v13;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_20D634C2C();
  swift_release();
  swift_release();
  swift_release();
  v22 = v63;
  v23 = v64;
  swift_getKeyPath();
  v59 = a1;
  swift_getKeyPath();
  swift_retain();
  sub_20D634C2C();
  swift_release();
  swift_release();
  swift_release();
  sub_20D62CD18(v22, v23, v63, v64);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v24 = (void *)sub_20D635160();
  swift_bridgeObjectRelease();
  objc_msgSend(v21, sel_setText_, v24);

  objc_msgSend(v21, sel_sizeToFit);
  v25 = objc_msgSend(v59, sel_footerView);
  if (!v25)
  {
LABEL_14:

    return;
  }
  v26 = v25;
  sub_20D629608();
  v28 = v27;

  if (!(v28 >> 62))
  {
    v29 = v60;
    if (*(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_6;
LABEL_32:

    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v57 = sub_20D635448();
  swift_bridgeObjectRelease();
  v29 = v60;
  if (!v57)
    goto LABEL_32;
LABEL_6:
  if ((v28 & 0xC000000000000001) != 0)
  {
    v30 = (id)MEMORY[0x212BA50B0](0, v28);
  }
  else
  {
    if (!*(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_36;
    }
    v30 = *(id *)(v28 + 32);
  }
  v31 = v30;
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_20D634C2C();
  swift_release();
  swift_release();
  swift_release();
  v33 = v63;
  v32 = v64;
  swift_bridgeObjectRelease();
  v34 = HIBYTE(v32) & 0xF;
  if ((v32 & 0x2000000000000000) == 0)
    v34 = v33 & 0xFFFFFFFFFFFFLL;
  if (v34)
  {
    sub_20D635358();
    v35 = sub_20D635340();
    v36 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 48);
    if (v36(v10, 1, v35))
    {
      sub_20D61E170((uint64_t)v10, (uint64_t)v58, &qword_2549BEA88);
      sub_20D635364();
      sub_20D61A7A8((uint64_t)v10, &qword_2549BEA88);
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_20D634C2C();
      swift_release();
      swift_release();
      swift_release();
      sub_20D635334();
      sub_20D635364();
    }
    sub_20D635358();
    if (v36(v7, 1, v35))
    {
      sub_20D61E170((uint64_t)v7, (uint64_t)v58, &qword_2549BEA88);
      sub_20D635364();
      v39 = (uint64_t)v7;
LABEL_25:
      sub_20D61A7A8(v39, &qword_2549BEA88);
      goto LABEL_27;
    }
  }
  else
  {
    sub_20D635358();
    v37 = sub_20D635340();
    v38 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v37 - 8) + 48);
    if (v38(v18, 1, v37))
    {
      sub_20D61E170((uint64_t)v18, (uint64_t)v58, &qword_2549BEA88);
      sub_20D635364();
      sub_20D61A7A8((uint64_t)v18, &qword_2549BEA88);
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_20D634C2C();
      swift_release();
      swift_release();
      swift_release();
      sub_20D635334();
      sub_20D635364();
    }
    sub_20D635358();
    if (v38(v16, 1, v37))
    {
      sub_20D61E170((uint64_t)v16, (uint64_t)v58, &qword_2549BEA88);
      sub_20D635364();
      v39 = (uint64_t)v16;
      goto LABEL_25;
    }
  }
  sub_20D635310();
  sub_20D635364();
LABEL_27:
  swift_retain();
  v40 = v31;
  v41 = sub_20D62F0E4();
  swift_release();
  objc_msgSend(v40, sel_setEnabled_, !v41);

  v42 = v59;
  v43 = objc_msgSend(v59, sel_view);
  if (!v43)
  {
LABEL_36:
    __break(1u);
    return;
  }
  v44 = v43;
  objc_msgSend(v43, sel_frame);
  v46 = v45;
  v48 = v47;

  type metadata accessor for UILayoutPriority(0);
  v62 = 1144750080;
  v61 = 1065353216;
  sub_20D619F34(&qword_2549BEA90, (uint64_t (*)(uint64_t))type metadata accessor for UILayoutPriority, MEMORY[0x24BEBCC60]);
  sub_20D634BC0();
  LODWORD(v49) = v63;
  LODWORD(v50) = 1148846080;
  objc_msgSend(v40, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, v46, v48, v50, v49);
  v52 = v51;
  v54 = v53;
  v55 = objc_msgSend(v42, sel_footerView);
  if (v55)
  {
    v56 = v55;
    v65.origin.x = 0.0;
    v65.origin.y = 0.0;
    v65.size.width = v52;
    v65.size.height = v54;
    v66 = CGRectInset(v65, -a2, -a2);
    objc_msgSend(v56, sel_setFrame_, v66.origin.x, v66.origin.y, v66.size.width, v66.size.height);

  }
}

void sub_20D629608()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t i;
  id v5;
  void *v6;
  uint64_t v7;

  v7 = MEMORY[0x24BEE4AF8];
  v1 = objc_msgSend(v0, sel_subviews);
  sub_20D61A578(0, &qword_2549BEA98);
  v2 = sub_20D6351CC();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
LABEL_16:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v3 = sub_20D635448();
  swift_bridgeObjectRelease();
  if (!v3)
    goto LABEL_16;
LABEL_3:
  if (v3 >= 1)
  {
    for (i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x212BA50B0](i, v2);
      else
        v5 = *(id *)(v2 + 8 * i + 32);
      v6 = v5;
      objc_opt_self();
      if (swift_dynamicCastObjCClass())
      {
        MEMORY[0x212BA4E94]();
        if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_20D6351E4();
        sub_20D6351F0();
        sub_20D6351D8();
      }
      else
      {

      }
    }
    goto LABEL_16;
  }
  __break(1u);
}

id sub_20D6297B4(uint64_t a1)
{
  uint64_t v1;

  return sub_20D6282BC(a1, *(_QWORD *)(v1 + 8), *(_QWORD *)(v1 + 16), *(double *)v1);
}

void sub_20D6297C0(void *a1)
{
  double *v1;

  sub_20D628E78(a1, *v1);
}

id sub_20D6297D4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  objc_class *v4;
  char *v5;
  id result;
  objc_super v7;

  v3 = *(_QWORD *)(v1 + 16);
  v4 = (objc_class *)type metadata accessor for CNAutocompleteSearchView.Coordinator();
  v5 = (char *)objc_allocWithZone(v4);
  *(_QWORD *)&v5[OBJC_IVAR____TtCV14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D24CNAutocompleteSearchView11Coordinator_viewModel] = v3;
  v7.receiver = v5;
  v7.super_class = v4;
  swift_retain();
  result = objc_msgSendSuper2(&v7, sel_init);
  *a1 = result;
  return result;
}

uint64_t sub_20D629844()
{
  return sub_20D634E54();
}

uint64_t sub_20D62987C()
{
  sub_20D62CCC4();
  return sub_20D634E90();
}

uint64_t sub_20D6298CC()
{
  sub_20D62CCC4();
  return sub_20D634E60();
}

void sub_20D62991C()
{
  sub_20D62CCC4();
  sub_20D634E84();
  __break(1u);
}

id sub_20D629BD0()
{
  return sub_20D629BDC((uint64_t (*)(_QWORD))type metadata accessor for InsetLabel);
}

id sub_20D629BDC(uint64_t (*a1)(_QWORD))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1(0);
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

double sub_20D629C14()
{
  double v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20D634C2C();
  swift_release();
  swift_release();
  return v1;
}

void sub_20D629C84()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  __int128 v9;
  __int128 v10;

  v0 = sub_20D634A7C();
  if (v0)
  {
    v1 = sub_20D629DF0(v0);
    swift_bridgeObjectRelease();
    if (v1)
    {
      v2 = sub_20D635190();
      if (*(_QWORD *)(v1 + 16) && (v4 = sub_20D615AEC(v2, v3), (v5 & 1) != 0))
      {
        sub_20D62C2DC(*(_QWORD *)(v1 + 56) + 32 * v4, (uint64_t)&v9);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (*((_QWORD *)&v10 + 1))
        {
          sub_20D61A578(0, &qword_2549BEA38);
          if ((swift_dynamicCast() & 1) != 0)
          {
            objc_msgSend(v8, sel_CGRectValue);
            v7 = v6;
            swift_getKeyPath();
            swift_getKeyPath();
            *(_QWORD *)&v9 = v7;
            swift_retain();
            sub_20D634C38();

          }
          return;
        }
      }
      else
      {
        v9 = 0u;
        v10 = 0u;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      sub_20D61A7A8((uint64_t)&v9, &qword_2549BEA30);
    }
  }
}

unint64_t sub_20D629DF0(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t result;
  int64_t v7;
  _OWORD *v8;
  _OWORD *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  __int128 v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  int64_t v22;
  uint64_t v23;
  __int128 v24;
  _OWORD v25[2];
  _OWORD v26[2];
  __int128 v27;
  _OWORD v28[2];
  _OWORD v29[2];
  _OWORD v30[2];
  _OWORD v31[2];
  uint64_t v32;
  _OWORD v33[2];
  _OWORD v34[2];
  uint64_t v35;

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEA40);
    v2 = (_QWORD *)sub_20D63546C();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
  }
  v23 = a1 + 64;
  v3 = -1;
  v4 = -1 << *(_BYTE *)(a1 + 32);
  if (-v4 < 64)
    v3 = ~(-1 << -(char)v4);
  v5 = v3 & *(_QWORD *)(a1 + 64);
  v22 = (unint64_t)(63 - v4) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  while (1)
  {
    if (v5)
    {
      v10 = (v5 - 1) & v5;
      v11 = __clz(__rbit64(v5)) | (v7 << 6);
      v12 = v7;
    }
    else
    {
      v13 = v7 + 1;
      if (__OFADD__(v7, 1))
        goto LABEL_37;
      if (v13 >= v22)
      {
LABEL_33:
        sub_20D61A6A4();
        return (unint64_t)v2;
      }
      v14 = *(_QWORD *)(v23 + 8 * v13);
      v12 = v7 + 1;
      if (!v14)
      {
        v12 = v7 + 2;
        if (v7 + 2 >= v22)
          goto LABEL_33;
        v14 = *(_QWORD *)(v23 + 8 * v12);
        if (!v14)
        {
          v12 = v7 + 3;
          if (v7 + 3 >= v22)
            goto LABEL_33;
          v14 = *(_QWORD *)(v23 + 8 * v12);
          if (!v14)
          {
            v12 = v7 + 4;
            if (v7 + 4 >= v22)
              goto LABEL_33;
            v14 = *(_QWORD *)(v23 + 8 * v12);
            if (!v14)
            {
              v15 = v7 + 5;
              if (v7 + 5 >= v22)
                goto LABEL_33;
              v14 = *(_QWORD *)(v23 + 8 * v15);
              if (!v14)
              {
                while (1)
                {
                  v12 = v15 + 1;
                  if (__OFADD__(v15, 1))
                    goto LABEL_38;
                  if (v12 >= v22)
                    goto LABEL_33;
                  v14 = *(_QWORD *)(v23 + 8 * v12);
                  ++v15;
                  if (v14)
                    goto LABEL_26;
                }
              }
              v12 = v7 + 5;
            }
          }
        }
      }
LABEL_26:
      v10 = (v14 - 1) & v14;
      v11 = __clz(__rbit64(v14)) + (v12 << 6);
    }
    sub_20D62C6D0(*(_QWORD *)(a1 + 48) + 40 * v11, (uint64_t)v33);
    sub_20D62C2DC(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)v34 + 8);
    v31[0] = v34[0];
    v31[1] = v34[1];
    v32 = v35;
    v30[0] = v33[0];
    v30[1] = v33[1];
    sub_20D62C6D0((uint64_t)v30, (uint64_t)v25);
    if (!swift_dynamicCast())
    {
      sub_20D61A7A8((uint64_t)v30, &qword_2549BEA48);
      swift_bridgeObjectRelease();
      sub_20D61A6A4();
      swift_release();
      return 0;
    }
    sub_20D62C2DC((uint64_t)v31 + 8, (uint64_t)v25);
    sub_20D61A7A8((uint64_t)v30, &qword_2549BEA48);
    sub_20D62C70C(v25, v26);
    v27 = v24;
    sub_20D62C70C(v26, v28);
    v16 = v27;
    sub_20D62C70C(v28, v29);
    sub_20D62C70C(v29, &v27);
    result = sub_20D615AEC(v16, *((uint64_t *)&v16 + 1));
    v17 = result;
    if ((v18 & 1) != 0)
    {
      v8 = (_OWORD *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v8 = v16;
      v9 = (_OWORD *)(v2[7] + 32 * v17);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
      result = (unint64_t)sub_20D62C70C(&v27, v9);
      goto LABEL_8;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_OWORD *)(v2[6] + 16 * result) = v16;
    result = (unint64_t)sub_20D62C70C(&v27, (_OWORD *)(v2[7] + 32 * result));
    v19 = v2[2];
    v20 = __OFADD__(v19, 1);
    v21 = v19 + 1;
    if (v20)
      goto LABEL_36;
    v2[2] = v21;
LABEL_8:
    v7 = v12;
    v5 = v10;
  }
  __break(1u);
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

uint64_t sub_20D62A32C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D16KeyboardObserver__height;
  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549BEA50);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_20D62A380@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for KeyboardObserver(0);
  result = sub_20D634BF0();
  *a1 = result;
  return result;
}

uint64_t sub_20D62A3BC(double *a1, uint64_t (*a2)(double, double))
{
  return a2(*a1, a1[1]);
}

uint64_t sub_20D62A3E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  os_log_type_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];
  uint64_t v20;

  v2 = v1;
  v4 = sub_20D634DD0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE70);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D61E170(v2, (uint64_t)v10, &qword_2549BDE70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = sub_20D634CB0();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, v10, v11);
  }
  else
  {
    v13 = sub_20D635298();
    v14 = sub_20D634EA8();
    v15 = v13;
    if (os_log_type_enabled(v14, v13))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      v17 = swift_slowAlloc();
      v19[1] = a1;
      v18 = v17;
      v20 = v17;
      *(_DWORD *)v16 = 136315138;
      v19[2] = sub_20D62C034(0x686353726F6C6F43, 0xEB00000000656D65, &v20);
      sub_20D63537C();
      _os_log_impl(&dword_20D60A000, v14, v15, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v16, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BA56C8](v18, -1, -1);
      MEMORY[0x212BA56C8](v16, -1, -1);
    }

    sub_20D634DC4();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_20D62A620@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  os_log_type_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[3];
  uint64_t v19;

  v2 = v1;
  v4 = sub_20D634DD0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE668);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D61E170(v2, (uint64_t)v10, &qword_2549BE668);
  if (swift_getEnumCaseMultiPayload() == 1)
    return sub_20D61A08C((uint64_t)v10, a1, &qword_2549BE848);
  v12 = sub_20D635298();
  v13 = sub_20D634EA8();
  v14 = v12;
  if (os_log_type_enabled(v13, v12))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v18[1] = a1;
    v17 = v16;
    v19 = v16;
    *(_DWORD *)v15 = 136315138;
    v18[2] = sub_20D62C034(0xD000000000000020, 0x800000020D638460, &v19);
    sub_20D63537C();
    _os_log_impl(&dword_20D60A000, v13, v14, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BA56C8](v17, -1, -1);
    MEMORY[0x212BA56C8](v15, -1, -1);
  }

  sub_20D634DC4();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_20D62A850()
{
  return sub_20D634D94();
}

uint64_t sub_20D62A870(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE848);
  MEMORY[0x24BDAC7A8](v2);
  sub_20D61E170(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_2549BE848);
  return sub_20D634DA0();
}

uint64_t type metadata accessor for AddressingView_iOS(uint64_t a1)
{
  return sub_20D61BC98(a1, (uint64_t *)&unk_2549BE8B0);
}

uint64_t sub_20D62A908()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for AddressingView()
{
  return sub_20D61BB3C();
}

uint64_t _s14CloudSharingUI14AddressingViewVwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_20D61BEDC();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for AddressingView(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_20D61BEDC();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_20D61BB3C();
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for AddressingView(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_20D61BB3C();
  return a1;
}

uint64_t getEnumTagSinglePayload for AddressingView(uint64_t a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for AddressingView(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for AddressingView()
{
  return &type metadata for AddressingView;
}

uint64_t type metadata accessor for CNAutocompleteSearchView.Coordinator()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for InsetLabel()
{
  return objc_opt_self();
}

uint64_t sub_20D62AAFC()
{
  return type metadata accessor for KeyboardObserver(0);
}

uint64_t type metadata accessor for KeyboardObserver(uint64_t a1)
{
  return sub_20D61BC98(a1, (uint64_t *)&unk_2549BE760);
}

void sub_20D62AB18()
{
  unint64_t v0;

  sub_20D62AB84();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_20D62AB84()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2549BE770)
  {
    v0 = sub_20D634C44();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2549BE770);
  }
}

uint64_t sub_20D62ABD8()
{
  return sub_20D619F34(&qword_2549BE840, type metadata accessor for AddressingView_iOS, (uint64_t)&unk_20D6371BC);
}

uint64_t sub_20D62AC04(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *(_QWORD *)v4 = *a2;
    v4 = v17 + ((v5 + 16) & ~(unint64_t)v5);
    swift_retain();
  }
  else
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    v7 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    v8 = a2[4];
    v9 = *((_BYTE *)a2 + 40);
    swift_retain();
    sub_20D61BEDC();
    *(_QWORD *)(v4 + 24) = v7;
    *(_QWORD *)(v4 + 32) = v8;
    *(_BYTE *)(v4 + 40) = v9;
    v10 = a2[7];
    *(_QWORD *)(v4 + 48) = a2[6];
    *(_QWORD *)(v4 + 56) = v10;
    v11 = *(int *)(a3 + 28);
    v12 = (_QWORD *)(v4 + v11);
    v13 = (uint64_t *)((char *)a2 + v11);
    swift_retain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE668);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v14 = sub_20D634E30();
      v15 = *(_QWORD *)(v14 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
      {
        v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE848);
        memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v15 + 16))(v12, v13, v14);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      }
    }
    else
    {
      *v12 = *v13;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v4;
}

uint64_t sub_20D62AD7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  swift_release();
  sub_20D61BB3C();
  swift_release();
  v4 = a1 + *(int *)(a2 + 28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE668);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v5 = sub_20D634E30();
  v6 = *(_QWORD *)(v5 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  return result;
}

uint64_t sub_20D62AE40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  swift_retain();
  sub_20D61BEDC();
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  v9 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v9;
  v10 = *(int *)(a3 + 28);
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE668);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v13 = sub_20D634E30();
    v14 = *(_QWORD *)(v13 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    {
      v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE848);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v14 + 16))(v11, v12, v13);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
    }
  }
  else
  {
    *v11 = *v12;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_20D62AF8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  swift_release();
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(_QWORD *)(a2 + 32);
  v8 = *(_BYTE *)(a2 + 40);
  sub_20D61BEDC();
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = v7;
  *(_BYTE *)(a1 + 40) = v8;
  sub_20D61BB3C();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    v9 = *(int *)(a3 + 28);
    v10 = (_QWORD *)(a1 + v9);
    v11 = (_QWORD *)(a2 + v9);
    sub_20D61A7A8(a1 + v9, &qword_2549BE668);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE668);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_20D634E30();
      v13 = *(_QWORD *)(v12 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
      {
        v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE848);
        memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v13 + 16))(v10, v11, v12);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      }
    }
    else
    {
      *v10 = *v11;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_20D62B124(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  void *v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  v4 = *(int *)(a3 + 28);
  v5 = (void *)(a1 + v4);
  v6 = (const void *)(a2 + v4);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE668);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v8 = sub_20D634E30();
    v9 = *(_QWORD *)(v8 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8))
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE848);
      memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v9 + 32))(v5, v6, v8);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v5, 0, 1, v8);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
  }
  return a1;
}

uint64_t sub_20D62B24C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  v6 = *(_BYTE *)(a2 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 40) = v6;
  sub_20D61BB3C();
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_release();
  if (a1 != a2)
  {
    v8 = *(int *)(a3 + 28);
    v9 = (void *)(a1 + v8);
    v10 = (const void *)(a2 + v8);
    sub_20D61A7A8(a1 + v8, &qword_2549BE668);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE668);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_20D634E30();
      v13 = *(_QWORD *)(v12 - 8);
      if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12))
      {
        v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE848);
        memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(v13 + 32))(v9, v10, v12);
        (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v9, 0, 1, v12);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_20D62B3B0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D62B3BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 56);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE850);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 28), a2, v8);
  }
}

uint64_t sub_20D62B43C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20D62B448(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 56) = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE850);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 28), a2, a2, v7);
  }
  return result;
}

void sub_20D62B4C0()
{
  unint64_t v0;

  sub_20D62B548();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_20D62B548()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2549BE8C0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE848);
    v0 = sub_20D634CBC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2549BE8C0);
  }
}

uint64_t sub_20D62B5A0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D62B5B0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_20D62651C(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_20D62B5B8()
{
  return sub_20D62B5DC(&qword_2549BE928, &qword_2549BE930, (uint64_t (*)(void))sub_20D62B644, MEMORY[0x24BDF0910]);
}

uint64_t sub_20D62B5DC(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4;
    result = MEMORY[0x212BA5644](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_20D62B644()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[4];

  result = qword_2549BE938;
  if (!qword_2549BE938)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE940);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE948);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE950);
    sub_20D62B5DC(&qword_2549BE958, &qword_2549BE950, (uint64_t (*)(void))sub_20D62B740, MEMORY[0x24BDF1050]);
    v3[2] = v2;
    v3[3] = swift_getOpaqueTypeConformance2();
    v3[0] = swift_getOpaqueTypeConformance2();
    v3[1] = sub_20D61A878(&qword_2549BE9B8, &qword_2549BE9C0, MEMORY[0x24BDEF860]);
    result = MEMORY[0x212BA5644](MEMORY[0x24BDED308], v1, v3);
    atomic_store(result, (unint64_t *)&qword_2549BE938);
  }
  return result;
}

unint64_t sub_20D62B740()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_2549BE960;
  if (!qword_2549BE960)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE968);
    v2[0] = sub_20D62B7C4();
    v2[1] = sub_20D61A878(&qword_2549BE380, &qword_2549BE9B0, MEMORY[0x24BDF09B0]);
    result = MEMORY[0x212BA5644](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549BE960);
  }
  return result;
}

unint64_t sub_20D62B7C4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[6];

  result = qword_2549BE970;
  if (!qword_2549BE970)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE978);
    v2[2] = &type metadata for CNAutocompleteSearchView;
    v2[3] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE980);
    v2[4] = sub_20D62B8A4();
    v2[5] = sub_20D61A878((unint64_t *)&unk_2549BE990, &qword_2549BE980, MEMORY[0x24BEE30C8]);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_20D61A878(&qword_2549BE378, (uint64_t *)&unk_2549BE9A0, MEMORY[0x24BDEF370]);
    result = MEMORY[0x212BA5644](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_2549BE970);
  }
  return result;
}

unint64_t sub_20D62B8A4()
{
  unint64_t result;

  result = qword_2549BE988;
  if (!qword_2549BE988)
  {
    result = MEMORY[0x212BA5644](&unk_20D637428, &type metadata for CNAutocompleteSearchView);
    atomic_store(result, (unint64_t *)&qword_2549BE988);
  }
  return result;
}

uint64_t sub_20D62B8F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AddressingView_iOS(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20D62B940(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AddressingView_iOS(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20D62B984()
{
  return sub_20D62BC64(sub_20D627918);
}

uint64_t objectdestroyTm_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for AddressingView_iOS(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  swift_release();
  sub_20D61BB3C();
  swift_release();
  v3 = v0 + ((v2 + 16) & ~v2) + *(int *)(v1 + 28);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BE668);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_20D634E30();
    v5 = *(_QWORD *)(v4 - 8);
    if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4))
      (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

void sub_20D62BA84(double a1, double a2)
{
  uint64_t v2;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AddressingView_iOS(0) - 8) + 80);
  sub_20D626ED8((__int128 *)(v2 + ((v5 + 16) & ~v5)), a1, a2);
}

uint64_t sub_20D62BAC8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D62BAEC(double *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(double, double))(v1 + 16))(*a1, a1[1]);
}

double sub_20D62BB18@<D0>(double *a1@<X8>)
{
  double result;
  double v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20D634C2C();
  swift_release();
  swift_release();
  result = v3;
  *a1 = v3;
  return result;
}

uint64_t sub_20D62BB98()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_20D634C38();
}

void sub_20D62BC18(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AddressingView_iOS(0) - 8) + 80);
  sub_20D627290(a1, (__int128 *)(v1 + ((v3 + 16) & ~v3)));
}

uint64_t sub_20D62BC58()
{
  return sub_20D62BC64(sub_20D6273A4);
}

uint64_t sub_20D62BC64(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AddressingView_iOS(0) - 8) + 80);
  return a1(v1 + ((v2 + 16) & ~v2));
}

uint64_t sub_20D62BCA4()
{
  return sub_20D62BC64((uint64_t (*)(uint64_t))sub_20D6277B8);
}

uint64_t sub_20D62BCB0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D62BCD4()
{
  return sub_20D627748();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

_QWORD *sub_20D62BCF8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDDE8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 56);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[7 * v8 + 4])
          memmove(v12, a4 + 4, 56 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_20D62C738(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_20D62BE1C(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549BEA70);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 + 31;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 6);
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
        if (v10 != a4 || v13 >= &a4[8 * v8 + 4])
          memmove(v13, a4 + 4, v8 << 6);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_20D62C82C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_20D62BF28(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDDE0);
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
    sub_20D62C91C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_20D62C034(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_20D62C104(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_20D62C2DC((uint64_t)v12, *a3);
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
      sub_20D62C2DC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_20D62C104(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_20D635388();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_20D62C318(a5, a6);
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
  v8 = sub_20D6353E8();
  if (!v8)
  {
    sub_20D635430();
    __break(1u);
LABEL_17:
    result = sub_20D635478();
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

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_20D62C2DC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_20D62C318(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_20D62C3AC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_20D62C584(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_20D62C584(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_20D62C3AC(uint64_t a1, unint64_t a2)
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
      v3 = sub_20D62C520(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_20D6353C4();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_20D635430();
      __break(1u);
LABEL_10:
      v2 = sub_20D6351A8();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_20D635478();
    __break(1u);
LABEL_14:
    result = sub_20D635430();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_20D62C520(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEA28);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_20D62C584(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEA28);
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
  result = sub_20D635478();
  __break(1u);
  return result;
}

uint64_t sub_20D62C6D0(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

_OWORD *sub_20D62C70C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

double UIEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

uint64_t sub_20D62C738(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 56 * a1 + 32;
    v6 = a3 + 56 * v4;
    if (v5 >= v6 || v5 + 56 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_20D635478();
  __break(1u);
  return result;
}

uint64_t sub_20D62C82C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + (a1 << 6) + 32;
    v6 = a3 + (v4 << 6);
    if (v5 >= v6 || v5 + (v4 << 6) <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_20D635478();
  __break(1u);
  return result;
}

uint64_t sub_20D62C91C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_20D635478();
  __break(1u);
  return result;
}

uint64_t sub_20D62CA0C()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_20D62CA38()
{
  uint64_t v0;

  sub_20D627FC4(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t initializeBufferWithCopyOfBuffer for CNAutocompleteSearchView(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_retain();
  return a1;
}

uint64_t destroy for CNAutocompleteSearchView()
{
  return swift_release();
}

_QWORD *assignWithCopy for CNAutocompleteSearchView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  swift_retain();
  swift_release();
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

_QWORD *assignWithTake for CNAutocompleteSearchView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  *a1 = *a2;
  v3 = a2[2];
  a1[1] = a2[1];
  a1[2] = v3;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CNAutocompleteSearchView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CNAutocompleteSearchView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CNAutocompleteSearchView()
{
  return &type metadata for CNAutocompleteSearchView;
}

uint64_t sub_20D62CBA8()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE910);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE900);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE908);
  sub_20D61A878(&qword_2549BE9C8, &qword_2549BE908, MEMORY[0x24BDEC988]);
  sub_20D61DFDC();
  swift_getOpaqueTypeConformance2();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BE1B8);
  sub_20D61A878(&qword_2549BE1B0, &qword_2549BE1B8, MEMORY[0x24BDF43B0]);
  swift_getOpaqueTypeConformance2();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_20D62CCB8()
{
  return MEMORY[0x24BDF5560];
}

unint64_t sub_20D62CCC4()
{
  unint64_t result;

  result = qword_2549BEA80;
  if (!qword_2549BEA80)
  {
    result = MEMORY[0x212BA5644](&unk_20D6373B0, &type metadata for CNAutocompleteSearchView);
    atomic_store(result, (unint64_t *)&qword_2549BEA80);
  }
  return result;
}

void sub_20D62CD18(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v6 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v6 = a3 & 0xFFFFFFFFFFFFLL;
  if (v6)
  {
    v9 = (void *)sub_20D635160();
    v10 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v9);

    if (v10)
    {
      sub_20D634AA0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEAA0);
      v11 = swift_allocObject();
      *(_OWORD *)(v11 + 16) = xmmword_20D635FF0;
      v12 = MEMORY[0x24BEE0D00];
      *(_QWORD *)(v11 + 56) = MEMORY[0x24BEE0D00];
      v13 = sub_20D62CEE0();
      *(_QWORD *)(v11 + 32) = a1;
      *(_QWORD *)(v11 + 40) = a2;
      *(_QWORD *)(v11 + 96) = v12;
      *(_QWORD *)(v11 + 104) = v13;
      *(_QWORD *)(v11 + 64) = v13;
      *(_QWORD *)(v11 + 72) = a3;
      *(_QWORD *)(v11 + 80) = a4;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_20D63516C();

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    swift_bridgeObjectRetain();
  }
}

unint64_t sub_20D62CEE0()
{
  unint64_t result;

  result = qword_2549BEAA8;
  if (!qword_2549BEAA8)
  {
    result = MEMORY[0x212BA5644](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2549BEAA8);
  }
  return result;
}

uint64_t sub_20D62CF24()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20D62CF48(uint64_t a1)
{
  uint64_t v1;

  return sub_20D628D94(a1, *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

void sub_20D62CF54()
{
  sub_20D634A94();
  __break(1u);
}

unint64_t sub_20D62CF70()
{
  unint64_t result;

  result = qword_2549BEAE0;
  if (!qword_2549BEAE0)
  {
    result = MEMORY[0x212BA5644](MEMORY[0x24BDEACD0], MEMORY[0x24BDEACE0]);
    atomic_store(result, (unint64_t *)&qword_2549BEAE0);
  }
  return result;
}

void sub_20D62CFB4()
{
  sub_20D62CF70();
  sub_20D634ADC();
  __break(1u);
}

uint64_t sub_20D62CFD8()
{
  return 8;
}

uint64_t sub_20D62CFE4()
{
  return swift_release();
}

uint64_t sub_20D62CFEC(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_20D62CFFC()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEAE8);
  return sub_20D635148();
}

_QWORD *sub_20D62D040(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

ValueMetadata *type metadata accessor for SizePreferenceKey()
{
  return &type metadata for SizePreferenceKey;
}

uint64_t sub_20D62D068@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = sub_20D634FD4();
  result = sub_20D634CF8();
  *a1 = v2;
  a1[1] = v4;
  a1[2] = v5;
  return result;
}

void sub_20D62D0A4()
{
  xmmword_2549BEB50 = 0uLL;
}

double sub_20D62D0B4@<D0>(_OWORD *a1@<X8>)
{
  double result;

  if (qword_2549BD900 != -1)
    swift_once();
  result = *(double *)&xmmword_2549BEB50;
  *a1 = xmmword_2549BEB50;
  return result;
}

uint64_t sub_20D62D110@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20D634C2C();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_20D62D18C(void **a1)
{
  void *v1;
  id v2;

  v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  v2 = v1;
  swift_retain();
  return sub_20D634C38();
}

uint64_t sub_20D62D200()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20D634C2C();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_20D62D278()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_20D634C38();
}

uint64_t (*sub_20D62D2E4(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_20D634C20();
  return sub_20D62D35C;
}

uint64_t sub_20D62D360()
{
  return sub_20D62EDAC((uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__headerImage, &qword_2549BEB68);
}

uint64_t sub_20D62D374(uint64_t a1)
{
  return sub_20D62EE2C(a1, &qword_2549BEB70, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__headerImage, &qword_2549BEB68);
}

uint64_t (*sub_20D62D390(_QWORD *a1))()
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEB70);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__headerImage;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEB68);
  sub_20D634C08();
  swift_endAccess();
  return sub_20D62D458;
}

uint64_t sub_20D62D45C@<X0>(_QWORD *a1@<X8>)
{
  return sub_20D62E2B4(a1);
}

uint64_t sub_20D62D470()
{
  return sub_20D62E340();
}

uint64_t sub_20D62D484()
{
  return sub_20D62E3D0();
}

uint64_t sub_20D62D4A0()
{
  return sub_20D62E454();
}

uint64_t (*sub_20D62D4B4(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_20D634C20();
  return sub_20D62D35C;
}

uint64_t sub_20D62D52C()
{
  return sub_20D62EDAC((uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__headerTitle, &qword_2549BEB80);
}

uint64_t sub_20D62D540(uint64_t a1)
{
  return sub_20D62EE2C(a1, &qword_2549BEB88, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__headerTitle, &qword_2549BEB80);
}

uint64_t (*sub_20D62D55C(_QWORD *a1))()
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEB88);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__headerTitle;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEB80);
  sub_20D634C08();
  swift_endAccess();
  return sub_20D62D458;
}

double sub_20D62D624@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  uint64_t v4;
  uint64_t v5;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20D634C2C();
  swift_release();
  swift_release();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_20D62D6A8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_20D634C38();
}

uint64_t sub_20D62D740()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20D634C2C();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_20D62D7BC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_20D634C38();
}

uint64_t (*sub_20D62D848(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_20D634C20();
  return sub_20D62D35C;
}

uint64_t sub_20D62D8C0()
{
  return sub_20D62EDAC((uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__yourNameAndEmail, &qword_2549BEB98);
}

uint64_t sub_20D62D8D4(uint64_t a1)
{
  return sub_20D62EE2C(a1, &qword_2549BEBA0, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__yourNameAndEmail, &qword_2549BEB98);
}

uint64_t (*sub_20D62D8F0(_QWORD *a1))()
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEBA0);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__yourNameAndEmail;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEB98);
  sub_20D634C08();
  swift_endAccess();
  return sub_20D62D458;
}

uint64_t sub_20D62D9B8@<X0>(_QWORD *a1@<X8>)
{
  return sub_20D62E2B4(a1);
}

uint64_t sub_20D62D9CC()
{
  return sub_20D62E340();
}

uint64_t sub_20D62D9E0()
{
  return sub_20D62E3D0();
}

uint64_t sub_20D62D9FC()
{
  return sub_20D62E454();
}

uint64_t (*sub_20D62DA10(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_20D634C20();
  return sub_20D62D35C;
}

uint64_t sub_20D62DA88()
{
  return sub_20D62EDAC((uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__inputText, &qword_2549BEB80);
}

uint64_t sub_20D62DA9C(uint64_t a1)
{
  return sub_20D62EE2C(a1, &qword_2549BEB88, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__inputText, &qword_2549BEB80);
}

uint64_t (*sub_20D62DAB8(_QWORD *a1))()
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEB88);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__inputText;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEB80);
  sub_20D634C08();
  swift_endAccess();
  return sub_20D62D458;
}

uint64_t sub_20D62DB80@<X0>(_QWORD *a1@<X8>)
{
  return sub_20D62E2B4(a1);
}

uint64_t sub_20D62DB94()
{
  return sub_20D62E340();
}

uint64_t sub_20D62DBA8()
{
  return sub_20D62E3D0();
}

uint64_t sub_20D62DBC4()
{
  return sub_20D62E454();
}

uint64_t (*sub_20D62DBD8(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_20D634C20();
  return sub_20D62D35C;
}

uint64_t sub_20D62DC50()
{
  return sub_20D62EDAC((uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__loadingText, &qword_2549BEB80);
}

uint64_t sub_20D62DC64(uint64_t a1)
{
  return sub_20D62EE2C(a1, &qword_2549BEB88, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__loadingText, &qword_2549BEB80);
}

uint64_t (*sub_20D62DC80(_QWORD *a1))()
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEB88);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__loadingText;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEB80);
  sub_20D634C08();
  swift_endAccess();
  return sub_20D62D458;
}

uint64_t sub_20D62DD48@<X0>(_QWORD *a1@<X8>)
{
  return sub_20D62E2B4(a1);
}

uint64_t sub_20D62DD5C()
{
  return sub_20D62E340();
}

uint64_t sub_20D62DD70()
{
  return sub_20D62E3D0();
}

uint64_t sub_20D62DD8C()
{
  return sub_20D62E454();
}

uint64_t (*sub_20D62DDA0(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_20D634C20();
  return sub_20D62D35C;
}

uint64_t sub_20D62DE18()
{
  return sub_20D62EDAC((uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__supplementaryText, &qword_2549BEB80);
}

uint64_t sub_20D62DE2C(uint64_t a1)
{
  return sub_20D62EE2C(a1, &qword_2549BEB88, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__supplementaryText, &qword_2549BEB80);
}

uint64_t (*sub_20D62DE48(_QWORD *a1))()
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEB88);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__supplementaryText;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEB80);
  sub_20D634C08();
  swift_endAccess();
  return sub_20D62D458;
}

uint64_t sub_20D62DF10@<X0>(_QWORD *a1@<X8>)
{
  return sub_20D62E2B4(a1);
}

uint64_t sub_20D62DF24()
{
  return sub_20D62E340();
}

uint64_t sub_20D62DF38()
{
  return sub_20D62E3D0();
}

uint64_t sub_20D62DF54()
{
  return sub_20D62E454();
}

uint64_t (*sub_20D62DF68(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_20D634C20();
  return sub_20D62D35C;
}

uint64_t sub_20D62DFE0()
{
  return sub_20D62EDAC((uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__userInfoText, &qword_2549BEB80);
}

uint64_t sub_20D62DFF4(uint64_t a1)
{
  return sub_20D62EE2C(a1, &qword_2549BEB88, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__userInfoText, &qword_2549BEB80);
}

uint64_t (*sub_20D62E010(_QWORD *a1))()
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEB88);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__userInfoText;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEB80);
  sub_20D634C08();
  swift_endAccess();
  return sub_20D62D458;
}

uint64_t sub_20D62E0D8@<X0>(_QWORD *a1@<X8>)
{
  return sub_20D62E2B4(a1);
}

uint64_t sub_20D62E0EC()
{
  return sub_20D62E340();
}

uint64_t sub_20D62E100()
{
  return sub_20D62E3D0();
}

uint64_t sub_20D62E11C()
{
  return sub_20D62E454();
}

uint64_t (*sub_20D62E130(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_20D634C20();
  return sub_20D62D35C;
}

uint64_t sub_20D62E1A8()
{
  return sub_20D62EDAC((uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__primaryButtonText, &qword_2549BEB80);
}

uint64_t sub_20D62E1BC(uint64_t a1)
{
  return sub_20D62EE2C(a1, &qword_2549BEB88, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__primaryButtonText, &qword_2549BEB80);
}

uint64_t (*sub_20D62E1D8(_QWORD *a1))()
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEB88);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__primaryButtonText;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEB80);
  sub_20D634C08();
  swift_endAccess();
  return sub_20D62D458;
}

uint64_t sub_20D62E2A0@<X0>(_QWORD *a1@<X8>)
{
  return sub_20D62E2B4(a1);
}

uint64_t sub_20D62E2B4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20D634C2C();
  swift_release();
  result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_20D62E32C()
{
  return sub_20D62E340();
}

uint64_t sub_20D62E340()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_20D634C38();
}

uint64_t sub_20D62E3BC()
{
  return sub_20D62E3D0();
}

uint64_t sub_20D62E3D0()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20D634C2C();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_20D62E440()
{
  return sub_20D62E454();
}

uint64_t sub_20D62E454()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_20D634C38();
}

uint64_t (*sub_20D62E4C8(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_20D634C20();
  return sub_20D62D35C;
}

uint64_t sub_20D62E540()
{
  return sub_20D62EDAC((uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__secondaryButtonText, &qword_2549BEB80);
}

uint64_t sub_20D62E554(uint64_t a1)
{
  return sub_20D62EE2C(a1, &qword_2549BEB88, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__secondaryButtonText, &qword_2549BEB80);
}

uint64_t (*sub_20D62E570(_QWORD *a1))()
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEB88);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__secondaryButtonText;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEB80);
  sub_20D634C08();
  swift_endAccess();
  return sub_20D62D458;
}

uint64_t sub_20D62E638@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20D634C2C();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_20D62E6B4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_20D634C38();
}

uint64_t sub_20D62E724()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20D634C2C();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_20D62E79C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_20D634C38();
}

uint64_t (*sub_20D62E808(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_20D634C20();
  return sub_20D62D35C;
}

uint64_t sub_20D62E880()
{
  return sub_20D62EDAC((uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__hideInnerNavigationBar, &qword_2549BEBE0);
}

uint64_t sub_20D62E894(uint64_t a1)
{
  return sub_20D62EE2C(a1, &qword_2549BEBE8, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__hideInnerNavigationBar, &qword_2549BEBE0);
}

uint64_t (*sub_20D62E8B0(_QWORD *a1))()
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEBE8);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__hideInnerNavigationBar;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEBE0);
  sub_20D634C08();
  swift_endAccess();
  return sub_20D62D458;
}

uint64_t sub_20D62E978@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20D634C2C();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_20D62E9F4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_20D634C38();
}

uint64_t sub_20D62EA6C()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20D634C2C();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_20D62EAE4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_20D634C38();
}

uint64_t (*sub_20D62EB50(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_20D634C20();
  return sub_20D62D35C;
}

void sub_20D62EBC8(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_20D62EC14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a5);
  sub_20D634C08();
  return swift_endAccess();
}

uint64_t sub_20D62EC80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, uint64_t, uint64_t);
  uint64_t v18;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a5);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v18 - v14;
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v10 + 16);
  v16((char *)&v18 - v14, a1, v9);
  v16(v13, (uint64_t)v15, v9);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a7);
  sub_20D634C14();
  swift_endAccess();
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

uint64_t sub_20D62ED98()
{
  return sub_20D62EDAC((uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__addresses, &qword_2549BEBF8);
}

uint64_t sub_20D62EDAC(uint64_t a1, uint64_t *a2)
{
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a2);
  sub_20D634C08();
  return swift_endAccess();
}

uint64_t sub_20D62EE10(uint64_t a1)
{
  return sub_20D62EE2C(a1, &qword_2549BEC00, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__addresses, &qword_2549BEBF8);
}

uint64_t sub_20D62EE2C(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v6 = __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  __swift_instantiateConcreteTypeFromMangledName(a4);
  sub_20D634C14();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*sub_20D62EF04(_QWORD *a1))()
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEC00);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__addresses;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEBF8);
  sub_20D634C08();
  swift_endAccess();
  return sub_20D62D458;
}

void sub_20D62EFCC(uint64_t a1, char a2)
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
    sub_20D634C14();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
    v10(v5, v9);
  }
  else
  {
    swift_beginAccess();
    sub_20D634C14();
    swift_endAccess();
    v10 = *(void (**)(void *, uint64_t))(v8 + 8);
  }
  v10(v6, v9);
  free(v6);
  free(v5);
  free(v7);
  free(v3);
}

BOOL sub_20D62F0E4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  if ((*(_BYTE *)(v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_primaryButtonWasClicked) & 1) != 0)
    return 1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20D634C2C();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v1 = HIBYTE(v5) & 0xF;
  if ((v5 & 0x2000000000000000) == 0)
    v1 = v4 & 0xFFFFFFFFFFFFLL;
  if (v1)
    return 1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_20D634C2C();
  swift_release();
  swift_release();
  v3 = *(_QWORD *)(v4 + 16);
  swift_bridgeObjectRelease();
  return v3 == 0;
}

uint64_t AddressingViewModel.__allocating_init(headerImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:userDidClickPrimaryButton:userDidClickSecondaryButton:userDidClickShowContactPicker:userDidChangeAddresses:)(uint64_t a1, unint64_t a2, void *a3, unint64_t a4, void *a5, unint64_t a6, void *a7, unint64_t a8, void *a9, unint64_t a10, void *a11, unint64_t a12, void *a13, unint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v29;

  v29 = swift_allocObject();
  AddressingViewModel.init(headerImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:userDidClickPrimaryButton:userDidClickSecondaryButton:userDidClickShowContactPicker:userDidChangeAddresses:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
    a20,
    a21,
    a22);
  return v29;
}

uint64_t AddressingViewModel.init(headerImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:userDidClickPrimaryButton:userDidClickSecondaryButton:userDidClickShowContactPicker:userDidChangeAddresses:)(uint64_t a1, unint64_t a2, void *a3, unint64_t a4, void *a5, unint64_t a6, void *a7, unint64_t a8, void *a9, unint64_t a10, void *a11, unint64_t a12, void *a13, unint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  unint64_t v40;
  void *v41;
  id v42;
  void *v43;
  unint64_t v44;
  unint64_t v45;
  void *v46;
  unint64_t v47;
  void *v48;
  unint64_t v49;
  void *v50;
  unint64_t v51;
  void *v52;
  unint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  void *v72;
  unint64_t v73;
  void *v74;
  unint64_t v75;
  void *v76;
  unint64_t v77;
  void *v78;
  unint64_t v79;
  void *v80;
  unint64_t v81;
  uint64_t v82;
  void *v83;
  unint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
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
  unint64_t v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  unint64_t v103;
  id v104;
  unint64_t v105;

  v23 = v22;
  v77 = a8;
  v76 = a7;
  v75 = a6;
  v74 = a5;
  v73 = a4;
  v72 = a3;
  v91 = a21;
  v92 = a22;
  v93 = a19;
  v94 = a20;
  v95 = a17;
  v96 = a18;
  v98 = a16;
  v99 = a2;
  v97 = a15;
  v84 = a14;
  v83 = a13;
  v81 = a12;
  v80 = a11;
  v79 = a10;
  v78 = a9;
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEC00);
  v86 = *(_QWORD *)(v25 - 8);
  v87 = v25;
  MEMORY[0x24BDAC7A8](v25);
  v85 = (char *)&v72 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEC08);
  v89 = *(_QWORD *)(v27 - 8);
  v90 = v27;
  MEMORY[0x24BDAC7A8](v27);
  v88 = (char *)&v72 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEBE0);
  v30 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)&v72 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEB68);
  v34 = *(_QWORD *)(v33 - 8);
  MEMORY[0x24BDAC7A8](v33);
  v36 = (char *)&v72 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = v23 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__headerImage;
  v100 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEC10);
  sub_20D634BFC();
  (*(void (**)(uint64_t, char *, uint64_t))(v34 + 32))(v37, v36, v33);
  *(_BYTE *)(v23 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_primaryButtonWasClicked) = 0;
  v38 = v23 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__hideInnerNavigationBar;
  LOBYTE(v100) = 1;
  sub_20D634BFC();
  (*(void (**)(uint64_t, char *, uint64_t))(v30 + 32))(v38, v32, v29);
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v23 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_store) = MEMORY[0x24BEE4B08];
  v82 = a1;
  if (v99 >> 60 == 15)
  {
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v37, v33);
    v104 = 0;
    sub_20D634BFC();
    swift_endAccess();
  }
  else
  {
    v39 = objc_allocWithZone(MEMORY[0x24BEBD640]);
    v40 = v99;
    sub_20D62FCAC(a1, v99);
    v41 = (void *)sub_20D634B18();
    v42 = objc_msgSend(v39, sel_initWithData_, v41);

    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v37, v33);
    v104 = v42;
    sub_20D634BFC();
    swift_endAccess();
    sub_20D62FC54(a1, v40);
  }
  if (v73)
    v43 = v72;
  else
    v43 = 0;
  v44 = 0xE000000000000000;
  if (v73)
    v45 = v73;
  else
    v45 = 0xE000000000000000;
  swift_beginAccess();
  v104 = v43;
  v105 = v45;
  sub_20D634BFC();
  swift_endAccess();
  swift_beginAccess();
  v100 = 0;
  v101 = 0xE000000000000000;
  v102 = 0;
  v103 = 0xE000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEC20);
  sub_20D634BFC();
  swift_endAccess();
  swift_beginAccess();
  v104 = 0;
  v105 = 0xE000000000000000;
  sub_20D634BFC();
  swift_endAccess();
  if (v75)
    v46 = v74;
  else
    v46 = 0;
  if (v75)
    v47 = v75;
  else
    v47 = 0xE000000000000000;
  swift_beginAccess();
  v104 = v46;
  v105 = v47;
  sub_20D634BFC();
  swift_endAccess();
  if (v77)
    v48 = v76;
  else
    v48 = 0;
  if (v77)
    v49 = v77;
  else
    v49 = 0xE000000000000000;
  swift_beginAccess();
  v104 = v48;
  v105 = v49;
  sub_20D634BFC();
  swift_endAccess();
  if (v79)
    v50 = v78;
  else
    v50 = 0;
  if (v79)
    v51 = v79;
  else
    v51 = 0xE000000000000000;
  swift_beginAccess();
  v104 = v50;
  v105 = v51;
  sub_20D634BFC();
  swift_endAccess();
  if (v81)
    v52 = v80;
  else
    v52 = 0;
  if (v81)
    v53 = v81;
  else
    v53 = 0xE000000000000000;
  swift_beginAccess();
  v104 = v52;
  v105 = v53;
  sub_20D634BFC();
  swift_endAccess();
  v54 = (_QWORD *)(v23 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_primaryButtonDidClick);
  v56 = v97;
  v55 = v98;
  *v54 = v97;
  v54[1] = v55;
  if (v84)
    v57 = v83;
  else
    v57 = 0;
  if (v84)
    v44 = v84;
  swift_beginAccess();
  v104 = v57;
  v105 = v44;
  sub_20D6187C4(v56);
  sub_20D634BFC();
  swift_endAccess();
  v58 = (uint64_t *)(v23 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_secondaryButtonDidClick);
  v60 = v95;
  v59 = v96;
  *v58 = v95;
  v58[1] = v59;
  v61 = (uint64_t *)(v23 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_showContactPickerDidClick);
  v62 = v93;
  v63 = v94;
  *v61 = v93;
  v61[1] = v63;
  v64 = (uint64_t *)(v23 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_addressesDidChange);
  v65 = v91;
  v66 = v92;
  *v64 = v91;
  v64[1] = v66;
  swift_beginAccess();
  v104 = (id)MEMORY[0x24BEE4AF8];
  sub_20D6187C4(v60);
  sub_20D6187C4(v62);
  sub_20D6187C4(v65);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEC28);
  sub_20D634BFC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEBF8);
  v67 = v85;
  sub_20D634C08();
  swift_endAccess();
  sub_20D61A878(&qword_2549BEC30, &qword_2549BEC00, MEMORY[0x24BDB9EE8]);
  sub_20D62FB50();
  v68 = v87;
  v69 = v88;
  sub_20D634C50();
  (*(void (**)(char *, uint64_t))(v86 + 8))(v67, v68);
  swift_allocObject();
  swift_weakInit();
  sub_20D61A878(&qword_2549BEC40, &qword_2549BEC08, MEMORY[0x24BDB9658]);
  v70 = v90;
  sub_20D634C5C();
  swift_release();
  (*(void (**)(char *, uint64_t))(v89 + 8))(v69, v70);
  swift_beginAccess();
  sub_20D634BE4();
  swift_endAccess();
  sub_20D618880(v65);
  sub_20D618880(v62);
  sub_20D618880(v60);
  sub_20D618880(v97);
  sub_20D62FC54(v82, v99);
  swift_release();
  return v23;
}

unint64_t sub_20D62FB50()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2549BEC38;
  if (!qword_2549BEC38)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BEC28);
    v2 = MEMORY[0x24BEE0D28];
    result = MEMORY[0x212BA5644](MEMORY[0x24BEE12C0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2549BEC38);
  }
  return result;
}

uint64_t sub_20D62FBAC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_20D62FBD0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t result;
  void (*v3)(uint64_t);

  v1 = *a1;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v3 = *(void (**)(uint64_t))(result
                                        + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_addressesDidChange);
    if (v3)
      v3(v1);
    return swift_release();
  }
  return result;
}

uint64_t sub_20D62FC4C(uint64_t *a1)
{
  return sub_20D62FBD0(a1);
}

uint64_t sub_20D62FC54(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_20D62FC68(a1, a2);
  return a1;
}

uint64_t sub_20D62FC68(uint64_t a1, unint64_t a2)
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

uint64_t sub_20D62FCAC(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

void sub_20D62FCF0(void *a1, void *a2)
{
  uint64_t v2;
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[24];
  uint64_t v53;

  if (!a1)
    goto LABEL_20;
  v4 = a1;
  v5 = objc_msgSend(v4, sel_emailAddresses);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEC50);
  v7 = sub_20D6351CC();

  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    v15 = sub_20D635448();
    swift_bridgeObjectRelease();
    if (v15)
      goto LABEL_4;
LABEL_10:
    swift_bridgeObjectRelease();
    goto LABEL_11;
  }
  if (!*(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_10;
LABEL_4:
  if ((v7 & 0xC000000000000001) != 0)
  {
    v8 = (id)MEMORY[0x212BA50B0](0, v7);
  }
  else
  {
    if (!*(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
LABEL_54:
      swift_bridgeObjectRetain();
      v48 = sub_20D635448();
      swift_bridgeObjectRelease();
      if (v48)
        goto LABEL_13;
      goto LABEL_55;
    }
    v8 = *(id *)(v7 + 32);
  }
  v9 = v8;
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v9, sel_value);

  if (v10)
  {
    sub_20D635190();
    v11 = objc_allocWithZone(MEMORY[0x24BE19158]);
    v12 = v4;
    v13 = (void *)sub_20D635160();
    swift_bridgeObjectRelease();
    v14 = objc_msgSend(v11, sel_initWithContact_address_kind_, v12, v13, 0);

LABEL_17:
    if (v14)
    {
      v23 = (void *)MEMORY[0x212BA5758](v2 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_contactsSearchController);
      objc_msgSend(v23, sel_addRecipient_, v14);

    }
LABEL_20:
    if (!a2)
      goto LABEL_49;
LABEL_21:
    v24 = a2;
    v25 = objc_msgSend(v24, sel_key);
    v26 = sub_20D635190();
    v28 = v27;

    if (v26 == sub_20D635190() && v28 == v29)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v31 = sub_20D635490();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v31 & 1) == 0)
        goto LABEL_35;
    }
    if (objc_msgSend(v24, sel_value))
    {
      sub_20D635394();
      swift_unknownObjectRelease();
    }
    else
    {
      v50 = 0u;
      v51 = 0u;
    }
    sub_20D6303A4((uint64_t)&v50, (uint64_t)v52);
    if (v53)
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v32 = objc_msgSend(v24, sel_contact);
        v33 = objc_allocWithZone(MEMORY[0x24BE19158]);
        v34 = (void *)sub_20D635160();
        swift_bridgeObjectRelease();
        v35 = objc_msgSend(v33, sel_initWithContact_address_kind_, v32, v34, 0);
        goto LABEL_45;
      }
    }
    else
    {
      sub_20D6303EC((uint64_t)v52);
    }
LABEL_35:
    v36 = objc_msgSend(v24, sel_key);
    v37 = sub_20D635190();
    v39 = v38;

    if (v37 == sub_20D635190() && v39 == v40)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v41 = sub_20D635490();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v41 & 1) == 0)
        goto LABEL_48;
    }
    if (objc_msgSend(v24, sel_value))
    {
      sub_20D635394();
      swift_unknownObjectRelease();
    }
    else
    {
      v50 = 0u;
      v51 = 0u;
    }
    sub_20D6303A4((uint64_t)&v50, (uint64_t)v52);
    if (v53)
    {
      sub_20D63042C();
      if ((swift_dynamicCast() & 1) != 0)
      {
        v42 = objc_msgSend(v49, sel_stringValue);

        sub_20D635190();
        v32 = objc_msgSend(v24, sel_contact);
        v43 = objc_allocWithZone(MEMORY[0x24BE19158]);
        v34 = (void *)sub_20D635160();
        swift_bridgeObjectRelease();
        v35 = objc_msgSend(v43, sel_initWithContact_address_kind_, v32, v34, 1);
LABEL_45:
        v44 = v35;

        if (v44)
        {
          v45 = (void *)MEMORY[0x212BA5758](v2 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_contactsSearchController);
          objc_msgSend(v45, sel_addRecipient_, v44);

          goto LABEL_49;
        }
      }
    }
    else
    {
      sub_20D6303EC((uint64_t)v52);
    }
LABEL_48:

    goto LABEL_49;
  }
LABEL_11:
  v16 = objc_msgSend(v4, sel_phoneNumbers);
  v6 = sub_20D6351CC();

  if (v6 >> 62)
    goto LABEL_54;
  if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_13:
    if ((v6 & 0xC000000000000001) != 0)
    {
      v17 = (id)MEMORY[0x212BA50B0](0, v6);
    }
    else
    {
      if (!*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        return;
      }
      v17 = *(id *)(v6 + 32);
    }
    v18 = v17;
    swift_bridgeObjectRelease();
    v19 = objc_msgSend(v18, sel_value);

    v20 = objc_msgSend(v19, sel_stringValue);
    sub_20D635190();

    v21 = objc_allocWithZone(MEMORY[0x24BE19158]);
    v22 = v4;
    v13 = (void *)sub_20D635160();
    swift_bridgeObjectRelease();
    v14 = objc_msgSend(v21, sel_initWithContact_address_kind_, v22, v13, 1);
    goto LABEL_17;
  }
LABEL_55:

  swift_bridgeObjectRelease();
  if (a2)
    goto LABEL_21;
LABEL_49:
  v46 = (void *)MEMORY[0x212BA5758](v2 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_contactsSearchController);
  if (v46)
  {
    v47 = v46;
    objc_msgSend(v46, sel_becomeFirstResponder);

  }
}

uint64_t sub_20D6303A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEA30);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20D6303EC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEA30);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_20D63042C()
{
  unint64_t result;

  result = qword_2549BEC48;
  if (!qword_2549BEC48)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2549BEC48);
  }
  return result;
}

uint64_t sub_20D630468(uint64_t a1, unint64_t a2, void *a3, unint64_t a4, void *a5, unint64_t a6, void *a7, unint64_t a8, void *a9, unint64_t a10, void *a11, unint64_t a12, void *a13, unint64_t a14)
{
  unint64_t v14;
  void *v15;
  id v22;
  void *v23;
  id v24;
  id v25;
  unint64_t v26;
  char v27;
  id v28;
  unint64_t v29;
  char v30;
  id v31;
  unint64_t v32;
  char v33;
  id v34;
  unint64_t v35;
  char v36;
  id v37;
  unint64_t v38;
  char v39;
  id v40;
  unint64_t v41;
  char v43;
  id v46;
  unint64_t v47;

  v14 = a8;
  v15 = a7;
  if (a2 >> 60 == 15)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v46 = 0;
    swift_retain();
    sub_20D634C38();
  }
  else
  {
    v22 = objc_allocWithZone(MEMORY[0x24BEBD640]);
    sub_20D62FCAC(a1, a2);
    v23 = (void *)sub_20D634B18();
    v24 = objc_msgSend(v22, sel_initWithData_, v23);

    swift_getKeyPath();
    swift_getKeyPath();
    v46 = v24;
    v15 = a7;
    v14 = a8;
    swift_retain();
    sub_20D634C38();
    sub_20D62FC54(a1, a2);
  }
  if (a4)
    v25 = a3;
  else
    v25 = 0;
  if (a4)
    v26 = a4;
  else
    v26 = 0xE000000000000000;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_20D634C2C();
  swift_release();
  swift_release();
  if (v46 == v25 && v47 == v26)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v27 = sub_20D635490();
    swift_bridgeObjectRelease();
    if ((v27 & 1) != 0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      v46 = v25;
      v47 = v26;
      swift_retain();
      sub_20D634C38();
    }
  }
  if (a6)
    v28 = a5;
  else
    v28 = 0;
  if (a6)
    v29 = a6;
  else
    v29 = 0xE000000000000000;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_20D634C2C();
  swift_release();
  swift_release();
  if (v46 == v28 && v47 == v29)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v30 = sub_20D635490();
    swift_bridgeObjectRelease();
    if ((v30 & 1) != 0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      v46 = v28;
      v47 = v29;
      swift_retain();
      sub_20D634C38();
    }
  }
  if (v14)
    v31 = v15;
  else
    v31 = 0;
  if (v14)
    v32 = v14;
  else
    v32 = 0xE000000000000000;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_20D634C2C();
  swift_release();
  swift_release();
  if (v46 == v31 && v47 == v32)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v33 = sub_20D635490();
    swift_bridgeObjectRelease();
    if ((v33 & 1) != 0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      v46 = v31;
      v47 = v32;
      swift_retain();
      sub_20D634C38();
    }
  }
  if (a10)
    v34 = a9;
  else
    v34 = 0;
  if (a10)
    v35 = a10;
  else
    v35 = 0xE000000000000000;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_20D634C2C();
  swift_release();
  swift_release();
  if (v46 == v34 && v47 == v35)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v36 = sub_20D635490();
    swift_bridgeObjectRelease();
    if ((v36 & 1) != 0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      v46 = v34;
      v47 = v35;
      swift_retain();
      sub_20D634C38();
    }
  }
  if (a12)
    v37 = a11;
  else
    v37 = 0;
  if (a12)
    v38 = a12;
  else
    v38 = 0xE000000000000000;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_20D634C2C();
  swift_release();
  swift_release();
  if (v46 == v37 && v47 == v38)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v39 = sub_20D635490();
    swift_bridgeObjectRelease();
    if ((v39 & 1) != 0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      v46 = v37;
      v47 = v38;
      swift_retain();
      sub_20D634C38();
    }
  }
  if (a14)
    v40 = a13;
  else
    v40 = 0;
  if (a14)
    v41 = a14;
  else
    v41 = 0xE000000000000000;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_20D634C2C();
  swift_release();
  swift_release();
  if (v46 == v40 && v47 == v41)
    return swift_bridgeObjectRelease_n();
  v43 = sub_20D635490();
  swift_bridgeObjectRelease();
  if ((v43 & 1) != 0)
    return swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_20D634C38();
}

uint64_t AddressingViewModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__headerImage;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEB68);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__headerTitle;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEB80);
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v6 = v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__yourNameAndEmail;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEB98);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v5(v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__inputText, v4);
  v5(v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__loadingText, v4);
  v5(v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__supplementaryText, v4);
  v5(v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__userInfoText, v4);
  v5(v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__primaryButtonText, v4);
  sub_20D618880(*(_QWORD *)(v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_primaryButtonDidClick));
  v5(v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__secondaryButtonText, v4);
  sub_20D618880(*(_QWORD *)(v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_secondaryButtonDidClick));
  sub_20D618880(*(_QWORD *)(v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_showContactPickerDidClick));
  v8 = v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__hideInnerNavigationBar;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEBE0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__addresses;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BEBF8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  swift_unknownObjectWeakDestroy();
  sub_20D618880(*(_QWORD *)(v0 + OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel_addressesDidChange));
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t AddressingViewModel.__deallocating_deinit()
{
  AddressingViewModel.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_20D630D88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for AddressingViewModel();
  result = sub_20D634BF0();
  *a1 = result;
  return result;
}

uint64_t sub_20D630DC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D62EC14(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__headerImage, &qword_2549BEB68);
}

uint64_t sub_20D630DE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20D62EC80(a1, a2, a3, a4, &qword_2549BEB70, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__headerImage, &qword_2549BEB68);
}

uint64_t sub_20D630E14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D62EC14(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__headerTitle, &qword_2549BEB80);
}

uint64_t sub_20D630E38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20D62EC80(a1, a2, a3, a4, &qword_2549BEB88, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__headerTitle, &qword_2549BEB80);
}

uint64_t sub_20D630E64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D62EC14(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__yourNameAndEmail, &qword_2549BEB98);
}

uint64_t sub_20D630E88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20D62EC80(a1, a2, a3, a4, &qword_2549BEBA0, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__yourNameAndEmail, &qword_2549BEB98);
}

uint64_t sub_20D630EB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D62EC14(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__inputText, &qword_2549BEB80);
}

uint64_t sub_20D630ED8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20D62EC80(a1, a2, a3, a4, &qword_2549BEB88, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__inputText, &qword_2549BEB80);
}

uint64_t sub_20D630F04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D62EC14(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__loadingText, &qword_2549BEB80);
}

uint64_t sub_20D630F28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20D62EC80(a1, a2, a3, a4, &qword_2549BEB88, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__loadingText, &qword_2549BEB80);
}

uint64_t sub_20D630F54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D62EC14(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__supplementaryText, &qword_2549BEB80);
}

uint64_t sub_20D630F78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20D62EC80(a1, a2, a3, a4, &qword_2549BEB88, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__supplementaryText, &qword_2549BEB80);
}

uint64_t sub_20D630FA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D62EC14(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__userInfoText, &qword_2549BEB80);
}

uint64_t sub_20D630FC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20D62EC80(a1, a2, a3, a4, &qword_2549BEB88, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__userInfoText, &qword_2549BEB80);
}

uint64_t sub_20D630FF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D62EC14(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__primaryButtonText, &qword_2549BEB80);
}

uint64_t sub_20D631018(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20D62EC80(a1, a2, a3, a4, &qword_2549BEB88, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__primaryButtonText, &qword_2549BEB80);
}

uint64_t sub_20D631044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D62EC14(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__secondaryButtonText, &qword_2549BEB80);
}

uint64_t sub_20D631068(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20D62EC80(a1, a2, a3, a4, &qword_2549BEB88, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__secondaryButtonText, &qword_2549BEB80);
}

uint64_t sub_20D631094(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D62EC14(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__hideInnerNavigationBar, &qword_2549BEBE0);
}

uint64_t sub_20D6310B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20D62EC80(a1, a2, a3, a4, &qword_2549BEBE8, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__hideInnerNavigationBar, &qword_2549BEBE0);
}

uint64_t sub_20D6310E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D62EC14(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__addresses, &qword_2549BEBF8);
}

uint64_t sub_20D631108(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20D62EC80(a1, a2, a3, a4, &qword_2549BEC00, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI19AddressingViewModel__addresses, &qword_2549BEBF8);
}

uint64_t sub_20D631134()
{
  return type metadata accessor for AddressingViewModel();
}

uint64_t type metadata accessor for AddressingViewModel()
{
  uint64_t result;

  result = qword_2549BEC80;
  if (!qword_2549BEC80)
    return swift_getSingletonMetadata();
  return result;
}

void sub_20D631178()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  sub_20D6316D8(319, &qword_2549BEC90, &qword_2549BEC10);
  if (v0 <= 0x3F)
  {
    sub_20D631694(319, &qword_2549BEC98);
    if (v1 <= 0x3F)
    {
      sub_20D6316D8(319, &qword_2549BECA0, &qword_2549BEC20);
      if (v2 <= 0x3F)
      {
        sub_20D631694(319, &qword_2549BECA8);
        if (v3 <= 0x3F)
        {
          sub_20D6316D8(319, qword_2549BECB0, &qword_2549BEC28);
          if (v4 <= 0x3F)
            swift_updateClassMetadata2();
        }
      }
    }
  }
}

uint64_t method lookup function for AddressingViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AddressingViewModel.headerImage.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of AddressingViewModel.headerImage.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of AddressingViewModel.headerImage.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of AddressingViewModel.$headerImage.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of AddressingViewModel.$headerImage.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of AddressingViewModel.$headerImage.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of AddressingViewModel.headerTitle.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of AddressingViewModel.headerTitle.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of AddressingViewModel.headerTitle.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of AddressingViewModel.$headerTitle.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of AddressingViewModel.$headerTitle.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of AddressingViewModel.$headerTitle.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of AddressingViewModel.yourNameAndEmail.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of AddressingViewModel.yourNameAndEmail.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t dispatch thunk of AddressingViewModel.yourNameAndEmail.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of AddressingViewModel.$yourNameAndEmail.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of AddressingViewModel.$yourNameAndEmail.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of AddressingViewModel.$yourNameAndEmail.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of AddressingViewModel.inputText.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of AddressingViewModel.inputText.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of AddressingViewModel.inputText.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

uint64_t dispatch thunk of AddressingViewModel.$inputText.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

uint64_t dispatch thunk of AddressingViewModel.$inputText.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 400))();
}

uint64_t dispatch thunk of AddressingViewModel.$inputText.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 408))();
}

uint64_t dispatch thunk of AddressingViewModel.loadingText.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 416))();
}

uint64_t dispatch thunk of AddressingViewModel.loadingText.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 424))();
}

uint64_t dispatch thunk of AddressingViewModel.loadingText.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 432))();
}

uint64_t dispatch thunk of AddressingViewModel.$loadingText.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 440))();
}

uint64_t dispatch thunk of AddressingViewModel.$loadingText.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 448))();
}

uint64_t dispatch thunk of AddressingViewModel.$loadingText.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 456))();
}

uint64_t dispatch thunk of AddressingViewModel.supplementaryText.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 464))();
}

uint64_t dispatch thunk of AddressingViewModel.supplementaryText.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 472))();
}

uint64_t dispatch thunk of AddressingViewModel.supplementaryText.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 480))();
}

uint64_t dispatch thunk of AddressingViewModel.$supplementaryText.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 488))();
}

uint64_t dispatch thunk of AddressingViewModel.$supplementaryText.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 496))();
}

uint64_t dispatch thunk of AddressingViewModel.$supplementaryText.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 504))();
}

uint64_t dispatch thunk of AddressingViewModel.userInfoText.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 512))();
}

uint64_t dispatch thunk of AddressingViewModel.userInfoText.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 520))();
}

uint64_t dispatch thunk of AddressingViewModel.userInfoText.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 528))();
}

uint64_t dispatch thunk of AddressingViewModel.$userInfoText.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 536))();
}

uint64_t dispatch thunk of AddressingViewModel.$userInfoText.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 544))();
}

uint64_t dispatch thunk of AddressingViewModel.$userInfoText.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 552))();
}

uint64_t dispatch thunk of AddressingViewModel.primaryButtonText.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 560))();
}

uint64_t dispatch thunk of AddressingViewModel.primaryButtonText.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 568))();
}

uint64_t dispatch thunk of AddressingViewModel.primaryButtonText.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 576))();
}

uint64_t dispatch thunk of AddressingViewModel.$primaryButtonText.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 584))();
}

uint64_t dispatch thunk of AddressingViewModel.$primaryButtonText.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 592))();
}

uint64_t dispatch thunk of AddressingViewModel.$primaryButtonText.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 600))();
}

uint64_t dispatch thunk of AddressingViewModel.secondaryButtonText.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 632))();
}

uint64_t dispatch thunk of AddressingViewModel.secondaryButtonText.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 640))();
}

uint64_t dispatch thunk of AddressingViewModel.secondaryButtonText.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 648))();
}

uint64_t dispatch thunk of AddressingViewModel.$secondaryButtonText.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 656))();
}

uint64_t dispatch thunk of AddressingViewModel.$secondaryButtonText.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 664))();
}

uint64_t dispatch thunk of AddressingViewModel.$secondaryButtonText.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 672))();
}

uint64_t dispatch thunk of AddressingViewModel.hideInnerNavigationBar.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 680))();
}

uint64_t dispatch thunk of AddressingViewModel.hideInnerNavigationBar.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 688))();
}

uint64_t dispatch thunk of AddressingViewModel.hideInnerNavigationBar.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 696))();
}

uint64_t dispatch thunk of AddressingViewModel.$hideInnerNavigationBar.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 704))();
}

uint64_t dispatch thunk of AddressingViewModel.$hideInnerNavigationBar.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 712))();
}

uint64_t dispatch thunk of AddressingViewModel.$hideInnerNavigationBar.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 720))();
}

uint64_t dispatch thunk of AddressingViewModel.addresses.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 728))();
}

uint64_t dispatch thunk of AddressingViewModel.addresses.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 736))();
}

uint64_t dispatch thunk of AddressingViewModel.addresses.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 744))();
}

uint64_t dispatch thunk of AddressingViewModel.$addresses.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 752))();
}

uint64_t dispatch thunk of AddressingViewModel.$addresses.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 760))();
}

uint64_t dispatch thunk of AddressingViewModel.$addresses.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 768))();
}

uint64_t dispatch thunk of AddressingViewModel.primaryButtonIsDisabled.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 800))();
}

uint64_t dispatch thunk of AddressingViewModel.__allocating_init(headerImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:userDidClickPrimaryButton:userDidClickSecondaryButton:userDidClickShowContactPicker:userDidChangeAddresses:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 832))();
}

uint64_t dispatch thunk of AddressingViewModel.addAddress(from:contactProperty:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 848))();
}

uint64_t dispatch thunk of AddressingViewModel.update(headerImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 856))();
}

void sub_20D631694(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_20D634C44();
    if (!v4)
      atomic_store(v3, a2);
  }
}

void sub_20D6316D8(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v4 = sub_20D634C44();
    if (!v5)
      atomic_store(v4, a2);
  }
}

void URL.evictionSafeResourceValues(forKeys:)(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id aBlock[6];
  id v22[2];

  v19 = a2;
  v22[1] = *(id *)MEMORY[0x24BDAC8D0];
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BF030);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v20 = (uint64_t)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v18 - v6;
  v22[0] = 0;
  v8 = sub_20D634AAC();
  v9 = *(_QWORD *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1570]), sel_init);
  v11 = (void *)sub_20D634AE8();
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = v7;
  v12[3] = a1;
  v12[4] = v22;
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = sub_20D631B5C;
  v13[3] = v12;
  aBlock[4] = sub_20D631B78;
  aBlock[5] = v13;
  aBlock[0] = (id)MEMORY[0x24BDAC760];
  aBlock[1] = (id)1107296256;
  aBlock[2] = sub_20D631B98;
  aBlock[3] = &block_descriptor_1;
  v14 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  aBlock[0] = 0;
  objc_msgSend(v10, sel_coordinateReadingItemAtURL_options_error_byAccessor_, v11, 4, aBlock, v14);
  _Block_release(v14);

  v15 = aBlock[0];
  LOBYTE(v14) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v14 & 1) != 0)
    __break(1u);
  if (v15)
  {
    v16 = v15;
    swift_willThrow();
    sub_20D631C8C((uint64_t)v7);

    swift_release();
  }
  else if (v22[0])
  {
    v22[0];
    swift_willThrow();
    sub_20D631C8C((uint64_t)v7);

    swift_release();
  }
  else
  {
    v17 = v20;
    sub_20D631C44((uint64_t)v7, v20);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v17, 1, v8) == 1)
    {
      __break(1u);
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v19, v17, v8);
      sub_20D631C8C((uint64_t)v7);

      swift_release();
    }
  }
}

uint64_t sub_20D631A28(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BF030);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20D634AF4();
  v6 = sub_20D634AAC();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 0, 1, v6);
  return sub_20D631D08((uint64_t)v5, a2);
}

uint64_t sub_20D631B38()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_20D631B5C(uint64_t a1)
{
  uint64_t v1;

  return sub_20D631A28(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_20D631B68()
{
  return swift_deallocObject();
}

uint64_t sub_20D631B78()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_20D631B98(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void (*v6)(char *);
  uint64_t v8;

  v2 = sub_20D634B0C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(void (**)(char *))(a1 + 32);
  sub_20D634B00();
  v6(v5);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_20D631C44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BF030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20D631C8C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BF030);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_20D631CCC()
{
  unint64_t result;

  result = qword_2549BF040;
  if (!qword_2549BF040)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2549BF040);
  }
  return result;
}

uint64_t sub_20D631D08(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BF030);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

id HostingControllerAndModelUpdates.__allocating_init(viewController:sourceAppBundleIDDidChangeBlock:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  char *v7;
  char *v8;
  objc_super v10;

  v7 = (char *)objc_allocWithZone(v3);
  *(_QWORD *)&v7[OBJC_IVAR____TtC14CloudSharingUI32HostingControllerAndModelUpdates_viewController] = a1;
  v8 = &v7[OBJC_IVAR____TtC14CloudSharingUI32HostingControllerAndModelUpdates_sourceAppBundleIDDidChangeBlock];
  *(_QWORD *)v8 = a2;
  *((_QWORD *)v8 + 1) = a3;
  v10.receiver = v7;
  v10.super_class = v3;
  return objc_msgSendSuper2(&v10, sel_init);
}

void sub_20D631EAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  void *v10;
  id v11;

  v10 = (void *)sub_20D635160();
  v11 = (id)sub_20D635160();
  (*(void (**)(uint64_t, void *, id, _QWORD, uint64_t))(a7 + 16))(a7, v10, v11, a5 & 1, a6);

}

uint64_t sub_20D631F30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_beginAccess();
  *(_QWORD *)(a3 + 16) = a1;
  *(_QWORD *)(a3 + 24) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void sub_20D632020(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  void *v9;
  void *v10;
  id v11;

  v9 = (void *)sub_20D635160();
  v10 = (void *)sub_20D635160();
  sub_20D6329CC();
  v11 = (id)sub_20D6351C0();
  (*(void (**)(uint64_t, void *, void *, _QWORD, id))(a7 + 16))(a7, v9, v10, a5 & 1, v11);

}

id SharingOptionsViewFactory.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SharingOptionsViewFactory.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SharingOptionsViewFactory();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SharingOptionsViewFactory.__deallocating_deinit()
{
  return sub_20D6323D8(type metadata accessor for SharingOptionsViewFactory);
}

id HostingControllerAndModelUpdates.viewController.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC14CloudSharingUI32HostingControllerAndModelUpdates_viewController);
}

uint64_t HostingControllerAndModelUpdates.sourceAppBundleIDDidChangeBlock.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0
                 + OBJC_IVAR____TtC14CloudSharingUI32HostingControllerAndModelUpdates_sourceAppBundleIDDidChangeBlock);
  swift_retain();
  return v1;
}

uint64_t sub_20D63223C(uint64_t a1)
{
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void (**)(uint64_t, uint64_t))(a1 + 32);
  v2 = sub_20D635190();
  v4 = v3;
  swift_retain();
  v1(v2, v4);
  swift_release();
  return swift_bridgeObjectRelease();
}

id HostingControllerAndModelUpdates.init(viewController:sourceAppBundleIDDidChangeBlock:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v4;
  objc_super v6;

  *(_QWORD *)&v3[OBJC_IVAR____TtC14CloudSharingUI32HostingControllerAndModelUpdates_viewController] = a1;
  v4 = &v3[OBJC_IVAR____TtC14CloudSharingUI32HostingControllerAndModelUpdates_sourceAppBundleIDDidChangeBlock];
  *(_QWORD *)v4 = a2;
  *((_QWORD *)v4 + 1) = a3;
  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for HostingControllerAndModelUpdates();
  return objc_msgSendSuper2(&v6, sel_init);
}

void HostingControllerAndModelUpdates.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id HostingControllerAndModelUpdates.__deallocating_deinit()
{
  return sub_20D6323D8(type metadata accessor for HostingControllerAndModelUpdates);
}

id sub_20D6323D8(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t _s14CloudSharingUI0B18OptionsViewFactoryC024createCollaborationSharedE0_13layoutMargins19userDidChangeOption011contentSizemN0AA32HostingControllerAndModelUpdatesCSo016_SWCollaborationiD0CSg_So23NSDirectionalEdgeInsetsVySS_SSSbALtcySo6CGSizeVctFZ_0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t result;
  char *v26;
  id v27;
  uint64_t v28;
  uint64_t (*v29)();
  objc_class *v30;
  char *v31;
  uint64_t (**v32)();
  id v33;
  uint64_t v34;
  objc_super v35;
  uint64_t (*v36)();

  v10 = type metadata accessor for SharingOptionsGroupsView(0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (uint64_t *)((char *)&v34 - v14);
  v16 = a1;
  sub_20D634C8C();
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  swift_retain();
  swift_retain();
  qword_2549BF048 = _s14CloudSharingUI0B22OptionsObservableModelC018collaborationShareD013layoutMargins19userDidChangeOption011contentSizelM0ACSo016_SWCollaborationhD0CSg_05SwiftC010EdgeInsetsVySS_SSSbAJtcSgySo6CGSizeVcSgtcfC_0(a1, a2, a3, a4, a5, v18, v20, v22, v24);
  result = swift_release();
  if (qword_2549BF048)
  {
    *v15 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE70);
    swift_storeEnumTagMultiPayload();
    v26 = (char *)v15 + *(int *)(v10 + 20);
    *(_QWORD *)v26 = sub_20D61F324;
    *((_QWORD *)v26 + 1) = 0;
    v26[16] = 0;
    type metadata accessor for SharingOptionsObservableModel();
    sub_20D619F34(&qword_2549BD910, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsObservableModel, (uint64_t)&protocol conformance descriptor for SharingOptionsObservableModel);
    swift_retain();
    sub_20D6350D0();
    sub_20D61BBEC((uint64_t)v15, (uint64_t)v13, type metadata accessor for SharingOptionsGroupsView);
    v27 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2549BF0B8));
    v28 = sub_20D634E0C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE80);
    sub_20D6350B8();
    v29 = v36;
    v30 = (objc_class *)type metadata accessor for HostingControllerAndModelUpdates();
    v31 = (char *)objc_allocWithZone(v30);
    *(_QWORD *)&v31[OBJC_IVAR____TtC14CloudSharingUI32HostingControllerAndModelUpdates_viewController] = v28;
    v32 = (uint64_t (**)())&v31[OBJC_IVAR____TtC14CloudSharingUI32HostingControllerAndModelUpdates_sourceAppBundleIDDidChangeBlock];
    *v32 = sub_20D632A3C;
    v32[1] = v29;
    v35.receiver = v31;
    v35.super_class = v30;
    v33 = objc_msgSendSuper2(&v35, sel_init);
    sub_20D625340((uint64_t)v15, type metadata accessor for SharingOptionsGroupsView);
    return (uint64_t)v33;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id _s14CloudSharingUI0B18OptionsViewFactoryC06createbdE0_19userDidChangeOptionAA32HostingControllerAndModelUpdatesCSaySo016_SWCollaborationD5GroupCG_ySS_SSSbAJtctFZ_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  objc_class *v19;
  char *v20;
  uint64_t (**v21)(uint64_t, uint64_t);
  id v22;
  uint64_t v24;
  objc_super v25;
  uint64_t v26;
  __int128 v27;

  v6 = (int *)type metadata accessor for SharingOptionsView(0);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (uint64_t *)((char *)&v24 - v10);
  type metadata accessor for SharingOptionsViewModel();
  swift_allocObject();
  swift_bridgeObjectRetain();
  swift_retain();
  v12 = SharingOptionsViewModel.init(collaborationOptionsGroups:userDidChangeOption:)(a1, a2, a3);
  *v11 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE70);
  swift_storeEnumTagMultiPayload();
  v13 = (char *)v11 + v6[5];
  *(_QWORD *)v13 = sub_20D61B208;
  *((_QWORD *)v13 + 1) = 0;
  v13[16] = 0;
  v14 = v6[7];
  v26 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BDE78);
  sub_20D635010();
  *(_OWORD *)((char *)v11 + v14) = v27;
  v15 = (char *)v11 + v6[6];
  *(_QWORD *)v15 = sub_20D632A2C;
  *((_QWORD *)v15 + 1) = v12;
  v15[16] = 0;
  sub_20D61BBEC((uint64_t)v11, (uint64_t)v9, type metadata accessor for SharingOptionsView);
  v16 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_2549BF0B0));
  v17 = sub_20D634E0C();
  sub_20D619F34(&qword_2549BDE68, (uint64_t (*)(uint64_t))type metadata accessor for SharingOptionsViewModel, (uint64_t)&protocol conformance descriptor for SharingOptionsViewModel);
  v18 = sub_20D634CC8();
  v19 = (objc_class *)type metadata accessor for HostingControllerAndModelUpdates();
  v20 = (char *)objc_allocWithZone(v19);
  *(_QWORD *)&v20[OBJC_IVAR____TtC14CloudSharingUI32HostingControllerAndModelUpdates_viewController] = v17;
  v21 = (uint64_t (**)(uint64_t, uint64_t))&v20[OBJC_IVAR____TtC14CloudSharingUI32HostingControllerAndModelUpdates_sourceAppBundleIDDidChangeBlock];
  *v21 = sub_20D632A34;
  v21[1] = (uint64_t (*)(uint64_t, uint64_t))v18;
  v25.receiver = v20;
  v25.super_class = v19;
  v22 = objc_msgSendSuper2(&v25, sel_init);
  sub_20D625340((uint64_t)v11, type metadata accessor for SharingOptionsView);
  return v22;
}

uint64_t type metadata accessor for SharingOptionsViewFactory()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for HostingControllerAndModelUpdates()
{
  return objc_opt_self();
}

uint64_t method lookup function for HostingControllerAndModelUpdates()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of HostingControllerAndModelUpdates.__allocating_init(viewController:sourceAppBundleIDDidChangeBlock:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_20D632950()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_20D632974()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = (id)sub_20D635160();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

unint64_t sub_20D6329CC()
{
  unint64_t result;

  result = qword_2549BDDB8;
  if (!qword_2549BDDB8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2549BDDB8);
  }
  return result;
}

void sub_20D632A08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v6;

  sub_20D632020(a1, a2, a3, a4, a5, a6, *(_QWORD *)(v6 + 16));
}

void sub_20D632A10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  uint64_t v6;

  sub_20D631EAC(a1, a2, a3, a4, a5, a6, *(_QWORD *)(v6 + 16));
}

uint64_t sub_20D632A18()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_20D632A2C()
{
  uint64_t v0;

  return j__swift_retain(v0);
}

uint64_t sub_20D632A34(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_20D631F30(a1, a2, v2);
}

uint64_t sub_20D632A3C()
{
  return sub_20D6219AC();
}

uint64_t SharingOptionsViewModel.__allocating_init(collaborationOptionsGroups:userDidChangeOption:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  SharingOptionsViewModel.init(collaborationOptionsGroups:userDidChangeOption:)(a1, a2, a3);
  return v6;
}

uint64_t sub_20D632AAC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v4 + 16) = v3;
  *(_QWORD *)(v4 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_20D632B08()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_20D632B50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_20D632BA0())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

double sub_20D632BDC@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20D634C2C();
  swift_release();
  swift_release();
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_20D632C58()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_20D634C38();
}

double sub_20D632CD0()
{
  double v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20D634C2C();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_20D632D40()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_20D634C38();
}

uint64_t (*sub_20D632DB8(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_20D634C20();
  return sub_20D62D35C;
}

uint64_t sub_20D632E30()
{
  return sub_20D62EDAC((uint64_t)&OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__contentSize, &qword_2549BF0C8);
}

uint64_t sub_20D632E44(uint64_t a1)
{
  return sub_20D62EE2C(a1, &qword_2549BF0D0, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__contentSize, &qword_2549BF0C8);
}

uint64_t (*sub_20D632E60(_QWORD *a1))()
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BF0D0);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__contentSize;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BF0C8);
  sub_20D634C08();
  swift_endAccess();
  return sub_20D62D458;
}

uint64_t sub_20D632F28@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20D634C2C();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_20D632FA4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_20D634C38();
}

uint64_t sub_20D63301C()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_20D634C2C();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_20D63308C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_20D634C38();
}

uint64_t (*sub_20D6330F8(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_20D634C20();
  return sub_20D62D35C;
}

uint64_t sub_20D633170()
{
  return sub_20D62EDAC((uint64_t)&OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__collaborationOptionsGroups, &qword_2549BF0E0);
}

uint64_t sub_20D633184(uint64_t a1)
{
  return sub_20D62EE2C(a1, &qword_2549BF0E8, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__collaborationOptionsGroups, &qword_2549BF0E0);
}

uint64_t (*sub_20D6331A0(_QWORD *a1))()
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
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BF0E8);
  v3[10] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[11] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  v7 = malloc(v6);
  v8 = OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__collaborationOptionsGroups;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BF0E0);
  sub_20D634C08();
  swift_endAccess();
  return sub_20D62D458;
}

uint64_t SharingOptionsViewModel.userDidChangeOption.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_userDidChangeOption);
  sub_20D6187C4(v1);
  return v1;
}

uint64_t SharingOptionsViewModel.contentSizeDidChange.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_contentSizeDidChange);
  sub_20D6187C4(v1);
  return v1;
}

uint64_t SharingOptionsViewModel.__allocating_init(collaborationOptionsGroups:layoutMargins:userDidChangeOption:contentSizeDidChange:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, double a8, double a9)
{
  uint64_t v18;

  v18 = swift_allocObject();
  SharingOptionsViewModel.init(collaborationOptionsGroups:layoutMargins:userDidChangeOption:contentSizeDidChange:)(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  return v18;
}

uint64_t SharingOptionsViewModel.init(collaborationOptionsGroups:layoutMargins:userDidChangeOption:contentSizeDidChange:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, double a8, double a9)
{
  uint64_t v9;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  double *v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v28[4];

  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BF0C8);
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)v28 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v9 + 16) = 0;
  *(_QWORD *)(v9 + 24) = 0;
  v23 = v9 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__contentSize;
  type metadata accessor for CGSize(0);
  v28[1] = 0;
  v28[2] = 0;
  sub_20D634BFC();
  (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(v23, v22, v19);
  swift_beginAccess();
  v28[0] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BF0F0);
  sub_20D634BFC();
  swift_endAccess();
  v24 = (double *)(v9 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_layoutMargins);
  *v24 = a6;
  v24[1] = a7;
  v24[2] = a8;
  v24[3] = a9;
  v25 = (_QWORD *)(v9 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_userDidChangeOption);
  *v25 = a2;
  v25[1] = a3;
  v26 = (_QWORD *)(v9 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_contentSizeDidChange);
  *v26 = a4;
  v26[1] = a5;
  return v9;
}

uint64_t SharingOptionsViewModel.init(collaborationOptionsGroups:userDidChangeOption:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _OWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD v16[4];

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BF0C8);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v3 + 16) = 0;
  *(_QWORD *)(v3 + 24) = 0;
  v11 = v3 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__contentSize;
  type metadata accessor for CGSize(0);
  v16[1] = 0;
  v16[2] = 0;
  sub_20D634BFC();
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v11, v10, v7);
  swift_beginAccess();
  v16[0] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549BF0F0);
  sub_20D634BFC();
  swift_endAccess();
  v12 = (_OWORD *)(v3 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_layoutMargins);
  *v12 = 0u;
  v12[1] = 0u;
  v13 = (_QWORD *)(v3 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_userDidChangeOption);
  *v13 = a2;
  v13[1] = a3;
  v14 = (_QWORD *)(v3 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_contentSizeDidChange);
  *v14 = 0;
  v14[1] = 0;
  return v3;
}

uint64_t SharingOptionsViewModel.__allocating_init(collaborationShareOptions:userDidChangeOption:)(void *a1, uint64_t a2, uint64_t a3)
{
  return _s14CloudSharingUI0B16OptionsViewModelC018collaborationShareD013layoutMargins19userDidChangeOption011contentSizelM0ACSo016_SWCollaborationhD0CSg_05SwiftC010EdgeInsetsVySS_SSSbAJtcSgySo6CGSizeVcSgtcfC_0(a1, a2, a3, 0, 0, 0.0, 0.0, 0.0, 0.0);
}

uint64_t sub_20D63364C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t SharingOptionsViewModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__contentSize;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BF0C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__collaborationOptionsGroups;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BF0E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_20D618880(*(_QWORD *)(v0 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_userDidChangeOption));
  sub_20D618880(*(_QWORD *)(v0 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_contentSizeDidChange));
  return v0;
}

uint64_t SharingOptionsViewModel.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v1 = v0 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__contentSize;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BF0C8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__collaborationOptionsGroups;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549BF0E0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_20D618880(*(_QWORD *)(v0 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_userDidChangeOption));
  sub_20D618880(*(_QWORD *)(v0 + OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel_contentSizeDidChange));
  return swift_deallocClassInstance();
}

uint64_t sub_20D6337FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for SharingOptionsViewModel();
  result = sub_20D634BF0();
  *a1 = result;
  return result;
}

uint64_t _s14CloudSharingUI0B16OptionsViewModelC018collaborationShareD013layoutMargins19userDidChangeOption011contentSizelM0ACSo016_SWCollaborationhD0CSg_05SwiftC010EdgeInsetsVySS_SSSbAJtcSgySo6CGSizeVcSgtcfC_0(id a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, double a8, double a9)
{
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t, uint64_t, uint64_t, char, unint64_t);
  uint64_t v27;

  if (!a1)
  {
    v22 = (_QWORD *)swift_allocObject();
    v22[2] = 0;
    v22[3] = 0;
    v22[4] = a2;
    v22[5] = a3;
    sub_20D6187C4(a2);
    v26 = sub_20D61A3E4;
LABEL_6:
    v25 = MEMORY[0x24BEE4AF8];
    goto LABEL_7;
  }
  v18 = objc_msgSend(a1, sel_summary);
  v19 = sub_20D635190();
  v21 = v20;

  v22 = (_QWORD *)swift_allocObject();
  v22[2] = v19;
  v22[3] = v21;
  v22[4] = a2;
  v22[5] = a3;
  sub_20D6187C4(a2);
  v23 = objc_msgSend(a1, sel_optionsGroups);
  if (!v23)
  {
    v26 = sub_20D61AFE4;
    goto LABEL_6;
  }
  v24 = v23;
  sub_20D61A578(0, (unint64_t *)&qword_2549BDDB8);
  v25 = sub_20D6351CC();

  v26 = sub_20D61AFE4;
LABEL_7:
  type metadata accessor for SharingOptionsViewModel();
  v27 = swift_allocObject();
  swift_retain();
  SharingOptionsViewModel.init(collaborationOptionsGroups:layoutMargins:userDidChangeOption:contentSizeDidChange:)(v25, (uint64_t)v26, (uint64_t)v22, a4, a5, a6, a7, a8, a9);
  sub_20D618880(a2);
  swift_release();

  return v27;
}

uint64_t sub_20D633A18@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 24);
  *a2 = *(_QWORD *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_20D633A64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D62EC14(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__contentSize, &qword_2549BF0C8);
}

uint64_t sub_20D633A88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20D62EC80(a1, a2, a3, a4, &qword_2549BF0D0, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__contentSize, &qword_2549BF0C8);
}

uint64_t sub_20D633AB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_20D62EC14(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__collaborationOptionsGroups, &qword_2549BF0E0);
}

uint64_t sub_20D633AD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_20D62EC80(a1, a2, a3, a4, &qword_2549BF0E8, (uint64_t)&OBJC_IVAR____TtC14CloudSharingUI23SharingOptionsViewModel__collaborationOptionsGroups, &qword_2549BF0E0);
}

uint64_t sub_20D633B04()
{
  return type metadata accessor for SharingOptionsViewModel();
}

uint64_t type metadata accessor for SharingOptionsViewModel()
{
  uint64_t result;

  result = qword_2549BF120;
  if (!qword_2549BF120)
    return swift_getSingletonMetadata();
  return result;
}

void sub_20D633B48()
{
  unint64_t v0;
  unint64_t v1;

  sub_20D633CC4();
  if (v0 <= 0x3F)
  {
    sub_20D633D18();
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for SharingOptionsViewModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SharingOptionsViewModel.sourceAppBundleID.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.sourceAppBundleID.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.sourceAppBundleID.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.contentSize.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.contentSize.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.contentSize.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.$contentSize.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.$contentSize.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.$contentSize.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.collaborationOptionsGroups.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.collaborationOptionsGroups.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.collaborationOptionsGroups.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.$collaborationOptionsGroups.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.$collaborationOptionsGroups.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.$collaborationOptionsGroups.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.__allocating_init(collaborationOptionsGroups:layoutMargins:userDidChangeOption:contentSizeDidChange:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 248))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.__allocating_init(collaborationOptionsGroups:userDidChangeOption:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 256))();
}

uint64_t dispatch thunk of SharingOptionsViewModel.setSourceAppBundleID(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

void sub_20D633CC4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2549BF130)
  {
    type metadata accessor for CGSize(255);
    v0 = sub_20D634C44();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2549BF130);
  }
}

void sub_20D633D18()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2549BF138[0])
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549BF0F0);
    v0 = sub_20D634C44();
    if (!v1)
      atomic_store(v0, qword_2549BF138);
  }
}

ValueMetadata *type metadata accessor for SharingOptionsViewModel.UserAction()
{
  return &type metadata for SharingOptionsViewModel.UserAction;
}

id AddressingViewFactory.viewController.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR____TtC14CloudSharingUI21AddressingViewFactory_viewController);
}

id AddressingViewFactory.__allocating_init(headerImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:userDidClickPrimaryButton:userDidClickSecondaryButton:userDidClickShowContactPicker:userDidChangeAddresses:)(uint64_t a1, unint64_t a2, void *a3, unint64_t a4, void *a5, unint64_t a6, void *a7, unint64_t a8, __int128 a9, __int128 a10, void *a11, unint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  objc_class *v20;
  id v23;
  id v24;

  v23 = objc_allocWithZone(v20);
  v24 = sub_20D634688(a1, a2, a3, a4, a5, a6, a7, a8, (void *)a9, *((unint64_t *)&a9 + 1), (void *)a10, *((unint64_t *)&a10 + 1), a11, a12, a13, a14, a15, a16, a17,
          a18,
          a19,
          a20);
  sub_20D618880(a19);
  sub_20D618880(a17);
  sub_20D618880(a15);
  sub_20D618880(a13);
  sub_20D62FC54(a1, a2);
  return v24;
}

id AddressingViewFactory.init(headerImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:userDidClickPrimaryButton:userDidClickSecondaryButton:userDidClickShowContactPicker:userDidChangeAddresses:)(uint64_t a1, unint64_t a2, void *a3, unint64_t a4, void *a5, unint64_t a6, void *a7, unint64_t a8, void *a9, unint64_t a10, void *a11, unint64_t a12, void *a13, unint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  id v23;

  v23 = sub_20D634688(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
          a20,
          a21,
          a22);
  sub_20D618880(a21);
  sub_20D618880(a19);
  sub_20D618880(a17);
  sub_20D618880(a15);
  sub_20D62FC54(a1, a2);
  return v23;
}

uint64_t sub_20D6342B0(uint64_t a1, unint64_t a2, void *a3, unint64_t a4, void *a5, unint64_t a6, void *a7, unint64_t a8, void *a9, unint64_t a10, void *a11, unint64_t a12, void *a13, unint64_t a14)
{
  return sub_20D630468(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14);
}

void sub_20D634508(void *a1, void *a2)
{
  sub_20D62FCF0(a1, a2);
}

id AddressingViewFactory.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void AddressingViewFactory.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AddressingViewFactory.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AddressingViewFactory();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_20D634688(uint64_t a1, unint64_t a2, void *a3, unint64_t a4, void *a5, unint64_t a6, void *a7, unint64_t a8, void *a9, unint64_t a10, void *a11, unint64_t a12, void *a13, unint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  void *v22;
  void *v23;
  char *v26;
  uint64_t v27;
  objc_super v36;
  uint64_t (*v37)();
  uint64_t v38;
  char v39;

  v23 = v22;
  type metadata accessor for AddressingViewModel();
  swift_allocObject();
  v26 = v23;
  sub_20D634968(a1, a2);
  sub_20D6187C4(a15);
  sub_20D6187C4(a17);
  sub_20D6187C4(a19);
  sub_20D6187C4(a21);
  v27 = AddressingViewModel.init(headerImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:userDidClickPrimaryButton:userDidClickSecondaryButton:userDidClickShowContactPicker:userDidChangeAddresses:)(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
          a20,
          a21,
          a22);
  *(_QWORD *)&v26[OBJC_IVAR____TtC14CloudSharingUI21AddressingViewFactory_viewModel] = v27;
  v37 = sub_20D632A2C;
  v38 = v27;
  v39 = 0;
  objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549BF2A0));
  swift_retain();
  *(_QWORD *)&v26[OBJC_IVAR____TtC14CloudSharingUI21AddressingViewFactory_viewController] = sub_20D634E0C();

  v36.receiver = v26;
  v36.super_class = (Class)type metadata accessor for AddressingViewFactory();
  return objc_msgSendSuper2(&v36, sel_init);
}

uint64_t type metadata accessor for AddressingViewFactory()
{
  return objc_opt_self();
}

uint64_t method lookup function for AddressingViewFactory()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AddressingViewFactory.__allocating_init(headerImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:userDidClickPrimaryButton:userDidClickSecondaryButton:userDidClickShowContactPicker:userDidChangeAddresses:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of AddressingViewFactory.update(headerImageData:headerTitle:loadingText:supplementaryText:userInfoText:primaryButtonText:secondaryButtonText:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of AddressingViewFactory.addAddress(from:contactProperty:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t sub_20D6348F8()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_20D634920()
{
  uint64_t v0;
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = (id)sub_20D6351C0();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t sub_20D634968(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_20D62FCAC(a1, a2);
  return a1;
}

uint64_t sub_20D634A70()
{
  return MEMORY[0x24BDCB8E8]();
}

uint64_t sub_20D634A7C()
{
  return MEMORY[0x24BDCB918]();
}

uint64_t sub_20D634A88()
{
  return MEMORY[0x24BDCB930]();
}

uint64_t sub_20D634A94()
{
  return MEMORY[0x24BDEAD60]();
}

uint64_t sub_20D634AA0()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_20D634AAC()
{
  return MEMORY[0x24BDCC818]();
}

uint64_t sub_20D634AB8()
{
  return MEMORY[0x24BDCC840]();
}

uint64_t sub_20D634AC4()
{
  return MEMORY[0x24BDCC848]();
}

uint64_t sub_20D634AD0()
{
  return MEMORY[0x24BDCC898]();
}

uint64_t sub_20D634ADC()
{
  return MEMORY[0x24BDEAD90]();
}

uint64_t sub_20D634AE8()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_20D634AF4()
{
  return MEMORY[0x24BDCD970]();
}

uint64_t sub_20D634B00()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_20D634B0C()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_20D634B18()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_20D634B24()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_20D634B30()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_20D634B3C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_20D634B48()
{
  return MEMORY[0x24BEE5BF8]();
}

uint64_t sub_20D634B54()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_20D634B60()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_20D634B6C()
{
  return MEMORY[0x24BEE5C48]();
}

uint64_t sub_20D634B78()
{
  return MEMORY[0x24BEE5C50]();
}

uint64_t sub_20D634B84()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_20D634B90()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_20D634B9C()
{
  return MEMORY[0x24BE17D08]();
}

uint64_t sub_20D634BA8()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_20D634BB4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_20D634BC0()
{
  return MEMORY[0x24BEBBEC0]();
}

uint64_t sub_20D634BCC()
{
  return MEMORY[0x24BEBCB48]();
}

uint64_t sub_20D634BD8()
{
  return MEMORY[0x24BEBCB58]();
}

uint64_t sub_20D634BE4()
{
  return MEMORY[0x24BDB9B40]();
}

uint64_t sub_20D634BF0()
{
  return MEMORY[0x24BDB9C48]();
}

uint64_t sub_20D634BFC()
{
  return MEMORY[0x24BDB9E98]();
}

uint64_t sub_20D634C08()
{
  return MEMORY[0x24BDB9EA0]();
}

uint64_t sub_20D634C14()
{
  return MEMORY[0x24BDB9EA8]();
}

uint64_t sub_20D634C20()
{
  return MEMORY[0x24BDB9EC0]();
}

uint64_t sub_20D634C2C()
{
  return MEMORY[0x24BDB9EC8]();
}

uint64_t sub_20D634C38()
{
  return MEMORY[0x24BDB9ED0]();
}

uint64_t sub_20D634C44()
{
  return MEMORY[0x24BDB9EF0]();
}

uint64_t sub_20D634C50()
{
  return MEMORY[0x24BDBA0E8]();
}

uint64_t sub_20D634C5C()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_20D634C68()
{
  return MEMORY[0x24BDEAF80]();
}

uint64_t sub_20D634C74()
{
  return MEMORY[0x24BDEAF98]();
}

uint64_t sub_20D634C80()
{
  return MEMORY[0x24BDEAFA8]();
}

uint64_t sub_20D634C8C()
{
  return MEMORY[0x24BDEB060]();
}

uint64_t sub_20D634C98()
{
  return MEMORY[0x24BDEB230]();
}

uint64_t sub_20D634CA4()
{
  return MEMORY[0x24BDEB3E0]();
}

uint64_t sub_20D634CB0()
{
  return MEMORY[0x24BDEB418]();
}

uint64_t sub_20D634CBC()
{
  return MEMORY[0x24BDEB560]();
}

uint64_t sub_20D634CC8()
{
  return MEMORY[0x24BDEB790]();
}

uint64_t sub_20D634CD4()
{
  return MEMORY[0x24BDEBDE0]();
}

uint64_t sub_20D634CE0()
{
  return MEMORY[0x24BDEBDF0]();
}

uint64_t sub_20D634CEC()
{
  return MEMORY[0x24BDEBE00]();
}

uint64_t sub_20D634CF8()
{
  return MEMORY[0x24BDEC120]();
}

uint64_t sub_20D634D04()
{
  return MEMORY[0x24BDEC348]();
}

uint64_t sub_20D634D10()
{
  return MEMORY[0x24BDEC358]();
}

uint64_t sub_20D634D1C()
{
  return MEMORY[0x24BDEC4E0]();
}

uint64_t sub_20D634D28()
{
  return MEMORY[0x24BDEC970]();
}

uint64_t sub_20D634D34()
{
  return MEMORY[0x24BDEC998]();
}

uint64_t sub_20D634D40()
{
  return MEMORY[0x24BDECF50]();
}

uint64_t sub_20D634D4C()
{
  return MEMORY[0x24BDED3C0]();
}

uint64_t sub_20D634D58()
{
  return MEMORY[0x24BDEDB60]();
}

uint64_t sub_20D634D64()
{
  return MEMORY[0x24BDEDEE8]();
}

uint64_t sub_20D634D70()
{
  return MEMORY[0x24BDEDEF8]();
}

uint64_t sub_20D634D7C()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_20D634D88()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_20D634D94()
{
  return MEMORY[0x24BDEE128]();
}

uint64_t sub_20D634DA0()
{
  return MEMORY[0x24BDEE130]();
}

uint64_t sub_20D634DAC()
{
  return MEMORY[0x24BDEE468]();
}

uint64_t sub_20D634DB8()
{
  return MEMORY[0x24BDEE478]();
}

uint64_t sub_20D634DC4()
{
  return MEMORY[0x24BDEE4E0]();
}

uint64_t sub_20D634DD0()
{
  return MEMORY[0x24BDEE4F8]();
}

uint64_t sub_20D634DDC()
{
  return MEMORY[0x24BDEE608]();
}

uint64_t sub_20D634DE8()
{
  return MEMORY[0x24BDEE730]();
}

uint64_t sub_20D634DF4()
{
  return MEMORY[0x24BDEEA50]();
}

uint64_t sub_20D634E00()
{
  return MEMORY[0x24BDEEF78]();
}

uint64_t sub_20D634E0C()
{
  return MEMORY[0x24BDEF1D0]();
}

uint64_t sub_20D634E18()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_20D634E24()
{
  return MEMORY[0x24BDEFEE0]();
}

uint64_t sub_20D634E30()
{
  return MEMORY[0x24BDEFEF8]();
}

uint64_t sub_20D634E3C()
{
  return MEMORY[0x24BDF0EC0]();
}

uint64_t sub_20D634E48()
{
  return MEMORY[0x24BDF0ED0]();
}

uint64_t sub_20D634E54()
{
  return MEMORY[0x24BDF0EE0]();
}

uint64_t sub_20D634E60()
{
  return MEMORY[0x24BDF0EF0]();
}

uint64_t sub_20D634E6C()
{
  return MEMORY[0x24BDF0F00]();
}

uint64_t sub_20D634E78()
{
  return MEMORY[0x24BDF0F10]();
}

uint64_t sub_20D634E84()
{
  return MEMORY[0x24BDF0F18]();
}

uint64_t sub_20D634E90()
{
  return MEMORY[0x24BDF0F28]();
}

uint64_t sub_20D634E9C()
{
  return MEMORY[0x24BDF13A0]();
}

uint64_t sub_20D634EA8()
{
  return MEMORY[0x24BDF1430]();
}

uint64_t sub_20D634EB4()
{
  return MEMORY[0x24BDF1468]();
}

uint64_t sub_20D634EC0()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_20D634ECC()
{
  return MEMORY[0x24BDF1580]();
}

uint64_t sub_20D634ED8()
{
  return MEMORY[0x24BDF1600]();
}

uint64_t sub_20D634EE4()
{
  return MEMORY[0x24BDF16D8]();
}

uint64_t sub_20D634EF0()
{
  return MEMORY[0x24BDF1A00]();
}

uint64_t sub_20D634EFC()
{
  return MEMORY[0x24BDF1BE8]();
}

uint64_t sub_20D634F08()
{
  return MEMORY[0x24BDF1D08]();
}

uint64_t sub_20D634F14()
{
  return MEMORY[0x24BDF1DC8]();
}

uint64_t sub_20D634F20()
{
  return MEMORY[0x24BDF1FC0]();
}

uint64_t sub_20D634F2C()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_20D634F38()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_20D634F44()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_20D634F50()
{
  return MEMORY[0x24BDF2118]();
}

uint64_t sub_20D634F5C()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_20D634F68()
{
  return MEMORY[0x24BDF27F0]();
}

uint64_t sub_20D634F74()
{
  return MEMORY[0x24BDF2880]();
}

uint64_t sub_20D634F80()
{
  return MEMORY[0x24BDF2C68]();
}

uint64_t sub_20D634F8C()
{
  return MEMORY[0x24BDF2C88]();
}

uint64_t sub_20D634F98()
{
  return MEMORY[0x24BDF3390]();
}

uint64_t sub_20D634FA4()
{
  return MEMORY[0x24BDF3470]();
}

uint64_t sub_20D634FB0()
{
  return MEMORY[0x24BDF35B0]();
}

uint64_t sub_20D634FBC()
{
  return MEMORY[0x24BDF38E0]();
}

uint64_t sub_20D634FC8()
{
  return MEMORY[0x24BDF3BF8]();
}

uint64_t sub_20D634FD4()
{
  return MEMORY[0x24BDF3D10]();
}

uint64_t sub_20D634FE0()
{
  return MEMORY[0x24BDF3D88]();
}

uint64_t sub_20D634FEC()
{
  return MEMORY[0x24BDF3E08]();
}

uint64_t sub_20D634FF8()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_20D635004()
{
  return MEMORY[0x24BDF3F80]();
}

uint64_t sub_20D635010()
{
  return MEMORY[0x24BDF4280]();
}

uint64_t sub_20D63501C()
{
  return MEMORY[0x24BDF4290]();
}

uint64_t sub_20D635028()
{
  return MEMORY[0x24BDF42A8]();
}

uint64_t sub_20D635034()
{
  return MEMORY[0x24BDF42B0]();
}

uint64_t sub_20D635040()
{
  return MEMORY[0x24BDF4330]();
}

uint64_t sub_20D63504C()
{
  return MEMORY[0x24BDF4340]();
}

uint64_t sub_20D635058()
{
  return MEMORY[0x24BDF4380]();
}

uint64_t sub_20D635064()
{
  return MEMORY[0x24BDF4518]();
}

uint64_t sub_20D635070()
{
  return MEMORY[0x24BDF4678]();
}

uint64_t sub_20D63507C()
{
  return MEMORY[0x24BDF47B0]();
}

uint64_t sub_20D635088()
{
  return MEMORY[0x24BDF47B8]();
}

uint64_t sub_20D635094()
{
  return MEMORY[0x24BDF47E0]();
}

uint64_t sub_20D6350A0()
{
  return MEMORY[0x24BDF49B8]();
}

uint64_t sub_20D6350AC()
{
  return MEMORY[0x24BDF4AB8]();
}

uint64_t sub_20D6350B8()
{
  return MEMORY[0x24BDF4BE0]();
}

uint64_t sub_20D6350C4()
{
  return MEMORY[0x24BDF4C00]();
}

uint64_t sub_20D6350D0()
{
  return MEMORY[0x24BDF4C08]();
}

uint64_t sub_20D6350DC()
{
  return MEMORY[0x24BDF4C18]();
}

uint64_t sub_20D6350E8()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_20D6350F4()
{
  return MEMORY[0x24BDF5118]();
}

uint64_t sub_20D635100()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_20D63510C()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_20D635118()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_20D635124()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_20D635130()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_20D63513C()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_20D635148()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_20D635154()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_20D635160()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_20D63516C()
{
  return MEMORY[0x24BDCF9F0]();
}

uint64_t sub_20D635178()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_20D635184()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_20D635190()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_20D63519C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_20D6351A8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_20D6351B4()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_20D6351C0()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_20D6351CC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_20D6351D8()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_20D6351E4()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_20D6351F0()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_20D6351FC()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_20D635208()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_20D635214()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_20D635220()
{
  return MEMORY[0x24BEE6940]();
}

uint64_t sub_20D63522C()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_20D635238()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_20D635244()
{
  return MEMORY[0x24BDCFC80]();
}

uint64_t sub_20D635250()
{
  return MEMORY[0x24BDCFC90]();
}

uint64_t sub_20D63525C()
{
  return MEMORY[0x24BDCFC98]();
}

uint64_t sub_20D635268()
{
  return MEMORY[0x24BDCFCA0]();
}

uint64_t sub_20D635274()
{
  return MEMORY[0x24BEE14D8]();
}

uint64_t sub_20D635280()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_20D63528C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_20D635298()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_20D6352A4()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_20D6352B0()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_20D6352BC()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_20D6352C8()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_20D6352D4()
{
  return MEMORY[0x24BEBD030]();
}

uint64_t sub_20D6352E0()
{
  return MEMORY[0x24BEBD050]();
}

uint64_t sub_20D6352EC()
{
  return MEMORY[0x24BEBD080]();
}

uint64_t sub_20D6352F8()
{
  return MEMORY[0x24BEBD088]();
}

uint64_t sub_20D635304()
{
  return MEMORY[0x24BEBD100]();
}

uint64_t sub_20D635310()
{
  return MEMORY[0x24BEBD140]();
}

uint64_t sub_20D63531C()
{
  return MEMORY[0x24BEBD168]();
}

uint64_t sub_20D635328()
{
  return MEMORY[0x24BEBD190]();
}

uint64_t sub_20D635334()
{
  return MEMORY[0x24BEBD1C0]();
}

uint64_t sub_20D635340()
{
  return MEMORY[0x24BEBD1F8]();
}

uint64_t sub_20D63534C()
{
  return MEMORY[0x24BEBD208]();
}

uint64_t sub_20D635358()
{
  return MEMORY[0x24BEBD210]();
}

uint64_t sub_20D635364()
{
  return MEMORY[0x24BEBD218]();
}

uint64_t sub_20D635370()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_20D63537C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_20D635388()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_20D635394()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_20D6353A0()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_20D6353AC()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_20D6353B8()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_20D6353C4()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_20D6353D0()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_20D6353DC()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_20D6353E8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_20D6353F4()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_20D635400()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_20D63540C()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_20D635418()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_20D635424()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_20D635430()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_20D63543C()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_20D635448()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_20D635454()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_20D635460()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_20D63546C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_20D635478()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_20D635484()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_20D635490()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_20D63549C()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_20D6354A8()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_20D6354B4()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_20D6354C0()
{
  return MEMORY[0x24BEE42C8]();
}

uint64_t sub_20D6354CC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_20D6354D8()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_20D6354E4()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_20D6354F0()
{
  return MEMORY[0x24BEE4328]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t CKErrorUserInfoClasses()
{
  return MEMORY[0x24BDB8EC8]();
}

uint64_t CKSharingSummaryStringFromOptionsGroups()
{
  return MEMORY[0x24BDB8FA0]();
}

uint64_t CSLogForCategory()
{
  return MEMORY[0x24BE17D10]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
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

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
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

