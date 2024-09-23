void sub_10000371C()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  uint64_t v47;
  Class isa;
  id v49;
  id v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  id v54;
  _OWORD v55[2];
  _QWORD v56[4];

  v1 = v0;
  v2 = sub_100004890(&qword_100015310);
  __chkstk_darwin(v2);
  v4 = (char *)&v53 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for Logger(0, v5);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (*(uint64_t (**)(char *, char *, uint64_t))(v7 + 16))(v9, &v1[OBJC_IVAR____TtC16FinanceUIService38TransactionPickerServiceViewController_logger], v6);
  v11 = Logger.logObject.getter(v10);
  v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "TransactionPickerViewController - someone requested transaction picker", v13, 2u);
    swift_slowDealloc(v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  sub_100003C60((uint64_t)v4);
  v14 = objc_allocWithZone((Class)sub_100004890(&qword_100015318));
  v15 = (void *)UIHostingController.init(rootView:)(v4);
  v16 = OBJC_IVAR____TtC16FinanceUIService38TransactionPickerServiceViewController_hostingController;
  v17 = *(void **)&v1[OBJC_IVAR____TtC16FinanceUIService38TransactionPickerServiceViewController_hostingController];
  *(_QWORD *)&v1[OBJC_IVAR____TtC16FinanceUIService38TransactionPickerServiceViewController_hostingController] = v15;
  v18 = v15;

  v19 = *(void **)&v1[v16];
  if (v19)
  {
    v20 = objc_msgSend(v19, "view");
    if (v20)
    {
      v21 = v20;
      objc_msgSend(v1, "addChildViewController:", v18);
      v22 = objc_msgSend(v1, "view");
      if (v22)
      {
        v23 = v22;
        objc_msgSend(v22, "addSubview:", v21);

        objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        v24 = sub_100004890(&qword_100015320);
        v25 = swift_allocObject(v24, 64, 7);
        *(_OWORD *)(v25 + 16) = xmmword_10000CF10;
        v26 = objc_msgSend(v21, "topAnchor");
        v27 = objc_msgSend(v1, "view");
        if (v27)
        {
          v28 = v27;
          v29 = objc_msgSend(v27, "topAnchor");

          v30 = objc_msgSend(v26, "constraintEqualToAnchor:", v29);
          *(_QWORD *)(v25 + 32) = v30;
          v31 = objc_msgSend(v21, "leadingAnchor");
          v32 = objc_msgSend(v1, "view");
          if (v32)
          {
            v33 = v32;
            v34 = objc_msgSend(v32, "leadingAnchor");

            v35 = objc_msgSend(v31, "constraintEqualToAnchor:", v34);
            *(_QWORD *)(v25 + 40) = v35;
            v36 = objc_msgSend(v21, "trailingAnchor");
            v37 = objc_msgSend(v1, "view");
            if (v37)
            {
              v38 = v37;
              v39 = objc_msgSend(v37, "trailingAnchor");

              v40 = objc_msgSend(v36, "constraintEqualToAnchor:", v39);
              *(_QWORD *)(v25 + 48) = v40;
              v41 = objc_msgSend(v21, "bottomAnchor");
              v42 = objc_msgSend(v1, "view");
              if (v42)
              {
                v43 = v42;
                v44 = (void *)objc_opt_self(NSLayoutConstraint);
                v45 = objc_msgSend(v43, "bottomAnchor");

                v46 = objc_msgSend(v41, "constraintEqualToAnchor:", v45);
                *(_QWORD *)(v25 + 56) = v46;
                v56[0] = v25;
                specialized Array._endMutation()();
                v47 = v56[0];
                sub_100004E28();
                isa = Array._bridgeToObjectiveC()().super.isa;
                swift_bridgeObjectRelease(v47);
                objc_msgSend(v44, "activateConstraints:", isa);

                return;
              }
              goto LABEL_24;
            }
LABEL_23:
            __break(1u);
LABEL_24:
            __break(1u);
            return;
          }
LABEL_22:
          __break(1u);
          goto LABEL_23;
        }
      }
      else
      {
        __break(1u);
      }
      __break(1u);
      goto LABEL_22;
    }
  }
  v49 = objc_msgSend(v1, "_remoteViewControllerProxy");
  if (v49)
  {
    v50 = v49;
    _bridgeAnyObjectToAny(_:)(v55, v49);
    swift_unknownObjectRelease(v50);
  }
  else
  {
    memset(v55, 0, sizeof(v55));
  }
  sub_100004A08((uint64_t)v55, (uint64_t)v56);
  if (v56[3])
  {
    v51 = sub_100004890(&qword_100015300);
    if ((swift_dynamicCast(&v54, v56, (char *)&type metadata for Any + 8, v51, 6) & 1) != 0)
    {
      v52 = v54;
      objc_msgSend(v54, "cancelled");
      swift_unknownObjectRelease(v52);
    }

  }
  else
  {

    sub_100004A50((uint64_t)v56);
  }
}

uint64_t sub_100003C60@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v37 = a1;
  v1 = sub_100004890(&qword_1000152C8);
  __chkstk_darwin(v1);
  v32 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = sub_100004890(&qword_1000152D0);
  v33 = *(_QWORD *)(v36 - 8);
  __chkstk_darwin(v36);
  v4 = (char *)&v32 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = sub_100004890(&qword_1000152D8);
  __chkstk_darwin(v35);
  v6 = (char *)&v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for DataRestrictedTransactionPickerView(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for FinanceStore.DataType(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for FinanceStore(0);
  v15 = static FinanceStore.shared.getter();
  (*(void (**)(char *, _QWORD, uint64_t))(v12 + 104))(v14, enum case for FinanceStore.DataType.financialData(_:), v11);
  v16 = FinanceStore.isDataRestricted(for:)(v14);
  swift_release(v15);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  if ((v16 & 1) != 0)
  {
    v17 = swift_allocObject(&unk_100010908, 24, 7);
    swift_unknownObjectWeakInit(v17 + 16, v34);
    DataRestrictedTransactionPickerView.init(cancelAction:)(sub_1000049F0, v17);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v6, v10, v7);
    swift_storeEnumTagMultiPayload(v6, v35, 0);
    v18 = sub_1000048FC(&qword_1000152E8, (uint64_t (*)(uint64_t))&type metadata accessor for DataRestrictedTransactionPickerView, (uint64_t)&protocol conformance descriptor for DataRestrictedTransactionPickerView);
    v19 = sub_10000493C();
    _ConditionalContent<>.init(storage:)(v6, v7, v36, v18, v19);
    return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }
  else
  {
    v21 = type metadata accessor for AppProtectionShieldState(0);
    v22 = v32;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v32, 1, 1, v21);
    v23 = swift_allocObject(&unk_1000108E0, 24, 7);
    v24 = v34;
    *(_QWORD *)(v23 + 16) = v34;
    v25 = type metadata accessor for TransactionPickerView(0);
    v26 = sub_1000048FC(&qword_1000152E0, (uint64_t (*)(uint64_t))&type metadata accessor for TransactionPickerView, (uint64_t)&protocol conformance descriptor for TransactionPickerView);
    v27 = v24;
    AppProtectionShieldView.init(forceShieldState:shieldType:dismissAction:showAuthOnAppear:content:)(v22, 1, 0, 0, 1, sub_1000048F4, v23, v25, v26);
    v28 = v33;
    v29 = v36;
    (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v6, v4, v36);
    swift_storeEnumTagMultiPayload(v6, v35, 1);
    v30 = sub_1000048FC(&qword_1000152E8, (uint64_t (*)(uint64_t))&type metadata accessor for DataRestrictedTransactionPickerView, (uint64_t)&protocol conformance descriptor for DataRestrictedTransactionPickerView);
    v31 = sub_10000493C();
    _ConditionalContent<>.init(storage:)(v6, v7, v29, v30, v31);
    return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v4, v29);
  }
}

uint64_t sub_100003FF8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = swift_allocObject(&unk_100010908, 24, 7);
  swift_unknownObjectWeakInit(v2 + 16, a1);
  v3 = swift_allocObject(&unk_100010908, 24, 7);
  swift_unknownObjectWeakInit(v3 + 16, a1);
  return TransactionPickerView.init(confirmAction:cancelAction:)(sub_100004A90, v2, sub_1000049F0, v3);
}

void sub_100004084(uint64_t a1, uint64_t a2)
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
  void *Strong;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  _QWORD *v19;
  int64_t v20;
  int v21;
  int v22;
  char v23;
  char v24;
  void (*v25)(char *, int64_t, uint64_t);
  char *v26;
  char *v27;
  char *v28;
  unint64_t v29;
  unint64_t v30;
  int64_t v31;
  uint64_t v32;
  char v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  char *v41;
  char *v42;
  _OWORD v43[2];
  char v44[24];
  __int128 v45;
  __int128 v46;

  v4 = type metadata accessor for InternalTransaction(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  v41 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __chkstk_darwin(v6);
  v40 = (char *)&v35 - v9;
  __chkstk_darwin(v8);
  v39 = (char *)&v35 - v10;
  v11 = type metadata accessor for Transaction(0);
  v37 = *(_QWORD *)(v11 - 8);
  v38 = v11;
  __chkstk_darwin(v11);
  v42 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  a2 += 16;
  swift_beginAccess(a2, v44, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(a2);
  if (!Strong)
  {
    v45 = 0u;
    v46 = 0u;
LABEL_20:
    sub_100004A50((uint64_t)&v45);
    return;
  }
  v14 = Strong;
  v15 = objc_msgSend(Strong, "_remoteViewControllerProxy");

  if (v15)
  {
    _bridgeAnyObjectToAny(_:)(v43, v15);
    swift_unknownObjectRelease(v15);
  }
  else
  {
    memset(v43, 0, sizeof(v43));
  }
  sub_100004A08((uint64_t)v43, (uint64_t)&v45);
  if (!*((_QWORD *)&v46 + 1))
    goto LABEL_20;
  v16 = sub_100004890(&qword_100015300);
  if ((swift_dynamicCast(v43, &v45, (char *)&type metadata for Any + 8, v16, 6) & 1) != 0)
  {
    v17 = *(void **)&v43[0];
    v18 = *(_QWORD *)(a1 + 16);
    v19 = &_swiftEmptyArrayStorage;
    if (v18)
    {
      v35 = *(void **)&v43[0];
      *(_QWORD *)&v45 = &_swiftEmptyArrayStorage;
      sub_100004A98(0, v18, 0);
      v20 = sub_100004C94(a1);
      v22 = v21;
      v24 = v23 & 1;
      v36 = a1 + 56;
      while ((v20 & 0x8000000000000000) == 0 && v20 < 1 << *(_BYTE *)(a1 + 32))
      {
        if (((*(_QWORD *)(v36 + (((unint64_t)v20 >> 3) & 0xFFFFFFFFFFFFF8)) >> v20) & 1) == 0)
          goto LABEL_24;
        if (*(_DWORD *)(a1 + 36) != v22)
          goto LABEL_25;
        v25 = *(void (**)(char *, int64_t, uint64_t))(v5 + 16);
        v26 = v39;
        v25(v39, *(_QWORD *)(a1 + 48) + *(_QWORD *)(v5 + 72) * v20, v4);
        v27 = v40;
        (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v40, v26, v4);
        v28 = v41;
        v25(v41, (int64_t)v27, v4);
        Transaction.init(internalTransaction:)(v28);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v27, v4);
        v19 = (_QWORD *)v45;
        if ((swift_isUniquelyReferenced_nonNull_native(v45) & 1) == 0)
        {
          sub_100004A98(0, v19[2] + 1, 1);
          v19 = (_QWORD *)v45;
        }
        v30 = v19[2];
        v29 = v19[3];
        if (v30 >= v29 >> 1)
        {
          sub_100004A98(v29 > 1, v30 + 1, 1);
          v19 = (_QWORD *)v45;
        }
        v19[2] = v30 + 1;
        (*(void (**)(unint64_t, char *, uint64_t))(v37 + 32))((unint64_t)v19+ ((*(unsigned __int8 *)(v37 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v37 + 80))+ *(_QWORD *)(v37 + 72) * v30, v42, v38);
        *(_QWORD *)&v45 = v19;
        v31 = sub_100004D34(v20, v22, v24 & 1, a1);
        v20 = v31;
        v22 = v32;
        v24 = v33 & 1;
        if (!--v18)
        {
          sub_100004E18(v31, v32, v33 & 1);
          v17 = v35;
          goto LABEL_21;
        }
      }
      __break(1u);
LABEL_24:
      __break(1u);
LABEL_25:
      __break(1u);
    }
    else
    {
LABEL_21:
      v34 = (void *)Array<A>.xpcValue.getter(v19);
      swift_bridgeObjectRelease(v19);
      objc_msgSend(v17, "foundWithTransactions:", v34);
      swift_unknownObjectRelease(v17);

    }
  }
}

uint64_t sub_100004444(uint64_t a1)
{
  uint64_t v1;
  void *Strong;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t result;
  id v7;
  id v8[2];
  __int128 v9;
  _BYTE v10[24];
  __int128 v11;
  __int128 v12;

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v10, 0, 0);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v1);
  if (!Strong)
  {
    v11 = 0u;
    v12 = 0u;
    return sub_100004A50((uint64_t)&v11);
  }
  v3 = Strong;
  v4 = objc_msgSend(Strong, "_remoteViewControllerProxy");

  if (v4)
  {
    _bridgeAnyObjectToAny(_:)(v8, v4);
    swift_unknownObjectRelease(v4);
  }
  else
  {
    *(_OWORD *)v8 = 0u;
    v9 = 0u;
  }
  sub_100004A08((uint64_t)v8, (uint64_t)&v11);
  if (!*((_QWORD *)&v12 + 1))
    return sub_100004A50((uint64_t)&v11);
  v5 = sub_100004890(&qword_100015300);
  result = swift_dynamicCast(v8, &v11, (char *)&type metadata for Any + 8, v5, 6);
  if ((result & 1) != 0)
  {
    v7 = v8[0];
    objc_msgSend(v8[0], "cancelled");
    return swift_unknownObjectRelease(v7);
  }
  return result;
}

id sub_100004544(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  char *v6;
  NSString v7;
  id v8;
  objc_super v10;

  v6 = v3;
  Logger.init(subsystem:category:)(0xD000000000000014, 0x800000010000D570, 0xD000000000000010, 0x800000010000CF00);
  *(_QWORD *)&v6[OBJC_IVAR____TtC16FinanceUIService38TransactionPickerServiceViewController_hostingController] = 0;

  if (a2)
  {
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v7 = 0;
  }
  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for TransactionPickerServiceViewController(0);
  v8 = objc_msgSendSuper2(&v10, "initWithNibName:bundle:", v7, a3);

  return v8;
}

id sub_100004754()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TransactionPickerServiceViewController(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000047D8()
{
  return type metadata accessor for TransactionPickerServiceViewController(0);
}

uint64_t type metadata accessor for TransactionPickerServiceViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_100015258;
  if (!qword_100015258)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TransactionPickerServiceViewController);
  return result;
}

uint64_t sub_10000481C(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v4;
  _QWORD v5[2];

  result = type metadata accessor for Logger(319, a2);
  if (v4 <= 0x3F)
  {
    v5[0] = *(_QWORD *)(result - 8) + 64;
    v5[1] = "\b";
    result = swift_updateClassMetadata2(a1, 256, 2, v5, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_100004890(uint64_t *a1)
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

uint64_t sub_1000048D0()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000048F4()
{
  uint64_t v0;

  return sub_100003FF8(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1000048FC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
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

unint64_t sub_10000493C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000152F0;
  if (!qword_1000152F0)
  {
    v1 = sub_100004988(&qword_1000152D0);
    result = swift_getWitnessTable(&protocol conformance descriptor for AppProtectionShieldView<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000152F0);
  }
  return result;
}

uint64_t sub_100004988(uint64_t *a1)
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

uint64_t sub_1000049CC()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000049F0()
{
  uint64_t v0;

  return sub_100004444(v0);
}

uint64_t sub_100004A08(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004890(&qword_1000152F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100004A50(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100004890(&qword_1000152F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100004A90(uint64_t a1)
{
  uint64_t v1;

  sub_100004084(a1, v1);
}

uint64_t sub_100004A98(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_100004AB4(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_100004AB4(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
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
  char *v21;
  char *v22;
  uint64_t v23;
  char *v24;
  unint64_t v25;
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
    v15 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  v10 = sub_100004890(&qword_100015308);
  v11 = *(_QWORD *)(type metadata accessor for Transaction(0) - 8);
  v12 = *(_QWORD *)(v11 + 72);
  v13 = *(unsigned __int8 *)(v11 + 80);
  v14 = (v13 + 32) & ~v13;
  v15 = (_QWORD *)swift_allocObject(v10, v14 + v12 * v9, v13 | 7);
  v16 = j__malloc_size(v15);
  if (!v12)
  {
    __break(1u);
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  if (v16 - v14 == 0x8000000000000000 && v12 == -1)
    goto LABEL_34;
  v15[2] = v8;
  v15[3] = 2 * ((uint64_t)(v16 - v14) / v12);
LABEL_19:
  v18 = type metadata accessor for Transaction(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (char *)v15 + v20;
  v22 = (char *)a4 + v20;
  if ((a1 & 1) != 0)
  {
    if (v15 < a4 || v21 >= &v22[*(_QWORD *)(v19 + 72) * v8])
    {
      swift_arrayInitWithTakeFrontToBack(v21, v22, v8, v18);
    }
    else if (v15 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
    goto LABEL_32;
  }
  v23 = *(_QWORD *)(v19 + 72) * v8;
  v24 = &v21[v23];
  v25 = (unint64_t)&v22[v23];
  if (v22 >= v24 || (unint64_t)v21 >= v25)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release(a4);
    return (uint64_t)v15;
  }
LABEL_36:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100004C94(uint64_t a1)
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

  v1 = *(_QWORD *)(a1 + 56);
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
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3)
    v7 = 3;
  v8 = v7 - 3;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 128;
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

int64_t sub_100004D34(int64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((a3 & 1) != 0)
    goto LABEL_20;
  v4 = result;
  if (result < 0 || (result = 1 << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4 >> 6;
  v6 = a4 + 56;
  v7 = *(_QWORD *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8)
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  v9 = v5 + 1;
  v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    v11 = *(_QWORD *)(v6 + 8 * v9);
    if (v11)
      return __clz(__rbit64(v11)) + (v9 << 6);
    v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      v11 = *(_QWORD *)(v6 + 8 * v9);
      if (v11)
        return __clz(__rbit64(v11)) + (v9 << 6);
      while (v10 - 3 != v5)
      {
        v11 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_100004E18(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

unint64_t sub_100004E28()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100015328;
  if (!qword_100015328)
  {
    v1 = objc_opt_self(NSLayoutConstraint);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_100015328);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for InstallWalletView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain(v2);
  return v3;
}

uint64_t destroy for InstallWalletView(uint64_t a1)
{
  swift_release(*(_QWORD *)(a1 + 8));
  return swift_release(*(_QWORD *)(a1 + 24));
}

uint64_t initializeWithCopy for InstallWalletView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v4;
  swift_retain(v3);
  swift_retain(v4);
  return a1;
}

uint64_t assignWithCopy for InstallWalletView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_retain(v4);
  swift_release(v5);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v6 = *(_QWORD *)(a1 + 24);
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 24) = v7;
  swift_retain(v7);
  swift_release(v6);
  return a1;
}

__n128 initializeWithTake for InstallWalletView(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for InstallWalletView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release(v4);
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v5 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_release(v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for InstallWalletView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InstallWalletView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for InstallWalletView()
{
  return &type metadata for InstallWalletView;
}

uint64_t sub_100005054(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000E61C, 1);
}

uint64_t sub_100005064@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t (*v23)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  _QWORD v31[2];
  unsigned __int8 v32;
  uint64_t v33;

  v28 = a5;
  v9 = sub_100004890(&qword_100015330);
  v26 = *(_QWORD *)(v9 - 8);
  v27 = v9;
  v10 = __chkstk_darwin(v9);
  v12 = (char *)&v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = static Color.clear.getter(v10);
  v29 = a3;
  v30 = a4;
  v13 = sub_100004890(&qword_100015338);
  State.projectedValue.getter(v31, v13);
  v14 = v31[0];
  v15 = v31[1];
  v16 = v32;
  v17 = swift_allocObject(&unk_1000109B0, 48, 7);
  *(_QWORD *)(v17 + 16) = a1;
  *(_QWORD *)(v17 + 24) = a2;
  *(_BYTE *)(v17 + 32) = a3;
  *(_QWORD *)(v17 + 40) = a4;
  swift_retain(a4);
  swift_retain(a2);
  View.installWalletAlert(isPresented:completion:)(v14, v15, v16, sub_100005264, v17, &type metadata for Color, &protocol witness table for Color);
  swift_release(v15);
  swift_release(v17);
  swift_release(v14);
  swift_release(v33);
  v18 = swift_allocObject(&unk_1000109D8, 48, 7);
  *(_QWORD *)(v18 + 16) = a1;
  *(_QWORD *)(v18 + 24) = a2;
  *(_BYTE *)(v18 + 32) = a3;
  *(_QWORD *)(v18 + 40) = a4;
  v19 = v26;
  v20 = v27;
  v21 = v28;
  (*(void (**)(uint64_t, char *, uint64_t))(v26 + 16))(v28, v12, v27);
  v22 = (_QWORD *)(v21 + *(int *)(sub_100004890(&qword_100015340) + 36));
  *v22 = 0;
  v22[1] = 0;
  v22[2] = sub_1000052BC;
  v22[3] = v18;
  v23 = *(uint64_t (**)(char *, uint64_t))(v19 + 8);
  swift_retain(a2);
  swift_retain(a4);
  return v23(v12, v20);
}

uint64_t sub_100005238()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100005250@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_100005064(*(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_BYTE *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_100005264(uint64_t result)
{
  uint64_t v1;

  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(v1 + 16))();
  return result;
}

uint64_t sub_100005290()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000052BC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_1000052E0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_100015348;
  if (!qword_100015348)
  {
    v1 = sub_100004988(&qword_100015340);
    v2[0] = &type metadata for Color;
    v2[1] = &protocol witness table for Color;
    swift_getOpaqueTypeConformance2(v2, &opaque type descriptor for <<opaque return type of View.installWalletAlert(isPresented:completion:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_100015348);
  }
  return result;
}

void sub_100005370(char a1)
{
  char *v1;
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for InstallWalletRemoteViewController(0);
  objc_msgSendSuper2(&v5, "viewWillAppear:", a1 & 1);
  v3 = *(void **)&v1[OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_hostingController];
  if (v3)
  {
    v4 = v3;
    if (objc_msgSend(v1, "isViewLoaded"))
    {
      objc_msgSend(v4, "setModalPresentationStyle:", 5);
      objc_msgSend(v1, "presentViewController:animated:completion:", v4, 0, 0);

      return;
    }

  }
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000043, 0x800000010000D750, "FinanceUIService/InstallWalletRemoteViewController.swift", 56, 2, 37, 0);
  __break(1u);
}

void sub_100005530(int a1, id a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  uint64_t v16;

  v4 = v3;
  objc_msgSend(a2, "setSwipeDismissalStyle:", 0);
  if (a3)
  {
    v7 = sub_100004890(&qword_1000153A0);
    v8 = type metadata accessor for XPCEntitlementChecker(0);
    swift_allocObject(v8, *(unsigned int *)(v8 + 48), *(unsigned __int16 *)(v8 + 52));
    v9 = a3;
    v15[3] = v8;
    v15[4] = &protocol witness table for XPCEntitlementChecker;
    v15[0] = XPCEntitlementChecker.init()();
    v10 = sub_100005E1C();
    FinanceXPCConnection.init(endpoint:entitlementChecker:)(&v16, v9, v15, v7, v10);
    v11 = v16;
    v15[0] = v16;
    FinanceXPCConnection.resume()();
    v12 = *(_QWORD *)(v4 + OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_daemonConnection);
    *(_QWORD *)(v4 + OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_daemonConnection) = v11;
    swift_retain(v11);
    swift_release(v12);
    v13 = sub_1000056B4((uint64_t)a2, v11);
    v14 = *(void **)(v4 + OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_hostingController);
    *(_QWORD *)(v4 + OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_hostingController) = v13;

    swift_release(v11);
  }
  else
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000003CLL, 0x800000010000D710, "FinanceUIService/InstallWalletRemoteViewController.swift", 56, 2, 53, 0);
    __break(1u);
  }
}

id sub_1000056B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  id result;
  void *v13;
  void (*v14)();
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;

  v3 = v2;
  v6 = swift_allocObject(&unk_100010A38, 24, 7);
  swift_unknownObjectWeakInit(v6 + 16, v3);
  v7 = swift_allocObject(&unk_100010A60, 32, 7);
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = v6;
  v18 = 1;
  swift_retain(a2);
  State.init(wrappedValue:)(&v14, &v18, &type metadata for Bool);
  v8 = (char)v14;
  v9 = v15;
  v10 = objc_allocWithZone((Class)sub_100004890(&qword_1000153B0));
  *(_QWORD *)((char *)v10 + *(_QWORD *)(qword_100015BB0 + (swift_isaMask & *v10) + 16)) = a1;
  v14 = sub_100005EB8;
  v15 = v7;
  v16 = v8;
  v17 = v9;
  swift_retain(v9);
  swift_retain(v7);
  swift_unknownObjectRetain(a1);
  v11 = (void *)UIHostingController.init(rootView:)(&v14);
  result = objc_msgSend(v11, "view");
  if (result)
  {
    v13 = result;
    objc_msgSend(result, "setBackgroundColor:", 0);

    swift_release(v9);
    swift_release(v7);
    return v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100005820(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t Strong;
  void *v4;
  void *v5;
  id v6;
  _BYTE v7[24];

  v2 = a2 + 16;
  ClientToServiceXPCConnection<>.cancelled()();
  swift_beginAccess(v2, v7, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v2);
  if (Strong)
  {
    v4 = (void *)Strong;
    v5 = *(void **)(Strong + OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_hostingController);
    v6 = v5;

    if (v5)
    {
      objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 0, 0);

    }
  }
}

uint64_t sub_100005954(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = v2 + OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_log;
  v4 = type metadata accessor for Logger(0, a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  return swift_release(*(_QWORD *)(v2
                                 + OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_daemonConnection));
}

id sub_1000059B0()
{
  char *v0;
  objc_super v2;
  uint64_t v3;

  if (*(_QWORD *)&v0[OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_daemonConnection])
  {
    v3 = *(_QWORD *)&v0[OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_daemonConnection];
    sub_100004890(&qword_1000153A0);
    sub_100005E1C();
    FinanceXPCConnection.invalidate()();
  }
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for InstallWalletRemoteViewController(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100005B1C()
{
  return type metadata accessor for InstallWalletRemoteViewController(0);
}

uint64_t type metadata accessor for InstallWalletRemoteViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_100015390;
  if (!qword_100015390)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for InstallWalletRemoteViewController);
  return result;
}

id sub_100005B60(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  char *v6;
  NSString v7;
  id v8;
  objc_super v10;

  v6 = v3;
  Logger.init(subsystem:category:)(0xD000000000000014, 0x800000010000D570, 0xD000000000000010, 0x800000010000CFE0);
  *(_QWORD *)&v6[OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_hostingController] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_daemonConnection] = 0;

  if (a2)
  {
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v7 = 0;
  }
  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for InstallWalletRemoteViewController(0);
  v8 = objc_msgSendSuper2(&v10, "initWithNibName:bundle:", v7, a3);

  return v8;
}

id sub_100005CBC(void *a1)
{
  void *v1;
  char *v3;
  id v4;
  objc_super v6;

  v3 = v1;
  Logger.init(subsystem:category:)(0xD000000000000014, 0x800000010000D570, 0xD000000000000010, 0x800000010000CFE0);
  *(_QWORD *)&v3[OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_hostingController] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16FinanceUIService33InstallWalletRemoteViewController_daemonConnection] = 0;

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for InstallWalletRemoteViewController(0);
  v4 = objc_msgSendSuper2(&v6, "initWithCoder:", a1);

  return v4;
}

uint64_t sub_100005DA4(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v4;
  _QWORD v5[3];

  result = type metadata accessor for Logger(319, a2);
  if (v4 <= 0x3F)
  {
    v5[0] = *(_QWORD *)(result - 8) + 64;
    v5[1] = "\b";
    v5[2] = "\b";
    result = swift_updateClassMetadata2(a1, 256, 3, v5, a1 + 128);
    if (!result)
      return 0;
  }
  return result;
}

unint64_t sub_100005E1C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000153A8;
  if (!qword_1000153A8)
  {
    v1 = sub_100004988(&qword_1000153A0);
    result = swift_getWitnessTable(&protocol conformance descriptor for ClientToServiceXPCConnection<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000153A8);
  }
  return result;
}

uint64_t sub_100005E68()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100005E8C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_100005EB8()
{
  uint64_t v0;

  sub_100005820(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_100005EC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  v7 = type metadata accessor for Logger(0, a2);
  v6[7] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v6[8] = v8;
  v6[9] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_100005F24, 0, 0);
}

uint64_t sub_100005F24()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;

  v2 = v0[5];
  v1 = v0[6];
  v3 = v0[4];
  Logger.init(subsystem:category:)(0xD000000000000014, 0x800000010000D570, 0xD000000000000010, 0x800000010000D7B0);
  v0[2] = v3;
  v4 = swift_allocObject(&unk_100010BD8, 32, 7);
  v0[10] = v4;
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v1;
  v5 = async function pointer to FinanceXPCConnection.execute<A>(_:)[1];
  swift_retain(v1);
  v6 = (_QWORD *)swift_task_alloc(v5);
  v0[11] = v6;
  v7 = sub_100004890(&qword_1000153E8);
  v8 = sub_100006C30();
  *v6 = v0;
  v6[1] = sub_100006024;
  return FinanceXPCConnection.execute<A>(_:)(v8, sub_100006BF0, v4, v7, (char *)&type metadata for () + 8, v8);
}

uint64_t sub_100006024()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 88);
  *(_QWORD *)(*v1 + 96) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = sub_1000060D4;
  }
  else
  {
    swift_release(*(_QWORD *)(v2 + 80));
    v4 = sub_100006090;
  }
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_100006090()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 72);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 64) + 8))(v1, *(_QWORD *)(v0 + 56));
  swift_task_dealloc(v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1000060D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 96);
  swift_release(*(_QWORD *)(v0 + 80));
  swift_errorRetain(v1);
  v2 = swift_errorRetain(v1);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = *(_QWORD *)(v0 + 96);
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v6 = 138412290;
    swift_errorRetain(v5);
    v8 = _swift_stdlib_bridgeErrorToNSError(v5);
    *(_QWORD *)(v0 + 24) = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v6 + 4, v6 + 12);
    *v7 = v8;
    swift_errorRelease(v5);
    swift_errorRelease(v5);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "electAccountsUI XPC error: %@", v6, 0xCu);
    v9 = sub_100004890(&qword_1000153F8);
    swift_arrayDestroy(v7, 1, v9);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

    swift_errorRelease(v5);
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 96);
    swift_errorRelease(v10);
    swift_errorRelease(v10);
    swift_errorRelease(v10);

  }
  v11 = *(_QWORD *)(v0 + 72);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 64) + 8))(v11, *(_QWORD *)(v0 + 56));
  swift_task_dealloc(v11);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ClientToServiceXPCConnection<>.updated(accountSelectionResult:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v16;

  v3 = sub_100004890(&qword_1000153B8);
  __chkstk_darwin(v3);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for AccountSelectionResult(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  __chkstk_darwin(v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v9 = *(unsigned __int8 *)(v7 + 80);
  v10 = (v9 + 16) & ~v9;
  v11 = swift_allocObject(&unk_100010A98, v10 + v8, v9 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v11 + v10, (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v5, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100010AC0, 56, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = v1;
  v13[5] = sub_10000649C;
  v13[6] = v11;
  swift_retain(v1);
  swift_retain(v11);
  v14 = sub_10000A7BC((uint64_t)v5, (uint64_t)&unk_1000153C8, (uint64_t)v13);
  swift_release(v11);
  return swift_release(v14);
}

void sub_1000063F4(void *a1)
{
  id v2;

  v2 = (id)AccountSelectionResult.xpcValue.getter();
  objc_msgSend(a1, "updated:", v2);

}

uint64_t sub_10000643C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for AccountSelectionResult(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_10000649C(void *a1)
{
  id v2;

  type metadata accessor for AccountSelectionResult(0);
  v2 = (id)AccountSelectionResult.xpcValue.getter();
  objc_msgSend(a1, "updated:", v2);

}

uint64_t sub_100006500(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc(dword_1000153C4);
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_100006C7C;
  return sub_100005EC0(a1, v4, v5, v6, v7, v8);
}

uint64_t ClientToServiceXPCConnection<>.cancelled()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t ObjectType;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD v23[4];

  v1 = v0;
  v2 = sub_100004890(&qword_1000153B8);
  __chkstk_darwin(v2);
  v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for TaskPriority(0);
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  v7 = (_QWORD *)swift_allocObject(&unk_100010AE8, 56, 7);
  v7[2] = 0;
  v8 = v7 + 2;
  v7[3] = 0;
  v7[4] = v1;
  v7[5] = sub_100006758;
  v7[6] = 0;
  v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  v10 = swift_retain(v1);
  if (v9 == 1)
  {
    sub_100006768((uint64_t)v4);
    v11 = 0;
    v12 = 0;
    v13 = 7168;
  }
  else
  {
    v14 = TaskPriority.rawValue.getter(v10);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    v13 = v14 | 0x1C00;
    v15 = *v8;
    if (*v8)
    {
      v16 = v7[3];
      ObjectType = swift_getObjectType(*v8);
      swift_unknownObjectRetain(v15);
      v11 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v16);
      v12 = v18;
      swift_unknownObjectRelease(v15);
    }
    else
    {
      v11 = 0;
      v12 = 0;
    }
  }
  v19 = swift_allocObject(&unk_100010B10, 32, 7);
  *(_QWORD *)(v19 + 16) = &unk_1000153D0;
  *(_QWORD *)(v19 + 24) = v7;
  if (v12 | v11)
  {
    v23[0] = 0;
    v23[1] = 0;
    v20 = v23;
    v23[2] = v11;
    v23[3] = v12;
  }
  else
  {
    v20 = 0;
  }
  v21 = swift_task_create(v13, v20, (char *)&type metadata for () + 8, &unk_1000153D8, v19);
  return swift_release(v21);
}

{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t ObjectType;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD v23[4];

  v1 = v0;
  v2 = sub_100004890(&qword_1000153B8);
  __chkstk_darwin(v2);
  v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for TaskPriority(0);
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  v7 = (_QWORD *)swift_allocObject(&unk_100011148, 56, 7);
  v7[2] = 0;
  v8 = v7 + 2;
  v7[3] = 0;
  v7[4] = v1;
  v7[5] = sub_100006758;
  v7[6] = 0;
  v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  v10 = swift_retain(v1);
  if (v9 == 1)
  {
    sub_100006768((uint64_t)v4);
    v11 = 0;
    v12 = 0;
    v13 = 7168;
  }
  else
  {
    v14 = TaskPriority.rawValue.getter(v10);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    v13 = v14 | 0x1C00;
    v15 = *v8;
    if (*v8)
    {
      v16 = v7[3];
      ObjectType = swift_getObjectType(*v8);
      swift_unknownObjectRetain(v15);
      v11 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v16);
      v12 = v18;
      swift_unknownObjectRelease(v15);
    }
    else
    {
      v11 = 0;
      v12 = 0;
    }
  }
  v19 = swift_allocObject(&unk_100011170, 32, 7);
  *(_QWORD *)(v19 + 16) = &unk_100015460;
  *(_QWORD *)(v19 + 24) = v7;
  if (v12 | v11)
  {
    v23[0] = 0;
    v23[1] = 0;
    v20 = v23;
    v23[2] = v11;
    v23[3] = v12;
  }
  else
  {
    v20 = 0;
  }
  v21 = swift_task_create(v13, v20, (char *)&type metadata for () + 8, &unk_1000153D8, v19);
  return swift_release(v21);
}

id sub_100006758(void *a1)
{
  return objc_msgSend(a1, "cancelled");
}

uint64_t sub_100006768(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100004890(&qword_1000153B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ClientToServiceXPCConnection<>.failed(with:completion:)(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  uint64_t v17;

  v4 = v3;
  v8 = sub_100004890(&qword_1000153B8);
  __chkstk_darwin(v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (_QWORD *)swift_allocObject(&unk_100010B38, 48, 7);
  v11[2] = a1;
  v11[3] = a2;
  v11[4] = a3;
  v11[5] = v4;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_100010B60, 56, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = v4;
  v13[5] = sub_100006AF4;
  v13[6] = v11;
  swift_retain_n(v4, 2);
  v14 = a1;
  sub_100006BB8(a2, a3);
  swift_retain(v11);
  v15 = sub_10000A7BC((uint64_t)v10, (uint64_t)&unk_1000153E0, (uint64_t)v13);
  swift_release(v11);
  return swift_release(v15);
}

id sub_1000068E0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id result;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[5];
  uint64_t v13;

  result = objc_msgSend(a1, "failedWith:", a2);
  if (a3)
  {
    v7 = swift_retain(a4);
    v8 = (void *)ClientToServiceXPCConnection.connection.getter(v7);
    v9 = swift_allocObject(&unk_100010B88, 32, 7);
    *(_QWORD *)(v9 + 16) = a3;
    *(_QWORD *)(v9 + 24) = a4;
    v12[4] = sub_1000052BC;
    v13 = v9;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 1107296256;
    v12[2] = sub_10000A900;
    v12[3] = &unk_100010BA0;
    v10 = _Block_copy(v12);
    v11 = v13;
    swift_retain(a4);
    swift_release(v11);
    objc_msgSend(v8, "scheduleSendBarrierBlock:", v10);
    _Block_release(v10);

    return (id)sub_100006BE0(a3, a4);
  }
  return result;
}

uint64_t sub_1000069DC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100006A00(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_1000155A4);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100006A70;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000155A0 + dword_1000155A0))(a1, v4);
}

uint64_t sub_100006A70()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_100006AB8()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 24))
    swift_release(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

id sub_100006AF4(void *a1)
{
  uint64_t *v1;

  return sub_1000068E0(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100006B04()
{
  _QWORD *v0;

  swift_unknownObjectRelease(v0[2]);
  swift_release(v0[4]);
  swift_release(v0[6]);
  return swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100006B38(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc(dword_1000153C4);
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_100006A70;
  return sub_100005EC0(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_100006BB8(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_retain(a2);
  return result;
}

uint64_t sub_100006BC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100006BD8(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100006BE0(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

uint64_t sub_100006BF0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(_QWORD))(v1 + 16))(*a1);
  v2 = sub_100004890(&qword_100015400);
  return CheckedContinuation.resume(returning:)(v2, v2);
}

unint64_t sub_100006C30()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000153F0;
  if (!qword_1000153F0)
  {
    v1 = sub_100004988(&qword_1000153E8);
    result = swift_getWitnessTable(&protocol conformance descriptor for ClientToServiceXPCConnection<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1000153F0);
  }
  return result;
}

void sub_100006D78()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v1 = v0;
  v2 = type metadata accessor for DeviceType(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!objc_msgSend(v1, "isViewLoaded"))
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000053, 0x800000010000D970, "FinanceUIService/ImportRemoteViewController.swift", 49, 2, 39, 0);
LABEL_11:
    __break(1u);
    return;
  }
  v6 = *(void **)&v1[OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_controllerState];
  if (v6 == (void *)1)
    return;
  if (!v6)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000050, 0x800000010000D9D0, "FinanceUIService/ImportRemoteViewController.swift", 49, 2, 46, 0);
    goto LABEL_11;
  }
  v7 = v6;
  v8 = static DeviceInfo.deviceType.getter();
  v9 = DeviceType.isiPad.getter(v8);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if ((v9 & 1) != 0)
    v10 = 2;
  else
    v10 = 0;
  objc_msgSend(v7, "setModalPresentationStyle:", v10);
  objc_msgSend(v1, "presentViewController:animated:completion:", v7, 1, 0);
  sub_100008504(v6);
}

void sub_100006F18(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
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
  char *v19;
  uint64_t (*v20)(char *, _QWORD, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  unint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char v33;
  unint64_t v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  const char *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  _QWORD v52[5];
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD v58[5];
  __int128 v59;
  __int128 v60;

  v4 = v3;
  v8 = sub_100004890(&qword_1000153B8);
  __chkstk_darwin(v8);
  v52[1] = (char *)v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for Logger(0, v10);
  v52[3] = *(_QWORD *)(v11 - 8);
  v52[4] = v11;
  __chkstk_darwin(v11);
  v52[2] = (char *)v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for SaveOrderUIInfoKeys(0);
  v14 = *(_QWORD *)(v13 - 8);
  v15 = __chkstk_darwin(v13);
  v17 = (char *)v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v19 = (char *)v52 - v18;
  objc_msgSend(a2, "setSwipeDismissalStyle:", 0);
  v55 = (uint64_t)a2;
  objc_msgSend(a2, "setLaunchingInterfaceOrientation:", 1);
  if (a1)
  {
    v20 = *(uint64_t (**)(char *, _QWORD, uint64_t))(v14 + 104);
    v21 = v20(v19, enum case for SaveOrderUIInfoKeys.data(_:), v13);
    v22 = SaveOrderUIInfoKeys.rawValue.getter(v21);
    v24 = v23;
    v25 = *(void (**)(char *, uint64_t))(v14 + 8);
    v25(v19, v13);
    v56 = v22;
    v57 = v24;
    AnyHashable.init<A>(_:)(v58, &v56, &type metadata for String, &protocol witness table for String);
    if (*(_QWORD *)(a1 + 16) && (v26 = sub_100009EA8((uint64_t)v58), (v27 & 1) != 0))
    {
      sub_100008654(*(_QWORD *)(a1 + 56) + 32 * v26, (uint64_t)&v59);
    }
    else
    {
      v59 = 0u;
      v60 = 0u;
    }
    sub_100008514((uint64_t)v58);
    if (*((_QWORD *)&v60 + 1))
    {
      if ((swift_dynamicCast(&v56, &v59, (char *)&type metadata for Any + 8, &type metadata for Data, 6) & 1) != 0)
      {
        v53 = v57;
        v54 = v56;
        v28 = v20(v17, enum case for SaveOrderUIInfoKeys.sourceApplication(_:), v13);
        v29 = SaveOrderUIInfoKeys.rawValue.getter(v28);
        v31 = v30;
        v25(v17, v13);
        *(_QWORD *)&v59 = v29;
        *((_QWORD *)&v59 + 1) = v31;
        AnyHashable.init<A>(_:)(v58, &v59, &type metadata for String, &protocol witness table for String);
        if (*(_QWORD *)(a1 + 16) && (v32 = sub_100009EA8((uint64_t)v58), (v33 & 1) != 0))
        {
          sub_100008654(*(_QWORD *)(a1 + 56) + 32 * v32, (uint64_t)&v59);
        }
        else
        {
          v59 = 0u;
          v60 = 0u;
        }
        v34 = v53;
        sub_100008514((uint64_t)v58);
        if (*((_QWORD *)&v60 + 1))
        {
          v35 = swift_dynamicCast(&v56, &v59, (char *)&type metadata for Any + 8, &type metadata for String, 6);
          if (v35)
            v36 = v56;
          else
            v36 = 0;
          if (v35)
            v37 = v57;
          else
            v37 = 0;
          if (a3)
            goto LABEL_20;
        }
        else
        {
          sub_100004A50((uint64_t)&v59);
          v36 = 0;
          v37 = 0;
          if (a3)
          {
LABEL_20:
            v38 = sub_100004890(&qword_1000153A0);
            v39 = type metadata accessor for XPCEntitlementChecker(0);
            swift_allocObject(v39, *(unsigned int *)(v39 + 48), *(unsigned __int16 *)(v39 + 52));
            v40 = a3;
            v41 = XPCEntitlementChecker.init()();
            v58[3] = v39;
            v58[4] = &protocol witness table for XPCEntitlementChecker;
            v58[0] = v41;
            v42 = sub_100005E1C();
            FinanceXPCConnection.init(endpoint:entitlementChecker:)(&v59, v40, v58, v38, v42);
            v43 = v59;
            v58[0] = v59;
            FinanceXPCConnection.resume()();
            v44 = *(_QWORD *)(v4 + OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_daemonConnection);
            *(_QWORD *)(v4 + OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_daemonConnection) = v43;
            swift_retain(v43);
            swift_release(v44);
            v45 = v54;
            v48 = (void *)sub_100007694(v54, v34, v36, v37, v55, v43);
            swift_bridgeObjectRelease(v37);
            v49 = *(void **)(v4 + OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_controllerState);
            *(_QWORD *)(v4 + OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_controllerState) = v48;
            v50 = v48;
            sub_100008504(v49);
            swift_release(v43);

            sub_100008610(v45, v34);
            return;
          }
        }
        v46 = 0xD000000000000035;
        v51 = 83;
        v47 = "ImportRemoteViewController - XPC endpoint was missing";
        goto LABEL_26;
      }
    }
    else
    {
      sub_100004A50((uint64_t)&v59);
    }
    v46 = 0xD000000000000033;
    v51 = 77;
    v47 = "ImportRemoteViewController - order data was missing";
LABEL_26:
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v46, (unint64_t)(v47 - 32) | 0x8000000000000000, "FinanceUIService/ImportRemoteViewController.swift", 49, 2, v51, 0);
    goto LABEL_27;
  }
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000031, 0x800000010000D8B0, "FinanceUIService/ImportRemoteViewController.swift", 49, 2, 73, 0);
LABEL_27:
  __break(1u);
}

uint64_t sub_100007694(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, char *, uint64_t);
  char *v26;
  uint64_t v27;
  char *v28;
  void (*v29)(char *, uint64_t);
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v7 = v6;
  v33 = a5;
  v34 = a3;
  v12 = type metadata accessor for OrderImportPreview(0);
  v32 = *(_QWORD *)(v12 - 8);
  v13 = __chkstk_darwin(v12);
  v31 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __chkstk_darwin(v13);
  v17 = (char *)&v31 - v16;
  __chkstk_darwin(v15);
  v19 = (char *)&v31 - v18;
  v20 = swift_allocObject(&unk_100010CC8, 24, 7);
  swift_unknownObjectWeakInit(v20 + 16, v7);
  v21 = swift_allocObject(&unk_100010CF0, 32, 7);
  *(_QWORD *)(v21 + 16) = v20;
  *(_QWORD *)(v21 + 24) = a6;
  v22 = type metadata accessor for DeviceInfo(0);
  sub_1000087AC(a1, a2);
  swift_bridgeObjectRetain(a4);
  swift_retain(a6);
  v23 = v35;
  OrderImportPreview.init(orderData:deviceInfo:sourceApplication:completion:)(a1, a2, v22, &protocol witness table for DeviceInfo, v34, a4, sub_1000087A4, v21);
  if (!v23)
  {
    v24 = v32;
    v25 = *(void (**)(char *, char *, uint64_t))(v32 + 16);
    v25(v17, v19, v12);
    v26 = (char *)objc_allocWithZone((Class)sub_100004890(qword_100015470));
    v27 = v33;
    *(_QWORD *)&v26[*(_QWORD *)(qword_100015BB0 + (swift_isaMask & *(_QWORD *)v26) + 16)] = v33;
    v28 = v31;
    v25(v31, v17, v12);
    swift_unknownObjectRetain(v27);
    a1 = UIHostingController.init(rootView:)(v28);
    v29 = *(void (**)(char *, uint64_t))(v24 + 8);
    v29(v17, v12);
    v29(v19, v12);
  }
  return a1;
}

void sub_1000078B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t Strong;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BYTE v12[24];

  v5 = a2 + 16;
  swift_beginAccess(a2 + 16, v12, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v5);
  if (Strong)
  {
    v7 = (void *)Strong;
    sub_100007988(a1, a3);

  }
  swift_beginAccess(v5, &v11, 0, 0);
  v8 = swift_unknownObjectWeakLoadStrong(v5);
  if (v8)
  {
    v9 = (void *)v8;
    v10 = *(void **)(v8 + OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_controllerState);
    sub_1000087F0(v10);

    if ((unint64_t)v10 >= 2)
      objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, 0);
    sub_100008504(v10);
  }
}

uint64_t sub_100007988(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
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
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  void *v41;
  _QWORD *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t (*v50)(char *, uint64_t, uint64_t);
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  char *v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;

  v62 = a2;
  v4 = sub_100004890(&qword_1000153B8);
  __chkstk_darwin(v4);
  v61 = (char *)&v60 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for Logger(0, v6);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = __chkstk_darwin(v7);
  v60 = (char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v60 - v12;
  v14 = __chkstk_darwin(v11);
  v16 = (char *)&v60 - v15;
  __chkstk_darwin(v14);
  v18 = (char *)&v60 - v17;
  v19 = type metadata accessor for OrderImportPreview.ImportResult(0);
  v20 = *(_QWORD *)(v19 - 8);
  __chkstk_darwin(v19);
  v22 = (uint64_t *)((char *)&v60 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v20 + 16))(v22, a1, v19);
  v23 = (*(uint64_t (**)(uint64_t *, uint64_t))(v20 + 88))(v22, v19);
  if (v23 == enum case for OrderImportPreview.ImportResult.error(_:))
  {
    (*(void (**)(uint64_t *, uint64_t))(v20 + 96))(v22, v19);
    v24 = *v22;
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v13, v2 + OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_log, v7);
    swift_errorRetain(v24);
    v25 = swift_errorRetain(v24);
    v26 = Logger.logObject.getter(v25);
    v27 = static os_log_type_t.default.getter();
    v28 = v8;
    if (os_log_type_enabled(v26, v27))
    {
      v60 = (char *)v7;
      v29 = v8;
      v30 = (uint8_t *)swift_slowAlloc(12, -1);
      v31 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v30 = 138412290;
      swift_errorRetain(v24);
      v32 = _swift_stdlib_bridgeErrorToNSError(v24);
      v63 = v32;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v63, &v64, v30 + 4, v30 + 12);
      *v31 = v32;
      v28 = v29;
      v7 = (uint64_t)v60;
      swift_errorRelease(v24);
      swift_errorRelease(v24);
      _os_log_impl((void *)&_mh_execute_header, v26, v27, "ImportRemoteViewController - Error: %@", v30, 0xCu);
      v33 = sub_100004890(&qword_1000153F8);
      swift_arrayDestroy(v31, 1, v33);
      swift_slowDealloc(v31, -1, -1);
      swift_slowDealloc(v30, -1, -1);
    }
    else
    {
      swift_errorRelease(v24);
      swift_errorRelease(v24);
    }

    (*(void (**)(char *, uint64_t))(v28 + 8))(v13, v7);
    v41 = (void *)_convertErrorToNSError(_:)(v24);
    v42 = (_QWORD *)swift_allocObject(&unk_100010C78, 48, 7);
    v42[2] = v41;
    v42[3] = 0;
    v43 = v62;
    v42[4] = 0;
    v42[5] = v43;
    v44 = type metadata accessor for TaskPriority(0);
    v45 = (uint64_t)v61;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v44 - 8) + 56))(v61, 1, 1, v44);
    v46 = (_QWORD *)swift_allocObject(&unk_100010CA0, 56, 7);
    v46[2] = 0;
    v46[3] = 0;
    v46[4] = v43;
    v46[5] = sub_100008800;
    v46[6] = v42;
    swift_retain_n(v43, 2);
    v47 = v41;
    swift_retain(v42);
    v48 = sub_10000A7BC(v45, (uint64_t)&unk_100015468, (uint64_t)v46);

    swift_release(v42);
    swift_release(v48);
    return swift_errorRelease(v24);
  }
  else
  {
    v34 = v7;
    if (v23 == enum case for OrderImportPreview.ImportResult.cancelled(_:))
    {
      v35 = v8;
      v36 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 16))(v16, v2 + OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_log, v7);
      v37 = Logger.logObject.getter(v36);
      v38 = static os_log_type_t.default.getter();
      if (os_log_type_enabled(v37, v38))
      {
        v39 = (uint8_t *)swift_slowAlloc(2, -1);
        *(_WORD *)v39 = 0;
        _os_log_impl((void *)&_mh_execute_header, v37, v38, "ImportRemoteViewController - User cancelled add", v39, 2u);
        swift_slowDealloc(v39, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v35 + 8))(v16, v34);
      return ClientToServiceXPCConnection<>.cancelled()();
    }
    else
    {
      v49 = v2 + OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_log;
      v50 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 16);
      if (v23 == enum case for OrderImportPreview.ImportResult.orderAdded(_:))
      {
        v51 = v50(v18, v49, v7);
        v52 = Logger.logObject.getter(v51);
        v53 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v52, v53))
        {
          v54 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v54 = 0;
          _os_log_impl((void *)&_mh_execute_header, v52, v53, "ImportRemoteViewController - Successfully added order", v54, 2u);
          swift_slowDealloc(v54, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v8 + 8))(v18, v34);
        return ClientToServiceXPCConnection<>.added()();
      }
      else
      {
        v55 = v60;
        v56 = v50(v60, v49, v7);
        v57 = Logger.logObject.getter(v56);
        v58 = static os_log_type_t.default.getter();
        if (os_log_type_enabled(v57, v58))
        {
          v59 = (uint8_t *)swift_slowAlloc(2, -1);
          *(_WORD *)v59 = 0;
          _os_log_impl((void *)&_mh_execute_header, v57, v58, "ImportRemoteViewController - Unknown result type", v59, 2u);
          swift_slowDealloc(v59, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v8 + 8))(v55, v34);
        ClientToServiceXPCConnection<>.cancelled()();
        return (*(uint64_t (**)(uint64_t *, uint64_t))(v20 + 8))(v22, v19);
      }
    }
  }
}

uint64_t sub_100008028(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = v2 + OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_log;
  v4 = type metadata accessor for Logger(0, a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_100008504(*(id *)(v2 + OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_controllerState));
  return swift_release(*(_QWORD *)(v2 + OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_daemonConnection));
}

id sub_100008084()
{
  char *v0;
  objc_super v2;
  uint64_t v3;

  if (*(_QWORD *)&v0[OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_daemonConnection])
  {
    v3 = *(_QWORD *)&v0[OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_daemonConnection];
    sub_100004890(&qword_1000153A0);
    sub_100005E1C();
    FinanceXPCConnection.invalidate()();
  }
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ImportRemoteViewController(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000081F0()
{
  return type metadata accessor for ImportRemoteViewController(0);
}

uint64_t type metadata accessor for ImportRemoteViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_100015450;
  if (!qword_100015450)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for ImportRemoteViewController);
  return result;
}

id sub_100008234(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  char *v6;
  NSString v7;
  id v8;
  objc_super v10;

  v6 = v3;
  Logger.init(subsystem:category:)(0xD000000000000014, 0x800000010000D570, 0xD000000000000010, 0x800000010000D060);
  *(_QWORD *)&v6[OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_controllerState] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_daemonConnection] = 0;

  if (a2)
  {
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v7 = 0;
  }
  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for ImportRemoteViewController(0);
  v8 = objc_msgSendSuper2(&v10, "initWithNibName:bundle:", v7, a3);

  return v8;
}

id sub_100008390(void *a1)
{
  void *v1;
  char *v3;
  id v4;
  objc_super v6;

  v3 = v1;
  Logger.init(subsystem:category:)(0xD000000000000014, 0x800000010000D570, 0xD000000000000010, 0x800000010000D060);
  *(_QWORD *)&v3[OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_controllerState] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16FinanceUIService26ImportRemoteViewController_daemonConnection] = 0;

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for ImportRemoteViewController(0);
  v4 = objc_msgSendSuper2(&v6, "initWithCoder:", a1);

  return v4;
}

uint64_t sub_100008478(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v4;
  _QWORD v5[4];

  result = type metadata accessor for Logger(319, a2);
  if (v4 <= 0x3F)
  {
    v5[0] = *(_QWORD *)(result - 8) + 64;
    v5[1] = (char *)&value witness table for () + 64;
    v5[2] = "\b";
    v5[3] = &unk_10000D0D8;
    result = swift_updateClassMetadata2(a1, 256, 4, v5, a1 + 128);
    if (!result)
      return 0;
  }
  return result;
}

void sub_100008504(id a1)
{
  if ((unint64_t)a1 >= 2)

}

uint64_t sub_100008514(uint64_t a1)
{
  (*(void (**)(void))(*(&type metadata for AnyHashable - 1) + 8))();
  return a1;
}

uint64_t sub_100008548()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

id sub_10000856C()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), "deactivate");
}

void sub_100008580(void *a1)
{
  uint64_t *v1;

  sub_10000AFC4(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_100008590(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc(dword_10001559C);
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_100006C7C;
  return sub_10000AC40(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_100008610(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100008654(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100008694()
{
  _QWORD *v0;

  swift_errorRelease(v0[2]);
  if (v0[3])
    swift_release(v0[4]);
  swift_release(v0[5]);
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_1000086D4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc(dword_10001559C);
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_100006A70;
  return sub_10000AC40(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_100008754()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100008778()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_1000087A4(uint64_t a1)
{
  uint64_t v1;

  sub_1000078B8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1000087AC(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

id sub_1000087F0(id result)
{
  if ((unint64_t)result >= 2)
    return result;
  return result;
}

uint64_t sub_100008808()
{
  const char *v1;

  v1 = "\b";
  return swift_initClassMetadata2();
}

void sub_100008854(uint64_t a1, uint64_t a2, void *a3)
{
  sub_100008A88(a3);
}

id sub_10000889C(char a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v6;
  objc_super v8;

  v6 = (objc_class *)type metadata accessor for RemoteHostingController(0, *(_QWORD *)((swift_isaMask & *v4) + qword_100015BB0), *(_QWORD *)((swift_isaMask & *v4) + qword_100015BB0 + 8), a4);
  v8.receiver = v4;
  v8.super_class = v6;
  objc_msgSendSuper2(&v8, "viewDidDisappear:", a1 & 1);
  return objc_msgSend(*(id *)((char *)v4 + *(_QWORD *)(qword_100015BB0 + (swift_isaMask & *v4) + 16)), "deactivate");
}

void sub_100008934(void *a1, uint64_t a2, char a3)
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v6 = a1;
  sub_10000889C(a3, (uint64_t)v6, v4, v5);

}

void sub_100008974()
{
  _swift_stdlib_reportUnimplementedInitializer("FinanceUIService.RemoteHostingController", 40, "init(rootView:)", 15, 0);
  __break(1u);
}

void sub_1000089A0()
{
  _swift_stdlib_reportUnimplementedInitializer("FinanceUIService.RemoteHostingController", 40, "init(coder:rootView:)", 21, 0);
  __break(1u);
}

uint64_t sub_1000089CC()
{
  _QWORD *v0;

  return swift_unknownObjectRelease(*(_QWORD *)((char *)v0 + *(_QWORD *)(qword_100015BB0 + (swift_isaMask & *v0) + 16)));
}

id sub_1000089F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for RemoteHostingController(0, *(_QWORD *)((swift_isaMask & *v4) + qword_100015BB0), *(_QWORD *)((swift_isaMask & *v4) + qword_100015BB0 + 8), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, "dealloc");
}

uint64_t sub_100008A50(_QWORD *a1)
{
  return swift_unknownObjectRelease(*(_QWORD *)((char *)a1 + *(_QWORD *)(qword_100015BB0 + (swift_isaMask & *a1) + 16)));
}

uint64_t type metadata accessor for RemoteHostingController(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100008AE4(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for RemoteHostingController);
}

void sub_100008A88(void *a1)
{

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001CLL, 0x800000010000DB10, "FinanceUIService/RemoteHostingController.swift", 46, 2, 25, 0);
  __break(1u);
}

uint64_t sub_100008AE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return swift_getGenericMetadata(a1, v6, a5);
}

BOOL AccountSelectionUIError.Code.init(rawValue:)(uint64_t a1)
{
  return a1 != 0;
}

uint64_t AccountSelectionUIError.errorCode.getter()
{
  return 0;
}

uint64_t static AccountSelectionUIError.__derived_enum_equals(_:_:)()
{
  return 1;
}

Swift::Int AccountSelectionUIError.hashValue.getter()
{
  _QWORD v1[9];

  Hasher.init(_seed:)(v1, 0);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

void AccountSelectionUIError.hash(into:)()
{
  Hasher._combine(_:)(0);
}

Swift::Int sub_100008B90(uint64_t a1)
{
  _QWORD v2[9];

  Hasher.init(_seed:)(v2, a1);
  Hasher._combine(_:)(0);
  return Hasher._finalize()();
}

_QWORD *sub_100008BCC@<X0>(_QWORD *result@<X0>, BOOL *a2@<X8>)
{
  *a2 = *result != 0;
  return result;
}

void sub_100008BE0(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

unint64_t static AccountSelectionUIError.errorDomain.getter()
{
  return 0xD000000000000014;
}

unint64_t AccountSelectionUIError.failureReason.getter()
{
  return 0xD000000000000032;
}

uint64_t sub_100008C24(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000A3E8();
  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100008C4C(uint64_t a1)
{
  unint64_t v2;

  v2 = sub_10000A3E8();
  return Error<>._code.getter(a1, v2);
}

void sub_100008C88(char a1)
{
  char *v1;
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SelectAccountsViewController(0);
  objc_msgSendSuper2(&v5, "viewWillAppear:", a1 & 1);
  if (!objc_msgSend(v1, "isViewLoaded"))
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000055, 0x800000010000DD20, "FinanceUIService/SelectAccountsViewController.swift", 51, 2, 79, 0);
LABEL_8:
    __break(1u);
    return;
  }
  v3 = *(void **)&v1[OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_controllerState];
  if (v3 == (void *)1)
    return;
  if (!v3)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000052, 0x800000010000DD80, "FinanceUIService/SelectAccountsViewController.swift", 51, 2, 86, 0);
    goto LABEL_8;
  }
  v4 = v3;
  objc_msgSend(v4, "setModalPresentationStyle:", 0);
  objc_msgSend(v1, "presentViewController:animated:completion:", v4, 1, 0);
  sub_100008504(v3);
}

void sub_100008E98(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  unint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[5];
  __int128 v40;
  __int128 v41;

  v4 = v3;
  v8 = type metadata accessor for SelectAccountsUIInfoKeys(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(a2, "setSwipeDismissalStyle:", 0);
  objc_msgSend(a2, "setStatusBarHidden:withDuration:", 1, 0.3);
  objc_msgSend(a2, "setDismissalAnimationStyle:", 2);
  if (!a3)
  {
LABEL_12:
    v33 = 0xD000000000000037;
    v35 = 110;
    v34 = "SelectAccountsViewController - XPC endpoint was missing";
LABEL_16:
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, v33, (unint64_t)(v34 - 32) | 0x8000000000000000, "FinanceUIService/SelectAccountsViewController.swift", 51, 2, v35, 0);
    goto LABEL_17;
  }
  if (a1)
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, enum case for SelectAccountsUIInfoKeys.sourceApplication(_:), v8);
    v12 = a3;
    v13 = SelectAccountsUIInfoKeys.rawValue.getter();
    v15 = v14;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    v37 = v13;
    v38 = v15;
    AnyHashable.init<A>(_:)(v39, &v37, &type metadata for String, &protocol witness table for String);
    if (*(_QWORD *)(a1 + 16) && (v16 = sub_100009EA8((uint64_t)v39), (v17 & 1) != 0))
    {
      sub_100008654(*(_QWORD *)(a1 + 56) + 32 * v16, (uint64_t)&v40);
    }
    else
    {
      v40 = 0u;
      v41 = 0u;
    }
    sub_100008514((uint64_t)v39);
    if (*((_QWORD *)&v41 + 1))
    {
      if ((swift_dynamicCast(&v37, &v40, (char *)&type metadata for Any + 8, &type metadata for String, 6) & 1) != 0)
      {
        v19 = v37;
        v18 = v38;
        v20 = objc_allocWithZone((Class)LSApplicationRecord);
        swift_bridgeObjectRetain(v18);
        v21 = sub_100009DD0(v19, v18, 0);
        swift_bridgeObjectRelease(v18);
        v22 = sub_100004890(&qword_1000153E8);
        v23 = type metadata accessor for XPCEntitlementChecker(0);
        swift_allocObject(v23, *(unsigned int *)(v23 + 48), *(unsigned __int16 *)(v23 + 52));
        v24 = v12;
        v25 = v21;
        v26 = XPCEntitlementChecker.init()();
        v39[3] = v23;
        v39[4] = &protocol witness table for XPCEntitlementChecker;
        v39[0] = v26;
        v27 = sub_100006C30();
        FinanceXPCConnection.init(endpoint:entitlementChecker:)(&v40, v24, v39, v22, v27);
        v28 = v40;
        v39[0] = v40;
        FinanceXPCConnection.resume()();
        v29 = *(_QWORD *)(v4 + OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_daemonConnection);
        *(_QWORD *)(v4 + OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_daemonConnection) = v28;
        swift_retain(v28);
        swift_release(v29);
        if (v25)
        {
          v30 = (void *)sub_1000092F8(v25, (uint64_t)a2, v28);

          v31 = *(void **)(v4 + OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_controllerState);
          *(_QWORD *)(v4 + OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_controllerState) = v30;
          v32 = v30;
          sub_100008504(v31);
          swift_release(v28);

          return;
        }
        __break(1u);
        goto LABEL_12;
      }
    }
    else
    {
      sub_100004A50((uint64_t)&v40);
    }
    v33 = 0xD00000000000003DLL;
    v35 = 119;
    v34 = "SelectAccountsViewController - source application was missing";
    goto LABEL_16;
  }
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000033, 0x800000010000DC60, "FinanceUIService/SelectAccountsViewController.swift", 51, 2, 114, 0);
LABEL_17:
  __break(1u);
}

uint64_t sub_1000092F8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void (*v21)(char *, char *, uint64_t);
  _QWORD *v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t);
  uint64_t v26;

  v4 = v3;
  v8 = type metadata accessor for SelectAccountsView(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = __chkstk_darwin(v8);
  v12 = (char *)&v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __chkstk_darwin(v10);
  v15 = (char *)&v26 - v14;
  __chkstk_darwin(v13);
  v17 = (char *)&v26 - v16;
  v18 = swift_allocObject(&unk_100010F20, 24, 7);
  swift_unknownObjectWeakInit(v18 + 16, v4);
  v19 = swift_allocObject(&unk_100010F48, 32, 7);
  *(_QWORD *)(v19 + 16) = a3;
  *(_QWORD *)(v19 + 24) = v18;
  v20 = a1;
  swift_retain(a3);
  SelectAccountsView.init(applicationRecord:completion:)(v20, sub_10000A300, v19);
  v21 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v21(v15, v17, v8);
  v22 = objc_allocWithZone((Class)sub_100004890(&qword_100015568));
  *(_QWORD *)((char *)v22 + *(_QWORD *)(qword_100015BB0 + (swift_isaMask & *v22) + 16)) = a2;
  v21(v12, v15, v8);
  swift_unknownObjectRetain(a2);
  v23 = UIHostingController.init(rootView:)(v12);
  v24 = *(void (**)(char *, uint64_t))(v9 + 8);
  v24(v15, v8);
  v24(v17, v8);
  return v23;
}

void sub_1000094B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  _QWORD *v38;
  uint64_t v39;
  _QWORD *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t Strong;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  char v54[24];

  v52 = a2;
  v5 = sub_100004890(&qword_1000153B8);
  __chkstk_darwin(v5);
  v51 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48 = type metadata accessor for AccountSelectionResult(0);
  v7 = *(_QWORD *)(v48 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = __chkstk_darwin(v48);
  v10 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  v12 = (char *)&v47 - v11;
  v13 = type metadata accessor for AccountSelectionValues(0);
  v49 = *(_QWORD *)(v13 - 8);
  v50 = v13;
  __chkstk_darwin(v13);
  v15 = (char *)&v47 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = type metadata accessor for SelectAccountsResult(0);
  v17 = *(_QWORD *)(v16 - 8);
  __chkstk_darwin(v16);
  v19 = (char *)&v47 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v53 = a3 + 16;
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, a1, v16);
  v20 = (*(uint64_t (**)(char *, uint64_t))(v17 + 88))(v19, v16);
  if (v20 == enum case for SelectAccountsResult.updated(_:))
  {
    (*(void (**)(char *, uint64_t))(v17 + 96))(v19, v16);
    v22 = v49;
    v21 = v50;
    (*(void (**)(char *, char *, uint64_t))(v49 + 32))(v15, v19, v50);
    v23 = v15;
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v12, v15, v21);
    v24 = v48;
    (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v12, enum case for AccountSelectionResult.values(_:), v48);
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v24);
    v25 = *(unsigned __int8 *)(v7 + 80);
    v26 = (v25 + 16) & ~v25;
    v27 = swift_allocObject(&unk_100010FC0, v26 + v8, v25 | 7);
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v27 + v26, v10, v24);
    v28 = type metadata accessor for TaskPriority(0);
    v29 = (uint64_t)v51;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v51, 1, 1, v28);
    v30 = (_QWORD *)swift_allocObject(&unk_100010FE8, 56, 7);
    v30[2] = 0;
    v30[3] = 0;
    v31 = v52;
    v30[4] = v52;
    v30[5] = sub_10000A3A8;
    v30[6] = v27;
    swift_retain(v31);
    swift_retain(v27);
    v32 = sub_10000A7BC(v29, (uint64_t)&unk_100015570, (uint64_t)v30);
    swift_release(v27);
    swift_release(v32);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v24);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v21);
  }
  else
  {
    v34 = (uint64_t)v51;
    v33 = v52;
    if (v20 == enum case for SelectAccountsResult.cancelled(_:))
    {
      ClientToServiceXPCConnection<>.cancelled()();
    }
    else
    {
      v35 = sub_10000A054();
      v36 = swift_allocError(&type metadata for AccountSelectionUIError, v35, 0, 0);
      v37 = (void *)_convertErrorToNSError(_:)(v36);
      v38 = (_QWORD *)swift_allocObject(&unk_100010F70, 48, 7);
      v38[2] = v37;
      v38[3] = 0;
      v38[4] = 0;
      v38[5] = v33;
      v39 = type metadata accessor for TaskPriority(0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v34, 1, 1, v39);
      v40 = (_QWORD *)swift_allocObject(&unk_100010F98, 56, 7);
      v40[2] = 0;
      v40[3] = 0;
      v40[4] = v33;
      v40[5] = sub_100006AF4;
      v40[6] = v38;
      swift_retain_n(v33, 2);
      v41 = v37;
      swift_retain(v38);
      v42 = sub_10000A7BC(v34, (uint64_t)&unk_1000153C8, (uint64_t)v40);

      swift_release(v38);
      swift_release(v42);
      swift_errorRelease(v36);
      (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    }
  }
  v43 = v53;
  swift_beginAccess(v53, v54, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v43);
  if (Strong)
  {
    v45 = (void *)Strong;
    v46 = *(void **)(Strong + OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_controllerState);
    sub_1000087F0(v46);

    if ((unint64_t)v46 >= 2)
      objc_msgSend(v46, "dismissViewControllerAnimated:completion:", 1, 0);
    sub_100008504(v46);
  }
}

uint64_t sub_1000099C4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = v2 + OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_log;
  v4 = type metadata accessor for Logger(0, a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_100008504(*(id *)(v2 + OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_controllerState));
  return swift_release(*(_QWORD *)(v2 + OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_daemonConnection));
}

id sub_100009A20()
{
  char *v0;
  objc_super v2;
  uint64_t v3;

  if (*(_QWORD *)&v0[OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_daemonConnection])
  {
    v3 = *(_QWORD *)&v0[OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_daemonConnection];
    sub_100004890(&qword_1000153E8);
    sub_100006C30();
    FinanceXPCConnection.invalidate()();
  }
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SelectAccountsViewController(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_100009B8C(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  char *v6;
  NSString v7;
  id v8;
  objc_super v10;

  v6 = v3;
  Logger.init(subsystem:category:)(0xD000000000000014, 0x800000010000D570, 0xD000000000000010, 0x800000010000D320);
  *(_QWORD *)&v6[OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_controllerState] = 0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_daemonConnection] = 0;

  if (a2)
  {
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v7 = 0;
  }
  v10.receiver = v6;
  v10.super_class = (Class)type metadata accessor for SelectAccountsViewController(0);
  v8 = objc_msgSendSuper2(&v10, "initWithNibName:bundle:", v7, a3);

  return v8;
}

id sub_100009CE8(void *a1)
{
  void *v1;
  char *v3;
  id v4;
  objc_super v6;

  v3 = v1;
  Logger.init(subsystem:category:)(0xD000000000000014, 0x800000010000D570, 0xD000000000000010, 0x800000010000D320);
  *(_QWORD *)&v3[OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_controllerState] = 0;
  *(_QWORD *)&v3[OBJC_IVAR____TtC16FinanceUIService28SelectAccountsViewController_daemonConnection] = 0;

  v6.receiver = v3;
  v6.super_class = (Class)type metadata accessor for SelectAccountsViewController(0);
  v4 = objc_msgSendSuper2(&v6, "initWithCoder:", a1);

  return v4;
}

id sub_100009DD0(uint64_t a1, uint64_t a2, char a3)
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

unint64_t sub_100009EA8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  Swift::Int v4;

  v2 = v1;
  v4 = AnyHashable._rawHashValue(seed:)(*(_QWORD *)(v2 + 40));
  return sub_100009ED8(a1, v4);
}

unint64_t sub_100009ED8(uint64_t a1, uint64_t a2)
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
      sub_10000A274(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = static AnyHashable.== infix(_:_:)(v9, a1);
      sub_100008514((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t _s16FinanceUIService23AccountSelectionUIErrorO16errorDescriptionSSSgvg_0()
{
  return 0x20636972656E6547;
}

unint64_t sub_100009FC4()
{
  unint64_t result;

  result = qword_1000154F8;
  if (!qword_1000154F8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for AccountSelectionUIError.Code, &type metadata for AccountSelectionUIError.Code);
    atomic_store(result, (unint64_t *)&qword_1000154F8);
  }
  return result;
}

unint64_t sub_10000A00C()
{
  unint64_t result;

  result = qword_100015500;
  if (!qword_100015500)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for AccountSelectionUIError, &type metadata for AccountSelectionUIError);
    atomic_store(result, (unint64_t *)&qword_100015500);
  }
  return result;
}

unint64_t sub_10000A054()
{
  unint64_t result;

  result = qword_100015508;
  if (!qword_100015508)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for AccountSelectionUIError, &type metadata for AccountSelectionUIError);
    atomic_store(result, (unint64_t *)&qword_100015508);
  }
  return result;
}

uint64_t sub_10000A0A8()
{
  return 0;
}

ValueMetadata *type metadata accessor for AccountSelectionUIError()
{
  return &type metadata for AccountSelectionUIError;
}

uint64_t _s16FinanceUIService23AccountSelectionUIErrorOwet_0(unsigned int *a1, int a2)
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

uint64_t _s16FinanceUIService23AccountSelectionUIErrorOwst_0(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_10000A154 + 4 * byte_10000D160[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_10000A174 + 4 * byte_10000D165[v4]))();
}

_BYTE *sub_10000A154(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_10000A174(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10000A17C(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10000A184(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_10000A18C(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_10000A194(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for AccountSelectionUIError.Code()
{
  return &type metadata for AccountSelectionUIError.Code;
}

uint64_t sub_10000A1B0()
{
  return type metadata accessor for SelectAccountsViewController(0);
}

uint64_t type metadata accessor for SelectAccountsViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_100015550;
  if (!qword_100015550)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for SelectAccountsViewController);
  return result;
}

uint64_t sub_10000A1F4(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v4;
  _QWORD v5[3];

  result = type metadata accessor for Logger(319, a2);
  if (v4 <= 0x3F)
  {
    v5[0] = *(_QWORD *)(result - 8) + 64;
    v5[1] = "\b";
    v5[2] = &unk_10000D3B8;
    result = swift_updateClassMetadata2(a1, 256, 3, v5, a1 + 128);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_10000A274(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for AnyHashable - 1) + 16))(a2, a1);
  return a2;
}

uint64_t sub_10000A2B0()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000A2D4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 16));
  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

void sub_10000A300(uint64_t a1)
{
  uint64_t v1;

  sub_1000094B8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_10000A308()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 24))
    swift_release(*(_QWORD *)(v0 + 32));
  swift_release(*(_QWORD *)(v0 + 40));
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000A348()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = type metadata accessor for AccountSelectionResult(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

void sub_10000A3A8(void *a1)
{
  type metadata accessor for AccountSelectionResult(0);
  sub_1000063F4(a1);
}

unint64_t sub_10000A3E8()
{
  unint64_t result;

  result = qword_100015578;
  if (!qword_100015578)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for AccountSelectionUIError, &type metadata for AccountSelectionUIError);
    atomic_store(result, (unint64_t *)&qword_100015578);
  }
  return result;
}

uint64_t sub_10000A42C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  unint64_t v4;
  uint64_t v6;

  v0 = sub_100004890(&qword_100015588);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  WindowGroup.init(id:title:lazyContent:)(0, 0, 0, 0, 0, 0, nullsub_1, 0, &type metadata for EmptyView, &protocol witness table for EmptyView);
  v4 = sub_10000A594();
  static SceneBuilder.buildBlock<A>(_:)(v3, v0, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  sub_10000A530();
  static App.main()();
  return 0;
}

unint64_t sub_10000A530()
{
  unint64_t result;

  result = qword_100015580;
  if (!qword_100015580)
  {
    result = swift_getWitnessTable(&unk_10000D3F4, &type metadata for FinanceUIServiceApp);
    atomic_store(result, (unint64_t *)&qword_100015580);
  }
  return result;
}

ValueMetadata *type metadata accessor for FinanceUIServiceApp()
{
  return &type metadata for FinanceUIServiceApp;
}

uint64_t sub_10000A584(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_10000E92C, 1);
}

unint64_t sub_10000A594()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100015590;
  if (!qword_100015590)
  {
    v1 = sub_100004988(&qword_100015588);
    result = swift_getWitnessTable(&protocol conformance descriptor for WindowGroup<A>, v1);
    atomic_store(result, &qword_100015590);
  }
  return result;
}

uint64_t sub_10000A7BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t ObjectType;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD v20[4];

  v6 = type metadata accessor for TaskPriority(0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6);
  if ((_DWORD)v8 == 1)
  {
    sub_100006768(a1);
    v9 = 7168;
    v10 = *(_QWORD *)(a3 + 16);
    if (v10)
    {
LABEL_3:
      v11 = *(_QWORD *)(a3 + 24);
      ObjectType = swift_getObjectType(v10);
      swift_unknownObjectRetain(v10);
      v13 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v11);
      v15 = v14;
      swift_unknownObjectRelease(v10);
      goto LABEL_6;
    }
  }
  else
  {
    v16 = TaskPriority.rawValue.getter(v8);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    v9 = v16 | 0x1C00;
    v10 = *(_QWORD *)(a3 + 16);
    if (v10)
      goto LABEL_3;
  }
  v13 = 0;
  v15 = 0;
LABEL_6:
  v17 = swift_allocObject(&unk_1000112B0, 32, 7);
  *(_QWORD *)(v17 + 16) = a2;
  *(_QWORD *)(v17 + 24) = a3;
  if (v15 | v13)
  {
    v20[0] = 0;
    v20[1] = 0;
    v18 = v20;
    v20[2] = v13;
    v20[3] = v15;
  }
  else
  {
    v18 = 0;
  }
  return swift_task_create(v9, v18, (char *)&type metadata for () + 8, &unk_1000155C8, v17);
}

uint64_t sub_10000A900(uint64_t a1)
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

uint64_t ClientToServiceXPCConnection<>.failed(with:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v16;

  v4 = v3;
  v8 = sub_100004890(&qword_1000153B8);
  __chkstk_darwin(v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (_QWORD *)swift_allocObject(&unk_100011198, 48, 7);
  v11[2] = a1;
  v11[3] = a2;
  v11[4] = a3;
  v11[5] = v4;
  v12 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v10, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject(&unk_1000111C0, 56, 7);
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = v4;
  v13[5] = sub_100008580;
  v13[6] = v11;
  swift_retain_n(v4, 2);
  swift_errorRetain(a1);
  sub_100006BB8(a2, a3);
  swift_retain(v11);
  v14 = sub_10000A7BC((uint64_t)v10, (uint64_t)&unk_1000155A8, (uint64_t)v13);
  swift_release(v11);
  return swift_release(v14);
}

uint64_t ClientToServiceXPCConnection<>.added()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t ObjectType;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD v23[4];

  v1 = v0;
  v2 = sub_100004890(&qword_1000153B8);
  __chkstk_darwin(v2);
  v4 = (char *)v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for TaskPriority(0);
  v6 = *(_QWORD *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  v7 = (_QWORD *)swift_allocObject(&unk_1000111E8, 56, 7);
  v7[2] = 0;
  v8 = v7 + 2;
  v7[3] = 0;
  v7[4] = v1;
  v7[5] = sub_10000AFB4;
  v7[6] = 0;
  v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  v10 = swift_retain(v1);
  if (v9 == 1)
  {
    sub_100006768((uint64_t)v4);
    v11 = 0;
    v12 = 0;
    v13 = 7168;
  }
  else
  {
    v14 = TaskPriority.rawValue.getter(v10);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    v13 = v14 | 0x1C00;
    v15 = *v8;
    if (*v8)
    {
      v16 = v7[3];
      ObjectType = swift_getObjectType(*v8);
      swift_unknownObjectRetain(v15);
      v11 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType, v16);
      v12 = v18;
      swift_unknownObjectRelease(v15);
    }
    else
    {
      v11 = 0;
      v12 = 0;
    }
  }
  v19 = swift_allocObject(&unk_100011210, 32, 7);
  *(_QWORD *)(v19 + 16) = &unk_1000155B0;
  *(_QWORD *)(v19 + 24) = v7;
  if (v12 | v11)
  {
    v23[0] = 0;
    v23[1] = 0;
    v20 = v23;
    v23[2] = v11;
    v23[3] = v12;
  }
  else
  {
    v20 = 0;
  }
  v21 = swift_task_create(v13, v20, (char *)&type metadata for () + 8, &unk_1000155B8, v19);
  return swift_release(v21);
}

uint64_t sub_10000AC40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  v7 = type metadata accessor for Logger(0, a2);
  v6[7] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v6[8] = v8;
  v6[9] = swift_task_alloc((*(_QWORD *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  return swift_task_switch(sub_10000ACA4, 0, 0);
}

uint64_t sub_10000ACA4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;

  v2 = v0[5];
  v1 = v0[6];
  v3 = v0[4];
  Logger.init(subsystem:category:)(0xD000000000000014, 0x800000010000D570, 0xD000000000000010, 0x800000010000D7B0);
  v0[2] = v3;
  v4 = swift_allocObject(&unk_100011288, 32, 7);
  v0[10] = v4;
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v1;
  v5 = async function pointer to FinanceXPCConnection.execute<A>(_:)[1];
  swift_retain(v1);
  v6 = (_QWORD *)swift_task_alloc(v5);
  v0[11] = v6;
  v7 = sub_100004890(&qword_1000153A0);
  v8 = sub_100005E1C();
  *v6 = v0;
  v6[1] = sub_10000ADA4;
  return FinanceXPCConnection.execute<A>(_:)(v8, sub_100006BF0, v4, v7, (char *)&type metadata for () + 8, v8);
}

uint64_t sub_10000ADA4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)();

  v2 = *v1;
  v3 = *(_QWORD *)(*v1 + 88);
  *(_QWORD *)(*v1 + 96) = v0;
  swift_task_dealloc(v3);
  if (v0)
  {
    v4 = sub_10000AE10;
  }
  else
  {
    swift_release(*(_QWORD *)(v2 + 80));
    v4 = sub_100006090;
  }
  return swift_task_switch(v4, 0, 0);
}

uint64_t sub_10000AE10()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint8_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 96);
  swift_release(*(_QWORD *)(v0 + 80));
  swift_errorRetain(v1);
  v2 = swift_errorRetain(v1);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = *(_QWORD *)(v0 + 96);
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = (uint64_t *)swift_slowAlloc(8, -1);
    *(_DWORD *)v6 = 138412290;
    swift_errorRetain(v5);
    v8 = _swift_stdlib_bridgeErrorToNSError(v5);
    *(_QWORD *)(v0 + 24) = v8;
    UnsafeMutableRawBufferPointer.copyMemory(from:)(v0 + 24, v0 + 32, v6 + 4, v6 + 12);
    *v7 = v8;
    swift_errorRelease(v5);
    swift_errorRelease(v5);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "SaveOrderUI XPC error: %@", v6, 0xCu);
    v9 = sub_100004890(&qword_1000153F8);
    swift_arrayDestroy(v7, 1, v9);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

    swift_errorRelease(v5);
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 96);
    swift_errorRelease(v10);
    swift_errorRelease(v10);
    swift_errorRelease(v10);

  }
  v11 = *(_QWORD *)(v0 + 72);
  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 64) + 8))(v11, *(_QWORD *)(v0 + 56));
  swift_task_dealloc(v11);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_10000AFB4(void *a1)
{
  return objc_msgSend(a1, "added");
}

void sub_10000AFC4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD aBlock[5];
  uint64_t v23;

  v8 = type metadata accessor for FinanceError(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  aBlock[0] = a2;
  swift_errorRetain(a2);
  v12 = sub_100004890(&qword_100015560);
  if (swift_dynamicCast(v11, aBlock, v12, v8, 6))
  {
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    v13 = (void *)_convertErrorToNSError(_:)(a2);
  }
  else
  {
    v14 = sub_10000B2C8();
    v15 = swift_allocError(v8, v14, 0, 0);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v9 + 104))(v16, enum case for FinanceError.unknown(_:), v8);
    v13 = (void *)_convertErrorToNSError(_:)(v15);
    swift_errorRelease(v15);
  }
  objc_msgSend(a1, "failedWith:", v13);

  if (a3)
  {
    v17 = swift_retain(a4);
    v18 = (void *)ClientToServiceXPCConnection.connection.getter(v17);
    v19 = swift_allocObject(&unk_100011238, 32, 7);
    *(_QWORD *)(v19 + 16) = a3;
    *(_QWORD *)(v19 + 24) = a4;
    aBlock[4] = sub_1000052BC;
    v23 = v19;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000A900;
    aBlock[3] = &unk_100011250;
    v20 = _Block_copy(aBlock);
    v21 = v23;
    swift_retain(a4);
    swift_release(v21);
    objc_msgSend(v18, "scheduleSendBarrierBlock:", v20);
    _Block_release(v20);

    sub_100006BE0(a3, a4);
  }
}

uint64_t sub_10000B1B0(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc(a2[1]);
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_10000B214;
  return v6(a1);
}

uint64_t sub_10000B214()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc(*(_QWORD *)(*v0 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_10000B260()
{
  _QWORD *v0;

  swift_errorRelease(v0[2]);
  if (v0[3])
    swift_release(v0[4]);
  swift_release(v0[5]);
  return swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10000B2A4()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

unint64_t sub_10000B2C8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000155C0;
  if (!qword_1000155C0)
  {
    v1 = type metadata accessor for FinanceError(255);
    result = swift_getWitnessTable(&protocol conformance descriptor for FinanceError, v1);
    atomic_store(result, (unint64_t *)&qword_1000155C0);
  }
  return result;
}

uint64_t sub_10000B310(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000B320(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000B328(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc(dword_1000155A4);
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_100006C7C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1000155A0 + dword_1000155A0))(a1, v4);
}

_QWORD *initializeBufferWithCopyOfBuffer for HostingControllerState(_QWORD *a1, void **a2)
{
  void *v3;
  id v4;

  v3 = *a2;
  if ((unint64_t)*a2 >= 0xFFFFFFFF)
    v4 = v3;
  *a1 = v3;
  return a1;
}

void destroy for HostingControllerState(void **a1)
{
  void *v1;

  v1 = *a1;
  if ((unint64_t)v1 >= 0xFFFFFFFF)

}

void **assignWithCopy for HostingControllerState(void **a1, void **a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *a1;
  v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF)
  {
    if ((unint64_t)v4 >= 0xFFFFFFFF)
    {
      *a1 = v4;
      v6 = v4;
      return a1;
    }
LABEL_7:
    *a1 = v4;
    return a1;
  }
  if ((unint64_t)v4 < 0xFFFFFFFF)
  {

    v4 = *a2;
    goto LABEL_7;
  }
  *a1 = v4;
  v5 = v4;

  return a1;
}

_QWORD *initializeWithTake for HostingControllerState(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **assignWithTake for HostingControllerState(void **a1, unint64_t *a2)
{
  void *v3;
  unint64_t v4;

  v3 = *a1;
  v4 = *a2;
  if ((unint64_t)*a1 < 0xFFFFFFFF)
    goto LABEL_6;
  if (v4 < 0xFFFFFFFF)
  {

LABEL_6:
    *a1 = (void *)v4;
    return a1;
  }
  *a1 = (void *)v4;

  return a1;
}

uint64_t getEnumTagSinglePayload for HostingControllerState(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFE && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 2147483646);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 1;
  if (v4 >= 3)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for HostingControllerState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 2147483646;
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFE)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 1;
  }
  return result;
}

uint64_t sub_10000B594(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_10000B5AC(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for HostingControllerState()
{
  return &type metadata for HostingControllerState;
}

void sub_10000B5E0(void *a1, void (*a2)(uint64_t), uint64_t a3)
{
  char *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;
  void *v20;
  uint64_t v21;
  char *v22;
  id v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  id v36;
  void *v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t, void *);
  id v40;
  void (*v41)(uint64_t);
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  _QWORD aBlock[5];
  uint64_t v51;

  v4 = v3;
  v44 = a3;
  v45 = a2;
  v46 = a1;
  v5 = type metadata accessor for Logger(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v44 - v10;
  v12 = &v4[OBJC_IVAR____TtC16FinanceUIService27FinanceRemoteViewController_log];
  v13 = *(uint64_t (**)(char *, char *, uint64_t))(v6 + 16);
  v14 = v13((char *)&v44 - v10, &v4[OBJC_IVAR____TtC16FinanceUIService27FinanceRemoteViewController_log], v5);
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Configuring view in FinanceUIService", v17, 2u);
    swift_slowDealloc(v17, -1, -1);
  }

  v18 = *(void (**)(char *, uint64_t))(v6 + 8);
  v18(v11, v5);
  v19 = swift_allocObject(&unk_100011408, 24, 7);
  *(_QWORD *)(v19 + 16) = v4;
  aBlock[4] = sub_10000C4B4;
  v51 = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000BA18;
  aBlock[3] = &unk_100011420;
  v20 = _Block_copy(aBlock);
  v21 = v51;
  v22 = v4;
  swift_release(v21);
  v23 = objc_msgSend(v22, "_remoteViewControllerProxyWithErrorHandler:", v20);
  _Block_release(v20);
  if (v23)
  {
    _bridgeAnyObjectToAny(_:)(&v48, v23);
    swift_unknownObjectRelease(v23);
  }
  else
  {
    v48 = 0u;
    v49 = 0u;
  }
  sub_100004A08((uint64_t)&v48, (uint64_t)aBlock);
  sub_10000C46C((uint64_t)aBlock, (uint64_t)&v48);
  if (*((_QWORD *)&v49 + 1))
  {
    v24 = sub_100004890(&qword_100015610);
    if ((swift_dynamicCast(&v47, &v48, (char *)&type metadata for Any + 8, v24, 6) & 1) != 0)
    {
      v25 = v46;
      if (v46)
      {
        v26 = v47;
        v27 = objc_msgSend(v46, "xpcEndpoint");
        if (v27)
        {
          v28 = v27;
          v29 = objc_msgSend(objc_allocWithZone((Class)NSXPCListenerEndpoint), "init");
          v30 = v29;
          if (v29)
          {
            v31 = v29;
            objc_msgSend(v31, "_setEndpoint:", v28);

          }
          swift_unknownObjectRelease(v28);
        }
        else
        {
          v30 = 0;
        }
        v36 = objc_msgSend(v25, "userInfo", v44);
        if (v36)
        {
          v37 = v36;
          v38 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(v36, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);

        }
        else
        {
          v38 = 0;
        }
        v39 = *(void (**)(uint64_t, uint64_t, void *))((swift_isaMask & *(_QWORD *)v22) + 0x70);
        v40 = v30;
        v39(v38, v26, v30);

        swift_bridgeObjectRelease(v38);
        v41 = v45;
        if (v45)
        {
          v42 = v44;
          v43 = swift_retain(v44);
          v41(v43);
          swift_unknownObjectRelease(v26);
          sub_100006BE0((uint64_t)v41, v42);
          sub_100004A50((uint64_t)aBlock);

        }
        else
        {
          sub_100004A50((uint64_t)aBlock);

          swift_unknownObjectRelease(v26);
        }
      }
      else
      {
        __break(1u);
      }
      return;
    }
  }
  else
  {
    sub_100004A50((uint64_t)&v48);
  }
  v32 = v13(v9, v12, v5);
  v33 = Logger.logObject.getter(v32);
  v34 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v33, v34))
  {
    v35 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v35 = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "Could not create remote ViewController configuration proxy", v35, 2u);
    swift_slowDealloc(v35, -1, -1);
  }

  v18(v9, v5);
  sub_100004A50((uint64_t)aBlock);
}

void sub_10000BA18(uint64_t a1, void *a2)
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

id sub_10000BB1C(void *a1, void (*a2)(uint64_t), uint64_t a3)
{
  char *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t (*v13)(char *, char *, uint64_t);
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  void (*v18)(char *, uint64_t);
  uint64_t v19;
  void *v20;
  uint64_t v21;
  char *v22;
  id v23;
  uint64_t v24;
  id result;
  uint64_t v26;
  void (*v27)(uint64_t);
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  _QWORD aBlock[5];
  uint64_t v41;

  v4 = v3;
  v34 = a3;
  v35 = a2;
  v36 = a1;
  v5 = type metadata accessor for Logger(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v11 = (char *)&v34 - v10;
  v12 = &v4[OBJC_IVAR____TtC16FinanceUIService27FinanceRemoteViewController_log];
  v13 = *(uint64_t (**)(char *, char *, uint64_t))(v6 + 16);
  v14 = v13((char *)&v34 - v10, &v4[OBJC_IVAR____TtC16FinanceUIService27FinanceRemoteViewController_log], v5);
  v15 = Logger.logObject.getter(v14);
  v16 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Activating view in FinanceUIService", v17, 2u);
    swift_slowDealloc(v17, -1, -1);
  }

  v18 = *(void (**)(char *, uint64_t))(v6 + 8);
  v18(v11, v5);
  v19 = swift_allocObject(&unk_100011390, 24, 7);
  *(_QWORD *)(v19 + 16) = v4;
  aBlock[4] = sub_10000C434;
  v41 = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000BA18;
  aBlock[3] = &unk_1000113A8;
  v20 = _Block_copy(aBlock);
  v21 = v41;
  v22 = v4;
  swift_release(v21);
  v23 = objc_msgSend(v22, "_remoteViewControllerProxyWithErrorHandler:", v20);
  _Block_release(v20);
  if (v23)
  {
    _bridgeAnyObjectToAny(_:)(&v38, v23);
    swift_unknownObjectRelease(v23);
  }
  else
  {
    v38 = 0u;
    v39 = 0u;
  }
  sub_100004A08((uint64_t)&v38, (uint64_t)aBlock);
  sub_10000C46C((uint64_t)aBlock, (uint64_t)&v38);
  if (!*((_QWORD *)&v39 + 1))
  {
    sub_100004A50((uint64_t)&v38);
    goto LABEL_12;
  }
  v24 = sub_100004890(&qword_100015610);
  if (!swift_dynamicCast(&v37, &v38, (char *)&type metadata for Any + 8, v24, 6))
  {
LABEL_12:
    v30 = v13(v9, v12, v5);
    v31 = Logger.logObject.getter(v30);
    v32 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v33 = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Could not create remote ViewController activation proxy", v33, 2u);
      swift_slowDealloc(v33, -1, -1);
    }

    v18(v9, v5);
    return (id)sub_100004A50((uint64_t)aBlock);
  }
  result = v36;
  if (!v36)
  {
    __break(1u);
    return result;
  }
  v26 = v37;

  v27 = v35;
  if (!v35)
  {
    sub_100004A50((uint64_t)aBlock);
    return (id)swift_unknownObjectRelease(v26);
  }
  v28 = v34;
  v29 = swift_retain(v34);
  v27(v29);
  swift_unknownObjectRelease(v26);
  sub_100006BE0((uint64_t)v27, v28);
  return (id)sub_100004A50((uint64_t)aBlock);
}

uint64_t sub_10000BE6C(uint64_t a1, uint64_t a2, const char *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;

  v6 = type metadata accessor for Logger(0, a2);
  v7 = *(_QWORD *)(v6 - 8);
  result = __chkstk_darwin(v6);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, a2 + OBJC_IVAR____TtC16FinanceUIService27FinanceRemoteViewController_log, v6);
    swift_errorRetain(a1);
    swift_errorRetain(a1);
    v11 = swift_errorRetain(a1);
    v12 = Logger.logObject.getter(v11);
    v13 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v20 = a3;
      v14 = (uint8_t *)swift_slowAlloc(12, -1);
      v19 = (uint64_t *)swift_slowAlloc(8, -1);
      *(_DWORD *)v14 = 138412290;
      swift_errorRetain(a1);
      v15 = _swift_stdlib_bridgeErrorToNSError(a1);
      v21 = v15;
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v21, &v22, v14 + 4, v14 + 12);
      v16 = v19;
      *v19 = v15;
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, v20, v14, 0xCu);
      v17 = sub_100004890(&qword_1000153F8);
      swift_arrayDestroy(v16, 1, v17);
      swift_slowDealloc(v16, -1, -1);
      swift_slowDealloc(v14, -1, -1);

      swift_errorRelease(a1);
    }
    else
    {
      swift_errorRelease(a1);
      swift_errorRelease(a1);
      swift_errorRelease(a1);

    }
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  return result;
}

id sub_10000C2C0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FinanceRemoteViewController(0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10000C330()
{
  return type metadata accessor for FinanceRemoteViewController(0);
}

uint64_t type metadata accessor for FinanceRemoteViewController(uint64_t a1)
{
  uint64_t result;

  result = qword_100015600;
  if (!qword_100015600)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for FinanceRemoteViewController);
  return result;
}

uint64_t sub_10000C374(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v4;
  uint64_t v5;

  result = type metadata accessor for Logger(319, a2);
  if (v4 <= 0x3F)
  {
    v5 = *(_QWORD *)(result - 8) + 64;
    result = swift_updateClassMetadata2(a1, 256, 1, &v5, a1 + 80);
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_10000C3E0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000C404()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_10000C410()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000C434(uint64_t a1)
{
  uint64_t v1;

  return sub_10000BE6C(a1, *(_QWORD *)(v1 + 16), "Remote ViewController activation proxy error: %@");
}

uint64_t sub_10000C454(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000C464(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000C46C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100004890(&qword_1000152F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000C4B4(uint64_t a1)
{
  uint64_t v1;

  return sub_10000BE6C(a1, *(_QWORD *)(v1 + 16), "Remote ViewController configuration proxy error: %@");
}

uint64_t sub_10000C4E8()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC16FinanceUIServiceP33_CB568AF5FE0BEB46F03ED2D0241BCDE019ResourceBundleClass);
}
